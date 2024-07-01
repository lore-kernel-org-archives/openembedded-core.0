Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3AAC2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 09:27:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15467.1719826022195899667
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 02:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=791206b30f=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4615e3iV029844
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jul 2024 09:27:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4029869jw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 09:27:01 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4619QxNB024387
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jul 2024 09:27:00 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4029869jvr-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 09:27:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zz9hOiNHQQPfMsnkDu84i7BKaE9DnhMeKhdbYN2xoORjiy+cPgLLEQeUSPC7Xgsb1uVQZpTml7iqyNfpF8dUUtBSnXPdvUSWWlAD3FDTyWg3h+do2JBqeyH06+5ual+c/yvQfhjroQZMOI7G/gVGKZKx/FuGr23UjVV5de0GMzbjUN/GS9l10qg904flKRc6JtdQzjpD8LDLU27AezSr+vcGGcxbfqOZjxhuIlHxGfWRD8gqYjS/T9BYcMVZm/LSffkkWEhXb2RIU78m1PJFlPHbDlmwnraK6N3AMkKy8KVF0Fo5y/ZA3WXYBUvr1oOXbdZ+4pUV5vsHRH+mpLLCzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DrN81dBBPKdPeRGSeGy+k3N1Z5IdVFj/A2csNKR7g3o=;
 b=eg2CZt0z+VdYbK7dqG3s4k9b1hdPPbrrnQwpMSyUU+xGaZJaVBxwHnd5Z1oTHcfgKYiB9BP4Ct3Q/6EabUYhAr20IqhfQbtmvNam9mWVb3lQSVLQ0EIJg1CJGrO3b3WgA0jtSP+hEScSbF1DtOYzJC05msy1KrKGZG/JPCELMZpDvG1gSAPwlE2EBkrqMILrrrrklZziPzLpDCL7EZ86wB5womDsEFOYjg4Q006MpEvpUvp28LG9Yhm0Yn1C9nJr+MPgCOLC7B3lqZmouC48dOLN0fp+D78mg3VpYtkUdopWQPF9bd+EtJoAessGgP5sVM/bu76m9UM44LzKDDQYig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MN0PR11MB6184.namprd11.prod.outlook.com (2603:10b6:208:3c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Mon, 1 Jul
 2024 09:26:58 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%4]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 09:26:58 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        alex.kanavin@gmail.com, alexandre.belloni@bootlin.com,
        Yash.Shinde@windriver.com
