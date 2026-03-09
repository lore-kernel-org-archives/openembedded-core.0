Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11E2FCA168
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:44:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20768.1773078280883595816
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 10:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lP3aEvWR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7528dde4fb=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6296A2lM4140953
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Mar 2026 17:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=1+bCug8VJZ7Obny3RwivI/N2jd2qAIGHcW5r0dvmKg8=; b=
	lP3aEvWRJIOLMnTYJxHojo4Js8l7PAfhHkCMedilAijxKKtGrEoaKzliYUpz5fz1
	K0PgrnEHeVRazE1Ac3MJ5lKUx86JnhfDdtYNlhi1TqddQ1ACAAyi8fVoTPPik6JL
	K7wJb16Xtq5FnzK+SXK6iuIROhOqKTy5pjGuqrgD1bBRbn4Wf9mDxCDvK4U0/XXv
	nOCRMAGhSmSAhhTYgyaSbIuuH7DyNNXBGSo2tYoZpI+oLRWmx1c+hqtjgMgkvo7f
	0FsMBEogT0rCSuX5yN/d/mVtZxeuKoWBDRpeswGONdPDULf6Gsd5Mq4kxtfmU1ii
	TvkgkXhliCwgElhk5moegw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012041.outbound.protection.outlook.com [52.101.53.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crb08278m-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 17:44:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aTDqVi+7E61/SZ+sgGHCrQwgVcmMaoB3UCtWcShX4B0oGRq/K8zAcC1RNU8y70+oBhilp2pNhPWDbAkSR2ZvQAOagx3FNztCWGQCqWm38N8b4qmfK8A2JhGMIUmxqMAGOCNjzRno52Qwzp/Iu994iF+ncOxsT+tasGZ0dYpp29SrxpPuwIne7pCSOQl5sPIHU6PQDGjkuhlxkscnUBbR3C/1g8anGxHBHRtXnh//moeagSHqy6KM0lKVeEEp+S3o3XZQcZGS5rabXKfyGNGJDhy7mBpv8nV7MK+eYsa6fZcrsLHgKRGMkPzsXva+49SwIR0vuz+dvCi+KsAKSu24dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+bCug8VJZ7Obny3RwivI/N2jd2qAIGHcW5r0dvmKg8=;
 b=cabe2ej6f8AuH6JJz62AbUQ+yZKfd3apF/6QQozAQ7/n6NrzLH+YyQv1o1I1FfHhG4usk9Te83CXls6FMktSQNqp7m9n6raIhF0DeLh4wQngQqsKEBIEPoUKLqpOUYV7o7UVpQY9EjlE4WVkSmRUPgr88pBAjaVvwqs8eGUuCqYIqsf1hYCkBitEdUS0N6Vxr45ow4929FSLwWM3DBCoRt/LxgRvnxcY8paUzqKK4DwTjltUC8s99NmQMjmmqAHK7P2lZ2aG6eG1et4uHC+oFsJ2fhAoNtCGGNd7bWUDQSkwmfxhoGgW2Ss+v3Rg/9O8s42u4Qf5lsSfewuTZWUZGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB7190.namprd11.prod.outlook.com (2603:10b6:8:132::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.9; Mon, 9 Mar
 2026 17:44:26 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 17:44:26 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        ross.burton@arm.com, bruce.ashfield@gmail.com
Subject: [PATCH v8 10/14] kernel.bbclass: Copy include/config/auto.conf in STAGING_KERNEL_BUILDDIR
Date: Mon,  9 Mar 2026 10:43:42 -0700
Message-ID: <20260309174346.3384212-11-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
References: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: 18b4619f-9c32-4763-8059-08de7e038228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|7142099003;
X-Microsoft-Antispam-Message-Info: 
	nU2cqq5sQofa59nHJY0CPzQIO0TES/lAID1LDzME+7bnd7WWLXLUxYPjBqPZagmPJg+bdvsr3BONMtgCSxdYCO2OKiOCkeakEeTH+IsJvRaoS1Qq8pAS0RbXhRGd727zcV7URj10CvlLc6ygq7RP+PpCjN0xvIh5PYZuVKrHuGmM7Dl+v+WVp9z/jO/x7+vsJdx8MFPEzzKfACnZ3HtYeW+gW9hcxZn7zve/zOo5LqF5CVmsd8ex9gDWkgdwzYjhgZnvRyQKl8jwR3IThVJnNvd6BX3t+VzAs17/6taguSHpvpIm5siVQaku6AVR5ok1q2qIiww/YM7o7clc3CwaL4wIwEyw9OuwU6WN+d5S92EP4hAZ851lvChIdgvkQVweWm4H7AYIBk04LB8CX1WlH7vXtY+kP8tWYyEp8707nquvZCaVeHXoOYSEqa2+2jGkXO1a+0eim8q5y6aSB8Xj7E/flsxEwuDhwp1dvVKCRbUnmmAc4Opf9yNAunDrEgOd4f4g5Slu9SPX2jpkuCN3G6QxUQjcVGC1hPgdaJLNx0EAziHhscUKNeCD6LVX4trk481bFd8RQiAv4q38pImr4ZwrCiVv32auXaEReooRW83jlVCXBTPPQPAxpM2BU43ZCpHLGnG6IndIk1eJdg+sWUw9LocUNozfzQHbqyzL4OzXfYItDiH9AFZJaenYG8rtwkFWxWG1Ocm7N2+zZLfuRqfBPGeplf15L8djaXwQUlIsXAJGERHg4M41qJiDjsj3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zBuEgmx3jEpMPweRKUEo6Ls1P7OddxzfR63Qzp70rEeNWVQw97QUXz1THdlv?=
 =?us-ascii?Q?o+MMwcHEeK7N+swhh5quZMNjtEkwb4JkCHtuLyKCVYN3sCBayG+rwZpTOqju?=
 =?us-ascii?Q?lHYKdf+vASiGmZ4fkD91VsmkAswwuMBcGnbLgCZTbyzQCy3gFxPzfoQu7FO4?=
 =?us-ascii?Q?QvQHUUS3XqZ6SjgytNunmlhZfLH/QwKz/zk4NNoHRAIi/nHjbISYItmiPo+i?=
 =?us-ascii?Q?RmErcNiWIsHrcyBonB+VaHqQ9pLai7E1ozIFsNGFCf5XLZquen6gQcjqcaqP?=
 =?us-ascii?Q?q0YE0RFQU5LgPVzlMi19b2d3UZl0ycF0WBO3TInf82kD9OER34CzHlTTLFRw?=
 =?us-ascii?Q?yZykGi8QyOLjnrNmwhi9u22YRxhU0vZU4I52rXgCw3dBsZYAHNBoeiLcjSte?=
 =?us-ascii?Q?DIpqH9Lv6FvaT8P94Ua3muvx/hagIBnwC+9522oVNnBpNLgZ5vnqCPLb5kTG?=
 =?us-ascii?Q?BifvUf9ME4I6K1x0pIoJTEZO9R5UD+Uq6kgXMurIDLQqp9XzVDvfgr2gqEU3?=
 =?us-ascii?Q?zcqixgC3X61G/Bs7mtOAjrx5EcYkB1syzIcCKM1Kkk44/4dnjRDBi3ibmTMh?=
 =?us-ascii?Q?GWvHQIdn6pgPBxjCotCR6UgwX/eiyd9drOMI5El31wx/fkdNXni7Z/oyMckR?=
 =?us-ascii?Q?VVQoiDlC643dr0t2+BarPe6o6o9RrYN1lk7bwNqEvn3ZPysqFG5dLMeeLscX?=
 =?us-ascii?Q?9OYc9hrKb+3cuQcepresayfQ+khblGRIo4Vrp2O5/A18aOh4O0LukXIomsHS?=
 =?us-ascii?Q?Oo+VnnxpbtuhifTbNTZORboSVbvvdMyN1hex7jFn1VuhPdPImgbux3sxEZA3?=
 =?us-ascii?Q?5aWfYiYZF4IKH0veg0gD2ToU02lDMyi6IausgEudMQ8rqDyi3cmN4X/u0HmC?=
 =?us-ascii?Q?jagkzhlseac1h1xcMthNKWkfjFmd7MnxqjQxQNjw+V2ICjzVkqprCFflfeRe?=
 =?us-ascii?Q?+mKH7xlOuwsv+dbcZN+0+3vCzrybh9SFpN1JrvIavX7MhEpnJVkZGU/Pk251?=
 =?us-ascii?Q?OJ7xg8e3kPcXZQN4bGE0q5xxdfH3TuWWZqBXd/uvn6Mck1cOIYe1GYB7/tnp?=
 =?us-ascii?Q?3/kEMkoVVtIZOHpRDBuyu2KZssfzmavdeWi/K0Kmo/L/Leh3p7RHXtszxW/h?=
 =?us-ascii?Q?REV4OuM7vQiE/P7NT3j6f4I3f7JHAcpyr8ibcCL3OOSszXsiVQ9k0PcbdmZx?=
 =?us-ascii?Q?yIJ/qqIUvGd0ZeSVq0qv6TjDz+G/QGrhSlMFmsncGUTJH8bGJSLwx9IbyX+k?=
 =?us-ascii?Q?6eFao15IMEZj/25l4G+36GyplgEOfR61EIFWpM7OLIll9V3uLJ/jwlZsvY1g?=
 =?us-ascii?Q?Cgvr4cg9JLzjjNMeAg3uI1JI/R1CAje3Vz/Aw6vfb0Ud5kR3AQ4Md2Pxfr2Q?=
 =?us-ascii?Q?X2g+vhWG9Kzjz4MIbnqNuWiMKrAos5A5JRqK1V6cjCz3bou0cG5FIKQ3y//X?=
 =?us-ascii?Q?48cxstbLYmLpo/3Oy70rDaRg4EAFW1iEKejWXF8/tsd/zcmBSMWz/aq6m6bo?=
 =?us-ascii?Q?S+CKfAEqEZoQPyCd6vwm6ErfkG2VCBlxhJ2BzrZuyQH8mAhh8knh9sP4X9sg?=
 =?us-ascii?Q?aR7GTfXsVab0xA+vMIy7u/zecPJw0as9l7zKt8bjEV6ywYVfPES1RTjTeM+a?=
 =?us-ascii?Q?FyUOcOFWm2ODRQCF9lVFaPJf+lhWaSxom9nHFOYEDz6anvB9UyXB+AFTFoj7?=
 =?us-ascii?Q?pmy9mtE5pdOoSwl90lrLAIy/IlmYk6ap8ens0T0ICwy1iPO14B3SGMlc89c1?=
 =?us-ascii?Q?OjmFOxhluiEdmcEHOHjnn8HkXxH+Dfk=3D?=
X-Exchange-RoutingPolicyChecked: 
	EX1abBrLob1UudYyK1Odp2qg51D5v7O02hjXP4yPYFGX7EM9nXWUTAHRinLGSDLDhfKhAwSWQEBS3h51Mmz+vCbF1z8wvWrpDwe7tvvgTntX3r/iwRt9b1bOYkRJafHioi+HafjOP8NJ1rlWm63jli7dV6UCoiBFlcDeiqfohyrmAM/jC3/RxQTfQOj314H7pp9/ZR7um9jzzrPBOjTYlzMj9hRjamHYlEQN1Ckgjvk8iAvsfDtxNjGKcwohE9cBV9zx8lviv5jT2XgeJHcNgJtVwbhv6laLncKVEiUXq0Q5qr/oWlUP5cWKlusg2pI786AoKgpGLAA+HkUcyrqe3A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b4619f-9c32-4763-8059-08de7e038228
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:44:26.7693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kurhJqL/PGca8aN87sKe2vVDF0iTimA9aE3fFmhIuPetclAorZuU13je6xBs2NmnOtTd52ldx6C4gCist4mifse+qh9t1DvA9nxyqlsN1Kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7190
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: qOmGRNvr9dHMOBoWmayvDVAlAJMR57jN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE2MCBTYWx0ZWRfX0tLIxQW0FTDO
 seawIHMyKVf9r1ctaVBpISqB/WvyTfrd0vSJeLuN/24/Gtt+3AjZIVw+Yhtdrwu7Nuio+OYL0nA
 WjQJLAsdEBIWjY6SzAkkIgHqtCYL7bCWliL9s9bcwnK0agx5/t0yaJMny0xx8CVeRw6ckdMs9lT
 Km1Dak54fnXDv7c1Rar+Kqv4JzkTg+uT4595+iGf2CcC9JUHqno3pD3syDXP+COsxjVmts97jFk
 tO9+x1TDA0Wl397KGOPU+z8q+av+2Prpy7bMBjvISmAQ5m+hv2Xxt1/1nAwWR/Q359Vh1dTcOtV
 N9Pkkwwxw6ow9300SXPXnaj0YuJldnM36KIw/lHexBJ6EubdBlCdxdBnhkLQO2GIGCUAFTAyiJr
 QlBsvkB4XcOgfdZIWp1LVOQSzmX9vz6h2Ec7xPqZA1Yc6Ok1i5V2HQRAk8gudwtGT9kpLzDvqbV
 XGIrPo2fLR2cgyXJQaQ==
X-Proofpoint-ORIG-GUID: Et6PpH--jtDlzvwrsA4Yq2cJizbst7wE
X-Authority-Analysis: v=2.4 cv=UahciaSN c=1 sm=1 tr=0 ts=69af0707 cx=c_pps
 a=yZuzC5SkKTYVmguxKPWuow==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=TeJiQh7uZb9NdfcNB-sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 17:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232746

From: Yoann Congal <yoann.congal@smile.fr>

Linux commit aaed5c7739be ("kbuild: slim down package for building
external modules")[0] states that include/config/auto.conf is also a
file needed for out-of-tree build.

This avoids this error when building an out-of-tree Rust kernel module:
| make -C .../tmp/work-shared/qemux86-64/kernel-source M=$PWD
| make[1]: Entering directory '.../tmp/work-shared/qemux86-64/kernel-source'
| make[2]: Entering directory '.../tmp/work/qemux86_64-poky-linux/rust-out-of-tree-module/git/sources/rust-out-of-tree-module-git'
| .../tmp/work-shared/qemux86-64/kernel-source/Makefile:779: .../tmp/work-shared/qemux86-64/kernel-build-artifacts/include/config/auto.conf: No such file or directory

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aaed5c7739be81ebdd6008aedc8befd98c88e67a

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index d61cc82a4e..094c1148b6 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -550,6 +550,7 @@ do_shared_workdir () {
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
+	cp include/config/auto.conf      $kerneldir/include/config/auto.conf
 	if [ -e certs/signing_key.x509 ]; then
 		# The signing_key.* files are stored in the certs/ dir in
 		# newer Linux kernels
-- 
2.49.0


