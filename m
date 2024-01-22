Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104F6C4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 11:01:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.70938.1705921152607260233
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 02:59:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=j0v7MOEQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17513ef42b=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40MAf65Q024345
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 02:59:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=5gDlibbpW6XS9gTDPGL
	zJ33VQT1OfXo2a0gjo4f0x7U=; b=j0v7MOEQ7C4W2MqiTSZHtbVp4H3G+uZwUZp
	+T3daZHCcPq5YNdI9b8Tz880cl/KrN0xRxvKuu4/ATKh55Pb65ui630VkwH6xv9y
	b0Bu6BA9OkpBo0rGEx3C3f85//b97kbiyjWCvBSIxsC/CTkL//FVrvnm2FANdRNR
	wBOizrwHT4HPDdusmLtuV+mSPE0kNBpbGBHLc/zlXhDdsz1QJe4R1+R3e33vyQOJ
	QzqmUuz7e28zT9AVnm4ulouaGOy7gmkbl4KRMqfZpBiIe0io2CRRsD/p2+OoP4Ft
	tNcYg8il3N0AnSuaI1trC2+Y3JMW8lRe8ye3zXihFBJ14QLVACw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vrab4sk9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 02:59:11 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40MAxBsD014540
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 02:59:11 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vrab4sk9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 02:59:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIsOAWb4h/KtZe/e6GCwpm2gmY3VaD4EqaPcbmCrsKBIfoWeJhGsmdBwdsL9DYoJ+IcvcjLbZwDgktQo6kB5WZAI6R6kFDHJbJzoD+xhTEXR14tgazgvV7+rtCRBdVIG3jKxcdJg+wrl6OCX38Bpxsi2Ui9pb+Tbgta50mrSW2PEVr6YOhaRXX1nm/le6WHfT+UQw/AhYCWK9txdvZy/HOO8w/KsFjmBCRJXoUpQ7dlTvgqobNHiVxqJZJAQFZO4ofXweeoXerlE9V7tpGKeipPSQaOskHF5g75NAw1ikVlXKD2a3EM6wnqdv4lQAL5aY0zxm45samF0ue3Nm2TMow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gDlibbpW6XS9gTDPGLzJ33VQT1OfXo2a0gjo4f0x7U=;
 b=WSFxUlaFcaGa8nQ8sYvPKaLQDR3Fd13Gxeg5adAGL7wzzBM7SO2OAhIaFJtqUO5De9a552nLNu71RJ2zYfM3Zpp0TvBBgz9UKEZFR9rzF92JaghpZdr3h+3om+nPDff2gW+YFtMNRl+xbNAJ2HGLDeCPOPfxKyDQNHUzGge/DvS0HX2SWFWT4lJJINddaKXcFjYyp1Cw3YNcKzh/x+bSiuB/s5EnfbkvxCtFdbAuhMLxD5GjG9y8PSAepvkmq5MvgC+TnMItBnBdxuUi+GEIQlRkSFD1VWEjH3HP505/2YXD6CxuiDb2I4TvvV+Lrbc+4dHc7tyIMm683pWS+qhNDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH0PR11MB7445.namprd11.prod.outlook.com (2603:10b6:510:26e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.27; Mon, 22 Jan
 2024 10:59:08 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.033; Mon, 22 Jan 2024
 10:59:08 +0000
Message-ID: <53d0b908-39af-4eb4-bbeb-2e3511c5d48c@windriver.com>
Date: Mon, 22 Jan 2024 03:01:42 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] rust: Enable rust oe-selftest.
To: Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-core@lists.openembedded.org,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
References: <20240119150907.3840110-1-Yash.Shinde@windriver.com>
 <20240119150907.3840110-5-Yash.Shinde@windriver.com>
 <e06788dd-2104-40fc-923c-11c4bfbbac0d@windriver.com>
From: "Shinde, Yash" <Yash.Shinde@windriver.com>
In-Reply-To: <e06788dd-2104-40fc-923c-11c4bfbbac0d@windriver.com>
X-ClientProxiedBy: BYAPR05CA0063.namprd05.prod.outlook.com
 (2603:10b6:a03:74::40) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|PH0PR11MB7445:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a079658-c520-4b8f-9648-08dc1b39286b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zZ25kLaYFw1HWuMMS8wQAH7HqkdMxy82mRirIkLt33WeO0BUEIQUW/A96njeGDBrtKD8yIJgOkI5l2t663ZqLJBx/13JY60gJJZGvGtiBjnegv6P3Xcq/AFipmTHYeoKhKs767lsLPW1NlaD9iIY5GaRPSJninfBmvCyzvCYsZ9GkLlqmunBt6jaMO6UE4M9axnUF6FO+wm60V3m1skRfZfBqSnxM0z3xfyxn3DZzYaIzPR1aTjyl/B1dFSYFf2SlxCR26IFXor1o8Ado7c+6GnbSDSLYszd+x6lazQU8tSWpdlF32/Yeq5slvFuFUEBsb7EicfrptIh1tiFwGg0Fkdqf6yKfUDX1pId80/Hwbih9Ph6Vkcq1HTFFPqWgnzlN4FBn91Y/XbhkA/nxITG+JsteVy4MGQCkcyRvzR4k65H9xDautU5ppWl+VZrf6TR5lb3URhIJyhumn4oCdXA6L06zayblqfyZKLauN9IoTEID7z/gV9DwjQnYO7lqpYV9WhuQDtEJNo/zEyxXDN9o3VRI53BTtx6YRhhULb56Pot3Brarox0/fqGUJ71pqauGApMvuvunWhCcj9U9X8AEMKsZ3FDRa/tjZaGDvG4WczIpU9qVn8KA6gcvHASJ4m/Jo71LQZ53G3dk5Ua/tCLOismpTZfWjryp0dFz12kvTiL9vyMaBFbjcvW7yYJkCSv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(136003)(346002)(39850400004)(230922051799003)(230273577357003)(230173577357003)(451199024)(1800799012)(64100799003)(186009)(6506007)(26005)(107886003)(2616005)(33964004)(53546011)(6512007)(83380400001)(5660300002)(30864003)(41300700001)(66476007)(8936002)(4326008)(8676002)(478600001)(316002)(110136005)(66946007)(66556008)(6486002)(2906002)(36756003)(86362001)(38100700002)(166002)(31696002)(31686004)(45980500001)(43740500002)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SkdpOW5JaGg3cmhSN2J0dmNMWVlBZEpjdmhDVmxJTzVNcUtQN0Jlb21RMHp5?=
 =?utf-8?B?SG1xUExoSEN3ZWdCZzVQSWhOOWRVRGJNWk1Ba21UUlRwVXBEdkh3SUpCUlF1?=
 =?utf-8?B?RXB2LzkzbnQ5cUJ3UDk4NUJuQjVLazNVWXZWT21KVHNJZmdJSU1KNzE0Nzh6?=
 =?utf-8?B?ZUFQNnVsZk9QZnBCNXpueW4wNmp0YTRlYm9QTm5BWm1SalNld1prTzQvd0xC?=
 =?utf-8?B?UTVoVTRaYjNyQjZYYTgxNTZCS1hWWUhJZGFZUXZXL0N0RndwUy9qVzFFeDhp?=
 =?utf-8?B?M1RqWDBabWZ4RHVmMU9vS0JGaHNIVjZ0RVRvckVnMUlDM2h6V0QwaC95Y01n?=
 =?utf-8?B?YjQ1THZMSDUxY1p1U0JzUDExenlCdXR6ZkRvT2ZhTlZDd1IzcDVlUHY4a1F2?=
 =?utf-8?B?WnczL05aeEFUeHBFMU51ZGM2eTdTOGVDTzJES01UblhnaTRjNEZndTRoWHBk?=
 =?utf-8?B?OEZxeElwSmdZb1ptRXZGZ0Q0cXBPbHBRQ2d2bmNiUkxyaHpCWGZmVjF6SUZ1?=
 =?utf-8?B?dU1xSldTcnJHdlpYRjBwUXBvc2FlT3hsbkhtc1p1bmpJcituMlNZZ29TbVBQ?=
 =?utf-8?B?VGtTb1Jab0ptdHFsNVp5UlhNTWVSRk10anAvZDNiSHd4Z0Fna3creE05d2t4?=
 =?utf-8?B?bzRkb2x5ZTc1dm9mZkxQeHl4a2ptZmlXVFVOd0MyWkx3VUFldFdtM25hS3VO?=
 =?utf-8?B?UHVHR0lwRnN1aSt5VlBvcVZ6QU51SmMvVmIzVElKZ3A2dWk1TkVvWlpuUFBz?=
 =?utf-8?B?a1ZUWVpyNFkyYzhHQ0Nhc2xoVnBYbEw0V0RRMEN3OU8wMjEwRmdta3JBc2M2?=
 =?utf-8?B?TlA0aFBIVjkzZEFEU25BbkkyeTFsSDZIT0NkcW05TWJXcEplQXdUZnZpc05a?=
 =?utf-8?B?ZTEycTcyRTBJUUpZRHFoWWtoZHY4RFVMaDRHUlEwTVlNbk9tTlFOcUs3eGNT?=
 =?utf-8?B?N0syaXJFTXZUNVlLSjlERFBabkVPWnZVSmxpTzlJUmlJbWxIcVhxbmx5ZGR4?=
 =?utf-8?B?ZE5RREJ3UzczOWtGcEl4cWp1UEZZbTFndWxENHRXTmxwcHRuRzBhcktBUkxM?=
 =?utf-8?B?Sm9mLzNvemhWNUxVRFdwVEczUDNtMmVaeURhQmNVaHBVdXhmYXlxQVVoTW54?=
 =?utf-8?B?RjQ2TzdkMWFMdW5VVFE1b1JZZ1hvMUdGd0hleFQyY3I3S0tJNlVPMjlzVXFF?=
 =?utf-8?B?ZlYrVy82N2NEZ1d4SlM4WGd4VUV1Qi9OU2V3MFpRYjV2eGQ2UlVRYlh5eXU4?=
 =?utf-8?B?UjRvdUxOcGpSWW5tWDlINENDNng2bTYwN0JuZ3ZjSGJLY3VYOEJFNjlHTmtE?=
 =?utf-8?B?WW9ob05hRlFYaUdySGVOU2NubXFtcnhOU0swMWkzUWZ3OERqVW9STnpYQXRv?=
 =?utf-8?B?Zk5xY3dRK3VDdng3LzlPT1hpRCt0engxcVBDaHFUT1p3NDZEY0V3OTR3YXo1?=
 =?utf-8?B?SVhWZXFCVWwreVFXVHh6Rmg0VlZ4eUNEbmVHM1dyWjg2bGtpN1d6bE5BMzNQ?=
 =?utf-8?B?ZDJqeVNNcDdNZCtsM0VoREZGQUpiemxLZmlLTDJxK0NFMjF3SHh2MU56dnJn?=
 =?utf-8?B?b1NkWHQ5Y3NnZ2xjK3pTRDNWcTdCQlUwVVJqczIrMkxNaXJ2N1NPcUFzWGoy?=
 =?utf-8?B?dXdpK2FTbjY4Ry9sN0NwSVJYTUF1WEJ6cm9yUnF2aHFDcE1vWGM4Vmh6eTBi?=
 =?utf-8?B?amR2bmxvWTFKV2ZVSENMYnhwWEVkQlh1bzRLdHRwdUpVcGVGNFpXRmNvN0d4?=
 =?utf-8?B?Ni9MR2prZU1VVmQ0REpzeVg2eFZPK25jYlA2dHlZZEpITTQxcE1hOHhoVzg5?=
 =?utf-8?B?ZFloUFFVMWpLcmtua3ZBRmZUeFc5TVBYN0tHYXEyMnhBSitpZE1vK2tyVmtm?=
 =?utf-8?B?aXRvaExFZzc0MkxIdHNVMkwybFkzUWNZS1hqQXdaejk4Mk1ndEhGaHVDek1C?=
 =?utf-8?B?eExnVWxxSU03YW55OVZ1bGxvU2hMMFJTWkloTGFQeC9OcHlGVVJBVDBOUVA4?=
 =?utf-8?B?NzR1a3RSbi9XbXRjaUNPb1lNdXpMWkl2K1FmU1JZYUliaXdGdjBwdjRxY1Fq?=
 =?utf-8?B?QTVYNGloejdzT29CVTl5R3NKakNtcjI4RXJiSXgwK1ZONlQ5eGNWZklZOXZj?=
 =?utf-8?B?LytNczJpTU9SOEJvaTlVS2liblE0V2l1WEFaWWxjOHpGT3JrTzFpRWxDM3V0?=
 =?utf-8?B?YlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a079658-c520-4b8f-9648-08dc1b39286b
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 10:59:08.8474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZndsWZ9VSBUE2iO/kuy7Co9U3JgQRKmOCqit7fU5nLh/+MMBbQavpd1jTM78eGfbbLx39kI5cWSLJ5JDX/P5BDefdk8x196HYgIdSJA4Io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7445
X-Proofpoint-ORIG-GUID: ZkMjl-zEqzd7CMwAXY8bBsdbpp2phrsR
X-Proofpoint-GUID: lgo0vp6W0K6W0oXh02Opq-_nwGfosCG7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_01,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401220078
X-Old-Date: Mon, 22 Jan 2024 16:29:07 +0530
Content-Type: multipart/alternative;
 boundary="------------npYP9COCTmES5xz0NerbZiyC"
