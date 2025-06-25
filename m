Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336A3C7EE30
	for <webhook@archiver.kernel.org>; Sun, 29 Jun 2025 18:55:23 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.44])
 by mx.groups.io with SMTP id smtpd.web10.20535.1750869768056419557
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 09:42:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=azQ6SRdO;
 spf=pass (domain: est.tech, ip: 52.101.71.44, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nYU2De/l/Lvix19LJwL5icXTHtCdfwDmJwtTsXvpuXlMuvdnb1GoW18NhjSDFosgmughS1PUUmfBvSBTlL0wQWFffKoAkzHY7mFp4A96pPZuc8rI7WGezk3hhCu+ItHCP/qHaE/TZsIS5oc5uEcbe5H0qwDrIxtmTnZGh+7qgbPRysO+U1iDR09NQcR5iAac3g8WPVO7dATFmAOJc7C05Xjuz4iUAYu+CBsF1+CB7VXOV2VnEEo9uE4LJTmxUW7vB0QUW8W8K2KG15T26Ygb3HRJA8jB0FZQOM4a+qq1MIcAllINyXw5XaYJc4KxD1hqQE5ZRXFca1rq+jZnxKTsWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3NvzgxEmRy33O3A6XWreAeEOyOsV2ZogAoO0K/8OhQ=;
 b=TdW82aezGfX7PPt98KJaCkdMy12S97b5vt1JwhwP9uYt5VmVUwBaJUNGLSrTSBBAgfQfylK0ZYhBshaS9sK5b0iiSjDB5O2tWtOum8k9P1n7cKYwBI+spUjwz9SBr9uAzC/pOZsOm4u32HVR6rpmmmafkIrtFQMnJk50qgPq4C8BdZqRn710sRjJI+l+zod3SI1naq7Z0FzI3wnJ8rs3lp+SRJVFFNisFj6uuQJ7blbHHW7QarhTmsPuknfYGgBFTPsCQDobstyUOBNlW/IqH/rKW+Y3UM6k4z3zrEInG7l6tHLV40FB+wdLApNQbJFjgQDkR963PlBrzQqHFJkdww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3NvzgxEmRy33O3A6XWreAeEOyOsV2ZogAoO0K/8OhQ=;
 b=azQ6SRdO/Bjrxurqn/C2VU2LDGr/qIMznyrzjQIL30jAySRbaFPcUv2Yl2AbSM2g8/4OViyF3oJKepuH1yfYjzmEHqwLvTNGbhhsV9iNQI7vM4lYAoDJVGwU8mxTsFJEqW7S5j39SikSm+4lmFBnI3ZQTZDm8ALO6cot07q9vZONQKN03Vk7rBuc9jy+Gv9ArKqNkmH1MPxohrKoMsNtl/0Mlz1c5nfeIws3XiVB2uU3uhXT8sNnBFAD5zMMuksKkHb7Uc4f+oVgwoGWqjP/1FbG4Q3rX+aWRMtZ7eJGXb2N7e1FD1NahhpQj1rh6VpK8R6mTam45DWdO2ChNzYzvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by DU0P189MB3306.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 16:42:44 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::5f39:2db5:a647:ac07]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::5f39:2db5:a647:ac07%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 16:42:44 +0000
From: roland.kovacs@est.tech
To: openembedded-core@lists.openembedded.org
CC: Roland Kovacs <roland.kovacs@est.tech>
Subject: [scarthgap][PATCH] gnupg: update 2.4.5 -> 2.4.8
Date: Wed, 25 Jun 2025 18:39:40 +0200
Message-ID: <20250625163939.1360192-2-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.50.0
X-ClientProxiedBy: DB8PR06CA0015.eurprd06.prod.outlook.com
 (2603:10a6:10:100::28) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|DU0P189MB3306:EE_
