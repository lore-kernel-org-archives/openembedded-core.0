Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5D1C61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 00:46:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11825.1787618774348290934
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 17:46:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KaNG4KUj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P09qHG214504
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 17:46:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=9fHc6cgZgRbhKyjY4NXr914NBxt6aPRaq7TIYGoB/pY=; b=
	KaNG4KUj+evaVyyC94/RYMOmzp9dS7f3YSexvW4XILVRlEYenpsY8cX3NS6YBl9i
	9lxMdrLDnis+rXQzlq18iVKhJWM3QXzEs9VQPynzYVdkCaqZYyoKPZ+23pIeN4HC
	6I+60sdvuPEJ0+4xhqcmJIUyAY1Jdk1RGIfsKWY03U9D3spstd1a7clV+UPJud23
	GJhbp7awB0PHtotoDztf4tfn7lWLsWhoQ2EcG0zIBr4nDFNrUFueK9k7LN6B7rz/
	Ci6OQLCTjjOXztLqj5X158XaD+5+yxkvtJogLHRFz2wk5eO0J3ZGEgYi7oUlaPJy
	khcj4RmbYE4c3OhwT/6PvQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021075.outbound.protection.outlook.com [52.101.57.75])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7b9gkdu9-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 17:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uEJBKKxulDb+1JP/1INl3WDpoSqSuDY3KuNy+2hjGT5VpTF8OzHZ7nPRDH3u0zNW7znjfMKZ+dmByO7oiHTOWAvg2Qw5FIMAUqEagaxb2mXj1W39e988eJa2PLM4eEGMGkqPxx6XN/TnOZpdr70Zd+TtLnc80t2b8ot+yL7I5gREUQG0fQUV/GWeRceJO3QhtZ/NAqNxMXFtCrbjfL7KKiXUzW8HJ0AerTwcFbci+F+l9vpR3DAhWGsT1QCm2Ub7HxGdJtyDOM5jaTrVTaYs+z/raZ3ABUvpuE7NjapB0mkgDxavily3J7zbdHeggRYLQ8PwXjZfr3eOmJSZxSG98A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fHc6cgZgRbhKyjY4NXr914NBxt6aPRaq7TIYGoB/pY=;
 b=rbC/kK6ytm0BF5JkXQHl4Oln+6hQxFs52in38uQpe5UoREq5v3wclP4lBIg0yshhmazKhkF2p3RaSPz2KaesTEWmz9aFTXRVlM4gLsleu4xxyupZlwuBEl5JpWJd7ELRRmRIUonetvpVZmTULKFL0CxcgMkvJBHZ8VljubrbuTtHtjTvhiDg4KqetbdAgrp/5C/r/9fijjrZec7b+X0Xy4iwB+HDcCBy3YJyhDOO8n+Zk2nBgx5FLlpsaTc72DZDJDPH3O2NlZLCUu6o2AqvnxKhY8+KY9mcfNxQ1LwkkXtxiFf5iMt5XkvcP5eCyAn19BQUiotH69QzXr7J+Tknkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by LV3PR11MB8768.namprd11.prod.outlook.com (2603:10b6:408:211::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 00:46:09 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 00:46:09 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v16 01/14] package_rpm.bbclass: Drop external dependency generator to support rpm 6
