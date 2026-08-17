Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D00BC5CFC1
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 05:38:39 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23862.1786945108693264514
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 22:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=nJEJGy/I;
 spf=pass (domain: est.tech, ip: 52.101.66.31, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUw9HxKhkvRSFuVPld1VcQt7da4OF+zyNOPsjGQjoQFBsqt3NToAIhdKVa+rEYFVWlrJ7PLoPFAfh8M1OAOK+zk0UZ+VAeZlXz3ZYNR8H3rMjhYILpN3T6Y95X+kjPE85g8+zCNLecqYT1cU5TjlbhBSW8tGRRJkWyEowLdzqX4CKLdrOea7pu+0wtJTcmxbl0u4QCOf1ZLIuKNk4AJCGNswreFXF/Jn+ORVXytmr+78a5o6m6hzYQV2XTJ8zvCVKmYOuxswLYjmJmo8aJMdNNR5vjStZAPn1vhqUVSNFVL5Tn0t59OQJG/4DTDb44bHSAwqyCfpifys1zmYxxgkCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86vy7XXUOjynMYqfBCwsEESxG/nbDSNSEUdlGPJ2kBY=;
 b=kc0zgZpSNnGM1XfncvJEF9smBbrHw+D1ZMQXCawR8UJ1uRV+1o57fD/UpF9QUsBA+7vvvPjX9fNSrF11tjobGl1vF3zPdnrFunihB86mjV2qRPzksdaqzUgwYAZ2Va7jv0uqoDvCybPdOKS5UGiCYWe93yZttYm1uKtbQubEo3PnZyBSG7yjbhX9GuaKok7+Bg2O6s/bWjvK3OraApQ441XYwyC2/caITnOcDJ4oVF0rLf513YHvpwyegaoCkIrpNBq1LCAvHRVi9TXepQfLoN8/RFJ1Wrd7GvfSjHXheh1LgIHVX7hsYnY9qQoP2MvgmdQ4pas9c652avLrcEhqhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86vy7XXUOjynMYqfBCwsEESxG/nbDSNSEUdlGPJ2kBY=;
 b=nJEJGy/Ijnn4RgpNsPZM6c/b73VFMFdY8kIPASmB7fnhlAwaPCiPXE54TlkXRn+e3RiW4DEPbjFFyAnkRONQe8pWFdrHvQQDv5uIZE55V7VObaIf4hHx9yuwFvrEt0jZr/GjWfPOGS+nIeHshH+mdI/n+kpfFXgIiHlM/rmxH2PahiqDQezdH+wcvVVLYAec95EjxJ1t3WU/9HTx5wreRxDxnXQzAfoH6O4Voc1/KEwvspArSZ/V0ATldj8/4MnDp12lrBdy+HZ2OP/qeVEdXJFI0zNt7rMOrbY+rj9SaiH+4YbVdHfh13HnuKccbiEoTvY8svQXuUXsK9hslh0xGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GVXP189MB1984.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Mon, 17 Aug
 2026 05:38:22 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.007; Mon, 17 Aug 2026
 05:38:22 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] ca-certificates: upgrade 20260601 -> 20260816
