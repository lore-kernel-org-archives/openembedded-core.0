Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1078FCD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 09:11:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20500.1780391458446121354
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 02:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eYnwwuGG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0613cae55c=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525OOh7755125
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jun 2026 09:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=0MKbQqGE/8ZaRLzp+YuD
	vBClZpKCxYjjAq1GMlWO5gA=; b=eYnwwuGGB2+crwOHxIMxDU56J22i1DA124d9
	dS1Mztq0tDWRbMK1XkpsVSqoMtAVBAIlp3vuuML71IPX2z3beBZx/xSRtcyiLnC7
	yJY+J8QZJ7T3MzUy8U+CTZUXA+f1T17NH0xkt/Dno9714wYZTke+q3q7+MuTrEfQ
	vEhUgSsZCYd5yV/ewuebjBOPgRHRHeG5DKC/WW1mw418CX2EP3bv4iW4fxiubCrX
	fuOHrUuxy3gB28ibLviKKGSCCjIWKqW0AbxwtBe3SlA5bVcvjvOJWqyDF7PmkdEq
	ZCpWXZsfpeHrvELXc7zGqNn7UH81h7fu5U0Wy/7/dEFN4qKu1w==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011014.outbound.protection.outlook.com [52.101.57.14])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efpv8cc5d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 09:10:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uc+NboCveZMsJn9mEPbIVY7pxx2c51zeiBNyYXPty9FSM4/m5J7U+v0XCv/OGYwG8/FgzXTmCli6IGVMLNRmAeSfuLv0GuD/53yDPvgNOCR8ik3sxK0buedOaF+Ezm5wcbciU3bc5ASd5+9kGL82AbS5NEzLZnIimcgBiVMxYaUyBbr6mOMg9PrFfraNRvejORcF/yYzvCVb43Abr8DcB2Uc9qfpOO98d09I9QC2pb6ty76j6LHm/sH52E+8U8movSt4AhsYCRvqeGXnE5L7OeniE7Z4JscTk83bRi0mc8L+8lOoSfCX86V7YVioiFTXFoeOZ3ggr3/rpYKV2e6eRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MKbQqGE/8ZaRLzp+YuDvBClZpKCxYjjAq1GMlWO5gA=;
 b=UJmvy9D4ZDeutFQ+xkcdf+QinbHKHGMacS8Emfi/6hsX2M7GbDBJrr2sgTLMsVgfNvP07PQGGfJEuPzHto4ki3t+GcYsSaitGeUTKmfaM9k/qBVfpW6ZFVeXLGX51uRGG7WuwnaBFrY9qYrbvxzMvJf8Ag3sRRiBSYeAl2PNvfKpatWMlSjC1T2l7kJhBHyCM6Msb2HFzgmHTdZifxpGBu1Q/GMLzOoFhU9wQUilU/f97BEbXoFSastmKfqlymEBAzhpPbcPeq4qqMqUPPrfeDYO6ycb8hWo6A1s2uQ1d/M2LdNsSjsqbfE17nheYqePWcRoYiPqYsaHLSR8xm4eZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 09:10:53 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 09:10:53 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH] gnutls: upgrade 3.8.12 -> 3.8.13
