Return-Path: <jst@mbs-solutions.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D68FC021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 06:44:47 +0000 (UTC)
Received: from FR6P281CU001.outbound.protection.outlook.com (FR6P281CU001.outbound.protection.outlook.com [52.101.171.110])
 by mx.groups.io with SMTP id smtpd.web10.5334.1740638683920104777
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 22:44:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mbs-solutions.de header.s=selector1 header.b=aDvVeEgu;
 spf=pass (domain: mbs-solutions.de, ip: 52.101.171.110, mailfrom: jst@mbs-solutions.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DixCNtNbLxU7CFavS8R1FO/I8OkcjWNtqeZ+aqnoDeJjYQzyxzlocnuejfiTmifpHeRd38tAXSP+Pyi2Z16Kop634tCtfyxlipFp6u2RyUQUG6k6YYV46BolCgOlq4YqZGX7pHJlKesLvmMAcqQTkgToyT50C8kuiKmSOdAb50AOWMu0jwKjzRADtMUnNnXVkTX71XHzoio0MyEqV1ar2Kv1h41V2JNghl2NnprlghJo7rudnF5aKTWIEpuZh/1WxJP/RDbuS7Ed8R0MsBGceLN0IOfn0MrJTwCz3tVSYO9OcplYMwSJeqjtWP4npQkgNjJ0cFhBcDRbO+SwvSSsiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQLNqwl0OTKfuw5ToS7Tbk7Cv42MhXmdZnReozKF1QE=;
 b=F1SbzXun/03BmkwlQ4zzD4U0Vc4fkKu5GHwFqIEXIR7whIUqzSjj2HyG8GwugrV0s8wnSFfJ3qBJt08lLjZTbrW5dacKxJxUNdlRwUbzutWQSOVA1JwbE+B6e++ACGuShBjLo09GTkgND0iQQQ5tcxImDey6KP6if2MOR9Z8cEV1SKBCge/Ja6j433AT4Kh327IB1BE4z1yd2chZ1WlsuA+lGrqPIt4JZnQThmTntWLQqElMPyiuU17SMGLgc3FmRra/3PQfZBrmZmmmGUx4dncJ2pI0jXDBmoKcAWjhE7sm3+eq68Q3LyLRGY1W6FYxC5YXDQ/57n36f/VwTLK7jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mbs-solutions.de; dmarc=pass action=none
 header.from=mbs-solutions.de; dkim=pass header.d=mbs-solutions.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mbs-solutions.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQLNqwl0OTKfuw5ToS7Tbk7Cv42MhXmdZnReozKF1QE=;
 b=aDvVeEguc7Rh0VRYhirJdjVzXpdJMLimoFXgKJVYQp92foEES5hLAQjrXWM738p8Jo19x894POOVkJqv/ECE++6MKlDJe0J/tPYL/dQVC2qj5uAUJpiqMvl5dp+PPzYMHohYvBcUP/gbaHv0A9vg1OkS1goIObHtx0pwqFhuNTalNOGzSam/giFq/RlHtMi5D1g5MHwL5BG6aQHGub+nkXTTiwaNCLadzu2GWaYzniWJ5gAhqrCYwuCLlQqjQrY/PxIorfY11CbolSWRRTDsrCkqA52u4NIb201sN8/J8RgWsuoPy2p5MKHNQgRXcZmGO5Cl9b/gAS4bYK3KojGsKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mbs-solutions.de;
Received: from FR3P281MB2526.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:5d::10)
 by FR0P281MB1824.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:27::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Thu, 27 Feb
 2025 06:44:40 +0000
Received: from FR3P281MB2526.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ee50:92ee:3a15:6a91]) by FR3P281MB2526.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ee50:92ee:3a15:6a91%5]) with mapi id 15.20.8489.021; Thu, 27 Feb 2025
 06:44:40 +0000
From: =?UTF-8?q?Jan=20Strater-B=C3=BCddefeld?= <jst@mbs-solutions.de>
To: openembedded-core@lists.openembedded.org
CC: richard.purdie@linuxfoundation.org,
	=?UTF-8?q?Jan=20Strater-B=C3=BCddefeld?= <jst@mbs-solutions.de>
