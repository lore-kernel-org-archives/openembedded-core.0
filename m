Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16172C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 17:24:38 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.77])
 by mx.groups.io with SMTP id smtpd.web11.4048.1706289876924516457
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 09:24:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=vVC5IilI;
 spf=pass (domain: infinera.com, ip: 40.107.100.77, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGlctS+p+Jm4OREkKOko8mIsfNVJBGuVJahJY2PPdmsOvPkGfOePiIxCRZiXx4BGtjFJ/u8+XCw2V2m4RBhNbYb2sJxqV6ATU4tFxPDDznwZIu9G70RpSsWKYsaXqf/TKH66RJ78iEG2ZZPXIiWFyt9szPsw+cmmTDHP3rFUR5Yd0Psl7IXHs6p4q/JsVspo5pSfvN0nE7j8mLw7SV/0mdgTIRxuHGX6WHMTzYc5iM6UQ6vULL2qPdsR9Mw7O/LCRPxD6+Bpzrk5jWQ0k+Yg7F1RtWkHmjRK0SOIDESVvDbOdPRPYyFgP3M+pdbVatc1sbRaRs2k+LfJ4QjGLiSSxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSaRfC+ADqSlAzK4b+nAgCdbS521a8R0KEOIIIEBXPg=;
 b=MnGUpyxRhB5yKbGR0LxMGUrXC0ycQIUPG3fUnwqO2pmRDwmjfr8Dg1E82i+tzHWo/hgUx8PPJg3fBk5nmMxqvEl5Wr6O343E67h9gkCxBr8it6Hbh6d8rniwQekIYsCs8s7hn/uc1ONaopgpUBjJCeQR1Hj6P95VFYlJJWmNfS2uhdSyNCrBgyFK+0EYe9vtcsRAAsGpxr1nO6SYM6lHb4I8+pHFUq0fsCRVKaXisuYEFaojqX6aK5ohvZAWOUN0JRZdj35oL5JRZDGBITQAZnOHpimJd+AtIvihyzICE+Myt8opo01gEOLwO8J2NVKNXzVr03RpZWEnnphemXKeWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSaRfC+ADqSlAzK4b+nAgCdbS521a8R0KEOIIIEBXPg=;
 b=vVC5IilI1t6VcelmG1v/BXETooHeAicX/s2TRoGGwvC6DfeNjfsW/64g/mkffJIWBmXtqbKque6O+6Rcg9l9CMlCDp2tL1McjzV9muLDBJpJYYN+d42OkfEqT6WzEW3dRmpVc4CvdFlk+n2roAtaqmS1hvKPXDxtYmt9OnVnmszNSn962DzVy1RjthQs72O9sdRbADH1559IYD2Y19zXodnAqvJvfteHNRjR3eLeIATl6LwkyWCMBHNkFcgvtlybeEyE7Z2kZURCx8h8WRBriYBkX0ykzX9vzx7vEhFwti5t1CRGoXdz12ZQ1wUFrJi/V5qFkz+n5a1Q/2LcKGGU2g==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by CH3PR10MB6739.namprd10.prod.outlook.com (2603:10b6:610:147::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Fri, 26 Jan
 2024 17:24:32 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea%7]) with mapi id 15.20.7228.022; Fri, 26 Jan 2024
 17:24:32 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "mikko.rapeli@linaro.org" <mikko.rapeli@linaro.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
Subject: Re: [OE-core] oe-selftest
 reproducible.ReproducibleTests.test_reproducible_builds appears to hardcode
 important tunable params
Thread-Topic: [OE-core] oe-selftest
 reproducible.ReproducibleTests.test_reproducible_builds appears to hardcode
 important tunable params
Thread-Index: 
 AQHaUEgkMNzCIETAnkmJ7AygmSs1ubDsAvKAgAARooCAAANfgIAACJaAgAAEBQCAADPtgA==
Date: Fri, 26 Jan 2024 17:24:32 +0000
Message-ID: <30c770706c96b78c0bbdb8a4afab631b86dbb871.camel@infinera.com>
References: <f2b33f50e7f11903a1b16f9a2f814134da203223.camel@infinera.com>
	 <CANNYZj9Hy670NNEm_vTf8drPuhBWCGtjGbfVvgcnNq_+xgsy5w@mail.gmail.com>
	 <6dc1b2effd68945b83870b24669f9a86eba64515.camel@infinera.com>
	 <CANNYZj-rVN+CNCG6x4VYoPZTcCYwMnhKXzo7kT7zpN9HNvJ7zg@mail.gmail.com>
	 <1f9e50e96714b8ed49f2e1b62ef769a6d4a32edb.camel@infinera.com>
	 <ZbO_QLpPEv502Ix1@nuoska>
