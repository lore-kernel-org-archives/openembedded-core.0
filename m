Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50852C0218B
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 10:54:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13382.1737456867146403726
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 02:54:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3116813fa9=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L7OoDQ026729
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 02:54:26 -0800
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2044.outbound.protection.outlook.com [104.47.51.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4488f72gpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 02:54:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pD9zouJpAHC8ajiuTVBMNz6cKNCHt8b7ofhkRWK0JEXK0BItRMqZy9uZIDeK538SIxAKT7fF6li1IlpeLz+DkSHz+RznKkn/4SU8ioEKqKukUYEuFl5DNG6Ynp6CrafIH20zAzNBJxzGId9nTLbNZUg1ZKyZxGX/FY6MPOveS2OIZyLJvXlils6ge9YJAkSPX/Nbzq+ql48+ocRNqdHj5/pLXN98iqgtqPZr5ho0C8nTAAQyfa3520AiwqT/23AUeXzJicI/ZI8eVhvfNcTgslVXrnYuY12EAWuOYm+xEbuc1LpWAxpKnIOcBbqJ5PTzkPzM5DdLQd+En0UZ5gwutg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3XPDs0uCkzZT3KszuzYl3ZovFOVLMk5geYjpMjuJD0=;
 b=lmhctS9nRMPLFODHN65HMt8fdMR/x4TBo+q6JfJhwlFyc/FaifDlOP30qPbO95+WenJC1C7xV6xhnbkQRR9GVZMQqEWUUry/vZzqfXUSGg8hjqI6lWLlhGfNm8+8ey8qhIUmUPYLGHiWU9WCfF+n1BviJT53mzg4K1ueyS4MZ8iwsZN6gFrs02UYOqLb1t0tMVgCQRMhs/ZkVqI3VAG9lw7+eb3+gditGjcymWJb28nFhGBAzus9Tpy9InBnvdNuglTjfKOfxGEilPOj1OpjW8HBs/C0c9NGOPjEXlzQLAFvSCzDAVQwKSUeKkpYxUUvzACRcnu/zPna6JmYMnz1Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by MW4PR11MB6666.namprd11.prod.outlook.com (2603:10b6:303:1eb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 10:54:22 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%4]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 10:54:22 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH] cargo: Drop cargo wrapper to ensure successfull cargo builds in SDK
