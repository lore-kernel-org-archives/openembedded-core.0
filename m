Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94923CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 18:00:24 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (NAM02-BN1-obe.outbound.protection.outlook.com [40.107.212.59])
 by mx.groups.io with SMTP id smtpd.web11.66.1697652016747122404
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 11:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=Y3T4IOmF;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.212.59, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPYguKVmLjFdtFJ6Gg5Gm1xs5kQjD6oFrnenxnv6tX2fowgJL1X1JU4tvmYXwgs2HGEjGEjk2OaKlvQ1/2y4xEwCKdaasGlXd5YY8XqwqA8kmojspyPlWhElRVYJprto1KGneiBbYoajr0uiw7OKSOHCP3J55PiSlUEnFRHl7FepSKZFtTz4IrsnVNjBv+K4ztjnkg5O0ZbYecbKo8cL5d9DH7xqN9UfA2H1h1r++Ds4mLfdKrjM1Jt0t6F24a06itw5SAWeuvsvJtIFWDQUtYWns0UQHj3tAihS597cNEODCMiOqhrPWIpyIA9P02r6i9eo/XreW/J+AXV5aALf0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qn0uHo9VLOqYEeFt/CtGUlFRiVuUj1LiFs3O4tuF21c=;
 b=YckpAfkbSefZxPmL0b2QnnEw2f4GysoJWm54l0fzHHw1wGuAj2wiEXnv4JJwpXe8BpU3KdTrWwCE15Cz/SoIavENo0iARzJPBqUiYQXFxfFOTYuF6Yn28dRy++0M6Y0e5tIH5he+Z4Shk9PYtzHY+lCLXzST9SmrTo4JECjrYUVlY+XJWVtIFW+VDZIspprguOAaa4wvDttyl2kcjhR86QBLDweyW0dExUeD1rnHQhebkJi0LheP0fdPWq0q+ugaXF+Rhd1DavSIH7uTZD/fADQwt98xDA2o9N+/33dJo2mSK5DozyOLj4N7BRuWKaolKVf7bEVey4BFilE5UPlV2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qn0uHo9VLOqYEeFt/CtGUlFRiVuUj1LiFs3O4tuF21c=;
 b=Y3T4IOmFv2VjH02DKSZulZPCq5DXLk4I/3RoZJNcLCYD/4UgmcxW4zRwRf7Ri1uuiKECAjRGT9ANoxVNOhA+5BWur+MoJLY2yJdcQm+HZAoNXZGhXUtAwgYO9vRicBaDqSQ24xUKvZDFY50T77I/0j24PD7lYjt7NDjSHnPl4+ECPPrIeh/h6zcSbyQpvDwWmgJhzMTqA05JmByeB1gbw/4doQueaObxMuA/p0eAs/y+FsxShbf5L7gSXIsgb/YC9GQJZFHoMky1A2ynXBlEkEnc1jV3I4+vusDkif4LdkrXW78FhX0pWHyT1oXFsO4RMYXIKJRJCkFfm6niuVbFiw==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 SA1PR12MB7221.namprd12.prod.outlook.com (2603:10b6:806:2bd::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.36; Wed, 18 Oct 2023 18:00:11 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::5c25:f895:7bc2:de11]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::5c25:f895:7bc2:de11%3]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 18:00:10 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "jon.richardson@generac.com"
	<jon.richardson@generac.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [PATCH 1/3] kernel-yocto, devtool-source.bbclass: fix
 'devtool modify' for kernels
Thread-Topic: [OE-core] [PATCH 1/3] kernel-yocto, devtool-source.bbclass: fix
 'devtool modify' for kernels
Thread-Index: AQHZ/UpTh/r6Atc+X0O88ReAbo4V17BP1gEAgAAC6iCAAASFgIAAAGhw
Date: Wed, 18 Oct 2023 18:00:10 +0000
Message-ID: 
 <DM8PR12MB5430EE71C7313CA0326C48F88BD5A@DM8PR12MB5430.namprd12.prod.outlook.com>
References: <178D75FBE8F44DE3.14388@lists.openembedded.org>
 <DM8PR12MB5430ECC002146797097B60B58BD5A@DM8PR12MB5430.namprd12.prod.outlook.com>
 <DM8PR12MB54301AFB99198C2370B9FF698BD5A@DM8PR12MB5430.namprd12.prod.outlook.com>
 <CADkTA4P9yTNMf0OUH6i+pRXdiBTdQcKBAmNzWGzcFBmLhOtR5g@mail.gmail.com>
