Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2D7C6FD1F
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 15:54:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15991.1678982051846820600
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 08:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cQzdZhiN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=24391c9c97=joe.slater@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32GBR1hA015810
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 15:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=4yxP5zXmt/jAuDq7mw/NTuhwQnyM9nUjSRabCG7N18I=;
 b=cQzdZhiN6MnPNT+a+a96B/fqOnfb+c4elM4ANY/sx8N1wjZ25f/ZI40N+KjdF/FY0oBV
 rnadjUCvugpl3lBxfZzTDPpDoGzTIB6AhPv90jAZ39xok6nVY09e9frx19wy0109X45j
 4n08fEKhOcIT20R/+PFCqJGCNDgk7hH2Tbv8a6MOCFQRWlbmz5gHet+8ZOMIFEIRsGuT
 18EPp9zMt8TD/bgMfAp5YSogmD44e48jPonHsp54dfl7j06qOEn1Fman37IjcVEUexr/
 m+cRCseqazo4rmWb3MUwhhH1361nrUbNAQULpbIQ6uRp/SPU5B/PAf9ps2CMs2hS+jYf pA== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pbq1h8qqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 15:54:10 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Thu, 16 Mar 2023 08:54:09 -0700
Received: from ala-jslater-lx1.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Thu, 16 Mar 2023 08:54:09 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [kirkstone][oe-core][PATCH 1/1] python3: fix CVE-2023-24329
Date: Thu, 16 Mar 2023 08:54:09 -0700
Message-ID: <20230316155409.514246-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: bgg0iaws2IOFBoP3mGzKFww2xHqvy3k2
X-Proofpoint-GUID: bgg0iaws2IOFBoP3mGzKFww2xHqvy3k2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_10,2023-03-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 mlxlogscore=962 impostorscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 15:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178707

Backport fix from cpython 3.11 branch.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../python/python3/cve-2023-24329.patch       | 50 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.10.9.bb |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/cve-2023-24329.patch

diff --git a/meta/recipes-devtools/python/python3/cve-2023-24329.patch b/meta/recipes-devtools/python/python3/cve-2023-24329.patch
new file mode 100644
index 0000000000..d47425d239
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/cve-2023-24329.patch
@@ -0,0 +1,50 @@
+From 72d356e3584ebfb8e813a8e9f2cd3dccf233c0d9 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Sun, 13 Nov 2022 11:00:25 -0800
+Subject: [PATCH] gh-99418: Make urllib.parse.urlparse enforce that a scheme
+ must begin with an alphabetical ASCII character. (GH-99421)
+
+Prevent urllib.parse.urlparse from accepting schemes that don't begin with an alphabetical ASCII character.
+
+RFC 3986 defines a scheme like this: `scheme = ALPHA *( ALPHA / DIGIT / "+" / "-" / "." )`
+RFC 2234 defines an ALPHA like this: `ALPHA = %x41-5A / %x61-7A`
+
+The WHATWG URL spec defines a scheme like this:
+`"A URL-scheme string must be one ASCII alpha, followed by zero or more of ASCII alphanumeric, U+002B (+), U+002D (-), and U+002E (.)."`
+(cherry picked from commit 439b9cfaf43080e91c4ad69f312f21fa098befc7)
+
+Co-authored-by: Ben Kallus <49924171+kenballus@users.noreply.github.com>
+--- end original header ---
+
+CVE: CVE-2023-24329
+
+Upstream-Status: Backport [see below]
+
+Taken from https://github.com/python/cpython.git
+commit 72d356e3584ebfb8e813a8e9f2cd3dccf233c0d9
+
+CVE fix extracted; test case and update to NEWS abandoned.
+Defuzzed.
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ Lib/urllib/parse.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Lib/urllib/parse.py b/Lib/urllib/parse.py
+index 26ddf30..1c53acb 100644
+--- a/Lib/urllib/parse.py
++++ b/Lib/urllib/parse.py
+@@ -469,7 +469,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
+         clear_cache()
+     netloc = query = fragment = ''
+     i = url.find(':')
+-    if i > 0:
++    if i > 0 and url[0].isascii() and url[0].isalpha():
+         for c in url[:i]:
+             if c not in scheme_chars:
+                 break
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3_3.10.9.bb b/meta/recipes-devtools/python/python3_3.10.9.bb
index d6b7a618c1..867958c0fb 100644
--- a/meta/recipes-devtools/python/python3_3.10.9.bb
+++ b/meta/recipes-devtools/python/python3_3.10.9.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
+           file://cve-2023-24329.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.25.1


