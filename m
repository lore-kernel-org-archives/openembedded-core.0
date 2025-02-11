Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CE4C021B8
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:15 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.137])
 by mx.groups.io with SMTP id smtpd.web11.1143.1739286064813401053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:01:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=zAI5GEY6;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.137, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NucbVqxIUOs4IQExcILbIVdNCD8TLUxglzxzY4Jf6bOxiZkB3xEHbXuIUoa1Oo7LmcNPmMfe/YqzuQotDOIH6V13rpaBQa0AF9EzttnxfpI0w71Q58bbiyXP6FAF4mqD8paAHUYScY2j3gkCH3wBfIBq9Qjg897JJDIXZWDQRojivV1FBqowp7U6NeTzIwj3kZxstsx6tUyNW7Roxw8w5gjQlauwFg59VakqSBYRL1C+/1V2/MUNJxywFf8nCJR/4vrZ7KbBHLtqvucbc5YMWPtnJv+LgQzE6HESlMVDXdeasr2NCEwYZOnVaJfd9ERJs5SWg/a6hBrlM1MiPvMhKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytSG7gwpnEooTI6mEPraE8SYJ9vkYk+9DXA4SrQA2P4=;
 b=CMoYJs6HUwi2Tu8zFOGtrS93VDf4WlihVCgZhIuTL1gDmqm14OXPEelmG1XFt8YmkMUBMg1+Q70TNUbsrUFe7aL7b6Nem+Q5E14fWxkZWYAACB4jfH8Cijd+dAzcPYj/Ju6Xz4zFUsYzRvzUvU2+UJfX8hI5ROCgEwQROF11plpbY1NSWbwPqx7iW/GTYtoVqgLpHVy61o0+Z/1JQW5UEEY56me9q8bskZJSW4EAf/MnFcviv87e278ncjdMFhy3c/MmeQwHEEzGWf8IE3LcIn7tLfYVhVCPXbrpQHwrO5ZIezqciUFihTv7Llhe3twz2lLOYW+iIB1bf0SF1XBEmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytSG7gwpnEooTI6mEPraE8SYJ9vkYk+9DXA4SrQA2P4=;
 b=zAI5GEY6EanaiOhSPZuGdOlv2UpB6kAobYGePnWsYnKvIel0RWUpnsRaSv6u4s1Z6Cd2Wc9zzGYaOHxclpzcRmuFtpBCieZmCH0WtYadbAUBZJOww1CyDOfchB9LVo1DkQZVtgco9lMNkDfPSWiuUvM2N5ZU2BVbchGPUaf8a7u8dG96dGjUafVviJMeGL5hpPYikPHmPkfFJHclAahZxzixLMVbG1ALie4/Hh2lmZaqIgTno6Sr3BYT9iitPi+pJRsJnpAv0irkyfPHaDHunPgKyoA4s3mhBGRGXkTB0DlyxcY+1LDhy7iRiEckt451XhEoD77xIrwv3ai+/Qd0VQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by AM7PR08MB5399.eurprd08.prod.outlook.com (2603:10a6:20b:104::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 15:01:05 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:01:05 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 26/30] librsvg: update dependecies to fix RUSTSEC-2024-0421
