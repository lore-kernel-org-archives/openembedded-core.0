Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B04ACCD1BE
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 11:27:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17682.1761218822789429223
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 04:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gxE+W6Zn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23915c5530=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59N6ddno587344
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=cfulRwytJfi9vWAecnMqzcC79bviZ/lLbO8BEB8uLKg=; b=
	gxE+W6ZnDcW69ESNqytRNgMh07TYa8mTVJQ+tGXpl/jcfPo/8ARgqJvExW14o0X6
	4I3EcHXgNLcfSC2mGAE/h4ngqLsWEm1jyJsvLrKSkDEabx49PQ7+rLDWnnoz7s07
	QopiHH/V8UcryvFKXtmKH5r0F09+x/ekb9RQ8dk54xVD+t7jNnVc7X6utmiY9RZb
	AxvqmzCZ48a6sw1+6iRTIFR2EJsSAGkN352ZG+DxauVPs9naffLIWOlm2BEN4TqJ
	W8lKNWM2r1XtsvxqV2ojhin3rwR9MY0fjbKp/ZyBtMxp4Zbpk35JrEI/xt8NTFKl
	iqZ4EyvuLWRRdBSaIvoC5A==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012051.outbound.protection.outlook.com [52.101.48.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49y8atgj65-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:27:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hnUuaUqhsac4npBAk3/1rPXc4zLsbmRNRKodEmJARvKdEd7rQTII5c4lHzLuiwjrUx9yXT4kP+6U/3Tq3j0YGgSCUFn7a1IPBVNp/AuGif8EumbJclaJF6PHh5Vvg0LKBrr5753T6iKxh4GEKqYfvpvI1FraDd6fZ9kYvrRAAGt03pHMyMF0QFRisA3yNtq9/v6hR4dusA9pwP0VZHAgyihKzwZe4WhgyfdRwtgilRwbZ5S1T+Q9kYm0EeYib+KvhfT39uNqk2bnM845cznm/lo6SrSVy2KacGMt+f0j5ZwRgZpv9IYqCcGP4Y/52PCx/5DFBpz4JCV6UI7keHO6Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfulRwytJfi9vWAecnMqzcC79bviZ/lLbO8BEB8uLKg=;
 b=ZODHcgjjXU/sHQMHysyF/VS1xo8rx4VZUDCccVMeIVpxJxuzzIuSGo4e2UUYEMZyLe5/CNoRkqU7CEEENJKyE75ivo6yw4jnp2AgZ1tRYdOqZbqGLsLBw5I1PVtFrvIa3pc4w27J2/poyTRJT793xBsz4sul5SQAcxTitW52GvO4qmHwIrvARMe5dc7/5HMHne84S4LwvHA+4u3lp1KWMv6JSRbpA6PLrW0OhIuHyiJbbbdIwtLqbcFFZCPuzey40aBQVyR40ZrxIdjEVBoGwCPL0MphGPwsOVk/ydkaYJLzkQBNFxvUvxZoFGhjFHhk1frGvLPNQ2SLH2FQ06x9Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ5PPF8B3F23403.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::842) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 11:26:59 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 11:26:59 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [RFC PATCH 1/7] bindgen-cli: extend BBCLASSEXTEND to include nativesdk