Subject: [PATCH 7/9] rust: Upgrade 1.77.1->1.77.2
Date: Mon,  1 Jul 2024 02:26:34 -0700
Message-ID: <20240701092639.1498856-7-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240701092639.1498856-1-Yash.Shinde@windriver.com>
References: <20240701092639.1498856-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::29) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|MN0PR11MB6184:EE_
X-MS-Office365-Filtering-Correlation-Id: 233fb6e4-b1d0-45ad-ced2-08dc99aff222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NzseohtwwmxyDJUIjspCvXxYKctIsJ8Hgf6KMQSSqUFTdGBpIo4/1h1s17nM?=
 =?us-ascii?Q?wLZYyaIUwkLGrbWGwBNj1H+vqmuI8KikADcRouce75EJA91rSY2dPa60ADcN?=
 =?us-ascii?Q?k7EhTfd7dLn1AYXBb1d9WJS5pSw6oYghokcn3m4KEGQpudcJSeyDHRJn1wYP?=
 =?us-ascii?Q?U3bg65ECEN3QqhzykWpJQvNN0Di/rhbwf7vZpnzx/sqCz4x0Uie6mPlXVq0E?=
 =?us-ascii?Q?gkhMLn9GpbSMoJEQX1iQw3CcZ+Ytf785zdckJUFhyp4YIwmYGS4ftyAODCp2?=
 =?us-ascii?Q?L2bGGTRatFGff853ULvgo3TZ38m4sQR3Cyb41SIL5JEY9cgrA3ffxTGBlct/?=
 =?us-ascii?Q?Fs4suwzwCSPl2uhV9tZH5uNI3zHVy5Ab16sx4p0yqDH1fIad4KGTr+nyEAOq?=
 =?us-ascii?Q?xKiFsxvvxMuUTUkSLRlxwGhVfhI1bF8GgKOgxAIbjUADeSF7NlOROjnt2qi1?=
 =?us-ascii?Q?1getSoV3YnQHJcfcXdyZYaKFZbwWSZDd2L9r3mMeZBVv8NowcPbutio1lMSr?=
 =?us-ascii?Q?dXnpimn4Xwr5ycABv8gq2scryj/QFanIV18auNZ2COg5LPO83pC4PobTfhEZ?=
 =?us-ascii?Q?G4BZFUCuvdJTbizCqG8FZmJkJPAS2UwsLAt/Dbh0vApLKLVLx/c4PfQnqA9A?=
 =?us-ascii?Q?sxu9bfUUUHzEd0LsL5HY+aLYHw23H/uORuI4nIfc7QQZFD53eumZ0Zr/GoB3?=
 =?us-ascii?Q?8PiB30nBIw3a5qtZ2/UWcdVOKmqWJaQ/KhiTPWuDA2MIEnU/86wdCG1Dt89+?=
 =?us-ascii?Q?L7nmOK7dZ4jEm0fZ7UHKDXQyUjDM0TYrWrIT4b+/HBN34ywByJDg+cCWNcwF?=
 =?us-ascii?Q?aohFfFryNw2soKQs8445F8yX4OKB0iSH2vxgqX+B1aWjuX4pdu45Q8QLViu9?=
 =?us-ascii?Q?wMj2trJ72wIvDB3RGfvTWwzroJNnwyNcHzHsAVNW7ycBmvjkRxsZsO2reJqY?=
 =?us-ascii?Q?H7xnck2cZfWJprNK7IIqgeXJVk9SPAxonAuglnJ5AQypspaeDhkDUQtzFj7S?=
 =?us-ascii?Q?S3HtCg+K72bJvTNGLtrVkOX46XXa9V6k8l92cUL5nj5/ikIvTC/+OHbvY/mT?=
 =?us-ascii?Q?6RpZdhrBW9mPfqaSdzjIUMZpJWleUGad34l8YNYrx+82tT4GEboCIlskd6ZQ?=
 =?us-ascii?Q?GiuLevDzax20IfqYYE/VRvJQNy/Cf2SLz1oxR2wYSA1v6vcWby3c/LTDifL6?=
 =?us-ascii?Q?2p0Lu9y9A/bgI5AFiKxqOTRiYcNJAS3MzuQgw5PLLY6Xv8izpiF0QLEgtLHw?=
 =?us-ascii?Q?w0a6Zh8jti1uS6pRG2vKoSuQg2PfACDzeeNi2Lbmdj9dyJkAeSrBiPR262ps?=
 =?us-ascii?Q?ngX4N4RB9x/fdTB40ajwjqTVWUqkObLzKjiYn9jTTtEbDLoK2A35Lnpe6ELL?=
 =?us-ascii?Q?DTX1JAo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HO6e5CaLOlZS+GYTXfXugYMZ3+zn05VPRTjbjOKbjGXKB2zSLXF3HIoumLFd?=
 =?us-ascii?Q?j9sp+oNqCf39x5t1I/zNtbvtMOppIdayzXl7eTbVtJsMsbu155yL4Bv6iYZ4?=
 =?us-ascii?Q?ezLLuV+JzLDoidWhDDfhpRT9QSpHw/xv5L1mRISqQyoGKC+S4xEG/tPpT3gA?=
 =?us-ascii?Q?sUaIILvbttvhfE1BN3sBSKEGrS+qZ+9k4JA6AhQDZK0NhVhdfZT3n9kGz+Yi?=
 =?us-ascii?Q?/rvhIHCR7LNBu2zwgCKIPurhoxLtLEfTBkX6jNqmPurz2R88XLU+5j11ZA1G?=
 =?us-ascii?Q?QJbc8epAStGJvUKzfOB5qy2Nt5sWeaQCpoVw9xbeKmXDaZOXpaL5I9x01dY1?=
 =?us-ascii?Q?iuyAE4GjaKg0LuV8t/sbEkEeQ4NOKG4OOKh6YxbdUGKcichWjBkGExV2pl/e?=
 =?us-ascii?Q?CE8qSV646uj1m0vZNEDgjDASrUoZVXGJM4PQT0GgbM81We8HV5pv+UGklJQy?=
 =?us-ascii?Q?ygaqKEMv76l0bBUasUArsKhzwKKI1GbhovAys5nZ27xsNGXmHVHnAhLMXAgv?=
 =?us-ascii?Q?T9/S5ezZXEQE9xadf9p5YUUPpMHjGqHfinrsMKNTXoeVav5pY7tOsXHVkQd+?=
 =?us-ascii?Q?jFi6T8/u90BkrPE95iycVSJPTPw4d/E4DwZDdMDCL6sFZl2Ww9AEH7Y5tw3c?=
 =?us-ascii?Q?SjHud1hJ3PMIh+39PcJ+r/IMcbHHu3z6QNL/IYj1OAbA9HH1nlQ7iPif4MPN?=
 =?us-ascii?Q?2cCKUXo+9NI7N+eC4mwQJHTlKRT3UrBb0KoWPfDxGnBe8Sx4E56V5jEPCqFi?=
 =?us-ascii?Q?ZWMT5caSg8y/xVUxpkMZiIns2LBBpdUYcBYjbzJaxs0h8cGxNppVYac+uOKh?=
 =?us-ascii?Q?NrOjP/uA4LkUMh8doQlI2kzEfikU86Y9Pe32JxmEdNumDSlQZeAthcRdX+Of?=
 =?us-ascii?Q?yfYaGGbv70/kXElhyP11rg+bWGcFxiPSqF0xVPcHMVdxKQisjgZmHtX5LQXb?=
 =?us-ascii?Q?I7b+rg2vlUipW8XAYcJfFyBgDkarrOsiVxO93JWDppLYsZyu3IBDP2z2lGCA?=
 =?us-ascii?Q?4QwSKqjsSl3iPPhTOHRCAhTZ83lcs7DvwDs0oXZeQVBRAexT7l5XbW/SPUPn?=
 =?us-ascii?Q?8DcbFxSnGGJCnoRpeciJJPyeN7XSXMlcU2W3G0xZyly1o/lXtIMvNMKLdQXF?=
 =?us-ascii?Q?21fwX25CLrFT/0EwIFqRyyfmTy3+YYGsObWgAqbXyAiNR3pf3jzK4ouEYELM?=
 =?us-ascii?Q?2fftFr+0oyB3sPJdnMnuMjOanFMEcTWh6LEZSrj3U9HUtO8ar8EnSspMoyjw?=
 =?us-ascii?Q?I05fHYLgK+ovEl5NIK0Nb2j1mfUpSSFKrbS0z7cP8zJ4yqbR9dYszvtU91IQ?=
 =?us-ascii?Q?7G/wH7ikTfKrG2lk6TvD03qpSL76vLqXspTtLsWmM6IJHeud4e4UPsKGDn2A?=
 =?us-ascii?Q?DyMS/ptUrnwBHz8kHGlJ4cokH26u121lAzP2gm7xvFU8+7JpCzzGQmU/sE5L?=
 =?us-ascii?Q?Uk4e8QFKhur44z+TSWTD90Y0UvQTLKR1i6vwYSMPyYkHwVw7hbDThaJyIg4u?=
 =?us-ascii?Q?5w4RVAx4MAPXQ0mqpIoiOaPz3Fgg5Fue2aU9rTnetSIsVTqgy6CXhui6mYzr?=
 =?us-ascii?Q?nX5fxMwRRR8R1utTzK4QWqxTjP0aDwWYnu/8l9Ka8lT3v42mtnaW/da0iwUs?=
 =?us-ascii?Q?2A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 233fb6e4-b1d0-45ad-ced2-08dc99aff222
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 09:26:54.1238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AXjhfBymYElENx4bIg7SOMa0YaltidAOls8Gda2ke02lnLHTwLOAMumhilsCRHEesEGWOwpbrOQrG4ww4XzPyN+oa3Z61UPFbdqV1NJQTy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6184
X-Proofpoint-GUID: 9lV8zHy5MrkA8Q_SaUHl7UCJDlK2DYYK
X-Proofpoint-ORIG-GUID: a0ei3HF7RI3oAfOcaiacz1IdWMSDTiFW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_08,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=916 lowpriorityscore=0 spamscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407010072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 09:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201290

