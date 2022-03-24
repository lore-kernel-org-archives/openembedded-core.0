Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8879BC433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 19:21:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15662.1648149659078462432
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 12:20:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=JOHWQ01O;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=008236cb41=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22OIQ7g2032162
	for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 12:20:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=1rYXiGCib9edwnPsqt5PFxpT7OMS1tS6pa1KupGipms=;
 b=JOHWQ01OzVLuglCxTxwUJMza0wa6eytdWHOv6hSpf3+IEpRZtKIoqELJjiApzh3jxfUV
 6UihennqmnIoCYIxaKHkYliP/JdL8gN6uvxFNCLK5zKdo1Gt5DG0GVxq8z/hYFWOz4qO
 ZTYjfgcf10JCQEMYCg45Qru6ye8dms3bbJfZM4IGUTNM3JS/DtcJpGw3ntk809rN1vRT
 XH96VH7qMBuPqZJIpNFlP5tJ9aFTaQVrnt2dtRtZJT02n6pEakIFOWOK9gDXv3bP4Y41
 Qz56Gegbw2MUf/PCCwDM0ki6KxC9qUugP8cGro2vh72V2xwwPnZk2ysgFFH3ROWgszde hw==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ewepj4kvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 12:20:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVsLUpfdzCTCdi4nHmW3L+RRLHf4jkpZiGR5hQkuXThASgBxHjkL1gdXdpUZ5iM39jgbRwmhMN0gQ1IiyuAG667rjA/g4cOCmONbOSi0QncpiGvo+lt6X6LEUTkIlfXr3ZhKcoFbhSM5Uaf0p1ty1DineYjOKxKnPxA+hhsQJznCG3n2ITCDiv+krIe6tiWhfwg7+eCQH5zj93ob0V1ooQ7eO1Tx++OcBVyOU8f4tR+jYXLKy/upP4IORGhE2TrIQas29oExz39s3bivQl1rNOBZs+lHdrabydu7exQmkAoC3BFhvJeNrFNsUiIEPXpCAzHSJTiRZgDSG2X6/qWHMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rYXiGCib9edwnPsqt5PFxpT7OMS1tS6pa1KupGipms=;
 b=XxDAZccKAbuI818b644v8MjLU7b0iJuj0hVxzLNTZXGEiTOeAfVTPQCJ0DhJ1T8rcxUa7n46jgxUZbcUzPcGeQ6608y+IdiV8DzyetnY6Rcsrwqi0oxMW7RvXew2vMYcgkUr49L/wvE1EG6Up7XU7+qkbElLht+ELu9GSI1IVOXZqNjNnrFG0gxmJSiy73RzNhBYBi+g12BZd4AAwDkj98FOKgEbMnRD/Pq3JSvlX76Km30G8ifzivetDPQihqjj1KLjYsCGTfINSj1ZFlXB9CXINSUOEaQD+0mnHOK8ph9VT4pKjvFnG9JGw0QJ0jRpf9mFhMYObuQ3UJDWJhp5kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by SN6PR11MB3342.namprd11.prod.outlook.com (2603:10b6:805:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Thu, 24 Mar
 2022 19:20:54 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::389d:5330:bc19:13c4]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::389d:5330:bc19:13c4%7]) with mapi id 15.20.5102.016; Thu, 24 Mar 2022
 19:20:54 +0000
