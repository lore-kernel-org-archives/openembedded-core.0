Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B124EB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 10:30:02 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.77])
 by mx.groups.io with SMTP id smtpd.web11.4212.1689157797956290655
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 03:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=46FJ3EoQ;
 spf=pass (domain: arm.com, ip: 40.107.104.77, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBbD/9/keC+AMK4SY6BiyYKQFA0XhIONoWe4QX9WqdM=;
 b=46FJ3EoQ9ocUkh4tFCV3hsHCTU73Rl1z1QhUFrHgVjAmzKfP4DXQp+3FQIVDYbIEeQ/n1VC0l2QoMYteNJtxVgpmRWNsnCqABqIt76nw/6oSIuwO7f/cCmH4DQchWkNcLT+s4TTup7Uo+zzZTogJZlRhCLc+8AYSWIttkxihx9A=
Received: from DU2PR04CA0306.eurprd04.prod.outlook.com (2603:10a6:10:2b5::11)
 by AS8PR08MB9694.eurprd08.prod.outlook.com (2603:10a6:20b:616::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 10:29:54 +0000
Received: from DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::53) by DU2PR04CA0306.outlook.office365.com
 (2603:10a6:10:2b5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32 via Frontend
 Transport; Wed, 12 Jul 2023 10:29:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT058.mail.protection.outlook.com (100.127.142.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.22 via Frontend Transport; Wed, 12 Jul 2023 10:29:54 +0000
Received: ("Tessian outbound e1fdbe8a48d3:v145"); Wed, 12 Jul 2023 10:29:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0f814127077f630c
X-CR-MTA-TID: 64aa7808
Received: from 7e108b1559a2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 807CD639-7346-45B9-BAD2-C611EED09439.1;
	Wed, 12 Jul 2023 10:29:47 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7e108b1559a2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 12 Jul 2023 10:29:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+G2OKslCGGzWb7oPw/Zh+fRw3Q5D36u/9FFS3CxJeD0z5XkelcLJQ1FDKxO1ryTsMOd4/bxw76y9Lhh84KF3Q21i48SW+sDDfZavujdewdNdhRogUC3bB+1CSpv2lm809w0ER4KV01ieNL2yica4xSALHnJz0+tmPDVk8NC2YFvMfqTxlXu2WsWuJ/1eXP3ictJ6eWPRlzk0rQ1FUwJpaVYxs24FCBVfGQew4l2DBlZRfT9MGtA1g0b8+u7qFFXgqMS8AefPSTJW1xr7+jXZuRz3w43btT+FaWwfq6auPPcV+/35FvxE8YVgvUDZEfoJatTaIiY2RdZhXaEdfz7og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBbD/9/keC+AMK4SY6BiyYKQFA0XhIONoWe4QX9WqdM=;
 b=FzPbhafsbYKM0MWRruGD/26Gcl6S9RaBF0gU2EvyN6NzJSzAR3A6CHk2as/acV7FaI3mgJW+yE4D/djQjPHuDffHrW3bIGO5DnOGRAQ1naqjqHlSziPAtvqRbURWn22z2DBY+VpA8h+ZxUP0aQqNW1vOlsp4ZxGSxIp8DKnpGyUaya0kN7EvBFM62Ev/c1Pv1EY7mIsQEMCHjmp3TrvIf3LOZjohKETH5uCqE3mzvgnllmE35lweSEsHbjMo/GDjEPWdMW1GQaCTo/raA/Hxeaeuf7l6g6LmXKJ2Z3cjy9hQf9//O+rZjGwNb0bUTN1jTNc7WB6mBurbmeDAEp69YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBbD/9/keC+AMK4SY6BiyYKQFA0XhIONoWe4QX9WqdM=;
 b=46FJ3EoQ9ocUkh4tFCV3hsHCTU73Rl1z1QhUFrHgVjAmzKfP4DXQp+3FQIVDYbIEeQ/n1VC0l2QoMYteNJtxVgpmRWNsnCqABqIt76nw/6oSIuwO7f/cCmH4DQchWkNcLT+s4TTup7Uo+zzZTogJZlRhCLc+8AYSWIttkxihx9A=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB7362.eurprd08.prod.outlook.com (2603:10a6:150:21::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 10:29:45 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 10:29:45 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] tunes: Add support for sve instructions on
 armv8/armv9
Thread-Topic: [OE-core] [PATCH 1/2] tunes: Add support for sve instructions on
 armv8/armv9
Thread-Index: AQHZtDPPFI4kPZ/L90uttsauNaB2PK+17xgA
Date: Wed, 12 Jul 2023 10:29:45 +0000
Message-ID: <B1D99B0D-B820-43F0-A699-C7A121D74205@arm.com>
References: <20230711201042.38285-1-raj.khem@gmail.com>
In-Reply-To: <20230711201042.38285-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB7362:EE_|DBAEUR03FT058:EE_|AS8PR08MB9694:EE_
X-MS-Office365-Filtering-Correlation-Id: d3ef741d-1ce8-4d19-22cd-08db82c2eeed
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 KVcRXR3jLya2g4mE01DAzIRwFXelc7r9vJ7h1EQp2KPDQfIV97iO+mXco5pwN7wegxTXx6qGlV7GULYA6AHJaNbTTzBhKBOrpT4vXsEGpahxIbhKpU4YgRIVXEatvBE6O4GYlpWUBjqTJhKDnJQ9cj+CWv1uuBHxOfy7XZN8tc7VzAW1u7rbDyIPMYA3EG/rn+piWK1wU69NP7yDbpspW/C0dZrUZmHquBbceON5nVRE9JIQI9F7zUpZQpL9xKFxCl5Kd7iIx52EnI4GWllz9XdzOTC3vFwHBpOCcys1LT71CqDftTtoaDBaPgqFvnWUBCBqBF03GR6ko+9AlDA0yFXyAcgaO9VM+SMd6He5Tld8P8/VZCRGUCgR2hDGtG2V3tH5hsBggPJ59GBU8aDVfb3ytwgDLmDR/Cex8WIOmaGEkH5uPFIH2LDPIv0IaVsXXPc9JfFwavNuxLHEeu4oqmCMUhDCQdmdY8+OJTHbXqdd5OFNqAkg8rv2EVf2p041amEsEV2O0NklvduUoo1YwvCsGw2AyVtP1s+M4XTKK86fsliv7zHKkgc1Dl6Vh5Bwu+4xsoKyradYyaszrT3nVzgfrQoC96IwBGSfipwv8B0gcFJipz5ZJCfOkmEfj0CWA1shzoatTCA01v1HRpY7og==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(451199021)(478600001)(186003)(6506007)(86362001)(26005)(5660300002)(8936002)(8676002)(53546011)(41300700001)(122000001)(71200400001)(6486002)(38100700002)(91956017)(66556008)(66476007)(4326008)(66446008)(76116006)(6916009)(66946007)(2906002)(64756008)(36756003)(2616005)(38070700005)(316002)(6512007)(33656002)(558084003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCA10DF3D71DED4C98273EEB7B171FB4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7362
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3fbaef74-b2bc-45fe-8136-08db82c2e95e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	U/7KvgUQ+lzf//183grdJ7p+m3GdixORz9jRlA3aCeZYlT2iIJGUUv9rUERYxZp4yFWxbMyloOxZ2fy1slS99DbSVEJsmOPwUpUl267EKe3QtEYKWwJu2yL7LSbumtQPsS8eJcJIrz3eMlULYh5EHFbTtn5HDZEtzXGG1khBjrwSFVJi+LTYx3jRYqRS3uymKiHQzoKPuHJwjJVN5SVSEJyW91+c1ov24Tt+2mungpj6suByLtqBcemY6TobsAIaS6Ycowv/g+6Pof/g2IQWTV3FdAs9HKO2CwfU6Jn6AfyQssrHACgHz1cdfQRPwZXfaWaQI8+tsjNLbFxixnUeaCaSi6U+/Al6Ymc8l2DlW2dykL+H4rn+veL+L7rN9vM8qSNTbRSDJ9NahXtqKIZiO3MUvjO2hDmrwP/AYUSx2wEmVSCjjdr182+PuqLzHF67Dg1tB4D6t+hMrLf1ithnPOR4wMieTOWvD5EzzI2mODj7cAz/M+qRXVl5I28uLxvQgA7lAoYKQBAwOdwSkcJzw8Th87fZcOHLItuxe1TsrFP+QZymyL6xndfUlcpdKNsJV0mRTwT8tb0IhO20ujhiCEnGv0dtwtlM2W5vmlm57mOZJvbM3UrpDo2xjgVeuvdx4GKqnfw87uVbqLtpkaLgqiE6QCt3PJFpHrqnl36MSWFh4H2tmGSzX5CEHEkhhsRgNAYjOnH5ecPQ+qyl4WicVJqQlTlgCeAFdXoOsjjDlXfyrrwwdlMxo5wrpGL1u/kw
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(336012)(186003)(53546011)(6512007)(36860700001)(2616005)(6506007)(26005)(478600001)(4326008)(4744005)(41300700001)(316002)(5660300002)(2906002)(6862004)(47076005)(8936002)(8676002)(70206006)(70586007)(6486002)(36756003)(40480700001)(356005)(33656002)(81166007)(82740400003)(82310400005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 10:29:54.6685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ef741d-1ce8-4d19-22cd-08db82c2eeed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9694
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 10:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184172

T24gMTEgSnVsIDIwMjMsIGF0IDIxOjEwLCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiANCj4gVGhpcyBoZWxwcyBpbiBkZWZpbmluZyBjb3JyZWN0IGNvbXBpbGVyIG9wdGlvbnMgYW5k
IGNvbmZpZ3VyZSBvcHRpb25zDQo+IGZvciBnbGliYyBhbmQgb3ZlcmFsbCBBQkkgZm9yIHRvb2xj
aGFpbg0KDQpHaXZlbiB0aGlzLCBzaG91bGRu4oCZdCB0aGUgZ2xpYmMgcGF0Y2ggcmVzcGVjdCB0
aGUgdHVuZSBmbGFncyBpbnN0ZWFkIG9mIGZvcmNpYmx5IHR1cm5pbmcgc3ZlIG9mZj8NCg0KUm9z
cw==

