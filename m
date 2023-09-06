Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126E4EB8FA5
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 09:26:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4604.1693992352899842987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 02:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=o8tTc/Kj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76138bfad3=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38669duP006477
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Sep 2023 09:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=1FpxNTsvmq3hoYKFfT
	SxfIZX0c49LOTcRRcRPC6rEGc=; b=o8tTc/KjX8fqRFAT3FM/9SNtMCIcpCC50q
	eNhgCTRexQAif0S7OmUEMKSB3C7hRdwwbH+hNAvDwsDfFTNCSAcVAVxgCTQfyyR+
	ucUTlajQHS1rkKo+65x9VBu3mey/GFc02NQNHQTGQrERTfd/0dZNKkCh1LLMSWZa
	xmU+IJcwDEW2n4eqCrsizjnT2X3MsLaHYNatiSq0dDfqxAdbzADudSf2NoWG7Xvp
	cTjcI/wACRynncDZb33jqtInEqhFQjkB4J8MpDUXxpSN/+3P8O0/lvKOWwOwDeI1
	kxFBPInPbz4i5DbP8bggzCTGdUBRst7WgTQwHRh77ylMSox/1pXw==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2042.outbound.protection.outlook.com [104.47.74.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sw33k27nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 09:25:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNU26M4FCac/Asvxte5/w/S2fg00BQnCj070Zyu6XCEK4y2T3K6h1FCNG1/n+MxcZBonXpTPqX9dte7ToZti4XLbRSjjFlNpiE6kWhHUbHVL2YEC0Es3BrE1FxUkkG0+4w7hUgXZzVtieJsX94IcauorgSYXv15YAVFwKBtxAVxd1FHYWng/MWZvAVYfL0WSx0qX0cPI4O35PHj7E8N+vA1V1U2M4ZdzcbG/8FwiM87YPAN2WmQLbvYxDyZk8y1d9kssiZHfSae2/nuIc6365PsnybgXNPKVaDQQ0XlTg3jacilawjOGemuOLyTgJUHjGJf94WZEaD5CZ5pcHkazEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FpxNTsvmq3hoYKFfTSxfIZX0c49LOTcRRcRPC6rEGc=;
 b=gtdlb3R0ky43aHLPd58CC2iCE1WY3sEg6I45oKtjI2BZ9dtvFYx4mLT8/Sv5/em2E9sMZM1Qoc0hOaZ4+6AVkbV4XC3PLmOtAw8Tbkf7RyN4PmDRg4G0LphmQUbbnoqR+uyRJLDbI60pDDO1kPKBqVyNH0UwH3G+STZLbAdXegBGTgP8GaUOK/LQbW555zwZiErXoWk9iBougdcl65nJowY1cnKrRYpENbSanCL5Rpl8BGHVfzuzJB7EiCtI6I+1VRwHMHW+8k7PvqBablSjLdCnDeyxIGb3GUU1a+HyCCgvH+nVeehvX0y7TK4xTB4vt5L9bE2XTqddRBjcTLvhyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 09:25:48 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::6f95:6ed:cf39:91d]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::6f95:6ed:cf39:91d%3]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 09:25:48 +0000
From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kalappa@windriver.com,
        Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [kirkstone][PATCH V2] binutils: Fix CVE-2022-47008
