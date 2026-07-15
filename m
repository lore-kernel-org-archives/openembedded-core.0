Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 516C5C44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 15:20:37 +0000 (UTC)
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com [205.220.161.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8122.1784128832013874307
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 08:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@keysight.com header.s=ppfeb2020 header.b=kk0ZsZ2g;
 dkim=fail reason="dkim: body hash did not verify" header.i=@keysight.com header.s=selector1 header.b=QQqqfdHX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: keysight.com, ip: 205.220.161.93, mailfrom: john.ripple@keysight.com)
Received: from pps.filterd (m0187214.ppops.net [127.0.0.1])
	by mx0b-003cac01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FDeQYX136804
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 08:20:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
	J9WaUIXSPln7eM+eQLtN/sJrnBxOpnsYSIHSoTBCcRI=; b=kk0ZsZ2gEXmYoBp/
	0lQCo50QAzFhTkykRC7TFhYlIsrH2YHK2DK5qj6XJKhvFqeA3qH1NhdXW8aQE56N
	hygpJiIW1I7e8h//KUXQ6PR+McP9dX2WvzU2cIrmVdNWHUBy9eenJXvSslG9nK3f
	F6JO/dkgfmjoB3t+aiXNDxlw5nFZQRATgT9MuGkWU0y5jmLGO6GhL2QwoANMulcf
	WSKEnUG8qLm86C0PtZvYELah3B4XWDgoGa7c4OfuVG2xqInz+cmgwgwTAW3R1GBr
	Mf66Sjr5BDiQZ8wNi+bAQC5WXdZRupPXDfO6Ut6ZGGUSSq+3ZyHHvdRHsVXQfP61
	04cAng==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010039.outbound.protection.outlook.com [52.101.201.39])
	by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 4fe11ha1qe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 08:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xg6CZ0q4H7Uc9yIT+Y8TGk7wtTyDJxksDFfBsr0emIXmF8Hlp5eTSxt44I7MdiCuxLh/RT9ueF1jsZZdA0gNZWOgVfOzfNyKiI6xZllxnmJRdQwACglKeyQOqVhH4a1LqENydYYl2o8fzlFhkMAXZufz9AVS+kMT4MW9ChrXqXx5q3qtM6fzDoP5WT6o5hQ2+9LRAobgNx9RBIMZLASKRBc+CgGAe7NC9w+LQYxTSrqRnmYPMD4mg8vus4H9T15OLRCCvM7nD6Y0QQhYr0v5yBzKL0urh90khlCMqlrqX18mp5BKXHTL0vVf8hCZGnnJipQ4FCYxn6onXO0PLjV8Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9WaUIXSPln7eM+eQLtN/sJrnBxOpnsYSIHSoTBCcRI=;
 b=PXN4dFqqoxqDpprBWOv2DsYEVjvbO/HEsLJeIGIRgj4RfGd56z6jD5N3EtjPvS4ih4HiyBeq3GhjIrWZ/5t2aWhHk5DJWStZNUrNHQHKr0EPefmwbaE2f1dKH6W1w/7pXa8D0qJ3W1RziyoWNQMY75zFQPlWEycqOqoCA9vREudXtjWYKxHd0auG0zLzGhwYmP5KFBedyqxalrAiC4E6IjWajsHVKD3+lIwYR4+Fl2n2FyWORihGcB8K1On9FuT13IDmE7x6otMhZHxlwIIDsdbDyFL8UL1T8xuo3Rt5erF0yiYHWwl69gO3OPYRwsZr6RXaT17KJs+q5oJcTSb2qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9WaUIXSPln7eM+eQLtN/sJrnBxOpnsYSIHSoTBCcRI=;
 b=QQqqfdHXgR4M35M75BNN4iqYtENQVa9JfbdidbyhwJZ3EU1RRmd9tjHY1QpPC2OgdcP8wOgCWFAdjBPDQm5yOjXDLg5VRk8B7z1rCJF0nmuR+ebET6h5C0ornoAi7ahNeLZMjyonEEXoKZqRnDAxXFU2JntTO0KLBRro9JkehVw=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by SA1PR17MB5717.namprd17.prod.outlook.com (2603:10b6:806:1cc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 15:20:25 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2%3]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 15:20:25 +0000
