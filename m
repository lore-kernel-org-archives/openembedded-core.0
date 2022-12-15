Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC3B0C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 02:30:48 +0000 (UTC)
Received: from esa9.fujitsucc.c3s2.iphmx.com (esa9.fujitsucc.c3s2.iphmx.com [68.232.159.90])
 by mx.groups.io with SMTP id smtpd.web10.123554.1671071447136073516
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Dec 2022 18:30:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=l/utqDZ3;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.90, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1671071447; x=1702607447;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CHt9XmEx1hi5NN4Wn1XMQx2u8hPZVpsY3XoCpBE5Jtk=;
  b=l/utqDZ3wQyBjEtLb0xy5QxhDyEpX8OzxIbdp9KpfbJRi/4DpoKXg7d8
   LYnGEorRqwj75ENr6fA0A1q85AA++7DE05mTunYNs6M9zi5dyW8B4Ylq/
   3ulGQRQihWTbcKhxwHqPvzH1CthftQ9wtXzkyIwhpKu5Jk5llJmWGqkFN
   5k05PbyGGJexrPVbhdz827mbhA/RdTJnU6CvU5dj1XNHFLRWKHlqd55p3
   zh75t7UZuU+0UPYABRyGgtTNa463j/cPcq8G5asAicWgb6rTs/K2F78Rc
   5U3KrqsWiBAr8bBSSUymNLnmAG/7QUzWUaOBHVQacHx/9VhMaFJLCVIDD
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="72621409"
X-IronPort-AV: E=Sophos;i="5.96,246,1665414000"; 
   d="scan'208";a="72621409"
