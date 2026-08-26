Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC424C61DD4
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 21:46:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23337.1787780769666322610
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 14:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IIiaQ46m;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2698f24599=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QKeaVR157126
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 21:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=XddR0/jmFczF+a/KF7fzzJ59dUhFigBtOkt7u8ptAlw=; b=
	IIiaQ46mqvFd9m3uruVq1rExyepK5cw/9hhu8M68nqp17MAVrtyflKNYPYRINJVJ
	8hIFIP0fmvtbDIueL/JuS/kRJY5jdZg7zmU0pD1vd36vumtpLesT5hfxMERyCmO2
	Vsqf4zq8uaO+1rWmuAyqoeaq6/sZvK7Lv05o4Y0334omXkHf1wfrkGsuFMBb8a27
	vxrWc3tUkGuUdvmy2y1+nzoVHJCFg8mI3yrGAcCtEgW3Vw69Q4BUYNlktqYujG6U
	5aiJOv4HeCu8Nzcv8ayPwLx8BEFU4rr4zuu4Hs/XRkyF7FD1Ml+zoAaWtGWrI2EB
	b9jH50NRORYnvQjadlg+Dw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021122.outbound.protection.outlook.com [52.101.52.122])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g72r6yfhw-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2026 21:46:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjNzt7e96s2aadKA3BDIS9R5ZbLWqnMyrU305Z1QVjfogTJGcXlGFtOpYtit8oS8IbHGV96KzvRmb74PEgv4iySeQ55/HO4H8VSqoUFkd9694eiCQznadXKJ493mWV1BCKgd6JACgkNXRVP/tWkhFEmPMCfmaUX8otrqzs+QIKV5B0gCthjiDB+A8VBZ7g01ZnCecFNKXDNl4kxnbJ896kUuZcKxVjqIyeIsuJoTG+BYuNgNJt0NiApyTyiGjO3GesCaaLnlxwUpYuFF8uqiZpvEEZR2ZcstHXhiku8hbMXuZX5FccV8/DRUyQvnbfmcasO9W7sHA9gh0bS4/Xf2GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XddR0/jmFczF+a/KF7fzzJ59dUhFigBtOkt7u8ptAlw=;
 b=w74gyoW7Qi9wTAC91BAevIQYMfZfIs1fRZkQpN2Zw0GD6+OgKYLwjwzbr53a+vygNhHFLoBxBN7xbZ8Ggc/Y1Bvges6TPdIYGgUHDHhrE160NOLPYt1hoJ+NdUULzdT85hYdM+z9l/84JJ3zR11AfJy3btApN1rwrVs0x9e9ZZqmyHkI0vriuVCfkYm4EPA7sYZ7L4Op2xyh4cgT4nO/BGYo+/Ozt6djqtsu7EI0/VgMF0SOD5owI5J72TLm9DRbvx6sdk6alaBYrMiAETZEPB0pTNoW9NeR3KPJeCmyavyTWS8E4Qz2rA13sQuCMrn5fcAATLB0GC5oEflmLb2s7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25) by CO1PR11MB5028.namprd11.prod.outlook.com
 (2603:10b6:303:9a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 21:46:05 +0000
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b]) by DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b%7]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 21:46:04 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v18 06/16] rpm: 4.20.1 -> 6.0.2
Date: Wed, 26 Aug 2026 14:45:38 -0700
Message-ID: <20260826214548.3002838-7-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
References: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF5EA507B64:EE_|CO1PR11MB5028:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f64b9f2-b4e6-4bfe-c2c8-08df03bb6dd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|13003099007|38350700014|6133799003|10067099003|56012099006|5023799004|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	ArVYPRS0joAKr+tpSaWAw59r8t7cTLtbIVvC4OK/VXKpNvfL4RBb9XHudty2P4iA1bM7wqZm5M929M1Orv1j9jqp/VfThGIl9Klnw9YqFX5zkJex5W779Wycqzik6VuswXfbzO3aGoZQaNLcEvsj5xg8GN9VBazCC2cmU3DYcsT5OYDKKXTLB1HK0UlR3B4SHNwOY41B41eV+rVrpAlIGu2k7tt4RtyFcVMptAXhsLv03Cr9v56MXllhg/kKi1Y5San4SVGiWlRXqBwspzyo5G0Rr4VB70b5DYBftLD9qRY15jh/9pUKnnXzF9jyFjM+YI5tzrvSlXcuLbMmdKXH2FX3QYe40Now9NOwzE/I7EG4fcqCzO6sRt0lzuNy0KKVzljfVT2XkesmTM8f293m/cYtNJXBeYEXOkBdMtl/jAHpZBQ83CTmWjw+n29PtswLTvGxlBOm8JnaKTkZzCeHGbuDNEMIpa9ogMMqz17flzGm+qEyXNahLgt9sviJx9vg6aZiarvq+V4mR2XJjyvNdRgBz5V2FV6+h2+lho3vLqLqvLl9Apojs2BV/EyU71n7bdukhWNv3/WtM5gzr+aG/8IlqKvlft5I+VdvixkM8I16UgT9OlODnRILM7aPLA0d8cRVO3PDKM+ILZWNAjmmyQhQLB/EdzvmNpca7+KM8wY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF5EA507B64.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(13003099007)(38350700014)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?frfvUDoMT+UwwJUAyRiCc58gDu+uWCTvofAKdurBfKBcLyDwnVlMY701P9Ii?=
 =?us-ascii?Q?ZrzzazzRnsfzR0f4AdV+pOp1kKRsXmGBfLTaAnfYHjnde+lqnZelWspMny2J?=
 =?us-ascii?Q?B044Jnp610FnY3Fm9ln9CdL5sakgGZkVCdOBui57XHo60YylbiZs5C9qY5aB?=
 =?us-ascii?Q?2p3a6IwlbSLMo9x64AGXqotkO7dPiH7q+AW7DxssP781Of7Z8zsCcNofD8aI?=
 =?us-ascii?Q?3ZA4iUCaZXM9qgBQCSAThYVORN3ZxrqRIZnccXuWW1mthdPjCrR5Ws+IYkVe?=
 =?us-ascii?Q?ZL/Eydoa5Z4ZzQn28fUjyPZYIhBe0By5IgXjYr/mZQc2eTjGToKnOpmbPEQ6?=
 =?us-ascii?Q?BDiBtaGDnkuYo8D305oO6xE5tZn4vuN5ezDeAij1Jig+Bu9nfYnr6BTZEQug?=
 =?us-ascii?Q?cdFE/x20y9ElfwU9eLeLqG+ICoQTIkJQsbeqYBUXESA5zYlsv1pCA+meCGwq?=
 =?us-ascii?Q?JdN7ysaLul4/hvZYTVUSH4k+NBOovndQMwqEXAuwK4YzN8DJXO8YWBH9oU9O?=
 =?us-ascii?Q?Iz/zgY6MBVuLxueUcoa94Fj2Wl7benyjb++oCrv/SRB2GOEndvMh2Y3YG53z?=
 =?us-ascii?Q?5M/wjixgnq8FM5uTmv8NJoyF2iHSHwjIV0ywXhar1eEJchKYUAwOx7lFRSze?=
 =?us-ascii?Q?Hk+i8FZYJuUr6pmA7Kwot7N+YGwLeBhu4D+0YIIFUKn6YjiRFuGO+vfrwCg1?=
 =?us-ascii?Q?9A1LK6HurCvWnRoonv4NjcXRt7GjRBKK9s1uXsZdtC7MCcnmtNE9WarzOd/k?=
 =?us-ascii?Q?w6IWk61Mc66+qUWRxqSnjtHFL7Q0g4Nh7U8JxyYdkkdO+ILb639UZq1ALBO3?=
 =?us-ascii?Q?qEIDYu1vS8xonzDgf8HwCYu3+HXTWiW6oqRHbKwoFr0CXddW0KoDFtC/177T?=
 =?us-ascii?Q?Z2wTPcPxhJkJoE7dJtRgaubJu8YZtFxY8ZFiaggcMSNG3ANv9yK42Y8GeGE5?=
 =?us-ascii?Q?v5joOIGvh6O9SwbLDJHjlZYB4YBIMoQLfKc/DOgjqvuQpoMvsKKprMtiOezD?=
 =?us-ascii?Q?Vj9Ywe8gWH18dndMAbDAHG6UtQPRgNRZ4OMO3zpTVGfTcmbrEk7dt6qruKDr?=
 =?us-ascii?Q?hLBrFiWLl6DCsANM0XuOFfyILRw9WMurp44WyduwLcnO65i4/5JakObvohiZ?=
 =?us-ascii?Q?jynbyK6XKZl876OugORmmX/Frv53k0gS4uYhzD4IFJDyFaOzfosyMv3Lu53w?=
 =?us-ascii?Q?EqKMHLgKjiRAe0tioZdL1GZJJ7UIs3rzXFG34rMWorIhRYAURqcpSgE2NezX?=
 =?us-ascii?Q?4osum7D6Nx0Vk/eex2TWXmn5IocdTk23rXmyv+YY4nspl5bnXq1c4FqvU4dJ?=
 =?us-ascii?Q?tk3iLCSvPJH76rUYR5iT2Al3vzZszb8WCxICCvyB5S60pcsb7+zxGRMRb9b+?=
 =?us-ascii?Q?oKvD3hFWra3luhgG5rI/wWKXzQaTmvFqa6GkPXUFQQuGG/O52VAM8xa7Cg4W?=
 =?us-ascii?Q?1u1cNSpiSbs8aResJOtwov7FDzvTlHp+DDHiGgpDejZxXDv/ZXB0LuOUBB7H?=
 =?us-ascii?Q?GxYrc8yvHVtjAaIdXhT91XRdaz7CL33f4T6+tmeP8m/HX15d8KW/XbvfmKQ6?=
 =?us-ascii?Q?px6AML9VlXGhftE4wx72xcDi0tNQ8yOnQzNlkRGjsA1ncPreJHIP8WhGmr3I?=
 =?us-ascii?Q?kiY/jBvzRWmoW/IIlOcgmam6RXGABUx5PTzvUyOCNESdXP6KcdEcAfZ4I/SY?=
 =?us-ascii?Q?i8+cEm0uj3tl9Mwm/An0fiFVDjTRgHw/MOaydCqAs/DjeDJzncxq7YETOhyb?=
 =?us-ascii?Q?CVeT0/o+MOkcQFwtxZ9EGFoC2i5E/A0=3D?=
