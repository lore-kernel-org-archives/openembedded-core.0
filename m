Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC67C43602
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 14:34:38 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.175804.1783434874181325360
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 07:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=dKCRhOnA;
 spf=pass (domain: est.tech, ip: 40.107.162.22, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFVe5gG9Bv0Pl1qYm9FxJKRS3pt5zpQ1WQ+ouT4/pD6Zp1nyflj4VtvkKldBH+5WJFqfdOcP466aFvZ5Dz4OcBURg+97a7hxkETDBdbXeI0FfJM8dQ6cv7m9Gs1TqbTh7yve/xg11CtBUoCKh2aExtcP5zMoMO/3/pdJUIhvFAeC9I2gwk+X8WtEWWQnZuyl8pLGk9gCGIf2gy5bz9cbqlUwPPwi1OkM9pH2LHFRitV1Smp8zTIwXJJ3BzAXQdUfKK4vpHcfwZ7UXZiMjTVDtryFudZ3SdOprvye0kWfx34j33/4JzxBuHUIC1+nEgu+MCSMo9E3+n81saj/OAM71w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4IFcydbjkeB3mp8ZzEDy5MWbVzwPutCItMlJ11u+AA=;
 b=k6CR5f3OhpLa4m9W8t81uWUgZTmCqFmecJBXuzcCV85yf7LiWwgooCrc+nlR0Otb7HI45UjFnT3corOVQIApNp9J3t0/TsW7JlbKQTSMrnW0QITxjTkxPMgJi8QPuywX78kr++2St9B29L9upVlNGN+hS6Zca877n6GAvLUNNA15QKXcqAgRlk+c3hTtAAexfdg55g5pUROQ85DrUYa1Yt6LA4iq0XLV7qHafZLKNGY0x/R3uELivsu/hrq/CQ4jFc5mKGsIgFXuAOROyzI05ZeG9m3RKUCagDVL22qiQgCHqjI9rc0JwA1HMVpqNrN1GhrXvuAfVPdFzH2H+Vnq2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4IFcydbjkeB3mp8ZzEDy5MWbVzwPutCItMlJ11u+AA=;
 b=dKCRhOnAhEGWKXxNpt0FLkyp6VK7tZBJ6KD3I5eIsl3r9RgnlIpurP15W96XdXJLlvJoCw2tADr+zuHyBqXNUthL7W0Cy+3Np/Tbe6EQPW7zCW+k2lONxDbJvEvBkI/gRcx6EbB+SUeM0+tZIsYuJlVdKMcgByu4z4r6Qbrgk6x83mLb126NXF7U3dozcwvqtrqePhXGBtoYt7EZGApL9WgZ1C5R+Z29dq7bYa+UXutOSLiFim0XPtdCXO/y2xEnf16SCQNndOOCPEa5JGElwC3ZfNTzXAah0u1Cm2GPpP5q2oApedF/1fQ18MYzzzRyrEDXhZG7oUo0lduSr2tTXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB8P189MB0902.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:149::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 14:34:29 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%8]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 14:34:28 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] gzip: fix CVE-2026-41992
