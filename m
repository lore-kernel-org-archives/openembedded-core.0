Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB5EC77B7C
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 15:38:43 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.66])
 by mx.groups.io with SMTP id smtpd.web11.411.1684942715858854985
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 08:38:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=uIQqewL4;
 spf=pass (domain: arm.com, ip: 40.107.21.66, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2F/BV6yBZSy8tIBn8W3jsIquCr6B8qllIIRH5TQl+BE=;
 b=uIQqewL4hqyZZho2fjzPClYAkJpJfO4cD9XFnr+oG6lzfWrB3sT5ScOQcUIotd/lP6yRDa6LyURx8nCjsDwDy00CME7owDgaLcv8YwwiMg6S8g9R4qyy42eftYN6NmABGgCaqxNHk2kwWcLkr7WqDDxPoctHi9yBgWHea+Mw0Jo=
Received: from DB6PR0601CA0025.eurprd06.prod.outlook.com (2603:10a6:4:17::11)
 by DBBPR08MB5963.eurprd08.prod.outlook.com (2603:10a6:10:205::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 15:38:31 +0000
Received: from DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::17) by DB6PR0601CA0025.outlook.office365.com
 (2603:10a6:4:17::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29 via Frontend
 Transport; Wed, 24 May 2023 15:38:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT042.mail.protection.outlook.com (100.127.142.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.16 via Frontend Transport; Wed, 24 May 2023 15:38:31 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136"); Wed, 24 May 2023 15:38:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e8066a635e779bdc
X-CR-MTA-TID: 64aa7808
Received: from 98d56f0406da.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 22E1C281-381B-4D68-B02A-F70BD257CFCC.1;
	Wed, 24 May 2023 15:38:24 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 98d56f0406da.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 24 May 2023 15:38:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m5u+waZBysR6dwShoI032UdqT11rQpHNdwfL8Srv33WfbVL6ayhz+5yZLuJZYo/xqIQoV7hkY/m4q5dzyZHAGOAP3ymjj7H6fPun7vso7TVLlko0EmGfDzo21K0WbX0YvgIclVHuZD7w1ZrOjJGj45n9UtIvwK1xjNjdiE1ACLKOSPNTT2qxm2JijK3Tnk+WLnwEVOAxPH93HaNApVsFLSfOV1XfMXhgxiiPY20kGXcFRFmv2v/Wf4LfexiQoIgEJA82e5NKx6P8PbBONxkDXRQj/rZksHLQ549aE+tcl0bN/LkTmAuXjvP/BtV7Z8QGOvTUJMfJTn41adohmo8LPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2F/BV6yBZSy8tIBn8W3jsIquCr6B8qllIIRH5TQl+BE=;
 b=dSDhLS86tP6YSJkrRNl1E+sU4pivBPwFS53wyB6M1yXPcQw9cxm+GIBIoaDxbrRTcu/n4b7DsvFJ0D908EEKuYcg3u3RSK48/bZ6XJUy3zsSONW/Nxcz5H+ouICksM8OEpEJoifTbT6az2twf4ezXtZs1njm21ZFFWSkoIRB/MVGxKD3Ziz/Pb7fm9IZrdNf0oMLyXd+texDJ3yIG1bJS95KFPJglW2WXYkpBjg1VVcbFpGJadf7xjl+YSr6aDIQph7nywqXdQn3u/AsFeLxkooxzR2y+myclQ0AdYJ+VJPHTkSzvx1K7BmGdhEecS9gOFS//7o1R/IaQnw0KgRsoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2F/BV6yBZSy8tIBn8W3jsIquCr6B8qllIIRH5TQl+BE=;
 b=uIQqewL4hqyZZho2fjzPClYAkJpJfO4cD9XFnr+oG6lzfWrB3sT5ScOQcUIotd/lP6yRDa6LyURx8nCjsDwDy00CME7owDgaLcv8YwwiMg6S8g9R4qyy42eftYN6NmABGgCaqxNHk2kwWcLkr7WqDDxPoctHi9yBgWHea+Mw0Jo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7689.eurprd08.prod.outlook.com (2603:10a6:10:3a7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 15:38:22 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 15:38:22 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Martin.Jansa@gmail.com" <Martin.Jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] cpio: respect MLPREFIX for PACKAGE_WRITE_DEPS
Thread-Topic: [OE-core] [PATCH] cpio: respect MLPREFIX for PACKAGE_WRITE_DEPS
Thread-Index: AQHZji51FmZpoyXQXk2FHAsYB9SXuq9pjyIA
Date: Wed, 24 May 2023 15:38:22 +0000
Message-ID: <774CA448-E912-446F-8D97-0406FC2452EA@arm.com>
References: <20230524105631.517832-1-Martin.Jansa@gmail.com>
In-Reply-To: <20230524105631.517832-1-Martin.Jansa@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7689:EE_|DBAEUR03FT042:EE_|DBBPR08MB5963:EE_
X-MS-Office365-Filtering-Correlation-Id: 08f022e6-c2db-4469-8ab8-08db5c6ced9c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 bswoQ338XKbZs42qorpIz7UTzsJ5qGIrWX0cCbm2B/dYr3ce/nRaXwxtFjffulS4SJS1S/PADJrrDsQJsJP7DAylgl0QPfKNWwJjdDlhosjrnQUNupZzYynoqYDEb7dW7dHifV2oiri9rqV8Q2e+HaZYO5JkW84PS6DySIi18v7mAuP4u9suiW3VqRNtz9eTq5BTYgsfrCflPyk1Uu3LNSBg1FfpCQ7EWGSsWjUuBRqvipl2Nx3MQedF6sMXPxSthq+27l+R+47KruhlkJ7vftQJ9Q/z9AEmd93wMTzl5dqnB7jx0GqRVx2BX/yStVbM6gDPJtw6MQo3OgplabDmXLMJByXFMp9R3Cty/EcIYuQGVgmD7CAiTlU+BorODs13EhM9Hgf94HkbvYP8niw1t6bIW9QaBYKeXlZ/n2yF0FJP4+xjyteJAb3IkXSzLE2U9+BGW/ZxgoOHcabgKkZe95oH8njmygqM6TSRggq65PE6kGeS16klrk4JcP30FOyIEEFgGWCT1M7o33A5twzWLnZgQNvnqETDZTDV9gxQPI+/4ogHtqwgrbRaYb+vZIkM+FSvdJIcwaq4RGQuZUZB0yD7Nj5n0gTbCyTPbh0OSYkomA2skxyBWR+ylDry0M6CqpGPA9pB4sne5Iwam3ff2g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199021)(86362001)(66946007)(66476007)(66446008)(66556008)(478600001)(122000001)(38070700005)(38100700002)(6486002)(2906002)(4744005)(2616005)(36756003)(91956017)(76116006)(316002)(64756008)(4326008)(6916009)(8676002)(8936002)(71200400001)(5660300002)(53546011)(33656002)(186003)(26005)(41300700001)(6512007)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8A8EC85926389B45991867B11FA0F84D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7689
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cc7bdc96-a66b-4bc4-5331-08db5c6ce82c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PVZcHZ37offnDvbGPzxQheljUvZB6dP7GRkTVsQltCktzuFzCWTCI+uEy5vth1EaVI3zGINMGJNRhWMvwo2Fox6yDW+RcCTOaUViuTckmQeXv4rP5ooyCX0MUiAlZbe+Xr/3/nmDAlDFA4Fk2qv/LbKPKSVsJWISEMIH10VrLVqqbCLyNIwUSp5ya2vjGIA4JCjI+5LUtcfPQTRf6QzQ9OlZR0dSqKQHqEMYEES7Geo95Se4eXGVy8GRklSPeIbDKyV17UJIZMZMJ/Pd3n+neAS2c+dd64hPWpeByMFplzmhgy0UejZ7KCyRx9bxZ2rlj7AVjHSyw9EtmtzuK/xwQBtlEXIKxGQvCadKQRLpENzkCLH9pRtTwrm06GDgqGqhiyPY/xztXY7yyh5uuDTk08qL6IC2vRb1l68vcc3lzDOZ7phrmWV2V7RuvufP/E61TjEIFmunAOdYe3zvcKmNBBuWk1rPog1ccINNfw6Bpgi41KuDLk1CiYGaMwPfIvyC2OUrIZXRZd3XfrI3C1JHTzXNJhn0u2Su+ZwINrGX7slpKrtiWV/6DvmS+ixLYqKiOGDAndc8zl2qiZJMWwQWdvYpCxgm/pPLYcWN3+GWKxe5b7bd6ZklsCjvqQETuAZyuaSWwjb3x4uR9dUokfl1Ar3DIwMWIhDEfUM05WNVdDnfIe8DSRAhcy5Ow4N3rqzTGk6HnLSnqZFJHsdKOIb8bc/tIICmUX5ei+eHmKlrqPVRNBngFWJEMwxwOk6OR9NY
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199021)(36840700001)(40470700004)(46966006)(2906002)(4744005)(82310400005)(36860700001)(5660300002)(47076005)(8936002)(478600001)(8676002)(6862004)(70586007)(40460700003)(41300700001)(70206006)(36756003)(4326008)(316002)(33656002)(6486002)(40480700001)(53546011)(6506007)(6512007)(26005)(2616005)(81166007)(86362001)(186003)(336012)(82740400003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 15:38:31.5739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f022e6-c2db-4469-8ab8-08db5c6ced9c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5963
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 15:38:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181684

On 24 May 2023, at 11:56, Martin Jansa via lists.openembedded.org <Martin.J=
ansa=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> * unlike DEPENDS/RDEPENDS the PACKAGE_WRITE_DEPS dependency isn't automat=
ically
>  extended with MLPREFIX, causing lib32-cpio to depend on 64bit ptest-runn=
er (and
>  all its deps)

Sounds like the fix should be in the ml extension code, not the recipes?

Ross=

