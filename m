Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF92BCF9C6B
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 03:32:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9048.1726975924871871178
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Sep 2024 20:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=999533e59a=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48M3D3C2024523
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Sep 2024 20:32:04 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41sse4h4n5-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Sep 2024 20:32:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i6EIQlEiUMGgNxDnInG7bMcgm7+0atzuLoXXx9IOMwCGqpjG9LMOS/8iDbD9LkGKzj4E+sOTij/tWYsqci2Rj+7762lVjUE3GqEEyjaGY7jZ1Z4cNj+krAhRBiJVEM1sVg/HugbOY4yDlpuwuKCfBjAm6nzfX0HA3rYZpPrsceHGzLQDw2Gd4iPl4CEWDjvbB1UsnZ7vTQOVG6bi83WrLyHMqZkrPudv0WxMw9Dm5+wOYfzgxeRghWrjQ3zIUrSymUg5dCJaMzjo9v9yqGe0H+jD6JC0+MX8IYG74CDHSn8+qbanKQNK13LnljUVBTvm45ZKXby4cCv7DS9cmhBYyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CetBa2OtrtZANrk9BgYQ/oDTHDqpVoKd0HQwaHAta8=;
 b=FD2xu0tZC73Mfp4ZC4pe/5LaqgvzzGaRpv9BvDUoIZBI+gJEoyWIm0ZsuAGKu9SIRoBJT+9ZiRN345Wo88IV9O8sCLtQKEzx4m+qyJwUHQ00whQTs99Gx2B5ST7y9lOkE0r5HYUrS/gmaBzsWRfW1zAaE/n1iwy8mimHDeM+nc0bCuKO9tc5CFqrPQaq0VWXoXBAXzrpz4aOH1NDRdp+zyCYVJYDtlQuPpsL8X0gUiQDCn5TpRtHmCV+lx/fAYMrTjEMoFE3eeHgxV7P/1Mi15LGiPurWw9daNVtWu5I/904OskOIj4/NpmMZ+unf2uE6cLyazSi8ODo0EZLt5WnEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB8113.namprd11.prod.outlook.com (2603:10b6:8:127::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.16; Sun, 22 Sep 2024 03:32:00 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7982.012; Sun, 22 Sep 2024
 03:32:00 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] bind: upgrade 9.20.1 -> 9.20.2
