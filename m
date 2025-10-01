Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5335CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 08:48:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12268.1759308476177140864
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 01:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XNktLwvp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=23693ffae1=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5917a2QT1192328
	for <openembedded-core@lists.openembedded.org>; Wed, 1 Oct 2025 01:47:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=6bu8I1gIYImeIAj8tvPZpa
	KYtnGo4lzbCZCbMLJ9JPw=; b=XNktLwvp+sPUe6CkZfROvOgQBM/0eMNl8xxCwY
	fHyZDqw9fw8fgKcng9cgSAY1e61ow+DGD1tvHwDm4LxM05nujzYo4HW77l3LTVod
	IQqQPTNI0dQOuywVRJrLwswpoOdzJ/9xfEdRyiIll6STU5apF7i0TESRa1Ls0Jq3
	ZLBhfxrdPdOHMeMwSVmcGfyECsHSpSiPqegveEambkCqOn31P+AF6CenFdgGNeD7
	EGEM1/4nW5p65Ic7N+4jAzYpzQnNVZ3t2Nnpi72sztsUmB5tJeNVZLO2R/GhlnYt
	eedGPGq3tMj8/k8zfj9QH4ckyRPrB31zW4gv7c/YNpaSqzpA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012018.outbound.protection.outlook.com [52.101.48.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49eb6ymka3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Oct 2025 01:47:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NGCXSfrfT2FiJXEt7HxYeNvoLsKLSbaHiQkClHwKG3Q32ycWGmvysBvatslFDFMLYoz0C4WqmzTCZRPC6vA81j9Len4Jh52ePa++Rlci/klzJ9pnxP0JCGsuh7VD7T8WuufaggfCZb93JBma1pYC9SII7uuAZBgPWyCtyTl4g1xj3XKVGbl0UNlXYBM7v3apvZJEmfidB8UKVeYI4E9syH4QlcxzIRnPkb/BSuDXXTvfeow/oMyX+f5fFuO3+C+cMY2jeCWrBHmSrJxDlngKhtIgrT4lHRUBYF2+gyAKT/vOvFizc4B3GMPcCeDNnGpEzOoIMi+9leDL55UGFg1bCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bu8I1gIYImeIAj8tvPZpaKYtnGo4lzbCZCbMLJ9JPw=;
 b=ZeQfboAm66RQVzck7DJXPFbkwRK5VcgUBS4RBveWtx0253hycQ59RE4/k915YEqRH6Ob9S9b0VmzsYOJavF0suzv4RCJ2qnw1vxPG1vRfRUxyN+Yej2En8L0wZBg0/5N6mAmQxWDb45GKyjg+TEGr8WfTcA8QDKXDubMZADjySbNnym//WCqAcGTImXz/H41wYqpi2RFhXpFYyj2FSqItiy7uJJqCIvm+QBDRacATvkaIQMT65VnwpMKCf04CcJhUNql5ou+b7dfzafoAL0HQjy3rg16wuuDN+eW6KMlzMKxKBnyVC5jEQoF7CEWkmOtrc8TElck5hNtprrG6T5Rbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL1PR11MB5956.namprd11.prod.outlook.com (2603:10b6:208:387::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 08:47:52 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 08:47:52 +0000
Content-Type: multipart/alternative;
 boundary="------------Au02uu2XRcQXq1R70B21027D"
Message-ID: <93d2d7a5-a6c7-4b0c-ad89-01be28b407ed@windriver.com>
Date: Wed, 1 Oct 2025 14:17:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] binutils-cross-canadian: Add missing perl
 mpodules to RDEPENDS
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20250930123901.949798-1-Harish.Sadineni@windriver.com>
 <d04d310ec882ddea6f9578eeb65d99cfae1abe69.camel@linuxfoundation.org>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <d04d310ec882ddea6f9578eeb65d99cfae1abe69.camel@linuxfoundation.org>
