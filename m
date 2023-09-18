Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D3BCD37B0
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 16:08:36 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.74])
 by mx.groups.io with SMTP id smtpd.web11.55760.1695053314845541349
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 09:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=KXm8JZ+J;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=KXm8JZ+J;
 spf=pass (domain: arm.com, ip: 40.107.104.74, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kGHAgyILK2suqzaqlWxL4IyGLXRH/65lap41P5F904=;
 b=KXm8JZ+JpaUGZ79EsW3W0XKrfZysnF8TdvKwTfpwVrQVSo0abyfkxbJ3hrb/JawGgYyIdzro4RFBmHLPHjikgtEXF/cvzOs/y9YY5SDwup9x1t26KZsO0EJkpBugGozVADgDLMo4bjRD/vS5Ew6WuKAQK6hw5/T9c194DGD/qoA=
Received: from AS4P191CA0046.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::6)
 by AS2PR08MB9128.eurprd08.prod.outlook.com (2603:10a6:20b:5fc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Mon, 18 Sep
 2023 16:08:30 +0000
Received: from AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:657:cafe::bd) by AS4P191CA0046.outlook.office365.com
 (2603:10a6:20b:657::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27 via Frontend
 Transport; Mon, 18 Sep 2023 16:08:30 +0000
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
 15.20.6813.13 via Frontend Transport; Mon, 18 Sep 2023 16:08:30 +0000
Received: ("Tessian outbound b5a0f4347031:v175"); Mon, 18 Sep 2023 16:08:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a7b3aa632c999423
X-CR-MTA-TID: 64aa7808
Received: from 9280b88675f0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AD688592-1CAE-4179-A268-BE85B3C1DE64.1;
	Mon, 18 Sep 2023 16:08:22 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9280b88675f0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 18 Sep 2023 16:08:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HWb6bBjHYkYX316lKzIgUo6srvHJDWduLren3+yJVgeWOMiUm7SCYyRQQNNxO7Sa9RDZLEqH2d33XErdjUJw45zT0nsrdWwzHSaeTJr+giMIHdM+VKq9/2SK3oXUdls/Jy4j7Wuv2vqgIsP4Aqj4L8eJkjdLILuVz0EUuCjRrdD66mIBZUGKHyo6AJfyFdQkhejacHwg3U/otwsrMM0IyVImu46ojs6HZWcX2dq+hHCjKr70zGTJbJEO0juorvz6l2l6RXYOXRvXkutwuIYUQI0HGnavZwdxl41Y1X/hZU4vXuQIi+qrAzJN+u8iXxqTt/cfBf3P/QeK20MifyA4zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kGHAgyILK2suqzaqlWxL4IyGLXRH/65lap41P5F904=;
 b=LuhvbaQzP/YHChDW/5nmWgiUQs1A3fAmSDpbri3asbU2SO7XbxwWSLXUhjCkHUIbWMkic/Rs05hpGNQcUaPVleYL593ucBAceEvZ9kca8H+ajXyDsVraoSMtd7eD3WDOKZBa6Ghae8AIbzlUhaKKVBtd24wIoLD4qpvvx4Rxl0y/HHhXYSkZdix65HAaiNuMZfXqVqeNYhZOmpXZYkEGMkv8a2G6xmyyzniLDL6YG+QLKFSQXLZSWhBsj2yS2DjM2m8z7CAoD//VNe8EvUXj5ZgSbOmu18S1w9W6RqrUQaICzj6d1bsVut2eq20Afaj1U6Twbz99J1MV2s8l7M+RUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kGHAgyILK2suqzaqlWxL4IyGLXRH/65lap41P5F904=;
 b=KXm8JZ+JpaUGZ79EsW3W0XKrfZysnF8TdvKwTfpwVrQVSo0abyfkxbJ3hrb/JawGgYyIdzro4RFBmHLPHjikgtEXF/cvzOs/y9YY5SDwup9x1t26KZsO0EJkpBugGozVADgDLMo4bjRD/vS5Ew6WuKAQK6hw5/T9c194DGD/qoA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB9382.eurprd08.prod.outlook.com (2603:10a6:10:3f2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Mon, 18 Sep
 2023 16:08:19 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 16:08:19 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Steve Sakoman <steve@sakoman.com>
CC: Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [mickledore][PATCH] gcc: backport a fix for ICE caused
 by CVE-2023-4039.patch
Thread-Topic: [OE-core] [mickledore][PATCH] gcc: backport a fix for ICE caused
 by CVE-2023-4039.patch
Thread-Index: AQHZ6BU0duFFuuPDT0OgIJA6icxDsLAgvwgAgAAFbgA=
Date: Mon, 18 Sep 2023 16:08:19 +0000
Message-ID: <DC0F0107-7850-4099-A201-6F6C1DB5D0CB@arm.com>
References: <20230915204234.3547739-1-martin.jansa@gmail.com>
 <CAOSpxda40yQJrJCXhS-rtQ9T89auc52zwibD6qjCWYKSLZfB5g@mail.gmail.com>
In-Reply-To: 
 <CAOSpxda40yQJrJCXhS-rtQ9T89auc52zwibD6qjCWYKSLZfB5g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB9382:EE_|AM7EUR03FT060:EE_|AS2PR08MB9128:EE_
X-MS-Office365-Filtering-Correlation-Id: d2b2ab21-4a11-47c3-458b-08dbb8618019
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 G7xalmnORZAN51wXJG0589Qd5yiQYy0CIPiuzkBZLEwkMIpdxTXyGcDOgzmKxOjGRQyBwDxDTcZPWlGRIsZZcg3em2ew9JgGSoAGowcSBynacUK38+uUqH+IzAVXMoz/f+0t/ZkTH/dkO1e2NKwlPt30KnYuZsEySSLEmhhlmzRfMBOUpq3hVxTxJHhNL30s1cgpL1u1GT0mA8Q8AI3l+RheHxCOMyZ4v1McagL4GzXLHC25lSAQukFT/fYxh6V5DGWAGU/7v01nysxwl5jTpnDM+66Ih3rDi5WXmD39R5Xen4Uixb0uZZ1dHIu8i5w3IrE6OVo06oggzljVpiH3hUX6SVD/NkxPfxPmovNA81rWmyz4ENZ+kv5LurGUSuth4ZfEICwULhEkPDHJCPmX/9rgYG4UZxb/XpYwy0oz8IqIuNIUHfhqMy3K4/PMqXUa1iBoF7Oe4xH+MroOnbptnL0iHu2RKGz8PCPnsykec5twZrSbs7U8nRi1Ss7GHEQ9sABzI9Dw9vgNaAaPS6YzKnFXANBzQW6MvyTacUsLx8Ki+3BYP5jsMqh0kmFa4SdWXmgqaIQc7cOAc4SmIInSm5N1FMgg/rIjy3Jtgq/mLTldCpXde5UtaYIm7Lxqx/Apc8Z2a6GLzIvk2x/zmsqjgA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(366004)(346002)(376002)(136003)(451199024)(186009)(1800799009)(66446008)(41300700001)(2906002)(38100700002)(71200400001)(38070700005)(122000001)(33656002)(6486002)(2616005)(478600001)(53546011)(6512007)(6506007)(26005)(66946007)(66476007)(76116006)(64756008)(6916009)(4744005)(91956017)(316002)(36756003)(86362001)(5660300002)(4326008)(54906003)(66556008)(8936002)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <32D5CA925AD9AF40950AB691DBAF6CFC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9382
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7c85164f-98cb-4e36-b549-08dbb86179b3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WLQhl2lMWhP7bVYuD7BtWxuc7DcKNSZsMwVBRc8nBKdQ8rlNkHj5BWfuBJoMtZvFqlEOkqzX7D1DPqqlGLeG/1ja99riapzP+/qKYZxwPvVGxOTYWGwtxH2V9dpnZ0VNA9MXAQNuvUrCwVRnm1U3MzC72dYaG01AqbwCRTJc4d+ZKzXMuB+KMwFM/TZA84Z3fB0wBIxQ6kO04Wh/bN1X1MaFKZP3rarZtGdvvjMsSK8auR9esVC/gNHl37JkomJ/vRoPQ41cWiTxnJYL5z6oWBnQZb1pNdI8NRXSroDDRk3spq0eoRiwog23+a5CETqsZo4jvNW/0WAzSaG1t0a9+rqsqAYeDGJ7NdK1n9bCu8eRvOTm66ozJa3PPna2IdrvddiUNnUMjolYiTveMU7+4Zq6ADQCFEWo5uzdMuqfDpb6bzPlhlnXyB6rP4xI75p/CEZDhIZzGGudwAhq+jmHooXPXjTHoVTCOrKU1leXiVT8R+6kdGb1cTf5z0XuykNEx519z1ASZJPfvB2d1Jk/IHcgRCjmhX7XhZwCNdIpRr6U5R2o9AAfdQ/ZEM1V3qYrsIhXaiTD3V9tVxun3BQWkpXM3WK++FIGW7O/NMWMV4MA5I2gGbJUMJ08Wh17Zhxg09OowL7ia3jJeoInYGk1U0joC3k3lOwo7MeyGbFgmvJpZTVrbP2UvNMUFPWd4gioVhtKPm3AvoOgD7OBSZrtTkdiOclff873zgM7E4RxHSFQPFCIDmKI0B8SfqB8TlhP
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(136003)(346002)(1800799009)(451199024)(82310400011)(186009)(46966006)(36840700001)(40470700004)(6506007)(40480700001)(5660300002)(6486002)(41300700001)(81166007)(356005)(6512007)(316002)(36860700001)(40460700003)(47076005)(4326008)(2616005)(70206006)(6862004)(8936002)(336012)(53546011)(70586007)(82740400003)(54906003)(26005)(2906002)(4744005)(8676002)(86362001)(36756003)(33656002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 16:08:30.2910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b2ab21-4a11-47c3-458b-08dbb8618019
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 16:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187835

T24gMTggU2VwIDIwMjMsIGF0IDE2OjQ4LCBTdGV2ZSBTYWtvbWFuIDxzdGV2ZUBzYWtvbWFuLmNv
bT4gd3JvdGU6DQo+IA0KPiBUaGUgQ1ZFLTIwMjMtNDAzOS5wYXRjaCB3YXMgYWxzbyBzdWJtaXR0
ZWQgZm9yIGtpcmtzdG9uZSBhbmQgZHVuZmVsbC4NCj4gU2hvdWxkIEkgYXR0ZW1wdCB0byBjaGVy
cnktcGljayB0aGlzIGZpeCBmb3IgdGhvc2UgYnJhbmNoZXMgdG9vPw0KDQpUaGUgYnVnIHNheXMg
dGhhdCB0aGUgcGF0Y2ggb25seSBhcHBsaWVzIGNsZWFuaW5nIHRvIEdDQyAxMi8xMywgSeKAmW0g
c2Vla2luZyBjbGFyaWZpY2F0aW9uIGFzIHRvIHdoZXRoZXIgdGhhdCBtZWFucyBpdOKAmXMgbm90
IHJlbGV2YW50IGZvciBvbGRlciBicmFuY2hlcyBvciB3aGV0aGVyIGEgcHJvcGVyIGJhY2twb3J0
IHdpbGwgYmUgbmVlZGVkLg0KDQpSb3Nz

