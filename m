Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E0C5C982D0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 21:24:43 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.770.1789680281215144435
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 14:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Pt/sWiKe;
 spf=pass (domain: est.tech, ip: 52.101.83.63, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SOuCr1bv/TEcgEp16sqP5cUouw5kN42iQGLb/iS5P2g3GSSREnzJXaXCdSH3OjYP0sKyQ+/3zIFMjY7fFooKRzNKHwDmiIkIk+gyHCg9J4C+7mVvb2r6OS5vT5onC5fgqXdGGk99a629d3PuJbPm8YxWb46SRR6GmXJ4PBiGBIr7pKKpI3ow42bWgux3+DJ3wyCObL6A7iVC2HeRGlI0IYv5jB2D2qtWw4N32M3HnH1aLEf2V5AbVIXkVW3pJxJ+gDPdIE00gEX54zS5O1WmBwQdWfdaZ445RS7FtwoRaL90JLyV6A5GSkdpnLOKhTjuoxePbjTdmpf4kuYQ57ByYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdt1FTUD3C68XsAHUve+rFRP9HoUiWnue75MPevbT08=;
 b=BbA8QbPkTK8mj5lqqSxCi7Dk+xbycSIhkWJS0uvAOkzFc4dFcIKEQ2hzvDlHyQjPZ9dwFDAwW7fSKVNXkYZVi8STWzwnl5aLNllxQ4xaOx0VWqyaq+xyQRuNBxof7QGzczU8FITDEi7XCnBuuZlaZnMNWM0CdTBp84XNM3utNGziCrruK+h6hDrhyzQVbOHzHa82VLHJepDJyLgM2SocI0yY5lqvF2rC9/f9fWOaBFMQZJ+iUh1Rn6P4/h438ZxJj7Vws9sCWDkOZkX97il2V4WSMbOOjorQcWXKLVaze7NiAk7dr67O72AjL9Uht7GaqP4/J71RJIjUzFW6pdFJZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdt1FTUD3C68XsAHUve+rFRP9HoUiWnue75MPevbT08=;
 b=Pt/sWiKeae6pgcxVRF1c7mH+spwv83o9IstPXQCMTnYq0FyYOA6hMRuoRfy6ICBJEObFdufaPai3NI2TRGYyV5FsG6wwyOeuiHUpvKQrR5slbYZWkLOS/aO5J2SLCJWZHWti5ny5gxkWkiO0H6YMZZrc+YGps5aif4FrUVQ8df4OGJPacQRk1o9qjD75G9/1pTiKHTMUAiVnHCbqhvC+xAAKBvelkeG08R2mH9qfr3bgbjiaptqIFwmN7Cw/PsM5/Y3s7U0gwG1w221uZZr7pr846EIvvCH//i3kiavVcmVY+m0KNauHZo1mDeWBLIhDpLslWF1qMguzs3Jk9IWX8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS8P189MB2579.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:63b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 21:24:38 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0428.009; Thu, 17 Sep 2026
 21:24:38 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] gnomebase: fix gnome_verdir for four-component versions
Date: Thu, 17 Sep 2026 23:24:34 +0200
Message-ID: <20260917212435.93696-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260917212435.93696-1-jaipaul.cheernam@est.tech>
References: <20260917074956.22252-1-jaipaul.cheernam@est.tech>
 <20260917212435.93696-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU6P191CA0020.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::27) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS8P189MB2579:EE_
