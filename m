Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DB1C4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 20:08:53 +0000 (UTC)
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com [205.220.161.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9028.1784750926088834542
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 13:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@keysight.com header.s=ppfeb2020 header.b=nRRhOA7+;
 dkim=fail reason="dkim: body hash did not verify" header.i=@keysight.com header.s=selector1 header.b=NkZBVenN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: keysight.com, ip: 205.220.161.93, mailfrom: john.ripple@keysight.com)
Received: from pps.filterd (m0187213.ppops.net [127.0.0.1])
	by mx0b-003cac01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MIwB1j148581
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:08:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
	5fZBbFO+J+lFgfPhIIwo8YgL+7f3WlxCYDS6oKCksMM=; b=nRRhOA7+RnD2jgBr
	xxfc0NbzdlNgg0OpvnOlo3TvndrkJqMOKF2J/ADpldM/CzigxaBFG1i3eeefHQvy
	m7DF9yq3GsktAkbsU+G8Ov/kXtErR78JKy07rqMgajpzRetFyBHVc9GlMDsVYneY
	7nawGru7Km9who2TRxee6GkCT6ids8WGEhjV6hms21fVNdQNeCFTu77pkbebacx0
	9YeoeT4M7DPVenTwxh3dEiZzS/Ca4L6VdSz8BkYzN3iYqvTkQcMzTtSD6qA9T1+0
	L4mNwoPysVAQiC43OMddzq7gcqNzOPTUoHlPgawYU3tfueEqbTFmaEXJxX2Ok/rQ
	TGD3zQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011053.outbound.protection.outlook.com [52.101.57.53])
	by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 4fjme53bm8-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:08:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gtq4bhm+8jfoUUZNPuUvEeSLm14mBadIm722msDi1PZiqkVEjyFZVnswBQ9QvRfsK7A2ZwucHm+U1S0QFWFo/rZiCc7sfTpCzWf8reA1GaMVPdHxeBFsEqTOtf+Zjb14TGuI8esQYcJB8rkgGdX4vS9Cf4makeHNcrlRe1Ss4PUP9QUkmHOg/YzgeQCggZ7MT+0juxY8iO0LwZtLpBoF6T+LXMWBWjMO14bGWCC/gtsmIlvzXavB9qxbLVQRsKYGNhuaMx3NO3rQJ/yPeqtr2RtZ1Mqc31rYDLUtNl2zP+pRGym96xa/qQoiQS3MB0FTCnmaJVhMN8Lk/shntH8gfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fZBbFO+J+lFgfPhIIwo8YgL+7f3WlxCYDS6oKCksMM=;
 b=BwcgwzHNvQICL6SFHNxj5KsVYl7/fRmG9gQRj/xoji9fjfNYYT5UW1rGkmdNTjBUOdg9UCeQEdlIqlmkDYMvn4SNB5LdyEej0hzTpo/K15MmCvCF5uXs3uD3S3uK8OBr8+g2AgCQ8znMaL80Hs9NhMA0tcFmFL50vSi1OG90VyFxbPCnddy++/C3t9D36ToNS7FODutFWainbkd0gqa6nr8jhaYF25e8b8T2sW7GabrjxOmYu6QRNlwtUck+8LPRjoHj8oXYiLIArLB5SvI46pLagtLS//2xQjGnq10fywOn1N8opCeTb/7uodiYa6iT/YVMrL7CAOkNhltJ7tGLlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fZBbFO+J+lFgfPhIIwo8YgL+7f3WlxCYDS6oKCksMM=;
 b=NkZBVenNSeEOpS29hh7tuNdNwBlWYz4SVkiCdgs7iEVif0V/iL6YRNH9sJz3B9+WpRQuWRNeMrsH8Su9oDvgLySP6bNGeZP0V2IM6ojNK6AGLcc2Rz3i+lhdeC+mTzyWY9ZLkzZWsav2zp/hBSt5xCDSx+PIGp18WLkv07PIFTA=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by DS0PR17MB6981.namprd17.prod.outlook.com (2603:10b6:8:162::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 20:08:41 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2%3]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 20:08:41 +0000