In-Reply-To: <ZbO_QLpPEv502Ix1@nuoska>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.3 
autocrypt: addr=joakim.tjernlund@infinera.com; prefer-encrypt=mutual;
 keydata=mQENBFp0f28BCADPn4XzN2HEzkY4BZKE6/T/S4M/Qjlf01K6gmECJZi5LQgOt0jOUAdvsXVd8yKYeqCq+eWvlfrLU9OXPGoCqwj95P2YjMsttqaPBEAnf4XyBs67Snz2wHyBDONoRxGoyq2Ondy+TPicWEm0mh404h9EzKxRNxwrRyKhsjWoVeaucuybAiGbJvqQj0CLmuMCl4PUBYDmXFzt3yx0g54z8E9/8ON+z0J7yZbA0aftZAjFLv6nn0Th/2dpD8d3vWtkJw4yBjLX2KFvlzJfQqkd6RI4Cn1OP9sguXDob123dMiMk/5XbjXz+0C21QFxejxt3HGisvKes+8swplyni7KdiDtABEBAAG0MEpvYWtpbSBUamVybmx1bmQgPGpvYWtpbS50amVybmx1bmRAaW5maW5lcmEuY29tPokBVAQTAQgAPhYhBFtMG/jmfqy7x0aBp4VMQ6CbDpcaBQJadH9vAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEIVMQ6CbDpcasFAH/j64dpHpjY55tVoUg5yK8hcmxS/buKQQP9H3e2DdHeYrK0qeQ97AXiWTh63UvzvEXchiKjua6kYhUUkDObaltmwkKgPv0qb9lP6yfFBzvllriS6LrdIMCOLgtnQW2x28m5mC1hYT08jlqEXluYDoj2dTll9HGMsqn0JkhRjBsuzTXq8VyJjjnNLpzsAlTOGEQoAi7SqtDHs9PSNyOAKH5jRjATdNbPAsTKuI1veJf7Zzyc98yG0ya43Hqal1scoa+9GJZXNQPRaMVkyxKGbEEncdtnQl9e/DUMH4SUQ5vbM/+U4WvkX5Cvc+KwI6JAm1PhrAaVHSkDNAU5LqUqEbbHY=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|CH3PR10MB6739:EE_