From: Joe Slater <joe.slater@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [oe-core][PATCH 1/1] libxml2: fix CVE-2022-23308 regression
Date: Thu, 24 Mar 2022 12:20:35 -0700
Message-Id: <20220324192035.31767-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::7) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30899f07-1054-49b7-e704-08da0dcb6a98
X-MS-TrafficTypeDiagnostic: SN6PR11MB3342:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3342902FE6AE6ADB61F23DE888199@SN6PR11MB3342.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rVmPH4hdtQDo1WrsasKhKJDauRU+j9N0o2oADZ+RTPGkGErJ0rr/0El0MITWsHMN1WKOo1C12Ot4Td7/5UdHFIhA9cuSNK4kmu6gJ18oiJrNJBjmlCuMRfo10qp5HUg7lDyDZnH4AiO5mCuxV8QMpKJBtynmrDUurY6HIjqERWbhlOop5kTOUyUL8pJpXDkbE3yExEot8mVWgRzS4H6xwyDz/WDsACoPeG8iekcFExJOJyhdcCKAO0zmP/+b9dr5LzxxXHGRAhjk4W/9xpoEA2xu1LldegK1FjILrQZ2VpWLsYB10a3DU3Yzi1FyAeFYBmTMvgmiLn+oIqO9iGYiq1zJwzp7ZudIsqKamB2uQJXXNk7WlpF6syLizYFBP5NN1DD72IjkRBQyRjxiOyiiJVX6fYxHqxBAC9yfyPc6kTRzkei8aQZ0R1I61cY6YRFWvrCVBHdE/wWVa4Rb5So18ghhWSrSEEagkqj54MRYzH9MkIJRv6pnzlQewcUn1VhqdCEOTzaYdj1z85c1hAZbmRUk4ATzw0mSJmcsrHvAzpeDr9w0UMWzDYRnqXsAIG1slKBwkuS3YKdizOSW87G4Qa+rb0VMjYwcJXLbthVop/TL2B0MSIBtkTOPGajbj5F0Ey4EKxIRU9ziKoV3sMnvciVEIOVwBaqR9ERmIvRNGfnf1ETrSJz+Sq9eW/tVDhkF+IpeLDXzJmXIdm2K3m5wA4G4xPHcO61hTZCavdiwf6OQAaiAw9IhRrlcZeXRb5LSeuUQOU1HNzk7MQVPdKcsSKpytkCTYIgK+B9uR7903xbZXe01zaUk2gZIlZqhTfVK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(316002)(1076003)(2616005)(107886003)(186003)(26005)(36756003)(6506007)(52116002)(6666004)(6512007)(966005)(2906002)(66946007)(44832011)(86362001)(508600001)(6486002)(6916009)(38350700002)(38100700002)(5660300002)(8936002)(66476007)(66556008)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JlGUHIWrV75p4tgWq5U3IFiXtHfpZUrMyzzqFNCYXpn6qRKya7X32t0gcP38?=
 =?us-ascii?Q?wycjNHzwOIpn06nMOznqzPjme2BPAiqbmOkcBCEnvm/DE+h+/1/XRJUpgm+X?=
 =?us-ascii?Q?FvGXaQ7QnO72PUz+S8tUHDVCeMFRbSYqh2ijb4MxF0AUeIBQ7TPmoYbhhcYW?=
 =?us-ascii?Q?9jQPMiIZghoMSmQmz/Kynjeb0UtMtH/qYTSBYp3D45Ug2lDGGJB/AHMIE5qY?=
 =?us-ascii?Q?6SgobnbcjuCRpBWgbGrdXOX5qNLSRh72HDsCRucRF8FBHhggaZMdLdfVcQA6?=
 =?us-ascii?Q?j+aKlTDpts2DQPsT8IRJzQwjVp9S6VCGWSTCDX2vC4oHWAJFPwz331lcRchn?=
 =?us-ascii?Q?2QQNbskifFAjHdEABD+uUmI01bSvc3wWGwEeXRTvMYx4srC2B84J2ZrZPKvz?=
 =?us-ascii?Q?5zPqIO0ct2wcnctLoTU0dMGYV2Wx9jMsTjhKBdIPOxou1OqUmypSljZtrV9A?=
 =?us-ascii?Q?weTSYZBcEKx5K5FUNogkRK8g7Byl48qHOFQ0eVJAdb6VppAMp/rsTy2W6PVF?=
 =?us-ascii?Q?e4C5C6Za6UmFxqKTkf+4elpz3ptzm7YRes+SWw1dcPc7ZjKRvboLPmDY1D2w?=
 =?us-ascii?Q?Pe3siQeK6FJIyQGgYLemhNimT4JvnR6C7ooUXdBXCkdHf3vtJW21yAsKamUW?=
 =?us-ascii?Q?U6yysQcTrOx8I23vC7OE+LJA6a7nma9Nhg4JLDtBRlvzlUfmoiVdczj5tQDo?=
 =?us-ascii?Q?qZ5lv6hwWEKjz2dxqKvQZG8IMAodtg2clz59cMh+aVIAWD5jtmJWVCCh43Bz?=
 =?us-ascii?Q?BZMDLXYadm0cmNXoBoq3JJk5K8WqsTY5ZWg5/Mf2pE+mEO3GOML0XDBqqvoN?=
 =?us-ascii?Q?NcR5BtuEQf5z9N1vrDQP7rVmVwv43x9SUi0uLJ9EqY3+7ZMhkDqPpeHOZPvE?=
 =?us-ascii?Q?W4slqafDolBAGAAe5tMSS8Ym2XPLv+/OLg7PesR6ZqbNwU+C/kNPbun7AaNn?=
 =?us-ascii?Q?5QmjQZ/NLCEZqqV4oI4VDhaEoHD/6KwrOLnq+X3YYk3J2BgsZS15ORi7xY2u?=
 =?us-ascii?Q?57a2F9AaqyHpdppcc9ROzp16Pl5C2S4neLlUTrxo5qNmwNj3yGXqaUZym5SX?=
 =?us-ascii?Q?zo4apwLh8Nn3OG43jbiO3BBR8UH/L6t7m0ugf2vd6QQ0ijkZ1oswEowKam5t?=
 =?us-ascii?Q?IERRIvr8Uh5QZk2l5q+89XCZ94SUZtodAmgwLE5eSv9jQ6sgP+ueM2b0p03M?=
 =?us-ascii?Q?P43CELFTVhFjQj5A/YyqKk/W1Qx+7loFie30iuBe8FQtAOW9032x/fU1dZ4n?=
 =?us-ascii?Q?czjMVx8xlM64Iyt7xSt+qDstEPojsVAMZKYuRPzQUCAi62ObRbtWOSQ32LJf?=
 =?us-ascii?Q?uEK09QAfPQ+OwUhlsoRXum8+/9I3sYseNFRC+5Z8SeTb8Orc3szxhmx+0uaK?=
 =?us-ascii?Q?qzVVzqBjMh2RdEgxypPsST4zBo81+su3U5uHKOzJYfZSgtObONiG9DCp5v2y?=
 =?us-ascii?Q?xLcfEFigGoa63BOhM0HWNFJtCi9n2NR59b2L2LNBFbKWt/TS0u3wx2qg8s1f?=
 =?us-ascii?Q?dX2ZkrYGjm1XxZ2Q23lzX72Yl+gsXlYeGcEF2/Y6gwjGEVbxzAU5zgnKaHQh?=
 =?us-ascii?Q?0/cY9DjfIHFWseUVDqXPdapdaypzKvph7SOvlyKS6uw+4jDvf66QvNsYjOT8?=
 =?us-ascii?Q?hPH2m55B7hEbF3iyvWHbFxzUnXOwwNs8QCevJpfOddzd9DrByKVKSvcX6UaS?=
 =?us-ascii?Q?gqtg7M/FBRK6vkQJrl0NxTWgMTQl+pfLvV2kOBRs6FiSXqBK3X2RB1XePruR?=
 =?us-ascii?Q?JR8G7gOpZt6Ef0wHq25Pk4wXVRUFvtQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 30899f07-1054-49b7-e704-08da0dcb6a98
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 19:20:54.5992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rh9HInHT9h+hpR0Ug/qhEAFwhRuvquAAG636/coIQvZAEDvqojuftvrKBOZwzAoe50HjdS/gEkvTWf1rRftXTDetC/ReCNuz7OdmgXG6gXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3342
X-Proofpoint-GUID: gjn3OD0IVQWGqd3PjXnTGBXOcy8Z19j0
X-Proofpoint-ORIG-GUID: gjn3OD0IVQWGqd3PjXnTGBXOcy8Z19j0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-24_06,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 mlxlogscore=818 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203240103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Mar 2022 19:21:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163621