In-Reply-To: 
 <CADkTA4P9yTNMf0OUH6i+pRXdiBTdQcKBAmNzWGzcFBmLhOtR5g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=9c48c4e0-bf27-46db-ba84-566535cf8313;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2023-10-18T17:55:00Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|SA1PR12MB7221:EE_
x-ms-office365-filtering-correlation-id: 4b08e702-960e-468e-aeb5-08dbd00411fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1pmc8uPQaAMln+x/zPi0BcvS8RN9MZk3s3MsAMP9kEljg9ZZOvUuhjEgYNH0PfMEmrpTTU0IdjOeYIzwB7PgptJNkIlK/deACQo9XcGtbtDIr0UwrufxCsPplzzxcItYrxhRt5XdClLR5x3XqntBi7FchdTbn1JYBdg4tt4N8D/vront7IZK9reCA0PVevg986QoL2npCWVyRthq+ADHpmD4pslGGALV4G0gJXAuirJa5nSH3ynYOMW+vAZBNr0FZfCvALeN6qMuRzl2rN34ZP+gUDjrhCAbamRSOwJvkPhv0n5TnPEgL3CUNdcEFxU5WjFhJ3vuQ18hR63/EbVmX6Qs8QpN0AQ00gbwWuaj/MJRDXmLKWKy8CwoJG35sNKCyq4qk5Hn6Amt5Mdea9DsS8vfshcFzUta6NuDuOWAV7xUfQPn1HdueEvGsYvK08qMbX2gCCAjGfdF5IeKpAtzdch+f1sQ5NvXJzETZGxbL+CS8G5sxgHHeuT4AhgadwluldQrQBPffIuZ657fttoOHJA04J3zfOSHlSxsougo7QbiIsoKnYPoLR6uEkXNVSFxU+XszF1Q82jd7kzY9QDSz9ElBYBVPuuhLltiLXizIPo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(346002)(396003)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(55016003)(26005)(6506007)(8936002)(71200400001)(7696005)(83380400001)(316002)(52536014)(41300700001)(5660300002)(4326008)(2906002)(8676002)(478600001)(76116006)(54906003)(6916009)(64756008)(66446008)(66946007)(66556008)(66476007)(86362001)(38070700005)(122000001)(38100700002)(33656002)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?N08zakhyOUNzeFdncHBheDNtaHpSN29nRE9sajVMN1N1amp3aExmcXllVURK?=
 =?utf-8?B?K0lVN3BkMkhsQWFESFBjMEpXWk1iV1k1dkY4eWdBLzRDMGZxYS9wNzI0Wml4?=
 =?utf-8?B?OE1IV1N3WlplY3k2K2F4b25lbHgvNmhlVm0zYzlmM0pxWXZ4Z0ZnL3BsQUFt?=
 =?utf-8?B?dUVuMWM0b0FYak5sVE9SV1FubGM0WUZBQkhJdTZHMENzRWc2REZIbWdRUXA1?=
 =?utf-8?B?dDBFWlJ0azRQblp5cjl0OVd4U0ZHRG1ZU2k5L09KMjJPcTIyTlQvMmJ4SFZn?=
 =?utf-8?B?c2lMUmpZVzBpUjdVOHVJbGpPYjFqWENjSjNMTzdkTDAzT1FXZVR0RjNnY3lp?=
 =?utf-8?B?dmhmazIwV2FxR1RUQlRYVFJuRjlaakgzZk5heHZCbnBYNEQ2Q1BxblBPY1ZP?=
 =?utf-8?B?V3V1S29vVk1uY1E3aGo5Tkl6SWpXcjdIOStIalVQa3I0OS9zMzFwVXRMVEgr?=
 =?utf-8?B?bGhKVy9NT1U1NlVTUG1UajE3RUtCL1pvcFJ1bkVFK2FpWS9ON1RId09abE1h?=
 =?utf-8?B?OTkzZTlQdm4xY2FsU0l5Y0NqcGJ6bit4S1FjRldUMVU0Wi9ObGQ4cnUxbDNn?=
 =?utf-8?B?eTA1ekRGbWNERVVKRE4zUVFBa1ZUS20wS3VHU0xxKzdPRk1oak9LWHlWSHZI?=
 =?utf-8?B?UndhVnBQblFtckxsbDlnWHYwRnNHOVNQUWZjcVhZd0tuTzZnb3RkMzBMMjZs?=
 =?utf-8?B?Y2MwSVppUzNObDF5NmRVSmhkY3plb3VDUmVSOG5EUjEzS2szVHFLY2RITGw1?=
 =?utf-8?B?Qjk5NnBmNDFEOGFlMmhMTmJMcVRIMDNIamtrRDRjNFNkc2N2NzZ6cjRYNGV5?=
 =?utf-8?B?cnVFZnVzbU1XQnJVRTlQdkVZSFBBVjY0QWg1UlZWQ3JWelBZQWpLQTFQQU5L?=
 =?utf-8?B?S1pVLzZJdFN1MFo1SkdLMnl6YUFMTGdGMHBva3l4RXFpVHlRMjYwcUdHclBS?=
 =?utf-8?B?SnhMNnNkNnJDbjdZTTFubXFTNFJVUXV6cmN1T2tDV2l1VTJYRjJ0VjZEdWVq?=
 =?utf-8?B?dnZZSlVPQzFiWG5DTmQ0Rk1hbVh0ZC9yNHlpMzA5NHpRanlVbnVOQ3Y3TCtO?=
 =?utf-8?B?RHNGSFdxSjVpM2JvUUNtT2tSSUNZNEZ5S0FPSVF6TmQwT3BFMnUxTGdYOUlB?=
 =?utf-8?B?MUpNMGlTc2tRL1Rob0owSnlwMjBvMXJ0dFFlVVhlVTd3V1NHWUlwY1NxQVd4?=
 =?utf-8?B?aUhRaW1HeTZvMkNWZFBoMFRCZVJTS1BFK2I3M1VCQ0tWMDc3ME1DcndXdlc2?=
 =?utf-8?B?RVkxSU5YQUhETkFFcWZmU0RuNWNJSkpIV3NqaUFRY0xxNnR6Nnc2YnhZT2x2?=
 =?utf-8?B?RkhLWHIwQ3BIWlZ5TzJRNGRFcXdOQjFJdCtUUE1tcStDR0g1aERSMFBTQitV?=
 =?utf-8?B?QWpWSzhwWmg5NGRHdzFJMlU0YUJSbUNZd2ZzUm95QnRlV1hOSDc4SklkQkFK?=
 =?utf-8?B?SjN0Z2gxeEJpUnd6S2ZaQURuU0p2U1hQZU1LaDZxV1RhUmhtclROenhlQ1Ro?=
 =?utf-8?B?a0ZNR3ZvNEFVSkpXS3U0Mkp4bFlnMmQrNWxwWVZNZU16YmdJVjZvUnU3dTh5?=
 =?utf-8?B?NDdiQ2dRNktiR1d0Qms2cVVaeEx2U3ZoeDRVcWllQ1RrdElucGtTVFNaZXY3?=
 =?utf-8?B?QXlFQVpGWHV2Ti92RExnKzhSVXZoVk43WHowNkk2N0UycWZBajV6VVFwRUlB?=
 =?utf-8?B?ZEdGb3NoMVdvY05uM2J2VUZLV3JjVXpzVGIwQjNKNW5PME5CTGo3ZkxMWmJm?=
 =?utf-8?B?Mm5PbExxL3U3YXU5a1NZdE5waFBTQ2ozZXRoT25mWFhORjJRckpzd1JJdDZs?=
 =?utf-8?B?RVRpVVZ5MjFwQlhCbWpqZk81OGl3S1pXVUpKdzkrVVdOQ09jaEdWaW5vVURo?=
 =?utf-8?B?Y0t4UzBFaDg5LzI1My94SEtlazk5cUwwT2VzWUpiLzRaZktQN2pQK0haQ2dV?=
 =?utf-8?B?elViRXcvWXJaR3NVbnhNcmtqYVNrN1dFUDhXbmpPWWtFSGVuTk83MnZCbjYx?=
 =?utf-8?B?aFAvYnNCUWZlejUyNlBaRVRCTGMvR1BOTWUrMllSTHd5Vyt2cWFyY0tDeTgy?=
 =?utf-8?B?MTdicVc3SGkzejNUZnRMcnc3cUIxTXNnNnRSQ2pFcHYxR2x1bnpCR2NMR2Fz?=
 =?utf-8?Q?R6YekzKT/qwwrFS7dgvw7uPQ4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b08e702-960e-468e-aeb5-08dbd00411fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 18:00:10.3277
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eUPTYWv+e2Ee8CvS13B5NIDnqavYDuQXeypUvCzVE+3h7Ml82Rvx4P5N2i+5OACPAHXHtIo+DIqywpMzcDS/pWDe/DjuzWSO8eN1teUB+HQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7221
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 18:00:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189417