Date: Mon, 17 Aug 2026 07:38:18 +0200
Message-ID: <20260817053818.43614-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0232.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::21) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GVXP189MB1984:EE_
X-MS-Office365-Filtering-Correlation-Id: 32f9dc6c-d8a4-4f0e-b892-08defc21c047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|23010399003|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	d9Rv7W3oP/W5xsPfhS6AAj/moefIpFGl9kfUsPD+mVM+986+h+m52Ko+DZ1TW6wqPys1g1dEsN4ShtqjTSu4mEGr9PYaHU33J3lttd+utiF8GBpuJyeb5MDHQOY0NxaK7Wqw6u/2Wh9i1xuj8z+3NGQ5rV4ozNosWtOYPFjiIIEZ48pI5DhjWsH5jIUxTcGjLrGNmuOVWpDhVskRfZYOQyCqm8OHZUaXVi7I1KEzF/35RrKsoy6BGZo2upiKjPsDzU2xa4FAUsQzgjJ39lgV8tLSfVgafnsjx2CzQlhFe9jZ1gKkQb2+HF5O0xypve0pnYsA80CGIaMkoka6DW95NicbxXuAxUk9tfyg8TfMCmV9jPhCg/kF02XhLcRvsh+Kcr+MtkCnG+33AQK4NjHy+xsf8Quqixav6Iw04C5T2p3v2g21rTWK1ndjKJ72L+UcZ3e6ZGWA/UY3p9CWZ1FvKD/sdp2fKkz8efRjNycb6aHl8K4XJc8z4snCOqQZi9WzZUWA4VyAg1L2XYIfd8w21o0LnMhq3CBOYwTgw1T8AFOS9z6v5uWaIdPrREZPJuZG4GzSk7SszWxK57qpZUmN3fypbrGovFHdsynsQHzldTpLY3Kz5zPWfpxqrdiYOCH0g0kz03cJaiPwiJTKLCYIDadJWeSINcFRHcOPqUj/Crs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(23010399003)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b1mwXYiDbxSElZ4YmbBqxrRChnEkjN0wpfUZIAGj2L/xlPTf/XAl7yb6ZAHS?=
 =?us-ascii?Q?ISyzVT/xpZFmK9CJEOkIU9LiJTWogGJoLeZCd3PqI9eOXkZ+RSIIJJPk9nZk?=
 =?us-ascii?Q?upSPqN8luN0VDSVZSGDBrlK6BxzZye8o0QKQwm4pMUUcH5FRtXs2+LxqRN+q?=
 =?us-ascii?Q?U4afpOfQoicyw+ITKRzKvWHZ2thSGCGnptXhSL0OpSedYRgf9983j72sIctT?=
 =?us-ascii?Q?8htzdGK6Vn2Jre3JdwQc81JJbXhRC8f+LPjU8cf5IEXP5uC4pBbSj6H9XwVY?=
 =?us-ascii?Q?cSWvEmRtBc7leZdEywagKftnNkVGCJJIbMrPjtHqkb/btsKuGW+AYFO4VcQ2?=
 =?us-ascii?Q?qrC6B3nN346P/lNWlG5psSyCKZH3PjetP+5tkKg6q3yPcCPgqhVYj1fiqnYW?=
 =?us-ascii?Q?veZuQnr5I7xPRbugfademdFyUHQYW3Guqg/XzYUhdrs0No0zHugsmfxeSsCz?=
 =?us-ascii?Q?+ZOymC6zMTcf+StxTW7rMhv3FrhkjDe9Vc1socjfrx48VyATPrFD4bAq8f6G?=
 =?us-ascii?Q?j6AxmlVYEdGCmxsnCsl04597vFjWTs/+lUVwtuGyV7nDSRlLIS0e7Ft7IJYQ?=
 =?us-ascii?Q?Uf2YSq25WKKQ4JpTeMkgRsoyWn/rOyfuhaw/KPZpiIQcS8Zxfh44iRR17h6B?=
 =?us-ascii?Q?Lf0eZ9vQW/9kgyDCtYlN+XCbiH2GyZRxFPZk009ayg/AIOuVI3oiIy3HWi28?=
 =?us-ascii?Q?XKvqfK7Gkaunyhs3+5QUYM7mvlIxkey52D+JQLad0ixZpRv2JgD+NGl8iqEs?=
 =?us-ascii?Q?4vSIPWd4GnJvz2YiydEjOSfMQzh87LhX7blmwJRBg/rm9hGNAiM4iDCxCF62?=
 =?us-ascii?Q?N9c2x8Dan+ZfvJ5WrVE9U0ZTZeSzmTryPlw2YVuO7NGoCwntDBxtMxztrBDq?=
 =?us-ascii?Q?lux3X4fTQIg4cQharkL8JbWpYBhx31vwnx0fskvCfCcgznSJGuztSPSNOgCz?=
 =?us-ascii?Q?ROd8EsPEjK/hru6jJkoNQYib/2jglwawJNmw+sRCb6i6gEGo/XNOymincwSQ?=
 =?us-ascii?Q?Wg/x1MDfafs9ge9l+/RIagJbRMB9igI6vgL5As5DJgPtZwa28mDkksouSIOA?=
 =?us-ascii?Q?kYRl+ZUjUybAI/t9C6zwszyIE9MNPyxTWDkTogVSmYjxUq65czZNPEOGOFLt?=
 =?us-ascii?Q?1mAz7APueOxSsIvQPc0xPYxwJhgt854sjPLw+KqgSyxsmIDaKgnszksIVigr?=
 =?us-ascii?Q?i2UuhuUhlWxYJUeSYvokHiC2z6xwCIUbyVyGxs4h2nRchi0x9k62jsIHaJUD?=
 =?us-ascii?Q?AjUlYCI+Mfvmjjl8wKsSyR52ilVD/+K525TI+O2H4Ne2492U/No0c7XwE/a2?=
 =?us-ascii?Q?dxMaSeHVu6OrZ4DbalcLD05RQHiSP10EPOxJjCVnUNdIJ6AQL3WbvoEIqE+/?=
 =?us-ascii?Q?wNrXwCgivFMpK1hw2xi4ng/gEbglsdvhFzXQhiC0RrBNUxCogw5y55DEgJdd?=
 =?us-ascii?Q?qL1e6M9nBpNM/DYyWmvUkvBPWdXEqNKqXGs8ZU2Fupnl1fXZlCXov0v0up3x?=
 =?us-ascii?Q?QKyDq5kFNZzSqssLXN9LOqpvVSeM1f1+HlJcpsDNqXq6ImN3Bcjbmzx8gaUX?=
 =?us-ascii?Q?gsZ0Qd6mlntkyOfr3yXhmAdhrzWaTUfY9vGwQqP9Vqmw0oWR1XyXySOHvYY9?=
 =?us-ascii?Q?ByPHondineAWpqkggljGzp15vToQARsLEUQ9oWKdjcC6mV05e+MaQUPxsFRg?=
 =?us-ascii?Q?voO8HZ9OT4a4Z6GdPIwQMr1CJ1CPMFHJ9/E+CehhLki/eVeiT8eOpaoVlGjr?=
 =?us-ascii?Q?gnCf1vJL5+3TpSYiO6teMybOlA3v5I3pHZ8vn4T9opbBny124wyUkMVrAdIY?=
