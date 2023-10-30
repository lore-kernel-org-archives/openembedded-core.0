Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBF7C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 05:29:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.142808.1698643782726255307
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Oct 2023 22:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9667badb91=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39U5Figf009443
	for <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 22:29:42 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u0wk0hnt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 22:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kR2GEBzLkzVJtfI3IV+KQHeMn3DdQfMr6Mxj1dfNwz1AjksKgiAIoWeyw2wurdDelFR1cVT3YuzCH8w3bn5Hd9tsoLvou63rvKogbSlcuO6d7gSMEy5dCYIws4e8RCyuKyyn9RAXpy8o1fgiWDN9UI9YhM8l1gD63iGZlUUgdEorNE2d0Cw/yJaU7UZ5T++3NVxym4s5rLcaS+X3b+Y0roL/rFNlKxps0fKDYa8ss2Md0BmZWiNpxGtOlV1tNdxIHjewsqFAo6K6deHepRkZo480G01H6YT0BeABGXjdUjhqFUvTQy0PB3H8uHy4kEJzA3YZnrqwbCCk60wWb5qv5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3GHfgavKCUdHP6t0Js6ysm/45kcEmcxKCQhyQyc9Fe0=;
 b=mcOEeKnYzeTlmVetqo6pl+1t9v0FV1xNldo7p4oNmu/SZJWMSSVOWci4+UQn1CFbEVUcaGWJcj3YJTZqAa0RCcPVynwQQPAjTrjPFv7I9PjHh++2Ns3ZL20S6kcUcnXVZ/IOM73NYLTr/2bAV3oUr2lkjY/jZQX87vfW8utuspPZdCdWF+PKR5GqtpsXww1kMIUHcbQFUlpv9Mal5RxBlGIwD4jKqWOXWiezhdauek2F9f5GNgRJAhoaPTq2QVWBLuVDaQsyZs/EouNd7PdnHd333sJFMVdiv6gzb7mpNVrDoj4Wl8WdoyiP7vpMG98PmhmqSknGglM0e7W4gGq6YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DM4PR11MB7254.namprd11.prod.outlook.com (2603:10b6:8:10e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.22; Mon, 30 Oct
 2023 05:29:39 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd%4]) with mapi id 15.20.6933.026; Mon, 30 Oct 2023
 05:29:38 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore][PATCH] linux-yocto: make sure the pahole-native available before do_kernel_configme
