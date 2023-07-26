Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D90CC0015E
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 16:03:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15293.1690387396744628819
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 09:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JtiBgcAF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6571459fde=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36QDWA83023866
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 09:03:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=wMUvVDCNNNIIStbA1E
	lZik5mJuGge6Hkk98lHN5gTrc=; b=JtiBgcAFri6SabPG9eHOSTq8vuKOj4G+vt
	3nF5DAU0JT38EHMklgq1XrbTV18FynoxsOYUQM0e8vdiBZvzrm6QL6I8Tt01fNMc
	VGi4DBcH2aptClQAf/u0FPFk93sFno+hVhf78kCr5SqRdPPB+Y1o6phkzN5I9qVK
	y22rzvZIqB+Ho5GmjaC1UIwB9FVKHujY22Oq2qUd8sq5517gQ61Ltg+13S+B3j2t
	4rcWnnpqHDnseU8us/zpiKJAb3HqVsI9pLqbJ03hvm2CD9q9oVFAhEblfVN7I/8F
	xrjC8foe7hBPXiH6paZaPcvehBxMa49Yvz8DdqQAhyx2SCBav7KQ==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s0emfke73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 09:03:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UX0Wa0uHDypZ1VrYh6RFmHTHBw/WSRX6naWzzdX0t9mzTgNg+ZWTsW1C/jkSoTh3QCNfWqZCKkeAzirlvf3tqf97kBtIPGm62gEVrVkpHJl+Ld68uJ6dVdfTN9YESVQHT65sLGbgHgFY5N8tIcifcwyym8EMmHLvBsf30xIXHz2aD2e2S77AgfJGXyaOS4+frW7GzBHc2c9ZzsF3S1QF+9EOXniYQl198MbJllkUzzaxZUAlpQp1cNj4JR3sI209k0H2OW2P5zuYVnz9W+jw8KGGbGz3wYhmteFucCea0zcf/ouVPEOFTmhM0HFtTjf1W+odrS7S1IOphn++GSA2rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMUvVDCNNNIIStbA1ElZik5mJuGge6Hkk98lHN5gTrc=;
 b=ayMNfjScNTMF9yxC6rFCTlTn7Nmtb4AQVyADIZXIr4kmtOnMAt2iqm0I6UC9vHRmJzc4q2sxmJoan3SZ2FWK/wY9HCdf/O+rtYFEQVHQ5BbFsK4195wgWoSpR0j0vkNR1vAr3B4gx1JGIZ1ZVEnWZIhL5dgWxGJAPtNZrpiq8Oaecdjd3W8H7ttaTfPap5dujdNujo811f2+WFH7ufq9pJnot/9TF7pWs8zg+8EtSXGCjqQSLkbnJMhYN9y/fiN59Ny83GqQKQ2GqpahroKBJcfaBS0xwoXmZXpsFeVZiSt0+FqSh0mNj7DHxMQy1hP2f3z56r6A5jl9vir4KUk0+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA1PR11MB8248.namprd11.prod.outlook.com (2603:10b6:208:447::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 16:03:13 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::d383:a84c:6dee:47e3]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::d383:a84c:6dee:47e3%7]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 16:03:13 +0000
