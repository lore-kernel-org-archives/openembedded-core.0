Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B042C47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 19:11:23 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (NAM04-MW2-obe.outbound.protection.outlook.com [40.107.101.48])
 by mx.groups.io with SMTP id smtpd.web10.2852.1706037080263115266
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 11:11:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=euVQzKbz;
 spf=pass (domain: infinera.com, ip: 40.107.101.48, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJqiBkaAxpYIV1EyOoOOyYwvXvM2oRGUoDr1zHMaVPRFRObdmQPieJo/KEy7iYycohQZbAnhWA9byeC6TZOzNwowlScdVMFktUi2HXEQIagYTvwFndS9vsvLoC52PxdhDIsT6oHkjBHfHy9otdQ4mZsYhIfK/q2a9ctYDrMt83UWIgsonVDL2cG1Hf4G8kO8qVPE5dij6pzxhso/cbsU59qEvRSoFbp53knFwOrYNaetRrZCX0ehaujmyROpuhUwWsf4Xun15yyqI408odDsL3POPC95WeTZvtajWMnKI115+WLb5X1W4t17vrZZjH4+/7GwYo3KX1PnANNU70NEkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zF0nK3/GitdElvdu8Ua1UlfxNj8WW8BfVLblW9pN4YA=;
 b=VXDuntr+Yk0TqZHCUMZ5CqSdk1R8p32yOm+efdsr5gK2K1yaSCJS2rfD/t+7ZYzFNscmDCnJjlZdL0N0lNNXtB0zqAEel25Ha5WVYClHfP9v9NZ7mUcaNVs53wBOY0sRpJQMto3Nav+rBig5VuofcPrJEziLtbFS4aAZpjQ/1i+MEE6mlQAkypcgwLHW2Jy0GnXLFYEmB7We9+Z45Ak+7q0JxLHh0uzDrwHTQKNseoMb06PlW+9dZUOxSUrp3pGhiEPABlebFn9PiNO72KYE0vpc4gS34QS0OW0XTFMD3EtJq0DDXqOKhif9j8EInFbS9asOewaiwKlW6Mnjo9TeRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zF0nK3/GitdElvdu8Ua1UlfxNj8WW8BfVLblW9pN4YA=;
 b=euVQzKbz9V8PL++uGoYKEOGvfKqQd4o0pKbgyIWRSKBSr6wJaiaApX7odBD1Y++u626+5TrzbAmTcNZrm1eUqZhLcjlUOLyUBllh91ae+pSR3QvORWCnMkSE31pWBAn0tT2McLsatEkHLJZhHqdvkQiVeCwoJQFj6kr2VEQ7lH5d9IwWDG0bfCmonQggBpB3cJFilXXwgw8Nm5cvSemPbMu0V3rCHHIZ+J3qVU0Fez/K1lTML75GOUYAosNzbsHnkiLgvCvz2FqMw9QYlgLGuxoMvXsoTUTY9pDBw/6D5kmAk8UZxgXT9NdFs+arGnJYif4YtdDCNecNPPRhHi8XfQ==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by DM4PR10MB6110.namprd10.prod.outlook.com (2603:10b6:8:8b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Tue, 23 Jan
 2024 19:11:16 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea%7]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 19:11:16 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] oe-selftest -v -K -r
 reproducible.ReproducibleTests.test_reproducible_builds always succeeds, even
 when pkg is non-reproducible
Thread-Topic: [OE-core] oe-selftest -v -K -r
 reproducible.ReproducibleTests.test_reproducible_builds always succeeds, even
 when pkg is non-reproducible
Thread-Index: 
 AQHaTUPUG5+0CfWaNE6rcQgwgYDmjLDl78UAgAANuACAAAWXAIAACEmAgABAKQCAAXSIAIAAAu6AgAACW4A=
