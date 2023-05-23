Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3034C7EE26
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 08:41:28 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.84])
 by mx.groups.io with SMTP id smtpd.web11.16830.1684831281378282160
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 01:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=MNXmd1Qd;
 spf=pass (domain: siemens.com, ip: 40.107.22.84, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyTS9FtT4zZKQB5YhMTXwv5XSiRnM45OKjU2pQmnE70ck32oEaWYqO/C7gOJuMoz1puTZkqzqBcHvIAh/oDDor7OHg2sgj1YCwOOGyhy2lGL3xqD6X0l8utYL5s7bpH+W4dVVH/uB/7O04be7niIVwyD/pLqnEbUlHgVZpbJbmdFskAIPag6t82tBVADLxTeAVitLPeZfOsbl+Gwr2H8N4AH+vTxYx3IMct7NMeZVryAGqVVGUSmbpIgEIiV4L8D8WCRuk5A+wQee3Y6T6MN4QKY6vSzBSjrX4rgytprkVuvrBjovDeOtMzLpXKOMJGeTV1xYCiTs3FALcXoCvnnAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHxq9nY0p7oO2LQM12hNIE+V+kktKUoIqbQl3DRoJs0=;
 b=H6vb3LkbyJIPSPgPE4bN3IrcJYqVb/hUqctBfu1V1jBpUGSrZpkY/P3x1Uga+VSVKCQHvuSjXh/y4yz4xPZquNkr2okfjuaDi1q3EQTAvGIeMss+5fXSbqK8cPgdr0h8QKM7fpkazITHLZhwOpgCyW0JV/W4YkqB0rZ/O46x2ewhBCMIvRm/MyMu++tQG2Hp5unU7u2GsfmKZj+9TfggkKbXDaSjtkpeBba+ZP4YW8A8rasniOJFDpVl1tFDeT02wZAEB8Z1TlQod7vvsICbeKFSdG2AaIkFbaEIuaqg6XoxK0jrtbgt5Xdd67kXw8kn7jLfxQvHFUt/rF+fvSZbwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHxq9nY0p7oO2LQM12hNIE+V+kktKUoIqbQl3DRoJs0=;
 b=MNXmd1QdxhOpElV7RZQNWRwpcaRRCiXSj5JjbXBvl7FyySOMupHN0aIpdbkhbF/w3p7kvNkWL1x0HBeO8b2uGJD0omGQAPkDIhTez2qnvat0QPi69TRQpz1NHr5SnZke+iPNzTRGKaARtyI4+NzuiwSNEH50Tls+22csj8kSPKAt3ZRh3PJjRTxkbnps7Xrg5Ik/tnHJHXkrkui7QWKl599FpU12sVGB69xZm1rOUQqzyC3pS2OK8Yr/AT6qQ2M22Z0hV4vPI5IHKZ63gGLI/ULe3E2GSBZxjC0ZDaleyZKiRqopjFF/VF8tpOiO1F5nvp1ZaS1xJNuiVf70qUoQPA==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by AM8PR10MB3987.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1e1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Tue, 23 May
 2023 08:41:18 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6efd:61a4:f180:349a]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6efd:61a4:f180:349a%6]) with mapi id 15.20.6411.029; Tue, 23 May 2023
 08:41:18 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
CC: "rybczynska@gmail.com" <rybczynska@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "mikko.rapeli@linaro.org"
	<mikko.rapeli@linaro.org>, "Marko, Peter" <Peter.Marko@siemens.com>
Subject: Re: [OE-core][PATCH v3 1/3] cve-check: add option to add additional
 patched CVEs
Thread-Topic: [OE-core][PATCH v3 1/3] cve-check: add option to add additional
 patched CVEs
Thread-Index: AQHZihqbG5G4I0dS2UWqCx2nZGAKF69hksWAgARfQ4CAAZ5wgA==
Date: Tue, 23 May 2023 08:41:18 +0000
Message-ID: <19c1472f11e4f1eef2c8dbe52926510830408d4b.camel@siemens.com>
References: <20230505111814.491483-1-andrej.valek@siemens.com>
	 <20230519062420.37015-1-andrej.valek@siemens.com>
	 <CAApg2=QtoHacGg6sXs+dsVZ6jg6VnyuepkSVTWhCNY5YrmMv=g@mail.gmail.com>
	 <ZGsghWIXfholEAdA@nuoska>
