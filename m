Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 344A7C433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 16:20:54 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.78])
 by mx.groups.io with SMTP id smtpd.web10.10398.1666196445290753074
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 09:20:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=UCL6oW8q;
 spf=pass (domain: arm.com, ip: 40.107.8.78, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=HfL4AljKjnwZ2Yg+TW8h2CZmwef8T8clk/YYnTNzFUwvU5DvwIA5KMPiEq9ZM/RLwKNlV7EmyN6O3o1YKiJBEcPe8UqKzN3fXTFK6pqTQ6C+CitAsZyCLwaHhalsvIIZxIcClhME3XoTsdoTI7S9G87QbSPvIPodjL+s5OH2pj2spuVmbvMKdCxFX/3ERt+QbrwJH7fIGL9FSM0mfcsG27zh1errJ9WMzuS1KNprrN3J8fVy+gSQ6Cc00FWREqKX69Fb6AjyITC86nc4KBccO3BDPhN9L7F5qXGHdtXYIZzS5wnL3McAb+eATYHVGtOpVIeaOrOxLVZ0bfipVDtOtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKsLMaJGMhaQT8LonqiRsvLIn148GRqAWdAbKGVJDYI=;
 b=gp6CgqEc3YLbAeBck8D8Bobuat1w209L5L/9fmChKJem1BJkiycB2l6HieDtc4wYlcX3fh8m57Q9Y4YUE+AivghZTOc+CPwR7+EKrHcrRsDxaT1YBOR0ILCoDiJvbUznjubR8elYKaJfX4+iUYDDTNBLr3PFazEwMXw9BxcTJz6rrkjrs9Mhy5jP4Fw5Tjz6HEQl4Y0aytOMhQzH6rjLhIouir6AMd+kDZsICZY1cSnvpa7aC7cdRyc4u0VA2M9F3i4YEWS1rma53R2mytzzJ/kVacDEsxSOKAt+pWCHv7B0oBu0wn0+O+FLhYT1fPpLPixwwS5dxoGEQ6LpMiASnw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKsLMaJGMhaQT8LonqiRsvLIn148GRqAWdAbKGVJDYI=;
 b=UCL6oW8qnVHLU1eKCv9yT4tZSDNT8T4WpGYEOP2B/4MIrs5uzVC/466HHcaH0G07Pos5nm2QIB6Nfdhxdh69w1YGEvWOmWS2zy1AafdcrtVfLQRuxXUyxXtwI8gLsUP/h90Gf4xjCJeLhxmQVoSM0ggHroLiIzOz2zl1DQbQY/o=
Received: from FR3P281CA0155.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a2::16)
 by PAVPR08MB9844.eurprd08.prod.outlook.com (2603:10a6:102:2f8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Wed, 19 Oct
 2022 16:20:41 +0000
Received: from VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a2:cafe::f7) by FR3P281CA0155.outlook.office365.com
 (2603:10a6:d10:a2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.17 via Frontend
 Transport; Wed, 19 Oct 2022 16:20:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT017.mail.protection.outlook.com (100.127.145.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Wed, 19 Oct 2022 16:20:40 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130"); Wed, 19 Oct 2022 16:20:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fe4361f339a6ca0e
X-CR-MTA-TID: 64aa7808
Received: from fba3eb387217.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2168D637-0D60-41AB-B288-F535E37EDBD5.1;
	Wed, 19 Oct 2022 16:20:33 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fba3eb387217.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 19 Oct 2022 16:20:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MD6Xi64ALgA4vkbqUXIY6JIFgRWiCMvODTb8uT6EpdPhBdUKpjeWKlcQ+KT9Bp/UOqReZiqzdfNxcGUXdAakgb7P+OHnDr9cmARmEL6uezaIPnHiceir2Wrg/mnUPttMI2ymwf9hr4q0WQsH7btQoF5ZSRkOcRLSBOXso2hUhIIQo4913TecI76HmCJc2pTOOD2tLvWrvmurlDXdBDyWU1RjLGrEoME9aDgFkG7Me6lUioG2G2e3RVuZzkPhtos/abR1/JFyDV47ZCCukr6vcW2QlWnlNTeTfnhdbJPiOP9CBn2Wa0zuW4xuAygiRSOiUFFp6YYF2+qJgh8GDZ7cAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKsLMaJGMhaQT8LonqiRsvLIn148GRqAWdAbKGVJDYI=;
 b=ETpcAd1R6H78IlQwPh4/BOL7SnyqT7cKg5tvFO0DfZm6aNNymoC1lb7GQF1nuKw9MlAHUUQ2VDrmzVigpzGxiAc7qXdIdZR7PGXsElZrS6lMpBR/paw2j5cfXVuJZ7rY1p/T1XiB1kFDChqclpxi23CokL0KNhpTOdI/4hhbjG8vUQiFIMqqH74f2JjQtCDrEGptkaCCWJk7noe7aJT0EnzGIRTRksLq+fEvC1KUka2uUTTjimnOvBlExQizn0TpOej1kNBOM1dgFczqeTQLl400+FoOFzaiDHHzu6+KL8pIyDtnodMho0RrVOh9rrRY2VH8lpjS+Y2VHYzh6xJDMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKsLMaJGMhaQT8LonqiRsvLIn148GRqAWdAbKGVJDYI=;
 b=UCL6oW8qnVHLU1eKCv9yT4tZSDNT8T4WpGYEOP2B/4MIrs5uzVC/466HHcaH0G07Pos5nm2QIB6Nfdhxdh69w1YGEvWOmWS2zy1AafdcrtVfLQRuxXUyxXtwI8gLsUP/h90Gf4xjCJeLhxmQVoSM0ggHroLiIzOz2zl1DQbQY/o=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7714.eurprd08.prod.outlook.com (2603:10a6:10:3be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 16:20:31 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%7]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 16:20:31 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alberto@pianon.eu" <alberto@pianon.eu>
CC: Openembedded Core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] getPatchedFiles in oe.patch doesn't correctly handle
 filenames with spaces
Thread-Topic: [OE-core] getPatchedFiles in oe.patch doesn't correctly handle
 filenames with spaces
Thread-Index: AQHY49E46G1oW1KSYUet2ZyHfVrr664V5ceA
Date: Wed, 19 Oct 2022 16:20:31 +0000
Message-ID: <3813BB53-561F-4503-B576-9A6AB306D2F5@arm.com>
References: <9b185ae6cf064eacc0f7c4b2d5d12e5d@pianon.eu>
In-Reply-To: <9b185ae6cf064eacc0f7c4b2d5d12e5d@pianon.eu>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7714:EE_|VI1EUR03FT017:EE_|PAVPR08MB9844:EE_
X-MS-Office365-Filtering-Correlation-Id: cbfe6e97-8592-4235-8c0e-08dab1eddd71
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ttZCvwAEM6Ek+2EMHJ4HlVOjMjZPpTVkuj8lgwXgTZEKwg8fshP2wsJfKxeBMP8ePXd7iFQSoXQz+MkQeAUT2CyIlgg4NRceRfUjT6svmJMfKClADJvjQxEDpo9jbS/ww/kdWOX+B1QPf7b+Fpp87dwaUQAq65z3GPLq7KMqPUaT8tzeL7/bmW0UVDJ9brwoCKmqBsIWzOCc/lwqWAG6fkoUbvsnkNGiG+7TEzpcpRTz7YfZyfIZ+wHTcl3xtjDZ3aBfHjnsCToYHvC2s1zbTSNbCrokBGO97xWbHYnweyv0pohJoJTHk+53ZHi6L62RuPpJq44b2hILXEcEWoCe49eb0w0CSst7BQSbLqNzCueNbG2FbxGuqM62CADBq1G+QA7YRtanBexEqdj4D+HL5ZE8vRyMNaS3qmQkWjDUrCva+rG+Qcy82ewCr9IDtbIuejATQmI7G8T2sGZZLn7OPlu1Aa4rq5fgzX6GfJgs+lZB4WyJ5LCvq3SRBt0YE5cxSiCwywujts+C8aLTjrBIgyEdYWZrUP3vP1qYagZfnzPcdyQsFQD5L+c01rw974yEGbMRUsk/5KUH/j0QvKaVajbMbl1JwPqJ43L3bwSj5hDpulAUx+NiSHIXjlEJ7PWWdBaFDESvaAwq90sNy7JMXU3Q327UqrUoedN/dm1Nx6ORIETLYaqIKfNfRMxULomVeFyqYpwmlFS2cOvqrVkieSodaTMLkO+MoP1rV23ayRWHyJ7lUO3cOSmwOg/Fqf3l3OimXMBKzYeg1kDrQOonPZuNi6hi2DpY8juDX/v4m3s=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199015)(33656002)(558084003)(36756003)(86362001)(6512007)(38070700005)(6506007)(26005)(122000001)(8676002)(66446008)(64756008)(2906002)(66476007)(66556008)(8936002)(38100700002)(41300700001)(5660300002)(4326008)(76116006)(91956017)(66946007)(316002)(2616005)(6486002)(186003)(6916009)(53546011)(478600001)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B1CB92801618964D966208DEEB866DF7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7714
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8d921283-d30e-451c-2a55-08dab1edd825
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dXaJRIfvNXs1k83mgZbj4Zg8UKuoL6XP0dMEni8D3n10R/zcRSUngNUC0iE8kzOQEwJ57gC7N83351dUDkoEOhV9Q0FmZXEFjGAesVFOeu32KKci+f8vvtmLYEEKCXbMLTxl+DP8bBQU2hAJLTvp34Qe6uFk4AprRodEeUfMlRLKkC1K/Iu9oG5FVZCo30IyBn8QfhwG0cIjnVWn/RyfnNsVEu0zRVb2cYrInkqcX9fALBAIIkPFJorGU1hwqamCC2pRuBi6cPUlFy/15UCExpOz5ZhGZriSXGZme7Cizme6FujNC+u9L4NozOXxHHjKBbxYL9K+rV7Drm6IyOj/FgcDDXcsTjjGqhHgFWNPEXFyWlMQQky19eoXfFpAnTI2SSmL6kfdZ7ZqoPHo2KzDUE9gKfkbAcymEWArYO7UdLQxuH520kMWeykHtS4CBq+90VoZQNyrsKXcXiLuyE5g/6bjiAl+YlRTdnylPQHgvttVrASZcAU8K4rjDoSbn85aKFwJ3rwPz+OMn1+R+8ODB5i8+waEFHEtP/xN2hDtSGp8rJt1/A+cwtp2429qUYhMgwI8rVmENMgjlbHRtItAZ3a3gtnWlKtDa71niVCy3FB/vqspbXmlnRmYUdm8KsMQjFSNN5jTFYxxQcCn6Zsrikrex43hgqE4FbgvZFqTG5pSZbiDsUjLjiKG4zBwsqtHHDElLpkoFV6GgZuNLTMm4YMu0UIU7CbhFSOFmREiWosSXnFzXqJmLSYeIJ8bWUI/DVWJedZ5DbECfagF/Hl4wA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(4744005)(316002)(6512007)(53546011)(6506007)(41300700001)(4326008)(26005)(478600001)(186003)(2906002)(336012)(6862004)(8936002)(6486002)(5660300002)(2616005)(8676002)(81166007)(82310400005)(36756003)(356005)(82740400003)(47076005)(36860700001)(70206006)(70586007)(40460700003)(40480700001)(33656002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 16:20:40.5980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbfe6e97-8592-4235-8c0e-08dab1eddd71
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9844
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 16:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171975

On 19 Oct 2022, at 16:40, Alberto Pianon via lists.openembedded.org <albert=
o=3Dpianon.eu@lists.openembedded.org> wrote:
> To solve this issue, the above line may be modified as follows
>=20
> filepth =3D patchline[4:]
>=20
> Should I submit a patch for that?

Yes, but a better solution would be:

filepth =3D pathline.split(maxsplit=3D1)[1]

Ross=

