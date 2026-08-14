Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59836C5CFCF
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 05:18:56 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6789.1786684729259054226
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 22:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=bsG0rG//;
 spf=pass (domain: est.tech, ip: 52.101.83.5, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBhM/800A7zjErWdFNirzuwT+haISGfgHIRHCLI/NJmfoQXt044Eexnti1SI8SnZ/R7QO0H8uCLTHlxVhmYXM5QX2FAwU7CRgbrhO/3+4/4Nt+dw8BfShbmKWmzWRX/cDr3a7PAIvDPIZZGlInB9YB0U9FzY6S5QRetknwWMTlGokmdpxiDy09r7D6bZP+lJBsd0lJTjw5I+3VMFzKLir8wWp3j0eRQNCpqJhjttw+ksK8i1B3WmNMO3V5X+vkrxNcWT85zGmLbI/jX52OMEsxhRA3xDvVCLIKS0B2RYLrHwQUVaMKOyTCVgOtIQR/l2+vGUbQQcuN1f22eyIjis+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZiuKnOrOZLX8Ii9xibD1wUEIb4D40qlkAYJ29xCaDM=;
 b=Y1nlePyAc/+RB9OWcCC3Q0+y6bVI90N2SW64ftqITB2/BrlZ8GBlLuV3aO7eVWvYsHD6hLA5BHZJp6QhbjzhgVKf4OqvDd4yq6ZUWbZC+0Eb5rL4+AONUZwepDYso+QQ0vYNYHr2hVbx452YtJC9CjdELvuFwakdn20y06+g6F487dWqOp7mA+KlB3vUrCAo4fv9NrvrMZJfAAYysix1yWI/LBVCT25W3T6Irpx4pN2Tu6dII+KtlAKE2P9rNK00h7i1kVIf9Ff5s91bJjo5ao0VzWFvqBOH3Ew8XAmGNcWD3YXzKIjCL+Mkd5kXxsqFEXDa9VaJGw84VwP0jVwmwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZiuKnOrOZLX8Ii9xibD1wUEIb4D40qlkAYJ29xCaDM=;
 b=bsG0rG//EXDnHHrfiywUNk+aWGtd/C83foQTBLFllI4Hd+rhEQvgLwhtDqIOMvKWatTW1HWVec8H2OMlztnQidrbgursFdZaJnpitFQGj9GyE+WW6bFu8bf6cf+nXHzZgwHbgGz6ObRks8etKu4Lqs6tuTQi411FcZpWBks8hjYHRaTi1K5rKBzI+PGz0gCZ1URy5tAmviOt0N6LRQD3SBSp/QKIURojwF0uW0blOgM16KaUykIa2BSOEvtBdAYzIKHnrVD06pePEgv33Emt5piT42aRn6nX3iWZMT6S5n6CCBBfduY5bwnuG38RbHiWDmFPstHRurqlKRdDuw1s3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GVXP189MB3385.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2ad::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Fri, 14 Aug
 2026 05:18:48 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.004; Fri, 14 Aug 2026
 05:18:48 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 7/7] kea: fix build with OpenSSL 4.0
