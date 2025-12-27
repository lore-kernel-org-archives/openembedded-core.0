Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BD1E8FDDC
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 11:33:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6440.1766835226263203375
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 03:33:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IgQyzAP+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44567337af=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BRBU2ZY677966
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 03:33:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=BMDicyTVcK6sWHn+54LoPXMjrKB3Qad2dJR4ZxwUYFE=; b=
	IgQyzAP+yl5CDXniHkns7t+BIJOKiZHB45iH+uLaP0Vg+sGP5eCMNCqjllQ7C/mB
	Sy1e88/Nc+ffnQKjLQ3SAPtpkDTUFNDjHaLUM+g2dTOANjTCkebdUhKb3/v5OtRl
	pYja6+yO2REV671Frqe0Tg1f9Fc6TtKF7NE8xDmG0YkUi2o/zodQ9cCBeAauZE/7
	j/cT3/PFIkuJlfi8H5uQuC4Oig8JlkZ4lX+WHwuG0m3spe8+W3+H3v8ZhZbD6Foz
	FkVdSB8T1f7ORg6lb3dUyhi5pL+b7pe7U4TQQYwJCoHKrV38sqWf6+2awTm6yxl0
	7CgEfmB5PiYywA/KJqHpSA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010012.outbound.protection.outlook.com [52.101.201.12])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5v6he2pk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 03:33:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aLWx7pWcbfWbaNi/VcfTtl3KyNwZWyLMQB3bxsoCByRa3BvdVNyenuy/Q7ugoa+vzmMn0tcVrny0M34dmuXw439ftFm8Xt1aLcW/Ylks/dZbnyb/xJ1pTfdpIhlKGC7yNVBjZijWzN88Xendd+796Ln5GtG4tR77i5USghBQZzzFvoTcO3SYGZbN5+Teskbp5aHyPz80ZwD/QHfAx2NXrnn5lyhcK6E95BxnwyXUxgnZQlUmnllKuZm9iG0ngvYRiMnXLcfgoRiKGvdUMuwLf4wiReasVccc1qURcwq6TUbIBiidHGmbRyEGDJsfegDtj7MIU7ZIzcx81e9MxTLMlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMDicyTVcK6sWHn+54LoPXMjrKB3Qad2dJR4ZxwUYFE=;
 b=PaTjGj6MVSEqzCBDBJiR1+M7gkPbEH/hdBzVPGif10ucaPRyPy/tFTxuIhoLgCT6RmgK0/Z0Z8i467Snxa5uaQbk1wlq2HioYbmOvXqyoL1CgAVS/hLi9MgDL0PZIcAcX5myLIiRYo8RHzcIpO4DFr7w4oDIX0mgvmBiCZFUTpQRc5msZcwuj6PhmiLTZxvT2xn2MmQQ5Lj+0/RhDKpONl9qGbCx/DhFVSgCoAwBMvzbwy+DgxVsoa5BXIzA3+rnBJdvDBfb6DcCFpz3Km3cmvjJEuLFcl88WIsAhDxq0J8nhvck9y0YsZcNfuwWBAT8OzCrT9AoQQx4Y6amNU/eFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Sat, 27 Dec
 2025 11:33:44 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9456.013; Sat, 27 Dec 2025
 11:33:44 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH 07/16] linux-yocto: enable Rust support in kernel configuration
