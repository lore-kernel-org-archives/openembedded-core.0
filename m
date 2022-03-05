Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CEABC433EF
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 11:17:27 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.47])
 by mx.groups.io with SMTP id smtpd.web11.4339.1646479044973917917
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Mar 2022 03:17:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=BOfgc+h3;
 spf=pass (domain: outlook.com, ip: 40.92.91.47,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEXqHsppon3znmDw7967+06FNMMt2KQWep5npSs27Hiv32LjS3vkYt/bykmvkKB1HXg2/NZ4NJ+gaPTbIOwUmNPTnyX6OYQDHqaG//5n7/eLaNFFSuw6lo+GVPqRjanj+5ptyAbVlQeYSO1qkKeSqj8kdIus18LZkV2jbIpP4cAYyE07/mDanguhjvKX/HnfmdKB4VhHCuj+u9BG2/JVTbCEgmE5/XdqvPkTZRteaJljBJfMOHM+bcuQFIIlH2nbT0hQDp5tGiSQorSI7ThbwT232dSY4VRNV5tkA3qcLIhn4YGjojHmwZiGn+8PsmGgQpHv/3pYxWC5xZqRLiIA7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oS7QDftjtKLty9jdZbM/wxy9MGd0bBVbvD840WF0nLI=;
 b=hjVFjJIGqxg0oMPQ5JwaTbl4fNpapcsUspb0J0rgri6kN61DmaNGip9DRPk66oPV1oM84voIp/7rIg0KKrf7vembLQUYC/UpiAYEt3N4PzTjceKf3RMuchfNz3/rCrw33W8Ezxo2MN0NJxkeuqyEOWsLCqFpci1mE3+6UsGikdeZA4/UNh7IiXSzpg/PlYfKpAWI/TE79o3nEQkI1l37pXWINWi+eHoNlJqtiaKqCAdDcMHE2RR3HJatHiO1RfWF8ej5n/eRuSv3R0KXiwedRCi/9lk4ylwilAfADgvlyZxaJ2SMgh3+NHFdpjeU74uKwMQj0QICDp39mP83LNWXYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oS7QDftjtKLty9jdZbM/wxy9MGd0bBVbvD840WF0nLI=;
 b=BOfgc+h3TlcbSFd/3ba9GL3M/AOw0GqgIlHJn+tQav+eO8o6eHW3nWec59E7uw5Lr2Mzon9HApCiFLLpstrBnh8A4+7OdrL3JQehpRCdIdJy9hSqzRKrsIRtWF9NZFRddeaX4YRJRNn/h4upEF0IwwKqWY5UfICSIvpwaxviAJVxr+Uw9nGiDqwrdbjfYcJY1GFn6GGwcFlc17jdHXus4FOuest8Yg/4yzDH/5Kt8IaX06wy+c4eCRh3zy07yQz7ohpr4oYl+V3d9bivq/iPwoYv6LUad+4vVK0kGLdw+7p78FRnafxiEHFeCep4Vy8UOuHsXax7uLd2nGSdzUwdsQ==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB2947.eurprd09.prod.outlook.com (2603:10a6:208:12f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Sat, 5 Mar
 2022 11:17:22 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%8]) with mapi id 15.20.5038.020; Sat, 5 Mar 2022
 11:17:22 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] setuptools_build_meta: remove python dependency
Date: Sat,  5 Mar 2022 12:16:58 +0100
Message-ID: 
 <AM9PR09MB4642A02EF7369BEC6B3EFE27A8069@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [G2z/+hceC0l6Br7+YkuqVv/ZNc5Xv2iAmhzGRwKAAuWUGrIuUVM9RKOdssCTPhWp]