Date: Thu, 23 Oct 2025 04:25:41 -0700
Message-ID: <20251023112547.4044904-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251023112547.4044904-1-Harish.Sadineni@windriver.com>
References: <20251023112547.4044904-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0091.namprd03.prod.outlook.com
 (2603:10b6:a03:333::6) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ5PPF8B3F23403:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ba48e65-7a6e-4b0f-d1c0-08de122714d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EyjnmUnNeuzl+pYuMSmJLK9GURp9OBZxHNIUMV3UBkHFUGYkmqBWa8Duveyi?=
 =?us-ascii?Q?eZtY7DdXhUXxT9SXl6V7Rf8R6MkbWvRxKVfH+hvlynz/DB6PH/byMFZiWBTP?=
 =?us-ascii?Q?Lgc1VTJSPb8wbiYMKUUk/6Y2vgyMA+B19TCQHl3Mf//3YUBgbhJa3d/CxwaG?=
 =?us-ascii?Q?Fw77eRGUrpqraYLRdOPfiaZ/QD6XBIJcW06MSzfP0RLk3KyQEJqQAL74Zg5M?=
 =?us-ascii?Q?PDB6k+/DuuQUmS8lVGH4TwLyeVBxtKG59jmpvz15pEcBOdwvcOw82EJCV2B4?=
 =?us-ascii?Q?CaYBnDudH0SBqC+YkFtL3BeauQgB/yaqP41dr5Ki49rNumEg8PlpsY2JgXtk?=
 =?us-ascii?Q?AHl0VuG7ATCb97+IcJQsGmr3YDJzicwwLWLnw/xCw/6dpbMsWsCS1pa5Fgzy?=
 =?us-ascii?Q?38vAWoFHUzm2m03IOQVQDH1DZEvN830KMSH+L71SEfj0LQIBodNl0bMDJUZx?=
 =?us-ascii?Q?S1OJjC8vnwzYnDUoj7DfxSG+i37AiF8MtbxOp4tXHRqLRPj+xBaOu4Xkf7L1?=
 =?us-ascii?Q?tmsZGVnVLRUzLk9iex+2wUDoIL41Wsb2O2fz/w19iEpYyLmhkvFaJtSZlUcO?=
 =?us-ascii?Q?xRZRUqRt7U5bKt33r+/XRnU8N71A7bGX1VcRWUdMgSZusOrIfQg6aXe0Yado?=
 =?us-ascii?Q?CUGlHP3lyNmTMY0RXojLA+c0Vi83Qrpd2CfgqWrarGltyzHgnzF3nNBHGFlY?=
 =?us-ascii?Q?12OWnUgU8zv3xVhNfnE1zfN5SVFo6kXYhMJEpSGTMDHH1bgyJ410HV5M0gsa?=
 =?us-ascii?Q?siYrNBrpbCoKocjCk8i3AbkZRmWu8n1NINIgLgHwHy5eTOIYmZorhlj/qqhd?=
 =?us-ascii?Q?stquSYyVHsrtBPGFo7KYDHpCdeKWAe+I3rxNCnyjs3yNxIMhj9rKmkHm1n9m?=
 =?us-ascii?Q?QNCTC40xYI/9TGzw8KV+LOfhns7vDLwAIfCJXdnru1g4Zg8CZ9tEVgcUN2BH?=
 =?us-ascii?Q?OnOd+c4Mj2b178KIUxR5RoisMB9WzRqgFhdDRR6g0VWQAezJ5J3+BWkTrPpT?=
 =?us-ascii?Q?VQTzfqtUKUW8HlRfhGTsgjalCdviW67YI6Mm3WbRgTQU9FrU/wGBQh6EEj3d?=
 =?us-ascii?Q?56qCFeILza5oG3Ye0/zMSS6RaKuVSBiB4SiyLhi6pii29rOn39Dwt+YyL4nO?=
 =?us-ascii?Q?FL1i1We0oze5lBbwgqfI+3iECoEdPOXtNCca3WIRMEP3/uzmI53Ytngk6eTk?=
 =?us-ascii?Q?CKdgzmpSBpNPR22zyss24ahpe5VE2xIPZf6ZU9jFTtT2a3L6LHrvkbBRDobS?=
 =?us-ascii?Q?esDj0oi3jkfxviplfr8+2I5Xnsxun9WB3NS1oxqekf00LuJ8lOyqyU1T7PKN?=
 =?us-ascii?Q?SQKrA1PoFXZz1MYpper4KkrFcb+wp023NxlJe6/2H5kZ56LT2EU8x6/Mm7Ag?=
 =?us-ascii?Q?XVkf81dZZosPh9DM5G5T4dhJ1ulYb0HGhhxIsppGHZHz6e3hf9wu5q0uyFhY?=
 =?us-ascii?Q?TZXA+kxfwFjuKIyWoA9qg6P4LC9XLgsyqt5AHZ387zmSq/FktQ/lgbHqWlOi?=
 =?us-ascii?Q?KlOor0ISjgC6B5LMBZDl8VOaoIZXrYBT4p6N?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XdLXea4lUhph++WP9l273Pf6fJG/RUkWdZ9ghmn8wjAUdMJIH7uS55q0z2lm?=
 =?us-ascii?Q?0shpQg1kXdraCZSRiI/zYhp33V3wKjbdt53uXrGyVFb+HIe1u+8BaMnY5xzV?=
 =?us-ascii?Q?oT7PFZeEHESlzRaHPIhoa+nx4t4WPJkEkGsuqKZ1IO2+Q9FnbuHPZOeFwLN3?=
 =?us-ascii?Q?ByKQ4MNGCZWQ8DouvwajscihvAdMBDBZWCVqmVpC9grnmnk+L0k/VkN7swG1?=
 =?us-ascii?Q?K9xGHWzCC3s336nQG/rV6r8EuQli88PxhYfJnGTlXasOoS5TbXMJJeQSN64y?=
 =?us-ascii?Q?kh5WbhYCMHKqzsmuH1sp1TbkAORcT0NiljsuDhN1TuPXnBU3U7NTioRGJhn3?=
 =?us-ascii?Q?meEYWqP63r6AyZXfEEZWmUphhBuRjS4yVhaUwP7eTk7wGOx7G4/frbEwWBjL?=
 =?us-ascii?Q?CwX/qVWuYCL6qDRTvMXeE5giuQZRw5Qo3Xa3uo3qxYs/YyGT9wF3CEbGEPIX?=
 =?us-ascii?Q?G1OXNAjWotgfZo352CQGQ6/QoCtTV4ME1Q1FcNLhAPCPvsB/VeHlmcw7ERNc?=
 =?us-ascii?Q?GmBcOTJzTesvcqtRWuVAjHYuWQGpLuM+BBNYgVJVL7vyS7w7LOrtuFxJMgrM?=
 =?us-ascii?Q?c6jS2g18CJxHb3/gM1XmGBqmxViEbNtkYq4yluEHBuUgpMSa2w0pp61g402r?=
 =?us-ascii?Q?3cVswIQvL5ZLlayKO8jtalrKVXVi66qdCtivnGyB2x12dusmvVP6oA66JtUr?=
 =?us-ascii?Q?WQj51R+vbUvd20P5ySDOARPmLbYks6KOkhxE74xdACR6CEdeekVnXNlemXzt?=
 =?us-ascii?Q?O04hzkVbdJ+nDqbFzQNaWVBYHKuZgCXkLmelA1TZz9/v4E3/eXRFsSRYepDf?=
 =?us-ascii?Q?Jf2z/c8Cl+p4WyfvuXMge+8UMvshgwe6ykpielhLCnHpzO/H4gpJ6Tmj+IJD?=
 =?us-ascii?Q?IQVaU42O/PJA5AyZcqu2+PKUfnH+tkFkGiyOW0r2Ogq6CJLhQM2J0NLarAPJ?=
 =?us-ascii?Q?MiUOn1qc8KMNpHjncX0LDvdooTXVavmMpVhIzaGXgqU/irtFJt2xNldd4CNM?=
 =?us-ascii?Q?AKKL8OEd1rYOorD7U9j+vSr8saP4TBBfPLxfVjaqzQMp25DCtlvWlrWI7I1C?=
 =?us-ascii?Q?5DjFJR8muxPOGL0gWLTNsldzV/n+7MO0DQo5Vs4eOBl4D8ZKlRiocGUsL/JB?=
 =?us-ascii?Q?/mNtfXZ9JC7CLvslLnOKBGB4gFbbPS90olxNpM9+R7uiFvf7TvvH8tU7sI6B?=
 =?us-ascii?Q?D4/CaDfGMLeRRPjsy8rH51nCN4S7w+cMeUgWrLX+tZBfUEGGuhZ8HcnRD3tW?=
 =?us-ascii?Q?SPSg6jD69nZdxgIgK+hkKls8rfLtDa9Wb5LPfNRxzb+tzYFQqkKg2OpLNp/p?=
 =?us-ascii?Q?J13BfyOxlxUBo5heyB5AKNoT16yYvNyh1Z7HpO0QOZ955Uy+eK8QepUXoui3?=
 =?us-ascii?Q?MqdfvtgWn3+w9X5LDCn3PFeITXHtrO2u353do0SFHfz7B42/6NPV/2KxjS03?=
 =?us-ascii?Q?BTYRuSpxmdbmjkCRh8cq1Zu1Q0T69wXvMUtKtnRLQpHpl9KxnwwwvSYbOoHI?=
 =?us-ascii?Q?7HZTsCH9/8Hre70hHaJPi973lUqGIdgswTcyygtTtBldNSEmjMtqNgkoKYbO?=
 =?us-ascii?Q?T07k0M4DhjGNlrhzLGLNGn7YL3Fk0krckjP4CnxHBqgZ0rzL7f1GN4P68tPJ?=
 =?us-ascii?Q?XlRPpcy1h94+jWiv+gKMD3A=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba48e65-7a6e-4b0f-d1c0-08de122714d0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 11:26:59.6875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTzPKMW+8J1cQFsAhxLYFRcdVe/rmGBJUfcH9v0QFgXDTxMNtdkSCgTaSVKh2bBOesUQVJiCAHX0AelnhUIRFzvy2rHr3fgM/BDjCZVuexw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8B3F23403