From: John Ripple <john.ripple@keysight.com>
To: openembedded-core@lists.openembedded.org
Cc: John Ripple <john.ripple@keysight.com>
Subject: [meta][PATCH v4 2/3] oeqa/selftest: Add go-vendor.bbclass selftest suite
Date: Wed, 22 Jul 2026 14:08:28 -0600
Message-ID: <20260722200830.2917254-3-john.ripple@keysight.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722200830.2917254-1-john.ripple@keysight.com>
References: <20260722200830.2917254-1-john.ripple@keysight.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: CY5PR15CA0224.namprd15.prod.outlook.com
 (2603:10b6:930:88::19) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|DS0PR17MB6981:EE_
X-MS-Office365-Filtering-Correlation-Id: 300d0d66-238e-4990-99ee-08dee82d0598
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|55112099003|3023799007|13003099007|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	HsJeS5+k0xeMLYpnUFMaoaEmHFtE/B7D55+wBYuWSBomOu/1uwyyXJ76c/+m/xBsSiCuQMQIZ2cN2oqChn8vzr24gY1YiBWXx2i7Z1OczgGSdSWWZAyH2Sf7dEECCwLnhgs4qOwJGq2eZdpXo3Vw+TeIuzto7hT2KtfaBCaEBRMXLRCEW+QSR8CTR+vA5kGa9iM5bmzCs7Ht19BDRZGgkq60fQx3f3jaYjExb8ACKkz3GUveqaX6povFAnfmMP/EeulJ0SClbPbgo0Q6le1ZbJm6/Tp2LYjhem87/R8XT8fvv8rM6FW+DWi1kcQbBFDknSZd4ZAqvlEb/n5pkN3ZlaJRCRtlGMuYVQHebBoKblT2PVM+fYh/w/Zss635DFWW2+V8EmR4gYyfRwQeFUa4d0kDzq6FHO+icTuiuFnN3QM5biOTtuyzac/RT0TVmS/UfkbLsQyGO5xHGaMeHJ30O2WSYC1M/Nonthitwv7dghkrEoeNFuo0hzt0K1Y+e06Yu0glGg2nmpkDHWFNcTezYx9EROBZMCETcTSFQVWSUKtVnphsK3RswDqihGgmPSOlw6pK8PLEjpZyemG9i6ecC/W++TSjXdb5/bczbWRIJDA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR17MB6130.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(55112099003)(3023799007)(13003099007)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Yk1qTTJ0TlU0YmcvZiszUll3MU10N25FMHBDc0RYbEJxbTE5TjZFb2RUQWlX?=
 =?utf-8?B?cFBkTlpsSjJlLzlqVGVoeFFjU1U5NTdpUDRYNmJNdXp4S21OcUx3a1dMU0JR?=
 =?utf-8?B?SzBPU1RSUTNXK1V0YUxidWJOY2hqVGQ1OWgwS0lJdlFJVHlISVFRcHVTcFVj?=
 =?utf-8?B?OEpFMHpvTlU1TnN4UHhnMlFGNGM2emdtMi94OE9oODhwNGhuNnI3VFFHRlJ4?=
 =?utf-8?B?ZDVlSkdac1NlOElQbTF5VmxINlBQTmxWYzJhV1dpS2VVeE1vUyt2QlgzRzVm?=
 =?utf-8?B?b0dlT1hjZmVRTER4emlmdGhDc3JYeGFpbzFIT2xPWmlMTTEvTG5odTM3Um4v?=
 =?utf-8?B?QmxReDdsLzdMRGgyeDVJczVucUxnNDBTSmlic0xQZEVSazc0THFpbHQxZjN4?=
 =?utf-8?B?ZFRhdUVJZlpPSGVKTkw3RFI4WTRITXRiWkNEbmFjcDMvbSt5Skc1K3RPSFpr?=
 =?utf-8?B?ZVNpU0E0UHVVZjZsbTU5c05QTVpCQXhpRVhtZnQ0QUpCY2kzczVSQnN2Wm5O?=
 =?utf-8?B?ZTF2ZE55WGpKVWU3N3ZBN3hmMXA4djZjZ0xqME95cDRVMWR5bUZvaWhrLytl?=
 =?utf-8?B?YUpIZFdSNlN1VUpKQUxJQngyUFJkRFczSjBzRjc5ZWtqd2lxYkUwcVA3SlFV?=
 =?utf-8?B?M2RGNWcyMUxSR0lPTWtSN2twNXVIWGJyZGZuaVo5cmlqdDRESVQ5RXJRaG10?=
 =?utf-8?B?Wk1ObDkrT0F6SkVvRy9MYjNKOXFpYWdCeUV1OVVQU3hqUlB0WG1BbVRpV3dl?=
 =?utf-8?B?djRxTFBDMjhhbjlpUUJYeWlVdkFQS0hjRzFBTUQ2OUNGeW15Q2Z1MU9OKzQ4?=
 =?utf-8?B?WjhUS0MyMm5vUjJnZmw3Nml4d3N4QURzeGFaU0IxRms5NjlBdmw2OEFBTURU?=
 =?utf-8?B?T0dTUXRsSjY4UTNjbHYveTlUSkRZNDZXRkV4czcwSTRrWXdKaGlKUXZ3WVMr?=
 =?utf-8?B?RXBlay85cDNLdlpFdVIrVHVLQVBTUjFRaStoN3BPR011ZHppZGVubUZiM3ZQ?=
 =?utf-8?B?Q0srMlU5czFMcjJkNGlkaG8zOTRFazdQdzkzTVVFb3V5V1h5cXplMzBVYU5B?=
 =?utf-8?B?UnhpakxXb1FPMjcyV29YSmZyVjJiNmJMaitpNVAxazQ3czQ1alRuVXcwOEpY?=
 =?utf-8?B?NGViZGJ6VnUwNmt5VDE0TEdrRG05Rm5uK0ZMODlFR2NiQUc3RXJITGFzemU5?=
 =?utf-8?B?UURRaE1HditXN1UzWGRKT0h3eUNMY1FTRmNXZjRKVzlKQlBaYmo0UCthelRP?=
 =?utf-8?B?K2J6YVVZU05JRmdvOUd2OFFYOTF2ZnZnVkYzaXcrVEhvakJNcllaQWs5ZHFm?=
 =?utf-8?B?NHlnME5VbVpIb2lZWkhiZ0RtOHUrYmtFQVFYVlJIUTc4MFZHa1JoRUdWMGlH?=
 =?utf-8?B?aTkyaTV1Q3B1a0dFM2pIMFloTXNneko5QXpqZ3cxVURFanE1VWNNeGNDRGxw?=
 =?utf-8?B?TFk5RXdRSFd1THlOalQ5VGYyLzZnNGMrSVhNY0RZeVJjUDU1MGlvMEhKT2k5?=
 =?utf-8?B?N0szMlhOWW5zaEFWVHVad1RhVXk1cE1UQk1ac2pJVmZSYkR5T3BXUDAvOWcw?=
 =?utf-8?B?eSsvamVTbzFzMm9MVmIxUmhJUm5WWXMzbzZCZTNURlJOMHhDZU9ZODN0eUtv?=
 =?utf-8?B?WXp5TzlqeFdFUzg3djZ2M0Jkc0g5YlkzbkFmRHVlZGh4RTlIQnU0a2hxTmlC?=
 =?utf-8?B?Z3p2OWEyRTB0UGk3R2t6QytIVVZORS9SZ0x0WXNwYWt6NlBJdFdTSG0vVDJ6?=
 =?utf-8?B?dGVJMW4wN2x3OWFMaDFTcVFGOTFLRlBVdWhJWWxHV0J0WmNoUlUvZTE4dkZu?=
 =?utf-8?B?YmdsNjhZaG5vOVlGRE9LNTdHMXhsSVZZcnRRUXJRcFVsSEVrbGtmVEw3aXMv?=
 =?utf-8?B?OFBSRWZsdGJNNjZxOC9JcTVYQStkZUhOTmtjcldmb1RsaXpCQXUrRzZycnh0?=
 =?utf-8?B?cVFGZWtDSzN4aEtXa3hrRVlsNEkvQkVybWlaMTFGdEMwNndCbWt1UmZHTWVV?=
 =?utf-8?B?RW1LdGl5RkpWUm9YUjJPcnI2QSt6QkY3SERQTmJZcHQxRkFFSXc4Z0dRbjcw?=
 =?utf-8?B?WGZ5a2ZrRTM1ZGdNeHltUVJXdGVyN0JkUDhwaGYrbnpWWEErSGR0WE5VeXFU?=
 =?utf-8?B?WXYwd0YrV0pTdnUrVTBxdm5sa0pSL2FUdFRnSHc5VkhDbDBtSUV5SEdwV2Z5?=
 =?utf-8?B?eWxLRzkwdzVkYlVmUjMvSjhJazRtaEVyVk9Rak1aMSs2blZJcFgwSnhDNzZy?=
 =?utf-8?B?ei9VS3g2UU82bGR4QmU2UmZDa2orWWZLd2R1TU93UDREYVRGWGt1ZXdTWkdh?=
 =?utf-8?B?Zy8yelZQZ0ZSbFVOTXNLQUc0dGczQ1lBWWwwZ2VIMi8wYmVyVWtpdz09?=
