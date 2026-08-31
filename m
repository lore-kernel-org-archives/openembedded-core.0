Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEF3C624A4
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 14:57:11 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31553.1788188229249320387
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 07:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=aL0tuURJ;
 spf=pass (domain: siemens.com, ip: 40.107.159.9, mailfrom: peter.tatrai.ext@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VKTq41CJIqLVljzm9ZSNfyVQ4+7SjqIXRP42+c5lggTaPLW3Np3WRXmH0T3SrA1WMCK212tCzGfc6SuWHAt/8ZwMSiWt2R+A/5QL9J+g87ij4LmNQlwCkfku4+ZN0F8DjAD0kmt2YiqmPCiWn2BuCwCkhnAUsD0IOQFesq7eJjf5tlI1qHZLnky5F81VqjLEEl86mX2xdBYaF8mLvZrs5cK0xccew5auJz2Cn3TSQDCDzIGjXLOxyHZ/AANETil/WJX90QJnT8PmOucvWYW4AcIQFAvZ8WIAV8jKYoA6r62HB4D3Wo+cfSG9IW074mPTbo18c3rI0UZ6EeMALNh8mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmURU3/yjWySXiCNI735UvyX4FvZngR9XcLFFEy2BMg=;
 b=Mh/SMOGdFYiI7TepU+2fG8jj8Li0DwdNwhKaYD7WE1I9iar0KnbHiHU/6PxHVM0pON/A+48yyrF9u2YpRwnVxAY6ur64C5rFEiT/rJjPs91qCbBe7+gEmz9BgAS6UAIrNqlHhmXkwmFfbpdbg3CBhPmlehX8cACdKgA+Y87g+3ofBzNcCRYMuUArPGztnRhvrfgpIp27wQOfD1l+pB+uLtFz9PXBsWUkufKlDeRSnYrn7ToNvCwPfm5sfbpvHgcei8GQKbzLuiHxloT6t5zvRiteuKH01Zf47scLwcP0wyaP85CiLaGS1fRE506jmUsyBG5ZCAytXPq6rFKfPDfnuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmURU3/yjWySXiCNI735UvyX4FvZngR9XcLFFEy2BMg=;
 b=aL0tuURJ72ZmXCsH2nNKHDWA8hzunHArS8qlR+DKdM0D8d8V1NlyMT9MckGE9VSZjo87iJ4eEiHOrXfXXoZBe4aUnhZoOOyH0x79gEXTpCszGJjG7+AAQpyrZNJkbMXpr4jMGiYbz4JiVfhlpNYDVqpzxnka6vKxVRHiyl+kpvqqWU8w1DEqZvnc8HH97JFswlTGyj4Vq2KtVkOGCQkFzJBjmJWU0T9kcNaoMnv8nIQGO8nY09LRM+cqEM5G23m/zUh08kIp5kp+hMqtjVbQmW7FubCkY2ngfiV0CAP9IlGISI9VHwCiSB9J+anYCllZibrFn18LoFVIbrINT5ND1A==
Received: from AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:605::21)
 by GVXPR10MB8841.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 14:57:04 +0000
Received: from AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9f70:952:2a71:7f3f]) by AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9f70:952:2a71:7f3f%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 14:57:04 +0000
From: "Tatrai, Peter" <peter.tatrai.ext@siemens.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [scarthgap][PATCH] time64: enable 64-bit
 time/file-offset flags for 32-bit nativesdk
Thread-Topic: [OE-core] [scarthgap][PATCH] time64: enable 64-bit
 time/file-offset flags for 32-bit nativesdk
Thread-Index: AQHdNS2z2KAAmFRUZU2mNrv3Qdc+Nba228AAgAFnuNA=
Date: Mon, 31 Aug 2026 14:57:04 +0000
Message-ID: 
 <AS2PR10MB7347225FBE1F80F0519A80DDDBA92@AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM>
References: <20260826073701.367061-1-peter.tatrai.ext@siemens.com>
 <DL2G4HBXZK8O.2BJXQFIJGNX9C@smile.fr>
