Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98138C5DF8C
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 17:52:19 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1192.1787421126431531265
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 10:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=fRtbqOq3;
 spf=pass (domain: est.tech, ip: 52.101.84.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uS7hGrRDnV0lY2f6qrhUC0ImHMUB7IV4TlFWC3zwVNAOFMz7TFTk/yRauQneJpok4ySnm77sENCx/1Y3gJj/koWopQ5027Da2yMwRigCFSpGzktWEdGYWgQwCXDSJ5+B8ABFCpHVT/udOOMo2MB76yAnpow1rhj3MiOVuXClTUhXlYkeAJhjNJWADpgW6dOe9E9zLeh6n0ORhxL/vEcKcuaHnbq8y6NbnOG8s6CJWyi6cZReS4rs3SeKHAhBEPCEvJteaqR1KMnNBKhFbaCiCGfKkAmsh6x2f0ECx5VdeXanI7QSGVOaVmqDgg049/ne5B2ZuXFh7ltcCFBJNgENMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnpQqhiTijQD2viIb0eklZ9CPeDOsOv5Wm0kLohqvzY=;
 b=jeuoqvfkfcgysyS20B24Ql3UYofWsLgnXweRKnFK20Zx3kDmT+aLGY1GA4l1jNjGFlfgpmJxjQCc7ldOUxDOd84aza8HQF3C4dzg4b+30qBg/obwAITIAHxJ9sIw6rrKMKZxnyPlk+3yPLKETXJVuGgjMjeNpOAKCi68MDLXv8H9HGlGhwnye7v6saEuD6z1cD6e9QURMQkKaaLGQo231qheTAtu2lQSGWeu6VPiHIUknVzRGvHisJxiUktPyipv2lyhp0p8upuQ/wU6Ro+Y+RD8FlQupAXfqiNdgbtrSTAjX8TG9tHTP0qKsiR4+rA7gLTAfQrhMSEw2BSPJVaO4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnpQqhiTijQD2viIb0eklZ9CPeDOsOv5Wm0kLohqvzY=;
 b=fRtbqOq3H0XNDqrSSy4lfp00HxTKnJ3RnAKnAB2mQ2N3VpIlP1E+1MQqmB4zKXGi4DJh33rjEtvf5z1l/TYNZNKgmDMy9PZcgeooJeakI8wxyoGkyBc5xuB25CuTN47EppvRoyLB/wz/1lzjhywptgG/w+iPnrzDcUZw/5+kqkw0c1PFgcQlKKs9RWPU3lGVzzgKUxWTSy8bEBqeLq0OkBjhFVgU2uHEsADlHjCavGXUj++hKnb3GC1V6vpWeYm/hsuAYCzJOnFHWnAsE+Bd/4OUQXJkm5bYRJJZdGoVwWx7mG+EPTeczeUMJTxHmxEVs7ESbdkutK53/k3JDOvVPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM0P189MB0641.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:1a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.5; Sat, 22 Aug
 2026 17:52:06 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.003; Sat, 22 Aug 2026
 17:52:06 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [RFC v4 4/6] serf: fix build with OpenSSL 4.0
Date: Sat, 22 Aug 2026 19:51:58 +0200
Message-ID: <20260822175200.57534-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822175200.57534-1-jaipaul.cheernam@est.tech>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
 <20260822175200.57534-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0062.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::13) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM0P189MB0641:EE_
