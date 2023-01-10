Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBCBC46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 08:18:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.98813.1673338729565873064
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jan 2023 00:18:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Cv8jcfA4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0374712f91=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30A898xM030758
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 00:18:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=HMrHdn1uCMjOs/v21V4eGtssuytaLip6/5vcDWA02QI=;
 b=Cv8jcfA4fLz5a6VlSfeMvQ93ZfqM1HXvcqZhydGsPDBeH1Q8mL/t7CYikyFNjne9HngL
 Eq4GiDxwPI8D8X7XU11w2AfO9KY1UQtJzlf+eZU+Uz6uB/GQfI2O/WKtfaONozxT/u8Y
 fF2J/S6DxHlsnQWaQdOCYTlHooFvyR2hHpXvJ8Nx3yeU+sLE6jvvzj2S+DtgLBYFYf3+
 qID/O28W2Bo/lRI8FnYUp8KsNToSAQfJngCBINGrgF5pq0MV5P9UEdunUhNsyvMDrB7X
 HljgspViH7lOBcP7NUClEljWtjMENIs91c83wB2a86PtV1846i0KSLICiXnAwverpFuh tQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3my4w8td3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 00:18:49 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 10 Jan 2023 00:18:48 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Tue, 10 Jan 2023 00:18:46 -0800
From: Narpat Mali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <archana.polampalli@windriver.com>, <hari.gpillai@windriver.com>,
        "Narpat
 Mali" <narpat.mali@windriver.com>
Subject: [OE-core][kirkstone][PATCH 1/1] python3-setuptools: fix for CVE-2022-40897
Date: Tue, 10 Jan 2023 08:18:05 +0000
Message-ID: <20230110081805.2793377-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: vJ5HnYA0K9rZaS21JiG0BF1fwQKtH67Z
X-Proofpoint-GUID: vJ5HnYA0K9rZaS21JiG0BF1fwQKtH67Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_02,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 mlxlogscore=959 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301100050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 08:18:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175708

Python Packaging Authority (PyPA) setuptools before 65.5.1 allows remote attackers
to cause a denial of service via HTML in a crafted package or custom PackageIndex
page. There is a Regular Expression Denial of Service (ReDoS) in package_index.py.

CVE: CVE-2022-40897

Upstream-Status: Backport [https://github.com/pypa/setuptools/commit/43a9c9bfa6aa626ec2a22540bea28d2ca77964be]

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 ...-of-whitespace-to-search-backtrack.-.patch | 31 +++++++++++++++++++
 .../python/python3-setuptools_59.5.0.bb       |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch b/meta/recipes-devtools/python/python3-setuptools/0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch
new file mode 100644
index 0000000000..20a13da7bc
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch
@@ -0,0 +1,31 @@
+From 9e9f617a83f6593b476669030b0347d48e831c3f Mon Sep 17 00:00:00 2001
+From: Narpat Mali <narpat.mali@windriver.com>
+Date: Mon, 9 Jan 2023 14:45:05 +0000
+Subject: [PATCH] Limit the amount of whitespace to search/backtrack. Fixes
+ #3659.
+
+CVE: CVE-2022-40897
+
+Upstream-Status: Backport [https://github.com/pypa/setuptools/commit/43a9c9bfa6aa626ec2a22540bea28d2ca77964be]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ setuptools/package_index.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setuptools/package_index.py b/setuptools/package_index.py
+index 270e7f3..e93fcc6 100644
+--- a/setuptools/package_index.py
++++ b/setuptools/package_index.py
+@@ -197,7 +197,7 @@ def unique_values(func):
+     return wrapper
+ 
+ 
+-REL = re.compile(r"""<([^>]*\srel\s*=\s*['"]?([^'">]+)[^>]*)>""", re.I)
++REL = re.compile(r"""<([^>]*\srel\s{0,10}=\s{0,10}['"]?([^'" >]+)[^>]*)>""", re.I)
+ # this line is here to fix emacs' cruddy broken syntax highlighting
+ 
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
index f2810e18d3..5f2676a04a 100644
--- a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
@@ -11,6 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += "\
     file://0001-change-shebang-to-python3.patch \
     file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch \
+    file://0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch \
 "
 
 SRC_URI[sha256sum] = "d144f85102f999444d06f9c0e8c737fd0194f10f2f7e5fdb77573f6e2fa4fad0"
-- 
2.32.0


