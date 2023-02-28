Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D07CC64ED6
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 07:25:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18136.1677569107891081061
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 23:25:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=E9POHGHU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1423c41bfa=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31S7KMTo021779
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 07:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=mIYUBAQWPj5+/BTpthHqJUsLE8yuJhJ0ekz2I/kmq5c=;
 b=E9POHGHUV0ZHnooOhVXxaTXUuqIiko/YOBu6ONGLf+JvN5Xt+5AcTgGOUbZcB/9aBheY
 E7pAaUnCkDzkJsc9aduSmDPOlevu8xQawsXd943y9zhd5HSRb9lRhy4jx2wkHVp0x0Sh
 9dk5i4tlGIhqhjzcBqCmMbG+SKdK7BQEApskb7W5kpVsXWwFhtUqDalfssADfi/8ClcR
 8M0iv+GorN12umYrOugdQDwr6Foi3BQsEgZ2ygS4mRkmVXPoMsBGiWYz7262L0GcYf8K
 mvPt2Kubh01SUlVVWRcGhykmYW2eXxwln0RZMTDCqzlx3CF5BCP4uSpSqTorNZ6eZYKG CA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybmkapu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 07:25:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VPDEnf7ckUvsJ+43IalxFc8mg48YQfrmoMxSJIB13rTdwI8ui+lNITT96BMCueO3sXlUcBCTHCCaKH+eN1r1JNaC5/5Y5pe8OVwwUtz8Wr+sjkKBgSKMQSSU6VDv4pvkT4ZtFEcUVkIZUmYMdZA9OzILJOuy0akd/dQfbaFT9xuBFqg6ZP4cJT3AU5ik6Rf4hDjzw5XDkcXlYYcLeHq0hD2cpLIgmyQ2/Zjo3kRIXwydsdvAaoqiJ8wTYqN/O0mVAbH+HL95rVLARYtf3iG5RjTkiYBSmK3sGsMl0EoJumkt10mPfM9B1F4zNrOQeqNLlsr2Rd2ZcnxurI54dCGPZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIYUBAQWPj5+/BTpthHqJUsLE8yuJhJ0ekz2I/kmq5c=;
 b=CRuMGPYc9QhvyJc0LPCHfAdkT7XnEB73IxD4x9KLxhBuoshcstRX//oPCgLD7rs49ZljDAgfpzjPDFi+EGVihHerz6Fe91fxu5ctZ8AJmuOQs8i6DQjmkld9QucZfWOsMhqYsBZ2Be4CJEfTiq6QB5Us87DdgZjcAkHR0TAovWXKWaamViXR+dZcIK3tj4B401Ci2qZA9riObICDFZ9z+YExgl98Am8kb+5wynkpLVL1rRPFaCrKcNCvgCugqDvjtF+AC4K1SsLwuirddTuNnaMn/Cgbnk5Oa5gRIMQ9EgKO5U9uB/jRPh72+Urtxuesb19InxUAy25TgTDNCfm3og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY5PR11MB6319.namprd11.prod.outlook.com (2603:10b6:930:3d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.25; Tue, 28 Feb
 2023 07:25:04 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3%5]) with mapi id 15.20.6134.021; Tue, 28 Feb 2023
 07:25:04 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] gpgme: fix python setuptools invalid version issue
