Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4174EC44520
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 21:33:11 +0000 (UTC)
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com [205.220.161.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.104.1784323985300636096
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 14:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@keysight.com header.s=ppfeb2020 header.b=lx9HGBID;
 dkim=pass header.i=@keysight.com header.s=selector1 header.b=XkyslXDb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: keysight.com, ip: 205.220.161.93, mailfrom: john.ripple@keysight.com)
Received: from pps.filterd (m0187212.ppops.net [127.0.0.1])
	by mx0b-003cac01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HLWl1M2855073
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 14:33:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppfeb2020; bh=OmdzUWHJGUTvyYGf7Ago5b
	WneKAnMU1JbifHC+EMv+w=; b=lx9HGBIDrq4Fc0aVa+0vlXGl5b05O5hCpN/gHx
	u4kjKaF46cIfZcdBZulMSqqh6nLvQr2HUzpEeDXq3pPislceCv7UO/b6fvLCVeOV
	AGxIRMBLiPXONzepMuyia5AHDp+CgwO37kQcHVDZ9mbYCz6RjLaTMlyVNlL3T3zz
	E+lxPEnIj/mOBDq4j1ciZCnU3/gj5VhTpHU5ZGPsrj1c8/SSh5u7T5Uu+Pmry7Lt
	66bOB+FqA6b4xxeEdASxEmxTZwVB3P3WofXFa5DOjDlvU4EL2SpXBtUbxB6i28Ex
	4fHZbTuw4SBqCxMQRDXaIzfVgjRo5vxVIZihl6kLMHG8vQaA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010008.outbound.protection.outlook.com [52.101.46.8])
	by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 4ffgmwac26-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 14:33:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WsWd/avxw2RF1EUweOv2Q4y1toCJQ7TNfSadTeXEP2y+2IiTxnwShcxYQrm/pdePH/pnV2PhJqOCGeLfUCOjwf5oRP/55SNBfuy2sWQBOHG7O2Y+4pnsz9MmWR2Jp0FpkmMGxqSpI9ipdX1lDTFXb231qoJOeHp7ecc5TZ18NElZzkpWavzmUPqpuO3i0vCT6sSJGAHOjNJobYqbPVrSICjmt8j5N9NuXH4eJj2T+xRjJim/dBvcaQBYk2QWlQ/9mszlA1c0jj99cL2mSL19tSE0v7hO175/3MJ+E6JNfs4oPtmMN5OUjK6dttee3zQHrY3Wl2b3c4aJUoRGv/Ogeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmdzUWHJGUTvyYGf7Ago5bWneKAnMU1JbifHC+EMv+w=;
 b=XBhEqIiSkaRSHhFKBqXDeDaWSVkNhVMd+iFUJBmxNFrt3U1Np+PjmGp7Qfo91/0XzpXNtGxNpHxoUKd2rGBGMvbQjx50EnnGtQKhPALRLU8LPpAhBg5DOkr9BUo5PEaUTEQi19vlEiqVk65kN5WNt3gQ3iu408fG7yG+dwkez4KXUnUADsWQTsjf63398x4ncNNiRmoteFk8ejsz7mLjH1T7/imX8Bw5xG+5xCVtPTonbKLsaUO4VrTRJHpP+ql/OVTOtOHVTm4z7ZWYegeTjnhDtaplmy3N8M2P39vi3r22Tdle0feG8OitAPah8VZy7g5dCOho19z6aoeJk9xskA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmdzUWHJGUTvyYGf7Ago5bWneKAnMU1JbifHC+EMv+w=;
 b=XkyslXDbM33QXK69cd3qPnkncJV8vdE+PvOQSE4Lw2renjI02QcguV7FAuLdIToykR4vYTMNaUaK9uZtcv3f5nsjTXkiXVTNPXeGbfkd+SAekF80AIj3y3lLoIaT2Mmt0P0lXGf4KvZSUmhsvJiK3mn+ApafAMujJrPlfsty8qU=
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
Subject: [PATCH v3 0/3] Create selftest suite for go-vendor.bbclass 
Date: Fri, 17 Jul 2026 15:32:48 -0600
Message-ID: <20260717213253.3454786-1-john.ripple@keysight.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY3P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:fb::15) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|PH7PR17MB6034:EE_
X-MS-Office365-Filtering-Correlation-Id: eb12e07c-9531-421e-68ec-08dee44afad7
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|11063799006|56012099006|10067099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info: 
	Hgay4qF1b4APGB1OI4xkxHscpCanbixKg1f7wOXISDi1mJ8tNcYDhAJR950A0J1gmZEgwobe06KJVZQtPqjKTbQxvThdpS+T9s8wksH9nQBblBspz7x9S5PriCnLrTk2a05SC1DCyBnySb4lcdnKVIFPFe3zBBtKM69bSKU+ENWIvs6vs9YOG72wEsMH/KlqyfLwmIL3n1IDmtkDHtjOMS8kBu0vRqVG18YaEMaNEhTOHwpvdqJNZ7By+6iMJA9HgIF0gxlKBSWZrN/YcgHaaF2rAC0RSBAqkWZHXulwkE5C266HpYGAv09jw3E01jGhJaTsnvEqjn2n1VJzgmuSquEAXbGR2I2oh46zlk7Vl24JAMo0vH27hvijbLZqpntxlptdXR1vLnFG5A2DXXbrlLVl5VYXaeyahPLeIZ8MGFYX5JxHYAnOhqJtf6Iwzb3kwGDUudRs8S0Hp+eQ203n9WNWBpHoYvtRHwGvPNndTVUyAprNTnDLjkl7Ug1b+yFL4CK4dhHqN6pebHIv26nuwMLv3fdGAF1mg/GYrpXK3AvQ3nJDYYcTTbGX3N4Qw4dEszHaVlxPtn00qQ8+kLFdcZOKgarhP/LoV4J24rOkAWwPL9FWjZ3KPdkx6XVxCuonCHWEmBF8QeWvayriQIM4NkC7xbu4fQj7+M3GhTjFy0Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR17MB6130.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(11063799006)(56012099006)(10067099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WKc9BRXx4sEmhhddrtYQFBSjarPmuX0sNN4bznjZ8ROt5lnrlVo388111Hqy?=
 =?us-ascii?Q?L1vVXtS8SDNyZBqBlh1krsVdZcheZcrN/p3efcu4JsQEP5pICKgi19KsKGvo?=
 =?us-ascii?Q?0Mf+XPm9nA6OYpYPmtIQIRAtMRVhxtqbv6nwwTWuZUIDJzeIPh4S+I3LQPro?=
 =?us-ascii?Q?lj1AkpawL+c/4zLraX2AUYbEOxf5gy4kbARqv5xqpwAY6iKhJutwRI+LBLiy?=
 =?us-ascii?Q?UeINf9ysEy1a5Uv/sUXCuyNu3xq92rjgTVg39+WiNlu9MvZeo0QKCFelN05b?=
 =?us-ascii?Q?R0+6Rdvsf1xkx68ExDybHGDgsA50ZKrVH5JsnYR2gjsyOEpHS0ELuqAUMp7L?=
 =?us-ascii?Q?I9pauV8Um9bdaKI0DwvSx/NYB5yzVzmDa+dkSjnupiUA2dw0OuXESDHc4jEC?=
 =?us-ascii?Q?cUyodvJBz9f+8MEP+L0m1rXbjg8PQ8kinuB7z5HfZ3odyNRHF6sCq2dW+U2Y?=
 =?us-ascii?Q?1G/aYvPUBr3tktiFSQN5sXH+PO9J325+sqUIjidoAB9axsh+28RVdF36/Jqm?=
 =?us-ascii?Q?0MnBTJ6Un9qG1mJczT6uwXDiRXjW2vNT2ZgUBCwWWD90dzV09eW/Q1DPANPt?=
 =?us-ascii?Q?KNZvpjpyXby7sW3n+4KEObbkEWISL3W93fNe3/Hte6lyR7XxYTCZR35tJibm?=
 =?us-ascii?Q?h7pEpbZ74P6GYv8/sPhZpsbF7cZM8K8nDqz5r2i6YOC4wfSD9sSppJiRAxab?=
 =?us-ascii?Q?po3bfnwXlpJDeEOxI8rn18ysW1PREk86vxlhnfFpTBAE5xPfFvoxWIewYBgI?=
 =?us-ascii?Q?v/L3lYALhXqhr6+9oUNz+i5PTiF5wpShuYpDDWx3Ei/rt5CtsmKdrvVCSJIs?=
 =?us-ascii?Q?E5yMtZQUBSBIa17f7tPDjWpe59tSC9vhk8H1nFFYgLcAu8zWYyuZL9OseGEX?=
 =?us-ascii?Q?4H6C/88d2TOrS5PRT4I7WdawR+DxP8WlvLjW3lEmzzJ6n+U5zdkIjIz4HptM?=
 =?us-ascii?Q?cWSvIsffVofj9iPO2WyOwKOAobtUrBskzki0+UDv7/3MHsXqn7W4FoqIHCjN?=
 =?us-ascii?Q?yONya/ChXshRT4BRIaYornEqWqDuF2A8YJHnzCq57NKl/SwJaZwJ8+3bM0yR?=
 =?us-ascii?Q?EN3FyvTmkXHmRRS+aJWRR4/9fjghXWem1x5lefx+gAjloUZi1l7m3m4YXzSf?=
 =?us-ascii?Q?wsP4CjPLZv53MbDc05+cm/0CUeKkvpPcMw/G0Y+REovobXEYj6PUux+5k7YX?=
 =?us-ascii?Q?B0VQMwvr6s5tH5AnnP2KWKZcRKizVdPjKxCUQXxsxdbR5dC8t3/4qW0+FsfU?=
 =?us-ascii?Q?5gGdsOHTJRHfMh4HakJFm6IhpijcoO4mHrUzNVjZrWeJ4iEPDn623rK7oZet?=
 =?us-ascii?Q?eqI1eIN0cgIk3fuR6OeQ54AYJWtxg2EVgkIRMXah+JTAVhgODA6ib7OAAYKn?=
 =?us-ascii?Q?YjcqbXO73/3lT67MNUtKW2Uaz3CfkJRlFMpwNjSfZaW4BIf+FykvWtKorsTg?=
 =?us-ascii?Q?qiBMFJWujRaD1cz7jlcnZ78vy3Q7q5KNLlX8orcqzf/72Mmpy17eAvPC5/45?=
 =?us-ascii?Q?vb0GAu4iq0mHKNG9oeM9yeQtDhqvNPwRr/gcQoknQbdLZ6iUmLXCGSoxKvjf?=
 =?us-ascii?Q?sPqS0PpW0QPQwMfD2X2Q4B0hhWJnS4KeiUidvt1AR5ThPDm4hkde/GaFsWll?=
 =?us-ascii?Q?5Lv+QI8OrX8j9uNr+leRlr7qJ+KQLoRnsJ8ZWl+DiopM77skPbKFOGIa0oDe?=
 =?us-ascii?Q?rvs6fPzbROjbG47Kqcioi9ndKcK0otv9o84yosudUdtq85z/w/J/ADfnwsZd?=
 =?us-ascii?Q?0klkLSxzIA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	rcPhv3DAauYbLffbEGYoluCtGvhW7chjWRvO71jKDFZmLE/3lInEUAqPbneMDwZs3HwObDGHpTUoUgh2gKHfnUe9Ca0meqTABXnHep8AyKpELpqoibJKzAh5yoFvoJSMXHBsU3X2LBypXpo8QK0mX0AUxr6bBoRNVeKKvzxKQpF7Hrg1DS7n/h8yMA8U+x20sn6iLYE2J5TZIDQ0EziPzklt4YAkdGpQs1tXrbrGpednYh/qHEefVHjGEfXW7hqbnaiSxBvWcM4v1sFHg4p1hdr2bGRQ+B/vD+IMLlXiiNZ2AglEqqTguQQCfZ4mHr8p0wlgPSA0Pvhm4f9WQtM7IQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	T3+t04ONwN+hpiKHuVh2P6Ehm308wcNks5akDNw9zh3Dl6cw9nAVt4qbRUdhBsJPgrxeG6S1+wCD/nDtuwndrnyeJ0MDxKwIyDi2xvECEWxXebYbOKGQiecMlv9RxUZKeHvwa212LvZKyodbD169yaQkPV48UT7uDnuuAiGGY1jMIqZfyILtrU8Kr7SaYNxJFR8qk8VQZJCkoopITCzhREX3mD1mDw1sXOqgS+kQLYtykm7pFivKoyqIN8qwg/Ya9sN6U7htJ/3iTGoONW+0a2hPARfpO6l3I+NvSWwXMH2iNC1yesp4vDJWHsgEOE+xaWnW50Ki40Fl0aZ/if/GvX4SlvwmU48JGf5HLnP/IRRe4N217iYBx4xmRNMEVdbuoSTQ5oHv+gJkj5gaR8cP9e5AkLjFmQ4RjOL+iePhIT/y67q4VlJH6+wVJJvyQE5X/zPFmMQFexh0MZW2D5gAmN4rlWQhvD5vEwrfSKi/xuiXTgvq7xzkVcFc6lKgSsikktLhDfdW13Nfej9K0u9dYRHQWTCCjegf1UcZjsHZJYG1lz7DXBaXOQxMeJU/B4Nuou30QtYZMAk1xt4sW5m00H0vRcMRdMqGvaI8TyoPVEfqZL1fTZfHHZO7MXzYiG5k
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb12e07c-9531-421e-68ec-08dee44afad7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 21:33:02.2056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LL1LGcRzJ7PeYoPmjpSCl8gqWlaQCuvzhcruJ7uPW/Js/XE6Oo6JmVYBFyP+XrWXvlVztuCbB7pMmzdjZKY7iQsENMewVVwvZGYTKo6ei78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR17MB6034
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIyMiBTYWx0ZWRfX6jS0SDUP8S7U
 De8/k8ZzmcwC2CaHkRyKjGi5gheE3vE5JZsFtuCNhyZmfVRPtmtuCIZDTFT6NOj+06urSBfUawQ
 njoqtd5UweOrKB9qD5/C2lllwtf9JWXn+psGLyn99WVGCcdWbKF8Ls4k5hwoFDyFR5rPNUdAeDN
 m6z7qlu/UrYCRMCpBcgSbT2DOozIZQKtFQV8nxg3zZn48zTSZjXScIbCvO2vV1izyvJgA8ZBLvM
 n9IjJ8YvRSGcexatCFS9WX+gD460HJX4Ze74d9JzKoNWy4uqKwhHUbuW+10lReVtUhlaqRnJCMe
 KvLV+/0Yws6YlFXOlcy+XHgrKF2rz0SqTCp8/r1j8xIU3Yllaok843+16sv7C8g0ZpNB8jFVKAk
 lgScsUdHm1QkZKNQBfBDzdsxJxl2w3+fwS6en5yJ8ihXVOOTtYOBeMZXlgvdHdSnehxBt5VsMtg
 UYAAgYek+tUvBg2m/QA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIyMiBTYWx0ZWRfX4NYmUdOP9HGk
 dvy1Nu+r/i3E6ctlSBwUXVJNmnfTFqSWToTcbsCzxPX0yqljfraV61xxgrjOUhNwgqcuHlqywE9
 jHxzmtrDMuAj8SkT3+wFAMe0bMKJ0teP6/9GUTEzCNt7zEk2151M
X-Proofpoint-ORIG-GUID: rhgPkqfrVGJSxF7MhCdZQ4_l5dEeApN1
X-Proofpoint-GUID: rhgPkqfrVGJSxF7MhCdZQ4_l5dEeApN1
X-Authority-Analysis: v=2.4 cv=JeiMa0KV c=1 sm=1 tr=0 ts=6a5a9f90 cx=c_pps
 a=BRu7lVsKyHj15bVqb/Fc8Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=vu2TTH8h0NUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FLoIbiw2ZNY34kqd41oa:22 a=at2XMroQgvxonBsO-bql:22
 a=qq2s7GKWbMUuupIONFYA:9
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241222

This patch series adds a selftest suit for the go-vendor.bbclass and
fixes a couple of bugs in the go-vendor.bbclass.

John Ripple (3):
  go-vendor.bbclass: Fix test file exclusion and license propagation
  oeqa/selftest: Add go-vendor.bbclass selftest suite
  go-vendor.bbclass: Run vendor_unlink task under fakeroot

 .../recipes-test/govendor/files/modules.txt   |   7 +
 .../govendor/go-vendor-src-uri_1.0.bb         |  17 ++
 .../govendor/govendor-real-test_1.0.bb        |  29 +++
 meta/classes/go-vendor.bbclass                |   9 +-
 meta/lib/oeqa/selftest/cases/govendor.py      | 179 ++++++++++++++++++
 5 files changed, 237 insertions(+), 4 deletions(-)
 create mode 100644 meta-selftest/recipes-test/govendor/files/modules.txt
 create mode 100644 meta-selftest/recipes-test/govendor/go-vendor-src-uri_1.0.bb
 create mode 100644 meta-selftest/recipes-test/govendor/govendor-real-test_1.0.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/govendor.py