Content-Language: en-US
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 11:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194142
Message-ID: <20240122110142.QiwrXVlKkQMxQ8oj3smzgvSVby-JJZMBtkh9ERn3jeI@z>

--------------npYP9COCTmES5xz0NerbZiyC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 40MAf65Q024345

On 20-01-2024 22:31, Randy MacLeod wrote:

>=20
> I like that you have broken the original patch down into 5 patches that
> are easier to
> understand.
>=20
> On 2024-01-19 10:09 a.m., Yash.Shinde@windriver.com wrote:
>=20
>> From: Yash Shinde <Yash.Shinde@windriver.com> ( Yash.Shinde@windriver.co=
m )
>>=20
>>=20
>> Tests which are failing from below modules are added to exclude list
>>=20
>> tests/run-make
>> 	tests/rustdoc
>> 	tests/mir-opt
>> 	tests/ui-fulldeps
>>=20
>> *
>> Redundent test cases whose parent dir is also present in  exclud list ar=
e
>> removed.
>>=20
>> * Newly addded tests are sorted and updated.
>>=20
>> * Overall exclude
>> tests count in exclude list is now reduced to 114.
>=20
> We need to resolve the mips32 problems that Richard pointed out.
>=20
>=20
> Should we skip all the rust tests for mips32?
>=20
>=20

In previous oe-selftest implementation, we skipped rust tests for mips32.
I think we should continue with it as rust tests are unstable with mips32.

>=20
>=20
>=20
>=20
>=20
> Please submit a v3 with the mips fix/avoidance and split this exclude lis=
t
> commit down into 3 steps:
>=20
> 1. Sort the existing list of tests
> 2. Remove the test cases whose parent dir is also present in the exclude
> list
>=20
> 3. Add the new tests that are to be excluded.
>=20
>=20
>=20
> This may seem really pedantic but otherwise the changes are really hard t=
o
> review.
>=20
>=20
>=20
> The way I think about this is that someone looking at the commit log migh=
t
> be interested
> in exactly which tests are in being added to the exclude list so that
> should be clear from 3.
> 1. won't really be of interest so most people will skip over that
> 2. also won't be of interest to most people
> but you need 1 and 2 to make 3 be apparent to people who want that info
> quickly.
>=20
>=20

For 1 the existing list of tests are already sorted.
I will send a v3 with separate commits for:

1. newly added test cases
2. removing test cases whose parent dir is also present in the exclude list
3. sorting the overall final list

Regards,
Yash

