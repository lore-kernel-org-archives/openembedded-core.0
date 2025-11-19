Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F887CF3966
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 16:48:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11851.1763570909762977281
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 08:48:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LZL9LJxO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34186f8fde=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7vuuF4101401
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 16:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Pnslq+hwu1q9R3YATKc1ONFXcDAX4yhI2qoOOqD7PAk=; b=
	LZL9LJxOTwHdh94DzKp3F34nTzp5+7L7dqJlRcLXVRuHEfWWql40xEfy9rVWQ+dm
	Tn8aXk3HQZNBLfV3IVF/gxpfhOB+05NPuZoV/OihV1y5piPYTqVXqmVwLjs57ab4
	KQ0P5Wnba3YtvT9U3ZgQluwRrgeeG24F4FxhqxxKgdChGhMEIAbd3TVsSYvPN1Q1
	K1LUl90tGaniNYM9nW3OUlIvat/eEO/Ho8RWgGJMdSZRd+S3L12P72b48zHpgFv0
	LYzcW9CBInyoVfFgLuBWjmifcOd4AqR4Irnvv5QZjiCRqQ1LOXK43VcHtqyBEQYW
	owSRT6T0uNtV2kA/gIwgbA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011060.outbound.protection.outlook.com [52.101.62.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeeqwncu5-6
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 16:48:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDjDb/4LMulfMArg4suWJ+ydZ/nAiMB/d6mONNzG0SM8tTsztgKCzaBv1pWbfy/JzUsmm/lUj9NdxMKgXYafmttFP11ooqbTyiVeGMPLo3mlLf9svbTjfIPOy+bzsHs4oRcgXBZeXqgV5TzCYrndgygWGXSRMyf0HNmItY3QarY6JPczXZF+Ung+84xEU6H7oOKDYCkTMd1ZcVldGHgkO+4tIj3bWtsvUilgNqEfUTU9q9rAJffzBIm/Xxov0OKAaD2DCrK4qRqXFHTkbl1JsJldqIJ9UsGabMS9ZKnRbZ+AYmyAYsf5DTaaSofHjo+FzD6657Wl5T3fvmZaj56bfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pnslq+hwu1q9R3YATKc1ONFXcDAX4yhI2qoOOqD7PAk=;
 b=e03BF20DcQ+AFAOJ3fN4/nPKn7JTVler1nGF6ZAq/9fAClpPZqww+KejsfwQ3ql056Ln6FwEhbBSZy/dY4r5Y+I5BjuicxJQvi8Vg0yTJOtB+WlIAWDR4q6sAxkwz+eMt81H5x19u0B0svX8Yq5D4DNJ602az1CBjyrmai5zMy1i2CYmWse14GT0Tb2GRNPtSdme6Ljqvi8zyvOAaom0amumOE4Fy/fx+gtsEwBgRuH4QPnsw/+mbAAshfyu+XYXQaz8etwDWA53HHuBFwFSmpQWNiZjuHVBmnvCjCy7I97tsJxxoS2nkL0wA5syvuG17j81cpJ4OjRfgNKrvLACjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB6122.namprd11.prod.outlook.com (2603:10b6:208:3ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 16:48:25 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 16:48:25 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
        Sundeep.Kokkonda@windriver.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH RFC v3 05/11] kernel-yocto: stage rustlib sources for linux-yocto 'make rustavailable' support
Date: Wed, 19 Nov 2025 08:47:57 -0800
Message-ID: <20251119164804.256364-6-Harish.Sadineni@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: d24a8fa5-df3c-4b64-45d1-08de278b7481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+1V0BmkK6PgTwxOS+kmpkzCa6cbD1w9jB3/pzB0Y8hDP9kWnOCwmUmAmj+E2?=
 =?us-ascii?Q?ztJF63JvceWQFuXK7vQ7nE81wzQ8vsr2qj1FiQ/Qq4mBIhevd71n3Cjh07D3?=
 =?us-ascii?Q?4v6TyXY+ORHc9HBF2GphTLIXSD/gHBVN7mrpEON1fVYj64Bq6Hv/LIuEdqAy?=
 =?us-ascii?Q?Qiy7fYIom0G1Ip65Cp1Yjnv+jUmrV4hCeZtTHBXaqV81eHDTrK4YiVHtMdPX?=
 =?us-ascii?Q?t/95Ydv7ShMQwXNWWj5C0ncQBHqvPUPKaJJckXXpK/+aHrrtS6gB0LRRVc7o?=
 =?us-ascii?Q?u1yR1/cXOcx/r4m/v6oC3hA9PdGriSSZ8nCHzu0uwry+LLw4n+ep960Knusj?=
 =?us-ascii?Q?C42QP7pYR6BqrNJq+SDT1guD5UcXBa0LIvogBPpAYWBZyDAaa2wOdUlyRwhK?=
 =?us-ascii?Q?nwxi39cTvQ4OKzACSayyRNshEzRcE7IMVc2fTmnt6CEYFGC2hGseYOmQ2T87?=
 =?us-ascii?Q?jhgqRrfTNRbb8JcTvb7wLJmlMiOrquWtgIIMy32G0KxNkSxNkgL7zCiBmrM1?=
 =?us-ascii?Q?VzeZm5D+KIWBZgw+Qmp3zXaOnr1GRYhtVDC7Yd7dIUKe6VtmiOOG6DNJuV4x?=
 =?us-ascii?Q?+PpKfOo0TiM/rmv7DsuEglCz9J+r+77cuf2RfaNun9QbifI75Bmd4TuLuJdv?=
 =?us-ascii?Q?GT1PMjyiIx9lKRDZqcCRkXuebRDOEQa96gxO8xTUEkOH0ovLwlS01+Picqu4?=
 =?us-ascii?Q?d2J7ZGZHnA45Zbe8ttBugEFWYQgj3bTyZ716xQ2wmYHcRHHIB0+kps5TZOU5?=
 =?us-ascii?Q?ejOdHtAVBWMNArdCa+qmaAfjxTW4iHRhbBmQ51xcgv/6hThM9g/B0Kv0sSz5?=
 =?us-ascii?Q?RPPH+GUldrY3dEgfMvH6WpVuPJMV+GPFYCXr/qGgwOkIBmCY+y30hc9DxlpG?=
 =?us-ascii?Q?oc8PUMVCtCndLLBSdRTtIBYAhp/bNmWp5xTWbnW/2fCvbFvvdDeR96HCxbZO?=
 =?us-ascii?Q?zVC/MM5YbUQEMKeJeOZvhhbg1w6XlniEW1pWWG8YShDSys/0/5pku+sQoix4?=
 =?us-ascii?Q?7kZlis56b4waS7GfxOXemOXPbCYMWoMdr7/Jm2GdjKUidoTFrMmVE7DD+krb?=
 =?us-ascii?Q?5B0Wy48h9/y7zXyYU87OjEOgidtlAlRChikJ/twnfVVYv25Gt+0vVXJltDOH?=
 =?us-ascii?Q?aF92esCy212Gg/ntoFHmqB74aUH0FgcxrrVPiei9VK2+W/nkUm31fmA0nvWG?=
 =?us-ascii?Q?f/U/+zMW/Bpl6ZpSQVDfjNTJ4m5jdoekx1keFYoLRBgd+/Ri73V4t1IkeTh4?=
 =?us-ascii?Q?GKWQ7YVWOaI2y4mlDBZlwWR1AT/YgkOQ7tIo+/ck+ajS5VOhvK90UZfDBp45?=
 =?us-ascii?Q?RtyTWtrbS6ne2QLiY7rEKY0w0cvSbAOw+fQpFZA5apHoaKwCtOtNStjU1Kd1?=
 =?us-ascii?Q?eXox3bsid75YY47MubNGPiDSENhowsxY6IERqsYifFR3o6+iuutbdKRBgCvW?=
 =?us-ascii?Q?1RxfyzyghZmzc9Nm2kjrmMdPViTrBllsrM3ieM7NBK7WA6GgAOdLxaHGU+6Q?=
 =?us-ascii?Q?IVLPCHH+OAMspPyePdvMi+p6qLM44vX5mD0/?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ucvisaiQ73knaCi/2nNiT8mcy+Q4ghbJzjC4BrZFEGv81Ee4fyjY2GUqS1h5?=
 =?us-ascii?Q?t1B2/+xpC2SmRj54MBzy8yQ+DEqMb8dxotZ912dm74rT27437jzBAo/wQ7j6?=
 =?us-ascii?Q?2oydccSboecRqJbwhtl/Rban5EpT2qkRNejw9pcAXi6629IlAy1/pGcHgO4Q?=
 =?us-ascii?Q?bcjpO2nM0ftJcrPOaNJM8gadMHkuxf9YB4dOZdK09SjK0P/bEfOYcIJnorA+?=
 =?us-ascii?Q?Lt5rxKZmbF/avLEX/ueQczuO8IWQ5/cdEtUnh9NBfbzQj6fmmFvrg0e29lbA?=
 =?us-ascii?Q?sL6Kp2unaoLzB2r5efCnPeCA0Y9nByFpw3kco3ImOb3VmJpFRPX/uF4HfRSu?=
 =?us-ascii?Q?xTNqMNrcB4C4O0IOoqbdcxkNzvhZkeajBmaKOGXnCCw2JAVOQs/xp5aqAPqR?=
 =?us-ascii?Q?pEB70QsZAOYOHTgehqJ05sQ2Bqx/IhVL0rdmOZ4jLN85ZZYexyzSu0+C3cMh?=
 =?us-ascii?Q?2aTmlQ1zqQQj5LWJQEaXKRsmpzvajd2MqplTNh4q+J83DeXYgt36Hz0WeW0O?=
 =?us-ascii?Q?Hm6gJe/0ZgdvJX/ikk71zI2G6pxSf4AhtY1viQvdLDTkvxnAF/ZMQt6wbsqP?=
 =?us-ascii?Q?ZjoHcLx3nXqiRTIppIRYquHkDTg7ldyDt+o5sNM7mTju2I+ghosYixo8bdbV?=
 =?us-ascii?Q?ECJmoksJNe6lV4z4f9A1bzBx0hU/f5LGBugP7/Iqt9LhG/pHIsYJu1Zxfi5f?=
 =?us-ascii?Q?KgcGPtmUgo4/33jedV5VjU5foM0ovnXd+rDyyQ7ApMXbgNCRT5GWG6JW8+oR?=
 =?us-ascii?Q?D9kfibx+zybz2hljuwnWsfKTl7ekiGmgFB/k53xp8jA2dqm8wlynKSR5Nt4r?=
 =?us-ascii?Q?oXEyCYheruiNYBhMaRn1qpFTq3/VuQ0pIHnlx4LfSmE79r3UwowQLvWzXSaV?=
 =?us-ascii?Q?MNZsi+EoKY0MyoMOnTYTqV7yrB0LSNzjxbU+1oyxSKodCWiHqrMfKm9yEK4s?=
 =?us-ascii?Q?f8kmKwWglkJrHtLczY7AZ7q6U0C6SaXAVlynFE67FimhYePcQB7bOihsafQH?=
 =?us-ascii?Q?QSIQrqTitpGioqrJDwFiTZZIBsDyGtiGr3WTOxl4dI6JFjcE4CsaGVoQyA20?=
 =?us-ascii?Q?OiyvLqaIDT+4LxRykIkkbNUHqC92qoXXO8cbL/s/6fVJZlGys5AF/zdUouFk?=
 =?us-ascii?Q?UTD/5SA3XW2CsYvw5onFpwhZHi2ctZtDW2aLQmMlFHfxjjb0mH1uKxKGLSTd?=
 =?us-ascii?Q?BzgobeGhevzY/vO9K7wdilz4iC8H6iGE5y/t62MRfNdzpFLwKBsCq7u97dyh?=
 =?us-ascii?Q?VBiv3iTRwPuqe/HjlRq7nwVt1q0yo7MqsBvkoLFwQxczxC6gYZBqDP06hzGE?=
 =?us-ascii?Q?1XUkUvrbKuom/Ve8ZwrV1sf4uLCe0Jbtcnb0SJ+ikrlaYS3/oUC6pHtHkhQ3?=
 =?us-ascii?Q?p6ixPfXXB0NARpPL5NaaGVkp8zVbleYS93KqNIiNmsEuM69ahViFLRaufJSk?=
 =?us-ascii?Q?f+yp5cegmZujnMDxOeK3Ccnj/eLOrVYItbiP72APUmxbVYUv5EOgEniUqAZU?=
 =?us-ascii?Q?iLaoEZOYvFyORCGVzbdQJqtyIW5lRHYoaMtdY3ee69ZjESFFNgnP30VwOjlT?=
 =?us-ascii?Q?SKmH2agsCLBqT49cj8QZgpDe2xf4i6fbH8XUtBze980GKV2VVxiKSCf5cp2p?=
 =?us-ascii?Q?yM3A5TC3jVhIEHCzVTuSO1c=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d24a8fa5-df3c-4b64-45d1-08de278b7481
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 16:48:24.3691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5GDphZHs+hYK2EqxBrsmxU3qSdA4RxwCbr4OeiqLZPcXjU93inIlIv+LM6cmuS8RRqywswshXv6ajbYvCXJFU6zIevdcOeP0kbjtr2dUaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6122
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEzMSBTYWx0ZWRfXwqdwwIcZZ8YS
 1Bdps3VwRheUd/UFdON1t8Pyi/rVWHe562Sn8h0Xx2kK8PBerTzPRUfo9F3PIZ3hKW2vnrHM2/8
 hQTYxJJRiWtj4TKFRupk2jxjNjSefj6IPb5BMDQeMKUFJb/ui1ByuF3ScSxC50Km5ja/DQb77J4
 WF8b+y+8ThWg6D38RIgr44zXC7RH77rfi1dbrBpG+7zhL2qRm44chVI2D6V0WeVD0qHQVhnWpyd
 OmjQkRVlOSO4QLFMdg8NyA0o5qjYMi9Z5cm3/TpmPvqPd7IiewGy1L7KBC4VTwYjrrAUUXVAoV/
 j1sGT54JiUBv1xeFytaY8Cth+RtdvnB7inahQ3dsQGEBC1GH4Ee7gaNvHzRybTu+1jcJEGBK5wh
 Baa/xowzc3RwtbDmBF7SMw2CxRdtPA==
X-Proofpoint-GUID: egjpoRWSyZ299xRyM3N1ANEUQKniqf-q
X-Authority-Analysis: v=2.4 cv=OuxCCi/t c=1 sm=1 tr=0 ts=691df4dc cx=c_pps
 a=VmiGRewH7mEIsprpaxNw0Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=mmvvy781doOwp5hnkB0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 8st0B_4YNU1Rg4hFWKHBK1zdFxYVP_Ok
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226565

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When building the Linux kernel with Rust support enabled (e.g., via `make rustavailable`),
 the build system expects the Rust standard library sources to be available under:

 ${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index e53bf15194..2584cadf0d 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -465,6 +465,13 @@ do_kernel_configme[depends] += "bc-native:do_populate_sysroot bison-native:do_po
 do_kernel_configme[depends] += "kern-tools-native:do_populate_sysroot"
 do_kernel_configme[dirs] += "${S} ${B}"
 do_kernel_configme() {
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+		if [ ! -d ${STAGING_LIBDIR_NATIVE}/rustlib/src/rust ]; then
+			mkdir -p ${STAGING_LIBDIR_NATIVE}/rustlib/src/
+			cp -r ${TMPDIR}/work-shared/rust ${STAGING_LIBDIR_NATIVE}/rustlib/src/.
+		fi
+	fi
+
 	do_kernel_metadata config
 
 	# translate the kconfig_mode into something that merge_config.sh
-- 
2.49.0


