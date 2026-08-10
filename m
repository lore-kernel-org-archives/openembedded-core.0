Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F387C5AD55
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 13:37:38 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29694.1786369051359361088
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 06:37:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=t5an9kFj;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 52.101.85.22, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uW4vV3NU5Il3MpEdRFEzn4OXiEeDaexq7EnSnvukwuXLx+1uE+p18ph+wWvBSB6XyX34ukeeuP5Ueu5TSg5OGS0+UvcMD4mc/A9roMmYL6HSEgQ1iY0zMDEDFQ9Elt+JI6i3VsjuvOkEu/HuH2irEhrlpNENFK4uIoj8UaxnqDxDJOUff58I4aD4or2tPrdOIdHfEBQ5JlKIZeU2YQfTcfrHsbUFefq3/MnOqivFzUoTiicWrGyUZbvXxZ7Y9cVnbGiHMxjPWcdP2RkgPpPd4oEAseolHxQGl13L/oQtaRdfUXQQKn6hy9iXBmm4I2cx6rPexMR/Q5hOQby2SOmMug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZawl/QK23tOltI2Dd76m/j6vVkRifU1aDRTVsntpHs=;
 b=RJndCPBbn1z/fQGGr26Buj52PyFzxifc9ZQsssLUf9gmaVkiwUiQCxmrmFPckTtLjnD8Hgzxzd7+uiamr4U4db2lLSogosxPKA3pDpKMZI842HA/axy+DNs2CZ8yHbJdbaLstr5oUQlp40zx+NjkSw+18V1eAT2WWiFr3N/EoovWZtkOArL2QwH5VAnh2HN1GRein3ElUltLB45cv9m1mRrxmirxY2jy3Ti9qx7oZrSmIktXKpMLGzFW+uwMNyNgnQVEKa6fKQret1iC0achnVFpjPycMsHt6b0HEKrUEod8ltDMFV8iWztKHnfRXVsy0opKcU7ZzhvMhranKvNJLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZawl/QK23tOltI2Dd76m/j6vVkRifU1aDRTVsntpHs=;
 b=t5an9kFjMEo8U1Wtgg0JBIPDjh8EfoeXzCwhpRrh+/1O/d/4+h/4m1iSN0oaw1UGvGF04KNkblvKm89SAn63EGn0BW3PJVLeC1dN49sQwSPKTX5+7prqFnMdytgCzKD8uBjs96EFKGp34SIv7Aobq6e/yhb1ATwXfstaEecq7HSHC36MVDwkdH/f/ecCmxFZi5yiGLlbnTpFH7rcv+Hx6STe3hHB2Q1gn9A9tRr5FOdWmQdjpP5XWm9MKToziv94wwZMINBls+Ea5ZdftPyQB4Y+3+FN5pgnNHCKMBm4VhsFCEoiHmsisglRtgElYyw717xxCgg2RCW5asrs5X19RQ==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 LV5PR12MB9753.namprd12.prod.outlook.com (2603:10b6:408:2b6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 13:37:27 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::152b:7346:321d:4a2]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::152b:7346:321d:4a2%6]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 13:37:26 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] "Checking sstate mirror object availability" progress
 bars
Thread-Topic: [OE-core] "Checking sstate mirror object availability" progress
 bars
Thread-Index: Ad0moIqENvNpiy4/SdClFe5zENmSsAAEnvsAAIZbPnA=
Date: Mon, 10 Aug 2026 13:37:26 +0000
Message-ID: 
 <DM8PR12MB5430E69F7A83E64281F346338BDE2@DM8PR12MB5430.namprd12.prod.outlook.com>
References: 
 <DM8PR12MB5430689E7FD5CCD1E6FF60AB8BD12@DM8PR12MB5430.namprd12.prod.outlook.com>
 <c31ac176c2733e3b8e65d87ee03bf07a6c57116b.camel@linuxfoundation.org>
In-Reply-To: 
 <c31ac176c2733e3b8e65d87ee03bf07a6c57116b.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=d267ccde-e725-4e2c-a569-12b85a77a64a;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2026-08-10T13:30:46Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|LV5PR12MB9753:EE_
