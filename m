Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C84C001B0
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 14:49:37 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.43])
 by mx.groups.io with SMTP id smtpd.web11.90083.1691592572573516276
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 07:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=W5ZjtmqQ;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=W5ZjtmqQ;
 spf=pass (domain: arm.com, ip: 40.107.21.43, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AybEbYr+OvC4hGiCNBg8snqw3TMB6Kxx/VmOV8sQnvU=;
 b=W5ZjtmqQviAWDUqbsUfGvFYDG2392qaEb4fLDWRPxUHiDCHxY5PQ/WwzKZtlUeiqE2V3gAbdBl3fUdbfWhGAmKheLWd8NxgjWfuRHBgVW4AXitp0FbIQ6ezwUvNmmg4Px1AQvoa16TIUS0eMeEvLR0OmXlPHL1nZtKRt/0OX1Xw=
Received: from AS9PR06CA0400.eurprd06.prod.outlook.com (2603:10a6:20b:461::29)
 by PR3PR08MB5801.eurprd08.prod.outlook.com (2603:10a6:102:81::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 14:49:25 +0000
Received: from AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::82) by AS9PR06CA0400.outlook.office365.com
 (2603:10a6:20b:461::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28 via Frontend
 Transport; Wed, 9 Aug 2023 14:49:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT005.mail.protection.outlook.com (100.127.140.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.18 via Frontend Transport; Wed, 9 Aug 2023 14:49:25 +0000
Received: ("Tessian outbound ba2f3d95109c:v145"); Wed, 09 Aug 2023 14:49:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 90e4ea0e97240a16
X-CR-MTA-TID: 64aa7808
Received: from f29426642d15.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8D6EBC26-D3BD-47A6-ABA4-85086D7E964E.1;
	Wed, 09 Aug 2023 14:49:17 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f29426642d15.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 09 Aug 2023 14:49:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=niA4CkLoOB1CnvIlv6mrtgnBcNXcawi699MoeMASJsRR39jbZdzw1WrBSc8lycEuZRAJqAmSBMyinjJ94lmZHzGNjaS3U6W6pbb2F6E1REjhc1MkWi47EI1BLwF0O/RxuTgK/pkaUD6LRk8G5CHy36JF0QTI8/bYGs7PVlcwGzUJMyhmQlJO4moIo+ta/RdKHrXvNuFMJ2OBKpMdrlZGghy7ASGpRol0kiq5wnAkkQ23qr1Y6TdZloO2xtU4866/bM1GfNwt/K1q35UPjG+R5JuRV+Mnm0IUsKTqxp/vI0bdv19cb/YSH32lCyTG+4RRkxNsbznJSr3F103YsI+sZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AybEbYr+OvC4hGiCNBg8snqw3TMB6Kxx/VmOV8sQnvU=;
 b=jFDuJY3Egl+o4iWmMuDDxAYoV8izBwfyB9o9EC2NdQ8+CJoaFPfTJfJoj06FnULBccwuXaDhf0W4z+wfV5PaQEtE4iLJYrPtsW6oqVGlntW5FZSKpOO64rAcA3teBZIbayrFjmgbVn+TrzGtNihDnlIc6Dp8jh+Z4es5BKdWgB4DI060xRFljTFLeelpvAICH0wAmQK1x45FZuS+QIk9vWoD9CGiK4D+GH0E3DGHMA3MM3nlbBwJFA1UjUp9tTFIoiLpQdimI8RZmenKa7gLYLG9YXdmSiDvRrWHbQLp3TJ7PmPqvJ/MRY0vYBnst/pbW1rlygj0A2n+VJv9ckP/kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AybEbYr+OvC4hGiCNBg8snqw3TMB6Kxx/VmOV8sQnvU=;
 b=W5ZjtmqQviAWDUqbsUfGvFYDG2392qaEb4fLDWRPxUHiDCHxY5PQ/WwzKZtlUeiqE2V3gAbdBl3fUdbfWhGAmKheLWd8NxgjWfuRHBgVW4AXitp0FbIQ6ezwUvNmmg4Px1AQvoa16TIUS0eMeEvLR0OmXlPHL1nZtKRt/0OX1Xw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8231.eurprd08.prod.outlook.com (2603:10a6:10:3b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 14:49:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6652.026; Wed, 9 Aug 2023
 14:49:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
CC: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 1/2] systemd-boot: enable verbose compilation
Thread-Topic: [OE-core][PATCH 1/2] systemd-boot: enable verbose compilation
Thread-Index: AQHZyhKnM/asgv1V20WdR9s/8wGmm6/goOcAgABjKQCAAAHKAIAAgJ6AgACGroA=
Date: Wed, 9 Aug 2023 14:49:15 +0000
Message-ID: <99E1E475-401D-4C4E-8857-FE94A07FC349@arm.com>
References: <20230808160828.3045524-1-jose.quaresma@foundries.io>
 <CAMKF1sr4azY=E9XUz4946qWByrMFHbVM-jCACFtgF93_ry4DpQ@mail.gmail.com>
 <CANPvuRny9BbNDpGtz6y2omz2fzsezKHij_pff_bMNRZsW_iyTg@mail.gmail.com>
 <CAMKF1so0DFL3CZqtPKzi1QBV2cQ=6FD=J=TsaFS8ME8KXyPsYg@mail.gmail.com>
 <CANNYZj-DtpOfOye1kOvwCcxzLuAJ6gc3FyE__VMStLiNirrViA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-DtpOfOye1kOvwCcxzLuAJ6gc3FyE__VMStLiNirrViA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8231:EE_|AM7EUR03FT005:EE_|PR3PR08MB5801:EE_
X-MS-Office365-Filtering-Correlation-Id: 3272f6a9-e4ae-44ff-6205-08db98e7d32c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 mzw4gOj+0e1O+vhjACMVPySMe/N1iZqGMbd2z5ROu9mEA1DvnSd30vFL3sn7TkUb9OHrOrUnWagyJguXzXsXhQgTEPM8XFeZDN1S0DYMzu+V4tTizK1qH/Wy1AtP3g4m8l/q8nFktEkUFROkLuHfYz/2gC8H4wM8c2Q+oVhYmljfgUMStLgb8USJs6DbCuToLRwE9HSm0/FUfDTho3b9qZVLSLGmVZlhiG0hB1aNu/xs5XwLm0qO/4ir5VpW2nTxcNwMCjMUaVhBB59FKuycv3uh8e/NUWBHtHaa1uIoQUNdK+Vhfux336Z5XxvUpyV6lvhkmeqtOT9CQ0x+BL0eBBIkUYwlofAp+D24mFzuJK1nMiRFMlq8by7dYWrIZMNvJCNtc4rBXTiXevqI4/mCuR1na36V38qCdNVRvBH5qP8nbKsnJj6fWe2w/yIivRFwOECSg8qtKFVXC2DWjQyISVm8jTRTVKx/UqpMRHyzjlYt4MZWjtPUQoZ7Ma8Zk78bRPYPbunWqTxPJmT1u6GRFvC5aMRpK/+oNpSEQJofluxk+fa66j6+J4PCE00SMdOHskzsevuTJOTF/wDfwEKtatngytyiUyiNvcNxKNGrlWZpPtngr6HVU/cFuDIDYUkcxfF7c4EC8r2fM1B/sk73Ew==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(1800799006)(186006)(451199021)(2616005)(26005)(6506007)(6486002)(36756003)(53546011)(6512007)(71200400001)(478600001)(122000001)(33656002)(38100700002)(54906003)(66556008)(76116006)(64756008)(66476007)(66446008)(66946007)(91956017)(4326008)(41300700001)(316002)(66899021)(8936002)(8676002)(5660300002)(38070700005)(4744005)(6916009)(2906002)(83380400001)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <584E4FDAFA7F0C4590604082E6D15416@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8231
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	060d6d72-f645-4555-cfba-08db98e7cd83
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dyfNavKbOl22EwVcuO7m0yovGz79+WHnR8eZoALsQga6Uexey7B+OMfxgfWAdbW7BN1DCwcQ9VoOu+6qW8p96sNDJ3lVWF1+NIj3DUy+EYnjoBYXpOqIp0VpzSpChqvDBq1ULGduUIHIxI8ADHvL8X9jjnUlVtH3EEwl467TzH35+4tpLJNPoGwYBRPuWzKEJ7PmQgcPrYg0e7uQKsMfScNMrn8giLYmx92nI0I3p/Szm+LStldJ8BBTQvCtRTFWEQgYrNRBVa87w18P9IXm4dFn6NmexeDapkFqGqy38UPSp3k00gxi/0v/QQUlwzDTsodMIWFlU+FNnmG+kYTkK3jDrQUpn5s8zB5C3k0329EW0VGiQ8QN/xh5WNu5VyAb6sFd5PvPicR41zy127vK3HDRSv/CCvHNTI/Fz7RMcojRK89s2W0M1vJvPz7doxsVx26kzD0nPGmgG3RmMY6F5WXlEeyzzkTXhzZkqqhsDvEfnmV7g/H0LdCS3Cn5WabDRoarX29phoFgcEDeJI+DKooPnzhT53nR3YWzew7bw2PwD7D9GNU4O8hZEf7dF3jUipQh+/DkFS4fqsTHFoOMQuiq59cIlJSYzCTlGdRfi/rlWil9vL10OfyGVhH2NXE/su7DthkoosDjsWapUqP4E/dXAZyGOQWvwbWQEzH40SXVUe6MEit9Lu/ywAbPzjvsrO0dmxG/4TZbYFAAySocwMl3gDEE7ERPg0MpRJN8YO0=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(1800799006)(451199021)(82310400008)(186006)(36840700001)(46966006)(40470700004)(6862004)(5660300002)(8936002)(8676002)(4326008)(66899021)(316002)(41300700001)(47076005)(86362001)(83380400001)(40480700001)(40460700003)(36860700001)(2906002)(4744005)(6512007)(6486002)(26005)(2616005)(6506007)(53546011)(36756003)(336012)(70206006)(70586007)(356005)(478600001)(81166007)(54906003)(82740400003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 14:49:25.0357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3272f6a9-e4ae-44ff-6205-08db98e7d32c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5801
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 14:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185709

T24gOSBBdWcgMjAyMywgYXQgMDc6NDcsIEFsZXhhbmRlciBLYW5hdmluIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxhbGV4LmthbmF2aW49Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPj4gSWRlYWxseSB3ZSBvbmx5IHdhbnQgdGhlIHZlcmJvc2l0eSB3aGVuIHNv
bWV0aGluZyBnb2VzIHdyb25nIGFuZCBtZXNvbiBuaW5qYSBldGMgYXJlIGdvb2QgYXQgdGhhdCB3
aXRoIHRoZWlyIGRlZmF1bHRzIHBlcmhhcHMgdGhhdCAtdiBzaG91bGQgYmUgdHVybmVkIG9mZiBi
eSBkZWZhdWx0IGFzIHdlbGwNCj4gDQo+IEFic29sdXRlbHkgbm90LiBBcyBzb21lb25lIHdobyBz
cGVuZHMgYSBsb3Qgb2YgdGltZSBmaXhpbmcgYnVpbGQgYW5kDQo+IHJ1bnRpbWUgZmFpbHVyZXMg
YWNyb3NzIGFsbCBvZiBvZS1jb3JlIEkgYmVnIHRvIGRpZmZlci4gSSB3YW50DQo+IHZlcmJvc2l0
eSBhbGwgdGhlIHRpbWUsIGV2ZXJ5d2hlcmUuIEkgYWxzbyBkbyBub3Qgd2FudCB0byBzcGVuZCBh
DQo+IHNlY29uZCBmaWd1cmluZyBvdXQgaG93IHRvIHN3aXRjaCBpdCBvbiAoaXQncyBkaWZmZXJl
bnQgZXZlcnl3aGVyZQ0KPiB0b28pLCBvciB0byBydW4gYW5vdGhlciBidWlsZCBqdXN0IHRvIGdl
dCB0aGUgdmVyYm9zZSBsb2dzIG91dCBvZiBpdC4NCg0KQWdyZWVkIHdpdGggQWxleC4NCg0KVW5s
ZXNzIE5pbmphIGlzIGNsZXZlciBlbm91Z2ggdG8gZW1pdCB0aGUgZnVsbCBsb2cgZm9yIF9ldmVy
eV8gYnVpbGQgc3RlcCB0aGF0IHdhcyBpbnZvbHZlZCBpbiB0aGUgZmFpbHVyZSwgSSBkZWZpbml0
ZWx5IGFsd2F5cyB3YW50IHZlcmJvc2UgbG9ncy4NCg0KRm9yIHdoYXQgaXTigJlzIHdvcnRoIHRo
aXMgbWFkZSBtZSBsb29rIGF0IHRoZSByZWNpcGUgdG8gc2VlIHdoeSBpdCBoYXMgdG8gZGVmaW5l
IGRvX2NvbXBpbGUsIGFuZCBJIGVuZGVkIHVwIGV4dGVuZGluZyBtZXNvbi5iYmNsYXNzIG1ha2lu
ZyB0aGlzIHBhdGNoIHJlZHVuZGFudC4NCg0KUm9zcw==

