Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90220C71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 05:01:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.23454.1750050057504583427
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 22:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82628a79e0=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G4FInB019702
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 05:00:56 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 478xa1hgdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 05:00:56 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 15 Jun 2025 22:00:55 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 15 Jun 2025 22:00:54 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libxml2: fix CVE-2025-6021
Date: Mon, 16 Jun 2025 13:00:53 +0800
Message-ID: <20250616050053.986442-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=PuiTbxM3 c=1 sm=1 tr=0 ts=684fa508 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=PYnjg3YJAAAA:8 a=xNf9USuDAAAA:8 a=GHR8O2WEAAAA:20 a=SSmOFEACAAAA:8 a=t7CeM3EgAAAA:8
 a=Mr0PqM1J5brvtOELVKUA:9 a=m9p5bXcFLgAA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: NRXbsF2jmfdvbQJX6SnsGVodttS1DLzn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAzMSBTYWx0ZWRfX1ZxehoJ4Yl5U ss7mzKlBAjvezekWLqXip3djF/NxWMviH7G4PH2Bk+2D8TWDjsHxjE5DU1VAImmFzblYwaFaHNP o/ymvi7Hag7DKDXHdMNNFoZA1FkUy22dnJtiglTG8zgCB7yxoTZ/lr70NVcfb8G/eoBoSuXP71G
 JvUika4NqE442jDsgkhk/FWwuZPuubDqfC1R/UbTTKz+paErvNv6+v+i2SFI1V+/KW97sOyQMr4 JLtcHbNPZjkr1cEB4h07z3wKlXoCwqaTXcm+mEq3jO7+5Zbw8SzSpz2XgMAapIG8N9D5Ls+loOP 4lKRPmolh9NjEQPhG63c0Iua9wnVE+oSb5WPs4a7Lhxh9BKaHnZuHWN8TFLUhHCQwLKl09uT6uA
 5loCpH+YgpPWdr7Qi9iD9V10eIbWRARUxLpyCW7j8DhUr8LPvZP3QLnYrUdAR9WjqOfw0af9
X-Proofpoint-GUID: NRXbsF2jmfdvbQJX6SnsGVodttS1DLzn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506160031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 05:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218767

According to [1]

A flaw was found in libxml2's xmlBuildQName function, where integer overflows
in buffer size calculations can lead to a stack-based buffer overflow. This
issue can result in memory corruption or a denial of service when processing
crafted input.

Refer debian [2], backport a fix [3] from upstream

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-6021
[2] https://security-tracker.debian.org/tracker/CVE-2025-6021
[3] https://gitlab.gnome.org/GNOME/libxml2/-/commit/acbbeef9f5dcdcc901c5f3fa14d583ef8cfd22f0

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libxml/libxml2/CVE-2025-6021.patch        | 59 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.14.3.bb    |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
new file mode 100644
index 00000000000..157486848b9
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
@@ -0,0 +1,59 @@
+From 33d7969baf541326a35e2fbe31943c46af8c71db Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 27 May 2025 12:53:17 +0200
+Subject: [PATCH] tree: Fix integer overflow in xmlBuildQName
+
+This issue affects memory safety and might receive a CVE ID later.
+
+Fixes #926.
+
+Signed-off-by: Nick Wellnhofer <wellnhofer@aevum.de>
+
+Add '#include <stdint.h>' to assure the definition of SIZE_MAX
+CVE: CVE-2025-6021
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/acbbeef9f5dcdcc901c5f3fa14d583ef8cfd22f0]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ tree.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/tree.c b/tree.c
+index 7454b07..22ec11c 100644
+--- a/tree.c
++++ b/tree.c
+@@ -23,6 +23,7 @@
+ #include <limits.h>
+ #include <ctype.h>
+ #include <stdlib.h>
++#include <stdint.h>
+ 
+ #ifdef LIBXML_ZLIB_ENABLED
+ #include <zlib.h>
+@@ -168,10 +169,10 @@ xmlGetParameterEntityFromDtd(const xmlDtd *dtd, const xmlChar *name) {
+ xmlChar *
+ xmlBuildQName(const xmlChar *ncname, const xmlChar *prefix,
+ 	      xmlChar *memory, int len) {
+-    int lenn, lenp;
++    size_t lenn, lenp;
+     xmlChar *ret;
+ 
+-    if (ncname == NULL) return(NULL);
++    if ((ncname == NULL) || (len < 0)) return(NULL);
+     if (prefix == NULL) return((xmlChar *) ncname);
+ 
+ #ifdef FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION
+@@ -182,8 +183,10 @@ xmlBuildQName(const xmlChar *ncname, const xmlChar *prefix,
+ 
+     lenn = strlen((char *) ncname);
+     lenp = strlen((char *) prefix);
++    if (lenn >= SIZE_MAX - lenp - 1)
++        return(NULL);
+ 
+-    if ((memory == NULL) || (len < lenn + lenp + 2)) {
++    if ((memory == NULL) || ((size_t) len < lenn + lenp + 2)) {
+ 	ret = xmlMalloc(lenn + lenp + 2);
+ 	if (ret == NULL)
+ 	    return(NULL);
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.14.3.bb b/meta/recipes-core/libxml/libxml2_2.14.3.bb
index da75cbe4507..4baab59186e 100644
--- a/meta/recipes-core/libxml/libxml2_2.14.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.14.3.bb
@@ -18,6 +18,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://run-ptest \
            file://install-tests.patch \
            file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch \
+           file://CVE-2025-6021.patch \
            "
 
 SRC_URI[archive.sha256sum] = "6de55cacc8c2bc758f2ef6f93c313cb30e4dd5d84ac5d3c7ccbd9344d8cc6833"
-- 
2.34.1


