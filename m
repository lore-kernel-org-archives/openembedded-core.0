Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C04B7C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 17:41:45 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.85])
 by mx.groups.io with SMTP id smtpd.web11.1587.1669138898688755938
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 09:41:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=06zzqyMP;
 spf=pass (domain: arm.com, ip: 40.107.8.85, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTlcohynIUSjIoeWW+B9JiUj0r+5u5DQz+6fAmx9dAI=;
 b=06zzqyMPQGjGkFVfNWF0kodE+2ulC6PfJAhGw4pEPdwXrkQwfbm8cTn+kAt0MVjJABhJnfG5kdoTCE7xXeVHyMduEv/pBhJjaxm0ZAlIVa8zB+5knYOWSfaUeS5iWcYqzvDoVshuqNfWo8cPrzUFB0oBsrrYbSsNiY8zrka1AY0=
Received: from AM6P193CA0135.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::40)
 by PAXPR08MB7525.eurprd08.prod.outlook.com (2603:10a6:102:24b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.13; Tue, 22 Nov
 2022 17:41:32 +0000
Received: from AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::f4) by AM6P193CA0135.outlook.office365.com
 (2603:10a6:209:85::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15 via Frontend
 Transport; Tue, 22 Nov 2022 17:41:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT029.mail.protection.outlook.com (100.127.140.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Tue, 22 Nov 2022 17:41:32 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130"); Tue, 22 Nov 2022 17:41:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1203694d87855db9
X-CR-MTA-TID: 64aa7808
Received: from ba9748bee3f5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CC68EDDC-2518-4053-B052-D88D81FA6B49.1;
	Tue, 22 Nov 2022 17:41:24 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ba9748bee3f5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 22 Nov 2022 17:41:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=br2LrponH18UIEuFPrv1tig28AMHpO3JdYoU2I97B+jjrHDfL1hErKUiXeOZdZEBwDstxoxA7RptYcPCbwnF7LAMeIVzfsOAtOpCtFQ+dP15VvZ2KqHgX1RMqLT1+nWWD0AUAg9+thdWa8GVwN4Rv83vmICW8vGkDvK3T5gS89IGrExpfPa8yYIuZcCwieKdPFA1a7+5fo4qyj1qJG9TGDTSHEqq4YMBw/2LkazvVsd7TJDeC10hQEzE8EIcjC0tqWsDpJ9g7BxrFb+Q+oGG2+aurQtdxdUSozWh2SQd2X0SG6/BYU80wfDK+8+EomxlaShSBPNwAADAh/RTeVk8MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTlcohynIUSjIoeWW+B9JiUj0r+5u5DQz+6fAmx9dAI=;
 b=NZbe2ryhV0kJr1lIeqtqujAC4fX6gaRIfhbporBLDQuCnn+eYQsJHkMjDLjsML2mW5U10helE9Kgjgo44IRGkmJ4knjvBARuro0HPVYyrmcU9sGd7Y9zgxORmu8HTzoZl+OuRhF6ueVGZyMjuKNtcZV5ClqgQpKOzGoyxcDDDJodK1vWvJRuKRdcg0miyrDCOqTlbPNJ27gUcqY3+8rs/vKEjagqchVqpeQXKetiCbKLJKPVrlBC2ZxpPSokgixOq8dVjWFUPBX6iIczpcnlgwhkD+JeuX+6ua5C5u9w+jWb4hu/ySzJyf8PWfRHLWJnYbGXCUnRRNcIF4c9+O7Qow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTlcohynIUSjIoeWW+B9JiUj0r+5u5DQz+6fAmx9dAI=;
 b=06zzqyMPQGjGkFVfNWF0kodE+2ulC6PfJAhGw4pEPdwXrkQwfbm8cTn+kAt0MVjJABhJnfG5kdoTCE7xXeVHyMduEv/pBhJjaxm0ZAlIVa8zB+5knYOWSfaUeS5iWcYqzvDoVshuqNfWo8cPrzUFB0oBsrrYbSsNiY8zrka1AY0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6100.eurprd08.prod.outlook.com (2603:10a6:20b:287::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Tue, 22 Nov
 2022 17:41:22 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119%7]) with mapi id 15.20.5857.013; Tue, 22 Nov 2022
 17:41:22 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Markus Volk <f_l_k@t-online.de>
CC: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] python3: add ${bindir}/python symlink
Thread-Topic: [oe-core][PATCH] python3: add ${bindir}/python symlink
Thread-Index: 
 AQHY/Qj3NOSdoWEgPkKI+DKTOAmX9q5IcnWAgAAK0oCAAQE0gIAAKmwGgAC2yoCAANl2AA==
