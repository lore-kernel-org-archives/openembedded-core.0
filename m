Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF98C47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 08:10:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7163.1705997438930387744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 00:10:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pHO9TIPB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=175275645d=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40MCfXe5020788
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=j1Fhkxksf7PeZIOCJ377q5I1PyOOuXUqC7eS4L71cts=; b=
	pHO9TIPBzTmXwhET9SC2LiEoX0tTf8aGspnFMHBdyLapkBy2ZcIhgLzthuZ/zFg1
	eombxMVsdJTTMZJwkna4kuRMRK1RNQdYqiACUpR1vErSFpNc+81ZeecDxdJ4W218
	drwr2rAiJrsGzy4/rqdizU72ZVhnDAG8MXMkESpZIkMoui0Y5wEs4/ACPzPZy9zO
	K1DbMqDSLIyBPdcRc9o7aG7lRVUCIIEPhgqlKe3VK7b/Btm+s5SaHdTclBIckTLr
	VFylfGHa31zDaX72P2Er56gRQDEFTnBq3oET5sotuYViE8HRTrGtqoOMOuHbTUCa
	omUH+dxyWkypnLRDXnDmmw==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vr3cyk5sr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:10:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQt/NlUol+YeyS1g0U3B3wZ+9iAiOD9vLn1iE2RxMxY/Nm4SyNsaXx8idz36g15k6tQvS84+Cr74koy5Cdyk2guEmZzz53pb7wAl3SLV1ruVv+Z7YhNmdJLk1IJPVFhiwuvpK8BQp+0/u8z4EtaCbUD3K6D9QCeqILRp2B4Nii3mKkKD/Y/ix+tdjy0C7XvEAfiJUfuyVn441FQrT37q8hlwG5LUEiWe5w5tSlZp/zT8jA8+4uYEO8zzBrQXGs4RiZrm5vA+pm9xtQ+lZ+I1vW5DmFPuJ4HtdZSBndHiWeQm/7j7tUsurz4AdnZjmAJjTD1U5w+rDPW+hooBRk0iNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1Fhkxksf7PeZIOCJ377q5I1PyOOuXUqC7eS4L71cts=;
 b=NRyuNM5havXPmbxemr32qA/+knMqCouTlh1SrxSx4SAp+qptz6gGJot4JeiDN0Q8/MhR7Hsn/CfhQHK7WiZAs4mh7hJNZC4nRmftlK+c53IBLrtUP314Q1moWijyv4otzdp1CpSZ5Ugy4SHNfagc05xCp5l8gRTEudPycbnYpGlQrM/i7MOQsHd8XurtUy6MRan1PQ7E5ce1feD8m6C23ZBI/Q9mwY+eW1rPs81LPBMmVWXLdSFeXuXmqpK1zI9uRimm3+Ko7JqBXsf8/QBPiy7rGTlcyjUvIWDmg03JtD3PHsdGTEtrcdhQ1fp82SW4ZdZUHdpnVHFt33jcCGfPJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH3PR11MB8344.namprd11.prod.outlook.com (2603:10b6:610:17f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 08:10:35 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.033; Tue, 23 Jan 2024
 08:10:35 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v3 2/7] rust: detect user-specified custom targets in compiletest
