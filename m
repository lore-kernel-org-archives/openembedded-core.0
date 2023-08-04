Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B629EC001DE
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 16:13:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1336.1691165600662539924
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 09:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Hm7IvXKL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=758025d3a0=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 374CpbDR009063
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Aug 2023 16:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=Rf7ZSVc7BJWHRP4ew0
	iHjlpPbj2FMe/5XnCE+6xlwYM=; b=Hm7IvXKLppGBDMiPG+ArnicrYXAgp0Fht1
	HfWsZZhWKDk8zU4mNcV5Sr3++Ilwmkm6bBOquwUSRbI4f7V6eJFiP5gV3oVpVWhf
	AS6ezwBhdEPyoYrPMZ8fnhIC+vju5lra4x1jO321+RkyH3tuqNDvSUPtDzJyvVJe
	LSMrtfTfdOeHEVcnhOrzYF3cNB8vrYnkABIq5Oa1TuBZV5XN3cBFCdf8tgvwr8ht
	ecQK0ILtsz+M+TcteszvX6nMEdA/Q37thomcmPtBCafcAW2roNa28DNSOC5oLczw
	RTrH+NmVoN80dRGhRu1CopVTLA+PBS8xcX4WSn05rStkykHef0RA==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s4qyx618a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 16:13:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7hn9R701HcR62edU3fw7qEf4ArW5CLZxLMF9+s5QnDLlnKcIJy1CaM99IqT1/NujQ7PmDQGpRKgJCAppE7qQEKjbndcpWgLbbhXhUn3N5WFo3MpyXHvuYqajI2WxDCu3UZ2E7J0KqW1nqten+clovWaFWuNmdHI/w8uhz9uFLagOMqcRPbC/+89X1O3i67aigcouIq3KmvS3QA1tc5jY3L8S3SP38OFmHTlrmegVY7RI8nPjoOMIXCVJdOVnobx7zEoU25l2bGL8CPiz6no+A1MduSUTdD+OXdmlG1HPQvAoz33l65eTfRgrvFnM/o3GC2bmXgM8zik+/wymWftcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rf7ZSVc7BJWHRP4ew0iHjlpPbj2FMe/5XnCE+6xlwYM=;
 b=CwGuo6M7q3s3SWyUThKeDX/9dCpegQy14PSga+S3a7LQeDi/DRhNNEGE16/T7/YAEJ0EqStSbzCMArB5oEB4UjNuMNpGL2p7s4Y+dJA38adZ3seUzZcSLulBR9EH/RN4g3PkLDoLsD6mmvLjxYOXlcBo0WNRB6jUGqokKH0iZ+72tMPwY4olPL3GS2cEC+JjZTBP2abxcZ1Ti174XlGF+BKsz1pLqSvy6YxcvT2rEms9NeDClsfynBwjYwjuKg4ZoTDZx/PJ0vIErQv9saiFWpXrucA4u0Y3F9IMEpUCHUZn1X+P5sLdZTSIQ9PtMIN1/b+fepR2xxXTMvWy6X1y7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by CY8PR11MB7316.namprd11.prod.outlook.com (2603:10b6:930:9f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Fri, 4 Aug
 2023 16:13:16 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::1f8b:45ed:dd21:9c99]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::1f8b:45ed:dd21:9c99%7]) with mapi id 15.20.6652.021; Fri, 4 Aug 2023
 16:13:16 +0000