X-Exchange-RoutingPolicyChecked: 
	R4VGBudZCT21whAja0uTr9KVGxBK3qTLTy6wzWc9T9PEalZEq0d/21sllpjeiI558a76NpSAzTdPlDYDqtjBtBwRzjz/kc5cC4GYmXisRQr6AI+3ncLrb+zWZ4/44pSqjrzNLnky0E47StfFvhZhYa0f9B1DCY3d3yRiK/dD7cSmXuRMvyiv2x208mcxesbFKJm/oY6muadSa9Btpq2xT0YoNAAQKkTRLll8BNCN33OFEMsMThKWOxsUbqlmQyJCkeq/AiCzI7mGWZ6DpZvca0yO3S6Z35sQJSXSCgXER/7R1pW/mycWADQqGWGzQuNVBVgNq1dG6rcjxsFi7RjSTA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f64b9f2-b4e6-4bfe-c2c8-08df03bb6dd2
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF5EA507B64.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 21:46:04.7320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYWUWDFZx/Zizn6zAQuWcRorKE66B62qnV7ygCC9PyreYhglcYhKKW8i8nXZKGx0kc5gHqk7csQwiwqvMDtVzaRlJceQnzTDImOAkO6SdZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5028
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX/Ski40kJazIY
 nyHQSAXeG6gbKA2JJKqv90gyAt1AtyJ6jlaKLL9cwLX8ikflC3k9+3qHl7KI44IEJMxjTjq0251
 nNqQIG97awuVcSO9LdB1Mv1P0UQgDGTp5MfJTYgurLeHm3DlhmCC
