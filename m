Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BFAC44500
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 13:03:52 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20506.1782824629519947459
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 06:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=EcaFzWjr;
 spf=pass (domain: est.tech, ip: 40.107.130.1, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=do6g0K9x2gYkgffV0yi9A56m+GXak7yESPLA84B4HiZBk+/CfLFlr4v3Tp76KHtnCTz5+5BEB0BMRlGF9d0a25fHzyRcm+DkfyhlyWSSkJ+F1TeZnZEw72FC7yFu+4UV1T1mKO6aldUdz8MDiRq71j3vPQlsR4+1fifBRed4Svk8yFEwKG6T5pS+iFLKScUnMGkpHSbgLP9CfvQwfx7bkyLEtYrxWPckZeGW3089aKakTUwTQvOPqsZr9Bvl34wBW7Fr3dJDpVcIdzt48m5BiD72giZY1es+67q8uSTyDEuhXnN8Uo2gvsuzv4l+N8HzIk7i8mmZ4cJFpbpM2bPo4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O45B27bf0nzfkMQDPrlTipsoPzQ3bZ4zF9xmts+L7mA=;
 b=vxwXeqY4PnJMVjjx71WveJWaygkOgtke1+ru7UclaJaDWvEfxGtMmqAXj23pG6BJD0Z/+P8KUt/Yqyt5XvoFnRuo6qrfURHM7wZaWhTHNS1exHmUj46ibrZbtAwGEgLECcFtozIMEhr0MbNzpUwPqGMT0Gr/oDRH3cwlvEFg6p6CWVLRKQFGbA8+mpdYBoYIvPas2vIpufBOyhYQLyZKry2FZX+SJ0CzETjJvtuS506gXqv3Td+fF3YPRCwfY8dz8bS3ap5tzRT9XOq1RQahJupx41YcOs75YE0ECCOq5eDju67zjx04bQpE5gayYG0Y+nRgElLBKcXJFVEiWIvZeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O45B27bf0nzfkMQDPrlTipsoPzQ3bZ4zF9xmts+L7mA=;
 b=EcaFzWjriQ70SOoWN8HLIg5qRig1ljyU/CKQdPQ3rfw7iAAwH3Xb/r048KzIgC2JgttOqpBj6AzrDpHrYvg7DbrwSXtH9MCNrOj2gsnolGpz5X0lz/s3fbSR2K6a91F76Ad2N4witEDzZ5yQ0yh4T8GGIhRGD/fwJ3BlSli0t2IUAwkoCSxoomfqykSj4icbfBtqXVWB1JTK0HJS+EKqNc89VFL/bYj1uJcQwG/SN+Cc/b7yPAzXnWG8r9RyxHUmOW61pOFyh1PN8f2lIFsjYBRJEY5JuFsmZktdj/GwrTc3wcOSwGTzFVmJDGd3x14qkoPMu0o1/ccf5wrD5+yQIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by PAWP189MB2777.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:46a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 13:03:47 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d%5]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 13:03:47 +0000
