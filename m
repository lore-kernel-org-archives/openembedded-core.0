Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B81C433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 12:10:23 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.42])
 by mx.groups.io with SMTP id smtpd.web10.39926.1666008613241141500
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 05:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=DDYvDety;
 spf=pass (domain: arm.com, ip: 40.107.247.42, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KQbaa+41LEtzql9w6aJJGkVFlTr/0pNtysTf6++eYSk30ssqLzDzQvvXnyfCrvFg8liOr18FL9t8YTcW1pfq67VRMJZoXotd+1Egx1w+owmL3JqLvb1Z9LwejSZ8xEdLGu93iGadBGYEZ9G0NSOY5A9ZNYOQ77B2qvQs5w+0eIPYwGEYEHi4FwC5U7JQvs4uvateLINoWwSslLhXkt/ssYr1azuDeoxx/6dhSCP49nomnSprmf8xbEZv8myoDVZOGUILDsC4ig4CR5+C01fo1eF+WcKi/E+Bq4uHSqsloUYqH6hGUgDkGDMKr0xgO+Ey+Eq0yD2ZiA+HvEU/avNXTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBh5qGHjLCrjQk6KRQ7hXqCzPTFsFqZr2VNLXK2aqgE=;
 b=RA+xNxMNQK146hYv6LjAglrvl59nFcTOs6xmTA+/2cRKad4dYNBlX/s9m/ULRJk7rV9pZtZieWrBqAoka2RlBIJ2UWw9Q9sIu+HoI0G5b1B1IHyxck+HAKRg7s4FWTpXNfcPk7tAStcGpZWUFMU9UULuAfzugZh7m8FsMXC79d570zmop4Wim+v1thmXz4OReEPylKEI4To1QtmAhrzIBR7e5luGWEWboPFMkkXMsgEwrAjY0wIQv5QAp9wx723adDQXmq9KD2LWtCddtUf728WEkV4SjRAbyShllRN8qoAldN+QIT44pIb71JASadVqte8YOihIfM2L5HCucU7rfg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBh5qGHjLCrjQk6KRQ7hXqCzPTFsFqZr2VNLXK2aqgE=;
 b=DDYvDetybo7bWDB7D5T+pgiCf2skzcZMkVKns8DUGLbwYpYjsLow76O8i0R+S38mIfcHp88GXfKlir9Nt+PQK4Unk6ZtQVWMxV9DP50dBRZrDsdv4l9dX3JjFkF26UsIx9Q+tP0c8TBKYzZ8Cr+9FvdISVsj42T5uLLQww/Pwv4=
Received: from DU2PR04CA0317.eurprd04.prod.outlook.com (2603:10a6:10:2b5::22)
 by AS8PR08MB9838.eurprd08.prod.outlook.com (2603:10a6:20b:615::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 12:10:10 +0000
Received: from DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::79) by DU2PR04CA0317.outlook.office365.com
 (2603:10a6:10:2b5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29 via Frontend
 Transport; Mon, 17 Oct 2022 12:10:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT029.mail.protection.outlook.com (100.127.142.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 12:10:10 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130"); Mon, 17 Oct 2022 12:10:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f9db0fa28da54f4f
X-CR-MTA-TID: 64aa7808
Received: from 640f184d6c16.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 351146D4-03EB-4D97-AE15-C356667A301A.1;
	Mon, 17 Oct 2022 12:10:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 640f184d6c16.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 17 Oct 2022 12:10:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRtYACT1/d+we2YY5bG3IN7texanuCwg7zCv2UCs6CdoabZNLwIrP9hby62tTevkEbQYtOdKGFJ0Zv6r8HmWuTNV+Eo4uRm0U+Mktd+2OHiJ52DeeveTsdBGMP22JZWSlCT1UJS+ZlcjdNrZO1PJ7iKHRb4hC08B4j1TpSvHfqEC2tPbuQI0RAmg3BLldC11jUtBZ2Zv+uTKHIsIeIhZGBSf22GNlv6VByBE8bowvFzhasPYCDvQDeRtEGjY1sJ8HUoEROlbYcNFbLwT40/7TXf8k3HWLBbuo4sJwNJDboAFJmX27qNnMbqfc39zQy0tVdFr3t5Aj0WpyrJdPYaw1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBh5qGHjLCrjQk6KRQ7hXqCzPTFsFqZr2VNLXK2aqgE=;
 b=GjwO9l75fz5cIu+L6SPBtlgdyt8JyxTqH4vhkU5e3M5F5ZGdDT0E6ByrL9ya52RVJAWWBE1OGHnLCVXfAz7oAM+NLfLv3DFnV4gcjl620tMqDYKW3w/4xnD26692URV4p0/wHtfGAN74d9yaFjTcvn4LiytA1NVGRz7R1Du6/MHtSYi+PoGE046UclfjQRtP2b+Bj9zy5QA5ifHJXhNbCJD25klmbwM4lpWPhAQT6WrCeHqBalHTO6yhh3/rDz3igQto/1rKPxS4cpr8+m7nmxh4pBFfUmCcFmC2d1UbUcch2MlC3fIRfHapWvY2ehjRnx5ZIWMsZuP9d4S5zQlDTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBh5qGHjLCrjQk6KRQ7hXqCzPTFsFqZr2VNLXK2aqgE=;
 b=DDYvDetybo7bWDB7D5T+pgiCf2skzcZMkVKns8DUGLbwYpYjsLow76O8i0R+S38mIfcHp88GXfKlir9Nt+PQK4Unk6ZtQVWMxV9DP50dBRZrDsdv4l9dX3JjFkF26UsIx9Q+tP0c8TBKYzZ8Cr+9FvdISVsj42T5uLLQww/Pwv4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM7PR08MB5493.eurprd08.prod.outlook.com (2603:10a6:20b:102::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 12:10:02 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%6]) with mapi id 15.20.5723.032; Mon, 17 Oct 2022
 12:10:02 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "tom.hochstein@nxp.com" <tom.hochstein@nxp.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] vulkan-loader: Move libvulkan.so to main
 package
Thread-Topic: [OE-core] [PATCH] vulkan-loader: Move libvulkan.so to main
 package
Thread-Index: AQHY4ah+8Ri2p1RLAES4sRLEq+uqAK4Sf3KA
Date: Mon, 17 Oct 2022 12:10:01 +0000
Message-ID: <8917BE00-005D-4ECE-BAB9-82EFC64F9544@arm.com>
References: <20221016214357.596913-1-tom.hochstein@nxp.com>
In-Reply-To: <20221016214357.596913-1-tom.hochstein@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM7PR08MB5493:EE_|DBAEUR03FT029:EE_|AS8PR08MB9838:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d3112ff-b63a-4066-d550-08dab03889ab
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 3wEKcdwuabcSdj/WdlNj5Xb/GZ43AW0h125n18nOCiGjS+JwdfCAR1xdfgYbViZJAxE9RV/rZzCHex96j4cjg33fUFatXtg0G6i47SIrEElGaf+ehB/ogux3Aht1o/0sD6OKr0AGQbW0ItUt9cezJc0AdAhU9qYpgXSqRgwuwsVKwllOa+1vEE2yswQeIXuPQI2l6ETndLIt2vojxqC5FFJSaBezZ6wy5PyLWaq06o8fSWhAbHzs+KMKA/ZAhm/oAw/awDd8dn0AW1zKTJ/C/ZMvX64UtjZD3cZI3cdXrWxWL/2zjs7tdp3YF5fHAfnGVpGo+R/6EjVb48b5ycHRrTda6EfX6LNf5Cvrc9w6BANWqLgLvTLEfmLf2e8TNrp5JIufR/6ZOiPXMoPraLU3Lz0/TqwUo+zeVQXSL/+wYlLZ6CvrMBLP6tF92JbNIYKXAIAYiNVPCUQqT+uz7M2eucShmG5O8+D823quEjsEDly8FQjtFdATGeHOQpZ7EsU9FxVMl5QTgyIZD1lnLADdLk91aRX7Rp2Yusqz8X4iuMDkBlUs8U/Y9VBPu9Tkstto2/2Eltjxx+0UHTtE5NmqXj6kJ4B5rmnej5hO/Jxqll2p099R6RimCdY3m93cpLVAHeGUZzQ8CXXcj0ZKaD5WwifHIc8qRy0Zf932u0XDuobsLDX5Ay2tV7eIAPwGA4OdATBrx6YjVi4jWkRzbfgwjhUDSFOloK+c7UiV97FtdlOlFM8C/YeETYgjL3oQvZ4R/zuAwLTzlR+Do7giUFHOE3IbpTe7cqgVyvv7udZ3lUE=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(36756003)(33656002)(558084003)(86362001)(5660300002)(122000001)(2906002)(38100700002)(186003)(2616005)(6486002)(71200400001)(38070700005)(26005)(6506007)(53546011)(316002)(478600001)(6512007)(6916009)(66556008)(66476007)(66946007)(76116006)(66446008)(91956017)(8936002)(41300700001)(4326008)(64756008)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8BD20ABEBB49B84695EE18C0F53115CE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5493
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9a5ee852-1d30-415f-d9e7-08dab03884dd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bIm2R9ClKHXQLbRoZ+Hh5HyOCyAtyut5w3lDv9sDsF2RX8xzM8Hih7D5LU5joANYllc7pV89ZC1zsriEgYA5nCu0xT97OTe0FfoAFrXRfYKfD7qL4rmru3+DEbizi1bL4PK6sPg2xzQinJSjHZUOR/FrTJ6fIwccE5LovLkgw7aS8eDs6S9s9fvedxd/ourQyJOHfs1sD4oxCXkcfFutJ7LTp7xCKHe1aoEYiIUuLg0SIYD83yuaALvFRBk93YcU3rXk5WzIHT+Srgn716L0bEsTdkQNcVReGL0x0kDCICqcSI75+Eo6fL2L6tB1rdwQtQHaEIkllIi+WsyvbpC5SFn3e/5BkZYa9H5xnIakKrcz5ocrlywH1XdCgMrW4ZqcyMhiBZaJ3Q379NZZvXIPfZEfq3S/txserwCzxY946TUOEy3knuO8LtYWgD2lS9jyffYJFHjQGleqfLVfYr9+PQFDlfd7j43EPv4wyrC2y5gecsuzLTsuqTv4EaXkVwt8Vlte9P0NnxKvbZaSJ9Zk0Zgkms23igZOalmfOODmxly/LmiVa2eAM3XoX76dMX8uFskuV82NQvYqtQtqwZp92lU0Jl4Phzawr8BqJk/kOMxOrgjY4jdBel52B8nQW1bg/xdiM2VlebZ7pLTEJY7Cjkq3bK25wlMUIvIcBxalXGo914YguxxlIlKZGbxWzxOWp484ii/BJdTQlPW+uymebB9MNQ4jL9BzMf9irhINnhpSf8VR8+quKPuBI1Dn21Razsi7sOK02INZrZ91CkBsKw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199015)(40470700004)(46966006)(36840700001)(47076005)(82740400003)(82310400005)(356005)(86362001)(40480700001)(81166007)(558084003)(40460700003)(33656002)(36756003)(41300700001)(53546011)(6512007)(26005)(6506007)(8676002)(4326008)(6862004)(5660300002)(8936002)(70586007)(6486002)(478600001)(70206006)(316002)(36860700001)(336012)(186003)(2616005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 12:10:10.0587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d3112ff-b63a-4066-d550-08dab03889ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9838
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 12:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171906

On 16 Oct 2022, at 22:43, Tom Hochstein via lists.openembedded.org <tom.hoc=
hstein=3Dnxp.com@lists.openembedded.org> wrote:
>=20
> Since libvulkan.so is commonly loaded dynamically, put it in the main
> package.

Can you give an example?

Ross=

