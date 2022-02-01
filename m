Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB02C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 16:17:08 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.76])
 by mx.groups.io with SMTP id smtpd.web12.50389.1643732224178235699
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 08:17:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=r4S7wl2h;
 spf=pass (domain: weidmueller.com, ip: 40.107.1.76,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=da033b3f7OO2bI4Z5JVxiDV1fglz2cJvMABwMqM8ILBMoxiq5cNWsf/pkInjX4SxYrytTc5Y6g/SI8PSNJ2s6Lq6BdAyDhBYXYxLEOs8n4FlfiCKSn8p9f4RB0Vply243zTgJ1ElONZOZYaQzrzqubPIpkoNYBpVWYeBu8T0rvq9P5FvqqQ/VVGFZVM7KoTuBLsYqOdXP5FI2NOnjRt2P4kgZQU5LmUK6TAr7XlZqF+I4D9PlKGAQeuMfdB3RuRGmlCzXIHZqr0hacitU0g6Xr9mWKApL/syHcr8lThYr8+3hIGmGhmJvsX/rUH6GL0yfqitMhkT5hCmkkYrsaBtQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JdlsoKYARcOJGy90OhnfilsAY++1A9K+JfrcyNeHHQ=;
 b=FEULfue0F0D9+tpB5T0EwJolCpUaUO1X1jQxKl62YPfP5HzjRhhMD/vgGOzCJNUKSkc7ZRaKKbeeGtnYylyGXlQOIh04gHOMF57SY7EmIcJ3sKXluIEz43KjG5AVvCyzFlcMwFby45OWOD3yUqr5/EmzsY8ealbVSRnGFbUatYZphpgQmJuvPI871Bou887x1elaSRbxqFu4XcJj9Q3hCmDBoq/DAMuElgqxGiSNvBaYA8uHY3OGFhqDO4m/1q4HJIofG9PGEMeqp2F9PXRExmH6AjBv4npsGI8/ycg3g42YgDRNHgzb0eqXnFOZDgRctuOxVJ4nALoKHG/I+woe6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JdlsoKYARcOJGy90OhnfilsAY++1A9K+JfrcyNeHHQ=;
 b=r4S7wl2hXvy/ytjFcW97xNoJNDnpN3kcoZWa3eK3pkCGsJUdVJOOnH2MZDvI6EtPKflD/QXqZrbHo723KCe5VTudT6IrfyOezzEXmW1jxsn3LHkBxUUMkf2mmsGBUAN9W/zXHNTNOURCVID1lZUMUwXNKDSYhefh3oociKr10uc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM0PR08MB5188.eurprd08.prod.outlook.com (2603:10a6:208:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Tue, 1 Feb
 2022 16:16:59 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%3]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 16:16:59 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 1/3] cve-check: create directory before copy
Date: Tue,  1 Feb 2022 17:16:36 +0100
Message-ID: 
 <20220201161638.25531-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM5PR04CA0023.eurprd04.prod.outlook.com
 (2603:10a6:206:1::36) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae10ed5f-137b-48ee-ecc8-08d9e59e463a