X-Exchange-RoutingPolicyChecked: 
	kslj+IAHZyUz5AsOp6v/puTKMBy8Chi3+rljOHf4LSFcLybXm1p60tC7xEEJkWZ3HKZVIF9L25bZXG32lZehH5yf0rJxkX7lHR0zBEqaTh3snGUErVNxrlYN2IYa6jRdcU+jhC0F0rbs8qN1rY/gSvT8nRIg9wbJhUbC9cgdfvLLlPqYdYbOMqmdrtcdoJFIRihD5/IWP44XgJmZ1rt6b/h8Ca4Z4oC/ehDNHpXJPw5Uj8TonTyLxcrFkV3Ji6Bgs5psgogBxFr6B1Ac6zZUiHlv3ruhO+CK8NfTfDg1xogCO7fsRV3Ze9JFFwTClTORzP2CX7NH6vPGUfsIPWnSgA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	ybSgAlnyexwMujPZcY41sdPCrdzd+ttLiqLaM6WhT38U/Nr4v+EQuNpcyJuuU4wrUFMZcrkvZMeex0HRECbLUwat1pLPVp4yx0tAP7Av1zNXxSUBpvd+IosAfMrUUw0eoUoC1a6h5Xzh+9/gZ+DiSbIL7MKn+lvpAHwS8PP+mEJ+odY0wRDs0gz/l7WaZLGdJTjiCquX2XsGKF1+edMewI4dIwl/FzhCakooGS7sFjpPydJU9wI/b+dI65Z8vE6KRgWjhuSDprdBtjQuD3m20Sz2f7cjQriPfKo+Kcipnx9/qYPzYm4i4WRwYmPIjV/AFtsAIWfPS2DJy/3sFaoQOocQjfY5QVBdpIgTjqvJbcl0Bh6oLeNAgOTeh3/XMsVgLkMHG3Z0//PRSGhOx+PJwGkztumCY8vO+XrNGFl5kMXevaOxR4l0p4rbpofgl4pPG0EoURT6l5N2EQLkn7e8RqiMDXO/q6HXn3/AImWv1SXGKjvhri6m1DwSe0SL1ajXce+ojvWwCCIW6nSeVt4/hqcqGn7KLahwD7nxDgS4FkYq7ETbZYtgulpBzm5lg9yER1YeS0rfVqNE172tYKyxzVuF+tR5BBJadBc28L4PXs5YOXiGra+FE9U0CF77q1jt
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 300d0d66-238e-4990-99ee-08dee82d0598
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 20:08:40.0184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LADnPo7eiKSM4Co2BU3RvqMrsmHJrIU7f4fHDd15u/mVnQzBV5ewJ2R+gPNfNXaFQG9f1EHjkzyEY+ieES0aW5N7fRrg7UG5iDtBbtzOirU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR17MB6981
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE5OCBTYWx0ZWRfX75TyX0KWHvd5
 3GGTsQC+GXgZEmSE6brxYx5dfkjnOSYXTADaci4+8jORE8ZVynM/prxi6gvhVhku2xkte2SEPyp
 hJkW7YtT0DG1jVIf3Nch6rl/s+10CsY3X6Em7BfMbU3U17GmhJk5
