Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092F9C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 15:02:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.100309.1723647714640510158
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Aug 2024 08:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8956145dc1=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EBf3Bj020210
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 08:01:54 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 410ncf0kj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 08:01:49 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47EF1n7w023780;
	Wed, 14 Aug 2024 08:01:49 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 410ncf0kj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 08:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9MMTlYjcPAPchTqiV9uTLh7kJ0d5zVGQSPF99eE3CbX8czXSLDAyFJMjDXygITTQa/Vi+ON4cUK+dVSEG49x2sh9pgfxdKTd0Aa3notjYQuIkUfQXx0qootlStvSltssbgNeC2miRMmkgthp+7G7wA++3CozvePotvwYfYGW+dnaJpBXjvvqjCJDk57DPqClZ09O4U7ko1WC6JVMpWM53INmh5p/+QQDkQps0uCmF5KYp3mpFS6zo790v97LPoFG9HhYg0FMpPfrE05wgCg+b/k/ypMFBy6xjQ6yYDGop6ds73CbbR7MPGvQypPmHYDdGCySy8xn4Ys5TlE8JYwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WaN4hbENN1mkmU27wC1pQeRShMtjx5yHUTI6dq4HUkU=;
 b=gVXOSrZnM6T3aKC2MgeBaLW7PbPlqGImO6u2xuEBiSM6S7PJ7vctOBtksXtMXQNy7oLn9JR3xezP0Tkk7hOYEaGhZj6XhJkOcULYo3h5Yi4BGOhfRsdVdPHfgPkF6cVzKDN5AZum1E376pqV+VdQLcxUhfKi5QsmHb4VOt95h13O7ZWEUOCaSUaIbs/cFLh7nw+N0y3s7q//ohrzG4b6psHOcm2zToxf9Q7zZC1qBoVfj/FB5FUX61iO/0R1WeGRt7YBl64kzoUgvHmnltZkN9+nASF3pEJY5T8vnLb/mt6HviGrP9fCV88R9WMtVSzl89uemuvzRmBBT+wnryYA7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH0PR11MB5265.namprd11.prod.outlook.com (2603:10b6:610:e0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.32; Wed, 14 Aug
 2024 15:01:41 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.7828.031; Wed, 14 Aug 2024
 15:01:39 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Trevor Gamblin <tgamblin@baylibre.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        Khem Raj <raj.khem@gmail.com>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        Khem Raj
	<raj.khem@gmail.com>
Subject: RE: [OE-core][PATCH v2] python3: skip readline limited history tests
Thread-Topic: [OE-core][PATCH v2] python3: skip readline limited history tests
Thread-Index: AQHa7Z+c2/G94+JpUkCDTIpV+3FifrImD9iAgACp4wCAAB1QgA==
Date: Wed, 14 Aug 2024 15:01:38 +0000
Message-ID: 
 <CO6PR11MB56029745F270021B2C2C81F4ED872@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20240813164101.3425564-1-tgamblin@baylibre.com>
 <7f6a3ca8-1eff-0288-d667-2824dbcfefc9@windriver.com>
 <00acffd5-d23e-4d6b-a653-d926f2eb417b@baylibre.com>
