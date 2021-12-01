Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D0FDC433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 16:28:24 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.50])
 by mx.groups.io with SMTP id smtpd.web12.94131.1638376102414866816
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 08:28:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=qZcYuLTm;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.50,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEnm7EYO8pQo3fsgMP8YfGnwDZefDdilsdjnbDJUmYpRg1TxN4g7vZDZRTgDkbLS5V4+6GOizap0W0O3rRM08cpQ1WYrpxIaE1VLhaY8QU6LWKh2F3Z4NE/6H2ioWPJJBOLsNQWP2NK9uBuP8CYAUgjEImH8JfJBVf8OK3bky8/cc47RC8og/+3PyMin9QGafmAXTls/NuSuYlCPw547yHNRDh7gtmdURq+2PeD8TbVsKbjIVsUr7EXtU4hLeKogubA4HeWi1axV7Dr/2LX3AKOZ+0vlSOvC+ygssvFdOWV4YCFHXv0ASlN1K6U8v5403UQfeSDj2Ke7QnrT49yt1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HGRJ7ffmwDyYXGt6q/TG1v5c0CFDXs0ej6gnL8R1IE=;
 b=WuCFN8E20hRY7zC2kgKWsc3pjRvt2NriWGUz4afqO2ALhWjrNmRiFJCa07NOCq/vEgP/ICA2GqcAUhQCjJGn54hjIa6k9ZS8rHcKAbJWBDo5x6ZcW6eIZRfCM26Tt4lKbmBKnNwVattOGfVdWK9n0cVJM+5Dh9iuXRv+bYNwyloFCJlr9SmkGnoJ6pwfJjW8ks6Fw6/cEaJzXghfU7D1z/TmOEWBgJWGD2ZXEO9IWc6dgTwu9AEMAjQXWLHc/RL5kndG5f4S73wKi5i43suudNA0ybezVh2jYbPU9p6/0TEG0d37VsfnYmHkOGHO/9E0NAvjdCFN4fp0+kjI0siHXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HGRJ7ffmwDyYXGt6q/TG1v5c0CFDXs0ej6gnL8R1IE=;
 b=qZcYuLTm+aiG/Gg3X8kEukKo4jWZRPp3IPsIZqVhcLKcUtw1Hw7aWGkjyBBUxu5jkEvWZ55NWUeLPwv/oRlpwgV9CYQ5ZdJL2UHgM4d4MQu3/oHIk1nnPrdXXQRYS8dy+BkxAh91j6nYKtUbb145x0cN7G2t46BaPwpr19QneLw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM9PR04MB7489.eurprd04.prod.outlook.com
 (2603:10a6:20b:281::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 1 Dec
 2021 16:28:19 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4755.015; Wed, 1 Dec 2021
 16:28:19 +0000
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: openembedded-core@lists.openembedded.org
CC: bruce.ashfield@gmail.com,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] ptest-packagelists: Add missing python3-webcolors entry
Date: Wed,  1 Dec 2021 17:28:00 +0100
Message-ID: <20211201162800.3128628-1-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0602CA0023.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::33) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from localhost.localdomain (92.42.140.82) by
 AM5PR0602CA0023.eurprd06.prod.outlook.com (2603:10a6:203:a3::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Wed, 1 Dec 2021 16:28:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77e2210d-6f57-47e7-d91a-08d9b4e795f4
X-MS-TrafficTypeDiagnostic: AM9PR04MB7489:
X-Microsoft-Antispam-PRVS: 
	<AM9PR04MB748975505DFDE720942B1F4AC2689@AM9PR04MB7489.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GUHHWQbf2ROrIgcAuCnLaX8DgT+sUQq+sir3hgglL2BElzZ5Vyfiu22GX8sX9IAlYaSwg27rEkWj6waDst/NrRrC00YmMyG/D8zPd51NK39N6Qb1akUNjMGM0UQO6PSU8s7E8R60O0Tfv6gBZQC06ksHDggArcUlTl/nAWNrCp6VuSbWiuCiTfUwN8gYF8fenViWVGp9AaRr15k7/KhAN+iOChauwnlkNPNEpST+nYDHtBMd8hW3T44H7RbuO991aIthel2FpU7+re+DcYDZ50H2aTbauaYa1PJkrNqsevfnSrUR8kA1YXLXAbfB1PBgsjYOuY3erOGRu6r+fLqUqeQZrniQ/hzRwrl6nOctDV7VbWfoCTc9ShX//HbwZEcKSRGlhQNMUECebEg39UguAF7k3NzfAMYaB/RiG0e6T9yXpbJxQMlFA7XWV8CU7M0JmNyxShYKnOTvvebYPCqasMiONcj4XC/S3238nqcBCOBGWL7uuTqjPHF7CmaCXUFTot0LV0WB08nN9fGxrpAkhAhSVWXJ/0q3zb6rb92u183hypIh+cVbt2nIHNwbE+D9xdhxsXp0My7C5uRthW61TcPRBzB50QF1G39d0UCqkivL59qnbilvvAJkPJassU7Y1CkoGBk3QwUeOW9VZYTN3AmzYrXPAh/6D+6jFzq3AvYMMbyqLjX6EuOson9LWwg9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(8936002)(6506007)(5660300002)(83380400001)(6512007)(6916009)(54906003)(186003)(66476007)(66556008)(36756003)(8676002)(66946007)(52116002)(316002)(6666004)(508600001)(2616005)(38350700002)(38100700002)(26005)(2906002)(956004)(4744005)(44832011)(4326008)(6486002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+D+qk58YrUqXc4DqQWKQ+wqoaIBvjPzeYZtXSxx+ornukAtSMDs9ICn2Q2Yq?=
 =?us-ascii?Q?unXatBdbEuvV+qqAmr3kRLvwZv8OYgT1vcERuFPRtrCqre817vBhPvDSqB+A?=
 =?us-ascii?Q?KBA9RNwCTv1/m6CecG//5jkRwDCWyNh1SqLy5opAd5peheR2Chgyjx/NTaRA?=
 =?us-ascii?Q?4toLmMn3kBGBm7JoACMAfYq1ek99OJe5yWZjaE7nEULpKQTnW6HuhNrkbzth?=
 =?us-ascii?Q?duPZxFqmKoKWHKB7Ikp4EI47i9D4auoN5CWuKYsPnWe4FOB3cVJRX7lgVFoK?=
 =?us-ascii?Q?1jYPey4kTJX/uiM0b9sjLMOXb17C5loxwTP+quWvjULXxPRfpMoH8Xw6PmRW?=
 =?us-ascii?Q?UU6ptQpg9wt51KwuLOJL8L71CVgpUSqHM0EuVNdwhWqRa9xdKACN4FpaHk/X?=
 =?us-ascii?Q?DI1iyAouKJ+qb42PA23Txbi3mQWHP0pnbhlvmDFf0ypIMH7YLlWu4vzx9qnr?=
 =?us-ascii?Q?femTBUnakezEp5WM8eT/ZuiHm40ojWO1Ywe4d7oWmgE9Q7Kkv5lafzr11+C7?=
 =?us-ascii?Q?W7toqUdmtiQb41D9ZZSY//LS4+KBJZBAv9Seh7wmXHtdD+9OxmbhZnUezs9l?=
 =?us-ascii?Q?VMutlv972u8qK2X7gMF9kQ7rO5nzDkQYDAlL2eef8WGUBsR6lALWcH6rUCox?=
 =?us-ascii?Q?nyTGd4VovKhLbq9marUIu3t7TPPDkF5OGiJrqvzx7zCGrnTwUVv+dpyKVpJg?=
 =?us-ascii?Q?Ea9iOXzqgYH0LGdU8LCg45ZrrRoM+aqj7BnSU510ouWl1JBjvkROB/+Lacdz?=
 =?us-ascii?Q?YiVoBwqul2QQrLA2kzp0hILl8G85y81qP+RMrMFHwG41VXhZeXS/XvPpvlDy?=
 =?us-ascii?Q?RePcuDqj1vjQQ8rSS6VSVXe5thCvAzvZoeSlEuv9/eARMlitXQVaRsskyOyE?=
 =?us-ascii?Q?K/qw3KHOSnMtnNiYpQ/qHSM1m6jM3ZYtm9KmXt3wIR+SRNsqTryrlKTbIhgA?=
 =?us-ascii?Q?n+1q0QkvsVoUuYcQbM8J/VMvNE49l8ItA4eLHeS3WUUdrYRfboMsDOWstmv6?=
 =?us-ascii?Q?Kmc37s7J0mYh1Q3g4KXpYIe0+JF1e7IU/6mJ6nyAa7YHXTVj1wtMBK0Wxhb6?=
 =?us-ascii?Q?BhFrOMm2nxhVFIMD7l8SV9sOVe+xgxe7d736EEd4AasUf13VvCRHxEcN2h8I?=
 =?us-ascii?Q?xvrUFDeOaHe7EcaiFzhOaZ/i6eXB7xMrD1dPoO8LOn62l2XtVww+Bb8CR06G?=
 =?us-ascii?Q?dqv3t8uaEHRHIZM/oHeU5B0+j1KYLrvrqAV1kabVb8mU51rtQLtf5Rd0E8dp?=
 =?us-ascii?Q?AdU+bHBFDfK6PEJ0QThIc7/7l6co2CDVjw2Q1Uj6FeaITB9SR+N5xF/T6B16?=
 =?us-ascii?Q?2tl4Q4+dReR57dMFECPPJ75JUG0W6NI1nqas0dT1F6vS0jTCJYCNdNaVlOpX?=
 =?us-ascii?Q?Iu3h9m1J3nDl1UBB3UVj99n3qjLUX/eXvKYZWISAXSg3uKDH3qGYDjEwhelh?=
 =?us-ascii?Q?44MTiBURoLdHdwds8gpe8COyvkvR8FJiapUnc7Kag1xaU9tHLK1kAJHbo2iM?=
 =?us-ascii?Q?5L/DbLd9obvC3ii7DY2gN50ZcVWDqtFn3k3JDteNGfG/jOXhjLUDsYEbGFdJ?=
 =?us-ascii?Q?E42Mbou6CI48tacMox7KlRGNarU2M8MlkD90cXF/Tgtl9XcIMrZrp179RjUf?=
 =?us-ascii?Q?f5Miex6f4Wix9P/mCA5o3uAZcPl8aPtD8JHuNHgOP3y1tNPdD9mKEUEb+seV?=
 =?us-ascii?Q?ThLuRPuCwQSpVl1eWaQnoEFzpr6le38P3vBANxjRtOVcB79u8Wx0vEjvAUKS?=
 =?us-ascii?Q?qF5BzUpANQ=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 77e2210d-6f57-47e7-d91a-08d9b4e795f4
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 16:28:19.7201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 DrmLKzQtDKEwXF8bJUfmoukBMUZHLt3LlXZG9rbr3QMfh/H1naG9s+r/5No6q4FQUuXnrvjE6casU+FcABLqemEJZXCeW6Ra0gg/rJlhc27GHR+CHMjgWUpgegTLUzZB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7489
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 16:28:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159047

Resolves:

WARNING: python3-webcolors-1.11.1-r0 do_package_qa: QA Issue: supports ptes=
ts but is not included in oe-core's ptest-packagelists.inc [missing-ptest]

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---

Note: Not tested

 meta/conf/distro/include/ptest-packagelists.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index bf9d158a0a..c503a6a594 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -56,6 +56,7 @@ PTESTS_FAST =3D "\
     python3-more-itertools-ptest \
     python3-pluggy-ptest \
     python3-wcwidth-ptest \
+    python3-webcolors-ptest \
     qemu-ptest \
     quilt-ptest \
     sed-ptest \
--=20
2.33.1


