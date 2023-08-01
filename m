Return-Path: <j.lemetayer@kerlink.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABBA8EB64DD
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:56:28 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.45])
 by mx.groups.io with SMTP id smtpd.web10.7828.1690876587394625072
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@kerlink.fr header.s=selector1 header.b=APkE55KK;
 spf=pass (domain: kerlink.fr, ip: 40.107.20.45, mailfrom: j.lemetayer@kerlink.fr)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2UX6BjdLtdnitIZku9SmUIT4IlmL0kGeRlHACWepQOmMMOtqqds0kppSpFqzZcnjW9vypHDEQsnfizrZPZaN7uL67nznY/0CLn7ZdRROxg0f8uX2MJES928ROS4SMZ6v35V140wxdr5eG7yWPqWJvoOOtB7JTr6JbvKvSxyzycF94gxjwPn8d1iFp410cHRFXS9Y1Z7inlv+R+tmtfRgvECJZN9fybYALqw0AXIMOGkGSpw08SGI8v7DMEKMqh59YG5foPbuUxZANd69PIly3VJbGj3IMdwNGJEh+b9h0m7t7kKQVe7pykphIGb20fWlZyF524BkUw7iH2vUmfrlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9Oh/1tShT7k9Dy/TBvEzM/FG223z+pQb1juvguZC4g=;
 b=ZopZxDUF8VhZAnqhjMushuAECK3wPIwKVMDTLiJFYBvxSixXyUcXXYlA106Jdf6qGv9zUlcbkkA8bJFQLR/NwyYZaVBtfh57hrfjn9l+0lB1r87ODwbLKcExcxzB6NTZNOnxPUyQwkmK1IryrdR3Od95J9v8l5c0i9ZU53p0BQ/DiB5Mwp1oGKYQlroEIL3H4UXMFVH5GjcqWMukFrCOBJ9tBmHl7+63i7o5mGsqlKOgADhHO4TGbqKulOPQdtk29i4AZajhjjbxhwfAFTm82eZp/q7ypRQR+6aomMr+ua6YbAaMFKzn2t9i8eMiu213LbTG/kGgN6rm8muDsEH89w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kerlink.fr; dmarc=pass action=none header.from=kerlink.fr;
 dkim=pass header.d=kerlink.fr; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kerlink.fr;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9Oh/1tShT7k9Dy/TBvEzM/FG223z+pQb1juvguZC4g=;
 b=APkE55KKkd+/VeHfto9sB3dnyU43x5bx7UpvQtD0VS5fHsqENFiuFdi6TUi0S0d/pGNVdNaa9s+BxVevHO3yN+6Xbb7Z3cB4DZK3lQZzyV8PIFRpH9l0Pcvp3fuvSYKKJVnTFAFefsS1G19ccKBxLfm4jXt8kjS9EpwySSceX3uDJD8KQ3dt8M5zhbzr95+pComU9QxUBfskL+SorMCwScl3QFJD7li+sY1HZe3AONLdJb2BU+TWOUwK5gPzkPJJMAnimvLlxh3C1ZmY81ZwaywVcCkmc+VWnWroWJMu5HzESTyAV9eRrMiHri0TWuZn0BtvbeAbOIiTzLy1Rb05ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kerlink.fr;
Received: from AM0PR10MB2513.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:d5::29)
 by AM9PR10MB4102.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Tue, 1 Aug
 2023 07:56:25 +0000