Date: Mon, 30 Oct 2023 13:29:25 +0800
Message-Id: <20231030052925.340347-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0127.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::12) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DM4PR11MB7254:EE_
X-MS-Office365-Filtering-Correlation-Id: 928316db-602e-4b52-dcfa-08dbd90935c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r+lU4m4i5FGYi2ag89BtMj6W/L/c2cowh1/GQhGyH4VntrWUNVkXBmZmYAQfZBful4wrqMu+A2SF6Qq91YoimDlmNiFgFm810s1VzHo39EhLDoZ3XeTDMO5XfATdOREbtEbOhGVVDdlG5/5N8fJ2kexyTeT+BIO3NHoJ4FdYurgVPmTI+rOGp5AymOdAZmyw0tADn38t8p56HbpavwxdVnCbE+bHQMsqLMuIG0f0RpnIo47ACUPSGEzxZxw7auXg1jwMYxe7MsHwPlW2uUTOoW2o1Ku8BIWPW8jH8BYxDKmEF7abKm4MaS5oS5JCBmbWJlVEHPrGYzB+9n6/RkFQf9TqtjWknBaBijm+jATgqPzdTtfVV6NQ91nzzkY3MfRP5VWtIJTAiYWhat5W5dm3CwhCq26wyll/yIpfgMKj7RwqUXmBaxnnd4hpj7Uos4lQnMEp2KxWd57HVqggubNqPOi+wP7VrQmWY3LoiL4bxuZLspfs4sIz+qC2yIkOPL8nJPT4YownuB5H2iLkcjr/BA/gLMAi9qUCo2BRbaehjQA78OW3RzbwCjmrBlTnTdQ1NWKUnL9dGCXLN8dDu6qQsXqTlgcUgke5pGDMOMAhvX4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(366004)(376002)(396003)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(38100700002)(2906002)(83380400001)(6666004)(1076003)(5660300002)(83170400001)(2616005)(6512007)(44832011)(41300700001)(66476007)(66556008)(66946007)(38350700005)(6916009)(52116002)(6506007)(316002)(8676002)(26005)(6486002)(478600001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nzB9PmZfbsKnGYxcK7y/nCM9qyP8d8poUgTceiXv2pPVdDaG4HQW+UaBF0I3?=
 =?us-ascii?Q?WkJos9ybcbqxrZCszqombS7qDdx+xYnmBqFAUQVaK4Juud9ljvppBt8/3wau?=
 =?us-ascii?Q?HSmoBbsmujQDoXdOzoDJCpV1CGlQRCITkBCdVc7x4YtLHPYO8pqPt2sqNOe9?=
 =?us-ascii?Q?ON6Nf2fuRowLKuse0RaJdju6Ht2EJa+WdKqM2z0lIjDPPM4nTRpCvUXKPe2e?=
 =?us-ascii?Q?XcVxjg2hBvzt/+RpAMX7uQjb0OerYPQ8kJN/VRT+vniF1pCIi1/pc7TTNb6a?=
 =?us-ascii?Q?aHl6yRdjn5bijMcc1sVvmk+ujWb9tLVgigcLpaDA/Neiz4HhOfS91IZcVVWu?=
 =?us-ascii?Q?SBuqoLW5DkQgUJfHV1uyKNmpUhN52PQJOgBed3RIQeqk+Q4Knotz1/wZFGUb?=
 =?us-ascii?Q?/pkjZEynNMxNNHJueEHnTV7VAvJc3U+NVabOw/l6n7FTVaipnR0PBjE1iTrY?=
 =?us-ascii?Q?OL3OS3IX9YD7z1iG99erCJqHamfay8BWcUIcbkTmw4BAVCsU27VWbucHrUQt?=
 =?us-ascii?Q?pYlkWJ50/DPlF41JbbAd1ZmDh9DKgaqdtW8FfJbvyq2cbYmgV+/xHPYT4y5n?=
 =?us-ascii?Q?JBMG19IsDfcSdmz62lhjGi+mGAjl/qJoSCBfs/CiSx8PHfuuVDe117oeN6sz?=
 =?us-ascii?Q?v3yzTSXeS6BHYEfGIivhsVBgBQnmvBqjx+XoWKBDVBHR232PNcwQvZ4GV0zK?=
 =?us-ascii?Q?1myS+eEkuic895c43pLIMMf6wIX6ZwVEPzrIdUNn6PA7xgN6MlsT+HG7waqs?=
 =?us-ascii?Q?Z/2Q1eMVL0J2TQC0PN0nfG2mD/EIN4t2Hqz8Tmrqas5EGx1bkbItZ3Fy96nj?=
 =?us-ascii?Q?Wt/+zVqcUfBEfTdmIotvJOamuBr5nZJI8aiTVxCqNvsgYg50Q79pwSoLU29w?=
 =?us-ascii?Q?0Su+pEcAmf5yLrxR4nKGe1Q5QXb7/o3R2EwcThk7rWQMHkFiy3hT9mpc754Q?=
 =?us-ascii?Q?p9i2B/dPd9JfJMMz/OPC99SZeP4IhcryzBD6m6yTgSe15prrFb6iUICZkhIX?=
 =?us-ascii?Q?wz2BYFCiVDFua1OqMBcl0H5RYYQMh7oOErsaMrCOqFshIYa6U1Xzr2iLQzfr?=
 =?us-ascii?Q?TXvc7LBrBrkZEnWNu+dFkYH5TMQnhdGCBhsjnarKc+2y8wmmuMryvak4/2Hz?=
 =?us-ascii?Q?IT2JpOnqv7NciF+UpTeKz1DDaWTGSbRYPc7ycQCv1/bUJ52zFKkTSP76BHtE?=
 =?us-ascii?Q?sAyA6YxxC26LyI9KFOJjW0vclxJLTZOyGaAKAugQvZyihFgjEx3LpRq81cco?=
 =?us-ascii?Q?yaupqiRcw3davhTBI4+vC0BPGi5oWg4ZEA7OipeVCrBM4JJXDQq6g6CVkdga?=
 =?us-ascii?Q?Utqud8I22jjEz/Immf1jMlK8ayzd3yHLX71phbtTgt02LcGHa/jlPV+WqnuL?=
 =?us-ascii?Q?+XwHHCf2zG4YqUYmG9khJiUCCeS37dO0PC0rU9ORzt81UadrS2DayTTiTyy3?=
 =?us-ascii?Q?qWavUH9D/I/FfGdjsyV/9rck4IYBhoYKKZra1CK9uyEamZMYLRsJhjBlvrpn?=
 =?us-ascii?Q?dQS8H3GvCXqmbMfa4+SerCgz5RfHhINOdj10XYzLyDFkvDz8TUNyIT9j9D7Y?=
 =?us-ascii?Q?NEgRQCyD1MYmt/UAaoM9u4i/LtEAWMHCrqyne+6BaCgVrnSC5T9SW1IsJ00A?=
 =?us-ascii?Q?Iw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 928316db-602e-4b52-dcfa-08dbd90935c3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 05:29:38.4625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A4kmmjm+tX2fCr8Y09xpxU7JglPPrKKVz9rAzK6WLZ0rZ8uyiJRKZO4BGoChSF/65yuUYwYeBR9SyseSwHOEFKW9+IcnvUq0jtTx5OEjH0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7254
X-Proofpoint-ORIG-GUID: VbxgUymWQ60Bn97AfPNLszpHL--596d_
X-Proofpoint-GUID: VbxgUymWQ60Bn97AfPNLszpHL--596d_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_04,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=847 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2310240000 definitions=main-2310300039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 05:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189789

From: Xiangyu Chen <xiangyu.chen@windriver.com>

When using debug-btf.scc in a clean workspace, the CONFIG_MODULE_ALLOW_BTF_MISMATCH cannot
apply to kernel until clean the kernel code(bitbake linux-yocto -c cleanall) and rebuild.

After tracking the code, some options depend on CONFIG_PAHOLE_VERSION, it was generated by
scripts/pahole-version.sh in kernel, but during do_kernel_configme step, the pahole-native
is not available in sysroot-native, so need to wait pahole-native install to sysroot-native
before do_kernel_configme.

(cherry picked from commit 217a4db53edbd88001f6390bbff39e5dd3d137af)
Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 04a8105e17..461e5684cd 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -65,7 +65,10 @@ KERNEL_DEBUG ?= ""
 DEPENDS += '${@bb.utils.contains_any("ARCH", [ "x86", "arm64" ], "elfutils-native", "", d)}'
 DEPENDS += "openssl-native util-linux-native"
 DEPENDS += "gmp-native libmpc-native"
-DEPENDS += '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-native", "", d)}'
+
+# Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-native available before do_kernel_configme
+do_kernel_configme[depends] += '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-native:do_populate_sysroot", "", d)}'
+
 EXTRA_OEMAKE += '${@bb.utils.contains("KERNEL_DEBUG", "True", "", "PAHOLE=false", d)}'
 
 do_devshell:prepend() {
-- 
2.34.1


