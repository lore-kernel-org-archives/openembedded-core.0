Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8070EC46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 16:05:51 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.51])
 by mx.groups.io with SMTP id smtpd.web10.20511.1704816342104534719
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 08:05:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=wev/L2CU;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=wev/L2CU;
 spf=pass (domain: arm.com, ip: 40.107.8.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Jl4fpnWii+q6/w+sUqUBtAsv4a/its0T3za3tEFnp6Mxtn6/CQS8z0ZdQfPjl3rAoBvftIkCd8U0kOU9LvSnFvyn8woO6F4WMsRF++lrABjGSDsTWhKo+xHTth7cXQQXUw7jd/vsw/GVtCLsSCZv2fnqqna80ZbTiY24UhcMSWbJ15lWCHZL6L/7TaJ2vCaS3/G4rQFNkx08YJ0MjHUTaaiHM3XnxPZIoKj7nrlSyfyRTVzg1vPRvi6GbyKyaudTy4JMEfbpqbONrFrxV4nJHuwBOi8Ld2t3aQL6bFv5hARMJM75K6ZzbOOQIknram2QUk9CK/65tRdupPy2pkwJOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRG2MJO7COndGcMOkVHU79m88HY1HJtdOH9tdSjpHk4=;
 b=KPf/+zRybzOnfQ836RAKWlrHH4y9uEsK5uLpw5uPYMSKYiCXPa8Tf0ce/HWoKjLI6ccuzM970wxsst6a5E+dyWUuEjHHVLtIr4UROncv9XHUB8XvP/azVqGLtfyotDRdA24MzUbb2PB7iMtlb+K3XjErx9Z8xRYsTB7O2c2H5R6JvHPrxFMVI/VpRlKXmzXgTn0TwijyoDmT8wEw9LR0kHnE0p6SRJhdmn/GSFooGBVw3YKu3+xbgaL+6Tf3ro5BTXVcXYCebMWPgdqBpDTqhDoduOCGOFF/+3dkSWfsWKFHMad8vwXvk5Hrc0a0DMrIuFpWwQkE8/rf7M7g824mzA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRG2MJO7COndGcMOkVHU79m88HY1HJtdOH9tdSjpHk4=;
 b=wev/L2CUFdQdiie0uspymVJ2a5EyGL5XjaL/PjYcDqzaAjsJDnV2ihmUFpqB3364gpQaXHR6c/tX8eMOqq4J3B85XaQE7dPUcgF0oJvzioMs2VeJuU496rpZMeAvRAyfdnKbTfIKQxXha8Y0IsGPoka/pBiTwj985tAyr3AXQ2k=
Received: from AS4P189CA0058.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::20)
 by PA6PR08MB10738.eurprd08.prod.outlook.com (2603:10a6:102:3d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Tue, 9 Jan
 2024 16:05:38 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:20b:659:cafe::e6) by AS4P189CA0058.outlook.office365.com
 (2603:10a6:20b:659::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23 via Frontend
 Transport; Tue, 9 Jan 2024 16:05:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.14 via Frontend Transport; Tue, 9 Jan 2024 16:05:37 +0000
Received: ("Tessian outbound 9f74e12f0f2b:v239"); Tue, 09 Jan 2024 16:05:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 626611e4d66ce0c7
X-CR-MTA-TID: 64aa7808
Received: from c5a0c1157a2a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 80FF7990-28E2-426F-B4DC-10CF16802966.1;
	Tue, 09 Jan 2024 16:05:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c5a0c1157a2a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 09 Jan 2024 16:05:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8bCiLRHbPlT884fcOY5a+XBXrv1iMGdo/CJ1peOUxNIve5iSDYGDs6mm7GQL1CwtYRdT4Y7bL1qiyFiupjTvYFDhDB8neTTqKto01ZXeC/+Y9LunUB2XScA4SwazokJLv0OVizqT1do74gRFA0mwaBNpxMa/p0fYdG+nPJIP56IXRzpaNvY383gkZd/6VZQ2whZQ//uIhZWB1iHXq/Z+G++ZlBksydRNeMLmacvp9ixCHgfA0TJyBWMo6wuYYek7ztlYPgATy05Lj3VX3RdDk3c8a0ply8LH7f+9yMZTnEvBJVU6A+BQeTp2j7ZU9AUwmprhzMz7a97y5lUxy6J5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRG2MJO7COndGcMOkVHU79m88HY1HJtdOH9tdSjpHk4=;
 b=na9HqbSbBCdddC0670KAlU72+/MykbG7B0olTuiFrJS/4TQI66WZSI62so2j4XJXMPfA5Wf1tIFfcKCPPKR87FZKoFokRPF1Pg6Q8bEQrZGmRfIEkhmNDL01Sa07GIqnkOn/RQ3YOm9yIujaW018GX2qIuy7brFNXQKv0wB1gNhutNiUV7N4JEcEB/t2W9Oa3vtDg08hLDHT20JT4zvsUWScHarqsAOy5Zey85SLQJOw8tNQkoJ1L+luLRTBuTXuAkjhUNJaFQf1xd/kNRPVayvh8nY89ou7jBkipEZFoxgj/D69YgL+d69bAY7HzXvGhPCPXZaApDRXLPzIVkmt2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRG2MJO7COndGcMOkVHU79m88HY1HJtdOH9tdSjpHk4=;
 b=wev/L2CUFdQdiie0uspymVJ2a5EyGL5XjaL/PjYcDqzaAjsJDnV2ihmUFpqB3364gpQaXHR6c/tX8eMOqq4J3B85XaQE7dPUcgF0oJvzioMs2VeJuU496rpZMeAvRAyfdnKbTfIKQxXha8Y0IsGPoka/pBiTwj985tAyr3AXQ2k=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB7861.eurprd08.prod.outlook.com (2603:10a6:20b:52c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Tue, 9 Jan
 2024 16:05:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 16:05:28 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] quilt,cpio: Create ptest user when ptest is
 enabled in distro features
Thread-Topic: [OE-core] [PATCH 2/2] quilt,cpio: Create ptest user when ptest
 is enabled in distro features
Thread-Index: AQHaPrNTFw6iZg7iS0S5CguptYXrxbDRreAA
Date: Tue, 9 Jan 2024 16:05:28 +0000
Message-ID: <B4F308F7-3C8A-4609-8F98-FB0B374428FA@arm.com>
References: <20240104021052.754030-1-raj.khem@gmail.com>
 <20240104021052.754030-2-raj.khem@gmail.com>
In-Reply-To: <20240104021052.754030-2-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB7861:EE_|AMS0EPF00000199:EE_|PA6PR08MB10738:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b0b6de3-eb3e-4b7d-003f-08dc112cd1f1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 TKVQVT9mYmos1+T2cR7ac8oq6qhE1hvmK4cyshpTIx2f+mAKo0NphD0WB8oTW3NWhPXymeqcCz34uBjjvgxuFE/z0uGrV0UBtBu4A80q4ILBqFJk3t5NHmSDHEQxVUjzu1t+thFGdFsAcYREzS/gajfFLsC526HPquEllIzGRV2Sazy/rGJYGv8cJF8AYSntY9cOdzgP4n0VK41u2XaLkxrvA4vtqXbF1BpHQv1OzwQI2gSHN3R0GJAZAI8ITWnX9O7MDjtCOdbU/PAS5MRCgKUZ9RZ4dyMO9sMjWSigaM09Eg+iaWWVYMCfSsVHGvao2Qtq+y8m0FkXPD3tQlY0j/BC+yBq0t6oOYaSRpGeobqnzUt+sTq76tJDKp9AMZQZA23/yirqNgRS1ZE0klogckLwssYnhDrqjsYp+iUUXmKxQxOsaiMDbYU8cOCH5cCE5G+mwneKuvizO6GWhKbdgyHxK8r6mbemJAkBYGwcnBqxhDXly8+bveNQ3NF9aay5lIlyVYLhyi9bzooEQJpSzdyIBtpTU0DEX3ZDxOVzSzDeBeUtX5ReqsJGDcWrorbI56iaBVxnNmtUWQGGFbaiVyhRqjjU0Xqw/pStRWAAj+BhYENdoW9Vwjb3sg0ez6Z0oB2S6nLYmxBFBPEuryYddg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(366004)(396003)(136003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(41300700001)(86362001)(8936002)(6486002)(8676002)(6916009)(38070700009)(26005)(478600001)(2906002)(4744005)(5660300002)(76116006)(36756003)(66556008)(66476007)(64756008)(91956017)(66446008)(66946007)(316002)(2616005)(53546011)(6512007)(33656002)(71200400001)(6506007)(38100700002)(4326008)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F80FF02EFF930C4A82480EBAFB938ED9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7861
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	51b8cffb-330d-4613-8d24-08dc112ccc90
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tyMICaPQJaIoF3CtNcNTx1j8K6Eet0lNThEL97h5NxHqX70tHF/b0R7YdfQmtIGgH2sBVddiAGkvIAckA2Lfm7S2CTX0L8+rgj+0rJBGbfmPAkYyq/via1cEEBR3EJ+t8nS3zYjpuwqz5G0eqdvHD/ed6s8fTAI86VUlmU3y0mVV/9B+sNJVrHF61AwXDXGhCdfNzfihLvmTTJcnMh0aTPREAnU9zsxhOMdT+7E8vOEur6RCfstZ8rl3/L7/wNkmuBSzw8Sb7EZDXyYpPXGn6du8E8bkQUJZEa1WHmp2Jk/B0nY4Dw8z7oKbFsCCSTI+2mCCSmogJZ+GbYni0aK6BVhgKfV5SfkbQCLDTBwRDRUOBOlPh7gOEY/2HKjJIm2io65JjK3KFsGGjzzen0BOW8wvU4VL/KL73xd8ipqg29beWLSM0wpeHlkosdqQX/j+bNijR7zXq/ZXJokXN+GMWRMAM7nJV2njAGspKhyrOg3xSZMWL/zQt5GWcB9fv0caRApe+krlmDE9xFfyMd4s3MaOdzGlbA026PJyl7YRbwFMrr3Lb/YK862nJyFWh9FWBJs3BwcOWKFfJcGkxn2VJ7Wo0VmpDMi7rlyhwY6yK09MG2UQeLZFxsfUChqobYZSyVhQ4Gq4+uvZ6aKmm+0am1AmMBIKPA/9ND2G6n5QwT4cGeENLH0+JovDyYfhTVYcl1V+gChw/qbu7kZi8tAiwNraAlSP4CY5c2p7IxPiUnEETKSpv0JzwPsb1d0OkWX4
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(376002)(346002)(396003)(136003)(230922051799003)(82310400011)(451199024)(64100799003)(1800799012)(186009)(36840700001)(40470700004)(46966006)(316002)(36860700001)(336012)(8936002)(47076005)(8676002)(36756003)(6862004)(6506007)(4326008)(53546011)(33656002)(40480700001)(70206006)(70586007)(2616005)(6486002)(478600001)(40460700003)(26005)(6512007)(2906002)(5660300002)(82740400003)(4744005)(41300700001)(81166007)(86362001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 16:05:37.7764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0b6de3-eb3e-4b7d-003f-08dc112cd1f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10738
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 16:05:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193467

T24gNCBKYW4gMjAyNCwgYXQgMDI6MTAsIEtoZW0gUmFqIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxyYWoua2hlbT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+
IC0jIFRoZSB0ZXN0cyBuZWVkIHRvIHJ1biBhcyBhIG5vbi1yb290IHVzZXIsIHNvIHB1bGwgaW4g
dGhlIHB0ZXN0IHVzZXINCj4gLURFUEVORFM6YXBwZW5kOmNsYXNzLXRhcmdldCA9ICIke0BiYi51
dGlscy5jb250YWlucygnUFRFU1RfRU5BQkxFRCcsICcxJywgJyBwdGVzdC1ydW5uZXInLCAnJywg
ZCl9Ig0KPiAtUEFDS0FHRV9XUklURV9ERVBTICs9ICJwdGVzdC1ydW5uZXIiDQo+ICsjIFRoZSB0
ZXN0cyBuZWVkIHRvIHJ1biBhcyBhIG5vbi1yb290IHVzZXINCj4gK1VTRVJBRERfUEFDS0FHRVMg
PSAiJHtQTn0tcHRlc3QiDQo+ICtVU0VSQUREX1BBUkFNOiR7UE59LXB0ZXN0ID0gIi0tc3lzdGVt
IC0taG9tZSAvbm9uZXhpc3RlbnQgLS1uby1jcmVhdGUtaG9tZSAtLXVzZXItZ3JvdXAgcHRlc3Ti
gJ0NCg0KVGhlIG9yaWdpbmFsIGxpbmVzIHdlcmUgaW50ZW5kZWQgdG8gcHVsbCBpbiB0aGUgcHRl
c3QgdXNlciB0aGF0IHRoZSBwdGVzdC1ydW5uZXIgcmVjaXBlIGNyZWF0ZXMuICBXaHkgaXMgdGhh
dCBub3Qgc3VmZmljaWVudD8NCg0KUm9zcw==

