Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660B1C4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 18:48:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.26629.1712861314731416902
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 11:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HqeljmJE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48317d0765=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43B5obKZ004283
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 11:48:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=KxiT8xPPHm0L7k4I0TX9iqw7/1Hcz6Xt9rlM9jC0X8k=; b=
	HqeljmJECP2zx3AD4Rg1gMKRgQ/GbAT7t+Z1gozsouqKsMOAiYJPpJa+z/SAlU12
	DqA7Jv/uLqXjSm5yHjnqtn3NoTEYdSx5jxUoj3E5qZQYKYg1s8QeKq36t3hgLe5C
	6k4JxYOP7n2zVmFQ5Gb4n0jd3D2B/hZY65c8JlUmHnn/uLhutl+vv1e26Z5wSoR0
	ND5kdF9FjQVaQyC7Kcrh9zvk6Y02FNhBEM8JMhSH4tnC05qEzxFcQkdGWKNY6s1/
	NfyEfA4uOAEXIZ/NYrgAT819ych+z8Qm3DFDAn6B6W3I4s8AKSQGh19obV92MMyI
	RCXe02uRnODDm7gIP3MvJw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xb1p0esn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 11:48:34 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 43BImXdk016238;
	Thu, 11 Apr 2024 11:48:33 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xb1p0esn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 11:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSOi956ZqK+NQCgbDm+mDlO57AaONzPDNcRpHYurzuSksPwCfhOiyZ2wNbIB1DOg/1B3bugRpcwmIaoiFS7Gy/D0bztT9Vz8KC4pKISJvP8Df4pFlovL7srooykWuJEH8ae7gnImgkqXrR7q/NHP+r9d54rHMjXhDnUwi1uOUKqYwlqt35/DFy/89bttRlGH7N7MqgiUrTi6q4ZmQI9vC8LwiH06GWsID/p8cnSnzzIVHagnWvNKBfBdP2bSV0EJuFXvldZd+khVYdDSuGJcYMwwGBicddhNd9+yak4OKh5F7B0AFewuT0RYU5aCnMQrS49aC9WEtHAYg6iyDYAyYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxiT8xPPHm0L7k4I0TX9iqw7/1Hcz6Xt9rlM9jC0X8k=;
 b=k7cgzSkNBPEQOJHYpNrVjqzAwcFQLtr0ksDke/Mde0g2cm2cqWMBe8BYlGM2BT8sM6snxfQQsu6OgZxIwx7af2wzaLs6XrrJLv3IrZ83eVKUzijTYjMObW0Hnn8fzqebY9mwr1jml0CovlwH73OqaqN5G0AjD75YY42P+3g5tpbCYq9W4ty/+OhrHelWXUrZMNwgApy9HQGux8TOiUhyA7MatzR70lDPksoshnzREfeBpE4otPFXdMDCiLDReiC69bSD32+iIaWxCd5vQIBnyrMjkcBKAfZ9pQzOmOWwgC8PTYIXlWhRkJbcF9CEOfIICLUQe+DE46DRkbxKY/qfdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7287.namprd11.prod.outlook.com (2603:10b6:8:13f::19)
 by CH3PR11MB7939.namprd11.prod.outlook.com (2603:10b6:610:131::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Thu, 11 Apr
 2024 18:48:29 +0000
Received: from DS0PR11MB7287.namprd11.prod.outlook.com
 ([fe80::6444:a7f8:1876:84c4]) by DS0PR11MB7287.namprd11.prod.outlook.com
 ([fe80::6444:a7f8:1876:84c4%4]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 18:48:29 +0000
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>,
        Ross Burton
	<Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: RE: [OE-core][PATCH] systemd: make predictable name mac policy
 opt-out
Thread-Topic: [OE-core][PATCH] systemd: make predictable name mac policy
 opt-out
Thread-Index: AQHaiYNJ5bENkvu/DUGYhD7MfvyDeLFhsmKAgAAdqACAAZnw8A==
Date: Thu, 11 Apr 2024 18:48:28 +0000
Message-ID: 
 <DS0PR11MB728762F2D43EAAB898E9A48388052@DS0PR11MB7287.namprd11.prod.outlook.com>
References: <20240408070450.27686-1-peter.marko@siemens.com>
 <2E4C61C4-1C5A-46C8-A193-3C484F5D634A@arm.com>
 <AS1PR10MB5697E503E226D55C1F88550FFD062@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB5697E503E226D55C1F88550FFD062@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=499c6af3-fe7f-4f53-b3a9-91d19dc97404;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-04-10T17:39:48Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7287:EE_|CH3PR11MB7939:EE_
x-ms-office365-filtering-correlation-id: fc8946dc-0300-4427-9da0-08dc5a57fa76
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 H//5cZ2ZKF+5v7oBMJDLJDF76DnqCjhKSevT+cE4o+98/5QMp1nevAZiPHRovmztie+kzZxYrElO9sBk86KeqoCwxNfwkSBI5lqq6xNU99NN5LKsYFRkMAbxZBJs2/vuNxTtq/fMF6i69vyB0inVndX4B2netQh/6ohm9Ap1PuberMA1wVgmDSYj4zTpZEyX85hUCdaj9TwxdjnqZmIm0nya84wnjsjfH0WTs/iwENQ6lYtq/6qhqzPlyh+UCOY067JItYIFJIWPf/lrczxiDFGKt9blbcfewZkU61z2gyTxj09+L2hphfSFcWpIt6skGwsPJ9LgbG1yokjju2tzCvQwNpQZMQjp4O2D/SWJRG1rdctzf5Cisbsr/Z2GHw01+m4JJbKwWW67Mrj7pEa2xsLuebKTfCDfb6g+K9tXOzFHSNZA1bHGIx1H8iYv+Q7oHmOLe/+bO9hxp47zOxrFbpejFhZKWWlbrBAoX/CeyHFe8xs/qhdQG+5XjRSnSzPY2efHbpiAak9LwwiIXnWSnnztWiUcgMnyYVzHBhZ3lEpWFDOr3p+yX3fX0eCgNhU5hz+jBB/2kXWAman1dWVsPWRht6fP0ekMcr225jspwOzQihSJwVMV3jmwhjkj+TQ3zEBg5pZOGnZmlpCGvAPB6gAVvYgv36jnyvtiSaCkvA+2kQN1ZznFN/Kf97g5KeG6KmGBqKAJH8suejMWKUeI8XA9WREV4CrCO8+P/E/pEAo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7287.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cmYxcXMwY0l2UXhlVGhKYXZvalBtYzNiMnFMK3JobExrVlNvT2Vha2tzSlJV?=
 =?utf-8?B?RnhxL2drcm5zbTRNUk1DR0ZROGRySlFLVFBQcGVSeERQckU2NmJ2NVovNExw?=
 =?utf-8?B?WkRwT0xnRU9XT2piWUdWeTU0UGdFSGZtVnNSNGVNVnBnNE5idFZkWGNmazg4?=
 =?utf-8?B?SzlUcVlCNmpFWFBaYnBtRGQycTdjVDU3RGtPRzhjcENqMWViTWpCYjJDYVNY?=
 =?utf-8?B?amxOdm1BRzVRdXZTSzUrQjlFbHdtaG1RQ2c5Qm4rMFIrR1VVRFZaMGExZVNl?=
 =?utf-8?B?WklxWEh1MDV1MU80L0N1ZVgyNW5TbkJRajFkM2QzUWFORW9DR3RSWDhOYWhv?=
 =?utf-8?B?SStXNFJMT1hmcXZJMk5iaktQa3NGbmV4dUM1bngvakppc2thUE9GZ3I2eUVU?=
 =?utf-8?B?ZVZ6SDh1bGFRT2VUR2xWVXRBZDhhb0lBMTVWTUtFSG5Pd0VzNmdkLzZxSytG?=
 =?utf-8?B?STRtWVMvcUwrSE5ubW9vOFNQWHIxMWg0UXJkUzRsRVBpRGRweitNY1ZlN1Rs?=
 =?utf-8?B?RHVYRjBEWjNyWklIc2pWTTMwRnVPUFFJSmo1byswRHY4bHRpd0Z1eGx1ZUlR?=
 =?utf-8?B?Q0ZwNEo5aVJsakJkMHFvbG9pd2JoZzNVZVFGcmVJQVc1MTFMd2pzNis0OXFO?=
 =?utf-8?B?d0swLzhoRWpJSjJEWVBTM0UyalhpN2dSYldDYVltbzg5dnhpSWN3OWViMlNh?=
 =?utf-8?B?cEhNbmpSaXpsNEdqT0pkT2J4ZkhNbFJzWXMzalg5Yzd4eVJzNi84OTBiMmhk?=
 =?utf-8?B?VHUwN1pQS0lQbXFHN2JHWVFWc2hPQWRQVDcvMTUrU05CWTViRm1tdTg1K0tF?=
 =?utf-8?B?T1RaRWxFeENDa0dndTN4SDVNTUhrdFNVb2F5VWZaSW5zRlJqTW91K2YxdURw?=
 =?utf-8?B?ZmxrOTNEdFEzUk1yWW9VLytCYkZLSVY5enltRlBUclFoU1lxSGJlMlludW1v?=
 =?utf-8?B?QnRYSG1sbVhOS0kvNWZDdjlOUFRBdjR4eitLMWMycW5XMSt3c2UveHg0QlJu?=
 =?utf-8?B?MVBCY012dkVGeVF4aEN5akNBa25zSExoV1pwSzdRdDY2dElBM1U5SEpqd1kr?=
 =?utf-8?B?cE1nUWxEUFVqM0ZUL2VySWxkQXpJRGltVm1VY0plZVlQWHdTM1BMT0R3VEdY?=
 =?utf-8?B?blczSGxSbGdLbXVwaHJCbEFNN2tldzdvcVVuVUJpYnJIWU12amN2RlNQcWNR?=
 =?utf-8?B?V205T0ZkN0hQdDdHempQZVE2M0djK3pYcDlNb2tRVkNUOGJ5MzhGVTR1Zy9X?=
 =?utf-8?B?TlVBVzRuT2syVitRdmFpMDFidFY2TXZOaUV1Skh5NjZnaXpwckFBSmlZUHhS?=
 =?utf-8?B?dWVWQjM2RDdEQTMxcmNXTllmbFZ5UUhnV29HK3pXdzllWUduQWRma0tQY2xZ?=
 =?utf-8?B?czJUc2JVMmVRS3hDcFZmSVdBVTNzK1ZRREljT1lhZ2ozYjFnR3ZDeGtOeTdB?=
 =?utf-8?B?ZUgzNXRWVU9KL25nSTg2dS8rTHc3c0p2MTlDalR4ekJQbGg2d2grcm5Jd0Rr?=
 =?utf-8?B?eDkrY1VpM3ZHQWM4WURsVTBCdEwwNm5IZ3YvSzk5TDdOcnQzM05aSWlxQnlY?=
 =?utf-8?B?bmNxRllFMUFqcVIybXNldjJWNDVEVlZKRm43R1FTblVUckVGamhlTnlMaUx3?=
 =?utf-8?B?QkhYODQ3cTBURWNTYjhkWEdTZUNsQnNYTzUxUE1iZTNlclBVR3VzeWtzQmEv?=
 =?utf-8?B?YytoU09NZ3lrTVdrdjZFOGE0eEZpc1g1ck1ObVpmM3IwT2NiUDQwU085cFps?=
 =?utf-8?B?eEtub0s0NXgyUlBIQkFrcWp0ZDZCcEJVNzcxaWt3L0hHemtMcXpOajIxTzkr?=
 =?utf-8?B?TlV1dzM1NlFYUk55NVZhN1B6dTJuRTdxaDJURHhtWlQ0anc1WE9TOGxZbzA4?=
 =?utf-8?B?ZWlVVXR5bnduSk9DNEZSNHNTNVhyU25PUXN0SmhhZWN4Syt3NHRkczRRUWRK?=
 =?utf-8?B?MUVxaUZ0QnhWTlpjYU9YYW5ESkQwdktVcWNJVGxNVXpjd1l0aXAyMitWNVlh?=
 =?utf-8?B?Y2FKR3NSRmZXczZPZ1AyQlZteitwdEkyaWlyZE44SkFwZytPYTZvTlRVK2I1?=
 =?utf-8?B?UGsxREJxeCsycmU0MHZqdHcwbk9EZHpIQ2dVM2pNNVlFTnlyZ2cwTVZETjFF?=
 =?utf-8?Q?okrQS3S9xT78xaeQgCuNkPm6A?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8946dc-0300-4427-9da0-08dc5a57fa76
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2024 18:48:28.9948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rheF3H4ciO8rj91hyOiwRjjmlJU4W8iYNxMOMbP0IXKwJtfzP2jVCu5lKzfmFEEATGFZP7cFxTjmyI7DUDV69VLkCu/Txfir+nThoLLFDF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7939
X-Proofpoint-ORIG-GUID: EY1vR6WoKPNDnlHsyD4NkqpPBpaqGrJ0
X-Proofpoint-GUID: cQPmTQW22uDOILOTiGJWXjHb8SjDfHcD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_10,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=959 spamscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404110137
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 18:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198141

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBQZXRlciBNYXJrbyB2aWENCj4gbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiBTZW50OiBXZWRuZXNkYXksIEFwcmlsIDEwLCAyMDI0IDExOjA1IEFN
DQo+IFRvOiBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNvbT4NCj4gQ2M6IG9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3Jl
XVtQQVRDSF0gc3lzdGVtZDogbWFrZSBwcmVkaWN0YWJsZSBuYW1lIG1hYyBwb2xpY3kgb3B0LQ0K
PiBvdXQNCj4gDQo+IA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb3Nz
IEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBBcHJpbCAx
MCwgMjAyNCAxODoxOA0KPiBUbzogTWFya28sIFBldGVyIChBRFYgRCBFVSBTSyBCRlMxKSA8UGV0
ZXIuTWFya29Ac2llbWVucy5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0hdIHN5c3RlbWQ6IG1h
a2UgcHJlZGljdGFibGUgbmFtZSBtYWMgcG9saWN5IG9wdC0NCj4gb3V0DQo+IA0KPiA+IE9uIDgg
QXByIDIwMjQsIGF0IDA4OjA0LCBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiA8cGV0ZXIubWFya289c2llbWVucy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+ID4gPg0KPiA+ID4gRnJvbTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMu
Y29tPg0KPiA+ID4NCj4gPiA+IEV2ZW4gdGhlIHBhdGNoIHNheXMgaXQncyBpbmFwcHJvcHJpYXRl
IGZvciB1cHN0cmVhbSwgYW5kIGl0J3MgYWxzbw0KPiA+ID4gaW5hcHByb3ByaWF0ZSBmb3Igc29t
ZSBkb3duc3RyZWFtIHByb2plY3RzLCB0b28uDQo+ID4gPiBTbyBtYWtlIGl0IHBvc3NpYmxlIHRv
IG9wdC1vdXQgb24gaXQuDQo+ID4NCj4gPiBJ4oCZbSBsb29raW5nIGF0IHRoZXNlIHBhdGNoZXMg
YmVjYXVzZSBvZiB0aGUgZmFsbG91dCBmcm9tIHRoZSB1c2Ugb2YgbWF0Y2hlcyBpbg0KPiB0aGUg
aW50ZXJmYWNlcyBmaWxlLiAgIFByZXN1bWFibHkgeW91IHdhbnQgdG8gbWFrZSB0aGlzIG9wdC1v
dXQgZm9yIGNvbmNyZXRlDQo+IHJlYXNvbnMsIGNhbiB5b3UgZXhwbGFpbiB3aGF0IGJyb2tlPw0K
PiA+DQo+ID4gUm9zcw0KPiANCj4gQmFzaWNhbGx5LCB3ZSBoYXZlIG5ldHdvcmttYW5hZ2VyIGFu
ZCBmaXJld2FsbGQgY29uZmlndXJhdGlvbiBtYXRjaGluZw0KPiBpbnRlcmZhY2UgbmFtZXMuDQo+
IEluIGFkZGl0aW9uLCBhbHNvIG91ciBhcHBsaWNhdGlvbnMgYXJlIGhhcmRjb2RpbmcgdGhlIGlu
dGVyZmFjZSBuYW1lcyB0byBiZSBhYmxlDQo+IHRvIGNvbmZpZ3VyZSBpbnRlcmZhY2VzIG9uIGRl
bWFuZC4NCj4gU3dpdGNoaW5nIHRvIGR5bmFtaWMgbmFtZXMgaXMgbm90IHJlYWxpc3RpYy4NCj4g
DQo+IEFmdGVyIHVwZ3JhZGluZyBmcm9tIDUuMF9NMyB0byA1LjBfTTQgb3VyIHdsYW4wIGludGVy
ZmFjZSBnZXRzIHJlbmFtZWQgYnkNCj4gdWRldiBhbmQgdGh1cyBuZXR3b3JraW5nIGJyZWFrcy4N
Cj4gVW5saWtlIG91ciBldGhlcm5ldCBwb3J0cyB3aXRoIG5hbWVzIGRlZmluZWQgaW4gZGV2aWNl
IHRyZWUsIHdpZmkgY2hpcCB1c2VzDQo+IGV4dGVybmFsIHZlbmRvciBrZXJuZWwgbW9kdWxlIHNv
IEknbSBub3Qgc3VyZSBpZiBJJ20gYWJsZSB0byBjb25maWd1cmUgYSBzdGFibGUNCj4ga2VybmVs
IG5hbWUgZm9yIGl0Lg0KPiANCj4gUGV0ZXINCg0KQ29tbWl0IDM3YmQ4ZTguLi4gc2V0cyB0aGUg
Y29uZmlndXJhdGlvbiBpbiA5OS1kZWZhdWx0LmxpbmsgdG8gaW5jbHVkZSBtYWMtYmFzZWQgInBy
ZWRpY3RhYmxlIiBuYW1lcy4gIEkgdGhpbmsgd2Ugc2hvdWxkIGRlY2lkZSBvbiBhIGRlZmF1bHQg
YW5kIGxldCBwZW9wbGUgd2hvIGRvbid0IGxpa2UgaXQgcHV0IGEgbW9kaWZpZWQgdmVyc2lvbiBv
ZiA5OS1kZWZhdWx0LmxpbmsgdW5kZXIgL2V0Yy9zeXN0ZW0vbmV0d29yay4gIFRoZSBpbXBldHVz
IHRvIGFsbG93IG1hYyBiYXNlZCBuYW1lcyBpcyB0aGF0IHNvbWUgYnNwJ3MgZG9uJ3QgcHJvZHVj
ZSBhbnl0aGluZyBlbHNlLCBidXQgdGhhdCBtYWtlcyB0aGUgZGVmYXVsdCBkaWZmZXJlbnQgdGhh
biB0aGUgdXBzdHJlYW0gdmVyc2lvbi4gIEV2ZXJ5b25lIHdpbGwgbm90IHdhbnQgdGhlIHByb3Zp
ZGVkIDk5LWRlZmF1bHQubGluaywgc28gd2UganVzdCBuZWVkIHRvIGRlY2lkZSB3aG8gd2UgY2F0
ZXIgdG8uDQoNCkpvZQ0K

