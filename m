Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5F7CA5FD9
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 07:16:14 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5975.1790925367210363324
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 00:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=G/w8+cLz;
 spf=pass (domain: est.tech, ip: 52.101.65.19, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPm5LqGRQlnSnffFJt9Gfb2skft4dwDrCSKmHJX/B9Ea4u1uzCd36cuTGDnz58ozaE4npu9L7XYBm1ke+Yy78aBKmtvb7iNmwBDmNo3LGwoURmSJnL58Qb4q1tEJ9CBQv1iIsgQDVmM+EFg4Rz362hPbQbQnXuwXcWZt0v+ofSEIVO4a4wMouFuZpSZgpyHUbh79nW2aC2nrv4WEc5A9Tbw5oeDle/urC/XAiW8uAS6CbHE20ikjsjXqk5ijsSZSV2b2ortApngBGN366K72jxz7Vjy+UuYWsj9obo1CmdyJb8WLVZtHUG5wMC9HuDjhUu5u+HA0uSoaBXVFSzzQkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpX1SH3HW6QuxhSxAmE5QdZXM4P/cBOpJLpWJXut/f8=;
 b=cI2PsBjfRf3i+i5hUg7ITpKr8zk+veeYdZuGnU5ToYEwFQIo0YJdyXpn9Hx0r/qZ5qzLqx5ZXo82NYIttQTtzCe7Uj+c4Su0EJClGrJFYoQWKwGHXORKXYnzc8TlPZtt/ZTmGzPjOlCJXSei8/c7DrZDfeL7pAt/L+tC+22jg0k+lkGOPaTWiz1D06f9/0tARJHZf8GBImAl1a6ZA8AF+lMzPVUhxsyHdQOtp9FgjwuDq6Mr6gVCIBvItaz33naoMcVTC0H18nE825RcDjXYJ143v+x/FMVFwF74pyIOuP/iNrBszksJeRfl+7nb3x7HEPuV6omz8/KCaBGpOdaI/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpX1SH3HW6QuxhSxAmE5QdZXM4P/cBOpJLpWJXut/f8=;
 b=G/w8+cLzCqKw2ALR7FtGLflV89XUskoopu9LOUHKhvDRftctSqtSAj90gLJeQcuMCfTQqykTYe0IC2Lclg9pbfe8/9lGyUBE8eiaeGsUTtIwE1lIZ18GzJcUbOmeP4AFJn7sv8Xl5zsYqGhljzOi6DpSv9KOVL6pF6kV4ebZJ7IiCICtKwk49yXNFt2QdU8MMXsOJVpBdiWZKw4lE3GKkhgVpQnh3TWK7g6gbTAaOSwT+uU1rbKNGw3RsGNT3jwCHG4VvGIb+9BFB1doUg2opNdp3BJ0r54aAooZx5eqQUXzYQz9sQWnekDmyu+vCbiyBbpFK2Mi+fc7RdevvX3LEg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU7PPFF852A1B5A.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::aee) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 07:16:05 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 07:16:05 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] glib-networking: upgrade 2.80.1 -> 2.90.0
