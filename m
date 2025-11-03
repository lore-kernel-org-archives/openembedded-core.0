Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B6CCCF9FE
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 06:45:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15020.1762152320547595925
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 22:45:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JdjGlzun;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3402e2e963=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A34kgRM190623
	for <openembedded-core@lists.openembedded.org>; Sun, 2 Nov 2025 22:45:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=FfXYwpeQxSpEV0nPensM
	Z/EhBy5TaeipjnCtDHKrQfU=; b=JdjGlzunfw+sSclzP0L7FFzqoCfQaE0iQbtB
	YMlh4RMwVP3IYEO4AQroZm7wuXMC2xJlif8xeeOUGcYhHKNPCQJhJhYEOLsIDIbR
	tK3lN2evJDH86NyhyR83igYcGD2L3taY8/Iu1AN1zCMeymHu6Ypl2mEIIRDafVL2
	TkN7aWTp1zR2pwMoN7VUeq9L0nxHy1g+ZunhpMVZO4BlWMDhN0E8vVPQHh3aD2Rw
	aVSZtc4XxS/GTp4eJFR52yGbEk1AMX8XsJ30HiIT7Rgvj7tFlxXK9XwrtZv3+AeQ
	LbK/NcVXTWjGfX1DJ0xQC1KenxFgUKMK7SpnpcmgIXg8ykN1tA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a5hqeh65h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 22:45:19 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 2 Nov 2025 22:45:19 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 2 Nov 2025 22:45:18 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] vte: support reproducibility when debug build is enabled
Date: Mon, 3 Nov 2025 14:45:17 +0800
Message-ID: <20251103064517.1211222-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=HJPO14tv c=1 sm=1 tr=0 ts=69084f7f cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=SsMK-6ewAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=GNezoTjiGtXpW3FoNYUA:9 a=49hUO6naoDravHwzbBTq:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Ve5g6Wh7ekn3U0NM2fgbsJ4yL5itKF6D
X-Proofpoint-ORIG-GUID: Ve5g6Wh7ekn3U0NM2fgbsJ4yL5itKF6D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA2MSBTYWx0ZWRfX9IBf/cAyO17G
 bVvAP0NVgjdQ8YX2LRq87ZGozazTNWPI/TzpMHpSq3YoZfqe3bzRDDv2yWT2MfAnff0hvj6xyif
 8l4WivLqgzcvFyGu+qzYt2naYY/TdAFk3IqIm9k2Tnnu0zTgX8DjDMzdkfNIHXmhHThlvXw9GPv
 SolM3IyeWkrkDG63kBH2SNTWsU/hzMu599NxV1ZySZXCaydAZrl8ujBOJVvgjkiszbRGpd71YPN
 4yCMao2ppkkry6kx9qnyOqvmWR6zyniHEuU2Qwr1Bj+Q3f1j9/1z/Lt6D5MNusIn2sRstGVRHo6
 nHDQr3wGxWlngiGRZjwoNId012e55q+MwJJoYaRFGj1xllYadvgNCHrAwNJu7hsNR42s1G8reGf
 BKhPFLFjEwLKRivh0qEyipZbPEcxkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 06:45:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225590

When debug build is enabled, there is a build path issue in source file
which caused build is not reproducible
...subprojects/simdutf/simdutf.h...
 1 /* auto-generated on 2025-03-17 16:13:41 -0400. Do not edit! */
 2 /* begin file include/simdutf.h */
 3 // /build-dir/vte-0.82.1/subprojects/simdutf/include/simdutf.h:1
 4 #ifndef SIMDUTF_H
...subprojects/simdutf/simdutf.h...

The source file is auto generated by python script amalgamate.py,
apply a fix to the script to use relative path to instead

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...rt-reproducibility-for-debug-sources.patch | 48 +++++++++++++++++++
 meta/recipes-support/vte/vte_0.82.1.bb        |  4 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/vte/vte/0001-support-reproducibility-for-debug-sources.patch

diff --git a/meta/recipes-support/vte/vte/0001-support-reproducibility-for-debug-sources.patch b/meta/recipes-support/vte/vte/0001-support-reproducibility-for-debug-sources.patch
new file mode 100644
index 0000000000..20e8f71c0e
--- /dev/null
+++ b/meta/recipes-support/vte/vte/0001-support-reproducibility-for-debug-sources.patch
@@ -0,0 +1,48 @@
+From 0959004adbe46f88d558d2ce61b496c662c196f5 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 3 Nov 2025 06:13:11 +0000
+Subject: [PATCH] support reproducibility for debug sources
+
+While option --debug-sources is used, the generated source file contains
+build path comments which caused the build is not reproducible [1]
+...subprojects/simdutf/simdutf.h...
+ 1 /* auto-generated on 2025-03-17 16:13:41 -0400. Do not edit! */
+ 2 /* begin file include/simdutf.h */
+ 3 // /build-dir/vte-0.82.1/subprojects/simdutf/include/simdutf.h:1
+ 4 #ifndef SIMDUTF_H
+...subprojects/simdutf/simdutf.h...
+
+After apply this commit, use relative path to instead
+...subprojects/simdutf/simdutf.h...
+ 1 /* auto-generated on 2025-03-17 16:13:41 -0400. Do not edit! */
+ 2 /* begin file include/simdutf.h */
+ 3 // include/simdutf.h:1
+ 4 #ifndef SIMDUTF_H
+...subprojects/simdutf/simdutf.h...
+
+[1] https://reproducible-builds.org/
+
+Upstream-Status: Submitted [https://github.com/simdutf/simdutf/pull/848]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ singleheader/amalgamate.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/singleheader/amalgamate.py b/singleheader/amalgamate.py
+index 190b2f6..75e0d78 100755
+--- a/singleheader/amalgamate.py
++++ b/singleheader/amalgamate.py
+@@ -385,7 +385,8 @@ def filter_features(file):
+                 current_features = None
+             elif enabled:
+                 if context.args.debug_sources and not prev_line.endswith('\\'):
+-                    yield f"// {file}:{lineno}"
++                    RELFILE = os.path.relpath(file, PROJECTPATH)
++                    yield f"// {RELFILE}:{lineno}"
+ 
+                 if line or (not line and prev_line):
+                     yield line
+-- 
+2.48.1
+
diff --git a/meta/recipes-support/vte/vte_0.82.1.bb b/meta/recipes-support/vte/vte_0.82.1.bb
index 4fa8115a20..b5d6f2fb62 100644
--- a/meta/recipes-support/vte/vte_0.82.1.bb
+++ b/meta/recipes-support/vte/vte_0.82.1.bb
@@ -17,7 +17,9 @@ GIR_MESON_OPTION = 'gir'
 GIDOCGEN_MESON_OPTION = "docs"
 inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala
 
-SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
+SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
+            file://0001-support-reproducibility-for-debug-sources.patch;patchdir=./subprojects/simdutf \
+"
 
 SRC_URI[archive.sha256sum] = "79376d70402d271e2d38424418e1aea72357934d272e321e3906b71706a78e3a"
 
-- 
2.34.1