x-ms-office365-filtering-correlation-id: 6b454b30-6a5b-45c1-56c5-08def6e4845d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|11063799006|4143699003|56012099006|38070700021|3023799007|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 cHMrt8AGm6d3nDJeG0dBj+v5Apq7Ohw04zDCfgB8HkAUwpYEKD8sGE3gI4vPW6duuWinE/ueZww7MnmFhjlaZAE+Fh4TNFAX2y5V51JxCju/Qos7GpLLOUuwW1GXOIr9jLiZ1HGZCd5gVg4ey9QW+vaO6J9VYXkSxxueoD7JU1tSFhrUlc9hpI419zVmxMYd1JqDi4RiOUdyX0aSk6i4AE+5uKfpp8XlJ4pcYZckyf6/ZErQcw+k0ld2JiXGtVfBNsiW/MqsR/WNySkTSqAuHPgZlCggKj3gTS58Qdo1CqBk1VWQuNKaoTkDF9SEIcEg4Y7thWx+6ujT96Z9Qv8wvxRmRHVF0Zs7RREO2OHUeZWBQkFwNkRPVafeM1Bzy1EwzS/4Y2UGhMQx2sAigkQ0YqnpLkdoaJWli60qwOJxYLdWFGmE3X+1N5x6xCeEctX7cwNLpZEd1cTF+TxeDSKY2CApJDhBegK4mZqNo8DaA4XzurnWRf7qwa3Htg395uu1jRZ3nvJJie2SJDRoROITwxr6Sl4065Jgbd1MZWmQAxc/mSEu2Gwl05wbdP1iT6bx1Y8F0efxqizUdUjz2CIHWKOjYGmCKRzryG1+SwDzY9Vq81cQGOjHUShXPlE/HvRDd4VGXPPZrJ39ZES0PI0n5uA3OH2LZ8rqQO1B57A6zZJjkevwnxIqzFGp1CzX8uc+9hwhcCmJ3O4OCgwgnB0uI5cR5Z0TFS54Sait1wG+0Mg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(38070700021)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QTRCUU9tUWd3Vm9MeXh1SWwxVHZMMUphMFI0MWlEcm1uODZBNDl3bkJQZ01m?=
 =?utf-8?B?T3kzRDJWUWpxQjRpRUlCVlJSUEZMSXVUdnNyOENGSHRJN2doYi9OTnZLYXJ3?=
 =?utf-8?B?RFZySndqbWYzVE1nWVlFazN6SnhXYzVMTTVrZ3U1K2wwYUlFaVJrMG9SYXBH?=
 =?utf-8?B?YWdpeWM3ejFJUkJiYUQ0M0Nzb3E4YTNhaDFteWI3bS9iQmU2R1ZrU0cwNEUr?=
 =?utf-8?B?YmNOcnRpWEVQTk9mM3pRUFhBUHQ1eUVFR1JKVzEzRkxEWFRMRi8vWVFLRkJr?=
 =?utf-8?B?QkZaVmFKbGRUc1NSS2RjTE9XNWZrckMyc09TWmtYSzhVeE00QzROODh0cGpV?=
 =?utf-8?B?Q3JqWGVHdVJVdmhEUzB4MndkWFlxL01GcDBnNWlqejA2blllUlRjWERJcWtC?=
 =?utf-8?B?REs0WXQydFRpdkZSYmp4T1Fqc00xMHo1bG9qNlcvZ2xYdjE4eVVjOENEcmhR?=
 =?utf-8?B?Tm44Q3FRZHBKc3pkMXJXcndoV1RORGV5Nk9scE1ic24zMW1oYk15NFBtbEpj?=
 =?utf-8?B?anhmTURhODRLOTJZTXhYSUNxRmx5bHI1Y0JkS2MvbjcvNy9zWmdTQTUrZVF4?=
 =?utf-8?B?bnk0YXZBVG01eTVDTStZWHNURUdrTE9KcUN1Ynh5Vmx5RnI2VCtUTEJYalJP?=
 =?utf-8?B?ejJUNVN6MllybHJ4dHBmYUt3UHJlQm9vMXhRZzBDN2FCM0RMc01yZ1BuQ2pq?=
 =?utf-8?B?R1QxS3FmbURkZEFxdmN4d2tqSGN5OC9DeGM0OGpYN00yZlBJVTgvMkttb2VL?=
 =?utf-8?B?dWtxL3hjTVkzK0ozVE5MQkVmTjB2VmtsQm1rRlRBVXkxWVI0Q3lDcUtkOVJv?=
 =?utf-8?B?bmpaMXd4V0RCajF6U01FU050Q3ljV2pHWUF6ejc1UUJpclBRVCtsY3hXTHlZ?=
 =?utf-8?B?L2FrS0FOUkZCUWhyM2p3YkVITm9FM1ZxUWxaQld4Q0lTYmlFQkp2ZHEwQTJa?=
 =?utf-8?B?dVV4dElRNlpac1hUMFR3WVJLbXlOd2V0OXE3VHhsR3MreWdIUjVhMklZVlJs?=
 =?utf-8?B?VjcvamxoRVkxRzI3ZXhIRVo3M3p6UnZuVi9odW9KYUEwN2hQd3drTnVMdUZ6?=
 =?utf-8?B?TVVleVdpVVZoeng0WEpnVzdlWUJMVmpuWnVoSVhESjFoL1lYMElrMzJLR1dl?=
 =?utf-8?B?b0dRYW9xMXNQRUg4YmliWXZKY1dpTVhiQUw4RU5NR0lSUjI4VDljYjZVUmNm?=
 =?utf-8?B?M2NIcUI3R2M4cUpZYVRrU082RnEwdjE5RTdDZzRlbWdITlA2YTl3T0Znd2Vh?=
 =?utf-8?B?Mm05YTBOZStCRXN0S25EWDYvTXlJaC9idTNJRElXVUdhNXBoY3o5bGdhRFc3?=
 =?utf-8?B?T3pYNzVSS1FYRVVhUlRRQjRRNWdGZVMvdDZ5RmRNeisxL2hPV3J2RzQwMjdq?=
 =?utf-8?B?bzlQajR3dTBoYXZpQnNKZDlybDhIUGErZHBDVktuM3hzVDRzK0ZWWGJXOE1H?=
 =?utf-8?B?NEtOendvTXJMVDNvdThXOHM5bVlHM2FFSVZNUkI3dUpSa1M3TXAyNzQ1RU9l?=
 =?utf-8?B?UlU4KzhQMnI0ZFdCTVV4VlVIbHkya21kNVVqeStHUTBaZUszSmZtNnVvVGo4?=
 =?utf-8?B?eHBVVHoxWDF4RUVYOWhtZ25rcDk5UE8wenRyUURWWUNJdk5adDJwU2c3U0dm?=
 =?utf-8?B?eVp6cFhnVWRrcktXcXFzSXd5dzNCeVhWZGl2UzBMcmJEN2twOE1kMGhiWEds?=
 =?utf-8?B?T04zcytOeXBSbXMyd2VKRlB4MFNaL1JDNmJXeVcrOXdRb0pmRWUvaFVzNkVo?=
 =?utf-8?B?VG05ZzhNeXZhcklDM1hjRVpVQnVqbFFYN0M1N2JrMGdBOXU5QzlNYnFLcXpp?=
 =?utf-8?B?VGpPMTNUQ2cwcTEydXV1UkdyNTBaOHorZzdwd0pVTGU0VDc4K090Yy8zWmps?=
 =?utf-8?B?VnowWFZ0TFVja08vM2pRSmxROU9lR3ZzekxUS1hIdjhGemltM2cwc21XMEk5?=
 =?utf-8?B?dkV5WVAwbW0vUk41L1VtT21MMDlRT1NhcURnbjRyeU5ZZkZKeGV4UWVTalA4?=
 =?utf-8?B?ZEF5QU11d1dSd3owcW5XNGMvQVViWEpWYW1QMkhsclRpV0N5eFZ4N3A1QzAr?=
 =?utf-8?B?KzdQWkJ6SFlqVjl1Y1dnV21PUjFqejhyNDlVTTRCYVJBNm9vZ0RHT0RLUElz?=
 =?utf-8?B?eTJlUHJ5cUhxdktxaDFLQi9BdkU5SEtlY1pObC9PWVV6YnJYdkl6blUvQ3NP?=
 =?utf-8?B?QytzYnptZksvOVdlckRBRlI1RHpqTlFBd0VlNkNoUGFHUnhmN1JaTmpTM21i?=
 =?utf-8?B?aW5QOXp5YkFJSWxFVWRQNEZQTjBpZDF6bGZpRm83NjhDR1QxelBUMUhYd2pH?=
 =?utf-8?B?cmhYb1YvUnhUUDhPNU5VZVVkMGF4dnAwTFh4elIySHhGSnlNcGJHQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b454b30-6a5b-45c1-56c5-08def6e4845d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2026 13:37:26.6256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OclMzVkjRKIgM8ngxXgw53SaNjhCMNYuU+88z4ZDi2UXwhIv0Z1l7TmItLpYRDqq740vw0peefNzGp6cW5y98ruyp9RcP4AYoJ9oDQ2VYOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9753
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 13:37:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243131