Date: Tue, 11 Feb 2025 16:00:30 +0100
Message-ID: <20250211150034.18696-26-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|AM7PR08MB5399:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b49011a-385b-4cf3-3aa0-08dd4aace4a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NnvFZ5DNyR+AMf0QA1kCZva/ySHJe9c1n6yiVeSIJ49zyceymGMuOeUILboa?=
 =?us-ascii?Q?8n6Znf0gk+gFJDMt/IUjoytB1DQUlexVFR+B6pdwWxHQyOzI+4GzRNTHzErC?=
 =?us-ascii?Q?jE6WYhIH5Evb9wv9Y1cX53C8DpThjguTEW5UDRGBhcrIRaeknsK7zhD2ZJZv?=
 =?us-ascii?Q?1gioeovR+WLYJ/E3UfPL5L0w59PEu4FAxJ0IJ0aMeggPKa/Nrl6PnepP6nIL?=
 =?us-ascii?Q?GzlNm1cnkEE28ryo2lVW00hx2xke40TQFXcZoltFJVrCHyblMMyUN/DYImjh?=
 =?us-ascii?Q?npCgUWWT0gYufnlj8jCm1u2/LGpreqSJOvbHUVuG4zibPO6K/myJuc8sBeZs?=
 =?us-ascii?Q?bAH1pazwlnPAK+g/MDouTak5Y1/peDBhabJAS4NZZatWrWLKrkSyUo82H6rs?=
 =?us-ascii?Q?xlDv69duAh3ZSWsmk3ecZ2HXQGaOYHYhhqW3c3SzkVNtSfJ4pl7gOYrvWyPg?=
 =?us-ascii?Q?rk5Wpr6FYVtE8J357HatSVPEgsZoukFPTwAfOl/tIFClUxkb+BGIqb2OWxZi?=
 =?us-ascii?Q?MhhAJjds3jkKiz1MmVElu0slVOM5zVl4LnBJBqX6UfMALYOLv84iryky9ty1?=
 =?us-ascii?Q?NlHuBL0l+ahq3sHxkFq0EQxfFcQ5kZO5Vtz5mnYf0RHByrylP8DhHzGWlPZQ?=
 =?us-ascii?Q?3v7cz1o6nf4KPZCoYNMoQLeyDGhsQD3OsRosQNpu4yoSNdtF5+YhKnm0LMR4?=
 =?us-ascii?Q?Z+8cGYjSmUvK8JoVVhyMZMSYojRs5tpRPPmZiyuDOHjioGwmEAfyEWSEQzOt?=
 =?us-ascii?Q?IOa/Mli6AdIhYJEqK6QpR5OifFOyKvKkvLCvGn0j5dTC89Pvg5xyAWVrL5et?=
 =?us-ascii?Q?N/avxHU+NSP6yv1ab+K4HJuuByaKc3F+6xmeLwpu1u+JXK1bIoOtTRQjqqRK?=
 =?us-ascii?Q?l5YZn8RIGoibrpCTrLQuJgGewURMCISDS6EcJKyyyWp9DzsYblbMOrWvE7kf?=
 =?us-ascii?Q?Wu6KpHjm+rt5MiceIuxl1i1LMH/NVr48cnWaors041bVyWpvqDHdAEZba/2h?=
 =?us-ascii?Q?PeaTO7/51Wz8R+mGBLaEFzK+oRdbxdhb5/97ieGmYhqQNi8l/Gc5cV6ldIw7?=
 =?us-ascii?Q?8Tk84mo2tmcJ5g4AVSfBoXu09NGFQq+80k3HPSV/55r8XuvZZZDyQnlf83zF?=
 =?us-ascii?Q?FJtz5gqRrD1LeFuoPUZMiTJ/Q1OsTYS6Zx9A/FsagIh1Ct+WeDK4aRh1ZCF3?=
 =?us-ascii?Q?phAqDtEcmBtGxB64cCkGj+WHKf+Yb2CdUfsDRm5iaSNX1SIzoGimZr8TSSGN?=
 =?us-ascii?Q?FtExUAnnry4W9KhJyyPJLiRP+bpzmC6Z8xr7m/E+zqyctwgf9DMoGbIEpiMc?=
 =?us-ascii?Q?WdJUYhkQfRQSd9Q/Z9f1Yn/HVi4T93y7HAFhaNUVLJKb2I21Y1nIDOXuK4P8?=
 =?us-ascii?Q?cF7B5LREXLB7y5k2pN1QbGPqqMGQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3NGvydwRmY2aedHle5JgJTr/AXqANNRpcHYN6kK+1qcTzqJXwamZ54vsBzuL?=
 =?us-ascii?Q?sQmLwrFlM0/XT2EdJn6BxWVUUQQ9NrwBojexeab4OXUoWPeGMF+ViPRx/vV9?=
 =?us-ascii?Q?WtcF1ZILFWhel/HFvTVZeONLr3ub2YvCFLJeUooKr2PYf8a5Ps3rlkEqwFE+?=
 =?us-ascii?Q?G2ZpHm3jDat/TPhVdB6Hr1TpcPP3Q9eSTVSIARIAg5AgA+yLWHWoALVQC2Th?=
 =?us-ascii?Q?FiPuA4qBhbeBbhdtuIcTUXC69SSv5qZ/tpnYRL+v7VU3zKWL2Dfz6pk4/9tK?=
 =?us-ascii?Q?/d8/cwvA1qiiKPSC5hNm41h9CobSbh4Dj34ExDXxqRXjrwXZ6K1FmmO3K6ye?=
 =?us-ascii?Q?74b/pbkq8IV0qVnPfp29YuLGwBZjqW/iricGeanVUQ2g1BSxwEirDkuEWNPA?=
 =?us-ascii?Q?1SDHsa1eM4hL7Td8oq747twjz+xGuPkXvmVK7jdGoi3LLkFX4K8E3rrqOHqX?=
 =?us-ascii?Q?4t3hbG5Qhxuy4yUxwiuzjmFKI93mkOmR7r46aHcJbZPFfajS6NhJgVAnoLMr?=
 =?us-ascii?Q?wIgOKegwC/bh0TMUkXwqtVvib833ow/lm3go1k+cJOhOtzinVoXms596Kgvl?=
 =?us-ascii?Q?xjtM4a+tEQE4shEyzSHKyYRqWmyGAqnDEU7Uzh6ezNhH3uo7iV0zx7fr3PXF?=
 =?us-ascii?Q?IsafdZSdfGIUvpTr1do3M/ihYxxNjBFhaRfidKVF/ZHM51HQYy4AzNJEDZqc?=
 =?us-ascii?Q?odLKUNKEgv7lUdfsGXVLduM1EbhGe673gD2v4u/NfNpfyv7y2FFu6bJQS0kF?=
 =?us-ascii?Q?73vy8DLTxiKHHHg4R05HnPp879oIjQJxdwmrRTVvS+sd4Azvem6ZTJE3BmuX?=
 =?us-ascii?Q?f00YMJmxggsuxzca7j+wedycftCrcFzBgO0fjItfLfr7548vorsmceSX9j0R?=
 =?us-ascii?Q?b9k+JHTMCZynPAoHxhfQauogd8ySEXasVr3e2YMylcZlj0qVYkQlEtqjgpUn?=
 =?us-ascii?Q?AR1f79FbfnSRmFpr+BrRmaBDp3tAcqxTrARf1L8mxnp06EsU8ztwYql6DXii?=
 =?us-ascii?Q?dmZSQYY5/Tkt5ystAXbeVFvyz6joeV5FPC80BDz6PDBbUYSKFNLBGJfd+Q9u?=
 =?us-ascii?Q?16egxjyMYWAKkSxzcOn4BgTMG4j/l7+hVR0eXe0xtupoZIfIrezz7g91BsQT?=
 =?us-ascii?Q?yDE0id0EVPG9gewBPeHSR+lr7IiDPLdJi0+dsk8TzGgNLfiJz0r8V5ojFi8w?=
 =?us-ascii?Q?oH1Xz9arRe/VwwEevgQroB1jrqOEWmy1XrHKOxDvp9pvafQ0Yy52p1M+4ARJ?=
 =?us-ascii?Q?fvIS0vrreAwft83jv3z98dojgTdeiI8YvzWK9vFRhklrForSN2DxT9XVuOhC?=
 =?us-ascii?Q?hhGATGuJbwBdQuMtr9jCdEDi5cOE1fa4flTuVBVMZyS/vYR6srSts86jk5WG?=
 =?us-ascii?Q?4IjQcDoUe9yCE3UXpH/FGX/Gby2DaNd2njUEeNtR2LWo4uyVQS+drQAQ5B+w?=
 =?us-ascii?Q?V6qDSBl0dniJZONoGDYqotFFjklfkMib/EKPLl+je6HSOdCq8hv13pJ/Vnns?=
 =?us-ascii?Q?ckbci78CAjvizSw9SqkPBOleRokYJuyMLlwYy9GXnkA8eWL8EETpXLdAZT0J?=
 =?us-ascii?Q?YXLooqM8X1OEAVPW/w9LML+OZdP04sF1nIo01mUSQpdUDZO11Wi8LjQduDp0?=
 =?us-ascii?Q?AQ=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b49011a-385b-4cf3-3aa0-08dd4aace4a3
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:00:58.8737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/cDhRaZm2WdzsuvUobEvdJV18/ZSjTB9WXmMgbQN/5tcWJefy+wnA97JO1Q3iSJ/qc3obYEOt3Rx+8/eHKeCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5399
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211151

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 ...-to-get-an-updated-idna-rustsec-2024.patch | 398 ++++++++++++++++++
 meta/recipes-gnome/librsvg/librsvg_2.59.2.bb  |   3 +-
 2 files changed, 400 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/0001-update-url-crat=
