Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB87EB64DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 11:42:19 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.54])
 by mx.groups.io with SMTP id smtpd.web10.5252.1689939734610782587
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 04:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=lRRg+x19;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=lRRg+x19;
 spf=pass (domain: arm.com, ip: 40.107.105.54, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHRIE9H3BvwO4m69kaAfumrwGiowzwuFiexcxV3Alio=;
 b=lRRg+x19V4hNx4dIBSY4d1SJ6KepFqsTOmXzJNRmNuWbTUFm26Zok8o2A9i6/71HclSvIB8rsC8ua1VbknkVaa33X5cViXN7sWAkRqxWZCCOnLnEIHDeVI89x8MjCgkYKkIYmR1TFIW1NA6SjnejKK7ao4KkRczVbMZx/4pvpbY=
Received: from AS9PR05CA0302.eurprd05.prod.outlook.com (2603:10a6:20b:491::30)
 by GV1PR08MB8214.eurprd08.prod.outlook.com (2603:10a6:150:5d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Fri, 21 Jul
 2023 11:42:10 +0000
Received: from AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:491:cafe::8f) by AS9PR05CA0302.outlook.office365.com
 (2603:10a6:20b:491::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28 via Frontend
 Transport; Fri, 21 Jul 2023 11:42:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT063.mail.protection.outlook.com (100.127.140.221) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.28 via Frontend Transport; Fri, 21 Jul 2023 11:42:10 +0000
Received: ("Tessian outbound f9124736ff4f:v145"); Fri, 21 Jul 2023 11:42:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e48a06c524b7f11a
X-CR-MTA-TID: 64aa7808
Received: from 893c659d29f3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B7A97EC9-477A-4C81-910F-F333511C9FAE.1;
	Fri, 21 Jul 2023 11:42:03 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 893c659d29f3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 21 Jul 2023 11:42:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPyXfZEFtuLe10EHuxRLttRwcMKhzfr8CZGpXBDXsHtJxTpzqrK5s8qkw21YY2LIX4eK5nMzpZqOm3Fq8JNqtNvxiUuR2Kk5N74ZRvUUvYVsVRc0NPzgNl/8+UcsLVha3dM1pxV/uQvNwQdxv2fx9wi/a/3hV1a7bw8mCFEQbnnQymbz4L9VBKkrTjxqDUNKInuOqZlA3/lQCLPHb6XSWdOHrFwftbp0RVDRg4k2wLt0no3ZwsQN6rcKmjHHI7eykgiUsPFHmOTFJGHl70/HGi0RU2qPP/0faEyXA9a6/2WLiVRKoRUiVX+W+ziwbyVhcScsthWDM9IOIP942uI2dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHRIE9H3BvwO4m69kaAfumrwGiowzwuFiexcxV3Alio=;
 b=g0+J3FyATn+BR5q5Ymf96FbwcgIUMPt2uA/qlBVh+sx7F91HkwQ31jG2dKD4LBkpDHHjOvzqK7dFPdo5r7uFolYDOY65/0aVrZXGLQ6LgBLlrpjSOvAhhVk7uLP7FYOipY/S7GnfKdKasfVZwWJTgnwacil+pk2V/TdvF4GGZTaOfg5hz5iojPTaANQMYKH16+hqt/9SCCqujWkBBfGREh1rx2NKiV4ZhfE0DVcdftSLqkWDBnKh0b8Aw15q9T/phokLIPojBnMkoiPqurfdOBIhJ/Ylz7cem7/2UNJbnnkfqmkXJWJUzArVSAmfcsI5IF4YN1ul7zFT1Npv4ITtBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHRIE9H3BvwO4m69kaAfumrwGiowzwuFiexcxV3Alio=;
 b=lRRg+x19V4hNx4dIBSY4d1SJ6KepFqsTOmXzJNRmNuWbTUFm26Zok8o2A9i6/71HclSvIB8rsC8ua1VbknkVaa33X5cViXN7sWAkRqxWZCCOnLnEIHDeVI89x8MjCgkYKkIYmR1TFIW1NA6SjnejKK7ao4KkRczVbMZx/4pvpbY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB5PR08MB10310.eurprd08.prod.outlook.com (2603:10a6:10:4a1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 11:42:02 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::67ae:749a:f0aa:f239]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::67ae:749a:f0aa:f239%4]) with mapi id 15.20.6609.025; Fri, 21 Jul 2023
 11:42:02 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "throos@amazon.de" <throos@amazon.de>
