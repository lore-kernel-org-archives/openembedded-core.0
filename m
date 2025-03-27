Return-Path: <rajendra.desai@emerson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE77FC3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 10:51:58 +0000 (UTC)
Received: from mx0b-00300601.pphosted.com (mx0b-00300601.pphosted.com [148.163.142.35])
 by mx.groups.io with SMTP id smtpd.web11.46841.1743072714765217431
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 03:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emerson.com header.s=email header.b=Gl5rcZMO;
 dkim=fail reason="dkim: body hash did not verify" header.i=@Emerson.com header.s=selector1 header.b=H5TJeIrr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: emerson.com, ip: 148.163.142.35, mailfrom: prvs=21814084f2=rajendra.desai@emerson.com)
Received: from pps.filterd (m0144091.ppops.net [127.0.0.1])
	by mx0b-00300601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R939jE017869;
	Thu, 27 Mar 2025 10:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emerson.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=email; bh=LEv/c+P/Fbwj0rGsh2teroGzU1md
	Sf1HJE18Ux7l5Gw=; b=Gl5rcZMOpSHH2z/4XQJrIuTzy51LLtv6IFNnoEWd4+Sl
	bmP8I23/gtzeJhaZMbtImz/qu1PEa3B0gQLCw2cHqTdOffXNHanxTCHi14W44weZ
	CTvtUb4pBuyP5QbO/TbAPiChFG1Ks+bw9aHxRMvziz+U7qDhz/oEJYLMjojUh/Qb
	ghWfzbMB6LiPUd/Wi9+bMeNSA1Zk6GSbqoOhMlrzGBG6NiUF+YipV61s08SvYgrQ
	O5ZinTPiWq2cxMdFbMkgL7qM117LoeRKDShodMZoaFBPDSjdVdKhqHZ4oMD2qpki
	bSBry6KkTbZUSsMtRQ+tcQ+8L1gZ8Us7eTC+N88Xig==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
	by mx0b-00300601.pphosted.com (PPS) with ESMTPS id 45n3pwsr3d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 10:51:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aa5aXNKY3IIupfjlI+mXZG4OfYPR60oiNR0oe2XKLcqjyqH60FBcIJrUdwCy5Y67g0dJsXmKBWKFKVGd4ehxEmiTpFXfelpzQ9fiEmRY4T3KbW3fd/tFmSRmboVRdISYeg7e4XWcHl1BOXzuD8zqpu2zUi1ZOmnqn5ikrM8PKiPnmzzK1D+n3ztUpewoEyKtgej1/uwV+K4S4TlI8CvgcJm2Wnmn54KCCnV7c0ZkDsWNrSAkaA6qhlQuRts7nX0XJ4dqDjFNmqoYTX7jHxK11Z4HxCleLcsdbJUuQVqQBZep2UY89QK5yV9tyWYnrnLLGXg6xpafC/D3vIwTZKZ2Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wykOi6oxoN3Qe2hgJkTqsayHyHJO4bp8OgguSFzearU=;
 b=wtHTjas5P/61ljeQIf8WwoCHljB3TPkteX1Ylp33FH1h1lPTDtjGTIzOusS4nA4iOQkKcENU2yXOH5k9MVhIiC7zYB9URqQ1YiyyW3I0EzED/VTMpoZKY5lU4SDi4MnXrMV576qM4E2vGyCo3zgtLd7TeQn6HyLxyQvIGkYylKbp7IwMSmqrj5snvsRpZ/Q7p4k7FqxqiuyLj8YzKYNKMJXeMqAAuk2sCX1XkB8G2+BS9/0VGXHwkomVrum0zn9Jch2t0PSJ9jUzg1ZgLTeGsu+aNN/07ATQ/DZNGc9xSVkVV+BN+8khEr2p5MqUOAbz3Zfv1C+P7EC71jg+HlM0Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=emerson.com; dmarc=pass action=none header.from=emerson.com;
 dkim=pass header.d=emerson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Emerson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wykOi6oxoN3Qe2hgJkTqsayHyHJO4bp8OgguSFzearU=;
 b=H5TJeIrrqsObG7Nm7rjKEmQA3IQDDElr4dHQ23KkCOqbr0dw0iGPYToB5Xn7Rvxs+F4kDOSlxD7bt/F4HZso1Yq4HQcqNQALiN4SWBO623wHqpX5VFNFqsoWNCtgbryDVUk38pBWfIGyZhSSrKEq+X1X3pYrRgI8TAIaP0VbJXOliqWzw0mYSyg8hMEm7oVtXAsxlzNAeP1HCnOn6tGByouO/WK951yFgtapfMm/aX/a16YBE19Qi5yNSGlgqa5E50xxqNRwvBkHFz7UWUgQBRt9lkyhqqGeGqgeOwPEH82VgBGhu9AsCHWF8qDqYl1G75nNOuabKzQ6KUijBnVk6Q==
