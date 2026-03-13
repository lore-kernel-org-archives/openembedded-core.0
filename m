Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E20F107BCC8
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 16:02:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19330.1773417721722003719
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 09:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=keyp/N7y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=753250496e=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DCSgJ1786872
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 09:02:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=FTfTOn3dt
	/DTO8aQscbMBgROdQ8pFm6msFytIuctU4Y=; b=keyp/N7yDp369yx5aNkDwHAUF
	Lf2M2QYHWfkLlJBLH0i2HfnxXMj+ATAOB/tZ3YHWkkML6dTSXg8Odk4Ktok59CeA
	CqF/RxwbQ+Ruh6oD3KVauRth0xIKwGIT9qXQAPiVQWUQHQ/OYuXGxqIlpdyUJPrI
	9WhvJN7Pz5uiI23vIx5aSJgwaiX5fiJynxsfoyrFGELHUjA0nXD+156Kt8/sNRGC
	duGlEUEmxS8VZH4n9QYL3vE0/BPlannqrwTM17JPKnKDNOQo5lfFj0KmScXuiyTB
	sFlhoBMSOqfpdjh+LnrS88/DInQmkINtv9JxIgv7S4yC7r4KQksa/xQAlcgjw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011052.outbound.protection.outlook.com [52.101.62.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6taapd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 09:02:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrqilD/s/rsSI5UH9ucZXfLsLQK+K0BuhWknK/us12q0V2KLaqXCr7HiXcc31My7jbP4Ua0V17gQ8W13ZfjFslF8SX2PkhT/1y4T2cUllz+4cXMhXNm+v4X2H9jn4h9phyWuaaefaaZuqdpm76CjxN26j7RU7LT9c7k9/D3OW7zo/i2hCc6hM69JNPhr7NQfK6RP2mnrbVASpt0wKi5wTsFk+grGYMqxxSTg6lq6HqnpxIYN3YGyLBkRpNnisoy6nJzP+4ATl5IsJizfQCAZNSbx+wnP5DWCFusqbDe50jnvoLoYuKGsFHfxBMPw4Hb1xd5/YrYSsVrRLQEtKbj1Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTfTOn3dt/DTO8aQscbMBgROdQ8pFm6msFytIuctU4Y=;
 b=P6ZNhaZLTAjArUH4LeqSlVwTJeIqwmVBSCf3Ae4uly/YHQG3t/s1ov3jUWg8H5fbdqsa6KAaYrH9cSemTLmpuXe9MAMNHLtsHT8cTfreL2zz06pK2+STLhIbK+SZAh96m0jdQA+7dZH1r6vG9PDSJWD1/ejnM1OaO6bSc7hYvnvG6tlIYaXI27gjvxTlgk3QLzUdPbP1rvVnj0rS4b94eKXCRtU/Xr5vOsZnGUgItl0EGdQuMKNJaauTv82Dz7Typ51qaubteFlBOsj92V9xeTlsRwLT2b9VXWRdbU23TFciYjEf37OinY4zLPV3FXEjx3JIS6T35XCliQhLiMhKBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Fri, 13 Mar
 2026 16:01:58 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.20.9723.008; Fri, 13 Mar 2026
 16:01:57 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alex@linutronix.de,
        Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
Subject: [PATCH] rust: enable dynamic LLVM linking by default
Date: Fri, 13 Mar 2026 09:01:33 -0700
Message-ID: <20260313160133.2347467-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0116.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::16) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH0PR11MB5925:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fbd45b6-1bb0-4a9f-cb8b-08de8119daad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	TaP9aqnRqFxxEivj4MtGGh+vTe6HE+9a5wJ4dVPKHK9JyYQBDIQwfnynZojJMMDdPGL5X4kxXGCso+uw4nqFJQqtmXOEkjeYk/t4DbJuoGMHZ+/OXlYt/Xv1Z19CXpilB8jJcF1Dvey4dOFRGXjkPHywJyvgwXNOAhVdi4TWpog2kvFBBHbUoM4ze06dm7hEpNuu3ZuhSXt6MU+0Po+0TuVjpbNoXnR+MtvmQwpsFQcXMwFZ82iIHL3bpxnZVRnFVN3PtaBv44FU9/ZqDFwNQLwY/1YLGRhBgycu6EktVS34rl4MuIkkgKEacY45wSAzqsGk2B3iQUNihZfzrbZCxf29d5ceofUjodhhaGw6AfOWs8pSHx2duVBdgl5yg/9lpzYXtlr05/8pKI0uYnq5NsDy+SlTKLep9axEaKozbGJ3SKuOyEWf8gxNbf7NU37C/5go/tglgoKUEF4EPsQv8YMhWwkuIAxcLsUuCmxK2sOY+XAnabUUICmXTFiLoBUqMy48bBZnav0MU8TcdSmHCvc6/k0QGp2tXpmh7+HnetxcCK2Ylx8tfwxTMUAmlw+JoNJCbBzK3ZJQ+D4TAekwBfxPchX8qSpf0II5TW3iUquVDG9q3tTvOHk5+LqxJlpE3h/H2bHVc6H3ZRsD3GAMA/d/O8l6aZaBr9O21gq26Aqiq3hwcptzkWzn1ERMeJsV0tKYI2mEnmbQZpUYKQVRG94TTyd7ebNJ14sOInGVlSj6XV9XFVoUizsLpEGTqunzs8RtXSaasO+dPAfPQy9MCVCDPhiGza0sW1iJIc95HkA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Db0MrUKcdrjL7gNZdumpw27HQNZZYcUYhT8CTMlaWjuY4wpOliv5QtzwCPxo?=
 =?us-ascii?Q?bi6MjAaLWGDal6QlP7Ob3MGiIZK+EU4R3+Epd3A53h+4w0FlAlXtLAcsUuLJ?=
 =?us-ascii?Q?SI3DB8/bPKzO3i82gkm4+5JdGp6nXsRic7Ut+6AN5vDJmTF4wIWxCJZR0WH0?=
 =?us-ascii?Q?KJJV3uMYZFjVnTgMcwt8iWxLnfqHHxy57ILkNg/AyCtt1q/522HyguI4/vQY?=
 =?us-ascii?Q?Fl8cpEqs1eSJYiV3ipkP9g29h/EYgyHMi601b6OQCNrsdO4HcpKYQYrG8x2i?=
 =?us-ascii?Q?nq6SjPeLeeRrWtU93Z/h53aqkRqmH0bnPsppUdrDmiwVVw9iGBcuOCYy4e6y?=
 =?us-ascii?Q?MWpcR8SpZEbfopHXRQL5dWNZ0GDh8+oJa1ZFZ6hEzbHCKhykAiMel/+D0A7S?=
 =?us-ascii?Q?gsBCvURwZc8he+EWFofDrYoiK9ANPqeNXLI21OnQ9y5uK+uH3ttaQ1TX42qC?=
 =?us-ascii?Q?1njI9EKRM/qsdXsWNlx4BSWeOwJ+j9RLzkhzCxcdyRT5NCJNbarTnPJV0GDK?=
 =?us-ascii?Q?6+kmeeMmn03qpeNu98Jp13WHGADlF0PhXHo+RhiRcEh60EfZ10Mobxv5Yj4y?=
 =?us-ascii?Q?/4AHE36vtsjOX/KqL7MB3qLgTJvwuR705TOzamq6YYNU8qxFJSV5ZoTOYHpD?=
 =?us-ascii?Q?mNBSKKdBMQRwp3eh35MJyzu4rP1/4zN7fNXV2utj+QaozL59v2M3a0NBQL/P?=
 =?us-ascii?Q?HPdx+88FrdwKzjoW+U/qeed0GvKJq5dkt/F+65GginTUUInX2/Hg1a0uGSI8?=
 =?us-ascii?Q?FUgAW4cDFnVu76oSGeboYlcgu/kmC7u5wRjq4Kye57J1cn5ErLI5UkpmBiq+?=
 =?us-ascii?Q?BKo+oVP4Ky/m+B9QZjEP8JH8AT2LNKOFhbDk3CggcwHDWcql75Sd72po/Wz8?=
 =?us-ascii?Q?CYc7tIeIa+FAR/V5wHpJJANKLJRyK4nhF/PA7lNU0/hABW7LyxEXvTmTTrr2?=
 =?us-ascii?Q?v5NEX/diw7z5EW3JOwpEIG/ZdyMFSuc4OHy/+5zw+hx3Xl1HE8oJ891z8P7i?=
 =?us-ascii?Q?jl9Fz0mBtdcAwdNS60KaAE/JSZ3vX8Jg1vUDHTEF/kmLyMmsrtVbmtLnhHfd?=
 =?us-ascii?Q?ZfAATwVGOL9skfAr6c8zmSyvdn4qiSYTyRgJnEPY9eq/pFrN0Lid2dkIxLAO?=
 =?us-ascii?Q?F2GX4N6Mfq39eSQatZNSyQI2XzvewX+u89ZstgzUDAQBV8yRKoFZNEoqD9VJ?=
 =?us-ascii?Q?FczbD4ge89kIQiyKZO8mflhAadq4z+UtA9UWLNVlLZmr+IedZNAfPWn45tbg?=
 =?us-ascii?Q?4DAMxPjoUtCfTIM1F5dRIMpLkc2W4krVcuKqGCBbQud1ydWe5FtkFBO/fomP?=
 =?us-ascii?Q?L4fXOBNFl9tkfp5u8NsTqllIY42LrYyi7YLSuONxSBQkI6W7vAKC5/o/D/Aw?=
 =?us-ascii?Q?wKIuyJhme5OA8MmWu+bQ7WwJJCOUtQnqlzlzrndtQYwe5APpZXKwjPAe6rjo?=
 =?us-ascii?Q?eQI6G/Z1KCapStp6neQ3h6t1waiMww/Nt2T5YoZHkgNMl82o0ZZ/4E2l4hqr?=
 =?us-ascii?Q?r+9ZSRfcOhMK0ntyTwnvB0nYLAJCPZF1/qeNitn2LQVNtCdQLlvshH4629A9?=
 =?us-ascii?Q?n9KTNB3OqR2yr3M6rEB9lErfRN3+2O+xuH9MeW5QEconXoA15B1uAIErfZzX?=
 =?us-ascii?Q?tpNngYQTTC53XqOyYKA+qCMrKAa7+oRD5veBA5df0ir6rqXXylD6hg4a24Wx?=
 =?us-ascii?Q?OCUYSc461YDitVedd8GIqO0eVxFtRTKGr+4ghEkRab02YzP6vZyyOw+FNJ/W?=
 =?us-ascii?Q?D0o7wtQvFzJVBHX27cB9iaFZHvsjxsY=3D?=