In-Reply-To: <DL2G4HBXZK8O.2BJXQFIJGNX9C@smile.fr>
Accept-Language: en-US, sk-SK
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=46fb9c56-caca-4604-9a31-5edc9f8f528c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-08-31T14:42:14Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR10MB7347:EE_|GVXPR10MB8841:EE_
x-ms-office365-filtering-correlation-id: 5fa343b1-df64-4fb4-f4ad-08df07701ea8
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|55112099003|18002099003|22082099003|38070700021|56012099006|11063799006|4143699003|10067099003;
x-microsoft-antispam-message-info: 
 +PmkjGp5QEjMrYOxoogOxXR+B6PNX7AsUR2lw57CtI/QSyTwSJMH36cgmQgG9LUFZH8e7FJlUbyL04uN9etFGlaTfscOrA+8Gid0MfzO78HANvc09zrLNu76AT1yWFCc6Ta7WfK2cgaSzy5GUaa8NffsENrYFPCyXBSWTGIVDi4XvvoClp6q9xeeCTgN7AIzHPM/vpJBOro8yVIp7S6nAbSrcqt+yP/lxJ2Ryu2XNMCiBb+1Qj64HgAmlq7vwBJmvOFbs3laGv2IF5SLAP84yNazu5onkLBEOXIxdCdx+zKA4YiInT5ok0bVhPaJy3vcEZ6OURl2NnhlcXQuVMrHK6y3eYK6L/e9Qt1PBZ7A56y4BIly/QH3qD9vQWJRaUFQHxQT2e7t7zw+5pHsP79lXtUF2MxjFKEtj014iBvLy4ErdFebfkXsITNW8jqMX4UV4az3EWLpr4U0e89bU1wlobnZ5OFzsozT+v7lBk24DLAnL3W/BGoIgj9qw4YbML3Msdz2+wIT//No9rDLq1lLJxQ2ZOnWuD+c59J0PKtg0mHUplO8R09Cn2SHTk7pz8gDqpyoRocSX15+WVFUP8+zjbC9wKNAh8S8QYYkpvsiYYEz3Co2dFgv2bQQ5pRPNmfqAlHZFg57b8IF7vLEa1FemxoPqIlHxUx+DKYRKN5CK9vWwbqyIZYdb+O8O85bw4/ZPlHZw2wZvJFLqJuOaehGs9hZABaw4+gY2B5eM8W6qiw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(55112099003)(18002099003)(22082099003)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Njd0bW9iZ0NrNkM3MXRxa2YxVHl0bGRlb1d1bkkrUnBHRE51Q1lYdE5oc2Jr?=
 =?utf-8?B?N2xpVEJNdXlFb0lkNHhubGdCNDlEQXROZzk2NVdXa0grSXhkd0Foc0NXajNK?=
 =?utf-8?B?L09UdnRXTGJaTUt2TzdXY1g1c0RCYlRidUhOREFZdXcya204Q0NJUGpLNzlB?=
 =?utf-8?B?dWpBZGZkcjRlOFJBOG5HNXB6R0RhSXpCakFWZVFkZjlOSEVXdFlBSEdjSStM?=
 =?utf-8?B?RDNmVnhPbGNpMHhidVZZek9tRXh4ZVk2alBqK2xuN25qVW9NamNqZERUUDVt?=
 =?utf-8?B?OVlqZHlEOCs4Sy9BQjR0MXNmakNwcXpsYW04ampyOWsvN3BJUml0NEIvZy92?=
 =?utf-8?B?UTNLYkZQVkg1bVUzUElNZ0l6WUgxRW4yT0pScStROGplSno4ek1aYzRwTDdY?=
 =?utf-8?B?ek01NWhURHBjNUdkY0ZqMXh0NWVibys5QXF1Zk9oeElVdVliUkQzaHV4Yzdz?=
 =?utf-8?B?OElRVitGdEIvV3czNUlZem9zc3VXcjI1SURRNWJ5dEVRQURQQUFtSEFzWnFq?=
 =?utf-8?B?eGpKZVUrbzUrMmZxNHRSWmhKTzF4ZjAvaitNUjhPQXluSWd1Y0M3VTlLMklW?=
 =?utf-8?B?RlkrbkJYcnYrZ0dmN0k3Z2Iwb25FTi9lUlh5dUhkMFd0KzhVUDFkeHR3blE1?=
 =?utf-8?B?Vkg5amhBRXN0QkhxOEE3OWs0Tk9OR2F4dGt0NnN1UXRkUHV2a056UmtrL1Uy?=
 =?utf-8?B?ZExQdTlEN3NMWGZlek1XdEtqOHorNm5wdzVkVjhNY3RyTjU0VzB0WXpTMFF6?=
 =?utf-8?B?b0xHenBYVlJvNzlMQlNZNjZ5cTBSTlZnc1RDMXlwMjYxcVV0RmJGeWIzaDdy?=
 =?utf-8?B?WEFuR3dwSTZGNU9ZMGNFdlJuckRBdDl3K2RlMDFDOGlwK0hQQ3Ayd3g4SHJI?=
 =?utf-8?B?dFFZMU5uN3g4aDc3V3BHMmlXMVZNYStEMWU3NkFOZGJ5NEpraWZKRXN1UGRP?=
 =?utf-8?B?S0xPVlVYVjNTRVgzdnVma3FJbStVeFZHaDMxWUxxK0hjeGZUSU5UbTh1T2RZ?=
 =?utf-8?B?M1Q0L2dEVi9TWmg1dTRKOFBMM0FjK1kzaEJyR1NDL2lmeUZMUTlsYlFMajlh?=
 =?utf-8?B?TkF4VHpCb3ZZVC9zS3lTR3FRdnhCeDYwV0tHbFpSQ0MvQ2ZzVGVDcVpHUDFG?=
 =?utf-8?B?TTZjR3BiZFpDMkdyMGxLeFpZQ3RBSlBmRkpJSy92TlU4RmN2SXdycjUwcmZl?=
 =?utf-8?B?NDd0SjhybnF5Rk5zVURnMThlZXVqTklRSGpjSjdraUdNaXdaNzFsdWV5MnFj?=
 =?utf-8?B?QUFKcDJtZVE1RFY0VTZNWDFuYXBsUUxtckZYTG5VSUQyQkovMTdQZEx2UnUw?=
 =?utf-8?B?cjVaNHY0eS9WN3RkZjUrNUpya1lWTC9NS1FXKy9VRmV4ZHRNTnhwc1ZiOVF4?=
 =?utf-8?B?eW1scGJJV01sc0VXTmF3bDk2YTFDS3pFZC9TMEplOGpHTDNBOHppMHUwOXV2?=
 =?utf-8?B?N0lNQTFMVmJsSHFwV2krUmRocCtvTTB2cnIzZTF1d1YrWUNXbHlhd21aUFZK?=
 =?utf-8?B?WHJSVVZscjN2TmpKOUREcWFWOHMrbUc0SzZEK1VDQklFeXdIdVQwUVJOaGpT?=
 =?utf-8?B?akFrdFRqZmNQTDlMeS9YZTROdVFVOHZ3K3ZaNWFWMUM3WC9ac3JlZTdURWF5?=
 =?utf-8?B?c2x6U2JQOURSWk9DR0lyMFMwTVhuYzFBM2JNaHRzaWllcDRsbktlUnYzaHZR?=
 =?utf-8?B?elJkZzE5Zm5GUi8vL1daNnVONzZUQzQxYlVVcnhkRFBLUVR0L3g4dG5jZXFn?=
 =?utf-8?B?Ykk0UjdUdUN2Z1BFMElMb2NRZXdBNUpMNFFkU1ZqRGwzc1ZwWDU5UUM4WEx2?=
 =?utf-8?B?bHVoYTFkZ3hBU0xic3lxc2FMczNkNjBaZGVreFNkbitxSjJNY3BsSW1hRHJB?=
 =?utf-8?B?R3h3R2p3QmFkMWI0dy9KSjdQeDRJTzJ4Q2srMU5yTHdlemRxQ0RqbnBOWUJS?=
 =?utf-8?B?RkZSQXdiQStRUTkyVTl3bDVJOTVDRHY0V012Ry9jZUZXbWhUdmpGTFhSU2RG?=
 =?utf-8?B?Wk8zb29lWFMyTmljVGVJejJwSFBGOHNFYjRWRW1nSzluSmNaZC9DUXNsdlcy?=
 =?utf-8?B?SUt0NXo4bjhNOTRXdGdZZURXTXd6blZYWnBYQ3FiNWhDc2p1YUFRY1FIRkxC?=
 =?utf-8?B?Y3IxL3EwSlp3eVdkMnVRVWlmUUo1VFBDK3FKQ0pqLy84aG5GdjdRNXpic3U4?=
 =?utf-8?B?S011bmFYZ1cvRk0vYyt4ald6U2hpTGdXdVZEUmpuVkFCbGtoVlJUVEVibmph?=
 =?utf-8?B?UHJGWTZLRnRkUkhLL0xac25YS0lkQ3A3V1dLVWZPWnRjUlZjMmZmbk9KaFlB?=
 =?utf-8?B?TGhsWjl0SXh6ZnBWQmo1NVhLZHF5V2Vnbkg2QXhkRDU0N2I5Q1doUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa343b1-df64-4fb4-f4ad-08df07701ea8
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2026 14:57:04.1602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qQIqFNi3/0r2x0jQUMaO7KUxnE5GkdGtLsaQ/C7mG1/QYkgYBjHfLSIj4fptFKcYuCVjsEBbk96bkTNwSSsy4Rf6WF6XKpXFAQTadsnhoZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8841
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 14:57:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244769

