Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B7FFC5518F
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:22:58 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38773.1785745374729649145
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 01:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=tAiflPJa;
 spf=pass (domain: est.tech, ip: 52.101.66.49, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q7sbSudA5OaOb1uUHA25Yl/1dX3fFLjnI8VzM9Hl3j99J6eZyy8ZnaWh+mjoKPklpeiHMKPPg4LHZyQUTwOqBi7nkIzTKS+LJ4ocaIj+kSuOecjHECbpxg9RSBVh7M9WCwai510Id2OmiE4iRLZRdXPZtB+GhxIPggw+RIv1MXm8RLqZy2VY+iE1/OrOAGpPcirrnQtIRh5qpjfHZz8dSde+xzr5QAXCWiyQLm8Qx8GQs6mmEobreS7oHNc0TMKn/eCwHRgGJ9iuBWpVoA4dUNrP+6LEBvkBhuqXsyCjPu7JSPKxznMNNOosLFYCP/aQS7zvS8vuZr8QT/sJE5wbJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cjB8YeuGyqrImUZCiO0X7OE1M65Ty+fS5tyQpjQcj4=;
 b=YAgPUlkEZXCndBd2lHMWgh09gQHP4imYA7XWlSNmSG1cbm0G9z6m8T6Yhk4h0lXb+fhQoNrQsBQmLGadHwTxV1W7ofGVwxs+OloJWBk1Z4dQl0VvIsaU3bYrAX9c9cEDQztRhHG5kheCTSR5UWYNk45VDvbuQ5X37CEL8iuLrH+akeQZ523Cf7yAzPBK90pI/6ZGqKHH4U5fNWrPLVa+47X+sGK963SfVIRsaEp2pr08wmlI6v39WWjKJ5mSSCOMIDw34K45Zj0Bpv1kAWHVPgUwN9+eXl8BxsoaEO24cBXIeZvqyW5y6cFeavX8Va7OxMNqZn5K505E6KjG1sFbcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cjB8YeuGyqrImUZCiO0X7OE1M65Ty+fS5tyQpjQcj4=;
 b=tAiflPJagPr23wtAGrwdg3jdrlqItruIRsbLS+guKOlmYZXgmx8k/dhdfg5XYKVirCJgmQgypZlq6bnVJGTTb64oEL90WEyUM4G03l7GX7Ok0oHQWIzUhQQCRHUW1vSGaiHl4blSOUuzcCDe70yhKD9IFEsi62WAqc//OdaWHh7LC3nvqGAtsW/Pexf+83r+WnWlF2RJC39QYOQYfKuY7DzT9YHMkjtc5+bDWJG3fmwaUXO42OiM60ut59e+0QOcMFapIj6BEKuu4ezC8n80bwbMm6jYYkVXtgCIaniKP67Wp7c/T4nfiac5lFczUVWaireNbdonoO/7HbDNKUBCUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV1P189MB3098.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:25f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Mon, 3 Aug
 2026 08:22:53 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 08:22:53 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 1/3] libssh2: fix CVE-2026-66033
