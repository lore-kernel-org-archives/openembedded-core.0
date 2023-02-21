Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78EA2C636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 13:47:37 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.87])
 by mx.groups.io with SMTP id smtpd.web10.42162.1676987246429263332
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 05:47:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=1jQh1vj6;
 spf=pass (domain: arm.com, ip: 40.107.8.87, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7f6Z21M/WynFcHmxQjoHmMTPLxMTcdnYzDv5QQvaq0=;
 b=1jQh1vj6Coa5kdvC9HfX+jM9EMm99ITDnNqhHpk3ETefBqeRQ+sUlXjOS5UOWPsDOUjrWd4KStnEJIBRP2/5Vk5rK8pvc9pTEN8BSt7/lCXkVz8IcWa5lK5QgX+XvC/lKtSMeLVeyA/1czZtoTJ7c5hoVyb1DR/A1hinYtbMYu4=
Received: from AS9PR06CA0265.eurprd06.prod.outlook.com (2603:10a6:20b:45f::34)
 by DU0PR08MB8018.eurprd08.prod.outlook.com (2603:10a6:10:3e5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 13:47:23 +0000
Received: from AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::19) by AS9PR06CA0265.outlook.office365.com
 (2603:10a6:20b:45f::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21 via Frontend
 Transport; Tue, 21 Feb 2023 13:47:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT027.mail.protection.outlook.com (100.127.140.124) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.17 via Frontend Transport; Tue, 21 Feb 2023 13:47:21 +0000
Received: ("Tessian outbound 8038f0863a52:v132"); Tue, 21 Feb 2023 13:47:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f8c914242f72109e
X-CR-MTA-TID: 64aa7808
Received: from 1b323c972ce7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3E61E5EC-07B2-479D-B19C-56B3AC6D312C.1;
	Tue, 21 Feb 2023 13:47:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1b323c972ce7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 21 Feb 2023 13:47:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J6ss+sE9xEv09uQYfpoXuJgYaI+b3cz/9biiRq+ilQEEVG9KzalAcyKTC3wpLdGPRZslwZONwKtbTRV1rnY9ToEYzH0g05g7Td/UbIN3BsjMqwRXFDy1lCFaCQ7gznjWNQ8e/b8cwM6uRGOjLUQPkIh0ASHiVA84BRGbpCtBDpPuWjHQKgTCK6U4uVYa+gXpMefPycCcEKczm6imwc+Bze7Kx2y77nNNDnZzYYO5bT0AR8heB4+d2eV0pi+zFkPnmEBVGdzaJSEqWAGcstBDiIYgb9dVfwXh85WZxJDnCzN9L2mpBTWaszcnwDt8vYVPQZKmBpSr10ODM3GuPFeXGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7f6Z21M/WynFcHmxQjoHmMTPLxMTcdnYzDv5QQvaq0=;
 b=fjX/FHMW1uNP0uOG3YbP7BzqCKGGfSagBN3DDblpLOvfO9qlp1tm67LEJj2GZXy9RCMep1mkvU/UY+/Q+i6EBsHPiNzjnw4IK2fFYrOKF6Pkr0PxXTol4zldDtxWLWndE7+daUh6GCrfal2oD48f6K6C1XoBAgqus25Rx57R3iB8dx+E2ADP8P7eJqDoTCtQK2NzZDfnGavRyWqoUERSvbjhjxYKvO02ChW5zpVGYMJajzL7GVQTaibQnSmFqmo2MYdmJZeNOW/iH/um4l1f7Nx4Qk4QZj9XTP1zvh97b1puFqUWcT6qqZSMdfoQH/rC3vVoSFn8OqG/gUu6g3J7Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7f6Z21M/WynFcHmxQjoHmMTPLxMTcdnYzDv5QQvaq0=;
 b=1jQh1vj6Coa5kdvC9HfX+jM9EMm99ITDnNqhHpk3ETefBqeRQ+sUlXjOS5UOWPsDOUjrWd4KStnEJIBRP2/5Vk5rK8pvc9pTEN8BSt7/lCXkVz8IcWa5lK5QgX+XvC/lKtSMeLVeyA/1czZtoTJ7c5hoVyb1DR/A1hinYtbMYu4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8343.eurprd08.prod.outlook.com (2603:10a6:150:bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 13:47:13 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6111.019; Tue, 21 Feb 2023
 13:47:13 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Marta Rybczynska <rybczynska@gmail.com>
CC: OE-core <Openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: Cve fetcher update
Thread-Topic: Cve fetcher update
Thread-Index: AQHZRfdK5GFORy13V0qoIuMeX2xOeK7ZagUA
Date: Tue, 21 Feb 2023 13:47:13 +0000
Message-ID: <9A00276D-E0D8-47DA-AC38-96418BF47388@arm.com>
References: 
 <CAApg2=SJRjhc5SGEoBYfKb6PkMqRW21ED8Bv1v-+QTSASCsQ4g@mail.gmail.com>
In-Reply-To: 
 <CAApg2=SJRjhc5SGEoBYfKb6PkMqRW21ED8Bv1v-+QTSASCsQ4g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8343:EE_|AM7EUR03FT027:EE_|DU0PR08MB8018:EE_
X-MS-Office365-Filtering-Correlation-Id: 06db11c3-903a-4578-4187-08db1412283f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 6iSATv7ye/tNlpbg+NR6aQjw9cSmUF525floDIwokJlTqBRlUBDmzBL7KMYpa0H+JeqYqOqSCp1RJ0IyaghJMgjh1TrVGhFxeZW3mcHsXnZIJAPfmlZxp/U6oyxh/uiUH9Ut4ed/d3bFBI3vTfnol5GSC9SO8r9b7/FVD4Yt1quJpaMljQeFRqMs8EB4J8PRRilY7Nfw5siR10STtPJZ7ymDTBapkXgcmJBWWF2Bpno+mF/VZ52Xn8m9gXOT2kk0Iu7PfgXOFzKAR8S63j6G9ij54m3bahVWT/bKSt2vjod2Xa5v/WaUDBbHN6sOdlHZIxk38WVwe25wSDTwLV9eGJl2GJTVYUkQw86FjvdxbjEOAPNDZ53CxmHhK6XiLMTtABhBjXVWHOXHf4l+1LMqK2BYLUc5zi6F9AL+/BL9AFCFd75VyTvCeKcsTvJ/tDwE6dFASqCrPWAOEyObOFaV/7czXBdTMlojZwtdNArRK4L5CyF+LDdVT9yZuJdcfgJ8SRk88MxUOSfqcMJzHJDzDFuqQrGZER1vbUfZp5/M64cvEozrpmuMSmUHrnaRTSB21JbuT3T5pdAw324k/y2FhmVBQJDCu1iVYUFhggTI8jq3QQ2qfFm+slyy5ybbcH6aR494Q0vUko8b0cNPK4OHf5EsVk36JNLxlbQ+q0OHfJ+ulGv2znNbmYibwWkfItYvS2/p78qauU10eVrbxslXkolqt199g33q7QwXo8L4fYk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199018)(5660300002)(122000001)(38070700005)(54906003)(66476007)(66446008)(26005)(64756008)(7116003)(4326008)(186003)(4744005)(8936002)(6916009)(8676002)(316002)(36756003)(66556008)(66946007)(76116006)(41300700001)(91956017)(86362001)(33656002)(71200400001)(6512007)(6506007)(38100700002)(53546011)(2906002)(2616005)(3480700007)(83380400001)(6486002)(478600001)(15650500001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <67E56F8DBDC59846A4A9FB27C027FE4C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8343
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c1862473-e770-435b-32e4-08db1412230d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3xb6dJ+JAXbTSiDCsFqY0JgSUzdXg5c3IjPB3bE/Er779mUt8Qt590MhTwk9WSYRxg4NgLAuQsnZQKxD4FLpsLhTuQ2pPYMM/7grQufQfrJ9MHgAz67X90WIgGyfLtlBdDyhdgB/1JJu7tLaMzkz/n4fJWAv33M8zwbBzwzZn+qFffJqDaXcSSZhq8AvcVa8NcPmbh/3yu7d48iSIkD06c5GCsUCuviNy2pOFs6XtiNve3NRg91OS/yRaa8shmx2hCd1sNPc6zSDzRNF/NekVcP7zjvzTzboqzGFViiIdiZkAq+Sdr1nc6XH50OMQMa++ep81kqVOB9CzxyBvR52EDtFgDTCZEWUyALqhf5hbwrhqiTPn6jEyzYnuw96FvUT3lwANNzHz6FANEXs8uNkHOoR5lm3hAUXAb4sPzktr7hx53X3EKyaTlDs5CxgPGXbEqTQEr/O6kN4XsKl2Mb/4VD7z5YxN3XZ6p5N0AWSojtVK31HTxoCS3fDtf28oC0HNoY7OAfQLjW+NmKNr6p9GHz5VYXK0MoGXJEbefOzFc7h6SL+Pl7dUEEmW+6/MsbS4pb0Yd0BTn1Qm4q7HqU9l6rBF0N+2HtumNNIf3Urlyf52cSgI1p/ZU15JGFfdeAlWN32yu11rhc13lNsJfIWSNRcXXW97wBmFaYvMfjGpSU0R96WVoGfFJvK7OYbKgpnK40MyIidyjzwTmfTXIYq1w==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(36860700001)(478600001)(86362001)(82310400005)(54906003)(2616005)(356005)(40460700003)(47076005)(316002)(15650500001)(336012)(107886003)(186003)(26005)(53546011)(40480700001)(6512007)(6506007)(6486002)(4744005)(3480700007)(36756003)(2906002)(4326008)(5660300002)(41300700001)(8676002)(33656002)(70586007)(70206006)(6862004)(83380400001)(7116003)(8936002)(82740400003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 13:47:21.9789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06db11c3-903a-4578-4187-08db1412283f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 13:47:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177498

SGkgTWFydGEsDQoNCj4gT24gMjEgRmViIDIwMjMsIGF0IDEzOjIwLCBNYXJ0YSBSeWJjenluc2th
IDxyeWJjenluc2thQGdtYWlsLmNvbT4gd3JvdGU6DQo+IEknbSBmaW5pc2hpbmcgdGhlIG5ldyBm
ZXRjaGVyIGZvciBjdmUgY2hlY2sgdXNpbmcgdGhlIDIuMCBOVkQgQVBJLiBXaWxsIG5lZWQgdGVz
dGVycyB0byBjaGVjayBhcyBtYW55IGNvbmZpZ3VyYXRpb25zIGFzIHBvc3NpYmxlIGJlZm9yZSB3
ZSBzd2l0Y2ggdGhlIGZvcm1hdC4NCj4gDQo+IFRoZSBjdXJyZW50IGVzdGltYXRlIGlzIHRoaXMg
d2VlaywgaG9waW5nIHRoYXQgdGhlIHJlYWwgbGlmZSBkb2Vzbid0IGludGVyZmVyZS4NCj4gDQo+
IEdvb2QgbmV3cyBmb3IgYWxsIHVzZXJzIGlzIHRoYXQgbm90aGluZyBjaGFuZ2VzIGZvciB5b3Uu
IFJlc3VsdHMgc2hvdWxkIGJlIGNvbXBhdGlibGUuIFRoZSBvbmUgbm90aWNlYWJsZSB0aGluZyBp
cyB0aGF0IHRoZSBjb21wbGV0ZSBmZXRjaCBpcyBsb25nZXIgdGhhbiBiZWZvcmUuDQoNCkF3ZXNv
bWUsIHRoYW5rcyBNYXJ0YS4gIEnigJlsbCBoYXBwaWx5IHJldmlldyBhbmQgdGVzdCB0aGUgY29k
ZS4NCg0KSG93IGxvbmcgaXMgYSBjb21wbGV0ZSBmZXRjaCBub3c/ICBNeSB2ZXJ5IHJvdWdoIHRl
c3Rpbmcgd2hlbiBJIGZpcnN0IGxvb2tlZCBhdCB0aGUgbmV3IEFQSSBzdWdnZXN0ZWQgMzAgbWlu
dXRlcyBmb3IgYSBmdWxsIHN5bmMuDQoNCkNoZWVycywNClJvc3M=

