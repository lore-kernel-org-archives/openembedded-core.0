Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D95C5CFEB
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 13:56:08 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54564.1786456560011933770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 06:56:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=tgdVjda9;
 spf=pass (domain: est.tech, ip: 40.107.130.32, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKW7o3aSba3c7ErnfB0OTFKXhLG8kKtpjV9lzl4FSuyLZz/mT6HvvdsbQ58nA7JkjElaqVnWFviUz5+izoAmcPy1lU8KWxtq/+RaTI9dizB+FZ/BZ/LqNhrDjoTCbwVCc82gHRCV9UBPFWM7NpOOjwc70p2dlUyJR9/vLkvNcUcFL9OwY58LBhkdoLVWkoKoXW/2tsIs2/wcjysWMp3ridwG72gZHQKmUc9vkClNZzf0l2KuAsd1JSjMrekxktdECn/TrtZkMmMxKqRfyF15k/lw2ewPSjio5hepCky1fGXzkqiqXRKvFxdoFpD7k2HNUrNrwVAIKRXVHO2O726XOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJZmzcAhnU/8yO4wXe/84V8vOM3cMiaeUPDsbDKxW1U=;
 b=IoEpbgmjNcuQReFgQWKV1wFXEXJsm4B9Cl6aMDr99MoNv6Xy92y1i5i1OLcjT/RCAfL750+faBqK3ecRYVL9mIXB6aGyxCxPo4wzXfHFGSTdFG58C+xG7f0paxpIaRwe8TnXSZ9BWfaqWdF3qEk0owUD41XgQTK5OtCp7ZDQO0WfcB+TCKOMOY9+Ti8AJCkm8TW48Wr/vaTQwEyBC/43+cjRg+8N4ZK4sePy5dcFiuFsNKu3AsV/ymic1UGgKrNk6/QRfYTBqLD2WEhmeukYcS3grjkVHdbNWgRkplN3wFt0sVv5gnKalT9s4tchxXtcAEshDV8gFRZk9ngYAyLUQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJZmzcAhnU/8yO4wXe/84V8vOM3cMiaeUPDsbDKxW1U=;
 b=tgdVjda9sthcAylblVoo8KM64q8gRQ2fhsiP3NKRNoqMALTIT7dbzGT1a4XXlagWNm084Jo6phWIBNk6ei4cSmPqZwux9jY88EWAg1UgXj12sAeZrQMKtHFVO9SJeoKJaA48wkvQqCUauBrs+HwNFynTqRGFLdVm+isjKe/TQr9pXPgS2WuVA8QneEvbFXHTY0gplMsA9dq4wuGVUKfcmnyx6hlqRR4CEFQounD+RaUKJ9aK6X0q1snd1jbVD9YzAeBqMVA4fViHGaqcsn8qsk0yTOThy3gZVxODHYPZbMsSE85Jk9wnRQptU7FxNacs6XU+Wro467aaSn3w+L6uSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB9P189MB3526.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5f6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 13:55:56 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 13:55:56 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v4 1/4] swig: upgrade 4.4.1 -> 4.5.0
Date: Tue, 11 Aug 2026 15:51:57 +0200
Message-ID: <20260811135200.18942-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260811135200.18942-1-jaipaul.cheernam@est.tech>
References: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
 <20260811135200.18942-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0333.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::14) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB9P189MB3526:EE_
