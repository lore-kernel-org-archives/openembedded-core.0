Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686F0CCFA1A
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 13:10:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8996.1762348200477807990
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 05:10:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=flXswZc0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34043e1a29=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A55QQou1582991
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Nov 2025 05:10:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ToGbrvHY4dewHkF8vrdFXMJJoc+T17P/oAC4U28X40E=; b=
	flXswZc0w6iH/ruKQ79uW2ntYBoiSBmg0tLwJmONGLGuwtWPkc/daukwp68DzKHi
	+VMXMqjdInDVmgSia+r2yconFY3Dco+SL5baWhGP01CKMsrSm7gfhmfmZwMkyNIY
	HWK+BYUvvBVRr5ra1trCcDrSWl+acAr+pjVJ84x9dPrcXx0gs1ZGaMLynyXRAJou
	2kq/pJlhO9TdhjLeE5xkNp3vQqpkwIfzluacljqGMn8Cc+Bv4TI4JWxiNcD4mFYJ
	yCZpj8G9w3YvB7vYVYxXglwNWkQD6NaJld/icvkqgMZQAKE/+er48r1KHCC7GRvl
	5cc2ibGDjOaUK3I2L5amgQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010010.outbound.protection.outlook.com [52.101.85.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a7wd7gg0g-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 05:09:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSV8FADQz9CIzLLIdNhByDbIkpyu//XZhcYqGl1owywnmC7F0nZiz7oPn7HcHbpehPkF4MovaG89uIvHs0t/6ViNJRv5gb/FoJf2DrjKo7v2/dhzhxpUrtDmIjLZ5B7MvprDtrnmCnQnOxjCYu/jONzs7l+FTYcXp+vm1e0Ot9BuBmdx14V1ud/JRAi6K9n8SxnbGsepoFY378G8jXgMqXIiOWUqzwPYHF5QX97mm0kYLF5Xte709+DQfLViZiqn80dbFidbfmnnOmXxmH5a0FkJZVM49c8Xj28o5zMLFP+crPT3GNrb1LuM6Nq0wOvxXZrpHzFc8S6HXXwELBi0PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToGbrvHY4dewHkF8vrdFXMJJoc+T17P/oAC4U28X40E=;
 b=ohxIZ5c5P3joMo2vOjFqCNNSj6uh5mTd2mdY0xh8eaKQYTeaXyoAKi472J+Qfmtcsz8lZdhz6gzZBL6ETzcaljmk8cp3qsF83Xct4IUXU0UVFyuZMgL39CI4Km24hD050aHEYgTjb12WuAtCmsf5KZqdh0P8p5D7KymmVKjzPzmwfE4TltY21Xo9QXWFXg1dPlEGpN+KuU0jBnnJCn++IN+PchN+wyFpJq0szSreTXgxvlAq66PcpIboGRfwzKcxRmM0ENBZU7TMuyAcR4gxVtOF+N0RK2CLFWgJ00EMvxlfXIvKcwczbmCM+zn2cxnq9LxfF/wq8Ubpr3Tdd9XxSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM4PR11MB6528.namprd11.prod.outlook.com (2603:10b6:8:8f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 5 Nov
 2025 13:09:57 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 13:09:57 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
        sundeep.kokkonda@windriver.com, elmehdi.younes@smile.fr
Subject: [PATCH RFC v2 3/8] rust: install Rust library sources for 'make rustavailable' support
Date: Wed,  5 Nov 2025 05:09:37 -0800
Message-ID: <20251105130942.833204-4-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
References: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0037.namprd08.prod.outlook.com
 (2603:10b6:a03:117::14) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DM4PR11MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dc5ef9b-edb9-4926-1d83-08de1c6c9e92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0+sUIOgpRCq8yvutAAWr0APuo9BT4qF/AFa66RuUfQY1z3pUaXPJQJJQo4k9?=
 =?us-ascii?Q?XpmTmrHDwJAZsCk6L2O+RDRbKMlXFBiHH6VKhH7IBsBBTW2nho+zgbZ5pwtQ?=
 =?us-ascii?Q?WRH00rdKpLyd/gAhnmKvlmIwuF9OYz7uhUpuxmr4sRhbu1dD8RoesjvXRNYv?=
 =?us-ascii?Q?fKbdX0HmhJAgvIBJmuZwaM5Of/DbL3xe8eEvsaGXdiwez1Bki+eHT5fk5XEg?=
 =?us-ascii?Q?KpwUfBZ95RGjrDtzkBzmidpFpoHxnmwEeoeRsof7+EoxqjCOdq8sF96W07Xv?=
 =?us-ascii?Q?SVBN3v6n0igeruPABRywPuBhItnj5f0M1S05/RjS0EEur96yS4fo1PrLLYb0?=
 =?us-ascii?Q?oaHjsXZMMHCqkfo3nDhylcEKzxaB155S5/d0SKlHa5M5ekrVt8czEUBM/djt?=
 =?us-ascii?Q?+a+Mku+QHxCA1lCxvxVIPhF5Xbcg6/DQ9hIRuY+ZLNpKlcOSAfw8AWG+/Rsd?=
 =?us-ascii?Q?4hVAiOJAQvA+7nlA7ALMDTTYVHUgqHkumixsOIIcpnFzcdeirLnQPdpXuAFK?=
 =?us-ascii?Q?dUv1n5mfN+DOMGWMjQBcaGiI0dQ3T8fxFHAJF+GcKtm9bH76UKTsMcTxFJTd?=
 =?us-ascii?Q?Z1YPKB8T0B8R/1Yd7WcSLSh/0e0gBK3/c+gIPAqNjFJOuB941svnN6C0uhYu?=
 =?us-ascii?Q?bWXbvDWTuPBR55GXB9wwpMmTgWdXbdFMMzK2GATTQaLZtSTWLg+vFkIGNG+D?=
 =?us-ascii?Q?tOsQSoigFiinvNyRivBC7ERFDj5TMmKWZhdELWN5rIDSBPoOS0pFbfqpe2nm?=
 =?us-ascii?Q?/SW9DMiFR0hjg/7lBWkzUeswzJKLThBv1sZ8HvSRZo0tWzkCbITip9EBuYJl?=
 =?us-ascii?Q?fJRwntyKwwFoHH+pfX3vAATXZ067lciQVMDwSwxNmOoQifKAwB3r1dhy+vJ+?=
 =?us-ascii?Q?kbSni+nI5Rth50gzGQb0sIqEVPqm6yltHJzz4tMrJ/D7lw68JPo3jVERqvie?=
 =?us-ascii?Q?HVeDHXMLYq9+cNGpDXNdOriRWBhaaAuPApP+oigiJzwJ/Th+mL0EWbJWyMnp?=
 =?us-ascii?Q?HwsC1wN+vk8n7xPBaL8sN9iKn/GXeEqgSYShjjv0qUIQAZtilGGgg4lYgrPF?=
 =?us-ascii?Q?weE/T71gF9GsBWL1RJ7nwPiL4d7ZY6m914sJn5lJGqPZ+wx0NQd9lmVHNl/T?=
 =?us-ascii?Q?4EdBnn7+63yqg8TPOz7Am0R61DvRc1+oF3YJ0pJKAQ3+7OuT7OR2YwXgOl6B?=
 =?us-ascii?Q?y6TztIw6O5TA3g7I7V4bHs7WGaojhlrGu/bpr/rUBzV7X2leWX9tgETgUKZg?=
 =?us-ascii?Q?HwU6EGgojPiG+/TgwJPz0F7L1d7R9FzTEVebAt2VkcpHTQF63MiJFiT5iqRB?=
 =?us-ascii?Q?NbUNE8ICNagVW0juMCOsI2rFq4cdFIdVVYGBoiSJd8tVz1LlO1n5SvIn8Lfn?=
 =?us-ascii?Q?YQSgYCeNkPHtYlHS1kafpmOeRvJKuzsI5Zd5JkKa8+sva/iB/AQiB9mZWB+W?=
 =?us-ascii?Q?opMdQg/hvV5gEXFD5cJCmAIN1REvVqtXDVLAq5D61QbvItSsoy8CwPmGaPzO?=
 =?us-ascii?Q?EAZWjYUlfqlOGyDLITJ2jIZycCrOmpijuDsr?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TPKh9GRl/ZEUKm7azb4AhKfg71RXNltGp9KscHQvaQsLsUwnovBN37LZS9VI?=
 =?us-ascii?Q?lx7BQvHxTv53esH3YAE1dGUKoN6m8tTAKXCnA2m6qhCwOAa9/dcuKwTzmukN?=
 =?us-ascii?Q?stY+EfbcT0vRzVTg1NxgwCsCorbFoUBrnpCbEO7Ij7DVQFgCOPs81VyjTS85?=
 =?us-ascii?Q?VSOxpQ4BP5WMIS3AFb4MFtyE3pjhJ/MkP42GqhnS8b7oFkBHgENdXxkEM7dm?=
 =?us-ascii?Q?LWPRiRy3uIUwxQlOM5JGgnHRxjrYKXLeeOweg+mCSwZGn5fxJPvTZ/Yg9OEM?=
 =?us-ascii?Q?DskgO9bxIBf5QddIg7Towq1hhbRnpxIh2R73VTx1x5vkkAogRM7hlrGe/MTq?=
 =?us-ascii?Q?ZjTzI/S/2xfOqqLWgXGbN2M6GAqdYnEaDqq1bksiEZ/AIR4LJlduS6EtO01i?=
 =?us-ascii?Q?oYNmnuEHQd7vLjDiNdWfXFXEVDdrTnFPEdpt/Pha6c2fPvnQ1wNJtS6NGhsc?=
 =?us-ascii?Q?Tq9B8Jd5GJ/FFXibuf24dZsB6aM2dAjf0ABryG7WzJV0lWsFmSX3W4T3h7L3?=
 =?us-ascii?Q?bTZgwSmGBqVpC5hMuQtclIYeg96z+h7+2HrFIk9KRANe70UXN7QDOAjxJnAV?=
 =?us-ascii?Q?71fydTWr/G/lUrQcpjUgzoof0uq6N1OLNt3CKhLkZN9ahbHiZXXahlY4qZLC?=
 =?us-ascii?Q?Rk1kwd3iW4CNrTFtzjTiIKXARWX/aNBzryfi5lpDh1V0SQakHpF/bP0weuOR?=
 =?us-ascii?Q?9b7bjZnQ5/vLLFJZ21IKtctLyt5USES+eUUPOvfbKPz8P63QHoGL+46oHXAc?=
 =?us-ascii?Q?xWuanzoPtyjLqF0fVisGfrsb2TuZ4dEWAx9QKzvqXgNR2rPhgj8VS22QGnVb?=
 =?us-ascii?Q?RSV3LWM/jFo7WY8yjCpK/fflP8j0c5epFUj0PtuGM+OUucaK5kDDUGmAJXWI?=
 =?us-ascii?Q?Uo8hpiehNdKVuWktETZhLKUKl01WbHHWOhDn5PSdTJUDUdl+R2Nac0I7xISz?=
 =?us-ascii?Q?hHOtpXEOtAa5Bq4U5REgbE8WQ0yWntYOWjnL7pd7teVrjee7sf2I/huH6Naa?=
 =?us-ascii?Q?oDr5Yyz/jwH7fV8g8ljqHxY6SG4mUckTQ0tcK8rbeN6bwi5jnmkJyqcsfyL8?=
 =?us-ascii?Q?1MnXgPOSslnLYrCbShZdM/aT4LUml8UEWRrOe+vxfH7q2vSLsw3FzvjOfuYC?=
 =?us-ascii?Q?y8gDpl1Jb4OVZ75CqoTtceAh1MgiMj1TTMFfAZSnqY51zlHJt5zP4Mxap9Bd?=
 =?us-ascii?Q?5Wz7kSN+qmzv+dukMZAjYRgoR7h8p6l7WLp9/uyCEvyWKj79jlyChmXNHie/?=
 =?us-ascii?Q?9OKdv5cuBDC1QrkZD1J5SgaxLsZooF/P3vuuHdWnxW/frBxJjkI0M0AqzcVG?=
 =?us-ascii?Q?QJTXx7BXnccETdUH8fAjOcP66i2EXIs3qEno83wxGO38a5OmMBCPhGOtp0BS?=
 =?us-ascii?Q?yWpJ2ggpM2671NY1h/+oCR2AV4l5/JwNdbzk/0OJ5kzkLrxYrWeKDP+16hQL?=
 =?us-ascii?Q?gxF60PV5LKnnTqFHFftqRUYR7sYwYwA64pRab+SyhYjVaTqE6JC2JQuOaSI/?=
 =?us-ascii?Q?kpdIfCoKqGuwyguLA4grzsV8sKZ6D46k1xBsHGvP2sPs35AZNkuv9Mv0UCCE?=
 =?us-ascii?Q?kfKA/LpnsKyedgKjfVx4N4uxPzYOdFF7Aca9yLNuBhe+Rs7gkvppwfFssEFr?=
 =?us-ascii?Q?DliF6LB3t6pqPs4J60esClU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc5ef9b-edb9-4926-1d83-08de1c6c9e92
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 13:09:57.6742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJQKVhUPHIFJugXGYnUyNlx6t8E2JHPBLIIuhi5QjTAbOB4aBxvhFhnldrAPtw5997glvEI9orHHmKFBI6z+qe6mJ4ueymTOd0DAel84fGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6528
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: FIMnOX5cIXNv_wpP6VVAIhnavzl7nVqe
X-Authority-Analysis: v=2.4 cv=Dacaa/tW c=1 sm=1 tr=0 ts=690b4ca8 cx=c_pps
 a=wodMs23R9wL6gmOfRTd43Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=QeMy5WPdU9dpobuweN8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: LY3wlx86pttVmufvPNIbFF3N7CDHcGGG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA5OSBTYWx0ZWRfX+sL/HOvPjuTH
 BPFtPHRHsYvuuQ54eBF5xuvxxBO322Q88Hkl9ME7g+KW/sK8asplWM697tVKWts4C2q2/3UtvK4
 1QQNeVjHlI0YSKWDIWSUgoHUKLuZtadQ6ViX0N+BSZgwZ27fCnDI9UGPLduOrSndKnmkwrnvCtm
 1X4qbX3xBk0V6caEAkyss4KVSq3SbpQ4otM0XCLXHV4RrMQFCmAsprEji6Yu2Il0sjnIl5KzoEW
 hW8TAsCW0Eg0eXL5tonnwae0xeQ4+BodhAZnb19c/FZlC3pzja8BlAPex1a9XzHZJgIq+890kMl
 Agqbjz3hMORrUFGEYnKzCJPmYTYaDbW9IXapVMT0OMQhdt9m4mZiVOkVZKpgQK18fABZUPJzcXb
 Of7Ts3wZDtFSTsvBC6m6Vaom2abNCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_05,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 13:10:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225761

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The `make rustavailable` process expects the Rust standard library source files (e.g., `lib.rs`)
to be present in the `library/` directory under `rustlib/src/rust/`.

This patch ensures the required sources are available by:
- Copying the `library/` directory from the Rust source tree into `${TMPDIR}/work-shared/rust`
  during the snapshot setup.
- Installing the `library/` directory into `${SDKPATHNATIVE}/usr/lib/rustlib/src/rust` for the
  `nativesdk` class, making them available in the SDK.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.90.0.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb b/meta/recipes-devtools/rust/rust_1.90.0.bb
index e7f3985332..857d679e2b 100644
--- a/meta/recipes-devtools/rust/rust_1.90.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
@@ -54,6 +54,11 @@ do_rust_setup_snapshot () {
     # and fail without it there.
     mkdir -p ${RUSTSRC}/build/${RUST_BUILD_SYS}
     ln -sf ${WORKDIR}/rust-snapshot/ ${RUSTSRC}/build/${RUST_BUILD_SYS}/stage0
+    
+    if [ ! -d "${TMPDIR}/work-shared/rust" ]; then
+         mkdir -p ${TMPDIR}/work-shared/rust
+         cp -r ${RUSTSRC}/library ${TMPDIR}/work-shared/rust/.
+    fi
 
     # Need to use uninative's loader if enabled/present since the library paths
     # are used internally by rust and result in symbol mismatches if we don't
@@ -318,6 +323,13 @@ rust_do_install:class-nativesdk() {
 
 FILES:${PN} += "${base_prefix}/environment-setup.d"
 
+do_install:append:class-nativesdk () {
+    if [ ! -d ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust ]; then
+        mkdir -p ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust
+        cp -r --no-preserve=ownership  ${RUSTSRC}/library ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust/
+    fi
+}
+
 EXTRA_TOOLS ?= "cargo-clippy clippy-driver rustfmt"
 rust_do_install:class-target() {
     export PSEUDO_UNLOAD=1
-- 
2.49.0


