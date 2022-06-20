Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C8AC43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 11:14:17 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.51])
 by mx.groups.io with SMTP id smtpd.web09.28954.1655723653695706780
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 04:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=ITxPA6Ox;
 spf=pass (domain: arm.com, ip: 40.107.7.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=g6kZIYhObNbYgA8wm4pA6lZA8IGOUJ5e+edozcWBcWyjW8crk793B9ftjbhnDJyDA4MhfakVXBPGGQnSBApzGCIXdEUYuVjQaAf6movLzTdt1rsXUEJSn11jWQ1vnjsMF466GLCZdxXZF+iRyS2scnoc2oVAgKZBUlBLtKPgVjLQAYSZxmDfx7hrMAmDkon/EQz1zi7dQ6GusCa3IT3mn+060WK7BGi4JAVH9Ppm0g30iDSfekz7vgBYQ6s+SuXlG8GpV3yb5gotWCZOJ1FyFkogKXKVFcclcCwBVxgRUSs5XgvuPjNwGWGUZxPiO2Y+wNY195M84BBf8Nv/pSGHwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kl6KpCLCLkr4G+wHNKfW6fbhYCE0WBIjAQKbq/th32I=;
 b=RKalYJVS/aDDcoLfPnF05Djo7BclKmPytpFvI2JRzxNaeCmNebvdfjFN753BhKCOmTw6mkqSv8N/ZvhrqbHGnED/4Vl6FEWzyRieldaMhMYMEIHfRk0azbdZmbx96XyX7aMC4gQPS9wyz1G3mGSuv98mCP+J/9OXRBur8RWhGEBe98kQXLiEfJzpqJUDI5QOWRJQGlyVPEEqVKa3JRJuahYTpFrymx4/T5a7CkkiV6dREpjup/nVksOXQ+j8cJxsuaqOJFSe+I0CX+8+Xvu13y1UoXnotfY2MlfROJBdA0WQup8WUjousEFN+J5CTrKFKXwkHk1q/zLPChs9/4WC8Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kl6KpCLCLkr4G+wHNKfW6fbhYCE0WBIjAQKbq/th32I=;
 b=ITxPA6OxVVMGfNobBY6W+ntTReMCt+h8zIKW3QOhWYX25s7l/dP8UKL80BgGHLdM92/iDNjVzomILNAzPz5M9qrDsqluIEGoIt5VrDoNBhh0O4tRi7PglV7a0huvAIHsHwWHUOrJ5VU0VSEtJiGOj1MNPIjU8XYcH8CGJYh3tHQ=
Received: from AS9P194CA0011.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::16)
 by VI1PR08MB5325.eurprd08.prod.outlook.com (2603:10a6:803:13e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Mon, 20 Jun
 2022 11:14:09 +0000
Received: from AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::cc) by AS9P194CA0011.outlook.office365.com
 (2603:10a6:20b:46d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14 via Frontend
 Transport; Mon, 20 Jun 2022 11:14:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT041.mail.protection.outlook.com (10.152.17.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Mon, 20 Jun 2022 11:14:09 +0000
Received: ("Tessian outbound 01afcf8ccfad:v120");
 Mon, 20 Jun 2022 11:14:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4ddd2185d88939a3
X-CR-MTA-TID: 64aa7808
Received: from ca0069e4495f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8A95F46E-A794-4D49-A3F4-A21E9F4FCE88.1;
	Mon, 20 Jun 2022 11:14:02 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 ca0069e4495f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 20 Jun 2022 11:14:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5FlhzDfL6U0ZZxr3WpgFmL62paBIU9IJJ2U87H9PqCI7wJIeLhT65ieR3I152oD5/EAuHC7PutPcQU4psXzWXPhtx8n2M5I+dwQvivDTJa3R0rYp5R+QaPHV06mBToFQPVPrjLYL2frP18Z8Kd3B/yf+8AcbcCbxmnwFZe/CWxF/Tk3kJn60P7KCJFNZrfIMaG7XnWC5Up+2OlNNW9B71Vh7cSN9DVP/CNwcecoeVOJIcSo6UTJZilpz/m93BiYWv+0Mk/Ia2fqpMBOK6TktuPh7k4pf3OIVjYaCiTJwqpsnY2fJoFgFguyxdt22tuh1hnz7ZbxjQC+GLJ5JWtGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kl6KpCLCLkr4G+wHNKfW6fbhYCE0WBIjAQKbq/th32I=;
 b=Vd3zp6MoxFhmvL1tjuiWRei6hiwuhjDbQgOd0qm58uuIpCLBr8CX3aZK7b+VYjLK2VlTApiPW7a9LZ7J0kndsI9OcXOalUTJwKJNBVrSWSq+OvzPROgqMMJhUZOmD32FxivgSOWyQ5jby41j2w3pzS24MmH1acukl5Of6OC1fGDpSdor49J9Gku89GFDOnjaOxgoNuNpfUWStXSHQ4z1jOFFpjtbWB62nk+q4sXBS8g115/tRTNKaTZnop2Rs9BQFmCO8hPY/31HWHzu+xvibgALAWDa+IlwV1MxApiyOXOMd2qv605n+LZ8CMGbdCtr1zLJ1Gq7jBthwIDTlX/RnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kl6KpCLCLkr4G+wHNKfW6fbhYCE0WBIjAQKbq/th32I=;
 b=ITxPA6OxVVMGfNobBY6W+ntTReMCt+h8zIKW3QOhWYX25s7l/dP8UKL80BgGHLdM92/iDNjVzomILNAzPz5M9qrDsqluIEGoIt5VrDoNBhh0O4tRi7PglV7a0huvAIHsHwWHUOrJ5VU0VSEtJiGOj1MNPIjU8XYcH8CGJYh3tHQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR08MB3181.eurprd08.prod.outlook.com (2603:10a6:803:3f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Mon, 20 Jun
 2022 11:14:00 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5099:2a51:e4ef:7405]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5099:2a51:e4ef:7405%3]) with mapi id 15.20.5353.018; Mon, 20 Jun 2022
 11:13:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
