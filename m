Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676F2CA5FCC
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 17:54:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12478.1768931683282195794
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 09:54:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FFnI2zrq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K6TTiB1185015
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=1hgkzVh45fB8yLND+Nro/r3sd+Y8J44QlEFsNoxIiSY=; b=
	FFnI2zrqU9ZIF3fjO29dEjJ1tQu2Taq0Aft0bnJyWHz3fFp9fHlEVtkXm7VmMRLM
	U6H+fm2TpOe4N4XPnkwIkf4ZHdYYFlek7lXPeE4/RSpsE/SmrAB+8O6194eBKaRE
	01LbLx2//9yCTPH5EvvcKuG2hnXvQQ8X/FTriDyR/JpMpA56zofUpN0adsrydzQv
	tUqEdu67BhJWjHgsZb9y7ggD85iXWnZ0MLZLMqirG6zpW3SufiWQXeAbrG6c2CdC
	fVZ/oNifXmOaKkOxJ47Oj9fQp3/JBt1aE3jbnu+CI+xkjC0NNePm4X5wQDDkQuPT
	CWFfl4kW9HD1Ue3uUuoTAQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011045.outbound.protection.outlook.com [40.93.194.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4br1d4bcr4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 17:54:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wea4AKu/DVnlSOVXPzygiJBz5/VfRhT6APD7bK9FmkWnxKWxAFOTyDgVF2Xbtn6yzXTjLwNggBEpKrFql/1hhrpi3xnJuBIEB3uAM+QH5D1hO9fMj7AAFKqJZlrpFQq8zFl1adwT0lJVkQ2P7S6+UC0TzrdhI2DN7D1/brKP4z66nw1dRMLKvJPC9a6NuApwxqr0cG/HVT5FoxY03S3qUhoxcY5PlqqI2FSVU7GB1LDs55UgfoXR65KedlwOuAhTKC+Iuq2T1WMO9N6WAnPijCnQFw3fN0ZjBKgGnVQjX6s1EnK41miLRgrNzICdk5F4FIXDtpH5n041d3lESsqelg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hgkzVh45fB8yLND+Nro/r3sd+Y8J44QlEFsNoxIiSY=;
 b=MGpXIlt/imUQdn9amXcO4zbw4kUo4bboCgWK/4MDUMJMGQNWCvoowKGewA4aY0V0/FniaTLjJfHsR2NO7lujCEJ9dV/6081pzA6/tWEL5m2dICf1oY55s0mBPEe7O+GusIvFNO4f9IN/HComi97eUFRAWGE4iIP0MEcXzlLddm16VEh7A7SFJgg8vIpUrRWmebAu+3szujoWAmP8Bfeu8r9SQ3Yl/pUK7wWb/zrg/xuLcyHvdW5nkbRb0qcsYbhYJqMKQrmB0/q0KLG4hok//OVjkWuWUWIgzynWeVHfe8vfPPhY20vI4JobbUMLso/hjVcYD8rih8aOM8CO2vl54g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL1PR11MB6027.namprd11.prod.outlook.com (2603:10b6:208:392::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:54:39 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:54:39 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v3 16/16] runtime_test: Add rust-out-of-tree selftest
Date: Tue, 20 Jan 2026 09:52:46 -0800
Message-ID: <20260120175246.2052341-17-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
References: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL1PR11MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d999339-2a26-46f7-1487-08de584cfba9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pRcprj1FW8ZIcC3xhfjpGtoOkGjBYFPNbkuJCFic7Sac40vDDX6Xh290wpgg?=
 =?us-ascii?Q?BRYvuthkyGd7ta9iIITCuPJi7nbNHRAvIeFukKF1INLqHDLzqW/P+P6HkQEq?=
 =?us-ascii?Q?YPoiZMcbubVG39ADbfphqZmAbBIujmAR9bW/WbD6MFxWbfKw9Dxrl5QS6DOE?=
 =?us-ascii?Q?cZ8f85PW7rk38N46xxEwUdo8k1oz3OsWfxa1pRjvF/qm+0TH6Xvj3ElZLpEB?=
 =?us-ascii?Q?1zxQbmRsUuD9l+a0h8nJPmuaEmk/xooIQk6BbocZb7wNUv8S8Gy13BOOEnod?=
 =?us-ascii?Q?4GHb4jvouvbtov5fAjCpfWQNq1TuxzA7a7sS7jJjVVV0VXBq3rcK1RbhcGa+?=
 =?us-ascii?Q?541Kca35KSQO3SlRsvem1Jh5qwTIsEyGgXJVL0/YN+RJ2k6jGsY+W6zwMVpK?=
 =?us-ascii?Q?T7xiTlpe4k68jm28ygwdhtR6BeUgJyymXiD5AubDWH5UMnhNMG9AYTUd2aIs?=
 =?us-ascii?Q?T49VL6edeMvgaVhiqsn8D3hfm/xqS8oNvscTp6rpMi/3Q5ZKYe9xQ/kEIgFB?=
 =?us-ascii?Q?KNDBugupAK71fwhbyYlGy4KRRLs5gCz4FG+9A7uNBhFCURlf4Of1tCW3SpFN?=
 =?us-ascii?Q?gp3MM/6esoRaMu5d5aRQGKJ1j9l8koeMtV6poC0genSM05T5yB/mXSnaBguw?=
 =?us-ascii?Q?YM0qEW1xS5NX3EQOvze0MHDWUcHVb7R/bjOUST1yEgLOvzWR5frQ/Hzo9r6y?=
 =?us-ascii?Q?23FHI9shkJdo4yxDskND1q/n/Q0W+Q+Et9a018157rj3eLhbWNxl8XZYoIWs?=
 =?us-ascii?Q?xZchxi/Q/Et2T3gMCbS2pvmiH9n6iFt76nDXY3ddQh+BUUm1K1RtGtrD2PSb?=
 =?us-ascii?Q?4+RBcbThY/f0DqLpRPUxK/8POt3/OaxYRn/8tSoMp/A6C8PI8h1r5hOr4t47?=
 =?us-ascii?Q?RTsLhB3xP4Fa6xpP5VpOSdlBE5obOdPMQD5KTaPLkOHVskFyLd1ZzSGCjIez?=
 =?us-ascii?Q?RSONrTN9tju9MBX+dmHveEnPBHOXPKHsrWqmUzdB2TGvCWqaeNgNldNtot+S?=
 =?us-ascii?Q?F3TZVm5lR5JR5itxoHQ6HDftOQvLYhCcSEYp1sHFPH0/0c76roBpnhlCl/kx?=
 =?us-ascii?Q?rMBYVcFdMrW1yOOIFYD8k0uK4oxaqRgWvukXeJ42Ofy6enlOFzxOygFduLz2?=
 =?us-ascii?Q?e/+QLS0QVqQL04Dj89RHrH8Rspx6PUu5QDbio0ObtV4wxEqPA9pojVdybkgA?=
 =?us-ascii?Q?P1RgggBGg6Oem5vczX7F+SW4PUGycUtjrwQJhJyY09CPk37zOeylUUsc0brL?=
 =?us-ascii?Q?Dc/v0w4J78KKlYCN7l0XPVhXuOiPPdp6Gxpjk+/RQYgFf/2kWtiuySQrdOUW?=
 =?us-ascii?Q?dfb0uzn/m3C5rIpIQ/ZlSPEEr5dm1WdMn7E/+DlywU4jbxgaM5BeNgDe/KTf?=
 =?us-ascii?Q?3+yKSOncPwf7s457IUIiRC00AIpDGu14eKXcRkP5Hey4q4XH1QrwAZDI2YV3?=
 =?us-ascii?Q?DkpYrZvRf82CElU8NwFRnkXGyD9DnEYmL+P2bZk2XU/rQCEsm2Rd1YR8Jiss?=
 =?us-ascii?Q?5lV/kT5GU6m0r2z5G7GXeXsGc6AiI20pNZbXMOwC0Ouocr3aft6r8jPZ8Uie?=
 =?us-ascii?Q?IUUzp4yW+6XZONkDgLshIFSwDbLJaOulR0DpGUDReMk59Dq5LBXyXPyITeYv?=
 =?us-ascii?Q?EVEuCP6BOCjsIOrVyg/n2Is=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FBlSWGUTTzQ0IMK00x/QkSL+D0PtQzD3N1iJYycXFzu1uLzT7HFPTjlXT18V?=
 =?us-ascii?Q?RCQ9EjANgiPLhgKlAFhGBpMpt8qzk0CiPVaeEwmNVSSWxrYNQtAnwvsza5sO?=
 =?us-ascii?Q?uY9Ocx/c1HmkqT5egN9X55gcAN7kngp9Xe/zhmhagcYp6Fv8k2USNgc+yL1Q?=
 =?us-ascii?Q?K1gsQn9dWDYzdbQz0MaamSXM/Y20DAzg9w1VQ1+Mi7TgynYKbfC2fE43Bw51?=
 =?us-ascii?Q?UOaCT5Ym0HinAQt6h/iKgf3vsj44/ynaepHPM3FXyYoq7uKZcXbBo6eLYtji?=
 =?us-ascii?Q?5Lfop2B/pwA6ePWk2/GOns+T4lHZ4b0a/tMVK752FXneE8Fj5kaMrJXCN9FK?=
 =?us-ascii?Q?htGCWU4xkfZggH2cAp4AG17098t7hYwlq1Q53EVQufBwcfHE9yHn+trTDpUn?=
 =?us-ascii?Q?vd9VPTEoSTLcagX+KhQkPfERs8FO57yPAt6OILGv8bGxF4bC0Sz0bign+D0C?=
 =?us-ascii?Q?F53+ZsND/S6BarHezfwS6I8Ft4+H9SgirR8B8uZRbTPXx4OYwrSs4AR4Fwl5?=
 =?us-ascii?Q?gUtfLDgYeX1/Tt6+G+edaxxE8nEEBr2C8FhAiprhoirm4q3m43ZxnKax2k9c?=
 =?us-ascii?Q?ui3qSgupwnvf6QtEhNT5XlZ9cyAuWDJ2qtVhqeXk2U4DMwQ4W8B45G41dGvG?=
 =?us-ascii?Q?pFG7VC5wb3V5ztzCfC7/4l3zhR2G8xL3xCG6rjmgV9wfrY29I9YnAmzc0EZ7?=
 =?us-ascii?Q?g7FiRFqetEhRbVABLtwQK4RHaB5kvZ5G1lqXAbg88ninZ4Vd72LzpUFUAUNc?=
 =?us-ascii?Q?MQrULrBkILxPjrvGQdh40u6+fcjeYCwwpHx7CQFNM2E6VUDcglv+zbqMVEjt?=
 =?us-ascii?Q?TLZpVdXJNauG9Iir7VtnNdbf7+EnSpY8YVXeR+L/cTplTL3fit527GFPNYc/?=
 =?us-ascii?Q?nfIc3YNHFwCzzgJTxJXNpxxnlfemKXJTlGmazgzHaFjqOi+fWJ0VuQ7j7T5t?=
 =?us-ascii?Q?hD6KLeUluqducJE+/eJpyb7d1whLt5i8exuyxMbF+afzy2KOyrimdLs4jlQU?=
 =?us-ascii?Q?FTBpU0wJl6R5oQyhkJJudiMfei3OgTKWUs35NFDbXRUubKdSI7j/+dSMsiv2?=
 =?us-ascii?Q?ib0BEiX7zSWkG2xU4wFyQxEl/T1WEDeGkSKjCrQRxACblFJQYdDTFfytUHOx?=
 =?us-ascii?Q?HvBXY/Up3yjGD3V4wrIGMUzuOofxo61DtcMcROlGBKN46UHbHjCs5uGJqCaS?=
 =?us-ascii?Q?lpHZKxxc+2zlGJ/zgy+VHK1U720U9wX7uvZOz4Y418IRnvE2fw5ZFDTF4g+4?=
 =?us-ascii?Q?+SDiA9EvE4jnnANR/4IwV3wxn31oGa44fi1+3zDLlNd11gk3WrxBqnD9Atma?=
 =?us-ascii?Q?qlJlmKL9cd5Pqi1hFRKkmhdgoyNv1rZP1DI9DUv2ma8SkFMpCwTOEtTuqmd2?=
 =?us-ascii?Q?uTTJg9YmNoPW8SYBhP6CtBXou6Cf9OFBgZ17n1VFOdNGulcSCKj5MR+J+70h?=
 =?us-ascii?Q?cmT2us04Tl6Yhvx8x0JlrLhjo8aka3xp1o/cZuf6fJZmQziDpmJSJnVoP6sf?=
 =?us-ascii?Q?NXoJp6T5wPOOldBiBBWf0J0HXjczOwW+lEpoTGQ9JtLo84DI/DrXmcE0/cN7?=
 =?us-ascii?Q?7/vBg885bPsLdx/bo1rCnd6PNFhhQU/EWZl5NxbT+uOXbQ6whnFqpzgRCgZ1?=
 =?us-ascii?Q?e6ynnaQWFGyjHul59Fok/qG8e4QMJFAYCzNCKozuuxARP4hLdWiG6g0Hgd/z?=
 =?us-ascii?Q?WadaDIykD/NmZHFtDf9epzCigXu/Zeg0d1fmcTtvCrHEMxAI2kXUxZ/yRwPJ?=
 =?us-ascii?Q?3gNBJ/Yu9vqj4ibQMa3MLFK2jKu+z9I=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d999339-2a26-46f7-1487-08de584cfba9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:54:39.7005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J10G/J6VY46MEQL2p1WkBpj6Q/zr+UwxrVM826UIlsHLYudg2feinqjv5LMEZjWZr8ucW/n/DBM2O8YOv0uJZXkO7Wdd9izdDe5EjK9q/58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6027
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: dc53dW2gn-WdUjkvBDZ12GKiN5iYi4sr
X-Authority-Analysis: v=2.4 cv=Rs3I7SmK c=1 sm=1 tr=0 ts=696fc162 cx=c_pps
 a=z/rjtr9/JqYX5j7IdmSYkQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=PMCPsi-Yzk6GkJUXyKcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ABXjpxMrBebh24Mk6W8rt2xtEZuZjzeO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0OSBTYWx0ZWRfX5xGsuJrPk5CQ
 qjybERMnd5ktol6XNeXe0koNQqXcPvbaGd42fhCRBcP5jtVtPKuDRT5TDDiB/IxqjkMqLRLP1qO
 WyuW37fVkJmwj5XMKYtdamsFjsjSKTm1psl01oSq6Jxb/0UWXmNmrnpEiYJR8DThKgUIQj6YKM/
 u6CEUChe+K4M/teWJNzuyLnrB7TZa0ItIvh0NxEumnT1meq49FdL85K35KMIHxtYi9mfpUxcJVI
 5yAyQQK0/P5/fxZ2eWSPXYUB+MLtAZdwRu5grXu53RkmSqqsb1hHB/g/1Z+CoyMPwDbFUpLf6N2
 UWmw/VfzBv53h/PyOZCKabdOFXwv5A+hIFGwalCOHAW9ftStjzBczxxMwS/F0AFhlnkM4XeSXcI
 53uY50+l1846evmwZFAJM1su8jhFgZe9Fyf5eXvYuS9k9MualGbeU6RGq5YxW1GceAtZ5bDv8DB
 L3B2cM/rBWpbHxwOjWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229763

From: Yoann Congal <yoann.congal@smile.fr>

This new case tests that the rust-out-of-tree-module recipe compiles and
run properly: check that the dmesg output is as expected.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index e8374606a4..461116601d 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -494,8 +494,11 @@ class RustKernel(OESelftestTestCase):
             self.write_config(textwrap.dedent("""
                 DISTRO_FEATURES:append = ' rust-kernel'
                 KERNEL_EXTRA_FEATURES:append = ' features/kernel-sample/kernel-rust-sample.scc'
-                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal"
+                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal kernel-module-rust-out-of-tree"
             """))
+
+            runCmd('bitbake-layers add-layer %s' % os.path.join(get_bb_var("COREBASE"), 'meta-skeleton'))
+            self.add_command_to_tearDown('bitbake-layers remove-layer */meta-skeleton')
             bitbake(self.image)
 
             with runqemu(self.image, runqemuparams = "nographic") as qemu:
@@ -506,3 +509,10 @@ class RustKernel(OESelftestTestCase):
                 self.logger.debug(f"rust_minimal dmesg output:\n" + textwrap.indent(output, "  "))
                 self.assertIn("Rust minimal sample", output, "Kernel Rust sample expected output not found in dmesg")
 
+                qemu.run_serial("dmesg -c > /dev/null")
+                status, _ = qemu.run_serial("modprobe rust_out_of_tree")
+                self.assertEqual(status, 1, "Loading rust_out_of_tree module failed!")
+                _, output = qemu.run_serial("dmesg")
+                self.logger.debug(f"rust_out_of_tree dmesg output:\n" + textwrap.indent(output, "  "))
+                self.assertIn("Rust out-of-tree sample", output, "Out-of-tree Rust sample expected output not found in dmesg")
+
-- 
2.49.0


