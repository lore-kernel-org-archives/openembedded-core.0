Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2105AE7718F
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 06:54:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9049.1735282439763856113
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Dec 2024 22:53:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2091c24697=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR5saeK025794
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 06:53:59 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nmn8d9rk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 06:53:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S27w3oQPXQIvwdTrF0gMvp8K0Ck8ajh/fAa+52amw+FfG6E9BG46vBAqBR0XL0uP8VDDzi/Vcm6xZbkEEcl+9v64RY0ksrQ5ocwTjDgd4qBGED3J7NtmRK68d9hdF66b1RTnFTeeionUryi/mkealcsVeOVZ5SfMw7U88G57wKv8pVkjgjVNzhPWE1tyROEyQpO0aQ/j47gsId4/9pkTUFpJL+GRpFQaWy4bx0OUnyqS9zx2MolcYul3qQty8IpsBt5mWeL2aIRmmY9iegLri8qLsLOyCZGD8b4BDF3YEnAmztcQBNgxP2GhLnYGek3ovQMqIMa896aDVKcEeag7Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cv41km74rNoXxrqystEV/L1Z9KZTBPcvnV+wWlmXCdM=;
 b=UnenEBbk2jxQlQXNCT38DGhrMfNj1o3wJlQHu8WI/5gBO+G6uVBqlZihFn/PELfPakK/uipOchnA6AwMSUfS0jAvQwPl6e5B2FPS2lNC/PAPhROHc+f6Z5diZr7G/3lTYk3pxEVjcFUuPskeqA9oKMTzp6bTl46cwVQ9WKfP8xFhjhl8bsoikrIaHoGx4jD9UdpYnbfiIES3EyNu3EGN1y9fRKFfdC5YHIpHGZ/uyRWRi32916bn2kBoIfUD30EBkWOaw/M4Wex7LjOTypm8bA7S1UzQ5V3S0FiueJleQMY3BXgQt1RQGihBmeLpdig+lMM+TbgvrJNlAH762rB0vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS0PR11MB8133.namprd11.prod.outlook.com (2603:10b6:8:15b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Fri, 27 Dec
 2024 06:53:52 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8293.000; Fri, 27 Dec 2024
 06:53:52 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH 2/3] rust: Fix for duplicate libstd.so
