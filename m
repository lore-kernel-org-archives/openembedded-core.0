Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.82])
 by mx.groups.io with SMTP id smtpd.web11.6174.1610013151686723977
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 01:52:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=rlwy6rBP;
 spf=pass (domain: kpit.com, ip: 40.107.138.82, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnwmfH0rw7ZiDFxsWDWix7FBJf++ayKd8Gi4Es7H+RZlSzP1FDLxNK9DcWCtPSM/vVOSYnPhgQ9YJcULPvmiNZjjV+2WYB42JpUlsg6MFUnDhOdUsC3x1oAd//+y7m2FlleJ8YdkfvwHkiwPswWZFy35EZAuY4usU0FQSPu2AjdSNK/tViLgSWVlrRVRX9QgiAdLNx2YQQk/1PFz880fICdUEV2bEx4fzmp8+/CcFS6xjORNzferMNlJwDFWMIqHCbbLCIXnmkLKQ7WQNjWGJpKpMnv9hPTsKSmQJOVHGptTGMAXbEOPeT23TcxH0AOOtMOFLTsSyMmmpgX+zCxPhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzwEuH6gsQhzRMf1uA6HI5YmhS5D4VJ2czaiV0oD0HY=;
 b=IYr6fBrwzgFYCNoTpzGSz9HJ94DaORAnKVwa1Cy6MLIKLfGGuKSBWw19nIMiRBe8F7+V5nxa4nnPo0NIjxzafUvpM21L03yeu+JtpNgJ5vbeDEXIBccmjr/NjKjlMxthn/014E6gX8u3kMYjr0YzJEbaJ/316LuUxj6jqQu7S1qcEWFlGIqy5ExBhLwF0gMjvoCKT4IdRrpU2iT6L8digrkAI3+ILWLA33rXKGeQ/m5RwA1sEoROdczpSsDM5GFd5k4tT5UpCihZuS5GJKbppLvBYStbXmUX+oXDRVkk8M3FfrL1E4E1XDS7gutWjDSrzjGmGlAduKugyZAgSwrR1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzwEuH6gsQhzRMf1uA6HI5YmhS5D4VJ2czaiV0oD0HY=;
 b=rlwy6rBPJQWMKsmv+TOo1e+RkSfseLBOUN77aM/fb90yo2NVWWaOL7+X1k5Rt2MWb8nCkNBhAnqAjjmUyeqIbvAygom0qe7+t2/c/2tCE9n90JRjbJ+DyBknr3S4++q5Qe6WbAH/jfMBej76HDVVeFYDfsK4rb7hYB4zyj1hO78=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:79::22)
 by MA1PR0101MB1925.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:27::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 09:52:21 +0000
Received: from MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c0c3:d811:3987:df57]) by MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c0c3:d811:3987:df57%5]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 09:52:21 +0000
From: "Sana Kazi" <Sana.Kazi@kpit.com>
To: Openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Aditya.Tayade@kpit.com,
	Harpritkaur.Bhandari@kpit.com