X-Proofpoint-ORIG-GUID: 3ks9-Of4YBPm_Vp5-Tr4kOWX7br1i3Gw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX1j+vxHrV4f/k
 bG9s3KYtTRgu7nzJEnHUal+qyBC82ZH9L0b17shQs2rW6sPsnykulXR12aikYIEX+ixQD47U9mp
 XPLXvMI2hFglxOLtyGw17izIoNilkWIj/BilG4+LC1ZpIWNaraXtuWLVr6vLVdz34TDUStRy2xL
 XddwzE5zMMu79IBBvPWpVIYCfxHtTM10OIebBZK3EhXPV1GEMdBH8g3rdt8LZcAHX+FUjcbvqXm
 G6LaYohqoJ4Ac0vipEaQ7UNMMgcYZItm2N1Bxw+0OPJQIwhrvucTlUUS22kUB91mZordLCLz50c
 QC3qhInOKXvOV0JH5BLR6lkY5QGUwR0RTFBEiYaDlCOwlNxDg/MJ8uQb9Sc+nGkfbLFzCIlP+DH
 pz2DBdKaXs0OEXP2LB2/a7459anCw4+wICqYaltO779y9+V9kqSKyQxQMwoKGMe59VC7wZVupDb
 JWASXcK7LjZbYrebiWQ==
X-Proofpoint-GUID: -YBzXeOsHlVeXraErcISoV56rVCpLllE
X-Authority-Analysis: v=2.4 cv=RLiD2Yi+ c=1 sm=1 tr=0 ts=6a8f5ea0 cx=c_pps
 a=83jsKCSeZiZisq1MDa3xoA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=GMGn13PZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=Ia9td_k3mc_TV5fArrgA:9 a=2yX8oE26ukr_L8MB:21 a=O8hF6Hzn-FEA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=jIF0orF5dxDFSsn8Ms5I:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_06,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260182
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 21:46:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244424

* Add a tag to SRC_URI so that there will be errors when only change the
filename during upgrade it, as suggested by Alexander.

* Rebase the following patch:
  - 0001-Add-a-color-setting-for-mips64_n32-binaries.patch
  - 0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
  - 0001-Do-not-read-config-files-from-HOME.patch
  - 0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
  - 0001-When-cross-installing-execute-package-scriptlets-wit.patch
  - 0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
  - 0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch
  - 0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
  - 0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch
  - 0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch

* Updated
  0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
  Remove the changes for macros.in since it doesn't work for rpmbuild, rpmbuild
  is like cross build, will define the values in package_rpm.bbclass.

* Remove
  0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch, there
  are no such warnings in rpm 6.0.2.

* Remove backported patch
  0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch

* Add the following patches:
  - 0001-tools-elfdeps.cc-Remove-format-module.patch
    There is no format until gcc 13.1, so remove the format module to make it
    work on hosts such as Ubuntu 22.04.

  - 0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
    Fixed:
    GPG check FAILED

* Fix filter /usr/bin/pkg-config file dependency
  pkg-config is a build-time tool, not a runtime dependency. Filter the
  /usr/bin/pkg-config file dependency that RPM pkgconfig.attr
  auto-detects for packages with .pc files, preventing unnecessary
  hard dependencies in -dev packages.

