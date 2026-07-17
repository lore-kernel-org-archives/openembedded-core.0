Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07AF0C4451B
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 21:33:11 +0000 (UTC)
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com [205.220.161.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105.1784323987219243191
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 14:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@keysight.com header.s=ppfeb2020 header.b=oAJFjISj;
 dkim=pass header.i=@keysight.com header.s=selector1 header.b=NAfknCmu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: keysight.com, ip: 205.220.161.93, mailfrom: john.ripple@keysight.com)
Received: from pps.filterd (m0187212.ppops.net [127.0.0.1])
	by mx0b-003cac01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HLWl1N2855073
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 14:33:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
	X8WnHZ2THrBU1OUp64yid8GTRqDyzwEJufA4gW9kyJ4=; b=oAJFjISjx6d1Wo+k
	SBUDZ3TTR2A2hPxutI9ydoeR8HJZzN2WsZTsMuJiMmCSP9yDPuD71Su3bfGbfa6f
	kOF+AlRcc7r3/sa/PveB/IHSpWWN3OnhctICMpuOhcmJ5s6vb/+IhlBNLiLy6mO/
	ntNdgcd4gEHM0j9ppuxLyFW4PYwkK6uSpkoBSPfJtN1r7Uh7gg9CwTaL92tIsdLD
	/z5NAXxMowi9yi85Gj7qxyQYBjoKl6n8bXP2OPt6cTszBHCqZoTQg55Q2fYuXaOh
	ifYydv8+qVbRhAbmYqhx6EhM2qkuOOXvi16ZjPoB0jvdLfixRRiXlyO3Zw98RqUh
	i99aqQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010008.outbound.protection.outlook.com [52.101.46.8])
	by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 4ffgmwac26-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 14:33:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dVYQHdSIFQe0mAzC7DiT9xWlFCE10QTEho9hmb6NexS/tqjfntSIOUnImBmwL5jbC5BTbOxLxZxQVCJYPYMnZMthOkbzv5x6M3gju2obn4RvzwAYCqqoCB33/wjQzQS5WijGmN9LU8SeYNZ+3/twwSJDfqju0MLC4PLKKVDxGEjfe18UJ/rh+XQDVPQo2hiajlcLqQOqgQPhRxxqaXwY2FJVs0DqLTdSR/NN9Vw6kd+psLz5W3catn0gzIt7LahR7H143yifOccKXLrnN72Ry7vKO7EA0tnqZhsE9Pjtx5QzAXmYFSqNJGucBYlmlrLWn6f1OfDM86FRHxlUY50Upg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8WnHZ2THrBU1OUp64yid8GTRqDyzwEJufA4gW9kyJ4=;
 b=Ag+04r9XYBwFdG2titSkEkGCTe/vnA4O++IhySQY6R8fGRBIt/825Lb6BW318LGRCV7QlN/HUMvIwnk1EGgv61RkBeQXJuv/G1Nrl+vnunZynCtuZ7u7/qORPci/37k5e6AnlEmuQ1Ols53y5kRb7mjwUUC2Z/y6s9f6aeXqwq6h6k6q5UK+LyHKZ4dXX1b8O8esMZfTzNxS8leayqBKxnzkK+OlF7qLW+DLvB8bnGrtdQ6lRTSm19OVK69kv+ZfZ6N6IhLGpnZAFJKNzKTkl4ucf3Mjbsl+lKDQzggsM9vTjLN8kn10H0O9JjjIQx8z9WiosAlnrQzzMcgX56AJaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8WnHZ2THrBU1OUp64yid8GTRqDyzwEJufA4gW9kyJ4=;
 b=NAfknCmupRwz5ejU2KJB/vAXKGPlaoqX6zxUn7jHmibWASslxVVrlquFwskfps1ioKUwosNTDtaQqiD2A+8JUjSZG/2LQq6eD+2/7tIVaZqXUICjCvonbUWVfaTYxFcl532waHInbRAIvIUJgA+4og7SIr0ySltA3NIRGLq3xnY=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by PH7PR17MB6034.namprd17.prod.outlook.com (2603:10b6:510:1fe::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 21:33:02 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2%3]) with mapi id 15.21.0223.012; Fri, 17 Jul 2026
 21:33:02 +0000
