Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64008C2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 07:32:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7451.1720510321788210235
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 00:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7920ee7300=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4690iMA7027767
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Jul 2024 07:32:01 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 406vw62e52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 07:32:00 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 00:31:59 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 00:31:58 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][master][PATCH] vulkan-samples: fix do_compile error when -Og enabled
Date: Tue, 9 Jul 2024 15:31:58 +0800
Message-ID: <20240709073158.1037728-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: pbBMh0pdsQjpV20GpEFOmQzVGnAapapD
X-Proofpoint-GUID: pbBMh0pdsQjpV20GpEFOmQzVGnAapapD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_15,2024-07-08_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407090049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 07:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201645

From: Changqing Li <changqing.li@windriver.com>

When debug build is enabled(-Og is used), vulkan-samples do_compile
failed with error:
In function 'ZSTD_compressBlock_lazy_generic',
    inlined from 'ZSTD_compressBlock_greedy' at TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_party/ktx/lib/basisu/zstd/zstd.c:21914:12:
TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_party/ktx/lib/basisu/zstd/zstd.c:21551:30: error: inlining failed in call to 'always_inline' 'ZSTD_HcFindBestMatch_selectMLS': function not considered for inlining
 | FORCE_INLINE_TEMPLATE size_t ZSTD_HcFindBestMatch_selectMLS (
      |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_party/ktx/lib/basisu/zstd/zstd.c:21736:32: note: called from here
|             size_t const ml2 = searchMax(ms, ip, iend, &offsetFound);

Refer [1], always_inline is not suggested to use with indirect function
call, replace always_inline with inline to fix the issue

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107931

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...ce-FORCE_INLINE_TEMPLATE-with-inline.patch | 52 +++++++++++++++++++
 .../vulkan/vulkan-samples_git.bb              |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-FORCE_INLINE_TEMPLATE-with-inline.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-FORCE_INLINE_TEMPLATE-with-inline.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-FORCE_INLINE_TEMPLATE-with-inline.patch
new file mode 100644
index 0000000000..22538d4119
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-FORCE_INLINE_TEMPLATE-with-inline.patch
@@ -0,0 +1,52 @@
+From a7bfe82a311c713b12bb83b8488574ad5c784f89 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 9 Jul 2024 04:29:11 +0000
+Subject: [PATCH] zstd.c: replace FORCE_INLINE_TEMPLATE with inline
+
+Refer [1], always-inline is not suggested to be used if you have indirect
++calls. so replace FORCE_INLINE_TEMPLATE with inline to fix error:
+In function 'ZSTD_compressBlock_lazy_generic',
+    inlined from 'ZSTD_compressBlock_greedy' at TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_party/ktx/lib/basisu/zstd/zstd.c:21914:12:
+TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_party/ktx/lib/basisu/zstd/zstd.c:21551:30: error: inlining failed in call to 'always_inline' 'ZSTD_HcFindBestMatch_selectMLS': function not considered for inlining
+ | FORCE_INLINE_TEMPLATE size_t ZSTD_HcFindBestMatch_selectMLS (
+      |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_party/ktx/lib/basisu/zstd/zstd.c:21736:32: note: called from here
+|             size_t const ml2 = searchMax(ms, ip, iend, &offsetFound);
+
+Upstream-Status: Inappropriate [ Latest upstream ktx don't have this part code ]
+
+Has report this issue to upstream Vulkan-Samples, refer [2]
+
+[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107931
+[2] https://github.com/KhronosGroup/Vulkan-Samples/issues/1089
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ lib/basisu/zstd/zstd.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/basisu/zstd/zstd.c b/lib/basisu/zstd/zstd.c
+index eaf13738..423f149e 100644
+--- a/lib/basisu/zstd/zstd.c
++++ b/lib/basisu/zstd/zstd.c
+@@ -21548,7 +21548,7 @@ size_t ZSTD_HcFindBestMatch_generic (
+ }
+ 
+ 
+-FORCE_INLINE_TEMPLATE size_t ZSTD_HcFindBestMatch_selectMLS (
++static inline size_t ZSTD_HcFindBestMatch_selectMLS (
+                         ZSTD_matchState_t* ms,
+                         const BYTE* ip, const BYTE* const iLimit,
+                         size_t* offsetPtr)
+@@ -21596,7 +21596,7 @@ static size_t ZSTD_HcFindBestMatch_dedicatedDictSearch_selectMLS (
+ }
+ 
+ 
+-FORCE_INLINE_TEMPLATE size_t ZSTD_HcFindBestMatch_extDict_selectMLS (
++static inline size_t ZSTD_HcFindBestMatch_extDict_selectMLS (
+                         ZSTD_matchState_t* ms,
+                         const BYTE* ip, const BYTE* const iLimit,
+                         size_t* offsetPtr)
+-- 
+2.44.0
+
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index d60c0f3190..4e688e44a7 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -10,6 +10,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protoc
            file://0001-Do-not-use-LFS64-functions-on-linux-musl.patch;patchdir=third_party/spdlog \
            file://0001-Deprecate-u8string_view.patch;patchdir=third_party/spdlog \
            file://32bit.patch \
+           file://0001-zstd.c-replace-FORCE_INLINE_TEMPLATE-with-inline.patch;patchdir=third_party/ktx \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.25.1


