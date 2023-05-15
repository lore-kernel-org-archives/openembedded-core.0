Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC24C77B75
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 11:24:42 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.67])
 by mx.groups.io with SMTP id smtpd.web10.86153.1684149880654973160
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 04:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=y9S+PaPF;
 spf=pass (domain: arm.com, ip: 40.107.22.67, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqsQRHXk+uHXRWWI0EozjHYbepfka6h2fBDl68qervc=;
 b=y9S+PaPF1ZtMzWtgA+oPYgY1xXmtrT7+se+T3FuxhwYEop5GPq6dhYk4ZgfHJD/gQsUYRTYgSoytJMYbKQ2kSeBnbSoYVCE9UI71MvKiLGQVILZKkICt5e6spD7HVTbzUw9oIoXL2lS+cJNUHMGXe4FBnBHTjWkXF1B9RgnaENk=
Received: from AM6P192CA0073.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::14)
 by PA4PR08MB5904.eurprd08.prod.outlook.com (2603:10a6:102:e5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 11:24:33 +0000
Received: from AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::54) by AM6P192CA0073.outlook.office365.com
 (2603:10a6:209:8d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30 via Frontend
 Transport; Mon, 15 May 2023 11:24:33 +0000
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
 15.20.6411.14 via Frontend Transport; Mon, 15 May 2023 11:24:33 +0000
Received: ("Tessian outbound 5154e9d36775:v136"); Mon, 15 May 2023 11:24:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9996ef2ba83163d2
X-CR-MTA-TID: 64aa7808
Received: from 8545f7ac038f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BA11F476-4BB3-4815-B254-31E616184204.1;
	Mon, 15 May 2023 11:07:39 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8545f7ac038f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 15 May 2023 11:07:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibREiYBDrMpbSblfixILTPQQTjUgS4BgxRIsOXUzXrhXxcDsFIcvaSuThN1hD0GQr8j26QmahoiLLfnvq9KB1B+AEDWe//Q4V0VNT4rhyeSMKrb7jLB5ZAJ1RPdORHgvdV/+HR3/cKEZPIy7e4D5s/bFgRIJytnPuM1Pjj+kuE4+J53jbgq9cp3Or8jasdWo1wVMK5atEiCVBpPHJSARm8XCTAvplaR1BRci+Mi1uVKhGJDmo5WRZ26MfS+MvZXc1m4DaR0OSlFqMExuf/6K7GK9QNhGBKR3xPozhONuUg9cw5g6I47X/0x6p1E4AVV1W9CpMChRB2tqR/YFPJd0jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqsQRHXk+uHXRWWI0EozjHYbepfka6h2fBDl68qervc=;
 b=P5RtU8Oz3lvKAOvCkoxA0v9zkdS1dZxOZqRNrwdPjXkQZMHYEQMb24vnr66H24f8dsbQzheND1Q1GJ5ub8H2935yRHXohe75OZhluqLc7WnG6srOuIWY40s1KrZVcdJWE9iKp0WBWko5YkO9JI3Psm0RRx0IsamH18YooleWPEaYZq3vVra4pM6cCMXWn2QeHnVaDkYiAc7PQ0P6mzxwgOd4F0GvGhY/UZmI/zQOhzItbqauSan9V0w1oeX7heCaDENHjcW4rVfqWfEpqOXHguHXgNWGgguZc8RaWt3fyhWm0fZJfziMeTsI39IIUw2N9GGWT06c9yApLts3fbmqKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqsQRHXk+uHXRWWI0EozjHYbepfka6h2fBDl68qervc=;
 b=y9S+PaPF1ZtMzWtgA+oPYgY1xXmtrT7+se+T3FuxhwYEop5GPq6dhYk4ZgfHJD/gQsUYRTYgSoytJMYbKQ2kSeBnbSoYVCE9UI71MvKiLGQVILZKkICt5e6spD7HVTbzUw9oIoXL2lS+cJNUHMGXe4FBnBHTjWkXF1B9RgnaENk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9118.eurprd08.prod.outlook.com (2603:10a6:20b:5b6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 11:07:37 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6387.029; Mon, 15 May 2023
 11:07:37 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "schitrod@cisco.com" <schitrod@cisco.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, Alex Kiernan <alex.kiernan@gmail.com>, Alex
 Kiernan <alexk@zuma.ai>, Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [yocto] [dunfell][PATCH] pypi.bbclass: Set CVE_PRODUCT to
 PYPI_PACKAGE
Thread-Topic: [yocto] [dunfell][PATCH] pypi.bbclass: Set CVE_PRODUCT to
 PYPI_PACKAGE
Thread-Index: AQHZhxvVOI1M5oeFjU6GPRRiZ2Qrvq9bLKUA
Date: Mon, 15 May 2023 11:07:37 +0000
Message-ID: <035854D2-4E6D-44B5-B840-DD6139759496@arm.com>
References: <20230515105516.484857-1-schitrod@cisco.com>
In-Reply-To: <20230515105516.484857-1-schitrod@cisco.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9118:EE_|AM7EUR03FT060:EE_|PA4PR08MB5904:EE_
X-MS-Office365-Filtering-Correlation-Id: 7338c48a-2be4-46d5-6de8-08db5536f50b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 H6m/lYJ1qXQVCjJQZ8bdbIJpqkdmn/62Zvv06Jtt2xoH+Jc/W4n4kgHt38rpv8kANW6h0amqBweQhiimVOsYUpBog4AXB3mNRmQCvt8fSbYEDCjXtY6MTVfszlBu6XR4Uz18XEK1fWIo5WUGcpi+IVchhPryRCkmonVc4X86tam7bWxdItPMHU32JFZR8yFWNm2PmuTw6VWsmrUqXyoY2z8A2oUVtpZDe0BFWFI5WFy02tVLKH24WMKNh0jXwnGyYpSNUBIvMqKu4+0z7nSJIueqANd5InosQP0NhmFCeo0YA0FgpwRZW/NavbqUIMuwXiw2qW4tdkCqmWxas+nY/6UwWSK/X92ODzBfrxobMctQj3r5IEXAfyWepXt3g0F2lkM5JbWThgHXrPSkaJD1KZthI58Cq/VQEukKpst8NCMiXUOcnUyA0Y7KyyA31T9rAbOsRW3nWR0ipZ5sSbBztJtkwcME+9iP+7ELF527NDRO2QwFyopHHNOKMTjixdsLfOy6RlPKzwCv+CGFqgAZK6AVyFtQH6F5K44rWM0oKIbZX3oiqkB/osORMZDPE+7jT+qc1TbY2JMQ53wxlMuckxXV/O8hEaKrlkXq3BPp/SmgnuJgVsQp3aMf+1r3qHUYNc6kE2RpnZFxOHij7ed2Hb+BUDnwTpHTcj/7bEqinjE=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199021)(83380400001)(66476007)(66556008)(64756008)(66946007)(66446008)(91956017)(76116006)(2616005)(6486002)(6512007)(26005)(6506007)(966005)(478600001)(54906003)(71200400001)(186003)(86362001)(8676002)(8936002)(5660300002)(2906002)(33656002)(36756003)(41300700001)(38070700005)(4326008)(6916009)(316002)(38100700002)(122000001)(66899021)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DDB8F4A0477F0C49BC9EE2C3BC474E51@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9118
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a41a0cb7-0991-4250-0d68-08db5534978f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pbBjcL9J+BEmR3qsOEn3tLNDzokLGI9kYUonm8k+05bXIKAp00uo687k5O9/MyI3bo2/iW5CS2W4LnYp3IxnhZiBRBXECULhsI+HNtBHlamAgqafDjsKnwt9mQ/a4luSaqHEgsYYxWeCEfW66tNr//Hn8adct3oe/fk1WbZj+CIb/TiaV3PEBybG+rkbxPY55mqgCAsyR8p7I5sGOOGFIQmH1LYX9mR4g5SrUFd22ISEM7O8Dd/Welo9MSP+/TZBqb6othJ7uLMfiL6bUisbqUxNo9yOQowjvIeitO1adWFk1HcV1NkKZ2mqO7bu4l5N4WWEqnYBh9GL20vX4agmHR7P6oLfWv+rKZ/q+1wEI5QGf89GZYVHXjFJf6lDTKU7gf/IpbC/EyxisV42Pqq80t7HzD8Nx61AgYH2bqwPwQmhmGmKgmKcoz+Uz5gL2WFdENE/JIVLrWysxVGhBO82TwtX+rp1BLK+tmVJxx0wK5yf+cJRM9NKjX9avK00G0tOHHxCRPcPO/rqWtcnQtUV62ElWrGroNaO1iY08Xz7tO1fuphbqTJDnCXahRx2vH9dwyzAZTC9UXDhC4mzIzU5aJL4uN7mL1tXMbBzNbeWQdsosNNpyFhLHSY7qQS7hMGqyHQE8BPjqI8M9pkK6RG7Hyj42ayjK8zdtIWeLg4jN24Eu61jtxddkYUZFENaIHr9eFHUv/i/qwNqygqJ1OvHYhG9mJMwMGexv69bfatailE++s0eNEPoONGBn2IGMpPe7CaL5hTBnXJBJboidbXREg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(356005)(82740400003)(4326008)(8936002)(6862004)(8676002)(66899021)(316002)(40480700001)(41300700001)(70586007)(478600001)(70206006)(81166007)(54906003)(40460700003)(36756003)(186003)(82310400005)(2616005)(107886003)(6506007)(2906002)(26005)(83380400001)(47076005)(33656002)(6512007)(336012)(36860700001)(86362001)(966005)(5660300002)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 11:24:33.0037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7338c48a-2be4-46d5-6de8-08db5536f50b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5904
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 11:24:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181242

This patch should go to openembedded-core@lists.openembedded.org <mailto:op=
enembedded-core@lists.openembedded.org>.

Thanks,
Ross

> On 15 May 2023, at 11:55, Sanjaykumar kantibhai Chitroda -X (schitrod - E=
-INFO CHIPS INC at Cisco) via lists.yoctoproject.org <schitrod=3Dcisco.com@=
lists.yoctoproject.org> wrote:
>=20
> From: Alex Kiernan <alex.kiernan@gmail.com>
>=20
> The CVE product name for PyPI packages is (usually) the same as the PyPI
> package name (and not our recipe name), so use that as the default.
>=20
> Signed-off-by: Alex Kiernan <alexk@zuma.ai>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 61f6b0ad09bf87cdc2d3f08770b7c44cad1d0e58)
> Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
> ---
> meta/classes/pypi.bbclass | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
> index 87b4c85fc0..c68367449a 100644
> --- a/meta/classes/pypi.bbclass
> +++ b/meta/classes/pypi.bbclass
> @@ -24,3 +24,5 @@ S =3D "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
>=20
> UPSTREAM_CHECK_URI ?=3D "https://pypi.org/project/${PYPI_PACKAGE}/"
> UPSTREAM_CHECK_REGEX ?=3D "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
> +
> +CVE_PRODUCT ?=3D "python:${PYPI_PACKAGE}"
> --=20
> 2.35.6
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#60025): https://lists.yoctoproject.org/g/yocto/messag=
e/60025
> Mute This Topic: https://lists.yoctoproject.org/mt/98900696/6875888
> Group Owner: yocto+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto/unsub [ross.burton@ar=
m.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


