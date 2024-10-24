Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6A4CE8E9E
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 18:56:13 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.57])
 by mx.groups.io with SMTP id smtpd.web10.4322.1729796169785294062
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 11:56:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=H776SHKm;
 spf=pass (domain: siemens.com, ip: 40.107.22.57, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vH1/WR+y9ZYS072HNfjDtJ8lgshSlgjqBCQMgz+t6VeazN/iDOzkjPwYu2NcVq3pS8E20FbfNwB9absBJBW0hcSlhcJW3BIawkXIac3lXXbO/m1FUqd75bVGWl0tP7VqqvrOyL8KxKczdWKkTqeAeqA1lvREnXvj+oAD9sdoXpbZ6FXmr7RZyogmkYxIqg06aCfQK1ydS2tXEF7nyvv2J0tgxo28JYVrD/VfLJXYRt2s9iM6U8X2hUj29vfOy9y5zuadkNnfEOI5ZIEO0endQRer3Y2Zc9JjWtZDdTq740nM+IHG3DG9X2aAMALiRKY3lkClNyAre7G9JW54GVgqVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouD4ToURr20ycoi+vIHUPyzKwv6CF+7ioESTYiswlfc=;
 b=VC053Fc78Bcx4iuQtCMooYJWTD1oOwFA7YKDNQkp2c5gvOxeooWjqbcmkBHsRtUndb+N5UjmiiFN83+nTYIv6PSaoE8ezcyzMNjRoh56anW+xR0Ef72u8ndvUOTxOaaJ5QMjMxkWoaYWPiuQ9znAqNqTY7SuuGWS9oytChGLURYLZ8Ieprr46PYiJMSEFznFlj9SEJd1JbcXfLNhi0Z6zu62Ex5Hn6NzmSfz/rKrwReMwD4lY9brXYJTTIHYWe5+AI2d23jJUNZxENYjuQ1jZWfnXZeo4XK2JUA530eTFVz+MtsHiq/6So1A5jZoUbsJd/rYvVuS55rtR5XsZu/VHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouD4ToURr20ycoi+vIHUPyzKwv6CF+7ioESTYiswlfc=;
 b=H776SHKmA04dn/utYRBvg4sUkcOZT3uranP3jepFQnavoQ6NC0M3tibcSzSK6LVh/AR2sSY+uDxBxz9FZo2jBCuTujQvFegSlZN5IYijL/qg7WjNodQsS5cc8Ek+bJ5FipJygwO/ZvHVGh9NIKowPgpmdL8LH3DpBdVqJPECbOTwuPn9CFTPgmqAXG3EhRoYwHo9Sv0kIIsOfd/1+6UWbirgvOVRFtthoeh563+rcGgK6rDbB4YcYcXod+o3rInYCy31zPGgDsGPRKW3M+esuNcBL/3K+P5evxurkXlclbIbYvI4nyKp8NQCSR6g/NBLibjr7676Ft+46p4v0qbq7A==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VI1PR10MB3728.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:131::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.16; Thu, 24 Oct
 2024 18:56:06 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 18:56:06 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Steve Sakoman <steve@sakoman.com>
Subject: RE: [OE-core][PATCH] openssl: upgrade 3.3.1 -> 3.4.0
Thread-Topic: [OE-core][PATCH] openssl: upgrade 3.3.1 -> 3.4.0
Thread-Index: AQHbJf2GZJQ7sxHz3UqG5JH2Mbf4ALKWORgA
Date: Thu, 24 Oct 2024 18:56:06 +0000
Message-ID: 
 <AS1PR10MB56977189B862AC8B9F71791EFD4E2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241023184829.2216595-1-peter.marko@siemens.com>
	 <180155B44E341F73.23694@lists.openembedded.org>
 <bc5ea6421ee3bf54f3f950f79036d3b51e60b3d4.camel@linuxfoundation.org>
In-Reply-To: 
 <bc5ea6421ee3bf54f3f950f79036d3b51e60b3d4.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=85957289-081d-4291-90a9-85e02d0093a4;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-10-24T18:28:35Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VI1PR10MB3728:EE_
x-ms-office365-filtering-correlation-id: c662aa0d-de6a-434f-cb61-08dcf45d8406
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?YUt4TVB5UG1JeGozT3pCc0gzZXVwSkwvdXNXS2pDQVM5cTRXUGNJZHY0Vmty?=
 =?utf-8?B?ZHZxREp3Y0ZYdHkxaVR4MnY0S3F6SzY0Y0NGQS9JWVhaSEpwRm9qdUlPOXdj?=
 =?utf-8?B?T1JXR042eUlYNkdHL1dmYzFVRGI2NkJnbzNRN3Q5dGRXMHJScTduUllYUGxQ?=
 =?utf-8?B?UlRrdXlNN1RCazlRcmZwQUI0RkZHdC9jaFpQUkNPZURkc04wejdSQk1yYzll?=
 =?utf-8?B?YkdMRTM3OWMwQzJFalQ0V3V6Z1ZkbndMY2gvaElpUGp0NFhqM0tkMGxONm0w?=
 =?utf-8?B?M1ByQzlKZUdqMkJ6R2VqOThFOFNUV2R0cG96TE8yNUdhUldWaDRxdGlWNEVW?=
 =?utf-8?B?eHpubU0rS0xlVnl5QVJaOW5FUGZONDRWcWZid2VVeDh5TEk2OFJQalQwYmFs?=
 =?utf-8?B?Z1F5K0xoUDBuaXRleVdLeW44RGEyMG15WVBpUkVjM2J3d3FtRUZUSmlpT1F2?=
 =?utf-8?B?WEN2VzFGWENtMkg5TytIaXQ1OUZrWU9qRXlNWDZnbnFjRVFHaVo5ZVpmT29x?=
 =?utf-8?B?cm9aeXY1bnR5cmsvcHl1ZHRpZllKN2owcm84NHMveE02ZjdiWHlMRnhOT3pi?=
 =?utf-8?B?YjZkV0EzZ1RrbWZZc1dJL1ZpdnM5UjlDQnh2Y3ludHgybUNHbFRxaFVxQ2Fw?=
 =?utf-8?B?VlJ2Q2lyclVidm9DM0NoM1JKbU4xTEhVa09XVjlBSk5zbXdjVzVtSFNxNXRJ?=
 =?utf-8?B?Y3Fha3FVVmZ3eGw1TEFVeUVRNUplOGJwaU5GTEZpQVdyeDkzVk9BZjByK1Nw?=
 =?utf-8?B?T0JwNm1wclJuZTd5OXBZbGVaTEtYbEpHSTZwaEpjWVdrQWcrVGtBT1VHSDRF?=
 =?utf-8?B?OFZnVnFVczhyT1QvblJpSVpReGZ0QTd6WFI2VFRvdFJkNVVMWjFSSnc3dDdI?=
 =?utf-8?B?OUkvcS9WanhReFBkVk91T1JKRDVPYkJpMFhwWGdFQzI5VkNsaURPWVc0Z3V4?=
 =?utf-8?B?aUxOU2tjdDQxKzFqTS9Zby9zQzNnNDMyMTErZWo3R1B3dWlhOUd3ekhKSGZM?=
 =?utf-8?B?QVF3bFFmZy9MdjFMeFd2a3BmNHppSHVUZW1saGxwQTNoZTkrRkdVcTIvTm5U?=
 =?utf-8?B?ZkRMR1BlSDdINXduQkozSlNVS1F5RkVlcTNhaUZuVzYxa0FGa2VUS09saGxv?=
 =?utf-8?B?cmxjUTFpaTVGeEdZa01pU05idkwyU1MwSkQzRko0QXdhTXR4a0ZiQTVmYU8y?=
 =?utf-8?B?ZWt5SXhpYm52a0VKRUNONWMrbDM4dVBXZEtUbUFyY0c2dEdncWdxNEJ2eFFi?=
 =?utf-8?B?akF6S243YTJuNnZUbmthOUVIQUd3b2dRMDI0NVJpSFFRWVlGWnh5dm9tWnBY?=
 =?utf-8?B?SzVKdlNuQ1JOME1Wa3hkb1dEOXBXUVIyYldxV2hsTnVMLytORnMwUlM2Rmwy?=
 =?utf-8?B?aFNWbnFTU0hyUzl6T1ZPaEdWRk9BZHdYSEl6cXptU1ROaHc4SXZkQzUzWElx?=
 =?utf-8?B?OW9ibWw5SVc4ZDFmZHRLVDNsQnRyWFZENUVyOW1pb1JBc0lDOGV1Q01OR0Ni?=
 =?utf-8?B?RHlBT2V4Z0JpM1pCcEcvbmdIVldYYmluUm1hbzJuRlR5bHNSb3V5Z3UrakNR?=
 =?utf-8?B?M3RxM09maThuMldYVzJ1Y3BvQ1Z0SDYvbEdQZHJSRW4rM2l4aXorQjJ0WjhL?=
 =?utf-8?B?U3dScEdad0U1MmZKUGdHelU4WTVnRTFyUEhYQmgwYXpzNEs5QnY4REdlN0t4?=
 =?utf-8?B?cUdvQ0dvZG4zWi9ueFBKYlZFbG5OdW1yTitYUVd6STFBaS9POXRDOWF5RDhx?=
 =?utf-8?Q?MNgmmDP07CYdwhpkHsNYUuYNhmW+92rWXe624+K?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NDFuWENwbWpBZkFKZ21GZEN6QmUrVG16MVpRMEhGSHMyckNIYUg5cHhoV2ZS?=
 =?utf-8?B?MUJ3cnpsSytiRDhLajg4bEE0L1BkblMyY000Tk1ZcDNaRk9YbHpGb2hocm45?=
 =?utf-8?B?czJwR0JDK0JqbGY3RmV3MXQ5VUJKZXJnalA3N0RoV3JOU3YvcnFELzB1Tm1E?=
 =?utf-8?B?QWU3ZHhQT3R5bmZuS2ovWlFHOW0vS2dlTXQvQTZ3dDl3YS9hbFhtUHZaR3Bl?=
 =?utf-8?B?RXNzMEJ3NlBrYmc2NUJFRnZzalhzQjNsTzVrcy9OUkpaRHUxSTZkNDk3YUpT?=
 =?utf-8?B?azc3b1hManhzM2ZZdDJKaW9Xc3lqWEZOSW5KdGQvNE1UdWdvS3plb05oR00w?=
 =?utf-8?B?UzgwSlJrc1dMSW1wamI4UUFKY3BIN2ZwdlJ2Mi9wRnVTWm1GTjRMZEROMDhC?=
 =?utf-8?B?SlBDTVN3R0V5M0xtUVNUV2psSXpTM0UrQXBzY2ZBSy9VWVpJZ05xV1V3SW5Y?=
 =?utf-8?B?VWNUQXNHM1c5QitaTUFKV25mNDhHWHZ4eEo4dWhtVFVDd1BqNjczRFVWME1S?=
 =?utf-8?B?TWxFQjdESEhkNlIyaEZoZWFEZzQxc2lITU1ZUUdVQWFiOWFJRGZKbnhkcmxk?=
 =?utf-8?B?SDM2aEtyR1BTNXBiS3lUREtiU2VTY1VzSU1HOHFFQjFGV1kyeG9aeUN0cVY2?=
 =?utf-8?B?UExWQmxjOFVQRXUxNEhmWnZwTTF4Z1Z5dExJbk02MWJoWFVnMFBCYkorVW9Z?=
 =?utf-8?B?dlFmWHl4OHRVWEFMenNnMXd1WThsMGNlaEN2YWNhenNZOHZKTmhXZWJjMXVr?=
 =?utf-8?B?eWpjRDVYMFBpNVJYWUNtbThWWExIaThyY3dqZjgvbFBtbEtzNUZqY3lmT3Bt?=
 =?utf-8?B?Uy9PaXhDOG1keGZqa2t4MGdtWHkveWxySE1oRjNyUG9hb2tMdnNiWS9xRjhr?=
 =?utf-8?B?MzdmcEdSTGk5cEFVSDYxbWlMZjBtaUFiWmpUd0xXVmkybzB3NDVXRXg0YTBr?=
 =?utf-8?B?enpzd0tUcXdUanlUN2xOR2ZXdHpTbzRjT0EvU2dUNW9aSnUxZlJYYitncTF1?=
 =?utf-8?B?d1l0amZTRTdDaEFGWSs2OE5CWmhZcldXbSt2d3ROdm5RUk9nRFZ3by9wTUhn?=
 =?utf-8?B?TjFKdFZwMldYT0xlaDZvcHBzZXVWQmQrbVo2dGtyMlYraHVIQ0hseHJWM1Bm?=
 =?utf-8?B?Skxjd2ZWNjFJMGN5UGUyazhGMVY0QjZ6TWN4bGdGVnFwWDlYWmhkV0QvT3Rs?=
 =?utf-8?B?Y1RRTXZBYlJUNW9LN3BaeGV6UW5wcXNGcENNUTExUlpSS2gyN2pFeFNKWGNK?=
 =?utf-8?B?c0Z5SW12YW5PT1lJY2R6dnVUV0lJUTdRbHF6M3dLMFVHNEQ1QVc2ZGh5ZGZN?=
 =?utf-8?B?Yi9VZHl5L3k1cnp6MnhxY3gwKzRWcCtrUVd5RmR0REdFSjB2SGVtUXd4elIr?=
 =?utf-8?B?Zm9CYXdXZUhDRzAyMnNJaDlZTm9FVEVQNTlVS2ZRZzEyeFBCVmpXRUFHaDB5?=
 =?utf-8?B?SHVWMlMwY3pxZ1hPb2ZFSFRYQzBoV052by91eHYxSnYxOGo4ZllTVndRdm5V?=
 =?utf-8?B?SG0vZmJBYmQ3NmhxN0NRblFreFdOUGJDaCs2QzVqQy9SSHhVWDk0c3R2ZEpu?=
 =?utf-8?B?QytON3ZUZGRnMjVaN3lEakFSQTZDMnJmc3BxK0NXVUlqT2ltUUFGbmZJYjdl?=
 =?utf-8?B?TGZHWVhubnYzNm96b1hvWlUzbUM3RlRRdzJxRTIwSWQwY0xLMkhSTVFBRE01?=
 =?utf-8?B?bW1XZW1MWHdaTS9FV2xnZFlFUStlam1ZSjM0Z3IyRUZtYkpRNTN5S2kwZlJY?=
 =?utf-8?B?MWsybDRPVWV3T3poMms2NFYwamFFbmpLeUxWMHhzcW52OTk3NTlzd0JQUzVj?=
 =?utf-8?B?ZjZBWVk3d3JFck5tVno1UXNNdzIrWVlvNCsvZC9xYXgyRTdZZitvKzFxVTFB?=
 =?utf-8?B?ak9LNkJsRVlGZkJ1OXlVTCt3S3Q2Z2Nkc3pDTVp6K2pjek5iSDVtbVBrY0pi?=
 =?utf-8?B?ZWVNWUtDTXhjT1ZVV1JVcXNaRDFwUVI1TllXN1FYaytLSWJFRE9yMVlDRTg5?=
 =?utf-8?B?WGlhOS8xWktrc09GeGVtQUpnc0RoNGE4elNhK1dtRW5odzA3dEF2Q3pIT25G?=
 =?utf-8?B?VEtNQTM0ZEgweXY3THFXWUJYb0xPVDZLTUE3STVScjlLWklicWpTZDgvc1dq?=
 =?utf-8?Q?o7lqEtMSrnXsDJ36ykPSbYNk3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c662aa0d-de6a-434f-cb61-08dcf45d8406
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 18:56:06.3466
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0HX6jlqdD5OBzjXPqdthIOIYoagtielaphbkL2tEQXIHJuF4wvEmk4Cd8LryHHaVsLN68WUN9+w0xGuQaIzUOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3728
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 18:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206302

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIE9jdG9i
ZXIgMjQsIDIwMjQgMTI6MTQNCj4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8
UGV0ZXIuTWFya29Ac2llbWVucy5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnOyBTdGV2ZSBTYWtvbWFuDQo+IDxzdGV2ZUBzYWtvbWFuLmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSF0gb3BlbnNzbDogdXBncmFkZSAzLjMuMSAtPiAzLjQu
MA0KPiANCj4gT24gVGh1LCAyMDI0LTEwLTI0IGF0IDA5OjE5ICswMTAwLCBSaWNoYXJkIFB1cmRp
ZSB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBPbiBXZWQsIDIwMjQt
MTAtMjMgYXQgMjA6NDggKzAyMDAsIFBldGVyIE1hcmtvIHZpYQ0KPiA+IGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgd3JvdGU6DQo+ID4gPiBGcm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2ll
bWVucy5jb20+DQo+ID4gPg0KPiA+ID4gUmVsZWFzZSBpbmZvcm1hdGlvbjoNCj4gPiA+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9vcGVuc3NsL29wZW5zc2wvYmxvYi9vcGVuc3NsLTMuNC9ORVdTLm1kI21h
am9yLQ0KPiBjaGFuZ2VzLWJldHdlZW4tb3BlbnNzbC0zMy1hbmQtb3BlbnNzbC0zNDAtMjItb2N0
LTIwMjQNCj4gPiA+DQo+ID4gPiBIYW5kbGVzIENWRS0yMDI0LTkxNDMNCj4gPiA+DQo+ID4gPiBS
ZWZyZXNoZWQgcGF0Y2hlcy4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBNYXJr
byA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IMKgLi4ua2UtaGlz
dG9yeS1yZXBvcnRpbmctd2hlbi10ZXN0LWZhaWxzLnBhdGNoIHwgNTMgKysrKysrKystLS0tLS0t
DQo+ID4gPiAtLS0tDQo+ID4gPiDCoC4uLjEtQ29uZmlndXJlLWRvLW5vdC10d2Vhay1taXBzLWNm
bGFncy5wYXRjaCB8wqAgNCArLQ0KPiA+ID4gwqAuLi5zeXNyb290LWFuZC1kZWJ1Zy1wcmVmaXgt
bWFwLWZyb20tY28ucGF0Y2ggfMKgIDQgKy0NCj4gPiA+IMKgLi4uL3tvcGVuc3NsXzMuMy4xLmJi
ID0+IG9wZW5zc2xfMy40LjAuYmJ9wqDCoMKgIHzCoCAyICstDQo+ID4gPiDCoDQgZmlsZXMgY2hh
bmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMzUgZGVsZXRpb25zKC0pDQo+ID4gPiDCoHJlbmFtZSBt
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wve29wZW5zc2xfMy4zLjEuYmIgPT4NCj4g
PiA+IG9wZW5zc2xfMy40LjAuYmJ9ICg5OSUpDQo+ID4NCj4gPiBVbmZvcnR1bmF0ZWx5IHRoaXMg
Y2F1c2VzIGEgcmVncmVzc2lvbiBpbiBweXRob24zJ3MgcHRlc3Q6DQo+ID4NCj4gPiBodHRwczov
L3ZhbGt5cmllLnlvY3RvcHJvamVjdC5vcmcvIy9idWlsZGVycy83My9idWlsZHMvMjcwDQo+ID4N
Cj4gPiBJIGRpZCByZXZlcnQgdGhpcyBwYXRjaCBhbmQgdGVzdGVkIGEgYnVpbGQgYW5kIHRoYXQg
cGFzc2VzIHNvIGl0IGlzDQo+ID4gZGVmaW5pdGVseSBmcm9tIGhlcmUuDQo+ID4NCj4gPiBJJ20g
dHJ5aW5nIHRoaXMgaW4gY29uanVuY3Rpb24gd2l0aCB0aGUgcHl0aG9uIDMuMTMgdXBncmFkZSB3
aGljaA0KPiA+IG1pZ2h0DQo+ID4gbGV0IHVzIGZpeCB0aGlzIGZvciBtYXN0ZXIgYnV0IGlmIHNv
LCB0aGUgcHJvYmxlbSBmb3Igc3R5aGVhZCBhbmQNCj4gPiBlYXJsaWVyIHdpbGwgcHJvYmFibHkg
cmVtYWluLg0KPiA+DQo+ID4gVGhlcmUgd2FzIGEgcmVsYXRlZCBweXRob24gYnVnOg0KPiA+DQo+
ID4gaHR0cHM6Ly9naXRodWIuY29tL3B5dGhvbi9jcHl0aG9uL2lzc3Vlcy84Nzc0Mw0KPiA+DQo+
ID4gQ29weWluZyBTdGV2ZSBzbyBoZSBrbm93cyB0aGF0IGdyZW1saW5zIGx1cmsgaGVyZS4uLg0K
PiANCj4gVGhlIDMuMTMgdXBncmFkZSBkb2Vzbid0IGhlbHAgc28gd2UncmUgZ29pbmcgdG8gbmVl
ZCB0byByZXNvbHZlIHRoZQ0KPiBwdGVzdCBpc3N1ZSBzb21laG93IHRvIG1lcmdlIHRoaXMuLi4N
Cj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCg0KUmljaGFyZCwNCg0KSSB3YXMgYWJsZSB0
byBiaXNlY3Qgb3BlbnNzbCB0byBodHRwczovL2dpdGh1Yi5jb20vb3BlbnNzbC9vcGVuc3NsL2Nv
bW1pdC85MzNmNTdkZmUyMTY1N2Y3YWJhOGYxM2UwY2RiM2IwMmRkNjRmY2MzDQpXaGVuIEkgcmV2
ZXJ0IHRoaXMgY29tbWl0LCB0aGVuIHRoZSBweXRob24zLXB0ZXN0IHN1Y2NlZWRzIGFsc28gd2l0
aCBvcGVuc3NsIDMuNC4wLg0KSSBoYXZlIGNyZWF0ZWQgaHR0cHM6Ly9naXRodWIuY29tL3B5dGhv
bi9jcHl0aG9uL2lzc3Vlcy8xMjU5MzYgdG8gaW5mb3JtIGNweXRob24gbWFpbnRhaW5lcnMuDQpJ
IGRvbid0IGhhdmUgZW5vdWdoIGtub3dsZWRnZSB0byBmaXggaXQgbXlzZWxmIGJ1dCBJIHRoaW5r
IHRoYXQgdGhlIG9wZW5zc2wgY29tbWl0IGJyZWFraW5nIHRoaW5ncyBzaG91bGQgYmUgZ3JlYXQg
bGVhZCBmb3Igc29tZW9uZSBlbHNlLg0KDQpEdXJpbmcgdGhlIGludmVzdGlnYXRpb24sIEkgaGF2
ZSBhbHNvIGZvdW5kIDIgZm9sbG93aW5nIHByb2JsZW1zIHdpdGggcHl0aG9uOg0KDQoxKSB3aGVu
IHJ1bm5pbmcgcHRlc3QgaW4gY29yZS1pbWFnZS1taW5pbWFsLCB0aGVyZSBhcmUgdHdvIGNyYXNo
ZXMgaW4gY29uc29sZSAoYm90aCB3aXRoIG9wZW5zc2wgMy4zLjEgYW5kIDMuNC4wKToNClsgICA5
MS40ODI0NjFdIHB5dGhvbjNbODYwNV06IHNlZ2ZhdWx0IGF0IDEwIGlwIDAwMDA3ZjViMDc2MGY1
NjEgc3AgMDAwMDdmZmVkYTEyYzQ0MCBlcnJvciA0IGluIGxpYnB5dGhvbjMuMTIuc28uMS4wWzFh
ZTU2MSw3ZjViMDc1NjYwMDArMjNjMDAwXSBsaWtlbHkgb24gQ1BVIDAgKGNvcmUgMCwgc29ja2V0
IDApDQpbICAgOTEuNDg1MjEzXSBDb2RlOiAwZiAxZiA4NCAwMCAwMCAwMCAwMCAwMCA5MCA0MSA1
NCA1NSA1MyA0OCA4OSBmYiA2NiA0OCA4ZCAzZCBjOSBkOSAzNSAwMCA2NiA2NiA0OCBlOCA3OSA5
MCBmNSBmZiA0YyA4YiAyNSBjYSBkNyAzNSAwMCA0OCA4YiAwMCA8NDg+IDhiIDY4IDEwIDQ5IDNi
IDZjIDI0IDMwIDc0IDA5IGY2IDg1IGIwIDA2IDAwIDAwIDIwIDc1IDRiIDQ4IDhkDQpbICAxMTgu
ODcxMDU3XSBweXRob24zWzEyMjE0XTogc2VnZmF1bHQgYXQgMTAgaXAgMDAwMDdmN2FkNWRkMjU2
MSBzcCAwMDAwN2Y3YWQ1MGY3ZGQwIGVycm9yIDQgaW4gbGlicHl0aG9uMy4xMi5zby4xLjBbMWFl
NTYxLDdmN2FkNWQyOTAwMCsyM2MwMDBdIGxpa2VseSBvbiBDUFUgMiAoY29yZSAyLCBzb2NrZXQg
MCkNClsgIDExOC44NzM5OTFdIENvZGU6IDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAwIDkwIDQxIDU0
IDU1IDUzIDQ4IDg5IGZiIDY2IDQ4IDhkIDNkIGM5IGQ5IDM1IDAwIDY2IDY2IDQ4IGU4IDc5IDkw
IGY1IGZmIDRjIDhiIDI1IGNhIGQ3IDM1IDAwIDQ4IDhiIDAwIDw0OD4gOGIgNjggMTAgNDkgM2Ig
NmMgMjQgMzAgNzQgMDkgZjYgODUgYjAgMDYgMDAgMDAgMjAgNzUgNGIgNDggOGQNCg0KMikgcHl0
aG9uIHB0ZXN0IHBhcnNpbmcgaXMgd3JvbmcsIGl0IGRldGVjdGVkIG9ubHkgb25lIGZyb20gOCB0
ZXN0IGZhaWx1cmVzIChzZWUgbXkgY3B5dGhvbiBpc3N1ZSBhbmQgcHRlc3QgbG9ncykuDQoNCkNv
dWxkIHNvbWVvbmUgY3JlYXRlIEJ1Z3ppbGxhIGVudHJpZXMgZm9yIHRoZXNlPw0KDQpSZWdhcmRz
LA0KICBQZXRlcg0KDQo=

