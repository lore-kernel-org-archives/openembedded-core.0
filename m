Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71BEC46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 16:10:48 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.79])
 by mx.groups.io with SMTP id smtpd.web11.170866.1673885441987231736
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 08:10:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4CZSryEg;
 spf=pass (domain: arm.com, ip: 40.107.104.79, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1zPWugxWXnIPAuPK64Q6YrTEsD4fS3cbQ0SDysOP+E=;
 b=4CZSryEga0iVH9x6p95nJon0qL8cEviL7igDWwQuWF990mXfFG13tlhoJJQ8nKmu3k794Q3pdrYuY2lpdLcYySHm+dESTxtpUkthvVUC3+sxAJhvNTjPEs5ojiblzsNzSezCBaWRGadE+sxWVBu45QcOdihRZDN0YxZIBYE0w1k=
Received: from AS8PR05CA0003.eurprd05.prod.outlook.com (2603:10a6:20b:311::8)
 by AS8PR08MB9669.eurprd08.prod.outlook.com (2603:10a6:20b:617::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Mon, 16 Jan
 2023 16:10:36 +0000
Received: from AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::d1) by AS8PR05CA0003.outlook.office365.com
 (2603:10a6:20b:311::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 16:10:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT033.mail.protection.outlook.com (100.127.140.129) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 16:10:36 +0000
Received: ("Tessian outbound 333ca28169fa:v132"); Mon, 16 Jan 2023 16:10:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: daa1372a0db68c4b
X-CR-MTA-TID: 64aa7808
Received: from a61f79d58127.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8032792A-6B98-4F3D-A4AA-F45025F0DE17.1;
	Mon, 16 Jan 2023 16:10:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a61f79d58127.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 16 Jan 2023 16:10:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbozlIgsqf83ltXKOJeAMINGdvmmhJAqmlVCTT7WUlxpNqI/h/3ksugGjWef6qb0YEvRfde4J2pycLN4+QKN6AhxFXFfSjmuST25bT8CU1N0QUt9tQEVj2We8dILPKJNDPweKB0NCRQENfp9vLulSP791uMpLfVHCQAfcmUiJQVAZDG228mI/O4tdsjW1cSUEO2NxxZZEUqjufMdd4kBtSr6/FRgf/lzP/d5xHCLUGcswRh2y67e7i1rNhsiVMntjdwPHZsDYHqIiiiGLSmzIYVYXJqJZEWtm4b7h43IJepXa1m2WmmO56ZEe878QNFsgltC9RldQ2OZxk1ahqRf9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1zPWugxWXnIPAuPK64Q6YrTEsD4fS3cbQ0SDysOP+E=;
 b=dsKMs2gV5NAaRaLR+KhjLJfnri1u2Jpy/2XEAFdw2YSWb8UousiR7t58xdukzqzDXARou/cZPTGEt1yEmnFin+tOlbknJu/Elww/KSu9wwW+eyTjHs6hQ0wTE72LPt6J0GV8tZToMjMFQMTAHFG851cMcwr1PnpFRAefZaagvNvTGbePExxJJLTkMOqwLBuI7PsfycfFA6J2nurv0hYtsKErRC4uWEINxRZ/OikLSQ+/jgvLu1T8krEYk9sa4dOdozGhH8Z2Ik+g6awX1+3ISzxnLy6LNrUoDS3t3Ab4NHcxuwBSfVR4PhiKkK/XGzTNgrggmlt0RmFGy5zYEWqI0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1zPWugxWXnIPAuPK64Q6YrTEsD4fS3cbQ0SDysOP+E=;
 b=4CZSryEga0iVH9x6p95nJon0qL8cEviL7igDWwQuWF990mXfFG13tlhoJJQ8nKmu3k794Q3pdrYuY2lpdLcYySHm+dESTxtpUkthvVUC3+sxAJhvNTjPEs5ojiblzsNzSezCBaWRGadE+sxWVBu45QcOdihRZDN0YxZIBYE0w1k=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB7361.eurprd08.prod.outlook.com (2603:10a6:150:20::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Mon, 16 Jan
 2023 16:10:19 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%5]) with mapi id 15.20.5986.023; Mon, 16 Jan 2023
 16:10:19 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 6/7] gdk-pixbuf: remove ptest support
