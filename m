Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB41C4332F
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 11:40:33 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.72])
 by mx.groups.io with SMTP id smtpd.web09.31131.1643629231182720174
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 03:40:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=YKiiboT3;
 spf=pass (domain: arm.com, ip: 40.107.8.72, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnhiU5/bruj8JjsN97KWtfSkn+287iKUq57Gdb3LmQY=;
 b=YKiiboT3U7IkQphEASWuf4FGwtKpR0n5U2e4oJ2x5UDvjpEy5+XeiLN3cciubFk5PrG/Ap2CKkIXwaEeUt7HzFCN76p1BT7DweW6mDPWRfysHXTzZgomIe5n/VzGm5ro8j8UB/U9xoMiUvBOkqhY9hxjWtTb1zsJ0iKRlmQNRH8=
Received: from AM6PR02CA0022.eurprd02.prod.outlook.com (2603:10a6:20b:6e::35)
 by AM6PR08MB4391.eurprd08.prod.outlook.com (2603:10a6:20b:73::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Mon, 31 Jan
 2022 11:40:27 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::8c) by AM6PR02CA0022.outlook.office365.com
 (2603:10a6:20b:6e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21 via Frontend
 Transport; Mon, 31 Jan 2022 11:40:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Mon, 31 Jan 2022 11:40:27 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Mon, 31 Jan 2022 11:40:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 96ff4c9767e603ea
X-CR-MTA-TID: 64aa7808
Received: from 84fc0d68c751.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9E0641BF-1A8F-445B-B3E2-85D918822229.1;
	Mon, 31 Jan 2022 11:40:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 84fc0d68c751.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 31 Jan 2022 11:40:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UC1U7k7J5JwZHXXF3AhDTjQ46rU7896RV+WSpPHCrBXxtahdOhsVS7iRv3uQV8lcnIQbN421khXQSE2wHQ0AVMeqBomL2e0dDVnOJ5MS4msIePrjNFfRUzlPeshb/DXfDxnJ5t2GFFx5f97ksRlJga9EcFwvmC09uewyLSfLRJdTHB1GZNjwbrSZS37K4FAHbx/dUo0HZLYXt/xb/uddB+28F0Xjhz2noVJTvxFAxC0K/kzHKFbJHdT70//KZ/GNIZURAKbZL8O/VZ+LyRPTyZmGTFHpyqmR8sx6CLv2GbZJdHgzNvNQlJ0hIh4UhRA3uff7Lu/ykdUqhO8sf6UJ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnhiU5/bruj8JjsN97KWtfSkn+287iKUq57Gdb3LmQY=;
 b=nVp1m7UFosk+T6TVRav8snNFEaVfqapJdB0V7EBjymAlGpGVphB62ioVih1oApsoOET8A8hAOcIpRoJBltwfDiP6ovC0m2ya5+V1crbavF7asB6tAMZ3c38N+ksh5LIX98lZT8j5i/2g0b8QqKQRfm3A1b6Uc7dSKBD53p3p8WyPMDyR7rCwcWnqfGL6Tjks2S4usV+3+1hRQa/71aLwRx+9U4W+MHbZJvK3BXpA57jXptjHqk6MjGA/codoBuI0ui8caCXiVbj0wYnIBvXGUQiJewBJFQvEXfP6+ljSBW87eG14G13Jbix0LqUrQbmctCseA1pvJFMisaEIgBvPdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnhiU5/bruj8JjsN97KWtfSkn+287iKUq57Gdb3LmQY=;
 b=YKiiboT3U7IkQphEASWuf4FGwtKpR0n5U2e4oJ2x5UDvjpEy5+XeiLN3cciubFk5PrG/Ap2CKkIXwaEeUt7HzFCN76p1BT7DweW6mDPWRfysHXTzZgomIe5n/VzGm5ro8j8UB/U9xoMiUvBOkqhY9hxjWtTb1zsJ0iKRlmQNRH8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB3076.eurprd08.prod.outlook.com (2603:10a6:208:5c::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Mon, 31 Jan
 2022 11:40:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d083:610d:66ce:9446]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d083:610d:66ce:9446%8]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 11:40:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Steve Sakoman <steve@sakoman.com>, Nisha Parrakat
	<nishaparrakat@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [poky][dunfell][PATCH 1/6] lsof: correct LICENSE
Thread-Topic: [OE-core] [poky][dunfell][PATCH 1/6] lsof: correct LICENSE
Thread-Index: AQHYEUYoEIJDBgwerUy+NSPUrldfkqx6JQAAgALnFoA=
Date: Mon, 31 Jan 2022 11:40:18 +0000
Message-ID: <FFD7F607-B72E-4FF2-A0C0-170CB57158F8@arm.com>
References: <20220124171609.20282-1-nishaparrakat@gmail.com>
 <CAOSpxdbZhtqPNpPyqbk1KHD--sqDzLK83=hEo-Rtn7m2AjZx9A@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdbZhtqPNpPyqbk1KHD--sqDzLK83=hEo-Rtn7m2AjZx9A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.57.22011101
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: fdf6de2e-718e-4237-7e71-08d9e4ae7a10
x-ms-traffictypediagnostic: 
	AM0PR08MB3076:EE_|AM5EUR03FT018:EE_|AM6PR08MB4391:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB43918C9057272F3B82F77C18E8259@AM6PR08MB4391.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4303;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 zPuEF3f5v/23MB4zRLR/xb1COhpa4rsxGrugNp2zyRkwxto5MJQjiINmcK7qN+i7xE3Ema8ddYLOonr8Yg5b40cwKJMatPaNSrLDA//7iSwVvUYAcpwueqRAzr0VELyB7MmBxESmIEA32wH4Qhi0Cxyb3NOh8toXIqQ78gQ8YqygELET6dCdBqTUlADqQhyz6XvdwVgVX0MMUcmkOf/sfyco/9cfpHnwhXGX11m90ng0MPEx5BnfbSGgpz8gOlGNLk4hkWiJjy+ix4HJUm7dJYXe8apI/NlwEAy8Lb6KpcdsCqLFaLdCN9oKOHVoMX3xbYVcA+aDyojKKJ8hce5UrwebO3FUPpyqsX/JekHrMJXATdUn8SSk2i6MlvTYBC7gF/iSB2AogVy1BfAx1N/i2sigUSZMhytA0FDCXdVcgZ+qOVsQv03Vb+obItN0/gsyC+vw8Opj7K2/BPHknzP0h8mIuAEAvKqraCPfIFsYNkDlzYFscaXWk1Nf+gBGBbUgNjuhfQwU7DhnO+mGzwTZubOyyTYRXPFF3BfJV06W8DktBrzmNR7jTJz4szBQuhCEt4nmkqemaBk/MYdlSMpsQYz3f7JvRJ1qNvivoedForAWh8xVaTgHsFvOHJTOrtEdUTa+l+20IFFDmIVbzHEwW6ZSvS6gdwtyZwcgVq6GSeJIQG7vzmmjrFOrGkR6yvrst+GoNVLRBd74/WVpYdrCYgCe16Gdgcl8OFS5HHhKlxI=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(83380400001)(186003)(26005)(4744005)(2616005)(2906002)(38100700002)(86362001)(38070700005)(64756008)(36756003)(71200400001)(6506007)(33656002)(5660300002)(76116006)(8936002)(6486002)(8676002)(508600001)(6512007)(66446008)(53546011)(110136005)(54906003)(66946007)(316002)(66476007)(91956017)(66556008)(4326008)(45980500001)(20210929001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <092A71EEC9C0AE4795CE5310F433B05B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3076
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8050ad5a-4535-4056-aa88-08d9e4ae74bf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	obattfHEOJ9sf4XGA26zV3LObT91E74OsmSVuh/pPrYiFm5RRlfN24L5HomZ42bsVq0ct/PssfYgAWdZNLXHNTldtzuGyOZJD3v8PBFhPcaa0YZq2KVWJfa2ALGjr7/g3Pv+lwz8H6BWlbhQyKXrSvzmx0kcLYUNyEMXnxZI94pOnPDw9K3fQHBHoiMay6RlrtKcNpnNCdFniU4MqJeiqXtQGSprl//m2zXZnt6XQTfJqzyQvpWI9QOgru6PQvilrxX30OlPOyiQj/jC4TI99NoXItYTgbkmuFJEXkBioLmSXgAnUrAmpNALQfu09JvrHDJ63WjyJh6E3u6QG9S/RhogZXagWxW7dpcRoUyK+IF/6kRkM/pW2OkXv6iPvOL7OYrD+wTVO5BNtKdTBwddE8J3whvW6XimjQ2uZOJPFt4eFujqSCVYix2TkTY4jrhFWWoNzrW5F/yJp6B+LRfo5oJLeeoCxo2qidU7HtZuwveKNZhDHZ/8CaIuG/B4B+uqej+3EsJM4LNMN+VVvezTtFN/rxQ308MxCb+fAHLYBlSeAAPZ0nQjvRVu5DcBqS+6MEEWkWBj2ev2Djmk4QESzQ1bD7eiHRgz+BD+WSh8I7wiWt+qksiyfGfIS6gBilDHWuHWkw+5WgGkKZtKIi/YRDWTTtETmQsLap8JT/EdeV1B4qcN4kEvAgR5yDequfRC
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(107886003)(8676002)(53546011)(2616005)(33656002)(6506007)(6512007)(82310400004)(2906002)(4326008)(4744005)(26005)(186003)(5660300002)(70586007)(8936002)(70206006)(6486002)(47076005)(40460700003)(36860700001)(86362001)(356005)(316002)(36756003)(336012)(508600001)(83380400001)(110136005)(54906003)(81166007)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 11:40:27.2354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fdf6de2e-718e-4237-7e71-08d9e4ae7a10
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4391
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jan 2022 11:40:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161122

T24gMjkvMDEvMjAyMiwgMTU6MjEsICJTdGV2ZSBTYWtvbWFuIiA8c3RldmVAc2Frb21hbi5jb20+
IHdyb3RlOg0KDQogICAgT24gTW9uLCBKYW4gMjQsIDIwMjIgYXQgNzoxNiBBTSBOaXNoYSBQYXJy
YWthdCA8bmlzaGFwYXJyYWthdEBnbWFpbC5jb20+IHdyb3RlOg0KICAgID4NCiAgICA+IEZyb206
IFJvc3MgQnVydG9uIDxyb3NzQGJ1cnRvbmluaS5jb20+DQogICAgPg0KICAgID4gVGhlIGxzb2Yg
TElDRU5TRSBpcyBzdXBlcmZpY2lhbGx5IEJTRC1saWtlLCBidXQgaXQgaXNuJ3QgQlNELiAgTm93
IHRoYXQNCiAgICA+IHdlIGhhdmUgdGhlIGZ1bGwgU1BEWCBsaWNlbnNlIHNldCBpbiBvZS1jb3Jl
LCB1c2UgU3BlbmNlci05NC4NCg0KICAgIFJlc3VsdHMgaW4gZm9sbG93aW5nIHdhcm5pbmc6DQoN
CiAgICBXQVJOSU5HOiBidWlsZC1hcHBsaWFuY2UtaW1hZ2UtMTUuMC4wLXIwIGRvX3Jvb3Rmczog
VGhlIGxpY2Vuc2UgbGlzdGVkDQogICAgU3BlbmNlci05NCB3YXMgbm90IGluIHRoZSBsaWNlbnNl
cyBjb2xsZWN0ZWQgZm9yIHJlY2lwZSBsc29mDQoNCklmIHlvdSdyZSBnb2luZyB0byBiYWNrcG9y
dCB0aGVzZSBsaWNlbnNlIGZpeGVzLCB0aGVuIHlvdSdsbCByZWFsbHkgbmVlZCBvZS1jb3JlIGUy
ZjkwOTJjMzczOTVmNGUzZWU5ZDA3NzdlMjhjODNjY2U2MDA3ZWUgdG9vIHdoaWNoIGFkZHMgdGhl
IG5ldyBsaWNlbnNlIGZpbGVzLg0KDQpSb3NzDQoNCklNUE9SVEFOVCBOT1RJQ0U6IFRoZSBjb250
ZW50cyBvZiB0aGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGNvbmZpZGVudGlhbCBh
bmQgbWF5IGFsc28gYmUgcHJpdmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJl
Y2lwaWVudCwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBkbyBub3Qg
ZGlzY2xvc2UgdGhlIGNvbnRlbnRzIHRvIGFueSBvdGhlciBwZXJzb24sIHVzZSBpdCBmb3IgYW55
IHB1cnBvc2UsIG9yIHN0b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRpdW0u
IFRoYW5rIHlvdS4NCg==

