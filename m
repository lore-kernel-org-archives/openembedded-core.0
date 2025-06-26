Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46BDDC7115B
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 08:00:41 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.5])
 by mx.groups.io with SMTP id smtpd.web10.3293.1750924840140716131
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 01:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=fIeIO3eX;
 spf=pass (domain: est.tech, ip: 40.107.130.5, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=motwJFwXf4sQh9vSjiGIfb+lRUErYz9iwXr4h8o7bmhTrP9rZEIPFjdwFqxY2R5SV+6zj4D5SyuB1jkmIRuhI8G8gl6aK7n8HyJEjSLAgGrI7VZ8AK+DTHLpMmPTRHeLVdrIilvZ4RPqtlp8bEIKwQvSpFfS7DNSJeBlb47kMWOLt/xbVfazpNG99tCif8k7dcUj5vYteHhFMAM3ziRyrYQlYBO+CLKyPzuK0E9xZgN2jsN0cmBilJLdoNhRgeYdyPENt1NcNNWnyUMGEkUByorCLNcR6O7ChzKeuHcd0hvLqlDQ9AEFcGsnpY6AaAKzJHqrPEdqmZe3lejecrBdTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3NvzgxEmRy33O3A6XWreAeEOyOsV2ZogAoO0K/8OhQ=;
 b=e7UOcaqxpD3DzPGOZz8OurLb7lMtHDqDf3KYFOEFe/N/TeaSzBPq0RyotJrNRxEkmzMBcUzd4VK4vPlUrKK7hkoW8VTNUFUVBBPaqvV6lTm+3o0c954DXoLpLzvg+tlqDV3Qujc70mSMQSlJYwlDAjaUsVlBOnM10qurMTB/p6uDSviq2lhnZxmlZowag8jlCQ1M4tOAiVnyb+vWv1I+jlun59uoRKDcinf6pzXdzlIjaCVYnfyeI15IY+m5OyeQo8EjEIk40jWw+BuoJNvZWcUBLWOVVCJjdhuHoYXbX+fFyyXazglJrWQfcb8Cy+pJIRvWqTdskkdtRH5d7XpszA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3NvzgxEmRy33O3A6XWreAeEOyOsV2ZogAoO0K/8OhQ=;
 b=fIeIO3eXLIxqbN969khFLzWoc3bqMzYod/EfM2ok3G0oyUykXvbImgj3cZ97f4NTgnaGmMF6zfAlE0jAPgkeIg2dhFykZZZnuuIzYKHob6L41nmT00ZK0pRXWAPnkfliIJ497o+DRmbmHJ3SnRMkF3t9fDHZbc/UmzXziSEFD2FobWc4QkxjaUgQRJ7uypn3PH+GAPevKnBbr+iuiGfnqb1UVccVf60Z2sBcnhBmGFSDI5Y7WBBXO4a6gNjmcX+gT3lTrlbrm2SJtewNFBmwsa0OLMa/thYr+hc98NjwQFUDIcvhYSTobhEPcoVKnsJx6wjTalzBcI6fHZ2UxYHgeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by PR3P189MB1033.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:29::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 08:00:34 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::5f39:2db5:a647:ac07]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::5f39:2db5:a647:ac07%6]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 08:00:33 +0000
