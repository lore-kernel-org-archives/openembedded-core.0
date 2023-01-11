Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F166AC46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 11:35:29 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.63])
 by mx.groups.io with SMTP id smtpd.web10.21450.1673436928685608594
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 03:35:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=RwFeEMrG;
 spf=pass (domain: arm.com, ip: 40.107.247.63, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUQndKmYXznzP8N7h46ZEy8xutekLT9YEqXlQ6hIrXA=;
 b=RwFeEMrG/cs8Hl5OEGpoYlEgKRs1V0/gg/5rlWu7PlUTdVk0hB0ILjnfk7EobMY+9dgVMT+t6h7ijBkh0e+oSzTV6Iil0DNhmBIHWkl4+KxHwP4Y6jfrYYB8lZk06RrcZl1gDgww8UTIvEZX8P8hLgEQHUAF/2UAEpkeuGoJWGA=
Received: from AS8PR04CA0159.eurprd04.prod.outlook.com (2603:10a6:20b:331::14)
 by AS8PR08MB6469.eurprd08.prod.outlook.com (2603:10a6:20b:33c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Wed, 11 Jan
 2023 11:35:24 +0000
Received: from VI1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::e1) by AS8PR04CA0159.outlook.office365.com
 (2603:10a6:20b:331::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Wed, 11 Jan 2023 11:35:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT061.mail.protection.outlook.com (100.127.144.125) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.12 via Frontend Transport; Wed, 11 Jan 2023 11:35:23 +0000
Received: ("Tessian outbound b1d3ffe56e73:v132"); Wed, 11 Jan 2023 11:35:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 49d2b1d8ed44f163
X-CR-MTA-TID: 64aa7808
Received: from 39999cbb9c61.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7357A78B-4F55-4E53-A639-3E8C92F7F6CC.1;
	Wed, 11 Jan 2023 11:35:17 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 39999cbb9c61.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 11 Jan 2023 11:35:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYpLOFS9L6WG9fm6yiNAqy9ohVnZQlbzy8wJlfasruumvdm3NQH+s5iAGoijZApJyCWfmvwVmuF7cupEDKeOr7zQmPKBgt5V6yd7uqTC7YgR1mfGZi9Tgp6zRdqdjVrBpxVk0jYlRO/7xdE1rFaio76IoAdrVuy4TF0iZOeOWcxbxZVxsSk8xMp9Fx6+dtFkfpy+/EwDpVGWcZ3SfFhPMSFIASyzP4vSXQwYuxWZMO66HFetzzOnXVVaS3asQR26rXpbyR2OyoMPl7bCLa47Vx94k2YTR0glKjyZkMeH92mOOV4JCjGmbZ4/R497rriRO4zGTQdmQpUz0+s6mHXWbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUQndKmYXznzP8N7h46ZEy8xutekLT9YEqXlQ6hIrXA=;
 b=m7UVSL8lmRZtaZvJYoEZmZ0AZx7n3LQ/CqN3STp2pgVAvdTdyPyLBwygBLbnqEAF3/chbw9F1ZbXZf9Aymd1bITEmfxdvMWZniFWXv8AdiZRqSNmetEp7whtwfhFOzGw2NcXKn5h7CT7IjDeKy+mDInTb7lAH6Ih5jPzBGv7ZRJsfTdUbaYyg9ZBpYMufueip5Z9Rn60/6+QL9ci8cLFiZV/J0cIo3uKypOL3Pou8VHIZBa5yt/Ek+bVJo3Xhn0zeaMw/J8SKPenHeczawBGO0q5fjqAJ9fbsArVa6oj5rJEpxFCV74s8s0LXM3j/XFecC77ai1RXR+5NpMoF1HGGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUQndKmYXznzP8N7h46ZEy8xutekLT9YEqXlQ6hIrXA=;
 b=RwFeEMrG/cs8Hl5OEGpoYlEgKRs1V0/gg/5rlWu7PlUTdVk0hB0ILjnfk7EobMY+9dgVMT+t6h7ijBkh0e+oSzTV6Iil0DNhmBIHWkl4+KxHwP4Y6jfrYYB8lZk06RrcZl1gDgww8UTIvEZX8P8hLgEQHUAF/2UAEpkeuGoJWGA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU2PR08MB7328.eurprd08.prod.outlook.com (2603:10a6:10:2e7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Wed, 11 Jan
 2023 11:35:14 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%4]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 11:35:14 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] elfutils: disable deprecation errors in all
 builds, not just native
Thread-Topic: [OE-core] [PATCH] elfutils: disable deprecation errors in all
 builds, not just native
Thread-Index: AQHZIepADyOLgNUcWU+gG2vaGc1OCq6ZGtSAgAAC1YA=
Date: Wed, 11 Jan 2023 11:35:14 +0000
Message-ID: <05F69644-4A0C-4F7F-B801-D6E9862085AC@arm.com>
References: <20230106161621.1288055-1-ross.burton@arm.com>
 <94a9b8a6-f4c5-cb3a-6f6f-467e24086b19@gmail.com>
In-Reply-To: <94a9b8a6-f4c5-cb3a-6f6f-467e24086b19@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU2PR08MB7328:EE_|VI1EUR03FT061:EE_|AS8PR08MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: f3f040a2-1bfd-4c5d-37a1-08daf3c7edc6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 qaY4VdVr0o5e1Pz19wDat8Piu0yb+PCVgenqdw6g6lZZJ9VPJBHgcS/HvprmUECe8aZIfrPREFWTft+E7ZUqAdYxeVeR80lLO3b1aBUeu19DDwWBFzg0FufwqiwyvgrDGsASpOhEzPPrFFTz7d3zcc7j4i8VoNVJAKn0ZyGtnq5l3/XBR/Sv6wORNf8lZ+GW1RBYk3JLfo5HgdtY0twP8tLR0E3b6FH5dkzb0qTk72dmRbrXWHOZRJsFj/WL8RnOIMoUfmKjvO+KuVi44vI+btI+lzfbCHowCIrpGkcL/DL7GrDU2E3aW41y5XVefw7fbGEWWdylxxP96JaOimKfFW4UTTyl8pVRYi2C6AXzGV/T2nkEVpqgPFeMZA2gOgNskM4pDuuKMT/Qjr57MuRLSvhkT6Dahi4qOrOvtkY9XjEKSWicbyXsfFpTLAvgHH7bSpzspnfcuiFVp4Z9153wemHp2q6/lTrFSKoG+zf5g/GqTZ3qCEsabAY3wXYI8nBtBjAcyiVMu+g4jtT76MKbdD9/oBBBBqon7qAZ57gXuBMP8HcwUgLBTUjNIehjc9jMMcmJMIolgqGG+5bckr4dhyvDRxYD6LOeQ6/UW3HbC/N8MdO0dM7WoPQoRvafjxFMn1Z56sudmd8GwPh9i8SfrSXaOMFDjkUSqk2MaBp7k3pCiy1KlzOJ9wHLnOmkZJtNv3uqF5dQSDHcLf3aD/sb0xO/a/vrCsY0i1/D2jm+Z+U=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(451199015)(2906002)(83380400001)(316002)(86362001)(38070700005)(33656002)(26005)(6486002)(53546011)(6506007)(36756003)(41300700001)(2616005)(6512007)(186003)(478600001)(71200400001)(8936002)(66446008)(66946007)(66556008)(4326008)(64756008)(8676002)(6916009)(66476007)(122000001)(76116006)(38100700002)(5660300002)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <93D162FF74F02F4CB0B3F3AF05E52FDC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7328
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0b1cb4ab-83fd-4c9d-bd01-08daf3c7e810
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Uw5va+MW6lPuUa8PNy5ZeBRqPkNckwaxvNqWR1eXjKYs4MUDiRQJgbKJ1CF/3pbJmZSp0PvGprFYIhlFguTcuroN4EN//nWZHSMi6LmjhHBhTq/E7Kso1Q++cGNNgwgaGu9Py3y7Bl04dPlZMaL+PBZpaszC8Hhd95KZ0/vevebHhpbjQpGWA0lyEPwXI/l2SEnvFt8+4NEX+AftFpFJ+MXdhJbF4tudnnmQdMM9q4Oh9Ebkz9iyW0TgYsuWBSNmpv3tAhxRnB82KjK51qPN//I5EMX/Fc1TZR9CaAS+B5Ezyy1S3Ok2CP2ThZypNFKKttE2AOU4Fv2NMVZ33WYTnUo7V/gQDZpGwLf/u2IfFEzLNq6tlYPfU20t4NBay+tqit/hilbq9riZU+3ZTc+9cwfIzxF1cF3vT5SzF0PnjnJ9ZTKqPP4OC8VAd0NPFtTD81cIuamakl1NCUe9LD0uCkmvfM6VE/Pg2Gpv41bOCoOUuu3Cg3lZmyz5B/J5Lp3+GaoZLt1cBMORASIsno02mMv8YK4MRllk7s2DNfQLFInYQez4vc1JB+5XXOwiDVzIEzcLb3cM7cLIyQK87+6fY/Ss4R45+Z+b4I4orvM7EQbdGACYEbMubGFmfqzr54mUlhKR5GUFyWI4h5QsDBjBiIfas9b6Y+elqPm8w3lrcYS27n0CwxOkdOzCJY9nDjhLUpF3o6kEi0l2gPb9aDOgOQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199015)(36840700001)(46966006)(40470700004)(82740400003)(33656002)(40480700001)(40460700003)(36756003)(82310400005)(81166007)(356005)(86362001)(186003)(26005)(6486002)(316002)(70586007)(336012)(8676002)(4326008)(70206006)(478600001)(2616005)(2906002)(6506007)(53546011)(6512007)(41300700001)(47076005)(6862004)(36860700001)(5660300002)(8936002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 11:35:23.8484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f040a2-1bfd-4c5d-37a1-08daf3c7edc6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6469
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 11:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175734

On 11 Jan 2023, at 11:24, Jacob Kroon via lists.openembedded.org <jacob.kro=
on=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> On 1/6/23 17:16, Ross Burton wrote:
>> The curl-related deprecation errors affect all builds not just native,
>> so set CFLAGS instead of BUILD_CFLAGS.
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> ---
>>  meta/recipes-devtools/elfutils/elfutils_0.188.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.188.bb b/meta/rec=
ipes-devtools/elfutils/elfutils_0.188.bb
>> index c94e36071cd..084908a38c0 100644
>> --- a/meta/recipes-devtools/elfutils/elfutils_0.188.bb
>> +++ b/meta/recipes-devtools/elfutils/elfutils_0.188.bb
>> @@ -34,7 +34,7 @@ EXTRA_OECONF =3D "--program-prefix=3Deu-"
>>    BUILD_CFLAGS +=3D "-Wno-error=3Dstringop-overflow"
>>  # compatibility with curl 7.87; can be removed when elfutils upstream f=
ixes the deprecation fails
>> -BUILD_CFLAGS +=3D "-Wno-error=3Ddeprecated-declarations"
>> +CFLAGS:append =3D " -Wno-error=3Ddeprecated-declarations"
>> =20
>=20
> Why use ":append" and not "+=3D" ? I thought the general idea is that "+=
=3D" is preferred, since it is easier to remove the snippet in a .bbappend,=
 so core should avoid :append when possible ?

Because of how the defaults and native.bbclass interact.

Ross=

