Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QMkRV-0005lS-BU
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 19:21:53 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 May 2011 10:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,232,1304319600"; 
   d="scan'208";a="4095385"
Received: from unknown (HELO localhost) ([10.255.12.192])
	by fmsmga001.fm.intel.com with ESMTP; 18 May 2011 10:18:49 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 10:18:25 -0700
Message-Id: <ac637805a4eccc355d094f13b2225df9096cdb4f.1305738598.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <a1cda1da640a96baf3d45b7d4e9577b8b74efbd3.1305738598.git.dvhart@linux.intel.com>
References: <a1cda1da640a96baf3d45b7d4e9577b8b74efbd3.1305738598.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1305738598.git.dvhart@linux.intel.com>
References: <cover.1305738598.git.dvhart@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@intel.com>
Subject: [PATCH 05/15] create-pull-request: provide an RFC mode via -c argument
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
X-List-Received-Date: Wed, 18 May 2011 17:21:53 -0000

Currently it is difficult to know if a pull request is being sent for review
or just to be pulled.

Add a -c argument to add RFC to the subject prefix and a blurb requesting
review to the cover letter.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Acked-by: Joshua Lock <josh@linux.intel.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@intel.com>
Cc: Joshua Lock <josh@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
---
 scripts/create-pull-request |   24 ++++++++++++++++++++++--
 1 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 429421b..202d99d 100755
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
@@ -89,6 +94,10 @@ if [ -z "$BRANCH" ] || [ -z "$REMOTE_URL" ]; then
 	exit 1
 fi
 
+if [ $RFC -eq 1 ]; then
+	PREFIX="RFC $PREFIX"
+fi
+
 
 # Set WEB_URL from known remotes
 case "$REMOTE_URL" in
@@ -125,7 +134,7 @@ git format-patch -M --subject-prefix="$PREFIX" -n -o $ODIR --thread=shallow --co
 # Customize the cover letter
 CL="$ODIR/0000-cover-letter.patch"
 PM="$ODIR/pull-msg"
-git request-pull $RELATIVE_TO $REMOTE_URL $COMMIT_ID > "$PM"
+git request-pull $RELATIVE_TO $REMOTE_URL $COMMIT_ID >> "$PM"
 if [ $? -ne 0 ]; then
 	echo "ERROR: git request-pull reported an error"
 	exit 1
@@ -136,6 +145,17 @@ fi
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