From: Yash Shinde <Yash.Shinde@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rust: Fix BOOTSTRAP_CARGO failure during Rust Oe-selftest
Date: Wed, 26 Jul 2023 09:02:59 -0700
Message-Id: <20230726160259.4161458-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0039.namprd02.prod.outlook.com
 (2603:10b6:a03:54::16) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|IA1PR11MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: cfc32d33-6c52-4adf-a477-08db8df1d0cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PMOIE/zL8jJlAY6NYi8eKoDtgK22U+oemwI4lgVkoS1DgtsYpkeRuWFfHqx8oOPvPALmNEAd9Ofko4lsimEGEHfTtovVrdVZbNUkLYsRFn/MEC485nDUq9YBTqJ+DeM2RjsNwFOHQHuuRYOOHMpzaM/HNyUYvIimQJBmJK6lvPmA0l4npZI/TFqiJP7pAtM1KFu9U3GEZ8/72+DcxTH/EQYCN4a+7fFFYm/yZzrtT8BDRn5IzZyb/X2nEI2lEnybnczvm616lD0BFgm4l7IzjU9uujzU9kTqgPpSY+KfPgUBhQisVyE32v97ZJn+N4Pq+BQW0Y/5MGl5cGhKpJr+ZTifRMQngZ2+CJ4naJNEFPxvgNY+XKQeSphlHRS3Pgj1ePRaTW7Ux8FXIUhX1t+43a0jCtRWy1LleW6DoFUANBTi8gzRe5ZFtT6FFFfdEM7D28FOMFYWE9t/es+oeRlbtT1wsoJlM9rnUA4v6dObrkrlBknnNDA24UUtF0X8nETFc4CptX5C861i5MskNzbcJTgyk9BYHFiDKDSZr1ovtGFRrJHcvTOZbmxfA31eV4qd/Akl+8p2RNy8PfOvi8IN03wBkLWOyRcvEP+JRvc5CbY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(396003)(39850400004)(136003)(451199021)(83380400001)(86362001)(2616005)(5660300002)(6506007)(8936002)(6512007)(478600001)(6666004)(52116002)(6486002)(316002)(6916009)(8676002)(66476007)(66556008)(66946007)(41300700001)(2906002)(186003)(1076003)(26005)(38100700002)(36756003)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oAULV+rNzumQe9wySgBkt5uJ9MvgVS+YJOY2P6R0NeuytdjzswOlcKufULkR?=
 =?us-ascii?Q?6gpgxMHXclJWeCoJ1AQ1PnCNzVuN/7wm+LCL0ux2B/prWWEeMcNnQtC5JYJr?=
 =?us-ascii?Q?3DeqOb7P9fwjhB53kRbwsnkwNE0/ayqOMLVymMiBgTrFyy0XsTVrBS1FWfJm?=
 =?us-ascii?Q?cElpOTLLHLlgb286pq1NYcEpv8GGorTlLxCak62JF3Z0r+SZ2SImbnRnE2at?=
 =?us-ascii?Q?1k8E/Ko5t2xj3ukHoAsJlacbZm/DrY1Fv1iM2MNQHu8cOhWty01oabSLohHY?=
 =?us-ascii?Q?+GP3+v/GpIHOa3UAqa19Flcmfwl2sxK5FLQpq+nN5P+8PP/3YaZNwPHnYi/2?=
 =?us-ascii?Q?ONQlLKsaqjlpMraMnJqzWB4l/LC8vsB3ioyqbQCA2A1naSd7wlMLsBKkp57E?=
 =?us-ascii?Q?nzSnj19c03L3NF0P7UsywGhJtgdhiQWiPC+04xyleE3xyV2K9rBu9ZqPtykh?=
 =?us-ascii?Q?xB8FKEZJ/342aYPIZcFjcDKVgsq2K+ylzcMSO8kqVpwuXcQsJS5kX1yrs30+?=
 =?us-ascii?Q?OvQt7DBXLqf7+lXlPVtc3P/s8Oe8vmwz8d3KcXptdotsfNFPYL7h8G4N2Qcl?=
 =?us-ascii?Q?GhmB6lT5NxoHgs4GM2bsiDehxCzDP4+8bV4CKwKIrqcltsi7KR9Nx2Nrbh6h?=
 =?us-ascii?Q?hhegLb3UiKwn7WDJe9wqBoxy4cwqxJ6LkvYOrMgFWQPhXJ54lpLNI0REh6x+?=
 =?us-ascii?Q?YKEMuLCbeVF5r+y15FEZKREd64dIMW8etMW/x6K8yFZIwPscFtVuCiYsQ6Rb?=
 =?us-ascii?Q?PZxIaQO6MNvyOzABB2xz4PToVF3HN7WHZ5XNDhWidYWxyJKzSo71hJV7Mq+0?=
 =?us-ascii?Q?1KQPSFUn2Sb4MfjKILuotFOER63TjQS2txElP3cWj/KYbMHGkR+znUxJ6fl9?=
 =?us-ascii?Q?lc4V0EIIUmu5Zg2gW62ILTOeMPLrkD+/4IgRsPhwM9sfX7FuCjmYerQzyYEY?=
 =?us-ascii?Q?jBOfttAXuhoeaXYKb7s4+TSeJfrSOfibFx33HHsHaEibOXn4BgDLFLnt/g+2?=
 =?us-ascii?Q?iOk5ua2IZvmvWZ50xQ9vgbYiCD+p4xIPfuCopXAGyoky8g1aaQE71gptsHxz?=
 =?us-ascii?Q?EWfMcQywCf9d9iymdtN5oMRJDQ7AxAM34VvlRHleki+lGLDXKL1lTtEGJdJj?=
 =?us-ascii?Q?/VQQVcSSkcUJzNDyIaAO6ol7fSx2XCuIkqerl+Jy/c6yyf6ZnRBA7sFJdua5?=
 =?us-ascii?Q?hiezDVAq37ELP+lIcVs5nImJIHdG767U0/jFb0QhJ+PhyRLqUUEl1OTYCcdQ?=
 =?us-ascii?Q?2TGWlyJt5hPtAh2jT7kd4uxao4zSue7Iwp2sF72wmRZVue/JfFJsaAsbPuyL?=
 =?us-ascii?Q?XMShuJHe1Cvke88f7oo+vvIt65vaZaXIUhuKsrtLQerWdNTYe+kOWyxZXlfZ?=
 =?us-ascii?Q?93j9VAUKCzrACQMk6VX6YHGHE5OMbMaaBBLMR0rrrMfbbIfsp8CBJ9nsfjnf?=
 =?us-ascii?Q?aZ3PciRO57RzLKyM3ga8eL2HUrZdhDTaSJCegCQcy8zMq/11DD/lLCsBAFva?=
 =?us-ascii?Q?7euebTjJCnPteBsjOX0JvwZJ3rPhZNVRl8W6jc9+WQwVpta9aH+Rs7B0f/4d?=
 =?us-ascii?Q?MXG92uXLHho4wr9TsfKdCBMrQYWKjBQnqhBna23oEw5FDrhakwEh8sc4o+Ye?=
 =?us-ascii?Q?mg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc32d33-6c52-4adf-a477-08db8df1d0cd
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 16:03:13.4262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZhEEtOqanLLkTfIMt0DVQ5lGCCLMYvMC3uaEWVYGrTSLLMwabWOGTJbEnz7/N3xD8LuaotWu7PFR2+sB6gqwOBlSkItFPscIFSufH1QsLKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8248
X-Proofpoint-ORIG-GUID: nlphihuulnvX4wRMpeKTfUKCIlUWFM8F
X-Proofpoint-GUID: nlphihuulnvX4wRMpeKTfUKCIlUWFM8F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_06,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=564 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2307260142
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 16:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184889

