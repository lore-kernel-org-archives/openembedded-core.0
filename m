Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4FF096007A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 08:42:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3M8fltA022504
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 22 Apr 2019 01:41:57 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Mon, 22 Apr 2019 01:41:34 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <raj.khem@gmail.com>,
	<richard.purdie@linuxfoundation.org>
Date: Mon, 22 Apr 2019 16:41:32 +0800
Message-ID: <1555922492-420964-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAMKF1srdh__hbAEe8jyDx271T831dYW+RMhZTMHkc9hzuLh32w@mail.gmail.com>
References: <CAMKF1srdh__hbAEe8jyDx271T831dYW+RMhZTMHkc9hzuLh32w@mail.gmail.com>
MIME-Version: 1.0
Subject: [PATCH v4] gcc-sanitizers: fix -Werror=maybe-uninitialized issue
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
X-List-Received-Date: Mon, 22 Apr 2019 08:42:40 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

When DEBUG_BUILD = "1" added in local.conf, there
comes below build error when "bitbake gcc-sanitizers":
| ./../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c: In function 'elf_is_symlink':
| ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
|   return S_ISLNK (st.st_mode);

After commit[16643b0322 bitbake.conf: Use -Og in DEBUG_OPTIMIZATION]
introduced, "-Og" added to compiler when debug
build enabled.

Per https://gcc.gnu.org/ml/gcc-patches/2019-04/msg00315.html,
the gcc upstream thinks the warning is a false
positive and suggests to use -O2 rather than -Og
or -O1 when compiling that file, so pass -Wno-error
to compiler when -Og is used to silence the error.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index e5e8452..8b1d1c9 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -45,6 +45,9 @@ INHIBIT_DEFAULT_DEPS = "1"
 ALLOW_EMPTY_${PN} = "1"
 DEPENDS = "gcc-runtime virtual/${TARGET_PREFIX}gcc"
 
+# used to fix ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+DEBUG_OPTIMIZATION_append = " -Wno-error"
+
 BBCLASSEXTEND = "nativesdk"
 
 PACKAGES = "${PN} ${PN}-dbg"
-- 
2.7.4