From: Roland Kovacs <roland.kovacs@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [master][PATCH 2/2] gnupg: fix CVE-2026-57062
Date: Tue, 30 Jun 2026 15:03:41 +0200
Message-ID: <20260630130341.71014-3-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630130341.71014-1-roland.kovacs@est.tech>
References: <20260630130341.71014-1-roland.kovacs@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0437.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::10) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|PAWP189MB2777:EE_
X-MS-Office365-Filtering-Correlation-Id: 4109206b-1837-48fb-d5c0-08ded6a805c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	Zn0uqpdXK3WGjljGUhTjxY/eUjBcQI0NUhGBJoPWg9ODvE4VFpMJ9G9M2YnaSRthCHtDOSiGv991s+jt48rzpq0kOmos3VzPX7S0NQ1gdhn0RUNUnKYY6Q1hNWn4e3vDIyMyKZVuGekrHsBv6nMsZFUE/P0OXUQoo+p3si76ud86nV5b+yqjnCO6m6CWR0aKU8yepNCoYGBRGSifM/8Oav5+A5RqDPZDdJXvgtdMJkcDvS79O+Cu4Wo+ZoPRrKJQV2CkLmIM3GrcA4kLK8RYxpg+Bke323ztmWu+gZrrUDV/fHIIiI1+7r3ggJ4ZiddZfKKx8dWXNV+xDghSkddPC9sYoTP/fw+cvSmTXy6OIGNsHd4OOyfu84ajiShjhqmVakrr93Mr+wvJ/+tFaNmdtNbs7vtBtOV291NglN04d3NyI9IZOnCMbp9rZPn8q3/bZ5m62Jh5M3J46QMWgCE7NzLduHuGmSNJiGm+STl194anlTc2fgWnlRvaM7iq2ru1pweclOJbmgVcpcKKUtUG/VM4niw/CrcfKtpxdts2m5OXP0+RlEDCMyphCMz7iOG5ytwsO28x69ThxsJahVspW0jzLd6wPXNVpxyHdlCne3fNEr32ax2jCuhn1zmqFM2ACyvVndcuGDyprzKKKFu50TYp3dNSF2OSLU0RAjLHXwk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BhNKWNE8ujy5gMfuGJWShCAnDQUEcBvKX3oKcEh/W91qfEyXkRg+gPcBhkn/?=
 =?us-ascii?Q?QiB54JBeJFMPE/BKyWK4DOdtdkb0DCE5uTIf23ZKuN1k7WENR8rVH2krPxHg?=
 =?us-ascii?Q?upmLjbQUBdFYv99ih3ulurYGdIgpql6bckNkimY40WHR9O6SZbmfxWSkKaRs?=
 =?us-ascii?Q?Rn/7WIl8BuZoy5jf8qQEx7nm4/gUghdEOALNOaQZ65WXhwbMQe4sGOp3C+QX?=
 =?us-ascii?Q?n6+LglD15WThgsJGga1Jjf0FLO4IfuYVnd/PtvUwQR+HiXoHBdlbdk9+VoFk?=
 =?us-ascii?Q?Vh8jcdHIZP+YIKMTw61pD6MqjmQNeg4QvFA7GmaV62yBsRgcUUKIJjHhxD23?=
 =?us-ascii?Q?6D45iPleWyBcZC27pmI2/5mG2EpkPVGz9cAgWt0qIkc1uRy1gAsEAjZkDBSw?=
 =?us-ascii?Q?IY+NadnBEcW9ee9jAi34OoP0716GodbuOcGKvycUIDho7IIbBmJUHPfKPBTf?=
 =?us-ascii?Q?820UcMosaDqYpici+Tc7A992AWLKmYLgku8Ln2Uca2qL/MeD3An+vilTmuWr?=
 =?us-ascii?Q?oFCRrKVlY+m+S/qIXoI9ubU/9TUNJ1kAlr5T7W8+By4lnL9OXhDtJJ/X62bW?=
 =?us-ascii?Q?4ga1KnANt14BnlEU6CzID/qbtObUzFs9Kxxqz7m01IlWL3U6Jbd4ea8Zqn10?=
 =?us-ascii?Q?tKWI0ziMS0tbMY1DvxO6fWar7RUgNnUUxMRnuvQJlt9XZdwWebj23kZTYfIi?=
 =?us-ascii?Q?nXMTI1qVfB924B5j+neHc4k77PTfNb7eqNgxa3LQpbp1PeZm19posxoswy4m?=
 =?us-ascii?Q?9nw3qNzOALoA4PZuDF1JRF1oB6v9CEA6YZZTZZ+MMJCNOQRbA9gt/0hgDJSF?=
 =?us-ascii?Q?l9hhwuaI+l+dN+KG59VyRsiG1iP40bp0qHNCQrv8Ow3my5wd0LqoEzo2BNGF?=
 =?us-ascii?Q?2AQKOV2RfatruH8RWehQW6BW1+xZEl7aIHjyLCiIVWnjDa1ywX4P85XloMOj?=
 =?us-ascii?Q?OLJYVtqj0qDEXJr3Z7qrakk8bDQ40Fl46uJRtqcogKagu1SrhnuEQ52E5Fmj?=
 =?us-ascii?Q?b75uosZs9/PUxvQZQwzrhGxsN7XxnItPj7chpICoTmvLZLKZ0z6EHJxAycQT?=
 =?us-ascii?Q?hlynAtKmwmmPGmj2BLWlpJ23Cw+WjuK/ziSmtkOeIOyZ1ew74Gj5Q6TlSfDh?=
 =?us-ascii?Q?vQ0v/Gybdpo64pU5Hg3LkgeLFojnDGzLJu8seAXjHg0E+dY3mIopYcv5bST7?=
 =?us-ascii?Q?Yop6jVxCHKtQ0mmUA+VF6pGOP9moa7poVNa5iXeoyGtS31VEALOoYMvRNNUG?=
 =?us-ascii?Q?cdV0TFLzp8FqgTtg/dG0t/7MTT7wbhMFfXHMlH2lQijTx9+CBu0pzyTk5ztU?=
 =?us-ascii?Q?IBVClbX7iuNKDngxsc1qHdaFeuejFG60dIuBh7bUZZfo3ZwSR4APSkj/EnYK?=
 =?us-ascii?Q?cRtW6eWsXaQjXWcsRzaXXOARKJoczbkuhEwdpYZ0Du6Oo17vPh37FilBkSN5?=
 =?us-ascii?Q?Hulsdq+YTylLaJfeqridP0CYKTXdbCFNnu2Q9pehOGW4OTSTEq7Qss7K2um2?=
 =?us-ascii?Q?szSWXKeBVYc/DcZj7TnWm7U15SOtAHD+tcs8UFZV5/qOpVc1KBNRk2iAdrJm?=
 =?us-ascii?Q?tpWv15anmsjX7reWbw3cyh4BlJ77To0CX2NMUHnPvWc6eFGtmc9TeI1IH7zj?=
 =?us-ascii?Q?ilz6qEwvxEY1LetXg2GiRV57IA4av78oZMauD4m0HGoxOvo5ivFxPgifXZ9Q?=
 =?us-ascii?Q?CbfxlMYlf9guFqd8cI06x7mZ1OLhdhJUO3Mt5viqd8LKNFYsBg/xAhp/uWp6?=
 =?us-ascii?Q?WSVVgskj5A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4109206b-1837-48fb-d5c0-08ded6a805c0
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:03:47.4945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: efrFLIlVzaF+QEDEZRHg8U1WS7AAQFulYuxV8OwS7zWlHI04/k/oI6Mki5dVtoVID6oBMWepGQk8F9HXfNDOAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2777
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 13:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239890

