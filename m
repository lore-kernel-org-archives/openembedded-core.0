Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A5CC5479D
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 10:53:39 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.80])
 by mx.groups.io with SMTP id smtpd.web10.11239.1673002415410098848
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 02:53:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=9zwTA0RX;
 spf=pass (domain: arm.com, ip: 40.107.7.80, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vz+Tp+l5XwTndIQf+aFjtAgOCS4OwdG9QLlqrjNT3Y=;
 b=9zwTA0RXz1qFJW8Fd+G1oq1iLtlvbjn/86JQHv3vffE3gPhNwSmM6GFerKHWxtKQ7nKLyIeye22a+aLyRWmiBPwp5Ik0Hwbnimx0KM+lUTfSrUiD3RdvTjEkY65awjvVgVpCh/wtWlohI2IltOYyifjgpEoTOc8g6s8yOGVZqTc=
Received: from AM6PR10CA0106.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::47)
 by DBBPR08MB5979.eurprd08.prod.outlook.com (2603:10a6:10:205::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14; Fri, 6 Jan
 2023 10:53:31 +0000
Received: from AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::7a) by AM6PR10CA0106.outlook.office365.com
 (2603:10a6:209:8c::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Fri, 6 Jan 2023 10:53:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT009.mail.protection.outlook.com (100.127.140.130) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.17 via Frontend Transport; Fri, 6 Jan 2023 10:53:30 +0000
Received: ("Tessian outbound baf1b7a96f25:v132"); Fri, 06 Jan 2023 10:53:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: caf201800842d8b2
X-CR-MTA-TID: 64aa7808
Received: from 92f8ffb0e0e3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DA9C0D71-FBDD-4119-B9B6-2A3C5DDBF420.1;
	Fri, 06 Jan 2023 10:53:23 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 92f8ffb0e0e3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 06 Jan 2023 10:53:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KIcVzG/CziEVaB2CGfOZ6Te6dUJ5dyv0etpDIAbl8NNitkdVKzMSSfeQZgdhUnMrDFWvE1AXSjN7bTSjzjFtBlPPs9Qm5gk5g3GbfRb7qozk5PZF57jq022DbsNqSA/agX/Fy9kVnU3+6NmZNIuEt5uId7/qObKD+Xk/YkSTh39yPABtlVrKim2hU5Z+zklt7m2R6O3uujqJqMx6stxCLuJTlSdmN2lEFFxlhS6os/lu52Ozj6qC6Awp9L5jA7P5GeL+Ky9z7raIftFWvUeAXhlNciuloJeu13uYDl05hSf7ga/E8vQ93mCugYI+JN9KEm76PvPhqlC9kZLlZHganQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vz+Tp+l5XwTndIQf+aFjtAgOCS4OwdG9QLlqrjNT3Y=;
 b=HHdRKHGFrZSQvnFC8lHLu5sd5YBtlFMwYGmkfI+9t9L2Lkc8N7RTMmdjij1aXIVnpoTVmhpVR92TY23PKrVrmpprVZAxxQ7SAuAPqitk7/S6q3e7jNxWJmvubUCUq9FfRdxD9m430itwJYhsFrtF1syPW191A/s2loyTwMWbC3RCqOOl3G/FqQQ+pXbEl0G29vzQcgkgdXVruPuUWhq3XbOHsVM8/oIg6XqXWU1O4JrfoiuuQSqBJ9Hfftqb4ygihIGeUeXif4o4wQlFriYhm3+vuB0ECq14gyiVeqFTKF7ZU5HQ1pwFXMjT/dhvvz/24WAd/G1WpMPOv+SYNetomw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vz+Tp+l5XwTndIQf+aFjtAgOCS4OwdG9QLlqrjNT3Y=;
 b=9zwTA0RXz1qFJW8Fd+G1oq1iLtlvbjn/86JQHv3vffE3gPhNwSmM6GFerKHWxtKQ7nKLyIeye22a+aLyRWmiBPwp5Ik0Hwbnimx0KM+lUTfSrUiD3RdvTjEkY65awjvVgVpCh/wtWlohI2IltOYyifjgpEoTOc8g6s8yOGVZqTc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9032.eurprd08.prod.outlook.com (2603:10a6:102:341::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14; Fri, 6 Jan
 2023 10:53:20 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%4]) with mapi id 15.20.5986.014; Fri, 6 Jan 2023
 10:53:20 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "ceggers@arri.de" <ceggers@arri.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][PATCH] boost-url: remove recipe