Date: Fri,  2 Oct 2026 09:15:57 +0200
Message-ID: <20261002071557.74249-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261002071557.74249-1-jaipaul.cheernam@est.tech>
References: <20261002071557.74249-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0325.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::14) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU7PPFF852A1B5A:EE_
X-MS-Office365-Filtering-Correlation-Id: a0f375d9-448c-4f89-db5d-08df205505c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|260925021911599003|260925021311599003|260925022911599003|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	E//2Wlu457eyy37oicDCKbmIi8Ufk9KEp1YzFp9hjHSa/Ll2nOFqy46cA0KxXKNPzJt8xJpbfXWyJnn3hvlyb8D/kV7rRRV/0wCukMq3QaFRxnPucvv7p/wssPIarFyZBD0w6b3nJ4kvdE904J9omEN/U9yyUwKHEnXgf4jQYxwQMPBJxikIT+obKBVW2GTZMzbs3bn2xxqJRbeAsA8cWKHbnI9IdPH83qEAgYoT/wV/R2gTv/Zm3au7KOO6zaskauuo36Arrr11WxyqzALkzuvbaiETNjoRlEnsKdtGE5OnKGO3Kbj0fULn1ZjfJ7a1E/789PuuPr6FI8BEaIciuxz+55kMECIzk/t6KtoUsNf9JufKAptxjG8Fx7OZ/gn2CaxBaFdMfClAoz/N/yLf4Av1hlE8fuZu4IXtHYdm22M6vUozr37nSMKngLWLRhGPt/E6G+yvHBYvnNaALGp2gNq92WY4ilP1U/J8XmiPM4RRriJga3X656WJdxLHV/00SSTtzsfJNFKM28ptL8yOYj5gnl8u3rbngSY+Hdjyl50tmg3KhQMCdvUI1d4zeHhoLf51wd0wEaZYUgpvlRAM6wC9LHAJSmwbsInWgOFzrGsLZk5cDK+LaWs8uVC3Ai5woEwGBYXmVp2JOksWPU4R8ryaLeY1k6uBaXGmRDubfHw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(260925021911599003)(260925021311599003)(260925022911599003)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hlezhgmA5dz/Cpxw1nIQjECRxgJndxAjPJcL3q4w43ajon/yr26CLqvySK+z?=
 =?us-ascii?Q?PN9Eamkf+CBGrQ9LUnbgQ/wUoFnkNhNWoZcImnSM/2oQP/h6lje4z2d3FYWY?=
 =?us-ascii?Q?u3NZ1fyL/1LnpHo4RAUfSJrWoTEHqkPaZleNxEZhijANyfXr2TKJUuIOmG/W?=
 =?us-ascii?Q?9oASMx/Z1G9ZtK0mDL6OHeZLA3d+9sq4TmyFuyIlv7Yq1bJYo3ZrIzIV7afx?=
 =?us-ascii?Q?on8Zge+zda4CWclJU9afVHVvwhmRJgLcsPl+htHwJDp+AePpf/HqlJoKMzE5?=
 =?us-ascii?Q?xlvnzJI83B33KLTxh9rBjPj+nqOnflgNKVl/OG+vGYwvIRBelLkjkYWuEIJq?=
 =?us-ascii?Q?mDGime5HeOrkGZ8p/fW2WZTZh6df6kRi2rRPLagb/mZ8ESZCiXvl6rKC8ftK?=
 =?us-ascii?Q?suVOV+H9XC5EqkQH0O1mx08wAU7+9e7Kub5qXdVsxvpTHiqb8yT/eGMWWMXn?=
 =?us-ascii?Q?HqlFxobm2RGN2PNQKACjax3pS8btDQ4IoMH0QXs8qb7Ci8k8FPMeu91f3kyi?=
 =?us-ascii?Q?D9SL6Lm+6J4TRJ1EcFVw8CJ1felavae9r/maAkPEzI8WYcpi+exS5XlY2jXF?=
 =?us-ascii?Q?Rg3OEsMNgN9nDGW7PEcTsl2q/S+POJW+RkFTaZKA2DOQ6ASThVkVHwMdBquC?=
 =?us-ascii?Q?/9ZsVtRI0CAlfydUSquT+uSJ2SJIQ7WWWSRpvTSYlQMhfS4T5fGhYsYJddCb?=
 =?us-ascii?Q?zN6gs7CFapHA/DGKDVb/dZ0CyceDYmYui8XUZx4hq96Huxo3l5H4su0fhkJ0?=
 =?us-ascii?Q?w+xQfEJsUJetzb0cqXpSGAWvV/j5imlvoX4HksHDHVHR/+YrFUoojYHGpb4i?=
 =?us-ascii?Q?2vYcBYeKuXH79i0tWYxmCBjshZm3/utE/0d3tO9Tyd3O/cqVwYQoq0Sny2mg?=
 =?us-ascii?Q?gr/MnGNFn/hICsou5wcpWMHs+Rzy64ruQv5zeBOlmGMOTXhpAi9fQ0AqbBAc?=
 =?us-ascii?Q?dFJdonqiL6wYGOd/ES/P7HWovtvJCDTjnb1yqaS7DbZdnBlWutZyTcfuvJnG?=
 =?us-ascii?Q?v8iDXgynHb7Npn9KHtH2LRo2vnDBC+2PVW+JBt5xnARtgzehHyNNhfYw4Oex?=
 =?us-ascii?Q?/a0C3V1JDDLnqnI2V/hopTBbvuRDujUHrLqIlcElBR9/AVlzeVwxK78lcCe2?=
 =?us-ascii?Q?YWoTcrcfOjHv5K+ieXOzJJpAlLaEI0AHUTuWWfL2xvjEytBnTnCBZ2+gR8Rr?=
 =?us-ascii?Q?MamGl0F/o6iQT4pjEOKllmAghAOJhw6MENq35kPOp8i8nj+DzLhe1i+IqvqQ?=
 =?us-ascii?Q?agWu0VDtV7T3uMw+aCLer/mNG4qTinfHXYdGHQROgrdL+Xg18uMuG0X6nYoT?=
 =?us-ascii?Q?RrNQXB2QsMB+G13bK+GA959GcxgkkBO2U8ShxZNUattoTdmrsEylx/JQ/OH3?=
 =?us-ascii?Q?tmielXh+jCw18EMnEbXjn3uUpaLOZ0tmPpCw46XApC8etZoSrmieDQKKofof?=
 =?us-ascii?Q?Ec3tY14N/1oTm1w0dV6qwzMr6SwYvNFq1K3rm3B1setcGgUH/mcSd8gR1b6O?=
 =?us-ascii?Q?nGUfN3BEznjXdaSVOHboakWhyov5Ru6j971hIQlJ9fTxNtwOAR1aTdydea5S?=
 =?us-ascii?Q?/nymsq0JqAxTw7kzzrc7XORkZ3OlXY2YpVL0Ujy5v7lUKhXOqhyf6vFijNcj?=
 =?us-ascii?Q?pHI36H7HTM1AjZYnpefUn7JB+rqYjBOa5Ambv0GrP0rCa1XRoi/fTMvMolsI?=
 =?us-ascii?Q?owGMzyhoGYgtiqle8N3ZPBxvyVe9TRbshlN7oGQUy6ycmFYbbVyZY0m68qQ0?=
 =?us-ascii?Q?bqi5Gsg6MA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f375d9-448c-4f89-db5d-08df205505c5
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 07:16:05.2568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SwzFYA8xRxLrTsC88Nn7BeuXIcx+8v17J1t4FgM4q1eFRtLVbOKMGhUXTVSCJuodtzdM0IoVS6wNBZAbeOppsrO26c6jYMY99eQG2XYHXcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPFF852A1B5A
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 07:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247072

