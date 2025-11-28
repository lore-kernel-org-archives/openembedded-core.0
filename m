Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B83D116F1
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 04:33:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8929.1764304401485260736
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 20:33:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RonhpcYU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3427347a84=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS4T4d73306752
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 04:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=7prakq0UA5a4IYAVmBiKFGmmq/yQ9TbTzo/cS3dknqo=; b=RonhpcYUpofm
	vzPMw16bfZr5HbVGoa3y1zr6D3CoCHTll0LQsmlZdIcF8xV6FhQWainyITeVlf9P
	dfqVoLRF0EwtmDXhH9SNAYuUVI7U2JOBVvfIlnIelTXSpRI/TOvUQ0SqI/hcJ6L6
	YzETp+6Htpf6mMma5YQv34B3dRTMfXInRnL9c2OP060tlLuUaGaxbzoR2oEN5c92
	Z9BJJQxmm/XPCHZ3dhqCyoyFC8nvuIa0P2v5sqV3dYEV//ZtaY4W09xmGiVupA6b
	70PEHWfuNwKokvRscP1wbk53TIB9vjIO5HRlNNUXLie+owNn2hV8tIvPUE0JkIoq
	uD0DKlNo5g==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011026.outbound.protection.outlook.com [52.101.62.26])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ak455pgu9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 04:33:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1YtRPPHismy3PrafLoaj1NmNiPtmfwbdZSAlf9OIIWOxq6699EYmFD2trjVrMtlWNBLn+4r3MMm5zh+3uU9ZnNNO6A+ZtvEm8bEebnRgxR4x9fR9PTr1kCIgXTli+LHlzqeSF073WyAFXQ9S2AjCsN0+HzI/9Wqr/3tiWdcM+lDe/yBPIPHNXMnQfNxJapVyVXvrMexwfHZNy0GclpE0p627n8FdC6IHjPfryQE3qmK3pPPgYUITVwKzNWnFxPCKfhS6l5QaUnb3odwY7Q76xtYpsy9a5z6izvl0BeZVuf8JNLx7ENWJvvPH0Rva1rAyOmzyN4CX/HwPuODiNZEHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7prakq0UA5a4IYAVmBiKFGmmq/yQ9TbTzo/cS3dknqo=;
 b=fkd4FeoqskyRUSlvHYWYX8dzK+Qgoi/gQpmISnztnwM+bYo5+kKtj7GdtcoKTuqqj3t2PFN7qTnJ1G6tzTgVCIB9P9gQVVnP3ty+pJOQXLHbcJtIwSQ8JoaBYVb/Wbxb8FGg8I1fgZIb3eX5gBp0m2tycbSbU6Inww7tB6aiKGWIjGwnJGPojDmWBHFTiEfqdmnC5J/ajzq9CEGK+d+5far8YvKksgrARUexQcnrO1e70ioga+0viektlx7GABq4UQOzM/T/2bxSHYYHiHnf6pa5J0OgxAPD3IQbOPkPuflIp4+nTbHCGorQqGFMHgEw+A40AzMyjsoPqpobMbygHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB5129.namprd11.prod.outlook.com (2603:10b6:806:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.16; Fri, 28 Nov
 2025 04:32:46 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 04:32:45 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][RESEND][PATCH v6 3/3] xserver-nodm-init: avoid race condition related to udev
