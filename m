Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.53])
 by mx.groups.io with SMTP id smtpd.web09.6360.1617959024029435624
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Apr 2021 02:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OHNYoobo;
 spf=pass (domain: windriver.com, ip: 40.107.220.53, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=go6Q4IXgEqgZnNTsA1d2YRnV27TPC1LT9/yeW8djA/JscLLNgGNo5QjuC/tdAINAc6jcisziHPLS6YcPUVIdRDuNj3XCUb9GMN2DeJvMpMDfOknKqfzrNlIoG5IzEEHuQfrd1c82VQuwBglhI1kptDxgaHdF2JTCysrc4a/Y2Mr5jNwUCMb/ePwo9D+3G9NxSTdOgbgSi4yGBv6Mlqt/22o637Vic7B/e54rm5Txds0c+M46+fgB2ap+TiLWVFs/kS6Lghp5qlydQ3ToS9fPRsilFe7JXruKMFn/86V9uUgT2yDdntVyuR7gGMkC7LbYJrVW98WS6RYveBYSoxzMLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnJGIlvMDC2BNV0zLmcCST3p1RG+WE0Bk+eE8zBuvoQ=;
 b=c52NuSgJHO7z1iu/aCyQc/QGLtr6cQPZGdi8x6vKebvpUYaTeZbpmmlCnJFPxfbJpQxdSGrt1epWybBSsfH39x7tlfugqOgFOkQlqZhLGdhCchTfascsK3L5ww9p1F3mICDLVDsWHM54xITdApGEQstEd4FTUQdDLAaa51AVkMMyZB3FKX/6lPtdTJ8bAQIT+nyGIx9pmQvCqF+DiANekaomGY8Ix8bGuHWD5US5HTxMKIdoVMjyGVQEv8906dBzZsRQS2+SkjuPjudNFlaoSUtvf6ztuHMmNLfTQfGdFzg+QZQeaeH/SibGL5ws4CFyYc/c35cv9FJlTaRkIWHdsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnJGIlvMDC2BNV0zLmcCST3p1RG+WE0Bk+eE8zBuvoQ=;
 b=OHNYooboRdG0DB/pxcdW01w42CpIugTAGyOAvkpoLgMc5L++Dldzx/uUgT8bvHC7nUi4OUT51jO4R/ao3XOpViFGedai8obDmHoDRnO9ZZwIDDStI0TpBooBhjLx7z5rAAt7ExrYGEsRbVw7yuMh/SXHGugIc2k06GBv94DRfHw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CH2PR11MB4246.namprd11.prod.outlook.com (2603:10b6:610:40::17)
 by CH0PR11MB5282.namprd11.prod.outlook.com (2603:10b6:610:bd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Fri, 9 Apr
 2021 09:03:42 +0000
Received: from CH2PR11MB4246.namprd11.prod.outlook.com
 ([fe80::2137:b1a3:9cfe:d6e7]) by CH2PR11MB4246.namprd11.prod.outlook.com
 ([fe80::2137:b1a3:9cfe:d6e7%5]) with mapi id 15.20.3999.032; Fri, 9 Apr 2021
 09:03:42 +0000
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] parselogs: ignore floppy error on qemu-system-x86 at boot stage
Date: Fri,  9 Apr 2021 17:03:29 +0800
Message-ID: <20210409090329.3177554-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0071.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::35) To CH2PR11MB4246.namprd11.prod.outlook.com
 (2603:10b6:610:40::17)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HK0PR01CA0071.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend Transport; Fri, 9 Apr 2021 09:03:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbf97114-f1ed-43f9-edb6-08d8fb365f34