X-Proofpoint-GUID: mWMMZEfLg0auIFmluzpVuHshLtxVb2As
X-Authority-Analysis: v=2.4 cv=PdPPQChd c=1 sm=1 tr=0 ts=6a61234d cx=c_pps
 a=7AIX19wKKSH4vG2a64CeWA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=vu2TTH8h0NUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FLoIbiw2ZNY34kqd41oa:22 a=BswK4llZXKt4Tvt69P-b:22
 a=F6MVbVVLAAAA:8 a=NEAV23lmAAAA:8 a=A1X0JdhQAAAA:8 a=iGHA9ds3AAAA:8
 a=5cgIs88SztoUVwLlgL4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6mxfPxaA-CAxv1z-Kq-J:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE5OCBTYWx0ZWRfX/mVt5BnbYciH
 rrdWIbtZ4KCag9fbnfUx0tpweX+YF/wXB18LuMmy+2LGzXgzt2nmv2TfcpthNpTGr1E6JdL8IVo
 xt2U4pUwUsOX6v8uo3e7iXiDrEmLh9h6EpH++8FQ+v/uBVHBlgXOGxSqzRbpN5qWZHZZjRv7fRE
 FpzqSpSzeLopT/qtyr9mlZNoX6L20mIpUpS01Qi9asOzUkSUS4KBfihg18hpvatiKx2gQiwNByo
 gzVB+UxdNqvLOzEFuSkB8gfxPB30bqPLXCs2WjmHp6dvCI9eGhGXROSRQb/Z2U+01/cYLvqqM4k
 fUexmkVt4kb6Xz96UAme4w1mOdisQuvFdlrwSA1UAeHmV4W3NQ9RpvjipC/m27+o3Uh8jFRU1ij
 MhtHxCtq4JzMgx83pDQU5oLPSptjSH/7UBUsw4UpYRm0anXjX+javn8cvfNYxuQ5LbZBfMNN3yY
 +q8mHSZnuVfDV4tOeyA==