Date: Tue,  2 Jun 2026 17:10:35 +0800
Message-Id: <20260602091035.4108103-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0210.apcprd04.prod.outlook.com
 (2603:1096:4:187::7) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|SJ2PR11MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: 85454e7c-87d8-4712-2ddd-08dec086d8c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|11063799006|56012099006|12006099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	lLoPSd2emNrJEfx+BNTB/p6zWqi4zbGVL/HZmFkjVA/UYRYsKDoplm2mQhbtY26mmoqPdNzIAXTZiUU/J1VgOLOVxJH0bsMOa3g5LEYUnmfIkl36eF9jHLvxgqrAYOyHGBVJm1JjGGi9Ln/Pg2u4II5Nb6iq1LlujdcL9EGjKfEpcuh+7kPN8YpE1udXVpcFSmzEku4DIUgG0lARMiHdMOHjmwHp1FwdXLjxjK/22bls/0zjGksBqgyIRFqDp+wHBSgLuXjtE6O6gM5dRqEkxGDksS4g/fFTaLT70tDdIe0GTDDcBGDdyQ/HIan0zURyiLNTN326WA2ZcltXdA5r/WYNonnvu/dxGiF10mhQVfvBhLDeMEiIBkp9KWq38UriHFe5NPCprwJ9tyOTYCYsmdYIfhjOiJq9aM3i4BXJM1aOQNMAq1j3KosVCm3bCr/iVWM1ffA5Rs75d3w0B0Ha+nHWgwqGLVXkxih7J67bSiFwyNIGb31Z+2Vxoee7gZYEAs9epYazZqBCjwBLUfJdLJJGwSzfafVw2MySfjhCslfV8Lhoe6OadRunxUOt+4Tj1H85LOCBFFeo7o54ma9uqbqYIE3nFllgy4PUdrOHOydQ9vP1fNoF/vjgxd9d6SMka5rk71X6LMWui8OLKlIE2YDcG0QcYRAM0P65zQxyEyJdtyTI81Wch/9gbcZ059u5uqj70K/o2TZTd5bs/SMtp1HmMjgJxe6P6fFmNI1ddrcvsO1ZPqqowsephnDlzyV6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(11063799006)(56012099006)(12006099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YX0McZi5ZdvVFvs6igZlLj5TLJ5mXkNMN/8cESATSP8hJUbXYEy+DniYwmuD?=
 =?us-ascii?Q?hSvS3S7ilvU5QYyeDFYaY9YVrE6IcvkBTTSQUYFWVJR1GuTbb+99ndKgJm1J?=
 =?us-ascii?Q?kEVhnijSBdoucfxv0TUmZREu7d89fO+0eDULN4e3ppQl1Bg167inGKynNAZF?=
 =?us-ascii?Q?teWJN6gEpkc6i7vClFrftk7WRBW6ZMka+qAxBaN0wFRo6OjqArkSS/tr7OS/?=
 =?us-ascii?Q?AKjzJKxJD0MX5kuEMh8XqhX/cWCUlT7Y7Cdz5GydpeamGhycaLbcaurqF+Nv?=
 =?us-ascii?Q?jbHATvdLENyrdHRJagAsyoN+EoXk9Il90LPwl5zUdxyHUzx2yG8uHiAsehXk?=
 =?us-ascii?Q?FODQOVCOCWP+IXnBX27Dv3Zku4NBpG4LMW/wMcZYILneMGPyk4QxDdfvcdID?=
 =?us-ascii?Q?6aTlBWiherfHKyARCxPC3DTGiPlKyFiMeIakYYdnm5pUNgJAiu+6tCSrt8Av?=
 =?us-ascii?Q?hTU5Y0qibk6VngRoSXlqsESqmc1Y+wOYjcjkMHOpZn26bo9l78DVNsjXX43R?=
 =?us-ascii?Q?WVHsGUrdBF6L2RJB/OzcyiDuibOZTnjYZ+C1vVhUEq+9E7NkOyIS+BYKAvSl?=
 =?us-ascii?Q?ND90oZJ4w4/6PTURbKj8hsWXtYTxDhZaO7uk5n4t9BXwpLZ/CMQCTGAwzryr?=
 =?us-ascii?Q?l7vqVJTXk146rGsUtRSKDcQguqhRTlTGfP8Gxpvz1j0T0X4WdFLoI7H6y0Uj?=
 =?us-ascii?Q?6jn/Y2OXACJII/4OYSL3OoGWhUmGYWHxAG/lshV7c/bdQ5WGcNLfO7LxUJTm?=
 =?us-ascii?Q?y6rZCJarGIipz/5CL8fJrEdSXOfTOI5AvPQdRKeLyUgpm6cw/jhTovCrYzez?=
 =?us-ascii?Q?NIO4+6rDPQiyK7EBIK4GXZ7UONJs8EhcTjDmLBL3gtnuSDaMgGSj+bTYcm5N?=
 =?us-ascii?Q?mGso4g9JaZOerQUySBoK1MCCV9khnxQTdBvxzJtEeBLGdzugZa8qM3wKXi85?=
 =?us-ascii?Q?HdPmfe0AUs6WukUKHfN7ngrlk1ejpgbFXCiaPZ9pZgbjQKzKLEM0/87BATu9?=
 =?us-ascii?Q?fXST8x5AfONGqqLM5wNiFlZFUzDw1NBLItf+P3QREQctik5OCSRL0+W+MbTL?=
 =?us-ascii?Q?ZOYytvS/O7AA20FOLEudaAITCQo0GlW+5knc6M0XDdVK4bPSUK6rGD4HFW59?=
 =?us-ascii?Q?iG3+Hgi49x5zRXI3W6JdSpL8aOHpCSHJqIwgL3podfOwppKZY3rTczzFYmYN?=
 =?us-ascii?Q?4qorQBN2zQAF7f4TaxZRPTTFmaONSmGpmKgh5OzXKnfHjRlJz/Ki+XoTEZQm?=
 =?us-ascii?Q?NzYfokciagUQn0DHK594J3rNYkTyAELOmHfnNy7XoG1qXCrHrJFhObNhORkk?=
 =?us-ascii?Q?zKGIEEOBAjBpQPhsNpdpgiTLkvtWtE35kXiLfV/+8hSJQkVF0ZnRh5SxinY+?=
 =?us-ascii?Q?za7kFcpMrbDFa46nceQju69d5idgbvE9yAFJETXS1Fmn0P6BUtBIOGNJAvYm?=
 =?us-ascii?Q?Crgi3cNf9tY8rTlBlCAa0hhmOZvx2xfOVnTQau1NgRxwTwBAy/2mb3kLKN3x?=
 =?us-ascii?Q?Mh9hPyF5zVxRFvqj0qVOMSdo6Xr0SvTimMiabEz736iBKA7GgYtZpIWd2Mzu?=
 =?us-ascii?Q?jqEkWos+PxiSd03u2VXnA2vfE2jFyPaHrWS5PJb27VKEUrkbgY3Ux/drcw/E?=
 =?us-ascii?Q?MNH/seqqLaczuxWsGxasgAtH+W7Cj5SPABlwSSh24/JFy5qRpfZbFhq50I3c?=
 =?us-ascii?Q?WcyhDlgOnl88OEXa8n93BtjYAPcZg4VD44RVrwIYu/9n2GBiz6QHipORfqfr?=
 =?us-ascii?Q?0H+0QkMgnVuipJpCVOlWIStAdLYwuvk=3D?=
X-Exchange-RoutingPolicyChecked: 
	VObL2oJixydYbZPczgJILo1uUpzPXMs2T7v0L9IANK46uVV35NHwUhgH3RjgAEE5seImFVgOyLdHiCglbuI5j2lOX7Q/lDgJlO6t13YF7Oyh8LM/E9Up99fpsTkm0zZvKU2GtOAMW5ieD/Kan32hT8UG7+koLj+RWwkLe1T8zi0laJ9GtWjSVpCA2923qlO+nojdB9+Muot3+I1XFp+9JLY/FYHxD5daMmw0qvD6dybIkb4B7mJYbnoamBlYb6MDpnJrXge2WnhquBAZ8aQQYVGZVMkTHzIzIzfi30Pc9cmgaqAVGBepVeOVm39JBzl0XiOxe9e012BtQ7Ss08tMQw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85454e7c-87d8-4712-2ddd-08dec086d8c4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 09:10:53.0224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vWYuLKWEmRmFFRZvUm7+RxBWZExL5BbfVeawKeY8maDfzvlhVGhcbx84WyMb0v1EU2DRrlRxRLGz0Akbt/MqzFM2EryHsyEXguE8wnEDusI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7617
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NSBTYWx0ZWRfXz0PywAlEzKwZ
 TEssN88zx1Fd81rpHhlk/02KN7oZuun5YKNgAbLFxDML2KDATDjqe8Iew5lVZyn7l/1GsrQxM+3
 uA+1mVqeZ7HOwo0RrIhe+6/kJ7Twp/04Vxe24gh2JEVdezbNaY7tRWz9HYPWu5MW0RyFdEHoeNN
 4vn6ZKrKZoyTlO7tz4CGELszPCvAfUx7frwzalI6RDG1k5CbdvxMkLus7kcy0nuQ/JIrVchbvNR
 t/08+9syyOf5GsbNUlqIv+nnLmssOvB0xWKE/wtlmyyrj7jLU22q4YKUn1hBhgfd+sZwnRqM9fW
 PNtly/KKc2Pxd4tW8Kqrm14LdiS+TVaDMMZb6RYsbigr5UyYpGMu/PQSXkqVhtq7rs3/8Pwazeg
 tBo1uC/EiQTdQ3XjONgI+SaRIne/FvaJmKFfaJVH0b2appZ8HRR/AMh+2/xFTA9epBhHI7yaR2S
 /T/TrsQnOEvtBxFajKA==
X-Authority-Analysis: v=2.4 cv=Opt/DS/t c=1 sm=1 tr=0 ts=6a1e9e20 cx=c_pps
 a=jknTlamspUmmG4HRyne6iw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=-qf0PAJrAAAA:20
 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=GwUem0DFAAAA:8 a=a_U1oVfrAAAA:8
 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=mDV3o1hIAAAA:8 a=7CQSdrXTAAAA:8 a=wqS88kSR24Wi-3-_RCMA:9
 a=-tuPpFOT1ucyJ02j:21 a=r0dl5i_q2XGqDZkti5dn:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: J9-ptv3wq3jYqbjl4VJRA5gsl0k80kik
X-Proofpoint-ORIG-GUID: J9-ptv3wq3jYqbjl4VJRA5gsl0k80kik
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 09:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238021

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2026-33846, CVE-2026-42009, CVE-2026-33845, CVE-2026-42010,
CVE-2026-3833, CVE-2026-42011, CVE-2026-42012, CVE-2026-42013,
CVE-2026-42014, CVE-2026-5260, CVE-2026-42015, CVE-2026-3832 and
CVE-2026-5419.

Release notes: [1]

Rebase patches and drop patch included in this release.
Add patches to fix linking with musl libc.
Increase memory needed to successfully run test key-openssl.
Drop code for previous release tarball problem.

[1] https://github.com/gnutls/gnutls/blob/3.8.13/NEWS

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(master rev: 1193b0778a0f81bd75f7ec6f8f44fa44cf4b8f5e)
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 meta/recipes-core/images/core-image-ptest.bb  |  1 +
 ...ts-mini-dtls-framents-link-to-gnulib.patch | 25 +++++++++++
 ...ust-list-fault-fix-issues-in-linking.patch | 31 ++++++++++++++
 .../gnutls/gnutls/Add-ptest-support.patch     |  4 +-
 meta/recipes-support/gnutls/gnutls/c99.patch  | 41 -------------------
 .../{gnutls_3.8.12.bb => gnutls_3.8.13.bb}    |  9 ++--
 6 files changed, 62 insertions(+), 49 deletions(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-to-gnulib.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/c99.patch
 rename meta/recipes-support/gnutls/{gnutls_3.8.12.bb => gnutls_3.8.13.bb} (93%)

diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index c08561296fe4..008b5770a898 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -39,6 +39,7 @@ QB_MEM:virtclass-mcextend-python3 = "-m 2048"
 QB_MEM:virtclass-mcextend-python3-cryptography = "-m 5100"
 QB_MEM:virtclass-mcextend-python3-numpy = "-m 4096"
 QB_MEM:virtclass-mcextend-tcl = "-m 5100"
+QB_MEM:virtclass-mcextend-gnutls = "-m 1536"
 
 TEST_SUITES = "ping ssh parselogs ptest"
 
diff --git a/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-to-gnulib.patch b/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-to-gnulib.patch
new file mode 100644
index 000000000000..7f999c4b22ec
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-to-gnulib.patch
@@ -0,0 +1,25 @@
+From 68b2fb63c8df61d1480121a859f8c955f4910c01 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Thu, 30 Apr 2026 13:08:01 +0200
+Subject: [PATCH] tests/mini-dtls-framents: link to gnulib
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+Upstream-Status: Backport [https://github.com/gnutls/gnutls/commit/68b2fb63c8df61d1480121a859f8c955f4910c01]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tests/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index f8797964d..1b27df751 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -524,6 +524,7 @@ pathbuf_CPPFLAGS = $(AM_CPPFLAGS) \
+ mini_dtls_fragments_CPPFLAGS = $(AM_CPPFLAGS) \
+ 	-I$(top_srcdir)/gl	\
+ 	-I$(top_builddir)/gl
++mini_dtls_fragments_LDADD = $(LDADD) ../gl/libgnu.la
+ 
+ if ENABLE_PKCS11
+ if !WINDOWS
diff --git a/meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch b/meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch
new file mode 100644
index 000000000000..b15a05d5b634
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch
@@ -0,0 +1,31 @@
+From 9c573a2a0e7473ab79c43a6d3ecb0ab68ce896dc Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Thu, 7 May 2026 09:42:09 +0900
+Subject: [PATCH] tests/pkcs11/trust-list-fault: fix issues in linking
+
+This fixes the use of automake variables and also adds the linked mock
+library in .gitignore.
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+Upstream-Status: Backport [https://github.com/gnutls/gnutls/commit/9c573a2a0e7473ab79c43a6d3ecb0ab68ce896dc]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tests/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 1b27df751..f6a60a32b 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -540,8 +540,8 @@ pkcs11_os_locking_ok_DEPENDENCIES = libpkcs11mock4.la libutils.la
+ pkcs11_os_locking_ok_LDADD = $(LDADD) $(LIBDL)
+ pkcs11_long_label_DEPENDENCIES = libpkcs11mock4.la libutils.la
+ pkcs11_long_label_LDADD = $(LDADD) $(LIBDL)
+-pkcs11_trust_fault_DEPENDENCIES = libpkcs11mock5.la libutils.la
+-pkcs11_trust_fault_LDADD = $(LDADD) $(LIBDL)
++pkcs11_trust_list_fault_DEPENDENCIES = libpkcs11mock5.la libutils.la
++pkcs11_trust_list_fault_LDADD = $(LDADD) $(LIBDL)
+ endif
+ endif
+ 
diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
index 398c0464e0f3..8c867a5a4008 100644
--- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
+++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
@@ -29,7 +29,7 @@ diff --git a/configure.ac b/configure.ac
 index 1744813..efb9e34 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1448,6 +1448,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
+@@ -1413,6 +1413,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
  
  AM_CONDITIONAL(NEEDS_LIBRT, test "$gnutls_needs_librt" = "yes")
  
@@ -42,7 +42,7 @@ diff --git a/tests/Makefile.am b/tests/Makefile.am
 index 189d068..8430b05 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -721,6 +721,12 @@ SH_LOG_COMPILER = $(SHELL)
+@@ -745,6 +745,12 @@ SH_LOG_COMPILER = $(SHELL)
  AM_VALGRINDFLAGS = --suppressions=$(srcdir)/suppressions.valgrind
  LOG_COMPILER = $(LOG_VALGRIND)
  
diff --git a/meta/recipes-support/gnutls/gnutls/c99.patch b/meta/recipes-support/gnutls/gnutls/c99.patch
deleted file mode 100644
index 3f41241deba0..000000000000
--- a/meta/recipes-support/gnutls/gnutls/c99.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 203d8f2187bb7f483290e0f8b7b48b152b1d027f Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Thu, 5 Mar 2026 11:33:57 +0000
-Subject: [PATCH] configure: make the C99 detection more resiliant
-
-autoconf 2.73 will default to C23 by default, which means that the >C99
-detection logic in configure.ac will fail because it only handles c11
-and c99.
-
-Instead of adding c23 to the list and then breaking again in the future,
-flip the logic around (as suggested by Zack Weinberg) and check
-explicitly for just c89.
-
-Closes #1806.
-
-Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/merge_requests/2081]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- configure.ac | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 740fb6339..c708d8f5e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -54,9 +54,9 @@ AC_USE_SYSTEM_EXTENSIONS
- # Require C99 support
- #
- AS_CASE([$ac_prog_cc_stdc],
--  [c11 | c99], [AC_DEFINE([C99_MACROS], 1, [C99 macros are supported])],
--  [AC_MSG_WARN([[Compiler does not support C99. It may not be able to compile the project.]])]
--)
-+  [c89],
-+  [AC_MSG_WARN([[Compiler does not support C99. It may not be able to compile the project.]])],
-+  [AC_DEFINE([C99_MACROS], 1, [C99 macros are supported])])
- 
- AM_CONDITIONAL(CROSS_COMPILING, test "$cross_compiling" = yes)
- 
--- 
-2.43.0
-
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
similarity index 93%
rename from meta/recipes-support/gnutls/gnutls_3.8.12.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.13.bb
index 721842801229..78b88005305a 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
@@ -23,10 +23,11 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch \
            file://run-ptest \
            file://Add-ptest-support.patch \
-           file://c99.patch \
+           file://0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch \
+           file://0001-tests-mini-dtls-framents-link-to-gnulib.patch \
            "
 
-SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"
+SRC_URI[sha256sum] = "ffed8ec1bf09c2426d4f14aae377de4753b53e537d685e604e99a8b16ca9c97e"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 
@@ -63,10 +64,6 @@ do_configure:prepend() {
 	for dir in . lib; do
 		rm -f ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
 	done
-
-	# remove on next upgrade when release tarball gets fixed
-	# https://gitlab.com/gnutls/gnutls/-/issues/1797
-	cp -p ${S}/doc/stamp_enums ${S}/doc/stamp_error_codes
 }
 
 do_compile_ptest() {
-- 
2.34.1