Subject: [PATCH] cargo: remove LD_LIBRARY_PATH wrapper
Date: Thu, 27 Feb 2025 07:44:10 +0100
Message-ID: <20250227064410.49465-1-jst@mbs-solutions.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <1710ee6e-1ebb-4f15-bd5d-9c995b109e99@mbs-solutions.de>
References: <1710ee6e-1ebb-4f15-bd5d-9c995b109e99@mbs-solutions.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR5P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::14) To FR3P281MB2526.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:5d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR3P281MB2526:EE_|FR0P281MB1824:EE_
X-MS-Office365-Filtering-Correlation-Id: 38d85fd2-fd71-4135-e5bc-08dd56fa35b5
X-ETR: Bypass spam filtering for authenticated sender 'mbs-solutions.de'
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?p6TJUJhNvZQU6/HgSKPtu/bcTqz0K1JOpUp3ufyDPEDn+JHG8n2409mLMt6x?=
 =?us-ascii?Q?bOLjHsCP1pk86RguPa2tvAAs8Qgb/tBO7rv3+mMcWUTOZzRK/65MUGW1R2Ep?=
 =?us-ascii?Q?W9CYHQSrSNbZ1lWJUeLQrBeQUtdcwpxkVxM8nAWsUQXuQXfJR16lXAmjASmJ?=
 =?us-ascii?Q?xP+O6ypxyL1P86jk+IwwAgMyGNZixkdz/3pHfdVf+EurpV+CoYKgQBuGF1JN?=
 =?us-ascii?Q?hio9OzB13vp1F6KCOPuK/XwTiLLDKkN9hK0LXJE+g6q066tZWaE5vMkU32uI?=
 =?us-ascii?Q?iJL6XT1UsLHMKdzvWcc8T7KzkhWVYKqfO4TmG5+zKakV9IJECmEYru53CUkP?=
 =?us-ascii?Q?noWS8JNoHVqhO3GHhK2NuXjE4Mri+D9MWyNxvWBUeYROVwBAPHeDdch9NIX6?=
 =?us-ascii?Q?LWo78Xy+simE5BrZpa3F394gZLvL2GRXMI0v0z4bul0DArVCbUcw5nScRGI/?=
 =?us-ascii?Q?qFZJyw1WBeXh1sjNX8xPevzxRQeVuonbB4uIcxLRsywlltKHZifXD09GPL+U?=
 =?us-ascii?Q?4P7tW9ib0YCE0HckyKZRDQ6fAGtLbCYcJocLmI0HkH9jowrtZriYzJ+MOfwT?=
 =?us-ascii?Q?bYZOMiIRJMvOh8rxww81+q8hCYaz//2zonH7SkAI/WppqL7y/Ktny1efG7Th?=
 =?us-ascii?Q?2PS6IdVb56mKJpIeYg4L3ILQ5JvtfvPEv0XZXcFxu/vtVVXM/kQLekDrgU+p?=
 =?us-ascii?Q?lGGh6cNptIdDIBz012ggrshpOXJYb/HEa/WKn0U7waLHsHuMLHo5XrJ2mxV2?=
 =?us-ascii?Q?XxnqdmO6mzyaKqxN+yk7iw0mc4Qfnoqdp+a6tvZuRc6C6ipQdbsUE0Iq1M8i?=
 =?us-ascii?Q?fP05wKF+ip9Hy8okP5cQtU4CZvu0A4fq+jgo67/eIbFjtglgONMrGaLyjfG3?=
 =?us-ascii?Q?55corUr/f+XhuNrA6YWAr6n8g44e8AREi6cRNfdl1PlRI8fM3Dx65cQbScLL?=
 =?us-ascii?Q?8p83JPCvMRJr7qdT70ree8kx5hTNZmC7ys+NdhQ6Qphc31vJJszkfTKxS8Lj?=
 =?us-ascii?Q?RZVMVOFWvHA4IWXPsmXciq9uRx2bRFZQxnjh8nyP785OwmjqrsWubob6elsU?=
 =?us-ascii?Q?n9DZxHecVX+uJ2f+CpAU147G+5t0R2IE22o4ykmLYxlXc1v4M0zdFN4861hV?=
 =?us-ascii?Q?Aa7u0S2Q8injMDeZlySgP6GvAe+K9WcQSQAAbJvj4r07sTwdSzAWJxIWDiVL?=
 =?us-ascii?Q?X1vgi15CaV9oV9t6oH1sI2w41LWchMDOAJQy8Il/5vLAP560ZYf1A0cbbkkV?=
 =?us-ascii?Q?Y/sJg2v8uSIAYWH6KLG0TYHNhMFlHVNMOcpuBUbfXXqcj5jsceK2wHdjWEqH?=
 =?us-ascii?Q?Yo3QJwkRp191lbSO2l8IKHr23+dAE41Ogpwvj8uZiyDfLp1IjST9RXE4PtLT?=
 =?us-ascii?Q?u7i+2EoFAv1x2LUEjN2d+cdrEeRLYTh3Smr+rRonubXwCl8HklR28vms8p/U?=
 =?us-ascii?Q?ZDBLyL5xOk1k2lTKoMrL3skxYsa6tU/3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR3P281MB2526.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?syGSti+duR9eULVmVWKS1BOyGvfNgld4F/wkmmtC9WCJ753yp0IftnZAI5Bk?=
 =?us-ascii?Q?8cEvb/uLntU9YYHGasIR/bbbJAly7KTxsfZbIYM8Or/+3r6kM72VOa9o//Sf?=
 =?us-ascii?Q?EukOjARMfItlQxI3xxGM6uWRMj9u1JaKUsf/ufrSwj66rtYxBMVgVebI6hmF?=
 =?us-ascii?Q?TDoG/Ch8WJ33i2Wma4ArCLH11XfgI8IIbl52UprYihNhf5lVWFSvJ8LD1LsV?=
 =?us-ascii?Q?LAoev7RQjgTkIbu8880c4GUiomGFo8NwmeyxMprMj75aOH1V6JrGVDbfU0SQ?=
 =?us-ascii?Q?Llwo9aqNOnyRqjDWI8OtFQfdlvc9pKPyzxbSgbybeINAVCZqbWHE9obzcRi5?=
 =?us-ascii?Q?JmArbebQ4Sz1rLr1i1QjlCrBqXhtKztC2kLJB4xawa5avrAEaHNIpCZ3vCmD?=
 =?us-ascii?Q?pPltqixzk/U6oMfrgnCkILOzVHu89MLWyy9e5CyiXHLwpK9s8bIyMusNb6s7?=
 =?us-ascii?Q?XhDqOJJWwD/VHUtN949H6LHWmBmQHQ0Yu7Vw4/y2qFGe0OH8B1YhDZKW/0g9?=
 =?us-ascii?Q?nvw6pje1G+irg6CL2eEeDzJkGZFC/ylJvdBtSueNYTYUwNp5lrb/9At+Y80G?=
 =?us-ascii?Q?koMQhmfvkQVudCP2+rVV8RWPCTO1PoL2XYU5+j9GUMrSGoJj14K8g97DgTz6?=
 =?us-ascii?Q?02UITUSIKelKFyXzT6jhUeA88+yXW73KwccJuNcwHRAUFWbIvxxEYpJU6lXU?=
 =?us-ascii?Q?4tKKTLrULH/fD1cShfKcSJ2D1DWaILNTm1hp6LG2jgVOvbAIOTCWhVzXiYSg?=
 =?us-ascii?Q?lva2P+KQqsVvBcc5bkmm1SBwRXn4xVhPtUDMIJ3mh7I1SnaSqyRyEcuC3Ijb?=
 =?us-ascii?Q?Jwzv5PG7WRgXpsw1ahaAg4+REJdov9XgL+nt/N0VkxZ8Chm3s57n7kNj9/mF?=
 =?us-ascii?Q?XwuhIsgN480IeE0EbCJEx5utD0osydOEXctSbBizS+lkIWH1XTO+OUyJBbmO?=
 =?us-ascii?Q?Srx6C6we513NV1vexEy7tB8OeT0euD+4S6MRKg8o3XEKtZ1zrCIuc8xABf1Q?=
 =?us-ascii?Q?qkR/Pkt1mP7lTXIqyeacajRBNpXbajui9VFWTcY4agXHwe7jKKku9YskiDqr?=
 =?us-ascii?Q?H6Y7zmhrptIWzHeGFOFV6G71fJUiIsdIk7Ny29SkJ18KBzqciYQ5Klnjl2kb?=
 =?us-ascii?Q?saNTsv/e9WUkKFPlkq7Id5nWl6fhaZ331zPoo5BAvl3cSYQa8OZy2GXGB+It?=
 =?us-ascii?Q?gLJPgC/J/+rMtP8NVS5lRfHBFTRfMa4GmCx9WgDiYLA2d+PcWrkw0uR20+y3?=
 =?us-ascii?Q?wMJJM3meu1p5VX6RARC7zEzBMyhc7u5agXVdfc/tW+I+0kZZnp1xZTIpDeSI?=
 =?us-ascii?Q?SxeW1+XYqGRbjCyfHR7tPTpI6uzBKYMyMfubAfdyZ/1jGXOBjs65OL2SPSXi?=
 =?us-ascii?Q?KNLBrcmYu2cCs1LQTiY+8uicaLhFQT9esIbCyrLY0+4bdWtHTxx7OmEli1fB?=
 =?us-ascii?Q?uiJYQD8gcNp24caHzTOYPfzjF7haULNorx933NwLBCe8LOKfCx1rt2y/k+ZL?=
 =?us-ascii?Q?RwxmpbvgvVk7LysLEEUzlEMZgQ9B0f1aAxpUNoxKO2Q0KzacCZJ8SZ1KDorS?=
 =?us-ascii?Q?17EAjoZiS6bcjD6Bgvq6OhYL6xrH0RcIKhdi2hgO?=
