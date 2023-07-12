Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAACEB64DD
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 11:48:12 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.59])
 by mx.groups.io with SMTP id smtpd.web11.5349.1689162488695791178
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 04:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6k7YB0Sb;
 spf=pass (domain: arm.com, ip: 40.107.104.59, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxgpaZXLrLG97jqRTnByFZhEuc2m5hrKoxL/PsQjcnU=;
 b=6k7YB0SbXKxymp5bi9KepG2HyfGuFjgDTdB7pIFUIbHXYUXO8QYjerOupRgxawYsH5kxeMg9+av962ycdS1L5lqb3k4GGQno/N/cIPID59iqrdZZnNcGNSUcyDG9k6MCRqtTvlNNwDDjx3NbKaCIEL6XafCxdo/boEpkPceRGzw=
Received: from AS9PR06CA0024.eurprd06.prod.outlook.com (2603:10a6:20b:462::32)
 by GV2PR08MB8463.eurprd08.prod.outlook.com (2603:10a6:150:b4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 11:47:57 +0000
Received: from AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:462:cafe::cc) by AS9PR06CA0024.outlook.office365.com
 (2603:10a6:20b:462::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20 via Frontend
 Transport; Wed, 12 Jul 2023 11:47:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT050.mail.protection.outlook.com (100.127.141.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.22 via Frontend Transport; Wed, 12 Jul 2023 11:47:57 +0000
Received: ("Tessian outbound 95df046a2e2c:v145"); Wed, 12 Jul 2023 11:47:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4281c443dab4fedd
X-CR-MTA-TID: 64aa7808
Received: from 83147e11b267.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0829F0F2-89BE-448F-B2CA-3AB921B00140.1;
	Wed, 12 Jul 2023 11:47:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 83147e11b267.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 12 Jul 2023 11:47:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfcZN4/sMAUxv2C4/oNobJGAuEta6m3F++JfIW9pjjVd1R52H6YJ+bb3+asVNYDsZ9wQgBxAiZ/rZ8YH2KIvQG1KgQ7OJBP//ULq7x0ahnbmG6Ph/qFgdMElyJhTJMFtVhtTHqhNVxmW/tjZ3zadvY6bCVYGSa3mAUI0L9rx+3Xv3htGiDX4j1YLcjH2RWGBazuFyJueWauipU0Aa4JkfwmdIw8ZCmGLSfV/qtj6/JEg5ePDKQXBbuIpfTxyyC0aS8h+LdotPOccUXSjsyeFmb1j4zdsbE/H3nq41ter6IzxxkSbZHMa9KK/y3sCXJiflPKhvhh2xK9CaaeEa9mGyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxgpaZXLrLG97jqRTnByFZhEuc2m5hrKoxL/PsQjcnU=;
 b=CBawX8Dcfm9sEEjI5kO7tGnkf3UheNg0ASud4m8WEuyc+ecjcVjm8aQb4NaOYl0PPec39ClvLVIRd3//vsY/L1Z4nVLsgAMIZ66kMDmjOaW4msB//ppmK2cPThziDPmSFoqEBJBHYTu0Br67BsM3D1hmmS0kPivqElch89CiBbC+Yymy6EKYrCoe492WNWH71uwhtUkeSDaBNiV9H2J4ipItNOseUxwTc9+q96GRdgXsQxmFgmBUeT500tg9wUhIlqj/0zg8QJkskfy1Ii7kU6WpTsL2s6NpvGVRSyc/DS9oS6nRTM5kW/RiznuTyb/DyZ66fFlYMiubxdpq6kVVNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxgpaZXLrLG97jqRTnByFZhEuc2m5hrKoxL/PsQjcnU=;
 b=6k7YB0SbXKxymp5bi9KepG2HyfGuFjgDTdB7pIFUIbHXYUXO8QYjerOupRgxawYsH5kxeMg9+av962ycdS1L5lqb3k4GGQno/N/cIPID59iqrdZZnNcGNSUcyDG9k6MCRqtTvlNNwDDjx3NbKaCIEL6XafCxdo/boEpkPceRGzw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8288.eurprd08.prod.outlook.com (2603:10a6:20b:557::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 11:47:49 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 11:47:49 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][PATCH 1/2] opkg-utils: add acl and xattr support
Thread-Topic: [OE-Core][PATCH 1/2] opkg-utils: add acl and xattr support
Thread-Index: AQHZtE5FXTtP9I9Dlku+DoptQ0D3Vq+17z+AgAAOooCAAAbSAA==
Date: Wed, 12 Jul 2023 11:47:48 +0000
Message-ID: <F63C4DC6-7608-4FC3-8F14-979B6BE2C82C@arm.com>
References: <20230711231847.2211186-1-p.lobacz@welotec.com>
 <384B4554-E449-490C-888D-FDC111366FF3@arm.com>
 <VI1PR04MB5373335EEE7F848007D4D95B9136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
In-Reply-To: 
 <VI1PR04MB5373335EEE7F848007D4D95B9136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8288:EE_|AM7EUR03FT050:EE_|GV2PR08MB8463:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cf6e736-d91f-4c94-7309-08db82cdd5ed
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 LMywVoVGm0ckBHhJlrwgDjk0nuqtwGm3zrAjEbBcYtaFKPDjNl03zh2O7ems1v+Qf8PuEP4ZE334KfnQ8S+XEqH72aI8ozRqlVi9GsHVFNQJOTfgXEesJlxW3KPzrItL7KM5DOc96D/1KKPaCf3WwVmAI4bNBCzSCG6GM7Olh2rAjUu7Wz79ZGifSmgrGeN/u9IVi1xNV1mu+IPqAXzlnBZak6IODYA+2/98wkM/wo3Y5d8QJfJUPhzSWL7P0ZqQ6vEgbZgtaYooKJef0N4H28qu/Ou6/oib2cvbunKBI8apHC21ZK/JSGKGfdv+2nWB2baXPFSSJnzCOhTsLtrEymFsdHolHsXp3R0zPY8eFgucLi07nQ+hLgE24EYyZn+mIyMv9a089Iw9Yyjaq1PASZwdohLsGkj6pBk0+LmszSIIwhIpip0x3Hj9+qCO8/i8kd7gAq/J9D4KGLihQJsJ6wZp1xxM/zQMRNc3uiHfPnnziD54cZO4M0iykt8NClqaEFjoaDgbmRcaLk1sYmfbM3MbAjbHtEWKbPgOqoiGeKDOV5EUhXJw55EX72DfgbbPNK4dFmZY0Rv3xgAzlDuF0XuEqHCHsarla37Ooh3EIZ/jvSVuBLmbZrtVVwzIzpLH9WhvQg14PHPVyShEjLaoxQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199021)(8936002)(8676002)(5660300002)(186003)(83380400001)(2616005)(26005)(33656002)(53546011)(6506007)(86362001)(41300700001)(6486002)(71200400001)(966005)(316002)(6512007)(66556008)(66476007)(64756008)(66446008)(36756003)(2906002)(6916009)(66946007)(4326008)(4744005)(122000001)(91956017)(478600001)(38070700005)(76116006)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <15F07C1A3480124591B951B0D4716D90@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8288
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d0090bb7-1988-4029-ec59-08db82cdd108
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xHvmTPJCk9k2bqa6yIP3wMOzay3va8Mhp6dov2oSFsXE0SAomDnXMnB7hdba8w+R9MjSYIJ98fwih9p2VQP2v2jZvqUMQGbxg7kGPxxJncmv+kk0vLD8+gKbmHC44CTLvTtSRDGlsJWJzSer5Bs6lVo7huTZdeQvovLfaQa+0+IuOyutQqivd+RjL6oiTDokV4Mte1Rr38A/h8uxdguN0NALCePEYG0tz/Ylm6yzhP3VtMPn/036nbSs9gcvTtxVU9jF0k7nuImR1I2QFPkKyNaYqhETJwXCw8bsN3rtQvQwgcVpm9fAIxEbr1I1EP+asgu+TK4BrO8zN7gTbx+7LoIjTXIeoERAPCeQZiik22nK0gRd0WLVbFuOUzS19cVGn7MXZYUfJw+mI4KlutToCMuvKArH89fuTyLr5q6Y5dmEW08XZOGjIxGWNghnDn9ilyjlqUJJlQNPxsK98RkPVmNehGUhNIj147LNeaDWF9dPk1OgCJH9qE/84vtGsrp/HJBIIIKJLXYy8BbWJVkOicDEiHQ1+3SYKUB5OpH5qz1X1QsP+6X6zBqubzfdSbEfkvAzwTsJVnfmWmn+NOJvoWHM9F3zn7JUOuhH7LarYw6fwO1Gnc9lqgTBJtceWXBBYY6IOIc0XsTnTmDe++V5K5CKAhjjuJMT4BM48QxCS+0rGE/QjbaOhninI+pzpRdBxlvJTzaqtrfi3G3D82W09+99+NIBPMWGMHkLRpA+dgg=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199021)(40470700004)(46966006)(36840700001)(8676002)(8936002)(41300700001)(6486002)(40480700001)(5660300002)(6862004)(2906002)(316002)(4744005)(4326008)(70586007)(70206006)(40460700003)(33656002)(478600001)(6512007)(966005)(36756003)(336012)(186003)(86362001)(82310400005)(356005)(81166007)(47076005)(82740400003)(83380400001)(53546011)(6506007)(2616005)(26005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 11:47:57.1447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf6e736-d91f-4c94-7309-08db82cdd5ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8463
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 11:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184184

T24gMTIgSnVsIDIwMjMsIGF0IDEyOjIzLCBQaW90ciDFgW9iYWN6IDxwLmxvYmFjekB3ZWxvdGVj
LmNvbT4gd3JvdGU6DQo+IA0KPiBJIGhhdmUgYWRkZWQgdjMgYW5kIG1lcmdlZCB0aGVtIGFzIG9u
ZSBmZWF0dXJlL3BhdGNoIGNoYW5nZS4gQWRkaXRpb25hbHkgaG93IHRoaXMgVXBzdHJlYW0tU3Rh
dHVzIHNob3VsZCBsb29rIGxpa2U/IENvdWxkIHlvdSBwbGVhc2UgZ2l2ZSBtZSBhbiBleGFtcGxl
Pw0KDQpodHRwczovL3d3dy5vcGVuZW1iZWRkZWQub3JnL3dpa2kvQ29tbWl0X1BhdGNoX01lc3Nh
Z2VfR3VpZGVsaW5lcyNQYXRjaF9IZWFkZXJfUmVjb21tZW5kYXRpb25zOl9VcHN0cmVhbS1TdGF0
dXMNCg0KWW91IGNhbiBncmVwIG9lLWNvcmUgZm9yIFVwc3RyZWFtLVN0YXR1cyBhbmQgeW914oCZ
bGwgZmluZCBodW5kcmVkcyBvZiBleGFtcGxlcy4NCg0KQ2hlZXJzLA0KUm9zcw==

