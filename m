Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CD1C6FD20
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 13:33:11 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.41])
 by mx.groups.io with SMTP id smtpd.web10.6960.1678282387147286990
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 05:33:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=hY5nmBbU;
 spf=pass (domain: arm.com, ip: 40.107.7.41, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efAtpX5wQQxZO83/folx6eGXs+h3kO51h2MW6FxgwS0=;
 b=hY5nmBbUdVtGknaGSJlz1TG5d3d3qCBp/Bp++0gvP5PQFVeSidQwpLbG4IRHiBqyH5Bt8Lf2JrSSuav3XmRf7DGshGw8+I+zKLSgUTOdtSWom5pTNOQp3ca83zH057c5vA/Z0+nSgY9EWEc6h7N0QS8lY1/dZNSiAUY0VS974wo=
Received: from FR3P281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::10)
 by AS2PR08MB9270.eurprd08.prod.outlook.com (2603:10a6:20b:59d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Wed, 8 Mar
 2023 13:32:59 +0000
Received: from VI1EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1d:cafe::94) by FR3P281CA0001.outlook.office365.com
 (2603:10a6:d10:1d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16 via Frontend
 Transport; Wed, 8 Mar 2023 13:32:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT047.mail.protection.outlook.com (100.127.144.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.29 via Frontend Transport; Wed, 8 Mar 2023 13:32:59 +0000
Received: ("Tessian outbound 2ba0ed2ebb9f:v135"); Wed, 08 Mar 2023 13:32:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e0ddda369d875389
X-CR-MTA-TID: 64aa7808
Received: from 1c3229c4384b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 173BB483-1B9C-4FE6-B94D-EA6733C081AA.1;
	Wed, 08 Mar 2023 13:32:51 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1c3229c4384b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 08 Mar 2023 13:32:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZ+8Gl+bshA3rlWaCce3npzlRVh3so2dOpipTHxORIpxezYKNEOfKjC4AJNLK+JombA2p/HUH/cW+BJF1R6yVwA+2g/X7QUHDI31NYeHDqOefMB+Jydx/TQfjJY+I2UofJkuOlDeFrrZoKGZViO2xwMDDqg460AjSNAHyZHvu/mzt1rZFm38UvpvTsBhq9CE4Yufv/VNO6V+gQzisEEG2hepw5RLaiXXcQ4H4XIO7F2BTi9pIEq94/QnKL5QIFCUFz0DI0RpLTMUrg5t/UJxCYz6ZufIlDFPUV7/Po4UWrTHoCxNCeDso0aF4s7fpf18icq/SWVozksJPRwoIIoTlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efAtpX5wQQxZO83/folx6eGXs+h3kO51h2MW6FxgwS0=;
 b=kMF08wSIJtnT5/2+HRtsjQ9blFYqsSpeCgn3QZRxP5YdQn4ZDYujJnLyCpcdWPoAtjf2LwWhUf1z9ZRjhherGPFicXXZus2ivJfnHuG3dDBEId2TQCDIYSWbCoyakGEefklGL5wt8DA+Bw7oz4Drve1Ark+SQhdUBjJzAX5c+e8hktjv6wQcsTu8n7CdSopnHmW/tUEC9pLbNf3g4yZp7/rLjOS/mtlyFL903JZePRpHsbgilxO1oxYddEzKQ+0weKTpscOiA/xOIp+NYWOQPZn7Qtpfu4Sd9UjK93HvtL9OZ222w7KhdQL9Lo6oK9ZmiBqI8UcZhCyg+a21HeiWnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efAtpX5wQQxZO83/folx6eGXs+h3kO51h2MW6FxgwS0=;
 b=hY5nmBbUdVtGknaGSJlz1TG5d3d3qCBp/Bp++0gvP5PQFVeSidQwpLbG4IRHiBqyH5Bt8Lf2JrSSuav3XmRf7DGshGw8+I+zKLSgUTOdtSWom5pTNOQp3ca83zH057c5vA/Z0+nSgY9EWEc6h7N0QS8lY1/dZNSiAUY0VS974wo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB6240.eurprd08.prod.outlook.com (2603:10a6:102:ec::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Wed, 8 Mar
 2023 13:32:49 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6156.022; Wed, 8 Mar 2023
 13:32:49 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "anna-lena.marx@inovex.de" <anna-lena.marx@inovex.de>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH 1/1] wic: Add support for F2FS in WIC rootfs
 plugin
Thread-Topic: [oe-core][PATCH 1/1] wic: Add support for F2FS in WIC rootfs
 plugin
Thread-Index: AQHZS4WSgnnFvw96N0G+bsRZqBe2Jq7keW6AgAGGDICAAB4xgIAHxvKAgAMJPQA=
Date: Wed, 8 Mar 2023 13:32:49 +0000
Message-ID: <6631BE97-0F51-4630-AF03-F6C4C179E247@arm.com>
References: <cover.1677593618.git.anna-lena.marx@inovex.de>
 <d6eaaa6541a496112bfbd82401bf94d031741e59.1677593618.git.anna-lena.marx@inovex.de>
 <Y/4b0dLAaxLcHKSc@mail.local>
 <CABFt5okSFyMcjJ506pgdu9jD00AFZco2XhNKQCRXUh8nQ_zPBA@mail.gmail.com>
 <CANNYZj_a4PrXBZHU_2y8=dXumVsV2Zz2PtNTL9aRG94sRkEeZw@mail.gmail.com>
 <CABFt5onpZJo6+cwDiX6JniYQfSXtO1ebSwR_9w-NL8Wb9h1JcQ@mail.gmail.com>
In-Reply-To: 
 <CABFt5onpZJo6+cwDiX6JniYQfSXtO1ebSwR_9w-NL8Wb9h1JcQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB6240:EE_|VI1EUR03FT047:EE_|AS2PR08MB9270:EE_
X-MS-Office365-Filtering-Correlation-Id: 74fb10f6-150c-40d9-5640-08db1fd9a22d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 nFKOHFbP8UGDe8rNxbgYYaxqnTxhCfkhrS+CwzJ5syowE0xzF8QxIcOVgCmCSXDfMd6UKMn2itjKjK+ROxWE12jhgYu8ToCNegn8pAIx1PDIKmELDuwPwdfl9N08KGwJPvcNqsfot7iVwgPGTCVoF1kQRX0N+WG8SPO5z0YkBcVR9dYHSB7STf8ws/5ju7/ms3yNxhrHYUVTsd3eD8mzluKhl9FPWlf8WP43MJ2CnsQxdZJEt6OVPLHkGA5dswqqQnnODQ59au42lm4vXgVE+iQdz0eWtL/q5XBk4YvjBQ2nMDYKDNlO1J+L9ZSyDs6MEOpmaMeYZb9yPrlB7VohNJYUnvDka9DcwthJEFQLKgm+GBLMUQFMgMHVm/vAkMrPKtI4frZ4rOBp2HK8xtQISbsGn15SFdOJGBWfJe/PVOf/vlJ4JzpvQKslVdF6pK8+wljkD5xaCEAlYOA6HG/LJVq7ryRNQxyTTKYjeSYiKm3gAI6RGn41DGvJ+EuxIZMQtv6KfRsT83jLc+t0oubFYFyaEjaERr+RrD6GB02DHOQgQNkfA+vzw03ZdMr+ghpIXqnBk3rUnVlpMr42VPDe9uCPR6Lo25WwTeVVYPU8/UnwgChenmtPDaQayLbs0DQ7VhBpzsaOWatmpUF+NUjVafOq5tJgQ0v9iLaKpkaBEdD5jxI/ycn9QUb6yEBmETIWYHcB7aJzJg4ced3POMKs1x0avRRnDgnzEouba2uVApk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(451199018)(2616005)(4744005)(5660300002)(478600001)(6486002)(38070700005)(36756003)(2906002)(186003)(6512007)(33656002)(6506007)(26005)(53546011)(71200400001)(41300700001)(86362001)(316002)(38100700002)(8936002)(76116006)(122000001)(91956017)(8676002)(6916009)(66899018)(4326008)(66946007)(66476007)(66556008)(64756008)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2CFA4E1910BEE249823CBB923BE9194B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6240
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	48807d0a-827f-4cde-17aa-08db1fd99c22
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O6vTfBuvfk/ON7BpdreCQCs4mURxT0HUQEAhDjiV9I1+dd6S8JIO3lUKdSzP/Z4YLb83W4CkKfV0x/z23Doh4GyUiOnqHRo9UoNhuilUfMwDNu+V2DeUGWzbMjmGSFxolfrn796Sy9UFJPK5eyq8ERJi4v5BKVD2C16HsWJdMZw+/Wv7mKz/U5TXCnPSXVu34SKZMDMoLa2vnsl1aVf7svSJfQHjBbGi7C4lIDAEeO72zmOZIHOQTvOynVsSk7vfXsCWs1s/ADc4sfnR0MjajEsKKveA7BBswjqbLY5miFx3rraWrFdn56nVDvJWaOhGdBpxxhqiVtYdo18TChcaxMTl5rvV+EcXgYdxmLUEGR0oXAGt69Vx2g4Ja+RzY0G3Mf6a1InkpJGhOEfGvZ+2trIw7E/YTUrsRs4D4yqzaKzDy97mlHez0Lg3rhKyAADHLkRXoNSKh0ODT0ZJyDfsrS2yeijaSaC/wFUn4gcg9H/LQurEVo2Yreu72uL+cuP/JdhS02Wl2wkUxtWX64vRoIuaIiM5hGbBRH90TKkp3KwRUhE3DJR28zZ6AZ9skrLbCxv1bXUyrtS6a73Fu7wCYh8CTlkriLilevFLNjX9I18Qy4XUV03BY/DJ/2k+79bhQ2xvMbvZHMS8AcV0pJe4CmUa5IJ0zwn+JX2t6faD5BgKXdExKPIz95M6hOQnmySpaJgxySmbqH4SrgPgWWS1eg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199018)(46966006)(36840700001)(40470700004)(2906002)(66899018)(5660300002)(36756003)(4744005)(26005)(6862004)(8936002)(70206006)(41300700001)(40460700003)(33656002)(4326008)(70586007)(8676002)(316002)(86362001)(478600001)(356005)(40480700001)(6486002)(81166007)(6512007)(82740400003)(36860700001)(53546011)(6506007)(186003)(2616005)(336012)(82310400005)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 13:32:59.1364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74fb10f6-150c-40d9-5640-08db1fd9a22d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9270
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 13:33:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178172

On 6 Mar 2023, at 15:10, Anna-Lena Marx via lists.openembedded.org <anna-le=
na.marx=3Dinovex.de@lists.openembedded.org> wrote:
>=20
> Hi,
> moving the support or the tests to meta-filesystems does not make sense t=
o me.
> Wic is located in oe-core, move support and tests would not really work a=
t all and create another dependency.
> It may be an option to move f2fs from meta-filesystems to meta/recipes-de=
vtools where e.g. btrfs, dosfs tools and erofs are located.
> Otherwise, allowing it without tests would be an option, but that's not i=
deal either.
> On the other hand is there merged support for some filesystems in wic wit=
hout matching tests.

The other option would be for the test to determine if the recipes are avai=
lable, so adding meta-filesystems would enable the tests.

Ross=

