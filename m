Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F29D72372
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 10:37:27 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64968.1769164644292275940
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 02:37:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=lFTKror6;
 spf=pass (domain: est.tech, ip: 52.101.65.63, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eazxtcJkzR7H0qTlsjHO1ghlb2pld0T+lPE2cf4OKy7BabDiwQNS+ldI9ymczlugMNYhvVVKmZVEnGNOy1zwoHNm+BpofQ7n9zic6fARPndU/1phH/1Ed3om8qH15LltXyiUHBApECjUdGijzq4L2m6pqhgf9wasiW5j+5dX63oJ28V6+NOUspJX0yOWswvtLxxSp1ef74ueHmcLeSfr3cVx9yApp5j0Kmu3edXahwkEk2SE7vrBdKjG8JBFYWrUElhgjWCSpH4hrSz4Wc1NHz+d02QFEnMqsYTzCuGHCE984CSKnwvQET96KSoXTJbYPOeDAHoHl7zyS2l8bjmiqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VFMiFt5wdqfjqF3BlcaIB3+PB2sSL2d2HSTuQp0w/E=;
 b=I3IwYJYutIJ2kjYh95OU71Eh/gMz2niC/sCAe5o1J6/2/PvJY5g2/KOOd4WDl4Qbc/vpaGHDeSEzPXBviT5p5HAZ5jtlnbYbaZdb+YmwkqmNOcAPucjgy1IiPE7pUSDCSfodYtsg0k6ziRgBNUkvnXDZLvUpY+yK1iDvfcOs6mQMezhxuuh8oyjC5v3z3twtw9ejkGAnlVNhSbVrAhRHTlq0yJNe6VRAN8BLySm9g7H0S8/i4oSXvH8S3Lya1iX/meYjMNOw5yF2GLBSFLpzCBj7ZfTMovumwKN5vavdz2SMlu8EIHHNSUM6/TvpECMmulTEF/qbbuuq5aLmhS8DNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VFMiFt5wdqfjqF3BlcaIB3+PB2sSL2d2HSTuQp0w/E=;
 b=lFTKror6NHJ7rJQ/c9Pld/Nui9Mt7ZCQ1WLpln/ELYmmLBwC4OEjry2ckZ8/2bL6eDrq5vc0uXaPkPi9Vjixq1vj5vrzMKuqp+1+whIZEKqh5fuei8T0AGKSoxmAYXsUD3ojEU2EgXWePyldSkxeRdIxZ9m4dg4oRPTk+ARDgigzhk9O+5MY9YWxqs6fDOhZ7+KtoyFxUUCPyhdch4HQbanpTfcLnk/lAAXJBKRR2tfQ5FfKtpTdaMj6Up+UA0s3flTINTZnac1QKqNgSKyWZJ/sL493D+W7MzMp1fLe392XB5zYC5TO0vx918RblLZGGyp6CFMDPbuyPnfBrYZhRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by GV2P189MB2305.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:37:21 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::3cc6:ccd5:b124:2a6a]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::3cc6:ccd5:b124:2a6a%7]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 10:37:21 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] avahi: fixes CVE-2025-68468
