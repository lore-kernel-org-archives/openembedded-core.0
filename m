Return-Path: <benhur.tessele@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6F3CA5FD2
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 12:57:09 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10612.1790859426344980316
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 05:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=S5bIzels;
 spf=pass (domain: est.tech, ip: 40.107.162.67, mailfrom: benhur.tessele@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYIE4k7ls39WtFEIko/m2YBFnsEKJxoyns6TWMznKexFKLsjloI3za9QHRe8S1mCfqZVX5vRw51rEXluSrvzjynU887rUkm1DyUGPvUBZNMw9CSjO0lw4viuphWV32ZOJWXdgfRdOPmQklyp4Z2INjRhy7NsgJ77S6OV6lXYRBu6dBd2rHp4NTWwtqZwP0Dv2fnBO4VBp2RqRNP7sGzbiZc1Xrt4g+Ehy5fBSWPRT6nj4juhOlmFPGJ2uVWk7UVy/jhOQHazmoNjUcpHCkAd2TFdMMHl8XbwRAqdHXRTiPJRtY5G39rIMq32Zxro0Gp+iUP70AgmFk2CCMUMMh02yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=giUKUhBYntedOl5q1o9whvK6/j70rzkKkD5H0JXFu+s=;
 b=maO5qAE7NYXGN7Xg4sAPAk/RvM6KhTP+f0o03Crpgsmo8gd3VoTxMrJLT8WE7KEXsZbcBuhB749nAXcphVUDn0Kkrhc5LjmaKFQ9040pXapI7fATZAousQGgvxvDZ6Ja/6uELC0AKg7zzulJ116OeWgFO4SzUbKtbvGnLVMm5dbQV9iKpgvamY/EWl1zKLw5bRyjyKeYc4GO3DwySmwfCzF/u8HtSpSDn3xHtSLiUQ4Us6PLOxnGr8lV4Uvx5859azC89BtRPH/K+QvX1nDEsyFYhH0vYo7H59hM2K3ZNjK3NxDajsAqBRpdW9al8BPavJAeGn7DeS42cmBkR9YTpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=giUKUhBYntedOl5q1o9whvK6/j70rzkKkD5H0JXFu+s=;
 b=S5bIzelsb/1tqbG62iE1mcQFivAPrJF7GVRlu/GRqI3raoTcBP1emqs8IFU11FNiWztqoiyYtADs+QZpaEpp+DTfsgv+rVwoGJ/g4JeSzrhKtf69kHFHdZaQ1V/3iiGDw6N7Vht7RZ+z6JPXVnqxp+Zk37EaVk3zJ1TIoJOUt/OgVGvXglJsMSgIjtwWwreWurG3NBOZmZatOt/wL8ZZ+JLRE8nqsamwytVclfdusXV2aJ+khJuNlEPGLiDqpECfCK6YV9XAmymzKLo7VHBk9dzfTzaPS/liudJdD4+FkxTW5tG8jZGQBeHqiRUqCioQwey/2AjofkedpUM5iK/6CA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PAWP189MB2572.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:35a::16)
 by GV4P189MB3559.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2bb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 12:56:59 +0000