Date: Tue, 21 Jan 2025 02:54:02 -0800
Message-ID: <20250121105402.733009-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::16) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|MW4PR11MB6666:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a9a215c-4ddc-4bb7-6b44-08dd3a09f6a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lJAMkm9z5OWG2KvZDY3XhQ37B5BkNd7vKP0BPTr6NDZOA4SJSkC10bXwbzUa?=
 =?us-ascii?Q?zJncRa2iUqimaCx8klnWCzF+YMc2g67as2o9RoroXtko3dX755FTEiL7UOBw?=
 =?us-ascii?Q?jZnyPoZSVxL4M0sK9xEwqhlsK+1siz8Bvk6YRcfgDd9CKhHG8O+VX9iLC6sI?=
 =?us-ascii?Q?xYFThH0A6RmGplePBpGLQgeK+9aofeg/inzSnXGXbbRdqdAV/HJwhqqsbhBq?=
 =?us-ascii?Q?el3HtwywJIooCkRwFZm9rFzNG6AUeRaYRqUcwRT2kjdM7m8h4phFhQ2N2/BX?=
 =?us-ascii?Q?ZFiW2cVDLLD8HHrYW1skY8X0NMM5IErN0KZxRBnzF1MvPONOhKjVOuehxn7n?=
 =?us-ascii?Q?etPawf9c/9x8GXXzY/g1qNpsiSVDiJaOMQCI0ljujorukaCjxGNEl9vOMwtj?=
 =?us-ascii?Q?aOiItf6mQ1uk3g3YZfck4Y3QNljSrrjjudOrOPX/PPb9nJibduXUxXLPtd34?=
 =?us-ascii?Q?R1cZKcVjRbj0JBe8jUL1Qb7rzjGfJHzkX8GGjadrUTaLS1mmlen0JupdfusJ?=
 =?us-ascii?Q?kCs2lp7MTbSkcLXNELcDypPX0gzceWHNdiTdFq4ezFIDw997/h+tYFluHnCB?=
 =?us-ascii?Q?dCbzFQ7+JcMl1CbhCCv6o155m7PYqVe6q/60uj55X7KbVLPIAJ6PtId383SJ?=
 =?us-ascii?Q?vPXBRKqcOtyqYSS0Zm4qH0gqteLpuEyMxABVCl/ZG8xrkyOIPArutUKvKSjN?=
 =?us-ascii?Q?uY8MbIGxQ1TUEQWXyEmAvpGXFvUrdpc8rwFZpdfJevKMMYRF38SaXMM697vQ?=
 =?us-ascii?Q?UecbZSXgFrsXS07GNNGevXGSRtXgEpJsmX+z7SeRSgs/IlRv8wYfVDWxhwne?=
 =?us-ascii?Q?8Qrg6RjvmNv+93LC7utIl2duDNeIQhnl08UDRVc/s10Rs6X/AGaRokMuczI5?=
 =?us-ascii?Q?Tt+TGOrFm82uQRG0pdH0wKfXgxy7UbB1vC9v34VVH0DXrJj7Kxgd0GqY7grS?=
 =?us-ascii?Q?QJlmP8EuEv0W0S87aaXRh3eC//Wzd1IMIzMIwIXN0VuZkcZYzZ8MKjINi1OI?=
 =?us-ascii?Q?5rZfNxgMFSOBlVUZiMiY3rmcNeESiSAxEOA2w4KU0Ntysvbday8EAfL9FWJP?=
 =?us-ascii?Q?jWE0Ayy38rQeQ0EvgYbrwBkXjnFgWEhlb+Ns9dU/daZ1uqH+CXawM4CkCi4I?=
 =?us-ascii?Q?PHGpKPTzEPjRldVcp7EKJjyIgR0EmNsEdumJezysj1Pb5BusKrdEhlg+xk3J?=
 =?us-ascii?Q?OfCt5frrIAk1/r8nFAjrBRf1n3YgURPzbTQYFtP+dyH1w6EdNBqJEviMPGdx?=
 =?us-ascii?Q?e1wV2Ci0G6R90G5zTi2N0ryW5OAmEW3Q/ZmeLVqyC47PwqTxZttHIWFvHJ24?=
 =?us-ascii?Q?fwvufamkkw973g4Fqo09WLX9Bj3ksvh5kCKUDnnmSAG+yTmYXgr+z4zn7ODd?=
 =?us-ascii?Q?ZC+XqvkWnJlya4XmU7jS9b8hzjNxrnv6kFlMin7yQ+WKFMMruQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EL6xG4OhT5fHX4OL1HNJm56FCO3Jx8WMHyQKtqZmtX9HZDZnL1Aqfp5LOPxU?=
 =?us-ascii?Q?q4O557FMGVQ5LZcisqKuTXMe42oNUitM20fRx84H0UQLuZScqulkJkjUz76w?=
 =?us-ascii?Q?v2+9ccKZ9K70UZHv6HdnxTEgW3RQv28wAIwxwvNNGX3+KmGcQUQ4gcBlMsZ5?=
 =?us-ascii?Q?tCcpfPeWiEdo/R0/pJyRfCDwDRAVBjmfv0MvAPzqtRBCQ8s6pVi5cfvPyprV?=
 =?us-ascii?Q?QBY0WVciPGmqJDm3oN6DMYZHkPVfmL44yJz48Mmpm7aXS5ZuX29CVBF1RVtM?=
 =?us-ascii?Q?QeHkQ19dxUhZU9r3JlQNUbEu90T5yXLN1/deuGsC0qLZFKRq2vLu8uC06Zry?=
 =?us-ascii?Q?SN564ExPjKtn/JqqbX58R4toW6thF/L36RFT9H4gmFdP6Hg7eSGjIqS5brNp?=
 =?us-ascii?Q?tajkiIx9IfjG9vHHUnEzSvEYCLserp7yve1y6IM0Uuk87RsXhsI7vV7Qs/+4?=
 =?us-ascii?Q?7ubcNskUY8tbNerTKAVzHBMjHZo60TyXDyXGO1MrOZroTjtgRpY+YxhQwH2E?=
 =?us-ascii?Q?pKcXtg97362bG+avD9RAuxeKg+M2BgNOVv3L8oxqtIZkd0iM3FTnQfbl8SuZ?=
 =?us-ascii?Q?Ob3KyG5qvPm0EXYL/QhaNShfpJ0IykBm+wjqM/5xlcuq7IIk58wBO1usaECD?=
 =?us-ascii?Q?Zhwnfreg9OM6RY6o7e1tsRWUIulfKik7Gt2CboVlcD8DIy47/qbZMnwvkic/?=
 =?us-ascii?Q?olxE1BmLZU0hgFK7J4Lq+8i+2fNzPCbKwW+TqiLPrVAqqcKfQzxWsEbVK3aF?=
 =?us-ascii?Q?mvUXdqkOUBmFDq40TapMzHMQQ5iaUs7233pbRxD+g9YMNkH1rJou17BcLvGP?=
 =?us-ascii?Q?tIb88NzalP5vicED7RjMP2s56x3uNzHkzppx/mBBCna2N4EqEfWFKEu6PJKE?=
 =?us-ascii?Q?PxFLB/MroKF55sFIzPjYUuP/tQgsNKoJYgTQWyLcpMF6LiftawskonR6I49B?=
 =?us-ascii?Q?vvRMvDX03tri0m9B8cTa8AKAy2l5KU3ut05F1z0Gy+Bel9BhoOYnxOqwJbUK?=
 =?us-ascii?Q?eWxRMmLcWINKDbe+N00wtsL2VaK3gND88F97iZ/xPnp2YXUYLtJBdeKhvrAr?=
 =?us-ascii?Q?/A1FkVugLN4LmVVFty3CDy4vkCbXlkLk46YZpU8IuPnwA2T9IaLWuKs1DKiu?=
 =?us-ascii?Q?VLJtIVMu/zkExCJJy4Ner92uxZ60NElZVnwJnT/KWtSN72v/fhP9lei4tn/w?=
 =?us-ascii?Q?JqAA9xYCw8XaB5ZQplXRJYEMDbq+8DHFNs3hnAiFNQWwAc9jU0ODFClfiCIS?=
 =?us-ascii?Q?hn4sHeIBiqHx+KJPS78nA2hNN4qs0bjhh3r7Veqfxz/Cgv5kK/UAM6mLlwRE?=
 =?us-ascii?Q?z7/aQGDvW50WoIJDTHtixBYq9qUxh1FpquDiOVEtEqvHZDOvHWaoVfVqHJcX?=
 =?us-ascii?Q?nmq6fU9RESOeDxE2Vtn7PtGTAeUoBrcPmS3pmGtUWQxpgMn97qBYruFQUt9n?=
 =?us-ascii?Q?e/4FS5e/Buq3Gdcp2CYx1LR2WZeA1RGqnSQ8QguuvxwAKRZlui/qOElMngPt?=
 =?us-ascii?Q?799ysETFBpzKuBS/AvgN3ZLxUSEqrpIVxmtDkIougZBAKgEY98x+Avjrq2Ri?=
 =?us-ascii?Q?9NlJB54YNvW/qpP0N1srT4yacudj6isze+PiI8WWt1fVMrQxLlQy6jLE/Y/p?=
 =?us-ascii?Q?QQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9a215c-4ddc-4bb7-6b44-08dd3a09f6a9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 10:54:22.5434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OvQjuFvAPaRY3MnPmPoZYi5+zsAifuVv47JHrXTStM/3qyx+Q2HoEqoGjiUfJWE9yN+nbf8vj2J2+GWtdyjGzDp3bA77pdoqtFsDs76nRLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6666
