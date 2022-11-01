Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E46EC4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 21:04:51 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.89])
 by mx.groups.io with SMTP id smtpd.web09.782.1667336687945318488
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 14:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Yqr7YRrP;
 spf=pass (domain: arm.com, ip: 40.107.21.89, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=leT4qL0Uk3n2mLDU3WmfpzHr9BBOiFJ5HFgUTATh8jtPdYunzkrEg30Ow+D+iVMYCRiiwxp7fiFrvBR+O7GXK8DEsSxbLDe03OB9pZvrxvqsfNPCj0DM+VENzWDavKhUjtJfDsTgW7PwA4YOjAxwMqg5oN7Y3RIvxqoSuSx1jbHJHSch7YXURyPEyUAEtGXYVky2f4d63TnZVN7NJgrw3r59Heoy3muIlWeRkn2JogefSxFLYS1k5EsA1FmKqe1rqou34wb3sPOJRZQa9LN/EtYBwMwnwsi6v/4RhLa90bF/wtkwqfM8113/OVnxH/Gr0lystVK53MiU2TTZC7wTyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muOruxXzodN4FfiZp+R7rfsQSdf1a1NgZoFZOSh7mi0=;
 b=Uj45/uSVyIG8Q5PrUoOdls0yfieDBUKhFzpzshNt1d6uq65MikE6+qE13xpnLiVP5/nndzo7LjWuIbCdQGemHwxHgMNsAoPzlyKVeJyfkoZx3Hal0YbQ919TbRsrFSS9DQaysKfgP2b9wwxDpAyOq9NjbBM5r2Xzfn8teon6TfI7mi2JAGmaNBvatpENQPqll1CTI6yhxIAOGJ2vdOT386K6scy1+uXIggvSyw6aPwis8jZaSbG/RB6VejeujjRnitwereIjLK0AKB/IJcLUpN37QBfvEG7Lb7LPzucNRWmGN2Et3E1b90in2iCui1fE/SfGDdkKRX3hVquo1zJPbQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muOruxXzodN4FfiZp+R7rfsQSdf1a1NgZoFZOSh7mi0=;
 b=Yqr7YRrPoh4DdOrAH9A1B+dF/QTV0wlfEnKPwq5nSEYhHQ9j8qeeI+6zwMwY30VxAyeic4bO7rxl++G04oPcdmzq/i3vaQiVwqi0PAttHQojpHjHG1nzGXD61ojnq4Qmexq4PYfRBPArYOCdi5T+vOOAzGCvzSgY9aEuRbUvaTs=
Received: from DU2P250CA0009.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::14)
 by DB4PR08MB9141.eurprd08.prod.outlook.com (2603:10a6:10:3ff::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Tue, 1 Nov
 2022 21:04:44 +0000
Received: from DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::fa) by DU2P250CA0009.outlook.office365.com
 (2603:10a6:10:231::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Tue, 1 Nov 2022 21:04:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT041.mail.protection.outlook.com (100.127.142.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Tue, 1 Nov 2022 21:04:44 +0000
Received: ("Tessian outbound 73ab5f36653e:v130"); Tue, 01 Nov 2022 21:04:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 02b6b0886b2223f7
X-CR-MTA-TID: 64aa7808
Received: from b19dea71cdae.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FFBF4BFD-1E94-4CAF-8DC8-74ADDCC71808.1;
	Tue, 01 Nov 2022 21:04:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b19dea71cdae.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 01 Nov 2022 21:04:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=De+rr6e80tJ6aPptCRR0xXZ0zduv1XOcjgjTm9QP3RW/vmTkM+eR1QGxYZRPLXbFsVAOu/N2gmTkehu4vdtUqqd8P5OmNPViQtjt+iT/TdIne2xM+cBj4IruZuAQhXJ8ncXXdhKAXgwDkMIpcBp+tIbxMHdqtX+CmCTzY3scr6tca2AYoQbJDHKxMGkG8gzDzJH+y6nue6xOsbslIbV8cJCWyiTR/mB5V+tuEhNHqzcrsVphnCcOkCekL8uN9I5c/sD7IN3+ElfQJSDvyBXoKovX7gxGYNrcwDiT5mM5OIBQc9Tr/dnWXzNpm6CLGc7+s8Rl75bEg3aSCHmKPl5hYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muOruxXzodN4FfiZp+R7rfsQSdf1a1NgZoFZOSh7mi0=;
 b=bY5TFfqWACHyeINBbbH89SLfRIFsLGnt+67urMrfeaNu81SR21z5ng+2pZjUzMc8AICMor68Dr9cIwIuTBR0rY6MKxOlbsXbcOF6I52mFjLLTdmk9L0N0uemrqq7Q35QMFeHQYVC3gsk70Yf5/jDQdsk7MM5IlsHraA0trSDwTe1hPFPONj8PPbGIWXHl+SsFPbWG8zuARy09wKZn3PNmZXQmUGazP/S8K+fQQd7Adu9ijy8gc7AV044kILFzFxiPfwt21wuoltvbmdKOHOiWa9gRuiwC6WYHy2cIj/3TH30VEqeMlp/9yC/7Ew1U3zwq4yfpnkPFJR63s1W90Kkfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muOruxXzodN4FfiZp+R7rfsQSdf1a1NgZoFZOSh7mi0=;
 b=Yqr7YRrPoh4DdOrAH9A1B+dF/QTV0wlfEnKPwq5nSEYhHQ9j8qeeI+6zwMwY30VxAyeic4bO7rxl++G04oPcdmzq/i3vaQiVwqi0PAttHQojpHjHG1nzGXD61ojnq4Qmexq4PYfRBPArYOCdi5T+vOOAzGCvzSgY9aEuRbUvaTs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5685.eurprd08.prod.outlook.com (2603:10a6:10:1ad::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.18; Tue, 1 Nov
 2022 21:04:33 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc%5]) with mapi id 15.20.5769.019; Tue, 1 Nov 2022
 21:04:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "marex@denx.de" <marex@denx.de>
CC: Khem Raj <raj.khem@gmail.com>, Openembedded Core
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] bluez5: Point hciattach bcm43xx firmware
 search path to /lib/firmware
