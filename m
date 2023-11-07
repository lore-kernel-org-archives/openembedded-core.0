Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA067C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 12:24:43 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.85])
 by mx.groups.io with SMTP id smtpd.web10.9206.1699359876598787075
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 04:24:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ZjBhuvrH;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ZjBhuvrH;
 spf=pass (domain: arm.com, ip: 40.107.7.85, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ZYypKn+uu5OeDZdYJrK+Fw6xSc3pWY1lEyjeDNDv6BMgHqgl1tmUKsCcQ6axDtBWLlzjEwHrABJlK6+mHiWUmFs7zovQrUxETS3DpHm8KxihlSJsgs5qTiMrxBXEO5tbQtc2c4FVnB41sCy4XKFdFbe+kYuJe/DMW/2YD8OCsKURclfXyhxCrWhkGNHspaYQkFA/S1xGqji9WapEIIA+qnbcqMdliHrwyEsMk7LXQZpUviLOTLVWELU4ngEWySixJqRek0qFRJJHgUTx5soHNyLLuDpFjzmnBFXs2Jf1fZrjqhesXN39hyGdcjfLUbU53ejHUhA70B1zNXkNr271TA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4q6nzoMr7R8RGsyz9sEmmrZH75+eoNeY3F0MfTu9pA=;
 b=jB+mNscKFW5JQ8jKwkc1DXxl3SFiJA8p/qu4ehNAWAFhnRHMoZBxaLQOWvOcYgpVgH3CQznFyZ9TDdqq92HEWJXl/Y7NcKmQ+0U9qznnJ++iqf3cCe78L3Dc/dM0+W+su4WMFw86pQpDhM8h/UdgA5GYsMlTVko1cJ5HPkV/wG5ZbJdd4pl2X3TJZuaGlvZx0+PgZ4DpVJETdtswGhck3+Kky/pkSB9LJ6a8THy+H7q8YBlh5/5ZsR8yUuz6GamcAmGjDZIj4lKjeMDMYw8T3luuSZcT3ShFUAbjlHyAVBLYeJ/sycjzsOwPQFlGtO3tqSKerCUkmCz2FVg4wdXmxw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4q6nzoMr7R8RGsyz9sEmmrZH75+eoNeY3F0MfTu9pA=;
 b=ZjBhuvrH2Jhq6AC20IYCqRGhrN2PW5Gyjt7mrYUSg552pfrbJHgrHKe6VJWj3QaUvDGN8vm5nU4btuMTpA9SgnqS4prODoMqBMLERrG6QYCDmMCczafOXJwkKO2z8i5wLNz2/9FCyBv2kXPRnxViOLz1IhG2mlxhcAM7P2Uh9TA=
Received: from DU6P191CA0022.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::13)
 by PAWPR08MB10282.eurprd08.prod.outlook.com (2603:10a6:102:35c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 12:24:32 +0000
Received: from DU6PEPF0000B61F.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::c4) by DU6P191CA0022.outlook.office365.com
 (2603:10a6:10:540::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29 via Frontend
 Transport; Tue, 7 Nov 2023 12:24:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61F.mail.protection.outlook.com (10.167.8.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 12:24:31 +0000
Received: ("Tessian outbound 5d213238733f:v228"); Tue, 07 Nov 2023 12:24:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9aea331ea0135b7f
X-CR-MTA-TID: 64aa7808
Received: from 6935e46d06f2.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B0D4F03A-00E2-4718-90D0-8446ADD46784.1;
	Tue, 07 Nov 2023 12:24:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6935e46d06f2.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 07 Nov 2023 12:24:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WbRL7D1Mu6cMBQuEETIQjlcoyyNtuxG5dYQqGco5LuLXQb45q17nbBsJF6NH5+sva1+KLDNGQXA01I+fm7Pfb9kBmeFDSkMVrNy034hgLtjC15eZEk8NmmCPdKjn2WAIXaC+DJB5pfi4yzqf1rFz2B9SWsb9VLDyEUNUEqOwdL69Plkw1bEs5hz/aM0gtxHq6Rzle7b3RPBoyT/x4byKjgPqYgH4CCYConhalbqQkK+gV7+5AZf3jPqsu1shSZJIz+uJvhIdwRf4JlidRp2eURHzH90H3A5E+o8W/DOdO1K/kuaTGsWkbF/qrBpItklc7ifbO4nrUNDy8uMbxHU46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4q6nzoMr7R8RGsyz9sEmmrZH75+eoNeY3F0MfTu9pA=;
 b=aHto8B0RuEzzNQfAjj+sB/j/WmCxyYCjK1HpY7PbfsjObzIjg0erG0xNYGNALMGuB1sRYPvv3LR7/UFDJytIOHPRBD12z4ELI6XSanpEAsaXq82gJejUUMDrf3j7adxIBaJTgd07n0FaMbx9qLfQD3sgEIoW9naM9PJaHoOeq40AVqM/A8uyxkLry+9vM04tKUr6hjF/MwsBf8usdWMSdAY9UxYigZo1nXVHz83/itXIhveIVzGfW1JRtb1E6UuydTyxyCD3pux8sNW7SDImqbCyeicM5Gugtz4Ih8ZvBHEXFkujEU5LeyQscSZ0BpDy0868g8ow25vG8SO2Ic29Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4q6nzoMr7R8RGsyz9sEmmrZH75+eoNeY3F0MfTu9pA=;
 b=ZjBhuvrH2Jhq6AC20IYCqRGhrN2PW5Gyjt7mrYUSg552pfrbJHgrHKe6VJWj3QaUvDGN8vm5nU4btuMTpA9SgnqS4prODoMqBMLERrG6QYCDmMCczafOXJwkKO2z8i5wLNz2/9FCyBv2kXPRnxViOLz1IhG2mlxhcAM7P2Uh9TA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9819.eurprd08.prod.outlook.com (2603:10a6:102:31f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Tue, 7 Nov
 2023 12:24:23 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05%5]) with mapi id 15.20.6954.027; Tue, 7 Nov 2023
 12:24:23 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "vanusuri@mvista.com" <vanusuri@mvista.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][PATCH] xserver-xorg: Fix for CVE-2023-5574