X-ClientProxiedBy: PN4P287CA0103.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:276::9) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL1PR11MB5956:EE_
X-MS-Office365-Filtering-Correlation-Id: d6a562ee-d2aa-46bb-223d-08de00c7346a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|8096899003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OHU3QWlrempaV3Z6bmhITmc0WUN1NEZSUm5ieEdzSzI4L2pzMDRZUHRCSm85?=
 =?utf-8?B?VG5LRVRLNk5ZNG5ZUXB6WEJFOUczdHA1UVlhSDJtMmg3eGphM05tQUNPeGpu?=
 =?utf-8?B?Q2NjdnZYREFxYldXVm5LQzNOVFRzSEVHSzRxYkJUelVjck5lMHhpWTIyK1FL?=
 =?utf-8?B?VzVOQ3pvNlZmMDVLVDBHMnA3dm5ML2RZdldka1FTL1J4dy83Q3BJdXY4U1R3?=
 =?utf-8?B?SXdpbGlrclFIVXlBbHg2eWI2SExiYU9XWGwzVjdjRS9hc3RJS1phYmdzTHh5?=
 =?utf-8?B?VTlyQVNuUm5vaitCWWJFdWNmUENKeTIrdjNlZW1pOXZCWWxobXhlRU9IcEsz?=
 =?utf-8?B?N3BXWDRYcXFzN2NoRjE3MlkxdnNCRTY0TndORGg1UXZvS3JEYjBDTGpWQ0s1?=
 =?utf-8?B?MTU1OXN0ckxQaXE0VTJFVHlKNlV3K2VNdU1SMEU1SVNZYjE0OWdFSXRsWS9r?=
 =?utf-8?B?WTZRSExrWExMM3h0ck43QXRZWm41ZFA5bVVzeHhFa3lXVlZILzR4VyszK1F3?=
 =?utf-8?B?YTJGWFR6NjJIMkxQT3haMUtWTnhYV3FaTWdENy92NGJWdklDVzlPekRSQy9Z?=
 =?utf-8?B?NWhqRFRISlRPaVJkelY2OHFqemd4T1M3Y2lMOTRDcktNVDV4djFFUTczenE5?=
 =?utf-8?B?b051UkxDS3ZtZ3BOYkZoN0c3NHRGaXFmejI1RkVOdzkzcnQ1ejh1aS9hTDZG?=
 =?utf-8?B?aVJ6c09UWnhpVFRvVU9LeGdoZXhjaDRrdUJZUWdBMW1id3J1OHVVRDVUb21N?=
 =?utf-8?B?alRacWl0QWoxd2NpUkFMdzVXQytaZm1OUXFhVEpTYUwwaHdpSHV1T2ZhbHhL?=
 =?utf-8?B?TXZ2Y1lWVkdNL1VqNlRxQzMwK0lCdVBlU2VzMHpxWVF5SFR0WmlCUGo5Q09v?=
 =?utf-8?B?UnA2VGpXNEVtcVRPb09lRWt4dVFjbGRNTExVWkc1MDZuUmprMFlhVFhodTFz?=
 =?utf-8?B?S3daaTdta3lPMVhabTZ4Qk1MTTIxVEZid3VSd21RdjV1OTZvWDVuUERsRU1B?=
 =?utf-8?B?bEFDY0ZhZXk4a3ZFWE9mSFY3ZnRDQ1dvWlk2T2h4OUU1dXh3QjJYaW81T3pE?=
 =?utf-8?B?UnZGcUQ0aHJBb3NjN0srWXdoSnZMM2lJdTUzbloyQVRET05RNlJlNEkxVGRn?=
 =?utf-8?B?K1QvTjBLbzhwSWN5cmMvTTQ1a3orb1owTzYveDBXUHI2YU41N3YvcERSTmNi?=
 =?utf-8?B?T1dmRW85azNsKzVuR295UG1pbTNpejJmK2svNkFYRlJ4VFVJZnJkWmFpWC96?=
 =?utf-8?B?eVIvQjhaaWpwN25vc3RmQ2FnQUdSOXdoRzgxTFN0b2NMUmVLVWhqcnhVNlZZ?=
 =?utf-8?B?Y3dOZUUvekFzaEM1TlgrVmxtK29pUm5aeTRGZUdDK1VFUDdneE50UUZLdDF4?=
 =?utf-8?B?L1ZkTkZBZThxanVBeGhkQzhzTGlVMnlLYk80ZFlRdXhabitKd2hGckdrY1BO?=
 =?utf-8?B?VXNkK3FDaEN1ME9YQVNSL21WWU83UW56K1F0SzBQbm1sdVUvRDA2NU9zYWhT?=
 =?utf-8?B?OVY1YlpUd1hCb0ZaT0lZOHg2cjkwTVNLSGlycU1MZEMybTBvKzN4RW5Ldjkw?=
 =?utf-8?B?am9LYjMzQmpSUHl4N0ZMT3FaWjJ2RnFlUXhCNTFJMGg4Qm5ZSUtwbFZPOUNX?=
 =?utf-8?B?Z2NJNXF5MHFuWjRTVGVMR0FMck1WNlV4VzBpZHZ2SDVPM3RoSmYyUWFKc3py?=
 =?utf-8?B?Zlo4cjdwaVhDS3JaeENpWC83NVZQN2lxNndEVFdlT1VyS2JlcWUvb3NEN0sy?=
 =?utf-8?B?M2o1WjJoVG5BYVFsZ2htblBGdUdYa3M1dlU3Yi9hbnFEQm1XbUFUK3RpNnZP?=
 =?utf-8?B?aGJkMXpWRU1iMWI3bUFtelBndndwWFQ1eUtiZ1MweVBFM1NUcFZNakI3eDFo?=
 =?utf-8?B?ODh3ZmE0N3NoanBDdTk4Nm1KcHE4aVhUK0tJWVFYc3JaYmdKZ0VVeEZYelEx?=
 =?utf-8?B?cXVWTjc4K0VsVFpSRDJlRDVnREQrT0s3NStnbk8rSGZqeXIxa3RXR0xlTjFX?=
 =?utf-8?B?bk9GRWtJYjN3aFF2R2x3bkN5Tzc4R3pLRG9XbWxKMUV4ZStFbjdwQ2lSMnFZ?=
 =?utf-8?Q?FaxPLa?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(8096899003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T05sV0JKdWRUVGcwQTJua2MyZURlVEpmWTZnbEVCVHBVS0ErLzZUeU1PYXAy?=
 =?utf-8?B?SndmK2FNUTI4dThTbVhmZTNqaFB3YjYrTnlkOTBVNkNqRVB4ZU5iTFNmS01h?=
 =?utf-8?B?T05Icm0vYm5ENktvbCtkNkhyWUY1Z3ozSWZyR2d4b1FaY3hxU2E4VCtydS9x?=
 =?utf-8?B?WXYwaTRKM1lka1NFbUdWYUxGd3ZGd1drSE4yOFR0bXo5WURXVkNTQjRwNW05?=
 =?utf-8?B?U2RSSThCNlFmcUFSZ0tmT0MwbDVrNXV3UDNWMlMwd3JWNUM5eHhBbXRrZGtm?=
 =?utf-8?B?OHBNT2Njem4vWEhIUGN2UHlMUHRpSUZnVjl4OUM5bE1COElRaTlIUWpOam4x?=
 =?utf-8?B?Q2hiVGEvZWpXVXl4U2lrTmtGRzJUQ3ZCZTVVMTNVeWM4VlR2WDY3MS8rNlFM?=
 =?utf-8?B?UUdRM3FMTnBNV1poRUFEMnhxYk5FbnBLM2tZU3NCMXh6cERTWml2OG4zREZw?=
 =?utf-8?B?aEkzOWwxbGFWTTNaV3UrQnZscTd4Y3NnV3lhZE9QVHpMNmRoek91QjZCTVd3?=
 =?utf-8?B?eFZvb2RQUVF6eXhmTzNOLzljR0NxNlpndlFBZFhTbzRsakdsZDhZaHk4RHZV?=
 =?utf-8?B?eUxaTjVrSWRBNHZNRG1hVUZMYm5PRUlad3FvdW1YWDdhQnZ1U2dkdUQ5UzFv?=
 =?utf-8?B?MkcrSXJncEQ0c3BWWW04YTdkWXVaaDU2NFEzQVBzak96RjAwMFQ4NTFjL2tJ?=
 =?utf-8?B?RXM4eUdvSzdONEg3Nk96MWdrZ0hEWTcySzBwZFJJdFJlMytFRXhjZGNZK3Jw?=
 =?utf-8?B?SjEvUUI4Q05QZmIzVFhibGpXSDBnbWtQb0FhOWR2S1ZHK1RKWjJMcGRZK0dP?=
 =?utf-8?B?QUc3dmRLOWpRTGRzOS9EbkcrZkpDSUpMUTdYNTJVMmk5VmZ3bEVySTRlNW9v?=
 =?utf-8?B?djZ5RFVWU0dFUjRNWXRORktGL0taOXlJcWtOWW9RZGorRTFtS3hwcElFK3Fl?=
 =?utf-8?B?QlAvcHN5bEF1L1grZ2w2cWhvOHcwYlc1TzQrWXlMczFlVzRXYXRwR0kxWlh5?=
 =?utf-8?B?UmxSU3hhc1BkV2E4UUpYM0RLWmZnOFVsc1VTVnE0c2pSeHY3YThMeXBhMnNr?=
 =?utf-8?B?ODc4Sm90VEwreTdVNTBQa0hVL280TjM5RC9UMWV3bnJZcnN6Tks5amhxbENa?=
 =?utf-8?B?RDM2djgwUHpHMENXTHZJdnlOd0Z6bUMvS3BadnI4Q3Z4ZTZsUGJCU29OZnBV?=
 =?utf-8?B?WjdWaHBBMThnNXJ6bXFRMjZZeElRQWNSZENWRTh2ZWtnUUJBemFaV290Rysw?=
 =?utf-8?B?SkxZZXVMUHpkZ0dTdVZRWUd6THBTY1RpZ3hhRjg5Qm5HSitoNFlUQlVQNm80?=
 =?utf-8?B?UkpNMDdRM1VyT1RWTzAxSWwyNjQvUys3SjJERTRoNWluM2pXSHVETDIzVzg0?=
 =?utf-8?B?YkdCdkh4MEdBM2t3a29XZlNBbGNPWXNzS2ZBYk4vOG5lUFBZVjc2VWVBRVhi?=
 =?utf-8?B?RmhMQ0lDb25mckIxRldPbDBiY2ZlTzhlV2lmSDd6L1RiZWV2bzFkZkF3Ymtk?=
 =?utf-8?B?emdtVlR4akhLRW9HSWt2RFZsekliZW8yYmEyVVk4OUlrTnc0TW50QmV3QW1r?=
 =?utf-8?B?Rnp1bktiUUY2K2d4Z2RLWG9vMEo0M2tQeWNiVnhxUVQwY0owL2k5QTBkOWhG?=
 =?utf-8?B?eGlUb2NCWlFxRHZtV0czcy9MUDVVOUhOdEdkVE41NVhLNEdWaVZCTEhwNXVh?=
 =?utf-8?B?eWZCTVpBMkhoTWlxazNLdlErSit0NVl4TU1zaU5KMkVKYUxzME1jazZyUGRM?=
 =?utf-8?B?MWpmSWZRWGNrcnM2aWJSRnowcHNINWM2amkrTkxCa1NDc0oyNnBQdW1IU2R6?=
 =?utf-8?B?bFEzb1NOdk1RRFQ4VzhXWnlpQUJmWXNoaDB6RW5rRFV3cTBJN1dKd3k3am5v?=
 =?utf-8?B?d3FsUkRPclZhL1UrR3VkTDFwS3p2UDdLQlQ5ZmpodmU5clo3ZHRWSGFjcDB0?=
 =?utf-8?B?SVB5TzA0K2ZrYzNVc2pOeXI3Y09ZYkNSVmd2VjVBaVEyY3B3Kzh4UENHT1NC?=
 =?utf-8?B?UFdQRkk0Mi9DMWYvaEo3WER2RzI5andxdDh1M1dkZEc2RUVVb09XcnJYUmNP?=
 =?utf-8?B?REJPM1NlK1BPOStLUExzdmhxMThCM2ErSEsrZ0hKdlpmaEo5d3dVbjd3ektw?=
 =?utf-8?B?eFMrczd6RkdQVXpDUWJhT25VUks5ZkFkOHhOdy9FRFFBUG4zRVZab0xUWEFL?=
 =?utf-8?B?VlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6a562ee-d2aa-46bb-223d-08de00c7346a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 08:47:51.9923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hN02zuQYb0ob5lW+xeoRQECnsaRC8f+pt2jMzDC/KLsx5vJtbi1wQp9jOcz97avcqJfah2yVqFqH2EFpYPF0ORs0waDGz7GKOqMYRdwishY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5956
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 1RqnYuIsD3jl8lNxJ4Hwf4RTFSoRxWQZ
X-Authority-Analysis: v=2.4 cv=cYHfb3DM c=1 sm=1 tr=0 ts=68dceabb cx=c_pps
 a=HLJbjerEQdjma44f6ZsklA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=W14p9cQM8vcUcoasUOwA:9 a=QEXdDO2ut3YA:10
 a=ag1SF4gXAAAA:8 a=yj-aMKAYKbz0kkd27lYA:9 a=XDycI8c1iNq-9deL:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAxMDA3MSBTYWx0ZWRfX0Zm0cq9nRi27
 gaCMIBadGpKSZcYCAbZs4DydA4C5w5WqpscHIk48ForhQdK9MrkaqdApE0dhGm4JlXqa86pXc6I
 KW2Gy2eJLdIfkNBGTyk/CXixTOtN13+nxW2DePcjCDbGxnJRaKIZe802vAzoLP2TZKksmq6ubbP
 iAfemvyTcXtTJkAtvPlBBowLPwMuomK1lny/fFvRfevrXSmJzSGBgO4ARryUF5VM5m09b0b/oj5
 Lu+FE1/Pwz2LtLp+A30NiIHD1+UEeu/uM1VCxFzqRgVIp7lFJbtcwNclR7IGWusZiaCuvuiqRvl
 rtiI3f0J3BTn0p0TH4qKHvs/P2es5LLuX35daHXKS2z6gKUXVhqDIZl1zJfAkBuHWwtkQyjXlEO
 Zc4lfRraaGocuuMCQdCS3KB8XR1nSQ==
X-Proofpoint-GUID: VBIVZSLSREOhs2gsmbd2s7Tz4a_-RujU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2510010071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 08:48:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224201

--------------Au02uu2XRcQXq1R70B21027D
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/30/2025 7:17 PM, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Tue, 2025-09-30 at 05:39 -0700, Sadineni, Harish via lists.openembedded.org wrote:
>> From: Harish Sadineni<Harish.Sadineni@windriver.com>
>>
>> In sdk while running "x86_64-poky-linux-gp-display-html --help" gives
>> following error:
>> $sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux->
>> ./x86_64-poky-linux-gp-display-html --help
>> Can't locate bigint.pm in @INC (you may need to install the bigint module
>>
>> By adding the following perl modules to RDEPENDS fixes the above errors:
>>    nativesdk-perl-module-bignum
>>    nativesdk-perl-module-bigint
>>    nativesdk-perl-module-math-bigint
>>
>> Signed-off-by: Harish Sadineni<Harish.Sadineni@windriver.com>
>> ---
>>   meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
>> index 7d7ffe92ce..9dc73fbdf1 100644
>> --- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
>> +++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
>> @@ -5,6 +5,7 @@ PN = "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>>   BPN = "binutils"
>>
>>   DEPENDS = "flex-native bison-native virtual/nativesdk-cross-cc virtual/nativesdk-libc nativesdk-zlib nativesdk-gettext nativesdk-flex"
>> +RDEPENDS:${PN} += "nativesdk-perl-module-bignum  nativesdk-perl-module-bigint nativesdk-perl-module-math-bigint"
>>   EXTRA_OECONF += "--with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \
>>                   --enable-poison-system-directories \
>>                   "
> This is probably the right direction but shouldn't this be for the
> gprofng package rather than ${PN}?

Hi Richard,

In the SDK at 
|$sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux|, the 
script |"x86_64-poky-linux-gp-display-html"| is not pulled or packaged 
by the gprofng package.
Instead, it is installed as part of the binutils-cross-canadian package.

Adding the perl module dependencies to gprofng**package**will not 
resolve this issue , it would be effective only if "nativesdk-gprofng" 
is explicitly installed by the user.

Thanks,
Harish

>
> Cheers,
>
> Richard
--------------Au02uu2XRcQXq1R70B21027D
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/30/2025 7:17 PM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:d04d310ec882ddea6f9578eeb65d99cfae1abe69.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Tue, 2025-09-30 at 05:39 -0700, Sadineni, Harish via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>

In sdk while running &quot;x86_64-poky-linux-gp-display-html --help&quot; gives
following error:
$sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux-&gt;
./x86_64-poky-linux-gp-display-html --help
Can't locate bigint.pm in @INC (you may need to install the bigint module

By adding the following perl modules to RDEPENDS fixes the above errors:
  nativesdk-perl-module-bignum
  nativesdk-perl-module-bigint
  nativesdk-perl-module-math-bigint

Signed-off-by: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>
---
 meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
index 7d7ffe92ce..9dc73fbdf1 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
@@ -5,6 +5,7 @@ PN = &quot;binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}&quot;
 BPN = &quot;binutils&quot;

 DEPENDS = &quot;flex-native bison-native virtual/nativesdk-cross-cc virtual/nativesdk-libc nativesdk-zlib nativesdk-gettext nativesdk-flex&quot;
