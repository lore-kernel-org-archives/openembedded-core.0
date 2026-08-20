Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E42C5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 18:10:50 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.157.1787249440652542094
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 11:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=GVErQ49A;
 spf=pass (domain: est.tech, ip: 40.107.159.51, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fkGODHM52G4UfWlMaRaAtaVmc95LJKoeZo6fMKG6gucsXY/ZJNI2vtk+F8jfDkSEx5gaaV3orB9NzzWMVLzMn6rndkO/g2IGtTS1ZD7sUbnjZ0jSxmp8qqyGdebBlH/9KnWxjpt0BYm+CZsZjeeW0hIAIQbpPdGQJHHdSzSkyxZTPg0vIlucXKUvhxlIAbCP9ikQP3VaFWNquI5IMbWcLpkN5PBORNSgRqt64bH/k6MX8zslguaXx9VCfbBSLHp9BZXrWoYbeMQWFcYo1HRC/Z8YOaeTczRIzfHQtFn71C2QUilhebUGS8v3GiKmImcaFTRKst/aU6MhPvFMEu+egw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKeBELKop9QPKbjypOidbbhKzX2NYmHn2pK1xcdt5eI=;
 b=dSIY44OSiS6UlF57H1yHa9C8wH4t0LaA9sPsNcv7XmvvPO/iE/yi/qGKQKr5Ho8haPRkzKL+SsP01xdq7Xb3JhgRX3ApYuBBH6XoZu66oRZPMIiAHp/AcbV0SSW4gUNzUNRPrzpUB8+B32Hib9jaYZsD2nJVXGbxNd/mMa2FePZuZoFJ/nZrmBjdXhtYhOhRUXauFpyTLgXX0NQzQA8UB7jf4YlmgOS9cxdBEc457vW+dBIu3w12YFPinUtZddL3on5UpEInUBi+zrOT0M6zJDIZR1gBTnMHchg3uHLAnbv7XB4SD4abrLVKgs8CgotTPB0qU/0uP1P21W1C7uKidg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKeBELKop9QPKbjypOidbbhKzX2NYmHn2pK1xcdt5eI=;
 b=GVErQ49AEFQ/vXHJ9KyTWFGz/OK9LMeLvFDuZsDs/NDr+wW+EPD6s80BxrrENfdQEDZQUqrDBqU+rWXGl9ec+gCJ/frlyEGVyUZTyDkaP7dgVALYQ7jzXYvF1Aav0Kld5arnjFuuEQ7Rb5h1Q9Be8d3OiySFJko7AoqcqNfZV8RUVm74ZwyfY/dfwghCCp4wHxMZjUkWm3nri9v7zWOAEfFSuhkKla4Lwn63tPz7Sab57gB2bYXsVPtI9Q/RGd13r5j3C4ecufXr/Bi1dG2Xbe6QNFKrEPxvSw6Y5K38lxxEiDkNFRtF21JqO/j//IPhXVZMZNPUE6HRVaidnd5iQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV1P189MB2954.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:263::18)
 by PA1P189MB2702.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:452::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 18:10:40 +0000
Received: from GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 ([fe80::a7e4:7d5b:ab4a:4b96]) by GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 ([fe80::a7e4:7d5b:ab4a:4b96%4]) with mapi id 15.21.0360.003; Thu, 20 Aug 2026
 18:10:40 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [RFC v2 6/6] kea: fix build with OpenSSL 4.0
Date: Thu, 20 Aug 2026 20:10:22 +0200
Message-ID: <20260820181022.44434-7-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260820181022.44434-1-jaipaul.cheernam@est.tech>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
 <20260820181022.44434-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0354.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::7) To GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:263::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1P189MB2954:EE_|PA1P189MB2702:EE_