Date: Tue, 23 Jan 2024 19:11:16 +0000
Message-ID: <5ab234b073a487445092ffec777a9757d68bc549.camel@infinera.com>
References: <5387538c4d9cdb021ad26dec9d8553ed0ead8e6b.camel@infinera.com>
	 <CANNYZj8hkwep=rLn2_tiBmFJhYPpgB9gbkGssdpq6uZbn_qZig@mail.gmail.com>
	 <15c60ef81ccec80f50643b4ebbe40a6dbacd4f5c.camel@infinera.com>
	 <CANNYZj9HM_U=rvhVSrnEb-Ydgd593ytgcBJMYWtPiC-5XM4C8w@mail.gmail.com>
	 <d92a64cfcbffc58821e70eba2c61e403f5002ec3.camel@infinera.com>
	 <CANNYZj9HK0rmThC_uzN5vaNCYyWx2dfOuA2CH340ATavho1MHQ@mail.gmail.com>
	 <e28167217b5f0404b81bb87d15c8a1df5e2cc938.camel@infinera.com>
	 <CANNYZj-25pTodtkz-qZsZb4GX-D4Y4+QE=93EqRWhzGo9jd2aQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-25pTodtkz-qZsZb4GX-D4Y4+QE=93EqRWhzGo9jd2aQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.1 
autocrypt: addr=joakim.tjernlund@infinera.com; prefer-encrypt=mutual;
 keydata=mQENBFp0f28BCADPn4XzN2HEzkY4BZKE6/T/S4M/Qjlf01K6gmECJZi5LQgOt0jOUAdvsXVd8yKYeqCq+eWvlfrLU9OXPGoCqwj95P2YjMsttqaPBEAnf4XyBs67Snz2wHyBDONoRxGoyq2Ondy+TPicWEm0mh404h9EzKxRNxwrRyKhsjWoVeaucuybAiGbJvqQj0CLmuMCl4PUBYDmXFzt3yx0g54z8E9/8ON+z0J7yZbA0aftZAjFLv6nn0Th/2dpD8d3vWtkJw4yBjLX2KFvlzJfQqkd6RI4Cn1OP9sguXDob123dMiMk/5XbjXz+0C21QFxejxt3HGisvKes+8swplyni7KdiDtABEBAAG0MEpvYWtpbSBUamVybmx1bmQgPGpvYWtpbS50amVybmx1bmRAaW5maW5lcmEuY29tPokBVAQTAQgAPhYhBFtMG/jmfqy7x0aBp4VMQ6CbDpcaBQJadH9vAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEIVMQ6CbDpcasFAH/j64dpHpjY55tVoUg5yK8hcmxS/buKQQP9H3e2DdHeYrK0qeQ97AXiWTh63UvzvEXchiKjua6kYhUUkDObaltmwkKgPv0qb9lP6yfFBzvllriS6LrdIMCOLgtnQW2x28m5mC1hYT08jlqEXluYDoj2dTll9HGMsqn0JkhRjBsuzTXq8VyJjjnNLpzsAlTOGEQoAi7SqtDHs9PSNyOAKH5jRjATdNbPAsTKuI1veJf7Zzyc98yG0ya43Hqal1scoa+9GJZXNQPRaMVkyxKGbEEncdtnQl9e/DUMH4SUQ5vbM/+U4WvkX5Cvc+KwI6JAm1PhrAaVHSkDNAU5LqUqEbbHY=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|DM4PR10MB6110:EE_