e-to-get-an-updated-idna-rustsec-2024.patch

diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-update-url-crate-to-ge=
t-an-updated-idna-rustsec-2024.patch b/meta/recipes-gnome/librsvg/librsvg/0=
001-update-url-crate-to-get-an-updated-idna-rustsec-2024.patch
new file mode 100644
index 0000000000..4f9796d0b9
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/0001-update-url-crate-to-get-an-up=
dated-idna-rustsec-2024.patch
@@ -0,0 +1,398 @@
+From aaaa6b68b024b2adbfdf5f8493dfce1f60e5e331 Mon Sep 17 00:00:00 2001
+From: Federico Mena Quintero <federico@gnome.org>
+Date: Mon, 9 Dec 2024 13:26:02 -0600
+Subject: [PATCH] Update url crate to get an updated idna, RUSTSEC-2024-042=
1
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+error[vulnerability]: `idna` accepts Punycode labels that do not produce a=
ny non-ASCII when decoded
+   =E2=94=8C=E2=94=80 /builds/GNOME/librsvg/Cargo.lock:99:1
+   =E2=94=82
+99 =E2=94=82 idna 0.5.0 registry+https://github.com/rust-lang/crates.io-in=
dex
+   =E2=94=82 =E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81 security=
 vulnerability detected