In-Reply-To: <00acffd5-d23e-4d6b-a653-d926f2eb417b@baylibre.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-Mentions: raj.khem@gmail.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|CH0PR11MB5265:EE_
x-ms-office365-filtering-correlation-id: 9fd46d49-8f2a-4847-5963-08dcbc71fff6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?VUtYRFZQUWtYTlVXMHUrNWtIUXRGbU0xQ0VVUEZOMWdCdWFSbHcxVklNR0Nl?=
 =?utf-8?B?MW9HWGVUSk5Ld3IxQVgvdUJpaTBLeHZPY1g5TUhROEJIZkFDYmxIM2dRV0dL?=
 =?utf-8?B?WDN5YmJYQWh2M3dUbUY4NDcrUnJ5MU9iZnpESUVpSkFEQkk5V08vOHFtNjlp?=
 =?utf-8?B?dVRNTzdFdGc1dFFhZTRDc05WVUdMSDFwT2R3RGtmcFI3ZFBqOER6cEhZMW5x?=
 =?utf-8?B?MVI3TFQySVE3aDVhbWxNMDlNRkthSVdVMmJKcXIwaHpVZkNuZHBVRmhTNDUr?=
 =?utf-8?B?WDU3MnJkRkNhTzdRaFdhQ3pjd0RBWmlGQUxKekJOZnM2ZENKcWNNSjg5RFRZ?=
 =?utf-8?B?NWlhQlZoZ3UrTTlnS3U5TVBPbEV3bS93STFnYVh6dFlYb0xOWWsveUMxR2Z5?=
 =?utf-8?B?a0xJYmpGZWhZK3hLYkRMck05a2RwZVVtZmp6ejVpVnlwVHFmS0N0MlBDNEpq?=
 =?utf-8?B?RDVKdFdxOENHSWxjUWszQ3ErRVdWNGRjdENyMTR6NEFRWHBvY0o5TFlvLzRs?=
 =?utf-8?B?QXhmeTF6YmloTVBIZVRzeVQwcDVSdEkzTmtaMEJ2cmdaVXp4WTNyUTdTOUli?=
 =?utf-8?B?WjZUQXpKbUwycG9uazVJbFlFYWN3eDV0dm1iSmt2T2czZDlDRnRkamJ3aFpi?=
 =?utf-8?B?cUtPY2Y5MmNVRlIrdmdjVncvZXRJa0Q2MlB1cjFXK1hrS2ZPQit0d3VNZHJv?=
 =?utf-8?B?OHN4bUJWZkRzRFFNNElLSk94OGs1YjJWb3QrNFFQUXNlN2dySDluN3ZzU0M1?=
 =?utf-8?B?UXREMGVpVXR3MmhMWi91VEdrUTVPSmJJM2pKYVNaeGZscmxMb0s2NDJ4cE1p?=
 =?utf-8?B?TjBEeXAyNTRZdllYdXNvMUFtZVp5elJVSDFBUVlMVWtIZ0pFSHcrR2taTldE?=
 =?utf-8?B?SGxvL3dCc2RxNlMvQ2YyQ3ZZNzkrcFJUY2lzL2tLOEh5MHZQMWlub20zdFU2?=
 =?utf-8?B?VG1BeUJ3WWlaSlU5c2hYS1VBcUg4RC9kaDcrdzVzRTEzNCtxeks1OFlXd2JK?=
 =?utf-8?B?QmVvdU85Ulp2NzN6ZjZlVFBoZ0V5Q2cxcGtWbHhrdmpaUitKSDdsQmhNaGp3?=
 =?utf-8?B?NHVydXJOV1BOZFFEdjZxMWRGOGtYdHhKTlFrSmNGMkNaTnJaVjZBM2N5bzdE?=
 =?utf-8?B?NjNzc1VJZ3JJQUNHRWdGSTNTQ2FNT2pEQVpLNkZNdlJPbmRRYnJYUUtERkwy?=
 =?utf-8?B?czM4ZFhQVWl0VmZhNUtwbjQrbTZ1UUNpWXM2eitFVlU0d2tuR1h5SEh6dlhO?=
 =?utf-8?B?UGl3dkFNMW5Va3oyWGJGeThUdlNhRjBPSnZna2pKbjY1cWRtWkhiNEFqdEZS?=
 =?utf-8?B?bVk3d0tjeXBEOHovVy90Z3ZLOVdpdndkODZWWlNQVEhFaW9VdEZENVl1ZmEr?=
 =?utf-8?B?NjhWdTh5NVlQdGZkRlQ1UXdvMHd1UHhQM2ZFeUJyeVFmVEdqKy83bWNGV3ox?=
 =?utf-8?B?aGRNN0JjdHpuQmQ2TEtyeDZqSDl1NEtsNHVIL1k0TzZHVjJqUnQzNkpZSWwv?=
 =?utf-8?B?bXlLTjViTkN3UW41MEhranRJN0F1SWpSSEh5a1dGcG55dlA0dzNYMmw0TS9M?=
 =?utf-8?B?R1ZPYnphVnlObjBuNUdKWWhzckkyMGtVSy84UXpOTkxMWjNwckVpNHVSSzF1?=
 =?utf-8?B?MmhoY2NaNkxUM044TjQzUVRiR3prdDhQTFJJbWhBS2swWXc1c1o1SWpWNnpl?=
 =?utf-8?B?RFN2YnRzVmdoTkNhTG0reW4rcVptejNtbHd2Z25VeXJ5T0RYS3phNU9LRTc4?=
 =?utf-8?B?bi90bEtLYVB5bkZxbWtCdGY2aDZoeXRsK1VoSWlNQWp6N1RLeEtkQmN1MG1z?=
 =?utf-8?Q?Q7j9RH63ysgcqn9g688ZIxFGcgoTBJxl5+aJk=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OVl1OTJlVVZGN20xSVJzNVdjb1VVQnhLS05GdERyRklJTFgycGUwMzQ5T0pu?=
 =?utf-8?B?RzNLaXRYNlEwSWFLeEdDaEFrR21Wc0lveisrNi9HMlpVWXJiSDdReDg5azR1?=
 =?utf-8?B?VkF1SjRnaTVnbDdlOG5tdDBycnhnQUh1QUhlTy8zM21PdDN5TWUyZW1zSzBn?=
 =?utf-8?B?QW0rRjJEL2l0ZnNqNy8yL2xkR1htcVI0VnJHVUh3U2J5aVRWc1Rpd1lyMHBi?=
 =?utf-8?B?Z0pTa2F3ZHZDOTRTYlhiOHFhclovUmJ5WmVJbVcwZ2JmOWdtYy9QOVp3QlBj?=
 =?utf-8?B?Y3pUdFBzZndEa3p5c3d5eVhmRzRqRExtc080OEtqK1VZK01ZRVVSbmRFTjlo?=
 =?utf-8?B?QnJORStvOFcrYktQZnFCNWU4VTlqOUowNnBxYnRJU1pRaVQrQyt5M1l3REx4?=
 =?utf-8?B?YWE3MFVlZnNLWHV6UUV2K2FiOW0rZVdtTHpTVDBYTngxb3YwVko3WitrZ21X?=
 =?utf-8?B?dEZrSGVnTXZ3bzAzbWRuTE5zRFhSRTBBU2NNdnQwbldSOFhRNU9NWno4RHpC?=
 =?utf-8?B?OExRck1oc3M5cmZaZHFCVWpTRXdFZzVERGY2dm5LZ3o2QlVTT1VLL05zZGw3?=
 =?utf-8?B?cTE4a2xmcmp2MnhkcjN4NXBScExtQWtuVFdsZ0VES1luTGlQM0syc0FGMmpx?=
 =?utf-8?B?RTc5eEE1dW5PSUVQeWsyaWpBZ2h3dXoycjN0MDlRaXFUSTExaUZWYzJuaHYx?=
 =?utf-8?B?RnB3SE9jOVJDRFdVMWVpNlpCeVhmQ2NGNzlwTFRFZDR0ZGo3ckh6anhJNHht?=
 =?utf-8?B?MzJJQVZCZ2hsTEg3SXQvalFnakdzclRZck5IOUhjSi9LQmdURFdscGU5T1lF?=
 =?utf-8?B?S2RiSVFmdDFrR0ZYNTBVcDZjOGZNVlRxZFpuOXlwT1NObUhyRE9sZHZrYmdH?=
 =?utf-8?B?dHlSS3lvMVJWRmNVQ0NNVWlnR01iMUt3MXpPYkNnWllpTUhJdXJZTWxHR3hu?=
 =?utf-8?B?VjlhNUNqZ3pZN242MnlHaGpUc3NjN3JpU1dIVnJlS3o3Y2FzQTR5NXBCc3Rw?=
 =?utf-8?B?UTBRNDF5Qm11bmZ6VER4RXMyREtXUXhhMkkyajNyc0d5Nys4bE1DT1Q0MXBJ?=
 =?utf-8?B?Uk4vbkYvRERlRTNWbTRKWElMYWQ0MFVVcUV0cjF0Nml4cENWTlRUY295cXZx?=
 =?utf-8?B?SEo3dS9zc3B3UWR1SGFBMzc3ZTVmT0FQZGRrNGdDRTJ5RWkwaEZZcWRGOThz?=
 =?utf-8?B?NVJ5SkdzYndzeFpMMEFpdmRXdVhBb2ZJY3VDYUt4czhtK2xQS04rTjVqcU81?=
 =?utf-8?B?MCtMb0RaWitkT2hKaVpEVzgxUUZhcUVYZ09EbnlXUVM1NzNFeXFKVm9XYjVV?=
 =?utf-8?B?enorTUVHejhaQ3lVZ1JBTlZqOEU1aGdSU3BucEkrUnNmQnczbUVpSVhDbDNv?=
 =?utf-8?B?S0w3TFdGVEpPa2tiRG1VT2tBUEVCVEN0QlJRZHJ5MEdqOGk2YnJRNjhvblF6?=
 =?utf-8?B?RndvSnpzUUk3WkVUS2d0bkoxaWRlYkQvZ1puRG9jODJuengybFE5RFBBcitu?=
 =?utf-8?B?YUFCRS8rZHNHUWYzcVBFb1gxOERFbjdtK0ozOTY5aW1lSFYzeGY4UEUrR3Bo?=
 =?utf-8?B?U2xqazd5SVNNTXhkWHNreVA5R0JSdW5qVkdHYmJaZjI4VjRqL2lIQ3BNN2py?=
 =?utf-8?B?dGczYjcvSlMrQU1UNlBaSjBPRHAxZThGZldBVHBZS3IwT1p6cGFHYTdDSHFk?=
 =?utf-8?B?MUJXQXVIOWwvcjVHemtUMUIvZlQzUVZOTnhtZFVtV2lNUmtsdFFDbS9ZamxJ?=
 =?utf-8?B?SEN4ejFEeWZJVEpXc1NVSkk5eFE5TGNDZWhwTXZTK1Uzalo4eGdNVFVvS3U1?=
 =?utf-8?B?bG9CaHUxQVF5RURCSlhxSlZRMHUxemhMcXpMYjg1UTMxS0NhbURiWnY4K1l0?=
 =?utf-8?B?aStMU1pkLzFxbFYzNXZXd0pkQWdyNjlSQXZ6Z1hrbExrS2dlN1N6aXczcTZV?=
 =?utf-8?B?bUhvSkE1S1JMaURGY0dVdENTL1d2R2JEUUZ2dTZzLzVacW1ZY1pVR3FIajBm?=
 =?utf-8?B?bC9BUE5LS1RER2ErQU1mMkJWWGdoOGNSRldkUVVFUHlOWlNFNWt4VlRmNElQ?=
 =?utf-8?B?VVp3R2s1cHUzdFFiQ2tEL0ViTDlJNkZiZ3VOdDAxUFBtSnlnNG8vdTBWaDd1?=
 =?utf-8?Q?DzfE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd46d49-8f2a-4847-5963-08dcbc71fff6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2024 15:01:39.1163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hByIl+rlZVhXMeOY7shZ2JVWczc/gtbJK/HR6D7Pe/KF0gV8bZF3qGZBeMpiBb5xv6imCF9GGd5o5ZHAsiBISg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5265
