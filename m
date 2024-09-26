Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB54BCDE008
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 13:35:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.43139.1727357708484821194
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 06:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9999e03b0d=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48QBOSuO030228
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 13:35:07 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41um4xkf5g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 13:35:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ubMDHj+/I2BK4CFtFKmsJpQGp56825M/4Nd9mdAd6ENA5X/H3YmlcDZdwnK54OyO4732lKjxao7mGM1Wn9UenJTQd8V2/ot1jWd5bxOqd1lVk8IqHqpFtjrmdXDPIiCtdIfTfpvfhncGk6WAwW0GJsDyJzw6kbnZCCd+RU5VAnNhwsNg5mwEVIO/F1Pb3clPxmKLCjqPjitcD7kzJ8giWHPIhufzHenD04bGFw2bLtnp0U54gXqcrckNoGBg/JZisNDFmMLBsLQlCkcUwZ45pGrl69UuLoKX4TWCe9pn/n3hS3+tfc1m887xnzFOLSYh83gTbdAiMA+zQv8XvQx3JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1B7n5Fo/lPtAjLEPbYTdVcSwIdTKU+Hj59+G9Uv7aPc=;
 b=rauVk8MtBd6yoe4xu4veDvTvPdqCTLvxGF4EbHhHMrPmWyKsh7EyrVYUw8/X9Y1Kh18oMVidvTWPE5vTNmCnu1v0Ji+yMaWmsEH75DfyYwynPratlGJnsJAxNYgbTtAaDZiTKewJCUdvGondmPuIQvYZ3J8ykLahP7xvKLdg49snZu071rxg/aVYNz79JHDbWTguzK7W0KLER4MgtN69Vs4aBKi0tL05MSmlTiCrpF0BRCvS3ZrqIFYQkI+RmhlMnHugaAWniu0J6t3c8r84j+G6WNA5l12SCEa4Mbh99M5EQ7H/OWqcA1PaGn2twGWs+ygrlrKcF4/C/QHST8j/RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by DS0PR11MB6445.namprd11.prod.outlook.com (2603:10b6:8:c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Thu, 26 Sep
 2024 13:35:04 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 13:35:04 +0000
From: yash.shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, SunilKumar.Dora@windriver.com
Subject: [PATCH 2/2] rust: Upgrade 1.80.0->1.80.1
Date: Thu, 26 Sep 2024 06:34:49 -0700
Message-ID: <20240926133449.1159940-2-yash.shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240926133449.1159940-1-yash.shinde@windriver.com>
References: <20240926133449.1159940-1-yash.shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::30) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|DS0PR11MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: 27cf7589-4092-46f3-61e9-08dcde300764
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hkz+m9afZ4h8rxduQaO+VSOnC0Kg9cHEURLjO6P7MHJuXrkefK3KvMSTyYka?=
 =?us-ascii?Q?1qipGtuh+ulRC3E2S24II1/yctVr6/SXH5pJbnQoA1m4VdcvEFmhCH+SF89/?=
 =?us-ascii?Q?xhHJD9yjeRpyF83FwIIHWor3pnoR3TXamjhXbM7Agv4cHZDgK/dfLzeJ9JbD?=
 =?us-ascii?Q?EMYc3yZnyWi+PIjjnxG115LoNUAjy1LuvxYajaljL8kkONWSvu4XMV02EQ9u?=
 =?us-ascii?Q?G//XOIsAfVD2AAIjEOl9XoUSLarb2t1VlB5h+w/XDjrK4vVtKpfmtbxnGWiT?=
 =?us-ascii?Q?dANeU0nGXicZJx0CayoK308S8ZpGzC09YdDI0rW0BzyeBg5lk0it7qAwhBYG?=
 =?us-ascii?Q?vil9NRwOVJ4zbebxBSkwCcppJEvSRTicLY+2k6RvD++pI01ZvRQArEnacC+O?=
 =?us-ascii?Q?QBm72CA1+NC/s8YK0mv08bSsOj7VfgI5fn5/grj2+a0O7hv1IV17luC9ZN5V?=
 =?us-ascii?Q?s/OVsxkNl9s+nAVyMvQ1icYI6f5bRBI0WmMCym7hOyhMWU8UUwENQVldX/Jn?=
 =?us-ascii?Q?Vvz4t0B5qdWpY3+EH1ZRhjgC9C+et1xQoZaVeZi1vNh+dGXBO8y5YTiqA9RA?=
 =?us-ascii?Q?gPqnrnBbOedZ6CjZ3E6ixEyOm/VTYH6Q6G7Ee75bcWsw/Tsz5GiK0F5ZyCwr?=
 =?us-ascii?Q?eLq7mr6Z4vq8wjE5UslNtmylGDBWR49AjRKkK6l0IBU8YRaXEo1C8oquzx7Q?=
 =?us-ascii?Q?X/HJPuHoO9Vv4ltv2or5FViLflE09SibD90YBVHrc3lxY7EtHp2ukiwYekX0?=
 =?us-ascii?Q?pXJSUPOqGVEO7c8lGN65fAPHc7HUHbokzsVhlLK+O9xdh9fajWc/MYTj/EWx?=
 =?us-ascii?Q?iFXrnd1d7OxCKW90MXUI79Oy+US23aOT/IjTKfA3H96yXv12ORpmE8I11DRE?=
 =?us-ascii?Q?/Ontkkq91FSdTitUsnot3AnxHntbWSDy1MGMymN+/fkluiAtE0AndPhV9ce4?=
 =?us-ascii?Q?RFti10tUBe6VKQtuNp7b5eR4fmpPL0XLhXOaSB/sLqaVOQi5ZqQav+sCyjru?=
 =?us-ascii?Q?D64iCKH2nggXj3iNNq9zPbf/G5sTMRoiBSG6fYRIUN9e4y0Czppr65hYQp5I?=
 =?us-ascii?Q?IOAWf6B6XmJrz45on5qATM0I9TM+u8iOXZdhfA+aIxWRXeFdVXmqKFlRVAZG?=
 =?us-ascii?Q?tA/Xn7u9kC03n3JsufP/i6T3srmizDmCu2kegO0S/UlISm+imL8t7k8K6hXY?=
 =?us-ascii?Q?WXTIXMd+C/mbeW93gQgZ6F/qivHprIz4lmMTtFpfkDU28RZsrMiOMf1BfLxX?=
 =?us-ascii?Q?1xrc1cOCiJvm1TvaAFJNp+27RzYzJRR4S019yaywog=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jyAPPPDYGq1JK8Y4zIhSNHYkHquWukWBzL7wQWPTTG132Zeo+l0D5mnBoaMA?=
 =?us-ascii?Q?HsKhqvHpZNdXPhXpPk9TrBcbKD2lTos2MN7A+zrvoNQQgHTbfgbZ2Z3Rcq+i?=
 =?us-ascii?Q?UoG9EhaXkTeujf79lFnMZ6c3wwB0WN8AQHK/fLqCFVKqWMZIHwHN+szhhBcl?=
 =?us-ascii?Q?BTcbkZrq7Wmx5kxxmbETWutCp0Q76UUE91QAtc5Nw0rf/A6w7iRn6xiw7psB?=
 =?us-ascii?Q?o9kQHWlw4A6Swn0TrrreeJg4kFzWUZh/prQBo4KCU9y+LU/OjtXNYJtby/ga?=
 =?us-ascii?Q?AKjdKoM0ghr8bSDKsGIrpfTYWNsXuGvbzj0TLz+dVWn+ZHQxXKDlF+8R+mMj?=
 =?us-ascii?Q?kdhODhkVgr7DdoMjTS02J9be/uCRyjxX+jrDepPmpFVm8uGw3QKVlhjvefyj?=
 =?us-ascii?Q?Ptq1kPV4CE1Vzbgh9DZsCP2MoXRpFjNBEDndg0M63bDPzBAwA8w6yl3pKYQo?=
 =?us-ascii?Q?b1vMX2VbhfP3sC4YKTWil5M9XmtaU9uJD2zSOJ6JmYH9qdORd2Y0+wDF+jx8?=
 =?us-ascii?Q?YHImWncwsFPmaUPOPbNxeufhNEW5W7ZQUM857mq9CkdHYXO7XkpepZBNaWZ2?=
 =?us-ascii?Q?uC7ywxtJol2a1VBvlaOxCDZbjF7UE5ge5Koqy/2T/8nHexyK+DNBN01iwtWy?=
 =?us-ascii?Q?BsHQ7teghqxMnUDdmXqp1/PUflrE9x/5M/xumxA5xhh2khmFnUWsrH1XsLvS?=
 =?us-ascii?Q?a96jf/MIkZ2sAnMW8ARhxdAuq5aVCt/V1+lVo4mA3T5eFOYAKvjunNRNeVYM?=
 =?us-ascii?Q?XXuoh47sMIQDz9QSSifEEV9tzdBOy1np3QTP1wx5QodhWR3JFDd1xbs2GVKs?=
 =?us-ascii?Q?v2jPuEmxAzmUKXI3+ZJCY7ua8OU/sb/kComqZmsZbWHsaEy8LKRICLD57xUn?=
 =?us-ascii?Q?dvkOY5tv4jJEYRfPfI7gMp5JcMV055mNfvApNb2VaHerY0TXDJq64XcnCwKf?=
 =?us-ascii?Q?GoOFnn7w+QHFx7CO8RWNv+CzrE/2flqdklAUdH/4nzuxmMVOdBOF/AKYdFvC?=
 =?us-ascii?Q?UUMGkCGn4AKI2SyXyXnAh9eeFdIH7bdsHUmp4qbTwJIgk/B17gFcJYHGcfyQ?=
 =?us-ascii?Q?Rzv+f/sbjIiXq3O/g4Xz11XFafbZ2kEfF7WPM3+vDuDiWYldV4VfZ6/whWOa?=
 =?us-ascii?Q?kP2LNjRY4DQpjcvOqMvBQraViLKPpl4rOckoybA/kYi5TJPjI9AGwg+CBDZG?=
 =?us-ascii?Q?9RQjIVBnWqXywo7v0ZMYSrki1qR7/Y2mHPYq4m594T0dgwssE5r5mbSA7OAY?=
 =?us-ascii?Q?zm11biwa/n1kdVaVYuwH573+6Jm55LjJXc3L99dqdkV5fia7XLwQJ5L+uAok?=
 =?us-ascii?Q?toUD3B+41gKA7ywCCe3/NnZ4XCGVFQvJZzr/M3X+vJj3bvgNnucSZnSf66X6?=
 =?us-ascii?Q?xt0fWLK4FVJ+q5HT5PW5N+nGeLMiIMxBkCm+L0psnDRHvl8ozAn37Z6IVLP+?=
 =?us-ascii?Q?bOmJZj+MsXcS6osMIICPqwZ89HYhFv0HkFAbWEZt7Z7eARm0k5xXbvK2Zubn?=
 =?us-ascii?Q?iJNZEasl7XSUaGDhh9SPLmaRdg0G2KEzc+Hkt84oz3eT0FrZ0akjRLJ7VoKH?=
 =?us-ascii?Q?lH6jtkKtrqjCD5v+hVXBqX4cpeErTJM37zkU1Xu/AG9VEpcwayKHqtFYJhsx?=
 =?us-ascii?Q?jg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27cf7589-4092-46f3-61e9-08dcde300764
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 13:35:04.4863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ny8xMCNk2Umlv8ynTQWag3UL9rFZxBz8mcrb7+z9NS3/i+E6ugTEomFsOGgphiXpe6EsCUzBdgDW9lPLMdiikTnSFM3+4wSbIZbwL78bVi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6445
X-Proofpoint-ORIG-GUID: OfIL-NnpMVk_ObZG14Aezu81l7HkrWA3
X-Authority-Analysis: v=2.4 cv=e+1USrp/ c=1 sm=1 tr=0 ts=66f5630b cx=c_pps a=yF+kfS/uWKtSACHbTM5LMQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=ei4SEBeUAAAA:8 a=QD9Qtey2zKJs_bIMlh0A:9
 a=t0EB5k7lhMAKNYPM:21 a=Qixl1SizjlQA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=8zIOOLb7Ym0NljyPXbuS:22
