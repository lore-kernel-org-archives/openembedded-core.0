Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44CD0CAC589
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 08:19:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7393.1757405956866534642
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 01:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oKJ/WE9U;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13475abaea=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5895U3dK2441311
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Sep 2025 01:19:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=IHHS9fUb9x1htyPpsWL1lj
	sHEXVAsluN14lCqKRmxFw=; b=oKJ/WE9UivKaj4yXUxBKazGcW/lvM1JJzJJQSB
	rH9t9O2Lx75cO0rCKGvzbQDij00s/ak7bGJGY7j48nGgQFLcXg36kEdsRTIMg/aR
	lSNmc24i1wy1IJGL83RlHYaoZ7H1iWkb4cL49vXcpzkEYtx0Oag2rFty8RQH5K5F
	Y0qtmScZYeFFOwPhpad26wi3n0bexES89+t8mJmlxpatEeg7ma9GspjPRpgpjD18
	7uofNfIpAJnxFWIJWs/kmdVrgcO2/RkTjrGk6OZLb0uiu4PZkCGHRI6cIQSjGMw3
	gK18l/2s7b4487HTI9HPcXP3KTc2l486bINnawcO1RB7CCOA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 490g80aj2p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 01:19:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mH8JcTPn/shbAiM20hYJLNHz15ODCTGBSm2Khov1ySBKDx32BnQ0lCVfpgncR62OCYDBCS0Wv71NiM1eRFqUT5KbjIdZTGODucp8QUuFu5ISvevYHSIrYpHndgRiRxcmkFEoxgHCg8xRX+7yWMFwwpARf5kKky6Qv56b/1xn1XrqhquWkin7Ij+TkKWNgQpAkC3VwS7Oi3q+zLriJXl3qe7mdMxp2JNlO3cVQQQYQf6keLN+3AFB0xkrjMAGlfY1CZbd8SDx2kw3dhDM1d/QyqK/3UHaTEd1eaqygC64m5zEG6WBuO07qO0kOu4igIrMwQjjN1E67HPIZkTKZ5HyiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHHS9fUb9x1htyPpsWL1ljsHEXVAsluN14lCqKRmxFw=;
 b=E6sJLvSibXHjKLg7pHdQ3mwS1dtWwkHVVMQc65nyhHA6zxxWKSuaM7ID3HiEkFIR0GV9dj07QGtzJdi9XWEauB4y+DaLxoN1x8IIVk4Jgru7lyTKEjoxzSalMuwf10P75EIHS8cLWmsBRUVRSUgzW7mzb4YjTStUHmcbsc2gTQ8y9qdAgfG1FEP4vg7PIuzwkgPPMs1UlvFh200jQGqqamOrXMa9Q0jJblT+SEhAwmHKo5O8ghMUWVGShGEV44srn+NDfBPlwXN+jAHD5DmQiDLqBYTiLKLfoSE4/o/nhRVR1+pDe1wcZp5Le6Y2CGHifYc++4QgUC2c5DVLwpjqCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS0PR11MB6494.namprd11.prod.outlook.com (2603:10b6:8:c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 08:19:13 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.9094.016; Tue, 9 Sep 2025
 08:19:13 +0000
Content-Type: multipart/alternative;
 boundary="------------IjbcKXwMz6foP07T6kJwgjOh"
Message-ID: <454f5ba1-09a2-456c-8df8-0a0fe441f6cf@windriver.com>
Date: Tue, 9 Sep 2025 13:49:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Drop rust-llvm and use clang instead
To: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "Kokkonda, Sundeep" <sundeep.kokkonda@windriver.com>,
        "Dora, Sunil Kumar" <sunilkumar.dora@windriver.com>
References: <29f1bfef-97ac-44bb-b2de-63661a38e814@windriver.com>
 <CANNYZj99rO9YpEUe1_sGBFXiaOA0dgoRMRK_AwgPKkaQWCnhfA@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CANNYZj99rO9YpEUe1_sGBFXiaOA0dgoRMRK_AwgPKkaQWCnhfA@mail.gmail.com>
X-ClientProxiedBy: MA5PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::8) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS0PR11MB6494:EE_
X-MS-Office365-Filtering-Correlation-Id: eff4e753-6156-4365-2b92-08ddef798eb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bHg1WFFSUEVvV3VrZmp6SUs4Yk5PWSt2VU5BU00vSGtuekVPaVJQdUE4eEdE?=
 =?utf-8?B?ejZ3dVVlcERmYTB2SFBFUW9WY0czVWNvN3BwL0JQRDNHQldKb0l5Y0RhcFNw?=
 =?utf-8?B?YjBEQlRsYXd2bDEveC8yK21iWmpyWlZsMU40cjgvTUh1NGlLbW9PeHE2K0RV?=
 =?utf-8?B?Vk9jUjRxOEp4WFFWWlV6SEEvUWwvUHkzcWVYQ0xLNWYxdCtYY3hRS3BmWXJy?=
 =?utf-8?B?aHdQZ3NJUS9WVnQ0bnlhWGdPSzJVYTh3NHFvTlc3T3I3aVphdXJFN1lva3hN?=
 =?utf-8?B?NHR3a2hvUDJDK2pTbXUwY1F6QkVRV01UUEI4WTlTa1FHWWF0SWlJMEpGdDU1?=
 =?utf-8?B?c0RRV0RRcWhMWWx0bytKL1E1SHB2UmpjRnBnYWEvWUM1WTJTMTgzaitEeE1C?=
 =?utf-8?B?b3hKa1d6QnhNeENTSWRhMVlNYW9ranFkZ3UxMDhHTFhiZ1FvbWk5U2NiVS93?=
 =?utf-8?B?WklqVTdIaTNCNklqRVZwTzdwMFE5ZlpsK3hoekt1YUVOQlRYQnUyWG5raFM0?=
 =?utf-8?B?aGpoU3N1ZUN2T1ZVL1lyQnlXdk01aGQzZEN2NHdSUkYzMFJwWDdOSWlaYm14?=
 =?utf-8?B?T3NORkh4ZFNnVjZtY240K1l3eXlIREFWQVN3RytyWmo2REt6Yll1YXRmVDlX?=
 =?utf-8?B?bU1JOUdBeHBGbVR0ZXZ2K2tvK2E1c2pUWm80VzRwanltZkEzU1pleTRreHND?=
 =?utf-8?B?ZEVSbGU5TVE0LzFvWms5L2hMQkFpRTJXeWYzc3hCZDIrdUdDZy94Z2VxTExM?=
 =?utf-8?B?ckhwZDdCYTFsc3RIK3lkd1A0b04yZ21ta2Q4VjdPYkQ2RzBLM2FFNXBPcUtO?=
 =?utf-8?B?cWF6MFZlbVBWWUJjemJzSktabU50RUFqZVZCcXdWbXBmUTcxMjIvKzJyL01G?=
 =?utf-8?B?Rlh4WXoxM3d6TVRuRWpWZ2pqczdMQWE1LzdFVnVUb2gvM0JWek5SdlZLanZ6?=
 =?utf-8?B?S0IzSzE0anRJUHRnbkswL2gwMVE1MnBCRjJDQW52VzNkSGhYOE9IeVd2dUw2?=
 =?utf-8?B?MkFEZ3kvSWdYVHAyN2hLQlpkZzRwWVFROVZmUzRDYVgrdGhkZ0VQd3pGMGpB?=
 =?utf-8?B?MVo3TWprekxGajAzdHBNand1ZjhJYzRKUzFhQ1FFN0pRZ3ZsQXkyeVFMS0tT?=
 =?utf-8?B?VENyaGlDRGR3L0laNStoNzFUOElmbUpZWXBHKzZIN0RVNlE5b0ZPbTcwalBY?=
 =?utf-8?B?d1l0WWNVWnpHVlFQU2hQdUFMMmhkNTA0TFhlN1RhZUt4S2VFSlVHSFNxK0dh?=
 =?utf-8?B?Ti9pOVM5VW9jV0Qra0Vyc1I1ZVR4YWM4ZHVTQWw4SjNvbENCSFZzMGZIblE1?=
 =?utf-8?B?VE1mNEFmNmNxMmFqY3JOcUNURU1GNURPV1hWYUIzb2hodDhnK2tjK0tad2Uy?=
 =?utf-8?B?azh4YlFjUWpIKzkxZ1RoOWovMjRPT3cvZzc3dmdzeldYSXoxS2grQW10MGUy?=
 =?utf-8?B?aWVBNTFjZW5JVGQ3ZlVrTDNnRjhrSlpmTlRnU250SjJHc1lVUDJ0Vm0ycG4v?=
 =?utf-8?B?NGZlVEszcmVhbEpuY3cxbWlrdnM4NmpESXVkMkc3SElzbkFRUUFBdFNXd1c4?=
 =?utf-8?B?TXo4ZytNejFwMmFJekRKTDZjOWxiNkRwRzNTV1J1cFA3T3VLbVNUNnQ4Z0NK?=
 =?utf-8?B?T0oxeUJoSUpTaFhwMzEzOVpmMzFXS2RGOFpHNXgyd1ZxemhrQzN6NDE2K2Vw?=
 =?utf-8?B?SW5BZ2Y4cVZnaFRJT1J2T1g1V1d6bjlRZWZ6QlYvSFVDK2RCZ0VmUm5LemRo?=
 =?utf-8?B?TTFCT1JCZU9WcjdrbzFYdzZ1Ykh1cnRtdzZtc1lyckttZ1pIckpEa0pmT2V5?=
 =?utf-8?B?RUQyNVdycGd1R1krNXQvaHNDMGlhcW81K3E0LzNTM2lNbXRmZU9ZZjJCNkpo?=
 =?utf-8?Q?O3ihVB16wEAKg?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NklqRVNkR0p0YzN1K0tiVmM5RGxkTG9sa3JKeW9uY3g0eDRsSmk2SytVWGpQ?=
 =?utf-8?B?VTc0SGh5aDM5anpERGJYSWdxNWxWN3g2NTNZMjcycFA1NTZaTW9Lck5URzB6?=
 =?utf-8?B?VjV5QUwvQzljWVlwZVlYUUpZYlg4M2piSk4yZy9jODJVWldLSDk5RllYMlRI?=
 =?utf-8?B?LzA5SU00TGdOSWd0aVE2SDk2R1JVbTFyMnU3ZG52NUdmMFpIdkpJRDFHRDRt?=
 =?utf-8?B?UVNORy9Fa2k5RVg4bFJyWTB6T0JmZWNrckJPZ1ZVb2pDeldncTlJSlh6aUVJ?=
 =?utf-8?B?aFdDbUlTdU0rUmljbkI3QnZ3VXQ4emZ5R0tZRzlnRzEwdGF0ZTR2SmwzdHc0?=
 =?utf-8?B?YlZZa1pPT0FyUVp0Ym9GVGNpUjh0MVBlYnVMMVd4eVNvemtHaWJnQ2dacTV0?=
 =?utf-8?B?WXhQeGZGcDBhZzdaR1FmU2NWbkl5Uk1pM3FZWHhTdjVHMjc5VUNBTkN1dkM4?=
 =?utf-8?B?c3ZOUElpWVQ1SmJ0QzBpbUFDK094b2JvNEhiUU16ZFBHT1E2elpTdDJVOHc2?=
 =?utf-8?B?c0lUbldWZU9NTXhtNktuLy9HVElKRTJuS1FvQ0E4TTk5YzNVUDZNc21OVFgv?=
 =?utf-8?B?N1ZLVGNkZXNCME44dDVNMFl2d2p1WVZuUVdERVNlSW8wSlpyTzhLVnBacjZu?=
 =?utf-8?B?ckU2NS9VNkY0UzlNNVJrUFU3UFNRNC9scHg3QWh4SGFTRjFYWDRjYlRpY3U0?=
 =?utf-8?B?UE5NRDc3U21yaWFwREdqSjhNNmJVU2hBbWlNS2xFQVNwYnBZQzd2K0VOdDY1?=
 =?utf-8?B?NTlIazEyR2JsQ2JTdlNqdmJqQUdNWXppMWlpL0ZCcUxHeHIwMTlZVXpaaHFE?=
 =?utf-8?B?MnN1SEZCV1ROWmtadFF0RUhUdlJZaE9nT2FIYnpLNkEveE5GdWYxa211Ui81?=
 =?utf-8?B?bkpJOEQ2bzBaK0h2aysyUkxkUm5iL2picktSS3JZTUZHMDZ3WG02dW1YdEJm?=
 =?utf-8?B?MzEreWFzcXZqdDkxdGtycGRENnkyRk9IV1J3RFc1aW5SeDN6enpiQWpVZFdz?=
 =?utf-8?B?cC93Mmc4Nm5jeEdPS3JwSnorR1pjcHViTm1VVUFyaWoxR1VyZ0JjcGU5UzJM?=
 =?utf-8?B?NkZJR3dvMFd6OTQrV2NqMmRUdTJRK0VjTWlzaVBRMGw3YkZvcUVDUmtXV2tn?=
 =?utf-8?B?V3dvMFBEYXlYNTRVb01zcnVsV3N3eFpzb2dhYUV5VnVVSnlvV3lPQ05iWjh0?=
 =?utf-8?B?MGhmUmlDYk02TkFORUZjT25sbWo3OHBTNE9uWEpLMjgvMU8wSlpnUFR1dzdt?=
 =?utf-8?B?NW5Wa0cwWWhNd2dTVnQrWWZmZWduMlVGcFVJcHc3RGVYTEd6aVRWeGlSTzds?=
 =?utf-8?B?c0lwSHplZUFYWEJWQmxoQVl0MVFkcFRYYWhCSGN1TnFITjR4eXl3RXZjcWpP?=
 =?utf-8?B?cUI1bEJpZnM3eGpWZThhaVI3YU5IRWJ3VDRvME1CWkJjYmp5K1VnNTFsdThV?=
 =?utf-8?B?N0QwMGR1aFZFUW4yRUlRd3FEeGJZMXVMQ2c0S1lxNmF1cVFpa3hpSkU1OFZi?=
 =?utf-8?B?dHFjNDFyeFVLdTBGanNqeWhVS2FCakx3SkoyanhBcVpGeGdTeGhsdkxNdUxt?=
 =?utf-8?B?eFp5NXFteTlCZ2o4aHRwSWw1Qldsamg4aVY2R1VuMTh1Y0Y3U0Ztc1lLS3Bs?=
 =?utf-8?B?bzNDQUc3c0JnL3l6eFp3U1FYOXpFZVpINkllaE1mNElIeTBwOVozNWZmUEJa?=
 =?utf-8?B?UVpkZVB6M0Rid0toQnpuem5FckNQdXpKcVd3RUQxbWNkN1daQmRFV3oraFp3?=
 =?utf-8?B?ZHdLWW9RaThwTUI2UHB0ZUxqb3ZlWUh6cnJCejdraUxQSEpnRzBqUlFWTU5X?=
 =?utf-8?B?eWx0UkJuOHRlZlBCRVJzeEgrS1BLWHl2OENQZFpTcWpMeUZsRVY1VmZNYnZU?=
 =?utf-8?B?VXUxQVVySHZCeDk0d0J2NU1DaTlqR2I4YTlSY0d3MVBXZjFFQjN2bWtUbFI5?=
 =?utf-8?B?d2hwUUhlcUZmdkl1ZDdiSmNRL2IzR3gvclEwOFJMeXFmY1ozRWtjS1dkcVdJ?=
 =?utf-8?B?MDhWM21CMTdmeTJHVWVid0NWNHQ0NTQ1KzdXWExTOGFXVldoN2ltdFBBS0Ux?=
 =?utf-8?B?MDdoelR6cmlqNWhUL09iNlVYZ1hlUmRkN0svNVY3R05HclVCVitUc3o5eDJ3?=
 =?utf-8?B?RnovRnRETjlnSndXT1BJVkFlK0hSckNKNXNCRk1XaFN1SDY1Z2dvdnVCdHNI?=
 =?utf-8?Q?gnIDWdbH2dhsiKmp+AF+EBA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eff4e753-6156-4365-2b92-08ddef798eb3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 08:19:13.4449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8lyrq5NX2rr5WZUc+qUOQKsbQ/bEeVv9IEa5a0xd7M0RKVVBOSC7DrZL4v73kEgRitdwamkcaNFulWGxWEegNvwHfUiHECmCCrVCL9m5UIf5XOb9wKS0UtPC4atFPlT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6494
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: FvQ15lHccYDkGhyxAoAnudTYPt47SW64
X-Authority-Analysis: v=2.4 cv=RaOQC0tv c=1 sm=1 tr=0 ts=68bfe304 cx=c_pps
 a=n1/gUQMs0EKbrxaRV/iiRQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=iGHA9ds3AAAA:8 a=ei4SEBeUAAAA:8
 a=Q4-j1AaZAAAA:8 a=di_CZ0IDdYnZy6BctnwA:9 a=QEXdDO2ut3YA:10 a=Hqou25T6mLgA:10
 a=pGLkceISAAAA:8 a=LVVdaqqDU9W9cF4QaU8A:9 a=QDC81ppE8DxJCSt9:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=8zIOOLb7Ym0NljyPXbuS:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: sMtQDM9-a8rdm9vCU7A7wIy8TTnpOYLz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA5MDA4MSBTYWx0ZWRfX4G/iMarzLtzP
 UiR1rrQQ3hB7W+HGS7tB3fcytWP7H05rY3VSBf9HRofASd3ahWU9B0rlyelHJvQP+2c2gPtSX4u
 jc8IR+M2B/aHw/TAnLVgl8lIRv+Id91O3gAKkv8cqCxz29BgqSf7ZNsnS6TiPiBvvVdp4ZDVAiL
 wrAoKcQp/cC+AQjeV/yRj1IGH8l4GnUFXvw9OuWVoekdyclmrd4ZDC6aX8bxvKVIuKthr+q4+XX
 ZIwj0vcqyCp8vowSI0ijDC3I7zIRrZijXmHny2q2cqw0dWpGVoGCpd0GTJX8Iuy3PEOFwBBz8lI
 wd2OdHswC5772s5mNep5CxriDl1xJ/hJXvRWGlL1rlfE9f7TRmGWpA/G2xswro=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 08:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223093

