Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F881C678D5
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 23:09:56 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.49])
 by mx.groups.io with SMTP id smtpd.web10.9330.1678230592110609487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 15:09:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ZEdDGs8n;
 spf=pass (domain: siemens.com, ip: 40.107.8.49, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvcsJSM3BCLay4ZKvL7kdyGN9GqJ4I1axzJCkACfSWaISuFR72ezEugbWj6lUtEIl2GjGvtKTJil3m/hkWyZ3JmOnqiRMLVhTd1u/TlTqXD+ggF6D1xzNRXx5tXL4T9FJauxAW5xCzp0WNOwQ14wsv838mbc0xrKqIeQl6eYdY2xWB33kC8k7gyjG3t6IVng4zWl3MIpVii6CZmSKlXWnc2iwCiEm+KouW8u1hObZT9BHGhhk26kacPoSNOT0jOZg9Rwb2lf/dR5JwFf1TiQvO+JX+x4XfHB92ZT4L1YrZa9QaQCa49jPf3rlVN1qmIjZheosG84HPdmcfjJI7M9pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dl4Dh3jOOmiyUiDDpJToGNvxYZbEpwTP2HpWw20FivI=;
 b=bbL1ffzB5+fnNQRHpR5erKtZiGm4Q+h6paczOD5SplbUMSG2S89T2IT/DbW2ZP8JyWBtSevcYpA3gXfVkn+Fp7ygjMOZA2PINcFw8ImwoPZWOlvIEGn4Does/h7f2RUSITwf1xf5gcZM9kdVnuWCo+a+tuu7rJ/VhCcUu6vCYyriz42apQF+ZsN4vjPQHxoH1Xj/gezJW0Suel7A6XZIqs4UPulz4+fI/qx382BjveZi9Dxt6kGgiXzyQNFSNEKKZvapOgEYe39QohrRvQKUwxLj+BPfHCx3x8TNN/cANRAxsiy76kOdT7+qlak9Pg8jzBQRnbtbmQzTP4BxpAtNpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dl4Dh3jOOmiyUiDDpJToGNvxYZbEpwTP2HpWw20FivI=;
 b=ZEdDGs8nQu19Xz7Vw/O5Atb+GFCZcAZNl8l0e56vkrXFMqEFaOXWXoWKXppBEiV1evYjnooygnzw4ooOuwxdma3MgUT01nJLrB+ABXBoH83zRBw4/xJumPMPVFWWNTUPrzkwGRbwr3r/anVMeSpLT40Qu32BLqtEEwO7rjBBWOm/U01juDONy7qkovEoBXYDMRnVKwM20T+i1BMdVZ4aISwcAcZsnyUoM0zrhZib7W39VwPvP6e7VoBXbl5cgGCGc43XKrsw5kAW2bgMOU2AolLUsgyZHt/8ZEhA+altWhfR9bDrvItrUbnQOqLDp87T9f7SG18UolswF0C0nwYPaA==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by PA4PR10MB5684.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:266::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.15; Tue, 7 Mar
 2023 23:09:48 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7b1d:c452:fc65:a676]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7b1d:c452:fc65:a676%4]) with mapi id 15.20.6178.016; Tue, 7 Mar 2023
 23:09:48 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
	"quaresma.jose@gmail.com" <quaresma.jose@gmail.com>
CC: "Valek, Andrej" <andrej.valek@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "mikko.rapeli@linaro.org"
	<mikko.rapeli@linaro.org>, "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"ricardo@foundries.io" <ricardo@foundries.io>
Subject: Re: [OE-core] [kirkstone] Google go CVEs
Thread-Topic: [OE-core] [kirkstone] Google go CVEs
Thread-Index: 
 AQHZUL6Jc9VVRVusOUuFBbQ2Uq517K7u3ROAgAApfoCAAAffgIAAJCgAgAAI34CAABs2AIAAEjaAgAAFFoCAAAkXgIAAAaOAgAB5oQA=
