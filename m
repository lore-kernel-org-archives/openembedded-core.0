Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 493B1C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 15:29:01 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.78])
 by mx.groups.io with SMTP id smtpd.web08.21318.1658935737293537690
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 08:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=lwdZwFLW;
 spf=pass (domain: arm.com, ip: 40.107.20.78, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PhUQbIimXWRhoRKESzFhOFC8KgqmDfvqV2RVw/oqvFWF51pyHZrTD757BVWwvLsuQezIEprtW/3alXqk7bLnOwrRp4rXM65IHLo+onbR+pbpjyqN1JChrPC5VKk5O4y0+LlI/011QlnaNHbob6S5bdti5XwYrD42ApHcuSdmNfbKUBNYTzdaAEFD+9QBvIZwlwWAccukycVS9oXtLetu10YGumdC3AAiRGjbv0CGt2CUA6AvykH634HY1Fsu64Xce2b+l0nt2j54Q212+w+oiBX5+Ujur7yHPyolNuW2FpMym7t8rHmgwPnX0DJug6jblGWX2LAiuXpnwiXrilwN4A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkLb8u2EaBrD6oAN+ZaUsv2J2emt1ScPraSXDRBuCZU=;
 b=OZUvRWcJ8hmukzNwPBP28+zCDlNGQG8GuqRTKyMYzaX1r0H7+hbrdnDEJAVqtVfppQTz8AmX3/ZZOf86biWfkpntBG3KjaF4mF8Z5uWi2LrmlgNiMuqRfzk1keRyRsWiCN4WcgSvJXUH/T2Y9L6YvvMgOVc8rTArl66N5qu84O7OdlMhkxVol0p40UUDfIdqKTXZhV3PIHu6jEhdHyzZaL9nHep00Rgerw12lGaECInz8mJVwFDQIUwsJ28StyOYWVJr9CuAaSXqx/9QnnLTU/uY+I+ufxqOVth8azc4uIqwl6KNYGrSduzozFlzLIcbuCYkIBBju1px1viuHU8P1w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RkLb8u2EaBrD6oAN+ZaUsv2J2emt1ScPraSXDRBuCZU=;
 b=lwdZwFLWizVI3GtNMI2hkDoIwcyuCTIs4KBFsbmg2+bP3ARl3NXniQ3V4Lj0wMiWQ+wo+J05bTpGf3T+jdEyNzTd88+2aiO0ku6086t2Mgv33izlwfeSb3m/YgptF3SxInGMjd5rO39+cwW13aVfCT+OXnE2zNkndXzOlQYxML8=
Received: from AS9PR01CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::17) by AS8PR08MB6103.eurprd08.prod.outlook.com
 (2603:10a6:20b:296::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.23; Wed, 27 Jul
 2022 15:28:53 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:540:cafe::7) by AS9PR01CA0009.outlook.office365.com
 (2603:10a6:20b:540::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Wed, 27 Jul 2022 15:28:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Wed, 27 Jul 2022 15:28:53 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Wed, 27 Jul 2022 15:28:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f287849bddd7c0ef
X-CR-MTA-TID: 64aa7808
Received: from 01b6b1ccdc50.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2391B449-48F7-4684-AC58-0E7168000D02.1;
	Wed, 27 Jul 2022 15:28:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 01b6b1ccdc50.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 27 Jul 2022 15:28:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jS3i6UpsIZS18bfla+ljWaeMzi5riVYRrHH0EuI10iVSQU3WgDa2U1iItYRYuc2okM/gGYFb3BLYsaWY3AqinB1D9Ho9mfqMaRpVOtPcDqbHeHolIuC6vj8d2clyKUHck/1wO3Pewkm3BRBJ7FSdRyeAwPy/iBox17tPBQz9Z6oaSVeF3GyhqjtbVsmo/TV5+kvLF3grkp1yeHcLo/CN69hzhLY3hcEjbq7E+hRTHVyamgSl7UvD7Gm9Ac5qp9pnjRM7i297ZIC6CE1h351IUuMfOUn0BrIpc+hGe96AVpTabM3yE/yMpwfGco6n7uK/pbfBc8SBU9/JApjgtQMvNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkLb8u2EaBrD6oAN+ZaUsv2J2emt1ScPraSXDRBuCZU=;
 b=QeWSPk+5ST889c4d4SNKADNkEFcKWOjk0oH3uMl71eRAM93ntgUE7NTfYjVHnWm1MdDXZWUCaRM33+Qi74sT1vRc2XsiNW007ZuTPiD7o8zP1f7vf1R+RIclCTzOc7B389ZkGm6G7t4CGBm0hoH2mQZmK6BBpa6zuKLmqO31R2cGPvQ7Hdhj+QXX8Qlq0rep1qOdSjawVkWBgHdDHnPOPgh4vcXLdyuoFmnLSvz0IU3yc6XclxwmP2PfXsxIAHqdd0sdYkjY1O8DBZNfH0xhqR888lLiTfW2pirV5qhHw0ixE8StbuZQ4y0JiM6XyNW785tP4KSGOdH2/UkZKBNQsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RkLb8u2EaBrD6oAN+ZaUsv2J2emt1ScPraSXDRBuCZU=;
 b=lwdZwFLWizVI3GtNMI2hkDoIwcyuCTIs4KBFsbmg2+bP3ARl3NXniQ3V4Lj0wMiWQ+wo+J05bTpGf3T+jdEyNzTd88+2aiO0ku6086t2Mgv33izlwfeSb3m/YgptF3SxInGMjd5rO39+cwW13aVfCT+OXnE2zNkndXzOlQYxML8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM5PR0801MB1697.eurprd08.prod.outlook.com (2603:10a6:203:39::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Wed, 27 Jul
 2022 15:28:44 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e147:1bb6:acd3:5110]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e147:1bb6:acd3:5110%7]) with mapi id 15.20.5482.006; Wed, 27 Jul 2022
 15:28:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "otavio@ossystems.com.br" <otavio@ossystems.com.br>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libusb1: Link with -latomic only if no atomic
 builtins
