Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7034FC47DB7
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 13:44:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.22318.1705671870415240952
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 05:44:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=orz+Ahhz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=174893ae64=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40JC7a1k002500
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=8QPeR3eyFpU+9miBZ4jFJVxfyTGv8IA0sugOCRwMwSc=; b=
	orz+AhhzY3Lg4xU0Nz4lCYpV1XuEro8y6ts/OrMBDfRxSK81LS5FSJytuX9cQsrQ
	ri6lT0REYlHU2XNgyS/Yh9x0NXah2NLAbrFf+3TJcIBuaqlpzGLHm5vFRAFo+LX8
	ODJ0S45noLGF0hFipZ4PJiWEqUH8ADZ9E60/xu19IswVCGFCovStnZYRRyQ9qp4e
	MqsLUM+x88WCW+63qR+Il86br/hXPAWsCvvVzn9B1XPtiU/yGXS3diF2e2fUX83q
	PpQdB37uEjUeeuGvKykIXjxNzVtwo4W2OwlPsynKkIVs8AVLPaZyWip5Yc8c5l/h
	9mIaqkKDAeVSFfNKGsHe4w==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkfqxf3b6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:44:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2kc0GhGzbVuiIeKUyEYD3ueJDdXbX3Pf0Y0rYyv6rK77Itmf38g3jyB/mpjmZu0K9g3WlvuNx+CGbbcQ2mroDk/prp+RYDcuvAcYW2OKC4+lcI8fOOdQYL2B3H7TAXiV4hWRivKPmp2M8lOXMI2CNNmiMh7OgTCVtiDX38NWrfoZam5watuP9Ipaie+9lvlwyN277/ZzCLdtMg0Zt5IolkoTy/rfiU12BU2z/V62q38qr6AXT8vFPioFUjWOicmV8wUv9TJiCszhS1qqY4wCBU7mYmrb5FA8p1npQm4Rg+e4xCLF4vrm24JjHxX9ra5Ar2mHO6QtCgvGl/e9qsmBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QPeR3eyFpU+9miBZ4jFJVxfyTGv8IA0sugOCRwMwSc=;
 b=J9XvExD9HPeZU2ZhxbqEgx5d/GaoCiytvPrEeojET0GoUp/0XOZv6Wl36aKTv2IE9IRQZNky4Za445eL7idlwenpaxdKNsUTBEJVxprtyOy62S/ZtkPWIwS7c2Gqe/BILdu3Zn1XfR8EpQIw5GUb3B/3crUQzUHROgHZnd6+uFz88DbHhrsQBu7RozQ1EZJhNIYr0SrfoyoBZDlcU84r0JDcvWFNcgrDD+w4z1MHm1YFbtGnpD4nCZRzCajc51APl9ullP54TOspMhKGE5GrpJtpVx68a2VifVrsG/zBVLuTe1U+f3qCcT5hkdfjnlXHYkesqSS+76uM8HpcidnWzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SA1PR11MB8279.namprd11.prod.outlook.com (2603:10b6:806:25c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 13:44:27 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 13:44:26 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH 2/5] rust: detect user-specified custom targets in compiletest
