Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD7ECD3C52B
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 10:18:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12531.1765361907826841888
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 02:18:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qxnxIPAi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4439ea1cec=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6A2AZ128616
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 10:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Z5I0CGjhc
	ehZdyFJfOV1doSSLH/BbgOHb6nhd2WTbU0=; b=qxnxIPAi0qDQKwPWmGfwpIgAQ
	13n/vcguEBRyR8neT46tvHj2ojTBMxhLoqPtWlOaOsREZZZHb4spfTL2t+mcY8jT
	TYP+hIhf/oUap+7qOZZrjUdJDl+CDhqcpc3C2JoFxt22Az5eYMT2zIzlqrNyJn7A
	SVq6t/C5PNdn2F4Yo5dJY8ahXtrOPFIHepYbMNhjHltucg1mcfeqbIZ++M1PDPSy
	YDY6OhWHOX0egYyeESFnYnBm1dqE29cc7zKtEaNQuZgF65PayClNZ2gI7+qtBq2x
	9z4C0+ZhFaa8oBMmB6ozIHWkk3YW+p15vUvRKWfKCCgrqRPpVJXhvLMgjpB3g==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012024.outbound.protection.outlook.com [52.101.48.24])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay07hrd2b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 10:18:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2UgMTouEaqh2cl+yyPVy89aViNBbE1XYG9Pr0Ua1X9Dby1BJa8n37kfF4Jgsno2Reh9S5RjkAw9GfxVcm3b/ftjrxcoFzZOhf8RAkSd2M4vuiIDlxfuzRFeU2oB4wkcGy313sPbBFaXsEDASSHfWHORvR3fEQ4uigHBGKM/WwVOUHR6kgMdLHPw0hmSNtG+BKLuDrmI/3x7v7/78Q8tkARoGTMEFNgLrjEmfRYs4QTg5lVR13klLleenJ5VflSx0eIF/fo7M8a1+0gEXmc1txmJWKbLQirE1VATfBxjDn2arD6d30xSYcJ/KP/r2YHyC39iq607CNWtRRTZyQc7tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5I0CGjhcehZdyFJfOV1doSSLH/BbgOHb6nhd2WTbU0=;
 b=P0fndKcSm7ORf1U9Ajzdgp/svR3ItZlNzzr4GV7AuuqpcwfSY2H2IWEO06XZmKLIVg10rrmFfXJZKEci02EJv6VFuwcgHGrYtC6D+K6Pbx6i5vsUP+e7aL72b24wHj3AcqomOxFDGtyyBk0S/fgZ+YdbwGIvwEAJDaYSiITZBsQrLKHalz1qjCb/rxmQyIj4AiMGKXdSSmBVO1ZVhHooQxg3XIqa33SLYalapgPHYZX1xVmFhsU+Q7GuGvJE1pxOCdA76BGQFvmpbYwx1Bhlnc2+jgWtWypRvK5Falww3dkbh9rKTgDY9ty/6rrdmWDzxXKGMBDPhR5Dpa2YOyrFPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by PH0PR11MB7562.namprd11.prod.outlook.com (2603:10b6:510:287::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 10:18:23 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 10:18:23 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        sunilkumar.dora@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH 1/5] rust: add missing zlib and zstd dependencies
