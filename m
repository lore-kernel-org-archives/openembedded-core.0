Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.49])
 by mx.groups.io with SMTP id smtpd.web10.10253.1619716549593670723
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 10:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=W5liaH9I;
 spf=pass (domain: windriver.com, ip: 40.107.100.49, mailfrom: stefan.ghinea@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPykk3blYloJpAAHxlQ5q/RtRBgo1ICGGV6DxfhFtv4rt+tG8tfwXrxcX3sl1mWZvjn+w3AwcN7izUXBT3Cu8w/ngcZJCRml2eLmziYlpZLL0BkiIzFpsh8NnTSmRVyxw/cqUNDHPtXESKuwjFqQTQmLJdr3pz4ZzDiSzBCr9j/zFsXrOZ3IWRk6ijWqeA+v4H7tuy8gHCS6cyKvXKorHxUjXR/ZSgPQSEVmQ31bfXhUeZl/Drlo3jvugulNz5HTVYB/ov0nny8RsLbqNJGlEvNRPhJEZtL9SDMFKN7IUrQ6//x8aBIDKgHIzp5jzUDDEesmjiujswcOIiAFLgaSIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7j0Y+zL8/phIZLGIemjSPn4GelESBj212Wcw+qgkjc=;
 b=GGV24Jugay2RyFfGwSCBbTCu4Nbn5nVF9XVeZuc5qw9bG9A26afBEu5eZnR8JwLaS49uEYzkzs0nHbwGMXS3gaDrdrFUZsQ2heyClTULBhry5vdlwq/Dt7aQOP5t9Cvda+QQ4+eTQY+QbPbl50Ur2Mlb/n4cGJCzILvZxQjY8g8ZZGOHBtmoJwlW65ABx70noDT5mL+bdQkeIdS0dOkjQCRf6Dgu7YQ0ktP65WANAJw3XId2MzpfQ7lndGw5sPRIHwkQ1dbEzRbjrX6D1ljwUHVo4DCHii8n8sw3h/GtrQyHXPiCmI3o3DGV4bu6amydgAzfu3p8dN2f03bQkNmzfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7j0Y+zL8/phIZLGIemjSPn4GelESBj212Wcw+qgkjc=;
 b=W5liaH9IPVtoc2gheyYA8U7s3IWCzVAeBQr3mHFDEwS3AguTVHe88oMM2LswA2MP05iAZW1awVCCtMiP9rPON4vu6iOo626vMvjZTXqAYJXUIv8i7idOChmPgh+FpleEDjPHHrnbm0VRgSVyYhoDMcFhxWeGeZEDX13E9JQnF3Q=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 by BYAPR11MB2774.namprd11.prod.outlook.com (2603:10b6:a02:c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Thu, 29 Apr
 2021 17:15:47 +0000
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::7037:7346:6da2:e8cb]) by SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::7037:7346:6da2:e8cb%7]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 17:15:47 +0000
From: "Stefan Ghinea" <stefan.ghinea@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] [oe-core] xserver-xorg: fix CVE-2021-3472
Date: Thu, 29 Apr 2021 20:15:33 +0300
Message-Id: <20210429171533.29660-1-stefan.ghinea@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.137.231.29]
X-ClientProxiedBy: VI1PR02CA0074.eurprd02.prod.outlook.com
 (2603:10a6:802:14::45) To SJ0PR11MB4989.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::22)
