Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232FBC001B0
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 09:52:49 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.88])
 by mx.groups.io with SMTP id smtpd.web10.57979.1691488361758415448
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 02:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ORUdkiQr;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ORUdkiQr;
 spf=pass (domain: arm.com, ip: 40.107.21.88, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gO5ma7C2grpsMvfFsAGZctRrnuT/SCA3BFUXD7/9zG8=;
 b=ORUdkiQrXd9b3SDh5J00W+QG6dq1wovtP5AuVpRdq9cXdzWKzF9hhE8c9PEr26GeT8BGEsMnmzCxM0rXkY++SRFMG6gFpicfh2w8JuH+MrSWzkwQLDHyQyKaFE1wsdZXcglH1W3izJuustwptZDictViaZ4AFZv1L7TpmtvgEAY=
Received: from DU2PR04CA0020.eurprd04.prod.outlook.com (2603:10a6:10:3b::25)
 by PR3PR08MB5642.eurprd08.prod.outlook.com (2603:10a6:102:8b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 09:52:38 +0000
Received: from DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::62) by DU2PR04CA0020.outlook.office365.com
 (2603:10a6:10:3b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27 via Frontend
 Transport; Tue, 8 Aug 2023 09:52:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT051.mail.protection.outlook.com (100.127.142.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.16 via Frontend Transport; Tue, 8 Aug 2023 09:52:37 +0000
Received: ("Tessian outbound ba2f3d95109c:v145"); Tue, 08 Aug 2023 09:52:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1393f27b86c62e01
X-CR-MTA-TID: 64aa7808
Received: from ff246a447ea7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F67E6CF9-852E-4FDE-88A0-E13422656C03.1;
	Tue, 08 Aug 2023 09:52:31 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ff246a447ea7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Aug 2023 09:52:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DrEoqzPFLJKwdiO7uSmcbBm0kHMB/sS5puf8nsft8pFvytJCerF0E4N3CvPk7zTSTjJS8g4st/i5Q+xJT/erINiBo53OrXfSXO8H8IWV8IHppepnDMxH86j9nRuNNQZVwFyJ3ytyF+fV3y9F7VlmJ/aibauA8Z5r4Y5Qf/7c8wf/u5JsP+rD/wFdIWoSNLZ0QCqF/khzCWpUaGpTXbT4rMM3hIfgeJUNJR7bG/jZ1As3RFlWk2A8nZnpQWaUePNY5u0YfNAC6Fva05axCSSBsmJjgcW/AGAAoxc7zUWlE8Xm5PDvvBcZPZ6B3CWZi9zFv3jW1xc1sw5qVJy0+3xsng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gO5ma7C2grpsMvfFsAGZctRrnuT/SCA3BFUXD7/9zG8=;
 b=mXqiPBK58BLLYQcEbrfH0bNi73gnJLc7fLFip68eIIM5FCEnGrGlzMgn+MpuTyfmpyDx4Y3pcyID/dSEqJxGw3fCam+Il7AG+FcsBGX4eASlbmFOAJS6b3yTD7msMf/OyH4ci7Lxpt/rC1cNzS5yHLf6RAxZcPb0mkMD+/lzXokTkqrhaWRme4KVzVbcsSjtk3wCvJpz9uPD38RTmFsGoTpokoAGLHIFZjBb0OJpl7cSWB803dYPMUkLBLcTm/qcD2nKN0E1WaT+42f9DWcUMoaCvq3RuwCkGuwODG3IEelkrXVgkOaa9yfjELn6h3vd8h/VE6Mccn8ceob/rpP0mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gO5ma7C2grpsMvfFsAGZctRrnuT/SCA3BFUXD7/9zG8=;
 b=ORUdkiQrXd9b3SDh5J00W+QG6dq1wovtP5AuVpRdq9cXdzWKzF9hhE8c9PEr26GeT8BGEsMnmzCxM0rXkY++SRFMG6gFpicfh2w8JuH+MrSWzkwQLDHyQyKaFE1wsdZXcglH1W3izJuustwptZDictViaZ4AFZv1L7TpmtvgEAY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7512.eurprd08.prod.outlook.com (2603:10a6:10:303::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 09:52:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 09:52:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Francesco Dolcini <francesco@dolcini.it>
CC: OE-core <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Subject: Re: [PATCH] systemd: set correct paths for kdb binaries
Thread-Topic: [PATCH] systemd: set correct paths for kdb binaries
Thread-Index: AQHZydLwP9nfsjXPhEaB0P4YfYYUra/gKGMA
Date: Tue, 8 Aug 2023 09:52:29 +0000
Message-ID: <F0FE6F09-2888-42D5-8464-5384ADC5E658@arm.com>
References: <20230804152936.1861831-1-ross.burton@arm.com>
 <ZNH9rxLnNfZrzD6W@francesco-nb.int.toradex.com>
In-Reply-To: <ZNH9rxLnNfZrzD6W@francesco-nb.int.toradex.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7512:EE_|DBAEUR03FT051:EE_|PR3PR08MB5642:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aacf3c9-2eca-4086-ec7c-08db97f532be
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 qgkN0zZN8mHTlqufZtj+g5cGOTBpMiBmWwZsJAbq+gF37UHGw7YjtFyPEBIvmOOgmhAHV8LfEpcG9Wll82ulwqmmSqsN7YKMH/WJNBSWdl6rRAeAm79/HQ4tvojdACLNrxHSEu9ui7hk1Sbih/8aPb1P/ZDMujDJ2zEOxQk5W8dPS/UWHyEKNR2LJ8Jm/il9UxS1XeNdsNxTeRu9gLmJbObH/Zorry7GPiPA36XX8BmutYp96KHzHdfM+XXbMiKpauu6XYMTDUg5V+IQDF9I1OeAjvZpHHe4GS8urAvxiBps55wDhD2BLzNzzIqwjvXbR7Ncy/t09I1bgQWd80v36oa8xST8rGd4i7cNW0RuGvGo7iNaIxb2vTUth0VouED0berK3yAZpPUYyTpTF4Z5ZOct/Obj+R6PYxXIQPkN0yVWy1U5QD2SYVh1NyMrKVaoVXEbJxI8a0YqX5YJfWXcTDxUJyZusMwVkN6SMT0BfWWTtH1RAsWlwtGcSnxPlWwrfALMa6ypimpJgov/s22JF9k4t2zZBBc7bH8FOwckD2dMKdIXrgx2I+hrmh/Kd9izw4J3J/RCDcS8/8PlXlTkcBMFFHe60adMLiRxQYpwV6tp1XFnNKYxlD6oZFLzSNgeMJNg89gFCBZl7+/rhnhVCg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199021)(1800799003)(186006)(6512007)(26005)(6506007)(53546011)(36756003)(54906003)(38100700002)(91956017)(5660300002)(38070700005)(86362001)(2906002)(6916009)(4326008)(64756008)(41300700001)(66476007)(33656002)(66446008)(66556008)(8936002)(76116006)(8676002)(316002)(71200400001)(66946007)(122000001)(478600001)(2616005)(6486002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A237F538C8BE7F499129E91AB5495077@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7512
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cb3bf22e-a197-4b18-2357-08db97f52dad
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F+GmH2d8uDWLlH71xH6KVgGTBCV+5hTcP9PYSTazl/TcdYTKkiXh/DWVUu3tC1U4XttoRXnLSf9siVhiwvZwuVc19LpkHSfmnKQ0jm+7P21gdBCcQrAe1PPLWqDSwnjmZesprCzA0+r77qhiggEIrxDHKvR4kFAlNIiTHHpytOYg7noK2GYoEHa+ggNZtPZKEl2+Zi/+vL5+K2UPXyJ03IL7EBvRlL279HMLnYsBKdlkRsPd1cGi2qjiewtjElXcaaP0UvWvoN229yQfnLMmKsf9TyBQtaeigDzqschi10IER6FKGl6vRYaKwx2JHLcBnnhvSfJYkDsouV0YIEbnQn9tjuoNGHAR7iXeVvbY5pJ0veBZpXevXkJ/1KlGiC3kUbSHMoXTmgQLO7riWRqXg7KOSZ3wpZ+C6MjzbI6wikbXNS+jC6lII8B72yK7kLqP8z1pGfqvEz5HmfdBu9uvfU14ca7D6cuDx/mmfPGyCTXDHzDfpQK9DnM5YAZApm4HyCXTyiIRbS75YfF9lY0zKflm4o7kP7L2RAjSwRRnxNc+Gu1ZY6e1nx7CoSHtybZ1UHWL6EIltkxNNhfVQN6AyeX4snZ+XI+NEVQdEtTDiF8yPz6OWknBX5Z1luOwJU8JjjexrKPIQ5vJ131N5uzhc7lLaJd3WDvN22tj+7jb54aLFH+rhnxKg3UR4Gg4rA1kVfO7TDhZgUdnqCyRNsGM/c85CMiSRV7Ba5HJPzJVOMmdpRXGnV6KQYWUVEw54a/u
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199021)(186006)(1800799003)(82310400008)(46966006)(40470700004)(36840700001)(40480700001)(316002)(36860700001)(47076005)(83380400001)(40460700003)(2616005)(2906002)(356005)(82740400003)(81166007)(36756003)(336012)(33656002)(8936002)(8676002)(6862004)(26005)(6486002)(5660300002)(53546011)(41300700001)(70586007)(4326008)(70206006)(6506007)(478600001)(54906003)(86362001)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 09:52:37.7055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aacf3c9-2eca-4086-ec7c-08db97f532be
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5642
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 09:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185653

T24gOCBBdWcgMjAyMywgYXQgMDk6MzIsIEZyYW5jZXNjbyBEb2xjaW5pIDxmcmFuY2VzY29AZG9s
Y2luaS5pdD4gd3JvdGU6DQo+IA0KPiBIZWxsbywNCj4gDQo+IE9uIEZyaSwgQXVnIDA0LCAyMDIz
IGF0IDA0OjI5OjM2UE0gKzAxMDAsIHJvc3MuYnVydG9uQGFybS5jb20gd3JvdGU6DQo+PiBGcm9t
OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4NCj4+IA0KPj4gVGhlIGtiZCBiaW5h
cmllcyAobG9hZGtleXMgYW5kIHNldGZvbnQpIGFyZSBpbnN0YWxsZWQgdG8gYmluZGlyLCBub3QN
Cj4+IGJhc2VfYmluZGlyLg0KPj4gDQo+PiBGaXhlczogOTRjY2M3YWNjNGE4NzFmNWJiN2FiOGUx
MzVlNzBiNTUxOWVmZjZhZA0KPj4gU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVy
dG9uQGFybS5jb20+DQo+IA0KPiBJcyBteSB1bmRlcnN0YW5kaW5nIGNvcnJlY3QgdGhhdCB0aGlz
IHBhdGNoIGlzIHN1cHBvc2VkIHRvIGZpeCB0aGUNCj4gZm9sbG93aW5nIGVycm9yOg0KPiANCj4g
YGBgDQo+Pj4gc3lzdGVtZC10ZXN0OiBzeXN0ZW1kLXZjb25zb2xlLXNldHVwLnNlcnZpY2Ugc3Rh
dHVzOg0KPiB4IHN5c3RlbWQtdmNvbnNvbGUtc2V0dXAuc2VydmljZSAtIFZpcnR1YWwgQ29uc29s
ZSBTZXR1cA0KPiAgICAgTG9hZGVkOiBsb2FkZWQgKC9saWIvc3lzdGVtZC9zeXN0ZW0vc3lzdGVt
ZC12Y29uc29sZS1zZXR1cC5zZXJ2aWNlOyBzdGF0aWMpDQo+ICAgICBBY3RpdmU6IGZhaWxlZCAo
UmVzdWx0OiBleGl0LWNvZGUpIHNpbmNlIE1vbiAyMDIzLTA4LTA3IDE1OjM0OjI5IFVUQzsgOG1p
biBhZ28NCj4gICAgICAgRG9jczogbWFuOnN5c3RlbWQtdmNvbnNvbGUtc2V0dXAuc2VydmljZSg4
KQ0KPiAgICAgICAgICAgICBtYW46dmNvbnNvbGUuY29uZig1KQ0KPiAgICBQcm9jZXNzOiA3NjUg
RXhlY1N0YXJ0PS9saWIvc3lzdGVtZC9zeXN0ZW1kLXZjb25zb2xlLXNldHVwIChjb2RlPWV4aXRl
ZCwgc3RhdHVzPTEvRkFJTFVSRSkNCj4gICBNYWluIFBJRDogNzY1IChjb2RlPWV4aXRlZCwgc3Rh
dHVzPTEvRkFJTFVSRSkNCj4gQXVnIDA3IDE1OjM0OjI5IGxvY2FsaG9zdCBzeXN0ZW1kWzFdOiBT
dGFydGluZyBWaXJ0dWFsIENvbnNvbGUgU2V0dXAuLi4NCj4gQXVnIDA3IDE1OjM0OjI5IGxvY2Fs
aG9zdCBzeXN0ZW1kLXZjb25zb2xlLXNldHVwWzc2NV06IC9iaW4vbG9hZGtleXMgZmFpbGVkIHdp
dGggZXhpdCBzdGF0dXMgMS4NCj4gQXVnIDA3IDE1OjM0OjI5IGxvY2FsaG9zdCBzeXN0ZW1kWzFd
OiBzeXN0ZW1kLXZjb25zb2xlLXNldHVwLnNlcnZpY2U6IE1haW4gcHJvY2VzcyBleGl0ZWQsIGNv
ZGU9ZXhpdGVkLCBzdGF0dXM9MS9GQUlMVVJFDQo+IEF1ZyAwNyAxNTozNDoyOSBsb2NhbGhvc3Qg
c3lzdGVtZFsxXTogc3lzdGVtZC12Y29uc29sZS1zZXR1cC5zZXJ2aWNlOiBGYWlsZWQgd2l0aCBy
ZXN1bHQgJ2V4aXQtY29kZScuDQo+IEF1ZyAwNyAxNTozNDoyOSBsb2NhbGhvc3Qgc3lzdGVtZFsx
XTogRmFpbGVkIHRvIHN0YXJ0IFZpcnR1YWwgQ29uc29sZSBTZXR1cC4NCj4gYGBgDQo+IA0KPiBq
dXN0IGludHJvZHVjZWQgd2l0aCBzeXN0ZW1kIDI1NCBpbiBvZS1jb3JlID8NCg0KWWVzLCB0aGF0
4oCZcyByaWdodC4NCg0KUm9zcw==

