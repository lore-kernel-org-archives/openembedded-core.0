Return-Path: <erik.schumacher@iris-sensing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D248D609C3
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 16:19:07 +0000 (UTC)
Received: from BEUP281CU002.outbound.protection.outlook.com (BEUP281CU002.outbound.protection.outlook.com [52.101.169.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26647.1765901939387389128
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 08:18:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@iris-sensing.com header.s=selector1 header.b=MIFWRjvZ;
 spf=pass (domain: iris-sensing.com, ip: 52.101.169.100, mailfrom: erik.schumacher@iris-sensing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ty5JYB2y/uE0wuiaNFRsogdpDd8t3/lfJCr3fLJQ621EqJPy6lITV+sEo9ygcoHx87wSN2om0R1gIwjQFVJaMMG26m7W9QaaS6wh98TdnieSuxbcA+e98FHdlJgDyYjA1LlUB/DbrTgn1thhx3kKTmpXxiuUAXHjYPr1S0gs/K1uT1qmQpO2smm5vuEf8FAx/AqYlV/bpd6iOwKfHIbWEJjn8WKXfoWxQNYbmARTGDsS6FQQiFzmvn5mcZHOtWYuFp5EEB87TeQ30P+xf9CxbFFg2v6jVW930CPVl8WYjl3eqPNl/cGX4NDfGZ5CfCZBATtg7Phq/6rZw3+6KeBS6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3AdfZ1jlomF/hthTjNx0sjJByPReBQKKaT9f3xkDmo=;
 b=BR7sWmUiFg8WCTcmh52BqNSjWfmAYTFI5lvBujW1hI8bzBDJmVuL4hhHrIycni9KBmdwicyYwFXdyBx9gtZ7X0PMRlt0Gmub/iRTY69Fk0fjK3bdEOGYQ5MkUSFaS23GYiGoNvXOOm9ABl+UkBSO6FV6xSZryPWf70kjb5r7jA+YMEWEluQLf8X+BQgNZJBzEANhEGPVF6Cbxb43iDTnydeqUauuKBY7vuoIE1HbsshT6FnTcd/ihaWgq9YP6OS4TcM4T48QNHHgnRgoblBFV7YZeY+Q96GNRjkP2wYZ3DP2strPEQhO8N9IWWmJAgl6bRGnd8ScaSCvCPX8xd2JSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iris-sensing.com; dmarc=pass action=none
 header.from=iris-sensing.com; dkim=pass header.d=iris-sensing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iris-sensing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3AdfZ1jlomF/hthTjNx0sjJByPReBQKKaT9f3xkDmo=;
 b=MIFWRjvZTqbEVHCajRevCjskWli2AEATXOGMN330AlcLpkkwEPU1rBPeOTtq7+SjlnIRfUHYDF7OQJRTlT/iJyJbsu2Bcd5LadwiXUb//QBkuq3b0RWEovHrvN8V9y8tPR5qin9xuz2FTY272PBfAzIKOMN+ckc4Pqq3KCCxlf5UFFhwAx7itJntpZ1tNmbwzKt1b++rAJiQL2dxFuJq527Nb1ZDKMRqrESXTEnKfxxAWKsT070kfEEmt0g6BcN5x5R+AWyKl6MtsMQLvF2NGtEVYXkiCqwmQbP9xfJoVPeRIi8KeJEe6KwEQFXVbHkFtkA0KUcaLiq9c8b0hDEBtQ==
Received: from FRSP281MB5825.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1ba::18)
 by BEXP281MB0264.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:8::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.13; Tue, 16 Dec 2025 16:18:54 +0000
Received: from FRSP281MB5825.DEUP281.PROD.OUTLOOK.COM
 ([fe80::8bd8:4e0:64b4:7b4a]) by FRSP281MB5825.DEUP281.PROD.OUTLOOK.COM
 ([fe80::8bd8:4e0:64b4:7b4a%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 16:18:54 +0000
From: Erik Schumacher <erik.schumacher@iris-sensing.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] initramfs-framework: rdepend on mountpoint command
Thread-Topic: [PATCH v2] initramfs-framework: rdepend on mountpoint command
Thread-Index: AQHcbqesy0KR9OqVTUGSeCBVe3xjsA==
Date: Tue, 16 Dec 2025 16:18:54 +0000
Message-ID: <4f922d17bac5aaadc452efb965b9d320daca8f1e.camel@iris-sensing.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iris-sensing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FRSP281MB5825:EE_|BEXP281MB0264:EE_
x-ms-office365-filtering-correlation-id: 1a4d75f4-2a15-48c1-b679-08de3cbecefc
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?c28rYVRrYVBmVkZpTWt6VHRJclNTVXFNV1MzV2ZOVTYwZmdlZFFuVXpkMDZq?=
 =?utf-8?B?UUhNNDYyVDVjdlp6NmhNU3FHL0VQaUQyY0NDbFhJa1NORUhoNzVlMSsvMEVi?=
 =?utf-8?B?Y09xQ1J3VXlTUVIvYmYzcllaYnJqR1F2YVFjeHFBazgxbzVHUzRza1JzTjZZ?=
 =?utf-8?B?T3FLNjFWTnhjSFBnNlMyVXpWUERsQ0duQ1BIWmxXQTFEZWhlNWcwNFFGelo3?=
 =?utf-8?B?S3YvL2pnbHNvMkhNNS9YS3hXc3hoYmhWOS85TXlmYVdqcVhqcnpkZnhKaGFJ?=
 =?utf-8?B?blZKSVJEdGthSGJZYTQxU3VWTUNPSGdGd1dVYTR4dENxbUFKcVBTU0VuVnRY?=
 =?utf-8?B?dlNTc3VQYjl3UmN1alNLckNaWmdZWlhlUTJZQktlNkNUSEJmSDU0bitNL3Bi?=
 =?utf-8?B?SE1tdVI5NERwZ1RYMFp5M0xWUzBOSCs4S2ZXcmFuQkxyOWYyeEtDOTVHdEl6?=
 =?utf-8?B?L3pLTFhDMjVEZzJLSE5vdlVnOFdqc3J6RGVPN3l6TjBaSXdXdVFtRG1VYldB?=
 =?utf-8?B?M282bXphd1J2L1lGTDMvNGlsTnB6bk1HbUJSRXZMMm5TTWgzbHZXeGphTFlh?=
 =?utf-8?B?L0E1Z05tZkR1cHNaemQ5YlpVaExXVU5JdUhlaGJIZVdnWmlUUCtaT1c1L3Vp?=
 =?utf-8?B?YlAxTmxTNWhZOWdzVDNPbkRpQlFITEhKWWhudE1IdUw3ak51KzVmaUpxNGc3?=
 =?utf-8?B?ZnNSM256aHVPeE1aZjZoRVB5bXk1VWxwQUZ2eU5CZVBPOGwvUmNoTUZ0SmtO?=
 =?utf-8?B?T0t1N0pXVUpqNkY3S3FUZEY4T2ROaFNieFFGeFdvYUZyU3g4TTlWNDNyOXlH?=
 =?utf-8?B?M1NJZ1RndmFtejBnRlpIUmkwSWM5T3grazY0UjhTdW1FNVg3cTMrTlJDRlRS?=
 =?utf-8?B?blJrL0Jwc2pUWHlKVUZ5Z1BWNzhjL0hLMzRRN1NVMkZhUFRvVlc5UWkxM0xV?=
 =?utf-8?B?WjA4bmdxRU5XYk8vdkhoQmRaKzRZY3lwTlA0bGF0cm9leTkxSkU2NHZhQk9O?=
 =?utf-8?B?ZU91czVUaWFpaUs3WXBpT29ma1d1TWlhRUJGcC84SG1NNmlGTzJCWDVsYnZn?=
 =?utf-8?B?QjJNSDNxa0gxQ3FmWG9uTGdETjVwdGIwS2xVYTB4enpXTEZDS1hxWSsrVFhN?=
 =?utf-8?B?R2x4TW5GdkxqWVFDVTJYeW1Jc0lhVnJKRFFzRmxIMHd2amRYNWJVeFQ2ZmNh?=
 =?utf-8?B?UXBBZGRLb1ZZQ0RlOVNPRFZiMnEzSUZWaFRYdEdnLzFsbGFxRjZ3UUw3bjhN?=
 =?utf-8?B?dnlpOUxaRi9sT1doQWV5aHdXTEpDaTZEeFFhZEwybG81WEsxaVp0bkVVV1dv?=
 =?utf-8?B?NXVVRjMxbHAyaUJyTTJWSTF6Ulc2c1NSOTVmRUdhNGNaUUVaOGx3MnVWTFlr?=
 =?utf-8?B?YnJwcy9LRk5jcXBleWsrT3Blc2VOSUZ6RFNReHo2Q2l6V1VFRllQWlM3NWZB?=
 =?utf-8?B?REpJWWtsNEZuYm9kYkh5TWhjUlM0cEpOV0ZwUmJ4Nk94UkkzZ1E0K3lwbjZX?=
 =?utf-8?B?WjUzaXpvQ3d1VnVjNmRid2UvYmsvZmZuanRFL1poM3pIb0JpalAxQlZvWFJp?=
 =?utf-8?B?bHlSVHdYOWdVU21oamVTT0diQWVLN3JQbXFGaGV5ckZRelZxblZiQXUzaUtM?=
 =?utf-8?B?K1dDNUQxaHBOVzc2ejdUejhnSHlOUFowL2lhRytldmhGckpNQXJjeTdWeGxu?=
 =?utf-8?B?NXNNeG9QWkRPV1RPR0RvVzh2VHlhNzVNMjVpRExCUzR5WXZOR3dFa3JzSXN0?=
 =?utf-8?B?SFUrdGI3aDJURlFvMEc0MGQxZHdUUERtblYxSENzSzE5anI1K2ZRRnV5eHV4?=
 =?utf-8?B?ZmxSTkNQelFiS2ROR1pGRTg5VDFRb1dUKzJJVklEbkhIM2g0QkluZXNxcjJ6?=
 =?utf-8?B?MUpvWUVDa2pjODcwSDd1RGl1NUhRbUg2ZlpqMUJXeW1MZzB0VGRyY01TWDg5?=
 =?utf-8?B?bUp3N0V0cEJRUnE3QWlwMS9XOTE4bnF5eEZ2cTM1NEFHTGR4VG51NWVvU0o0?=
 =?utf-8?B?a0pwUWNhenQ1MnJmelplSTloeUwwL2paQXVzb0NyOEJtZjJJTVJCQWMwWWxR?=
 =?utf-8?Q?ZojykJ?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRSP281MB5825.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NjdLTGRjcUpTY3VzZ1VzMU8zWlJOTEdpWXBJM0x0QlJPaUF6M1MvQzMvbmdB?=
 =?utf-8?B?eGJiRnNDcHZCNkhnTjhFVFA4N1V4dTFOK3IxbjIveFhJc282VXhEMlFJYmNX?=
 =?utf-8?B?YTNTaVFzcVVENTZtSjh5ZXlPdUVucDFGTktWNE9rWTlNU1JvOE5EY3dyazlP?=
 =?utf-8?B?VW1EUzc2YytaVUpQdmNWSzNDd3pqcSs1SUN3MFA0MVROYWFZeEFJaWlsUGZL?=
 =?utf-8?B?a2pyN1hqUDlUeExnU255R3ZsbnBKZkVTRXRTVzM2eHV2cTJtZGxCYUhFYkha?=
 =?utf-8?B?MDJPMEl6SXVFQjNFanY1S2F4MkY1OGQ4eTdFY0ovRjYrVVB0b3NsMkI5czV4?=
 =?utf-8?B?YzRUcmhlNGxiblJpMEk3Mnpqc0V0VTR5YWN1eERmNVJza2RTVkNtdXQ1TTNn?=
 =?utf-8?B?UGFxM00reDh1bFRkNjN1TUxpbCtoMzIwUnJwcVFUeEJ6MFVKV05XdXd5N1pD?=
 =?utf-8?B?dHYzR0k5MFJuR044VDBmNGgwV21sMW42bFpGOVRXZHZub1pqMldRT0lnazQv?=
 =?utf-8?B?dTh0V2MwSnVLNWdVZ3lxYkJzZGZ0aG5yYVh4M0xPcWRoeGQ1U05tbnhkOWtF?=
 =?utf-8?B?Y2JSa29GN1BKblBXc1JBOXBBNytkWkN2ZDhrZlQ4cmdya3RabEl5dDZvOUVB?=
 =?utf-8?B?bXdIU1NMZ1VYRGFyclJ5cXZKbkFqRk4wR21KMlN6QkhpWDFyZGFDTU1ldEVK?=
 =?utf-8?B?eTcrd1J1Vko2QVBzaVJvNWQreVRYcXRrTDBYWlJJTGp0K3FGOHV6NW5GZHpC?=
 =?utf-8?B?M00rQTZQVElqaFhjOEM5YTU5Mm9xQVlGVWF5cGRrQnAveDFOZVZySEgwVFFZ?=
 =?utf-8?B?YXRoUit0Z3NCYXN1Ymo3TysrVUYrTVl1bzlVT05wallNTTdHYkJnOGpEc2w2?=
 =?utf-8?B?eXdEZncrWWhwMnZzNEJHSm45V2IrVnE4ajkxbU81NDh2cjl2RzhKTHJWN2ZQ?=
 =?utf-8?B?K0Q3Y0pZVjNUaE9rMFBkRzhvUDhpRFFHdUpSY1NLWkcyaFJpZ3plTG5VREZ2?=
 =?utf-8?B?dGlMWGJOUlhhc3BER2RpSTJPS1RQNDcwYzQrRGpoWnEvd3c0QXo4bUl5c2dB?=
 =?utf-8?B?RWp3UUJVRXpjZ211RzZIN0w2OFNoNWVMYkdYVmRIMnJMYjJaSzN6RXZiQ2Ra?=
 =?utf-8?B?VElTcEJmS09ZNnRUZFBBajNKYkp6NmJ5ZDVZK1V6SDl3M2lSUVVLWi9wN3RL?=
 =?utf-8?B?SU9CV1B2eEsvSFFvQ3FBWVZnKzlNaWRySmVOL2hpemtXdWk3WlZqSFNyTUNa?=
 =?utf-8?B?SDhVZm9ManY1aGJWSXNMN0VyT3VxRWdpb2pJTGxxcldXdW03dUNIcjVqTWhO?=
 =?utf-8?B?ZWczY3l6YmNUR1hJMDJNd2FIaWMzb2M0ZG5BOVdYb3dhZmptaUxTQkFhSHJB?=
 =?utf-8?B?blBSakdrVXdFRVBVN05ISGdsU25CNHhHcDl4aXIxQmNCbVM0TGFiWW1Td2V3?=
 =?utf-8?B?Wjd6WGUzSmRaOUlGSTJRL1pXYmk5OE5rME8zSjF5SHU2ZHdlZXJnZ0Q2dnp5?=
 =?utf-8?B?QVJ3VW05SFlPVHVNTGRKSDN5aXpYUkNXeXBFQTZONlFQZjNlL2JNQkllb2FE?=
 =?utf-8?B?UFJLOTUyeThvbVZaVU8weXVyajFWV00rdCtuVEtCL2gzMjhhYnhnWHNMUFRV?=
 =?utf-8?B?b0hTQTU4OUZzUnRycnYvZS9zRUpoQ0x6YlhMVy9hNXVBRWxNbHVvMWlxVWI0?=
 =?utf-8?B?SmRUTHhaK1RaOGl2SHNxaTFaeXJwb21DRkVacHlLQmgyU1hXdEVwN3RTbktC?=
 =?utf-8?B?ZlRDS3Z2NnZQNkhyeFIxRVdkQ2pNR0NyN3Q4NnlVSGxwVjd2dnJDYndDRzFD?=
 =?utf-8?B?L1k5YWhBdG5WcTE5UCtFVzdYN0NWNzFQc2VFWFU4U0Iva09nZFhvTkwvSCtJ?=
 =?utf-8?B?TlpDaFAxeXZwcHRKTXBhNUdDZmI1N0NEQ1FRRTZVeXl6TWg2d29WYXlJL2JE?=
 =?utf-8?B?SXdiM215aUl4Y2lvTUZpSm9kUnZvNDZtcFFOSUJmK1U3TXAvUHU1R3FYbGxj?=
 =?utf-8?B?Rk81TkxyVmpvcFBjaW9YZjJoVUlOQWNha2sxVXFteEUrTC8vRkNSTllVaWpv?=
 =?utf-8?B?YXlLNkhYc0FBLzQxRlFzYmhWK2lrb1hxWWFyQjJ2cWpZTitmNUd4b0Q2QmdC?=
 =?utf-8?B?SzdtU0wyY2JRZHN3QzZEem03UnBsZTBkdVR2cFVlU0tvd21pWnA3NUR2YVgy?=
 =?utf-8?Q?Xkeh2oUjfPK42yH0mgrOeH8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <95BB9353A78AB4459B651A0B078337DB@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: iris-sensing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FRSP281MB5825.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4d75f4-2a15-48c1-b679-08de3cbecefc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2025 16:18:54.7223
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 963f3913-ffae-43fd-856b-2dfd3f6604e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xOLxJwXSVu/ZDHzTyMQWqlLIbG8d8BlfXLvRrClpnzPTn+qT8ms+mq3QBjPHA+z0Kw5GtfFXhcPboqdvyc+hyK0rsnlnVm2SPKBij6d7nzsjXHf9FY2eYcZbDQrhBmqT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEXP281MB0264
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 16:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227980

VGhlIHNjcmlwdHMgb2YgdGhlIGZyYW1ld29yayBiYXNlIHBhY2thZ2UgYW5kIHRoZSByb290ZnMg
bW9kdWxlIHNjcmlwdCwNCmJvdGggZGVwZW5kIG9uIHRoZSBtb3VudHBvaW50IGNvbW1hbmQgYmVp
bmcgYXZhaWxhYmxlLCB3aGljaCB3YXMNCnByZXZpb3VzbHkgbm90IHRoZSBjYXNlLiBUaGlzIGxl
ZCB0byBib290IGZhaWx1cmVzIHdoZW4gdHJ5aW5nIHRvIGJvb3QNCmFueSByb290ZnMgd2l0aCB0
aGUgY29yZS1pbWFnZS1pbml0cmFtZnMtYm9vdCBpbml0cmQ6DQoNCi9pbml0OiBldmFsOiBsaW5l
IDE2OiBtb3VudHBvaW50OiBub3QgZm91bmQNCg0KVGhpcyBjaGFuZ2UgYWRkcyB0aGUgY29ycmVj
dCBSREVQRU5EUyB0byB0aGUgYmFzZS1wYWNrYWdlIGFuZCB0aGUNCnJvb3RmcyBtb2R1bGUuDQoN
ClNpZ25lZC1vZmYtYnk6IEVyaWsgU2NodW1hY2hlciA8ZXJpay5zY2h1bWFjaGVyQGlyaXMtc2Vu
c2luZy5jb20+DQotLS0NCnYyOiBBZGQgU0lHR0VOX0VYQ0xVREVfU0FGRV9SRUNJUEVfREVQUyBh
bmQgYWRkIFJERVBFTkRTIHRvIGJvdGgNCnBhY2thZ2VzDQotLS0NCiBtZXRhL2NvbmYvbGF5ZXIu
Y29uZiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSArDQogbWV0YS9y
ZWNpcGVzLWNvcmUvaW5pdHJkc2NyaXB0cy9pbml0cmFtZnMtZnJhbWV3b3JrXzEuMC5iYiB8IDUg
KysrKy0NCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0K
DQpkaWZmIC0tZ2l0IGEvbWV0YS9jb25mL2xheWVyLmNvbmYgYi9tZXRhL2NvbmYvbGF5ZXIuY29u
Zg0KaW5kZXggYmEyNWNhMzAyOS4uNTQ3N2U5ODQ2ZiAxMDA2NDQNCi0tLSBhL21ldGEvY29uZi9s
YXllci5jb25mDQorKysgYi9tZXRhL2NvbmYvbGF5ZXIuY29uZg0KQEAgLTYxLDYgKzYxLDcgQEAg
U0lHR0VOX0VYQ0xVREVfU0FGRV9SRUNJUEVfREVQUyArPSAiIFwNCiAgIGluaXRyYW1mcy1mcmFt
ZXdvcmstPiR7VklSVFVBTC1SVU5USU1FX2Jhc2UtdXRpbHN9IFwNCiAgIGluaXRyYW1mcy1mcmFt
ZXdvcmstPmV1ZGV2IFwNCiAgIGluaXRyYW1mcy1mcmFtZXdvcmstPnN5c3RlbWQgXA0KKyAgaW5p
dHJhbWZzLWZyYW1ld29yay0+dXRpbC1saW51eCBcDQogICBpbml0cmFtZnMtbW9kdWxlLWluc3Rh
bGwtZWZpLT5kb3Nmc3Rvb2xzIFwNCiAgIGluaXRyYW1mcy1tb2R1bGUtaW5zdGFsbC1lZmktPmUy
ZnNwcm9ncyBcDQogICBpbml0cmFtZnMtbW9kdWxlLWluc3RhbGwtZWZpLT5wYXJ0ZWQgXA0KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2luaXRyZHNjcmlwdHMvaW5pdHJhbWZzLWZyYW1l
d29ya18xLjAuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9pbml0cmRzY3JpcHRzL2luaXRyYW1mcy1m
cmFtZXdvcmtfMS4wLmJiDQppbmRleCAyZWMwM2JjMzRjLi40ZGYxMDAzNWZhIDEwMDY0NA0KLS0t
IGEvbWV0YS9yZWNpcGVzLWNvcmUvaW5pdHJkc2NyaXB0cy9pbml0cmFtZnMtZnJhbWV3b3JrXzEu
MC5iYg0KKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvaW5pdHJkc2NyaXB0cy9pbml0cmFtZnMtZnJh
bWV3b3JrXzEuMC5iYg0KQEAgLTc5LDYgKzc5LDkgQEAgRklMRVM6JHtQTn0tYmFzZSA9ICIvaW5p
dCAvaW5pdC5kLzk5LWZpbmlzaCAvZGV2Ig0KICMgYW5kIG1vdW50cyB0aGUgcm9vdGZzLiBUaGVu
IDkwLXJvb3RmcyB3aWxsIHByb2NlZWQgaW1tZWRpYXRlbHkuDQogUlJFQ09NTUVORFM6JHtQTn0t
YmFzZSArPSAiaW5pdHJhbWZzLW1vZHVsZS1yb290ZnMiDQogDQorIyA5OS1maW5pc2ggbmVlZHMg
dGhlIG1vdW50cG9pbnQgdXRpbGl0eQ0KK1JERVBFTkRTOiR7UE59LWJhc2UgKz0gInV0aWwtbGlu
dXgtbW91bnRwb2ludCINCisNCiBTVU1NQVJZOmluaXRyYW1mcy1tb2R1bGUtZXhlYyA9ICJpbml0
cmFtZnMgc3VwcG9ydCBmb3IgZWFzeSBleGVjdXRpb24gb2YgYXBwbGljYXRpb25zIg0KIFJERVBF
TkRTOmluaXRyYW1mcy1tb2R1bGUtZXhlYyA9ICIke1BOfS1iYXNlIg0KIEZJTEVTOmluaXRyYW1m
cy1tb2R1bGUtZXhlYyA9ICIvaW5pdC5kLzg5LWV4ZWMiDQpAQCAtMTAwLDcgKzEwMyw3IEBAIFJE
RVBFTkRTOmluaXRyYW1mcy1tb2R1bGUtbmZzcm9vdGZzID0gIiR7UE59LWJhc2UiDQogRklMRVM6
aW5pdHJhbWZzLW1vZHVsZS1uZnNyb290ZnMgPSAiL2luaXQuZC84NS1uZnNyb290ZnMiDQogDQog
U1VNTUFSWTppbml0cmFtZnMtbW9kdWxlLXJvb3RmcyA9ICJpbml0cmFtZnMgc3VwcG9ydCBmb3Ig
bG9jYXRpbmcgYW5kIG1vdW50aW5nIHRoZSByb290IHBhcnRpdGlvbiINCi1SREVQRU5EUzppbml0
cmFtZnMtbW9kdWxlLXJvb3RmcyA9ICIke1BOfS1iYXNlIg0KK1JERVBFTkRTOmluaXRyYW1mcy1t
b2R1bGUtcm9vdGZzID0gIiR7UE59LWJhc2UgdXRpbC1saW51eC1tb3VudHBvaW50Ig0KIEZJTEVT
OmluaXRyYW1mcy1tb2R1bGUtcm9vdGZzID0gIi9pbml0LmQvOTAtcm9vdGZzIg0KIA0KIFNVTU1B
Ulk6aW5pdHJhbWZzLW1vZHVsZS1kZWJ1ZyA9ICJpbml0cmFtZnMgZHluYW1pYyBkZWJ1ZyBzdXBw
b3J0Ig0KLS0gDQoyLjUyLjANCg==