Date: Mon, 24 Aug 2026 17:45:38 -0700
Message-ID: <20260825004555.4111831-2-sumanth.gavini@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 34436678-514a-4b1d-0de6-08df02424113
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|18002099003|22082099003|56012099006|11063799006|38350700014|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	ZoO0gqb+0ClPA3N9t+uL3kMDhRETxgEo+pfvrHo7+5LGMOX2tMijE6w4NWoyf3ih82mcijgC9wk7225uVJhAzwATrXoK6h1Hix26kr+MuVX7rFL3VcE0mwSLcsQZiG+99A6vjCZcgTd31/5U+8VoKmGyaHxL0Kb0in0Dbshb2ITtSmPY3uzTbAGfb10ao3MbO3OnpYaWLG/YDAc5ze8bqyZoptOsU2dGiUvI1gXJpc9mcxh+stLvvvxdnfJJMI81wI19zueCvgXJhVm22lNBTTOvVGDqPUKQlezVDz1mWogLD9rUZ9u85Ou1W+tHMZ4FRvOdDSiKmF8JTncCMvbYlMybcG8Uq/LGAUKbww0MgNqk9F1tOcWqI6osIFifgBtlOGlLzGwFgxaaPa2JWlCpb5j+xqF418y+24v4qTr0t7KOrQgt/YZaBlrF149JtydMvQ8NxPBJ8yoJB3z+04MZAEYKja+5eSIlY0o/+wwkkyLycp3FxoEt9vw/6qsbhNpqkv6kc+PavNDSInWYE32UHSUIFk31mfa42JtplEx6q77ZvKVYuEIGZmkMnwLuXfyzj903fRO6/5nKci/2Rl4lHVOtyYUuA3TZypVFa3+6Ow9KiVXsva1x7Wa7rWErJsqX1wY0iW2Q1/5V6/2VWTLbdGv3Pb6v4IJsZdvKQEEoCihU8LHkAh4QMPkseU6ZdMoncoyGEMFLrbD3hS83ftolX8Ed10X6BQMi1lehzLO6IaE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(38350700014)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?m0MQS0pTAsmTVEXkszAmOm+LxzS4wMJNJIHVWZQ2+ylmyDfGXfhkqHKZhsIP?=
 =?us-ascii?Q?4V+2CaPUQU/pIdRcCA4TVWdUP4go3PsPR6nigcXb5KBhGD6NyUbXZXWx/skL?=
 =?us-ascii?Q?b0qbBbZ940180V5iVK4KApq8c5Sf7tZf4t9B9EYxUVk3b8DZoYidt3T8KYR/?=
 =?us-ascii?Q?QoP6aolKy4yMVIXgWU5i0ByTQNq12HCG8fO4Wcw3qKr+n1BFj+sZVW8Q4F+v?=
 =?us-ascii?Q?XKB7k7bgyHXsiAbpnLD2lyEXqFy27GfX59YI7pIrjSn7Z36rzandKlba19Cm?=
 =?us-ascii?Q?KJzuvTb7dpJHHOnKSwjBWVC9F361biFSQdP0876s0fyqKOo9p9ZhAFbV5+OJ?=
 =?us-ascii?Q?NQZuKrwDFkzUuhpEFMHzqML77ui3RPlAN6sRSpTMkf7frk1LfmCqC3n34Mje?=
 =?us-ascii?Q?LLMeEMGcCuCFPAnIVy+O+3/JIg3clZXh8f41W+MURL1uS/zu2F2OxHI+oftk?=
 =?us-ascii?Q?UmbRHCy7I/Aucf0jCf65AS4nJzPez11fZiLGdYIUeBONAw4V9eVdsZAfi6NE?=
 =?us-ascii?Q?lPhCwpDf6kbsnfWW407qHm3ysw3kjdSkh9Tel2IuD8S/lJDo5DKd49ofe0xG?=
 =?us-ascii?Q?4L/bMAGFVXqGhWew14l5rof6sr2Q9fEzBQcjwvTfk88Y6+XpMOOy2sJxCVej?=
 =?us-ascii?Q?KCC07GVS2mr4OIr9rpCswegdBWIqtTfG8hFsJw3emt4mQQYFp+jLtfSYW85s?=
 =?us-ascii?Q?fNtWw4g9Zk+0FuIoooBvENOuf7Qs7CpxFaJPtmcFgVBndEKRFcQncQJ0h5J7?=
 =?us-ascii?Q?MEFMe+Czwy6ZxbZJXZSW3yc+Ox9AaXoaqMrCKQhhmO8p8ckbXSdKMmMsDt3j?=
 =?us-ascii?Q?ZwlppaZJjXsm9o6VuQ2Gxyj9XWvZLkJ599qWhcTT9z4EFkRkpwsHP4IkQGzs?=
 =?us-ascii?Q?5cFznQRRJ0gxo62QYdDZl8lWG2j4/JbfsIwV/CYOzuf1k63lofPGbAFSYNY6?=
 =?us-ascii?Q?6Bm7t1AhO9yFhUpFlAjTTpxh4iKL3CSCQIFc8UHtrAxAMm2IVuG6gNSz4+pT?=
 =?us-ascii?Q?YeLOdT9v0+A8C/hEP+icm/7lYPj0SC/76am5EYQyKcXFA4herGzxhn21rxen?=
 =?us-ascii?Q?9k25ItcNO0Drb+AJzupw4KRdMGBCL7JN4hHf3Vg1eAx3wmEW/tNutVez4ueQ?=
 =?us-ascii?Q?uP+60aoPizSNnYiQjTcXU20P0fovHq/WAP0Io/a1krZ0169Y1Ove93/tpDl4?=
 =?us-ascii?Q?SO1pf5B6GllIuCoJzJfYoiMfsgG0OlbaofEunvsMNVRdMWckSyd11nwkfXBV?=
 =?us-ascii?Q?q5P4AxM02mQXiYKoGsfKjOx4MhfOZND/smoVJdt+tix5U9kngwW7HOByKx1Z?=
 =?us-ascii?Q?ChqZluynuR6yFjmCEmbgG0EMO7Vnub6iZYm0WQk1ANXrIUCkJFMlv7aIw7Bt?=
 =?us-ascii?Q?0OsmMSPY4LJrbj9B3Hgz5Jk2D6VV182JTvzKQJ7X4M1VYTcllCAeqVlVw8TM?=
 =?us-ascii?Q?blZi2Ih2Oi13e8qwZf/+Uu6neWOg//aPl0G8GUI0bzSHnDulURNwJJfzU5Zb?=
 =?us-ascii?Q?WL0I8K2Nsk5lM7PnvwQSYpbSWPjPqTWgdGG3AqCL5pzb35GgSrkEzYK1tFaz?=
 =?us-ascii?Q?VOqc/iLyRVFWXnAfJQ/324VbFXEfwjUbwrMVea6Z8y2WrhcG+oENyehZQMiF?=
 =?us-ascii?Q?45L7bbl67CjhsKdqfI5pzo+pcxecqCVdmcqF/8PgA5QLDGxWsIVRS1aK4ilo?=
 =?us-ascii?Q?VB283UbPU6ezAlYXkF3oMPLcc9Axyz5XwdQt6ekfO/NseqOUFHiHF8tnZ2O1?=
 =?us-ascii?Q?Eh1/aVXowTCGBksLCETBA5J0exvJBEI=3D?=
