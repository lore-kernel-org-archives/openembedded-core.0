Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C99D132B0
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 11:22:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.55474.1730719312890242630
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Nov 2024 03:21:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1038b71f78=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A44x1uM015833
	for <openembedded-core@lists.openembedded.org>; Mon, 4 Nov 2024 11:21:52 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42nb289nhw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 11:21:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zi6MmPXZf9wvCLJkAlR+ezYd44wbtL/YpDlqAC4YLpl5QtuZuYRHhV1CV5CKpnVjrPoNRlpVYo9prygBz1rrzL1ZgviqTCV4cpjEkrVKdnJVP0G+N5d2Y5Mtq3+wVN9VsVB63brBugM/4xv2vwADaEpx8BhiyFcZrZxkpn9238Y7X42NpsdkGjfNkPAPUJrI+0jyJ5oNhck7LmHYGMfJQJO15o6QqqzNWISdJfSRMj0HIkB+MOekETOLgTWQBLkG8VTDWnfuZOi+zGPioj+esd+3rtJWE2F7v+EUXBbliGncyAO5quywfYg3dLLoQXw5MWTjViYBcK0bAnH3SAUAAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HAJquSWZCVxabm87p+lf/wxy5bctUSaGi8ru35mMZs=;
 b=TeLPVhJ7gcO/btlQI/AhyrfQAm6r7afe0ic9+eWifOpvRVlreSoE/Dv9vhxHFlniqQgOH+LWaExSauLztYP00MHQVJtAjPVTSBqf4JqfA0O2tekyDXtu1aXwl6gmsajPqGzRe/8Op/9OxNcf0o5T3NFNC9sKcFL+VkUAFssadx06RZ8XEFt+GB+zPTMt/ZnP3MD4BippCQ51rUn+3Hsnhey0CuKSz9dO02Vve8954w405i195vR0tDmrh+bOL65QvF5nIoKNud3jyv2qyOXmhiMMrgnoj79OCf0aOX6Tf8APv/ObbcDxoWAM+rmjuJTvRI0gib5oZyeYoW8gBu6KBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by CY5PR11MB6536.namprd11.prod.outlook.com (2603:10b6:930:40::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 11:21:48 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%3]) with mapi id 15.20.8114.031; Mon, 4 Nov 2024
 11:21:45 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH V4] rust-cross-canadian: Fix file conflicts for arm and aarch64
