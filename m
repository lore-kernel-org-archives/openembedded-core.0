Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DFCC48BF6
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 16:33:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.582.1709224405858742499
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 08:33:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NAwa7+uS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3789626240=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41TB12To030376
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 08:33:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=cGadlSculFZRFxMp7LRksS12WjcCoKi9KoA8Koen/S8=; b=
	NAwa7+uSJHSopspwOvmsE4aLnHw9E19PKnNXYno7ET1JHOIQJn1TsGhuwL8dRBnQ
	kaI1gw0giNaXofjg3Dw2k8blGRRDLyK63Pw2ruia10ziA94aRSDD5MxEq5dhCLX4
	4VvILDmwboVNZnC/Z3H91Rna2L4uPpJbnWuly26SRkfTpBF8MeQtFb/KcMHEFukK
	Wu/gxSCzbZEtqzsuhubaF+C4uL4K9RX8JP4J8cCOCqBpq0poVKPHxKxXJkZQ4Jsn
	pvxbnIYaRU5IGmruuwZwtObD9+xY1McJKSD9H4RgCwD+a9ct4Lyhg1UUtgFRcIri
	JbQcZoRQlCU5TubHpWyzTQ==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfgumnamq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 08:33:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqqtBPWRO/Sa2Yh5pZkgr2R5nsDmq1TlnKVkSUAsPQQy8dv6wviCHio6v2sYQreKi17RwVNL1u3GiKCsRG1e6OdBMp2IDQ7lsbdwaDzcqXyhbW5QoA40izm63DncESP7MAXwSuoBVFUF9xYbWAvRX7PrMjwB8yjBtzJ/cgTH741T913SV4WDRtK/nI6AoyTnp3EGwyJhnTRNXz00y21BguI3QGE+eZeOimhOPpvxQoZrZwtYQwivBpWOdcA7LHyUM1KEPW4PJ0lEa2kKAZ3lFtx7zzwW/GiuXBKPTC3Fhqqyt+wwPBhudS4civC+ZETAwfYCyrI1etgJHYOw6D+L1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGadlSculFZRFxMp7LRksS12WjcCoKi9KoA8Koen/S8=;
 b=Ohcz1uZC6DmdcyK60qoE/dzrk4YB9xDS/48uK/g/BYfU/SurZjNhtXvu8albc22en2KpGjZKvhaast8od4bkmJVZlK5UrpiDLptXxp0hmH+AWqDreclkHyRBe1LigVFQs/DcdNLkecSLyDNsn4fR+vZk7KyytIn98OhQa9z1L+ctQaZIPWEVcudVZ7UOAkqovfoSdH+9mZLVIphKyvY19HXuo7/IZkdci/RzvStmCUU1/iZGdNY4JqGks0FPYtdqdKl3tDHeuiwVKA7qSrWAckL09x6N0jt6YqmwGp2aAH9gU9pb/gynHDrZIbGRFopy97M32JNo3p7eZKyVGG5NnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS0PR11MB7768.namprd11.prod.outlook.com (2603:10b6:8:138::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.24; Thu, 29 Feb
 2024 16:33:20 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::a5f4:d259:146c:6144]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::a5f4:d259:146c:6144%4]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 16:33:20 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com,
        Deepthi.Hemraj@windriver.com, Harish.Sadineni@windriver.com
Subject: [PATCH 2/3] rust: Revert PGO to it's default
Date: Thu, 29 Feb 2024 08:32:41 -0800
Message-ID: <20240229163242.1415066-2-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240229163242.1415066-1-Yash.Shinde@windriver.com>
References: <20240229163242.1415066-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR04CA0110.namprd04.prod.outlook.com
 (2603:10b6:610:75::25) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DS0PR11MB7768:EE_
