Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391F1C5AC67
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 06:13:49 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48324.1786428820246534812
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 23:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=kKGqzxYJ;
 spf=pass (domain: est.tech, ip: 40.107.159.0, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TNyjEN/rxIM+nIFwzZob+OgAN3dhIP/xvTjAAW9+GfCWQtsFIgQKTMrVkhsjZ+kmB4QTi4p42IRVLjiOmo6OfZThHoVCVOlHjUmmEBC+fVpJd1UrBdPRoX5JkV4P++Gei19G9SXN0v/WDERpAidOv8qXVa9CbNZIRct2aHvRXu471EdQ4QyYEDlYvdJ5ogvZnJCWhxzJliqgFx4XfUjeQSNaPgjBj1m8joo6tWGADRWKoMZrxZNAPw151NhE7wtXCmL9fKscR521ziLT6uX69sITzVzcu244KRHXzbKX6PcHZm6kMr+M9OpaNSpqq0Qkfj1AklrzwWJVtW/4q96dUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJZmzcAhnU/8yO4wXe/84V8vOM3cMiaeUPDsbDKxW1U=;
 b=nbBD1KotTY3pz7nky62PrKIdr/8hMbjG1WZUq3F9RLRIgI0xpOuZPZ1pDshrBuycBXdDZyDi1el12xhmlNQ0OxBSe6Zw3MnFuvbFQzXBT0IHTgtkQqehRR4ai5cvgG8MGx1dSw05mU3gifCQw8FOysW/q6OMWIUnIYjdw/RADZgAabmNn6fgQSggkVCilQ3UJBZqi4MXsXN0Yz+ko5De/60ijJiY/Pz1knXq+/ZFc+h4sBZiVdgzq84XL7GC0SsxsUrZ4qAsFzIwwxwlhvj+l8DasaoumMT9nPD7zTI9ezNPvPt2HrqMs3KFKpsuDBH3ZWCARHl9fSplORv1qkRiKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJZmzcAhnU/8yO4wXe/84V8vOM3cMiaeUPDsbDKxW1U=;
 b=kKGqzxYJi5mMtuwA63WWOWt0OlJImpnqxx37gFsc04wHmCF1271kgiQdgPV+1gUpsJZDhOuWEq+Ltln3JWIZpG3JPQW3JKRLf+OvTpaEILH/Ma3r7bOdcHSG1HTuWKTvB29NZsbIKYwTQghnwPw+dW4wQtJ+/XaWT6U3kVda1VT198ScffUj4bJIFlfY+x42uENVVK251WuSSEBrYeSbZeE5jMBpwqCitnadURpG98um74FFWcrl+BBTMnglgqJwR4wcuDqrNXsuY76j6EX6B5s3rZ98b5GJm5kHRjBl0B2LFnYIJavipMwi3aCGFLCGnZf0iTY3fQ+cGW9qtN9e0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS2P189MB2581.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:644::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 06:13:36 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 06:13:36 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v2 1/2] swig: upgrade 4.4.1 -> 4.5.0
Date: Tue, 11 Aug 2026 08:12:50 +0200
Message-ID: <20260811061251.14757-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260811061251.14757-1-jaipaul.cheernam@est.tech>
References: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
 <20260811061251.14757-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0057.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::6) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS2P189MB2581:EE_
