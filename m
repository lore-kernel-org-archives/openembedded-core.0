Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340D9C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 05:01:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.35381.1669870865986883086
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 21:01:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Tx3eZ4bg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=933431e351=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B14oUAq018260
	for <openembedded-core@lists.openembedded.org>; Thu, 1 Dec 2022 05:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=E741M/ReMMie+PG40Tz/6ukOYdNvYqThyiVZuvr5IVs=;
 b=Tx3eZ4bgqbYeSG7PWYsccVHy0go6fRldYjUIywMaWHIAn6/v580gY+S4lHtoNUDj4CvA
 B25EHmPxPnYOuEUZA9yRw1k9PXaTtlWBfeXSlJWl0kiyCX71f+c1/6fX4PWetoer1rqS
 Rt1CVumKiqCi1zVV31L3O1A6//WKB2KMgskz0kSXmmHGiMr7ThoBj/wpGool5WfMJl+u
 r+w4W+7FhJwroWczMKcaU1UlVSZkWwwJD64HT98dlf+nzcS2hV1qxQkGxHQ7Os0iFE8k
 TG3MdDvPIinEHLcILus8mnqE4UJ8uNlKBry2sPcO5vq4OYojxdXQHdMkQ/qfyGPDVuED sg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m381341mu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 05:01:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1SZT8xQOxzdMjNgiY+eos9ByPmniymPwTvHGzsZ1ZIsK5h7SOzQYrZ9wLKIHTwedY47cvH37jmcvZC66ouw+AnlQwI4YDZoE5a5bv6nzjXZlu9vSvXqi3crXYJYJnJcuEPJwegzBBcjemhoXxoBmerG+MPSbobUSDgINWevSVjYBuZhsDt8QRDA4c0fpmV46JU1V0UW7jCO76WrmqLlvwnR3FrtQK9GNI1QrzUkq/Z251Vtcba49mohmmCNkBVB1hOhBrWFM5oG3DXzieMxiKaguvX5VU3OUmj6AKWymNzvMgp7t9BBj37OHbJMx1t3qX+MidLBKLsU0xWO2xlPYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E741M/ReMMie+PG40Tz/6ukOYdNvYqThyiVZuvr5IVs=;
 b=HqFjs/Y/2A4aZOJK9RtUniw8fJT7IYCJi+nfD4OqguvgIf8gQcVWyCtXj5QbcP6IJen/JsH68HABfDrkyO3M4td4fmBvBZDcCgaquvi7pr6PqrEhJxd4TVucIL8JyW/EU5JjQvhd5CljJrOLgS6LYfFl09xUWal+buHqqariVGPP/O5a2/n1DsqIzI2735BtULpQqw6g2n5XRN54FDT/1sLnUVZtR/wxx65XFElH1yVm7hW2RwIUNG7BW4VkTmStjTy/LRemWXqvDa8r8of7aOW2SrA4AW1m2nZy39NKM5FFRcxHFx8gT4T3FGD8TYAIlq8Wvyow0p5Vv1rP6j5AzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 05:01:01 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d8ac:d3b0:6765:63f7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d8ac:d3b0:6765:63f7%9]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 05:01:01 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] psplash: consider the situation of psplash not exist for systemd