Date: Tue, 28 Feb 2023 15:24:51 +0800
Message-Id: <20230228072451.23628-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0054.namprd07.prod.outlook.com
 (2603:10b6:a03:60::31) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CY5PR11MB6319:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f453a51-a50c-45e6-7c44-08db195ce8f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mV/L92zOeunyMPz25+RNOsrAjxNOmMLrEGDpvoMOZBH4FRCArczGSSqnjhfJtH+SqhAlApi7EFW/G4tPWXnVDVoeXBNFmAyfuxzDujJOyZ5p5q7jDZRHd6NdeK74KaNFZW65gPO4KtAQt/VVc2AckGodrzE0Vaon/Mojb3Cjl8VdfzaWCoLrZigX+5fQDCl7lTVNKC+p76lifiQAoENN1ZkrlUCk1/uEW5pbT+PtxNg1ptq0vDnEqJ5/xjQg2Iixbf4WHJp1NqPIRH+lkdYhz5XnfRiF89EEpN8/B3tWUwtFO97FK5dbRQ9XIKC8oDUK9rppmUKqL/mOOnuL907Q3JEU83/apBwvmXlJ7KNP4U/BxcbvIKKO1z/OMJBTvb9/RZBj4Op07PJwZOBgZmj5A5WFGO0YwJCbGO6Gu7cQnRDQh//V6UdPIiaKKxP8zb5WVF1dE7OMQ4io72RCHJU5iP6S3RUxfxTXPCH3/AeExWW8WY2TlCnZ172W1VPk8LJ+URT0uEJowOuWs7lwgmu9lyDnz55JBkcBDxU7krFI6GmyrXfhtLM1ISZxvaqg3l7afZy74bWtNDuBVROyfy5Eah2lSPUSJJUV4mYDe7To2iTQhAzy3+b3cLM6/5t1ZDZnFuafTd658RJsmeOIcTWqI4Kbdm0/7QFCL4EfKpGwGUhircRg/Pp0ZRVS+N/tgaxa
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39850400004)(376002)(346002)(136003)(396003)(451199018)(41300700001)(2906002)(36756003)(8936002)(5660300002)(38100700002)(38350700002)(66946007)(66556008)(316002)(6486002)(6916009)(52116002)(66476007)(83380400001)(8676002)(86362001)(2616005)(26005)(6512007)(186003)(1076003)(6506007)(478600001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?g9Opwv08BXRV4UUY6UnEsBV+BYUmXsybuuNBGvjTRm3/HnWO96o/nMROxeR4?=
 =?us-ascii?Q?u72+SuZsiQTDVu0P4eM0j8690g8ypQvzyRk5udvyFb+98RnhwXgJjGsu/3SB?=
 =?us-ascii?Q?1blsDbXphjP9Rk5U6MsSHsujlDPYRGfzkDRZC+OmZm++Ym7IVZRcDY831OKs?=
 =?us-ascii?Q?pVdNdsfunJUDlFzUuIZRjmnKDTP1QyUqmhkxeQm7yDBs+9r/hzcNN1bT3EJr?=
 =?us-ascii?Q?igR2Gczs86l66m0hmzKSkJW7dDH+cq3vmZVxxbpeHf1gGyf0VY0p8H4+bXbY?=
 =?us-ascii?Q?n/+1NRuXm2u4s36t6VcnRV7B5Fph0azWbAsSOA8X0mTyGdfYSsibBjlTpl2v?=
 =?us-ascii?Q?WoFNsyibA9cTBKlXwitcSb1NrsSPXbOoIIOcjHV9i3PuRJyP06/RULj61EKW?=
 =?us-ascii?Q?Z7S4FHJjxw8GjIjGWkim5hd7w1cJ8RSMnN74y9VD/vjPSYL3p/jcWHjJ560K?=
 =?us-ascii?Q?p5F8WTEYdD3qdQ/Cmox9XTNNbXvk5fcJMxnFgbLHcRVybKYtk/QFNX2QzPFs?=
 =?us-ascii?Q?tic35lGJOg4zy4sWPlwRw33bPDCvcoA/btG2iGzQvYrfe+zHDTXKb/9l5JJ8?=
 =?us-ascii?Q?10pNn4q0OV5b8S2hJ74J7N5HIvc7sl+RGuXJicZUeBppHeVRoh0dAMXde8XD?=
 =?us-ascii?Q?YJQNMUdnOrvPExXTpiHiXFlwBfSe2Ykx5nCJH/4SYTvNYykX3iOVc96q23TH?=
 =?us-ascii?Q?1QVW6yuFQCNEYMwyJ9fNUmj7Q6TSZJDbPgqQKCNYv6jm79Lsw5KlGGiIyiVU?=
 =?us-ascii?Q?bnuhMwpzL2ejG72tc8mVSLcW9dFJ5pk3VbvefqXx+H0xrrDSfGeWS5obX1Il?=
 =?us-ascii?Q?+3NqAfXfShUguMyKG4vDIu6bdfUe6XDsT00UN4g4rc61MIm4yhn0YyPR6k1p?=
 =?us-ascii?Q?PA9qZTA2V6JYwZQcq7xCASDvkK5HqJ0jeIcPWl1luy/AUv8xcffylE3HubTg?=
 =?us-ascii?Q?r3geSN5ivuOBcvC5UNvJicJ+ityHpWiyLQWPbxTzNva8VI+KTIxHF/+h0Uyv?=
 =?us-ascii?Q?mahEzBOn8S/q78XF0b9zAEUQbInc3qd2h+ql85lxPZG9S7Ofq6ZIwIXV7IgW?=
 =?us-ascii?Q?2QcuZIoIXjBQYxxZEPcqdlnrCTzMKwUodiCwlSAEkWysXSAWwYofpeD2X5Hr?=
 =?us-ascii?Q?6HzMjLnxe4601/VLJdblPz6mxHTmvQyAr5f3hRlOquopaAzAM3YwcYTRfXS0?=
 =?us-ascii?Q?XMC/8Sa6G9tqpb/iBQun4qYZ79l3IViewW/9ZZzG5FbaKWiJFXbbeRh6EGAV?=
 =?us-ascii?Q?YApsIIz2sOsMf1aRqDXYhx5iL53YifPJY64ifuX2OmR5n1stF8dsApHfna0q?=
 =?us-ascii?Q?vATynROfereWfvkvWQfA2QlqHctM5MIDQI6rJfIFF0rE1+XH62r9Ff/ZZrDq?=
 =?us-ascii?Q?FO3alP20TIYv/Hqgb0+tueW/1r52Znx7qDnJiZWkrBK3eaYa8L7HaAGIuQ9i?=
 =?us-ascii?Q?nd1fU+ZbFOIKLiHZwaHwbmdWuD+67QgRN5YPRnmtl+fdNEsGbIz0pmsUdevI?=
 =?us-ascii?Q?zkX0oTYRBik0L3kcCz8qlHOSqXb3Dc4rQTixElWuh53AaCoC2eYdh5xAzYxv?=
 =?us-ascii?Q?r12XRLgP3TDgPDDPVMUGzxgN5GpDzhHhnW7tPf5t2B6mIp+Q7Vw8KWvO6Oqz?=
 =?us-ascii?Q?1g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f453a51-a50c-45e6-7c44-08db195ce8f6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 07:25:04.2335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8RmwOkzgQA7kCMK3r6LmdQ4WGNQvrow/wDE/oNbZs5nSIFxlwMCTyszQiZO6oW2iuzHxC+6GKt5zXZejbvqeLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6319
X-Proofpoint-GUID: JK0MZsn5TCkiPQ43zWBsw_NyhoCnO1Pw
X-Proofpoint-ORIG-GUID: JK0MZsn5TCkiPQ43zWBsw_NyhoCnO1Pw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-28_04,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302280056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 07:25:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177824

The python3-gpg's version is now '1.18.0-unknown'. Such version
has been treated as invalid for setuptools >=66.0.0. The error
message is as below:

  pkg_resources.extern.packaging.version.InvalidVersion: Invalid version: '1.18.0-unknown'
  (package: gpg)

Fix this issue by removing the '-unknown' suffix.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...autogen.sh-remove-unknown-in-version.patch | 34 +++++++++++++++++++
 meta/recipes-support/gpgme/gpgme_1.18.0.bb    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch

diff --git a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
new file mode 100644
index 0000000000..81af86e7b2
--- /dev/null
+++ b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
@@ -0,0 +1,34 @@
+From 46f346dff73122caffe62eda84596a3a3bec859e Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 28 Feb 2023 13:43:51 +0800
+Subject: [PATCH] autogen.sh: remove '-unknown' in version
+
+python setuptools >=66.0.0 treats '-unknown' as an invalid version.
+The error message is as below:
+  pkg_resources.extern.packaging.version.InvalidVersion: Invalid version: '1.18.0-unknown'
+
+Remove the '-unknown' suffix to fix this issue.
+
+Upstream-Status: Submitted [https://lists.gnupg.org/pipermail/gnupg-devel/2023-February/035293.html]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ autogen.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/autogen.sh b/autogen.sh
+index 9b36158..d5cccd2 100755
+--- a/autogen.sh
++++ b/autogen.sh
+@@ -266,7 +266,7 @@ if [ "$myhost" = "find-version" ]; then
+     else
+       ingit=no
+       beta=yes
+-      tmp="-unknown"
++      tmp=""
+       rev="0000000"
+       rvd="0"
+     fi
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/gpgme/gpgme_1.18.0.bb b/meta/recipes-support/gpgme/gpgme_1.18.0.bb
index 7ff4837d6f..a7b0de44a5 100644
--- a/meta/recipes-support/gpgme/gpgme_1.18.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.18.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0008-do-not-auto-check-var-PYTHON.patch \
            file://0001-use-closefrom-on-linux-and-glibc-2.34.patch \
            file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch \
+           file://0001-autogen.sh-remove-unknown-in-version.patch \
            "
 
 SRC_URI[sha256sum] = "361d4eae47ce925dba0ea569af40e7b52c645c4ae2e65e5621bf1b6cdd8b0e9e"
-- 
2.17.1