x-ms-office365-filtering-correlation-id: e2ddab14-db42-4827-cb26-08dc1e93a903
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 auHVgtGlXRbzRRDcupta3EmmZJVMCZpEc/sL5j3Eal1gg+hD/+fEsAOsGtuWsLipRmy55GAy8v0S939xZt2Qi08GfKOednAl+tU+5XDdOSmxPZQZMM+MhwIskdMRscL64FcqRPjMl1XLaxemZAt86fS4x4DCZmd4kUH8lT7mC5OAAQmg9b+FSrcjgVQdN+g29FS2D/2NjQiYgtjBxbc0Fr1T6wAFTI2w/Dm2iZy74CHnr7/dPfSAhelosfkYs9q0ZWf9icIB+zglcO1Xs0d2+8i2ttEqZqjYXsFpbucszYUoiKgeCFREH03xd7MErcQyHiPKkvTxAO/Z0LjT2EJWzHpRiwtnTkwisMc2tcQsqYJ6/vvVnP6tKyNHfmSfQs4DyPJO0EY94oDov+z+dMNkF67Pjo+8MOGZEe0qTW2YT+N44E4xZlibv1KJRElh1VYCGz9Vw/UL8Vd6NuEy5qrXChsI5IuchvImHoL87NPbz4QHI320TAPhETA+ompC6AKIPREuXgIzzcnLfTapEL4U9W5vf3zC9L3J1xCTte7MJReaEmlW2gyMYIp4B2zq65Aggh1AuqCK2s1enStCE+W8K7439/Zy4ryhflK21LgMM7tvJv1BG6LCoM4oRug4/f3G
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(136003)(346002)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(122000001)(38100700002)(38070700009)(36756003)(54906003)(64756008)(8936002)(316002)(66946007)(66446008)(66556008)(76116006)(71200400001)(8676002)(6916009)(91956017)(2616005)(4326008)(6506007)(6512007)(5660300002)(2906002)(66899024)(86362001)(66476007)(478600001)(6486002)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dzdFcndyYk1MWEVaU25yRldoWWZVQnFwZEp1SmNGejZoWHhWeGJJNTBCN2pD?=
 =?utf-8?B?NVFTbDJzNlV2QlZ4bG1BcER1aVlHaUNWOSt6U3p1YW4ySXZaZTdQSkgzRXRF?=
 =?utf-8?B?dnMxbCtmZHBUN05MeEZXd1dQckdEdDRhM2owV3Z0TkxKWjNpWjU4KzdDR1dm?=
 =?utf-8?B?NXhEbUtFRmt4TFpvdWtIV21ocWJwTis3WW1jKzhiT1BJbCtISUFxWSsxQzVw?=
 =?utf-8?B?VGE0NGVUS0xhRmx5T0pXVUtTMEZTSmk3SU5SQU0zeUU3U29BRzNJT1BVdVcv?=
 =?utf-8?B?VnVMckltdlVldW5YcnpRSjhrdlRuRi9FSFhLMm5xcVhUTzl2U2pJMXN5WlFo?=
 =?utf-8?B?TUR5Y1NVMVFJNzNHWE5DM3Y5OWZRMHdGQUJOSkpwQVZjcmRFM3hZWUtwZmo2?=
 =?utf-8?B?RGIySHoza2FyOFNzRm9ENThiQ0V0RXF1NjRaWTJGTlJBMHNadm9ZbStUdzM3?=
 =?utf-8?B?RU5ISThCL1U2NDRJTk5CdWlFWjhTekFHa2xWcmh1SW0wZG8xcDk0OUNlanFs?=
 =?utf-8?B?MzJvcndOM1hzaE5WOHdCZU9xZ1VDSTBndmxOV0VHTXl4a2JxUVB5VUxBbHdu?=
 =?utf-8?B?b0t0c1B6SFEzNUNMeVNUeDZ6eDdvbHRPckoreEIxWkQzb1RxSVpla2Q0Y3Jj?=
 =?utf-8?B?dXRRamlpaVpVK2JLQ0xNN1ArR1Z6T2VPNjcrd0RCTWdzZ2oxTW9Oa1hhY3o1?=
 =?utf-8?B?ZUxiSDZZM2Q0SVJla2xaaVllcDVQbG1NZ1p4VHV2L3oxVEJ6ZGY2UUhGVmJm?=
 =?utf-8?B?eVBtb05jM0ZaNmhlT0NZREcyMFVQQ29aQ1Z2TCtxQlFxa0ZhNVNyNDJYaytl?=
 =?utf-8?B?TGRoUWYxRUR4TUo5ZW9jYitPdVQ4WUU3RFZxekM1aFNmQWVGQ1ZKVkE0ekZM?=
 =?utf-8?B?NVUxYkJzUG5tYjdLT0ZXdUZGVXJRQ3FxNGxIRE5FR3VESEhKQkJLRlhqTld0?=
 =?utf-8?B?KzV1TmZjTjRFSVVwc0dtZXZScFJJa0VsdzFRTVVobHpYdGZvbEYxcEZTeEJq?=
 =?utf-8?B?dXZvaU5yelFySVlaV0x0c2hVWUVDMVcvSmZkY2VPRDNLSGpxc2F6N0NqZjVZ?=
 =?utf-8?B?Ukh3cWdIRjl6aHROMkRqdm84VWlSVEprVzUzOFFMZkk5VmJjNlErbmdaMkJV?=
 =?utf-8?B?YnJlbFlneDJSaVVrMGc5bTd6SzJQdGxIT0pvSE80MkVISnRYY1lWVVRud1hI?=
 =?utf-8?B?UXJIVWdkT2ZRTkN0Y25Pckk2a1JVVkN1NFljUFVSWVdobXNJbzNOUkdhQ2FN?=
 =?utf-8?B?Q1pBQzFBTDlacG5jWHVsMUVzbmtEYi82YUkxNkNKWHBIdjAxeDlPSUtJWUVJ?=
 =?utf-8?B?c3dyUnBNb2NyTFZFTVpIMXIyUW9RbTh1WC9uQzlSU2k2THk1VnJsaUErSEJL?=
 =?utf-8?B?bm5vN2RmbVJyRG5TYmhZTG03QWZaeXlBY09ZbllhZTk0QlgwRlZhc3hReGsz?=
 =?utf-8?B?OVBDMGpYVzJ6YUZrZGcwUzVYcm1EVElOK25kM2lrN0g3TVZrSXZVa0lPRXVU?=
 =?utf-8?B?eDkrbSs5Q2FVWWF6MHcrdnR3WncvcEI4REFYQnZJWUpRZEFsRDVWUGpVaVhh?=
 =?utf-8?B?anVGWGFmRG5SL1NER1JhaU5XYU5XS1Z1SG5HNE5qTHlPRU5yMVpSWVBQSGp5?=
 =?utf-8?B?dHUrVTlFMmZ5cVBJZ2sxa1REbzhCS1RzUFkzMVVRSzBQaGVkVDRSVGQ0RGtX?=
 =?utf-8?B?dVlWMG1OM1picllLdmtuQUVSRXhieEUxdWVpMWhXUVNteGd0L0ppOHJZSTZ4?=
 =?utf-8?B?TWFlWm1OaHpWbHRqdUQ0UkVPQlI5aGxvRGV4V3BFazIxOWd4MTVTSEdQSWo3?=
 =?utf-8?B?eGVNdDBwdk05UWFtV0NMRVJLMlZlaVlLdGJDOEV5T1hvMmlya3BSbGlEenla?=
 =?utf-8?B?d09VaDc5dWRBOFVXWVVFdmIySjgyaEJNcmlZNjRZYzVHZzllOHEwWEFDL3c2?=
 =?utf-8?B?ZHRJdzIzSXRTMUdwajU4YWltR29KbElSTnBkMmxmMnRNeEh1ZHViYjhHYWZG?=
 =?utf-8?B?OCtudysvaGlVM3J0MHpGN05zeS9WZk9SNG1GUjFITU5UWFhGRUg5K2V2NENu?=
 =?utf-8?B?SEJWLzNVZFBXOHd5WjZOb29GQnM4N2ZJd0FWZE1EM0xBQnFNVWgyS2diaXVa?=
 =?utf-8?B?RGxndVJIZUpabDh0Z2ZoVHBxSWMzYVA2djBnZ2lraVhBNkIwNFQyL3ora0NR?=
 =?utf-8?Q?7H0kCkbAldpxD8UtMraFXG5pFoNT+sgHZVNXWi4TAY2b?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FBCB5AE2C128C4FAA14771DD67C1358@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ddab14-db42-4827-cb26-08dc1e93a903
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2024 17:24:32.4313
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ENVgB57pEQdgDKa2oD+7fZMHZKBK7oeT7XKNMlx/9/87nCq++hA5IRfsGKm0WedGlB3d+0HSBlfI7mwMI8MS2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6739
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 17:24:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194399

