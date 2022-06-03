Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B43C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 20:04:15 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web11.2842.1654286653611450965
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 13:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=cXFce7Sn;
 spf=pass (domain: ni.com, ip: 148.163.158.57,
 mailfrom: prvs=3153a541b2=alex.stewart@ni.com)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 253Dir8C023112
	for <openembedded-core@lists.openembedded.org>;
 Fri, 3 Jun 2022 15:04:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS11062020;
 bh=gCGdNws1tnsNGMTgGYTBI1LPH3AoNEm07HHKsQZmNR4=;
 b=cXFce7SnzDDvGvMFcadqJkVX9OUY45Fa1SGvc5JNVFPYSf0YpRU2JrpgAJ/Wqdb5tB2Q
 /yV+It15lRoJacyguAvFOaGbkQ0xCRtkWqsIZHJioW9sDFa+Jb9iDHm/HxYGf7CPc5t2
 9Kv8jYPvqkDbWE8keguWhnE10fNkDcA6mxTOqGro2U2NiwDWwOUbOKcaN6Tc/Pz0beBy
 Fk1/X4Eoe340bKTg9yo4vBdjYbusHpdJ1awSj0PBmkqIGZnX77uF4r8bC+uVNlhWQSq/
 gc9e81eFeSrPYXh+7l5QyQ27xV9o44yZihfwuoci+AGNsdslXMxf06fSme55wf+AJAe9 uA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3gbgpytx4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 15:04:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cnl7Yd0Wj5xp7Eb5tDVJmy68TTqgbc1lsgo7Wzzv5755Dl0XE9so66P/9FnK/zlF8eORQPfhXOfKZCeKJ+kYHGchbFi4vL6e78KfvWZt/lq1fPYAWUNfFaDpOTLpsHzmFUdxG8n7psfrsUZczC6Qz5VriQ+Mw/GOQiXFG0n/fi2NYVnBY8sqYzpzeYthfb54Eusk1Wi2s4GWJtc7GhVCcWqIKTEcbRXrfb7QpmdJ+amdIMgposhFscRnFw4T9ClhFbKbbPfEzlNf7cpbpaf1ikVvlI0hrErngPo3v097MVNvBKjksrpfhxHmW8UdP3NHLrOzX2w8zrW/6KFbjzCN9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCGdNws1tnsNGMTgGYTBI1LPH3AoNEm07HHKsQZmNR4=;
 b=CcyZHBdsasBXJ28nUBLB2RAqR7eXmgNOVHEep9jv0Ulm7CZgTaZftFtzuiN4ovnBSyEwU6Gc9TlPtnEU5Db8FFg/5rDYz1vQ5ctobxHQMnFA/uXc9QCLe3gdml9Ymii9zFSxb/WzpQp9418juxPynqsWo3dtctdyyzW82HAWgu3JZeIW4y7wEk3ZELcBPs1Ilohy+ZGqjnbPhdkZ6LkzwS6PEmKREPcfSCQK3lHM8tXeKivG77ZSBKeA2isBFi/cUEBzpmjUk1NyBL1tfMuqlpbQSWlBJWH2/rmRF1/2tz/9QOfyA1y2q6U6lHbFhWo6wtrGGbBQUZGgDfwUXTUtDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCGdNws1tnsNGMTgGYTBI1LPH3AoNEm07HHKsQZmNR4=;
 b=naN9dAc2RG4RTe3BAGvN5PF/mdTLMdHaUAWIfjs6iyzXYku7dO1S2Wm0vMvySNccFAw/uGlPrbFr+PCdnruQOnIgDyvqXdHeY4PmB1KPWbW+HDVxLBJTBWZyhkVYSenWBaBbnPdeO5K2vjkWL6tRYirrKIig6L4VClcD/qIgXqk=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by BN8PR04MB5665.namprd04.prod.outlook.com (2603:10b6:408:a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Fri, 3 Jun
 2022 20:04:09 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::9860:6712:627:987a]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::9860:6712:627:987a%5]) with mapi id 15.20.5293.019; Fri, 3 Jun 2022
 20:04:09 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Stewart <alex.stewart@ni.com>
Subject: [OE-core] [PATCH] opkg: upgrade to version 0.6.0
Date: Fri,  3 Jun 2022 15:03:17 -0500
Message-Id: <20220603200317.385216-1-alex.stewart@ni.com>
X-Mailer: git-send-email 2.36.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN1PR12CA0113.namprd12.prod.outlook.com
 (2603:10b6:802:21::48) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb554eba-9afe-46ae-5749-08da459c388e
