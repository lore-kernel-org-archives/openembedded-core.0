Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C91ACD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 13:04:49 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17082.1780483900257235269
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 03:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=sKREX5aF;
 spf=pass (domain: est.tech, ip: 52.101.70.61, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZN6cba03XYwcZZBqCgjl22HMIlFtmh3xcUdU2DZOuzALTmGQD6AWe3Awx/K8H4LGxu3RTWmH5F74eem/cFIjUOr81r7sHIEbV4XcEmI+FRJT/S0JuymnyhYvYIO8vFdR/JIag3ktFkecuurxPtkhCYY9dGiLbziwCSglnTUz7AjIdoVRH6J0fkpLFYgxfqeX33LAUqtIBg0SQKjRh3qccFhTEGC33D+TFyEhjRFRFnXoo+N12AdC9fu0MtDdpIi2qSE1+ThBA9ptqGs6h11z18hXV/uPYI7zsnj0Vyyl1lC3noILfuk2l20YH6I1c8/IAo2/hAUMViA6VBkhaPiNMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5mBsGYabKPb7l0r9G/6pUKOGy4ujkukR31M6r1UXoo=;
 b=hoBWr4dXJr3a/5sYFRu5VZtJLa4vu6ZpUHTYE6zxy1N5aVNeftxz59FyvOuLRjzKhEFxYTxfoStBJzp6+hovZdgJraeX5c6sL9JYGwYMEbRMvOt8LWzMXWW3idKdIF0hXx5Zx7s04KVjjJJRywnIpUK/jJmGWAI0BQBdjWo+3mP6BeO1ZJP0RAAvqGySF87uG7ujmJMO6GoiKhriobs9LvyzVJkoAwf1xRfYE+6MPZoWUx+Tp80oZURExGaay2uwOwwLWZQeZKF4OZ9eyQuc+f6e8ELgFhgbG7twdG38WXDQYVuaukkTyHhj0kiqr8enjEdgAPXvV75gdA5OkGNfLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5mBsGYabKPb7l0r9G/6pUKOGy4ujkukR31M6r1UXoo=;
 b=sKREX5aF1GA8a0v632sAEl7HRbSIU+XkFfK5ijYbGwKZ61065h+duERtm9hvjBhgtQjVhANCl/dwF85hvsVog4J6SX8dKheuhxWaEZsqa7pMO4LXJN6jeX5FAmZjYKLrwggs6+rmgZPcKEVwL4Hds6MwLUBK+v6C3x/P7Cll+UiKUMc1he5gOtptrjvgeUBTMH/7t6pOBZBmeIwbeKoovgXjCNZWKOLqn43Fu/U8lXWx7QY5UfmxXSza6t1h/yBt+clfE3NDpo/8StO42GxZDUYmSfzu7REENvbzY4bnTKF4MshHAaBaZhvQ6gMSrD8VmmhDRoTRZU5dilKhuLWnuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DB8P189MB0839.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:148::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 10:51:36 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 10:51:36 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][wrynose][PATCH] python3: CVE-2026-3087 not applicable
