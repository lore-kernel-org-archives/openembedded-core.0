Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 258EE6B2D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 01:52:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6J1qHxB025808
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 18:52:17 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 18 Jul 2013 18:52:16 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Jul 2013 09:52:26 +0800
Message-ID: <cd2a145faed0704ce9561a54a46a2d153d10071c.1374198646.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1374198646.git.Qi.Chen@windriver.com>
References: <cover.1374198646.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH V7 2/2] extrausers.bbclass: add a new bbclass
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
X-List-Received-Date: Fri, 19 Jul 2013 01:52:16 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This class is dedicated to image level user/group configuration.
It inherits useradd_base.bbclass.

Users need to inherit this class in their layers or local.conf to
make the setting of EXTRA_USERS_PARAMS effective.

For detailed configuration format of EXTRA_USERS_PARAMS, please
refer to local.conf.sample.extended.

[YOCTO #4074]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/extrausers.bbclass |   61 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 meta/classes/extrausers.bbclass

diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bbclass
new file mode 100644
index 0000000..8670a2a
--- /dev/null
+++ b/meta/classes/extrausers.bbclass
@@ -0,0 +1,61 @@
+# This bbclass is mainly used for image level user/group configuration.
+# Inherit this class if you want to make EXTRA_USERS_PARAMS effective.
+
+# Below is an example showing how to use this functionality.
+# INHERIT += "extrausers"
+# EXTRA_USERS_PARAMS = "\
+# useradd -p '' tester; \
+# groupadd developers; \
+# userdel nobody; \
+# groupdel -g video; \
+# groupmod -g 1020 developers; \
+# usermod -s /bin/sh tester; \
+# "
+
+
+inherit useradd_base
+
+IMAGE_INSTALL_append = " ${@['', 'base-passwd shadow'][bool(d.getVar('EXTRA_USERS_PARAMS', True))]}"
+
+# Image level user / group settings
+ROOTFS_POSTPROCESS_COMMAND_append = " set_user_group;"
+
+# Image level user / group settings
+set_user_group () {
+	user_group_settings="${EXTRA_USERS_PARAMS}"
+	export PSEUDO="${FAKEROOTENV} ${STAGING_DIR_NATIVE}${bindir}/pseudo"
+	setting=`echo $user_group_settings | cut -d ';' -f1`
+	remaining=`echo $user_group_settings | cut -d ';' -f2-`
+	while test "x$setting" != "x"; do
+		cmd=`echo $setting | cut -d ' ' -f1`
+		opts=`echo $setting | cut -d ' ' -f2-`
+		# Different from useradd.bbclass, there's no file locking issue here, as
+		# this setting is actually a serial process. So we only retry once.
+		case $cmd in
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
+				bbfatal "Invalid command in EXTRA_USERS_PARAMS: $cmd"
+				;;
+		esac
+		# iterate to the next setting
+		setting=`echo $remaining | cut -d ';' -f1`
+		remaining=`echo $remaining | cut -d ';' -f2-`
+	done
+}
-- 
1.7.9.5


