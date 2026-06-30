Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7275C43327
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 13:04:12 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20927.1782824643216728830
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 06:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=mCWFGKtq;
 spf=pass (domain: est.tech, ip: 40.107.130.16, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWFf3Tthya9Ic4xCxdviiKAOTuxyzgiRdbEuUNgfJzKk/fT+VQJhkPMjm/xDxV11UmKcSJ04iSQfgWQNpoDx7NgBeosJ+Ey5+5vrskpLcz8cqN30ovwzqrOY17tgrNR7iQdw1tlsWEMQC7yjGi1NMYmCCZYCrAD6nTP+fuEa8bGsqQWT44hlM4TlbY8ckFmYE+JiTJFor2GR5YOHSsPogkNVAIT4RiU1/UdiJc1mIWIQrdH2PEAdTwMKoiDXcbPxd9OHGAVDjTtLDziRHoJ0hs89PuAPngZiG9B9SPcP0rTLoJNLE/FdOeMIYZuzTx4k6U9/yGYyxO1w2xOgXr+mLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O45B27bf0nzfkMQDPrlTipsoPzQ3bZ4zF9xmts+L7mA=;
 b=DOWctaqME+RlkOehvedZUWovIZrVV2Wf0I2o2bPkIK8wedZ3TvTx+IQzicSo9P9Gpty4KdFVNV3Hj30NeP30ySQgFa3xeRWx3B40aY2UkZ6lRDkGgECqsqvuUG/K+EV7IaUDoo3R3dbGVWRxXHplFOq4XiEg82DuqiTTXSDPbma+ol72zNauI402pp8NBEskg3Qpnd0RX15BA4PLS6MhYjY7NVESjYugSINEeDN5vNd5yTJsgPsUPeCZWnSYfaZCszU6VJ5mKkdjCB4eVBigqiiKSWMlwhGBryselczjhr/U8gs8Vnkz04WmaoAFNbbdGB3JEvNEwqOBRpgmTkMAeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O45B27bf0nzfkMQDPrlTipsoPzQ3bZ4zF9xmts+L7mA=;
 b=mCWFGKtqehpA4PF9rZuZAoxIoe/tIrOg3cV20SaHyAm+2K3Zzdybl/KWP596qDztLkSyZqBvpHKLSWzH4ncOQ7puhWbquew5Ok0vX8vF/jAoZmAZ+VWqFsj1j+evTO/UO20ijUIeAitC1grwtMoJLq58vt6Uh+fIjvHcSvrhMIyxUW1gqiqMdLyQtNEqd9C7b6B1RXpxhGCzH3jJ3iogyOgCp+oB9fXFvRPza1rf9OlD/wOIop4fIMYPt7FytcA9hf7izBNNBEtLpqTUh72DpYA3WOqqgNg57pR2aQ2s4i/YBuj3XU/aA5jZmDH+31oiZlak+6ZvxJ5G3E4uH233Qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by PAWP189MB2777.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:46a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 13:04:02 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d%5]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 13:04:02 +0000
