Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545EFFF8864
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 09:29:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7475.1777454965541312169
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 02:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XZVD4TAU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=957907c96c=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T5LhGc3603015
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=GOha6BP7Ns4ETJJWlG/FnqilozMH4tVfUyfTCtYlV7g=; b=
	XZVD4TAUcyrpTecEfjmJh5D3iY1oh9+ruMjG1nFN6eNQOFbn6Qh8Fhz0UFLVKxfd
	DGj/2B3BE7IIdbWF/2lhOKJCmSfy/Hn+f/lfEAxTv5JHFix1iQXoPamRdCBRAEEi
	+E6jqUeZXQ4SLWDd1lP0xAK6mZqa3U0Dh0k+hZInMxPyn/bCBCL+WqRieWuoCAlm
	utxSAIlCxph1atcKGXifgqIvbOiOtSKpFrZrhy3dxp7ivLQwF3lR9WLbmw2n0L1x
	P6suZdgDIGNXeeRTb6QmEMUNiSz9rgfedfXL9ab67tGih9MO5ImoAN3AmdPKYJ+N
	OUVkq2rSOQgFZoAbE2JUOQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010018.outbound.protection.outlook.com [52.101.61.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4drju0csan-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 09:29:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PqPzwyBOVY149PJEHA6Vu2yJt3bF2do81bPBc+tAxvjVhN5FWgUD20sp6tbibNdm/DihNifC7Ps5yrGQL5lS9vk95CVbxpYPWCcKS1RJRdNyXnOMMIlOs2up/KGLmKyxKELhcSv3UXIiOEqkRXvXv9X3LMjpGURp7qsm2mLDbkE3RVNYmMdiHUpXj4C5CIuNcmEFkLtu6taPt4QRhQevpiJoN/jUQO9yY4sD+WP5hRqPTck9vEr668oaLM+fT40NdHd6XxWnsojL0d/P3vxxn6+FreBYxsOLQ77exugh7vW0xvPk7n8NRe7AyJm6F0lmC0eiHYpzN3pxEEKgzW5Xiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOha6BP7Ns4ETJJWlG/FnqilozMH4tVfUyfTCtYlV7g=;
 b=UxJacy1Nt82uhal7hN1X/5xDGN2p42oAsU8+B7d+IhmlUYxQIjIAslHVClMjUAk1mJ17A30qoWkiAvFqHM7RvUhSt/DNjaAy8p7FnkvNVfZ38OSaBYT0Vq+klFWlwKoEgszxa2AjH6YQI+aDOCs4WB84sqJ6Z3PSIzyvlSsTR3Mbsb+mWctM7UPCx+ANH9RJnlSv4/yku+p1uyXTRSbEWCScTm9uKKxaKzuI2PgC4gUZLSw4sagAVXLVwTWnHHorZiaVB0v0Skyhs2TrLkzIBlenWDaYRRLA928vs8oVVbUV7EnP1kskbKIpkQfCHRF1RmxLcdQLKy2xvESbA0A0uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH8PR11MB7023.namprd11.prod.outlook.com (2603:10b6:510:221::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Wed, 29 Apr
 2026 09:29:21 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 09:29:21 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com, richard.purdie@linuxfoundation.org,
        ross.burton@arm.com, saul.wold@windriver.com, hongxu.jia@windriver.com,
        Qi.Chen@windriver.com, Randy.MacLeod@windriver.com,
        Maganuru.Jayasurya@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH v5 1/2] create-spdx-image-3.0: Image SPDX/SBOM tasks are retained for eSDK installation
Date: Wed, 29 Apr 2026 02:28:59 -0700
Message-ID: <20260429092900.2205617-2-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260429092900.2205617-1-sunilkumar.dora@windriver.com>
References: <20260429092900.2205617-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:254::9) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH8PR11MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: ba1c7fd3-36b9-4861-7565-08dea5d1caf7
X-LD-Processed: 8ddb2873-a1ad-4a18-ae4e-4644631433be,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|56012099003|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	e1W7Sbw9ZvwVR9H2BQmCcmULcbsJHevKHIFz6CvTF351/B7IMgNkSEJpjtGerl46XFzGrugo0il/hu7s+Lv5aniyU5A0o/GBRbVMLfFoTcAqApHi35kV3brd0XgpZFALv3ZOo6WN2kXp1pkiMK5M0c1MysKRoZLJeJ6Nj8S+DzbgT6w6uU8Y+B0KiQjV61Sf6mdT13r4Elts79bULX7BovTvNOu7piF0eN0R3pKLbDkkjbbVOU6HfwWtya9jzUX8W94LMiRbqQhwh8/Yp3zN/wI9myJavmPXHwPNGV7NMaVKp/8AG1boAt8pS7FeKQeSGFE2I8hLCEtyYuI842GBmnEsKsr65SIZyPpuL4TXu3gmZlfF4s1fq9rq2USPcnCVBqX64ZtzV/HJnKxCsauziNWlK4KxNQzPDGazgxMFry1HVW7/r8Wuivy/aFdeBYXPS7+gYBDlNAGtfmYJZ6WwXgg1NS1Ge2mkqSHQhxlJm1t0dQvc01AdpNQ1HgpT3LO7SqORYo6gAFvz9s7Fyz0etUv2QX8TGDvy4KFZQzqkUQ/RzHbjiFlzBXOoY5PJONTbTsgKC9EJ/BDvv0gbemGq47EG7gPi8sf3HzAuMgvInBbu0yTRK0q30Fn99WP39/foLoZs85uJ3cfLji7wZh/46CYRBFQKo4Z7lMaJZRhi84wG1wO0Uyl7vTKIwBqFrnQ8l7Mh98Rk/CrpHQDnNDiXkUTnWuDVOp+J1y+fSJTn3mKoZqgh0ol/PMBFfCbtylEYNP+sEG/5FwpXLNkTHkUfURV0vPspIfrebeUL14AeLj4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(56012099003)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HeZff/WrnoAU7F7QakeGlKMZaNwmdn0qcN6emTZJaAEyiW7haq3wO/lgigr4?=
 =?us-ascii?Q?tiU2oAHpS5EUFY5d+pUQE617kzwmXCYTsvj1pvXvlnwC8DcVgwGaRzRN2sXe?=
 =?us-ascii?Q?ONUH1Ezq3Yi6kJYsx8OIezHZkrYGz7WIVPhA750HX/K3BxOzLgBO/uhZohrL?=
 =?us-ascii?Q?O5vtQ9dWWFN7IQeVraXR7H+niVdPliOOoCKjSk1x0K9w/KCrUr9caGb/fYXa?=
 =?us-ascii?Q?PuXzNZKDRuOvJxgfBuULYnayPhMLV4eTHne76muN0g9dmmPc1TbI/cR7R0sQ?=
 =?us-ascii?Q?oCXXnqdcZ58bFuACgOJz9srr0wEmUSEDAlVADu+ifbwmo3wy7SdGs+kna4vW?=
 =?us-ascii?Q?gnSz/0uA5Grx2H2TIubxwURXb8+nt0THpp0pBlcVlgCbgnMe40umVlJnpiUm?=
 =?us-ascii?Q?67Py7Z4bsXLJX8pxbqaUYFwI5hKikBc5EsT2edrrnj98n4Wky0nqXM9uQMZS?=
 =?us-ascii?Q?Aa9EWdvxpjAcyyudE61bt7nuxfHAl3MDw8Magm8hFGZTnLJf5vXOafiJ2A1H?=
 =?us-ascii?Q?ddi02C511v8RF7HBqnL/1qh/2aIdIf4pMC7hgWE1qbukpMxtGauwF34LjVHi?=
 =?us-ascii?Q?YOEywDNFzVW1NgNCX+qUAIDPWgESam4TG1p3zlbLlx5m4m+8JeAJW5URO0sa?=
 =?us-ascii?Q?COf4BTa4xu6Awn/sUXSGz4cVhLN3Se9ZaTe2HWjUOFk9Jq6DG4n2jmUk6D+1?=
 =?us-ascii?Q?cTNlGe1y5v8VXUOqcp8j5aolhfzNaUb5Whdiv57AZkztWzjBnTKOG0wbWgsQ?=
 =?us-ascii?Q?r371gZd7c479YlEtvBK1ptPe81qTnRScTd/4Mrga3FVRX//97PZRcQmXGwjj?=
 =?us-ascii?Q?qdazG/goGDls/NCDRPDZpdzWgiBbaz8sxF5k4Hq9gdFEBtczk5wJf06mnpEJ?=
 =?us-ascii?Q?WHm9ue8rAKlUpFUeVHDZFSnZdDHTxrNQh4aI8BoD78XfNcAh1H4eS7W5QLm0?=
 =?us-ascii?Q?FxAE3pnPihP9HPFZzKfJIwxanCFt62mNhBKrfqomNgQaOi1+EKxcBtZCoYfl?=
 =?us-ascii?Q?PvYTeAlaN/EkMQl0jXq4CKw67aAt23QGEQF9XTVsAtnpzRi+u6ZARFhCuXoh?=
 =?us-ascii?Q?BrxRqxa6cfpQlELYYZdkfS+tDBp2CREgmhq2iiyGx8f333eaX8mrC/mlFouA?=
 =?us-ascii?Q?iFBRX7R8wesx2D8PH+6kewD5xWV1fCF1YN6vPEvUhI48f8WeujRrcCP81+NK?=
 =?us-ascii?Q?KuDYWNpd7nquLcRe4QLaGUzPzGRVsCv6wM4SVsPT8RPl4F4wGSPYHaIBfz4O?=
 =?us-ascii?Q?05wGaztJvncw7BYx0O32BzWPi1LdhyAIsXBTVMZx5BO2z4tqgt+j94b/+TCz?=
 =?us-ascii?Q?kIfgcUo4jBOtdF3rCafICJyvpQjHRjt32LSd5LKF24JaKY0oheH9Rc7smSfR?=
 =?us-ascii?Q?MYUB4ZoNiA3vUvLwEM9dnVxPvuJ9URBpL2m3Ux97WoW4chvKZiQxASD4+VZU?=
 =?us-ascii?Q?95NKJ2oF3pmX4VeHOyOqeLy329dOhfdmxJ/ZU8OU8SRh/F2I/RKWOjyBgH+0?=
 =?us-ascii?Q?VHCx6QU0UaBk6eZ30RGCMZS7S9dTzVxWYwtztLJSmIr69q9cgwTSaxkGi2AW?=
 =?us-ascii?Q?U+zgG3RfyBuEkE9lyolyTT96qaeFKwtofOdC9u3o8mvJv3vHb9oiKYrlBoEF?=
 =?us-ascii?Q?sKrAnCjjr0b8+qbI5P65+FhxNrdbw6/EEOUlum5CMrfeQrQrMbrjvU4sXGT7?=
 =?us-ascii?Q?FxFu6h2/nxnrJqkJEuN57y0IlF7z6tOyV/O3ZG3x1JCgSft3U+ue9EJZh2Wk?=
 =?us-ascii?Q?xQ5rKLjnSyQvs5DXD0WCznHoC7jo0kU=3D?=
