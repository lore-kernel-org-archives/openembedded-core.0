Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC99DCDB47E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 12:53:21 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.45])
 by mx.groups.io with SMTP id smtpd.web11.10373.1697115197913603417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 05:53:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=XJ33oAKE;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=XJ33oAKE;
 spf=pass (domain: arm.com, ip: 40.107.22.45, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dt6N7X4wW1Yka6Q64ALnEbjA8dmfw1v3EoSDk4r/ubo=;
 b=XJ33oAKEWgIxc9I20Fl4lnqjy8em6sc45UNMNVxRv3aenD/Nf3XAaukYaezQ+O+v0rPYBRpn/zxXcvoR3wedLmSNCrmPChhPiH5uoFf4LKm3OKf4iB9t6LWJA8VT9jNbH2EBpT9d2pWL42vIHpw5ze11zghuSb/3pJQZwzEy4Vg=
Received: from AS9PR04CA0094.eurprd04.prod.outlook.com (2603:10a6:20b:50e::23)
 by DBAPR08MB5623.eurprd08.prod.outlook.com (2603:10a6:10:1a7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 12:53:14 +0000
Received: from AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50e:cafe::9e) by AS9PR04CA0094.outlook.office365.com
 (2603:10a6:20b:50e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.29 via Frontend
 Transport; Thu, 12 Oct 2023 12:53:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT060.mail.protection.outlook.com (100.127.140.216) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.29 via Frontend Transport; Thu, 12 Oct 2023 12:53:13 +0000
Received: ("Tessian outbound fb5c0777b309:v211"); Thu, 12 Oct 2023 12:53:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6fec3ae9801c5c40
X-CR-MTA-TID: 64aa7808
Received: from 416d353cddcb.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AC5D409B-F65E-479E-A55C-8F1FEC225181.1;
	Thu, 12 Oct 2023 12:53:06 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 416d353cddcb.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 12 Oct 2023 12:53:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTe58a+nGaEYnKnf6QoVql8gMn+NGgwsJByvz4s0AiYjeidWWjTnF1fl0peiXlMuzMzXgcPl6TyaeFSppx+yTQFj+v+8gQk+xSXJrLxow0tlTikHtHCitCbfOK4dSgXhQO3+ghDZUGD35Fy74buYNxqNaezLzNmhQc+LfY2pipflGHXHK8ItqSsEnQHbH4Yu7h0quyLtf2WcpKtBusygo92zWuc7rJVCteWTmmHRRPGnZt3lYcaFDojqj43As+VYj9yOghWRw0Kd01Ku0veMy+PGeYmSrDdBZ3jxUeDcYCapl1Zxa0ve+ISOxBLGtKXo6IW1i5zn9Fm8X2LVJRxe0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dt6N7X4wW1Yka6Q64ALnEbjA8dmfw1v3EoSDk4r/ubo=;
 b=U8Q1lPC5KWnJbRYCX8KM91jeiAi/X4RcdS2SdYaWwnz0QekF1ucdlsJP1DucDLPhLsJT53tePWk+w2P9pBVIy6VRLKa1cLb6L3twz2Chjuh0zX3hg+yrtrccfLBVnZtpxYJRAOMfsBdfQXbYFriB9Q2XyyTVbr8WC62XQA3tORXMRvSUdrJp87MbAYAHOKygrySIXI1eMDmKDaoIwBZL02EBf2yYF4VKfBWR4Lp43CImcY1Dw/g+htak1eUElW1HgNMj28H4xG0t8Qwy2AK7mOreEFO6CtNyF5OAovbVogUBvtxiYfv8HGtiO8tUkvrC7B94PQ3WcZxEPQUkWD0WtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dt6N7X4wW1Yka6Q64ALnEbjA8dmfw1v3EoSDk4r/ubo=;
 b=XJ33oAKEWgIxc9I20Fl4lnqjy8em6sc45UNMNVxRv3aenD/Nf3XAaukYaezQ+O+v0rPYBRpn/zxXcvoR3wedLmSNCrmPChhPiH5uoFf4LKm3OKf4iB9t6LWJA8VT9jNbH2EBpT9d2pWL42vIHpw5ze11zghuSb/3pJQZwzEy4Vg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB8029.eurprd08.prod.outlook.com (2603:10a6:10:38b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 12:53:03 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1817:56f3:7623:c4a5]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1817:56f3:7623:c4a5%4]) with mapi id 15.20.6863.040; Thu, 12 Oct 2023
 12:53:03 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Adrian Freihofer
	<adrian.freihofer@siemens.com>