From: John Ripple <john.ripple@keysight.com>
To: openembedded-core@lists.openembedded.org
Cc: John Ripple <john.ripple@keysight.com>
Subject: [meta][meta-selftest][PATCH v2 2/3] oeqa/selftest: Add go-vendor.bbclass selftest suite
Date: Wed, 15 Jul 2026 09:20:08 -0600
Message-ID: <20260715152011.3542412-3-john.ripple@keysight.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715152011.3542412-1-john.ripple@keysight.com>
References: <20260715152011.3542412-1-john.ripple@keysight.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: CY5PR22CA0077.namprd22.prod.outlook.com
 (2603:10b6:930:80::29) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|SA1PR17MB5717:EE_
X-MS-Office365-Filtering-Correlation-Id: f736bd8b-ffe5-4aa5-3bd4-08dee284984f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|13003099007|55112099003|22082099003|18002099003|3023799007|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	USVpiTLq6oYZkP9GeX9KWPIbUrpCyrfKV1RMyXQv1BMS04nttY3qMJtHfM48tuC4t7H/glP71b+2tdiAJLbdclZPD7+88u621uJmqbnZcABbLHKyuALMkBAXJTkE93iV3ld6Ahh1cdtbrvt4xyYxoclU01eqhTuEc/++7yEofcU01mtCDQ3P4QCWABtL6ihwkLpDglpmMWj5nsRWykr/AztQHbGaVitoxql0J2Ur5TNAacogzOPfzQvKrc0PIbD8iaKXtlRCBFcBZkdJfX7eva0GH1JgNp/9VU3g7YG5Ien8zVpqTxxGFAZe6atOurkHF0XMzNixjIvfAjsWB1esMFW5mfglGQAc5a4KIFACG6rnZGSKqEE+XQLRyHu7+5G/jPgOiLm9Fg/f7uEKYHRXSp0rYEG8Vh87GVXAIGRiOyyS1DV7FxtXyu0Qu4v4gQAQXpap4NG5O/r/zSzlRb0QB/QvebmKcIs5KK5QlDz+fvsko9Eoec0Idw4x2Lniw6BdH5kJVdTrE5l0YkZAJlOxfsv8GkSp7mgeQLh3V+KjRWLe8c1Kf8+unMzfFnODm3kTR/fZnQ40Y/XgkYczdqQrqutuxrIr97xBf5olNG2dssjytNgOl6Y+CSdo0+4LAFSZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR17MB6130.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(13003099007)(55112099003)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZUE4bkN5dXR4TDVCTk81NGx4bmpiemllQVN1WS9GdU9sWWlhbnF2cWlWT2Rk?=
 =?utf-8?B?VHpMNlVjcUIxUUVGNk1SdFZ6RDdmbmYraSt4UDRYRVNvMFBncDd0QkdHOS90?=
 =?utf-8?B?aHgrYjRvL0xhRXg2YWVNdmFHR0JTdGxMcHpNUVBIWEVjZnl4Q2NnL21HdG9E?=
 =?utf-8?B?MXV3eVJFREpyemhxTmU3cjVtWGVET2c4K3hreHlqbTdySWlzUGhtYVdoMVdh?=
 =?utf-8?B?eEhzMzhCZDhpVFdIQnIzRHNqeFExMGFvdXdPdHljWVFmU3U0bExaWmdZYldV?=
 =?utf-8?B?TGMrTFlNdG00dW40TnA4S2VVTDVKU0tFMDZqM3lhVDZ2N0VrN2lwYnZlVllU?=
 =?utf-8?B?ekFrZDRGRXRqeDQ4V2d3M3lNeHNZRFhQdVEwWWpOWFhsYmp1UktiZVdPV254?=
 =?utf-8?B?TVJKNWVqdXpUWjlYNEVpeTNyRVBCNk56ekNrUXJnbFd6TlZzeGd1bE1NczlB?=
 =?utf-8?B?V2NVaW5JcUhlaGxSa2VLTy9YU0N5cHh4aVU2Nkk3bWN0V3Z1eU5uUlRCdGVJ?=
 =?utf-8?B?a2FjTFA1N0YzaGpweW9PV3JtQTdLMUpLTnNDdllIVFZ3M21aU3EzZzZMTlE5?=
 =?utf-8?B?QkJlWktPUGhzYnVkWGxXcjUzR2pvMkYxRzJmWi9DTkN2eld3ZnBXTHlOYTFD?=
 =?utf-8?B?MTNtZWliaDBCcnZVSnMxU3NIOVVTOUswRlJ2RDRWdjJNMktac2dha2t3QjBr?=
 =?utf-8?B?aGtveGRKNlFrbGFqT1RJdFpoaHp2UGpmQ3RGS2JjUGxscnRHWUhBVDJERmdi?=
 =?utf-8?B?d2FRMHZxVVJvbU1tbThXQ2d5UWxPZzhSVU9FM3l1cUlmS0tncnBLTTJtVk9L?=
 =?utf-8?B?SEhzMlU5ZHN0N2JDeUdBYVJGMHhVWE9UeDRYdTlLTkNhcnhSZ3Jqd0RRR0hx?=
 =?utf-8?B?a1BSQ2JhbzI4SWQ3N2lJMUxPNjh2SlNCRVdET3hhL05IWHc1Y2JUeW9aWU1r?=
 =?utf-8?B?WTJtS2I5M0dTT3F1Z0ZrejNYNVlzaEpvTGljajZ5bTFVbnQ2QndhNjYvNUJG?=
 =?utf-8?B?V2dnMXJldlkya0ZUSHd2bHhBeEpaRkx6M0VIcGYzUDhCMWZMaUlsNnc1NWdh?=
 =?utf-8?B?SXRiTUswQzQxMFY4dDRGYUgrQnVrbDlOamczSGg3NjNpc1ljQms1S1FmSmlz?=
 =?utf-8?B?ZkRWYW1tZVc3TjhTOHExRlBqbGtJdUJNdkxybHMwK2VIV0FCdmpCZjhJRTlI?=
 =?utf-8?B?Tm8rL1FNU0p4TllHRXFibk8wTk56V2dDK2J3azdCUEFZaS9GU1FzYUh3RnlE?=
 =?utf-8?B?VXZmN0pxenlpQXBGUlkxczcySUZxNEI2VmtIekRla014SW1SeGdEdlUwM3kz?=
 =?utf-8?B?NWJVTTlsOGQvTjBDOGVMRG1FUTd2cTNqVXFoZmh0VlJsSG9sTUlWOFQvQnh5?=
 =?utf-8?B?b0QyTW9ycW1JKzIzYWFQdE1NVC9paG55M3lVZUxXM0VEc1RJd2gxZmVvMHdn?=
 =?utf-8?B?QVlnbmd4T0p4b3ozTWxxOC80eGJJeG5US3JOakFjb3gvUVJ4ZWhlOHVrQU1P?=
 =?utf-8?B?VzFUQmg4TWhyMGZCbmVpYnJ2WitNMTA2clZ0aUJRa25RRUtPQmpBeWg4NXYr?=
 =?utf-8?B?UkVHQko3LzV3b3hrZG52Ny9ESEQ2Tk5aUlI5MEVrcnJEck1HdTRHbVVmZFBG?=
 =?utf-8?B?bmVSYlFCa21ma2tua1F1U3EzVVMwQnRuUUdTYUVTaXdobFRGb0U1UEY1blVR?=
 =?utf-8?B?NVQvazlSRlhYUkR5ZkkwMkJJbjZQZ3VVeWpZaytxUjhxRXR5MENJVHpHUmI4?=
 =?utf-8?B?Yy9GNDdVMnZ4Zlp0dmVnY2lkZXMrellTRTV4eUhRNzl3RWNxNDVNcG5MaE1z?=
 =?utf-8?B?TXAwdlJQQVFTUEx3REtES3ZlTXRaZStFWWVYc1VmRFE2eUN5a2xDWHYvbTBI?=
 =?utf-8?B?eDdBQWxXRmhkREVrTTJtWXdhZHozbldsSUl1eGRFRStZZXBjNXFMRk1YT3gr?=
 =?utf-8?B?ZWdpcTg0U3ovVVZrVDlPRkNXeGpJTnV4UTRGTVJtZTlZc2NyREVOemU1bDhT?=
 =?utf-8?B?TkdQYk1oZG5RV0ZpOGhnTmlUNmtyd25YSW9vOEhWN1hucXM5eFlmSHpRNTZI?=
 =?utf-8?B?N3RaTFFJektWcExzSERSL01YNmliSVZ2Mk1YWk9QQ1RHKzhGT1psdVl2RDJu?=
 =?utf-8?B?S2laRzJDRE9weS8xVnUzc3JrdWVBSG10K095eFM5M2FxY0ltQkc3Y3Zza1Rq?=
 =?utf-8?B?cTRVMzhmT0VJdXg5OHN6a3BQQ2k4Y2FDaWJ6c2FYcE5tTDE4alZ3dWJMUzB6?=
 =?utf-8?B?QUxtQ1ZNZmtnY1ovL3BJVGNBOU1yOEw2MW5uSWovZmpCbWRxMzFpKzB2Sk5J?=
 =?utf-8?B?Lzhja0R0OGVvaDNMOEJIZ09MaDdSOFpUajZZUHBQbHZHaW1xNVZEQT09?=
