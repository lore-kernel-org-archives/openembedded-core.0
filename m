Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8201C982FF
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 09:22:23 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5942.1790068941036490350
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 02:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=q7whXDFH;
 spf=pass (domain: est.tech, ip: 52.101.69.61, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ldt/M7InSlI23E/6BQcyW8GkoBqu5S9XciA22CdhfQI4vDibVMYonbAIAwjIB5ctWEyb64wgr99VvLoAU2xRLGcR2zCZUhy5GloKnhlzpf+t5Uul93n9R5amPf7qrarY/d+0NO15PjcMyBmDhWQ9OIsC/6Bs+DHM+7rDASJPf8dbgQ8RtQMKqbjoKE9ncehA9eJwTzErQSZDs8LNGXH1pn+tPQPQr+boSWJDsJupEhYzKfWA20SbSf000BH01QtlKEaI6uTn3SEBOLrGfNr3zNT+Nb67jkCayjLkVbCf5JZ2xEDlLXGJOI3ZTFoE8Z1B22MI3M80G5TiFI5s58KTnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moXRvs9u9qFCUMRH2hKKExkDBLIMZQp8RYRqgy2ZC10=;
 b=YxOr0WxfISrEWkyI5/HoZaTZzYvEpuVz8xiUF+aQcJ3rxrgcMxdVQMHQt03BkXMtHVPYXhHUxuInOZKi/+pknKq+POO3+bYESVYKpd5A8ZB3rtIt9qqBc9OrM929Dt7LYLRlWqQYuceJ1B7hNJDjVsdnlSM5ZgGF5cKz70lJPYzxc1dGNLxbbY59nPP8dPCxfyGlURfWiOyK++QlxyMT8Fydq3B+PkPEWltO6AlanGzFtkvYKHU+KNH8QwLBFyi4JEXYwcHbLFMq/0PKKhn4ZKYTIEqRti7LisDzxEplWIq+SR87PUH+2ammQ9Pv/IV6QtOnRjcAtj+0Vrji3BXzNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moXRvs9u9qFCUMRH2hKKExkDBLIMZQp8RYRqgy2ZC10=;
 b=q7whXDFHl5RaMrrwdmSTZvUZWxmt7D2fChUGRFtw40HFSap2LzKMbn8Aojvc0ZIaXBmmL5Ryg9zORZDp1Y53HGyGn8Ap9a0JAM1gZ2+oGE09fOjUBy3ZI3n9u+VXZG1UtUfwY3EVOuDwaBOM0fObdFsDTFSNtKjPa6bXWg1+P1TR6clykgyM02NTjrB73mMlghFqT6U2utFQY9Kkk4h9QjQ7y/NkuTn20wvA0e6DGbODxk5AHBqt0lye7qRewPZjFlW9s4laoUJHm7/JubJG5F39S4nyvYp7T5TlXCGY6sfazieJ5CMHbNyw57Qvs0lxMurMGD1lVwGcaTiomiIT5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI0P189MB2775.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:253::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 09:22:14 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0428.014; Tue, 22 Sep 2026
 09:22:14 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rsync: upgrade 3.5.0 -> 3.5.1
Date: Tue, 22 Sep 2026 11:22:11 +0200
Message-ID: <20260922092211.14025-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0210.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::24) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI0P189MB2775:EE_
X-MS-Office365-Filtering-Correlation-Id: 3738c36e-618c-40b8-b354-08df188afcfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|18002099003|11063799006|56012099006|10067099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	FaKpG3aKckfNmAcSnG6D1ThsR0zJUamfKgAcOdufbrQ2D9599li1MrrvPaCzSbeUWa6I5n8PKu0zGEPczNvanGKzKtPhiYsCyTlEdxpHP/oKvF12RW9bmv103RDcRsM4farXE18EN0J061zbO9QV/eC0ZYI5JA4E7rLsN1Iqjk8RypuzFzdU2lJKCSpOkJ3yAhR6K+LQUqJ20mCVqsbDb5YSGaPX459s7cN0rMNdNBD/MzsbM5RXD+HafA3gqvTcHGSzNWT7g5g8MX99TYu7YHNG33BcGYxdJknkrhrcPHYGFZoMGmvW2DZJBJM/Um8mMooTWiZPVthG0FRWbslOj0zvLuFvN4BLLCChogN3JkIE9WrU8QQrGM/XUMYH4oUHFY5TdF7790jwalbDsl5YB2ePPery7ekmWTOggt85kuy0FSjWvWSmzjI6D9jSQAsg6zMGwmU/2uIzO3g90Jsht8T5NWHKiDdN6zwEbqgCTwY4QSYab9hhnWZL+ULt4k/mCaqh+pvsbh+OQqwafQkGlaU3Lxezmih03lJaOU/g/dm3Oe00Vo7uYWaJRYKp+gQzKherDRkiizEkzsabjDY2Ggc5tvE3niD6sCauQsFTfLI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(18002099003)(11063799006)(56012099006)(10067099003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Mald5HH8IVmO9pdhk/BoO+/+pojdAfrBtbDIs41ZIoNaLdh3C1Eq0mme/GLu?=
 =?us-ascii?Q?otslyF5i3rTydMSueOFvWygLOAoY3CaZqX8HFqVVR1KrEHvS28ITbUpinOFu?=
 =?us-ascii?Q?K+iP/nr7yyqtDTAf/x2+6Tb6SyveQpV8MN/8lWlwI8ozUAH2CsYwwXNr/9gx?=
 =?us-ascii?Q?d6pt89klz4sUhUlsxJlRv98Q0egLRc/vl8ALO81RkqA9n/s9Ng4m3SrCLNd/?=
 =?us-ascii?Q?dcZOA4yBrkbAM/joFFDb4254Ylc3BTapp1hsomSmKgnZhwDDJoHi3QPWJtPX?=
 =?us-ascii?Q?ru9dnjBDtxyNH6Eno4TTaOjTYJ6D6kSMjoUEmGMOIt6jTQLRpdjLvrL8U800?=
 =?us-ascii?Q?tLIu4k7M/VO/8mBRiQgjZFi86RoCiOzwE5hQseGI3vxMpxlc/Q3tTmfSbSoc?=
 =?us-ascii?Q?UjGEwU75WlUzuzHUUsKpGm1rBVLfKpSStOZTccLBu0LrIJrJtG0mk+B3A5K2?=
 =?us-ascii?Q?5jB94Hy4v1EbTNIF5mPc16EPr6J2rGuFvN243e4VepjHj0Nufo/cQwjcua7r?=
 =?us-ascii?Q?mpK6eISuPWgkP3GefMfnAsiYV/S38/L290oTJaYqxiw/qFwS2Z9RLGVycBAG?=
 =?us-ascii?Q?+mwOjsOoxaOiCdsrFIKkBiOqIH+fhnZWEM7rY6/SICnamCuWJKyXLlwCxp80?=
 =?us-ascii?Q?aj0M9YB5VjuEMQy4BufAfI3msC/MGAexpFXXe+Qms3v6ym8Nh48N9h1IFdvo?=
 =?us-ascii?Q?8WhwmJmzQhVSXs7/MC+v6CxdT0HMOL+r7RlAcHEDT+WxNP7lJLod39b3ZH++?=
 =?us-ascii?Q?KhX20dUz4UTsJEnthFnaI9ghS/w6h3SdzdoRO/BgMQgamzq3Nvk41I8hN1wS?=
 =?us-ascii?Q?owzctMmZ8agSNQlOFvAOZPuXXwowySFsphsuGUkPdSBIy7nLsf2/jMYIm0Lg?=
 =?us-ascii?Q?zQIPIVP+0Oo3YP6f34/vnsvixvmy4H9VE4ChVjqQGFCxVCp29yNrgasTveZO?=
 =?us-ascii?Q?4NiAZIYCDph/k/6Wl4XmSvB+K2THfv2NAParBe67sUv2MtOWt7dv1tdEBRKS?=
 =?us-ascii?Q?qsyOO0/D+FMMdBib3n1EfyzG95wr9b4HWoKmEDkT4OLiLXiwbej0kTaFgCqy?=
 =?us-ascii?Q?R+V4QcOdozhmdGwCj1QoO+0mauEzjmkcWllP+PaPANDBb6DfMgV23surR7Er?=
 =?us-ascii?Q?OQe8rF8YlMMe9aMucZOi6qrhb8FwF1pYrUFWc/ld1lZeDGKGJDiPBtspnuAU?=
 =?us-ascii?Q?94tgbJZeBcHDYZIIBSw8ahnVLhiAdGnpUCFW9jbCxP/qXbogRce+Z2w8yyaO?=
 =?us-ascii?Q?JzzmZPZvdKsTFuoqNyTKNh4SZ2emMJXqeYeCgYb0F+jSItjA3Nwz2sMFPFED?=
 =?us-ascii?Q?AmUakyGoYb9SURlUyUXggyhCUba/Aabprxsf5BCtUAZfMyXAEVbJSRwSN3ES?=
 =?us-ascii?Q?EX2/8rZNbbMXXdZwFFiwj3HaXEyZTKtNcyLTzvf9Z5EALanGwFZVvT46jipL?=
 =?us-ascii?Q?Ksx9hf3ixvpimSTJaw6U7zGuIIq/2bAS/6sfye3K3y9pjMcGeW3m+6ce0Edf?=
 =?us-ascii?Q?ZwCYtiSl8srcHd1ibFrmZ/1i/ltLRMucDbgTyGAUj9VjqzSXz/cTbez2ue0G?=
 =?us-ascii?Q?LovnsaXI8d+xgXQ0cwkQgfgo5iYqC/v1b94KP0HeoGUMRChLwKIRtl4p9oYM?=
 =?us-ascii?Q?CRqeVQHpgmVCB1xKDzcGe3ONEfUubtcft1BopGeDAWj+bl3xl9Cg/NKZ3AzP?=
 =?us-ascii?Q?gAa5516/O5A9gGoXcrljezWbVj9KTjrzKV4HG0hlvAKzH5i3QaViCXbEqD68?=
 =?us-ascii?Q?cBVhy0Cl03Dvk9JXfEfFmKYa9OwTcrw=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3738c36e-618c-40b8-b354-08df188afcfd
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 09:22:14.0899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: myuyqiKXggPME2rkdi3sqx+L40+KS7jT4AajUWfqq2uHqYlb4rWf4xf8NhevPgw2BNxJTsq+MICYdlZhij+hKH/ATanYangj8AOkVQjnh+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB2775
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 09:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246395

NEWS: https://download.samba.org/pub/rsync/NEWS#3.5.1

Compare log: https://github.com/RsyncProject/rsync/compare/v3.5.0...v3.5.1

- Refresh existing patches
- ldn support added [1] and add packageconfig to support

[1] https://github.com/RsyncProject/rsync/commit/f0177d82a8fcbbebaac2bdf556=
f983160ae03988

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...01-Add-missing-prototypes-to-function-declarations.patch | 4 ++--
 meta/recipes-devtools/rsync/files/determism.patch           | 6 +++---
 meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch | 6 +++---
 .../rsync/{rsync_3.5.0.bb =3D> rsync_3.5.1.bb}                | 3 ++-
 4 files changed, 10 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/rsync/{rsync_3.5.0.bb =3D> rsync_3.5.1.bb} (9=
5%)

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-=
to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add=
-missing-prototypes-to-function-declarations.patch
index 5aed93e458d..1f1fc3f3b3e 100644
--- a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-func=
tion-declarations.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-func=
tion-declarations.patch
@@ -1,4 +1,4 @@
-From 64e62c659649593239ed39ed40a3ae689bf2d593 Mon Sep 17 00:00:00 2001
+From 56a785a7d964f797a786b2d5b75d9cee51b530b1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 29 Aug 2022 19:53:28 -0700
 Subject: [PATCH] Add missing prototypes to function declarations
@@ -63,7 +63,7 @@ index 889b57b..19e5e98 100644
  	int options =3D LOG_PID;
 =20
 diff --git a/main.c b/main.c
-index 6050d0e..45722c4 100644
+index ed6e554..b5f9448 100644
 --- a/main.c
 +++ b/main.c
 @@ -250,7 +250,7 @@ void read_del_stats(int f)
diff --git a/meta/recipes-devtools/rsync/files/determism.patch b/meta/recip=
es-devtools/rsync/files/determism.patch
index 2eea267bb2d..890275f6d7c 100644
--- a/meta/recipes-devtools/rsync/files/determism.patch
+++ b/meta/recipes-devtools/rsync/files/determism.patch
@@ -1,4 +1,4 @@
-From c4c9b52a864c3b9ff67771b9d881a78276448100 Mon Sep 17 00:00:00 2001
+From e784131e4ccbaf8ad7107d1f7a7f13da8c675827 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sun, 21 Feb 2021 09:45:48 +0000
 Subject: [PATCH] rsync: Fix a file sorting determinism issue
@@ -25,10 +25,10 @@ https://github.com/WayneD/rsync/commit/d3085f7add38a5cf=
833a0b31cb0637ff46c80f8d
  1 file changed, 5 insertions(+)
=20
 diff --git a/Makefile.in b/Makefile.in
-index 91807d6..c18b4be 100644
+index de24949..bb9bb27 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -27,6 +27,11 @@ MKDIR_P=3D@MKDIR_P@
+@@ -28,6 +28,11 @@ MKDIR_P=3D@MKDIR_P@
  VPATH=3D$(srcdir)
  SHELL=3D/bin/sh
 =20
diff --git a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch b/=
meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
index 4ff070ea3c6..59255d15e72 100644
--- a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
+++ b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
@@ -1,4 +1,4 @@
-From bab7abb3c7c1c1db8ef6c3084c1ffb5152f5bf1e Mon Sep 17 00:00:00 2001
+From 0e1f2aec0dbfc150013860b42b41645cebe236b7 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 12 Apr 2016 15:51:54 +0100
 Subject: [PATCH] rsync: remove upstream's rebuild logic
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 54 deletions(-)
=20
 diff --git a/Makefile.in b/Makefile.in
-index 801e864..91807d6 100644
+index 716171d..de24949 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -265,60 +265,6 @@ conf: configure.sh config.h.in
+@@ -267,60 +267,6 @@ conf: configure.sh config.h.in
  .PHONY: gen
  gen: conf proto.h man git-version.h
 =20
diff --git a/meta/recipes-devtools/rsync/rsync_3.5.0.bb b/meta/recipes-devt=
ools/rsync/rsync_3.5.1.bb
similarity index 95%
rename from meta/recipes-devtools/rsync/rsync_3.5.0.bb
rename to meta/recipes-devtools/rsync/rsync_3.5.1.bb
index d9a4884d96e..6b121ab1a87 100644
--- a/meta/recipes-devtools/rsync/rsync_3.5.0.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.5.1.bb
@@ -16,7 +16,7 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/src/${=
BP}.tar.gz \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.pat=
ch \
            "
-SRC_URI[sha256sum] =3D "c7ffd1ef653e99540f661e47cb00b7f9cad1ee6b972399b16f=
93d672656e0d33"
+SRC_URI[sha256sum] =3D "c55f9c9dc10fb8bec397b399a0fdded53cc9a2d8e30891bb0d=
63724d25c37bef"
=20
 # Out-of-tree builds don't install the documentation currently
 # https://github.com/RsyncProject/rsync/issues/846
@@ -28,6 +28,7 @@ PACKAGECONFIG ??=3D "acl attr \
=20
 PACKAGECONFIG[acl] =3D "--enable-acl-support,--disable-acl-support,acl,"
 PACKAGECONFIG[attr] =3D "--enable-xattr-support,--disable-xattr-support,at=
tr,"
+PACKAGECONFIG[idn] =3D "--enable-idn,--disable-idn,libidn2"
 PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[lz4] =3D "--enable-lz4,--disable-lz4,lz4"
 PACKAGECONFIG[openssl] =3D "--enable-openssl,--disable-openssl,openssl"