Date: Tue,  7 Jul 2026 16:34:19 +0200
Message-ID: <20260707143421.34255-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0230.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::19) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB8P189MB0902:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ce29ca-b540-4ad0-6533-08dedc34d8ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	AsJAwy4O9aWZNQIM3kfRFOzOQ/tt/YoeXT6v1pI+ukCh7vDIfeJQDabdaTIXwO6dyFPzD2rWsQaFmPT3LDmjbAyJuR27AwNL1zV2+W2NN7wAX4epgjEv3GGPkZ+bs7XHspoFUIODiEy0BeyjSlt7MsvQ/q62SrEr1hJ98ES19c9QADPKXuWRpqu8DuDLNNao0atoi37KH8+hgGuheuNvTiyEnF8yvrGTuoTt5kugU3a+YJ2DZcuFRGAK4cqx1Tw1uz1nGHxbr9bLZ0sh2A3ihmm7cNynbaE2s3vTEyI53/Nwy2A0bSmLXB+Tk1EzebUG5sXQe6qX5cJwIn+oTKfDhovxAS8JXTUCykg1LxSPZTDUvWjQ2Lq82ia70r3bXqx03bOXMLWc3AAo8yU6gbUnbxexfkykpZ64MhJBSpkxejFcFyf4sbcODFW9W2XpTbUD3BHvmm83ohzzPYDWGJqL83Akjw+2lx5I5akKmRFN7cFhMpqMl70NgwXbNpI1EYlmnZkjKJ12fT/aMmw1ptVs8SmdwtsNOX7KusYaDT1Jj0prbtFfICreQhUkyh33y1Qydib+I8yrymGWgBxzMTsXfctN+f4bwRSwTLAH2+RBbxEjPS2LZIF4GMHfYyWXgufo9aIaMoLtA2TLoKoIDsvT9ssQgDiIy27iQlijxPMyh5s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T/FSaHJqO9LldUEkhRfvQ+x7pLWrQTeHgQzjCoZx+UBHkwirQn4d4lIIhZt6?=
 =?us-ascii?Q?p8r392d1tTEOn1xq1U8ndc6WlzbB0qPoboM10fI7feRBXt9mkWjF8pVT6xVi?=
 =?us-ascii?Q?UTy5LNAbl+XbESgVt+PwyNRhaeU771xSycmqvduVKpneqvP3jaFhsWfDAma5?=
 =?us-ascii?Q?CTQzMWzSQw/s2aQhIcT9i7jmYRPWjI1QgblnaGoj+CnaL5yIvRiwmUlFXJr5?=
 =?us-ascii?Q?7/ZddwerhNjgTTv3XHl502p0qD+FMgRy3LKwZc+hTDo5Appwuhbj/ykc212k?=
 =?us-ascii?Q?9D0n8DbAzc4++Vso6VUkqMWmzjv+qyWb32MNHuUes8vDD0d917HmYwunYHLA?=
 =?us-ascii?Q?dk6AYF1CO8+A8fyBMIFaglO2a8hVNJnVBKQoEayaGScTnI4v5pJclXHIJl2N?=
 =?us-ascii?Q?A4ZclryElV1me3QMk8WriprpBM5iGjbU8Lt245KMDCRYeWmasZ9zpo/larM8?=
 =?us-ascii?Q?Mr5VMzxJybdFF58Zpo4LLVbsNtIN9PH/jRLFqUO9hGFCuCw3NUbQvr7ZpJgU?=
 =?us-ascii?Q?7L8/4vc2Tg58v3NZ3G9Z6TKzZ5lln2K4QhiRhNicCTOAb6Du6zPVR3wKnnBo?=
 =?us-ascii?Q?iNhNIPLvDcuUQsjIkJj5atbBQ5ztftIc+G01kPIHuv+BZ24ww6cboy46phMw?=
 =?us-ascii?Q?w5/WruoMscyPm8LOJGZhHq9njC+35OHVdkttI8qizwOWC9oRRRTilO9PQS/L?=
 =?us-ascii?Q?k7kXuvJ+9hP7RF+MizAVg31yZf5eG5pzF1OveVsAeyBZx4pW4oajVs05C6J2?=
 =?us-ascii?Q?/iyc7A899GKQqVy4YmUN4X9DUJy5N/c8GkXdyyXJPlirsTGv8pNjkSwKJO0l?=
 =?us-ascii?Q?dyWgTIJpvlOBfnVR8hvjGHshzS6XIzHnZOumXGeP3RavxvzQF/vWLO27MgZt?=
 =?us-ascii?Q?T3n9mFYaPfED+oIG0gOjx+s98B5nOzcQdq18N8UjY/9HumUT/nimjsla6uqm?=
 =?us-ascii?Q?BPSaNEBm35jcG20M25AfW820bsTgqxA7AOG5KJQJ4b6+ya8qo5E3AHy02WYU?=
 =?us-ascii?Q?NhSbRRQ2iwqUFBELxT6mfoBA95afP6Iy6gno49kVTe2VeIcuwXsJf0VaDmER?=
 =?us-ascii?Q?l0ymFYRkkcCDaa6tOxfzS9VQm7kqaKiMFMxVb3UlT0FI/OesVsGeVvYNsc88?=
 =?us-ascii?Q?/TlXTOAcjemZMOd6BQD/q93eo3xeDj4ZQqG5s8FveQ7UIstiXO2/kv7DO/dx?=
 =?us-ascii?Q?xdfwdoSPUrzNQn7oxaFpOWZJSm5TeVC1wWzB/6pbkPoo0/B6wMJ3jV01w5rk?=
 =?us-ascii?Q?i2WyAN6mLRL0+1S86zzX4TvbE9woVompm0gqedPSIAp0hFgz0J7mM0TWmx8M?=
 =?us-ascii?Q?CJQdNyQUrKV4IiiKCsNVvJwuVRSGxerP9JqipgJ4CEMf/2lfSFVIHTc7eyux?=
 =?us-ascii?Q?pgf2u0jHutVOeYqruyxq10m644r/4GgCINgWcHqwKWKWIwGtT0JUdUfIF8O8?=
 =?us-ascii?Q?cyxIfW7VHTNOFzRNSS753R0Obeg87+m4dm7QvmHImpDs1n5BpXo04ldy3dF/?=
 =?us-ascii?Q?0wKMrDJqUBbtbEKhUd5L4rs6yF3hX9a7FbNe71f1w9/hAqFRP7cI4fZwCp/8?=
 =?us-ascii?Q?ZBh07k/Dyza7fn3p09ZUUSOAMJ5Z8/2fFh48vx6Gwc3D2G0bTLU6XT+dyvO8?=
 =?us-ascii?Q?2RI0BT5NH8C87qENnKvN4w2elBPl38dvArC2AAQYqnL8sO+mhwZxptuLlC7G?=
 =?us-ascii?Q?VMCVv/D+fcsgNV7GQ/icIQ69E4e3JxUAJDVCzLuCn5C7g+/L1/72Jcsqplfu?=
 =?us-ascii?Q?093unCX7Dw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ce29ca-b540-4ad0-6533-08dedc34d8ea
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 14:34:27.1998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: is8Cqlk9EU9Ibtea8hUC1gufqj3wpEgFrScStoqJl0BcSoHk2RFbT27Sza5gRimGlJV04qNStpopnjExLvoipjP2TI1iIZm1Ine1NGWqzPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0902
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 14:34:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240392