Date: Thu, 26 Dec 2024 22:53:36 -0800
Message-ID: <20241227065337.1257972-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227065337.1257972-1-Deepesh.Varatharajan@windriver.com>
References: <20241227065337.1257972-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::24) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS0PR11MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: b282df2f-b4fb-4d8c-aa15-08dd26433996
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zBZVCg/8Bn7wI4jeRuvejDpl3kGS23PM3xqldpXsm8jQG92fGLtw3/dqyl2o?=
 =?us-ascii?Q?QAkhLDUdpskaApz04pNUB2zB7kPKpiXOIxAHbeDii+Qmd8JwCRfKRolNGvt3?=
 =?us-ascii?Q?d/0KIBE9/h7NFxhMpHaYRenTN9Loxjin7nSxp2zzWOmstijdQwBRQz34kqcr?=
 =?us-ascii?Q?vv/W7RplrKfZPinlrlZxbXDKwksBrpDSI547glDWJwtKxAnI90syrStSUFhT?=
 =?us-ascii?Q?p0QIm7U7h9M8knWTy33XHdHhiyGifVAjPZpqQO9tYUdNVRGDQwc3sajUtAwv?=
 =?us-ascii?Q?lWl8BwXfcbfC+syiMbbbypDk0YnnoTxujam4HluNT9W6UTvvLlsvd9XsKqtt?=
 =?us-ascii?Q?aTMCEfUaEOtVYwGwtrpIQmw9X61ZJyDhVPNihYqvKyiwBBICNdszG3l+zNFz?=
 =?us-ascii?Q?ydvyiNUZa8u9mfIUgyZkryM5qaOVTrxzRrLK5WAZRmNeeGAs3if2JckTTSQj?=
 =?us-ascii?Q?RATaA0GjPoEachBVVlHuuckqF36VfmGdjteM/xaq3xKn6pe/sf3gMg2sknhy?=
 =?us-ascii?Q?REkwmc4MMSV1zsiCeBF/i7NFLqLsHMKCwZROWlFdH1CN8VtNJkkYDy/Z+5jR?=
 =?us-ascii?Q?YApST8KWqWA7CntUdL/wGMWvD5B+jzzxgNw/0fweLBa1W4I5RSdhtdwL8XfL?=
 =?us-ascii?Q?IcXYQMJrWUfhFURrQrZfGHTmT5HqYdflXTb97PXvf1uIrfynmDK6fk1hKGiR?=
 =?us-ascii?Q?EL/hSMx05IiQcwpF01L98lvFrj+RwdZNDj6wfJSAhbGOHr8MVF1iNYQWwoTa?=
 =?us-ascii?Q?ainGRPOj4QCbIcbvyXPXLNGz8jHRXIVKpwxB72xS2B6PWuw7FwOfYwV9Fl/q?=
 =?us-ascii?Q?jXQExZlyI6t0dCNmViJvQfMKSzNNDHg6HPDcYru5iSs5VJw1K23fQK5MWWZI?=
 =?us-ascii?Q?YSq9U27VRNi+u1jWkiMq/huP0jwTr232Imy3z3yDMhZhE53/IbDuiup5OGq2?=
 =?us-ascii?Q?V30DeicpMHwlQgSJV9CXuKsqiEjZl1AZ31JcUEEwr1Rm0e00bPI5egzWrVye?=
 =?us-ascii?Q?HQqYTrmB6v8zsagBjwgHg+wISObpy/NafxW5K1mcpu852H+3+YVAt8iOijpM?=
 =?us-ascii?Q?J/vJrU4JCuEEVa0dtMRMTmuYcgp0evg0+fOD031ZgcxmMi1wH55OtAyhR0sf?=
 =?us-ascii?Q?vvvH3aSk7Qje64JSpjpu9DdyT4VophEpXgMvRvNx19YLGL3PY7xeRP0sozdb?=
 =?us-ascii?Q?CwGs5MmY4vRPOIR+wXrIyoNzHy1ny5DD9tbBMfSojAmqM4hvgRscYaM+ScLB?=
 =?us-ascii?Q?mkoDlGNDuDcZNdYjEkoBZMMeGn70PUd5rS3G3IQYXhkmj24DgsOYFW20DJR6?=
 =?us-ascii?Q?zmGyrYF8RO0CzCPL7kx0+2kL74f2ZKYXrtMh5/ltwxf3AiX+v+oSYM0NAEe2?=
 =?us-ascii?Q?wOtAThYi5zRWZ3FboagN8qqMkrWPuJ+Hpe1NOX5CcFxkO1zpIpMjHTn+lcPI?=
 =?us-ascii?Q?E88S19RBpYRPFb4+i/CGb+PLs1Asy1F3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?o74Dk9dIs1seMrXSYR/eMvp0EACVQ+4/j7/8X0LUbdQaMvmzvhjnM+LlS4cK?=
 =?us-ascii?Q?IyOxVam5sUKx++xLddmuW6rDnTdlhhvz1OR1w8UzxrIk4ZL4c/9gU6zCYDVw?=
 =?us-ascii?Q?O5GSJLkyZDXaRNFePsXTFVWG80sK/uPz7/iPdnPv17Ju0/XXy7bEBAmDDqtj?=
 =?us-ascii?Q?43GWez/ZF7tPjs8Zazg5UYVi4foJpjQ8t92uQLQVrEoJv9JKLbiad3xWJSdI?=
 =?us-ascii?Q?uiP9F1tN/SSYRGtIrqvlLvGNsMakRJS4SPd5CLYAq+5GfD5pT0tQtWZ4Uxv1?=
 =?us-ascii?Q?kucrWsROqOunQNXqkYxjnvh4g5FjpIZBLP5UPOSB2219DANaOyitayDNI1F5?=
 =?us-ascii?Q?bGd0gB/dCi+fmmIpCErK/0qLY4S2I7e9YuqbPWzMu7LHBIgv2ngBYFGLfBFG?=
 =?us-ascii?Q?UaL51SKYNeKwj2mZQM0naEuh1YRObgmDwB0+Y5UsrLPUUdXSZKdXLtjRmwb4?=
 =?us-ascii?Q?cOQuER6jskYaQG3nI9wdMyfeII9AK0liScNfiC1kVj9ZBxJxYsGEcyp7jHcq?=
 =?us-ascii?Q?9O84dCo380aAiS887W3Xn2YtKoaxV8yz5GzXUzTP9qTUymjcttN6XyG0ghXN?=
 =?us-ascii?Q?M06yL7NnWAxJTSnlFBCt48UQYbP8LviN36UdBfZHJwg1ge5azFK0/ARCQjpP?=
 =?us-ascii?Q?WviDe0nOVbbMWQN3o4Up84Y3HPgzQ0+HLh5tfG/n9xtpyMsr27HDVYLn7un2?=
 =?us-ascii?Q?NUKSpZAmC5Q8upqim1Df7m+Sti6/Mqws4w2HUHBD5jNDzQl7AIhvPOQeIOTU?=
 =?us-ascii?Q?1NbC0i31/IBS7AyQYO7tiUydvBypRaOc4BtAkvpllg4nBr+DRUSmOul8kOTp?=
 =?us-ascii?Q?4/rfNrqon9uiSbQv7/aeF807bBQi9U4yLtrzFEEO0sK1fl65mhQoMfWf9DjT?=
 =?us-ascii?Q?tk8C+YJXCJFIVqBJe1852+o4q5WKDdiLTd7PJ9pSo4TxzM0T0nCm+gvHrC+m?=
 =?us-ascii?Q?A/pZO02aN8ojXBhLRq4kbMZCy//eKmU4Lt0r15L34vLkPW1o//GXnse8OlUH?=
 =?us-ascii?Q?k1b9qvW1wGpAn3lzMfmxUpdIYdtw1Q+s/aNZRVWsAG7Uj1Jv7hlGKL/qTgWG?=
 =?us-ascii?Q?a+m9FTzEWjrTmqv3K0Tqky65hoCFuEp/lV0aUU4BB3IGfjjQOUpE5jBF1vlC?=
 =?us-ascii?Q?2iIIyI4UcGMvicBv+HN7kY+YYA02c1Uk8zsb9bAfgUJc96OENR4v1ZgME+yE?=
 =?us-ascii?Q?lIqC98nvN0c5cWcJKgLQERive7gEJe2csHmUHD0yaV4lvShJLZN1hT0regnj?=
 =?us-ascii?Q?phYx6t1dnOQnGx6LidTdN3V3cuj801Wo5B90VX35AGIZBiT5cX5rN0K9HkQV?=
 =?us-ascii?Q?w+PUUmNMw+OL0YlpZl4VtoFJyDfHc14tuZMEQNXX4ImxMisn4SQ0WV+PvxNa?=
 =?us-ascii?Q?h85ezPGFnR5iweNt6YITWp/GaoqipjdkG4CyuUpCceAI75cjjl3rClTIwqjI?=
 =?us-ascii?Q?3y0YA9YBY+g1TP1b8+1vqZLW/tmEP3FT6kFZ1xqLmwXOiHJPtGss8JO7Ckkh?=
 =?us-ascii?Q?0I+TaU/gJrb4c7+TYnxNGUdsBMI8CyaXwMmzdZffJwp9K44LMmHREeqw+2O2?=
 =?us-ascii?Q?tG2DdyXJhd5OkbyuKPAy4q4PNrTUpNAkn6wg4hW1CA4sAMytPTOl8m7APMKC?=
 =?us-ascii?Q?lp1LxVqnj5Ltgl9Jrpld0sA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b282df2f-b4fb-4d8c-aa15-08dd26433996
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2024 06:53:52.8043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7VgfmtxcxTTgCn1+Rh/cFAek3taV0ZFF5JRT/AEDerqg6PcfoBIJ4WlCnQXp1FJe1rZxvDxEyquBR2zbQ5YyD6oHrgaOAOq8w6blkD8LSnQR6ABMR5/TsLOFH+7wk8cu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8133
X-Proofpoint-GUID: aSKFApWOtpAfuiCs-s7BUgcYlQuXPwiu
X-Proofpoint-ORIG-GUID: aSKFApWOtpAfuiCs-s7BUgcYlQuXPwiu
X-Authority-Analysis: v=2.4 cv=CeHy5Krl c=1 sm=1 tr=0 ts=676e4f06 cx=c_pps a=Odf1NfffwWNqZHMsEJ1rEg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=JZ-T-SLG2RnevwI_bg4A:9 a=-tu3t9Ey6INAYvtyu7WB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-27_02,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=697 spamscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412270058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 06:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209095

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

