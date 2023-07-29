Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4738DC0015E
	for <webhook@archiver.kernel.org>; Sat, 29 Jul 2023 07:01:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.49441.1690614058847195314
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Jul 2023 00:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AdKJl+3D;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7574babddf=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36T6sH7V021101
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Jul 2023 00:00:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=wMUvVDCNNNIIStbA1E
	lZik5mJuGge6Hkk98lHN5gTrc=; b=AdKJl+3Dv+wTMaz8e7JIdGI99FYuPkum6h
	NId27t8L0LE1ElLsW6di/dZbrbB/Tsa98Jq3nVyTVAFPRtCCG3HOXQqtFZ2MssWm
	HJnk5mQiNx3w1Z6bLRxWCqlS9od7dpqwtiZ+b6wzpsrB2f+Eq7mywkZGG+r+nSiU
	hi6Hf5gNpeCNmz17BQVdzokGCZYjFS3UTYqsFnjZ/qHYFsTICQWRX7FcKdXUJSRQ
	9V1LjSW3lHpYB4uTvYIrc4qgPQfP3wyEz2HxZGwMXzvJsNSNoC4s8NyjfyCc6Vky
	JQgtVR0xuiqfFxYxZb9PfC0ZH9wOA/sPLhvJ3+sEIG49hCj6D8dA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s0ad06699-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Jul 2023 00:00:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pn5GNHQ4LtS2Tor7plFmrWwLxtR++Ky6iCtQ5e7Q6+EIeqHU7xVGgoe0gcdAsvpGpIMt/U6ZpCA2swIcExa4NZq2D5k7/bFWqj96xAbx7HqkCNUNAeV1KTZOrXk76Yhxsr9qdL+HS4cHJ79NW3uLrekyxf8AU+s5SQxECTkGn9qxOx08BegP3glhUNa6hMRtCij3jvTkUyNPz8dcZjLLPWblyF9pkPZHIWhxK0cabIFUOhr7HbIKoAixHjUFDewgmnkN7TlBZYx6NpztVIibeSPRHI++SQZ5PGaSoaoj+u4JIg3kKV1hx2Ft352rMscOQu28hPYZ0X4n3jT1e10Sig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMUvVDCNNNIIStbA1ElZik5mJuGge6Hkk98lHN5gTrc=;
 b=BuIBroIW/5BgVOZuG0aRTp5qifM+HGgKa7SQiGRAmdywz3VjrJ90Qq6jABfhlc09n6XSmeiHnBR5u+7Dhywb5s3Bu9XkQEsbyc550mEc3nzRfLywSQIF7/TiMNIHMIOfPa1C+u1tU37ls6reuIE/CxhRMiHBy4bGw2ACZtNfQ1fB6vVScl0CsRTr8q8Zs2khwKluGrUbXPW0UZ3jRRkBSHfZOBlWdPzX7h3qN9k8RR49lDOMFJAmQqMqEPH0BGnqkEyXEZBvjC6F1axhB5BgmW8iUyDaKlt5XuJqLFgm0pjXANH1Xb7j+bfsffhpbpmbh/ql1N7JNBTTFFBKYy1uUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS0PR11MB6469.namprd11.prod.outlook.com (2603:10b6:8:c3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.34; Sat, 29 Jul
 2023 07:00:55 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::d383:a84c:6dee:47e3]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::d383:a84c:6dee:47e3%7]) with mapi id 15.20.6631.026; Sat, 29 Jul 2023
 07:00:54 +0000
