Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B5ECCD185
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 02:38:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4173.1760582303614463557
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 19:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eOLpQSEw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2384cafde6=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59G2TNin2733232
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 19:38:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=e1T49gpA7S74U4doTJMOXCWwbDCjI0U7KeFHCzlfBK4=; b=
	eOLpQSEwlJpQDtKIMez8YuzZeG1ppNVr1QMVMJLVzX3lsFvNQ1mt+nQklVgzwA6u
	3Nj8vfRrVPDmqF2PIt6CVonxk5jKdNT9JaQ+t+yck3sfzp2AaBCplQ2bK1yvHhOj
	QoOqPNKZLxLoH+h/dmtIdlqskhua4NLEDNbFM58qLB8/M8yyIjb/e0yOBD95O5/7
	iJlG3483XQSs6H9yLbq3b9/LBzHjDeU/eZlQVZZPy0ExtZ95NljngU67bE4NZRAm
	x5KETJDC2JWjOryZTCR8jKYVf07PWDmFMG/nVz8+MCeXBbgqN8PM0sU5VTZquD+Z
	jfNCIjliQgzgK5uDaoh2/g==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012028.outbound.protection.outlook.com [40.107.200.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qprdwchy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 19:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQVprcLklutcPrE7caF5dosGdxEDom5iW5eMuc5/p4V+H+h5pP+tJXg8DzTr3D3wBtXBbPByDPfzW9kjFTLrGYgPFEgYnBfYsJq/+o6OIIW2QJUu48xBa+pf6jVoYPAYmNfc5x6pLIzspcU9s2/aFYCrscJbWsiEZnJe4fFeHKyOt+XlRzweofH1aERZsBC145Wml4SCHqwl/bZxWV1Tqrb9txwCgW05S92nXVqr7m737y6vPrYc24www3YeFblLPPBtL7d/5xbp21E9UZIy1vR4m4PfMfbg8R8t71NqTGOiU8TeSb9NXrgrrVbewLkZxMLn1Q5H76CMtQ7XAmoyVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1T49gpA7S74U4doTJMOXCWwbDCjI0U7KeFHCzlfBK4=;
 b=JpN/LNI98vAQNAfOUZ8eGa0AQUlUUfAD6wmbsbzZBxIeXmdXaPhDPXEzMbhknx9RbroKBRA+DY+6VNhF89IdujwW0woRuKSyA4tzsuCFYYR1inBc7Y6UWg8TgQpeQtjCwHZ/ZYKj0qUqV3aDhVXDLlqFEgfgCISkzfCyJOfrYg3nmrm4ysDoBqYdeHbUPCiGrpvBTACtKac1nPd6j7EzmC4K5EgdbSspWs9MalyvAw0EyvvqXrXlOUxCi3/WQNIHYpSfzjP1plYM7S/Zze2XUSvmSTeG++4g0z4r3p6TYZ8qUQiQjUz3aOJ7SpzYFomPmxy+z364XmQ50bvnoHThCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO1PR11MB4786.namprd11.prod.outlook.com (2603:10b6:303:94::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 02:38:18 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9203.009; Thu, 16 Oct 2025
 02:38:18 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH V2 1/3] musl: avoid redefinition error on ethhdr
Thread-Topic: [OE-core][PATCH V2 1/3] musl: avoid redefinition error on ethhdr
Thread-Index: AQHcPjnIDCKgRGhDQECD9WUCECdm07TEAOaAgAAOU5A=
Date: Thu, 16 Oct 2025 02:38:17 +0000
Message-ID: 
 <CO6PR11MB5602DF0D9ADC4CD8AC6F5B90EDE9A@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20251016011104.145401-1-Qi.Chen@windriver.com>
 <CAMKF1sqeK6s0=7KHx12pr5+WRNtoB2hs9KO-P3WMhzEukLgXxg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqeK6s0=7KHx12pr5+WRNtoB2hs9KO-P3WMhzEukLgXxg@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=85633c76-d93d-408a-a2dd-5c84f6dbe808;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-10-16T02:37:39Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|CO1PR11MB4786:EE_
x-ms-office365-filtering-correlation-id: b643f852-1502-4370-25ef-08de0c5d106b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cEFwUk5lNUh0SFVjaC9Qd29CR04zcXp0cDZWU0tXbnFaZnRnWGtoa3IvUjJv?=
 =?utf-8?B?QnFRMDVEQWg5b2NpRWt3eEl3a2Q2ZC9WWWhxUWNZSm9TMkNlNWgwSmh2QjhJ?=
 =?utf-8?B?bEdZMmpqZXRYRFloMFNTaDdiVTZUVGZ2UERmTWhabEpWbWE5dG1LcTNOLzE5?=
 =?utf-8?B?aGRFbHdxM0F6NGc3emhpc3diL2VsVi96VFAxWnl1Vk9TWW9VcUcvUjRQdGJY?=
 =?utf-8?B?TjdnZHdPaFg0bGFnZ09TR29lR3l5TjY1SlZsem5TRnB4b0ZyNXZJRmlISTVy?=
 =?utf-8?B?S3BiQ2ZtZTh4YmQ3NjNMQWljclRPSzlpOTYrTGJoQlMwU01DNktOdXNXdFRO?=
 =?utf-8?B?RGUzVlJyNjhoR1Nxb2JzbTdHSm8zN2ltWlNRVE1Uc2ROSDlYVVE3Yzk5Z25Q?=
 =?utf-8?B?TS9EZGFMZzlGWDcwcGtvd2hReFFDTTducEdvMk9NSXlSZTFUU2RrRGNwZmRK?=
 =?utf-8?B?S25LVldLWXNiQkYwam1WczFlNFJxWCtTNFRndlNRb2hiMXRpZTVtY0I5empO?=
 =?utf-8?B?dmdsN1JpY3ZLR09BNzRkKzR2SmxhL1lmMkVVQU5uQ3UyN3RIaTNtTzQ5REpj?=
 =?utf-8?B?R042eTRzdTl5ZHRuQ0tYalArVVhOM29vbDdKSTY2OXlHYVIrUDJnQlI2dHcy?=
 =?utf-8?B?R3JVTUNZSm9tLzZEY1hFaHlTYm05SGxKNXBVRElsWitYR1ZQbjkxMFNkcHZN?=
 =?utf-8?B?TkVabmhLUStEeUl5UmJkNXNyaHd6VzgrK2h1RUpsZFBLVWhWcWx2RWRsNUQ4?=
 =?utf-8?B?M0xRK2xnYVEyUWFQTXFYN1JIcS9TY3FpVTZRMjMvOTljcnBROGRCM09BV0Qv?=
 =?utf-8?B?R2NWcW5aUEd0cTFsWDRMT2VleGliVmlvSURib2J0amRwcTdqaFJjYTN5UW5l?=
 =?utf-8?B?MUU4WE56M1d0WTl2ZTQyVVorNzBsQ3dGWUw4TUZBejNwM05oY3A3bWd2MUxw?=
 =?utf-8?B?eWQrUGk1NWJKQ3duRExUeFVzWCtiN01rbnA0MGs4dEcvdk9sTk50VkRXSEpo?=
 =?utf-8?B?aVh5TUFtbEJjQWx4ZFJmOTc0VTJMNGhoeHVvWUJibXd0dnlWZ1hkYnM4dzNS?=
 =?utf-8?B?ZXZLOW9jOGVBWll0SmhZZjF6MGV1bjFkQWZEQnpveWsrbFZmb1NkNnBRRG4x?=
 =?utf-8?B?aHRlTEI1ZEJsRlgvVXUwQ09HcDNTaXIrVUNTcy93Z0xPYlRrS1pwVFk0V3po?=
 =?utf-8?B?R25TcGx3VWoyeTA5UWFZZEcxOTlvZnl5Tko3bHNoOEtnWGJoajlVdm1VeFow?=
 =?utf-8?B?NGpwM0g0aklXcmM5TE5nbC9UbFNLVnNFTTRqVWJ2dHVmMHJMb1NHRWk5Q1h0?=
 =?utf-8?B?anAxWjJIN1pNRE5HVjkzVEhiejBxRXVFQlBDcTNFSGtNcHdxRGxTMkVLT2xU?=
 =?utf-8?B?UGw4Nm53KzJoVkJwYzh1c2VKWmk4UytCQ3ZnOWV4Y3l1aWErdE1JZWE4SDM3?=
 =?utf-8?B?dE0wOFFjZURlVGRhQ0ZIbVhjOE1tQ255Yk5hUlJSbEtYRkpJZUY5em9iUG5h?=
 =?utf-8?B?ZG1aenVReG9yam52QWNTa2dwaHVzbDVPZ3cza2tNTU85dzFBUE1MM3lhVElN?=
 =?utf-8?B?dVZmelBWZm1ySkdhSDROdDJwWmowR3ZBTHVSRTdBQ0FQaklwc2w4d3dRbEFx?=
 =?utf-8?B?KzZMOGVDQVNObTlEeHl4V2ViRElpQVF6RWpGSkZyODFpMlFzOGZGUmVPeCtY?=
 =?utf-8?B?Q1l0L0IzSlN1Z3B0ZmowdkdURjZVWWJuNUtRQ1dhWnZvcVIwaU5FNnM3Wkhs?=
 =?utf-8?B?UkFXZCtveThobFR2cVNtQTMwZnJqallkYTA3eU5qMHliZ0FkMlRqUzJqeFhX?=
 =?utf-8?B?eWY3MkluTUJwUkVvOXlXQXBSeVZtWmFoeml5RzVlUmdoenRPNGZlVS9mVzBZ?=
 =?utf-8?B?czNOMGIwMmJuSGU1ZDVyWm85TTF4NHdnb3BLc3JOR1lNQlNtQ0l6QVJOa1pC?=
 =?utf-8?B?dmdUeG13YVZHeStpZ3ZUNGtIbTJJWG11UExzVThGUEdhT2pqZXFWZFQzVndP?=
 =?utf-8?B?VHgzRWtNc3N3PT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NGovc0tnQy9SR0tIMmFHNml3YmhJZndWeWtraVFVa3A4TSt5VitpMmIvTFVv?=
 =?utf-8?B?YlRNams3Tmo4SXBGaFo3MVFlbEtCWFZZanJzN3JHbVpzTVcvaXpTK3paUjV2?=
 =?utf-8?B?b3c0Q01Lcm5zM2VMV2V0emNwY1RQRGhDaUhNbFBaU3dsVFFnZ1BxSlEyczEr?=
 =?utf-8?B?dXlRbkoyejBzdFBVeVd0dUNDVVZQVlJNU0RPa2ZxcVZaU1NOSTBzQVI5LzJi?=
 =?utf-8?B?T2xYQkF3VTZGTGlnc3NLSnNhSUJWTGNKdFhnendEcFY0ZDk1U2VBby80MXFn?=
 =?utf-8?B?OEJiRjE3NmJyOGYzcGRXMGpaS3FUWnFpdzNnZEc3MzdJbEdIb2Zsb1hjakhx?=
 =?utf-8?B?NHVBTzJuV3prZUNHL0swOUZ6UlhkVVJ3SkZCTGRCS2RTYVNSWjZyNURMK3lD?=
 =?utf-8?B?S1RCUHZmN25yRm5yTDRVcStHQTArRnltTDgvNlM1dzVXZHQydDNrT1NjWC83?=
 =?utf-8?B?NXJqV053ZGVrcWh1MFBOTDg1aTRBUHNRbW5jSFl0a0ZBaG4xQ0tqbzgxK0Nn?=
 =?utf-8?B?SFhzNloyL1dyVUtaM1p6aU5hSTRTbjhwV01BbHVQd2lPSGVoeXdPUStkWkE5?=
 =?utf-8?B?VlZjUVA0SEtDZzVuZzRMOHFldVROdDVyZ3lFejdvcGdDWmR5TzlIbHN4Rit2?=
 =?utf-8?B?NHBoYnVLY281cWZxWXF2WVpIYTIrY1M2SThqeWI5clRzM0I5ZVBKLy93VjJi?=
 =?utf-8?B?eitUd2V5cW5uU1lSRlBFckp1MzRFS2lWL2NYRytYWDArZmxCeUhQaFYzVkNL?=
 =?utf-8?B?eWdObXgvK01IU1dTNFpiOGdpSFFvMnVkYzFRVlFoVVc3MmdZQkdWTGliU0Qz?=
 =?utf-8?B?di8zYk8wNmxWL0VNWC9HbjB1ZkdIaFcwRVFDWjBLQlBaT0lPU2I1TnZVUDNm?=
 =?utf-8?B?ODd3U0tTSlhpUXEvVzJLeURadmxNMWluZzJodS9yVmdNemxBUTlEb0JtVVJn?=
 =?utf-8?B?c1pxZzd1Y0c3K2QvNlVFcUdUbWk1RThxK3dnbUJoM295TGNPWENmQ3VpYjVy?=
 =?utf-8?B?dzN1bkZzbTd0T3UwR0d6UXNrWmNmRUdscUJFNUhtRER6QUNqQTRQVEY3Vy9B?=
 =?utf-8?B?WFU0Q09XOFVrNFFhVllSM1dFSFRjSmZwajMwMTVpTkI0YUdUZEdPZjBldTRX?=
 =?utf-8?B?N3MwRjZjQzN6b1J5NjQwbkRBNDA5QVdLL01BMXgvWHFaeXpHb2dpZ1dtYVdV?=
 =?utf-8?B?N2tzL21lbGhZTThjUU1uMW5wUkVFQmUvRmtKblhHSnJiL0Fid1RJa1BVTGxW?=
 =?utf-8?B?a3U2ME9SWHdsQUFXcWs0RGk3VGljOHlJREpwV21XMEVRTFNzVVRSQllQWUky?=
 =?utf-8?B?VWhPOW53MjExZ3lMQWFsQUlkemNNZjZXUEFwSFo5ejhrTzI1SlhTbGt2UHdo?=
 =?utf-8?B?SWljQ0pUZHJNQ0VtRVZiNGZsZXJTb1Z3NGJqTFVaRmU5TzloQURPSnZNdVVi?=
 =?utf-8?B?YzJ0RW9qdnpJZ05Md2ZxNitkVlg0MzhjNFc5N2lJekxhZUVPV3pIcS96SXo3?=
 =?utf-8?B?QVIwR2VCYVk0Unh0cVN4VnlLZWo0T3A4bExiOEQ0OUxSWU8zWTI2dXE3QWlS?=
 =?utf-8?B?QldzMGxIKytXaXJmMzJ2V1NuRUV3TG0xMGIzdVhsTHU4WEFPOC9CRFZDSEVF?=
 =?utf-8?B?RXRKTGdLa3dFano0YmtBc3kwV2JOS0JldTZqRUcwSzE4cENlTDhIUGxRbnFO?=
 =?utf-8?B?L3V6U1RqeGFkekFXTjBaSndrdEhFREJramprT045aVNTOGVIWjhJYm5qMnV1?=
 =?utf-8?B?MDUrNFF3cDBlRTMreHRpMzVWMExKZDA1M1NneGdtc0NOUW0zOTNLbHpraG04?=
 =?utf-8?B?SEt2dFhTbUhrOUVrVVJnTlRLZ0Q4bm5mRFkrM3MwUWlFUTZWdzMwZ3B5UW5v?=
 =?utf-8?B?aWVJMkxTNkNmai9oTkdsSWdwSmdrVHp3QXkzZ1NEaEgwQ2pNUzRpSmIxTjl5?=
 =?utf-8?B?eHZFTTJMcWxncHZMdXZNRDBlZmJqYVBzbkVHSFYycURRNW5MU2crWFhtWkdL?=
 =?utf-8?B?QWR3cmdWbnMzc0srUERWL1p5WkZjM1V2cFkzYVA2NEQ2WkU3SmJza1B6WTc1?=
 =?utf-8?B?cmxhaFpxZkhnQkJBcWl3Zm1PSFJFYU0waGZFcklnK2dybzJZZEIvS3FveGgw?=
 =?utf-8?Q?fASCGRwhXUqY+7Pwpk1D8PWqy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b643f852-1502-4370-25ef-08de0c5d106b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 02:38:18.0111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KOzcCWMfErPltieSptEWgnCLdbuPiiQ3EnOTQ9/od6vXpWV6vqZ+OMVntYOxfEnYU73B5sZr+4d4BTECmTJIQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4786
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDAxOSBTYWx0ZWRfX91iDqf049V4Q
 ppgOy8mKSuPhmgmDKypTiL+EUE0m8+lxayOdc2LjB2fvj66fD1p5j8dOf3qAbXNhdEFsWO5NKoz
 4WbwD7winmB2XP4VtwTSFu9Utvyq+SdtercQR1N2gDFW+pVF9tuqSxz3ZcIWCXA+2bqShw2q/uR
 awdbLdJBV0XmAlQc83GBih9oydoEgms3X7Y80ZRXEVcT+uDOBT7ZG8BJDymkJbU4j9K7jY6OAi8
 cIgWd/PMXb2vin3wYk9O7KjkCJp6D35EMVE+5Q0K8pxMNKUiPH2AQt3lM2S41OBwikqGSy1IqWN
 hp2nwvQ7zdve2nU+9PmTKmfqIGXHo2ImJxXTSkbQEcOzAoGvgSH8IPwfGmxe/I0L5oSs2n/G+YK
 +C5yen2Nn9WiuzKNNLh9A7mnYesbdw==
X-Proofpoint-GUID: NEeCmFuUyovjKAzKp5RuWUTX21aVECfR
X-Authority-Analysis: v=2.4 cv=JaKxbEKV c=1 sm=1 tr=0 ts=68f05a9f cx=c_pps
 a=7whtcbPCeBOLW6TxF+pv5A==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=XkRKQH6RAAAA:8 a=Q4-j1AaZAAAA:8
 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=5KEJ3k9QAAAA:8 a=HYn7ToBLzTLP1w0FdUAA:9
 a=QEXdDO2ut3YA:10 a=1gUyE30hU_ULiMxJiLUW:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=olg2BfGzmf2haRflzj8J:22
X-Proofpoint-ORIG-GUID: 8YVxd-2JTWgQIYpnVtLDd8oFq1UhlfPk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510160019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 02:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224914

SGkgS2hlbSwNCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4gSSdsbCBmb2xsb3cgeW91ciBzdWdn
ZXN0aW9uIGFuZCBkcm9wIHRoaXMgcGF0Y2ggaW4gVjMuDQoNClJlZ2FyZHMsDQpRaQ0KDQotLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNv
bT4gDQpTZW50OiBUaHVyc2RheSwgT2N0b2JlciAxNiwgMjAyNSA5OjQ2IEFNDQpUbzogQ2hlbiwg
UWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4NCkNjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENIIFYyIDEvM10gbXVz
bDogYXZvaWQgcmVkZWZpbml0aW9uIGVycm9yIG9uIGV0aGhkcg0KDQpPbiBXZWQsIE9jdCAxNSwg
MjAyNSBhdCA2OjEx4oCvUE0gQ2hlbiBRaSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8UWku
Q2hlbj13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPg0KPiBG
cm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+DQo+DQo+IFRoaXMgX19VQVBJX0RF
Rl9FVEhIRFIgbWFjcm8gc2hvdWxkIGJlIGRlZmluZWQgcmlnaHQgYWZ0ZXIgdGhlIA0KPiBkZWZp
bml0aW9uIG9mICdzdHJ1Y3QgZXRoaGRyJywgb3RoZXJ3aXNlLCB3ZSdsbCBnZXQgcmUtZGVmaW5p
dGlvbiANCj4gZXJyb3IgaW4gc29tZSBjYXNlLiBUaGlzIGlzIGJlY2F1c2UgdGhlIGxpbmVzIHVu
ZGVyICdzdHJ1Y3QgZXRoaGRyJyANCj4gZGVmaW5pdGlvbiBhcmUgaGVhZGVyIGZpbGUgaW5jbHVz
aW9uIGxpbmVzIGFuZCB0aG9zZSBoZWFkZXIgZmlsZXMgDQo+IG1pZ2h0IGFsc28gY2hlY2sgX19V
QVBJX0RFRl9FVEhIRFIgYW5kIGRlZmluZSBldGhoZHIsIHJlc3VsdGluZyBpbiANCj4gcmVkZWZp
bml0aW9uIGVycm9yLg0KPg0KDQpJIHRoaW5rIHRoaXMgcGF0Y2ggaXMgbm90IG9uIHNvdW5kIGZv
b3RpbmcuIEkgZG8gbm90IGxpa2UgdXMgcGF0Y2hpbmcgbGliYyBBUElzIHVubGVzcyBpdHMgc29t
ZXRoaW5nIHVwc3RyZWFtIGFjY2VwdHMuIFdlIGNhbiBjYXVzZSB1bmludGVuZGVkIGJlaGF2aW91
cmFsIGNoYW5nZXMgb24geW9jdG8gYmFzZWQgbXVzbCBzeXN0ZW1zIGluIGZ1dHVyZSBhbmQgd2Ug
aGF2ZSB0byBzdXBwb3J0IHRoaXMgZm9yZXZlci4NCg0KUGVyaGFwcyBpdCdzIGJldHRlciB0byBm
aXggc3lzdGVtZCBldmVuIGlmIHRoZSBwYXRjaCB0byBzeXN0ZW1kIHdpbGwgYmUgYSBiaXQgYmln
Z2VyLg0KDQo+IFNpZ25lZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4N
Cj4gLS0tDQo+ICAuLi5pZl9ldGhlci5oLWRlZmluZS1fX1VBUElfREVGX0VUSEhEUi0ucGF0Y2gg
fCAzOSArKysrKysrKysrKysrKysrKysrDQo+ICBtZXRhL3JlY2lwZXMtY29yZS9tdXNsL211c2xf
Z2l0LmJiICAgICAgICAgICAgfCAgMyArLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pICBjcmVhdGUgbW9kZSAxMDA2NDQgDQo+IG1ldGEvcmVjaXBl
cy1jb3JlL211c2wvbXVzbC8wMDAxLWluY2x1ZGUtbmV0aW5ldC1pZl9ldGhlci5oLWRlZmluZS1f
X1UNCj4gQVBJX0RFRl9FVEhIRFItLnBhdGNoDQo+DQo+IGRpZmYgLS1naXQgDQo+IGEvbWV0YS9y
ZWNpcGVzLWNvcmUvbXVzbC9tdXNsLzAwMDEtaW5jbHVkZS1uZXRpbmV0LWlmX2V0aGVyLmgtZGVm
aW5lLV8NCj4gX1VBUElfREVGX0VUSEhEUi0ucGF0Y2ggDQo+IGIvbWV0YS9yZWNpcGVzLWNvcmUv
bXVzbC9tdXNsLzAwMDEtaW5jbHVkZS1uZXRpbmV0LWlmX2V0aGVyLmgtZGVmaW5lLV8NCj4gX1VB
UElfREVGX0VUSEhEUi0ucGF0Y2gNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAw
MDAwMDAwMC4uODAwMjczNjEyZA0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL21ldGEvcmVjaXBl
cy1jb3JlL211c2wvbXVzbC8wMDAxLWluY2x1ZGUtbmV0aW5ldC1pZl9ldGhlci5oLWRlZmkNCj4g
KysrIG5lLV9fVUFQSV9ERUZfRVRISERSLS5wYXRjaA0KPiBAQCAtMCwwICsxLDM5IEBADQo+ICtG
cm9tIDVhYjY0ZjdlMDhlYTAzMjVkODNkNDQ2ZGQ0MDE1ZjgyYjRjMTc5ZGQgTW9uIFNlcCAxNyAw
MDowMDowMCANCj4gKzIwMDENCj4gK0Zyb206IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNv
bT4NCj4gK0RhdGU6IE1vbiwgMjkgU2VwIDIwMjUgMjE6Mzk6MDEgKzA4MDANCj4gK1N1YmplY3Q6
IFtQQVRDSF0gaW5jbHVkZS9uZXRpbmV0L2lmX2V0aGVyLmg6IGRlZmluZSBfX1VBUElfREVGX0VU
SEhEUiANCj4gK2Vhcmx5DQo+ICsNCj4gK0FmdGVyICdzdHJ1Y3QgZXRoaGRyJyBpcyBkZWZpbmVk
LCB3ZSBzaG91bGQgaW1tZWRpYXRlbHkgZGVmaW5lIA0KPiArX19VQVBJX0RFRl9FVEhIRFIuIEJl
Y2F1c2UgdGhlIGZvbGxvd2luZyBsaW5lcyBhcmUgaGVhZGVyIGluY2x1c2lvbiANCj4gK2xpbmVz
IHdoaWNoIG1pZ2h0IGludHJvZHVjZSBoZWFkZXIgZmlsZXMgY2hlY2tpbmcgX19VQVBJX0RFRl9F
VEhIRFIuDQo+ICtJZiB3ZSBkb24ndCBkZWZpbmUgdGhpcyBtYWNybyBlYXJseSwgd2Ugd2lsbCBn
ZXQgcmVkZWZpbml0aW9uIGVycm9yLg0KPiArDQo+ICtVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRl
ZCANCj4gK1todHRwczovL3d3dy5vcGVud2FsbC5jb20vbGlzdHMvbXVzbC8yMDI1LzA5LzMwLzFd
DQo+ICsNCj4gK1NpZ25lZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4N
Cj4gKy0tLQ0KPiArIGluY2x1ZGUvbmV0aW5ldC9pZl9ldGhlci5oIHwgMyArLS0NCj4gKyAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pDQo+ICsNCj4gK2RpZmYg
LS1naXQgYS9pbmNsdWRlL25ldGluZXQvaWZfZXRoZXIuaCBiL2luY2x1ZGUvbmV0aW5ldC9pZl9l
dGhlci5oIA0KPiAraW5kZXggMzQ3OWY1MTEuLmIxNjQ2ZjZmIDEwMDY0NA0KPiArLS0tIGEvaW5j
bHVkZS9uZXRpbmV0L2lmX2V0aGVyLmgNCj4gKysrKyBiL2luY2x1ZGUvbmV0aW5ldC9pZl9ldGhl
ci5oDQo+ICtAQCAtMTE3LDYgKzExNyw3IEBAIHN0cnVjdCBldGhoZHIgew0KPiArICAgICAgIHVp
bnQ4X3QgaF9zb3VyY2VbRVRIX0FMRU5dOw0KPiArICAgICAgIHVpbnQxNl90IGhfcHJvdG87DQo+
ICsgfTsNCj4gKysjZGVmaW5lIF9fVUFQSV9ERUZfRVRISERSICAgICAgIDANCj4gKw0KPiArICNp
bmNsdWRlIDxuZXQvZXRoZXJuZXQuaD4NCj4gKyAjaW5jbHVkZSA8bmV0L2lmX2FycC5oPg0KPiAr
QEAgLTE0NCw2ICsxNDUsNCBAQCBkbyB7IFwNCj4gKyAgICAgICAoZW5hZGRyKVs1XSA9ICgodWlu
dDhfdCAqKWlwYWRkcilbM107IFwgIH0gd2hpbGUoMCkNCj4gKw0KPiArLSNkZWZpbmUgX19VQVBJ
X0RFRl9FVEhIRFIgICAgICAgMA0KPiArLQ0KPiArICNlbmRpZg0KPiArLS0NCj4gKzIuMzQuMQ0K
PiArDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9tdXNsL211c2xfZ2l0LmJiIA0K
PiBiL21ldGEvcmVjaXBlcy1jb3JlL211c2wvbXVzbF9naXQuYmINCj4gaW5kZXggM2Y1ZmEzN2Zi
YS4uMjU0Nzc0ZjU3ZSAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvbXVzbC9tdXNs
X2dpdC5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMtY29yZS9tdXNsL211c2xfZ2l0LmJiDQo+IEBA
IC0xNCw3ICsxNCw4IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0Lm11c2wtbGliYy5vcmcvbXVzbDti
cmFuY2g9bWFzdGVyIFwNCj4gICAgICAgICAgICAgZmlsZTovLzAwMDEtTWFrZS1keW5hbWljLWxp
bmtlci1hLXJlbGF0aXZlLXN5bWxpbmstdG8tbGliYy5wYXRjaCBcDQo+ICAgICAgICAgICAgIGZp
bGU6Ly8wMDAyLWxkc28tVXNlLXN5c2xpYmRpci1hbmQtbGliZGlyLWFzLWRlZmF1bHQtcGF0aGVz
LXRvLWwucGF0Y2ggXA0KPiAgICAgICAgICAgICBmaWxlOi8vMDAwMS1VcGRhdGUtc3lzY2FsbHMt
Zm9yLXIzMi1ydjY0LWZyb20ta2VybmVsLTYuNC10aHJvdWdoLnBhdGNoIFwNCj4gLSAgICAgICAg
ICAiDQo+ICsgICAgICAgICAgIGZpbGU6Ly8wMDAxLWluY2x1ZGUtbmV0aW5ldC1pZl9ldGhlci5o
LWRlZmluZS1fX1VBUElfREVGX0VUSEhEUi0ucGF0Y2ggXA0KPiArICAgICAgICAgICAiDQo+DQo+
ICBQUk9WSURFUyArPSAidmlydHVhbC9saWJjIHZpcnR1YWwvbGliaWNvbnYgdmlydHVhbC9saWJp
bnRsIHZpcnR1YWwvY3J5cHQiDQo+DQo+IC0tDQo+IDIuMzQuMQ0KPg0KPg0KPiAtPS09LT0tPS09
LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8g
dGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMyMjQ5MDkpOiANCj4gaHR0cHM6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8yMjQ5MDkN
Cj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTE1
NzgyNTU0LzE5OTc5MTQNCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVt
YmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViIA0KPiBbcmFqLmtoZW1AZ21haWwu
Y29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPg0K