Date: Fri, 14 Aug 2026 07:18:29 +0200
Message-ID: <20260814051829.35088-8-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0055.eurprd04.prod.outlook.com
 (2603:10a6:10:234::30) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GVXP189MB3385:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c35ac06-9fe8-4921-f530-08def9c38530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|10070799003|366016|22082099003|12006099003|18002099003|11063799006|56012099006|13003099007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	GTltNHNdEhzMN+QIdzZiHohbE779iu4SvE+eTnovHMOefv34F7+ESn9ySoaa2bBV5v4zVe6PlNi1/c9SHiydSYNT5r24KaW3MsYj0DNHMAipnjiPVjKGGP3LxGlM6dc78Rrh1C9fg3aC9owBBnRRG0JdHDoKqXkel1GASe2w5FBaQRNUQtMWwNIVYfHx1uj9lPTJsV4BhP4cCT5/4ils9WPMHv5Gok4fg/28Z5wtiLhoBIDWf1ajJ8uZJ2bWs6GqPXB0XvBr/aW2SOgtpsF+TaLVZDnhEaZ5AHQJk2IvuLJHpt0MX0LvD4Ob/MRXS7yN0wCeu3L/Oqrasp0rVCvavRnhCMpK02fhkf+CenOvBY28IIGpp/xVcxdEN+Z6wLJheO/XDotuIkILjzuH3Zu9t/xWgBDBlARhWHAceSHXsWIvKNRsKPqbISZFiOXb8fpG0TKOtokSsz7TJubSfU9C3DxlX79QjAZEAcvuxnsL+9lMcPhIOYJ7lD6DcPnL6+ug4FtHkhfTLhuz+ifpaOYMrYlaSkW/YSS2b7xvULRKcU1Rik86u/i376FJH3XjYSJyGAPV0dqybNBzZgRs2wB3raGXepIzS8XyHOyMnapoStGm77NIIX4zQvTlLGFCWpkn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(10070799003)(366016)(22082099003)(12006099003)(18002099003)(11063799006)(56012099006)(13003099007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yNeZX9xbNIsW4A3isliGE+BT2Q3iPvJQigKEWmia5dqr7yOD38CHXGLc6Ytg?=
 =?us-ascii?Q?YPP2AzYaQo/HuSPw8FAuzTFa9h53UIz3r/lZRyVr7hwDBgHVCpAYSRLic+ib?=
 =?us-ascii?Q?+hjd5/wZI3jtXaL9hTCvKWLm4ym041A6T7iu+HNaiQYEPMRA3d4n/qtrF/5G?=
 =?us-ascii?Q?htwnv4RFl50UmSeLFfw/nai95SwNPD/OQ4O1fqVI5o6XYH+HemkuPr9nTFmj?=
 =?us-ascii?Q?on9UiSs0TdgJ8L+60ZWuKpHOmHWSonKxpZGCo4nIiT4Pt5oXaWyGeEtF5hdX?=
 =?us-ascii?Q?CQyHyexiA48UaEEQBd75Ln/pvnR5hRhECFDsvmeBs3Wtn6o7AIqqruJIu7yT?=
 =?us-ascii?Q?cjCw0Mq8LhliH/Y6uxmk8/rkjUUYzugQWZUOBMxueb8fIR7AqAqzV3PMbDXj?=
 =?us-ascii?Q?MPWg1tfWEYOWeo5myNEEZX8sAAkhuOcA4BWuyI4wFibFIndrBaQ0gbPZ4otc?=
 =?us-ascii?Q?ZAUgvgnreskk1tlhniYFvOiv9f+2V6KmQNrtCtHBAOl5TXYwVTRdV7IJFdTp?=
 =?us-ascii?Q?FapKxt6pFp/m6XXuWku4dzk5TgSA87/TjvmYBqcih3z+MpwhuwwKik4DAkM/?=
 =?us-ascii?Q?xM3gcRehEOqht5KP3IMpjVtI64x4GsSgTB2hmdfUl3EskkIINYvLow1rVdmN?=
 =?us-ascii?Q?si7wQODzECeaTkO7fUpoexnA4Bofu16i5Bbj4TXwMJyVHst97OmgnuZo2YR8?=
 =?us-ascii?Q?de+eDcL5zQ78zE1JJ/EuZBnzIYhthnYhkkpHAfsTjS7o8okwCauJHI8iR6K1?=
 =?us-ascii?Q?OoQZE+RzZFmjdaNopxUkXp6UGHYTFe1kveYLRSZ3laZoNIQpS+yMypy1dci6?=
 =?us-ascii?Q?fC9tepe/yjfl2nK+C6aP733PKqNmOwWRIgxxz+PSXmAiNJR/HWPFPDPZsY1H?=
 =?us-ascii?Q?/bUFxoeAUB2b3c8G09+HRZn1y3mn/TQg7wXytEnWXgJ4FgXD23Gp7ArvT6sg?=
 =?us-ascii?Q?uYAx0iArsGCsGBs7EXtoKm3WR2MZgHWzIRjMIxCg+LGOF99gu0LojAG2FI4q?=
 =?us-ascii?Q?/yHVHoLy5KKMUN1jbReJT/J5PUmJEWa0WV3KwN3J9HYELE/T6P9AGZo56O2A?=
 =?us-ascii?Q?Ead3WcwzKqUk8g8J6fSA2xPWx8nYOb2s0ckZiWWz4XE2iqBnLXbRq46zPUk0?=
 =?us-ascii?Q?MvG58ZYBzydw20KLNozTUZmNhyi+7ttkmimOEitEUgnVRU+esaAse+wOLxIX?=
 =?us-ascii?Q?1PengRCguo6XMeTQiTbO4diGkMjFVTXiWq1qkEwHcFljIboAjhEIsr2KtflM?=
 =?us-ascii?Q?kTD2duL0nR3dnt8+EG6iKLzM3wE0umB5cHcrgvBjETWaBMtKNAi4ngbsPorf?=
 =?us-ascii?Q?dY1S++b2Wn9i8c7tv5x7gTl7c9behagsNwAFuy3534qN+vYALOS9mOLZMr97?=
 =?us-ascii?Q?xWxkrsiSmDesrer5dSjdgsmmlOwPCAl6krgBdjiV4yYhhe54isN2unI4ydqw?=
 =?us-ascii?Q?42H2oCR72mIP6etdEtf0vtnKSFHUfQ/38PcxI1h10B5OoYGlIjuvW/3gE2AM?=
 =?us-ascii?Q?Zbc+fI2gve8VcvOm3v+bqbZTndvtFf0B8FpTV8oyLnodGyFnBqvqp9m3Pzjf?=
 =?us-ascii?Q?TlO7Qx+3CQx+McLqlZkCUtFoeL66Ps/+rZtYazOqobgDFFVQsNrkhjpxvUJS?=
 =?us-ascii?Q?D4OnOw9FahnVRkLKil3xjBvgNxYWT4fkPyhQdboD7bguooJYbPVhG4SvzB88?=
 =?us-ascii?Q?+CDv/CCqFrSeFwXqt62nQPzMwpPWY3aKb4L42Z0a3G+CI9j3eSOiT7yQ71fI?=
 =?us-ascii?Q?fE/wsqLoLVH98LDGN8VgBNUe43w9IAQRmRbYX/vfuPbMQ+mEyaROlBtNgITz?=
X-MS-Exchange-AntiSpam-MessageData-1: Ks1cy72JF66DL0E1ATAerO1E+DOe72V3vwk=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c35ac06-9fe8-4921-f530-08def9c38530
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 05:18:48.2811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OScZnWiTYSy80ZD+9HoxYwXL/pmOWoEQj83D1TdyitqlRgS02f8QpRoaU84+3HDGL3Dwl+VqWMs3zM0kU9Mqf6sXcIvsASdFC8Xxk6/yaqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB3385
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 05:18:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243403

OpenSSL 4.0 added const qualifiers to X509_get_subject_name() and
X509_get_issuer_name() return types. kea assigns these to non-const
pointers causing compilation errors with -fpermissive.

Add const qualifiers to X509_NAME and X509_NAME_ENTRY pointer
declarations in openssl_tls.h.

Tracked upstream: https://gitlab.isc.org/isc-projects/kea/-/issues/4673
(milestone: kea3.3.2, labeled: backport-candidate)

Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/kea/-/issues=
/4673]
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
index 0000000000..85f6fe1dbd
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
+Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/kea/-/issue=
s/4673]
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

