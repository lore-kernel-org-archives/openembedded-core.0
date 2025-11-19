Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC34CF396F
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 16:48:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11806.1763570910423345275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 08:48:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=amPYSB3/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34186f8fde=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJC6IXh318537
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 16:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=KuLFRlrOPj+wDi1d3xJrJyP5j6gBOfokeCpCKlhsrjU=; b=
	amPYSB3/QH9A9Ldqmqc87kykxI9IJfN2abS+jD3KRTHU3XllxLzwUHTpwgr6aHgQ
	vljkyOZluU2f07CsPgu4maHfAog06y+2Ii97sfTrSIRE8jrSDbRa28EnOgIoJlqp
	S9O0WCAoSVwMOmJ/nNrKeo+AnOL4cZRsmd2h/WPAyjEhY5G8v42m0Ixg2vlXtXnO
	9de9F4tEYWYHUpS06y2IK8CcB72tc+SP1ICqyvi50uwUUdO1kLyFsyTPK4qm31fl
	xai/vT2AqwZKMcB8sgHnekFIIYj0qZq6ak1chfmhTesV3ZL7fEKj94Cn195Ss1ow
	DHf5DMhUTNp4KGYeFLupsQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011060.outbound.protection.outlook.com [52.101.62.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeeqwncu5-8
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 16:48:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZ+jATXiuW+2R4xQdZR0SmOvmQsVK4s/15KIIFrI0l1O6QNi7g1RHv7jbXvY13I1lrGXA1utF7fwRmyfZAMYOxn+X6EcpVHp0/FrRc6YhQTaJTpz7SHmWGqfYuuRKXSPEFsulPWr8aHqhcgWz4YRXW7q/bQrRY4NtFBVRYyWzCY+sRRiLKuo8q1ySS0/azfZx+GcPKVesaekXRkYNgYJkQd0MAo8QkrlEO3r2X2YRAsArvfVj/QzJKuWMNw/554bmxz1rHc9P+nQ2hersw00rbft5Fy5HJnq2sHbNRP/4TTpg9QG7AuhWpz5DPkzmtG5pTivR/P+cU7rCvQdgAZTzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuLFRlrOPj+wDi1d3xJrJyP5j6gBOfokeCpCKlhsrjU=;
 b=IClLpsYV1+is1lQbqkSd3TuRV3h7xFjpWvMB9hlZkRGEY37RNljkImcKNybu4MH3ajLAfA6xDcOM2dRH06JsaNAYezos8xfiLvTNg7E+SAcbzW1Q2E+BBA0yGALENkPr6MBXQnKByML19QykMI6JVYNrfMca5DTskJDqMKTJJ7RzRF5fwNOXDtXrqAg+kUoFKKze8a1bCs5UPzVZCnNfMjSPVWPsW7tfAXiVjkRKi2elqOqlaRgwu1UfxMPysSXZEafxNIxeJ4usFj685A+/bSKRTD6iFZS/2/FaObJF3bY9/bbf7uqXWH6oaw9s0NW+0Y2dvuSzP/XIXVU3HZP0kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB6122.namprd11.prod.outlook.com (2603:10b6:208:3ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 16:48:27 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 16:48:27 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
        Sundeep.Kokkonda@windriver.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH RFC v3 07/11] linux-yocto: enable Rust support in kernel configuration
Date: Wed, 19 Nov 2025 08:47:59 -0800
Message-ID: <20251119164804.256364-8-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
References: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0203.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::28) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: e40e8c8c-e485-46ea-2b5b-08de278b7521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NTsBb6i6j2Bs53gnDNEgANDMHCdalMfheSVfBphKB8AtUU2VzEKgOVB3ASYY?=
 =?us-ascii?Q?x8Dl7Q5qfrCBXpPNZ5rr3S5PmBasT3uITE4c9st/kn4wjv+ZZaX5qHfx27+n?=
 =?us-ascii?Q?oWqz84+VUOzMhQzm/1DHYn4pYPF6WmdBu/4urkDbLlbb3KBH45Mq7wfYZoi3?=
 =?us-ascii?Q?3mG0wXLAjNYhwV982M5XRC3uojyPw1KTQSCnNRX1yymdzXbfPCQyvW2GIdjJ?=
 =?us-ascii?Q?For/07K/kxNoU8udjG3uslLQY98d6nY+SYKp9aB8rkI49NjnlV+ytdYEgUgD?=
 =?us-ascii?Q?pQlebbFXAIXt+/xDXcGNAgp7T9AOF12fhUmL2Q/htjuuZN34xsIQl3QN97a2?=
 =?us-ascii?Q?ET88G3cYnOe6j/AufwSQETaSdZXaN3y2vCC4vJ7Aww1wY7vKRJGv+13auw29?=
 =?us-ascii?Q?jNqJmn8ZHmvF9qEA6m2OJVoyy7XExN6HI9d6kKSkfwb9KP3qLKrzgxZcQBAJ?=
 =?us-ascii?Q?CPLGZdfL1si1deA9tZPi1DjZWqwlSYNlcjmXBbBGQFCGuWfJm5nGnXcix+T2?=
 =?us-ascii?Q?7tkQuJB/69HNe+QQ3rrDSRJF96QzodmCMiQGHmIlNYCSGHausNQmQOpMDyzY?=
 =?us-ascii?Q?fPKxA5PFag90klxP35ynhsw/XI5M5v+03BHI+JH34edglIQ3y/bOGc9g1CSS?=
 =?us-ascii?Q?vOeNhUH2kItkrQPU9ejQT8f4k99pOzD+hg+8nF/WMHepnLGiI2DgITvth91H?=
 =?us-ascii?Q?+/Vb4LiO7ufGD4WMi+7KAukzeeBEjisWBA/ZtkyhJ04EuIgEMVuAzK08pD4Y?=
 =?us-ascii?Q?Uo9D8TUmgtFtt76zmhgGWwU20/NCk7TL9KPpZnNbR8lO5hB81UKgNKK9EyCW?=
 =?us-ascii?Q?amKmxmQnM6LNX8uwOW0WzSz33wpqWC5Mp1RKrsiLNZjVhIWZnv4dl5XbqCbN?=
 =?us-ascii?Q?yfX2vFiyFYzVkxFFX8bIZQx1dwZ/4ntgSY0+OH/vga8c+jV+PrPzu5MYOoY5?=
 =?us-ascii?Q?dfIAQzgWn0dlkoKrGpaI7YHe+ZoGj9idVCQLXhjsvuuFUo/dLdpelOCilwBk?=
 =?us-ascii?Q?E+SYsQfC4saGJ1JfkQnvxZJ2LcC7feKHsyP2KnDRGbG7CLH7agR0IH5pFUDg?=
 =?us-ascii?Q?AaMMpO6aY8kbvojOIqVoi7BEYtqHd6yszD0C6LE8Z/uFw2xMZrE2j7PjQRzL?=
 =?us-ascii?Q?0j9P7D7tkJ4JJ8qSmNpkg1QSAtMznX0/WU/LjdfO2BwDGwj3YkRfJxWX99P2?=
 =?us-ascii?Q?ymxkBOaaQnK7Dkf1y6YWCScX1l7PwA87VoItN6PfOw42TYT4gcwzkVp9M3Zu?=
 =?us-ascii?Q?bp+GCBr/MEzmVBzazqSjjPAlTD71FJi3OcJGeagIu5t6szwLJA+FNNx2EVOt?=
 =?us-ascii?Q?liu8ooyB0LcPaxgqB2/SUsUodGFS55897Rs3rK4OrMMbWumA8LepwOOQY8ww?=
 =?us-ascii?Q?Bv6PJ9OUWFIbow1Mij64CxIa9c1sCN8hRl+EbsKtL0ZTXcbOWjPkRvi/LUPf?=
 =?us-ascii?Q?HsLGvYrSTTaYSHTmMj6fM4W5yeVv5DabklUX3K4qjnToDO64Hj/KEV8VKyCO?=
 =?us-ascii?Q?IGM5kGJvPNpbTVD7CM66OFh3IjSXnZ4s3IXZ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Hnt9xCVgbLjIr44jE0f0J2MaJh7Z5vvCHlnOATMKrz1vzzXItNHUc9ED7MIQ?=
 =?us-ascii?Q?Jldimj9Ob+hiS+b+FM5fRrXf6OSIJnqKn/NhAB0a1hVG9/DAmvkOsUXnquJe?=
 =?us-ascii?Q?wvqiIgnAwT52YeQ9VxbTem0KTcju6AkJS8CiM2NmEZOOZ19dyvdU3F3WpRRe?=
 =?us-ascii?Q?L/cr5I8lw8pQ6Py28y+JT/AVK7OapueG3ASvEOAVm0M2KS9ozr/fw63i+V1f?=
 =?us-ascii?Q?YGWMizuRMtDaly6exaXbrzRwpag6pYvlLSOtKDQDH3tYzxQA8MJmtWiZmcnF?=
 =?us-ascii?Q?Szg3IlBr3W85iZ23GO6EO3DtYu8Hu3QaXLzPIl53/vhxom1GqJSff0MAlh20?=
 =?us-ascii?Q?g3gPQYcOxVsnv2t6r4USy/9NDipOKWB8jynhsf6dXfWMP+JvFdGXHBArsc5Z?=
 =?us-ascii?Q?g4xqzZ6uBbjR6tGYU+V3B+ax7aHdNnROZplgOvwImTc//kd1XfuWlMG3SISp?=
 =?us-ascii?Q?NX3mgnpxsSXDncHALikvzKLpooBWftOQbbaxaxXWF7db0BQWGY/q92XfZjXu?=
 =?us-ascii?Q?YQu3gU6c3uLp3Sr3ExorWaatu6BV1MyH35ljW8gQoX5DPXexp/VETXK6Lo9m?=
 =?us-ascii?Q?hl9giVHO4aZs/F0PKpYUQCpuL1GINO5ejKXFJVTM8QRAm06LD/QL5DsKeiiw?=
 =?us-ascii?Q?/625pra35AZNKR4PwgyduJTUFfuL7SI32UHiB2bfmSMQ95Q/zmEqfbmkDPZa?=
 =?us-ascii?Q?ZAxKdF2jy99iwFQW23MzJhA/18p/vdcNGNkddSzUmmsM69SRs1oJ+stmkZD6?=
 =?us-ascii?Q?6PNAO81156jKM4IRFuAxyC+cm0QYAvYJrpDmvRNe5R7UVRBTE0yP074ClsT7?=
 =?us-ascii?Q?Qpg1vpGem0evjT91XwnE57BUR5eXuvubfur5kzU4rfWtiN3dBw7s9ou20zpl?=
 =?us-ascii?Q?L0SeqyAawRWVZzVjpW/elIci42XYEqBTp5U7nuGrx2sP/iu+xnY29BrXRPKX?=
 =?us-ascii?Q?lUosdxXhWJU/cJINL9JU3q50dzngqnYXG3QTgJxeDphsa9jFLY9k8jAZQAnb?=
 =?us-ascii?Q?3he+2ic17WQbMF5tboFCsOe1jCbbbeWqHjnYnyQX3BDvqJWHzDw9mSNAJu3c?=
 =?us-ascii?Q?mgBJ0yoMbZ/4v2pNN5JchtJOK2kFzAjcZg0CLJ3c/b3xRNMmUz+Sgh3d0r03?=
 =?us-ascii?Q?/MnwH7nC1daglUmUCMR+mrY3nOIt+EuH3xS9Fjs/QZtFPC512PR9ERiJSV3q?=
 =?us-ascii?Q?NKNhfBvMA8ZoJGs+ao+XcLSsHsQBeMhIvFlD38PTYWrWpS5q9+wGzz+YM83u?=
 =?us-ascii?Q?mZM57d5ivbhI+YnrVrcTBNQolCdkVPXkgZaG/SgFJOZyIhYLuICAGOAPa08v?=
 =?us-ascii?Q?ITJTuTxHSiGVW3P0hk2sp9awViAo2orxOtIfgAU9VkFHU6YMVX0uevxZoEYl?=
 =?us-ascii?Q?lY3Z8fPa/L3ePN7oS1B64WeIP9rGI7SWfwYYI0XRRQnUDydMjerwDHbgW5pw?=
 =?us-ascii?Q?XrkBfAJ/KK/QvuWW79EYRLF/BzS18JAntd8mQweRUDufMm3WI7Kv10LOmPkd?=
 =?us-ascii?Q?SBHJBnUPgnezKHXyPT6eGBXWJ/EZL6Hlf7kmVgPSIfN19p6ywpRSfnmjVHRe?=
 =?us-ascii?Q?lPQZFWRjKiHIDJXyJ+rENxA9Uwtg0kJE8IqrKI+SM6sYDaqJYI4YBC/tns9u?=
 =?us-ascii?Q?ITMqYNv1Rh0q/6cY49JJPR4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e40e8c8c-e485-46ea-2b5b-08de278b7521
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 16:48:25.3831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mBFi8JwJm4f5IHWN+E+bEB9W8XMOA+4E8doMKkLr3rdVxbX3LCyygRHVe5Rbl+e1azsUGJcwSSdrVUWqoLjXetzfbjdHk0/qtfSy17KDFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6122
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEzMSBTYWx0ZWRfX5JOCumCdeGfz
 5wi+iYi0OERLMgMG2JN6tumFx0qhrJFQZ/LkvJ7bkkD3SRIy2hqs6JXtE0iyZfxXq7Bs2EBz0Rq
 q5zFPQmBXAI5O//4Qb1q/1NyZkESHDiB4D8rjpqbeqPyyvmyqkXdMRXOVgg7XLJglG5u4VA1LU3
 sHyTr1dEF58hzSi57cskBCVJyHWgfJ5p0B98y+fE3pfZ3EA3KS7etCvjGlPfaWQQfvZ6vuHBJyQ
 Urtu5WSJtX9TplUfQkJh1CBcx8kGjsRA+B2veYEcR8uSd0zSHEGiKKq8cXkQtCMLF6jlrfrzwPZ
 vHIMAf9i351o8yJoD6jzswLQTRkvapwnw/+WGXe5qdMB96F/e9Tn6fyx3R45Bhp6KgHyjrQrzME
 XULkNaZrmhwBtlghfgA/ssEFgp6GXg==