CC: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] kirkstone boost upgrade?
Thread-Topic: [OE-core] kirkstone boost upgrade?
Thread-Index: AQHZu464cBJ3VPLf9UmQh2Hc/UVYdq/DvCgAgAAlz6WAADeaAA==
Date: Fri, 21 Jul 2023 11:42:02 +0000
Message-ID: <76EB3148-B3B7-4D74-8F4B-5343A63C71F1@arm.com>
References: <ef85e3d213644b25adceed1a851ac01b@amazon.de>
 <f8527dac-70d8-488f-dbcb-78d29acd8e01@gmail.com>
 <11b360cb14ab463b88b5cec298e0b2c6@amazon.de>
In-Reply-To: <11b360cb14ab463b88b5cec298e0b2c6@amazon.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB5PR08MB10310:EE_|AM7EUR03FT063:EE_|GV1PR08MB8214:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c906079-59ec-40a4-ead1-08db89df84f0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 WD0ipMNLKkF7sy+DkskghwgtG8HTe6lt2uQpsi8GWDedsrmvf5CPIC640nkhpuKjz/GDzT/2VsrF/5Q/ThggTDcRxsrTZTq1A2n0DqrTFNegOsCZiRr9DhiMu6jw0hcw26ZEbDb35DM2ELyzFyNJOXuJpNeP0HVwb0TDCTi34P5II/2tKvElDPoL3TomQg8xIC9kzOyI3j6FFD/KMd8IRYHXiP493lYfs/ua7lLIpIIo+wQHeyp0sKACcCvhOKnv0pPNAt6urLWzFWMH2dCVvxgXdDeGjapqzytecLT1wFoBPJ43l8PUct//8G/zYyecJYXFEZb/kky3tU6N0O3O3gdv2l8DX1TQjkFf61yZXEpOdfv+8GiQnPNlWgdRt5xHB1Dm4ZM/6F6uHBBIRXXR7XtcZXxq/NfidzebeWq+MTINdGESkFP35Mpd6KAvC1KPBIRCUkswzXzPhuCP8CmU04kZfb5zLvVGjX56wA64+D5zu4QupJoE8r/9XMbihjl/TYrTYSqyIyBUisBlukTjD+jM/Sb1kfeCt4EMR40J9t8AhwjaT1OVSPVUFq1jW9q0LVRajDknALZLSm5fZMORUFzJ9sJPBtv+LUJ4esxa5hCBTgWCqfT4FHfZT+gJOdtu5EUnbjjxBYQaCQAnQWgwSg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199021)(4744005)(2906002)(83380400001)(2616005)(38070700005)(86362001)(33656002)(36756003)(122000001)(38100700002)(41300700001)(53546011)(6506007)(6486002)(66446008)(66476007)(76116006)(91956017)(66946007)(6916009)(71200400001)(4326008)(64756008)(316002)(66556008)(26005)(186003)(6512007)(8936002)(8676002)(478600001)(54906003)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5738E0AF19F9E4A9814C8F041FC010F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10310
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	98f3d0c3-99d8-497a-3ee8-08db89df801a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Bvw1jCpFBgCDIx//oLlUBfX4lkDVg/aoVvxroYMMHplrhLGNot2pZKzqXln8PhkNRrc3SqLB0Yv2NflzO81LdhHgztjHp3VJ1JFv2KxHA93NvuRfaAk5M2dg14eG8WlLk5qXawbzCNlrO5wS44hKuAHRhVIJx7asKJueDVp5TB6hNfNJgsi8iJgLdhEZadui65+kBFDNAwCB6O1JHjEqBJMtkkpCJlmbYhynF0w/J4OFnZDd/8B6cW/lhkls1zj3Z1lrOY+uwGK0F0NY2EjBOsYoPflpU3v6hcG33YOvrRHHNqfhTuV9sDeQDK3vDiGHdWE7GPK0OEDYnIaPbN0c+n0a3gFa7xngZ8LUMaFv+teBBFD8qiA16cA2jJuvuN2T2XfFnNt4cB1j5cRDDDe0lYA9O1Z1bbFCb/GTKcnd/cYnepr+p2a4WeeCtfqck2hNRC+jTvz+0l9J6Rr063whJ4DYs60+KfLtGboE9bL5689iMTknKTYmqoggAkI5v83uglX7K39Jnt2RfO4U3Z1pKUk7+f5q3u8JLz/12ym5kdFVIdqvM6p0N1Qylvjj9v9kyKgSbMbPL4M8Yh2rKByUtGoDkS4Ykm6rk/okyeHsFcS+cmuLywHNh6AsNP/XofSks0XPJC0cDyLKPz9mJc+EHyLuDyKkk6i82TwP4RHLUzwUeWgn+F6GSqoXfOEFVjSSwAAqhbMRhcObZVOuNxRXg/zWv8Ls8wzCjeguUmTDs04=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(82310400008)(451199021)(36840700001)(40470700004)(46966006)(6506007)(186003)(478600001)(2906002)(54906003)(6486002)(8676002)(36756003)(4744005)(4326008)(316002)(70206006)(70586007)(8936002)(41300700001)(356005)(47076005)(2616005)(83380400001)(336012)(81166007)(6512007)(40460700003)(86362001)(6862004)(53546011)(5660300002)(33656002)(40480700001)(36860700001)(26005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 11:42:10.3682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c906079-59ec-40a4-ead1-08db89df84f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8214
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 11:42:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184686

