Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DC2CCA47F
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 14:24:35 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.43])
 by mx.groups.io with SMTP id smtpd.web10.55766.1656426270178777923
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 07:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=JlmGFzYu;
 spf=pass (domain: arm.com, ip: 40.107.22.43, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nQbtGrU7DxJ+L0uRXX+7FSpeLOPpvJLn14mB9i/zeIv8ugMRy0765YkQjcs/bn9Fm6VRBuLG7UBMiSPQ6YacgNHt3kt4uits0gRBvEX+Pyx3EnBiUO9tM5/DY6qjDoH1FkiSbSFRo+8+kggWEEgjkoxZElE1JaC9Q5eHcD3lS7NG/EA6pyD8trBv7upQ9PWGl7fyvxqbpLle+qqpJ4D8AdLCM+uzfkojSjOyvzgz3beunPwB5h4VXtIYhe0lzLdonMupT+2TWO2QD8+6dxpPqcQUp7Ak5U2FWVFPmDTAVoQuBxMJLEODeY2MuQ6ZgYrKof3sJUTuglAmLjtc6fwuKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q22JipTy8HRxpL8BRDPZeU63+f1qK5LPT6OqieMFk9E=;
 b=GoSF1wWhsulcfimKW3uy9eTVSCw9DJWTg4B9F3bhk43QCUmttx1SmA+8Xzv9zzj1kD1/T5+MeEx+uhAQJbK4JIvYNatIIghUjPP1A/1XFSKVNpEKv3nFCBGIRf+/Z4hUD6SCAdXAp+u7Bf0t0f/gndc1UK40UYPtkiUK1JE0zYtiODHr0D/zgTKWAhGDQ0fb/wcV09Th/s50sBJB9peOTECqF5QYTw6NW7z3aSe9M6EjldPRnqEZ9D92jSCqgQYwiPRYTEmToV1JRFLyoJ9myrR0TGfulEB61CyCca9j6kPPnaMfa3hDvD0CTaZvtcFtxC0lA9nNGJzrURxyVLlLfA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q22JipTy8HRxpL8BRDPZeU63+f1qK5LPT6OqieMFk9E=;
 b=JlmGFzYu3x8LjgJBTBcIEm4hNZgbAOVBrsmI2KWcM5U5XbKTzTg52zapwLvwZk+/y2Vi74bvFRJpt4qc517Reik9ThL8p+XkvbprpA3tOnxrJtt0r9kWpbVbSQ1Kp8iL7MZyCejs6IhAM0HRExO3c0I8DU679B35nvg4OtwnvKw=
Received: from AM0PR02CA0032.eurprd02.prod.outlook.com (2603:10a6:208:3e::45)
 by AM0PR08MB3938.eurprd08.prod.outlook.com (2603:10a6:208:123::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Tue, 28 Jun
 2022 14:24:26 +0000
Received: from VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:3e:cafe::9b) by AM0PR02CA0032.outlook.office365.com
 (2603:10a6:208:3e::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22 via Frontend
 Transport; Tue, 28 Jun 2022 14:24:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT020.mail.protection.outlook.com (10.152.18.242) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 14:24:25 +0000
Received: ("Tessian outbound 3c5325c30453:v121");
 Tue, 28 Jun 2022 14:24:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fb1a16caff7a1596
X-CR-MTA-TID: 64aa7808
Received: from 05c2ddb0cf86.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5759B526-A398-4971-BF05-E98C78131025.1;
	Tue, 28 Jun 2022 14:24:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 05c2ddb0cf86.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 28 Jun 2022 14:24:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqKLRNwVYHa0aO+ru0SWaNOpBCqM929oPhbQPjNuCoKe+uK/eWr9j4J9OGN2NXGQvYnhJ4oAS0Z26UpCSRN458u+BlPs9tivgrzv6Np8+8aCbPoKVkNQorJ/+VI1ZOW/Dz6iSDvKUan9m2BwZuw8Zq25GYriuj4bYQ9k1haxQn1xiDLW8AtY6kKvRhrGftcfHdbyE1PXcJC5YiA4u/V2HHWjXt25SdQTuZb+DyRmlibcFJEH1mkocF6v378JUV4fkAFhjdahPWBaOi2SR2wngi5F88+pdc3dLvKJaXQlZNesCRty5B0liO8QRM294u/L8KDzEyFrBxVNbtBv/ozzYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q22JipTy8HRxpL8BRDPZeU63+f1qK5LPT6OqieMFk9E=;
 b=n03ZnjiwgauKVnDcU+uv3eYQKljOXmnX9rCT3H1/iy1HYMvOsdYMtRiA/uHFaNVFLFLk7neB5e6x99CbVscTEq22YeWNfUr6MeX/1AOwLSRq4jJNpt0Rn5mJBdjgioYdpWZ5iyNeK0nIpYBMAUC+PObH9qPRjd2DqGqywoZWrC2tlrDRDzPwNQ+qPiAbCukdVClLuaSjQbcjWAi3gvqxxPGvKW1JrqHWyBx+cMtcvfBWyunv2oy7V5vJzQC1MpQpI12isL6AqdJFjCBRQLP/PE4/k2vxr2mf0WiBXpEBX82HbmCgBkt3B6gYQxRZnBv3Q54JmOLsVHzIYfb2uyOr5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q22JipTy8HRxpL8BRDPZeU63+f1qK5LPT6OqieMFk9E=;
 b=JlmGFzYu3x8LjgJBTBcIEm4hNZgbAOVBrsmI2KWcM5U5XbKTzTg52zapwLvwZk+/y2Vi74bvFRJpt4qc517Reik9ThL8p+XkvbprpA3tOnxrJtt0r9kWpbVbSQ1Kp8iL7MZyCejs6IhAM0HRExO3c0I8DU679B35nvg4OtwnvKw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB5106.eurprd08.prod.outlook.com (2603:10a6:208:160::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Tue, 28 Jun
 2022 14:24:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5099:2a51:e4ef:7405]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5099:2a51:e4ef:7405%3]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 14:24:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>, Yocto
	<yocto@lists.yoctoproject.org>
Subject: Re: [OE-core] Announcing pkgexp
Thread-Topic: [OE-core] Announcing pkgexp
Thread-Index: AQHYivQIpzTqXXd43U+xgLONaHkIea1k3CMAgAADcAA=
Date: Tue, 28 Jun 2022 14:24:15 +0000
Message-ID: <CE736DC4-765F-451F-98CB-B486A1AE1221@arm.com>
References: <29D9E4D8-7C19-4967-8681-0633D670B1AA@arm.com>
 <3e2f8efd-8bca-425e-065a-33035c0f1632@bootlin.com>
In-Reply-To: <3e2f8efd-8bca-425e-065a-33035c0f1632@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: df2c7a6c-d4c4-4477-0539-08da5911e707
x-ms-traffictypediagnostic: 
	AM0PR08MB5106:EE_|VE1EUR03FT020:EE_|AM0PR08MB3938:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 4rAMrK2+0URzWtHsZdGL8ldxl4BTbj5AJ2pd1B7NEpdfQ0JybVIwu1eYJLuZTmBxCT+Cpcv/vmt+Jiz6mMTuI7DniFoZcx7hA+aESX8N+qXU1STdTBYEXSkk+8/0Ip/6tt0oaTWueWbI5MB17hPOE27J9m4b/wVWJD6ZoLRtYIRX680Xxjk4HPnySjbgBp77g3k7To259I4IDvEhaf6KB5jL2XKiZYGVkymONYsiFHAGlUVV3A/5hHLYXqrWLk3J+20+8xSWoZjoYwsEweI3jQZOq3Vh5FcWnu2cFp1wBZHCrSxVqnH/mfCF2j6su7S7CAoRQhurWey+89XJ+PENQ7RHCyehjbZ/QiJekj4JG5I8vJ6e6i1WkYJI4RYmjsdKZiU/cknC8MnUt/k0x+AbFWdIq0UYSrMujExcNH1/Xa0FbgP9VgnbbX2xfbCggRDDgRS5UQMNNxRCNUw1qyi8FkiMKy+Oj4VMO3ZKkRQsx2ipeGFxqvEb9hg3N39ASnBiq4pZxtBTmlNaeUAA5glDoHC5cZqBNIcc2/fQyQ/PZvuvR5NRcfnnPEO2SQXC6LLSadhuRiAWFKcw/MGeCCrrrA2ziSEGe3lDHaQROzhdGUK8yeJwEjIKQtFVi7crw3LBUt3w6UtYZlg8tY/dkB0WpXP1I0tc6KyQfutpa6s34+XcvY94Dm15kuX85H6UGszb+sDDIMY56d5VJik7m7V2bIOMVF5Rglb7GYCfic0VE+4uIvsPihEaiDhb0Rep5ka6KOrj1OkJYXRNZIBZ5X2aVcoZDZ2lkkrG0oq3VKFUaYuObLG1OYUzgXJ29032xRnXVJwQ9j+cFFTBxS7div3P6Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(36756003)(41300700001)(86362001)(2906002)(38100700002)(5660300002)(6506007)(54906003)(53546011)(6916009)(83380400001)(186003)(91956017)(66556008)(38070700005)(122000001)(4744005)(316002)(8676002)(66446008)(2616005)(64756008)(66476007)(478600001)(66946007)(6512007)(26005)(33656002)(6486002)(71200400001)(8936002)(76116006)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E6CD94F28AF7A04AB512C8FC8F5B3A75@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5106
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5bbc2b49-a5e4-471a-58cd-08da5911e13d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oclvJuyONe7mQM3czG/tLRsQ88rahnYXqtaB4bm0+0lUFRXgFbstXO/TOA4DF52jLuhWK6n7wWonOJrlaPp1bKMUmZ8+2FNKP058L+/BLGmfsFIJpkrruLxADV4bxOuB4A+OjpWxGLJtNhCvY9ZVeFmSBKqtfJKr2z28uXhzyJfgfWt/cPUgIIdsZA8zIlwxZx1m5G4BiIs7v7tRNzcCMSBHQD6jBJfhC4a1mQWEBcUl/QsmEMx0mP2dJSWgKTZ3mbTKKukbpvQfGWoCoPJ/+H+ohbaJvoN3RiOn3EzWO4it0SHZSqoOOf5h0W5QiKSLN2oWuT0TOl7VBvKtWMUHrFy02VKv/VHWl3DQn5jwVQ2i2zNL+mtZFPvT3+rPN+FzxSq/5mcW6/gX9/ZepIhpsF/Yif2Kfjs+RXz0gNFY8DMUuoVIba5dsmFw3FiBE69ZAYlaD7bsUuHbT8vdImAyDXx5tBozRpWRKv5ikWeuiUHQWj2cHfEAlHXINvKegLIi/HyEOAsHI4JX1gO7NV4D6zR1LHgxZlUWyNdBRoCBsxBER6GV/vbQb3E7p8XXw3AZ2IRcitucPZVwiu5x6X4EVAAePJZIYYaj24ptArqX9UHWkdACKDepoRkQrXT7c08acOBP669dUMpDzgIvsY8arZ5LSNMNbJmtwKo9L4+aWRdUgfVK1JiiNHijRbUnBr153xMYZM5C03Pm+lMQxhcW1Mwpur0R0lWd88/+kd2bjHhD8t5j6DFvzlffh7pyj92YIGTG/rt5Z3E4Mm034CEsqf9xDpd5Hq+Ei75vEfVhaCldMzlMGNx3NhOmMEcTAnqb
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(396003)(346002)(136003)(36840700001)(40470700004)(46966006)(86362001)(356005)(4326008)(8676002)(54906003)(6506007)(83380400001)(478600001)(4744005)(70586007)(6512007)(40480700001)(53546011)(8936002)(26005)(450100002)(81166007)(36860700001)(6486002)(33656002)(36756003)(5660300002)(41300700001)(82740400003)(107886003)(82310400005)(40460700003)(336012)(2906002)(316002)(47076005)(70206006)(186003)(2616005)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 14:24:25.0253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 df2c7a6c-d4c4-4477-0539-08da5911e707
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3938
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jun 2022 14:24:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167345



> On 28 Jun 2022, at 15:11, Michael Opdenacker <michael.opdenacker@bootlin.=
com> wrote:
> Hey, this looks very nice and very easy to use!
> One minor complaint, though: the "What Depends on" button didn't immediat=
ely catch my eye.
> Would it be possible to show such reverse dependencies in the same way yo=
u show RDEPENDS? The result may look better and everything would be on the =
same page.

The immediate problem with that is that for some packages, like libc, the r=
everse depends list can be huuuuge.  If the page is redesigned to have scro=
llable regions then sure.  That would likely involve someone more skilled i=
n web design than me getting involved ;)

Ross
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