From: roland.kovacs@est.tech
To: openembedded-core@lists.openembedded.org
CC: Roland Kovacs <roland.kovacs@est.tech>
Subject: [scarthgap][PATCH] gnupg: update 2.4.5 -> 2.4.8
Date: Thu, 26 Jun 2025 10:00:11 +0200
Message-ID: <20250626080010.1401332-2-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P191CA0013.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::17) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|PR3P189MB1033:EE_
X-MS-Office365-Filtering-Correlation-Id: 3854f3ec-9336-48bc-dc73-08ddb4878704
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SDWRATSO8dV/ReP8oRZrioSrG/UKlTPGGm7fV6il0iqWkXZeRDQBZfrfYbrr?=
 =?us-ascii?Q?pBqXzj+rjF5OFCWZiVdkGGzhiYvk2PdeuI3NufbVREjI17M/36qFrsVfRL70?=
 =?us-ascii?Q?5YOZkRaQiaeDu82jm/z23wBS1Xn0n6u5botxrjKJDbBja8fddESJ4O1vqSKB?=
 =?us-ascii?Q?ZlHoSWTVRXJnueztS7B6/fXNxd6vPHYO0dcaiX+waqO/Lq1ltcCdGKBLzt9h?=
 =?us-ascii?Q?IWO3jbzC6CepIzkrdyoEiOPVfBPqA5trQdx8iZOoyNwlHUsF5JdUs8ejCBHI?=
 =?us-ascii?Q?eeKpaZ/R7hdJzZ5k8RLWWXUToRx8sUVUKz4Bo7ljypjW9+pPqsV29jRMv31+?=
 =?us-ascii?Q?xhYIRjI7ak7JMIxGXoLmLO9C66PwRiTKfJmRmDb2GW1SAo5vkM5yACZpmAzj?=
 =?us-ascii?Q?fNUMMJrRLoMWSEmEaU2ptaPMnYxNWLtFgVbCJGJ90j3ENAr9uqFgREJjNiO+?=
 =?us-ascii?Q?EaqYUAfWcPUJNsEPrGP5OSyX8LkEA+POEWLqz2ILWb6WAQX1mcGE7aH7IL0l?=
 =?us-ascii?Q?hZVuXoyqhXJmo691t9GP+jCdYa4kxpWs6wt3lUdcCCFCZZUL0A4aVv93MHSm?=
 =?us-ascii?Q?G6DxV2N99rFjww759oYXGn8VFB8zOqsNEw8yDbWx34+yEWuskyIZls+ZB5ZQ?=
 =?us-ascii?Q?lxTwsSVWd16XWr7v809ZMCVA02nESH7zHixgDD2XCkymSGLjjz63UTXKvBaL?=
 =?us-ascii?Q?EKt+lIrQ2LxVos9dC8zB7ydMMn5FevDSrt8x9QZmOfretN2FZR5No3Mo5PMf?=
 =?us-ascii?Q?cm1UsfhivDpzvgRlQSG9beP0wdrhoLD8sGX/gsKn5zMWNC2bab5F0yOs4B//?=
 =?us-ascii?Q?SKkhjBk8F0gYUg+TbW1t4XpBYX6Yi5h0fx8iZgeSCcFjw94NdOSz3wZlW4Gq?=
 =?us-ascii?Q?mIkyowAKLD7Vzp7etGGiGO3sFYW1DpkVGrX2R35YCb8xMzSZdcWfdg8pouIT?=
 =?us-ascii?Q?EJyD6HazPuv7fejOKEGMbWBhLKvui5M2FsGAx4ta4SUiuVAy4lgBt6Orf+Nn?=
 =?us-ascii?Q?zGWh9jcpAmFo2qwdWLpMctF+awDsXDzI60NVR7TvpubMntkdTbUnUGagYveS?=
 =?us-ascii?Q?uJo6EvsKUXMbzU4x1XyfPbIgVC38GS6EoFcqcTGBgYN2mB1XvF56V5OblflQ?=
 =?us-ascii?Q?zQgPPnI1gVbymwi3cD98drwpq0XQpfffZ7cjaR90BeubK4wh1+N7CS4oKqxD?=
 =?us-ascii?Q?6F0oxOwfbBzA1EGUzq647gy+TrRXy1KG88thIdx2xhShDEmKPmh7ZhsVGnJB?=
 =?us-ascii?Q?RWDr7dVTrUqDDCuugkc738odeK4z1n5Azo6wlJiisuE52oRowR1vsUTpoMEO?=
 =?us-ascii?Q?HEF0SYenmIn4UjmSvL3dC6mdj7eOpPMOyesc5Dgr2fXobpaQ3bHlGpZiSSID?=
 =?us-ascii?Q?SN3JW2g=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hBuYb8enW7Nimn1s9vwKqu6GIQj32TbRtiIdS3b+gR8qDWnba/4VTRC0nlCH?=
 =?us-ascii?Q?5YH4f22ZzyR4Qxdf+kTSJAkA2sDhicT337koU+UOk8VhdpxdVXYKaLgnxJFA?=
 =?us-ascii?Q?fTxzeOkPubCqBIXTnA2543l5UvGrhgzEoL3Q7tQB/hMps22rMKy+51QU0Diq?=
 =?us-ascii?Q?FMCnIvC7FTpljFIlFw3G0T5PuCQ70IKR3SDph5e3eb2dZ6BZNh3fH/pbcFQ1?=
 =?us-ascii?Q?fguHPSDkuTVr6oHgM5Kq0sWlfh2HxXoW4JZ6caCQ+Xow6F2JOch94i8ZVeaI?=
 =?us-ascii?Q?ZJK8jUOd2A6Q730ftElfEmWONgo6baMmAO7rFINnn+Ex3FkzzzHBQIMSonVq?=
 =?us-ascii?Q?/4iUQkBpjI78Wan+H8GE/Ozz2RzA29YPWN/6Cs4q1A4hHTKp21mne+vNNKfm?=
 =?us-ascii?Q?WsTGkY6MzRmgtRqFvAlDuEyJuPOCGbyV2My5dXKtzZ5ANzJppeIaW0VfsEo9?=
 =?us-ascii?Q?W7kUxwcQKKs9wXdWVW4tCzmSCv0YBcqJ2O/JFQzwXPtIjk3l/Fs/gqBCQjrJ?=
 =?us-ascii?Q?7aUhvHegwAq/9CWgExeFqXBbW5hzpGWVT+KpnjZ1ErXxVNZ6NbzrJaihgS1n?=
 =?us-ascii?Q?tH8WDEiYw3Dt5NnVxyzl5oRcsFt9yr0tt7GkeG3gPpa7bCgN+fTHpIonSe6O?=
 =?us-ascii?Q?uNx1QlCGaPJS/XZHv25prOu134EK6AsviHDSc701TkcQBP2LLMJp+MiI+vxr?=
 =?us-ascii?Q?NPcBkNCc34BJXaqG8G6MYKK0R/7GlybFnzUpMs/1GYA6bwROqjCldFGHRVCH?=
 =?us-ascii?Q?fNMS7c529pv3CqsNxgz0uPavx4tpwa46UKpaXcsqax71Ky7v7XFQU1YfatJt?=
 =?us-ascii?Q?JfvmfAublDakNiFGV0KSd6WxlldylvkBx8doH5z/TbvMD60hy5yb0R5ZdK9H?=
 =?us-ascii?Q?UMSm/kudvO8oEWRdEkaW2eiuYZ1rUj8t8geqEQCDu6b6GikA2yRTpHf3U/KX?=
 =?us-ascii?Q?X1gwHuYZKSfQj+guWn9Owqdg/EgCqFaka1k3ZmNkJWUkTJQHmdyZUSZAjnFB?=
 =?us-ascii?Q?rH9NiQoyKNE0gn9qPnRyYdcjl57hMHPK3zR/lE2cpHmoFxR5gPSu5g/ng0AW?=
 =?us-ascii?Q?mu5ulUxdfZpa8PzjlL8Djr95hNwStXuzHf7UUreaCwtp8QvLFveUHcjgV3UD?=
 =?us-ascii?Q?Hm1O07WbeRMixIB0ddi7RbOOW54AEGpzMxvcQgEEo2pkZ58xy5iUCpmIwDQe?=
 =?us-ascii?Q?amkURO+/vgXdkNFbPKJ636nArP1p5E9Z/WSRy4+0UJ0/GE1CsShuXaA1QWvw?=
 =?us-ascii?Q?o4G1q5GCGJ69jyjUdWcSk690UW8RR4kB7PuzRZvkCGUiCc1nthX51nO3Ku8F?=
 =?us-ascii?Q?TabPc6sdG9C+HNs2YHmyWZzZY6b1j/HXUmYN9XPnS7YD5R3p9mUcI+eZv5kX?=
 =?us-ascii?Q?OwNjeTvxrub/qJD+uVly3Wrf8RuCX/6l1mQinxkvr+Sd9IUvMK2G8TWVcj6c?=
 =?us-ascii?Q?FOnPDcBJnaKCfFnCiFOvl5u8LyW2UZ8zbO01wadM+NMa22BWbahrtlg0ktkY?=
 =?us-ascii?Q?7RzS/W/JUbVGeZjlCjAXgXVTC0WXTidu3zkmdU2dgu767TyNDZjtcmayA9iM?=
 =?us-ascii?Q?7EqcRwjtPVjVHdsfGbCJePQq32Xe5XBGIn1KS8MZ?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3854f3ec-9336-48bc-dc73-08ddb4878704
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 08:00:33.7576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rqK3u5hs2Hif6fp3C02WaPnwUoojidKAJ5wlhSt0RuAUu8UshP6vtfifszCRUW/M5prKnz+smMcvWdiTDdAy1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 08:00:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219340

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