CC: nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH 1/3] Add python3-hatchling (from meta-oe)
Thread-Topic: [OE-core] [PATCH 1/3] Add python3-hatchling (from meta-oe)
Thread-Index: AQHYhCMgDQuCGiGHrEOfBMvldGKp/q1YJWYA
Date: Mon, 20 Jun 2022 11:13:59 +0000
Message-ID: <597F032E-8184-4FDA-A422-585D9197DF3A@arm.com>
References: <20220619212520.4158865-1-ross.burton@arm.com>
In-Reply-To: <20220619212520.4158865-1-ross.burton@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 71daa689-a86d-4407-4529-08da52adff4f
x-ms-traffictypediagnostic: 
	VI1PR08MB3181:EE_|AM5EUR03FT041:EE_|VI1PR08MB5325:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB53254AD29EC66B301900EC61E8B09@VI1PR08MB5325.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 gHAy483nijARtyeEhpH0EaKImzdyTtVLGLGPyo2bCEjYz9KyfcCmoxtf47dJjKWdiDveMYI5CaCruRf1BzEPtjnQdS4dYrnscCQRcISSeiZ9GsjuSsq/gfRA1wdQf/B781T8MUjOfjyy+BUGQayMp2ks288OFsAaeM68KX6Tof7xBf/NS2USE6cqUjfqDTF3g1PgYlvsm0Y3hT00VWnagLNLJ5pMpLSjHmKarVEwcJnm/OQpWlagPJKkmOvXVCGkTzYL28c3mWHsXx2XGeVjujS6yyq+D3E6JNaaibD4ttMW8pv3mhEe4TdDyZdc63RLfhSfsPPGS4yQWk/nP+X05ewyyVhpLEQ1siRNXCwxmpE9XyC6ZHYpJ6y4Epue5I6/pD5gJkmUyPzLMCscC1yCHF9z4eCW+Xv6S1M0zYZl9cAaz4QJwkR1Xh52aY/yKIc2uSsLRtnWrg5vJbqhOc8lu3MWgT7l9TGWY9PoAtR0VmRO/KTPZqd4ZmIU8iyx9nym/hp8iyJecoV5BNN3ln+A1bVH3llvn/S/yYhJIQC+s/cR8jtqOA9XCv67v5k7p9FE/NZrLFGOG5zb7bgongnZPr3X5yQI7YAjxiD1kNU+BW3YyCK10ZNfaQrWXWI//SKc7p3bf/1X8D925LmL99teImd6+1Gc7EnUCCO797hufbFyloZx5f4e4/Ph3rXIqRGPbDXtJmpZUV+rZ2AzrHohWyPyA6NFQTY+aKs/3IOz6JM8EIjylQNk0GJUCOUQjXfRrVWyoLmxsxu1zF8xw0Hs4UxueJR6Ej8uOyCqigL5/ColuH7dYbZH2gVybsZ/kw7H/NTIWd2tj6ZJt5OG92mP0w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(376002)(346002)(136003)(366004)(396003)(966005)(66556008)(2906002)(66476007)(91956017)(76116006)(66446008)(64756008)(66946007)(6486002)(4326008)(83380400001)(53546011)(8676002)(186003)(26005)(6512007)(6506007)(5660300002)(8936002)(33656002)(2616005)(86362001)(41300700001)(478600001)(38100700002)(71200400001)(38070700005)(36756003)(122000001)(6916009)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7646FC944EA0404387D0CEB03D166DA9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3181
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2cb97f34-9c70-4dd3-255f-08da52adf994
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	R0sd0RkhZ/Tslo32HXfOksu5AuFlfO3w4Ym9H9txF6qhh58JJNjeUc3LiIBGrd+zjzmn9bL1z8zZUWuitvPEkngulZ6mxgGNiD+BcpwodEpOUI3Jl28utF6337YsfGYTtLdXcJXXTODCVMhY3WNCyXxv/oFpvcbFDy9HrdNLTI3Zft9uRehaJej5nuB2t5iVU7Bw848I+G313Mwq7u7UxXXNMkIrDQtxhAyzlKBAMtj7v3dps02sTtiipFwITM19VrXStvg7Wzb2vG6fLsMwKzoOBGjHh6wRk1omynOuLO4j93cM6aqxW5cAjqCglQ8oVwCN9BggtJSAD/McCoasAbkIetkvRezhLcuCKybMb2ZjCRqsIGvoIE5igGpysX0SzTZ4vT2qHdv6x2SZktUd1RH48enyQuD72TUGx1l1EGtpgdUspeuDkBmBpdNrkIcmfUlvPfyAJoA1KRS4EU2SI1kfLT4SrVMS0wtyONDv25hGz/7yUW7irIskgzpF2IF0mT6Lx7vftpSE+88ij8eb3wN7cI1sM7AxOFW7l9IfNstLMf6M+fWpLumuzKcTSyV/LTTJc9kQmIDmNWcfqRrq1cfRyAS5zDq0LeEi49SjnbuwfQ374Prudb1vf+D66tSw/MU3bzsdvFj6MoYXBIXOYEDPONUTFsieuwt2hG9wXSSiC5duzxwU/OBIak/M7YL4mYnGelK7Gh9uETD2vslvwl+7SOxnzmqsd98Qd+BtEr9Q9EDlbWxkBY9sSb2QlC3uH1SEkoK4CDR09QLs3KV33g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(36840700001)(40470700004)(46966006)(26005)(6512007)(2616005)(86362001)(356005)(81166007)(186003)(83380400001)(47076005)(40460700003)(53546011)(36860700001)(336012)(82310400005)(70206006)(5660300002)(33656002)(8676002)(316002)(4326008)(70586007)(8936002)(6916009)(6506007)(36756003)(6486002)(966005)(498600001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 11:14:09.1614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 71daa689-a86d-4407-4529-08da52adff4f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5325
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 11:14:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167092

QW4gb3BlbiBxdWVzdGlvbjogc2hvdWxkIHRoZSBjbGFzcyBiZSBjYWxsZWQgcHl0aG9uX2hhdGNo
bGluZyBvciBweXRob25faGF0Y2g/DQoNClRoZSBmcm9udC1lbmQgdG9vbCBpcyBjYWxsZWQgSGF0
Y2gsIGJ1dCB0aGUgdW5kZXJseWluZyBidWlsZCBBUEkgaXMgY2FsbGVkIEhhdGNobGluZy4NCg0K
SeKAmW0gdGhpbmtpbmcgd2Ugc2hvdWxkIHJlbmFtZSB0aGUgY2xhc3MgdG8gX2hhdGNoIGFzIHBh
cnQgb2YgdGhlIG1vdmUgdG8gb2UtY29yZS4NCg0KUm9zcw0KDQo+IE9uIDE5IEp1biAyMDIyLCBh
dCAyMjoyNSwgUm9zcyBCdXJ0b24gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPHJvc3MuYnVy
dG9uPWFybS5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBSZWNpcGVz
IGluIGNvcmUgYXJlIG5vdyBuZWVkaW5nIHRvIHVzZSB0aGUgSGF0Y2ggYnVpbGQgc3lzdGVtLCBz
bw0KPiBtb3ZlIHRoZSBoYXRjaGxpbmcgcmVjaXBlIGFuZCBjbGFzcyBmcm9tIG1ldGEtb2UgdG8g
b2UtY29yZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBh
cm0uY29tPg0KPiAtLS0NCj4gbWV0YS9jbGFzc2VzL3B5dGhvbl9oYXRjaGxpbmcuYmJjbGFzcyAg
ICAgICAgIHwgIDUgKysrKysNCj4gbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL21haW50YWluZXJz
LmluYyAgICAgIHwgIDEgKw0KPiAuLi4vcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMy4wLmJi
ICAgICAgICAgfCAyMSArKysrKysrKysrKysrKysrKysrDQo+IDMgZmlsZXMgY2hhbmdlZCwgMjcg
aW5zZXJ0aW9ucygrKQ0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9jbGFzc2VzL3B5dGhvbl9o
YXRjaGxpbmcuYmJjbGFzcw0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjMuMC5iYg0KPiANCj4gZGlmZiAtLWdpdCBh
L21ldGEvY2xhc3Nlcy9weXRob25faGF0Y2hsaW5nLmJiY2xhc3MgYi9tZXRhL2NsYXNzZXMvcHl0
aG9uX2hhdGNobGluZy5iYmNsYXNzDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAw
MDAwMDAwMDAwLi5iM2NiZTIzNjAxYg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL21ldGEvY2xh
c3Nlcy9weXRob25faGF0Y2hsaW5nLmJiY2xhc3MNCj4gQEAgLTAsMCArMSw1IEBADQo+ICtpbmhl
cml0IHB5dGhvbl9wZXA1MTcgcHl0aG9uM25hdGl2ZSBweXRob24zLWRpciBzZXR1cHRvb2xzMy1i
YXNlDQo+ICsNCj4gK0RFUEVORFMgKz0gInB5dGhvbjMtaGF0Y2hsaW5nLW5hdGl2ZSINCj4gKw0K
PiArUEVQNTE3X0JVSUxEX0FQSSA9ICJoYXRjaGxpbmcuYnVpbGQiDQo+IGRpZmYgLS1naXQgYS9t
ZXRhL2NvbmYvZGlzdHJvL2luY2x1ZGUvbWFpbnRhaW5lcnMuaW5jIGIvbWV0YS9jb25mL2Rpc3Ry
by9pbmNsdWRlL21haW50YWluZXJzLmluYw0KPiBpbmRleCA2YWIyZWQ5YTlmNS4uYzZhZDNhYzY3
OGMgMTAwNjQ0DQo+IC0tLSBhL21ldGEvY29uZi9kaXN0cm8vaW5jbHVkZS9tYWludGFpbmVycy5p
bmMNCj4gKysrIGIvbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL21haW50YWluZXJzLmluYw0KPiBA
QCAtNjExLDYgKzYxMSw3IEBAIFJFQ0lQRV9NQUlOVEFJTkVSOnBuLXB5dGhvbjMtZXh0cmFzID0g
Ik9sZWtzYW5kciBLcmF2Y2h1ayA8b3Blbi5zb3VyY2VAb2xla3NhbmRyDQo+IFJFQ0lQRV9NQUlO
VEFJTkVSOnBuLXB5dGhvbjMtZmxpdC1jb3JlID0gIlRpbSBPcmxpbmcgPHRpbS5vcmxpbmdAa29u
c3Vsa28uY29tPiINCj4gUkVDSVBFX01BSU5UQUlORVI6cG4tcHl0aG9uMy1naXQgPSAiT2xla3Nh
bmRyIEtyYXZjaHVrIDxvcGVuLnNvdXJjZUBvbGVrc2FuZHIta3JhdmNodWsuY29tPiINCj4gUkVD
SVBFX01BSU5UQUlORVI6cG4tcHl0aG9uMy1naXRkYiA9ICJPbGVrc2FuZHIgS3JhdmNodWsgPG9w
ZW4uc291cmNlQG9sZWtzYW5kci1rcmF2Y2h1ay5jb20+Ig0KPiArUkVDSVBFX01BSU5UQUlORVI6
cG4tcHl0aG9uMy1oYXRjaGxpbmcgPSAiUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+
Ig0KPiBSRUNJUEVfTUFJTlRBSU5FUjpwbi1weXRob24zLWh5cG90aGVzaXMgPSAiVGltIE9ybGlu
ZyA8dGltLm9ybGluZ0Brb25zdWxrby5jb20+Ig0KPiBSRUNJUEVfTUFJTlRBSU5FUjpwbi1weXRo
b24zLWlkbmEgPSAiQnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbT4iDQo+
IFJFQ0lQRV9NQUlOVEFJTkVSOnBuLXB5dGhvbjMtaW1hZ2VzaXplID0gIlRpbSBPcmxpbmcgPHRp
bS5vcmxpbmdAa29uc3Vsa28uY29tPiINCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS4zLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMy4wLmJiDQo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwLi42ZTdjY2Q3NDNmNQ0KPiAtLS0gL2Rldi9udWxs
DQo+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oYXRjaGxpbmdf
MS4zLjAuYmINCj4gQEAgLTAsMCArMSwyMSBAQA0KPiArU1VNTUFSWSA9ICJUaGUgZXh0ZW5zaWJs
ZSwgc3RhbmRhcmRzIGNvbXBsaWFudCBidWlsZCBiYWNrZW5kIHVzZWQgYnkgSGF0Y2giDQo+ICtI
T01FUEFHRSA9ICJodHRwczovL2hhdGNoLnB5cGEuaW8vIg0KPiArTElDRU5TRSA9ICJNSVQiDQo+
ICtMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9Y2JlMmZkMzNmYzky
OTc2OTI4MTJmYzk0YjdkMjdmZDkiDQo+ICsNCj4gK2luaGVyaXQgcHlwaSBweXRob25faGF0Y2hs
aW5nDQo+ICsNCj4gK0RFUEVORFMgKz0gInB5dGhvbjMtcGx1Z2d5LW5hdGl2ZSBweXRob24zLXRv
bWxpLW5hdGl2ZSBweXRob24zLXBhdGhzcGVjLW5hdGl2ZSBweXRob24zLXBhY2thZ2luZy1uYXRp
dmUgcHl0aG9uMy1lZGl0YWJsZXMtbmF0aXZlIg0KPiArREVQRU5EUzpyZW1vdmU6Y2xhc3MtbmF0
aXZlID0gInB5dGhvbjMtaGF0Y2hsaW5nLW5hdGl2ZSINCj4gKw0KPiArU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjE0MDFkNDVkM2RkNmE1OTEwZjY0ZDUzOWFjYWE5NDM0ODZkNWU4YjdkZGExYTk3ZjJi
MDA0MGZkZGRjNWI4NWUiDQo+ICsNCj4gKyMgVW50aWwgd2UgaGF2ZSBhIHByb3BlciB0b29sIHRv
IGludm9rZSBQRVA1MTcgYnVpbGRzLCBoYXRjaGxpbmcgY2FuJ3QNCj4gKyMgYm9vdHN0cmFwIGl0
c2VsZiBhdXRvbWF0aWNhbGx5Lg0KPiArUEVQNTE3X0JVSUxEX0FQSSA9ICJoYXRjaGxpbmcub3Vy
b2Jvcm9zIg0KPiArDQo+ICtkb19jb21waWxlOnByZXBlbmQoKSB7DQo+ICsgICAgZXhwb3J0IFBZ
VEhPTlBBVEg9c3JjDQo+ICt9DQo+ICsNCj4gK0JCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2
ZXNkayINCj4gLS0gDQo+IDIuMjUuMQ0KPiANCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0t
DQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0K
PiBWaWV3L1JlcGx5IE9ubGluZSAoIzE2NzA3NSk6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTY3MDc1DQo+IE11dGUgVGhpcyBUb3Bp
YzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzkxODY1NTAxLzY4NzU4ODgNCj4g
R3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5l
bWJlZGRlZC1jb3JlL3Vuc3ViIFtyb3NzLmJ1cnRvbkBhcm0uY29tXQ0KPiAtPS09LT0tPS09LT0t
PS09LT0tPS09LQ0KPiANCg0K

