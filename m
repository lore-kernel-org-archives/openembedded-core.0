Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335B5EB64DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 09:39:29 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.48])
 by mx.groups.io with SMTP id smtpd.web11.3759.1689932365153347745
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 02:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3AjsejvL;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3AjsejvL;
 spf=pass (domain: arm.com, ip: 40.107.104.48, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+gZGWQfiuXUla22bh5lhLLsjDbA6CnivhHa23iFhA4=;
 b=3AjsejvLuk4rA7jC2818RLPnqWX0NYv6TntEo1vypoV0pLxaBY+iQMCxkE/giFaTEVP+HnzXXK0dzk1osn7K1YLFaerLqIkbStG7sUbgFhrB/qbQldGZTWMv7AxAaPq5Bzy4rNJQSheM2UJcPdTkFj3OSrda+IhZbyA+n05Jspo=
Received: from DUZPR01CA0281.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::9) by DB9PR08MB6716.eurprd08.prod.outlook.com
 (2603:10a6:10:2a9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 09:39:17 +0000
Received: from DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b9:cafe::56) by DUZPR01CA0281.outlook.office365.com
 (2603:10a6:10:4b9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25 via Frontend
 Transport; Fri, 21 Jul 2023 09:39:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT029.mail.protection.outlook.com (100.127.142.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.28 via Frontend Transport; Fri, 21 Jul 2023 09:39:17 +0000
Received: ("Tessian outbound f9124736ff4f:v145"); Fri, 21 Jul 2023 09:39:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f870b4b3bd8da7d1
X-CR-MTA-TID: 64aa7808
Received: from 2737394724ba.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6CBCA8B5-F64A-434F-B595-92D7B98DA088.1;
	Fri, 21 Jul 2023 09:39:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2737394724ba.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 21 Jul 2023 09:39:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYULsuxjQUaGVgf8wRvdF59Pa9JHOqGjSdg+9WP7GpUb0i9rhgRXG9kNPI0HJIurQOzIiavW9guJqC8SjZk5hy8Hyl8yuCblS27sshTn89IAs7tSHWoYDRburhcctyw90g4QdIde+uYQByafhH1Tqctn4wUWLc3pSRiCNCT4+IwywWmd/DSCXwjgRYkzjr1pCEt4hDT4uI/+1atCRBC7+jQzIfO/DJWiWVrfb9RJp3o41a7lFaiTzXxuJDPuTuJ8MYuCF1bWuEwHuSBH3PL+N9bWHtOjtwV5tgIQvVVUz5hyURYfYyNPHBn8q0Rr2b7FfDhqpQPT0X7X1a0JZSt03Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+gZGWQfiuXUla22bh5lhLLsjDbA6CnivhHa23iFhA4=;
 b=UA2eOW9w7gPF4sv5CsajETW+Rxslo92qS8ZOMCcGqyUchDUyIG+faZybywFrtyOeoUWeimKt/r1p2S2BBhgUwLwNbmR/gIEFWawg8IN9LW2ygWDfZtuAdPXayCHeyArMLYmZwZSnSVtT6h3xHW+qX1z3ChrjR7yNsNexY5aff79RXHD/LqSa4svIWmgxoKQdicENgUGZMLGMB9qtP8wWt7uVaP5cqw8TL3i6fw9yQ7XDUKC1SRy+zbPdUmi0uLOrXCD1BZzq0YmJmzDM0LqXTRDMux8Nf+S7xmW19FhdoNmyio3RHFwmD8tdDQFk4DpdGHHVe/UR5Z+wdw2vY3PojQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+gZGWQfiuXUla22bh5lhLLsjDbA6CnivhHa23iFhA4=;
 b=3AjsejvLuk4rA7jC2818RLPnqWX0NYv6TntEo1vypoV0pLxaBY+iQMCxkE/giFaTEVP+HnzXXK0dzk1osn7K1YLFaerLqIkbStG7sUbgFhrB/qbQldGZTWMv7AxAaPq5Bzy4rNJQSheM2UJcPdTkFj3OSrda+IhZbyA+n05Jspo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB7346.eurprd08.prod.outlook.com (2603:10a6:150:21::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Fri, 21 Jul
 2023 09:39:07 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::67ae:749a:f0aa:f239]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::67ae:749a:f0aa:f239%4]) with mapi id 15.20.6609.025; Fri, 21 Jul 2023
 09:39:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "ycnakajsph@gmail.com" <ycnakajsph@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>,
	"mbadreau.ext@esme-solutions.com" <mbadreau.ext@esme-solutions.com>,
	"contact@coreycothrum.com" <contact@coreycothrum.com>,
	"ycardaillac.ext@esme-solutions.com" <ycardaillac.ext@esme-solutions.com>
