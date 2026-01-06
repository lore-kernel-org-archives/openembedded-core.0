Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CEDCEFD11
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 21:30:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.592.1767735036195429080
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 13:30:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=jNWfpcJ0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5466c5b62e=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606GKkaR2850625
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Jan 2026 21:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=H3veNyrxzwfFkKGXGpEiRG
	PCz5fwFRdI3394zamfHJI=; b=jNWfpcJ01j697ycfCtKsJBNwBgllXG1+rX1CT4
	nRP/nEyELIGQVWVA+HwGzjGX7jAd53X6xnwrSIZpknmQBhZmVvDdzeLa24WV1oxA
	+P9Tr4WU+wv195xKBlRzb9SxqTD98fYLUpnPRfS6Kmra+CAjuT61YivxyShK83wP
	aQ0FtK9IyiMRCd1BR6UznirzvdlqI4kHKr3mvNxaibTsgFEW53j3iVUxvpMeEKyp
	66p6N0b7zbDFPlkjBLZSM+78UFs7/lGMeNwKnibJm8UNb8zSiUFCf+Px3/NsXypj
	exSPYuD9dFGTZyYZ3CMAnnql01Gs9VRmQPSI56zEPc29wqlw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012065.outbound.protection.outlook.com [52.101.48.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4beravbcbj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 21:30:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=avrJ2uw9imYUc08ADfhi/nAl974fIS1qt2u4+VfQHpB01QkCnVtxC6fGMsXqI3sE1eGQootgUL5oA5rpo5qWYeEP/fSKUHOmHolDWRkabCYMERPfvw3N3DYktGRx7MIve8pGALuktuh3EfxYOOSFhcvl5g8xY9ARuoOHuz6QvySy0F23nU4JAMWmdSdhscImT1ALM/ik9aRFgWlCpDDeUSi3SWOclPy13x56hhBiXde3wS/A0I4Gu3e9GsRfhfewHmA3y+qH7mXestcM+B7GNw3dZTuH0uo1nhy+zsXNcruytY/yZhUCDlhqt2a7EWluQNyTBK4nLBigZfqN61/iHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3veNyrxzwfFkKGXGpEiRGPCz5fwFRdI3394zamfHJI=;
 b=mm1fU3yOYQrORqfRlPybIWjeF1c8qymsfP3ikSBY4UY1rX/i1N5rZnHOJOdgUBnZFktlFHiVhxFmcNzdKcDjCREZqiqTG16I9fneD9R9PDkUqdzWl+7lYTii26pwaUiim4ekEnqxy+5O0cASFkrXILzZbs5J+j+/gKyBkPEU5vzVQnWsTUAGO0zS3R2Ra8CwJGUvnsHn/mene3B60MevuSmuJNRBRopZbse/l6o32iZAf9bgF0n9ulM9plpXCFu2OqelLZ1FJUYGUh/LXHohHPwXrLhhEZYSlOFZsWJuLaUfXo8mp7xv4JhuC6NKlWGGwxTE5z+fShPVRVB1YFVzIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA0PR11MB4527.namprd11.prod.outlook.com (2603:10b6:806:72::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 21:30:32 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 21:30:31 +0000
Content-Type: multipart/alternative;
 boundary="------------K2QfKdawasQTUE07AppWIJ0I"
Message-ID: <b7923b2d-98df-4a16-b8a0-8d99035cedc5@windriver.com>
Date: Tue, 6 Jan 2026 16:30:25 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][whinlatter 18/18] populate_sdk_ext: keep SDK_TARGETS so
 SPDX/SBOM tasks remain in locked sigs
To: steve@sakoman.com, openembedded-core@lists.openembedded.org,
        Yoann Congal <yoann.congal@smile.fr>,
        "Jayasurya, Maganuru" <maganuru.jayasurya@windriver.com>
References: <cover.1766352840.git.steve@sakoman.com>
 <9964fa3da2fa1e7243fba1a826e59f7bb1813706.1766352840.git.steve@sakoman.com>
Content-Language: en-CA
Cc: paul@pbarker.dev, Joshua Watt <JPEW.hacker@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <9964fa3da2fa1e7243fba1a826e59f7bb1813706.1766352840.git.steve@sakoman.com>
X-ClientProxiedBy: ZR0P278CA0125.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::22) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA0PR11MB4527:EE_
X-MS-Office365-Filtering-Correlation-Id: c07c664a-7dcd-44e5-a7e1-08de4d6ad1c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|4022899009|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?LzlTMitlOTNWZmhYVEVyTytMMVZoTE10elV1YVdha3dBVnU4RG9ycDZBSXUw?=
 =?utf-8?B?SXFiMlpJVXltT1JhK3NBcW1uQTZwSms5eUtxME1oS1h2RmtkUTdjQ2NRUmpC?=
 =?utf-8?B?Qlc2RGFPbGZCMlNlLytvSkJlL0x4c2ZaLzYxYXVaK3BlczZWNGtMdFJNdmYx?=
 =?utf-8?B?T2dMY1l1S2ZrSlBlM1dkTnNKRndUTVNsWVdGR1JESis3RDZHNk1MNzNVc25x?=
 =?utf-8?B?OWVTNkw0eXNYS1U5aWtqM0dHYXdmQ2lKU0JWZ0FnWU1jWUYvaFVNVy9BeTlG?=
 =?utf-8?B?Yyt2LzZ2aHI1ditxamtFQ3h4eEpvUm5QWUhpQlVQVDZ4U29pRE5MczdONFY5?=
 =?utf-8?B?UFo3RXRjRWxRRHJkQTNhZlFhT3h0NGxLSmltNlI4WWN4VnBMZk5pYXNFS3dp?=
 =?utf-8?B?a0dhUHlpaEpHZUpEN2ZFQ1pXOG1Gd01yRENBRHVlOVlMaDF3eUt4Ry94NU54?=
 =?utf-8?B?anFHVTVsclRUZVBzZGF6OXpnaUI1dEZ0N01tZmFkeVVqRDNLdjFqc1l0d1l2?=
 =?utf-8?B?QlJhUktHd0RvQWxRbHVLdWZYb1dzLzNBUFVLN1gxVWxpSm9FcitzRFQyZnoz?=
 =?utf-8?B?SlZrQzFhS1Vabmhacnc5M2Z1dWtDeXl1ZnJTM1JBKzhFVDc3T2lxSWxYNWpN?=
 =?utf-8?B?OXQ5YUlZQUQrVXAyMFhBRjcrdzI5aE5XY0hWYkQzSmk2NnR0TjlwS0RtYk1S?=
 =?utf-8?B?MDFKMmdMc1IxdTFWUlZiclNhK0h0WUNidk92UmhyREwvdHVmVVR6UURObTZo?=
 =?utf-8?B?Ym9SaHFiRTUyQUFUZitjZEtCWDJtZDBmYVdjUXZNL0Q1ZHd1ZnZjSnd0Sy9J?=
 =?utf-8?B?Y1JtbkNUczlkNElyd1MrV2VPcjlUb1pmak9oaTNLUmRoTzdwdTM0em42c3VO?=
 =?utf-8?B?U3huY2ZlMUxOYVhWK3Z2TXAwaU5yczduWFI4M2JUdTB3U0FYZkhoUHIvMkUr?=
 =?utf-8?B?cnNnaW5nNDZTd3lwOHZqb3lRWjR6SGROSURTZEVvWlNCRlBGQjA0dlJUZytJ?=
 =?utf-8?B?MmJhUEE2WEVWUHVLZ2V0cEdkZitnd0hSRGFST1E1TGZjdURBcEhOTjNuN29D?=
 =?utf-8?B?bUNMM1E4SEVsVmxWeGl3T0E1VDZHMUhSbzJ0N295NkRGZ1dtSm5LOE5BZTJa?=
 =?utf-8?B?NTd5a21YRURVVFFZV0VjTnVvUFEwZWVTWWptTVJocWVsWitENVlZQWRMQjJy?=
 =?utf-8?B?TzRkMHE0NE9sTGl1aDNNTHlYOTJpcWVLbkRMVTQyZENRelhoNy9sTmYvZzFK?=
 =?utf-8?B?R1BBcHNxZG5xc2RvQ3RBZ2Z5Y2x4Qjh4VVV4c1Z1ci96TENpMDhBWFdwa09j?=
 =?utf-8?B?ejljRkxnUzJoSWtqNnJZTTVPZTdmeG1hNHFnd3VjR0dVaVFKZ3NZcjJzLzFX?=
 =?utf-8?B?UDV2V2l1L3FpNkVLT2s4NHRGUkw1U1k4UGx2RkZZaWJOWnBpdGRnQ2xvUktD?=
 =?utf-8?B?dzh4L1B5QjZ4Y0NGMlZwOWFCNWU2b1dNY2FRVnE2OHlZSDJTdVRxTC81UXpR?=
 =?utf-8?B?VXZxclkra25paStlZDlXdTVWbDBaY0J4d1lmWEpqSXYxYXpCeHdQdmFaazhW?=
 =?utf-8?B?SDduQVM0aW9ZdGxRVVBOZmdqeHZVdVRnNzRwYnZQZ1paRUJXTmYzZWlUU0lX?=
 =?utf-8?B?ZjdidTV5TmtDUnhFSDhQMEVaWDlyUkZNbnhLemRWVWN4N0t4K1JYT0dPV09V?=
 =?utf-8?B?bFJ0WTZ4eUhpTGpvcGJQVEVsU1JjMHNRTUtNT2poekw2R0dVZXFsTWo3VXkr?=
 =?utf-8?B?MkloSEM1RVNmajFRajN1dVJGWEJNWmE4V0E5RkRDTnZRRDhlazhjSC9GSDcz?=
 =?utf-8?B?YVRyb3duRXViVWxnUTZ4NFBDNE82YnBDUkNxd3dVSGtQSzNmaEdaNzVlRHpl?=
 =?utf-8?B?dHJ4MitaSTZoQW82MjAzUUZEdEJ4YllWanBMVFU5VVhpTjRmWUdJT2gvbmp6?=
 =?utf-8?B?TGV1RGFkN21DNmdlY3NhMGpzalUweGtNN0pGWno3aytkR2dKSXJCYUlWUlp6?=
 =?utf-8?B?WENBZnNENG9RPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4022899009)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZVZlODEyUWFUemNLWmgrRGY1L2IzRTlvV2JJaVgrT2lCNUdMc1lZTHprdnY2?=
 =?utf-8?B?ZTNOdnV5M3Q2RVJ5SWZBNlcyYnF4NlpZTVY0bllNWWQ2ZHM5Z2dVY3FMK2Zi?=
 =?utf-8?B?dUxSajBoTXd2UW1rOGdEM2E0NnlQc2JFd0lWTGtjVzYrQzNPczFJN2ZKZFFC?=
 =?utf-8?B?MTkvQVd6amw3WjRmVlZFbG5XbUV4VEIydzZhc3FVMnVJb0pES05tTkoxTlFa?=
 =?utf-8?B?bzliY0svajNIMzMwUjlBT29FVnk0ZjlEWkh0aFp1c0RvN1N3VmYvNExzcHht?=
 =?utf-8?B?U2xyd282bysxSkdQaEpldnAzN1ZGNHdXVTdFMWNEK3M3RXhqMlVueUpaamxX?=
 =?utf-8?B?KzVTVHN4U25mRGk2c2JPZ1pESkdyOHJKd3l6UGU4d1JYN1JwWjFXR2REV2lK?=
 =?utf-8?B?bHd6bk1QWndKc214QXUzd3JKMHlVSlJtbmVIQ01qMk1OYXhSLzVCb3gwcDhT?=
 =?utf-8?B?SENJRzlDWnJHMWcwY05xMFFHaWIxcmQyeG1YZm1XS3hUeityeU9UWnZtWUpY?=
 =?utf-8?B?bWpoUTh4cnRZU21jWlA4c1Fpb1JNUm9UZFgrclR2dTBWNnM5MldQV05KanN3?=
 =?utf-8?B?ekVzZVgraDNFWmJ2UkFvQWQ4WUlXdk44N3FBaTFUUHd6ejBEYlNlS3R6MjZN?=
 =?utf-8?B?MXZ0M1BqN3Mzelc5VElhL3lXaU9FT2o1VDZVSXVsSm5YUUYyaVZ6aWdheG9m?=
 =?utf-8?B?cVpKU1pudFZJRE5XQkpoMXNSL3JwVTlJYWxPdzR0V1ZRMWVIeGVRYnlBWDBG?=
 =?utf-8?B?YjRoMVJIdXdycjVYNTM4anYzNjNvalMrV1pIV1V3VmVVeUplOFA5Mm1kYlFv?=
 =?utf-8?B?dzlnOEhPZ0JRcnl6UWk2ZmNMdkhiNlJ0b2dnMXFqSUFjLzdVU1gyWXZHaDFH?=
 =?utf-8?B?STFacFdpMjZITWdtL05SQjYwTDRxbUhqV09wbm8wNFMyOTlaYkZpOW5ZZFZ4?=
 =?utf-8?B?T2dISlBNNlNxN050N3BibTdzN3RIeHRDUDR1bkUrb1JzQmUvTTk5U3FFSXgx?=
 =?utf-8?B?Y0RCbkVseUV2TWw1ekNLT0d5NUhFVzJCUzlGd2c1czN6Um5meVBsVHA5Y2pW?=
 =?utf-8?B?bzBpNE9NbDBqNnEwNDFXMTlPL2ZxZGczRk1IWmEwZGZpZFRBc0tSS0lIWHJw?=
 =?utf-8?B?OCt1ZTdBWms2bks0NVpFc2h6eW1OU2JWejY4eXRuemV4NS9zaWRYTUhGd0Jq?=
 =?utf-8?B?VkZGdU9oSVpManBDZnY4bko5L29WMjR4Q3ZoNnVLdjJvMnFyMGpDY3BxdVpI?=
 =?utf-8?B?bjZsUXI5OUxZeUp5VmxscHYrbUMydFZNaVlXRzZCRnMzVU9vd1BrL0lVblAz?=
 =?utf-8?B?bmw0L2tUS1pKZ01ZVjMwcjRuL0lFQnNBZG9BWTBSbklOK3A0bVVuRVhCbEk1?=
 =?utf-8?B?REMycmpRMU40MkNLb1FCYkFiMkVZdW0yTExlZnd6NW9MZElUM1VvNkFJOXo2?=
 =?utf-8?B?K2Z2LytubDRFZXVYcGFidmlTbG5kMFlNYVNGaG1zU0RMd2JDcUxJZ2NHeVE5?=
 =?utf-8?B?VmtUYnh6a3ZVSSt0Mlg5aXJJVnNNQ0JDdkk2d1hkU0ZuMmt5NHR3dGt2dkNr?=
 =?utf-8?B?eGt2bEVjb3Q2MVJJWDR2L3lJcDBDVEtkSkpidHhUTjR3aGpUYmVBcm5NY2Z3?=
 =?utf-8?B?RnFuQmdtQ0hUakE3djNKNm1mY2lRdm5JcDlZSmdIbG5pTnZPMUFpZ3dVK2Jm?=
 =?utf-8?B?ckRtOVZwbGVBZUhJa1BXQjdxNzl1VG96STlLenJWUzByTmJscGhrVTNBMXRD?=
 =?utf-8?B?THl1aDMrSWFqWXVQODB2MThpWVNrNDVKU1VxRjkzcmgxRTNVMWg3YlBiOHJV?=
 =?utf-8?B?OGxsM2FaWHJmb1IwWUZqRjhBeHRPQmpTVWtpc2JMZ0x4aTA0cllncllEa0lS?=
 =?utf-8?B?aXVMaWlpbVBveTUyRWF2VzY5NnorRE5DZFYzUWErbHRpYjFZRHdEampqaU1i?=
 =?utf-8?B?U0p6eXgxMnpuVlh4VHRiMzRSbm5wS2tsT0c2eWgrWnpJN1ZHN3lwVC9Ld2lK?=
 =?utf-8?B?QmtyV1FNemxITGlhMXQrajU4akUzdThwM3pYNkxjdlVSNldYU0xiaVdUUktV?=
 =?utf-8?B?M3dyb3ZybklBamFJTDdrbUNuMzBXSkFjMEZmay9qYlVMV0JEN2E5c2tBMEsz?=
 =?utf-8?B?anRxU1Z5ZVVCUitsdGJ4RndkejR1S1pFMGkwN1plSWFDRDdTa0NkZU5sWTNF?=
 =?utf-8?B?ZjNvM0NzT21oNEVFL2lxMHN2STFFOE9DdTI5TTRnU21tTVJnUjdtMmlheXgv?=
 =?utf-8?B?b05SbFc5YWpqa1psR3RXWlVRQStkWk9kQkxxUEV2R0JmZUZwemlqWmJOQW9X?=
 =?utf-8?B?TW8rMGhkV3hYaUprU0tsWVR4NWN5RTY0eVV6NXllamdrblp2QmVtbFQ5cmtU?=
 =?utf-8?Q?xxula41SxTyXnVw8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c07c664a-7dcd-44e5-a7e1-08de4d6ad1c5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 21:30:31.7440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2JEL+EPRQO/H4NBHpGE7eQXDF4S8vrkC4QQMdiohTu0g+Vtx3wftqde/JgV802M8jvr73M81by2LtiKU8jT9bksM8ffRduwiamFDWDwz7rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4527
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE4NiBTYWx0ZWRfXwrIcAFipdyA3
 fl9bc3eRanFHQa+x644xurxMeWUfWNT/DSob3SdpmGje4diyvE2iI1sE5OtmY3bALyvwDR9yFxb
 sX9Z0GcebGsbnXhb/kb4ukVZC53fYzaaKmlpPwQ9XkIf6Lm4PpL1YhHpevkPqmFaCucOUO22Diw
 zpaOvOzpbeAFUpG49FxODv4rQlyqA5CYNXp0oGo0HzZsyf3Ow7VBe5K/hzOeZq90r0M5rWh2N51
 C9jfswsgDBZ1+nL/1ZAcyA3ijZJFTov0pOqKw9ldD8ede8KQW4+ttBPyBKF3I3QNIi1ClhugosC
 K0FFTqq5CySUiXN8FHosMD2Rux4gHOVx9mAeCKAknCd1bBnvH9flEeHmB6YDUz5vrttsHYaM4Xr
 nnI9oGUvN2xrulEdBBqidjvzrUd4aMwfPgueuS+l2I7SN85Pl9OczAwcvh5FAP+TYgUqQ27vbEY
 7IhS7Aa13BniYQoZEYA==