>=20
>=20
>=20
> Thanks,
>=20
>=20
>=20
> ../Randy
>=20
>=20
>> * The testing is done on arm32, arm64, mips64, x86 and  x86_64 targets.
>>=20
>> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com> (
>> Yash.Shinde@windriver.com )
>> ---
>>  meta/lib/oeqa/selftest/cases/rust.py    =20
>> | 165 +++++----------------
>>  meta/recipes-devtools/rust/rust-source.inc |=20
>> 4 +
>>  2 files changed, 43 insertions(+), 126 deletions(-)
>>=20
>> diff --git
>> a/meta/lib/oeqa/selftest/cases/rust.py
>> b/meta/lib/oeqa/selftest/cases/rust.py
>> index 6dbc517006..7d0efb1b01 100644
>> --- a/meta/lib/oeqa/selftest/cases/rust.py
>> +++
>> b/meta/lib/oeqa/selftest/cases/rust.py
>> @@ -40,7 +40,7 @@ def
>> parse_results(filename):
>>  class
>> RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
>>   =20
>> def test_rust(self, *args, **kwargs):
>>          # Disable Rust Oe-selftest
>> -        self.skipTest("The Rust Oe-selftest is disabled.")
>> +      =20
>> #self.skipTest("The Rust Oe-selftest is disabled.")
>> =20
>>          # build
>> remote-test-server before image build
>>          recipe =3D "rust "
>> @@ -73,156 +73,90 @@ class
>> RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
>>   =20
>> 'src/librustdoc',
>>                              'src/rustdoc-json-types',
>> =20
>> 'src/tools/compiletest/src/common.rs',
>> +                          =20
>> 'src/tools/jsondoclint',
>>                            =20
>> 'src/tools/lint-docs',
>> +                          =20
>> 'src/tools/replace-version-placeholder',
>>                            =20
>> 'src/tools/rust-analyzer',
>>                            =20
>> 'src/tools/rustdoc-themes',
>>                              'src/tools/tidy',
>> 'tests/assembly/asm/aarch64-outline-atomics.rs',
>> +                       =20
>> 'tests/codegen/abi-efiapi.rs',
>> +                          =20
>> 'tests/codegen/abi-efiapi.rs',
>>                            =20
>> 'tests/codegen/abi-main-signature-32bit-c-int.rs',
>>                       =20
>> 'tests/codegen/abi-repr-ext.rs',
>> +                          =20
>> 'tests/codegen/abi-sysv64.rs',
>>                            =20
>> 'tests/codegen/abi-x86-interrupt.rs',
>> +                          =20
>> 'tests/codegen/align-byval.rs',
>> +                          =20
>> 'tests/codegen/align-fn.rs',
>> +                          =20
>> 'tests/codegen/asm-powerpc-clobbers.rs',
>> +                          =20
>> 'tests/codegen/async-fn-debug-awaitee-field.rs',
>> +                       =20
>> 'tests/codegen/binary-search-index-no-bound-check.rs',
>>                   =20
>> 'tests/codegen/branch-protection.rs',
>> +                          =20
>> 'tests/codegen/call-metadata.rs',
>>                            =20
>> 'tests/codegen/catch-unwind.rs',
>>                            =20
>> 'tests/codegen/cf-protection.rs',
>> +                          =20
>> 'tests/codegen/debug-column.rs',
>> +                          =20
>> 'tests/codegen/debug-limited.rs',
>> +                          =20
>> 'tests/codegen/debuginfo-generic-closure-env-names.rs',
>> +                =20
>> 'tests/codegen/drop.rs',
>> +                          =20
>> 'tests/codegen/dst-vtable-align-nonzero.rs',
>> +                          =20
>> 'tests/codegen/enable-lto-unit-splitting.rs',
>>                            =20
>> 'tests/codegen/enum-bounds-check-derived-idx.rs',
>> +                      =20
>> 'tests/codegen/enum/enum-u128.rs',
>> +                          =20
>> 'tests/codegen/fn-impl-trait-self.rs',
>>                            =20
>> 'tests/codegen/force-unwind-tables.rs',
>> +                          =20
>> 'tests/codegen/inherit_overflow.rs',
>> +                          =20
>> 'tests/codegen/inherit_overflow.rs',
>> +                          =20
>> 'tests/codegen/inline-function-args-debug-info.rs',
>>                      =20
>> 'tests/codegen/intrinsic-no-unnamed-attr.rs',
>> +                          =20
>> 'tests/codegen/intrinsics/mask.rs',
>> +                          =20
>> 'tests/codegen/intrinsics/transmute-niched.rs',
>>                          =20
>> 'tests/codegen/issues/issue-103840.rs',
>>                            =20
>> 'tests/codegen/issues/issue-47278.rs',
>> +                          =20
>> 'tests/codegen/issues/issue-73258.rs',
>>                            =20
>> 'tests/codegen/issues/issue-73827-bounds-check-index-in-subexpr.rs',
>> +   =20
>> 'tests/codegen/issues/issue-75546.rs',
>> +                          =20
>> 'tests/codegen/issues/issue-77812.rs',
>> +                          =20
>> 'tests/codegen/issues/issue-98156-const-arg-temp-lifetime.rs',
>>           =20
>> 'tests/codegen/lifetime_start_end.rs',
>> +                          =20
>> 'tests/codegen/llvm-ident.rs',
>>                            =20
>> 'tests/codegen/local-generics-in-exe-internalized.rs',
>> +                 =20
>> 'tests/codegen/mainsubprogram.rs',
>>                            =20
>> 'tests/codegen/match-unoptimized.rs',
>> +                          =20
>> 'tests/codegen/move-operands.rs',
>>                            =20
>> 'tests/codegen/noalias-rwlockreadguard.rs',
>>                            =20
>> 'tests/codegen/non-terminate/nonempty-infinite-loop.rs',
>>                 =20
>> 'tests/codegen/noreturn-uninhabited.rs',
>>                            =20
>> 'tests/codegen/repr-transparent-aggregates-3.rs',
>> +                      =20
>> 'tests/codegen/repr/transparent-mips64.rs',
>>                            =20
>> 'tests/codegen/sse42-implies-crc32.rs',
>>                            =20
>> 'tests/codegen/thread-local.rs',
>>                            =20
>> 'tests/codegen/uninit-consts.rs',
>> +                          =20
>> 'tests/mir-opt/',
>>                            =20
>> 'tests/pretty/raw-str-nonexpr.rs',
>>                            =20
>> 'tests/run-make',
>> -                          =20
>> 'tests/run-make/cdylib-fewer-symbols/foo.rs',
>> -                          =20
>> 'tests/run-make/doctests-keep-binaries/t.rs',
>> -                          =20
>> 'tests/run-make-fulldeps',
>> -                          =20
>> 'tests/run-make/issue-22131/foo.rs',
>> -                          =20
>> 'tests/run-make/issue-36710/Makefile',
>> -                          =20
>> 'tests/run-make/issue-47551',
>> -                          =20
>> 'tests/run-make/pgo-branch-weights',
>> -                          =20
>> 'tests/run-make/pgo-gen',
>> -                          =20
>> 'tests/run-make/pgo-gen-lto',
>> -                          =20
>> 'tests/run-make/pgo-indirect-call-promotion',
>> -                          =20
>> 'tests/run-make/pgo-use',
>> -                          =20
>> 'tests/run-make/pointer-auth-link-with-c/Makefile',
>> -                    =20
>> 'tests/run-make/profile',
>> -                          =20
>> 'tests/run-make/static-pie',
>> -                          =20
>> 'tests/run-make/sysroot-crates-are-unstable',
>> -                          =20
>> 'tests/run-make/target-specs',
>>                            =20
>> 'tests/rustdoc',
>> -                          =20
>> 'tests/rustdoc/async-move-doctest.rs',
>> -                          =20
>> 'tests/rustdoc/async-trait.rs',
>> -                          =20
>> 'tests/rustdoc/auto-traits.rs',
>> -                          =20
>> 'tests/rustdoc/check-source-code-urls-to-def.rs',
>> -                      =20
>> 'tests/rustdoc/comment-in-doctest.rs',
>> -                          =20
>> 'tests/rustdoc/const-generics/const-generics-docs.rs',
>> -                 =20
>> 'tests/rustdoc/cross-crate-hidden-assoc-trait-items.rs',
>> -               =20
>> 'tests/rustdoc/cross-crate-hidden-impl-parameter.rs',
>> -                  =20
>> 'tests/rustdoc/cross-crate-links.rs',
>> -                          =20
>> 'tests/rustdoc/cross-crate-primitive-doc.rs',
>> -                          =20
>> 'tests/rustdoc/doctest-manual-crate-name.rs',
>> -                          =20
>> 'tests/rustdoc/edition-doctest.rs',
>> -                          =20
>> 'tests/rustdoc/edition-flag.rs',
>> -                          =20
>> 'tests/rustdoc/elided-lifetime.rs',
>> -                          =20
>> 'tests/rustdoc/external-macro-src.rs',
>> -                          =20
>> 'tests/rustdoc/extern-html-root-url.rs',
>> -                          =20
>> 'tests/rustdoc/extern-impl-trait.rs',
>> -                          =20
>> 'tests/rustdoc/hide-unstable-trait.rs',
>> -                          =20
>> 'tests/rustdoc/inline_cross/add-docs.rs',
>> -                          =20
>> 'tests/rustdoc/inline_cross/default-trait-method.rs',
>> -                  =20
>> 'tests/rustdoc/inline_cross/dyn_trait.rs',
>> -                          =20
>> 'tests/rustdoc/inline_cross/impl_trait.rs',
>> -                          =20
>> 'tests/rustdoc/inline_cross/issue-24183.rs',
>> -                          =20
>> 'tests/rustdoc/inline_cross/macros.rs',
>> -                          =20
>> 'tests/rustdoc/inline_cross/trait-vis.rs',
>> -                          =20
>> 'tests/rustdoc/inline_cross/use_crate.rs',
>> -                          =20
>> 'tests/rustdoc/intra-doc-crate/self.rs',
>> -                          =20
>> 'tests/rustdoc/intra-doc/cross-crate/additional_doc.rs',
>> -               =20
>> 'tests/rustdoc/intra-doc/cross-crate/basic.rs',
>> -                        =20
>> 'tests/rustdoc/intra-doc/cross-crate/crate.rs',
>> -                        =20
>> 'tests/rustdoc/intra-doc/cross-crate/hidden.rs',
>> -                       =20
>> 'tests/rustdoc/intra-doc/cross-crate/macro.rs',
>> -                        =20
>> 'tests/rustdoc/intra-doc/cross-crate/module.rs',
>> -                       =20
>> 'tests/rustdoc/intra-doc/cross-crate/submodule-inner.rs',
>> -              =20
>> 'tests/rustdoc/intra-doc/cross-crate/submodule-outer.rs',
>> -              =20
>> 'tests/rustdoc/intra-doc/cross-crate/traits.rs',
>> -                       =20
>> 'tests/rustdoc/intra-doc/extern-builtin-type-impl.rs',
>> -                 =20
>> 'tests/rustdoc/intra-doc/extern-crate-only-used-in-link.rs',
>> -           =20
>> 'tests/rustdoc/intra-doc/extern-crate.rs',
>> -                          =20
>> 'tests/rustdoc/intra-doc/extern-inherent-impl.rs',
>> -                     =20
>> 'tests/rustdoc/intra-doc/extern-reference-link.rs',
>> -                    =20
>> 'tests/rustdoc/intra-doc/issue-103463.rs',
>> -                          =20
>> 'tests/rustdoc/intra-doc/issue-104145.rs',
>> -                          =20
>> 'tests/rustdoc/intra-doc/issue-66159.rs',
>> -                          =20
>> 'tests/rustdoc/intra-doc/pub-use.rs',
>> -                          =20
>> 'tests/rustdoc/intra-doc/reexport-additional-docs.rs',
>> -                 =20
>> 'tests/rustdoc/issue-18199.rs',
>> -                          =20
>> 'tests/rustdoc/issue-23106.rs',
>> -                          =20
>> 'tests/rustdoc/issue-23744.rs',
>> -                          =20
>> 'tests/rustdoc/issue-25944.rs',
>> -                          =20
>> 'tests/rustdoc/issue-30252.rs',
>> -                          =20
>> 'tests/rustdoc/issue-38129.rs',
>> -                          =20
>> 'tests/rustdoc/issue-40936.rs',
>> -                          =20
>> 'tests/rustdoc/issue-43153.rs',
>> -                          =20
>> 'tests/rustdoc/issue-46727.rs',
>> -                          =20
>> 'tests/rustdoc/issue-48377.rs',
>> -                          =20
>> 'tests/rustdoc/issue-48414.rs',
>> -                          =20
>> 'tests/rustdoc/issue-53689.rs',
>> -                          =20
>> 'tests/rustdoc/issue-54478-demo-allocator.rs',
>> -                         =20
>> 'tests/rustdoc/issue-57180.rs',
>> -                          =20
>> 'tests/rustdoc/issue-61592.rs',
>> -                          =20
>> 'tests/rustdoc/issue-73061-cross-crate-opaque-assoc-type.rs',
>> -          =20
>> 'tests/rustdoc/issue-75588.rs',
>> -                          =20
>> 'tests/rustdoc/issue-85454.rs',
>> -                          =20
>> 'tests/rustdoc/issue-86620.rs',
>> -                          =20
>> 'tests/rustdoc-json',
>>                              'tests/rustdoc-js-std',
>> -                            'tests/rustdoc/macro_pub_in_module.rs',
>> -   =20
>> 'tests/rustdoc/masked.rs',
>> -                          =20
>> 'tests/rustdoc/normalize-assoc-item.rs',
>> -                          =20
>> 'tests/rustdoc/no-stack-overflow-25295.rs',
>> -                          =20
>> 'tests/rustdoc/primitive-reexport.rs',
>> -                          =20
>> 'tests/rustdoc/process-termination.rs',
>> -                          =20
>> 'tests/rustdoc/pub-extern-crate.rs',
>> -                          =20
>> 'tests/rustdoc/pub-use-extern-macros.rs',
>> -                          =20
>> 'tests/rustdoc/reexport-check.rs',
>> -                          =20
>> 'tests/rustdoc/reexport-dep-foreign-fn.rs',
>> -                          =20
>> 'tests/rustdoc/reexport-doc.rs',
>> -                          =20
>> 'tests/rustdoc/reexports-priv.rs',
>> -                          =20
>> 'tests/rustdoc/reexports.rs',
>> -                          =20
>> 'tests/rustdoc/rustc,-incoherent-impls.rs',
>> -                          =20
>> 'tests/rustdoc/test_option_check/bar.rs',
>> -                          =20
>> 'tests/rustdoc/test_option_check/test.rs',
>> -                          =20
>> 'tests/rustdoc/trait-alias-mention.rs',
>> -                          =20
>> 'tests/rustdoc/trait-visibility.rs',
>> +                          =20
>> 'tests/rustdoc-json',
>>                            =20
>> 'tests/rustdoc-ui/cfg-test.rs',
>>                            =20
>> 'tests/rustdoc-ui/check-cfg-test.rs',
>>                            =20
>> 'tests/rustdoc-ui/display-output.rs',
>>                            =20
>> 'tests/rustdoc-ui/doc-comment-multi-line-attr.rs',
>>                       =20
>> 'tests/rustdoc-ui/doc-comment-multi-line-cfg-attr.rs',
>>                   =20
>> 'tests/rustdoc-ui/doc-test-doctest-feature.rs',
>> +                        =20
>> 'tests/rustdoc-ui/doc-test-rustdoc-feature.rs',
>>                          =20
>> 'tests/rustdoc-ui/doctest-multiline-crate-attribute.rs',
>>                 =20
>> 'tests/rustdoc-ui/doctest-output.rs',
>> -                          =20
>> 'tests/rustdoc-ui/doc-test-rustdoc-feature.rs',
>>                          =20
>> 'tests/rustdoc-ui/failed-doctest-compile-fail.rs',
>>                       =20
>> 'tests/rustdoc-ui/issue-80992.rs',
>>                            =20
>> 'tests/rustdoc-ui/issue-91134.rs',
>> +                          =20
>> 'tests/rustdoc-ui/no-run-flag.rs',
>>                            =20
>> 'tests/rustdoc-ui/nocapture-fail.rs',
>>                            =20
>> 'tests/rustdoc-ui/nocapture.rs',
>> -                          =20
>> 'tests/rustdoc-ui/no-run-flag.rs',
>>                            =20
>> 'tests/rustdoc-ui/run-directory.rs',
>>                            =20
>> 'tests/rustdoc-ui/test-no_std.rs',
>>                            =20
>> 'tests/rustdoc-ui/test-type.rs',
>> -                          =20
>> 'tests/rustdoc/unit-return.rs',
>> +                          =20
>> 'tests/ui-fulldeps/',
>>                            =20
>> 'tests/ui/abi/stack-probes-lto.rs',
>>                            =20
>> 'tests/ui/abi/stack-probes.rs',
>>                            =20
>> 'tests/ui/array-slice-vec/subslice-patterns-const-eval-match.rs',
>> @@
>> -233,31 +167,10 @@ class RustSelfTestSystemEmulated(OESelftestTestCase,
>> OEPTestResultTestCase):
>>                            =20
>> 'tests/ui/debuginfo/debuginfo-emit-llvm-ir-and-split-debuginfo.rs',
>>      =20
>> 'tests/ui/drop/dynamic-drop.rs',
>>                            =20
>> 'tests/ui/empty_global_asm.rs',
>> -                          =20
>> 'tests/ui-fulldeps/deriving-encodable-decodable-box.rs',
>> -               =20
>> 'tests/ui-fulldeps/deriving-encodable-decodable-cell-refcell.rs',
>> -      =20
>> 'tests/ui-fulldeps/deriving-global.rs',
>> -                          =20
>> 'tests/ui-fulldeps/deriving-hygiene.rs',
>> -                          =20
>> 'tests/ui-fulldeps/dropck_tarena_sound_drop.rs',
>> -                       =20
>> 'tests/ui-fulldeps/empty-struct-braces-derive.rs',
>> -                     =20
>> 'tests/ui-fulldeps/internal-lints/bad_opt_access.rs',
>> -                  =20
>> 'tests/ui-fulldeps/internal-lints/bad_opt_access.stderr',
>> -              =20
>> 'tests/ui-fulldeps/internal-lints/default_hash_types.rs',
>> -              =20
>> 'tests/ui-fulldeps/internal-lints/diagnostics.rs',
>> -                     =20
>> 'tests/ui-fulldeps/internal-lints/lint_pass_impl_without_macro.rs',
>> -    =20
>> 'tests/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs',
>> -            =20
>> 'tests/ui-fulldeps/internal-lints/query_stability.rs',
>> -                 =20
>> 'tests/ui-fulldeps/internal-lints/rustc_pass_by_value.rs',
>> -             =20
>> 'tests/ui-fulldeps/internal-lints/ty_tykind_usage.rs',
>> -                 =20
>> 'tests/ui-fulldeps/issue-14021.rs',
>> -                          =20
>> 'tests/ui-fulldeps/lint-group-denied-lint-allowed.rs',
>> -                 =20
>> 'tests/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs',
>> -            =20
>> 'tests/ui-fulldeps/lint-pass-macros.rs',
>> -                          =20
>> 'tests/ui-fulldeps/regions-mock-tcx.rs',
>> -                          =20
>> 'tests/ui-fulldeps/rustc_encodable_hygiene.rs',
>> -                        =20
>> 'tests/ui-fulldeps/session-diagnostic/enforce_slug_naming.rs',
>>           =20
>> 'tests/ui/functions-closures/fn-help-with-err.rs',
>>                       =20
>> 'tests/ui/linkage-attr/issue-10755.rs',
>>                            =20
>> 'tests/ui/macros/restricted-shadowing-legacy.rs',
>> +                      =20
>> 'tests/ui/numbers-arithmetic/u128.rs',
>>                            =20
>> 'tests/ui/process/nofile-limit.rs',
>>                            =20
>> 'tests/ui/process/process-panic-after-fork.rs',
>>                          =20
>> 'tests/ui/process/process-sigpipe.rs',
>> diff --git
>> a/meta/recipes-devtools/rust/rust-source.inc
>> b/meta/recipes-devtools/rust/rust-source.inc
>> index 83a0dbc15f..e02829e6b3
>> 100644
>> --- a/meta/recipes-devtools/rust/rust-source.inc
>> +++
>> b/meta/recipes-devtools/rust/rust-source.inc
>> @@ -10,6 +10,10 @@ SRC_URI +=3D
>> " (
>> @@-73,156+73,90@@classRustSelfTestSystemEmulated(OESelftestTestCase,OEPT=
estResultTestCase):'src/librustdoc','src/rustdoc-json-types','src/tools/com=
piletest/src/common.rs',+'src/tools/jsondoclint','src/tools/lint-docs',+'sr=
c/tools/replace-version-placeholder','src/tools/rust-analyzer','src/tools/r=
ustdoc-themes','src/tools/tidy','tests/assembly/asm/aarch64-outline-atomics=
.rs',+'tests/codegen/abi-efiapi.rs',+'tests/codegen/abi-efiapi.rs','tests/c=
odegen/abi-main-signature-32bit-c-int.rs','tests/codegen/abi-repr-ext.rs',+=
'tests/codegen/abi-sysv64.rs','tests/codegen/abi-x86-interrupt.rs',+'tests/=
codegen/align-byval.rs',+'tests/codegen/align-fn.rs',+'tests/codegen/asm-po=
werpc-clobbers.rs',+'tests/codegen/async-fn-debug-awaitee-field.rs',+'tests=
/codegen/binary-search-index-no-bound-check.rs','tests/codegen/branch-prote=
ction.rs',+'tests/codegen/call-metadata.rs','tests/codegen/catch-unwind.rs'=
,'tests/codegen/cf-protection.rs',+'tests/codegen/debug-column.rs',+'tests/=
codegen/debug-limited.rs',+'tests/codegen/debuginfo-generic-closure-env-nam=
es.rs',+'tests/codegen/drop.rs',+'tests/codegen/dst-vtable-align-nonzero.rs=
',+'tests/codegen/enable-lto-unit-splitting.rs','tests/codegen/enum-bounds-=
check-derived-idx.rs',+'tests/codegen/enum/enum-u128.rs',+'tests/codegen/fn=
-impl-trait-self.rs','tests/codegen/force-unwind-tables.rs',+'tests/codegen=
/inherit_overflow.rs',+'tests/codegen/inherit_overflow.rs',+'tests/codegen/=
inline-function-args-debug-info.rs','tests/codegen/intrinsic-no-unnamed-att=
r.rs',+'tests/codegen/intrinsics/mask.rs',+'tests/codegen/intrinsics/transm=
ute-niched.rs','tests/codegen/issues/issue-103840.rs','tests/codegen/issues=
/issue-47278.rs',+'tests/codegen/issues/issue-73258.rs','tests/codegen/issu=
es/issue-73827-bounds-check-index-in-subexpr.rs',+'tests/codegen/issues/iss=
ue-75546.rs',+'tests/codegen/issues/issue-77812.rs',+'tests/codegen/issues/=
issue-98156-const-arg-temp-lifetime.rs','tests/codegen/lifetime_start_end.r=
s',+'tests/codegen/llvm-ident.rs','tests/codegen/local-generics-in-exe-inte=
rnalized.rs',+'tests/codegen/mainsubprogram.rs','tests/codegen/match-unopti=
mized.rs',+'tests/codegen/move-operands.rs','tests/codegen/noalias-rwlockre=
adguard.rs','tests/codegen/non-terminate/nonempty-infinite-loop.rs','tests/=
codegen/noreturn-uninhabited.rs','tests/codegen/repr-transparent-aggregates=
-3.rs',+'tests/codegen/repr/transparent-mips64.rs','tests/codegen/sse42-imp=
lies-crc32.rs','tests/codegen/thread-local.rs','tests/codegen/uninit-consts=
.rs',+'tests/mir-opt/','tests/pretty/raw-str-nonexpr.rs','tests/run-make',-=
'tests/run-make/cdylib-fewer-symbols/foo.rs',-'tests/run-make/doctests-keep=
-binaries/t.rs',-'tests/run-make-fulldeps',-'tests/run-make/issue-22131/foo=
.rs',-'tests/run-make/issue-36710/Makefile',-'tests/run-make/issue-47551',-=
'tests/run-make/pgo-branch-weights',-'tests/run-make/pgo-gen',-'tests/run-m=
ake/pgo-gen-lto',-'tests/run-make/pgo-indirect-call-promotion',-'tests/run-=
make/pgo-use',-'tests/run-make/pointer-auth-link-with-c/Makefile',-'tests/r=
un-make/profile',-'tests/run-make/static-pie',-'tests/run-make/sysroot-crat=
es-are-unstable',-'tests/run-make/target-specs','tests/rustdoc',-'tests/rus=
tdoc/async-move-doctest.rs',-'tests/rustdoc/async-trait.rs',-'tests/rustdoc=
/auto-traits.rs',-'tests/rustdoc/check-source-code-urls-to-def.rs',-'tests/=
rustdoc/comment-in-doctest.rs',-'tests/rustdoc/const-generics/const-generic=
s-docs.rs',-'tests/rustdoc/cross-crate-hidden-assoc-trait-items.rs',-'tests=
/rustdoc/cross-crate-hidden-impl-parameter.rs',-'tests/rustdoc/cross-crate-=
links.rs',-'tests/rustdoc/cross-crate-primitive-doc.rs',-'tests/rustdoc/doc=
test-manual-crate-name.rs',-'tests/rustdoc/edition-doctest.rs',-'tests/rust=
doc/edition-flag.rs',-'tests/rustdoc/elided-lifetime.rs',-'tests/rustdoc/ex=
ternal-macro-src.rs',-'tests/rustdoc/extern-html-root-url.rs',-'tests/rustd=
oc/extern-impl-trait.rs',-'tests/rustdoc/hide-unstable-trait.rs',-'tests/ru=
stdoc/inline_cross/add-docs.rs',-'tests/rustdoc/inline_cross/default-trait-=
method.rs',-'tests/rustdoc/inline_cross/dyn_trait.rs',-'tests/rustdoc/inlin=
e_cross/impl_trait.rs',-'tests/rustdoc/inline_cross/issue-24183.rs',-'tests=
/rustdoc/inline_cross/macros.rs',-'tests/rustdoc/inline_cross/trait-vis.rs'=
,-'tests/rustdoc/inline_cross/use_crate.rs',-'tests/rustdoc/intra-doc-crate=
/self.rs',-'tests/rustdoc/intra-doc/cross-crate/additional_doc.rs',-'tests/=
rustdoc/intra-doc/cross-crate/basic.rs',-'tests/rustdoc/intra-doc/cross-cra=
te/crate.rs',-'tests/rustdoc/intra-doc/cross-crate/hidden.rs',-'tests/rustd=
oc/intra-doc/cross-crate/macro.rs',-'tests/rustdoc/intra-doc/cross-crate/mo=
dule.rs',-'tests/rustdoc/intra-doc/cross-crate/submodule-inner.rs',-'tests/=
rustdoc/intra-doc/cross-crate/submodule-outer.rs',-'tests/rustdoc/intra-doc=
/cross-crate/traits.rs',-'tests/rustdoc/intra-doc/extern-builtin-type-impl.=
rs',-'tests/rustdoc/intra-doc/extern-crate-only-used-in-link.rs',-'tests/ru=
stdoc/intra-doc/extern-crate.rs',-'tests/rustdoc/intra-doc/extern-inherent-=
impl.rs',-'tests/rustdoc/intra-doc/extern-reference-link.rs',-'tests/rustdo=
c/intra-doc/issue-103463.rs',-'tests/rustdoc/intra-doc/issue-104145.rs',-'t=
ests/rustdoc/intra-doc/issue-66159.rs',-'tests/rustdoc/intra-doc/pub-use.rs=
',-'tests/rustdoc/intra-doc/reexport-additional-docs.rs',-'tests/rustdoc/is=
sue-18199.rs',-'tests/rustdoc/issue-23106.rs',-'tests/rustdoc/issue-23744.r=
s',-'tests/rustdoc/issue-25944.rs',-'tests/rustdoc/issue-30252.rs',-'tests/=
rustdoc/issue-38129.rs',-'tests/rustdoc/issue-40936.rs',-'tests/rustdoc/iss=
ue-43153.rs',-'tests/rustdoc/issue-46727.rs',-'tests/rustdoc/issue-48377.rs=
',-'tests/rustdoc/issue-48414.rs',-'tests/rustdoc/issue-53689.rs',-'tests/r=
ustdoc/issue-54478-demo-allocator.rs',-'tests/rustdoc/issue-57180.rs',-'tes=
ts/rustdoc/issue-61592.rs',-'tests/rustdoc/issue-73061-cross-crate-opaque-a=
ssoc-type.rs',-'tests/rustdoc/issue-75588.rs',-'tests/rustdoc/issue-85454.r=
s',-'tests/rustdoc/issue-86620.rs',-'tests/rustdoc-json','tests/rustdoc-js-=
std',-'tests/rustdoc/macro_pub_in_module.rs',-'tests/rustdoc/masked.rs',-'t=
ests/rustdoc/normalize-assoc-item.rs',-'tests/rustdoc/no-stack-overflow-252=
95.rs',-'tests/rustdoc/primitive-reexport.rs',-'tests/rustdoc/process-termi=
nation.rs',-'tests/rustdoc/pub-extern-crate.rs',-'tests/rustdoc/pub-use-ext=
ern-macros.rs',-'tests/rustdoc/reexport-check.rs',-'tests/rustdoc/reexport-=
dep-foreign-fn.rs',-'tests/rustdoc/reexport-doc.rs',-'tests/rustdoc/reexpor=
ts-priv.rs',-'tests/rustdoc/reexports.rs',-'tests/rustdoc/rustc,-incoherent=
-impls.rs',-'tests/rustdoc/test_option_check/bar.rs',-'tests/rustdoc/test_o=
ption_check/test.rs',-'tests/rustdoc/trait-alias-mention.rs',-'tests/rustdo=
c/trait-visibility.rs',+'tests/rustdoc-json','tests/rustdoc-ui/cfg-test.rs'=
,'tests/rustdoc-ui/check-cfg-test.rs','tests/rustdoc-ui/display-output.rs',=
'tests/rustdoc-ui/doc-comment-multi-line-attr.rs','tests/rustdoc-ui/doc-com=
ment-multi-line-cfg-attr.rs','tests/rustdoc-ui/doc-test-doctest-feature.rs'=
,+'tests/rustdoc-ui/doc-test-rustdoc-feature.rs','tests/rustdoc-ui/doctest-=
multiline-crate-attribute.rs','tests/rustdoc-ui/doctest-output.rs',-'tests/=
rustdoc-ui/doc-test-rustdoc-feature.rs','tests/rustdoc-ui/failed-doctest-co=
mpile-fail.rs','tests/rustdoc-ui/issue-80992.rs','tests/rustdoc-ui/issue-91=
134.rs',+'tests/rustdoc-ui/no-run-flag.rs','tests/rustdoc-ui/nocapture-fail=
.rs','tests/rustdoc-ui/nocapture.rs',-'tests/rustdoc-ui/no-run-flag.rs','te=
sts/rustdoc-ui/run-directory.rs','tests/rustdoc-ui/test-no_std.rs','tests/r=
ustdoc-ui/test-type.rs',-'tests/rustdoc/unit-return.rs',+'tests/ui-fulldeps=
/','tests/ui/abi/stack-probes-lto.rs','tests/ui/abi/stack-probes.rs','tests=
/ui/array-slice-vec/subslice-patterns-const-eval-match.rs',@@-233,31+167,10=
@@classRustSelfTestSystemEmulated(OESelftestTestCase,OEPTestResultTestCase)=
:'tests/ui/debuginfo/debuginfo-emit-llvm-ir-and-split-debuginfo.rs','tests/=
ui/drop/dynamic-drop.rs','tests/ui/empty_global_asm.rs',-'tests/ui-fulldeps=
/deriving-encodable-decodable-box.rs',-'tests/ui-fulldeps/deriving-encodabl=
e-decodable-cell-refcell.rs',-'tests/ui-fulldeps/deriving-global.rs',-'test=
s/ui-fulldeps/deriving-hygiene.rs',-'tests/ui-fulldeps/dropck_tarena_sound_=
drop.rs',-'tests/ui-fulldeps/empty-struct-braces-derive.rs',-'tests/ui-full=
deps/internal-lints/bad_opt_access.rs',-'tests/ui-fulldeps/internal-lints/b=
ad_opt_access.stderr',-'tests/ui-fulldeps/internal-lints/default_hash_types=
.rs',-'tests/ui-fulldeps/internal-lints/diagnostics.rs',-'tests/ui-fulldeps=
/internal-lints/lint_pass_impl_without_macro.rs',-'tests/ui-fulldeps/intern=
al-lints/qualified_ty_ty_ctxt.rs',-'tests/ui-fulldeps/internal-lints/query_=
stability.rs',-'tests/ui-fulldeps/internal-lints/rustc_pass_by_value.rs',-'=
tests/ui-fulldeps/internal-lints/ty_tykind_usage.rs',-'tests/ui-fulldeps/is=
sue-14021.rs',-'tests/ui-fulldeps/lint-group-denied-lint-allowed.rs',-'test=
s/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs',-'tests/ui-fulldeps/l=
int-pass-macros.rs',-'tests/ui-fulldeps/regions-mock-tcx.rs',-'tests/ui-ful=
ldeps/rustc_encodable_hygiene.rs',-'tests/ui-fulldeps/session-diagnostic/en=
force_slug_naming.rs','tests/ui/functions-closures/fn-help-with-err.rs','te=
sts/ui/linkage-attr/issue-10755.rs','tests/ui/macros/restricted-shadowing-l=
egacy.rs',+'tests/ui/numbers-arithmetic/u128.rs','tests/ui/process/nofile-l=
imit.rs','tests/ui/process/process-panic-after-fork.rs','tests/ui/process/p=
rocess-sigpipe.rs',diff--gita/meta/recipes-devtools/rust/rust-source.incb/m=
eta/recipes-devtools/rust/rust-source.incindex83a0dbc15f..e02829e6b3100644-=
--a/meta/recipes-devtools/rust/rust-source.inc+++b/meta/recipes-devtools/ru=
st/rust-source.inc@@-10,6+10,10@@SRC_URI+=3D
>> ) https://static.rust-lang.org/dist/rustc-$ {RUST_VERSION}-src.tar.xz;n
>>   =20
>> file://0004-musl-Define-O_LARGEFILE-for-riscv32.patch;patchdir=3D$ {RUST=
SRC}
>> \
>>              file://0005-musl-Define-SOCK_SEQPACKET-in-common-place.patc=
h;patchdir=3D$
>> {RUSTSRC} \
>>              file://0001-Revert-Map-source-absolute-paths-to-OUT_DIR-as-=
relat.patch;patchdir=3D$
>> {RUSTSRC} \
>> +            file://cargo-path.patch;patchdir=3D$ {RUSTSRC} \
>> +            file://custom-target-cfg.patch;patchdir=3D$ {RUSTSRC} \
>> +      =20
>> file://rustc-bootstrap.patch;patchdir=3D$ {RUSTSRC} \
>> +            file://target-build-value.patch;patchdir=3D$ {RUSTSRC} \
>>  "
>>=20
>> SRC_URI[rust.sha256sum] =3D
>> "b98c09d968529212fb29eec7d6d3e9bdaa869810679b7fb86a1ca69469d75f5e"
>> =20
>>=20
>=20
>=20
>=20
>=20
>=20
> --=20
> # Randy MacLeod
> # Wind River Linux

