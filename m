Return-Path: <rbilovol@cisco.com>
X-Greylist: delayed 591 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 22 Nov 2017 11:29:56 UTC
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
	by mail.openembedded.org (Postfix) with ESMTP id BB2F360191
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 11:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=3183; q=dns/txt; s=iport;
	t=1511350198; x=1512559798;
	h=from:to:cc:subject:date:message-id;
	bh=fgTPx6WZy3dmR18sLJ0tkr77vaqcmchvsZd214LICqM=;
	b=HkC7l5ue6+Ve9duBjA7f6T6CwDknRWleLCmZp8QjsxVZVBp1yHHVjYvY
	yJyg9/fmdwrt4Vr8rFiNJ8JtCZE3IU+YJVOoycFGKckT36UYkBxhR2LdB
	gMNXB8VGKMUTX008hv0P+tDhVlVpN3/3WNrp/kgqlq3aouB1fcsqtumYa Y=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CMAACwXBVa/xbLJq1bGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYQibieOHnSnGYIRCh+FHIVXGAEBAQEBAQEBAWsohh6BUYoiEKp?=
	=?us-ascii?q?dincBAQEHKBSDJoNcgWmOPgWiQIdyjRoCghSKEocjAkiVb4E6HzmBdTQhCB0Vg?=
	=?us-ascii?q?y0JglAfgWk/NosQAQEB?=
X-IronPort-AV: E=Sophos;i="5.44,436,1505779200"; 
   d="scan'208";a="362381"
Received: from aer-iport-nat.cisco.com (HELO aer-core-3.cisco.com)
	([173.38.203.22])
	by aer-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2017 11:20:06 +0000
Received: from localhost ([10.61.247.41])
	by aer-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id vAMBK58g013795;
	Wed, 22 Nov 2017 11:20:05 GMT
From: Ruslan Bilovol <rbilovol@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Nov 2017 13:20:05 +0200
Message-Id: <1511349605-22464-1-git-send-email-rbilovol@cisco.com>
X-Mailer: git-send-email 1.9.1
X-Auto-Response-Suppress: DR, OOF, AutoReply
Cc: xe-linux-external@cisco.com
Subject: [PATCH] relocate_sdk.py: remove hardcoded SDK path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Nov 2017 11:29:57 -0000

This patch removes hardcodes added to relocate_sdk.py
during SDK build, making it flexible and reusable.
Now default SDK path is passed to the script as
parameter rather then harcoded inside it.

This allows to reuse this script for multiple
relocations, and adds possibility to relocate
SDK multiple times

Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
---
 meta/classes/populate_sdk_base.bbclass |  5 -----
 meta/files/toolchain-shar-relocate.sh  |  2 +-
 scripts/relocate_sdk.py                | 17 +++++++++--------
 3 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 424c63c..e7aa5a8 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -152,11 +152,6 @@ do_populate_sdk[stamp-extra-info] = "${MACHINE}${SDKMACHINE}"
 
 fakeroot create_sdk_files() {
 	cp ${COREBASE}/scripts/relocate_sdk.py ${SDK_OUTPUT}/${SDKPATH}/
-
-	# Replace the ##DEFAULT_INSTALL_DIR## with the correct pattern.
-	# Escape special characters like '+' and '.' in the SDKPATH
-	escaped_sdkpath=$(echo ${SDKPATH} |sed -e "s:[\+\.]:\\\\\\\\\0:g")
-	sed -i -e "s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:" ${SDK_OUTPUT}/${SDKPATH}/relocate_sdk.py
 }
 
 python check_sdk_sysroots() {
diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index e3c1001..f82ff2b 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -36,7 +36,7 @@ if [ x\${PYTHON} = "x"  ]; then
 	echo "SDK could not be relocated.  No python found."
 	exit 1
 fi
-\${PYTHON} ${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir $dl_path $executable_files
+\${PYTHON} ${env_setup_script%/*}/relocate_sdk.py $DEFAULT_INSTALL_DIR $target_sdk_dir $dl_path $executable_files
 EOF
 
 $SUDO_EXEC mv $tdir/relocate_sdk.sh ${env_setup_script%/*}/relocate_sdk.sh
diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index c752fa2..0d5a6f5 100755
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -38,8 +38,6 @@ else:
     def b(x):
         return x.encode(sys.getfilesystemencoding())
 
-old_prefix = re.compile(b("##DEFAULT_INSTALL_DIR##"))
-
 def get_arch():
     f.seek(0)
     e_ident =f.read(16)
@@ -212,19 +210,22 @@ def change_dl_sysdirs(elf_file_name):
         f.write(sysdirslen)
 
 # MAIN
-if len(sys.argv) < 4:
+if len(sys.argv) < 5:
     sys.exit(-1)
 
 # In python > 3, strings may also contain Unicode characters. So, convert
 # them to bytes
 if sys.version_info < (3,):
-    new_prefix = sys.argv[1]
-    new_dl_path = sys.argv[2]
+    new_prefix = sys.argv[2]
+    new_dl_path = sys.argv[3]
 else:
-    new_prefix = sys.argv[1].encode()
-    new_dl_path = sys.argv[2].encode()
+    new_prefix = sys.argv[2].encode()
+    new_dl_path = sys.argv[3].encode()
+
+executables_list = sys.argv[4:]
 
-executables_list = sys.argv[3:]
+old_prefix_ne = b(sys.argv[1])
+old_prefix = re.compile(re.escape(old_prefix_ne));
 
 for e in executables_list:
     perms = os.stat(e)[stat.ST_MODE]
-- 
1.9.1


