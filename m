Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311DBC83F21
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 10:20:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.75052.1752488423839219109
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 03:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=92904be4b3=divya.chellam@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56E8AMbe1087877
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 03:20:23 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47uk031rch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 03:20:23 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 14 Jul 2025 03:20:21 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 1/2] libxml2: fix CVE-2025-6021
Date: Mon, 14 Jul 2025 15:49:57 +0530
Message-ID: <20250714101958.3803618-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=RrjFLDmK c=1 sm=1 tr=0 ts=6874d9e7 cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=HCiNrPZc1L8A:10 a=Wb1JkmetP80A:10 a=PYnjg3YJAAAA:8 a=GHR8O2WEAAAA:20
 a=SSmOFEACAAAA:8 a=t7CeM3EgAAAA:8 a=Mr0PqM1J5brvtOELVKUA:9 a=m9p5bXcFLgAA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 92JS5xAFWMHT9Ep0iHfsuDkqlZNRoDWr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDA1MyBTYWx0ZWRfXxyNLhogcdFrg
 /F4pznbQ7VOYhEx3ZKml8m9jIiZfg7DIhV5i32CYGn9YtDFD1r8BOFEjMvHecHXdmITz3Xj10m0
 L96118cCdX0yI8ht68XWc4QgMUNIoHA1s1dwmgibiqA3la6wUGZQ/khe3la0MevNsiv50tWvqgB
 5NOrK524NiwFKx4CI2yCDXmN85shH3qay0xQeHNFUgzEbozBSGetGGoIIPocj7NKZ4i+cXoTCpj
 LCW+TMG9EvgGhx5Yl2Cu5MI0sUJwJmtmShM5JtLlTAPleSQKzrNiESIo8ZJeNmrDXMbfPSUBi/5
 inymMtdOBnOKfNUf/UFD5Wv8k+oKxcx4cEsppKZmfkRf034CS3CI5L5/WmtBlpRAq/OTU+yUGBd
 5jRl8ghc
X-Proofpoint-GUID: 92JS5xAFWMHT9Ep0iHfsuDkqlZNRoDWr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507120053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 10:20:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220219

From: Divya Chellam <divya.chellam@windriver.com>

A flaw was found in libxml2's xmlBuildQName function, where integer
overflows in buffer size calculations can lead to a stack-based buffer
overflow. This issue can result in memory corruption or a denial
of service when processing crafted input.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-6021

Upstream-patch:
https://gitlab.gnome.org/GNOME/libxml2/-/commit/17d950ae33c23f87692aa179bacedb6743f3188a

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../libxml/libxml2/CVE-2025-6021.patch        | 59 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.13.8.bb    |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
new file mode 100644
index 0000000000..8461e0f715
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
@@ -0,0 +1,59 @@
+From 17d950ae33c23f87692aa179bacedb6743f3188a Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 27 May 2025 12:53:17 +0200
+Subject: [PATCH] [CVE-2025-6021] tree: Fix integer overflow in xmlBuildQName
+
+Fixes #926.
+
+CVE: CVE-2025-6021
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/17d950ae33c23f87692aa179bacedb6743f3188a]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ tree.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/tree.c b/tree.c
+index f097cf8..5bc95b8 100644
+--- a/tree.c
++++ b/tree.c
+@@ -47,6 +47,10 @@
+ #include "private/error.h"
+ #include "private/tree.h"
+ 
++#ifndef SIZE_MAX
++  #define SIZE_MAX ((size_t)-1)
++#endif
++
+ int __xmlRegisterCallbacks = 0;
+ 
+ /************************************************************************
+@@ -167,10 +171,10 @@ xmlGetParameterEntityFromDtd(const xmlDtd *dtd, const xmlChar *name) {
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
+@@ -181,8 +185,10 @@ xmlBuildQName(const xmlChar *ncname, const xmlChar *prefix,
+ 
+     lenn = strlen((char *) ncname);
+     lenp = strlen((char *) prefix);
++    if (lenn >= SIZE_MAX - lenp - 1)
++        return(NULL);
+ 
+-    if ((memory == NULL) || (len < lenn + lenp + 2)) {
++    if ((memory == NULL) || ((size_t) len < lenn + lenp + 2)) {
+ 	ret = (xmlChar *) xmlMallocAtomic(lenn + lenp + 2);
+ 	if (ret == NULL)
+ 	    return(NULL);
+-- 
+2.40.0
+
diff --git a/meta/recipes-core/libxml/libxml2_2.13.8.bb b/meta/recipes-core/libxml/libxml2_2.13.8.bb
index e82e0e8ec3..ea7aa9c41d 100644
--- a/meta/recipes-core/libxml/libxml2_2.13.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.13.8.bb
@@ -17,6 +17,7 @@ inherit gnomebase
 SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testtar \
            file://run-ptest \
            file://install-tests.patch \
+           file://CVE-2025-6021.patch \
            "
 
 SRC_URI[archive.sha256sum] = "277294cb33119ab71b2bc81f2f445e9bc9435b893ad15bb2cd2b0e859a0ee84a"
-- 
2.40.0