Subject: [poky][sumo][PATCH 1/4] libsndfile1: Security fix CVE-2017-17456/17457 CVE-2018-19661/19662
Date: Thu,  7 Jan 2021 15:21:46 +0530
Message-Id: <20210107095146.22342-1-sanak@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2401:4900:5194:2007:f9cf:4c7f:ce96:878]
X-ClientProxiedBy: BM1PR0101CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::13) To MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:79::22)
Return-Path: sanak@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2401:4900:5194:2007:f9cf:4c7f:ce96:878) by BM1PR0101CA0027.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1a::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 09:52:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7bf4411e-3212-4095-6e1e-08d8b2f1ed81
X-MS-TrafficTypeDiagnostic: MA1PR0101MB1925:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MA1PR0101MB19251D16A257A461EB325B8499AF0@MA1PR0101MB1925.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:199;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t18nh8SoHLxbRtAX7cuhLGou0WSE3cIZQLXXNMPeBgdWmpGWLtQ9JqIWM8FWPvHxi1g8FtF+J9Rjyh8AU8v5bXL70d6ZFmGH0CFE+Mqbf7m1E/L24yPxBnUXePatMel2nRbE8JA9qkHPQ0biB0sSir90jWWxMCv4aAFngTlQf/Y5Ldo6JHwhB91otmrzuaHbjcsg+ghMorYvIH6DuF38hwaCm0eSj2N9mgYrknGQ1t3TNPZ88IhJdRTD42zktw+6wNv9y+wNjsglXrZbv50fO2zQzZoa+zvTk27BM140BdPx52PJMn+tTaauop4crhbfwsFQ9/GUItOzbYGEuTxmVzu9zCoeA9nGSl1BN9+Cdec3A/MK5B65k9TF5xGgNU/AtdkiXZ4QuxKUJkPXDoWJCRtRGbzdh3p3hrN5TT/nxAWw7kPa2YsHRk1TPMjWujt+Hrsahh5VeFzKCqEK6yJLN7eSRnaiLQ+z9LGJvsdf+2zhFtvI+bdPshxyqIVZ/rHih+xFLPRm5NxIlHY3mXOZfg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(39850400004)(376002)(396003)(15650500001)(69590400011)(2906002)(8936002)(16526019)(2616005)(1076003)(186003)(6506007)(5660300002)(66476007)(8676002)(66946007)(6666004)(66556008)(4326008)(316002)(478600001)(6486002)(52116002)(107886003)(6512007)(83380400001)(66574015)(36756003)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?YaSE5U7JhO1H7QXUsp/qriks1MClmRMOrnkEdZUfbNfyJ3bY/scBc5m8uqyu?=
 =?us-ascii?Q?OtnLg1/kX6jHKqqvCrxfrcdK+XZbOgj4IOMWKHRQIZDFKvblwdCX0YxT+jWX?=
 =?us-ascii?Q?jv7mob6KLAGLOzClkiWw4JgKX0qJMRIA40JZbBIFyQiatHKam2v7uFZeIpqs?=
 =?us-ascii?Q?uU/WyCqfgCZrJ8vt3+gUvi7vwsE8qC2KlRXpaOX9lCwYT0s8NqyhtfUqh/iu?=
 =?us-ascii?Q?+YFEw3HMSU1UV1ixFbYjn8HL4F2elY9k4kWcmMv1P1R/KJdlQzSLbPDTY/9J?=
 =?us-ascii?Q?301w30Vtg83YwjzfqDeFpRlqgwfGquE0c0y4X2L9t7hmdtWMn3rvH/Xu1W5A?=
 =?us-ascii?Q?tBzDaCTz2V3EhHGpPKMMgSS+pWQ1oIDt8in7UDu/6WSNe64N2W+dbSgMqZx7?=
 =?us-ascii?Q?Zri4In0w9P+AOtBEMSQDfy+av3Qrqz6O7hVzHQPCN4Gdvf1mDGNHl3zf1YtP?=
 =?us-ascii?Q?xHiKyadjc3TtpDLp3aPbW8FzQAwcV3g7qTQ/smFkseO9gwnqwwPqbsr1Chha?=
 =?us-ascii?Q?f54+uHqcHYq4LlAhYwveaJbPIa3PCJyGHO+hure6aj0p5eOYzwp3ki1lTQ1E?=
 =?us-ascii?Q?V1szOGCw/jJC91dg0khd59C5d1sPK4Ky9lpKpVXf9TpPQ+pTapO4KKDv6CSW?=
 =?us-ascii?Q?4qRNjLGwndPT8QvwCj/O/Ch80gCLdc5VQjo1zIZKWb9hl4McZvCve8Rheaft?=
 =?us-ascii?Q?oRiIgCR4tCX0Plvx4MJfFHfTcyeY6kZS8x3IK0JNDp3EnDU9X7Kdw/oh2IA2?=
 =?us-ascii?Q?1IwiqNU9yC7B96R3Jfi84zjApbs6Ikl1GF3P6um/vymyDCeUE9DuqUcmb7SO?=
 =?us-ascii?Q?o/y6W21Ew/ouexJB8x70nZJVcaDJWIopOrRSKRCGfSIcLVms5+WeY4+l1Faf?=
 =?us-ascii?Q?gt8ro8cZTlwu+8ibZzhXmHD0uzAK9BACbneqfe4Gt97StYaqimDhwfofkFhp?=
 =?us-ascii?Q?G+IykzYwl7zb2D9JrwWT+9s0/eELsGDS50kJdPAyuZF4SXIA/wA7I4gEs/4J?=
 =?us-ascii?Q?uUIF1+n50DU0tcN4GqV3srQ6W1ZzCvjr123NKn7bFzbS6xU6WKw6tD+VOGM1?=
 =?us-ascii?Q?mMSY2p0q?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 09:52:21.1381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf4411e-3212-4095-6e1e-08d8b2f1ed81
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: irOpiD8XBLKj//4Ou6Dtp9lT66ysW2cifZyp2gD7EtlV0i6Iy89mElgOneOtE33u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR0101MB1925
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Changqing Li <changqing.li@windriver.com>