X-MS-Office365-Filtering-Correlation-Id: c265f9df-10a9-4982-e803-08def76fadda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|23010399003|18002099003|22082099003|11063799006|56012099006|6133799003|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	CkUHFsGTFzGclhlU9iX+AVmtTflGi0iWrwvo+HtDGc0L44Ttf3aZGQn4UFQwbQ8jv6E8DPSQx/way+uSuV3aXBLiSMRQlwx8e7dm5GOi/tXxCi0wOVfEl2qDqF30x4oCULOHar998w0hMEQ3NZLSrYZK7aSClHUOLJLBk3nPP1msl0Iyj5tbzYv9o8r2F0zZ3mg3GFU6R9eS7RkNLkdQgREHxoaLPCnglwfCdTeB2cIU96ASNAQ9aSQc2+ZYDBv6VbO+sS66ILiPajUvhJLSoqeAu4KicRlYHxtRmFQZE2ZYHS/3kkqwX8PKTZWsoeuYoVt0UgQ7fniD8f0On19eech7VQEMsvCB407D/n6EWAnVybDgPAxVeuow6tVR7hppvHHJUEEzq78iyh9HVmiCuwxVZwNk8e/Yz9/1b3C/rD65Vj0ghY3xrSj4/VmLqmGk9EO5G+LPXNVRFXKBdmKl4ScJmn5HSNcD2Qdc22F8QzcTAJt7FMjkl+aWwEWm5+OPhCX82NMaSwr81+6R4O/Ws82NL1qhmmwkdXoH1lRbt5zZhhdrBG9viwmqXbuhqksgSHu9OkgeoklOn5uj8teQ/e3D+BKNH0UZcTB+3IQUTgZr49jeOu4sUv48/8Pbw5DhTJigsyJa4snX2Mcel8ubC0rouoxX5i9RCx9Cs04Nm/g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4qyZA2Xj7ooUj7Qo1jPps2h8LMF/5YKYcD3gWh/MPMGQi35Z4xwG5mm/sQop?=
 =?us-ascii?Q?PG+aalkwqUwq09qnXSAnDdi5hFhOb0ucdqzKsSH5XNX10ZAgFOHWLZ22BaqA?=
 =?us-ascii?Q?KgOvQtNtiwtvujHEN/Ktcv7IKiaqwHNsssQXoEckgRIF/WvSLibRu84Ke5E/?=
 =?us-ascii?Q?rr63JWLpUmLs4mYCTHwEf9QB2NlwVPYHwSu5UxvKfGBMXIwAR80eLX7IQ9vQ?=
 =?us-ascii?Q?Uv5ZN/HSGAXeESkqLVUTc8l0aZVjQoLDsjfbvDgCRFB75mTN4MSQGWLOogPl?=
 =?us-ascii?Q?+A6/IxBLLQHn3KxqwwpCJI8q9rsi69BbhFjRy+cpgpEDJYT8I541N/2oE2HL?=
 =?us-ascii?Q?G3UFJ2FXzgj0AD6twTrjLzsFX0sVFEN81+LckU3J+moYoXb224FzVWfW7ZdW?=
 =?us-ascii?Q?ypK3nsxCF/qE81RPSn8lYSiSfwSohxZ6BA+mhjuZLE8suraAglkMRUa3VuiB?=
 =?us-ascii?Q?LztCAkgOsE4j30Kxd7Ulf6gcB3oIIfcIs6n/GgWjbCBM8g6QoDAUHYufVyAc?=
 =?us-ascii?Q?qbmvYsN8C4G/pE8vCSaIYBRllx9+4YjEkTj8vbjHDTXK4Y6+w1wjnqVkIv4e?=
 =?us-ascii?Q?OJoLBXjwHXpsR7Myak+ulCyUBTO3ODC6/DSBXj4svZXWqKUUtgldICuIFssp?=
 =?us-ascii?Q?K4Ts0hu/9CXW29P4BUKp5TbFn6s7n4g20wVm3CfLqnc7mYHxiZ1Kb1eS1I0N?=
 =?us-ascii?Q?vJzaVKWj+6Jzhnyeps3dUrt7VVqDZXJR5ZQSrsh7Cw9IRnZD2Hq4qmL8DTNT?=
 =?us-ascii?Q?lvQRP0BAlx6dBey9KapwJwAL8E6jy1nV+VPOni16850UeiLTH36KgFgwsQOr?=
 =?us-ascii?Q?tinZD0DJKzzL3o8WByebRg3dT6cebYBFq914kVV5kqNYKj3x0jwlZyKDRCW9?=
 =?us-ascii?Q?3WpzZCIDykKBVw4D3Luy9wJxf/QmlTtOsqXl6UHs3BfJLprk9zclxZp6iCo/?=
 =?us-ascii?Q?Ws86GKFLuBf/7rfEUMFcnLlsz7wxN7t8NG50rRZwhuij+h8t6QtvlkKQEZIV?=
 =?us-ascii?Q?ZX5a4xPDvnq1Jvmy6D1ougYCmHFTZ77L4z/SLRHCKw6DmGEgVkA7FRk66lcG?=
 =?us-ascii?Q?6X2LsC5Qb36FNed6lxaARPMQ2atc2vPHUtVMxDzv9SSYEksWg2+/0PCHdIl9?=
 =?us-ascii?Q?bui+r+TZkbXNKCKp4d1NG0ZbAFy+vLp5m9vQrJnQDroM5AYpWt8P+7DoWfWS?=
 =?us-ascii?Q?sDaE2USHDDQPal/HFPTJ4AkMOxX/xXf0+/Y9ds4/QdDjBQvBiHtNiaDjVft8?=
 =?us-ascii?Q?dWc3nfwokJl7S2aeo55Hyi+7Jb9/XmGX5oVCk0ga7SvG5zebvUAc3Wt/kA60?=
 =?us-ascii?Q?qsEEyzrp1Y3uaMtMh2WaF6ZaIkunCEfUd6YTrgoOr587LPMkvUEpYys/ShMQ?=
 =?us-ascii?Q?nllpsqxy8pPC2kHIGpdLe24wBwpOtT6PEjtAjy4Qe5FN33qeQYfs2k++W2ye?=
 =?us-ascii?Q?oybV9+hMFK/jRMlSUXUZn4EAFqhcdyiG4GO3mBMm1yg2vZ2G4rSfzPBDkZFV?=
 =?us-ascii?Q?hX98o3CtvJdJLfWcs3biabdT8K9M119i7tWAD5mjgZ2Ia4bdw163qmXjLUEa?=
 =?us-ascii?Q?lOqfDaFWcI0mkgMzUcefnPsziWO3PqGwbxIxiQIY7k/WNK4moTUurYT9Buvh?=
 =?us-ascii?Q?uroXvGy2RB8WFiaG75AIuk8hjlwhE7MYT+CiSPTMI2MOUDuqflCHlOHLbMBa?=
 =?us-ascii?Q?OYRrl45LAYBviY24OC8SD0wpWgTHiGpLx8XucdDRr51mpURI8dAX29dAp1S3?=
 =?us-ascii?Q?HEiTRvxy3tfPxzho2FD69fZB/R5I6iwpNYyCGt0GdY87nookiPE3Q2pedkoA?=
X-MS-Exchange-AntiSpam-MessageData-1: 3wwI2puqsQNJYytfJ0uXnfXq2zi0HWCey60=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c265f9df-10a9-4982-e803-08def76fadda
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 06:13:36.4480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nk5bKR5BMKZ+5vOS3KcaK+YAmcJ5vFxkPEGZBFOLDErjWxJ4GK99dC6jhGCtqpS+DPIODSmlFDyzzOiyVlfIiuyu/XgT0g6P7WqdjKp2V7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2581
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 06:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243151

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

