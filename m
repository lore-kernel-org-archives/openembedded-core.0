Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFDB0C36017
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 05:54:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.45455.1743400497590819149
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 22:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61856e1cce=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V5Nucf027315
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 05:54:57 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45p7u8sqf2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 05:54:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azfysKivUjigvJOx8818RXbTkw/9k/x6Fy+sOuW6Lg70D4HS1bgSKkYxCySskCxdm4sqNnjSXUS9EWU4eKhlT0zVylVrjcssha9InbQrQJRcHie7yFj0i2RBsmZL6pVef1wFEgeb2tLf+aqmQzMYHcAzomcnozBwPhp5h17PRmxtMTWfVvA7ipqvbUaDFZsH2kYezMWcwQBDB9uUdCk84wwEXhunYTav614xWUQW46DlPq3m8ZdxQlm3M+jf/PYA05pG6avS7/6mQp0B1pbPYd0vDnyfJZ20m2HoXS5tyPnLg3X/nfRg0MKw91Rq3+yG3NABpTlMufxang1sCPBeKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wzcvj+U6B4FLA+HtDOMjHUwer6gMbycmTtcQiA7wmS8=;
 b=pDD0ZKI+0E4O/nsC/hv+28Siw8us6BhxTbqcajZxT1NnOjB/C06YnIZ261s5rtZWGMeLxQr94bbiQ0FAfaV+E0wUjjNKsAgxBTwJh0MJd3aEh/3168TPEOjQRSria4HENzq3uCnJM1SfO4Uy3jUH0QioZUnlpwF8TAgp6sZgmTAUJpML8p1nPEGRa+TWhEz3cek09IxKWtR45Qj/QFRVuVvZEmTRNE0kpF8pc2b+dp0kpmo8KkyTcYWmrHTWzxxE4b5TDKwN9tb8xdpzHE5TY4KCpPSZs2izTcU1/MakodeWCCCPHwY3aCaXVHJZq+3gq26hRvUjNKS8eVXwKqWPzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by PH7PR11MB8036.namprd11.prod.outlook.com (2603:10b6:510:248::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 05:54:53 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%3]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 05:54:53 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Yash.Shinde@windriver.com