X-MS-Office365-Filtering-Correlation-Id: fb335e42-4adf-4366-b7cc-08df15021438
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	68KXgVR+qoKSkLMUHK8pEk72zZbgT0ZznnIBuqho0R2Xoxt9nawexA72W4IHbd7Rm3s3WeJFMjh+K4hj9ZsWMhyzqUZduA9G8Ap5q3TWQFX4GB5dPMOkidz2sGtAw+eTXhv20dASXL4pI6d4W8k9goWJ/A/V90kL53BvQmiatXANflJ+PthC7WEL5DI+oZgRxibtfhBWtASgXYrtIQ3dePJYm0FRIIfGbjmgsm2KHL36z9FRa6UJ72UYln0/bWgTwgajL+NGqZTkgAE7TKTURyfsG3MLGxBqRmhJB7rYUVy1hgqSfQt6NwTFT758RmVBs5ZeTiBF82t28yGjPu/egDFXaPXsS4jBhzDTWBRzN7QcZDJMfCA0+/K4G4bgG4PvoWvtR43Hhu0xhhIo4yeNtdvUpot3XvCI9jMuyPmsi/PuGna7soi7VTExRlb5HWLDgTD5wc2M6U7CPkflOe2YysO8jxqaHcnv8r62QuhkiDn/2PSTcV9DwaaxtB7xXoQR+rjq5Rc5yfFDPTs6y7CLDUnCDV2I/v4z5a54AjngOgRq19uIXk55Hw7Ki7WVDC49hm1Q7cxr7Wr+8dDLMATTxJiRa0JVnm29IOKpufMPdgMa6Ft0gg8j/IkwMcArhLCqi2KRaJLgsTLGAHxoQApolKYrtFBPCm5uOavXweenu2Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lR44zqEvhVT/i0PzDsWtN8T9YEPLFw/avii84bytwHobNgSjNF4lzvPiyejK?=
 =?us-ascii?Q?421bBa3tpJfpamezGGltco21e4XEVJOUAevlHRPDpbv/HMh6TOmFRj19yco5?=
 =?us-ascii?Q?fqnF0OycNqknSFpe/LzkW/2xrgULuMMaH83uGlZPvGIK37sEjsxka+KlPhf3?=
 =?us-ascii?Q?ficxkOWRgw58wY20iFGEc7bls00BV5SaJS23scPsQcoCrUHTTnJB6mFTID8A?=
 =?us-ascii?Q?UZc2Oq+L3U/TkE4nMYVa6SWhu/Kos5CNAmhkTXMfVx7sHW5ze48lmPkyo7Fh?=
 =?us-ascii?Q?dY1Hl1RPrYF50sKiOswjBx7CJP0EBwco0DOdpT0Uv7SILbxxvfsGM/94zuTP?=
 =?us-ascii?Q?XTkFxUW7MzkwEoVpqmITyRv/N9/qbZuNWBUqSu1kloRxQvhKfFnZJMJny7qK?=
 =?us-ascii?Q?7GDBeV6QtO4uEpgnWupYbrPdgdV1psKomuDV7cI/dMw9U0hdrsd0MkJs8LsQ?=
 =?us-ascii?Q?Z1Q2XkYLywT2F6pyKD4fsfhvtFpPUU5GzjGkXAn1yPRocB7TU4UtPl+aOJ52?=
 =?us-ascii?Q?Q9wdwg2JeC4Po5auMiMDXPhAwvV9Ulsdnwc7JTGZGPpnIaj9Z3nNG7E/7SMN?=
 =?us-ascii?Q?or+WyRDR/uRy/Bq1Q+XhfY6ItPQBgPiJ1ot+ZOskp2pG2Ql/nzdLydn6U0ix?=
 =?us-ascii?Q?+7H24Yn/zXOytfpm4PKw936hMYFst5SJwsVWM3+jLwSrDaWBo6kgOwyTxBUC?=
 =?us-ascii?Q?46P4Ed8Ak+CP0nwYx88lrfxaCAiy40huk/PVcGgCYN1i+KRqHUjBBEtPlz8G?=
 =?us-ascii?Q?UrFaam/esF7eQTqQFGlRpPG8eInbLmAdAvg2L4IJf+t3RiyPFjMt5zs5JtEQ?=
 =?us-ascii?Q?KHq7F1RLbv3PA6yCM4467jTD8tw8cYEoQ63GRR47hBndthmFJuOYks9L4imy?=
 =?us-ascii?Q?zJXSU2BUavKF68/zZKCitXgCOcf80KSI2QCjSd0wWqKQ5ZRiC6+e7/IE6oFP?=
 =?us-ascii?Q?JZ6kvKs9pO/swggcC74jG1KDCFSs5cWFuExVUPoshkWYEwRJV0F78ZFnPyMc?=
 =?us-ascii?Q?YbiFTS+dzMkbPIyJb7vNYcrRXnqy46xFKvh0lm7fwC6/zlWEXMy8I9BkkzTq?=
 =?us-ascii?Q?YUGqLtVEEksW1VUcsUhC46WoN4UPHGEap8OI3gg4dFQtaOmPdFOkpTVDSiOq?=
 =?us-ascii?Q?UD6dDlmeB/hzz6s9aNM5qhip1QZad5+dHQgULhtcO4mwOElP3KEYBvqIYkBB?=
 =?us-ascii?Q?8mz8LW8BuUmkEbOn+OQntNzZF9EjahvQ8fgUYHl8nnKRtPdg2aDA9EJ+tn++?=
 =?us-ascii?Q?CMaXdh9ScF8IVKkMKnxCtS8sv7l3Lt/u5qvDRRZwudabbY8BIDTcn2pC2eUk?=
 =?us-ascii?Q?7AXi2BW7p4l1mjb82kh3V4hQrNx7Hm0uMmKyqQx1xucg9kirYVgmPJQ7Fyrb?=
 =?us-ascii?Q?3D0f1yxHSFz3q8ZUJ6qt4cer03tAJRWYZqv2MdLZdoziHDROA63zjtxsYXh+?=
 =?us-ascii?Q?Y6o/2Gp3Qrzqjggrx+iBBAl0vY5MyTqgaQauldp2qPbXSict5k8v+kZKubMb?=
 =?us-ascii?Q?RsTQft2O0HMDT5um9vDNX1+QtduFxla/hv/ieXzyLNAbScSX9qb1aygiYOsX?=
 =?us-ascii?Q?tl0vOAgljLMlZ5NHxFx0MnkMvDDhg5APm0TOrTsji3nxOprlnkzx7k6tDN97?=
 =?us-ascii?Q?GMQkJaYQ4Uitd8YIV7glQrb/4/FIhCWCB+kf2r/PCWSawI1SKPwuUxOzepaO?=
 =?us-ascii?Q?NENkoeCCim3nhx7oCuHlKAwlttDSmXbUvXIAEftih/hP/M6Cboep4XVLKYTF?=
 =?us-ascii?Q?9B3TmTtzig=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: fb335e42-4adf-4366-b7cc-08df15021438
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 21:24:38.4747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w9p8HQ46ugaZoy31sS7+3lPKDd55wvDgCPfVEVbAE3YmL2bxMp/2ePfQBGT94DigQEs5AtJkVhWl10OVAt5JBEhdqxTLsE22ARwnLcTfZp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2579
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 21:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246093

gnome_verdir() stripped the last version component, so four-component
versions broke: libsecret 0.21.8.2 resolved to 0.21.8/ instead of 0.21/,
causing a fetch 404. Use the first two components instead, which is
unchanged for existing recipes.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes since v1: shorten commit message and code comment; no functional ch=
ange.

 meta/classes-recipe/gnomebase.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/gnomebase.bbclass b/meta/classes-recipe/gn=
omebase.bbclass
index 57933dda71a..9715e90f165 100644
--- a/meta/classes-recipe/gnomebase.bbclass
+++ b/meta/classes-recipe/gnomebase.bbclass
@@ -5,7 +5,9 @@
 #
=20
 def gnome_verdir(v):
-    return ".".join(v.split(".")[:-1]) or v
+    # GNOME dirs use the first two version components, e.g. 0.21.8.2 -> 0.=
21
+    parts =3D v.split(".")
+    return ".".join(parts[:2] if len(parts) >=3D 3 else parts[:-1]) or v
=20
=20
 GNOME_COMPRESS_TYPE ?=3D "xz"

