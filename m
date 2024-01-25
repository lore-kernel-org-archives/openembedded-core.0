Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A99AC48285
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 13:17:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17215.1706188619542035023
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 05:16:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FXH28RoN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=17541b5c6f=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40PBvf7U032612
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 13:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=8QPeR3eyFpU+9miBZ4jFJVxfyTGv8IA0sugOCRwMwSc=; b=
	FXH28RoNwFFkpa8a64fQB2eAgpTVsIrYM0qEiAXoL2MySabirYbLf3RmJXAsmBfk
	NjsRBot7cKLFrA2y9Pz9pSq4pnUG7XkCzIDdeVNHPyqK1ELEwH3nARv4AUzSBDEI
	mN5o0zUfrfdusVcWQe54U4W6MfMtHWzO+rVwWQA/IlrVRNhFMYvAc+BCYx9cLDt6
	D1oy4ccbLfBGcXgCQJn9Em7AByyit3gIuZttn7su7cOqkcBtViYTZ94MiG1C+KrO
	5IIQx3g8+jM6AiNgJ0yfLh3qxtzt/tkXzoPGfbq6pC//akoDbxw5C0NzDwNY+mZi
	SwwgfsWhK1YHJeznqM3Nng==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vucv20hmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 13:16:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9D8DLPypnUTgjGh679cXrONGy+oDfmorcThk7L9s1fjjA5v0fu5l9FidTz44nj64q/WnOOBIdD0J9H32/RdenJWhzZbAH0zOLU52d7IoItmgqzOT0YBDk8jDyAJRuGMkBHO4AGztKfSMWUR/wWy7tTvHwZJNREbYdfze3EigGb1EFbr2jiQEUdw79FZtyzl3aqtFAcfeMfyatZFHwq3imcb9FyWYHnLC95VI64ViEESX18PznNkwoQtpqg3GhH3iYXL7oV8yuEg23Skq8lmQP10Suqg08vK8dFuFf6gdCyRCEnVdSpfDycx5puRdLgAjSZeO9s4JL8eTPZQbyCBAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QPeR3eyFpU+9miBZ4jFJVxfyTGv8IA0sugOCRwMwSc=;
 b=lN2S0rMHbXGEKsTXP3RKYuFCtC4C2+Kitb2NxWGvMWaPmZ29XOtgJKGNIzWEt0xc1D3ioL4znqvWYbPLw13Gl5hxt3it3o0X9bsCatckCk4y53Qc+jUuxHw76+PI5GVphly3Ho+LM/HQ0nWIs3TanyUMCHwhsQD2qHQrOqFS2I4Txq3GkXiICeTgBf4HvOAiNErcWxjBol2+sD0Uzk8GILw11f0aPhGJhD4WAKqjmSF6b63qgAbyu6qW5zSMyCSXvcpx93pd9+jpIsOPDitSbjuNF+IgnidRbmZtkuqmNTlOn/m8WHXmSbgjHyUKUMwBlgDgeLsHiMzXzNc9sHW+1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH3PR11MB7179.namprd11.prod.outlook.com (2603:10b6:610:142::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Thu, 25 Jan
 2024 13:16:56 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7228.022; Thu, 25 Jan 2024
 13:16:56 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v4 2/7] rust: detect user-specified custom targets in compiletest