X-Exchange-RoutingPolicyChecked: 
	XAOLtuze7UW4TfoXBo2fYR5u0hdJ1v1Jawr8ndvLaxEjSQrk6vBNXUGH1aEj1MxrRcaDSWHGcNguB8UzY0ucHiTqrab6X3w/GQKhNWmUGmHYkDa0rLwkrEvoqmcIBrSxSwWSdEHOTzLOYw4OjHgPYYazDOLtFfW8UMYZYnQd4rUvs5KXvdep25Dtx08KojVUdnPeQf16d2xLudC17Oai1rXDni87dgO7c1cqvTJy5hN5aIXa4Tk1NbAxgv0MfeTc/lg4aVngaEfXcHChzCVLsGGrDQ1dHVNQB6XdlYLttjP7OER5hNfqzCVcBDZnpB3Yjn4/mJ70aSk87S/eONwJpQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fbd45b6-1bb0-4a9f-cb8b-08de8119daad
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:01:57.8550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5t52dSjuHxfFjAf4VHp6pytjf/wrcKUTEKAgZshLhbalT3+5PzVkDXF339fWPCfYT5NW9Q7P5I41kqr/gMkKBIoT1HeUrYVdFjRbgaai8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5925
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: bffHp9fGWNu3VQqmQfmk7GVhOqfwD2Xc
X-Authority-Analysis: v=2.4 cv=Cf8FJbrl c=1 sm=1 tr=0 ts=69b434f9 cx=c_pps
 a=9kClBOisnrQnHM/oUG6sgA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=pquwGFn7HtpGZ8bOCvcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: N3F2cyHKnHzCqeANAJiJ7MGxYgkS79oM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyOCBTYWx0ZWRfX3nOPshBBCB/h
 K5VncYHRWdWj+hVHx6YA7oD9rcMnQFC38sXSkW4MgxnX9zEFP2U9nGNkA6V/4nJTA6cjVD62xr5
 d4m8f/R9GmobJ3yvz3ndKJ5ef7DlxpFcyJ59ADpXs+GRiXx9l7Eo3SpHReSgMG0zu95Uows0pNd
 xndr1izOSCPZnSux9yIloLSfq8GhI3C+nihlN3FYPm+685+5ofK/LSYbD/8J64Y0ewaE9QtYzIf
 8ANpbs5w9fxGAmddMfKfGUb7DLSZ7JqvwUlrgL++8W0N7CJr+p6fcN7opcznpmkztqgX4wLtWOc
 WD2uYrUC7Ud936hdMxm+zhvRDoIVHLjtY+YYD4VOxmksf4k1yYJxbZQVu/6jpvZsdsckuaG671I
 RkseT7O+iidesxv7ZXsPTwJ8i/ReQsEOjuRMD6Fiq07fHMI3NZIaQE7Ze9QqH6j8MpuPP9q/hFi
 XuumbU2ob5OeEfWwxMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 16:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233062

