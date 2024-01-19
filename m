Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75EEDC47DAF
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 13:44:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.22327.1705671881160226809
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 05:44:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=S83Kcu18;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=174893ae64=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40JDBUFq012496
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=bLFUQGg0HZ4ptAyzqEcWSrR2yXDsaUkUtlPQ+KhZ95U=; b=
	S83Kcu18rjICjJTdVcE4Qna3fJbcxNyd9XGhgaNrIWNX9u5Yq2dPaThyq7IhXAou
	k8+ob05GOOOQnn9LxLjKVnCWPqk3UpWXUPF+8gk2PaOdWSOidtekrHLdzx2pBXzX
	BM2Bqt4lVYRNe9doibwtBGi+sEl7GuitATTkFblcPdkW1fF0T5SKGawjodW8a2Ut
	xH4YtzSQKQ4K/6u/aeFd5e9TgAwQhP65roZPh8AbyYuAHEiyxxQ6r0aOw87h4hFC
	yGRORcPmBrpKhIxOuYOE45T+tRpxsVuTMy8lrCss1x0qm1VcoFzHRrxjHoKCR/iS
	wE1S2Ik5jatgVH1XLjMT3Q==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkfqxf3bs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:44:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJc3poukMpQc3yCDa1DIDPLEAp383Tc1MZEpEEuqF4bi/MkLDAQGmBfB5xFkPIn4ThbSPisrG/lQGhbYR1fEdTW/SMgl50RGuIiF6MbK4XEFccP4RNHA1FTq3Muo8JBXixvfRDJV+Ja5pef6/IsLe56YIQdsnorc4r/HDOpOYLItuxO3wdsy2oLE8asLSbwyO9g4NGRwxB9m6BYmeV1u+4ubFqSO48HegtCBIuD5GeX/w6BXpWWUJADjAa5eF52Xo67k9Q67YdT68GxIk8mpzG98Zm3+HClPQaOE+EuBp3rwOZKjfpB7cxB+4ndZ1MTlPTDefc52LQtyCCPALjlScw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLFUQGg0HZ4ptAyzqEcWSrR2yXDsaUkUtlPQ+KhZ95U=;
 b=UCIVRCWMJMpMSnexaA6Cix3N0/4fo4MTnjxA9AylacF7tbeWAM8bVJayAZ1Vq53AoaDgA2FPAlMpNARLlHyPLUXSkqEVwqbnetDICxsiwqL4DGXjr6rxlarZNNNy0w1v8t0loQSRVHxVoYekCNzvNRJccGPo25/+Gfqr1TJhpImYXMeN9RP2+LgPUH22ycYKUXvJ/Qz7rhWoyvP/EJsHoYAc8T982dxztgaEuIrTh1lkpR2oe7LI0hBWtF6BREMvyEJ3XEN1Bd45UPIEAuvU9+rBqAQbRkp0ZV2QoB9dZAGD7xK7hsVRlOlMjTeM3+kYnUBvPRBPdOnZLV4x0/rArQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MN0PR11MB6109.namprd11.prod.outlook.com (2603:10b6:208:3cf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 13:44:36 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 13:44:35 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH 4/5] rust: Fix assertion failure error on oe-selftest
