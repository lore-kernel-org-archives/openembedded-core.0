Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9878BC61DB6
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 00:46:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11826.1787618774815239493
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 17:46:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=A1FpUXzQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P0iiUf275106
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 17:46:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=AmDvPiC+NnbVFpQxVSEZFhxxvRk7Q1QdqhZ7MAKMOtE=; b=
	A1FpUXzQqXaAp7m2gpuDdfmj9lXpG7FvuN8QZa31JNwGzWcfOh2a8jTJrMRrdtph
	l17sD3Rdtb6Kvs0v3yiMAGTu7BeEA6h/V5zqqNSsOaEVyCV1tLzKOZWGaBYQBOPk
	FaZqisZbTn14xVdYqIw336RI36h+jdwCj7VwD8Xx0WGUtOxjd1V1QV0RbijIRYyJ
	OPANlwgwVkZMDyaaIFwafHKjoa5oHRwcITBd2qVENQFBZa1EHF7FRwGi9Wm5eJip
	PtwZ2mEld4IyGQFh/HnPoCBAUuRxmPucSB1+Bh3eG6UEGIEddy/vgcJzpnVka6oP
	FdKyyRoRWwx6pnfdR+XaxA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021075.outbound.protection.outlook.com [52.101.57.75])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7b9gkdu9-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 17:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gyJUbviejnv4sgQ19SfOZ7Dp9CSXUjJ7RbKkIXF2YGwAO3IX5D4AGUQd6kqKnvKxIUlZ8oI+dHnbIaSuXBCPvZNV4c5Y7P+A9bTeQiYU6ldfrS9lEP9iUrN49F4S2i9+kD5sxb6Sh3L6UtXIgX+NkDo23WCUsE4h/AhQjoxPstPSWa1t7qn/lLQfkBBRWoIa0j+7PX1D+04bHgkE5cLelD26gLO8mJFrCgF251n7wXyP/OfF+ttzTgSFPxJxM7uB/BYEhJd+GxrsiJqIxUSNI4iH7ZbZv5QKCmQjkHEKhraTSUUr1vg+mI2LoFE/KnrQi1tNOQgVhK47t0h+5yKsKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmDvPiC+NnbVFpQxVSEZFhxxvRk7Q1QdqhZ7MAKMOtE=;
 b=Mg1Mn/ycmOFDQ+usJ9f3ufdi/5bYPByN5Le/4/i0A+PRDtn3jPCT3D2LOmjU+UvHYAoPK0LhNCLhKHqXVc0oVfRQc5B1eVzJ5OLWfIwAYgsgX51lGFCfqlTdxBBiYVAz9OzsFvOjkZUPFBV0VGSxzJ+wskvGk8FwTWU+NOAw0+dyiRCgleVv0Zt4DwMF7Lb99ajouunLDmEj8ckLc4MFTF1E1X+SHK8jpve2+EtiQRkvAhkpIr05APHV3T3wm7PBHb1fhV/FstXZP12ePtd96UWYi2cvgAqQ8g1s3fcvVfzl9IvKWRyAGnF4SXBNhLfEYzDuaGPJkzLJQ4Kq7dD7TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by LV3PR11MB8768.namprd11.prod.outlook.com (2603:10b6:408:211::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 00:46:11 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 00:46:11 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v16 03/14] lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or musl