X-MS-Office365-Filtering-Correlation-Id: 5311e6d1-52d5-4013-f9be-08def7b043f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|4143699003|11063799006|6133799003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	Y6/UoFkG88aZWpdraIFM/7PRNwNy2MdsNpVxE+1wM0Bd454/LhiJKHDD/j5FrDRNUepyZI6VWjZxFKTDxCrwTRCfJiqw4xpInyMA6NDqkd7a8Xwyisj292x8vwIdPXNCsUpGw6W+XPUouxba6DIlA+l2JKZ0xMQO5cDFen7HhtdcpR0yqpOz00f3oCT84gAqnYEVa6IgtpQ1aECdrWqKxhtD3dWbFXZ+59paHBePiaULxNxPhoCw9f4XVcsB2jvI+aY1mQgTxRWuR+E36nG+2wsFGQ9w/H+5SoPTYMLaqQtWj/QlB1DVjlQiNGA1TiJOu5Mr7IoV5fT5rFhIQx5Y0pC3CChqhBuG8HFnBjgzmAnpK//lISsptHt6aaEqjpyQ8RGzC+FIyXurCAWfFbr2meMT8bjU2/+XJqM1JSoo73Hz+Mi3E0hvabPnGuNzRtI2YtVKstQoq7A2D3pqXSYTH6fPlIwrgCGWP0Ho1P9+a3ZPvy9GrA0SgX5v8Kbb0RQi4abthLACyeYAX18O59dD10TNYVD5EcX6o9h205QtNPfQQmX0pVkVoGh4LMMpfUocqtPdKP2p1BhwA0JeynS5z2y0BdlNGFmIT+KavYFaiBGrrLiHCNWOvLAjMpwrQsyl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(6133799003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2a163u35SL0N7Ll+1YucthALZa1z1fMnbr2NfcALA2bVWhpwyTsNFj4iN+Cf?=
 =?us-ascii?Q?UbLhKjC9OUhjeSioJf8Y3B16DnX4ueGQ9u2cy0+c40yauZvQp4xJpZ7lCFsV?=
 =?us-ascii?Q?jgL6/aeudXhXfK1UG+CXX4+0OCmVC24ZcxJcgihYN8tt17Vq+LlPHC+aI8vh?=
 =?us-ascii?Q?HJIE6LZLR3rbdXVhPWnU6knEobfn4mtVzULr++8NEx6zYfmBHJRvvMryMMOb?=
 =?us-ascii?Q?/aZ8I6wb+oVtaB6sbIsNmCVEiZnTe9GCBB6DdpvoVaJyZ/OVC8Q0ta+6eizs?=
 =?us-ascii?Q?rvd1UEWaxYykyI8DW5EJqqYh8nwNncz6WFKGEQadRHkcKcSpMLo1tzf+ank4?=
 =?us-ascii?Q?6uCdMFzvwu4FRXpupH9ft2OrV6721UnFdm672xukDlycfaTUiRFJ9eFL/+kn?=
 =?us-ascii?Q?2f/ZhOjy5F3tNHLl09jVvi6lybM6NpWhhM5LQAEUZdvqA7QckzYhEe9HT5rb?=
 =?us-ascii?Q?5TV58v4YAfiemZ+ddUSu+hlzD3ZzlyhviFog9IWfrPgysu6O2QZ489syTVBo?=
 =?us-ascii?Q?bmIptF+VifjzzsvMDzKV3xxkJEKfQtO/mXd38R/00KdHEASK+uUhA2f+QooW?=
 =?us-ascii?Q?uwQz7NWc98Moy/KOOmDeVkqnQKt7STNOJMNJXIi0D78+Vg0m3ly9ny4/U7gd?=
 =?us-ascii?Q?0MaOO8vL19JEMubGSy1QV7wQ+bwf0Nxh1vHNiRUq3JF7X8tZks74QhiqNANY?=
 =?us-ascii?Q?YbCi4d63AON/arh2PhhzpSEaTCF8XpkNq9Dsk7PgTkrIW31AHROMfP+22T2x?=
 =?us-ascii?Q?+Z1/jJsPJnOFzucdeSnQGKJGRmA9BmnZYbq4Gmvom/cKgHu/0IQSs/pYbkN1?=
 =?us-ascii?Q?br4yjXF4Sr7CAQlX0Pvz37mbqqlICInoTAX+ghbvbGTafsrbKXjX4iDWkNlp?=
 =?us-ascii?Q?mIa9/7OJxxrDz03ANUq9VTIOAiAnYEf7VF+9mUnmM6bJS5EFP21gRZDYCOwl?=
 =?us-ascii?Q?PLoZyKhE1oGMGNAnhvm0NHQJYU0+zrY1Ha1YLGW8pa0qze0/kW1VvY3jqbZ0?=
 =?us-ascii?Q?A49cajBP0NjbBV2RHQ2ameduvn8VmlDWyNxJ0KJShMT2ZaLORBrNV4vN9Eaa?=
 =?us-ascii?Q?oqzOrdi2HMmUm5ExL4/AMnqvnftpoyu6jflRHce7yYbU3gH9Y9NPAvobFkHH?=
 =?us-ascii?Q?cU0TYqeBbHmVkQDphhvJ5+Whtr2SHyCg/0V78h+afAV/i1GO54Fa1gnm+n+n?=
 =?us-ascii?Q?NJhLPsTtI2lJ90+45nGvLacwi8iPvQ30fZCQu46ILVpaHMbRGRfE/VZx8BCQ?=
 =?us-ascii?Q?gAshf9/JRWHm2429PG0xUM0sMrLAX3aK8dKi1MteHgZsAokOoAqswGQN/dwX?=
 =?us-ascii?Q?WLSvhcEiTKjBP6Ixq+IJnEp0uHOMFyc/HGkI93P1QrQI1PdiebM+Jonhk9P0?=
 =?us-ascii?Q?YXT+waOAgtJG/Tb9aRXb+DhPsikK0FKCv+fjjg4SWmCiDZ6oQMAumwjWi+uN?=
 =?us-ascii?Q?9gIZc563ucHIC3nZt3MDjJIkgmr7KGzJ/ZHfnvXciYnzi0pKljuuUsJJGSBS?=
 =?us-ascii?Q?xs7PnJQaUR4kLsLay+rIIvpbalRqjqVsAIH2v75c0tQ0pBremUJI5zVUvWFf?=
 =?us-ascii?Q?mgwTMiPaqj11mwC9UU6s8RwJtTa3kwxle6cgeNGF0PoJAXLQsRjekPcY/fu7?=
 =?us-ascii?Q?5MR0LhlaauB9ae9qTKFXSS5SnlrvmEGVubI0kqF9HB/bMGWZwNCgSNGba7Yw?=
 =?us-ascii?Q?/rDVN3GAv9x316mQ/0asx95uBrpJwKgvy7W9qFZf9qlEbMgauHDokjMIsBZH?=
 =?us-ascii?Q?pvQKXg8/LALaAn30s3B9V282jZDxKHY=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5311e6d1-52d5-4013-f9be-08def7b043f5
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:55:56.0673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2qJLsfBNTj2XnH+O9S7Q6bSwK+/3tkJDsVQaWFQCTb2XHT8CYo9CxEazBP05xMs+mSfXh4XyEWOCAQ48k/koMlqn4arvX8Hrovn1AEQ/qwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3526
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 13:56:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243201