From: Sunil Dora <sunilkumar.dora@windriver.com>

Fixes [YOCTO #16058]

Enable dynamic linking with LLVM (link-shared) for all rust variants
(native, nativesdk and target) via a PACKAGECONFIG option, enabled
by default. This prevents segmentation faults when reusing sstate
artifacts built with different host toolchains.

Update multilib library symlinking to include shared libraries and
adjust the rust selftest to install llvm so the dynamically linked
compiler can run correctly.

Suggested-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py      |  2 +-
 meta/recipes-devtools/rust/rust_1.94.0.bb | 10 ++++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 3ae1946e43..7614941661 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -47,7 +47,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
         bitbake("{} -c test_compile".format(recipe))
         builddir = get_bb_var("RUSTSRC", "rust")
         # build core-image-minimal with required packages
-        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp", "libzstd", "openssl"]
+        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp", "libzstd", "llvm", "openssl"]
         features = []
         features.append('IMAGE_FEATURES += "ssh-server-dropbear"')
         features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(default_installed_packages)))
diff --git a/meta/recipes-devtools/rust/rust_1.94.0.bb b/meta/recipes-devtools/rust/rust_1.94.0.bb
index 2be0bd8d89..0d34a312c0 100644
--- a/meta/recipes-devtools/rust/rust_1.94.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.94.0.bb
@@ -15,6 +15,9 @@ DEPENDS:append:class-nativesdk = " cargo-native rust-native"
 
 RDEPENDS:${PN}:append:class-target = " gcc g++ binutils"
 