X-Proofpoint-ORIG-GUID: Am4UAzJMqe2qa4Em8JLn4tDh1M6dHnrf
X-Proofpoint-GUID: tOKfD6KDSkdAjYyQ2bTAAjwzm0Aez_qu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_11,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408140104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 15:02:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203324

SG93IGFib3V0IHVzaW5nIElOQ09NUElUQUJMRV9MSUNFTlNFIHRvIGRldGVybWluZSB0aGUgZGVm
YXVsdCBQQUNBS0dFQ09ORklHLCBzbyB0aGF0IHRoZSBkZWZhdWx0IGlzIHJlYWRsaW5lPyBNYXli
ZSB0aGlzIHdvdWxkIGJlIHBhcnQgb2YgdGhlIG5ldyBtZXRhLWdwbHYyIHJlcGxhY2VtZW50IHdv
cmsgKEBLaGVtIFJhaikuIEknbSBub3QgdmVyeSBzdXJlIGFib3V0IGl0LCB0aG91Z2guIEFzIGZh
ciBhcyBJIGNhbiBzZWUsIHZlcnkgZmV3IHBlb3BsZSBjYXJlIGFib3V0IHRoaXMgR1BMdjMgcHJv
YmxlbS4gVGhlIGV2aWRlbmNlIGlzIHRoYXQgbWV0YS1ncGx2MiBpcyBOT1Qgc3VwcG9ydGVkIGZv
ciBhIGxvbmcgdGltZSBhbmQgbm9ib2R5IGV2ZXIgZGV2b3RlcyBhbnkgcmVhbCBlZmZvcnQgdG8g
ZGV2ZWxvcCBhbiBhbHRlcm5hdGl2ZS4gDQoNCkkgZ3Vlc3Mgd2hlbiB0aGUgY29tbWl0IHdhcyBt
YWRlLCB0aGUgdW5kZXJseWluZyBBUEkgaW5jb21wYXRpYmlsaXR5IHdhcyBOT1QgbWFkZSBjbGVh
ci4gDQoNCkknbSBPSyB3aXRoIGFueSBjaG9pY2UsIGFzIGxvbmcgYXMgY2xlYXIgc3RhdGVtZW50
cyBhcmUgdGhlcmUgdG8gdGVsbCBwZW9wbGUgd2h5LCB0aG91Z2ggSSBwcmVmZXIgdG8gdXNlIHJl
YWRsaW5lIGFzIHRoZSBkZWZhdWx0LCBhcyBpdCB3b3VsZCBwcm92aWRlIGJldHRlciB1c2VyIGV4
cGVyaWVuY2UuDQoNClJlZ2FyZHMsDQpRaQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogVHJldm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxpYnJlLmNvbT4gDQpTZW50OiBXZWRu
ZXNkYXksIEF1Z3VzdCAxNCwgMjAyNCA5OjA0IFBNDQpUbzogQ2hlbiwgUWkgPFFpLkNoZW5Ad2lu
ZHJpdmVyLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCkNj
OiBhbGV4LmthbmF2aW5AZ21haWwuY29tOyBhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbQ0K
U3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSCB2Ml0gcHl0aG9uMzogc2tpcCByZWFkbGluZSBs
aW1pdGVkIGhpc3RvcnkgdGVzdHMNCg0KDQpPbiAyMDI0LTA4LTEzIDEwOjU2IHAubS4sIENoZW5R
aSB3cm90ZToNCj4gVGhlIGdpdGh1YiBpc3N1ZSB5b3UgcmVmZXJlbmNlZCBoZXJlIGlzIG5vdCBh
biBpc3N1ZSB0aGF0IHRyYWNrcyB0aGlzIA0KPiB0ZXN0IGZhaWx1cmUuIEl0J3MgYW4gaXNzdWUg
dGhhdCBpbnRyb2R1Y2VkIHRoZSBvcmlnaW5hbCBjb21taXQsIGFuZCANCj4gaGFzIGJlZW4gY2xv
c2VkLiBJZiBhIHByb2JsZW0gaXMgMTAwJSByZXByb2R1Y2libGUsIGF0IGxlYXN0IHNvbWUgb3Bl
biANCj4gaXNzdWUgc2hvdWxkIGJlIHRoZXJlIGZvciB0cmFja2luZyB0byB2YWxpZGF0ZSBhbiBl
eHBsaWNpdCBza2lwLiBBcyANCj4gZmFyIGFzIEkgY2FuIHNlZSwgdGVzdHMgdGhhdCB3ZXJlIHNr
aXBwZWQgYXJlIHJhcmVseSByZXZpc2l0ZWQuDQo+DQo+IEFsc28sIGxvb2tpbmcgYXQgdGhlIGlz
c3VlIHlvdSByZWZlcmVuY2VkLCBpdCBzZWVtcyB0aGF0IHRoZSBwcm9ibGVtIA0KPiBpcyB0aGF0
IHdlJ3JlIHVzaW5nIGVkaXRsaW5lIGluc3RlYWQgb2YgcmVhZGxpbmUgYXMgdGhlIGRlZmF1bHQg
DQo+IFBBQ0tBR0VDT05GSUcuIEl0IGxvb2tzIGxpa2UgdGhhdCB0aGlzIG5ldyB0ZXN0IGNhc2Ug
Y29ycmVjdGx5IHJldmVhbHMgDQo+IG91ciBzcGVjaWZpYyBjb25maWd1cmF0aW9uIHByb2JsZW0u
DQo+IFBBQ0tBR0VDT05GSUcgPz89ICJlZGl0bGluZSBnZGJtICR7QGJiLnV0aWxzLmZpbHRlcign
RElTVFJPX0ZFQVRVUkVTJywNCj4gJ2x0bycsIGQpfSINCj4gUEFDS0FHRUNPTkZJR1tyZWFkbGlu
ZV0gPSAiLS13aXRoLXJlYWRsaW5lPXJlYWRsaW5lLCxyZWFkbGluZSwsLGVkaXRsaW5lIg0KPiBQ
QUNLQUdFQ09ORklHW2VkaXRsaW5lXSA9ICItLXdpdGgtcmVhZGxpbmU9ZWRpdGxpbmUsLGxpYmVk
aXQsLCxyZWFkbGluZSINCj4NCj4gQ2FuIHlvdSB0cnkgdXNpbmcgcmVhZGxpbmUgYXMgdGhlIGRl
ZmF1bHQgUEFDS0FHRUNPTkZJRyBhbmQgc2VlIGlmIA0KPiB0aGluZ3Mgd29yaz8NClllcywgdGhl
IHRlc3QgcGFzc2VzIHdpdGggcmVhZGxpbmUuIEkgZGlkbid0IG1ha2UgdGhpcyBjaGFuZ2UgZm9y
IHRoZSB0ZXN0IGJlY2F1c2UgSSBoYWQgYXNzdW1lZCB3ZSB3YW50IHRvIHVzZSBlZGl0bGluZSBp
biB0aGUgUEFDS0FHRUNPTkZJRyBpbnN0ZWFkIG9mIHJlYWRsaW5lLCBiYXNlZCBvbiBjb21taXQg
Y2U2YWRkNmY4YWNhMC4gSXMgdGhpcyBub3QgdGhlIGNhc2U/IERvIHdlIHdhbnQgdG8gc3dpdGNo
IGJhY2sgdG8gdXNpbmcgcmVhZGxpbmUgYnkgZGVmYXVsdD8NCj4NCj4gUmVnYXJkcywNCj4gUWkN
Cj4NCj4gT24gOC8xNC8yNCAwMDo0MSwgVHJldm9yIEdhbWJsaW4gd3JvdGU6DQo+PiBQeXRob24g
My4xMi41IGlzIGZhaWxpbmcgYSBuZXdlciBwdGVzdCBmb3IgcmVhZGluZy93cml0aW5nIGxpbWl0
ZWQgDQo+PiBoaXN0b3J5LiBTa2lwIGl0IGZvciBub3cgdW50aWwgYSBwcm9wZXIgZml4IChpZiBh
bnkpIGlzIGRldGVybWluZWQuDQo+Pg0KPj4gVGhlIG5ldyB0ZXN0IHdhcyBhZGRlZCBpbg0KPj4g
aHR0cHM6Ly9naXRodWIuY29tL3B5dGhvbi9jcHl0aG9uL2NvbW1pdC8yNjNjN2U2MTFiYjI0NzE1
ZTUxM2Q0NTdhMzQ3DQo+PiA3YTYxZmZmMTUxNjINCj4+DQo+Pg0KPj4gVGhlIEdpdEh1YiBpc3N1
ZSBpcyBoZXJlOiANCj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9weXRob24vY3B5dGhvbi9pc3N1ZXMv
MTIxMTYwDQo+Pg0KPj4gVGhlIGFmb3JlbWVudGlvbmVkIGJ1ZyByZXBvcnQgc3VnZ2VzdHMgdGhh
dCBPU0Vycm9ycyBsaWtlIHRoYXQgc2hvdyANCj4+IHVwIHdoZW4gdXNpbmcgdGhlIEdOVSByZWFk
bGluZS1iYXNlZCByZWFkbGluZSBtb2R1bGUgaWYgYSB3b3JrYXJvdW5kIA0KPj4gaXNuJ3QgYWxz
byBpbmNvcnBvcmF0ZWQuIEl0IGFsc28gbWVudGlvbnMgYSBuZXcgcmVhZGxpbmUgYmFja2VuZCB3
aWxsIA0KPj4gYmUgYXZhaWxhYmxlIGluIDMuMTMgdGhhdCBtaWdodCBoZWxwLCBidXQgdGhhdCB3
b24ndCBiZSBhdmFpbGFibGUgZm9yIA0KPj4gYSB5ZWFyLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+DQo+PiAtLS0NCj4+IHYyIGFk
ZHMgZXh0cmEgaW5mbyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgYW5kIGNhcnJpZWQgcGF0Y2ggYWJv
dXQgdGhlIA0KPj4gc291cmNlIG9mIHRoZSB0ZXN0IGZhaWx1cmUuDQo+Pg0KPj4gwqAgLi4udF9y
ZWFkbGluZS1za2lwLWxpbWl0ZWQtaGlzdG9yeS10ZXN0LnBhdGNoIHwgNDAgDQo+PiArKysrKysr
KysrKysrKysrKysrDQo+PiDCoCAuLi4vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uM18z
LjEyLjUuYmIgfMKgIDEgKw0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCsp
DQo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQNCj4+IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy8wMDAxLXRlc3RfcmVhZGxpbmUtc2tpcC1saW1pdGVkLQ0KPj4gaGlzdG9yeS10
ZXN0LnBhdGNoDQo+Pg0KPj4gZGlmZiAtLWdpdA0KPj4gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMvMDAwMS10ZXN0X3JlYWRsaW5lLXNraXAtbGltaXRlDQo+PiBkLWhpc3Rv
cnktdGVzdC5wYXRjaCANCj4+IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LzAwMDEtdGVzdF9yZWFkbGluZS1za2lwLWxpbWl0ZQ0KPj4gZC1oaXN0b3J5LXRlc3QucGF0Y2gN
Cj4+DQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMC4uODUxZGRk
NTcxYQ0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIA0KPj4gYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMvMDAwMS10ZXN0X3JlYWRsaW5lLXNraXAtbGltaXRlDQo+PiBkLWhp
c3RvcnktdGVzdC5wYXRjaA0KPj4gQEAgLTAsMCArMSw0MCBAQA0KPj4gK0Zyb20gZDlkOTE2ZDVl
YTk0NmM5NDUzMjM2NzlkMTcwOWRlMWI4NzAyOWI5NiBNb24gU2VwIDE3IDAwOjAwOjAwIA0KPj4g
KzIwMDENCj4+ICtGcm9tOiBUcmV2b3IgR2FtYmxpbiA8dGdhbWJsaW5AYmF5bGlicmUuY29tPg0K
Pj4gK0RhdGU6IFR1ZSwgMTMgQXVnIDIwMjQgMTE6MDc6MDUgLTA0MDANCj4+ICtTdWJqZWN0OiBb
UEFUQ0hdIHRlc3RfcmVhZGxpbmU6IHNraXAgbGltaXRlZCBoaXN0b3J5IHRlc3QNCj4+ICsNCj4+
ICtUaGlzIHRlc3Qgd2FzIGFkZGVkIHJlY2VudGx5IGFuZCBpcyBmYWlsaW5nIG9uIHRoZSBwdGVz
dCBpbWFnZS4gDQo+PiArRGlzYWJsZSBpdCB1bnRpbCB0aGUgcHJvcGVyIGZpeCBpcyBkZXRlcm1p
bmVkLg0KPj4gKw0KPj4gK1NlZSBhbHNvOiBodHRwczovL2dpdGh1Yi5jb20vcHl0aG9uL2NweXRo
b24vaXNzdWVzLzEyMTE2MA0KPj4gKw0KPj4gK1Vwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0
ZSBbT0Utc3BlY2lmaWNdDQo+PiArDQo+PiArU2lnbmVkLW9mZi1ieTogVHJldm9yIEdhbWJsaW4g
PHRnYW1ibGluQGJheWxpYnJlLmNvbT4NCj4+ICstLS0NCj4+ICsgTGliL3Rlc3QvdGVzdF9yZWFk
bGluZS5weSB8IDIgKysNCj4+ICsgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPj4g
Kw0KPj4gK2RpZmYgLS1naXQgYS9MaWIvdGVzdC90ZXN0X3JlYWRsaW5lLnB5IGIvTGliL3Rlc3Qv
dGVzdF9yZWFkbGluZS5weSANCj4+ICtpbmRleCA5MWZkN2RkMTNmOS4uZDgxZjliZjhlZWQgMTAw
NjQ0DQo+PiArLS0tIGEvTGliL3Rlc3QvdGVzdF9yZWFkbGluZS5weQ0KPj4gKysrKyBiL0xpYi90
ZXN0L3Rlc3RfcmVhZGxpbmUucHkNCj4+ICtAQCAtMTMyLDYgKzEzMiw3IEBAIGRlZiB0ZXN0X25v
bmFzY2lpX2hpc3Rvcnkoc2VsZik6DQo+PiArwqDCoMKgwqDCoMKgwqDCoCBzZWxmLmFzc2VydEVx
dWFsKHJlYWRsaW5lLmdldF9oaXN0b3J5X2l0ZW0oMSksICJlbnRyw6llIDEiKQ0KPj4gK8KgwqDC
oMKgwqDCoMKgwqAgc2VsZi5hc3NlcnRFcXVhbChyZWFkbGluZS5nZXRfaGlzdG9yeV9pdGVtKDIp
LCAiZW50csOpZSAyMiIpDQo+PiArDQo+PiArK8KgwqDCoCBAdW5pdHRlc3Quc2tpcCgiU2tpcHBp
bmcgcHJvYmxlbWF0aWMgdGVzdCIpDQo+PiArwqDCoMKgwqAgZGVmIHRlc3Rfd3JpdGVfcmVhZF9s
aW1pdGVkX2hpc3Rvcnkoc2VsZik6DQo+PiArwqDCoMKgwqDCoMKgwqDCoCBwcmV2aW91c19sZW5n
dGggPSByZWFkbGluZS5nZXRfaGlzdG9yeV9sZW5ndGgoKQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqAg
c2VsZi5hZGRDbGVhbnVwKHJlYWRsaW5lLnNldF9oaXN0b3J5X2xlbmd0aCwgDQo+PiArcHJldmlv
dXNfbGVuZ3RoKSBAQCAtMzQ5LDYgKzM1MCw3IEBAIGRlZiB0ZXN0X2hpc3Rvcnlfc2l6ZShzZWxm
KToNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2VsZi5hc3NlcnRFcXVhbChsZW4obGlu
ZXMpLCBoaXN0b3J5X3NpemUpDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNlbGYuYXNz
ZXJ0RXF1YWwobGluZXNbLTFdLnN0cmlwKCksIGIibGFzdCBpbnB1dCIpDQo+PiArDQo+PiArK8Kg
wqDCoCBAdW5pdHRlc3Quc2tpcCgiU2tpcHBpbmcgcHJvYmxlbWF0aWMgdGVzdCIpDQo+PiArwqDC
oMKgwqAgZGVmIHRlc3Rfd3JpdGVfcmVhZF9saW1pdGVkX2hpc3Rvcnkoc2VsZik6DQo+PiArwqDC
oMKgwqDCoMKgwqDCoCBwcmV2aW91c19sZW5ndGggPSByZWFkbGluZS5nZXRfaGlzdG9yeV9sZW5n
dGgoKQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqAgc2VsZi5hZGRDbGVhbnVwKHJlYWRsaW5lLnNldF9o
aXN0b3J5X2xlbmd0aCwgDQo+PiArcHJldmlvdXNfbGVuZ3RoKQ0KPj4gKy0tDQo+PiArMi4zOS4y
DQo+PiArDQo+PiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zXzMuMTIuNS5iYg0KPj4gYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjNf
My4xMi41LmJiDQo+PiBpbmRleCA1NjY1YzkwZmE5Li5jYzJlMTRiYWYwIDEwMDY0NA0KPj4gLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zXzMuMTIuNS5iYg0KPj4gKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zXzMuMTIuNS5iYg0KPj4gQEAg
LTMzLDYgKzMzLDcgQEAgU1JDX1VSSSA9DQo+PiAiaHR0cDovL3d3dy5weXRob24ub3JnL2Z0cC9w
eXRob24vJHtQVn0vUHl0aG9uLSR7UFZ9LnRhci54eiBcIA0KPj4gZmlsZTovLzAwMDEtZ2gtMTA3
ODExLXRhcmZpbGUtdHJlYXQtb3ZlcmZsb3ctaW4tVUlELUdJRC1hcy1mYWlsdS5wYXRjDQo+PiBo
IFwNCj4+IMKgwqDCoMKgwqDCoMKgwqAgZmlsZTovLzAwMDEtdGVzdF9kZWFkbG9jay1za2lwLXBy
b2JsZW1hdGljLXRlc3QucGF0Y2ggXCANCj4+IGZpbGU6Ly8wMDAxLXRlc3RfYWN0aXZlX2NoaWxk
cmVuLXNraXAtcHJvYmxlbWF0aWMtdGVzdC5wYXRjaCBcDQo+PiArIGZpbGU6Ly8wMDAxLXRlc3Rf
cmVhZGxpbmUtc2tpcC1saW1pdGVkLWhpc3RvcnktdGVzdC5wYXRjaCBcDQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgIg0KPj4gwqAgwqAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0g
IiBcDQo+Pg0KPj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4+IExpbmtzOiBZb3UgcmVjZWl2
ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPj4gVmlldy9SZXBseSBPbmxpbmUg
KCMyMDMyODkpOiANCj4+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJl
ZGRlZC1jb3JlL21lc3NhZ2UvMjAzMjg5DQo+PiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlz
dHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMDc4Nzk0ODcvNzMwNDg2NQ0KPj4gR3JvdXAgT3duZXI6
IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4+IFVuc3Vi
c2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29y
ZS91bnN1Yg0KPj4gW1FpLkNoZW5AZW5nLndpbmRyaXZlci5jb21dDQo+PiAtPS09LT0tPS09LT0t
PS09LT0tPS09LQ0KPj4NCj4NCg==

