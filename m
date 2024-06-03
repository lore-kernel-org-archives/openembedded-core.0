Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0578C25B76
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 14:46:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.85420.1717425975513493569
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 07:46:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=688417d902=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4535FSfU011273
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Jun 2024 07:46:15 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yg35f1kfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 07:46:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYlEzxqDkNBaSn1R9q194J+MgYg0il699x3OXSdBuNM9Q88YCD/4ukD+qmA84gvQ3W+mH7YtPP/JHrJxnVLf8k9p2jeHwFq3A4OR7J6WWncD6tRCMgcCXc9PbeFmx71Egm6lrHDvSFgUs0DbV3cUHFRofzBnWFHGhGg6AEv2kYWeGuPaYDHze3+f9SjSjH5g+giCrTDCEPBiMo05Z0QzQ6jZ9nh0PekdLpAfXVdUsF0kg84ZNTjbrikF1nhwf1FDYi/l0cUuSNgUvCHliCu0B4lwVgemTKSQc7i++sN1cFr3UhnZtdrxDcYwxyH2VuE/nk/0FOdSXkwzCGdSw004aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOb1OUY7zVWyQcHVRHI4ZEDrGMsAXCwXXA4fK+PyS00=;
 b=FcHcvcfb5nuBMkT3nKC/Qj/Bw4TVaVGYC5TclTSHxlRHbBg8AU/GKRFh2kiJg9Pp8A7HcTL0B2ubiv6eNy7CGIbC/rHlMkLiWhjp9l1h6Hz0W4sZVjGbV+Vp6oDPP8bZd8h+xvA7mmojstvY61cuOKADwqhmSeNvLFgfWdVLgjZfWq2dP+C9sAbdq5mjpYfd3FeHjJAzIeU0UkpftvSRa1rWeGHFV0J+KglmUNc2ysjM8W0/p/Lu136csKwdp97BlBpqVopRG4TDcUMyfzpo/enBfwb+iLKFYkyuh41Q4uZO4rzbelcuxWHtnvyP2qzkfF5G7Q8zVM3lE5kKRgkQuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB3063.namprd11.prod.outlook.com (2603:10b6:a03:89::11)
 by DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Mon, 3 Jun
 2024 14:46:10 +0000
