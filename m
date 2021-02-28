Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
 by mx.groups.io with SMTP id smtpd.web11.5713.1614514866889915603
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 04:21:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=qeaZ/7ar;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.17, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id GL4Jlwj4jjOtyGL4Kl58hx; Sun, 28 Feb 2021 12:21:05 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=UcTKtJaN c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=qa6Q16uM49sA:10 a=-An2I_7KAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8
 a=z7B6_g-hddE48n1r7-kA:9 a=Sq34B_EcNBM9_nrAYB9S:22 a=d3PnA9EDa4IxuAV0gXij:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=oD+4HePy+1cig5QXwSnzw2O5QLa4pmRiZ3XbooB85q4=; b=qe
	aZ/7ar/BQhtKkHiJZKt0xn9sAN9ccghyP1v4H9BkH2FNjhmeQ2nvCB5nznbbE93G1j3zrclxzevfQ
	McFUq6Sfz92R3bmP8wdTw9m4KAO5WyIbO6SYWOsuUryBzSx3MFiUxAhuqCkFNEx3v/djA5QDXiKqu
	7tEVzL6+uHLJXmguWJYr+1e/mMPkZFVPlxUT72aGnsfCerBcoxpBrL4bZptuSCrtjLC5+C4w7MzaA
	swhHUDL2W0hAaaUzT5caiNvhq9uZVpWJdTEgQqtMmFAcAGg7fEzBNNcrF7fX8521dnxgZ3k0NYuDw
	f3si/fXbzCp722mJlH32Nhy7P/7TNlkw==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1lGL4H-0002a5-TO; Sun, 28 Feb 2021 12:21:01 +0000
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>,
	Khem Raj <raj.khem@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2] gcc-sanitizers: Move content from gcclibdir into libdir
Date: Sun, 28 Feb 2021 12:20:54 +0000
Message-Id: <20210228122054.28918-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHrBvcl4H+uFcXmOWyyZ5/riQFDx/uF6Yo2MGv2OdgG7evhohKCcxJAm/pCDar5w7VSxUJM3Eoqj/aGBz4cZw5ezFV533SvMtTFKuqEd5p2B4FbFu8SS
 7kpDBbJoxE71zS4WK0QJ1+gjisDgHUctSYBiHaGOHGbjAfPwNKeANGv1M0qV7WLMoXJuPpLMG+0a9Q==
Content-Transfer-Encoding: 8bit

In e9e5744ba8b0d43c8b874d365f83071ce20bf0a1, Khem Raj wrote:
> OE does not use the traditional /usr/lib/gcc prefix to store
> gcc-runtime it basically is moved into libdir, however some newer
> files were installed by newer versions of gcc especially libgomp (
> omp.h openacc.h ) into gcclibdir, so we have content in both
> directories, this confuses other tools which are trying to guess the
> gcc installation and its runtime location, since now we have two
> directories, the tools either choose one or other and we get
> inconsistent behavior, e.g. clang for aarch64 uses /usr/lib but same
> clang for riscv64 chose /usr/lib/gcc

> This change ensures that OE ends up with single valid location for gcc
> runtime files

I think that the same thing needs to happen in gcc-sanitizers.inc,
otherwise I get errors like:

| .../recipe-sysroot/usr/include/gpg-error-64.h:884:11: fatal error: sanitizer/lsan_interface.h: No such file or directory

when attempting to compile with sanitizers enabled.

FILES_${PN} needs updating to match too.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 668e14a59f..9e643ee277 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -35,6 +35,11 @@ do_compile () {
 do_install () {
     cd ${B}/${TARGET_SYS}/libsanitizer/
     oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/${TARGET_SYS}/libsanitizer/ install
+    if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include ]; then
+	install -d ${D}${libdir}/${TARGET_SYS}/${BINV}/include
+	mv ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/* ${D}${libdir}/${TARGET_SYS}/${BINV}/include
+	rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include
+    fi
     if [ -d ${D}${infodir} ]; then
         rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
     fi
@@ -109,4 +114,4 @@ FILES_libtsan-dev += "\
 "
 FILES_libtsan-staticdev += "${libdir}/libtsan.a"
 
-FILES_${PN} = "${libdir}/*.spec ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/sanitizer/*.h"
+FILES_${PN} = "${libdir}/*.spec ${libdir}/${TARGET_SYS}/${BINV}/include/sanitizer/*.h"
-- 
2.20.1