X-MS-Office365-Filtering-Correlation-Id: f36f2c0f-a3f2-4081-46fc-08defee657b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|23010399003|1800799024|376014|10067099003|56012099006|6133799003|12006099003|11063799006|22082099003|18002099003|13003099007|4143699003;
X-Microsoft-Antispam-Message-Info: 
	emgnAuUF7OkJMsjxs5WX5U9ibWsvqF+RzWyKnhh6m+XNejBSnihRZLE2mUxqnhjGNBw510hMDikLYUuZsNvp8p0bCjyIrUT9KT2AsvZY1lWYMBqW+uW1Gxb17ONpZCLGwpaFiVXxV1xcd23nBaz8ytrocoMLiqqZPiI5fDHgkooP39kcVFBZu3vUvZzrmz5JjzHYvj7ZbCviD+oKfMLMnnU5FB5k6y/2BN8qNpGp5HRWy0DuBnBnJiXEqPyDkuVBK9vqHaPbzvwUBmPxAFMXyC2Vp52rQQxKdqpQ0kjsmc6K1VKAW+31vCO64r15FHioqZAG92FrYhL3UkusX4s0tHUt2OJCYWv5FVRBdBOZULu3oHgsLq2LoSmsHn3giQpTlOl3abh1BbNINxAzx3irvyBkA+RjMXoraQYwWcnsdmPwOLUYrHGsEyxKZnRS5tcYbGhFPaTdGj0RqtAem/NvFJ5TkK0x3+feLJALTv59nFoogZ5uY0TVHGBXJSpika0sBKeQ9ICnHPJWDvrJ+q2AaZAvD2f69NwwKuyYMqKXv+TQkzKXNnDzMZ12/VJdyEtKwldIB9wjJpRaLRQ2Z8xmgaHFOs2wPtiSy2MzDptFMJcs+/ImSV8Dv8k781DiVY44
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1P189MB2954.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(6133799003)(12006099003)(11063799006)(22082099003)(18002099003)(13003099007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zSecG2dvsE9t8aiBMAMsgUjbr/1mQZtuzm25V6wbGhgnH7XkgY10axJK/lNG?=
 =?us-ascii?Q?MOyPx3VdPN1e8Yh0hwDWTXm2uDEfV1tdO7haeVW9NpfhFGpLrnGbex+gVxqa?=
 =?us-ascii?Q?tuM5eO27xxl6k7/n9DE5ouIxAg9kQQVxrEy/ZYQtR/LkoUVav9lO89bkzvlT?=
 =?us-ascii?Q?ibEJ7SeNxZ1e60kssUbWogEnlLgEsHR5lqEMkwuecY0vKGjPmZxs+oVZkNWG?=
 =?us-ascii?Q?dHCyJW/drsPfedb+FzdOw49wYZY63jU4Smt+WXWS9jl+h754U9iE4y84gjza?=
 =?us-ascii?Q?lKWmyTLlk3hw6RrKoQH3AOaVsvj8K+WXxGcSsTu9ka+5ssWLEy4iXaCrBqth?=
 =?us-ascii?Q?9vJs7iCR98Rq82+2mkW3ksvbmKiqQ7tJm0vAo1t0ywrgG+DL3Nw5NSpJktq6?=
 =?us-ascii?Q?6uRxGPFeUpja58X52oy74eq1PhfSsr8+gaAsrH6tTPet+ekZcYkEwqXgx+ph?=
 =?us-ascii?Q?8Z4wmzLdZRlsVmBQzJGyRDg3aBCE+OM6F9ZJgb46Ozc2pqyY1wfuVG5R0w08?=
 =?us-ascii?Q?LUOKH2nGxrbY7kChJX1ouT/BaxOI8x42hqr5rZzydLxpYZ6flh9HWGgbZRk4?=
 =?us-ascii?Q?UlGQkWBBjq+bqHbzw11RR9A5DLtYCLoy+GgJfry19eB77tXgOh4heECQ/vZr?=
 =?us-ascii?Q?q8uYBVPxlL0oJRVogLMCpx0sgV0PN9Tcnb3v1HfcVbUrHYmDwhjMdV7M1pQv?=
 =?us-ascii?Q?/iCIxl8sUHzpnZAmQoAMlhMq+r52YcMiIhahu0oHy0IRfLvTEuBvCN7xNlSv?=
 =?us-ascii?Q?VdLXvmEFTdPAXY5ccrlC615Y+Nl7rPdBQ1LtCq5jNMFwASd2Q8kSxSk41VN1?=
 =?us-ascii?Q?R0YteUAeYktq3Is9TnJy1CzTbDgSJKHcA7wtkbY9f+Gp1KAKms/FDsxFnvwK?=
 =?us-ascii?Q?QqV1aHEF3k00UsT7da3O8+vxC6nlLvU5W+BhrQZMPB8LHq/S6avjqLAYGmpi?=
 =?us-ascii?Q?d7G3m9WF4Cj3a6bXQoG9GPUx0lwNIQB65YYrVk5axpkq+clDduQDWyQ20IFN?=
 =?us-ascii?Q?kxMbn3YlyWqFKzz1iRnBIcQfSzy1cN5IgCe9lBWbWH1gFQ0JRazbJIeBg5tR?=
 =?us-ascii?Q?+L3wNIvd47TZ2VfJgjFB/buFvVRJtD0xsSisYhNPqTlwY7NetXEG2ialQlf8?=
 =?us-ascii?Q?HcbIXHPM6khYXAcVRhh1C0UPOH1pFPz9brTwabUPaUiPt9QcwaIOVjwfxR05?=
 =?us-ascii?Q?zt3SiSaz2ZhIQWbehzGfxgdAhv90yWedXsGGyBJsbJonpuUC3woGR3Y0oFAp?=
 =?us-ascii?Q?ytJMcwDiJ5ZEyxEnSnzmqi3TjBiXT8yY3BP8KSY9Ydtv72jPylmzuChsBz1J?=
 =?us-ascii?Q?L7pYd7jHqkvwlieIvRU07PWjLtCrbD19gVL4HUF7/hUUB2k7nOMRIQOjCm4W?=
 =?us-ascii?Q?qH2unMDk40Xr/dDtst6W1PhnEOfZINjAtDp1MYcOEV+xi4dpf+VFgFyVlSoF?=
 =?us-ascii?Q?Y88MBgGrjSWeysto9HpQpDvW6V0tWs3kBzhkd2uUQYXNPUWFC4MLpefmDsmX?=
 =?us-ascii?Q?bcgE/YeNmO7t9YISIwMHBNBwu8MOs4174ri4vkYNsNoZrt14EWw8H9kZqPw6?=
 =?us-ascii?Q?bg6aL5nlbWLHP8yCfmo0obavRStSif6m5HaCYcHlY9/t75WGs6i4+hnQn568?=
 =?us-ascii?Q?vof3gFgzTiCpK+WE6JxFIwv3x5mtffAVx0GQIDiwue263IYZ5N0hakBuOzbp?=
 =?us-ascii?Q?soBSpD7Ba6MiIMkGUH6s2PbU/8MeGzb8qxmUa5sx+jyATNSBLOkGTUsKCbAl?=
 =?us-ascii?Q?K5BePEGifaYOIDt06b2E17a5De7skPnQBYiA0BBYbYj/udamIqeqecnmLIo4?=
X-MS-Exchange-AntiSpam-MessageData-1: cJmkz2gwHXpuG6YJFGjl7K/Q2Np2Ua5sWxU=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f36f2c0f-a3f2-4081-46fc-08defee657b4
X-MS-Exchange-CrossTenant-AuthSource: GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 18:10:40.1751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rz4jIYj7VvWkTLeSAITTLvUe6TIDd373LIgMs11TPB4jACan5y+OO3nKL4aTwOOX2XTX0U1mUWLefMa94VZKSmdOEXm557EGduG/5iYYHbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB2702
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 18:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243880

OpenSSL 4.0 added const qualifiers to X509_get_subject_name() and
X509_get_issuer_name() return types. kea assigns these to non-const
pointers causing compilation errors with -fpermissive.

Add const qualifiers to X509_NAME and X509_NAME_ENTRY pointer
declarations in openssl_tls.h.

Tracked upstream: https://gitlab.isc.org/isc-projects/kea/-/issues/4673
(milestone: kea3.3.2, labeled: backport-candidate)

Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/issue=
s/4673]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...-qualifiers-to-OpenSSL-X509-pointers.patch | 49 +++++++++++++++++++
 meta/recipes-connectivity/kea/kea_3.2.0.bb    |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-connectivity/kea/files/0001-Add-const-qual=