--------------npYP9COCTmES5xz0NerbZiyC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p>&nbsp;</p>
<div class=3D"moz-cite-prefix">On 20-01-2024 22:31, Randy MacLeod wrote:</d=
iv>
<blockquote cite=3D"mid:e06788dd-2104-40fc-923c-11c4bfbbac0d@windriver.com"=
>
<div class=3D"moz-cite-prefix">I like that you have broken the original pat=
ch down into 5 patches that are easier to<br />understand.</div>
<div class=3D"moz-cite-prefix">&nbsp;</div>
<div class=3D"moz-cite-prefix">On 2024-01-19 10:09 a.m., <a class=3D"moz-tx=
t-link-abbreviated moz-txt-link-freetext" href=3D"mailto:Yash.Shinde@windri=
ver.com" target=3D"_blank" rel=3D"nofollow noopener">Yash.Shinde@windriver.=
com</a> wrote:</div>
<blockquote cite=3D"mid:20240119150907.3840110-5-Yash.Shinde@windriver.com"=
>
<pre class=3D"moz-quote-pre">From: Yash Shinde <a class=3D"moz-txt-link-rfc=
2396E" href=3D"mailto:Yash.Shinde@windriver.com" target=3D"_blank" rel=3D"n=
ofollow noopener">&lt;Yash.Shinde@windriver.com&gt;</a>

