Return-Path: <yongxin.liu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F37D3B7DD
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 07:51:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3290.1765180281530083728
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Dec 2025 23:51:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NOghOsSX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4437c0c188=yongxin.liu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B857LCX1288490
	for <openembedded-core@lists.openembedded.org>; Sun, 7 Dec 2025 23:51:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=lZrbFWyjej71/pJXFDwT
	NGEsrVEujoLdOVji33OG5GI=; b=NOghOsSX7aIVedlTnTcupnSTeytiQzqRGnbk
	Y6OzGoHawh9/uZdu80x3m5eqJyJR9rS+kdEGKZSiX+kqOJ94nNLjthIDBGG1HJzN
	Tom61/4mjOM/47OZyuBQUnkhuW7Rdjz9RZIs7Rci6Gnla4TgORGZOr7Ju8IfoL1/
	4N7vEfL0/EiupscUKSoqqNrBSyuZRemgNVhjnScxvIOY5p6Abzcf564FNlzvlR6c
	vHr2OZ/uV/O89NbZneOy4lceuikRSE6EugQVwZOyrzffdmo1JZiUr54JH+EURo+r
	cAvakYmrRt3ubNFJBB/i+3wWryFGlIb1SBPJdoJbZCKzvdk8rw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011036.outbound.protection.outlook.com [40.107.208.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4avgn5h88m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 07 Dec 2025 23:51:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txgst11EE4xagwtTH004O7F7Rl14XCUS8hhBpGfRL+bgGORpwu7LQ0OZNiMTisnj+KH+1E8HdUc/ou6T3gDNu1bmcJUJE/UEsoD8ZMndjgNoRcut3TFpAsUUw0t0yjYD2KpD0j1merTo+ndiQq6hK2+1LYemFgWZxbOv/j3LqtJ0w8DiqpcfN2xxrSVIT13Y0yU8HlptvAKr32EQlNI67rLTF2LDalgWyuMGW1/4RCQ4DVyT9nJ2UsS+U6OKvyG6lCzxF1Ta3xzwckVaQXAuQbv7A4Xnq/NOeNM6Od+0SgyEENW/UWFmCLKAd4wPba1PJr9ir91d4niMS3B7e8phzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZrbFWyjej71/pJXFDwTNGEsrVEujoLdOVji33OG5GI=;
 b=QnsX5dlq1q4UkDL3TJes9S50n+DDgmCXbzkAuHzHItIEvJYxhUNAuUosAJEg35YCBkRg/xT/9krOMg84BubnSOAjGAhvJB9xg5FHcCDLvdxHOCqFJr4ocvIzw+/KgoKaM23Q2J01hTbFrzN2WrgYY2fjW1RnP65cpFwE7mFlC0aRKH+Mb8+dzUvCRxfMj8GHyBCiV6APws3rEFuPqVbHon6bMX4oMSqozTUSmjPW5nFTFdcRYyB2/iNxCVXbmPmSBEEkIb8fLYVU6vgikbR4aCFC9lgmSOmW4cNB04aiAjYtYCbKVN6OGZFyQPwYgnpncd0cnJ9i2nd6zxTLWvlJxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5072.namprd11.prod.outlook.com (2603:10b6:a03:2db::18)
 by DS0PR11MB7578.namprd11.prod.outlook.com (2603:10b6:8:141::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 07:51:18 +0000
Received: from SJ0PR11MB5072.namprd11.prod.outlook.com
 ([fe80::a14a:e00c:58fc:e4f8]) by SJ0PR11MB5072.namprd11.prod.outlook.com
 ([fe80::a14a:e00c:58fc:e4f8%5]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 07:51:17 +0000
From: yongxin.liu@windriver.com
To: openembedded-core@lists.openembedded.org,
        richard.purdie@linuxfoundation.org
Subject: [OE-core][PATCH] shadow-securetty: add ttyS5 and ttyS6
Date: Mon,  8 Dec 2025 15:50:48 +0800
Message-ID: <20251208075048.2555077-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.46.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0119.jpnprd01.prod.outlook.com
 (2603:1096:405:379::10) To SJ0PR11MB5072.namprd11.prod.outlook.com
 (2603:10b6:a03:2db::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5072:EE_|DS0PR11MB7578:EE_
X-MS-Office365-Filtering-Correlation-Id: 20140186-e649-424c-6d9a-08de362e91ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?c0OddSo/omAM20Va/QpkWF/gmovbFqkpcgKXYZTEk1SJhFrjWe2umNyCL59y?=
 =?us-ascii?Q?AGb7BdQ16BwzrdZJ90G9LD6v1rxpZ9vtHkJHtjJGyDtaC1LpoCw0O9ZRBX6q?=
 =?us-ascii?Q?igvEWv+w376CAH+7u5ag7V11dQMVIxvXi8ZFwDg7rrbs9xH8gtb6ftCiOsYF?=
 =?us-ascii?Q?APFiOuoYvOkHQJVuBd5abWpKqftEPmy+jwJNlDOsLBClFHtiQGiIkZ8YKCZx?=
 =?us-ascii?Q?+XJLG47S4Vd+QnpOauuFzrhTBCCQAOYqfjh4aUwwgLGEfzgCbwjNOv85Q3KM?=
 =?us-ascii?Q?OJnvcIxWVg3PSWumCjIU1ovYECWPhnf8MtVRiia3+wA4QttmI/otTqkLkyUU?=
 =?us-ascii?Q?jpVeE5dQFHCbYeiZu606XQhg6wb2qeq6zb9oJ7BwdnIwG3Brx5rjgt8PqLYs?=
 =?us-ascii?Q?MWuo4/3ZbBgJywwphtmE1JlUbTKj2jqbIXiTqOjNiL6xsN8hNBd2/ixcpvuL?=
 =?us-ascii?Q?zOhUuYABd6fWkpQzld3qisU6evUxlMiZhehqIv3yDvOnxDj0NtLvqxdIfeKH?=
 =?us-ascii?Q?YJlMprv/aSl17NTXe7xm0lX0BwJXVLGu8g7SsIrPMWi1qMQJlWxdhznX6NNj?=
 =?us-ascii?Q?8Qyh8F+e/hrL4SCQWvkyQhZkkTBrKPRiegP1NovV3gj+L54EXvYFYpjdalHl?=
 =?us-ascii?Q?b3HuZhIZcmrQORdlygcbDmtD9g9z2OQeggUID79jJxTUVPCX3XfS1P89zQQY?=
 =?us-ascii?Q?2qCbwvcf2+Q1d5jgcFlVTUAAqAPVQfgsckfJreuWWWSx+GlfbNp7CNx0uPYl?=
 =?us-ascii?Q?Vn5VXgthHfAW80DMZ8UNDhRpj702uS/ZWFlFV+hKaSVOg/ogE+bo1jsIm2hG?=
 =?us-ascii?Q?lFW7ossxUFaGtL0Dim1Uy3Pm5rEvdZY45I2AUoQfmOXpWF02CqhcnM/Y5qUZ?=
 =?us-ascii?Q?+sTEkK8ch1fiKaRIGlbl6MVujZii/iKxW8c60yRGbZOfQ4J99dNLlmA/dueP?=
 =?us-ascii?Q?t3Df6FSYEYp3lmkKRzcINk+pWFCyKYrkXSupWCrbsZ0g9QZwX2whFAMI87PQ?=
 =?us-ascii?Q?HGxJsXe7aWJEXAbjNkBCcs3f6StRb2IZ3cyat9ZqB6VhmDNk8T80oEIYJ9Gf?=
 =?us-ascii?Q?C5TDXuF2mxM/fzDeCMun/rlCZVRR+cCr3ChXcwFQQFl1jXgFSv2n55yEC4zB?=
 =?us-ascii?Q?36TQA7ABbbajZAg59eWFLq75fPlppSEI1rY9kP85GhupYrPA6zO2Cwft5QAn?=
 =?us-ascii?Q?fyxsLlQoXQLxIMaPuXJH2C9o9EgHS6ZgEcmZIRHSWhd9xlI5RyX1LzzL1oK3?=
 =?us-ascii?Q?tZthQJ+LGx2Yj2CKE21fSU2gefrXabJnOvLqXRWZNaHdrjoK3Nywx9dlUHQe?=
 =?us-ascii?Q?UyTTKjiIOsaOHN3NQRcF0KzN3FwJbV9T3916sQ3O+LiBxt40tg3TDfkWqjGV?=
 =?us-ascii?Q?nAgtvRoccNUB+QxW316GAWmvsULpkxuFXng7WG5Lz6tOQWsw21ZyS/lKBPbr?=
 =?us-ascii?Q?fK6z1AFIhtWwsQB29LFnAvRqH02/wJfR80GjRr32KQt0aOD3NkTvSm+0tNWu?=
 =?us-ascii?Q?hGIKoKdlA+yo6lABuPq2NU3FuO7QIuUpp4ZQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5072.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FwzSQJ588Q8HXFtAO5wctL63HGmxcx2VYdc9umiQGuKg1fI7PZQhy2h9mjKU?=
 =?us-ascii?Q?DyzSs+6Mvx8XDnygqyCJFWg78ruydACUYuZIaYuXXZrnEV1+Rfi4HTa+eUQQ?=
 =?us-ascii?Q?pbYKUIAg9T1bOIXE2jU5a0Nt2ItbgAb8Q3ZZoDZVuq4wl80AZ+1Zmr8vcDO/?=
 =?us-ascii?Q?8zByZp2+hFIQqKzqgwcHG9gnDZYNv8I9Z38smorh6v8u5hipMtNmFMdgFXM8?=
 =?us-ascii?Q?BLvL9+zL03NCbMJ0AlCZllCr/6ool/8zYjYQF/p6HPjqHb/Kvl7wAeGCNnm5?=
 =?us-ascii?Q?j/rj7043zrD71QpoPnYDpwS73bRhOW56JEIiKf80n/dlZwP6EMZ0bWm3BoSS?=
 =?us-ascii?Q?QtP5KkeoNNq9jqxHqVyij3O7PXT11qCthukRwc/6vnsnMlvH02o6Y8pZBzcC?=
 =?us-ascii?Q?9T3YQcRMp/3v8v1LGt0q5axSaAeiKdddZ/IrOv3BkOhoG3z5QJv0n3UrlBfz?=
 =?us-ascii?Q?YFj1ed/4z3k+MvPBTf6Zy6XCEBvKU6i1z371GkRM+UA7he86lbmAmYEIFP1F?=
 =?us-ascii?Q?wEiI3Zk2UcaJyM7pGLKOmcKqPgm3hJgnglabKX3Fjvg/YBAyScNyVmmouyzH?=
 =?us-ascii?Q?BqDLoE7PW5sBg+wFOzdnKhQ9pqzwGKNJZVUuITNh1Ga1F/7dIg9i5zA6tg77?=
 =?us-ascii?Q?P1glVQRtV4xHM0fjj6typgaKk1l8lVVB4jgWcdx3PZHb+ArZVcHu5MbeA1NW?=
 =?us-ascii?Q?+rBdmokSveFAOTElZlZtSXGKla4VUoexxAWiwyo3Cc2SFdw5e/9N4uppmBgm?=
 =?us-ascii?Q?5KtzPI0h6Lv4P/oe3q+dnHToPoGuyHJeTczeU60LVsn75lmO1u11Z0uN1Pq9?=
 =?us-ascii?Q?n/KFZLXg/NZym7yyvpLPHczSm0hlJ65fiNZp12hCFFYN+DjZ95X2xsg/IRur?=
 =?us-ascii?Q?SgW2t3nzXd5npvXrsr4wzp6EDn3uDIy3DqsV2VEngijTMYjQJCLCiGDLY0p4?=
 =?us-ascii?Q?CEicVSkiySAFhrl3j0pZPtcXXdfuA+CnzCFQLFqatfYfsPggavK7KYRuiiQw?=
 =?us-ascii?Q?AHYxjVtK/KmXOhcIKvR7Fx7+ZCwvy8VBOfRWZIqRwsxODQnYrKkFNkDV9a7z?=
 =?us-ascii?Q?qQP3yU5sKV84ARozeluJK5SpfuERGrPOVBrInskCmbDoS+sIfbJ3dRpcNZ3D?=
 =?us-ascii?Q?llTVKU4kJd1S6cIqAQKHD0tavwniDGWu9r4cFKJQLNoG7ux4Z1+kfHvWDUtq?=
 =?us-ascii?Q?HkSFPfX3vMaalJW4dwZlLW4WWg31N7LxeDLPyFOeE8OSqMk6wYXSu+ZueaNW?=
 =?us-ascii?Q?cxcGNG6Zqm9fdOLbz2v6HGFEBaFrcnNwDFa/KBki9911Qky08WAeid//T7II?=
 =?us-ascii?Q?03TpwVgmVNlq/Hijlufm4mjyyxE5rvWRoDmXXZjFCsjm9a52Tq68TCN7FjPR?=
 =?us-ascii?Q?vClFCqATld9zoXMnDeG2G5bRH4/hMfxkddVbOxShiQo3L1+vo2tOpa0sSrXF?=
 =?us-ascii?Q?SQ7GJUq8VXMFcGhGRSCie+cJme603xE5MsU6C4Isp3SOM4cT+HUVA1IMzpol?=
 =?us-ascii?Q?oc9KzEQTSB20vEMOz4TGlqjcXqGQpJc/blXJoDbpgOvCV6Wn5/jhW+ACLCLt?=
 =?us-ascii?Q?Hm81yfyGXpWSMLfoEReHOkMR1HNw5RF/v/GIQ9f69qAIPiaQuLhkzt0drbbb?=
 =?us-ascii?Q?wg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20140186-e649-424c-6d9a-08de362e91ca
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5072.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 07:51:17.7704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UsGDzAk9xYoO5qjNPBCrBGmmJPP7P6sA+zqrn4qvgkHF/VWisvJBcqmxPh8e0Ov1fM6epRIGY2MYJdGVdq9YApNsQ9DXdcVfML6S9uZXEaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7578
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 0379rJL6Qdr7ebiYOnr2izc7a3c0FdsE
X-Authority-Analysis: v=2.4 cv=MtJfKmae c=1 sm=1 tr=0 ts=69368378 cx=c_pps
 a=uJxR2RjB/d5PFa0hjvWx4w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=5ZEXCzURlYR1DPpB8fcA:9 a=ZXulRonScM0A:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA2NSBTYWx0ZWRfX4mxRmyVtUM8N
 T9Tb2sYe1op+VloImT3mzNRp0eQhiJQFNwRHKCc2+4CPvJ1attmHmL6F0DLVoQwMrxnxxE04h1K
 FBZxJ/zABRQmgh3F+DABIxk3fzXeUwneHNzUeWjDWT0D3QflW2XnWkN3rBzJRNzk0T1LjY0BNaM
 acIs9+eCxRCCAzqng89zvftLN7kEZV0747qd8RBPxi+no7i6lGXvjgH7OOJCmFeyP8PI7dXTPpu
 +0CtFnkuEgd2/Jc1OysxrsYrJ080mFGciprWH+FpfPvV3Zc8N6D5Y6PVHTQSH1ZA44Dx03OqumD
 MfUDxB1njWF6RHTKRye4IVEzSJrpZGeYHxM4ttIcR4rhtNMQeIoR3c6vQ9ZZNaTzXDTwWGmFn/J
 6JB40nCTZ1+9MBsfwtxMaDOXffaTjA==
X-Proofpoint-ORIG-GUID: gfYZQ-3rSV0-iZoTfI0dkQG5zADAG5xf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 07:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227379

From: Yongxin Liu <yongxin.liu@windriver.com>

Some Intel Customer Reference Boards, such as the Elkhart Lake CRB,
provide more than 6 serial ports. Allow users to login on ttyS5 and
ttyS6.

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 meta/recipes-extended/shadow/files/securetty | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/shadow/files/securetty b/meta/recipes-extended/shadow/files/securetty
index 820728faa6..04eba00c98 100644
--- a/meta/recipes-extended/shadow/files/securetty
+++ b/meta/recipes-extended/shadow/files/securetty
@@ -8,6 +8,8 @@ ttyS1
 ttyS2
 ttyS3
 ttyS4
+ttyS5
+ttyS6
 
 # ARM AMBA SoCs
 ttyAM0
-- 
2.46.2