ChangeLog: https://www.swig.org/Release/CHANGES.current

Release Notes: https://www.swig.org/Release/RELEASENOTES

CompareLog: https://github.com/swig/swig/compare/v4.4.1...v4.5.0

- Refresh determinism.patch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../swig/swig/determinism.patch               | 20 +++++++++----------
 .../swig/{swig_4.4.1.bb =3D> swig_4.5.0.bb}     |  4 ++--
 2 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/swig/{swig_4.4.1.bb =3D> swig_4.5.0.bb} (92%)

diff --git a/meta/recipes-devtools/swig/swig/determinism.patch b/meta/recip=
es-devtools/swig/swig/determinism.patch
index d6af38248d..9b021091cd 100644
--- a/meta/recipes-devtools/swig/swig/determinism.patch
+++ b/meta/recipes-devtools/swig/swig/determinism.patch
@@ -1,26 +1,26 @@
-From 7df78bedb666e49131c48f1854c6be1597bd133c Mon Sep 17 00:00:00 2001
+From 218e2a20ff978cb28fefdf7b35af8a27768df4db Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Mon, 1 Mar 2021 00:11:10 +0000
+Date: Mon, 10 Aug 2026 11:13:20 +0000
 Subject: [PATCH] swig: Fix reproducibility issue
=20
 Remove the compiler commandline/platform from the compiled binary as this
 breaks reproducibilty.
=20
-Upstream-Status: Inappropriate [OE reproducibiity fix upstream unlikely to=
 take]
+Upstream-Status: Inappropriate [OE reproducibility fix upstream unlikely t=
o take]
 RP 2021/3/1
 ---
  Source/Modules/main.cxx | 1 -
  1 file changed, 1 deletion(-)
=20
 diff --git a/Source/Modules/main.cxx b/Source/Modules/main.cxx
-index f68b609..0c2aba3 100644
+index 83ab22a..79a513a 100644
 --- a/Source/Modules/main.cxx
 +++ b/Source/Modules/main.cxx
-@@ -633,7 +633,6 @@ static void getoptions(int argc, char *argv[]) {
- 	}
+@@ -642,7 +642,6 @@ static void getoptions(int argc, char *argv[]) {
+         }
        } else if (strcmp(argv[i], "-version") =3D=3D 0 || strcmp(argv[1], =
"--version") =3D=3D 0) {
- 	fprintf(stdout, "\nSWIG Version %s\n", Swig_package_version());
--	fprintf(stdout, "\nCompiled with %s [%s]\n", SWIG_CXX, SWIG_PLATFORM);
- 	fprintf(stdout, "\nConfigured options: %cpcre\n",
+         fprintf(stdout, "\nSWIG Version %s\n", Swig_package_version());
+-        fprintf(stdout, "\nCompiled with %s [%s]\n", SWIG_CXX, SWIG_PLATF=
ORM);
+         fprintf(stdout,
+                 "\nConfigured options: %cpcre\n",
  #ifdef HAVE_PCRE
- 		'+'
diff --git a/meta/recipes-devtools/swig/swig_4.4.1.bb b/meta/recipes-devtoo=
ls/swig/swig_4.5.0.bb
similarity index 92%
rename from meta/recipes-devtools/swig/swig_4.4.1.bb
rename to meta/recipes-devtools/swig/swig_4.5.0.bb
index 842a7b0945..161c23f0af 100644
--- a/meta/recipes-devtools/swig/swig_4.4.1.bb
+++ b/meta/recipes-devtools/swig/swig_4.5.0.bb
@@ -13,9 +13,9 @@ SECTION =3D "devel"
 DEPENDS =3D "libpcre2 bison-native"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
-            file://determinism.patch \
+           file://determinism.patch \
            "
-SRC_URI[sha256sum] =3D "40162a706c56f7592d08fd52ef5511cb7ac191f3593cf07306=
a0a554c6281fcf"
+SRC_URI[sha256sum] =3D "22ae0e887f8cca8031a325c67d005207653200b40e71edb3f8=
8780e28e47d0ff"
 UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/swig/files/swig/"
 UPSTREAM_CHECK_REGEX =3D "swig-(?P<pver>\d+(\.\d+)+)"
=20