X-MS-Office365-Filtering-Correlation-Id: cc73f546-1694-4eb1-54e4-08ddb4074f23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?u/SaX+0tL5U/KMKd9Q6okQYNP71ElMGzRKx9m2tlt4d47xbeIbZcvFTeEX3d?=
 =?us-ascii?Q?B08IquYlZgBIbnNtftp4RulYx51lA5mHRLBXYoRNyeDqpa5Eo00kSpJArFkK?=
 =?us-ascii?Q?E9yy7aF9yGRDOP0+RwKSnSFb2m6xtdCpYBtu6eqm0g8AwYxJcsmV2Za9Bn24?=
 =?us-ascii?Q?VhpNfaDjGeWAq2BGbzDWkvSjhNByw6Hmm8mXl9mWs/4DZKZJMLpkPlB6IZTl?=
 =?us-ascii?Q?sZoSujnRByJuEEjf6wtVrPeY4UVSXhze2e6zTVixLfjHvkSdmqejrmwO+Pp3?=
 =?us-ascii?Q?C0qCv1EQmb8c7ykaQ9WOnLTEw9BAKWVKHln2v2ue3PjsP/SzUYQLBl/HIovC?=
 =?us-ascii?Q?grxh+cbjZtH2Axsm8LfRLlpuwJHD4VJVtWfwEEhg1LN5bPj21X3+oGUDmDFU?=
 =?us-ascii?Q?uEIqfnijnoNwHFFn21QhtkXPlULvbMpJSwFPdF3IjMdwPEAXAKdRfM8PBM+5?=
 =?us-ascii?Q?1DpcJnndBgIh+FaJqAn0tMk6U4D8XoNHpa8IVAAHmC/mNiqH4lnT+0uixYuI?=
 =?us-ascii?Q?s0ZDAHNlFltxiQjGI8Zaepy22MtvnEDZwFYHU7nfD9PcBnLZYUWR9MEhWDLn?=
 =?us-ascii?Q?svdHjnRuDsj/cxFyYL1vnObJaSsVukl+taMZDtlIfvlBFvyjMZOS4Eo5poW7?=
 =?us-ascii?Q?J5jVwiZRyIY0spQQ+RjzQ+p57KjYzUxdK0vHgsceV/bbGLFtP9RNzQxm78vd?=
 =?us-ascii?Q?hVn6R53aIi459X1WBAeKpXr2C3Pp8iNJVf9st6veKfncP134N7Pan3xz3Miz?=
 =?us-ascii?Q?Z4XGG3hlK+JICjJOE68SwVfC4N6Bjnl17DswYhmWBVY9DjXT8Bm1Y1yzohhq?=
 =?us-ascii?Q?dKm18dWj8yNbZkOX79rfLHOiG7yXB/x7JRx1D/+UtH4iizMorYfUauTldKiV?=
 =?us-ascii?Q?w1IV+R93CIYTkXc1xcghFbFlujeRAsfeHNbSF+LyOrQLKGjCQz47VSQlb6Ar?=
 =?us-ascii?Q?2KnQsai5SzGMK07dlW11Kk03kEXUaD1J1PhfAmbatTC0tPh1ShVH6ihcS4wu?=
 =?us-ascii?Q?KVarAFKRY4KDVcnX/wqLbZhlDZgJmHNhGr6AihW3QbfhubfT8FADLplKHt0P?=
 =?us-ascii?Q?yHpsmqjbxkMHJwXnD9TPD45YQoS08mrGEeLqLMipGyA4zAhT7yY3fDds1KIS?=
 =?us-ascii?Q?uC4nQ/fIvZnZQ2dhSMbziL7gn9GPYQUXw6LJGdFWpxinB4fcp3Rt/YwD/hvh?=
 =?us-ascii?Q?N9LfE+/iOukN5/+xPr4zD3n4j8BxnzytamtRCmvADZy0ACU2BH3vCDYc8bIS?=
 =?us-ascii?Q?uVDf0BvikbCQbA/E8mnc1llxkHcqiQJOenyAALSXp5HgxmpJOOHS8vxOQQ+0?=
 =?us-ascii?Q?1gIdF3BV14HaZEeyJ5okVk6SdC8JGviqvRv+6UfyhYWISwbsVjYiWaLlWdgw?=
 =?us-ascii?Q?SnYkyqw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4WBIqSLNg6pznIARxYhbjL7YLufNJ2ejC6wKja1tR6DRlwgp7qljFHK/GOed?=
 =?us-ascii?Q?MIXAMimTwk7E3uwohv8tjKsNxcVY8PTtZ0BNbuBrXrQsvuM5DstB7dpTmzw7?=
 =?us-ascii?Q?nrzb36/zZLHcSbvhGnPNlZZHLZd/unPgw/Qs15nXJRi2hE4iZ/f6dL2uUztj?=
 =?us-ascii?Q?Px1e8zb7oqS7w4aSL0HqM8awfrrTdGSYXauC0q2PNs+owUiS+MS+2FwyPxXZ?=
 =?us-ascii?Q?E7LOSIBbPZY3zWxLr/tGQFClQ4CMJA+2vovOC4y89/w8e6ErQTI4L89536g0?=
 =?us-ascii?Q?cFbZn3LKISWzmoWrkmXo5p9kjdCoRwg2dPpbzimjHNlmqYkc3R81nHaqRsH1?=
 =?us-ascii?Q?D7Uu3ZMKXaaR+yfevWOTU+lkgjlDrzuIBBLdEutGY3kqcoCrXUMVM/CFfgL5?=
 =?us-ascii?Q?nCGvncsHG5rhtDU7z5T3OZkiMZBPlQnF51IMNoS24dV9rdGLCLVFUgiNLRFJ?=
 =?us-ascii?Q?7UhZJFtKAAObcyoO4qz2CandxipKeFW3voc2lu3b0cRu/m2LjVd+IlNOqkYF?=
 =?us-ascii?Q?/R0NOkuEp0UtsRhcTxHALddzWV7x/0GN92dy52vevmzoXaTYkdd5ZEm0cxrk?=
 =?us-ascii?Q?BZFWZv5QIKdIKdjTeeGlAMZsYY41753SZG65IR1ohvfoQS2hwzrfo5M4SkF0?=
 =?us-ascii?Q?SRhaOSn57tjM9IGJNza0n69giPBsUYKXQOkNEczSax3OaXdZdur9JUWTL2HZ?=
 =?us-ascii?Q?mcPY7iBFR622kkB0XPcz0msN6EYWCXY3kMFqBRvxy4vwulCRQweI2F79nvei?=
 =?us-ascii?Q?T96x4n2eH4Bt0JWDD77tbL7PLcIowB2+QY5zTb416FiGwtk/PYXLcrp7h37n?=
 =?us-ascii?Q?qwTy2q1KIqZM1dAvcwfUHhg4Y+r+LP+4lhRQQUIvUI6tZBf8YfwUbZfXktkc?=
 =?us-ascii?Q?nn/zmFkoSbbhx9gUjLUFt6lHt9Qqtar/SxC0EG2LjZzLwGBK3grA7q0lGJnt?=
 =?us-ascii?Q?cMNqQbkVpvz21Fz1fJMP757F5kRlXId5P5X8/v3XrqmlfVDVW645YlOhwvMc?=
 =?us-ascii?Q?zwZTG4E6hK71EDZfmcuAPkR3ZsK2IIX998JFUqsP+brDaz8TU2Q90HpqruIZ?=
 =?us-ascii?Q?+xjx5YqnBUm0QW2AD+ayvflmJn2gTDeymAxVQD2jWhJDPpLgPs8den9OBQ1m?=
 =?us-ascii?Q?8jig2AZOybefKbOBEpUZhHeuJVVUFOyWghMhSiZQL45zsfICvbrxSlNsH9y4?=
 =?us-ascii?Q?fA0vo24SS3CdnRCqM2QiBqRcPdVElJGZ3LSYWu1OER8NHa10owQxcSQh3/qP?=
 =?us-ascii?Q?MJzBo+2JSATy3M8JbMr6Hf1A74fTNRvEZQvbnMcAMNBDp86k1psK2dYnRM4v?=
 =?us-ascii?Q?ZhqbbjYIM90kWduIo+PZU4ZnMqvRTVH6kMoh4eQY+CFKBxFwX+e0I2m38Wdj?=
 =?us-ascii?Q?Pl3iieXtgJYf9fse+jSa74fH8lltsRmh/XjKJuQerGVo3AalcqQHKjCKWvh+?=
 =?us-ascii?Q?erm4dfIzbAdpgpKBieZU5rv+3c6m7e+3eYjc5dmz76bSmHRUBd34DJpX1MNI?=
 =?us-ascii?Q?ph55L14keIF9T26WTF3Y9xPUiwWWE+mnKY3TEZGKTqWGYOCZVGhaKhXjWt1Z?=
 =?us-ascii?Q?Mfa2v+Czn0zWaf9AgPjyzpMP5m99s0iAukceDOJ9?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: cc73f546-1694-4eb1-54e4-08ddb4074f23
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 16:42:44.4181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uAMz2ScRkpkJ8eXTRWBCJ00+zgm2kUl5XZICR9w+AFt//VOeItFYmeLP9Hv7taTYHVaHb3Wt1PeuuD6tB3GdLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB3306
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Jun 2025 18:55:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219445