X-Proofpoint-ORIG-GUID: mWMMZEfLg0auIFmluzpVuHshLtxVb2As
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11854
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220198
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-003cac01.pphosted.com id 66MIwB1j148581
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 20:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241743

Add govendor.py with two test classes that cover the behaviors fixed and
defined in go-vendor.bbclass:

GoVendorSrcUriTests (offline, ~10 s): unit tests for go_src_uri() parsed
via bb.tinfoil; verifies the basic URI shape, path/pathmajor/subdir/repla=
ces
encoding, and that non-git VCS omits the git-specific nobranch/protocol f=
lags.

GoVendorTaskTests: runs do_go_vendor once against the real recipetool-go-=
test
project and checks that external deps land in vendor/, *_test.go files ar=
e
excluded, pathmajor=3D/v5 falls back to the repo root when no v5/ subdir =
exists,
modules.txt is reproduced in vendor/, a local replacement (./is) appears =
as
a symlink, and the S/src/GO_IMPORT/vendor -> S/src/import/vendor symlink =
is
created.

Exclude the govendor test recipes from world builds since they are only m=
eant
to be built directly by the govendor test suite.

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
 .../recipes-test/govendor/files/modules.txt   |   7 +
 .../govendor/go-vendor-src-uri_1.0.bb         |  18 ++
 .../govendor/govendor-real-test_1.0.bb        |  29 +++
 meta/lib/oeqa/selftest/cases/govendor.py      | 179 ++++++++++++++++++
 4 files changed, 233 insertions(+)
 create mode 100644 meta-selftest/recipes-test/govendor/files/modules.txt
 create mode 100644 meta-selftest/recipes-test/govendor/go-vendor-src-uri=
_1.0.bb
 create mode 100644 meta-selftest/recipes-test/govendor/govendor-real-tes=
t_1.0.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/govendor.py

diff --git a/meta-selftest/recipes-test/govendor/files/modules.txt b/meta=
-selftest/recipes-test/govendor/files/modules.txt
new file mode 100644
index 0000000000..f64f5245b5
--- /dev/null
+++ b/meta-selftest/recipes-test/govendor/files/modules.txt
@@ -0,0 +1,7 @@
+# github.com/godbus/dbus/v5 v5.1.0
+## explicit; go 1.12
+github.com/godbus/dbus/v5
+# github.com/matryer/is v1.4.1 =3D> ./is
+## explicit; go 1.14
+github.com/matryer/is
+# github.com/matryer/is =3D> ./is
\ No newline at end of file
diff --git a/meta-selftest/recipes-test/govendor/go-vendor-src-uri_1.0.bb=
 b/meta-selftest/recipes-test/govendor/go-vendor-src-uri_1.0.bb
new file mode 100644
index 0000000000..6f0364b7da
--- /dev/null
+++ b/meta-selftest/recipes-test/govendor/go-vendor-src-uri_1.0.bb
@@ -0,0 +1,18 @@
+SUMMARY =3D "Selftest fixture: go_src_uri parameter variants"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"=20
+
+# Parsed via tinfoil for its GO_SRC_URI_* variables only; never actually=
 built