Tests which are failing from below modules are added to exclude list
	tests/run-make
	tests/rustdoc
	tests/mir-opt
	tests/ui-fulldeps

* Redundent test cases whose parent dir is also present in  exclud list are=
 removed.

* Newly addded tests are sorted and updated.

* Overall exclude tests count in exclude list is now reduced to 114.</pre>
</blockquote>
We need to resolve the mips32 problems that Richard pointed out.<br />
<p>Should we skip all the rust tests for mips32?</p>
</blockquote>
In previous oe-selftest implementation, we skipped rust tests for mips32.<b=
r />I think we should continue with it as rust tests are unstable with mips=
32.<br /><br />
<blockquote cite=3D"mid:e06788dd-2104-40fc-923c-11c4bfbbac0d@windriver.com"=
>
<p>&nbsp;</p>
Please submit a v3 with the mips fix/avoidance and split this exclude list =
commit down into 3 steps:<br /><br />&nbsp;1. Sort the existing list of tes=
ts<br />&nbsp;2. Remove the <span>test cases whose parent dir is also prese=
nt in the exclude list </span>
<p>&nbsp;3. Add the new tests that are to be excluded.</p>
<p>This may seem really pedantic but otherwise the changes are really hard =
to review.</p>
<p>The way I think about this is that someone looking at the commit log mig=
ht be interested<br />in exactly which tests are in being added to the excl=
ude list so that should be clear from 3.<br />1. won't really be of interes=
t so most people will skip over that<br />2. also won't be of interest to m=
ost people <br />but you need 1 and 2 to make 3 be apparent to people who w=
ant that info quickly.</p>
</blockquote>
<p>For 1 the existing list of tests are already sorted.<br />I will send a =
v3 with separate commits for:<br /><br />1. newly added test cases<br />2. =
removing test cases <span>whose parent dir is also present in the exclude l=
ist<br /></span>3. sorting the overall final list<span><br /></span></p>
<p>&nbsp;</p>
<p><span>Regards, <br /></span><span>Yash </span></p>
<blockquote cite=3D"mid:e06788dd-2104-40fc-923c-11c4bfbbac0d@windriver.com"=
>
<p>Thanks,</p>
<p>../Randy</p>
<blockquote cite=3D"mid:20240119150907.3840110-5-Yash.Shinde@windriver.com"=
>
<pre class=3D"moz-quote-pre">* The testing is done on arm32, arm64, mips64,=
 x86 and  x86_64 targets.