Date: Mon, 24 Aug 2026 17:45:40 -0700
Message-ID: <20260825004555.4111831-4-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260825004555.4111831-1-sumanth.gavini@windriver.com>
References: <20260825004555.4111831-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::32) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|LV3PR11MB8768:EE_
X-MS-Office365-Filtering-Correlation-Id: 197843d1-6b97-4aea-5da8-08df02424233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|18002099003|22082099003|56012099006|11063799006|38350700014|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	aD8pCMs+FuVdghjugMA3dTX510hOLXKCMNzReN6alNj8d0vNNQzYk8N5ea7dAKsKbKAmGhkNxQXeyLjBuOSeGJac6mesc7I/+Lm64UdHQlZEwtpr50xmbBz27HbRVdZQQJ+wUsAPnYHz6QxLjWApmK2tgcM7iZGX6LguDHqEdr5/5SphkWe6GLkreodyHMjUPWQvFj6JiT/qUci3ExriJQ0Cy1nzHjFnCjD/uqCo2fbThTzrr7sa10cf6Sp8CumXQqAnrXwPGYz5K4cikt1AeavjmaJDqbACw/4Gvohs/8RKCnikE3ZtRhHhubpGfVxi3alZu9NGwvkcIn1Q5bacSmLQ11+jKqvWDhY98fJtWJL3dpYA43HqggpyZhJW0rEOYfLOSZw40b5MIJ58+lV5rn9BSMDITYwSg1Z3KigfwXKrAprgWCg760J4FG/pn/v94Cl66Db3LL19ZGCO/nH7b2dREq7Kh/0Ae+u3iXw8t58ZlAJQiEZ8S+1M28bGCsanzd9As5bITZ7HYxWH2JJfVI9A9/2CDRBXY3oaDLbQgdkgGNT7GC+QpZlCzTin5HW9dGVadwYr1U9ZbrELpJ5jHuyvq/Rn92/bYx6py3/BM72MJzHZGroYsoW52NtlvV/CAXgK11+S5N1rRvGmKVhCjFFHLVGL9ZMcaZsyBuXwO+UW12XpUk2SgquzihWkR9ULZ3ytBA+LU+dRmLo/3HhM1iqK2SlkgFQBC6bkvl4ZM9c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(38350700014)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5ATWPEVjCyRZoCibw/TZTpaUKXdkz5Uz3+WPONja2MlJmNyX4UPK+Vl+Y5jc?=
 =?us-ascii?Q?Zs19eRxqJ0Bb2xq5baPDDH8PHYsdFZVPYvN8ij99WjkEjDdVnK+QxUZxoTS0?=
 =?us-ascii?Q?JQpB/wQWS303kFmfbpLCP9qKP2LMCO8Q9UtbhAMy/z9AhI8YQbjuq8DDi8q8?=
 =?us-ascii?Q?1BOTpYdkdWkw5fwAi48BckTu4xr055VpdhCyPtmfV9RbBe0wovid5sN6gRI/?=
 =?us-ascii?Q?wvbVgQbIkdv+qSXXL3Rd8ldBY1sdM8H4JfKtVefA/fBX9JsNO8yVHJoEUeYf?=
 =?us-ascii?Q?zK1FWmU8vkU+qL2VKTH6/eCsIuPuFVTM6j9L5QEX13LL5ijWB8StGw1LEQSy?=
 =?us-ascii?Q?CBztxmEeXWIagZlESHrWSpv7tJux0IhMUC5pr5eVk7Cy3dn9/tcQ6Wtsr5w3?=
 =?us-ascii?Q?Kl5/SP0NUsb8QCN5pOQbeiq+dfee+4xTxwRAAw5XDhSKngYZTqWqDrW7zok4?=
 =?us-ascii?Q?DKHKc20J2FQ22A07yMMLHqs7JW5tbk9w2heVvEdF/rqNXy122P9i668yJkyw?=
 =?us-ascii?Q?3f82DcqxMhfRVsJadAZzdoTcQCoS8K9ASK/Cr/FfsFClcPcZeWt6VnlH07rO?=
 =?us-ascii?Q?RqCOIcTMSE66cMUg7dwiD3N+zh2JdUv58r0V59H1SOSix5oAuZWGieqYiIxZ?=
 =?us-ascii?Q?ghKXslhQLRJQGwsS63GVCQEsti/xvBrRZeow9PgX7J/f2bnabO9L4DoPYMVL?=
 =?us-ascii?Q?w0CxVoY65fcwVtCzS8P0V8zE2Z8ycRs1jcfhkTe17Zx7RfZ/B3ltDtqsVcJU?=
 =?us-ascii?Q?4mbzAA4VhVnPwI6sE0rkqbpZA4cvSoZdmO6/LXqPjjI1bOP/cyMEytNtcg6o?=
 =?us-ascii?Q?TJ4TjjbO6RqmihGiV3qrjxKP0ThAar2nbCEw9WZlLfPD66zQXNQgzpLcAezS?=
 =?us-ascii?Q?0371GQmV+Rrlf4D8M7rZ027oDZUTphoBfYkKTpOZoeswUfuOD+dEYzwjhRdc?=
 =?us-ascii?Q?3bBtJhq38LwYNtlyrNaqUIcW21ZrmDsbl2UWLvwIipKCOnuJjXvduq6XmMNh?=
 =?us-ascii?Q?fN5X+VvLgb5m4eVCEPPb03E62CO+NV3+Nt+czxZxD/mOD8BTn9l5/oTjWUk/?=
 =?us-ascii?Q?3RFoI5ot+/XZ+8sKJS6UQGHyHA1t9+5aKZoGHo/S9Ham4fGRE/TIQI1CCUJj?=
 =?us-ascii?Q?zdEks63pj7s2wp3+6cKZWgJ6W88ezhxWr6DWEKJBMlyDf061WKDNKnX1kXy7?=
 =?us-ascii?Q?8Ea93/o60NdUfbKOHlh5cVAiWN7UcXCPHd8wgcrJoIkp/gxn4OO3lCQUbYtD?=
 =?us-ascii?Q?T1VgFguT/w1FvEvP6av9iC72CPDbrwMXdJrb4U4JJih0gPYbTbDDJppVYE3C?=
 =?us-ascii?Q?Oehbu5fukIQdSS+F0RSwMx21R8oISuDmqE7U4BPdwae+1w+OPifGL8TYHbCV?=
 =?us-ascii?Q?krjyGPngVVYDW9AgWT4/d5/FE7lqCiXs89DZlGLHQxWKkdoklA7DpqGqCCGP?=
 =?us-ascii?Q?HAIqbl1tOLIhGh1PXwXu697TpzHzTd+C3dI/My0yr29pbMnKqLLbwQu74S/w?=
 =?us-ascii?Q?XPHegLrS86vFK7gNPZE2UJA3Tjg3uyM7PMo6KmPxEcTkH87Vyd+kr0gsFDpY?=
 =?us-ascii?Q?o/7gAQbIxzgrotP1slttysqxF14rcsJDe3uzEz2ELJ5w/+lqO6bklOX0GhOV?=
 =?us-ascii?Q?KrTDoRlvAiJBYdjH0eUe1hlnPuqMYwAZZswI7ZNpozOFhbbidKvOTPUBjovZ?=
 =?us-ascii?Q?qeMLdSed3nOIS1tvSvRoCtq6KNMQ6SPqvJ/ColORZBIh7v1xxyvpIaRNW5Kr?=
 =?us-ascii?Q?tG0GshsgBtsWoOvS0p02mCxqSYM4GZw=3D?=