Date: Fri, 23 Jan 2026 11:36:37 +0100
Message-ID: <20260123103715.32186-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::31) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|GV2P189MB2305:EE_
X-MS-Office365-Filtering-Correlation-Id: 467895f8-975f-40b8-5437-08de5a6b63f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pDqTbnQVC4EJqlwAlfnkfOZwYMxXucsLcnP5Hic7XqagJlPV0iGaacg+PEGE?=
 =?us-ascii?Q?+wPbHSTC9NaLUb1/GT0v8XlWMqVp2a0LGuv1THnJXkxNDHyJV6udLDOBpPZ3?=
 =?us-ascii?Q?m2oVgwuy/5h77Jvs3GLzNbbuS8/3JLTtBbR4ybqYZ2WWppEmgJHVhlqy3zIC?=
 =?us-ascii?Q?YS8+U9mTBI2owng+wc7M+IIGz0LghNq5yDyirvaXHlf8Y+haqxN/fVV9hRqD?=
 =?us-ascii?Q?PEcKpWNii5cwHBKnIG+Bx2ENCAnDMrPw6Ibf/os7ZGC5gRJi9d45g21LLlBE?=
 =?us-ascii?Q?7niVuTJG0chixWYth6fNndoM3U9as9vpvLVzbZS1UW87Xic4vQd6qXNvn0rH?=
 =?us-ascii?Q?4CF/kRW38NCBG9Lejt190xAtpXoh+SDDxMo5CpgonC3Nwz8xLIdWz5VfYPKN?=
 =?us-ascii?Q?Z4GimUfZw66MlHhKacwCB6WGjcKoQI4rqVr9fe7jNTf+IiGHju03lQDSnt/e?=
 =?us-ascii?Q?CGqKt0mwaQoLmTg8xcpV/m6jner0YTobdjO5+4AAygT0YH7WIGWnxdfy9Rdv?=
 =?us-ascii?Q?s/GGfKqeM7kObUoN1B3a031BLJ9Gm1jVszvpc4NB+eg/wyH0s5dl7tCVkgZK?=
 =?us-ascii?Q?WyfdquAEsyvFg21pIzH2w877m6S+88exuFOYm7eMOtf3zYDivSHVSWQ1X8wr?=
 =?us-ascii?Q?M6VnvlgsRtnLxzs5FIXjcD4nFecZ/SkK4A7Jz891pEIPLntecxhGwIydwsPe?=
 =?us-ascii?Q?X4sqENysfCx8DCh9aTkCL/LoHvTMMpE1zds16fUCQYIN/VjwdNLdsyZcWN85?=
 =?us-ascii?Q?HnSPUNHJxAgRFrNolNBxc85mbJd2Kj2cfF8RWyYjmezCfidPJh7dBOQ4ZzSl?=
 =?us-ascii?Q?5N4PSb/pU6P9tN140SFCHypmjBZMMbPlE0q5wfh8cVrTnqjcL6T/Qz60nzye?=
 =?us-ascii?Q?lqlZADhVoWz5Sl+acHmvG0AwAYYDIwhIfZfWncSFxRml1Q6LFXuDBBGE2UEH?=
 =?us-ascii?Q?w3LvLc1LgE1iW6UOfgTQpKFcpoNbe2JKx+xupd+xUSP3twWEUDH679rOcgtp?=
 =?us-ascii?Q?V1eN0OHPfmB/s6v2u9Zs1dCd6+Z7H6qteq1Y8a1Ph1Iu8gr5oCV+rcuiQ6wl?=
 =?us-ascii?Q?QXgP4p1EplCsHEpYgcwguua9+uGX43H7pCDecEP9hmZ5m4p5Y+pzBsktSfjM?=
 =?us-ascii?Q?BEnLXlZ94zZkGTV3jbCx+Kk8HPONlNn3UVmkPmEvNej5gZ8O4NN2zPaXDdpj?=
 =?us-ascii?Q?5YbzZVoC9SCIWo0z/eth5kkx0zWr+GbHAp1bWzkAOi0GuiuITzeNRDw5PblB?=
 =?us-ascii?Q?jMOUrU7rKYbEJ/prxZyPK2rQ34VTijflbblYxnBQ1qtZVlzpXryt7L2fiWrH?=
 =?us-ascii?Q?sX4vQAXxATUzWmME0eYFoDIAb059p3KvLy0+Ft6btHP3+Ovce2AHViUr0w2f?=
 =?us-ascii?Q?fNIhMHA9lnCs8VhN4arTStdTR+S5c7fPWWLILO44nYP6fxfrQEDKpxPqZuP5?=
 =?us-ascii?Q?YS7RLUwx5e5Pr/U1zgv2Ld0GtW7eI5VYA9MeOSDee8IJ+ZY8QVe835pH5PKM?=
 =?us-ascii?Q?/8+NsmfrvaS/KStUAL2X0Qn94ubSF8z/aM5Ys/HnrLDKAdxFgabjglQnPtWj?=
 =?us-ascii?Q?edIDFNt0/o+R/AqjOY8+jr+4fc10F7joITKMofh8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5EHZwdMzngt1svxuXDDXC8xViLXzl3PBYYqxjde3ipjiDDlAau16udEFIqYR?=
 =?us-ascii?Q?BNL8ErVvirCQcM9U/pJoIXhVKRIaIa83vSw2uZKQY6IJgk9st/r0EvLcZWBD?=
 =?us-ascii?Q?EZNDt+YNCM1F1JhCa7tWMsdZpfkZTVHxHFT2eVwsKiFJMWBNwMmFXiFAciPR?=
 =?us-ascii?Q?VecARfwR/mdpkfujqilp/aesv1S3bjpsPVF6ianX9lN2ycYPBL1lzlImIfQx?=
 =?us-ascii?Q?mW7+7hgvi23R6fDHyRP2Li0McxXqNAqOYnVstOzL7GZT5Lu/wdDbhKJeQe4V?=
 =?us-ascii?Q?b9acWyCQmG3OQt5TeAcbCcePID136sS9njRsJ3iL51vGV3B4ZLvACh4Ei5g4?=
 =?us-ascii?Q?QgcdE4UkdY7b69hTz4x8up2kLtVYeQW4ClosgPBk7jv48CSGB/qNBEDket1f?=
 =?us-ascii?Q?qw3e3qGQT+ucWGHcNjc/HAikHlv42nsS/Gyy5gASSGwR+uf4Y4pPG8YK6j0D?=
 =?us-ascii?Q?holjNO9/ExJbNVHJzywJyFj2GolUQzW6nylfd6PV97lU6Q4/Pd27FCfcBzhj?=
 =?us-ascii?Q?l7S92S6fkV/2yze7QYcrhgEWL7GrBnXLfhbD5t0r6G/lc7CH57PsvJGJNVMa?=
 =?us-ascii?Q?DNWiOoAqHoeag7jIgDr6WfA0NsIOFYc60mBcUGgrmP3HFJMNlZSPIAgGutra?=
 =?us-ascii?Q?bGxYsahdp1s0Bsq/sPRE6YzJcnL3xmblxpAxij0fDkpONvs/iQRcw3e95pQn?=
 =?us-ascii?Q?npK9mcJfVRiw8KdWGrflYSKMk4EyVF/nqmbmEk9j9FUT8t4A5n2VuQYG+w/i?=
 =?us-ascii?Q?Gl6DqhYsqUoav2H8SL4RZBEaiIqZkKJ1QhZNpKeo+o7H1Oxuz4p5/mQd6F4Q?=
 =?us-ascii?Q?dbwTxfuOKDvlcmYjSfkO2RaCHg7dYTKlc03sgPLlZzNdodvzdb4qmzipXqGa?=
 =?us-ascii?Q?patSQkpJCAr4sinwpMYMX/XF8youj9GcdmuaxPqsk/OdbxD60El1X61v7UsC?=
 =?us-ascii?Q?bJmhA/j9T2lQ8G8UkkhPTdSxQsZmF2pjA3I0Pu9shAi5ikbKicYxlUmWjUGJ?=
 =?us-ascii?Q?IhRWg4od0oKQaIncIrWcnLqWZQKiYxWElV28NyP1Hp/Fat6W06APetZsjCYv?=
 =?us-ascii?Q?qpQ85WfXGGw65RIme6PAVG66iOppxzSB9oTevspWHTfvwGBFY3yYDXtkqrKj?=
 =?us-ascii?Q?Gt+3Ft+kBLovdF9AlElbxvg3nYkLjpoLdjh6g3h53UdoKMO0fU6S4AFS9kyE?=
 =?us-ascii?Q?KzLWfgI7/5gif4g1VWgo9kvvNjmIii83ohfUkELMaMVFiFzDdSRGLxv4oWup?=
 =?us-ascii?Q?eOLxK2XgJJiyemPinKa+z6dGlLoGjTX2oXwikyjAjVnEe+lplh8HtFmDJz0T?=
 =?us-ascii?Q?pisYRrZuFKJprCR3ZGCxDW0VieskQBy6yRgZTvfF14YY9jrzX4J6fZlA+6G8?=
 =?us-ascii?Q?UV/WnptQYsvPn4HYZNNoW78idSaEkynkH4hY/93O4yDQGfACDmi9eBV3Ima8?=
 =?us-ascii?Q?U0AmcXxQKzIf1vOtXgil06Gz1+d6eMhUfaouU/ZMkF9Vmic7+yPLkoO87nC4?=
 =?us-ascii?Q?yQCHuTSvTry/5gZZYBFMKig5uuDD/9ABGMOEqEXr+KBPXHUehnaKV24az8GW?=
 =?us-ascii?Q?K2wKyckWJl+DIeMakCIR+rTVEXUcvO2noizdd5mwkJuh9qrm/Jc9x1CgBBR6?=
 =?us-ascii?Q?Yspo7LoUSP8XiGoLsj0q2YG6jlsP83AU+5Z2kX5CWW6ob53j6zvgpTBK/3hM?=
 =?us-ascii?Q?zwIX60LLfb4bISmIV+6/Hg17ZcA55z14fm38OOvd6RYB7WM0MEuSXbm/QXSM?=
 =?us-ascii?Q?lY+BGJasjQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 467895f8-975f-40b8-5437-08de5a6b63f1
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:37:21.8375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k1zbhIyE80mH6peRe+BtHcuClODUMbWlx1VZFdMdJfi7olHmoW3nk8IU50BiqYhXmecrx0eaq63PA5lUQA3LVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2305
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 10:37:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229881