+   =E2=94=82
+   =E2=94=9C ID: RUSTSEC-2024-0421
+   =E2=94=9C Advisory: https://rustsec.org/advisories/RUSTSEC-2024-0421
+
+Part-of: <https://gitlab.gnome.org/GNOME/librsvg/-/merge_requests/1069>
+
+CVE: RUSTSEC-2024-0421
+
+Upstream-Status: Backport [https://github.com/GNOME/librsvg/commit/aaaa6b6=
8b024b2adbfdf5f8493dfce1f60e5e331]
+---
+ Cargo.lock | 285 +++++++++++++++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 264 insertions(+), 21 deletions(-)
+
+diff --git a/Cargo.lock b/Cargo.lock
+index 1ee688577..01c3bf550 100644
+--- a/Cargo.lock
++++ b/Cargo.lock
+@@ -588,6 +588,17 @@ dependencies =3D [
+  "crypto-common",
+ ]
+=20
++[[package]]
++name =3D "displaydoc"
++version =3D "0.2.5"
++source =3D "registry+https://github.com/rust-lang/crates.io-index"
++checksum =3D "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a=
20ae0"
++dependencies =3D [
++ "proc-macro2",
++ "quote",
++ "syn",
++]
++
+ [[package]]
+ name =3D "dlib"
+ version =3D "0.5.2"
+@@ -992,14 +1003,143 @@ dependencies =3D [
+  "cc",
+ ]
+=20
++[[package]]
++name =3D "icu_collections"
++version =3D "1.5.0"
++source =3D "registry+https://github.com/rust-lang/crates.io-index"
++checksum =3D "db2fa452206ebee18c4b5c2274dbf1de17008e874b4dc4f0aea9d01ca79=
e4526"
++dependencies =3D [
++ "displaydoc",
++ "yoke",
++ "zerofrom",
++ "zerovec",
++]
++
++[[package]]
++name =3D "icu_locid"
++version =3D "1.5.0"
++source =3D "registry+https://github.com/rust-lang/crates.io-index"
++checksum =3D "13acbb8371917fc971be86fc8057c41a64b521c184808a698c02acc242d=
bf637"
++dependencies =3D [
++ "displaydoc",
++ "litemap",
++ "tinystr",
++ "writeable",
++ "zerovec",
++]
++
++[[package]]
++name =3D "icu_locid_transform"
++version =3D "1.5.0"
++source =3D "registry+https://github.com/rust-lang/crates.io-index"
++checksum =3D "01d11ac35de8e40fdeda00d9e1e9d92525f3f9d887cdd7aa81d72759678=
8b54e"
++dependencies =3D [
++ "displaydoc",
++ "icu_locid",
++ "icu_locid_transform_data",
++ "icu_provider",
++ "tinystr",
++ "zerovec",
++]
++
++[[package]]
++name =3D "icu_locid_transform_data"
++version =3D "1.5.0"
++source =3D "registry+https://github.com/rust-lang/crates.io-index"
++checksum =3D "fdc8ff3388f852bede6b579ad4e978ab004f139284d7b28715f773507b9=
46f6e"
++
++[[package]]
++name =3D "icu_normalizer"
++version =3D "1.5.0"
++source =3D "registry+https://github.com/rust-lang/crates.io-index"
++checksum =3D "19ce3e0da2ec68599d193c93d088142efd7f9c5d6fc9b803774855747dc=
6a84f"
++dependencies =3D [
++ "displaydoc",
++ "icu_collections",
++ "icu_normalizer_data",
++ "icu_properties",
++ "icu_provider",
++ "smallvec",
++ "utf16_iter",
++ "utf8_iter",
++ "write16",
++ "zerovec",
++]
++
++[[package]]
++name =3D "icu_normalizer_data"
++version =3D "1.5.0"
++source =3D "registry+https://github.com/rust-lang/crates.io-index"
++checksum =3D "f8cafbf7aa791e9b22bec55a167906f9e1215fd475cd22adfcf660e03e9=
89516"
++
++[[package]]
++name =3D "icu_properties"
++version =3D "1.5.1"
++source =3D "registry+https://github.com/rust-lang/crates.io-index"
++checksum =3D "93d6020766cfc6302c15dbbc9c8778c37e62c14427cb7f6e601d849e092=
aeef5"
++dependencies =3D [
++ "displaydoc",
++ "icu_collections",
++ "icu_locid_transform",
++ "icu_properties_data",
++ "icu_provider",
++ "tinystr",
++ "zerovec",
++]
++
++[[package]]
++name =3D "icu_properties_data"
++version =3D "1.5.0"
++source =3D "registry+https://github.com/rust-lang/crates.io-index"
++checksum =3D "67a8effbc3dd3e4ba1afa8ad918d5684b8868b3b26500753effea8d2eed=
19569"
++
++[[package]]
++name =3D "icu_provider"
++version =3D "1.5.0"
++source =3D "registry+https://github.com/rust-lang/crates.io-index"
++checksum =3D "6ed421c8a8ef78d3e2dbc98a973be2f3770cb42b606e3ab18d6237c4dfd=
e68d9"
++dependencies =3D [
++ "displaydoc",
++ "icu_locid",
++ "icu_provider_macros",
++ "stable_deref_trait",
++ "tinystr",
++ "writeable",
++ "yoke",
++ "zerofrom",
++ "zerovec",
++]
++
++[[package]]
++name =3D "icu_provider_macros"
++version =3D "1.5.0"
++source =3D "registry+https://github.com/rust-lang/crates.io-index"
++checksum =3D "1ec89e9337638ecdc08744df490b221a7399bf8d164eb52a665454e60e0=
75ad6"
++dependencies =3D [
++ "proc-macro2",
++ "quote",
++ "syn",
++]
++
+ [[package]]
+ name =3D "idna"
+-version =3D "0.5.0"
++version =3D "1.0.3"
++source =3D "registry+https://github.com/rust-lang/crates.io-index"
++checksum =3D "686f825264d630750a544639377bae737628043f20d38bbc029e8f29ea9=
68a7e"
++dependencies =3D [
++ "idna_adapter",
++ "smallvec",
++ "utf8_iter",
++]
++
++[[package]]
++name =3D "idna_adapter"
++version =3D "1.2.0"
+ source =3D "registry+https://github.com/rust-lang/crates.io-index"
+-checksum =3D "634d9b1461af396cad843f47fdba5597a4f9e6ddd4bfb6ff5d85028c25c=
b12f6"
++checksum =3D "daca1df1c957320b2cf139ac61e7bd64fed304c5040df000a745aa1de3b=
4ef71"
+ dependencies =3D [
+- "unicode-bidi",
+- "unicode-normalization",
++ "icu_normalizer",
++ "icu_properties",
+ ]
+=20
+ [[package]]
+@@ -1229,6 +1369,12 @@ version =3D "0.4.14"
+ source =3D "registry+https://github.com/rust-lang/crates.io-index"
+ checksum =3D "78b3ae25bc7c8c38cec158d1f2757ee79e9b3740fbc7ccf0e59e4b08d79=
3fa89"
+=20
++[[package]]
++name =3D "litemap"
++version =3D "0.7.4"
++source =3D "registry+https://github.com/rust-lang/crates.io-index"
++checksum =3D "4ee93343901ab17bd981295f2cf0026d4ad018c7c31ba84549a4ddbb47a=
45104"
++
+ [[package]]
+ name =3D "locale_config"
+ version =3D "0.3.0"
+@@ -2258,6 +2404,17 @@ dependencies =3D [
+  "unicode-ident",
+ ]
+=20
++[[package]]
++name =3D "synstructure"
++version =3D "0.13.1"
++source =3D "registry+https://github.com/rust-lang/crates.io-index"
++checksum =3D "c8af7666ab7b6390ab78131fb5b0fce11d6b7a6951602017c35fa828007=
08971"
++dependencies =3D [
++ "proc-macro2",
++ "quote",
++ "syn",
++]
++
+ [[package]]
+ name =3D "system-deps"
+ version =3D "6.2.2"
+@@ -2371,6 +2528,16 @@ dependencies =3D [
+  "time-core",
+ ]
+=20
++[[package]]
++name =3D "tinystr"
++version =3D "0.7.6"
++source =3D "registry+https://github.com/rust-lang/crates.io-index"
++checksum =3D "9117f5d4db391c1cf6927e7bea3db74b9a1c1add8f7eda9ffd5364f40f5=
7b82f"
++dependencies =3D [
++ "displaydoc",
++ "zerovec",
++]
++
+ [[package]]
+ name =3D "tinytemplate"
+ version =3D "1.2.1"
+@@ -2453,32 +2620,17 @@ version =3D "0.1.4"
+ source =3D "registry+https://github.com/rust-lang/crates.io-index"
+ checksum =3D "eaea85b334db583fe3274d12b4cd1880032beab409c0d774be044d4480a=
b9a94"
+=20
+-[[package]]
+-name =3D "unicode-bidi"
+-version =3D "0.3.15"
+-source =3D "registry+https://github.com/rust-lang/crates.io-index"
+-checksum =3D "08f95100a766bf4f8f28f90d77e0a5461bbdb219042e7679bebe79004fe=
d8d75"
+-
+ [[package]]
+ name =3D "unicode-ident"
+ version =3D "1.0.12"
+ source =3D "registry+https://github.com/rust-lang/crates.io-index"
+ checksum =3D "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0=
fee4b"
+=20
+-[[package]]
+-name =3D "unicode-normalization"
+-version =3D "0.1.23"
+-source =3D "registry+https://github.com/rust-lang/crates.io-index"
+-checksum =3D "a56d1686db2308d901306f92a263857ef59ea39678a5458e7cb17f01415=
101f5"
+-dependencies =3D [
+- "tinyvec",
+-]
+-
+ [[package]]
+ name =3D "url"
+-version =3D "2.5.2"
++version =3D "2.5.4"
+ source =3D "registry+https://github.com/rust-lang/crates.io-index"
+-checksum =3D "22784dbdf76fdde8af1aeda5622b546b422b6fc585325248a2bf9f5e41e=
94d6c"
++checksum =3D "32f8b686cadd1473f4bd0117a5d28d36b1ade384ea9b5069a1c40aefed7=
fda60"
+ dependencies =3D [
+  "form_urlencoded",
+  "idna",
+@@ -2491,6 +2643,18 @@ version =3D "0.7.6"
+ source =3D "registry+https://github.com/rust-lang/crates.io-index"
+ checksum =3D "09cc8ee72d2a9becf2f2febe0205bbed8fc6615b7cb429ad062dc7b7ddd=
036a9"
+=20
++[[package]]
++name =3D "utf16_iter"
++version =3D "1.0.5"
++source =3D "registry+https://github.com/rust-lang/crates.io-index"
++checksum =3D "c8232dd3cdaed5356e0f716d285e4b40b932ac434100fe9b7e0e8e935b9=
e6246"
++
++[[package]]
++name =3D "utf8_iter"
++version =3D "1.0.4"
++source =3D "registry+https://github.com/rust-lang/crates.io-index"
++checksum =3D "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d5=
2b6be"
++
+ [[package]]
+ name =3D "utf8parse"
+ version =3D "0.2.2"
+@@ -2754,6 +2918,18 @@ dependencies =3D [
+  "memchr",
+ ]
+=20
++[[package]]
++name =3D "write16"
++version =3D "1.0.0"
++source =3D "registry+https://github.com/rust-lang/crates.io-index"
++checksum =3D "d1890f4022759daae28ed4fe62859b1236caebfc61ede2f63ed4e695f3f=
6d936"
++
++[[package]]
++name =3D "writeable"
++version =3D "0.5.5"
++source =3D "registry+https://github.com/rust-lang/crates.io-index"
++checksum =3D "1e9df38ee2d2c3c5948ea468a8406ff0db0b29ae1ffde1bcf20ef305bcc=
95c51"
++
+ [[package]]
+ name =3D "xml5ever"
+ version =3D "0.18.1"
+@@ -2776,6 +2952,30 @@ dependencies =3D [
+  "pkg-config",
+ ]
+=20
++[[package]]
++name =3D "yoke"
++version =3D "0.7.5"
++source =3D "registry+https://github.com/rust-lang/crates.io-index"
++checksum =3D "120e6aef9aa629e3d4f52dc8cc43a015c7724194c97dfaf45180d2daf2b=
77f40"
++dependencies =3D [
++ "serde",
++ "stable_deref_trait",
++ "yoke-derive",
++ "zerofrom",
++]
++
++[[package]]
++name =3D "yoke-derive"
++version =3D "0.7.5"
++source =3D "registry+https://github.com/rust-lang/crates.io-index"
++checksum =3D "2380878cad4ac9aac1e2435f3eb4020e8374b5f13c296cb75b4620ff8e2=
29154"
++dependencies =3D [
++ "proc-macro2",
++ "quote",
++ "syn",
++ "synstructure",
++]
++
+ [[package]]
+ name =3D "zerocopy"
+ version =3D "0.7.35"
+@@ -2797,6 +2997,49 @@ dependencies =3D [
+  "syn",
+ ]
+=20
++[[package]]
++name =3D "zerofrom"
++version =3D "0.1.5"
++source =3D "registry+https://github.com/rust-lang/crates.io-index"
++checksum =3D "cff3ee08c995dee1859d998dea82f7374f2826091dd9cd47def953cae44=
6cd2e"
++dependencies =3D [
++ "zerofrom-derive",
++]
++
++[[package]]
++name =3D "zerofrom-derive"
++version =3D "0.1.5"
++source =3D "registry+https://github.com/rust-lang/crates.io-index"
++checksum =3D "595eed982f7d355beb85837f651fa22e90b3c044842dc7f2c2842c086f2=
95808"
++dependencies =3D [
++ "proc-macro2",
++ "quote",
++ "syn",
++ "synstructure",
++]
++
++[[package]]
++name =3D "zerovec"
++version =3D "0.10.4"
++source =3D "registry+https://github.com/rust-lang/crates.io-index"
++checksum =3D "aa2b893d79df23bfb12d5461018d408ea19dfafe76c2c7ef6d4eba614f8=
ff079"
++dependencies =3D [
++ "yoke",
++ "zerofrom",
++ "zerovec-derive",
++]
++
++[[package]]
++name =3D "zerovec-derive"
++version =3D "0.10.3"
++source =3D "registry+https://github.com/rust-lang/crates.io-index"
++checksum =3D "6eafa6dfb17584ea3e2bd6e76e0cc15ad7af12b09abdd1ca55961bed9b1=
063c6"
++dependencies =3D [
++ "proc-macro2",
++ "quote",
++ "syn",
++]
++
+ [[package]]
+ name =3D "zune-core"
+ version =3D "0.4.12"
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb b/meta/recipes-gn=
ome/librsvg/librsvg_2.59.2.bb
index 2bd8f7bf2b..36aaaf20e8 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb
@@ -22,7 +22,8 @@ GIDOCGEN_MESON_ENABLE_FLAG =3D 'enabled'
 GIDOCGEN_MESON_DISABLE_FLAG =3D 'disabled'
=20
 SRC_URI +=3D "file://0001-meson.build-do-not-force-disable-introspection-a=
nd-v.patch \
-            file://0001-gdk-pixbuf-loader-meson.build-do-not-look-for-gdk-=
pi.patch"
+            file://0001-gdk-pixbuf-loader-meson.build-do-not-look-for-gdk-=
pi.patch \
+            file://0001-update-url-crate-to-get-an-updated-idna-rustsec-20=
24.patch;early=3D1"
 SRC_URI[archive.sha256sum] =3D "ecd293fb0cc338c170171bbc7bcfbea6725d041c95=
f31385dc935409933e4597"
=20
 UPSTREAM_CHECK_REGEX =3D "librsvg-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
--=20
2.39.5


