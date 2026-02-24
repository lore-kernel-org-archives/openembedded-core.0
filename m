Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22F0F4BB8E
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 21:43:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32011.1771969398324629767
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 13:43:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EeY0GQrU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65157b7930=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OCZLkL3704552
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 21:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=IjTX5R1a645tKotBks2CC+MdGd3YmwluJe6BwlX7vT0=; b=EeY0GQrUU/FK
	A6ds85vJ91t68Bo/aVFhLqI7lFR2JXIFjqA4q/qol7dFgCSobLGMwV9eOUa394Gc
	e5IMoLY1wk0HZ0fdhn7HxFEKN4C3kf9PaV6DOMsoGBGAj8OXh+esgw2c1QHXEc31
	AmIMpzwF1NH9dPovGdTgTvTVkcnP6UwO/LtwlkAATsR2r0zCfuG2WzVg+nZWzVJD
	uOQAkTCItrvGe7qhVUgyEQ8Fs/TQAji7C4SALp6oRRiY0o8+tFtK4Wtd5YpCXGuI
	c8RgJtQdda3ZUW7OdP4+ofihpKeoZL842AnAE5GSa6G2WhpCmjV5wNsxZqOAmmdL
	q31CwdE0Rg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012060.outbound.protection.outlook.com [40.107.200.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cf1wvc1cy-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 21:43:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s99V1IM+LtDgIj865tLhMHM1XczoQ6NTGCrLFyePxC/a/LFuTNEp9b4Oh2uHQ4t72WPCMc1JEEIdCHP4OBGk4F0Ao3sT09tQKY+tpTJ5MxqohLKg4Eho6RHRUF5h1HjY3InBFCMrDhL0UJOFgQxuUsxIV7kMqnqAw66p9q2CB8pYl+YBtk+9HQAXK4Lb53AcyTIhOWVES0insXbJ7bHyxFqb0YElTzHgJ5mOlft1TWsxFc7K3SZWC0h+dVlcnmilEwhUy7a33g5ViIivcHtRVEzmx4wIi5cjQWWfbZTOQErqzq9i87VwURRhLQiS//i4hPQSLt9M7Dhu1O2ACt6B/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjTX5R1a645tKotBks2CC+MdGd3YmwluJe6BwlX7vT0=;
 b=mr3ovfYMJ+oG+O4guXoYbOMWGbhI8XGKbR7tAqu9XHpW9cqAGU9tcgje084uUX9sbbp7n8VacwwXDR0aox5deLfIlSFjvmcTMgxIuYXtQAAtql5rMjEwB3ws0JFQx93D/G69ovpUnRs9weiJyab43tW1RrF7+GIzQCtLHy1kSzxAwagcdhZy6IaV1QsX9u52lbRrn9zVenzQZgkghTrhTIl0I0KB58DAD3Yz/cX1pWNED8DSaA14EfhfMu5N+/tcgv4iUbP6kWQ0hGbywKUrmVw+r0Pols64r1f0Va3LdqpSoWV2t5u0QVejpxlr4emyY3RoOPiEqWFQ+57RoLDUww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH8PR11MB6660.namprd11.prod.outlook.com (2603:10b6:510:1c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 21:43:15 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 21:43:15 +0000
From: Randy.MacLeod@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] socat: Remove -fcommon from compiler flags
Date: Tue, 24 Feb 2026 16:42:58 -0500
Message-Id: <20260224214259.2236671-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224214259.2236671-1-Randy.MacLeod@windriver.com>
References: <20260224214259.2236671-1-Randy.MacLeod@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0076.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:65::15) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH8PR11MB6660:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f50f6b9-0ebd-4a16-3e61-08de73edb741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?b2R3mP4uR3dZe5HQeyMe/zj+tlkorBQhyOa+jShQp4v+jsbLtxBj6o383Bl0?=
 =?us-ascii?Q?T/UQo27epMSzN7X5Jl8GDBhAaYsUOe1Zn6+cCihj5Ei8ERjZJOaDagSa7+3/?=
 =?us-ascii?Q?vkK+17Y1PZcNbR2MxzWxS95VLwgf23PGInqQKZA8yYJMMcIFsQ0AW4msdvel?=
 =?us-ascii?Q?OOljJ6h3y0v2CoXX+fHyYAPmo02rpghQVqtHHH4Ks42Gt2AoI4qqSefIVCEk?=
 =?us-ascii?Q?rEAZP8J1TVCpzIWm/727fRAZc1cCXQGoo2atWqJlVnEBalsrCPZe/T0yROmG?=
 =?us-ascii?Q?DB8SFNwxH1510Ur8YkrXGjWX4VlTVsj7avHw6VutLPZ1gUCvFXGMCfBAzUeg?=
 =?us-ascii?Q?4TiaNq3iex+H5eBD4tPfhRgx7NzauboLilm4NC/prqGTCGeMvWbNYZZgM3yc?=
 =?us-ascii?Q?2IeYGoWqeElj0gwKT3bk7EcncRiRH8hB6yTO1Swu76Xpvzluo5/on6mctmvx?=
 =?us-ascii?Q?Yk61i+m5IoE7GEvQhra9xUcQrXem6QvIdyoBmuWrR7dGWJcEpffwkVYz5hkp?=
 =?us-ascii?Q?5OM6Cl89y4Fc5FRHnvao0yAtqG/el/++FGLsrNRDkUpNniQlKHJaE/BFXsr5?=
 =?us-ascii?Q?FSF9UHaag1oM3Z/o5Mhvp1bd2Ax8yabvE2U1nX9bFlLXooKlb9el92NcXEy+?=
 =?us-ascii?Q?sexItu1nuDVK/MpW1E37EG+8H0xfHG0OT2hkuNkScNHBXqPrZhs1emzJKlxY?=
 =?us-ascii?Q?ncsqMqogMEEyefyoR3zR3JYVwuJ90uqLSsp2hD+BGd8yv9j4rt568ymCSF6z?=
 =?us-ascii?Q?Vt2hDcgj54IlSxpMDkZXgWFeKjpwHPzrAHV4j57p2Tz62QaBSagENdKfsBJn?=
 =?us-ascii?Q?u+2ECc7qm2brD/0rQadjmf82FxhIl8TkBhz+Y1yEanwM1kHR2geImR0RnxO9?=
 =?us-ascii?Q?PGqCg8T+7zyRd6ZnOlvHa+whJoE6pYBG/FypbtDbl6oPVfNw70c5yRan+7EJ?=
 =?us-ascii?Q?7GPFhUDKVN67Hs92FfNskfqBVUHnKaLGq+iJfrDuR37+uEL5Kiu5EuzgIFEO?=
 =?us-ascii?Q?dSRKmSyyv2dtpvH3Lf+7x7WxUlLVj0xKsHg0WDl6/XOc2iFU8TrjEArtOP1E?=
 =?us-ascii?Q?w9KCi4ffys6pUNLiaWQeiy+gvJQdxC0CtAlAeFKZxyVyoOiPO7rQHVpqrELr?=
 =?us-ascii?Q?Phz4DiW6TXJxxZXFlHRYkWDE1YQGlsvHdFxIGllvaR69rEeys1Tjs9zM/dwZ?=
 =?us-ascii?Q?QFMwND2Heys/gSmx0n9a2ttqFu5Cv465880jgdesMcOlUHfN3ZkeqVBXoRdb?=
 =?us-ascii?Q?Oy2MO0l43kh2iZhIGr+kSFF8ZuNaqgESHisvuMTVO2K/YsmUGqKGQ+M5gnQD?=
 =?us-ascii?Q?OEjA/HEpBU3+XvNUYSfpvJLaqRV+jDfnHa0rr4txyeL58nwzzoahAgU2+ErC?=
 =?us-ascii?Q?8w+hCqCwJSlvDYwMAEPUHNWwDKxUhVFuMfmCjvXgisUuG1wLBx45lrvVZwo1?=
 =?us-ascii?Q?fNjIVfh+m80ni1ami7EnT1YT39pv87a9kMca5kBK7EnKZKBhQQSofezgktzu?=
 =?us-ascii?Q?hIsHi+Eb2mWwJccSD3wbzNw76hD2w/ZAjaSTy2TQHThm+ExewjuQUgLSX6c9?=
 =?us-ascii?Q?3TVl0g6hK+enYS0Ze2TQNQxHX/4fA/Y68Q6blDZJHx0s1FXDi0BpHrpDk9l9?=
 =?us-ascii?Q?WNj2iP91GFF2AriOnANPELs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2PXjfktexCJnyYKKf2T0R4e5m6vCUz0WqQ0Lx1zLGM0CPLjzoKI3fihStbiC?=
 =?us-ascii?Q?k+UeapNOYsUxTiqoON9OjfvbACrCFlRNJoctm6tUck4b7M/MufJhf476/p7W?=
 =?us-ascii?Q?nm+ZGDvA8LyQRHUbTqWY9Ko9Y4Igt/CkW32kmM5LVOw7Iz6ayEjFBQ7XDQMe?=
 =?us-ascii?Q?Kt86UeCtj/PpHC0OfAxhfeJEAdh8zClmKOJG0wJqFq8KoH0nNYSNyVkmPys3?=
 =?us-ascii?Q?k6N88AEhgCUWUoD4t0gxVyUTMfvF1rRX2WgYMbc/oTl6bxhaaXkr9qenpWtf?=
 =?us-ascii?Q?AWOJYJ5wEfwL48zB5W73pvr5OHWArbTHBwV8tJlW3w1IX8TnaY3gcyJV+xH2?=
 =?us-ascii?Q?caiaiNjY+GvoTROThDxPBWVn3XTalgZPJrYlBF7oYJS2BCvuvga6O9zSqa2Z?=
 =?us-ascii?Q?pVEwJX/KmkHxYEgUUHuT6J4dN/QgggRZoFPlsVOdYuuoy0FPXHvibYgUfpUF?=
 =?us-ascii?Q?p7plJrcWiwqyt3qKk8CKjakiDk3Ne0caJ0E3falNE/c1oqgZIwsPULPQSYYk?=
 =?us-ascii?Q?mjD2dpvZUw/MAS2U5sWKihnksN05MGmGDVMAI+DR67UncGd8dNoEy4WBU9JT?=
 =?us-ascii?Q?IlqFhosye9nOrzpo1n8nJxBnF+YKFlrob7MDUm2iWalpbZJZskEcWr+suG5H?=
 =?us-ascii?Q?6pgIS5AMyiUkat7Qs9Yr41Pg/F48y515BIgqDrnJiGdmf58zjdvLkANq7Te6?=
 =?us-ascii?Q?PCk4uN1S/1I4eD0BSTiXUcxWPit0RFgx2+HgEWZFzzq1Hevhx62yTkNRzLZ7?=
 =?us-ascii?Q?p/UlF3WcyR7x3wm4cjY9/EPEKeESM6LeQLayhlbe2Vfj3n3jumEVE2ZpqIaI?=
 =?us-ascii?Q?VzYPlfmsssAxRWY+EjWiU4qCQ8CWdRNpY4U/Q52znS6RDshAOAHJu9XxUT1E?=
 =?us-ascii?Q?rHlMahnaPCc4n2+hJT5kjzYIOrImNf2lgDBYOVaiiH4RL31C+GWG4LYV8QIw?=
 =?us-ascii?Q?gn2JHbg72tcR+EYPVX0CaWle27c7CrW0kjHzCrUpd55gKnFn2Ns+wVAQti4x?=
 =?us-ascii?Q?/4oaIgr7ndButicAErbAu2Wt33D/MsyQPEGcuXRi1n666EJpfeJMP47NaNHc?=
 =?us-ascii?Q?JDtF1MuXXX6qPYIlOovklLVjiCYMGAnYkP4QDXhqh29IzoonCeAB6tOOR0hm?=
 =?us-ascii?Q?2lHevZVzbDBL4gubV/6o60VsTODrCRNCj4EuWsu1bYdRA7c+P2a2PSavVESq?=
 =?us-ascii?Q?OdnNk/5TDk1CsSC1phwWm0nNVqQTorCfmJqCPFrHnNBApTFI7wyIt5VAsabW?=
 =?us-ascii?Q?HRJRrGiuMDSiEiY+f1SoZdnpnTOlYb7l3HqC/KLffr9bcX7MEztgomiRjSA8?=
 =?us-ascii?Q?e+PeT7jcMOocK9znrrqefGUnjd+/JehAqoBUv4w4N8Xg3Y6jYagfCmIYVSyc?=
 =?us-ascii?Q?1Jm2ZCj7hTrhRchKP+Es7A0OpXSo8tvucZPGpxkQ9mLAj6/HOfO8OhjPufVJ?=
 =?us-ascii?Q?dG5JkHE7WdRX/Cx+tQd/GVeotsx+xOJF+obnJzRSF4Y/2P/X0eMA3WA3r7VK?=
 =?us-ascii?Q?mof2zF6hBBgSOBLG6GhD+P8QYH/EL2nmUGWibSH4SL2Wu/oIAFpzAdN8ehB7?=
 =?us-ascii?Q?JaWoBkzS3yi0ruI4Xy4H7tXjxfwaQ6hWnKbq16kpNYfVDSYsdtELMLP9/3hI?=
 =?us-ascii?Q?ux0pw0GCysj6KUoMXj89/bMpCrilIQUw2ClSxmWMrhnzn/TB64KDtTjDqDOz?=
 =?us-ascii?Q?9xpzJno4zkUK3351EPQfihFNmKBaKLGgY5CQqxnR0b7SovyQUmavJ+0xuaDf?=
 =?us-ascii?Q?crS22U9D2HSPiotp4uIjJn9W4fwJ5xo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f50f6b9-0ebd-4a16-3e61-08de73edb741
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 21:43:15.5174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VsJ2O5Rmu6YPEebpc6RpSTsH7l9zWfjEWpPGRWVMx9CXn8F+qNYIGkT4360FZSB+GPb1WNejx9aa5PeYk8eOVCt2/CSGZoeg4nfayVImUU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6660
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE4OSBTYWx0ZWRfX9xR23TGm4/k0
 cqGsAog7PMetq/nef0gk06mW1koCGjx6hOScWRgUzRxgnD3Mbnl/zSbPHEdbtTfqTeRBGy6Tv1L
 ZxgNz6MaB7jws3QJyUP6FW0KMUd/aoYd81PLXgEtEIv9/04astbgcHmkLCdh3/UIrtKNLYTiUnm
 HHKYe5hGijH+0Vd64ZzlR43YIzG7mvfD/tdsPBkEYIKHHSQlU3DNcylgskchgTcCKDxK67UEOiL
 8YSOGE4+vcBcPk7MdxGOF3PHgIqL+Evuv6U1eyDbNKBrkPUg6nAVT3+T820UmmJaX4DEwfclYPP
 6dOPT8ogQyf4oPiAnp6/QSctUnHdbm5EqNvlYKibV3Je+IR1zbOqJgLshQHcBFkuPAci5fwraFm
 Ypsgd0tcAcKxRAnUCoYJxFg9emnwI4djrt4TGU7Ig8BjgDVU9WNvqaXrciAEXWjbJCVIbFAY3Lr
 nATboGFsvuDPauL72FA==
X-Proofpoint-GUID: RPw0i892LNEawqPB_9GHuCRtYAFvLas8
X-Proofpoint-ORIG-GUID: RPw0i892LNEawqPB_9GHuCRtYAFvLas8
X-Authority-Analysis: v=2.4 cv=F+hat6hN c=1 sm=1 tr=0 ts=699e1b75 cx=c_pps
 a=P3LZRqt57NYhn536gl30yA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=pGLkceISAAAA:8
 a=oB0tqvsQhOT84LD9yA8A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240189
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 21:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231907

From: Khem Raj <raj.khem@gmail.com>

This is no longer needed with gcc or clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/socat/socat_1.8.1.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-connectivity/socat/socat_1.8.1.0.bb b/meta/recipes-connectivity/socat/socat_1.8.1.0.bb
index 331133d6f9..b9a27c648e 100644
--- a/meta/recipes-connectivity/socat/socat_1.8.1.0.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.1.0.bb
@@ -43,8 +43,6 @@ PACKAGECONFIG ??= "readline openssl"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
 
-CFLAGS += "-fcommon"
-
 do_install:prepend () {
     mkdir -p ${D}${bindir}
     install -d ${D}${bindir} ${D}${mandir}/man1
-- 
2.34.1


