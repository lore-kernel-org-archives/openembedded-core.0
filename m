Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D7EC43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 08:11:22 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40162.1782893471307107311
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 01:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=p9pEmYx+;
 spf=pass (domain: est.tech, ip: 52.101.65.68, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UG14SlEp5baB6cjToIQAkIPgSttG/gEFDvGq+vbr20MIscIkOmwysaMB976qCac0GlLkBmWAeNlSpBDa3nppgZbigHBBwfq22Y1ckwsPikjGanQXCcvPg4PMMFlbPIxC4g8L0lsnHjJvC8qJ3xuUqnviG5P3tiUGneYGNtJ2HmLGtUKQIFYEHEmKeC1Dt+NkkU4iq5+LwcmRC3iMP/KOjtTxuNeb69WR0376GGz/AL0z7rusjUGSeT49ka9Z3tonJISYqOiXjwg/qQdvde732omU/TDECNqkmh3AdDCe9VW+Q6fhmQEdkAQr7u3xI78u3XVVtVkpZyrLgDuwqG/g+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7SV/JCFBMlC/G1yawBsp+Cc2nTU7uFmK6smBAcFNRg4=;
 b=MjjAGKKzuzmNU3Ajsj84FtEmnPMwBilWM4SJS4VusTxsGAaURPtY1y5xCpVM66lQyXzBOjmhfXx90UgvDmDZLPKudc5wOtoNyTM0k/kaZiUXksWPnnn03KrYnkkqrWeegYOcCRIZmAklATdkwPOGxtT/p0sWUNA8g149RyKW4Dn2m/ZmH47sAcBByP1YGE5w55ENZN0oY48ZW+NWDUS+espDZpadfUGcZheyDWf+LziKvmcxZzW+8voHKThAJJslb++0oXbs+G5P/U4iRw7yE8g4qdLUHnXXxcVyZN4Rg5ZMIJHiT33bU9brZUZrX5Nv5Trp5MpGvvOLsL0HFXRMjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SV/JCFBMlC/G1yawBsp+Cc2nTU7uFmK6smBAcFNRg4=;
 b=p9pEmYx+948prunaHc4hlONrGyRAVU8f0QfN2n2lCFOhokn8TGyp0pUMXnxKG0q8y9fZJ0aKhp3a0dWHNBfIcsSMmQlBE1aqExWF2gsuvCTxzh9pJrn9D8R2T2rOW82fl0doeJyZTlmEcKDqSH/eiDwGNNMWm83M+G4D/ixViXyhwGeg6CgMm0rlfme4ev/uXDYaPPp96IUuCzfZddpazKXBTu8XqS/TK2JMmTHWH4d/y9qug0So6Tq/JiYCc5O6li/Qa/8VReGKAr23ZoIOgbZHgHX3TMIbpzpBXE+njrdmhDHAIwYfuhMZv4Nr30ALlHSUHDk1+EJaBgo6h7ZL+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by AM7PPF017739B07.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::684) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Wed, 1 Jul 2026
 08:11:09 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 08:11:09 +0000