BOOTSTRAP_CARGO command fails due to codegen flags like `-Cpanic` were
prevented from being reflected in the current target configuration which
leads to Rust build(rust version 1.70) failure in Oe-selftest.

Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/9dffb52738e0b2ccd15af36d4607a709b21e020c]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../rust/files/bootstrap_fail.patch           | 127 ++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 2 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/bootstrap_fail.patch

diff --git a/meta/recipes-devtools/rust/files/bootstrap_fail.patch b/meta/recipes-devtools/rust/files/bootstrap_fail.patch
new file mode 100644
index 0000000000..1f44b6eaf6
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/bootstrap_fail.patch
@@ -0,0 +1,127 @@
+rust: Fix BOOTSTRAP_CARGO failure during Rust Oe-selftest
+
+BOOTSTRAP_CARGO command fails due to codegen flags like `-Cpanic` were
+prevented from being reflected in the current target configuration which
+leads to Rust build(rust version 1.70) failure in Oe-selftest.
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/9dffb52738e0b2ccd15af36d4607a709b21e020c]
+
+Signed-off-by: Yash Shinde <yashinde145@gmail.com>
+---
+diff --git a/src/tools/compiletest/src/common.rs b/src/tools/compiletest/src/common.rs
+--- a/src/tools/compiletest/src/common.rs
++++ b/src/tools/compiletest/src/common.rs
+@@ -431,7 +431,6 @@
+             .unwrap()
+         };
+
+-        let mut current = None;
+         let mut all_targets = HashSet::new();
+         let mut all_archs = HashSet::new();
+         let mut all_oses = HashSet::new();
+@@ -452,14 +451,11 @@
+             }
+             all_pointer_widths.insert(format!("{}bit", cfg.pointer_width));
+
+-            if target == config.target {
+-                current = Some(cfg);
+-            }
+             all_targets.insert(target.into());
+         }
+
+         Self {
+-            current: current.expect("current target not found"),
++            current: Self::get_current_target_config(config),
+             all_targets,
+             all_archs,
+             all_oses,
+@@ -471,6 +467,89 @@
+         }
+     }
+
++    fn get_current_target_config(config: &Config) -> TargetCfg {
++        let mut arch = None;
++        let mut os = None;
++        let mut env = None;
++        let mut abi = None;
++        let mut families = Vec::new();
++        let mut pointer_width = None;
++        let mut endian = None;
++        let mut panic = None;
++
++        for config in
++            rustc_output(config, &["--print=cfg", "--target", &config.target]).trim().lines()
++        {
++            let (name, value) = config
++                .split_once("=\"")
++                .map(|(name, value)| {
++                    (
++                        name,
++                        Some(
++                            value
++                                .strip_suffix("\"")
++                                .expect("key-value pair should be properly quoted"),
++                        ),
++                    )
++                })
++                .unwrap_or_else(|| (config, None));
++
++            match name {
++                "target_arch" => {
++                    arch = Some(value.expect("target_arch should be a key-value pair").to_string());
++                }
++                "target_os" => {
++                    os = Some(value.expect("target_os sould be a key-value pair").to_string());
++                }
++                "target_env" => {
++                    env = Some(value.expect("target_env should be a key-value pair").to_string());
++                }
++                "target_abi" => {
++                    abi = Some(value.expect("target_abi should be a key-value pair").to_string());
++                }
++                "target_family" => {
++                    families
++                        .push(value.expect("target_family should be a key-value pair").to_string());
++                }
++                "target_pointer_width" => {
++                    pointer_width = Some(
++                        value
++                            .expect("target_pointer_width should be a key-value pair")
++                            .parse::<u32>()
++                            .expect("target_pointer_width should be a valid u32"),
++                    );
++                }
++                "target_endian" => {
++                    endian = Some(match value.expect("target_endian should be a key-value pair") {
++                        "big" => Endian::Big,
++                        "little" => Endian::Little,
++                        _ => panic!("target_endian should be either 'big' or 'little'"),
++                    });
++                }
++                "panic" => {
++                    panic = Some(match value.expect("panic should be a key-value pair") {
++                        "abort" => PanicStrategy::Abort,
++                        "unwind" => PanicStrategy::Unwind,
++                        _ => panic!("panic should be either 'abort' or 'unwind'"),
++                    });
++                }
++                _ => (),
++            }
++        }
++
++        TargetCfg {
++            arch: arch.expect("target configuration should specify target_arch"),
++            os: os.expect("target configuration should specify target_os"),
++            env: env.expect("target configuration should specify target_env"),
++            abi: abi.expect("target configuration should specify target_abi"),
++            families,
++            pointer_width: pointer_width
++                .expect("target configuration should specify target_pointer_width"),
++            endian: endian.expect("target configuration should specify target_endian"),
++            panic: panic.expect("target configuration should specify panic"),
++        }
++    }
++
+     // #[cfg(bootstrap)]
+     // Needed only for one cycle, remove during the bootstrap bump.
+     fn collect_all_slow(config: &Config) -> HashMap<String, TargetCfg> {
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 0009c50172..8b9199e9ab 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,6 +7,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://zlib-off64_t.patch;patchdir=${RUSTSRC} \
             file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=${RUSTSRC} \
             file://rust-oe-selftest.patch;patchdir=${RUSTSRC} \
+            file://bootstrap_fail.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "bb8e9c564566b2d3228d95de9063a9254182446a161353f1d843bfbaf5c34639"
 
-- 
2.39.0