+RDEPENDS:${PN} += &quot;nativesdk-perl-module-bignum  nativesdk-perl-module-bigint nativesdk-perl-module-math-bigint&quot;
 EXTRA_OECONF += &quot;--with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \
                 --enable-poison-system-directories \
                 &quot;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This is probably the right direction but shouldn't this be for the
gprofng package rather than ${PN}?</pre>
    </blockquote>
    <span data-teams="true">
      <p>Hi Richard,<br>
        &nbsp;<br>
        In the SDK at <font face="Calibri"><font face="Calibri"><code>$<font face="Calibri">sdk</font>/<font face="Calibri">sysroots</font>/<font face="Calibri">x86_64-pokysdk-linux</font>/<font face="Calibri">usr</font>/<font face="Calibri">bin</font>/<font face="Calibri">x86_64-poky-linux</font></code></font>,</font>
        the script <code>&quot;<font face="Calibri">x86_64-poky-linux-gp-display-html</font>&quot;</code>
        is not pulled or packaged by the gprofng package.&nbsp;<br>
        Instead, it is installed as part of the binutils-cross-canadian
        package.</p>
      <p>Adding the perl module dependencies to gprofng<strong> </strong>package<strong>
        </strong>will not resolve this issue , it would be effective
        only if &quot;nativesdk-gprofng&quot; is explicitly installed by the user.<br>
        <br>
        Thanks,<br>
        Harish<br>
      </p>
    </span>
    <blockquote type="cite" cite="mid:d04d310ec882ddea6f9578eeb65d99cfae1abe69.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">

Cheers,

Richard
</pre>
    </blockquote>
  </body>
</html>

--------------Au02uu2XRcQXq1R70B21027D--