Date: Wed, 30 Nov 2022 21:00:50 -0800
Message-Id: <20221201050050.88308-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0020.namprd08.prod.outlook.com
 (2603:10b6:a03:100::33) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MN0PR11MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b4be187-d786-49fb-a674-08dad3590a24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iIIuOmwOQNpUaXXIqv0trG/b6eNCwHLxir4Ek0mqxYIRGOVu5ficQzGxUcwgA/iBdXCfdXZAoAoo8SEbFeaykMX3dHpzeY2z5X8ypbx4UF+Zb0ZTy4ytxhibj+v4pzY+ar9QPw8BMeZBzbLN9yoSzb50I4kxgctvcrHh7v4NJEvxA6+80T47SBnzPRPtsXDgBn6efyVkGZ2zS5DlRF4Sqbi6neePs+4lIzE+PFn28OUFXGtunqKOHINCEXmrUGSo0En9WY6rEu9BGuWuTu2pBJD/qI/Xvu33rP7hSQTJLkZGcyBAk8by35IaKBqZACeS7Bifpomi0jYZvlk3cuaOH5N39welufsZmNDF9SMsB0smVyIKlXZl5FipwmrAWuLCZ6wiSi6aT1/3E+8Z5GwUiDxiElh1ykPhLFJW4DbkgzVuLYEoQEVbo387OAUv6Pg7T4d/L1bAi+6LcHOWi4LdbqQ2H9jwVfWIxvQsTG323IZ9LNwjSkBLmYCm0Fla5410GyQpxIoBYkRsppCfSV65Yecz/Y3vpQ6hHEMUmTDqMMpFwVryAUsP++1HPwsAB7f99dIKLZxFZA5KpoTOyuxL57Hw+tk8rNxJd91u2vwnQWz/XbHLzW7lmflJFIiIgeT8pr4Kc6m3X5z7ZHRRnOCD2QqqKCPcL1SRTNXie6tbAM1LG9ZKXGxjAwxg239o8jub5hUGw7GI4imFUc8VSOQUSA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(366004)(39850400004)(451199015)(38100700002)(38350700002)(6486002)(41300700001)(316002)(8676002)(6916009)(5660300002)(478600001)(8936002)(66556008)(66946007)(66476007)(6666004)(2906002)(52116002)(186003)(1076003)(2616005)(6506007)(26005)(86362001)(6512007)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I7q02LC9WR33yw6/8rp+c1tY5AQE7sDTSqw15U69d0vWd8fbstYIfphk/Gnh?=
 =?us-ascii?Q?RvDA9CurRsAh3PHY3YraC75lI/0/K7xayHBwztcBGcPAGZudnyn6cezpcB2c?=
 =?us-ascii?Q?kZBfddhByTM7TWvwu0jwUGTIpo7r4NisZ410b0a1Mdjb+Hjxs/y0FGzNujHO?=
 =?us-ascii?Q?4HNXfmkb8AkF4BrxYgsBNMJFJqgUwnfXopqXNfTW45qGGM3mjIF8gHXgp4On?=
 =?us-ascii?Q?fsWZKLgN9so864sjh1xzDkhox4kSG+XKAfXOzl/6hFKxwK9OOnBy6BXzjC8m?=
 =?us-ascii?Q?CLr5CXYWZwf7+ZsRLpEwjXEQDZ65TUAz7wePCXiMi2Iwm7xur1S8IPtvPeL+?=
 =?us-ascii?Q?CTwWtQqDNOqv/22W3GYYJV6zhkPc3Bx6g/JpL+uWGLeaKHBktV3h2BJpXodC?=
 =?us-ascii?Q?Hx8nFPUroVJNgUfFazgtYd4aljjD8+Ouzv+UYlXIaGJKPUMDtogLM0sfKvbE?=
 =?us-ascii?Q?5GsoKiP9cV06sf6jhPpKUCNhFldA/KCZrzCW2/+MWsyl+ZBUkD45UftrbW4a?=
 =?us-ascii?Q?EdGk9auE0ucndrCCN1qVq9TTQ3p4A5joN8i1sSlr34b72iCuXOqZ8r6RCNpD?=
 =?us-ascii?Q?nfaU9OcOMjQ95ineVo5NtxhDpJ+VVU4VwqSaig7ep9M2+2gQt7YKMAdM9vzd?=
 =?us-ascii?Q?1vL7h+1trJc1N3XyABxZ3QNCiRKPPYyUwyZcHaZiIvDlCRTWItLN1PZfa0Qg?=
 =?us-ascii?Q?/8YNolnfFnwp9edaJtjql1YueuJ2BuclbeYNbHmnGZuNI1/1bOIrFZk1CC2p?=
 =?us-ascii?Q?hLWYO6nErlSd2miYPijek7GRqpMPLGfFE+1UZ8NMAyUfoFT+912HWfOTGINe?=
 =?us-ascii?Q?/7g5bE3WZEFN5jum/oraQao0uAKiklpKq5be5f6djhADkIodDt4wfLNXLfDt?=
 =?us-ascii?Q?LlQ3she11QUA56hmlACIrtiqFsZ7QmdPeoeysrgXJ+t06zdDWfb1j3b5FUqP?=
 =?us-ascii?Q?IjNxfOgTQFAk4KY1u1xtOmBnW/dhyPXo06RDgllY1lK/mdbH5nIzsWWMOeRd?=
 =?us-ascii?Q?PvjrU1D4RODZzwvAAfO9d32/czusFb9udzC4Jk1XqXP/GBHnrjcYNM0Ctzix?=
 =?us-ascii?Q?rEWbCISWhQrZCvDKrVna1etpHORkUillXeWZAMpTwcQBrzet2wuPBy75NHN7?=
 =?us-ascii?Q?YKFXThLPmpNF/JlcQxWGgC/ITefjejmVpP1O+2uvRyzQPubBAak9yDEhFC2E?=
 =?us-ascii?Q?dI3MGL8cPpqNi1bKsmzWk1DXh0lekBEloWEz15I+kpKsVdF27ZaYjOewDAoD?=
 =?us-ascii?Q?JqaySyGQg+WYrDa4qW1VbKKawkIAahIaKrUYCr58p3Ae/IQNEwTbgJURityP?=
 =?us-ascii?Q?vjZBvs/E9PSIFV2+VQ0dF9DqaQ9vuGV7q45s71PWQn9p+CkbqIgjpw+aeK6Q?=
 =?us-ascii?Q?JJwmbn0GNj4ozMn4i8+Z7Ig8Gz1kh1lx8H1cJ4EIyLp36SXvjQHKY2h2qcHD?=
 =?us-ascii?Q?03TjiMsuNVjft6ZUWZNvFjMW6p/8Xklh4aAfXAzHJE//DRkf3OiVikJ3PWCr?=
 =?us-ascii?Q?7MxwS6AlK9hrZuccPTsEkEbIk5CqaUoOAANrQ2XVgXK1KPGkPlQup4Bfz/ye?=
 =?us-ascii?Q?00SuU4V7/+LB6iyBwmKRSiBJA91cUD9antBhXXF7eGQ0MsdiUq3boQHmnfck?=
 =?us-ascii?Q?Pg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4be187-d786-49fb-a674-08dad3590a24
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 05:01:01.0832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHE60x7qluGsjH8WkIkAtFScJR1qxvL+r7WRKLxU/hatGC4KhzX1UI9GbuIBcWdR49Bs7RL7WPDrwRsFugD4xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6035
X-Proofpoint-GUID: cv3ZAVG2Ktf3S3L8u3xs5Mf1_lU23b4t
X-Proofpoint-ORIG-GUID: cv3ZAVG2Ktf3S3L8u3xs5Mf1_lU23b4t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_03,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=766 impostorscore=0 adultscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212010033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 05:01:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174037

