Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81E0C61CE0
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 14:32:14 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7570.1787409121804302606
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 07:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=e6KQwCJB;
 spf=pass (domain: est.tech, ip: 40.107.130.71, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hofc24JAWNMmO/xgsQV3O00COk0Ec88Aar3lVMw4N7BMwUwONRGnQfo6/fvKG7X+1mSK9hVKsibydWq+Uf8xyA8n/sC356pSDkYQXricDRhRSGmWu+KTdl+IMEYOpDH/LZiLB2za+VjskW6IfcFC999L/kf9iZCdX4qMQh0yf0d0EkZoBIFm6RmgsBsBUmmAK7zbsc7qmtJDYqLhwFx9vFqM2FVw+ApQmSIvGL9V2chjj7Psd/hIwF7ruMPk//Dbdmtq+W6tOkberAamm0vgAV4enMRyDfhEJYUgXwpOXntC/TTovFv/g/JRPQ4HQkXed/7IiMPe+PhXSS1FkirzZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zplzsuv2OUODJV5kcEAHxIxK2x7+1plMsrQxxCndatg=;
 b=Yk6E5WODKDktzVzpfMbSQHzchuDY+ltm/9DMegM/hkAVIbuHyHmVDlQZe0TAKAx5byKo06txVXklxudCL/XoT6dsLjomZOdQLmIRxu2xz1zeKZ38fwPVxtF8RCANbmAFs2UdxZX8NOfOZcPXmRy5nRgrgC/1tIOX+X2M5D1H3+NibQGPbUqq6JfVPFbcE+XirEYnaCzKeQQ9HVubMbJwBUdyfbI6lD71q/KiXlgJkrqr4ZEvWneM8TATVGMvpvBTf4fWXSvKviRV/MUgxayVmC8KNbNQVHNcoCP/3iNq3SL+oY8uWUlxasz0GLgv/uIDy+aF+XlJFx6EAsKZjKXr1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zplzsuv2OUODJV5kcEAHxIxK2x7+1plMsrQxxCndatg=;
 b=e6KQwCJB5gLQfVugdC6FIw+pMn31pq7ndXY/ptuh1fZzznqIBwPFyCpzuqMwotMgnhyVQp+KOVcQZJZobfbapPZceIOxWX4+/SY9kySpbAP11cKMfSRQzy6xNAoNK6h90C4w9C9qhAT0VO6qN8fUK7xXVCagg+f36n2ZPTfqNJMLsjrBe39zKgmt+M4CZim6FloyAWHXY6hZiHJGGyXby0DoCNekYO3Gi3mphEWbl3pF4wkgRrSQszYmp+4ETSVhr5SaBXnu86BLBEBtTa5Z6ZoygsEJ+x8keRN3AlxWxeLgtSJjBXJ8EZDTps2N1HaGvFzY+tPn7Yuvs+Skng6/wQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB8P189MB0917.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:14b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.5; Sat, 22 Aug
 2026 14:32:04 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.003; Sat, 22 Aug 2026
 14:32:04 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][RFC v3 6/6] kea: fix build with OpenSSL 4.0
