Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 048A9C48260
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 13:17:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17248.1706188623732981550
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 05:17:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=h9KIzsNE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=17541b5c6f=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40P7T3jf002664
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 13:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=3/tKLyUcn8JYi4nU6KRjMEGi7TGeggur/PfByqa357w=; b=
	h9KIzsNEdLDw/1Q52eEP/ocgad3GEGdAxrFfk3VE2Kw77fsWvNuGiglB7AwsxyT7
	XwrUhJg057VB1Ux0H3TZrOHTedxy9wpnDxMe5Fown8sA05DAPf6GAT7nu5h6ypn+
	AgBANsgchaXNNLNSzcEHTeRpW2f2n/Q7lcf6KvTQhEUPstLnt13gNVkN22gKLNoJ
	YSZ+P/YGlmid/QeKHuDbPYKNysX9jOnvpXVDIfEL+r462f4Ri+oKa0W2EuI/XYHb
	5sozE7LWaEzeaghiAb8oZvlkKnVZvDE6Tj61uNWtTv7YJcAhb6X/zNU9qvGC+h3T
	VQZ0rlDPstpAzw4Dg+4RTA==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vucwq0hjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 13:17:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iubjvCivN3+JvfnNNprPlOZ7+ieETjPmBPaHza6WBqaWnLzlSM51vdIL00dS4yaYXAIn/RfyfDRuLx8l3a0MrMhIj+lNp2N7A0QwVxp+GlnCHFecMPon5qhmUeuFrDms2BW2qC9A1SkFA8pIxU5wvosug2mJ4Ru1la22eiqxpI+P8h8cjnI+cf5PZu+LQ2/aES7I7IxAQv/WwnvvfmAOrHPVADzFCPRSB45JLbQc7uKw1lOCiYbJ1eE4R9lwFUQuYKvCa5NlAwZdhktASBxusBHUWXVzWyJejhLyVsljW381GaWblVbrbif5TaNyJF8D2oWNF21D97vDef8EY/27rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/tKLyUcn8JYi4nU6KRjMEGi7TGeggur/PfByqa357w=;
 b=fpQVPtaRuMkFvsWG+1ndsNrtk2p8Rrd1iabERtefEaioQWNZHBB+MPcHIms9IUMMuoqNmqdGy5/pKI4RK+ZmhmZ5pV1JIiK4hDl6bOlSNJgIo8nK0rbbV2g+VhsJhuKoXQ/QajfX+ktOJk7x2my35KZHJgDv0m19rRFS4ESK2V6bk88nODms7s7dRBkfwmla3G0kOTbSmwnnaLRC9AzBKesTg2yr3pZCNQTY03rxY2uqqsT7u9zJ2STBZ/Oo2RC8yyBc/xAp1qpxs/85ihNj0mgrTbOqAkVQkDR6nPKvSttqShII4GbgXLYBirvZR3Bp30M5huv4VGXcZ7rkiCwBoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH3PR11MB7179.namprd11.prod.outlook.com (2603:10b6:610:142::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Thu, 25 Jan
 2024 13:17:00 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7228.022; Thu, 25 Jan 2024
 13:17:00 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v4 3/7] rust: Enable RUSTC_BOOTSTRAP to use nightly features during rust oe-selftest.
