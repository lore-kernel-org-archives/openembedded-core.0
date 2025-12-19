Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DBBD767D4
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 11:08:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14673.1766142512380490355
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 03:08:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nb5wnuk7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4448c0fa6c=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIMhXa61863468
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:08:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=mKjWP5ePordwXBLb7rkhL2ZOLgQFPg1Tv1aHqLTFvr0=; b=
	nb5wnuk7HhcqAp/LfMhKpUSeC1EBQlDHyrSPWsb3ESMJ58OuPxMG+M0ZJC26cszL
	qVgbEKWIISEPq/9CsblOZROBqje4+iEjbJZYbpMKVvFy8vgWFadR8trTjobcVkZe
	FiGyjZD5y4BeOWRoA9ge+o2BUBvTEHjN7lnt8zl3dAWLw18TojlLxLRjq35l85hr
	gsUOFSTU5NsLNLqmfim5UfFv+aLF9i44g/mRbUp5d2wazfcdDC9q12OlzRllutx/
	h/ND5F0M2XkEx8jGqnkifFOa69iRE+pj8UEI8j3nnQwzTTBzCNaYpyr6vHv5qF/l
	tmafNSn/kAbmPnJuTuUWWw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011046.outbound.protection.outlook.com [52.101.52.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b4r2urre7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 03:08:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QF9+9B4XwOGxj+giECNM58JIUBcZZ9qpp1xxdJhOw8wjNO0yqznFpFjVbu2h65D2qki9jR6EokkruzfM0U+ecqxmnVjyOOOfScANbCq9WZQM+IkyoEC1j4IH0xibaKOPF+AdaXVRozwUpmI1Z/giOLqfmIm25WkdkNP5XUkfu5LNngxBsbGGiiHcV/cPwpyRWiLl+M1mFUKOLj910pVrubRiNqashIKMm99Cj5u1q1MQTXGnERGx61kekEUNFvTRE645PzNLARyxA//vA2HLhDKZ+zUiJ2YRpZNuzAscMmti5tctAFLGtgSRlgbAXe5LMXVDFhZssPFq2JD5ZKK4UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKjWP5ePordwXBLb7rkhL2ZOLgQFPg1Tv1aHqLTFvr0=;
 b=Myx2dWQVDCB4LiOrgIDjdFLXzxI2wO/LaftLSDJvOjlveJFYVVZzR9n0VMygNCN8wicwP2i0ruLbnXHOTzbldAaXT/l1fXYzR4kZRw2L0hOSZSVOFmxP0RFkQMZ5QWb0+0lm2Utxou8Ex5nxQ8Xsh1QIQ4Lj854Xd5STrhEZRMp/KU/iBsINMIXnlYgVdR9UMLbMd3dZ++Hu+uUDedR+TVtUsKFvBkVBJD66gRdIAb09p/9Fg7zjfLYWkfaMc7a2SUuVndKM58kcFP0wsTz/ZMTXDIVTfXxU2h71R+AxwN0cv0egT9xKJho+WweIiGOK9gyGnl6VCnghe8dqM2Ez1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by MN0PR11MB6060.namprd11.prod.outlook.com (2603:10b6:208:378::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 19 Dec
 2025 11:08:29 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 11:08:29 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Sundeep.Kokkonda@windriver.com,
        sunilkumar.dora@windriver.com, Yash.Shinde@windriver.com
Subject: [kirkstone][PATCH 2/2] binutils: fix CVE-2025-11840
Date: Fri, 19 Dec 2025 03:08:10 -0800
Message-ID: <20251219110810.1758148-2-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251219110810.1758148-1-Yash.Shinde@windriver.com>
References: <20251219110810.1758148-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0019.namprd10.prod.outlook.com
 (2603:10b6:a03:255::24) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|MN0PR11MB6060:EE_
X-MS-Office365-Filtering-Correlation-Id: 269e39d1-e38a-45de-085b-08de3eeef0ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2PHBvqf0mF/9IYk6GMySar9RgmI7YRI3yI02NTHcM6nnE89AiKkg45XsM0Ql?=
 =?us-ascii?Q?nAEwZ7eqnHoKfpvOXjqncBihA5PZf+SLnrnoEJ86YJTUycUDGiGhUjLFqfBO?=
 =?us-ascii?Q?x0aUDYdejxQjgaH+tRtUhvy3EGDo1rfxfh3NSE5gBMfy1L8hM2poGYKiLfki?=
 =?us-ascii?Q?HgY9354fvfYjDl0SVU78b97F6KsUG2U9ZVdmD5JdFbNGgejYxn9TWQ7YGpMJ?=
 =?us-ascii?Q?Ax7M/oMGBK1pm2XigRc75YYBhsvC+3J40uLXqL0I8QGyG0IHZm1ddylWI83P?=
 =?us-ascii?Q?FXumMf5nyvG3IaIfPLW93Shqh0Gn2dtISxMSsc4EBaR9dKFrcmwLdUVLm1De?=
 =?us-ascii?Q?V0sGULZy8XW8NvSZqq3GK74xuWtLX/XyUD6sB9KMN8yRULBWln1oh0wss7m+?=
 =?us-ascii?Q?BsZXm1bJbEl4r/rWg0TFvp37dLJpPEqCgjxgdaCtaV0YuZ60DfC2kzh8ciGk?=
 =?us-ascii?Q?FpdhaTA1lrGmhrUEn1N6M5l9CKTwuMrcDN3n80kZEybDy7OwMb4wzbN64fbA?=
 =?us-ascii?Q?osYguMxz5sQ0NqiGj3Ix98cgVnnSkUoUJW8LMtRbnYn+6aqXuQXMkxTxZrUb?=
 =?us-ascii?Q?P4cZycNUM6s0hT/ar2mUBc1BLlCidbQAUJIhlg58wNR63T9Xxd9jTks5MUse?=
 =?us-ascii?Q?o7QnwN60h4xi6zEp6k+tRC6A239Qtv+r9oFRG2AzAyOyLypFkCVet3aZfSyj?=
 =?us-ascii?Q?Qt8e+W/i4K12mjAWZeNayGE2vln2HGHegMIWx2flf+XPIh46bWCX/x8pDbwF?=
 =?us-ascii?Q?iP68PcX2Z4jllBhcwc5azLK4BYdp4st5f20GD8vxewTHm8U3c4PTwJqPgl6o?=
 =?us-ascii?Q?x7rbaL5db+OZ1h7AHzeBQROlB8i+qhZArAuZKWTGO4RdgdeHurf3bPxM8vc1?=
 =?us-ascii?Q?UROw0VrnW5I36K93Bx3h14il4HIOIgDYTFm3CcE/p2h3mRh/VRp9EhmINqvY?=
 =?us-ascii?Q?y3pPyHHVVE9OAKgjYlAEwfTJhPMmBPoRKnoF49pbJPdjuOzf6gmRIPqQ+8wF?=
 =?us-ascii?Q?DeWSymBxhhiE5m0n1hRKXHqdj/K65WChYsHAGxqwfqVn/alcP1F6OWASW1s/?=
 =?us-ascii?Q?upC/OVqbdL7ZWFS9wM15qeXxaJxDLOUufvVasTT8X9lVRux9zlr/RRi94o+q?=
 =?us-ascii?Q?NYhWiJoDq1P5ZBUpgqgGV5NNAl9wypfgODnj4t+Pj68x2G+hUTt38UVJbKGK?=
 =?us-ascii?Q?EdkfQGY0xzGwgl8io9VsI68YttXoBwPWDE+lnzTxsUXtE6uWFynT5OKwjAdW?=
 =?us-ascii?Q?PQnTVZT0dUYVLwfz3GDgo7MbfRSYjzjR2JIX/oY1pm81W42adS3GMLvnor0/?=
 =?us-ascii?Q?g8ZjFzMw3GBHBTRUpdQ/wsQxkoWMN25cJAvPPaSPYK90f4zGJpKk+hhdswuo?=
 =?us-ascii?Q?OrxXADXJttlW1jhE/BBNa1URsoV33A3fqd3XGdugjZ99DTt2PhfkBoG/LYvz?=
 =?us-ascii?Q?d28DVx8PuZGXA+PvmP9B6MqkDT5+2nZkY/1IUo6jaaqTEcVarBdVUw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U2uN9djTA0L26n6st80D8pt79vR+OMY/K1OMKNToXMwy70w0X7pKtmzx4Jxx?=
 =?us-ascii?Q?IKSd7KOsAGEPdaMfMhaxOlN/uTuFPbfc9SZC8ylkrVoGEEEep+g4t7RvHhVf?=
 =?us-ascii?Q?CAcJLvrUfUtolAMKXoBfoO6FCEOE+5QSBcFZYljd6xr7Z/SEG7G9qr2gBeY5?=
 =?us-ascii?Q?/9UXmCGdD/+ev4jvmJOc/xX5p2VJq8H9yFaSN1uZcQUV+7vD+XFi4X51mD0+?=
 =?us-ascii?Q?p5dGfy9FsFIwnOOorjD+yzrxFZNQVPt0U724lK0XgMxjMxwLtfNGv4RsZx8i?=
 =?us-ascii?Q?/NF6SXOjoMWqByN4L7jSDVoKjahYBcQoHhIhre2Yb7cVPSF/gbKMDoKJJ8E3?=
 =?us-ascii?Q?+bhm6qoeS4psAKRoXKMa+QN5yfWPUa5e5oB9TC42K9bdFAsdYC7d4fd57hyt?=
 =?us-ascii?Q?vk/5VpPIqAUz5n0NVUTgtIxRd1wDY3p6QW5CSVZiBN1kXT9kTRn3YDEQSDw8?=
 =?us-ascii?Q?y18+coyVSdqbuSRjSQLAghJYhsbUCmdqXb8zSfWcn9+pPfi9tlKCjsW7CE2c?=
 =?us-ascii?Q?kreMsb8aZMyLOIpdEJCoNWh72dYreHGO0l4g//tYT6txPpt2LwQ59NnxuR+S?=
 =?us-ascii?Q?w4W120+Riq9YgepD762IP5a+uQqKFsySYB6L7bh8D5lDwHFbhX0QQzlySreQ?=
 =?us-ascii?Q?a0Srnja/dWZTHd+moWPYxTwCsCAd99XEnz+mqbAuQPzXCbYSbL45LWlDk2d/?=
 =?us-ascii?Q?OCAwyP8CHgHMfMMSyldOKEa50jXiisapDh6vD6/ssGkSd0mApWc6xeNizEPE?=
 =?us-ascii?Q?oD7a3Uu9lPufxiR2TkVDE/XAwV78VDe3InVxAfAOXHjOS+6x4A4YhA3cCP94?=
 =?us-ascii?Q?lB9I2RgiGQ/dlXQcOcavXIV3lZ5lBKVTRTH1/gEoTOulOMWvrNOLlnIQ9HiN?=
 =?us-ascii?Q?FaeVzRs2/apn1kCYxwakeLHIwmy94Ee++33IHPN3QRXrmQPzv7QqwyTk46Fj?=
 =?us-ascii?Q?14+Qi15buujvEi7hMQk2v2TS7K97o022GaiURv++QuRbK5G4kXXgEJmeh8P8?=
 =?us-ascii?Q?qbVx2DyUSAWKZKQ3nOdRBBT+5dXTGbfk9+OVmn1IyBmjh2ckybTK+58kR1S8?=
 =?us-ascii?Q?BRaGFOtF6m/d6s4lNiijv/SBO9qSeoB0O+zmABPqXQ3x8ml8XOFdO5d3iUFw?=
 =?us-ascii?Q?eLi6hrRFfCqtuaCFZkAb0+LmXHqZMmUjI/ATPiejYWVu0eSjGqodIIxlWtZ4?=
 =?us-ascii?Q?BLUNvFHBZYot/E6g4tOlt3Vs0ZbqYNcUrd2WKAsKSL/MSsjU3STLnBY2Y3h1?=
 =?us-ascii?Q?s6vYMhdQJ1QGErEohcXl7ao3f9uUr/qx/S5RhKNXPEaIFEYS0Z0SRCzgtOqu?=
 =?us-ascii?Q?IV3jZpC89kULMLnOhNmAVHBaO9GGGuZC0FDmFWO9kqRodjCiQj/wAV8/Hqwc?=
 =?us-ascii?Q?qpx0XfakzJs2NLihska1jnOkpTw1dPhBLy6V2W9sVzHTPaufWjk9mjb8zEEx?=
 =?us-ascii?Q?9sVEI96fQ+2f9WgZdExFdDLe3naKzUbKZ3vvGjxk6N5gD1w5AIcGH5/Xf73Q?=
 =?us-ascii?Q?uUjVy8gFi58tqgcSrAnRK6grmfNTrlcpvZFToDYVbI6lF36rnBcNskzA32Oh?=
 =?us-ascii?Q?FDNU194OCHDYqDQbW6SK8GgBcRsABeRt153+WVpmDyWGRc6hSjCVI25IIxmz?=
 =?us-ascii?Q?YA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 269e39d1-e38a-45de-085b-08de3eeef0ba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 11:08:29.6406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t2TA7M6PiqTEXKOQ46EzYvghyNJPQRaeC4kHy/I8dUHImpAPOYLkiCMi0zoHlJyl2/W5NP6rQEDXvM2df1NbQ69CeoSELLaBRrPfmfPrMhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6060
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 965C2gnQOW3soJ1mtC5sjJLWj7_dQ6Io
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5MiBTYWx0ZWRfX9AN0AyCc7Dyg
 JV29cnQQHanBxsVNsYWgz9VqnrEKectser9Mbgzk9WS9JT7l3hTuBLP2y0OhhhTfDFvlza+h4Iy
 kn8SghE/E8Ez6lszYOcRupsSUnH9e46Akulu+Rn6VLUuuv0iC9ZaXGTb3UYHWorlD/gzir9qIgN
 SvU51ZUUcDkGkRuZ6HWkX2M2IXDNGgCFFqPAROXzht44B8bZr61zc55kvCjV/sBmKfX14YFiLmY
 RX8kM7riipTNcFu5meSJusT/6iaz9tNwEqFVcb8bJR3VSybRgRGFGJUkl9+GBSWWANitp+y2FKt
 DM6YnuFTz2ilNMPv/573bNS7NSbCQnEbXhKjcowYKfdzuQyDRlW+tjWKLslcm0b486BHrHjC3vA
 Sblcb5UD+bLtfqpB7yA7vqru7K9+w1IgAPPIZJB7bv9l+IFNbWtrFNSpFCTC23RYT9V2PEpQMw2
 2PyM8edXF2hvwJMNSNg==
X-Authority-Analysis: v=2.4 cv=H43WAuYi c=1 sm=1 tr=0 ts=6945322f cx=c_pps
 a=bbY6CEmM+CWjO+hqT4zsvA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=cGBbg9qyOBkjoRYc1MYA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: E2BzSbEojx-zgWemXX8zY2n9PW1A0VpI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 11:08:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228211

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE-2025-11840

PR 33455
[BUG] A SEGV in vfinfo at ldmisc.c:527
A reloc howto set up with EMPTY_HOWTO has a NULL name.  More than one
place emitting diagnostics assumes a reloc howto won't have a NULL
name.

https://sourceware.org/bugzilla/show_bug.cgi?id=33455

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=f6b0f53a36820da91eadfa9f466c22f92e4256e0]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0050-CVE-2025-11840.patch        | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0050-CVE-2025-11840.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 426c00ce3f..d268880409 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -88,5 +88,6 @@ SRC_URI = "\
      file://CVE-2025-11413.patch \
      file://0048-CVE-2025-11494.patch \
      file://0049-CVE-2025-11839.patch \
+     file://0050-CVE-2025-11840.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0050-CVE-2025-11840.patch b/meta/recipes-devtools/binutils/binutils/0050-CVE-2025-11840.patch
new file mode 100644
index 0000000000..3fb4db880e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0050-CVE-2025-11840.patch
@@ -0,0 +1,37 @@
+From f6b0f53a36820da91eadfa9f466c22f92e4256e0 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 3 Nov 2025 09:03:37 +1030
+Subject: [PATCH] PR 33455 SEGV in vfinfo at ldmisc.c:527
+
+A reloc howto set up with EMPTY_HOWTO has a NULL name.  More than one
+place emitting diagnostics assumes a reloc howto won't have a NULL
+name.
+
+	PR 33455
+	* coffcode.h (coff_slurp_reloc_table): Don't allow a howto with
+	a NULL name.
+---
+ bfd/coffcode.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=f6b0f53a36820da91eadfa9f466c22f92e4256e0]
+CVE: CVE-2025-11840
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/bfd/coffcode.h b/bfd/coffcode.h
+index 1e5acc0032c..ce1e39131b4 100644
+--- a/bfd/coffcode.h
++++ b/bfd/coffcode.h
+@@ -5345,7 +5345,7 @@ coff_slurp_reloc_table (bfd * abfd, sec_ptr asect, asymbol ** symbols)
+       RTYPE2HOWTO (cache_ptr, &dst);
+ #endif	/* RELOC_PROCESSING */
+ 
+-      if (cache_ptr->howto == NULL)
++      if (cache_ptr->howto == NULL || cache_ptr->howto->name == NULL)
+ 	{
+ 	  _bfd_error_handler
+ 	    /* xgettext:c-format */
+-- 
+2.43.7
+
-- 
2.49.0


