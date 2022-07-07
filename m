Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9935DC433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 15:58:25 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.75])
 by mx.groups.io with SMTP id smtpd.web08.7263.1657209500032618285
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 08:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=MZmAu3se;
 spf=pass (domain: arm.com, ip: 40.107.6.75, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fHPbGbN2AwwTh/BXlQVzPQlcGolP1GQw4sAgUv2B8ryTezCsYgEuCyIK7t6XB0rtP3vu8fuTdZZxBEGTmSPHJrfdUM2Yy3HngvYE5Q5yxszhx+jSHXiqgK2mEKZ5g1Qd+iuRQHscYa4Ba5fyU0GdWaAJUP4oWUDFFk8XJJSrA4IJvSayus0zIalz0upRde/sTcE/JXiyYfF0mqE7+eepMy032o6purbQxwjJWmYBniuM6ZWty64QtplwDPzgcxrZ18HcSxj29g3CV94BKnC5wiPc01AoVerXAyWjbW4j8pTafl9qoOZln7XfNBBhq2ioy2/6aLJMwWiaOk0xOOz0MQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCWk+PJ4ZuSSokA6Vys6K5qv1WA3fZBlkHBZavbKEUI=;
 b=CCZJ4l51VWYIuygg0PBayEijmd2rSGtqwCxlBT2FixfHI3g/IrGrZVEf4HKSGVQlps1perZDO9CnniBqQ06hN9gye6Q0NWYod/nnGxXLL247yvJc2SzTF6u0mzDFpGiHs+jN+a67lSi+OEQTJ/AbcbT7vUuYv/m6RPNiokDo7tY+tGXMSyDIOvtiMuCrSmAHNVslpcmkgmsVm6xxUKypWHior/5C7sV9Zj60r/TGxuyv3HKbSSt0g7k6ln8LXivnTwrGX+Ji5Uy0G+gMfDmDQM6+5i17FBoS27jVzRF8IssP19VYaDhfTXregSUiz/0A+tOtFrVATKs3JblOpWLSjQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCWk+PJ4ZuSSokA6Vys6K5qv1WA3fZBlkHBZavbKEUI=;
 b=MZmAu3semTgow2R/G3/BNrzWLPoKe0HKRwcKI/bSQFXqkvhP76obG8gzzjGAoW7Lp4y93/Jbvoz9Hhe4huY+E7A4WTFV2BOYlOrFSIDXMgnz26au/EuDjAX9rh5jfWS+pJiSCFaC7DjpNoC17Ih55MjzTSP9MZK8WP0YnkOQuvs=
Received: from FR3P281CA0037.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::21)
 by DB8PR08MB5388.eurprd08.prod.outlook.com (2603:10a6:10:11c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 7 Jul
 2022 15:58:16 +0000
Received: from VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:4a:cafe::32) by FR3P281CA0037.outlook.office365.com
 (2603:10a6:d10:4a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.8 via Frontend
 Transport; Thu, 7 Jul 2022 15:58:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT035.mail.protection.outlook.com (10.152.18.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 15:58:15 +0000
Received: ("Tessian outbound 13cb25bfb745:v122");
 Thu, 07 Jul 2022 15:58:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 79946935342c35ab
X-CR-MTA-TID: 64aa7808
Received: from 7e3e77a2e442.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1C70157C-7AA7-465A-B278-602F7E20B26E.1;
	Thu, 07 Jul 2022 15:58:08 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 7e3e77a2e442.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 07 Jul 2022 15:58:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHkTjaXUZc4+1qbvKaK0pAslpuy6czlmr0nti6eDEpfq0W5swoHRaNKDVZRj3TXlf6yu1+OFglbDWCao3C/n4DQ4LdwIeW/Fni5UazylzQB59iWKS9Mq4dOq9MxYkn0GMoOPSCJZktERmJ4sr6ndKVycTl9eshawTPS5/I1HroyGcpb9vtbnw5togNFb6UQHaDqA7SJht7XwJCsTtpU6EqtNh8RabPKwFYsQ3GhszBaueY3Wc2nlIbJCR1NRj+YG6OL/pSF/0b4XM+sfYzXL1Oi8FG7fLbQrt/PhRCuvbDTYJabbqlmwtILGy4tRQIzrJvvKaQ2nU3YKV4w7k7A59Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCWk+PJ4ZuSSokA6Vys6K5qv1WA3fZBlkHBZavbKEUI=;
 b=n0wqNkI3ZFuC714eff3n13uKvCWIhk3WxM+2fofVeIdSov87OU26hoBhdo+BkwnV2aWhRe/XfX3J/sZy1Kxg6cxEnMjpIJ9bxlo5K4WTy2OvWiIEjCtwcS5cYoL/f4Wb254edcCkcBTD1041LHb3i+diiPmkWhOMHRIyya3eQD0Xmnaeptx/ORXxN8zmrXdAKEzYxMXTiwdSmFRFE9A5JRLvB6t9cbcVvXdHTI+/b5u+sm0aJ4HevyJUEfZ/INZiqwqCuok9gPaA9qID+ku5oveA9whdpunyOUgckVndVkxZXFsXcIAraya9JfneAK6RgPZj3tNCjS2SHLK9ke++Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCWk+PJ4ZuSSokA6Vys6K5qv1WA3fZBlkHBZavbKEUI=;
 b=MZmAu3semTgow2R/G3/BNrzWLPoKe0HKRwcKI/bSQFXqkvhP76obG8gzzjGAoW7Lp4y93/Jbvoz9Hhe4huY+E7A4WTFV2BOYlOrFSIDXMgnz26au/EuDjAX9rh5jfWS+pJiSCFaC7DjpNoC17Ih55MjzTSP9MZK8WP0YnkOQuvs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by HE1PR0801MB1771.eurprd08.prod.outlook.com (2603:10a6:3:88::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 15:58:02 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2c4a:b33:a761:a926]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2c4a:b33:a761:a926%2]) with mapi id 15.20.5395.020; Thu, 7 Jul 2022
 15:58:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, Patches and
 discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] ltp: Remove -mfpmath=sse on x86