Date: Tue, 7 Mar 2023 23:09:47 +0000
Message-ID: <93428eec3bf18a7420c20fbdf1da4095174d5652.camel@siemens.com>
References: <ccf5bc6b01e8cb93f5357bd2eabcec32af5bfdb9.camel@siemens.com>
	 <CANNYZj-Ov6Qswejusp=7F7PJ2cBJ9k119uq5SmTUd5=0-fog1Q@mail.gmail.com>
	 <a5271b388e09d6338da258fb97e256e54958b0d1.camel@siemens.com>
	 <CANNYZj-0ESxC8=fT1JJZ2+4gZiHfXvceB3QsS_Ner7UYsNYw+g@mail.gmail.com>
	 <CANPvuRnky4k=Lb3WnarWXi8mbLX5CfDOxQxxgggZh6pec4bHTw@mail.gmail.com>
	 <ZAcq1Vp/h8ofNwl4@nuoska>
	 <CADkTA4M5Ew-oDMXZCwMuxjEnBKb+AahVDh4QmyOSo+cGb96TDQ@mail.gmail.com>
	 <CANPvuR=8NTvs0RT5uHbL_edWYcLHipLiE+dUU3di0Y+Pw-36-Q@mail.gmail.com>
	 <CADkTA4OvoBGyMjwVZ4M7JGAegcsJQExTNfvWnbB8LELh-pVa0g@mail.gmail.com>
	 <CANPvuRknYg2fyQ6S2oKT689EjV7Uk4ERDDA0QD2ZUBggRE7wcQ@mail.gmail.com>
	 <CADkTA4Ob0ms_OrOWaRzDBOXkuAajgwQXPa+jUkDnLAu7QRc8fA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4Ob0ms_OrOWaRzDBOXkuAajgwQXPa+jUkDnLAu7QRc8fA@mail.gmail.com>