From: Roland Kovacs <roland.kovacs@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 2/2] gnupg: fix CVE-2026-57062
Date: Tue, 30 Jun 2026 15:03:58 +0200
Message-ID: <20260630130358.71091-3-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630130358.71091-1-roland.kovacs@est.tech>
References: <20260630130358.71091-1-roland.kovacs@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0204.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::11) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|PAWP189MB2777:EE_
X-MS-Office365-Filtering-Correlation-Id: bcbb98e7-23c1-4f4a-6f36-08ded6a80e9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	c9tZ8gpgY4YqW/7q8O+JM8TUUrIgygVKSbZJX6y63Fx18w+5Hqn/l+NGi8aV6XYtISnWMmSzCd8AM1yrNFVHIx1ZXlwejMpXTD2Z8wEaac7YI+BgfEBVS1jqQePqKHEpyL9/py5vkhdOie67LhSs1/aTQuqJa2VOO7wC1VgasAJKVd3hN798f2BK8Z0sXgxAW+EocrgodaV83X7dx4dhY6gwgxOqkmH4uLvx1yP3qZIwy9+wZqGMgT8clDZZcYtGkhmdWFi6pHndWdZBpY9nuLO7HHMIm1owQE8BoxnVLP2UaBQzvvcltf8dxWtnjGYeMztf2PTDQZdzHvOrWkkeETqXYFKQ+nad8+/Rzszb+eUMiP2bW+OLu8QdZbie0fVcW3yGjGFTTpb41tnN74+bOQoEBsH8v7v8K0bi6Vhv4+7mv+p3JpoHSIzs79GaNuiWNu0an0nRk1JmTyIQFRti4wua08xjWR8mvLTR5YYCpXed2pb+Y/K0VsvWcpK7rCvo3Ma7lUXMHPk2ak6zp3G094IdrdUdAamoCghiIIAWppjmm412W+OWYiMxJKfD4kALbiMLJOgaGRcWDsSDRcScknk1Onedp6zaNQNTWfow4rfQMQmJzs7kFws7nDilJyOPLDWSfn0R8rzeKdeFDWt7mRvCfpsSK2UxSC+RZcobQ1E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MI/5CsrjPymPGAMrcZCNX+Gnpjf+NJTjXtCJPZK4tLPdbuZJyNqMFPdFSW4R?=
 =?us-ascii?Q?i8X+xjmV1U4fxSg4fV8y9zibZv0kwbkuZSXqaQiBExxeLyqlYValGpDliiAB?=
 =?us-ascii?Q?7K0V8UAhTRq4FQm75OrLejr/rT5FaUg3pwAjK+hurIOr6M+DV9dPPxzGTK3j?=
 =?us-ascii?Q?DkCti/RlpuNOREKmkbpkK4heQeUSGrmGtbmZ6OdpSTtj3aRbpZ1Z089/xshG?=
 =?us-ascii?Q?IMkmqsGPfuSuH/qmqf3CcSuc+EcIu7+ri8FouMdhhYlgAWLz6GqmPylZuUZy?=
 =?us-ascii?Q?tT8w7jhKRMaOZGe1euLXi1cULaP2SlAx0a+xaAoaVrn67Y4QtTNxz+35iMOf?=
 =?us-ascii?Q?gIiaFOjrzvwAvIDlo09XfKpNLoclY1/3yKbKuhSBVTXZ7F+keBCNDPJzWeiP?=
 =?us-ascii?Q?wpI4BChf03FOYhiDJJM2GWsqaJlgNCrKKCTOf1jOn/CNs6rRdPF2JXn+Pn8e?=
 =?us-ascii?Q?ofZWBHAVfmk7IhGWMN20HSEnmkXbzcWPvHM7ioF2PZfQJtpySC72FjcBsIMf?=
 =?us-ascii?Q?fiv2JX4GsKOSoUVxeckHoVpWNcmhyj9d9vonDmhqjcw38TqbpvANs3diP/h3?=
 =?us-ascii?Q?Y8FfJOyb1TrWlQassqmAIcPYMvfSM9ji/wXPNh1E8ExcTZWGAdCWmGV2Urxl?=
 =?us-ascii?Q?lCaYYo09BGFX5dHl/1onMwOcs8gJmTVojN1+PkPPN19QwpBzvAZmQER9z0zB?=
 =?us-ascii?Q?qpVuTiT63JiXCNtIbqJyM7w2c3sjmKKhDEnNXtEz7Pc6iriA5S0j/ou8eVPV?=
 =?us-ascii?Q?NiPCYEeUhz80hgfFP+X9UDl2j88dr1Q2iFtJ649JOkpZjKaxwXpjyWHebq4p?=
 =?us-ascii?Q?JqbyimkrqEaKzrI9J6rW27fayW18lNEYrKBsFCq0pSyQDxvzrSYaRllQVA7b?=
 =?us-ascii?Q?RaSaD2+oNAbqk5g3hUEdXVsU3MCUyw7/wCppvMDIe9TyUvPUHXeuddBx4Ryp?=
 =?us-ascii?Q?Mv4JtM+O9OIJrFHSPtLsN/WImvvblug/8497DlglEzF+r/Kk5PCd5xloFT8+?=
 =?us-ascii?Q?PH2UEIiCA0WP23LSqc509kB4nUqvjPLKvFyzgMN3TMaes8Rq3uZnkLTdkjyc?=
 =?us-ascii?Q?Aot8ub3Ae+GlO9goVz24rFlPifM4NXYiWG1Ooo1DDDX9EzrSSteNMeVGZVeA?=
 =?us-ascii?Q?qJkjXdtqVX+28duR+E/uuwT4SE3tMIJZ0bVXEutxuJzUwC2XXMkzcOIkuutR?=
 =?us-ascii?Q?ZZ7y50EvW1Gl6sReTsRewaGhNd1Z3Nlqhs73iV0ZChF/kL2yHLZmqnYwhY2F?=
 =?us-ascii?Q?uwFUG9NG4FYrU+qYuVEcOUqCv98CfIpDwywiJFuqP0ayTBlXa2u4E9vuNh+S?=
 =?us-ascii?Q?G+A0ywIXic4UiizSG7lyr3JeOXno1OL5ZqcjRxA8lSJ2kPhuVAF5QYIi3oZV?=
 =?us-ascii?Q?j5J0Qjr7ptXhu1DgiGVIvvCn6GDzIMFp9SzqNgF0vRSGF3Bg64wXAwz3FQQi?=
 =?us-ascii?Q?q0HQL0vmmOftM3g3a8NO/1ZCe5VkLJh7LFxLXGTdfOg3rS1P+smBU85b3Kb/?=
 =?us-ascii?Q?ERG8toohg3wRqG/vetLlNhUUsXusVuo4m0qDutLl311aIhkS9JSr3RV59BzO?=
 =?us-ascii?Q?w+9BrwQFl6XA7DqtQ+eWAEiOeKBeIh9QgzvmtwUR1q2dtS5kHWRVVi8a/Ob7?=
 =?us-ascii?Q?gTfBho5f8izlTFpxbwMBnWgkYKApHKBxFZ92UBxm4P8qMJkhEwVvjHlEtu1g?=
 =?us-ascii?Q?j1q/qkLzvhoYfEqivgLkYvaH/aTAhbAgV5iEjWkHYIxjC2AG3b81ZCy3xGdx?=
 =?us-ascii?Q?GvoC1eW6Vg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbb98e7-23c1-4f4a-6f36-08ded6a80e9a
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:04:02.2064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JPZvaKqQ1Y9EV5XtlLyqiNCyTz4YlrRVpIlhQHPxTc1mFpdGwchzBX1GjHVdRyhE+9b4ZbxeHNLqmiP/+4cU/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2777
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 13:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239893

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