X-Exchange-RoutingPolicyChecked: 
	jg/fvOEoqpvWKdUKuesybykbGWQ6ju01QTvQVXaItu6L21BnK/tmpo56pGtHUA1i31TB3YfXeBAQz31kv3cLmNFY9E7Wiji1c4BaEWUKKuLcxp8PQd51GND5bxSpX7cMTED4+xTTg0nFx7SlKHhgZUoaxWEc0Qy7kO8SiR82Z/m335Tu/pCpQlc9RQWCF5bfeDKRsagDzOnVQrjvZdqnUTtqoXPfM0RvgdNiZl/C/Ou0+GQgWPhZ2Q9ZRv/MHyXtu1bYjayJqq4zqABR7szSfnElAFewyxN00XQXmJAbNcvvmu4PI+CUAH1mXHUT5LNUABwQAnATY6lpZNohwt5z6Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34436678-514a-4b1d-0de6-08df02424113
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 00:46:09.3902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unsvYtItAdw2KsvrmXHPz1ks7kFTvMMvyeTPndHvChOZumy55LE7pAlUC0UeYzEl8FPz/HY6XmGVyZZxWHevfhfUgESr5YvDIPz7JjKkgFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8768
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: crCaTVBoINjWtKh9YUmw1VKtJXbi6-0i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfX6fZh2HSP8nFc
 581OhTm2lrxgxt8Wrku2a8wa8JTcObnedjt6gSj/sE7fL5YkAieHgFcaJ6TtN6DzwlW+490jUqN
 a7pyGtuz/JlavqNvm++B6bRNO2/t9DxYDUPigx1NPq6bc9G1nsS/Dx988KonTxYnmXkpqCbrzZt
 t5iXPNLSrKuhtcLhkfntKWHN9/soC5A6wr1Whs3VnP/IfqfEovpmAUE00kjUu0W1bk6jzT89naV
 pTIRCbCh8axxFaYiJyEHPEGX/Ewl59DR8xEKgXKp5mYnYEDD94yi6A2lVTqKwxbqwmbtva1JjVA
 ipk0vIsS1p9se7vu++xoHAaZwZiNWODqDxvbBYA6ySz7hCXBnlDKOjOB3eo5kriFiluekDfzBDc
 UAEVeelxnTuiAeowpJpvaJYpM7n0t0iIJdAQ9wyzkZ5qBbTBP3b4NzyyCcZasUJocsuXbqozF04
 nBvNmfohd1p5ZQY83oA==
