Return-Path: <emkan@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A02C6FA8F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 13:41:26 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.134])
 by mx.groups.io with SMTP id smtpd.web11.10994.1692884476446218037
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 06:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=IPTK298c;
 spf=pass (domain: prevas.dk, ip: 40.107.7.134, mailfrom: emil.andersen@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvAU7vdzMhWMONwFRrhwyWeZEMLqw7IaF/V9Gv7D1g5miCHhxE6jvCCaAQkfPxsCgvs0LMP3Z467oNhIttwbfkbeqDkNeno4gdCWUPR1mycTOhcJ47xNYiIllHCKapWHW4DdAob3LRztckiVeiEf0NIVGk7Dcdp5sahPPH1C4et18mQuuhKCtoxob95LipiykxzlYJyUZsC2yobpj4L8FeKBDBT5arLuNRUh4beDmpMZHvwlm1vr/XhDQad1TUZuVmV00c/ffesUhWKpgNzNZ7UDFiRGX1s3KVdzYzChWAeNBfeu8WWEuZOyeAlPbdgDQ0XEMJ0CPH9IL/yr+BnmMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkav5xQWoiuSqZvDUBesofIDiAzdDdIaIqi/UsR1rJo=;
 b=WWbctBh/TPXYuMk4eIvYziVneeY+Mr/LDnarOSjkqRxitkIJPigblkNa9c8InJwn/eDLgaQ5yy2KC4scJK8GmDF7gCbFZLa2DXNFLug4myzL0l5ZOYG+uXDMuejEz300EngmeOpyKV2JGuOFNkB++grgMJeGkZvTxsoIm5d9TtLOdFYNG8kNLBZB3V2PdA8aWhHFTGaIXaZ/8shqOmw5khlSsNUhkyAgIddELIM6CJpNyZBt0d2rm+v41dOCuzesoEZbWhvi8r2MiAXvqCA7E+bEY2B2eaPVsIkIVqd8ow2EK7uGt/7V0yTSXt/SQkYLIRlJ0lkMLK/r6yphoXzJ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkav5xQWoiuSqZvDUBesofIDiAzdDdIaIqi/UsR1rJo=;
 b=IPTK298cs6LYGx9XgbSwVRpCHro/7SlvmYiueHIBMiVTas/ajnJ4KLVALYAFLymFSWopKOkYvhP6IOx0ui7gXjTBtlk+Y9JWYJfp78jMkZgPCcLUSGvkyiT4iPADX9z7YTA3USho3NZNdfKncqA2voOTFFzX0GkIKrEldpiaUMs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1fe::24)
 by GV2PR10MB7534.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Thu, 24 Aug
 2023 13:41:12 +0000