Subject: Re: [OE-core][PATCH v6 03/12] devtool: new ide plugin
Thread-Topic: [OE-core][PATCH v6 03/12] devtool: new ide plugin
Thread-Index: AQHZ5AKkce80QAd4uE690f8Y8h9QhbBGTgAA
Date: Thu, 12 Oct 2023 12:53:02 +0000
Message-ID: <186EDB03-6E99-4675-BDAA-A19FD95EC95F@arm.com>
References: <20230910161850.4032227-1-adrian.freihofer@siemens.com>
 <20230910161850.4032227-4-adrian.freihofer@siemens.com>
In-Reply-To: <20230910161850.4032227-4-adrian.freihofer@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB8029:EE_|AM7EUR03FT060:EE_|DBAPR08MB5623:EE_
X-MS-Office365-Filtering-Correlation-Id: b25c4c53-dbc3-473e-782c-08dbcb223238
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 9K1KE78qrzAA/J6cAXV5cCH3ClP+AWXOx4cBa+qXuSssETFExzpESJAia+5H0iVIqTx7kX09wnxUfqoH7zRBugDj/C+xqys/Hb0p0tcJlU+43LSR43iifSmSQp2Z/uIbxz3HvYPg13p8hOAEar3bMqqdtJuWYp51vyh94j/po5vohLFSfZPNPBZ8ZOuyZe0eozCR7XFg0zRzMLLKVy6b8HPNuCQ9Pgrxmc1f0Exu8QGniXfxh1HXjtkCJsB3bUbujPtPpB+jv9Qd0qHTZJC1f9BE4DPPSPhS5ZRgpB8t9pdNBhRPigvfpJ/QIRI0KCvQIxCPJ/MG+MVnqgl34YfZOUATDjL7r4zrhd3iFR0RuV4/Nv9rKskdf3PzCQDKFB1KseHEhXRCVBKYPAFiZNugzVU03SNXOFOkynRUgZuZ9ci88+3VrprNkTPpTYBCrEvBu6AOknKs5ng7/GkEno+8kk4RU7FDuXLZcJznCNAlTQxPkqSpQiSb9xP8AFBxcr5Re2TikNDRpQqW6hbcgKucRlSrFrABpP0zH74gjU/JqlcRN0h+Kwb1QW/LgbIiN0fV1UNYs/ff/Qa5a+7n14nEjnio6O1LOUj7rf7DnhImnLgPwLOpiFFQUTWGr/gMqFsBzVv/4X+r+r5oTp4TSt8vWw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(346002)(39850400004)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(122000001)(66899024)(38070700005)(6512007)(26005)(2616005)(33656002)(6486002)(41300700001)(5660300002)(8936002)(8676002)(4326008)(86362001)(2906002)(66446008)(316002)(6916009)(36756003)(64756008)(66476007)(66946007)(66556008)(76116006)(54906003)(91956017)(71200400001)(53546011)(6506007)(478600001)(38100700002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F3992FE1B0286F4D87C68DDD6BD36C0B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8029
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	143a1863-b7a2-48ed-5ee6-08dbcb222bf2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	exXSXiOhjfMY4A7BpAEETfWLCorp/79Q/FKO6fIzUHhFVNOM2jppM1JHvI25PtImqv9cjOcJYMkKQEd2IcSYHlJnk0cCgRcYGqIwXrwjDlidisiH43Xs/p/sRM9898LAahix3ADSrcfSMmDf2oiIUmToC1VAr1YXgfWgMHMi17bEvNkVw0x6+gW88RWM6iVyJaheLOqW8X0iVle58UofppGHfaCj20Yt8mBFcCgH5H6Loor+hiWl67Un5f3PraAqOnlheavrcINfjGkk8ExoGiXkFHNLL46rPtJvIl/BdDrgtxy/vP/SnAbDq6on2D4tebg2cRNsBU6s8poYk4bKrbL1WnXfah1/vrwtbcG70LoyuI+clEAyHg1jLY/DyJAZKrpVlNAqTMrH7pNOHFhD1Vw1+s+XRU4V0yWKoldvJb/j8pwLBr1SX6F/KgeTjJ5TEKNxxCbFx0hmUQJHrwY4cklsPgsRgBn08eRe9MfLGy1mqEzMiFqKmG4frJc2xMEn5XoaJI3WXcQlLO2fpx0ZVqLgXT2uOXWZof2dUnNaY9uZu+QFxCYp1Cc0LxAjO6LB5lnwpcoiRGSuGoGcbXfxpL+ASanhp+/n0BhrAT5Wddthsc8g1g8OURnnPUtJTfUu9rMIzcHdS2/4kzMr3ImTHMemq6dThaavfuT5ASZjKYj6PxpXwEiB4aQh4Zo89uxw1Hx1JGI7Hi7sDd/xgZrqbQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(376002)(39850400004)(230922051799003)(64100799003)(186009)(1800799009)(82310400011)(451199024)(46966006)(36840700001)(26005)(47076005)(33656002)(336012)(6506007)(82740400003)(40480700001)(316002)(83380400001)(54906003)(70586007)(70206006)(36756003)(81166007)(2616005)(107886003)(356005)(86362001)(36860700001)(6512007)(6486002)(478600001)(2906002)(5660300002)(6862004)(4326008)(8676002)(8936002)(66899024)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 12:53:13.4007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b25c4c53-dbc3-473e-782c-08dbcb223238
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5623
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 12:53:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188995

RmluYWxseSBsb29raW5nIGF0IHRoZSBjb2Rl4oCmDQoNCk9uIDEwIFNlcCAyMDIzLCBhdCAxNjo1
MiwgQWRyaWFuIEZyZWlob2ZlciB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8YWRyaWFuLmZy
ZWlob2Zlcj1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBU
aGUgbmV3IGRldnRvb2wgaWRlIHBsdWdpbiBjb25maWd1cmVzIGFuIElERSB0byB3b3JrIHdpdGgg
dGhlIGVTREsuDQo+IA0KPiBXaXRoIHRoaXMgaW5pdGlhbCBpbXBsZW1lbnRhdGlvbiBWU0NvZGUg
aXMgdGhlIGRlZmF1bHQgSURFLg0KPiBUaGUgcGx1Z2luIHdvcmtzIGZvciByZWNpcGVzIGluaGVy
aXRpbmcgdGhlIGNtYWtlIG9yIHRoZSBtZXNvbiBiYmNsYXNzLg0KPiBTdXBwb3J0IGZvciBtb3Jl
IHByb2dyYW1taW5nIGxhbmd1YWdlcyBhbmQgYnVpbGQgdG9vbHMgbWF5IGJlIGFkZGVkIGluDQo+
IHRoZSBmdXR1cmUuDQoNCkNhbiB0aGUgdnNjb2RlIHBpZWNlcyBiZSBzcGxpdCBvdXQgdG8gYSBz
ZXBhcmF0ZSBmaWxlLCB0byBzZXBhcmF0ZSBvdXQgdGhlIGhpZ2ggbGV2ZWwgbG9naWMgYW5kIHRo
ZSB2c2NvZGUgc3BlY2lmaWNzLiAgSeKAmW0gcHJldHR5IHN1cmUgdGhlcmUgd291bGQgYmUgaW50
ZXJlc3QgaW4gYWRkaW5nIHF0Y3JlYXRvciwgZm9yIGV4YW1wbGUuICBCeSBkb2luZyB0aGlzIHNv
b25lciByYXRoZXIgdGhhbiBsYXRlciB3ZSBhdm9pZCBhZGRpbmcgY2hlZWt5IOKAnGxldHMganVz
dCBoYW5kbGUgdnNjb2RlIHNwZWNpYWxseeKAnSBibG9ja3MuICBBbHNvLCBzcGxpdHRpbmcgb3V0
IHRoZSBjbWFrZS9tZXNvbi9ub25lIGxvZ2ljIHdoZXJlIGl0IGlzbuKAmXQgSURFLXNwZWNpZmlj
Lg0KDQpBbHNvIG9uZSB0aGluZyBJ4oCZZCBsaWtlIHRvIGVuY291cmFnZSBtb3JlIGlzIGRlY2Vu
dCBjb2RlIGRvY3VtZW50YXRpb24sIHRvIG1ha2UgdGhlIGNvZGUgZWFzaWVyIHRvIGJvdGggcmV2
aWV3IGFuZCB3b3JrIG9uIGluIHRoZSBmdXR1cmUuICBDb3VsZCB5b3UgYWRkIGF0IGxlYXN0IGJh
c2ljIGRvY3VtZW50YXRpb24gdG8gdGhlIGNsYXNzZXMgYW5kIG1ham9yIGZ1bmN0aW9ucywgd2l0
aCBhIHN1bW1hcnkgb2YgaG93IHRoZSBwbHVnaW4gd29ya3M/DQoNCj4gKyAgICBkZWYgX19nZGJz
ZXJ2ZXJfc3RhcnRfY21kKHNlbGYsIGJpbmFyeSwgcG9ydCk6DQo+ICsgICAgICAgIGlmIHNlbGYu
Z2Ric2VydmVyX211bHRpOg0KPiArICAgICAgICAgICAgZ2Ric2VydmVyX2NtZCA9ICIvdXNyL2Jp
bi9nZGJzZXJ2ZXIgLS1tdWx0aSA6JXMiICUgKA0KPiArICAgICAgICAgICAgICAgIHBvcnQpDQo+
ICsgICAgICAgIGVsc2U6DQo+ICsgICAgICAgICAgICBnZGJzZXJ2ZXJfY21kID0gIi91c3IvYmlu
L2dkYnNlcnZlciAtLW9uY2UgOiVzICVzIiAlICgNCj4gKyAgICAgICAgICAgICAgICBwb3J0LCBi
aW5hcnkpDQoNCklmIEnigJltIGJlaW5nIHBlZGFudGljLCB0aGF0IHNob3VsZCBiZSAke2JpbmRp
cn0uDQoNCj4gKyAgICAgICAgaWYgJ2RlYnVnaW5mb2QnIGluIGltYWdlX2QuZ2V0VmFyKCdESVNU
Uk9fRkVBVFVSRVMnKS5zcGxpdCgpOg0KPiArICAgICAgICAgICAgIyBpbWFnZV9jb25maWcuZGVi
dWdpbmZvZCA9IFRydWUNCj4gKyAgICAgICAgICAgIGxvZ2dlci53YXJuaW5nKCJTdXBwb3J0IGZv
ciBkZWJ1Z2luZm9kIGlzIG5vdCBpbXBsZW1lbnRlZCB5ZXQuIikNCg0KV2hhdCBkb2VzbuKAmXQg
d29yaywgYW5kIHdoeSBpcyB0aGlzIHdhcm5pbmcgbmVlZGVkPw0KDQo+ICsgICAgZGVmIHNvbGli
X3NlYXJjaF9wYXRoX3Jvb3RmcyhzZWxmKToNCj4gKyAgICAgICAgIiIiU2VhcmNoIGZvciBmb2xk
ZXJzIHdpdGggc2hhcmVkIGxpYnJhcmllcyBpbiB0aGUgcm9vdGZzIGFuZCByb290ZnMtZGJnDQo+
ICsNCj4gKyAgICAgICAgVGhpcyBpcyBiYXNlZCBvbiB0aGUgYXNzdW1wdGlvbiB0aGF0IHRoZSBQ
QUNLQUdFX0RFQlVHX1NQTElUX1NUWUxFIHZhcmlhYmxlIGZyb20gdGhlIGltYWdlDQo+ICsgICAg
ICAgIGlzIHRoZSBnbG9iYWwgc2V0dGluZyB3aGljaCBpcyB1c2VkIGJ5IG1vc3QgcGFja2FnZXMu
IEV2ZW4gaWYgdGhpcyB2YXJpYWJsZSBkb2VzIG5vdCBzZWVtDQo+ICsgICAgICAgIHRvIG1ha2Ug
c2Vuc2UgaW4gdGhlIGltYWdlIGNvbnRleHQuDQo+ICsgICAgICAgICIiIg0KPiArICAgICAgICBy
b290ZnNfc29saWJfc2VhcmNoX3BhdGggPSBbXQ0KPiArICAgICAgICByb290ZnNfZGJnX3NvbGli
X3NlYXJjaF9wYXRoID0gW10NCj4gKyAgICAgICAgaWYgc2VsZi5wYWNrYWdlX2RlYnVnX3NwbGl0
X3N0eWxlIGluIFsnZGVidWctd2l0aC1zcmNwa2cnLCAnLmRlYnVnJ106DQo+ICsgICAgICAgICAg
ICBpZiBzZWxmLmNvbWJpbmVfZGJnX2ltYWdlOg0KPiArICAgICAgICAgICAgICAgIHJvb3Rmc19k
Ymdfc29saWJfc2VhcmNoX3BhdGggPSBbDQo+ICsgICAgICAgICAgICAgICAgICAgICIvbGliIiwg
Ii9saWIvLmRlYnVnIiwgIi91c3IvbGliIiwgIi91c3IvbGliLy5kZWJ1ZyJdDQo+ICsgICAgICAg
ICAgICBlbHNlOg0KPiArICAgICAgICAgICAgICAgIGxvZ2dlci53YXJuKA0KPiArICAgICAgICAg
ICAgICAgICAgICAnQWRkaW5nIElNQUdFX0NMQVNTRVMgKz0gImltYWdlLWNvbWJpbmVkLWRiZyIg
b2ZmZXJzIGJldHRlciByZW1vdGUgZGVidWdnaW5nIGV4cGVyaWVuY2UuJykNCj4gKyAgICAgICAg
ICAgICAgICByb290ZnNfc29saWJfc2VhcmNoX3BhdGggPSBbDQo+ICsgICAgICAgICAgICAgICAg
ICAgICIvbGliIiwgIi91c3IvbGliIl0NCj4gKyAgICAgICAgICAgICAgICByb290ZnNfZGJnX3Nv
bGliX3NlYXJjaF9wYXRoID0gWw0KPiArICAgICAgICAgICAgICAgICAgICAiL2xpYi8uZGVidWci
LCAiL3Vzci9saWIvLmRlYnVnIl0NCj4gKyAgICAgICAgZWxpZiBzZWxmLnBhY2thZ2VfZGVidWdf
c3BsaXRfc3R5bGUgPT0gJ2RlYnVnLWZpbGUtZGlyZWN0b3J5JzoNCj4gKyAgICAgICAgICAgIHJv
b3Rmc19kYmdfc29saWJfc2VhcmNoX3BhdGggPSBbIi91c3IvbGliL2RlYnVnIl0NCj4gKyAgICAg
ICAgZWxzZToNCj4gKyAgICAgICAgICAgIGxvZ2dlci53YXJuaW5nKA0KPiArICAgICAgICAgICAg
ICAgICJDYW5ub3QgZmluZCBzb2xpYiBzZWFyY2ggcGF0aCBmb3IgYSByb290ZnMgYnVpbHQgd2l0
aCBQQUNLQUdFX0RFQlVHX1NQTElUX1NUWUxFPSVzLiIgJSBzZWxmLnBhY2thZ2VfZGVidWdfc3Bs
aXRfc3R5bGUpDQo+ICsNCj4gKyAgICAgICAgc3ltX2RpcnMgPSBbXQ0KPiArICAgICAgICBmb3Ig
ZGJnZGlyIGluIHJvb3Rmc19zb2xpYl9zZWFyY2hfcGF0aDoNCj4gKyAgICAgICAgICAgIHN5bV9k
aXJzLmFwcGVuZChvcy5wYXRoLmpvaW4oDQo+ICsgICAgICAgICAgICAgICAgc2VsZi5yb290ZnMs
IGRiZ2Rpci5sc3RyaXAoJy8nKSkpDQo+ICsgICAgICAgIGZvciBkYmdkaXIgaW4gcm9vdGZzX2Ri
Z19zb2xpYl9zZWFyY2hfcGF0aDoNCj4gKyAgICAgICAgICAgIHN5bV9kaXJzLmFwcGVuZChvcy5w
YXRoLmpvaW4oDQo+ICsgICAgICAgICAgICAgICAgc2VsZi5yb290ZnNfZGJnLCBkYmdkaXIubHN0
cmlwKCcvJykpKQ0KPiArDQo+ICsgICAgICAgIHJldHVybiBzeW1fZGlycw0KDQpGZWVscyBsaWtl
IHRoZXJlIHNob3VsZCBiZSBhIG11Y2ggYmV0dGVyIHdheSB0byBkbyB0aGlzLiAgRG9lcyB0aGUg
Y2hvaWNlIG9mIGRlYnVnIHNwbGl0IHN0eWxlIGFjdHVhbGx5IG1hdHRlcj8gIEp1c3Qgc2VhcmNo
IGFsbCBvZiB0aGUgY2FuZGlkYXRlcyBhbmQgYXZvaWQgdHJ5aW5nIHRvIHNwZWNpYWwtY2FzZSBl
dmVyeXRoaW5nPw0KDQpJ4oCZZCBub3Qgbm90aWNlZCBpbWFnZS1jb21iaW5lZC1kYmcgZXhpc3Rl
ZCBhbmQgZG8gd29uZGVyIGlmIHRoYXQgc2hvdWQgYmUgdGhlIGJlaGF2aW91ciBvZiB0aGUgZGVi
dWcgcm9vdGZzLiAgSXMgdGhlcmUgYWN0dWFsbHkgYSB1c2UtY2FzZSBmb3IgYSB0YXJiYWxsIHdo
aWNoIGlzIF9qdXN0XyB0aGUgc3ltYm9scz8NCg0KPiArY2xhc3MgUmVjaXBlTWV0YUlkZVN1cHBv
cnQ6DQo+ICsgICAgIiIiSGFuZGxlIHNvbWUgbWV0YS1pZGUtc3VwcG9ydCByZWNpcGUgcmVsYXRl
ZCBwcm9wZXJ0aWVzIiIiDQoNCknigJltIG9idmlvdXNseSBtaXNzaW5nIHNvbWV0aGluZzogd2hh
dOKAmXMgdGhlIHVzZS1jYXNlIGZvciB1c2luZyBtZXRhLWlkZS1zdXBwb3J0IGluc3RlYWQgb2Yg
dGhlIHJlY2lwZeKAmXMgZGVwZW5kcz8NCg0KPiArICAgIGRlZiBzb2xpYl9zZWFyY2hfcGF0aF9z
eXNyb290KHNlbGYpOg0KPiArICAgICAgICByZXR1cm4gW29zLnBhdGguam9pbihzZWxmLnJlY2lw
ZV9zeXNyb290LCBwKSBmb3IgcCBpbiBbJ2xpYicsICd1c3IvbGli4oCZXV0NCg0KJHtiYXNlX2xp
YmRpcn0sICR7bGliZGlyfS4gIFNvbWUgc3lzdGVtcyB1c2UgL3Vzci9saWI2NCBvciAvdXNyL2xp
YjMyIGFuZCB0aGlzIGFzc3VtcHRpb24gd2lsbCBmYWlsLg0KDQpSb3Nz