Fixes 4 CVEs which are backported from
https://github.com/erikd/libsndfile/commit/585cc28a93be27d6938f276af0011401=
b9f7c0ca

(From OE-Core rev: 8f4af329df5373db8910726a6b954652623003dd)

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
---
 ...aw-fix-multiple-buffer-overflows-432.patch | 101 ++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.28.bb          |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/0001-a-u=
law-fix-multiple-buffer-overflows-432.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/0001-a-ulaw-fix=
-multiple-buffer-overflows-432.patch b/meta/recipes-multimedia/libsndfile/l=
ibsndfile1/0001-a-ulaw-fix-multiple-buffer-overflows-432.patch
new file mode 100644
index 0000000000..c3f44ca235
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/0001-a-ulaw-fix-multip=
le-buffer-overflows-432.patch
@@ -0,0 +1,101 @@
+From 39453899fe1bb39b2e041fdf51a85aecd177e9c7 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 7 Jan 2019 15:55:03 +0800
+Subject: [PATCH] a/ulaw: fix multiple buffer overflows (#432)
+
+i2ulaw_array() and i2alaw_array() fail to handle ptr [count] =3D INT_MIN
+properly, leading to buffer underflow. INT_MIN is a special value
+since - INT_MIN cannot be represented as int.
+
+In this case round - INT_MIN to INT_MAX and proceed as usual.
+
+f2ulaw_array() and f2alaw_array() fail to handle ptr [count] =3D NaN
+properly, leading to null pointer dereference.
+
+In this case, arbitrarily set the buffer value to 0.
+
+This commit fixes #429 (CVE-2018-19661 and CVE-2018-19662) and
+fixes #344 (CVE-2017-17456 and CVE-2017-17457).
+
+Upstream-Status: Backport[https://github.com/erikd/libsndfile/
+commit/585cc28a93be27d6938f276af0011401b9f7c0ca]
+
+CVE: CVE-2017-17456 CVE-2017-17457 CVE-2018-19661 CVE-2018-19662
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/alaw.c | 9 +++++++--
+ src/ulaw.c | 9 +++++++--
+ 2 files changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/src/alaw.c b/src/alaw.c
+index 063fd1a..4220224 100644
+--- a/src/alaw.c
++++ b/src/alaw.c
+@@ -19,6 +19,7 @@
+ #include      "sfconfig.h"
+
+ #include      <math.h>
++#include      <limits.h>
+
+ #include      "sndfile.h"
+ #include      "common.h"
+@@ -326,7 +327,9 @@ s2alaw_array (const short *ptr, int count, unsigned ch=
ar *buffer)
+ static inline void
+ i2alaw_array (const int *ptr, int count, unsigned char *buffer)
+ {     while (--count >=3D 0)
+-      {       if (ptr [count] >=3D 0)
++      {       if (ptr [count] =3D=3D INT_MIN)
++                      buffer [count] =3D alaw_encode [INT_MAX >> (16 + 4)=
] ;
++              else if (ptr [count] >=3D 0)
+                       buffer [count] =3D alaw_encode [ptr [count] >> (16 =
+ 4)] ;
+               else
+                       buffer [count] =3D 0x7F & alaw_encode [- ptr [count=
] >> (16 + 4)] ;
+@@ -346,7 +349,9 @@ f2alaw_array (const float *ptr, int count, unsigned ch=
ar *buffer, float normfact
+ static inline void
+ d2alaw_array (const double *ptr, int count, unsigned char *buffer, double=
 normfact)
+ {     while (--count >=3D 0)
+-      {       if (ptr [count] >=3D 0)
++      {       if (!isfinite (ptr [count]))
++                      buffer [count] =3D 0 ;
++              else if (ptr [count] >=3D 0)
+                       buffer [count] =3D alaw_encode [lrint (normfact * p=
tr [count])] ;
+               else
+                       buffer [count] =3D 0x7F & alaw_encode [- lrint (nor=
mfact * ptr [count])] ;
+diff --git a/src/ulaw.c b/src/ulaw.c
+index e50b4cb..b6070ad 100644
+--- a/src/ulaw.c
++++ b/src/ulaw.c
+@@ -19,6 +19,7 @@
+ #include      "sfconfig.h"
+
+ #include      <math.h>
++#include      <limits.h>
+
+ #include      "sndfile.h"
+ #include      "common.h"
+@@ -827,7 +828,9 @@ s2ulaw_array (const short *ptr, int count, unsigned ch=
ar *buffer)
+ static inline void
+ i2ulaw_array (const int *ptr, int count, unsigned char *buffer)
+ {     while (--count >=3D 0)
+-      {       if (ptr [count] >=3D 0)
++      {       if (ptr [count] =3D=3D INT_MIN)
++                      buffer [count] =3D ulaw_encode [INT_MAX >> (16 + 2)=
] ;
++              else if (ptr [count] >=3D 0)
+                       buffer [count] =3D ulaw_encode [ptr [count] >> (16 =
+ 2)] ;
+               else
+                       buffer [count] =3D 0x7F & ulaw_encode [-ptr [count]=
 >> (16 + 2)] ;
+@@ -847,7 +850,9 @@ f2ulaw_array (const float *ptr, int count, unsigned ch=
ar *buffer, float normfact
+ static inline void
+ d2ulaw_array (const double *ptr, int count, unsigned char *buffer, double=
 normfact)
+ {     while (--count >=3D 0)
+-      {       if (ptr [count] >=3D 0)
++      {       if (!isfinite (ptr [count]))
++                      buffer [count] =3D 0 ;
++              else if (ptr [count] >=3D 0)
+                       buffer [count] =3D ulaw_encode [lrint (normfact * p=
tr [count])] ;
+               else
+                       buffer [count] =3D 0x7F & ulaw_encode [- lrint (nor=
mfact * ptr [count])] ;
+--
+2.7.4
+
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/met=
a/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index b28f675286..13248f5cb7 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -13,6 +13,7 @@ SRC_URI =3D "http://www.mega-nerd.com/libsndfile/files/li=
bsndfile-${PV}.tar.gz \
            file://CVE-2017-14245-14246.patch \
            file://CVE-2017-14634.patch \
            file://CVE-2018-13139.patch \
+           file://0001-a-ulaw-fix-multiple-buffer-overflows-432.patch \
           "

 SRC_URI[md5sum] =3D "646b5f98ce89ac60cdb060fcd398247c"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
