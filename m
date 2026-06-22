Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F73DCDB46B
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 22:57:43 +0000 (UTC)
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com [205.220.161.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9225.1782169062095928651
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 15:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@keysight.com header.s=ppfeb2020 header.b=rMps0KOl;
 dkim=pass header.i=@keysight.com header.s=selector1 header.b=dOJQFUW2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: keysight.com, ip: 205.220.161.93, mailfrom: john.ripple@keysight.com)
Received: from pps.filterd (m0187211.ppops.net [127.0.0.1])
	by mx0b-003cac01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MMTZvj3063553
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 15:57:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
	M6GbhbW4DaNG3QKSVRQb9axBIuWmh0QCCgCHrRizLLY=; b=rMps0KOlWPxkyjmR
	bSiFGNyC8gkXus05OTJirKJqPB6a6vtcHeIFXUgt8ZE5gk9pz/sVq3IvHd2rKucN
	xu92yRwQlT3qfoQreM41pB270deBtXsm0HV4tkJxrRZzd0ygn8Dr8cSGA0JydXjh
	B5kGdak5vkUPsw35ZWefrPJViQApLD4BJOnpTkTKo+lv30r0zgCVMgKOA/w26dch
	LzxYjIvqkefPQI1IfcYz532ZP2tWGktpcGOhQK63ysEmaTXIVS6BrFJpKdAGhIDp
	6Cdu39+prGHmseds5S/6vfq3WmwN04Qu4BiFUjZsqe4EgeGMdTpDjvALdxVVLxTO
	QZxuPQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013020.outbound.protection.outlook.com [40.93.201.20])
	by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 4ewrbt7hj3-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 15:57:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtOeQS8IEMcSMxvv4ccLJ5PE9AG9IsldTKskpv1SkSIr7TmAgDqgl7OaISTr44s/ZoSQoEDukG+1MbIGGSdwRQeIcbfFs83gDm/DcF0eQ1g/vZpLtkJmiL9xw7D3vESjAWHxh8p62ukvhb22EMBZXkqH2A3xMz8hN2nri4X1NhS9b0tTWxQMRR7MSK/GgwjPCBbZ3HlcuL4NH2+QrChmD7zKDIUICNdeZULVNgZMCC6O4iImWY5yIydwVbsApn7nFAsLXXCRIRIvf/eGxqWg/iY6Ou0xUCVnIjYA5Iok7hfWkDyIRAnFGG5YxOIVAO9s4LhKyj3Yt0X/7OuJON/qPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6GbhbW4DaNG3QKSVRQb9axBIuWmh0QCCgCHrRizLLY=;
 b=qg2jkiB2dZjQKgytOBEV6xy/DagGI/nM9AcGd+iVeB/kI5KQyrioITyz/Ycx9fyfbVXSKovqfk2s2Y508JO3Wt7Gk+oJmgA78W5q6OaqgxujGimsXXUAZGpydFFjzclKb/rkU1shh5jOIzqkqZvzh0OYCHTseJx/5Sw8KlDDnpxkLX9z/3htE8yrNT0VEXnJHovDulATbYDTSE0AafyiRpZa7q4Hlay8WxupqRISvaeh++QnKh0Oj2ciVrqlEk2+y5m+4V12f2oOu/QtjaQjJp9X8wj+BFNuxdqkM18zrWZiwi9ccDJONcarJBNqMDMzqXzeJWcChJsIfa3dvDxEuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6GbhbW4DaNG3QKSVRQb9axBIuWmh0QCCgCHrRizLLY=;
 b=dOJQFUW2hhQ09iTadPUN7WKhVNLlbwdZGMQ2BKeEwb1d1WiOECL7p6sEuAFdt/M8Ge+jA+b7+0MxC6QupM5Ui0O+GaycqFxymMkcY8Y8GIS6oTeW8MW7VFRSUo+MQsrV7sEyAStOLVfqc5TbaTJyitUc92bAurkT1xqDAiaMUDE=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by CH3PR17MB6241.namprd17.prod.outlook.com (2603:10b6:610:143::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Mon, 22 Jun
 2026 22:57:39 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 22:57:36 +0000
From: John Ripple <john.ripple@keysight.com>
To: openembedded-core@lists.openembedded.org
Cc: John Ripple <john.ripple@keysight.com>
Subject: [meta][PATCH v2 2/2] go-vendor.bbclass: Remove vendor symlink
Date: Mon, 22 Jun 2026 16:57:23 -0600
Message-ID: <20260622225723.3746582-2-john.ripple@keysight.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260622225723.3746582-1-john.ripple@keysight.com>
References: <20260622225723.3746582-1-john.ripple@keysight.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYXPR03CA0063.namprd03.prod.outlook.com
 (2603:10b6:930:d1::25) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|CH3PR17MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: 85241868-e721-4440-ba8c-08ded0b1a71d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	nSxSdMIEQ4IHszUiXvVKV22+RnJeaxgOz5uiWKNjQTwuYn/XLi/KXkAvKHI8A2L4TadD8PKOwvAbY0K/jqMKSsiG6GOslA0aXscBZygmR5nBtiAIY7sKdvJej69NHPDpHU4ed0W9txl3MVIEIjzhi0Klva6FYKHU/43k74u6cb80YDc3h4alanDAPvY8OfhwgB1AFTVN5naPKtpEurpLu9zUfmfDrlikQQtAiwyMAqBI3ReciouDhssq5RwvsmyP1nKH5PJiDq83EDv3VLnItpYLB19Mhug1zmUcpVeQinmDsz/YxWAhByL0suMaUUH5m/rfmztbin4lwlKF0nNGTK5a98H62JcFs4CN/yWyAiwd7sbg1Rlwktk7wCOAx6yWHyEmboKhCGa6Xo3J6xT9w6lgkrOnxgmkWQk+3UQmIAk5l7/xQcyYJ9/dAaYM5EcVfDl67AlZtJKlrupOltFjcuwkjovaCRLdsEsPDpRz27zDMINvn8mWdNhb1RGvGQR2QXC7wf6HAf4feDSOiMbW55pa9r2jpDI+7w7AoOVcxveNkKnk5aJAkxYloGOCZdenmf+QrgPgpk0XmrzrDZd8WdJD1oFUoJZhDbHERuxLAphfF7i0Ds7IPmCCrIwndG3+eDwRFjAYSW9ZhFwQfbYYss+NM/ogLnYFEQ+UVjvjR08=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR17MB6130.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+Oz/O3JraPIy1BGhYr552uvVDxdj3CFONc5v4m5N6fR8GBKcDJfrHAoo+D84?=
 =?us-ascii?Q?/RiDsEK7LdoF0luH9d7+7jynjaek1mf/p/vijpBUAz3kQTpADCdFrYgSUAMK?=
 =?us-ascii?Q?WwoU3Gr6KGsm9SyPHVtF80OSNdqvLvbO7wZRfNXiYSUt7QeeVomDA4LcuJFg?=
 =?us-ascii?Q?1I9cxPykVFIW6KMd3qzhFhDHyDphpFwF9bZ29ulXdQW5AahbzUjR7WO4Zbus?=
 =?us-ascii?Q?D1YFbFS3DL+EFQ4Un++tHOFnDIosmNHs+3DLb7lC6ptbON49nOL28HQ2Ssl7?=
 =?us-ascii?Q?Eg85YMxOIcDJO7t7lxJp+/dw7xaPfgZ3o4CPZhQgMmz7bJtEYSBKl24/Hs+u?=
 =?us-ascii?Q?ZRLhACNbC1iROvUraYUewgf7ZhKRJmez7OLoeUFCsktx/O2jje99kW0dhTsH?=
 =?us-ascii?Q?Q6VzBVTxicAgKncX1TcBwMrJgZh89ZLOptaBYBFD3L9Rrdtvh/m7+Rk+xLGJ?=
 =?us-ascii?Q?71HddaYCLdRtWik9Jck8NDJIgKsDu5rBup1HuVkk0QUui0RJ0eFNKJDhv80R?=
 =?us-ascii?Q?Oc+bWTTSfX4dprdwG1rkZ4b73URgZhUljGtQnaKy8sjf269TGIRV04RHozBs?=
 =?us-ascii?Q?5PWqcYOeiAa9wqNRIBMLr8aRouNAep83OblKgudZGlZf3zKCR6cIaUwBVn0y?=
 =?us-ascii?Q?oZgAEPdMFuJ93vyz7Z+5PpO18b8KV8tjkQXCU2Ma6qVI666k5/w9J52j6WRs?=
 =?us-ascii?Q?enxFWz8GTe/Hi5PwSuQRCoCFDGQOXhRLQvhv/6YufcUAVAqsHNi7TNxTatK2?=
 =?us-ascii?Q?s3oYZ1/poBda3Jxb8GyP/dUjUHcjqWYoWm89qR5YorV3UGQTKBDkRJtwDwEP?=
 =?us-ascii?Q?mZkg0o4Wcz4xHN2csdP1URsgvILKsLekTLzxakS5y3Fk8FX0kxzHyZ0C+OKB?=
 =?us-ascii?Q?ADRh9qeJDQsvAOTeUTnfLKT4L0CVNyhlmYJfmzTFxbT+8U+VHtXSbff5ybVf?=
 =?us-ascii?Q?WcH+ftAe1gpj3zX2IR0MTJU1iUFM2dNNql/RT2qXcdolTXBbeRzxdGDpcJ/u?=
 =?us-ascii?Q?DXDL3OMCwGS3D/OdGc4+NsAQzjGhSZyui7ug3D1FTBiDFW1QIA5/fQzd4c/K?=
 =?us-ascii?Q?g0n8BKhWeEAxEh00ISuE6O2SpCzgBuzKUsUAhP/BpjYckW0bsgRZsr6NCEMk?=
 =?us-ascii?Q?EfhIOYSI2+HSob9EnzO2+7QBttLY9eUDmy3sFVlG6oS6G0s7zPvTkMPFiCB/?=
 =?us-ascii?Q?9D0gYAgILQJrgsCDEgJvM07Mhkbclk9KVI91QSs1xLef6NDQE8vSZZjHh2YX?=
 =?us-ascii?Q?rMIuHw3b3/rVTmaRfdG7QtdOh3jckkHOoZ2tZf788bDEPnL5Vi9HWYCa7vrD?=
 =?us-ascii?Q?09Uw9+KHMJCezeaFZYUMxDKXivI/j6BNqO+cXBLZTmAcRWn6QrAdgsxV71D+?=
 =?us-ascii?Q?VMRkIQgvza2zydxIYned1NKaa66hyxwE63LIsOBmbMQY2+gcVlCbSGoWemsM?=
 =?us-ascii?Q?P1bzxjrNrFc+M24U70npuYtTfmNGFR2y48kLHQ3jzX3yxx0+e/A+p139HrPg?=
 =?us-ascii?Q?7duxCIKZ6HYCnQ/mtJQOnUbXnUwFBuDnXNh1tm1XB9tIYrGAXEVBv1pNl5i4?=
 =?us-ascii?Q?akbAkW1QabRI6VBnIY3WNpBqbstSdtaGiKD67ciqBpww/KStrM5ZncOw3UJV?=
 =?us-ascii?Q?lhqprWG6RWMOM9HmlxJppIMiwGow7PTTcSOZ1ouHifQqy4wsBnQPf8RxLJDP?=
 =?us-ascii?Q?lyWf9lCNYo5ipvGEpXRUC4AQ7sPLbaq7cqEICFVlLqeGkghKdsuudAcPLFrd?=
 =?us-ascii?Q?bPxcOF45dw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	Z5KmWGMBM2h0+/L1K6tdkbHBRXY42fwsmZVaJ1iaWKuyKbiWbPhBGPv6Ox6bDjBmccMnUtbS9/7m7PzOp6E58oSJrLaxBUXs4/AzFiJs3/uuGqkNDk9l+q+se9/bMyl5BLzlmpC6OASVM2nAWfr1Orz2mPUD7TbsKp4Hy1ohqwAJuJhMDYJ0KS9NS7MQBXSFXsjXR53LmFlgVrR2o7eopymz4VDfvcmWM59ENJnvghk+t6Zs5VNfsOdKigKUQMizeKzROLzTneHOpaHuFEPlSLnhtlN/WTVzXMri/4DxwjKtv2Z8sPdR4YVCliqV4nG/hDO2XsxBMeAU62Z5+UdMow==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	+xb6L4mJXfdr+aKVkN8xTZqzXmu1X55jBY8/ZRrHshcWyWO7pNW0N6MTTukxEFaaGIZ26HmRQMx0zhFjcLLPW1ytUO7qCxWemN9dynJZBTRRrap31Mh6lND3iJ1LQcC8cLgZBHQguD0A0+mUmVaYK9xp0I4+OjbBk0tVge95XUo2v5xYQq6qikbL8xqvnu73SaTQ7udnyH2xSD+1YX7WPTRZn0unPLjDUukXRlNK3psPLJdALNI3LCjFQ3B/ev9q18vHNP3aXn/YMpdKiXxbDf4pUW7V1caG0y8rUI0PjUiBKIyEZDKa3jTVqYc4wa+Yi43PkyIdXMYy6xkFT50efCffYuazBeMn6AiA24+v7HDiFZgvQJf2rtJ2AusF39Wix0Y/3w663X50NBu7EekDtDHlQ1GO0mSztOX4Wts0rAgQ16n1z7yLBDK8r27OOHum28tmvzojN8ROgn1HCqq4lphYZFw9SNBBkgOgdSwfn+VSVEK5/2dAri2iOGK+UQs4iybQVNMV8K4+mKGzwRLBU7lR+ZnrU+jP3JX23JpTTJAuQGbGle/pCOIyb4lkv9wEJ98GCznQWwFQEmRx7E6EUctlDA1Vs7NgdRF5KU1eSW7tPYhk4b6/6YSz0FDjPrmK
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85241868-e721-4440-ba8c-08ded0b1a71d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 22:57:36.6118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I7S7GPTRLmmx5JF/kjGENZc7YpQWXglvw6P2DNZ3vg4ERSeH2D4QWPno7VTuMnOqB8WqLaJ4GGelOM++6ZwqJuEoVYFiMtKPCfdMjINiVK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR17MB6241
X-Authority-Analysis: v=2.4 cv=dfywG3Xe c=1 sm=1 tr=0 ts=6a39bde5 cx=c_pps
 a=H6CWIJr9C+/oc5/J52O/6Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=vu2TTH8h0NUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FLoIbiw2ZNY34kqd41oa:22 a=Z6MDKn_O4FAsc8hf148Z:22
 a=F6MVbVVLAAAA:8 a=EQFWiQNSZTnAtbWslLYA:9 a=6mxfPxaA-CAxv1z-Kq-J:22
X-Proofpoint-GUID: QQ7mBbXPJ204loTLjfZpqAA1bLyJY9L5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDIyMSBTYWx0ZWRfX2D9qYHRfn+Rx
 TOuZYsFdiNfZ8GwXh5iw9wuubxOEZFPhMaH/y+WYZ1vtsIrRl9o9GMr7ojuTtZlL3VTTdqRgVaB
 LJ/3SZtOJv/rNnCho/k0jM63Jijf9iYJq1MJhHsylc39jiJUT7eu
X-Proofpoint-ORIG-GUID: QQ7mBbXPJ204loTLjfZpqAA1bLyJY9L5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDIyMSBTYWx0ZWRfX+x7g76Fvk2sY
 Q+7tl6vHmDRVvL01i1o5w9SEFaKvmCyh9bSOd4RYUs/XS5+sTZZen9t68I3Afug5AM+HYQMRJCL
 jAUpsgYSBUqf1EZ1ah8WgaCm1Ttv52UnjPIpj6OoTqPufD7jB7myReTbqJ5celdci2DkrE4XQHc
 U9diU689xqlIiOpDuVbyM3ztqS8y3wz9EqoHNIVmMcT9swH3EczcbBdStOHNfuWg5vMknyxEArw
 kjyb6q7cKoayxTjQj/nWhGg+CfE0KHziwJkL6MGrdnuZw0F5aEokEBunu/TovtpQ0nOtA7WcowE
 vSJFSFB+7EWVx08Alj8N5McRdIjAawqGodXkSw2QxpRHmjROPJarp+ru5MOv7qz2GpXHliJ2sL2
 rsgjSKUuyNzFk69Z6twB3YL8sjGvul7O6apFbNpAYA5NGR9kXzM/GC3D93j6cqMB1va/xdHG6Rw
 VqWqv0KkPaFgF8PvA8g==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11825
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220221
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 22:57:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239321

The go-vendor class creates a symlink at the end of do_go_vendor between
the vendor.fetch location and the vendor folder used by GO to find
vendored sources. The do_vendor_unlink task originally removed the
symlink created in the S directory but only after it had already been
copied to the D directory.

The do_go_vendor and do_vendor_unlink tasks were never tied together.
This caused file not found errors on subsequent builds where the
do_vendor_unlink task was re-run without the do_go_vendor task being
re-run. Leaving the symlink in S and only deleting the symlink copied to
D fixes the task dependency issue without requiring invalidating the
do_go_vendor task and re-running it or creating a new task and constantly
re-running it to create the symlink in S.

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
 meta/classes/go-vendor.bbclass | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
index f854d14bdf..d0ef45ff07 100644
--- a/meta/classes/go-vendor.bbclass
+++ b/meta/classes/go-vendor.bbclass
@@ -42,10 +42,9 @@ def go_src_uri(repo, version, path=None, subdir=None, \
 
 python do_vendor_unlink() {
     go_import = d.getVar('GO_IMPORT')
-    source_dir = d.getVar('S')
-    linkname = os.path.join(source_dir, *['src', go_import, 'vendor'])
-
-    os.unlink(linkname)
+    linkname = os.path.join(d.getVar('D'), *['src', go_import, 'vendor'])
+    if os.path.islink(linkname):
+        os.unlink(linkname)
 }
 
 addtask vendor_unlink before do_package after do_install
@@ -209,8 +208,7 @@ python do_go_vendor() {
         os.symlink(relative_symlink_target, symlink_name)
 
     # Create a symlink to the actual directory
-    relative_vendor_dir = os.path.relpath(vendor_dir, os.path.dirname(linkname))
-    os.symlink(relative_vendor_dir, linkname)
+    oe.path.relsymlink(vendor_dir, linkname)
 }
 
 addtask go_vendor before do_patch after do_unpack

