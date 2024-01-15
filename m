Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D650C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 13:41:16 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.57])
 by mx.groups.io with SMTP id smtpd.web10.80211.1705326067226655077
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 05:41:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=RSTqALCW;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=RSTqALCW;
 spf=pass (domain: arm.com, ip: 40.107.104.57, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=JFbB3cyWvGwgwM/Y9SpktwBhuCegLRTCLROurl2JZXundpxdcyYKSCiiZu4dsSzMYSfjxZ9wz5P2FXjD0nC1v+QrjrOSUJbqfjxmOJ6ZjVFfKwdQAM61BJ7OUUSsqhqrFbEupEGu87MoNkurf1LZPYnuhaJJXQ5QNY45ZO5Yd6u6qgq5o9qHrVMD9oNaraaW0H9hom5m2jZDqo9iPD/8Z/e0MNHictFObJwMHlizraB9qwAEWMPKqn/Kal/4CDWlTfaHQNjsMd0aiQ78jvGnf2YVRvtOFZZmj7SIkv79wKQTxN7WnxjGHSgO80ePqjX4lAOOSJ7bPLHpuNnsWXZxew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdBtTwDR8vJrTLOnUFUrP49pmXZSZWmbOf3OU+sXJwY=;
 b=bnfZeHBuNx6X5yQpXabN/LLeGhYiYaJzgduuQwTfylN91XghQV/vK2Ora1u2Bh0IJlVPw4LF4WrS8pYFMXG0SwAoPaAiT7Tr57BveSG03TDGmZss59JccvTxLxOYvB6aXHU4rCWrluIIvJDOBrpMgBSKicQPSrBNvBiNy0AFqj1Wt+Jd4MnxpUXFZnZk/ttzDrVwSwsGlZakd0AF/JSW5ysWrWCdX7ds4JqmjvYVkXkuFhBieSVulfL6zdGEQQ2zwlZUS+cY7sm2LgTL2BFfcJwnHpEV0MQwuNJ+86EwceNZNrUqYNX5imbMBa3V+AeAOwez6Grjl1E347hWPkQm5A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdBtTwDR8vJrTLOnUFUrP49pmXZSZWmbOf3OU+sXJwY=;
 b=RSTqALCWdYp6Rp1TmUDl8Qnh8MSCTmSAJ9TVuiZkdwYTGs1+BnwXojmkmcO09waDH6vegmWu4IqamHlPw5DLfCT2jsourrfNZhFRSF8EKSDVPHbxNMRIIreS/BuEc4IZrzzo729iLx2zDOZLMWnvj7S9cfjPPVVBtSu6WXEMzbY=
Received: from AS9PR01CA0018.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::20) by DU2PR08MB10201.eurprd08.prod.outlook.com
 (2603:10a6:10:496::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Mon, 15 Jan
 2024 13:41:03 +0000
Received: from AMS1EPF0000004E.eurprd04.prod.outlook.com
 (2603:10a6:20b:540:cafe::2e) by AS9PR01CA0018.outlook.office365.com
 (2603:10a6:20b:540::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26 via Frontend
 Transport; Mon, 15 Jan 2024 13:41:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000004E.mail.protection.outlook.com (10.167.16.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.16 via Frontend Transport; Mon, 15 Jan 2024 13:41:01 +0000
Received: ("Tessian outbound a297577ee0df:v228"); Mon, 15 Jan 2024 13:41:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 161d8318a6795342
X-CR-MTA-TID: 64aa7808
Received: from 833a5afb2af2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BD0EAFD5-D4F7-4C90-B994-02869829C372.1;
	Mon, 15 Jan 2024 13:40:54 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 833a5afb2af2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 15 Jan 2024 13:40:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4lcUXx9aMKtYBW6WDyh5KJ7BSehzL5eE1n8dbhaL2BbFse5QN8SAgEMUazcman4XckGyIcwoShO7GbbetH7AIKVfe03fayhNvfOQHVklTQ6STtEXk7qQ5hY645VoxMMVIRpt9wqNDTVKvlUsUbq76iLE/xlMkzxEOgZZXyosWAHrKTm+RnG/HnQPize+5nxSSldhgfLTDjmSU6TRLDjkjg0tjdZZNeiDljLr1fSlYmAg9FpKcVww8ZCl1JmYKOhgQjByv4dWtEj/qUInq5sx3QId33Wy4uEUmxKoGksAQz8JDLty3lDYq6U0743OJbWic9ON8HuwZ3w/5C9keIZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdBtTwDR8vJrTLOnUFUrP49pmXZSZWmbOf3OU+sXJwY=;
 b=OToiYY1EEtK7D7dTQ2xmdzBsCAunLfQtr81dPKhpiOIc2pUbwlqWZAiWF3DAaDWbUJS7nSVHp8vf9LcLyiEzA6pZeYo5FnVhan5iQ3U5HUVFeumRiLz4oxufMxyKmdPhQwdqXUbtxekX8abJ1RVtanIIBj9Ptnd3UInS498nkqiy5w4aFUotWQ69V0OlsZlDZZ486ZpQBlKFgNRwTtUXD3IaCAwQ/26F+8mJKNIcA9hhELBl8s4pA/3JWRPZdVYExNEqsreQ5u/YuryqDa7y/V7ZaXNLy0vmvm4znpGAfjyJ/K8lnKGg0aTkqAgOuxTiCQCpGksWeX5uQJe6aRkHKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdBtTwDR8vJrTLOnUFUrP49pmXZSZWmbOf3OU+sXJwY=;
 b=RSTqALCWdYp6Rp1TmUDl8Qnh8MSCTmSAJ9TVuiZkdwYTGs1+BnwXojmkmcO09waDH6vegmWu4IqamHlPw5DLfCT2jsourrfNZhFRSF8EKSDVPHbxNMRIIreS/BuEc4IZrzzo729iLx2zDOZLMWnvj7S9cfjPPVVBtSu6WXEMzbY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB10371.eurprd08.prod.outlook.com (2603:10a6:150:8a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Mon, 15 Jan
 2024 13:40:51 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06%3]) with mapi id 15.20.7181.019; Mon, 15 Jan 2024
 13:40:51 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] glib-networking: Fix ptest failures with
 openssl backend
Thread-Topic: [OE-core] [PATCH v3] glib-networking: Fix ptest failures with
 openssl backend
Thread-Index: AQHaQzI0h77wMUU1uUmWICLlsBmLvrDa6nYA
Date: Mon, 15 Jan 2024 13:40:50 +0000
Message-ID: <3B3DBDDB-9E17-431A-B3E8-DC8E072066FC@arm.com>
References: <20240109192923.3183219-1-raj.khem@gmail.com>
In-Reply-To: <20240109192923.3183219-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB10371:EE_|AMS1EPF0000004E:EE_|DU2PR08MB10201:EE_
X-MS-Office365-Filtering-Correlation-Id: 380abad2-3aa2-4002-3c6a-08dc15cf9ce5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 4jvteaZxBvLIibwfgmVh3JHkfUENqsyt2/6oK1WrkI+pCH0W/iFYJLF1LdwiJDkiQuNgO7P81YF4WEk0MIywqVi6CxPl42r2DUJW8cMELXIQ7I1Gq4CxTwtSmWyCCVyaBGeyzOu1xQAOiyZPbF0x4O9nJxFdOifwvKBgpiTSVfoZYSJeb07agnVvcTmKvpL7+CsX6Le0qDVmCk9UjNtgdENcxjKOzH5wwn/VKKKe+9hViL0NOt133xVtOiQ6k4wJLwi2HcmrfMBhQOXz7VtU3cCcFs/VpF1688Q0FSqY8byRHwuMlsQqwshPUNjg6Rr/G12uQocRQWHZD4CnzrNtl6Ml78aSpouBn3f8JZmKaKn9quH10kqewf+KFy20S+kUG6JssYDfKotbXpcoVs/VkudXKjbvnS+nvdcvzT/swLSszWvSPe40rl5021fM8VdzZdtFH6SHeRKDAftB5uJfMDV2GPSZwTtjzXu39Ty7LBhqeMymeuJS8MZEvlgfehODxirfD6o4PiPiO1h2ZfxMVbgYazmgguDfGqqOtRi3QTHtZya34wZEXHgqxegHKuVTJPmS1Liep+DJGIbTqaSdgGRoKPa6fIpPzp10alCApIryAZGo6lcFWguamYBmu2NYOu26tZLmvg1w0zc83wBw+w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(396003)(39860400002)(376002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(5660300002)(4744005)(83380400001)(4326008)(8936002)(8676002)(86362001)(2906002)(26005)(122000001)(38100700002)(2616005)(33656002)(36756003)(6506007)(6512007)(53546011)(66556008)(66476007)(64756008)(66946007)(91956017)(76116006)(66446008)(6916009)(316002)(6486002)(38070700009)(478600001)(71200400001)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <601518B486C76046A1230E49F5CD78BB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10371
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1fb9ce77-00dc-4118-e799-08dc15cf96ac
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h5MAQa1/CTv9CLEq3bScCuhZi57ETtJyCrK2zE46M44J5Vy2QAV5Tg3TW46tYpL6zCv8ltnkpVPwa3+pxY/HsjOc/N8pZGVi5rWMUHrbsu7mSDFSIyKX4sK2kxSEADaBravfeaQGXQVdZAn/6ecbB2bhNv/8n40kOvUpd/BQQ1sYa5CcbXjyrvhlhlc0UzKmimBSVkEj69ePngoYJvbF/plnmoEm8JjT8LBX3I8dkZSuAUa7B3QO1oRSQfefx1OOz7NLgywJIoZnWwpfRf1IxmF7Jn5iO/UF9ogrLUXLTIVO6kMn/lrInoxd2wt9DRuIAIMGIZ5XQ8aYTdZC0EHT1KPLPR5fhQZGi33d6fQZUnzhaljFVoYPuIqAx5mvjmAb6gsEmh9UXCZd6cv8YkdWFel0XR9Pd7JqgRu0He9/UkUL6wTZsa3DNxS8T/6CweFf077p4IPWk5iUEiYzEipDrM4qX+UX2O9jfAtXROlKFjmYzKgGyWOMLvup1xXCUDbQQdDPrRgEMJE3fuI2a/0a4Jcu3CNL0OJ29fgHZganabC3LT+pDJd89O3hwvwgBwnnmqorLxUNOU2++9AVQuRh/VllNg+pzFNP5w+yYnCW7aKapFuzY2UXL1jPkgS6M/97ohgbJCd/nhpkiwvWc+UDoV8hoFdiR4Xv03eDxbOOMsk9oVCpumpb6JitgfMQjegrcvz8eWRwtgfIiQvPtca03w==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(136003)(39860400002)(230922051799003)(451199024)(1800799012)(82310400011)(186009)(64100799003)(36840700001)(46966006)(356005)(81166007)(82740400003)(36756003)(40480700001)(86362001)(336012)(26005)(36860700001)(83380400001)(41300700001)(70206006)(6512007)(70586007)(53546011)(316002)(6506007)(2616005)(47076005)(6486002)(478600001)(33656002)(2906002)(5660300002)(4744005)(4326008)(6862004)(8936002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 13:41:01.3981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 380abad2-3aa2-4002-3c6a-08dc15cf9ce5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10201
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 13:41:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193672

T24gOSBKYW4gMjAyNCwgYXQgMTk6MjksIEtoZW0gUmFqIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxyYWoua2hlbT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+
ICsrICAjaWZuZGVmIEJBQ0tFTkRfSVNfT1BFTlNTTA0KPiArICAgZ190ZXN0X2FkZCAoIi90bHMv
IiBCQUNLRU5EICIvY29ubmVjdGlvbi91bmNsZWFuLWNsb3NlLWJ5LXNlcnZlciIsIFRlc3RDb25u
ZWN0aW9uLCBOVUxMLA0KPiArICAgICAgICAgICAgICAgc2V0dXBfY29ubmVjdGlvbiwgdGVzdF91
bmNsZWFuX2Nsb3NlX2J5X3NlcnZlciwgdGVhcmRvd25fY29ubmVjdGlvbik7DQo+ICsrICAjZW5k
aWYNCg0KUGVyc29uYWxseSwgdW5sZXNzIHVwc3RyZWFtIHNheSDigJx5ZXMgdGhpcyB0ZXN0IGRv
ZXNu4oCZdCB3b3JrIG9uIG9wZW5zc2wgeWV04oCdIGFuZCBtYXJrIGl0IGFzIHN1Y2gsIHRoaXMg
aXMgc3RpbGwgYSB0ZXN0IGZhaWx1cmUgdGhhdCBpcyBmYWlsaW5nIGZvciB1bmtub3duIHJlYXNv
bnMuDQoNCldlIGNvdWxkICNpZiAwIG91dCBldmVyeSB0ZXN0IHRoYXQgZmFpbGVkIGFuZCByZWpv
aWNlIGluIG91ciAxMDAlIHBhc3MgdGVzdCBjYXNlcyBidXQgdGhhdCB3b3VsZCBiZSBhIHRlcnJp
YmxlIGlkZWEsIHNvIHdoeSBpcyB0aGlzIGRpZmZlcmVudD8NCg0KUm9zcw==

