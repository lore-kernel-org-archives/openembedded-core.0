Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4201EC6FA82
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 12:43:26 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.59])
 by mx.groups.io with SMTP id smtpd.web08.6647.1663850600641081576
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 05:43:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=DJIP3vAq;
 spf=pass (domain: arm.com, ip: 40.107.20.59, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OacwLr9Ah2TA/SZvKlicYCFqalp4MvghRy9/LfUA0wRBdYlY15alkwcjJhyMxvyL5fVruwPc7raORCCEx5T6QS2mRe3ZST0ygV2wnIok93wpkPriqB5SY5iSYRtmeSXUuF5O3wM7ZNrAAXIg2IQ7KU09BLa+vK4aP4B6SMxpzgPOiuMvkyyFKKWiY9k/vCxzYbPiy4WhHUSeH0062itdOLYmcEn5NfRml0+cdBN0rRWIVP0OLmeLcinaKqnUnJHSZhzNNTS7c7qRXU0HQ+g/Suzb+o1UEgIL0AqPVPvH2/VnLu6P2HXEB0fNaKNa2zDesecY8TitaSsGsIO7PQwv5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GaMVlZ+nzOYT95u96Sghg+yqV9e8kUuDDdfNYVyQTI4=;
 b=NcrlBCl5KGPlaRgSeRHCk10Z1AsHe4xZyfAEbZyFmOisbIZhhAwapYpuB/0Q2dEimbUP8XrbVsK0/y5gDzQumOwh/R/PTM3j73hwAL3JMLt6X7xTEWQBgE1YjPbxt3CMLU7eJtpPXSXjc0KfexrjPGwgwYGm5gQlujFXBawlZQj6VL2MYGX/wJA78PC6Wya9ZJwrrWLiBnnc1XIZ81wVIVsCZZlioPqxz0opHXGVhhZIA0zt6mjL3BeAS64w8UU3D8xZkkBV+qxrFdq9+CdCe5QmVQdCX5IcabN0hg+0xYB6R+zhOMVL+VHmLoHYfHAZjyHpJjuJVwUi80DRnJppZQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaMVlZ+nzOYT95u96Sghg+yqV9e8kUuDDdfNYVyQTI4=;
 b=DJIP3vAqs+jao7I7DMdRFGMmWGVLWXTAcuhzdbnguJIvqcwQT6kZ0MC4JvLGU/ucHDO1kDUURHbYwQ04FKyR3rJYT84dZfn+rBee+hucmilgC/WsgU1/5vSU6RryOmK0EWobmWdbOtVW7/C4gevlz6eFScMRPJq+MfcZxPZrvcw=
Received: from AS4P250CA0012.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5df::18)
 by PAXPR08MB6351.eurprd08.prod.outlook.com (2603:10a6:102:df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18; Thu, 22 Sep
 2022 12:43:14 +0000
Received: from VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5df::4) by AS4P250CA0012.outlook.office365.com
 (2603:10a6:20b:5df::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21 via Frontend
 Transport; Thu, 22 Sep 2022 12:43:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT018.mail.protection.outlook.com (10.152.18.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 12:43:14 +0000
Received: ("Tessian outbound 9236804a5e9b:v124");
 Thu, 22 Sep 2022 12:43:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5fe197e5b1458f8d
X-CR-MTA-TID: 64aa7808
Received: from 3028f4a48b2a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 360FCDC6-0F85-4150-AE04-7C63495F0987.1;
	Thu, 22 Sep 2022 12:43:07 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 3028f4a48b2a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 22 Sep 2022 12:43:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1TIZRSorKY74R7gfYBvr3giUSpyPuceslXjPGMc2lre9YOsZXUTzyLZBXhcVAFo2CsqnzYfig3xuiJNyk4p5Qv8GXU5+TlplqR+3XARvZRPAK6DxRP3V8n6+SBi1w28H8KGH+PZ0N/RloKPU/VNxnLqgQzb9hOh/lJvdOIKbDh5vQfQjttD0BdUNbp8RoiJjd+ht+haKwkseUKYE6bW7CoRF22ynm1KlEDzl91f7pM9yEJYz7zhHU/L5YSE97dZmJqqC/Lr3eCxoMYn16B16B5oWd0GAnjd2C11iWYKrW5r6BJ4YgypL4PTrYM+O6AJkXl3QabbwHYv86t2VOOoeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GaMVlZ+nzOYT95u96Sghg+yqV9e8kUuDDdfNYVyQTI4=;
 b=Uu/H0Vbmrxf3LTZayMCGLhN+YOV+xhWN1bSab3ATjNLA1qs+7Za1v4JhqcQvGNWE7RWQE34tpPeJa79XMbp6p2seI+cqt5YFj3x+svOGMnCryguTO61yYxjAnJW3D9P+4j/LBV4Amm5Rf+rVGz9PwSS95bY8mzVkwIVKWm5VBa8o1vMPx3qix9k3E+TOucA9ev5BlaPBWELICGZaQkyu5r+Td9CfOrRBjpWiIhGWb4ICjhEBJ4rv7SBzInsN3Raqbv6Q6aqkCfMSF1qACQljrOVt35ivFRNgJyT1tlpklumEukO5ZFzgDVuPtVimvlfaxBQ+DOHh35+ldiMRY42EfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaMVlZ+nzOYT95u96Sghg+yqV9e8kUuDDdfNYVyQTI4=;
 b=DJIP3vAqs+jao7I7DMdRFGMmWGVLWXTAcuhzdbnguJIvqcwQT6kZ0MC4JvLGU/ucHDO1kDUURHbYwQ04FKyR3rJYT84dZfn+rBee+hucmilgC/WsgU1/5vSU6RryOmK0EWobmWdbOtVW7/C4gevlz6eFScMRPJq+MfcZxPZrvcw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8978.eurprd08.prod.outlook.com (2603:10a6:10:466::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Thu, 22 Sep
 2022 12:43:06 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::559c:f19f:f674:b553]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::559c:f19f:f674:b553%4]) with mapi id 15.20.5654.018; Thu, 22 Sep 2022
 12:43:06 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mikko.rapeli@linaro.org" <mikko.rapeli@linaro.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] git-describe.bbclass: add new class for
 "git describe --tags --allways --dirty"