X-MS-Exchange-AntiSpam-MessageData-1: tF7xfOPIi+lBGlc4/0ENmvB1DS2b7lT1qVU=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f9dc6c-d8a4-4f0e-b892-08defc21c047
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 05:38:22.4472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AMf233iqKW3iHrgiMEq+CBzaHuq04J5HzoY+hiGSwi6jDW3jRhdv4IcG5HM8X5V0i/fk0sNMDeh+UGpTZ5q2LDU9eWJhdjh8X5hLAtbti6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB1984
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 05:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243595

Source: debian/changelog

ca-certificates (20260816) unstable; urgency=3Dmedium

  * Update Mozilla certificate authority bundle to version 2.90
    The following certificate authorities were added (+):
    + "SECOM TLS ECC Root CA 2024"
    + "SECOM TLS RSA Root CA 2024"
    + "Telia EC TLS Root CA v3"
    + "Telia RSA TLS Root CA v3"
    The following certificate authorities were removed (-):
    - "Atos TrustedRoot 2011"
    - "Entrust Root Certification Authority"
    - "SecureSign Root CA12"
    - "ePKI Root Certification Authority"

 -- Julien Cristau <jcristau@debian.org>  Sun, 16 Aug 2026 23:04:36 +0200

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...vert-mozilla-certdata2pem.py-print-a-warning-for-e.patch | 6 +++---
 ...date-ca-certificates-don-t-use-Debianisms-in-run-p.patch | 2 +-
 ...date-ca-certificates-use-relative-symlinks-from-ET.patch | 2 +-
 ...certificates_20260601.bb =3D> ca-certificates_20260816.bb} | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20260601.bb =
