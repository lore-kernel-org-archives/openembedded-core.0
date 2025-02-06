Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2CCC02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 10:04:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.37048.1738836282351743544
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 02:04:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=41327d5a80=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5166tHDP004899
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Feb 2025 02:04:42 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hfs8n5s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 02:04:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4vlOCS7e4JUKDHlS2OVVqFQZliUqVgOFVZrGttAMfcrS9aGUiEhGxzuswVrS22I+W+rU9BwxNkJdXIzbYy955zLp9WpmKpIXI2IvrYvU9d9zXFpZVkkugPrWjuCTTnqTDbiNUcFHU/SCwv+GmU0w8CH6MSWoQ7M4h3zzcKfQgfH3TBUFnxg/feJr2Esd0pwOSezdiQnypBpds94Kc9DpdXSsr9rH/YgNa5d581MjEnJvLJaWs77vE3waKrB1aLeTHejDLTt1xW9agaW25Ys/PNWb/PS9vTzs9fh3bhccmVOSv6ahMltdTdl8A6l2HwexlLHQTf3g9V5Dqio0ps2Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHvU8qbBOv0XHw9g8UvZGJ9//TokSKNyOMG+ddjQ5A4=;
 b=ywNa0QiGvHkzgJdBOr2KnRfjK8KkV95GxxMgqpxcKXakiHe+z+gVo7q+cl4pAsic51/qvs5+DgJ+GZlz0NeQtqgZ15e2MNJxUBXljXwREsgDBT0IS/4PaZlbdWWkj6OvldC2UQIydQkWEEoMG0Gq4H4cMfW2Ez/Qt3XChZeFw1IOIMEVG55ziJx3xYDY7CSPe0WDNE6CNnnydVej2ra/sx1UEjEucVdMJl48B4uN/fJthY3vuC0jW6DqWaFAPGH7J4nRYiQfpbGReXdvQ3kKElp5S8bXN3JelwgNq6Y+uh2UyT5wi2wob5oswk8WfoxKiSo4mY9Nf8iy1vmc5i0ziA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by IA1PR11MB7386.namprd11.prod.outlook.com (2603:10b6:208:422::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 10:04:39 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 10:04:37 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Yash.Shinde@windriver.com
Subject: [PATCH] rust: Fix multiple rlib conflict when building with rust and libstd-rs
Date: Thu,  6 Feb 2025 02:04:19 -0800
Message-ID: <20250206100419.2539364-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0127.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::12) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|IA1PR11MB7386:EE_
X-MS-Office365-Filtering-Correlation-Id: d2f028de-402e-4e6c-f1e9-08dd4695aa32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GtiG01/Q5QSvnQMYQDHgv9vXYeZMWI/DfZAX78fReYfhc9OUoZwuSxOyZjNv?=
 =?us-ascii?Q?pDNeJh0ERcVR41h2Ti1rvz7Juvp3I4C+fZ67QE72XNNLDWVoFbx4AXIMkBZS?=
 =?us-ascii?Q?Gw4QSf5gpl3rPXiTlUwWozVyMC0PXHuxOFgNXQlHgHS7WxF3D+hjiUUwuNm0?=
 =?us-ascii?Q?5L0xeSMPqXRqViMK/XgpYpz8LUZbCU4cWYisP4rfJJ50j1GFB6ZszzWkUGV0?=
 =?us-ascii?Q?+v0GxCWnuENZOMD+DDWa2Xu6NfpWfsY+xEF98Bz9kZxBp8m4amlkd6iOZzBb?=
 =?us-ascii?Q?Oj6keRpdK/2h+XNzpq+vDuoQfVRCRI4+7D7hI862SdL7r6AnHBbMrmyziex9?=
 =?us-ascii?Q?Setse5QCrevz/B7UrbgFmGprNqw2A6q6DUSqg0CqinwvvZa7pvLI6UVyJWuy?=
 =?us-ascii?Q?AezGrLk/PrfGDhDPpPnVl9FG8tvb7KsCtkL4t9LCQWdCwP7Woxkp/VnOaah6?=
 =?us-ascii?Q?YLsqcsF07Wz9XlCDu4++tCwy2N790jrr/sHRLo8mK6wuRg+SH+x253kc9zuL?=
 =?us-ascii?Q?x/6HcDYKOZrc/UJhRL/FdYv23VK3L09HKBJLIzSzxVggw5gpwyY7l4ER162g?=
 =?us-ascii?Q?OJbRhK1cEjML0Y8KW+laYjCJJ7ZfRn5K8uuIA9/SlGb8GXKsaIrJ6NKiETBj?=
 =?us-ascii?Q?PBWtpTqHnwAGcyYu/k20b7CzZTxc9ukMOQ8fzi96vor9YXYoNCkOy2X0D1Ai?=
 =?us-ascii?Q?GVR7jI6MfdJ8WRZ6IJrVHyrsHwBUuW326vqLTZxDenjCChmhTWPQDth5OWSY?=
 =?us-ascii?Q?aFdVdf9UFomhNsscjtzk7DMxB0xq5bU9hHmFUxZ/OLKx6Z/eyQ10yzXmGanK?=
 =?us-ascii?Q?vUarn0pT+UyS1EaIwb5bj7Ww7RcFYYGxRMZ8LWeUtKaluLVtIAnyBq0lTsZ3?=
 =?us-ascii?Q?m6ONCRxmq8WINIMOyYTw9OAt0eU34hMgT40orsAiPpK0Xf9ZfW0ernsci/Z/?=
 =?us-ascii?Q?jQhdFB5i0MM09kU0fmE3e7ahTv4BUQNsiOzknM7qepeTIqShDbJIX02e+0Z9?=
 =?us-ascii?Q?7ljJ/6r+VajtEJqjhdg2edOK2ABrqz2x+ombkoj5Vvaq2MrCjAbrGHsulu7K?=
 =?us-ascii?Q?owX+pZWNv6pCUR4lKHtb6LNoFU5Xevbvuw7mEjEmEEkpylgy9cxnDw5rHlzf?=
 =?us-ascii?Q?PfmeLasi+UQAK0/Ra/etHe75wztjH/aaXaQoH/P2VXElsb2fT+NvT4bb72yW?=
 =?us-ascii?Q?yJDQHqGM1HYSVhgsmuNHArXyu3gg/FTiOeRty6Uozt4ISg7N7arLE66Mty2U?=
 =?us-ascii?Q?lC2f8HsNtWpqtJDs1qnCAYdMEbtPZ74MsNCSp8AKtdY4HxFRnnoioCbfqcl9?=
 =?us-ascii?Q?yHog/OXo/OMtBKCrxOKNXraXJ/QR4tmUc3y3770tvXh+mNbPa6RfCZlS3Aez?=
 =?us-ascii?Q?gqzTy33jZZqqfcM/RSz31NYzf7JHwjJWEKGgOOjd+rpUmpXBp0zsrbUaU2I2?=
 =?us-ascii?Q?gc1eawi8E7jVv6ElMd9DS5Aq8jCj4AhR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3LuDl6bf4cmuJZcuuourSRYqvm9VrjFoRFbHdMNiPMBdWsLPQXIdLw7k+Unr?=
 =?us-ascii?Q?/mgTbdVCj/hVRu3CBSASpiX/B6gt3Bd+FxSMXZgMZV0KjkomUBu+z04Zgjoh?=
 =?us-ascii?Q?8AzIltbqG9F9OhMcVDu1+goAk4L00w4PrvmuEstgfp6F3UDfNLz20toqzWb+?=
 =?us-ascii?Q?tmeQInfnP7hKeJ1VkXGMjpkbqUxrnqmje4p47c48gKmD9Ary7EkxWr5JkEly?=
 =?us-ascii?Q?BPBwzy5zxJxBWgJ+AO75KQZ/qULwLg8K6EuGN4tMNQBTRSYWGK0WPF8wFD0/?=
 =?us-ascii?Q?hfdKMle/b3s5rZnjI6C+iR25JbQ5hYv5B+nvVOhmJey2ES9UfQdGKNMoTbOi?=
 =?us-ascii?Q?tKBW1CNbE8Hkuo9qPVO2mxi0wz8OXzJBmv1c9+efV5FSDY0gG5lqkbyRjJ68?=
 =?us-ascii?Q?P4+qZnAEYt8IvrA+sUxClRV5m385jVJWwdUuTGjG1nQ94RPW2KyS5m867aaY?=
 =?us-ascii?Q?hjwxDRg5I2kvv4QpPChrfZHblkNxW3dilY6WSWrvC18Su0PTHXU05mmAuC+o?=
 =?us-ascii?Q?EIUcieWl+I1RXmdw4mIW9KkBaCA8TKTB17lX8+Fa9KVGFC6fUGYntBXgIU76?=
 =?us-ascii?Q?6msmROnbDQqMRR9UaLZzewffKs+ySlnig8EtyKq6WFm1a3fAM9wGw7PlOSGu?=
 =?us-ascii?Q?tvQW+StwOUVmt8zpFwg7K3goqXX+L1RN6amn3nFYeOw3XJYOnSrCCZ49qygT?=
 =?us-ascii?Q?IGDTXSTK+pi/Jn2dM4QOZWVFl1ykkMLbZ3Jb/38BkdCT9eztO2eXaOAj8tr0?=
 =?us-ascii?Q?s18XvBT8kXCecYq1mywJWY9Zi5fLi/Otm5QvYOXFWVluwixEk90ZTJCyS3FN?=
 =?us-ascii?Q?qBiEskl7trU9ZHFwWZXeiFmZmX1fhqcWZMCXaPixGQ3fhcsAzRa6+h5n+E9t?=
 =?us-ascii?Q?DjsgJ8FQYJ28uJql8y2IXFojMjIvN/H386tuo4txLmKi0E/MkWFbEFAni23W?=
 =?us-ascii?Q?hk/rcZGQgGynsZX+7npFss18qzBWZH1NHY2XqYdBlyONsebGzf1SPC5PMA4l?=
 =?us-ascii?Q?eXyc0wfqXzqNtbxvWA4Et2bS/3CKLiWwNOP5Uu7Aq0Dk9sMTiK40bBbDg25S?=
 =?us-ascii?Q?0ch22ObSZa+zLcMHmfLSLXJ3zkpvRzffeOFMNYjNPUSz3lMgtXjd0B1W7VS1?=
 =?us-ascii?Q?NsrG8nteID8l3/cRg2PabW0ntlpdiHM49v2m0HnEN+B+083VBnuknwuN085l?=
 =?us-ascii?Q?69IBi2ck7pEfJbPUzxSADdOXc5ZVPlSALXKB6E41dIEBayzOiB/KTZY68Ue8?=
 =?us-ascii?Q?Iv0OzkF4spvrt/slt4q3eQ4WOiHvVISBoDCdZkFgkbYBa37KrYc0JsOoll+Q?=
 =?us-ascii?Q?f14oILiLZfYL4mNfspddpqjqBuMTChEvY7Tz8NQUfV27mGHnTNDMzxEt5rIo?=
 =?us-ascii?Q?FqSa3xk+2A2fwxuVb2oBO/Rrd5FIFVQxcjbE2EqiqB9jFp6W7S/IL72HRlMU?=
 =?us-ascii?Q?d7NIPQxt/6/JqzZaeA3jEgz90O6yYglgMWCwshp6ZlyWn/L2SuEbcd6TIEDw?=
 =?us-ascii?Q?fjHyYdmIOuNLNrRTzu7USgU1GwjpeumpiNqYx9NUsQFRna1f82PuDFnhxdsd?=
 =?us-ascii?Q?DAMBoorMBM8gmucsM2J/SCAHHWWNLJhbT5litNaOvp2VrRE/sg+0y/kyekty?=
 =?us-ascii?Q?yg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f028de-402e-4e6c-f1e9-08dd4695aa32
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 10:04:37.7689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7Yd0hW9O7Y5MAD6AR1IRvTJJSajZQOkShZjCNRfOs0hfm/VHCkBODym7TWszNTAz0P+2rIdRYatmHrq4yvCHBKQ47WtfNpJSiIsrtqfFsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7386
X-Authority-Analysis: v=2.4 cv=JrcLrN4C c=1 sm=1 tr=0 ts=67a48939 cx=c_pps a=AuG0SFjpmAmqNFFXyzUckA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=Ni645Vjlk-PCVTNSPb4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: DrUDb51rjHCqoL5zEuC5wMRO7On9L1dq
X-Proofpoint-GUID: DrUDb51rjHCqoL5zEuC5wMRO7On9L1dq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_02,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=629 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502060082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 10:04:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210911