X-MS-TrafficTypeDiagnostic: CH0PR11MB5282:
X-Microsoft-Antispam-PRVS: 
	<CH0PR11MB5282241B3991B6F2E89FC380E4739@CH0PR11MB5282.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hFaeGeq3vH8tOvpPKxSexwJSl7ifC+8JRnvKLAAdMEQK9SYP8fU8NlJtNe9AQ5g2NwvF0rpL0K0pazMzGE2TxDnjW66vueii22M0LxVJO5M05dDAIBrv2i8zV9G90kWUjlWoJ2gcAanlF2Qdq8S6N1rR9oR8q2jF8hyUv6nVJIG+Whk+Wvp0C6hSUBjywVCpG8hAVcK8d3Wo5B3xwk9QAFXHLlO/nmwnleCvqDejFR51lnuDCYUIWOeD7cl66+GePvqvhqnup5b1l6vkHgaThCrdu9PVk69Qr1V7KH7PapGqrkT8wlXrpchpCITfMXvPFaFdo3hQnTOGpgYzbd3vYoc/ronU605PryxOC3Pbk9ZXbIk2FfCfv9TPQISUVWhqb+wCEXdruprBXPH743nEtCZf7Rm1uyq//ynAW/DTLc1E8AAC/A8N9ntdWwgvP48HiAOtDTYW1ZN1J8WtsE/ewBpGSYCXfKImj/IJSJkfzuQAWfqjyPjQztD8t+KHdc0LaHbbSrtJvu2648ARuHPoRzNMnv5EIFMZdIRlsRi5fcvn5r//J8Y8NCKwBVTSEJZ6MBiMNqKgBctOxlIWU0t1DOH/l8/cCWbdhFiA+P2WsQEK+7anAci5y3z7VtiGU+FxGJL3WUD9HEeG5sGS/VlxD410ehR9AlDBcdI/PqF5HJCqtm9SpY9UruVug0xIpbij4NZVSasx46tnCBhfuTVe4Ua91egvxOmRkomQnPqo4a/SHcuWJwuyQNUWB8UaPovY
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR11MB4246.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(396003)(136003)(39850400004)(6506007)(38350700001)(66556008)(966005)(6666004)(9686003)(66476007)(2616005)(6512007)(52116002)(66946007)(8936002)(8676002)(86362001)(6916009)(956004)(478600001)(186003)(2906002)(316002)(38100700001)(6486002)(1076003)(83380400001)(16526019)(5660300002)(36756003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?phKQRksnKtX7Ugqtt9v9BbIWNvqD/7BpCWL2DmWiahs2TgLyinCPTLoEZndu?=
 =?us-ascii?Q?LvutO9xDfXF7DIi3uoH6YwNV/p5oT3/X8E0SH86ijutx76QzAUhUw3SAf3qx?=
 =?us-ascii?Q?uSUemR/48d+9sINYuahdnOZ6eEpTP9B0njCCsEdxMSVhVw1942TBMBqIalMW?=
 =?us-ascii?Q?kLMRh5NVGGer41TAr6TFbaNbE18YmHmCHw7M5Gddmx7+S3z3oTn8yunFLMhK?=
 =?us-ascii?Q?ollFslm+BoNBEIik10K2pCGnzUmNnJx4DXTAZy0ohYWttUFrLaVK/+prY3sm?=
 =?us-ascii?Q?RjMDVQeh7viqEqyMeNlK+1qg6XaY4o2A8bQ+vYcPdbjQTSsux4ODj7AHfGIM?=
 =?us-ascii?Q?UHkuTEvCEuHzRsTR9jbYofAADe4BMhttobG5Wfa+xGNMlwvfClT41w0WAPMy?=
 =?us-ascii?Q?6YxfBsq8uABZ8k3OB5MPvpOi7p7fNJOfK2pJIPblosAYafVqK4tRqF/wcRaQ?=
 =?us-ascii?Q?Nc2QrgSQpNo8QQkbIyFWaX3vzVPU2PelM8VH4X8e2wSFqgsVISFURqdVniIA?=
 =?us-ascii?Q?6/wKHIUEHWEnoHFKhNPN/l7RrVz3X0bUvsyp5GgFqbeD2e0qVmioS9doZ2ny?=
 =?us-ascii?Q?mw1BE6Q0+dJGKNWdi+gcStovkdCC1OwhNUqv4e+JEWsWKzW0KhhxGeCC66ql?=
 =?us-ascii?Q?5gi3M98NdEC2/bxvFKinSXuXitjvSTJiSDlSNnb41m+D0O/9GESTl4oiH4Ah?=
 =?us-ascii?Q?5i14DPkVHs4jloRut+gkNhh9HeongGs/J2iK92oDZjX/0qN3AlpchhXvnXeA?=
 =?us-ascii?Q?LlzktpijgXTnXS8BsWCiEQoUCoylqYvBXGFkT0oe8ICYn0LmU27z0IWdoC4+?=
 =?us-ascii?Q?4+Ca5wKa+8lxqhvxTR0lfPzS/4z/tQGz+qESPUSZGMCljHOAEGfHNhGmYNjd?=
 =?us-ascii?Q?5gBjE/nh+YeWJ7cwqNYhPE+Jqq008kGba9jHPWMXViBMnKr0Vx5xV5YR8q/p?=
 =?us-ascii?Q?MrBMRswzRo64QcLG1i0+Ebx30vlFnzEtcHviHt1mjVQpYphP/SthEhah1Bxn?=
 =?us-ascii?Q?zVI3ZeCQ4Odwwt1LGTSVjEvY33VT3/UcKI1SvroA60oXuJmaGiSJGjWMljHU?=
 =?us-ascii?Q?nPmGioJLp+02xzaRTvd4rIPNFmWGqwjyBgzbw2G9kwZIBczYORfEZCSU36fu?=
 =?us-ascii?Q?F70QyqlQf47EpqQqNvnAu6KB/wwAqwhYpyPWqyH/uV7u34X7ee9ayxGipODo?=
 =?us-ascii?Q?O1+qp7gdp5Xx93/x0i3wt5LQNavUtBeob6uDhlzrw6P3mNleAJBdd75776Uq?=
 =?us-ascii?Q?fGaaqI7pnrZaCVCxYWneLw2pRy+OfKR4SzqNojMxaLIBLehChBQdMbeNqu/3?=
 =?us-ascii?Q?f8GwLejRbcNIvK+Zj+Lh0sHu?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf97114-f1ed-43f9-edb6-08d8fb365f34
X-MS-Exchange-CrossTenant-AuthSource: CH2PR11MB4246.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 09:03:42.1022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5EX+nyrByZ/hRL7jB4z5Q6LMqCxK9xf3JPVEQ6yKKI0A3e3sfZEeBaXSvbKobrChE1FFmowuS0C03tqSLuI4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5282
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Yanfei Xu <yanfei.xu@windriver.com>

We can disable floppy drive by BIOS on a hardware, but an empty floppy
drive is connected by default on qemu-system-x86. Linux usually detect
the device and modprode the matched floppy.ko at the boot stage. Due to
we don't specify a floppy deivce in qemu boot arguments, then the errors
about floppy reading comes out.

It is harmless and normal, so we could ignore this error message on
qemux86.

https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg01402.html

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runti=
me/cases/parselogs.py
index 4714741aff..1bb0425521 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -88,6 +88,8 @@ qemux86_common =3D [
     'tsc: HPET/PMTIMER calibration failed',
     "modeset(0): Failed to initialize the DRI2 extension",
     "glamor initialization failed",
+    "blk_update_request: I/O error, dev fd0, sector 0 op 0x0:(READ)",
+    "floppy: error",
 ] + common_errors
=20
 ignore_errors =3D {
--=20
2.27.0

