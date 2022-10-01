Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C488C433FE
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 20:01:38 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.44])
 by mx.groups.io with SMTP id smtpd.web09.1219.1664654487679309331
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 13:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=pLNo4py/;
 spf=pass (domain: arm.com, ip: 40.107.105.44, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fHoI6CXGQPOa126LIj9SHCZlhUonVWvraLMKxOBTsCVFMdAekmckeFRnKNzwaq4sNjTxQlpPmRx47qCJcMomzS3x3Bjy81s/M+z77xsAWwcROv/Y3/vfLTvMThnzHVyxTam1fX0O35OjtHP1IlT1+mQBNdKCqneLJ1V+vvj04L2f5o5g5QWmde60wEER3LgoDGZxZ4FZw1v57Mnuh3sPNn/65m302KC110zl9PqmDNaw92rj36IO/GzRuR5rWBTPvtVdySb5E3cme2qFWk+uTEz6gRUpeq+I8blRsXkdpcc2xE9TTMFi1x3bPO25RFX5m3VQ+/xuHymUc819EMhW3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zc3YOomnbzBt+DoGqR9XLEMT9iHyQ2VmUgzHxtRTwh0=;
 b=oNTIbGLKKRmVNw9menL0LSgqIpOehGJSmi+sRRzbo/IGmebP7MF/xE4np/2rzbfWr9dk2EP/7WGY7xfZ2ElcSNyi9KW5/CptDfylJR/mb6roIhw0uSfC+mxnJRXQfkd8xwfyqAzpfv8u+0+okfD2i9BkztN5HvKxRfRGsmHWW9puE57zu/BqOLgH8cvlw8ho249hw9hTUl8p6048edZYE224WvVwsnt1DQP/4pHPNCuXJJwsz7BZwEzzBScWF6JBeaQWEcLqWl4F8l6dmz3n2wmp+E6LmVKLXU3wp9gY83EpJ8pr+c9CzeMlb+G70CHTdRgk1Iu3TrkHasD92Z976g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zc3YOomnbzBt+DoGqR9XLEMT9iHyQ2VmUgzHxtRTwh0=;
 b=pLNo4py/fPPIugmdlGOhGmrgSpTB55ROWbb9dszhldegHomlQzQ9kZ41uXvk+ioTVjyS/R7cyMzdESkqo46LmvfPlZB1PnB9Ym7dd8np1h/r5MJbVpAIyf5xUg/z1C5WfYB8rRtZmdeJ1QnShvf+WzA1tsGaNZ4d+qqRvSfuqLQ=
Received: from DB6PR1001CA0023.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::33)
 by GV2PR08MB7929.eurprd08.prod.outlook.com (2603:10a6:150:ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Sat, 1 Oct
 2022 20:01:21 +0000
Received: from DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::1e) by DB6PR1001CA0023.outlook.office365.com
 (2603:10a6:4:b7::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Sat, 1 Oct 2022 20:01:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT057.mail.protection.outlook.com (100.127.142.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Sat, 1 Oct 2022 20:01:21 +0000
Received: ("Tessian outbound ce981123c49d:v128");
 Sat, 01 Oct 2022 20:01:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d2740a5adc38ef7b
X-CR-MTA-TID: 64aa7808
Received: from 0d0e5b1b23f1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B6CC899B-99D3-42BA-8DC1-1E1E76BE05E2.1;
	Sat, 01 Oct 2022 20:01:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 0d0e5b1b23f1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sat, 01 Oct 2022 20:01:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkSYmP4fWu2au6b8htIQ4jVXmDMgDTVJ9lYwREfO6bifwmaiQXNJ/42jV4ztkUL/YJUqNDPapWsmRw29AuNst6gBdvFLB8NtMWOOQ4pAr+/pBPihnCx8GIEEpnSxwPlWz2LA2LdWUnK8Xz38JeTXGCKebqhgFH24zO/S8Mes0JISlydNM4NIflL09tOwDYMKbebzgae4lh+bh5IkOLmKj/D28PyuL8ATCHTC7CY8HY5lqIaji4YpBrYwUTNyTeK4VGwRMeZYZNy4FQPWtnypFXjrC7vPCVDDIS9O98mnEReVSErYHks7ZMaTWIgbfqVFE8L32swtqWiukR3bSkaFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zc3YOomnbzBt+DoGqR9XLEMT9iHyQ2VmUgzHxtRTwh0=;
 b=Qerv98j1gM8heqXPHp92iBDHmRdxlGWXlMHA8dPDKzn6bhiDMembFhxwGHJ/NpHPqY0pWlVXfPmM/3NzJD3PUi6pQxDwLpqKysJp0yokuwd1ErGSKUsUsTN0Ravl8FCFWSnQJpCnd4L3+x+/LDWF8cZ4H88csR1CPhUXc8ugnXxnUL9Rh9klCxRMOstLu641UbGkr4+N320qbnowBNObYiuCWUeespSQXuncdmORnG8fujo3rvArxpJGLMG1i2McVIz5WJ/yfTDAQee/YXTK1sY0MWsscZbQDJfafZIB72ImvZg2bqaI3eJ60N3i4CsEUI5kZGajmcJpw1rT6Bmf1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zc3YOomnbzBt+DoGqR9XLEMT9iHyQ2VmUgzHxtRTwh0=;
 b=pLNo4py/fPPIugmdlGOhGmrgSpTB55ROWbb9dszhldegHomlQzQ9kZ41uXvk+ioTVjyS/R7cyMzdESkqo46LmvfPlZB1PnB9Ym7dd8np1h/r5MJbVpAIyf5xUg/z1C5WfYB8rRtZmdeJ1QnShvf+WzA1tsGaNZ4d+qqRvSfuqLQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7865.eurprd08.prod.outlook.com (2603:10a6:10:39c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Sat, 1 Oct
 2022 20:01:11 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.023; Sat, 1 Oct 2022
 20:01:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] openssl: Add missing perl module runtime
 dependencies for ptests
Thread-Topic: [OE-core] [PATCH] openssl: Add missing perl module runtime
 dependencies for ptests
Thread-Index: 
 AQHY1INuHCxkyMIu9UeLDtUzW8mrR633wj6AgAAF44CAAFsqgIAAB2cAgAADaACAAAVlAIAAAh0AgAAAfgCAAAolAIABt9MA
Date: Sat, 1 Oct 2022 20:01:11 +0000
Message-ID: <DF4844C5-BAA6-4C05-A803-BA1129C1722D@arm.com>
References: <20220930041614.2704304-1-raj.khem@gmail.com>
 <C9A0CBAD-5373-4F4C-BB73-0AD10A2DF000@arm.com>
 <042F0314-BF16-49A5-AD68-81DFD17739E6@arm.com>
 <CAMKF1srZEorOx-hPiD1zZx1DMiJdZbHgknub04hfyfRFzEhNcg@mail.gmail.com>
 <EA0EFA99-9A83-4699-9D0D-AD5279C58B81@arm.com>
 <CAMKF1sqwQcT-vpk5Ycydd8BCk3OCmPP-zCKZ-MwRr0G+XPHHNA@mail.gmail.com>
 <01558808-3100-4CFA-98DB-244F487435D4@arm.com>
 <CAMKF1sp=ujH14XbTybycQkJWaL93OMfm0dS6FvM_XR+K71EQaw@mail.gmail.com>
 <CAMKF1sp1oqMEXLvXPJhquoFjuDrhc-rtEN5-b05b_FVtYo9w=Q@mail.gmail.com>
 <CAMKF1spSdO680G-gsNe5501L+f5CxcUYt-8eayt8-SwPkKcC1w@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spSdO680G-gsNe5501L+f5CxcUYt-8eayt8-SwPkKcC1w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7865:EE_|DBAEUR03FT057:EE_|GV2PR08MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: 36658dae-0938-401b-b79a-08daa3e7b5de
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 bx2ikaEYdGEy2y3m/uT7qV5/rJFKQ8W+DpWGvRF32wFxL5ZbdEWA98MUCGnjoZuKsVUoR6dJBH16gTI7XSJE3h0Iz4osw8z/D0t6BQNSGZ8KDsm3Khb+GGdJB8T7KLVKQU3SEw5n+S7IlvY0QHTRroBu0JFSra57gri1PwoZLdTNreUcQFIanMyxSEvkTXckt84Tjgk85gBCPIYzxPjyepiBqfA0gxN7ql+UCdF28/dk6zX9SM7af5fZXlj1Y7rRZgAQd0lDiPrqYYJBUsphd1nkRGH/EEWToGLDAHCt9j/0UnKLFscLnxoaaBPHny19zdMjmcCuhR7IKA00cSfAanRdZTF/EvnSWU4zCqf5eKzBOn4J9k/J2rcga3v5ABRjR+jM8JcOL9IYAslyTTPo4LcXp86oE+bLJzHJCfUMLP/HKb/K3+Ih0JVFHTsO/ZZ1I6yP4a0kfYeSTkGn2AQQzReIFTU54oMze8Z/rcBGf7uotpEyIUysb+r+7g0F7xaz58tMIPycZzemOVRANAP6HSEhTSlbrU/5UgW4lseTProNuJIZqdU+mVcdlmtCTjz3cqRKxvMQJscTgmhxYlR5Db6OH6G0o4J61n0RbSDxe+NRucIW/aKNqZC/Ti5U7vb+6o4iUosFJBzf5oP7Ei7XVME60SUNM09EwSnk7hS3adlSknQUiR446siEuEh7AI3UI9nzrAn8TU+GtOdzmuadV5jBGeK0qvSW7ObgX42P91PZtdtVZhwKX4XtuAkV6ydtB+zcQ7Xo6KfFChajPYi0YH7cSrKZxcdO9QHEn0EbuHw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(451199015)(71200400001)(478600001)(6486002)(36756003)(5660300002)(41300700001)(66476007)(33656002)(6916009)(316002)(558084003)(8676002)(66446008)(4326008)(66556008)(91956017)(66946007)(8936002)(64756008)(76116006)(38070700005)(122000001)(38100700002)(86362001)(186003)(6512007)(6506007)(26005)(2616005)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8132CF2E1B9DC343A83FAA423989905E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7865
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	793b493d-e619-4b53-a2a6-08daa3e7b028
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1iZ26OE4ahrB4ESDhewqTxLtzETtNyBQPv4MVQQAEOeh1AXtye7C9gjtIT4QvRD2ikrR5DfPcB5wiUXLNXpeso0b9Y+siZcJnco7GogE9bWCbAfjLCqjFjNbpIi/JRMEsyQjOaJNUVkBtNMd2pVEBlNPIBvTtyhQmrVUFWYBuGfB5riFAGFjm83S1WVKfjAxQ5IdxruC/WUYr2OW7rkzMAZJypt6n1d4gqdzGbFdixgVcouuw27Ma+y4rBeABQqkDO9lCekzzT9PabfIojbxHO8ZAVHc9UfsPij/eEN/dT9q85g1MIJUKgVxsBXBUfG5lkDf/KU/pVb9+MiWgfFsg50Lae+wcA5mui2hDf/ib+uc7GzYBtvMCl95DRwddqzEingX0hGg+jiLJUdiN8SCcrJUQVHe8BuNjNGR0R911WuVHD+CfdQZAHOZZlPkIdCg03sSB+h3q8pBgJeBk8fuCkK28lukZ96dwXEeXVvI7y5Doggtukk1Z54rVPKMjCLxaEi86gppdF+qZxo23sSaYr/ksNG2HiBnl454A7lLfKO/pbcIJcWJiiY45vyTnayGtLvm/ukVw0jnrmwMycRMB/kAuJhWnGN1/0pOGPtBpcyuySqlBweb7aJYN0wii5sWpq3+wGFh/4ZO4PF1faONKHWh2gtMW8psK6T6WCuCIMDW4hR7N41IZm8rmKzQ4Ab7DGd1PayHNuL/IZGMIIdmipg/Tz/9KdgbCDg3pRdAvLWLAGRFZBqkwDoeJM36GeIiP8eCAiAc1PmWOWtZjXHW9A==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199015)(40470700004)(36840700001)(46966006)(5660300002)(47076005)(6512007)(26005)(186003)(336012)(2616005)(36756003)(478600001)(81166007)(6506007)(316002)(6486002)(36860700001)(2906002)(8936002)(558084003)(33656002)(6862004)(356005)(41300700001)(40460700003)(4326008)(70586007)(70206006)(8676002)(86362001)(82740400003)(82310400005)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2022 20:01:21.0391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 36658dae-0938-401b-b79a-08daa3e7b5de
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7929
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 20:01:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171349

PiBPSyBteSBSUkVDT01NRU5EUzpwZXJsLW1vZHVsZXMgYXJlIGZpbmUgc2ltaWxhciB0byBSb3Nz
LCBob3dldmVyIHRoZXkNCj4gZG9lcyBub3QgZ2V0IHB1bGxlZCBpbnRvIGZpbmFsIGltYWdlIHdo
ZW4gb3BlbnNzbC1wdGVzdCBpcyBhZGRlZCB0bw0KPiBJTUFHRV9JTlNUQUxMDQoNCg0KVGhhdOKA
mXMgZGVmaW5pdGVseSB3b3J0aCBsb29raW5nIGludG8uIFRoaXMgaXNu4oCZdCB0aGUgc29sdXRp
b24sIGFzc3VtaW5nIHlvdeKAmXJlIG5vdCBkaXNhYmxpbmcgcmVjb21tZW5kYXRpb25zIGluIHlv
dXIgaW1hZ2UgcmVjaXBlLg0KDQpSb3Nz