In-Reply-To: <ZGsghWIXfholEAdA@nuoska>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3977:EE_|AM8PR10MB3987:EE_
x-ms-office365-filtering-correlation-id: 66b84655-d0a2-42da-e4fa-08db5b697a3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XkcBsCSPcfrlFMw4NWs8GSkFWvZscJhHUBYXkWFUcYDHdSD4PTs7mJaOdae83JM/HlYcYLNo8xguLLVPflNe4nQh42ChlobHz6gtFDwKo2INDep/S3CVn0DFauPxP1aASZZRQvn4vOjNIu8nwBYsNaSi1as6EJTtH/K7KfLWszFYB0Q0kxmatrPQg4Vlk2ozr10yRdLeq42PQAsM42fR/1g1Ouz14dQ6iCPltszZlpoqaWCZwHntM80bRhlE2HBIdcUOLxkdCOCuhDfMfsYd8tEybQ8w9ksAPMKEgZPCXy8LEMq5Ra0+x5woMZ1hRWQiP9AxqHaCGumRYcWBJnqPcsOpMI6d3nOQKBStxAOKzSuyR8gJAS4dXetsb0uAOshGpRAaH7cjFCTblju761oLI8E9zYfYGVosljsaJRu6ybYvTPYB/LHvTZv80IJzTDJFuoB6u4X7tUJUlEEVbF5vdIId+BiiBt0BpYDYNCxzuR5h/8J/sTiD2R5YCxnl8sq1qqU2TMhaY83IA0lM+ptLfr5hiYL0aRpJ204Ylw1hCNEkMfSdWrNZJS95EoSaquMVFje8V0UdWJpkl2ojMcG8AVQPks/HzhSA1TpoQxPgsgY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(451199021)(38070700005)(54906003)(83380400001)(86362001)(478600001)(2616005)(76116006)(66899021)(186003)(66946007)(66556008)(66446008)(64756008)(66476007)(2906002)(6916009)(91956017)(4326008)(26005)(71200400001)(82960400001)(55236004)(6506007)(6512007)(316002)(41300700001)(107886003)(6486002)(8936002)(8676002)(5660300002)(966005)(36756003)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U0I4N20ybDI0Smo5bTZaRDMwVTZWV3BSa01OVWJtaTl2RENhTm1XdEMySWd5?=
 =?utf-8?B?SDlhalRKeXFIVkJUcW44Q01jZ2VnTVhRcjl0YU5MWUd1UjRMMVBMd2I0TFg4?=
 =?utf-8?B?VWZYeDhtU0V2THR6L09IMWczT0xIblR2eDB5SnFvdFdCeThZTURFbGxBdXM3?=
 =?utf-8?B?YUU4Z21odkxaaFU4YU1oVzR5N0Y5c3podUZxQTJxVjJzdGlwbkNnOWx6VmlS?=
 =?utf-8?B?RGt5VVZpb2tLcmJxS0h6eU9nbmcxWTJtTktLSTNsQW05QnhNbEpNNFRkSVQ1?=
 =?utf-8?B?YzFrMHp4Q1pZbW42cS85MFpzY3NYeDdhRjVENlpDcmFDc3J3eEU4YVh1cEhN?=
 =?utf-8?B?a0VkcTB5cWRGdnlDRmZ6UkJyYUEvVE5oeVd5djlqeHgvNzd1WWNuV1VidVBW?=
 =?utf-8?B?TWh0Nkw2VDcreUJnU2tYQlg1d21FNUc5dEFYTTA2dnQzS1A0bVpoRnArbVpr?=
 =?utf-8?B?djZJMlV3c3FPY21CQzcvRTBJc3VhRXpIUGdmT0tUMXNQYzBlZHQrTi9aR1R2?=
 =?utf-8?B?c1kvWkVPQ1FjMzlkbElFNmFIOEQ0RTdaNDdhSGZvNVhpL0d4bGdCc3haSFJv?=
 =?utf-8?B?K3pzSUhnWUpXTmhHcEdCcU5taUNKMW5GSXAycm1tMGhSRDlPQjBTVVRpckZa?=
 =?utf-8?B?Q1NCckZsQ0lQeWhPdTlyMWFIOVJGcnd6N3ZSYjc0cnErL01GdFF0ekJlWncx?=
 =?utf-8?B?ZFA4U2ZndUlFdk1scW9adGVlcnRLN0cxQm1UNDZwWEtCWHJ3UTh1clpMVmRp?=
 =?utf-8?B?UXdGa0lRMmZsUWRneDR0dEwwQXl3WmhYUE5jdjFYV2M3Q25ST0ZpbkJYQmZx?=
 =?utf-8?B?SXRCcEVhei8yU3JXbFlpcWdQV1VVL0Rua1RiV3ZYS0JmZkxmWXo2MlprZU1z?=
 =?utf-8?B?bmkrUTBZRTIwM0dFbVh3RnhJNHJBbUJobG9qNWEva296WjZzQnNETWw4cXpS?=
 =?utf-8?B?K1dvSUs2aDRWZ3lxQ21oRHpFS0lTUlRGZ3hYSUJQc0l6OFJIcGtnbHJVd0Nz?=
 =?utf-8?B?ajhMc0tEcXJhQy8wc2doSTN6TjVDdWZOb2RBZ05RT0FGd25VenJFNEFXNnRU?=
 =?utf-8?B?bnRVMTNkckJncHo1cFdqVmJ4dFZ4RmNJUVVZMFIwNE1wWW95WFpTS0J0eFpl?=
 =?utf-8?B?YkdsRVRUWVVzT0dwckFxNVhySCtMSkQybklqcnpGN05sTk45a1l0ZXVDRkdy?=
 =?utf-8?B?MWN1N0RFQVcvQnAva1BkRWhSbmR6OW9wSGw1cDlNdGNYTnUrZWphSmY4UDUx?=
 =?utf-8?B?ejVobE5EcFJ2bE9sbkhoeHNIUVRETG1YWWpBd2xQZkNHd21JYStrRW9ZOWRX?=
 =?utf-8?B?RDE0Z1NYYWt1a0JSdjR6cm1hV0hqSmNsMjNEWk1STEtOTE9BRXVTK3ZxeWJ2?=
 =?utf-8?B?RWlSOUV4dVQ2L09VSlFCZzhmNHZsSEd4RE9sbkg4Y2lRUEJNa3dLL3g2Q3kz?=
 =?utf-8?B?RVhxM3U3OStnTnBoUGpwc1ZMUHp2NkhhZSt6MitwOUxDYUlkMmY4bnVhNDl1?=
 =?utf-8?B?Q3JGdFkvcThZK2hIVXpNN3p3RUliend4dHgyczU2dW40ekw5bWVmU0Yxano1?=
 =?utf-8?B?ZjhsS21sL0Y3NmVKR3RaY1JXUVVjb3M3RlpWd1NYcEdVYkhRQzV6b3Q3V3BO?=
 =?utf-8?B?d3R0ajVncCtRRzJydTdGbGtwQ2pJaGkrbnYvbVZrWVpYb0dvL1hvYTljQlBw?=
 =?utf-8?B?djdZcEhhUVhyTUdqbVBicmE2TjBPSnlwZ1dlZmhXTTZqMFZGS2NMWkFHczJI?=
 =?utf-8?B?K2Q2ZkJsWG55MFQrT0hiQlovNGczblhFS0RLd2VWZTUvVWdrS1pzS3hwR0FR?=
 =?utf-8?B?bG1DRVdrZW9tTWFNKzJLRFVudDhHck5qZXp6SGFJSlJuV0NrSXh4SzB4ekVL?=
 =?utf-8?B?SmE0SFZRZmkrMEdxbHlodGh1eFN3NW4rM3U3NXdJekt6SkNZY1JLSWVTZzJt?=
 =?utf-8?B?RERFTzIvd1I0dE1HdVJpS0Z0WmFIeE5oMnNIOTNuWUI2YkFsWjZORFUrV3pw?=
 =?utf-8?B?cXFhcTY5djhYU3ZEbDBRL1lWR3l2NEVsb3dzaHBHVm9PNGlmY08yOUtkN1dr?=
 =?utf-8?B?OENGdWduNmNHSnpiSTRxSTdYdzJsRjdBR1RURmM2bW1tR3laczc3WFFnNkNz?=
 =?utf-8?B?ZjBtdGtKWU5HNHQzNTUwUnNiaWhTUU9zVEwxd3hSR0hCMTdIM3lWM2p3Q1la?=
 =?utf-8?B?a0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DD950304EB63541A8724532CFF83C8F@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b84655-d0a2-42da-e4fa-08db5b697a3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2023 08:41:18.3093
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7+6KxOE+9/hY1NDhoUf9uoI3t/gRZxSiDTQz4ALhdHppYjS/GA/Me9rlo1Dl2UEwZQbAfMY0JgYZp+viZJjYdwnS5OiBKK+uBwLBlFmlhNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB3987
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 08:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181629

