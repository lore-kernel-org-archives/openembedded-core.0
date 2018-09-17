Return-Path: <Alexey.Brodkin@synopsys.com>
X-Greylist: delayed 324 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 17 Sep 2018 21:35:20 UTC
Received: from smtprelay.synopsys.com (us01smtprelay-2.synopsys.com
	[198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id E769A7966E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 21:35:20 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 47BDD24E044C;
	Mon, 17 Sep 2018 14:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537219804; bh=YOnxvqVl/bS2pvDz13uGohtYeitPmOxIaIzb56twlq0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OMdjbRzoJ1G+iDei71uaEMKOOnIKJ8up2BQo4z9sb/YrqMrmqQilk+03QCgq4q5Nx
	sblj6eVaysPEmrOAWdF/ISNKxxjHfwg+Gqwnng4OiAGjwlCIB0xeEX0hm9JD1Vcu+U
	XOoPznkiMdr8fSyhu5pSu7beUDz2LUwfOoyea2dSiK0EiAxgF2kQGaQ7aaexvx1/jo
	o+WJyhIvzRCyJZuY0A0uaBGElT3GKOOpQd2Am8o2t9imX+0TdCxdPKGRUHctoXmSS0
	4o0h37eJkJYsuq8jWTH4QRkAgNvCG68xAQ2h5m+zsAGRM2e0sIVIEiGoVEz8I7SJYk
	qEB3SD6PNvb5w==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id E209B5576;
	Mon, 17 Sep 2018 14:30:02 -0700 (PDT)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2018 00:29:39 +0300
Message-Id: <20180917212943.27237-7-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180917212943.27237-1-abrodkin@synopsys.com>
References: <20180917212943.27237-1-abrodkin@synopsys.com>
Cc: Mylene Josserand <mylene.josserand@bootlin.com>,
	linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 06/10] libgpg-error: Add ARC support
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
X-List-Received-Date: Mon, 17 Sep 2018 21:35:21 -0000

From: Mylene Josserand <mylene.josserand@bootlin.com>

Signed-off-by: Mylene Josserand <mylene.josserand@bootlin.com>
Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 .../0001-syscfg-Add-an-arc-architecture.patch      | 75 ++++++++++++++++++++++
 .../libgpg-error/libgpg-error_1.32.bb              |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0001-syscfg-Add-an-arc-architecture.patch

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-syscfg-Add-an-arc-architecture.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-syscfg-Add-an-arc-architecture.patch
new file mode 100644
index 0000000..df7c6fd
--- /dev/null
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0001-syscfg-Add-an-arc-architecture.patch
@@ -0,0 +1,75 @@
+From f2bad39e70bbd73e6e2e14a2bbfaa0103b5f6fec Mon Sep 17 00:00:00 2001
+From: Mylene Josserand <mylene.josserand@bootlin.com>
+Date: Thu, 13 Sep 2018 16:39:56 +0300
+Subject: [PATCH libgpg-error] syscfg: Add ARC architecture
+
+DesignWare ARC Processors are a family of 32-bit CPUs from Synopsys.
+This change allows us to build for and use libgpg-error on ARC cores.
+
+These values were obtained from a test application executed on ARC
+in simulation this way:
+
+1. Instructions for cross-compilation used are here:
+   http://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=blob;f=README
+
+2. Commands used on host:
+   # build="$(build-aux/config.guess)"
+   # ./configure --prefix=build/tmp-uclibc/sysroots/nsimhs/usr/ --host=arc-oe-linux-uclibc --build=$build
+   # cd src
+   # make gen-posix-lock-obj
+
+3. Commands used on target:
+   # ./gen-posix-lock-obj
+
+Signed-off-by: Mylene Josserand <mylene.josserand@bootlin.com>
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ src/Makefile.am                               |  1 +
+ .../lock-obj-pub.arc-unknown-linux-gnu.h      | 23 +++++++++++++++++++
+ 2 files changed, 24 insertions(+)
+ create mode 100644 src/syscfg/lock-obj-pub.arc-unknown-linux-gnu.h
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 380ea7c09c04..bd00961c2f27 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -47,6 +47,7 @@ lock_obj_pub = \
+         syscfg/lock-obj-pub.aarch64-unknown-linux-gnu.h     \
+ 	syscfg/lock-obj-pub.aarch64-apple-darwin.h          \
+         syscfg/lock-obj-pub.alpha-unknown-linux-gnu.h       \
++        syscfg/lock-obj-pub.arc-unknown-linux-gnu.h         \
+         syscfg/lock-obj-pub.arm-unknown-linux-androideabi.h \
+         syscfg/lock-obj-pub.arm-unknown-linux-gnueabi.h     \
+ 	syscfg/lock-obj-pub.arm-apple-darwin.h              \
+diff --git a/src/syscfg/lock-obj-pub.arc-unknown-linux-gnu.h b/src/syscfg/lock-obj-pub.arc-unknown-linux-gnu.h
+new file mode 100644
+index 000000000000..3b1a8fadf8a7
+--- /dev/null
++++ b/src/syscfg/lock-obj-pub.arc-unknown-linux-gnu.h
+@@ -0,0 +1,23 @@
++## lock-obj-pub.arc-oe-linux-uclibc.h
++## File created by gen-posix-lock-obj - DO NOT EDIT
++## To be included by mkheader into gpg-error.h
++
++typedef struct
++{
++  long _vers;
++  union {
++    volatile char _priv[24];
++    long _x_align;
++    long *_xp_align;
++  } u;
++} gpgrt_lock_t;
++
++#define GPGRT_LOCK_INITIALIZER {1,{{0,0,0,0,0,0,0,0, \
++                                    0,0,0,0,0,0,0,0, \
++                                    0,0,0,0,0,0,0,0}}}
++##
++## Local Variables:
++## mode: c
++## buffer-read-only: t
++## End:
++##
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
index a4c720b..d602df5 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
@@ -14,6 +14,7 @@ SECTION = "libs"
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
+           file://0001-syscfg-Add-an-arc-architecture.patch \
 	  "
 SRC_URI[md5sum] = "ef3d928a5a453fa701ecc3bb22be1c64"
 SRC_URI[sha256sum] = "c345c5e73cc2332f8d50db84a2280abfb1d8f6d4f1858b9daa30404db44540ca"
-- 
1.8.3.1