X-Proofpoint-GUID: UZBcpb901efFQ0sEGcg9G29kUKD1hshJ
X-Authority-Analysis: v=2.4 cv=OuxCCi/t c=1 sm=1 tr=0 ts=691df4dd cx=c_pps
 a=VmiGRewH7mEIsprpaxNw0Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=X3MetliuLA2BOnX4JlgA:9 a=itNntiE7ACGd12bT:21
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: pHcfF41ftsM099lYuW7Ef1iszyLZQzQ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_05,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 16:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226567

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add initial support for building the Linux kernel with Rust enabled:

- Introduce `rust.cfg rust-samples.cfg rust-debug.cfg` to set Rust-related kernel config options, including:
  - `CONFIG_RUST=y`
  - Rust sample modules and developer checks (overflow/debug assertions)

- Update `linux-yocto_${PV}.bb` to:
  - Append `rust.scc rust-samples.scc` to `SRC_URI` and `KERNEL_FEATURES`

when sending non-RFC version, we will send kernel-config-fragment to the yocto-kenrel-cache

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/files/rust-debug.cfg   | 1 +
 meta/recipes-kernel/linux/files/rust-debug.scc   | 3 +++
 meta/recipes-kernel/linux/files/rust-samples.cfg | 4 ++++
 meta/recipes-kernel/linux/files/rust-samples.scc | 3 +++
 meta/recipes-kernel/linux/files/rust.cfg         | 3 +++
 meta/recipes-kernel/linux/files/rust.scc         | 3 +++
 meta/recipes-kernel/linux/linux-yocto_6.16.bb    | 2 ++
 meta/recipes-kernel/linux/linux-yocto_6.17.bb    | 2 ++
 8 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/files/rust-debug.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust-debug.scc
 create mode 100644 meta/recipes-kernel/linux/files/rust-samples.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust-samples.scc
 create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust.scc