SGVsbG8gUmljaGFyZCwNCg0KQ291bGQgeW91IHBsZWFzZSB0YWtlIGEgbG9vayBvbiB0aGUgbGF0
ZXN0IHJldmlzaW9uIGEgbWFrZSBhIGRlY2lzaW9uIHRoZXJlPw0KVGhlcmUgYXJlIHN0aWxsIGJ1
bmNoIG9mIHVuY2xlYXIgc3RhdGVtZW50cy4gU28gcGxlYXNlIG1ha2UgYSBmaW5hbCBkZXNpZ24g
YW5kDQp3ZSB3aWxsIHRyeSB0byBpbXBsZW1lbnQgaXQuDQoNClRoYW5rIHlvdSwNCkFuZHJlag0K
DQpPbiBNb24sIDIwMjMtMDUtMjIgYXQgMTA6NTcgKzAzMDAsIE1pa2tvIFJhcGVsaSB3cm90ZToN
Cj4gSGksDQo+IA0KPiBPbiBGcmksIE1heSAxOSwgMjAyMyBhdCAwMzoxMTo1N1BNICswMjAwLCBN
YXJ0YSBSeWJjenluc2thIHdyb3RlOg0KPiA+IEknbSBtaXNzaW5nIGEgc3RhdHVzIHRvIGNvdmVy
IHRoZSBzaXR1YXRpb24gd2hlbiB0aGUgTlZEIChvciBhbnkgb3RoZXINCj4gPiBkYXRhYmFzZSkg
aGFzIGFuIGluY29ycmVjdCBlbnRyeS4gV2UgaGF2ZSBxdWl0ZSBtYW55IG9mIHRob3NlLiBUaGlz
IG1pZ2h0DQo+ID4gYmUgYSB0ZW1wb3Jhcnkgc2l0dWF0aW9uLCBidXQgbm90IGFsd2F5cy4NCj4g
PiANCj4gPiBTUERYICh0aGUgMy4wIGRyYWZ0KSBoYXMgc29tZSBvdGhlciBwb3NzaWJsZSByZWFz
b25zDQo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3NwZHgvc3BkeC1zcGVjL2Jsb2IvdnVsbmVyYWJp
bGl0eS1wcm9maWxlL2NoYXB0ZXJzL3Byb2ZpbGUtdnVsbmVyYWJpbGl0aWVzLm1kDQo+ID4gV2hh
dCBsb29rcyBsaWtlIGludGVyZXN0aW5nIGlkZWFzIGFyZToNCj4gPiAqICJDYW4ndCBmaXgiIC8g
IldpbGwgbm90IGZpeCINCj4gPiAqICJOb3QgYXBwbGljYWJsZSIgKFNQRFggbGFuZ3VhZ2U6IElu
ZWZmZWN0aXZlKSB3aGVuIHRoZSBjb2RlIGlzIG5vdCB1c2VkDQo+ID4gKiAiSW52YWxpZCBtYXRj
aCIgKHRoaXMgaXMgb3VyIE5WRCBtaXNtYXRjaCBjYXNlKQ0KPiA+ICogIk1pdGlnYXRlZCIgbWVh
c3VyZXMgdGFrZW4gc28gdGhhdCBpdCBjYW5ub3QgYmUgZXhwbG9pdGVkDQo+ID4gKiAiV29ya2Fy
b3VuZGVkIg0KPiANCj4gVG8gbWUgdGhlIFNQRFggZGV0YWlscyBkb24ndCBzZWVtIHZlcnkgdXNh
YmxlIHdoZW4gYWN0dWFsbHkgbWFpbnRhaW5pbmcNCj4gYSBsaW51eCBkaXN0cm8gZm9yIGEgbG9u
ZyB0aW1lLiBBbnlvbmUgZnJvbSBtYWpvciBMaW51eCBkaXN0cm8NCj4gc3RhYmxlL3NlY3VyaXR5
IHRlYW1zIHBhcnRpY2lwYXRpbmcgaW4gdGhlIHdvcms/DQo+IA0KPiBTbyBJJ2QgcmF0aGVyIGNv
bXBhcmUgdG8gRGViaWFuIHNlY3VyaXR5IHRyYWNrZXIgQ1ZFIHN0YXR1cyBkYXRhIGFuZCBhc2sN
Cj4gd2hhdCBvdXIgTFRTIGFuZCBtYXN0ZXIgYnJhbmNoIG1haW50YWluZXJzIGFuZCB0aG9zZSBp
biB0aGUgY29tbXVuaXR5DQo+IHdobyBtYWludGFpbiB5b2N0byBiYXNlZCBTVyBzdGFja3MgbmVl
ZC4gRG8gdGhlIG1haW50YWluZXJzIHdhbnQgdG8gcmVhZA0KPiBTUERYIG91dHB1dCwgZm9yIGV4
YW1wbGU/IFdoYXQgY29tbW9uIHN0YXR1c2VzIGRvIHRoZSBtYWludGFpbmVycyB3YW50IHRvDQo+
IGVuY29kZSBmb3IgZWFjaCBDVkU/DQo+IA0KPiBEZWJpYW4gc2VjdXJpdHkgdHJhY2tlciBodHRw
czovL3NlY3VyaXR5LXRlYW0uZGViaWFuLm9yZy9zZWN1cml0eV90cmFja2VyLmh0bWwNCj4gc2hv
d3Mgc3RhdGVzOg0KPiANCj4gwqAqIHZ1bG5lcmFibGU6IGJpbmFyeSBwYWNrYWdlIHdpdGggc3Bl
Y2lmaWVkIHZlcnNpb24gaW4gdGhlaXIgZGlzdHJvDQo+IMKgwqAgdmVyc2lvbiBpcyB2dWxuZXJh
YmxlIHRvIHRoZSBpc3N1ZQ0KPiANCj4gwqAqIGZpeGVkOiBiaW5hcnkgcGFja2FnZSBpbiB0aGVp
ciBkaXN0cm8gdmVyc2lvbiBoYXMgZml4ZWQgdGhlIGlzc3VlDQo+IA0KPiDCoCogdW5kZXRlcm1p
bmVkOiBpdCBpcyBub3QgeWV0IGNsZWFyIGlmIHRoZSBpc3N1ZSBhZmZlY3RzIERlYmlhbiBhbmQN
Cj4gwqDCoCB0aGVpciB2ZXJzaW9uIG9mIHRoZSBwYWNrYWdlcw0KPiANCj4gQW5kICJ2dWxuZXJh
YmxlIiBoYXMgc3ViIHN0YXRlczoNCj4gDQo+IMKgKiBpZ25vcmVkOiB0aGUgaXNzdWUgZG9lcyBu
b3QgaW1wYWN0IERlYmlhbiBwYWNrYWdlcw0KPiANCj4gwqAqIHBvc3Rwb25lZDogbm8gc2VjdXJp
dHkgcGF0Y2ggdXBkYXRlcyB3aWxsIGJlIHByb3ZpZGVkLCBlLmcuIHN1Y2ggYQ0KPiDCoMKgIG1p
bm9yIGlzc3VlIHRoYXQgdXBkYXRlIHdpbGwgaGFwcGVuIGZvciBleGFtcGxlIHZpYSBub3JtYWwg
cGFja2FnZQ0KPiDCoMKgIHZlcnNpb24gdXBkYXRlcyB0byBuZXh0IHN0YWJsZSB2ZXJzaW9uDQo+
IA0KPiBUaGVyZSBhcmUgYSBsb3Qgb2YgYWRkaXRpb25hbCAic3RhbmRhcmRzIiBhbmQgc3ViIHN0
YXRlcyB3aGVuIGxvb2tpbmcgYXQNCj4gQ1ZFIGRhdGEgaW4gdGhlIHRyYWNrZXIgKGluZm8gbm90
IHB1YmxpYywgbm8gdXBzdHJlYW0gZml4IGF2YWlsYWJsZSwgbm90DQo+IHN1cHBvcnRlZCBjb25m
aWd1cmF0aW9uIGV0YyksIGJ1dCB0aG9zZSBtYWpvciBoaWdoIGxldmVsIHN0YXRlcyBhcmUgZW5v
dWdoLg0KPiBBbmQgdGhlbiB0aGVyZSBhcmUgc2VjdXJpdHkgcmVsZXZhbnQgYnVncyB3aXRob3V0
IENWRXMuDQo+IA0KPiBJJ3ZlIGJlZW4gaGFwcHkgd2l0aCAiVW5wYXRjaGVkIiwgIlBhdGNoZWQi
IGFuZCAiSWdub3JlZCIgc3RhdGVzIGZvcg0KPiBlYWNoIENWRSBkZXRlY3RlZCBieSBjdmUtY2hl
Y2suYmJjbGFzcy4gVGhlcmUgY291bGQgYmUgYSBmZXcgbW9yZSBzdWINCj4gc3RhdGVkIHRvICJJ
Z25vcmVkIiBhbmQgdGhlICJQYXRjaGVkIiBzdGF0ZSBzaG91bGQgYmV0dGVyIHJlZmxlY3QgcmVh
bGl0eSwNCj4gd2hpY2ggdGhpcyBwYXRjaCBzZXQgaGVscHMuIEJ1dCBJJ20gaGFwcHkgd2l0aCB0
aGF0Lg0KPiANCj4gSSdtIG5vdCBzbyBoYXBweSB3aXRoIHRoZSBTUERYIHN0YXRlcyBuYW1lcyBh
bmQgbWVhbmluZ3MuDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtTWlra28NCg0K