Date: Tue, 23 Jan 2024 00:10:01 -0800
Message-ID: <20240123081006.3310715-2-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123081006.3310715-1-Yash.Shinde@windriver.com>
References: <20240123081006.3310715-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::20) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CH3PR11MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: e3fed05b-66eb-4256-3c44-08dc1beac6fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Mwyv9jnwxFzkzHuJu9HSOerxXZx/ov6f1ASLT+VxDOUNDV1dBQVyquGPkL6wF8dSgrOL9WnTiVqcjw93ms0IL3F4om2H4JMzM3Z7EcSGTuW22q4HVJ1hC/fULTCqEuqMvCcTCJ3AOMFoMVbwbjIxNsEc3Vi4P4eKSRQ8Y/tsJFrxilm0tV6pucB3wuqSCv5xg/ytowk/3fcx5jUI/Op/FWHREmD3xnAlRSlAS46VJtUags80VTX0NH+bTHfptkLPbPDrx7VX3ddH0gIOaoBs7SfxLKlHzx/wkf5zMtUNagoWOhsD9AbteLYOdTzXh3U/LsO2KuJBAtA7xmVshIZDgY76209FdCyLCXrFbqXZzQgQq2IsbiHogn1eqN+Y25tIuS8+61TxIeLU71GXN5Hld9d4XkhJnYQ6ANIXMPuK1dG8Baddv7X4NWrV+VR4Ha/nRQ4KJo+s/AgBJ10iRlJv9Oh961UgqzXNLa4i9EJZy7g437GwY5iYoF1KFDiTi9SNpLCXuos3EgqK8Z62qgvM9EWzCDxXeb3yNPPqGgNw/7lbqNujteEm17ZH//JYoTFuoDaZPG0UXNS9h7j2Icq0Vv6Ud0aEfUiUzzvIogUGtZQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(396003)(366004)(136003)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66476007)(316002)(66946007)(66556008)(6916009)(6486002)(9686003)(52116002)(6512007)(6666004)(6506007)(5660300002)(83380400001)(8676002)(26005)(1076003)(2616005)(8936002)(2906002)(38100700002)(4326008)(478600001)(36756003)(38350700005)(41300700001)(86362001)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EcHjn54OTcSUk8dTllXQiShzqYvNrhiRzVJzTamGjJ6X6HK+QSoEQhC2ryRw?=
 =?us-ascii?Q?gaIqqs5EON+V8sYH4rHmE2DjsbY1qXv/E8/FQqZODnV5eFDLq/qmzGSre0na?=
 =?us-ascii?Q?xiXRWHzcM5YUKQZ00EBF1B7M42ViM4LQTt4K5a8ZonYEQYDDs7ONzjBJnWt+?=
 =?us-ascii?Q?8BI7Sn/tHDRZmW2S6TRqChqQnGUz5gzD7JBdM0eIqh4N8VOksdRna6igoT0y?=
 =?us-ascii?Q?e+Px34deNPRraGV51iQJ46kn7rwNfjAzrS4feWlFyGacoO47erGYdpON9d6e?=
 =?us-ascii?Q?3qiuCwv41tjbb4IfJluZpjF63LOV/XSPysOv+e1DD1dENooo1l05zpi+b8w/?=
 =?us-ascii?Q?EGWmtTMSczosM8w5ZGLh6QT8QeItorOJSwbUWQ/xMbMcBpAsbAxhS9X7HiM0?=
 =?us-ascii?Q?B7TJyQbc5iaDePXthos0Nv5kKoujx4BuYgp93QXbBaJ5nlYC7RS5Qt51VCxI?=
 =?us-ascii?Q?18oLon/R+FkvDo6HlttMGC04uXBRakZYI6dD5JEzP2tkZCA/BxjWrFEdvLAn?=
 =?us-ascii?Q?K056noytbZy4fVyiXn9qCHLt9S+6OozYHTxu2d4TVLM4JcTErSqVAtGNmoW6?=
 =?us-ascii?Q?s0SgAY157lA1uNQRzfwFBoC5/y8UtfInjzoBBS8Q63fnGNVgoBYN18FU+Qbx?=
 =?us-ascii?Q?csvH7QP/iDrdzKG0avqddCObYYt8P55dhvin/XuNm1D06rbaaEtHheyo4sQZ?=
 =?us-ascii?Q?ghNSgrYKhCQYbMm3dOPeCslb/KcfXDJ50TqafXwwwfSVcIQQTok/HGSaHsRp?=
 =?us-ascii?Q?Mq9fKeVHRe2fkmtMv3VXe72IByUJAATgV7XNXH6Or+pMVG+ur/6kQUhZXoCI?=
 =?us-ascii?Q?TUwJ927C2Uarcbk6/2JwYzDIoBL/C1lcs8D5eOMyi7haSgLIfZBkC5rcOrrA?=
 =?us-ascii?Q?4azb6OP3qkMM6nASjy1XN4Ob/ci5wFhRXOz+3xt1RvGzXXgXVfYOu5/fZPTj?=
 =?us-ascii?Q?hzMh4YItnzZS3diLTHjNK1h5TNBIuaHXQhjMX92EB4aLHAvGRtDJ0gY9aBz+?=
 =?us-ascii?Q?6a6jasKFiDHrYVmFL3jOhjYwujAX/H3odGYk3zm4GHFR4gaC/eaWM2MQcGNu?=
 =?us-ascii?Q?1XpnTO75tPJVJhhVCB1qHnWoehfj6JFNWqEzlQoBAw7EixwUccn04eFRvDtw?=
 =?us-ascii?Q?mwwNx+OWACK2JZXKCMzsqCRtBszhSGWUpcgF4F9hwsBClpcm8KT7B8VrX6in?=
 =?us-ascii?Q?lqcztasvqBq1vC86Pjeh4Ihd+210SndJGwmMVG3yEmOXr8SHnTl8PwJ5hu8i?=
 =?us-ascii?Q?gI8cMUNiV8G0w4/QfeBJ8ZZeJNtIYKx7hWmFUQjc6qswqEcuYDl9cZcGKtqu?=
 =?us-ascii?Q?ZKKBQsly9yfi2zprLiPHRxqnexmht9L656YNq/QAGc1gYuHO1rSBnapS0Gev?=
 =?us-ascii?Q?9lKLZbabV65YMF8X6Yz2G93glfRlojW33DzPuaA3EAHo+sruS7RL8qbDqDin?=
 =?us-ascii?Q?aI/eXBqAXtk8E9ZGQK+rU+FU/sjyGNWZ/3w3KNJfgZPmuhBpOQkz8TXavlEM?=
 =?us-ascii?Q?W9p6sO9dgTk5RRgA5n1rVxcTK0I0kROOHKdRaBnwmMgADWtsmzZtXod7Q6Kg?=
 =?us-ascii?Q?4xk0jq67crMusQlbc7eq4J2+uj1wrt7SO6nfirPl6+4YfyldfNAOeDetYo1Q?=
 =?us-ascii?Q?tA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3fed05b-66eb-4256-3c44-08dc1beac6fd
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 08:10:35.6046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jxoSESbqrLxqyq114pwB4nQoRULI2NbCy5vToS7YXgJGW+ezx5CptHoNJYmdvWtZBA26NXyBG/jRIwGpyDfl2iiOaPs7Hcn5K3eoP8NfM1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8344
X-Proofpoint-GUID: Um52VU3jEEWcb5FXbBIqeC__LPGM-Jxu
X-Proofpoint-ORIG-GUID: Um52VU3jEEWcb5FXbBIqeC__LPGM-Jxu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_02,2024-01-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401230058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194207

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