X-Exchange-RoutingPolicyChecked: 
	1GgrkDHZDcH/u6W7mBSZyMZX6iGQFAnsjzZPUqZqI6VvAajcucJkBNpwO7AWPWw9oHWvHA4rAGSXhPR599cbDuDLg78JZvp8uZoijhxjs+aTN7CZt8Z9uPCqIHBT9B/EJYH1i9OF/8IrG7SWN2iGl0726eqHwh9OM52mnkCrBYM6esdghkwdyAhhS4Ap7KdevRPD7jQQ4Oo77je3F8FGnGNA02PePbV4TeJ9FdoQmcg5GYSEUTjnIBzkoi2DkB2GqLgw6ASm6zGbU4meaCkff/jWt/IHAg50MQeUR/q52nEO9s65h6WIk1iXtwTRUYdl1cNYw/ae4hqwrspiuIIOPA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 197843d1-6b97-4aea-5da8-08df02424233
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 00:46:11.3215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fZhzMCd5V97Ri0ng7qtMovgNl/QloKI3AFkkZD6bYlbsVp41GTV3g6903L08nP54PwH+6SJyTuKE02NOLkioqvjna0TlryvS1qZMoggI0TY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8768
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 3ekc0gRdUvjorjaInFmFfslq36QKQ6do
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfX/+trIHYBYIpd
 Hbn/dE7P1xvBFgxw6QMACxzoJqWkMxM6F8BWYlPA0GuJdnv8aOL6uTdJVkuVOrCSavruzqO4UHd
 4gKuZUycT4TnCgFNzr8HM7p+VxAvhYyfWyHIAGnXu1OL5XI5MoCf7l/m+cRsMg3GZFKDxZvqfUE
 9rfaZ+t+U0qAuewzTiDTZ0MFF9UNpuY0umECtK23y0SSugxJnc/CJnDIm7m3qjCg8KxazjMMXtM
 HuSy5FTSoZ93gTR7noEhV73YqY5D5+RLMjvCzaBKCsiuBK0ZcO9HuBacxZLMDTuKxzx8L3hLZkF
 jyTyXZJF8QsS1lHCl/NspICYd2t6TGVuZmKMCHt9MXPiq0MIjfQQRL9L4/MubiIBfxa5i32lNgL
 uVzu9O7zmWBDQwT7TaQylDnOHDTYk3mm7Pm1TXn61iAkk6FbPOfQW0DM9bh04SxfkAWkmgrq39I
 ppWYKOpGkkdDsArr+MA==