X-MS-Office365-Filtering-Correlation-Id: 18666f4d-8c18-4a14-0f9a-08df007614b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|23010399003|1800799024|376014|366016|13003099007|6133799003|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Tpxp2TvhwCUJYOehlV2tRTIC7x4tk/+71ZwtaaMsVOmDCUVZt583VPB8hCkIR4yo3b8t9zPcZ+weSA6fji4PcYx2BcH/kpDn81T0S6kZoUYZuVIDDOkJ3JAj+05k9aPhgqXRFdYFi0ZiZuwH/fuHZSrCLNu6P/eLtFx5UgWw0i89RpxH2dLlh3240jEMMksGPvVNFVB+Qy0ugR+Cu9eTo0kpRJiqoi7mh0SWGnm+8CnAKt/ibZzVaWHS9rFp8Shs9t5MieUiNEI0Ocbz6an5ckpXSCLlc/dqFHmQ/8dPTxQjdONDVRq3/w/PSiPLtaki6hFT/HU/jCzEtFmrlaMZKN1zlUcmscjw2+ZrohEkZM/HbEpaQ6jYe1rq5kWXAP9ZNoq2bFG4X7bYrWQpLnGAaK9qpIamGuCPTFloOMTV9MgwtF9J2Yz4uBCDJrD+E6CywGQzxd3mPH5ffhzkEATLm9jmoG8iMOAPNGv0y7INvV0hFL6GhBWlznpFLq/4CkyWZSe3tS7m3HMC4qW7aCkx/Ed+ll6tV0lEpYymX/DDTbHhmJOBSCr3Ag5NU+Uvgqvn0B46svjVI8/iDAji2BuaNE+PwynEtzvfO8rZvj2XPUwXQ4bJEJRb2ysZ7ThFc85HGn82tXV3nBhJyCxI9fOb+SBsCUX8taL4y+ww1xd+fVM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(376014)(366016)(13003099007)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IWNtWKKRdLAUqDHz1xekFhyIkW5qCObOHHCYBTzSNuDbg4lKD+wFl5m0vGtZ?=
 =?us-ascii?Q?Sl0DBbZiboG0bBFj1+hBu7EwMU2X6FKRjBNBTqax2Pxx3xePygJc2QSBsrNG?=
 =?us-ascii?Q?T8RgZD3g+ekrAISTgBF/v+INaTcB4mLD0/I+57+FscNQJdFhFS8Oz3t3DkjF?=
 =?us-ascii?Q?HPriR4t0FsPKegdwv0+zDn1o5uwk+qk7V3QQEFx2aqlpaCESSMCKr9CyvSfS?=
 =?us-ascii?Q?MF+OU/mCjo4dJGnX92ovNgJC0Oga5YHXrWShVDbeLVU+JAOmzMxT+yISFZll?=
 =?us-ascii?Q?3ep4UeRycLvYcWsyyk96ub9SUYcsEeWgDieClf6LrWcPQfDJb/ogsUgYA+rg?=
 =?us-ascii?Q?UnHJb/Nvb5QQc75PTwLbH4wrM8fN6gEyxzPRgf4N8ruB1KIZi2NUV1FcOi7u?=
 =?us-ascii?Q?QdS3a1Uoe0rZ65XbsGID5/y1t1PWQTeqkAUwkYwtrS1HsDCEfrRxTZmxV1u1?=
 =?us-ascii?Q?zPvKvtE3YI9wylXXNU5mXstPIKY7Kx6yXM5TUeJfu9BqmLvaP/+Ugbmw4uaV?=
 =?us-ascii?Q?Y+NgDHprKg5shXM4TQw2tmWLsUWJZUd5AVrLCrKshuibP5UOFg/U8YJT8jte?=
 =?us-ascii?Q?tacs6FkVCoyJaTHFdApjum5ERefhuw7ASM/SNu5eVqFUWhU4qG7ZKdcBDlCv?=
 =?us-ascii?Q?orm+uYEggaeD+1nGJvjTc3O9b3az3JDJ4hcvYo2vtULR+gpYVzuwUhVlVelw?=
 =?us-ascii?Q?k0hr5wh9geRrdJfgFxpAE3cmEtunZaBTGziAyU2iXr8ydzEXeWHcFw00hgNB?=
 =?us-ascii?Q?pWcYrE7paGBMlH0cEqRplt20TZy7wTB9j4PnGpwdWrsR2nqo4UePWGjwP78X?=
 =?us-ascii?Q?qSs2pMZpofd6EG1HNx4C0v1awoVK2O3fI28aZbjTjOmQI7NeW+hhf8q0k6eA?=
 =?us-ascii?Q?/7g+n8aV1b9Yf3WBcvgQe+R0Pi3WwvIBFpkkxJy8XRyTlcjH/kO+OP7nAVYL?=
 =?us-ascii?Q?9SHdGYv5u+ZpaX8A+7Srmv97guw2DnNDa7S7dGDSyDigI8ML3wIhkPj1X5/l?=
 =?us-ascii?Q?MKa3t0MZdowglwU7WUAyc+4jto3lNDCfg75DjmXm0eY3Sjx8q6fCEeFxJLPG?=
 =?us-ascii?Q?aS/JGLyj35c1gGyOpjTfSbLEmR6GOc2u3IwaypDLU/pTMqNG1OLedjfj+N4Q?=
 =?us-ascii?Q?tTo5SmMGxBFS8rN+2mburfgUqtmVn0dy3tGQEnm54rKmFwN7Cd/ZQHLXbUsf?=
 =?us-ascii?Q?EVK0QLnzTDJtRo/dmlRq4EUxG2X18lqBuCiQoRL2E/+yRGCqLyiuJkFmHsNY?=
 =?us-ascii?Q?B5Sa4mzvaJ4WLaO67LeZus7LevV43kD9dKQ0+MoaOW8EaGPSgJJyzJ1uuM3k?=
 =?us-ascii?Q?j05GE/9byN8KFF6xiueIupUsEicXP7drz46KaGHpnQG7rpLbbp5vRNdPA3iY?=
 =?us-ascii?Q?Rfgo4Z9NxKXRbF1C4svpnKzuI3RC6JuvjCJAahKqabxA3HRUGNXRd8qmEI/w?=
 =?us-ascii?Q?9Cyk9I+EF8rqFpnAwgX5T6mgZyIQQZJnT/du3IiMj7GFlei1MF9tcG8FLVCJ?=
 =?us-ascii?Q?jdIxssctmGBo5fjacUObySd4Y6C/2LX4h8C70bEudh7yfUD+bjzkRQnmrFEs?=
 =?us-ascii?Q?Kg/SGeuR9K0vqA7d2hmeafKX8BcETvHFa3p8CkkxanPEKhhhfuUMS2iy7dJe?=
 =?us-ascii?Q?6qrdlpt2O+UckoVoEn2khrQZKh8eQOqC474PTgK7N8aySiMSU+Wr5ri20sob?=
 =?us-ascii?Q?RJ7I3i/supw88dEUzgLqgbDFu9/lm1GTxL9X0O5QGOHk9iCws6NwA0f5LDCj?=
 =?us-ascii?Q?5WrCO3GeQCdBEYkqTmNsoeWGKl/0wmYZ4ZIHMksHujLD6lJMYtUb8wPl8xfi?=
