Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B698C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 15:44:12 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.69])
 by mx.groups.io with SMTP id smtpd.web12.33085.1661269447523479808
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 08:44:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=W9KXUa57;
 spf=pass (domain: arm.com, ip: 40.107.21.69, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GeEKDbIC4yk5a2e3rPw34ERNAQRHyhFSzIRcHHYByvDjNhKNypqF7IVvSaO54o/PtpnJp0beqNBqjVFZPRu4Q1EoMH/UjzmYEwDTL8tUndr6ng8xOvjSNWMXenDD9HITqCWVbMvAWU82C2EaLa4X7xh5ntRvfisuQrAm4jOr6aMWijN+MQoIZsE1g7JomPEk0S4viQ1KY5/XJ5yDYsqbdTTlAh74qbESYj5rXdqsD+7X7oS446Vb3gbia/f8PryqROKshn710VgumK3BailhcT+yIEgP7/uc2L5ZmOIASLFNjzuC6K7RwC4KThQ+n6nM4lcKmxr/NZoZJS2tVhedYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfX58ioO6M+jw3/Snc30m/JXHo+piBj7zvyZvZ05sos=;
 b=gIYdqCgtiTcqAviap/RvXl4RgirvExijVfr+IZzvpg5qucwwq8V4W9ULxwCza0Kfw2drJ+g2ajjdHrUpwJpSE+kSczLturkPaUuruTR8rD9P6RS06u9JV9B7P7pNSKEsr7J5B5jhYMKkU/eG0u4hMx/xx6WIjetq8B0LNomT1d3V+lUqqQ1724MOx9r/2U3R9mqOenwgbg/rbFasb+yJ80nRbuDFZN5wikbnA6cOqDrwtsZ1w+hQ0WyaQVH/NUjQxvbRVhAJ9567qaj4m4dbMtg6BbzdmTJ3koFK7gNKbLUjWmR3xRqvmQ+S7qQAk2nFFpuxmtY8gDd6cl9QWJygLg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfX58ioO6M+jw3/Snc30m/JXHo+piBj7zvyZvZ05sos=;
 b=W9KXUa57DAOfTomRACSdWddTu+ACVhSR7EQY7WmBZxY4WFkpCy7r1oN5CkzpBnis9mQGLEYBHuuoq/8oRebOaAA8QYBt4tEteanVUNQWCf1K48JwKi52UZ4TRXFF62PwcYw6j2ZI2Z1GZWwiSSkW1ngwEgVgGZEK4g8vQ2Y+QTA=
Received: from AS9PR06CA0751.eurprd06.prod.outlook.com (2603:10a6:20b:484::6)
 by DU0PR08MB9107.eurprd08.prod.outlook.com (2603:10a6:10:474::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 15:44:02 +0000
Received: from VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:484:cafe::e3) by AS9PR06CA0751.outlook.office365.com
 (2603:10a6:20b:484::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21 via Frontend
 Transport; Tue, 23 Aug 2022 15:44:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT013.mail.protection.outlook.com (10.152.19.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Tue, 23 Aug 2022 15:44:01 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Tue, 23 Aug 2022 15:44:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f35328b0d0fab98d
X-CR-MTA-TID: 64aa7808
Received: from d88f47a95a44.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8B453A1E-AE9A-4013-8F2E-844EE71EDB2C.1;
	Tue, 23 Aug 2022 15:43:49 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 d88f47a95a44.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 23 Aug 2022 15:43:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFZHoQW9/pFN60bo+4ajfvrpYd1p+EWITAcL1vjsjdN+fh7Tj/M06D9V2Q8MPyowuKjtScDauqIekGkfMyzq1mOXEoKquS1pUAuIvdIznnJk7UJoDagAmrbp1UFj7U+3k1Il72QFOaLzxNWYAmMAZd1N9PVoawiCzfbUMY/uVUgdO7TNq+nLnJpdzP5ZU+cpeaHkX3//FQHBhjLIZT1Iah5r0zT2yDgqJB1TMXKwHCkGlLxHJ4IicJs3adQYcvkHYDY/+wWPCVEHzy7nltrMdg56Hj+mgSsv67l+biO55Jd8BHok6p6IJ2ACM+YMiO10VNgdX/djoXaTajEvNIVFdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfX58ioO6M+jw3/Snc30m/JXHo+piBj7zvyZvZ05sos=;
 b=IQsm1/CD/oG+GDc0nOvrRZVsBu9F6ociZ7BzHyM3ZEt0ROYc37NMzndJQ4JRzPbvblV4M6W/T2Z/PmltBy5VLthYvOnTqFScrrvG28boCE4oYNh5xfo9Vd5swIDdHx7GqbC8z39jsOTS9lNLOCaQGcVLC7gfaCGc6qy040tImIWcUGZ47HPYjIYhiIBEfVCjWjZS70udCHyUyyEALUZF3q0yPMMXz+bWHxgxBdVM01e8PdWw+Yg7Vm/fItoU8pV8eef3R022gm/PzhaYmE725NRb/JwLwgpg9iLID12OcnpzCFnmvajCRq9z2K32F1UUJBRHyDtkfSKJn+05IUpU4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfX58ioO6M+jw3/Snc30m/JXHo+piBj7zvyZvZ05sos=;
 b=W9KXUa57DAOfTomRACSdWddTu+ACVhSR7EQY7WmBZxY4WFkpCy7r1oN5CkzpBnis9mQGLEYBHuuoq/8oRebOaAA8QYBt4tEteanVUNQWCf1K48JwKi52UZ4TRXFF62PwcYw6j2ZI2Z1GZWwiSSkW1ngwEgVgGZEK4g8vQ2Y+QTA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB7PR08MB3241.eurprd08.prod.outlook.com (2603:10a6:5:1f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Tue, 23 Aug
 2022 15:43:46 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6cbd:62ea:4be4:aa4c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6cbd:62ea:4be4:aa4c%7]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 15:43:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/2] xmlto: Update to use upstream tip of
 trunk
Thread-Topic: [OE-core] [PATCH v2 1/2] xmlto: Update to use upstream tip of
 trunk
Thread-Index: AQHYslXmXEkqjFgRPEmnrlQ/pZGxua28l+kAgAARrIA=
Date: Tue, 23 Aug 2022 15:43:46 +0000
Message-ID: <4BE9FEDB-32A4-4C26-81D4-F9B1C75637BD@arm.com>
References: <20220817162437.1150136-1-raj.khem@gmail.com>
 <989952DA-A18E-4DC5-BAE3-4004E7471D9B@arm.com>
In-Reply-To: <989952DA-A18E-4DC5-BAE3-4004E7471D9B@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0e0f7659-fe96-4012-5a50-08da851e4cf5
x-ms-traffictypediagnostic: 
	DB7PR08MB3241:EE_|VE1EUR03FT013:EE_|DU0PR08MB9107:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 G+lSBGUPILLoHShhFhuyepkX2P3VU7LwhEuXYTv6kWrEh5Cu+wYRu31s19Jj05ibPICFqrDh1X3DWiM4nw2+FArxpb8RggUZk5wVgu/XW93HUGGqal0UiJ0oe1qy6/MnmvLoZujLKle6dY/JmWAh922TgcTVPyPJwa+ZUFI7NMvxskNuoaSKAumb4PDZbKBjvjQBg05XjFY8Q3bH1uLrUmiZoMbFzB1SCRn9ShZ2p0qESnZbHVsNLwgRM79Nq10fe0gfFs2xROzFfAQhKX5Pij1sBBMr7YQmRGwj0ownoz00tyPVg+XOtrhOA4KJ2HOZOx+PdUjGmputWlY0nM4q4DN27fL25TOK/Fz0n90974Lw63hHD+G8xwk80ZsUm3R3p2InBKu3UDms836UwjwsPrqcQim4pENNvuzupnBuAWc+/JHqsFe92H4IAJUAa0ejQ/X8E5146r6Xn+WSKvIwyFbpXVsXaNFUv1VljOJC5bmvTHaCi34CW5N1cFqKHI8tJmV5tp6nsCRruNyscGoSNjrNR/3apBLWD4bMqOFeGwn83v7e+drRXIBMPNgq9ZKHp/XGwgjepibgAyFZvA9pmtDGEIlKoJPDY3F//ZT4k151CBHMjf/Xbz5tYwLOq4xqryyfkG/kp0P1kgYuT6KcbT749cgqWfWmAFwDqOGcc4SZ0G3TaNCGQkd8ZK4lV4EF4gcpAvM8+pD3SBaGUdmo6/L/pRzchdgYUMjHlrjJ5fQTCnOQZd9Va3+gMSGLNf38X29ozDz5t7+eQBiB036P9rqKyECdKxkw8MOFQYdV45k=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(6506007)(6200100001)(37006003)(54906003)(5660300002)(86362001)(8676002)(64756008)(6486002)(66556008)(4326008)(66446008)(478600001)(4744005)(36756003)(26005)(6512007)(8936002)(186003)(53546011)(2616005)(41300700001)(38070700005)(33656002)(6862004)(91956017)(66946007)(76116006)(71200400001)(38100700002)(316002)(122000001)(2906002)(66476007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F371CD891C20664C810FA4826D5F3E1B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3241
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	eee557dd-6178-4297-f896-08da851e4423
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Nd4huW8QUSP2BP2hK19xk1+yhXTfCpi8LfEgckuqlqmQ0xJZp/uyXKdOZtLs9fPoj3zPtvo8t2dXMOylzRa6WMtqFM+HHpWe6DQkOKq3dJR2gZe1vmCHC4RayOv8Uj56npEqMrmofRAVlXku8LZegmGB3psWZtWxPSEQ6uC4H9AI9NlEx3junVIef2gozAcP5yRaxbh9nZIWXdfRsvTOLfV/ST+dsOaCSeYOomX+PDxSX2rtJvv+1mSw37wZxDH6N8q5DeT2uOv+UOtyWVCOAworvfUz53yi/BlFox2UQ5/P08FvymmzDjuWpHmUHT89qEmENi5nSNH6ip4GD/DsVwHi/eqDr8E3OYZYvl8m//LBHG3XNmHxISs/bPZdu8wffsUHaRezSbrrZx238hWD90Q6PsmqqNJOtvLM+H3vp4f5oixT6gg2O2wc2arVPag9RQjg8I8voOw6zRFVnSujLPxEvTdMSOlyYu6iOtG9tJo2ufgpvvjURybUylY07BVHRyzgNy3RL9E8ed+doqeTlScc/BLz7paU3tAQ1+CoZiGL7OQXfJROXMrC+Y4nhcHlOYOQffzudTxuYjNao7X1qPy3dTQWR3MDl99XmG5HYdleWEAIEqaoqz4POuHIHkRPPQfawR65uXe965qKOeV7iKfDVrOTRwn/7n4fTHzsYIm1QhZ7wN952Tx7Osx0440BHXEJj7NCzOfMp7F2q13O3uMylSN8VAIBI7FAiVTH+PeZGe4TZ7XFqEqzKX7OQnUFM5u50h/QHOCJbn5axPD5ew==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(396003)(136003)(40470700004)(46966006)(36840700001)(47076005)(6200100001)(53546011)(6506007)(26005)(33656002)(6512007)(2616005)(2906002)(336012)(186003)(82740400003)(356005)(81166007)(40460700003)(86362001)(36860700001)(40480700001)(316002)(82310400005)(6486002)(70586007)(4744005)(70206006)(41300700001)(5660300002)(478600001)(54906003)(36756003)(37006003)(8936002)(6862004)(4326008)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 15:44:01.1874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0e0f7659-fe96-4012-5a50-08da851e4cf5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 15:44:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169716

T24gMjMgQXVnIDIwMjIsIGF0IDE1OjQwLCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gDQo+IE9uIDE3IEF1ZyAyMDIyLCBhdCAxNzoyNCwgS2hlbSBSYWogdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPHJhai5raGVtPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4+ICstR0VOX01BTlBBR0UgPSBGT1JNQVRfRElSPSQodG9wX3NyY2RpcikvZm9y
bWF0ICQoQkFTSCkgLi94bWx0byAtbyAkKEBEKSBtYW4gJDwNCj4+ICsrR0VOX01BTlBBR0UgPSBG
T1JNQVRfRElSPSQodG9wX3NyY2RpcikvZm9ybWF0ICQoQkFTSCkgLi94bWx0byAtLXNraXAtdmFs
aWRhdGlvbiAtbyAkKEBEKSBtYW4gJDwNCj4gDQo+IElmIHRoZSByaWdodCBzY2hlbWFzIGFyZSBh
dmFpbGFibGUgbG9jYWxseSB0aGVuIHRoaXMgc2hvdWxkbuKAmXQgYmUgbmVlZGVkLCBzbyB0aGlz
IG1pZ2h0IGp1c3QgbmVlZCBhbm90aGVyIERFUEVORFMuDQoNClRoaXMgaXMganVzdCB4bWxsaW50
IG5vdCBrbm93aW5nIHRoZSByaWdodCBsb2NhdGlvbiBmb3IgdGhlIGNhdGFsb2d1ZXMuDQoNCldp
dGggdGhlIHBhdGNoIEkganVzdCBzZW50IGZvciBsaWJ4bWwyLCB5b3UgY2FuIGRyb3AgdGhpcyBw
YXRjaCBhbmQgYWxzbyB0aGUgY3JlYXRlX3dyYXBwZXIgY2FsbC4NCg0KUm9zcw==