X-Proofpoint-GUID: OfIL-NnpMVk_ObZG14Aezu81l7HkrWA3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-26_04,2024-09-26_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 phishscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=773
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409260094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 13:35:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204985

From: Yash Shinde <yash.shinde@windriver.com>

https://blog.rust-lang.org/2024/08/08/Rust-1.80.1.html

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/recipes-devtools/rust/{cargo_1.80.0.bb => cargo_1.80.1.bb} | 0
 .../rust/{libstd-rs_1.80.0.bb => libstd-rs_1.80.1.bb}           | 0
 ...t-cross-canadian_1.80.0.bb => rust-cross-canadian_1.80.1.bb} | 0
 .../rust/{rust-llvm_1.80.0.bb => rust-llvm_1.80.1.bb}           | 0
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 meta/recipes-devtools/rust/{rust_1.80.0.bb => rust_1.80.1.bb}   | 0
 6 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/rust/{cargo_1.80.0.bb => cargo_1.80.1.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.80.0.bb => libstd-rs_1.80.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.80.0.bb => rust-cross-canadian_1.80.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.80.0.bb => rust-llvm_1.80.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.80.0.bb => rust_1.80.1.bb} (100%)

diff --git a/meta/recipes-devtools/rust/cargo_1.80.0.bb b/meta/recipes-devtools/rust/cargo_1.80.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.80.0.bb
rename to meta/recipes-devtools/rust/cargo_1.80.1.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.80.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.80.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.80.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.80.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.80.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.80.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.80.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.80.1.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.80.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.80.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.80.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.80.1.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index a7d52d9405..1e9407dee9 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -10,7 +10,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://rust-oe-selftest.patch;patchdir=${RUSTSRC} \
             file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "0b9ca1e2e45b8a5f0b58db140af0dc92f8311faeb0ad883c5b71a72c02dc6e80"
+SRC_URI[rust.sha256sum] = "6ab79b70dc57737a1de378f212fcf8852d67fe6cf272d122a15b3ea13be77947"
 
 RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.80.0.bb b/meta/recipes-devtools/rust/rust_1.80.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.80.0.bb
rename to meta/recipes-devtools/rust/rust_1.80.1.bb
-- 
2.43.0


