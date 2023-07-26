Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340C8C001DF
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 16:14:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15413.1690388060209808643
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 09:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aukQEzQb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6571459fde=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36QDVJe2019205
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 16:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=wMUvVDCNNNIIStbA1E
	lZik5mJuGge6Hkk98lHN5gTrc=; b=aukQEzQbJ+391xZmMOPhkW/UjgIKO8BfxT
	jnio5S5IZDnx65qn7XpNqOiRwvGr5RAp08ef9ivGt8WYp2OneSw2EqemY4kPbVYW
	gmQbq0zb0TIN4l4euAd27FaK9KrR0Ic7bWL5CMXCeJQ9sGObzJVlE0eMmorwMBVQ
	cx4Yu1GEGmI2VVsARnGy3rtLxmPO5QELaJxYBPLgmFJzGCUDtQbBoZjrvSWC/zsF
	2IEYMKhV5X3FFu3u+dxRJzm2C8KNEd0C7fBv8+lug56sf9pKVn/zOXyDg4y68Yh+
	8R6mCznOFSmOv2Ws40VO6qCGPIhO1ldBR42UWp7Dtmwu1lDpHpjA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s0636bpaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 16:14:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Li3spMJ5Yt0aFTml0Sj7ByqPaghwfEMqSUctSt8RvEjgG7W1i5Xg5040lN0bgoATTWrnKyFrI6DwvG61y1QnpquPJFQmA1iYafNCfrbCeSgstrSMjeCdawUCGKs0NSiZU5DGqbzKl0N7CvKlMc9MN9EU25dgduawnMkf93mmOIaRNOoA2ohFZSOl0wKlIXnUFi8mDAbY5OIhtLTqP81Hsgeg57tyAy1/M0vc2MHHCOvAO5ohfe38Oei7mxBreE7idOFL655y6LUODIcTJ1nvz7G/qn7HcxHNF32bem2gR2KU/rN7bX80se8GhUjn2RFQ4xZqdqu76cWdnVUyLqNayw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMUvVDCNNNIIStbA1ElZik5mJuGge6Hkk98lHN5gTrc=;
 b=X0m2E0d7WSON6j6E/UM+wSDeZZm43sWdtUYfJKexElDakIpMv81Xcf0TJMIvhBOP2wc69amIr7Duxgn8wlaH4rdA+qUYRtW2/v6F8W5/FQGeeba3WRxpPBdFfiadmGC2Fn4T0FgOAGBHqVBnmGXHSWDtgh5+gvXcyoEtntqkpq7w225xADbVfHT6F++kWnJctdrOe12zNVnMvdE/f2lfziQ+qNE/J39OtyO4uJEjI2GvZJxuE5jec+cJhpAwcCUIYu2bvdgs9imGnqMxo6+8OucEmTa/TOpijdDKaTEsCmPAiRjvLlGBp6oarJmW7/5rWDXemk/fE/wLqzgsbdeF9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SN7PR11MB6875.namprd11.prod.outlook.com (2603:10b6:806:2a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 16:14:17 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::d383:a84c:6dee:47e3]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::d383:a84c:6dee:47e3%7]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 16:14:17 +0000