SGVsbG8gWW9hbm4sDQoNCj4gSSd2ZSByZXByb2R1Y2VkIHRoaXMgbG9jYWxseToNCj4gV2l0aCBT
REtNQUNISU5FPSJpNjg2Ig0KPiAiYml0YmFrZSBuYXRpdmVzZGstZ2xpYmMiIGZhaWxzIHdpdGgg
dGhpcyBwYXRjaCBhbmQgc3VjY2VlZCB3aXRob3V0Lg0KPiANCj4gVGhlIGVycm9yIG1lc3NhZ2Ug
Ym9pbHMgZG93biB0bzoNCj4gfCBFcnJvcjogc3ltYm9sICdfX3NpZ3RpbWVkd2FpdDY0JyBpcyBh
bHJlYWR5IGRlZmluZWQuDQo+IA0KPiBDYW4geW91IGxvb2sgaW50byB0aGlzPw0KDQpUaGFua3Mg
Zm9yIHRoZSByZXBvcnQuIFJvb3QgY2F1c2U6IMKgR0xJQkNfNjRCSVRfVElNRV9GTEFHUzpwbi1n
bGliYyA9ICIiwqBvbmx5IGV4Y2x1ZGVzDQp0aGUgdGFyZ2V0wqBnbGliYyByZWNpcGUsIG5vdCB0
aGUgY2xhc3MtZXh0ZW5kZWQgbmF0aXZlc2RrLWdsaWJjwqAsIHNvwqBuYXRpdmVzZGstZ2xpYmMg
c3RpbGwgZ290IGJ1aWx0DQp3aXRoIHRoZSBuZXcgdGltZTY0IGZsYWdzLCBjYXVzaW5nIHRoYXQg
c3ltYm9sIGNvbGxpc2lvbi4gVGhpcyBvbmx5IGFmZmVjdHMgZ2xpYmMgPCAyLjQwLCB3aGljaCBp
cw0Kd2h5IHNjYXJ0aGdhcCBoaXRzIGl0IGJ1dCBtYXN0ZXIvd3J5bm9zZSBkb24ndC4NCg0KSSd2
ZSBzZW50IGEgdjIgYWRkaW5nIEdMSUJDXzY0QklUX1RJTUVfRkxBR1M6cG4tbmF0aXZlc2RrLWds
aWJjID0gIiLCoHRvIGZpeCBpdDoNCmh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29w
ZW5lbWJlZGRlZC1jb3JlL3RvcGljL3NjYXJ0aGdhcF9wYXRjaF92Ml90aW1lNjQvMTIxMDE0Mjgw
DQoNClBldGVyIFRhdHJhaQ0KDQo=