Date: Sun, 22 Sep 2024 11:31:48 +0800
Message-Id: <20240922033148.1138038-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240922033148.1138038-1-yi.zhao@windriver.com>
References: <20240922033148.1138038-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYBP286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::34) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a3e1940-d480-4823-20dd-08dcdab71e20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BUYftWqSw5UQ4mk9iE+Fg/N/EBaNpHJBdYnkUUPnuV8cEgx5NCs8qnTZ0od1?=
 =?us-ascii?Q?2owOpHAyZxjxVaDAOCCzbcX4Qg5vt8MQ2taRRTFPBK6n1C5mI7O833LZSoU8?=
 =?us-ascii?Q?3ai7+g6m/sN0Oh2ZkkbGtpk8R0kVROCX56fd77ag9rqEKaeG9SDLN/FedS+5?=
 =?us-ascii?Q?21LUSt/kFmummAq4yi+/s0q0KmHs/M/Acg7lFztfw0Vz41XnasHd94SmhQKh?=
 =?us-ascii?Q?toO2lUiVIL8H1mnl7taV1UnvFL1PKjs2Hx0lBjvixybA1yTdlT0IvxDfhlS0?=
 =?us-ascii?Q?ryaM0GPAxaO6CHB9QfSLydUyTTUu/PJ1wCd1FrZ5CFPT9wdUUsAu3Wp28R5X?=
 =?us-ascii?Q?2cdODqLy36126bsTzvBRZLHY6Enk+2QQG7mhJ4aYVIQzcTiJ4wI79qdFXlQl?=
 =?us-ascii?Q?v4HKXo96wzyyyMLXGYZhL+AMB4flF/2GWODJHgfb/QItT4eZ3Tw9MAlvZ2aF?=
 =?us-ascii?Q?4U+MpZhLwRxZXjtsTw7cHA06vYyXcgE1x2cY+QF4CKLJGv0sGQ3nRMvHNa7Q?=
 =?us-ascii?Q?26gDylDoNVZHyu2tn5RWjQLytR3Ef5yZQPjpEj8REGccVMdpeVM92AQSIQPL?=
 =?us-ascii?Q?t6WYFD/jSNTYHmC0NGSmEyqWe/PUOHdHPcbGu3AEAW3WyxYStqEI8swOXONQ?=
 =?us-ascii?Q?rxPISYeosBkRQNMoJQSE585hFkUWnf0fcOY6mAQSerKBp6blJ9EODziz1NIn?=
 =?us-ascii?Q?1mNj2DoGiBmmoA2ZLoZ3ySsSd3U1UGp00H9hgSE+/341BlB8EvBUuSVHRbUw?=
 =?us-ascii?Q?dHDBoNPEIzJBZmMBhDw8oM1/8ItjjAnLByj8r0wOk4ArYRxYnChaRysnUZeU?=
 =?us-ascii?Q?h+eytPTSzSB1Vz1UKhWTxmpGnjE0um5NVWDqLDmv4rjrMXBrXKRJaeEyAtw5?=
 =?us-ascii?Q?Xs0z57kG0DEHm+5+MoxwaN3/Sbc+naBoZsIfJmn4RF6iQFSMxEXJlFWtz6OE?=
 =?us-ascii?Q?mu1I6eq2krWrjPn8Qp01aDfVYY4A+FAITXYXFN3WD+MPlF0pashQ8e90bezq?=
 =?us-ascii?Q?nILZ5pLfzUh1ui9wZ8XvYA6XxSVbfFzayJiy92t+pOoUmndKAFpgSBpSK2Vp?=
 =?us-ascii?Q?RPrn3XAa3slfPk75i3Kgw31Zmese6NTUY7XLJEjatdy7Z33J8WNl/dbCBlbh?=
 =?us-ascii?Q?fDXDnKLnqYnadWrZomW/wt/op1YUhdJwmCVCyMENB2KRR3clWri8/e7k5SYj?=
 =?us-ascii?Q?uZwGhO63WZZ42K9bXZHCOgsQ0J9lcmH2Mty12Qm3RPIFbeaQ76yBV3UuVfCp?=
 =?us-ascii?Q?KxWLWs6RhK0JIa8wvjD8kwJmpGzKpUDOS5XSbKnc6WZHO1JmnAHc4ZRktIFS?=
 =?us-ascii?Q?4R9lTw0riP+gn69rc3icGY7MfFE67IGeKYBD/x3a84vvDXoPzZS47uFrYNZS?=
 =?us-ascii?Q?OCc2G6U=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ioP+UMD1+eTlALA+6gCiScLe4OoSBaW/VY/odbrY8d5uEgl6HQYcT6E8Nf7j?=
 =?us-ascii?Q?D12QsKLaPclAO0MwYR18OMGsoYZc72Bh/d9Ilv9NeCSIkd4al6taeMWYnCT3?=
 =?us-ascii?Q?LRcM9LvxUrBUzBl3omzCzvuWc3FBb+v40oDT0l7w+J9dppeeVxrudPf9S9fe?=
 =?us-ascii?Q?zjybXf8GMk6uJWbpaxaInb4wzs55yYDtj1kBzX+g4UmOr+fjvwoH79VWfs9e?=
 =?us-ascii?Q?NucMrPl0mzO7iHxvLQK/90epWVSqxmRs8vEX6QGeMakbQhVtnPxH5RevWFZS?=
 =?us-ascii?Q?MGCdRddbZCx3qvNoUelrYA6vfD/HwAv97VZMLekRs6/z3VcFbV/LZLjeaNT1?=
 =?us-ascii?Q?bsK1IzXGr0MpxJya3nHlqQWk9NgK6Ww43NB02fTqtj68UWQWmSthP3Y0hYqH?=
 =?us-ascii?Q?LIuyR9yziAhVGlI8E07w2vd2rFBu2tm9EYE8OsxuVlMP2lIlLxZjPFcuszAL?=
 =?us-ascii?Q?7qlQvW8u0KyS3yJUdIdPA2I7BcxUX1RiQu/V0x+0KW8hCli4bIVYb0JsxrFM?=
 =?us-ascii?Q?YKHt996ivPt/C84M6jcp2LXOM4MR3V3G64griZb2KLQwoAGB7O6/2ZZ3SEgA?=
 =?us-ascii?Q?qocpknPKJ9HFespZLVeFtwuA6fWPea7zEMv5cMKNrX712SLtZJVjg3kwvxFr?=
 =?us-ascii?Q?d1SFvI4ZUGMC8j0IkMnhGBf0V8NrmQfXgeQXqjqLQSkzd5OA7xflWr/kyJbh?=
 =?us-ascii?Q?dhGyknzdTWly+G6p0iQ/tgOPCfAW5B+eNM+KnAV+tO5/kOwIVb7zgt3+tLmG?=
 =?us-ascii?Q?PpBSjl9VFWz40vngt3hVnMFCc50TBGTo4RgWn+JcMHcgzBkgrQj4HwsHtzTg?=
 =?us-ascii?Q?0k48dbATHF/tKG/g0c2V7FtZ174VLLrZDDWhNz2lO2nLwquN5YCDgEU+IZ2c?=
 =?us-ascii?Q?ebf/kvAv+KWtXK9F2ng/uw6eyZdci1rmkZwJVZ6rPueq8wJ48FDSQCJYBPUl?=
 =?us-ascii?Q?ee5VFbbgy6yMxj0RUu+l8HCG40z5vr9yZkWmgVyaxSJxwOTpZrA+u0sURYUB?=
 =?us-ascii?Q?n+ypRXxu88jPBwc4NaJv//6ky4ymMI60MteEdCZBRbR3S96oBUjxUGIVsOUo?=
 =?us-ascii?Q?T4IeCq3lzmBZUxIj0R6U66bX79YhwnzS4E4T0Zx/6aCxo+LD06ds8uxh352U?=
 =?us-ascii?Q?8dMFunDmJXD1KXnlC+rkTROE6A8MpjW0s39RIhtTk3CMrqeX6SgzbdMHTgby?=
 =?us-ascii?Q?EJQzy46DQQ2BiMY+N9fUFhVsQfutKhlSH/wKvwbgznKe86+qNcnKFfhVQnFW?=
 =?us-ascii?Q?WmgB5R6b2a6mk1Fc9FgB8Ymg7PzShYbw5KBzltFd8xMinMfpSfBnmj9TvHGl?=
 =?us-ascii?Q?W84NK+8QFGbtVPRTc9TM50ybn8FyeVtjja91s5/B4cMqg/UGDgvgmWhxXANj?=
 =?us-ascii?Q?je6oDuJmlg0ILFsk88Gn8lCfTImgyKFeTulWNZxCYPqpat/Mw8jimEGs10+A?=
 =?us-ascii?Q?KB/+qi270ZR13oPHWyzRhZqv5o1YcC5HFDo5Wqhxp5lO9nPg4IySI2OLbpiO?=
 =?us-ascii?Q?UbcnJIpmGbl6Hi/NI2rM1C+BdGfehreWstr0mb7ol8HxLbECNmyV6X2UmMSF?=
 =?us-ascii?Q?y4bUiYcqrl2IywM3hXoNibB6s/4FNU6ti1JKjEXq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3e1940-d480-4823-20dd-08dcdab71e20
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2024 03:32:00.1575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQ/ONeHN2Yxkuc2KsPj7TR+28lCC8cAlEykkJYRsQ5BhdL/IhFQQyf+5uC+cqNbN+7kvvraTwk6mogo6DvOd4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8113
X-Authority-Analysis: v=2.4 cv=ANzEoFnr c=1 sm=1 tr=0 ts=66ef8fb4 cx=c_pps a=19K1aDEwnJ0RahI1emVHDw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=SCo1hh1FAAAA:8 a=t7CeM3EgAAAA:8 a=C7a26SD8kPzCF5QyzMoA:9
 a=Ma7MmiaVc4kA:10 a=jjiDOD437DYA:10 a=nwb-CePKZZm3gL-ai9HY:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: -AyFMEBqIVTfcObcIpr9YCThgE1ZiSnt
X-Proofpoint-GUID: -AyFMEBqIVTfcObcIpr9YCThgE1ZiSnt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-22_01,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 mlxlogscore=969 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409220025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 03:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204769

Release Notes:
https://downloads.isc.org/isc/bind9/9.20.2/doc/arm/html/notes.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../bind/{bind_9.20.1.bb => bind_9.20.2.bb}                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.1.bb => bind_9.20.2.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.1.bb b/meta/recipes-connectivity/bind/bind_9.20.2.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.1.bb
rename to meta/recipes-connectivity/bind/bind_9.20.2.bb
index 9c68c918e4..02401b6c4d 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.1.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.2.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "fe6ddff74921410d33b62b5723ac23912e8d50138ef66d7a30dc2c421129aeb0"
+SRC_URI[sha256sum] = "a31dba2aaa1b371902dd0474eb3963f47b7ffed2bd9ece7da4834e23210d6067"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.25.1