NEWS: https://gitlab.gnome.org/GNOME/glib-networking/-/blob/2.90.0/NEWS

2.90.0 - September 10, 2026
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

* Bugs fixed:
  - !286 meson: Remove version checks that are always true (correctmost)

2.90.alpha - June 25, 2026
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

* Bugs fixed:
  - #222 test fails with openssl 3.4.x (Michael Catanzaro)
  - #226 (CVE-2025-60018) (#YWH-PGM9867-106) Out of Bond Reads on glib-
    networking through tls/openssl/gtlscertificate-openssl.c via
    "g_tls_certificate_openssl_get_property()" due to Incorrect BIO_write R=
eturn
    Value Validation in Certificate PEM Export (Michael Catanzaro)
  - #228 (CVE-2026-2574) (#YWH-PGM9867-150) OOB Read on glib-networking thr=
ough
    tls/openssl/gtlsclientconnection-openssl.c via
    g_tls_client_connection_openssl_get_property() (Michael Catanzaro)
  - #231 (CVE-2026-10028) (#YWH-PGM9867-278) Infinite loop in certification=
 path
    building (Michael Catanzaro)
  - !261 meson: Introduce option for enable/disable tests (Leonid Zaburunov=
)
  - !263 openssl: check return value of g_tls_bio_alloc() and BIO_new() (Mi=
chael
    Catanzaro)
  - !265 openssl: delete support for OCSP stapling (Michael Catanzaro)
  - !268 Fix file database and PKCS11 test failures and update CI! (Michael
    Catanzaro)
  - !270 Fix miscellaneous safety issues reported by bug hunters (Michael
    Catanzaro)
  - !271 Delete gtlshttp (Michael Catanzaro)
  - !272 Fix connection test reusing a GError (Michael Catanzaro)
  - !273 openssl: fix error code confusion (Michael Catanzaro)
  - !274 ci: add catch for reporting stack traces (Michael Catanzaro)
  - !277 Require OpenSSL 1.1.1 or newer (Michael Catanzaro)
  - !280 Some fixes found with kiro (Ignacio Casal Quinteiro)
  - !281 Fix various memory leaks (Michael Catanzaro)
  - !283 openssl: refactor error handling code (Michael Catanzaro)
  - !284 openssl: use ERR_clear_error() all over the place (Michael Catanza=
ro)
  - !285 gnutls: always notify accepted-cas property after handshake (Micha=
el
    Catanzaro)

