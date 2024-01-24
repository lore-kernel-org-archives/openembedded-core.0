Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0CF2C46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 13:13:08 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.84])
 by mx.groups.io with SMTP id smtpd.web10.21916.1706101978736832954
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 05:12:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=OglwEX5H;
 spf=pass (domain: infinera.com, ip: 40.107.220.84, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GXK2j059pWGq2Oz/2dlGhzNXzyrprnVMHOLblZ274MEVy7fuHmI5gfRrNft05qM+DmoAVIH/de2lP6WAltsT+bq0fbjP4AGfS3+5lbr6NCDb7dBKsK9NOdStLkpYtIls+V1O3EoUysCosTBe9HPvYkY9pHa8CclmkF/I4Km156rkdMySv3y+wdkR0igqlYMcLrgr5BO7NjR+qcT4T0e1FCqrOcCeI4fYqcxIhwvtjUtnqcmtgzgCNUB7uqiDDzMv17cdDrd5QB6VwMMvOmeKAg4IX+ZuZGmQuX/+axlt7gg2DkxoCooXmCenqLxRgb2uU5ML2UHxPCmrpMa4ycaOfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiczhueGioOz3KqW+Epeary/HJ36lXDrE1rfrud3BG8=;
 b=O/CzsLEsD3itC0NWkyIge53JLCzD0JMjMVx/MiytMOaE3kJ7DYlrFL8ZdoRFwOQ9SJzzUZnEzzKsJ8lg/lkzDySShA0tLqnnCbcC8YaVWfRqqnvQhy4fLKzdZ4cEWaMMSlOUdoyqU2Vekz1W5qYlIo6ptzQ76ScB6/spaD5NR5VjgFcYVxzBxHLeWV8Bea3doHCNTRAK+nUgjQovIH0BN433quziop1jB/F2zLyHwJSz/UY0LvaUAT+JdgqNRp44dEAsLIXlQtHQOJrxLe/AxS+SOFBtx7ceBtXP4MiHrL5umVZpo1PNCIW6D/kAYgGUPG+Yk3mkyiNmASHxN3U2aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiczhueGioOz3KqW+Epeary/HJ36lXDrE1rfrud3BG8=;
 b=OglwEX5HO6xBZGkNMJtyyPaFjO9pCSuT6lynpSMw4g8vx5R0bfcalutqGURQfEzk/eBPmCdXBkhihTiyK0eCJq3wpZzvsShJ8lFPc55/CTiPFzS6dVY8TqVJshbhNylTxeZRZ8Z8OrFabN2eoOExfKNl7fXAATtN/b3T7RW4zI3AjXcbGYrYKpbFjeH8ACUmdjk5Dq8qnCrPdWXXnGRHEDEMcqE/iWQizEfLws9GU/WGuZKxUry9Ezmt8zxCkoPZl50QtBJYdiZECfJQIgq+hCqa+GctHJmZ5JTCJ58Xy+PYt/1MOSzMACAL7cXkUjwk1jkxQMK87GzDST6lfherag==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by MW4PR10MB6605.namprd10.prod.outlook.com (2603:10b6:303:229::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Wed, 24 Jan
 2024 13:12:55 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea%7]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 13:12:54 +0000
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
 AQHaTUPUG5+0CfWaNE6rcQgwgYDmjLDl78UAgAANuACAAAWXAIAACEmAgABAKQCAAXSIAIAAAu6AgAACW4CAAADqgIABLUwA
Date: Wed, 24 Jan 2024 13:12:54 +0000
Message-ID: <d55cbc3f4836ec7267bb999eb1a33357e846be95.camel@infinera.com>
References: <5387538c4d9cdb021ad26dec9d8553ed0ead8e6b.camel@infinera.com>
	 <CANNYZj8hkwep=rLn2_tiBmFJhYPpgB9gbkGssdpq6uZbn_qZig@mail.gmail.com>
	 <15c60ef81ccec80f50643b4ebbe40a6dbacd4f5c.camel@infinera.com>
	 <CANNYZj9HM_U=rvhVSrnEb-Ydgd593ytgcBJMYWtPiC-5XM4C8w@mail.gmail.com>
	 <d92a64cfcbffc58821e70eba2c61e403f5002ec3.camel@infinera.com>
	 <CANNYZj9HK0rmThC_uzN5vaNCYyWx2dfOuA2CH340ATavho1MHQ@mail.gmail.com>
	 <e28167217b5f0404b81bb87d15c8a1df5e2cc938.camel@infinera.com>
	 <CANNYZj-25pTodtkz-qZsZb4GX-D4Y4+QE=93EqRWhzGo9jd2aQ@mail.gmail.com>
	 <5ab234b073a487445092ffec777a9757d68bc549.camel@infinera.com>
	 <CANNYZj_aa8XmPB7z5yh90g0pmNXM6cMU-41D8F-6=3iGmfgoqw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_aa8XmPB7z5yh90g0pmNXM6cMU-41D8F-6=3iGmfgoqw@mail.gmail.com>
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
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|MW4PR10MB6605:EE_
x-ms-office365-filtering-correlation-id: 3fb74eca-ffd6-46d6-49a5-08dc1cde2d5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hzwQjVxWrHM8eomINI5CQ28k2CKXJ9LX7acIGEyLfRl0euecAaRyT6pAAW6mp7qzNC3zrAmeDnEeahUY6vVm6BWZ3dqpJI/DGO+Zy3Wkqgl9JKoEwCKrqxRyhsyQ7wKjplj8v4+gbs8p405o47H6oQqOtXja+hsziVuXKUei2/3pl3TKzi8HizyL4moH2LTH5DyAdgcgaXWBFeJDiU1LPfHlaBCyqcTyd83jG1at2O6mxnOCfChD3P1eQxn85iLP/xqe/RkQQMWRlunBWkSX/PEbwe5i0t1dRhkKffhbwX3GTWmVablJR3SFs4EYQu5PGeD0Ac3KAlwWGBLe3Mx1bjzXM25Ot+78w3Kn2PElhbcBKrkhgS7beAyL1LVcBuUG/kqVJeC/Kexm2IpENk+hB2e7x3q63udT7FR5mRDa0YF+LgaUzRuOVpCnnu2gb4psFeHMUj1I8lWvWLXqj4wG+LmEVyJVrHecZbA1NzMLNFyxIZvH0YZjwB6MN8Y9yJhubHmvTUHLBMoJ7ElmlIE49AN3NJmk5RWmD52c5ZiFXbNlzBKlTdJLkGtGPCWjpv+8IzSIOaRC67MB4AItqYOvpLz/Z0Wv3maWDMGtsABJo/keBle8q9/MNzF3X+ybK8hF
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(39860400002)(346002)(136003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(6506007)(2616005)(6486002)(478600001)(6512007)(64756008)(66446008)(66476007)(316002)(91956017)(6916009)(66556008)(86362001)(66946007)(76116006)(122000001)(38100700002)(71200400001)(4326008)(8936002)(8676002)(66899024)(36756003)(41300700001)(2906002)(38070700009)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RnVhOFN0ODdQNjNKSG40bGUrYi9pVWVZNklQTk9RTUxHVTZ4Ync2eE5qbjVj?=
 =?utf-8?B?bWUzQXJoM29oOGM2Sjhodm5YM1llWHdDaGFtVHpqRkFqQTRLR2d1UmRROTd6?=
 =?utf-8?B?aGtpUFFjb2I1YXg1ai8rNGlYMDBqRmxCa25mS2ZIV2FQZER2eEdYMVFZdHY5?=
 =?utf-8?B?VFdqUTdtbUVUZVU0cE5wUTVMV2hIRHdibnZJL3BFVTY2RFJvb3ZyN1dHUGdV?=
 =?utf-8?B?aEJyeWNVYVBVNWFhMTJNOU1iVHZGMWdEZlpFcDdvemNSOUNIZzhPd2VFanBt?=
 =?utf-8?B?bThta01CNDQyN1IyMFdxcVJUaW5TdFdnckQ3aXBwa0wzc25MeUZ4T29mS2l6?=
 =?utf-8?B?WG1TNDJpK0ExZE4rNVZlNWRBejZ1R2VDazlTdG1SbHJQdGU2dG9RS2JWdWxp?=
 =?utf-8?B?N2pxTUNmZVZ6NlhHQisrK01GRHFXZ1B4SnRZaEVyNmp5MWorT2xjMGppTnB2?=
 =?utf-8?B?M25PeHpUd1cwc2xlSGNGcisrdC9jYnlWeW1wQi8xWUpFYk9RMldEbXZOenBN?=
 =?utf-8?B?My85eTJjYmJNYVNXS1l0MDBnNjgyYkRHQ3lBaWZlc1haazlNR1l5TlJNbE55?=
 =?utf-8?B?aE5FWUFWdGd4MXhwL2lWK1p3bFY3NVlwak9jODNjUzdlZzhGMThSQ2F1Nklu?=
 =?utf-8?B?SVVNdU56VXBuUUprQlAvcTd2dGdLdmVNQXFRbjZEZXd1dEVxVll3elBmOXo5?=
 =?utf-8?B?THhOZkIyOUdyeWlQZzhpWERlempEYVJrZmJjMDdPbFpkcUlNcGxNUjJ5SmxB?=
 =?utf-8?B?V2g1Z0k2bTZidVB3b3owVWJxUXZWUzFLenlnblFzSmRUTVE5Q0oyWXRqVkZ6?=
 =?utf-8?B?SzFVN09FM0JyRXlpSVp6SEZMeElzaTg5NDdaa1h1enE2NmFURHdKL05walV0?=
 =?utf-8?B?NVcrS2E3MEJwUm1BSFlhdEZNbjRGTHdGVkRMVkROY2FxQnczWjVhMUFGdXhD?=
 =?utf-8?B?eTAxNnhlYnBuam5Ja0FJNGhuOEtobE8yQVVQMWlzU0p2Vk5rN0xhWk1sVnpz?=
 =?utf-8?B?SkNNT3dzTEJBVGNDZmJZbjlyQUk1c2UyNlR1TjhoNElkRXQvYnFiS3liYm9E?=
 =?utf-8?B?NExLMGw1d1UwN0daSFdJdDgwendsN01DRlFGdExkNTg2MHhGQkZVVXNUZzZJ?=
 =?utf-8?B?eGdqYkNnNWZFK2xYTENLb0lEbzBPR0JRT09UblZLMFVtcnFqYUNIZmtBb2FN?=
 =?utf-8?B?dFRQMjNFMWFnOWluSTY1TnpGN3F0TVUzQjl4U3dNMk13UWxCRWg4b0dEUVUw?=
 =?utf-8?B?NDZMZmZQZHgyZ0k2VEJWMTNzaEtENHdwSWhvTzlReXRDS0VsbVNodU1sYnNi?=
 =?utf-8?B?VWMxSnkycnFHYnNjTi9kSnc0amFsY3lDSWc0OUhzVUNaUUVNTzlwRXoxaVQv?=
 =?utf-8?B?a3RKWWNQekpweThNcURRZXRYWHdTSm5UbVpmcFUxbDhvdTJRY3ZJeVgyUC85?=
 =?utf-8?B?WXpqTU9uKzQ3b3hiVkZSVEJCMWNKTVgyajR5cC9yb3FsYWhYZ2Y4TmlZVDZ5?=
 =?utf-8?B?RmpvelAwRDBoY3NVbE1uSlNGWVpRZ25sZmR0ellMSmtnTUtpUWxrc29BRldJ?=
 =?utf-8?B?TG9wL0hiQUl3L3RrQTZuZUxZNjZQVWRVVlIzMms2OUtZVG9saEpYenVXMmhF?=
 =?utf-8?B?VStvOEZiRGUzaGxidXZERHdtYkRNaXMwMkxSUmFrbVJqeTVFY2RsK3l5akRN?=
 =?utf-8?B?RzdTZ1ZMTDNBWSs4aFZTa2M2bWNvZFBzbXZrY1RWN2ZESFV5UlhjVzFEakVr?=
 =?utf-8?B?OFE1bGRtTW1Hc1AweXdyd3k3U0pGbnhMNy8zeWcyQTFEVWNBa3ZrVU1teEVZ?=
 =?utf-8?B?Mm41bnFJM0xiWUpGU01taVE3MDdnbTYvZkxQWUR4L1g0NXZHQ0V2clNuSEZN?=
 =?utf-8?B?Z1dieFFvaFpUWkJ2U3NsZERBR2VzSGE4bFZKS1lYWTlYRTh5RjFtbFVaU09h?=
 =?utf-8?B?ek1hcjJSUmFTWnRlV3Jsc1dGQSs0N2JoK2U2UlltdTFHRTU3RG1kYWtvYmlD?=
 =?utf-8?B?TTJMVWhmZjEzRXFRVFZLR0o3WEhEOXdZTmsvbVRTcDAvbFpPMWs4cnhFSEFU?=
 =?utf-8?B?VEwvdC9jS2RuZ1UyYXF6cUVxbHlCaUVlMGdQTDlLZnNnN3JtdThhVDlKZGVs?=
 =?utf-8?B?VWNoeTZDV2h2bkZ1V3VEd3lOeTNMZ0taUWxrRWgvV1BjSkYxWW8rRWFadXRx?=
 =?utf-8?Q?RW3G91YsNQQCQmSuQNP7BpTtC58kBKLEPCLSA9G3ffKQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD7F71469BB41C45B3A4A6A2361B874F@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb74eca-ffd6-46d6-49a5-08dc1cde2d5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 13:12:54.8816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ITBFKA5qp3oIDRbtEQ19dfL9hetq/+9oWd3WseIOqJ+zwrM2BzwXYTj980PlRwDh61sHQaSTpsapmT/MhHhxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6605
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 13:13:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194271

T24gVHVlLCAyMDI0LTAxLTIzIGF0IDIwOjE0ICswMTAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gT24gVHVlLCAyMyBKYW4gMjAyNCBhdCAyMDoxMSwgSm9ha2ltIFRqZXJubHVuZA0KPiA8
Sm9ha2ltLlRqZXJubHVuZEBpbmZpbmVyYS5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IE9uIFR1ZSwg
MjAyNC0wMS0yMyBhdCAyMDowMiArMDEwMCwgQWxleGFuZGVyIEthbmF2aW4gd3JvdGU6DQo+ID4g
PiBIb3N0IHRvb2xzIGNhbiBpbmZsdWVuY2UgcmVwcm9kdWNpYmlsaXR5IG9mIHRhcmdldCBpdGVt
cyB0b28sIHNvIEkNCj4gPiA+IHdvdWxkIG5vdCB3YW50IHRvIHVzZSB0aGUgc2FtZSBzZXQgaW4g
Ym90aCBidWlsZHMuIENoZWNraW5nIGZvcg0KPiA+ID4gcmVwcm9kdWNpYmlsaXR5IGlzIHNpbXBs
eSBzb21ldGhpbmcgdGhhdCBuZWVkcyBhIHBvd2VyZnVsIG1hY2hpbmUuDQo+ID4gDQo+ID4gV2Ug
d291bGQgbGlrZSB0byBzdGFydCBnZW50bHksIGRvbid0IGhhdmUgdGhhdCBwb3dlciB5ZXQgYW5k
DQo+ID4gc29tZSBwa2dzIG5lZWRzIGZpeGluZyBiZWZvcmUgZG9pbmcgc2VyaW91cyByZXByby4g
YnVpbGRzLg0KPiA+IFRoZXJlZm9yZSBJIHdvdWxkIGxpa2UgdG8gcmV1c2UgaG9zdCB0b29scyBp
ZiBwb3NzaWJsZSBmb3Igbm93Lg0KPiA+IA0KPiA+IEJ1dCBob3cgdG8gc2V0dXAgT0VRQV9SRVBS
T0RVQ0lCTEVfVEVTVF9TU1RBVEVfVEFSR0VUUz8NCj4gDQo+IERvY3VtZW50YXRpb24gZG9lc24n
dCBzZWVtIHRvIGhlbHAgdGhlcmUgKHBhdGNoZXMgd2VsY29tZSksIHNvIEkNCj4gc3VnZ2VzdCB5
b3UgcmVhZCB0aGUgdGVzdCBkaXJlY3RseToNCj4gbWV0YS9saWIvb2VxYS9zZWxmdGVzdC9jYXNl
cy9yZXByb2R1Y2libGUucHkNCj4gDQo+IEFsZXgNCg0KTW92aW5nIGZvcndhcmQsIGJ1dCBzbG93
bHkgLi4NCkkgbm90ZSB0aGF0IGdldCBhbiByZXBybyBlcnJvciB3aGljaCBJIGNhbm5vdCBleHBs
YWluOg0KMDI0LTAxLTI0IDExOjE1OjMyLDEwOCAtIG9lLXNlbGZ0ZXN0IC0gSU5GTyAtID09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0NCjIwMjQtMDEtMjQgMTE6MTU6MzIsMTA5IC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0g
RkFJTDogdGVzdF9yZXByb2R1Y2libGVfYnVpbGRzIChyZXByb2R1Y2libGUuUmVwcm9kdWNpYmxl
VGVzdHMpDQoyMDI0LTAxLTI0IDExOjE1OjMyLDEwOSAtIG9lLXNlbGZ0ZXN0IC0gSU5GTyAtIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCjIwMjQtMDEtMjQgMTE6MTU6MzIsMTA5IC0gb2Utc2VsZnRlc3QgLSBJTkZP
IC0gVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3QpOg0KICBGaWxlICIvaG9tZS9qb2Nr
ZS95b2N0by14ci8zcHAvcG9reS9tZXRhL2xpYi9vZXFhL3NlbGZ0ZXN0L2Nhc2VzL3JlcHJvZHVj
aWJsZS5weSIsIGxpbmUgMzIxLCBpbiB0ZXN0X3JlcHJvZHVjaWJsZV9idWlsZHMNCiAgICBzZWxm
LmZhaWwoJ1xuJy5qb2luKGZhaWxzKSkNCkFzc2VydGlvbkVycm9yOiBUaGUgZm9sbG93aW5nIGlw
ayBwYWNrYWdlcyBhcmUgbWlzc2luZyBvciBkaWZmZXJlbnQgYW5kIG5vdCBpbiBleGNsdXNpb24g
bGlzdDogL2hvbWUvam9ja2UveW9jdG8teHIvYnVpbGQvaW5mbi14ci9nbWN1LQ0Kc3QvcmVwcm9k
dWNpYmxlQi90bXAvZGVwbG95L2lway8uL2NvcnRleGE1My0zMi9saWIzMi1hcmdwLXN0YW5kYWxv
bmUtc3RhdGljZGV2XzEuMy1yMF9jb3J0ZXhhNTMtMzIuaXBrDQoNCkFsc28sIEkgbmVlZCB0byBz
ZXQgU0FOSVRZX1RFU1RFRF9ESVNUUk9TID0gIiIgYW5kIHJlbW92ZSBJTkhFUklUICs9ICJidWls
ZGhpc3RvcnkiIGZyb20gbXkgKi5jb25mIGZpbGVzDQpiZWZvcmUgSSBjYW4gYnVpbGQuIFRyeWlu
ZyB0byBmaW5kIGEgd2F5IHRvIG51bGxpZnkgdGhlc2Ugd2l0aG91dCBoYXZpbmcgdG8gZWRpdCB0
aGUgKi5jb25mIGZpbGVzIGRpcmVjdGx5LCBhbnkgY2x1ZXM/DQoNCiBKb2NrZQ0KDQo=

