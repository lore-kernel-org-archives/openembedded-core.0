Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 739FBC47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 13:18:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11768.1706015920475564361
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 05:18:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nQLqmVVA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=175275645d=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40NCLDWT012036
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 13:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=j1Fhkxksf7PeZIOCJ377q5I1PyOOuXUqC7eS4L71cts=; b=
	nQLqmVVAwuH1gRfbO4qqoVcoKcas04ci567+r5wnxhgYuO5PA8YR7AsOtvXq4gnC
	pvtjSPxxhqSCTJztTj7EU5vXrUlRSQYnwuL3P1d9H+ogLSz0DNLgLYqF6DWKwVZZ
	nOuTvp9Pm0jzkO9FtHZCv9sFVaOont7pybAsI0599US5onFlzeesDiE9rtV8IYEB
	KokqPS59E5KxqShjBk9WxipHd/U4iTVwNaHBnZwMCvQZpMh/fsabRMlRFna0x/85
	Gx+jXeF8wH1kTfQo19MmwHwwalKuBg258WD+V/tse56MMoLBsPM/Nq9u6OtHN1hW
	Kt1EBs6CYaKAUnXZ004GuQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vr5573cm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 13:18:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VxFntqZNYdqZwB48ATTaTVFdjTkSKYyG9SOgMuKrhL2Gtun8YoJ6nx9mTrXTKPayOZXof8JBhkaeyBTvfXPPH5NXMSLf79InfYfRjLwzvUeLaAfYgfItom0rHhWl9nMJ4m6hBk8ESOTT2AGwVvS6z1fHWKRKYtVf4GeOCQeyI9DxDpSiUV/7YIpDxPEbxK+davwK8tkwal4cspIdg1q1B6WPyXTGXibbCEQQ7A8KBNEFjUwax41WD7CpcmX1fyieWJ7/Os+RRpstRI5R422IqqjpI3wc8RFTgjP/kDHBmQMfiYh2E2x/CGJE2+UIzMbS2yBwmVbEIZlnJnWfOxWgZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1Fhkxksf7PeZIOCJ377q5I1PyOOuXUqC7eS4L71cts=;
 b=ASvPRvuEq7qP6Aa+a2HagnS9mn9lqMYuV8fsRgV20zAxgBwcAHFNfkHk0x989CCqjLT1pPG/yOXgrFlygxxDnIbXuAKfbC48uSf9r+syNYVsWCe5MhMwz21YpdZj4EszZ3KV9EnWHw2ttVefPLlMqnHo485LEmKjuBcdxsSfYWORh7OeR7M9HTdq5DslZIojqkHJC8FKs3vI8POS75uUGjsSVV+I8YhkJbwERLAb8b3zK2eFpoKfI9Bx4ydVEcc9FUX2dtaz3LwPfbO26h8IEu0vvbrrOMlCg1r6z1fy3THPhOzaaPow74oFvzpljK07Y4z+RyCetq2X31b2CD0TPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM6PR11MB4530.namprd11.prod.outlook.com (2603:10b6:5:2a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 13:18:37 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.033; Tue, 23 Jan 2024
 13:18:37 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v3 2/7] rust: detect user-specified custom targets in compiletest
