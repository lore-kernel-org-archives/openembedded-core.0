Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BCDCC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 18:05:54 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.59])
 by mx.groups.io with SMTP id smtpd.web10.43700.1702490752679865579
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 10:05:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6/jppiuU;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6/jppiuU;
 spf=pass (domain: arm.com, ip: 40.107.104.59, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PfjzYZp5H8p8+ym26qBTBD5KEgjCSwFfTCWTM6ifjgQpu912YwFUNAlOA66yxy2bHbF5JVZs+iJVc3IyRSS17QvyEsS2anztAJCJJQCRa+8b1y9Kr0AhIFp7RTMRkazxoGC/VvjqWF1fnbpsenZpkT50GHfDn32z6vRmmRYWFw41qtdZDNibcimZyUX3wm33KFrVnxai47WklOr+Qd92UDoDO5VrL/XzI5ca9W61grd2RBna31jPF434n1FheL2lPI98baWeVSI01d2Q7cZMCoUNbqvzJRIpfw5BfRT7BXBqR2GyoklLUtYe6Mz1Gqqab5mQvNdg9tRyv8UIV7s6Ww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqHDA1CUE4KMxJHE5XQWMCuTlJXJ2Dn+UYZPwNh37hE=;
 b=dgKHIA5XVS56PAOfXKD7r8P9cpUGlWixo2kBY7uVGrlF/LjUdv4ASblCwqQcG5ywARK6IpX7lIE0mSq4MLtaYGuYmIKBSzTiXOGvaEr0jcPMvWeaMMb45aZUMjdE+U9FgAV7QUm7AlUmaz6tmcooTVcaXOuz2kPjZZ/wAKUSkxsbOF2xBh3OasVXw9W6iBWM+3IeTX3viP8VuvWagj9ngNU8o//hv5ns9FZ5Sk1PNDtNnulDBD1nEdoyJsTL/HmnRDTsFtI6QM5IxyOJfDY5xVKnw0Igxt06msIuAZCSip/Tmp1arW/Jz4UPBzZ0e/tKvqu3Rbbtbwykrn3joiCqRQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqHDA1CUE4KMxJHE5XQWMCuTlJXJ2Dn+UYZPwNh37hE=;
 b=6/jppiuUvs/GXHeKBANlKEG+lzvIAXSjmcGS4laWujCAW1R6F/01+IZ2ePYcEOac++BxzChImmvNadCvrtLOgim/MLbDsa+xGvDkXskj6nHwakf4PwvGUuWaMshKAwqTkWKzcocCYlPP4PhYrB1gpKSPnMZ6ASofyUPmN1zydJA=
Received: from DUZPR01CA0269.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::18) by PA6PR08MB10816.eurprd08.prod.outlook.com
 (2603:10a6:102:3d9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 18:05:49 +0000
Received: from DB1PEPF00039234.eurprd03.prod.outlook.com
 (2603:10a6:10:4b9:cafe::dc) by DUZPR01CA0269.outlook.office365.com
 (2603:10a6:10:4b9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26 via Frontend
 Transport; Wed, 13 Dec 2023 18:05:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039234.mail.protection.outlook.com (10.167.8.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.26 via Frontend Transport; Wed, 13 Dec 2023 18:05:48 +0000
Received: ("Tessian outbound 385ad2f98d71:v228"); Wed, 13 Dec 2023 18:05:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f88a189a7f4e6970
X-CR-MTA-TID: 64aa7808
Received: from d47b0e5686f1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8AD0EE0D-2CD2-4CAB-B1B9-BA330BCCCF0E.1;
	Wed, 13 Dec 2023 18:05:41 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d47b0e5686f1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 13 Dec 2023 18:05:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Px8X4QJE5JqG5b+C9+ODCOOgbHmnouEVzMVNuyUm963pZkZT3YCHzSYHOmu1b1ntsThT4FwL42qQNhrgWxF0LTCuc+tB5HzuQKy0DvM/PYkaCn6oKN+tyM6t/OOJAU3M+UTnaUyuvc98xkoOFkCXesgF0sfRVM5JALE6UuSMJOzAH67K2/hL9MBF5akwNRtovqKdZDhK5Hfg1II8OTx8M0QhhRgOcsywNQE2z9kZdddTIIcl4nxmjJ6tRG6eGD+tNh2U4dKspupcAVg+h1nh7l08w13fyYDF6H9JhYo72RmnFCKwdD1YuUxuMRxtdJzO6agrSYw/mW9lYdlWnRrVVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqHDA1CUE4KMxJHE5XQWMCuTlJXJ2Dn+UYZPwNh37hE=;
 b=ndPBpIr8/13VIJVSaKsULSXGHJ8QH323N+WOAVJgAvBj6U/S0wA6+R6BDrTpcR714MqCm1UqdK0mmu+vggSFV/ZfkBFudZf6itMOFLab4Lmbyh4D9S2RV+z8H1HbwcesYAz6BtuMKHXvotP5OiCmuhGxS2/gBWG/18LiUhA2UOU2F+rPYEPqdXblXQI+FFtVCbASHFIXpVatR1e1Mqh7hKKVYSFlhZd/MlhXR2l/pq/+2tvoTryp55WdhGy/rydYzTpYgSlcVrQWoHVdUh+P1Wciit1YuwofdIyvUqW0FNrw1158POJqpboi030Q0plklJ5ZHvYdjKoM3aTMOVFV8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqHDA1CUE4KMxJHE5XQWMCuTlJXJ2Dn+UYZPwNh37hE=;
 b=6/jppiuUvs/GXHeKBANlKEG+lzvIAXSjmcGS4laWujCAW1R6F/01+IZ2ePYcEOac++BxzChImmvNadCvrtLOgim/MLbDsa+xGvDkXskj6nHwakf4PwvGUuWaMshKAwqTkWKzcocCYlPP4PhYrB1gpKSPnMZ6ASofyUPmN1zydJA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9875.eurprd08.prod.outlook.com (2603:10a6:10:423::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 18:05:39 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 18:05:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mingli.yu@eng.windriver.com" <mingli.yu@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-license-expression: Fix the ptest
 failure
Thread-Topic: [OE-core] [PATCH] python3-license-expression: Fix the ptest
 failure
Thread-Index: AQHaLa4y2v7+TiguxUqi87QhYciAI7CngosA
Date: Wed, 13 Dec 2023 18:05:39 +0000
Message-ID: <90BE5780-D76F-45AA-9F61-E636420D62D9@arm.com>
References: <20231213102129.618430-1-mingli.yu@windriver.com>
In-Reply-To: <20231213102129.618430-1-mingli.yu@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9875:EE_|DB1PEPF00039234:EE_|PA6PR08MB10816:EE_
X-MS-Office365-Filtering-Correlation-Id: eab62082-347c-40c1-f6cd-08dbfc0622c5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 wJV1IXJerMoZ2PgCDvUzeyn+hzuo7h9RSaqD1M7ptUPtBKbTORDl9OSTeGz6hLgNac9fCPqCdDkbPXroc1DZpP7EG6AlrSrOPnqY+qZTT3rWMY5jbmeXJ15TD3h2xGrmhdpisipwrFSxNaVsQ8Tvct/GDRzYG2CW2yjXPsaomkCucCh/nFzqTq+oZUrem1IL1mhX8XYHcLhTxz00g7PXopdn9QllikgiwIuWWMDjJ8BigHqNQjGo/vtfDrRdd0AhdeRkHFK1nE8fP8q5CL0TLGT0MfQAHrhojwLwN+FiSM9r6YoCibkcLG9oh21uE14akDMKOLQz3Y662FhfBz7h0X1rAZ1M6GGLnJmnR0SooY6BS0fRS/SstoTu3W8iBiYV4fOAfyQpZLwI1N9eWouX9HkEG5E6HHDokZJb5mg8tPgwlJ9ekX9D4RVEqJNKzsQNKEU1nBgjuV6RoFM+HgosXcEcc90lHyeVBJN3vaLmMtXmNzwyHssQTdvmzPBM7aFsj3PawU67+eN86EKbqqlIOGjsFz4CGgluifi0DUWHmQ1O5j1reY9ubbxAO9piiEg5PUeFRLDNKMl17UrArkQBrQHf3e7dHv5kf5gVZmBX06MxwAq95aZChWLktRoh2L0HicLo1sesKcoyBewZLyM9RA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(376002)(39860400002)(346002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(38070700009)(91956017)(76116006)(66946007)(66446008)(64756008)(6916009)(66476007)(66556008)(36756003)(33656002)(86362001)(122000001)(38100700002)(4326008)(26005)(6512007)(2616005)(53546011)(6506007)(6486002)(2906002)(4744005)(316002)(478600001)(71200400001)(5660300002)(8936002)(8676002)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1E8C7E0E3160D4BB7E85ED5193CFE6F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9875
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00039234.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	aded2e5b-0510-4e36-f9ef-08dbfc061d46
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ID/dN1zKp030fuklEH+SEKJ+ld7CM8+poNSXeparQejOHmFFZDTLIfT7VlM2jZHi6jQ2cKmqGWnem+l5wR6kEsGo8HctK63U0yh8X+Zy8/tGq8oivfKYaHcJouiIgHB1dTzYzy6PRerPvoPBHE2rzvsmGvp1AXz1huib3d9dhf6w/Y+6U3LXa2sVDtW/Sw6+E7Dwxm0cTFmWek5J0NzV3i1BK54FbhtiC7BCONucOVB1DFg1cWkz/4NI2LwjERPButkDgaC8Q+6h1L8IEYPm3GdwsDMbTkDUMeqL0o7TuqUtKGSfR1IIGbDspFwGCjdIjV1cP6wqVh6TvRJTJ2mpWdzVVxfAN8fZiSmx+T8CAc8Y3uhiWTA+oiJQ9utgOkMZZwXXzMGsrxv3dP3+f26OSbAa9A5SOSN9y+3ZulguSxgcsxArcjwy+FecbIFptfN8OiogIrKjLjSggKg9WBUWLqadErKtPApJ8Vs5NppiVg5uvr9G1L3/WeZBZxyGe6nx/vUKPXYW1m1uWk/iBlxDZkJPiMo5zYwDG+otkXvNfV0YzlSlzLEDtl8sbPHOIp6UQcaRZBAMBbj/Usju4UnjBlema8vXQdJmQjdfOnRWROosFodD36mPblQgsbVXuji4K9u5NgZwMXQTBVtW8p/SiLw/BxG/4DXckzxJm5wh2zMNtqkJjFI+rEeTxRe2dwwBJcg6Uiw46qhW5SUNiqYoWjZ/FIQwdW4IvnpwyMjbHPG1Pr2Ld+yPHhXB3un+/HuV
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(82310400011)(451199024)(1800799012)(186009)(64100799003)(46966006)(36840700001)(40470700004)(36756003)(41300700001)(33656002)(4744005)(2906002)(5660300002)(47076005)(82740400003)(356005)(6506007)(26005)(6512007)(2616005)(53546011)(40480700001)(6486002)(478600001)(336012)(40460700003)(6862004)(8936002)(8676002)(4326008)(86362001)(36860700001)(70586007)(70206006)(316002)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 18:05:48.6303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eab62082-347c-40c1-f6cd-08dbfc0622c5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039234.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10816
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 18:05:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192309

T24gMTMgRGVjIDIwMjMsIGF0IDEwOjIxLCBZdSwgTWluZ2xpIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxtaW5nbGkueXU9ZW5nLndpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IC1weXRlc3QNCj4gK3B5dGVzdCAtbyBsb2dfY2xpPXRydWUgLW8gbG9nX2Ns
aV9sZXZlbD1JTkZPIHwgc2VkIC1lICdzL1xbLi4uJVxdLy9nJ3wgc2VkIC1lICdzL1BBU1NFRC9Q
QVNTL2cnfCBzZWQgLWUgJ3MvRkFJTEVEL0ZBSUwvZyd8c2VkIC1lICdzL1NLSVBFRC9TS0lQL2cn
fCBhd2sgJ3tpZiAoJE5GPT0iUEFTUyIgfHwgJE5GPT0iRkFJTCIgfHwgJE5GPT0iU0tJUCIgfHwg
JE5GPT0iWEZBSUwiIHx8ICRORj09IlhQQVNTIil7cHJpbnRmICIlczogJXNcbiIsICRORiwgJDB9
ZWxzZXtwcmludH19J3wgYXdrICd7aWYgKCRORj09IlBBU1MiIHx8ICRORj09IkZBSUwiIHx8ICRO
Rj09IlNLSVAiIHx8ICRORj09IlhGQUlMIiB8fCAkTkY9PSJYUEFTUyIpIHskTkY9IiI7cHJpbnQg
JDB9ZWxzZXtwcmludH194oCZDQoNCnB5dGhvbjMtdW5pdHRlc3QtYXV0b21ha2Utb3V0cHV0IGhh
cyBhIGhlbHBlciBjbGFzcyB0byBkbyB0aGlzIGZvciB5b3UsIHNvIHlvdSBqdXN0IG5lZWQgdG8g
InB5dGVzdCDigJRhdXRvbWFrZeKAnS4NCg0KUm9zcw==