X-Proofpoint-GUID: TNDuXG2GuKku8uo5J21y1I-zJIE-UMUw
X-Authority-Analysis: v=2.4 cv=GqG4+l1C c=1 sm=1 tr=0 ts=678f7ce2 cx=c_pps a=E4Q64eWPmlOcdHW0GAz4hQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=7mOBRU54AAAA:8 a=t7CeM3EgAAAA:8 a=DxTqRqHaUZV5obi4_zYA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=wa9RWnbW_A1YIeRBVszw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: TNDuXG2GuKku8uo5J21y1I-zJIE-UMUw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_05,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=962 phishscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501210090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 10:54:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210088

From: Yash Shinde <Yash.Shinde@windriver.com>

- The SDK uses a cargo wrapper that sets LD_LIBRARY_PATH to point to SDK target library directory.
  This wrapper was added to resolve library path errors by including libdir and base_dir paths
  in LD_LIBRARY_PATH for tumbleweed-ty-3 distro.
  (https://git.openembedded.org/openembedded-core/commit/?id=388e7cac9f90e79ce8c3c1683d8ee0f4df1bc907)

- But, a simple 'cargo build' in SDK env caused failures for certain crates due to
  undefined symbol and broken C compiler in SDK. Removing the cargo wrapper builds the crate
  successfully.

- With tumbleweed no longer being part of the tested distributions, drop the cargo wrapper that was
  previously added to address library loading issues on it.
  This resolves the errors seen with 'cargo build' in SDK env.

References:
Tumbleweed removal: https://git.yoctoproject.org/yocto-autobuilder2/commit/?id=96e82ce670c02b166398500435c2df455b09b951
List of tested distros: https://git.yoctoproject.org/yocto-autobuilder2/tree/config.py?id=694d2a9bae523d9396b37da9cc6535a558e04d81#n168

Fixes [YOCTO #15579]
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15579

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/recipes-devtools/rust/cargo_1.81.0.bb | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-devtools/rust/cargo_1.81.0.bb b/meta/recipes-devtools/rust/cargo_1.81.0.bb
index 123032cdf7..091ac3ae97 100644
--- a/meta/recipes-devtools/rust/cargo_1.81.0.bb
+++ b/meta/recipes-devtools/rust/cargo_1.81.0.bb
@@ -44,14 +44,6 @@ do_install () {
 	install -m 755 "${B}/target/${CARGO_TARGET_SUBDIR}/cargo" "${D}${bindir}"
 }
 
-do_install:append:class-nativesdk() {
-	# To quote the cargo docs, "Cargo also sets the dynamic library path when compiling
-	# and running binaries with commands like `cargo run` and `cargo test`". Sadly it
-	# sets to libdir but not base_libdir leading to symbol mismatches depending on the
-	# host OS. Fully set LD_LIBRARY_PATH to contain both to avoid this.
-	create_wrapper ${D}/${bindir}/cargo LD_LIBRARY_PATH=${libdir}:${base_libdir}
-}
-
 # Disabled due to incompatibility with libgit2 0.28.x (https://github.com/rust-lang/git2-rs/issues/458, https://bugs.gentoo.org/707746#c1)
 # as shipped by Yocto Dunfell.
 # According to https://github.com/rust-lang/git2-rs/issues/458#issuecomment-522567539, there are no compatibility guarantees between
-- 
2.43.0


