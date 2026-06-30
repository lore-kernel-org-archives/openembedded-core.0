Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DACE9C43327
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 13:03:52 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20506.1782824629519947459
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 06:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=aDQT55vg;
 spf=pass (domain: est.tech, ip: 40.107.130.1, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gh+TSulE5CvqT4zQ6RJ1BPvoj/yw/Rkfp+IaD5WiBBYPzJeCMDd0oLoQm3J7XrvCkcSwzGcFsVmwo27FL5q6yb7M3UDPua4LExtGcmnltSNKHDKjlQyppCXvEa2yXOr86tQ+rCdI42Ds9rFa8N1VDeytVsGlSoLTd6IY585P4IFe8efSofdFInH/bXRVOXm+qdgYAjnpO5U0HZjD/FAhnrqL1X92W4v0LUSfnjAhOLeXiy/78AHHgCHdWXGYqErFfobCrY5qRY2BurxTcwPL+pIC1scCUrUuEdLDiIwMvEdl6sJAQPHN1DdpCfkmrqANr5xEunYzV+mYH2N+tvXc7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jOGiWaTEvGVa/PCE1u+DThjSlRuGTqt55uOb/vyNqQ=;
 b=w5mFZTQFKMMWLMLzeU+2Epv21rlad4b08kkLCIIyIF7UfKG5n1fmwr25OZBnhRz/2PDsQ2s9OdmBXX/Zm9MRs/wnOoPxwakzNs6zcw8F4z0TRPXphMzK4wNMYS1ZgsUk5udltNBODoHwK+SvC33ovBxA4f/PqrtBGW8DZaOeBH1Yk4c+gaHsR119JaO8coloy4UmuLI/fCUWaPUCb9Dx4dXp2hZw54jDQPNqpgfVl3DGHJ49QK4NeM2xuufWvuKlA0aRRe9Zhg2hkjv+GEBvXAGfX+lKGcOBvNnY3T64Ox7tqIV2eEy45UgrucMKWaQgNpQgV8VC/gJnPh9NZ2Wqsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jOGiWaTEvGVa/PCE1u+DThjSlRuGTqt55uOb/vyNqQ=;
 b=aDQT55vgceUiqMo147NsV8EAJWcMPhVLOhoJm82DhYy77+3xZ3oOpB8dLeoeUFTdtFcFpwcmvMqbQ0aYBO5Aus4MCJ4+HjFSK2Ttk+GuTmAo1h0dn80bprNWx4oN2u6NjRRl4NBdGiVE3he6FIY4hL8Tk3BNb8vnANx/aqCOkECW9v1r1DyEYPuHA0PWz6aZq+Vj4HegNkQWzfj4Kx/Y9M6UgZUpmzNzh6DXvkiNUFFVr6ICotcmeIHeqwJkz6aBGssGEMHoM/CC9TfgOdpjXbWh+wFBtsLcV3K6Uf1A677PdBF24z/2hRIfc9VAli6tj+RgehVpM/IxGU28ZOT6VA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by PAWP189MB2777.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:46a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 13:03:45 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d%5]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 13:03:45 +0000