--------------IjbcKXwMz6foP07T6kJwgjOh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 28-08-2025 18:33, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Thu, 28 Aug 2025 at 13:45, Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
>> We have removed rust-llvm and updated the Rust build to depend on Clang instead.
>> With this change, we successfully built Rust for both native and target. Additionally,
>> we ran a full bitbake world build without encountering any issues after dropping rust-llvm.
>>
>> We now add these flags "-C link-arg=-lz -C link-arg=-lzstd" because of this following diff
>> otherwise we will get errors during link time.
>>
>> Setup in rust-llvm
>> -DLLVM_ENABLE_ZLIB=OFF \
>> -DLLVM_ENABLE_ZSTD=OFF \
>> -DLLVM_ENABLE_FFI=OFF \
>>
>> Setup in clang
>> -DLLVM_ENABLE_FFI=ON \
>> -DLLVM_ENABLE_ZSTD=ON \
>>
>> You can find the relevant changes on the poky-contrib branch here:
>> https://git.yoctoproject.org/poky-contrib/commit/?h=harish/rust-llvm
>>
>> Differences seen in builds:
>>
>> with rust-llvm for bitbake rust
>> real    54m54.184s
>> user   0m13.470s
>> sys     0m1.380s
>>
>> f/s usage
>> 41G
>>
>> without rust-llvm for bitbake rust
>> real    57m51.015s
>> user   0m18.129s
>> sys     0m2.051s
>>
>> f/s usage
>> 45G
>>
>> We are open for suggestions, improvements, or concerns regarding this change.
> Thanks for checking this! Is it possible to have a conversation in the
> rust upstream about starting to use proper clang, or reasons to
> continue using rust-llvm? Maybe there's a ticket or you can open one?
>
> While 'proper clang' appears to work now, deviating from what rust
> developers do is risky and can cause problems.
>
> Alex
Hi All,