Date: Fri, 19 Jan 2024 05:43:49 -0800
Message-ID: <20240119134352.3163178-2-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240119134352.3163178-1-Yash.Shinde@windriver.com>
References: <20240119134352.3163178-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYZPR14CA0008.namprd14.prod.outlook.com
 (2603:10b6:930:8f::26) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|SA1PR11MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: a0e659ae-6faa-4d3f-be37-08dc18f4c0df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4D7pDjSdBqiYWe063BXpUpio+5LpMIkx9HW2DhgLPaSyFShiMbyJfeEcTAWnbuTfTBpgsw1ngfjwSD82JEVdpnZnrTpTPyzJ5pW/TZQ5Kve75iWDuy4vWMsTPSichr8NU1TJJUqB5b6WAlV87PW4sbOLTPMYbpM7dp4RGWYaBM6+Rf+hz+THsR1I19CQPmujDG26RYsYedbfutxnYmCCSoRsVAdFl1srqKDtY6sJ6yMOIy9dQImM/swObSUdkj6NnWmk/ow3Cr1BX30R78W9b1YEJg5fhyOwhb3wtqUnhHr548qH8H+gD5xWtkVdY4NX0CtVe9u3e+Bc1l14q6EtCigEhGQ4e5o+R5EMTr+jZ/O6VkNgNltDK6xRU9R0m3QrTXLidqLq858WF/9dh9z3QctvRnhjVq+0JyvfjA6RTu8DTE8IMofOSPPBwtNE8NrIne+km5o4C0gQdWVZ4aK8op4UPFRJDh9eXgGlpP4OvoiEvzm9sHq1o1YdLYyxfCsK1xdm7B/q1byGa4Sk9DOaSHWW4MXZoqAyyKVmC34w98rT0GhJNZlcTy8EjLZzN3EVxIfPP3FX4VnVPnQsUfvPUDmcYajB+BUgQ/EzDDLmOV0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(366004)(346002)(376002)(396003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(38100700002)(66476007)(66946007)(66556008)(6506007)(6486002)(316002)(6916009)(83380400001)(1076003)(2906002)(478600001)(26005)(8936002)(4326008)(86362001)(52116002)(6512007)(5660300002)(9686003)(107886003)(8676002)(2616005)(6666004)(41300700001)(36756003)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Njr07mi7cO89xHlxcUVNrUf/P2AabRg0qCEDcAvz4T7DtdpgxyYY7MWdzo4k?=
 =?us-ascii?Q?b7W9GQuWR8giI8jHa2O1GC3ZVVYnWmZJUgI/BW+n9poulbe+c54hS2MD9kkc?=
 =?us-ascii?Q?eOKPj0hpltPs7s/Gazl5LCb2p8MUCi0Z+wD2TddMH8bjZVMR8hvnT1V954GV?=
 =?us-ascii?Q?KzeiWsAA1uLI38C97xTfKJqk6z3/227X9UH+aW1exSXRYZFgJ+LQ2pAGUp42?=
 =?us-ascii?Q?t8cDO5fwnZIAZKihg9ugC1+CId+CGlckt3iv0sX5V6/XcQDDCYuVZhEIr2uU?=
 =?us-ascii?Q?C6mseq583iOsqUJkw5HQxu6ZnA4hfm3AoSiRJXmNPM+g+sb0x61D+1dw8Sdy?=
 =?us-ascii?Q?a/wy4hxyZNOfZNU1X+Fq6x2WGEelrFfHJ70PIO64OOBMbWkAOw7hlem7u1qE?=
 =?us-ascii?Q?j16Wvxe2Jif6J6wryY+ZD0JJZClgDXxqBbVmCy5VsNyiARnZuHyTagwvSF3G?=
 =?us-ascii?Q?LzsvKVDu7YejTOSdCzVTcMdMc+d0SKWZz+kKq03C+xmib45zePSUWfOtGhKF?=
 =?us-ascii?Q?tcjP4hboB+23NFt1yWSK2O4rX1zfaeNvDKOyZwxkd+YyCn3A4wfSkr4XFs2Q?=
 =?us-ascii?Q?1n4NILDl8HKkmTVA4ZCcGFIwLwyQcz430i4XusYiUpJgpX/7UaGLPnPD9rna?=
 =?us-ascii?Q?m/fnn3P/ZpOhIyPUAJiRiJUhGtg97IPwir8Tej7outLSnQgkcg93gfy7VO8B?=
 =?us-ascii?Q?jdBVQ8HEeYsp+NaKzpKB3KqgFaVF28SMhvezQKhtXPU0mtrFmsCvj34/07PN?=
 =?us-ascii?Q?l4NQYb15cuzx1IpbyK/dkevWsc2kzFeSweY3J0+R+ym8wZuAe+vN+kK4xdvG?=
 =?us-ascii?Q?ELqF8Ork5zX83AITmw8MTrFVU5LVhIc824spsVAHt0v8aL/pTuszcP9Rcdof?=
 =?us-ascii?Q?8n50c0RSylbU2shxBX1g8YuN1PjGlxS4kYqIKrm8O4CWR9312C8bKh5it8a8?=
 =?us-ascii?Q?yfD+MN3PeE+VTWruP6N6FpCfZVvQWOHJ9rsdwcjKScg/GdDUpdvCgwVqrfVk?=
 =?us-ascii?Q?bAmkucMl74IuBCRx//K8LgEZ2PQbfm+kqqj3Q6xAgzrRHgY20synCeOYPueG?=
 =?us-ascii?Q?UqywQ2u3pUtAp9zOxuDhOL4ocuqs3B+ZqLgGdWsBRcDqTaqtIm6HgOQKspQG?=
 =?us-ascii?Q?AMFntJxtGmWR0iVNuf1kzntMoekXzxCkm2HlzKPi23GlRisAtEsmagJG+2bP?=
 =?us-ascii?Q?oFq0pUUB31LZqU0UZoKCab4RJwgL8tAS2wKkUAaosySmHkIuDJT7rjqnyJLR?=
 =?us-ascii?Q?3AmAQO44l9WGPoNgAwql89gSgl5Tw8TAZakvvkx/jV2D8iuXEfFMQ7qjIERa?=
 =?us-ascii?Q?uPOwmCG59TWmTKzoRAtAKj0By4Uqkx+Nxf4SVJO8awuqi/wxiACqE3NNycFt?=
 =?us-ascii?Q?CY6X/kHZ56t894sjLGJpjpxop+oB2NceqSvvccQ6qzzD7pcxJ9UMAlInqLE4?=
 =?us-ascii?Q?4syLAXFhOkhvGjaiQlfki+cWR3e7tYYu51Gg83tracU8ZorshyPpZ1YLGYrT?=
 =?us-ascii?Q?/27rzyE/El5TfU8YQ7mrMsfqKoKni1Fp9Ij1G6SKUaLEazglmrvHkdYMcIEf?=
 =?us-ascii?Q?Of2JnRTr16nCZTrWdKAEZgNRb8pGJjFBktLlay3bBvv33oibygA7YwtDLWzl?=
 =?us-ascii?Q?DQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e659ae-6faa-4d3f-be37-08dc18f4c0df
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 13:44:26.8107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Y3HWygf8yTGeKhpDJIbchRD2ZvJtC26i32VHMX6lavqjBgLG2yOhm8g5svdclB4KMWljOmLeW0jubeunDSX9IwNyQmNyWkFYx3tX4gs5i4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8279
X-Proofpoint-GUID: GQ0WiDkX__iFZkzn0rQkjuf9GDPTzPYA
X-Proofpoint-ORIG-GUID: GQ0WiDkX__iFZkzn0rQkjuf9GDPTzPYA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_08,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401190071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:44:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194046

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


