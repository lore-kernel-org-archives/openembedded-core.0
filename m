Return-Path: <Liyin.Zhang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC72D68BEB
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 07:58:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36713.1766044696814411684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 23:58:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=n1JIIQhJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4447343499=liyin.zhang.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI50Pmg612772
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 07:58:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=c+1AdJYZrw0qx5hwMIFU
	Ze4rfdOL/FujR7YJd5XkmgI=; b=n1JIIQhJA9E4zIze3JCcBpwoNdz/kihaKC0H
	//TS/0O+xBEeYtj9YzM3ys7laukJvA0jHbUIsnWxYUVwApi8+VGPFwaVuB1Op5+3
	YVLzfawYohAZZgkGwc4M5OhMtpQnGn3VOfNPkfMpM4yol6exrC44mHxFOrzsiZU9
	D+C/hjYZ1YuelqP72k81DmjukfdbuGlXfwmhqXDMYiFnVHFqjtzkNMtXjtfgCcmz
	2TCJ2ZIbdhauNx/+jxQ/YrbVcuE2hlLS1ERLvbsdmpzVi0o9H+/UaNu4Um4bN0D1
	leVFtIvAsCAYoDTNXTZF2zOqr6Cb4cfr8K5l9Dg4GZ21U3x4Ig==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010012.outbound.protection.outlook.com [52.101.56.12])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0bsn5y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 07:58:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bpe2YgVQq1h6nrLI3FtTSfSs9xrJIZNvj1U6N/Ttdgn6DXRGGrbRSG3jIhdNHjNYzKHkT4IBMnhtbOUnvzpN5yH7jcFy+hVNc7vbFD5roURbNbYlCEbVuRxj7A8k7XaOHcXU2VsImfQA+ofXI38c7T+e5wzUHl2wrjtr3Vm3nVtqG7DaRvTu3AI1GDBoJ3y1floC2E1jubSGnyH2Y8AGPHtE62NTX2iO8posn9Fma8sJ6Guwq3fDMvUzeVcxJ1pq9tmD7nxfaa7ddibq2nlNM7Qb2UR/aWW9NLPe27kZzKD73i0iR80Qab/+AmHxiFeerLDpox9VDgUmcoGnaJSpGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+1AdJYZrw0qx5hwMIFUZe4rfdOL/FujR7YJd5XkmgI=;
 b=CJ8LBObEmiSlMtiol+p4FvFJ6bOLsGFRUKGCpuCt/BbjCv1xCq+ifMXwIAm0OokiFVz/4S35tjCl1njhv8rxaxbRLGIMJMjOav5uh5X4B9JBS7FgYE1ovT8VtKOZGT6D/m6eruUQqp+DKE0lv+5z7ZvRtFVR/n+bN6buVI2VSIgf3iqTufJi0oP5sn9yUzMgi3MPE1uDXjoYsEBFgPX5UvMpALiXbxzqSpYj1FWRKMMbZScOS2ROdztqbxFl5BKD7B9pWanmujEjCSIiIduKcA4xCp0zD/N2OzZJjRjCvLdaM2O1oFnuiakeq3clP4x9nyiTRDCL8K42vDe9wDCC8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB8100.namprd11.prod.outlook.com (2603:10b6:208:445::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 07:58:13 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 07:58:13 +0000
From: liyin.zhang.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rsync: fix CVE-2025-10158
Date: Thu, 18 Dec 2025 15:57:57 +0800
Message-Id: <20251218075757.39292-1-liyin.zhang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0074.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::19) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: dec4537f-589a-46c7-d7aa-08de3e0b319c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XP+jP3HphZbFGi45HfCON8LySrQC/iO4qHgyvSoSn3SFVVl3hBj1ixo0to5r?=
 =?us-ascii?Q?ixZNyBI3QuAN64lQpEXjtq9d6b/HAccCeHf+uiolkb0AJBFQhgDtkO7bxgB1?=
 =?us-ascii?Q?zXA0GqY0So9wqFeREl0pM2LiW2FRWe+sE3cexfaBlQjB/ne1cAAb21Sl/R3u?=
 =?us-ascii?Q?zZC39ltu7O0ITv8e6h+XKNz5jlm3R+i3a4lZcaOctI5nrJ0hbWsEs0R3pFuM?=
 =?us-ascii?Q?bx0p6Tw8g3PXInwH+eKFsANOyVJQmP8Tr4HwDkRJSsp4ULyTKVohk5ku3G5b?=
 =?us-ascii?Q?z5Z3lnOr6tLhEF5Dgp7qqp4P5rwIsiGq9ap+zVpSHseqBYU+AqzL+6/om7P/?=
 =?us-ascii?Q?8u6RvdHGqWeto3Zjwa0gs6hm/OFvjmXtv0nAzRpTvoII2tJ3NcizOCj+MhD1?=
 =?us-ascii?Q?VcPpgoF5rnpGoUrmbmL+ZAJD0LXCSmKxramvrt0PLvP+CyqXNyqgT9QHe0DJ?=
 =?us-ascii?Q?At8COcMqtra0QC/PTatTfiKpid9O6u8f4+X0F12w1pQ/EePe0XnefifNJfUd?=
 =?us-ascii?Q?fJQY6cIHunX6X9XCPBgXam4KxaUlXKbY6BE0mNhy+MbWbOos0ergau9l+8e4?=
 =?us-ascii?Q?YM75z8qTXgYVFN+WnoODX/2uMUnbtdExMgvZQBU91eIRFs5TNbuasOGPHGhN?=
 =?us-ascii?Q?j2ctm4Rmtw9TtsRG02KrP/Qrud6ePasaj/sMN7oEh9SwzrmF7zIT4DpP/hJo?=
 =?us-ascii?Q?y5q4mkICO8wxsgkccbWpUSTsbL8mSOB5QEEScUl5T1xqBz9ADPC/Z5CJBnNw?=
 =?us-ascii?Q?QIFc63oIYjtm1iypc99XEPsm1HwEg736MmTltcDkULDdzJRi4AuD9zX9h8ei?=
 =?us-ascii?Q?YMDy7OjlM9Y+k/etBG9n2oisUQXCVpVAY8+XaqYW2vbnkgEQTW0ihU+zs8tW?=
 =?us-ascii?Q?gA7DouqIMnG2eZgVjCtbFArplkueSldV1VB/xBiZUFHN1UIhoTrShX7cPn9i?=
 =?us-ascii?Q?ySLnRSfR+XbrAxf7EDyYTBefBMIlRUVeA1tAs7vbVONJ/xOkEJoMJo3Rja7i?=
 =?us-ascii?Q?FiT3E5GMS6WSpoQumaPsFsSXxnP4xSFCRqDmiK2g9gFBWjrlhXwkclcZEwze?=
 =?us-ascii?Q?qbLjPOcKHaJVLuHMrV93TpfJ3Tkta8Vvajf2gHNLYRdlSA/6GCy/B56Y7Fu+?=
 =?us-ascii?Q?GS5Q+rt4FosXI6BcKd4LqZY3TeIXhouC/XG5cv2iY6SLWzPEy3marNjQA3I/?=
 =?us-ascii?Q?qJYXcdmWznHg07D1qiAxmxV7zURvgMib57pJ0i062dRUEUsvpzL7UIHWRHKg?=
 =?us-ascii?Q?PnNOWFLLxnhMsM9K4SyoSdpAhPiIevzJhz1NbrMH9aeloTeG6WWtrQ1gZkeJ?=
 =?us-ascii?Q?BhBLzXBmG7GKAYv+cB8OarkDKgxMhnTxyNcr2EV+KX8yEmMZFn8hRBy5e20h?=
 =?us-ascii?Q?dQ0hXon6MnGrYIY27tq/mfqr4zquwBdgtDbDwzOe6lvTHiFsOIFpKGiEL1G0?=
 =?us-ascii?Q?o7BlRryoL3rIwFkXhyD6eZ5ZJ3BmNHAq+ooIFx8DL7ffDjyeJH4/wbJAGKET?=
 =?us-ascii?Q?pMvYlZB4wxa8zTo7wSVJbJrZFhh5r/E6nnk6BqAm2Lo2+w7pYI9X6btkmg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NIq/m38+z4nHkD76QyIyo/6/RGlwkodig+KueDnNY0bUgI+HvsY9kBExGdCo?=
 =?us-ascii?Q?3qPGiG0L7QwGeXAdK1nKriXAlEp1tGmWA71QpdrYROziq7WMZ1NpFT+9/gTi?=
 =?us-ascii?Q?iu3ILIAau02O3tM1RvxXSjpjgoZbzrGj9omps64VAEpohDJCDu8KK4beKtTD?=
 =?us-ascii?Q?s2ULW9h0m7y3gy3xgMNeYW5NH+/LbueWSD+s2bXG2S1L/zkTTYCtGoMRCY3P?=
 =?us-ascii?Q?nTaULRMp5OHsqxGUVNI3wFPmQbVtc3Mho5Q1l27XLOZnpjNoCr5dA9LoIdBB?=
 =?us-ascii?Q?JWuXTLO7t6nEfE/bJGLwXQt2ns0ow1q8AFZ/t2ygHm+5DLqSraG8Jmyvqt6N?=
 =?us-ascii?Q?w8IUM9LonW0DLDq1viX502Iu5LdqzGzI8kyFYNZbYDBWtUQ2sLJ1beXziM2N?=
 =?us-ascii?Q?C/8n2ZVFcf+2ZD7dfJX0uP1nUk2PGcF/KQ+QqkVvXrEkSU9vdC9T3R9MxZd0?=
 =?us-ascii?Q?8wj/Jk+zBJaBysaGqXxQefb5kmUNIlmLgGApcAQrUkg5fC5tvvvBwVliwJh9?=
 =?us-ascii?Q?bJywXoJ0b4T712Cdsylj9lAnSRfLU9YBuVuUEMHW8V2U9l+yU61wchwV+6ez?=
 =?us-ascii?Q?eMLxx28o4V6DfeoiCqOjscJb/PVr1McppF4bSkuWFo/NJra1zQzLMTSH8b68?=
 =?us-ascii?Q?0sakNNE9Ey03ersqFr21xT7FKqnSQ7L5kC7KyN4IGQ0owlP+CGlS6FwPDf/f?=
 =?us-ascii?Q?Qpmkd7VMJi1lCIGiew+nQPZCNCMJKOJ7EnnZ3cr3ukGwEycYtcurpGs/yfAB?=
 =?us-ascii?Q?qcVC7rbocbo0O1iIWHJqPWXYpc7vpWDxSuOMgCOMENTtgo/aV4boQgqsS7Vy?=
 =?us-ascii?Q?hO4gBcMUfeClRmj1jMrfH7faR+vxHBXcbLw7/hUhKUdgFpVAxd0XIZbVLDjd?=
 =?us-ascii?Q?Q6CYaid1VHE+g3kbERyLf8ocRk2C7QhMVUEIRzC+Jk29RvS5V4NT5gUnpp3a?=
 =?us-ascii?Q?iQU7h3z8LGBUEQnbSAZOLFCxzeOfltN8u4X4s83Z0M69YGR/g7DDm3iZAtCf?=
 =?us-ascii?Q?92+KF6Wk7UWuA8l/j7U90m7kppJvbRyBkSnEg/QK38o99K3j2MlBcGXSmBU2?=
 =?us-ascii?Q?tYnGWsrM7NXNBpdg8I0SCgf5UrmTCk9mP157fIW7R7KZYux4W5/xYy9L3cl1?=
 =?us-ascii?Q?U4KL056dCSZbn5RCtjmsPu7x3IOjfgYuK1fLzCuLyGSf/A/vO183UPxDxseP?=
 =?us-ascii?Q?wy0PggykfMjMkanqA7o3eh0HUcBuDkh7MfBmeG3hFZ3jsjEYhbXgd/sxyNVZ?=
 =?us-ascii?Q?Mtr36kYHlW5AJELasv+qfUZ90/uaySGPJYoM0yvss8tLXXzdrG5fnWxwc3KL?=
 =?us-ascii?Q?MdZstr+tsT6JcI8dMlN872suCyWbd8TSdq0e1mWvUGUN9rfA6Uu84VPoSq78?=
 =?us-ascii?Q?ZuJ4bGRWROj01FrtEiJFzYQtxBuZv+Nne6yGwEgJVIJACjtjB3MyKzaiiYpK?=
 =?us-ascii?Q?YA5v5NgVTrzz1/XPQqY/KeTRtMA6oco6uJDcofHbSHUkp4j6ebfGp6iG3bnH?=
 =?us-ascii?Q?w9aEq+6/m+cgWJQr/DrhW+jC4W1UgvFB0ctZewL9IQElqZkk8oUoDNZFWBy9?=
 =?us-ascii?Q?O+baaXA3dlYjT9vxRhUbIcPN/giEkka+ijY5hAvMlCBdOkm1oAiZW/AbnF1f?=
 =?us-ascii?Q?0A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dec4537f-589a-46c7-d7aa-08de3e0b319c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 07:58:13.2777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jytaAy2cEFtqyXFzk6+P3v0nNI6GltgaGAcDpPU19P5JrQB049YfrTlXXxv/pxDTGJ0qYj/NUSdmHzrhcfH19R/h0PVZNvrfkftWNtR4bAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8100
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2NCBTYWx0ZWRfX0OWz1hd3fV1u
 bUmXijpmU48uT3ieg8oek73uNOmKmi6udpurujtE+pLAnfVUpD79CodLtkITeSZt9S+siMbwx2A
 78r5+G1rrW+2+qvVqrgkLmpJZF1zbC99N0EJZIZ46MV9BmF7PXgXQTLRF7Laqqbs1h3rrWtI1Cb
 UixL3EFqDRtCj2HFC/fIfEik6jYYQoxdoIcbGXE14tzt1L/P5IeVmtnQy9oHYiAMUa/+b5WfZ/k
 DAVldNN+AmXsIlgp7LMdJF0KkUFOiGQe+u+FanEmwW1XBJDqf4ndQn0ZVLqxhkRmqZJLWfvlVzZ
 pww+XOODC04+XW9W8VW01jQL2EqS/6E6clhf7b4+Tmq05kca7ettWIFkgpEqP7B03QkWO5he6Ox
 qwz6zXuglTRTO6McmtiwKRlJM7YtOQ==
