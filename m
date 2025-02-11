Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37E1C021B2
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:14 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.137])
 by mx.groups.io with SMTP id smtpd.web10.1087.1739286064292317958
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:01:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=MaRtitfT;
 spf=pass (domain: weidmueller.com, ip: 40.107.21.137, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7QqCG6PeUw2vWFQpuUZrfotgzl50zF3S8jsjdZwjaNtgKX3cFQw6ahwvZPr53iDvA/n8rDbWgIEAj5YGbWUrXMZPeZbBdEIbSTEemSFplyNFwKesjBdNa332IAMvDUVuDLPKKUHdubsgmk4xjGEq4xrkdI1KZ3XE8xoI2YKDeuoSwn2CKZyfrbzoS1p/LS/DeInr4i0XwUPnnTbP6Tym9/7gD7VOhWOh3yTMkxcv7Y6Sjh0edqK3YFvKxI+USX0bvuyW8SeyAk9H0MdnLJL7zHUBvDcQprhydgVZXVmews8hPX4TZPWJHU6CEKapfcGrIuVERvPpl+ZEkbOSg7JRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTgYyQXmNOedJPJ558XwdHav/DE4EG+j/2GwUn+achI=;
 b=GNZ/Am8kenGg+SsBh4tY1YzgyKh+HuDszTzUOrsRr3LdWlX25aX3e0ScScga8lf/KcniQK566f+RxywFogEwniS0/g3q4caAlj95y2BrbZol7rJovjnj+N/ADvZR3bklj6Y0Dxy/4ajygGpHMf7E4qt1yYT0v29hiLXTAxgFgdOiCqiHwA0a0YcGRYFGjZEZR6MDzDQtpzgzOU9jnrG8ftoRk+PfFRtvPLGYG5cROJhBnm4kOEmhos+5wQtGhEm2CRgM1THyDKQEbviRL4jrYEpB+tgEC9OL6Vdnm16HEAB19efAr0eEH80tskcU2pOll7cMVFXSnzup2sh7tVQlkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTgYyQXmNOedJPJ558XwdHav/DE4EG+j/2GwUn+achI=;
 b=MaRtitfTIWmovktc346zXroN+2u/K16gyJz17ied/vwm3zpx5BgB6OctI5TELKGH/o0rZAWoRQ90B/MJIEa1LN8CvnAncZ3ZsR+LLBAg3SL03ef4Gr4McxykJtwhXEUwTmEf2o68OWhMdlSt2Af/p4xOVhowSa/4ElhwqYxV4oV/W6U1RfeCzPaWV/EGZDo/tOGv7/oobfRycLmGLP9/zqLwqX31E4cW+RScRWAx3QDLsNjRaEAPN24pvhDTAnOWUaTPNhJ8icKKwXLKYA2ekP44OrJzY08jrf1Mli+wbInrgunee1ij2OCszwIjgN/IaC1D3tdBWP0n+R/bwJe2Yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by AS8PR08MB9840.eurprd08.prod.outlook.com (2603:10a6:20b:613::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.17; Tue, 11 Feb
 2025 15:01:00 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:01:00 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 17/30] classes: add vendor class for cargo
Date: Tue, 11 Feb 2025 16:00:21 +0100
Message-ID: <20250211150034.18696-17-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|AS8PR08MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: 5019ed0a-e84b-46dc-655c-08dd4aace1f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Neoz5nFrPkxZygX96cjq8ZQQWf/TUJSfjSG7GKTp8Yx0gY1DB+DEMN0gaDe/?=
 =?us-ascii?Q?X+xf0dj09eTgHWaJprtNRsMO4Zx84pcn3rtoFiYCqQrTX09uAtjAKDr8ULbU?=
 =?us-ascii?Q?6MWrfVLGt1yvIrOUK+qUEwyTyRjgxlVKuVE6E8SUyPa9sqOjMgSAfVSw3qRn?=
 =?us-ascii?Q?HL1H4Efaned/9Zqjyy5znJfeV5U6W8betmLc7Vz4hG/k3aH4Cu7dTrJuMm7z?=
 =?us-ascii?Q?qq8szugbkgcMFL2tKhkIDlNkPRK8UhUMRVNYz1Y1NSgSi5VbBPwKebk6QAHV?=
 =?us-ascii?Q?toie+uvGkPotQkK5ZqP+MByBHKOIZ/dj76Nq6bEvILMp+YVjTuD8OtEq3UwG?=
 =?us-ascii?Q?h2Xmlnr47iFhAQtpxC/yYt4hxaZaLqu4owH8pe4n9V6pCRGOU6srV2AJa+Nx?=
 =?us-ascii?Q?C46shIjBFI+o7oHImTCWDVqdcEp9SuA3J3j4g0lSa6LEU2ndzqiOGNvndwx8?=
 =?us-ascii?Q?QXUQvKjS4BV4nYj+lMFhqBwntGP51wNE49zYhizQeXHn/NKkzf0w8Sk2XcIW?=
 =?us-ascii?Q?X3poanCuEsblafpaRxLO9no7nDP1ZSi/4dfFIpMSKdNTJjWS0fhrt7RPoZYo?=
 =?us-ascii?Q?f5KcN3hIpXWc9LTVm3ym7SN69rQpMQgfBpLcSNI/FGOOEYOVIH+OGYAmpJeC?=
 =?us-ascii?Q?pDL/FRNfvjZ0XoujILaM3Ouc1ZDatjhJz1AyNTn6rQ9zbNJUV7HHjOVxbLE3?=
 =?us-ascii?Q?98xVPy+w7namaHxYaFWrY08pjUfkF+GFVLzjcQHPXtV6H5WDxf4zmDOkHgFs?=
 =?us-ascii?Q?B8w0eQnV0mnpx2J/9/K+dYUg76tZ9++pE8dS5Tna1/D7ZnwzN2wv63rmzOlB?=
 =?us-ascii?Q?jLTich7TKY8+rvTPijZgCXhElRreZGxjq7o5owodhQScGEKLf6FMfjwb/VD6?=
 =?us-ascii?Q?dmSPin+qrqSUkE5/J7MBZ5Aeb4ebick/Oou8Um/28ZSUSGAFQz8RU9rAgwzG?=
 =?us-ascii?Q?FWfWXXizZzTZRlASwJMLNOFKOohSD0RCoQ8brO290XgOjW0aPQQsmgk1/E4A?=
 =?us-ascii?Q?4bxGdI5n1U71I9phtEyBOUOamrc0o07SdmKBHPGrgg2TbeTMETGpPOTXEzAU?=
 =?us-ascii?Q?AqaTGPB+4Oq7DINK+DE9WO0v7uI057qYa57COyLCpH0vv2jo8fcyHKH7dhn5?=
 =?us-ascii?Q?KA3WLiRpHI1DLkBMUjy8iGFobrP6wxIDDe0lSIsruud1NeiHTmEOsUuGTka2?=
 =?us-ascii?Q?F1dKKuiiiIm+5M3N/ti5sbdaKmx0Gp3ckF+6LZ3PZIlaPOBelAiOhWhZymAE?=
 =?us-ascii?Q?5EGMR7Q9TgVW/HnS+r68yg2SWyzeqPKbIfVCZIDrOtTOmCbWkI34FAn31rSE?=
 =?us-ascii?Q?pfL9ChoOao8NkwLvU2P+V8WMCE70GIP3f3OSu8EJ+9X2SccembmCAKHL1mV8?=
 =?us-ascii?Q?H+ayknss9RFzD/ySo811dzMj50JG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ppj0kLF7FIBa/21bH6m4MbnGHggkjOcsimymqo5zPr0dcDKa8/vfzCxPIoLr?=
 =?us-ascii?Q?GXX5cz2jaxEkQCi6XwDanJm+IJrLVw8s2fRZnKx8Shl5yT/smModHxUMsroo?=
 =?us-ascii?Q?giRdVFTTMAc6RCcfgeLEn5FPM+gqaYVGN16gnNGjofdI9e2xkr4655MzoBOC?=
 =?us-ascii?Q?nGqX4Dx18MfU+0mMGp8qp3DzY9q+CkUW46ai2PW/IxdNH6r2WhchZmXeWGHH?=
 =?us-ascii?Q?wboso3wxHkwjqPuTkeuFqEK6FfT98sDBGefsKqNeLMCVgoHO3TTwKmVKUpcr?=
 =?us-ascii?Q?VZYcifOJG/J06DYHklhDRc+RST2Mu+76gcby4fWmn1I4BmZtQZNmaBBHjMwJ?=
 =?us-ascii?Q?uvZ6Eqe1o9g6ycHp+LzGcs8H/5Ar52kPYGKB2z9st0906XE4GBHMHm0FRSlC?=
 =?us-ascii?Q?SnFnbREfnii4UQhGIrMzFE1XLwtYY+R26HRZxhJbMktIs1kiMOHw2RUbyGRE?=
 =?us-ascii?Q?kQsUUMyRn33xoBZ7hF6cYNtkFlYudAyLN7WWJmhp1tFqFjmp83zBJAX3yVsw?=
 =?us-ascii?Q?Ma/zgI7SepcBpOycOXsyQW2d4tieHKa//MojrkiDMuZ4qVv8R3pG4unI87S9?=
 =?us-ascii?Q?SyHS8vUjqVuojQTWJL+9JnFd9BcSdXRRFAPLnESXc8Uj9CkkgKbFiXmE+wIn?=
 =?us-ascii?Q?h5j67d9HOh4y6cHWzQl8mc0uqQhqYKX3wLQVrGZuigaXaC3AsUdG6EHBE3L/?=
 =?us-ascii?Q?4wTtm2vK/jQOWYTPvzEol7wCJGQ/Wo2+z9MVLStRvgRk5rLIWktR855L8jAs?=
 =?us-ascii?Q?73jlg5tcFkoB539m48YW2fQGfjpw1YL50XM7Rs3WcnbwPT6qb/D1sYyQqXlk?=
 =?us-ascii?Q?IeJesP1tkbdnIssVVAlR+nWiv+Ll2iBdBLChn4ADBNPmA0LPcCzdX7nsBgir?=
 =?us-ascii?Q?78lMiGtWm8ZABNDprbos1ECeWnPNgwm6b7YRxFv8h9mZGp+tt+bk2bm63kob?=
 =?us-ascii?Q?30yP8hdmbOAF+PyDokS+UpC8hNdGaI6KP7kjp4wxByEYNiiGA0TWtm3NuVR0?=
 =?us-ascii?Q?BdD4CixhVwYoNXmJwkAYO/t3rd56MC6gcXNmPD9VRRPATIUMOSzgehkAsMIS?=
 =?us-ascii?Q?s+dFq6sGKm4ybNVHdxerAsZfKC6mBu4uEgopn8gqxdjY4w0dMAaRWPSISX47?=
 =?us-ascii?Q?k5fH59Exl+Uj+V+2vYlcko+AarCv0hLALaS4cMel0fx5HEz3iN4E2klUDvmK?=
 =?us-ascii?Q?Un89Bx6Tmcvb1fo33YD0aTlDTpLMG6Qfv85VfLarqmmaOE/+tTiMOOLs7aRd?=
 =?us-ascii?Q?fKNKY4Cvuntt/1tBYITRsCAzuMEZAaHHjRJWp30v+tC7RSTzku75Z3x07Wti?=
 =?us-ascii?Q?8lGRXRnyunQEx1xD62LY6xipcP/bt28KkNsyZWxTiN0OS91b6+EfxgE3oQC9?=
 =?us-ascii?Q?3UWna9BO1TZac+TcPsC/eNd4MP6fmQkJEv3gx/9fBKVZDyLxF5DgqARtP7nA?=
 =?us-ascii?Q?F4OuS9AVH1dyWjvHUBU4r0z80QoDHr9/em2XOh8rYPMNJMwVhBnVOyhcRFyG?=
 =?us-ascii?Q?aexxjvcIaDdgQqCqByfLncdAilYTJt3GvnkzkRKlL5EyZTi8MKcr4B2GLg/Z?=
 =?us-ascii?Q?/xq1W83vPaRS2mUQk/NZoAEuUZaWfzm2pAD9gipo9dMKIpcGHS7/mXjJeCIp?=
 =?us-ascii?Q?Sw=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5019ed0a-e84b-46dc-655c-08dd4aace1f0
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:00:54.3444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQgZC7NjOHYhIZ188nooVysVx5OOr2I1lbozbff/YQbSsp0jvIaAisew/rUmE/GOw5Cqwi7pgqPCMWDd7wrGFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9840
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211146

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Add a vendor class for cargo to resolve the dependency SRC_URIs from a
Cargo.lock file and populate the crate vendor folder.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes-recipe/vendor_cargo.bbclass | 46 ++++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 meta/classes-recipe/vendor_cargo.bbclass

diff --git a/meta/classes-recipe/vendor_cargo.bbclass b/meta/classes-recipe=
/vendor_cargo.bbclass
new file mode 100644
index 0000000000..495f7e01ce
--- /dev/null
+++ b/meta/classes-recipe/vendor_cargo.bbclass
@@ -0,0 +1,46 @@
+# Copyright (C) 2025 Weidmueller Interface GmbH & Co. KG
+# Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+# The name of the vendor directory
+CARGO_VENDOR_SUBDIR =3D "vendor"
+
+# The URL of the crate registry
+CARGO_REGISTRY ?=3D "https://crates.io"
+
+CARGO_SRC_PATH =3D "${S}/${CARGO_SRC_DIR}"
+CARGO_SRC_SUBDIR =3D "${@os.path.relpath(d.getVar('CARGO_SRC_PATH'), d.get=
Var('WORKDIR'))}"
+CARGO_SRC_URI_FILE =3D "${VENDOR_DIR}/cargo-source-uris.txt"
+SRC_URI_FILES:append =3D " ${CARGO_SRC_URI_FILE}"
+
+inherit vendor
+
+CARGO_VENDORING_DIRECTORY =3D "${CARGO_SRC_PATH}/${CARGO_VENDOR_SUBDIR}"
+
+python vendor_cargo_do_vendor_resolve() {
+    from oe.vendor import cargo
+
+    lock_file_dir =3D d.getVar("CARGO_LOCK_PATH")
+    lock_file_dir =3D get_early_source_dir(d, lock_file_dir)
+    registry =3D d.getVar("CARGO_REGISTRY")
+    src_subdir =3D d.getVar("CARGO_SRC_SUBDIR")
+    vendor_subdir =3D d.getVar("CARGO_VENDOR_SUBDIR")
+    uris =3D cargo.resolve_src_uris(lock_file_dir, registry, src_subdir,
+                                  vendor_subdir)
+    with open(d.getVar("CARGO_SRC_URI_FILE"), "w") as f:
+        oe.vendor.dump(f, uris)
+}
+
+python emulate_crate_vendor() {
+    from oe.vendor import cargo
+
+    lock_file_dir =3D d.getVar("CARGO_LOCK_PATH")
+    lock_file_dir =3D get_early_source_dir(d, lock_file_dir)
+    vendor_dir =3D d.getVar("CARGO_VENDORING_DIRECTORY")
+    cargo.populate_vendor(lock_file_dir, vendor_dir)
+}
+do_unpack[postfuncs] +=3D "emulate_crate_vendor"
+
+EXPORT_FUNCTIONS do_vendor_resolve
--=20
2.39.5