Received: from AM0PR10MB2513.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3b7c:ae85:4dc7:5a64]) by AM0PR10MB2513.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3b7c:ae85:4dc7:5a64%5]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 07:56:24 +0000
From: Jean-Marie Lemetayer <j.lemetayer@kerlink.fr>
To: openembedded-core@lists.openembedded.org
CC: Jean-Marie Lemetayer <j.lemetayer@kerlink.fr>
Subject: [PATCH v2] package: always sort the conffiles
Date: Tue,  1 Aug 2023 09:56:08 +0200
Message-ID: <20230801075608.4944-1-j.lemetayer@kerlink.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2023072810313162556501@mail.local>
References: <2023072810313162556501@mail.local>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0145.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::13) To AM0PR10MB2513.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:d5::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR10MB2513:EE_|AM9PR10MB4102:EE_
X-MS-Office365-Filtering-Correlation-Id: 791ca7c8-eb39-41d5-c865-08db9264cd9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mLvCDKg/4oJALSeXAQiKm+syk1FieZBm5pX2gUMKkHdTM+Kj48V8qnd7/npqAYm8cWMD6CS3EdCRjQEq/0Mpw/VtXIs3f2dBSZC/qr4D0b4MqzA/cdAldpWGU8VyC+x9GlOXVVaiMwWKAEqZugaUdZTsRUlWZc1r+gusDxO8Il7E1ULpaacmGBNpLj8cdVZYr0rRfr5SobbM2IJm5oQzF+xBXQtT//B+lGYmVqh0Sy4pUgFpOEb5eWsDyCtJP5W+UTwPIdLvXTmO4eI6T9NZDBBa6HZfG2FQ7GBXdU8QqqCDwXsy5s4o7hAshiOD55jivEh9jLp5yDk+4hG9TK826eWYX9AyXTzqYFtFq36sBWNXoUEilQF+i9BeHqBAsGcXkqSVYCBRds7D3gu975iBstf0H+uYjMV/G1rLw9oxnml3jZQoXTOOe4RJsPlnhkKl7vyg6rVSl64ZV6duyeQM/gqYqbCQh5OhHLItttxuLV5jBYsUxn4KTsgJzH3PluCiS9de2RXkzAP38xaB5Eee7FQrrW6uF/2OUzfcH8Hh2QgIIN/9PtIlbpMSuv4vD3A91NE2TjjU/C6Qv3KNplA9piQ0z2cnXzpisNdW4u4kmDOIXrSoZP1IblcK4YCsKECu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2513.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(396003)(376002)(136003)(39850400004)(451199021)(6512007)(6486002)(36756003)(52116002)(2616005)(26005)(6506007)(1076003)(83380400001)(107886003)(186003)(66946007)(66556008)(41300700001)(38100700002)(38350700002)(66476007)(86362001)(316002)(4326008)(5660300002)(8936002)(6916009)(8676002)(2906002)(6666004)(478600001)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w/JSk+e4KJVSju+PR5LHMW57o7lTczmdbtI53PQZn78liW49Oub20sjmVUzD?=
 =?us-ascii?Q?pEFp6s8S4u+v4vuQKB0vWRgdvMRsSVIXvM4jQRjS5k8sqfH/uWtIbWVq5L5r?=
 =?us-ascii?Q?FFWuwjzLbh6RIbcF62mzeJ9RLJZvvbn5mV74rPa9uFP2FT3wq2tWKRTNJssv?=
 =?us-ascii?Q?YEE/qBYPItx29Kl7rHsVyHOh68slq93+QCFcIno9WJuwQIwbdzGFW7oGg0TB?=
 =?us-ascii?Q?/1t/ptCoFzVPJMVO5MwHPvLgi85SHulZWCne5CI2GVeU8fsaNKHtS/FDcRI5?=
 =?us-ascii?Q?ZzSwOuOvcX6v7r0xrKKjGxnthR4FI8oQ+A8DfehPNU58IOqgHWUpkaG9DVl3?=
 =?us-ascii?Q?evdpaQ6jY4Hd6VEo1dB2ozUZGH+sKDP09OYOCuETeD3qrILMGw27UfYaZf89?=
 =?us-ascii?Q?xs+kp/aXcRXtbxW9lPEBl0lJ0x2xr8MupcHK3IOnmgFqD5S6ab/NzXh8mAzR?=
 =?us-ascii?Q?9w84A9mbpU6O8t+RS9Gk+p5zX6rCBnNJOu9DMrVBwZMWiuhd4HJfRVIiEOnq?=
 =?us-ascii?Q?ZW855Rv1XtHYW+DbCgdS0NQXZ7sYiySATCgerz8QSOHo/TwwwzdY/9C9tr4o?=
 =?us-ascii?Q?oleRMMnIW7rmNVDILlfEElSMWqLbc8TLnFgbJ0BOVlsl3ypm1g8hkaSz0EFx?=
 =?us-ascii?Q?fm66CZeMD4faj6DHE0yGYvwRxIwRL8voqdUIF9vkT970MMGslaQXBzeCm8Gp?=
 =?us-ascii?Q?m8+ItonOXhB2HJa2qaV4sHlJVKuefRTQmIFOroz+1c3ykHbQFGYecnsk2MSM?=
 =?us-ascii?Q?NG6d4+iH1lUzv9uZSP3evtDdizCqd45DE4LLLmDSWT0u4ymUlg21dLoQITuV?=
 =?us-ascii?Q?LVfzF3FYfHlr8B4ie63FLqELPloKb2BXshirB0geaAlLAaknuLR4XxrPcSOl?=
 =?us-ascii?Q?uaCbcNOoUh8BCVLMcVmFD6sOTMkKtad8utwzUKhm8amiAvol/IhLPNfLR2kT?=
 =?us-ascii?Q?hKeVzqn7gUj8MLhc7FqRE7gXcJdrcj6Mga5SYuweCQfO0olo10+1fqMK5TNI?=
 =?us-ascii?Q?v+gR6v2qyJOBnsOoHI0ssRVkfwqSEnpZUHStgjIYOMa0tlXEdZX9PlEo/+tf?=
 =?us-ascii?Q?3pnz0x2Gn+qOyBrSsvcnRWJa5SWzxjzis6HW23RHlDPtmAFIqhnrmfIRrMib?=
 =?us-ascii?Q?GdoA1qvcAa5UGxP+VTNVp03WDNR+17CydwZ6iUnkydKjkafMzdAuhCDfsdLo?=
 =?us-ascii?Q?DCbpozTWmx5ZvW+3W9/nM0IK5gFmShn/rNbjn8v4MkpiVfNFylXBdqIVz6t6?=
 =?us-ascii?Q?d1cijwWIkmlzb5mEyQJ6nPzkxhI8SW23z2GjiRBFRb+2Rn4svgtsTH1x1+7t?=
 =?us-ascii?Q?Sj6Pa02KXcUkBRUZK6/5wHDNV7g3b1IWc5yvajezeSyVTz7aDrpEjE43Kr6C?=
 =?us-ascii?Q?FnXs6X8uii+PcPLwrDlsBR8/JtYLa0tEEoFI3gtN4WrdUYfaw6QrK/bik1GQ?=
 =?us-ascii?Q?2z2rEbC6X4MblAq+n0Ir+1Ki5ujGq65dvbBMO1frnOqhJRwT1C29lBTBukgH?=
 =?us-ascii?Q?dEBJkGYFHNqnkBbD8LlAJ3mDef45kxtU1BtWB3q7GWvT2jLgzo6cBVRkFoHC?=
 =?us-ascii?Q?9ntEEs8h2u9Bd9tbzWjMwPgNaB/CgqcHKjfvqH5L?=
X-OriginatorOrg: kerlink.fr
X-MS-Exchange-CrossTenant-Network-Message-Id: 791ca7c8-eb39-41d5-c865-08db9264cd9f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2513.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 07:56:24.9352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e53a72e6-936b-4019-8ac1-596e63242dec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CtgoHgyU+ZvJI8W89AZvbU9yThEXsDcdil/iWpi4OkgXCgJg4+wUgwwnSmRtOnFRZV+sXC7Eb1PNNsx4Sp0mGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 07:56:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185212

To improve package reproducibility, the conffiles order should not be
directly linked to the file system.

Sorting the conffiles solves this issue.

Signed-off-by: Jean-Marie Lemetayer <j.lemetayer@kerlink.fr>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 70040f09e7..9d70925b9b 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -613,7 +613,7 @@ def get_conffiles(pkg, d):
         conf_list[i] =3D conf_list[i][1:]
=20
     os.chdir(cwd)
-    return conf_list
+    return sorted(conf_list)
=20
 def legitimize_package_name(s):
     """
--=20
2.34.1