X-ClientProxiedBy: AS9PR06CA0180.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::27) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <20220305111658.2592278-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 286e443f-e5f6-4856-3067-08d9fe99b7cd
X-MS-Exchange-SLBlob-MailProps: 
	tBYDyRQCPcmF40moE3TJBNuxr/vCepMobVpL/LcP5waaJxjnE0usjJyD9oghezUZUh+Ygu8hQxwMOVbi2OycrkUB7iHKO2cSYTBPecW8SvCzJBEQCXkPkdd72v/xfQv5/d31GhCZPYvU8C51L7xo/K8t0Drp1KiyRuc6t9QhLTK7Z9zNk694T/F2sKfXQxc8bkKLqxYcOw4BmUx968qkl0S0RNJvpmKFxKPnq3hNyTfCj8aERv9xFwLzbTwr66JX8clE3f0UExwkvhtUlzqQLLRMundgUIvTaYcLbAWqhdlDV1vIZUqBori2xf8GZEbzmAvh9AgaH6OldO+fhNXWGV6BoauXWlalMJAoglaK2dMbzAspx9HgPS46kdU0lpedLaRAwC90IYlomdIBtzmL21mp+b9ZNWLifXJPoZR/9jri5YOPycZgkLg9vTXDMwj9qrK91fk/TM9ZMk1MeU99CrOg1ld/wDOee0nfWB7ho6ofpgR7c8Oz0mlvBgVs4Nh2oDkcsrdmoQMFTnbNsgQr+m0aPSSNDtj/lO3Tss/cdu/OyMVjSwsIT6wC4fxpe+KQXVhgwE8CpcEmiUMvsIxDPD1DLttRf/FYz3bzpjeLnU8lUVwT8ElWqGLvLlRM44wJVo1m+hwdKNSN/bFY9hUcuOWmkyq6CN/jy4kwMoUfL1d0bUvcBIjBiZQnLyebN9HzR9Vx8Xpr7+EP4l36GKKeF1X29++0+sjsk+1yZD3EcxmaM32AgX+IBYEosBS73WbrQDpvGZdiDZU=