X-Exchange-RoutingPolicyChecked: 
	do+Y3plRxCqpLUrANmdvK7IiNH71bw6Rw9ZPkHSIhHIVjPN1cYiQouD0EvT4xK2e+rq2XyV6vrIfcOPA9REkMIudHb6DX982FBe2VcksPyLqTnBxvD2+2CLwiCg9yHpTggsep+bLsReOoXThKrQDNaKGqMlsZ3f1cUkqp89oft9mAcCW0VH5cWh7MMIgG9DDl0dSN5mq01SZhIMCgkSlCmxeYLeY4hX01ScaClMiv1DD09ThfWj8KeBKCuOcT/g9QHiHfnQ7qsHlgLLbSeUhu/YcjX+FWRVLVNHLydnaP4T/M18DpL2Nla20ya0m8opvR2Ssp0OB5zQPeht5gOVeBw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	NlJRjcejTPUvMqBoiUZ9mduoQFQTJniXFp6glRnQPpkEb71Bfo+zjdqrDCghiVUeguxA01oCdC0GulmxijOY8nbvOAERTgNWEeYk6fSJfSAsANP+o+P+pgsnja9yW307dd0aeBtuak7UFIgGPE2PTf3yaKlRfqXpE1iRLsUNauIUlqWS2ASwuZzT5fq2pbUyw5UU3bFhwpQaiHOQpDwT2dadmps2p7EjDjtKxAEsonSvRU9dFPoeZNACl/nubCAP6cJv1Nez2vnUkbdrrcJ0J3gjGOlPewLpVEWnqBqu7xjab5wXdVpfbUm9XSl0iTOlLlO0xgQObWo3bV1HRsh++cHnpkVo3pfMDvsSwjrRMZVC3QjQY1ccCXpY1fY9WWjU2a/ZAOjgntnsaInk0LT0kKQtMe3Wgx9VEDtU+yl4mHcX2gDHGNacsW+6iM/mfglSa7Kurki0h723cIzKD4Oi0+21cBIZ/BCPq1PKVfOXLT7zNHek2+55TczCtYJDkauKphhbMtzZPc9/rk6Jxob8jd8hRsyVEApc5xWpUFnOb80WM4VggnTCDpLbgfFQJEZI5Kg99VyCne92oBApZ9g+PvSp0XYW/XOOnQTes7mU/PMvB5etEyuLdcBvAzOQxyuP
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f736bd8b-ffe5-4aa5-3bd4-08dee284984f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 15:20:25.4053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JsT3G7bKjSYGOplgS3Jp+m83LiDLUFx4IwS8wazc/DIWP+bQ0qo8nmk3711XBmp2ar5gfu+C73CJqG++dYjdpE9dBE8cz+Er2n9YxLTec0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR17MB5717
X-Proofpoint-ORIG-GUID: fwFtTlQ94mtSRgknl4vsKs3nefI1vYss
X-Proofpoint-GUID: fwFtTlQ94mtSRgknl4vsKs3nefI1vYss
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE1MiBTYWx0ZWRfX2ab1hGMsWKvz
 iosxYLD8Xg9P/NlGC1qpmVDSLtdWZWhb7Uo0Dx4VDUV7fxcSHYLV9eL2LY+j78RiMta5fT3jeyg
 BIzsFifb/h2OcO3jMAW57cl7XyRbhb8ZYxLOvKdi3ywdQLsEoGrA1JbKDupBsSdiDxr6qigN5nR
 83DeWn/udQSznCVZ2MMY2Ul705JAn3iNdb6R9//1L+V5avD4zxTPJ73vc0X/YRfCVd+cykqCARZ
 ua3WW9fXuJT2guPfzQIi9q9tWcj+HHKEyo2VCXiMX4MK6l4PG8G0L5tpXTXQZXo70CFq+GLoh+B
 8vK58oAXE6v8kkRSV0D6zaSrnGKMMUssn381hjHRaF5bS9A9LYJXgx/gmcSP41YTNHBa8YP43/5
 tSGYS04kTS5fKymN1TR+qBiwBEa5/PilpHsZ+KYtyxLvcBAxpx/m2VmHsAhjlOEJin1NMbmCiUR
 iha6f7RK2UuYypPwPug==