From: Roland Kovacs <roland.kovacs@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [master][PATCH 1/2] gnupg: Upgrade 2.5.17 -> 2.5.20
Date: Tue, 30 Jun 2026 15:03:40 +0200
Message-ID: <20260630130341.71014-2-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630130341.71014-1-roland.kovacs@est.tech>
References: <20260630130341.71014-1-roland.kovacs@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0680.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::9) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|PAWP189MB2777:EE_
X-MS-Office365-Filtering-Correlation-Id: b033d9c5-87e9-4de5-bed9-08ded6a804be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|11063799006|56012099006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	1LmPN/NTCKXjMWAa/MLm2UzolKq9HY1lCZCgI+DI7XFis5TgB15MzcgwFdSUMkUmUyZE+M/eCeaTRPKnO+G7NggL3PmC3BI+XEvGpTju9IrBgITi+uzEqrO03r5SNth89gzZLbxROlqXgJd8UPuwE7qMs6AnvCnz8jJ+rK1WO+iF+scwev/4h6xLn2R95YiEkGW33PD7i3lIqeXsjP+a6CNwm9qXFLqE5riveWRaMrIiqW8dETKveXUGSj37PRGg7e/lNBjAlCDCYIIxppxSswdssT92YPjZCjQiSuapsXTUPz0PiBFynVxalgSp9GpVzJi0CBauIx5DiizI0zoQu8ZPs87VdL4rXg0yoWC62YHMA79tUrat61+9RuFvcWxH7Oh+LJOBTMKHXsLYEbbDOoH8foWzFudsv5tPx3SJCCOoXEM4GSELcF1dIIB0rhZtoQ83nw56QXGT4kPvKbsCAYeS6avJmLikVdkUhQfjc6M2vssjImkXhm9brdFNCuArneCJab08HfotBnBqsCnGhdQCCDMH4bFF98+cBt7Kj8/5GTbWRpXNWU/9ryanbTsJYCaUG+Hc2raVhjP8ZtGAVUUkVnNyRcj9AlpDwH+xqALjoa4biT7+wpcSY/T9Rxd4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lgXV6K8F/vojXDUeBxhCno1kyCuh3oDikfjX/vW+QS9x2sVQbTXZu2lhBIfi?=
 =?us-ascii?Q?TadIyWc/8EQr+5Ii2R8Jwutcet4OFWvMS0L5gFxFYZsmtbOD44YO91+zeera?=
 =?us-ascii?Q?6M1VBv2gZug4DjKAufmukrS7cPYoPIIlF0F8E0nWntNGwgy/z9TxnzZwJdrK?=
 =?us-ascii?Q?8YEfMRLYV2rGe9lO5Ic/X6wNfEUUBy/5Ob1x4m/2JotVSUbYyLaGc/7a1jZm?=
 =?us-ascii?Q?+skh6W2bEUXr0Mpmv+0zoJUqX45fV2FV+ipX752iWeUwfiDvtMISEwxr3I1G?=
 =?us-ascii?Q?AZ0BInX7hoORfHl4Ir+AevmxqqcOoEBTL+/zj7oPVZy000ArJ1kSUHDjiCdE?=
 =?us-ascii?Q?z6Hc7vwuxnO4kxauYxNY1HHapenC9MOOg0NtdiPqvqpvHylL9WX/o2VqnyD/?=
 =?us-ascii?Q?21IzQZLCjXcH4Dp7JApGuA4t0JRngFbmtM9vtPZ9/+J1AXokfsRggQL1Ouv1?=
 =?us-ascii?Q?BvmydJ1+2gXtKEOEuSKuFL6LxtRTnXkaR/Ild/h62u2qbczqHRKNFuefe8AC?=
 =?us-ascii?Q?1X2XI0ZHaX3nElNMy2Jni7xPFDNnAGyrdfEWRoSG8i0c5T4euIbyLxCp4d4K?=
 =?us-ascii?Q?SAOwMPPhmptrZzlb037WTQCZCXyHQQSBjrM5hOXUVdetLrF2IOS5fEh7WJ36?=
 =?us-ascii?Q?rOuEy942emuM9GwA8oPsMWvHsgcAdIJk+pfT1DWSjNLkhd2bsnAD9Alf9gvK?=
 =?us-ascii?Q?0AXvXc2Ghwpd3HuIF8zzUEox3R2cW4wZpx9RUJuK3ca/b0BoUw3cz6MpTpCI?=
 =?us-ascii?Q?/XEgjbT6WX9DtwJ+zwwoRtzCK126yZgTyD3MhsKFCNPoJIyptBnUR4uWBiUL?=
 =?us-ascii?Q?hagayKJzi4wAxF3bb1oWtSvMossjgYxc5qrn6E725uLd37i8llFlOaZ3iAQB?=
 =?us-ascii?Q?MA/XhpX2AwKEf2ynQ5VXJhODD6x0VQyaMfoCYRQSsrj8ZExNuUwCxnN7091/?=
 =?us-ascii?Q?x7LOpKq9GRKsiFYmHuBslygRB101+ujSih7MR2Zzu1lnDiECAD+AqkRcogei?=
 =?us-ascii?Q?6MDNvysM6GdAaznAJqjAR08ZTT0hWjmJVa2SmePKMPS1Q6wsdFKR2qyAVWwi?=
 =?us-ascii?Q?ZCIOOqJa/c0CIwU1fXNHEDiwdUaptqSUfBrqJCUMPHfkOokMP2bRMIf3H5ab?=
 =?us-ascii?Q?Fe6rGHqzroVliz/b34y5OIEsO13mgjwZlV7cMaCB/h44J1UDHVBhCgacSab2?=
 =?us-ascii?Q?0IkIZSQBM23RNx9tBFjiDMft/gbe8st3PnFBUAwHnXFrm5JZxCnD7pUz5Y12?=
 =?us-ascii?Q?4r35w7axLkqTi61rTaBVYEidyW8ua8jOVDGx2UDkPhcS3nYXBjN593oihXW6?=
 =?us-ascii?Q?iMwzvvaoy1vxl0ojTYqsOjWZm+NC+5mx5lTc5ROGkwcGLyF5Ewzs16qYT8kt?=
 =?us-ascii?Q?eT2Ojx66agG0AEJD4ww0LjMggRnYkaLfbmvXCgCEPrsWQaMSgwIRDeCpDL5R?=
 =?us-ascii?Q?QZOBi4zxh0gLTDZ8YtJjN3PQpqLxt/jMDQBfv9DRyyYXlRxEuHpDjQXQu3bi?=
 =?us-ascii?Q?ejTAW/iCSlj6yoYkSn7fyUIrESIhSgNfA1AE6XTy/XUJLA72OzymYbVlwVWx?=
 =?us-ascii?Q?OaBtw+oIRYUZtmSRDHENbPUrh1aD1ce/NyCtFb8FD5Pgda3UjIqQTEIa4Ln0?=
 =?us-ascii?Q?zJHY5glMOXqk7neENIhXGUCrM2myjzkoMV8qHfxxOWK4FlgocrkKmlrZ6mX1?=
 =?us-ascii?Q?zWnC6WOe2hkSzgqQ6UfOY+B7PB6AkJdFNt4R0RK2ufkBwlNp2bLeOVxh7m7S?=
 =?us-ascii?Q?IGbWCqTRZQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b033d9c5-87e9-4de5-bed9-08ded6a804be
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:03:45.6896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVJqYY8pFl5NaZ+kmryWwEO7USWComufBBTng5D/vSf3v0VVCnMD0ty7R258rJ9CtDq3QMDtg6QHv+CQ1q34Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2777
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 13:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239889