* Add scdoc-native to DEPENDS to fix do_configure error for both native and
  target:
  Could not find SCDOC using the following names: scdoc

  Note, both target and native need scdoc-native, it is used for generating the
  manual, the man pages in *man/* are scdoc sources

* Add /etc/rpm to nativesdk-rpm to fix:
  ERROR: nativesdk-rpm-1_6.0.1-r0 do_package: QA Issue: nativesdk-rpm:
  Files/directories were installed but not shipped in any package:
  /etc
  /etc/rpm

* Add /etc/rpm to nativesdk-rpm to fix:

* Fix build with systemd, the rpm's sysuser creation doesn't work with
  cross build, and we don't need rpm to create the users since we have
  useradd.bbclass. The fix is:
  cmd = cmd + " --define '__sysusers_path %{nil}'"

  The error is:
  /var/tmp/rpm-tmp.U4iaJX: line 114: tr: command not found

* Make rpmbuild can find the pkgconfig (.pc) files in
  /usr/share/pkgconfig:
  cmd = cmd + " --define '_datadir ${datadir}'"

  The error is:
  - nothing provides pkgconfig(shared-mime-info) needed by libgdk-pixbuf-2.0-dev-2.44.5-r0.x86_6

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass       |  4 ++
 ...olor-setting-for-mips64_n32-binaries.patch | 22 ++++----
 ...akeLists.txt-Fix-checking-for-CFLAGS.patch | 46 -----------------
 ...et-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch | 50 -------------------
 ...satisfiable-dependency-when-building.patch | 18 ++++---
 ...lib-rpm-as-the-installation-path-for.patch | 24 +++------
 ...1-Do-not-read-config-files-from-HOME.patch | 18 ++++---
 ...-PATH-environment-variable-before-ru.patch | 16 +++---
 ...lling-execute-package-scriptlets-wit.patch | 12 +++--
 ...not-insert-payloadflags-into-.rpm-me.patch | 18 ++++---
 ....c-fix-file-conflicts-for-MIPS64-N32.patch | 18 ++++---
 ...kgverify_level-to-digest-as-RCPM-4.2.patch | 35 +++++++++++++
 ...ools-elfdeps.cc-Remove-format-module.patch | 38 ++++++++++++++
 ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch | 26 ++++++----
 ...avoid-using-GLOB_BRACE-if-undefined-.patch | 14 ++++--
 ...ge-logging-level-around-scriptlets-t.patch | 14 +++---
 .../rpm/{rpm_4.20.1.bb => rpm_6.0.2.bb}       | 14 +++---
 17 files changed, 199 insertions(+), 188 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-tools-elfdeps.cc-Remove-format-module.patch
 rename meta/recipes-devtools/rpm/{rpm_4.20.1.bb => rpm_6.0.2.bb} (96%)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 9af4cbdd94..51ad195baa 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -587,6 +587,7 @@ python do_package_rpm () {
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
     cmd = cmd + " --define '_lib ${BASELIB}'"
     cmd = cmd + " --define '_libdir ${libdir}'"
+    cmd = cmd + " --define '_datadir ${datadir}'"
     cmd = cmd + " --define '_builddir " + d.getVar('B') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
@@ -601,6 +602,7 @@ python do_package_rpm () {
     cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"
+    cmd = cmd + " --define '__sysusers_path %{nil}'"
     cmd = cmd + " --define '_use_weak_usergroup_deps 1'"
     cmd = cmd + " --define '_passwd_path " + "/completely/bogus/path" + "'"
     cmd = cmd + " --define '_group_path " + "/completely/bogus/path" + "'"
@@ -622,6 +624,8 @@ python do_package_rpm () {
 python () {
     if d.getVar('PACKAGES') != '':
         deps = ' rpm-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot'
+        # The pkgconfig-native is required by rpm's pkgconfigdeps.sh
+        deps += ' pkgconfig-native:do_populate_sysroot'
         d.appendVarFlag('do_package_write_rpm', 'depends', deps)
         d.setVarFlag('do_package_write_rpm', 'fakeroot', '1')
 
diff --git a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
index 769d7b3409..a808009058 100644
--- a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
@@ -5,16 +5,20 @@ Subject: [PATCH] Add a color setting for mips64_n32 binaries
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Rebased to 6.0.2
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
 ---
- build/rpmfc.c | 4 ++++
+ build/rpmfc.cc | 4 ++++
  rpmrc.in      | 2 ++
  2 files changed, 6 insertions(+)
 
-diff --git a/build/rpmfc.c b/build/rpmfc.c
-index 86dd36d14..df421a23f 100644
---- a/build/rpmfc.c
-+++ b/build/rpmfc.c
-@@ -716,6 +716,7 @@ static int rpmfcHelper(rpmfc fc, int *fnx, int nfn, const char *proto,
+diff --git a/build/rpmfc.cc b/build/rpmfc.cc
+index 833e56fa8..d50a3407f 100644
+--- a/build/rpmfc.cc
++++ b/build/rpmfc.cc
+@@ -690,6 +690,7 @@ static int rpmfcHelper(rpmfc fc, int *fnx, int nfn, const char *proto,
  static const struct rpmfcTokens_s rpmfcTokens[] = {
    { "directory",		RPMFC_INCLUDE },
  
@@ -22,7 +26,7 @@ index 86dd36d14..df421a23f 100644
    { "ELF 32-bit",		RPMFC_ELF32|RPMFC_INCLUDE },
    { "ELF 64-bit",		RPMFC_ELF64|RPMFC_INCLUDE },
  
-@@ -1258,6 +1259,9 @@ static uint32_t getElfColor(const char *fn)
+@@ -1191,6 +1192,9 @@ static uint32_t getElfColor(const char *fn)
  		color = 0;
  		break;
  	    }
@@ -33,10 +37,10 @@ index 86dd36d14..df421a23f 100644
  	if (elf)
  	    elf_end(elf);
 diff --git a/rpmrc.in b/rpmrc.in
-index 8646a966b..7349fdfd3 100644
+index 8fd0d7ee1..4cc52ceb3 100644
 --- a/rpmrc.in
 +++ b/rpmrc.in
-@@ -142,6 +142,8 @@ archcolor: mipsr6el 1
+@@ -152,6 +152,8 @@ archcolor: mipsr6el 1
  archcolor: mips64r6 2
  archcolor: mips64r6el 2
  
diff --git a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
deleted file mode 100644
index 412e1c146d..0000000000
--- a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From e14502834fe6a9c6c9a439401ac3d2c8fd979267 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Sun, 8 Jun 2025 00:36:38 -0700
-Subject: [PATCH] CMakeLists.txt: Improve checking for CFLAGS
-
-The previous log wasn't clear:
--- Performing Test found
--- Performing Test found - Success
--- Performing Test found
--- Performing Test found - Success
--- Performing Test found
--- Performing Test found - Failed
-
-Use a new var compiler-supports${flag} will make it more clear:
--- Performing Test compiler-supports-fno-strict-overflow
--- Performing Test compiler-supports-fno-strict-overflow - Success
--- Performing Test compiler-supports-fno-delete-null-pointer-checks
--- Performing Test compiler-supports-fno-delete-null-pointer-checks - Success
--- Performing Test compiler-supports-fhardened
--- Performing Test compiler-supports-fhardened - Failed
-
-Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/e14502834fe6a9c6c9a439401ac3d2c8fd979267]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- CMakeLists.txt | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 08e3e5274..f275c396b 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -416,11 +416,10 @@ endif()
- 
- # try to ensure some compiler sanity and hardening options where supported
- foreach (flag -fno-strict-overflow -fno-delete-null-pointer-checks -fhardened)
--	check_c_compiler_flag(${flag} found)
--	if (found)
-+	check_c_compiler_flag(${flag} compiler-supports${flag})
-+	if (compiler-supports${flag})
- 		add_compile_options(${flag})
- 	endif()
--	unset(found)
- endforeach()
- 
- # generated sources
diff --git a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
deleted file mode 100644
index 7db643871f..0000000000
--- a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From cb5355da9b47166253dbe5ab3215e433b55068d1 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Fri, 26 Jul 2024 17:18:30 +0800
-Subject: [PATCH] CMakeLists.txt: set libdir to ${CMAKE_INSTALL_FULL_LIBDIR} in
- macros
-
-There is a patch in oe-core[1] to avoid hardcoded paths in macros. It
-tries to use libdir to expand %_libdir in macros.in. However, in
-upstream commit[2], libdir for macros in CMakeLists.txt is set to
-${prefix}/=LIB=, which causes %_libdir to expand to ${prefix}/=LIB=
-instead of the correct path in the final macros.
-
-On target:
-$ rpm --showrc | grep _libdir
-[snip]
--13: _libdir    ${prefix}/=LIB=
-[snip]
-
-This also causes %__pkgconfig_path in fileattrs/pkgconfig.attr to become
-an invalid regular expression when building rpm packages. This results a
-warning in log.do_package_write_rpm in all packages:
-
-Warning: Ignoring invalid regular expression ^((${prefix}/=LIB=|usr/share)/pkgconfig/.*.pc|usr/bin/pkg-config)$
-
-Set libdir to ${CMAKE_INSTALL_FULL_LIBDIR} instead of ${prefix}/=LIB= to
-make sure it is expanded to the correct path in macros.
-
-[1] https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
-[2] https://github.com/rpm-software-management/rpm/commit/d2abb7a48760418aacd7f17c8b64e39c25ca50c9
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 08dabffd3..1b7661139 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -96,7 +96,7 @@ function(makemacros)
- 	set(sysconfdir "${CMAKE_INSTALL_FULL_SYSCONFDIR}")
- 	set(sharedstatedir "${CMAKE_INSTALL_FULL_SHAREDSTATEDIR}")
- 	set(localstatedir "${CMAKE_INSTALL_FULL_LOCALSTATEDIR}")
--	set(libdir "\${prefix}/=LIB=")
-+	set(libdir "${CMAKE_INSTALL_FULL_LIBDIR}")
- 	set(includedir "\${prefix}/${CMAKE_INSTALL_INCLUDEDIR}")
- 	set(oldincludedir "${CMAKE_INSTALL_FULL_OLDINCLUDEDIR}")
- 	set(infodir "\${prefix}/${CMAKE_INSTALL_INFODIR}")
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
index 96a5e14999..63a10df0d5 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
@@ -9,16 +9,20 @@ hand produces rpms that way by design.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Rebased to 6.0.2
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
 ---
- build/pack.c | 4 ----
+ build/pack.cc | 4 ----
  1 file changed, 4 deletions(-)
 
-diff --git a/build/pack.c b/build/pack.c
-index eb9c7b3f1..fb1f1bed8 100644
---- a/build/pack.c
-+++ b/build/pack.c
-@@ -712,10 +712,6 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
- 	headerPutBin(pkg->header, RPMTAG_SOURCEPKGID, spec->sourcePkgId,16);
+diff --git a/build/pack.cc b/build/pack.cc
+index 49c9d0a58..b1cda6d75 100644
+--- a/build/pack.cc
++++ b/build/pack.cc
+@@ -805,10 +805,6 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
+	headerPutBin(pkg->header, RPMTAG_SOURCESIGMD5, spec->sourcePkgId,16);
      }
  
 -    if (cheating) {
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
index 6a44f4f22d..309320cf43 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
@@ -6,10 +6,16 @@ Subject: [PATCH] Do not hardcode "lib/rpm" as the installation path for
 
 Upstream-Status: Denied [https://github.com/rpm-software-management/rpm/pull/263]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Updated for rpm 6.0.2:
+Remove the changes for macros.in since it doesn't work for rpmbuild, rpmbuild
+is like cross build, will define the values in package_rpm.bbclass.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
 ---
  CMakeLists.txt | 2 +-
- macros.in      | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
+ 1 files changed, 1 insertions(+), 1 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
 index de0b578a6..9a3aba071 100644
@@ -23,17 +29,3 @@ index de0b578a6..9a3aba071 100644
 +set(RPM_CONFIGDIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/rpm" CACHE PATH "rpm home")
  set(RPM_MACROSDIR "${RPM_CONFIGDIR}/macros.d")
  set(RPM_VENDOR "vendor" CACHE STRING "rpm vendor string")
- 
-diff --git a/macros.in b/macros.in
-index 4d3e8afdc..66e31320f 100644
---- a/macros.in
-+++ b/macros.in
-@@ -964,7 +964,7 @@ Supplements:   (%{name} = %{version}-%{release} and langpacks-%{1})\
- %_sharedstatedir	%{_var}/lib
- %_localstatedir		%{_prefix}/var
- %_lib			lib
--%_libdir		%{_exec_prefix}/%{_lib}
-+%_libdir		@libdir@
- %_includedir		%{_prefix}/include
- %_infodir		%{_datadir}/info
- %_mandir		%{_datadir}/man
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch
index bfc9a74b6c..ae47499e22 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch
@@ -5,15 +5,19 @@ Subject: [PATCH] Do not read config files from $HOME
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Rebased to 6.0.2
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
 ---
- lib/rpmrc.c | 6 ++----
+ lib/rpmrc.cc | 6 ++----
  1 file changed, 2 insertions(+), 4 deletions(-)
 
-diff --git a/lib/rpmrc.c b/lib/rpmrc.c
-index 5d778b8b7..dc8d42aeb 100644
---- a/lib/rpmrc.c
-+++ b/lib/rpmrc.c
-@@ -485,8 +485,7 @@ static void setDefaults(void)
+diff --git a/lib/rpmrc.cc b/lib/rpmrc.cc
+index 2b3baeddc..cea6f4bc5 100644
+--- a/lib/rpmrc.cc
++++ b/lib/rpmrc.cc
+@@ -390,8 +390,7 @@ static void setDefaults(void)
      if (!defrcfiles) {
  	defrcfiles = rstrscat(NULL, confdir, "/rpmrc", ":",
  				confdir, "/" RPM_VENDOR "/rpmrc", ":",
@@ -23,7 +27,7 @@ index 5d778b8b7..dc8d42aeb 100644
      }
  
      /* macrofiles may be pre-set from --macros */
