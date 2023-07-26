Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2625EC0015E
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 15:57:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15145.1690387059410694529
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 08:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=c4mkyjlA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6571459fde=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36QDWsaR021528
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 15:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=wMUvVDCNNNIIStbA1E
	lZik5mJuGge6Hkk98lHN5gTrc=; b=c4mkyjlAhrTbOX5/n46om30kVFTsLOBr26
	I6bO5+qiWDGBQApPal09GYG2N4Y3RVRh1kN87Swe0gYF1DlTBpPbfuLsGj1/+BWU
	iplYUrs6nobvvBNQLuAWdWz96NsvoFmEfhZfOEoT4MEx5qoxzmr3s3qwqr45vbYS
	2hMbg2c3bdRTgtM7862MdhvsCoIKzlgS9tlFk8UzvLomZtug4XCx/2KCq/3vs4j9
	RfmeoGUt23EXtnkrkBaudlj3YY4JusVF9fpHAnPJ8p32nocWfKzcJzW0skuDERC7
	FnRzUgPaUwbXy5KhjJm0WdKVPUFleb4tmu3Vq5ufCDsck3tZvqRg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s0636bnsm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 15:57:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAofRrJn6QQodCgINdbNaw3paeV9KHNmR5knY73HzymW03Jb/L2We9di869lneeLFHHDo32j4SmWKgcclpaQvnBVBbhVy93Cghh35eyfxXlPElzLKjQ0Lqym8r3rLZfgq0mSIYsuqgN53ydV5nkoxCNXLvn5xEgN2ydoJ1/SNttb36BLkLXuuzGB7fqyX5Y2UNj6Dcd2xJqo8RoPhbvPzaXqrgrCx/8pX3mQwUfIvihgNjjXN91tf9wfXD7UVBm0QcHVFa6jDPRlM49nWJPrHvhngbnSjbiU5nNEPCn1OvpFx08hKt/dE9h/C5azkKgy2xhX6WWw0ejZbAivJEbFew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMUvVDCNNNIIStbA1ElZik5mJuGge6Hkk98lHN5gTrc=;
 b=QgfrrSlWfkZ/5FRrGk3w0s3Smusggb3EMtAAUlwJozNBm/A1cRdVX4T8xamP38NCZoWwGb3xHIPipGasiV6A4XGVntJ+b5vTFma8HaZan5C4bdagHdH9V34KzppbCBorRK4maBBCi7Ui4qpRzhPqFVOS2Yh2vOOZ5XIw2nOCLI2HNfMQz0ZfUkqnqTGnQmwydIx+ybRIeNLwlti9ycoJUwv8fzRR0UB7BCLB/XReeOfopcNWbBUyfRjBr202N8QSTPg7RCN2iv0LZA+0PXxj7lzkPHJTHR8zwFnj/nrkQtJLTwAxYn55X28ez2CY5rkxD5VIAZr1olpixHBuB0JACw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CO1PR11MB5204.namprd11.prod.outlook.com (2603:10b6:303:6e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 15:57:34 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::d383:a84c:6dee:47e3]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::d383:a84c:6dee:47e3%7]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 15:57:34 +0000
