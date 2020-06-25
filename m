Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web11.10178.1593090712837027773
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 06:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=CdR4TedY;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.215.194, mailfrom: rahulk@mvista.com)
Received: by mail-pg1-f194.google.com with SMTP id e18so3265331pgn.7
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 06:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=3LDlb8KrzSJO4h6wTHVrzCUk2ER+yIvZImH8O1Y/3bw=;
        b=CdR4TedY1FalrczNH6iYWCRrP3WjTxmJHynH8L2WBcC6fcsr0XAiUYQHWfbEeqMKFn
         f/hiHkQ/8rXXrTfZYd2iU7FzGnFjgPu5CMivu+LNM7LzAXiOTKis28s5K9BJeZroKSt2
         EHiwojiZOuE2U8WNp2EcQNBaBoVQSX/2FXzG+GRA2CqqXjVuZo0bZB9EhZyno2e0NSTB
         LaDjvte6I1xv9e5+liDEl4V39Kn+AEsmuKB5EA3hZD1IUf1xnmXYKDw+DqiEF+cCdiBv
         aVt4vOLmopRHtTraXsJZyK/TR8Raa/0u7KlcM+/DiOk3de74MV8Y+qU173qz0tEQmnLp
         EdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3LDlb8KrzSJO4h6wTHVrzCUk2ER+yIvZImH8O1Y/3bw=;
        b=iPnftKfwjwdXzxO++Au/F9eow2ul8G2CXoT/rfw5lpgPPbjBMcNhUoYjehK3UlHPxT
         p3Z1uvpbNFmD7tqtZ7PYL2AuH4P29AM+BKiYvI7vm+38r9bg9YbJW9ZeJjYxrsBPgOWO
         ylvVKzNmmjRdpuXppcFb/K3HMgxDBZz3qKv/UZGbsf3JbN0MJvBg4TkiEChU0+C6ifqJ
         ODuJAB0ktpiw5iP9/Byp7m4euQZ7fT1nj7k8uzmwXEilf7yCm8g0Ox6mYMJIPRezZ+y5
         gtPZyHGjyFeWvhmltbBQGEf9SyUZqLdVqKBBHcvpmh88YBi6ct8DhAAQ40BdmH4ehfEj
         ggVQ==
X-Gm-Message-State: AOAM531o5qMkch0yGmMkq/a/9nvrVaN9BxskLooWp6SaeAzqsn7tSt8O
	CQJnM+yRkYmYt2Yf8kedIMfSqNkIl7BK7w==
X-Google-Smtp-Source: ABdhPJzFbWYj1WUIFpRL+UyIBJOHf0gvZTpDd4u1RQdxiwGAc8jpghKGsnY/1r/mOSUKfCSbYvvmmw==
X-Received: by 2002:a62:e712:: with SMTP id s18mr3125757pfh.224.1593090711790;
        Thu, 25 Jun 2020 06:11:51 -0700 (PDT)
Return-Path: <rahulk@mvista.com>
Received: from CelSys065.mvista.com ([36.255.87.241])
        by smtp.gmail.com with ESMTPSA id p10sm8113777pjp.52.2020.06.25.06.11.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jun 2020 06:11:50 -0700 (PDT)
From: "Rahul Kumar" <rahulk@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Rahul Kumar <rahulk@mvista.com>
Subject: [PATCH v4] bzip2: Add test suite for bzip2
Date: Thu, 25 Jun 2020 18:41:27 +0530
Message-Id: <1593090687-4781-1-git-send-email-rahulk@mvista.com>
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
 meta/recipes-extended/bzip2/bzip2/Makefile.am |  1 +
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    | 31 ++++++++++++++++++++++++---
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/bzip2/bzip2/Makefile.am b/meta/recipes-extended/bzip2/bzip2/Makefile.am
index dcf6458..d449894 100644
--- a/meta/recipes-extended/bzip2/bzip2/Makefile.am
+++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am
@@ -46,6 +46,7 @@ runtest:
 	else echo "FAIL: sample2 decompress"; fi
 	@if cmp sample3.tst sample3.ref; then echo "PASS: sample3 decompress";\
 	else echo "FAIL: sample3 decompress"; fi
+	./bzip2-tests/run-tests.sh --tests-dir="$(PWD)/bzip2-tests"
 
 install-ptest:
 	sed  -n '/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}' \
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index d58f553..70eb67f 100644
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
@@ -34,12 +51,20 @@ do_configure_prepend () {
 }
 
 do_install_ptest () {
+	install -d ${D}${PTEST_PATH}/bzip2-tests
+	cp -r ${WORKDIR}/git/commons-compress ${D}${PTEST_PATH}/bzip2-tests/commons-compress
+	cp -r ${WORKDIR}/git/dotnetzip ${D}${PTEST_PATH}/bzip2-tests/dotnetzip
+	cp -r ${WORKDIR}/git/go ${D}${PTEST_PATH}/bzip2-tests/go
+	cp -r ${WORKDIR}/git/lbzip2 ${D}${PTEST_PATH}/bzip2-tests/lbzip2
+	cp -r ${WORKDIR}/git/pyflate ${D}${PTEST_PATH}/bzip2-tests/pyflate
+	cp ${WORKDIR}/git/README ${D}${PTEST_PATH}/bzip2-tests/
+	cp ${WORKDIR}/git/run-tests.sh ${D}${PTEST_PATH}/bzip2-tests/
 	sed -i -e "s|^Makefile:|_Makefile:|" ${D}${PTEST_PATH}/Makefile
 }
 
 FILES_libbz2 = "${libdir}/lib*${SOLIBS}"
 
-RDEPENDS_${PN}-ptest += "make"
+RDEPENDS_${PN}-ptest += "make bash"
 
 PROVIDES_append_class-native = " bzip2-replacement-native"
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4