Received: from mail-tycjpn01lp2173.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.173])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2022 11:30:43 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFaRIuoZrKbkr1Z4kbJ7o3DwBYIf0z78fD9yVAZpipZ3Tq+4ktLdd7VWU1h63kXpf2n+pjGet6Yto1MIPXvNPZhX/w0yaXKX7KdpEmf8xlNSbVAxvOWD+55g6xC33JqmiQS+8EtGjhIEa4bg9631PzIGva0B+Rh/49OPhs4jIUAnmAloiwq/fh8/VlKQFPH0BOeOh2OWJfZ2OhvG4o52nmsGOnEZzNbtFhCZyzJjclxSmZ/OsZUkydWD2EkKhAhjWHvmxzakkOmtp73ZetxXuc+FlB6/Wy2AVFVWr2mO3s17BqlAULxWOHaC41Uu0PdD7tJDt2pD2mXnG/oZFgRozQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHt9XmEx1hi5NN4Wn1XMQx2u8hPZVpsY3XoCpBE5Jtk=;
 b=hgWfP8mz8ZSj677hGDbxNhre5ZncraoKy7FjRmjyOYQ1dPokEtjRui0eyf7JTj11HeJ0lZTh8yGDfUXv0HZpvqwcv2UmHZk1xKwoS/i9OxRpwChe2uXkRRSYMIuOPqCpDlvSq+wHcBYtj0W8ONwbCaQ8BtskFxEPnGZVMAOgHwvotunW+q85wj9EbWuaLudTAX/x3tjE7z3gwdzW8YZSX7DKJ30mewvXhSjQWHDHeoAKrhFbOcr8axzz/mOBkwUsrhn35NDCQD21LQVd7Sx+Rx1RyNN1YyrkTsxnX3OjzTPpNozNHubNYrsBS11AC3IgUbjUfte0eVAkTOsGST+/sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYCPR01MB6191.jpnprd01.prod.outlook.com (2603:1096:400:49::7)
 by OS3PR01MB10356.jpnprd01.prod.outlook.com (2603:1096:604:1f9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 02:30:40 +0000
Received: from TYCPR01MB6191.jpnprd01.prod.outlook.com
 ([fe80::cee4:8291:e7ac:36a7]) by TYCPR01MB6191.jpnprd01.prod.outlook.com
 ([fe80::cee4:8291:e7ac:36a7%5]) with mapi id 15.20.5924.012; Thu, 15 Dec 2022
 02:30:40 +0000
From: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
To: Andre McCurdy <armccurdy@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [oe-core][PATCH] libpng: Added "--enable-hardware-optimizations"
 instead of "--enable-arm-neon". Because "--enable-arm-neon" only works for
 armv7, but doesn't work for aarch64. But in fact neon is also enabled for
 aarch64 by default.
Thread-Topic: [oe-core][PATCH] libpng: Added "--enable-hardware-optimizations"
 instead of "--enable-arm-neon". Because "--enable-arm-neon" only works for
 armv7, but doesn't work for aarch64. But in fact neon is also enabled for
 aarch64 by default.
Thread-Index: AQHZDpv9lqVBHvhZ1kG832rrFvrMp65sXC4AgAHbzqA=
Date: Thu, 15 Dec 2022 02:30:40 +0000
Message-ID: 
 <TYCPR01MB619141A7E3C9701F6385DF38A0E19@TYCPR01MB6191.jpnprd01.prod.outlook.com>
References: <1670899095-3959-1-git-send-email-leimaohui@fujitsu.com>
 <CAJ86T=VSQ9YVvs76axGytFTzxVU0-DVyB9vEoWucteDY-bv-6Q@mail.gmail.com>
In-Reply-To: 
 <CAJ86T=VSQ9YVvs76axGytFTzxVU0-DVyB9vEoWucteDY-bv-6Q@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9YzkwZTlmMGQtNmM2YS00Yzg4LTg1YTktN2E3N2U3MTVj?=
 =?utf-8?B?NGJiO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMi0xMi0xNVQwMjoxMTo1NFo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB6191:EE_|OS3PR01MB10356:EE_
x-ms-office365-filtering-correlation-id: c86196c6-7977-4693-1d07-08dade445bd2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /qoZD+5LB4oMSlb/ZdOYteiyZfKr9yGrdZcnvG07iAKQsU8hmIbVNroBssjiPk3herMB/0MtQ5zfGYpPIwWN7wNtRLufMI06gXMbu4hEMRM+nc4UBOa3boU4R/vGN+hA/Mbfl8JfTKyBoRHUrYztUgZGUqe3OQ3gURX/VCBPwpkc579Pl4TbFoXFOvgVcScanktQF9hAuFXfli1fW6c65XNr2dRBW1H5TItIPzA8ZxnmIPCHQjm8ADOFeNdlaKbCTUs7/SRmXMiCZGLurWcoz4XbDuJwD9GzcHjyRY5t79mq7vUibmMRh0UCDsvjHeWwm+Y/EUe12J9WjzqnfZtOBghvmmswtmyWGUGvQRbwhrsrIP7Nh2ynJGPvGWj7Lsn4CjbEF36kY07D23lrIXkjCJXAfWw8kcHGRIulAUylyj6GqGMi7/kBuDyMBl9B5bixQ+4cCuhOuewzh0k8kbmsCDPeiah1fVl8ajW+LxHzEBBVmk3S+Zpe7mdPVZ2GiiXi6L6nsjYFknQdldPCwgT6yP7uaukzw2xeSaInhWrjfkVw/avdRvKAgucQBYUcmyNFQzpB8dXFGUvFONvMHbrSS5mk73fGCxqWX5gfEN1DFHuZEj7sekwhP/eFduE8D2HTEtSFDyUA+yU26AmMAUqPtxqU/xoZUQTGStrumEf864N6iipSnWyoj5H69ENC1tpPzugN3Z4Mpk1j+dWpiLCxH6R4KwHc+XSm1yYYmkME4fgokeC1G8Vo3oGGtD1kJhlIIUDb2oEZMiMg4h/z54SUiP4be7bvIANPVeNkqpgJVRZqWXuBrF3jvz//GtR10Byq
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB6191.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(1590799012)(451199015)(38070700005)(55016003)(85182001)(86362001)(33656002)(316002)(6916009)(478600001)(966005)(52536014)(71200400001)(2906002)(66446008)(64756008)(8676002)(4326008)(66556008)(66476007)(76116006)(8936002)(66946007)(5660300002)(41300700001)(38100700002)(82960400001)(122000001)(9686003)(26005)(186003)(7696005)(6506007)(53546011)(83380400001)(1580799009)(66899015)(219693005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TG5qaGNuODVwOWhOeTNTbmFEUW05Y2pCdTI5WW9qUlpNOGh4UEpqRTRRN2hm?=
 =?utf-8?B?bStzU1B2N3pHOGx0OE9kSlJLTlR5ZWU1czQ5TjJCSEpGWXdKaG5TeVpnMWR6?=
 =?utf-8?B?bHBRNVlNTTZhWWQ3R1B3NjFDMWdCVnFabHhVbjYvUnowdklBb2tPaGp3c295?=
 =?utf-8?B?RWJBaTRGUGRqeGVSM2hMaDF5NW9lQ2NnMGdRZDJQUTdKM2lNcjlsSmt4WUx5?=
 =?utf-8?B?VlB5MW8xNit2WTI2R0JFc2F0OUxFWG9jVUZRYVVVZDV0RDBoVXRKUFo2VnlD?=
 =?utf-8?B?amYyaFBYemtvR3BaZ2lnQUd4a050ckhMZEhpYitoZ2VNbWgydWNYekJuRTlM?=
 =?utf-8?B?ODVxWTBJamRvV3o0WUEzWS9nK3Y3d002clpBL3FzNFdkWWRKUUV3U0RYUEhF?=
 =?utf-8?B?OE0xUXlGc1FaUGt5dkQrYndJOElMaDhWc1BLSDdsVG1LRW5SVFRuZE01TUdq?=
 =?utf-8?B?NlNTLzBTRUlvQ1doOG80V2RmUjUzMVU5TE9PUGNZSVhoYS9RMnEvVW9lRkU0?=
 =?utf-8?B?UHZXRlR5NzFqZzRmNFdYV280eG9pam1rRzE5MG9DeVcxLzMzSjJMUXM5MURM?=
 =?utf-8?B?T3F5RktucktqbDRsNklQQnBKZGJ4YXNlR0xZNmFrT1dQUEVzSHRmaWx5TEg0?=
 =?utf-8?B?K0lkSGhSYlBBK0tVYlppdWVyeWljMGM4am1YOFAyUUxkL1gwSjg2VUZKM2RS?=
 =?utf-8?B?T0VOOGtmS082YmkwamZnTHBZeHRwcWM1ajlnb0lqaTk3OEZoMEl3WnRwVUMx?=
 =?utf-8?B?NWlsSXVENlQzeS9zckhzamprYUEzYTBFNzJwUU0wdGxpUzZzNEZLSXJ3cS82?=
 =?utf-8?B?ZERFaEhtdWZPODBjMWhRcG1uaDZkWWNKN3FJTzlDUEZxSEVQbElPTUR5V1FF?=
 =?utf-8?B?a0VVUGovdVdXb1lGWkdVTXFUcGxQcHNRNVlDNGlQSzhRTnBCWm5oZ21NUHNz?=
 =?utf-8?B?dDhmUHNyZUtKVHo2M2YrWloxRlVIL3hJQ1JBbGZTcGtWSXc1c2xKTVpMdVZF?=
 =?utf-8?B?QW1zdmxiSy85cWQ1cmU5ZmFpb2c2VndnR2UxZHltdE8rRUZNb0R5eGc2Rlhx?=
 =?utf-8?B?TkcrQnJiUGVNWDMybUFuUFh4K21HbWx4QkM5Y1VDRFY0ZzNmZUVRRDRVcDFi?=
 =?utf-8?B?b2R4amZNWUcxc3dOUlY3NzJqYUR4VXM1bkt5K1dIR25INmMvTjN1Q1kwMUZ5?=
 =?utf-8?B?ZzFiL1VidENTOVYraVhxcVVOdTFmM1lDOGVMZlQ5NjlOdGh3RkxzWTBqUDlR?=
 =?utf-8?B?RHJDYXdzTEJCOTFCY1orV3lSVitmeGY5dWVudVBlNk9ZQ044MW1yUzNKQm54?=
 =?utf-8?B?V3ZBWnVrK2tIRWFqcm9vTk1ubVdDcG1XRlBlZzNuTkpHdVhaL1hrU1VnVWNK?=
 =?utf-8?B?aWJJSi81RUhhbENJTmJXY3ZXMWF6UVNQczFCVXdlYjYvaFl4blBHd2VYVTRk?=
 =?utf-8?B?bFBqRUVWWDJacjVVZGVrR1NmU293S1Y3cUgyRHlBWmJrRGMweDRocitIY0Na?=
 =?utf-8?B?K2NGMG9jemcyNE81Yi9ISnFTb0dENnQ3d05VUFFVSU9RV3d0SWhPQ3dJQzhN?=
 =?utf-8?B?Y1NmcElkeFhJWFdJR2haVFRjWXkyTFNkZWZwTUkvbkJ6VzA4SGVZekpJMXpT?=
 =?utf-8?B?S1FCd3p3THNnd0FGWnRFL1N2RE5vMHNlcTBBOXl3QXptQlErcDU4Tm4ycENE?=
 =?utf-8?B?YkNvd1ovWTlBaC80STExcWtSbWIrS0NnMitEd0JnRVNIVTM1UVJhKy83MDRO?=
 =?utf-8?B?QWhLRm9BNlFyTTR1UkN3RkFUcVhLVFhpOHBPQmpoa0Irck5sWWxMcitzdFc1?=
 =?utf-8?B?SFF1VG93eWNJNjZqRDZHUlNIS2FrSkhBZ0xFY0IrRGlrZCtBenFCc0RoTS85?=
 =?utf-8?B?K0YxMGVxNkxZOEFMMjVVNUdPcnFlUEJDN3RrV1d3TXRpQ3lwcmZ4UVp6dVow?=
 =?utf-8?B?SG9qR3MxRlFBMEhNcVF5dnNKZkl4QkZSN1hONFZ0MStuUVg1M0I4eVEvVnRX?=
 =?utf-8?B?ZkY5SlRHYVAvZ3BCdnBWSktGTkg0VGNXcDZoVXc0Ni92R3hNZ1VuTzAzUmxh?=
 =?utf-8?B?aFdLeVBDWTF1SzZ6Ti9pYmlic0YvV1BqeTE4R1FFUnRQT2hYYk0xUm1pUFVx?=
 =?utf-8?Q?dxx/jt9iRH4ZSbQE/dr+QQZCH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6191.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c86196c6-7977-4693-1d07-08dade445bd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2022 02:30:40.5673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VWsFgkgE+n/3BclsH23URpF/bUUjhYSIAFn49x127CnFG4qb+dvu8Rdil8vhtdRlca87Qh8vf8ImV6DN9RtKOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10356
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 02:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174560

DQo+IEl0J3MgZGlmZmljdWx0IChpbXBvc3NpYmxlPykgdG8gYXV0b21hdGljYWxseSBkZXRlY3Qg
d2hldGhlciBhbiBBUk0gdGFyZ2V0IHN1cHBvcnRzDQo+IE5FT04gYXQgYnVpbGQgdGltZSwgc28g
dGhpcyBsb29rcyB1bmxpa2VseSB0byB3b3JrLg0KPiBUZXN0aW5nIGZvciBORU9OIGVpdGhlciBu
ZWVkcyB0byBoYXBwZW4gYXQgcnVuIHRpbWUgb3IgdGhlIGluZm9ybWF0aW9uIG5lZWRzIHRvDQo+
IGJlIHBhc3NlZCBmcm9tIHRoZSBidWlsZCBzeXN0ZW0gYXMgYW4gZXhwbGljaXQgY29uZmlndXJl
IG9wdGlvbiAoaWUgdGhlIG9yaWdpbmFsDQo+IGFwcHJvYWNoIGhlcmUpLg0KPiANCj4gSWYgeW91
IGRvbid0IHdhbnQgdG8gcGFzcyBORU9OIG9wdGlvbnMgdG8gNjRiaXQgQVJNIHRhcmdldHMgdGhl
biBhZGQgYW4NCj4gb3Zlci1yaWRlIHdoaWNoIG9ubHkgYXBwbGllcyB0byAzMmJpdCBBUk0gdGFy
Z2V0cy4NCj4gDQo+IE9yIGluIHRoaXMgY2FzZSwgaWYgdGhlIGNvbmZpZ3VyZSBzY3JpcHQgaXMg
d3JvbmcgdG8gdHJ5IHRvIGVuYWJsZSBORU9OIGZvciA2NGJpdCBBUk0NCj4gdGFyZ2V0cywgcGF0
Y2ggdGhlIGNvbmZpZ3VyZSBzY3JpcHQgYW5kIHN1Ym1pdCB0aGUgcGF0Y2ggdXBzdHJlYW0uDQoN
CkkgZ290IGl0Lg0KSW4gZmFjdCwgSSBzdWJtaXR0ZWQgdGhpcyBwYXRjaCBiZWNhdXNlIEkgbWV0
IGEgY29uZmxpY3QgZXJyb3Igd2hlbiBJIGVuYWJsZSBtdWx0aWxpYiBvbiBhYXJjaDY0LiBUaGUg
Y29uZmxpY3QgcmVhc29uIGlzIHRoYXQgbXkgbGliMzItbGlicG5nIGVuYWJsZWQgTkVPTiBidXQg
bGlicG5nKDY0Yml0KSBkaWRuJ3QgZW5hYmxlIE5FT04gYWx0aG91Z2ggTkVPTiBpcyBlbmFibGVk
IGZvciBhbGwgYWFyY2g2NCBieSBkZWZhdWx0Lg0KQnV0IGl0IGxvb2tzIGxpa2UgaXQgaXMgbm90
IGEgZ29vZCB3YXkgdG8gYWRkZWQgIiAtLWVuYWJsZS1oYXJkd2FyZS1vcHRpbWl6YXRpb25zPW9u
ICIgZm9yIGFsbCB0YXJnZXQuIA0KU28gaG93IGFib3V0IHRvIHVwZGF0ZSBteSBwYXRjaCB0byBW
MiBhcyB0aGUgZm9sbG93aW5nOg0KDQotRVhUUkFfT0VDT05GOmFwcGVuZDpjbGFzcy10YXJnZXQg
PSAiICR7QGJiLnV0aWxzLmNvbnRhaW5zKCJUVU5FX0ZFQVRVUkVTIiwgIm5lb24iLCAiLS1lbmFi
bGUtYXJtLW5lb249b24iLCAiLS1lbmFibGUtYXJtLW5lb249b2ZmIiwgZCl9Ig0KK0VYVFJBX09F
Q09ORjphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0gIiAke0BiYi51dGlscy5jb250YWlucygiVFVORV9G
RUFUVVJFUyIsICJuZW9uIiwgIi0tZW5hYmxlLWFybS1uZW9uPW9uIiwgIiAiLCBkKX0iDQorRVhU
UkFfT0VDT05GOmFwcGVuZDphYXJjaDY0ID0gIiAtLWVuYWJsZS1oYXJkd2FyZS1vcHRpbWl6YXRp
b25zPW9uICINCg0KQmVzdCByZWdhcmRzDQpMZWkNCg0KDQoNCg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZHJlIE1jQ3VyZHkgPGFybWNjdXJkeUBnbWFpbC5jb20+
DQo+IFNlbnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIgMTQsIDIwMjIgNTo0OSBBTQ0KPiBUbzogTGVp
LCBNYW9odWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtvZS1jb3JlXVtQQVRDSF0g
bGlicG5nOiBBZGRlZCAiLS1lbmFibGUtaGFyZHdhcmUtb3B0aW1pemF0aW9ucyINCj4gaW5zdGVh
ZCBvZiAiLS1lbmFibGUtYXJtLW5lb24iLiBCZWNhdXNlICItLWVuYWJsZS1hcm0tbmVvbiIgb25s
eSB3b3JrcyBmb3INCj4gYXJtdjcsIGJ1dCBkb2Vzbid0IHdvcmsgZm9yIGFhcmNoNjQuIEJ1dCBp
biBmYWN0IG5lb24gaXMgYWxzbyBlbmFibGVkIGZvciBhYXJjaDY0DQo+IGJ5IGRlZmF1bHQuDQo+
IA0KPiBPbiBNb24sIERlYyAxMiwgMjAyMiBhdCA2OjM4IFBNIGxlaW1hb2h1aSA8bGVpbWFvaHVp
QGZ1aml0c3UuY29tPiB3cm90ZToNCj4gPg0KPiA+IFJlZmVyZW5jZSB0byBsaWJwbmctMS42LjM4
L2NvbmZpZ3VyZSxpZiBlbmFibGVfaGFyZHdhcmVfb3B0aW1pemF0aW9ucw0KPiA+IGlzIGVuYWJs
ZWQsIGxpYnBuZyBjYW4ganVkZ2Ugd2hldGhlciBlbmFibGUgZW5hYmxlX2FybV9uZW9uIGFjY29y
ZGluZw0KPiA+IHRvICRob3N0X2NwdS4NCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+ID4gJCBjYXQgbGlicG5nLTEuNi4zOC9jb25maWd1cmUNCj4gPiAuLi4u
Li4NCj4gPiBpZiB0ZXN0ICR7ZW5hYmxlX2hhcmR3YXJlX29wdGltaXphdGlvbnMreX0NCj4gPiB0
aGVuIDoNCj4gPiAuLi4uLi4NCj4gPiAgICAgICAgICAjIGFsbG93IGVuYWJsaW5nIGhhcmR3YXJl
IG9wdGltaXphdGlvbiBvbiBhbnkgc3lzdGVtOg0KPiA+ICAgICAgICAgIGNhc2UgIiRob3N0X2Nw
dSIgaW4NCj4gPiAgICAgICAgICAgICBhcm0qfGFhcmNoNjQqKQ0KPiA+ICAgICAgICAgICAgICAg
ZW5hYmxlX2FybV9uZW9uPXllcw0KPiA+DQo+ID4gcHJpbnRmICIlc1xuIiAiI2RlZmluZSBQTkdf
QVJNX05FT05fT1BUIDIiID4+Y29uZmRlZnMuaCAuLi4uLi4NCj4gPiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBMZWkgTWFv
aHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+DQo+ID4gLS0tDQo+ID4gIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2xpYnBuZy9saWJwbmdfMS42LjM4LmJiIHwgMiArLQ0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcvbGlicG5nXzEuNi4zOC5iYg0KPiA+IGIv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbGlicG5nL2xpYnBuZ18xLjYuMzguYmINCj4gPiBpbmRl
eCBkYzYyNzIwM2VmLi43ZGE3MWQ5ZDNiIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2xpYnBuZy9saWJwbmdfMS42LjM4LmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvbGlicG5nL2xpYnBuZ18xLjYuMzguYmINCj4gPiBAQCAtMjIsNyArMjIsNyBA
QCBCSU5DT05GSUcgPSAiJHtiaW5kaXJ9L2xpYnBuZy1jb25maWcNCj4gJHtiaW5kaXJ9L2xpYnBu
ZzE2LWNvbmZpZyINCj4gPiAgaW5oZXJpdCBhdXRvdG9vbHMgYmluY29uZmlnLWRpc2FibGVkIHBr
Z2NvbmZpZw0KPiA+DQo+ID4gICMgV29yayBhcm91bmQgbWlzc2luZyBzeW1ib2xzDQo+ID4gLUVY
VFJBX09FQ09ORjphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0gIg0KPiAke0BiYi51dGlscy5jb250YWlu
cygiVFVORV9GRUFUVVJFUyIsICJuZW9uIiwgIi0tZW5hYmxlLWFybS1uZW9uPW9uIiwNCj4gIi0t
ZW5hYmxlLWFybS1uZW9uPW9mZiIsIGQpfSINCj4gPiArRVhUUkFfT0VDT05GOmFwcGVuZDpjbGFz
cy10YXJnZXQgPSAiIC0tZW5hYmxlLWhhcmR3YXJlLW9wdGltaXphdGlvbnM9b24gIg0KPiANCj4g
SXQncyBkaWZmaWN1bHQgKGltcG9zc2libGU/KSB0byBhdXRvbWF0aWNhbGx5IGRldGVjdCB3aGV0
aGVyIGFuIEFSTSB0YXJnZXQgc3VwcG9ydHMNCj4gTkVPTiBhdCBidWlsZCB0aW1lLCBzbyB0aGlz
IGxvb2tzIHVubGlrZWx5IHRvIHdvcmsuDQo+IFRlc3RpbmcgZm9yIE5FT04gZWl0aGVyIG5lZWRz
IHRvIGhhcHBlbiBhdCBydW4gdGltZSBvciB0aGUgaW5mb3JtYXRpb24gbmVlZHMgdG8NCj4gYmUg
cGFzc2VkIGZyb20gdGhlIGJ1aWxkIHN5c3RlbSBhcyBhbiBleHBsaWNpdCBjb25maWd1cmUgb3B0
aW9uIChpZSB0aGUgb3JpZ2luYWwNCj4gYXBwcm9hY2ggaGVyZSkuDQo+IA0KPiBJZiB5b3UgZG9u
J3Qgd2FudCB0byBwYXNzIE5FT04gb3B0aW9ucyB0byA2NGJpdCBBUk0gdGFyZ2V0cyB0aGVuIGFk
ZCBhbg0KPiBvdmVyLXJpZGUgd2hpY2ggb25seSBhcHBsaWVzIHRvIDMyYml0IEFSTSB0YXJnZXRz
Lg0KPiANCj4gT3IgaW4gdGhpcyBjYXNlLCBpZiB0aGUgY29uZmlndXJlIHNjcmlwdCBpcyB3cm9u
ZyB0byB0cnkgdG8gZW5hYmxlIE5FT04gZm9yIDY0Yml0IEFSTQ0KPiB0YXJnZXRzLCBwYXRjaCB0
aGUgY29uZmlndXJlIHNjcmlwdCBhbmQgc3VibWl0IHRoZSBwYXRjaCB1cHN0cmVhbS4NCj4gDQo+
ID4gIFBBQ0tBR0VTID0rICIke1BOfS10b29scyINCj4gPg0KPiA+IC0tDQo+ID4gMi4yNS4xDQo+
ID4NCj4gPg0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4gTGlua3M6IFlvdSByZWNl
aXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+ID4gVmlldy9SZXBseSBPbmxp
bmUgKCMxNzQ1MDYpOg0KPiA+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5l
bWJlZGRlZC1jb3JlL21lc3NhZ2UvMTc0NTA2DQo+ID4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvOTU2Mzc0OTQvMzYxOTAzMA0KPiA+IEdyb3VwIE93
bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4g
VW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRl
ZC1jb3JlL3Vuc3ViDQo+ID4gW2FybWNjdXJkeUBnbWFpbC5jb21dDQo+ID4gLT0tPS09LT0tPS09
LT0tPS09LT0tPS0NCj4gPg0K

