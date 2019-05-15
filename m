Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 39CAE6C106
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 12:53:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4FCrU6k023636
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 05:53:40 -0700
Received: from otp-opanait-l1.corp.ad.wrs.com (128.224.124.169) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Wed, 15 May 2019 05:53:19 -0700
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 May 2019 15:52:01 +0300
Message-ID: <20190515125201.12639-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] grub-mkconfig: Use -c instead of --printf for stat
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
X-List-Received-Date: Wed, 15 May 2019 12:53:50 -0000
Content-Type: text/plain

"--printf" only works with the stat variant provided by coreutils.

With busybox, when running grub-mkconfig, stat will fail with the
following error:
stat: unrecognized option '--printf=%T'

Usage: stat [OPTIONS] FILE...

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 ...fig-Use-c-instead-of-printf-for-stat.patch | 36 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-grub-mkconfig-Use-c-instead-of-printf-for-stat.patch

diff --git a/meta/recipes-bsp/grub/files/0001-grub-mkconfig-Use-c-instead-of-printf-for-stat.patch b/meta/recipes-bsp/grub/files/0001-grub-mkconfig-Use-c-instead-of-printf-for-stat.patch
new file mode 100644
index 0000000000..9acddb73c8
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-grub-mkconfig-Use-c-instead-of-printf-for-stat.patch
@@ -0,0 +1,36 @@
+From b5011ea2bc57d80b3e5a42bc308fa2000e85eab1 Mon Sep 17 00:00:00 2001
+From: Ovidiu Panait <ovidiu.panait@windriver.com>
+Date: Wed, 17 Apr 2019 12:10:28 +0300
+Subject: [PATCH] grub-mkconfig: Use -c instead of --printf for stat
+
+"--printf" only works with the stat variant provided by coreutils.
+
+With busybox, when running grub-mkconfig, stat will fail with the
+following error:
+stat: unrecognized option '--printf=%T'
+
+Usage: stat [OPTIONS] FILE...
+
+Upstream-Status: Submitted [http://lists.gnu.org/archive/html/grub-devel/2019-05/msg00079.html]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ util/grub-mkconfig.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/util/grub-mkconfig.in b/util/grub-mkconfig.in
+index f8496d2..628706d 100644
+--- a/util/grub-mkconfig.in
++++ b/util/grub-mkconfig.in
+@@ -144,7 +144,7 @@ GRUB_DEVICE_BOOT_UUID="`${grub_probe} --device ${GRUB_DEVICE_BOOT} --target=fs_u
+ GRUB_FS="`${grub_probe} --device ${GRUB_DEVICE} --target=fs 2> /dev/null || echo unknown`"
+ 
+ if [ x"$GRUB_FS" = xunknown ]; then
+-    GRUB_FS="$(stat -f --printf=%T / || echo unknown)"
++    GRUB_FS="$(stat -f -c %T / || echo unknown)"
+ fi
+ 
+ if test -f ${sysconfdir}/default/grub ; then
+-- 
+2.20.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 7d8c280b3f..7eb9e9c491 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -20,6 +20,7 @@ SRC_URI = "https://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://gcc8.patch \
            file://0001-x86-64-Treat-R_X86_64_PLT32-as-R_X86_64_PC32.patch \
            file://0001-grub-setup-Debug-message-cleanup.patch \
+           file://0001-grub-mkconfig-Use-c-instead-of-printf-for-stat.patch \
 "
 SRC_URI[md5sum] = "1116d1f60c840e6dbd67abbc99acb45d"
 SRC_URI[sha256sum] = "660ee136fbcee08858516ed4de2ad87068bfe1b6b8b37896ce3529ff054a726d"
-- 
2.20.1