Thread-Topic: [OE-core] [PATCH] ltp: Remove -mfpmath=sse on x86
Thread-Index: AQHYkbXzjrhhFM/kKE+SWEbuMcn14q1ylnaAgABtmwmAAA0tAA==
Date: Thu, 7 Jul 2022 15:58:01 +0000
Message-ID: <F03DB6AB-A7CB-4464-859C-9530438A247B@arm.com>
References: <20220707035911.2153302-1-raj.khem@gmail.com>
 <054612390f09ab87115bdf160682495e8e06c4f8.camel@linuxfoundation.org>
 <2723e792-207e-6857-31d7-16738c0e42ad@gmail.com>
 <CAMKF1srZaKOhgNHGwo4JTDdjNWTEO9MPSoxcAYj31AKbRU-2GA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srZaKOhgNHGwo4JTDdjNWTEO9MPSoxcAYj31AKbRU-2GA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5241b40f-a494-41ff-1267-08da603180d0
x-ms-traffictypediagnostic: 
	HE1PR0801MB1771:EE_|VE1EUR03FT035:EE_|DB8PR08MB5388:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 0C2+Ch1svD3fehQQQUA9wklwLJCEyfaQgDV0a6euIW62I/MkRL4JS50Gu5OEdrY3rZzcZd86HTsbCBK/QGuTASb5SZ3BCfo6Y0+myFofaQthJ0aknINFMin/MUIUBbko6j5BnluUjcbsnLULkDfDMHJYKTDdxqd04D1uuV4NCdtv+/gH3JpfedZaW6lOR3QqCPTKZSUo+vlfA9L/UV8refPYzY1qLHY33yUdiqA5eS8cmpYylG1F7ZgSuRnWB3fUEvyR3GtCiL9ahfVOzik1zm9XxjYO2On4YdZHLzEGaKQ9652sFuXjphObF/c6SJ9FsbiXHFlaz2JBbs5ZY1lUE3ngeee8ubUI/bAZEzfXCQ0MQoPMsLgXY9C4zyVv4FFGqAr1QilpG5r/NIC7y/2+dxCWkMuiafjpWehhVa/3bcMTB5o53r2RLhJ6HD8q2WJNeduhgX955u7UzY1RtZXfdG/piHKYqg4oPciKudYgb6pGfe8Xl7iFoKS2WxWieWQCdxpr9QsySiHFRL0sIrnnawKCruYv0c8QJ7be0c/gsrW6Z3dfl7wdTXpLrOZbQ6WhaJBK0XGlntzpNxPQ9E3N5NFVHVlHNcXM6RsMGtfvL9QMiM/qwEfKWHXdPM+OUgNGM2BSzA1NEvpI5466MyQeP/N9u64tYkceX8hbzSf1yXTbqGNjEQ+10GeT46gmD5xzCbap7ya43DtGjSs4SZK+lBboC+FaizFdYPtPvRN98fNfJrUziJwmIT0l2T1wIq61aZm0MMoamzxTtMDhyYxtPaUz1PQmJbVZ0drvOjYPcUlDlJAZuzEIaig6lmyG+nzcSmubcPDSgGi8MoBqR0Ua5Ru5TNzUzLUDMt3aW6CKtXY=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(54906003)(8676002)(33656002)(122000001)(66946007)(66476007)(91956017)(66556008)(64756008)(4326008)(83380400001)(71200400001)(6916009)(66446008)(38070700005)(36756003)(316002)(76116006)(6506007)(2616005)(38100700002)(6486002)(86362001)(478600001)(6512007)(26005)(186003)(8936002)(41300700001)(2906002)(53546011)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D056750CED867446934FFBFC1D440BA8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1771
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	de1b303f-e7db-492a-b840-08da60317825
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YtdLgjrK54kh/nZS1eIT4I4z2DTu8mFUIZvmCrGxHxL6i94eVMzxq50WTnb+BDWnLZJm7KV1NyGzcq6d7pPiPnObTEYECIgIcmbrDU27jjacrLHpkyRkBel5hx7e7WLyvlLPZj29CLtEGMEWk1Qxntvghm7s0qwmULGPXBdQsh8ad+W0YOAN7LXCdixTaNS6z0YHrKqUf4SafxuE55XI8LFtA2T3Zm4xEo2YDPEglc8JBun0Dvp8AHng+CU6ADDXTkvqTspAynzvBVHE2V4O/OJ5cDux0WuO54otfTqAe0OaUe2S/g6g2iEPCSJGQg2biEYEewkqQ/Gg20qZbj/aR8FUfamURp384WyyKD5wd12PIq6ZQ6S5loaKSm2M5SZQx7B/81RH18hq6JlOv6dt52l6LIN/VA+I6x4KkEjuXpMfd7cLYGn+Bgj4IWtlUSS08mt7SPFaUo3LJk8RGoOBvegjDLsuEudJ6mKceLtfYDgh/IC6wAn3tVx5wWLAAsNI4XpE8RDExpeM7zqkmc/aSfe1K0q9EE/RXQyJkoYUFPtDy/zM2dc6rMHhyEuMjkVAh7gm4Z4PxL08jFMcXGpNuxJ0vNdTqeAQNOUI824INRN14C/ZGQx+gWxI5DHCGJkmEW1uf982zn7RopLiNIezbHsxWU6QbbXdHgc65xMQO5p5BkncDjUW8/enycY2+PhRoo7PKrjx6st2X2xCpguykhxDwG5sZGTU2iwKSc68XkEjIqAFcgTNT1pIPs5CpLMSJXbkhTix4NaqIT+v46jbpwRmSGhuObbGVSu4x0m9+crvOb9mdJWwymmAADNVfhUo
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(39860400002)(396003)(136003)(36840700001)(46966006)(40470700004)(316002)(336012)(47076005)(83380400001)(36756003)(8676002)(54906003)(186003)(40460700003)(41300700001)(82740400003)(33656002)(82310400005)(36860700001)(53546011)(6512007)(6862004)(70206006)(81166007)(6506007)(8936002)(2616005)(478600001)(6486002)(70586007)(5660300002)(86362001)(26005)(2906002)(40480700001)(4326008)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 15:58:15.6036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5241b40f-a494-41ff-1267-08da603180d0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5388
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 15:58:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167789