From: John Ripple <john.ripple@keysight.com>
To: openembedded-core@lists.openembedded.org
Cc: John Ripple <john.ripple@keysight.com>
Subject: [meta][PATCH v3 1/3] go-vendor.bbclass: Fix test file exclusion and license propagation
Date: Fri, 17 Jul 2026 15:32:49 -0600
Message-ID: <20260717213253.3454786-2-john.ripple@keysight.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260717213253.3454786-1-john.ripple@keysight.com>
References: <20260717213253.3454786-1-john.ripple@keysight.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY3P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:fb::15) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|PH7PR17MB6034:EE_
X-MS-Office365-Filtering-Correlation-Id: 5489aec9-7b2b-4f5e-dd79-08dee44afb27
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|11063799006|56012099006|10067099003|18002099003|55112099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	21y426HrVIzDiHX0KHC+bJ9Z8miXcrpfDFSoa10mk4O4v5lKwoX8nQNTZzOyz7PcfLA0lgdMRL1uwQRHCWtZnHr7lEamI5ihbAMsO02W9VGQ/iWNrpJYW3cZbAOlZY2LCtAtUsYmq4vsPDwFIRM5KNK8K6prqYbGhrqGGiTF8JoyjwWqFxJ/E49xVK0ip4MeW7ZCR/njR8vVPMpd0OZmYQU4SjckNlYf3EpZAqzN4Wp0HQ5kk6YRhf0uHjvk9/0DllUfpEBd8qB7JrzxjHiBsbonFMHz0wLvfMgs7c7x/V/l3Mv47Y40P0zM2CPyqcOf/AEEwPxSH7gmHOaPhORBMQOh8wkmQboL6pi5r+fjU+ic8Yj/wlzmWFq5Kyr3CrI1WcER8l2tnDk12wNqjYKDIcBnmJyc2g2y+qbOLEb6N6QEhZiCrCt76Gwx8KfiSXK53+32h0YLpddz3yMzc0PWHv/WWBpJkqWsrSo813BuADdcKo3grtBgnNiV5mbUCRBnklr+Mlu/PZAdRWtpkimH4pdgOoOYLy5XjYIqdm+9IAQdRKYPRMU3gVwg7ayFXrgQkz4/2DH3wqEY0Pr6ORcBuMVN/PKncIRwrZN2HJZsbiUGxvJ0xFBuHwAjlBAtWZl4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR17MB6130.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(11063799006)(56012099006)(10067099003)(18002099003)(55112099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pxPO5SGenD5/QkpIJ8stKZMnvWe6A8JMXbhJnnEOQAGERsRBgMmc0JNWMPtQ?=
 =?us-ascii?Q?06nEE9iZI3KN48REExeIa49dIOnCLhFDmMkeIhcE3+drsEcrjs106JyKdclT?=
 =?us-ascii?Q?bjQlRoNAjdCLjMZmpZpGi1DpBfNPEBTwO0EjImFuTFR9qsFr3kyMhm0cWLGh?=
 =?us-ascii?Q?qTqdCB7cocZ5ccoHBR6wKvPWsHdalI1u24cVDZGiXI/4KpK/oDLwW7uvtuzV?=
 =?us-ascii?Q?F4CcJ8n8AVAGVi2MDg2xm8LLyPrjYRIxY0VMf9pIQZ5rgPQuLVn3dSN6e4OC?=
 =?us-ascii?Q?HBjjCYh2PrgCkMmzJLMhDHhEdYLrbD1nnsYgfYegH6iawxJnz6AbIK5g4uUR?=
 =?us-ascii?Q?ZtOLyPFzGzo0GaiBBgjUNDfrtc0N1Q06lFx5AEdE+M7pJ0zQUtmmgBdCvJOt?=
 =?us-ascii?Q?y6gtVwfj4ggmDIBEZpZGps8TApj3973OQuHbcfJJ8LAsxjz2P7NHP9AmaNef?=
 =?us-ascii?Q?BT1MhfJJq8UE90Q7t5xqPNm1JeLdjC2D+RHTHCCSFI72FgWKYrDcCnRh0MIu?=
 =?us-ascii?Q?/+txhUrvp0atnI32d/FmqPmjrvwPIdG/jJ/3JRznRTaeD4g3s/2xfDr96AVY?=
 =?us-ascii?Q?BrMmO1+1jtmUqc52aIedLukqflr1C66D0SN5vb5yAGWXkjDjQhPptfYACBij?=
 =?us-ascii?Q?Ys3w9tp4lN94QnfodVHl/QhPOVhuo72Px+kbJOK10jmgJ2AL5vOERlgTlrb2?=
 =?us-ascii?Q?dvWm+NWsYe7DEUhQdsUAI8CZRPMXXnwzTX3KoOQl8sOXfek/urT/yoBVl5D5?=
 =?us-ascii?Q?CFViqj5OGBU0KickMgym0Qe6w9Ie6Sp9AtQcdAlwisbyohPyjl+CcgpwdkqK?=
 =?us-ascii?Q?PznL91KN/iTyutNEiWl7n02sht5V6nnxPto6DjTIskO5tFO3+WPDjbeDrZk7?=
 =?us-ascii?Q?6T64Uzw+Jd+ftGUpgdwH2SAMGmFH1U/SgjPsrc5X7WC7U7jy7C6wULO6P1IK?=
 =?us-ascii?Q?tLvmbOm8hIlqPVQTpoR1gLxFfy+A43nYgwIyQW96OTX5w68BmbdWzUfUAFSx?=
 =?us-ascii?Q?jkbTM8vn6tH8Oxijz13E5utN28iItZcnwJoPsQXxJR+g9gBbiwBCe8X5psTv?=
 =?us-ascii?Q?Rnf4+D33+84/IlGBVa7ytjErfLlJ2jMyHPS8IUgfkK2gTXE/uQRxEVDaYmoe?=
 =?us-ascii?Q?BqIHEmKtC4Pu86XxdjkKJOu3pYnnDDBXBkJrmMbslwBkgvqW4kJxEKASpFTu?=
 =?us-ascii?Q?nlqmhhHEHwXBtNjdqKXpj4QT9tLtM+fzVPKinm4SQpzivktH42uTIsy+udhk?=
 =?us-ascii?Q?L7jeC8SL2IkYytZcRqTxahGSTyN2lMXnaGSkhhiHr4S5H6nP6mH3tkMTRYQr?=
 =?us-ascii?Q?pnhoekk0uEVAb2i1PpJy9Sw+lIUbLRspQ5mC1G+8IcgjUj8pLPwlXfIgfdxF?=
 =?us-ascii?Q?407T70AN6lmWioGSXcAZckvYIYg0QBzXpAQaSpwhQabYK+iO4QJaglaPdUJC?=
 =?us-ascii?Q?ZOfU3fORkOdhtWEEBD7L7eJEUXBgAEyjTdrf9bRjEyeMfbWOP+dLNb1j0oxh?=
 =?us-ascii?Q?5WL/Ykw6jSLuY/hdo86Ro5is2CgUyXZNxZ2tjSI4TqpAiS1FVy9PCzwzvzha?=
 =?us-ascii?Q?KFNgRD5MFDv+iDzWJqf5H+Tm01RFvODQ2T/bamYhraUw+hmfr3HQfic3YY79?=
 =?us-ascii?Q?zGLOewC/kjFd/KZPopqxmAhKBdZ1lxfDvKa+QmNVdLfOJ4FsOUnXEHKLvJ1N?=
 =?us-ascii?Q?1IPTheOXDdjgBdGzsR7ScyW6nbShAX8jICfsLfpLGa0QpYCNWplEl7Fbc/i5?=
 =?us-ascii?Q?8v8+MP/o8g=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	CvsjORu3frkTjY2NUgc92bbjHgqRHkbb8eOTRi/8b9dcudKenAflRSnHgeMmVh/Bct6eiyTNw4Rz60WxgCLqI/lmlXnFr/mGrPIfnYMu5aovHFOjPmTpP+7/I3SedG+T088+E6tJ2T3TcH1iN1gPeSwdyipGEVu7C8SndsMKk1+ZyQV9y8nrL88PQDBGY1HGRFCOSnBVdT5uXhz+PaqQvLZ4ZwUbcWJ7OjtG1kC/Qj5LjhTn0dKqRgjwowvMC/19BKK7/wa5KCzXWpXPkYs7cpVPe3OaJoxBghiu7y8PjfF+mf0HZU2O+5dsui5KAg3WnFyV+d45R3z13T0GdotSUw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Vixqr2g/53C1tTiSQ1Ps1vI2lwYlFTPTM/9u0c7MuoH1ASUhEGQL+5F7AA3k3zIX18MSAgCsWDZXWtfzD8k8ZjvZ1mvz4g8GARMT4dnIboSWF//pew/2Pb+jrfQRkXkkNBd3mW5yFPpTgKviCH0QWjgMZFW1HLwYvEeh3ivTRLwUFtgOK6q8rrVMX7hXGIz2+CDMLkD85yQvwRFHcGf+3FusYjNtkNVGWtDfVDuyUPxQTlL5FzPzsclx9kRCRjQCcmniarxLetxuw6Ta8ZFmbBNfXb908wAoUDKkXXuMqz420cnPZ8OdZYMuwBNCrPtGgCL1s/+iK+A8ib9X3hH3xwxEPxqO7BdpIt01kC8CLODSGb826RYTjH/PP/AgUHP1/4Lpej3P+uY8Lnlr3xQX/BvsUkNjxmaRwxS+zaCZ1CPiUKEGSDgei+GhFOHf5ZKbBlQxilMRD1vKaDTgfH9ePtOECmqjcSbRcXLtNaL1nPj2HD9ghAx9YQuqhft0UfrdbkMcrOGiwzi5i5AnzYwaB3araxOL95u5bzsy60u2HU1Cz6oi2Tol9BsgUjQyVcTJdL0kDhlJvzRAssEtLSzBC1I+T1Eeb+nrrKY65/RjBU15yj3Y3x7URfRuSwG7eSWE
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5489aec9-7b2b-4f5e-dd79-08dee44afb27
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 21:33:02.6731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IR2izEflhSo+/9TGsAhG2l1jIgW6ToX44yMdTPgS7sA7Y64OZ37SkD2pKFaHkZkmtFE441LwlvvWhzZHkDyr+xkZZnH+cJOwW45zAR3pqvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR17MB6034
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIyMiBTYWx0ZWRfX5+GbcWwTut4o
 Ko1T5n3vkUg+t9h8BchPMwbT7CP4oHTyhG9kaFp5wu3lon9C1b6Nz5aqowM6+l3qRisIAtJZzrV
 zqg1AWyyvQnZPkqF1Kkrn30+9Wi2Yz1aqgmd+r99EkzebmsZ3AIrDlBVodjTkuJNr/YpqejF4H1
 Kgsnhe2JV861hSLMbQBb7wp9yq3Xy7XoJLrRGWdkStB9fwcMByaESyT8YnEvPhDVSzTDYNWg0zR
 M/VcqfSgIvN51kzESDUYdS3JErISO4J4vj13IOKtQhKhR/rIZgDxcFYrvylQWdm+kwUI9+4J0EI
 sSmWyLHedN/hwa6+crHA3MygAuU4r7RbB1vr071SccSlq2nWQYKLQEEOW8wRiqTTY51Cdu2P5xI
 IN2iyLu5YBf3uxrKx9ppsACjHpFMj05JCtAK0dLTjj896aCj+UGAzN8eCAZjgGYUzeYSaiPAzaz
 hEW2bKIAUUh02Mu3NFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIyMiBTYWx0ZWRfX44ATiIZzOO/Z
 W7AcMpvAlsEk5Fq3r2iu7LuD1T2YDop2k4F+O5+W8zA+OWnQ1a1oJwkJC99fpSRPm8KBhJx3/NH
 ZnbRwUdKcllKYpwkFobVzDFGeC5fJq3kX5+WEB5Oh+OYc2s86H+G
X-Proofpoint-ORIG-GUID: UODcOrz_HLnXj2sYFn7ebmk2ec2gxYnr
X-Proofpoint-GUID: UODcOrz_HLnXj2sYFn7ebmk2ec2gxYnr
X-Authority-Analysis: v=2.4 cv=JeiMa0KV c=1 sm=1 tr=0 ts=6a5a9f92 cx=c_pps
 a=BRu7lVsKyHj15bVqb/Fc8Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=vu2TTH8h0NUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FLoIbiw2ZNY34kqd41oa:22 a=at2XMroQgvxonBsO-bql:22
 a=plf8rDjJAAAA:8 a=F6MVbVVLAAAA:8 a=CKkP6PFZCmJgk5SHP5AA:9
 a=JWTSs7K9Rhv-lrTctFka:22 a=6mxfPxaA-CAxv1z-Kq-J:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11849
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170222
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 21:33:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241223

Two bugs in do_go_vendor:

1. The shutil.ignore_patterns glob was "*._test.go" (with an extra dot),
   which never matches standard Go test files (*_test.go). Remove the
   extra dot.

2. The license-propagation block used os.path.join(src, "LICENSE") as the
   copy destination, writing into the already-processed vendor.fetch source
   tree rather than into the vendor destination directory.  Switch to
   os.path.join(dst, "LICENSE") so the LICENSE lands in vendor/ where go
   tools and licence scanners expect it.  Also fix the guard condition from
   not os.path.exists(subdir) (checking an unrelated relative name) to
   not os.path.exists(subdirLicense) (checking the actual target).

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
 meta/classes/go-vendor.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
index e879d629a8..85a3c1b586 100644
--- a/meta/classes/go-vendor.bbclass
+++ b/meta/classes/go-vendor.bbclass
@@ -141,7 +141,7 @@ python do_go_vendor() {
         shutil.copytree(src, dst, symlinks=True, dirs_exist_ok=True, \
             ignore=shutil.ignore_patterns(".git", \
                                             "vendor", \
-                                            "*._test.go"))
+                                            "*_test.go"))
 
         # If the root directory has a LICENSE file but not the subdir
         # we copy the root license to the sub module since the license
@@ -149,9 +149,9 @@ python do_go_vendor() {
         # see https://go.dev/ref/mod#vcs-license
         if subdir:
             rootdirLicese = os.path.join(rootdir, "LICENSE")
-            subdirLicense = os.path.join(src, "LICENSE")
+            subdirLicense = os.path.join(dst, "LICENSE")
 
-            if not os.path.exists(subdir) and \
+            if not os.path.exists(subdirLicense) and \
                 os.path.exists(rootdirLicese):
                 shutil.copy2(rootdirLicese, subdirLicense)
 

