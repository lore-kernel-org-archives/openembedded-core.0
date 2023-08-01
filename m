Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3EBC001E0
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 10:01:29 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.81])
 by mx.groups.io with SMTP id smtpd.web10.7772.1690876346928206364
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:52:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@kerlink.fr header.s=selector1 header.b=dp5+zRGN;
 spf=pass (domain: kerlink.fr, ip: 40.107.8.81, mailfrom: j.lemetayer@kerlink.fr)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egywjJRsz12zkg6DjnX8nv1Ce9KxrV/CupvB66VUUERShb+dj4PfWP/X4/TJvFX+OQROH+lFiLB8MKzjBDckkpKR95NP0gWe3uZCfVJ2jEE057EzSmVvZ8IiwUgK8mpb+jV5q2JudfTpdaWwFHLv36YXr4U/7rXEQSH6jQHyWeBTEQs8HJKFQVBIuKS/lex17KlRc6RXqX+bhtq5Q/9crk/T7iy/Uq5kIi1mGUGjrIB6SL9eF8QsDVghadmEfbdNB0xZgWifahsXe0Bt9zGV2rzdURLzRzYZPqYLQ19UjctxchNPLNyicRhPfl2e+7RLnPOPwQMcphE1Tc5H86elOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9Oh/1tShT7k9Dy/TBvEzM/FG223z+pQb1juvguZC4g=;
 b=AN1amsCMJyqc3c9IOy2JH1tbSxHi4EWzsqB37M2+k81FZouom9qY87gWnpavcVpNSWP6HvwrMazfOq9nel5JkHlkR9caueOJRC0ZKf5LEtOaWyr5Udc1AtKXgnvpxDURDwfD+X58kSZfDvsISCbT3PQJ1yH21RoeYuV0gC0O9RGjjH6z6N9yIo1BpkqMPcB2Fg4ooqXtszxTOu3kUnnGcWbbZ5PvFEXcB5KKAxZVdUSnpqgVLkVTu8dHEvdFo3z6mBR7Rs+bhMQv6npJJtMB6HhZcsA/Z1i+ggU3wrnNGzjndhf2B+bo+d+DMYl1dHZ2HwojFTWESx7RfOmPm+mD+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kerlink.fr; dmarc=pass action=none header.from=kerlink.fr;
 dkim=pass header.d=kerlink.fr; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kerlink.fr;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9Oh/1tShT7k9Dy/TBvEzM/FG223z+pQb1juvguZC4g=;
 b=dp5+zRGNi0hEcO6sZshXx7PqXPNA84sDbMpWBQ5yBGZnD252lfEDFUduHnWl0afqpgHO4iqj12YACvnH83AqEAcUQqXG9oZxipfZJQhbUPHvbNYaRRc5c7TWcVtXVvhQ8DWTohAbAuJz+MB9nISwkeyDtrgqFNKnVzLXAo4QaPCmvO8wmFkddioTGIdQ3F4N6OXKCQ42FVmAgqjjqVmLuKNkDYZ3MSRnbxHDtEU9YTL7aS5byLjx2VX9O8Le5SWxXY2ptQQw2uSI2Am3YFj+mmvOzR385VJaceSShYmnztSmoxHbPuJl4Z3yLTz6jVEhdmidLxcCvUIi5oWHL8vOfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kerlink.fr;
Received: from AM0PR10MB2513.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:d5::29)
 by AS1PR10MB5650.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Tue, 1 Aug
 2023 07:52:23 +0000