Date: Mon,  3 Aug 2026 10:22:40 +0200
Message-ID: <20260803082242.44009-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260803082242.44009-1-jaipaul.cheernam@est.tech>
References: <20260803082242.44009-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P251CA0008.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::21) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV1P189MB3098:EE_
X-MS-Office365-Filtering-Correlation-Id: 97565d9a-9a88-4318-5023-08def1386a21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|13003099007|10067099003|56012099006|11063799006|12006099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	PPUzH7z4oO+PUxazj0DoR9f9uV+FaFkrpijGaDXMP9zVJsdsePxOh08cXptSM1/d9ldupfB0RoHzhkbeaYN2vS5yblEccp+SdSeyzPVbr/WtJEBb4/ajAO0KBpp0Qv+rb1bpqCD8ob99JayjhPKIk4WMLE+ET9K0VYQSW9rLQW3gslzUCMbK6QXjSmJLl1RcbXHioKvZ5FppBJIdXfKTAQYxUySSiHdWedfKXwm1YNTXF9cw1Pn7SeWHeuH5IcL1sobTDbWMYS5LZwDN4LfPmKoEY3derld30Mu41e3AkBV8kRQMQM1GVA+SbC/XTQEx3zyCbbUIFgQMYB2D0wmWaiKvPOmyKNrPMofivEX/hZ49GL+AzqMKF5w70lc7HvwEyLomD9xb+qI4J9ANrAGq3x07iFihu2JfKWr5/t36HmtKi0InQa25Lv+lJ/zipHOxz9+6ZDtEtY3ghRGrgB141JAIWcLb/tAWIJNHdOC+M2aijwPQkWNkKlL0uNNV+oYBiLi9DR0ZKnqYia9fFs7sUroMr3dvc4Xy+i6nR716bTL4I62xBOqQP9mlbkiqvXI5OVRkq8oWw+ZRa0QUNiSn3jowLahCncuETfm2QFh5+RmBje3PAy+ooybK1E/m+Fe6xrIduNrgEzZ2oaSCqHTpWWyy6g5ie7ju/d8XOLQgFlM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(13003099007)(10067099003)(56012099006)(11063799006)(12006099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6QOnOQ9qP/j9890DaJ8+8XgLDnlZ0XtEaQHboEuOSRMlwAn48ED6L4YMl4uo?=
 =?us-ascii?Q?DdJ0LWWIdsA+NfCVvyJtS4pXhBosay18Ah3M2QseUWrI8mx+arGz7qfv0QI9?=
 =?us-ascii?Q?t1LKBv0G8JiOgfEHRkz1NhsksQbahAG5+ZEzpqG5dApUWSMH6iCYAMPkZZy4?=
 =?us-ascii?Q?QwrDnKR+u1KYT12Ccp+y9o4fSC0t1oeB+hrJZDOOa8QYPk9ZL5ald2PJT4Fy?=
 =?us-ascii?Q?Zua0y+LKu2C8UX4/4WAaKfwbZIsohEnnicfE0NgiSFVXZXQfdL+hT6oixaYO?=
 =?us-ascii?Q?bUwuJdtIZiNLFrswfF6yxFXX8cJTSw4Tw4Eci/PP2GMEErm7Bf1am5psYG2c?=
 =?us-ascii?Q?q3hzreciHyA+O/26pqyy+fYNCM5ZUFy/1XiHKA4FULkVouktDFCMEEYtuxSy?=
 =?us-ascii?Q?6lhk20iQPWS/t/mh1vgkKXTOZThALk8Sibr5HIgcVkfaC/MCx+uhwRO+dJYg?=
 =?us-ascii?Q?GUPs/DMO7pnLDZrIRxwZ2Z4pRIdsEgU2Wn/dkT9bEHQ007M/0tI1ZzAw3v7y?=
 =?us-ascii?Q?f6vCcdubA/aXznUSd/SM4eUD18Xohofhj9hQsjIf2aS2BS7e6sVYavRrwexl?=
 =?us-ascii?Q?MDlUfi+LCEcZM8eW7Ww4muAtV02EUohIlFqDcqvKmHgD95YOShkn97tbvigY?=
 =?us-ascii?Q?nSNXkrimTR+6nCW61Jmb70In3JJICm0hK+mcGtG+UKkmC6X8fWNftAAfjtaA?=
 =?us-ascii?Q?1tiYNS3BlsghbOw7zDu2O/0F5a3rOR6Lbzztj3x1g7KAUW8DZGQno0O7gkEm?=
 =?us-ascii?Q?ogOBBS4gT+6/s1hxmtkSa3vhRsDS5DWk2cs/afzWN0OTPIeu4Ob8gAPX317e?=
 =?us-ascii?Q?J5oVbmppLDYvhKR+QkWBqNmqh0BlJVVE4YyytO/La9fq+NOFeYykT3fNrZPW?=
 =?us-ascii?Q?EUOHZAN2umCmk5DZmW3BwkH55EjZZzZaqTXS8vgmI93iobmd50ZqEaeNCixv?=
 =?us-ascii?Q?KajDY1M9u1XiE7wyiBqs6pzBxNPmoVHNCZUcf2aaYjCSQWX028GW968f43nb?=
 =?us-ascii?Q?0+28vWqSMEobuyi1XUvfI04qporjD9kmwRv2BscgiPUlpLVDIfmzKmHQjvKA?=
 =?us-ascii?Q?4hEcH3wByDvDJ02+RZCV4fB9bx59PN6P//KorxwqI2d8FxcOPAtYiF2HQOiP?=
 =?us-ascii?Q?NgC2+KhnAyLHbaAUTGOC8y72CsLi+swBAgvKcJSiS+RyJtK1CPfoT8A07Byy?=
 =?us-ascii?Q?6dxmk/0sdR8JrIHzPXik+CfrDBbeNTzkIWEw4AyA9jQAIu5KKl1FPIhbRkqR?=
 =?us-ascii?Q?hulJ1lFU+PmmRATYpypYaQUZJYG78xuQXD65oh5G+zCNq6fdaDEbVLYGFn6n?=
 =?us-ascii?Q?REOyWiGFSddfBOgKwesDiv/JlOi0lvQ/F3Fa9xjaPeNM80A632cAbtOUzm7C?=
 =?us-ascii?Q?eO4px1RhBzZiCBquyjcl2ZSsUNIxWFDNveyIwJqXsJefV2gW0Cp7OrI+U+bd?=
 =?us-ascii?Q?6zhHy2r7L2E+cYq4utIzLJ3hjBZA0bgsVU2RL5Y9xxeGyqJ9NOOJPkb0rLub?=
 =?us-ascii?Q?Pqg5o8TZhT3rEwrgC1QdaUPLPvR2qtmiTB5jFQncTSB/VvRy0gtVjKz2JZFY?=
 =?us-ascii?Q?L7Subr0aI5sYsAjsfwXsGB/bPG7D+95OwU0siST2qq370Uww0DnTjjQ/DceJ?=
 =?us-ascii?Q?hvm5fn7cU2p6mwqcDgx7gSagzWKOCMtltgpVIha+BXnDc5GTKIiTXaUTQkRi?=
 =?us-ascii?Q?YepJMVqSP1Gzbh8mtJ5B+1trDvouivPoY8aZl7Cx3SmhLdoUuI8OeT538r4Z?=
 =?us-ascii?Q?FfSrRL+glQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 97565d9a-9a88-4318-5023-08def1386a21
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 08:22:53.5418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOIErjHNRZhDskWiRITt457SEfS5TLQ3yyEmUF5tAL0WVMN5cIOg3APnmB/+WzUnrWyLYb+JlqOQ2avc8w5EO6wBqc0MW3BZZqeW6GoGEZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB3098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 08:22:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242618

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-66033
https://github.com/libssh2/libssh2/commit/a2ed82d40964bbc0d64cd717aa0a5a892=
117d2e6

libssh2 ptest results (qemux86-64):
  before: PASSED: 1 FAILED: 0 SKIPPED: 0
  after:  PASSED: 1 FAILED: 0 SKIPPED: 0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libssh2/libssh2/CVE-2026-66033.patch      | 45 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66033.pat=
ch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-66033.patch b/me=
ta/recipes-support/libssh2/libssh2/CVE-2026-66033.patch
new file mode 100644
index 0000000000..bb046a6eae
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-66033.patch
@@ -0,0 +1,45 @@
+From d1b6996c3b31ce6b60d5a820ecc33880e61ef0ae Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Thu, 23 Jul 2026 10:32:04 +0200
+Subject: [PATCH] openssl: fix potential OOB read/write with AES-GCM in
+ `ssh2_cipher_crypt()`
+
+By applying two bounds checks to non-debug builds.
+
+Reported-by: Vladimir Eli Tokarev
+Fixes GHSA-c4f7-cvfc-33j7
+Follow-up to 3c953c05d67eb1ebcfd3316f279f12c4b1d600b4 #797
+
+Closes #2401
+
+CVE: CVE-2026-66033
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/a2ed8=
2d40964bbc0d64cd717aa0a5a892117d2e6]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/openssl.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/src/openssl.c b/src/openssl.c
+index eba05031..28ae1cc0 100644
+--- a/src/openssl.c
++++ b/src/openssl.c
+@@ -1042,13 +1042,15 @@ _libssh2_cipher_crypt(_libssh2_cipher_ctx * ctx,
+     const int aadlen =3D (is_aesgcm && IS_FIRST(firstlast)) ? 4 : 0;
+     /* size of AT, if present */
+     const int authenticationtag =3D IS_LAST(firstlast) ? authlen : 0;
+-    /* length to encrypt */
+-    const int cryptlen =3D (unsigned int)blocksize - aadlen - authenticat=
iontag;
++    unsigned int cryptlen; /* length to encrypt */
+=20
+     (void)algo;
+=20
+-    assert(blocksize <=3D sizeof(buf));
+-    assert(cryptlen >=3D 0);
++    if(blocksize > sizeof(buf) ||
++       blocksize < (size_t)(aadlen + authenticationtag))
++        return 1;
++
++    cryptlen =3D (unsigned int)blocksize - aadlen - authenticationtag;
+=20
+ #if LIBSSH2_AES_GCM
+     /* First block */
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-=
support/libssh2/libssh2_1.11.1.bb
index 0fe22081be..67dcfb3353 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://CVE-2025-15661-1.patch \
            file://CVE-2025-15661-2.patch \
            file://CVE-2025-15661-3.patch \	  =20
+           file://CVE-2026-66033.patch \
            "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"

