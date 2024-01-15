Return-Path: <Jasper.Orschulko@iris-sensing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C12C4707B
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 00:54:52 +0000 (UTC)
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (DEU01-FR2-obe.outbound.protection.outlook.com [40.107.135.81])
 by mx.groups.io with SMTP id smtpd.web10.62952.1705280088844368579
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jan 2024 16:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@iris-sensing.com header.s=selector1 header.b=5MdY937y;
 spf=pass (domain: iris-sensing.com, ip: 40.107.135.81, mailfrom: jasper.orschulko@iris-sensing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hjl2V2oD5wwiqc+RBayjTcerA45dXYIgeUDvxUCanUuic6Kyb8219yJomJNAuW9DoXgFjF9D0AaPGaPMGzmsOF7Zsz5JxyEBlApaBEDKdKIRHvAZjHhxoz5ibaAcY5ZlHXs69c3rB6MrErPtsx1tV1wBJjCDHezsLxrDpO0HhKDUiVQobBQKnC9tkI0L6SaGZQoaPtGY5qrAYNcbcHBPkiNqrDPV+A65l21hugvO5rbg1MkGwYGkVi3wVAC8DuDB7uz3udKHsBzr17Gg5LN8CRfvKmFymX29p4PiKiSFG1GaIL6usrNUyy977Q5EK5GBrNuSsKVQz9ZEdhYQ69S7WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwFCW0XdjXchRVJpkpuJAgr2fxDfZSX5vo2N2HkqORE=;
 b=BmOGFuJTvTrLQTJnjnIP59ibM2z3o1NoQX789Z8z+805zwJcHBLAfBFkxM26zGmMtW9W6iPxS26Ed4F7rYQSE8f6BqjnrZzaPKTRxYCu8rP7FMJqixQM8M0YBhY+53GVwYUAEASfjiiuhDPDaXelz2vxXVQOE1bgkykWJGTBF1wnh01u3PZUqXh5XAieplxLNCdIG+mn7SH7BDuZeVnWDJhhn/+RhT1ZZbH8lBJn1U3k3+DY9t5NJwZXC+mLdHpS5qGP30vHR9wznBSYAcHNMxxLerVxfkbB1X1M1img8JaUUcsrWzLLsnEGGkTOzAtX55dtL5IzYg+aP5fxHL0s6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iris-sensing.com; dmarc=pass action=none
 header.from=iris-sensing.com; dkim=pass header.d=iris-sensing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iris-sensing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwFCW0XdjXchRVJpkpuJAgr2fxDfZSX5vo2N2HkqORE=;
 b=5MdY937yPcz3/FFKTIJrsGS0u4bxJbJY8G2OBWdazFFxoKYvnkODUx2tRmNQk0e97iriZQ4lf2APYKQoDpqIdZXCu+7ceGuTnDfk2roaeeNbMpaZFXgy2blIjFiziJRDaxCOUQFcKHChj0SMiSJ/7CGQJPxKWovPm491XHOxtAvhxsTvpfOSmFObmxCYmhuuChANq5En/Th2sxpaNlUwZteP0xodq1J9fsUGEhwWMGb5QIZYt9SMQx4EWRzWlPX4ftVRyvhiV6/GGZEAv9ZAWiRzjC8Rhbk9ozRjeD1Q3KIA7M4cgl1/8mdw+8ru69BTEVtNphIcGmtbOVei8zuPwA==
Received: from FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:3d::14)
 by FR2P281MB2860.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:67::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Mon, 15 Jan
 2024 00:54:45 +0000
Received: from FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM
 ([fe80::1568:5c5e:8a0d:be4a]) by FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM
 ([fe80::1568:5c5e:8a0d:be4a%4]) with mapi id 15.20.7181.026; Mon, 15 Jan 2024
 00:54:45 +0000