X-MS-TrafficTypeDiagnostic: BN8PR04MB5665:EE_
X-Microsoft-Antispam-PRVS: 
	<BN8PR04MB5665DB4C43935B7EDF96DD6EFEA19@BN8PR04MB5665.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qMyntVKJU6itwRo3ulhZ3LtjYa9kPUhESoAfirvdhtVx3/6VutzFSkPb/HDx4nUHVSlTXLysjBPHk6FoVBoYBOgd5jgs+Et0cG8s/YmHblnSBEApzC6dM8oFcAFYWJxd/JHQ0naWO1khw4g50q1lxms55rkXtsjYawkREWf2EsDMOCBxbRkWOJpZZGTUsMwSOo6WVhIsAy84My91qGub6Rju938uZ4Vq3CAEdAJq2HL32T/tkI/3/KARkXBEj4EQih2Gs2X5tmYmLSZK6Stv8D6Sp0hcnFY+QbDQC6fMwV/kS1ChctefnhIeJtjhaNzeAJsY9/Oj+Tq4GK6pwlwICPcOwKwZDBzrszG2RVMEgFD3hS/1NUD25sGmIugWVj2//vqy7ZpfvFpE+Rf00ZrEAZiz6+eFuYUpv3S8Kwb4fT4HMyLAHOnOPcozZo8Yf2rX+JlqPf30cWw+DyDs5AI8bLWYuqHBUX19ecO9FTsK+L7ewJ86oloSux7cpVdXM5LhafjvmGnhqWGTazkQJTeZpW0Gwnxft1lEGDT8WT8Plz+tL8xemSBaqsHB/W8pkiqL/YXxNZGtZUS6wBqOGaQVO8h1wP929ZYyHkTPZHcHxq1ipz3nChw5z2JqCYvmOqDAPmEOKEeXmp/QRYOQPWBdZdbdk8Js4uybKBJoIkGQZyK2FE126XtJqV4mUXNbyuO1J9qbpfNq4/Uv/mocWqJMN5h8mAaF5cUOT+jQ2M758INZCHxlwuB4xf/j1cwqSTHk3ihujV19cARLAQ6iFYXJtM1oWx65pnu5WGj5nQJANfg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6666004)(6486002)(6506007)(2616005)(1076003)(86362001)(5660300002)(52116002)(26005)(186003)(66946007)(4326008)(66556008)(8676002)(66476007)(6512007)(6916009)(316002)(508600001)(44832011)(38100700002)(2906002)(83380400001)(8936002)(38350700002)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?04fu8i0ot07k0zZ0uVOGVuFrOQBsrFfe5ed+Be9OVdVAwPdWzdJXC7cx2ZnK?=
 =?us-ascii?Q?S4WRbO07tbHXudJbNOCUX1Sh5613DoXBgI711w028VEC4YTDX92tvE8SOv9B?=
 =?us-ascii?Q?gBBYkPw8xk29eqCJ34gMyu7vtILc0DavTdhrS87IZ2h9ME9poqCz/bsc6pcg?=
 =?us-ascii?Q?uuHXLJo1KbSwS8iZfqxSuG+FMXIrZd8ZEnSbQ+VEjyOiMbUfgTP3DuKmooim?=
 =?us-ascii?Q?LQ5qrynry5IBOK9ocwhYf3xxLNqedmT4pX68lgWiruVqk3Qf8khVP371E2Ov?=
 =?us-ascii?Q?KwcJApJ76Q7NnS9Vj4GCklo3qm9us8eTJ2w+H9P5AcOkoTKZeKXiaV/yEFO+?=
 =?us-ascii?Q?KEKmSOW/dUMs0Z2XIA41UYT9pPB7GaR9f6Oe1GTkchphIRRiW/HsGr5moW6m?=
 =?us-ascii?Q?Bc7Gt99bmQO2XCeCSQzo6+55jjQigW9YdVYvsJ9X3/nVAEd4WTntCXCDluHB?=
 =?us-ascii?Q?2HyJqPmaUEKxyYh3gW4XqjMHngpGMDGoLaQoPcBCsSFH5qk+PHBZBSchatn9?=
 =?us-ascii?Q?odZO+NeHswSjaC/MyQpyX3Z9E9K6Cd6bNtVjIWUsh9Zp5X2doarEgentCqd3?=
 =?us-ascii?Q?g+Zo2a8kvmzGUS4O0jxU/lM3V3untjaNrHCfGarHz7bPUBvAe1KJDweT2+Dh?=
 =?us-ascii?Q?I1yWbvJJ5ysT9qFwRKEAAvg+Tc/9ccn5RhW/RjG/KQ2PiGJc5NtAgHKlyjSy?=
 =?us-ascii?Q?dmVO3CJS7fDeOtccoYQKyZ+Ngmxpc1U50mQ2Zsi3pjxBk9Z7m7BREkMb/Sif?=
 =?us-ascii?Q?xVLEbzkxxWZic7DXmc19Q9e2ogozxSpMf69jOd3bCWoGT7IwJp1l8TsD9nM8?=
 =?us-ascii?Q?KVRxshj6zjgYVye/YjKNzT89IFGYJG3dLCCBX4xH+sRf1lOIPUkac4TOZHT2?=
 =?us-ascii?Q?3Q0TzNBTsgJQhNCRn8S29vVKKpCm34cfuQDxqtmJ88MVKmhXlmrRSh7gCPQ+?=
 =?us-ascii?Q?1lpEfCiMRytFOAkMgtona+vfw1eQTCvVB9GjRnXNKcGFDO6lCGpxCwS7Ojoz?=
 =?us-ascii?Q?LUqumb8nUP+K3gNa+VjJ4g3RZaaIv6r1u5ax97g6WQnvcdZRf1RXT7vPJYZ/?=
 =?us-ascii?Q?T+54GafHLErDwTAvezj5UC5fNwxJGn2Hx79c6OxsUnWvuw0EqQFts985QMm3?=
 =?us-ascii?Q?V2ic2tvsMrV0rQf4Hyh2fnP7A4srSbzGUU2CKAVL26QdnqDl+QB9tOBYZMz6?=
 =?us-ascii?Q?81c7a1R3kFmj6OwMX/0X7cFrF1pQjvWkr5ohTrBlapWSYEfYOOUU0nM3YM1a?=
 =?us-ascii?Q?NZsZtUk0K+fiU1gzngeciReKyU7Q8fyEwg4yVTwLsqtcQSK/H5VrB1uL7GDR?=
 =?us-ascii?Q?H+xa0AerXgiUylYwclayEHzb/gifNbi0Nrf41jATCr7WILPtXAchCAF1bRlt?=
 =?us-ascii?Q?6Qk+QZRxKEFVLTxBkVv+0PW7hgVuq4pccqAG8WRKUQUelEBavfFJfeD4znW5?=
 =?us-ascii?Q?bN5T8rOBALMSXq20qH/GqpSKC4kIWIxvsMuIT8niiIlCsG2setBPEOXP9ltT?=
 =?us-ascii?Q?Pu5A4VtqRdxr1Q73dxJblYTNlqBpJBUvWKSE/p4+ifuFp2hAbSWdTG+o623J?=
 =?us-ascii?Q?rfeiyXIZNDQRy2UMMXI5jyQn44/q3De/uV7CFpKZ19IFqA+DV3TBEPKvlaus?=
 =?us-ascii?Q?XOJ89NFwrK3c40kkuRJlS39n0b5Td8kGBRF5+Y2gX24bd8SqXClgWpJxATfx?=
 =?us-ascii?Q?K+nNKA1kTtZo8bQsgM7OiYUtD/MaLS5ZVskJjsW4lGriCexlirCAZFvsCOkH?=
 =?us-ascii?Q?0PDlyx2s5g=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bb554eba-9afe-46ae-5749-08da459c388e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 20:04:09.4288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 R9oyZdzMFwXRrz1lJE2EhcZe7u8fNMNKM5ZA+YjZ/qfoDQuuH4dmaWkQsEeF0WmKWXw/kx/UenfTVdzNky7Jvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR04MB5665