The fix for the CVE in 2.9.13 caused a regression which
was addressed after 2.9.13.  We import that patch here.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../CVE-2022-23308-fix-regression.patch       | 99 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.13.bb    |  3 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch b/meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch
new file mode 100644
index 0000000000..e188914613
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch
@@ -0,0 +1,99 @@
+From 646fe48d1c8a74310c409ddf81fe7df6700052af Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 22 Feb 2022 11:51:08 +0100
+Subject: [PATCH] Fix --without-valid build
+
+Regressed in commit 652dd12a.
+---
+ valid.c | 58 ++++++++++++++++++++++++++++-----------------------------
+ 1 file changed, 29 insertions(+), 29 deletions(-)
+---
+
+From https://github.com/GNOME/libxml2.git
+ commit 646fe48d1c8a74310c409ddf81fe7df6700052af
+
+CVE: CVE-2022-23308
+Upstream-Status: Backport
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+diff --git a/valid.c b/valid.c
+index 8e596f1d..9684683a 100644
+--- a/valid.c
++++ b/valid.c
+@@ -479,35 +479,6 @@ nodeVPop(xmlValidCtxtPtr ctxt)
+     return (ret);
+ }
+ 
+-/**
+- * xmlValidNormalizeString:
+- * @str: a string
+- *
+- * Normalize a string in-place.
+- */
+-static void
+-xmlValidNormalizeString(xmlChar *str) {
+-    xmlChar *dst;
+-    const xmlChar *src;
+-
+-    if (str == NULL)
+-        return;
+-    src = str;
+-    dst = str;
+-
+-    while (*src == 0x20) src++;
+-    while (*src != 0) {
+-	if (*src == 0x20) {
+-	    while (*src == 0x20) src++;
+-	    if (*src != 0)
+-		*dst++ = 0x20;
+-	} else {
+-	    *dst++ = *src++;
+-	}
+-    }
+-    *dst = 0;
+-}
+-
+ #ifdef DEBUG_VALID_ALGO
+ static void
+ xmlValidPrintNode(xmlNodePtr cur) {
+@@ -2636,6 +2607,35 @@ xmlDumpNotationTable(xmlBufferPtr buf, xmlNotationTablePtr table) {
+ 	    (xmlDictOwns(dict, (const xmlChar *)(str)) == 0)))	\
+ 	    xmlFree((char *)(str));
+ 
++/**
++ * xmlValidNormalizeString:
++ * @str: a string
++ *
++ * Normalize a string in-place.
++ */
++static void
++xmlValidNormalizeString(xmlChar *str) {
++    xmlChar *dst;
++    const xmlChar *src;
++
++    if (str == NULL)
++        return;
++    src = str;
++    dst = str;
++
++    while (*src == 0x20) src++;
++    while (*src != 0) {
++	if (*src == 0x20) {
++	    while (*src == 0x20) src++;
++	    if (*src != 0)
++		*dst++ = 0x20;
++	} else {
++	    *dst++ = *src++;
++	}
++    }
++    *dst = 0;
++}
++
+ static int
+ xmlIsStreaming(xmlValidCtxtPtr ctxt) {
+     xmlParserCtxtPtr pctxt;
+-- 
+2.35.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.13.bb b/meta/recipes-core/libxml/libxml2_2.9.13.bb
index be59aba84b..e361b53bfd 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.13.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.13.bb
@@ -23,6 +23,9 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=te
            file://remove-fuzz-from-ptests.patch \
            file://libxml-m4-use-pkgconfig.patch \
            "
+# will be in v2.9.14
+#
+SRC_URI += "file://CVE-2022-23308-fix-regression.patch"
 
 SRC_URI[archive.sha256sum] = "276130602d12fe484ecc03447ee5e759d0465558fbc9d6bd144e3745306ebf0e"
 SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7"
-- 
2.35.1


