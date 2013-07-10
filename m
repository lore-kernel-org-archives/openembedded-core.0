Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A5E15608CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 06:28:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6A6Srmt014054
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jul 2013 23:28:53 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 9 Jul 2013 23:28:53 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jul 2013 14:28:51 +0800
Message-ID: <d076b1371417dcdb46fddbc6dd12685148832d0c.1373437638.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1373437638.git.Qi.Chen@windriver.com>
References: <cover.1373437638.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH V2 1/1] image.bbclass: add a method to add/delete/modify user/group settings
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
X-List-Received-Date: Wed, 10 Jul 2013 06:28:53 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

We may want to add a user or group which does not logically belong to
any specific package. For example, we may want to add a user with the
name 'tester' to our image. Besides, we may want to delete or modify
user/group in our image.

This patch adds a variable, USER_GROUP_SETTINGS, which is dedicated
to these tasks. The configuration format is detailed in the local.conf.
sample.extended file.

This patch also adds a function, set_user_group, which happens at
the end of the ROOTFS_POSTPROCESS_COMMAND. It handles the settings
in the USER_GROUP_SETTINGS variable.

This logic here is quite similar to that of useradd.bbclass. If we
need to add or modify user/group settings, base-passwd and shadow
are pulled into the RDEPENDS and thus installed on target.

[YOCTO #4074]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image.bbclass |   42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 380ed8e..a76289c 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -12,6 +12,8 @@ LICENSE = "MIT"
 PACKAGES = ""
 DEPENDS += "${MLPREFIX}qemuwrapper-cross ${MLPREFIX}depmodwrapper-cross"
 RDEPENDS += "${IMAGE_INSTALL} ${LINGUAS_INSTALL} ${NORMAL_FEATURE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTALL}"
+# Add to IMAGE_INSTALL base-passwd and shadow if USER_GROUP_SETTINGS is set
+IMAGE_INSTALL_append += "${@['', 'base-passwd shadow'][bool(d.getVar('USER_GROUP_SETTINGS', True))]}"
 RRECOMMENDS += "${NORMAL_FEATURE_INSTALL_OPTIONAL}"
 
 INHIBIT_DEFAULT_DEPS = "1"
@@ -179,6 +181,8 @@ ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks"
 ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "postinst_enable_logging; ", "",d)}'
 # Set default postinst log file
 POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
+# Image level user / group settings
+ROOTFS_POSTPROCESS_COMMAND_append = " set_user_group;"
 
 # some default locales
 IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
@@ -528,6 +532,44 @@ postinst_enable_logging () {
 	echo "LOGFILE=${POSTINST_LOGFILE}" >> ${IMAGE_ROOTFS}${sysconfdir}/default/postinst
 }
 
+# Image level user / group settings
+set_user_group () {
+	user_group_settings="${USER_GROUP_SETTINGS}"
+	export PSEUDO="${FAKEROOTENV} ${STAGING_DIR_NATIVE}${bindir}/pseudo"
+	setting=`echo $user_group_settings | cut -d ';' -f1`
+	remaining=`echo $user_group_settings | cut -d ';' -f2-`
+	while test "x$setting" != "x"; do
+		user_group=`echo $setting | cut -d ',' -f1`
+		action=`echo $setting | cut -d ',' -f2`
+		opts=`echo $setting | cut -d ',' -f3`
+		# determine the command according to user_group and action
+		if [ "$user_group" = "USER" ]; then
+			cmd_prefix="user"
+		elif [ "$user_group" = "GROUP" ]; then
+			cmd_prefix="group"
+		else
+			echo "Error: invalid setting of $user_group in the USER_GROUP_SETTINGS"
+			exit 1
+		fi
+		if [ "$action" = "ADD" ]; then
+			cmd_suffix="add"
+		elif [ "$action" = "DEL" ]; then
+			cmd_suffix="del"
+		elif [ "$action" = "MOD" ]; then
+			cmd_suffix="mod"
+		else
+			echo "Error: invalid setting of $user_group in the USER_GROUP_SETTINGS"
+			exit 1
+		fi
+		cmd=$cmd_prefix$cmd_suffix
+		echo "using commond <$cmd> for setting <$setting> ..."
+		eval $PSEUDO $cmd -R ${IMAGE_ROOTFS} $opts
+		# iterate to the next setting
+		setting=`echo $remaining | cut -d ';' -f1`
+		remaining=`echo $remaining | cut -d ';' -f2-`
+	done
+}
+
 # Turn any symbolic /sbin/init link into a file
 remove_init_link () {
 	if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then
-- 
1.7.9.5