Date: Wed, 10 Dec 2025 02:17:59 -0800
Message-ID: <20251210101803.1120711-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0185.namprd05.prod.outlook.com
 (2603:10b6:a03:330::10) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|PH0PR11MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: e6627887-156b-49ad-6446-08de37d5731d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8Yo3hNlqcAv4ze3jTWFgOsmD6FHTaTPzIXDmnxfGzc96/KjNFkPu04EyVwRb?=
 =?us-ascii?Q?dUWMZNq72Bkih034lzM0QIqxfwTjTeYdyUidZvemgvrN83H2zf53ANYdL/cp?=
 =?us-ascii?Q?luG6of1O35D6ddhG+f7x/DPYf0R/yPAy0o2FDXSh1a/YHC9h4l4Tv0ILpfU1?=
 =?us-ascii?Q?MeWzLaAYiUtupM5hd/oWIhi9KXfquHTWCaHNXsl8ikEmalu4W6M3vfO0107C?=
 =?us-ascii?Q?BtV0oQS5xQqMIuwgh2ISdBfAYh83K+TzOn2ixc6TwnYcbcUMli97uHxy43YR?=
 =?us-ascii?Q?i6XK9j4CcGBsnpfz7zYnjQHJm5npdjRZSPX3rDwlXtU2me5W5BODfz9UKbLS?=
 =?us-ascii?Q?OkBJBAlEPQUvbKDA4E0x0jFj5jVPgFcqf3iwmOL978VvTvL3WxDuN/Eed4Me?=
 =?us-ascii?Q?KnrZmGAJIp7++NJhRt9U90GmQGgP+wk9cNmYiMtHlchYnx3LWcmmlyqDJEAI?=
 =?us-ascii?Q?HFxJfAF8OZJ2EnbPfaM+AEzJS8Wd5wEOrlqjL3lyr0egLr8t2kruGPrdrRqa?=
 =?us-ascii?Q?XF4e1wzGRjzAkg7mP1703HF9cLtbSnI6yffLDeElCejLqhqBy6LNYSesX6h3?=
 =?us-ascii?Q?gxGAfs/CYMuVeuhh0F1ufJU05b8fDNb1NlEc1RWjX0xy2g5jASsW8xH/p3RO?=
 =?us-ascii?Q?LL4nJMv/OMO+aSeUZgKQQNdZjFkTWwwenadXwcvO1tHl4Nz/q9bieoIPac6O?=
 =?us-ascii?Q?Q6/lnulIxXssa/n4jLGHBcTV9pdEn+UyslAX/Ujpu9y5PTpYRPnv2P3CgQ38?=
 =?us-ascii?Q?0PzGfUHKFiyWiV279qZGOGj6YVCfwSSHcDiKyB64hVOjcVzQlW6zBUnm4MpA?=
 =?us-ascii?Q?KQpZE7UhpXvwYBQBSUfZ7ShedHSfwFy2tKs0a52fljDGOoCtA80Onl0LjVKB?=
 =?us-ascii?Q?rxkSUPRIbLXN21mvsMko4vWYNk7a+crJLlstwkC1K7UjHcD+1ujCqd9LnRfE?=
 =?us-ascii?Q?92o+T4lVZH+QYv/hlvW5OMJ3bPa4bBWCjeC3eKS6KidojshvdLN/t+icrzSf?=
 =?us-ascii?Q?FKe+rm+curK/Jq5GEr+iSNB69TtSmFXN7tTQPS52teFdOfrDxR85gKGzGczA?=
 =?us-ascii?Q?p9mfwqgG0hfYCC5qCF62FbNnbRgBAI/oA2NSfsoJDRe2aOOS2oJl91kKUniU?=
 =?us-ascii?Q?1+tsVNneZfiAyGRfK983amJkHy4BIeYrL6LDgS3v/anwo9P66dyeX9EELrum?=
 =?us-ascii?Q?7k9m0AOPNhtuwp+cQJTOvlvCQp82S4PhSAnNqcHHq3zTb+xwLFlmjEu2quta?=
 =?us-ascii?Q?RqKEjuBEWErHxdqGohnGbF+ddSVpCnIN69KiHi8W/15ccuUs6r/6hsAsMUTI?=
 =?us-ascii?Q?pWi3TQ24/IPABjBOajXsSYrUp4DxmNnQT2FOHyImqAhYUbPrd9NRtxa/wCwX?=
 =?us-ascii?Q?POtqFosGIPApu4Qg/+ozDEVPLQX4cScmcOAjQUzoRn8j679BJagbRVFmIHX9?=
 =?us-ascii?Q?8Y7HGLlaFRiV/NsC+1mQXCoPX+90wtEZJ86n4kOdq9eeFjgXby/Mmk8fgq5+?=
 =?us-ascii?Q?CnRYl/iatJ8sxlJ/wwsVtxNtmxYIzwvn8zbx?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lBtOYwLSHL9OAyHsAgJ6rKVJFziXWpm26saQQ3kWf6hLYaITMUrxYoH9KaOg?=
 =?us-ascii?Q?78s3dp9XWSJsV32HwxW+pQaWBg8olfRwRBMWZuwz95Xx16aXq/GS6ZJGDlO0?=
 =?us-ascii?Q?TYRn4D8cCTmvfc8DXjcYSSXxOnLr4HhufE0ybU+GQWt9lKq2G2FQ8rjlpgB/?=
 =?us-ascii?Q?BoSf3jISqiQVQPmBdqZda97mm+dKHZvfqO2OE15yBYDbfEVt/rz0JL7x+0A+?=
 =?us-ascii?Q?HJt0YOA4rBqhTk7HqlfpQet8q1QAURu9ixSH2N41uyEhqG9Slmre3adBdAk4?=
 =?us-ascii?Q?Tu3rQelXT7G6RMg2HGEAUTERNWM1j1q7ZyoxBNOuTir2+Pj7eUW8Ig43F+rR?=
 =?us-ascii?Q?MZpfP8eP1S6f/pbXmHUxzHwSsVPmmZntQdKbGc8FWfIwm8ygVyuhDNp5CrS6?=
 =?us-ascii?Q?mGIOZRpbU0t9I7RDmq4vn7YkuFgrHkj2jerKfDg4tfIcDYLv+wm1TfQQ3rH1?=
 =?us-ascii?Q?40xhesgZz8IUgEqQ9WPKUudpB9fcKsZy2RIU4VVu/P07ICssbg/CI9Uqmzct?=
 =?us-ascii?Q?0q19Ay98WG8ntL9kWlmQe7DJsYEPI/zJUCsSygm5Vo4WK+9i5uNsaxwHd02J?=
 =?us-ascii?Q?EirNFycxdx7vGcssDDDBuIgWYZ2Wd/EPa+kAkYCzwpSZr8zjQ7ckVSIC9tTx?=
 =?us-ascii?Q?AdsdhYYVGLqTIDgmNcfyqzRK0g5NP+FnOqqYdF8/yVDi5YEZ32e0A1FTBhhL?=
 =?us-ascii?Q?KNajm/W8l+ayPtvw7pn5KNVsO4OkwnGSQVU2DEQDdgm33GbrjC4LUBq4fYqz?=
 =?us-ascii?Q?L4Zmg+ItJq7Qg7DYUEDAiXwT0IOJPfJZIL4qHAc69qc7QZFl+XAf2q7YpGYG?=
 =?us-ascii?Q?EJqAhiuuIyTplIKztEHMWsHW3W5ZdhZjNNaDWbfbfi47hbWZkc+clOkE+Rbr?=
 =?us-ascii?Q?6pw+/wIz/OBfps9KHhBkDLv6aZcX8srKF7uJm0iA4Mw11235pMj7uXBpNN6L?=
 =?us-ascii?Q?x/l47lsTYn1S34ITGVvMaKEYa9Kg7y50nS/1hVjLCHVDuAtyigQ6ZPWN3DbD?=
 =?us-ascii?Q?yHj04t+fjwtRgS2cvo4GPgYIRDtWR5OiRrdw3xH8HPmGZsZgRdLGd/NV1mHX?=
 =?us-ascii?Q?p2lzBMyqX/5agyxAoVX37mfXlOXQjc6/Y9dESa2v7yuuMril/ZaycgBqI2i6?=
 =?us-ascii?Q?Mj26pMFDvVa8scK6qo6PQ0f7vk+ka6H+jZpdNeSUx/TEhShhfyeDxVIH20TI?=
 =?us-ascii?Q?yGN/WOBThmh6FlI5G6LfBkJdndZbs0IM9qGmmP+GN8Sm+qxWLqUG7KTgSisA?=
 =?us-ascii?Q?SLg+NP1DHs4wB8pcdYOK4oHblIkZBxU/lSeZ3K8Ahfud5x3Wt1dJm679/Y16?=
 =?us-ascii?Q?UO8vgiJEMX2TbkUeTgLm8R1PLdjvu6vmgm/w1Q9issxhwp0X/V7iENV7x+Gc?=
 =?us-ascii?Q?SWs+ml9LZtCUdy7SnHxLzkjjmH3AybNTGf9PGMkxEXtY37oEZi9VNbK3/poP?=
 =?us-ascii?Q?61l0gJzGfiAgOfk4JWwrESb9XZWc8n6j4Tclg0DClWYEGGD0bjlT4F33+tDo?=
 =?us-ascii?Q?k3oTjLpE2er9f8uW/pzdLVRCSPiiXZQNZRhDvQBMTojrJSGQ7Yum8HAhJ4r/?=
 =?us-ascii?Q?cW6yAP1vemqq0Cm9f86JAPfv0S5f1rAI4yv3tqdKr5qUIw1366VnuwU7nC5S?=
 =?us-ascii?Q?0g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6627887-156b-49ad-6446-08de37d5731d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 10:18:23.3626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3yMP9VNv49MbJWF3fExhOALWbhIQ+QJC8URwHn6BiyOWFvAgBqNsb7B5fDFaJGJ9jbhZlaMbmasCMCl14grkjcbpE8OIYugO9g6mb6G8dN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7562
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA4NSBTYWx0ZWRfX0rcxjWey7VQ2
 Z5QkzKfI5LVFLb3Gac8xI10r/K7fJoDLwrku+bhwxXH65ICo/HEDURtolF4vHZ1ofASnv9ZnAO9
 nEBAxoxbdVwXjAfoAicrPjw0oZPnMc+Rm7VRQVbCCY2HXIQlVRnU7yjtqHuFTQm6xtwsbyVvaCZ
 ueI9k5Ij83yWhQHZDnHkPDfbkJ6rTzxMZqcq+ZrirlqvBk7w+Feku9spa+v4Yl9pDyqUttPnPsu
 dl1HkwdR1Q139KfcBFuyFRMK1m/QtOIdbCGgfwJA2FUi6BWoIMJ7Pbj9V6D4FaXVKKLHfltfUWu
 bXieGIVspf6rm8aaLd3fW+YO9lhVYHSrUqtSBSVC2Ta/0b9XR0rb03iMBK4jsnVZNRb/kYKKVSV
 NgQPIZcODSt2zGonM4binCcS6wlZNw==
