Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BE8C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 12:48:51 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.55])
 by mx.groups.io with SMTP id smtpd.web10.11692.1699966126786802487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 04:48:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=mAhGQ5vB;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=mAhGQ5vB;
 spf=pass (domain: arm.com, ip: 40.107.247.55, mailfrom: luca.fancellu@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SK3Q0yw8bJ/DChzBhs9usCy4VdajWQ84aOwBG7D+khXK6gglpFBlNaaiajEmmf7PPy88SXgGP8hUZ6hmzB/5wEkkompFDeu2/wzaH6MSU6QkGfN8YVG3cg2zwYWtdRqavbhqmjF3sqLskRXa9rwPKy0sk1YqZTPSGfjC05+7gN1qr3J1cDUlVtfG+s+S7DHMvVep3ICThBUFw1FdkGz+9ZXBLi6o9jkGCP3dAmAWglmYQMAROSpNo2PLN/xVKqO++fzzmGCzF3iybuYXkJ/r8I6raU0HzMj/RPBLDX8IiEiyblQ5xyMG8Y7nbkO/9/KOiXbyRZbHZK5cEAT95ulaHA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hpcd9DvmHuvYWkmclygKJbaXvgAEIuPRGxf0Skl0gCs=;
 b=SULxNHV+ucKAl0nxfh6dPblK2jaEa8JD4cRjAG0BGpk+U9L1XR3JDFy6aPjMITdfa1NUvB3ZDKJf2++URtbc4E+odhLtwAbiDMIdsw+khkMZvVHjT8p6X0/f3DZh9UxtH3o4eSTD5pEtk+j79Kuq5n5o5zdqCBWWq5VdTJAqeUPUymhPS+ChPs424xrUbOtf2N9GtvHXLcbICTmh4WhTCRX5N2QntL6mylhZpGulFQN78aZ+DAIbecCn5WXgaDCzYf/hnlyRukl6eC67U7xwIh3fhec6VKUshwyciRuLFt2wtXI1h/R285+RQbwk8UqqXXEC6Oifyn9/R031gCQtdA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hpcd9DvmHuvYWkmclygKJbaXvgAEIuPRGxf0Skl0gCs=;
 b=mAhGQ5vBwekKpmlXci25ijxMzJ8EuvTfg8VwfwfU8UTyUpHsepf1N7+ibHBNnVRgY01bSqjkhShlfduCVndDFKDrSz/HjBUZ0VibF/06EOr5JV6dRDuuX+FKIYpm8JHeyirbxl9AKzB3KM7KWc0Oc5A197CFmCbFe16Ad72IwNA=
Received: from AM5PR0301CA0019.eurprd03.prod.outlook.com
 (2603:10a6:206:14::32) by AM8PR08MB5619.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 12:48:42 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:206:14:cafe::66) by AM5PR0301CA0019.outlook.office365.com
 (2603:10a6:206:14::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31 via Frontend
 Transport; Tue, 14 Nov 2023 12:48:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.13 via Frontend Transport; Tue, 14 Nov 2023 12:48:41 +0000
Received: ("Tessian outbound 8289ea11ec17:v228"); Tue, 14 Nov 2023 12:48:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1d99f611c3df6ae8
X-CR-MTA-TID: 64aa7808
Received: from e3f1ef4f5e2c.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 133C9A5A-48C4-4FD3-9255-49C194F07A81.1;
	Tue, 14 Nov 2023 12:48:34 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e3f1ef4f5e2c.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 14 Nov 2023 12:48:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kg/nCVxF8JSZf7hqAWSf3vKCkHqUeVvDWVJFtWE5HALCmnRm6FMu0ja25e9YBbPvg5eHQBtO9rhVQM5LMWV8vFZ30vXu4DZmRxzENAPhknWeCkd9ydyWA0racpTgp+ky0VphcQocwQgkxN0WEAre3cWMjoHtJqqOD1AvXptPNwurKwdAOAoaixnN8WUUtCaUA+b4PZNZyk7+Hz+vV2EC8qeNwir4pyPgQoxxvaqWkLI+50MCf9ja96+iusqubiJHYn2rFdHtdRtGuChwfr1c477bEOR7wEH6sIBI1YrEMnKnHXF8VskfjY0/QS+TbvybIbbDY1Hevpzw/qT0LCsDjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hpcd9DvmHuvYWkmclygKJbaXvgAEIuPRGxf0Skl0gCs=;
 b=L50bba2UTMHBqfnQtURZl/sf4aUYRzs+feqfJNLA1UjI60YpuQZ2n8AWbedF9UvQR1gQIegSBtEOffDvOJbh8YCuQj9B587e04Qg49S8bZMd+FeSl6lcdHN/U5AnjfgtIqkp55FWVU9t4cz82cctQSUNewyBa+peTv0WHNFSNj7F4qUyxMPZr33YyNtd6PgQrEoJFTu0Rb49gMGHvhSAsaRIwYMkWx2pnk1UFmHkO3Q/UYoujciPn3DWnrJWQx8FmfJ0Eqn42rsbrOKG8ej+/0M+LISshBvLXOL1xuXK/aRWADEKSOyMvjfSJZwURH+N+E3+g5lVjBbcQKPmY7WKhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hpcd9DvmHuvYWkmclygKJbaXvgAEIuPRGxf0Skl0gCs=;
 b=mAhGQ5vBwekKpmlXci25ijxMzJ8EuvTfg8VwfwfU8UTyUpHsepf1N7+ibHBNnVRgY01bSqjkhShlfduCVndDFKDrSz/HjBUZ0VibF/06EOr5JV6dRDuuX+FKIYpm8JHeyirbxl9AKzB3KM7KWc0Oc5A197CFmCbFe16Ad72IwNA=
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PA4PR08MB7484.eurprd08.prod.outlook.com (2603:10a6:102:2a8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 12:48:30 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%6]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 12:48:30 +0000
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] oeqa,ssh: Handle SSHCall timeout error code
Thread-Topic: [OE-core] [PATCH v2] oeqa,ssh: Handle SSHCall timeout error code
Thread-Index: AQHaExoxwuvZPDi8gUikCMmnqxigdLB3/nsAgAHHmgCAAAVnAA==
Date: Tue, 14 Nov 2023 12:48:30 +0000
Message-ID: <093F1853-D47F-4523-864E-D598B5AD0C5D@arm.com>
References: <1795FB2C1C71F485.6123@lists.openembedded.org>
 <516F7265-433C-4ECC-AC55-1328F27DAC4B@arm.com>
 <662DE3B8-8C57-44B2-8E1E-DD1C6A929AC9@arm.com>