X-Exchange-RoutingPolicyChecked: 
	ozv7dRddJ3xQ3GpwHhDdvQiBarMdAtQapZ5okw3duwcGp3BR5D3FtbrAWVZVcTeLeg5P7CIyZsbURFcL0iHd3ENWowg7KPjWqZr25b64m+7NdIlEk5ffzSPX3Jj85BFHboDT2n8ib2jYojBs1yuXZHKAqqkuW1z2cHg/EUtE2oEyMbrd3F6CX3Qcj0X5VSon/8Or6pGRdpdLUKTtfukWVYqhXr3IwLjX0IrXDWztR6veWpETYeP6EzbgZ2H0udPfmUKKBMzqINatO2OfHV1xE9a4p98tBnlKjy2FaFCkQNQZOoKHrpOkIJoVuGbEE/3EfQ6+zMC4M2DxjWzNUwJkHQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1c7fd3-36b9-4861-7565-08dea5d1caf7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 09:29:20.6425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BVaWqFP/CcMwS4Cw430uYG1Tc7bUJ18tl3aJ5q4bY94Elp6k6wIidjv9JuXclp8DXFo4W6POzDSjeTekIQPabJ/bpadDNGq4B2vmOCh35mE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7023
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=J+SaKgnS c=1 sm=1 tr=0 ts=69f1cf74 cx=c_pps
 a=+TgAdn5i6nn1e/5/V9fTSg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=ikt4RBt7ELKClQgxfkkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: kiZrte0GplBOw9jE1E5SicYNfYkiXjLv