CMS (Cryptographic Message Syntax) parsing in gpgsm in GnuPG through 2.5.20
mishandles the CMS format for AES-GCM because aes-ICVlen is supposed to be
12 bytes but 4 bytes is accepted.

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
---
 .../gnupg/gnupg/CVE-2026-57062.patch          | 43 +++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.5.20.bb    |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch

diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch b/meta/r=
ecipes-support/gnupg/gnupg/CVE-2026-57062.patch
new file mode 100644
index 0000000000..f298b6e9a8
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch
@@ -0,0 +1,43 @@
+From d586f50ee849c8cbeaea47b50c64446c1becbf9b Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Thu, 18 Jun 2026 10:51:34 +0200
+Subject: [PATCH] gpgsm: Require a minimum tag length for GCM decryption.
+
+* sm/decrypt.c (gpgsm_decrypt): Require a minimum authtaglen.
+--
+
+Reported-by: Thai Duong <thai@calif.io>
+This is similar to OpenSSL's
+CVE-id: CVE-2026-34182
+
+CVE: CVE-2026-57062
+Upstream-Status: Backport [https://github.com/gpg/gnupg/commit/4c7e68cf3d3=
35328821bdbb70db309a60d0e4fd4]
+
+Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
+---
+ sm/decrypt.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/sm/decrypt.c b/sm/decrypt.c
+index 20fb96060..92a33c6e6 100644
+--- a/sm/decrypt.c
++++ b/sm/decrypt.c
+@@ -1447,7 +1447,14 @@ gpgsm_decrypt (ctrl_t ctrl, estream_t in_fp, estrea=
m_t out_fp)
+                 }
+               if (DBG_CRYPTO)
+                 log_printhex (authtag, authtaglen, "Authtag ...:");
+-              rc =3D gcry_cipher_checktag (dfparm.hd, authtag, authtaglen=
);
++              if (authtaglen < 12)
++                {
++                  log_info ("authentication tag is too short (%zu octets)=
\n",
++                            authtaglen);
++                  rc =3D gpg_error (GPG_ERR_CHECKSUM);
++                }
++              else
++                rc =3D gcry_cipher_checktag (dfparm.hd, authtag, authtagl=
en);
+               xfree (authtag);
+               if (rc)
+                 log_error ("data is not authentic: %s\n", gpg_strerror (r=
c));
+--=20
+2.34.1
+
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.20.bb b/meta/recipes-supp=
ort/gnupg/gnupg_2.5.20.bb
index a1a50e2384..e373265c48 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.20.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.20.bb
@@ -20,6 +20,7 @@ SRCREV =3D "343d0cb8910441aa44c56ce8673a78e137040c87"
 SRC_URI =3D "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
+           file://CVE-2026-57062.patch \
            "
 SRC_URI:append:class-native =3D " file://0001-configure.ac-use-a-custom-va=
lue-for-the-location-of-.patch \
                                 file://relocate.patch"
--=20
2.34.1