Date: Fri, 28 Nov 2025 12:32:21 +0800
Message-Id: <20251128043221.3603223-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251128043221.3603223-1-Qi.Chen@windriver.com>
References: <20251128043221.3603223-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::12) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB5129:EE_
X-MS-Office365-Filtering-Correlation-Id: a88e1629-82dc-4229-ba4f-08de2e372d9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CCN/tCy2O1hzRqFxKKACXnobJv9WOGWGID9xIv+mfnm27glVHy/MjlwLGuR2?=
 =?us-ascii?Q?Ex8ezN+G3Iw6hjXaUQEXRdWgt5u3cWQRCrCCGMVXM9uqIzrUGYi52q4zjDTj?=
 =?us-ascii?Q?yHVLV8gc9Op6xDDylDQBytwtIEdHU1EfQrWc4jEhbSrF2l8lJfTBevRcZcxY?=
 =?us-ascii?Q?L1WOuH8GY5Vw5hEVlPo3p55l7bA2jlceojxYkRhBMU0LqAZConBBNa2oqx8F?=
 =?us-ascii?Q?mqtWA7KtUsg20S/bWCAoPuU9rCsqJYfAgIxlxXTIlEGWVzvqzkLPz7xBh8uL?=
 =?us-ascii?Q?NnGxqudBb1Rf3PeGkxOUeRQ/wlhHKUkjLzjHIWQmvkri6c6fEnPmZWaVuxOm?=
 =?us-ascii?Q?lVRiWCPxuyzv/O9YGhBl1UITh+cZKoGIglXpEztfuInwmjy4tmQ8O9z2tOvN?=
 =?us-ascii?Q?ZoDmkaUlC2GmTXLzviXhLSctP+P78RMKA0kZfszRgtBEWzviQ8oCb8oDDVsW?=
 =?us-ascii?Q?EaLM2JrCWB1kh82QtbgxnNw5SmDm0DiVONnPr+fhM1yqWBLpqOj4HMOD/eII?=
 =?us-ascii?Q?b3bCYg0v+Hvo9+RaXwLgX2ye6USFXmoDpC5OQKx6M1F58ULU3+6mR7PB6iPf?=
 =?us-ascii?Q?5CjZQhVzQNeQMBexNiqFFWDWo/vLftHXtxHKm/X3Vs1MMYvhPAeinBnaxYNA?=
 =?us-ascii?Q?HsZDKvcKK64oCigzfYjzXgodQQtE2ZIwO8ZVIaAwACHsUGYTh1VRAGd8pn77?=
 =?us-ascii?Q?D42mRuxzbau9n72fQH70ZJJf2Zq7rKVMKSIJV/SmqR1xcdovJJdVcM4gMO8y?=
 =?us-ascii?Q?6h5vBe8v8JP7i7lr7/thgul2+NW24ELkjkd+vahJD0j8Ea7j/Jro6ndcoQyk?=
 =?us-ascii?Q?COshModC1SWdiU3A7jZU74LhE9PXGUH7Mrwr+kzj6gnPYR3idf4Q1BGQ8Vor?=
 =?us-ascii?Q?0RIIcPLnv08tfu3qfl0Av6ib45DLJtSGDYO6Y5NpvP2z6FpTHJbbZ2LzUXri?=
 =?us-ascii?Q?XD1ORQyu2V0KrPNWK3X5vY0WnXCNDOcDsL4n/w7UEE61SuvTynqf7C56nADD?=
 =?us-ascii?Q?M6gqNrWUhF2MJtIUfU72nF3Dt7JEXdml8fxd0I3eb+gmSdNDD2zoU5QHuR0U?=
 =?us-ascii?Q?9Mg0WZ0ChCC2BUi7RZWBKLA+etPS4LEF2iqz9Nr3Os3JBTjm+hlEVmhTzUSq?=
 =?us-ascii?Q?RFQkbIO8CqMq+ERWYqdKlrTkJPvRP2lPjREqNeet7M6aU5Q4hto1DjYgZNU/?=
 =?us-ascii?Q?1qITAa369qayXDEMjIkdjdP7siBMxc16+VROd9UAQhDmkRyVH9FxDDzR4iZ7?=
 =?us-ascii?Q?UacFAop3VBOnnmrghpiG3lJfk08tMiNPG6X8FxSiP8WZ/a+sF8CuJukcZePe?=
 =?us-ascii?Q?ycZD1Ec3M9bllV5v5iWAPsizxqAxlfHcHeUmyGLuUQRIDl9zvCbQ8YDaSDK7?=
 =?us-ascii?Q?T6Gt/uSwrafbmOe0tRaVMJ/qOTpffpPK2vYVANhYq4f0k58X37Ayw7tzHMUN?=
 =?us-ascii?Q?knd8IOq9PV40clz0m+q1CRs2yYm6zrGkrxAriSr1F4z6kk355+9Gtg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JcDg7i7Qz8x/oBIBNLEfzZNDuIm+EA6ewJzw/0jbra2b1juP9ijrf0vrZWbT?=
 =?us-ascii?Q?rDbTsh/xUwL3Txc+lx2GeLGZ7+tTjo8JkceKezjUfw1f6W8WiK9pcUOl4d7I?=
 =?us-ascii?Q?ccdSVDPxGF/1GhSy5oT8JCSeEvN7+2CDGahg09vkB7NbpRDepRrCPjCsqG18?=
 =?us-ascii?Q?9cQpLuHNdS4UwIAGuYrtJpctHnqbGCxmmrZfEEZeyOWXGjKdIrpj9i2hcucx?=
 =?us-ascii?Q?QQxweaqPU8imxuGQP9+Lp+vjQUEHeAU33ERoPoZnTNf4rwpGFV5Cdti61Ca3?=
 =?us-ascii?Q?FT/FGk4TPKHCkLIVO78J7KOQ4vt0NHLJ5ljqsFyGIeYUeOpMFNDoiMXNL+ZW?=
 =?us-ascii?Q?VrnTBNuYnaCaF5GR5tDaX3hFJRIh6WYLAyDJ/AdPlfwuuDE3m6c6mEZD8TTi?=
 =?us-ascii?Q?uuRtJ4ehoEBBX0LRTFMgnZkzVCqlvoUWzJUQnV0ICeF8e4dwGoPvq4NNXqQN?=
 =?us-ascii?Q?UZuOX+NwnQo8hURX2naHmXi2qOGvn1qp9WkkEuzS2Cwz9iHMkX6bHpj3in8e?=
 =?us-ascii?Q?mJq1muWAyO1P7Sw41QySlpf7/zDqLhuNZw2QmY78uKRdd6KmKcu/+u29JzYx?=
 =?us-ascii?Q?c+xUm84whmQXuUKzxJa3DRFlCSEFD7/InquRzTD6yluEbdmRu9LmqUx+Tzn6?=
 =?us-ascii?Q?7DgIzKsyAEt9FElSsjoKu4gBa/CYVANefpZomqmI0A3GFKkz4LEeuGQ0CabC?=
 =?us-ascii?Q?LnOLx7tl8K25RtqnLjccSx/JaEahvuCjfbAj6GI0Rii1XRzOgkdj56dbTmHy?=
 =?us-ascii?Q?ESdzK8yRPebbWrtMW64sNYbL6nf1zG7Q0ymJW50qOoXqzNpi0AEftina/8wc?=
 =?us-ascii?Q?JnaRXKCPBZeSMH9rFYdmkvORZi1tox1Qy9FFqipCwUSSAL+okhLvNxEdF6Qu?=
 =?us-ascii?Q?alGTAEqsScDBJWOpuJZUOpv8WB/cZgKg9Bv2VQfVU8DmEatXAVVlXg1Mooy+?=
 =?us-ascii?Q?hPM8oSm3aSGvrq6B+vA/vdbPmtSmLSuIeRpg7/IZxBonUp76LMHJjI6ecWp+?=
 =?us-ascii?Q?d0ERvCctAkyd0m6wTh/eJV7IPt2OnG8GSufLRDnJEDnrzUBo05PejjAponSW?=
 =?us-ascii?Q?PfvKM0MMJKA0mrsZAafa/Bkf+QMr5jsMqX7SFzTEmQKhDSNINwP+fZ4gzjMa?=
 =?us-ascii?Q?32AQmunMHKpfMYUGo2XklhF5XnQHvWMXZnZUQba9+anR8TgutmOGhtgUXhmP?=
 =?us-ascii?Q?WLHKGlkt97iSx31ieDBlhInw//orqwF+VLulxfBYmE10WJW9LqTg5vvJcIiV?=
 =?us-ascii?Q?KVTMkP7JAuZf7rxLOK/patN6MuX1wMiqM2JxcX6Tb23WcFlBwASkiBRTyVd/?=
 =?us-ascii?Q?qLblbK+UcZyBRHeZ0+EFbZLF0f1V/tKSZDSQ2D5NJtPBDbjLzboD7hwxROCe?=
 =?us-ascii?Q?N4oMucxev/NLe+hMLArja+AzDPChdr5aTmXYqbCEvVBcNAHteSttPujHRFIA?=
 =?us-ascii?Q?jTAsJlYibvqyX/zu7WHIlmkR4R4HE/efN7gdig4uYbMRpW6oE0cx1m+jBj6E?=
 =?us-ascii?Q?IZ4T8MnKqhOKF6TX3zimHrxavBVeP1HVwciIEYLLaBWaRQWea+l6IbWjwcML?=
 =?us-ascii?Q?hQ1JcOEUKEvAI497bOB5pAoDrh/4YOLHo3g60urw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a88e1629-82dc-4229-ba4f-08de2e372d9d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 04:32:45.9285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vt2lQVDw83D7ygQE6xP0eUf5jeF6KWWXoZ9Wkaj5OANUy8fTD26Fu36xRAmvcgEp1qkkdd1J9Qomh/XPl2dknQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5129
