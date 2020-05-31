Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web12.14199.1590928042125133107
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 05:27:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=Cz4XU+LY;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.210.170, mailfrom: rahulk@mvista.com)
Received: by mail-pf1-f170.google.com with SMTP id w68so1360520pfb.3
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 05:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=VdNEkQ0Sn+vXe0knCZSxOARvz4k+OfhfHNef0lV+cGk=;
        b=Cz4XU+LYbNOJykwKA6tPIM4Fyb7LWmsK3QCNa/alahj4SbEI41/W/3d/psp/scjqQT
         LGiIF/WRGBisew4UL1ub5tIhRnLGL7aPGERTVpRPkXbVgqG9HO8USiujig9rRN0el6jw
         pz2pa0AHj2dZTYq/eIuWiHUqDmKcn1znKJoMF4ylH2cakl4Jg2fO691etUT146GWvNyD
         kVFh8RHvPXZ78Kec3opfR1Td7mFmvUiCTltCvkVdR8WjAd/62KVMKgrS1dVaqBhBdcKv
         +ecsdWd989L1LzcfAJbS3YOdb/o5ioabKuZIt4CKH5SBGl7S83hTuZKsFqAoE1TnTrn2
         WGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=VdNEkQ0Sn+vXe0knCZSxOARvz4k+OfhfHNef0lV+cGk=;
        b=qCgOhufWmdzXN3onuHMq2pw/giZhngn+3z3b2t8dKUx572mxIYsl+6WOYzZgouSV8b
         EN7J8Uowcb+yDaX9DcBJzU4zTnnEWkcsa0O8+KSQjU4LHqvFlZFEOU6kbG/YIG8q7oJk
         4j6shu8/FmAuz5PA2y6wzkV5cxDJLrvUrjkh9TRv/3VXQ0NlbFmfs4VQlGmX1cZW9yYt
         qGg8aQ0el942x12Lq8pcW21Yx4EEzkgYDLm3V9XQhbVVwBRY9tQLd8s1rjW44ov0u0MS
         1uj/jlXWRMKoPEjSyBfrI4IhOJjj8Q+Os2HC1tnJoad0NgLe/hk/wzftD/65m4n4lWV4
         U0ng==
X-Gm-Message-State: AOAM531hgkJep40ysIMlDf+JgEOz4+xOXlpaDcJN6AYeuu7bJfrSh2i8
	YXMvxhvRyFJB4zy1epfez0qYFzzYVEMMAg==
X-Google-Smtp-Source: ABdhPJzquPKCkTgSauG2sa5Hxpq0IeWZnJ4khd3PVHtMeaDbcPKgKbjmYL9r9wEk5oFS1q8X3NtABw==
X-Received: by 2002:a63:9255:: with SMTP id s21mr15357018pgn.363.1590928040948;
        Sun, 31 May 2020 05:27:20 -0700 (PDT)
Return-Path: <rahulk@mvista.com>
Received: from localhost.localdomain ([36.255.87.194])
        by smtp.gmail.com with ESMTPSA id 98sm4694014pjo.12.2020.05.31.05.27.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 31 May 2020 05:27:20 -0700 (PDT)
From: "Rahul Kumar" <rahulk@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Rahul Kumar <rahulk@mvista.com>
Subject: [PATCH v3] bzip2: Add test suite for bzip2
Date: Sun, 31 May 2020 17:57:06 +0530
Message-Id: <1590928026-6366-1-git-send-email-rahulk@mvista.com>
X-Mailer: git-send-email 2.7.4

Source: git://sourceware.org/git/bzip2-tests.git
Type: Enhancement
Description:
bzip2 now has a test suite available at git://sourceware.org/git/bzip2-tests.git.

This is a collection of "interesting" .bz2 files that can be used to
test bzip2 works correctly. They come from different projects.

Some files are deliberately bad, and are use to see how bzip2 handles
corrupt files. They are explicitly not intended to decompress correctly,
but to catch errors in bzip2 trying to deal with deliberately bad data.
All such files have a name ending in .bz2.bad.

All non-bad files end in bz2. And should come with a .md5 file for
the original input file. The .md5 file is used to check that bzip2
could correctly decompress the file. The original (non-compressed)
files are deliberately not checked in.

It will by default test with the command 'bzip2', running under
valgrind (if installed on the system).

For each .bz2 file found it is decompressed, recompressed and
decompressed again. Once with the default bzip2 settings and
once in --small (-s) mode.

For each .bz2.bad file decompression is tried twice also. In
default mode and small mode. The bzip2 binary is expected to
return either 1 or 2 as exit status. Any other exit code is
interpreted as failure.

