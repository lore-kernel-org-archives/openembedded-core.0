Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C89BD72345
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 07:38:46 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63309.1769153921863110072
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 23:38:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector1 header.b=Xy3bfOw6;
 spf=pass (domain: witekio.com, ip: 52.101.69.141, mailfrom: hsimeliere@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shsGpfPVrmwCIEVIQO00E1skP99TfsTcKOvvj/sDd7z8LqmLQWo7dJWSOLOG8s6AYgSWpowtJ0x+mVt6ASWU1HfoNbF9M3nQE4pwuSuP6WlMU96Ckm7NIpn8XPJHA3NIS4fpT4yodCq9ze5kmhUaTa1aK4BoWO0nQgESWqrwah10PAPdYJoCjEFx0C6keblrBzbyhVVv88BpFTq4eW2w2IcwCYT2m4M3zmAwQ5aDsvsc5Ql7a742IOXoeGGw/QEcnfpLaoibgXa/jAgOxdd86aOz/02R5aDdYKaPwc00hsVpUz3jL7WYsVRn9XWMRmVm8s91XS5Tyu01UdFQv4UUDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3n/mM+J5VKLWEYhnToEfJnNxpTRymZdD2cYsppS1fN8=;
 b=KIwj6AJlTn5OdqC7eeUlsuF7JxIa8ttci2o1gSlsuMb2JLiPzOltcznd6x5/T/NgYGclwGFixNphFSDGAjR0fufBLcsNrsoKwWRfIC5ghDl4izzYw76rAPP9K9ZUAT+Kuy/L69RLOQKBZuc/nemTatYbMjcizgg+Kw263nmY4SsbBjbwrA7RfYb38nbLP+NzSYxZEJtdWyB6SKUc/Y1pYpEssI+Ntk4D2Ivx5quFbtWYkniX/w3zlBZhyAmFkAU2iJv9aAnsH2WMFtRWbl4oe4Jq70wD/FQxJ6S8rnn2O3Reh3bEj320NTyfA41grVqzlcpvi0j3X5hh7HqEqZVggw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3n/mM+J5VKLWEYhnToEfJnNxpTRymZdD2cYsppS1fN8=;
 b=Xy3bfOw6RTgyoUoUAOaplZAmTbGctyiKJalZkuZyT3k13vV9wo9Xy04KA0xWEitoHUqz+t/PkYHs9JQ9EowP91GvokxTL7slXGCAMiykbn0IDw97ig/mZGuUVHDyA6R2UlFwjwcKTkyUaidn7uSnMOk1CyN6YMNnjpxmEFW/oknLH7WH5IBHyA51me/BQlixUksXtx0lkaasL/Bfxk4+DClagrQ06grDOHSIjiniYL+UPrYP1cSVKu9mpa9O8vWWVsujDC/fhecnJgifQ2Su9NsvT1zIPQ35hdZJPRxVsDnVEBZrN2239FjXkFRXeqe9UXJfcNlhUI+d2f/YgtCNHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 DU0P192MB1721.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:3bf::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Fri, 23 Jan 2026 07:38:38 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::7e78:af5f:27db:d020]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::7e78:af5f:27db:d020%4]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 07:38:38 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