T24gNyBKdWwgMjAyMiwgYXQgMTY6MTAsIEtoZW0gUmFqIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxyYWoua2hlbT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+
ICUgZ2NjIC1tMzIgLW1zc2UzIC1tZnBtYXRoPXNzZSAteGMgL2Rldi9udWxsIC1jIC1tbm8tc3Nl
DQo+IGNjMTogd2FybmluZzogU1NFIGluc3RydWN0aW9uIHNldCBkaXNhYmxlZCwgdXNpbmcgMzg3
IGFyaXRobWV0aWNzDQo+IFtrcmFqQGFwb2xsbyAvdG1wXQ0KPiAlIGNsYW5nIC1tMzIgLW1zc2Uz
IC1tZnBtYXRoPXNzZSAteGMgL2Rldi9udWxsIC1jIC1tbm8tc3NlDQo+IGVycm9yOiB0aGUgJ3Nz
ZScgdW5pdCBpcyBub3Qgc3VwcG9ydGVkIHdpdGggdGhpcyBpbnN0cnVjdGlvbiBzZXQNCg0KU28g
SSBqdXN0IGJ1aWx0IGx0cCBmb3IgcWVtdXg4Ni02NCBvbiBteSBhYXJjaDY0IGhvc3Q6DQoNCnwg
Y2MxOiB3YXJuaW5nOiBTU0UgaW5zdHJ1Y3Rpb24gc2V0IGRpc2FibGVkLCB1c2luZyAzODcgYXJp
dGhtZXRpY3MNCnwgY2MxOiB3YXJuaW5nOiBTU0UgaW5zdHJ1Y3Rpb24gc2V0IGRpc2FibGVkLCB1
c2luZyAzODcgYXJpdGhtZXRpY3MNCnwgQVMgdGVzdGNhc2VzL2tlcm5lbC9rdm0vYm9vdHN0cmFw
X3g4Nl82NC5vDQp8IG1ha2VbNV06IE5vdGhpbmcgdG8gYmUgZG9uZSBmb3IgJ2FsbCcuDQp8IG1h
a2VbNV06IE5vdGhpbmcgdG8gYmUgZG9uZSBmb3IgJ2FsbCcuDQp8IENDIHRlc3RjYXNlcy9rZXJu
ZWwva3ZtL2xpYl94ODYubw0KfCBDQyB0ZXN0Y2FzZXMva2VybmVsL2t2bS9saWJfZ3Vlc3Qubw0K
fCBjYzE6IHdhcm5pbmc6IFNTRSBpbnN0cnVjdGlvbiBzZXQgZGlzYWJsZWQsIHVzaW5nIDM4NyBh
cml0aG1ldGljcw0KfCBsZDogdGFyZ2V0IGVsZjY0LXg4Ni02NCBub3QgZm91bmQNCg0KTG9va3Mg
bGlrZSBpdOKAmXMgYWxzbyB0cnlpbmcgdG8gdXNlIHRoZSBob3N0IGxkPw0KDQpSb3NzDQpJTVBP
UlRBTlQgTk9USUNFOiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1l
bnRzIGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHByaXZpbGVnZWQuIElmIHlvdSBh
cmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBp
bW1lZGlhdGVseSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0byBhbnkgb3RoZXIg
cGVyc29uLCB1c2UgaXQgZm9yIGFueSBwdXJwb3NlLCBvciBzdG9yZSBvciBjb3B5IHRoZSBpbmZv
cm1hdGlvbiBpbiBhbnkgbWVkaXVtLiBUaGFuayB5b3UuDQo=