In-Reply-To: <662DE3B8-8C57-44B2-8E1E-DD1C6A929AC9@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM6PR08MB3749:EE_|PA4PR08MB7484:EE_|AMS0EPF000001A0:EE_|AM8PR08MB5619:EE_
X-MS-Office365-Filtering-Correlation-Id: 945d315d-363b-456c-4e88-08dbe510080b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 EiZtQXy1xloGubKn6tv1xuSaNh3i/C4mOmOeUSSy/g7dhg90UtH/I/EQ/g95sfK/HOMOk0Nq8Ubrmu41GctV8scsLk/j4uQ2dVVYMEzMxLzwIbYewB1WAbh5Zoui40nbLlall1BqB6agh75wa+JxDojT9gbrWEmUAID0GSuo0/XOnrqF58UzJRsu2XG+xIqxG9HCjI2bxL+m1PFzYpJUCnsq7g7K9T27I0+XGPdK21l3ckettxp9mrPkFbNdq3aHTfnSKtm9kiAM5mqt3A+RS0iltiw8LbPFJnPH/dZWoI5ua+jpRRu/8XccS66pA3nawuGU1dmbC1YSi5fB5YjrGgS/7J3HyVX9Rrd2QmkiIIgvVnYw9F8F35cxzi3MA6KL3AYCtFCduW3MEGm78uoYQTYe43lzx5JfKMV1/iy0Bhtv8PkSyJw4YnorG0Ff1ZJLjz6wgmTNKXThW53k0YIrbbhunbiPwshyrvRIYwkGemFU9ObEhPu5CneQD8r5+Is+07Plz3XcUzcuUite4KvFkJAH/O1htTRwvPTQI4MiM00vqm7HMR22ya/wVU7YC41o/xE4K0y2vKil90niGbD+1UtoudwQawGkhj1/xN+ktyrc4Z+9u1XNSfWWuchtETMnYdkv1eZzjzd4j5MUvchNgA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(376002)(396003)(366004)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(2906002)(4744005)(5660300002)(41300700001)(38100700002)(53546011)(33656002)(64756008)(66446008)(66476007)(66556008)(86362001)(36756003)(6636002)(37006003)(66946007)(2616005)(76116006)(91956017)(6512007)(26005)(122000001)(478600001)(6486002)(71200400001)(6506007)(83380400001)(966005)(38070700009)(8676002)(316002)(8936002)(6862004)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <481C2496C8113F468F3929EAD5C2C774@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7484
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	26092921-df8c-4e82-568c-08dbe510012b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KHCVNmDG5t78m8efubKXqORI8VZ37ChBewTCBcapjiA4l4KMxf5RchaQMmw8lGT25gdN6NDVcK2RmS7sYO0FXuHw/IH1Hcjtg2+5sjBwuGR+N0rrorX7SYmGyUEND0dwNWWvwoW17Yyeg2hmUcJtEEw+L3Qub/dRx49pXv/I3juP9aR79fLWx7MKilofHDzvMSfyXv2qL04gVauy7C2P2h/75+edwncvvUx9cbFjQSigR9PKA5vn+pp9cZwBOjYxSsrtPY9g22C94Io4TLLd4daNN6f+1nREh+P9k9966hCvyAlu2FLALUMCUSPSK5ynTRyVnftvc2410BF7BZtFFESVehbuIu9gyaN8bw6346hCKEPERe2QonLoqVa+NkdavSYf50hpmn3CtIeZlfPRBq/+6o4tPdqETvQOEmwIDXiUX9gQRm7L2vZugYdxaNLkg6JXDBupIntEkHrh1AfNP3pOw5DLK9RRJyLCSmNqBfn+aK8dC9SIVLHFouZu/bOzic05JailRdygnba+4PhVKXAN1kQYRoqqs019GyVEMT8oZ1vz1QndBj3q0inizNq25jqjBSWZz5zEiEUmj8rYvHLr2xmbSz7lAG950ltVYzAH5PmfyfF0yIVnc6H55l4HdVBUNLcF//8Jo2s/krumCaoB6YjB6BfpnzYTpLBl8m210BCA9l9i/dL7VRrkS3og5rSNQi1wsujVHZc31cEx4AkMyfLx827jAjC4zL2adOI=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(376002)(136003)(396003)(346002)(230922051799003)(451199024)(186009)(1800799009)(82310400011)(64100799003)(36840700001)(46966006)(40470700004)(336012)(5660300002)(4744005)(40460700003)(2906002)(26005)(2616005)(41300700001)(36860700001)(81166007)(356005)(36756003)(33656002)(86362001)(82740400003)(83380400001)(47076005)(53546011)(6506007)(37006003)(6636002)(316002)(70586007)(70206006)(478600001)(966005)(6486002)(8676002)(8936002)(4326008)(6862004)(6512007)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 12:48:41.9784
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 945d315d-363b-456c-4e88-08dbe510080b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5619
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 12:48:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190504