diff --git a/meta/recipes-kernel/linux/files/rust-debug.cfg b/meta/recipes-kernel/linux/files/rust-debug.cfg
new file mode 100644
index 0000000000..d9aeeb4e91
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/rust-debug.cfg
@@ -0,0 +1 @@
+CONFIG_RUST_DEBUG_ASSERTIONS=y
diff --git a/meta/recipes-kernel/linux/files/rust-debug.scc b/meta/recipes-kernel/linux/files/rust-debug.scc
new file mode 100644
index 0000000000..ef0ef3af6e
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/rust-debug.scc
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: MIT
+
+kconf non-hardware rust-debug.cfg
diff --git a/meta/recipes-kernel/linux/files/rust-samples.cfg b/meta/recipes-kernel/linux/files/rust-samples.cfg
new file mode 100644
index 0000000000..c6cc803702
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/rust-samples.cfg
@@ -0,0 +1,4 @@
+CONFIG_SAMPLES_RUST=y
+CONFIG_SAMPLE_RUST_MINIMAL=m
+CONFIG_SAMPLE_RUST_PRINT=y
+CONFIG_SAMPLE_RUST_HOSTPROGS=y
diff --git a/meta/recipes-kernel/linux/files/rust-samples.scc b/meta/recipes-kernel/linux/files/rust-samples.scc
new file mode 100644
index 0000000000..476cc92f93
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/rust-samples.scc
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: MIT
+
+kconf non-hardware rust-samples.cfg
diff --git a/meta/recipes-kernel/linux/files/rust.cfg b/meta/recipes-kernel/linux/files/rust.cfg
new file mode 100644
index 0000000000..105eb0a14d
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/rust.cfg
@@ -0,0 +1,3 @@
+CONFIG_RUST=y
+CONFIG_RUST_OVERFLOW_CHECKS=y
+CONFIG_RUST_BUILD_ASSERT_ALLOW=y
diff --git a/meta/recipes-kernel/linux/files/rust.scc b/meta/recipes-kernel/linux/files/rust.scc
new file mode 100644
index 0000000000..51d9de1673
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/rust.scc
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: MIT
+
+kconf non-hardware rust.cfg
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index 2188c7fed2..37cada11a5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -77,3 +77,5 @@ KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
 # Check again during next major version upgrade
 KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
+SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' file://rust.scc file://rust-samples.scc file://rust-debug.scc', '', d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' rust.scc rust-samples.scc rust-debug.scc', '', d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.17.bb b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
index 5d10a17e70..f63405a3a0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
@@ -77,3 +77,5 @@ KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
 # Check again during next major version upgrade
 KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
+SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' file://rust.scc file://rust-samples.scc file://rust-debug.scc', '', d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' rust.scc rust-samples.scc rust-debug.scc', '', d)}"
-- 
2.49.0


