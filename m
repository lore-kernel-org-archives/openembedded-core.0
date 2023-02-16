Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4824BC61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 11:14:19 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.87])
 by mx.groups.io with SMTP id smtpd.web11.7686.1676546049779301791
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 03:14:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=LCE/PQxM;
 spf=pass (domain: arm.com, ip: 40.107.7.87, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFVW2p3UQIGRuLMTLCXQnMmerBAVPIYUJu3BH8fi0Dk=;
 b=LCE/PQxMWZKNgsQrGTQCJeBw6C0fWuBeDJv1Q9KGqbgS11312Inb7LzQN26CKUU8PKeIvVVDAlwdovHb1Gz8UGAWQIpYbzlG+vtXF8jz3Y8CHTl2HW0Fqx8xBS98pQqXP7M+8xrCYnEsDmxQ+bgmNqx29lFR7DsCSnYoQu1sVhA=
Received: from AS8PR04CA0170.eurprd04.prod.outlook.com (2603:10a6:20b:331::25)
 by AM7PR08MB5318.eurprd08.prod.outlook.com (2603:10a6:20b:104::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Thu, 16 Feb
 2023 11:14:06 +0000
Received: from AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::e4) by AS8PR04CA0170.outlook.office365.com
 (2603:10a6:20b:331::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12 via Frontend
 Transport; Thu, 16 Feb 2023 11:14:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT062.mail.protection.outlook.com (100.127.140.99) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.12 via Frontend Transport; Thu, 16 Feb 2023 11:14:05 +0000
Received: ("Tessian outbound b1d3ffe56e73:v132"); Thu, 16 Feb 2023 11:14:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ae5b4ec3b16c4eb8
X-CR-MTA-TID: 64aa7808
Received: from d1310adc919d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 11224D5E-69FC-4918-B395-6D1ECC0B480B.1;
	Thu, 16 Feb 2023 11:13:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d1310adc919d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 16 Feb 2023 11:13:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bUPrSLzCpSeqOt60EvzCDQY5LbHUeDfCDLxaMutHZbPQTfLM9hvACEsuz1PQaQ14eGCoRZ4ur/aVxnVyJm0147zs/J1QBQORPhGQHSyoN4IejvFjp6OlzWxANUn0qlp01FwLdVbH7u+9BIyPf3FHLC3prmh+Pp9eKKgxidQDc6mcP96Ls0ttttJivLcxM9bPf7TVOBLaiMztc/8WwRUqUoLpUw0P7VvQJ4KT4MmveLJ/6jMhcu+f0TJZbvPRHVQgfeqBm4Dw/IzEsICimYvtabNuU4nUWqADrky03u8lJRrPNFrw1cNWyqtdLJNbeMfIKQUbuFTi9aeOWQqe/MHMdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFVW2p3UQIGRuLMTLCXQnMmerBAVPIYUJu3BH8fi0Dk=;
 b=dWMuEAI3S2my+CE02jpDtl6UbHw4Asww7i0jLSvERSdF9di4fMJwJNTwmIaP2RZDv7gUToTSE1nZcF53dtyaZC3sgBnWwcnk3FD0FAk+d17fKTNEEYzvTYVGG+UbrJyPgcGcpcMYvGHePlXLr6/ah63mByMXw6hEuzGuwkYlmHkb+Ser4pXFXnovL3C2gvrIxwLgk+wG/gTE+9MgVQOMdVUCaPoU6XaxrtEE1PtLWs4pgQj4QKIuN0oDSlZpS+VZNYjICQXb5rN32JCCBIzQANbu5W5p1xEM5nw2w3/SSxyc+feWDGA2aoDNqh0mdWaudv5xAJ55W70NbeJ/pOiTow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFVW2p3UQIGRuLMTLCXQnMmerBAVPIYUJu3BH8fi0Dk=;
 b=LCE/PQxMWZKNgsQrGTQCJeBw6C0fWuBeDJv1Q9KGqbgS11312Inb7LzQN26CKUU8PKeIvVVDAlwdovHb1Gz8UGAWQIpYbzlG+vtXF8jz3Y8CHTl2HW0Fqx8xBS98pQqXP7M+8xrCYnEsDmxQ+bgmNqx29lFR7DsCSnYoQu1sVhA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8301.eurprd08.prod.outlook.com (2603:10a6:10:40f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Thu, 16 Feb
 2023 11:13:56 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%6]) with mapi id 15.20.6086.026; Thu, 16 Feb 2023
 11:13:56 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>, nd
	<nd@arm.com>
Subject: Re: [OE-core] [PATCH 1/2] site: remove glib site values
Thread-Topic: [OE-core] [PATCH 1/2] site: remove glib site values
Thread-Index: AQHZQIzk2QutFnBQ90GNjOXSg+sK067PF72AgAJWoYA=
Date: Thu, 16 Feb 2023 11:13:56 +0000
Message-ID: <80BB828E-03F0-4A32-B424-D453749A4A45@arm.com>
References: <20230214155603.2390194-1-ross.burton@arm.com>
 <Y+wZv+VfY7CatrUu@mail.local>
In-Reply-To: <Y+wZv+VfY7CatrUu@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8301:EE_|AM7EUR03FT062:EE_|AM7PR08MB5318:EE_
X-MS-Office365-Filtering-Correlation-Id: fcd9b39a-8fde-4eb4-623f-08db100eeaef
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 we94MdXRFM6BCIoCBaVABgo754NrIcTxDerVw4C0dkiIznT/E3i7AVCRnCxwmqWNg60tF3wsVQvw1v8/iSWqbj87MxktZVh13nptGwqTWbCVEwvC2dsef6wgOuRnVLpBAu3hV3JWRMaVI8oerEH3nEF9+M5rkRghQ8KhZLMzYwvUCJWnk35bC/pzUlk4icvmA+byybni7NLNk28d6rS6sfQUxnORhBWK3bAIHVRkWCDVWOWTJ9BNe+eE9uuAmpy6WnPHSoieatxPFM+XPFRz5rD5lZacrglXUfSfP/nxNgw4HXY+GgNqWi5pbGGpPJ7OMwh1NUsrf54ODYoIP32VMefxM/qC64FceHRhqEbnmeLS0k23n3va8iM6NvQzu32MDCg1Dnn/fjRQsv4nqsxC2HqzcJ6BTGm7Swl7je4i/L2cbO0kSoRMepPf2Y2vlXY3xRv9D3IUz1eC1MrQhBy15mNsigufv1boX2q8V98B15h2SO7faKqdi/2fLmBZeW6baptQ6ISH4X057dwp3kfx8iYrVtV6xdSGSjfa+otFl7UybqnH/KQ3cUtSj4DcqBA8EiSUqoFNczqzJmyIVGSzHnyNx72H61GnCjySAxytXmx8ZdN4lxfNAW76nF6HXRytDFl2SZD6HRF1rBuBgOBDfH9cWQb3rm+WKMb3kVPM60OcY9miw/hBfXdofOz+CEzUnDwtDY2aXpET81Whv+YPcAteQTGGZKQ1mHVwpUEjkwY=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(451199018)(186003)(66946007)(122000001)(8936002)(38100700002)(6512007)(2906002)(53546011)(91956017)(6506007)(5660300002)(41300700001)(66556008)(38070700005)(4326008)(6916009)(71200400001)(54906003)(66446008)(64756008)(66476007)(76116006)(8676002)(2616005)(316002)(86362001)(83380400001)(6486002)(558084003)(478600001)(33656002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B8AA0258040F448AB66CF7FD0C0907E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8301
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3db888e8-43f1-474a-a894-08db100ee51c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vzwQ2cVZ8ZaK0SgAgH0tmAdLFLd2JGfLMENNog0LSgBoB7RU4ijsDcvAJwIXrhfNjj5QHQOAQNygfrJnJVce3NIWfd31x3BHiVkB8CTPSEprqF2i562JV8tk3fR4ik5HJAN1+zwnRxGdqLeuNCXMOMDyx9bZB4HbR3/CNp3tRypwRcCibbZIU/1jheYDIKQL3esQD2+BPOUTXYVg45O7iRdyBBGHGRsQkAw+XF5zy9ER4DKH163j+LuUfUqVYKYdTX5pkymMkevCvpfmICxh/+fs2gA4ky4obr1h8NleuaySe/SVDUu0zl9HIfvztPm3w52AVA6QUo84hB3b2AMAhDzttsjR9pPFeQK0UygUBieQR9/JTqILfm3SkDlknDNGZ2C2f1OYzIlNN9n2krt8J9EI9HcJ9mcWGIwq08x1qqQfxkUKEzD4x7kL0rMDLSCBbr66AoVRAay3zrEePcLT3SF6LzUNRuytIUaorF/x7mkXPIRHwPorEO8S395bpsjY+7UwnftPl5tE+2fLGez8vVnfmUCEQ0lcmK4D9Kgqv7Sf/6MEZx/c4TAHDp/QRLa/CJGBio8rWE0q9FlGcZzd1LuFfpkUHtfr3NBY1hyeL0VhKf9t007EBR1wbixvdHcEwHx++xb2hR74dP/K0cJyLhM2YfWorkj9chG08bzo6RBgvMAbvwG6lCJjvc/DmWedPgygFHZS/TcwCMVg97RLZg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(396003)(346002)(136003)(376002)(451199018)(40470700004)(46966006)(36840700001)(36756003)(33656002)(40460700003)(6486002)(558084003)(86362001)(316002)(54906003)(5660300002)(478600001)(8936002)(6862004)(70586007)(70206006)(2906002)(4326008)(8676002)(82740400003)(41300700001)(36860700001)(81166007)(40480700001)(356005)(6512007)(186003)(26005)(53546011)(6506007)(83380400001)(47076005)(336012)(2616005)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 11:14:05.9575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd9b39a-8fde-4eb4-623f-08db100eeaef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5318
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 11:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177284

T24gMTQgRmViIDIwMjMsIGF0IDIzOjMxLCBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJl
bGxvbmlAYm9vdGxpbi5jb20+IHdyb3RlOg0KPiBpSSB0aGluayB0aGlzIGlzIGNhdXNlcyBmYWls
dXJlcyBvbiB0aGUgQUIgd2hpbGUgYnVpbGRpbmcgbmF0aXZlc2RrLXBrZ2NvbmZpZzoNCg0KSG93
IGFubm95aW5nLiAgKGxvb2sgYXQgaGlzIHBrZ2NvbmYgYnJhbmNoIHdoaWNoIGRvZXNu4oCZdCBj
b250YWluIGEgZm9yayBvZiBnbGliKS4NCg0KSeKAmWxsIGNoYXNlIGFuZCBmaXgsIHRoYW5rcy4N
Cg0KQ2hlZXJzLA0KUm9zcw==

