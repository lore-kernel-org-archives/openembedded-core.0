Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA714C61DA3
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 09:45:38 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.72])
 by mx.groups.io with SMTP id smtpd.web10.14192.1677231937055380004
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 01:45:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=iDkdfdgq;
 spf=pass (domain: arm.com, ip: 40.107.21.72, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRpdPPxXDcMilTkQi7zAvW81yGH2i5Sf61eoo4XPnAc=;
 b=iDkdfdgqZOJi4JBSHFOIU+NoVC3BGjkk5cZ/oDnUfKEAI9K0PpjR3fkZ3s5XRWlDaHK6rzQQtERJPKHKT66T59fAGgDMYlnqVMK4BKmrrLa4XsuJA3RdedBvt04guVHgvib5+w/SVA7gkLP/iCNAMbszQREZNGoE4/Ki537LhKI=
Received: from AM5PR0701CA0059.eurprd07.prod.outlook.com (2603:10a6:203:2::21)
 by GV2PR08MB8366.eurprd08.prod.outlook.com (2603:10a6:150:b2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Fri, 24 Feb
 2023 09:45:33 +0000
Received: from AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::35) by AM5PR0701CA0059.outlook.office365.com
 (2603:10a6:203:2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.11 via Frontend
 Transport; Fri, 24 Feb 2023 09:45:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT016.mail.protection.outlook.com (100.127.140.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.24 via Frontend Transport; Fri, 24 Feb 2023 09:45:32 +0000
Received: ("Tessian outbound 6e565e48ed4a:v132"); Fri, 24 Feb 2023 09:45:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: aab9098af248dab1
X-CR-MTA-TID: 64aa7808
Received: from 2f6cc78ee995.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5482A184-55CE-4583-AA4C-2C4E9159782A.1;
	Fri, 24 Feb 2023 09:45:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2f6cc78ee995.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 24 Feb 2023 09:45:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKpxuZsVdUvxOeuJ+1ToZ1raT7w2LPEmqt3goz7eJu7fjad31VyMJzKToV0aGhqcnO794F+7kBV59tiHuhDl2JXDI91pnC/S7f/xSzUhfoGwVhjA3DtNKlkBCNjVpALphFczYWok6bveW/vY42UmITrvugTQMg/KqPQ9dRNzEKSaxjqOi6n+Hvxl/G7Uwx+UPlci3RHCHc/5oolu5pt775EKJ8bqtF3fzdZUSKoEAjecbVKAeeNcPIWAcY9RN7ixTjk7rAllusAzF+73AOtR2QnSK2vvoUDkNLIHEvRrPjWBAIdppu5rE60YI9w5RHSEP1hhtVM93eqEKiyk3A3CEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRpdPPxXDcMilTkQi7zAvW81yGH2i5Sf61eoo4XPnAc=;
 b=Kh+ERnHXobB4ftI/MNFFEukDJjhd80+GtNm4qdPHzw4l7rjTIUE8tQhYj8N5BBhTRoqtOqro/qJ4voL06Q1W0slwiKKQ5+bNmc0RX9dW18RHVArzvtUCj74jUip1rwtQ+oKzIVtyZGVeIoxbjO4YodbwvTf7lfX5JO5JyytD3X/1x43Kfp6ipftRIAAWm7bkLyk74Nl3B3o8eJoUXBL5674xF8I0su8EYc8uUtBmzXB137KsKl0iytHlKIFoE5CNVfnURXk8bJt4+hYgLvwjSVyVxwnEXdQZx4h3Jdt4deVJ2Uiy/ebLZdEU5Eb0ulw6Nn4jFQp+mL/U+Jaxm2DYoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRpdPPxXDcMilTkQi7zAvW81yGH2i5Sf61eoo4XPnAc=;
 b=iDkdfdgqZOJi4JBSHFOIU+NoVC3BGjkk5cZ/oDnUfKEAI9K0PpjR3fkZ3s5XRWlDaHK6rzQQtERJPKHKT66T59fAGgDMYlnqVMK4BKmrrLa4XsuJA3RdedBvt04guVHgvib5+w/SVA7gkLP/iCNAMbszQREZNGoE4/Ki537LhKI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5590.eurprd08.prod.outlook.com (2603:10a6:10:1aa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Fri, 24 Feb
 2023 09:45:23 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6134.019; Fri, 24 Feb 2023
 09:45:23 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "zboszor@gmail.com" <zboszor@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/4] mesa: Add PACKAGECONFIG "rusticl"
Thread-Topic: [OE-core] [PATCH 4/4] mesa: Add PACKAGECONFIG "rusticl"
Thread-Index: AQHZSDPqGO2VhV0niUu6yCTY9df5ka7d2PkA
Date: Fri, 24 Feb 2023 09:45:23 +0000
Message-ID: <3EE6D20C-8A7C-4772-BF56-E1CD25B12B6B@arm.com>
References: <20230224093850.3393567-1-zboszor@gmail.com>
 <20230224093850.3393567-4-zboszor@gmail.com>
In-Reply-To: <20230224093850.3393567-4-zboszor@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5590:EE_|AM7EUR03FT016:EE_|GV2PR08MB8366:EE_
X-MS-Office365-Filtering-Correlation-Id: 6231a7c5-c9b1-40bc-a590-08db164bdf6c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 fn84qlF5wAwTT+e02vzrAPSajwVfE5QImyWysNLQtaqHyB8Za2UHahwu06LKWD+kVDJA2wfd6dmx4LGJcD6AXnCDwhoO0si5p/ToHKy5gGCiNt9mt7d50m2mDg2WLd1iw69A2zeOwdAlxoALPl3KWuIHuB2fjsEA38ZTlVqikdx/IbPHFw1HoZGj4STEzzG7dU+E/PMKHhRpR76i2b6G04soC/bRMfbFFRK9T8e182UMWckVoE4b7E92wNpCe1QHuiEH2OGXInyYb3rTMHNwGbPP2FLrNi9anWkQU43O/wJBNRZYIc1QyDqn4UHqhQ4UIajOUsObOOtrxdX7WQ4KwYjjttejtbFh5UvzbtY5cw/Hh2zMlu+TlGKoXshqIEdohitgeHeV0C4f0LKF+ToQ+EbMRKh1QmSj2LuVeiWQJgU5wR0u/n6O2MIena4EUuqkUa+WvPArNbo6qX/1MGSqnSj4k+1YMWHwSufroOEcZOx1gsBVg4bavrwNmWLio+RZ2n6GWfVjVfNPSYgYQH7P3G6ze7621A6lDYsqeaQGvMqjRAEy8F/aCKvHrtEhEywMDeSESFqJdLtokHiEOI1IuMVBO2JEbs+JB2Wcf3SNRRkznUCr1bYtR9Z3Vwdbl4KJnujiyKU3Yn6zyTWQLn6D2MBOc2y4dPzDKmUE7WekPCLoaYvIhc/rIVI0f3OGbQe1ggqYrufzF+ZDNXiisKAU7jJdoFwkhtmAWdOquN56rvQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(451199018)(4744005)(5660300002)(8936002)(2906002)(41300700001)(91956017)(64756008)(186003)(6916009)(4326008)(83380400001)(66556008)(66446008)(66946007)(66476007)(8676002)(36756003)(316002)(71200400001)(478600001)(6486002)(6506007)(76116006)(33656002)(6512007)(53546011)(26005)(38100700002)(2616005)(38070700005)(86362001)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <79361C1E12AFD440A7F0C765153BEDAD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5590
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5fefaa0e-c656-44f8-bba1-08db164bd9a6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	48FU2Y7iX/ZqPZ9tmXuxdUIPQ/pmWv5kZ1L7/Bg2y5oEX7lEyjQJX8BVRuM/3Y+QobkTuxzJk3Qtl24QD3or569GIHBn9uL+mMCB/3UFbezrq4bWTCTz5CLHm4VvLNA7MsTbzXnKGfDp+de+KF6XCbqgSSmKHszSB9yx5UH+/G+4zRCWqyyso8VcL9CBjK6kdaNW1FoGDeeam83uxnhLKPQRKB1pKQ/fjUu7V+SItz1c+aIax+w2xev/+Bt8Z/6hV/IABmiKM5A1znCIVHfklQ8XF6uqFdtBtV+85BwtOT+MP7/P0ItIYR31+HJanX9wVeFtksBJGuemcSmf2e/lYYzdbvEyZUMjM1clhAxTc1y96FbjOas4UGqJ93evtGQx1lfQTarsuGrXGNf3xBJsyZu29WqskSdcO2OdHjXXkKC+Fmb2cbvgd7rAYpWzBnwfX96aL3LjJ14w5pYb+jE8Ea5Ifr6U9U1AxwTi+eJaZO6vYzf3Lv75+UUM3DGjLETrAbmtzPtAoViNFRj/2KqJoJNoCNzjozoPQ3QDwAJ768hpcwMge//+oEZB47fEK17epFya9B2Y+BGTVObTvQlHLnlvj5gbjpzhyK9GJ+r7fl/G1VuHkW4Br9vwUbbnWdYT4M2dmWCZjYwxDDJXIxo5No1pnob/mfe6M1BxThlqYNI4Ogrg6Qrp8HM9HflmVCMNfYmtmb1fNlKEaO2AmOknfg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199018)(36840700001)(40470700004)(46966006)(83380400001)(316002)(41300700001)(478600001)(81166007)(2906002)(82740400003)(82310400005)(4744005)(86362001)(356005)(33656002)(70586007)(70206006)(36756003)(6862004)(8676002)(4326008)(40460700003)(47076005)(40480700001)(8936002)(5660300002)(2616005)(6486002)(26005)(186003)(36860700001)(6512007)(53546011)(6506007)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 09:45:32.9229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6231a7c5-c9b1-40bc-a590-08db164bdf6c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8366
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 09:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177670


> On 24 Feb 2023, at 09:38, Zoltan Boszormenyi via lists.openembedded.org <=
zboszor=3Dgmail.com@lists.openembedded.org> wrote:
> -inherit meson pkgconfig python3native gettext features_check
> +inherit meson pkgconfig python3native gettext features_check rust

This forces a dependency on rust-native, even if rusticl is disabled.

Is it actually needed? If so, make the inherit conditional.

Ross=

