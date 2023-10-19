Return-Path: <eero.aaltonen@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00010CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 11:12:59 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.75])
 by mx.groups.io with SMTP id smtpd.web11.24707.1697713973515865888
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 04:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=R+NrKGMs;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.21.75, mailfrom: eero.aaltonen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cns8G/FhqQ6jsqa2VxRSo77xTdg/kpHweQwkT3fvnVYTOBv2Y9hYSpCF3p82imjvF4K0TODqFgmcoPShZGtlsaXMylLOZmlJuMjm2O6JDvJrfPbB+XZwnNxlYq7zVLoe6AfuxWR4B5OeInMaLqgtAgqRngv3xpWWx6ACBH2ZOFmdpwMekurGo31qwWh2/B+pafljSNB3/UBBtYvgLGiXr2Se7y8jBv/9s0Rf9yPfKwv+urTtxJ3OH8bhna0LlyAwtOevfOckRPyjJlnP+u2VSysbRlR01iMjnzTxtNY15pSHQihkVyhrzCTH8Gry0jDU64sYl40SARXGR1y0DEMc+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5auoWs7UKDWPAYOuXNkn7DRpCu+wYkvkaqrw3QsaMo=;
 b=bco5Ovgk1wWTuvvzxrYbHCqI5iOZlpXiGlyqf7MIcT1lxyF8UDuc0SnzHU45suvuHCUcnINDibdBpI4oC1Ark8ui7cu51vvBnXaco96tEWXiw1BankkFGkbhijvUTPjQgsnL+TZL6425nbUgfXtNwfpflRjP1im/8+QG1LUIuv3+vvGJD5Cn+5QXiyhv3Xr30gDqsMrjGIHGRXXp1guekraMN6sYXQ7iBN09jY7rGow9jcUYgLKsSz8MiYEoHiagJe35XlTSZfuDQQamzLdByxHCCyXxOr6YwE3C32k8IjbJixkXD23GzyY3w6a+7RyjMPezUExWns20xnf3dwQqig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5auoWs7UKDWPAYOuXNkn7DRpCu+wYkvkaqrw3QsaMo=;
 b=R+NrKGMsq5GSKG47/7OTt1dmpPYAUXbO4rYaDj/LfSoMqCjrEtw0yS6cALpOo/DhQ+hyYgVdAcu8ezBO8HjyOY+zd85baP6siWlQ6c7VACrSU15E0hrllm5fNoCB794XgmSNj+J6mNLDCPTd1NPLOLp6Gr7HqzfHObuMQWP4weXpoOYIjuTECmvigKPrgX/qpQBIce6f9JDNMJW+4LA9UrmpFYQgAH/xoHme1lpW6oMOqOgeUWkioJlNmNTU2mdTD+TwRm6HYbuImHI2hPXJvg3+WUexYlOLUGPA5cOsPcLaHQ70nfK56kd8e9VN8OZKZvxkSXEQfrcW8fm3/ErMJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS1PR06MB8515.eurprd06.prod.outlook.com (2603:10a6:20b:4dd::22)
 by PR3PR06MB6636.eurprd06.prod.outlook.com (2603:10a6:102:69::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Thu, 19 Oct
 2023 11:12:50 +0000
Received: from AS1PR06MB8515.eurprd06.prod.outlook.com
 ([fe80::e32:a91b:d0c6:e877]) by AS1PR06MB8515.eurprd06.prod.outlook.com
 ([fe80::e32:a91b:d0c6:e877%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 11:12:50 +0000
From: eero.aaltonen@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: Eero Aaltonen <eero.aaltonen@vaisala.com>
Subject: [OE-core][PATCH 1/2] base-files, systemd: add nss-resolve plugin
Date: Thu, 19 Oct 2023 14:11:51 +0300
Message-ID: <20231019111152.23880-2-eero.aaltonen@vaisala.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231019111152.23880-1-eero.aaltonen@vaisala.com>
References: <20231019111152.23880-1-eero.aaltonen@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0091.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::25) To AS1PR06MB8515.eurprd06.prod.outlook.com
 (2603:10a6:20b:4dd::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR06MB8515:EE_|PR3PR06MB6636:EE_
X-MS-Office365-Filtering-Correlation-Id: e6696607-abdf-4f5d-f78d-08dbd0945505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YHZePeqM+pfTDaCDA5tfOHcqbggIUUg7QifI0Ys6zh96eMwDyeOPUwPesBjk1iw18niDmznunDLJv3zCRSBz4lmDV0yoMZvcm1OsQZDwRbM2sghDrmJ+brrli/O0eyom7xb1/xK2++Gdq3mQjpkw6unsbZr/lYNuPNT2pa+KStYoIAaAh6qUFWQfgW55dE9B9exrHkgHacLJM1KZrK4qXSybsH3PXaTYO4rN0ejbPpsdBR97WMhfdnCfujaHbTrxPExerf7gxBMyIVnGb3OTCChMDKxQYXjj9yha2M7gp0hpj4PcJnrtjs7Uu/usTa+rJgGVWZ2x8gCiWK6l//CDWA3gXeoawyykWUaE1Pc38NAJtBcjB6FYggaIvnJzPeRD2H5mPjN35N5kcxahD3LaulLfPvTJcN51K1pM7RMwk+7Sd8HlMNoW1W9RtnsuA3KopmkawkPrfk8DlOlnk3G+CwjTw+AnHXouLvHANk4Mzg9qFGhjz8YW+mVoATou+Stp354DsoC7/4ksLGuaDeIb1EuNoKPeGf5O33z7mDDjzfH4FpaMHYgEv3mA8+/UsU1kTGWcnBnv3/9o7eG8tg+kawt7J3c1x+92j43m7DKLgckdhxLHD+mdgUv8RK/v/KoM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR06MB8515.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(66556008)(66476007)(6916009)(66946007)(316002)(6486002)(2906002)(478600001)(36756003)(8936002)(86362001)(5660300002)(4326008)(8676002)(41300700001)(1076003)(83380400001)(38100700002)(107886003)(2616005)(26005)(52116002)(6506007)(9686003)(38350700005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Edzz8GRG6lKVRUQUuzLif7OOWXdUBO4Q4tivdNzzTHe5wON3ZTrt4cp/x4G0?=
 =?us-ascii?Q?ouUlgbak8Z3CfG/rtgLQEHXbVzxX4zwZPXKEs0G0JdopLjQaXVdsJRbStYZj?=
 =?us-ascii?Q?zN0Se64+LDLO4mp4Caf8OVQGYJ56kTwZjUUT0afweKGZy5um79iHoQlfeUrT?=
 =?us-ascii?Q?qMrusERhNjV8MH25sTTizKJGQwk0MXzOahrNafLYIgJKsCLVfZkS0MBH1MU5?=
 =?us-ascii?Q?LK5ucLMc2J0YcUYIa7gVQal4gsjn7FIJjkAO+IvxCS0o9EO/qx2z7xtDCaL3?=
 =?us-ascii?Q?kaaxZatw76qdfTfoj/jZmwSDu/c6tcHyuKjPRmeU2e5Uk2rbKNxZ/gmjartL?=
 =?us-ascii?Q?U6orV/GX/qBMM5ukGudYRGqSJFnwyHWZFQpbPmtoNSGNDdP0pQXC+pa/tU4J?=
 =?us-ascii?Q?fK1Q6zhsOh2Jv3acJG5TEJZlk86IYyQkI24jqVwiaMsBWDeCtOv8KlYZ6I2m?=
 =?us-ascii?Q?+hWKgrky2xunVrNooSnulJF0IN7kqeWjESxt7rS22SCWsaqfiVmY56qYDZGe?=
 =?us-ascii?Q?uDdANTvvHlyZYlF20qrNa9mn9YXfwrcKf6nGetGLD/4LK5p6Hk7EKyzvPf5k?=
 =?us-ascii?Q?0sWJcGEpXlNZveaRXsxFOgrulZTCVX1svXlOhdWXT+DkW0hERm6XXEw5s+Mc?=
 =?us-ascii?Q?PR3J6X8ocgMK7rX7+L2wXpiXJ3XdM97MG0rze1AQpL63oJuGWJszUuH9tKL8?=
 =?us-ascii?Q?HlDEzbcsLXz2kcJgmv0bowRZky4i8Hms8jVe3yW3PERGROAkPgXhUbVr3Nip?=
 =?us-ascii?Q?1Ud4Af7bz6gCG3CmHEcj8sYANRWHTe5HZI3QvBy6mqS2DjpIS0A8/fnM3xLy?=
 =?us-ascii?Q?/xxphxehnmnWd+X7NZJLJtsqn63WpaWF0JM9ZwkDLnjYC1MJVXEgqtkwDAh2?=
 =?us-ascii?Q?geR1a18rMjC5Xks3e+Z9W3kmczuH+uR2g4k2Fnl7iDb76tl8T+XlE4ANKXA5?=
 =?us-ascii?Q?De8gzZphzK20l0lh+ZDcSImYgolbNJhqOCS9dVyxUXJJFER5L06ML63X5N6x?=
 =?us-ascii?Q?S0EfwZpQuMrJlUFfG/4+bDzGCDhRyX02qqI7hP1/KAnKSBY4je7cPGNX+pDl?=
 =?us-ascii?Q?wWtfgub8byVVFLrk/K/VTADr5DJcm8PpOcIG7juzGaevKKAmcNI0ZaEyGZbn?=
 =?us-ascii?Q?TDo8EmODoM3kW/3OrYe1ivk5qQF3ST+XVfGhIKpcHT3p3wyFefn35ifmusAl?=
 =?us-ascii?Q?X7xE7AsHvmr5gecnxQc12pppZq6l4AS+044tAOLVmUeBQX8oHPmzecBzrgrJ?=
 =?us-ascii?Q?2u2HobWGm6wOfWvs/mnwJMRhBLyXC37x54yp98WMU+4WxlmXGQgvaPDXQmjW?=
 =?us-ascii?Q?n55x+j1057wlYB6k6nX0golY3BwU4nQAX7MoO5/MB04H7MSQSV1VJAs6xT8v?=
 =?us-ascii?Q?r20UwtcUDAIzebr1hLBJ1YfBIuoOoBXF4QBmTxjljdlUrC7u36D+yiYDDlho?=
 =?us-ascii?Q?vEiDUu/A8n58Ul2wYZEKOi/gp3kTas4w8W2CpM9I08wjkED1OgQzkx6/gfI/?=
 =?us-ascii?Q?0gG17V8Kc1SJ1vkDPu4tUUExK3qledf9t9Mm7R16j+KWgxcxI9SMbVzdV97t?=
 =?us-ascii?Q?QmNn5Okdi6R/86NosoavGtLHsla+JELcjGH/C6ntMOSAf6PDZerJl9AAIYJH?=
 =?us-ascii?Q?Nw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6696607-abdf-4f5d-f78d-08dbd0945505
X-MS-Exchange-CrossTenant-AuthSource: AS1PR06MB8515.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 11:12:50.4354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQ9dV1cI3j8/OCQcEETugJI65pVwOrG3irKw56hNAds4EeR9m+cOHaACa3LMMJj4xcGPwpJuStLlibZppRzeLdtXgtZ1I+yvUp9fOf3uVfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB6636
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 11:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189445

From: Eero Aaltonen <eero.aaltonen@vaisala.com>

Add nss-resolve plugin to the glibc Name Service Switch (NSS) with
systemd-resolved DISTRO_FEATURE so that systemd-resolved is used in DNS
name resolution.

This enables the resolution of Multicast DNS and Link-Local Multicast
Name Resolution names, depending on the selected options.

Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
---
 .../0001-add-nss-resolve-to-nsswitch.patch    | 31 +++++++++++++++++++
 .../base-files/base-files_3.0.14.bb           |  2 ++
 meta/recipes-core/systemd/systemd_254.bb      |  3 ++
 3 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/base-files/base-files/0001-add-nss-re=
solve-to-nsswitch.patch

diff --git a/meta/recipes-core/base-files/base-files/0001-add-nss-resolve-t=
o-nsswitch.patch b/meta/recipes-core/base-files/base-files/0001-add-nss-res=
olve-to-nsswitch.patch
new file mode 100644
index 0000000000..a6e39e0956
--- /dev/null
+++ b/meta/recipes-core/base-files/base-files/0001-add-nss-resolve-to-nsswi=
tch.patch
@@ -0,0 +1,31 @@
+From 830abe652428d9d31780c3ace121635ad7b64274 Mon Sep 17 00:00:00 2001
+From: Eero Aaltonen <eero.aaltonen@vaisala.com>
+Date: Wed Sep 27 15:50:48 2023 +0300
+Subject: [PATCH] Add nss-resolve to the Name Service Switch (NSS)
+
+Add `nss-resolve` so that `systemd-resolved` is used for name
+resolution with glibc `gethostbyname` calls.
+
+Upstream-Status: Inappropriate [no upstream, configuration].
+
+Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
+---
+ nsswitch.conf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nsswitch.conf b/nsswitch.conf
+index 06f03d2..34b165c 100644
+--- a/nsswitch.conf
++++ b/nsswitch.conf
+@@ -8,7 +8,7 @@ passwd:         compat
+ group:          compat
+ shadow:         compat
+=20
+-hosts:          files dns
++hosts:          resolve [!UNAVAIL=3Dreturn] files dns
+ networks:       files
+=20
+ protocols:      db files
+--=20
+2.25.1
+
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recip=
es-core/base-files/base-files_3.0.14.bb
index 6ba3971e32..6890fe114d 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -23,6 +23,8 @@ SRC_URI =3D "file://rotation \
            file://share/dot.profile \
            file://licenses/GPL-2 \
            "
+SRC_URI:append:libc-glibc =3D "${@bb.utils.contains('DISTRO_FEATURES', 'sy=
stemd systemd-resolved', ' file://0001-add-nss-resolve-to-nsswitch.patch', =
'', d)}"
+
 S =3D "${WORKDIR}"
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
diff --git a/meta/recipes-core/systemd/systemd_254.bb b/meta/recipes-core/s=
ystemd/systemd_254.bb
index 8d5cf13095..e0ee2da412 100644
--- a/meta/recipes-core/systemd/systemd_254.bb
+++ b/meta/recipes-core/systemd/systemd_254.bb
@@ -789,6 +789,9 @@ python __anonymous() {
     if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d=
):
         d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
=20
+    if bb.utils.contains('DISTRO_FEATURES', 'systemd-resolved', True, Fals=
e, d) and not bb.utils.contains('PACKAGECONFIG', 'nss-resolve resolved', Tr=
ue, False, d):
+        bb.error("DISTRO_FEATURES[systemd-resolved] requires PACKAGECONFIG=
[nss-resolve, resolved]")
+
     if bb.utils.contains('PACKAGECONFIG', 'repart', True, False, d) and no=
t bb.utils.contains('PACKAGECONFIG', 'openssl', True, False, d):
         bb.error("PACKAGECONFIG[repart] requires PACKAGECONFIG[openssl]")
=20
--=20
2.25.1


