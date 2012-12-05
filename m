Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1TgOv3-0001zn-7J
	for Openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 01:02:25 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Dec 2012 15:47:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,224,1355126400"; d="scan'208";a="176705555"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Dec 2012 15:47:59 -0800
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org,
	yocto@yoctoproject.org
Date: Wed,  5 Dec 2012 15:47:14 -0800
Message-Id: <5dd4b0df68ba17cf9cc6892040f8ab90b66dd911.1354751008.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1354751008.git.nitin.a.kamble@intel.com>
References: <cover.1354751008.git.nitin.a.kamble@intel.com>
Subject: [Patch v2 1/1] create-pull-request: detect trailing white space
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Dec 2012 00:02:25 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Add logic in the create-pull-request to detect the trailing white space
inserted by patches.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 scripts/create-pull-request |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 9a8913d..58e7df1 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -173,7 +173,6 @@ mkdir $ODIR
 # Generate the patches and cover letter
 git format-patch -M40 --subject-prefix="$PREFIX" -n -o $ODIR --thread=shallow --cover-letter $RELATIVE_TO..$COMMIT_ID > /dev/null
 
-
 # Customize the cover letter
 CL="$ODIR/0000-cover-letter.patch"
 PM="$ODIR/pull-msg"
@@ -229,3 +228,15 @@ Review their content, especially the summary mail:
 When you are satisfied, you can send them with:
     send-pull-request -a -p $ODIR
 EOM
+
+# Check the patches for trailing white space
+echo
+egrep -nH -e "^\+.*\s+$" $ODIR/* > /dev/null
+if [ $? -ne 1 ]; then
+	echo "WARNING: Trailing white space detected at these locations"
+	egrep -nH -e "^\+.*\s+$" $ODIR/*
+else
+	echo "Note: No trailing white space is detected in these patches :)"
+fi
+
+
-- 
1.7.3.4