Subject: [PATCH v2 3/3] rust: Upgrade 1.85.0->1.85.1
Date: Sun, 30 Mar 2025 22:54:22 -0700
Message-ID: <20250331055424.1978243-3-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250331055424.1978243-1-Yash.Shinde@windriver.com>
References: <20250331055424.1978243-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYZPR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:930:a3::29) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|PH7PR11MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: c4d73574-c343-4265-314b-08dd70188e90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rF/jqtwiE5b0Bf0S5Jv1w3bBJK/rTaStZSlTT4eRG2FBmst4l0hDBXNMsK40?=
 =?us-ascii?Q?YwDhJ7W3XNC7l1W5WUnCKHQ3VuuQYW1yL31SHww4STA7GvlCF1JX4RjY7Jm3?=
 =?us-ascii?Q?bTbrO61kZx/gAlwqhrbPJWOPMpaHWk8ztL9mAeDbtAlDiNtFu7V6HjOtIC2K?=
 =?us-ascii?Q?lzbw8cyxw0p6mF6FssDmMEoMh1V2swJdGTWQwyBOz23zaCEx7lVGTRVdX6Pr?=
 =?us-ascii?Q?LMHWfwTkuUyHOVV7DVwOYPGXKaN/BK+QaasTPbEvjGAnIfTwi5ix3m1IWxXb?=
 =?us-ascii?Q?K7d0EIeWxoJVS9dgMYt1PBBva2VOEJXc3qzZIVpvTCfAYmnaTr/ktG22pJ7g?=
 =?us-ascii?Q?Lng5BhJc9iWCV7uxZaeIWJUfhGmY17UQWei5bquUjZZ/PN535p7WPwSRx5ut?=
 =?us-ascii?Q?Y/qxoV6/9DHxn3dxROHlASdF9v+XbfiX5M0S9Wdhisp6BRzDc6iwapbilPyn?=
 =?us-ascii?Q?8LaYheiklKT1KxvLSeChlA2cjryhlAQrDK126/5AyfoThqOuDfohEZezMcq2?=
 =?us-ascii?Q?4RcBf7YAqCfuANj1LzssUXdW+WlBsKWkwfBz31Jo9RxK/9CGTffrUlRmhJ+6?=
 =?us-ascii?Q?cc2P2HSqF27fkSVtPNXJW+Lvhz7HpJ93D1zJgCWd3J0vfEzgcdUNKtxcBMxc?=
 =?us-ascii?Q?CeSqJkU/j+Ci5qya6xY7lHai9sniWLwGw+ZNlXdZ3oIZJqYmBBLwwuGj9RSV?=
 =?us-ascii?Q?CFoGy3kKIQT/MazxlUN9ExsVH44FuBukV4WujIAIPWHAkHjvnR6rSq8mvpzl?=
 =?us-ascii?Q?7FkJazXd2TTCKTve12VjIjqFTjC8kfH62SQzJWx3HZPzs5p/07gp50iDVFQU?=
 =?us-ascii?Q?4PodDHfhCVtaLooIF9IxNmIFMRWmYzRSHevpj9hJUCzn9FRYUS+PMytW6JaL?=
 =?us-ascii?Q?OLZ9nz/GWbb4+qEar4M90dC93yTB8q2bF8wP1nyxpMbyBRZD/hrT2oN0oEI0?=
 =?us-ascii?Q?HUqaxYEiAQeIU4bF0KMIcBJ+pPQcL8QkVZdZHq31L5Za1Sj7Qwt6yiiLeScm?=
 =?us-ascii?Q?1dMxjI4YU/E1CthAvMFucQvGzbl50JnS+6BMEkKNbGowncYJJ0Ov8kZFzN3v?=
 =?us-ascii?Q?sBMMA6sCELs/z2o9bbvFcILY4n7DsD5ZxG9wrb+5oOaywQZywLmcxvsu4En2?=
 =?us-ascii?Q?5RncnEFn91Wd2BlYsXnsHDeJBpVZ11c+ZvdJelROk5jpH353aCmQcIXzH6qC?=
 =?us-ascii?Q?toxNsQJPBLczAFcMJrBFG0z5yse7r34danxwdLhmXlmeFDNmmeL7nQDR8gVi?=
 =?us-ascii?Q?OYBsIinTG7ffUKa+eI0nAfIyPzKc996FfavMYqNUf6X1qqufy5kFfN4Gfv/L?=
 =?us-ascii?Q?1KUznp0Ik7GHSkDazqviZIBjWZH+jPsTROSui+y43W+l586SblO6dZgBhCWD?=
 =?us-ascii?Q?I29w1QynFc867SfjiBxO2mmrN+loCfuQk3OqSe/ECNYrMwiEWUcRbor/YVle?=
 =?us-ascii?Q?E2wCqRoA0iXGJUxjLoSgj7omAN95yhOW?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Rd+VJlmULS+vN4V27an1ptpSLla9rX58HB9Az5fzy50P7SA888iLD+sNy3cO?=
 =?us-ascii?Q?aYrR3oTU7zVOmkQG/fgxMmpRrbfeIjV4QK/i94tCUEh4nDUxAnXKFEMYQu0P?=
 =?us-ascii?Q?rnQVm1r7X5TVq7CD7b70zpjjAmadU0M9oD28Rbu+/dsVkjKynb1lr5cqh5zX?=
 =?us-ascii?Q?JLgWfHysz/NjdYfmRLhMs4THcMXhbXyLIwqxMZ+Vl1FjD0zZMfLCRRfrzHVe?=
 =?us-ascii?Q?i3aLl9MSEOlkzGfD2TNEVS0QOdIAc7NUw5UL2U3JdcQZbFllz6ChrVLNTzcR?=
 =?us-ascii?Q?k9u1rO+OCO8f9KWPCwyclbaC78g3b55Ie4hzu8DWWMbir3TGe/511KcWbq2f?=
 =?us-ascii?Q?idcHs140qfQYXj1fdpty/8KlsWBUNeIU6pl9IDiSdgr7oFm8aFShDMYuF28P?=
 =?us-ascii?Q?8o1hhB85gn5qe96waxMyb4AGE8SNAdYA7trsg4QcnnW/p6ir86THhTkfL4O/?=
 =?us-ascii?Q?58ye1eT0bB8AdRfypdn3MW0QU1WzhzL8NwwfK3Ti+lhuJxo0YEsaOGHZUKAv?=
 =?us-ascii?Q?rUddLzUE1vlgfJHx7KCTiTAdfQAgR4tP4KqUaoUgoNbnv7S4DrZHVQd9z+rs?=
 =?us-ascii?Q?C84oz+sAEjNCUSQ2tVFsXZ09Gfmn/U9VfjyKzpEnLNCgcxZbPM0TdFOl+Yb/?=
 =?us-ascii?Q?i+Io/R6lE4mglgEj9RmpqgSh2/K5dpL5OLkdSxpkKTzCy32tazSahXCrZGF0?=
 =?us-ascii?Q?Hgs0YDSJggcyL0jy5e3obxBXamrQLXkdoRwtZbq40jWy3ehTKzHUf2hEZRBf?=
 =?us-ascii?Q?EVElvqdeskAETM64qqvZsDH9FnHNOj1jEO/hD2QkZ3PovQyhnm288n0cmPyQ?=
 =?us-ascii?Q?BJvJLugyzgQrn/A81LZWAkgzv1ZjsVRyvFdqYLAuIF08NV4PIvuWmTa2KVuo?=
 =?us-ascii?Q?pGKmcnilpL+jyU4J9D/rf9MMpNce22rdklDOOAv1GVq5lIKj1pPE9c0ecDXW?=
 =?us-ascii?Q?/rkpp9O7Q6mePr9VRIldUrcmdhR+KGvW+5lQpGL4c6fq664Df1Xhp+V8rvV3?=
 =?us-ascii?Q?8/7hfwHa/+sscyj9ZyF35WxwomyWP1NheCcu0foU+IDFXD2dnYFpTxnOTSDR?=
 =?us-ascii?Q?qAn2Iwsx8qDOSyTq6DyO46jR59wpK/6niIS1DO9apiPLr/rQ/3NIr/WjFkwq?=
 =?us-ascii?Q?yAkRL1K4eU0MpQgaCqqxbEdK35MsjVclSrUyY5vuGGqlR8VlUATvSxro6+qP?=
 =?us-ascii?Q?KcpRFfCPL7lme5bP0/CkonekpetJZhkCfM3djmd5A/NzsBPUCcHB2qADt92J?=
 =?us-ascii?Q?QKeEB6iKeGGeL4i/66llBaqAMC5xxGpilRaT84sTvJKHLgflTQOaYIF0dZKy?=
 =?us-ascii?Q?RWLcK5CcwycGakIu2VF3g5a0djTeNUMddBXTa5rcvyz7ZXvGaHeHVRcVDXtr?=
 =?us-ascii?Q?kL2CQAmTdcn6nwsj7Q8EWA9qXXUncVo3hzgb+vdEKmrok28WTp8Ajz6XLkQL?=
 =?us-ascii?Q?zlTUjjYkQfTPBOhfnI7ARKb8b1H8DmnWy1Dj6/Dl2TmFHB4XPkCwqtYCiOtY?=
 =?us-ascii?Q?JMSvAt7aQ3Yqy6FvdsqsqPieWnyV9eZSRBGH5wKUc420pcV8lEvw+uidWODX?=
 =?us-ascii?Q?4uhqk7xSIINtd5XALD6318Hj3gqTptLH/EVAv/4JLNjaSa9LxKYRXIndfMSC?=
 =?us-ascii?Q?pg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d73574-c343-4265-314b-08dd70188e90
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 05:54:53.0947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qc7fo70MYilOf4qHfW03P+6sfwggG4LOWEKDfA88p7FXrVinr68TMpyXlUIDRHHfznA0sCI5GO/kIkgH0XjYPGeFRt4Du0n9DCIveAohkT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8036
X-Proofpoint-GUID: ENtxXt0Xn8J3u9wxVXBejro0QmauILEf
X-Proofpoint-ORIG-GUID: ENtxXt0Xn8J3u9wxVXBejro0QmauILEf
X-Authority-Analysis: v=2.4 cv=RNizH5i+ c=1 sm=1 tr=0 ts=67ea2e30 cx=c_pps a=p6j+uggflNHdUAyuNTtjyw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=2ekUlhpUPfvdi_zIjIEA:9 a=5jj6Z5E1gPFHsPOh:21 a=42jQ_h8IXvAA:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_02,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503310040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 05:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213936