Date: Sat, 22 Aug 2026 16:31:55 +0200
Message-ID: <20260822143155.39273-7-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822143155.39273-1-jaipaul.cheernam@est.tech>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
 <20260822143155.39273-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0081.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::9) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB8P189MB0917:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fb11ed3-43c3-4992-dd5e-08df005a230b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|23010399003|11063799006|10067099003|4143699003|12006099003|6133799003|56012099006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	vYGxzy02DzWN/AuhM/hhHBLhDX+AhE0xCGeEi9oCj3rgFVwcIvfbACMOdU81g2A6DIdfftTyV7T1bCQI2uQ/TlLHr3OLAy8vqAdyH5CWeUsU7DGy4HowIwc/GreioOXKUumKVSJTh4IAo2OxR3qm400sfEisGPH3L1QsMjEmbfWjya6/GUaX7C/gN05TQXjmuQrnXRcakFeNVVtohbV5Y2Cx6EqPwqPx8zA5pI1xEh+HAx2jKHz6b9sM8/fYKZ7crUgOLBzB2Dujre2dHAq/rkKGKZdMZxWEN/GRS2vt43CVRx3/jNF/WFzv35f7Cw/hE9DFrQbLzS/GlUrO3MsL6SidfD1+LeSIPlIVfUQmTxaUeYIBgQg4hzh1hLzwqKdLiWSErch6szz+lIWn/C8lR4AAHx42zJVg3MYnQo7X5NrMLvg+R54wfTXrnnEsuSzGiHE8dWj8Guz6D65cwAzZXJGjA67rdtbOoMwrytoa5fa671GxfL7bmzydlVj14QqmAn5JPrP2G/9cRKL6H6oX7nMouFJlXtqZR9lEQXFHiBYQophSH+gaCoUrjQj+2/PRIXNWYIm/t5Et8htwI+qAGUkx5uXOAE9vMw3DKJjC5NA7XDxe9PaXqEvQVKnb/jEI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(23010399003)(11063799006)(10067099003)(4143699003)(12006099003)(6133799003)(56012099006)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hLxFqDTgW84jLNfmWY5qEfjtITVsrgojRXgePaECSsv50XyK/2VENn8V7Ymp?=
 =?us-ascii?Q?iZBLo3nu5qYpcpNPXyU+g58Gq+s3C4C0mN6nqpWXQ9xE7hlcviGnj/czNTGO?=
 =?us-ascii?Q?SpPqlEzaOtVTpm+zWR10BUWQP8FzM0rrxmKh85IqchLINSYoa6TLVLCkoROL?=
 =?us-ascii?Q?TmFBTiQqaOG2tzXjwamUoqF+Y9r1D2i6tnzvsvMd++iWz571Q0dgA6/f8s7L?=
 =?us-ascii?Q?kFg+DlkSCz/cQz8n/6FZt5Sld8DnTDVozyTDcptgqj+oDLzggRyz3VUzjzNH?=
 =?us-ascii?Q?6wborTg5O6uebIZmbSABIteEAEsUQ1OhrGd4l/OtOdS5NqRg+PC+gTQPpfL/?=
 =?us-ascii?Q?rmXtlJ6MA6T47b0Vcdb9wBN+kXb5SUJLPDisCegpij6nDwVttYYHqSJMPAtU?=
 =?us-ascii?Q?1U9C/FvWS94kG/jM+Hmc7YQLPXHEetNxRPOGPUDOOus9+Ke79oFeXEj10CqY?=
 =?us-ascii?Q?Ji271wzmme7ky1fjjZ2lmlTS8rmgk9vzsgS/g+283UiLhrwDSt4bTC87UOO8?=
 =?us-ascii?Q?RbsuC3qgNgUkNAXXIf5UfeucuEzW66dkzvgi5bLWf9Od63/USaK2PwgV7KGR?=
 =?us-ascii?Q?wAN3usCV1HVPjx3VofoS6d/K5ev1MObS8jbpGsNUJaIaedSW4Ir5aB5rgkNn?=
 =?us-ascii?Q?aVZBHHC3Z/j5GOv5CfpPUq1tt+N6TE9lPF5NBFy0FORUPpSYgFmxr0MsGvIp?=
 =?us-ascii?Q?XB9XDnDJIBfAPNYvmDcbxMeDmdAUEBMl5EvnuWUe1s+rip3LykBuBirxw/RV?=
 =?us-ascii?Q?jI/E/qQA+GkgmY0K7QCySBpX2b+lcQJWRG+j4HKWnmOF6kXGyIlzx4uAUQqP?=
 =?us-ascii?Q?vheL6R2eDD2gXjrgvnMnlJ8OS051P8H5iGc9ASDOJgtGrswzt5Gcj7ZkFs1V?=
 =?us-ascii?Q?w4J6iRMETb+lVB3sUzV0LOuYdJVoM0FUWqfFPQAwKcYhKqhjqxTSypxYZEwM?=
 =?us-ascii?Q?zz5bdbmI7Ua5gXuSBj3e1sxVLM/CMmgfxsQNvF3qghVl5mIBmXl6K4/U1W/s?=
 =?us-ascii?Q?cZY784d5FUHwHCc/ySPwzn7Sksa5FrRlsSPBa/vSmzxBE5U+Iu4IjFVGXJkG?=
 =?us-ascii?Q?tuM2v/+B+gNlW0eNlZzfaycm4KtFNYXmjUKA8JSyOX5TQl0/96M47NshmXDO?=
 =?us-ascii?Q?8iCQcXvH3uwMQKtcv2ypbWNGlhqzskLV1oLkUmSeX/q4zWr9kB7wYDQ5feWd?=
 =?us-ascii?Q?qr7WKkY8zoAA22bAdeEuLU8rf+pGCUs+sCo3cRmT+JlZsECxZuJb2o5zLXiF?=
 =?us-ascii?Q?LmWcySqsDSmLumY77DPZ0se0RnolpLJrq+3d8p99EI7hIZb26iiIu96ywAkM?=
 =?us-ascii?Q?oB5aXIsXKrqulkBlEfcH65B3yQffW26XdxAigP2/EVSV1zx2clEVxJ57Panw?=
 =?us-ascii?Q?zIip0JO5RSfQNwtzNCPT68T72yyyz8I/aDaxdrk/oi9JIO/80vgSOJ4b0oIz?=
 =?us-ascii?Q?TcBdSbiFfctInBvQ9wdn4V+q/w5/iut0pCz2w1YfefH0FX/MHmDrze65j0Mt?=
 =?us-ascii?Q?Y3AljUElzS6/sYLLI0rjIZ1SZzk0fBxrHh78euo7E4K5V/PJ71wka7J0Yies?=
 =?us-ascii?Q?7gNZMFDD2g8cR75Lo9DwXwPE9NRR3R5p3GAeAkArG57jLzhQtnINIZKTGsod?=
 =?us-ascii?Q?olD9T8llyflpIswJEoSpYZyriAUXjLzcqjSqB6BNWMu8pbYu+vMehjVhcyjB?=
 =?us-ascii?Q?aIquWayOSE7bKrzG1pORAlVP9QksK9Rxry2B32W7KPiUgBBb/56qGhPcQBUM?=
 =?us-ascii?Q?IAm/mxvsRXVNUSyCr2LTeUpx4rC3G4vG9G2jBalVEHhHxAiIYLN69K2afzJK?=
X-MS-Exchange-AntiSpam-MessageData-1: JGzkSj7Sr17OKJgzCC7utelkVjkC/0M9w8M=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb11ed3-43c3-4992-dd5e-08df005a230b
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 14:32:04.5993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: abtnR8i5ON2MXjqBd0w1q4FMq9rgS3uvIQ1zaWnDw5qfo57zugNnllEmi+45J0vFe8750yEUJdfg2fGFiO0TUvKkXEmgAoW2t2cd8Ij7idY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0917
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 14:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243982

OpenSSL 4.0 adds const qualifiers to the return type of
X509_get_issuer_name() and X509_get_subject_name(). This causes
compilation failures in Kea's TLS code which assigns these to
non-const pointers.

Add patch to use const-qualified pointers matching the new OpenSSL 4.0
API.

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