Date: Thu, 25 Jan 2024 05:15:59 -0800
Message-ID: <20240125131603.2769496-3-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125131603.2769496-1-Yash.Shinde@windriver.com>
References: <20240125131603.2769496-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0048.namprd07.prod.outlook.com
 (2603:10b6:a03:60::25) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CH3PR11MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d97840f-ac6b-4f13-b229-08dc1da7ea3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Vx8uLnGo+BantNlVsU9hXbdMBCrubBb9Qky7OyZDpOf9F35sv2sk8nBuuvWPICZ27js5NFQ63RXhxsV/xeG1nN0abetUXSt/00rEyGmVUJcKBaVci+tx6EPzZA4l1RO3MO0RjzLp9Csu7IAZM2p/3XcuBovOvgw2Kh5kHLi6Glh6KEiZDOfRtD3dUfZqGzP2th4UBbIxyb0tQ9asR8pYKKt0PrF8obh0vUZpKHyFudB53W3VuXmjH1IUPzt4gQXdnh/MZU/5Iu3B9dCYXrNj+duMbBbJygAViMMWf+/Omtgpy32DTYlugrJW1ln700DZYgP1cmTriqJ8omG/lrQvFY7dtWMWojNFymAxL6eUzaPDpxoNfZ/gGuBvW7iAs6uoYQfDMNuXo73CjbO3MnoQ4NhCrpoMvX/F+cQV0HoA9oIOYHiuKEP+NnXzU4e7/BrZf0JiHIRITopjAWI8CSoGqZskJQ2FN8wqb43ccdGldMcy3OQC5Vj96AnuJ0J+uebORopNjLEoqoIHzJcwangKLTzHVUbAQfLnu7t6D2Ju0ja/Lza6bjvodhE3tHtAn3roiiof6vadTgWlP2HvSZQRCm5SDU/i/FK9D2aKzXI8tPs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(136003)(346002)(396003)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(41300700001)(9686003)(6512007)(26005)(2616005)(1076003)(107886003)(38100700002)(8676002)(8936002)(4326008)(5660300002)(478600001)(52116002)(6486002)(6506007)(2906002)(66476007)(66556008)(66946007)(6916009)(316002)(86362001)(38350700005)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6QwoTcwDKC1WPFynTzv71MtFu0WZmD87Fm/nyQATiFkp63A7p1pQqcnJoawc?=
 =?us-ascii?Q?k02e8Ef3zStAwqH4Ob6iWPoRxcyTVAv6sD0XVk+7IbRQHDJpgf1ERpV3Uw9t?=
 =?us-ascii?Q?nSW5tadL6hdoFrYeprNvp87Cs/dIcCsM0ePf6JBsP3Zk9FfMqhuhkuXcZoug?=
 =?us-ascii?Q?Azy9sjxFlyQyD+EPoUToipnIyq5v/bw4+HGxT2EOGI0vS2v2BUwvSSROpog4?=
 =?us-ascii?Q?UeIhj+EHLpeWDLf0KmrDvLibBxAprs9FAQmYMLlsMNxDTrOP9rZV4aX8CxXR?=
 =?us-ascii?Q?dToblQPV2IsKALJZflF8+DXVdBoeXymAQWCEq1MjsuoaPJus/EEP9AXZ887F?=
 =?us-ascii?Q?Gd4sLafxd2xRhD0aEKcjJX7GeM7DfSfWlZnw9gfKwbBtd9PdGuF8OtQY7acL?=
 =?us-ascii?Q?z31cXj3R4Mic0zBiiTLNlhJD512Ng5A5y9xT/Vw+F5jiZTyr91PWF72ZeX8l?=
 =?us-ascii?Q?3CM677HtyB0S1MWnWahBFgR5izRSWCKPJ63+lR++/cXtaG2OneTjmDxc7S8O?=
 =?us-ascii?Q?xy8nnUwZ8tKeyEUDnzi99U9HJVOWpKLO/PlHnUvmH/gsukzjbElmQELNOKPR?=
 =?us-ascii?Q?qSiKGtiAlB0rQmws36n1QhUHAX73b5UcypI9B+8OI9k0HPDNaOsWPmWAcpon?=
 =?us-ascii?Q?040f3cD4M1ZzULzIUnWrvpp1EzqpAj6MVN665pfqVmzTgzty6pVzyBynbHvV?=
 =?us-ascii?Q?TJXRN2qV7dg2a+rQ9YtnpCp0LmSK+1x8ajV6DJkgYSt6kS8RjIJVvDSzo6tr?=
 =?us-ascii?Q?yj9RMnNfjOCNlEkRNIKy/mOprPSg1vreNCMwip93totug6O1+ZeOUqlzBIk+?=
 =?us-ascii?Q?7WnN4WPs0278fl87dTnWYgUyDDyb2j4OSW76KWc66BQ8qWuC5VqRPl0r719A?=
 =?us-ascii?Q?aR9dHf2jiFOA3NWjegJFNTEiiMyfshDx7Ynp+sLu8U7bK3RpHBJ4a7g7o/tB?=
 =?us-ascii?Q?C2TIjUn68WNg+8Sv5EzhFUl6rteNgGnLm//HsMA5r6zpHuB3nzo4d9lQaUY2?=
 =?us-ascii?Q?zwvvuRaI/9miLnslPSRru7AzOyBrVPf2K42d/ctO3Oc2bV/zP1zNdY6aP/ny?=
 =?us-ascii?Q?N/ooWG33UVmEDkCi9j74EFVr9t+21UOAzf0ERA9+NxrksFe1JJuFtAAYsskm?=
 =?us-ascii?Q?mrvSCARKvMmLWVsdgOWDxzRP4Y2nMXxhstkqwKsQvs8vb0vp6adfhxIadV+S?=
 =?us-ascii?Q?m3V0cy28iQdd0p7ketVJyvJoG2v+PBpyVrj9p00bH9Q3OclPKFOXpGgrO/TS?=
 =?us-ascii?Q?LyZVvQyX+ke6lMZ3wdF4l+x8cvuNRdRoma5toASpCAu+nWPUxCs/Fw9r67rj?=
 =?us-ascii?Q?OuPXu0AaFF4O7+CtFRxCNNcf3BIIruvmbjeIpQEt9FmO7J0bZix3CmUqvj58?=
 =?us-ascii?Q?jRwSWJtdGPsCkvAVL0+7h+LCNFIvSlcqki8hH+PKgquhLXdG6gIu3j2u6ofU?=
 =?us-ascii?Q?oGhQ2Lv78uh7Rl/BNiqwYDtRWief0Pf6sv9wt9oNOM43KBJzoYRc66N+V4mP?=
 =?us-ascii?Q?/lomYTQNcEyJyQGmnzH0pu8o6BePoXnXH28AR9M/RbrDE5OZbBigxKxTm0f5?=
 =?us-ascii?Q?C5OTx4GAgC+JpM7KOLmmHLcLR0yqPX4mt+5gcdLMgUIXmuNCyF3P9WBNc7/f?=
 =?us-ascii?Q?rQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d97840f-ac6b-4f13-b229-08dc1da7ea3f
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 13:17:00.7510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0WZ8vtYLJPzXeodOvibyfm4eDYqydHM58jzn6DSFOHMW+lzPlKWHm9GvM06e7sp9OX8UmbiGQW3RrVAEbz5gbeiwDF2XMEdX4ocGckscvT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7179
X-Proofpoint-GUID: dt-Mt78BLLiQy0Gcx2iY4bs6tlVDUkF4
X-Proofpoint-ORIG-GUID: dt-Mt78BLLiQy0Gcx2iY4bs6tlVDUkF4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_08,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401250092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 13:17:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194322