Thread-Topic: [OE-core] [PATCH] libusb1: Link with -latomic only if no atomic
 builtins
Thread-Index: AQHYobCNp/pDUHHp/E2gMRFZmhqen62SV7qA
Date: Wed, 27 Jul 2022 15:28:44 +0000
Message-ID: <EC73E18E-0AA2-4655-8A53-EA278A198969@arm.com>
References: <20220727120036.633822-1-otavio@ossystems.com.br>
In-Reply-To: <20220727120036.633822-1-otavio@ossystems.com.br>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b239b16b-86e9-4041-1096-08da6fe4b6b0
x-ms-traffictypediagnostic: 
	AM5PR0801MB1697:EE_|AM5EUR03FT021:EE_|AS8PR08MB6103:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 itdtrLqnEgdd+nO9DH6G1OwWOmndd9NuAVp/XSsfJ5yOnQpPDhWK8NW8CaqYOALkgwr/fK5Us8E5NnbEnjR5GWwjarbg440MkdcpXoCnPiG9TdDjmi185p9rJjaHoa11K2Ji2gFlPy3T2i3b43LjraJAKUBYnFmzKfd5xXZEW4jB1/ev86Vux7tWMf0u/t7kER54lyVaVnf5Ommh6208HVqbxkf6D+25MDzO0xhLqlKFExMh0IpQN2m5Ti+pTCiRX1t/VAhlD66oy2j1PVYS4AIi6Sysl5SRIfP41ztOHnjUJDguWbo3/CPExFGbqzJwxErH0NPGzqRneTnfoNQgvvNcp+c9ZuLTNtgoWqagBdIWfYLwruSd7/oQfYQUOcyeWDs1YGiLOG0DNtPmL2F8hmssOoUVgddWd1g7+gTThG5vg0c4z6MW6azAsz0HhrubNIu7BYe/FHEfT6cG+UR+2eyGyc763XCnOHXVEko78kjez7TekzNEjEN+fX+cTdUhKecFoBwEtDNdmydA1mfW4+etYzKP8VkSx4id5JFeeNmWbJWpXHOV9ANhm3EjbMy6xfgFxkp0MQUg2mo0jpwn33HqPEl7kiLktFNUFqJPvoBTeR3lb+H3gmoUNT5AlFRRVjCPI0kQW3GWmsLRxJPymnZJ/0LyCT1nEnlKOeJ5nZuor6AHPKbcWbjMItVpIGNE9hi11DRhvgOX9txC3FChx+OyDdosw/iqXwamP+izvam+HdChoOyKYud99POyck+iHg2sTEb8C+vEX36Coud0VLXicIDibqyxggbQH4ZjvGKYtf4yzZOBNi3Ykob0o1gszAZmh4rGO7RzXCfCp0eIOW44XtrLzVxro0DK+LhQM5u7MnBEzr4hZN6nJXhbedjEgbaTMTBcJElg6TeVhcJDNQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(76116006)(91956017)(4326008)(64756008)(186003)(66556008)(66946007)(66446008)(8676002)(66476007)(8936002)(122000001)(6486002)(478600001)(6506007)(86362001)(38070700005)(41300700001)(71200400001)(316002)(2616005)(26005)(6916009)(53546011)(38100700002)(6512007)(2906002)(83380400001)(5660300002)(966005)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BAC2A277303C4C4992275BBC29212816@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1697
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	58a71f96-8465-4172-5f72-08da6fe4b158
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7o8iOExF7G2fhO7hVzfhYwDHE0yXkgcWDGUDyzusTmf9Y3ZZe9yO6wPPy3Ep6mSCSvnqV+oM8r9lsQfTJLujb09aVJa3yazUhWREgP3ydZS1Pd8HXLNYoKn1pIHPUR32Ez7bGaJv/YEiQDn9ftDYtADoyAApSNRTHFtNftcrbMr3VoZYMyh4Pp25ScTf1FY9/M1zBbYQFrL9Tc1UIyKcyWtskV02wNzt3Vz11S3RJpbHpe5i25AKPX3+JldxqXRt8782YGKXiIEkY+MgLXKOm9tfZwbyHD+BYUDr4nW2bubZ6yvjWAT8hIPVohBRU+ZbiTRsU6Jp7RTAifhNvghHTEq694rTwomsAAXT4q5dZW85xhski/Hh4+njSVe2Aff/nPtzQehAmSIoA70pW1m2wWLubu5n5cv9I2QUcs0FJuL8hYFs6ormxTh5g6Cl5gFcsnO3VJRWNtvOBqqzzidlGJFUM7jmE2RqDtTqL9Yi88DO/LLXffjNJDsvfOWMIOUIqVW9FQX3aI1rykpYn64KhqkxBVJRctImi/51YB/gdLxQg+4n0IEv5WWu8I7FnDjwr3I2zHHqHI2MiK0nXxuxQGvEGi4cI01KVnb7wqpzyOu1xlErS5U8rDmegfOTZ/+blxR3/IcUXQbV7MxAekcsyNSHx5OTZHnmIEG+hH49Dfhzqqp8zu4moUrptXdH+wXIgI2BWHJWVandEiWRNLlHdMTII5VFKBeUOQJ1fbrOgXCNPsG25UF+Qmn300ny7rk5WgwWYvc75uHgVJosV2STMs2BAqAvCtzEMkGzUpHwmhMZzezXmQjsPyFN0kAD1mRCCLxbGM1Tsmo4EmtX7WB8vhWUARqwUFRMwxXhPHQC+WEKUUpc8SgGShb5XFk8m0Fs
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(376002)(396003)(36840700001)(46966006)(40470700004)(8676002)(4326008)(70206006)(40460700003)(70586007)(36756003)(2616005)(33656002)(82310400005)(40480700001)(6862004)(86362001)(316002)(8936002)(5660300002)(2906002)(47076005)(186003)(81166007)(36860700001)(83380400001)(41300700001)(336012)(82740400003)(478600001)(6486002)(356005)(966005)(6512007)(53546011)(26005)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 15:28:53.3940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b239b16b-86e9-4041-1096-08da6fe4b6b0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 15:29:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168569