+PACKAGECONFIG ??= "llvm-shared"
+PACKAGECONFIG[llvm-shared] = ",,,"
+
 # Otherwise we'll depend on what we provide
 INHIBIT_DEFAULT_RUST_DEPS:class-native = "1"
 # We don't need to depend on gcc-native because yocto assumes it exists
@@ -124,8 +127,7 @@ python do_configure() {
 
     # [llvm]
     config.add_section("llvm")
-    if d.getVar('PN') == "rust-native":
-        config.set("llvm", "link-shared", e(True))
+    config.set("llvm", "link-shared", e(bb.utils.contains('PACKAGECONFIG', 'llvm-shared', True, False, d)))
     config.set("llvm", "static-libstdcpp", e(False))
     config.set("llvm", "download-ci-llvm", e(False))
     if "llvm" in (d.getVar('TC_CXX_RUNTIME') or ""):
@@ -190,7 +192,7 @@ python do_configure() {
     bb.build.exec_func("setup_cargo_environment", d)
 }
 
-# llvm-config expects static libraries to be in the 'lib' directory rather than 'lib64' when
+# llvm-config expects static/dynamic libraries to be in the 'lib' directory rather than 'lib64' when
 # multilibs enabled. Since we are copying the natively built llvm-config into the target sysroot
 # and executing it there, it will default to searching in 'lib', as it is unaware of the 'lib64'
 # directory. To ensure llvm-config can locate the necessary libraries, create a symlink from 'lib'
@@ -207,7 +209,7 @@ do_compile:append:class-target() {
 
         # Only do per-file symlinking if lib is a real directory (not symlink)
         if [ -d "$lib_dir" ] && [ ! -L "$lib_dir" ]; then
-            for lib64_file in "${lib64_dir}"/libLLVM*.a; do
+            for lib64_file in "${lib64_dir}"/libLLVM*.a "${lib64_dir}"/libLLVM*.so*; do
                 if [ -e "$lib64_file" ]; then
                     lib_name=$(basename "${lib64_file}")
                     target_link="${lib_dir}/${lib_name}"
-- 
2.49.0