X-Authority-Analysis: v=2.4 cv=LtaiDHdc c=1 sm=1 tr=0 ts=6a8ce5d5 cx=c_pps
 a=aQ32ZPuKfpH9dcZYVOilFA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=gH8vcDOTmKDoYkm8A40A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 0dzocd3ylKPSN6ZmVVH9Tm7utqAzDeWW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfX8QEfw+P+j3cX
 UK6wDLXDluLQtQRxqrGwZHf5zWS76XfFULTXcaVff+8k9pPGtLR4gwWlrUyYN9UdQHJqExAbXXO
 6MWtR4K+e8b+SI1Ph8yR18wCk29O3t+482KQaNurdX/ADjwFH31f
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244158

The rpm 6 doesn't support external dependency generator. Oe-core used it for
per file dependency which was saved into pn.requires and pn.provides,but that
hasn't been used any more since 2012 (rev:
be40f6d0bb80274366af00461112af65687a4de8), and there were no complains or
updates in the past 13 years, so just drop it to support rpm 6.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 84 +------------------------
 1 file changed, 3 insertions(+), 81 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 9eacd91cbc..f286d3a0e2 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -14,10 +14,6 @@ RPMBUILD_COMPMODE ?= "${@'w%dT%d.zstdio' % (int(d.getVar('ZSTD_COMPRESSION_LEVEL
 
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
 
-# Maintaining the perfile dependencies has significant overhead when writing the
-# packages. When set, this value merges them for efficiency.
-MERGEPERFILEDEPS = "1"
-
 # Filter dependencies based on a provided function.
 def filter_deps(var, f):
     import collections
@@ -36,67 +32,6 @@ def filter_nativesdk_deps(srcname, var):
         var = filter_deps(var, lambda dep: not dep.startswith('/') and dep != 'perl' and not dep.startswith('perl('))
     return var
 
