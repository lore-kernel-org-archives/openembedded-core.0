Received: from avasout03.plus.net (avasout03.plus.net [])
 by mx.groups.io with SMTP id smtpd.web11.746.1614274625780221904
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 09:37:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=PScHxLcH;
 spf=fail (domain: mcrowe.com, ip: <nil>, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id FKZZl6xKuEfgXFKZalwMCa; Thu, 25 Feb 2021 17:37:16 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=WomwzeXv c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=qa6Q16uM49sA:10 a=-An2I_7KAAAA:8 a=pGLkceISAAAA:8 a=z7B6_g-hddE48n1r7-kA:9
 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=zE+kVUw/WU/UZyl/leKnKS3CSe80MfVoGE+fZinWmtA=; b=PS
	cHxLcHK9nf6ETgf2jI078/ISHCOgqSrS7WSwW8otM54Zg42iFqQVAgBLtxl0Q34bfxhw3uyosGAW3
	sfj0z45lZvrEmLFQDItsGnF9C3Ixt81FSwRZRYSPIYhdP8nUJ1/P0SDfpe1cMbUxtoWSR6WRmnEnS
	JGmX8TP/TGG3UiUbkqaav1JHcZuSzaJouX7IOMhSmZIpcWztoJTWZFaVucfyy3/LFN/+s+v439RRm
	N/DkeJVf/VQdDnKkR0OSV7byWK1GnjyrfTU2cmmFGVn6eajuEHl0FLXsGj1iDYM9LUiOFKLl7TyI4
	CoiUMhdUi5u47E59nnYgIVnJPrgyOnOA==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1lFKZY-0000cE-AF; Thu, 25 Feb 2021 17:37:08 +0000
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc-sanitizers: Move content from gcclibdir into libdir
Date: Thu, 25 Feb 2021 17:36:53 +0000
Message-Id: <20210225173653.2408-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfPWW79o6HOqttPtGzKwYIu85CdZLklSY6Guy2qt9FlNSTL0AUm8qoKyQPkV1bQ4BJDt4aXkCsEyvAUR6DWA2A9AnCc1g+svwantP2b9UeDPBavAM5Oft
 r0Lgfpa1JSuFIfDW+89cGJgUsdhB/KX8GJRVyA2yAeN3ETP6bAyIu0psmt1SfdMvT+xQ7KQFcf7dKg==
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

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Cc: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 668e14a59f..67b755edf8 100644
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
-- 
2.20.1