Signed-off-by: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:Yash.Shinde@windriver.com" target=3D"_blank" rel=3D"nofollow noopener">&l=
t;Yash.Shinde@windriver.com&gt;</a>
---
 meta/lib/oeqa/selftest/cases/rust.py       | 165 +++++----------------
 meta/recipes-devtools/rust/rust-source.inc |   4 +
 2 files changed, 43 insertions(+), 126 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/=
cases/rust.py
index 6dbc517006..7d0efb1b01 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -40,7 +40,7 @@ def parse_results(filename):
 class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase=
):
     def test_rust(self, *args, **kwargs):
         # Disable Rust Oe-selftest
-        self.skipTest("The Rust Oe-selftest is disabled.")
+        #self.skipTest("The Rust Oe-selftest is disabled.")
=20
         # build remote-test-server before image build
         recipe =3D "rust<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
@@-73,156+73,90@@classRustSelfTestSystemEmulated(OESelftestTestCase,OEPTest=
ResultTestCase):'src/librustdoc','src/rustdoc-json-types','src/tools/compil=
etest/src/common.rs',+'src/tools/jsondoclint','src/tools/lint-docs',+'src/t=
ools/replace-version-placeholder','src/tools/rust-analyzer','src/tools/rust=
doc-themes','src/tools/tidy','tests/assembly/asm/aarch64-outline-atomics.rs=
',+'tests/codegen/abi-efiapi.rs',+'tests/codegen/abi-efiapi.rs','tests/code=
gen/abi-main-signature-32bit-c-int.rs','tests/codegen/abi-repr-ext.rs',+'te=
sts/codegen/abi-sysv64.rs','tests/codegen/abi-x86-interrupt.rs',+'tests/cod=
egen/align-byval.rs',+'tests/codegen/align-fn.rs',+'tests/codegen/asm-power=
pc-clobbers.rs',+'tests/codegen/async-fn-debug-awaitee-field.rs',+'tests/co=
degen/binary-search-index-no-bound-check.rs','tests/codegen/branch-protecti=
on.rs',+'tests/codegen/call-metadata.rs','tests/codegen/catch-unwind.rs','t=
ests/codegen/cf-protection.rs',+'tests/codegen/debug-column.rs',+'tests/cod=
egen/debug-limited.rs',+'tests/codegen/debuginfo-generic-closure-env-names.=
rs',+'tests/codegen/drop.rs',+'tests/codegen/dst-vtable-align-nonzero.rs',+=
'tests/codegen/enable-lto-unit-splitting.rs','tests/codegen/enum-bounds-che=
ck-derived-idx.rs',+'tests/codegen/enum/enum-u128.rs',+'tests/codegen/fn-im=
pl-trait-self.rs','tests/codegen/force-unwind-tables.rs',+'tests/codegen/in=
herit_overflow.rs',+'tests/codegen/inherit_overflow.rs',+'tests/codegen/inl=
ine-function-args-debug-info.rs','tests/codegen/intrinsic-no-unnamed-attr.r=
s',+'tests/codegen/intrinsics/mask.rs',+'tests/codegen/intrinsics/transmute=
-niched.rs','tests/codegen/issues/issue-103840.rs','tests/codegen/issues/is=
sue-47278.rs',+'tests/codegen/issues/issue-73258.rs','tests/codegen/issues/=
issue-73827-bounds-check-index-in-subexpr.rs',+'tests/codegen/issues/issue-=
75546.rs',+'tests/codegen/issues/issue-77812.rs',+'tests/codegen/issues/iss=
ue-98156-const-arg-temp-lifetime.rs','tests/codegen/lifetime_start_end.rs',=
+'tests/codegen/llvm-ident.rs','tests/codegen/local-generics-in-exe-interna=
lized.rs',+'tests/codegen/mainsubprogram.rs','tests/codegen/match-unoptimiz=
ed.rs',+'tests/codegen/move-operands.rs','tests/codegen/noalias-rwlockreadg=
uard.rs','tests/codegen/non-terminate/nonempty-infinite-loop.rs','tests/cod=
egen/noreturn-uninhabited.rs','tests/codegen/repr-transparent-aggregates-3.=
rs',+'tests/codegen/repr/transparent-mips64.rs','tests/codegen/sse42-implie=
s-crc32.rs','tests/codegen/thread-local.rs','tests/codegen/uninit-consts.rs=
',+'tests/mir-opt/','tests/pretty/raw-str-nonexpr.rs','tests/run-make',-'te=
sts/run-make/cdylib-fewer-symbols/foo.rs',-'tests/run-make/doctests-keep-bi=
naries/t.rs',-'tests/run-make-fulldeps',-'tests/run-make/issue-22131/foo.rs=
',-'tests/run-make/issue-36710/Makefile',-'tests/run-make/issue-47551',-'te=
sts/run-make/pgo-branch-weights',-'tests/run-make/pgo-gen',-'tests/run-make=
/pgo-gen-lto',-'tests/run-make/pgo-indirect-call-promotion',-'tests/run-mak=
e/pgo-use',-'tests/run-make/pointer-auth-link-with-c/Makefile',-'tests/run-=
make/profile',-'tests/run-make/static-pie',-'tests/run-make/sysroot-crates-=
are-unstable',-'tests/run-make/target-specs','tests/rustdoc',-'tests/rustdo=
c/async-move-doctest.rs',-'tests/rustdoc/async-trait.rs',-'tests/rustdoc/au=
to-traits.rs',-'tests/rustdoc/check-source-code-urls-to-def.rs',-'tests/rus=
tdoc/comment-in-doctest.rs',-'tests/rustdoc/const-generics/const-generics-d=
ocs.rs',-'tests/rustdoc/cross-crate-hidden-assoc-trait-items.rs',-'tests/ru=
stdoc/cross-crate-hidden-impl-parameter.rs',-'tests/rustdoc/cross-crate-lin=
ks.rs',-'tests/rustdoc/cross-crate-primitive-doc.rs',-'tests/rustdoc/doctes=
t-manual-crate-name.rs',-'tests/rustdoc/edition-doctest.rs',-'tests/rustdoc=
/edition-flag.rs',-'tests/rustdoc/elided-lifetime.rs',-'tests/rustdoc/exter=
nal-macro-src.rs',-'tests/rustdoc/extern-html-root-url.rs',-'tests/rustdoc/=
extern-impl-trait.rs',-'tests/rustdoc/hide-unstable-trait.rs',-'tests/rustd=
oc/inline_cross/add-docs.rs',-'tests/rustdoc/inline_cross/default-trait-met=
hod.rs',-'tests/rustdoc/inline_cross/dyn_trait.rs',-'tests/rustdoc/inline_c=
ross/impl_trait.rs',-'tests/rustdoc/inline_cross/issue-24183.rs',-'tests/ru=
stdoc/inline_cross/macros.rs',-'tests/rustdoc/inline_cross/trait-vis.rs',-'=
tests/rustdoc/inline_cross/use_crate.rs',-'tests/rustdoc/intra-doc-crate/se=
lf.rs',-'tests/rustdoc/intra-doc/cross-crate/additional_doc.rs',-'tests/rus=
tdoc/intra-doc/cross-crate/basic.rs',-'tests/rustdoc/intra-doc/cross-crate/=
crate.rs',-'tests/rustdoc/intra-doc/cross-crate/hidden.rs',-'tests/rustdoc/=
intra-doc/cross-crate/macro.rs',-'tests/rustdoc/intra-doc/cross-crate/modul=
e.rs',-'tests/rustdoc/intra-doc/cross-crate/submodule-inner.rs',-'tests/rus=
tdoc/intra-doc/cross-crate/submodule-outer.rs',-'tests/rustdoc/intra-doc/cr=
oss-crate/traits.rs',-'tests/rustdoc/intra-doc/extern-builtin-type-impl.rs'=
,-'tests/rustdoc/intra-doc/extern-crate-only-used-in-link.rs',-'tests/rustd=
oc/intra-doc/extern-crate.rs',-'tests/rustdoc/intra-doc/extern-inherent-imp=
l.rs',-'tests/rustdoc/intra-doc/extern-reference-link.rs',-'tests/rustdoc/i=
ntra-doc/issue-103463.rs',-'tests/rustdoc/intra-doc/issue-104145.rs',-'test=
s/rustdoc/intra-doc/issue-66159.rs',-'tests/rustdoc/intra-doc/pub-use.rs',-=
'tests/rustdoc/intra-doc/reexport-additional-docs.rs',-'tests/rustdoc/issue=
-18199.rs',-'tests/rustdoc/issue-23106.rs',-'tests/rustdoc/issue-23744.rs',=
-'tests/rustdoc/issue-25944.rs',-'tests/rustdoc/issue-30252.rs',-'tests/rus=
tdoc/issue-38129.rs',-'tests/rustdoc/issue-40936.rs',-'tests/rustdoc/issue-=
43153.rs',-'tests/rustdoc/issue-46727.rs',-'tests/rustdoc/issue-48377.rs',-=
'tests/rustdoc/issue-48414.rs',-'tests/rustdoc/issue-53689.rs',-'tests/rust=
doc/issue-54478-demo-allocator.rs',-'tests/rustdoc/issue-57180.rs',-'tests/=
rustdoc/issue-61592.rs',-'tests/rustdoc/issue-73061-cross-crate-opaque-asso=
c-type.rs',-'tests/rustdoc/issue-75588.rs',-'tests/rustdoc/issue-85454.rs',=
-'tests/rustdoc/issue-86620.rs',-'tests/rustdoc-json','tests/rustdoc-js-std=
',-'tests/rustdoc/macro_pub_in_module.rs',-'tests/rustdoc/masked.rs',-'test=
s/rustdoc/normalize-assoc-item.rs',-'tests/rustdoc/no-stack-overflow-25295.=
rs',-'tests/rustdoc/primitive-reexport.rs',-'tests/rustdoc/process-terminat=
ion.rs',-'tests/rustdoc/pub-extern-crate.rs',-'tests/rustdoc/pub-use-extern=
-macros.rs',-'tests/rustdoc/reexport-check.rs',-'tests/rustdoc/reexport-dep=
-foreign-fn.rs',-'tests/rustdoc/reexport-doc.rs',-'tests/rustdoc/reexports-=
priv.rs',-'tests/rustdoc/reexports.rs',-'tests/rustdoc/rustc,-incoherent-im=
pls.rs',-'tests/rustdoc/test_option_check/bar.rs',-'tests/rustdoc/test_opti=
on_check/test.rs',-'tests/rustdoc/trait-alias-mention.rs',-'tests/rustdoc/t=
rait-visibility.rs',+'tests/rustdoc-json','tests/rustdoc-ui/cfg-test.rs','t=
ests/rustdoc-ui/check-cfg-test.rs','tests/rustdoc-ui/display-output.rs','te=
sts/rustdoc-ui/doc-comment-multi-line-attr.rs','tests/rustdoc-ui/doc-commen=
t-multi-line-cfg-attr.rs','tests/rustdoc-ui/doc-test-doctest-feature.rs',+'=
tests/rustdoc-ui/doc-test-rustdoc-feature.rs','tests/rustdoc-ui/doctest-mul=
tiline-crate-attribute.rs','tests/rustdoc-ui/doctest-output.rs',-'tests/rus=
tdoc-ui/doc-test-rustdoc-feature.rs','tests/rustdoc-ui/failed-doctest-compi=
le-fail.rs','tests/rustdoc-ui/issue-80992.rs','tests/rustdoc-ui/issue-91134=
.rs',+'tests/rustdoc-ui/no-run-flag.rs','tests/rustdoc-ui/nocapture-fail.rs=
','tests/rustdoc-ui/nocapture.rs',-'tests/rustdoc-ui/no-run-flag.rs','tests=
/rustdoc-ui/run-directory.rs','tests/rustdoc-ui/test-no_std.rs','tests/rust=
doc-ui/test-type.rs',-'tests/rustdoc/unit-return.rs',+'tests/ui-fulldeps/',=
'tests/ui/abi/stack-probes-lto.rs','tests/ui/abi/stack-probes.rs','tests/ui=
/array-slice-vec/subslice-patterns-const-eval-match.rs',@@-233,31+167,10@@c=
lassRustSelfTestSystemEmulated(OESelftestTestCase,OEPTestResultTestCase):'t=
ests/ui/debuginfo/debuginfo-emit-llvm-ir-and-split-debuginfo.rs','tests/ui/=
drop/dynamic-drop.rs','tests/ui/empty_global_asm.rs',-'tests/ui-fulldeps/de=
riving-encodable-decodable-box.rs',-'tests/ui-fulldeps/deriving-encodable-d=
ecodable-cell-refcell.rs',-'tests/ui-fulldeps/deriving-global.rs',-'tests/u=
i-fulldeps/deriving-hygiene.rs',-'tests/ui-fulldeps/dropck_tarena_sound_dro=
p.rs',-'tests/ui-fulldeps/empty-struct-braces-derive.rs',-'tests/ui-fulldep=
s/internal-lints/bad_opt_access.rs',-'tests/ui-fulldeps/internal-lints/bad_=
opt_access.stderr',-'tests/ui-fulldeps/internal-lints/default_hash_types.rs=
',-'tests/ui-fulldeps/internal-lints/diagnostics.rs',-'tests/ui-fulldeps/in=
ternal-lints/lint_pass_impl_without_macro.rs',-'tests/ui-fulldeps/internal-=
lints/qualified_ty_ty_ctxt.rs',-'tests/ui-fulldeps/internal-lints/query_sta=
bility.rs',-'tests/ui-fulldeps/internal-lints/rustc_pass_by_value.rs',-'tes=
ts/ui-fulldeps/internal-lints/ty_tykind_usage.rs',-'tests/ui-fulldeps/issue=
-14021.rs',-'tests/ui-fulldeps/lint-group-denied-lint-allowed.rs',-'tests/u=
i-fulldeps/lint-group-forbid-always-trumps-cli.rs',-'tests/ui-fulldeps/lint=
-pass-macros.rs',-'tests/ui-fulldeps/regions-mock-tcx.rs',-'tests/ui-fullde=
ps/rustc_encodable_hygiene.rs',-'tests/ui-fulldeps/session-diagnostic/enfor=
ce_slug_naming.rs','tests/ui/functions-closures/fn-help-with-err.rs','tests=
/ui/linkage-attr/issue-10755.rs','tests/ui/macros/restricted-shadowing-lega=
cy.rs',+'tests/ui/numbers-arithmetic/u128.rs','tests/ui/process/nofile-limi=
t.rs','tests/ui/process/process-panic-after-fork.rs','tests/ui/process/proc=
ess-sigpipe.rs',diff--gita/meta/recipes-devtools/rust/rust-source.incb/meta=
/recipes-devtools/rust/rust-source.incindex83a0dbc15f..e02829e6b3100644---a=
/meta/recipes-devtools/rust/rust-source.inc+++b/meta/recipes-devtools/rust/=
rust-source.inc@@-10,6+10,10@@SRC_URI+=3D" target=3D"_blank" rel=3D"nofollo=
w noopener">"
@@ -73,156 +73,90 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, O=
EPTestResultTestCase):
                             'src/librustdoc',
                             'src/rustdoc-json-types',
                             'src/tools/compiletest/src/common.rs',