Date: Tue, 23 Jan 2024 05:16:28 -0800
Message-ID: <20240123131633.641012-2-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123131633.641012-1-Yash.Shinde@windriver.com>
References: <20240123131633.641012-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0145.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::30) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DM6PR11MB4530:EE_
X-MS-Office365-Filtering-Correlation-Id: fe199135-2a67-4538-21ae-08dc1c15cee8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qpOyfnBUN/ifJ+gtxQdJR1JJ9JsP2rwx1wsbe4aiYLQg/T1BGChtM8CTR15gd2EEAlHSyttwHIcAGIrqpq1qL7fDemGeG8mlNxg2Frx4FjU24SX6pJOektyzHMz//2QuLzq/dBothYINZSUhO9cJSMLziIfKnmQ+ucqTWmf5+fS9IrSWcADEmJhQ4u1NrA3JTQzMdQnmOq+0s6HjAkAckMS2axPejHvirf3AXAsI2bKkuaIkLNUWW1ZL6z8J8kQeyNU1Ire+EJB5ToqvFdGvBvd4aTLarECFMqoxbAzAx5V9WmH5Fv79MmypduOfjwxK9toBxjuxhrXpNMQPS7eYPu9IwiNVIyLR+v25x21GFC3jYfSgl/ZK04c5d8sD3b557PbrG5ECxlvJLEJs9PctrSrbu0XAN8fOPlF36P+cfpQMrSpyHrYVle2tubacBB3XqSCK/31F2NDxspY7LX7XuOS4a2NuhD8hPw0ARhqXuotUKF67oa0FXYDloG3YbGOpceZ+n7rHLjk7PbYbfSNNH+cMB0JYsay6+kKzqgV7XeRcObq93pKnBXbRuC+NjwFLEpdaA/O470RXI1KdwWaV/ulwkDKLeb8nS/cuojOc8XA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39850400004)(366004)(396003)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(2906002)(6512007)(9686003)(26005)(86362001)(2616005)(4326008)(8936002)(478600001)(8676002)(41300700001)(38350700005)(107886003)(36756003)(38100700002)(83380400001)(66556008)(66946007)(66476007)(1076003)(316002)(6916009)(5660300002)(52116002)(6666004)(6486002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+Z3JRCPiQMZ8XAff34w8E7L9357ag558FQDGh4LuBs0BFfVAhUQ+Sd1bkK9r?=
 =?us-ascii?Q?qKgTUfEoRfYh3GmJ0s4HDdhkNloGjRYc6SWgi24HwWhuNtZ35azt2Q3rR/qd?=
 =?us-ascii?Q?DlPw0hCMADIzvdtnSx0yLR1osCGJWm60IVzq/t512+Hwqv6X1Y813kqgPsut?=
 =?us-ascii?Q?xU7V53df7ZpP9On2qqm8zt1m3LZ6yCYe6hSCnZCk13qNKh5FU9N+VmRJ3ALn?=
 =?us-ascii?Q?lk94H/k3HOC+8E4cQQ+4eYzSJCyob0tQWXZx6bAqGuDxGFrfLKif8sqs2aey?=
 =?us-ascii?Q?oNg0+nPzfGEON+aTzi9iDwcHj8olKT3SixhuuZ9zwsKUTVEG30d9RQjMRYDO?=
 =?us-ascii?Q?nJm21EafWZ6a8J91NJ3Mq5HU6iYCo0eTB1jTHx5YnRUdyv5uvksW4WCgyvTN?=
 =?us-ascii?Q?lUm2bXTxSGliU/+FENCmS9Fl0VH4SJn9skZz+AloaoECqz8JAWiuheJAZiqz?=
 =?us-ascii?Q?Ea6K4upvwl5nkCxrOi9U0jAz0gMUPnbA0vTtZzTCsyeRerbtivMJ/St0LJoE?=
 =?us-ascii?Q?npyZYbSOW/o2QhbVz1/gzzwTJsNA1n+LR0w19h2gHWKK6iptiFpRwhmlAvIs?=
 =?us-ascii?Q?qdu2Cye5lKSsGXyyPVy3SBHzqg3/t08G+ctxBR35UkJf1dTHvXt/WTZ2xWRd?=
 =?us-ascii?Q?YyK0TvLCgZLOCk95kaaxXvwygso85zVBwiXDGlic3212XaaAZ3MiErXhUK05?=
 =?us-ascii?Q?uuKHZKBKqeAFyjI4jZJrj7e4lXppEBizmn7oGasd4lyR37/wcOxEtUkBziNg?=
 =?us-ascii?Q?yuMPQvJ+dl8KANavp4KzXuiehfFWanzOPq9NL/l/Qb9wfz7M9saEc6k2z4l6?=
 =?us-ascii?Q?TqSe5Yf5+lC/f/a70PRvPx2OG+D4Y84HfJSwfQ61pPr7ohthR/UCvVD5RRob?=
 =?us-ascii?Q?huLza29OLik12d/tkzZ0KFjnlCqFwwvlQsDlEcob0PaqIqKnSaaYfp1U/E78?=
 =?us-ascii?Q?C6TqRpETBQRq95J3hg+OA8gIPS8rHa2UJvEDyDZnkr3dzoqfDjGI+p7fzsZd?=
 =?us-ascii?Q?8bmjx0XqnZ9mMKYB5XQhKah6Hu3spnk6uosDSNq+pWt8mvqAlpaV9ly8pTQg?=
 =?us-ascii?Q?ZYSGP3KWdsM2Gk5xMgTqragaCRo2Pzt3Voys+eZ5YkvAeYE5P7EuRoxvalO0?=
 =?us-ascii?Q?O6GmCjq+ZEl4v27Lajuuyw/S1hR9BCz8X4pUMew79MIH4ZhthcItl+Hbu93Q?=
 =?us-ascii?Q?r7E6hJQvWPABVN0MuWMOlvCuMddBfd3n7BVbHMjHg4aJmgdsEHJr22m5SgMl?=
 =?us-ascii?Q?jg82brpgv1jTyDAhpXzcbvBkcs9xBHQuMcan0Cn3QwFKZKiGhi+adOGW+0df?=
 =?us-ascii?Q?SyEPDSY6Tbbz1NsbP2dfAu8t/bakXWXawBPVCakdLGB1A5p+T6+SKJkF4bpw?=
 =?us-ascii?Q?4s2oy8H6HVm6p0z0I+OcxbUYuc0Ux2E3mS7dOSl2lcQwpnPRCg4HDQ54fdTn?=
 =?us-ascii?Q?hpC3CvGiuALhMjnp7+ReI9mB93nveG7/PzFKIm0oFjfQ2BMYttJBSzXADHAu?=
 =?us-ascii?Q?rwYxFxDER8j1GynoN26dQStwYMJ/JrwzR0zRU417YEd06IiMd3B1RWZPUqyS?=
 =?us-ascii?Q?+ZpHa2qF2aK81+BatalqjAYD3ehUyEDigsSAd50HDfA0lcBAmqdzca8F3qF8?=
 =?us-ascii?Q?qQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe199135-2a67-4538-21ae-08dc1c15cee8
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 13:18:37.2099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvA5z6qYWimNvhcRMDNXJn+JbfKqkj6Cl4l36UYG8oUQ4K85AoB61J7QX0uzKax8FGovrUi+yGixFQnQepRL0fOhEi00b5N4po0ZYISG0vY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4530
X-Proofpoint-GUID: -0PMKUTNTT8d1t6NB3G7UHKz-xxhAtLm
X-Proofpoint-ORIG-GUID: -0PMKUTNTT8d1t6NB3G7UHKz-xxhAtLm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_06,2024-01-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401230097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 13:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194229

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