Summary of discussion with the rust upstream about using latest LLVM 
instead of Rust maintained LLVM fork.
https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of-llvm-fork-what-rust-uses/23489 
<https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of-llvm-fork-what-rust-uses/23489>


Upstream LLVM is generally compatible:
- Rust does support building with upstream (vanilla) LLVM, especially 
the latest major release and the one or two preceding ones.
https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#updating-llvm 
<https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#updating-llvm>


Things to note when using Upstream LLVM:
- Rust may include cherry-picked bugfixes in its LLVM fork and so using 
upstream LLVM might lacking bug fixes from rust's forked llvm. (But,
this anyway we will catch it up with newly released rust update)
- If a bug shows up using vanilla LLVM, it's on us to track it down 
unless it's a known issue. (In general, the latest llvm is always under 
test with
rust nightly builds)


Impact on Yocto Rust upgrades:
- Rust upgrades shall always check for updates on rust forked llvm and 
backport the relevant patches to clang's llvm.


Regarding the rust forked llvm local patches:
- There are no local patches on rust forked llvm other than the 
backported fixes from llvm master.


Do let us know how can we proceed on this.

Regards,
Deepesh
--------------IjbcKXwMz6foP07T6kJwgjOh
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 28-08-2025 18:33, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj99rO9YpEUe1_sGBFXiaOA0dgoRMRK_AwgPKkaQWCnhfA@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Thu, 28 Aug 2025 at 13:45, Varatharajan, Deepesh via
lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:deepesh.varatharajan=windriver.com@lists.openembedded.org">&lt;deepesh.varatharajan=windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">We have removed rust-llvm and updated the Rust build to depend on Clang instead.
With this change, we successfully built Rust for both native and target. Additionally,
we ran a full bitbake world build without encountering any issues after dropping rust-llvm.