Thread-Topic: [OE-core] [PATCH v2] bluez5: Point hciattach bcm43xx firmware
 search path to /lib/firmware
Thread-Index: AQHY7ejRAuEj4VzxTEu/MS9hSwQ++K4qiNwAgAAFwQCAAACagA==
Date: Tue, 1 Nov 2022 21:04:33 +0000
Message-ID: <8CD85C6E-63F2-41A3-B2CC-1142DE35458B@arm.com>
References: <20221101115445.18282-1-marex@denx.de>
 <1a13e680-26ec-d87f-95c3-7be37ff316ca@gmail.com>
 <29c6d2f8-fbe1-6251-7e47-424a19d662a5@denx.de>
In-Reply-To: <29c6d2f8-fbe1-6251-7e47-424a19d662a5@denx.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5685:EE_|DBAEUR03FT041:EE_|DB4PR08MB9141:EE_
X-MS-Office365-Filtering-Correlation-Id: fe095e6d-abf3-42e5-7293-08dabc4cb3b0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 v0WL6aGp38RaDsUBvsj+XHnkDcX2U292Yg9Jp+FmnU+HrfvGtYJw14TSdpn+334t2uWZuKRiPJYx9HaBjq6aWsr9cws/QueLgSHUUpduX+x2cLvnEYrS3pZEccdrqE3EvR7WNFLqF066gLYghUTmoGUHBzUHxkneQV8LUEFexbZbXh6/qjSpKS2IOqmwuhBubRrCVg/c9LL7hlnlCuxMNypQ7iuLQ7Was43ha6pbO3XlAzls5BbAgyDyN6qTJStKO9K7COkJPE2SaKNY7J0g69jAkY4aJkbph+VcUaefZ7V6EH69EOVXFB54YTsHudz0WFTmyfSeKd5IKnrHR99tpYVcuhKIzza/SKGSaK9p69VW/f2oha6hoIAQN/DRezdadR9KyViUXb5V7CgR23sCCF+QrPN77JGvMswgLg9j/uto8oZXc2S8NYBel7b3wjs//Ka2BCC/NXCcdbI8PnsXtbmbsXg8rhvF1s8gnmSFYI/N2Y59gC3jz0ql6WUrfgqBFgQhGsccW7qfBYVO0gS7XhPsIkegvhWnqSIwhztUzyj6kpwWoWVBRJ0xbMJt/NslL6TwdI8CL/DYlCqQ6PX3gmG6a/lFGbQN8MSuYPN4L4vYHMn2PCirRofWWDnINRNswF10Nnx0m+YP6wAFFtSpJ5FwQbZl/FxvPEdqcIxGFwuamTjm4w9kj2yNHxHG3WPhEMhTzdrAWjQKlgkXaEY2rYeQIwC3qWG2nxEzfi4KsauoWYPFlgvr4wW7OHAUJ7cEyFogB9M4oNQJPhzDWLdXKoNjWFQDX0pY+srIGYi77CA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199015)(53546011)(66446008)(33656002)(66476007)(86362001)(36756003)(38100700002)(2906002)(4744005)(5660300002)(41300700001)(38070700005)(2616005)(66946007)(8676002)(66556008)(64756008)(186003)(54906003)(316002)(6916009)(91956017)(76116006)(6506007)(4326008)(26005)(122000001)(6512007)(6486002)(478600001)(8936002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3E45BA86994F3F47BD5D4F48FD528696@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5685
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d7ebb0bd-9c63-488c-4bf5-08dabc4cad46
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nQ9RswuqWQt3GRW3pxAq7dsrKFZ8cC13flS0eA8Gq/tFcgzo6eYq7cHZ/2euGvenbThtyoLrLXhLfKWqtrfbcg/337j9ei4jMvDfqtRKM6MVIEkA0ewOalAlHO21VBzShuCruztU2yROSBfpU4yRTZPH/tpNh6G+482G+nLRGitPOg+k1wwGf1tKmGnN3mum5A6d2jNWlD0rap+e3mrX7tHWpVC/3ZXYqET+bO4t8VGn7HWg/hEIG5GuGM6rc/SHhVWRvq781VQ/UEvPT878UZ8j+a+R8epxbp2C9G2XjO2jxiTVvd8OgdCXiYImNSQdInLKE/QAcWKWSeJ90J4JnaQNG6dS99NSPWh9gLh4qPfHGGzK7BR1eeCvdb4qEZQyOgxRM0xYrWV+coVMl3zlcEQ9vVuZNx/ruuGu1Ne2XdCHJIdhmMJf0YpE4ZAL8CavtvAFLeXDvgvI0TT++UmHtrfn+hdbpofXvH59X6/r0tNbS/4y2MkPMDeIWi6GejbVnU+rB5Az/MH0AFw9y8U2XAX9skg/BNc13kD/kmQpK6QRh44Y3pMihpvx787q3fHvF9kowNhjSUcESmn9f1lWwo6wqs72fEjH66L8+Fy/3WQgzkdoVSMRJVKbqz9IevOmj9ayERo+8roNHhQRqLUboFG78QMmuepI5HIcO1judTUWPAerK+ce7XT5Wsz/3nr8msguD4MhyBHwetIGMPVfV3cI1I09HWMiW7f+VTHlXjdP1KIB6862MLxVc7yQxHmiTQd9+ApL9c6YGcvUTclRjw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199015)(46966006)(40470700004)(36840700001)(82310400005)(26005)(41300700001)(6512007)(47076005)(36860700001)(2906002)(336012)(4744005)(8936002)(40460700003)(36756003)(5660300002)(6862004)(82740400003)(2616005)(356005)(186003)(81166007)(40480700001)(6486002)(107886003)(86362001)(70586007)(33656002)(4326008)(6506007)(478600001)(70206006)(8676002)(53546011)(54906003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 21:04:44.4411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe095e6d-abf3-42e5-7293-08dabc4cb3b0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9141
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 21:04:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172390

On 1 Nov 2022, at 21:02, Marek Vasut via lists.openembedded.org <marex=3Dde=
nx.de@lists.openembedded.org> wrote:
>>> +CFLAGS:append =3D " -DFIRMWARE_DIR=3D\\"${nonarch_base_libdir}/firmwar=
e\\""
>> why do we use append and not +=3D here ?
>=20
> Isn't the override syntax preferred now ?

Different behaviour for different purposes.  +=3D would be idiomatic here.

Ross=