From: Roland Kovacs <roland.kovacs@est.tech>

This release includes fix for CVE-2025-30258.
Support for --enable-gpg-is-gpg2 config option has been partially removed i=
n
version 2.4.6.

Changelog:
 https://dev.gnupg.org/T7428

CVE: CVE-2025-30258

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
---
 .../gnupg/{gnupg_2.4.5.bb =3D> gnupg_2.4.8.bb}          | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.4.5.bb =3D> gnupg_2.4.8.bb} (91=
%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.4.5.bb b/meta/recipes-suppo=
rt/gnupg/gnupg_2.4.8.bb
similarity index 91%
rename from meta/recipes-support/gnupg/gnupg_2.4.5.bb
rename to meta/recipes-support/gnupg/gnupg_2.4.8.bb
index 97b5d8856c..9c5de263c5 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.5.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.8.bb
@@ -23,7 +23,7 @@ SRC_URI:append:class-native =3D " file://0001-configure.a=
c-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk =3D " file://relocate.patch"
=20
-SRC_URI[sha256sum] =3D "f68f7d75d06cb1635c336d34d844af97436c3f64ea14bcb7c8=
69782f96f44277"
+SRC_URI[sha256sum] =3D "b58c80d79b04d3243ff49c1c3fc6b5f83138eb3784689563bc=
dd060595318616"
=20
 EXTRA_OECONF =3D "--disable-ldap \
 		--disable-ccid-driver \
@@ -31,7 +31,6 @@ EXTRA_OECONF =3D "--disable-ldap \
 		--with-bzip2=3D${STAGING_LIBDIR}/.. \
 		--with-readline=3D${STAGING_LIBDIR}/.. \
 		--with-mailprog=3D${sbindir}/sendmail \
-		--enable-gpg-is-gpg2 \
 		--disable-tests \
                "
 # yat2m can be found from recipe-sysroot-native non-deterministically with=
 different versioning otherwise
@@ -41,7 +40,6 @@ CACHED_CONFIGUREVARS +=3D "ac_cv_path_YAT2M=3D./yat2m"
 PACKAGES =3D+ "${PN}-gpg"
 FILES:${PN}-gpg =3D " \
 	${bindir}/gpg \
-	${bindir}/gpg2 \
 	${bindir}/gpg-agent \
 "
=20
@@ -61,11 +59,6 @@ do_configure:prepend () {
 	rm -f ${S}/m4/libgcrypt.m4
 }
=20
-do_install:append() {
-	ln -sf gpg2 ${D}${bindir}/gpg
-	ln -sf gpgv2 ${D}${bindir}/gpgv
-}
-
 do_install:append:class-native() {
 	create_wrappers ${STAGING_BINDIR_NATIVE}
 }
@@ -75,7 +68,7 @@ do_install:append:class-nativesdk() {
 }
=20
 create_wrappers() {
-	for i in gpg2 gpgconf gpg-agent gpg-connect-agent; do
+	for i in gpg gpgconf gpg-agent gpg-connect-agent; do
 		create_wrapper ${D}${bindir}/$i GNUPG_BINDIR=3D$1
 	done
 }