X-Proofpoint-GUID: hKObxBFkvopxlKXkWeEi1_LaSUKFIm9w
X-Proofpoint-ORIG-GUID: gcqiRUyuQ1GmwerDKIRe11W7SSj43fx3
X-Authority-Analysis: v=2.4 cv=PZjyRyhd c=1 sm=1 tr=0 ts=695d7efb cx=c_pps
 a=W8nThqPTbj8xD7CpgneC0w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8
 a=_enOPnqeAAAA:8 a=aDCK-iaexb0rUNMM3FsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tCVwEWD9ij-wgjbpsDYA:9 a=3bff1I2brWyCQvk6:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060186
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 21:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228933

--------------K2QfKdawasQTUE07AppWIJ0I
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 606GKkaR2850625

On 2025-12-21 4:37 p.m., Steve Sakoman via lists.openembedded.org wrote:
> From: Jayasurya Maganuru<Maganuru.Jayasurya@windriver.com>
>
> Fixes [YOCTO #15853]

Steve, Yoann, and others,

This commit as well as 17/18 made it into whinlatter before master.
Was that intentional ?

=E2=9D=AF git log=C2=A0=C2=A0 --oneline origin/whinlatter=C2=A0 ^master=20
meta/classes-recipe/populate_sdk_ext.bbclass
9964fa3da2 (origin/whinlatter) populate_sdk_ext: keep SDK_TARGETS so=20
SPDX/SBOM tasks remain in locked sigs

=E2=9D=AF git log=C2=A0=C2=A0 --oneline origin/whinlatter=C2=A0 ^master
9964fa3da2 (origin/whinlatter) populate_sdk_ext: keep SDK_TARGETS so=20
SPDX/SBOM tasks remain in locked sigs
3f57280caa create-spdx-image-3.0: Image SPDX/SBOM tasks are retained for=20
eSDK installation
7f02b3f811 cve-update: Avoid NFS caching issues

The patches has been sitting in master-next for a while since people
have some concerns about them, IIRC.

What do we do now, revert ?


Apologies for missing the review deadline.
Maybe next year, there should be a longer merge freeze around Xmas time
so that there's sufficient review.

../Randy



> The filtering in populate_sdk_ext.bbclass was removing all image target=
s from
> the locked signatures, including the main SDK images (SDK_TARGETS). As =
a
> result, their tasks including the image SPDX/SBOM tasks were not added =
to
> locked-sigs.inc.
>
> Without these entries, the eSDK lacked the necessary sstate, and the in=
staller
> attempted to run the missing tasks during installation, leading to unex=
pected
> task execution errors.
>
> This patch keeps SDK_TARGETS (and their multilib variants) in the locke=
d
> signatures so their SPDX/SBOM tasks are included. With those tasks in t=
he
> sstate cache, the eSDK installs cleanly without needing to re-run anyth=
ing.
>
> Signed-off-by: Jayasurya Maganuru<Maganuru.Jayasurya@windriver.com>
> Signed-off-by: Mathieu Dubois-Briand<mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
> (cherry picked from commit 920c5de570ec575a9eaccb105461394d9fa0f1db)
> Signed-off-by: Steve Sakoman<steve@sakoman.com>
> ---
>   meta/classes-recipe/populate_sdk_ext.bbclass | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classe=
s-recipe/populate_sdk_ext.bbclass
> index 2859320ddf..2838ca1a03 100644
> --- a/meta/classes-recipe/populate_sdk_ext.bbclass
> +++ b/meta/classes-recipe/populate_sdk_ext.bbclass
> @@ -460,6 +460,15 @@ def prepare_locked_cache(d, baseoutpath, derivativ=
e, conf_initpath):
>  =20
>       # Filter the locked signatures file to just the sstate tasks we a=
re interested in
>       excluded_targets =3D get_sdk_install_targets(d, images_only=3DTru=
e)
> +    sdk_targets =3D d.getVar('SDK_TARGETS')
> +    ext_sdk_target_set =3D set(multilib_pkg_extend(d, sdk_targets).spl=
it())
> +    excluded_set =3D set(excluded_targets.split())
> +
> +    # Ensure SDK_TARGETS and their image SPDX/SBOM tasks are included =
in the locked signatures,
> +    # as they are required during eSDK installation.
> +    filtered_excluded_set =3D excluded_set - ext_sdk_target_set
> +    excluded_targets =3D ' '.join(filtered_excluded_set)
> +
>       sigfile =3D d.getVar('WORKDIR') + '/locked-sigs.inc'
>       lockedsigs_pruned =3D baseoutpath + '/conf/locked-sigs.inc'
>       #nativesdk-only sigfile to merge into locked-sigs.inc
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228276):https://lists.openembedded.org/g/openembedd=
ed-core/message/228276
> Mute This Topic:https://lists.openembedded.org/mt/116893601/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------K2QfKdawasQTUE07AppWIJ0I
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 606GKkaR2850625

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-12-21 4:37 p.m., Steve Sakoman
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:9964fa3da2fa1e7243fba1a826e59f7=
bb1813706.1766352840.git.steve@sakoman.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Jayasurya Maganuru <a =
class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Maganuru.Jayasurya@windriv=
er.com">&lt;Maganuru.Jayasurya@windriver.com&gt;</a>

