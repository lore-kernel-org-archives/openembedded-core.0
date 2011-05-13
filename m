Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QL1y7-0002wA-Vp
	for openembedded-core@lists.openembedded.org;
	Sat, 14 May 2011 01:40:28 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 May 2011 16:37:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,367,1301900400"; d="scan'208";a="642516623"
Received: from unknown (HELO localhost) ([10.255.12.78])
	by orsmga002.jf.intel.com with ESMTP; 13 May 2011 16:37:39 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2011 16:37:39 -0700
Message-Id: <d49a6dd9bd5d71b733e33f4015d8c107671faaf8.1305329659.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1305329659.git.dvhart@linux.intel.com>
References: <cover.1305329659.git.dvhart@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@intel.com>
Subject: [RFC PATCH 05/10] create-pull-request: provide an RFC mode via -c argument
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 May 2011 23:40:28 -0000

Currently it is difficult to know if a pull request is being sent for review
or just to be pulled.

Add a -c argument to add RFC to the subject prefix and a blurb requesting
review to the cover letter.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@intel.com>
Cc: Joshua Lock <josh@linux.intel.com>
---
 scripts/create-pull-request |   24 ++++++++++++++++++++++--
 1 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 96cf04f..43a4b74 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -3,12 +3,14 @@ ODIR=pull-$$
 RELATIVE_TO="master"
 COMMIT_ID="HEAD"
 PREFIX="PATCH"
+RFC=0
 
 usage() {
 CMD=$(basename $0)
 cat <<EOM
 Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to] [-i commit_id] -u remote -b branch
   -b branch           Branch name in the specified remote
+  -c                  Create an RFC (Request for Comment) patch series
   -h                  Display this help message
   -i commit_id        Ending commit (default: HEAD)
   -m msg_body_file    The file containing a blurb to be inserted into the summary email
@@ -27,11 +29,14 @@ EOM
 }
 
 # Parse and validate arguments
-while getopts "b:hi:m:o:p:r:s:u:" OPT; do
+while getopts "b:chi:m:o:p:r:s:u:" OPT; do
 	case $OPT in
 	b)
 		BRANCH="$OPTARG"
 		;;
+	c)
+		RFC=1
+		;;
 	h)
 		usage
 		exit 0
@@ -84,6 +89,10 @@ if [ -z "$BRANCH" ] || [ -z "$REMOTE_URL" ]; then
 	exit 1
 fi
 
+if [ $RFC -eq 1 ]; then
+	PREFIX="RFC $PREFIX"
+fi
+
 
 # Set WEB_URL from known remotes
 case "$REMOTE_URL" in
@@ -120,7 +129,7 @@ git format-patch -M --subject-prefix="$PREFIX" -n -o $ODIR --thread=shallow --co
 # Customize the cover letter
 CL="$ODIR/0000-cover-letter.patch"
 PM="$ODIR/pull-msg"
-git request-pull $RELATIVE_TO $REMOTE_URL $COMMIT_ID > "$PM"
+git request-pull $RELATIVE_TO $REMOTE_URL $COMMIT_ID >> "$PM"
 if [ $? -ne 0 ]; then
 	echo "ERROR: git request-pull reported an error"
 	exit 1
@@ -131,6 +140,17 @@ fi
 sed -n "0,\#$REMOTE_URL# p" "$PM" | sed -i "/BLURB HERE/ r /dev/stdin" "$CL"
 rm "$PM"
 
+# If this is an RFC, make that clear in the cover letter
+if [ $RFC -eq 1 ]; then
+(cat <<EOM
+Please review the following changes for suitability for inclusion. If you have
+any objections or suggestions for improvement, please respond to the patches. If
+you agree with the changes, please provide your Acked-by.
+
+EOM
+) | sed -i "/BLURB HERE/ r /dev/stdin" "$CL"
+fi
+
 # Insert the WEB_URL if there is one
 if [ -n "$WEB_URL" ]; then
 	echo "  $WEB_URL" | sed -i "\#$REMOTE_URL# r /dev/stdin" "$CL"
-- 
1.7.1