CC: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][kirkstone][PATCH] libtasn1: Fix CVE-2025-13151
Date: Fri, 23 Jan 2026 08:38:30 +0100
Message-ID: <20260123073830.2352475-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0430.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::21) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|DU0P192MB1721:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d06f237-185f-456d-8a8a-08de5a526c52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|10070799003|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lc16LaUSKA6J6zyjxIMbk/AUy6pfa13hWcqAXPKyz4OcGtSM+R5x2/MRQZhX?=
 =?us-ascii?Q?fFRbzCVzDmlsAOKfBGqLly20WvfUTn4dbTJykt8IlYNhBgTtxzuHajGdWlgz?=
 =?us-ascii?Q?s9eKHr2MsM40zr2RAKLniiCgKMGeYBDkb0za/9PrTllHw7/44QcogpaRaqXZ?=
 =?us-ascii?Q?N1eBhA5LXvNQkdefq/hV0yWBndCPJTBvazHA/7ZL6WafPIrad4lbSY3KpdDr?=
 =?us-ascii?Q?wF0Rf89ZN/W+gOHtXWB/b031ZeuFKf2QB0LNTjWVQPvaaL6AOzvXBXr97WFD?=
 =?us-ascii?Q?hB5AAxAUNPb1NAhLmzCG6yrFh6+CC4mh4D/DYp8pYK2TnQobEUtrtH2wGoLR?=
 =?us-ascii?Q?QB28D0n2MQWTcKa7CCQ7PHc7kGkxbpH+uD5G2bQWb3sTp0L4PPrIJE5mAIyM?=
 =?us-ascii?Q?8fjI7GjUtlghMW8Comsd8s6mqAy+QWxT8TMdOgdHQCCjoZ3UQovNpdPNnFD0?=
 =?us-ascii?Q?rPH+roMk7h49g/oGg3DhpRzToZe2+8/gAUl77RXFxIvcP2MogSpO4HKhJvQC?=
 =?us-ascii?Q?qYTDLTqZw5OnWNtJPpQzUJ8OfjpKFAvDAgRtu7Ce6Cr4HfxUCTkDKTqj45m4?=
 =?us-ascii?Q?AUc2X2vMrb5rT3NqP8Lan29b5412pA6yDoSU3xVAfiP3wHKOZ2qXJ+MR/1C4?=
 =?us-ascii?Q?2PKxGa/homQ8ZPl9s3noSAlKib/D5WyMzPPs3dU9Nc+uyg7HEYITS++9B0d+?=
 =?us-ascii?Q?aBqVgSQISFHoT9K+rNDOG8h85OyygIcKZxB9Vji1VXeO/7NSWJUmTGrLBL5J?=
 =?us-ascii?Q?Xcsa90VmqRxY6d3t29HFEni762kfGr8THSI8KrRpX2AxZMT5vtOhRo9B+Gw9?=
 =?us-ascii?Q?84HACqrVQPzANCTPoOy/pkr7kKtp733HVlO3X9d9SQ3W5ViDoPyeDJlr8gV4?=
 =?us-ascii?Q?qdj3u7z1vrjbSy5+cvAPgN6jBPhQcBTuPVxsxiR8j4dQ4emIEcpB8kRN8LOz?=
 =?us-ascii?Q?mWiYlfGzyXBzzHJiPsVbpC/LMTwbEy/zs36ZrougU7+W9fJyRS621ec2Devx?=
 =?us-ascii?Q?BFB3CV5vYGami2CsbPRFbB4hCr4ZvA+RBEKz7y5aiI/YNYyC/B3yJdsw3Pk4?=
 =?us-ascii?Q?4m2Ar12MXGimonce0m1xYmKjYZbE4CvoQ0RKIKxigquqpSHsW2UlHpVY/QM2?=
 =?us-ascii?Q?0Kdcdk0nSK5bJR6n4L7OpIVYPSNmuJ/Incw19CxeBMKm7JHr0LFRacOKq/Tw?=
 =?us-ascii?Q?gJXKMm6b73EQdjHI46CrvgwqkTsJaDNxLDpCpAfw5C0mUPy8k/cDUFvvXoEV?=
 =?us-ascii?Q?NZjHypwUkwRiJ7yeu7cYE8JPn4k6ayf2ObcrFFuiHj4u5aU6xnZFLsX9l30m?=
 =?us-ascii?Q?MCTmStQ4eLH4osZOja9qj66w4+3Ipq5oZKewke2mRaWj2lyb95xNbNdE12uM?=
 =?us-ascii?Q?+oB2+Gxjm16SM8NvIKMKs2FX6AdV30OtLQvb6izE/Cc7iOR0dJpuBC+wy2hl?=
 =?us-ascii?Q?AaryGi8hpFiQnjrlniLKQk0DebBZfnqqHF0tHgdcP+Qv7xoDT5IKE3frBqYx?=
 =?us-ascii?Q?QDkXBdKhyj0Q2Vi4sl0Zcx8ePxGe4tA2xWO9IqOclXWh7d3GfknCwRzDVEgL?=
 =?us-ascii?Q?5B5qJ1jIcvTinjqCjI0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(10070799003)(1800799024)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rRXrUWHx2kiz0qxduHQNL2oFuRFtXvDByAHAeMePFUYphjXAj1ooT1YqJ/8m?=
 =?us-ascii?Q?iCnk2PhAVibVHK+p4Z5ojB5rQaXRWZiScM1YK3RCn5Bw7ISiRo7BX7FCY0P/?=
 =?us-ascii?Q?aGPCmuH1R1eprnmvl38oo3xW11rre8aDIqkyP1siq4TvEiZyWB8Mdy5LeU83?=
 =?us-ascii?Q?D6Bj55zcwwF5wFKx0EtPXFOpzpSC3hVe1wTKhV2qNN8pZCZVNUvfE/sJw8IW?=
 =?us-ascii?Q?Z/xK9It7PpSijoUS1ADZ5cZZ2FwVhRRvKA4zugCWaJpy6aTctrUlNEebkWXA?=
 =?us-ascii?Q?Z7xnhihV9QQAZJldKOYxaobe0yjEqmZuLmjvz5fos12NryzwCkui9BMkDn+a?=
 =?us-ascii?Q?81MyhNaHpZWzmLAy0NQm9VaVBS26g9GY2cc7g0Fep51FVvx385IujFHyjlr3?=
 =?us-ascii?Q?ReLH/yy9jx5aoiq78XiGbLuJNYX+Nqczo+kDyDC3cFtcnB6a3IkEHohuxj7Z?=
 =?us-ascii?Q?+7OgfJCtP7I4B/arwZVDUztjYbes/ttfnC5A1dlZiItT48UC4ZCG4Iy82lWg?=
 =?us-ascii?Q?3vBfGI7APx4U4qLaKYYt35a7LiK6ylJenbaauVxpzH631Dcq2ed1PJRxbjIM?=
 =?us-ascii?Q?jl08mP//WbmKiQeaMzGnB2zhyG+wf6WTlSvPn+tiGOWodF2E+/q9ZPSHqChz?=
 =?us-ascii?Q?Tn5NJwM1IEGrHsXJD4DWPYkQ+0GgqFQYY/rodn+gpNnJriu9IDf7tx1ZLXnu?=
 =?us-ascii?Q?RLZZf9mUZth7rWdVpemHMZJIAXg3D5OwpLaIZIoPkWUsNNsJbKDoiIuGgjlQ?=
 =?us-ascii?Q?g/LSzT/wY5bGSGgZUVTyKJnJLwTW96LoP8Uzuvd87U9QlTwXfeScofR6IEZL?=
 =?us-ascii?Q?0GXuBAPHxKzUaCF5d5z59LrcIMUZa2DG3c0Ebf32TYLNcQo8dHrShpUfPcJE?=
 =?us-ascii?Q?uRFdkYU4u/uBqvykVpSA/xjIruM/RGFE5B5lVUI9Brdlt+vTriySyZ6m3Uqr?=
 =?us-ascii?Q?bi/TPv3tSAD2IM6RSefnuA7V8bIskVoilCr/4qaHMC10PSopc8tEoZVGQuZy?=
 =?us-ascii?Q?1wWnxLWv0weg7seL2KVKQtX1EVu5NI89w4jqK/T7ADIXHmSQB8hpYHtToMLZ?=
 =?us-ascii?Q?avSi9oY44qjLPreX8s+8+5GYk2y9a1CkSHrHpyAWiZp6oj7AwFcF2sZbJMj7?=
 =?us-ascii?Q?RE/4/a9Gmv7oh4XfnIcDl7p47BpJW5gTiMAHG1eyzcB9QzqjpWVLLIxmj93q?=
 =?us-ascii?Q?Lprk8UrvHFQFXRJhbanr4UftaiSSqDn0oMVM/6n+TIY5UbuKYyEYIIf+zNA5?=
 =?us-ascii?Q?K/Xc5PCBMjjOHiINfutmTe6Y1xZWd1RE+E59bjp5Rp9bQ4xwQAo97MeRBEFB?=
 =?us-ascii?Q?rOmhUldY7TKgTj1FOYyk5o8josnxcrGWGbxu7MX5rIAwDmcJWR+gkBqLxWp7?=
 =?us-ascii?Q?ZBHf4oEh2JjsCctFKZdqjP9uhr7tiFR6fjh8CyvIk63P4Sk7YnW3hFINgxaC?=
 =?us-ascii?Q?Z3xpdsGJ981vHPVdGiQktfnjdxUwSk7FX4HJx0xLqYw1Fz1W5h1qg52M9SD2?=
 =?us-ascii?Q?TgOK8wVItxHZ3Z3WQVu13fL++2Nu60FB/lvlLJtEUg53OG0dzeo1CkGoAWhc?=
 =?us-ascii?Q?xIwSBfUd3ScA/6eOJo0NxVnujMkdKISfV7FgXKDEicYozQMlDyw3DKssW5tf?=
 =?us-ascii?Q?5P9ZMmsVdHKBK8Lq9fezOrksxj100XEN9x3Rud0oNL58eNy/qojrqCotIvn/?=
 =?us-ascii?Q?WYSBimI5D3ro2oVM7L9MJZyWbBOcDFImKpbUa+fqzvCn9S5gj6YAVy2mefRd?=
 =?us-ascii?Q?n3Ulgj4iI+szXG0ogv4o/T3e3Wrk3r8HauzaEzKwC+oxtAScqR118rXlG/aP?=