X-OriginatorOrg: mbs-solutions.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d85fd2-fd71-4135-e5bc-08dd56fa35b5
X-MS-Exchange-CrossTenant-AuthSource: FR3P281MB2526.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 06:44:40.0692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 778c8b78-467e-4379-adca-743b91174c8a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71FnNUwz8ol+j29h87ltHbzIxnJHlLDNICBQMzvI6qcMIqTlhvCKn06LP03slqEZLOYwpbu2h3d+rKfqMA73Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR0P281MB1824
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 06:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211979

Fixes [YOCTO #15579]
Fixes [YOCTO #15735]

This commit removes the LD_LIBRARY_PATH wrapper around 'cargo'.
Setting the LD_LIBRARY_PATH causes many problems.
Some build scripts will not run because the build scripts execute
binaries from the host system that are not compatible with the target
libraries.
Even a simple 'cargo help build' will probably fail because it uses
'less' internally, which should not be linked against the target
libraries.

This will break some commands like 'cargo test' and 'cargo run' for some
hosts that have the target libraries located in base_libdir, see commit
388e7cac9f90e79ce8c3c1683d8ee0f4df1bc907.
Originally, this wrapper was added for the host system tumbleweed-ty-3.
I don't know if 'cargo' on the current version of this host still fails
without the wrapper.
If so, one would have to set the LD_LIBRARY_PATH manually.
This tradeoff is acceptable because the wrapper causes more problems
than it solves.

A current working workaround without this commit would be to always use
'cargo.real' instead of 'cargo', which can lead to confusion.

I was not able to use testsdk because it already failed on master.

Signed-off-by: Jan Strater-B=C3=BCddefeld <jst@mbs-solutions.de>
---
 meta/recipes-devtools/rust/cargo_1.82.0.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-devtools/rust/cargo_1.82.0.bb b/meta/recipes-devt=
ools/rust/cargo_1.82.0.bb
index db18ecfda9..05ecc32ae6 100644
--- a/meta/recipes-devtools/rust/cargo_1.82.0.bb
+++ b/meta/recipes-devtools/rust/cargo_1.82.0.bb
@@ -45,12 +45,6 @@ do_install () {
 }
=20
 do_install:append:class-nativesdk() {
-	# To quote the cargo docs, "Cargo also sets the dynamic library path when=
 compiling
-	# and running binaries with commands like `cargo run` and `cargo test`". =
Sadly it
-	# sets to libdir but not base_libdir leading to symbol mismatches dependi=
ng on the
-	# host OS. Fully set LD_LIBRARY_PATH to contain both to avoid this.
-	create_wrapper ${D}/${bindir}/cargo LD_LIBRARY_PATH=3D${libdir}:${base_li=
bdir}
-=09
 	ENV_SETUP_DIR=3D${D}${base_prefix}/environment-setup.d
 	mkdir "${ENV_SETUP_DIR}"
 	CARGO_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/cargo.sh"
--=20
2.45.2