T24gRnJpLCAyMDI0LTAxLTI2IGF0IDE2OjE4ICswMjAwLCBNaWtrbyBSYXBlbGkgd3JvdGU6DQo+
IEhpLA0KPiANCj4gT24gRnJpLCBKYW4gMjYsIDIwMjQgYXQgMDI6MDQ6MThQTSArMDAwMCwgSm9h
a2ltIFRqZXJubHVuZCB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBPbiBG
cmksIDIwMjQtMDEtMjYgYXQgMTQ6MzMgKzAxMDAsIEFsZXhhbmRlciBLYW5hdmluIHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+ID4gT24gRnJpLCAyNiBKYW4gMjAyNCBhdCAx
NDoyMSwgSm9ha2ltIFRqZXJubHVuZA0KPiA+ID4gPEpvYWtpbS5UamVybmx1bmRAaW5maW5lcmEu
Y29tPiB3cm90ZToNCj4gPiA+ID4gSSB3aWxsIHRyeSB3b3JrYXJvdW5kIHRoZXNlIHNvbWVob3cg
YnV0IHdpbGwgbm90IGdvIHNvIGZhciBhcyBjcmVhdGluZyBhIG5ldyBNQUNISU5FIGp1c3QgdG8N
Cj4gPiA+ID4gcnVuIHRoZXNlIHRlc3RzLg0KPiA+ID4gDQo+ID4gPiBXaHkgd291bGQgeW91IG5l
ZWQgYSBuZXcgbWFjaGluZT8gWW91IG9ubHkgbmVlZCBhIG5ldyBjb25maWd1cmF0aW9uDQo+ID4g
PiB0ZW1wbGF0ZSBpbiBhZGRpdGlvbiB0byBleGlzdGluZyBvbmUgKGUuZy4NCj4gPiA+IGNvbmYv
dGVtcGxhdGVzL3JlcHJvLXRlc3QvbG9jYWwuY29uZi5zYW1wbGUgYW5kIGJibGF5ZXIuY29uZi5z
YW1wbGUpLg0KPiA+ID4gVGhlbiBpbml0aWFsaXplIHRoZSBidWlsZCB3aXRoIFRFTVBMQVRFQ09O
RiBwb2ludGluZyB0byB0aGF0Lg0KPiA+IA0KPiA+IEFoLCB0aGVyZSBpcyBhbiBpZGVhLiBCdXQg
dGhpcyB3aWxsIHN0aWxsIGNoYW5nZSB0aGUgb3JpZ2luYWwgbWFjaGluZSBzbyBvbmUgY2Fubm90
IHN3aXRjaA0KPiA+IGJldHdlZW4gbm9ybWFsIGJ1aWxkcyBhbmQgcmVwcm8gYnVpbGRzIGluIGhl
IHNhbWUgdHJlZS4NCj4gDQo+IEZXSVcsIEkgcmFuIGludG8gdGhlIHNhbWUgaXNzdWVzLiBNYW55
IHNlbGZ0ZXN0cyBhbHNvIGhhdmUgZGVwZW5kZW5jaWVzIHdoaWNoIG9ubHkgd29yaw0KPiBvbiBw
dXJlIHBva3kgZGlzdHJvLCBtYWNoaW5lIGFuZCBidWlsZCBjb25maWdzLiBUaGUgZGVwZW5kZW5j
aWVzIHRvIHZhcmlvdXMgZmVhdHVyZXMNCj4gd2hpY2ggYnJlYWsgdGVzdHMgYXJlIG5vdCBjbGVh
cmx5IG1hcmtlZCBpbnNpZGUgdGhlIHRlc3RzLg0KPiANCj4gQXQgbGVhc3Qgd2l0aCByZXBybyB0
ZXN0IGl0IGlzIG5vdyBwb3NzaWJsZSB0byBkZWZpbmUgZGlmZmVyZW50IGltYWdlIGFuZCByZWNp
cGUNCj4gYnVpbGQgdGFyZ2V0cyBpbnN0ZWFkIG9mIHdvcmxkIGJ1aWxkcyBub3cgYnV0IHNhZGx5
IHRoZXNlIHRlc3RzIGNhbiBub3QgYmUgcnVuIG9uDQo+IHJlYWwgcHJvZHVjdCBtYWNoaW5lIGNv
bmZpZ3VyYXRpb25zIGFuZCBuZWVkIGEgdmFuaWxsYSBwb2t5IG1hY2hpbmUgYW5kL29yIGRpc3Ry
bw0KPiBjb25maWdzLiBJIGd1ZXNzIHBhdGNoZXMgd2VsY29tZSBidXQgbm90IHN1cmUgaW50byB3
aGljaCBkaXJlY3Rpb24uLi4NCg0KVGVzdGluZyB0aGlzIEFUTToNCklOSEVSSVQgKz0gIiR7QGJi
LnV0aWxzLmNvbnRhaW5zKCdCQkxBWUVSUycsICdtZXRhLXNlbGZ0ZXN0JywgJ2J1aWxkaGlzdG9y
eScsICcnLCBkKX0iDQpTQU5JVFlfVEVTVEVEX0RJU1RST1MgPSAiJHtAYmIudXRpbHMuY29udGFp
bnMoJ0JCTEFZRVJTJywgJ21ldGEtc2VsZnRlc3QnLCAnZ2VudG9vLSogXG4nLCAnJywgZCl9Ig0K
DQpJbml0aWFsIHRlc3RzIHNlZW1zIE9LLiBOZWVkIHRvIG1ha2UgU0FOSVRZX1RFU1RFRF9ESVNU
Uk9TIG1vcmUgZ2VuZXJpYyB0aG91Z2guDQoNCiBKb2NrZQ0K