X-Proofpoint-ORIG-GUID: pIMbmcd9qXnWFsxWLcm4h3tIgD0X1_W_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5NCBTYWx0ZWRfXzc4hWBnMa9v1
 YZsJYJUjbuEhNOmangZdUjQFWSXgziS0iP6ZuLbYWAPWymvkVmOakUyvZD3eUMzN+eqaTFPEFIj
 wq7KLb6rx5j4EGLMZc6V2QN7BcX9OYPVHqFxc3rFtHKadnCGtXChHt7aH8Wp/qPMKIFaN921MgK
 +boDhQGE8U7zCF0wVvpk5IZaEXwGZgBsh6jMbFxTDRzjAiGkXHcTPg36XnWrgM34goahMNFWypQ
 nPxK7Xr69kGOvaoYnpr0xyouCLhD77xW50PmOCj9EJ22B5NPl3fttIqqVmN9YFUSoVSzELZ/p3k
 wdeUAkZ3vjg44HR9MvDFRuwJXqN5s/wBUfKZhtfV8w5An/qxshbwPHDyudXF8jipcJ8xJ6gU+uX
 ZyTngkqja04XbgUgqQbCsI8dhepS+qOWW2YyFHcQFbItEzg1/vHCYs3VbsNHsDushNDjSOkcDcI
 gyDigcbCpX3R6N+E3SQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236091

From: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>

Fixes [YOCTO #15853]

Image SPDX/SBOM tasks were running after do_sdk_depends, causing their
signatures to be excluded from locked-sigs.inc. As a result, the eSDK installer
attempted to re-run these tasks, leading to unexpected task execution errors.

Run do_create_image_sbom_spdx before do_sdk_depends to ensure all image
SPDX/SBOM tasks are completed and captured in the locked signatures.

Signed-off-by: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>
Suggested-by: Joshua Watt <jpewhacker@gmail.com>
Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/classes-recipe/create-spdx-image-3.0.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index 15a91e90e2..b9e34645f9 100644
--- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -69,7 +69,7 @@ python do_create_image_sbom_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_image_sbom_spdx(d)
 }
-addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_image_spdx before do_build
+addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_image_spdx before do_build do_sdk_depends
 SSTATETASKS += "do_create_image_sbom_spdx"
 SSTATE_SKIP_CREATION:task-create-image-sbom = "1"
 do_create_image_sbom_spdx[sstate-inputdirs] = "${SPDXIMAGEDEPLOYDIR}"
-- 
2.49.0


