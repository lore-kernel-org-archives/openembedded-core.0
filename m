Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3D8137751C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 02:36:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5L2amSf007957
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 19:36:48 -0700
Received: from yow-rmacleod-lx3.wrs.com (128.224.56.85) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 20 Jun 2017 19:36:47 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Jun 2017 22:28:32 -0400
Message-ID: <1498012112-27453-1-git-send-email-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] systemd: work-around ppc gold linker error
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
X-List-Received-Date: Wed, 21 Jun 2017 02:36:47 -0000
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../systemd/systemd/systemd-drop-gold-use-bfd.patch           | 11 +++++++++++
 meta/recipes-core/systemd/systemd_232.bb                      |  2 ++
 2 files changed, 13 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-drop-gold-use-bfd.patch

diff --git a/meta/recipes-core/systemd/systemd/systemd-drop-gold-use-bfd.patch b/meta/recipes-core/systemd/systemd/systemd-drop-gold-use-bfd.patch
new file mode 100644
index 0000000..eac2199
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/systemd-drop-gold-use-bfd.patch
@@ -0,0 +1,11 @@
+--- a/configure.ac
++++ b/configure.ac
+@@ -260,7 +260,7 @@
+         -Wl,-z,relro \
+         -Wl,-z,now \
+         -pie \
+-        -Wl,-fuse-ld=gold])
++        -Wl,-fuse-ld=bfd])
+ AC_SUBST([OUR_LDFLAGS], "$with_ldflags $sanitizer_ldflags")
+ 
+ AC_CHECK_SIZEOF(pid_t)
diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-core/systemd/systemd_232.bb
index 1007360..1ce9dc1 100644
--- a/meta/recipes-core/systemd/systemd_232.bb
+++ b/meta/recipes-core/systemd/systemd_232.bb
@@ -41,6 +41,8 @@ SRC_URI_append_libc-uclibc = "\
 "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
+SRC_URI_append_qemuppc = " file://systemd-drop-gold-use-bfd.patch"
+
 PACKAGECONFIG ??= "xz \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'efi pam selinux ldconfig', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
-- 
2.7.4