From: Yash Shinde <Yash.Shinde@windriver.com>

https://blog.rust-lang.org/2024/04/09/Rust-1.77.2.html

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/recipes-devtools/rust/{cargo_1.77.1.bb => cargo_1.77.2.bb} | 0
 .../rust/{libstd-rs_1.77.1.bb => libstd-rs_1.77.2.bb}           | 0
 ...t-cross-canadian_1.77.1.bb => rust-cross-canadian_1.77.2.bb} | 0
 .../rust/{rust-llvm_1.77.1.bb => rust-llvm_1.77.2.bb}           | 0
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 meta/recipes-devtools/rust/{rust_1.77.1.bb => rust_1.77.2.bb}   | 0
 6 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/rust/{cargo_1.77.1.bb => cargo_1.77.2.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.77.1.bb => libstd-rs_1.77.2.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.77.1.bb => rust-cross-canadian_1.77.2.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.77.1.bb => rust-llvm_1.77.2.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.77.1.bb => rust_1.77.2.bb} (100%)

diff --git a/meta/recipes-devtools/rust/cargo_1.77.1.bb b/meta/recipes-devtools/rust/cargo_1.77.2.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.77.1.bb
rename to meta/recipes-devtools/rust/cargo_1.77.2.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.77.1.bb b/meta/recipes-devtools/rust/libstd-rs_1.77.2.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.77.1.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.77.2.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.77.1.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.77.2.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.77.1.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.77.2.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.77.1.bb b/meta/recipes-devtools/rust/rust-llvm_1.77.2.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.77.1.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.77.2.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index d42c2c10ca..3223869ee7 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -11,7 +11,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://rust-oe-selftest.patch;patchdir=${RUSTSRC} \
             file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "2ddc6f5e01df1bd6c7ff94d9931574181795a231b199ca6948d433fa5e795873"
+SRC_URI[rust.sha256sum] = "4d214c4189e4dd934d47e869fa5721b2c33dbbbdea21f2fc7fa6df3f38c1dea2"
 
 RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.77.1.bb b/meta/recipes-devtools/rust/rust_1.77.2.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.77.1.bb
rename to meta/recipes-devtools/rust/rust_1.77.2.bb
-- 
2.43.0


