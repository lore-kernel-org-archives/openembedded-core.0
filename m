Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB79CC4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 18:18:33 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.52])
 by mx.groups.io with SMTP id smtpd.web10.659.1667931504642493462
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 10:18:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=YXfZqCUx;
 spf=pass (domain: arm.com, ip: 40.107.6.52, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=avxi02ALUfyRmIY3L3G6+Nu8r78N4RBXC9eZWvkAHgNvlZqdcsMbwHDraJ93kJxKr0r51V+tYECXGL/JazZ1uJb42hI1MBJV0L47AvP/fL9lwGywUafuHPIc1ecBesFV4Baxh7smHeR+eRzM4LAkygm1b/3jOxDWuXNeIJ2eZ8iysiaQT0eYY2L8elMSi6kE6QLID4bbsXP/kg6FOADX/C2xUI3UFDps97yn2+m010nkB4MhnI+NvMXF5R2y+011iej3QTgSEOC6JDPyIlkCQTB1LqlaofIUU/mfarYEa6FWrhDSCc8M/0/Dw19vPmbnRWNsLrxsPuNFYys/fvHqaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwxrEau70jJbFg6g3/8Bx6cn56M7rmACLY/uHiN7P2w=;
 b=L9+q8NqwL4seLR1QiofM0ytq+S/DQ63p8xxMpZxDf+3i1KbswCjHLeGdp0KoqJ0kftbLZncIgfmb2YIlPBf9LFZy7bLFJRLKfiyN2vqdR37IE9Uzw2mVJkqI97IVqHip3YduEeIsvp9+hraumAS9PsrP/NmDyV6RYlgweDWtqtOVfoiizYp83xVAiZwGs5M8CRs1H3RdRNaNqe73+L3RDQ1NwMc1w4QD5gEnVks4W3dHQf9cOT9roYkNdCPsMPg3a0TS5G+55IcTzpHhYw+sZlKZuahYTFy6qz5jfZo+QFx/07bpJT4Pff80MVwGuYjuBDAjyMO6L3O12ENNOonWSg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwxrEau70jJbFg6g3/8Bx6cn56M7rmACLY/uHiN7P2w=;
 b=YXfZqCUxsq3mVpru5aUV9OCSEkzMxT3eckLF/2dRuTFeg6RkrMu4uuUm6luRZs5wdaFC4J/q3LLeDLkBSOweJ1TFWgC3tL+DO8iL5oMVPjcTNbcv+ViQv5R6reqpiYX3HvYVeYGYXJauEv8+Gvfo7vmk2KN7K0TlvtVV7uJghgM=
Received: from FR0P281CA0141.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:96::12)
 by GV1PR08MB8179.eurprd08.prod.outlook.com (2603:10a6:150:91::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 18:18:20 +0000
Received: from VI1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:96:cafe::d3) by FR0P281CA0141.outlook.office365.com
 (2603:10a6:d10:96::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12 via Frontend
 Transport; Tue, 8 Nov 2022 18:18:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT003.mail.protection.outlook.com (100.127.144.82) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Tue, 8 Nov 2022 18:18:19 +0000
Received: ("Tessian outbound 0800d254cb3b:v130"); Tue, 08 Nov 2022 18:18:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6ed61e0506e96201
X-CR-MTA-TID: 64aa7808
Received: from 014926386127.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A85FC99B-8593-429C-97BA-21A08A90675D.1;
	Tue, 08 Nov 2022 18:15:56 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 014926386127.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Nov 2022 18:15:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPNbNlgCagi5rHyK85UtNs6QPw2FTZXBZqp9ySO3PpO+x0hX4DjGCaHng/EHVp4r3RLuxBmuZnpidaZbO13BUWTCdnuyQYFYu3H4Us7BwSBCWqtxL8m0fy4Y1JiKS0BGxmUtcHvdUVieEh8zNOBOYF7HCI0pLx4wO2v5Oqr2mg+8qH+63m6W+kHRay5QQE0Wfdk/3CIVXwolN1bbfcJSfyCsh5tTzz9HMHJqkUW6DFxtrew/cdExt7LlVOv5dmm/OCybDlETso4rpvBG4c2doUswk7j9Tauu1UlJyWfg2+KFcFcFDnDxwVp/mtyIN8+CRK36X1zrP5hTsnyWMjodJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwxrEau70jJbFg6g3/8Bx6cn56M7rmACLY/uHiN7P2w=;
 b=cj9m7RqIQa61l05tIq1gnsDeeifWh3TNO+f/St6YTVNYaxE+DCX9Ns/bA8VLLCBeYSeiyxy2Ku8RPPp5aZcMAEo/Am01RJucP4dHUqwDN8LtG9GEuc3ykyhVv7R6le+QHZvTib/W77R3J+5uGW3w8FtPN6v0Hyp4tCzjBOeHOYPkA3EXI1s/wsyEjJ8nLlhzyLf8JwjE9iFghq24DieMhyUdzQbpOx+GI7rFS3ctDM/lNaL4WZXsfJniFrdev4zPR+ght7WwJ36FIk3x8iIAW52/0aw06mx7CDHggsgCsZ7TnQwWGfNgB9N7703Q4msA+vGoDWfpQQaV606r520r9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwxrEau70jJbFg6g3/8Bx6cn56M7rmACLY/uHiN7P2w=;
 b=YXfZqCUxsq3mVpru5aUV9OCSEkzMxT3eckLF/2dRuTFeg6RkrMu4uuUm6luRZs5wdaFC4J/q3LLeDLkBSOweJ1TFWgC3tL+DO8iL5oMVPjcTNbcv+ViQv5R6reqpiYX3HvYVeYGYXJauEv8+Gvfo7vmk2KN7K0TlvtVV7uJghgM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9017.eurprd08.prod.outlook.com (2603:10a6:20b:5b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 18:15:52 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f%5]) with mapi id 15.20.5813.011; Tue, 8 Nov 2022
 18:15:52 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: Openembedded Core <openembedded-core@lists.openembedded.org>, Alexander
 Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 47/48] sanity.bbclass: do not check for presence
 of distutils