Received: from AM0PR10MB2513.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3b7c:ae85:4dc7:5a64]) by AM0PR10MB2513.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3b7c:ae85:4dc7:5a64%5]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 07:52:23 +0000
From: "Jean-Marie Lemetayer" <j.lemetayer@kerlink.fr>
To: openembedded-core@lists.openembedded.org
CC: Jean-Marie Lemetayer <j.lemetayer@kerlink.fr>
Subject: [PATCH v2] package: always sort the conffiles
Date: Tue,  1 Aug 2023 09:52:02 +0200
Message-ID: <20230801075202.4246-1-j.lemetayer@kerlink.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2023072810313162556501@mail.local>
References: <2023072810313162556501@mail.local>
X-ClientProxiedBy: LO2P265CA0481.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::6) To AM0PR10MB2513.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:d5::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR10MB2513:EE_|AS1PR10MB5650:EE_
X-MS-Office365-Filtering-Correlation-Id: 7714b756-2867-42bb-1155-08db92643d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sX3h5PsM1f3Aji8fjse7Puuh98ZBWFW4K7rl3a8beDNXwWlDVUwBY2F/tWxGr0b5jSZKUnfOeC/gVhaP0v8UbEgmOmUThWlLVTXPHR5+lQDaYnFclpVJOtwSsL8vd3WncGtKkYi45kO1rbV8jjE0NhZrHkonU7P+Ts98R2fyaO7Jc4FpCr7VmkQCELK/bFYs5LDeWicTDOa0AjPRkwc3WwYmmsUD6pV6kk2TlzG1OTcNoY4cZ/r25ykDPatYeIZB8Tf3jI4mLfHa/xHyol92YshAESJAJAjA91GMhhXFp/81tTVhdhwSMJJpkG0OYuJCxd2B42mz1xwuEBiSIaHOSf6PLFMnW9FQSC4m34EhqaFzrI2kxQnBY8rtOXMsxVZ7e5PtJeADFJ6QOTc5MZWZ7ebAIcXxPOQbG/hhm7UbJmD7fX8DQHO9xY3/kq3SvgjQ1/Jms72KKJAblQimMnL2nQokmYP09ADQL8j63KiIuTk347CRoW1ikBn+eDN93cYxMBPE0rPRhHB+zVzwsZeNWrXrIbgOWa4LLVV/Ba4AHFtTje0Y2T/QUNjJXLpZmPTZths7YNRClf7SAZoG8L+uCMUfEdTseqEUMkLG3K9FDPRHbBfT6IVYSFL7Bmv390VG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2513.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39850400004)(376002)(396003)(366004)(346002)(451199021)(6512007)(6486002)(52116002)(6666004)(2616005)(83380400001)(36756003)(86362001)(186003)(38100700002)(38350700002)(26005)(1076003)(6506007)(5660300002)(4326008)(41300700001)(8936002)(8676002)(6916009)(66946007)(66476007)(2906002)(4744005)(316002)(107886003)(478600001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U88JK5+WyLDwLYDxOLh1T0k5b6VUEflCllcgcrJwoYcIYwQwRihglNPlyZtt?=
 =?us-ascii?Q?XK2lwXEzUdW39NSHxuevrJJOBuwf3pzSTUeDbN18f8MlBx+d842jVW6l4THy?=
 =?us-ascii?Q?23LPphuOxYVzLfkcYCvnfBqpVbFZ8SCV5AbYPlaraPOSGy4QCFH0LuYE6a5b?=
 =?us-ascii?Q?UZDBFrvpPiG3d7qHgTzWsn89Lapjwfa6+RXCWinLFp1EdPIHAZlEu2QwbRhx?=
 =?us-ascii?Q?hBqdtCMb0MvqH/kC4wdy08dA6Pj1Nx3xiCCOSk7STo843YlmNvqOzC9g9KqQ?=
 =?us-ascii?Q?hKGhA2mXfpdh2anozhhonpJ3BNXDN9pfXEDGBV0sMY1L6gEuzVeMXh8/73t4?=
 =?us-ascii?Q?zk2C5GU+zmLWQkAu+Y1lQgALyUYKkZs3pT0PxAtVGPCnSWKRBqgdhvsRuxP2?=
 =?us-ascii?Q?2GVlMII3osfPfnAWZcciZMDYip8N7RWhaUf4aGgHoLB6A+bRZrbEpHDzN0iQ?=
 =?us-ascii?Q?OHwehACyCxwqKbZJt3h9r+wjgQOfS4t1aIQOi7yBtQp7+HaZzm36ibVkvt2G?=
 =?us-ascii?Q?N5jmSih4blw9t6YIhBw2EDqSBAmA6c9spKSpN0D0KP0OjMCLs1/y3isAkfMa?=
 =?us-ascii?Q?BT+KoLkhaHb+177Y0mw90Fw7n4Yby1dTrWxnHVcirXnbLE55GEXO6eaL5AVL?=
 =?us-ascii?Q?1C9qCzLHPCAzhCs/3tZ6FhGjg6PcXMlxqMLdeyKkGA5bvrIKGap0GpmVZeCI?=
 =?us-ascii?Q?tlrZWMjr6reCpyYqxTzypRBlPngo524E4mjqLPQ74+t/RoE2q6pvHOQ4Rcu7?=
 =?us-ascii?Q?uYXVHu70RrTdtfVmhm8wLVt/B0qfy4Hd29pPmJUIL4LVIK29c06Cvp3TaDWn?=
 =?us-ascii?Q?M7CTaNeusZJZ6tr6X+0JC6rAO6L/oNsO/rXD6V8+akSsDnOzD6gMqp5tCLt8?=
 =?us-ascii?Q?yLt0U4M1jsnDuUuIpP8fvVDwpeVl7aZjNrLwLtQeEpQerQmEbPtzPDFeOUG6?=
 =?us-ascii?Q?ELa71glth1wcxAcYXvjNlKPE9nKV3EjkKih2sAon8Geez1UxRgp92Gs3oWGv?=
 =?us-ascii?Q?DWHQYDKoy36RYf2OVIr+9lCNqUvtyZJpol7SldGNpH0KOd3LbKA+uVR7MHrT?=
 =?us-ascii?Q?bcY1sLN23w9yZjobL+Z5XN5LH38sRnGeVcjnWdn+Xemfwm5r2xUuxZchXrjP?=
 =?us-ascii?Q?0OlFXdfol3xZ0i398Od83VKKvfJf21HfNSO7aByZo2BNNNyX9I1Za7XhrwgK?=
 =?us-ascii?Q?SQD0iIY8Vh7RJrnoDxyD5OmW9jvQQeB+HswM7ZScGzOu+j+52o4F6V7HGqAJ?=
 =?us-ascii?Q?0Ol+GKlmfhL3TwjYIPBSXtv3iInjdWyumdvIjUdruX7NnZCmsHyb986/4z32?=
 =?us-ascii?Q?TH24nkwzm9skWHoVpOvSG+u4tBhHoIvXHr8kVx0WJ/QHEZ56suggQ9niPu/6?=
 =?us-ascii?Q?uswIInB8sUJ7nBlaZM/tQYHIFZhdyJnW39nZ6A9011XKv5yRHAFrZgqJA5W1?=
 =?us-ascii?Q?9/GrbfhclMFyICwNMvjFN9QwfIO9SU7olji807DpEM2uTEwsbZp6whTbKulk?=
 =?us-ascii?Q?Y2dZcIdUSpVcR676igE5VYSx1A64hfKlqlKCuubc63wkM5acBW4eipYTyIPd?=
 =?us-ascii?Q?wTHppb+/LwFcQBaYCW6ec1ToHnQ5bnOhknEhZtyb?=
X-OriginatorOrg: kerlink.fr
X-MS-Exchange-CrossTenant-Network-Message-Id: 7714b756-2867-42bb-1155-08db92643d91
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2513.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 07:52:23.2233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e53a72e6-936b-4019-8ac1-596e63242dec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MUDWk8mAH9hP9hEiBp6i2B+abScvJ8wrfWaw8YA2QHtj9P/NI4lBRSsT5XCrZpZh/yOjgxpA35RY9apm6Vcxag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5650
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 10:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185230

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