From: Yash Shinde <Yash.Shinde@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH] rust: Fix BOOTSTRAP_CARGO failure during Rust Oe-selftest
Date: Wed, 26 Jul 2023 09:13:52 -0700
Message-Id: <20230726161352.4177811-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::18) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|SN7PR11MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: 56ba5e42-6530-4661-8848-08db8df35c53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ie+qMIXSQem3ES7+RmgtSr6+uB3arbxO6ZKbOcJSswQWYt2nkB3xBrHkBE8pL/WuinLOBqCXYsx0WYlaNzDn7Qf7sQlqvQUx2CbZugxI3k3O5bpr0mJLqRChJCSxTGTwWVwsFsARgfmjEF5QOYy6UqK34nKyZ41VP58vOCf4tDi9gIfb0uBv5oR662WPkfXsax2aqRHPKq3cxkicfM+elucZg040OASEQ1G/0EUMUJItE5B71RY5WlsCmGa5uki1PIcyPRyyPGAwavvoyKLX1/z22xm9gs0RW0jEBQuGbib/y63fOLnBDctZanZ0QbleeeADR8f5m/qfWgeN4nZvD0cT5ikmQbp+MojxizTVljRZJ1qjX5RyZuLJrYGl8NJwSyGZJKC7fSO0kSjyMrKvcUWqeqKSFRu07Fa5Uya4p4tfTOo5+I+s8umF72juDaugUzDn6d54s2bFnTXntGl96isxCaSE/JwscZroOwAqd+qMWVq4lBQ+/FZ+HA0XnH77xlJg43yEH7OmoviVwQfF/fJh3WeoWAnN4fbqCWWhO1zOsiY8tlfJj9aWY+u3XVJbPeOOqiokCKraw5wgqzrb0WuyQWIEHVNFzle+983DCR8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(346002)(39850400004)(136003)(451199021)(41300700001)(26005)(6506007)(478600001)(38100700002)(6512007)(86362001)(36756003)(6916009)(4326008)(8676002)(8936002)(107886003)(316002)(186003)(66946007)(66556008)(66476007)(5660300002)(38350700002)(2906002)(2616005)(83380400001)(52116002)(6486002)(1076003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5iVU0Ex2rLTYQIcmHsQE8PG8acO9PwLLT1quC6FeH59BEu4YBoJmwBvMDSyh?=
 =?us-ascii?Q?NWfCZTNJlMsDL0Hr0dAM47TOCtv5isKcTaYRWV9GKhqPJlBif6YF77AN7DYV?=
 =?us-ascii?Q?c5A2AoqKuhRif/B62kILZS3frhJts5ubc0zksOtbuX4P9uy+OJxruDJpqrVs?=
 =?us-ascii?Q?yhsVIkIM6usYOTh3Wkd5Z2ERSjNleyf1tD84LQjTZgoIGhc33c4slH13F8BJ?=
 =?us-ascii?Q?SWorhUhp/UGkFiH7d40WTNL6KqUtSpf8AGVskyO8+MuNp1sAQKP6HevREy2V?=
 =?us-ascii?Q?Hnz4KRBi7UP72q1jwPC/dj+oXIE7jJJVkFLZyzKBgroDYWW+j+wTK8oNi8zb?=
 =?us-ascii?Q?XqKS04EF/0PnGxhwi8zgTJH4afPL9oqgokJSWs1oVJ7rJN8iWKbQTH94KE99?=
 =?us-ascii?Q?HKUdZ8ej2nXTCh7iz91exyPVyG8+KGKM/vNVFRboHZoJtg4HHS4Ro1kkmGke?=
 =?us-ascii?Q?nxxXP+pSDxrIny5k8LEBzS6BYOnO0boq2JJCyV8DrZsb5Tb2YmnHretO7ZwE?=
 =?us-ascii?Q?VYOzzgWagAJp+pkewZr85JhfhtMDW7cZw6Ve/FHociPAnTUQK8m1kh7U2bKS?=
 =?us-ascii?Q?0GRY6rlqanwCH93f2uOByUgP87eQg1mDKB9QZga0aw5eyEbFp7ME4pCuWjgK?=
 =?us-ascii?Q?qeyQvGZOdIKebytJXbjZaq6lm+IGKL03hfz38FnKO0ThkDq4fOMeSWDUALjB?=
 =?us-ascii?Q?go85WzVSyksX8W4GynAKp5ollULZI0u+vQ6QttuPdaHly7jmFWAbtnTPrztz?=
 =?us-ascii?Q?yijWP0I17szytiYa2C3kB+1VVmFIBgPCH+ZpNdomLsjpyAa2MNVvOw3MDx38?=
 =?us-ascii?Q?8VAYWGrV8jPfOZOlHRZRfc2LdO9n2LjMuui8hDj4r+NP4GWfzVO0ZBFF3FKy?=
 =?us-ascii?Q?bfYjtTumLlp3PvPWRhvPM8SrF/foDt/tdYi+ygauYDi57AYDWuWwTrtUBQ+O?=
 =?us-ascii?Q?Zduamq4p7HWyLfa44p2MMTra0CtQCGbTd1PQgKe7WLUM3lvbqgpxvkbqD9Lx?=
 =?us-ascii?Q?rAvl7ltYiX5jOo7jR2VZOaiyd1G27CS6CfsooJSq4727+HzRV+HADpkye5No?=
 =?us-ascii?Q?naSvJ4oVkSi0uyKR89azbhSjKuoqWWN8LpNJgZQ07cr6odScHB4fKK+46Wv+?=
 =?us-ascii?Q?arLsh339dkl245NFknSq0yaKgIyp/frEuALoTYjv9ULXPHKIrCdFsyNWcVOJ?=
 =?us-ascii?Q?nYx+7IWEZrSSNRCnNhKjx7XKztfNKfzZJUYzULankgcmo6mVt/quVbmjnqf1?=
 =?us-ascii?Q?qgvdIliKvXZpxi+q2aM2PUVbQRdiwZEnOAEh5H3TNaM4EPu6Yc2Pr4pGQsRU?=
 =?us-ascii?Q?3MG3t9wfxCenUh7eqX72OU9ObgiQOrubDTRCBpXMjWOLowPAMLNXpqH9+U5m?=
 =?us-ascii?Q?rmJIxzDnxWlR0Yf54XDjBbN1/qdAfYLQdCu6UXOToOJGZDlh+55smDndaNnW?=
 =?us-ascii?Q?5C1SCDCCkBYgU74grJvxiQkOP7ilDmdNdBFnq0+lOfJjUsUIXq5AO03wQuf9?=
 =?us-ascii?Q?kNzRMxqFg8E4vSbckktUw3fWq0+yd2WFA8RYQSxxMTrZldCjkMU+X4nWYV2O?=
 =?us-ascii?Q?iVtV/4xEM9ddJ0agtV2CbTiUP7Ok+FfCIVYLflwYO0iz4bkO+2qwgbdlY593?=
 =?us-ascii?Q?Ew=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56ba5e42-6530-4661-8848-08db8df35c53
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 16:14:17.0700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlaoi0saRxlQf5W8kYtkAm4/DV1h/DOKCJR/dCosMHY7hvlzV9hv3h8vKYNg+ieenNyAGhAdVhxHJpejujbPGNF0g3sydhtcYwG7EB+LXoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6875
X-Proofpoint-GUID: GLdpRAZot2JNpaGdAcsx24J8YXVZPS-G
X-Proofpoint-ORIG-GUID: GLdpRAZot2JNpaGdAcsx24J8YXVZPS-G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_06,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=502 clxscore=1015 mlxscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307260143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 16:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184890

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