Thread-Topic: [OE-core] [PATCH 47/48] sanity.bbclass: do not check for
 presence of distutils
Thread-Index: AQHY8rnmxICAQrTBNUmCekczx70uQK41VsUA
Date: Tue, 8 Nov 2022 18:15:52 +0000
Message-ID: <29FE1D7A-808C-4EFA-880F-5D7C055C7E2E@arm.com>
References: <20221107145508.1051404-1-alex@linutronix.de>
 <20221107145508.1051404-47-alex@linutronix.de>
In-Reply-To: <20221107145508.1051404-47-alex@linutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9017:EE_|VI1EUR03FT003:EE_|GV1PR08MB8179:EE_
X-MS-Office365-Filtering-Correlation-Id: dccdd9d2-2c6d-4158-fc92-08dac1b59d22
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 s61oRrWZ6YxZvxpOfAjGodief5f8p7wP6LCJIcWGxElT5MAXJREkGWRRyRV3Lunb/iWk0C+NwzmZWBnsyRuRAsVriqVog2XsSpDOhLjAUXczrn0ANUAI/GtVGdHg2ElRuEApL/Mq3QjMlYBM7RDTcNDo4Q4G/e6yY90FsYEe1lAN2914z7tm8DxESLX7T3w7IczEAeJa1eV8IJwaLlcsA3q5Gmcm030VIsAbPuRmkZq4ydJJftppSgjDoBaHtVhf/rtphG0sh/cu+mElY3s7fNmjAAr+sNvvUMwutgDeyKGxA6QID47XC2NbS60G6is+b33dzMmSyNz9IDugwtdx3XKvLNz+N5iNSXExoNAdJVU4dsPQE47oV5VcG6VO1uNbtJP49CZ8u/PARI1b4x/gGoNekBpKy2YiwcjUNXPrgN7n1gtuC5Hfm+nPg/b8pDjFCn1TBZb9lk2QWH9yXRtkD3voxcTSeFMlPDzJEFjl36pPjgQrrC6/WfKKXUv061PYA5loWxE1KnnHw7SxTsvoUqi/eanwTopPisE4cdb8aKXi8T2oMtCVVTIc6VimLPFWm25utSWD/6IUDalQuo2LyrZeGci1vNLXYq1tI7R4lbsn91z4IAjP5sDNROy9+8MuN1H3PdfZSynTGFAkq1pLQZxbZSb8GKGaDVl1sp+BCnSHsn9V5ejE05UFhEoGEsZGePxZdC5t/c3zRfXoHely776crGIGCWaS6xB0OGzE0+WffQ10vsAsaYQ2F1CCxK+K3Zrb78OqM6Bc/d5sPsDDxpKGjDKMgcn5iNVk/rcCJQk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(451199015)(53546011)(26005)(2616005)(38100700002)(122000001)(66946007)(6506007)(5660300002)(4744005)(186003)(6512007)(2906002)(71200400001)(66446008)(54906003)(6486002)(66556008)(41300700001)(66476007)(478600001)(316002)(6916009)(8676002)(8936002)(91956017)(4326008)(64756008)(76116006)(36756003)(33656002)(38070700005)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E533E1FEC377C4AACE8BDC228C75B1B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9017
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a8a27787-bbf0-4407-d8c3-08dac1b5456c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yedeh5NDYctCPMCROs7GODgmCkvGVaIeq1OeHg/Y4RrwItBVDs7FoZEIBEGkZOXu3P0YuBGMlraScc00W6LSef4/H8edBUBm045iIX3IT13K+X/BZykX5ooczsaNSx5HRTGB+9sDc9qIYQhh5CtdjnUgou0J8OhmDToASSGmHXWOX+07BTcglhGVr5kBRYrMj5ME5WP/tk5N8GmhtEIHUmJgfUuSRpzbgD9ze11hn46NsCCRXyN3CBkw6eFPFkYfpk8PURpSmnF36VwX2vLxFj+IfDt6QfFo0HiitRaJln0SrdXnyGE+IFIZPpgGhYJ8/9bz5mIwcO08bIKkFZu+WePaRBn3dnWAY7OjnD0ebk/0GOI9UjjoCs2z1ZJ6jwI30AqKN1wvSGfjEH/3fYdIn8rAXLyfyI/62J9I/2evQHEVAfuS+HbcmuzPUEghggINckIiJzKaytxnbKJfqfub2VjZkz1XU+HzD8wZu35WeIeJE2rZK5NMtjUpCiT0rppIAqY4M3wdSdr6XCs/MvfEV2be+V7pMJInhC8/BIJ9iKUXuztDWx7hduMj9gVW839agXU23kn7x8k4gY4b16hSTAK1SeTT6iHW4k7hx5HrSW8+oGw/5kx/WKozOolNZ/BhuW14zLxLdjqoLqYBuLy0UtWoMcCm029qkCmfaUu4QC8Id9dnqmBqffmB7QE8sbCBp3w/lo5REoKNPFTqdP8yOQcYe0LTZsCGCbhD2hifri3RgEnpDGi8jsAbnzCSeTCfGt6nGk31v/Ivw1nSHYz6xw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199015)(36840700001)(40470700004)(46966006)(478600001)(6486002)(336012)(47076005)(316002)(356005)(40460700003)(81166007)(8936002)(2906002)(186003)(2616005)(82740400003)(54906003)(86362001)(53546011)(36756003)(26005)(6512007)(33656002)(6506007)(107886003)(41300700001)(8676002)(40480700001)(82310400005)(4326008)(70586007)(70206006)(5660300002)(6862004)(4744005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 18:18:19.4966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dccdd9d2-2c6d-4158-fc92-08dac1b59d22
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8179
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 18:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172989

T24gNyBOb3YgMjAyMiwgYXQgMTQ6NTUsIEFsZXhhbmRlciBLYW5hdmluIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxhbGV4LmthbmF2aW49Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiAgICAgIyBDaGVjayB0aGUgcHl0aG9uIGluc3RhbGwgaXMgY29tcGxldGUu
IEV4YW1wbGVzIHRoYXQgYXJlIG9mdGVuIHJlbW92ZWQgaW4NCj4gLSAgICAjIG1pbmltYWwgaW5z
dGFsbGF0aW9uczogZ2xpYi0yLjAtbmF0aXZlcyByZXF1cmllcyAjIHhtbC5wYXJzZXJzLmV4cGF0
IGFuZCBpY3UNCj4gLSAgICAjIHJlcXVpcmVzIGRpc3R1dGlscy5zeXNjb25maWcuDQo+ICsgICAg
IyBtaW5pbWFsIGluc3RhbGxhdGlvbnM6IGdsaWItMi4wLW5hdGl2ZXMgcmVxdXJpZXMgIyB4bWwu
cGFyc2Vycy5leHBhdA0KPiAgICAgdHJ5Og0KPiAgICAgICAgIGltcG9ydCB4bWwucGFyc2Vycy5l
eHBhdA0KPiAtICAgICAgICBpbXBvcnQgZGlzdHV0aWxzLnN5c2NvbmZpZw0KPiArICAgICAgICBp
bXBvcnQgc3lzY29uZmlnDQoNCldlbGwsIHdlIGNoZWNrIGZvciBkaXN0dXRpbHMgYmVjYXVzZSBp
dOKAmXMgb2Z0ZW4gcGFja2FnZWQgc2VwYXJhdGVseSwgZm9yIGV4YW1wbGUgaW4gRGViaWFuL1Vi
dW50dSBpdCBpcyBwYXJ0IG9mIHB5dGhvbjMtZGlzdHV0aWxzIGFuZCBpcyBub3QgaW5zdGFsbGVk
IGlmIHlvdSBqdXN0IOKAmGFwdCBpbnN0YWxsIHB5dGhvbjPigJkuDQoNCnN5c2NvbmZpZyBpcyBu
b3Qgc3BsaXQgb3V0LCBpdOKAmXMgcGFydCBvZiB0aGUgY29yZSBsaWJyYXJ5Lg0KDQpJZiB3ZSBk
b27igJl0IGFjdHVhbGx5IG5lZWQgYSAqaG9zdCogZGlzdHV0aWxzIGFueW1vcmUgKGFuZCB0aGlz
IGlzIGVhc2lseSB0ZXN0ZWQpIHRoZW4gd2UgY2FuIHJlbW92ZSB0aGlzIGNoZWNrIGVudGlyZWx5
LiBJZiB3ZSBkbywgdGhlbiB0aGlzIHRlc3QgbmVlZHMgdG8gcmVtYWluIGFuZCB0aGUgY29kZSB0
aGF0IHVzZXMgKmhvc3QqIGRpc3R1dGlscyBzaG91bGQgYmUgZml4ZWQuDQoNClJvc3M=

