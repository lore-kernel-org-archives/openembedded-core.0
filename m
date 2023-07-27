Return-Path: <j.lemetayer@kerlink.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B7AC001DC
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 15:37:51 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.73])
 by mx.groups.io with SMTP id smtpd.web10.10593.1690472267851452299
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 08:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@kerlink.fr header.s=selector1 header.b=0+ddBxRH;
 spf=pass (domain: kerlink.fr, ip: 40.107.14.73, mailfrom: j.lemetayer@kerlink.fr)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a70XY2+Gx9YOf+9VaY9PmV6bOMT5r52I/MwcJrXfLQOzzR6HQDjm/2wZjtRrGMMGbz2OyQ1doEZurfP2EK7qYXljXz070J7mzeBR19SZ4J3pz8I59RwRWUNaqu3OBSN1VGtDW5ZPs/Bs7eE5EF0GYk4qpOvZJmBgruSV1MR+E7AsiKPAV3Gorx3bMqPcy8EjxUtuWumhLmJLwunlyfu+aK7GsvDbx0ay1cqbUIubBzCBWQxzqJT3DKbxL/dZj2z6hkPL1Opopl/fd6Oc1eUkyw1Ces89UCnOeiTReE0U8D8RZwiyS6m0vT+ilF0d+nhZhWt9t9rYpqZZk9JxjlZS5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsI2rITi/XDWbAVQfmd5pGBeOCiokHZDB9fhR0ILeJA=;
 b=d4A9uJPD7BHF5bYFG3KQUAcI8ooTaJCoph7Z4JUv2Gn+cbKHp4EAdpJBkGNX7vH3hnA7Nc2ORo8wjGSydKvVSy7Eizp3x2qAAXcHD1o/MYzazYmw/HE5Z0IrqqxlQMSNyqrHQlcVc7+ne+pe9GnMBazDVo9c7/6sBio187fgnvCQLbdkZmTddV1FF2rVQQ7xOfeu+vgfwJrHbZJ1tZelWOK2elKDJg0bgizjCqP1UnHFYQVl6i3oe2QhpWXLNAjUTCOeI5F+cvDxv5p5DpSwLFO0LnBtc3rgYEeTka5gwQUHe8cfPC1fWSo3R5CoZt5FQfiTsiqKBuOXiCX5LNoAAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kerlink.fr; dmarc=pass action=none header.from=kerlink.fr;
 dkim=pass header.d=kerlink.fr; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kerlink.fr;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsI2rITi/XDWbAVQfmd5pGBeOCiokHZDB9fhR0ILeJA=;
 b=0+ddBxRHPiPslX0VStWZJc2fkfwpTjVcZxMI3IPO/mJ6QLqZZqfSOSsRJamgftJWyrGAS5gIdupkFGmH7JOSCLleQNLV1YIYZKsyjh+AIeCpSryssU2Ys39jJc4rLzPHntkNcaWDB6Yuwy+SM6ygHli1jL0V2psySqqI/vtl1LLfgrykOWJQSpIeMVaPZjbGpn/fxClBqe9JHf8MxVWg/eMuuwKiylICQ1QdXaBOIQB+MpRfJQB79QFlwhiBWHGtfUhl68O/oqPwgf5qm+yKMtBP/qf6ooeZ+YN3KVwGD0TaCs350yzBHf8JHJoRMzsWgcZlhGhrTb8sU2iQwFz/yA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kerlink.fr;
Received: from AM0PR10MB2513.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:d5::29)
 by DB9PR10MB8263.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 15:37:44 +0000