We now add these flags &quot;-C link-arg=-lz -C link-arg=-lzstd&quot; because of this following diff
otherwise we will get errors during link time.

Setup in rust-llvm
-DLLVM_ENABLE_ZLIB=OFF \
-DLLVM_ENABLE_ZSTD=OFF \
-DLLVM_ENABLE_FFI=OFF \

Setup in clang
-DLLVM_ENABLE_FFI=ON \
-DLLVM_ENABLE_ZSTD=ON \

You can find the relevant changes on the poky-contrib branch here:
<a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/poky-contrib/commit/?h=harish/rust-llvm">https://git.yoctoproject.org/poky-contrib/commit/?h=harish/rust-llvm</a>

Differences seen in builds:

with rust-llvm for bitbake rust
real    54m54.184s
user   0m13.470s
sys     0m1.380s

f/s usage
41G

without rust-llvm for bitbake rust
real    57m51.015s
user   0m18.129s
sys     0m2.051s

f/s usage
45G

We are open for suggestions, improvements, or concerns regarding this change.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Thanks for checking this! Is it possible to have a conversation in the
rust upstream about starting to use proper clang, or reasons to
continue using rust-llvm? Maybe there's a ticket or you can open one?

While 'proper clang' appears to work now, deviating from what rust
developers do is risky and can cause problems.

