Return-Path: <cosmin.paraschiv@freescale.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe002.messaging.microsoft.com [216.32.181.182])
	by mail.openembedded.org (Postfix) with ESMTP id E0D5C6E766
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 13:39:16 +0000 (UTC)
Received: from mail55-ch1-R.bigfish.com (10.43.68.235) by
	CH1EHSOBE019.bigfish.com (10.43.70.76) with Microsoft SMTP Server id
	14.1.225.22; Fri, 7 Mar 2014 13:39:16 +0000
Received: from mail55-ch1 (localhost [127.0.0.1])	by mail55-ch1-R.bigfish.com
	(Postfix) with ESMTP id 93DB71A020A;
	Fri,  7 Mar 2014 13:39:16 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz1de098h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h1155h)
Received: from mail55-ch1 (localhost.localdomain [127.0.0.1]) by mail55-ch1
	(MessageSwitch) id 1394199554199779_5856;
	Fri,  7 Mar 2014 13:39:14 +0000 (UTC)
Received: from CH1EHSMHS013.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.242])	by mail55-ch1.bigfish.com (Postfix) with ESMTP id
	2BDAC1C00B4;	Fri,  7 Mar 2014 13:39:14 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS013.bigfish.com
	(10.43.70.13) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 7 Mar 2014 13:39:11 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Fri, 7 Mar 2014 13:39:10 +0000
Received: from fsr-ub1264-104.ea.freescale.net
	(fsr-ub1264-104.ea.freescale.net [10.171.73.71])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id s27Dd8fj020272;
	Fri, 7 Mar 2014 06:39:09 -0700
From: Cosmin Paraschiv <cosmin.paraschiv@freescale.com>
To: <openembedded-core@lists.openembedded.org>, Saul Wold <sgw@linux.intel.com>
Date: Fri, 7 Mar 2014 15:39:04 +0200
Message-ID: <1394199544-19668-1-git-send-email-cosmin.paraschiv@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] gcc-runtime: Build libatomic
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
X-List-Received-Date: Fri, 07 Mar 2014 13:39:17 -0000
Content-Type: text/plain

GCC 4.8 includes a new runtime library, libatomic, which supports
atomic operations not supported by hardware or the OS. Build it,
so other packages can link against it, if needed.

Signed-off-by: Cosmin Paraschiv <cosmin.paraschiv@freescale.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc |   12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index d3b11a7..f8c1109 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -12,7 +12,7 @@ ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
 EXTRA_OECONF += "--disable-libunwind-exceptions"
 EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 
-RUNTIMETARGET = "libssp libstdc++-v3 libgomp"
+RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic"
 #  ?
 # libiberty
 # libmudflap
@@ -87,6 +87,9 @@ PACKAGES = "\
   libgomp \
   libgomp-dev \
   libgomp-staticdev \
+  libatomic \
+  libatomic-dev \
+  libatomic-staticdev \
 "
 # The base package doesn't exist, so we clear the recommends.
 RRECOMMENDS_${PN}-dbg = ""
@@ -161,6 +164,13 @@ FILES_libgomp-staticdev = "\
   ${libdir}/libgomp*.a \
   "
 
+FILES_libatomic = "${libdir}/libatomic.so.*"
+FILES_libatomic-dev = " \
+  ${libdir}/libatomic.so \
+  ${libdir}/libatomic.la"
+FILES_libatomic-staticdev = " \
+  ${libdir}/libatomic.a"
+
 do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
-- 
1.7.9.5



