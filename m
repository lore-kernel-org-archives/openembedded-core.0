Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B288EC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 11:16:50 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.65])
 by mx.groups.io with SMTP id smtpd.web11.183849.1698751001266374487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 04:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=q1UVIbQG;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=q1UVIbQG;
 spf=pass (domain: arm.com, ip: 40.107.249.65, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Ulh8Gua9WzbG3GiK02Cp5nuNWqEw2Dek+nvVtrU1bcQ/sq/uVvJd7hTpfuSGpMkqfgO4bWEDEog8RGaQ3KO8temNkpGA3Sb0J2HX1o9RkswwcQW4gIp3JIpSLlHmzcxSVpHRphZ0CXZN59DfwVfEpJ1NYSnjrFGm5bGLw6LUuyO6RkGUuzcmRE/VEAyhhl/ptUj1kcpz3hZNyPIXnN9XqlKNOSJN7lpeambk5m0sCZ43i2Flt3oBubY8V8XOcBCUnd7D2gGJ3omBRET3Xj5Izj6kw8nu97mu6jNWDl8QfXSwELDAk12lPpJ0Yc2uGqDLX9fkX1zA8+AOjv85oOSwng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0hm6QvA/RkXpe2Z2PcNYr689JMvCVnG+C5iPb3rfLc=;
 b=HYoz6DdHNpv3npHVr93rbIEUMg8g6kNa7eWfLNQHLCO3wBpMRMRt3KQLcmZQ4Cjl/qPEg6oFsB2yOZFs1eH5tzqOcTIh2xUlk+mN+TecHXTW9PALR+uqlSi5ob1Wh7e2FnaJUjCEHCcIuNKIAlzScMHfNpvJVz5LkIGG79tplzHb/8AU6d4izaS5E+sIbJWZPADWEZXM0W3uhKLe53Q/oDWgYZn1YPym6pjzXYsyoGwXQzSqRALQtpdS2BgIrm2+GX43b6C6Q/O0r3wjG7qHxADYyAdd8acydlht9ss0Tkysi9mKvg8hK8Wlm6hZd1iwoa5l8TQ5R1IKnBaqWrd2ZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0hm6QvA/RkXpe2Z2PcNYr689JMvCVnG+C5iPb3rfLc=;
 b=q1UVIbQGQo2hrQRmKYyqhbrO2TjCXSgFk6niI6j86tqquLyS8eYTTPURwe1pVSIH+KURAx5PizYbEgJYyhAecgUIHS+/cRXDHYmH1ad26Ur1YQWln+dzSzNg/lUhBfRF6wHG8pESiC8spHgLJAkIMYwczLvHmbzCysIFWLTCXhk=
Received: from AM6PR10CA0099.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::40)
 by DU5PR08MB10609.eurprd08.prod.outlook.com (2603:10a6:10:518::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.27; Tue, 31 Oct
 2023 11:16:37 +0000
Received: from AMS0EPF000001A3.eurprd05.prod.outlook.com
 (2603:10a6:209:8c:cafe::e0) by AM6PR10CA0099.outlook.office365.com
 (2603:10a6:209:8c::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28 via Frontend
 Transport; Tue, 31 Oct 2023 11:16:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A3.mail.protection.outlook.com (10.167.16.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19 via Frontend Transport; Tue, 31 Oct 2023 11:16:36 +0000
Received: ("Tessian outbound 5d213238733f:v228"); Tue, 31 Oct 2023 11:16:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5bdffdd243b28d2a
X-CR-MTA-TID: 64aa7808
Received: from d0ab4c4e856c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 35BC193C-80BD-48C9-AA1B-D3B53C5F8865.1;
	Tue, 31 Oct 2023 11:16:30 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d0ab4c4e856c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 31 Oct 2023 11:16:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLwY6Sg7WKEbFoIbDySqjQacX7Bvu4aPok73vfsZcyR1Zsx7DXZb728UEYLGgkS+2LwLS+t1x/6GS30tI4QdxAnpyDJKPJMirVeb/NWvGenvp2T3Qpcc4v791tHru2LP4azkzelTPFRW3XPFI4Wep5gj3P/QJSsjCb2g7LaVjgCbepx0MnoiJkzTDTc1HfnFwLKpGep0kNG9K67wP91cVXYcoNxhCT9yiXVpO0A0rmaIyacU6ZeE1D5jkmPM83/Are7x9PrA0OdxGfPLMTSTgvVLgP1R17s+yaUW4Gf7OcyNtNDTcnNJHaliafLEFQ+ng4pvrbYCcrChtrWM63n0cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0hm6QvA/RkXpe2Z2PcNYr689JMvCVnG+C5iPb3rfLc=;
 b=hGLZOV0VRbVR2ePyKOI9wY8YsFAbBWGCFR4rDRg+F5MLD6OMj/jy9zjxNATAqlCYV1nVcxZpMLh3Wab9y65PCcKhWMCZDi3Wv1tZ5qPcUE24UlZM1p44GlZijUea4ktOTYw6JQYfbjYdKdYdXWubWO8Fmiul7HHT5/H17SpdPDYyEYOpomVaa9lwIY9pWlLc+sqEuKw0mOGNodbKpm4+LHXMAXTZmnJ+1EZaYBjpbCLTtwSHLCS9VElOr4J4NACTS9Qby9bn5yxwIUuSu0es3QJouQ4+5lw/pkHVo6G1+X0QiTiQGdUYoQnajRCN76drfc8PGzWENHslJ/M11KBl/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0hm6QvA/RkXpe2Z2PcNYr689JMvCVnG+C5iPb3rfLc=;
 b=q1UVIbQGQo2hrQRmKYyqhbrO2TjCXSgFk6niI6j86tqquLyS8eYTTPURwe1pVSIH+KURAx5PizYbEgJYyhAecgUIHS+/cRXDHYmH1ad26Ur1YQWln+dzSzNg/lUhBfRF6wHG8pESiC8spHgLJAkIMYwczLvHmbzCysIFWLTCXhk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB9924.eurprd08.prod.outlook.com (2603:10a6:10:3d4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Tue, 31 Oct
 2023 11:16:26 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05%5]) with mapi id 15.20.6933.028; Tue, 31 Oct 2023
 11:16:26 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] is it worth a newbie cleanup task to update "class
 Whatever(object)"?
Thread-Topic: [OE-core] is it worth a newbie cleanup task to update "class
 Whatever(object)"?
Thread-Index: AQHaCCoAGmqbM2QCuECF72vDr+VtqrBjxv+A
Date: Tue, 31 Oct 2023 11:16:26 +0000
Message-ID: <4F0E220F-25B2-4BC4-9CA0-B319FCF89B14@arm.com>
References: <416992c3-78c-c92d-b76-2c3bedf9440@crashcourse.ca>
In-Reply-To: <416992c3-78c-c92d-b76-2c3bedf9440@crashcourse.ca>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB9924:EE_|AMS0EPF000001A3:EE_|DU5PR08MB10609:EE_
X-MS-Office365-Filtering-Correlation-Id: 92bb492a-d29a-42f9-4906-08dbda02d8e7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rbU+Gpt/UOv18oqMrCCMjQxU7Br49U44tacKmdqZt0X9abYrsSDVpl4f483kF+/qNmuzl5DM3ioGDOtiYW2uw2+qzG0Vq7uhsRqIHizdEDNva7OOKc1gkF88otiBkB+OGXGwyDvxtB8nIrYYRUjt8N4EvQeyYvIvUnq3NxQoOTMVBPprIZAxneXDZUbXjG/3tRZSzkyDqYn31eZNWJZX9pZOWLScOU3HtvkQFGDg/izj9IaHwInSGeyqtULIBk7MM5+WE2nUZozzChitvlvlz5Tydq7/JY6hvC9yP59CkUXK8i9ju93fFGEbE/fEjVMfRlbF033F+G9D+A066eGcXDGfPe6WXgwTm9oUrMA1ecsD9z5EXsfc3zYXw7jnwh5T1RobRtS102WkUEHsX6Ne0fGcFMwp/3ewXF32F7Um7gNSmaZi0qwU0uDdzvWs7b3Yg7GjB9Ur5KhhxF/vUU5H7u+vY2UI123892iB3KEP8k+i+aeLJE7xh5Jw+Fc2YusG1z653KmBo0HrTu7LPhm3Z3N9W6YMayB11gGISxxBnB8jIOEW9uvRqbsoaHoRk0bQTKOtSIz0S5OfkgK2+xrMMdoSjAWZPoQt5tUYeAC50Za6Ekrjt81zZKhV8Fkffir267M50trydR4FqRVEe09nLQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(376002)(39860400002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(2616005)(26005)(83380400001)(38100700002)(38070700009)(6486002)(6512007)(53546011)(122000001)(6506007)(71200400001)(36756003)(478600001)(316002)(91956017)(64756008)(6916009)(66446008)(66476007)(66556008)(76116006)(66946007)(8676002)(4326008)(8936002)(41300700001)(5660300002)(15650500001)(86362001)(2906002)(33656002)(4744005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <21687171408BE14296E47E8E87929A93@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9924
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7fb06b1c-dd8e-48d0-f216-08dbda02d2d4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AKbDp4tv2c3Qop26ZT5zmb963CqmHJaIpqqiu4kdat+/fZ3qWtn3WsUOKMAdQjKu+Y8bNQC+gRR4QDppzeP9DxB9hWsMQXKCZE9VJDPxWjPXzshYzzkmK/7dLRNFrLf3mefV9sWMk6oTt2z6wTzhSCU4+Q/mTaZ6CIzJlaTTBp2hAk+OOcaKfRr1qUhxy1uo2U/mDeRLJa0lyqOM+QIkbMtlLVDTtlV0cYb+YjzOQfCOqmcdDoPuDSLtRB6JzS/sdD/c6UCwk/ZOFdSDnkMQLB8xzluprM7xpB1ox8WARzrw9sN2P4zk8GFAFWiLSAT6J1NNcckQMtA26ea3xNf9Jqq53yjLOY4d9dQsAUqS3MOatF44QC0lG4+zjhKOEY74p+tO4Au/NmKvDWzFCFXfdXqyV77u1Ftuvu3rGY4booWSIjc4VXgx3znT9sTcpYir92P8g5L3aChlS2p72IFePQS28kzV5SgYoUcA9V1HuzPEvEsxlSzQ8S22jR9/zDmlasmDvh+xf866EVX3KKqnN7rmKwKsHIfJsE1RjKt7gcvQ2idtopRBgsO/PZb5mU2a9cF5QlxRZcH4qB6CgNiwvIBD1VTuZiOhc7LpqkXgHc2AsRJxx9HtTuMpyBmh0MinEayOgGS3U0N8HBLs7uozgA44G8d18F9LSEvs7LHZ1EgP1N8VhLyqQhVTm6HW+fHXuADX23BQIBcCkHmE8TDGjAoz1yzVJmAOrf68WE7JepA=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(82310400011)(451199024)(1800799009)(64100799003)(186009)(40470700004)(46966006)(36840700001)(26005)(6512007)(53546011)(2616005)(336012)(478600001)(47076005)(36860700001)(6506007)(5660300002)(15650500001)(2906002)(83380400001)(6486002)(41300700001)(70586007)(70206006)(6862004)(8676002)(4326008)(8936002)(316002)(40460700003)(356005)(81166007)(82740400003)(33656002)(36756003)(86362001)(4744005)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 11:16:36.6258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92bb492a-d29a-42f9-4906-08dbda02d8e7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10609
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 11:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189835

On 26 Oct 2023, at 17:31, Robert P. J. Day via lists.openembedded.org <rpjd=
ay=3Dcrashcourse.ca@lists.openembedded.org> wrote:
>  just noticed that there is a lot of "class Something(object):" in
> oe-core, where AIUI, the argument of "object" is a throwback to
> Python2 and shouldn't(?) be necessary.
>=20
>  is there any value in letting a newbie loose on a task to clean all
> that up? or is that more churn than it's worth?

Nothing wrong with simple cleanups like that, no.

Ross=