Thread-Topic: [OE-core] [PATCH 2/2] git-describe.bbclass: add new class for
 "git describe --tags --allways --dirty"
Thread-Index: AQHYzn5IVG3AwcRwlEiZcgL+1JL2GK3rZLuA
Date: Thu, 22 Sep 2022 12:43:06 +0000
Message-ID: <109BB0DA-5D1D-4D3C-B297-3889A2A201C9@arm.com>
References: <20220922122402.32710-1-mikko.rapeli@linaro.org>
 <20220922122402.32710-2-mikko.rapeli@linaro.org>
In-Reply-To: <20220922122402.32710-2-mikko.rapeli@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8978:EE_|VE1EUR03FT018:EE_|PAXPR08MB6351:EE_
X-MS-Office365-Filtering-Correlation-Id: 11a90b84-d6c7-4c2e-fc57-08da9c9803ee
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Iwm7re8Gr1zQkTibzaZjt/0WOV4zcob5+7TPEAXIMM7S86Zidjle20jE6PhmuxdFfNu6DefAgmnlgGHuPOxPLiNt2XISdvaKJnJq55sgaaIH2TrDN9jLxuBu8ZmzOtLMH8Cg8XEZ13H7ZL2aJSn2yqBjqEQ/IZnu7iEVNc/6x332F7OVbgAMi8C6N4QIUoZr76mCiGyPgzmKJWkMNHuZYRA08qeXtkwtY23IUaqGPCdaYGFfyIoY0ysIs2DVCtiDNncR1C1EHtxy6H3BPxEB2pmzjeJYKOh80+LyyQSTcdOlyD5Jp4L23mKown79rFcovEm/bccKQRTUz4CYH3h2QKsUTwyppRLG/D/5wpXfzewTnjvJ+mRb8hueF607XopkSA4rCgLdzSbjwIQHU7GbbnLsecJz3AK+jW65K/awE5Ggd/hefVNuTC/GOX9heT9UKWGQ/OWWIdDY2Bdt6qR4s2FCqahVf0c5ptLW2XniBepWzFZYwaSn5uGJVQUcYH/A8GLMKhhbuoz0Sa7kwDbh4eAov+w737c7wMoPdlB0qYT8iV1tpwe0uYVtOg1vBCfzEGGzCOn9DsSvGdn56ognAOyJ1hKWX1rCp6xYrbvrSCKvtjD7ZwuHcLFBFTKDVStC/HmlbcduHIfNPOA6esFTNMBbYwCxWJn/ldEHUtxMuJtpW8jyRhKn9KmVu1kjymViOcsiGiVeCUFBgLuKgoZEWkxqdFG4xwOldQxn46qtpg+uLiGkN6Vgj4IBEEsdMtGMi8RpCTHcZje7/mXDfGfpx03IiJ0cbkKa8OoepwNGEWhP2dcqhHH0UjLU+urwHpyNjRQ4d0ZqtTDg9UDlHexRQg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199015)(4744005)(6486002)(122000001)(38100700002)(38070700005)(2616005)(66556008)(6512007)(53546011)(8936002)(41300700001)(66476007)(5660300002)(4326008)(71200400001)(76116006)(8676002)(2906002)(26005)(6506007)(66446008)(64756008)(66946007)(478600001)(33656002)(316002)(6916009)(186003)(86362001)(36756003)(91956017)(14143004)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <443D10426C36AF4C8BA517376ED5181D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8978
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	542359cf-f113-41f3-bba3-08da9c97ff35
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LqJ/GRRCpIYX0od1ggU7ponrWe3VJB1cF5HwQ9LtFuEBCJ9dD2sTOwxOxnOWTG/MJfw9BtXZZTtrgHAVfULFbhG+Km+f/COOViIDx6SCyQ3WzkC+NTcU8fA/qQlVYdxBaZWWU9PQFksTpKgq62Gizfo+IGW06O5WQUghMRoWkYLZ0kJJYzm4SQ0tCxLfycfRefK6yswN7Ra5IYrOXEi0FYCPerthz7dba9jGuS+qc69dSZ6iduFXZKHnoRUldlicIy/9aqJ8I5E11HpimV+pIJrsdyLdDMd7Mfv160HkO2SiDoN29zDrtKMwFrFOCz/+eU1170k4zLrxFjVsV3Fm8i7EOkyHLtBkhGBhTYNbKuYuKGvfwSyeCmm2CvC+v/QwGbXI2ipIw8A7zsXHLFGQjAHyKtTkJu0qLmUvqnllxT/0eZ3JHkjTSdUDluOJEax0QUJ9/t0sMRqcs1cSd6j0Iw/NzOszaWp5XkabiIw5XqM+zHqCIzveTXofac7/bduiHEWIAhnrmbyjG5ByukskR5aWqq3SE0rih5GsdXDvfy5w9Qtf2QNy6RmEgI0GzbMm9AozGIFL9D7zcZ0QcMrdZ6p4gVeS21ny02BT3aJKzLzn3icYfOnav4X7vXDZC8gwysvjqKe5JeFcVh52PmFZoI9knayhNf1S9dXr8v2M0TbnmefBHjqUzBWw5BR5Q40AQbp+yL0rbYWKmxIpZogUW8FLf7sJNBrSEk+U6kKR0gFvpRPBCXTvNc0VYRrETOcrp4NNXfNuTXHyOVmZc8NEZdIN12ZW4QeTIp2ftgm6lFQ=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199015)(40470700004)(46966006)(36840700001)(70586007)(4326008)(316002)(70206006)(6486002)(478600001)(36860700001)(4744005)(8676002)(186003)(5660300002)(6512007)(33656002)(26005)(2906002)(2616005)(336012)(41300700001)(40460700003)(47076005)(6506007)(8936002)(36756003)(40480700001)(86362001)(356005)(53546011)(6862004)(82740400003)(81166007)(82310400005)(14143004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 12:43:14.0208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 11a90b84-d6c7-4c2e-fc57-08da9c9803ee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6351
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 12:43:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170975

On 22 Sep 2022, at 13:24, Mikko Rapeli via lists.openembedded.org <mikko.ra=
peli=3Dlinaro.org@lists.openembedded.org> wrote:
>=20
> Output from git_describe() function can then be used in various places
> and from various git trees to create a user friend(lier) name to builds.
> Examples where this could be used is BUILD_ID, SDK_VERSION and
> IMAGE_VERSION_SUFFIX.

I do think this should be part of lib/oe/buildcfg.py.

Ross=