X-Authority-Analysis: v=2.4 cv=LtaiDHdc c=1 sm=1 tr=0 ts=6a8ce5d6 cx=c_pps
 a=aQ32ZPuKfpH9dcZYVOilFA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=YcdC0ctDMGJcGoIPl8kA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Ev7cxNpb_4ujfCdM6r-2xQ-PMU0OuYBt
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfX3xbSFY3ZOoWg
 bYCff8h5HzJ80jKQhZQa2HXH/6w0oB6dJWSDQ2K6BjV8jXP3QdZQIm9GsY1VknGR45DWvn6ikEk
 gOde/4hvdvyIchsNZ7XC/9OraCUEMpkwVgv2jigMNHoqWHi/k5Ov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 00:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244159

Fixed:
$ bitbake core-image-full-cmdline:do_testimage
%post(busybox-1.38.0-r0.x86_64_v3): execv(/bin/sh) pid 679
error: failed to exec scriptlet interpreter /bin/sh: No such file or directory

It is because busybox and libc6 depends on each other, busybox' elf files
depends on libc6, and libc6's postin depends on busybox' /bin/sh, the do_rootfs
works well is because dnf-native has set RPM_NO_CHROOT_FOR_SCRIPTS=1, but it
would be failed without it.

In rpm 4.20.1, it let the installed files' Requires win, so it installed
busybox firstly, but in rpm 6.0.1, it let the postin's Requires win since
postin would run immediately after the files are installed, this does make
sense, so it installed busybox (which provides /bin/sh required by libc6'
postin) firstly, then we got the errors. I couldn't find which commit made this
change because a lot of files and functions are refactored during 4.20.1 and
6.0.0 (not .1), I also tried bisect, but failed because a lot of do_patch or
do_configure/do_compile failures for each build.

For libc6's the postin is:

  #!/bin/sh
  if [ x"$D" = "x" ]; then
      if [ -x /sbin/ldconfig ]; then /sbin/ldconfig ; fi
  fi

This doesn't make sense for libc6 since there is no /bin/sh or ldconfig when
libc6 is not ready yet, so just not add ldconfig_postinst_fragment for glibc
to fix the problem.

And also remove the workarounds in oeqa/runtime/cases/dnf.py, they are not
needed any more since the loop dependency is fixed.

Similar to musl.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package.py                    | 3 ++-
 meta/recipes-core/glibc/glibc-package.inc | 5 +++++
 meta/recipes-core/musl/musl_git.bb        | 4 ++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 4a244ec980..2e348e0a10 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1852,7 +1852,8 @@ def process_shlibs(pkgfiles, d):
                     if s[0] not in shlib_provider:
                         shlib_provider[s[0]] = {}
                     shlib_provider[s[0]][s[1]] = (pkg, pkgver)
-        if needs_ldconfig:
+        if needs_ldconfig and \
+                not bb.utils.to_boolean(d.getVar('SKIP_LDCONFIG_POSTINST_FRAGMENT:%s' % pkg)):
             bb.debug(1, 'adding ldconfig call to postinst for %s' % pkg)
             postinst = d.getVar('pkg_postinst:%s' % pkg)
             if not postinst:
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 3d721d8f69..bea841b047 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -298,6 +298,11 @@ pkg_postinst:nscd () {
 		fi
 	fi
 }
+
+# Avoid loop dependencies between /bin/sh and libc.so.6
+SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} = "1"
+do_package[vardeps] += "SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN}"
+
 CONFFILES:nscd = "${sysconfdir}/nscd.conf"
 
 SYSTEMD_PACKAGES = "nscd"
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 3aec643c40..057113bf16 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -80,4 +80,8 @@ LEAD_SONAME = "libc.so"
 INSANE_SKIP:${PN}-dev = "staticdev"
 INSANE_SKIP:${PN} = "libdir"
 
+# Avoid loop dependencies between /bin/sh and libc.so
+SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} = "1"
+do_package[vardeps] += "SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN}"
+
 UPSTREAM_CHECK_COMMITS = "1"

