Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800F6CA0EE4
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 11:22:51 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.22])
 by mx.groups.io with SMTP id smtpd.web10.15754.1755681681814798749
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 02:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=mO1KYekk;
 spf=pass (domain: ericsson.com, ip: 52.101.70.22, mailfrom: tony.rex@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckB1y9RZvd53/ptV40Ou9DTXEx4jNbqW2lDVrNW8RDfCL/yIy74UMm5M7Jzscn3+o2ixp+qFxWKjiThtmi430q3O6qU2m4s999G9/S4OdWp0D4ViEtFiAwSt5M5S7GPR3ujQmfaN/T6siqD5u8ZpQ7S843RT5SU3UUIV9dWPNHbskv1BX3MQ3uwNmbGGu0thoXErVR5MGMINfNEYJdv/9eWYdvpcXGbezpesosQB3Ct0H7usCe2lQ1TLseHIzfzSbGTrl715xBUdjuI4SC6Cqje+nCTGMa9hg3omJ8z/f3GbQ4ZqZMf/a3ue7uYx5y+qMxSF6tz02n2zkfTHNRW9IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALHXaVHxn+S71F6baAJE3zrPvYVgzyZ/MSq8/M87MOo=;
 b=Ffy7OdBf3/iyIu2Ii6qJAmosGupZiY3ievuPCanDTYEW1WaKjffFhgs3hJOjWKiOs6rwnh0XfVZOQwuc+VKdgLchMNgHJ5KL85MbpV7vDhW0lcQH6G1h6o6dQslpY+60PLRkD8YCA2PJUXIweGYoDcKHbIMNqllz04j/W8mDKH/LQmLc+XwCr/NnHi7L0zSu24d54hXuricizQBFHlw4cx5EllK/taLpleg7ioKe42adE5FFt2FJlsoBcVXeYdZou7fJxSUW5j0lHGYd3wj0LCFlWf1vz4h772JGTkBunLBjlMtji5WxqZkI1w+mMJ5fWXwPPXXtlUt+ycxnyur3Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALHXaVHxn+S71F6baAJE3zrPvYVgzyZ/MSq8/M87MOo=;
 b=mO1KYekkeVfgHffhttu5inyvnlPsoKdwG12cVbGnWFPJ3J6vWyPyrM/7BnjF8IEePw2qOSlHPxyzVXGoh/6IdTyH0E7YO+TPgutTD//vLSL/LWQBOMqHWWeXfvHx8TsTAvBMTnE4iYRpeA3rfckOCFt8pCQ2Q26iSjJTXQO9abjjHG+jbwm4DSfhwuLnTB1NAmfqBi8Fna0AJ7DH1lxBzwAMxbqs+C7TlMzkCxNJGDhE4L4aYB2IkXEhz2b8quwnEm6FaXYp6+lxAY8yH3nWlqLiKpl5ibOyfL6s6k6w2D8ZEEx/Zy3A3jUDU4HIeVddwNknsJ1Yb7ThKLyp9lQeMg==
Received: from DB9PR07MB8474.eurprd07.prod.outlook.com (2603:10a6:10:36e::13)
 by GVXPR07MB9796.eurprd07.prod.outlook.com (2603:10a6:150:11c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 09:21:16 +0000
Received: from DB9PR07MB8474.eurprd07.prod.outlook.com
 ([fe80::9d81:2fdd:7f92:c1f4]) by DB9PR07MB8474.eurprd07.prod.outlook.com
 ([fe80::9d81:2fdd:7f92:c1f4%5]) with mapi id 15.20.9031.021; Wed, 20 Aug 2025
 09:21:16 +0000
From: Tony Rex <tony.rex@ericsson.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe parsing race issue
Thread-Topic: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe parsing race
 issue
Thread-Index: 
 AQHcDUA2gbaZljQhkEy0FCsy98lt0bRjcqoAgAAwWXCABg/TAIAAykfggACs94CAACBjEA==
Date: Wed, 20 Aug 2025 09:21:16 +0000
Message-ID: 
 <DB9PR07MB8474968646D28247CFB3772CE433A@DB9PR07MB8474.eurprd07.prod.outlook.com>
References: <20250814172348.3882586-1-tony.rex@ericsson.com>
 <DC2W6ED7YCUS.1V4VLCIHMFF17@bootlin.com>
 <PAXPR07MB8470CECE924BE2127902BAF3E434A@PAXPR07MB8470.eurprd07.prod.outlook.com>
 <CANNYZj_DaekmJt8W1g-nc+QsB7TnY-yyWwmGSR_GOYRORLhRCw@mail.gmail.com>
 <PAXPR07MB847086B08E52F2405CB530B3E430A@PAXPR07MB8470.eurprd07.prod.outlook.com>
 <CANNYZj_DZA5C5Cjtf9F7RBkxpFN-n4YbJNTh+tCVAn4NDx2Umg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_DZA5C5Cjtf9F7RBkxpFN-n4YbJNTh+tCVAn4NDx2Umg@mail.gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR07MB8474:EE_|GVXPR07MB9796:EE_
x-ms-office365-filtering-correlation-id: 5ba207bc-c724-4e6f-0029-08dddfcaea59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?M00yK1k5akwwY2NRMS8xcXRuU2ZhNm5BQi9JRzloZVMvRnRoZEJyUmtIS3JW?=
 =?utf-8?B?Y01XZlZ2QkVkeS9BQTNuNnNCVnhibTVTMkZyMitsOHhYVlRUdmlWSGppbmZJ?=
 =?utf-8?B?T3YyN3VKaWVQWGZBd2VMUGxTay93N1NLbVFCU3VmZlF3cDdwQzk5QkRuQ1M3?=
 =?utf-8?B?SmhrbEZ3VFdnQy9FUFVqdTVaMU51d1VyNWU1STNRdGwycWZGL0g5T1NmNEpL?=
 =?utf-8?B?eUdnWXZPeFFzbVQ1YW93NDR3MXlUeXgwRVN1a20xZlAyTkd0L0ZpdFhvQlZu?=
 =?utf-8?B?V3hlcGMvUk0xMHBUdTNUMFNSZkVVcGNqdkpHb3N0OWJMSTloNlVwK09Jei9i?=
 =?utf-8?B?ZmNLMmFpV3kyQ3lEam5HTGpqRDNJbDlwTDZoRHMzdUtoNzlieFA3SEl5K0dB?=
 =?utf-8?B?ODkrSExTR3g1cE1HcFFBMnRIelBBZy9MTEVWSXRKcWk0YVBqYlpkRStEdWI0?=
 =?utf-8?B?OTVIOTl5M0NQQ29mM1ovSUZuS2ZNd3FEY3Y0VnpUM1lXMENhUUVxbXJWRXdZ?=
 =?utf-8?B?N0NBUHpDeE05bHNYQXJ4OTZiazlCeE1GWlJsbG9VUlFKQ0ZremVVcjZWTGt4?=
 =?utf-8?B?TVZlRmQ4SEwzOFM4OUlGcWs5bVVKTVBlaUQrRWRVUUxCenBFa0JKRmxRMnVO?=
 =?utf-8?B?UTM4MnpqcE5pZ3NHcDFBV0JZTFk1TDRzVStFcDRqOXZTSlUveC9WK2xPK1po?=
 =?utf-8?B?eHVWa2FlbFJhREpqN3grM2tJZDZoc214Yk16WGxHT0dhUTVvMzRSQmFhVS9P?=
 =?utf-8?B?YXdyL0FlTXpoY29aN3dYbHJQWjhGS3lEVUNpWFJ1dUd3VVVtVjdwbUM0T0Vs?=
 =?utf-8?B?VC9DNisvRkxYekFFQ0J5NVZCOWlYNnZWdjJacjZDY1JZZ2w0TVVuRzN5QmVn?=
 =?utf-8?B?Y0RXSXFoMDBKcTNWaHBBMzc1L20zUzhoRVBzZ2VvVDRkbzIyS1RRdHVBWk00?=
 =?utf-8?B?WW9jOFI4cGFrSG1OalpBNDdlL29UNlhoc1hVWjRtVWJ5TEpWZXNoT3lhbnJN?=
 =?utf-8?B?UUk1VUIrTGRodDZ3UTZsTVlUVXJoVlA4K3B4dGMzc0VYME9qY0NtRDBMQU5a?=
 =?utf-8?B?b3h5UFVIYWxjN1p5R1FETndQWVhGK1NRL0g1TDNkZ0d4d3FYTzd1a00vZnh0?=
 =?utf-8?B?UzRDRjRxMVloU0xINEtVUVZyMmZBSG1OeHNXL2dTR3ZHTWY4bE03aDRGZkNs?=
 =?utf-8?B?UXRiWnhBMVlsUkF0R2tVNlh2ck1YcVQ0ZzlBeDJOeUtic2ZqUnZTS3FhTisw?=
 =?utf-8?B?aE1FYk5jUVhaN0JqTndUbHY5My81QXdZcDNHbVBwTTA1SEVLTVBJalBRMFpj?=
 =?utf-8?B?dG5XZUp4SFF6dENPUllUUnUvL2JscnlhVEpHQ0hkS2hJR091eGNPaVBnQzAz?=
 =?utf-8?B?NnJaWkFmWEpUdlVWWUovR3lkRVcyYzY0RTIwTklGdGt4ZUNpalgzZHpzSEp5?=
 =?utf-8?B?UGJOYmwxS0pza3R2cXErZTI1T0VEbDN5RTd1dnF4WVpNT09YYXJ3NGZkS05m?=
 =?utf-8?B?NE9oOGJuTmNPRkpYbGlHSy8rbGc2eTNMZUpNS2tJZVk3MDNtTzlQbC9MUTU5?=
 =?utf-8?B?VVlMRVora1hELzcvU0drSWkwT2R1Rk1WdERTYkNPRTJ4ZkdWVVEzSGxyUEVL?=
 =?utf-8?B?OVl1TW01SSsvZUIvRjF2c0hLTFZzbURxM2JPelcvWDgrSzcxY1diY3pCZERr?=
 =?utf-8?B?cVNqbUVVRTBFNExSR0ZOYVIxVFJrd1ppOEhBYXRVRWNHRE1JSHhBQUFwTFBo?=
 =?utf-8?B?bGlCL3ArdjNORzJLdlFMM05ZSVJsTC94OGZDbnRKb09ZRlpleU1Odi9Pb0xm?=
 =?utf-8?B?TXRqUGFIbUw0eVBteGpPRFgydlhWWWVUV3FGcHdnbmRybkIwWTlzQlh4NENs?=
 =?utf-8?B?YXFYVWxPTjBKZVRIWTlyVDJEK1NiNG54Ukh6SXZFYnVaVXZIMXVSRkxLNDQx?=
 =?utf-8?Q?zormvHUwr7Q=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR07MB8474.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R1FHYVlNelJJeDZUNGNXRUFuS2xuRk0wTFlXeHpUdk8wUmp3UUtXSTBQdEd5?=
 =?utf-8?B?bllWdHNHTHE3U3dwQ3pDY2NvT1I2Q3Y4aC9uancrRE40N0YxNVZHTzVONUZ6?=
 =?utf-8?B?L1RSTUpjOWtDUTg1SXkwK3ovWVVOclFzSm5VZERyVVRhNytjbUtNVXJnTnY0?=
 =?utf-8?B?U3dtOU4yWjZ6TjFqMUl1YVBxL3NpN2NiK09mb0F6cWY1QVRmQTk4OWVYektq?=
 =?utf-8?B?Q3FwVDJja0dKZU42SlNMMGQzcDBqTXRaM0NVN2pWWmdaUnJiZldIdFNpbUpR?=
 =?utf-8?B?VkFyTzUrc05CTm1KVXNxdys0dEY1ajNNQUVUekNiTjNOMjNzKzV3azJBVGVZ?=
 =?utf-8?B?Uy9CWEU5cWpGdGUrdk1QN0svbXZKTDkxMFpOSWs3RDl4MldhN2pJaW1sYlM2?=
 =?utf-8?B?SGIxSzBpVVZUZ0FGWGpKZGRSOHcvK21obk1OUnp1d2ZpRHpGUDJRKzRweHNN?=
 =?utf-8?B?K0kwZTNLN2kxOUVXb2NhN1MweEh5Y3g5L2t6UGtxb014alVsbHdHVmlUZ0RR?=
 =?utf-8?B?N3hLUHcvRGVVak9qL3N0WDdDT1EzWGZ6SG43VlNUNnFoOXd5eFU0dVpiRFpO?=
 =?utf-8?B?RVlUajNYMlNxSnI1M1ZYd2R1SENlNnl4TndyQXU1MlZkT3BJOHp4VGIxWmZB?=
 =?utf-8?B?K0ZTaUVOdnk2Y0FnYXlBV21wRDYzQlliQjd1WmgrMFBUSWM3a2N0cUZxbEl6?=
 =?utf-8?B?eGRiYTM3TWVNb25uRXJHYXNTVnZMN0p4dlpNMDZMN1hreVUzUE8zc1dON2NZ?=
 =?utf-8?B?Z0h3TU5DdzZBNHRaSFdlRzVPTUg2YXZWSStodDcyN3JQZnJlSnRsSzY2VUZn?=
 =?utf-8?B?SG5BMkNIYWRKaVhSWnJWcEVVTy90WkdkK3Ztd2xRSkVZemZEb0NheXNHdC9V?=
 =?utf-8?B?S0lHdmRaTmdVU2I3RElXaGVwYmhLMDZhQUFhTHRLMXcvbHFaODNpaDNzMEFv?=
 =?utf-8?B?ZnBTUFNXZ1M4THNCdEg3cUVJenNsanY3TEZzOUhoa2N5NGk0dUVtOFZvZ1h2?=
 =?utf-8?B?Q1ZPVWU0TktoTHFyU2VMQWdkM1dxQjdkK2JETUF3dzNzbFFIejE5QjlmY2o5?=
 =?utf-8?B?Y2JlTDcrMUtvRWkxZS9Lcmh3YTdqNU85RXdzS0xXUW5LMTc3bnlkVVdFeVRZ?=
 =?utf-8?B?TWMvUTNIYzJXZ09BOWxGeWJISUhORVpzalZFZlJRbFd4dlJuYUpycVNvNWQ2?=
 =?utf-8?B?aEtKY0pOUE9jU2RmdGVJQ1JMYTgxVlRGV0V2QmNGV3hmS3Zha3F1ZG1UWXhQ?=
 =?utf-8?B?UDBlREpEY3l6b2dMRmxqY1N1dmpGQUhQL0xKNUs4WlRWQlgxcnVTM2paY1Bn?=
 =?utf-8?B?Z1NQQVRrVWU2eXQ0WUhoQzV5QURIeUN4MkFGYis1L2dRd2N5WWNZSkE2dXg3?=
 =?utf-8?B?b245SWJxRlVrekh2aExPbmpmMlUvRm4yS3BiVWhjd3Zscm8wQ3NPdjRLYTRE?=
 =?utf-8?B?cGMrcm83UWNlUzJXY0oveFp6ckk2R3dhU2xORGJjc2pyc3hWa2pEUm5MSFNB?=
 =?utf-8?B?ZDg3SEg5dmxzcDdiRXcvL2RVaTVTR3VpOE02RzNPYnd3ejZGeE1CU2JKcDR4?=
 =?utf-8?B?UG94T1J3YVdhZWZxQXovbGoxZjd2U2tUa05XWXhjU0kwbVJhdVg4blVPa2dD?=
 =?utf-8?B?RnR2MVkzQlU2TmpzNHRubjRVOHdoaS9PNStLL3FhYVRmZGJKN1pzYjkxU1Zu?=
 =?utf-8?B?VjlTMU9zbU0wMW83a1FYNmE1Z0kyWHpyd1Z6SC81eFc4d2VuUnd6VXR3bXp5?=
 =?utf-8?B?SjF0TklqenhmckhmdVlDSkZ4YmZJTUtKYkpFLzBrYmFpQzcvOGRSdDlHMlVR?=
 =?utf-8?B?ZXBUdDRzY212NUJWV3FEZ2xRcGtIMFpvZXJ0OGgwRVorSkpaR00wY0kvSVBG?=
 =?utf-8?B?SWQ5Y1lYMGJuMVZBS2hMMkErcXkvdVI3blYxaHNhc3A1djNqQmUwbHhucFJB?=
 =?utf-8?B?Mk9meWJWbDhQZXVmeEMzR2hmVmFsbHNwejlaN09BU05oUlQ3TkV3S1dPNXB6?=
 =?utf-8?B?bnJoUjB6TVQwV0toM20xL20zTy9kZUVnWVNWVkZENmdSYk1iODFwby9zZG4y?=
 =?utf-8?B?K3ErL21XVzA5NnNrK2cyTmxURFVoTHMwZjBiWFRXdUFac3dpMFQ3Ulkxa2RN?=
 =?utf-8?Q?FGbB9pGu9sBqZJlI/PZl2EF9B?=
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR07MB8474.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba207bc-c724-4e6f-0029-08dddfcaea59
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 09:21:16.4211
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aDVhzuvQhwglR7q/OS7+x8V22rKMPdvNvXiO0WCwWSeXPZOItTC/jCxoyuu5A0WBB5imc5JJFvj29YWSJ702Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR07MB9796
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 11:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222174

Tm8gdGhlIHBhdGNoIGRvZXMgbm90IHNlZW0gdG8gZml4IHRoZSBwcm9ibGVtLCBJIHNlZSB0aGUg
c2FtZSBiZWhhdmlvciByZWdhcmRpbmcgdGhlIGZsb2F0aW5nIHRhZy9icmFuY2gsIGJ1dCB0aGUg
cGF0Y2ggSSBwcm92aWRlZCBtYWtlcyB0aGUgZmxvYXRpbmcgdGFnL2JyYW5jaCBndWFyZCB3b3Jr
Lg0KDQpJJ20gc29ycnkgdGhhdCBJIG9ubHkgc2VlbSBhYmxlIHRvIHJlcHJvZHVjZSB0aGUgZmxv
YXRpbmcgdGFnL2JyYW5jaCBpc3N1ZSBhbmQgbm90IHRoZSByYWNlIGNvbmRpdGlvbiBpc3N1ZSwg
d2hpY2ggSSBoYXZlIHNvIGZhciBvbmx5IG1hbmFnZSB0byByZXByb2R1Y2UgYW5kIGV4cG9zZSBs
b2NhbGx5LCBidXQgSSdtIGxvb2tpbmcgaW50byB0aGF0IGFzIHdlbGwgYW5kIHRyeWluZyB0byBj
b21lIHVwIHdpdGggYSB3YXkgdG8gY2F0Y2ggaXQgaW4gYSBtb3JlIGNvbW1vbiBzY2VuYXJpby4N
Cg0KVG9ueQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQWxleGFuZGVyIEth
bmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQpTZW50OiBXZWRuZXNkYXksIDIwIEF1Z3Vz
dCAyMDI1IDA5OjE2DQpUbzogVG9ueSBSZXggPHRvbnkucmV4QGVyaWNzc29uLmNvbT4NCkNjOiBN
YXRoaWV1IER1Ym9pcy1CcmlhbmQgPG1hdGhpZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbT47
IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gW1BBVENIIDAvMV0gYmFzZS5iYmNsYXNzOiBGaXggdGhlIHJlY2lwZSBwYXJzaW5n
IHJhY2UgaXNzdWUNCg0KT24gVHVlLCAxOSBBdWcgMjAyNSBhdCAyMzoxMCwgVG9ueSBSZXggPHRv
bnkucmV4QGVyaWNzc29uLmNvbT4gd3JvdGU6DQo+IE9rLCBzbyB0aGUgcGF0Y2ggZml4ZXMgYSBi
dWcgYW5kIHRoZW4gdGhlIGZsb2F0aW5nIHRhZy9icmFuY2ggZnVuY3Rpb24gaXMgaW4gcGxhY2Ug
YWdhaW4uDQo+IFRoZSBmbG9hdGluZyB0YWcvYnJhbmNoIGZ1bmN0aW9uIGlzIGJyb2tlbiBkdWUg
dG8gdGhlIGJ1ZyBhbmQgdGhlIHBhdGNoIGZpeGVzIGl0Lg0KDQpSaWdodC4gQnV0IHRoaXMgaXMg
ZGlmZmVyZW50IHRvIGEgJ3JlY2lwZSBwYXJzaW5nIHJhY2UgaXNzdWUnLiBEb2VzIHRoaXMgcGF0
Y2ggZml4IHRoZSBwcm9ibGVtPw0KDQpodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL3Bva3kv
Y29tbWl0Lz9pZD0zZDQ1MWYzNDUyNjQzYTZmY2FhN2ZmOTM0NWE2Zjk1NTM5MmRhZWMzDQoNCkFs
ZXgNCg==