Backport upstream fix for a global buffer overflow in the LZH
decompression logic (unlzh.c). The left[] and right[] global arrays
shared across LZW and LZH decompression routines are not reinitialized
between files processed in the same invocation, allowing an
out-of-bounds read in the LZH decoder.

Reference: https://nvd.nist.gov/vuln/detail/CVE-2026-41992
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../gzip/gzip-1.14/CVE-2026-41992.patch       | 32 +++++++++++++++++++
 meta/recipes-extended/gzip/gzip_1.14.bb       |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.pat=
ch

diff --git a/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch b/me=
ta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch
new file mode 100644
index 0000000000..5d3534fcb1
--- /dev/null
+++ b/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch
@@ -0,0 +1,32 @@
+From 63dbf6b3b9e6e781df1a6a64e609b10e23969681 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Wed, 15 Apr 2026 12:00:17 -0700
+Subject: gzip: don't mishandle .lzh after .Z
+
+Problem reported by Michal Majchrowicz.
+* unlzh.c (read_c_len): Clear left and right when n =3D=3D 0.
+
+CVE: CVE-2026-41992
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gzip.git=
/commit/?id=3D63dbf6b3b9e6e781df1a6a64e609b10e23969681]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ unlzh.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/unlzh.c b/unlzh.c
+index 3320196..a6cf109 100644
+--- a/unlzh.c
++++ b/unlzh.c
+@@ -232,6 +232,12 @@ read_c_len ()
+         c =3D getbits(CBIT);
+         for (i =3D 0; i < NC; i++) c_len[i] =3D 0;
+         for (i =3D 0; i < 4096; i++) c_table[i] =3D c;
++
++        /* Needed in case LEFT and RIGHT are reused from a previous
++           LZW decompression.  It may be overkill to clear all of both
++           arrays, but nobody has had time to analyze this carefully.  */
++        memzero(left, (2 * NC - 1) * sizeof *left);
++        memzero(right, (2 * NC - 1) * sizeof *left);
+     } else {
+         i =3D 0;
+         while (i < n) {
diff --git a/meta/recipes-extended/gzip/gzip_1.14.bb b/meta/recipes-extende=
d/gzip/gzip_1.14.bb
index c7837cdae0..99174a58c5 100644
--- a/meta/recipes-extended/gzip/gzip_1.14.bb
+++ b/meta/recipes-extended/gzip/gzip_1.14.bb
@@ -6,6 +6,7 @@ LICENSE =3D "GPL-3.0-or-later"
=20
 SRC_URI =3D "${GNU_MIRROR}/gzip/${BP}.tar.gz \
            file://run-ptest \
+           file://CVE-2026-41992.patch \
            "
 SRC_URI:append:class-target =3D " file://wrong-path-fix.patch"
=20
--=20
2.34.1


