Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67592C5AD4C
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 12:44:07 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.41])
 by mx.groups.io with SMTP id smtpd.web10.89717.1700743441339351889
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 04:44:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xkQiuXHO;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xkQiuXHO;
 spf=pass (domain: arm.com, ip: 40.107.104.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mVJBu7NzGEcjBNvmocllkUdMcCb3dDXLaVGFO5H7o8z4030PlHCDEZXG/YkW5DqKkxta6SRpLrvqHwfFsnFR9hCLeaqqyzS/+gCVTFMYZs+2DihViBBw8CWTgG1RMWCOL0kL7aw8LIwRHMhivQdJ7CorEmT77FdzZXiZJf8c/zfJ+MvI6NuNAyxgzWeUOCa3P04thiTOjBelqHgb6xMeBITRtcTvLU1vS1hrKmzgwidM7uBk/qG5RFdhWhwk6yYMxOJ/duuXRZZJfk0ygOemU1Qqep/6f3ZC0dyVJveCnnp0RYvDK3apogrm0IA4Szcw8TY5Uhv9RPVTsxM0f+e55A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsPaiRCnq2FBNsduTOSSkK4txdC3+1jtuH1LUHlHoMY=;
 b=CsakSkYcIpkYiuYJX/dLb8CCpoG4Ip4X1yphWLHNS091OFy9ysQDDSvpRIAN8Q4yIaByoIuf5N4XU/dP3ab+7i5AomjklxETBSLhJGQBwEPyqWE7ISVmOGDUaUrpC22jKererPTKIScMxI6rJw/1zjOWxMLi9FEqmeHGX7SRiCxHdsf+2mbozprRyxeyQJCXdOHfMDd79YHexJB5KKk+41xjDYifEmz9S8v6vSS04Bi9ta3h3VnZ4CPfFlJaREzXCA/Z+/iqX2V9naLWjCVQzimaAQj88CdV/yzgsx8uZ/Z30TV7p8lRxqbp5AULhEWhxi99+KBxfMyDEMfHQzlUGA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OsPaiRCnq2FBNsduTOSSkK4txdC3+1jtuH1LUHlHoMY=;
 b=xkQiuXHOaeYyqXrCxx9ODzeZ3+fT3fhfxzeGIIDtVpLZq4mdTdQGOSxI0gnMenUHDwBqxzMg4LDruxBemAeZ2eGCLDmAixOdS9PU1ZpZ/qQT/OxNHDardhOKGCv2b9vSvXvhF5zkYg4i2XvO6inkZ1HldMDNvhq+kfV2A/EzeBs=
Received: from AS8P250CA0004.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::9)
 by AS2PR08MB9391.eurprd08.prod.outlook.com (2603:10a6:20b:595::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Thu, 23 Nov
 2023 12:43:58 +0000
Received: from AM3PEPF00009B9E.eurprd04.prod.outlook.com
 (2603:10a6:20b:330:cafe::e2) by AS8P250CA0004.outlook.office365.com
 (2603:10a6:20b:330::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18 via Frontend
 Transport; Thu, 23 Nov 2023 12:43:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009B9E.mail.protection.outlook.com (10.167.16.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.13 via Frontend Transport; Thu, 23 Nov 2023 12:43:57 +0000
Received: ("Tessian outbound 20615a7e7970:v228"); Thu, 23 Nov 2023 12:43:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 86560142ecc8d4f8
X-CR-MTA-TID: 64aa7808
Received: from 5dd31e34ad70.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C8EEFCAA-2E51-4CDE-A4A1-62882399833B.1;
	Thu, 23 Nov 2023 12:43:51 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5dd31e34ad70.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 23 Nov 2023 12:43:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHvyE6cyncwHfWqMrKxfPpVioYa2Kuj70S7fZtYpslMmrLwumiCUD37iac+ETQ4g5INnDRswlvACcSjUVqp4RY9g2HvKGJQElHs9+wjAHd5/9Pdm5sR6Qt7X76YojDIJB0+3yvLuSLiTXS2gzqHC0W2kriTR2IWa18ng6XSCvDI44kB5Y+rOEsfdUmJUJGSB6NgPAg1ZjEQlKwUjDrz3Zvjegol6JJUZ2d0aoTRrRmEsnf6woZeupIFZ9qRg+axJgDwJqGje8Z8o6fxnRsermG5uRJAMn9G7qVM/BcsB38DSCuRQ37eOCtkvatcGgdjAYSbgKonbM+B+ee5vRB6WVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsPaiRCnq2FBNsduTOSSkK4txdC3+1jtuH1LUHlHoMY=;
 b=ntZ2/HEnF604p0OXP+D5v+hYquu/DgyvSnInVKGSnQWLyEy4BFOWbt2l4QicUkDJNWkRekhkV4QJHO++R+DW/ENXlknWuZL5eOLS78IG4Jb0IT3hFWEgihwc3uJLMPBIHvYQQw9o1uMt7iOXIYdvyOCeCm0hdL4DNv0BjH/tJXxU0RNC4jJooju+n6Itw5c54BgQZ8vDOpU9UOsNDh7NGgwxfbDMGYpIQgPehr2xNiQbES/pYbueTkUwecqwsfjrK5PRrfw3z4EwKfxjIXGjSLk+D+xp9PxOKmmdxJUOI0L4CcuXCbn30IiH93iTPICae9dKUApGc5qKdXKjxCYc0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OsPaiRCnq2FBNsduTOSSkK4txdC3+1jtuH1LUHlHoMY=;
 b=xkQiuXHOaeYyqXrCxx9ODzeZ3+fT3fhfxzeGIIDtVpLZq4mdTdQGOSxI0gnMenUHDwBqxzMg4LDruxBemAeZ2eGCLDmAixOdS9PU1ZpZ/qQT/OxNHDardhOKGCv2b9vSvXvhF5zkYg4i2XvO6inkZ1HldMDNvhq+kfV2A/EzeBs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB5473.eurprd08.prod.outlook.com (2603:10a6:208:180::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Thu, 23 Nov
 2023 12:43:48 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7025.017; Thu, 23 Nov 2023
 12:43:48 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCHv3] cups: Allow to be controlled by root and users
 in wheel
Thread-Topic: [oe-core][PATCHv3] cups: Allow to be controlled by root and
 users in wheel
Thread-Index: AQHaG81AEX2Mve1/L0WfxO9GtB5DELCH3cCA
Date: Thu, 23 Nov 2023 12:43:48 +0000
Message-ID: <33C2C00C-ED6D-478B-B616-0E2FBAA88C01@arm.com>
References: <20231120161848.1461683-1-f_l_k@t-online.de>
In-Reply-To: <20231120161848.1461683-1-f_l_k@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM0PR08MB5473:EE_|AM3PEPF00009B9E:EE_|AS2PR08MB9391:EE_
X-MS-Office365-Filtering-Correlation-Id: 49800329-3d31-4511-638d-08dbec21dc56
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 9nCFHkOPbB7VaOiLEY5Jxhct/JV7BH1+/jEyTiId+MJmQGmzQAruJHd2OjGxr78Ify7jTPIxIRmdjsshgtnM0knMKj/feOD/O5pIrCCh2tzDgxoY21exraIvKCT7D+lPkI7mq60zPEFFxAgNlcijvrKyx2rNZied/5TGovCXKmbRm4M47XTUTJjw3LqLdbqEPembxrtx6PcboBclHaRy5ufsV7ubUozFRRo8MAkTuD3l4csTEBymVU7z8wrl3bLe2pYoPILCQ1ZbFHD2IsOuHd3kCK8wg4wR+4wVO5sLXBNdRynf9AP4jILuXvTgs43OJl7Crv8aB17Tl81qC8LWqgFLpMvZYcJCoLqZCFxprazE/wC6TpITfBThzpSkjl1Z7QqTBNGhWgCUOTbAg/zbLwKxmyQIQifTfPrSrpthPOevLTIcaPyk7lciud67r69w3lGExFN07Dl2S/yG3FbhSVAfbZyDcYcG5rzbUdYCXyeEMA8T2uEWjZwlq4KIL4Y2ESRFF4mbkDwdhGLdV1ylgbJ7wkoqUN1flsyAp4JcXoUr8S7XSD4L+Z2RmCFmMaJuvjgxo7brIGKNa1VME6PG2Eaf1hZ7BxPgDNyH+3kuj0b+H82KgNBwZ8vrKFcrEGvHl231Eij0zeRSvVN+8X64bw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(346002)(136003)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(53546011)(2616005)(6512007)(6506007)(478600001)(71200400001)(26005)(122000001)(38100700002)(36756003)(86362001)(38070700009)(33656002)(5660300002)(2906002)(4744005)(8936002)(8676002)(4326008)(66946007)(41300700001)(66556008)(66476007)(91956017)(83380400001)(64756008)(6486002)(66446008)(76116006)(316002)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <73F0ACA9F1F57D42B846C6D2B435659C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5473
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f85a2e37-6461-419f-f633-08dbec21d694
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jpaqtHZ/u0My1BAGmIZDvVLX/25L7B/zCCqGQ3OUiU995dwQ7p/WcTQ6Ay+r/oH+V3/jXUG1u7Rr+K9wxnMD7XWjz2KjSrdFmpdqAHiXoQ3bOhBFhKy5bvaoM21qfMD1SSjDLE9OGPdoxwvgRk/WLZYzsVuGNBWw80kjLNt2wocrB5Oiw1H0yH9gL761OxT+DxF6o6qfMn+1FsuZrjTIEPfj4cY9z2rVTokNMmdWdkMg8dB3aQkSCblyGFHiZTFwAzVEdR9+JAusSs2GWHCu+vDCSexrbRZWBb8HD6yP6Dxt4JvxwhXgVFy9VJB6XRSYLAm150F2U/dYYFvdZ13D3iTRfj2k9JHRFv2XkEUPL+x+B4oJOrSXiXqtYUi2GMfqSfBRN9Sq+u6JQsWooz/Mb9s5vcpL9E30tkUzI7LrGIw7Y3tNim0f4EW9f6DZGXXajBBz0jMCzvIJEpWRpfSgXFkRX+jG14jE3EJXTDcTB9XYqXTAIYhJezCC2Eva0oQsZ0aG2hKelQH5IKqMwJXSqj71afRQ0Ni+4xCzpS/OmPAqPXaFqKo3DfjaWKDC+FlxI6PJKbwFsy9W58DoeshkbJlzZe/98fq4wjkgqvamzVYdrWysr9wWGqCrZZ2FnnjLjmkcaEmVQmrxxZz72UqQ7Qi1W7tbwxLlZL5zn7KCN6NqX/oAB7q+0sxlswMYlHseexAfXWPf23idGnMDX6h+NTrrSFzLZTAssRtuJSLtMLRdm3Z4txnkY4J3FEGEG1Mr
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(186009)(1800799012)(82310400011)(64100799003)(451199024)(40470700004)(46966006)(36840700001)(47076005)(36860700001)(86362001)(40480700001)(4744005)(5660300002)(26005)(83380400001)(336012)(356005)(81166007)(82740400003)(33656002)(316002)(6506007)(53546011)(6512007)(2616005)(6862004)(4326008)(70586007)(70206006)(8676002)(8936002)(40460700003)(41300700001)(6486002)(478600001)(2906002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 12:43:57.7157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49800329-3d31-4511-638d-08dbec21dc56
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9391
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 12:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191147

DQoNCj4gT24gMjAgTm92IDIwMjMsIGF0IDE2OjE4LCBNYXJrdXMgVm9sayB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8Zl9sX2s9dC1vbmxpbmUuZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IC0gICAgICAgICAgICAgICAtLXdpdGgtc3lzdGVtLWdyb3Vwcz1scGFkbWluIFwN
Cj4gKyAgICAgICAgICAgICAgIC0td2l0aC1zeXN0ZW0tZ3JvdXBzPXN5cyxyb290LHdoZWVsIFwN
Cg0KVGhpcyBsb29rcyBsaWtlIHlvdeKAmXJlIHJlbW92aW5nIHRoZSBscGFkbWluIGdyb3VwIGVu
dGlyZWx5LCB3aGljaCBpc27igJl0IG1lbnRpb25lZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgYXQg
YWxsIGFuZCBwcmVzdW1hYmx5IGhhcyBvdGhlciBpbXBsaWNhdGlvbnM/DQoNClJvc3MNCg0K

