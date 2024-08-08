Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BE6C52D73
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 10:01:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.56294.1723111271456950982
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 03:01:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=89508821c1=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4789ApZY000558
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Aug 2024 03:01:11 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v0c91et4-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 03:01:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BEJqEQ2FbkUUFfeQd517UzWYSouKe7C/bk+XBWQ6FWAkj73lEsCPv4dFbW7WWAiHq4L25ETdo+SALHdz6VOWYi0aLozXAVxSh0ALS4NA18dBa9hdbYN2OdADaFcPAkFKNqynODyjfsRdMyx8VpVwW4lteWrfNQq3Rj+7P/98MTqYmiCu9NaDh4e+XAAHO04jebn1kJG9k1bVZh/mW9WD80Jw296k9tZDPfjuDsjwa+2BZpVNd2p9L6S3NVfqNd+LA/A4Fq/ja97pPVvyePWPrU1P5riKY79WvFo4hwKGC8Nl+neorVsTtKHIGKj+P9sa5gswifSO3lgahMcXiLeeJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSefa+lqGAMY9tnAjlugNtkgiLFxzjQhI7KzsNlg9wk=;
 b=xnfVcHRT/IzIXwwfP6IDxlT8jsYnNTBM8UA1cV73SGXHDAF6vSYexbqxuTTqiyp3fvwX562FEltP/4WdGJoRXmNEr14IdzlCxz2EzEPGQFtzYrXNMBEA2X554345TVE4E6ST3CbvTc1vN6BipjC30KkMfqZ6MRkYr8a/iR2nPCxEN6agu36vHCvNG06IzX1wCsd4f97hSUWZPYWLpzRfwDiUrtfiJJ5oQbQFCzOuPOs00uOEX7RdznjJIBYq+FQ5kVw9ig7qB5zhPCOO1YstBKs61u3YXeEV2GLGVgFJ3jsSIYGBeaQnwId5vYpcjuZHrFwBFeDucwiBUfrw+MFIZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by SA1PR11MB8374.namprd11.prod.outlook.com (2603:10b6:806:385::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Thu, 8 Aug
 2024 10:01:09 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%4]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 10:01:08 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH 7/7] rust: Upgrade 1.77.1->1.77.2