License:
   In bzip2-tests source code Each directory should contain a README
   file explaining where the .bz2 files originally came from.
   Plus a reference to the (Free Software) license that the project
   files were distributed under.

Test Summery:
   On qemux86-64/kvm the ptest results with extra filesystem space (atleast 114688) are:

TOTAL:      396
PASS:       396
SKIP:       0
XFAIL:      0
FAIL:       0
XPASS:      0
ERROR:      0

All tests passed
DURATION: 517

[YOCTO #13444]

Signed-off-by: Rahul Kumar <rahulk@mvista.com>
---
 meta/recipes-extended/bzip2/bzip2/Makefile.am |  2 ++
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    | 23 ++++++++++++++++++++---
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/bzip2/bzip2/Makefile.am b/meta/recipes-extended/bzip2/bzip2/Makefile.am
index dcf6458..aab6558 100644
--- a/meta/recipes-extended/bzip2/bzip2/Makefile.am
+++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am
@@ -46,6 +46,7 @@ runtest:
 	else echo "FAIL: sample2 decompress"; fi
 	@if cmp sample3.tst sample3.ref; then echo "PASS: sample3 decompress";\
 	else echo "FAIL: sample3 decompress"; fi
+	./bzip2-tests/run-tests.sh --tests-dir="$(PWD)/bzip2-tests"
 
 install-ptest:
 	sed  -n '/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}' \
@@ -56,6 +57,7 @@ install-ptest:
 	cp $(srcdir)/sample1.bz2	$(DESTDIR)/
 	cp $(srcdir)/sample2.bz2	$(DESTDIR)/
 	cp $(srcdir)/sample3.bz2	$(DESTDIR)/
+	cp -rf $(srcdir)/../git		$(DESTDIR)/bzip2-tests
 	ln -s $(bindir)/bzip2		$(DESTDIR)/bzip2
 
 install-exec-hook:
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index d58f553..20b52f7 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -4,10 +4,25 @@ Huffman coding. Compression is generally considerably better than that achieved
 LZ77/LZ78-based compressors, and approaches the performance of the PPM family of statistical compressors."
 HOMEPAGE = "https://sourceware.org/bzip2/"
 SECTION = "console/utils"
-LICENSE = "bzip2-1.0.6"
-LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664"
+LICENSE = "bzip2-1.0.6 & GPLv3+ & Apache-2.0 & MS-PL & BSD-3-Clause & Zlib"
+LICENSE_${PN} = "bzip2-1.0.6"
+LICENSE_${PN}-dev = "bzip2-1.0.6"
+LICENSE_${PN}-dbg = "bzip2-1.0.6"
+LICENSE_${PN}-doc = "bzip2-1.0.6"
+LICENSE_${PN}-src = "bzip2-1.0.6"
+LICENSE_libbz2 = "bzip2-1.0.6"
+LICENSE_${PN}-ptest = "bzip2-1.0.6 & GPLv3+ & Apache-2.0 & MS-PL & BSD-3-Clause & Zlib"
+
+LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664 \
+                    file://${WORKDIR}/git/commons-compress/LICENSE.txt;md5=86d3f3a95c324c9479bd8986968f4327 \
+                    file://${WORKDIR}/git/dotnetzip/License.txt;md5=9cb56871eed4e748c3bc7e8ff352a54f \
+                    file://${WORKDIR}/git/dotnetzip/License.zlib.txt;md5=cc421ccd22eeb2e5db6b79e6de0a029f \
+                    file://${WORKDIR}/git/go/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707 \
+                    file://${WORKDIR}/git/lbzip2/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+"
 
 SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
+           git://sourceware.org/git/bzip2-tests.git;name=bzip2-tests \
            file://configure.ac;subdir=${BP} \
            file://Makefile.am;subdir=${BP} \
            file://run-ptest \
@@ -15,6 +30,8 @@ SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
 SRC_URI[md5sum] = "67e051268d0c475ea773822f7500d0e5"
 SRC_URI[sha256sum] = "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269"
 
+SRCREV_bzip2-tests = "f9061c030a25de5b6829e1abf373057309c734c0"
+
 UPSTREAM_CHECK_URI = "https://www.sourceware.org/pub/bzip2/"
 
 PACKAGES =+ "libbz2"
@@ -39,7 +56,7 @@ do_install_ptest () {
 
 FILES_libbz2 = "${libdir}/lib*${SOLIBS}"
 
-RDEPENDS_${PN}-ptest += "make"
+RDEPENDS_${PN}-ptest += "make bash perl"
 
 PROVIDES_append_class-native = " bzip2-replacement-native"
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4