X-MS-TrafficTypeDiagnostic: AM0PR08MB5188:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB51889BDC21385A5179202CE3D7269@AM0PR08MB5188.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EoaefrwyJOwnSS0PNX64Z+YI0Jj5N+0ob7oyzvexXYazojDF5Uc5PxGhWQZjL6UmuXhL650Z5OliBMuQSM42A6O8TZ9jl5S6CAsJng6wfJO6/TaHSqbp3+oCQZkZRl+P7LUq2jxABUEgwhD3DJzi48X9LnisAIQyikehVKo1D9nwDGLbZGno0GhFfx+BUMxv8Cqw9wERSHTJwtdUKzb0ZNkMR/EE6EFoqGLFRjvt1vIZJo8czFa8cNpLy8cVpGTfPopfb1q3PiyjNA+EN6Sfx+woIvNziVUNHwje0p6aU3EcHWRjvQ/ePwAGqzLG5YEUstYJNg0mEhTdQB9kLoUNrhcJxo4JCKpJqaDbPX6TtY+1xHn5dpWFTvM4yvehSewJGgvkKdr6bULu1idXozCZz/WVC+q6Lnfu+dHKAh6tD9IHBorGSkCEXtW3d1EyP8ELe+eWdONXbulP3nuK7IzscQPY+KEi0xhaiSBSJ0B2/bA00ogmpSV6/JbWXeMIiEwM25V2QWSQ7fRtWvveyqeEuGpnAlkcnmfipn71LO+qk3Dn+OI0AWOct/c41RQAFBmQ18gTjwg6nor/G1P6NxFZJWxAIvzWSB5S5QSZEXQJfOMP/yd3mSXCy1q9jrcVPPo7dbakHm2TwopA4MPJ+bnMNK3A0Jkqfphf7zZ7GhEzvbooogKlIl7doQH3zSC4bG1f
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(2616005)(316002)(186003)(107886003)(38350700002)(66476007)(66556008)(66946007)(4326008)(8676002)(26005)(38100700002)(36756003)(1076003)(6916009)(2906002)(508600001)(6486002)(6666004)(6506007)(52116002)(6512007)(5660300002)(86362001)(4744005)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AMSLTAJykjdlxvcCdVuBccgMtbCrfstNNjrr2SOSecOAeYYGmfK2vXPdUP1a?=
 =?us-ascii?Q?YWpNQrJSg5/iMnUvhh9go815NGQvjw9gJLo4Z61JascXt0M+iNyzHmNG4vDx?=
 =?us-ascii?Q?CTPRXI7bl0dtf8HTXcffD4KG3+nXW9jEbo412ozC5pcvgqWodCH6+aan+KLU?=
 =?us-ascii?Q?hYJfpee2Pb0Chu9HsVs34Mnwg5VmompzxKKGHz2UKt3eWvuWIVrFYFLQoTSn?=
 =?us-ascii?Q?cdQXjtFw22WsehHXTc6XBvUkHwsFVc49WQ9Obf2+yqYkecN/3p/NlUQ3pF0w?=
 =?us-ascii?Q?+wGxUQwUO7eIYFAozUxsnTVkyieLdlzjSM5QzKABtN7JkxeLvsy0ng7C0iU3?=
 =?us-ascii?Q?eeiYMCmxAhgltL9fUNtng2AXPHtyPGCjddHFZ6FZLQEPBUElMB88Vc9BUzA+?=
 =?us-ascii?Q?QUg/56Lb13lsYyBxjAnx2SPEeKwMViVn/9OuAOEeW2X+Z8troDJRUSFUo+tG?=
 =?us-ascii?Q?uywNmcATWfpkOSu3uhn//16+QqIPz+OTTfspD+FPKAblSVsEPLHDhv/mPvgb?=
 =?us-ascii?Q?p87PTeLx+RYhujHTRxhysg/ZP1HpBRf8NfB48qQAmfE0NQ37eQPjgcuIueim?=
 =?us-ascii?Q?jm/b7s17k4+swm3THCwaEU2RfrMyV8WBOxRCqEv4bO34Li5W1YvVoCRIWbkN?=
 =?us-ascii?Q?XO+38BPRZ6A5m4EAXmOqcTeFllYWOew0eTfp5LRZLxvpy+RW6Ne2LS6T11Hj?=
 =?us-ascii?Q?r5dKbUGXVVB2Az1W1EeivKsPO7k/IOG4Ekk0cYe8qtFHZytDd4+D39K79R13?=
 =?us-ascii?Q?kDplJZle1Cb4052rJLyAuDpSQXRHc95MsiVvtjuMzZE6UjlbS/dQEslUQVDE?=
 =?us-ascii?Q?j8MLLxZBZ29U2FPiwAesDEELvFk/YlU/zIvYuQXNEcd9lMadQyUgDQCMEeky?=
 =?us-ascii?Q?1eyhrkNlwCce7f4AJaCOgTpsJb46yCHeI3mYBp3OnWkGUlWPaCf8sfNx3UaT?=
 =?us-ascii?Q?qHERL4qicVoyZRMHmGjYUxeF0YZPaQ5MxL0ltgPsEMJP1Y0bNrYnD936VpdF?=
 =?us-ascii?Q?CidbQVBpR28ZrhygQgJ2Elv8Pb6AO3jyNwSzB9PpcceUEEnRhZLyEMz2b2P9?=
 =?us-ascii?Q?9pS7qzikN9YkS54guitWcsDUR2aE/JnNfvzQlYRUdLWEc2UvGSZ9GDojNPvV?=
 =?us-ascii?Q?+pni2MjqJUd3LBkR7FXJHzce42QxBgULukBpwpCiTUavxcwbRJ8LmCsS2vbD?=
 =?us-ascii?Q?NUPk7pv6BRxHGyDgFt5oGWC0WXbh6bdyz6um8fLX3bOabvxtGHO06CrK3smW?=
 =?us-ascii?Q?AYP+DMwb53anyCic8SnLuQFZExMrLCMhWiz/uZQQVjPBvGCfMdEoA9ThAmnQ?=
 =?us-ascii?Q?rfdWfqPuZ65rhkSFyTBriAP3C52D+6tqrz5MH+ZkJn+R06F15lVJV3yGzSWk?=
 =?us-ascii?Q?bJC+lIYqFoz8TgxJnvqczmdsZNsWS9t838mG/qWnH0nY8ywBdKuxmlPQdUjZ?=
 =?us-ascii?Q?5/fbMgkm4hcUtQdKKcrQGLD2yYMpEs3eACMgCcueeEFDVDBIN7EtwzRqf8HB?=
 =?us-ascii?Q?5TEQIoSiRqSvpo4+TDtg/dMydvMxUN0iJqQZ+TM+T46RcwdSkcNTOWWMPVmV?=
 =?us-ascii?Q?E9QPv0A94h8IBVnj8Claq3nD8d91hPNMwYJRGaDmvvKMryLNZQzquF3N8YaA?=
 =?us-ascii?Q?pEz/Li81/aQ015L09B6b80M=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ae10ed5f-137b-48ee-ecc8-08d9e59e463a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 16:16:59.7839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 lQXKEyV988b8Xnza4CJ3JcPv2xAWUUipdvOXMP5DIzTFYnWaKnn2mORh9L5FXbPBge6D4ArCzezzQLUdtWmKTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Feb 2022 16:17:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161159

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes/cve-check.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index 70d1988a70..a4d735c323 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -143,6 +143,7 @@ python cve_check_write_rootfs_manifest () {
         manifest_name =3D d.getVar("CVE_CHECK_MANIFEST")
         cve_tmp_file =3D d.getVar("CVE_CHECK_TMP_FILE")
=20
+        bb.utils.mkdirhier(os.path.dirname(manifest_name))
         shutil.copyfile(cve_tmp_file, manifest_name)
=20
         if manifest_name and os.path.exists(manifest_name):
--=20
2.30.2