X-Authority-Analysis: v=2.4 cv=DKa/JSNb c=1 sm=1 tr=0 ts=6a57a53f cx=c_pps
 a=air8cPz1/yJpzemNVwtxUg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=vu2TTH8h0NUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FLoIbiw2ZNY34kqd41oa:22 a=mOSSRekXLlsqcmK058qe:22
 a=F6MVbVVLAAAA:8 a=NEAV23lmAAAA:8 a=A1X0JdhQAAAA:8 a=iGHA9ds3AAAA:8
 a=eREoye4mD_A32vJ-KFYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6mxfPxaA-CAxv1z-Kq-J:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE1MiBTYWx0ZWRfX1KJ+E9FgfjT5
 V0GqOICso3HYhNkWVlPDpihZzpcFH/+6Liuk3s0jk5EOvdC/dVqVWaK4/+8NiIH7LdgTn+9UomS
 5XmPNmiN7SdT4egvU0F0+1cOS/PDTPQYbkEpSiBjBpBZjMJLRXIV
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11847
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150152
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-003cac01.pphosted.com id 66FDeQYX136804
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 15:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240978

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

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
 .../recipes-test/govendor/files/modules.txt   |   6 +
 .../govendor/go-vendor-src-uri_1.0.bb         |  13 ++
 .../govendor/govendor-real-test_1.0.bb        |  20 +++
 meta/lib/oeqa/selftest/cases/govendor.py      | 169 ++++++++++++++++++
 4 files changed, 208 insertions(+)
 create mode 100644 meta-selftest/recipes-test/govendor/files/modules.txt
 create mode 100644 meta-selftest/recipes-test/govendor/go-vendor-src-uri=