In current psplash framework, the psplash might not exist at all.
For example, in case DSITRO is set to nodistro, the psplash does
not exist.

In our psplash recipe, we have:
SPLASH_IMAGES = "file://psplash-poky-img.h;outsuffix=default"
This variable is parsed to if psplash-poky-img.h exists, a package
named psplash-default is created and is added to RDEPENDS:${PN}.

We can see that the psplash-poky-img.h resides in meta-poky,
and in psplash_git.bbappend file in meta-poky, we have:
FILESEXTRAPATHS:prepend:poky := "${THISDIR}/files:"
So this file is only available in case poky distro is used.

To fix this issue, add condition check in the corresponding systemd
services.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/psplash/files/psplash-start.service   | 1 +
 meta/recipes-core/psplash/files/psplash-systemd.service | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-core/psplash/files/psplash-start.service b/meta/recipes-core/psplash/files/psplash-start.service
index 36c2bb38e0..bec9368427 100644
--- a/meta/recipes-core/psplash/files/psplash-start.service
+++ b/meta/recipes-core/psplash/files/psplash-start.service
@@ -2,6 +2,7 @@
 Description=Start psplash boot splash screen
 DefaultDependencies=no
 RequiresMountsFor=/run
+ConditionFileIsExecutable=/usr/bin/psplash
 
 [Service]
 Type=notify
diff --git a/meta/recipes-core/psplash/files/psplash-systemd.service b/meta/recipes-core/psplash/files/psplash-systemd.service
index 082207f232..e93e3deb35 100644
--- a/meta/recipes-core/psplash/files/psplash-systemd.service
+++ b/meta/recipes-core/psplash/files/psplash-systemd.service
@@ -4,6 +4,7 @@ DefaultDependencies=no
 After=psplash-start.service
 Requires=psplash-start.service
 RequiresMountsFor=/run
+ConditionFileIsExecutable=/usr/bin/psplash
 
 [Service]
 ExecStart=/usr/bin/psplash-systemd
-- 
2.37.1