X-MS-Exchange-AntiSpam-MessageData-1: FO8SKCyb/fcmqLwAc6iBaBXvQqUyoVlXR64=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 18666f4d-8c18-4a14-0f9a-08df007614b5
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 17:52:06.4735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+528EJfGG6E9JfbuQopAz8sEApKMTYjOl+vcbkz7+3eGPSi4acIlzVsS40KU45QXSHvXSZTq4fWmkkNTHinC/bU+rq7oDNFpR1fgSByhOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0641
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 17:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243996

OpenSSL 4.0 made ASN1_STRING opaque. serf directly accesses
nm->d.ia5->data and nm->d.ia5->length which is no longer allowed.

Use ASN1_STRING_get0_data() and ASN1_STRING_length() accessor
functions instead. These have been available since OpenSSL 1.1.0
so this is backward compatible.

The fix is already in serf trunk (r1935023) but no new release
has been made.

Upstream-Status: Backport [https://svn.apache.org/repos/asf/serf/trunk r193=
5023]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...penSSL-4.0-use-ASN1_STRING-accessors.patch | 35 +++++++++++++++++++
 meta/recipes-support/serf/serf_1.3.10.bb      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/serf/serf/0001-Fix-build-with-Open=
SSL-4.0-use-ASN1_STRING-accessors.patch

diff --git a/meta/recipes-support/serf/serf/0001-Fix-build-with-OpenSSL-4.0=
-use-ASN1_STRING-accessors.patch b/meta/recipes-support/serf/serf/0001-Fix-=
build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
new file mode 100644
index 0000000000..2392cf1dca
--- /dev/null
+++ b/meta/recipes-support/serf/serf/0001-Fix-build-with-OpenSSL-4.0-use-AS=
N1_STRING-accessors.patch
@@ -0,0 +1,35 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 13 Aug 2026 11:52:00 +0000
+Subject: [PATCH] Fix build with OpenSSL 4.0: use ASN1_STRING accessors
+
+OpenSSL 4.0 made ASN1_STRING opaque. Direct access to struct members
+(->data, ->length) is no longer possible. Use the accessor functions
+ASN1_STRING_get0_data() and ASN1_STRING_length() instead.
+
+These accessors have been available since OpenSSL 1.1.0, so this change
+is backward compatible.
+
+Upstream-Status: Backport [https://svn.apache.org/repos/asf/serf/trunk r19=
35023]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ buckets/ssl_buckets.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+--- a/buckets/ssl_buckets.c
++++ b/buckets/ssl_buckets.c
+@@ -567,11 +567,11 @@
+             switch (nm->type) {
+                 case GEN_DNS:
+                     if (copy_action =3D=3D ErrorOnNul &&
+-                        strlen(nm->d.ia5->data) !=3D nm->d.ia5->length)
++                        strlen((const char *)ASN1_STRING_get0_data(nm->d.=
ia5)) !=3D (size_t)ASN1_STRING_length(nm->d.ia5))
+                         return SERF_ERROR_SSL_CERT_FAILED;
+                     if (san_arr && *san_arr)
+-                        p =3D pstrdup_escape_nul_bytes((const char *)nm->=
d.ia5->data,
+-                                                     nm->d.ia5->length,
++                        p =3D pstrdup_escape_nul_bytes((const char *)ASN1=
_STRING_get0_data(nm->d.ia5),
++                                                     ASN1_STRING_length(n=
m->d.ia5),
+                                                      pool);
+                     break;
+                 default:
diff --git a/meta/recipes-support/serf/serf_1.3.10.bb b/meta/recipes-suppor=
t/serf/serf_1.3.10.bb
index c6b51452aa..fd3560876b 100644
--- a/meta/recipes-support/serf/serf_1.3.10.bb
+++ b/meta/recipes-support/serf/serf_1.3.10.bb
@@ -10,6 +10,7 @@ SRC_URI =3D "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2=
 \
            file://0002-SConstruct-Fix-path-quoting-for-.def-generator.patc=
h \
            file://0003-gen_def.patch \
            file://SConstruct.stop.creating.directories.without.sandbox-ins=
tall.prefix.patch \
+           file://0001-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessor=
s.patch \
            "
=20
 SRC_URI[sha256sum] =3D "be81ef08baa2516ecda76a77adf7def7bc3227eeb578b9a33b=
45f7b41dc064e6"