Thread-Topic: [OE-core] [PATCH 6/7] gdk-pixbuf: remove ptest support
Thread-Index: AQHZJ193YPJ4Gr2/v0WLKO5F56QnWa6hO0IA
Date: Mon, 16 Jan 2023 16:10:19 +0000
Message-ID: <BB6FF62C-5B13-435A-B707-B26ABE094FF9@arm.com>
References: <20230113145700.2773771-1-alex@linutronix.de>
 <20230113145700.2773771-6-alex@linutronix.de>
In-Reply-To: <20230113145700.2773771-6-alex@linutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB7361:EE_|AM7EUR03FT033:EE_|AS8PR08MB9669:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d5314ce-4bdf-4ebe-eede-08daf7dc33ef
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 7CpNm0PzSaT7AIQqPhT5gvBQpOlunsPDny04BPZhDvbD7KLJCHLkRCWbGaw2afeIybHE3NkM0R4PFOBXERCoz2kwbAFd4KcGg4zgS7CyRBTEKb4gnWiFNAIeW1EiFquV01wy9WHpCog+NGBArFzDV4Po0XI4p29Shh79nWWC+HuX3HlZqygygEXjqNxwcuhU3HuTfDJedQ8bogOE6KpaI1rwGsoZYmp7U3nV+sCAHyzmZTT4wXSF7ANF0TJC/2cBSQ22M4tFC6gJGNKT0jHKKPTwhrubmUDN5a9ws7ySQAnJSrIBkB0YxjrHO0jSEjdttE3/KcJHMQ6DyToKeff8Yw4eH/uY3WnVqcXBnq7xKW62hmXxa0E7jNjrskkjiEO/JIFEAZBE7iXV21iN6p38fggyX2kUbSYLeljeKNh0IH5ycohPByVtGnFbCbB2RTdiRHQdPgZo70FU0xAcaHdeH1LQFUbHT1iyjDw7Y4Bnlb9ZrNF0fbVJPXX0yUmwSAwKAfEPx1WVzDns3AMvXoMNNyfrtBILrmivlYmsSOdVX6cvp4L7Q3NQoVYCCOQp6PJhHeMqy9/TzSoCGktZDz7GPtc5WCBWeWmHVOXwvPJAPO3iOEp2KPBwhAAqABPmfLexc1I/WkNA08IDccUYnYE1y+VcJqq95BhniQXNXd+SgddXm3YQ/Jt8h2/sSNWcz9fvBn73LVEW6nbLB5pGUjLLDlCIrpCeagt9Ow/k3tAAnBc=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(366004)(39860400002)(136003)(376002)(451199015)(4744005)(5660300002)(33656002)(316002)(2616005)(6506007)(2906002)(53546011)(36756003)(38100700002)(122000001)(86362001)(478600001)(71200400001)(6486002)(54906003)(6512007)(186003)(8936002)(26005)(76116006)(91956017)(8676002)(66946007)(6916009)(64756008)(66476007)(4326008)(38070700005)(66446008)(66556008)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <27DA5E9544F49A41B71127FF04C9F63E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7361
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	51a51bb3-f510-4ebf-d02e-08daf7dc29b6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zM5jCTqfpBQUmwuS7O6Yvj5NIyK7wkN/5UgJEBhO+mfIm9fgxmCI/xNRLWev51dG4poFAMFK3qFylFFB/gNuBNULumj+ObA/owWIjRWK2W6JoLSvDaiMjNOTECZhjn4p2e7WyEWenhtLZKQzMbnbdLRp8FmRPVQFC3rf3n0r1CrJAqdFeHlAsCvvL+tUtySgfxTqLEUCw4TU30JVcuOmNRQ2Xd6hg6qg5a7FjmAdTw+BZ6Xx/qo8bx34Km7rIUGLDDdgb+RpM0+u5jtNxwajbywUzqWGRC3VpQySfovwB0YgO+UF12kMR8z8utDjzDQAeX7/WcnAYjZszw16nrmWrBavei7BeJPHm+9JzYc/uSj/ZHcJvyaUA819DZ4XsbGxGigzTftC3hSzDoz3uNXkdhoUWVKlcEOE6Gz6VGcfEyKPmaqwdakTNF8zyeRShetrYBBLT1NMKjixWCNHU6cyAhDJCSf7G3E1yi6ipmUaCrBYnJArSyQu1IAGr8r3uHNJOMaG3g8T36i6lePKQ2tPIEBcA7fDTsiKYXKdF66om716YBO+e1/HNskyKIGnKadVlJMRasvS/EdpUkUKn05OgGji1UfUwqgBRDJZ5UcPIO5TFPP9HuNxYeube5Zh/aGpi6YcLqFZlWvPXNipXKl0dGrUXbNu5PZ67PSa9qUEkBFvTJEvzUg2nRfvvTdoITtllx0ifI7Y+veZ4PDj3iauMg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39850400004)(396003)(376002)(451199015)(36840700001)(46966006)(40470700004)(186003)(26005)(6486002)(41300700001)(6512007)(316002)(4744005)(47076005)(478600001)(40480700001)(81166007)(40460700003)(6862004)(356005)(54906003)(33656002)(8936002)(2616005)(5660300002)(36756003)(82740400003)(86362001)(70206006)(82310400005)(70586007)(36860700001)(107886003)(2906002)(336012)(6506007)(53546011)(8676002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 16:10:36.1949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5314ce-4bdf-4ebe-eede-08daf7dc33ef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9669
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 16:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176000

T24gMTMgSmFuIDIwMjMsIGF0IDE0OjU2LCBBbGV4YW5kZXIgS2FuYXZpbiB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8YWxleC5rYW5hdmluPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gDQo+IE1vdmluZyB0byB4ODYtNjQtdjMgaW5zdHJ1Y3Rpb25zIHJldmVh
bGVkIHRoYXQgdGhlIHJlY2lwZSB3YXMgZG9pbmcgYW4gZW50aXJlbHkNCj4gaW5jb3JyZWN0IHRo
aW5nOiBydW5uaW5nIG5hdGl2ZSBnZGstcGl4YnVmLXF1ZXJ5LWxvYWRlcnMgZXhlY3V0YWJsZSBh
Z2FpbnN0IHRoZSB0YXJnZXQgc2V0DQo+IG9mIGxvYWRlciAuc28gYmluYXJpZXMuIFRoaXMgd29y
a2VkLCBidXQgb25seSBieSBjb2luY2lkZW5jZSwgYW5kIG5vIGxvbmdlcg0KPiB3b3JrcyBvbiBi
dWlsZCBob3N0cyB0aGF0IGRvIG5vdCBzdXBwb3J0IHYzIGluc3RydWN0aW9ucy4NCj4gDQo+IFJl
LWVuYWJsaW5nIGluc3RhbGxlZCB0ZXN0cyBpbiBhIGNyb3NzIGNvbXBpbGUgc2NlbmFyaW8gcmVx
dWlyZXMgYSBjb21wbGV0ZQ0KPiByZS10aGluayAoYWdhaW5zdCB0aGUgbmVlZCB0byBydW4gZ2Rr
LXBpeGJ1ZiBleGVjdXRhYmxlcyB0byBwcm9kdWNlIHRoZSB0ZXN0cyksDQo+IGFuZCBpcyBiZXN0
IGRvbmUgdXBzdHJlYW0sIHNvIHNhZGx5IHRoZSBjcm9zcy10ZXN0aW5nIGhhcyB0byBiZSBkcm9w
cGVkDQo+IGZvciBub3cuDQoNClNvIHdoYXQgaGFwcGVuZWQgaW4gYSBwcm9wZXIgY3Jvc3MgZW52
aXJvbm1lbnQgd2hlcmUgdGhlIG5hdGl2ZSB0b29scyBjYW7igJl0IG9wZW4gdGhlIHRhcmdldCAu
c28/DQoNClJvc3M=

