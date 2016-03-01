Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A7EF46FF73
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 02:23:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u212N1r0005740
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 18:23:02 -0800 (PST)
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Mon, 29 Feb 2016 18:23:00 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Mar 2016 10:22:37 +0800
Message-ID: <1456798957-22223-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [PATCH] gcc: add TUNE_CCARGS for CFLAGS_FOR_TARGET of gcc-cross-canadian
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
X-List-Received-Date: Tue, 01 Mar 2016 02:23:04 -0000
Content-Type: text/plain

Add TUNE_CCARGS for CFLAGS_FOR_TARGET of gcc-cross-canadian to solve
below errors when compiling gcc-cross-canadian-powerpc64 within a debug
build:

configure:3655: checking for suffix of object files
configure:3677:  powerpc64-wrs-linux-gcc --sysroot=......bitbake_build/
tmp/sysroots/fsl-t2xxx -isystem=/usr/include --sysroot=....../
bitbake_build/tmp/sysroots/fsl-t2xxx   -c -O0 -fno-omit-frame-pointer -g
-pipe -g -Os  conftest.c >&5
{standard input}: Assembler messages:
{standard input}:23: Error: register save offset not a multiple of 8
{standard input}:24: Error: register save offset not a multiple of 8

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index ec1d281..04ae981 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -51,7 +51,7 @@ do_configure () {
 	export CPPFLAGS_FOR_BUILD="${BUILD_CPPFLAGS}"
 	export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
 	export LDFLAGS_FOR_BUILD="${BUILD_LDFLAGS}"
-	export CFLAGS_FOR_TARGET="${TARGET_CFLAGS}"
+	export CFLAGS_FOR_TARGET="${TARGET_CFLAGS} ${TUNE_CCARGS}"
 	export CPPFLAGS_FOR_TARGET="${TARGET_CPPFLAGS}"
 	export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
 	export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
-- 
1.7.9.5