From: Roland Kovacs <roland.kovacs@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2 1/1] gnupg: fix CVE-2026-57062
Date: Wed,  1 Jul 2026 10:11:05 +0200
Message-ID: <20260701081105.68569-2-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701081105.68569-1-roland.kovacs@est.tech>
References: <20260701081105.68569-1-roland.kovacs@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0653.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::23) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|AM7PPF017739B07:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b0e7d43-5e23-44ec-d711-08ded7484e95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	yRJk2d+fhs102W/r+3pzoj1uWKk0/Un8bqcEaT5O6mdUAREpNcH8tby9dbXsfBm3FXya9STmyxMV9YI4ZqyK+XbqJDTQ4HyohNfwmC7+qv4Lda3xN0CtiLphkJG2japrQnsiL5Llr06YKtCh++LoZGlr/9s601tdyWzR4bFkUdUP8lV4WXaHMk150yOdrWRZfEoJFw07BcHYnKzE/VCDmky3ZOZ+owdYNdhjRWCUCgzdJgGVE9YieZ0S9D5egTdIoKSF9BilDYzAW8pogy6DG/sImN9A9G2z9XN7XatF2MTxlhLqvRtG+mwI7QDX2PYKwgp5c1u24EKjEM4gX0TNf0PhJuhkdrui1MX/9ceq+2FyoHGy7/FcD74bd0CNFM60aTyVUvu3Ri1ui1eAJjczjWg+kcrZnyfsmt76+LtHzrIaO5dR4hidtY4wJuGZzwi/gwuZBmKgEJnrtmnNZK4rwBkdtP+8CexHv3ixh2NpukYURXg2rIE+V5V8IdIN5Vdn8o6/Ab4zgp3XAa7T20mOTcepkkm7p3bk1vbLrVTSbqDi6q0fW4spr5lLthO+PmNpaGEaNumwxMEwZf5XDTUOqVS8b+fq2ubypbM6MmZufxOEEsfq8KPa8lYLC4vqH0g7A73zuuMn2bUViRzxNU8R+OgNMcR1AS8cKdFVckIGR3Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZwXxlTjE/Fdh/P6hFSLrU5nrQ7+tQ78B0ntola0jXnsLs4gax0aYtel/y/KH?=
 =?us-ascii?Q?TE7Iwh62Q3BuRJ1FNJ+w/cUd4iK7cg2LUWbzd7ADbzC+MIDor/aPh7toC369?=
 =?us-ascii?Q?17NpnIeseh/WVFXUqtolWRqET0iIQqyItG2qbD/5ZyM0q3iO3qmpF6G3XIPp?=
 =?us-ascii?Q?w6A7k2u1bY+zuHGoyS+XMG3gqiX4adPvBYqDITqFeCIhZTmWKjbS3HCaOpBr?=
 =?us-ascii?Q?3dVp/4pp21TEYeYAvlZzcjxItm8pu1J74MleBHicLNelUssHxMMr+hTxWYYV?=
 =?us-ascii?Q?5Wfa9J9eLQ5L/un1NVpaBNqnrbCfyMgbhkFlDqBUdqSQbkP+1dJgW7t4KfP4?=
 =?us-ascii?Q?4PnBvkbrPjWicu+tc31La23Rt93V7rSWA92ZRN2qFSdHChyxpY7n57zKftEp?=
 =?us-ascii?Q?NgsbW4BKSZAtMSmXjUIcDNdm0dLmV+yhSaGLi6FDx2Ur7wmiGdJJTuewnBIA?=
 =?us-ascii?Q?8sQUnYPBKr+Gw91/5GUNejJh11ksexk+AoUOc+0Vw2Qg/1xP0FLUD5cz3m/a?=
 =?us-ascii?Q?+5HKSZz3wb63sm4xhpn6lXGYuq7rrmyYPobvUVF+1PEUceTfB0Oz7c4s1hHj?=
 =?us-ascii?Q?hVK6md840P243LGEzgMtF/BHSGEZDaOTiudNp8WC0Or0V/yi7xiDEdPRYO6y?=
 =?us-ascii?Q?vSVVwpRzdYrnmSE1ylT8oEWHU0pJ254AHWnKrepB4ojwPULlER+K6hY7Etyd?=
 =?us-ascii?Q?eF6HZQXbPrzpzngs7x+cyis4+0aYQhbXbTz2xD33DhsqOPblwFdSOVs3W/CO?=
 =?us-ascii?Q?CSSHKq8dPD7LyhkjAmJwlmnkXxPA5Wk9oKWIZ1WCejWxcH31QuIpVxV//PxI?=
 =?us-ascii?Q?Mu3hQ6CYrrP4h/PGJQJBkeeLa9ZX2MY8comN85njgJyracnWLQnhRF5Ke3b8?=
 =?us-ascii?Q?iJEQOBdNL0rhCi5SQ8APMjP1B9n/DClnESC6BtfunQOeh9T0qOu0KhSTJacX?=
 =?us-ascii?Q?lb0TprH+r5Z7lXvCBu7vhx8gebNmVZK21+2jCjqa13wkTMuskPsaBekwhBq/?=
 =?us-ascii?Q?j3teZiT9fNz05UflqX0wh75GD6bmHTRCH47LLb467ooLMzt4RCCQ4UoDUbyD?=
 =?us-ascii?Q?fkd7AOsHc8nyer8CcSHBwqqNwadXhRCKJyet3bL86S0libQ+NL+Bv788VZYf?=
 =?us-ascii?Q?xWq16DS2dWYVH47b2EJOXBA/XyeQKP0yWO7Y4s6uNp3CEHST+FOm9KR7Q4uS?=
 =?us-ascii?Q?bIEBAwZ8+SzVOLPcSnOk0S7/x5UWgduo3uirk8kwNWxwXJjUC3y2VUmMYGjx?=
 =?us-ascii?Q?l2UaM7kn5FaS96KPQDk0EpQfI0v1eeXb6O/+sh1oxy9GHyLu/43uIcqcIu/J?=
 =?us-ascii?Q?YdpoM7wJ9u0DHwzOaU10c4ThQy7rV6Asyz+mHV+MV2U7DagdLrYIvr0gu5sk?=
 =?us-ascii?Q?A35PvXYM8+UKtoqm9sIoE68jf4U8/TEJ38AV91tCHpWsPaTZQm+OjyJK29Rc?=
 =?us-ascii?Q?9rJ70IM2srBzRzgSvk35y8gFPFHGv8QlZi8pGNke2GiHKqZYrAZK/QZd/elu?=
 =?us-ascii?Q?EstojZz1Oqpo2GwcYH/nQj7nQN99EKAQ+u/vYjyTc/m1ogaZfpszYEaidCvC?=
 =?us-ascii?Q?FLojUPkcCqWi4L18yqzGOjJd4d2hYEcmyWTaIL4jjQZIVoMVwW6fG4UAkHWv?=
 =?us-ascii?Q?6w4iLViluVwXWKQBdWAIF+Eau4zPRZxfNnBOphIsCH7Zp6zzfg6V41ALmAGe?=
 =?us-ascii?Q?A3SHQbCJrWzSTzxsWu1ykcH8Lw4LpIogvXqXZa/k1fjtFCWgQQOMQaQTNZCw?=
 =?us-ascii?Q?Um3wt0VgjA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0e7d43-5e23-44ec-d711-08ded7484e95
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 08:11:09.0250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wYJ0JjYaAYnvhDOV1kzNEsGX09skmxWhQgNdgJO7yuxT5d9IC4K9fgoX6abVf1iT9Pq2BCPpToYJsBMCbA2mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPF017739B07
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 08:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239954

CMS (Cryptographic Message Syntax) parsing in gpgsm in GnuPG through 2.5.20
mishandles the CMS format for AES-GCM because aes-ICVlen is supposed to be
12 bytes but 4 bytes is accepted.

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
---
 .../gnupg/gnupg/CVE-2026-57062.patch          | 43 +++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.5.17.bb    |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch

diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch b/meta/r=
ecipes-support/gnupg/gnupg/CVE-2026-57062.patch
new file mode 100644
index 0000000000..d18b9e9cb3
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch
@@ -0,0 +1,43 @@
+From 09d686f5ca09f1161f1e433473968d15b563687f Mon Sep 17 00:00:00 2001
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
+index c4bc57657..09ed7f8a7 100644
+--- a/sm/decrypt.c
++++ b/sm/decrypt.c
+@@ -1399,7 +1399,14 @@ gpgsm_decrypt (ctrl_t ctrl, estream_t in_fp, estrea=
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
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.17.bb b/meta/recipes-supp=
ort/gnupg/gnupg_2.5.17.bb
index fd6588769c..6b2af1c96c 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.17.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.17.bb
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