From: Yash Shinde <Yash.Shinde@windriver.com>

Rust stable version updated to 1.85.1
https://blog.rust-lang.org/2025/03/18/Rust-1.85.1.html

Dropped patches:
downgrade-bootstrap-cc.patch since it's merged with v1.85.1.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../rust/{cargo_1.85.0.bb => cargo_1.85.1.bb} |  0
 .../rust/files/downgrade-bootstrap-cc.patch   | 41 -------------------
 ...ibstd-rs_1.85.0.bb => libstd-rs_1.85.1.bb} |  0
 ....85.0.bb => rust-cross-canadian_1.85.1.bb} |  0
 ...ust-llvm_1.85.0.bb => rust-llvm_1.85.1.bb} |  0
 meta/recipes-devtools/rust/rust-source.inc    |  3 +-
 .../rust/{rust_1.85.0.bb => rust_1.85.1.bb}   |  0
 8 files changed, 2 insertions(+), 44 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.85.0.bb => cargo_1.85.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/rust/files/downgrade-bootstrap-cc.patch
 rename meta/recipes-devtools/rust/{libstd-rs_1.85.0.bb => libstd-rs_1.85.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.85.0.bb => rust-cross-canadian_1.85.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.85.0.bb => rust-llvm_1.85.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.85.0.bb => rust_1.85.1.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 6d6c146284..a3b3df2afa 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "14.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 GLIBCVERSION ?= "2.41%"
-RUSTVERSION ?= "1.85.0%"
+RUSTVERSION ?= "1.85.1%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/rust/cargo_1.85.0.bb b/meta/recipes-devtools/rust/cargo_1.85.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.85.0.bb
rename to meta/recipes-devtools/rust/cargo_1.85.1.bb
diff --git a/meta/recipes-devtools/rust/files/downgrade-bootstrap-cc.patch b/meta/recipes-devtools/rust/files/downgrade-bootstrap-cc.patch
deleted file mode 100644
index 3ae68720f9..0000000000
--- a/meta/recipes-devtools/rust/files/downgrade-bootstrap-cc.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Downgrade bootstrap cc version
-
-In rust v1.85.0, the upgraded cc version causes bootstrap
-to fail on custom targets. Downgrading the cc version fixes
-the error. This commit is merged with v1.85.1 and the patch
-can be dropped when upgraded to it.
-
-Upstream-Status: Backport [https://github.com/rust-lang/rust/pull/137460/commits/e4ca11f87ffca8c63aa56d45b46e62b6acc58bd7]
-
-Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
-diff --git a/src/bootstrap/Cargo.lock b/src/bootstrap/Cargo.lock
-index a47f3af60cb..890e64e2bab 100644
---- a/src/bootstrap/Cargo.lock
-+++ b/src/bootstrap/Cargo.lock
-@@ -88,9 +88,9 @@ dependencies = [
-
- [[package]]
- name = "cc"
--version = "1.2.0"
-+version = "1.1.22"
- source = "registry+https://github.com/rust-lang/crates.io-index"
--checksum = "1aeb932158bd710538c73702db6945cb68a8fb08c519e6e12706b94263b36db8"
-+checksum = "9540e661f81799159abee814118cc139a2004b3a3aa3ea37724a1b66530b90e0"
- dependencies = [
-  "shlex",
- ]
-diff --git a/src/bootstrap/Cargo.toml b/src/bootstrap/Cargo.toml
-index ed51862390d..2c1d85b01e6 100644
---- a/src/bootstrap/Cargo.toml
-+++ b/src/bootstrap/Cargo.toml
-@@ -37,7 +37,9 @@ test = false
- # Most of the time updating these dependencies requires modifications to the
- # bootstrap codebase(e.g., https://github.com/rust-lang/rust/issues/124565);
- # otherwise, some targets will fail. That's why these dependencies are explicitly pinned.
--cc = "=1.2.0"
-+#
-+# Do not upgrade this crate unless https://github.com/rust-lang/cc-rs/issues/1317 is fixed.
-+cc = "=1.1.22"
- cmake = "=0.1.48"
-
- build_helper = { path = "../build_helper" }
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.85.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.85.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.85.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.85.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.85.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.85.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.85.1.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.85.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.85.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index e07055882c..8400a4875d 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -8,9 +8,8 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=${RUSTSRC} \
             file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
             file://Zdual-proc-macros-additional-check.patch;patchdir=${RUSTSRC} \
-            file://downgrade-bootstrap-cc.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "d542c397217b5ba5bac7eb274f5ca62d031f61842c3ba4cc5328c709c38ea1e7"
+SRC_URI[rust.sha256sum] = "b1fbf809efe9f036939401e142631c201a53bcf43ec1696bd9f5290ba236a266"
 
 RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.85.0.bb b/meta/recipes-devtools/rust/rust_1.85.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.85.0.bb
rename to meta/recipes-devtools/rust/rust_1.85.1.bb
-- 
2.43.0


