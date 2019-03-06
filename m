Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 684566BCE7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 04:24:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x264OIo1021323
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Mar 2019 20:24:19 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Tue, 5 Mar 2019 20:24:18 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 6 Mar 2019 12:24:16 +0800
Message-ID: <1551846256-166265-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] gcc-sanitizers: fix the build with -fno-omit-frame-pointer
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
X-List-Received-Date: Wed, 06 Mar 2019 04:24:19 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Fix the below build issue for gcc-sanitizers when
both -mthumb and -fno-omit-frame-pointer configured
for arm.
| ../../../../libsanitizer/sanitizer_common/sanitizer_linux.cc: In function 'sanitizer::uptr sanitizer::internal_clone(int (*)(void*), void*, int, void*, int*, void*, int*)':
| ../../../../libsanitizer/sanitizer_common/sanitizer_linux.cc:1540:1: error: r7 cannot be used in asm here
}

Reference: https://reviews.llvm.org/D50180

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb
index f3c7058..2f89c86 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb
@@ -5,3 +5,4 @@ require gcc-sanitizers.inc
 # sanitizer_linux.s:5749: Error: lo register required -- `ldr ip,[sp],#8'
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
+TARGET_CFLAGS_remove_arm = "${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fno-omit-frame-pointer', '', d)}"
-- 
2.7.4