From: Amaury Couderc <amaury.couderc@est.tech>

avahi: fix DoS bug by removing incorrect assertion

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  2 +-
 .../avahi/files/CVE-2025-68468.patch          | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68468.pa=
tch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-co=
nnectivity/avahi/avahi_0.8.bb
index ffda85c0e7..8f8f4a0d88 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -37,6 +37,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/avahi-${P=
V}.tar.gz \
            file://CVE-2023-38473.patch \
            file://CVE-2024-52616.patch \
            file://CVE-2024-52615.patch \
+           file://CVE-2025-68468.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/avahi/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch b/m=
eta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
new file mode 100644
index 0000000000..3635cc8d53
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
@@ -0,0 +1,32 @@
+From 483f83828cfda965fac914ff1b39c63c256372b2 Mon Sep 17 00:00:00 2001
+From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
+Date: Sun, 2 Mar 2025 18:06:24 +0100
+Subject: [PATCH] core: fix DoS bug by removing incorrect assertion
+
+Closes https://github.com/avahi/avahi/issues/683
+
+CVE: CVE-2025-68468
+
+Upstream-Status: Backport
+[https://github.com/avahi/avahi/commit/f66be13d7f31a3ef806d226bf8b67240179=
d309a]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ avahi-core/browse.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index 86e4432..79595fe 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -295,7 +295,6 @@ static void lookup_multicast_callback(
+                 lookup_drop_cname(l, interface, protocol, 0, r);
+             else {
+                 /* It's a normal record, so let's call the user callback =
*/
+-                assert(avahi_key_equal(b->key, l->key));
+=20
+                 b->callback(b, interface, protocol, event, r, flags, b->u=
serdata);
+             }
+--=20
+2.43.0
+
--=20
2.52.0