x-ms-office365-filtering-correlation-id: 99940d6c-6f09-4cce-c04f-08dc1c4712d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 NQKM81RQe1tTqa1rgx9aUQr3qJUvK9T2tVyLuVdLAvCZkN1SkU/ME9pmDyTR1HrhZTv5W/6pDC1V71zlRcvuU4Gb1AgcSAiEdMZEP1BruWDSYrkkrMik9dU/jWk0SdJI7DRwxpRQcT7JNkoj9rtrAE6gIOm5kgYNcq31vGG1/O56c3ZYMrsSEqbZFmmCu5nIbHKgXBC4B04O/COFXOYJ1ayMy907hdkyQIMz+JW7xtO8Y8dBdDtjSlFC3/5VtAjLUtuErB8kZAYoqDKVnY8wn914IsAIy+gTpLonmILhbI8ZRef1HvayUUsYpBk05imLx8BLvpL6U3utuJ7ObVXkMyxWr0ma3kQsHfbXvnGReMQMGo8D4xUGszAZF2oEuEo91l78wdvj62FOHCm9AWfXDkfrNdtmRnk8rWnUe5ySEiltnYVfvJ6PUdKNXzeirAdiBtkXHwEi2+A45lRVzcj24RdCqST2FvK53HoEO4dZEG39dV8d0EQp/a7XJzPV3+DeWwsaNoTGmHnCwPJy/gK5r2HKST1xs7K3dlDuOmr0nHRxnoo+EKtEM9l11jqeYFtzs8jxhIpvAIh6q67UvGqSekyuRgFYyVvWcx1TS182slkYbhPH02J82dYwNixOWREo
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(366004)(376002)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(41300700001)(5660300002)(6506007)(6486002)(71200400001)(478600001)(8936002)(122000001)(2906002)(8676002)(4326008)(66476007)(66556008)(76116006)(66446008)(66946007)(91956017)(2616005)(316002)(64756008)(6916009)(86362001)(38100700002)(6512007)(38070700009)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Qlo2a21GRkFralk1NTUxaXJhemxzT1FRc0xSQ3FxUWwrUWpnSGhlWlhSU0ts?=
 =?utf-8?B?YWgxMmhxVmhQUW5GakFWMHZCSk9peHVEbFJLRGx6R3FhUUE4NWUvZ3N1REZU?=
 =?utf-8?B?OVM3dkgrU3ZiOG1RZXBsdjJPdDh6Zjd3clNOWko0cUlnUVQ0cVVnSTd0bDlW?=
 =?utf-8?B?ZHFGWC9SSzZOaGxGV1Zad0VFRFRtK1U2dHZhWUtiWDVXa04xeVZORGVUd0ZR?=
 =?utf-8?B?NDk4MEthaGZoUmtGZ2o2RkpreXZHUE9PcVpVR05aWEkxQ0xQK0VzWnVXaGVy?=
 =?utf-8?B?UXl0YVl0U3BoRTFQaXNjUktqRlUyRncwcXVsc3RVak81aSsrL1BTbWZUUDAv?=
 =?utf-8?B?MmtvQklqTHdDVy9vd0hzWk5teTdaNnZoNjNBSlE2bktqUVFTY2Q0V3dRb0NT?=
 =?utf-8?B?MER2REJDR1dIb3paLzFFdU90MFBncEhWR1NPa1M2NEdDQTNDUU53V3JlckRk?=
 =?utf-8?B?YUJIVVNlbmVEcVJaR2lrZzZXRkFIZnpZUlBGcVhSdTJVZjJyRFlIWHVSbTU4?=
 =?utf-8?B?Um9ORy9oVE1PUktQSXVqT21md2VzREtyRHE1OXMzUFFhUjJlb2dIUG01UXFH?=
 =?utf-8?B?aHQwSHAxclZnVUdkSEE5Vkl5SmRWbzFCSHYrTkJZMGRXZlJSS05iOFFYTkQ4?=
 =?utf-8?B?NzdobDhDTlRrb01FS0FGRk1wZnBxcWJ4UHgreU1hdXhGQzJlRU14M3NTL25L?=
 =?utf-8?B?SHlDMDRjTG82dVdPcWdtTzhQZ1I3RE1jalNwYjdLalhSWjhiVFlhTWl2NGJp?=
 =?utf-8?B?eThjanF1cHFDUFBYRWJOU3BjOEU5a2p1NDlwTjlWRE1vZ2gzUlpBcWFYTHMx?=
 =?utf-8?B?YUJnZ05tQ2F2TFVybW9lVGlTeDJPaGNlTnlkTHQrKzdtUVM2Q1VYYzNwcUh1?=
 =?utf-8?B?Nm5rWU0xN05zaStOY0ZacHdodnVRWW8xanJxaTVVUkozdWQyVTdZcmtoS0F6?=
 =?utf-8?B?N01TRkZqWnI2VStxaW5zeVBZWGxUU21vZDNhWDh4RFdNRFVRUlJqM2xaWWdt?=
 =?utf-8?B?T2dFTnpES3pBVGthOTc0WWYzUXViWUd5allLcW1IbWc4dDlrY2EvZjdxYnB5?=
 =?utf-8?B?V25XZUg3TlM5OWdtWFZmRGs0T05xMUJncGM1Ky80V3lRa25nV3NSZ1AvZldk?=
 =?utf-8?B?OG5iTjRaYzNjTjg0NGU1RldPMnBpcHBGcHczUUIwaTVDYy9NT1krQ1BlRHVJ?=
 =?utf-8?B?ZXRUbEVPcVJxQTRDcTNYYzhoS2lvQWl5Y0pqVERjWEpsdkVLM0J0ZWVKYmFX?=
 =?utf-8?B?TE9sUU1xemk2eFlMV3V0Q1J4dWhjZ1lYSEZWa3RCeFlOU3dYSlRIRjRZYWM5?=
 =?utf-8?B?a2U2OVFUOTF6RGVxMXZtaFo5czhEc2dlL1hjUWVWVnRYbHZWZGNVVGc0Mjd4?=
 =?utf-8?B?emFqWFRUZGE2aUUyZGtxZWtxYkp2Q0lqTGZ1OUN1WUFEWUNheENhNlk4a0xW?=
 =?utf-8?B?bVI5MHhIU1BlblhNTnFtTnBUd0ppd1V1L00wRUUwMnRzaWdraEtDdDBLdmc0?=
 =?utf-8?B?Q0pyU2JNMEN6V2diNzR6QXhUNmljeEd5VDBLZUJKa09ObmowblVTT0oyRUJM?=
 =?utf-8?B?cFU4N3pldmlxMmpzQWE1YzFpV0tvR0UwSzZzTVpib3FSV0JHMSt0cjVrU040?=
 =?utf-8?B?VlA5NVZVdUNYSmxaVWoxTjErVEMrNHk1b1RLTG9LM1dLUUEycjRQais0cnVS?=
 =?utf-8?B?eGE0R3BzQ1A2K3hZSDlYVHpUZWsveDhyaXNndlNqaDVOeFhGejY5aWt5VHdE?=
 =?utf-8?B?UmF4NStLVmZscmNoR0VXTnd3R3VHbnZBSWhOT29wcy9XcFF5K25yVDAwVVYw?=
 =?utf-8?B?ZDNNZWt5VEI1T2ZjVXVOQkxVZVlEWm9FSElRbEMxMzNEN1dqODhYUUVCLzBH?=
 =?utf-8?B?SEQyMXFUT243WDFodjJMeGljcDlKVjg4NTMwUVljL0gxVDRTbzFsam13S1Qy?=
 =?utf-8?B?Vllhb2R4cGVWSXNMZGRRazBvVUZ6ME5QcFBGQWQ1UTlSY0NNYmZSZVZUWWNz?=
 =?utf-8?B?SnJXWVIyTER6aFZ6R2YyYTBPV0xxNkhJa3RZdmdkYUdFN0lnNXMwWVpndlhR?=
 =?utf-8?B?ZkFXcldsdWJTbWhpaEs4RFloVkNhbjU4eFE1cWFVS3diYnNDVWQ2MkdqVDlR?=
 =?utf-8?B?MzY0REVsMFJackFTUG1neTBBZjkzTGh1cjNTOHdTZUc5R3pNS2tVQ3MyN04x?=
 =?utf-8?Q?0WbgeRRPEPJD19mD/v9YbF+73Qowm5D8co7CTRKStfAL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB11602E755C1C4DAE6088E26AFCCDE4@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99940d6c-6f09-4cce-c04f-08dc1c4712d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 19:11:16.3547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: djYEiqHv2ET/IqSk9kn3QZQBTl6pV1FuTj0TbUNKuvMdib6HFEmqow5L3z1TdHNLthuYvJ2SyBP0q5AlIPQYMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 19:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194249

