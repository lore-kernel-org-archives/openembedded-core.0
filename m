Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F41C54F54
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 06:03:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32645.1771567388314086499
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 22:03:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OZfqiTtj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6511fe63f5=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5XM8s2005603
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 22:03:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=3rFFkHDnz
	F4l9i6N3cZ1U36jKmu5I+kj6YW2oI1bCNk=; b=OZfqiTtjw4SlxtXi91lWD7j8Y
	y56DjGnTxfBaRyLwQHMYMNBfr3hTBp8FuGKjl5P3vGm2IaGF1YX3CT4wrzkI4bqQ
	3UQj8x6oAwEu9/mAwAIEIKDhNl9rvtbVYvO1GZY20r5D2ore03GUoswzkvMTqlWv
	WDLgZGqGRBCI48+zAfZZOQTMA0Z7ZDKNjGgKQ3xS+fIRZ3zv7BSREiKHCyAHxe+E
	qEnDGDcg75j1UL6hdArkCqW9guZfJ9y6Qal7UJoYAkBdD/rpNeRXFLf/uCTLOby8
	V/46SHpBgy7X5TDIs94H1kIlpgbXLlakdSavBXpGqjUStJUyW9vn/ephwZ4YA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010034.outbound.protection.outlook.com [52.101.56.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cdtuahb5r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 22:03:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qEd9GtakQ2hQF6uFPBKs+lDx5WbFx/1PSOW6FFRgy665PhPJweIGJD3tLBOzrogAn6ximy6Nu3Z0alf/kwOfeCHK0fyGACjJUrEm7Z8zYL78fpeALkqFoH5YUN+hSqqoJSR0lVbCEBu0KTezhEiBha11gzdK8DNjEwFfvDBBb/Viwb7+Z2NDSBE0HMKNlyD1/MHSRMM1x+5VA83z5EcJYF1lYIaiRDKFQCse+s4CPQwgsV4wAZHV8acNVkgqradIsw86IFLSwENEA+F+B2FtrUqgLpEl/3BGimpLu5F9hsVbWXySiEo43+3LLdb56isXJvaj4JmTJP8S8j1l43udWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rFFkHDnzF4l9i6N3cZ1U36jKmu5I+kj6YW2oI1bCNk=;
 b=rL5jz3XHOxipqMLsH2oyyD5xg4TgSkJjxrQAa1xrqod7vVMkbK1cs6D3yholoWwzUoxfQ0WzR+uW4wPeTSsSvBrnoQBaAsJhBpkRoFFUoHtLgY2Xi09cAPDqFflSNxwUTmot9CW9YrcddMZbG/SCfdUqBpWAJXk+W/ZVkH+mrQVi1qy8XExDYHZd0IMHmraYBKEnek2GUjqZtEHyHQgDxrgO99mVtwgx6LrZNqtYcVtoNWP9oumAekygXVumIS91Xl5tS8TliO3OCfyhDXowKWiT9MOoiRd+/FYwozYGNGlFdmR6PXMBKDzflOEKl/mdslQP4YRtp+e5RfUofuNrNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by SJ5PPF8622363CD.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::83c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Fri, 20 Feb
 2026 06:03:05 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 06:03:05 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com,
        Randy.MacLeod@windriver.com
Subject: [PATCH 0/4] Oe-selftest for Clang, LLVM, LLD
Date: Thu, 19 Feb 2026 22:02:48 -0800
Message-ID: <20260220060252.77248-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0048.namprd17.prod.outlook.com
 (2603:10b6:a03:167::25) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|SJ5PPF8622363CD:EE_
X-MS-Office365-Filtering-Correlation-Id: c1c396ac-7965-4760-8895-08de7045b668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?//X3qmmAE3wegqnzzBp92h6HcifkK3tyrOBVgG1e35QJXuwLO7cX4+Mpu69T?=
 =?us-ascii?Q?NxA6d8F9hDCAuiwGyqdm13R01ot0+zv8WZYnh8MdirYQsoMCnXK99tdePQwv?=
 =?us-ascii?Q?JrKHHj2+1fAK2PZ1RAZcMYjQzkKgCzAK481m/iaN+p9r/cSBxpcpAaEjQov9?=
 =?us-ascii?Q?0XWYdPmgIyvcv31vvqsIl3ZXWVYeBjsaRxSwpBwakkH9phckoIn/N8MXkgTO?=
 =?us-ascii?Q?1jVUji/4ttpDPhnYH+CdTE0ONG17WRXm2e6KQCF/1cZoRGK2ygmP3WM04k2N?=
 =?us-ascii?Q?fF/BvzzBdJoNRcxJGaDPkSbG0YgMyLbntW5bXMRaK96EfK0a/XIXqaIhNpig?=
 =?us-ascii?Q?SwurkmrvZMZdiM3sKMiMuS2SKPLbtUsKzfOoGIPnr2Ho3uLzq8vYNDIHfPcZ?=
 =?us-ascii?Q?fFMOldkkgNBDqxpqxgQ8fI34LwOB+yJJfhBl3wEl9cRBn6t1B0Talmdb9nhy?=
 =?us-ascii?Q?pEmfCTFzbu89J6tWbVhtcpHB0vSkc96Ba41AaEv1PjRHpBwUZBq/9ZB9dDcZ?=
 =?us-ascii?Q?v9E4q5jpalVR7fM1AsyoDruJC8jv6U70p/J+bHKAoagPIvwG1VUwIvmcpGKU?=
 =?us-ascii?Q?eamA6LzFH6cu5AezajY8Iw32bWp1k9XRaOmBKB6pcZq4C0PqUmMnnCvkFBLO?=
 =?us-ascii?Q?adqJxTdWtd+/0AzXIVQgCjXJ8TOcKtluPm5p3tOFzYSLkxswXz8CmUAkaHxt?=
 =?us-ascii?Q?OC3nPJa9YX/W0wnqriiSbbmOevHc59HUDDvFdroeXzrDG9+/H8zGmXJIfRxq?=
 =?us-ascii?Q?EADc3c+XLXfyZl53gckDY77bng3fLmNczTEwDwFxHEyZTitUe7qXu4EBj/bY?=
 =?us-ascii?Q?7/rwKQ3VW5+OLXwVV7J26ZynpvONOYTF+iooKij0rHtknIbYOx+lMA4E9x1I?=
 =?us-ascii?Q?f2SwY3l5p5kVWupchpdSNlToUqoE6f92i1vDVREMDxkaXU+vl+ZXYXnIqoyn?=
 =?us-ascii?Q?5oKGZkAfsgew1jHPjfWCTRojdM8o27EwSXr9ZlHJ9lqKNnw+/Jk0e7XtjBxd?=
 =?us-ascii?Q?9eksamGVpBwRLqUCpKEGZ1vH9CUObM21uqVpUNUiomtOuBLOwS+/rGwa5pMu?=
 =?us-ascii?Q?5LKNxN5U3RuqhIK0JYP2V/+AWhyDPjxJqor2MsPpqUnc0jsuqI03fykZoiQU?=
 =?us-ascii?Q?LFiQ//nqOhx1I66BzF5oZajKEGJgQ8B5oy5bf4D3XrSxySk39DQ2ykmFV3dd?=
 =?us-ascii?Q?a0rQlOjDYc2HrTfFHw9AiODKwlezPoggflLIUmV11VFlQ9Zx3dAVDu5Aeo8V?=
 =?us-ascii?Q?qjG8U/6vlhat2siR8/Gmqg8uryzmYHsOhd1vKZ7h9wdIhrX72lbZ0UTVjlBk?=
 =?us-ascii?Q?tTIjKB/DboLrik2koPkR9vTWEcEbuvC7Y4iho72Bid/BIR1kN5aKORFpHw3F?=
 =?us-ascii?Q?ugaa3RkPIkmf/gW/mxu0uL8lxXWEa23c68V6KDrMbmXUTwnFnXxG31GmPpgZ?=
 =?us-ascii?Q?Gutby+FjNazCAt7LODRvcKN9Hy0dowNqVi0McxSQ6jJ2ZlVXc7/HXd7zRcxd?=
 =?us-ascii?Q?i8VV1BSaAWCxj2Cykl3WgaNvYpR0kwxqV5sonoyphuRP7aOuHPzzAxvAYrDW?=
 =?us-ascii?Q?F4RjyfW0VPP+czf00a7eivkjSz/yGLPQn0KNzYoVQQ8IuZco1JvltjTb69cd?=
 =?us-ascii?Q?6F5eoG1qa9Q1cF8m067gL/4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/gNxN0+18ZaDMTR318KR9Qi3hVgiOsGY630IOe27ww4guZRVoJ2xv+12edGx?=
 =?us-ascii?Q?1HFqtlDnMDDtNXmYZTdzRBWzI5zd21+2nh6Oko7ujP/S8NrqbZA4ya1U85Ue?=
 =?us-ascii?Q?9H3St1d5dpuTNcsYOSwQRfC0g7T360W6i5Xup5dgeUOT8JqMqOOTQ2EXosYJ?=
 =?us-ascii?Q?/gfW36YhNhACLU5wOHZAQgocJxDMRB92NpkZEBai3+MU9QqwoNk5jU9rksFx?=
 =?us-ascii?Q?sEfS8m9urQat6X9KexaTVLaAZj1djF2kyd6WulgvfgDj9c4vx3eDQbKz9Cuo?=
 =?us-ascii?Q?vAjRP1WlNiL3jwBfMhYmUW+AT9PBOfZjqpEC0qf5DdJ8bjeGFRzmP4GcoY57?=
 =?us-ascii?Q?G3NTnN77U3bMuoCZy6jG41yTsdmZ09LV6OCOA3QZzTql9xDCkbk7Kl2iEdbF?=
 =?us-ascii?Q?XMDrvY2K5mjaKtqiu/t2t7LEQ1ZMSX0BBwT7CmCzn4g9JGOGn8ub6FbxHUNV?=
 =?us-ascii?Q?gcJOYROi0i8/Jc6y3aAF6xEvs2Gj7G8RTtq4wu+4nPey3Ywxa44sHCRglpWq?=
 =?us-ascii?Q?4u9wU9Qg0zgAqroxV1PMKjHWpTOzZ9flQkTUMY+STw0gOpixO9MpuDlP0qSr?=
 =?us-ascii?Q?1BNvJFC9D0n/DOaOaLtzc+TqiypoM96hzvG51sHrQAfud2yawevcB37J/TuF?=
 =?us-ascii?Q?OKoXQqtR2SH+Tbzde1I8mH/O6OWqt7wCC2eSRdZj0FDt5khn4yPbUX/qfJWz?=
 =?us-ascii?Q?fnROkv94P9iWIzjigNs0yekXjyP7dGj3J3Ib6wpcR+SWSXsOJOn0L8x2X2kf?=
 =?us-ascii?Q?E4DMvjHmUAQY3FvEbKGEIfxPpLNbUsEWbUA/HlROvTHpeQxV4tDMgdyWUyjP?=
 =?us-ascii?Q?sfWee9v1luiy5+2DY5LjGino4+dIZEFSYrxTNmfzwRSUm/jAD7HEwcaWKDKc?=
 =?us-ascii?Q?BTBrDuvbDA1ttmh8olRD7ByIc0B+EwZ1vApY6N5F2c1Np16NaM+XXIAE/Y+q?=
 =?us-ascii?Q?hjTpRzJBp5xrVmFFvIX0m3VvoIm/tIXR9jml1tToGJlzPk67Zv2GUmd05rwa?=
 =?us-ascii?Q?y7uAZi8Jh9pptOvK0Z85v5Awz7NbJMl39a8+2xX59X1TeReZGdVGlCh4isFK?=
 =?us-ascii?Q?tUwwWT6NoAOwyIfmR7qJqPNOOAXEaZqkemVBs6JAeMg0JQTUmuKrfmuVIPBI?=
 =?us-ascii?Q?k8xm47jEVMAr5TiIQP9MlxNf8arFgb9ARdFy98MxL/A2mcwpnQje1DA9m9X4?=
 =?us-ascii?Q?vvr7cPdDr8uF5x8ViAglXxwgzp7p9IleMx2JU6/iwwUBXHAirKIs1n4fVafP?=
 =?us-ascii?Q?OCxfCE7a7Wi+aT6hLAJKU9LrSNngahALXG1ZQn3QVyQ3bdccF+oO6UiSMH70?=
 =?us-ascii?Q?5Iy3Qtor8HTu9a2NzmIuW3iceMYU8hJip8k1/+HUyyo+r7XGf+9m71gzhNpK?=
 =?us-ascii?Q?p/u17CDeH3oUJZHJYAlZMW5NJGWfByaCBynjE1F5G2FyaEzewyNqq5b+xI/h?=
 =?us-ascii?Q?Ct5QM6BNuOnbZbhmCMdGqVHos6O+/D2UBHIiuL1h/vlAKVtq7qJIXpbTXkx4?=
 =?us-ascii?Q?LJoJgc94k/v27H8krc+Hyd5o2RIG0guijBN2PbqHxH3DZcGaf5/ASAGwMz1k?=
 =?us-ascii?Q?/NPOQMtltP09lm1dQ7nE1khga0HCwIvmk9NOwW0TAXPnMpsWw8PBaX7wXtYM?=
 =?us-ascii?Q?cnw0foMrBmzwRiYZ1lxuslB+eoaCBrIVhaFhXiKa4UGbBLZ2OmKxorndUWE7?=
 =?us-ascii?Q?kagIH7RryZpyZ3sWp+KYvnvI74FzxPNFh+s4BUST19x0W0yl7rL/XnvufAb3?=
 =?us-ascii?Q?9zKey2vhKpGk7dd5jMx9F0Fl91eo35IDpbgb2zgytlNqbrfknPuG?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c396ac-7965-4760-8895-08de7045b668
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 06:03:05.0058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qD6d9w/xjK3UyhCLYboI5iMEJMLvouYAXrRXI4BOHm6OHwJ6sIpt8pspErdnDTMK/UiC8dqhbUvVzcL/8UHz/Z60EIx7FjFyZgxu0pK/XOJ045a4UhFToYxqqeIvexyP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8622363CD
X-Authority-Analysis: v=2.4 cv=OqxCCi/t c=1 sm=1 tr=0 ts=6997f91b cx=c_pps
 a=KX2Ufr5/9I0VBrHrQzOW6Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=Iw9vVKA9f4cq7aJr2KwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: W1MwH_Kw8u1uqrWZY9i2GKBCr1ht4Nuc
X-Proofpoint-ORIG-GUID: W1MwH_Kw8u1uqrWZY9i2GKBCr1ht4Nuc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA1MSBTYWx0ZWRfX1XBNTU/yxHPf
 /b1gUPh0vz6DaUtdg2ia6bwIf11KT1mehmxfqdgJCSwKe7KIRK5cvWqC/Sofnu1P8GTZgr/arGC
 ylUh2wpSeqL7SLfB+rF1KuI4A08+eBPrMbZINSDkrofYgkYTTAA3pI+wN4+rCNHMXAffnAptqvU
 XNhtNkgCsFfkf/S67dWbVMDM0za3A7Jl8hrZ2Tl6t3jWyAtvma4cG7qtTo8bfRwoqKWmu5VF9i1
 o0wJ+SD9zoJ9VLiA841sqRguPJdKbX9d4lxNL3KAYXE6v1U3FTAL1MpCFk0nxEJdYvufwUK7X2o
 DDpTEhrQYK3VDrsvAS5mR/JlvXYFKXZeDwVsBPbp5d1MsjAZc64yCbHWVZFf/HsHOFrtPECjMB9
 zdDxPSTwIOyuYdrEme7UzlXPYrm448qvTUDdbqxHzn4skMkV9erk34XSfbYTWLYKGE6k1AN44GJ
 CNM7bkul5H0ds1o+qdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602200051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 06:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231488

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

This patch series introduces a test framework to run selftests for
target builds of Clang, LLVM, and LLD.

Summary of changes:
-Patch 1: Disable clang-tools-extra tests, as Clang's CMake cannot
          detect the llvm-bcanalyzer target.
-Patch 2: Enabled the necessary CMake flags for clang, llvm & lld tests
-Patch 3: Selftest script for Clang, LLVM, and LLD including exclude list
-Patch 4: Fix rust build failure by replacing target llvm-config with native

Testing:
1. The test suite has been successfully validated on x86-64, arm64, riscv64
and arm32 for all Clang, LLD & LLVM components.
2. Clang and LLD tests passed successfully on x86. LLVM tests are skipped
on x86 since it's broken. A follow-up bug will be filed and addressed.
3. Clang, LLVM & LLD all together ~80K tests are there and we currently
~250 tests to exclude list which are failing (0.32%).

Impact on build time:
These builds were executed in a controlled environment without poky-sstate
enabled.

Default(without changes):
|  Target   | Run 1      | Run 2      | Run 3      |    Average     |
| --------- | ---------- | ---------- | ---------- | -------------- |
|   llvm    | 22m18.441s | 22m31.905s | 22m23.718s |   22m24.688s   |
|   clang   | 30m09.774s | 30m22.680s | 30m15.312s |   30m15.922s   |
|   lld     | 1m26.994s  | 1m30.415s  | 1m29.006s  |   1m28.805s    |

With the testsuite changes applied:
|  Target   | Run 1      | Run 2      | Run 3      |    Average     |
| --------- | ---------- | ---------- | ---------- | -------------- |
|   llvm    | 23m32.104s | 23m45.887s | 23m38.157s |   23m38.716s   |
|   clang   | 30m31.402s | 30m46.198s | 30m39.445s |   30m39.015s   |
|   lld     | 1m29.845s  | 1m34.212s  | 1m31.925s  |   1m31.994s    |

Comparison:
|  Target   | Default Avg | With Changes Avg |     **Diff**     |
| --------- | ----------- | ---------------- | ---------------- |
|   llvm    | 22m24.688s  | 23m38.716s       |   +1m14.028s     |
|   clang   | 30m15.922s  | 30m39.015s       |   +0m23.093s     |
|   lld     | 1m28.805s   | 1m31.994s        |   +0m3.189s      |

Impact on tmpdir size:
| Metric                               | Size  |
| ------------------------------------ | ----- |
| Default target `tmpdir` size         | 74 GB |
| Target `tmpdir` size (after changes) | 79 GB |
| Difference                           | +5 GB |

Deepesh Varatharajan (4):
  clang-tools-extra: disable tests
  clang: Enable cmake flags for llvm, clang, lld tests
  oeqa/selftest/clang: Add oe-seltests for Clang/LLVM/LLD
  rust: Fix rust build failure

 meta/lib/oeqa/selftest/cases/clang.py         | 298 ++++++++++++++++++
 .../0042-guard-clang-tools-extra-test.patch   |  74 +++++
 meta/recipes-devtools/clang/clang_git.bb      |   2 +
 meta/recipes-devtools/clang/common.inc        |   1 +
 meta/recipes-devtools/clang/lld_git.bb        |   2 +
 meta/recipes-devtools/clang/llvm_git.bb       |   8 +-
 meta/recipes-devtools/rust/rust_1.93.0.bb     |   5 +-
 7 files changed, 387 insertions(+), 3 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/clang.py
 create mode 100644 meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch

-- 
2.49.0