X-Proofpoint-ORIG-GUID: Me93kezJCV6P9V2kjuBltD27wTd_patO
X-Proofpoint-GUID: Me93kezJCV6P9V2kjuBltD27wTd_patO
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=69292610 cx=c_pps
 a=zTxK1Vn4TPWW1Y7kXDJIYQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=et4UR6atNtKrrsjGgL8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAzMCBTYWx0ZWRfX3bj0qlzqtJDj
 3wKuXT/FEt6RVHv73xMzzFneBj9h+asRM0h83iFyMqEjNj2Uq1WTbsQnjpsjgX2kQi4+li3QjNU
 NbG5FB1VvJ+4ArtS+TyJ9/KmZBIpnHvh1OLuzIWNId2W6gPpUyrP90IIOFTm2Z7c+05jfq7YzT3
 Ub0eouCehQUFBfpYql31cnOxvXazlsb28GVIo/rt5uEPEEt9Gaj/cfoQNcLO+HVTdVTzp8MxVCI
 Mv11QNLSZ4r4vTwdOUNwemn4SjgrE+tWr9E/SydTrDTEbzzxETmxT+D4hLgU7Fs5pYxLMrDMHEQ
 DIXxVJTDvDlUdY7pEXaFZRt/UcETjDSaBTI38lSiF5WqukGW917vXpsVEl9/QMycXroXloE0XHm
 B5R8Iks6Bw+KOpaFGKzrkgsG2gWLfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 04:33:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226878

From: Chen Qi <Qi.Chen@windriver.com>

With systemd upgraded to 258+, there's a race condition error found
on qemuarm:

  failed to find screen to remove

This error is likely to be introduced by the following systemd commit:
https://github.com/systemd/systemd/commit/0ba9d06963ecb848e71951ed5e9f6f6f03b80b06

However, I think the commit cannot be reverted, not only because
there are a bunch of changes based on this one, but also because
the change look like a reasonable one.

Before xserver is able to handle such issue inside its codes, this service
need wait for udev to settle things before it starts. This can avoid the
above race condition error.

Fixes [YOCTO #16045]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../x11-common/xserver-nodm-init/xserver-nodm.service.in        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
index 87dc4f8fcd..43aaa84c0f 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
@@ -1,5 +1,7 @@
 [Unit]
 Description=Xserver startup without a display manager
+After=systemd-udev-settle.service
+Wants=systemd-udev-settle.service
 
 [Service]
 EnvironmentFile=/etc/default/xserver-nodm
-- 
2.34.1