Fixes [YOCTO #15853]
</pre>
    </blockquote>
    <p>Steve, Yoann, and others,<br>
      <br>
      This commit as well as 17/18 made it into whinlatter before
      master. <br>
      Was that intentional ?</p>
    <p>=E2=9D=AF git log&nbsp;&nbsp; --oneline origin/whinlatter&nbsp; ^m=
aster
      meta/classes-recipe/populate_sdk_ext.bbclass <br>
      9964fa3da2 (origin/whinlatter) populate_sdk_ext: keep SDK_TARGETS
      so SPDX/SBOM tasks remain in locked sigs<br>
    </p>
    <p>=E2=9D=AF git log&nbsp;&nbsp; --oneline origin/whinlatter&nbsp; ^m=
aster <br>
      9964fa3da2 (origin/whinlatter) populate_sdk_ext: keep SDK_TARGETS
      so SPDX/SBOM tasks remain in locked sigs<br>
      3f57280caa create-spdx-image-3.0: Image SPDX/SBOM tasks are
      retained for eSDK installation<br>
      7f02b3f811 cve-update: Avoid NFS caching issues<br>
      <br>
    </p>
    <p>The patches has been sitting in master-next for a while since
      people<br>
      have some concerns about them, IIRC.<br>
      <br>
      What do we do now, revert ?<br>
      <br>
      <br>
      Apologies for missing the review deadline.<br>
      Maybe next year, there should be a longer merge freeze around Xmas
      time<br>
      so that there's sufficient review.<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:9964fa3da2fa1e7243fba1a826e59f7=
bb1813706.1766352840.git.steve@sakoman.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
The filtering in populate_sdk_ext.bbclass was removing all image targets =
from
the locked signatures, including the main SDK images (SDK_TARGETS). As a
result, their tasks including the image SPDX/SBOM tasks were not added to
locked-sigs.inc.

Without these entries, the eSDK lacked the necessary sstate, and the inst=
aller
attempted to run the missing tasks during installation, leading to unexpe=
cted
task execution errors.

This patch keeps SDK_TARGETS (and their multilib variants) in the locked
signatures so their SPDX/SBOM tasks are included. With those tasks in the
sstate cache, the eSDK installs cleanly without needing to re-run anythin=
g.

Signed-off-by: Jayasurya Maganuru <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:Maganuru.Jayasurya@windriver.com">&lt;Maganuru.Jayasurya@windr=
iver.com&gt;</a>
Signed-off-by: Mathieu Dubois-Briand <a class=3D"moz-txt-link-rfc2396E" h=
ref=3D"mailto:mathieu.dubois-briand@bootlin.com">&lt;mathieu.dubois-brian=
d@bootlin.com&gt;</a>
Signed-off-by: Richard Purdie <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfounda=
tion.org&gt;</a>
(cherry picked from commit 920c5de570ec575a9eaccb105461394d9fa0f1db)
Signed-off-by: Steve Sakoman <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:steve@sakoman.com">&lt;steve@sakoman.com&gt;</a>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-=
recipe/populate_sdk_ext.bbclass
index 2859320ddf..2838ca1a03 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -460,6 +460,15 @@ def prepare_locked_cache(d, baseoutpath, derivative,=
 conf_initpath):
=20
     # Filter the locked signatures file to just the sstate tasks we are =
interested in
     excluded_targets =3D get_sdk_install_targets(d, images_only=3DTrue)
+    sdk_targets =3D d.getVar('SDK_TARGETS')
+    ext_sdk_target_set =3D set(multilib_pkg_extend(d, sdk_targets).split=
())
+    excluded_set =3D set(excluded_targets.split())
+
+    # Ensure SDK_TARGETS and their image SPDX/SBOM tasks are included in=
 the locked signatures,
+    # as they are required during eSDK installation.
+    filtered_excluded_set =3D excluded_set - ext_sdk_target_set
+    excluded_targets =3D ' '.join(filtered_excluded_set)
+
     sigfile =3D d.getVar('WORKDIR') + '/locked-sigs.inc'
     lockedsigs_pruned =3D baseoutpath + '/conf/locked-sigs.inc'
     #nativesdk-only sigfile to merge into locked-sigs.inc
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#228276): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/228276">https:/=
/lists.openembedded.org/g/openembedded-core/message/228276</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/116893601/3616765">https://lists.openembedded.org/mt=
/116893601/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------K2QfKdawasQTUE07AppWIJ0I--

