Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D5AAB6A465
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 11:11:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6BBBfS3017069
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 04:11:41 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 11 Jul 2013 04:11:41 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jul 2013 19:11:39 +0800
Message-ID: <f54b840a6d0b07950b01024e511292f8e4483fad.1373540849.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1373540849.git.Qi.Chen@windriver.com>
References: <cover.1373540849.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH V3 3/3] usersettings.bbclass: add a new bbclass
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
X-List-Received-Date: Thu, 11 Jul 2013 11:11:41 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This class is dedicated to image level user/group configuration.
It inherits userbase.bbclass.

Users need to inherit this class in their layers or local.conf to
make the setting of USER_GROUP_SETTINGS effective.

For detailed configuration format of USER_GROUP_SETTINGS, please
refer to local.conf.sample.extended.

[YOCTO #4074]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/usersettings.bbclass |   48 +++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 meta/classes/usersettings.bbclass

diff --git a/meta/classes/usersettings.bbclass b/meta/classes/usersettings.bbclass
new file mode 100644
index 0000000..e5a5156
--- /dev/null
+++ b/meta/classes/usersettings.bbclass
@@ -0,0 +1,48 @@
+# This bbclass is mainly used for image level user/group configuration.
+# Inherit this class if you want to make USER_GROUP_SETTINGS effective.
+inherit userbase
+
+IMAGE_INSTALL_append += "${@['', 'base-passwd shadow'][bool(d.getVar('USER_GROUP_SETTINGS', True))]}"
+
+# Image level user / group settings
+ROOTFS_POSTPROCESS_COMMAND_append = " set_user_group;"
+
+# Image level user / group settings
+set_user_group () {
+	user_group_settings="${USER_GROUP_SETTINGS}"
+	export PSEUDO="${FAKEROOTENV} ${STAGING_DIR_NATIVE}${bindir}/pseudo"
+	setting=`echo $user_group_settings | cut -d ';' -f1`
+	remaining=`echo $user_group_settings | cut -d ';' -f2-`
+	while test "x$setting" != "x"; do
+		action=`echo $setting | cut -d ',' -f1`
+		opts=`echo $setting | cut -d ',' -f2`
+		# Different from useradd.bbclass, there's no file locking issue here, as
+		# this setting is actually a serial process. So we only retry once.
+		case $action in
+			useradd)
+				perform_useradd "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts" 1
+				;;
+			groupadd)
+				perform_groupadd "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts" 1
+				;;
+			userdel)
+				perform_userdel "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts" 1
+				;;
+			groupdel)
+				perform_groupdel "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts" 1
+				;;
+			usermod)
+				perform_usermod "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts" 1
+				;;
+			groupmod)
+				perform_groupmod "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts" 1
+				;;
+			*)
+				bbfatal "Incorrect setting for USER_GROUP_SETTINGS"
+				;;
+		esac
+		# iterate to the next setting
+		setting=`echo $remaining | cut -d ';' -f1`
+		remaining=`echo $remaining | cut -d ';' -f2-`
+	done
+}
-- 
1.7.9.5