X-Authority-Analysis: v=2.4 cv=N9ck1m9B c=1 sm=1 tr=0 ts=68fa1105 cx=c_pps
 a=1XVf1DeqYCuQPrRRBBNiYg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=giED5mSNaOMbM826fEsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDEwMyBTYWx0ZWRfX5oLBIC0EtpGv
 G5T9ApFtjpsTRsYvHgzcqbnVGtNF7g2oFRCIySiK3o/EaQWnEACBvw1Xj7KdbiKqp4qVRwrMQpe
 lOXLslXiSchWhsMjOQ4NdRofCHekNq58/Ws+/N7qmNdjAR8xKXZwHYIYALOz3ABePzIDrUHi+rr
 ZNM3pbPQRVHMyyhOv0SmrDU+5Q/lat/n7XxM2z+tds7FIKGm+rKwE9wpfm0cI5pT2uRUq3UoqCh
 eqko5Z0EsnfvYS99g3tnko2d6k5atO6xWVuSak7zp+i0ulJ0TluC0pBLzbhI/Mug/HtNnhuP7MU
 10icHu8B/Xf2MwzlX1fARekjAeiTIYr8ADNou2i73jZ8Rj/LgOiCyDYwMHJhLqGtJQb4EyD2xdf
 IqFs+r/aiK5TdWTpPiSv2SM6RgY4KA==
X-Proofpoint-ORIG-GUID: uVb3cRDJ1_3wdNbE7q0FG56a1k96WHyH
X-Proofpoint-GUID: uVb3cRDJ1_3wdNbE7q0FG56a1k96WHyH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510230103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225237

From: Harish Sadineni <Harish.Sadineni@windriver.com>

To support building Rust bindings in the SDK environment, bindgen needs to
be available for the `nativesdk` class as well.

This is required as part of making Rust available, where bindgen is a common
dependency for generating Rust FFI bindings from C headers during cross-compilation.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
index 2f3ec04e82..72dadfe52f 100644
--- a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
+++ b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
@@ -15,4 +15,4 @@ do_install:append:class-native() {
 	create_wrapper ${D}/${bindir}/bindgen LIBCLANG_PATH="${STAGING_LIBDIR_NATIVE}"
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.49.0