-# Construct per file dependencies file
-def write_rpm_perfiledata(srcname, d):
-    import oe.package
-    workdir = d.getVar('WORKDIR')
-    packages = d.getVar('PACKAGES')
-    pkgd = d.getVar('PKGD')
-
-    def dump_filerdeps(varname, outfile, d):
-        outfile.write("#!/usr/bin/env python3\n\n")
-        outfile.write("# Dependency table\n")
-        outfile.write('deps = {\n')
-        for pkg in packages.split():
-            dependsflist_key = 'FILE' + varname + 'FLIST' + ":" + pkg
-            dependsflist = (d.getVar(dependsflist_key) or "")
-            for dfile in dependsflist.split():
-                key = "FILE" + varname + ":" + dfile + ":" + pkg
-                deps = filter_nativesdk_deps(srcname, d.getVar(key) or "")
-                depends_dict = bb.utils.explode_dep_versions(deps)
-                file = oe.package.file_reverse_translate(dfile)
-                outfile.write('"' + pkgd + file + '" : "')
-                for dep in depends_dict:
-                    ver = depends_dict[dep]
-                    if dep and ver:
-                        ver = ver.replace("(", "")
-                        ver = ver.replace(")", "")
-                        outfile.write(dep + " " + ver + " ")
-                    else:
-                        outfile.write(dep + " ")
-                outfile.write('",\n')
-        outfile.write('}\n\n')
-        outfile.write("import sys\n")
-        outfile.write("while 1:\n")
-        outfile.write("\tline = sys.stdin.readline().strip()\n")
-        outfile.write("\tif not line:\n")
-        outfile.write("\t\tsys.exit(0)\n")
-        outfile.write("\tif line in deps:\n")
-        outfile.write("\t\tprint(deps[line] + '\\n')\n")
-
-    # OE-core dependencies a.k.a. RPM requires
-    outdepends = workdir + "/" + srcname + ".requires"
-
-    dependsfile = open(outdepends, 'w')
-
-    dump_filerdeps('RDEPENDS', dependsfile, d)
-
-    dependsfile.close()
-    os.chmod(outdepends, 0o755)
-
-    # OE-core / RPM Provides
-    outprovides = workdir + "/" + srcname + ".provides"
-
-    providesfile = open(outprovides, 'w')
-
-    dump_filerdeps('RPROVIDES', providesfile, d)
-
-    providesfile.close()
-    os.chmod(outprovides, 0o755)
-
-    return (outdepends, outprovides)
-
-
 python write_specfile () {
     import oe.packagedata
     import os,pwd,grp,stat
@@ -311,7 +246,6 @@ python write_specfile () {
     spec_files_top = []
     spec_files_bottom = []
 
-    perfiledeps = (d.getVar("MERGEPERFILEDEPS") or "0") == "0"
     extra_pkgdata = (d.getVar("RPM_EXTRA_PKGDATA") or "0") == "1"
 
     for pkg in packages.split():
@@ -365,10 +299,9 @@ python write_specfile () {
         splitrpostrm   = localdata.getVar('pkg_postrm')
 
 
-        if not perfiledeps:
-            # Add in summary of per file dependencies
-            splitrdepends = splitrdepends + " " + get_perfile('RDEPENDS', pkg, d)
-            splitrprovides = splitrprovides + " " + get_perfile('RPROVIDES', pkg, d)
+        # Add in summary of per file dependencies
+        splitrdepends = splitrdepends + " " + get_perfile('RDEPENDS', pkg, d)
+        splitrprovides = splitrprovides + " " + get_perfile('RPROVIDES', pkg, d)
 
         splitrdepends = filter_nativesdk_deps(srcname, splitrdepends)
 
@@ -630,10 +563,6 @@ python do_package_rpm () {
     d.setVar('OUTSPECFILE', outspecfile)
     bb.build.exec_func('write_specfile', d)
 
-    perfiledeps = (d.getVar("MERGEPERFILEDEPS") or "0") == "0"
-    if perfiledeps:
-        outdepends, outprovides = write_rpm_perfiledata(srcname, d)
-
     # Setup the rpmbuild arguments...
     rpmbuild = d.getVar('RPMBUILD')
     rpmbuild_compmode = d.getVar('RPMBUILD_COMPMODE')
@@ -658,7 +587,6 @@ python do_package_rpm () {
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
     cmd = cmd + " --define '_builddir " + d.getVar('B') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
-    cmd = cmd + " --define '_use_internal_dependency_generator 0'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
     cmd = cmd + " --define '_build_id_links none'"
     cmd = cmd + " --define '_smp_ncpus_max 4'"
@@ -668,12 +596,6 @@ python do_package_rpm () {
     cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd = cmd + " --define '_buildhost reproducible'"
     cmd = cmd + " --define '__font_provides %{nil}'"
-    if perfiledeps:
-        cmd = cmd + " --define '__find_requires " + outdepends + "'"
-        cmd = cmd + " --define '__find_provides " + outprovides + "'"
-    else:
-        cmd = cmd + " --define '__find_requires %{nil}'"
-        cmd = cmd + " --define '__find_provides %{nil}'"
     cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"