Date: Thu,  8 Aug 2024 03:00:39 -0700
Message-ID: <20240808100039.2455895-7-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808100039.2455895-1-Yash.Shinde@windriver.com>
References: <20240808100039.2455895-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0042.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::17) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|SA1PR11MB8374:EE_
X-MS-Office365-Filtering-Correlation-Id: de9b5071-4c6c-456c-5425-08dcb7910643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Qd1Xxk0pLyFHPtE7T47ru2xYOUwTA1KMYw/SBfBUyDejRGX0IA1A0ZljhPZt?=
 =?us-ascii?Q?FA2HaVe/Zk3LrOWw+CD6SSEBPhVnTNEBYwZNI9Mhl42L6cu4I74tIvzs+4wW?=
 =?us-ascii?Q?a2leRUAz6j9cXZ1gDIvHO8flB8C2SRsH0kXpEOwCzmn8trZaTzdGpAOLniX+?=
 =?us-ascii?Q?glu/wi1lSV9/GkjPeAqzqpN0fyqSNgiQV9WgWiBsKGk7XRukepUhCWny9/kP?=
 =?us-ascii?Q?bxkJ6SioDL9RLgznVbeUMWW2HTq62VQYe567V+WbzQBE6OtvuqSVf6pSGzMu?=
 =?us-ascii?Q?5p5mrR0jPuH5TjRZ6IzoocT15k1DMuIugzgaMpSXG3FRu61+IqngInNk0/Xi?=
 =?us-ascii?Q?Vs1/OdUXPXgMhCglESW7/zkj8733trY6ZD9iLhIgHh2U2sOsP26DMZ57m2RQ?=
 =?us-ascii?Q?reVwkH/Cg6wBcNU63FLHdisix4O8Jh0HfTK4D3nkYX2dQxuBX+JWC3WAxByo?=
 =?us-ascii?Q?Sjg/TZWqhLi+L4ggRcyF6l+aaihfUrrEu4KGSww8Is30eAa6cXWzEP11vK2R?=
 =?us-ascii?Q?aghH0Qv1Xhu6bXAtatfRtHeKmX7uYf51bk0R/6fdVQFY0G/hWmzFZXsgpSTB?=
 =?us-ascii?Q?UlPKRIrMsCJtu7llVYIrGU1Y3sGKyq/Ff3PhSOcsAU5syaAx5pEdRQ9CVCXa?=
 =?us-ascii?Q?Z+W5Irof0jHXqf7IOBmCfVnv9h4dhT4exVe8+ifH1iMU6cE7Eb4gKwRspGCi?=
 =?us-ascii?Q?KH944pymwQxDdzrxkp0OIAU1mRJT5Ks7SGj55dzywbTEiqdREQkizrt6gKwt?=
 =?us-ascii?Q?AF1tFCLecnKXen5QE1XapzBdlylnn2EQxJoDz8r0NPdJIpVxizDzRlmEiQdC?=
 =?us-ascii?Q?RIe3/w2MZ4ldMOhN2J4BcpGEGCOa5x5mCF9QBKLkfuSyyuRltBK7Ojj6USHJ?=
 =?us-ascii?Q?BB//OOhAxfrJeog76YN+pj4bYHrFECFVyc67uTE4q0FqnZFDULkDDSo21FfA?=
 =?us-ascii?Q?mTsOLRy3VbPT5siCSkEnqMQcFiiftkmd7G2PQHHP8CvSDY04Urj5xQO3DSUN?=
 =?us-ascii?Q?acDjSeZd8iIpJIi1Pfyv3fxNP3lznox67XQvSBliB7vqYux2GNpotWjvRn4j?=
 =?us-ascii?Q?4wWg0An9pfjUHtG7wte3fLz29DFCNhfNCZRTbAnBG516cgwWxzvEOgX2H7UL?=
 =?us-ascii?Q?/0Jwu0LAcnQmCtY0Vf0HWHe6XYRllbqjqzVJ7MkzrnXigs5AALccXcSd+QNu?=
 =?us-ascii?Q?dwH2BEdJPmUfU6/kpjFQgplJEo/uoEyGyT515ojTXI3EN2OPlst7iulEdPcM?=
 =?us-ascii?Q?oUq5G4RIu6p9IP8dzIZzH7HvZ5j5tpAEf7fp32hIK3I8TSsMD6StvVATDmkZ?=
 =?us-ascii?Q?bqkFjY6Isj9bCFYA971cRsYL5am5nZjIfEbAr90fDcYRUCRSsABnOnZeZ9Dt?=
 =?us-ascii?Q?K6XBzHk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b3YmXR1DZJ4TOpabFnUnH8tStnnMnHTRAd2HoLh1XNMZlrJp/+ExZ8Al85lx?=
 =?us-ascii?Q?dh7D4wdOE9e/V+uSpLKfCf3LAWzAfWaDmtUL50p1xQXwjOL6tDZ6lyeLU7rw?=
 =?us-ascii?Q?uRGwyUWHsGt6UTGtT6a4sDmYZ+5ADXI9LfI3LCQ7yCLu+oIFUACNMUvRcWLn?=
 =?us-ascii?Q?JR4V47IiiSiUZ0PokR0BDR/IyTSe4tPWz8k8KzbjSVjduxo622GMKBowSBws?=
 =?us-ascii?Q?FVMw08ciOaYier5N1GOfr3v80a7EOXhJnZRBDuD8goJRgUWzPHqlT68ns74J?=
 =?us-ascii?Q?JqQyNwXyvg3b2jbHOiuk+HyDQVh1+N8RfY2jYeOBdBFHvgq+qPECawMSVCfW?=
 =?us-ascii?Q?ekHIABnrK0i9fQqO952x2PFIVCLlnN+v8jcZBV+6HJ80of5KoXDx75lGMBBp?=
 =?us-ascii?Q?dZSQAImoHr068WG9YVuIZbZpqQeO6STFON6XrX6UjKoVss2wD7At5/QwX4tR?=
 =?us-ascii?Q?9P2y1FPrtvuPZl4dPqboAyvkIstzQZx8liT1N7X7Ey0dsF5Dappf/iL9HywP?=
 =?us-ascii?Q?+ncNT1bLvERQHBI/cmTDVz6Uq9538EmzzJ67o67U4NzcgJ7i56ucd02Xvu8q?=
 =?us-ascii?Q?JKZK/qfQmmkAt8i4FuoHhCq5aXas1dOt0MvdUoNvdX6dOkzb//AgxY8iYDrg?=
 =?us-ascii?Q?rV7WpxNt5hu+RFvJ9zMDmTh/kJ7P4eNcpNfTKR+SrsD1gnGTsS5N8+qcoZY/?=
 =?us-ascii?Q?XFrN/L7ZS/Pq7MCeaASzIX6zuLi/nKaAGGZRjKGLKOzB+cvwZ//iBsvNLM6m?=
 =?us-ascii?Q?xMGv7TT4LquEHtZlvfQRXnvSvKpGK7bbK462g3M9nbqATi/klHXzSpZo3YcW?=
 =?us-ascii?Q?13WXOqV7eqm7PNsggYUoHC5TWxn5KklVAEOW2odNqh9cWGDbnTOYswDnN+0M?=
 =?us-ascii?Q?1Ay9XKaWGmAzV59hNNdKv7E01OsqTEBWW6x6p00fBqPvG/fjQ85K5VpyrU0P?=
 =?us-ascii?Q?xTR/52EtGwkA+lVmDBWC8BpBWpIVernKLhnR6lOfGhYqmGJvQ1v/OpO95rFA?=
 =?us-ascii?Q?deGJfJeN1AoVcgGYNfIszitQldbMisoQ9oB3+1XgBoHXwPRP+h16JzdThI8D?=
 =?us-ascii?Q?LStOUIq71CJXKCOVJz9jJLeVRzzIwy4Gi2drrt9nUBiYixvCBs4XJmhR6iBY?=
 =?us-ascii?Q?2grw/LGAIiBjU90gFxG3OkNhOnBfdhsQvy/Otd2QcVK/u04jOhDmFv5TZtqc?=
 =?us-ascii?Q?9oh7R/c3/ITLRmfDHDkXx7T0+D+M4yr1jFHq3n1lC9ZiL6RF+xnDiMhprOWT?=
 =?us-ascii?Q?J4YgtPBqIZbcNdfOEHaSTSXcrBFw3oTK3wY8YmJ/ekbtV3AhnZWSKAg/0Bz+?=
 =?us-ascii?Q?GVVCM8+F/mdzPOKRfqFVDOvID+Yfh0O8X2l90/cR7MqcNNBIYzaMa2MseZR9?=
 =?us-ascii?Q?hnCqB57KhhHYbZX/TiSaaB2QZcUvAlgQ5UJjqUxugYtFZ5H/lGjpqyHlCRw2?=
 =?us-ascii?Q?SB0POF8xVRKK9zRyEJFB4YTDxHCK5NR/PY+v1VW/BcDO2zeSIcXBR5L39BUT?=
 =?us-ascii?Q?6BWfREQXJ0kvJ0cBXEJoSpgeAXiYs/f9S9u4239p9GHw7SnqNdoYsmVx9K62?=
 =?us-ascii?Q?Az7JtrgODmIu+F0T35Cw4MNIYqjE8X0TkkauTEwN359+KwOuXt8o3Ba6iw/Y?=
 =?us-ascii?Q?Mw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de9b5071-4c6c-456c-5425-08dcb7910643
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 10:01:08.3887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5F0qxQXfi11BOqwPUc9xNSM2v3lXsqhFTH4Nf/UoQaI5M9F0yJtxW1m19tyqOWvVlKFxXsVUxtKlybrY48270c1c9sHPCr/ZTwhVDlFohs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8374
X-Proofpoint-ORIG-GUID: dWtuOEYNW67HXYWtfgYD6lP2gE9yy_LC
X-Proofpoint-GUID: dWtuOEYNW67HXYWtfgYD6lP2gE9yy_LC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_10,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=912 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408080072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 10:01:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203127

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
index 29185f5ae7..1e69269659 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -12,7 +12,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
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