-@@ -498,8 +497,7 @@ static void setDefaults(void)
+@@ -403,8 +402,7 @@ static void setDefaults(void)
  				confdir, "/" RPM_VENDOR "/macros", ":",
  				SYSCONFDIR "/rpm/macros.*", ":",
  				SYSCONFDIR "/rpm/macros", ":",
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
index d3263896ef..05c8b79f29 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
@@ -8,15 +8,19 @@ We add lots of native stuff into it and scriptlets rely on that.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Rebased to 6.0.2
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini<sumanth.gavini@windriver.com>
 ---
- lib/rpmscript.c | 2 +-
+ lib/rpmscript.cc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/lib/rpmscript.c b/lib/rpmscript.c
-index 060fd8124..4dc6466a8 100644
---- a/lib/rpmscript.c
-+++ b/lib/rpmscript.c
-@@ -251,7 +251,7 @@ static void doScriptExec(ARGV_const_t argv, ARGV_const_t prefixes,
+diff --git a/lib/rpmscript.cc b/lib/rpmscript.cc
+index b75a62085..2d7a4c889 100644
+--- a/lib/rpmscript.cc
++++ b/lib/rpmscript.cc
+@@ -260,7 +260,7 @@ static void doScriptExec(ARGV_const_t argv, ARGV_const_t prefixes,
  	if (ipath && ipath[5] != '%')
  	    path = ipath;
  
diff --git a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
index b71156fe12..90f5322573 100644
--- a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
+++ b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
@@ -26,15 +26,17 @@ Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 Rebased to 4.20.1
+Rebased to 6.0.2
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
 ---
- lib/rpmscript.c | 9 +++++++--
+ lib/rpmscript.cc | 9 +++++++--
  1 file changed, 7 insertions(+), 2 deletions(-)
 
-diff --git a/lib/rpmscript.c b/lib/rpmscript.c
-index eb14870b3..1785e8f30 100644
---- a/lib/rpmscript.c
-+++ b/lib/rpmscript.c
+diff --git a/lib/rpmscript.cc b/lib/rpmscript.cc
+index b75a62085..7d667b7f5 100644
+--- a/lib/rpmscript.cc
++++ b/lib/rpmscript.cc
 @@ -456,8 +456,7 @@ exit:
  	Fclose(out);	/* XXX dup'd STDOUT_FILENO */
  
diff --git a/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch b/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
index 0c29e5543a..fe4e029830 100644
--- a/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
+++ b/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
@@ -1,7 +1,7 @@
 From e688eb54fd54d65181e94b854b3568d99cbf3a24 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 31 Aug 2021 10:37:05 +0200
-Subject: [PATCH] build/pack.c: do not insert payloadflags into .rpm metadata
+Subject: [PATCH] build/pack.cc: do not insert payloadflags into .rpm metadata
 
 The flags look like '19T56' where 19 is the compression level
 (deterministic), and 56 is the amount of threads (varies from one
@@ -9,15 +9,19 @@ host to the next and breaks reproducibility for .rpm).
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
+Rebased to 6.0.2
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
 ---
- build/pack.c | 2 +-
+ build/pack.cc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/build/pack.c b/build/pack.c
-index fb1f1bed8..45885a6ac 100644
---- a/build/pack.c
-+++ b/build/pack.c
-@@ -330,7 +330,7 @@ static char *getIOFlags(Package pkg)
+diff --git a/build/pack.cc b/build/pack.cc
+index b1cda6d75..1425d27ba 100644
+--- a/build/pack.cc
++++ b/build/pack.cc
+@@ -338,7 +338,7 @@ static char *getIOFlags(Package pkg)
  	    headerPutString(pkg->header, RPMTAG_PAYLOADCOMPRESSOR, compr);
  	buf = xstrdup(rpmio_flags);
  	buf[s - rpmio_flags] = '\0';
diff --git a/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch b/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch
index 7d443ccc6c..5dc059493c 100644
--- a/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch
+++ b/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch
@@ -1,7 +1,7 @@
 From ad530868e37f09e9236c085d25a834304750704b Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 7 May 2020 17:40:58 +0800
-Subject: [PATCH] lib/transaction.c: fix file conflicts for MIPS64 N32
+Subject: [PATCH] lib/transaction.cc: fix file conflicts for MIPS64 N32
 
 This patch is from:
 https://github.com/rpm-software-management/rpm/issues/193
@@ -27,15 +27,19 @@ Fixed by performing a 'last-in-wins' resolution when "neither is preferred".
 Upstream-Status: Submitted <https://github.com/rpm-software-management/rpm/issues/193>
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Rebased to 6.0.2
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
 ---
- lib/transaction.c | 13 ++++++++++++-
+ lib/transaction.cc | 13 ++++++++++++-
  1 file changed, 12 insertions(+), 1 deletion(-)
 
-diff --git a/lib/transaction.c b/lib/transaction.c
-index 5e4414d2a..b1c55bd44 100644
---- a/lib/transaction.c
-+++ b/lib/transaction.c
-@@ -400,7 +400,18 @@ static int handleColorConflict(rpmts ts,
+diff --git a/lib/transaction.cc b/lib/transaction.cc
+index de7cdabb2..697268733 100644
+--- a/lib/transaction.cc
++++ b/lib/transaction.cc
+@@ -375,7 +375,18 @@ static int handleColorConflict(rpmts ts,
  		    rpmfsSetAction(ofs, ofx, FA_CREATE);
  		rpmfsSetAction(fs, fx, FA_SKIPCOLOR);
  		rConflicts = 0;
diff --git a/meta/recipes-devtools/rpm/files/0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch b/meta/recipes-devtools/rpm/files/0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
new file mode 100644
index 0000000000..500a667a1b
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
@@ -0,0 +1,35 @@
+From 1cb53934b83b794c319813106c9f12d75cce66d2 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sun, 18 Jan 2026 19:24:42 -0800
+Subject: [PATCH] macros.in: Set _pkgverify_level to digest as RPM 4.20.1
+
+Fixed:
+$ bitbake core-image-minimal
+Package bash-5.3-r0.16.x86_64_v3.rpm is not signed
+GPG check FAILED
+
+Set _pkgverify_level to digest as RPM 4.20.1 can fix the problem.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ macros.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/macros.in b/macros.in
+index 38066f00c..7fe00ad09 100644
+--- a/macros.in
++++ b/macros.in
+@@ -680,7 +680,7 @@ Supplements:   (%{name} = %{version}-%{release} and langpacks-%{1})\
+ # signature	require valid signature(s)
+ # digest	require valid digest(s)
+ # none		traditional rpm behavior, nothing required
+-%_pkgverify_level all
++%_pkgverify_level digest
+ 
+ # Disabler flags for package verification (similar to vsflags)
+ # Set to 0x0 for full compatibility with v4 packages.
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/rpm/files/0001-tools-elfdeps.cc-Remove-format-module.patch b/meta/recipes-devtools/rpm/files/0001-tools-elfdeps.cc-Remove-format-module.patch
new file mode 100644
index 0000000000..25f5496bde
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-tools-elfdeps.cc-Remove-format-module.patch
@@ -0,0 +1,38 @@
+From 3536ef6bb74144cf9dce10200cd62c2ad9f7cae4 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 15 Jan 2026 19:36:17 -0800
+Subject: [PATCH] tools/elfdeps.cc: Remove format module
+
+There is no format until gcc 13.1, so remove the format module to make it work
+on hosts such as Ubuntu 22.04.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ tools/elfdeps.cc | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/tools/elfdeps.cc b/tools/elfdeps.cc
+index 17884b24e..33ff8d740 100644
+--- a/tools/elfdeps.cc
++++ b/tools/elfdeps.cc
+@@ -1,6 +1,5 @@
+ #include "system.h"
+ 
+-#include <format>
+ #include <string>
+ #include <vector>
+ 
+@@ -105,7 +104,7 @@ static void addSoDep(std::vector<std::string> & deps,
+     if (ver.empty() && marker.empty()) {
+ 	addDep(deps, soname);
+     } else {
+-	auto dep = std::format("{}({}){}", soname, ver, marker);
++	std::string dep = soname + "(" + ver + ")" + marker;
+ 	addDep(deps, dep);
+     }
+ }
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch b/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
index 082fb343c2..1004253ff8 100644
--- a/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
+++ b/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
@@ -9,15 +9,19 @@ from target rootfs instead of its own native sysroot.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Rebased to 6.0.2
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
 ---
- lib/rpmrc.c | 18 +++++++++++++-----
+ lib/rpmrc.cc | 18 +++++++++++++-----
  1 file changed, 13 insertions(+), 5 deletions(-)
 
-diff --git a/lib/rpmrc.c b/lib/rpmrc.c
-index dc8d42aeb..3f2996850 100644
---- a/lib/rpmrc.c
-+++ b/lib/rpmrc.c
-@@ -481,11 +481,14 @@ static void setDefaults(void)
+diff --git a/lib/rpmrc.cc b/lib/rpmrc.cc
+index cea6f4bc5..e6cf21e1b 100644
+--- a/lib/rpmrc.cc
++++ b/lib/rpmrc.cc
+@@ -386,11 +386,14 @@ static void setDefaults(void)
  	    userrc = xstrdup(oldrc);
  	}
      }
@@ -33,7 +37,7 @@ index dc8d42aeb..3f2996850 100644
      }
  
      /* macrofiles may be pre-set from --macros */
-@@ -495,9 +498,9 @@ static void setDefaults(void)
+@@ -400,9 +403,9 @@ static void setDefaults(void)
  				confdir, "/platform/%{_target}/macros", ":",
  				confdir, "/fileattrs/*.attr", ":",
  				confdir, "/" RPM_VENDOR "/macros", ":",
@@ -46,7 +50,7 @@ index dc8d42aeb..3f2996850 100644
      }
  
      free(usermacros);