Date: Wed,  3 Jun 2026 12:51:29 +0200
Message-ID: <20260603105132.872256-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO4P265CA0247.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::6) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DB8P189MB0839:EE_
X-MS-Office365-Filtering-Correlation-Id: 5712439a-303e-44d6-744b-08dec15e1525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|6133799003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	x6OvTdxGcLxMAXgRjWGeoA+Po3T158620AdmhAWI+PrmKu3gJacpDkuqjur2hisMmce53JCDyiCwjxy/DksgDt7f/zsW3zmFt/P7ifEZhbO/ner20T7xCl8Nqv+iGyjI2WiRN4KtsxuspFNwlEFv6TXphTB89XKjLZu/siEBPR1tc0IdBAAdLbTR+3AeI5+zJm/e8UjsmD4hYXrVkHPJCigrY8iKxBIKpbo/OuQFyWSxjuqdUmlgH1hHUbDI8klODJtLc/U8VidWRVhCk7CEnkwcQyLvbg0kCLKmr+pTgobdW9M6J7k/dyMBuBLmTtNkk1wCyyVmPu7vti5+zEEwhltASsBCgVOWgtC8PclkcLtUVuKdwkwEyplQQsfuq3H0EjiKkhMq+nejfN8AR69dRDwd9JTKNbfiIsPG14ZRQEYOmGddX2odV0mdD2XSDAcLsSO4ka5bfnS2Mgat+uRx2JHVzhnYmJNF5uDkqTdEYlmuAq48yljiyZR6Fk91oNR6yW4qSEfZzCaCqFpNcphH8s+2vYZcdQbtKsqPBmxc5tIVxx5Cq37kbdgxp2trr9DrX4UjFAw7Hx0Cr9Twnqv+Sqz39PBtGfiQok5reyRCu3jqQ/qzb7v6Zj+lXxYF+qjkxgxb5AVZoaHu6/TGANP0FVhQ+sJ6E9aIYBTQfgq3yWel6aZmZ0OIX8RX0+1DQdmJQ6wDQJyUNNyOf5EccRtFmQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(6133799003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WfGSpPI7lHszcSxpW5cAtdr6xdSIYlD32xlp3UbmYV2pEkIadhwdqs1JQ3FT?=
 =?us-ascii?Q?Me8k1O+8Thzxu/+VnGHUXoypZd30Sf8T9S70IyZ4K1LVGeLMZZFPq2s/yKHV?=
 =?us-ascii?Q?X6tZRqzSd9Mu5fSz6meyu+9d5oUjHGCUXwq4V1giRoxoNdNA8v6TKABNzzYb?=
 =?us-ascii?Q?6yyDPdlJ/RYGqH+i5vw6VDWYqkvJlgbJ+1gx+WtVkIWWg13pjhXF3C/q755c?=
 =?us-ascii?Q?EA844cbMBqPIvuifVKfVTUcAMwAarlDSWtdVzsHk9mIAJH5NFGKf96fiXQMV?=
 =?us-ascii?Q?dEYxgrVNz/yEI9ai4Cy+f7O+FNT9Iza8MS892nuqqXL5fQcA5lfD2DhNWVGn?=
 =?us-ascii?Q?fX3hVMNjIPT24Y0S2ziGkRo3fy8crgaVv6/OGeRGenz+VrV6u411NwXu3COx?=
 =?us-ascii?Q?Xt+7ZhMGYT5AWCwDJ9ZFjHRcbY2gX3OzVGkXZeLRDPai3AXmgahQ6rpRX1HK?=
 =?us-ascii?Q?/0KmHeCqZIs7aPROf2RlybpKYD1JMfP7W3PQEU7VFAvAAAihpw73onBp7uck?=
 =?us-ascii?Q?ccKAuAs/gXMKM8ChZKHWPk0gf6+cBFbeYyudPSplTVjGkZnQIbzWfSL+JCCA?=
 =?us-ascii?Q?AqTZhSqsoWFv1HWy0X6BH90x7E7paRwZdrQrcdILgoIcCWwWsLViNb+bLYs9?=
 =?us-ascii?Q?XKeblwuknvzzIWV/ZVV8lEhWMWf2GvtK3KBkPJceQ4AOLaem1gxxQngu7eYK?=
 =?us-ascii?Q?zI0XkCHWGe8CKFaV7eJPGESIBwiAaTTWwzh3Sm66OHtOeYGpd7Od20hTNJlm?=
 =?us-ascii?Q?btsI1Ym8rIRPF+sl4FVoMet10sH+C0uCBnNHawav9XpObK/f3AO/Hhw2iUF1?=
 =?us-ascii?Q?AGoKujl3/WU5K/P7tfMP92Ry6HQuc0VnSzOolSicKd/cZ+gKXPHT93c86Fk8?=
 =?us-ascii?Q?WeUec+8pis44I9o6fDmluOWetufz+t7UEaFLFSxnMdRtBRt6T7HI6rrUYd8h?=
 =?us-ascii?Q?urW/86eAGTU2Lfx2Zvz8rsYKgO/tDqcl2/OzEnprkRCsgCl5KOJH90lg2cze?=
 =?us-ascii?Q?vAiJa6nbY4su1s3BiPaqizjxVXLOhpeiggONkWOmpxAcnRk8bfeISGgIA8zt?=
 =?us-ascii?Q?oGBwlydBQ3l9mcWQPQDYAPilNt+WPqnkjhOIm366tRi4GcpdulohSU2owVC2?=
 =?us-ascii?Q?HPmpijw+oZECVoVGVDQ2zVjtnx9HsZcm9Uzso6oD1WKb0SQvWbXoj+XPtqVE?=
 =?us-ascii?Q?BgzfqsAYf7RPUUqQEakpIDGOL5/MSDf9owvNYmwqvZ7YTT0AtmHAywHge81B?=
 =?us-ascii?Q?z398ZAZLPk9eaPFoZ67GHpag6r2Ehc8Cf9C5hPkwUj86+F6trrvuIiDU+vfR?=
 =?us-ascii?Q?LGURoIYX6DntefdpTcSy8Ni0XMto6x28ILH5MPXjSeZGUFzssacKGCZCpdiR?=
 =?us-ascii?Q?Cjoq8LCUh3Tibth/3AkCNSuwNw3vFXog8lQ1yX5R/5KIdB1U7eEWtbtcqhvS?=
 =?us-ascii?Q?EU8i4yPneFb2H7vOhvgYdVCbKRh4MHh6ZFDi1H8vw07y/m+MZPhIeZGgJhUi?=
 =?us-ascii?Q?FIt02lkXQBdWQuyUiE5fPgh1yFvgv5BeJBh3AMV8YYiUiVckc2PqCDaMQbB5?=
 =?us-ascii?Q?a3WbtcpaGhQ8kWUjSCn+RM2A8LeEhuR8RwLqkYwrftqQtwgDww1YbRd67zsf?=
 =?us-ascii?Q?0/e3sn2X4fRaASCssqpuv9Uy2NM9tbAVaT/wWwm9eb6dD09gTbn7t2NsiQgZ?=
 =?us-ascii?Q?8BE4R0i01HdRr91z5Dkeu9m49QXO0IFnPJqhhJ0axL22ZM74eA4pBUngnrxy?=
 =?us-ascii?Q?E4uOee65deCC0L7Nuz5p7klOswMSMfg=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5712439a-303e-44d6-744b-08dec15e1525
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 10:51:36.0152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avfg0FlvN8IlKrZJoQ78dIB0BDiVjxjS/esMVMOFuoZYaAs1mb8pyoWxj9YEyUbIwZGCmfgNBA0QUKUHWBo7XldnJPP9A2t9hCsbjiigWYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0839
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 13:04:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238097

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

CVE link: https://nvd.nist.gov/vuln/detail/CVE-2026-3087

The CVE is only applicable to Windows OS

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 meta/recipes-devtools/python/python3_3.14.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.4.bb b/meta/recipes-=
devtools/python/python3_3.14.4.bb
index 71f590f630..84cd770f3b 100644
--- a/meta/recipes-devtools/python/python3_3.14.4.bb
+++ b/meta/recipes-devtools/python/python3_3.14.4.bb
@@ -48,6 +48,8 @@ UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+)=
.tar"
=20
 CVE_PRODUCT =3D "python:python python_software_foundation:python cpython"
=20
+CVE_STATUS[CVE-2026-3087] =3D "not-applicable-platform: Issue only applies=
 on Windows"
+
 PYTHON_MAJMIN =3D "3.14"
=20
 S =3D "${UNPACKDIR}/Python-${PV}"
--=20
2.34.1