- Drop the four backported OpenSSL CVE patches (CVE-2025-60018,
CVE-2025-60019, CVE-2026-2574); all are now included upstream in 2.90.0.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...-check-return-value-when-writing-to-.patch |  82 ----------
 ...heck-return-value-of-g_tls_bio_alloc.patch |  42 -----
 ...enssl-check-return-values-of-BIO_new.patch | 146 ------------------
 ...of-bounds-read-in-accepted-cas-prope.patch |  48 ------
 ...ng_2.80.1.bb =3D> glib-networking_2.90.0.bb} |  10 +-
 5 files changed, 4 insertions(+), 324 deletions(-)
 delete mode 100644 meta/recipes-core/glib-networking/glib-networking/0001-=
openssl-properly-check-return-value-when-writing-to-.patch
 delete mode 100644 meta/recipes-core/glib-networking/glib-networking/0002-=
openssl-check-return-value-of-g_tls_bio_alloc.patch
 delete mode 100644 meta/recipes-core/glib-networking/glib-networking/0003-=
openssl-check-return-values-of-BIO_new.patch
 delete mode 100644 meta/recipes-core/glib-networking/glib-networking/0004-=
openssl-fix-out-of-bounds-read-in-accepted-cas-prope.patch
 rename meta/recipes-core/glib-networking/{glib-networking_2.80.1.bb =3D> g=
lib-networking_2.90.0.bb} (81%)

