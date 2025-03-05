Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E5FC282D3
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 06:02:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7393.1741154545333064409
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 22:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5159f55f0d=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5255cx3f001259
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Mar 2025 22:02:25 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2048.outbound.protection.outlook.com [104.47.56.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456csa097f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 22:02:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdU/p5mF3anrUoxfZSz0T/v2Eke9IAuiIuiTI/wEuJGIkoeUMtpsQ8nwJ85zXNwCkkRYcI3c25udRIrbGf362p9WcCIh+aRzQk+uQLSzM6Fo5gu99gG6IzNN7TL5J2JBrmE1XypSZlM1kC1tHSHh5Iin6bZKVqW193YPCzwQ0Vw3udKZOp6wIZr9Ud3wSEVEU2l06UHnaWxqGx5dDN8Tye6ZBZvgPeqwsfEQJ7BuwzBo6KkCZyNzJfZhUoWAbFA5Ixfl21KECMLAr0skt/V3xZI6DQAFh3MGquy+9of4VtfQJZdaCsgc9m2QA50P+NycAsaYB7/glg9HmcLK/19P8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlMjqsxOzRY/Z6HJOyca7Z8uif8Q1vxyxYjzMC0+/CU=;
 b=biy21t+kUnr8bk1vrhTu0ZQphdZEixKm/xJT06vI/slTkh9HxzLrxe4psRw8jee9qmCdGFXyXZKOMNGi9MhuLVUZZJLrimnRrKIPAYoLxSvKhjIpxyw0f13la8K8fvYKvSimFZR3jKxezXLwDa1/H2Eg4SdGemvRHranzjrUyWNbmI/X8SZMNPDxORhuMiAHfJsSG+MRkyVrXxNerjkuZXGJw5sISERrsChSOBT6QzOBlYWX9P/kF5SqFbK/pkUwrn2TLmiCl/ieoRY74w5u85L4Jh8zWIXRrXsG3zF5v67pX4kFFklOJ38kcjE4VWQPUI2txo/GBaT4jzOEHHQMjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by MW4PR11MB5800.namprd11.prod.outlook.com (2603:10b6:303:186::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 06:02:22 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%6]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 06:02:22 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH V3 2/3] rust: Fix build break because of download-ci-llvm
