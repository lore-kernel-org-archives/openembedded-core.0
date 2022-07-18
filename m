Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28978C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 16:12:43 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.49])
 by mx.groups.io with SMTP id smtpd.web08.29324.1658160760319139670
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 09:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=FfRSZqXu;
 spf=pass (domain: arm.com, ip: 40.107.13.49, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cr/8lSMtgsOM/9fYIk1THbGW6sckQCA9zlzw+XSr5xSBagwsiKYn7/2ppOcJuc3OAA1kslbBPRSjHmDzSvrs7HTIvHtA4GuwK/D8XYln07e0EOKBgHZnq39pmH6h/TaeB7eNPbbd+PUZDPDdhZyB8ziHKjzMzw6QKVd6Mj6ODr+CyHKhGxCDJkCdIlphDAmx505gu+7ESEpvIogl0enVAwJqd6RjTVxglxe3YM727yMFFVF09nbVaCeaOT2IN3gL2DtPqKTPBIIat+ViebXGM1CYW1y8Vy7rEXTlosDO5NCatr4lM1hHXRRUtPo8WyqeKJsqm9xQ0YI8lw2vgGnHDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbUBHIBWJTqsn4xC4b5MgXuZ/adz24dfGpWztVrNFYA=;
 b=HUFSw5bKT5uNaloc9Neg/nYc6veUGv/6X+Mdz7UCxTdKUvnFWmiXNvmwQI+LXeT2+pA8w9hH4R6Wy1ez8qf8jaIF+q7x3d0hnq1mDEVPv2R/Df4M/dsP6kDWMUKQRli6QA2HPoauCvfnxer6kId410/kw/iNLfYVrx9XBCtUZlwZPFz7I/mjqxE8cmXxXdNl9rBCBT1qPfMAHGZ5rAQHaLLKDUol4kP/jC8ZJqrpBQEIEks3ItC9TQLaDykhaGiT97f0f3oeTikrTcKoqBRL/Ka11W0R34xMqUL43d8xTP0XGzpIy1vZxzmqxpI9UuFBhisBq01gEP1DlKSa0pdj/A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbUBHIBWJTqsn4xC4b5MgXuZ/adz24dfGpWztVrNFYA=;
 b=FfRSZqXu93n1QY3NPERBgAbqcZJUOs3okB/8UHraOqhbAXTANsV2Wlh/9wwOIRGDXE8D22BmisEJKb+YLTYoABAhtolbfkXVz47GJM3/RwxLGUSkFILKfWI1KgIxQFjyziNCXxSX3Uc9Iqsi6rIWMFAKcLpqZl4q9k+eKe1ap/s=
Received: from AS9PR06CA0336.eurprd06.prod.outlook.com (2603:10a6:20b:466::6)
 by AM6PR08MB3431.eurprd08.prod.outlook.com (2603:10a6:20b:44::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.22; Mon, 18 Jul
 2022 16:12:36 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::f7) by AS9PR06CA0336.outlook.office365.com
 (2603:10a6:20b:466::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15 via Frontend
 Transport; Mon, 18 Jul 2022 16:12:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Mon, 18 Jul 2022 16:12:35 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Mon, 18 Jul 2022 16:12:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0c3cd3f3878454a5
X-CR-MTA-TID: 64aa7808
Received: from fd44d83c3e23.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3BF80CF4-2F1E-4737-80F7-CB2CE7B04CDE.1;
	Mon, 18 Jul 2022 16:12:28 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 fd44d83c3e23.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 18 Jul 2022 16:12:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DNIbYtXvfWLQb3wfw9Ib/3RpFJUG/qWGa2U476x9ZvSruTvx72u9v4ps/qidd7TdFYOKnKK/lBL+6R2ggDwfJBkuojrfdJOc0AxF6fdVMeyD2+adykJDhELYakzIu7t/LyCmCY0MJkHQhbEHpuHrrm3n9FtHyaf+pi0ulldo9F3KePl+T0QPnEGy091iw/zH4/qtFbX903Wn2M0IlmsGman4te9VsvLok5O7GKHRV5Rf/8tPI1R64fLapZ0xYlkQ0Fri47jRgWDYWzzZIR196bq3LJnJmCy/SvKitaZTvK09QWluLkcD8MKP6I82Za3UcTzo/076gFyoO/5j0FMxqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbUBHIBWJTqsn4xC4b5MgXuZ/adz24dfGpWztVrNFYA=;
 b=F39Xf45IbplKptKr32HNRphshx0XlulKBuYFOA2cOITz2ecddC/mWbqphHTdN2Me/u0GWNPyXR15z+025i1x0D+wYyAM5sn8GTznMbEveV9obsna4kFskWi7E/qI8asvomJi/sEIMe69X7fDG9uaJXttUbiKFtx2bEFPNwt/vHAiv4IQMaCNOuxSvvZGdJpedrICGVjDNuQV+rOvqe1kEfgsZkzMTSZtnFn9jWvtdPN6yuCP34FRZ9HqOiAja16b9I3A8ihm80xXefsK/EwGgwvR0N/jsyyM6vYgpWv8l2mbSwB0GVnhxzn+aBwwAJ5k6M9KHWlCOqdbr/7fyDQp3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbUBHIBWJTqsn4xC4b5MgXuZ/adz24dfGpWztVrNFYA=;
 b=FfRSZqXu93n1QY3NPERBgAbqcZJUOs3okB/8UHraOqhbAXTANsV2Wlh/9wwOIRGDXE8D22BmisEJKb+YLTYoABAhtolbfkXVz47GJM3/RwxLGUSkFILKfWI1KgIxQFjyziNCXxSX3Uc9Iqsi6rIWMFAKcLpqZl4q9k+eKe1ap/s=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB6PR0802MB2311.eurprd08.prod.outlook.com (2603:10a6:4:87::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Mon, 18 Jul
 2022 16:12:26 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72%9]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 16:12:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Sean Nyekjaer <sean@geanix.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "denis@denix.org"
	<denis@denix.org>, Richard Purdie <richard.purdie@linuxfoundation.org>, Khem
 Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] zlib: split SRC_URI into inc file
Thread-Topic: [OE-core] [PATCH v2 1/2] zlib: split SRC_URI into inc file
Thread-Index: AQHYmEHW/vxvvgN7n0iCbjdQM7dB8K2EUdKA
Date: Mon, 18 Jul 2022 16:12:25 +0000
Message-ID: <FAA024DD-6837-47D2-A00C-A37B146CA2D9@arm.com>
References: <20220715115515.4012984-1-sean@geanix.com>
In-Reply-To: <20220715115515.4012984-1-sean@geanix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4ef211ae-5e8c-4df4-af0f-08da68d853ef
x-ms-traffictypediagnostic: 
	DB6PR0802MB2311:EE_|VE1EUR03FT004:EE_|AM6PR08MB3431:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 eftOmyH4AcAEFmBbOh1CL5LQJFV0ri4u9UT4InSQWiAA5TdqqTkxA6CLKHGv/NvHE1SohdPBWMlkOPPqlNB+YSY6OpnQvEr1SZexPDXX7AaZpHLi/g7UEn8ddPQn2f9fiM91fYnMolyjAoyvzg1q4Jac1fJiCSo6xsQL2wmnnOOAkmnSdUHNnzymQflzyBwRnqYtw5SquX+srx5v0b62nHE/IXw06/VDxYB6BKN77HhYpzXRwTJXABL47qhKsYEFr+RwjGcfbFOECzuFF9SBSOBe2EzeTMJ6PpSB1vdeBP1dKjRXgWHHGP9FtPEoiw5gwEDzTFS2io3Er1u4NyuXYG5/Z09v0qoaQpfqEwafGUhdWkdRFl5a+S6LgyQLW6f7w1YCV4g/a/4VCYR4stHwihK41r3KfK5WPBRKBcrpjPxU5svOSGnDpr/I8C0+42T9F1BwnxyutjfTNcZiP+RmqYmavoDb8FNCc4T/Huvv/zC3AmcgbFxUxQc0QI02t5TwEGmmxS9d9NPuV8S9p7h3nF/tYvbPUiJvL5xFyH1fg+iAvoYTRjsErGf8zbmxYSeMqtP6ghR1WAy5TZV6u1WC17huwF2nHiX1goLSvtAvZC2NC/aT1ZAIssujSQDzwBAW9wdEk1r0FQJYBs7xdgNmvfxIBszgdQC/pGeZTG3S+nxNz5Za7OlzgRAoY26M5nWtM3vcwWnan3mIW4Iu5J5qDxJ0OR+TiHlIPoIhNvrBIODDaOU8rYTRRQV/Y4Z9wDEu+397N3LYQewFzh9GkRq5jYoD9Sn8CJq1R+/cwihf2dShdxmuhc3Tvemws8H14HJFCVC7tXCSB6EKg5akwhCwL5XV7Ll5CgSK+eAsL8zC/W5gWNDlDYEexgEMarJ1a963
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(91956017)(66946007)(71200400001)(76116006)(478600001)(2616005)(38070700005)(41300700001)(6486002)(966005)(83380400001)(186003)(36756003)(66556008)(66476007)(64756008)(8676002)(4326008)(66446008)(54906003)(6916009)(316002)(86362001)(5660300002)(2906002)(6512007)(38100700002)(53546011)(6506007)(8936002)(33656002)(26005)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <93B3B909F704C44793B195A5A6DC51F9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2311
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b9564185-5d6c-423b-8359-08da68d84e15
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	blbAQoFGfnL61GiaOCgvdmHCcvf4bVXS4mceBqh8jCnQb3NEHe/CL5vTb2sHXYxC8F8mVc+4AlXmJlWIPNwma3Bc+ZsmpiyNWnaybPal3mG0PEyDwwDIPU0DnNvqmEt+0smINBrsQ3vHTXP55xUIqiKVwsWNPMVyIU+j7PfocN9CTivum2Z17wz/SL234xwaKF6Xmdn3D5q4KvFIb62Uh+hjRL7E4/Vt3atPGwLVNKBv98FTJbJrTR7eXQEPs9LJPuurHv7I+Z0lIqq7bBfqESJ2/IVwoSKJqHI0JzAp/DklTRSYCkQ3EgPaFHcgKMXTlv5T19z0bqtddUfHqcViY2FfLzC3n8GD55J0roXBkD/JYZb7v7Yx2Xcix0eR1aoikgPvlnAMSaIiDvcwU5Wdg4pn9oZBk9u/NEDAc9ZIYiLpA4q50BS7gzZKZNhvfrf6JkuhZKBJFiQZ/C3b+XDRdwegBppAb9hT9nnRpiWZnZ3DDMExLhsFApGq6xZcLJILxnXkkxbNTgnoe3oK+XBkbcN6q97xXbL5RQsPY9Qshmf5PGcUP+I/TJbxKAGvD2slDSa3t/sPn8wcnedP3KOyTvbVhYCLj8jvfcMRSuJ+36oyGwkyV2k06am+9YryydcW/QC1KnMruch6VHjPIwZOgo/5z8p/2TOGlZNL8LxTl1f+6Edt+w7m8fJ59RqT92AF2ge5iLrKAmmcHih2H+KCo8zB+WF3eD1MRQ901hThoVpaY+in/o2UZL68I/f6sEGQ7CkbakBuK9HNWoXMZ0m8r8cOwrPrOMdBGL9F8y198Q4xs10/A7f4S4EdpjISWosrOMGKwj4fXZFmKMdbMrETchkxJy6QJzm9lsUacAwK3Ow=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(136003)(396003)(376002)(46966006)(36840700001)(40470700004)(40480700001)(5660300002)(36860700001)(316002)(40460700003)(82740400003)(54906003)(86362001)(81166007)(2906002)(356005)(83380400001)(8676002)(186003)(107886003)(47076005)(2616005)(70206006)(70586007)(336012)(6512007)(478600001)(4326008)(6862004)(8936002)(6486002)(26005)(41300700001)(966005)(6506007)(53546011)(82310400005)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 16:12:35.5694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4ef211ae-5e8c-4df4-af0f-08da68d853ef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3431
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 16:12:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168240

This still seems overkill.  You can build minizip from inside the zlib reci=
pe by fixing the minizip Makefile (fix posted to https://github.com/madler/=
zlib/pull/681) and then adding one line to do_compile:

    oe_runmake -C contrib/minizip CC=3D"${CC}" CFLAGS=3D"${CFLAGS}" LDFLAGS=
=3D"${LDFLAGS}"

A corresponding manual do_install too, obviously.

Ross

> On 15 Jul 2022, at 12:55, Sean Nyekjaer via lists.openembedded.org <sean=
=3Dgeanix.com@lists.openembedded.org> wrote:
>=20
> This is done in preparation for adding packages from the zlib contrib
> directory.
> Unfortunatly it's not possible to add these via pkgconfig.
>=20
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
> With this we are maintaining the same verison number for both zlib and
> minizip in the recipe name. Would it be better to have it in the inc
> file?
>=20
> PV =3D "1.2.12" ?
>=20
> meta/recipes-core/zlib/zlib.inc       |  4 ++++
> meta/recipes-core/zlib/zlib_1.2.12.bb | 18 +++++++++---------
> 2 files changed, 13 insertions(+), 9 deletions(-)
> create mode 100644 meta/recipes-core/zlib/zlib.inc
>=20
> diff --git a/meta/recipes-core/zlib/zlib.inc b/meta/recipes-core/zlib/zli=
b.inc
> new file mode 100644
> index 0000000000..b607a82312
> --- /dev/null
> +++ b/meta/recipes-core/zlib/zlib.inc
> @@ -0,0 +1,4 @@
> +SRC_URI =3D "https://zlib.net/zlib-${PV}.tar.xz"
> +UPSTREAM_CHECK_URI =3D "http://zlib.net/"
> +
> +SRC_URI[sha256sum] =3D "7db46b8d7726232a621befaab4a1c870f00a90805511c0e0=
090441dac57def18"
> diff --git a/meta/recipes-core/zlib/zlib_1.2.12.bb b/meta/recipes-core/zl=
ib/zlib_1.2.12.bb
> index e921703137..ba986d8cf2 100644
> --- a/meta/recipes-core/zlib/zlib_1.2.12.bb
> +++ b/meta/recipes-core/zlib/zlib_1.2.12.bb
> @@ -6,16 +6,16 @@ SECTION =3D "libs"
> LICENSE =3D "Zlib"
> LIC_FILES_CHKSUM =3D "file://zlib.h;beginline=3D6;endline=3D23;md5=3D5377=
232268e952e9ef63bc555f7aa6c0"
>=20
> -SRC_URI =3D "https://zlib.net/${BP}.tar.xz \
> -           file://cc.patch \
> -           file://ldflags-tests.patch \
> -           file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
> -           file://run-ptest \
> -           file://0001-Correct-incorrect-inputs-provided-to-the-CRC-func=
tio.patch \
> -           "
> -UPSTREAM_CHECK_URI =3D "http://zlib.net/"
> +include zlib.inc
> +
> +SRC_URI +=3D "file://cc.patch \
> +            file://ldflags-tests.patch \
> +            file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
> +            file://run-ptest \
> +            file://0001-Correct-incorrect-inputs-provided-to-the-CRC-fun=
ctio.patch \
> +"
>=20
> -SRC_URI[sha256sum] =3D "7db46b8d7726232a621befaab4a1c870f00a90805511c0e0=
090441dac57def18"
> +UPSTREAM_CHECK_URI =3D "http://zlib.net/"
>=20
> CFLAGS +=3D "-D_REENTRANT"
>=20
> --=20
> 2.37.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168059): https://lists.openembedded.org/g/openembedde=
d-core/message/168059
> Mute This Topic: https://lists.openembedded.org/mt/92398812/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