From: Yash Shinde <Yash.Shinde@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Yash.Shinde@windriver.com
Subject: [PATCH] rust: Fix BOOTSTRAP_CARGO failure during Rust Oe-selftest
Date: Wed, 26 Jul 2023 08:57:16 -0700
Message-Id: <20230726155716.4152634-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0082.namprd03.prod.outlook.com
 (2603:10b6:a03:331::27) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CO1PR11MB5204:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cddcae2-6bd9-4072-1d19-08db8df106a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Kqk9GdVP6Y0/SMRya7mybE+RozTBfSPw0V1BTG78mNCf9RsFp1J7Ej/+xqWKXyiH9nd4qrYAAGSkP1D65fni13I4zsFpdcRW8P6m+Kk/Od1JF0cRpV45ecgLEk2sweUwuAAa0nGhWlMFdCOp+XvmY/d8yPwkBnZIKLHQX8zAHrHTq1N5W2zh7bWZDqm+eVUdYtrcpU9t8ADVYQ+aQvrC/TuK7GVXVeqiIRsIU2bDvem1C+RX5HS/0ryGWPBoe4OpK9N38irQiJ6VeFD6DgkEJ1YytruG/JNdqrpZaxdgO1cH/j7FybAIVU62LzlPnSRfkg3o8FsAjyOU1Qr4zTmuSF4XqrU7y7YrCReU29chdNXZ2ua1/DUCqOoK/zl+0kRpkXOmJBjJPUHVieHeQrO45V/UZCbHnNOnZ126H7R27TtRv2tOYZRdMe5cKMyDGtRTUEd8O+k9JWELXiloHOUgZ2xZ2/QPiRNlxjaFLwF4SGnXkGzwB6ryKFHbyuJj0u9Cg5QZUyuUYnk8wJCdfgtbBc0+3NEzIj1F0SJUeq/ZjVkGpgym9fqF9upv/f6KxRP900KaLuk8StlvkxUGcWGRYRR0t6zPEhRfi9IjXbn9P9g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(376002)(136003)(346002)(366004)(451199021)(1076003)(26005)(186003)(6506007)(2906002)(52116002)(86362001)(6916009)(4326008)(36756003)(8936002)(8676002)(6486002)(6512007)(6666004)(478600001)(107886003)(316002)(38350700002)(38100700002)(41300700001)(5660300002)(66476007)(66556008)(66946007)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Vdh4s35ID9bsRlV2XwrPN1RPg3VKPwzGjiKgsjGPF+QjzJ26iNp9/fuqtVYq?=
 =?us-ascii?Q?3jShcnnjgB/Gwr2OSq/0HrBYUPyJDa7ubKGOK1PB/gkuSif4GWUIsNt8azEP?=
 =?us-ascii?Q?9kjCiR7aXk1YhYEUCwa9/Kd7YwsTSLb/XoLo4ODce993prikaV4M/6yLwc8g?=
 =?us-ascii?Q?M6AaagrwBwTN8sAwDNhRjFvt13keS1I9xr0dCYbGvvwkm0jSAMBKMv2hrB/h?=
 =?us-ascii?Q?mG6vNWznfJjR1a4iuHXuY3j//DOjLbCxXcE/x9H0gjrBxD/KclgQbxvSyZXJ?=
 =?us-ascii?Q?gzJgdtDutm8R9Rq1AxYmKQiXzUr9G9rX3XLZvf5XqnCkGgMvB3S66la1sidW?=
 =?us-ascii?Q?w3KTABVhZDcnoo88t2mAG0K0kVcrriTw0L5OplbUl9Xe4iZ0MzeTdnpsQ3ri?=
 =?us-ascii?Q?JeUU/xI7TpEf24KTM71E4QgXQHzVSBWkK51QmAdz7JxjFHh/w2FSHU+Sl8Iv?=
 =?us-ascii?Q?X3sxvYbZ8oM/TOnBrEtIqsSaIj7wXMLd+Deai2B6EqDELHOyZQmIX0K01G+l?=
 =?us-ascii?Q?JSC16BIiktFkJXN4yCytRr9bhQzVIyK1XlVd3NB776mLC28Yg5FnSur9lf76?=
 =?us-ascii?Q?OZQYyKMt2kDyKr2C5YbuB43vnSbh2GRaY9bLmN+qSYCAIzHrs6zsMZ/4WhZX?=
 =?us-ascii?Q?KtdgvETZKA7s7pI8s66Ea39+/UZgkbNhNeMAUTKTQ0mgc/fYeGguTmhGjcvS?=
 =?us-ascii?Q?qPrsCV6HfFXcEpJj5zO30tdPsSb+ctPfI4Upl+FVaNL+8Kv28wzlkSxlXgJQ?=
 =?us-ascii?Q?aMv21cBqttYyxZkT93xe08YwDoEM9OAr+JWNlwl8aLva3WVoAny3aUf1HDX2?=
 =?us-ascii?Q?Ff1D5rREiSkpdJCxaBnLJtApTt4XSwwkJ4uRXktn1zQyTPbdtaBuVO09WvRr?=
 =?us-ascii?Q?8o5VcOMKuRlYX5Aevb2uQ5ptirYfqMfVz2CtKOn19OzutfbnI/dvWy5iRXZh?=
 =?us-ascii?Q?V+rIMhOm1wtoYp3u8JsOiYBpRKPw29l5wEXN67UGbOJZa0TW8zO6N3KBCsdm?=
 =?us-ascii?Q?D0NLQeyxwYEiVzQ8/FL8A6ua4Z642H8pFOBicBiyat1HOXAGufQTaNpkocdn?=
 =?us-ascii?Q?UqucAsh97KBFdz72//bys/GvkmWPUWOA0CornIYfoM8e5+cmgSefRpkYLGPw?=
 =?us-ascii?Q?VaL3/Z/NZULGZaBIZ6GnS1PdL16Th9wVcOALR9NT2TUGhLv6gXNi3TUGgIuo?=
 =?us-ascii?Q?QPvVB/vVkIMoNO5gFxElulem0jxSk1yRy8lNxnLKygcVBgQ/uR8PZKqVcP0I?=
 =?us-ascii?Q?CIteWZx6lFAnhxwHMbyLHJp5ya33PTcJEl9wA+rDKi2IdKNu0YD9UbuGZHzO?=
 =?us-ascii?Q?YytO5c8lDU1ybiL0dqQOtxNfD2B8iiZU5kpcSNGjiHrS7bAD5XAf67079itF?=
 =?us-ascii?Q?AGIvHelhFO9nZvUAVD+YjgqrZjv1abcKerQmC8/meKEDDGzmr0yS0WRgVFPE?=
 =?us-ascii?Q?MbKrrz2R/ypNRk7X1c2UU4TZn8CfYTP1Sf8F359gOVC3bDew7cVuD0iuE8Lw?=
 =?us-ascii?Q?RZi9SA9A1iAzvVhYGvANkn5HiThleOSGe0bHn68em4Rthx/R5tLD8YnRvGte?=
 =?us-ascii?Q?17iHSLRyqkt5wDd89SUQNHdSInSAMPd0njvAIRiUIa7uT9eAAD14OZ06MYnQ?=
 =?us-ascii?Q?Zg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cddcae2-6bd9-4072-1d19-08db8df106a9
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 15:57:34.2797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YRFLP6pGLVCdH+/TEfOVjwf04AgG5hjwGP1aaX1HLS3k2kjmfaiblOf4bUWM+iym6GV5ZDIIaIK+Lv+4MY9ocyOue5wsTvedxR3ZLifDbh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5204
X-Proofpoint-GUID: i7Qh5tLtavN4BBnfotOIfWh8e5449SYc
X-Proofpoint-ORIG-GUID: i7Qh5tLtavN4BBnfotOIfWh8e5449SYc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_06,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=564 clxscore=1015 mlxscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307260141
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 15:57:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184888

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


