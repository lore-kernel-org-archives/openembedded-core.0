Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A091BD64086
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 07:27:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9105.1765956419675309968
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 23:27:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=feJ8qOBv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4446d33a3f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH4AuSU2367653
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 07:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=mKo2XA3TuxVdbaokSfNt
	3sKDgYM64/tBA+CevmrS+5A=; b=feJ8qOBvY1vcAfvkYNkjJHy7avr8VcVXLcbG
	u1RiTMqCSrz0jWBG3aQfGnLez+otzD0Q9AYdjRUOz79KCWu/1VneI5l73KHUt+BY
	9zi3QfVCCiDMcPEOiw1FeBd0EwiEZWAPyu3RysmBVPW96dLJxX5H3denikpNBT09
	kg8NxyyYpun2gPm8AMP+3Ed8pHjEZy/3jUe7wcCcE1wwc0PEuszdWmg05C9IAkhH
	8Z53imVn+BJlX/wN96pvDQW+zmBtqmaKDLzo/WzQ22x98gmqy3bNzS/V2jtRsDxa
	xad3qwNbxldmtG9MVo+ZgBedCW57CJ8HLwKxgxzt+QksTf/B1Q==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0br8bx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 07:26:57 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 16 Dec 2025 23:26:56 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 16 Dec 2025 23:26:55 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] gcc: fix ICE when building webkitgtk
Date: Wed, 17 Dec 2025 15:26:53 +0800
Message-ID: <20251217072654.326736-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA1NyBTYWx0ZWRfXyRpD6Uo1sMIh
 1Yy6m3d0SQyYOOm0BaGUfLZq8JHKf61CmAA/8ynDCfFUMaqb9hKwgpcD2w55yci9kfhuO/v7ZaL
 2JdkpRa0uZ8zkzCoPx8zBlKw0T28NmY1B96WZ7nZGXobNsaROrFXyhn/H7n76WCN6iCvAvAd9tE
 xOQyQRV7NchxCiJOclLJqlGIFbKNWVJtkpQaSdDd4SoQ+HUcj/WxbVjEBfsri7XsGeRlv+9GTg5
 z2HmWnUoYVZgFyPkw6gi0NnI411+HS8RrqNA3tUJhLvcxCN8bmhL0te6NwDCrSlzmLJVBToYNbp
 Np0aMCZG2nHtFZRzCrEHmMAoi9m0DHEDqVKqUNR2cNEr+Ribsvka9kI1tVI0lLT2KGPwhJPj4ci
 +UKHhJkvLRkPRwruGtVlPWx+W0SW2Q==
X-Proofpoint-ORIG-GUID: WX2Jj26ZO_a-Q1cwoZQLNUs92iHf5qjq
X-Proofpoint-GUID: WX2Jj26ZO_a-Q1cwoZQLNUs92iHf5qjq
X-Authority-Analysis: v=2.4 cv=C+HkCAP+ c=1 sm=1 tr=0 ts=69425b41 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8
 a=20KFwNOVAAAA:8 a=3rjsNpC4oig8xlRUbUIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 07:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228000

Compile webkitgtk failed with ICE
...
|tmp/work/x86-64-v3-oe-linux/webkitgtk/2.50.0/sources/webkitgtk-2.50.0/
Source/WebCore/platform/ScrollAnimationMomentum.cpp:96:6: internal compiler
error: in expand_debug_locations, at cfgexpand.cc:6042
...

Backport a patch from upstream to fix the issue [1][2]

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=122394
[2] https://gcc.gnu.org/cgit/gcc/commit/?id=e55dcff97708a4937dc4d8736b8b3074ebbff6f3

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-15.2.inc        |  1 +
 .../gcc/gcc/0027-gcc15-pr122394.patch         | 88 +++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch

diff --git a/meta/recipes-devtools/gcc/gcc-15.2.inc b/meta/recipes-devtools/gcc/gcc-15.2.inc
index 3ed4600361..b02cc4fcb9 100644
--- a/meta/recipes-devtools/gcc/gcc-15.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.2.inc
@@ -73,6 +73,7 @@ SRC_URI = "${BASEURI} \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0026-fix-pr90579-testcases.patch \
+           file://0027-gcc15-pr122394.patch \
            file://0001-mapper-localhost-might-not-be-known.patch \
 "
 