Date: Mon,  4 Nov 2024 03:21:28 -0800
Message-ID: <20241104112128.1548308-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::29) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|CY5PR11MB6536:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e56c8e-f048-488d-9a60-08dcfcc2ddf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iQE7GZGB6Rmg/2ArFSKdIkVw/bEhqKF1cZsRStWdFBMRVOKY5vXfL8SH5Fia?=
 =?us-ascii?Q?53yf1fA9NZ4hEfirQcfL+ayXdNXXWmQfKu7wZdo6qWOZmiNh38V1usNs2UPr?=
 =?us-ascii?Q?l/sVM9+2dLYrCHHMJGbx03vWM2xeXggXkt6G1nwuEUTZcmgEM2xINFbPIMgG?=
 =?us-ascii?Q?r5CwI68F9tATPh9bYCliDukW+v76543kQJdxV4fmG78i4z/I4NWMlrWxeEFy?=
 =?us-ascii?Q?9y9FLU4sHfMEL4TMDAoHHeCYkH9A4gTiRh7Pw5ZLvbSpe8aajYAKj9gqGqSu?=
 =?us-ascii?Q?yyITYYouj6UshZGGlH5X4DcGt6yiNm/fN45AlMFmxNY3mfJbOcOInuOWj/Ue?=
 =?us-ascii?Q?HU/jKZZ7XjeRem/3zTNQGZwL0db1QiIpxIy4iTRRckVND80Goy9y0rgL6LUc?=
 =?us-ascii?Q?u5vybRQtnzBLTf6V5hfuOLZeOgNTbhlaQ8JNgllUVc2ND9FCWLTNqy+GZ4+B?=
 =?us-ascii?Q?pafeVfCLTQVw0fWFoaG9KVh/4RPcGDQOxuGteWFHT4KUlhIxce05pJ6+zDH9?=
 =?us-ascii?Q?iOLpVh8qXhqfPBY9LMYsqUgjq1NkM3KBEnAOFRC7q9Rh+EqbCuuFdkd6vYW/?=
 =?us-ascii?Q?9bMUuHupgEOgThx0PHsAxhhDG+orwkbU7SRkdHfkDnIyUmBnm6rOy70p0Raa?=
 =?us-ascii?Q?R7EfBfj+PolPamchpFLXvLvH9epDNWMg9suRAne6l0E3vjaT81f9hexePQDe?=
 =?us-ascii?Q?0uHnq9/T5AxYFHCVnH4dk2rwa8imPF6Z8gUuZXbwfteubnLC8PgFU85EnjSs?=
 =?us-ascii?Q?FuoDT1X2I//UC3s7uAxqo1WszpmgtdxPowtrEyDqwuOdRvJSjdIaT6tMoWPB?=
 =?us-ascii?Q?e6BD6IFJ2j6BDBL/hA+X2QdJf/8BHEtuKU5BDttMOWelbM5Z/GyQv8aIU2ki?=
 =?us-ascii?Q?H/1aI9Rlw+UoXQzcFlvPnVgCeBnaOUrrzJLRmYycs1UU8vVBNn0UIOCbFhCm?=
 =?us-ascii?Q?Vn3LUePR/VHt686FGJEH2TsNT1Be9gkV+eRly+7Dq1ve0U+n17SmKMtKBs8s?=
 =?us-ascii?Q?Yj6stYKOuVlkAJzFRSUC32IZem3yUN3pUbzpMju3j4E6LG0XRzHCHEsx7+1b?=
 =?us-ascii?Q?sRQgu0XeGseMPDViV5tM0EGpdKF08Re0Boxfqj5KLQ0Hmz9v3JKPbZhtcrZx?=
 =?us-ascii?Q?YYbOQQQuPAOORfQX2cZ2mZhFc38zALZEa2Q9KhjH91aWl78ubcuktQLcDlCp?=
 =?us-ascii?Q?uQoUc0r26QvbyXQ46wdVMjpB1Cabh4JvAimGsvTk/Z5HL2OvpefDhy8sfOTz?=
 =?us-ascii?Q?QRyIEBogKXlIVlVmuD22m4gGQMKOMTikEwwmp8iKSrVzSPDIY/uGl2oSV0ak?=
 =?us-ascii?Q?9/vkLX181dftzKXNeGIahXmVxhgVs/govzwhR9Ob62EYbMAhhfmPzng2i+Vv?=
 =?us-ascii?Q?dISJGWs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3OKEVjRQBTYgfUjM7KXoDMzRHW89Nop7Qv+7sdyaTyNftv9jAw12ZEtx+nJu?=
 =?us-ascii?Q?BH51xNTui/uvuQGFJmNgNE1EulyVvKqJZ30ktlbw8ADQPYvAVCX4YxD9QP3a?=
 =?us-ascii?Q?353no88JvPw2/B6GyEl3cZn48/jdBcnNQII0Ci5WztHYAaDOTSa0eu/EQkrA?=
 =?us-ascii?Q?ZAgDP/EWqQDCPX4d8g9GFYJsIxW5D87a1gthlXMW7cYwaBTip9b+U0NwFFLs?=
 =?us-ascii?Q?1tCgMhUMXNhs2VY4GEB0Fi96OZkJe3xqOh44NzvXeN3ox8mJ8o2zFb6D8wZq?=
 =?us-ascii?Q?IXHea9EPTPqPN7hn5Px3UuDf+KC7rdzUlHn/YHAJy2NFuv3cKAhGrJwFsFM6?=
 =?us-ascii?Q?YCh5hjlXwuKlZPRmAj9Y3+ZNif/ZLE+2CLhwpFOy4AZZmUcxakpOWBx4cqGW?=
 =?us-ascii?Q?qXficvbV6yKYba0jJiN7rm4Rem0sYe3SrIbyG1wUVpQoMR563X1gJF+FLcp4?=
 =?us-ascii?Q?nEAFSee0dWXjDAmHP8Bk+3yT8uCkTUqJhg9bV2vIeqW9BxcZo8K9uylw1wzF?=
 =?us-ascii?Q?sUhAr5XCEgmHEhHVLjjOua76g6x6W6pMcXPAEd4pCbH8o4ZmBCAshExlnyst?=
 =?us-ascii?Q?0TAMPIauUcuwerIhJRUp6X6qfgwfuyvdDCzLLGKuImgz/FWtLicljRVsGH6f?=
 =?us-ascii?Q?O38EEt21hSNgFhF2cFco7hHErJoHe9+WnmW7vAP80bwC++ZYTzbj6l7w6w3m?=
 =?us-ascii?Q?ksjzxH/l/0f2IMFpP9kO+SFCIJEUiKXqkpkq7LSbn7dFOtRAK29Ir6D20Drj?=
 =?us-ascii?Q?3f098WikrUNj1r+uFeKR7/IjIbDXmjge4cfAMa/VhMUJBNnhVQfJUWvxM6xQ?=
 =?us-ascii?Q?DXbqlr/LGZsNiYHgTplG2Hl5l6wkiKLUT8CML0P85SUD70jwimOifab8uDf3?=
 =?us-ascii?Q?6dQSMBGVVLsXUa9lfNYzWvz39ARwVXTbyvUsYRwX7ZcJQN70Bt2avD4u/qH2?=
 =?us-ascii?Q?R2StsWG0ZeZ/nz5qZ0774Fx0TyZpyDOE0kWd3iJyT1JzROV7pVtmcJn9D/hA?=
 =?us-ascii?Q?qEgRj0VINU3NCfV6uFQvWJPH5yl21oXkyCgCdo3oFXAgl5ovQrA9iKxFrjxn?=
 =?us-ascii?Q?32McmJhJIUAjw5yVkHSaI+66EIUUwJanlIm8ozoYTKfcb3Vi1msJwGzmXRt0?=
 =?us-ascii?Q?yigfYjatNbDffDBO9Rl/h/kQ3ER9sv8RJhLkV+Vdn65vto0b6+CTshTcl2G3?=
 =?us-ascii?Q?vuwnsITIV/EUyyiWuZGzPY31zzbVSOYtwzJvIGENNFPI2ySl/fRqHV5DUUek?=
 =?us-ascii?Q?Wq4+JAacMx/ebgO9zQQg+soeVBFfFz6LDuK2H6WKQBT42gPFrsgTH6w+BLGQ?=
 =?us-ascii?Q?dZhlWm/YH/t8rN+Rq63mILHBKSAmWBCFGnqBBYpxHZrqPGPRHSg9IMhPvy7q?=
 =?us-ascii?Q?oINXkbtawGcn+NZsJBCD350L1EX0ipld/UWuRt0LJVcQ2tjploks7OFVEFKC?=
 =?us-ascii?Q?6AtBbAaQe7PTpPyZ/H2KrA3KIsA37cYYHzHoFun2j3R4pAPyOpMk7Rr1B8ql?=
 =?us-ascii?Q?Kj4h/tqci6sdmRdTGwpYku3bCLHAX0DZyZkapbxqylLagcVgIoSH/xj6tOl9?=
 =?us-ascii?Q?53uNLXpcwZrwtyZ7pCTHkB+4C/IM7ra6aeJYHAhZ1g0OY9ceORsG5WsXJ8/w?=
 =?us-ascii?Q?DQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e56c8e-f048-488d-9a60-08dcfcc2ddf3
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 11:21:45.8518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1UN59Ol0bRxJ+kEowfjqorqsQxM8ewSahHgvtgX2lpa0RE6OHapejAa6zVDQJHG128S7J+dXbqAnmKrAMLNBuIq8Pxy5l2Q8FoT68+qQJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6536
X-Authority-Analysis: v=2.4 cv=CfNa56rl c=1 sm=1 tr=0 ts=6728ae50 cx=c_pps a=t4e0UQJdoJrPmzgCWb9hsw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=Hp82nO5V1qQDSuiZir0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: _yJuHs-yM4629VyVL3_yRLcen670IbkV
X-Proofpoint-GUID: _yJuHs-yM4629VyVL3_yRLcen670IbkV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_09,2024-11-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=629
 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411040100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 11:22:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206676

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

[YOCTO #15061]
Rust multilib sdks broken because of the conflicts between attempted installs of rust-cross-canadian for arm and aarch64.

Arm and aarch64 target architectures are trying to install cargo.sh and rust.sh in the same path which resulted in the issue

The modification installs the scripts in different folders based on the target acrhitecture and hence prevents the conflicts.

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index c34b839d15..81d46a45e0 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -52,8 +52,8 @@ do_install () {
     chmod +x "$outfile"
     create_sdk_wrapper "${SYS_BINDIR}/target-rust-ccld-wrapper" "CC"
 
-    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
-    mkdir "${ENV_SETUP_DIR}"
+    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d/${TRANSLATED_TARGET_ARCH}
+    mkdir -p "${ENV_SETUP_DIR}"
     RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
 
     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
@@ -89,5 +89,5 @@ do_install () {
 	EOF
 }
 
-FILES:${PN} += "${base_prefix}/environment-setup.d"
+FILES:${PN} += "${base_prefix}/environment-setup.d/${TRANSLATED_TARGET_ARCH}"
 
-- 
2.43.0