Date: Tue,  4 Mar 2025 22:01:57 -0800
Message-ID: <20250305060202.2477305-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305060202.2477305-1-Deepesh.Varatharajan@windriver.com>
References: <20250305060202.2477305-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR07CA0025.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::13) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|MW4PR11MB5800:EE_
X-MS-Office365-Filtering-Correlation-Id: ec2df5e7-46f1-44d4-5de0-08dd5bab4b81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?b6bTsE3CxLcmF8m1c/Eh1Z9HmmnbLdGG7e/ppM6FEmxM63EDmRF6KJmqWxfk?=
 =?us-ascii?Q?aYRAL3SZ5QXueZkfswPqOHT9zxzPmcC0psDnZV5UfRk08hih2o+WXKbJfmeV?=
 =?us-ascii?Q?VVqYU6iaDtbH+0P7r05Iw3f0DLcgpbPiR9pAu5+xcZ3h+tJL3PLcxG3oeGm9?=
 =?us-ascii?Q?kWR1issgmhlnIq8IghDOMpaFiF3G39mBFDNR6J4Tj+QC8bIK5nac0U3xQ6ce?=
 =?us-ascii?Q?E+LhDmTIaw1aimgh1R9h8zO/XD4r8bHgx0D4Yqcb9zWF+JU932XUtlBzjVCr?=
 =?us-ascii?Q?ea0dEZFvM8PMsHgduzUbXnAZL97wl+l3QaBjjjeYvjN2PDS3V/EaEb9/N2qo?=
 =?us-ascii?Q?y9tpOHjB1mDi/2uSVM+YB71O4PWVTcDa3l9ohwmBRsYf6XyuabYiDeDdSNc+?=
 =?us-ascii?Q?XPujaPBaQ/qem0Vp2wFldCziF0CI/iE0tKqUBnWuKkd1rJNDK/KrwACbQz36?=
 =?us-ascii?Q?NcwZVduXNs8IeOr8DWWsScvPKCPHQ8nkRloOBl1GtcKzEl1rOzx76JNmCn4Y?=
 =?us-ascii?Q?bv3drIbbU//N97Uo3fKw2rOfydfOErA84FK0BJAFDJ//9Pc+G3o+4uKRVUX/?=
 =?us-ascii?Q?PiqltKWemlpCEtcDagIz15j5HOTtCXxwkGbd3uzBAcrbecQClEJYYp+CRo99?=
 =?us-ascii?Q?CZYcUyfQq5fIbjHiOKYWJvWemDzVOZ/XXZbhFVHyrAN6ZMQ3+WawvqYu0MEg?=
 =?us-ascii?Q?Sbbs5auDe7l5hjK55FwlV10v8TFEEgKEwumS5VtQ/ekFVcObqnXwzCrRT8hE?=
 =?us-ascii?Q?RL1I2Qckgct2sxnYtoSDW14ElDyIdLE6NZHAQcZYDK85zELnXoPR/limeKlf?=
 =?us-ascii?Q?KqZiprTwwgCvr3TE+LltiG8NQEc6/h2zbgQ/JBEh4pMa30esXyCveborTK2o?=
 =?us-ascii?Q?Zzq2eyFfrbNEIiZz5K/g//TLVVgqt8KHxbxwUh8lst+1JwdhMFhAJBm3iCfg?=
 =?us-ascii?Q?5Q0/PSyP93M9BG3s5vbnBxS+P6qBHWtA3ZMLTCaxGomN4vjNTGL9XEYXcKxu?=
 =?us-ascii?Q?vPEv/g381C2niwli2TVDb6Yw5M5E++mC0d2sGnnQXB2uJAbYbBa4I1P54l7p?=
 =?us-ascii?Q?k74yVdYdAAFX2Qxs42oJGFpZA+dyKdk1UkPZdb60+AyMZnPyiDRL6VcSizqE?=
 =?us-ascii?Q?hillwuBPAzEEbEm3fq2lmbQ+iCg+Xy1qGRJyOVd970AAXq/lqMszvwNd08pa?=
 =?us-ascii?Q?oL0+Sf7iJHOAKb+Um9mKOhcOp/YdSCjY+j4E1AT6pzwZswTbPXOj/B/SDJst?=
 =?us-ascii?Q?eyrGiTZuTi5cMr2vzDu58+ym9DNnNOiPHyTJKvLzrkK92xjiGsYDiOR+uyDA?=
 =?us-ascii?Q?fUK8/2rOy6OarFNu882e+RaonAL02fqNvE4NH9c0+ctXqeq863L1oLeURsYx?=
 =?us-ascii?Q?dQrNtV54YrdcZEjaVYMEOD5bToDcQe9YIntOMF5z//8fDG3On+0QK9mOi6VB?=
 =?us-ascii?Q?ldIELKatvSxZxoIyuTzFq91lbKk+W0Ux?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QlDjvSKreLqnmzOkP87GNEWMIk4VfeDxikq4q9IHl2S2sPI1uZriUQuqAiaV?=
 =?us-ascii?Q?SXxqHrWhqm5FEK0ww6+0mA8S+iNyRe7G3Lxzv4VNKDHeu/IjAaUPQvg3+6a4?=
 =?us-ascii?Q?NU/C0Zfn6L7LkqPefCHJDSNJz4mY/6pQ7Pod0n1GyhC1XsiabntjWjDKA5KR?=
 =?us-ascii?Q?bOicPlrUM51jHAYMVcqNrwgik6xqsvitBwYN5n5taN00oSo9+kHwCrVXcaoB?=
 =?us-ascii?Q?QIaX8bZM1+2jSPAh1S6KqRHhicqJqiZGr56SYBviMNm+F7Cc1Lr1bdJDd0Jb?=
 =?us-ascii?Q?3ejwy202HJerGZ1GX6NVP8+llX1ZzVq2iB2WWGPP66+UmpIwZjg1iEfkg6e0?=
 =?us-ascii?Q?tORnfPmM7aGnqUOyIS8LDbeT5AT7gPlPlviZrVwKG5iwMvW4LzlhLtI+xklP?=
 =?us-ascii?Q?gc2H/D9GwXASsESdg2X8Gf6rJAymwNwD058A1HqXtMgg1afe00n/TmVQX7PN?=
 =?us-ascii?Q?Q2HsWNiR4Fjk1471MV2iCc656M65qxhiC27Ur2XQcuPSI6nckOOOZ6SCu+Nw?=
 =?us-ascii?Q?TBR7IhYI66E0ronECFret7rGaFyH2EX5T3GnXYVqkgGa1vLtR28mV9V1sOMO?=
 =?us-ascii?Q?n1PKJXSlociAEFhvlNKjR21HClsE3Vzyb6qrWfSBvLhl8yHofDNcuy8E7w4R?=
 =?us-ascii?Q?02k/7ZpFnNLPV8DzBOCT5XjbmiwHVYpmQW7obrt8TVnkUI7jJisCUhb6KMiL?=
 =?us-ascii?Q?SJX+3my2cWmeeU2YVaQOmXsOE1w6SvD0b/8NlE/B6GPRORNithOZcF5doJoj?=
 =?us-ascii?Q?dknuzCayfK5fO1Z1kRGePqErnBcrN0eSYkZ2wPtM2O2KP/f0pU0DRJRV2R20?=
 =?us-ascii?Q?L3ur42cWzrLNinT9xxJVwV7M8EucTrIe86Et1ZnKh7iZa7mnmDwwpgXcB5m8?=
 =?us-ascii?Q?5H4s/P7qbSDqA2wMGtfqSXiFQ7xzUdQ8g83FKqZx9q3TF+YPw1tsL0FT04t0?=
 =?us-ascii?Q?VVakRYUlQu7hnzs6Nm/epAQG7YozonhvKwIF6dZ4GdP97tWzt3AZrF7omyoz?=
 =?us-ascii?Q?+Ok5rDB78278yOCbFVlKtoA48CouK7I8Cfomh/6WtIVcdAqEoMmix5Rt3VRt?=
 =?us-ascii?Q?J3buS8XmkcJCr3ONJoZ+wyr3xQcaT2r5xSr8SbCHS4dCV3w70RRyTxKHgtE6?=
 =?us-ascii?Q?jUHGCWI7leB90UNAQAd7bVqu0Lmn70+yqAWSoVhhqOiT3eSzzYg4DaY4mBGe?=
 =?us-ascii?Q?uQSJ/xB8xl4HURMO8iet8AqoZCC/jmBuwkZVjMcg3Fv4jgfAmTqyy7WP7OfE?=
 =?us-ascii?Q?bfJXpV0XRsch+D3n8n+nDNYBKn7AdK4sPFPJCYzPmrFbxPg24xOkmIJSjyiv?=
 =?us-ascii?Q?Ougoc3F90Oxs0oUT7zi3GtRu32PGGgX6nUDmwosO34ccAxiXH1fwyDDKOSk4?=
 =?us-ascii?Q?Qw1pphPBQbfjhU5O+tmCW5pOLTDaiSTEyD9KIGfGS3uDT5dR8V4P/ciVZ212?=
 =?us-ascii?Q?ipxI/4AKBROeoIzh8mpgfhO47y0YUxzVsMV16y6ktC/ZZ6VstSfJZzHSPFOt?=
 =?us-ascii?Q?3fE0EvkVFSVJ/UDS7HwqjzQMRFOYBSuprJTabg97CcF/g7ogdACzjrmCb5vq?=
 =?us-ascii?Q?o8JjB+Sr7iQcV3vZNtR5lLZwxdZyiTxAsfd2DR8aLJvAH0HPLTOLplVV0zu8?=
 =?us-ascii?Q?vProMduhFzMfdFQhdsiTnyo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec2df5e7-46f1-44d4-5de0-08dd5bab4b81
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 06:02:22.1922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lb7bO/132gBGaPhR4LHJ2OhpQS96wauV0ZvpO1UdEALtMWkCTp8cUKQPv0/dmzs7YlKoENt8w1G4uCAhaPNJoMsmJU3pj7VUxO/Op/QWwC3uTpGRUByxvP8bLdkszbV4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5800
X-Proofpoint-ORIG-GUID: FNTiYG15h7PCX6qWTw9CglQ6SE1bX0fT
X-Proofpoint-GUID: FNTiYG15h7PCX6qWTw9CglQ6SE1bX0fT
X-Authority-Analysis: v=2.4 cv=d4wPyQjE c=1 sm=1 tr=0 ts=67c7e8f0 cx=c_pps a=PZJ0/dUMjH0jBWORzn298Q==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=-ana87LsvZTJyGyMcDsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_03,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=896 clxscore=1015
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503050046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 06:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212293

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Previously, download-ci-llvm was set to false. However, with the following commit:
https://github.com/rust-lang/rust/commit/7d579046c80d3de3143dcb8b2db5640f95b5383c ,
which has been present from rust_1.83, it was changed to true. As a result, after
updating to rust_1.83, we encountered the following error during the build:

-------------------------------------------------------------------------------
| thread 'main' panicked at src/core/config/config.rs:2047:13:
| setting build-target.llvm-config is incompatible with download-ci-llvm.
| note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
-------------------------------------------------------------------------------

To resolve this issue, we are setting download-ci-llvm back to false.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.83.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rust/rust_1.83.0.bb b/meta/recipes-devtools/rust/rust_1.83.0.bb
index c4f8ee7108..cd470b1883 100644
--- a/meta/recipes-devtools/rust/rust_1.83.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.83.0.bb
@@ -129,6 +129,7 @@ python do_configure() {
     # [llvm]
     config.add_section("llvm")
     config.set("llvm", "static-libstdcpp", e(False))
+    config.set("llvm", "download-ci-llvm", e(False))
     if "llvm" in (d.getVar('TC_CXX_RUNTIME') or ""):
         config.set("llvm", "use-libcxx", e(True))
 
-- 
2.43.0