DQoNCj4gT24gMTQgTm92IDIwMjMsIGF0IDEyOjI5LCBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25A
YXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAxMyBOb3YgMjAyMywgYXQgMDk6MTgsIGx1Y2EgZmFu
Y2VsbHUgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPGx1Y2EuZmFuY2VsbHU9YXJtLmNvbUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+IEkgc2VlIHRoaXMgb25lIGhhcyBiZWVu
IG1lcmdlZCBpbiBtYXN0ZXI6DQo+PiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL3Bva3kv
Y29tbWl0Lz9pZD0wZjI1YzhhYTc3NTAwMTE2NmEwM2I4YjIxNWI3YjlhYjgwZWY0ZjllDQo+PiAN
Cj4+IElzIGl0IHBvc3NpYmxlIHRvIGJhY2twb3J0IHRoaXMgZml4IGFsc28gdG8gbWlja2xlZG9y
ZT8gT3Igc2hvdWxkIEkgc2VuZCBhIHBhdGNoIHdpdGggW21pY2tsZWRvcmVdIHRhZz8NCj4gDQo+
IERvaW5nIHRoZSBiYWNrcG9ydCBhbmQgcG9zdGluZyB0aGUgcGF0Y2ggaXMgdGhlIHVzdWFsIHBy
b2Nlc3MsIHRvIHJlZHVjZSB0aGUgYW1vdW50IG9mIHdvcmsgYW5kIHRlc3RpbmcgbmVlZGVkIHRv
IGJlIGRvbmUgYnkgdGhlIHJlbGVhc2UgbWFpbnRhaW5lci4NCj4gDQo+IEl04oCZcyBhbHNvIHVz
dWFsIHRvIGJhY2twb3J0IHRvIGFueSBpbnRlcm1lZGlhdGUgcmVsZWFzZXMgc28gdGhhdCBjaGFu
Z2VzIGRvbuKAmXQgcmV2ZXJ0IGlmIHNvbWVvbmUgdXBncmFkZXMuDQo+IA0KPiAoSSBzZWUgeW91
4oCZdmUgYm90aCBzZW50IHRoZSBiYWNrcG9ydHMgYW5kIGluY2x1ZGVkIG5hbmJpZWxkLCBzbyB0
aGlzIG1haWwgaXMganVzdCBjb25maXJtaW5nIHRoZSBwcm9jZXNzIGZvciB0aGUgbGlzdCByZWFs
bHkpDQoNClRoYW5rIHlvdSBmb3IgY29uZmlybWluZyB0aGF0IFJvc3MuDQoNCkNoZWVycywNCkx1
Y2ENCg0K

