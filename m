Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C308C43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 08:26:55 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40299.1782894408228268543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 01:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=fGCsFajd;
 spf=pass (domain: est.tech, ip: 52.101.72.69, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmzFdMtaSwBZkk/gRaPCRQU8Qxev34CwjK699GgslwVbGEkGDBtLyaJt1dVcaRmtQUlmMEjBuIMxl5yMf3Jk7leA7140KrUl3l2QcSLHUmDaSoCwphEuHdvPBR2pjIJvYpn1EHsLYVN9qG3bqsQQzTRQzVBJaV33Q2Upi9iLYvIxlFc9PlMzQU5f+Gv/BhqCC+VEVeIvSdbhrPXZ2RTrLkxitPhYyb9CfD+V/WcZJfhKPNE0NFUyyCNlOFrASTFUIpKqKkZgqDbxaDtHARkdeF634rqADO2Y1+0pfDtDwnsNmuqSLO2tbkEV1iJLTN0XPdX+PboPCg8byCHXfmZlIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypJMBSw6At3sX4wJt3kEtc2dr7vtEe5n1xB1hjh6aHk=;
 b=UlH4VHQn2IvBuuLJ7ngUXKhXq+3ge3mNQR8NQSp/DqJ+sobEWfwBe2VrmMulDT0xLeR2V33x9yMAstBba5RMr8Ne2DP/Sj76QitL/WrBXyIZfONtcLFvPehwrzXCy+pFdtJ1u5EUAava6bbbVfiO77ed9Jj6DIO99vJsKuO5cFbbiRQgoAN3eyEfp3/C0fnbb5p+CX68KpMHCruwZm5kSJ/cO/fubzCi7GVUJlE4o2cUXllnOzBJ27Cq0Carf7MVFhcJ7P4uW1AXmVItR2arkXLZBrQpvUHpiW2aa+2JtZK54LM98rFXCwR0ch0Mgp3SEyjciR3w1aqG/bq7HyhDqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypJMBSw6At3sX4wJt3kEtc2dr7vtEe5n1xB1hjh6aHk=;
 b=fGCsFajdHyH0TEnCc+eprG8XJ3OaxrKKTTHCUucM0oWDl80xnPLVPyCDzQ189llZKamA+T65L2plPQ7LunM7GJUBi/m1yorEWNvbwfRN6AXQa8N/DRJsiZJNpLGey5IvuoJ5QtMFArUUzDt4Kic4htL+pwlp0mKhwfF7FKhKpSJDtz77xzTtpjTPqj8F4aBetDAlsXRhuJd7VtP4QawDtwkmQ0MPgRJgaqflLvobkIBDYdd3QJea63xKKH5ifc4XICitnFsnXnXM7dLLOWK8xaoVwRUuCm4ga2VyrqDuTYz/Yptwk4oCaP4UDAmvcVLAIkcoDA3LRxO2Q2zuurgbDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by PRAP189MB1873.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:278::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 08:26:45 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 08:26:44 +0000
From: Roland Kovacs <roland.kovacs@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [master][PATCH v2 2/2] gnupg: fix CVE-2026-57062
Date: Wed,  1 Jul 2026 10:26:39 +0200
Message-ID: <20260701082639.69648-3-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701082639.69648-1-roland.kovacs@est.tech>
References: <20260701082639.69648-1-roland.kovacs@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P250CA0024.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:54f::17) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|PRAP189MB1873:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a87df68-a3ee-4bd9-7c72-08ded74a7c5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|3023799007|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	cZZfzLxHTGSt4JUQPCkQHRF7xLw1+CqZY7x5YDNzWC18Iz6N8EtTQgqAM/Ac86zIlzqQPRM5HaYcIWn68R+Kki61foqe3Dw2asqlzwXmdU583s3c6RSs0d173vv52a5zP16MjZJ1SN5eH9Q4U79j2L534evs+zNETlo0U41L8LGuYTvEA332Ala2+mIw0bL2C+wIlL709JDWxQ5YkDf5huj1sMNVRnhH6wjNKPy0n6OJ2ufhQDHVVmzm/zqslyKnseY+3C6Q2i+nEg/wQ2zjuQo9iVjYlvFIQQ04W3c07RDBAylYFZ3JbSF1X1psAqn9ZLlgYtdx4ZbR78wuA3B0KB5xQ3z4o5J/Uf5URNZ4YRo6MXYYEHUt/N10TSbpvcMECeV5V7U3lpyfkKAuA2nGnP5XWuVVYgwXM3YSmL6vcRD+6mMGbVuJrZEf0yrpctMFZso5BSR0DUMYng+maE7UDqx8P7u/SDz0kXsHCPxtRbXmI5aWnVDGTKpk/2XKDza//T1dml5sICADnpKPvvsLJqRnKqgAKXqVlqGVeDr6RJmcCgj2STsm3xXyzPSHqvPkDOjTZUBqnKph9v9zrH/3Q1TnMblCe+ofgYcujmw+oW20OXMH5d/G/RonWwOrHSSlPft8LlWA08aSFNlfs0NQ0fuTfcI4Sly1hD1/mdcxtt8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(3023799007)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9lp2DivM2SLS2uNtapBcEpEIElkEnXx8UGuRxcrSdLAj4dNLeVWOsD65NNYG?=
 =?us-ascii?Q?Uf7lfG5PEoh+pm+8ECI+dO+gljEvzXxRdsoorbTWLXkOmmtJcCFgLTp6iRqr?=
 =?us-ascii?Q?DJGwOhSAgtR9kNPP/4HA7vIftLpkYTlpgNGHRXlbeDa37DW2k2rsmAOivHr6?=
 =?us-ascii?Q?z9IqGxasmsa82rMe93d53rcL/6QROG266CW3YACCoy1rys5WEYKY0yJ65OEt?=
 =?us-ascii?Q?0AwmnVBTiKctyrV5Jil3ym5jn8wcZrQ66GvGh+k9enW6Qml+ez0k/wAT9FAo?=
 =?us-ascii?Q?0ewLhoVPIGJMNKNCKar664Tf2ZEIsEGk7pgBiOSDhr4/bVY1OyFJdkVPVwrJ?=
 =?us-ascii?Q?VwZ5bdJzYiRxBHF/Yt72tsCq8NmzAniMJ58mvlF+O53saav82gI0RskN/rZJ?=
 =?us-ascii?Q?QlEdlMqzNH7rVXbwHMAT/3/JLmUyqLNwLm8N9K3zbUZHwQgyoPjrdTAGdRXV?=
 =?us-ascii?Q?RxdSc4A6nkqBz1T0cOklGfYoJ6CpIeTdjhcULqRcP2Wl6iTlAy24HPE+GhZP?=
 =?us-ascii?Q?3msP/4mPeQHIynzPh4iQxtMz5200501B+PFn830eUBFe86/W4uMX0nBIohpw?=
 =?us-ascii?Q?lfwJYABNMcWTz1Yx+/WeB+PygIO0yoJ6Xg2BWakswIgvTXZOdEQ8JP8VmHQh?=
 =?us-ascii?Q?H8MaLyjaw/5cQuMcVIUfgSpBIS/BcnQRPbKPkGb3v1e5dfQcpanZIaPrvddX?=
 =?us-ascii?Q?LtT2kYuDeBLgcYS6iUxrOkbQZexrq9hDopLGy+RnD1mvR5M4zR73epQZzwOZ?=
 =?us-ascii?Q?FgBQP8U7G862s64GOR/dUQwAiLTGB+cj4CfPZFsKckerMAAKW+cKqkU15ZyS?=
 =?us-ascii?Q?zv8A01VfzN/bA5xvUz+dOrEZUQr6VguZO+HNjOgKWPH3dBp1ZbuCc6dhm42I?=
 =?us-ascii?Q?u93zyRK2uvoFp1EZcgBFTXc3pe9W6r+xQ49Z0ehiYo0vdaqiPvAhscHC0tAs?=
 =?us-ascii?Q?0OX5KwC3SCeik+fCDB0F3UTBL6LoqdrIr+yHCp0FQY+kYYuYMifK/mq7c3OS?=
 =?us-ascii?Q?a8lS/C0vw8Loy1Ykq08lJZlGBwpZ9SmVB1ZGRmxJhbfugt+TBLcprISzDcn9?=
 =?us-ascii?Q?vek5QKtQtyOjAyrF+WFQ5nSuUhU170aPwlQXy1P3X4F6+WCGy8FjxwQMAwR4?=
 =?us-ascii?Q?PKN36twnke6/C423VnC8YQhJcYDxsrcLZQpOMSXkgz1B1kMWfZr7XoDD5/cT?=
 =?us-ascii?Q?athO3u50OChD8A1+ucSwEi/QY1j57bJPqLGkZIIFY21y5LXQDqE1WFJIBPaj?=
 =?us-ascii?Q?oLxcAAhPsvREESRmZcTn8Z/xZJoy5w5be9dk01jUKMZbE+DRNjQddK4CWwsR?=
 =?us-ascii?Q?m/o2xPKkGyVIUjSTlmGLAIOgfd0vJp5br79MS0b132Xg3CSooCGjPTn962Q0?=
 =?us-ascii?Q?PTezLI0MiXV9Ku80O8EkewoqiwSXHltJZtjDGJZvBpCE/DM7PztyjupwRJdp?=
 =?us-ascii?Q?ewyj0To86TxI6aNCSIEPp0oka/ioXj5xpiBpTS6kaADH5iAqorq+ikKmJd2g?=
 =?us-ascii?Q?xGKz1IfAviE4+72ovRuMA2dmZ64h1pbhpEqDXJyZSGeiC41rZ1+IboqSuCxR?=
 =?us-ascii?Q?NkJW44Jdpav6sSrLXsqmAk8ZyQkK5NS04KPvLfrF3Jzknx4TCiyGMM8RRsBX?=
 =?us-ascii?Q?Z6msqviAmRyAnV04TvUcBLfCw0HqST+CLSMIHEY86kxqrZ1O+TVEQkHZdftP?=
 =?us-ascii?Q?BZIbPig8D8UPztio1VxoOGKuI16uuGR0lq9xycHIDLJkCvLtflmWa+5y0ljF?=
 =?us-ascii?Q?Ffl8+I3+6Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a87df68-a3ee-4bd9-7c72-08ded74a7c5e
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 08:26:44.8858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9rnPpIDQq3bYTlH1AsM3ryFeHydoZavNFHpYcG+7zTnw4X7KlzXtHppAXZUxHapHof39zOU9ibJRDE1OUxf61w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP189MB1873
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 08:26:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239957

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
index 68e1316668..4146b12824 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.20.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.20.bb
@@ -19,6 +19,7 @@ UPSTREAM_CHECK_URI =3D "https://gnupg.org/ftp/gcrypt/gnup=
g/"
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


