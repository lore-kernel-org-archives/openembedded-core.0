Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0089DC7EE30
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 13:15:13 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.66])
 by mx.groups.io with SMTP id smtpd.web11.89501.1677503708773510047
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 05:15:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=gBvFmLWG;
 spf=pass (domain: arm.com, ip: 40.107.104.66, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9u1Vm7WC5VipGjpJgN6F4ogUDIlylJqpfm2a01DKNjM=;
 b=gBvFmLWGz4NihyIoIgAO44f2XbHMfjzpvDKLT3uc0W3NRJxCnaotoMuoiFztHA23BbC/GGRCma76mQ2c6RYVc+RrD0QO8Q7/vDMpCcWCwmHMId7Ky1AkbPHy94HvFx2iehslyD8hWfJZ5U3KEvBdyZTl5B0gl8xl8iEENR9+EmQ=
Received: from AS9PR06CA0211.eurprd06.prod.outlook.com (2603:10a6:20b:45e::15)
 by AS8PR08MB8109.eurprd08.prod.outlook.com (2603:10a6:20b:54b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 13:15:04 +0000
Received: from AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45e:cafe::1f) by AS9PR06CA0211.outlook.office365.com
 (2603:10a6:20b:45e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29 via Frontend
 Transport; Mon, 27 Feb 2023 13:15:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by AM7EUR03FT003.mail.protection.outlook.com (100.127.140.227) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.12 via Frontend Transport; Mon, 27 Feb 2023 13:15:04 +0000
Received: ("Tessian outbound ddec0eea3430:v132"); Mon, 27 Feb 2023 13:15:04 +0000
Received: from 268fa5079d77.1
	by 64aa7808-outbound-2.mta.getcheckrecipient.com id 680C4F71-7528-4FB6-82BE-9EB03E73CA81.1;
	Mon, 27 Feb 2023 13:15:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-2.mta.getcheckrecipient.com with ESMTPS id 268fa5079d77.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 27 Feb 2023 13:15:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDG1ETlO+nITpAJRO3UAN4JED/K2DzR9RnPewKLzzcXrA3ROIkEr73IBawBny80cool97PWQb7ZhPqXhJXu1FeNpNNFOsLG2awE0U5Lubd+8n7yvppMAwugWa++HNlkR3P1PEi78ODTRlW/ct9DLZNaoaZS/WnAmbBPf5DRJsadPIN0lX7tFoS6+KPPziL0pgrq2YTtP+eIr/eBoXS7rDi43Z2mbTGz+u0dA+vNW6KzAuC8IQSNn+xq3zVzG8Ib+33EHlnma8ojJZa//tRijS9CEljW2DGqXAwoLnaZLkDxurydBuTBAX9qQs0hwqSkykaS/RTEFRxuhV3dD3BGykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9u1Vm7WC5VipGjpJgN6F4ogUDIlylJqpfm2a01DKNjM=;
 b=ClPWxDQr12Oggqm+QNfF8lq7GdAkkROOpcylXJ92DlG5TH6EDEHZo9OGLmIdZ/71D7K07SoqKnWEsxTKVbyDrCO+cnBuOmgnvGo6vBMNSYbJ4pbUMfV9jNwXoVxrtw2fEZ8IJCHn6wEyltU2dpOw2fzXWA2HaHhhYz0byJik44M3K8GoqAvEFpDEHvVCNx/N74aGiMyEhjv+kegtE8Wuw9AcH3esJdJ8vjBiE8137LHuJwFbXr/AsAIfbSit5dNenToxDzrodVDEGYunB26NcsnsfNRI++SzsHC13kcu9wUSIrhDW2cSDOlEIQeKKHbWcsQpnb3qEjjoHy3CCYqj2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9u1Vm7WC5VipGjpJgN6F4ogUDIlylJqpfm2a01DKNjM=;
 b=gBvFmLWGz4NihyIoIgAO44f2XbHMfjzpvDKLT3uc0W3NRJxCnaotoMuoiFztHA23BbC/GGRCma76mQ2c6RYVc+RrD0QO8Q7/vDMpCcWCwmHMId7Ky1AkbPHy94HvFx2iehslyD8hWfJZ5U3KEvBdyZTl5B0gl8xl8iEENR9+EmQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB7704.eurprd08.prod.outlook.com (2603:10a6:150:6a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 13:14:53 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 13:14:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "alexis.lothore@bootlin.com" <alexis.lothore@bootlin.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, "thomas.petazzoni@bootlin.com"
	<thomas.petazzoni@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 0/6] scripts/resulttool/regression: add
 metadata filtering
Thread-Topic: [OE-core] [PATCH v3 0/6] scripts/resulttool/regression: add
 metadata filtering
Thread-Index: AQHZSG+GjcGiswjTUE+Vbjtx2ZxRq67fnSjvgAMs4AA=
Date: Mon, 27 Feb 2023 13:14:53 +0000
Message-ID: <21822E54-A2FF-4215-9C8E-424B7105A7BD@arm.com>
References: <20230224164555.67634-1-alexis.lothore@bootlin.com>
 <1746D4E8592324E9.29542@lists.openembedded.org>
 <1747067DAE80068A.29542@lists.openembedded.org>
 <1747113C8A4DBAD6.29542@lists.openembedded.org>
 <31f5a99874297904353a2942f119a3e943823c18.camel@linuxfoundation.org>
In-Reply-To: 
 <31f5a99874297904353a2942f119a3e943823c18.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB7704:EE_|AM7EUR03FT003:EE_|AS8PR08MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: 87fb7eb3-9547-4247-a15b-08db18c4a411
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 exS3ht4WFyBz8e/U1JWXHBIr2uVG53eonTz/hOY96yqcroNKqgIddsV+rdEwawhy3A/98AjztxwRNx9ghFtFYdn2KCs+kMm+7oXDC/ZL4g4801JZfprazjGOItHANE45nJQZVoMOTb8I8WV8zJ86Uy+twILqGNz0BJYrJ5DMnDItL5PErc+Nk+Y5xN14IO2Okg/4lZeU/wO5g00wFoEY/q0EX4nLyCf3y0t19GWKwJl6PzXfG6PRDQHcXRm+2aLPWPGKQ6Y5F6p7m6RykvrZVEBqrgfhonYRxhU6Yw6Q+qDGXSNKRL3/emK1IrxD9zT/LzLO5GAbf0cbwbWR20YEhdjyGm8xS+XKLA4qcfThzQaZxnWBYAsQHMwB/0+HrmM76Z1cQolNdGD7pijMopxpeb36N2+09onphMTB+FbJF+uWZPV168gTKywABsvRppKRa0VceC6+70m3hWRkUXyR0DmdzrdhyrFu0jtmcam29VU10PVQM7MmrcKrg04yz2DLmdYQCtN6pq4okDmFTkHYGmzrypQu6jwGEfWG7kKkh1jfzT9tFawSJJd5DyCPL++b/Nq0/WuOsK4bTlpnG8AxsBpURL7OkMaCChQAkEhV1mHudV8gVBb4rYEEEg4A8QN8ZiK39CHd88ME/EskcKQq8TPwAMvwPOSCtrSd6qAXjAfbtJkiFp+XvlAFpy6AbW4w+E3HFoNd87McKzk+omDYbQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199018)(186003)(38100700002)(91956017)(38070700005)(122000001)(8936002)(6916009)(66446008)(76116006)(4326008)(41300700001)(8676002)(66556008)(2906002)(66946007)(4744005)(5660300002)(71200400001)(66476007)(478600001)(64756008)(6506007)(53546011)(26005)(6512007)(6486002)(966005)(2616005)(316002)(33656002)(36756003)(86362001)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A73567D823AA4F47A4165A094A591146@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7704
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	51abae3c-7141-4bd1-8c47-08db18c49d18
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CffbTiHc4Qx6Dp1x65RIoE6n3rFOlQzdzC7OBrtRUrBAuWoCEX3YmSfew73GPz7nh0oGxl8Dhz1MmPAc5OT36meRL8Kfs7f6YQ1xKVzfQr1VCxWXXBHOpnAt7n/dn9pI7Lx+u9fGjeVSiUw13v6gQxsTvzhcV9pPm9M+hKAVDoq8fQPm+5z3U0LC3DlV4T8Kaydg3BNqzw78Lg24MJp1RxOpTkGvJP/VUdH8n1+0WJ8muuLMdeT40MQGEx7c6zdB3jvYqUI9UxTc3bZ6htRLf7N+9Q9VtixKJ4ulD9UPDDwKXsrgEQhT6yqU5urS2rllLagnef0AYYm/7Xqeg8wNAMjWdtqOT7HXZUHwuwOZsP9thz6TN8BqkNklsCpAhwTi3yHrWOD2eb5oAaBYWFY27XKIUlPuYI/jgZsdy5rZ35ks9RDPpAwtn1cYPB3doTbAjfLEzsgQQcTwxT1FswPzqtWK8OGAAebWuzuwUJBas9MkK1/f7/uHZaPWtRrpPVjaYroXs6OlG82Wpko66d50zvFA16iyjq6JPMmGuUV8OcRi/XUQCM0fIgBTpQkboOy0GtU6UGv7ABpbqY7VND1O/Xg54YIRO9AvfoDKFBFUTbzfLZRAmNoReNqhYkwM7eh96ccqwADIME83Z5/18VCy66xvbCHIWUO9a5kDa2hdWlnnW8rUXoiUqr4WqeM8ac4A
X-Forefront-Antispam-Report: 
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199018)(36840700001)(46966006)(40470700004)(4326008)(41300700001)(70206006)(70586007)(8676002)(82740400003)(36756003)(36860700001)(86362001)(81166007)(2906002)(33656002)(82310400005)(40480700001)(356005)(6862004)(4744005)(5660300002)(8936002)(40460700003)(2616005)(336012)(6486002)(966005)(478600001)(47076005)(107886003)(54906003)(186003)(26005)(316002)(6506007)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 13:15:04.7707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87fb7eb3-9547-4247-a15b-08db18c4a411
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 13:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177794

On 25 Feb 2023, at 12:44, Richard Purdie via lists.openembedded.org <richar=
d.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>=20
> I'll try and stop poking at this but it is all rather interesting and I
> think we have spotted our first nasty regression. The quilt ptests did
> really stop running properly and reporting test results!
>=20
> Looking at a recent master report:
>=20
> https://autobuilder.yocto.io/pub/non-release/20230224-14/testresults/test=
result-report.txt
>=20
> you can see the quilt ptest count is still zero as it was in M2 but not
> in M1.
>=20
> I'm thinking Ross might have been responsible with:
>=20
> https://git.yoctoproject.org/poky/commit/?id=3D61bb4d8e75dfaaf980c32fbe99=
2d34f794b7c537
>=20
> !

Grumble.  Yes, I was.

Fixes sent.

Cheers,
Ross=