diff --git a/meta/recipes-core/glib-networking/glib-networking/0001-openssl=
-properly-check-return-value-when-writing-to-.patch b/meta/recipes-core/gli=
b-networking/glib-networking/0001-openssl-properly-check-return-value-when-=
writing-to-.patch
deleted file mode 100644
index 72f0c0c61ef..00000000000
--- a/meta/recipes-core/glib-networking/glib-networking/0001-openssl-proper=
ly-check-return-value-when-writing-to-.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 330f59dcb39386b3d640ce94fcd3f75e1668ad88 Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@redhat.com>
-Date: Mon, 4 Aug 2025 15:10:21 -0500
-Subject: [PATCH 1/3] openssl: properly check return value when writing to =
BIO
- objects
-
-In particular, we will read out of bounds, and then write the invalid
-memory, if BIO_write() fails when getting the PROP_CERTIFICATE_PEM
-property. Here we attempt to check the return value, but the check is
-not correct.
-
-This also fixes a leak of the BIO in the same place.
-
-Also add error checking to PROP_SUBJECT_NAME and PROP_ISSUER_NAME, for
-good measure.
-
-Fixes #226
-
-CVE: CVE-2025-60018
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- tls/openssl/gtlscertificate-openssl.c | 25 +++++++++++++++----------
- 1 file changed, 15 insertions(+), 10 deletions(-)
-
-diff --git a/tls/openssl/gtlscertificate-openssl.c b/tls/openssl/gtlscerti=
ficate-openssl.c
-index 648f3e8..b536559 100644
---- a/tls/openssl/gtlscertificate-openssl.c
-+++ b/tls/openssl/gtlscertificate-openssl.c
-@@ -362,15 +362,12 @@ g_tls_certificate_openssl_get_property (GObject    *=
object,
-     case PROP_CERTIFICATE_PEM:
-       bio =3D BIO_new (BIO_s_mem ());
-=20
--      if (!PEM_write_bio_X509 (bio, openssl->cert) || !BIO_write (bio, "\=
0", 1))
--        certificate_pem =3D NULL;
--      else
-+      if (PEM_write_bio_X509 (bio, openssl->cert) =3D=3D 1 && BIO_write (=
bio, "\0", 1) =3D=3D 1)
-         {
-           BIO_get_mem_data (bio, &certificate_pem);
-           g_value_set_string (value, certificate_pem);
--
--          BIO_free_all (bio);
-         }
-+      BIO_free_all (bio);
-       break;
-=20
-     case PROP_PRIVATE_KEY:
-@@ -411,8 +408,12 @@ g_tls_certificate_openssl_get_property (GObject    *o=
bject,
-     case PROP_SUBJECT_NAME:
-       bio =3D BIO_new (BIO_s_mem ());
-       name =3D X509_get_subject_name (openssl->cert);
--      X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS);
--      BIO_write (bio, "\0", 1);
-+      if (X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS) < 0 |=
|
-+          BIO_write (bio, "\0", 1) !=3D 1)
-+        {
-+          BIO_free_all (bio);
-+          break;
-+        }
-       BIO_get_mem_data (bio, (char **)&name_string);
-       g_value_set_string (value, name_string);
-       BIO_free_all (bio);
-@@ -421,9 +422,13 @@ g_tls_certificate_openssl_get_property (GObject    *o=
bject,
-     case PROP_ISSUER_NAME:
-       bio =3D BIO_new (BIO_s_mem ());
-       name =3D X509_get_issuer_name (openssl->cert);
--      X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS);
--      BIO_write (bio, "\0", 1);
--      BIO_get_mem_data (bio, &name_string);
-+      if (X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS) < 0 |=
|
-+          BIO_write (bio, "\0", 1) !=3D 1)
-+        {
-+          BIO_free_all (bio);
-+          break;
-+        }
-+      BIO_get_mem_data (bio, (char **)&name_string);
-       g_value_set_string (value, name_string);
-       BIO_free_all (bio);
-       break;
---=20
-2.43.0
-
diff --git a/meta/recipes-core/glib-networking/glib-networking/0002-openssl=
-check-return-value-of-g_tls_bio_alloc.patch b/meta/recipes-core/glib-netwo=
rking/glib-networking/0002-openssl-check-return-value-of-g_tls_bio_alloc.pa=
tch
deleted file mode 100644
index 9c3d19f373d..00000000000
--- a/meta/recipes-core/glib-networking/glib-networking/0002-openssl-check-=
return-value-of-g_tls_bio_alloc.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From b5a3a8b28b7616403d5454f5f1816c933c34cdac Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@redhat.com>
-Date: Thu, 21 Aug 2025 16:58:54 -0500
-Subject: [PATCH 2/3] openssl: check return value of g_tls_bio_alloc()
-
-This function may fail, in which case the parameter remains
-uninitialized. We'd better not dereference it in that case.
-
-CVE: CVE-2025-60019
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- tls/openssl/gtlsbio.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/tls/openssl/gtlsbio.c b/tls/openssl/gtlsbio.c
-index 0f603fe..1e54943 100644
---- a/tls/openssl/gtlsbio.c
-+++ b/tls/openssl/gtlsbio.c
-@@ -370,7 +370,8 @@ g_tls_bio_new_from_iostream (GIOStream *io_stream)
-   GTlsBio *gbio;
-=20
-   ret =3D g_tls_bio_alloc (&gbio);
--  gbio->io_stream =3D g_object_ref (io_stream);
-+  if (ret)
-+    gbio->io_stream =3D g_object_ref (io_stream);
-=20
-   return ret;
- }
-@@ -382,7 +383,8 @@ g_tls_bio_new_from_datagram_based (GDatagramBased *soc=
ket)
-   GTlsBio *gbio;
-=20
-   ret =3D g_tls_bio_alloc (&gbio);
--  gbio->socket =3D g_object_ref (socket);
-+  if (ret)
-+    gbio->socket =3D g_object_ref (socket);
-=20
-   return ret;
- }
---=20
-2.43.0
-
diff --git a/meta/recipes-core/glib-networking/glib-networking/0003-openssl=
-check-return-values-of-BIO_new.patch b/meta/recipes-core/glib-networking/g=
lib-networking/0003-openssl-check-return-values-of-BIO_new.patch
deleted file mode 100644
index 1e925da980c..00000000000
--- a/meta/recipes-core/glib-networking/glib-networking/0003-openssl-check-=
return-values-of-BIO_new.patch
+++ /dev/null
@@ -1,146 +0,0 @@
-From 9c22e08b41255543bc15017123ed6c64b97b9b7c Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@redhat.com>
-Date: Thu, 21 Aug 2025 17:21:01 -0500
-Subject: [PATCH 3/3] openssl: check return values of BIO_new()
-
-We probably need to check even more return values of even more OpenSSL
-functions, but these ones allocate memory and that's particularly
-important to get right.
-
-CVE: CVE-2025-60019
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- tls/openssl/gtlscertificate-openssl.c | 42 ++++++++++++++++++++-------
- 1 file changed, 32 insertions(+), 10 deletions(-)
-
-diff --git a/tls/openssl/gtlscertificate-openssl.c b/tls/openssl/gtlscerti=
ficate-openssl.c
-index b536559..4fa5286 100644
---- a/tls/openssl/gtlscertificate-openssl.c
-+++ b/tls/openssl/gtlscertificate-openssl.c
-@@ -166,6 +166,9 @@ export_privkey_to_der (GTlsCertificateOpenssl  *openss=
l,
-     goto err;
-=20
-   bio =3D BIO_new (BIO_s_mem ());
-+  if (!bio)
-+    goto err;
-+
-   if (i2d_PKCS8_PRIV_KEY_INFO_bio (bio, pkcs8) =3D=3D 0)
-     goto err;
-=20
-@@ -199,6 +202,9 @@ export_privkey_to_pem (GTlsCertificateOpenssl *openssl=
)
-     return NULL;
-=20
-   bio =3D BIO_new (BIO_s_mem ());
-+  if (!bio)
-+    goto out;
-+
-   ret =3D PEM_write_bio_PKCS8PrivateKey (bio, openssl->key, NULL, NULL, 0=
, NULL, NULL);
-   if (ret =3D=3D 0)
-     goto out;
-@@ -211,7 +217,7 @@ export_privkey_to_pem (GTlsCertificateOpenssl *openssl=
)
-   result =3D g_strdup (data);
-=20
- out:
--  BIO_free_all (bio);
-+  g_clear_pointer (&bio, BIO_free_all);
-   return result;
- }
-=20
-@@ -232,6 +238,9 @@ maybe_import_pkcs12 (GTlsCertificateOpenssl *openssl)
-     return;
-=20
-   bio =3D BIO_new (BIO_s_mem ());
-+  if (!bio)
-+    goto import_failed;
-+
-   status =3D BIO_write (bio, openssl->pkcs12_data->data, openssl->pkcs12_=
data->len);
-   if (status <=3D 0)
-     goto import_failed;
-@@ -323,7 +332,7 @@ g_tls_certificate_openssl_get_property (GObject    *ob=
ject,
-   guint8 *data;
-   BIO *bio;
-   GByteArray *byte_array;
--  char *certificate_pem;
-+  const char *certificate_pem;
-   long size;
-=20
-   const ASN1_TIME *time_asn1;
-@@ -362,12 +371,12 @@ g_tls_certificate_openssl_get_property (GObject    *=
object,
-     case PROP_CERTIFICATE_PEM:
-       bio =3D BIO_new (BIO_s_mem ());
-=20
--      if (PEM_write_bio_X509 (bio, openssl->cert) =3D=3D 1 && BIO_write (=
bio, "\0", 1) =3D=3D 1)
-+      if (bio && PEM_write_bio_X509 (bio, openssl->cert) =3D=3D 1 && BIO_=
write (bio, "\0", 1) =3D=3D 1)
-         {
-           BIO_get_mem_data (bio, &certificate_pem);
-           g_value_set_string (value, certificate_pem);
-         }
--      BIO_free_all (bio);
-+      g_clear_pointer (&bio, BIO_free_all);
-       break;
-=20
-     case PROP_PRIVATE_KEY:
-@@ -407,6 +416,8 @@ g_tls_certificate_openssl_get_property (GObject    *ob=
ject,
-=20
-     case PROP_SUBJECT_NAME:
-       bio =3D BIO_new (BIO_s_mem ());
-+      if (!bio)
-+        break;
-       name =3D X509_get_subject_name (openssl->cert);
-       if (X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS) < 0 |=
|
-           BIO_write (bio, "\0", 1) !=3D 1)
-@@ -421,6 +432,8 @@ g_tls_certificate_openssl_get_property (GObject    *ob=
ject,
-=20
-     case PROP_ISSUER_NAME:
-       bio =3D BIO_new (BIO_s_mem ());
-+      if (!bio)
-+        break;
-       name =3D X509_get_issuer_name (openssl->cert);
-       if (X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS) < 0 |=
|
-           BIO_write (bio, "\0", 1) !=3D 1)
-@@ -533,8 +546,11 @@ g_tls_certificate_openssl_set_property (GObject      =
*object,
-         break;
-       CRITICAL_IF_CERTIFICATE_INITIALIZED ("certificate-pem");
-       bio =3D BIO_new_mem_buf ((gpointer)string, -1);
--      openssl->cert =3D PEM_read_bio_X509 (bio, NULL, NULL, NULL);
--      BIO_free (bio);
-+      if (bio)
-+        {
-+          openssl->cert =3D PEM_read_bio_X509 (bio, NULL, NULL, NULL);
-+          BIO_free (bio);
-+        }
-       if (openssl->cert)
-         openssl->have_cert =3D TRUE;
-       else if (!openssl->construct_error)
-@@ -554,8 +570,11 @@ g_tls_certificate_openssl_set_property (GObject      =
*object,
-       CRITICAL_IF_KEY_INITIALIZED ("private-key");
-=20
-       bio =3D BIO_new_mem_buf (bytes->data, bytes->len);
--      openssl->key =3D d2i_PrivateKey_bio (bio, NULL);
--      BIO_free (bio);
-+      if (bio)
-+        {
-+          openssl->key =3D d2i_PrivateKey_bio (bio, NULL);
-+          BIO_free (bio);
-+        }
-       if (openssl->key)
-         openssl->have_key =3D TRUE;
-       else if (!openssl->construct_error)
-@@ -575,8 +594,11 @@ g_tls_certificate_openssl_set_property (GObject      =
*object,
-       CRITICAL_IF_KEY_INITIALIZED ("private-key-pem");
-=20
-       bio =3D BIO_new_mem_buf ((gpointer)string, -1);
--      openssl->key =3D PEM_read_bio_PrivateKey (bio, NULL, NULL, NULL);
--      BIO_free (bio);
-+      if (bio)
-+        {
-+          openssl->key =3D PEM_read_bio_PrivateKey (bio, NULL, NULL, NULL=
);
-+          BIO_free (bio);
-+        }
-       if (openssl->key)
-         openssl->have_key =3D TRUE;
-       else if (!openssl->construct_error)
---=20
-2.43.0
-
diff --git a/meta/recipes-core/glib-networking/glib-networking/0004-openssl=
-fix-out-of-bounds-read-in-accepted-cas-prope.patch b/meta/recipes-core/gli=
b-networking/glib-networking/0004-openssl-fix-out-of-bounds-read-in-accepte=
d-cas-prope.patch
deleted file mode 100644
index d3673656ad5..00000000000
--- a/meta/recipes-core/glib-networking/glib-networking/0004-openssl-fix-ou=
t-of-bounds-read-in-accepted-cas-prope.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From be2173eb9b769255df9474a9128e642b60894f10 Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@gnome.org>
-Date: Thu, 12 Mar 2026 12:47:00 -0500
-Subject: [PATCH] openssl: fix out of bounds read in accepted-cas property
- getter
-
-The d2i and i2d functions are quite dangerous because they advance the
-provided pointer, so we have to pass a temporary pointer if we're later
-going to do anything with the original pointer.
-
-I've audited the codebase and found this is our only such mistake.
-
-Fixes #228 (CVE-2026-2574)
-
-Part-of: <https://gitlab.gnome.org/GNOME/glib-networking/-/merge_requests/=
269>
-
-
-(cherry picked from commit c3c84b269165f2a312d47fa15c5cbc7f8ead7631)
-
-Co-authored-by: Michael Catanzaro <mcatanzaro@gnome.org>
-
-CVE: CVE-2026-2574
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- tls/openssl/gtlsclientconnection-openssl.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/tls/openssl/gtlsclientconnection-openssl.c b/tls/openssl/gtls=
clientconnection-openssl.c
-index e98fb0b..e2ff0d4 100644
---- a/tls/openssl/gtlsclientconnection-openssl.c
-+++ b/tls/openssl/gtlsclientconnection-openssl.c
-@@ -141,9 +141,11 @@ g_tls_client_connection_openssl_get_property (GObject=
    *object,
-               if (size > 0)
-                 {
-                   unsigned char *ca;
-+                  unsigned char *tmp;
-=20
-                   ca =3D g_malloc (size);
--                  size =3D i2d_X509_NAME (sk_X509_NAME_value (openssl->ca=
_list, i), &ca);
-+                  tmp =3D ca;
-+                  size =3D i2d_X509_NAME (sk_X509_NAME_value (openssl->ca=
_list, i), &tmp);
-                   if (size > 0)
-                     accepted_cas =3D g_list_prepend (accepted_cas, g_byte=
_array_new_take (
-                                                    ca, size));
---=20
-2.43.0
-
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb b/=
meta/recipes-core/glib-networking/glib-networking_2.90.0.bb
similarity index 81%
rename from meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.90.0.bb
index aa13900da1e..1850712690c 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.90.0.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c \
 SECTION =3D "libs"
 DEPENDS =3D "glib-2.0-native glib-2.0"
=20
-SRC_URI[archive.sha256sum] =3D "b80e2874157cd55071f1b6710fa0b911d5ac5de106=
a9ee2a4c9c7bee61782f8e"
+SRC_URI[archive.sha256sum] =3D "83a75e3d9c36b66ee86d3281c2fc997816101968a5=
126ba322b2acb9a74dd8c0"
=20
 # Upstream note that for the openssl backend, half the tests where this ba=
ckend don't return
 # the expected error code or don't work as expected so default to gnutls
@@ -28,11 +28,9 @@ PACKAGECONFIG[gnomeproxy] =3D "-Dgnome_proxy=3Denabled,-=
Dgnome_proxy=3Ddisabled,gsetti
=20
 inherit gnomebase gettext upstream-version-is-even gio-module-cache ptest-=
gnome
=20
-SRC_URI +=3D "file://0001-openssl-properly-check-return-value-when-writing=
-to-.patch \
-            file://0002-openssl-check-return-value-of-g_tls_bio_alloc.patc=
h \
-            file://0003-openssl-check-return-values-of-BIO_new.patch \
-            file://0004-openssl-fix-out-of-bounds-read-in-accepted-cas-pro=
pe.patch \
-            file://run-ptest"
+SRC_URI +=3D "\
+            file://run-ptest \
+            "
=20
 FILES:${PN} +=3D "\
                 ${libdir}/gio/modules/libgio*.so \

