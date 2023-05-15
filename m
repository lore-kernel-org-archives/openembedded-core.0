Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFA8C7EE22
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 09:34:01 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.72])
 by mx.groups.io with SMTP id smtpd.web10.84529.1684143236085083011
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 02:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=B7z2S6F5;
 spf=pass (domain: arm.com, ip: 40.107.8.72, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuZkZbZJPT5TlWQVzY6qeXJxyAA+uVLI2PsBNP29YWc=;
 b=B7z2S6F55syTOesnEraqSBVYQ33dj+hEtRA7GZYZaWdIzKxa78jZDY2aZOj6t+vr342iRbY+IlHiotgZdcZmWQh5igdPClGbz2lx2ZblIyGjOEhmWPm+Yo0axd4R/ziBkaKKBUG3ZQBraFWB4/WEnx3WbtIU4H3gPJapr+Rbxxc=
Received: from ZR2P278CA0006.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:50::12)
 by AS8PR08MB10152.eurprd08.prod.outlook.com (2603:10a6:20b:63e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 09:33:49 +0000
Received: from VI1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:910:50:cafe::9) by ZR2P278CA0006.outlook.office365.com
 (2603:10a6:910:50::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30 via Frontend
 Transport; Mon, 15 May 2023 09:33:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT008.mail.protection.outlook.com (100.127.144.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.14 via Frontend Transport; Mon, 15 May 2023 09:33:48 +0000
Received: ("Tessian outbound e13c2446394c:v136"); Mon, 15 May 2023 09:33:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 87ad9766e2610f3e
X-CR-MTA-TID: 64aa7808
Received: from 2c430c74d6b4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E3A9910D-3A18-4831-8AB8-A25A6F058165.1;
	Mon, 15 May 2023 09:33:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2c430c74d6b4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 15 May 2023 09:33:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IlNcYz6jkVHrkk4vy/fHXakKuQl7RbSs9NWrkpMGFHyNTnKQ81QlZV0hJKO4DlXmmdOiWeOZGthuniKz1oNCruujkylE1EDcQ4HnWJH37jWMhvT6p/2bx2ju9f9QR/sSXmkk8mNzByG4JUCSwFxeSnZJawjLEoJ6PTK3gVjVDRiiHd6W4svEFcoa5lO8hIsezXkchlRJiKFMSMyn/IlsB2jFDbqihTxbns0TRwUpMKtYhIY37kBJyXEVm8CyEEziddLP1tD9NoiqyMtN5Pr3MWE03MpirnkKFqP+gQ5QFrmKRAmarSZf6EzcjnGC7Xe4hUXrXJONF2znh7ha8qVQvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuZkZbZJPT5TlWQVzY6qeXJxyAA+uVLI2PsBNP29YWc=;
 b=f4M7oaUBkFyAXNeNSHUD+5THCUczy3CNTeJ0e6SJKwuqZH17pXIR9sSO7lAnTX1oUroLSjLaPUA9o1+Ja6AGhZv8S3Z1XG3IyjLBFi896WiLm/MP7211EIMEHd/I9foHeluGS7wYgt2c5cfZhvRQZSWl6HhpJJIF30lqeR4sjNbqPZ7trf100ljUC+UIa/ChaN31htLwyT/IxPNgTArcqmKdjwSuWRu+874rtytxJKta86CFaUCcQZd16Q1c3W5/IGXjrT7GGr7qYsW/9AEV8quhtHS6T30zXb7jckDY0Awj5QTtuQ4kd7NV9c9lfDt4hX8JKblbspQATzbvqPSeaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuZkZbZJPT5TlWQVzY6qeXJxyAA+uVLI2PsBNP29YWc=;
 b=B7z2S6F55syTOesnEraqSBVYQ33dj+hEtRA7GZYZaWdIzKxa78jZDY2aZOj6t+vr342iRbY+IlHiotgZdcZmWQh5igdPClGbz2lx2ZblIyGjOEhmWPm+Yo0axd4R/ziBkaKKBUG3ZQBraFWB4/WEnx3WbtIU4H3gPJapr+Rbxxc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB8031.eurprd08.prod.outlook.com (2603:10a6:10:389::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 09:33:39 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6387.029; Mon, 15 May 2023
 09:33:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Michael Opdenacker <michael.opdenacker@bootlin.com>, Steve Sakoman
	<steve@sakoman.com>, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto-security] [OE-core] OE-core CVE metrics for master on Sun
 14 May 2023 01:00:01 AM HST
Thread-Topic: [yocto-security] [OE-core] OE-core CVE metrics for master on Sun
 14 May 2023 01:00:01 AM HST
Thread-Index: AQHZhwXE/EdsEXqItkGNvvTG1tZ9Y69bA/EAgAAOnwA=
Date: Mon, 15 May 2023 09:33:39 +0000
Message-ID: <FC9CDB93-ACF4-4DD0-AF42-2B6F65D12908@arm.com>
References: <20230514112915.DBC579603D3@nuc.router0800d9.com>
 <12aa7d8d-4207-46d1-e74e-58fb9942a701@bootlin.com>
 <CANNYZj8aKLbU9ixmYKtzZxQk3iOFe-i4KcXMNjgy6Z6Ye1upgQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8aKLbU9ixmYKtzZxQk3iOFe-i4KcXMNjgy6Z6Ye1upgQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB8031:EE_|VI1EUR03FT008:EE_|AS8PR08MB10152:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a1421bf-1645-4500-2964-08db55277ce3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /sU9RgUJO+iUSXsUZ3yX0RHGkxSeYbY7GmBZ+POcbWwaRhq0JZSulWYSoLk9qgJa1c1Kw6UDtpFsiEsCgPESeEIRcI/pTXBY69ClxIQZYCUL7SCnlLsz/vCqqtQKwsJeZ4ifD08W5pfGRSFlaCTo/uBJB1SPZiZhT/SXhX7ftRTApc9S+0ArwbOjjDsAHINGTFIKRAOSAdCr/6TCkFUSNCXCPIYU5Jt4sHhDCfMg039vyYKoBclvKoYo0vkobDh1qQImQxsgZEEG0Awo2p5yJdamPOXrWRSQjN9Kipq8bBY0r59RvCef4GrQNvvtGiMYRHfcdULZGDMfzNib7HmkFUwwPZ9L0dbccrakRrfdMzsFwRkesyBEWBsYLKvOWJBBM6RPRCR85+IkcD2U9yhXvzyrCEm8cb8o/Fe3kIbaD1Z3gequokarNqktLxNNMHhdQguzjs1tYKvGJ/u60CrHPQO1JDPaPI+hclwawjslcufgbQ8g2nTh+SmeEawldYVJD+l1XIgE3bo6PKiZ8LtZ6V+lCaEwVHeT1nrVrHAiNoVOit6uCz9qbzJJNSROsbr7OEcvqUIkQvTxLzZGyZJ2GIVxyZP3Wf36OxQDGMWmUSJ96Stw+eusa72Z85TwA4lOVHKqGvt7N+FsMU8uJ+A7Ew==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(346002)(39850400004)(136003)(451199021)(66556008)(66446008)(64756008)(66946007)(66476007)(4326008)(6916009)(478600001)(6486002)(76116006)(86362001)(91956017)(316002)(54906003)(36756003)(33656002)(186003)(6512007)(2616005)(53546011)(6506007)(71200400001)(8936002)(8676002)(5660300002)(2906002)(4744005)(122000001)(41300700001)(38100700002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <122E9404DE71EF43BE4A4AE882057CE2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8031
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	89e8dbd0-0ca1-426a-2166-08db55277725
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H512hoICmOKvqeadBjlI29Ur/GHS2a+W2Sr8XnfkDnLeNZcfzXDuO2ZVm8eO84UcXakReuLF4NjjFpBpukQhTntUk5btQvNGaUUHFfitfB3gbJJbGiix13fB5HYKWdZPWif6U2XRUATHUcg0MLQCjIOoPESxZ5as+ARWPo1LflvDnBxmHlXt4LZwnhU10QtE2/cvARK0YQDQpsjpuU2bvEopDRFhB3NlgfU2oRKkgeJvZmzhtv7DvQHPyjM2+dAMLfmtWijAXfzaLcjs5CJtZqH5P40syHcUiFilm/drz41GA1zhvisb6ComzDh+VCqzQmAjHe4URn9jNP6HQ+YLf0RQOwxRGjaUkB5EfCOCwpoQ2ltgDTZF3RuuPr7Srs+NuVUFJckzjWmXhO+wT8Sk+oVzE6QFp6Wq5ooSLbBUidJjlZGTXc33DrH86xP+CKYBQInd+EfDAGfPTueeHw3n0IrskE8QKEkw6ox+Z7kky+uAE8Wns7YxXphELyVh5Wm3HBLyLxNVyu/Zm9nGTJtxIYqI08S6XAJJG0RdybrI2OLo/8OYAciTF9ZBbk/yLZjwU+fOCXiwh1HnQeutc/Ssk4VoPzsWDA89WUpQQ6169BO5J78gHv0I04u+UZCD7E1Rl/+zXkUFMl1DFGgQzNmMoYal+aPX+uTvcbptq8sMWHit0k+xK9/jgz8kJXLDaH+kusjq1CstlfOj8Z8+vMmWvLxb4Y2VO8mE15WtNS2EjkA=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199021)(36840700001)(40470700004)(46966006)(40460700003)(70586007)(4326008)(70206006)(478600001)(6486002)(86362001)(316002)(54906003)(33656002)(36756003)(47076005)(186003)(26005)(6512007)(2616005)(53546011)(6506007)(336012)(36860700001)(6862004)(8936002)(8676002)(5660300002)(2906002)(4744005)(82310400005)(40480700001)(81166007)(356005)(82740400003)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 09:33:48.9154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1421bf-1645-4500-2964-08db55277ce3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 09:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181237

T24gMTUgTWF5IDIwMjMsIGF0IDA5OjQxLCBBbGV4YW5kZXIgS2FuYXZpbiB2aWEgbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZyA8YWxleC5rYW5hdmluPWdtYWlsLmNvbUBsaXN0cy55b2N0b3Byb2plY3Qu
b3JnPiB3cm90ZToNCj4gbmFubyBwbGVhc2UgOikgSSB0ZW5kIHRvIGFncmVlLCB0aGVyZSBpcyBu
byByZWFzb24gdG8gY2FycnkNCj4gc3BlY2lmaWNhbGx5IHZpbSBhcyAnYW4gZWRpdG9yIGZvciBx
dWljayBjb25maWcgZmlsZSBoYWNrcyBvbiB0aGUNCj4gdGFyZ2V04oCZLg0KDQpOYW5vIGlzIEdQ
TCAzLCB0aGVyZeKAmXMgYW4gYXJndW1lbnQgdGhhdCBvdXIgZGVmYXVsdCBlZGl0b3Igc2hvdWxk
IGJlIGFzIHBlcm1pc3NpdmUgYXMgcG9zc2libGUuICBJ4oCZbSBub3Qgc3VyZSB3aGF0IGEgc3Vp
dGFibGUgYWx0ZXJuYXRpdmUgd291bGQgYmUsIHRob3VnaC4NCg0KUm9zcw==