From: ovidiu.panait@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mdadm: save ptest logs
Date: Fri,  4 Aug 2023 19:12:53 +0300
Message-Id: <20230804161253.3910121-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.39.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0235.eurprd07.prod.outlook.com
 (2603:10a6:802:58::38) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|CY8PR11MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: a17ab1e2-9920-4b4a-9242-08db9505b5ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mGR9XdP6ceCtypZIdFNNT2jWBGfBskrc3NXHHzx9X1A0+xO/p9fvL7OMYk8YuUznEJwttraLPYcBvkDXmDPsPbvVptgbWzfqWa5HvR/Ssxm3lVPabpRkUxW13UGvF1cQTZH0v58Q6ibyHYuP5JOEsoHUflZGFAeWGtCNtPwmEiOsS0OluoSpeqDoYuricuk7ldMvKdjAK1pYEXZuCuI+Vg0hUCDxZoklfnK42dqxWyc5BfgID/Ew1welRO0FmhsJI1SxIbGqiTqxnkYX7L/igu6XnM/cQf/Nujf421e2KIKBC1gsZXtaYN9KD/VbZybdzGcDVvorF3RUK4U0FInDTeKVPmZ9Hrj2owbu8h+JIPk/plVWxpVYK2/JyOR8yhHVRGpT8L7N1R/N7rjvyObyNYLgxEkZoywGNnJg7CGPy3lnSBL0yHWXC8CouGbVJ+9NYl710GTgN/0nx3cykd1IIAj4olYvghewoLBGY1RxsRF9nVKWCtvQbT/vc0z9rWPCQo7qGDIVeSCu83zF2l3jaYDkM7uVIIhnFfylfGZEHTMi/9ucjZuhjhWuSyfDAuAHQiP6mbm4GHVuIW8lXizdtDxrWfgMdHGj9FByrtB5C4xZki24kqVqY7mVFFsCsbih
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(39850400004)(346002)(136003)(186006)(1800799003)(451199021)(36756003)(86362001)(478600001)(38100700002)(38350700002)(8936002)(41300700001)(1076003)(2616005)(6506007)(26005)(83380400001)(6512007)(6666004)(8676002)(6486002)(52116002)(9686003)(6916009)(2906002)(66556008)(66476007)(316002)(5660300002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pceAmK7LcdU/dWr7nNqB7KrS+LXacTm8mR/FTwvejsilZp816FF67HvJE7Tw?=
 =?us-ascii?Q?fyr6sq3vkP7gfwBK5X5EbexhBRocT9BhbRdcpL1I1/3bkrtO6GoEwVNoosGQ?=
 =?us-ascii?Q?2cFlPBuuIVUpnv9+/5ytU3qGc2TqwVNqHQ1uMd4AZK00eL5z+cSU2DJlVkQa?=
 =?us-ascii?Q?m/j9CjplDxaevUMoacr6Chl4R3G2YmgNcU1jH5+DWRaePT+JBGqSxWn8CjXp?=
 =?us-ascii?Q?t29qMsPnq6KjPsqrKwjoi1Tu6/6zNWUzy7j6kK1mVp3/VyZYBApczaXdvMaj?=
 =?us-ascii?Q?lLuw8O9SKHKzRDq5G7+dHmMRs6b5/Jq68cO4I166/8Q7jOcJR92u8c3nPDBp?=
 =?us-ascii?Q?2d3z32eokFhamuVZApo2FV3tnm9YzuXYKUiGo13VLb0Ika616ODmmYc6A4/a?=
 =?us-ascii?Q?aCfw507K3f4lJitX6CGe+PW2ZQw99wnyyXnP1SsBHDFNWk1k+aRaBvbDtWdA?=
 =?us-ascii?Q?ReMw/lJGFE/KUafjrHonkzUFWP5NW1+mYXVDlzNMiuzg3i44TwxwvqZhHdDn?=
 =?us-ascii?Q?SP4Jzb29unIf+cgw+In77n2efTloT260L9rusnJvRFZ3IpQNkQ+iRLY4jPIa?=
 =?us-ascii?Q?X+aC+szPowupjduJ48Isdg90/ZuW7/9zWjGJ0/Vub0FcuIAC48qpiPxek4v+?=
 =?us-ascii?Q?5gKSAFsAm1FudxNhapb3L3cn5rVNSKT+0ubPKumGdIprj4+ks26afC/rOD5l?=
 =?us-ascii?Q?2XQU/kL6+On1IWhV09c8m88XMtWdG0wns96g6bPt+YBaxvqmxpT0xKO5WJFP?=
 =?us-ascii?Q?2BbCLLrBMNLIYHQdkDwLPRl7ys0CbSLmwlaqiqmQk+tph1r4UULe40M/8iWY?=
 =?us-ascii?Q?1oJZUD+og3P4VFMGAlz8qVDcCHJoKkVHiNMqwdv74SFMNRKGtlkp6xfbpe6o?=
 =?us-ascii?Q?ZVIDcjVlxAb+r1xCfEBG24151iDPcKLLS8Tmd39NS+9yMSxDd2SwIwgTmrVF?=
 =?us-ascii?Q?p8IbW1GHfaZZrw3CAssYue5a34CsOBerLbKFukKuCiowj6xUuiv7/DvxqKVi?=
 =?us-ascii?Q?HMRQfy2VzgVbTxAucGm27p4akj5ZF1tZU/SJt22CLpBedN3d+OLhNHKg4VHu?=
 =?us-ascii?Q?z3EeB2TQHYwhm0KVY/NiERgwlBQAeh1XR5jkg9JVDDjLaINWtyNqRcru/Hff?=
 =?us-ascii?Q?j1hIy92yWcD2ZrZXJuEZL6muG2Lhz7jcMLSamPI5/AvRxgSZJ5+NbUcnKmMz?=
 =?us-ascii?Q?7NOyTHYMs3nsvxym9dHL83wfeKL+DTKiWYodPAbxQjOoJcmxmNms8ebPZ+5G?=
 =?us-ascii?Q?vA9Z6FhMl9rLDDykhZLUlcay81xSxMISbDra00Ke+GQAN6h9YYfr8PVA/g5M?=
 =?us-ascii?Q?vrVzOLcL5IjBveThgBYGqyKLOP2OjLP04V4nqv15vCK7wYfk/0PLYZRAWzhH?=
 =?us-ascii?Q?i/Upw07NHbQMZQ6R5qWc9IQlzeKCXp2v26I1Ce6dNgE9m6ZQ9ryrGk+nO3MK?=
 =?us-ascii?Q?76hb6Ei5+uRcnqfk3JYalWfMNxoQChYewcIib3K7FRRozkUEP2idcDhZ1Crf?=
 =?us-ascii?Q?F2NAmn9J8zES/Umy7D74G4plVaYu8TVNuUUU4mH1W6CJ3Ukh0KI1z8e0P2V8?=
 =?us-ascii?Q?VC+Ogh9qBcez1pAZjKrWuqJ7FFIAYceiG70putsI+eehTU6+OtPvBsh9+Nc8?=
 =?us-ascii?Q?JA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a17ab1e2-9920-4b4a-9242-08db9505b5ba
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 16:13:16.3208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ee1r/cgiU0Qv9zfsJSz97kDlSDuc8siK2uN3S610k0NYWQ96okG8CJFv88wZyh+8dHal1E/FKhsunqMHeKmHnjkxbeA1Njd6AIbujGpbiY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7316
X-Proofpoint-GUID: JNMcQvwZDAj5jGBeGlff8NctwLrhmdTb
X-Proofpoint-ORIG-GUID: JNMcQvwZDAj5jGBeGlff8NctwLrhmdTb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-04_15,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 priorityscore=1501 mlxlogscore=827 suspectscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308040145
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 16:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185530

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Run test script with --save-logs and --logdir parameters, so the log files can
be retrieved in case of failure.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/recipes-extended/mdadm/files/run-ptest | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/mdadm/files/run-ptest b/meta/recipes-extended/mdadm/files/run-ptest
index 2380c322a9..c3f201491e 100644
--- a/meta/recipes-extended/mdadm/files/run-ptest
+++ b/meta/recipes-extended/mdadm/files/run-ptest
@@ -1,7 +1,10 @@
 #!/bin/sh
 
-mkdir -p /mdadm-testing-dir
-# make the test continue to execute even one fail
-dir=. ./test --keep-going --disable-integrity --skip-broken
+logdir=$PWD/logs
+targetdir=/mdadm-testing-dir
+
+rm -rf $targetdir $logdir
+mkdir -p $targetdir $logdir
 
-rm -rf /mdadm-testing-dir/*
+# make the test continue to execute even one fail
+./test --keep-going --disable-integrity --skip-broken --save-logs --logdir=$logdir
-- 
2.39.1


