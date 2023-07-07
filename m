Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F52EB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 10:22:59 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.81])
 by mx.groups.io with SMTP id smtpd.web11.9441.1688725375146173283
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jul 2023 03:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=W8LchyOe;
 spf=pass (domain: arm.com, ip: 40.107.7.81, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuqeUwaMKAJDPEJcikM4VrvR3MUFgER7EPYN2vADKv4=;
 b=W8LchyOeLVNanpfP2U4WWxvBjF7l7CmcYkNV2uW74OrOwkFwP3AJnmxSpaxH3S/6jg8409NlT8SjKAiFNczOsoTetI01IL6QgBji1CcgrT0Zv7eDWTxog9QHkHpsA2qjLUARkuvEq+ebVPYk2lfHJjkp6sCQdKN31ZRQ/aMOMNI=
Received: from DB7PR03CA0097.eurprd03.prod.outlook.com (2603:10a6:10:72::38)
 by AS8PR08MB5958.eurprd08.prod.outlook.com (2603:10a6:20b:299::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 10:22:51 +0000
Received: from DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::37) by DB7PR03CA0097.outlook.office365.com
 (2603:10a6:10:72::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Fri, 7 Jul 2023 10:22:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT038.mail.protection.outlook.com (100.127.143.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.25 via Frontend Transport; Fri, 7 Jul 2023 10:22:50 +0000
Received: ("Tessian outbound 997ae1cc9f47:v145"); Fri, 07 Jul 2023 10:22:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 04695df8ddd971b1
X-CR-MTA-TID: 64aa7808
Received: from 4661e98cbf7b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9EDEE10A-D39B-43D8-9135-9D282C329B63.1;
	Fri, 07 Jul 2023 10:22:43 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4661e98cbf7b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Jul 2023 10:22:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LrC6B4wYzIFfjIvMMzDyZ71QhS7rm79F3+HZtixpRu3jzVo/oCgEO80XneLbjVC2FxEaGQPmwFIWHPequiRZgArFZu82ZKGIpYOBv9ivC34RqtRTy5qgC8ZHybLJwLPkY1xJUTXhJB4HZ2FuuojpQKRQ12S5ivAoDPwXgVqQTnL0Wg9mYBFj2WzwbIUBzzlcYd5+tTnfEVFf64lXqf+O6ClqsF3SjHEZAEFN7beusAiXahuDn9Sjd5+LHn3xnsNceoTGfGw7zst4dODeIS8qOVK8ckqUK8zPRJjSwQWVF5MWOksUnwKmKX8JPwubu8vEAdFIZ8WLWCD0/g2/2JYVPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HuqeUwaMKAJDPEJcikM4VrvR3MUFgER7EPYN2vADKv4=;
 b=SFPTtcDfez8oNMp1XCE01LNODm4dt189KHMaTMZ0TAsUjdEcKifFagCFE5iDb4SMx7aQDXFnna5yKM1PUznQiF62FXPIBr7s+DE7O5Ok1ibgqWFqwLK5/Y0dD5MUSrpitIjjomd/v9kVJmPkttOFaf1LSUenVjG2sSZ53cxWjrWTUfTWETxf+FJZjSBiVNUUm6+zVZKMscMNcwADyNHe8XW5QL17jvW/0EmMQpOV3kW++6LLZKJcoyagPNePbslOTy3+7JB9IwdhZfD70yfOi1kmMMKA7qm2/N5EaKbEeHzCtC/EoPO/v+/bJYTG2D6veAUENfLQIoErKxtIS0Dygw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuqeUwaMKAJDPEJcikM4VrvR3MUFgER7EPYN2vADKv4=;
 b=W8LchyOeLVNanpfP2U4WWxvBjF7l7CmcYkNV2uW74OrOwkFwP3AJnmxSpaxH3S/6jg8409NlT8SjKAiFNczOsoTetI01IL6QgBji1CcgrT0Zv7eDWTxog9QHkHpsA2qjLUARkuvEq+ebVPYk2lfHJjkp6sCQdKN31ZRQ/aMOMNI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB8204.eurprd08.prod.outlook.com (2603:10a6:10:39f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 10:22:41 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 10:22:41 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: Trevor Gamblin <tgamblin@baylibre.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] python3: disable test_cppext ptest
Thread-Topic: [OE-core][PATCH] python3: disable test_cppext ptest
Thread-Index: 
 AQHZsBA6VP/6Vfn9WkaKMEAve8qofa+swaKAgAAK74CAAAMzAIAALQAAgAEcUwCAAACogA==
Date: Fri, 7 Jul 2023 10:22:41 +0000
Message-ID: <94B80420-20B1-4AC0-A077-1A4A28482DE8@arm.com>
References: <20230706134556.2824413-1-tgamblin@baylibre.com>
 <CANNYZj974iNy5tcgmReWXqHBFE8ySEQ9FTBfMCJmUxkk1=X_nA@mail.gmail.com>
 <5633c982-9553-5ee8-167c-04c56577d5e5@baylibre.com>
 <CANNYZj8PW4efL+U1b6HJwyD+24AT3eaYQRxKz5Ai98x1pVbh5g@mail.gmail.com>
 <5efb8cd4-46ee-50dc-40bf-6d5bf61a7c04@baylibre.com>
 <CANNYZj8=A9rX55KuA2wB4jPOM_DWApAds2OaLgE+Cjy=Kva0WQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8=A9rX55KuA2wB4jPOM_DWApAds2OaLgE+Cjy=Kva0WQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB8204:EE_|DBAEUR03FT038:EE_|AS8PR08MB5958:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e0956c9-7d7d-46ad-100c-08db7ed41e47
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 JRFK+i5tnG41MmRo7wgrraqXfjmQjYT3qvCp52fUqJTgg+/E0sxJr+8Yf4ab2keml+5bYD3xYNFjU7t6ewUUJQIn7jRz3YoA3EK4YxBfhBXq6iXPDubOFvuouc/EMKlMpWFOqRYH+Ow4BiKQT1q8elh+mzGgobayncMdKAiI86Mg9Dd7HxiUEweKRwmTZDppRsA5FHBcy0x2aaT+fn6Zp8kUpywXqPtqvdSwope7RN8TZKtPd+IW6T3uCFXYs+y0N8yYWmQtpwGazRheW3WYIArA36e/dFcoiSniKeo8Uero67LCoB6fHmupiU+7CRNhYLwhULk3MeBSLcSsNJLrIxG1diAP7ZI2Euc4grjQA+NA3Ro5w8YpfODchCUOR864oz9EVUVFYAfi4WuvwlSq2n+k9jINR2qtgVrTjsFyoajpa/XhcUA7VZiYfZ66PXtLzJr3rTTcjF86FiBZiQRTDNl7iPW66oKWNraC+voAw3cEEXCAmmn7nQ3nHVTE1kVhlUHORTxveMKEaYylsILaegLoUSvqrj/4izrySPFiHhZCmmUQIV0TWsn/4rIvys/OtmAJs8R2gWT/NvXgRnApm0tc5B0a84x1ooroUeoJdcEuzkHYAcw1BzfCGo99WRPxc7QgQjFkmKIMM+krIa3bPQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(451199021)(76116006)(6486002)(478600001)(54906003)(71200400001)(91956017)(6506007)(66556008)(26005)(6512007)(2906002)(186003)(53546011)(5660300002)(6916009)(64756008)(66946007)(8676002)(4326008)(66446008)(38100700002)(66476007)(8936002)(122000001)(316002)(36756003)(33656002)(41300700001)(86362001)(2616005)(38070700005)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F061ED64C8889A4785B52EAB70C25A42@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8204
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8c7d5f45-3826-4e82-0309-08db7ed418ab
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7+qUowLt9JMZZk2FUyHVxXPW9cGIZZKSKCRfKqiMUb6D6/iSefE69G9yD8WkH08K9Q0W/PcxordJrhs0QAmaaS0ikDhble+Vvq2RpmNskDN1jEbdrAMTfDdGbeHAOuDEoTEhTJF782oVdLD4wlCnos/ZdZxZgGy2u1n2ciW4EOnTm3iSwPtUcGAKmH3eRlUVkCBc2qQxJ/rTsnX4/mKvanVVfVKlYupqrciWwp2Ag958Mgwif86sw8TTsFXEW5G/Pp4I2W/hPn1oQvI+gsS9N60X6dwQuFvI9Q+aj5ALTnh8fiBicmMuq5VOS6Fjn3JduS9ewgx/H5WIxrdmytS8IeYEjCHhx7MEAbyb1WF8Xv/nFDZgodhxDW6nZbI/Pz02Lw7T46H2hWOsoXEk9SizZRHHgkRLSlc+hH5fAmarDktU8XYH86g/tmlVlI57kieDAAW2D2LCpqRKkRsSWD88B6TfNrnzRwsk6k0x5jSG3Vb36g2GjsUxnztBqvW+WCRg8j5SVkTn+5Y74H8q6naK4MUMh5SxSstmrZ+Hedl0DWo5bWY7QuBgvXp3QUOzNsyz89yvZBrGv/BtwhhgUIc0EQDYgdJ02NUspyLvk21nXueGiZ5WZftnVrII6nj92QQQsazRGmZ5WgnkWCdSIMO0WcpY5iNglGV9f4CSLiTlgC0n5lH0SIZlRvtKNL5kGihXl2ZRHTdDoSiuVNomgMqvIhnCdhoyUvFZSrrU1qY/DGAkkp+Uo2kCwtIemRw0qQOM
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199021)(46966006)(40470700004)(36840700001)(5660300002)(41300700001)(8936002)(6862004)(36860700001)(8676002)(83380400001)(82740400003)(316002)(47076005)(2906002)(336012)(356005)(53546011)(40480700001)(81166007)(2616005)(36756003)(70206006)(70586007)(4326008)(82310400005)(40460700003)(86362001)(478600001)(186003)(54906003)(6506007)(6486002)(33656002)(26005)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 10:22:50.9041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0956c9-7d7d-46ad-100c-08db7ed41e47
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5958
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 10:22:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184006

T24gNyBKdWwgMjAyMywgYXQgMTE6MjAsIEFsZXhhbmRlciBLYW5hdmluIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxhbGV4LmthbmF2aW49Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiANCj4gT24gVGh1LCA2IEp1bCAyMDIzIGF0IDE5OjIyLCBUcmV2b3IgR2Ft
YmxpbiA8dGdhbWJsaW5AYmF5bGlicmUuY29tPiB3cm90ZToNCj4+IFVudGlsIHJlY2VudGx5IHll
cywgYnV0IGl0IHNlZW1zIHRoYXQgYSBkaWZmZXJlbnQgaXNzdWUgaGFzIGNyZXB0IGluDQo+PiB0
aGF0IGlzIHByZXZlbnRpbmcgbWUgZnJvbSBzZWVpbmcgdGhlIGxvZ3MgaW4gdGhlIHNhbWUgd2F5
LiBJJ20gbG9va2luZw0KPj4gaW50byBpdC4gSW50ZXJlc3RpbmdseSwgcnVubmluZyBwdGVzdC1y
dW5uZXIgbWFudWFsbHkgdXNlZCB0byBicmVhayBvbiBhDQo+PiBicm9rZW4gcGlwZSBmb3IgbWUg
YmVmb3JlLCBidXQgbm93IGl0J3Mgbm90IGhhcHBlbmluZy4uLg0KPiANCj4gSSB0b29rIGEgbG9v
ay4gVGhlIGN1bHByaXQgaXMgd2hhdCBydW4tcHRlc3QgZG9lczoNCj4gDQo+IFNFVFVQVE9PTFNf
VVNFX0RJU1RVVElMUz1ub25sb2NhbCBweXRob24zIC1tIHRlc3QgLXYgfCBzZWQgLXUgLWUNCj4g
Jy9cLlwuXC4gb2svIHMvXi9QQVNTOiAvZycgLXIgLWUgJy9cLlwuXC4gKEVSUk9SfEZBSUwpLyBz
L14vRkFJTDogL2cnDQo+IC1lICcvXC5cLlwuIHNraXBwZWQvIHMvXi9TS0lQOiAvZycgLWUgJ3Mv
IFwuXC5cLiBvay8vZycgLWUgJ3MvIFwuXC5cLg0KPiBFUlJPUi8vZycgLWUgJ3MvIFwuXC5cLiBG
QUlMLy9nJyAtZSAncy8gXC5cLlwuIHNraXBwZWQvL2cnDQo+IA0KPiBUaGlzIGhhcyB0d28gcHJv
YmxlbXM6DQo+IA0KPiAxLiBQcm9jZXNzaW5nIG91dHB1dCB3aXRoIHNlZCB0ZW5kcyB0byBxdWll
dGx5IHJlZ3Jlc3MgKG5vdCB0byBtZW50aW9uDQo+IGl0J3MgZGlmZmljdWx0IHRvIHJlYWQpLCBh
bmQgd2Ugc2hvdWxkIGRpc2NvdXJhZ2UgdXNlIG9mIHNlZCBhY3Jvc3MNCj4geW9jdG8gc3Ryb25n
ZXIgdGhhbiB3ZSBjdXJyZW50bHkgZG8uIFBhcnRpY3VsYXJseSBoZXJlIHRoZSB0ZXN0cyBmYWls
DQo+IGluIGEgd2F5IHRoYXQgdGhlIHNlZCBleHByZXNzaW9uIGlzbid0IGNhdGNoaW5nIChFUlJP
UiB3aXRob3V0IGxlYWRpbmcNCj4gZG90cyBJIHRoaW5rKS4NCg0KU28gSSBzdGFydGVkIG9uIHRo
aXMsIGFuZCB0aGVyZeKAmXMgYSB1bml0dGVzdCBydW5uZXIgaW4gcHl0aG9uMy11bml0dGVzdC1h
dXRvbWFrZS1vdXRwdXQgd2hpY2ggaGFzIG91ciBvdXRwdXQgZm9ybWF0LiAgVGhlIHByb2JsZW0g
d2l0aCBweXRob27igJlzIHRlc3QgbW9kdWxlIGlzIHRoYXQgaXQgYWxzbyBoYXMgaXRzIG93biBy
dW5uZXIsIHNvIHRoZSB0cmljayB3b3VsZCBiZSBpbnRlcmZhY2luZyB0aGUgdHdvLg0KDQpSb3Nz