Date: Tue, 22 Nov 2022 17:41:22 +0000
Message-ID: <4BF25A91-3F02-49A2-A546-A9CF7881E0ED@arm.com>
References: <20221120175237.194899-1-f_l_k@t-online.de>
 <CAMKF1spErHg3JX+DFRLcW4EthTGBMm4A24XsyAVOO3RNr6Wgfw@mail.gmail.com>
 <CANNYZj-UTuxW0-Rr7FhgjwE007Gr28Pc5ZCo=cnrDcaNsuZStw@mail.gmail.com>
 <CAMKF1srs_tmRRNqWQAmBKOkJkfysJt=OZjefq_mPd4htPGi6VA@mail.gmail.com>
 <1729A925BA1D06C8.25787@lists.openembedded.org>
 <CANNYZj-mhM6FzQY4Lv2BckodcLtPSUV29GG4TCUb_Tp003SAbw@mail.gmail.com>
 <HRFQLR.NFABK2KMZ9XR2@t-online.de>
In-Reply-To: <HRFQLR.NFABK2KMZ9XR2@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB6100:EE_|AM7EUR03FT029:EE_|PAXPR08MB7525:EE_
X-MS-Office365-Filtering-Correlation-Id: c2018bfb-64b9-4876-ee31-08daccb0cb46
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 p0mHU23KCjnh0Wy46Y77586Wgrdczi2RBZXjDanCzKpoHvVmL9GDRpjtAsJwPGWWUtdiaySFS6F4vsL7WT78uwMNC5o4CDWT2ha1uAiIE/M/pqp8gNBameYTZaQqReW3tWPcaJD/3aVcqpnC+YorZRuoCbocliHWzxHYw8RPgLZIhhuaOsOf+7gR88wOHJEbgyUdnlzrJMSJ/RN5r+Jld3W6LQKwiJILlp7ld1FaT+zd+HW90TGBHpXMZZ+YN02ZixkbXtqpDw5AcLowOjIy7hvDonIAE4zRNuYUPkUWAuyzBgYOK9P53Bz7ffKbZGltq5g+Jm0baopWud4lpPJmmoxsWfGJ8cxbU1fnWL3yVIveCCX+LGV+QBlKfNmSWUQ/Cj4UfGUyiT9+uJpLCXtJRqjFl5TAVG/uEtQEwApQzfbyIE8vjwkiID5kCjPoskI2q0x2XZUUzLQrAEUgNOv5vPLb7jEOhjbob/MW/2zwz3ZkYirL2caaQZSkKSw+FRI8iyTu1ZJGM1PkNaKRzroOOy61yGrIv/PYrbV8p6vtF83CcY2sFnGSS0BUaeMPfddqdXnnIdv/gqkmOu6Gs59toJ333pLoDUi0xuRXpceLkH35gBhq8Zqpz267RMjeglpngYVhYRe8iSpufu4K5S//llBKR14r0vYtZ+zNPm5No8xHCjf3eDpHrik6WWg1atd/asI2lJENCNSYZvYKhtOP+wy7boNE7L4uOdLGEu0GIpdE3UJtpQJb6cZHKH7Gf15n1PwUUZGYFrZDsZP0uPyux2wHoXDiHvsweowQqCgX22c=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(451199015)(8936002)(5660300002)(6916009)(54906003)(53546011)(966005)(2616005)(478600001)(6506007)(6486002)(316002)(186003)(2906002)(86362001)(38100700002)(6512007)(83380400001)(8676002)(66476007)(36756003)(38070700005)(26005)(66556008)(71200400001)(64756008)(4326008)(66446008)(66946007)(41300700001)(76116006)(91956017)(122000001)(33656002)(228453006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B2CC119DCB4C654FBFD44389F7E3600D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6100
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0f3f1c9d-06d5-4442-09fe-08daccb0c5a9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dNuAbCg31oR4TA7O6Z0/JQwkravXm9VhabeJ49vk07p7VjhmapAp2C0WMp2QeRmtsBAZ2O+vlDdIArjpFsLk52Riu90emnbMPZ4ZydXcXMRHxtOEfyxbK+4ulA9rvLI2Hkp1gSRmFaXUtcL6/b/T+wGNJfFLL0vN29ux7jXI3uIQNOiX9iUn4ksYUUoIIQXtisexXMBkMlaFxNAfYLuhCKW++opAOY0Oy0zx1YO/vqykCxmXEXKR19o/vvVws7DDIhoG8t6LmlddYBWx9lWadXwrxMgqSMaHTgXv3cQ3tLtqDbZDalTcUl1mW+eC1LnjVaMa7koF9ts8pFz3gE6vSLOG0b+UTezhjU1hFUu2zkoN9g3C+CuyPyDdekbJt+xB5/icRgIc6nL0OU3ct6H8C1wvBeo29ha8CBpmZ04syQX586UYzWnRkYSIkkDMfMYdO6YTFYmJ6aF+kX7HghiyELox18BLicONOkFwjGobFVM2Jlakm/eXbrW5Cl26xPm4yeMvfMq3cGI9MkNHeG2j1kXxRSNony2b/69d1OxLQ3bJIpeg3LLSi2sfHyQhUTJC/RUzQdABOauTacEpUNu6HIDEZV2xAEnBYqBu1Qx2w0MIFiAkUB7PJb49HWM+oFZ9EDL34ZMI4H4f3A6RRzF0EZBYY2TbhbaZXNPhQoKkQqRQ5buakWtjgseYKo7AOhTluYbMeg3YbMGsFnKEidnXo6gMQMH11X+oxNk3O4OFMeEN2UCDm8oPqewCmjcBeXkV7lTTVcCz1wrPcCUdbwC4TQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199015)(46966006)(40470700004)(36840700001)(36860700001)(82310400005)(86362001)(83380400001)(47076005)(82740400003)(36756003)(356005)(81166007)(40460700003)(40480700001)(6486002)(478600001)(2906002)(8676002)(4326008)(316002)(70206006)(70586007)(54906003)(966005)(6862004)(41300700001)(8936002)(5660300002)(33656002)(2616005)(186003)(6512007)(336012)(6506007)(53546011)(26005)(228453006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 17:41:32.2611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2018bfb-64b9-4876-ee31-08daccb0cb46
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7525
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 17:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173694

T24gMjIgTm92IDIwMjIsIGF0IDA0OjQyLCBNYXJrdXMgVm9sayB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8Zl9sX2s9dC1vbmxpbmUuZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IE9uIE1vbiwgTm92IDIxIDIwMjIgYXQgMDY6NDg6MDcgUE0gKzAxMDAsIEFsZXhhbmRlciBL
YW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPiB3cm90ZToNCj4+IE9uIG15IERlYmlhbiBz
eXN0ZW1zLCBpbmRlZWQsIC91c3IvYmluL3B5dGhvbiBpcyBhYnNlbnQuDQo+IA0KPiBEZWJpYW4g
aGFzIGEgcGFja2FnZSBmb3IgdGhpcw0KPiBodHRwczovL3BhY2thZ2VzLmRlYmlhbi5vcmcvYm9v
a3dvcm0vcHl0aG9uLWlzLXB5dGhvbjMNCg0KQW5kIHRoYXTigJlzIGEgcGVyZmVjdGx5IGdvb2Qg
c29sdXRpb24gdGhhdCBJIGxpa2UuDQoNClBlcnNvbmFsbHksIEkgdGhpbmsgcGVvcGxlIHNob3Vs
ZCBmb3JnZXQgdGhhdCAvdXNyL2Jpbi9weXRob24gZXhpc3RzOiB0aGUgcmVjb21tZW5kYXRpb24g
ZnJvbSBQeXRob24gaXMgdG8gY2FsbCBweXRob24yIG9yIHB5dGhvbjMuICBJIGNhbiBxdW90ZSBm
cm9tIFBFUC0wMzk0Og0KDQrigJzigJ3igJ0NCkRlcGVuZGluZyBvbiBhIGRpc3RyaWJ1dGlvbiBv
ciBzeXN0ZW0gY29uZmlndXJhdGlvbiwgcHl0aG9uIG1heSBvciBtYXkgbm90IGJlIGluc3RhbGxl
ZC4gSWYgcHl0aG9uIGlzIGluc3RhbGxlZCBpdHMgdGFyZ2V0IGludGVycHJldGVyIG1heSByZWZl
ciB0byBweXRob24yIG9yIHB5dGhvbjMu4oCdDQoNCuKApg0KDQogICAg4oCiIERpc3RyaWJ1dG9y
cyBtYXkgY2hvb3NlIHRvIHNldCB0aGUgYmVoYXZpb3Igb2YgdGhlIHB5dGhvbiBjb21tYW5kIGFz
IGZvbGxvd3M6DQogICAgICAgIOKAoiBweXRob24yLA0KICAgICAgICDigKIgcHl0aG9uMywNCiAg
ICAgICAg4oCiIG5vdCBwcm92aWRlIHB5dGhvbiBjb21tYW5kLA0KICAgICAgICDigKIgYWxsb3cg
cHl0aG9uIHRvIGJlIGNvbmZpZ3VyYWJsZSBieSBhbiBlbmQgdXNlciBvciBhIHN5c3RlbSBhZG1p
bmlzdHJhdG9yLg0K4oCc4oCd4oCdDQoNCldl4oCZdmUgcGlja2VkIG9wdGlvbiAzLiAgQXMgcGVy
IFB5dGhvbiB1cHN0cmVhbSwgdGhhdOKAmXMgYWJzb2x1dGVseSBmaW5lLg0KDQpJZiB5b3UgaGF2
ZSBhIHNlcmlvdXMgbmVlZCB0aGF0IC91c3IvYmluL3B5dGhvbiBleGlzdHMsIGFuZCBpcyBhIHN5
bWxpbmsgdG8gcHl0aG9uMywgdGhlbiBjb3VsZCB5b3Ugbm90IG1ha2UgYSBzaW1wbGUgcmVjaXBl
IHRoYXQgUkRFUEVORFMgb24gcHl0aG9uMyBhbmQgc2hpcHMganVzdCBhIC91c3IvYmluL3B5dGhv
biAtPiBweXRob24zIHN5bWxpbms/ICBZb3UgY2FuIGV2ZW4gcHV0IHRoaXMgaW4geW91ciBsYXll
ciB0byBhdm9pZCBoYXZpbmcgdG8gZGViYXRlIGl0IHdpdGggdGhlIG9lLWNvcmUgbWFpbnRhaW5l
cnMuDQoNClJvc3M=