From: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Removing Github release SRC_URIs from oe-core recipes?
Thread-Topic: Removing Github release SRC_URIs from oe-core recipes?
Thread-Index: AQHaR01toZjDsnahoEKeitp4QsxNjQ==
Date: Mon, 15 Jan 2024 00:54:44 +0000
Message-ID: <2ef89f525fd5ceaec574d025c515033c06fcaf6c.camel@iris-sensing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iris-sensing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR2P281MB1963:EE_|FR2P281MB2860:EE_
x-ms-office365-filtering-correlation-id: 1359eb75-2b7c-4e30-1c54-08dc15649070
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4A8lzLcGHu2NutaInseK72zQf9bzckeeTaKIiy7CDgK4zKPRQCB+IcKHYHEjrVqbE+RxM7eT7RT54YF3YLN+1f4MiLYVmtowjIoYMtIjGO8VfwiC4moOCUJUlsAgVAwWMfXb14lk8kn1QAVDUIuqI1B0b7i6kKHmqgB980k/XE/w/AL4NDql4UqwbDj8CMmf3UtZgigd1ShMqT7Er9IVKjRS4HihvMZzUm3Di6ja1P+C0n9yBxfQbyf7g3Ev9BjOf/so97exO1rTN8Sl44aFUYNks6YpKW7BlQVFQb75q+NBiDxBRK+/MwessggMHnl4ApLSonWlAtImjnk0CarG/4PklXlo++qhsjoEHpliMD4oU0J79iYpdlbXJyBMACrMrkQAc58AIh+UijwXrbAR4XTyXioiaQD37xFB3vi62GxrX9PKk64maonyhq6Tk+BayCic/30ZmvqvPAw61fb+zSypJbRIcqD93FjlqNDBuLUQIbXW34ehmoFo0c1he/fllGu/H5nUspwqHYA3+md9pNSFxwFkDiYPmWMRHd/glyu4EXS30NUE20GBXA8gzmAmX/kM6u4tbdXax2yW6tIcXW7lcu5SG8W95hsdxCl6Fv4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(366004)(39830400003)(136003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(83380400001)(2616005)(86362001)(36756003)(38070700009)(6512007)(8676002)(8936002)(5660300002)(71200400001)(122000001)(38100700002)(66946007)(66446008)(6916009)(66476007)(316002)(91956017)(66556008)(64756008)(76116006)(2906002)(41300700001)(478600001)(6486002)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MTl2czdzM1VUUkZxaERQbXBKUGJvanlIVEp2Nit0MkNoZ3ZQSnMxaFVyQmJj?=
 =?utf-8?B?aDJicW9VeStTeDRRQXJhT0libjIvbk5ZWUkzdy9iUDZTQmtnNzJKeVk4cGlm?=
 =?utf-8?B?b1RNYWJnRWhyaXJWZ0FwOEI1K2RPeHR0Nmw4MndVckZwMzF4TGhXQzhQakMw?=
 =?utf-8?B?aU14MVdhUXFPNGV4WGZZOGV5UkVJWWk5WDE1dVQ4Q1YxU2VNMnBEU0lFTXpy?=
 =?utf-8?B?TnZDVXZvVUZPT0ZkUmhVSUM4QXZLYVM3cW5QLzJMUld0UERFeS9xdXI4S3JL?=
 =?utf-8?B?THErQVZJYnVicDJWa0xOSEYyQUJiWUw5aXZNTXdmcFRUUC9QdUVMaG1RMTlH?=
 =?utf-8?B?MXpPWFBXcmlOWWRkeEpwRHdrcno5eXlWTzltUm5NTkZPdVphY084Wm5qTlRE?=
 =?utf-8?B?L1hNbGhFY1N5NkZIVGtkVmlRblcxNmZwVldDd2dUTjFmZHhzR01pdDVmU2NF?=
 =?utf-8?B?MkpnN2UwWWRnbk5GK2xocTB2QjE4K2YwcTd5d0FWM0FNNHk3MlB2ZTlRRUVz?=
 =?utf-8?B?SnlTU0Z2ZmNiRkxDNXN2aThyb3kwOGtzc1B3cEJQWnhWWTU4alE3K0cvTkk3?=
 =?utf-8?B?aC9HbWVNQUE4V2FTTElkVXpsd25OM3hqWTV4ZlgvelVNcGRaVHNuMW5RR1VP?=
 =?utf-8?B?ZnVXRVNuZ3RiazY2M3R2d1orUllBMlcwT3BENldyU2ZzbHc2bDdBUDJHdDJ4?=
 =?utf-8?B?UkwybnVwSVowTERJaERHeWdBWUpvVnBhQlg5cld4NzVmUTR2QlJXUm5FUnFJ?=
 =?utf-8?B?ZHYvYzZGSURLM2RFZWdSb0FIbHF5NlhuS2pKVUNjMFYyS2p0bXlnbzBPSjFO?=
 =?utf-8?B?MTZJeUlvY2Y4ZlRpbTJmOUpUc3pZaVlSRk5wN2p4MDVQZXkyNWthYkhPYkJB?=
 =?utf-8?B?dVhzbU1sNVZPS09rM2M5bENoeUdJdVh6enBzeVJvbllqT080Q0psK3hpMndE?=
 =?utf-8?B?bU5mbGVkRmp3MEk3OXlzMVpnYlhsSkdXdDFDZFh2Rnl4SEJFSUlQZHdRQVVX?=
 =?utf-8?B?eXFaOWdtUmxCTy9lNDhzbzhVb2xCUkI5Z2xLbVFTUlFkb21udmd4MG14eWx5?=
 =?utf-8?B?VTJnYmFVNmdOVjV6d2lHSlRDRkh3bDBsdkRJRGpBZjF3ajhNNVFpRkQwWmFm?=
 =?utf-8?B?aE1nRUhGbktadDAvdExMVWJwWnpFblZxWU1UaGFSeXNKeFRIT3BOUVNuV2t0?=
 =?utf-8?B?aHlSRHZpY3QyazlHNkQ2Sm5TNTNaZXphNThjanB2dDlXc003L1kyRVoydk9O?=
 =?utf-8?B?YWoxQkk5UFg4K0tGM3pMNS9FYitLT203M215czdTYmdBcXB6K21uOXJyM3JX?=
 =?utf-8?B?YTVVZDFZNjd3azNOQWNFSkNqVVk1bDFkbEsvS1FEVnh3ckc3QVdrVGpTZHRO?=
 =?utf-8?B?SUMrTEJCcWh6djV0b2xZNys4K2V4bUYyTkcyTHdNTjA0TzI1bmRQK0QvRzVr?=
 =?utf-8?B?U2VYOWV5bDBkQkVBejhzc2VsemRrY2ZySk5aWWZ3NGd4eFNWWmNNZ3BWYXpT?=
 =?utf-8?B?dTVRSmZlenFNRUIwOVVMUEpCNzBreGlYVG90aUw4dmdEVjIvSzZNMjBLRHZk?=
 =?utf-8?B?T3pmdG9yY3V0bEYvOTdvU3hzRzVFVkpneTJvNjZ4V29IakVjcmxnUzg4OWRR?=
 =?utf-8?B?OEU4SjFOc3NIYnIycERPSU02SVJvNlpiYWxpcHN1OWRtWStEVXFJZm9oMlNZ?=
 =?utf-8?B?akk3YnkrY3FRZUhJL0lmMXlCMkV0Ujkyd3k4ZFRMa0ZLbEFMaGhRMUJuZXdI?=
 =?utf-8?B?bHkrc3A5NEZFS3J6Zi9QVzRXeDhGNzltYmFYdklReVN4OHQ3RVRHVm9oYURy?=
 =?utf-8?B?NVNiRXJFNDU0RHVIdDV1bXZ2VWJ3VlhITG9RN1dCOUFUaUVrMXFsblo2WkVo?=
 =?utf-8?B?TUFXcWJPa1hiZWxxWGdWZ0s2akM5VjNHM2VMRUJnbVNPNVRnVDJ2QjhYM205?=
 =?utf-8?B?RTZldnVpa0owSzV6MG1nQ0hZMmg2aENkMTVHZkpTbUhOdmZzRjRHd1hIUU11?=
 =?utf-8?B?VkFwajkrcEdibjRXMHFmOC9JWlBsdmMrcnRtRWgrNEVad2V6WWxYVklCd2Nt?=
 =?utf-8?B?end2dElDdHZkNytRbXdXSUk1QkpVUzZMWEZyb0tia1NQV0IxYllQODhLeVdi?=
 =?utf-8?B?ZUdhWEFJQVhZK3JVWEtuZUpDMVZhM0tHdVdvS2pMT0U0VURCOW9vdTJURm5v?=
 =?utf-8?B?MEVvbWorTnA3Z0pUejVkZHdxVkttMlVFS3Q2NFpPZnZXMm5OWVdPd3Fyd0xh?=
 =?utf-8?Q?cAkLMs9co9fMAa4hy1QGtk09jsrGXC3T5g66LFXfSY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB426E2354D3F7468C0CCA3EE8A8EA08@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: iris-sensing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1359eb75-2b7c-4e30-1c54-08dc15649070
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2024 00:54:44.3409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 963f3913-ffae-43fd-856b-2dfd3f6604e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jHFYY8xgfbd5xxlg9MPNELBg6ZbcYjJPEpvZsHRslFGHfZVPjNRSjjLaOWU0rkLRz4R7oPct8au98QZRteGwnYuxLhEzjoS6pur8NQe9PjADtmJd4YEjTOVWoNY+xkbW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB2860
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 00:54:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193628

SGkgYWxsLA0KDQoNClRoZSBUTDtEUjoNCg0KSWYgbm8gb25lIG9iamVjdHMsIEkgd291bGQgbGlr
ZSB0byBwdXQgaW50byBtb3Rpb24gdGhhdCB3ZSBncmFkdWFsbHkNCm1vdmUgYWxsIG9lLWNvcmUg
cmVjaXBlcyBTUkNfVVJJcyBmcm9tIEdpdGh1YiByZWxlYXNlcyB0byBnaXQgc291cmNlDQpjb2Rl
IChhcmNoaXZlcykgZm9yIGJldHRlciBzb3VyY2UgY29kZSB0cmFjZWFiaWxpdHkuDQoNCg0KUmVh
c29uaW5nIGZvbGxvd3M6DQoNCi0tLQ0KDQpDdXJyZW50bHksIHRoZXJlIGFyZSAoYXQgbGVhc3TC
uSkgMzUgcmVjaXBlcyBpbiBwb2t5IHRoYXQgdXNlIEdpdGh1Yg0KcmVsZWFzZSBwYWNrYWdlcywg
cmF0aGVyIHRoYW4gdXNpbmcgdGhlIHVubW9kaWZpZWQgZ2l0IHNvdXJjZSBjb2RlDQooYXJjaGl2
ZXMpLg0KDQpJbiBteSBodW1ibGUgb3BpbmlvbiwgdGhpcyBpcyBub3QgYSBnb29kIGlkZWEsIGFz
IHRoZSBHaXRIdWIgcmVsZWFzZXMNCmRvIG5vdCBuZWNlc3NhcmlseSBhbGlnbiB3aXRoIHRoZSBj
b250ZW50IG9mIHRoZSBhY2NvbXBhbnlpbmcgZ2l0DQpyZXBvc2l0b3J5LCBvYnNjdXJpZnlpbmcg
dGhlIGFjdHVhbCBzb3VyY2UgY29kZSB0aGF0IGdvZXMgaW50byBhIHlvY3RvDQpwYWNrYWdlLg0K
DQpDYXNlIGluIHBvaW50LCBJIGFtIGN1cnJlbnRseSB3b3JraW5nIG9uIGEgKE1JVCBsaWNlbnNl
ZCkgYml0YmFrZSBsYXllcg0KZm9yIGludGVncmF0aW5nIE9zc2Vsb3QgKGh0dHBzOi8vd3d3Lm9z
c2Vsb3Qub3JnLyksIGEgc29mdHdhcmUgbGljZW5zZQ0KY3VyYXRpb24gZGF0YWJhc2UgaW50byB0
aGUgYml0YmFrZSBidWlsZCBwcm9jZXNzLCBpbiB0aGUgaG9wZSBvZg0KY29sbGVjdGl2ZWx5IGxl
c3NlbmluZyB0aGUgcmVvY2N1cmluZyB3b3JrIChhbmQgcGFpbikgb2YgY29tcGFuaWVzIHdpdGgN
CnN0cmljdCBvcGVuIHNvdXJjZSBzb2Z0d2FyZSBjbGVhcmFuY2UgcmVxdWlyZW1lbnRzLg0KDQpP
c3NlbG90IHVzZXMgdGhlIG9yaWdpbmFsIHNvdXJjZSBjb2RlIGZvciBwb2ludC1yZWxlYXNlcyAo
ZS5nLiBHaXRIdWINClNvdXJjZSBDb2RlIGFyY2hpdmUpIGZvciBjdXJhdGluZyBwYWNrYWdlIGxp
Y2Vuc2UgaW5mb3JtYXRpb24gb24gZmlsZS0NCmxldmVsIGFuZCBleHBvcnRpbmcgdGhlIGxpY2Vu
c2UgaW5mb3JtYXRpb24gaW4gU1BEWCBmb3JtYXQuDQoNCk15IGJpdGJha2UgaW50ZWdyYXRpb24g
d291bGQgdGhlbiBhdHRlbXB0IHRvIG1hdGNoIGNvZGUgaW4gdGhlIFMNCmRpcmVjdG9yeSBhZ2Fp
bnN0IGxpY2Vuc2UgZGF0YSB3aXRoaW4gdGhlIFNQRFggZmlsZSwgdmVyaWZ5aW5nIGZpbGUNCmVx
dWl2YWxlbmNlIGJ5IGhhc2guDQoNClRoaXMgaXMgd2hlbiBJIG5vdGljZWQgYSByZW9jY3Vycmlu
ZyBwYXR0ZXJuIHdpdGhpbiBtdWx0aXBsZSBvZS1jb3JlDQpwYWNrYWdlcyB0aGF0IHJlbHkgb24g
R2l0SHViIHJlbGVhc2VzOiANCg0KRm9yIGV4YW1wbGUsIHRoZSByZWxlYXNlIGRvd25sb2FkIGZv
ciBsaWJleHBhdA0KKGh0dHBzOi8vZ2l0aHViLmNvbS9saWJleHBhdC9saWJleHBhdC9yZWxlYXNl
cy9kb3dubG9hZC9SXzJfNV8wL2V4cGF0LTIuNS4wLnRhci5neg0KKSBjb250YWlucyB0aGVzZSBh
ZGRpdGlvbmFsIGZpbGVzIHdoZW4gY29tcGFyZWQgdG8gdGhlIGNvcnJlc3BvbmRpbmcNCnRhZyBp
biB0aGUgZ2l0IHJlcG9zaXRvcnk6DQoNCiAgICAiZXhwYXRfY29uZmlnLmguaW4iLA0KICAgICJj
b25maWd1cmUiLA0KICAgICJNYWtlZmlsZS5pbiIsDQogICAgImFjbG9jYWwubTQiLA0KICAgICJl
eHBhdF9jb25maWcuaCIsDQogICAgIm00L2x0dmVyc2lvbi5tNCIsDQogICAgIm00L2x0b3B0aW9u
cy5tNCIsDQogICAgIm00L2xpYnRvb2wubTQiLA0KICAgICJtNC9sdH5vYnNvbGV0ZS5tNCIsDQog
ICAgIm00L2x0c3VnYXIubTQiLA0KICAgICJjb25mdG9vbHMvY29uZmlnLmd1ZXNzIiwNCiAgICAi
Y29uZnRvb2xzL2NvbmZpZy5zdWIiLA0KICAgICJjb25mdG9vbHMvbWlzc2luZyIsDQogICAgImNv
bmZ0b29scy9pbnN0YWxsLXNoIiwNCiAgICAiY29uZnRvb2xzL2FyLWxpYiIsDQogICAgImNvbmZ0
b29scy9sdG1haW4uc2giLA0KICAgICJjb25mdG9vbHMvZGVwY29tcCIsDQogICAgImNvbmZ0b29s
cy9jb21waWxlIiwNCiAgICAiY29uZnRvb2xzL3Rlc3QtZHJpdmVyIiwNCiAgICAieG1sd2YvTWFr
ZWZpbGUuaW4iLA0KICAgICJsaWIvTWFrZWZpbGUuaW4iDQoNCkluIHRoaXMgY2FzZSB0aGUgZmls
ZXMgYXJlIHRoZSByZXN1bHQgb2YgcHJlLXJ1biBhdXRvY29uZiAod2hpY2ggZnJvbSBhDQpvcGVu
ZW1iZWRkZWQgcGVyc3BlY3RpdmUgZG8gbm90IGJlbG9uZyBoZXJlIGluIHRoZSBmaXJzdCBwbGFj
ZSwgdGhhdCdzDQp0aGUgImRvX2NvbmZpZ3VyZSIgdGFza3Mgam9iKSwgaG93ZXZlciB0aGVvcmV0
aWNhbGx5IHRoZSBHaXRIdWIgcHJvamVjdA0KbWFpbnRhaW5lciBjb3VsZCB1cGxvYWQgYW55dGhp
bmcgYXMgYSAiR2l0SHViIHJlbGVhc2UiIHRoYXQgZG9lcyBub3QNCm5lY2Vzc2FyaWx5IG5lZWQg
dG8gYWxpZ24gd2l0aCB0aGUgYWN0dWFsbHkgZ2l0IHNvdXJjZSBjb2RlLg0KDQpTbyBub3Qgb25s
eSBkb2VzIHRoaXMgbWFrZSB0aGluZ3MgY29tcGxpY2F0ZWQgZm9yIG1lIGFuZC9vciB0aGUgT3Nz
ZWxvdA0KY3VyYXRvcnMgKGVpdGhlciBJIGFtIHN0dWNrIHdpdGggWCBhbW91bnQgb2YgdW5jdXJh
dGVkIGRhdGEsIG9yDQpjdXJhdGlvbiBlZmZvcnRzIHdpbGwgaGF2ZSB0byBiZSBleHBhbmRlZCB0
byBhbHNvIGluY2x1ZGUgR2l0SHViDQpyZWxlYXNlIGFyY2hpdmVzKSBpbiBteSBzcGVjaWZpYyB1
c2UtY2FzZSwgYnV0IGl0IGFsc28gcmVkdWNlcyB0aGUNCmNvbmZpZGVuY2UgaW4gdGhlIHJlcHJv
ZHVjaWJpbGl0eS4gV2hvIGlzIHRvIHNheSB0aGF0IGEgYnVpbGQgZnJvbSB0aGUNCmdpdCBzb3Vy
Y2VzIHByb2R1Y2VzIHRoZSBzYW1lIG91dHB1dCBvZiBhICJtYWdpYyIgcmVsZWFzZSBwYWNrYWdl
Pw0KDQpJIGJlbGlldmUgdGhhdCB3aXRoIHRoZSBhbW91bnQgb2Ygd29yayBvZSBoYXMgYWxyZWFk
eSBwdXQgaW50bw0KcmVwcm9kdWNpYmxlIGJ1aWxkcyBmcm9tIHNjcmF0Y2gsIGl0IHdvdWxkIGJl
IGEgc2hhbWUgaWYgd2Ugd291bGRuJ3QNCmV4cGFuZCB0aGlzIGVmZm9ydCBtYWtlIChhdCBsZWFz
dCkgb2UtY29yZSByZWNpcGVzIGJ1aWxkIHJlcHJvZHVjaWJsZQ0KZnJvbSBnaXQgc291cmNlLg0K
DQpXaGF0IGFyZSB5b3VyIHRob3VnaHRzIG9uIHRoaXM/DQoNCldpdGggYmVzdCByZWdhcmRzLA0K
SmFzcGVyDQoNCg0KLS0tDQoNCsK5OiBncmVwIC1yRSAiaW5oZXJpdC4qZ2l0aHViLXJlbGVhc2Vz
IiBwb2t5LyoqLyouYmIgfCB3YyAtbA0KQ3VycmVudGx5LCB0aGUgR0lUSFVCX0JBU0VfVVJJIHZh
cmlhYmxlIHVzZWQgaW4gdGhpcyBjbGFzcyBkZWZhdWx0cyB0bw0KImh0dHBzOi8vZ2l0aHViLmNv
bS8ke0JQTn0vJHtCUE59L3JlbGVhc2VzLyIuDQo=

