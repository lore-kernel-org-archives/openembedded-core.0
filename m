Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE06CAC5AA
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 07:57:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6099.1758787050784649509
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 00:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UGB282j+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1363bce358=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58P6ocqF3118093
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 07:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=EMaZbYI9JrABzhk/k0Rc
	XRahhmJOjKnp8/Du4s3MdrQ=; b=UGB282j+Q+8MWNDrbGdukB1aLK58GI9gHt4G
	2SIZxaag8NrB35GHqWBpdH89GnO8M6awWKBnlMkE7Bf8s7Gzt5AzLBRh8tD+i9VY
	G6VC1W3W+MQs+PU0BZ/taibFw8bkFeYcYQPmfTLrYYgCRrZ2hELPwScimEqCR46e
	YCgmhMuE50nDB8VYcIsQDjyJcBGDkW0u0yUpWtN6WagpFlZdp9IFvb3i1XQzeSyu
	nKdt1POly4I0Fe+u5ivCFYV6JXpUhDBIgiTQUO3l36fnoUkOhjByR7RWFloXdddK
	4J9vRDgo6rBpw6skaGtv00Dfh0AYHmRei3aLPfthR6uPuW71dg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499k89dy2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 07:57:29 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 25 Sep 2025 00:56:48 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 25 Sep 2025 00:56:47 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] xcb-util-errors: fix racing on out of source tree build
Date: Thu, 25 Sep 2025 15:56:46 +0800
Message-ID: <20250925075646.1146511-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDA3NCBTYWx0ZWRfXyCZEcEvCEx35
 ITrNzIUqF7psOU2c/e0PqCS5D2ZnknCKBuqGEoQevaBAc9iSJYlNcLuaH6vSI7pNUPVk0X1499v
 Qs2ySaW0q40BQhtwDGCi5G8Kru9xQkF96lIJPsy8BElit5wIpnMC7bYiI1csr47Icyn+D6AGe2U
 R2veFB+WbSxEsasCDyWNocOeZYeNEQ+U3TCKV411gf2wWT+vNf43O3nW09lFNvSgPvtdJWUjIJr
 p8WqFNf66gHkb5VrkWz5ZRnGMLvM5y+3vDUwcMyo7ytkWPIb1UZyiDD0Zf09NRC6wupc5OwdrPu
 Eb5IKt6PJEQ5EXyVh+DjDNGXljr8bgzqpwdFVpBsnqoZc43GJsdZibEAa9FAZw=
X-Authority-Analysis: v=2.4 cv=YZS95xRf c=1 sm=1 tr=0 ts=68d4f5e9 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=aR16PxjQAAAA:8 a=FazQQ4QE9-hlr99hXy8A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=zbFvvTOBjyH4ze5LlUjX:22
X-Proofpoint-GUID: Yw5S0dYma9oNi-pDddH6usjDG1Zo2-Uv
X-Proofpoint-ORIG-GUID: Yw5S0dYma9oNi-pDddH6usjDG1Zo2-Uv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 07:57:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224004

While building out of source tree, there is a racing issue
on the existence of dir ./src
...
python3 ../sources/xcb-util-errors-1.0.1/src/extensions.py src/extensions.c.tmp path-to/1.0.1/recipe-sysroot/usr/share/xcb/*.xml && \
mv src/extensions.c.tmp src/extensions.c
  File "src/extensions.py", line 91, in <module>
    output = open(output_file, "w")
FileNotFoundError: [Errno 2] No such file or directory: 'src/extensions.c.tmp'
make: *** [Makefile:1435: src/extensions.c] Error 1
...

Explicitly create dir ./src before generating src/extensions.c.tmp

Inherit python3native to instead of host python3 to run python script

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...x-racing-on-out-of-source-tree-build.patch | 38 +++++++++++++++++++
 .../xorg-lib/xcb-util-errors_1.0.1.bb         |  7 +++-
 2 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/xcb-util-errors/0001-fix-racing-on-out-of-source-tree-build.patch

diff --git a/meta/recipes-graphics/xorg-lib/xcb-util-errors/0001-fix-racing-on-out-of-source-tree-build.patch b/meta/recipes-graphics/xorg-lib/xcb-util-errors/0001-fix-racing-on-out-of-source-tree-build.patch
new file mode 100644
index 0000000000..c4b68470df
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/xcb-util-errors/0001-fix-racing-on-out-of-source-tree-build.patch
@@ -0,0 +1,38 @@
+From 54fdc743fbf0ea137b29c580fbeffe4afa610a78 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 25 Sep 2025 15:19:31 +0800
+Subject: [PATCH] fix racing on out of source tree build
+
+While building out of source tree, there is a racing issue
+on the existence of dir ./src
+...
+python3 ../sources/xcb-util-errors-1.0.1/src/extensions.py src/extensions.c.tmp path-to/1.0.1/recipe-sysroot/usr/share/xcb/*.xml && \
+mv src/extensions.c.tmp src/extensions.c
+  File "src/extensions.py", line 91, in <module>
+    output = open(output_file, "w")
+FileNotFoundError: [Errno 2] No such file or directory: 'src/extensions.c.tmp'
+make: *** [Makefile:1435: src/extensions.c] Error 1
+...
+
+Explicitly create dir ./src before generating src/extensions.c.tmp
+
+Upstream-Status: Submitted [xorg-devel@lists.x.org]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index bdf4a30..9defbb8 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -37,5 +37,5 @@ tests_test_LDADD = libxcb-errors.la $(XCB_LIBS)
+ CLEANFILES = src/extensions.c
+ 
+ src/extensions.c: src/extensions.py
+-	$(AM_V_GEN)$(PYTHON) $(srcdir)/src/extensions.py $@.tmp ${XCBPROTO_XCBINCLUDEDIR}/*.xml && \
++	mkdir -p src && $(AM_V_GEN)$(PYTHON) $(srcdir)/src/extensions.py $@.tmp ${XCBPROTO_XCBINCLUDEDIR}/*.xml && \
+ 	mv $@.tmp $@
+-- 
+2.34.1
+
diff --git a/meta/recipes-graphics/xorg-lib/xcb-util-errors_1.0.1.bb b/meta/recipes-graphics/xorg-lib/xcb-util-errors_1.0.1.bb
index 1f6e63d37c..5681409a09 100644
--- a/meta/recipes-graphics/xorg-lib/xcb-util-errors_1.0.1.bb
+++ b/meta/recipes-graphics/xorg-lib/xcb-util-errors_1.0.1.bb
@@ -1,12 +1,15 @@
 require recipes-graphics/xorg-lib/xcb-util.inc
 
+SRC_URI += " \
+    file://0001-fix-racing-on-out-of-source-tree-build.patch \
+"
 SUMMARY = "xcb-util-errors gives human readable names to error codes and event codes"
 
 DEPENDS += "xcb-util xorgproto"
 
-export PYTHON = "python3"
-
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c90ee77011043c608617f5323a523726"
 
 SRC_URI[sha256sum] = "5628c87b984259ad927bacd8a42958319c36bdf4b065887803c9d820fb80f357"
+
+inherit python3native
-- 
2.34.1


