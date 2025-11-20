Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E67CF9C48
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:27:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36753.1763652427780698458
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 07:27:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AhOUKE00;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=341909d004=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKAS9UX4105198
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 07:27:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=QGvnQ7ZRDlV987ywNv1mC7Gq85kaYk1vaikUP3VUHMk=; b=
	AhOUKE00SSMGRh4fd7IuXE7oqAA8fSXcL9hoQ45R5Cb42hT+aFBHy2S1/2MCktVn
	Grkh5p8YOnQ6H9NUA/3YJMaHxSn5qG8JLUoEE3IkH685nsc2sR/f+3Xw4kICqor4
	0UpfIUpwjTY+U8ph13cWC7fpAeqbY5DSOwSuG6gAgycpfm3nbaqSnFPB1F+fw4W5
	bpVzzldyRuT9Yf0LLZl1YGv0wjJ2hQ0rJwLIMImPWguKx1jVSNNhubzf7r4yx7ou
	2m8diRkxR+HU5WzJc/irA9DihJIfNlDQLKix8i0wfy/EvP1kV4+H/1oMvyImAxAX
	NO1EnLNThMso7JuC1uaBcw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010060.outbound.protection.outlook.com [52.101.85.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeswjecsw-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 07:27:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYqnDCHowC7lyJTKeWIK7Z9/QhJddIjKv+k0ourSLuAy+4B+lW5R612YR3iH0XBGqWxFNd83oG/AutEH4xDW/VdzdGobJTMzyLabf8etdp4Rjvwt3Efj43GSCadxeFBtNMnz83P2r+KM25hEGObw0blu/yir1TVr7yvcbvw8dBSTBUzNo4ENqvmndsaz3+pnt6sVFCyqnpFJFPIKEtta++mAPwd2VtgmKxAD72doPuIDK8yhLDZSw9ASmGueMCy+VOb6YxEdVeSeir19qiqnbXfnjC5NetzfcaPS1T6C+R0RhImAOs/e4lBoCHta3h4TH+eS5WZD4jWeOMxHmJg2cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGvnQ7ZRDlV987ywNv1mC7Gq85kaYk1vaikUP3VUHMk=;
 b=LkN1LFa10P4rdYnHzOGoi4i854cSgezbiHaFkVtxdKTAcT89/0twUfr7EtapODzLplpjtQoEG5aVkEhLRsc0nFUu5bS1tp9X0zWm1zAVz9w2QnE2tIC5wTUWEa6au47KVsH/2VFktV8nEaE3bhqNG3UxovRgL+K5b+Pz1VWp+xNFXXF82gTrgXdNyuRCTQufOS6uLvOxQl6BNMmnZphF9cUQ37FDiltduDV7B1CiZtQVOtARPVCjmXRdkXVH98TfchfYHqCS+XrBh+FpTRWATxFQGLp1JRyKldXEpB9VHbmJUGQND0UboAWh0UiMHcS1QYDEth363EXY6Tz0YAXK4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4760.namprd11.prod.outlook.com (2603:10b6:208:266::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 15:27:05 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 15:27:05 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH RFC v4 04/11] bitbake.conf: Include "rust-kernel" in native/nativesdk feature filters
Date: Thu, 20 Nov 2025 07:26:42 -0800
Message-ID: <20251120152649.1128685-5-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251120152649.1128685-1-Harish.Sadineni@windriver.com>
References: <20251120152649.1128685-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:a03:338::16) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN2PR11MB4760:EE_
X-MS-Office365-Filtering-Correlation-Id: 7414a55e-38a2-487d-40ef-08de284942af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VD2mg13GSV+BkuPQ2YxqGzrrx9HK3lNCs7Ur7hdmvSBoicrM8jfe58lTTSGe?=
 =?us-ascii?Q?I/K0nDw3osKj0e3bMpBJ9BzXN86Jn2nC1aNaBzz2CUFhDLMpeEF8egvZkTC1?=
 =?us-ascii?Q?sOvlyYm3EiD8DQrnRX1dJWOqoteoPiqPDYqCJy8GfulgFdaCE/WLNCFS/sn4?=
 =?us-ascii?Q?lXJjgkv1O89SFszbjLD6jZU3LEPHuL0W0I6I2vqeI506Qfj4tD/TmSRnObqc?=
 =?us-ascii?Q?4dXIraZ4iFBVyChfaDnKhGtzt8HKkLUAN/wQ+EIgduW1ZWIP2VOARqkOE881?=
 =?us-ascii?Q?ap6KqWjCcyGfKL5lYmrfwgMkinh2vW/8CXaNfb3I/WEE6/eAebdZsGoBEvwF?=
 =?us-ascii?Q?+uBbDm1gtXjDpRLBTn0ipkc4Dld41VQuzE/T++iqwsS10hu59AWGCxzdROJb?=
 =?us-ascii?Q?9DIrdquEIbK6aMB/EaaaOOufOPbqcKtzq4s76IC2fEmECNT8A3z0BAi/pyqh?=
 =?us-ascii?Q?Yc+3s3pVpetxjn91s+FaHbZM1UF02qLiA0mMn+JP43QlqBaMRnJs6tp9dPy8?=
 =?us-ascii?Q?dHPx/0Z305OSUbpUiP1/jCrlH+MLAJBTG+9GgACgk92/GiiPFbJWXivIIIvS?=
 =?us-ascii?Q?/y7/e8RfR3D8z6clxgHuwiPHtfvekkn65r1ySqX5vHJWhLbB6Dfidws07i9b?=
 =?us-ascii?Q?PoH7O7ZU7oP2C7fKzrS5xTfCSimApB13hNPvEdgxOcp9vuR0aCc8f2Gsq8cD?=
 =?us-ascii?Q?tGq+ZyCNFCa+uqzEss8Y/HW6SjlkVgQmlkep0fjH5Gfrs4p1qX3i2HrB0Tk0?=
 =?us-ascii?Q?AYsohQcEa4u8CK+1BNE5MfeJuvF1rb7Itq/dP5GK97uKubifXkuFglwIIf/N?=
 =?us-ascii?Q?7CVv8/KL+fDtmHn1XFILB1eJ5+1iKO7YmPPjdVVxFm1iOK4VUs0b92IJeSaH?=
 =?us-ascii?Q?fT1Zb+ny/T5kas93IdE8XKpH1s6vZ7Py95YWfhUnkunLlV6KoJAQOKVj+E1Y?=
 =?us-ascii?Q?kwYWBkQ6nOJJRaZVlZIHAK1NZLIlUH86qNlLj43pWI1PmIo/KpMTIgI/LNK2?=
 =?us-ascii?Q?5m/EFpnKBkWw83CRVdwuI48Dc6r18TfiAhmMLQjmekBsEx7zx3o52cSO2PDk?=
 =?us-ascii?Q?0y5fTh9O9RNIZmvArp9IctTFL0sS+Z2irvj6qex2JIuUlPtEDRt3y3Mq6Iqw?=
 =?us-ascii?Q?c/DNayFhBGUn+FVbUKhOdJ+vmGm7NAop1kTOGs3Mh494TMm5dok5wzdZmlB2?=
 =?us-ascii?Q?3DhNjEKs6sUDMBh9czrdmVAUweTbOm06yU2MOsp3iYOmLwUoX59wWYQ+toNE?=
 =?us-ascii?Q?ZGoDfwtjRJug/83YxSn/DlutWGCi6GiOpR7FOV0X7nXJzuTtQfJV/aAOy5TO?=
 =?us-ascii?Q?Dv49HfW0B+CDF7xI45mqeywh+q/ZJh4VyBjlI4B/Tmpm5Ss+7lfwIYVkqbBv?=
 =?us-ascii?Q?vFkJdzXh+zCKIpXp4DTY8mHMZW9I8sc5gNPXkS9/cUSD/30V24md8NdeJg0t?=
 =?us-ascii?Q?08AXINNSsziaOE7/46j1dRHlFW4PakPiWZu26s9CzZl4OVh9/ZoTDcNpWRvk?=
 =?us-ascii?Q?UNUlTrrtuvAJ3NZX+yToJhV8KtjcwbY/yADN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wofB0Z09+sUVDHCS+9GRCgrZSHAFqlGBhsrdRwB5krav3Ba9Q0t7ArFgA/l1?=
 =?us-ascii?Q?tAA9Zh5j9H0xuqmGIJqcsk6c4kajVTbUanoGsxQBkKSYJjxIEvUsGuhVRKPv?=
 =?us-ascii?Q?V3dGqxi5EHSAk7iWHqRgdgdRTtO+N0rzcur/IoE2riJ2adAZQS+rCTtFJYZk?=
 =?us-ascii?Q?kXHQvgU7Zw9XKlccfUCYj3yN716LEjc8LHnYUznLb0h90Ma1wc9kFWln0E0d?=
 =?us-ascii?Q?45PHYlIliFN9PcmoQ84TrAt6aPg5A1FEnwluNyy++GH//FcDuT4y4d3pB5An?=
 =?us-ascii?Q?QuGpwXgksSgxPp6mz3IzUW/ksugvbXxXD2Lay+wCr/0KGZLYf2kniRWfpfxH?=
 =?us-ascii?Q?2cfYEKudbLMTVhQQybiBtdFq+u+rcz9FlsWksYA21FQLTZXHK8cPBkkeau3z?=
 =?us-ascii?Q?PMmAav0rGC0xfkC34+lZHfIhNCKr+urSQqiMAumDyBnypbbw68tB4vwUVJI1?=
 =?us-ascii?Q?do+zlhUdPcV+afGE7mv1H3gttJsc5tw1FMeN6pU8DHZ5L8aMIlUywizupBmY?=
 =?us-ascii?Q?ymafpGqXqiKPChMVlRCUocl+GQXt1aQ4SdCN/bE7eezqHg/6ZvwOKSYEPehZ?=
 =?us-ascii?Q?4j92L2ZjTJi2Gzun+wBVD5XU5IR2bGRfklJ0guf+eiR8fipe+wYPMYGAvWzD?=
 =?us-ascii?Q?9JYcWePp688aSy74Czgk5PqMsgMQcjNNnXBAYdn6AuXRYURAZs62ZEul3ySn?=
 =?us-ascii?Q?6qdBnp9I1hEMe5Y9Jwsmyl3hMhlWl72rHpdO6Cd46BqoeQRqjLMKCHahuGTv?=
 =?us-ascii?Q?Fi0EqvxS4H5zKg5k2h51CpXs0a4yW/f1GzS0HQE2LmDQnF4IYlRdrY6a9PRB?=
 =?us-ascii?Q?y3/7zynzs09plo4tzQe6hpLi2PqhMhMRgg+q24729mJTJTniv+hq/52vgVxT?=
 =?us-ascii?Q?mK8GEq0lxUofcQQXmFG4GmenWY5+WIoGUNPlo2tGu2TModZ9BQkRybPfq8NG?=
 =?us-ascii?Q?vgTCE/sTUeiFGCw/8MipRRqMrTIqQ1zAcjXdKT0B4pq4wsKiYuIpdynESVwP?=
 =?us-ascii?Q?SEVNmLAt/O3LupdY3ZlnssZEppDMztJyffKC7sRL6/8GnqY28jMKZsS9TQsj?=
 =?us-ascii?Q?cgyB1+DVZe93tqPeAypi9K+McMewT/UWynQ7ODc4l1Qgvedxqbg+Uqul/DDB?=
 =?us-ascii?Q?1b7WF9jPZzvm+AN8c0I88/8bLQAGYzwJ7a95wNcaW9L/W4wDZYyWQCZ4q9lo?=
 =?us-ascii?Q?TRREd6ohRCWIUuTvMCoFCfCicWji7cgfMwSvXU70aHEJdZ7DHJZX8yNzGw/X?=
 =?us-ascii?Q?bDvMn9B1umnhOddJEkD3+zHhnUxG5II/x/lvqwcW8QR3jIwOQBYxRAFr/ODs?=
 =?us-ascii?Q?O6zFgQgNIsQsIA19zNqpJYxnuK9x37HGlXCBJb3F7v0tMSEaj0rulariGyru?=
 =?us-ascii?Q?64y24vT3v0AkQ4VovJqpRaiu7hKZhhBORNUe3ruZqQOcgagpAne9pACsthpK?=
 =?us-ascii?Q?+kuP29gqhmv6KGkBvl652npog8XHmmqLZUBjHNoucTtlrpsAG888L+lrZxUD?=
 =?us-ascii?Q?QGXzIjUvuaIoqIAIx3Xd5Rv6KHu+pVK1xOcLpSP1QhUvY8dF7BTkU3R/3Nia?=
 =?us-ascii?Q?JFZrlYcry0NjFLMdzz7H+wtwHS+jhZbrbbVhcL9gDfP8rbE3jTd3D1vFGcGL?=
 =?us-ascii?Q?pRjRNFNkTUg59CmV/hLpG6A=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7414a55e-38a2-487d-40ef-08de284942af
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:27:05.0628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qb4GzA7jCIzFDuUb7HWdL/SkCgZ/C9yGmFvBedpP3v/tmO+Ufr8X+8RfKwvTfNNBNzvrHE/p9ZRr49yOsCt4HeCj+DZTxb63L33TGLK0Mmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4760
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=BqiQAIX5 c=1 sm=1 tr=0 ts=691f334b cx=c_pps
 a=tP1g6Cq6k527JP85+VkTLg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=xWBQjpzubWhZ7YZo0B4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: GR5u4bqyWKUU0tHjW7I4zIhlGOZZJKJp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMSBTYWx0ZWRfX06hmGt7FZ7vU
 O4j0jmB6t1woiS61RBcHoTR/GlLkLhNDWpKphpTqVk1dLwhPlXeG6XTiX7vEXN5hrvTa2Fr/sXy
 BESjayT/yIR31XzdeOuRiqPmQUxnfEHlXty1SfVsFgGWzD13LD65U3goJZcDh+iko+1cPxiTG18
 iwLrbTl1CiL0bMuIOkMIRTAeABjmfTUS191BlpdzCP4piaOPMPQQQrD4Bpl82eW7HMf/xnlKxHX
 zen6zTq7zsRSuZy2a6Af2tkAojRj+LbCeKGhL3B+Qjm7VgtkOtwV3hamrvTo54mghtenc1IclVi
 rh0EwXR1aqduF1uCO/SCMIbRBqMyFBkhhKpaB6LcEHxoaCDvT9cTCjJlVk3fOYhnoQiLJR6z4tI
 IOB9vRvjFn1oIDPQ5egEnKcV0+9RMQ==
X-Proofpoint-ORIG-GUID: DiwPrQvkZvPpYiALPujnaJOXu5N5IbDC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_05,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 15:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226627

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When enabling Rust in kernel, native and nativesdk variants of rust need
to conditionally install Rust standard library sources to support 'make rustavailable'
in the kernel build system.

By adding 'rust-kernel' to DISTRO_FEATURES_FILTER_NATIVE and
DISTRO_FEATURES_FILTER_NATIVESDK, the 'rust-kernel' feature automatically
propagates from target DISTRO_FEATURES to native/nativesdk builds

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5406e542db..ce10bf0b84 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -916,8 +916,8 @@ DISTRO_FEATURES_NATIVESDK:mingw32 = "x11 ipv6"
 
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opencl opengl wayland"
-DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opencl opengl wayland"
+DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opencl opengl rust-kernel wayland"
+DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opencl opengl rust-kernel wayland"
 
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
-- 
2.49.0