-@@ -1142,7 +1145,11 @@ static void read_auxv(void)
+@@ -1048,7 +1051,11 @@ static void read_auxv(void)
   */
  static void defaultMachine(rpmrcCtx ctx, const char ** arch, const char ** os)
  {
@@ -55,11 +59,11 @@ index dc8d42aeb..3f2996850 100644
 +    if (etcconfdir == NULL)
 +        etcconfdir = "";
 +
-+    const char * const platform_path = rstrscat(NULL, etcconfdir, SYSCONFDIR "/rpm/platform", NULL);
++    char * const platform_path = rstrscat(NULL, etcconfdir, SYSCONFDIR "/rpm/platform", NULL);
      static struct utsname un;
      char * chptr;
-     canonEntry canon;
-@@ -1462,6 +1469,7 @@ static void defaultMachine(rpmrcCtx ctx, const char ** arch, const char ** os)
+     int rc;
+@@ -1378,6 +1385,7 @@ static void defaultMachine(rpmrcCtx ctx, const char ** arch, const char ** os)
  
      if (arch) *arch = un.machine;
      if (os) *os = un.sysname;
diff --git a/meta/recipes-devtools/rpm/files/0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch b/meta/recipes-devtools/rpm/files/0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch
index 00fe19108e..59855466da 100644
--- a/meta/recipes-devtools/rpm/files/0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch
+++ b/meta/recipes-devtools/rpm/files/0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch
@@ -1,7 +1,7 @@
 From d8972ff7fa0a30e199144ba135223bf561874e01 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 16 Jan 2024 09:59:26 +0100
-Subject: [PATCH] rpmio/rpmglob.c: avoid using GLOB_BRACE if undefined by C
+Subject: [PATCH] rpmio/rpmglob.cc: avoid using GLOB_BRACE if undefined by C
  library
 
 This addresses musl failures; if there is code out there relying on
@@ -11,14 +11,18 @@ This is unlikely to be trivially fixable upstream.
 
 Upstream-Status: Inappropriate [reported at https://github.com/rpm-software-management/rpm/issues/2844]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
+Rebased to 6.0.2
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
 ---
- rpmio/rpmglob.c | 6 ++++++
+ rpmio/rpmglob.cc | 6 ++++++
  1 file changed, 6 insertions(+)
 
-diff --git a/rpmio/rpmglob.c b/rpmio/rpmglob.c
+diff --git a/rpmio/rpmglob.cc b/rpmio/rpmglob.cc
 index eb439cad8..1eef0b851 100644
---- a/rpmio/rpmglob.c
-+++ b/rpmio/rpmglob.c
+--- a/rpmio/rpmglob.cc
++++ b/rpmio/rpmglob.cc
 @@ -33,6 +33,12 @@
  
  #include "debug.h"
diff --git a/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch b/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch
index bac2d6331c..84f909c68b 100644
--- a/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch
+++ b/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch
@@ -1,7 +1,7 @@
 From 452b696ea3e1975ea30cf7a92678aa4b316e6300 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 10 Jan 2019 18:14:18 +0100
-Subject: [PATCH] rpmscript.c: change logging level around scriptlets to INFO
+Subject: [PATCH] rpmscript.cc: change logging level around scriptlets to INFO
  from DEBUG
 
 That way we can debug scriptlet failures without writing lots of
@@ -11,15 +11,17 @@ Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 Rebased to 4.20.1
+Rebased to 6.0.2
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
 ---
- lib/rpmscript.c | 8 ++++----
+ lib/rpmscript.cc | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
-diff --git a/lib/rpmscript.c b/lib/rpmscript.c
-index e9f288ae0..f0c628708 100644
---- a/lib/rpmscript.c
-+++ b/lib/rpmscript.c
+diff --git a/lib/rpmscript.cc b/lib/rpmscript.cc
+index fe5fc9138..861fd8ca8 100644
+--- a/lib/rpmscript.cc
++++ b/lib/rpmscript.cc
 @@ -299,7 +299,7 @@ static char * writeScript(const char *cmd, const char *script)
      if (Ferror(fd))
  	goto exit;
diff --git a/meta/recipes-devtools/rpm/rpm_4.20.1.bb b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
similarity index 96%
rename from meta/recipes-devtools/rpm/rpm_4.20.1.bb
rename to meta/recipes-devtools/rpm/rpm_6.0.2.bb
index 17e75c3e14..e8977aa31a 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
@@ -24,7 +24,7 @@ HOMEPAGE = "http://www.rpm.org"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=066ecde17828e5c8911ec9eae8be78f4"
 
-SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.20.x;protocol=https \
+SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-6.0.x;protocol=https \
            file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
            file://0001-Do-not-read-config-files-from-HOME.patch \
            file://0001-When-cross-installing-execute-package-scriptlets-wit.patch \
@@ -37,14 +37,14 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.20.x;protoc
            file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch \
            file://0001-CMakeLists.txt-look-for-lua-with-pkg-config-rather-t.patch \
            file://0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch \
-           file://0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch \
-           file://0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch \
+           file://0001-tools-elfdeps.cc-Remove-format-module.patch \
+           file://0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch \
            "
 
 PE = "1"
-SRCREV = "c8dc5ea575a2e9c1488036d12f4b75f6a5a49120"
+SRCREV = "a7f89afb57a98f6419d0eff35ca792198293b682"
 
-DEPENDS = "lua libgcrypt file popt xz bzip2 elfutils python3 sqlite3 zstd"
+DEPENDS = "lua libgcrypt file popt xz bzip2 elfutils python3 sqlite3 zstd scdoc-native"
 DEPENDS:append:class-native = " file-replacement-native bzip2-replacement-native"
 
 EXTRA_OECMAKE:append = " -D__CURL:FILEPATH=curl"
@@ -154,7 +154,8 @@ do_install:append () {
 
 FILES:${PN} += "${libdir}/rpm-plugins/*.so \
                "
-FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/rpm.sh"
+FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/rpm.sh \
+    /etc/rpm"
 
 FILES:${PN}-dev += "${libdir}/rpm-plugins/*.la \
                     "
@@ -181,6 +182,7 @@ FILES:${PN}-build = "\
     ${libdir}/rpm/mkinstalldirs \
     ${libdir}/rpm/macros.p* \
     ${libdir}/rpm/fileattrs/* \
+    ${libdir}/rpm/rpm-setup-autosign \
 "
 
 FILES:${PN}-sign = "\