Date: Wed,  6 Sep 2023 02:25:32 -0700
Message-Id: <20230906092532.675964-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0028.namprd21.prod.outlook.com
 (2603:10b6:a03:114::38) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|SA3PR11MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 295f8578-f42a-455e-1119-08dbaebb4118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	alxAO86e+UJiY7iP/Rlzu8so9dwi+feYRcThYFo+mZ6C4O0hsCDrAIL3ketfoZHatugyezSS1hBvPko8+NEMfrMwScAtVR2fRoTX8pSGKdj7GTcRo1yQ6tHQbSJR4zvX13p6w/P2QAKtGxIPoTIpG0e1D9se12L0KaQVu7iJNmVlvSwBL9dFGJENPHA+w4CLi9syzROopcgtUYs6szV9jElvbaRiHA+snW5DzEPnkoL6iPBGj1bLSwSG2+SE2eded6GZ8FQS7G1P9+l8bXgsMSrEnJlh0QYBJpN+l0nAxC6cfVufeJGOMkMDpuRDy7AVN7pQg+yBxVa+QL/+j9vF9zVJFlUJ24Dna+VqDwGQEDwjVg7QNDn7JsZiifcqgJv6VbAKr9No9EeU1WJRuf1hweyAX93cLp0ZXnX9oPvieyA/6ehKMngj9jmrFXlGNK9MIHgd0PpsUhBYp+vy+AsWLZykCxscGhBtjfXd0Fv6NLYEroe1RGiOk1vaCTnl6+9By1eYLpAKuXwb/pEtDgPvrPo4GgVqSLHla7Elf4KMvyHid/yrtrqdt/c0mAkhnjxyC+tU6t4e3ht9w/fjVYH/X89ZvbGAmkRJO82uhq5K3yM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(366004)(39850400004)(396003)(1800799009)(451199024)(186009)(36756003)(478600001)(26005)(6666004)(6486002)(316002)(6506007)(52116002)(107886003)(1076003)(2616005)(6512007)(966005)(41300700001)(66946007)(6916009)(66556008)(66476007)(38100700002)(38350700002)(83380400001)(2906002)(86362001)(8936002)(5660300002)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QteGQqq21IZOvhBxXmuvFEO/pKEdxJHC5zgVwCP2jENHUvFbtlyHTtQgfW3U?=
 =?us-ascii?Q?fO7rVVDh9tIO/gvFGTDOaKg+9I6Qrw17/XTbu+Ko+Td6zx1LLCCYg7QTGuC1?=
 =?us-ascii?Q?T5BZPeOGICnq6RuM5XtbrdM5eCEqwO+vCpyyy9Otqq2SYtBT5wUVZetkuziF?=
 =?us-ascii?Q?mNYdXaEK43hIwranNx2OzSV8YchVgpKP4rfAgNF1lLrRKt0PCXhN3L0rNBeF?=
 =?us-ascii?Q?WT2lx8LOtEcTs/XKfZNochrfYeDparyC53bsr6Da6sIdLlHnRRqLJ7YRnU7j?=
 =?us-ascii?Q?eJxiNoWV+7nvnYPz6pMCeUexMJDAnd352uyNA4fCKgtBnHydd18OYafktu5W?=
 =?us-ascii?Q?AqH3JSqv0Pk62GUS0dt2SlLLu7HCzVV1T+3thhPlM77eSWbQ598mNdRS62PX?=
 =?us-ascii?Q?YxwLZ32NvDNMzgnVYv+dZdMUlfoIfPbrzSi5q3udeQxICYJ0Q++RNbRWklnw?=
 =?us-ascii?Q?HuTwEVx+lCQj5wf9SCePXgLjtA9b6jMAncvCE6rFORnGMTS5uvSFmktVtLlo?=
 =?us-ascii?Q?ZsRe7fhuCUTBeRD1e4N/iE6rB7C70fXOGtAEHSC7ixVzlLUhzfF+QUDQrEjC?=
 =?us-ascii?Q?AKpC94o2rNjonjBtizJw3t+v65s7B9xA+5rHEMk1YLLHnEDdFg0FDgUMJCe9?=
 =?us-ascii?Q?s9yv4T7KQ0jsVLBV2ElfcVwYhbcRORKH3urtMyQjkBxQVJQD82LCd6fxMZNu?=
 =?us-ascii?Q?j+w5vlPxnBVwDL9OpBGsKWveA2Nrqg++x7PuUYVyPoccFVi842Ee3CdmxkEz?=
 =?us-ascii?Q?J+4XrEwawZgev+Ag2njL1OZP58uvgGkOKEhuodMvPUjIq0P3P+UrIdQSNLDl?=
 =?us-ascii?Q?lTC9RzRTltUNEnQP5jXfk85oYCv38oQQ85yL3HpTtvSR9HAQTS5CUuQKNWve?=
 =?us-ascii?Q?aEKUsRQ6PoU6/JRrQr34SjSZfcMRypK1tf+uJMwLng5+UJrFg5To8GZ57FNI?=
 =?us-ascii?Q?NtRxPOrSYjB5aPmrzx1CW/OCtdpdTZP2iTS6DPzBKw2xVT6gBJsJuUUTZycR?=
 =?us-ascii?Q?mslpI9lkJdYtCXdvievUypVAkKIeZumcI/hIHgPNWQOrWhXojqVc+QOKTdSn?=
 =?us-ascii?Q?B/y5G45l/PLEso7BFNetP9fw4+lyWq/7rFXrwFHgbSfzBo9pJsGiPcsQFFWo?=
 =?us-ascii?Q?MB2qomqAH+24yvuVUht8pOldSpgayNxJzHhl29E/3GoSD6KbWg5wStj/aboN?=
 =?us-ascii?Q?qjbTwdfmtDC3cDZztgxAr6oKSXXWD7riPwW9eucCgnUyUPM0XZasAurQEKwR?=
 =?us-ascii?Q?9rvuoMhcoJpn4LiKwiO1qApnebCv2AYWxfWpgAsXfUcnnR5NhBka9IJPfL1k?=
 =?us-ascii?Q?+BHf4Pex/+z/hsa+MZlcaM5+oF9oRb8PCv9p/qhiy4S6gFAwEd8BmmcnvWLj?=
 =?us-ascii?Q?Yhw2TbPNHRb3TwMYx12PtqGSOw2nSsJEP26rsHbW3hVqtCJNt+5dePoqGbs3?=
 =?us-ascii?Q?IOEcY/rY81VDSKHZBSBae6NPdrxC10Onz02MKSAZJL83IP3lkBOVNH3+IY0d?=
 =?us-ascii?Q?GZqoctJpkZYC92mIShwIgwfbzx55ico0uh6B9RJ2m4VikLoMQWQwQF42MCfV?=
 =?us-ascii?Q?bNfvTC7eKtG4ZlWwQWbDvxZviCoSCAZlQymmE14J89px6SSYaofazV8a8EGu?=
 =?us-ascii?Q?mw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 295f8578-f42a-455e-1119-08dbaebb4118
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 09:25:47.8427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRTqPwbzccA+x7W4ZlLwKE+wWCEt22woEpKkFwh7i+vbNaqC3XDmPlze83o0o5mfC3xF3D7M9swVB5QEp/c6L8ph9c6P3FA/doTmBvtyw4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7534
X-Proofpoint-GUID: 8vCBQJ8lHoaHhqWxY67Cu3P-ejDYnNYN
X-Proofpoint-ORIG-GUID: 8vCBQJ8lHoaHhqWxY67Cu3P-ejDYnNYN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_03,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=478
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309060079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 09:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187288

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0027-CVE-2022-47008.patch        | 67 +++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0027-CVE-2022-47008.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 5c3ff3d93a..9bcf7ad4f5 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -56,5 +56,6 @@ SRC_URI = "\
      file://0023-CVE-2023-25585.patch \
      file://0026-CVE-2023-1972.patch \
      file://0025-CVE-2023-25588.patch \
+     file://0027-CVE-2022-47008.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0027-CVE-2022-47008.patch b/meta/recipes-devtools/binutils/binutils/0027-CVE-2022-47008.patch
new file mode 100644
index 0000000000..a3fff65409
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0027-CVE-2022-47008.patch
@@ -0,0 +1,67 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 16 Jun 2022 23:43:38 +0000 (+0930)
+Subject: PR29255, memory leak in make_tempdir
+X-Git-Tag: binutils-2_39~236
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=d6e1d48c83b165c129cb0aa78905f7ca80a1f682
+
+PR29255, memory leak in make_tempdir
+
+	PR 29255
+	* bucomm.c (make_tempdir, make_tempname): Free template on all
+	failure paths.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=d6e1d48c83b165c129cb0aa78905f7ca80a1f682]
+
+CVE: CVE-2022-47008
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+---
+
+diff --git a/binutils/bucomm.c b/binutils/bucomm.c
+index fdc2209df9c..4395cb9f7f5 100644
+--- a/binutils/bucomm.c
++++ b/binutils/bucomm.c
+@@ -537,8 +537,9 @@ make_tempname (const char *filename, int *ofd)
+ #else
+   tmpname = mktemp (tmpname);
+   if (tmpname == NULL)
+-    return NULL;
+-  fd = open (tmpname, O_RDWR | O_CREAT | O_EXCL, 0600);
++    fd = -1;
++  else
++    fd = open (tmpname, O_RDWR | O_CREAT | O_EXCL, 0600);
+ #endif
+   if (fd == -1)
+     {
+@@ -556,22 +557,23 @@ char *
+ make_tempdir (const char *filename)
+ {
+   char *tmpname = template_in_dir (filename);
++  char *ret;
+ 
+ #ifdef HAVE_MKDTEMP
+-  return mkdtemp (tmpname);
++  ret = mkdtemp (tmpname);
+ #else
+-  tmpname = mktemp (tmpname);
+-  if (tmpname == NULL)
+-    return NULL;
++  ret = mktemp (tmpname);
+ #if defined (_WIN32) && !defined (__CYGWIN32__)
+   if (mkdir (tmpname) != 0)
+-    return NULL;
++    ret = NULL;
+ #else
+   if (mkdir (tmpname, 0700) != 0)
+-    return NULL;
++    ret = NULL;
+ #endif
+-  return tmpname;
+ #endif
++  if (ret == NULL)
++    free (tmpname);
++  return ret;
+ }
+ 
+ /* Parse a string into a VMA, with a fatal error if it can't be
-- 
2.39.0