Received: from DS0PR10MB7954.namprd10.prod.outlook.com (2603:10b6:8:192::7) by
 SA6PR10MB8134.namprd10.prod.outlook.com (2603:10b6:806:443::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 10:50:42 +0000
Received: from DS0PR10MB7954.namprd10.prod.outlook.com
 ([fe80::cb84:403:1604:dc14]) by DS0PR10MB7954.namprd10.prod.outlook.com
 ([fe80::cb84:403:1604:dc14%6]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 10:50:41 +0000
From: "Desai, Rajendra" <rajendra.desai@emerson.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [EXTERNAL] Re: [OE-core] [PATCH] perl-ptest: copy xconfig data
 from perl source directory
Thread-Topic: [EXTERNAL] Re: [OE-core] [PATCH] perl-ptest: copy xconfig data
 from perl source directory
Thread-Index: AQHbnv4WDFxL0wr7B0WdCOhA2f+qI7OGwcvA
Date: Thu, 27 Mar 2025 10:50:41 +0000
Message-ID: 
 <DS0PR10MB79549ADC3C849A2D68F00BDB89A12@DS0PR10MB7954.namprd10.prod.outlook.com>
References: <20250327060855.428041-1-rajendra.desai@emerson.com>
 <CANNYZj8ko8LF8m32CoM2fWTCryTWW_Nwya62K_dpBZqdU_WZZg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8ko8LF8m32CoM2fWTCryTWW_Nwya62K_dpBZqdU_WZZg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_ActionId=e2d160a0-d536-44c2-8178-a327d554cb53;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_ContentBits=0;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_Enabled=true;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_Method=Standard;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_Name=Internal
 - No
 Label;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_SetDate=2025-03-27T10:06:21Z;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_SiteId=eb06985d-06ca-4a17-81da-629ab99f6505;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR10MB7954:EE_|SA6PR10MB8134:EE_
x-ms-office365-filtering-correlation-id: a868fee7-0538-4f7a-ad3a-08dd6d1d3818
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|4022899009|13003099007|7053199007|8096899003|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UVNQVnJtT0d1anlkdmZFQ0dmWlQvVWc1UU5ScDRXQzUzVkY2UitJUGpIK29X?=
 =?utf-8?B?TXJxQWNPcmZrVVhrU2ROWDVhRmRIRDhxQVZ4QlZpV1JRVU1IRnN0bVhjYmc5?=
 =?utf-8?B?MWxCQkxjUU5WdEo4NGp0N1NMQ2xYQkNkZTM3UkxNZy82NGhLb1BKamp3Z1pS?=
 =?utf-8?B?ZkxKemdQRFlTcmpGTFYreStsZnVaOWtSMUJSTFB5VW95cXFvRStYaWpJQjdz?=
 =?utf-8?B?Mzd3UHpQWXpqeVp5Wjk3ejlsUHRqbkFBS1BOZTV4SkVBMlRFNlRPcG4zQ29W?=
 =?utf-8?B?N1l2NTdwem5UZ0tVazZOZnAyd0pudEJsdzZycGp6Y1JMaERJSnhhNzl2OTNj?=
 =?utf-8?B?SGtHcTh4TDdRUmc3dy95VWRvQlNtRWRFTHhMV3ZuZGUrSER2UnRFdS8ydW9h?=
 =?utf-8?B?N0tFaEIxbHB6Q2x6andkWjFaS3hrM2x0N1pxdzdycnZiL1FHcDhtNkVDTUpF?=
 =?utf-8?B?TmFQdG9rVHpzN3E4N3lVSjZZWWNDbDFOR0FTYlkvaHh3dStvU3dQUldRWkdE?=
 =?utf-8?B?cTVRVzJLVjYrei9uM1lhTDJpK1hLbDdxeEpsR0pmOURNZEJOYjFsMFdiWVZs?=
 =?utf-8?B?alRoMjJqcGdnWVVKOC8wZWR5N0tNRWlieFEreGU5YXN3T01QanFXUWxXYnRH?=
 =?utf-8?B?dm41K0tjbTFYWEJQYTZQNURhbjE2cEVMaXE0RUc1U2pXd3Nwb3RQM2twRXB6?=
 =?utf-8?B?RE42UE5LakhMbGlXeTVrTkk3ekxYcnBycFMySVBOVWloQ2VTMFZwdnpTYjNq?=
 =?utf-8?B?bzYxUHFIT3Mrczk0RkdBUERmMEFQZ04rQUtvcDV3Uy9VQWtzMFFYak1zRHow?=
 =?utf-8?B?anVKYmd0aVZpbi9XK3lzM0FKRXJtaDJNd292WDlXOG9HZUhsL2VCMHB6L3py?=
 =?utf-8?B?bDN1eFNNT2RvenVVeERsRWR1ZmxkVlJXN3JBOHZXMnhOci9RL3NnaDJSUjhL?=
 =?utf-8?B?UmVzakRsaVVTZmhtNmZ6TnhoYmRPOHNJRnRlSzBpUmVEYXVuSW1RY3laWHFL?=
 =?utf-8?B?Zms5ZzhkWDNjODRiZWFXR1dKVytJK3hNemdXdC90d2dHQjdsMC9zaFpRRVJ5?=
 =?utf-8?B?dFdnV3lqbDJqOHUzSXRLSGo0SVo4R0lDOHZ0d3BRaENxeUVPRDBDN1dpMVF0?=
 =?utf-8?B?aWsrMXYyMFpNS1pIREFMTWVjaHRjbHJ0d21XaWIvYW1ZNDJpWWgxNFZnektl?=
 =?utf-8?B?UUlvOXVxcStZL29uQjJKdXVOU240MEw5ZVY2KzY3dmdGMHdNaGVVUjRRWWhk?=
 =?utf-8?B?aDBQYm12bjZnMmJObjdMc2hKcEpJV09ORmowYXF5SXBycDRZOG0rVGVya21u?=
 =?utf-8?B?WmVGQmkwUk0yZXBZN1hWeTJEaW0xdkJDYmMvYjhZVXNYSVhTTVoxeldKVGdH?=
 =?utf-8?B?N1NOTE96SEFPVUJGemQzWXFEUGJGZW9VSFZ0Zk8vZmVGQ1h6VTBaVmt3Z1A4?=
 =?utf-8?B?OVg5WEE5SEJZYXJnUFlQc0kvTmgxc1BmWHRIemVVcFZlZ0Q4bXQ1U1dyaGxp?=
 =?utf-8?B?cUdYa0VPYXZXRkhua25TekZmczZ6TWMxWFhGaDFXaHJiK3JJREZ4eTgyWFc2?=
 =?utf-8?B?MG5BWWJaU1pEZmNTVWp2WE1ERHh6cFl4UGZ0WEJHdmN1SzZWdUgrRVZZVDN0?=
 =?utf-8?B?MzlMeU0xRndkeS9ZT1lURFBpRkNFQ0dDS1JVNDlYSnZFTkxYVWtTZlJNQyth?=
 =?utf-8?B?WmpSblJNM2I3ZkdrcDdSaGV4UmRDemQreURZaDQ3Z240RE5GaW5PeXVUT1Q1?=
 =?utf-8?B?S3VYNTJNUlRoQjJHalRaV1dnUWw1R1ZIWHVqU0pDZlhuTm5VTlMwN2x2dHpR?=
 =?utf-8?B?T1F4bjI4MXhnL3oxcXRXYVpubTAvVjhQeDVhUE9GdUcxUm0wNlVFbXZ0L3No?=
 =?utf-8?B?SHNZZTZsdTJlVjZCbzRhSlJtWlg1dTlHWjVzL1pXRDZxeXc9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7954.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009)(13003099007)(7053199007)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R3lBQ3FRYSt0N0NnZVk0MnR3MXZGZ0F2cXc0Zzg3WVNGYUtGZWJoMGVFMVUy?=
 =?utf-8?B?NDc5MmpQVjdBSGpRU2RHR3M1eUJuVGJYeWZPK0tWV3BwNGE2U3dVWnRpM3FI?=
 =?utf-8?B?V2lQQ3VQNDl2R2U5bFJwdWhuYnhQTVRLUExFMVRvbi9NNWE5QjJGSy81cjJu?=
 =?utf-8?B?OTA0cmFMRXpnc1R5VjAyVXNjTkxLbU1mUVdTWm9KTW5TZ1ZrYzhHaTZrOVBY?=
 =?utf-8?B?aVRDWWF0RUVUMWlaK3lpNG51dHJpb09mSlFiS2VGOUxYVXZBT1F1WTR2S09Y?=
 =?utf-8?B?YzRzRUtTbC9zRWh1K0hOTUUzbGRCRnErN2pZeTB5Uk42TngxZXAwdmJQZ1lo?=
 =?utf-8?B?T29oOEFhb1NQcjdQVXhJWDFYWjRNcWhwSmNwMzgrSjNHVXZQZDB0a3JoY2p1?=
 =?utf-8?B?bm1abmVMZTRHaS9XK0dRSGtWQ3QzOGxuRk1SeS9OWjR4ZHBNR0EybGpIOTE5?=
 =?utf-8?B?S0lmSHZJUk93SzVjNkhLZnF5QzF6WU5OTzFIaUdwcVdPUUVPUFdDZitUNThh?=
 =?utf-8?B?MzVGWGhoTUViTnd1L0ZuYVBGL3NEU2JLY01CdTBtWk9CR3UxU1VvY0pQOWlL?=
 =?utf-8?B?MmJYdHI1dC96NFBaTTY5aWJidmtJQ0FaY0xRK095SG1NMVBHWHZVMjY2L3d3?=
 =?utf-8?B?RTcySHFTQXBGMkpWZWZlMS9ReUNMRUZ0UXFDekNKNUJUOGk5OE1mTHNCRHIr?=
 =?utf-8?B?MkNJUU9ydWUveEwzTnhRWmxoOWhIYUpWVHBSMzVHcndHOG5GVDkra29Cd1Ru?=
 =?utf-8?B?dXo2OXZiNXpnRjVyc1h0NVdudzFWaitWVkhNcTgxdW81SUN1NXhRd3o3Uk5w?=
 =?utf-8?B?N0tpamFaREpxVVlmb1B0Q2R5bjNDTUt3VWljY1g5aG9Ed1BuaUdlOVphc3h2?=
 =?utf-8?B?cCtwRExuZCtoS1pyNVRmd25VQVp4STF5LzlTV0V4VjMzN1VTaE8xRFphMDFy?=
 =?utf-8?B?aytEa29ENjVOVVRJZU1RZ3p5SEdlczVkS2U4SlhUb2lGaXdrS3RrbnBod1Jx?=
 =?utf-8?B?TWtJTURzSnl4NGE0d0pDenhnQ2VOZGhIa2dPNW5wRFc4MEZvZVR3M21ZZ1l4?=
 =?utf-8?B?ckxUS3UrMituR0RUR0FseG9SZUNaeVdGU290dkJSVjl3WmkrZCsyNURQMndr?=
 =?utf-8?B?M21RWndlbjBSN0tkUUsxMm1TNExqVWxzT01QVWVVV3Y0c2VxVFpveEZyRy9t?=
 =?utf-8?B?S2oxSEZ3RG82MXNtRHJReE80QmEwWXZ3Mzc3dEFBWStjUmdRd1pMYmUrN1Ew?=
 =?utf-8?B?ektVQStjVTR1UU5WeENNZjFnV3lEK2hoMC8raHY2c1c0MVJqL0lMWjJvbGlE?=
 =?utf-8?B?dm80a1hvcG83amJIYlgwc0FYTDA4SkR1UkMzQjdwNGd4QUQ4VC9mcnM4aGJW?=
 =?utf-8?B?dUV0Q2lhbDUwUnlXMDJkVE9jbWJZKzg1SGNLczNqcjVyeVE3b2tDWld1bUpN?=
 =?utf-8?B?NWtlZW0vZjNGYUx0VVhTNXRjSWhOMmpsMFl6RUpRaWRjbGYvMkdpWW5CUWRV?=
 =?utf-8?B?Uzh5MU5JZXdSUkxLOGwyaU9BcHFTTnFTdFNPNG9XWWV2ajI2bDhUZGVXdklh?=
 =?utf-8?B?T0trZUdjeTdqZTVMNE5WZFQ4U1RRY2tYN0xta2ViKy9uNWJMQTdwYU1DdTk5?=
 =?utf-8?B?aS9JSENwWXp5TENYcGlZcUhqaVZEV08wT21XTW5NbkIycUtHVzdHVWVuVW1D?=
 =?utf-8?B?VFdvdXVlKzZuNi80VDQrY2tjdW1PVXNPRVFMUlpWekFZazVRNmNvYTBQWG9P?=
 =?utf-8?B?a0dvakNPbEQ4N1hwQTd4T292eE1VeEdrN3ZzdnJ4OFVRNlY5T3oxd1BSYnJK?=
 =?utf-8?B?N3NWSlFBVGs4N3R2Znl6d3BUYmhYTVFKK1pIZ3Q2NVlYWGtRK1dSbE5IK2Jm?=
 =?utf-8?B?UWc1OHNaWkhEbVJCd1dtdUxLcHB3dUp1aDd1eUw4b21mSUxNR1V3bHoyUkdk?=
 =?utf-8?B?ZzdpcjNhVkN0K0U4Z0tKWDdSaGU5TGxJNENnZG9zZURHWlpHVGI0cVNhMnJr?=
 =?utf-8?B?dDFqcUwyTzdHRXJTNXlxNE1LcUJIKzJRSlo3TFhCRU5mNjFJOS9hMWdLcGRF?=
 =?utf-8?B?RGR6dTlFenJsVFpVZG1nY1VhZVhIb0lMcHZoVzh1R1QyZWdVUTdRZW11Sm5i?=
 =?utf-8?Q?nGhVFBtg77CcOWR9L9P9ATCcr?=
Content-Type: multipart/alternative;
	boundary="_000_DS0PR10MB79549ADC3C849A2D68F00BDB89A12DS0PR10MB7954namp_"
MIME-Version: 1.0
X-OriginatorOrg: Emerson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7954.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a868fee7-0538-4f7a-ad3a-08dd6d1d3818
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 10:50:41.9024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eb06985d-06ca-4a17-81da-629ab99f6505
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PH3XguOOoQR7FGLTJ1K/P4BWdyowVgagVKoTG/B8jskiDX6Pbuh70tzI3Hfwp8+Qh/pnQOYWQnfhKwc2/qOUI6mgxMZFWZFW7xxpTYB+D0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8134
X-Proofpoint-GUID: s0lGjeWHOCTBw8EdiZoLfLLNrFJJ606b
X-Proofpoint-ORIG-GUID: s0lGjeWHOCTBw8EdiZoLfLLNrFJJ606b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 bulkscore=0 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503270073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 10:51:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213720

--_000_DS0PR10MB79549ADC3C849A2D68F00BDB89A12DS0PR10MB7954namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander, thanks for the reply.
I tested that the issue is reproducible on master as well and that is the r=
eason I resubmitted the patch to the master.

How I tested:

  1.  Cloned the Yocto Project repository
  2.  Configured openembedded-core (targeted to master branch) along with p=
test-pkgs
  3.  Built the qemux86-64 image
  4.  Ran the ptests (run-ptest) on the built qemux86-64 image
  5.  5 of the mentioned tests failed with =E2=80=9CNo such file or directo=
ry=E2=80=9D error
(for which, I have explained the details in the patch)

I am not sure what do you mean by =E2=80=9Cperl ptest is passing in yocto C=
I pipelines=E2=80=9D. If you are referring to the perl-ptest package,
then you would not find issues while building perl or its ptest package, bu=
t the issue occurs when running those 5 perl tests on a target
(since it would have skipped including xconfig.h file which is needed for t=
hose 5 tests to be successful).

Regards,
Rajendra

From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Thursday, March 27, 2025 3:23 PM
To: Desai, Rajendra <rajendra.desai@emerson.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [EXTERNAL] Re: [OE-core] [PATCH] perl-ptest: copy xconfig data fro=
m perl source directory




This doesn't address the feedback given previously. Which is:



Is the issue occurring on master as well? If so, you need to explain

why perl ptest is passing in yocto CI pipelines. How can we observe

the error on master?



Alex



On Thu, 27 Mar 2025 at 07:11, Rajendra Desai via

lists.openembedded.org

<rajendra.desai=3Demerson.com@lists.openembedded.org<mailto:rajendra.desai=
=3Demerson.com@lists.openembedded.org>> wrote:

>

> The following perl ptests:

>

>   - dist/ExtUtils-ParseXS/t/001-basic

>   - dist/ExtUtils-ParseXS/t/002-more

>   - dist/ExtUtils-ParseXS/t/003-usage

>   - cpan/ExtUtils-Constant/t/Constant

>   - cpan/ExtUtils-MakeMaker/t/02-xsdynamic

>

> are erroring out with:

> | /usr/lib/perl/ptest/perl_langinfo.h:8:10: fatal error:

> xconfig.h: No such file or directory

> |     8 | #include "xconfig.h"

>

> xconfig.h contains references to the build host architecture and was

> removed by commit 2e0f30c46802 ("perl: do not install files that contain

> build host specific data")

>

> However, it is still included from various other places including these

> tests, and we are still depending on build host architecture data by

> including the patches from perl-cross recipe, a dependency to perl recipe.

>

> xconfig.h was added back as a copy step in the commit f90922cdeef5

> ("update 5.36.1 -> 5.38.0") but was not added back in perl-ptest include

> file.

>

> Borrowed the logic from the above commit to make a copy of config.h

> that is specific to the target architecture. The changes in this commit

> fixes the test failures.

>

> Signed-off-by: Rajendra Desai <rajendra.desai@emerson.com<mailto:rajendra=
.desai@emerson.com>>

> ---

>  meta/recipes-devtools/perl/perl-ptest.inc | 7 ++++++-

>  1 file changed, 6 insertions(+), 1 deletion(-)

>

> diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-dev=
tools/perl/perl-ptest.inc

> index 4b4756118c..49d322a848 100644

> --- a/meta/recipes-devtools/perl/perl-ptest.inc

> +++ b/meta/recipes-devtools/perl/perl-ptest.inc

> @@ -20,6 +20,11 @@ do_install_ptest () {

>

>         ln -sf ${bindir}/perl ${D}${PTEST_PATH}/t/perl

>

> +       # xconfig.h contains references to build host architecture, and y=
et is included from various other places.

> +       # To make it reproducible let's make it a copy of config.h patch =
that is specific to the target architecture.

> +       # It is believed that the original header is the product of build=
ing miniperl (a helper executable built with host compiler).

> +       cp ${D}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/CORE/config.h $=
{D}${PTEST_PATH}/xconfig.h

> +

>         # Remove build host references from various scattered files...

>         find "${D}${PTEST_PATH}" \

>              \( -name '*.PL' -o -name 'myconfig' -o -name 'cflags' -o -na=
me '*.pl' -o -name '*.sh' -o -name '*.pm' \

> @@ -44,7 +49,7 @@ do_install_ptest () {

>          sed -i -e '/Autogenerated starting on/d' ${D}${PTEST_PATH}/lib/u=
nicore/mktables.lst

>

>          # Remove files with host-specific configuration for building nat=
ive binaries

> -        rm ${D}${PTEST_PATH}/Makefile.config ${D}${PTEST_PATH}/xconfig.h=
 ${D}${PTEST_PATH}/xconfig.sh

> +        rm ${D}${PTEST_PATH}/Makefile.config ${D}${PTEST_PATH}/xconfig.sh

>

>           # create an empty file that is checked for existence by makerel=
 test

>           touch ${D}${PTEST_PATH}/win32/Makefile

> --

> 2.34.1

>

>

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

> Links: You receive all messages sent to this group.

> View/Reply Online (#213704): https://urldefense.com/v3/__https://lists.op=
enembedded.org/g/openembedded-core/message/213704__;!!OkyjEqkqqe9UhNQ!wjEJS=
HK1TIHz2yn0Oi1lw3Y-UF75OFnYIaaOb_Mcqh0T7lDj5_xvA-ZdLLpMyQD6k8jsPDw1Q7dsMels=
DTHBBYf-Bw$<https://urldefense.com/v3/__https:/lists.openembedded.org/g/ope=
nembedded-core/message/213704__;!!OkyjEqkqqe9UhNQ!wjEJSHK1TIHz2yn0Oi1lw3Y-U=
F75OFnYIaaOb_Mcqh0T7lDj5_xvA-ZdLLpMyQD6k8jsPDw1Q7dsMelsDTHBBYf-Bw$>

> Mute This Topic: https://urldefense.com/v3/__https://lists.openembedded.o=
rg/mt/111899754/1686489__;!!OkyjEqkqqe9UhNQ!wjEJSHK1TIHz2yn0Oi1lw3Y-UF75OFn=
YIaaOb_Mcqh0T7lDj5_xvA-ZdLLpMyQD6k8jsPDw1Q7dsMelsDTHW92GUqQ$<https://urldef=
ense.com/v3/__https:/lists.openembedded.org/mt/111899754/1686489__;!!OkyjEq=
kqqe9UhNQ!wjEJSHK1TIHz2yn0Oi1lw3Y-UF75OFnYIaaOb_Mcqh0T7lDj5_xvA-ZdLLpMyQD6k=
8jsPDw1Q7dsMelsDTHW92GUqQ$>

> Group Owner: openembedded-core+owner@lists.openembedded.org<mailto:openem=
bedded-core+owner@lists.openembedded.org>

> Unsubscribe: https://urldefense.com/v3/__https://lists.openembedded.org/g=
/openembedded-core/unsub__;!!OkyjEqkqqe9UhNQ!wjEJSHK1TIHz2yn0Oi1lw3Y-UF75OF=
nYIaaOb_Mcqh0T7lDj5_xvA-ZdLLpMyQD6k8jsPDw1Q7dsMelsDTHpsUi45A$<https://urlde=
fense.com/v3/__https:/lists.openembedded.org/g/openembedded-core/unsub__;!!=
OkyjEqkqqe9UhNQ!wjEJSHK1TIHz2yn0Oi1lw3Y-UF75OFnYIaaOb_Mcqh0T7lDj5_xvA-ZdLLp=
MyQD6k8jsPDw1Q7dsMelsDTHpsUi45A$> [alex.kanavin@gmail.com]

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

>

--_000_DS0PR10MB79549ADC3C849A2D68F00BDB89A12DS0PR10MB7954namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:10.0pt;
	font-family:"Aptos",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	font-size:10.0pt;
	font-family:"Aptos",sans-serif;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}
span.EmailStyle24
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1185679849;
	mso-list-type:hybrid;
	mso-list-template-ids:1040250348 -433715934 67698691 67698693 67698689 676=
98691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Aptos",sans-serif;
	mso-fareast-font-family:Aptos;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1
	{mso-list-id:1534030396;
	mso-list-type:hybrid;
	mso-list-template-ids:-1422471548 67698703 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
@list l1:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hi Alexander, thank=
s for the reply.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I tested that the i=
ssue is reproducible on master as well and that is the reason I resubmitted=
 the patch to the master.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">How I tested:<o:p><=
/o:p></span></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l1 level1 =
lfo2"><span style=3D"font-size:11.0pt">Cloned the Yocto Project repository<=
o:p></o:p></span></li><li class=3D"MsoListParagraph" style=3D"margin-left:0=
in;mso-list:l1 level1 lfo2"><span style=3D"font-size:11.0pt">Configured ope=
nembedded-core (targeted to master branch) along with ptest-pkgs<o:p></o:p>=
</span></li><li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-lis=
t:l1 level1 lfo2"><span style=3D"font-size:11.0pt">Built the qemux86-64 ima=
ge<o:p></o:p></span></li><li class=3D"MsoListParagraph" style=3D"margin-lef=
t:0in;mso-list:l1 level1 lfo2"><span style=3D"font-size:11.0pt">Ran the pte=
sts (run-ptest) on the built qemux86-64 image<o:p></o:p></span></li><li cla=
ss=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l1 level1 lfo2"><=
span style=3D"font-size:11.0pt">5 of the mentioned tests failed with =E2=80=
=9CNo such file or directory=E2=80=9D error<br>
(for which, I have explained the details in the patch)<o:p></o:p></span></l=
i></ol>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I am not sure what =
do you mean by =E2=80=9C<i>perl ptest is passing in yocto CI pipelines</i>=
=E2=80=9D. If you are referring to the perl-ptest package,<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">then you would not =
find issues while building perl or its ptest package, but the issue occurs =
when running those 5 perl tests on a target<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">(since it would hav=
e skipped including xconfig.h file which is needed for those 5 tests to be =
successful).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Regards,<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Rajendra<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"> Alexander Kanavin &lt;alex.kan=
avin@gmail.com&gt;
<br>
<b>Sent:</b> Thursday, March 27, 2025 3:23 PM<br>
<b>To:</b> Desai, Rajendra &lt;rajendra.desai@emerson.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org<br>
<b>Subject:</b> [EXTERNAL] Re: [OE-core] [PATCH] perl-ptest: copy xconfig d=
ata from perl source directory<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"mso-line-height-alt:.75pt"><span style=3D"f=
ont-size:1.0pt;font-family:&quot;Arial&quot;,sans-serif;color:white"><o:p><=
/o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-line-height-alt:.75pt"><span style=3D"f=
ont-size:1.0pt;color:white"><o:p></o:p></span></p>
</div>
<pre style=3D"white-space:pre-wrap"><span style=3D"font-size:12.0pt;font-fa=
mily:&quot;Arial&quot;,sans-serif">This doesn't address the feedback given =
previously. Which is:<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">Is the issue occurring on master as well? If so, you need to explain<o:=
p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">why perl ptest is passing in yocto CI pipelines. How can we observe<o:p=
></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">the error on master?<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">Alex<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">On Thu, 27 Mar 2025 at 07:11, Rajendra Desai via<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">lists.openembedded.org<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&lt;<a href=3D"mailto:rajendra.desai=3Demerson.com@lists.openembedded.o=
rg">rajendra.desai=3Demerson.com@lists.openembedded.org</a>&gt; wrote:<o:p>=
</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;<o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; The following perl ptests:<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;<o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;&nbsp;&nbsp; - dist/ExtUtils-ParseXS/t/001-basic<o:p></o:p></span><=
/pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;&nbsp;&nbsp; - dist/ExtUtils-ParseXS/t/002-more<o:p></o:p></span></=
pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;&nbsp;&nbsp; - dist/ExtUtils-ParseXS/t/003-usage<o:p></o:p></span><=
/pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;&nbsp;&nbsp; - cpan/ExtUtils-Constant/t/Constant<o:p></o:p></span><=
/pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;&nbsp;&nbsp; - cpan/ExtUtils-MakeMaker/t/02-xsdynamic<o:p></o:p></s=
pan></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;<o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; are erroring out with:<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; | /usr/lib/perl/ptest/perl_langinfo.h:8:10: fatal error:<o:p></o:p=
></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; xconfig.h: No such file or directory<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; |&nbsp;&nbsp;&nbsp;&nbsp; 8 | #include &quot;xconfig.h&quot;<o:p><=
/o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;<o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; xconfig.h contains references to the build host architecture and w=
as<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; removed by commit 2e0f30c46802 (&quot;perl: do not install files t=
hat contain<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; build host specific data&quot;)<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;<o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; However, it is still included from various other places including =
these<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; tests, and we are still depending on build host architecture data =
by<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; including the patches from perl-cross recipe, a dependency to perl=
 recipe.<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;<o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; xconfig.h was added back as a copy step in the commit f90922cdeef5=
<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; (&quot;update 5.36.1 -&gt; 5.38.0&quot;) but was not added back in=
 perl-ptest include<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; file.<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;<o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; Borrowed the logic from the above commit to make a copy of config.=
h<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; that is specific to the target architecture. The changes in this c=
ommit<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; fixes the test failures.<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;<o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; Signed-off-by: Rajendra Desai &lt;<a href=3D"mailto:rajendra.desai=
@emerson.com">rajendra.desai@emerson.com</a>&gt;<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; ---<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;&nbsp; meta/recipes-devtools/perl/perl-ptest.inc | 7 ++++++-<o:p></=
o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;&nbsp; 1 file changed, 6 insertions(+), 1 deletion(-)<o:p></o:p></s=
pan></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;<o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/reci=
pes-devtools/perl/perl-ptest.inc<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; index 4b4756118c..49d322a848 100644<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; --- a/meta/recipes-devtools/perl/perl-ptest.inc<o:p></o:p></span><=
/pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; +++ b/meta/recipes-devtools/perl/perl-ptest.inc<o:p></o:p></span><=
/pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; @@ -20,6 +20,11 @@ do_install_ptest () {<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;<o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ln -sf ${bindir}/p=
erl ${D}${PTEST_PATH}/t/perl<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;<o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # xconfig.h contains referen=
ces to build host architecture, and yet is included from various other plac=
es.<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # To make it reproducible le=
t's make it a copy of config.h patch that is specific to the target archite=
cture.<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # It is believed that the or=
iginal header is the product of building miniperl (a helper executable buil=
t with host compiler).<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${D}${libdir}/perl5/${PV}=
/${TARGET_ARCH}-linux/CORE/config.h ${D}${PTEST_PATH}/xconfig.h<o:p></o:p><=
/span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; +<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Remove build hos=
t references from various scattered files...<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; find &quot;${D}${P=
TEST_PATH}&quot; \<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; \( -name '*.PL' -o -name 'myconfig' -o -name 'cflags' -o -name =
'*.pl' -o -name '*.sh' -o -name '*.pm' \<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; @@ -44,7 +49,7 @@ do_install_ptest () {<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i -e '/=
Autogenerated starting on/d' ${D}${PTEST_PATH}/lib/unicore/mktables.lst<o:p=
></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;<o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Remove fil=
es with host-specific configuration for building native binaries<o:p></o:p>=
</span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rm ${D}${PTEST_PATH}/M=
akefile.config ${D}${PTEST_PATH}/xconfig.h ${D}${PTEST_PATH}/xconfig.sh<o:p=
></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rm ${D}${PTEST_PATH}/M=
akefile.config ${D}${PTEST_PATH}/xconfig.sh<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;<o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # crea=
te an empty file that is checked for existence by makerel test<o:p></o:p></=
span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; touch =
${D}${PTEST_PATH}/win32/Makefile<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; --<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; 2.34.1<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;<o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;<o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<o:p></o:p></span></p=
re>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; Links: You receive all messages sent to this group.<o:p></o:p></sp=
an></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; View/Reply Online (#213704): <a href=3D"https://urldefense.com/v3/=
__https:/lists.openembedded.org/g/openembedded-core/message/213704__;!!Okyj=
Eqkqqe9UhNQ!wjEJSHK1TIHz2yn0Oi1lw3Y-UF75OFnYIaaOb_Mcqh0T7lDj5_xvA-ZdLLpMyQD=
6k8jsPDw1Q7dsMelsDTHBBYf-Bw$">https://urldefense.com/v3/__https://lists.ope=
nembedded.org/g/openembedded-core/message/213704__;!!OkyjEqkqqe9UhNQ!wjEJSH=
K1TIHz2yn0Oi1lw3Y-UF75OFnYIaaOb_Mcqh0T7lDj5_xvA-ZdLLpMyQD6k8jsPDw1Q7dsMelsD=
THBBYf-Bw$</a><o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; Mute This Topic: <a href=3D"https://urldefense.com/v3/__https:/lis=
ts.openembedded.org/mt/111899754/1686489__;!!OkyjEqkqqe9UhNQ!wjEJSHK1TIHz2y=
n0Oi1lw3Y-UF75OFnYIaaOb_Mcqh0T7lDj5_xvA-ZdLLpMyQD6k8jsPDw1Q7dsMelsDTHW92GUq=
Q$">https://urldefense.com/v3/__https://lists.openembedded.org/mt/111899754=
/1686489__;!!OkyjEqkqqe9UhNQ!wjEJSHK1TIHz2yn0Oi1lw3Y-UF75OFnYIaaOb_Mcqh0T7l=
Dj5_xvA-ZdLLpMyQD6k8jsPDw1Q7dsMelsDTHW92GUqQ$</a><o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.opene=
mbedded.org">openembedded-core+owner@lists.openembedded.org</a><o:p></o:p><=
/span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/lists.o=
penembedded.org/g/openembedded-core/unsub__;!!OkyjEqkqqe9UhNQ!wjEJSHK1TIHz2=
yn0Oi1lw3Y-UF75OFnYIaaOb_Mcqh0T7lDj5_xvA-ZdLLpMyQD6k8jsPDw1Q7dsMelsDTHpsUi4=
5A$">https://urldefense.com/v3/__https://lists.openembedded.org/g/openembed=
ded-core/unsub__;!!OkyjEqkqqe9UhNQ!wjEJSHK1TIHz2yn0Oi1lw3Y-UF75OFnYIaaOb_Mc=
qh0T7lDj5_xvA-ZdLLpMyQD6k8jsPDw1Q7dsMelsDTHpsUi45A$</a> [alex.kanavin@gmail=
.com]<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<o:p></o:p></span></p=
re>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;<o:p>&nbsp;</o:p></span></pre>
</div>
</body>
</html>

--_000_DS0PR10MB79549ADC3C849A2D68F00BDB89A12DS0PR10MB7954namp_--