Thread-Topic: [OE-core][master][PATCH] xserver-xorg: Fix for CVE-2023-5574
Thread-Index: AQHaEMbGx1Swl1XTnUWKo9j2y10OsrBuxz0AgAAB14A=
Date: Tue, 7 Nov 2023 12:24:23 +0000
Message-ID: <118232EC-C3B2-451E-A1F8-7E2C8B0B4904@arm.com>
References: <20231106153423.2958316-1-vanusuri@mvista.com>
 <316D7535-8752-4FD4-B434-C5E0C71CED84@arm.com>
In-Reply-To: <316D7535-8752-4FD4-B434-C5E0C71CED84@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9819:EE_|DU6PEPF0000B61F:EE_|PAWPR08MB10282:EE_
X-MS-Office365-Filtering-Correlation-Id: 780d8a35-4cd1-4bce-6f39-08dbdf8c7eba
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 JWO6kiTDETNqxsUWdtUgAJSkQ78fjTE5D9C3C0T2LUldAbT7nkCrLT0eNfm4S33O2dEEhshY/I+a6Bk1dFexTSkhNm5bG/XhtkLLiZL8zHRzfLG6vfOYtFKnjkjgH+jugzXLNJvgfOpeQotbdI5RiITwtVhaomV9I4532F8acDtjxK489AUnX9V35KOmEr0oedY7RTeBDbPVN/COOrkmqiLFOeheOFU+9Tv6nttVr5Z1lhrL5XRIJRbf4/LJa1UwFYfIhjJL28PTeXXjfXVVNUvoVI4K6HtEXVL68w1/E7FtMlOw22c37PJAGP+Pa0dskuLNlSXyhQweR8/6mc1MkO2iAi66jrI1O+5JojMOS/zNdEGiNfp1uaXehEXKpkdCJR+C+81MSWppU+UGwuVPHBVGDkdUU0xNlA0N4dIlwbmFNvZvH6gdquYJ0wmvb+Az69WP/AHBZE29xzsfrz/rkMRvZ+n04SuFuV0t+2M8/FKWRaY9WpjvYS4ZccRpkOzpmIhK3ltnsX2LFnCNZAzmKNP60hBN18vxywO5LoWBYuk3t2RWKgsUpZ3izKHk28KdGk0SSD1BuaZWsoYSdI7CPyD0KFiVIWW6+Skxys+qs/ChT1u0gHo6naEG1MoNt/oO
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(136003)(366004)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(316002)(2616005)(122000001)(38070700009)(91956017)(76116006)(66946007)(83380400001)(66556008)(26005)(71200400001)(478600001)(6506007)(6486002)(966005)(53546011)(6512007)(66476007)(2906002)(4326008)(6862004)(8936002)(41300700001)(36756003)(8676002)(5660300002)(38100700002)(4744005)(86362001)(66446008)(64756008)(54906003)(37006003)(33656002)(6200100001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <128702E0DAB22C449281E86D7DFA7D6D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9819
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	23fbc1fb-864f-4fd9-2747-08dbdf8c79fb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jeHKxydtpRdn8032/IGRQ6tedIxegXfIid1syfbbRAAhzzT5Q7uq+QXG2mVzF0Rxk771dlM6MDq5QQH+aBEcfzHmEjavIyyW4OKlXkgR+gtr3c+fcwmItZuDA8lgiqfAXSwFALEv56LzBfHWlREwP7saU5dM1mdPyAP98I7I3h8y9pQszSb+/lBctQjkzQxq+Wr6X0/h+3A4FfFmKxcFByeoB73ISx5gtnNey42Dl6sk5SsUoyfNwY1ZHMecEWWRVMwx3D7PvhHMpakANgjOdlofbmgTamWP87upMKsQuDtYJizy52ZCMkc4zNmzWUaDOJXL/C+G2MLSL/sHBQBZyczee6N2JL1ms9qk6UOGdBay2VUMCIpEDkBaGI+A+p7rlLSv4vEikXXc0xlrTKKnXrhOnnA7w6GgPV7du4zE1iklMYV3E6vt4Pgx3rjFweF2z4RmLFZYJoTbLmsLwR+RD4CubRZVd+vCGBDPbnwuzuj499LvqxweKMBTG5nFM69QNRvU8mLTO1R9SgwsqINsrLOOhpZ22Wmi6y0hedhu63PEle5u893EiKYLpJrC/ziFo5wVp/Pwz+AQKNuGIg2woMzNWVPuPsnXSuUGT1T1fONNIfI+Um/XfU7dPFUFxvJ5oJQz+kmd+EQDrQxHqz3yCJWTnMLI0cxD/VM+mS3mRhsHfCCv8WUv61Ohxpj7QelBwob7XncvQqvMof8fdHKWtoiyAKJShOVkPau9tyxQeIU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(376002)(396003)(230922051799003)(82310400011)(64100799003)(451199024)(1800799009)(186009)(46966006)(40470700004)(36840700001)(2906002)(40480700001)(5660300002)(8676002)(4326008)(6862004)(81166007)(356005)(86362001)(36860700001)(4744005)(47076005)(83380400001)(6200100001)(33656002)(41300700001)(40460700003)(70586007)(336012)(82740400003)(70206006)(6512007)(8936002)(2616005)(316002)(37006003)(54906003)(6506007)(53546011)(6486002)(26005)(966005)(478600001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 12:24:31.7620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 780d8a35-4cd1-4bce-6f39-08dbdf8c7eba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10282
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 12:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190276

T24gNyBOb3YgMjAyMywgYXQgMTI6MTcsIFJvc3MgQnVydG9uIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxyb3NzLmJ1cnRvbj1hcm0uY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3Rl
Og0KPiANCj4gT24gNiBOb3YgMjAyMywgYXQgMTU6MzQsIFZpamF5IEFudXN1cmkgdmlhIGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgPHZhbnVzdXJpPW12aXN0YS5jb21AbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4gd3JvdGU6DQo+PiANCj4+IEZyb206IFZpamF5IEFudXN1cmkgPHZhbnVzdXJpQG12aXN0
YS5jb20+DQo+PiANCj4+IFVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQNCj4gDQo+IFRoaXMgaXMg
bm90IGEgYmFja3BvcnQgYXMgdGhlIE1SIGlzIHN0aWxsIG9wZW46DQo+IA0KPiBodHRwczovL2dp
dGxhYi5mcmVlZGVza3RvcC5vcmcveG9yZy94c2VydmVyLy0vbWVyZ2VfcmVxdWVzdHMvMTE4OQ0K
PiANCj4gVGhlc2UgYXJlIFN1Ym1pdHRlZC4NCg0KQW5kIHRvIGJlIGhvbmVzdCwgdW50aWwgdXBz
dHJlYW0gaGFzIGEgZml4IHRoYXQgdGhleeKAmXJlIGhhcHB5IHdpdGgsIEkgZG9u4oCZdCB0aGlu
ayB3ZSBzaG91bGQgYmUgY2FycnlpbmcgcGF0Y2hlcyBmb3IgaXQgaW4gbWFzdGVyLg0KDQpSb3Nz

