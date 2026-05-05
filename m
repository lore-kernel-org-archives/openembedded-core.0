Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B929CD343D
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 08:16:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34457.1777969009479391838
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 01:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gIdtMTLC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9585136d0c=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456iwN72251946
	for <openembedded-core@lists.openembedded.org>; Tue, 5 May 2026 01:16:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=L+NeXrG5IovVHRka6hpUpGInPexdVPpC/hv02txsztI=; b=
	gIdtMTLCC5DiXUgk+Kivpc1EOk1bch9phhouN50+If5cnP6tlV/0qEXPDChOGpr8
	FOiL6sZHBy5F3Q8uamCaMIQyV3pyxr4YE4zis2/+kYmOvQWwSo1c04WNGZt4SrzK
	o6xXWPGZ1BnUSxMmajA1545/4gozay/2RoaEEslC9obihePc/JtmyzjqmtbSfOVy
	8PjPMPe0qzP5h8uKMlO4JhpdIHdNbmllzyBlJ+7NSxIyo0UBRbhXRMYWhpczZ5Yw
	KlJpMIOQVoWgsveMD7/3dJJRZvCRm6Gjc/Vv8fc6y7w2DUQq6SZMTgK08IjseiYf
	OabEay5DmL9bNSTbpA4ZTA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011045.outbound.protection.outlook.com [52.101.52.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwchytwck-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 01:16:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YTM5Ext5kTMCbiJMRl5xxN+n4OV5NaXuTLxT7fdk3DcF+W4YLlKM7pcdSUcvvDTrwODwBtsvrg+ZcUMc5er335xfFHuIYbrMhpvcHgSRM68JCDqZbdlA7QI19ZdOgGfdCluAop+gbDEEpS7/IQGVC3h9JZTbkBdgOCwd7dtPYWqqw5qWrIktySDEqTg66/yFqxfRF/UHgXmXjXqlyD2vINJePNvxwygawEO0/wKmgc3YbXA2FC97UGKXHn/UcuHzoagUuNt/8vtPSEhWDSjqBOtSQeaE58iWL01Zn0juUtXUJYtlYimDd7v7kJI2irvaUHXyhMoe8o8nPCeAKoiFPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+NeXrG5IovVHRka6hpUpGInPexdVPpC/hv02txsztI=;
 b=DBQxQ6R0FyKZviC9XwEVUuE4AdgE9rvx13On/hNGQGUYUeIThTvIzuyC6IR73gSBPYf+kC5ZdUjEsrBX3s9Xzp6zd0/FME8BoLH7e7favm0T8jXk/V06trHORDB9D2M2vGytEMT0saHcXN9pKgM5zCmBM3LVpwRYTUWh7VRAaHDq8J+5xF3yGzzYldYhxE7ebCcBbdabGzOp+Q6pjXKBIbzZ/5D3kX/lyWzi1nLJnD9DeVjBk15nKggnbKEMNb8auhqRXXiJ5U2bOz4IjlWquafTMQHd/b8l8Rqm6pZHpG5B51E3DtnscrWd5s2xzD7Qc9078tuaDSpHqRAo6TEqPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by PH7PR11MB6698.namprd11.prod.outlook.com (2603:10b6:510:1ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 08:16:45 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 08:16:45 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com,
        mathieu.dubois-briand@bootlin.com
Subject: [PATCH 1/5 v5] clang-tools-extra: disable tests
Date: Tue,  5 May 2026 01:16:21 -0700
Message-ID: <20260505081625.849368-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260505081625.849368-1-Deepesh.Varatharajan@windriver.com>
References: <20260505081625.849368-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:254::22) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|PH7PR11MB6698:EE_
X-MS-Office365-Filtering-Correlation-Id: d92c42d7-7836-4495-1f07-08deaa7ea332
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	Bk54IKjY0VsA5WA35M4tIk8EWVq5ckbyp9iuv46kijFtJaStlaTkdfoizkp8tndBDXzFdPU+y9GlnBkE91cd0qtBUnRJszi3E/DsSK6tqmAuRe9SlFfm1H+YYgQWjZt6zGOi5VAHXwwCKtthgUfc9QO/ieIJG0m8zOY/arD9hDDBtHQEggN6exAQ5sJKYYwt+NO26rXCvUvtzLjPUu4mIK0W/+x6a4fBzaSiV9R4QvCPypJ0o6h5tK+SVGFCIl9T//bP1E0sT+U43TsWOtbQGFL9KNEFtb1IE565Yebp9ALiFHgQ5ngGp6vk07dGuD466f733pWFF+6mEGUcuE2fWYSigsbKP2lG1NUzvyqveEkKkEp2MQByCc8Rt7mX0QC28xDyFyx1dOVaVt6neAFvdgOf4mKG7Cl2wSpRInlubRsMQfMB3RY68iIFMwbIbyoh4u6Fua2ALr5r7mNiH12vUp0AVWb2zNjiwD/R9AzECf6y6l2sIQKNwyMwEPH92z+zhAExlgLRT7noIYGLphV4IOn5oxsteLglVRUaxce8RmSuEBTT2GdWkHhE6B3ROM02Qh/2Gc262LhUCXFaFeA+pBz0REQxGeaRf9xTuddjHYgHhJJQGdBPx2zL+utfQj/f6cCreosGOTnyHL1ECGdgM3jRakvsCqLg3fjrx72BGeERJiQajdBjmPqPYbcYmCLGkK7N3aqs0w5jFCO1HZeUBJ6YqY4PvYLy5SnKKVjdNgJG3rAElodfV79+L+Ycw2of
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Bngupg1OJt+InENlV+8879edfyWS8JHRaUEx6iVSMDGftXCRH5cC+OYQMEbm?=
 =?us-ascii?Q?bPtL2LdBaoRkd21BgxKnCpn9oCBSuDejJ+raWFm0pWzpqIrFRIB/c68MrsW1?=
 =?us-ascii?Q?Gs3RfYkOYsE3nvh0J7hCXABtXlBAvq5sxLm6dOsOPCn2enn0molffaN75gai?=
 =?us-ascii?Q?0nqHrJwEJPFd3JZjiQWVVFU7aBDRDIf3HTgYOmmdyIfi4XdoUfXhJGNIzMAL?=
 =?us-ascii?Q?E11dqavd8rjiZ9mzIm7jeZsUcBveBWrABYtn2p8RCPZbLc/k9TPr3iAx/x4F?=
 =?us-ascii?Q?1eV48jzm1J7EievmEBYRktF0lLgVTPSMUczjIrifl5vUO+krruLOiLvvDoBE?=
 =?us-ascii?Q?5w1ydfYDJQ4PJmLF9CzTM1R/vg95jDC9RLPXQxR8+KmZXiPKSoMpJT7ySdRD?=
 =?us-ascii?Q?FKc6sq1BVEQ0s6tjrfa6vHZ2DIHuFr/ad4pLqGqJtdowaED4MhWUJ5krjjzB?=
 =?us-ascii?Q?FtZvh7UoO7zrYVegvXx0wXdD6K4YZ8QFXK7VUPO1u28OFeFWbKm3gcH3C2iR?=
 =?us-ascii?Q?00Nqdio4FnqbxKmT3fT4z4Z821lQHQKtJ71t6aD94lNje3InQfB3z8Nh5AoP?=
 =?us-ascii?Q?AbzYwelbY2/KOlSdIpN4t12A38mdrbYDboq1Hv1HhYDzZl/5MDl/OVLkCU6G?=
 =?us-ascii?Q?Pwyt14e4LJsW8+6kTU6W+tiUVSeQ4IpYoVU6mj2FvMvWbscLFURhHiZSnkCi?=
 =?us-ascii?Q?Alqrf3CtObxFukdme4aujeBVK4qxPlQM2Bk4Zrs2h/t7577KJw1pw7eTALIa?=
 =?us-ascii?Q?6ilwkl4ZozJ/y95qlXLFxmoPLAkLvV5Yf8DlxySDaFGXEZBWCWKbxwBcRuv8?=
 =?us-ascii?Q?+qUqbYLwwnNsKSzDTIiOUZXZcLL/0ImCM6OSgWwN5bunQ40i20FrxS5c1ZEI?=
 =?us-ascii?Q?oOO7dMuzrdrAECAFE51JV75MLYG5A2oNleMZTpjHd3IB1R130GGC63XtfUSV?=
 =?us-ascii?Q?4kiwpB+jZVI9hQH80Z3NcSAqd1OflTAx3prfgUKJlq3+LwjuxKCT7GA1FgI7?=
 =?us-ascii?Q?sByiVw1u2HeqyFxPl5cGc7CxGA/SUTsY0irzqQfskCjOW56T6MPEXgh2P/wv?=
 =?us-ascii?Q?KrfuLI0tuFWDgI1oQvQUgVGfqWQ0JcGHAnZARPJAINFHcdkOmLn41HuNQiXk?=
 =?us-ascii?Q?nfbxAFE+W7xhj+mCSI1tdDXrDs/VeGAKgboFXlDYUxWeakhkLbyJDCuxRNCO?=
 =?us-ascii?Q?0rMyUw0nMntw/YZ4PBv6a9IiUUXRpsE5SKIBgQ+TVEPgnqsVgqI6c0N3jBHG?=
 =?us-ascii?Q?KmelbIFwoZbuCKwymFLC7X06DHN6j/NQbvmLsrpGh8dzQcrcq+jVIRfI4ngB?=
 =?us-ascii?Q?8VX8ilalQu+Mspn/f3UpVLTL1e6mpOUTm7GRISEplJBi38t2NZgHh5BS575r?=
 =?us-ascii?Q?XcWUYVbXYWo+dDMCLhl0Rtbn78DcJDfV7lOictqdy9/NCnlm7WsfGXVnEX1b?=
 =?us-ascii?Q?EEy/RS/lALdk5x8lkhu9F/HqXn/e4I7amJqHRAFI6jhZwxAyVqacVZsWn35b?=
 =?us-ascii?Q?xVb8SoaDXi0Dcj5BLeNDjvd9ZkkWcjWJV6FACVSPm5LpRnW11ATKLoaUTU4l?=
 =?us-ascii?Q?7qvGSQ5zofACaAQYi1Nl4WvO7I/8agnzdxiGMtSPymbJ3RyrND43H1Jxga7I?=
 =?us-ascii?Q?k6kPrAPM6Vbr1VMGo7GwhPkXVG30etoN9CdKKWDpBW88TFnumNaWvBlCswqd?=
 =?us-ascii?Q?/f06jI2+yATnpZ0RMvt/IeLQVrk/vlEWWhcRhRqhGQ5rDGfqhLgjC2PSIADJ?=
 =?us-ascii?Q?f5l3t8916i76hLF82cOtQDMEMLU4ToiuOmrdQTCrzdfFxgsyiKhV?=
X-Exchange-RoutingPolicyChecked: 
	OaaXXvipZ0aBL9z8j/kJTqfh8r8Q31H7W5oQeQ0jAR28rRPKqwfOWVnpeb8bJW8f7lqLDKz0liCu7ZCtL490JITEoitt6aF4wYq+X+nOFxarXvy/5aCHJJeMS4Jr4V8fNx2t8PZcmop1PMKA0XccXwSJeuheKEafFgYVQy3elNVCEdaVwtiZijuOAFjk4VzPXBfqndDwV9yQwZaVM/YZCHYfnhfTdlGtidyqixM2PKyXCwPoZ60I9cWSKrrctvV961hv6NilBNDO+TmjmrYPxNj8v9p+8ONoanJWOGsiHm5IXCFZ2OLR7C02qGRIygbf36pH3I6b4AtbODDXJJY/yQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d92c42d7-7836-4495-1f07-08deaa7ea332
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 08:16:42.0696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYSfUC+kmsmik6mKwGlYb9DEDWpf2Blg+lyRV/7DjUUfEfNX29vSjTaOLXBtOi9pWRW2eGPeND5bvPiOC+Y1+AExy6lpee7iR0fVMIGE4XWEpxWaOYcW2GUMmYLx88ye
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6698
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA3NiBTYWx0ZWRfX9rkX5+p/TnMN
 HdnRfAMFs0bNHE5ObWV4dZAuLWLquBVkvypOJ+DIU8dI9R5px8S9KW/XVs19tCk8rPkv0xPouYl
 SUPcx2t8rFO8l2thohkvDAn+//bKr+MoHIMxEi0A9VWzJjZun001+VjsjGIDvQpWBeL+XCTZE6T
 WExsmn7JZHrhVIrEO327Z+XCup4To1dK/WgwZkrVj9apVFWChOlWIds1qSXxC/Gn3BWngCFbH3Y
 Smyb3HgG+MLaVUe2u+D/fkxVaAEvsMwZ1QJ4D0xDEprD6CrzkDUp554XlTTSRMR1cLB6uU1KqB6
 EYXszILM2NpnTteVDW66udD11ZoWP86BGbk4DJE20Cs7nQ3nP2+BcXKPpYHrJerXDLTWMZ5SMRV
 Or8a/6jPFagVVXtTgh2JFu6Xf+3i1fAcjG7EDb99/F0d2fbm+lZTjhZAZzWfZFDvvdgKsVFx2x5
 Pb1kQADbracaD/x6LNw==
X-Proofpoint-ORIG-GUID: EfDIXmsQZdCkW_hvhr3CGOa1sQEcew1u
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=69f9a771 cx=c_pps
 a=f/vGOH3Q9iIJglbWlzIglQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=IQOrjEw-PoaY6VFe8koA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: rN_ZitJEb1Aj-QrSeqhxRQnxODr6VJYB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 08:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236467

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

clang-tools-extra tests depend on the llvm-bcanalyzer CMake target, which
exists in LLVM's CMake project but is not visible when Clang is built
separately. To run clang tests, disable clang-tools-extra tests for now.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../0042-guard-clang-tools-extra-test.patch   | 74 +++++++++++++++++++
 meta/recipes-devtools/clang/common.inc        |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch

diff --git a/meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch b/meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch
new file mode 100644
index 0000000000..9b4e29ff64
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch
@@ -0,0 +1,74 @@
+clang-tools-extra tests depend on the llvm-bcanalyzer CMake target, which
+exists in LLVM's CMake project but is not visible when Clang is built
+separately. To run clang tests, disable clang-tools-extra tests for now.
+
+Without this patch when CLANG_INCLUDE_TESTS is ON got the following error
+
+--------------------------------------------------------------------------------
+| CMake Error at ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2113 (add_dependencies):
+|   The dependency target "llvm-bcanalyzer" of target
+|   "check-clang-extra-clang-tidy-infrastructure-header-filter-from-config-file-simple"
+|   does not exist.
+| Call Stack (most recent call first):
+|   ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2221 (add_lit_target)
+|   tools/extra/test/CMakeLists.txt:87 (add_lit_testsuites)
+|
+| CMake Error at ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2113 (add_dependencies):
+|   The dependency target "llvm-bcanalyzer" of target
+|   "check-clang-extra-modularize" does not exist.
+| Call Stack (most recent call first):
+|   ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2221 (add_lit_target)
+|   tools/extra/test/CMakeLists.txt:87 (add_lit_testsuites)
+-------------------------------------------------------------------------------
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/clang-tools-extra/CMakeLists.txt b/clang-tools-extra/CMakeLists.txt
+index 6b6f2b1..26e4c10 100644
+--- a/clang-tools-extra/CMakeLists.txt
++++ b/clang-tools-extra/CMakeLists.txt
+@@ -8,7 +8,7 @@ include(GNUInstallDirs)
+ option(CLANG_TIDY_ENABLE_QUERY_BASED_CUSTOM_CHECKS
+   "Enable query-based custom checks in clang-tidy" ON)
+
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   umbrella_lit_testsuite_begin(check-clang-tools)
+
+   option(CLANG_TOOLS_TEST_USE_VG "Run Clang tools' tests under Valgrind" OFF)
+@@ -45,7 +45,7 @@ if (CLANG_ENABLE_CLANGD)
+ endif()
+
+ # Add the common testsuite after all the tools.
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+   umbrella_lit_testsuite_end(check-clang-tools)
+diff --git a/clang-tools-extra/include-cleaner/CMakeLists.txt b/clang-tools-extra/include-cleaner/CMakeLists.txt
+index dc147f9..4855577 100644
+--- a/clang-tools-extra/include-cleaner/CMakeLists.txt
++++ b/clang-tools-extra/include-cleaner/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ include_directories(include)
+ add_subdirectory(lib)
+ add_subdirectory(tool)
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+ endif()
+diff --git a/clang-tools-extra/clangd/CMakeLists.txt b/clang-tools-extra/clangd/CMakeLists.txt
+index a1e9da4..94dcb96 100644
+--- a/clang-tools-extra/clangd/CMakeLists.txt
++++ b/clang-tools-extra/clangd/CMakeLists.txt
+@@ -215,7 +215,7 @@ endif()
+ option(CLANGD_BUILD_DEXP "Build the dexp tool as part of Clangd" ON)
+ llvm_canonicalize_cmake_booleans(CLANGD_BUILD_DEXP)
+
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+ endif()
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 9d45898c68..62ffe78075 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -60,6 +60,7 @@ SRC_URI = "\
     file://0039-Rename-UNUSED-and-UNKNOWN-elements-of-OffloadArch-enum.patch \
     file://0040-libcxxabi-declare-__gnu_unwind_frame-in-cxa_personal.patch \
     file://0041-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch \
+    file://0042-guard-clang-tools-extra-test.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??= ""
-- 
2.44.3