X-MS-Office365-Filtering-Correlation-Id: f72d3e8a-a10d-4a4f-e2d1-08dc394423d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hIEuwqhZpT3C47xQHKve4iFEXr9TEPED2TAyufFboMChRvDUl71txrW3c9NthFQ3DJAi8E+SAX7u1EDn6LAn3dJEaJsrENw9chUZmER2foshOMKZW9atjbmF23kVRQA4fkDthGwQNAml6yOrMwXH+8EkdmxykxoR1d9nfQ7Q/bu0+KeuXFqTx04P4j9mR7doac7r3raB6JtC3ww6FlI0LyGH6T27XZa1biHnCKy9xYQd2xfwbh6E7iBJTnn52wMGTWWwcir2qMo253r05OPwi3uqLBazmsvuY5E/6gZ3zymROvKGmy+S3Df7lZh3YTIfFLKYbojc2C7djb8o2lHxj9IsjUKuMaDGNz3yRAbtIGjeRRgHTA6SbG/sgzuPSX9gbiLoIYMkzyC2/pMCqPt5M+nFZgl7KKbNpkvSe4AKL7QgPtd+HNM1CbnEjzTX91Q11mIs3CoaaH24QJZtDPkh0nrG9eA0yeFGwX9qoBkUn31BSgksMlgeuJnK3aVL5hDxZlrj3uGfRE+yNEZI89CT5LE71arYZBprzA8a41s6rreeu4DmFRvOIqZL4cnKrEE+Xm9YRjQu8fH4265ViMDL8Vh59XQ3qX0P9LtY/D7Sl/C+DqiWNcA71TlSthjtkZLzyAc0C2Zx+2LnF5cPs24WW10uu0cfI7b+uy0Z1YnxYqgCHdsQ1x77n7ph2AHj3E/S
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IGeqF1L4PWAW4AtMCl+vdtL3ds4Ib/OgO2nQknVvrIGT8kM4aqaI5wQGxLB2?=
 =?us-ascii?Q?hBpO7GF9YGbHV2FKYqV5qIh0McdYYkcqwcRR7u9kDFtB5JfxuaFReLe259Cy?=
 =?us-ascii?Q?fiWNeHyhW+tcOEOfWtHAovea7VKnfvOHrulflfizMk3JCslUSTCUA9lwbI4l?=
 =?us-ascii?Q?W95q3+0lq5/NVxKfOkUtJaboIv1F/BuhRD6Llj9Ei9HhhE5XzeoBsiTK5267?=
 =?us-ascii?Q?cLLKpXYe1LYdh9kricGIMckAkJIqq2Irtn/nzcsbhbjlk39hm45tfntPysW5?=
 =?us-ascii?Q?2/QcCVRQIeNO/juINhwTAmpfMwFfD5LZ97ls7k/tCG4w6L9GQhgTHs8Gjyjo?=
 =?us-ascii?Q?cm0Ubeav8lwJPHJdgOcw1TlTUUzy3wdMgRQ7z4DX9YHmquAK8EGIUGziFI6y?=
 =?us-ascii?Q?uF5OSHUz2k/sFGzkZDRWDajQTRIGMKNoxXWiPfwJrIsG0IanpyCZEVCulNj+?=
 =?us-ascii?Q?UvxOZf1ICaEmzBjaN2JnehKG2dMIIsIRMj/9GI/Q4WZmBEd6dueDLB7BUIBe?=
 =?us-ascii?Q?8B2oxe6mrYE288nOmPQ6zICSGHcAkIcrgeTZDc/apE74ZPGyVIxhTNzN84o1?=
 =?us-ascii?Q?NB4rlvExDiNJPH+VjmyD07sWm4Ywi1AgDpGebjBVi4lgKmTEYJ0oUgcH/5QT?=
 =?us-ascii?Q?AZuhwCjaDOGer0v8lHnOKDbIEZkTcROpnfTXKEgcfshdqdGRjABHsvKHdTUi?=
 =?us-ascii?Q?lokZic4kuI19KFL02JhqjKPe8L5+Qms6AuEunQTS/jh4opQrrLiwtZDwta97?=
 =?us-ascii?Q?hC7nbwSlsHfodVvkAmsjRShl1IbsUDEZ6AI04eoISDZFBjBYi/Xw8FVfdMMn?=
 =?us-ascii?Q?q23WBzmT/Vrpa0pYoOGU8sLqtFP7DZxxzkp+LsatQI0t/rgkVksWuyjLrBv2?=
 =?us-ascii?Q?3Llb2QyxOpQDA18x56M/hZSCCZeDc56nhZQYB4a4DGt2qgiCo0Ay4ufY2RQX?=
 =?us-ascii?Q?AU4HG4BEu9vq1s/e92TLCvH31V+nXviqh1WxoiHh5ZqIfrCnxDki3KhhCfgQ?=
 =?us-ascii?Q?QYm2ct942lh/aNwO/XkUcpj9EirsuMjEmqFaBZ1tF8Arg5btjJCZAaq/Hr8F?=
 =?us-ascii?Q?U75csQDN6l2s3xvwCtltkliAEK8Ko3nZTuphnjj6P9gRt5dq87lNlpx4ISOQ?=
 =?us-ascii?Q?Unr4K2oi1Ot1R4ZC9Uw1B/V4fGZWFCCW1fxmwI5KhpMwRWXk9Y/Ttk6gaGX4?=
 =?us-ascii?Q?iactIUvfgiqi56mXbqFR98w6vnD/peBh4nYK8AfyRSDX+tSQBvRUu46TO9ed?=
 =?us-ascii?Q?ltQm2rVC7HJbacO0CHZQKT6kNvDxuO4smCgIfF9R/uhtuI67BrVaZ7Ks38Ee?=
 =?us-ascii?Q?mzBPnlBRDbXwJAHcGD1DbY25W3JDVtXhXnPDW/5sRpmv4Te30DevmOj8QyD3?=
 =?us-ascii?Q?sA8mLJlGBcPacv14kuaxPc5WPsmZSS2JLqBn/lbOiTLovhSXB2apQplp8oo3?=
 =?us-ascii?Q?DWJgYu6YiD/RK/grucvBCfhrpgGgloFcN1+u7W7wB62HvrEm99bw8+wzQ3VX?=
 =?us-ascii?Q?o6IrVytICeBBomceaiLH3al/h3cexYeHF9v0+xb02tNgQoX9V0H02oD3yAgf?=
 =?us-ascii?Q?KLTq7z7YLSkcEqqMR6d+NkAAOc3rORAolDu2U+6WTOIM19Va0OgC1dVa15Mc?=
 =?us-ascii?Q?VA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f72d3e8a-a10d-4a4f-e2d1-08dc394423d2
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 16:33:20.5229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1qYLsEIwz3ae+ud72XsgeHsWHocOZ552gtrSxeZW4BnbpSBhX9SjxoxImXs5yOUNW/mDdtTz6tRxRP6nqO/OQLEGZrKrAKjw+EiMxvnhhFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7768
X-Proofpoint-ORIG-GUID: 3_aVFggaY-Ne49i8ooIxIISlJemr67tv
X-Proofpoint-GUID: 3_aVFggaY-Ne49i8ooIxIISlJemr67tv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-29_02,2024-02-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxlogscore=949 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402290127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 16:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196439

From: Yash Shinde <Yash.Shinde@windriver.com>

The rust profiler PGO (Profile-guided Optimization) options was disabled as a part rustdoc reproducibility fix.
https://git.yoctoproject.org/poky/commit/meta/recipes-devtools/rust?id=321aebfa281bd28e368c684ece57867f6bd0cbe7

But, other applications (such as to build chromium with poky) requires PGO enabled (https://github.com/OSSystems/meta-browser/issues/786).

For reproducibility issue fix only "rust-demangler" change is sufficient in commit#321aebfa281. The PGO is reverted to it's default.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.75.0.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-devtools/rust/rust_1.75.0.bb
index ee1ce9e050..76e1fe2d84 100644
--- a/meta/recipes-devtools/rust/rust_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
@@ -146,10 +146,6 @@ python do_configure() {
     rustc = d.expand("${WORKDIR}/rust-snapshot/bin/rustc")
     config.set("build", "rustc", e(rustc))
 
-    # Support for the profiler runtime to generate e.g. coverage report,
-    # PGO etc.
-    config.set("build", "profiler", e(False))
-
     cargo = d.expand("${WORKDIR}/rust-snapshot/bin/cargo")
     config.set("build", "cargo", e(cargo))
 
-- 
2.43.0