X-Proofpoint-ORIG-GUID: 1gclYDntCW4DddU5DDBchFYE2SeI8blc
X-Proofpoint-GUID: 1gclYDntCW4DddU5DDBchFYE2SeI8blc
X-Authority-Analysis: v=2.4 cv=C+HkCAP+ c=1 sm=1 tr=0 ts=6943b417 cx=c_pps
 a=CjRpyDoPu1ZhyeacGh9KdQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=hGzw-44bAAAA:8 a=t7CeM3EgAAAA:8
 a=oq-7gxcSAAAA:8 a=OXj39j_Rc2b4oze2xNMA:9 a=HvKuF1_PTVFglORKqfwH:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=UIhn0zqP03opOuWSx-ON:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 07:58:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228093

From: Liyin Zhang <liyin.zhang.cn@windriver.com>

CVE-2025-10158:
A malicious client acting as the receiver of an rsync file transfer can trigger an out of bounds read of a heap based buffer, via a negative array index. The malicious rsync client requires at least read access to the remote rsync module in order to trigger the issue.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2025-10158]

Upstream patch:
[https://github.com/RsyncProject/rsync/commit/797e17fc4a6f15e3b1756538a9f812b63942686f]

Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
---
 .../rsync/files/CVE-2025-10158.patch          | 36 +++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.4.1.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2025-10158.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch b/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
new file mode 100644
index 0000000000..1c5661d35b
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
@@ -0,0 +1,36 @@
+From c2ff1647b1d9a0b92b73af106ce133490306e886 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Sat, 23 Aug 2025 17:26:53 +1000
+Subject: [PATCH] fixed an invalid access to files array
+
+this was found by Calum Hutton from Rapid7. It is a real bug, but
+analysis shows it can't be leverged into an exploit. Worth fixing
+though.
+
+Many thanks to Calum and Rapid7 for finding and reporting this
+
+CVE: CVE-2025-10158
+
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/797e17fc4a6f15e3b1756538a9f812b63942686f]
+
+Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
+---
+ sender.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/sender.c b/sender.c
+index a4d46c39..b1588b70 100644
+--- a/sender.c
++++ b/sender.c
+@@ -262,6 +262,8 @@ void send_files(int f_in, int f_out)
+ 
+ 		if (ndx - cur_flist->ndx_start >= 0)
+ 			file = cur_flist->files[ndx - cur_flist->ndx_start];
++		else if (cur_flist->parent_ndx < 0)
++			exit_cleanup(RERR_PROTOCOL);
+ 		else
+ 			file = dir_flist->files[cur_flist->parent_ndx];
+ 		if (F_PATHNAME(file)) {
+-- 
+2.51.2
+
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
index 2cf87d379a..6de30d337d 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://makefile-no-rebuild.patch \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
+           file://CVE-2025-10158.patch \
            "
 SRC_URI[sha256sum] = "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52"
 
-- 
2.34.1


