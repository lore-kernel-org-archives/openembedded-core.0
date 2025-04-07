Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BB3C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 07:08:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.41176.1744009717637839741
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 00:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61920ac1a5=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5375nsXE031850
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Apr 2025 07:08:36 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2043.outbound.protection.outlook.com [104.47.58.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tug8hxn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 07:08:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+upmwpmNfYtdPehqGbkrcgAYiHDMu8mLE65uSIswSRht/Klf8wuV8QNN/FufHDwJ4MWvTeBT41WVI9JHq0DtCynBBcxIcxKyTv1odw8o9qnGQi8DHjYepcE6ZjBMyb5s2b+RIBcBKbg8Lnf6tbkGktt2cjXmwhh9OyvXt1PSiSPDkHC0jJzo9HDus/LhkTjZQHvHKXaPXCzQlDAsZ42cQK0smm5pSsg3P079eB9QPoPnZuR1LPviEbCwMHnesXit3IP/lfRBTdFpplEqrP/fa/0uGPK/WNHibaoQjkRBmBfATJieUthXkFRJAnajgeyQaZNOBmjjs3XPBZLPIS2+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfepEumi4mdwxbbN56SfpinU2ELVCqyXJ6no0/8JdMg=;
 b=DUnTmMmU4vohWXnPEM/TXIglkfE0AX2QgkI6fEZ0t2jV5ZsaUyiQrkrPYLjF1pVH8UxpPvDMPEDZzkOlUdwCZOy2H8s5/h4B7lwHYjgQmv+YjawgfN97zmfU38amktKV47u/2qgDMFZx0tsZ3Ih/YcvjApApDwEWAEQWT1IOtYR3Vx8Ud3lA4iD1qoCWxe4wYg5JteJ/zszurxxPL5ie/frOrD2lo4Oaktcwe6rLkU59Lij7clP9E9FbBJgMfSvKvVw/QG987DYcd7W1RciKyBuMrvq4371I4J1rWn5mmh6f7LAiqYTbjHNCOIlFbtqSGK+JF0JzxBWZHwtDbGrqKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB5804.namprd11.prod.outlook.com (2603:10b6:806:237::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 07:08:33 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 07:08:33 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] qemu.bbclass: move to classes/ directory so that INHERIT can use it
Date: Mon,  7 Apr 2025 00:08:27 -0700
Message-ID: <20250407070827.423672-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0198.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::23) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: 8554c50f-5911-443a-d832-08dd75a3022f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IZPLc8+RNxWUVmrb1PIkm+MQBANl8NAODeHCOoojjpAV8EHw6XH3EPRveqUF?=
 =?us-ascii?Q?GAtb9IUFO5/WYuRTIs9hWpr9aCt6s3J1xvxbvqicyQoaCcWMB63dflSvG+rq?=
 =?us-ascii?Q?661kc3TaEQY/z+j/Y0xVmU9Z47+aG842S5lIX7hVnWzuapEu4usocevr/4Fy?=
 =?us-ascii?Q?y0cs+c8hw+zoO5i8U08T3+YYe1I79v3m5fOMhZ3zjRHXkCZh/zYa+lgYOYXl?=
 =?us-ascii?Q?Q204p4TBJkj/AyLojP3wwe78Zo6MaQKPV1E+EQkLrUDYkbo/pBReK5BK0VXl?=
 =?us-ascii?Q?uGlHGb8psWF5icIehKfkaCBulNmKmGbQjFvCQv69W1O9RNbe2DEp72Ip7dYZ?=
 =?us-ascii?Q?GnjqNm/H3ixc+B8jzKNCKAxDkJxuahChQ/veDNQNUNNUoQHc6eBcoGQntRyo?=
 =?us-ascii?Q?WK60MuclsnAd+NZV4LAoE6IQdeIx7LKgL9pZmukN34Zg1pRdLevAK/fDKTtL?=
 =?us-ascii?Q?VR/dSGgtlKb59qErsiw4FTBbWnxR/NNxCVbc3OSrX+FbNYogGFnqP59WyWFj?=
 =?us-ascii?Q?J1G3yTftZtd6p/4plSF+ovD6qhvmTWvJ26VbkIr+dNTxg+6JqwitCmuOY47E?=
 =?us-ascii?Q?AHZNhxt6rPGIXxVnN9ZaZ8taX9SyrbmgxHpvhWmr4doJnHjns/Z2XtXqdlfo?=
 =?us-ascii?Q?2OlDR6np5vNkyeQV4SEzebGGGEQ49bNu4F9yu5SmWZdLve7raRxweVt5oZrG?=
 =?us-ascii?Q?7y0nM2NlPzjjRjNrzubvAWf0qFG6PAZO7t24SEKhioyfqZfGden7GlgyifFz?=
 =?us-ascii?Q?0at9qgTMVR+dMOY85zXcQPe+VBhq3TxTDr3lFIbj5U7WNW1RncthoIwadXrf?=
 =?us-ascii?Q?ys5tGJNjUGyRyuQ+59Z94gqpg1h7KK8qGcE/fUGEendwU2TNEVRpw4reWpTS?=
 =?us-ascii?Q?N7gxc/WowSzvq/GdKdw7RGLJgDqhGDIuSv1gYnGTXMPZ4VG2ORquaDQTVZQj?=
 =?us-ascii?Q?YCuSGnIt9lV9dmBlVtF8mE6N+lRxq9waPz1UZOQzFZX8jsuM4s2Z5oAmo4ch?=
 =?us-ascii?Q?ilJMYyAnTabREytRLNbS/FtMQvjQkvSmzh9jVPanJcOVItKlVtl6xkkmLurV?=
 =?us-ascii?Q?nXU1PDqAR/CkMgc688BBnMYlJAYCY4EHPR+3vbZeJ1xHm19ZTl6qHc4vqMEz?=
 =?us-ascii?Q?Rz38/i+DqTB/xYBsZ1oQ4XPx6qTT6ax4mXE8Qi5AYtJO+qZt/uSVcsWk+jGu?=
 =?us-ascii?Q?ZBWw2dTiVjGBQI7LMitGpzW5snm9oxw1FZ1Ys3Fd/M+qk5V8FSrIpfx8qsj4?=
 =?us-ascii?Q?Ss3Zc1UvE6g68gqP0ixL/VxdSYG9+HwnSXt4TqumcSXcOzsWWbnsB3kONwPx?=
 =?us-ascii?Q?nAQWdokKBlIb5dnRb2WnLHKsIYfZ9Dqe17iLfVG2A46VXtB2mYB3pcjC4N7+?=
 =?us-ascii?Q?iidKw0vfGNNfJbfc8jG5Dwq4hpUasThmk/3ymkabjodpUQwveTvnflwJMVr8?=
 =?us-ascii?Q?Pabq7MJhHfaIDdGbGkaNW8zHNi/q9b/R?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7uUOuwWXwjjZZuDM6gmTcNILIBQ+qAMGX8N87nj3+lomSpEnOYqF1ZeoCxTr?=
 =?us-ascii?Q?+Z5ekfrdL8xLNtu+HRSTzhYeglOI+neWs89Fj4CLtMynz8ZXEL+3npBo1Sgc?=
 =?us-ascii?Q?3/c4wcuk0I0s0MjyZc225N+eaCVOrxgS4M0O1bK63Pu3y9BDOaYS/ch+PVi0?=
 =?us-ascii?Q?WikdI33LWVJfrqXh8pzhPlLBehVdbkygCXlcfvTnk0Ksdq45nAVsgIrRVTGG?=
 =?us-ascii?Q?LwObPvaNUYiPVVSnl5Nc1XN0LOjEf1SbNfrCNj2YtcMZcp8oOBiFU0VcIbwu?=
 =?us-ascii?Q?Ia1+SZB3TSiCaic7KiGwZp6grSSbiaXQlaeLP7qj/ao6gzpjVxWUwnkDq3Iv?=
 =?us-ascii?Q?9VM7ukPYBEy+V2l8NscMzA0SJQuxjq2OvS2FKvD2Q9A4Qb1LyGgkMbCiB609?=
 =?us-ascii?Q?jVeYDZOf7Vd7y6lhJaBEgVchhyibkIIng03yk5CoSaeXusYo2P9GVglvTy7U?=
 =?us-ascii?Q?qIdUEpiLOwKFlpA948opJR/yHWvn3kbFe07k6CUNT0pUIt1ApR9wz6CZ2z1O?=
 =?us-ascii?Q?1fD9RhkO6ajJFS67ZcY5wAO2lo9WspLNPKVSZdZtYPZ6mV9B5s+gbAkiL9e/?=
 =?us-ascii?Q?j6D7bmHWF8bGMjHiFdxw6wTO32LLC3j+1ASFLiAF2GnUHFYRXEgTMBD2UkXq?=
 =?us-ascii?Q?tz5JMnW0atWuKs+6eFGiJIHj2C7IyeNM1QccXt2aAUuUV3iPEAi+CP6+QPYM?=
 =?us-ascii?Q?ZBS/XdORooC4vSsToA585+lIlexq5VQkPi4dL9Cmy3NegKdFfuPlIq+YYV0b?=
 =?us-ascii?Q?nsdlEGdYM2GQwGLE+fqfpQXVVuo1DWC8Qmywrnw58Bif+ggxWi1LcIMn9rPu?=
 =?us-ascii?Q?kYIgvJ4STHz0Mq2phJjoQAdknjknA3jsY5R5yYxc1jyJ2WSd1z7toILLRr7I?=
 =?us-ascii?Q?nJsdf+ZSQnOFYokNq6mwgHUipXzDNc3htfzht6A/7/N4t25QYivMmBoJ9CsN?=
 =?us-ascii?Q?7m/le9Xazu0rO/3MQXZTn3ECMN4o/8ubO/zzYSXkviEwVytgrdQql1z4M0rv?=
 =?us-ascii?Q?fm7OqkKa6UtgZ5pgsYXKAZpo+JvYBTdJRB5Eer7kAyBktwk7dCiujwvR/pHW?=
 =?us-ascii?Q?xdQRoKQ4XHtsWvc757clzq/8NJHcPFkolncdEAWZrLh52L5WH80G68rVMejD?=
 =?us-ascii?Q?qoXj/EDpQmY9AEB96eaKMbsqH7A60wdmaDtxlcDK+W0lMzcPHrPfc4D7jyp7?=
 =?us-ascii?Q?VaJVz6IwK2ai1Kksug4SFSeJYtWpHK2O32us9baHJbFsYfSH9Gby+tLSAb5W?=
 =?us-ascii?Q?RvYN3kkN7SeL6Q2B6wVuG3TEEgC2fS7kikS/WGdI5pJuuwYB4ajKle8TCNA6?=
 =?us-ascii?Q?TuVV7NYwZQfJHyDdpThT+vF8TErqp5jg8eWY9l25qYGU0+S4Z3yoTjNZABH1?=
 =?us-ascii?Q?FhNMO/ud3wuBDjP1jbHOd179+gV0bIRv391cwpLiBR78Lcs5kkVVDrArVdul?=
 =?us-ascii?Q?ZITS+Z01JeWS6Wst09uWKewWGRmq9OT7nDRVYjMsVvw7rM3K2SmzoK5UDUzl?=
 =?us-ascii?Q?2APwLKAxlx4Up5c9cN/rg4GFIMxw3tDTvLy4j4G+dwdnQK/Zhg4OKORguZ+m?=
 =?us-ascii?Q?svL/ca+WKAo1tviLnTGbgBtdAgwy7FTdgCDLQMSj3nCBRTXu01I1euNWCD/1?=
 =?us-ascii?Q?iA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8554c50f-5911-443a-d832-08dd75a3022f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 07:08:33.4672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /tVNBeYA+uAt1iWc6AZ6As3BBHF1Fev7pUbkGcJMl8YSsTFbCoY8XMi/QKxcELehnVUPqZ+qeH/1KqYQCxMlJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5804
