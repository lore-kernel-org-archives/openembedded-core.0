Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ECBBC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 17:14:58 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.63])
 by mx.groups.io with SMTP id smtpd.web10.2814.1704734093199237146
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 09:14:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=uv6szZdy;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=uv6szZdy;
 spf=pass (domain: arm.com, ip: 40.107.249.63, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=kp1B9+1sGgayJrOhVPOZgTCJ2MBxVqHBsm94a5Yd8UGHMC9B/SXAF7QSYsH/pMDmxJ0QlUWKrx92CW7GsWiRLTH57GctJWxOfeXKKsItqjQy1+5G1Xkn+IierVA5+BWLzVSo/HxryFIq2cLfvpfy70Cn0Clm+CxeEQH8RSwkSa71p0TO5FWKSPZ4OJpXD1C4q48k8b8PKilGI6lLLZ/XsigwLZL/lRiK38yBoGE+3g9U5qrQcUXUlPWXzKL+dgIb2Snh98gtQdzz7bdCcJs1qoDDUnPVMdTLm1PORKEitv1VfM7H1BzbsAjDqWadF7xPk4j+LoXT87KDzvpZ2QJVPA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpPwo7rZWp1O06mxT2V/N+pFwRpOzQpH8SKe+FNDnCk=;
 b=Enrr26BIhCNw9/F5vK5uivXPeL4gcCvVf/Ztd0sfupxGRMoIxnTD+nDg6EYYt+pjMm82kV4U55z8rkNRVKCLfLjF0m+gYjLDPCK57V3U5rfPkzDh33bGooJ5YYWrQm9r2alxEtS+vquouZPYED2rRbRKSxGizf/1MOxSw8+Jsu0wSMBFD9Dcg6GsBfiwzmPAUCYR7u9T7y5LVsXUl1WPACIMioMyNdb6E5J7W34jC+qRlKrdkl4QVDrzZHR4MANDKjIqtmjDWkGzUS30xw6fHjrBcTJJHx7YuMo23rkouLXISiRjnn7Qkrgam3pLeZbJxGFn1LtDw078Os46Md+OMA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpPwo7rZWp1O06mxT2V/N+pFwRpOzQpH8SKe+FNDnCk=;
 b=uv6szZdy0vl3TCIIfbv4Hub5GPaD0A+aU5FDqvgZNfWVKRgs3f45UBSZANVcWhgBcFQu+W4xL+v6w/cTGjO3QRKUxfM2+RVCnHhAshbeSNGzj0aFaZNxmlJVgYTqs+tzzsmvpi7t5kxkJEfSC1u1aaXv2rsqsmLgDVURu6POgzU=
Received: from AM0PR04CA0005.eurprd04.prod.outlook.com (2603:10a6:208:122::18)
 by PA4PR08MB6127.eurprd08.prod.outlook.com (2603:10a6:102:f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 17:14:48 +0000
Received: from AM2PEPF0001C70D.eurprd05.prod.outlook.com
 (2603:10a6:208:122:cafe::17) by AM0PR04CA0005.outlook.office365.com
 (2603:10a6:208:122::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23 via Frontend
 Transport; Mon, 8 Jan 2024 17:14:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70D.mail.protection.outlook.com (10.167.16.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.13 via Frontend Transport; Mon, 8 Jan 2024 17:14:48 +0000
Received: ("Tessian outbound 3dfbe14a1a3c:v239"); Mon, 08 Jan 2024 17:14:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2b0537f7716ab631
X-CR-MTA-TID: 64aa7808
Received: from c0c09bdf60bc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E6EE1020-CE66-4222-B051-231BFBD2F104.1;
	Mon, 08 Jan 2024 17:14:41 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c0c09bdf60bc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 08 Jan 2024 17:14:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4eAJmM07djYw4PpUoaxw/Cp3s35BXP6n5CTFoPzKY59/qHPR8WriwRIYX34mAo+vydMaF6lZITHIkMMsBoVALM5ckid4EXxGkajghfR5Niird9uXiaTLL8rQAMz30kFIs8ZJ379TLe9TIQuYkG8bvb0TQqIqI79u/ApMakuTZvkjofmqZdnkk1El8h3EMDkYs2Zos6cJIGloXlMQxylvakieARzfa88k1W5mPvea60ez3qGCPvnBySjiJRCIag3nZNjFp7NkMEE9awCfbiF/QEWeY1xaT+FfPCM21Ba4v0uIg26NxPJ5/fNfbmtHWNAfVMk2txu5Gfkvv8b8xVjJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpPwo7rZWp1O06mxT2V/N+pFwRpOzQpH8SKe+FNDnCk=;
 b=V3HcN3BDCoxkwP9jm7Q0mvqEYJXbW9nvmndjZyt9SfTaMAItOYPZGHXKRdJXVrgLRv0xq4d+Qe+k6MED6SWTv0Yp0WxQDHD14920dUz0urn/ryRhcY7sOjIW1u3n4hUSXoE+cIhTX5jFksdAS1XMjt5u5AMO5GkkS3yhmqAw7nJJZtqKgJBxc9dgMa8hnu4sIUqLCsCnMuTMr6BYGFqFXF9mRcc7kkFnRCYcIrKUyZQvNTpdpDtVp/q9/FOoTwXZv+cwJNqT+QqBfVYxPh6N/3mvaDebwrjKYEeWDujAOp1fO7hdG5K1uC1mwKrvdD9iuvqqICc1dQqCZ1ib8TG63w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpPwo7rZWp1O06mxT2V/N+pFwRpOzQpH8SKe+FNDnCk=;
 b=uv6szZdy0vl3TCIIfbv4Hub5GPaD0A+aU5FDqvgZNfWVKRgs3f45UBSZANVcWhgBcFQu+W4xL+v6w/cTGjO3QRKUxfM2+RVCnHhAshbeSNGzj0aFaZNxmlJVgYTqs+tzzsmvpi7t5kxkJEfSC1u1aaXv2rsqsmLgDVURu6POgzU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9549.eurprd08.prod.outlook.com (2603:10a6:20b:61e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 17:14:40 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 17:14:40 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/4] classes/recipes: Switch to use
 inherit_defer
Thread-Topic: [OE-core] [PATCH 4/4] classes/recipes: Switch to use
 inherit_defer
Thread-Index: AQHaPlWOPQAJBobb6UW41sQ1cMR1YbDQL5uA
Date: Mon, 8 Jan 2024 17:14:40 +0000
Message-ID: <A0382FB4-C99B-4558-8B8B-D5A3A248C862@arm.com>
References: <20240103145902.2124110-1-richard.purdie@linuxfoundation.org>
 <20240103145902.2124110-4-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240103145902.2124110-4-richard.purdie@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9549:EE_|AM2PEPF0001C70D:EE_|PA4PR08MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: f8b3c9ff-f207-4624-c1bb-08dc106d516a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 k6VZfTjEnr1m61GuwjwBAHgR8Nu/iUb9MBHJxAa93x1bRFuXfc522iQLLb4McqU4oqohn979q9oIlBhukrw8/o7b3suAGKT2W0aJqfb7XF17oFAjDy95PLcrw7WOhxbcjlyq7T4YOLnBhx6FP9h6Liq/ADasI5fsEbxAypwPaH4bUBMQEHR7S1TDxQN80REVubUqox49qmDwHX8mgEG9Fzno1lu0Mk8lqGJJK+RUegBHETTM8CsQpqEB1dOGoJa+0QSKNuGkUyzu/NHwQ38TQzzFs+xdavDjVSamlOYRnQHJjjgXkffeTgU/05LCbC1Pv/TvGObQA/8Qq+boSSDfmUnZldGVyYX0FFzAjCi92ri/39K1horttE+ftAcjkYrOkabGcWAtWR8+cpf/sF8zl6O7Yf/gaghBIkQ4MIGov/OMVs+d6MLHbOYcUEOVRAxDzp/LDjseEp41khDaT3l4aS7bUFPHCG7/D4U2dFEdFSd0Cc4pY7Cv6bzqpOA2ArqlxBAjg5vQavw7FTynbdETPZaxEmR2ahqQXPRCOnFb9gjeiEjW+BE7IO2jfESSGWgJFyAoPiLwxRsWSs8nTHSk1VcePe1qZQ2mqKBPT8VfmnOEhrCdAr6zrMUqs7IONtdFOo2RYrXBxOaLZAkV6Z8l4A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(366004)(136003)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(91956017)(66946007)(66476007)(66556008)(76116006)(316002)(8936002)(8676002)(26005)(478600001)(2616005)(83380400001)(64756008)(66446008)(71200400001)(6916009)(2906002)(5660300002)(38070700009)(41300700001)(38100700002)(122000001)(4326008)(86362001)(6512007)(6506007)(6486002)(53546011)(33656002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C048974489CBF44EB3590CDF7EB4DBA0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9549
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C70D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	09d6eb25-fb83-4574-2679-08dc106d4ca5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FfuvLu+Cuj28N6SkCZmG2D4b2cGqyNbrP4U3ydmPCd8Z7KetM1VyiGatXHuM6Vp0xSgpltLPkdeGu9axLIn2Se2R38JDmCHjPxiFo/vQK7XVvIcJdgT4UHubfb/Q3sacoeZVSSaPpAlpe6xZW6Xj/xPBdeXiJJPONw9BYKac9yNDgXUQsqUKDYmJwEIzwuEJKDuQp8ABw7VSbT78DZRlBAJ1lbgeI9JuCIv7/Bk12S0SdTKA4V5673bqzPeZhKJPHtQ/T9nGjguiGyAecEuDMN0GYpqI+EW7VtuF8WNRUxAISuZbU1u4NQIuAlJLzbQS0zxNtCJzAvCmrzJehdZzFzCJ0k6h90uTFsXXooOmEooUxxeUGOE+73jyVknlxnUZoVli0jFCUsE8FponFb6WtKD8Izbsk1pfAYye/TngTS34lbz2UsQUe1LmnBBq3ZpPlOErER1jjHpAgfdjGxB6y7GZ13L8HvqWmwEn3Mt+Y71TMmQVubRhmtU5l6K4y17TllM+xo1WBw66fXRU/AUQJZEHqBJ/DhitxwwA1PxbuVbh8sFoS3NZwQFR7E5ALMQpwVmdG/Q2P4GUZ3mEP0CW9Qs8ZRZoXurkiq5KwLsw/ccs9ijjTi403BMa/ycMw206WCLXTDYxiBFdd6GHI6Own9yRcRvhNNOypreqxanGoxiQpWfV3HvoRjGhiN0oZA6TQVMBowMrcOUl0G9GEA911Q8tn8BifE+P0vcKEyeKIz1pxvnKA5FKxLzrP1C2VdGN
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(186009)(451199024)(82310400011)(64100799003)(1800799012)(36840700001)(40470700004)(46966006)(70206006)(70586007)(47076005)(316002)(6862004)(8676002)(8936002)(26005)(478600001)(336012)(2616005)(83380400001)(2906002)(5660300002)(82740400003)(41300700001)(81166007)(4326008)(40480700001)(36860700001)(356005)(86362001)(6512007)(6506007)(6486002)(33656002)(36756003)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 17:14:48.2729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b3c9ff-f207-4624-c1bb-08dc106d516a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 17:14:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193427

T24gMyBKYW4gMjAyNCwgYXQgMTQ6NTksIFJpY2hhcmQgUHVyZGllIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxyaWNoYXJkLnB1cmRpZT1saW51eGZvdW5kYXRpb24ub3JnQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+IHdyb3RlOg0KPiAtLS0gYS9tZXRhL2NsYXNzZXMtcmVjaXBlL2dub21lYmFz
ZS5iYmNsYXNzDQo+ICsrKyBiL21ldGEvY2xhc3Nlcy1yZWNpcGUvZ25vbWViYXNlLmJiY2xhc3MN
Cj4gQEAgLTI4LDcgKzI4LDcgQEAgRklMRVM6JHtQTn0gKz0gIiR7ZGF0YWRpcn0vYXBwbGljYXRp
b24tcmVnaXN0cnkgIFwNCj4gRklMRVM6JHtQTn0tZG9jICs9ICIke2RhdGFkaXJ9L2RldmhlbHAi
DQo+IA0KPiBHTk9NRUJBU0VCVUlMRENMQVNTID8/PSAibWVzb24iDQo+IC1pbmhlcml0ICR7R05P
TUVCQVNFQlVJTERDTEFTU30gcGtnY29uZmlnDQo+ICtpbmhlcml0X2RlZmVyICR7R05PTUVCQVNF
QlVJTERDTEFTU30gcGtnY29uZmlnDQoNCkZlZWxzIGxpa2UgdGhpcyBzaG91bGQgYmUgc3BsaXQg
aW50byBpbmhlcml0IHBrZ2NvbmZpZyBhbmQgaW5oZXJfZGVmZXIgJHtHTk9NRUJBU0VCVUlMRENM
QVNTfS4NCg0KPiAraW5oZXJpdCBwb3B1bGF0ZV9zZGtfYmFzZQ0KPiArSU1HQ0xBU1NFUyArPSAi
JHtAWycnLCAncG9wdWxhdGVfc2RrX2V4dCddWydsaW51eCcgaW4gZC5nZXRWYXIoIlNES19PUyIp
XX0iDQoNCldoaWxzdCB5b3XigJlyZSBoZXJlIGNoYW5nZSB0aGlzIHRvIGZvbyBpZiBiYXIgZWxz
ZSBmbG9iLCB0aGlzIGJvb2xlYW4gc3Vic2V0dGluZyBpZGlvbSBkcml2ZXMgbWUgaW5zYW5lLg0K
DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWRyaXZlci94b3JnLWRyaXZlci1j
b21tb24uaW5jDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWRyaXZlci94b3Jn
LWRyaXZlci1jb21tb24uaW5jDQo+IEBAIC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkgPSAiJHtYT1JH
X01JUlJPUn0vaW5kaXZpZHVhbC9kcml2ZXIvJHtCUE59LSR7UFZ9JHtYT1JHX0RSSVZFUl9DT01Q
UkVTU09SDQo+IEZJTEVTOiR7UE59ICs9ICIgJHtsaWJkaXJ9L3hvcmcvbW9kdWxlcy9kcml2ZXJz
Lyouc28iDQo+IA0KPiBYT1JHQlVJTERDTEFTUyA/Pz0gImF1dG90b29scyINCj4gLWluaGVyaXQg
JHtYT1JHQlVJTERDTEFTU30gcGtnY29uZmlnIGZlYXR1cmVzX2NoZWNrDQo+ICtpbmhlcml0X2Rl
ZmVyICR7WE9SR0JVSUxEQ0xBU1N9IHBrZ2NvbmZpZyBmZWF0dXJlc19jaGVjaw0KDQpBcyBhYm92
ZS4NCg0KPiAtaW5oZXJpdCBhdXRvdG9vbHMgdGV4aW5mbyBiaW5jb25maWctZGlzYWJsZWQgcGtn
Y29uZmlnICR7UFlUSE9OX0lOSEVSSVR9IHB5dGhvbjNuYXRpdmUgbXVsdGlsaWJfaGVhZGVyDQo+
ICtpbmhlcml0IGF1dG90b29scyB0ZXhpbmZvIGJpbmNvbmZpZy1kaXNhYmxlZCBwa2djb25maWcg
bXVsdGlsaWJfaGVhZGVyDQo+ICtpbmhlcml0X2RlZmVyICR7UFlUSE9OX0lOSEVSSVR9IHB5dGhv
bjNuYXRpdmUNCg0KV2h5IGlzIHB5dGhvbjNuYXRpdmUgZGVmZXJlZD8NCg0KUm9zcw==