SGkgQnJ1Y2UsDQoNCj4gPiBJcyBzZXR0aW5nIHVwIE1BQ0hJTkUgdG9vIGludmFzaXZlPyBPciBk
byB3ZSBjb21lIHVwIHdpdGggYSB3YXkgb2Ygb25seQ0KPiBzZXR0aW5nIHVwIG92ZXJyaWRlIGJy
YW5jaGVzIGZvciBvdmVycmlkZXMgdGhhdCBhcmUgdmFsaWQgZm9yIHRoZSBnaXZlbg0KPiBsb2Nh
bC5jb25mPyBJIGxlYW4gdG93YXJkcyB0aGUgbGF0dGVyIGFwcHJvYWNoIGZvciBzaW1wbGljaXR5
Lg0KPiA+DQo+IA0KPiBJIGFkbWl0IHRvIG5vdCB1c2luZyBkZXZ0b29sLCBhbmQgbm90IGZvbGxv
d2luZyBtdWNoIG9mIHdoYXQgaGFzIGJlZW4gZ29pbmcgb24NCj4gaW4gdGhlIHNlcmllcy4NCj4g
DQo+IEJ1dCB1bmxlc3Mgd2UgYXJlIGNoYW5naW5nIHRoZSBtYWNoaW5lIGZvciBvdGhlciBkZXZ0
b29sIG1vZGlmeSB3b3JrZmxvd3MsIEkNCj4gd291bGRuJ3QnIHNlZSB3aHkgd2UnZCB3YW50IHRv
IGRvIHRoYXQgaW4gdGhlIGtlcm5lbCBlaXRoZXIuDQo+IA0KPiBBbnkgdHlwZSBvZiB2YWxpZCBv
dmVycmlkZSBzaG91bGQgd29yaywgYXMgbG9uZyBhcyB5b3UgZ2V0IGFsbCB0aGUgcmVxdWlyZWQN
Cj4gdmFyaWFibGVzIHNldHVwIGZvciB0aGF0IG92ZXJyaWRlLg0KPiANCj4gVG8gdGhlIGVycm9y
IHlvdSBtZW50aW9uZWQgaW4gdGhlIG9yaWdpbmFsIGVtYWlsLCB3aGF0IGV4YWN0bHkgaXMgYmxv
d2luZyB1cCA/DQo+IEtCVUlMRF9ERUZDT05GSUcgaXMgY29tcGxldGVseSBvcHRpb25hbCwgYW5k
IG5vdCB1c2VkIGluIG1vc3QgYnVpbGRzLCBzbyB0aGUNCj4gZW1wdHkgLyB1bnNldCBjYXNlIHNo
b3VsZG4ndCBoYXZlIGFueSBpc3N1ZXMuDQoNClRoaXMgaXMgc3BlY2lmaWNhbGx5IGZvciB0aGUg
Y2FzZSBvZiBpbi10cmVlIGRlZmNvbmZpZywgaW4gd2hpY2ggY2FzZSBLQlVJTERfREVGQ09ORklH
IGlzIHJlcXVpcmVkLiBJJ20gd29ya2luZyB3aXRoIG1ldGEteGlsaW54IHdoaWNoIEFGQUlLIHVz
ZXMgdGhpcyBleGNsdXNpdmVseSBmb3IgaXRzIGtlcm5lbCAoaHR0cHM6Ly9naXRodWIuY29tL1hp
bGlueC9tZXRhLXhpbGlueC9ibG9iLzFhMmNiNTExZmYyMGM5ZGUyNGU5NzNkZjNiNTU2ZmViYjk2
NTlkZjQvbWV0YS14aWxpbngtY29yZS9yZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC14bG54Lmlu
YyNMMzApLiANCg0KSSBndWVzcyB0aGUgd29ya2Fyb3VuZCBmb3Igbm93IGlzIHRvIHN3aXRjaCB0
byB1c2luZyBhIG91dC1vZi10cmVlIGRlZmNvbmZpZy4NCg0KV2UgYXJlIG5vdCBzZXR0aW5nIE1B
Q0hJTkUgZm9yIG90aGVyICdkZXZ0b29sIG1vZGlmeScgd29ya2Zsb3dzLCB3aGljaCBtYWtlcyBt
ZSBoZXNpdGFudCB0byBhZGQgaXQgaGVyZS4NCg0KVGhhbmtzLA0KQ2hyaXMNCg==