Received: from AM0PR10MB2513.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3b7c:ae85:4dc7:5a64]) by AM0PR10MB2513.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3b7c:ae85:4dc7:5a64%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 15:37:44 +0000
From: Jean-Marie Lemetayer <j.lemetayer@kerlink.fr>
To: openembedded-core@lists.openembedded.org
CC: Jean-Marie Lemetayer <j.lemetayer@kerlink.fr>
Subject: [PATCH] package: always sort the conffiles
Date: Thu, 27 Jul 2023 17:37:32 +0200
Message-ID: <20230727153732.1104305-1-j.lemetayer@kerlink.fr>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0507.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::14) To AM0PR10MB2513.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:d5::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR10MB2513:EE_|DB9PR10MB8263:EE_
X-MS-Office365-Filtering-Correlation-Id: 518296fd-5d64-41a1-c7b3-08db8eb76bd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7nh2Tuf9mTDKJuiPf5pVdqyOFRddCtiuH8P/VEBgjfe8EKp1gQIyqQHD61JnhH5wNmMG6q5JRn6szeol3MqUwSVzlSie3ubY0dXs+byZlBYhO1ktZWozpWCKJjLBZBFs8su7fauEyRLIT5oNeTSzqdRgLRw5+UBh9rON3OQav+wvOvITcsTuEYH/ytjQ6WXm/LHo4zm48qK+AmhosDshWyGATJ6oiOfOTX7m84lVvq8g9K0mvMzxM2qGK9cm/SQHGohpIehFjBzRAhNWOdVDWMeL2lScy2Zn62PkkHH2FI45S2DpP+8SkSL5oK1U0FmsXf8HriGNsIKwFpYz6lq7oldpgy2M+Cjeraf9Qzgkb1Sq5BtyhtdEVaiHPwIphOKmXiQE0DgaVlDNRMdbw/igacRLLigDebipLabJ5pTWH6kIH4b/nJtXm/BXJ1RUflyg3ICeGTIwYvnkDRCc3y2P0jQIRHsqRtJuQaLnjM+L32+85S+JkjKIR9AwvNICFZok64SYcoNZ1LDo3/CIL0rLDJLdhQ1HCU0gNKUfzb6oWpqj6aCQ2BrEFNLAh0J8L5lIN4JRPwLSEidnRrx5nNZmVzGSac99byzVC6uV1gfBLR2tI2znp8aqxl8rY3NObToK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2513.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(39840400004)(396003)(376002)(136003)(451199021)(4744005)(6666004)(52116002)(36756003)(6486002)(2906002)(478600001)(316002)(5660300002)(8676002)(8936002)(41300700001)(38350700002)(38100700002)(66946007)(6916009)(4326008)(66556008)(66476007)(186003)(107886003)(86362001)(6506007)(26005)(1076003)(2616005)(83380400001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DZxSC3DSoVwer/AKbtOrjXlJ6LdD66n3TiX+BQuPuyG5WyRPuFAjGYlOYZUe?=
 =?us-ascii?Q?iue8KHLd1sQuzDSBltviaS1wkh+VJ/txEQTi1uVKJWjoVcGflmpehsejIYNF?=
 =?us-ascii?Q?xix6TBGCgc0neqyHiARWnMQLGSkLQy7O9zQI/7n5Uc12hpKgVBQbNPqCgdOb?=
 =?us-ascii?Q?S5HwCe+DUPUXUpbsyEzpPwSaMjq6st+5p7Ehm5NT5hL17a/Tq00Mszvoht+y?=
 =?us-ascii?Q?RavspbzOpVI6xtyIOXNvxQMSDA/m9pXUZ5Kqtczkt5McjIPlGVZFrasqTPF+?=
 =?us-ascii?Q?ZN/rvebqHCFTrUWJzat5BFgkyKXKeP0vXaBFkqZQyswz8k9c3ZaTBnlt17vl?=
 =?us-ascii?Q?96aXf4ea+w+3ICfqG0mCxqKkgZbvhtNCmcFKmlMGyCn3n9hC375rJSGx5tCM?=
 =?us-ascii?Q?JRKUBr3bqRK6VRauOvhDAvCwyieqmlqGEOjqEQ7bzarpgjDQXfjnlwnqa/+C?=
 =?us-ascii?Q?mkzV7GzH2Ewch4D2NzgFoL3YVKRCLh3YDsAu2hhy6YarQiAtdiYemopMugYb?=
 =?us-ascii?Q?xZ89jI/nywMI73f6DWF6IG6Js5+BfJsr/4pz1nGk90sRnCbztxhARVE2EuF5?=
 =?us-ascii?Q?5cCiaixa4dTqy33krcnMZrLoeI6ejQ2md6dRnmdgpHdxf5k7Q6FrDKntdDeM?=
 =?us-ascii?Q?hDeyctPLSnY9woJvM/vn7sURfuEVs6qLRkh8v/a7npU/ZQrGLkgyXoXzMzsA?=
 =?us-ascii?Q?8QgH73TT3gEE4ahg466nEADdCMcYGkPqyio3+zuK20crgCfQIA4WZX9G53lZ?=
 =?us-ascii?Q?0XsfZW0T8MfM4AlKlPDZIRw1WS8ceNy86wdIiu8n7W5Ug9xntA+ASxsUwjA2?=
 =?us-ascii?Q?1peieUPLeVIJjzKyp8zFx2NE/3BSZPJ3qLbwPZx0R6AaNCoeoKp6+Ksb3CY5?=
 =?us-ascii?Q?UB4K86vFyQ/sYVmPKDQ6NC012+pzQvC+TUp4ge4j4Asvt2SbwnAxTlkhSbRf?=
 =?us-ascii?Q?JxvLM/uJ1Xs7/1x6+8Kqm0iIYEJgITTIyGBmqVA4JBFrlMr6Test39hC9SrZ?=
 =?us-ascii?Q?gP76cJaEPoRdDVN8+hSeL9AczZ/jy+W9A2Mgk3w1moANbenyCV5MA3ibzWFe?=
 =?us-ascii?Q?3s/3zZ+4xYzTah5amgtoJTLIc2wq6OSZyGPO9XGioAo/9q2xC8lEEnEJhzmw?=
 =?us-ascii?Q?qmYXp89QfSoVEl4il+vaaVsKKaNzorkh4b+HF/pj6RIEfoeTAAlS45W2BZwR?=
 =?us-ascii?Q?qlhkjhNeHlf91ajauPS7sHg3rVk+DKpWIRuEkpxM/Yz3n3zburQMRwpeDcc9?=
 =?us-ascii?Q?2MuqFXZB93v9wrnPi1IRY1eaApEJDjf1vk+qt5IgdSxDTZImghB7JWawNira?=
 =?us-ascii?Q?nj6d271w99LgXfMwTy20xgdJipzIO0AzgDQdlQwg5XzroUULymkwxdfEwmC1?=
 =?us-ascii?Q?/VTlcnmkbpEtEm/MrpijWfoyH1YsB4txGAzWgC4jZEQosczRJlcmvPYBs9Oe?=
 =?us-ascii?Q?GiijbtJOZMkW7aUdaQ3cfanNXUMI53v4f5F+jGYvoNcbSpxwcpWIJQina3ai?=
 =?us-ascii?Q?oZNIsiX0kaqWCUaXdkk2MA9isQ9tGbAcaY+BEDZ5zGrCF7jZ5Mfo2mhc8/i6?=
 =?us-ascii?Q?3c9ZuAijvnEFEeDdIGppWp8wx+vLidpSLWa1ueqtZJe9WrRB8i6M3iuc9WW+?=
 =?us-ascii?Q?2A=3D=3D?=
X-OriginatorOrg: kerlink.fr
X-MS-Exchange-CrossTenant-Network-Message-Id: 518296fd-5d64-41a1-c7b3-08db8eb76bd7
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2513.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 15:37:44.4413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e53a72e6-936b-4019-8ac1-596e63242dec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4fdM/zyWdJEWIql1op+syuq/SWum0d2n/8N4c95xej+j7/GJvxfY9zWt/sYQ1DIBQm6lY+80BnTQRx/sMdeWlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8263
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 15:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184964

To improve package reproducibility, the conffiles order should not be
directly linked to the file system.

Sorting the conffiles solves this issue.
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


