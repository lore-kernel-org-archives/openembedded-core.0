Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE418C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 08:06:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17624.1739952382287591083
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 00:06:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41458e6591=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J5UZLp018399
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 08:06:21 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00kgpq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 08:06:21 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 19 Feb 2025 00:06:20 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 19 Feb 2025 00:06:19 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 5/6] u-boot: fix CVE-2024-57258
Date: Wed, 19 Feb 2025 16:06:13 +0800
Message-ID: <20250219080614.902786-5-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219080614.902786-1-hongxu.jia@windriver.com>
References: <20250219080614.902786-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: bW2auiXOPa_94sPVEA_U3SBG2M3BcpdQ
X-Proofpoint-ORIG-GUID: bW2auiXOPa_94sPVEA_U3SBG2M3BcpdQ
X-Authority-Analysis: v=2.4 cv=BvtnwZX5 c=1 sm=1 tr=0 ts=67b590fd cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=PYnjg3YJAAAA:8 a=YfCOm-DyAAAA:8 a=t7CeM3EgAAAA:8 a=cm27Pg_UAAAA:8 a=cQx7QxLJpbgKyGtIH1UA:9
 a=zQLMK8awuJ6_Hvp-_9Ux:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_03,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502190063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 08:06:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211677

Integer overflows in memory allocation in Das U-Boot before 2025.01-rc1
occur for a crafted squashfs filesystem via sbrk, via request2size,
or because ptrdiff_t is mishandled on x86_64.

https://nvd.nist.gov/vuln/detail/CVE-2024-57258

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../u-boot/files/CVE-2024-57258-1.patch       | 47 +++++++++++++++++++
 .../u-boot/files/CVE-2024-57258-2.patch       | 43 +++++++++++++++++
 .../u-boot/files/CVE-2024-57258-3.patch       | 40 ++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |  3 ++
 4 files changed, 133 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57258-1.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57258-2.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57258-3.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2024-57258-1.patch b/meta/recipes-bsp/u-boot/files/CVE-2024-57258-1.patch
