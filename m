Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59464C61DF4
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 15:03:08 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.58])
 by mx.groups.io with SMTP id smtpd.web11.138904.1700838184801694133
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 07:03:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=oJMDnaa6;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=oJMDnaa6;
 spf=pass (domain: arm.com, ip: 40.107.7.58, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TyNhH6yzPixJsz3P0pScYlSqnhWxmyVYYWQS4Lww2UgQa6vl0ddckgjypbI4H6BjDi8UqTpLa4KNDm19PYnurywC9AqU19fDiBSlksMdcFtC3sKaw0h9Y6BbLwVDvZp27bQjfnjlmKqe3LZI8LmosdTHIgtMBcr/Sw7uEoVPhvlHqClEVGyMF8H+pNS3kPCd22DQtb4Ws5aac+y8P+FkIW9zubQ7GywGApxGGlPXHdct5eoR4RlQJplo2SsnPxHZn1iseOrtA6plVLKvdMSxpuL+0Q1ce5PSNzAoc1Zo0IkZCY9l51x79EonLSLJ8+6eSm9QZeEwp/scmgrHiPt81g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qNVwkrWgrpbon1F0dJmzyMAuMcwJKl1egqvItTDWuM=;
 b=OpyPTS0azOqjoSfb8b1X+rW0pP+zN/4cOlHySSv6iD3oBsDSKR/3aae6q2OijZW3UBk/V7oorbmegbgcXaQOQK2dWYZ6Wh0UDjN/x3VAkWyTES4C+9r2p3Rvx9vQ6CdlSRpoejqgmnrMo+sZ8kVakJ7IyVxtq8jBTXbSWr5tEG4S71XXU96AqA+crpTM3vpHmmS/cWcMq/Xj5WT3pdTDtW+pGjXCVBvX1M06YRonWkOqgCedwL+GC96WEm0+NtCVTbZHzzOyWKihayOFQPyXpoavdwGvQbjWrdHSVh/LIuee5+eij8zHjFrcs6VnquGt223sGpkwRGO5T61sZcCHFg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qNVwkrWgrpbon1F0dJmzyMAuMcwJKl1egqvItTDWuM=;
 b=oJMDnaa6h8j6w3Q67eSLv4vtCv7G9BfX0e3ME2WvVHsdUr9ERaXPfQaHoRfjmJbDWvdaoYyJB1C7xBk5yC73AvB5WYlzGUU58A19LS2ZfCndiN7N7RsVRXQgstmPiuTU4Cvxx0ViN+rn25ZsdGFU0jcreN8XUMittnnXH5XcxMU=
Received: from DB9PR06CA0017.eurprd06.prod.outlook.com (2603:10a6:10:1db::22)
 by DU0PR08MB7834.eurprd08.prod.outlook.com (2603:10a6:10:3b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 15:02:53 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::54) by DB9PR06CA0017.outlook.office365.com
 (2603:10a6:10:1db::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21 via Frontend
 Transport; Fri, 24 Nov 2023 15:02:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.12 via Frontend Transport; Fri, 24 Nov 2023 15:02:53 +0000
Received: ("Tessian outbound 7671e7ddc218:v228"); Fri, 24 Nov 2023 15:02:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 53465bd4c8a0b504
X-CR-MTA-TID: 64aa7808
Received: from cc191c79b863.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BC863599-DC9E-4029-80C0-BCCC2721A533.1;
	Fri, 24 Nov 2023 15:02:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cc191c79b863.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 24 Nov 2023 15:02:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3kZtr1gX1yDu0ot3gVHl6hnTgoXcwP6fTRosIw/18lLKQjCyDlYy3x7wPgV0V6F7redEW2KN1t5lZEr/Undw3euAwax0xePGldVZVeIVhqPqRMwOJFcLGLm1tg216XPPDhM+IWLGTSNPaB4hruh/XHZK77O1gLo004gTlEJyKhHI+ilUhGTmXL2D8V6tmngM+fPJC7g54fcBuOPAHj3bCdfbQDZbMGgDTs/mzxhZb0YQIyAxq/afwF5HEzB5sBVg4DEf7QyQ9kvu/hTEiB7UAC+ce96Eshded/30badMbqxVq1fQtxefjrfwLnhtXkzKzGY/2SGNt/Scmck9xT9Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qNVwkrWgrpbon1F0dJmzyMAuMcwJKl1egqvItTDWuM=;
 b=aZPuq7aPTzcVZvVrNiGmI/rT1pItQn/Eo2eQpBPXfE027aiigYgh6PElRbdoZUZU2Fh+5PSMKo0ERNZ/IZ03KFwGHsX5aHWc4mESZ2j15hLa3JO2OM83rKbzr2VnlSMOhQAuJZHBe+TP1r2ZjzM3SPXBRZ1Vw/RQOnUO8JCpRkr7kbpKDoIadSd+oosIEcMpsaXeCR8bT/APh3XzCRfT+RhUGsX9cEbfvlHW6132SV5R8I/tH5IX2tH+y75Sz7q5QWV5zFRtRobwZaPbymnfRXxG+H1sr68H86wUcG/saYmU4qsm/q2VU1ZgIPXOlHxuOoFwY3J1s693zS7IiFnFKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qNVwkrWgrpbon1F0dJmzyMAuMcwJKl1egqvItTDWuM=;
 b=oJMDnaa6h8j6w3Q67eSLv4vtCv7G9BfX0e3ME2WvVHsdUr9ERaXPfQaHoRfjmJbDWvdaoYyJB1C7xBk5yC73AvB5WYlzGUU58A19LS2ZfCndiN7N7RsVRXQgstmPiuTU4Cvxx0ViN+rn25ZsdGFU0jcreN8XUMittnnXH5XcxMU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8998.eurprd08.prod.outlook.com (2603:10a6:20b:5fa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 15:02:44 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7025.021; Fri, 24 Nov 2023
 15:02:43 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>, Markus
 Volk <f_l_k@t-online.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] [PATCH v9 1/3] vte: upgrade 2.72.2 -> 2.74.0
Thread-Topic: [OE-core] [PATCH v9 1/3] vte: upgrade 2.72.2 -> 2.74.0
Thread-Index: AQHaHQ2RTudaz6UdlEWVs9rhH0b2UrCJlGWA
Date: Fri, 24 Nov 2023 15:02:43 +0000
Message-ID: <02D9AF7C-3308-4EE8-AEF6-16F8A42A59C5@arm.com>
References: <20231122063119.3620722-1-raj.khem@gmail.com>
In-Reply-To: <20231122063119.3620722-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8998:EE_|DU6PEPF00009526:EE_|DU0PR08MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e387d9-92fe-4284-40d3-08dbecfe6f45
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Tfab0yDTXXrA5AOisBM6bN8T6upNRJYD/0MsmLcOwDMbegUnTVfTpaxyDi4wLwBXhGxs9Xfo4094RvH/9Txvv59LtNDTlBafxCjbMnBi18joHg0eXNAOQGmd7t3+0HBxeL3vJbRsEcTTF8HbqYGDSaVtn/3i6NVdL3IwseSVgYFQ5E2/UvrOTGTOWxJI0sMosrbX/oIbf8QcFZrUTDf4QlvWez5kWQHUtYzvxN/1YFBNKd4GaiTNLTt3AhShPApDz3q0mH5r1s5bX1jBxOhcBWX4Bw0A11s+M0UaqpkFE1f3SbCgxLoo8NHJt3ROIHCvZbDgKAxq08eLmIWGsMb+5VeS6qDzdkuYYUoUHdU+qUZG9ApcsP9y9GTKz5Qn0NE5ES5qn0Ej+CYxrlu9qqHO4YPgRFcK7WNEuwbZ9d5RnHFPEvj5b4HFf9hhaN7/SUyT+CoH3WROeRN8Uqd515+77EjLakdWJr1OGJU3vs+MLU+YLOtYyrYJKxk56dDTIYN4aUHDqHl88F0JROr60LvK7FdWA13+AhzkTbLywbwnH4rfG69I92/q5NdokRjnpET6x45gEGcx2wjieHFzCUiwU722pNtUH3irOIB0mS0mmT54U50+TxxU0lxsh2w/J4+dIh4rDryT57UaRL5acjM4xQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(396003)(366004)(136003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(2616005)(6512007)(66574015)(83380400001)(26005)(6506007)(53546011)(66899024)(54906003)(6486002)(966005)(478600001)(66556008)(66476007)(36756003)(76116006)(66946007)(66446008)(91956017)(122000001)(6916009)(38100700002)(86362001)(33656002)(5660300002)(2906002)(41300700001)(316002)(8676002)(4326008)(64756008)(8936002)(38070700009)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E41AF1C24DA3684793800C69D43B0197@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8998
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	aa87102d-f9e6-4a9b-7827-08dbecfe6977
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t2nVReBmg/uEbRN0cyDUWTOgtYJ0aQYA91o3kZj0PH/coohzdk1gfBCdrYdIeLyaInf2xQBbgVnEm8jUU10Dj50yvxCVfrzp5ox/Dr7vhnn+JaxzGmsx3+AtIPiA7e54mXBd4wWIeKvjIJuy5x97yJOg41PFpp6cxgcqJ9m8zT2AOct2WRwfdnOopgyh3gyI2szC8Qxw9ta5aCHvaMvOYnibFFsmPOjAV6QiFUkUblRk+1/HqekFKLgWMPZ5Z7eZz62PjABlFdUqFPO1rJI9rWyG6wjuT/8yvMsFrmUcux2pMN9CCu9NsFIdU7+ZhbXkKbdqSBF8mrEmvjGY4Gm9xRsdK3uSL32A7ReFkIxpUJTsWNzBxEezWhbycuBMi6ljGOtoFPiPCBJ/qDm6tdCIcQ4mcQbbkoyhcS3e5smxwSloqPiHyRdQBecIv4Ll5W8yA0mZVDeamlXJoLicu2z7VFr+zJ6zglr2OBGjdAFBbkuL+Kklr/HIrE4nxN+SLMiV/1j/YY0JZsuLCKB8lEVuw74VkyVgxofHYe1Hw0aYkIvI2fNXFXHSsfppKHLSf4tMKPU7om39lvivwc5tRZ7bMDcIw9s+FL1SIoWGH/i7RSUKygzYtTubwgcLWhoQugVtYvzvYVCgZ2lZ4DceKqqlUCBm6T90XAHkenGnfwhC1mZDeN6NozA9GNf4BT3mtydmGawlrfL35ZsMIEZi2jhgY2kYVNxMUYkXccwSfNk5ilc=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(186009)(451199024)(1800799012)(82310400011)(64100799003)(46966006)(40470700004)(36840700001)(66574015)(26005)(82740400003)(336012)(47076005)(41300700001)(356005)(81166007)(33656002)(36860700001)(83380400001)(40480700001)(107886003)(6512007)(2616005)(36756003)(53546011)(478600001)(40460700003)(6486002)(966005)(2906002)(6506007)(5660300002)(70586007)(70206006)(66899024)(316002)(54906003)(6862004)(4326008)(8936002)(8676002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 15:02:53.5715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e387d9-92fe-4284-40d3-08dbecfe6f45
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7834
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 15:03:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191206

SSB0aGluayB5b3UgbWVhbiDigJwwLjcyLjIiLg0KDQpSb3NzDQoNCj4gT24gMjIgTm92IDIwMjMs
IGF0IDA2OjMxLCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8cmFqLmtoZW09
Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiANCj4gRnJvbTogTWFy
a3VzIFZvbGsgPGZfbF9rQHQtb25saW5lLmRlPg0KPiANCj4gUmV3b3JrIHJlY2lwZQ0KPiANCj4g
LSByZW1vdmUgbGVnYWN5IG9mIHRoZSBhdXRvdG9vbHMgYnVpbGRzeXN0ZW0NCj4gLSByZW1vdmUg
QkJDTEFTU0VYVEVORA0KPiAtIGJ1aWxkIHZhcGkgZGVwZW5kZW50IG9uIGdpLWRhdGENCj4gLSBk
b2NzIHJlcXVpcmUgZ2lyLCBhZGQgYSBFWFRSQV9PRU1FU09OOmFwcGVuZCB0byBhdm9pZCBmYWls
IGluDQo+ICBhIGNvbWJpbmF0aW9uIHdoZXJlIGRvY3M9dHJ1ZSBhbmQgZ2lyPWZhbHNlDQo+IC0g
Z3RrKzMgYW5kIGd0azQgYXJlIHJlcXVlc3RlZCBieSBkZWZhdWx0LT4gYWRkIGd0azQgZGVwZW5k
aW5nDQo+ICBvbiBESVNUUk9fRkVBVFVSRQ0KPiAtIGluc3RhbGwgc3lzdGVtZCBzdXBwb3J0IGZp
bGVzIGRlcGVuZGluZyBvbiBESVNUUk9fRkVBVFVSRQ0KPiAtIHVwZGF0ZSAwMDAxLUFkZC1XX0VY
SVRDT0RFLW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaA0KPiANCj4gKEZyb20gT0Ut
Q29yZSByZXY6IGY5ZGRhY2FmYmRjZjA1MzlhOGQ1ZWVjZmE5ODExOTRiNDAxZjEwNjIpDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBNYXJrdXMgVm9sayA8Zl9sX2tAdC1vbmxpbmUuZGU+DQo+IFNpZ25l
ZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4NCj4gLS0t
DQo+IHY5OiBSZWJhc2VkDQo+IA0KPiAuLi5FWElUQ09ERS1tYWNyby1mb3Itbm9uLWdsaWJjLXN5
c3RlbXMucGF0Y2ggfCAzNSArKysrKysrKy0tLS0tLS0tLS0tDQo+IC4uLi92dGUve3Z0ZV8wLjcy
LjIuYmIgPT4gdnRlXzAuNzQuMC5iYn0gICAgICB8IDI5ICsrKysrKy0tLS0tLS0tLQ0KPiAyIGZp
bGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDM5IGRlbGV0aW9ucygtKQ0KPiByZW5hbWUg
bWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3t2dGVfMC43Mi4yLmJiID0+IHZ0ZV8wLjc0LjAuYmJ9
ICg2NiUpDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8w
MDAxLUFkZC1XX0VYSVRDT0RFLW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaCBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwMS1BZGQtV19FWElUQ09ERS1tYWNyby1mb3It
bm9uLWdsaWJjLXN5c3RlbXMucGF0Y2gNCj4gaW5kZXggYjQxMDBmYzM4MWUuLjg5MzRkNWY4MGE2
IDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlLzAwMDEtQWRkLVdf
RVhJVENPREUtbWFjcm8tZm9yLW5vbi1nbGliYy1zeXN0ZW1zLnBhdGNoDQo+ICsrKyBiL21ldGEv
cmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwMS1BZGQtV19FWElUQ09ERS1tYWNyby1mb3Itbm9u
LWdsaWJjLXN5c3RlbXMucGF0Y2gNCj4gQEAgLTExLDMyICsxMSwyNSBAQCBVcHN0cmVhbS1TdGF0
dXM6IFN1Ym1pdHRlZCBbMV0NCj4gU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBNw7xsbGVyIDxzY2hu
aXR6ZWx0b255QGdtYWlsLmNvbT4NCj4gDQo+IFsxXSBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcv
R05PTUUvdnRlL2lzc3Vlcy83Mg0KPiAtDQo+IC0tLQ0KPiAtIHNyYy9taXNzaW5nLmhoIHwgNCAr
KysrDQo+IC0gc3JjL3dpZGdldC5jYyAgfCAxICsNCj4gLSAyIGZpbGVzIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKQ0KPiArIHNyYy93aWRnZXQuY2MgIHwgNCArKysNCj4gKyAxIGZpbGVzIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gLS0tLSBhL3NyYy9taXNzaW5nLmhoDQo+IC0rKysg
Yi9zcmMvbWlzc2luZy5oaA0KPiAtQEAgLTI0LDYgKzI0LDEwIEBADQo+IC0gI2RlZmluZSBOU0lH
ICg4ICogc2l6ZW9mKHNpZ3NldF90KSkNCj4gLSAjZW5kaWYNCj4gK2RpZmYgLS1naXQgYS9zcmMv
d2lkZ2V0LmNjIGIvc3JjL3dpZGdldC5jYw0KPiAraW5kZXggMDdmN2NhYmYuLjMxYTc3ZjY4IDEw
MDY0NA0KPiArLS0tIGEvc3JjL3dpZGdldC5jYw0KPiArKysrIGIvc3JjL3dpZGdldC5jYw0KPiAr
QEAgLTE2LDYgKzE2LDEwIEBADQo+ICsgICogYWxvbmcgd2l0aCB0aGlzIGxpYnJhcnkuICBJZiBu
b3QsIHNlZSA8aHR0cHM6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+Lg0KPiArICAqLw0KPiANCj4g
KyNpZm5kZWYgV19FWElUQ09ERQ0KPiArI2RlZmluZSBXX0VYSVRDT0RFKHJldCwgc2lnKSAoKHJl
dCkgPDwgOCB8IChzaWcpKQ0KPiArI2VuZGlmDQo+ICsNCj4gLSAjaWZuZGVmIEhBVkVfRkRXQUxL
DQo+IC0gaW50IGZkd2FsayhpbnQgKCpjYikodm9pZCogZGF0YSwgaW50IGZkKSwNCj4gLSAgICAg
ICAgICAgIHZvaWQqIGRhdGEpOw0KPiAtLS0tIGEvc3JjL3dpZGdldC5jYw0KPiAtKysrIGIvc3Jj
L3dpZGdldC5jYw0KPiAtQEAgLTIxLDYgKzIxLDcgQEANCj4gLSAjaW5jbHVkZSAid2lkZ2V0Lmho
Ig0KPiAtIA0KPiAtICNpbmNsdWRlIDxzeXMvd2FpdC5oPiAvLyBmb3IgV19FWElUQ09ERQ0KPiAt
KyNpbmNsdWRlICJtaXNzaW5nLmhoIiAvLyBmb3IgV19FWElUQ09ERSBvbiBub24tZ2xpYmMgc3lz
dGVtcw0KPiArICNpbmNsdWRlICJjb25maWcuaCINCj4gDQo+IC0gI2luY2x1ZGUgPGV4Y2VwdGlv
bj4NCj4gLSAjaW5jbHVkZSA8bmV3Pg0KPiArICNpbmNsdWRlICJ3aWRnZXQuaGgiDQo+ICstLSAN
Cj4gKzIuNDIuMA0KPiArDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUv
dnRlXzAuNzIuMi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43NC4wLmJiDQo+
IHNpbWlsYXJpdHkgaW5kZXggNjYlDQo+IHJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L3Z0ZS92dGVfMC43Mi4yLmJiDQo+IHJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUv
dnRlXzAuNzQuMC5iYg0KPiBpbmRleCA0NGU3MTQ5MWY2Mi4uMjEyMDNhZGNmNzkgMTAwNjQ0DQo+
IC0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43Mi4yLmJiDQo+ICsrKyBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43NC4wLmJiDQo+IEBAIC0xNiwzMiArMTYsMjcg
QEAgREVQRU5EUyA9ICJnbGliLTIuMCBnbGliLTIuMC1uYXRpdmUgZ3RrKzMgbGlicGNyZTIgbGli
eG1sMi1uYXRpdmUgZ3BlcmYtbmF0aXZlIGkNCj4gR0lSX01FU09OX09QVElPTiA9ICdnaXInDQo+
IEdJRE9DR0VOX01FU09OX09QVElPTiA9ICJkb2NzIg0KPiANCj4gLWluaGVyaXQgZ25vbWViYXNl
IGdpLWRvY2dlbiBmZWF0dXJlc19jaGVjayB1cHN0cmVhbS12ZXJzaW9uLWlzLWV2ZW4gZ29iamVj
dC1pbnRyb3NwZWN0aW9uDQo+ICtpbmhlcml0IGdub21lYmFzZSBnaS1kb2NnZW4gZmVhdHVyZXNf
Y2hlY2sgdXBzdHJlYW0tdmVyc2lvbi1pcy1ldmVuIGdvYmplY3QtaW50cm9zcGVjdGlvbiB2YWxh
DQo+IA0KPiAtIyB2YXBpZ2VuLm00IGlzIHJlcXVpcmVkIHdoZW4gdmFsYSBpcyBub3QgcHJlc2Vu
dCAoYnV0IHRoZSBvbmUgZnJvbSB2YWxhIHNob3VsZCBiZSB1c2VkIG5vcm1hbGx5KQ0KPiBTUkNf
VVJJICs9ICJmaWxlOi8vMDAwMS1BZGQtV19FWElUQ09ERS1tYWNyby1mb3Itbm9uLWdsaWJjLXN5
c3RlbXMucGF0Y2giDQo+IC1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJmNzk2NmZkMTg1
YTY5ODFmNTM5NjQxNjJiNzFjZmVmN2U2MDY0OTUxNTVkNmY1ODI3YjcyYWEwZGQ2NzQxYzllIg0K
PiArU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiOWFlMDhmNzc3OTUyYmE3OTMyMjExNTJk
MzYwNTUwNDUxNTgwZjQyZDNiNTcwZTMzNDFlYmI2ODQxOTg0Yzc2YiINCj4gDQo+IEFOWV9PRl9E
SVNUUk9fRkVBVFVSRVMgPSAiJHtHVEszRElTVFJPRkVBVFVSRVN9Ig0KPiANCj4gLSMgSGVscCBn
LWlyLXNjYW5uZXIgZmluZCB0aGUgLnNvIGZvciBsaW5raW5nDQo+IC1kb19jb21waWxlOnByZXBl
bmQoKSB7DQo+IC0gICAgZXhwb3J0IEdJUl9FWFRSQV9MSUJTX1BBVEg9IiR7Qn0vc3JjLy5saWJz
Ig0KPiAtfQ0KPiArRVhUUkFfT0VNRVNPTiArPSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ0dJX0RB
VEFfRU5BQkxFRCcsICdUcnVlJywgJy1EdmFwaT10cnVlJywgJy1EdmFwaT1mYWxzZScsIGQpfSIN
Cj4gK0VYVFJBX09FTUVTT046YXBwZW5kID0gIiAke0BiYi51dGlscy5jb250YWlucygnR0lfREFU
QV9FTkFCTEVEJywgJ0ZhbHNlJywgJy1EZG9jcz1mYWxzZScsICcnLCBkKX0iDQo+IA0KPiAtIyBQ
YWNrYWdlIGFkZGl0aW9uYWwgZmlsZXMNCj4gLUZJTEVTOiR7UE59LWRldiArPSAiJHtkYXRhZGly
fS92YWxhL3ZhcGkvKiINCj4gLQ0KPiAtUEFDS0FHRUNPTkZJRyA/Pz0gImdudXRscyINCj4gLVBB
Q0tBR0VDT05GSUdbdmFsYV0gPSAiLUR2YXBpPXRydWUsLUR2YXBpPWZhbHNlLHZhbGEtbmF0aXZl
IHZhbGEiDQo+ICtQQUNLQUdFQ09ORklHID8/PSAiIFwNCj4gKyBnbnV0bHMgXA0KPiArICR7QGJi
LnV0aWxzLmZpbHRlcignRElTVFJPX0ZFQVRVUkVTJywgJ3N5c3RlbWQnLCBkKX0gXA0KPiArICR7
QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAnb3BlbmdsJywgJ2d0azQnLCAn
JywgZCl9IFwNCj4gKyINCj4gK1BBQ0tBR0VDT05GSUdbZ3RrNF0gPSAiLURndGs0PXRydWUsLURn
dGs0PWZhbHNlLGd0azQiDQo+IFBBQ0tBR0VDT05GSUdbZ251dGxzXSA9ICItRGdudXRscz10cnVl
LC1EZ251dGxzPWZhbHNlLGdudXRscyINCj4gUEFDS0FHRUNPTkZJR1tzeXN0ZW1kXSA9ICItRF9z
eXN0ZW1kPXRydWUsLURfc3lzdGVtZD1mYWxzZSxzeXN0ZW1kIg0KPiAtIyB2YWxhIHJlcXVpcmVz
IGdpcg0KPiAtUEFDS0FHRUNPTkZJRzpyZW1vdmU6Y2xhc3MtbmF0aXZlID0gInZhbGEiDQo+IC0N
Cj4gLUNGTEFHUyArPSAiLURfR05VX1NPVVJDRSINCj4gDQo+IFBBQ0tBR0VTID0rICJsaWJ2dGUg
JHtQTn0tcHJvbXB0Ig0KPiArRklMRVM6JHtQTn0gKz0iJHtzeXN0ZW1kX3VzZXJfdW5pdGRpcn0i
DQo+IEZJTEVTOmxpYnZ0ZSA9ICIke2xpYmRpcn0vKi5zby4qICR7bGliZGlyfS9naXJlcG9zaXRv
cnktMS4wLyoiDQo+IEZJTEVTOiR7UE59LXByb21wdCA9ICIgXA0KPiAgICAgJHtzeXNjb25mZGly
fS9wcm9maWxlLmQgXA0KPiBAQCAtNDksNSArNDQsMyBAQCBGSUxFUzoke1BOfS1wcm9tcHQgPSAi
IFwNCj4gIg0KPiANCj4gRklMRVM6JHtQTn0tZGV2ICs9ICIke2RhdGFkaXJ9L2dsYWRlLyINCj4g
LQ0KPiAtQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIg0KPiAtLSANCj4gMi40My4w
DQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZl
IGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgj
MTkxMDE4KTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNv
cmUvbWVzc2FnZS8xOTEwMTgNCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvbXQvMTAyNzQ0ODAyLzY4NzU4ODgNCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJl
ZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0
dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViIFty
b3NzLmJ1cnRvbkBhcm0uY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg0K