Return-Path: stefan.ghinea@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (89.137.231.29) by VI1PR02CA0074.eurprd02.prod.outlook.com (2603:10a6:802:14::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.31 via Frontend Transport; Thu, 29 Apr 2021 17:15:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46cc9cff-b619-464a-0d0c-08d90b326dbf
X-MS-TrafficTypeDiagnostic: BYAPR11MB2774:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2774D70490CA1973831780C8F25F9@BYAPR11MB2774.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sFAcyrjlwRb3Mezma3PP2nlPSj4gexChRj62pEusjmc1eA9zt43osT8mlkRJEcvJtJGrFj+6az8HYxK3T48xEAynEV6JnM9v9stq3KJlLDH1EVqJBami0udiLn+U+9rBxdq/yFpIyFDkXu3W2P23FbzLFhET7S9hC96IbKbMzmTXvDHvw6671BJL9tVwzvg24em4LieOb6fWg25vrFYDb50qCSsOhmGQ5dEX6ed1jDPf6/1dt+uNvE/b7lCztFa1QesOUuiCBsoo2DGsThp5fmp7BdIlhjyik3sCsJos8nBTjW4zB7CM3luV7c5DGijtnvdNiwjPf/1JvvtJwYjxhdlUuuo7qPRf2q2Q4w1FlCWVLZGRdh+a7Bj4EuMpYcwUcFVjCrJdAdYC9N/NQNwl2PtD65cUljsZGxcMTeBXCY5cpI9L2wdOBMA7aSPPDbvPTAPA6rFDdiwTESPSqk+QD9y92WWQPTE9fYqsJap2F9MpMeXxUVf1Wj/Trsiz17ecFcPew/6pOrmMh0pibKxsyYejDzsfG2d9ZNi4aKzz1+C8lR2yd8ZDf4L78JQzA783pnI+GxO0vmuImxZ9Grkc5/c3b3lMdR09ASBOrEE0/iE1K9LUAU16mjhVvKAm9uyXvx+l+FODB2ccvR/C1vjBPp6eVB5Z1IO3AlCKaTsyAdTnwGs6H6eClseXUjgXyQYFNIi9PNDKbFw/KsBRYcifPb5bhrKJ7w3q30E5zqt30rbKuzu8/mfqWUYSgBhxBJ8G
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4989.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(366004)(136003)(39840400004)(8936002)(956004)(478600001)(2906002)(38100700002)(6666004)(38350700002)(52116002)(6512007)(316002)(966005)(83380400001)(2616005)(36756003)(6506007)(6486002)(1076003)(66946007)(44832011)(8676002)(86362001)(16526019)(26005)(186003)(6916009)(5660300002)(66556008)(66476007)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?DOOu2H/FMcwj01xPuQxsdnHx+lBufPlobPsPAE2/1xnEva+8IyhJjJZirUHJ?=
 =?us-ascii?Q?Xxy7qydzQs1EJ0x8iB+xOVfukyVJL6PpvWwOLW4bI1Hm5bp4SGXQISG1g28+?=
 =?us-ascii?Q?n0BdmTfN9zlXJx/KG5OxtZ3lG9+Xla5xawP4QOUZ6DLhE5Ys1Qd+VmLJ8bnR?=
 =?us-ascii?Q?PJBNOV7H+mrswoaC8FhtVAXhG8G2KuKZShpEGwiHg/x5aBcH5IE8sdSq+L9B?=
 =?us-ascii?Q?RvawDLG9as023IgqGRaNHZDdXPPj6RNTUUdBgaxPxxQf6NcqB5qoEscRK4Uu?=
 =?us-ascii?Q?BBNWqMJn5ywgsUMQcAk02aRmhSBsEY3CM5pToNvp/RYpRVhvuyqAwU59nMxX?=
 =?us-ascii?Q?msdzkatDwhqNg9oojSSRFl8GQ9RiFYkMwh/Dn93/A63/flaL1qfkQuAgtf+w?=
 =?us-ascii?Q?NBRGS+Z3tjLxxJ5dVQhBjN9C+I6XvfgDr+bLWLBFeWCj9KV72tHG9UDIEhFG?=
 =?us-ascii?Q?NktQQZr1Ljlq3vwARLB8qo8gat+DZ8FRzDiLmvnzHyopVkiDzn5APET0OPXE?=
 =?us-ascii?Q?YdUf/lOElqNz/PXXauEQleNOGj2iUO2+vy5fKu758OeHx5Z9TnvQ8+ZKOqpW?=
 =?us-ascii?Q?0PJrf4jIbH7mGZeC+d1BWQFcJoLTQbIkv2gYg5sv4RwcpX6mp7S9EdkqfOPq?=
 =?us-ascii?Q?TUovSBP+r9f1pIORG0PTYagpwFmwELXggWvFLARMSJ2Y40yI2lj3nZelDs88?=
 =?us-ascii?Q?F6OFUnJ1qUsd1nmvZTVxxvM3sLjwuw7URXeC2AwNkvwSjaVObw2aOlNEUBWW?=
 =?us-ascii?Q?Gf/0mPZG5LnrMSFJtxdbBwrh9FD90Rg/O2AIlsKlmyvzl/uglMMXIFwUaehD?=
 =?us-ascii?Q?11K9/ptIZwTRuNl28uF8r1wlElKfGw2DT4KPMAgTfjCh9KFdPa/KCwdn1f9S?=
 =?us-ascii?Q?bBqCDkgWmWqEaJ3DdTgNItH6OxmWuns8AkvYgnZcR7qJO0dlxshqrZY6pXgD?=
 =?us-ascii?Q?i1lXZHKO5Z6Zow5otJhZs0ufHYDz9RBKfMCcNkDkj79/SdaZSZ4wInB8y1fO?=
 =?us-ascii?Q?7Dr8BNmWUVsv6/UXRFnhRyQOXiF5z6x/TK4242+vqgzzdSYyyplxe9myScjp?=
 =?us-ascii?Q?zZ22SCzGG5HSSkFZXdItKFXu7wF8HRHSgBjUMkxfD2hPvWZhWqVuoV+OdECI?=
 =?us-ascii?Q?rGYt89Ol798YkmSQUp/QuMCgMmYnUmDT13LM0klQqS+O02slu1g9YjViNYS4?=
 =?us-ascii?Q?yjloTNHpuKEjJJJcN+uf+Qediqlgq20cWYn+rGbwjw6hMagJkZFaRPrCq5GD?=
 =?us-ascii?Q?zDYO1m7QsiXmcw3eH5zv0sFJ+IpOVNM5OhaQEo98iy9oeClcWYMWB601PSkZ?=
 =?us-ascii?Q?mZLDZRIcJ7C9zeY4wJeKBb/3?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46cc9cff-b619-464a-0d0c-08d90b326dbf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4989.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 17:15:46.9493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j2E18cX//M0w+UpOEsqZghIKV5X+6PlV0avuhqPMLpy7wjgKg3UDREnlTgfM5CxlG4XXVSe012zFGeM999s/yk2qCfvJdsLFlCJRt9hm63M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2774
Content-Type: text/plain

Insufficient checks on the lengths of the XInput extension
ChangeFeedbackControl request can lead to out of bounds memory accesses
in the X server.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-3472

Upstream patches:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/7aaf54a1884f71dc363f0b884e57bcb67407a6cd

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
---
 .../xserver-xorg/CVE-2021-3472.patch          | 43 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.10.bb      |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-3472.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-3472.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-3472.patch
new file mode 100644
index 0000000000..5480f71871
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-3472.patch
@@ -0,0 +1,43 @@
+From 7aaf54a1884f71dc363f0b884e57bcb67407a6cd Mon Sep 17 00:00:00 2001
+From: Matthieu Herrb <matthieu@herrb.eu>
+Date: Sun, 21 Mar 2021 18:38:57 +0100
+Subject: [PATCH] Fix XChangeFeedbackControl() request underflow
+
+CVE-2021-3472 / ZDI-CAN-1259
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
+
+Upstream-Status: Backport
+CVE: CVE-2021-3472
+
+Reference to upstream patch:
+[https://gitlab.freedesktop.org/xorg/xserver/-/commit/7aaf54a1884f71dc363f0b884e57bcb67407a6cd]
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ Xi/chgfctl.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/Xi/chgfctl.c b/Xi/chgfctl.c
+index 1de4da9..7a597e4 100644
+--- a/Xi/chgfctl.c
++++ b/Xi/chgfctl.c
+@@ -464,8 +464,11 @@ ProcXChangeFeedbackControl(ClientPtr client)
+         break;
+     case StringFeedbackClass:
+     {
+-        xStringFeedbackCtl *f = ((xStringFeedbackCtl *) &stuff[1]);
++        xStringFeedbackCtl *f;
+ 
++        REQUEST_AT_LEAST_EXTRA_SIZE(xChangeFeedbackControlReq,
++                                    sizeof(xStringFeedbackCtl));
++        f = ((xStringFeedbackCtl *) &stuff[1]);
+         if (client->swapped) {
+             if (len < bytes_to_int32(sizeof(xStringFeedbackCtl)))
+                 return BadLength;
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
index 5c6dbac4d7..755a762a73 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            file://0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch \
+           file://CVE-2021-3472.patch \
            "
 SRC_URI[sha256sum] = "977420c082450dc808de301ef56af4856d653eea71519a973c3490a780cb7c99"
 
-- 
2.17.1