From: Yash Shinde <Yash.Shinde@windriver.com>

When building an image with IMAGE_INSTALL:append = ' rust libstd-rs',
a conflict arises due to multiple candidates for the rlib
dependency `std`. This results in the following error:

error[E0464]: multiple candidates for `rlib` dependency `std` found
  |
  = note: candidate #1: /usr/lib/rustlib/x86_64-poky-linux-gnu/lib/libstd-20c3de2d9292cd03.rlib
  = note: candidate #2: /usr/lib/rustlib/x86_64-poky-linux-gnu/lib/libstd.so

The issue seems to be from an extra copy of the rlib as both the recipes
generate the same rlibs, causing conflicts when using std lib to compile
rust programs in the image.

Remove the redundant rlib copy ensuring only the necessary rlib is
present and prevent the conflict.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.81.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust_1.81.0.bb b/meta/recipes-devtools/rust/rust_1.81.0.bb
index 288b0fbb44..70c2f3fbf8 100644
--- a/meta/recipes-devtools/rust/rust_1.81.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.81.0.bb
@@ -272,6 +272,7 @@ rust_do_install:class-nativesdk() {
     rm ${D}${libdir}/rustlib/install.log
     rm ${D}${libdir}/rustlib/manifest*
     rm ${D}${libdir}/rustlib/${RUST_HOST_SYS}/lib/libstd*.so
+    rm ${D}${libdir}/rustlib/${RUST_HOST_SYS}/lib/libstd-*.rlib
 
     ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
     mkdir "${ENV_SETUP_DIR}"
@@ -310,6 +311,7 @@ rust_do_install:class-target() {
     rm ${D}${libdir}/rustlib/install.log
     rm ${D}${libdir}/rustlib/manifest*
     rm ${D}${libdir}/rustlib/${RUST_HOST_SYS}/lib/libstd*.so
+    rm ${D}${libdir}/rustlib/${RUST_HOST_SYS}/lib/libstd-*.rlib
 }
 
 addtask do_update_snapshot after do_patch
-- 
2.43.0