X-MS-TrafficTypeDiagnostic: AM0PR09MB2947:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MbvqWZ3CiVAyFuPxdMk0Bkm+uoSJks7MH9xFwILAp1U/NDMGNh1ztw6S3gpXnP2BtZOo9bKcN2g6Rc/+Ysqk2hGD2kU4tnw1slpO33TknAyVtcocEBFS/TGbp/Ehfo+R3xUYdJ+6JQ5zXZSq6Ou8xRf3FL31RbQ1EAt0pF5zc9ydnX/R5IJnx3OWWKGRCptipu6jmVaP9+53RSLNnWv5r/sbYD0SiI6kv7Ox91z4m0XEKeJ96DN/x+qebC30oTMw+l9XTUsbwqxcDoRyauJEKED00P7xASU/78YMIdJxMyLstG8ej1ezJw+QdJy8+3Pggf1yt0ASm32rm4rlojzT7P7nvEC/WzXdPus/mh8HviUSXxpX3KzrXprUDsztjZAI27tWEHZbvPRXbvdBm5j6D7rqWYEVx/S81Z+HI935DjjSxTDEvUKQnOGI4XGoO7Sk+nhGeaGNUJm6gzNjNKMoH1HSOqY4BWcIRnTaBEbIiVePFNZaoyEEocc2NN02duOAIm5/1gbRAn0TsDyyvkxCi7nZd66GxAFBP7ZEgT6MFc+W8l5Wj2wJFpuqhi/GZpTp63HuHY8EN0cAMo6kJk18QQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wn09EwQMJ6wr7uNfyJkf+kdTMyXt6ZXQLdJkOs9O7uTN97G66EYHgatmSVho?=
 =?us-ascii?Q?2bn2G/2DGvMo6jXzJT87Ry+RPVz1SiwcuqyhMGZ2V2ZX3kSlvN4+cn0WOMuH?=
 =?us-ascii?Q?NHasH1d3QZk7OCOlsmg9ma5ir9pUxYPRNQ8Pg3d+RPbnhQSdW4deyIc+sxDa?=
 =?us-ascii?Q?RnSg57AgGBQBPKday3vUqINlNbTqA1Ovcw4PhfogGVsmHQkOO4tDsKtKbeGg?=
 =?us-ascii?Q?ky2qHkZx66zt4UPLaf0c53uGmLJKfUFD0o+5Y84edT9Jacz+KbLVbNheeL+I?=
 =?us-ascii?Q?lKOz2ekfXD6az1Df4FZU2ZaQNn2Y5rMKBd/KTHR7DAt9h5Q5Va9wl1JbyNN7?=
 =?us-ascii?Q?Jxr2A+8zwhY3thbrpOJEr5wQ98cRFxE6ClNoZt2M40IBGfJDO+sWpOZ31e3m?=
 =?us-ascii?Q?dYxhmbmlE1UrlkvItMrIM6DIRjJ0pCMIB2itHggEnRk4OKEPWNmip9kBzdES?=
 =?us-ascii?Q?rPNPQlWEbYAOXsGDR7FJsZBI53YIP5U1iDV/wnq8lFFo1TuSPJhAYcy5/lrT?=
 =?us-ascii?Q?0KH4WoDE0YP54PS5nJRVH6/Jt7SHhxLjf3fgxUQVNkkZuSx7NsGFPGofG5x0?=
 =?us-ascii?Q?eVfGVp2TJ7hsVi75u1k1x6Fdixm+bUvRx7mMKpj/xrG2LLDw5q1p2Y1U2T6Q?=
 =?us-ascii?Q?gLpH0O1N68qZdmr085weDSG7TiO68gSdh/mBmbFFwW5yS2F/QoFbtkgvcmum?=
 =?us-ascii?Q?SSqdB4N6DYv5BKh756hNhoXJt1dseUpoL4LjBhaEco9HfYEY2YN9wiHSCmWS?=
 =?us-ascii?Q?UE6D0TK0kbEYqlhprEsfXm5VzJNPF68Z9tc4BpT9JMDC0cgiBltrvOBndolU?=
 =?us-ascii?Q?kNbWAtVW28+03NiKE+NDMljD+qEf5sly9C+WiEkhcYxK7I3vmDUJoLQqJWVV?=
 =?us-ascii?Q?AaYrB7W0AvT6eafp/2CbTRqiy1VfnPbNWoaEsapT1op5n0xm0IQfakx/yAO9?=
 =?us-ascii?Q?uErdUyKynE13OQLkWvSGiCL2suRSdmj9ztpprWMLXx/+/mTAQMfK9ZQbc9QT?=
 =?us-ascii?Q?KU4Rm285C5X6HkrSaMG6v0r1Pg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 286e443f-e5f6-4856-3067-08d9fe99b7cd
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2022 11:17:22.0045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2947
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Mar 2022 11:17:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162779

when building additional native python tools that should be used
for additional tasks in python3 package (class-target), the dependency
on target class python creates a dependency loop:

python3-foo-native_1.2.3.bb:do_prepare_recipe_sysroot
python3-pep8-native_1.7.1.bb:do_populate_sysroot
python3-wheel_0.37.1.bb:do_populate_sysroot
python3-bar-native_0.1.2.bb:do_populate_sysroot
python3-pip_22.0.3.bb:do_populate_sysroot
python3-pyflakes-native_2.4.0.bb:do_populate_sysroot
python3_3.10.2.bb:do_populate_sysroot
python3-foo-native_1.2.3_1.2.0.bb:do_fetch
python3-setuptools_59.5.0.bb:do_populate_sysroot

resolve this by removing python3 from DEPENDS.
The correct dependencies are already injected by
setuptools-base class

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/setuptools_build_meta.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/setuptools_build_meta.bbclass b/meta/classes/setu=
ptools_build_meta.bbclass
index b1441e65dd..8f5479e922 100644
--- a/meta/classes/setuptools_build_meta.bbclass
+++ b/meta/classes/setuptools_build_meta.bbclass
@@ -1,6 +1,6 @@
 inherit pip_install_wheel setuptools3-base
=20
-DEPENDS +=3D "python3 python3-setuptools-native python3-wheel-native"
+DEPENDS +=3D "python3-setuptools-native python3-wheel-native"
=20
 setuptools_build_meta_do_configure () {
     mkdir -p ${S}/dist
--=20
2.25.1


