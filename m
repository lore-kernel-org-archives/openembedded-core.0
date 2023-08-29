Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E02C83F16
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 09:45:29 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.83])
 by mx.groups.io with SMTP id smtpd.web10.13683.1693302323622506565
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Aug 2023 02:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=GO6mXYT3;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=GO6mXYT3;
 spf=pass (domain: arm.com, ip: 40.107.7.83, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV7SJYCCpCWbHAjKBClQO5LhO1Q/peGN+OzFd8vGrqo=;
 b=GO6mXYT3JP7g/u6KjepC0+9FFkKjm1JyED+pRLo8yxkj/VTZ3fYwWZ9Bvb2h0aC/Jz057fX8wZcgtHx8b8V/ZNznh4ppFja5X3FlAGOJm9jf3UJiegPDi37Wpj2sBjEcRQDiPlZx1gPJ4rncBqTZwWrj62Cqu3XhZZKul496PUw=
Received: from DBBPR09CA0002.eurprd09.prod.outlook.com (2603:10a6:10:c0::14)
 by AS2PR08MB9223.eurprd08.prod.outlook.com (2603:10a6:20b:59d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 09:45:18 +0000
Received: from DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::42) by DBBPR09CA0002.outlook.office365.com
 (2603:10a6:10:c0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35 via Frontend
 Transport; Tue, 29 Aug 2023 09:45:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT027.mail.protection.outlook.com (100.127.142.237) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.17 via Frontend Transport; Tue, 29 Aug 2023 09:45:18 +0000
Received: ("Tessian outbound 5c548696a0e7:v175"); Tue, 29 Aug 2023 09:45:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0c80c083999d3954
X-CR-MTA-TID: 64aa7808
Received: from 148c31420c6f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CAEF4BD3-0119-4D07-BFB3-9C9BCAF8D22B.1;
	Tue, 29 Aug 2023 09:45:12 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 148c31420c6f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 29 Aug 2023 09:45:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUL71wOxT7WLO/3WOOpTrjpvquOxzHBKQv0ob/mQUBN2Oh8zf/4dpAETyJAEf9cvRj4lVpVxccR1YANAQFIDDN29RB1rNRDS72dXnUXLjQuM7TUSEslwky4FaNeTV97vOald0iHlMplNiuUVHkBYa1uPcBsdSwDHamm1fW2ggdj+iq8z4D8QQUFmx79pml25rMjmjeTNvFAPdyl86ehajW66QOfmKA5x/qtfg9KG140Guxmq8l/ut3uKaSED7m+bHJfqk+lIXFqk1DcdCvE2P15JHIle5p6Cyo+7nneC8i+ekprWN62Vb8v7++BpmePAWEc8aLwCGdY5lV914Zo/rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zV7SJYCCpCWbHAjKBClQO5LhO1Q/peGN+OzFd8vGrqo=;
 b=jh41mv5eXpALcRaJC5O4OXjWtsSJl03+nIrb1222n5e2RPpIuKJLKIdQH2xljtarGVzVu7afM4G+Cu36d+T/ayGWTGJtYbtsg4/qyqYGozchG8uVzqaSMnL26OsXCTcO70eCPQMgJCs+VnMC6CRKRpoxUAkOCu3tsRhyYdZk4veStL/K2b3Hw9+1P21UkdCkcUD5TvLd9pr+ctDAHeh5OKdyBNWPP2zxBNfea0G7ENRO4+WeHyU0jI4efi+cY+80jwrqjRuepxNlzzsHYC5CVO2/hwapzQtdlmDjWyx1wjEwph9g2HhxIFErGEP3fV+XPKVRC2qW4/wIQhNcdrlR7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV7SJYCCpCWbHAjKBClQO5LhO1Q/peGN+OzFd8vGrqo=;
 b=GO6mXYT3JP7g/u6KjepC0+9FFkKjm1JyED+pRLo8yxkj/VTZ3fYwWZ9Bvb2h0aC/Jz057fX8wZcgtHx8b8V/ZNznh4ppFja5X3FlAGOJm9jf3UJiegPDi37Wpj2sBjEcRQDiPlZx1gPJ4rncBqTZwWrj62Cqu3XhZZKul496PUw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5708.eurprd08.prod.outlook.com (2603:10a6:102:84::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 09:45:10 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 09:45:10 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Emil Kronborg Andersen <emkan@prevas.dk>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] libx11-compose-data: add CVE_PRODUCT
Thread-Topic: [OE-core] [PATCH 3/3] libx11-compose-data: add CVE_PRODUCT
Thread-Index: AQHZ1pC+o0PoQVk8qkmhOrshDsnwIq/7IRsAgAQxagCAAbtNAA==
Date: Tue, 29 Aug 2023 09:45:10 +0000
Message-ID: <DD619F8E-B1D5-462B-A4E7-008A6F8E181E@arm.com>
References: <20230824134101.41906-1-emkan@prevas.dk>
 <20230824134101.41906-4-emkan@prevas.dk>
 <7263B0AD-E44B-4E8E-A7E5-567E67DEEC10@arm.com>
 <PA4PR10MB4576FA7369BA0C5437C8F9EEFFE0A@PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <PA4PR10MB4576FA7369BA0C5437C8F9EEFFE0A@PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5708:EE_|DBAEUR03FT027:EE_|AS2PR08MB9223:EE_
X-MS-Office365-Filtering-Correlation-Id: a0c4aea8-2683-4789-8a4c-08dba874a7a8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 yCgsSj4T4OfJCCtqcW2Y608xTK8sFXEqmpe5cjxOMiCL8yDEePhu3VhvAi436xcadzrcMMoRZp1C3CVoEEl2NbyPn3+GW7nuzjqsaSNK7VGaR//DteX4GhuKutGya9ke/sH8gc9ezn9SivC6jnv7ztl5Qqzf/XLz++qsjTQXUaVtgGMnbBzSI7iCw25VR/RXZL7RxCp3HPSqYr7wTzmpc6YWb3+gZe5NKk5mzwhTdMTUC5D5gVRktPmiFCEC4HYovFnXvk+gNzN64HOQwZCMZEbrsXmZubtgHwRI8WgzWUKe8yD5i8K/IJbxej4EHZOOuAGrDwoTO9mSaoa2CJpwm/BGLHjG3P0OqXPmRjFjW1ORjNnbVEUefLg2hMk2eHl+4UdGynJqWeemJsAf8Ry6NnTogbXrkW2qyjXClWpnxDTYiPrcw+Q9jK53znPPiLESunySDNhRF4mQcg5AMc/tJke+3tP1Rcu4YwcyxkybJFSILCW8AU8YQyAniIVeNg7cJCjSqLC0p2ur4lHq9qSOlhT64rz/ahuXvn3agkTHfMoqJFoc2SOkfiszxzfMWNx6En9ZrmgrwTfhExTwbWUGp9Fz6/EPvorKMEqWt6/8Oz/UrdZEEOgdw0wVaaoOvAVaAGa83NX+/murSJMbgZoe0Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(39860400002)(366004)(376002)(451199024)(1800799009)(186009)(6512007)(71200400001)(6506007)(6486002)(33656002)(36756003)(86362001)(558084003)(38100700002)(38070700005)(122000001)(2616005)(2906002)(26005)(53546011)(478600001)(91956017)(41300700001)(66476007)(66556008)(66946007)(8936002)(8676002)(4326008)(76116006)(5660300002)(66446008)(6916009)(64756008)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <067A4A16DA86234C8C71DED36FB497E6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5708
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b1917bf3-7b97-4dac-482c-08dba874a30b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZT4xwHK3WY8+avLpbtx/Ed1Oh3xfItW6hyAFbkMkx4StSxexxVTQw2e2gRzzHljg5FIrBb6k09nISoSYu5pEUySlSY2r6FE6djQx8NK8juUqdf7kBdtpt4sg+YlKDSgAjMojuTh+tgGSiWXlhgRL/HDy9u7Rd6PA9jyb8/Cw9J7XgMzs6izMT5O1opDhItNGumpjLbmtCIb0BMvuzRVQr6eqwryfa4pfDdRzNbKl/a0QPYCg4N5xcssGuIk7WdCgZfUrloD8Aa9j7PeSLkA4hNWRTeJASAxy1A9K86hQV7Lk08httNwYhkpS5m7MwbWkZ60CpVkti8b0jU6l3B/Dh+Ubjvtafm58dNG8cMunE0u59tj6PPyxSxvLcNBGcn51ewOGMhPr7tnqRk/doNmX74mBTopc6owQKGnRzoAkFhBCPqpE3V1QwsKYBRBsD0ApI1n6hKCIza85rnDVfTNn2u9qviBmRHmHT5fE8birpbMekV30R7xatyJSoOrH8bTMYL8VExn18+hNTdlR0OnAgBlgCQjWWA7RKx1otT3a3zMg9OD1Q+FSinfQX3agr3eJWaHqHm2Z1pzv8MFmyPDF/ETvilpmx/4QYo90+dai55J6piP1ZeWM7+ewAObjlztGQ/IlSWoEuH7xU/LMcMbwY3g+Tx5JmdJGucdbG5pDyKYk6H79Hh3YdOJ/n+3vZb3XaYXnHr5Gp+wBHWhf4sXO98ilmfF739WPTJrJH936ZHk=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199024)(1800799009)(186009)(82310400011)(36840700001)(40470700004)(46966006)(356005)(81166007)(82740400003)(8936002)(53546011)(70206006)(70586007)(478600001)(6506007)(6486002)(316002)(41300700001)(6512007)(40460700003)(36756003)(26005)(8676002)(5660300002)(558084003)(2906002)(2616005)(86362001)(47076005)(36860700001)(40480700001)(336012)(33656002)(4326008)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 09:45:18.5570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c4aea8-2683-4789-8a4c-08dba874a7a8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9223
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 09:45:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186851

T24gMjggQXVnIDIwMjMsIGF0IDA4OjE4LCBFbWlsIEtyb25ib3JnIEFuZGVyc2VuIDxlbWthbkBw
cmV2YXMuZGs+IHdyb3RlOg0KPiBObywgeW91IGFyZSByaWdodC4gSG93ZXZlciwgSSB0aGluayBp
dCB3b3VsZCBtYWtlIHNlbnNlIHRvIGluY2x1ZGUgQ1ZFX1BST0RVQ1TigIsgaW4geG9yZy1saWIt
Y29tbW9uLmluY+KAiyBpbnN0ZWFkLiBXaGF0IGRvIHlvdSB0aGluaz8NCg0KVGhhdOKAmXMgZGVm
aW5pdGVseSB3cm9uZywgYXMgbW9zdCBvZiB0aGUgWDExIGxpYnJhcmllcyB1c2UgdGhhdCBmaWxl
Lg0KDQpSb3Nz