Date: Thu, 25 Jan 2024 05:15:58 -0800
Message-ID: <20240125131603.2769496-2-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125131603.2769496-1-Yash.Shinde@windriver.com>
References: <20240125131603.2769496-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0048.namprd07.prod.outlook.com
 (2603:10b6:a03:60::25) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CH3PR11MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: d46789c5-0641-4d3f-927a-08dc1da7e780
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZbS21bZlUwpHYgStm1fmLk2j06wFfdIDUulIBFDYFi7QfuxSyHVRdumbCmMllQPuNPS9j8dY38BI6vIL7IdP5MSe4iYQk2fCz4nb1S7jKVkGhkA0lirtxgZqXXAi+Ana+gWC2gi18RAg+WON40sA6kXvrmsO4LKii4Yu/gkudx95KLFh3s92v5+KV2I8lX3+ndkykfEL6imF950YUHfcEV08puHt4daSf/uJVHLlwqw+EEeeC5fUyQ7TtyhHrzrEn0KjgEsM1FrlbIcCF/IgwnaEmRvmOfaKIVw+56BkALv3EPR+CuZdlKF/GK8wu73iPO6kgv5qe70ePIvubfws72lDpL6ZTgd+yNjkmQqwFMaDk5LerlPfBg9uHtAX2dmrwHxr6r+H/kuv8TVD8OS2VpK/Fs/RrqcLDovcxb/qNVPeXRuaxpQhlEXKiqgjg/YwCF0qO731W1DHNn5czdYIJWl4PrZ07dJL7o1HGme/Y+suTJKigjaZH7cipcHFgeIXHveUeFGzPL85Ph42qnjwIhIryBtH/QwiI0n32pC9EB9NyVac1J4WlevHsPdAv41C8VFfLBv4s1FHWQybhxYktHLtzLjRfknrRpfctGOM1Ps=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(136003)(346002)(396003)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(41300700001)(9686003)(6512007)(26005)(2616005)(1076003)(107886003)(38100700002)(8676002)(8936002)(4326008)(5660300002)(478600001)(52116002)(6486002)(6506007)(2906002)(66476007)(66556008)(66946007)(6916009)(316002)(86362001)(38350700005)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BFmYefHP03t1Jpw5TmnIvxnyRSiRi7HdPksPwC/pQaMlp0QWsr0jmx4rz8nK?=
 =?us-ascii?Q?6Lmb/O4q30lRPGitW3692wZMs7Xt6ThM25xdaeFzhMI//qJMH3uLx3gpNd4w?=
 =?us-ascii?Q?XdBbXR5ZHUFOoHeT5m5r/XeCOOVrC3VjYw5ArOcybH4KKVwdFBu1s9VEpNRm?=
 =?us-ascii?Q?YtcEeRV3aRBnGYSDUn7wWdd/3beMQz9wBfCW6mMzXtjboyw1g97a7kpeCtEO?=
 =?us-ascii?Q?1aOts1cJ7Q+A+3pqwPJAJEGRPZ8e3q2+zxq+e/b05jrYRyK68v1n87qCL3yu?=
 =?us-ascii?Q?XjrRCiQZpSD3fzo/E90j4Qg9kzclo7bM70PPmqzm328mql2+RKL+wzfCGI4Y?=
 =?us-ascii?Q?otUFGd4vI/fBhYpDfMW/DjLWHnaJwFcG/Dv9IizQbBBLflmFgZbu5QDzBGFs?=
 =?us-ascii?Q?ePNNNiiDau5S9wdzpzvl/15GoHtp26G/ob9X2vse43M6gBa0+zW34aqkV5vh?=
 =?us-ascii?Q?PZM0CAN1hPUqDyYuoyBZpC4zTkcGYVAelbi4zc1Y70m2DkbJ4boubvfDHcMe?=
 =?us-ascii?Q?Y24IrFUM1WJDIJlEvHYhEqlmVBjiZnfLjbvql9uutbgwbRMo4X4WX7w2SYnt?=
 =?us-ascii?Q?aYt2uWBhIuqBfMkS1AW3TdwuzskPViLDi5MZQDJEmv/azblHKgFq7i9BW+gx?=
 =?us-ascii?Q?ZlcRHHpwsEgIiir7Y+mKr+2XaUn92D+ZtpbrN4xAjGqanLD9XvrOhd53BmvD?=
 =?us-ascii?Q?2S331bVhMQGufCp4HHa45Bg4DYTntNavAeYJbgh/tsfxTmrj2k8Ao0Dq6E6P?=
 =?us-ascii?Q?yChJITEHcQum/nbZc02eNv/pEuCAXUs7xdksvPcJKJc2E0XeYh5h/rqpWzfX?=
 =?us-ascii?Q?4cUGUCd+WCYB2eC2A24/tSJ0jlcXlYaxAsN2NbpqC5BW49a7Zg0+i+VWYtDm?=
 =?us-ascii?Q?zjhE5UWgkhxNiRJGbO0+AGWbL2PXRl0RbuCVKNHL+Z93nCgbZ2Bhob+gdAjc?=
 =?us-ascii?Q?gShjFHRlnVb/FuBPVq+qkLvDuYI5YE2dkNmFg8Aaud2Vnl3D3i9kPkOeFlIB?=
 =?us-ascii?Q?9SrSt2PF6nps8SlObZ4qbYeJbnFBl9n+pkzswsjNS40Aouj/C0N6Znr9r+hj?=
 =?us-ascii?Q?DgF4Djnyq7bG5cgnLVIyzVsu32sU83h+fKSVF1rpY9B8yfbnq7o3P08+2vCY?=
 =?us-ascii?Q?ogz9Qqu7dn7q9Qb4P7mujNeUUbUpbCh483WQ993tMRUtbPc6bg7+7BdmQHaa?=
 =?us-ascii?Q?IcHhiyhPG6I3z4XIIxioG814BP0VQzfjYVRagfYSVIAe2mKsMMQ1+MDpflh5?=
 =?us-ascii?Q?LltbIQkDCBPFf3YTpEZkOdGijwoxosWJEj8Qe4fZhAYN7IrFXBW9oVogF8oW?=
 =?us-ascii?Q?ExsAgYIsrZL2DfYb9cyymiPZuTeyryl2YbMRFYPwDyncePqkRfHoR7sHDdoB?=
 =?us-ascii?Q?plbzPWtUsAzvQ/+vSjVhoC2WPWvgaC/U4rkhW/KJPnB10n3l4HgHuiZOiaG/?=
 =?us-ascii?Q?HLh+APKYEvghHy281jmnPxmVsaeKj2ytS9i8C8rPcU+RXMDzhrqxz8TxJ/Do?=
 =?us-ascii?Q?mXgrH52WyFwNsqgeu7Wm3O6/47VGJX6gj42AqWSXk5sLJC9GPATjch8o1bEQ?=
 =?us-ascii?Q?gXhOa4K/XiZ8xzwpUJ6YnjKYPnA7+6XPjFwob77majIA71CWq/rY3F/RMy3a?=
 =?us-ascii?Q?Vw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d46789c5-0641-4d3f-927a-08dc1da7e780
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 13:16:56.2366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AwPS62STrjEIbCEePeIbtIY4YszD9V8JiYllR7bRcSjbsn68cqyRmF5KjJg1MoF3nVrz6OmMmrRx9cU4Zz7trwI3PGJyOfc/jT+6z+pXXgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7179
X-Proofpoint-GUID: q8Imakc6JRzsegwlCjQFdCyABYvxyNRY
X-Proofpoint-ORIG-GUID: q8Imakc6JRzsegwlCjQFdCyABYvxyNRY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_08,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 bulkscore=0 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401250092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 13:17:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194321

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