From: Yash Shinde <Yash.Shinde@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v2 1/2] rust: Fix BOOTSTRAP_CARGO failure during Rust Oe-selftest
Date: Sat, 29 Jul 2023 00:00:20 -0700
Message-Id: <20230729070021.1794217-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0074.namprd05.prod.outlook.com
 (2603:10b6:a03:332::19) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DS0PR11MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b118129-646e-4c09-d023-08db90018d16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WmdUyTXIBqlvi3tOwT/6rWZA1sOtyZl4v029WaojXd+JvglcUl0RlL4uogeeLov47Bq2ShMjdTup+cTzQjHQ1aSWKfF9EKzc7OUUXk3ND4ZRcA3ttCX4095CVHunkEy2WlBieww+F7AsmvTwzT71eioVj8+wQX3vlwTx6e00h69faFA7yuLFFPQwe2Y+B9PY5ykbIwUc+VnfrtxRRxOuAN6rMQiPwcWaiQ3/anNJ6SwGrtuLsmPO0P4PsDqWkRiH3ZPj/DvnqzupRI84BjIyg0H+aTdkBsroxozOuq+Io7MpgPibKv8grUjTTLGQjXdjNiOcR/IFdhCY5ELXo/sRPdjoECG3kP0mzwY55wA+/Ws1INdaRGY66zfdndhk0JzwcMXRJTCMUpB4QrMkrHcIuBY+G60BUA5+nwvW5cUdeCvNah81PJxPoqtdeTjxNeRXL08Y7OMFsBcwmjEwUkYZDhDW9QZN+HWhm4EOTAQwF2VPTF97inOQ+zC8CX8mFSQUz0ui+QaXU4hMJBGS9nMYDBuiPAFleCeTAVPZhw3TIqpHpHztTqvG31cT/5FYGv85sVAaQduMZAht6ll5234Z5k9mO0kS8j65ToRt73/Zzn0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(366004)(376002)(39850400004)(451199021)(8676002)(8936002)(1076003)(26005)(107886003)(41300700001)(316002)(6916009)(4326008)(6512007)(5660300002)(186003)(6506007)(6666004)(52116002)(66556008)(66946007)(478600001)(6486002)(66476007)(86362001)(2616005)(36756003)(83380400001)(2906002)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GjU5gB/ypNY0J210qTa18ATpblSqTPai3Lc+ICw6S6ZvbS0xTthExkpLL1Cz?=
 =?us-ascii?Q?3vEW6Sptta9cuM6hqt0XY29FeigI/Fty9hd4+7bXQFTc3CRa7ZElj4IzjGi5?=
 =?us-ascii?Q?I2blslWu48e738fMMM3QTI0sENR5zTaqVKugcsVZDG5emK8gH1JzNrkFFvt6?=
 =?us-ascii?Q?YY2ijXIMNvQynR2TgFZygHLfE0PWCbg9f/nT1okvkR/PRENvKEXpH2rBw3Qa?=
 =?us-ascii?Q?jHSIZZEsmoYdHrf23F0cSdh25tZN6elx+HN8aCwMqPfuyg8loh7OONXvxFID?=
 =?us-ascii?Q?MUZXtYBNxdfCfF0YcvmF2xBLYJhQ6ETtcHSN91c7MvdDOlYcrWYn3MI8AzEm?=
 =?us-ascii?Q?5U4FQepqS1wY8YIeii0k8Unb23pWEEIVmUpGfPYEIagjJRlTdAXm2I0Nn+Y6?=
 =?us-ascii?Q?ST/yD3sPewN6R5GCFUnEucSSxZCPmYzcBcy5V005um46lJIRxs+TMxpUaghw?=
 =?us-ascii?Q?WegNoZNoSzSb1ZFdva+pipFEEuTs0Zzig3bnipmHoAUs4Kct6h0B6V2nca3b?=
 =?us-ascii?Q?vqG8dfiB4GuPAmMBwoZWd4CRB/jt40Z8scO7jzOhVbc8oBOV+KevumTBrB0n?=
 =?us-ascii?Q?JHkvdrPMcRfqnqU3YZXNsEiCN3pqeAp3sLAbqlmeB+pDNTMnAKjim/5dKlTA?=
 =?us-ascii?Q?er7EysZTpujqHq8+rhTpshZ8fsmO9rcpi5ENqbR3/tQVJR5W1y9edE2+j6V9?=
 =?us-ascii?Q?bO6ta2XJTSbVM0GbLhGeZ73ABxhlxPHAA6kIpwHggP+eXMiWLc/azXC+JsSD?=
 =?us-ascii?Q?CURy1HVfw30Gs9N8Z92T8534jiex0eN0K+zP+FC0Vf5f4nYKdZN7q+mzmydT?=
 =?us-ascii?Q?+M/Sw/UP8GLCW6CuPIM+lmm/DTcxJ03sBYrFzN5DxdrHUruGXUHs+6pXWM1e?=
 =?us-ascii?Q?LU8g6E8QYewuBXDmyPf3lbS91+mhEumJpdksZkmYbTNICwu1UluabSBpGYxM?=
 =?us-ascii?Q?apPLbtPLrnRuAkTD7R+zHCfQ7jcUYlzmgDnaNXn+jdkMRAvyV2Mystl/tifY?=
 =?us-ascii?Q?fuu6pvzJp5ylAeTlEwMEkBekK1HnbegngLvKPzhlitgnKI4RgWfOw9gHWtv1?=
 =?us-ascii?Q?VQPEVsiJ5tkkRCcmEAbssSLMIHlDoLzN0VQty6lQG7188gTfsZ1GjcfbJHAn?=
 =?us-ascii?Q?pLqmPYvkPJIi/kVIwSjrpOWqvfsCXyQryAuZGoUDaZVTbqCO623Dgph+1j8E?=
 =?us-ascii?Q?IthPUVYhsbZiQH8ffD8Zzc+h3hZY5frEvAnMPOJSVr3lsSW7U6G7GCBIm1vM?=
 =?us-ascii?Q?YIRo6JtViGyu7du0eSo1ZhTzXAEOjYa73HlbYDyqasVTkCIG9EgfCc0V4bBK?=
 =?us-ascii?Q?43Jy8uN1qLKvtD2mgYViDZkJ5ZAVHTQdUCKfcnJYKK2AaZEKuzEQoyBfmFZM?=
 =?us-ascii?Q?mZIluxoZdXbwBaFFMt9ueLkV2pKBO2w588P4oBU4+THqIUh8HcwPwkzJWT4H?=
 =?us-ascii?Q?LCfa5Zf4Pjsq9CYwY6QnIB/Yy4dcK5TPlo2gvNZD+L/JfNumaw7ldsydvz6f?=
 =?us-ascii?Q?GNQdbZ1pzobW7iepi+A4h+/dBo6Sq1Fueclcj6zm4uuJXSXWL+FXrVYeA4eh?=
 =?us-ascii?Q?SK+K/cgqIMxwSL0LCbEBUOGCDgKt+PjnxKtzmZmmXszxInUl1CBL4UPYGT57?=
 =?us-ascii?Q?/w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b118129-646e-4c09-d023-08db90018d16
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2023 07:00:54.1633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FuJgmtIyG5X3YWtJjaCr/MntvPVyVMxCyGnrh7qcNH9QYZP21R5LhUz+NaPDhCAR4OBK6EK10ibQVTWYy1wzUvurfSBOvHxga5C5NBcGE+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6469
X-Proofpoint-ORIG-GUID: nL9XrgXG35EJyKI7C4rIL1YKHfC3g5FS
X-Proofpoint-GUID: nL9XrgXG35EJyKI7C4rIL1YKHfC3g5FS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=567 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2307290063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jul 2023 07:01:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185046

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


