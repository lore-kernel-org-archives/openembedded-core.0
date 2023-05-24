Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7ACDC77B73
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 17:16:12 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.78])
 by mx.groups.io with SMTP id smtpd.web10.349.1684948568311227183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 10:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=dv6i7vGh;
 spf=pass (domain: arm.com, ip: 40.107.104.78, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JU1O89vxc64gqC5I7pvTBsLY0jJdzguhFILlyKxX4vs=;
 b=dv6i7vGhiElEEWVJdZx+jTI5mK+r0/uU8bFoEKK7KKo27lNA5KF0DgKRq65GNiHAUGsEeKY3Yvm89grJGnvr71tln//6inoVRqAq4E8V1lFms1mwWt8zAMJVOEUt5uq3UpDBeieOzxtyIL5yjt/v3GBW7zJ8WwFq9yPlmTTIneE=
Received: from AS9PR05CA0247.eurprd05.prod.outlook.com (2603:10a6:20b:493::11)
 by VI1PR08MB10147.eurprd08.prod.outlook.com (2603:10a6:800:1ce::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 17:16:04 +0000
Received: from AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:493:cafe::aa) by AS9PR05CA0247.outlook.office365.com
 (2603:10a6:20b:493::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Wed, 24 May 2023 17:16:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT027.mail.protection.outlook.com (100.127.140.124) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Wed, 24 May 2023 17:16:04 +0000
Received: ("Tessian outbound e13c2446394c:v136"); Wed, 24 May 2023 17:16:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0e1c45d9d8284313
X-CR-MTA-TID: 64aa7808
Received: from b837b56e120b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7AFE5E8D-CCDE-414B-B188-CA8B10B0BBBA.1;
	Wed, 24 May 2023 17:15:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b837b56e120b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 24 May 2023 17:15:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jT9UclWMx3udYjqD0axsAwPzI3QMWOeIMOegAvIjoDm36vRsuLBfcXLjYj++LquAiMzzpNfCQYViSDuKK2sONXptbUDLviKhRmhR3OJUg6uJ7R8/OFVQhAIcUkIBPzFtiw9x4QQDbbiX8GynH4soLzwdExlKIADNhXqoLBHAHCUfNGx8BXGL2A/QbH1ZgmplSIGtYtkgvEZjdyVtsfyTL3FHfsBJzsxlUX5tUhhQl1l/URb2wx8e+/JZtb4uORCY6f9n7Do8AC+CM+BOhqlHErYYoejloyXz/jN/+xArVV/BsaU3kepwLnGx4wyNW1oEfVvhzj2s7tk3kZhiNq4T8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JU1O89vxc64gqC5I7pvTBsLY0jJdzguhFILlyKxX4vs=;
 b=TKlvFImgzysorByek+QBLOZGzahgw5ZVT+It/bD2daRHn9J8WPL0NFbLDJi1lLhfq33OMvZbcR2OgVrAttIlyevBwnPR3GkD0E4zyqkk1fnHx1PxzF+EWdwafssBqYy1XTsm2zttLEtM9SXh0/KZa82GcJkzakeyIVo+yT23fy5Q3IfdTI6TFYZVzlF0aiVm86vZ/d85ky+0i5kBQ7ATGqB0IYqgeAKj5rGpP2piSWnc0e1HoL2Knc0+zVS+eVyXlaijKtzDjZWx6tFR/MKiDBE+/HQL2LUzv/2+7+vqZVGoDSq/UmG9C9Rg+pSv0a1muJ3yS1xAKCblnXGm8cQWzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JU1O89vxc64gqC5I7pvTBsLY0jJdzguhFILlyKxX4vs=;
 b=dv6i7vGhiElEEWVJdZx+jTI5mK+r0/uU8bFoEKK7KKo27lNA5KF0DgKRq65GNiHAUGsEeKY3Yvm89grJGnvr71tln//6inoVRqAq4E8V1lFms1mwWt8zAMJVOEUt5uq3UpDBeieOzxtyIL5yjt/v3GBW7zJ8WwFq9yPlmTTIneE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9437.eurprd08.prod.outlook.com (2603:10a6:10:42f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 17:15:53 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 17:15:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Martin Jansa <martin.jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 6/7] python3-pygobject: mandate
 gobject-introspection-data DISTRO_FEATURE
Thread-Topic: [OE-core] [PATCH 6/7] python3-pygobject: mandate
 gobject-introspection-data DISTRO_FEATURE
Thread-Index: AQHZiXZnFHWEE1r4bkewuvls4BZNeq9mfRcAgALhgICAAFU2AA==
Date: Wed, 24 May 2023 17:15:50 +0000
Message-ID: <8C83F372-62C1-40DA-B54D-9B10945B3217@arm.com>
References: <20230516184031.2255171-1-ross.burton@arm.com>
 <20230516184031.2255171-6-ross.burton@arm.com>
 <DB4PR02MB10030D5405A91EAD95AC68552E27F9@DB4PR02MB10030.eurprd02.prod.outlook.com>
 <9FD419B3-F0FF-444B-9277-C8D34460427F@arm.com>
 <CA+chaQeGNYAJT5MqO6oXWod4Zhz_0vee5Na-2VsO_pNt78ad2A@mail.gmail.com>
In-Reply-To: 
 <CA+chaQeGNYAJT5MqO6oXWod4Zhz_0vee5Na-2VsO_pNt78ad2A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9437:EE_|AM7EUR03FT027:EE_|VI1PR08MB10147:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ae30c48-5d2b-4a25-e4cd-08db5c7a8df6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Q5hEjzp9w0ZW703aHuGrJ2tkIAXAwWGhaFCZ4yVCpxS+p+TzRpws17/OYEFNJxGTa1GzlR+xAx95j17XKL+zYYrFZu6IBdUuYEErkZaQ399hVChjp8iPkZBcb9l7zeCv5AylOkrI+0snVJzQ2SfGTzHVl2kGN0s92BJUiSuDHZJxb0S9q53o4fsYqW+aPgCcWxdzDHhx6c0HjubWKURbl9KSs0t35RIanp0YdK4zWd7b8KOfKDIM8/PK8H1qG4aVqHdNi/IXPo5+2eTBk0zJqroExrKkkG+R1eAZbKeasOown5eLf1BYDdSvLZs2yWC27yjJyL/z8Ssb/5Z5Aoe0krABmuxRDZID++8D0OhpqiryLOjdBvMKhQ0SVRri1V7Jk0cNk4UVPkqup3OGqY0pDRbz4tYisTpJ1u6ZgV/m3IeAklV9MN0tFPEWMz45PWsW7WMtXwXingpatBmmPn9s8Y+kmQ+F6STlFxvpVeoqyHe9PmEVr1ojIQUKv90Zw5jVorzkXHgjV5599fqXknVoiuij395bOpScExG2S1N+RN5JzCGT8QNbgC5sX9dH/RvQf2oSaVEn5iaNvxsDHzWSdxxYgiD7P76U2mx+2sBhpZUdLs11wnxWmZ+V7t6CjRXEJ9r8vO+pRHhK0g3EoMEnqw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199021)(2616005)(4326008)(6916009)(33656002)(5660300002)(8936002)(8676002)(86362001)(38070700005)(2906002)(38100700002)(122000001)(316002)(41300700001)(36756003)(71200400001)(478600001)(6486002)(186003)(66476007)(91956017)(66556008)(64756008)(66446008)(76116006)(66946007)(53546011)(6512007)(6506007)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2E7D319D65496147A31FD3FADA4C3ACD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9437
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cf9a3c59-03f0-4ced-0706-08db5c7a85cd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zgqE6JfOUqxl4gIUadyXtLW7gShy3xsu2OyjU6pwRBFpeOpm1jYjwuWO03KFxxv48JLqjqLQWfBJefN1rmAlG0BRAfPekjzLXB+GnMfwJejjbbOp63HHbgHSWZIBwhceKIifmygexLH5e1jD5w8aqgX6kuZffKrMR8A8QXihYcWCR/568yslhgyI3cIR65/30wFydsjOVczWjycISiOSe2FT4ZI0ju0E91z02ZZPrYxOEYyLscpb/duA+LBuA7/mVdMe/km7GW0C1c7VuB6pyU4FZiTw/unsX2jJrmnchMg5w9wpu3ZmFYx6gTR1py018qkl0+VIXLbLsX1igsaG3BLLBBYU8OTF/4no6w8VXglwZY/6IdFhes8xmzO/0EP30dxgPx0mnyaZ6cfdmg3Nq8lvJUksoeSQeUx8qjm8ehVIKrd+MVLFmKNQcaOpsIFUsepuuPUji1mM2Bc1si9sZEClPVo2qtjSW6ZKGBSd8KPwRkjqPiD5A6as50jAZ4IPkcFM9eoJ59lrfNIYVRxQDro2QJ8tvNy94lViE3jTvwve/AWZBcwiU3KesZnJaQLM0UQ7u4tfeqwKg+UD5E44FBl052x5ED0IqeQuGzyBlqUuy6r505yeBVE9tAym34HR0ZkMbrw/qkLPe+9FZ5T4Gk+Gwo/D7hniLSjxl7P8wVOWSdRxFvyWz/mUNtseP9dHvd7RVmPOIAzVxwg/UZ2Mgg3EuVwZCXnGKMQ3oA5WcXLy6Q4qyjMlWfWhbQmDZHzu
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199021)(40470700004)(46966006)(36840700001)(8936002)(8676002)(6862004)(5660300002)(36860700001)(47076005)(82310400005)(186003)(6512007)(6506007)(53546011)(81166007)(26005)(86362001)(2616005)(356005)(82740400003)(336012)(40460700003)(41300700001)(6486002)(33656002)(40480700001)(70586007)(70206006)(316002)(478600001)(4326008)(36756003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 17:16:04.0121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ae30c48-5d2b-4a25-e4cd-08db5c7a8df6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10147
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 17:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181688

On 24 May 2023, at 13:10, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> Ross, are you going to add REQUIRED_DISTRO_FEATURES =3D "gobject-introspe=
ction-data" to these as well?
>=20
> ERROR: Nothing PROVIDES 'python3-pygobject' (but meta-oe/meta-networking/=
recipes-connectivity/blueman/blueman_2.3.5.bb DEPENDS on or otherwise requi=
res it)
> python3-pygobject was skipped: missing required distro feature 'gobject-i=
ntrospection-data' (not in DISTRO_FEATURES)
>=20
> ERROR: Nothing RPROVIDES 'python3-pygobject' (but meta-oe/meta-networking=
/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_1.2.0.=
bb, meta-oe/meta-networking/recipes-daemons/networkd-dispatcher/networkd-di=
spatcher_2.1.bb, oe-core/meta/recipes-devtools/python/python3-dbusmock_0.28=
.7.bb, meta-oe/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb,=
 meta-oe/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb, met=
a-oe/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb RDEPEN=
DS on or otherwise requires it)
> python3-pygobject was skipped: missing required distro feature 'gobject-i=
ntrospection-data' (not in DISTRO_FEATURES)
>=20
> There are probably few more, e.g. python3-pydbus-manager which rdepends o=
n python3-pydbus.

The pydbus recipes are incredibly obsolete so I took the executive decision=
 to propose removing those, but fixed the others.

Ross=