Bug fixes included in this release:
   - gpg: Fix wrong assertion failure which could very rarely occur
     during key signature checking.  [rG693f5642f6]
   - gpg: Consider certify-only keys for revocation signature check.
     [T8196]
   - gpgsm: Fix possible double free in the CMS parser.  [T8240]
   - gpgsm: Fix possible too early removal of ephemeral keys.  [T8236]
   - gpgsm: Avoid emitting a final FAILURE status line if --status-fd
     is not used.  [rG69c27fe377]
   - gpgsm: Fix a regression in 2.5.19 for password encrypted GCM
     data.  [rG60a823c97b]
   - agent: Fix not using cache for pinentry loopback.  [rGd4b608a31f]
   - agent: Fix command PUT_SECRET by saving input line.  [rG1875bc185e]
   - keyboxd: Mark keys searched but not imported via LDAP correctly
     as ephemeral.  [T8048]
   - scdaemon: Avoid buffer overflow with SC-HSM cards providing RSA
     keys > 2k.  [T8244]
   - dirmngr: Fix uninitialized use of the dns_any union in
     dns_rr_cmp.  [T8251]
 Release-info: https://dev.gnupg.org/T7997

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
---
 .../recipes-support/gnupg/{gnupg_2.5.17.bb =3D> gnupg_2.5.20.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-support/gnupg/{gnupg_2.5.17.bb =3D> gnupg_2.5.20.bb} (=
95%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.5.17.bb b/meta/recipes-supp=
ort/gnupg/gnupg_2.5.20.bb
similarity index 95%
rename from meta/recipes-support/gnupg/gnupg_2.5.17.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.20.bb
index fd6588769c..a1a50e2384 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.17.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.20.bb
@@ -16,6 +16,7 @@ inherit autotools gettext texinfo pkgconfig upstream-vers=
ion-is-even
 require drop-unknown-suffix.inc
=20
 UPSTREAM_CHECK_URI =3D "https://gnupg.org/ftp/gcrypt/gnupg/"
+SRCREV =3D "343d0cb8910441aa44c56ce8673a78e137040c87"
 SRC_URI =3D "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
@@ -24,7 +25,7 @@ SRC_URI:append:class-native =3D " file://0001-configure.a=
c-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk =3D " file://relocate.patch"
=20
-SRC_URI[sha256sum] =3D "2c1fbe20e2958fd8fb53cf37d7c38e84a900edc0d561a1c4af=
4bc3a10888685d"
+SRC_URI[sha256sum] =3D "6461266e99c308419a379abe6c356d54c214136c4589bd6595=
1091138989ffc6"
=20
 EXTRA_OECONF =3D "--disable-ldap \
 		--disable-ccid-driver \
--=20
2.34.1