+# (it has no real SRC_URI, so do_go_vendor would fail).
+EXCLUDE_FROM_WORLD =3D "1"
+
+inherit go-vendor
+
+GO_IMPORT =3D "example.com/testpkg"
+
+GO_SRC_URI_BASIC     =3D "${@go_src_uri('github.com/foo/bar', 'v1.0.0')}=
"
+GO_SRC_URI_PATH      =3D "${@go_src_uri('github.com/foo/bar', 'v2.1.0', =
path=3D'github.com/foo/bar/v2')}"
+GO_SRC_URI_PATHMAJOR =3D "${@go_src_uri('github.com/foo/bar', 'v2.0.0', =
pathmajor=3D'/v2')}"
+GO_SRC_URI_SUBDIR    =3D "${@go_src_uri('github.com/foo/bar', 'v1.0.0', =
subdir=3D'sub/pkg')}"
+GO_SRC_URI_REPLACES  =3D "${@go_src_uri('github.com/baz/qux', 'v1.0.0', =
replaces=3D'../local/baz')}"
+GO_SRC_URI_SVN       =3D "${@go_src_uri('example.com/svnmod', 'r42', vcs=
=3D'svn')}"
diff --git a/meta-selftest/recipes-test/govendor/govendor-real-test_1.0.b=
b b/meta-selftest/recipes-test/govendor/govendor-real-test_1.0.bb
new file mode 100644
index 0000000000..8086922e10
--- /dev/null
+++ b/meta-selftest/recipes-test/govendor/govendor-real-test_1.0.bb
@@ -0,0 +1,29 @@
+SUMMARY =3D "go-vendor integration test: recipetool-go-test"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=3D4e3933dd47af=
bf115e484d11385fb3bd"
+
+# Only meant to be built directly by GoVendorTaskTests (bitbake('%s -c g=
o_vendor')),
+# not as part of a general world build.
+EXCLUDE_FROM_WORLD =3D "1"
+
+# Native variant lets GoVendorTaskTests.test_do_compile_succeeds exercis=
e the
+# real go toolchain without requiring a full target Go cross-toolchain.
+BBCLASSEXTEND =3D "native"
+
+inherit go-vendor
+
+GO_IMPORT =3D "git.yoctoproject.org/recipetool-go-test"
+
+# modules.txt for recipetool-go-test at SRCREV:
+#   - github.com/godbus/dbus/v5 v5.1.0  (external, fetched via go_src_ur=
i)
+#   - github.com/matryer/is v1.4.1       (local replacement =3D> ./is)
+# Use go mod vendor to generate the modules.txt
+SRC_URI =3D "\
+    git://${GO_IMPORT};name=3Drecipetool-go-test;branch=3Dmain;protocol=3D=
https;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX} \
+    ${@go_src_uri('github.com/godbus/dbus', 'v5.1.0', path=3D'github.com=
/godbus/dbus/v5', pathmajor=3D'/v5')} \
+    file://modules.txt \
+    "
+SRCREV_FORMAT =3D "recipetool-go-test"
+# git.yoctoproject.org/recipetool-go-test main branch HEAD
+SRCREV_recipetool-go-test =3D "c3e213c01b6c1406b430df03ef0d1ae77de5d2f7"
+SRCREV_github.com.godbus.dbus.v5 =3D "e523abc905595cf17fb0001a7d77eaaddf=
aa216d"
diff --git a/meta/lib/oeqa/selftest/cases/govendor.py b/meta/lib/oeqa/sel=
ftest/cases/govendor.py
new file mode 100644
index 0000000000..8be2712060
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/govendor.py
@@ -0,0 +1,179 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+# Comprehensive tests for go-vendor.bbclass:
+#   GoVendorSrcUriTests  -- unit tests for the go_src_uri() helper (offl=
ine, ~10 s)
+#   GoVendorTaskTests    -- integration tests using the real recipetool-=
go-test project
+#                           (network fetch of git.yoctoproject.org + git=
hub.com/godbus/dbus)
+
+import os
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var
+
+# ----------------------------------------------------------------------=
-----
+# Class 1: go_src_uri() helper function
+# ----------------------------------------------------------------------=
-----
+
+class GoVendorSrcUriTests(OESelftestTestCase):
+    """Tests for the go_src_uri() Python helper in go-vendor.bbclass.
+
+    Parses the go-vendor-src-uri fixture recipe (meta-selftest/recipes-t=
est/
+    govendor/go-vendor-src-uri_1.0.bb) via bb.tinfoil (config_only=3DTru=
e) once
+    per class so the function runs inside the real BitBake class-loading
+    machinery.  All tests are offline and complete in ~10 s total.
+    """
+
+    @classmethod
+    def setUpClass(cls):
+        import bb.tinfoil
+        super().setUpClass()
+
+        recipe_path =3D os.path.join(cls.testlayer_path, 'recipes-test',
+                                    'govendor', 'go-vendor-src-uri_1.0.b=
b')
+
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(config_only=3DTrue, quiet=3D2)
+            rd =3D tinfoil.parse_recipe_file(recipe_path)
+            cls.bp =3D rd.getVar('BP')
+            cls.uris =3D {k: rd.getVar('GO_SRC_URI_' + k)
+                        for k in ('BASIC', 'PATH', 'PATHMAJOR', 'SUBDIR'=
,
+                                  'REPLACES', 'SVN')}
+
+    # --- individual test methods --------------------------------------=
-----
+
+    def test_basic(self):
+        """destsuffix uses expanded BP"""
+        uri =3D self.uris['BASIC']
+        expected_ds =3D 'destsuffix=3D%s/src/import/vendor.fetch/github.=
com/foo/bar@v1.0.0' % self.bp
+        self.assertIn(expected_ds, uri)
+        self.assertIn('go_module_path=3Dgithub.com/foo/bar', uri)
+        self.assertIn('nobranch=3D1', uri)
+        self.assertIn('protocol=3Dhttps', uri)
+        self.assertIn('is_go_dependency=3D1', uri)
+
+    def test_path_override(self):
+        """Explicit path=3D sets go_module_path independently of the rep=
o URL."""
+        uri =3D self.uris['PATH']
+        self.assertIn('go_module_path=3Dgithub.com/foo/bar/v2', uri)
+        expected_ds =3D 'destsuffix=3D%s/src/import/vendor.fetch/github.=
com/foo/bar@v2.1.0' % self.bp
+        self.assertIn(expected_ds, uri)
+
+    def test_pathmajor(self):
+        """pathmajor is encoded as go_pathmajor in the URI."""
+        self.assertIn('go_pathmajor=3D/v2', self.uris['PATHMAJOR'])
+
+    def test_subdir(self):
+        """subdir is encoded as go_subdir in the URI."""
+        self.assertIn('go_subdir=3Dsub/pkg', self.uris['SUBDIR'])
+
+    def test_replaces(self):
+        """replaces is encoded as go_module_replacement in the URI."""
+        self.assertIn('go_module_replacement=3D../local/baz', self.uris[=
'REPLACES'])
+
+    def test_non_git_vcs(self):
+        """Non-git VCS omits the git-specific nobranch and protocol=3Dht=
tps flags."""
+        uri =3D self.uris['SVN']
+        self.assertIn('svn://example.com/svnmod', uri)
+        self.assertNotIn('nobranch', uri)
+        self.assertNotIn('protocol=3Dhttps', uri)
+        self.assertIn('is_go_dependency=3D1', uri)
+
+
+# ----------------------------------------------------------------------=
-----
+# Class 2: do_go_vendor task integration =E2=80=94 real project
+# ----------------------------------------------------------------------=
-----
+
+class GoVendorTaskTests(OESelftestTestCase):
+    """Integration tests for do_go_vendor using the real recipetool-go-t=
est project.
+
+    The govendor-real-test recipe (meta-selftest/recipes-test/govendor/
+    govendor-real-test_1.0.bb) fetches git.yoctoproject.org/recipetool-g=
o-test
+    (commit c3e213c) as its main source and github.com/godbus/dbus/v5 v5=
.1.0
+    as an external vendor dependency.  The project also has a local modu=
le
+    replacement (github.com/matryer/is =3D> ./is) that lives inside the =
main
+    source tree.
+
+    do_go_vendor runs ONCE in setUpClass; individual test methods inspec=
t the
+    resulting vendor directory without re-running bitbake.
+
+    Verified behaviors:
+      - External dependency files are copied to vendor/
+      - *_test.go files are excluded from the vendor copy
+      - pathmajor fallback: when the /v5 subdir is absent, repo root is =
used
+      - modules.txt is reproduced inside vendor/
+      - Local module replacement creates a relative symlink in vendor/
+      - S/src/GO_IMPORT/vendor symlink is created pointing at S/src/impo=
rt/vendor
+    """
+
+    GO_IMPORT =3D 'git.yoctoproject.org/recipetool-go-test'
+    RECIPE_NAME =3D 'govendor-real-test'
+
+    @classmethod
+    def setUpClass(cls):
+        super().setUpClass()
+
+        bitbake('%s -c go_vendor' % cls.RECIPE_NAME)
+        cls.s_dir =3D get_bb_var('S', cls.RECIPE_NAME)
+        cls.vendor_dir =3D os.path.join(cls.s_dir, 'src', 'import', 'ven=
dor')
+
+    # --- test methods (all inspect cls.vendor_dir, no bitbake) --------=
-------
+
+    def test_external_dep_copied_to_vendor(self):
+        """godbus/dbus/v5 source files are copied into vendor/."""
+        dbus_dir =3D os.path.join(self.vendor_dir, 'github.com', 'godbus=
', 'dbus', 'v5')
+        self.assertTrue(os.path.isdir(dbus_dir),
+            'vendor/github.com/godbus/dbus/v5/ not created')
+        self.assertTrue(os.path.isfile(os.path.join(dbus_dir, 'conn.go')=
),
+            'conn.go not found in vendor/github.com/godbus/dbus/v5/')
+
+    def test_test_files_excluded_from_vendor(self):
+        """*_test.go files from godbus/dbus are not copied into vendor/.=
"""
+        dbus_dir =3D os.path.join(self.vendor_dir, 'github.com', 'godbus=
', 'dbus', 'v5')
+        self.assertFalse(
+            os.path.isfile(os.path.join(dbus_dir, 'conn_test.go')),
+            'conn_test.go should have been excluded from vendor by *_tes=
t.go pattern')
+
+    def test_pathmajor_falls_back_to_root(self):
+        """godbus/dbus v5.1.0 has no v5/ subdir; pathmajor=3D/v5 falls b=
ack to root."""
+        dbus_dir =3D os.path.join(self.vendor_dir, 'github.com', 'godbus=
', 'dbus', 'v5')
+        # auth.go is at the repo root of godbus/dbus, not inside a v5/ s=
ubdir.
+        self.assertTrue(os.path.isfile(os.path.join(dbus_dir, 'auth.go')=
),
+            'auth.go not found; pathmajor=3D/v5 fallback to repo root di=
d not work')
+
+    def test_modules_txt_in_vendor(self):
+        """modules.txt is reproduced inside vendor/ and lists the extern=
al dep."""
+        modules_txt =3D os.path.join(self.vendor_dir, 'modules.txt')
+        self.assertTrue(os.path.isfile(modules_txt))
+        with open(modules_txt) as fh:
+            content =3D fh.read()
+        self.assertIn('github.com/godbus/dbus/v5 v5.1.0', content)
+
+    def test_local_replacement_symlink(self):
+        """go.mod local replacement (./is) creates a symlink in vendor/ =
to S/src/GO_IMPORT/is."""
+        symlink =3D os.path.join(self.vendor_dir, 'github.com', 'matryer=
', 'is')
+        self.assertTrue(os.path.islink(symlink),
+            'vendor/github.com/matryer/is should be a symlink for the ./=
is local replacement')
+        expected_target =3D os.path.join(self.s_dir, 'src', self.GO_IMPO=
RT, 'is')
+        self.assertEqual(os.path.realpath(symlink), os.path.realpath(exp=
ected_target),
+            'Local replacement symlink does not point to S/src/GO_IMPORT=
/is')
+
+    def test_go_import_vendor_symlink(self):
+        """do_go_vendor creates S/src/GO_IMPORT/vendor -> S/src/import/v=
endor."""
+        link =3D os.path.join(self.s_dir, 'src', self.GO_IMPORT, 'vendor=
')
+        self.assertTrue(os.path.islink(link),
+            'S/src/GO_IMPORT/vendor symlink not created')
+        self.assertEqual(os.path.realpath(link), os.path.realpath(self.v=
endor_dir),
+            'S/src/GO_IMPORT/vendor does not point to S/src/import/vendo=
r')
+
+    def test_do_compile_succeeds(self):
+        """The vendored tree is valid Go: the toolchain can actually bui=
ld it.
+
+        Runs against the -native variant so this only depends on go-nati=
ve,
+        not a full target Go cross-toolchain. The SRC_URI fetch is alrea=
dy
+        cached in DL_DIR from setUpClass, so this mainly re-runs
+        unpack/go_vendor/compile for the native variant.
+        """
+        bitbake('%s-native -c compile' % self.RECIPE_NAME)

