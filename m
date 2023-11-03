Return-Path: <Sanjana.Venkatesh@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75199C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 06:06:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.32855.1698991588539375782
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 23:06:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lsBunkEX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9671126150=sanjana.venkatesh@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A34uHt8010634
	for <openembedded-core@lists.openembedded.org>; Thu, 2 Nov 2023 23:06:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=mtt/iI4e0lvQcO3BSn
	J15Rgs7t1JTqY1jXgl4iyFqN8=; b=lsBunkEXRWA/PVnKV3ZpByDTlin7dGQ19l
	yMpWI1+PxNmC99e+dEiX9qZh8sGwCYW098+mJvEFbK+XoIzqQ80VK1bCb+W56TU1
	+C+FVyixfCCHrFqa7VBXzvjLsfDoAGGnJ8mvSEzlFTQW1PyPRWw37oP6dFCKhZ4E
	ylOoE61WtFa31tByrDqif/80dtG+fIfZPoklGLejNTsEk9e41sGBBPGIOcSQXuaM
	aXOMdymv9un9mf3wSE01fnZ8lCADdYDbqU1egHXhPyouIHpSMBtnaiJaBzbTlcKr
	eJMyhqBP6hzN9kaV5ukr0pCOqBlndBBwPDJFMhurBI8P+9tIB3Sw==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u430cs6hw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 23:06:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UkraDNq0M6scOKCkEPtiduCNxtt/bYidwW1A4lYpILwyz0sAtKnXmvIWAzVsLa/w8dWiC2Gk+ilvOwioPHqdfkRwb8Vr2UOjaPrMnHkVy1+FPhGQdhnJgAx10vMMkxPfPCMzRs+X8AHO4y4lzJRV7DoAtMJbhy55kS9Z6YMDX8k9mAwkn6gvRX5IoWZLNdxXR0UA5Gm9u8jHRiz3f21Damw0RG+uNRL7akJEB2HnTHu3wwV9Z49mo+CFRHNXcLFrLGHCu+przmgJq2+X5lbruSE3g3FgkrwtzN30SIuDFjRDDM8MYWs1R6EPVFrGK/7qzMD8BA3ZMzjeLZqfF9skmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtt/iI4e0lvQcO3BSnJ15Rgs7t1JTqY1jXgl4iyFqN8=;
 b=SBcZbELpi/ZFmaSq4bUMWWDJddXGez3VTMHNmEiP53ozcZW/LzXMt1lOxhr5x8w6Worwz6ZDgbcLFFvnCh66lZ0W4tyzth5MY6mmOq6QGxFH82aIhwD7NMkHpkwMrAxrwlQnt0csSEvuDy8DPam2N3opwK8oY02ORU5zqZ6drGfzF2lREbLWHp4YNL0YWRR4QYm8NUTCCcIimWTpRMsGoO5LZuUFrPFO32C5OvCn3Iqf7IySNa6G6lFfAjlUm/NeGxdF7hPDyQnTQ6bm3OXCfUGpX+9oviz0geQOX60dMNIxZTebJ/BEnOXNCBZdxbfjymJL3zr4j1TnWqx3NRVoFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB8540.namprd11.prod.outlook.com (2603:10b6:a03:574::10)
 by MW4PR11MB8289.namprd11.prod.outlook.com (2603:10b6:303:1e8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 06:06:23 +0000
Received: from SJ2PR11MB8540.namprd11.prod.outlook.com
 ([fe80::65c7:1db1:dcf4:744d]) by SJ2PR11MB8540.namprd11.prod.outlook.com
 ([fe80::65c7:1db1:dcf4:744d%4]) with mapi id 15.20.6933.029; Fri, 3 Nov 2023
 06:06:23 +0000
From: Sanjana.Venkatesh@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com,
        Sanjana <Sanjana.Venkatesh@windriver.com>
Subject: [kirkstone][PATCH] binutils: Fix CVE-2022-47010
Date: Thu,  2 Nov 2023 23:06:07 -0700
Message-ID: <20231103060607.595032-1-Sanjana.Venkatesh@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0069.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::46) To SJ2PR11MB8540.namprd11.prod.outlook.com
 (2603:10b6:a03:574::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8540:EE_|MW4PR11MB8289:EE_
X-MS-Office365-Filtering-Correlation-Id: e747b2a9-8fad-4d71-778c-08dbdc330192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0dssz/IouhZz+2rZn2E/gs7CQBu9r9JbRKmgfFfkNiTZyNWnWwjHEEeEisAT4AHiVF2BZNB2FZpInpCGs+UriRGyzF0YzoMlLHmxpePoYfwNkn5tU6ml5OsT/rpRq2WSVgGRWbE0/Gd/30r6j55APVR2r7+h07T0H/iAQ9vqG8fkH4tWDCsRRjfpxD3fsAZz1n680I+h3JGgzWrzpqIpEsIknVWKjEBT6kdH6DmVEkoz3L7TZTuG+1wBJNo71Rr3vbv3QUpOx1S+UfsFG2gDjEUPGre6owAKBji8yWB9F9LNIC5mofC98p3z9NcFcbuopH/GWiR2EAiSzryXDrs9zKyRCKgn9KycTShKq+9NOKtueB4IW8I0eb4hi2ykVWL36jJywgXZNElAA4OfMcGBrd/FXBsZzOf+nHUG4n2G3ncpEzixPelpnbR3G8TVyX7Wd4s0GjU0EyehYJRnNnoDy97K5djOofdDBl39E28UrjAnUxm3T6YiBoVcPaaspYTr4Zk8+CPs5p+X6u1sAWiNcguvvonZLCQ2Kl9ZSctCtjwjZz1bzUAK09R/Xfh0bZKKdNzJ2iZ3s3YMrtRfD2k9kS6Ltp3FkzPLApSnm/Wnhzs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8540.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(366004)(376002)(136003)(346002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(38350700005)(107886003)(1076003)(2616005)(52116002)(9686003)(6512007)(6506007)(83380400001)(26005)(5660300002)(66946007)(36756003)(66556008)(316002)(66476007)(6916009)(86362001)(6666004)(8936002)(38100700002)(8676002)(6486002)(2906002)(966005)(4326008)(41300700001)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aBPgOUFC7u1fG4sh92gSFbA6U5ZvrJvHpg1+ap4Ele6efjbXMBVLTwcVegcR?=
 =?us-ascii?Q?Z4piWenJ2tdtIQo8RyZzKrimC9K4vbI+uLvYi6izHEP1s9kZAo32hl38LuFE?=
 =?us-ascii?Q?u53EkgLQmOHQB3aU/4auEXJ93L3HjnqcnfptV/7uo58+YzVUg3A32VoCSUbi?=
 =?us-ascii?Q?EVackoPEAqrxzXoEPYngbcLn2hA7H51g9ojgvwFEdtjQguqAfdb8yhOqYBnb?=
 =?us-ascii?Q?LjSmP3GJrdT16UJ3NQafTzr0BCKWBUsBA+UUwB6OUcwB3ltDMGjMbfkgM2nZ?=
 =?us-ascii?Q?xsgHRX5PcG/b4lAvgkXGsVr4Gu80nbot90NebCLZX0fB6mt9437gKVtOBgs+?=
 =?us-ascii?Q?IWE5X2QIDgha2AV4wlF/IyYMLpvzGVl9B5HessvWCN1x+0PelgtSEPfdpRj+?=
 =?us-ascii?Q?M55f9iOUvA5wJRia46NrwhAo3YmDVQXHvkNahDSELmpclNhjV8nRxqCfSaKa?=
 =?us-ascii?Q?eSGRC/MWFT3gIvex2UP+Pf13+4Nq1q9pG8uKzTWQaz0s7sPrV5GbNd/Jstrt?=
 =?us-ascii?Q?x1xH0blFyWde2p+psqZSNOOFLwJazoouGZs8SXi1Frhk/QsuiOe3XWXvrtTI?=
 =?us-ascii?Q?w8RjUtTBrIEE0Re61ppe/qXurf59DSD02bKG2laXih2aAHHvcE2hhIQzOLO9?=
 =?us-ascii?Q?oe7G8nMBURlsdygqwYgv1Kj4TgUnNLxf/Pk3EZ0w/PeUx6EYBIpYo8kTQvMf?=
 =?us-ascii?Q?vVy4j8wu+OtUJ3/YOj1B7VIxTutPixFHikrODTpiSuZeHBujZQgi4jqkgt9O?=
 =?us-ascii?Q?M/UnuMhD1Xm2Uf7I5XqBEcoCsh+gDZS7spNNig6IkeglBlHPg2UItVVGTxDQ?=
 =?us-ascii?Q?Qo2QabBBgaFon3sx89Zhoc0AU0xclB7A1K4WVPi4cOdijaOZ6AEXlO7GGXRV?=
 =?us-ascii?Q?/8JXer+YIEylTSyR+NHkdTJEWyAQtbrCxY6RQY1yFpK5WMSF5I8UfzKZSsE1?=
 =?us-ascii?Q?4lgU11AYZBiF6owMpb5QRo3t+3DV5hQZ0l+TqxH3vvhbHcUKfHFeet2+jJcu?=
 =?us-ascii?Q?u7UsoBuy1GvdkSh+2VW64mwXv6sT+7Nt5TPN5z9lMTcZS5hT5iRKsLqeAXrL?=
 =?us-ascii?Q?VFeFZ2TTV7WMdmBXTmkaXmlLtaSedikBCuYbNXC7MbJ4BAV0EOI/hAHdTkT4?=
 =?us-ascii?Q?JgrbqSt3kbOBQWv6AI07pqHUHW8TzP6yMsLib8aW3kUqTqO415WZk5vOPfs+?=
 =?us-ascii?Q?UihdfWmc5Scu09IZD39l/1TXFUy2/h1T0AVUUpkfa62mjwHK97tXBryfnJUT?=
 =?us-ascii?Q?j5NDdxjEPjDbG6Laj6dWJeZzURqCwOaIgeOiqJ72vLdaG8erXFh+zIy54sCr?=
 =?us-ascii?Q?iMiAHZ45KHZl8vA8W/KXGgvBYKvzbN73G0kl6XVCt6pZLuEmPdWPux2ij8zi?=
 =?us-ascii?Q?Ki+oID1dkCc10OoIzwFRrEBmulWi93pCqfFJTvGHSSbYDOytfPXV8bx6HmRo?=
 =?us-ascii?Q?kHgC4Z1GdHauM5K+PEUy5FMtfFVyMQBOZBuqVE0XEox0rQ3TDn+OMACKusEb?=
 =?us-ascii?Q?tI0j7Syfe5tbMXFZzwV2KwafwlVrYkrtiXlrVtyer3CYzsvsdmm6PMmLrcSH?=
 =?us-ascii?Q?k/QdgjoE7MHCbKfwP4PsN0suTULvSk9rcfdUYBaHa2yTwAGrkjMQLM8GVmUh?=
 =?us-ascii?Q?ChYCWMriKX/48e6biLHy+nA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e747b2a9-8fad-4d71-778c-08dbdc330192
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8540.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 06:06:23.2537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wj3Ecidfg+lO2pHoLsO4VqboV9U1+vSUqUSB/BRa9WTfGV99J3JwN48O65yzZfbTw16v6BqFsNRDrYtAFkfNYOvTcJv10xPzLciqsbMeffI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8289
X-Proofpoint-GUID: 6OvnlvzOIwPUowyoL-7PWV0GOW0AiRPT
X-Proofpoint-ORIG-GUID: 6OvnlvzOIwPUowyoL-7PWV0GOW0AiRPT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-03_06,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1011 mlxlogscore=657 phishscore=0 mlxscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2311030048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 06:06:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190107

From: Sanjana <Sanjana.Venkatesh@windriver.com>

Signed-off-by: Sanjana <Sanjana.Venkatesh@windriver.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0032-CVE-2022-47010.patch        | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0032-CVE-2022-47010.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 60a0c04412..43cc97f1ef 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -66,5 +66,6 @@ SRC_URI = "\
      file://0031-CVE-2022-45703-2.patch \
      file://0031-CVE-2022-47695.patch \
      file://CVE-2022-48063.patch \
+     file://0032-CVE-2022-47010.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0032-CVE-2022-47010.patch b/meta/recipes-devtools/binutils/binutils/0032-CVE-2022-47010.patch
new file mode 100644
index 0000000000..9648033e67
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0032-CVE-2022-47010.patch
@@ -0,0 +1,38 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 20 Jun 2022 01:09:31 +0000 (+0930)
+Subject: PR29262, memory leak in pr_function_type
+X-Git-Tag: binutils-2_39~224
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=0d02e70b197c786f26175b9a73f94e01d14abdab
+
+PR29262, memory leak in pr_function_type
+
+	PR 29262
+	* prdbg.c (pr_function_type): Free "s" on failure path.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=0d02e70b197c786f26175b9a73f94e01d14abdab]
+
+CVE: CVE-2022-47010   
+
+Signed-off-by: Sanjana Venkatesh <Sanjana.Venkatesh@windriver.com>
+
+---
+
+diff --git a/binutils/prdbg.c b/binutils/prdbg.c
+index c1e41628d26..bb42a5b6c2d 100644
+--- a/binutils/prdbg.c
++++ b/binutils/prdbg.c
+@@ -742,12 +742,9 @@ pr_function_type (void *p, int argcount, bool varargs)
+ 
+   strcat (s, ")");
+ 
+-  if (! substitute_type (info, s))
+-    return false;
+-
++  bool ret = substitute_type (info, s);
+   free (s);
+-
+-  return true;
++  return ret;
+ }
+ 
+ /* Turn the top type on the stack into a reference to that type.  */
-- 
2.42.0