T24gMjEgSnVsIDIwMjMsIGF0IDA5OjI1LCBUaG9tYXMgUm9vcyB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8dGhyb29zPWFtYXpvbi5kZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToN
Cj4gDQo+IEhpIFZ5YWNoZXNsYXYsDQo+IEkgdGhpbmsgaXQncyB0aGlzIGVycm9yOiBib29zdCBi
ZWFzdCAiRml4ZWQgV2ViU29ja2V0IGhhbmRzaGFrZSByZXNwb25zZSBvbiBmYWlsdXJlLiINCj4g
Rml4ZWQgaW4gMS43OS4NCj4gTXkgcXVlc3Rpb24gd2FzIHdoYXQgaXMgdGhlIHBvbGljeSBvZiB1
cGdyYWRpbmcgYm9vc3QgaW4gYW4gTFRTIGJyYW5jaD8gSSBndWVzcyB0aGVyZSBpcyBubyBjaGFu
Z2U/DQo+IEkgdG90YWxseSBhZ3JlZSB0aGF0IHRoZXJlIGFyZSBicmVha2luZyBjaGFuZ2VzIC0g
SSBoYWQgZXhwZXJpZW5jZWQgYSBsb3QgaW4gdGhlIHBhc3QuLi4NCg0KSWYgeW91IGNhbiBpc29s
YXRlIHRoZSBmaXggdG8gYSBzbWFsbCBwYXRjaCB0aGF0IGRvZXNu4oCZdCBicmVhayBhbnl0aGlu
ZyBlbHNlLCB0aGVuIHlvdSBjYW4gc3VibWl0IHRoYXQgYXMgYSBwYXRjaC4gIElmIGl0IG5lZWRz
IHRvIGJlIGFuIGludmFzaXZlIHVwZ3JhZGUsIHRoYXTigJlzIGxlc3MgbGlrZWx5IHRvIGhhcHBl
bi4NCg0KUm9zcw==