The `do_package` task fail with below error due to multiple `libstd.so` files installed in lib dir.

---------------------------------------------------------------------------------------------------------------------------
ERROR: rust-1.81.0-r0 do_package: rust-rustdoc: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust-rustdoc/usr/bin/rustdoc)
ERROR: rust-1.81.0-r0 do_package: rust-tools-rustfmt: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust-tools-rustfmt/usr/bin/rustfmt)
ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/rustc)
ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/clippy-driver)
ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/cargo-clippy)
ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/lib/
librustc_driver-fc36770e343ef852.so)
---------------------------------------------------------------------------------------------------------------------------

To fix the redundant `libstd.so` files are removed from the usr/lib/.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.80.1.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust_1.80.1.bb b/meta/recipes-devtools/rust/rust_1.80.1.bb
index eae1f28bb8..2118c2fe9d 100644
--- a/meta/recipes-devtools/rust/rust_1.80.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.80.1.bb
@@ -271,6 +271,7 @@ rust_do_install:class-nativesdk() {
     rm ${D}${libdir}/rustlib/uninstall.sh
     rm ${D}${libdir}/rustlib/install.log
     rm ${D}${libdir}/rustlib/manifest*
+    rm ${D}${libdir}/rustlib/${TARGET_ARCH}-pokysdk-linux-gnu/lib/libstd-*.so
 }
 
 EXTRA_TOOLS ?= "cargo-clippy clippy-driver rustfmt"
@@ -294,6 +295,11 @@ rust_do_install:class-target() {
     rm ${D}${libdir}/rustlib/uninstall.sh
     rm ${D}${libdir}/rustlib/install.log
     rm ${D}${libdir}/rustlib/manifest*
+    if [ "${TCLIBC}" = "musl" ]; then
+	rm -f ${D}${libdir}/rustlib/${TARGET_ARCH}-poky-linux-musl/lib/libstd-*.so
+    elif [ "${TCLIBC}" = "glibc" ]; then
+	rm -f ${D}${libdir}/rustlib/${TARGET_ARCH}-poky-linux-gnu/lib/libstd-*.so
+    fi
 }
 
 addtask do_update_snapshot after do_patch
-- 
2.43.0