X-Proofpoint-GUID: u4uYKDCcRXn1viG8AmugaQWlmYor1uZi
X-Authority-Analysis: v=2.4 cv=YJefyQGx c=1 sm=1 tr=0 ts=67f379f4 cx=c_pps a=S2IcI55zTQM2EKrhu3zyRw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=w_HbZ-kElbsavAsC:21 a=xqWC_Br6kY4A:10
 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=FV6ArUzwdl8t4RwbUzQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: u4uYKDCcRXn1viG8AmugaQWlmYor1uZi
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxlogscore=653 adultscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504070050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 07:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214399

From: Chen Qi <Qi.Chen@windriver.com>

The functions in this bbclass make running binaries via qemu user mode
easier. These functions are generally useful, regardless of how this
bbclass is inherited (via "inherit" or "INHERIT"). So move it to classes/
directory so that these functions could be used by both individual recipes
and other bbclass that are intended to be used via INHERIT.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/{classes-recipe => classes}/qemu.bbclass | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/{classes-recipe => classes}/qemu.bbclass (100%)

diff --git a/meta/classes-recipe/qemu.bbclass b/meta/classes/qemu.bbclass
similarity index 100%
rename from meta/classes-recipe/qemu.bbclass
rename to meta/classes/qemu.bbclass
-- 
2.49.0


