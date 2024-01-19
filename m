Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065CFC47DD3
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 15:09:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.24486.1705676987599807480
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 07:09:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=h59uWVpi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=174893ae64=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40JAU8Xa025621
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 07:09:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=8QPeR3eyFpU+9miBZ4jFJVxfyTGv8IA0sugOCRwMwSc=; b=
	h59uWVpiH8BrycI6Pd/adBpEV18CQei8OOo6hrqRUqnMBDUXNPos8H1kHNHDWjeJ
	fy5Y2ql5naobOwlXOFAWIKaetUBJ7bcYSBZOVbGGJhOimZL5R8t8JCS+rslfUIbQ
	y4KpYWJNoSj3FoKNZIudRlo2npsnQXlY+s4BJqjgksMQxS3G/flTKw86gKtIvdYd
	u260u5hSEpRo5a2TspgFmlomcGljE8gxg0CacnXma7J0MfgVr9yiTOJwyRR54cLw
	JgT6vvnKVEZSFc99gJeYzXpdWojt8esM72ckdIEygQM0WVZxR+00oF7FyhbjtvZs
	RH/0yt2+YONQhY/sqtOpew==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkpp46w0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 07:09:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMjciKORn6roWspWfKwR453Fcf7jxnE28gfVU/BufUwWEjrRxXd4I6+p85CpoDtOoVeA7S3+2aKPuIt6yWFeSyBsIKYZ9USJ4j3ycJx/naZVEs9AMkPL/O9a0lboQJ2IfyXSU4jb3kylbzGQAMo4SAsHgEkYweyvqOMFUvPhsrqwqzQEB7wtnYk4w6ZxMDhD73I4WzVmZzCu22+heHWRqGieJ/EiBRp+eo9/Ag20LInHhB7dSM5M+n88jriPD0J3E2sA0O/YlSRXwsKGlCrANVUC11gmQB6Q48bbsSjGaMyA0rC5hXTigSkiJff/Rjzt/ul+MuDQtQTCPIAmz1rflg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QPeR3eyFpU+9miBZ4jFJVxfyTGv8IA0sugOCRwMwSc=;
 b=WHWIGvN7OCpv4jeD4KRitNLJfQn8zxmv2NgBgVGVcu5NrCg6bH5zK42B2d8ku5ilWj5jV7jretNIkQkryfCn1mfh/7e8Gkd7+n+pPgdQwBPve4uE19MxwURzn5wO95y8oeyPYbKjERhyv8OxNX5avOztAKHqOryK1DQxua1S7iuaxbHvq46t/fCmD++Fx2tHwnXF+1+sKFQNPPOMbU3qIe+1VecbXeQW60YMC++fV9UZfVlPwx+1B+8WzX4AqeOUq+2ePwWcPgLtR2nuw0lD5KQxf2kmBmIhlDZntR43/0CCQqmRBQpX2NGyoy78Fznl5gywU30JzkXmLEI7ZDiJUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM4PR11MB6405.namprd11.prod.outlook.com (2603:10b6:8:b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.26; Fri, 19 Jan
 2024 15:09:41 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 15:09:41 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v2 2/5] rust: detect user-specified custom targets in compiletest