X-Proofpoint-GUID: 2Qjc45yTLG8JpKZ54NGR9Ltnb41VPDrR
X-Proofpoint-ORIG-GUID: 2Qjc45yTLG8JpKZ54NGR9Ltnb41VPDrR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-03_07,2022-06-03_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30 mlxscore=0
 clxscore=1011 phishscore=0 spamscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=904 suspectscore=0
 impostorscore=0 malwarescore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206030078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jun 2022 20:04:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166522

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 meta/recipes-devtools/opkg/{opkg_0.5.0.bb => opkg_0.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/opkg/{opkg_0.5.0.bb => opkg_0.6.0.bb} (96%)

diff --git a/meta/recipes-devtools/opkg/opkg_0.5.0.bb b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
similarity index 96%
rename from meta/recipes-devtools/opkg/opkg_0.5.0.bb
rename to meta/recipes-devtools/opkg/opkg_0.6.0.bb
index e91d7250bc9f7fde73395335f008108578515b77..7b351e81231df48b2c493542a00d95911606248f 100644
--- a/meta/recipes-devtools/opkg/opkg_0.5.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "559c3e1b893abaa1dd473ce3a9a5f7dd3f60ceb6cd14caaef76ddf0f7721ad1c"
+SRC_URI[sha256sum] = "56844722eff237daf14aa6e681436f3245213c5590ed0cda37a79df637ff3a4c"
 
 # This needs to be before ptest inherit, otherwise all ptest files end packaged
 # in libopkg package if OPKGLIBDIR == libdir, because default
-- 
2.36.1