=3D> ca-certificates_20260816.bb} (97%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-Reve=
rt-mozilla-certdata2pem.py-print-a-warning-for-e.patch b/meta/recipes-suppo=
rt/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-prin=
t-a-warning-for-e.patch
index 1226508c98..001b468624 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozi=
lla-certdata2pem.py-print-a-warning-for-e.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozi=
lla-certdata2pem.py-print-a-warning-for-e.patch
@@ -1,4 +1,4 @@
-From 743774cd53ed1c45bb660eddacf6dadb5ee3e145 Mon Sep 17 00:00:00 2001
+From 8ea56b7d5eadb04309dc3cf1e6b0d94d1d053d80 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 18 Oct 2021 12:05:49 +0200
 Subject: [PATCH] Revert "mozilla/certdata2pem.py: print a warning for expi=
red
@@ -16,10 +16,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  3 files changed, 1 insertion(+), 13 deletions(-)
=20
 diff --git a/debian/changelog b/debian/changelog
-index dbe3e9c..496e05d 100644
+index 7ad495f..058ef5e 100644
 --- a/debian/changelog
 +++ b/debian/changelog
-@@ -156,7 +156,6 @@ ca-certificates (20211004) unstable; urgency=3Dlow
+@@ -234,7 +234,6 @@ ca-certificates (20211004) unstable; urgency=3Dlow
      - "Trustis FPS Root CA"
      - "Staat der Nederlanden Root CA - G3"
    * Blacklist expired root certificate "DST Root CA X3" (closes: #995432)
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-upda=
te-ca-certificates-don-t-use-Debianisms-in-run-p.patch b/meta/recipes-suppo=
rt/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-De=
bianisms-in-run-p.patch
index 1a29da756f..dcfa355411 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-c=
ertificates-don-t-use-Debianisms-in-run-p.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-c=
ertificates-don-t-use-Debianisms-in-run-p.patch
@@ -1,4 +1,4 @@
-From 63086d41f76b1c3357e23c6509df72d3f75af20c Mon Sep 17 00:00:00 2001
+From bab2e13b69af12c1864cccf371ebc4ef57a6fec2 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 6 Jul 2015 15:19:41 +0100
 Subject: [PATCH] ca-certificates: remove Debianism in run-parts invocation
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0003-upda=
te-ca-certificates-use-relative-symlinks-from-ET.patch b/meta/recipes-suppo=
rt/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative=
-symlinks-from-ET.patch
index 929945b56f..4d97c81b0d 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-c=
ertificates-use-relative-symlinks-from-ET.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-c=
ertificates-use-relative-symlinks-from-ET.patch
@@ -1,4 +1,4 @@
-From a69933f96a8675369de702bdb55e57dc21f65e7f Mon Sep 17 00:00:00 2001
+From 8a5b4e2dd1479de0338db7a7234d037ef0f71c2f Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D <andre.draszik@jci.com>
 Date: Wed, 28 Mar 2018 16:45:05 +0100
 Subject: [PATCH] update-ca-certificates: use relative symlinks from
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20260601.=
bb b/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb
similarity index 97%
rename from meta/recipes-support/ca-certificates/ca-certificates_20260601.b=
b
rename to meta/recipes-support/ca-certificates/ca-certificates_20260816.bb
index 90a8568947..c9702d545a 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb
@@ -14,7 +14,7 @@ DEPENDS:class-nativesdk =3D "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS +=3D "openssl-native debianutils-native"
=20
-SRC_URI[sha256sum] =3D "7ab6301f7f34eef90a4d278647c260bc0762e0e14561f46498=
54cf4b0d4bea21"
+SRC_URI[sha256sum] =3D "d939bcdd0cb058712cf4175bac76997676eb8b68fe9473765e=
1b40fb3d5b186a"
 SRC_URI =3D "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-=
p.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-E=
T.patch \

