Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2D7C7618A
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 17:07:44 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.60])
 by mx.groups.io with SMTP id smtpd.web11.213.1679332060829358249
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 10:07:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=XCEY1Fb0;
 spf=pass (domain: arm.com, ip: 40.107.104.60, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1DRQLHMVROJfF3srhlfsBm775Hs6VrK+20IMmzKBK0=;
 b=XCEY1Fb0J+2sefR9EuucaP8G3zOQBZxgc+o/ZmBF4aE8SyR2Jw5klRCp3YrEGu43QnVDdPyIJfOARu3Nvf58RrezXcsoWyDX1pIRZw8/Ux8ISQLuEAUfXB9H5/6cA518kW3lCj0do318AZ709nkW1cjfM4u3fSgsazDy0S1u1CY=
Received: from DB6P195CA0018.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::28) by
 AM9PR08MB5985.eurprd08.prod.outlook.com (2603:10a6:20b:286::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Mon, 20 Mar 2023 17:07:34 +0000
Received: from DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::ea) by DB6P195CA0018.outlook.office365.com
 (2603:10a6:4:cb::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Mon, 20 Mar 2023 17:07:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT046.mail.protection.outlook.com (100.127.142.67) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.15 via Frontend Transport; Mon, 20 Mar 2023 17:07:34 +0000
Received: ("Tessian outbound 2ba0ed2ebb9f:v135"); Mon, 20 Mar 2023 17:07:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 16d387738d98c2aa
X-CR-MTA-TID: 64aa7808
Received: from a441712694d4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4BB95318-AF33-4839-8857-AFE3BF95095D.1;
	Mon, 20 Mar 2023 17:07:28 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a441712694d4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 20 Mar 2023 17:07:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YkzUBhM60vUZuEv7vLD3NxE8tzU78ecaNYu3MB5tNC1O+xWC6uxaVFMJcJdTxJr32XzW7uRhwvVKZnl2LDOhJeuV/NfM5u1fPWQDzKgyNrsrxRcLIYk89jD740iOaCXZSkMndCpfHbrcAdOE1miZE2duU1+BV5I2J/aSs3rtB6iuuV/vpGga8hBXLUzC9L8xqIhNvxz3Za3ud7hCUwD9wRlk1O1sI3n3AFoEtIaFpjp6j01QLpzoTkkoi+SeeOuKBgpEc+ZpPiN8fqm8vE5W60SgA9B2Wn/3c6l55ZJEK5QWuIMlOFu6qBYOOf0GPLbaWGpEAYkOrndD9aEg22wXvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1DRQLHMVROJfF3srhlfsBm775Hs6VrK+20IMmzKBK0=;
 b=MyeJ09cDg95c4M9rJxObWNGwrfOtu+/YQoccK8UXEmhenxnXG4v2D1Cm6IP0ZkTFeB0afElkx/q2Znr3TaVkZoVzd23QAVKBKm9+XkoZmtDSR3Gx9v5Lummnt/pP8lyovCEPo37EQqTGTmC7efEDFjcHGlb606u1skFfYDTg+pNFvYw+ZuchdGMEEkfa1xww1qa9VYKJZrKt/fEeMkELMtmNOWApqDIzzF0dFvzBkBck9hEYCBqp571O1qVjnBd9KoiIoV+NnBpUUq81s3ZjXzJXZFzSFT8PQ1cShgPnfbSjfMeqaT2jp13izRrmJfsP060Awp0BQ8xdr+TPXCkSPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1DRQLHMVROJfF3srhlfsBm775Hs6VrK+20IMmzKBK0=;
 b=XCEY1Fb0J+2sefR9EuucaP8G3zOQBZxgc+o/ZmBF4aE8SyR2Jw5klRCp3YrEGu43QnVDdPyIJfOARu3Nvf58RrezXcsoWyDX1pIRZw8/Ux8ISQLuEAUfXB9H5/6cA518kW3lCj0do318AZ709nkW1cjfM4u3fSgsazDy0S1u1CY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6363.eurprd08.prod.outlook.com (2603:10a6:10:257::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 17:07:21 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6178.024; Mon, 20 Mar 2023
 17:07:20 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 10/17] python3-markupsafe: use
 python3-unittest-automake-output
Thread-Topic: [OE-core] [PATCH 10/17] python3-markupsafe: use
 python3-unittest-automake-output
Thread-Index: AQHZWy/90gs4/3vY/UWXJ2E5fotmoa8D5i0AgAAARgA=
Date: Mon, 20 Mar 2023 17:07:20 +0000
Message-ID: <CB902728-4A52-43AF-9692-FAB878C1AFEC@arm.com>
References: <20230320132751.518693-1-ross.burton@arm.com>
 <20230320132751.518693-10-ross.burton@arm.com>
 <9212d8f0f76da35ede627287be8cfe48f9b3fea8.camel@linuxfoundation.org>
In-Reply-To: 
 <9212d8f0f76da35ede627287be8cfe48f9b3fea8.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB6363:EE_|DBAEUR03FT046:EE_|AM9PR08MB5985:EE_
X-MS-Office365-Filtering-Correlation-Id: f8ff8b70-b176-41f3-0073-08db29659958
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 tWO7wxTYo9nFf1nsd6xTs+WP8VJh+f2GnNMs8LR8bRZkcc5L9/xqllyRvNE6LVgPIsEMpmneCavGGCVkaDpytxpdYheFUNGDRNs/zjJL8tYDjUw1+lIwG0RrV2GZW5IU1syiNPy37S8Mkm4zFzZG512zXVMraSDHq9Jc7Oy8IQ6JcquJyTPkd0ygxC8xeAipA8ZMPMq37nq513OS80JIBJhD7i448YirCxbixFsqpyfQunIh1nCzrYLqw3k8ncpvBaPM6lUmDBoDoytw2hSlkqrQSONMP87lpBlQX+k9weA4pYFfRvXqfJPH5offyCmvpuJUWPYg1bLi1qKvM5OvgK/nBOYSmaY6HU69CllbmDCAdB3ah+aKcB8TmkFlMwkVGqc0CEyxkVAYjffboFfKJirhdxhCHeKw+SMjDDxeABcr29G4LqIkfF93OncoeTWD5dfy3AjpZyx2uAbBnidn2MVDHLpKnP8327L5D6sVLBbt/wSJR8pmDiq5vWERovI8Kxn3E/W4T9nXlJBe5MbqEULsLAMQ8w++QhbeJAh6eIsTfzPr+BfwOF9+C9XiVB5n8g/0hOoMFQUA1fLyUK5EfMEUYSlOWMia7aJuzn2zWWoRHmNefhFwHxWp1T1oaVyPKgCwwoz69dP9F1ZdUSbkbOBh/+OHYqAa9PTst1ZCqH8oTcRABcKRw2lygSVO7RPmhcRPujy9BO4UQrGCHnVRcdnKzHTonxwy5akmm3W0u2w=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(451199018)(86362001)(36756003)(33656002)(71200400001)(478600001)(91956017)(66556008)(66476007)(83380400001)(66946007)(6916009)(316002)(4326008)(53546011)(64756008)(186003)(6512007)(26005)(6506007)(2616005)(6486002)(76116006)(8676002)(2906002)(41300700001)(66446008)(38100700002)(122000001)(38070700005)(8936002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFD64817D1040F448DA28F21BC372F9C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6363
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8fa79e3f-164c-4f67-07c4-08db296590ff
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	E5O3adJ37eszFxekwoSu3Va+SVVmwnpnM50QppXQDRm6rWoictXYerw4qH4ssHDYdwhKBLvcX1YMCTdbHCS5Zk+ls2ACWxmz/F5wTF9PTS/iMEArwABpC72Sub8Fcw5t9yE9SjhcsZo+8mjrCJ9Z8rNYD00STejjor4Rnb+x9n9mGrIxgmPbH1Tm8RuZ3Fy7+dczbcyStGKgjsFpK5DdVdX5Zsqdjpg0TWR4GuOPcJfcC8hvKZYfHqokcVp0bo2mDLptVq+PcJ/Qde5R7zIwCC0r181i3dsbQ7DeHjk+Jj/AIe4CsJuKZcO5iAPvHN7P7YjL34duvjUARW4VHK7M7qIlOHTG2uWnyU3b1AmV4C0mBrNGn9Cd498wghbiJHjLiqjPS+RhIlRFdmNlrk6BFBWIlOchsgamWr1iPr9CDJJh6lxYBgVW053DOWoRA81KmVpaMwNSXbJ2Sj6FS6fd0y+d5gTGrfojo3/Mg7QnFYethI9EQLCV1w1QUnFbtCU9sjQdLyZ7inQ2Ub8oZqZQqnnBQT/88xd1/A3MA0c7y8M+kRq19h/J28Hqe2ijh2hooNtAkY2IxlmLG5ZIwqMnuud0YieZHiikFSytF18nQ8/Bddle/koSzfluFXqg0VwO95GLi5M4vUa+Rl9za/lwOEaTeQKIiZXTJOQC2ku6QRoeaNRKv/1pieCtPHhCx6Ng2kk6Ofxns9gHG+ivrP6ULg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199018)(46966006)(40470700004)(36840700001)(2616005)(186003)(47076005)(6486002)(4326008)(83380400001)(478600001)(336012)(316002)(70206006)(8676002)(70586007)(26005)(6512007)(53546011)(6506007)(36860700001)(41300700001)(5660300002)(8936002)(6862004)(82740400003)(81166007)(40460700003)(2906002)(356005)(86362001)(82310400005)(36756003)(40480700001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 17:07:34.4017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ff8b70-b176-41f3-0073-08db29659958
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5985
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 17:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178835

T24gMjAgTWFyIDIwMjMsIGF0IDE3OjA2LCBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBNb24sIDIwMjMtMDMtMjAgYXQg
MTM6MjcgKzAwMDAsIFJvc3MgQnVydG9uIHdyb3RlOg0KPj4gSW5zdGVhZCBvZiB1c2luZyBzZWQg
dG8gcmVmb3JtYXQgdGhlIG91dHB1dCB1c2UgdGhpcyBuZXcgbW9kdWxlLg0KPj4gDQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4NCj4+IC0tLQ0KPj4g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmt1cHNhZmUvcnVuLXB0ZXN0
IHwgMiArLQ0KPj4gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmt1cHNh
ZmVfMi4xLjIuYmIgIHwgNCArKy0tDQo+PiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1tYXJrdXBzYWZlL3J1bi1wdGVzdCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrdXBzYWZlL3J1bi1wdGVzdA0KPj4gaW5kZXggNWNl
YzcxMTY5NjguLjhkMjAxN2QzOWNlIDEwMDY0NA0KPj4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLW1hcmt1cHNhZmUvcnVuLXB0ZXN0DQo+PiArKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya3Vwc2FmZS9ydW4tcHRlc3QNCj4+IEBA
IC0xLDMgKzEsMyBAQA0KPj4gIyEvYmluL3NoDQo+PiANCj4+IC1weXRlc3QNCj4+ICtweXRlc3Qg
LS1hdXRvbWFrZQ0KPj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1tYXJrdXBzYWZlXzIuMS4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLW1hcmt1cHNhZmVfMi4xLjIuYmINCj4+IGluZGV4IGY0ZjBhZDJkZjBmLi4zMjQy
MDUyOTYzNSAxMDA2NDQNCj4+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1tYXJrdXBzYWZlXzIuMS4yLmJiDQo+PiArKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtbWFya3Vwc2FmZV8yLjEuMi5iYg0KPj4gQEAgLTYsOCArNiw3IEBAIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UucnN0O21kNT1mZmVmZmE1OWM5MGM5YzRh
MDMzYzc1NzRmOGYzZmI3NSINCj4+IFNSQ19VUklbc2hhMjU2c3VtXSA9ICJhYmNhYmM4YzJiMjYw
MzZkNjJkNGM3NDYzODFhNmY3Y2Y2MGFhZmNjNjUzMTk4YWQ2NzgzMDY5ODZiMDk0NTBkIg0KPj4g
DQo+PiBQWVBJX1BBQ0tBR0UgPSAiTWFya3VwU2FmZSINCj4+IC1pbmhlcml0IHB5cGkgc2V0dXB0
b29sczMNCj4+IC1pbmhlcml0ICR7QGJiLnV0aWxzLmZpbHRlcignRElTVFJPX0ZFQVRVUkVTJywg
J3B0ZXN0JywgZCl9DQo+PiAraW5oZXJpdCBweXBpIHNldHVwdG9vbHMzIHB0ZXN0DQo+PiANCj4+
IFJERVBFTkRTOiR7UE59ICs9ICIke1BZVEhPTl9QTn0tc3RyaW5nb2xkIg0KPj4gDQo+PiBAQCAt
MTksNiArMTgsNyBAQCBTUkNfVVJJICs9ICIgXA0KPj4gDQo+PiBSREVQRU5EUzoke1BOfS1wdGVz
dCArPSAiIFwNCj4+ICR7UFlUSE9OX1BOfS1weXRlc3QgXA0KPj4gKyAke1BZVEhPTl9QTn0tdW5p
dHRlc3QtYXV0b21ha2Utb3V0cHV0IFwNCj4+ICINCj4+IA0KPj4gZG9faW5zdGFsbF9wdGVzdCgp
IHsNCj4gDQo+IFdoZXJlIGlzIHNlZCBiZWluZyB1c2VkIHRvIHJlZm9ybWF0IHRoZSBvdXRwdXQ/
IEknbSBtYWlubHkgcHJvdmluZyBJDQo+IGRpZCByZWFkIHRoZSBwYXRjaGVzIDopDQoNCllvdSBn
b3QgbWU6IHRoaXMgb25lIGRpZG7igJl0IGV2ZW4gZG8gdGhlIHNlZCBkYW5jZSBidXQgSSB3YXMg
Y29weS9wYXN0aW5nIHRoZSBjb21taXQgbWVzc2FnZS4gOikNCg0KUm9zcw==