+                            'src/tools/jsondoclint',
                             'src/tools/lint-docs',
+                            'src/tools/replace-version-placeholder',
                             'src/tools/rust-analyzer',
                             'src/tools/rustdoc-themes',
                             'src/tools/tidy',
                             'tests/assembly/asm/aarch64-outline-atomics.rs=
',
+                            'tests/codegen/abi-efiapi.rs',
+                            'tests/codegen/abi-efiapi.rs',
                             'tests/codegen/abi-main-signature-32bit-c-int.=
rs',
                             'tests/codegen/abi-repr-ext.rs',
+                            'tests/codegen/abi-sysv64.rs',
                             'tests/codegen/abi-x86-interrupt.rs',
+                            'tests/codegen/align-byval.rs',
+                            'tests/codegen/align-fn.rs',
+                            'tests/codegen/asm-powerpc-clobbers.rs',
+                            'tests/codegen/async-fn-debug-awaitee-field.rs=
',
+                            'tests/codegen/binary-search-index-no-bound-ch=
eck.rs',
                             'tests/codegen/branch-protection.rs',
+                            'tests/codegen/call-metadata.rs',
                             'tests/codegen/catch-unwind.rs',
                             'tests/codegen/cf-protection.rs',
+                            'tests/codegen/debug-column.rs',
+                            'tests/codegen/debug-limited.rs',
+                            'tests/codegen/debuginfo-generic-closure-env-n=
ames.rs',
+                            'tests/codegen/drop.rs',
+                            'tests/codegen/dst-vtable-align-nonzero.rs',
+                            'tests/codegen/enable-lto-unit-splitting.rs',
                             'tests/codegen/enum-bounds-check-derived-idx.r=
s',
+                            'tests/codegen/enum/enum-u128.rs',
+                            'tests/codegen/fn-impl-trait-self.rs',
                             'tests/codegen/force-unwind-tables.rs',
+                            'tests/codegen/inherit_overflow.rs',
+                            'tests/codegen/inherit_overflow.rs',
+                            'tests/codegen/inline-function-args-debug-info=
.rs',
                             'tests/codegen/intrinsic-no-unnamed-attr.rs',
+                            'tests/codegen/intrinsics/mask.rs',
+                            'tests/codegen/intrinsics/transmute-niched.rs'=
,
                             'tests/codegen/issues/issue-103840.rs',
                             'tests/codegen/issues/issue-47278.rs',
+                            'tests/codegen/issues/issue-73258.rs',
                             'tests/codegen/issues/issue-73827-bounds-check=
-index-in-subexpr.rs',
+                            'tests/codegen/issues/issue-75546.rs',
+                            'tests/codegen/issues/issue-77812.rs',
+                            'tests/codegen/issues/issue-98156-const-arg-te=
mp-lifetime.rs',
                             'tests/codegen/lifetime_start_end.rs',
+                            'tests/codegen/llvm-ident.rs',
                             'tests/codegen/local-generics-in-exe-internali=
zed.rs',
+                            'tests/codegen/mainsubprogram.rs',
                             'tests/codegen/match-unoptimized.rs',
+                            'tests/codegen/move-operands.rs',
                             'tests/codegen/noalias-rwlockreadguard.rs',
                             'tests/codegen/non-terminate/nonempty-infinite=
-loop.rs',
                             'tests/codegen/noreturn-uninhabited.rs',
                             'tests/codegen/repr-transparent-aggregates-3.r=
s',
+                            'tests/codegen/repr/transparent-mips64.rs',
                             'tests/codegen/sse42-implies-crc32.rs',
                             'tests/codegen/thread-local.rs',
                             'tests/codegen/uninit-consts.rs',
+                            'tests/mir-opt/',
                             'tests/pretty/raw-str-nonexpr.rs',
                             'tests/run-make',
-                            'tests/run-make/cdylib-fewer-symbols/foo.rs',
-                            'tests/run-make/doctests-keep-binaries/t.rs',
-                            'tests/run-make-fulldeps',
-                            'tests/run-make/issue-22131/foo.rs',
-                            'tests/run-make/issue-36710/Makefile',
-                            'tests/run-make/issue-47551',
-                            'tests/run-make/pgo-branch-weights',
-                            'tests/run-make/pgo-gen',
-                            'tests/run-make/pgo-gen-lto',
-                            'tests/run-make/pgo-indirect-call-promotion',
-                            'tests/run-make/pgo-use',
-                            'tests/run-make/pointer-auth-link-with-c/Makef=
ile',
-                            'tests/run-make/profile',
-                            'tests/run-make/static-pie',
-                            'tests/run-make/sysroot-crates-are-unstable',
-                            'tests/run-make/target-specs',
                             'tests/rustdoc',
