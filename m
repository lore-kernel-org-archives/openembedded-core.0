Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82938EFCE2F
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:44:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24447.1772646264740449619
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:44:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UPc/0JHh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7523672f62=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624Bv4p82845457
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Mar 2026 09:44:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/ipUJQlymb7LsVfHv5FEzOss9ZqEz8ZXdGDkGeKekdk=; b=
	UPc/0JHhDmnEXmrCLN9OmVI0YB0EVZ0hQeFzzXvCONjC/TwLere2p2oMyyQazOLG
	gzvXIQPngmHKqQeDl+lQAHuB7Wj3GIyrAIfFif6tG8V8FSRt4Ya7x9K42yx5D3v2
	YNJyyYir2yxVpKH0N5hLj2MJFwoFNUVFMCPfyfbSy2gjNPJiI2ucZ0wFuUe1CSH2
	TTx0d4cQmUwXQvKZ7JGIjmoIxVDbBmYrlKZ44o1pDb3Mj+mtvBXJZJNy0Cvj5YMF
	wF1DZ1OrKII2KLbMcQ8WWytyNsDgUZvZ9oQ6ZucifKOe2U1EIIM7SYMPPpkwAL/o
	lW34bjZCWzY6+KpW0/Wc0A==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012031.outbound.protection.outlook.com [52.101.48.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh454hw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 09:44:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8QvD8kws/IOe/zBpahyOcsNd0UkJ1Jxol+mm0XKM93hg2IyU7FYac//h8c4xMEVtXNwXnDKhuEL21tvqVSrQcgC/8eG2CkHE7YmOy/wPGob/QbFq8l1D5dyn0ws3anEEx5OycGmJvCT4m85uuDvLXtPBzDoBo3SuHPtP/VaxqIhiipCY5LnOP5k4BFlQpX+L6jsXPmEoI4yFPGxRXfzkrDaAOYvjOsEOyxu/DWKoRU2/fY6YIqqnvX3W0gbFrzZmUMTy56fpxVh6sOQ0HuiFZVNHaHj/91QGdfod6/pGK7Jt1D23LEci4ub04Jv2Pc4cBS9fOSgh+/Uh3FvQLGYaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ipUJQlymb7LsVfHv5FEzOss9ZqEz8ZXdGDkGeKekdk=;
 b=b7GEcVzS1XBDWG6786YybtSf9H7iJAShz8FLfDD1tc43tEhNNi8gZ4HwEtGSyIC0Fiu1CbHNwHi9gnrAwDy4Pithp9KNCkgfhUpjLxkm8/oZFxD9OGtosl/RByjOxf6U2MmiPnhF/yN58v6b4Tk6HTLBGCjuVO/dkldtHcfwXo4KojOiz4ZeFm1rGdQHXZIiHaC3CKA52dfbEIGO62BMSO5aWGi7/WroLQlGWrOUtm8V1KTbc6kR6WXnGUlBCqcdCkErlp+RpoA2v8MzCrCSYUvP6n9VsDw9RGbAwxrNi4f+ZZHUqq+vK+m4olNm3jATTOnWB7e0V6A7EwjmlzLuYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA4PR11MB9396.namprd11.prod.outlook.com (2603:10b6:208:56a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 4 Mar
 2026 17:44:21 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 17:44:21 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        paul@pbarker.dev, yoann.congal@smile.fr
Subject: [PATCH v7 12/14] meta-skeleton: Add rust-out-of-tree-module recipe
Date: Wed,  4 Mar 2026 09:43:22 -0800
Message-ID: <20260304174324.1186644-13-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
References: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA4PR11MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: 43070177-1f51-4e7b-be04-08de7a15ab26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	bqu594yfGywkk5GaMiQeFN3Qmrpp84nb0A4pkaentJ/C9OIGFfWhPGanlIqsjp3LQ//ZtXQuDYb6AwtXrlUI6B2sbxsTrW+I/Fg59kToqW4lMC/LZd+mnMAHLctkBTodkSTiOdZI42/QpOqQNF2uwmAKPizlor9Bh4ew5DWE+Y/HMMX3tUevYtAfbpcQzl8BbQwLD6pi+Amzv0ZxCdVTCPV+XFYCM1bR6jWikbrYbniHQEQrxKFS2G+hiiCdK936vmw1ITzYC0Bb0AcVLRNunWgI1cxJKYpyYfQ/BjZTRKud/f54+x/ln5P4fWuw20FKoXtX5uKgyHU7/nKV0lHdzEj6msIjEQV/DgCjPoC5FgXgCvOBFHUwMpt9y9x3nVi9oYbBcobrotxc8sShl/UAsKrCC+ku15pt0yjpBFmzT2W4ZcLCpfHDKk7jCuoBmj5ZiJ0l/AHGbqY6Bmo2K+SZJOsOSMGxoSp5sXW7dyd8eJ2bg9cqca2Pzwd43FVOVezbY9Yf7NXvJQulqxt8471alXLUKmiZl/sc6IcRAtTTZDkPq1duwj1DlZw7GC7m5aty8uPmbyQQ4sqPRtpfPW1KbJ4RbRpRfxpidphlYS7xungTXL4HBUS3258AMCsmKTEPoy/itKzKX7c2t5YoiwGE8di/QY+d0CKd3QitTi9Zq6K2tZpwkqR3ihOrAdkQnq2ypFp130wLFP8PL/B81mjPHsDBe7fvcYUAs1Rb2ha+gbEB49tLnbYRerbxGf2b4bog5Q4zT4e0crviBgK0aYCA8+OAFyMnYWO5G8KT3uLHnI0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/dey9AXiWgkYgfSVxmq2/xIyQWbTK1y7s93Gk/5Mk3InlB22cvkvY+6jwG3W?=
 =?us-ascii?Q?G5TPG3WarVYxnm3+4AR6BDt3ylluQmivOWb00KYasl5en9zwwvYT2WOVGMD9?=
 =?us-ascii?Q?mD3fMgEVmooKWj+MfgUmfVj62EGsXE/dfWJnF/hYcXY9sncxfamfqK9RnNTq?=
 =?us-ascii?Q?NXIRUDnSfqTTquYjQFdzUSgBL0tek3BEgwvEdoMTHvsUtIObiB5PIVDSEl9s?=
 =?us-ascii?Q?GfxP0/MVDmVY1GGd4Fb+6Tlvhy8dlP/kKgTmKzRVKMYOB+aRN60WDYfsD392?=
 =?us-ascii?Q?9rh71Qa6g8p7x+ZQJGOugqCJUka8W2BRTz/cqGSiuKiHo39T9N0SzTrhteDF?=
 =?us-ascii?Q?XvXQezjVNk2652NM8wNHdqpfG2D6mvz9npQjqtEF0LVNYeBmK6GZzuDCR2Na?=
 =?us-ascii?Q?Mnz2nwblnWYy3iyA3Aifgu+1iVh3jdabPaq+cQVqe/fy3Svzg4WZdHN0p58k?=
 =?us-ascii?Q?KwRtmcWm6bm39hWjnQTgZpFd/kI7Drada326FfV+X3eouo1yfBnoBzpvR2gm?=
 =?us-ascii?Q?aN73OCOe3xVfLKWhaXsGRWHcMCqgMgl7Vol0e1hhRvfzQJLu1fBjtPwjsmKa?=
 =?us-ascii?Q?/Zmx22FTDhJuLzMsX4fgUharlBhqY21Y5764pyMkPIIze3kiO4paAo1mTZLL?=
 =?us-ascii?Q?RvzCP2vrJKFsuGER2WL9lXsfOtI6KJuHp7V6ajevDF1rY6olZP/GwJsRS6jF?=
 =?us-ascii?Q?6/zlPWuAA/P3ANe6+OLganOvIMxKTUeeszLLUwkegtCqvM4tm9n5okvsXtN9?=
 =?us-ascii?Q?h3ctCwZh3Xh6NN+TGsJHKoXJO99DqGc8RS5FkFs4yAUAekRFSA91DNq/eQZY?=
 =?us-ascii?Q?aZou7F+3dnDuN9wbqnY8AH69pDFVTbgnfVpQ4SRTOdhH7wyIocjpJ80sjIus?=
 =?us-ascii?Q?YONcibHIy6HpItsvzG6s1wzspv8/Bly4SmQCxyJKWltx0bA8DMDHsrCn8BAd?=
 =?us-ascii?Q?R70+JjkbB97QRmpQo2WaSGePBc8nxJ1O92HYrtmjApCoqKg7Sh33Bjp05x8m?=
 =?us-ascii?Q?EnmEpZKoAxNR6fUNijwy3Pc+OoS2GdJOfcfOkpf5LDuJ+jn1gYmfZqB7qLTz?=
 =?us-ascii?Q?wcWehHq0zWHeuUkrZucuXZMWnt7Uu95YO1DFd1pirNtLMsyN4hMj7blZH8BM?=
 =?us-ascii?Q?UCsRLvcfGX91HVzbKvc9ra0nUysjtsO0aUL62KEcwUTLleRKnbysVciFCzOZ?=
 =?us-ascii?Q?7Yvulbtnh2g3XPwucU1XD9xsOGliVxTrX3tQ30zaizwf5AR0t9ZFiyEX4uRk?=
 =?us-ascii?Q?QQ0mFPEvONaQLfoSSd3Fqh0TfsBRPtt0Pgrh7UW/tJRqH7miqlV5HoIB8Sbk?=
 =?us-ascii?Q?zo+grjUx1eS/1hUNXmJdadn+ehTkONV8EMuR7nmKmoEK9rUHtxQG95qqpfTC?=
 =?us-ascii?Q?xBNEFYFj4OoZfpNrfSwGo30cZ6WCkGoo2VPaJTu6J/utvE/kuJ4a1o75qsNl?=
 =?us-ascii?Q?oixrvwye3p4/YT8Q4EPEKaWCcqDqph9ZmFsoL36JV3GJ4KTABboVCFHVD8yb?=
 =?us-ascii?Q?kSgwpDSHrTj/yUq5nc4EaSP43pouAq90GjUJcSiFRnN4gLCjNJKzLNAEqi27?=
 =?us-ascii?Q?pK/M5TKH/047Nt6qyMKfvXe6PH+8+OmF6MXtoyqMmUQdQPSiKTUu1VzpnS+6?=
 =?us-ascii?Q?qju1Scf0z6/o63C8alZYlfcip2T/9suE93muHN5MoMmkr5N8hVcJtUwUS5Rm?=
 =?us-ascii?Q?01SRtoi52SoL64NEJC9oNcxsXgLIz6bdX6OxnjwfKsYSY/6KVNDCcdDtbd2j?=
 =?us-ascii?Q?cGOHqcDM8aB45kFxWJv+aSoP5LcFN/Y=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43070177-1f51-4e7b-be04-08de7a15ab26
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:44:21.8386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JrD88efyzFld0vu4yxCskotmkxRZ+PqrZx2esI63PRyHpHtFBUIQQ0jqVeDLbe428XS4q1Ylu2UeXgrT5KE1y5FTnfLBk8PFJD9cue25zTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9396
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: L4TF01L4BT2PAQivOwqKok6lV7wATuam
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfXxGvNxtvjGNQQ
 gBHZR24I6QR8wIPfLCegZfi6DEfS42XP433fAhYUJ8+rftAfWa35jb1FT7qWFzaic9OA/s423nw
 ovXrICGR0Ggqs85fTlUxn43GN4bprDQDIevmGojoT22JMbW/3CP/OCIaZY+Xpm3dc1+GypVm9Q+
 rdC2tzRHBH3aO6rmDYf0t9V8Zi0voLLRTaq8uf6kWXkRhYCnieittRy0zkC/H3SukCVKZlaVris
 VagSXfzwJ9ym6Ovl1xooFANYKJOIb0g/qWCstmaP/WsR0h08hEih9OIbd0QV9QkHkZBi1ZRxncR
 eeQAkMiUNkFTS3BDJfXbBxGYwj7JiT6yHu3kILAV5U9NY/AgSEB6kborM9fxnZ2gfR9EKBwlUkr
 NRDXjtBe0CxIWG5rzcVsF8pLTs0s6NYsp7BGvVIbkqQbjhk3/1WdSFCNR+3WRaFQ34BIIYVj8HD
 RyFX1SCWN6NgQkBWmqw==
X-Proofpoint-GUID: 7iRtuXmcNVqDDD2zYApG6-3cMW482TZC
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69a86f78 cx=c_pps
 a=fQjKmEXVym7+EbnoMZdWAQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=ROIJiIjWYnIpTvY2ysEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040144
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232428

From: Yoann Congal <yoann.congal@smile.fr>

Basic template for an out-of-tree Linux kernel module written in Rust.

Mainly to test Rust integration into the kernel.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../rust-out-of-tree-module_git.bb              | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb

diff --git a/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb b/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb
new file mode 100644
index 0000000000..077780a192
--- /dev/null
+++ b/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Basic template for an out-of-tree Linux kernel module written in Rust"
+HOMEPAGE = "https://github.com/Rust-for-Linux/rust-out-of-tree-module"
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit module-rust
+
+SRC_URI = "git://github.com/Rust-for-Linux/rust-out-of-tree-module.git;protocol=https;branch=main"
+SRCREV = "00b5a8ee2bf53532d115004d7636b61a54f49802"
+UPSTREAM_CHECK_COMMITS = "1"
+
+EXTRA_OEMAKE = "KDIR=${STAGING_KERNEL_DIR}"
+
+# The inherit of module.bbclass will automatically name module packages with
+# "kernel-module-" prefix as required by the oe-core build environment.
+RPROVIDES:${PN} += "kernel-module-rust-out-of-tree"
-- 
2.49.0