Date: Fri, 19 Jan 2024 05:43:51 -0800
Message-ID: <20240119134352.3163178-4-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240119134352.3163178-1-Yash.Shinde@windriver.com>
References: <20240119134352.3163178-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYZPR14CA0008.namprd14.prod.outlook.com
 (2603:10b6:930:8f::26) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|MN0PR11MB6109:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cfe9467-84a7-4352-0dd3-08dc18f4c62a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G6rDHiD3osch3CN3INru1tCQ+ema1gCHfr/LStZpRj9Iwwzk2A0H6Q32s9yhJj7Soxr2NpIY+5FNMy7hMmwMKyy8XEkrNfkTILvT7PILXNgdxgD91TlRVKq0NCrSr1k3nKEEx0wXNv1vLFHzYC60mRy07eg9/6v9Ws7QEj1ACYcEj+sMXAVgBGdmMsPvav0yU4j0STxSbscF0F+vFIIYDFPA77u9No+4qIxVSSNTRsCTLQDoxNtH2Uu8cbQt5O2T9opHNDZQlrMNHHCHN/UmbKuWZN0EatpitrpGmmrzIdKuMOjrhnYmo40X3QwvR6hHAOmHiETEjgB/ZISNzZ7ZfOIK86bQA5ZFconIrwl/jqcyXXxy2WXBlKtvo/QBDGT28FNl/HtFSDdC+wUUm2PSfYPnmX53d39PKgV6wp28oxHVj3kdWQqVa6N/DIbUpy46CeaPAUKnuKNIfrtJb7PsXwQuvvBPTGYk9szbf/3QV2dAvP4D8LhfbkTDTfqyJkCDQh+tJxYZEF2AD3md5vk3GcPcS9unyqJ0oryHKksilrv/G7rUvrG3mi0oPQJtDGoWnKGz/htwaDcFp/ys4vzriLOvmGBkcm6GL0SzrbpAfZk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(39850400004)(136003)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(9686003)(1076003)(2616005)(6506007)(107886003)(6666004)(52116002)(4326008)(6512007)(6916009)(86362001)(316002)(26005)(8936002)(8676002)(478600001)(66556008)(66476007)(6486002)(66946007)(38100700002)(41300700001)(38350700005)(36756003)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KkEK2a5mqnjCc0/MaqPOktQY2M23A9S2QzTLXIHM7fzBubPG7iN0fLuR3g9j?=
 =?us-ascii?Q?wj4U4SbRCssBJKvkrcR08E0sUCGVtzgMcTFZfWtJQ/LV6ifFyqZHuVNwwrRr?=
 =?us-ascii?Q?xHdDUEFz5fwUGVHI6K2GPbDgfd5CGN4U6sro1JZ98anERmyDybhtNPIpo66k?=
 =?us-ascii?Q?ZZoJl5hNXWxrMawuIyCraQkPpjnH/NLCejISK9HPnr3mTGS5m1/z/BJMF3BX?=
 =?us-ascii?Q?1XkCNpv5YYhii3bnHISYk7hagtVL+Q8cStPG310LiVN34e4K2P2FKIZh06Ax?=
 =?us-ascii?Q?2HzOTpZ32VV1GhCMX2QdXHblFpPUg/ryR0gNiNfK+N8KTos9RXw/HIBDRq5G?=
 =?us-ascii?Q?EaT2AQXrHh/z4YJT6sV95LYLz30zNco2PLLeFjMVaN3IDIdBX45Yv/sFiL6j?=
 =?us-ascii?Q?m086/gEulrjyWwrpNtWOX4vFlNl5PB3sAhWHZ7r1pEKEVKfX8dHXeIcD2SDb?=
 =?us-ascii?Q?sLHngXWpk0bZhgOfDMUeDUP8yVzYXnfMUilCJDVk2qsPShCyyiq03vOKGqi4?=
 =?us-ascii?Q?csUabfU92OrHUDnms534f2xAU0K86maCLtTKpo9fmPfQutI3O5UL0LXBHxLF?=
 =?us-ascii?Q?vutdKYJoLU3d4/egg6xjOsVTmEtLW+HhJlMMP2qaeGXEr14Wu6807ygMdWe2?=
 =?us-ascii?Q?hkVZa53VAT9s/aRsx2myVz/3PmxUSHTGMWgwK13zSA8XPixfW+ps90BIG0iC?=
 =?us-ascii?Q?fwTZskF4So4A8e8kez+s3YIeJTlMGKGp1pYYY/OWkbWWYYrClcd6Pgmo5+Yr?=
 =?us-ascii?Q?bcSnby9g2pHEMna91QRLjzzF73ougWtIZrA6nkXEHOhVnMaPe4bQF04x155h?=
 =?us-ascii?Q?6MkdyEDuuELik0zoPYPyxv/Fq6GmcQcPQALsre4gohqK2WBvQGxbDEtFowsC?=
 =?us-ascii?Q?ZadM+Y/M3h89ugaSRlrEqxW/cV0YhIguuEcPCgeZwDEMbr6NG9XC1aOcr+jD?=
 =?us-ascii?Q?O8IDkFsSsux6Xwh374m2njTaiMuSoPMCYT1v77rH/dfCGU+CI7amf86IOCxm?=
 =?us-ascii?Q?VqVsJyJ7JAw6VI1Fhp1kuOZqQnbyO/uyjfSuy85LmLz9nOvPolI9z5v4etnt?=
 =?us-ascii?Q?Lu/4ZegsQ7jsK5VkWjn92mHrk2JljMnC1xz60DWBMJY0qzBfxY9RHV3OKdmJ?=
 =?us-ascii?Q?g/tTHsJK4y5JWPUUlYSGCmbWiVjQK0hbrdy3BMnL3qidtvt1IrNn2t1+8XwP?=
 =?us-ascii?Q?vRiVZoIfDV+pgS95rg23m12hcBrgzb1jG/nZoTxivIE2JxoQ+I2CkXgsvk1s?=
 =?us-ascii?Q?JLTCO6YGyPjEVcUO43eGzyy6ABmjfsOh1hJVuatVmGVCoQfWtKdsrw8iRhHT?=
 =?us-ascii?Q?YDANMO63CCev/8rzJIMhb2CSzs5alVacA+rbVRgHzYGEqBo6DJNQcCFGUFWF?=
 =?us-ascii?Q?W6GgOZ0NFr5MlKXomSHlxh2DQDBm+TIcIe0WBGbZTcTF2rIFfk1tPd4wCxNx?=
 =?us-ascii?Q?/wtzVx2klzlxk0hl9hgZU3ycxpYWwpK+4qdhSC5YNMkN98LoqbA5CP9gI5nu?=
 =?us-ascii?Q?fbg0mpJZR30ckc7dfSs42rp5OYRav93fxCdf39p4dZkloYf9kTQnYvR4DulB?=
 =?us-ascii?Q?sy6kAOKZkjNSq7dmO6i9VfpSAgIMDzbxAuHH0QSY4Ls5eky3GJShmipheVt0?=
 =?us-ascii?Q?PA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cfe9467-84a7-4352-0dd3-08dc18f4c62a
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 13:44:35.6729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zUEo139MsFdp2p1r70Lm5bNOgecMr18JU2Qjpzx4XL8E7+84X0nMpAgduklhSoiox72Deoe/QXnTv5onrPqpZsPBayGBtl7CYLi13AH0tF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6109
X-Proofpoint-GUID: trwJASeROBF0AF8psBd_5tSySEKlHInD
X-Proofpoint-ORIG-GUID: trwJASeROBF0AF8psBd_5tSySEKlHInD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_08,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 mlxlogscore=820 clxscore=1015 bulkscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401190071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194048