SGkgUmljaGFyZCwNCg0KPiBBbGwgdGhhdCBzYWlkLCBJJ20gb3BlbiB0byB0cnlpbmcgdG8gZmlu
ZCBhIHdheSB0byBpbXByb3ZlIHRoZSBvdXRwdXQgaWYgd2UgY2FuDQo+IHdvcmsgb3V0IHRoZSBz
cGVjaWZpYyBjaXJjdW1zdGFuY2VzIHdoZXJlIGl0IGlzIHBvb3IgYW5kIHRoZXJlIGlzIHNvbWV0
aGluZyB0aGF0DQo+IGlzbid0IHRvbyBjb21wbGV4IHdlIGNhbiBkbyBhYm91dCBpdC4NCg0KVGhl
IGNoYW5nZSBJIHdpbGwgYXR0ZW1wdCB0byBpbXBsZW1lbnQgKHdoaWNoIEkgdGhpbmsgbWF5IG5l
ZWQgY2hhbmdlcyB0byBiaXRiYWtlIGFzIHdlbGw/KSBpcyB0byBqdXN0IG1ha2UgdGhpcyBwcm9n
cmVzcyBiYXIgY28tZXhpc3Qgd2l0aCB0aGUgb3ZlcmFsbCAiQ3VycmVudGx5IG4gcnVubmluZyB0
YXNrcyIgYW5kIHBlci10YXNrIHByb2dyZXNzIGJhcnMuIA0KDQpUaGFua3MsDQpDaHJpcw0K