The patch is missing your S-o-b.

Ross

> On 27 Jul 2022, at 13:00, Otavio Salvador via lists.openembedded.org <ota=
vio=3Dossystems.com.br@lists.openembedded.org> wrote:
>=20
> Backport a fix from 1.0.27 so we only link atomic if no atomic builtins
> are available.
>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> ...k-with-latomic-only-if-no-atomic-bui.patch | 51 +++++++++++++++++++
> meta/recipes-support/libusb/libusb1_1.0.26.bb |  1 +
> 2 files changed, 52 insertions(+)
> create mode 100644 meta/recipes-support/libusb/libusb1/0001-configure.ac-=
Link-with-latomic-only-if-no-atomic-bui.patch
>=20
> diff --git a/meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-w=
ith-latomic-only-if-no-atomic-bui.patch b/meta/recipes-support/libusb/libus=
b1/0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch
> new file mode 100644
> index 0000000000..7c20dc0478
> --- /dev/null
> +++ b/meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-with-lat=
omic-only-if-no-atomic-bui.patch
> @@ -0,0 +1,51 @@
> +From a6890a6a9a8f88b567631874e209aaadc79e28e5 Mon Sep 17 00:00:00 2001
> +From: Lonnie Abelbeck <lonnie@abelbeck.com>
> +Date: Sun, 8 May 2022 14:05:56 -0500
> +Subject: [PATCH] configure.ac: Link with -latomic only if no atomic buil=
tins
> +
> +Follow-up to 561dbda, a check of GCC atomic builtins needs to be done
> +first.
> +
> +I'm no autoconf guru, but using this:
> +https://github.com/mesa3d/mesa/blob/0df485c285b73c34ba9062f0c27e55c3c702=
930d/configure.ac#L469
> +as inspiration, I created a pre-check before calling AC_SEARCH_LIBS(...)
> +
> +Upstream-Status: Backport [1.0.27]
> +
> +Fixes #1135
> +Closes #1139
> +(cherry picked from commit 95e601ce116dd46ea7915c171976b85ea0905d58)
> +---
> + configure.ac | 16 +++++++++++++++-
> + 1 file changed, 15 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index d4f12510..96787500 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -153,7 +153,21 @@ if test "x$platform" =3D xposix; then
> + 	AC_SEARCH_LIBS([pthread_create], [pthread],
> + 		[test "x$ac_cv_search_pthread_create" !=3D "xnone required" && AC_SUB=
ST(THREAD_LIBS, [-lpthread])],
> + 		[], [])
> +-	AC_SEARCH_LIBS([__atomic_fetch_add_4], [atomic])
> ++	dnl Check for new-style atomic builtins. We first check without linkin=
g to -latomic.
> ++	AC_MSG_CHECKING(whether __atomic_load_n is supported)
> ++	AC_LINK_IFELSE([AC_LANG_SOURCE([[
> ++	#include <stdint.h>
> ++	int main() {
> ++		struct {
> ++			uint64_t *v;
> ++		} x;
> ++		return (int)__atomic_load_n(x.v, __ATOMIC_ACQUIRE) &
> ++		       (int)__atomic_add_fetch(x.v, (uint64_t)1, __ATOMIC_ACQ_REL);
> ++	}]])], GCC_ATOMIC_BUILTINS_SUPPORTED=3Dyes, GCC_ATOMIC_BUILTINS_SUPPOR=
TED=3Dno)
> ++	AC_MSG_RESULT($GCC_ATOMIC_BUILTINS_SUPPORTED)
> ++	if test "x$GCC_ATOMIC_BUILTINS_SUPPORTED" !=3D xyes; then
> ++		AC_SEARCH_LIBS([__atomic_fetch_add_4], [atomic])
> ++	fi
> + elif test "x$platform" =3D xwindows; then
> + 	AC_DEFINE([PLATFORM_WINDOWS], [1], [Define to 1 if compiling for a Win=
dows platform.])
> + else
> +--=20
> +2.37.0
> +
> diff --git a/meta/recipes-support/libusb/libusb1_1.0.26.bb b/meta/recipes=
-support/libusb/libusb1_1.0.26.bb
> index fd63e7adc2..ff3f0be7a5 100644
> --- a/meta/recipes-support/libusb/libusb1_1.0.26.bb
> +++ b/meta/recipes-support/libusb/libusb1_1.0.26.bb
> @@ -11,6 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857=
fcd118f065f900982c24"
> BBCLASSEXTEND =3D "native nativesdk"
>=20
> SRC_URI =3D "https://github.com/libusb/libusb/releases/download/v${PV}/li=
busb-${PV}.tar.bz2 \
> +           file://0001-configure.ac-Link-with-latomic-only-if-no-atomic-=
bui.patch \
>            file://run-ptest \
>           "
>=20
> --=20
> 2.37.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168559): https://lists.openembedded.org/g/openembedde=
d-core/message/168559
> Mute This Topic: https://lists.openembedded.org/mt/92647443/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