diff --git a/meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch b/meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch
new file mode 100644
index 0000000000..9ee371cef7
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch
@@ -0,0 +1,88 @@
+From e55dcff97708a4937dc4d8736b8b3074ebbff6f3 Mon Sep 17 00:00:00 2001
+From: Jakub Jelinek <jakub@redhat.com>
+Date: Mon, 27 Oct 2025 17:43:17 +0100
+Subject: phiopt: Fix up DEBUG_EXPR_DECL creation in spaceship_replacement
+ [PR122394]
+
+The following testcase ICEs in gcc 15 (and is at least latent in 12-14 too),
+because the DEBUG_EXPR_DECL has incorrect mode.  It has
+TREE_TYPE (orig_use_lhs) type, but TYPE_MODE (type) rather than
+TYPE_MODE (TREE_TYPE (orig_use_lhs)) where the two types are sometimes
+the same, but sometimes different (same if !has_cast_debug_uses, different
+otherwise).
+
+Though, there wouldn't be the this issue if it used the proper API to create
+the DEBUG_EXPR_DECL which takes care of everything.  This is the sole
+spot that doesn't use that API.
+
+Doesn't affect the trunk because the code has been removed and replaced with
+different stuff after the libstdc++ ABI change in r16-3474.
+Before r15-5557 the mode has been always wrong because this was done only
+for has_cast_debug_uses.  And the bug has been introduced with r12-5490.
+
+Enough archeology, while it could be fixed by changing the second
+SET_DECL_MODE argument, I think it is better to use build_debug_expr_decl.
+
+2025-10-27  Jakub Jelinek  <jakub@redhat.com>
+
+	PR tree-optimization/122394
+	* tree-ssa-phiopt.cc (spaceship_replacement): Use
+	build_debug_expr_decl instead of manually building DEBUG_EXPR_DECL
+	and getting SET_DECL_MODE wrong.
+
+	* g++.dg/opt/pr122394.C: New test.
+
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=e55dcff97708a4937dc4d8736b8b3074ebbff6f3]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ gcc/testsuite/g++.dg/opt/pr122394.C | 20 ++++++++++++++++++++
+ gcc/tree-ssa-phiopt.cc              |  6 ++----
+ 2 files changed, 22 insertions(+), 4 deletions(-)
+ create mode 100644 gcc/testsuite/g++.dg/opt/pr122394.C
+
+diff --git a/gcc/testsuite/g++.dg/opt/pr122394.C b/gcc/testsuite/g++.dg/opt/pr122394.C
+new file mode 100644
+index 000000000000..1f84bebd74c2
+--- /dev/null
++++ b/gcc/testsuite/g++.dg/opt/pr122394.C
+@@ -0,0 +1,20 @@
++// PR tree-optimization/122394
++// { dg-do compile { target c++23 } }
++// { dg-options "-O1 -g" }
++
++#include <compare>
++
++struct A {
++  friend auto operator<=> (A, A) = default;
++  double a;
++};
++void foo ();
++A b, c;
++
++void
++bar ()
++{
++  bool d = c >= b;
++  if (d)
++    foo ();
++}
+diff --git a/gcc/tree-ssa-phiopt.cc b/gcc/tree-ssa-phiopt.cc
+index aaebae6b38c0..3e0ad9d3bb09 100644
+--- a/gcc/tree-ssa-phiopt.cc
++++ b/gcc/tree-ssa-phiopt.cc
+@@ -2995,10 +2995,8 @@ spaceship_replacement (basic_block cond_bb, basic_block middle_bb,
+ 	      if (has_cast_debug_uses
+ 		  || (HONOR_NANS (TREE_TYPE (lhs1)) && !is_cast))
+ 		{
+-		  tree temp3 = make_node (DEBUG_EXPR_DECL);
+-		  DECL_ARTIFICIAL (temp3) = 1;
+-		  TREE_TYPE (temp3) = TREE_TYPE (orig_use_lhs);
+-		  SET_DECL_MODE (temp3, TYPE_MODE (type));
++		  tree temp3
++		    = build_debug_expr_decl (TREE_TYPE (orig_use_lhs));
+ 		  if (has_cast_debug_uses)
+ 		    t = fold_convert (TREE_TYPE (temp3), temp2);
+ 		  else
+-- 
+cgit 
+
-- 
2.34.1