X-Proofpoint-ORIG-GUID: i0S25OlXpxkKpPCmhDxHYibnE05ydtmk
X-Proofpoint-GUID: i0S25OlXpxkKpPCmhDxHYibnE05ydtmk
X-Authority-Analysis: v=2.4 cv=dbyNHHXe c=1 sm=1 tr=0 ts=693948f2 cx=c_pps
 a=0dUMnQhOFwHl/g2jU5Tm3A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=a_U1oVfrAAAA:8 a=t7CeM3EgAAAA:8 a=nfL57PFk8sWjUCby0-EA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 10:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227461

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

Rust's internal LLVM requires zlib and zstd compression libraries when
building rustc_codegen_llvm and other compiler components.
Without these dependencies, building Rust for target fails
with linker errors:

  error: linking with `target-rust-ccld` failed: exit status: 1
  = note: undefined reference to `compress2'
  = note: undefined reference to `uncompress'
  = note: undefined reference to `ZSTD_decompress'
  = note: undefined reference to `ZSTD_isError'
  = note: undefined reference to `ZSTD_compress2'
  = note: undefined reference to `crc32'

This manifested in oe-selftest failure on qemuppc:
  oe-selftest -r rust.RustSelfTestSystemEmulated.test_rust

Additionally, this was observed while testing with other targets as well.

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 31222e2456..01a98339a6 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -47,7 +47,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
         bitbake("{} -c test_compile".format(recipe))
         builddir = get_bb_var("RUSTSRC", "rust")
         # build core-image-minimal with required packages
-        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp"]
+        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp", "libzstd"]
         features = []
         features.append('IMAGE_FEATURES += "ssh-server-dropbear"')
         features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(default_installed_packages)))
@@ -124,7 +124,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
             cmd = cmd + " export RUST_TARGET_PATH=%s/rust-targets;" % rustlibpath
             # Strip debug symbols from test binaries to reduce size (300+ MB -> ~140 MB)
             # PowerPC mac99 QEMU has 768MB RAM limit, so we need to minimize test binary sizes
-            cmd = cmd + " export RUSTFLAGS='-C strip=debuginfo';"
+            cmd = cmd + " export RUSTFLAGS='-C strip=debuginfo -Clink-arg=-lz -Clink-arg=-lzstd';"
             # Trigger testing.
             cmd = cmd + " export TEST_DEVICE_ADDR=\"%s:12345\";" % qemu.ip
             cmd = cmd + " cd %s; python3 src/bootstrap/bootstrap.py test %s --target %s" % (builddir, testargs, targetsys)
-- 
2.49.0


