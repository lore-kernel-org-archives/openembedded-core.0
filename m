Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AB63F6B40D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 07:52:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r727qvtk003384
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Aug 2013 00:52:57 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 2 Aug 2013 00:52:54 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Aug 2013 15:52:59 +0800
Message-ID: <3fd702c18d4043a7bfd600e64655dce94d0f1064.1375429844.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375429844.git.Qi.Chen@windriver.com>
References: <cover.1375429844.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 4/4] initramfs-framework: fix bashism
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
X-List-Received-Date: Fri, 02 Aug 2013 07:52:54 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../initrdscripts/initramfs-framework/finish       |    5 +++--
 .../initrdscripts/initramfs-framework/init         |   13 +++++++------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/finish b/meta/recipes-core/initrdscripts/initramfs-framework/finish
index bedd803..325f47b 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/finish
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/finish
@@ -16,8 +16,9 @@ finish_run() {
 		if [ -n "$bootparam_root" ]; then
 			debug "No e2fs compatible filesystem has been mounted, mounting $bootparam_root..."
 
-			if [ "${bootparam_root:0:5}" = "UUID=" ]; then
-				bootparam_root="/dev/disk/by-uuid/${bootparam_root/UUID=/}"
+			if [ "`echo ${bootparam_root} | cut -c1-5`" = "UUID=" ]; then
+				root_uuid=`echo $bootparam_root | cut -c6-`
+				bootparam_root="/dev/disk/by-uuid/$root_uuid"
 			fi
 
 			if [ -e "$bootparam_root" ]; then
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index 0be8f4d..20774aa 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -78,12 +78,13 @@ mount -t sysfs sysfs /sys
 
 # populate bootparam environment
 for p in `cat /proc/cmdline`; do
-	opt="${p%%=*}"
-	opt=${opt/-/_}
-	if [ "${p/=/}" = "$p" ]; then
+	opt=`echo $p | cut -d'=' -f1`
+	opt=`echo $opt | sed -e 's/-/_/'`
+	if [ "`echo $p | cut -d'=' -f1`" = "$p" ]; then
 		eval "bootparam_${opt}=true"
 	else
-		eval "bootparam_${opt}=\"${p#*=}\""
+		value="`echo $p | cut -d'=' -f2-`"
+		eval "bootparam_${opt}=\"${value}\""
 	fi
 done
 
@@ -102,7 +103,7 @@ mkdir $ROOTFS_DIR
 # Load and run modules
 for m in $MODULES_DIR/*; do
 	# Skip backup files
-	if [ "${m/\~/}" != "$m" ]; then
+	if [ "`echo $m | sed -e 's/\~$//'`" = "$m" ]; then
 		continue
 	fi
 
@@ -117,7 +118,7 @@ for m in $MODULES_DIR/*; do
 	done
 
 	# process module
-	source $m
+	. $m
 
 	if ! eval "${module}_enabled"; then
 		debug "Skipping module $module"
-- 
1.7.9.5