Thread-Topic: [OE-core] [meta-oe][PATCH] boost-url: remove recipe
Thread-Index: AQHZIQcAjq7UWSk9MU+96i5Ry/ZliK6ROBKA
Date: Fri, 6 Jan 2023 10:53:20 +0000
Message-ID: <5B438F3E-6A5A-4C26-8F88-814CF183D014@arm.com>
References: <20230105130858.29883-1-ceggers@arri.de>
In-Reply-To: <20230105130858.29883-1-ceggers@arri.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9032:EE_|AM7EUR03FT009:EE_|DBBPR08MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b78c5d-eacd-4f32-4afb-08daefd43fa5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 haSdtSG5X1XXjerVr5GtqzSB9yMvYSLUalfWYG5JnutR34iRvUZcj2sfBtlR+06lgRsgvbK2nCB2pUPpSYVRmWacDm5TUmHVwp8RtoNHI9pm+q333P5rT1+uJPBkoj7I2VYQAt2QCnHZ+zhJvyRoVK9i8cH9suFKmErH1EDmiznBNrkA93ALVfXm1nc2PPglEN0TKCpVSWkXHyfTrFj0/s5RerXhLYN2RqcxN6iawPz/0Cm+lihcf42TQLhTIiRdGaHzdJta0orY1HWSoW88U/wIiogBNz8hHDpbyndIJl40Qvgcx6SCO2ysi/u7vq8y/8ExGD9yGPI7WCAHNR7X0j7fWCCUbtQVn7R+se9wdubWEWeVfkoyYW7EPiriFKmgpbPexwVrZKUXP0YkbkaLcGJZIGbqq5vORONc80jlpFvqKcr8pc/zAZDqAwcIHjadMI/JV6Y1KBwMTKNbCpXCKysbmzll0DcKWanA8TRrpQEYFWE51wbphHTB6chh4Ak3YBhQ9o+otP+Hxn55ZFWp9vSE2lK3+PodtBbNGykMjgogsgYNM/9lXmQuUrRwaPJ2QYXchGbLAW5ujsLyxmHCbF5Lq24dE6disiaqkfpcJ5DZeFOWKghrNMmq16qCJnRh+PVJ9U/qeGiEVIHxHOK4AwnlJYGHiltBtocrv1GzrQuL1OZrkY1Mwc2Tk99UrJWNNbS6QxZllD+qiFhKe40eVk1JLrDDLgz0Iqf83xLiIOcWLbEbxSlLcKvEW1BctyZeQqzZAPtacQtUjVSPP73sCA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(451199015)(41300700001)(33656002)(36756003)(86362001)(83380400001)(122000001)(38100700002)(5660300002)(38070700005)(2906002)(66946007)(966005)(76116006)(6486002)(6916009)(71200400001)(8936002)(66899015)(6506007)(53546011)(2616005)(478600001)(4326008)(316002)(64756008)(66476007)(66556008)(91956017)(26005)(6512007)(66446008)(8676002)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <30A64813B1D0E6469897FA1D113E96E9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9032
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2feef1de-9792-4f36-9206-08daefd4398e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	b4m1DECVBd/RYfcrSBsJSLGRCJYJRJwLjuDCtDL3OctG4hHf3ANdQu/ydG6CrhF4XdVtCLEtOeMjPAHWMq6149xd3qX2qbopSPL0WU5baFcZEMmhgsXfUvEqAxjgDGoXTMcwUHmIZGDbCQURgdclQUb8QTis85L2SX0GFXcr61Pb8VmLWayoYGcOXk5Pn8wrk1FqG4p/fQLryX7SNGLluqdf99EvlUMtWUH5z58ZjmhcjIRuoTe0Kauie40uH6bWMPMoGD5J2ifoEtVYN09L2mPzWdOSB2AMau8ovW0Ofn+qzgqHtQjoaxhb3lNK218q/0VjhKcEUvP8y7C5U+4rPISczj74Of83wkzEMkTWR4LqGDutarOo/E73CUkrYO9a/CU/RM3GIFdhPOOvQfhG6UknzGUME5X9utyrxFWNI/CtvWQcc00P1J4GzmVPW5SzuMruWPjv/PjOSijG/WDjOVVdUKsVHesagbOubWY3SOcFIcA/bee8wDUVMUgN0g/vseP42M3KI7IgC85/rJB/PM79XmTNTyojPQv9PyThX4duSH7ILegRE9Wgu4NUEVpJB9ZReBZVTFLq5PU/X3DdwwHf11qhsKrnhkdATIG0x9qQ6y1Y7jOgYqwC0wDrUj2c91iLdZovOMG2UN/zARhyx6XZQVPZawVfWWVdYcBQsf0McLAmgvBqPO0/HtyvNWF0QkE8gx1wrFfsnoLXnZiVe13IzYg0nmBT75wPu1cuh6Y=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199015)(46966006)(36840700001)(40470700004)(86362001)(36860700001)(5660300002)(83380400001)(356005)(8676002)(81166007)(82740400003)(2906002)(4326008)(8936002)(6862004)(70206006)(70586007)(2616005)(82310400005)(41300700001)(478600001)(6506007)(26005)(6512007)(47076005)(40480700001)(186003)(53546011)(40460700003)(336012)(316002)(6486002)(966005)(66899015)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 10:53:30.5624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b78c5d-eacd-4f32-4afb-08daefd43fa5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5979
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 10:53:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175573

