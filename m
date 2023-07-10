Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0384BEB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 11:46:20 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.57])
 by mx.groups.io with SMTP id smtpd.web10.37498.1688989577890469721
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 04:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=MNo1vsZO;
 spf=pass (domain: arm.com, ip: 40.107.7.57, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhfZxixSVGJd2f3atY7DhFFR3yWuGTP/kylp0m8uItA=;
 b=MNo1vsZOlH0sltl0//12N8oFwb+5iqnksWq+iPPE2k74BIYStM68hmmjOL4IHrgwjyFC7AIhfcWl6pZh2CJd2+yckFi4lEYI52/gI8T+JhL2BCGyVGOY16vq47HAjBsEUNMhyIEGB9RGKVgGb7T9QQGjxXyA4/7b+hS2nKAh2eY=
Received: from AS8PR04CA0005.eurprd04.prod.outlook.com (2603:10a6:20b:310::10)
 by PAXPR08MB6430.eurprd08.prod.outlook.com (2603:10a6:102:156::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 11:46:14 +0000
Received: from AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::36) by AS8PR04CA0005.outlook.office365.com
 (2603:10a6:20b:310::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30 via Frontend
 Transport; Mon, 10 Jul 2023 11:46:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT052.mail.protection.outlook.com (100.127.140.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.19 via Frontend Transport; Mon, 10 Jul 2023 11:46:12 +0000
Received: ("Tessian outbound f9124736ff4f:v145"); Mon, 10 Jul 2023 11:46:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: de900857faa8c071
X-CR-MTA-TID: 64aa7808
Received: from 784c60ab88d2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1962F72F-28A4-48A0-864B-AD1DB4F297CA.1;
	Mon, 10 Jul 2023 11:46:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 784c60ab88d2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 10 Jul 2023 11:46:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OR4prURcxP2JuokiFTBfDq2qw4hj/1ZFj44t6UYZ2O863ktL0zsPEqD09+lQdIVsVlgTN4O25eWq2cl3IU2AGFoS/dSXxVUJ+R3NQMcyEjlAI9JTC3xN5SfzgkESuj4PeXs8HN7HuRwWHn92PhtBE5IpudFjNNH/9VDkE1eOXBqdbD4idnDZ588YXWTXrxpl57sx/F237w4b2jEKhyE8Vn+PHpGDpzb6bGXLyjDvY2EbKtZsBXh1c7iE1eubWL0UKoFhUDMHv5NH1WuSTus6MhuWXVbNrcBFLJbODZkqiSRXvTS3ZvBuI83Z+OxeIhHW2HaVkPjR3sUK5o38na+8aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhfZxixSVGJd2f3atY7DhFFR3yWuGTP/kylp0m8uItA=;
 b=IKcp/pK5VXnOZlZlSMAGLfrkrDDsZSxec+cBPpDqXi18gSiGrG0SNTIcioiiEZJ+r50n9KXRPd2+O1FWylOnO3rm/VjghxoJA2kap9KuYL3oa7mTgiz4lAAcOqGe2IyG+BeZPVJYPBKr12feYCVbclaiv/Cd/45EsSWjmI4LYAM9YZkrZsnRQxLoWICpmCta39qlxWqCh9s1fdE6J7zqhlZRcuwpERxA8aZxHV62d30BFm1Bjafr1Qgw8mNiMIiPFiT65j+dzIJ0Pmpiwo3ynSfbeFsNv/20a5oVFXZzQ8f7bviZDB1bV3FwOMVUI3awnJaJUN4YkJP9kaCMQ+mmMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhfZxixSVGJd2f3atY7DhFFR3yWuGTP/kylp0m8uItA=;
 b=MNo1vsZOlH0sltl0//12N8oFwb+5iqnksWq+iPPE2k74BIYStM68hmmjOL4IHrgwjyFC7AIhfcWl6pZh2CJd2+yckFi4lEYI52/gI8T+JhL2BCGyVGOY16vq47HAjBsEUNMhyIEGB9RGKVgGb7T9QQGjxXyA4/7b+hS2nKAh2eY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7503.eurprd08.prod.outlook.com (2603:10a6:20b:4e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 11:46:04 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 11:46:04 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "p.lobacz@welotec.com" <p.lobacz@welotec.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][PATCH 3/3] package.bbclass: add support for ACLs and
 xattr
Thread-Topic: [OE-Core][PATCH 3/3] package.bbclass: add support for ACLs and
 xattr
Thread-Index: AQHZsxVKc98zBim+fk2M/sfxC/Ytxa+y4f6A
Date: Mon, 10 Jul 2023 11:46:04 +0000
Message-ID: <2442D390-FAE0-45EE-8095-F5F5367121B4@arm.com>
References: <20230710095800.2033309-1-p.lobacz@welotec.com>
 <20230710095800.2033309-3-p.lobacz@welotec.com>
In-Reply-To: <20230710095800.2033309-3-p.lobacz@welotec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB7503:EE_|AM7EUR03FT052:EE_|PAXPR08MB6430:EE_
X-MS-Office365-Filtering-Correlation-Id: bcda25b8-2408-46e0-0e02-08db813b42d4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 2IAVt9vl1WQO/qczSe/raEkZ1eWDNxrO8b6OSuQk7gdBvNGOnleoXn5CpPEtT0GUqDPucuBdr3veRfmZ2eo8X5/dyvJ5NunzPxd6K42122e5MBNIKJEqHfdYOgTD0MtapLnxcRNvTipuL7BTI6iTX/jKeXTweFXO8wOM5J+TZkS3XLQi9c3td37y3CWg6nEJvIMAs526YkApsOXe9zDqHQSuZ0sDETRVixCB5ZXEEMQ9ye70h7/1ZN9/o/D7I31njhgoFxrOMA7zAPRF3ClmZzSR1A6w6KSwwhEdTaFScfnWWv/aHU7OxGVRnWH5go+Qe8F7EWLqLCU8rIFFmZauG5eFK5Vds+dZfS+kZt13SkUXHxuuSATWI4Z6Zx1ZsSyBxoYTa8GnXqT3vwjBo1uXayZtysc3XJl5sY5Z+cYwPhr7jXadn/a82smuopvirZ05deH8mvF4ciYTIzmwg9AtCINRQatH+svLZhI3vtHOy/OAsp2bjeljqIoU+sBt01TuIGIJ0pA4SC/RlJm8SAEux/IseqK+1DrHD/w3bL1yAVJvfy1AsyC3v5J8BIewMB+9MoHYn9+jZJqljOFF71e/45i+fYZ2uR/ULHfMcMbtyR9oqgtuwlO2J7VkkKoxHfYdujSrUgwf+iripwgsq1sOKw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(451199021)(6486002)(478600001)(76116006)(91956017)(71200400001)(6506007)(26005)(53546011)(186003)(6512007)(66946007)(4744005)(2906002)(66476007)(41300700001)(6916009)(4326008)(66446008)(316002)(5660300002)(66556008)(8936002)(8676002)(64756008)(38100700002)(122000001)(2616005)(86362001)(33656002)(36756003)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A21BEEA6CD021D44845B03C08F48748B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7503
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3bfae87e-2c15-4919-f20c-08db813b3dbc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ANKP+Z6+fTw/LmV3K1QxCx3/+e/FwHr/GK75KotWYFLrqdOdGw6jSfcSWPf7ZE8c5ydYQ88SyO826liEU7ehpX2kBYy2VDsSgwdc+E9O+nSbMaf1EzTnNk8rIxhi/n6h6Asct4Cw0a9qGOR5LabvRFHRverRiSMUgjX6axr5bRKrO0x8vdTCgh4hek0IgLRtz2aS0hQjgsJwUB7i4ClEZA0S00HtokJVGj3BLu9tQdMWjCLAofEdFFQKipaYwyRVkXtjjYCpPLvIAgS0U6nHetlvphWRr3/CTK27+drTP/1fueSBiXKIabE0I5TXsp7lcqhP+m2ZezP9qDeLgLTNq/qc/SBJnf+g6ID4Uib6FKrF7CFAmzLiXMVf54qLLwl4B38OrqflQZGRc+KiCt1dNFuav2b6K1CaH+jtkSXSFn3aKAl38dIbeDrJMDr68MQglQ750XZ9fJCZkA9HZEyn7mO93WZKxmqoRaBhOH/EV1B3FdIkKiizlAkFW47yffDzaTDfLW/PzieBWMqX6mubas5yMG4cCPm8gvlOWclPxG0JztrsFgp6FGs5bR7tfz/43bUcZWax4XasudEicHjCWKcHleuloO6VV2iZYwJPj5iBkJvOK3eYALwY9J+unSclZv08Hf7a9i/hB6gInxY0lvVx6Z39fT68cyTDk8OeXGgmxnFBKGjAQtnr9cHZf4c8XNbcviysgw9Ir4YheKkJHKhIlp/jYDz8p4JJqFAC5c5fQw97fb5evExBLNXGq7uk
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199021)(46966006)(40470700004)(36840700001)(86362001)(82310400005)(82740400003)(356005)(40460700003)(40480700001)(36756003)(33656002)(6486002)(70206006)(70586007)(81166007)(36860700001)(53546011)(26005)(6506007)(186003)(6512007)(2616005)(5660300002)(2906002)(316002)(478600001)(8936002)(6862004)(8676002)(47076005)(336012)(4326008)(4744005)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 11:46:12.6679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcda25b8-2408-46e0-0e02-08db813b42d4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6430
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 11:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184074

T24gMTAgSnVsIDIwMjMsIGF0IDEwOjU4LCBQaW90ciDFgW9iYWN6IHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxwLmxvYmFjej13ZWxvdGVjLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gKyAgICAjIFByZXNlcnZlIHNwYXJzZSBmaWxlcywgaGFyZCBsaW5rcywgQUNMcyBh
bmQgZXh0ZW5kZWQgYXR0cmlidXRlcw0KPiArICAgIGFjbCA9ICcnDQo+ICsgICAgeGF0dHIgPSAn
Jw0KPiArICAgICMgVE9ETzogZm9yIHRoZSBtb21lbnQgb25seSBpcGsgcGFja2FnZXMgYXJlIHN1
cHBvcnRpbmcgQUNMcyBhbmQgZXh0ZW5kZWQgYXR0cmlidXRlcw0KPiArICAgIGlmIGJiLnV0aWxz
LmNvbnRhaW5zKCdQQUNLQUdFX0NMQVNTRVMnLCAncGFja2FnZV9pcGsnLCBUcnVlLCBGYWxzZSwg
ZCk6DQo+ICsgICAgICAgIGFjbCA9IGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMn
LCAnYWNsJywgJy0tYWNscycsICcnLCBkKQ0KPiArICAgICAgICB4YXR0ciA9IGJiLnV0aWxzLmNv
bnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAneGF0dHInLCAnLS14YXR0cnMnLCAnJywgZCkNCj4g
KyAgICBjbWQgPSBmJ3RhciB7YWNsfSB7eGF0dHJ9IC0tbnVtZXJpYy1vd25lciAtLWV4Y2x1ZGU9
Li9zeXNyb290LW9ubHkgLWNmIC0gLUMge2Rlc3R9IC1wIC1TIC4gfCB0YXIge2FjbH0ge3hhdHRy
fSAteGYgLSAtQyB7ZHZhcn0nDQoNCklzIHRoZXJlIG11Y2ggb2YgYSBoaXQgaWYgd2UgYWx3YXlz
IHRlbGwgdGFyIHRvIGFsd2F5cyBwcmVzZXJ2ZSB0aGUgYWNsL3hhdHRyIGluZm9ybWF0aW9uLCBp
bnN0ZWFkIG9mIGNoYW5naW5nIGJlaGF2aW91ciBiYXNlZCBvbiB3aGV0aGVyIGlwa2cgaXMgZW5h
YmxlZD8gIEkgZG9u4oCZdCBsaWtlIGhvdyBlbmFibGluZyBpcGtncyBjaGFuZ2VzIHRoZSB0YXIg
Y29tbWFuZCB0aGF0IGlzIGFsc28gdXNlZCB0byBidWlsZCB0aGUgcnBtcy4NCg0KUm9zcw0KDQo=