ifiers-to-OpenSSL-X509-pointers.patch

diff --git a/meta/recipes-connectivity/kea/files/0001-Add-const-qualifiers-=
to-OpenSSL-X509-pointers.patch b/meta/recipes-connectivity/kea/files/0001-A=
dd-const-qualifiers-to-OpenSSL-X509-pointers.patch
new file mode 100644
index 0000000000..987890f4ff
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-Add-const-qualifiers-to-Open=
SSL-X509-pointers.patch
@@ -0,0 +1,49 @@
+From 82d28b1be73bbc00e73e59d0c59c51a1e76519a5 Mon Sep 17 00:00:00 2001
+From: Simo Sorce <simo@redhat.com>
+Date: Mon, 27 Apr 2026 17:49:56 -0400
+Subject: [PATCH] Add const qualifiers to OpenSSL X509 pointers
+
+Added const qualifiers to the X509_NAME and X509_NAME_ENTRY pointers when
+retrieving subject and issuer names from TLS certificates. This ensures co=
nst-
+correctness and maintains compatibility with newer OpenSSL versions, which
+return const pointers from these getter functions.
+
+Signed-off-by: Simo Sorce <simo@redhat.com>
+
+Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/issu=
es/4673]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/lib/asiolink/openssl_tls.h | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/lib/asiolink/openssl_tls.h b/src/lib/asiolink/openssl_tls=
.h
+index 57c3323..52a969b 100644
+--- a/src/lib/asiolink/openssl_tls.h
++++ b/src/lib/asiolink/openssl_tls.h
+@@ -175,9 +175,9 @@ public:
+         if (!cert) {
+             return ("");
+         }
+-        ::X509_NAME *name =3D ::X509_get_subject_name(cert);
++        const ::X509_NAME *name =3D ::X509_get_subject_name(cert);
+         int loc =3D ::X509_NAME_get_index_by_NID(name, NID_commonName, -1=
);
+-        ::X509_NAME_ENTRY* ne =3D ::X509_NAME_get_entry(name, loc);
++        const ::X509_NAME_ENTRY* ne =3D ::X509_NAME_get_entry(name, loc);
+         if (!ne) {
+             ::X509_free(cert);
+             return ("");
+@@ -209,9 +209,9 @@ public:
+         if (!cert) {
+             return ("");
+         }
+-        ::X509_NAME *name =3D ::X509_get_issuer_name(cert);
++        const ::X509_NAME *name =3D ::X509_get_issuer_name(cert);
+         int loc =3D ::X509_NAME_get_index_by_NID(name, NID_commonName, -1=
);
+-        ::X509_NAME_ENTRY* ne =3D ::X509_NAME_get_entry(name, loc);
++        const ::X509_NAME_ENTRY* ne =3D ::X509_NAME_get_entry(name, loc);
+         if (!ne) {
+             ::X509_free(cert);
+             return ("");
+--=20
+2.53.0
+
diff --git a/meta/recipes-connectivity/kea/kea_3.2.0.bb b/meta/recipes-conn=
ectivity/kea/kea_3.2.0.bb
index feeacc8883..38b24eed1f 100644
--- a/meta/recipes-connectivity/kea/kea_3.2.0.bb
+++ b/meta/recipes-connectivity/kea/kea_3.2.0.bb
@@ -19,6 +19,7 @@ SRC_URI =3D "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.x=
z \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write=
-.patch \
            file://0001-meson-use-a-runtime-safe-interpreter-string.patch \
            file://0001-mk_cfgrpt.sh-strip-prefixes.patch \
+           file://0001-Add-const-qualifiers-to-OpenSSL-X509-pointers.patch=
 \
            "
 SRC_URI[sha256sum] =3D "14bf695d37b65b9b1bf550fea5d0adaf9806c50e5419ef2a17=
6a4b8e9aade3df"
=20