From: Yash Shinde <Yash.Shinde@windriver.com>

Fixes: error: the option `Z` is only accepted on the nightly compiler

When rust.channel is set to either beta or stable, we can't use
nightly features on bootstrap without RUSTC_BOOTSTRAP.
Set RUSTC_BOOTSTRAP=1 to use nightly features on stable or beta.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../rust/files/rustc-bootstrap.patch          | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/rustc-bootstrap.patch

diff --git a/meta/recipes-devtools/rust/files/rustc-bootstrap.patch b/meta/recipes-devtools/rust/files/rustc-bootstrap.patch
new file mode 100644
index 0000000000..406fc610bb
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/rustc-bootstrap.patch
@@ -0,0 +1,21 @@
+When rust.channel is set to either beta or stable, we can't use
+nightly features on bootstrap without RUSTC_BOOTSTRAP. Set RUSTC_BOOTSTRAP=1
+to use nightly features on stable or beta.
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/pull/119619/commits/8aa7dd06f6e50621dc10f9f9490681be8a45876f]
+
+Signed-off-by: onur-ozkan <work@onurozkan.dev>
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+diff --git a/src/bootstrap/synthetic_targets.rs b/ src/bootstrap/synthetic_targets.rs
+index d2c65b740da..45baf56f46b 100644
+--- a/src/bootstrap/synthetic_targets.rs
++++ b/src/bootstrap/synthetic_targets.rs
+@@ -59,6 +59,7 @@ fn create_synthetic_target(
+     let mut cmd = Command::new(builder.rustc(compiler));
+     cmd.arg("--target").arg(base.rustc_target_arg());
+     cmd.args(["-Zunstable-options", "--print", "target-spec-json"]);
++    cmd.env("RUSTC_BOOTSTRAP", "1");
+     cmd.stdout(Stdio::piped());
+
+     let output = cmd.spawn().unwrap().wait_with_output().unwrap();
-- 
2.43.0