T24gVHVlLCAyMDI0LTAxLTIzIGF0IDIwOjAyICswMTAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gSG9zdCB0b29scyBjYW4gaW5mbHVlbmNlIHJlcHJvZHVjaWJpbGl0eSBvZiB0YXJnZXQg
aXRlbXMgdG9vLCBzbyBJDQo+IHdvdWxkIG5vdCB3YW50IHRvIHVzZSB0aGUgc2FtZSBzZXQgaW4g
Ym90aCBidWlsZHMuIENoZWNraW5nIGZvcg0KPiByZXByb2R1Y2liaWxpdHkgaXMgc2ltcGx5IHNv
bWV0aGluZyB0aGF0IG5lZWRzIGEgcG93ZXJmdWwgbWFjaGluZS4NCg0KV2Ugd291bGQgbGlrZSB0
byBzdGFydCBnZW50bHksIGRvbid0IGhhdmUgdGhhdCBwb3dlciB5ZXQgYW5kDQpzb21lIHBrZ3Mg
bmVlZHMgZml4aW5nIGJlZm9yZSBkb2luZyBzZXJpb3VzIHJlcHJvLiBidWlsZHMuDQpUaGVyZWZv
cmUgSSB3b3VsZCBsaWtlIHRvIHJldXNlIGhvc3QgdG9vbHMgaWYgcG9zc2libGUgZm9yIG5vdy4N
Cg0KQnV0IGhvdyB0byBzZXR1cCBPRVFBX1JFUFJPRFVDSUJMRV9URVNUX1NTVEFURV9UQVJHRVRT
Pw0KDQo+IA0KPiBBbGV4DQo+IA0KPiBPbiBUdWUsIDIzIEphbiAyMDI0IGF0IDE5OjUyLCBKb2Fr
aW0gVGplcm5sdW5kDQo+IDxKb2FraW0uVGplcm5sdW5kQGluZmluZXJhLmNvbT4gd3JvdGU6DQo+
ID4gDQo+ID4gT24gTW9uLCAyMDI0LTAxLTIyIGF0IDIxOjM5ICswMTAwLCBBbGV4YW5kZXIgS2Fu
YXZpbiB3cm90ZToNCj4gPiA+IE9uIE1vbiwgMjIgSmFuIDIwMjQgYXQgMTc6NDksIEpvYWtpbSBU
amVybmx1bmQNCj4gPiA+IDxKb2FraW0uVGplcm5sdW5kQGluZmluZXJhLmNvbT4gd3JvdGU6DQo+
ID4gPiA+IA0KPiA+ID4gPiBPbiBNb24sIDIwMjQtMDEtMjIgYXQgMTc6MTkgKzAxMDAsIEFsZXhh
bmRlciBLYW5hdmluIHdyb3RlOg0KPiA+ID4gPiA+IE9uIE1vbiwgMjIgSmFuIDIwMjQgYXQgMTY6
NTksIEpvYWtpbSBUamVybmx1bmQNCj4gPiA+ID4gPiA8Sm9ha2ltLlRqZXJubHVuZEBpbmZpbmVy
YS5jb20+IHdyb3RlOg0KPiA+ID4gPiA+ID4gTWF5YmUgYnV0IHdoYXQgYWJvdXQgdGhlIG1pc3Np
bmcgcmVwcm9kdWNpYmxlQS90bXAgYW5kIHJlcHJvZHVjaWJsZUIvdG1wID8NCj4gPiA+ID4gPiA+
IFdvdWxkIHRoZXNlIGJlIG1pc3NpbmcgaWYgc3N0YXRlIGlzIHVzZWQgZm9yIGJvdGg/DQo+ID4g
PiA+ID4gPiBJbiB0aGUgbG9nIHRoZXJlIGlzIHRoaXM6DQo+ID4gPiA+ID4gPiAgIElORk8gLSBC
dWlsZGluZyByZXByb2R1Y2libGVCIChzc3RhdGUgTk9UIGFsbG93ZWQpLi4uDQo+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gSXQncyBwb3NzaWJsZSB5b3VyIGxvY2FsL2Rpc3RybyBjb25maWcgc29tZWhv
dyBvdmVycmlkZXMgYWxsIG9mIHRoZQ0KPiA+ID4gPiA+IHRlc3Qgc2V0dGluZ3MsIGluY2x1ZGlu
ZyB0aGUgc2VwYXJhdGUgVE1QRElSIGRpcmVjdG9yaWVzLCBhbmQgc2ltcGx5DQo+ID4gPiA+ID4g
YnVpbGRzIHRoaW5ncyB0d2ljZSBpbiB0aGUgc2FtZSBkaXJlY3RvcnkuIFRoZSBsb2cgZG9lcyBz
ZWVtIHRvDQo+ID4gPiA+ID4gaW5kaWNhdGUgdGhhdDoNCj4gPiA+ID4gDQo+ID4gPiA+IFRoYXQg
d2FzIG15IHRob3VnaCB0b28gYnV0IEkgY2Fubm90IGZpbmQgd2hhdCBpcyBkb2luZyB0aGF0LCBn
cmVwcGluZw0KPiA+ID4gPiBoYXMgbm90IGZvdW5kIFRNUERJUiBjaGFuZ2VzLiBJcyB0aGVyZSBz
b21ldGhpbmcgZWxzZSB0aGF0IG1pZ2h0IGluZmx1ZW5jZQ0KPiA+ID4gPiBUTVBESVIgPw0KPiA+
ID4gDQo+ID4gPiBZb3UgY2FuIGZpbmQgb3V0IHdpdGggJ2JpdGJha2UgLWUnIHBlcmhhcHMuDQo+
ID4gPiANCj4gPiA+IEFsZXgNCj4gPiANCj4gPiBGaW5hbGx5IGZvdW5kIGl0LCB3YXM6DQo+ID4g
LSAgICAgICBAZWNobyAnQkJQQVRIID0gIiR7QklOQVJZX0RJUn0iJyA+PiAkQA0KPiA+ICsgICAg
ICAgQGVjaG8gJ0JCUEFUSCA9ICIkJHtUT1BESVJ9IicgPj4gJEANCj4gPiANCj4gPiBOb3cgaXQg
YXQgbGVhc3QgZG9lcyB0aGUgcmlnaHQgdGhpbmc6IFRhbmtzIQ0KPiA+IE9mZiB0byB0cnkgb3B0
aW1pemluZyB0aGUgYnVpbGQgc29tZWhvdywgZG9uJ3Qgd2FudCB0byByZWJ1aWxkIGFsbCBob3N0
IHRvb2xzIGV0Yy4NCj4gPiANCj4gPiBTZWVtcyBsaWtlIEkgc2hvdWxkIGJlIGFibGUgdG8gdXNl
IE9FUUFfUkVQUk9EVUNJQkxFX1RFU1RfU1NUQVRFX1RBUkdFVFMgYnV0DQo+ID4gdW5jbGVhciBo
b3cgdG8gcG9wdWxhdGUgdGhhdCBsaXN0LCBhbnkgcG9pbnRlcnM/DQo+ID4gDQo+ID4gIEpvY2tl
DQo+ID4gDQoNCg==