Accept-Language: de-CH, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|PA4PR10MB5684:EE_
x-ms-office365-filtering-correlation-id: 56c9658f-6864-4e36-5323-08db1f610c2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 odAiHfdOkSh+Drc3uT8+kgf8GlJOtyONLQCx4TH57Fkc262L4LXZA42x75yjQDQ8HAG3DY6R3KBrJRHz/53PdZYjk3NZ4i+5J24zXz1UZIOx0Qbenn+KbKB2julDeZT2ytTPDL17PVYD4si3Z4t4e0hNiuBX4toAcfbPsyvD8f1RhBKSmqBGj+M/yziqTXWPK850L08xwpQ8sQFA+3hUKciMKrZh03Bu1Rex85uwMkCT+2C3SVRA2k1cQAt7/VtI31Ee+8QxZ9XmcxMpL8e4ykkid3XsZ0HBbQLKrPhFW0N/iHr/N4n3Xa3XVGj6zhu2d3b7sIdPte3Ud0w3X5HeGbQjCQrb3vWuwf88I2IRsLxhR7Ay0kBI6vYpolNHhAJtOQmcNh6+kQORKf76HiodXJdRJRCSGdp5AcF1+CZDajh9+5SVH2iezvDCx6MWXrMbQiTGszMWZvtDI0CyP4ZYPR6v70uPh3l5mVP/boe5u1i1xpjLFoR53/yzebWggm0m7sOKfCFFciVDJPNXsHj3EFueI0fOEW+donnxidPQj+gLH1D+BkQacioJKudHOvU7X6FxBvmKpMgobLOzBpGtUWs1/NJqWRwval4A6ssvAr98WEp85b5Fvx+jeySIofZRkWnpfdPAqSQmnUnBI65hmR96gK/o6MDp/w4VU5bTKS+QGHqzIqEliSi1A+d/KuLAUKXgeMrMPBXD8T4i1qQLn/eZY64sEr7cdHYVfApOBNc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199018)(110136005)(54906003)(83380400001)(86362001)(966005)(316002)(36756003)(6506007)(6486002)(66899018)(186003)(2906002)(76116006)(66476007)(66446008)(66946007)(41300700001)(71200400001)(8676002)(478600001)(6512007)(66556008)(64756008)(2616005)(82960400001)(8936002)(122000001)(91956017)(4326008)(5660300002)(38100700002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TkFqNlFYSFBIb3QzditRSit2VUVPalljTjFucGYvVEd2aEJTMlpNeENBOC9k?=
 =?utf-8?B?TFRqTnJnM3lYOGprdzJZZ09VRFkyaE9YM3FWbVpLd2xCek9iRFloRXk1d0JE?=
 =?utf-8?B?a3hYVWVqY3hEUHMzK0xaR1daeFpXOFozaEtDZGRSZWZGaDZpUGVmZm9wRmVF?=
 =?utf-8?B?R0ZpcE5qQnhnY2hGRWVIRUFTcEpCMVFEdnh4ZEJZZHZjRTZ1aGhMSGQ5ODhF?=
 =?utf-8?B?N09yTzUvVTdYMlpwQWExeUlTWktPeTA3TWlMWElrV0lxR25qaFlMTk9uNVVW?=
 =?utf-8?B?cG4rNSt6WnBaNTNmTXp4ckk0bXZFZUxrWlovTThwbjlndmJ6OEpRMnlicDNx?=
 =?utf-8?B?R3VxU29jMEZsbWhGVExHZ2N5aHoxc0N4M2M2YWMxTEt2c2wwbVJHaTVBcUxB?=
 =?utf-8?B?clZKdXlTREx3TlVMZWMyekFxdUpLZmpraEg1c2hNZXpVVWYySnloNlBySnlT?=
 =?utf-8?B?VWQwblB6cEVZeTJVZUlxREwrbXllaW9BZXdmcHd3TStDWXpLeGJTZytaaVhF?=
 =?utf-8?B?eDlTN29PbXVYS2Jzd3V3OU1ZVjFvSEswN083RGs0ZWx4Y1pVQUZ6L3hrVzAy?=
 =?utf-8?B?YUJ6Z0dCc0g4ZzJ2bG5tQWVjVi9IajZ0U3lGbnlGVXl1Vi9iaXdpbE9kU2E3?=
 =?utf-8?B?VXRTOVdMZ1RFenk1N3dpcHhJeENVMlNLMGluSC8vaUl2cm5HOS9yR1hkTlB6?=
 =?utf-8?B?VW5qaERLM2ozbk1sR3JUVkRmV2IxRVI1MGQ3NkRCNjVORFpiOVpxUWhrU0lW?=
 =?utf-8?B?YlMxRHEwMC9RQUxTREszdE90SWFXeXhrclpUMS9MZHJBOEtyeUpFaDZscDdW?=
 =?utf-8?B?d0dCS3hBM21aQjVaOXpQS2ZjRTB2MDVKOGVGZXhYUkp3YWpwbEg0YlYrZUV5?=
 =?utf-8?B?UVBweW0vd1E3T3hYSUVqUklEdGpuclBoUysxZFFGc3QxSzgwMEVoKzN3L0Rn?=
 =?utf-8?B?UFh6dFpVTHBzSk1jWFNSNm51WUdFemJQdDFBdUxxVFNnamVsamljRFdKMnBy?=
 =?utf-8?B?VkovVSswTFRBaDFUUjNCaHBEZ0FtWVFCU2V3MGVwMnBpNWZXWHI0T2FVYTlQ?=
 =?utf-8?B?WWlkYytES1pQTU9DUjBpNW1oc0M4NGZodHdjQVpIWit3allycjhjNXpTVG5y?=
 =?utf-8?B?UUEvcVM5cUR4N2htTmdycG1jOE8wUWVtWXNRWjhjb0xTKzZpMHJ4cHBEOXZa?=
 =?utf-8?B?ZlJwRWNlN0pCeE5uSmhQNW1CMW1VM3FrMENkMlZYV2ptdktzcDVIVGJ4UU5K?=
 =?utf-8?B?UlBtRHdZYXZBQlZxK0g2SEZRTXFSUE1MYTROVXFGaWhJYlRxbXc3cTl0aVFE?=
 =?utf-8?B?MGo4bVQvZFJsY093T0VOOUs2eG9XSzhEWGNjdDV6dWNDNTVvVTc2dVdpa2gv?=
 =?utf-8?B?WWo1OGoxRENlZ1JKcTlwMWJYdE4wVnFnYnVDWlZyZDNqNU9ocEtLcCtRekRO?=
 =?utf-8?B?aWpMcFRRVDlFTC8yOUlFMGNyWS9wUWwrRlhBWVl1RlhnRVF3Ry9YNW1VQWE2?=
 =?utf-8?B?dHAwOS9nR1JvK291WlJWYWpVMUZTSDhYKzFBVXRheW9uby9zeFdyQ1ZUMVFt?=
 =?utf-8?B?V3B4YlBvT2pERVdZQVVHK2ZscUgxbmFLREc2d21yNjNqQXJVUDF5cDhGeWNN?=
 =?utf-8?B?dlVGUmFvUlBUaldlcG04MGhlOElSTTFUQUlzeFpGa0gySnhlaVA5NGROWERo?=
 =?utf-8?B?djdyS1ByMHk4ZktBempLWllmNVI4andHWTBNS0hta2xIbEcwSlUzNEUxdGNU?=
 =?utf-8?B?aHBuMlk1SmUvK002ZzdKVUNSbitKQmVwa0lnM2ZqWW1FVjQwc0pOTVRhRGJy?=
 =?utf-8?B?ckpMMzJ2Q0NlZU13QzFTQ1dQalZzam5OT0orRnBxZ2FLMFlwZ2F5SGdoU2NO?=
 =?utf-8?B?SlVwRGdRMWxybVdvQW5qTmpRMWZkejBRY3VZTDR6NnU0eXJVZE9YN1RWdlAr?=
 =?utf-8?B?dWdyV2pKK1FLUnJGZHhJMXVGWG52dzQ4Q3AyR0JYN3hsWkFvSzY2bkZKU1Fo?=
 =?utf-8?B?ZDFCaTY4TXJUK2FjVWRHY2tkUXUxSFBnUnNjakRiV1hucDNDcUp6WklkVjRv?=
 =?utf-8?B?NmtjOHA5RDYxS3dkdXN3eXgyYk4wM2pGeFJycS81OERTZDRob1lDLzZFbHht?=
 =?utf-8?B?U1F5VTRsUjIzM1BSSUZ4SXJwWjY3MkRvRkxaYmg1YUxtbXpFbTJXWCs2Z0lh?=
 =?utf-8?B?L09hY0hZa1c5RUtkK0xOOXkveVI5SnVGTXpQUDZvY0grWGF2NlI2cjFCV1hw?=
 =?utf-8?B?UWQ0aU5mZUIrSEZVMXdSMVpvYjhRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F11D0DB744253A44A79BB19083B1EB13@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c9658f-6864-4e36-5323-08db1f610c2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2023 23:09:47.9552
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yl+VC2jU5UYnbPWdIbFqezbPOdhDDtg49lnMW/kTIfoq0qpoMhpUT7tXG5Pbgs25BEuXVRTgIPqDMITn15yMZYIe6PTMcm5hXknls3CnWBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5684
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 23:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178146

SGksDQoNCkZyb20gbXkgcGVyc3BlY3RpdmUsIHRoZSBjaGFsbGVuZ2UgKGFuZCBhbHNvIHRoZSBv
cmlnaW5hbCBxdWVzdGlvbiBvZg0KdGhpcyB0aHJlYWQpIGlzIHRoZSBzaG9ydCBsaWZlY3ljbGUg
b2YgdGhlIG5ld2VyIGxhbmd1YWdlIHN0YWNrcywNCm5hbWVseSBHb2xhbmcgYW5kIFJ1c3QuIFNl
Y3VyaXR5IHBhdGNoZXMgYXJlIG5vdCBwcm92aWRlZCBieSB0aGUgZ28NCmNvbW11bml0eSBmb3Ig
dGhlIGVudGlyZSBMVFMgcGVyaW9kIG9mIFlvY3RvLiBHb2xhbmcgcHJhY3RpY2VzIGFyZQ0KcGFy
dGlhbGx5IGF0IG9kZHMgd2l0aCB0aGUgaWRlYSBvZiBhIExUUyBkaXN0cm8uIEl0J3Mgbm90IG9u
bHkgYWJvdXQNCkRvY2tlciBvciBvdGhlciBjb21wb25lbnRzLCBpdCdzIGFsc28gYWJvdXQgdGhl
IGdvIHRvb2wtY2hhaW4gaXRzZWxmDQp3aGljaCBwcm92aWRlcyBhIH41ME1CIGxpYnJhcnkgKHdp
dGggdnVsbmFyYWJpbGl0aWVzKSB3aGljaCBnZXRzIGxpbmtlZA0KKHVzdWFsbHkgc3RhdGljYWxs
eSBhbmQgc3RyaXBwZWQpIGJ5IGFsbCBnbyBhcHBsaWNhdGlvbnMuDQoNCldoZW4gd2Ugd2VyZSBz
dGlsbCBvbiB0aGUgRHVuZmVsbCBicmFuY2gsIHdlIGhhZCB0cmllZCB0byBzb2x2ZSB0aGUNCmlz
c3VlIHdpdGggdGhlIG1peGluIHJlcG8gZnJvbQ0KaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9y
Zy9tZXRhLWx0cy1taXhpbnMvcmVmcy8uIEJ1dCBpdCBkaWRuJ3QNCnJlYWxseSB3b3JrIHdlbGwu
IFRoZSBtaXhpbiBsYXllciBicmluZ3MgdGhlIGxhdGVzdCBnbyBzdGFjayBmcm9tIHBva3kNCm1h
c3RlciBiYWNrIHRvIHBva3kgZHVuZmVsbC4gU2luY2UgdGhlcmUgYXJlIG5vIGdvIHJlY2lwZXMg
aW4gcG9reSBzbw0KZmFyLCB0aGlzIHdvcmtzIHJlbGF0aXZlbHkgZWFzaWx5LiBCdXQgYWRkaW5n
IHRoaXMgbGF5ZXIgbW9yZSBvciBsZXNzDQpicmVha3MgYWxsIHJlY2lwZXMgZnJvbSBtZXRhLXZp
cnR1YWxpemF0aW9uLiBBIG1peGluIGxheWVyIHdoaWNoDQp1cGRhdGVzIHRoZSBtYWluIGdvIHRv
b2wtY2hhaW4gZG9lcyBub3QgbG9vayBsaWtlIGEgZ2VuZXJpYyBhbmQgZWFzeQ0KbWFpbnRhaW5h
YmxlIGFwcHJvYWNoLg0KDQpPbiB0aGUgb3RoZXIgaGFuZCwgR29sYW5nIGFuZCBSdXN0IGFyZSBt
dWNoIG1vcmUgc2VsZi1jb250YWluZWQgdGhhbg0Kb3RoZXIgbGFuZ3VhZ2Ugc3RhY2tzLCB3aGlj
aCBpbiB0dXJuIG1ha2VzIGl0IHJlbGF0aXZlbHkgZWFzeSB0bw0KaW5zdGFsbCBtb3JlIHRoYW4g
b25lIEdvbGFuZyB2ZXJzaW9uIGluIHBhcmFsbGVsIG9uIGEgaG9zdCBhbmQgdG8gdXNlDQpvbmUg
b3IgdGhlIG90aGVyIEdvbGFuZyB2ZXJzaW9uIGRlcGVuZGluZyBvbiB0aGUgc29mdHdhcmUgdG8g
YmUNCmNvbXBpbGVkLiBUaGUgZGV2ZWxvcG1lbnQgYXBwcm9hY2hlcyBvZiBtb3N0IGdvLWJhc2Vk
IHNvZnR3YXJlDQpjb21wb25lbnRzIGFyZSBhbHNvIGJhc2VkIG9uIHRoaXMgYXNzdW1wdGlvbi4g
RG9ja2VyIDIxLCBmb3IgZXhhbXBsZSwNCmhhZCByZXF1aXJlZCBnbyAxLjE3IGFuZCB0aGVuIHN3
aXRjaGVkIHRvIGdvIDEuMTguIEF0IGxlYXN0IG15DQpjb25jbHVzaW9uIHdhcyB0aGF0IHRoZSBz
d2l0Y2ggdG8gZ29sYW5nIDEuMTggbXVzdCBiZSByZXZlcnRlZCB0byBhbGxvdw0KY29tcGlsaW5n
IHRoZSBsYXRlc3QgRG9ja2VyIDIxIHdpdGggZ29sYW5nIDEuMTcgZnJvbSBwb2t5LiBTZWUNCmh0
dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvbWV0YS12aXJ0dWFsaXphdGlvbi9jb21taXQvP2g9
a2lya3N0b25lJmlkPTkyNzUzNzEwOGJjZjJiOTg4NTk1MTJjZTNlYWU1OWE3MzQzOTk5NGQNCi4g
VGhpcyBtZWFucyB0aGF0IGFzIGxvbmcgYXMgdGhlcmUgaXMgb25seSBvbmUgZ28gdmVyc2lvbiBh
dmFpbGFibGUNCndpdGggcG9reSwgdXBkYXRpbmcgb3IgbWFpbnRhaW5pbmcgbXVsdGlwbGUgdmVy
c2lvbiBvZiBnbyBiYXNlZCByZWNpcGVzDQppcyBvbmx5IHBvc3NpYmxlIGZvciBzb21lIHJlY2lw
ZXMgYW5kIGNvbWVzIHdpdGggYWRkaXRpb25hbCBlZmZvcnQgcGVyDQpyZWNpcGUuDQoNCk15IGNv
bmNsdXNpb24gc28gZmFyIGlzIHRoYXQgdGhlIG1vc3QgZ2VuZXJpYyBhbmQgcHJvYmFibHkgYWxz
byB0aGUNCm1vc3Qgc3RyYWlnaHQgZm9yd2FyZCBhcHByb2FjaCB3b3VsZCBiZSB0byBzdXBwb3J0
IG1vcmUgdGhhbiBvbmUgZ28NCihhbmQgcHJvYmFibHkgYWxzbyBydXN0KSB2ZXJzaW9uIGZvciB0
aGUgTFRTIGJyYW5jaGVzLiBJZiByZWNpcGVzIGNvdWxkDQpjaG9vc2UgdGhlIGdvLW5hdGl2ZSB2
ZXJzaW9uIGZvciBleGFtcGxlIG1ldGEtdmlydHVhbGl6YXRpb24gY291bGQNCm9mZmVyIGUuZy4g
RG9ja2VyIDIxIHdpdGjCoERFUEVORFMgKz0gImdvLW5hdGl2ZSIgYW5kIGFsc28gRG9ja2VyIDIz
DQp3aXRoIERFUEVORFMgKz0gImdvLTEtMTktbmF0aXZlIi4gUGxlYXNlIG5vdGUgdGhhdCBJJ20g
dGhpbmtpbmcgYWJvdXQNCmRpZmZlcmVudCBnby1uYXRpdmUgcmVjaXBlcyB3aXRoIHRoZSBtYWpv
ciB2ZXJzaW9uIG9mIGdvIGluIHRoZSByZWNpcGUNCm5hbWUgbm90IGFib3V0IGRpZmZlcmVudCBn
by1uYXRpdmUgcmVjaXBlIHZlcnNpb25zLiBUaGlzIHdvdWxkIGFsbG93IHRvDQptYWtlIHRoZW0g
Y29uY3VyZW50bHkgYXZhaWxhYmxlLiBBZGRpdGlvbmFsIGdvIHZlcnNpb25zIGNvdWxkIGJlDQpw
cm92aWRlZCBieSBwb2t5IG9yIGJ5IGEgbWl4aW4gbGF5ZXIuDQoNClRoaXMgYXBwcm9hY2ggd291
bGQgbWFrZSBpdCBwb3NzaWJsZSB0byBrZWVwIGdvIHJlY2lwZXMgbW9yZSB1cC10by1kYXRlDQph
bmQgdGh1cyBhbHNvIGZpeCBzZWN1cml0eSB2dWxuZXJhYmlsaXRpZXMgd2l0aG91dCBoYXZpbmcg
dG8gYmFja3BvcnQNCm1hbnkgcGF0Y2hlcyB0byBtYW55IGdvLWRlcGVuZGVudCByZWNpcGVzLiBU
aGlzIHdvdWxkIHByb2JhYmx5IGJlIGlkZWFsDQpmb3IgbWV0YS12aXJ0dWFsaXphdGlvbiAoZXNw
ZWNpYWxseSBpZiBtdWx0aXBsZSB2ZXJzaW9ucyBzaG91bGQgYmUNCnN1cHBvcnRlZCBmb3IgY2Vy
dGFpbiByZWNpcGVzKSBhcyB3ZWxsIGFzIGZvciBtYW55IHByYWN0aWNhbCBzY2VuYXJpb3MuDQoN
CkJ1dCBhdCBsZWFzdCBpbiB0aGUgZmlyc3QgcGxhY2UgaXQgd291bGQgbm90IGhlbHAgdG8gaW1w
cm92ZSB0aGUNCnNpdHVhdGlvbiBvZiBvcGVuIENWRXMgaW4gdXBzdHJlYW0gdW5tYWludGFpbmVk
IGdvIHRvb2wtY2hhaW5zIHdoaWNoDQphcmUgc3RpbGwgdXNlZCBieSBwb2t5IExUUy7CoEJhY2tw
b3J0ZWQgcGF0Y2hlcyB3b3VsZCBzdGlsbCBiZSBuZWVkZWQgdG8NCmtlZXAgcG9reSBpdHNlbGYg
c2VjdXJlIGFuZCBnZXQgbmljZSBDVkUgbWV0cmljcyBmb3IgcG9reSB3b3JsZCBidWlsZHMNCnVu
dGlsIG9sZGVyIHRvb2wtY2hhaW5zIHdvdWxkIGJlIHJlcGxhY2VkIG9yIGF0IGxlYXN0IHNvbWVo
b3cNCmRlcHJlY2F0ZWQgb24gdGhlIExUUyBicmFuY2hlcy4NCg0KUmVnYXJkcyBBZHJpYW4NCg==

