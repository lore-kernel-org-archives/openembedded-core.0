Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C39586D897
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 02:48:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAE2m8LR006540
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 18:48:08 -0800 (PST)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.203) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 13 Nov 2013 18:48:08 -0800
From: <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Nov 2013 10:47:58 +0800
Message-ID: <1384397278-5836-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH V2] util-linux: Fix QA warnings about ALTERNATIVES
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
X-List-Received-Date: Thu, 14 Nov 2013 02:48:06 -0000
Content-Type: text/plain

From: Lu Chong <Chong.Lu@windriver.com>

Previously, EXTRA_OECONF would be overwritten by EXTRA_OECONF_class-native
and EXTRA_OECONF_class-nativesdk.
As a result, some applications such as `last', `mesg' and `reset' didn't get
compiled.

The patch rewrote EXTRA_OECONF_class-native, EXTRA_OECONF_class-nativesdk
and EXTRA_OECONF variables to fix QA warnings.

usr/share/man/man1/last.1.util-linux does not exist
usr/share/man/man1/mesg.1.util-linux does not exist
usr/bin/last.util-linux does not exist
usr/bin/mesg.util-linux does not exist
bin/reset does not exist

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc       |   19 +++++++++++--------
 meta/recipes-core/util-linux/util-linux_2.23.2.bb |    8 ++++++--
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index daf0a3e..9bb86eb 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -39,15 +39,18 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-mkfs.cramfs util-linux-fsck.cramfs \
              util-linux-partx ${PN}-bash-completion"
 
-EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
-                --disable-makeinstall-chown --enable-elvtune --enable-init \
-                --enable-kill --enable-last --enable-mesg --enable-partx \
-                --enable-raw --enable-rdev --enable-reset --disable-login \
-                --disable-vipw --disable-newgrp --disable-chfn-chsh \
-                --enable-write --enable-arch --enable-mount --with-fsprobe=builtin \
-                --enable-libuuid --enable-libblkid --enable-fsck --without-udev \
-		usrsbin_execdir='${sbindir}' \
+SHARED_EXTRA_OECONF = "--disable-use-tty-group \
+                       --disable-makeinstall-chown --enable-elvtune --enable-init \
+                       --enable-kill --enable-last --enable-mesg --enable-partx \
+                       --enable-raw --enable-rdev --enable-reset --disable-login \
+                       --disable-vipw --disable-newgrp --disable-chfn-chsh \
+                       --enable-write --enable-arch --enable-mount --with-fsprobe=builtin \
+                       --enable-libuuid --enable-libblkid --enable-fsck --without-udev \
+                       usrsbin_execdir='${sbindir}' \
 "
+
+EXTRA_OECONF = "${SHARED_EXTRA_OECONF} --libdir=${base_libdir}"
+
 PACKAGECONFIG_class-target ?= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
                                 ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} "
 PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, libpam,"
diff --git a/meta/recipes-core/util-linux/util-linux_2.23.2.bb b/meta/recipes-core/util-linux/util-linux_2.23.2.bb
index b5c221b..f65932c 100644
--- a/meta/recipes-core/util-linux/util-linux_2.23.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.23.2.bb
@@ -18,5 +18,9 @@ SRC_URI[md5sum] = "39a02ad0b3b37824c394f40930b7aa38"
 SRC_URI[sha256sum] = "6c5be3f7beec91b4893de14bbd722886fa2521be5bfa0fc079b749d0018633b1"
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
-EXTRA_OECONF_class-native += "--disable-fallocate --disable-use-tty-group"
-EXTRA_OECONF_class-nativesdk += "--disable-fallocate --disable-use-tty-group"
+EXTRA_OECONF_class-native = "${SHARED_EXTRA_OECONF} \
+                             --disable-fallocate --disable-use-tty-group \
+"
+EXTRA_OECONF_class-nativesdk = "${SHARED_EXTRA_OECONF} \
+                                --disable-fallocate --disable-use-tty-group \
+"
-- 
1.7.9.5