_1.0.bb
 create mode 100644 meta-selftest/recipes-test/govendor/govendor-real-tes=
t_1.0.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/govendor.py

diff --git a/meta-selftest/recipes-test/govendor/files/modules.txt b/meta=
-selftest/recipes-test/govendor/files/modules.txt
new file mode 100644
index 0000000000..f958aa80af
--- /dev/null
+++ b/meta-selftest/recipes-test/govendor/files/modules.txt
@@ -0,0 +1,6 @@
+# github.com/godbus/dbus/v5 v5.1.0
+## explicit; go 1.18
+github.com/godbus/dbus/v5
+# github.com/matryer/is v1.4.1 =3D> ./is
+## explicit; go 1.14
+github.com/matryer/is
diff --git a/meta-selftest/recipes-test/govendor/go-vendor-src-uri_1.0.bb=
 b/meta-selftest/recipes-test/govendor/go-vendor-src-uri_1.0.bb
new file mode 100644
index 0000000000..9623989f83
--- /dev/null
+++ b/meta-selftest/recipes-test/govendor/go-vendor-src-uri_1.0.bb
@@ -0,0 +1,13 @@
+SUMMARY =3D "Selftest fixture: go_src_uri parameter variants"
+LICENSE =3D "CLOSED"
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
index 0000000000..a8741a872f
--- /dev/null
+++ b/meta-selftest/recipes-test/govendor/govendor-real-test_1.0.bb
@@ -0,0 +1,20 @@
+SUMMARY =3D "go-vendor integration test: recipetool-go-test"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=3D4e3933dd47af=
bf115e484d11385fb3bd"
+
+inherit go-vendor
+
+GO_IMPORT =3D "git.yoctoproject.org/recipetool-go-test"
+
+# modules.txt for recipetool-go-test at SRCREV:
+#   - github.com/godbus/dbus/v5 v5.1.0  (external, fetched via go_src_ur=
i)
+#   - github.com/matryer/is v1.4.1       (local replacement =3D> ./is)
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
index 0000000000..65ca8a1145
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/govendor.py
@@ -0,0 +1,169 @@
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

