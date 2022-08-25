Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D15C04AA5
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 12:13:39 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.47])
 by mx.groups.io with SMTP id smtpd.web11.23097.1661429610769767370
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 05:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=Sy3Q5Wxa;
 spf=pass (domain: arm.com, ip: 40.107.104.47, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=a7+xwHQMWIkuRkcz3lOB94rhsL4R9fv4RiI0Z9hrOigcOuPhuSOHy0EhRMWjEbJK6qRp2DkZwvM2Td1HOCLiCvAnjLSI9/CMB4la6mmhLljA2TrDT8CyC933P8QuV/1ZaJG7jm2SENjQrW9WZ+6DY9/V7XNys8eJkXUCKSWki+iiFZ7D9bfPLhMjL1EtMIGxrH8T048c/q/NuS3Ed6xWhz62a1wMBqyJAy11D1I361Vs8q8QmeTXlAqMHroomBbBrTyms+MI1Gesw3LyS6DnksXgI6anhBCyKE6lRO4DkX7b2o3SXNJFv5+vhMjXAYPat5Te8izM6k5TP3kj9xyJng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZX537CC6TSHMXHbaZNOgIAtu3rz0bokC9JZ4ULOOEI=;
 b=hYmPMYzRLqPowsfCnVDSZt8Y7QQFgNlki0cXP7j2DP9qYOZOfArrtHiiX2wySJPbByVCqyWTLgc04CJPLAAcZCLxvlvXggyKc3SPvemhHCfToXBm3pWId2Kv9YH4JTlEJnbxZjGOlKrsa6Yr4+VkOF8UWgp4tgClbyodCCAn+DFWpSCa0nURDXYMuEpbuWYJcL2PTiXWoWDrWUiuNmO4CMOecEify0IsFGlfEVpGzNUoK7mxCrF3OF/Xj3x6NAAsCzkvjVkzdK+A+tPG732x23He0Vkwi4VYPaluNxbh+uq/2BW51o7+nW/ggXPs93VDRWipYkf04+p4M/l4vSwfFQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZX537CC6TSHMXHbaZNOgIAtu3rz0bokC9JZ4ULOOEI=;
 b=Sy3Q5WxakVbGmGjzV4XhMX+f6nWAwzkVjq9RsYd4OWddUtmjZ/gSvMXHiHUnvo7fX4wEV90kDqGlq2VtiZcvYeodPZAzVQXJ3hmumYu6yRJTJPQ6SWE10q3O0tHSDq5omAjQXZCzsFl71VjVyQU1zsyybh0ZuHz9bibIZPlSmZE=
Received: from DB7PR05CA0009.eurprd05.prod.outlook.com (2603:10a6:10:36::22)
 by AM6PR08MB3015.eurprd08.prod.outlook.com (2603:10a6:209:43::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 25 Aug
 2022 12:13:26 +0000
Received: from DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::f2) by DB7PR05CA0009.outlook.office365.com
 (2603:10a6:10:36::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Thu, 25 Aug 2022 12:13:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT060.mail.protection.outlook.com (100.127.142.238) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Thu, 25 Aug 2022 12:13:26 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Thu, 25 Aug 2022 12:13:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 40704be24c6753fd
X-CR-MTA-TID: 64aa7808
Received: from 6013b0ee9ac9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5802DF7C-2AD3-4F76-8065-8764A4CF5785.1;
	Thu, 25 Aug 2022 12:13:20 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 6013b0ee9ac9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 25 Aug 2022 12:13:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VwnZKWsKr4CJQwPwePjjoAT0DGEnyOQwRIrFMl0bVnIpS0ESPsDqyYHr8oFATqAZ9rKdTznqlR2DvdCWr0V00KLxYzwWa6QZBCggpZeopihOMITm/ONGBTMyzMBbB1a0bDe/0hZH0jMQ6OIs0AUEnAv20r9Spgbe+QWBQSRm7P5hmHCNjzBAjpfm22IJgAIeW+VRvG7e6zpTnEqbnDbO0FUpN69flx7Yb9xbWga5aMIJnGT5fjJw/BxxRGVUg4WolJbsbYWCwhwUO44k0grMvgR/1Qa/CezYOZtvUqqxal0q45pGykvnOB2oKHA1M0mtz51xelhCto4ZORPN0+alEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZX537CC6TSHMXHbaZNOgIAtu3rz0bokC9JZ4ULOOEI=;
 b=bIUI7/JxTK42V5XhJJffbwMbcwn6EOeKa6Om4RlXIAwIaouUpxdAaShn5/x+AqhDY07R7VHO98zI810jFMtQ8mxH0eKdTuitNXfRJFMYIHWoXTf838Y0utcXJpQKDA3Au6j99KLnEp42ncLdneLjj8hDjPq3qqR5xurh/oz/79if7dkW/OyBQExHVaRUXHhigVnsArygfo88P3Q/l4BbaMqXCh5AqR3uyFimsVgB083nb1KghnudyIeav8nfVSFs2sltV0DwWvqSO28FUIiha8gd68+23KWEIvZLPauvxjgcCiplcZkos3q31ZorPm0S4+mR01++BFOfvjjoWmwvZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZX537CC6TSHMXHbaZNOgIAtu3rz0bokC9JZ4ULOOEI=;
 b=Sy3Q5WxakVbGmGjzV4XhMX+f6nWAwzkVjq9RsYd4OWddUtmjZ/gSvMXHiHUnvo7fX4wEV90kDqGlq2VtiZcvYeodPZAzVQXJ3hmumYu6yRJTJPQ6SWE10q3O0tHSDq5omAjQXZCzsFl71VjVyQU1zsyybh0ZuHz9bibIZPlSmZE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VE1PR08MB5693.eurprd08.prod.outlook.com (2603:10a6:800:1a5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 12:13:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6cbd:62ea:4be4:aa4c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6cbd:62ea:4be4:aa4c%9]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 12:13:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "quentin.schulz@theobroma-systems.com"
	<quentin.schulz@theobroma-systems.com>
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>, Markus Volk
	<f_l_k@t-online.de>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] connman: add PACKAGECONFIG to support iwd
Thread-Topic: [oe-core][PATCH] connman: add PACKAGECONFIG to support iwd
Thread-Index: AQHYtw7JZpQjYBJKpUuU+tsmFPy2Ba29wCwAgAAAoACAAA8nAIAAJsMAgAGTSAA=
Date: Thu, 25 Aug 2022 12:13:18 +0000
Message-ID: <DA37D0FA-FD05-4A88-82D1-F42B46001BA3@arm.com>
References: <20220823163809.17214-1-f_l_k@t-online.de>
 <20220824105440.1cdf49a7@booty> <UI34HR.PZNATSOSGVWO2@t-online.de>
 <20220824115108.6eee852c@booty>
 <6bf395b5-864f-4d2d-8fe9-fb05cbe3940e@theobroma-systems.com>
In-Reply-To: <6bf395b5-864f-4d2d-8fe9-fb05cbe3940e@theobroma-systems.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f997a476-a8f9-4df3-dd51-08da869336c1
x-ms-traffictypediagnostic: 
	VE1PR08MB5693:EE_|DBAEUR03FT060:EE_|AM6PR08MB3015:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 V+Q+GEoGghI7PKaKkXWcMe1MSg0r4d4QvTp82qYBO+N9KcFD0CazVOkSCLq2jhTyoNb0Dc74ikdbRS3ouZRsa4o5/vxNyPhqsgiE74H+7sXuHjiBlEeNymVY8k3tCMgnoFVvUFks2LHavpZ842KUotRi2kRaq0etFHEaAPuLLwS5NQPaKU1CFamufMOAQuSSd3XLCfTgePSrsG/NVxtby+da/pSOnI0PbRMCBejHnw5im+zPieSW3YllWLmS2wioRMPzBWDnXX0/HOwFwDU1XOmAytsKBQuYuIcLgipkgwaCpqqjxF7H9n33IIeFMn8nt8VoQdFUbxl89f/rJA0OVDW/f1c/SH8GQ77TKZQ+C+jlPApzr1Zk3HNaTEXEDcH5J6hT6i+Nb+b7mozH/XX1V/E6Nhaw6nGuCZJF52/E0TaleGk8bm2KbJ0fxHfg0+HpdvST6odWezHk3H5OMlH9UF86LlqlmAXd6eMdfSoi8VT9M6fpnm7hTT5AHYCWUWhUaePfYbTCSzkNrm6gPBBfBM2qqSixX2JarJA1pKHUAOZ/MzoLWSsBpqHqE+K9LfxUUbEDqxSIKDOfRuV7njK9vXi2jcSh77GmMP0C3lZhL5/a0RuW4NZuBVNsbDiOLbiMkyWzB/b5gE2onO1N4BX1QKcESMlfIRNtO+DWjCMldmlKgf7moDKdVeV/DzjIgzOKYx0hC42vkBE3++vrRpODh6EFLmzq9RDSgKKigTIONvr2S4qIO6BU5tGO8Pl3rATOdp3G4CBQq+5fBsYGIQvuryhLAy2wMgQawvDKI4oB7Zg=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(2616005)(6486002)(478600001)(5660300002)(122000001)(71200400001)(38100700002)(33656002)(8936002)(36756003)(2906002)(6512007)(41300700001)(316002)(54906003)(6916009)(53546011)(86362001)(66446008)(186003)(38070700005)(26005)(8676002)(91956017)(6506007)(64756008)(83380400001)(4326008)(66476007)(76116006)(66556008)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F1B56515DD147439595D034EA423353@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5693
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	098ac651-26a5-42a5-16a5-08da869331e7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AMHKzlYBVkaJiFXKQONMkjUobYDcjoYDiZLE99V19zYn5ZHvfgDE2BvmjmjGpIu7FTapwPkzCZcc694GR9/TokAF5wUTE0WOz79aPLUiEei1UV9UygjNhGHs6mGKAMm4t0OqQfMeQMwNbjUjLnAbNlEQOTeSMu5Yi/ZaYJ3/19XBIi5aXkDTxnBmiQENKrgcMSZjjFHAHMSEoHOy1qzs/Fhhzks7suCk+JEdA/gRof3KFh/DY8fnmAwzV6vj36xMa6bXTkqE/HAuT/2QjJ1Y8ymEQpInl7Rj26SIyQYL+h76LNiwpR49jlPIA6ef44HfO06WLskeeIwNaQ9VZ2znwHBAjTxDaIjw1Y06vsOuMN9figbDevBvU/E0I/LctJTb7foe5J1XjH5UrE+/dt1oTvAhj/yw2+0be6nxBjvPkaMlYfiWLvM4faZ6QgqW9gugCB4ZQxTXzkXH+BnBXqKIY//NcXVMmzuBzjWH7v1OjVk0o00Ma26mK1cZOfrhof8CDyRFWa+XBMJcpEboUG+B5EDCp+1RZfRUfeJHZhBGcnO3zCj4YtkdrHR4sx6AsSiOA3RyH4FlueOjtmP0LSxG0WaG3xt8+JC5LRnPO/VR3YPUSAEdIyCZb1WsRkL/8k6i8wixl9TD1nyOWvALdFCrgt/DeK29dmcW5h5BlGQthrNMReo4p4yf+kafw89TqKi82y2gIqeglyYZYwz3IzedlNJUt3iaYI+Ub4jFaxXHGxP+m6Mq+0mhCbgOuks2iLJVWvi9gyvdSh8EOdswp1kZKg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(346002)(136003)(46966006)(36840700001)(40470700004)(47076005)(83380400001)(356005)(33656002)(336012)(26005)(2906002)(6512007)(186003)(2616005)(53546011)(40460700003)(81166007)(6506007)(82740400003)(36860700001)(86362001)(5660300002)(82310400005)(40480700001)(8676002)(316002)(70206006)(70586007)(4326008)(41300700001)(6486002)(478600001)(54906003)(36756003)(6862004)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 12:13:26.3335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f997a476-a8f9-4df3-dd51-08da869336c1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 12:13:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169856

T24gMjQgQXVnIDIwMjIsIGF0IDEzOjA5LCBRdWVudGluIFNjaHVseiB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8cXVlbnRpbi5zY2h1bHo9dGhlb2Jyb21hLXN5c3RlbXMuY29tQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiANCj4gSGkgYWxsLA0KPiANCj4gT24gOC8yNC8yMiAx
MTo1MSwgTHVjYSBDZXJlc29saSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4+
IEhlbGxvIE1hcmt1cywNCj4+IE9uIFdlZCwgMjQgQXVnIDIwMjIgMTA6NTY6NTQgKzAyMDANCj4+
ICJNYXJrdXMgVm9sayIgPGZfbF9rQHQtb25saW5lLmRlPiB3cm90ZToNCj4+PiBIZWxsbyBMdWNh
LA0KPj4+IA0KPj4+IEFtIE1pLCAyNC4gQXVnIDIwMjIgdW0gMTA6NTQ6NDAgKzAyMDAgc2Nocmll
YiBMdWNhIENlcmVzb2xpDQo+Pj4gPGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+Og0KPj4+PiBJ
IHdvdWxkIHRoaW5rIGl3ZCBzaG91bGQgYmUgYW4gcmRlcGVuZHMsIG5vdCBhbiBycmVjb21tZW5k
cy4gQW55IHJlc29uDQo+Pj4+IGZvciB0aGF0PyBPciBpcyBpdCBqdXN0IGFuIHVuaW50ZW5kZWQg
ZXh0cmEgJywnPw0KPj4+IA0KPj4+IE9ubHkgcmVhc29uIGZvciB0aGlzIHdhcyB0aGUgZmFjdCwg
dGhhdCBpd2QgaXMgbm90IGluIG9lLWNvcmUgc28gaXQNCj4+PiBmZWx0IHdyb25nIHNvbWVob3cg
dG8gc2V0IGl0IFJERVBFTkQNCj4+IEkgc2VlLCB0aGF0J3MgZmluZSwgYnV0IEkgd29uZGVyIHdo
ZXRoZXIgdGhpcyBzaG91bGQgYmUgY2xhcmlmaWVkIGluIGENCj4+IGNvbW1lbnQuIEknbGwgYmUg
dGFraW5nIHRoZSBwYXRjaCBmb3IgdGVzdGluZyBhcyBpcyBhbnl3YXkuDQo+IA0KPiBJSVJDIHRo
ZSBwb2xpY3kgaXMgdG8gaGF2ZSBhIGRlZmF1bHQgY29uZmlndXJhdGlvbiB3b3JraW5nLiBJdCBp
cyBmaW5lIHRvIGhhdmUgUEFDS0FHRUNPTkZJRyBvcHRpb25zIHdpdGggZGVwZW5kZW5jaWVzIG9u
IHJlY2lwZXMvcGFja2FnZXMgbm90IGluIHRoZSBzYW1lIGxheWVyLg0KPiANCj4gSGVyZSwgaWYg
c29tZW9uZSBidWlsZHMgd2l0aCBOT19SRUNPTU1FTkRBVElPTlMgdG8gaGF2ZSBhIG1pbmltYWwg
c2V0dXAgYnV0IGhhdmUgaXdkIGFzIFdJUkVMRVNTX0RBRU1PTiwgY29ubm1hbiB3b24ndCB3b3Jr
IGJlY2F1c2UgdGhlIHBhY2thZ2Ugd29uJ3QgYmUgYWRkZWQgdG8gdGhlIGltYWdlLCBpdCdsbCBi
ZSBhIGJpdCBoYXJkZXIgdG8gZGVidWcgdGhhbiBhIGJ1aWxkIGZhaWxpbmcgYmVjYXVzZSBpd2Qg
cmVjaXBlIGNvdWxkIG5vdCBiZSBmb3VuZCAoZXNwZWNpYWxseSBzaW5jZSBJIGFsc28gZGlkbid0
IG5vdGljZSB0aGUgYWRkaXRpb25hbCBjb21tYSkuDQoNCkV2ZW4gd29yc2U6IEkgY2FuIGVuYWJs
ZSBpd2QgaW4gY29ubm1hbiB3aXRob3V0IG1ldGEtb2UuIEFzIHRoZXJl4oCZcyBubyBERVBFTkRT
IGl0IHdpbGwgYnVpbGQgZmluZCwgdGhlIHJlY29tbWVuZGF0aW9uIHdvbuKAmXQgcHVsbCBpbiBh
bnl0aGluZywgYnV0IGNvbm5tYW4gZG9lc27igJl0IHdvcmsuDQoNCkVuYWJsaW5nIElXRCBtdXN0
IFJERVBFTkQgb24gaXdkLg0KDQpSb3Nz

