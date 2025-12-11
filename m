Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3303D3E787
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 02:25:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13336.1765419942040336034
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 18:25:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Zr0ZI0QM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=444099e962=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BANsmYv420250
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 02:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=8210jZgjPwJLHJIp8MxOYPzBKzfmm6Zx7kvMJnxUAzg=; b=Zr0ZI0QMa2Ab
	HffK0GdNqyQsQAYrkAbmkZsqikVqDNtDmhDbOLMFwO9B22xQqmHlFld5abV//2zY
	sNVu/sFHmOrdfggcbwx9nZFcjqfkrQalMeRTjWIFeEB6GRT7gGPJuHET0yw4gNwv
	XNT5JeJz+2bH6UJC0fb4O+tQGpXM1C0RZuhckej/CHjN6x9y1hdlgqf0pW/74d+s
	LnUyVscvy3y9BHuqXs7gf4PtYx+aCy4qs5AEva9X41UtUTGsIu+dv4hhz8sbYi6H
	Upie+5EeljTciollIC0tw2jeMX4O84E8hE2vH267lnk/e6cBTqjg4qN+bFIe9ZoX
	cxC2fx4cKg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011059.outbound.protection.outlook.com [52.101.52.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay01nheu8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 02:25:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzEfO60ZP+fOS92FrYzmQBYm+GY2Yv0Ei0WShkS/RtzM8N0V63X/i938msGWPf2ZewJ9LvWOnUUOw45cWFWuhVsHL7irgxFpVYX7Eqjm18Dl221/dbrff5Ws5OonLXhFOotfdLbSyVfknzZ2Li2xX7x2IqsavI7csS3htRmwDKoWFt4VAHnmCItdRj3ZwDjsC50puG8JmRbd6/Cr4XD7DyLGYw9tK+jkdej/wur2w/slpUn0gOffgKTcqs9+UI2Px04F4CpRgIxbRCw1a0a7G8j+5Uc00zwZUZruPWGIg1fqc8MC+dw7VrpS3qfRhs/PrjhTwDobopjaPina7hC6Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8210jZgjPwJLHJIp8MxOYPzBKzfmm6Zx7kvMJnxUAzg=;
 b=PvM3J4Xoh6AZwyiFyzTxpaAbqCIKQ2N5EdPzKeWzAQoZTCw4/PV6bCQ39aI4Dq4OjKHt9BeVk0+fQIZkjBRTTOh5ix2H8oidIa5iJh8utdzcRJ8Exsm02pZxUt12OQaCC192u3EdiApAdH74NxRNWLNTfHzXs7jp6wEQdLkm561boJ9yHiknXaoIroC5fex0090y+PBsFiKu+2rf0uXiZe08YZFrCifqbbU6+8kjsZdiEU+ywx4gKNH2cJYLfmY0N5KIFE383koG+5tRmP6zvdvZh615OzcTsThmgJBsAUuwPk5Rf8y2pkKoIBLZ6ZeM0CqyX1/JulGspwFwBC2bzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SN7PR11MB6970.namprd11.prod.outlook.com (2603:10b6:806:2aa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Thu, 11 Dec
 2025 02:25:39 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 02:25:39 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] sassc: fix runtime version when using git shallow tarball
Date: Thu, 11 Dec 2025 10:25:16 +0800
Message-Id: <20251211022516.954232-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251211022516.954232-1-yi.zhao@windriver.com>
References: <20251211022516.954232-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SN7PR11MB6970:EE_
X-MS-Office365-Filtering-Correlation-Id: a312adfd-3a3a-42a6-319f-08de385c9304
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FeurZ1+BDk7h1WHP+MVqGoofd4T7yY3C31tBQLc53SFPxR2gJP+kkox3eMxq?=
 =?us-ascii?Q?H/s20Rreb8pu89Z3y8Kbks8ap6kGnPS+SBPCU/F95HOUVC8xd2UOKVnbMdJt?=
 =?us-ascii?Q?NVu876EBoCpNYqXf/ZeBG+UDAEUn2VxzI/AWPAnV9OlvSfpMdhw923uraWCy?=
 =?us-ascii?Q?NpT1I6UzPBTZh44PcEfEXdqN5WyGe5bYKtSS0kUNN9EyeZyizvsbaPzEimBU?=
 =?us-ascii?Q?vX6JZBJD2ISUG3WhRCw1rCXEI4YXCoUWLadxqbVGwcV6MBUIyQV51maT+Sla?=
 =?us-ascii?Q?apkxO5XRTQhyBUE3nOFHdY3e7eDhkX7wI7sFhp3PdNU8mImbGzUiCROzeESE?=
 =?us-ascii?Q?Lwmb739aHr4uWc0P7geS8dHmM08vZe6SM0OcZzM6ep0Ee0TpJEGzNSsdUmEE?=
 =?us-ascii?Q?jH5o8iRrlS8IuWTbHRX2Jvz+/BLMDrvvTTmJ/juyHlAvmLfyo/J0ZbGb58h9?=
 =?us-ascii?Q?/dIWa8BKd4xV4ZVjMPiUiMQSXsW9Fvy3oisvuCjXP6upRFNZBbtVHyupj4+p?=
 =?us-ascii?Q?iF5g772gQmnThMfBkFra41aysybzQnkB9MFEbYeulEoUZgXGc4f+nXMQScGJ?=
 =?us-ascii?Q?BQwmCkfTeOFi9YnKLeHsw7hcJQfh7TpvRGyhL1jjU2xLcRCGGYqE53ves/0T?=
 =?us-ascii?Q?fDQ2cAi7mzGWhB4gII8MBGwaIX35pkSWYBbzgxpOjc0+sLoBpghWuFH0gWbw?=
 =?us-ascii?Q?ARooc76RnYt7rOjf+9WKZ+GU2NX6+8wN0aVaoLXaU9hPuP/f15xlv4wIJRl/?=
 =?us-ascii?Q?wws44tN7RSlQkmh8TXyWV69tOIr2r57Zi1FOk5NtKJDbu/+1VemmB5lnedQY?=
 =?us-ascii?Q?zN23x3k6fygfJ/J9K4+q1EhU4IqC0l4KHSG+a+UGTYYUYpVrQmnnLCeIfq5t?=
 =?us-ascii?Q?7KgZH5vKSCNMXYVq+9x3hrPP/lTh2YM5yV00q6U0sChCjlLjBYf22ZCC36OQ?=
 =?us-ascii?Q?bZRzd9zDa36gGPUvfV8Gm4ToYFrAEXAuWDcHmEgewN215Y4pkfBj1W79Em4t?=
 =?us-ascii?Q?R15DxoD4le1RG/Cg+vgVStOrfN07Xj810A1Zhr126x4NpebQpAP0Vh3w5d4R?=
 =?us-ascii?Q?85xYRCD2NBodzJ0wMTj5AGVE7PykVeewi6IRtSEE9Tog+yqwMSgbWAEREVI+?=
 =?us-ascii?Q?weZW4nx1lrR1WrNKx4DPyBRNLu2POtVNVhPJmmkUz/veCZAnvDGb25JjwOdL?=
 =?us-ascii?Q?vB5Mqd9NJO2GUqxsrUb7MISTJcSdRHt0wrlzzrrW4Z7wBOziWJ2hrO3rgQ5d?=
 =?us-ascii?Q?8QwVlc3bP4nzyKONdY4REJGyXDAcucCWzp6XBAOXVLPMvdGpAillWJN8dr44?=
 =?us-ascii?Q?qHQ3uO7ARWLRQU0vKK30oKUahKDCGVRaBSNGAB1S17TfArrEL5SWE3rDv0P9?=
 =?us-ascii?Q?wM9E1aUdVSc2enfbbWRRqakn1eIbeTOmNkO7CwxU1Y3fKemUQ43h9I9y7hRy?=
 =?us-ascii?Q?kqnuPdDe2//tQA7Kiatj8P1/Yd55AqtBlToBCc0j8+0o9umfzAQtCJLlwpio?=
 =?us-ascii?Q?TX2+4Cx9p6sAeUw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rKtaPJOpX9rY5n/CIE9etCWYIQQhhT8ht0sltGVj/X6v5A9/a40QYsp4KhXh?=
 =?us-ascii?Q?KZ1h7mSM5TH6jv79m6A2jlXfSdlX25d5nt9M6yHENGDTwYlPWCDm344z+9Cl?=
 =?us-ascii?Q?DXYAJAtX6hZmF1Vsvk86ok8vW+aL0dw73SDueKuJ7fBsjBEjFggT1upezyWM?=
 =?us-ascii?Q?xwsPp3ibbtDW7jU62Ot8KZ0bo/bp39ndQ0K3kWpT+m7/8VLWBW6o0CII2vgf?=
 =?us-ascii?Q?Pk05T/locg0OH6A2EjwDwO5SHcnYWYpq96BnQ2335yXfL/hxDR1dIy4LTPcx?=
 =?us-ascii?Q?PCzOKpDpxy5tLluw1fKZnFCTTqEBI/1AwsRb+KcgAdP5SDBMkVA9avMW2k9C?=
 =?us-ascii?Q?shOexLpEMAB5TED27smkdV71UaVBIYQ5L+nRv4UXWLlWlLtuItfIMNOElRiu?=
 =?us-ascii?Q?Um0R7ZhGJ18HHfesYLEuGxqt3g1jv0hDJzGyKQPshoVOqrgE6ZJtdw35uZWz?=
 =?us-ascii?Q?rrFAJkPV9oFyQFSKpwXvesUotNdpizWpxsW9SPInnHA3GdNvuS8t4raCzg5I?=
 =?us-ascii?Q?pvIY+v4pGXNpmSnpSH9tHYx4Y1NVnzbFMLKFY5R6XJDBfA1WKtycVO3dPF57?=
 =?us-ascii?Q?atzTBaxva6+yMsfYZQRdFwSw6kpUd+FNZqKLyzXyTEAkc3Ur1V8JzNdefg8a?=
 =?us-ascii?Q?J9MMYMwM6DnkYVesOdgKQp7Z7AgPdifz1hNdl8qj3Q1ypqOyszX4AswsMy14?=
 =?us-ascii?Q?MuhRTMFqUKGtp+s0TBrlTISOIY/yHKNUVmq9L/mceYX1S4qa6PMLR4T1N5fR?=
 =?us-ascii?Q?A6/uMxDANrDSHadVuj1XcEv60TElpwf/84Xh6lusOiTX8EgUqSELBkATCtN6?=
 =?us-ascii?Q?eeOkMGnwtnyQ2sYUaYbpDWTy8okv5EY9BXUSahOn90BiiYgVFW8bMOuRyG5Q?=
 =?us-ascii?Q?XmPC7dX1TW3FYeuoeQIqNVQ0OKlSwu8yLMir75ivTAeL7Jg9UaaKWFdwhfJG?=
 =?us-ascii?Q?dzJ0jN+LMouxA1bJptF/mxtmhlMPLWtMrLWtZH11wXgAs+bXtBwsA8EMZlSO?=
 =?us-ascii?Q?ldkO92k7oNhW03/gZWA3O1KY7potAXUgFbHrmIH1XElTJAT5/BmbC7fhgKqF?=
 =?us-ascii?Q?8vrp2VnH8Dh2QR4TWiGMha76oCjmmzMty6I+YwE1bwwwgDAM4uUq45QATP2Q?=
 =?us-ascii?Q?vBjd5RlEafCkxqiu2tF746zIfBB2KgqL6jZfz7fM/vj1CavJgqIyLLQLGZAK?=
 =?us-ascii?Q?33xv2wQ7+xjqC0uWFETQ4PU9Aozb13/7AL8WBz8mjJtZeUFEHu3Sqq7hbH5q?=
 =?us-ascii?Q?ySIsUMrjupOkZS7lxBAdhfZA3P7rRoCyM/Ic2wp+8wMFHkzYwT5QAYcXONlD?=
 =?us-ascii?Q?VR7HenTott1s52iP1bsMrpzHLDxtLT+sjwfWAb4Cs0vEFwgsoldZgWh7AJ7B?=
 =?us-ascii?Q?ZqDGmJkGFr5Do+wkrixuCUni8lulvqL/dfG2yXgL3ypsRChKYtVkmvn/FnlO?=
 =?us-ascii?Q?K/ktKB8TdefPweKxOuqFKVBR8l2HREWmKLrVBqTPm7hKriwKlrCQi2+rZx7V?=
 =?us-ascii?Q?2FQEJytTfq/wLpOcHbFni03dVhtESPyMjM9WU+cNZ1NzpPoFzXArdOVITJ6r?=
 =?us-ascii?Q?9p+bZNntNYrOj5SqZ4vG9PNShhrbCXfOFmdA3Ri1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a312adfd-3a3a-42a6-319f-08de385c9304
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 02:25:39.3472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ehw6G03oDvm7elIinJ54J2hl4H3RuLR/+23ngdlZOV5qZ0slxYgz82T5YYzBXg8hNTiZkGiwY4wv2vCChv8wYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6970
X-Authority-Analysis: v=2.4 cv=d5/4CBjE c=1 sm=1 tr=0 ts=693a2ba4 cx=c_pps
 a=MNM/txilNqeExyaWs+jKwg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=sMOwQSGorTJhldzxg6UA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 070UBv1Q_exBN9cDBrMA0wXCsoBKmBbK
X-Proofpoint-ORIG-GUID: 070UBv1Q_exBN9cDBrMA0wXCsoBKmBbK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAxMyBTYWx0ZWRfX1Gh0gCMePEa1
 kiBS7CGWiG0aDH884q85/dwAK7CffEWJ0CFZ++c/8FMqdsFuGsAwmZv2Q/tmrh10cEfCvCxpr0K
 QsgnZuijDyiaoRp9olb1WbdNJvfH9k2pfD8Q0SMfmO+HOtF/adPiLddlrhrxq2+zvnoAy2Dk0RP
 qF9jqWoplTAYHaACv07xF1rIEUbgUYEmN1CqbXfkgTI9xkrbNNDEv42v8Zc/9SMXZzPG+i66/0I
 TtcGzplqF7+OKdKp8BCM3zoz6cwTJ3Z/GrRnF8QwCSqW0CbnqbqA2XAwJr+g/ZORuCefDukY/SA
 K6HMkP0nzyPUYvJNLv+wZMf4VurytF5O2q+rBqlznJKlJ898rqn1U/u/GMtmJ85/LBLaoAsstRB
 7+1/Xu+X/19C25tYeDJNCh9GXsQHPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512110013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 02:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227508

Add tag to SRC_URI to fix runtime version when using git shallow
tarball.

Before the fix:
$ sassc --version
sassc: 66f0
libsass: 7037
sass2scss: 1.1.1
sass: 3.5

After the fix:
$ sassc --version
sassc: 3.6.2
libsass: 3.6.6
sass2scss: 1.1.1
sass: 3.5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/sass/sassc_3.6.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/sass/sassc_3.6.2.bb b/meta/recipes-support/sass/sassc_3.6.2.bb
index 1de02f44b6..65849bb1f1 100644
--- a/meta/recipes-support/sass/sassc_3.6.2.bb
+++ b/meta/recipes-support/sass/sassc_3.6.2.bb
@@ -7,7 +7,7 @@ DEPENDS = "libsass"
 
 inherit autotools pkgconfig
 
-SRC_URI = "git://github.com/sass/sassc.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/sass/sassc.git;protocol=https;branch=master;tag=${PV} \
            file://0001-Remove-sassc_version.h-from-source-directory.patch"
 
 SRCREV = "66f0ef37e7f0ad3a65d2f481eff09d09408f42d0"
-- 
2.34.1