X-MS-Exchange-AntiSpam-MessageData-1: 6QziFzm4/Sl3evStt0cunoQ3Rh/rAJSD+YI=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d06f237-185f-456d-8a8a-08de5a526c52
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 07:38:38.5056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgbBChn3OZLtkJuNwqslD/vJrdpampJIgWKslTLP7F1QG6FhUBJvQ9nA2W7wkF8LIiKqpYOvlqNnw5oPZaOMrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P192MB1721
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 07:38:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229875

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Upstream-Status: Backport from https://gitlab.com/gnutls/libtasn1/-/commit/=
d276cc495a2a32b182c3c39851f1ba58f2d9f9b8

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../gnutls/libtasn1/CVE-2025-13151.patch      | 30 +++++++++++++++++++
 .../recipes-support/gnutls/libtasn1_4.20.0.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.pat=
ch

diff --git a/meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch b/me=
ta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch
new file mode 100644
index 0000000000..5047d67984
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch
@@ -0,0 +1,30 @@
+From ff7aa7ef2b9ba41df8f2d1e71b05bf2c2ad868dd Mon Sep 17 00:00:00 2001
+From: Vijay Sarvepalli <vssarvepalli@cert.org>
+Date: Mon, 22 Dec 2025 12:24:27 -0500
+Subject: [PATCH] Fix for CVE-2025-13151 Buffer overflow
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/libtasn1/-/commit/d27=
6cc495a2a32b182c3c39851f1ba58f2d9f9b8]
+CVE: CVE-2025-13151
+
+Signed-off-by: Simon Josefsson <simon@josefsson.org>
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ lib/decoding.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/decoding.c b/lib/decoding.c
+index 1e0fcb3..abcb49f 100644
+--- a/lib/decoding.c
++++ b/lib/decoding.c
+@@ -1983,7 +1983,7 @@ int
+ asn1_expand_octet_string (asn1_node_const definitions, asn1_node *element=
,
+ 			  const char *octetName, const char *objectName)
+ {
+-  char name[2 * ASN1_MAX_NAME_SIZE + 1], value[ASN1_MAX_NAME_SIZE];
++  char name[2 * ASN1_MAX_NAME_SIZE + 2], value[ASN1_MAX_NAME_SIZE];
+   int retCode =3D ASN1_SUCCESS, result;
+   int len, len2, len3;
+   asn1_node_const p2;
+--=20
+2.47.1
+
diff --git a/meta/recipes-support/gnutls/libtasn1_4.20.0.bb b/meta/recipes-=
support/gnutls/libtasn1_4.20.0.bb
index 8127ba5b1d..bfc011a2f1 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.20.0.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.20.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af=
26da5dc08a4e440464 \
=20
 SRC_URI =3D "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
+           file://CVE-2025-13151.patch \
            "
=20
 DEPENDS =3D "bison-native"
--=20
2.43.0


