Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC47EB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 14:55:10 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.73])
 by mx.groups.io with SMTP id smtpd.web11.41730.1689000905105925434
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 07:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=vbOq4wpM;
 spf=pass (domain: arm.com, ip: 40.107.22.73, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVgbocYgyesCYhpM3pTdL9mQAbocXpe+U9pe82z7Z+0=;
 b=vbOq4wpMVzWaIbZxjT81/vY+dm/rm7M4rFfSi2kZ5IDJ/as9HOjh+Wz5sEUPC89PWZZwXQmJhTgdiVVuoboHwwCtAUsjQTG91P674sAQNiZND9eSf4U54zdqGelzviQcRrxxbitd9Zm+5iVnsUv5H+eJEI/juRk3Px9XeGydhek=
Received: from DU2PR04CA0214.eurprd04.prod.outlook.com (2603:10a6:10:2b1::9)
 by AS2PR08MB8748.eurprd08.prod.outlook.com (2603:10a6:20b:544::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.29; Mon, 10 Jul
 2023 14:54:59 +0000
Received: from DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::82) by DU2PR04CA0214.outlook.office365.com
 (2603:10a6:10:2b1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30 via Frontend
 Transport; Mon, 10 Jul 2023 14:54:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT007.mail.protection.outlook.com (100.127.142.161) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.19 via Frontend Transport; Mon, 10 Jul 2023 14:54:59 +0000
Received: ("Tessian outbound f9124736ff4f:v145"); Mon, 10 Jul 2023 14:54:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e227cca8e2620fbd
X-CR-MTA-TID: 64aa7808
Received: from 86d39b02a70f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AEC0A1C6-8216-4C10-B40F-6602D0267D81.1;
	Mon, 10 Jul 2023 14:54:52 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 86d39b02a70f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 10 Jul 2023 14:54:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3r7LxG2iOu5P8Hov5INXd1GAWeVwVnQ0uJsdC5lET/7+GTpsl1UwZqulHuNTdxUjxCunjNF98hwAUlJfQsMUmWGo09sqnj78cseis3MC3maC5O/a91ug+epPHmKywRFFDJElFSDbucucWNT4TtCvpZ7qOVZbWwx65Xva8dXDgzOzkBkIpMRQIy9dU2L/H0RXBmvv7srGyLLzMXHArOWXzi0t5i1bQ8nYXSpwmNCJR9p1nLPISmPXjK/m+PYkeradtv/N+2gAAOehF7k3fnJpFls9jHPyD10uisfp3Q0Y0T9n6B6CNkNoc+jm3EcLsPNbXuV341p6g1gRejYyMc15w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVgbocYgyesCYhpM3pTdL9mQAbocXpe+U9pe82z7Z+0=;
 b=SzIIsjFnba2s9gyQHKxMPl/vmKmi6adXq52d4bLNtSvcrMjpSbC1Bbj5XZWTzeQPUA0bF8GsqOJ9JQaPIPk7r/g96HpDvGDa7cDvvoRvIsU3ZUyt9dEvAgOHYdZhGKCyWSGGN/xKxEGzVxyK7fHBqTh3C5fXh6rtSiIzjH6AiznVNNXwI/4p0gASCT56i20byRuO3Wgp2NOEXDc7nzikQtifosZfHIhGm9jyuugCEjddYSeNgo6D/twLDINlKyHz/4T40gvGzVGGiC55lT6aHHbWzrKxxMS1dg56BPrd/wy9zBpNd8cYVTov3PU/5yGP1dpaeE6ktrioZ3F9Q5TLgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVgbocYgyesCYhpM3pTdL9mQAbocXpe+U9pe82z7Z+0=;
 b=vbOq4wpMVzWaIbZxjT81/vY+dm/rm7M4rFfSi2kZ5IDJ/as9HOjh+Wz5sEUPC89PWZZwXQmJhTgdiVVuoboHwwCtAUsjQTG91P674sAQNiZND9eSf4U54zdqGelzviQcRrxxbitd9Zm+5iVnsUv5H+eJEI/juRk3Px9XeGydhek=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6292.eurprd08.prod.outlook.com (2603:10a6:20b:2d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Mon, 10 Jul
 2023 14:54:50 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 14:54:50 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 00/15] kernel: consolidated pull request
Thread-Topic: [OE-core] [PATCH 00/15] kernel: consolidated pull request
Thread-Index: AQHZst2J7P4XQ4eTfEqsbgwa4b4F/K+zFywA
Date: Mon, 10 Jul 2023 14:54:50 +0000
Message-ID: <CDACE6FE-F991-4E69-BC69-B1BEC6B6B761@arm.com>
References: <cover.1688958788.git.bruce.ashfield@gmail.com>
In-Reply-To: <cover.1688958788.git.bruce.ashfield@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB6292:EE_|DBAEUR03FT007:EE_|AS2PR08MB8748:EE_
X-MS-Office365-Filtering-Correlation-Id: bed89c4b-f299-4f7b-83d5-08db8155a1e8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 pXu31gnB7MXocATAs4afHHew7ZciVtBpM9oMvOwVoba/6XSqnZ7VjAj47OIAmM0LJQFk5+gbtsJoyMFKXXc0JaTFRYCqmy5g+XwC9jOb4pQe5D0dwdNZWsPoi6K/pydvXy6ItKI6FSWu9gLBwDBDXr20Iky1QlYQx55Q3V5J9S+2FKkaIfSAUIDxS6Nsf9TgWUXXWMWKHzDlxjZEVoS19lQ0qK0BtAHYDTHWY4N5lBBY/C9yhN5lAG3uhCHcoXXryjFGzTlxn/d4M8Qd3DXgJFZXDYoMlK3YXYmrQop8DIq7jIPmKBJuzi3i2uXg3q8PIYfy9UX8FrRE34PF99tq9dSoQAyEm9Rs838LLHztH6HTutKZqleY0vWza/CBHy9AdmH6XCQUNwUiVGHocs/eEKN1PTTFEJ9UparUQjgI6RYclDtXwLcovSJnd1TUYJy8tWgfyNdW6v4KO1p7UhXn6NTx00rsc7ZkQnfdVyhjM9UnhaW8wktCI5bissD21wxXxmek3E5t3v3jNIL6AL+i9xSt9sRAZzhcW39z2ypnt74CspDjPfwwYTxnkgWGPF8g9aueUqUYHJbtNEJ4UcsiCxJC11EcbSGIVpEq52Vwr3v5cBcNi2CAV38deTFiUGckDu23tqBEFw1rgOgeKJs4zw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39850400004)(136003)(396003)(366004)(451199021)(5660300002)(8676002)(8936002)(316002)(66946007)(66556008)(66476007)(66446008)(64756008)(41300700001)(76116006)(2906002)(6916009)(4326008)(91956017)(54906003)(71200400001)(6486002)(6512007)(966005)(6506007)(53546011)(26005)(186003)(83380400001)(4744005)(2616005)(38100700002)(478600001)(122000001)(38070700005)(36756003)(33656002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A97BE075AD53E3449D79F304CB40CD34@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6292
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4891961c-3a42-4957-a734-08db81559cf5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QPT+/lbsQuKsZDupJnC1h+waTUBsGPJm9F5c1joXtiJy+ei7D8Ss4h6D5VabZAbQfIm3LAZAadZFviEbxM8wZK23VNeE6X7T6v472kHUB0zmhUkiY9yFVZ89kTsFr+W3uaFbvT0UOv+EDfmbYwoXM6PG9JD6GSxz0K9Krf8MMeKxZuq1vhZmHWjLJDl4sUw0uKeXIOSlg6m7FpMKsEcBL0vnaUEMwuYH+qwhrcHTNKCO4WQk1BqHxNAtlMH2OEEu+cVHulcNeS+n7kGco4+dZen3QSeFeuNINBmI0GwNk/4TSGV8Cd1a8YStx4v7Zq7XGRXc+GJ8XnL3yQQ4uaO8H51IS0xroFyq0PYbW5+Y4NcOdiI5iwXpRSJabEBN66182xvXWBAGYbSjZy91IflUQMmqvByU/+OETt5i4Y8xdUIG3hBoP1XQxpz06dPtq1Q4plcv6FwqeXfuN49PO/55ZsHYBIkGFa+XZKxJaeBV94cUz0yUadwccWDriyJouTmHv3nO5IQsKVcaCoHht3SbyTpBGEdbK+/KwzQg/PKcQtB5dRwKGwwt3/1yAZ47vSJ4odBJCP0uqIyo8OxK7GQSxvrz6/vx7zQu36DmlLVrmC5xerbLNmWT2BRM0mD2a7BodM6pWbQYxTBQyZJjf8PQnEpUe4m9q/Oun58D9OKz78GCwKwReoWfvB+svkXCBxqfP/Kj04vPyOokfsFCTjKKlLBagQ61Cl8BwosLboHKbvU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199021)(40470700004)(36840700001)(46966006)(40460700003)(186003)(53546011)(26005)(6506007)(2616005)(966005)(6512007)(36860700001)(336012)(83380400001)(47076005)(4744005)(41300700001)(4326008)(316002)(2906002)(6862004)(8676002)(8936002)(5660300002)(478600001)(70586007)(70206006)(54906003)(40480700001)(36756003)(33656002)(6486002)(81166007)(356005)(86362001)(82310400005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 14:54:59.1474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bed89c4b-f299-4f7b-83d5-08db8155a1e8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8748
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 14:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184081

T24gMTAgSnVsIDIwMjMsIGF0IDA0OjIwLCBCcnVjZSBBc2hmaWVsZCB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8YnJ1Y2UuYXNoZmllbGQ9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiBIZXJlJ3MgdGhlIGxhdGVzdCBxdWV1ZWQga2VybmVsIGNoYW5nZXMuIFRo
ZXJlIGFyZSB0aGUgZXhwZWN0ZCAtc3RhYmxlIHVwZGF0ZXMNCj4gNi4xLCBidXQgdGhvc2Ugb2Yg
Y291cnNlIGFyZW4ndCB0aGUgbW9zdCBpbnRlcmVzdGluZyBwYXJ0IG9mIHRoaXMgcXVldWUuDQoN
Cg0KSeKAmXZlIG5vdCB0cmlhZ2VkIHRoZW0geWV0IGFzIGl04oCZcyBzdGlsbCBidWlsZGluZywg
YnV0IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRl
cnMvODMvYnVpbGRzLzU1NzcgaXMganVzdCB0aGlzIGJyYW5jaCBvbiB0b3Agb2YgbWFzdGVyIGFu
ZCBoYXMgc29tZSBuZXcgZmFpbHVyZXMvd2FybmluZ3MuDQoNClJvc3M=

