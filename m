Return-Path: <ting.liu@freescale.com>
Received: from db9outboundpool.messaging.microsoft.com
	(mail-db9lp0251.outbound.messaging.microsoft.com [213.199.154.251])
	by mail.openembedded.org (Postfix) with ESMTP id 53CD26E3DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 09:50:08 +0000 (UTC)
Received: from mail126-db9-R.bigfish.com (10.174.16.225) by
	DB9EHSOBE019.bigfish.com (10.174.14.82) with Microsoft SMTP Server id
	14.1.225.22; Tue, 14 Jan 2014 09:50:08 +0000
Received: from mail126-db9 (localhost [127.0.0.1])	by
	mail126-db9-R.bigfish.com (Postfix) with ESMTP id 7D5DD1E02B4	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 09:50:08 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 29
X-BigFish: VS29(zzzz1f42h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21a7h1fc6hzz1de098h17326ah8275bh8275dh1de097h186068hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h2327h2336h2438h2461h2117iu1155h)
X-Forefront-Antispam-FastScan: 29<69479737001>
Received: from mail126-db9 (localhost.localdomain [127.0.0.1]) by mail126-db9
	(MessageSwitch) id 138969300759353_2712;
	Tue, 14 Jan 2014 09:50:07 +0000 (UTC)
Received: from DB9EHSMHS027.bigfish.com (unknown [10.174.16.241])	by
	mail126-db9.bigfish.com (Postfix) with ESMTP id 09B47140048;
	Tue, 14 Jan 2014 09:50:07 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB9EHSMHS027.bigfish.com
	(10.174.14.37) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 14 Jan 2014 09:50:06 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Tue, 14 Jan 2014 09:50:04 +0000
Received: from b28495.ap.freescale.net (b28495.ap.freescale.net
	[10.193.20.146])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id s0E9nvwr027247;	Tue, 14 Jan 2014 02:50:03 -0700
From: <b28495@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jan 2014 17:49:57 +0800
Message-ID: <1389692997-5088-3-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1389692997-5088-1-git-send-email-b28495@freescale.com>
References: <1389692997-5088-1-git-send-email-b28495@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [PATCH 3/3] wayland-native: disable macro checks not used for scanner
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
X-List-Received-Date: Tue, 14 Jan 2014 09:50:09 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

We only build wayland-native for the scanner, so disable the bits we
don't actually need. This avoid build issue on older distro such as
Centos 5.x:
| error: 'O_CLOEXEC' undeclared (first use in this function)
| error: sys/timerfd.h: No such file or directory
| error: 'CLOCK_MONOTONIC' undeclared (first use in this function)
| error: 'TFD_CLOEXEC' undeclared (first use in this function)
| error: 'SFD_CLOEXEC' undeclared (first use in this function)

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 ...disable-macro-checks-not-used-for-scanner.patch |   52 ++++++++++++++++++++
 meta/recipes-graphics/wayland/wayland_1.3.0.bb     |    5 ++-
 2 files changed, 56 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch

diff --git a/meta/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch b/meta/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch
new file mode 100644
index 0000000..8a22079
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch
@@ -0,0 +1,52 @@
+From 0af87a0382ffa4f1f6c81960d5f2ff07d3726529 Mon Sep 17 00:00:00 2001
+From: Ting Liu <b28495@freescale.com>
+Date: Mon, 13 Jan 2014 16:49:45 +0800
+Subject: [PATCH] disable macro checks not used for scanner
+
+We only build wayland-native for the scanner, so disable the bits we don't
+actually need. This avoid build issue on older distro such as Centos 5.x:
+| error: 'O_CLOEXEC' undeclared (first use in this function)
+| error: sys/timerfd.h: No such file or directory
+| error: 'CLOCK_MONOTONIC' undeclared (first use in this function)
+| error: 'TFD_CLOEXEC' undeclared (first use in this function)
+| error: 'SFD_CLOEXEC' undeclared (first use in this function)
+
+Signed-off-by: Ting Liu <b28495@freescale.com>
+---
+ configure.ac | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index fa924ae..bf1b85a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -41,16 +41,16 @@ AC_SUBST(GCC_CFLAGS)
+ 
+ AC_CHECK_FUNCS([accept4 mkostemp])
+ 
+-AC_CHECK_DECL(SFD_CLOEXEC,[],
+-	      [AC_MSG_ERROR("SFD_CLOEXEC is needed to compile wayland")],
+-	      [[#include <sys/signalfd.h>]])
+-AC_CHECK_DECL(TFD_CLOEXEC,[],
+-	      [AC_MSG_ERROR("TFD_CLOEXEC is needed to compile wayland")],
+-	      [[#include <sys/timerfd.h>]])
+-AC_CHECK_DECL(CLOCK_MONOTONIC,[],
+-	      [AC_MSG_ERROR("CLOCK_MONOTONIC is needed to compile wayland")],
+-	      [[#include <time.h>]])
+-AC_CHECK_HEADERS([execinfo.h])
++##AC_CHECK_DECL(SFD_CLOEXEC,[],
++#	      [AC_MSG_ERROR("SFD_CLOEXEC is needed to compile wayland")],
++#	      [[#include <sys/signalfd.h>]])
++#AC_CHECK_DECL(TFD_CLOEXEC,[],
++#	      [AC_MSG_ERROR("TFD_CLOEXEC is needed to compile wayland")],
++#	      [[#include <sys/timerfd.h>]])
++#AC_CHECK_DECL(CLOCK_MONOTONIC,[],
++#	      [AC_MSG_ERROR("CLOCK_MONOTONIC is needed to compile wayland")],
++#	      [[#include <time.h>]])
++#AC_CHECK_HEADERS([execinfo.h])
+ 
+ AC_ARG_ENABLE([scanner],
+               [AC_HELP_STRING([--disable-scanner],
+-- 
+1.8.3.2
+
diff --git a/meta/recipes-graphics/wayland/wayland_1.3.0.bb b/meta/recipes-graphics/wayland/wayland_1.3.0.bb
index 212e08a..a60d02a 100644
--- a/meta/recipes-graphics/wayland/wayland_1.3.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.3.0.bb
@@ -14,7 +14,10 @@ SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "d16d27081e0871de82d08840c2f133fc"
 SRC_URI[sha256sum] = "2e817685f68a26acd19964d69ddbc4549ba5412114ad95e1a9f5934cce470d6e"
 
-SRC_URI_append_class-native = " file://just-scanner.patch"
+SRC_URI_append_class-native = " \
+    file://just-scanner.patch \
+    file://disable-macro-checks-not-used-for-scanner.patch \
+"
 
 inherit autotools pkgconfig
 
-- 
1.7.3.4