new file mode 100644
index 0000000000..d33a4260ba
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2024-57258-1.patch
@@ -0,0 +1,47 @@
+From 50ab41c3628dedeca1a331dd86dd203b73faea74 Mon Sep 17 00:00:00 2001
+From: Richard Weinberger <richard@nod.at>
+Date: Fri, 2 Aug 2024 12:08:45 +0200
+Subject: [PATCH 5/8] dlmalloc: Fix integer overflow in sbrk()
+
+Make sure that the new break is within mem_malloc_start
+and mem_malloc_end before making progress.
+ulong new = old + increment; can overflow for extremely large
+increment values and memset() can get wrongly called.
+
+Signed-off-by: Richard Weinberger <richard@nod.at>
+Reviewed-by: Simon Glass <sjg@chromium.org>
+
+CVE: CVE-2024-57258
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/0a10b49206a29b4aa2f80233a3e53ca0466bb0b3]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ common/dlmalloc.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/common/dlmalloc.c b/common/dlmalloc.c
+index de3f0422..bae2a27c 100644
+--- a/common/dlmalloc.c
++++ b/common/dlmalloc.c
+@@ -591,6 +591,9 @@ void *sbrk(ptrdiff_t increment)
+ 	ulong old = mem_malloc_brk;
+ 	ulong new = old + increment;
+ 
++	if ((new < mem_malloc_start) || (new > mem_malloc_end))
++		return (void *)MORECORE_FAILURE;
++
+ 	/*
+ 	 * if we are giving memory back make sure we clear it out since
+ 	 * we set MORECORE_CLEARS to 1
+@@ -598,9 +601,6 @@ void *sbrk(ptrdiff_t increment)
+ 	if (increment < 0)
+ 		memset((void *)new, 0, -increment);
+ 
+-	if ((new < mem_malloc_start) || (new > mem_malloc_end))
+-		return (void *)MORECORE_FAILURE;
+-
+ 	mem_malloc_brk = new;
+ 
+ 	return (void *)old;
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/u-boot/files/CVE-2024-57258-2.patch b/meta/recipes-bsp/u-boot/files/CVE-2024-57258-2.patch
new file mode 100644
index 0000000000..688e2c64d8
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2024-57258-2.patch
@@ -0,0 +1,43 @@
+From db7c626204f488a802a2e58b7a788b11fde6be7d Mon Sep 17 00:00:00 2001
+From: Richard Weinberger <richard@nod.at>
+Date: Fri, 2 Aug 2024 12:08:44 +0200
+Subject: [PATCH 6/8] dlmalloc: Fix integer overflow in request2size()
+
+req is of type size_t, casting it to long opens the door
+for an integer overflow.
+Values between LONG_MAX - (SIZE_SZ + MALLOC_ALIGN_MASK) - 1 and LONG_MAX
+cause and overflow such that request2size() returns MINSIZE.
+
+Fix by removing the cast.
+The origin of the cast is unclear, it's in u-boot and ppcboot since ever
+and predates the CVS history.
+Doug Lea's original dlmalloc implementation also doesn't have it.
+
+Signed-off-by: Richard Weinberger <richard@nod.at>
+Reviewed-by: Simon Glass <sjg@chromium.org>
+
+CVE: CVE-2024-57258
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/8642b2178d2c4002c99a0b69a845a48f2ae2706f]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ common/dlmalloc.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/common/dlmalloc.c b/common/dlmalloc.c
+index bae2a27c..1ac4ee9f 100644
+--- a/common/dlmalloc.c
++++ b/common/dlmalloc.c
+@@ -379,8 +379,8 @@ nextchunk-> +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+ /* pad request bytes into a usable size */
+ 
+ #define request2size(req) \
+- (((long)((req) + (SIZE_SZ + MALLOC_ALIGN_MASK)) < \
+-  (long)(MINSIZE + MALLOC_ALIGN_MASK)) ? MINSIZE : \
++ ((((req) + (SIZE_SZ + MALLOC_ALIGN_MASK)) < \
++  (MINSIZE + MALLOC_ALIGN_MASK)) ? MINSIZE : \
+    (((req) + (SIZE_SZ + MALLOC_ALIGN_MASK)) & ~(MALLOC_ALIGN_MASK)))
+ 
+ /* Check if m has acceptable alignment */
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/u-boot/files/CVE-2024-57258-3.patch b/meta/recipes-bsp/u-boot/files/CVE-2024-57258-3.patch
new file mode 100644
index 0000000000..2c8a7c9d91
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2024-57258-3.patch
@@ -0,0 +1,40 @@
+From 37095a204127b60b5e00c4c5d435d6e48a6a1c51 Mon Sep 17 00:00:00 2001
+From: Richard Weinberger <richard@nod.at>
+Date: Fri, 2 Aug 2024 12:08:43 +0200
+Subject: [PATCH 7/8] x86: Fix ptrdiff_t for x86_64
+
+sbrk() assumes ptrdiff_t is large enough to enlarge/shrink the heap
+by LONG_MIN/LONG_MAX.
+So, use the long type, also to match the rest of the Linux ecosystem.
+
+Signed-off-by: Richard Weinberger <richard@nod.at>
+Reviewed-by: Simon Glass <sjg@chromium.org>
+
+CVE: CVE-2024-57258
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/c17b2a05dd50a3ba437e6373093a0d6a359cdee0]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ arch/x86/include/asm/posix_types.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/arch/x86/include/asm/posix_types.h b/arch/x86/include/asm/posix_types.h
+index dbcea7f4..e1ed9bca 100644
+--- a/arch/x86/include/asm/posix_types.h
++++ b/arch/x86/include/asm/posix_types.h
+@@ -20,11 +20,12 @@ typedef unsigned short	__kernel_gid_t;
+ #if defined(__x86_64__)
+ typedef unsigned long	__kernel_size_t;
+ typedef long		__kernel_ssize_t;
++typedef long		__kernel_ptrdiff_t;
+ #else
+ typedef unsigned int	__kernel_size_t;
+ typedef int		__kernel_ssize_t;
+-#endif
+ typedef int		__kernel_ptrdiff_t;
++#endif
+ typedef long		__kernel_time_t;
+ typedef long		__kernel_suseconds_t;
+ typedef long		__kernel_clock_t;
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index c68e3e442f..cdee9fc721 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -15,6 +15,9 @@ SRC_URI +=       " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
                    file://CVE-2024-57255.patch \
                    file://CVE-2024-57256.patch \
                    file://CVE-2024-57257.patch \
+                   file://CVE-2024-57258-1.patch \
+                   file://CVE-2024-57258-2.patch \
+                   file://CVE-2024-57258-3.patch \
                  "
 
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.34.1