From: Yash Shinde <Yash.Shinde@windriver.com>

Fixes: thread 'main' panicked at 'assertion failed: `(left == right)`
left: `x86_64-unknown-linux-gnu`,
right: `x86_64-poky-linux-gnu`: Cannot obtain compiler for non-native build triple at stage 0', compile.rs:1474:13

Add correct target value for cross-compiled targets on stage1 during rust oe-selfest.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../rust/files/target-build-value.patch       | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/target-build-value.patch

diff --git a/meta/recipes-devtools/rust/files/target-build-value.patch b/meta/recipes-devtools/rust/files/target-build-value.patch
new file mode 100644
index 0000000000..23e8c76801
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/target-build-value.patch
@@ -0,0 +1,26 @@
+Add correct build value for cross-compiled targets on stage1 when
+bootstapping rustc.
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/pull/119619/commits/b888e2f82b9dbe81875f50d13adbc0271a9401ff]
+
+Signed-off-by: onur-ozkan <work@onurozkan.dev>
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+diff --git a/src/bootstrap/test.rs b/src/bootstrap/test.rs
+--- a/src/bootstrap/test.rs
++++ b/src/bootstrap/test.rs
+@@ -1489,8 +1489,12 @@
+         // NOTE: Only stage 1 is special cased because we need the rustc_private artifacts to match the
+         // running compiler in stage 2 when plugins run.
+         let stage_id = if suite == "ui-fulldeps" && compiler.stage == 1 {
+-            compiler = builder.compiler(compiler.stage - 1, target);
+-            format!("stage{}-{}", compiler.stage + 1, target)
++            // At stage 0 (stage - 1) we are using the beta compiler. Using `self.target` can lead finding
++            // an incorrect compiler path on cross-targets, as the stage 0 beta compiler is always equal
++            // to `build.build` in the configuration.
++            let build = builder.build.build;
++            compiler = builder.compiler(compiler.stage - 1, build);
++            format!("stage{}-{}", compiler.stage + 1, build)
+         } else {
+             format!("stage{}-{}", compiler.stage, target)
+         };
-- 
2.43.0