Received: from DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3887:6849:a8a9:72f6]) by DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3887:6849:a8a9:72f6%7]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 13:41:12 +0000
From: Emil Kronborg Andersen <emkan@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Emil Kronborg Andersen <emkan@prevas.dk>
Subject: [PATCH 1/3] dbus: add additional entries to CVE_PRODUCT
Date: Thu, 24 Aug 2023 15:40:59 +0200
Message-ID: <20230824134101.41906-2-emkan@prevas.dk>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824134101.41906-1-emkan@prevas.dk>
References: <20230824134101.41906-1-emkan@prevas.dk>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0049.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::10) To DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:1fe::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB4571:EE_|GV2PR10MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 48452590-9be9-4623-d399-08dba4a7c7ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NHdcylm/QLT/gJnfVi645Ich1yKL/lcdJeDi9ag/qNTIBgM9ZrBxblsriD3pYXQhjvsvdg8knvcJh7wrQdrZcyEzCZHcIieITievaB2ykhDdaF1N3wbP3ybrlVD750EjdzPkSUfUCj6gpJhiMp/SVYjHsLBY6hKL62Yl/TQISdjBKhAAFkKVTFK4eD7omzXLYbC6wi6EVRIae0KpjlPQyrr6MVlJgNayZt0OzmuStunwq5DQ2Vg0wGoQJU3H7IzIQyAM9EuyoUXPxxbMGbIq3VVtbiaM3DSdk7KgW2dxugX6BkscZ2t5B4XdLphFvnzeoeP/4b0cKubaHOViU+evGRsZwx05OrsXC3K/vTfSilAWwqoYpb6pHah5W/L8BmJrvT2XQGHZCZVbOXdFwZbRO7gk6gPZZI608UZIbYxjGi9Fmc3lqE6x6J0ajACKh+QJfQ+naT/ZEKSOetf3Lj2i9DHSh8BNergJegCOT/rK0WxdMQOIy0bqiUFUCo26qd3tYo6M4c3tkiHdo+p8Ue+ZuQ6zgXTGz3nxaS7irmNXzJlo6rj4IPrW5B2/qWSL2itCmHfTi0ZyO5qVU5K9Z23W9y3t9B4PK6oD/iQGu/tdC228VHiBIQdNJ3yKjDkLir/I
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(39850400004)(346002)(136003)(186009)(1800799009)(451199024)(36756003)(83380400001)(52116002)(66556008)(41300700001)(66476007)(38350700002)(6916009)(478600001)(38100700002)(66946007)(316002)(6512007)(6666004)(26005)(107886003)(8976002)(6506007)(1076003)(4744005)(4326008)(8676002)(6486002)(2906002)(5660300002)(2616005)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?k7K5/2vpySBCgTPoQLRuT1Fvp3rSMrfQqyPeOVnzpCi+1btDq3iZZJ68LshI?=
 =?us-ascii?Q?jnH7QSyEl8rGjClM9Qab7gtpNEqV+Peuxnkbnd+2Q3Dje0uzjv3VvRmwn357?=
 =?us-ascii?Q?gl9LaG9SNe7plINq0Y3K85XbHkf5xsSlVsSMc6Y9gdbZoZEqfTWqDJpE3Jyc?=
 =?us-ascii?Q?XcheR1DudefpLsUdIpm76PTLsHmG7uCnmU/SAwgjauOdwOL0dJQgiDxKqmhH?=
 =?us-ascii?Q?ipIo0cFp9t24YopS9x+8roX4nzef6rcPKEuhHKhXqo+p/gHFh2FitTIxO5hr?=
 =?us-ascii?Q?barWREUuRumKD08AMnHHiOUjUUew01UOMUzeZ8HRnQBzknUk/R+BDBPZF/Bd?=
 =?us-ascii?Q?6XyeS45tMswSFZUJANPZAVbO0KRpBmxK2k15QV2RUXLk1YU1/xF5KCI5OOrc?=
 =?us-ascii?Q?H6GVZhysrTatzGF8aReV8dWPUWSZpHP66FO2RvMXXL1nfRE3xE3R8+W0RBG6?=
 =?us-ascii?Q?EL66ocbe1Xy1yO7UjnnGjItQcRGRJDsGq/HBhfb0IVdwLjyDnTbUQbBkfAiL?=
 =?us-ascii?Q?eYqIiXR5L3odkqtwc6CwclSuY5dSkiN1TXm8lMCBFHxo7xVb73K4+KTI2dGH?=
 =?us-ascii?Q?pN73l/KSrt/D74xPiR1P+WlBfUQnRhBtTgXHz2U9kYo4/ZFZSA3d56xeeQUH?=
 =?us-ascii?Q?CnBheFalUjB63St1fWyMEQLFPD6sREklevfFFcuecy1t9x5LmyxRpTpSmJIg?=
 =?us-ascii?Q?28ZxFD12hKJTxDWSpedmwCOVJw/AYkOqNRd44R1LgJEe3/LOmJJvp6v5uAfY?=
 =?us-ascii?Q?NSoN8pJlpW8zLH/trbBD4ju/bT7RLoTlI3D6EOul+yWYdzso5h51sc4atcwK?=
 =?us-ascii?Q?kJlma3z+7y1QD46C1qNRFDrkRFN7DVgIMVMZzyRdARBQZGHndDYAzzcp+B2V?=
 =?us-ascii?Q?k6vc9mxyDhNpmzGQQyZbH0xlZTJgblKlTCIClDDlvqNa9mE6KFHn9HEC2L1R?=
 =?us-ascii?Q?5Dm2EFHIm1IdMeqit9LivTcRF2qkT7320+YYxPlwBYiN5Hz1XSf+2PuP/7L8?=
 =?us-ascii?Q?t8XHombX2nj3Ksst9vFn0cM3uN9jWlxhJ1/kUp52lKBFfMEvT5H1GAuguOAR?=
 =?us-ascii?Q?mjFturqSvgaAdlfySviYn7ElwUeuMdxsQLr/EmR46hzoTE79XcBJvS+SQmrP?=
 =?us-ascii?Q?o85YNYGRDVj5E5H+Ek+3fYVXvZjwn85hkN1kKzsnCN6IpNQoUOzycPK9N8AF?=
 =?us-ascii?Q?KvGVOKCLxF0qsbFZQrBG3QEGRQHn18HUpWxAGKw0L+7ZlOxAUvhTPg9Ifsnm?=
 =?us-ascii?Q?5Otdncu8ezFgtSmx5u9IzceDdXdl/KxF7gXM4GxaedkUJG9gstMMQGxeezvi?=
 =?us-ascii?Q?emCNyAs3tUYiBOkYim2RMmZ/hMvHhc6b4KFRUns80ScD38fkjAI8uu8Fdo9F?=
 =?us-ascii?Q?2K6HcVbkhHmJaVqy37FyKeQD+WtBlHCVvPOo1fyLmukoEDhO9S0V5Gjba0YP?=
 =?us-ascii?Q?TUULf5pqiXHsxnIss1EVViMqbcdqQykgdgZl5PleND/AAdK1fT6FXsA0yNtA?=
 =?us-ascii?Q?T5liynPR9hojw37Ul36Tf42lYXH9XjDgBfsIl3xCejznTA8Gynodk/tWWPxQ?=
 =?us-ascii?Q?mGfdhVzakGId5+6gBZ+G7zJbFjzs+NrwpEmX8UMxKKLUT4HS8el8H186Wb4x?=
 =?us-ascii?Q?mQ=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 48452590-9be9-4623-d399-08dba4a7c7ba
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 13:41:12.2347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kjp/t/7unUSrXYpyI9QipQ1NiNFnOTXChqdDgxYpf2bsRxekNIcuBqAFoaQOkysmBM3bM6T96mZ9oDw0loLdUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7534
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 13:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186659

Signed-off-by: Emil Kronborg Andersen <emkan@prevas.dk>
---
 meta/recipes-core/dbus/dbus_1.14.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.14.8.bb b/meta/recipes-core/dbus=
/dbus_1.14.8.bb
index b6c245d40b..2dcbadd50b 100644
--- a/meta/recipes-core/dbus/dbus_1.14.8.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.8.bb
@@ -184,4 +184,4 @@ do_install:class-nativesdk() {
 }
 BBCLASSEXTEND =3D "native nativesdk"
=20
-CVE_PRODUCT +=3D "d-bus_project:d-bus"
+CVE_PRODUCT +=3D "d-bus_project:d-bus freedesktop:dbus freedesktop:libdbus=
"
--=20
2.41.0