Received: from BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::25e9:e6a:756e:dc99]) by BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::25e9:e6a:756e:dc99%5]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 14:46:10 +0000
From: sundeep.kokkonda@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
Subject: [PATCH] rust: rustdoc reproducibility - disable PGO
Date: Mon,  3 Jun 2024 07:45:45 -0700
Message-ID: <20240603144545.163535-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::9) To BYAPR11MB3063.namprd11.prod.outlook.com
 (2603:10b6:a03:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3063:EE_|DM6PR11MB4625:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bec23dc-9e2b-4147-a97c-08dc83dbe8b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|52116005|1800799015|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xhtPtcCB79TWy9rdFjkACE2XFWzzWY/VZXBP1Um0KBfENQMfvel4tQs8nhws?=
 =?us-ascii?Q?8MwwzpDMIuKJvKrPEBw4/WjWxAaZg+C84JFg9w8LDCu/3orHol4fILl2ihGE?=
 =?us-ascii?Q?1Gtj1Pnebkivk6W4OhxFJcgz5qqQeKgHarD9w85FTpbo8L4bbj5i+d2ye/wc?=
 =?us-ascii?Q?kOiU13Wsa6jKJon+O0xZ/y9hsak/J+bqnqgkSOMP+iRktc3PHoiCl0jpzZTe?=
 =?us-ascii?Q?F3gz6mvtvYV55qcqfmiLovnl+6FlKgR9Kt3BPDk9QGytLvcPgn96987mFG/B?=
 =?us-ascii?Q?MXbDlAVbXx0pwBR26oCIWN82Mp4ZlAehNiftKqox5079QLiNM2AoS6LtWKmM?=
 =?us-ascii?Q?AglDupz9QGOiiY/WLAIaCqgW5d5pT6+yq2tlV73iN18fcdzuvl06Sbz6JsYU?=
 =?us-ascii?Q?pKAZV3otaLU8/HIKdpxKCPOO5/iGeGCmhH5JpglHkq/ouIO+EVULzNh2vNUh?=
 =?us-ascii?Q?LS406binARgv9w6PBQ8DwS0Oow0yulaUZSzLaP1ln0Tp56WTMy+twbsh5xna?=
 =?us-ascii?Q?iOJWm5zrUb1SOMhjMlzQt6YMLzz0Kxx7Cw9bR7LEkApKIRS3CX1ZhMIZhD2E?=
 =?us-ascii?Q?fIkQCWCxpfnSaStRZ2dh9Y7BzQQVdcTujOoQnppyaacPAKMcS8uuOyn1YWWc?=
 =?us-ascii?Q?tHvO4K4kx4e/Uh/nnfmFYDQ/wyCREkAKSwBe/pI7SV6iDeJ4FWWkoJLWwhEd?=
 =?us-ascii?Q?OzTYCavPHQXArTESsHel/bymUBmn5JaqWGEp+iETDTHiQG/QZAQKhlbJIHZX?=
 =?us-ascii?Q?HcGXQPpMoBJy/hIvyKEb3vpLgOU0bCCvLV5I5UWw8owvrs217i2mKRnWAcn3?=
 =?us-ascii?Q?5F3oCdpfNloU5SanVZP0KluoS/f8iDNQsTmdM7xNDS2SLx6HqZqLVaog9nn8?=
 =?us-ascii?Q?FBraO25jKWa4GVvxF7NoijOpGW/hDgUlvI/b8wmfyvBNtXTNo5P3HeE9MYAi?=
 =?us-ascii?Q?EP4ljF3+yNtiiZFQLdMUq+6iRef/Rzuiy1Eg46GmJoUjO6SN/7csq430YKrJ?=
 =?us-ascii?Q?MkdAFNVFX84Dpj2wsKLlj1+uOzYDLpRMZyjNM462w6sy8BX+60HP53vRmo4U?=
 =?us-ascii?Q?G10ydR8tk5CUwFNyLV5vPGq6RFdsPMOKuuNldDQwP+mVyNlySCWd8+Dtl9Q6?=
 =?us-ascii?Q?LGNCjZpOlm0XAkx2wiFmjTII328H/Rd6pnlqm5AuyPZYhrCot17aEkVE6hPi?=
 =?us-ascii?Q?Y5TDHKOyr/0S0ipbklohVpBosabK0pkTRMUjZ2xf/W3YpjuERL+25nyxPaAx?=
 =?us-ascii?Q?Ura+ta6dls+6hnuVUDstKDyKoOxJMVSaUmDRrrK6XQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3063.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WcWiR07etyp8AFavk6HwgBLIfF0tcBMbEOAe9W/JSxYL/6pLBIIEN5L0MY/m?=
 =?us-ascii?Q?ZX1c1RSREU7LMXhJmsofJCmrFHviBUKndwMw/FMS1TNSFNy+jp5W4koY1PYD?=
 =?us-ascii?Q?ejmpCRKuLC8eztQ61D6EgtPWSnKMg79Rb6LuXJ8RRQGeSAYfQ/vF26lOgOBA?=
 =?us-ascii?Q?lHemkLUH500jhcx4yY1br1fL7IpJETN2TWnlFKKysjYTNEvO0WXR9NySDOzK?=
 =?us-ascii?Q?OG0OS27UaXS2KnloV3Ti67zaZRqhOPOCTB80xlhlCRyGTZwLPLVBV+zT0LpE?=
 =?us-ascii?Q?JdeEvPd1C6mytaCxBi3pabFUlOL26LBxve7Si/ZJ7jCjppCk/PeqR+iTX9v6?=
 =?us-ascii?Q?61csQY5+aY6osIOWLth05iobUsX5ZfCbZqsSwfdkt/HHrzIuIYiZ/QWSg60d?=
 =?us-ascii?Q?I4NEL2/3x+q5K+SVIzni5xGTNmSHJ7tsvbu8D51GKFkMHNto7MpAuQ+pNyB9?=
 =?us-ascii?Q?vUFPZxyLSPBJUEUgGJW34GL6YwT6WMzJYIRqi7pDQkOCB2GtOn8RGhaUyaMS?=
 =?us-ascii?Q?FzlJMoOA13iGSgpF58UWMe2hzyltI+bW7f8cGahi3T+rUD4jWzN0FaVf5Liq?=
 =?us-ascii?Q?PzjZAevdR7C3ErAIv7nkSd3hSIorLDAGH93Ui2eWQSmOI/sR3iCTD3olJja5?=
 =?us-ascii?Q?zy+aLjeb6j51jFPXESVuREyPrdpW9mGA5JBkWMyseBYhf9ez4SAINGv/t/Ym?=
 =?us-ascii?Q?dfw2XQFWuvrxOiAw0GoeL8hjkja8PbWUwIWBW+dJub5hXKlZEao+f3w0dpTj?=
 =?us-ascii?Q?inDRY+alzUbYq9XzA+eIGQmpEoQfh77BzSedWoo44o7qdS2YQfLajWXpFHwP?=
 =?us-ascii?Q?oCBmQz7aYX4Lje1f/RG7ph/FK1F2G9vljxETo7PgWQcvDKZkov98GCXziOBs?=
 =?us-ascii?Q?KZE6m4ETPN4UqLcG/UOfOKjwht8z9WPI22r1QewF1Vn3sWatbrmXMjhEnbjV?=
 =?us-ascii?Q?tzy5FEGtle9zeO2STFUhLuYtPQ78niZia9uciDrdHPNYDf4/iP4A5m97h0b4?=
 =?us-ascii?Q?5RGLRf4qcfOhr9vcI+rj3HWfeVfN8pVUjxJwdfauc1TlpiuO6XrxyLIWf/dg?=
 =?us-ascii?Q?MuLxDqJ9xBlPZ+q3fVqcxBFS+WJOvZT9VS1/42NYAf2aGzDJiMXa4CR+tMvJ?=
 =?us-ascii?Q?UUzjBAdSWCAhuYSyuJmXjaIPFyq3WS2z7uxa675UKZ7YeI1ReG8HtOlTi8hz?=
 =?us-ascii?Q?ni9ceSMcEtk2qHB7V9Jdog1Mkj57k2wc11uP6LAohye7QrAEDbWgoZItwVzE?=
 =?us-ascii?Q?LEU+rWZNPGWqhLs//LPUtUeU3sVUbwPmzBfAFBMRA15wFTNSOXrTFOdGw+52?=
 =?us-ascii?Q?Rj8vASCQiya3ETeHHC9tqX5O2EhEhFXinlQhJbYMgCaCA6CBHPc1HG2rj/Lh?=
 =?us-ascii?Q?QejvXAfEXWudUufnYUvAZaxLM54jeYdGt1GmHjRtYuY/IasM6+ALMjPL7G0W?=
 =?us-ascii?Q?Dxeytl9JzYvEphisgtjQee+z4eBpB9DDqz5evQPB6j/qrVlxLuLhie4/MY3z?=
 =?us-ascii?Q?hYV+COYMR8aELcbOFVD9bZ2SFYkR2kWVg7BtUK5nzL50Goon94FM0R/MXu7r?=
 =?us-ascii?Q?9pp/r7xDTDv03ahanBjlRRgHA8MBXZ3cF2wYppYFS1fPNLCGXDtFVBZAq4dr?=
 =?us-ascii?Q?NAukqXz8AzwRrQI74zvxeVM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bec23dc-9e2b-4147-a97c-08dc83dbe8b8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3063.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 14:46:10.6071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CN54QvxcYg6IEuC79Cqs4aQOgsAKVC1R32TVfAL82qmDYAYoscu0CunakvtgMLm8Mfyc6erKfDPQ5t+vLBUxBeEWzlIj5zfygspCRt0knu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4625
X-Proofpoint-GUID: YvhX2vzTu6Blztjtlf_bWh30PWOAMoNa
X-Proofpoint-ORIG-GUID: YvhX2vzTu6Blztjtlf_bWh30PWOAMoNa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_11,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=693 priorityscore=1501 adultscore=0 mlxscore=0 phishscore=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406030122
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 14:46:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200260

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

The rustdoc binaries are differed on their .llvm.<hash> suffixes between the builds.
This is a test patch to verify the PGO effect on rustdoc binaries. The issue discussion is here:
https://internals.rust-lang.org/t/rustdoc-binary-is-not-reproducible/20027

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 --
 meta/recipes-devtools/rust/rust_1.75.0.bb    | 4 ++++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 97a9c3da90..80e830136f 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -16,8 +16,6 @@ import os
 import datetime
 
 exclude_packages = [
-       'rust-rustdoc',
-       'rust-dbg'
 	]
 
 def is_excluded(package):
diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-devtools/rust/rust_1.75.0.bb
index c66c14cc5a..4caa5892e6 100644
--- a/meta/recipes-devtools/rust/rust_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
@@ -153,6 +153,10 @@ python do_configure() {
     rustc = d.getVar('RUSTC_BOOTSTRAP')
     config.set("build", "rustc", e(rustc))
 
+    # Support for the profiler runtime to generate e.g. coverage report,
+    # PGO etc.
+    config.set("build", "profiler", e(False))
+
     cargo = d.getVar('CARGO_BOOTSTRAP')
     config.set("build", "cargo", e(cargo))
 
-- 
2.43.0