Date: Sat, 27 Dec 2025 03:32:42 -0800
Message-ID: <20251227113251.773795-8-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
References: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ0PR11MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: 965fa1c6-4af6-464f-1fbf-08de453bcabd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9CyfNXMZ1MQ0m4MgPAkaguefFsOacMK3b3Rth33Xs0OBil5NyRP0otOkqK7b?=
 =?us-ascii?Q?IYyLRaHZLG8dmxBnT3YW9elBu6PRw91KRiYOuE8KtsDPEsiYrTkMNUEBLFie?=
 =?us-ascii?Q?rQX47tPHlHhp27syY3tgCnG0Kf3NHMomhx/kLNrDrM6n8b2iPt5DS4/kanWy?=
 =?us-ascii?Q?DC8bOS9L9vQ+P9msEhPAHdONzWHwKUAkiMNfDNlut6SIdyHIYbvNeSL76PL6?=
 =?us-ascii?Q?x1nS2aUR471dCy+dDD2a8ihpw9IT/paaVR+H6x7h6/667lbzGkrr54lo5TZO?=
 =?us-ascii?Q?odIwq3feKXvniuvNq3Dti34CGb2AZcob+DCXO6h6EyQ9zb91vGkYuQweO/JO?=
 =?us-ascii?Q?KeHBYj/d9PMbgzbXG0BTgIPXWwvT1Xe4AQ9VvHmouY1mjY/+ucd4x9BNTAOv?=
 =?us-ascii?Q?74SVwJn0TlQa/CUpIa+TEq/nX9ISdy7zHcSiOVhrS3rUH6jjwGHuGx3BylyP?=
 =?us-ascii?Q?HihSUPTdNuTWjQWmLm3A+kSWlhfVLcDLH86XTIraFbAJUQeIIBR0doiac0La?=
 =?us-ascii?Q?duU4tWVNzHTVWQt3pKKBmCHr8EiB5P1xDEaUPSmimBxslu+JxhCie53Y6U1X?=
 =?us-ascii?Q?6CjeGFRcydT9AcqCm6w8Yv0EcitcwsMlDC1UZ/0rS+uG/r45HoO29HI+bEx/?=
 =?us-ascii?Q?XNGPyQztq/hw0MZwaLKy1to+qmErWRLBELXH6itkxnC+cD2dlNbQi2CaKZv+?=
 =?us-ascii?Q?GjjDCea5H3IPbjWzqgrg79Q3sCc4hA9YdFY6zCYkaL6dcilVe9V/m8zt4iIl?=
 =?us-ascii?Q?dBZVhRftCYHtlrvigc0v/hOsumdWLvJ5KT5M36eTu4zgBTzIY4YGVayZfpyn?=
 =?us-ascii?Q?nkjv10DAGRtNnoTWZv//4E3Locbp+Lh3nyECFBkB9kbknnHmvPUuQMOZnEkX?=
 =?us-ascii?Q?bsAlBvP+5/Hn4IUlU6W1tvaAbxAdY8X4ZbplDYjIICMBK8xfbb6/epmdFKOJ?=
 =?us-ascii?Q?CwHCIhqYxK1gLlTXL97jU11SoQscJ3E9k5XO1ZrYXIqTdsU9v1kXV7JsWeFq?=
 =?us-ascii?Q?PdLMAOUj1/Rh0d7xje93e/SHGDbJfqTVGa7d8ni9BhmBS8AFqrgo4S1eRwup?=
 =?us-ascii?Q?MXN7HWCeFReXa9+O5ChmwNPjIHPZlKelo2dhlPHF8xDXuHMYK2Z8HkGPfeIe?=
 =?us-ascii?Q?broZ+rn0A3eS5wyBUva5yBtfc+LJ/gu5GgvObEYeeQStEQZVcTrduRIwSH36?=
 =?us-ascii?Q?mvVgQAf/8BGDlqhvZ77bxRRAg0GUW6R13W1FJBf4AkeS+lVhzOz/5aELrAWo?=
 =?us-ascii?Q?gThDSLEnrf7tcBiwyP4kfFUkpw3AGZLHtFikLMKgsCL6Tayrp8BKaweYcIRH?=
 =?us-ascii?Q?ORN5jPLphTwnE5fpHI1mG7xNEcjXIdNnMnRK3jI7Ox0jOMoK1MOHBbwXu4vq?=
 =?us-ascii?Q?QwvZoeyeCx9PoNamojor96d/zxD5L0xmjnwZmb25BuzoyrtK0yK11DKlS4Se?=
 =?us-ascii?Q?qb+nSfa+fTIZ9VdwEu1HRXLVV5gOiuCqiFbT2BATdWZTKUva/V5EUYqaNlqa?=
 =?us-ascii?Q?mSNlAawO0T4xX8OsLZHK3vlaibU9TgcanFgC?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TREYcvOsJWq1ml5ULH/S4SZxlvCcBaarfS9TUIHeCs/UpCGmtfuiez5Vna+V?=
 =?us-ascii?Q?QDxldSVF0IU1UIYGN4fNOYynmTJsylgYcOnFccJMcXMXztd8T+7K5F2vacSj?=
 =?us-ascii?Q?i30woLiBBHnlhgYv4bsqk7pUZkLKRY3OkT8zCna3wyNnHpdwbetqxKxQsco6?=
 =?us-ascii?Q?mRBcslZzVZd2uawlnQL/+vyZfDgIs3F5YnDVmOOzTv+5mq4aAcMMVilkActE?=
 =?us-ascii?Q?vGpK5cSWKjdRrn10IQtwpsh0UzsG+irXHcMErSiNKwZdzkNJKb6AwaTzOqcN?=
 =?us-ascii?Q?qg3dNRpFz9feOaaLu5o3exDEPdIMrFPktFEwOy/8FAypCNeA68jPicb4K2UC?=
 =?us-ascii?Q?aUC7jheoumXGmk/BH6cv1ubIQnBIynpgCKywILdISvr9BECEN/56/TNCCoCG?=
 =?us-ascii?Q?xGd8YKK9Ith9DkimQFRo4n+hgzfQ5PZ5jVBFCZSiZiknvhM1SehZIWQKFeCo?=
 =?us-ascii?Q?pivMpTOp3SLpxhB0Xr1MMB0Kl4kfLmVnzB0EuPliTrBg8MeLwaVEIJ/nJT7o?=
 =?us-ascii?Q?WX+i8Ye+cG7G58OqfXghyND4yVQn16ztieBpNzMLUa1TqydTqE2cKJ7CQvoE?=
 =?us-ascii?Q?pyDL8fmbfeGaScL9A3czQn+zPOUaBYjTG5K+1JCFQFe3HEuFv2M7s5ANEW3A?=
 =?us-ascii?Q?/Yq5YjdWIK60BjpwaTfks5Z2c4ceC9F164kIZeYtrhTrBzHHEE+X1bY8jt7L?=
 =?us-ascii?Q?A4Y/DmlE7o5u8hUtrU3M1EIegHbr5S34eiV0DR6duhdbAghLmVuDI5XTdlzW?=
 =?us-ascii?Q?0IP8W1eQxMIIJxySz4567zar68OVdKkNTXAaU5vpdeXaThZfzi8D/yr65edf?=
 =?us-ascii?Q?cCAt5PjC3Ou42+S6CSFA+UR7CC3cwRt5s0p2PY8dSjayz2wF4lqqOpWvDIbR?=
 =?us-ascii?Q?ljS4pqE1obrqMfkcaxdzwhls/71/EE7sk8RPJ7haQorQenDxQ2wnG9pisrOL?=
 =?us-ascii?Q?yOoe/SQqudqCerQKy0NadQeZI8Xu4kJwLMv3Qg1e4PncT+zVNjDGeR4fzX0A?=
 =?us-ascii?Q?uR7BiMKlNd2uHYcTn6Jt4ZVHOmNxt2J/w3ZHx2O3H891caaUMCo+VwNBygrg?=
 =?us-ascii?Q?0Arh7A7LjqOmZ2+5yHMp4sYXI53TdEnuY9qO1J1nzsnepQKF6hNqhNiB076y?=
 =?us-ascii?Q?CC+LPL2rQtXDzpckw6VWnfO/9VwXqroQTjkzIAXHMYJa+0S81CyL7TwEv3Fq?=
 =?us-ascii?Q?My77Zg5bXQJ7Z/iJ7PMflItXjILfZ7g2pbIc56byJQlQOMJrS6gW4+d1FGq7?=
 =?us-ascii?Q?RF/qLOJ6hylhVTBPovvFkV7iBFNQTw3O77X3/AXJnYHeQYhF8RD+9rKO9gAv?=
 =?us-ascii?Q?kSLtwOwXSZuhkthi4viHxU0dJb3VebAi8FB8j6YsbNEmcqzQndnXeDa5U/Wo?=
 =?us-ascii?Q?LfC0bjE7x4jAXlyJBh23FyfabROCjiIJU23BFnpwOZt19u2Cwq3kSYwq7fam?=
 =?us-ascii?Q?jSO94yhaz/m7QLbCQI6ego92weHVhnDkOX7IkXO6HtgytcIiZDfvmPgCK8MB?=
 =?us-ascii?Q?YT7At7FWrkIuVPnYeMDh/iXjnIi4Y8q5sBvJCDNNLkME/Z0h83O+YyearanS?=
 =?us-ascii?Q?WFWTj1ALyJFQFHU78nWh9jbRaHQMgKY150rlJYdrTaD3S0TzH6o+yzd45fbS?=
 =?us-ascii?Q?IqkHnp4Npuzic1v4rAWri+y6PuCKeo33n/w6kvGY4COVYCf8+PEawm7sa0f0?=
 =?us-ascii?Q?dg7TW0RsCmDR8olq51OtffOEzUPOQQ08lkpiEbXwFQ5QeDoe1Rs52cGe8TgZ?=
 =?us-ascii?Q?isEKEuih+JCEtEoAQNTFicNIkUBzOAo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 965fa1c6-4af6-464f-1fbf-08de453bcabd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 11:33:44.0939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E5r/xZkpfeQFpLwfrKBhtb9USzeMPdfmRgIXSJEq0R/ETAPTZVz/sKFSwJgfIQTiX/EMlMnidu0kC55QvWA3fHcA8k4eTzTrkDmkrX8Kj5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDEwNyBTYWx0ZWRfX8VUscUAeNC11
 gVoMn9gqTJ8z7P07cPtVeinCoHwwKhJ73VgdMYk0opKjcgadiWPNj6JDxErHUZH1vYej341JUJ7
 239yDdxrUAtV9nEKumrBetjdV/PBXWHq6Lj3PYsHozWNXWo+VehoQbPyKCkBAbMavFaB2w6hYZw
 15MMGCyLCZ9DL0S5iMVOq5WszD47+3cixll6FMzIvHHU+JECcU+azKvMhuIUK5OarACrXje8gmc
 DEdCX1ZX/5NKrdlvX1fvOJxQ8HqvwNDJeS/rB5o3amjy+VXpFhufUIfQKL1FnBjvKa7f7MQx2og
 wTTgs6Zl9j2NEHt5K6aHsDDAu9WJguADyrG/RBsWoMhlowx1RNbZpUuul7y92cbxmBdi4iGjayq
 LV+Nc9EPASNgz7uRJR7MN2ORMtpsFSJI26kEwkP31oVlvZ1J6txGDi0QwASXnFmHpuTMeLMEX2B
 v8yv7uq0T77Pxu5T23g==
X-Proofpoint-GUID: LRua2Z58H6nkUvjEV0aYQQGgMER6hDM-
X-Proofpoint-ORIG-GUID: 3dgG78-_wiM7x5C-MCczQLLncvPC_0Ax
X-Authority-Analysis: v=2.4 cv=KYffcAYD c=1 sm=1 tr=0 ts=694fc419 cx=c_pps
 a=jCxDXDPT0EaKR6BOOOS6sQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=jmWgeBySreYrfzyKUjkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228561

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add initial support for building the Linux kernel with Rust enabled:

- Update `linux-yocto_${PV}.bb` to:
  - Append `features/kernel-rust/kernel-rust.scc` to `KERNEL_FEATURES`.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_6.16.bb | 1 +
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index 408f14b451..e468fdc0d7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -77,3 +77,4 @@ KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
 # Check again during next major version upgrade
 KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
+KERNEL_FEATURES:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' features/kernel-rust/kernel-rust.scc', '', d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 562a997020..0b9e5279ee 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -77,3 +77,4 @@ KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
 # Check again during next major version upgrade
 KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
+KERNEL_FEATURES:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' features/kernel-rust/kernel-rust.scc', '', d)}"
-- 
2.49.0