This should be posted to openembedded-devel@, not -core@.

Ross

> On 5 Jan 2023, at 13:08, Christian Eggers via lists.openembedded.org <ceg=
gers=3Darri.de@lists.openembedded.org> wrote:
>=20
> The boost recipe in oe-core has recently been updated to boost-1.81.0.
> Starting with this release, boost-url is included in the boost
> distribution.
>=20
> As a prerequisite for creating the -url sub package from the boost
> recipe, the boost-url recipe should be removed in order to avoid
> conflicts with installed files.
>=20
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> ---
> .../boost-url/boost-url_git.bb                | 20 -------------------
> 1 file changed, 20 deletions(-)
> delete mode 100644 meta-oe/recipes-devtools/boost-url/boost-url_git.bb
>=20
> diff --git a/meta-oe/recipes-devtools/boost-url/boost-url_git.bb b/meta-o=
e/recipes-devtools/boost-url/boost-url_git.bb
> deleted file mode 100644
> index 14da3ca3f1af..000000000000
> --- a/meta-oe/recipes-devtools/boost-url/boost-url_git.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -DESCRIPTION =3D "Boost.URL is a library for manipulating Uniform Resourc=
e Identifiers (URI) and Locators (URL)"
> -HOMEPAGE =3D "https://github.com/CPPAlliance/url"
> -SECTION =3D "libs"
> -LICENSE =3D "BSL-1.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE_1_0.txt;md5=3De4224ccaecb14d942c71d=
31bef20d78c"
> -
> -SRC_URI =3D "git://github.com/CPPAlliance/url.git;branch=3Ddevelop;proto=
col=3Dhttps"
> -
> -SRCREV =3D "d740a92d38e3a8f4d5b2153f53b82f1c98e312ab"
> -
> -S =3D "${WORKDIR}/git"
> -
> -DEPENDS =3D "boost"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> -
> -do_install() {
> -    mkdir -p ${D}/${includedir}
> -    cp -r ${S}/include/** ${D}/${includedir}/
> -}
> --=20
> 2.35.3
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175522): https://lists.openembedded.org/g/openembedde=
d-core/message/175522
> Mute This Topic: https://lists.openembedded.org/mt/96071097/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