Subject: Re: [OE-core] [yocto][bitbake] variable expansion in files
Thread-Topic: [OE-core] [yocto][bitbake] variable expansion in files
Thread-Index: AQHZu7VGM/IA2AuLq0+JllYhgTFLLa/D9usA
Date: Fri, 21 Jul 2023 09:39:07 +0000
Message-ID: <DBA5C54E-41F9-4F40-A2DA-9A5037429B0D@arm.com>
References: 
 <CAC3TgA+XEUtkpJ4U98Nn=CeRt9+CWWPj1XuZ8A0x+UVti4fv7g@mail.gmail.com>
In-Reply-To: 
 <CAC3TgA+XEUtkpJ4U98Nn=CeRt9+CWWPj1XuZ8A0x+UVti4fv7g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB7346:EE_|DBAEUR03FT029:EE_|DB9PR08MB6716:EE_
X-MS-Office365-Filtering-Correlation-Id: 8801619a-71a2-4c79-5d4e-08db89ce5a2e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 UzCKn8cCbvD2tFivj8euqm2W+Mm+0f1P3M8aAoYKCqe/+c+6svkego1+dT9hg3bALxvPTUyUC5TtzfXmUKVIIqMgrDso04P/4kdXJqO+8Ijqx3eA83bkxQX1s0aaFUQeJKIvRDzFudrPUXp+FZ5RSBhIhu48RVwfKWEBThAdRfj5KyxN9deMjCam+83PQLZ6V0mIovwv0qSDzXJKwR/3p1Fq3vvVjPwjmEo61h3e7bom8hCv2oYkJdWCw5KdE7WGiVyt386P5nZRjD0tbxVUF1xkAq6tjY1+iETblkszZ0aJbw+M0vUzpfneeAKermB15Y/nzE66BX2XJss6q5KhB8dDKReNRdQYVrjHU6SUduTbwfj0CX6Yv/I4f15EhRjoqxM7dTff2QJspUIrZzeFVP+IgcaLRcfRKaLnwvwZKrUvx+Lng9qCBxPCh2pUYbvZk8YCMp8ni3TflFAwG/65tOrAT7TVHrlr86oCFprq21BtnPMOhvNhW/vHCML1S6TlaviOEZtXceKtcXlmKZFt2yXuSxF/SaSbBsNNLWCLo3D4uHb/bVmGPVWS5z32mSir+Kx16q+lMbn0GGNqQeEeib6E6XHUY865K9rGjN8O92t3xftxYgaUaF4Ei1d/9zotwwa4Nvni3RME/7s3xEL2sGhaFSwd3fPHicwWyz/d2CRtraU3rDYiP0+KWaH0lbrz
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199021)(5660300002)(4326008)(2616005)(8676002)(41300700001)(66946007)(66556008)(91956017)(6916009)(2906002)(66446008)(316002)(76116006)(64756008)(8936002)(6512007)(71200400001)(6486002)(54906003)(966005)(26005)(6506007)(53546011)(186003)(83380400001)(66476007)(33656002)(36756003)(86362001)(38100700002)(38070700005)(478600001)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <640D29BFE206694C98FA861FC968B1AD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7346
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	426f67bb-f85c-4e24-fa35-08db89ce5429
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	v2mnc5S9TrBNRYA3m3XrV78ychILkoX3PaCaSCzraT7Uom7khlWC1kTRdVrG3wAGtikvpE7Xac07kjIDqWmcKPE5uH65sjm0eE8pSNPoOzTSrWWWapEYnGijbne2EQK0B2cGix9iEDuwgfIPV0bC6V7QCpGKtbtPIdhfaxVnV8SltKldQlvj9KX8O4WgZmdsmwpsClQ9Zy7EQ3qR7cba6428POvQEta/GtM0PpDQvEqD5NkOiq59/icSNTVek7rv5oiQGpDGei7/eRy00a5a6d1DXwgFizt7YrRf4aiQxOJZOQJGvDRO5MmYXWsRTlfBbpPANH0ngKG/NPWIue4mwiVz3AS+v6Uf0wMkBt+DiPLVpV+Qw0ArCPUYx6F08qOn6VPWbWM3AF8HA2EC9KYx0AP+vu04RFLtLGSmsUOMOBz4J3huzO4GqMQRteFlCSrJZzE8WXivylcfrS96H1FkQCx3PiX+Ea2ybTEizC5nicMSaBSp/qwAE+Apkw3R1oPPVPD/uAME4TTUIY1ZUea3nll8SxMv/i2kWuVoudAZBmFWTh619aI2QgRW2LtC551J7a+w/z1Mjzs/s39QfEj5OX9KKbQYn92Wb6OYRdq+fjYwcSbIT16cpmKKil+TouVsXC66vYQdG/xG2tYgxw6ep7tF8wsNX8xgs/g3oZOIhI4Tl7NT6jMtUEdP9WVjJKZwg4tz30HTqCtHGCoEQsch9tg8KKskJfF7cBsitUv7dy6dcRZ0agd3QPHlkDfFao1DIk+TpZvIYiu3BL1OI+YQ2Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(136003)(39860400002)(82310400008)(451199021)(46966006)(36840700001)(40470700004)(53546011)(40480700001)(26005)(186003)(336012)(6506007)(107886003)(40460700003)(6862004)(41300700001)(5660300002)(36756003)(316002)(4326008)(70586007)(54906003)(70206006)(33656002)(478600001)(8936002)(8676002)(6486002)(6512007)(966005)(82740400003)(86362001)(36860700001)(83380400001)(2616005)(2906002)(47076005)(356005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 09:39:17.2313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8801619a-71a2-4c79-5d4e-08db89ce5a2e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6716
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 09:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184681

T24gMjEgSnVsIDIwMjMsIGF0IDEwOjI0LCBZYW5uIENBUkRBSUxMQUMgdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPHljbmFrYWpzcGg9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiBUaGVyZSdzIHNvbWV0aGluZyB0aGF0IGhhcyBhbHdheXMgYmVlbiBtaXNzaW5n
IGluIG15IGV4cGVyaWVuY2Ugb2YgWW9jdG8sIGl0J3MgdGhlIGFiaWxpdHkgdG8gc2ltcGx5IGNv
bmZpZ3VyZSBmaWxlcyB3aXRoIHlvY3RvIHZhcmlhYmxlcy4NCj4gDQo+IEJhc2ljYWxseSB0aGUg
aWRlYSBpcyB0byBoYXZlIGEgY2xhc3MgdGhhdCB3aWxsIGF1dG9tYXRpY2FsbHkgc2VkIGFsbCB2
YXJpYWJsZXMgZnJvbSB5b2N0byBpbnNpZGUgYSBmaWxlIHVzaW5nIGEgZGVsaW1pdGVyLCBvciB0
byByZXVzZSB0aGUgd2F5IGl0IGlzIGRvbmUgd2l0aCAud2tzLmluIHdpdGggdGhlICR7dmFyfSBz
eW50YXgsIGV2ZW4gaWYgSSBjYW4gYWxyZWFkeSBzZWUgc29tZSBsaW1pdGF0aW9ucyB3aXRoIHNo
ZWxsIHNjcmlwdHMuDQo+IA0KPiBXaGF0IEkgaW50ZW5kIHRvIGRvIGlzIHRvIHByb3ZpZGUgc29t
ZSB2YXJpYWJsZXMgdG8gYSByZWNpcGUgYW5kIHRoZW4gdG8gdXNlIHRoZW0gdG8gY29tcGxldGUg
YSB0ZW1wbGF0ZS4gDQo+IA0KPiBGb3IgaW5zdGFuY2UgSSdkIGxpa2UgdG8gcHV0IHNvbWUgc3R1
ZmYgaW5zaWRlIG15IG1hY2hpbmUuY29uZiBhbmQgd2FudCB0aG9zZSB2YXJpYWJsZXMgdG8gYmUg
ZmlsbGVkIGluc2lkZSBteSB0ZW1wbGF0ZWQgc2NyaXB0Lg0KPiANCj4gSXMgdGhlcmUgYW55IG9m
ZmljaWFsIHdheSB0byBkbyB0aGlzPw0KPiANCj4gQXMgZmFyIGFzIEkgY2FuIHNlZSB0aGVyZSdz
IG5vdCwgdGhlIG9ubHkgZXhhbXBsZXMgSSd2ZSBmb3VuZCBhcmUgdXNpbmcgaGFuZCBtYWRlIHNl
ZHMuIEJ1dCBJIG1pZ2h0IG5vdCBiZSBsb29raW5nIGluIHRoZSByaWdodCBwbGFjZS4NCj4gDQo+
IElmIEknbSByaWdodCwgSSdtIHdvbmRlcmluZyB3aHkgdGhpcyBpcyBub3QgZ2VuZXJhbGl6ZWQg
aW5zaWRlIGEgcG9reSBjbGFzcy4gSSd2ZSBmb3VuZCB0aGlzIG1ldGEgOiBodHRwczovL2dpdGh1
Yi5jb20vY29yZXljb3RocnVtL21ldGEtYml0YmFrZS12YXJpYWJsZS1zdWJzdGl0dXRpb24gZG9p
bmcgZXhhY3RseSB3aGF0IEkgbmVlZGVkLCBidXQgc2luY2UgaXQncyBub3QgbWFpbmxpbmUgSSBh
c3N1bWUgdGhhdCBhcyBhbHdheXMgdGhlcmUncyBhIGdvb2QgcmVhc29uIHdoeSBpdCdzIG5vdCBz
b21ldGhpbmcgeW91IHdhbnQgdG8gaGF2ZSBpbiBtYWlubGluZS4NCj4gDQo+IElmIHRoYXQncyBv
bmx5IGJlY2F1c2UgdGhlcmUgd2Fzbid0IGFueSBzdWJtaXNzaW9uIGFuZCBJZiB5b3UncmUgdXAg
Zm9yIGl0IGdvaW5nIG1haW5saW5lLCBJIGNhbiB3b3JrICh3aXRoIGNvcmV5Y290aHJ1bSBpZiBo
ZSB3YW50cyB0bz8pIGl0IHRocm91Z2ggdGhlIHBhdGNoIHN1Ym1pc3Npb24gcHJvY2Vzcy4NCg0K
VGhlcmXigJlzIGFsc28gYSBjbGFzcyB0aGF0IEkgaGFja2VkIHVwIGEgd2hpbGUgYWdvIHRoYXQg
SSBuZXZlciBmaW5pc2hlZCBiZWNhdXNlIEkgd2FudGVkIHRvIGF1dG9tYXRpY2FsbHkgaGFuZGxl
IHZhcmlhYmxlIGRlcGVuZGVuY2llcywgb3RoZXJ3aXNlIGl04oCZcyBubyBnb29kOg0KDQpodHRw
czovL2dpdGh1Yi5jb20vcm9zc2J1cnRvbi9tZXRhLXJvc3MvYmxvYi9tYXN0ZXIvY2xhc3Nlcy9i
YmluLmJiY2xhc3MNCg0KSeKAmWQgbGlrZSB0byBzZWUgc29tZXRoaW5nIGluIGNvcmUsIGJ1dCB0
aGUgc2NvcGUgc2hvdWxkIGJlIHJlbGF0aXZlbHkgdGlnaHQuICBJIGRvbuKAmXQgbGlrZSB0aGUg
YXV0b21hdGljIGV4cGFuc2lvbiB0aGF0IG1ldGEtYml0YmFrZS12YXJpYWJsZS1zdWJzdGl0dXRp
b24gZG9lcywgSeKAmW0gdGhpbmtpbmcgb2YgYSBwYXRob2xvZ2ljYWwgY2FzZSB3aGVyZSBwaWds
aXQgd2FudGVkIHRvIHVzZSBAQGJpbmRpckBAIGluIGEgd3JhcHBlciBzY3JpcHQ6IGl0IHdvdWxk
IGFsc28gYXR0ZW1wdCB0byBwcm9jZXNzIG1hbnkgZ2lnYWJ5dGVzIG9mIGluc3RhbGxlZCBmaWxl
cy4NCg0KVGhlIGJiaW4gY2xhc3MgX29ubHlfIHdvcmtzIG9uIGZpbGVzIGluIFNSQ19VUkksIHNv
IGZvby5zaC5iYmluIHdvdWxkIGJlIHByb2Nlc3NlZCBhdCBkb191bnBhY2sgYW5kIGVuZCB1cCBp
biBXT1JLRElSL2Zvby5zaC4gIFRoZSBzY29wZSBpcyBtb3JlIGxpbWl0ZWQgYnV0IHlvdSBrbm93
IGV4YWN0bHkgd2hhdCBpdOKAmXMgZG9pbmcuDQoNClJvc3M=