Date: Fri, 19 Jan 2024 07:09:04 -0800
Message-ID: <20240119150907.3840110-2-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240119150907.3840110-1-Yash.Shinde@windriver.com>
References: <20240119150907.3840110-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::19) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DM4PR11MB6405:EE_
X-MS-Office365-Filtering-Correlation-Id: c01b11ba-2dac-46e3-e86a-08dc1900a941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S7OI/oNyKzg24fImjqyfpaT5KUwNSGLtl2zHlgNLmCmcBM/Na0b0DqXfssIL77/IbtxYNJDd3xur0iN+VxXG8AEE5Pu8vKc6eOqryNsThltmpKxB/wqYEpF98aj1sG5VCAv2zo7OdX6kkFZbQA5Rx9gNsZ9BdX+7JEjaA5u+mm7tMcbxV+8nmfrEj+KuCH1RfbCAIA4TP/K5qdj+oNf5P8wEGi8R+/F4g+rZ3NIw5nQiYTLWtwLWzqfGzBHxnbQ+qblQ+5hsvwJf5cYSWODoh1p2AtQCzB0JBINvs14jENEKTuxBZGBR8e3JBZhaa+eeSwffWYpwacY/2zw86KPtyLfK2dB4YEdmM+RKHcUf/B1qO/vt+Wf9D3HZVk49v5LjPEONV9BGPk06OXzAxHq95SJ62J+pgwUQML9RybLu9aQd0JaO2EnHH02/IJSAY8eo8VIvvi5fqcolyi8Br0QP9dhJ8Izt0j2GE7yx1EBTs41U/VTIcRfnuwiBN0gmGs20qRzINFRbtb1jgkHveZgeWk8c7yeFmaGl7QEkOvwRiWFn/sRW6SYLqf6vNQQUUPV8TsMRWdzjVRS0HZWN+u1mZXUOIRsKf6TCeNL/WnqhyMg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39850400004)(346002)(136003)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(26005)(1076003)(107886003)(83380400001)(478600001)(2616005)(38100700002)(41300700001)(8936002)(8676002)(66476007)(6916009)(316002)(5660300002)(2906002)(66946007)(66556008)(4326008)(6666004)(6506007)(9686003)(52116002)(6512007)(6486002)(36756003)(38350700005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4hmbGV4YAXBXsqEUyxSiWRTbh8Meeb70+uG/uHm4O9TieCQTCtvWhXZJs9gr?=
 =?us-ascii?Q?c/9g1d8cMZEfstMe/ZM4xEpFTF/fwN1+7YRDJq3UgzWJCo/QICD9FuDtyaAw?=
 =?us-ascii?Q?Q3ksZwU9S6wCLeoqXP5WY3juSbbAl3N9NgXF+zni3BaYLt26rcoO0HqyxYPk?=
 =?us-ascii?Q?Ru/v6B3YY6PTvhJcxeSTAK8pAE++Gvi8mCJ/LLZ3sT9RuTkdGUlgPTnNABa5?=
 =?us-ascii?Q?/5/tKQxrjbXi7MLxb66slhce/7uWH8DHLO7hhzVfZ3Zz2KwcbfUQYT7Yn20M?=
 =?us-ascii?Q?MHlmewCZH+vLPrejzDSt5D/wyrLtuR173tTrlxbAISTYDDAB1c6kEqnKVvFW?=
 =?us-ascii?Q?CsgVvsx7IHKuR40i5iuuXgUXpBAPYVjjDQ9zbmgoqKq5t91Z1+Hb13VIj/nq?=
 =?us-ascii?Q?Li5t61iglLmE5x1h8Nek5nOosev95djBJ9yoSOaSnAn7ltA1YD3pXsUCHJrh?=
 =?us-ascii?Q?GgQR7rBUFhIDzKSMcMwcrvkfPxgBAPcYvIvhWFpY75lgbJAochtvKKJ9eZF/?=
 =?us-ascii?Q?WSugMfGB0k2Hl80SM0Xxoheg1eeO050I+4pRAKE2L3PwpirmokoSinLi/UuK?=
 =?us-ascii?Q?BbAitoBphPlz20CMq0rmmDXFEX5VfwzRKuUXGQPqpunTIkKUfErSiIZ+2t1p?=
 =?us-ascii?Q?hUVEE0ZyYfjb4cVrg+ZlDmvtmfj+OKdcFGmjPp/r5tHBMlXVqUWMf/3gpmCK?=
 =?us-ascii?Q?ERHD4o8FEhuWWXsjDrYEf8zFPU27pZOUskyLgyC5kGLGz2h+MIvtzxyNxk7m?=
 =?us-ascii?Q?8oLRJLL5rsi0e9Ny+d/dBuJkEvZxzniApgGuZVmpsUfz6jp2EzxRJo/8gDjp?=
 =?us-ascii?Q?EQHQGXDBni2JBx6ZyiVfQdI8lamAzWCYP0melvSXbPSUrMizYfuS1AH+IOyi?=
 =?us-ascii?Q?IsRh9ZvH8fwNvZzpK2rAJ5yLXOljpaNtP+urfOxqmbZhouBKz1sq2eBXlnMO?=
 =?us-ascii?Q?wjBdVevc6ZJYmOy1/X8zSfBtb/AnuvfQWvZe16/2e9pmkkVQIS2UMuLEYek8?=
 =?us-ascii?Q?n0NnyKH+XTKxEKya0mLYCuTB73Y0nrDtFTwjJYjkl/gQKZSI0LLEXG6clWMb?=
 =?us-ascii?Q?nuSJBOeXPmX2LFAmbaInsj9sRq0OjdQqI/AGYOvx2uy5tXsH0vtj2YH3Dpf+?=
 =?us-ascii?Q?ucg+nJ7ovORktFGxlPZdiEOReDSOnHKqaequkWGVN1chF3O6132ZceEUirgj?=
 =?us-ascii?Q?pbPIHIsFQmblCFXWSXTNQ6mwNxZaclueM3wxRFhaXPIXQuZ8qlMAbL1XPzdA?=
 =?us-ascii?Q?cVDcRPIrQed0VFmeg8WGOtOGnEQs4cJ9nsTxWAHySaB8g7Y5QI8e7E3VAf3X?=
 =?us-ascii?Q?9e++xzhQn8xXbA5Xuk2MbATnhh+gL6pl2PT8e5dztZhWdrwhrqX+78f30Plr?=
 =?us-ascii?Q?cvwEKbY5H6C51NWZ2WRUDccW+GwzdxuSMWGmCbjA7xr6rE89RtJMZyRV+/7x?=
 =?us-ascii?Q?neUIDNtJBhgv9EqFojoNZ0AntN5OQuZ2j9QPwbHFDMBEmLdhD3T2/GaYEQjH?=
 =?us-ascii?Q?he3vnrFuLnVrWU2pZS/yXw6O5Lv3en5DQcwjEGL2thF/3jFrnyZhsSEKa+Yk?=
 =?us-ascii?Q?xkmu3bQBhDjhHEYidRzlByr6ButKx6pV8n3nJeaYGj1MFSFgCtP560dPjbo9?=
 =?us-ascii?Q?VA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c01b11ba-2dac-46e3-e86a-08dc1900a941
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 15:09:41.1370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EHkmsTDWYaSNeOApzkovyHz2vZgohTyOEnK7OmXwhglccahSbJ97Lp/f3Ih4zFPEuiu/eSVkn8/c1IjiEdnP8LD2iEbGAJJvTlrG4Xkj42s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6405
X-Proofpoint-GUID: xgHELAZpPOiTm4LLe_E5PsIzDkRgPgbf
X-Proofpoint-ORIG-GUID: xgHELAZpPOiTm4LLe_E5PsIzDkRgPgbf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_08,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401190083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 15:09:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194054

From: Yash Shinde <Yash.Shinde@windriver.com>

Fixes: thread 'main' panicked at 'failed to gather the target spec
       for '<arch>-unknown-linux-gnu', synthetic_targets.rs:66:9

Detect and fetch custom target configurations when rustc is
bootstrapped in rust oe-selftest.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../rust/files/custom-target-cfg.patch        | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/custom-target-cfg.patch

diff --git a/meta/recipes-devtools/rust/files/custom-target-cfg.patch b/meta/recipes-devtools/rust/files/custom-target-cfg.patch
new file mode 100644
index 0000000000..15a7f252cc
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/custom-target-cfg.patch
@@ -0,0 +1,90 @@
+Detect and fetch custom target configurations when rustc is
+bootstrapped in rust oe-selftest.
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/pull/119619/commits/26c71cbcf1a9bce6ceb962d753c467d098f63cf6]
+
+Signed-off-by: onur-ozkan <work@onurozkan.dev>
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+diff --git a/src/tools/compiletest/src/common.rs b/src/tools/compiletest/src/common.rs
+index e85f6319936..c45c0b3c652 100644
+--- a/src/tools/compiletest/src/common.rs
++++ b/src/tools/compiletest/src/common.rs
+@@ -479,6 +479,7 @@ fn new(config: &Config) -> TargetCfgs {
+         let mut targets: HashMap<String, TargetCfg> = serde_json::from_str(&rustc_output(
+             config,
+             &["--print=all-target-specs-json", "-Zunstable-options"],
++            Default::default(),
+         ))
+         .unwrap();
+
+@@ -491,16 +492,33 @@ fn new(config: &Config) -> TargetCfgs {
+         let mut all_families = HashSet::new();
+         let mut all_pointer_widths = HashSet::new();
+
+-        // Handle custom target specs, which are not included in `--print=all-target-specs-json`.
+-        if config.target.ends_with(".json") {
+-            targets.insert(
+-                config.target.clone(),
+-                serde_json::from_str(&rustc_output(
+-                    config,
+-                    &["--print=target-spec-json", "-Zunstable-options", "--target", &config.target],
+-                ))
+-                .unwrap(),
+-            );
++        // If current target is not included in the `--print=all-target-specs-json` output,
++        // we check whether it is a custom target from the user or a synthetic target from bootstrap.
++        if !targets.contains_key(&config.target) {
++            let mut envs: HashMap<String, String> = HashMap::new();
++
++            if let Ok(t) = std::env::var("RUST_TARGET_PATH") {
++                envs.insert("RUST_TARGET_PATH".into(), t);
++            }
++
++            // This returns false only when the target is neither a synthetic target
++            // nor a custom target from the user, indicating it is most likely invalid.
++            if config.target.ends_with(".json") || !envs.is_empty() {
++                targets.insert(
++                    config.target.clone(),
++                    serde_json::from_str(&rustc_output(
++                        config,
++                        &[
++                            "--print=target-spec-json",
++                            "-Zunstable-options",
++                            "--target",
++                            &config.target,
++                        ],
++                        envs,
++                    ))
++                    .unwrap(),
++                );
++            }
+         }
+
+         for (target, cfg) in targets.iter() {
+@@ -545,7 +563,9 @@ fn get_current_target_config(
+         // code below extracts them from `--print=cfg`: make sure to only override fields that can
+         // actually be changed with `-C` flags.
+         for config in
+-            rustc_output(config, &["--print=cfg", "--target", &config.target]).trim().lines()
++            rustc_output(config, &["--print=cfg", "--target", &config.target], Default::default())
++                .trim()
++                .lines()
+         {
+             let (name, value) = config
+                 .split_once("=\"")
+@@ -624,11 +644,12 @@ pub enum Endian {
+     Big,
+ }
+
+-fn rustc_output(config: &Config, args: &[&str]) -> String {
++fn rustc_output(config: &Config, args: &[&str], envs: HashMap<String, String>) -> String {
+     let mut command = Command::new(&config.rustc_path);
+     add_dylib_path(&mut command, iter::once(&config.compile_lib_path));
+     command.args(&config.target_rustcflags).args(args);
+     command.env("RUSTC_BOOTSTRAP", "1");
++    command.envs(envs);
+
+     let output = match command.output() {
+         Ok(output) => output,
+
-- 
2.43.0


