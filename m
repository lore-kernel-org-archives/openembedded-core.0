Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F3E9C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 10:30:24 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.58])
 by mx.groups.io with SMTP id smtpd.web11.8738.1707820222676920925
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 02:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Fu14t6wl;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Fu14t6wl;
 spf=pass (domain: arm.com, ip: 40.107.14.58, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mKqWodyJ5mmcLhRjrnrD151CDwL7pc3t+W4Wf/5/EUdh4ijjpMUAcuB56q69CLffYB9Hi8I1Bt3oRqH+XL8fpuHY9H3EXbPmYhWIxduQz0TAhmFH7ODSQVlbDKgJITF4p2uW8eh/MlyetsyEw6N1Hw0nesysYcH6kQ7DybR51lzUL0CwSdbOx0EGpL8RVCTZW1n2fC61KtDsHQr0Bmo+WdN+vTwOY2lyLSLOjEBaLw3NYvCxMhVaF/fP3WEKuns8vHmow1UZUonwHasTzeb6S65m5dIFA64mKz9IEeIhs8L1sKkxNfQhNrQBmnBsBjZWT9KTjdgANKeo+Ugi6Ell3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+z+8m4309RPSsufS/Wnnk4mkvDp6T4TzD+cWk4yFuw=;
 b=mZuDE8mJAd0vDOVnM91IzHTt0d6iMOvKcG4p+tm3v3qi2rLRcm4wv2vtQcbnknSBLe+W5+i/mTJFJnDE+xEoF9W7zU6jL8yJXsCeihsjq+AR+6LqayJU73KxZ1IDBNIdaxGqRcqNuVqNhiAo4US8/8Ja8/3fDyLifGle3LcfTSi1qoWoOHYdgkG9GtzOkMo1nqz8rb7lXWkxPV+66+g5IgaReHrnbf1ASxbLl1g75dxmTuYQUJYhf5Ynepe27PBlnuqYe3EMPvrjrFfFb91BR4GHqvtU1nvO7+vxtSYbPxntgQoPFbo6kmO4vAcXaSLY6SVvH3kpq3LnxhLrl4P7qw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+z+8m4309RPSsufS/Wnnk4mkvDp6T4TzD+cWk4yFuw=;
 b=Fu14t6wlmyf0SWT+23ythdxDH4yesFOHv0Og9S9z6xM8On84s2XssL77oXf6lRewqXbp5f0eqZuuID1lo7GqVkRROju+X0S2629Cbzr58w2IdfynbZwC2t8jKOCKwKXIbdVnloOjAXeg/4axyAAZimJZ7kFXbjd6sEdf2IK61Bc=
Received: from AS9PR06CA0269.eurprd06.prod.outlook.com (2603:10a6:20b:45f::32)
 by GV1PR08MB10732.eurprd08.prod.outlook.com (2603:10a6:150:160::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.33; Tue, 13 Feb
 2024 10:30:18 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:20b:45f:cafe::b5) by AS9PR06CA0269.outlook.office365.com
 (2603:10a6:20b:45f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Tue, 13 Feb 2024 10:30:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 10:30:17 +0000
Received: ("Tessian outbound a297577ee0df:v228"); Tue, 13 Feb 2024 10:30:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 19fe8d0d247a2c45
X-CR-MTA-TID: 64aa7808
Received: from f0dde8bbcd64.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 349D2CAF-497D-43D3-A2AA-E45C6D97BE69.1;
	Tue, 13 Feb 2024 10:30:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f0dde8bbcd64.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 13 Feb 2024 10:30:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7QCf0MpHO/YOQdE6mu12APFMDDuN8ak1juuGOAEj+TiEfuvrJU4uA9Uyp7rUb1jkP99fyjrG2l2DPQOkbLg8v8lGMeDEmxUTaE3GFvOGBCNtc9Z87/CO5hW8Z/1b4eM1wsgVOnQRXvv1kD+fq6Mz9vomT8obrWl7tFDDr0oXTBud9nUBvGop4IUvKlkZZiK34aDcq2BJPbqxIrDzrUawTdFTlS9XgZboBV4lRBRer59KyChXImBRy1jYZ4Ql31HZjsYtvAGRGmecJ+u1CcBYhv0zy6xMZMMijXaU2RZwYi5d6BYutJFVNGKYZNzkfvPpWDfR4XeuK1NqjlMZhvrqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+z+8m4309RPSsufS/Wnnk4mkvDp6T4TzD+cWk4yFuw=;
 b=EhC0xrYqz/zgpWuJa7/BmXJYiqmPwFCg29xCEhVtYlvF3gWjxQor6y6KwNoXROiZNadWZAZBlgeYeMj0lAeMnrMDj1nVCU7VZMz+Ob/xTZwo1K8KbulFQOuPwGvCunz3J/QTm5WSddvviJtF4tEm6Camy15pMP+z5PfrsdBvhb3svJCxbXAC3ymupd+qEMw+nGofeMtAc5LNAL/3Hqei8qvRTwz71EOVMKvS4T2P/T98rvBgGPOHQWTpzhIMfiawT4byXSOiGeILsrViJyAP3f2XMaEaAsVYGZx2r5UcJI8vA0cz7WAB6x70OG6lcmU6Xbo7CKtV0PkUIDHX96ZFyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+z+8m4309RPSsufS/Wnnk4mkvDp6T4TzD+cWk4yFuw=;
 b=Fu14t6wlmyf0SWT+23ythdxDH4yesFOHv0Og9S9z6xM8On84s2XssL77oXf6lRewqXbp5f0eqZuuID1lo7GqVkRROju+X0S2629Cbzr58w2IdfynbZwC2t8jKOCKwKXIbdVnloOjAXeg/4axyAAZimJZ7kFXbjd6sEdf2IK61Bc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7414.eurprd08.prod.outlook.com (2603:10a6:10:352::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Tue, 13 Feb
 2024 10:30:03 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9%3]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 10:30:03 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Vikas Katariya <Vikas.Katariya@arm.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, Tim Orling
	<ticotimo@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] bmap-tools: Add missing runtime dependency
Thread-Topic: [OE-core] [PATCH 1/1] bmap-tools: Add missing runtime dependency
Thread-Index: 
 AQHaWeYXNvfmgW4Y10KOjUHheJtUM7D/0t+AgAJrVgCABL+OgIAAA8aAgAD/PgCAABqWgA==
Date: Tue, 13 Feb 2024 10:30:03 +0000
Message-ID: <D58CC9BB-8403-48E4-AB7B-0C346DEA2CF4@arm.com>
References: <20240207165219.825246-1-vikas.katariya@arm.com>
 <20240207165219.825246-2-vikas.katariya@arm.com>
 <CANx9H-BnSFGhJLCWgof7mCLfTPMBWn9rdVRYb2vtuoTnmAWc-w@mail.gmail.com>
 <c5fc39dd2e0081a621b8e8568c18dec188bdbf2b.camel@linuxfoundation.org>
 <FE02D4E8-A5D7-4C9D-B673-2219E20E04D5@arm.com>
 <1e5e0f9b95767fd27729893ca22a5b2687fab0a9.camel@linuxfoundation.org>
 <AS8PR08MB6789B72B529095D6FA0BFCA19F4F2@AS8PR08MB6789.eurprd08.prod.outlook.com>
In-Reply-To: 
 <AS8PR08MB6789B72B529095D6FA0BFCA19F4F2@AS8PR08MB6789.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7414:EE_|AMS1EPF00000048:EE_|GV1PR08MB10732:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a460b42-9ae2-46ac-ac31-08dc2c7ec5c1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 OHBKIuBBy1DFKTQ9ssXbSJzhx/vH2r+9sKIXdmljvto1oQYCwdNMdt5NQSRP+kLqrZpDUF9p8+spnqVsdA3sLmJ5T2xYB3XEJJe0TBiVfkDGUWBMNmY+JmAwzE8wcDkL2EE/gG8j5LeEPy+REJsW4z0ybW4mxOUEC+oRqDMvwNYlOLBR1nECFhnrhYXO4nmPDTCHVmrhxT9nJOyEUOCv80W5yX9ZCo9jIhKoUbkhT2y/4W9/1u/ugoq+7f0f4FZD3Rcs0UCi28QLNs6sfZAfud/93o7KU024gUVxGSE21q1piEr4ObD510fAK7oeYaD7B6lMuJvQzOARYotnfwhXcKMCuAWFEcSYgrO1iY1O6LU8u7liTPp3wL8J8WZlcWtsV6fOKoRKFr5tmEI1w3FwrPe9FUO4mplU56gAGvF3pz0p1kf/XolZw6yyIVvzzBOeMJAGIcZ6TLhMlsoXE1RYgrdDxRalQaJsgJGWyISr2tKIdpL/DEM53lU9MkH8Lbk/7Oyq2Q0WUb3X2gyWir1hr0bQgEiZji/N0XfxAk72BrN4EBeWp71AFcaHPL3uM14nzynjrl2Y6ZElCAQoxTfer/NEtL/M5bi6dgopzwJKZ486jDvDGpC19dVgZwkZiW/2
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(396003)(39860400002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(2906002)(33656002)(558084003)(38070700009)(6512007)(36756003)(6486002)(6506007)(71200400001)(37006003)(316002)(54906003)(53546011)(6636002)(76116006)(41300700001)(2616005)(66476007)(4326008)(6862004)(66556008)(8936002)(8676002)(64756008)(66446008)(26005)(38100700002)(5660300002)(122000001)(86362001)(66946007)(478600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F3BDD1D37BD41040871C72956D84ACC0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7414
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8a037958-903e-48a3-48d4-08dc2c7ebd38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SQ5XWipATfUyQCRHHWH0QNjfAS6djDhlMS9iAcWMPQfPXEQc3UVWDcwHinCZHB4QJ1oKVMsuO81KunEel/HEG9zUFe3mcW86Fi+1oX1+b1TYrUC19sTbk/YK5n9cjF0JviWvJwdtaJi/cfk4uFHi79bDpMypDbpIOd0eWa0Fcun8Q6d4ZzmYp/jJOWvE7WRPBEm5ayz9QvMLMXZaqDhkb3xUNjEzuGUSGeGTLHuQ28KETJtZ8Wn1X+6HjF0E7jxvMqqdDdSnv3dlkLkA38EzKf/90rAw+YPEVBaAJVp5Zf3PqQCvZf/364k3KvFsRRvGVwQiFKg8LOn7VtGpA/qMiEx6zOlBsF7SQtDdpa1ifoxLgv8PMTAzRE7MFSIgXGR501UzLbfLuSzqC/MbOPkwyY91IsEV51PpI5O5HD4/lZwIzu/fj6zxeKBUt8xPFpWxrFTCls7qP92e+Vp//ytv0tQ1U/SaiaLQ71Md5fflALkpZ5+6vfHx6A72ZhdqNJ08tLrKTkGFHwriqJcAlUSPIroC0rNqeW6aH+TMWT5vIEDe0fifusdL+KlA9HDACjNE8TGAcAlIWqAVb8rgILNYc0QwzUTProj7Wo6TRiumWAk=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(451199024)(186009)(82310400011)(64100799003)(1800799012)(46966006)(40470700004)(36840700001)(356005)(86362001)(82740400003)(6486002)(6512007)(316002)(70206006)(478600001)(336012)(81166007)(70586007)(54906003)(2616005)(37006003)(26005)(53546011)(6636002)(33656002)(36756003)(558084003)(6506007)(8936002)(2906002)(5660300002)(41300700001)(8676002)(4326008)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 10:30:17.4604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a460b42-9ae2-46ac-ac31-08dc2c7ec5c1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10732
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 10:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195386

T24gMTMgRmViIDIwMjQsIGF0IDA4OjU0LCBWaWthcyBLYXRhcml5YSA8VmlrYXMuS2F0YXJpeWFA
YXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBKdXN0IGNoZWNraW5nIGlmIHJld29yayBvZiB0aGlzIHBh
dGNoIGlzIHJlcXVpcmVkPyBJZiBub3QsIHBsZWFzZSBjYW4gdGhpcyBiZSBtZXJnZWQ/DQoNCkl0
4oCZcyBxdWV1ZWQgdG8gYmUgbWVyZ2VkLg0KDQpSb3Nz