Received: from PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 ([fe80::5da2:7509:7be5:d74f]) by PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 ([fe80::5da2:7509:7be5:d74f%6]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 12:56:59 +0000
From: Benhur Tessele <benhur.tessele@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Randy MacLeod <Randy.MacLeod@windriver.com>,
	Benhur Tessele <benhur.tessele@est.tech>
Subject: [PATCH 0/2] rust: add rust-analyzer support
Date: Thu,  1 Oct 2026 14:56:28 +0200
Message-ID: <20261001125630.760962-1-benhur.tessele@est.tech>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BE1P281CA0233.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::18) To PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:35a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAWP189MB2572:EE_|GV4P189MB3559:EE_
X-MS-Office365-Filtering-Correlation-Id: 15141cf9-ab5e-426b-03e3-08df1fbb7b3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|6133799003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	t6Es8GbJttS2O6dBOIMOH+AmBVkeAc8bsiZeKG95YZYKBiz2LPy5FTRSZ/ffflERM1eNGS+IbLGNEahwWFRObLbH3pjnla1ucElLvYlGIvylNlc3aXe0nQffu5C38zycU/ItuqOKMJ4qJRwJas1YIFghXGRNrIZ9y9TBv0euaZH1j8Ke0zjIo92dx77aTGaMrx3jTj8rBbPbXpXj1xvr24at+sINf1larCEZH+lTrbSlDiCLDQiO5Yt+kdmACKuWZxKly41pIfN6KnlpJZkTUNZ8w0FXpCVu7BknsWDAV73vvIJnjn5cGGjFMRY4uqTMhwfMrySouByrD4rrOxXBJPPPyM/Wwpci6poLqANPszGBxrnDFo77mHDYyZmW+CLM4Rm6Og+GFM148TKlyF68gSeFw4GxeYz163bH9f44qIiAp3w7jrMiO5WsiPpsDbAj9hDs/1OnwNnYTzjyoU08lFIGrPD+Do+vc0eoun5IAIqrQH1xcMmjpaP4lcfpHlsTigh9SI7+2NMTBUFuQ/vHwaSdB5wv2MYhlHdYc664wgdd4TNwyTYVOQT/P4eKtX3DVn4Weje9/NN6xYJ0H7oLYLqbCrvIlOWaalN2X2G+eHdBGBXrWrvkdWhiBc99AW5dWj61YJsWC2BS2pjwmUN552tcizcX1fHlEuUbBkaKbSQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWP189MB2572.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(6133799003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hWJlApitYbJ4Hcwbix1CYERKsb/b9mFXq50YwhMEgFMPO2g28aZnEzhky4P5?=
 =?us-ascii?Q?pkLlyV+6KZ/IpnrlRgNrseY6QWQ6sNX6URvdFHOeqiKV/bPrSfCcNfTQ0axM?=
 =?us-ascii?Q?NSfM2T8kTJtfP+j5SVCkkiYBIJjtlHfXYXyoTg3LLcITbISII5IrcUZBqv1x?=
 =?us-ascii?Q?QXF7dcf+F/UdvnBA1cwtLiI/pWu8vprXXUZ9CWcbu2GX/AOZ/bJrd8PGqCzE?=
 =?us-ascii?Q?bGDL0ofURkQj0K2+BobWpKXma8KX29NxAVwOBfl0IYBDBPij4gIYQeyCtziy?=
 =?us-ascii?Q?uexhAfhiBbT8xHBX8IgXLVAw85h5ylA+17XGACr1yDasLKB//1hj/biqYA3B?=
 =?us-ascii?Q?K1q7FyaSOENaqz31sYlicZleMY1HZZJ+GTuOWRb3ieE7c4LjpaJ/LjWwm2XV?=
 =?us-ascii?Q?KmDo/V248iVNOYORq+PhTVcCKRXJTAsgd7YFNEtaTm88axwU6grgyMyZp+qV?=
 =?us-ascii?Q?6R6zWmhWyu7JkJD3t4gGSq4HFXw5DdsYR4E3tujMirZcv4JjWkNBoRkj6dM2?=
 =?us-ascii?Q?Ppmrpy1J6zv3vnAkzrM7hdf/YS9BUcVm0T2NSFog89WYN6KlhGHnEg9h5GDI?=
 =?us-ascii?Q?Lp47+ZrCJD39RKEX8s7ER/2iw66d6EUpa/hWO/T5oKdBwwIR2kL8lcOctJ7e?=
 =?us-ascii?Q?5yxG/HmKnh9CgDffVX2vFcL2auMh6Tndv+esjqaQXgYyCc8i2X2v8Ai5YXZV?=
 =?us-ascii?Q?c/fubgBJwrdqDzBMXAs4Q0sWqtY0dMS0j8J2moZBCSwRKGbKcHX9JNfZN04W?=
 =?us-ascii?Q?nHY7K5NtTiawqTQcH5+5PjzTUfmEmwhAG4v6myCArQ6Ae7PYm0j/iHWh7oor?=
 =?us-ascii?Q?tdmS1oQDy7iUW5VgO4lPNjdzikBtl95OXYwt3aoMd1jPpLQxZaqdiEfHmCeg?=
 =?us-ascii?Q?uHcN+3N64pU3zPQGR/CMyW+LRFWBOH4QlaVyo0QAIWhq/0tCVCNCJBVHp08R?=
 =?us-ascii?Q?LeMqlT1Jget1r+c4ehKkNPoQ9sRKEvZc6PJUw5Ui7NQLUl4qd1OW0yq4tnQF?=
 =?us-ascii?Q?S66dihvcYTjh8egObw98htq10j7U6FET8IZUQTZ2rwo5ecvQIZsKiJOfP6+3?=
 =?us-ascii?Q?2xeG4/ICVuGuoM73a+4ZlGEZEyHw6jjMcMfB+87GpzEl/MiTwBqkst1j+OjC?=
 =?us-ascii?Q?NGMWcbs6p50TCOLi9RwIgSt1VbuoFPAIcz7/0rSjRC6ZWwtxjTnm6qzAnfJU?=
 =?us-ascii?Q?vGNXa8or3kXShpXSC2g5rnv/op3RXbwadmjwq6MQC7jiEMjARzKMiSmgk21z?=
 =?us-ascii?Q?TZp8h7dabVBJn9bBpfyO0P9jCTuI4n3S0JVv4phAy9RoC9OfjWttdwU5YckM?=
 =?us-ascii?Q?fBYMRha7SOZVEDCXHqJ+Aao5+Mhlq/KMa0vCVNc+KIqQ+nJdCr7vq5ezP2Ge?=
 =?us-ascii?Q?ekjzoa1enAs4rI5hh/ciiY6yPF0cuyQl2293l/Jg2knQkUObOnD/ktwo2P+y?=
 =?us-ascii?Q?avqlPuUuAm7igwAhylr1kgxNTVbyzPylYz/VT3M4OmZQojEnPvwGl+ZWIhvY?=
 =?us-ascii?Q?5u5bifLvHeUgDUZZG9ezCsoCb/9hBXuRdOXx2zQyzgdLRtVqji6CymUUW3X6?=
 =?us-ascii?Q?jWmkpibjZQ/+ibSIG+xHFg5UvUXf/1E0y9jrRcy9Z7vqTaA6CYn5TuqnSKRI?=
 =?us-ascii?Q?EfNh/4o9b8xEhFqxyCNWvfaes/yN1iCUk2uJ02CJcEVfa4ejUFOVDj0+QsGf?=
 =?us-ascii?Q?bJzW/LjQsShJxEjpNTM8xlh63vRMHVek93QPUAo2rSc8bqfA8lXO0rF63AOn?=
 =?us-ascii?Q?+KVPcghuLg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 15141cf9-ab5e-426b-03e3-08df1fbb7b3d
X-MS-Exchange-CrossTenant-AuthSource: PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:56:59.7706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A7nWNDOtlmABhhPNIl82ZN4ccEopkXhesAtu+4UpbvY+BEc6em+0/qSkZ0Fiqbi4VN6WqUZyLxu/i0DftxUvxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3559
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 12:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247032

rust-analyzer is built as part of the Rust tools but was neither
installed nor packaged. This series packages it and wires it into the
Rust SDK next to clippy and rustfmt.

Patch 1 adds a rust-tools-analyzer package for the target and nativesdk
variants. Beyond the frontend binary it also ships the proc-macro server
and depends on the standard library sources, both of which are required
for rust-analyzer to actually function.

Patch 2 adds it to the cross-canadian toolchain so that an SDK built with
SDK_FEATURES =3D "rust" provides rust-analyzer out of the box.

Testing:
 - Patches validated with patchset.
 - Built an SDK with SDK_FEATURES =3D "rust", installed it in a container,
   and confirmed rust-analyzer resolves the standard library and expands
   proc-macros end to end: diagnostics/analysis-stats on a crate using a
   derive macro succeed, with the proc-macro server started from
   <sysroot>/libexec.
 - Built core-image-minimal with rust-tools-analyzer installed, booted it
   under qemu, and confirmed the rust-analyzer frontend and the
   rust-analyzer-proc-macro-srv binary are present with their libraries
   resolving.

Benhur Tessele (2):
  rust: package rust-analyzer as rust-tools-analyzer
  packagegroup-rust-cross-canadian: add rust-analyzer to the SDK

 .../packagegroup-rust-cross-canadian.bb       |  1 +
 meta/recipes-devtools/rust/rust_1.98.1.bb     | 19 ++++++++++++++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

--=20
2.43.0