Alex</pre>
    </blockquote>
    Hi All,<br>
    <span data-teams="true">
      <p>Summary of discussion with the rust upstream about using latest
        LLVM instead of Rust maintained LLVM fork.<br>
        <a aria-label="Link https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of-llvm-fork-what-rust-uses/23489" id="menur85i" href="https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of-llvm-fork-what-rust-uses/23489" rel="noreferrer noopener" target="_blank" class="fui-Link ___1q1shib f2hkw1w f3rmtva f1ewtqcl fyind8e f1k6fduh f1w7gpdv fk6fouc fjoy568 figsok6 f1s184ao f1mk8lai fnbmjn9 f1o700av f13mvf36 f1cmlufx f9n3di6 f1ids18y f1tx3yz7 f1deo86v f1eh06m1 f1iescvh fhgqx19 f1olyrje f1p93eir f1nev41a f1h8hb77 f1lqvz6u f10aw75t fsle3fq f17ae5zn moz-txt-link-freetext" title="https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of-llvm-fork-what-rust-uses/23489">https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of-llvm-fork-what-rust-uses/23489</a></p>
      <p>&nbsp;<br>
        Upstream LLVM is generally compatible:<br>
        - Rust does support building with upstream (vanilla) LLVM,
        especially the latest major release and the one or two preceding
        ones.<br>
        <a aria-label="Link https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#updating-llvm" id="menur85k" href="https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#updating-llvm" rel="noreferrer noopener" target="_blank" class="fui-Link ___1q1shib f2hkw1w f3rmtva f1ewtqcl fyind8e f1k6fduh f1w7gpdv fk6fouc fjoy568 figsok6 f1s184ao f1mk8lai fnbmjn9 f1o700av f13mvf36 f1cmlufx f9n3di6 f1ids18y f1tx3yz7 f1deo86v f1eh06m1 f1iescvh fhgqx19 f1olyrje f1p93eir f1nev41a f1h8hb77 f1lqvz6u f10aw75t fsle3fq f17ae5zn moz-txt-link-freetext" title="https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#updating-llvm">https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#updating-llvm</a></p>
      <p>&nbsp;<br>
        Things to note when using Upstream LLVM:<br>
        - Rust may include cherry-picked bugfixes in its LLVM fork and
        so using upstream LLVM might lacking bug fixes from rust's
        forked llvm. (But,&nbsp;<br>
        this anyway we will catch it up with newly released rust update)<br>
        - If a bug shows up using vanilla LLVM, it's on us to track it
        down unless it's a known issue. (In general, the latest llvm is
        always under test with&nbsp;<br>
        rust nightly builds)</p>
      <p>&nbsp;<br>
        Impact on Yocto Rust upgrades:<br>
        - Rust upgrades shall always check for updates on rust forked
        llvm and backport the relevant patches to clang's llvm.</p>
      <p>&nbsp;<br>
        Regarding the rust forked llvm local patches:<br>
        - There are no local patches on rust forked llvm other than the
        backported fixes from llvm master.</p>
      <p>&nbsp;<br>
        Do let us know how can we proceed on this.</p>
    </span>Regards,<br>
    Deepesh
    <blockquote type="cite" cite="mid:CANNYZj99rO9YpEUe1_sGBFXiaOA0dgoRMRK_AwgPKkaQWCnhfA@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------IjbcKXwMz6foP07T6kJwgjOh--

