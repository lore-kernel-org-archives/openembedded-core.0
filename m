Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C157EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 10:03:58 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.75])
 by mx.groups.io with SMTP id smtpd.web10.55218.1688465032107678298
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 03:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6PqtgEaw;
 spf=pass (domain: arm.com, ip: 40.107.6.75, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8eJ4baXUC/UX9TywEHSSrMpQnN1fzsVtHkYPQtm4BY=;
 b=6PqtgEawQHi8c647JhQJzndg75ilvobsmPXxFNTKMULvTvf39Y42ZFB+enKw8AVNOPV2Cd/gLTgamMKXk2PAgCbnVfUXMVAhyOAKURxqbt+gQXHCC4vAOoe62T5HuqRRTCq0XFaax5Ma5irCYxOQccwfbnOBOWYB2g/wxTcPYWU=
Received: from DU2PR04CA0288.eurprd04.prod.outlook.com (2603:10a6:10:28c::23)
 by PA4PR08MB6319.eurprd08.prod.outlook.com (2603:10a6:102:e8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 10:03:47 +0000
Received: from DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::dd) by DU2PR04CA0288.outlook.office365.com
 (2603:10a6:10:28c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.30 via Frontend
 Transport; Tue, 4 Jul 2023 10:03:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT039.mail.protection.outlook.com (100.127.142.225) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.18 via Frontend Transport; Tue, 4 Jul 2023 10:03:46 +0000
Received: ("Tessian outbound 7c913606c6e6:v142"); Tue, 04 Jul 2023 10:03:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f292bd5309dc28d9
X-CR-MTA-TID: 64aa7808
Received: from 58f9d04ed0d4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2C76A6A8-7DF0-406A-9A76-9342304CAA5C.1;
	Tue, 04 Jul 2023 10:03:40 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 58f9d04ed0d4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 04 Jul 2023 10:03:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBffTLdpgbS/Cz5ZSb5zKPmS+R/Ag20SClqMo+zLA/1FVFQgp3SdMAuD/cIcCxes6ApiHZ9WySwk77W9BLQtOC3RoRnbK/UUCf2ZMSuu1s2ZPR7joxCBD3wZfP/4HSGpyR9bBtpGQVF9MHJOCNIO+5B4ByZX+TfOgRT7QUHUlFE6ASHgGLSqEIzgw64eLwBrWmi5I07AtIg4T661hVIOiaCsGPg45mtIFSbuHJxYXdjm39Fh9ZdP2WQMZ7/GRQCVo/iFtvYMSWN1g2b2M9eeuX9B1NVdhxIviRL0awBnlNtdzBm5O157S0TO4YLjVoS3rGBmhAuFgZL9x0JJLCrP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8eJ4baXUC/UX9TywEHSSrMpQnN1fzsVtHkYPQtm4BY=;
 b=MoOnpWGx4uHImTG3vjglPm9HeW5SkLUDg/suWzw7lBUugzv8DVyc6DLJjPWE5eWukrM9XQKj1XcCC109Rc364fhC7aFRIIjImJEmKUyqVB+69q6tui2k9AmsEf+INOYeOS22zKSCDTWga49gqIeyT7sinTBsTlCkQMHDoRbteGvb6wvBI3kJFXijq+j8UZzkkqrDLDIiL11vNAEf20d7tcITHl0IiiefGiNN6Fz5PlkCn1iITCcyzLWC4qhppmkJxyuECY+CBBqM7pWfbdmYFxWshW7qvtobT7hFLIUrcKBbHNGxtryEGjAriXiH5+sfJFqLgg0t7vzTIzgFxFCi9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8eJ4baXUC/UX9TywEHSSrMpQnN1fzsVtHkYPQtm4BY=;
 b=6PqtgEawQHi8c647JhQJzndg75ilvobsmPXxFNTKMULvTvf39Y42ZFB+enKw8AVNOPV2Cd/gLTgamMKXk2PAgCbnVfUXMVAhyOAKURxqbt+gQXHCC4vAOoe62T5HuqRRTCq0XFaax5Ma5irCYxOQccwfbnOBOWYB2g/wxTcPYWU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB7671.eurprd08.prod.outlook.com (2603:10a6:102:245::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 10:03:37 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 10:03:37 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "quaresma.jose@gmail.com" <quaresma.jose@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] kernel-module-split add systemd modulesloaddir
 and modprobedir config
Thread-Topic: [OE-core] [PATCH] kernel-module-split add systemd modulesloaddir
 and modprobedir config
Thread-Index: AQHZrlZy1zhf6R6QFEeWGqPieDEecK+pYOCA
Date: Tue, 4 Jul 2023 10:03:37 +0000
Message-ID: <6E876A4F-1E4A-4520-A978-7EA0E142E267@arm.com>
References: <176D7A91B0AC29AF.23465@lists.openembedded.org>
 <CANPvuRnKUisRu9CgkQgv2d1WAr1+hmC_1yr8orLToPw3tcMqmg@mail.gmail.com>
In-Reply-To: 
 <CANPvuRnKUisRu9CgkQgv2d1WAr1+hmC_1yr8orLToPw3tcMqmg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB7671:EE_|DBAEUR03FT039:EE_|PA4PR08MB6319:EE_
X-MS-Office365-Filtering-Correlation-Id: 592b5276-5086-4710-5453-08db7c75f524
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 WEU2B2fR00m1uRXA5EBDJy6v49CLOtMWajtfgBsS11CxqI9BBNwqneO3tq33dvQtBmBEOKhFkLTZjNJww9DwKR3fcfT+trE2ENef8hxVX/Wq27kQy5TzFCNTkezkaAgBWt3R+dTJxLXHx6Ghiur8FmZuFT7fbprDYSRhy+mqoO8ka/w3UOE49vkDlA9N3OTlBkhGMX+m3OyA9f9BUItY1nMwAa8IJxFqJCAGIwlqUuhfVwR3VB7O6n7d0/nnuPMuRQbIyzqaiGI4XKV/sLBGR7iPAvlGAuoG1gOOsUupy/HPVfg9VpsV3/aujS4vJPcAVAudFde/OW3uOu6D2mzffN7oSoxU3RB3MgBtE9YgOrqZ9GGBtVAc7wPQgSTyjIpsfdz2RkqiTN16PNKBkYRMZeUP368OCDRBKJ+Es8G09dK9w8N/TQ0h7sl6kVeSyNiw/XkEO8vOcHxdlFn1PoLyn9GbqTVz3nVdtsxBE334MBzm9doLGKbG+ZDhBy5KPHjY51lvB8XYingP2zPQRxaeLxaMginbs64S8iwFEUh1/LO5Ufo4fMhz1pDp2CxHEDIgkuRFD9lx1YeTQfn5nYqmJVDWsiw9pjzE/dKF3Gg6IifQzEmEADcQug4pHQx5/zcsL0OzMXydyjW8XSTuRK84nEFO72ceZ7SFfAhhyE1ky634jSJWB1AXijeEMyuQfO3b
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(451199021)(41300700001)(86362001)(38100700002)(6486002)(2616005)(71200400001)(83380400001)(122000001)(186003)(6506007)(53546011)(26005)(6512007)(966005)(38070700005)(2906002)(478600001)(36756003)(316002)(66476007)(6916009)(4326008)(91956017)(76116006)(66446008)(66556008)(66946007)(8936002)(33656002)(64756008)(8676002)(66899021)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE66A0041DD0F147B8F8C5AF03A67E77@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7671
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	522fbb72-ee4a-4d38-cb26-08db7c75ef99
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ITKXUVl6p5Ghf3JE1dh0mouEinqDgGg4RMihHaMaj91nrRR1aX9n5bx/Rg22Ul/IcuFIVdcSSEwF8/vwmultblXLSeX0tTsRmxLK/9vZ9cRv3EOKAMrKDbJGaEUUnUDrboIwORCjFMUiDtqodjzjmtGagqE1z+0mylvkugyvPvKDn3nGA+TzukwEMnH/L1PNbJANM4vRGwBtcEbBxV2S2yQvLeZlDkZLOoqY45xs8YElwTqextFdiBtKCmNB5xESqDlT9LWPgAUHrdttcOfovzqbS0nnnY5lEjY+uDa9jMTGb2ymfhnbgsDnOFPcVrFEVexPntOiB11RvC+8k+bPTNXVtMNtn9jjLaHEK9CgQ/qmNUU7KkFhAs0wenmY5uBhIhHUVfmJi+vBtreqe/WvBq+w3/B5ppimCLrPoZ5kOXhEXJS8RenenNVF+TklsaPrLReFqyx4dH++sJE2BOtPWQH6TFLB7U881e4tDgaf72Q9WnVjF7u9+C/wANxHmo2oGr1kvNBHErc+pDqd09cIIsqPxnssfWmi49bc0Q/StOXrY1B1ddxbO5zjkaN4t+8Uk24LLzQBKSoJ2CiVpiEt6ywKc2pBJ9d+n/V9uNWK1265NvipkECXhv+zOloCIme7kcG+ulDYjyM7fpvw3YtPM4hijb6aBjfFi/nrO39Qg1DofYQUR/DDuQgC8kGhz3OWy5uF9zfjXkJmYOXZYJ7oy/TlZjSEqNBNlKQc5jLicYnUT3QPp26iOu6mO5zxHD61NA0Ltg4x67G3wCdQX9dwWA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(26005)(478600001)(6506007)(82740400003)(966005)(6512007)(86362001)(2616005)(186003)(53546011)(81166007)(4326008)(70586007)(36860700001)(83380400001)(356005)(336012)(6486002)(316002)(70206006)(47076005)(8676002)(8936002)(6862004)(40460700003)(41300700001)(66899021)(2906002)(40480700001)(5660300002)(33656002)(82310400005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 10:03:46.8873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 592b5276-5086-4710-5453-08db7c75f524
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6319
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 10:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183820

VGhlIGNvbG9uIGNhbiBiZSBmaXhlZCBidXQgYSByYXRpb25hbGUgZm9yIHRoaXMgY2hhbmdlIHdv
dWxkIGJlIHVzZWZ1bC4NCg0KUm9zcw0KDQo+IE9uIDQgSnVsIDIwMjMsIGF0IDEwOjAzLCBKb3Nl
IFF1YXJlc21hIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxxdWFyZXNtYS5qb3NlPWdtYWls
LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IGdlbnRsZSBwaW5nDQo+
IA0KPiBKb3NlIFF1YXJlc21hIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxxdWFyZXNtYS5q
b3NlPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBlc2NyZXZldSBubyBkaWEgc2V4
dGEsIDMwLzA2LzIwMjMgw6AocykgMTY6NTA6DQo+IFNpZ25lZC1vZmYtYnk6IEpvc2UgUXVhcmVz
bWEgPGpvc2UucXVhcmVzbWFAZm91bmRyaWVzLmlvPg0KPiAtLS0NCj4gIG1ldGEvY2xhc3Nlcy1y
ZWNpcGUva2VybmVsLW1vZHVsZS1zcGxpdC5iYmNsYXNzIHwgNCArKy0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L21ldGEvY2xhc3Nlcy1yZWNpcGUva2VybmVsLW1vZHVsZS1zcGxpdC5iYmNsYXNzIGIvbWV0YS9j
bGFzc2VzLXJlY2lwZS9rZXJuZWwtbW9kdWxlLXNwbGl0LmJiY2xhc3MNCj4gaW5kZXggMGU0Zjlh
NmVjMy4uYzEyMDhkNTVlMCAxMDA2NDQNCj4gLS0tIGEvbWV0YS9jbGFzc2VzLXJlY2lwZS9rZXJu
ZWwtbW9kdWxlLXNwbGl0LmJiY2xhc3MNCj4gKysrIGIvbWV0YS9jbGFzc2VzLXJlY2lwZS9rZXJu
ZWwtbW9kdWxlLXNwbGl0LmJiY2xhc3MNCj4gQEAgLTMwLDggKzMwLDggQEAgZmkNCj4gDQo+ICBQ
QUNLQUdFX1dSSVRFX0RFUFMgKz0gImttb2QtbmF0aXZlIGRlcG1vZHdyYXBwZXItY3Jvc3MiDQo+
IA0KPiAtbW9kdWxlc2xvYWRkaXIgPz89ICIke3N5c2NvbmZkaXJ9L21vZHVsZXMtbG9hZC5kIg0K
PiAtbW9kcHJvYmVkaXIgPz89ICIke3N5c2NvbmZkaXJ9L21vZHByb2JlLmQiDQo+ICttb2R1bGVz
bG9hZGRpciA/Pz0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAnc3lz
dGVtZCcsICcke25vbmFyY2hfbGliZGlyfScsICcke3N5c2NvbmZkaXJ9JywgZCl9L21vZHVsZXMt
bG9hZC5kIg0KPiArbW9kcHJvYmVkaXIgPz89ICIke0BiYi51dGlscy5jb250YWlucygnRElTVFJP
X0ZFQVRVUkVTJywgJ3N5c3RlbWQnLCAnJHtub25hcmNoX2Jhc2VfbGliZGlyfScsICcke3N5c2Nv
bmZkaXJ9JywgZCl9L21vZHByb2JlLmQiDQo+IA0KPiAgS0VSTkVMX1NQTElUX01PRFVMRVMgPz0g
IjEiDQo+ICBQQUNLQUdFU1BMSVRGVU5DUyA9KyAic3BsaXRfa2VybmVsX21vZHVsZV9wYWNrYWdl
cyINCj4gLS0gDQo+IDIuMzQuMQ0KPiANCj4gDQo+IA0KPiANCj4gDQo+IA0KPiAtLSANCj4gQmVz
dCByZWdhcmRzLA0KPiANCj4gSm9zw6kgUXVhcmVzbWENCj4gDQo+IC09LT0tPS09LT0tPS09LT0t
PS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdy
b3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzE4MzgxOCk6IGh0dHBzOi8vbGlzdHMub3BlbmVt
YmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTgzODE4DQo+IE11dGUgVGhp
cyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210Lzk5ODc1Njg3LzY4NzU4
ODgNCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9n
L29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViIFtyb3NzLmJ1cnRvbkBhcm0uY29tXQ0KPiAtPS09LT0t
PS09LT0tPS09LT0tPS09LQ0KPiANCg0K

