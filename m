Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1Syz6u-0005fk-MR
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 07:47:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q785ZOZg014617
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Aug 2012 22:35:24 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.163) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 7 Aug 2012 22:35:24 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Aug 2012 13:35:23 +0800
Message-ID: <1344404123-14649-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q785ZOZg014617
Subject: [PATCH] qemu: backport patch to fix pl031 RTC
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
X-List-Received-Date: Wed, 08 Aug 2012 05:47:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Roy.Li <rongqing.li@windriver.com>

Intergrate the patch from:
http://repo.or.cz/w/qemu.git/commit/13a16f1d91fc7a46b65b22a33f6ffea1b826a=
097

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 ...-Actually-raise-interrupt-on-timer-expiry.patch |   41 ++++++++++++++=
++++++
 meta/recipes-devtools/qemu/qemu_0.15.1.bb          |    3 +-
 2 files changed, 43 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/hw-pl031-Actua=
lly-raise-interrupt-on-timer-expiry.patch

diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/hw-pl031-Actually-rai=
se-interrupt-on-timer-expiry.patch b/meta/recipes-devtools/qemu/qemu-0.15=
.1/hw-pl031-Actually-raise-interrupt-on-timer-expiry.patch
new file mode 100644
index 0000000..2ccc663
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-0.15.1/hw-pl031-Actually-raise-inte=
rrupt-on-timer-expiry.patch
@@ -0,0 +1,41 @@
+Upstream-Status: Backport
+commit 13a16f1d91fc7a46b65b22a33f6ffea1b826a097=20
+in git://git.qemu.org/qemu.git master
+
+From 13a16f1d91fc7a46b65b22a33f6ffea1b826a097 Mon Sep 17 00:00:00 2001
+From: Peter Maydell <peter.maydell@linaro.org>
+Date: Thu, 16 Feb 2012 09:56:10 +0000
+Subject: [PATCH] hw/pl031: Actually raise interrupt on timer expiry
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix a typo in pl031_interrupt() which meant we were setting a bit
+in the interrupt mask rather than the interrupt status register
+and thus not actually raising an interrupt. This fix allows the
+rtctest program from the kernel's Documentation/rtc.txt to pass
+rather than hanging.
+
+Reported-by: Daniel Forsgren <daniel.forsgren@enea.com>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Acked-by: Andreas F=C3=A4rber <afaerber@suse.de>
+---
+ hw/pl031.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/hw/pl031.c b/hw/pl031.c
+index 05b5b11..69abc4f 100644
+--- a/hw/pl031.c
++++ b/hw/pl031.c
+@@ -76,7 +76,7 @@ static void pl031_interrupt(void * opaque)
+ {
+     pl031_state *s =3D (pl031_state *)opaque;
+=20
+-    s->im =3D 1;
++    s->is =3D 1;
+     DPRINTF("Alarm raised\n");
+     pl031_update(s);
+ }
+--=20
+1.7.4.1
+
diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-dev=
tools/qemu/qemu_0.15.1.bb
index 983e831..a914bcf 100644
--- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
@@ -3,7 +3,7 @@ require qemu.inc
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D441c28d2cf86e15a37fa47e15a72f=
bac \
                     file://COPYING.LIB;endline=3D24;md5=3Dc04def7ae38850=
e7d3ef548588159913"
=20
-PR =3D "r10"
+PR =3D "r11"
=20
 FILESPATH =3D "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR =3D "${WORKDIR}"
@@ -22,6 +22,7 @@ SRC_URI =3D "\
     file://dummy-gl-config.patch \
     file://0001-ppc64-Fix-linker-script.patch \
     file://ppc-s500-set-invalid-mask.patch \
+    file://hw-pl031-Actually-raise-interrupt-on-timer-expiry.patch \
     "
=20
 # Only use the GL passthrough patches for native/nativesdk versions
--=20
1.7.4.1