-                            'tests/rustdoc/async-move-doctest.rs',
-                            'tests/rustdoc/async-trait.rs',
-                            'tests/rustdoc/auto-traits.rs',
-                            'tests/rustdoc/check-source-code-urls-to-def.r=
s',
-                            'tests/rustdoc/comment-in-doctest.rs',
-                            'tests/rustdoc/const-generics/const-generics-d=
ocs.rs',
-                            'tests/rustdoc/cross-crate-hidden-assoc-trait-=
items.rs',
-                            'tests/rustdoc/cross-crate-hidden-impl-paramet=
er.rs',
-                            'tests/rustdoc/cross-crate-links.rs',
-                            'tests/rustdoc/cross-crate-primitive-doc.rs',
-                            'tests/rustdoc/doctest-manual-crate-name.rs',
-                            'tests/rustdoc/edition-doctest.rs',
-                            'tests/rustdoc/edition-flag.rs',
-                            'tests/rustdoc/elided-lifetime.rs',
-                            'tests/rustdoc/external-macro-src.rs',
-                            'tests/rustdoc/extern-html-root-url.rs',
-                            'tests/rustdoc/extern-impl-trait.rs',
-                            'tests/rustdoc/hide-unstable-trait.rs',
-                            'tests/rustdoc/inline_cross/add-docs.rs',
-                            'tests/rustdoc/inline_cross/default-trait-meth=
od.rs',
-                            'tests/rustdoc/inline_cross/dyn_trait.rs',
-                            'tests/rustdoc/inline_cross/impl_trait.rs',
-                            'tests/rustdoc/inline_cross/issue-24183.rs',
-                            'tests/rustdoc/inline_cross/macros.rs',
-                            'tests/rustdoc/inline_cross/trait-vis.rs',
-                            'tests/rustdoc/inline_cross/use_crate.rs',
-                            'tests/rustdoc/intra-doc-crate/self.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/additiona=
l_doc.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/basic.rs'=
,
-                            'tests/rustdoc/intra-doc/cross-crate/crate.rs'=
,
-                            'tests/rustdoc/intra-doc/cross-crate/hidden.rs=
',
-                            'tests/rustdoc/intra-doc/cross-crate/macro.rs'=
,
-                            'tests/rustdoc/intra-doc/cross-crate/module.rs=
',
-                            'tests/rustdoc/intra-doc/cross-crate/submodule=
-inner.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/submodule=
-outer.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/traits.rs=
',
-                            'tests/rustdoc/intra-doc/extern-builtin-type-i=
mpl.rs',
-                            'tests/rustdoc/intra-doc/extern-crate-only-use=
d-in-link.rs',
-                            'tests/rustdoc/intra-doc/extern-crate.rs',
-                            'tests/rustdoc/intra-doc/extern-inherent-impl.=
rs',
-                            'tests/rustdoc/intra-doc/extern-reference-link=
.rs',
-                            'tests/rustdoc/intra-doc/issue-103463.rs',
-                            'tests/rustdoc/intra-doc/issue-104145.rs',
-                            'tests/rustdoc/intra-doc/issue-66159.rs',
-                            'tests/rustdoc/intra-doc/pub-use.rs',
-                            'tests/rustdoc/intra-doc/reexport-additional-d=
ocs.rs',
-                            'tests/rustdoc/issue-18199.rs',
-                            'tests/rustdoc/issue-23106.rs',
-                            'tests/rustdoc/issue-23744.rs',
-                            'tests/rustdoc/issue-25944.rs',
-                            'tests/rustdoc/issue-30252.rs',
-                            'tests/rustdoc/issue-38129.rs',
-                            'tests/rustdoc/issue-40936.rs',
-                            'tests/rustdoc/issue-43153.rs',
-                            'tests/rustdoc/issue-46727.rs',
-                            'tests/rustdoc/issue-48377.rs',
-                            'tests/rustdoc/issue-48414.rs',
-                            'tests/rustdoc/issue-53689.rs',
-                            'tests/rustdoc/issue-54478-demo-allocator.rs',
-                            'tests/rustdoc/issue-57180.rs',
-                            'tests/rustdoc/issue-61592.rs',
-                            'tests/rustdoc/issue-73061-cross-crate-opaque-=
assoc-type.rs',
-                            'tests/rustdoc/issue-75588.rs',
-                            'tests/rustdoc/issue-85454.rs',
-                            'tests/rustdoc/issue-86620.rs',
-                            'tests/rustdoc-json',
                             'tests/rustdoc-js-std',
-                            'tests/rustdoc/macro_pub_in_module.rs',
-                            'tests/rustdoc/masked.rs',
-                            'tests/rustdoc/normalize-assoc-item.rs',
-                            'tests/rustdoc/no-stack-overflow-25295.rs',
-                            'tests/rustdoc/primitive-reexport.rs',
-                            'tests/rustdoc/process-termination.rs',
-                            'tests/rustdoc/pub-extern-crate.rs',
-                            'tests/rustdoc/pub-use-extern-macros.rs',
-                            'tests/rustdoc/reexport-check.rs',
-                            'tests/rustdoc/reexport-dep-foreign-fn.rs',
-                            'tests/rustdoc/reexport-doc.rs',
-                            'tests/rustdoc/reexports-priv.rs',
-                            'tests/rustdoc/reexports.rs',
-                            'tests/rustdoc/rustc,-incoherent-impls.rs',
-                            'tests/rustdoc/test_option_check/bar.rs',
-                            'tests/rustdoc/test_option_check/test.rs',
-                            'tests/rustdoc/trait-alias-mention.rs',
-                            'tests/rustdoc/trait-visibility.rs',
+                            'tests/rustdoc-json',
                             'tests/rustdoc-ui/cfg-test.rs',
                             'tests/rustdoc-ui/check-cfg-test.rs',
                             'tests/rustdoc-ui/display-output.rs',
                             'tests/rustdoc-ui/doc-comment-multi-line-attr.=
rs',
                             'tests/rustdoc-ui/doc-comment-multi-line-cfg-a=
ttr.rs',
                             'tests/rustdoc-ui/doc-test-doctest-feature.rs'=
,
+                            'tests/rustdoc-ui/doc-test-rustdoc-feature.rs'=
,
                             'tests/rustdoc-ui/doctest-multiline-crate-attr=
ibute.rs',
                             'tests/rustdoc-ui/doctest-output.rs',
-                            'tests/rustdoc-ui/doc-test-rustdoc-feature.rs'=
,
                             'tests/rustdoc-ui/failed-doctest-compile-fail.=
rs',
                             'tests/rustdoc-ui/issue-80992.rs',
                             'tests/rustdoc-ui/issue-91134.rs',
+                            'tests/rustdoc-ui/no-run-flag.rs',
                             'tests/rustdoc-ui/nocapture-fail.rs',
                             'tests/rustdoc-ui/nocapture.rs',
-                            'tests/rustdoc-ui/no-run-flag.rs',
                             'tests/rustdoc-ui/run-directory.rs',
                             'tests/rustdoc-ui/test-no_std.rs',
                             'tests/rustdoc-ui/test-type.rs',
-                            'tests/rustdoc/unit-return.rs',
+                            'tests/ui-fulldeps/',
                             'tests/ui/abi/stack-probes-lto.rs',
                             'tests/ui/abi/stack-probes.rs',
                             'tests/ui/array-slice-vec/subslice-patterns-co=
nst-eval-match.rs',
@@ -233,31 +167,10 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, =
OEPTestResultTestCase):
                             'tests/ui/debuginfo/debuginfo-emit-llvm-ir-and=
-split-debuginfo.rs',
                             'tests/ui/drop/dynamic-drop.rs',
                             'tests/ui/empty_global_asm.rs',
-                            'tests/ui-fulldeps/deriving-encodable-decodabl=
e-box.rs',
-                            'tests/ui-fulldeps/deriving-encodable-decodabl=
e-cell-refcell.rs',
-                            'tests/ui-fulldeps/deriving-global.rs',
-                            'tests/ui-fulldeps/deriving-hygiene.rs',
-                            'tests/ui-fulldeps/dropck_tarena_sound_drop.rs=
',
-                            'tests/ui-fulldeps/empty-struct-braces-derive.=
rs',
-                            'tests/ui-fulldeps/internal-lints/bad_opt_acce=
ss.rs',
-                            'tests/ui-fulldeps/internal-lints/bad_opt_acce=
ss.stderr',
-                            'tests/ui-fulldeps/internal-lints/default_hash=
_types.rs',
-                            'tests/ui-fulldeps/internal-lints/diagnostics.=
rs',
-                            'tests/ui-fulldeps/internal-lints/lint_pass_im=
pl_without_macro.rs',
-                            'tests/ui-fulldeps/internal-lints/qualified_ty=
_ty_ctxt.rs',
-                            'tests/ui-fulldeps/internal-lints/query_stabil=
ity.rs',
-                            'tests/ui-fulldeps/internal-lints/rustc_pass_b=
y_value.rs',
-                            'tests/ui-fulldeps/internal-lints/ty_tykind_us=
age.rs',
-                            'tests/ui-fulldeps/issue-14021.rs',
-                            'tests/ui-fulldeps/lint-group-denied-lint-allo=
wed.rs',
-                            'tests/ui-fulldeps/lint-group-forbid-always-tr=
umps-cli.rs',
-                            'tests/ui-fulldeps/lint-pass-macros.rs',
-                            'tests/ui-fulldeps/regions-mock-tcx.rs',
-                            'tests/ui-fulldeps/rustc_encodable_hygiene.rs'=
,
-                            'tests/ui-fulldeps/session-diagnostic/enforce_=
slug_naming.rs',
                             'tests/ui/functions-closures/fn-help-with-err.=
rs',
                             'tests/ui/linkage-attr/issue-10755.rs',
                             'tests/ui/macros/restricted-shadowing-legacy.r=
s',
+                            'tests/ui/numbers-arithmetic/u128.rs',
                             'tests/ui/process/nofile-limit.rs',
                             'tests/ui/process/process-panic-after-fork.rs'=
,
                             'tests/ui/process/process-sigpipe.rs',
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index 83a0dbc15f..e02829e6b3 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -10,6 +10,10 @@ SRC_URI +=3D "</a><a class=3D"moz-txt-link-freetext" hre=
f=3D"https://static.rust-lang.org/dist/rustc-$" target=3D"_blank" rel=3D"no=
follow noopener">https://static.rust-lang.org/dist/rustc-$</a>{RUST_VERSION=
}-src.tar.xz;n
             <a class=3D"moz-txt-link-freetext" href=3D"file://0004-musl-De=
fine-O_LARGEFILE-for-riscv32.patch;patchdir=3D$" target=3D"_blank" rel=3D"n=
ofollow noopener">file://0004-musl-Define-O_LARGEFILE-for-riscv32.patch;pat=
chdir=3D$</a>{RUSTSRC} \
             <a class=3D"moz-txt-link-freetext" href=3D"file://0005-musl-De=
fine-SOCK_SEQPACKET-in-common-place.patch;patchdir=3D$" target=3D"_blank" r=
el=3D"nofollow noopener">file://0005-musl-Define-SOCK_SEQPACKET-in-common-p=
lace.patch;patchdir=3D$</a>{RUSTSRC} \
             <a class=3D"moz-txt-link-freetext" href=3D"file://0001-Revert-=
Map-source-absolute-paths-to-OUT_DIR-as-relat.patch;patchdir=3D$" target=3D=
"_blank" rel=3D"nofollow noopener">file://0001-Revert-Map-source-absolute-p=
aths-to-OUT_DIR-as-relat.patch;patchdir=3D$</a>{RUSTSRC} \
+            <a class=3D"moz-txt-link-freetext" href=3D"file://cargo-path.p=
atch;patchdir=3D$" target=3D"_blank" rel=3D"nofollow noopener">file://cargo=
-path.patch;patchdir=3D$</a>{RUSTSRC} \
+            <a class=3D"moz-txt-link-freetext" href=3D"file://custom-targe=
t-cfg.patch;patchdir=3D$" target=3D"_blank" rel=3D"nofollow noopener">file:=
//custom-target-cfg.patch;patchdir=3D$</a>{RUSTSRC} \
+            <a class=3D"moz-txt-link-freetext" href=3D"file://rustc-bootst=
rap.patch;patchdir=3D$" target=3D"_blank" rel=3D"nofollow noopener">file://=
rustc-bootstrap.patch;patchdir=3D$</a>{RUSTSRC} \
+            <a class=3D"moz-txt-link-freetext" href=3D"file://target-build=
-value.patch;patchdir=3D$" target=3D"_blank" rel=3D"nofollow noopener">file=
://target-build-value.patch;patchdir=3D$</a>{RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] =3D "b98c09d968529212fb29eec7d6d3e9bdaa869810679b7=
fb86a1ca69469d75f5e"
=20
</pre>
</blockquote>
<p>&nbsp;</p>
<pre class=3D"moz-signature">--=20
# Randy MacLeod
# Wind River Linux</pre>
</blockquote>

--------------npYP9COCTmES5xz0NerbZiyC--

