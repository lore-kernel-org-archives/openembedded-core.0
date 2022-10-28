Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BED4C38A02
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 15:59:47 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.82])
 by mx.groups.io with SMTP id smtpd.web11.1237.1666972783691138275
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 08:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=1YjK/YbP;
 spf=pass (domain: arm.com, ip: 40.107.22.82, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Nmep/19NdCqfVQikQgolmFrm0ui2D3Lu1Ey1xeVVjzgOc52NUwXK+gtE5F+AwVDzMpQS/kDxSrMJ/7hHDhNe3SXqYUkC7OBjeT671F0/quQ0sAIKqxiWdN76z7Z9Cz7foza6JdQDJ5+2jf/TlB44gqzfdDkUYQkqOkGR9csCLfvWQXOEjFcILbYQYi0p+F1VJyuQhKSg4U+YM0TppBFM8WMlmryOORSlAC2MEFD+087qnLre233oQMnbt9ddYfGBvcH3b/jDuEGDK9O8oGPTujfEmMoHQopkzZB3ywcDk/WAPTLUM95TaaGgPO8SgKamJ9vJZvxbZPomzSvG0q0iUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIkgtZXWGaRIdxOzC7vp1uYO7n44PA0yHanrxeZxQtU=;
 b=f6dURoTbMAQNugjOvwxaAvM7Rv4ZzD/G3ZzJ4TWtW0LCpPKcXxlJr//ZEOsiPuz5gdAsIy9kGnBrPhw2+m1pMWSnlYRJKytCrNdeLf89GC6Q0+C/uAMXvMa6FxERSEUE0W9eWsuENFx0HfQf94am9TDgvD7sIg2ywfLC5AJaCWmPIbo/fJ8oTbgLTa04ckzXcht6p/MXs/Mik/DJvqnBIu4xPv8ayzA8KmikNuYMupcMea96/WJ/5Ah0VByh+/6BZNRWw6ycqQukkyLAfPTOj8ZWkthBJwaNexNP9WLQTOANIqT6rhm/EswFtVgN3f3+zYu5bkZ6cvnKhlfSgXsAvQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIkgtZXWGaRIdxOzC7vp1uYO7n44PA0yHanrxeZxQtU=;
 b=1YjK/YbP1I294epRnxWWQDiK/BH/IxbSpqqfzc+/vtGHv75Pj2d0jp5p0Qm9obzcrT5M6WHK6O4yUHmMzvtX88X3eX1WIXZypelBWpss4//mX7N1m1n8ibqptxSuyyHAbDDLxEwiqvVS0K+84HGrzvLriB+ud4rb7CKawhVJM6Q=
Received: from AM6PR04CA0015.eurprd04.prod.outlook.com (2603:10a6:20b:92::28)
 by AS8PR08MB8111.eurprd08.prod.outlook.com (2603:10a6:20b:54d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 15:59:40 +0000
Received: from AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::dc) by AM6PR04CA0015.outlook.office365.com
 (2603:10a6:20b:92::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Fri, 28 Oct 2022 15:59:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT008.mail.protection.outlook.com (100.127.141.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Fri, 28 Oct 2022 15:59:39 +0000
Received: ("Tessian outbound 0800d254cb3b:v130"); Fri, 28 Oct 2022 15:59:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 72d24b6cc177e8ab
X-CR-MTA-TID: 64aa7808
Received: from 7b197226fb20.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5630373A-78C0-42B8-A102-A57C2A4CFE2B.1;
	Fri, 28 Oct 2022 15:59:33 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7b197226fb20.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 28 Oct 2022 15:59:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVYxaMw4PxTz6enJZFBO9Xa2B6/VgTbaLivjMYBmBGszfFDffbPYMKP9WSNaJRVbxl/Z8ia+MbpB+qxm7skmgt3qwU0DnUrXuybg4dUKuF5oBqkg8Kk0vNGghEoWp3ZgzqFC94YdTdCBFCIrcWaZTriTuqudsGJdki+rVszncdcicsULM+BtnTfMywqG+7b+whuDmCUF9CEoIRe8zROPKCGSoUV13GpFjM6XUPLwAvtWnZ/XS/VVdx03fCBCyF3RGMa5dPjWbTEGN6gVvd6iPtbhBhAtKyVFIF8PdU4gK4lGn5KajlAmlE1fl7T+kBg7DgkMfUcHVS6Kd5tEeEX48Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIkgtZXWGaRIdxOzC7vp1uYO7n44PA0yHanrxeZxQtU=;
 b=Ux6Bzy+pH5SETheuI9OQqE6nED4C0m3ZYbRCgaqLayfL6LS0lALDdE5sCBkuNHjuj4idsoKTHTmUfglzjSOMgQyrQ2aPx3rIJ2hkSE/6TzmfQT5mFEnnyiANMAYAvCPvLeFw7hGrZJYtK//z9RGbM13wSSaRlzrwCj06T0PPo6XVhBBciJ5cGNkmU0XTYabwbV+ZHtkJ0GoLU8jTeAYDloSUCfFmAKTlDLOot0jofnZgi9xhD1VPliVMdK5ceFdFqyz3Fon1YV3L4a+R2XVni5LB5pVF9XDeqeeDsl36D00xMPKyYboVc7r1YDjfs3lJcn9ThjhG/PV5quz4idJQ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIkgtZXWGaRIdxOzC7vp1uYO7n44PA0yHanrxeZxQtU=;
 b=1YjK/YbP1I294epRnxWWQDiK/BH/IxbSpqqfzc+/vtGHv75Pj2d0jp5p0Qm9obzcrT5M6WHK6O4yUHmMzvtX88X3eX1WIXZypelBWpss4//mX7N1m1n8ibqptxSuyyHAbDDLxEwiqvVS0K+84HGrzvLriB+ud4rb7CKawhVJM6Q=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9933.eurprd08.prod.outlook.com (2603:10a6:10:402::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 15:59:30 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc%5]) with mapi id 15.20.5769.014; Fri, 28 Oct 2022
 15:59:30 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "narpat.mali@windriver.com" <narpat.mali@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"archana.polampalli@windriver.com" <archana.polampalli@windriver.com>,
	"hari.gpillai@windriver.com" <hari.gpillai@windriver.com>, Alexander Kanavin
	<alex@linutronix.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core][kirkstone][PATCH 2/2] wayland: update 1.20.0 -> 1.21.0
Thread-Topic: [OE-core][kirkstone][PATCH 2/2] wayland: update 1.20.0 -> 1.21.0
Thread-Index: AQHY6uW/0edjXnXA9UKuEOJhneXBwa4j9rmA
Date: Fri, 28 Oct 2022 15:59:30 +0000
Message-ID: <B23AF8E8-1CBA-49E5-90C7-404C1B9F322B@arm.com>
References: <20221028155331.1594577-1-narpat.mali@windriver.com>
In-Reply-To: <20221028155331.1594577-1-narpat.mali@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9933:EE_|AM7EUR03FT008:EE_|AS8PR08MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e5960ed-fb5b-44c7-b7a5-08dab8fd6ba2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 2zr0oBQn84N3043rBlwVa90OERI/P9G0RsI2TpvL7cEeesNfvGJuIKa2ZntBSQfYs5jMwr3YQEqq2M/PnLfDlV68hk765uABWtEiFf+mYkMuoPeCMe6aXwUA+/eD+aaXnFHgNat693UL9bjNs2da8bSbZNWVR0Pzb7sD8wxzypC6h2YKaOcQC1GcalZ+A6dCGVkFB30c564M4kGq4EH1jvEFtERvelAtWn28bj1Gx6tMH3z8cQlQZ4PPEaW60PG3fqh7xL9xi3yVMzpixnJrokgURJ5hsKOEZ0k74uT8TzH9LC1bOPLiXaYYCsodh1tZ9PuBdjGqp+Gk2BMDILMNYdq2SEptIfwRyF823ytVvSIMrffLfAW+jHV8z2DFrejyMtoIfoAi37+sVACgPuJ54vgSDwJvf4FpC0rGiVJnoB5JmX2D5aofoN7FHXm7OAutgRSguoPNhjGEynQSI/4eZ/FwFMssgLbBDZozJI5pIkhEcNJCbxoKg3aVhubq8U7z5XbBZ0M1gNq96eP/lwLEp9/RWtsmkl++CXvg+CVG6v6WiesyW6oOdf0FRn/kHvsyQ01N9oaxMaYvXy43k91k9uR7YBt6SOB8fKYahhL/PjGDP/ExaIJ9rIglK2JIT72a7nwKV7taJbxz8IXuXreHcQmjI8g1c1HvIChsU/0TEvDLBrjrn9+RzoXV42UgkIuiIVUh3b+kKYgSozOKTIg5lZdKRCvB0svGptBmc6IB3fx61ORfif4WVJGe7xSC/oupbh5FI5KReK5dvt6BJMrbAkt5L/wNch33RShgW3yuek5zo4JdoA9Au/8cF2QuA77CdGTwnBNYIpGPAsIzWZRclQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199015)(38070700005)(5660300002)(26005)(41300700001)(2906002)(83380400001)(8936002)(2616005)(15650500001)(186003)(38100700002)(122000001)(66899015)(36756003)(6486002)(966005)(71200400001)(478600001)(6506007)(91956017)(86362001)(6512007)(66946007)(4326008)(8676002)(33656002)(66446008)(66556008)(66476007)(64756008)(76116006)(6916009)(53546011)(316002)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <47B1919981B09342AF9AEA75DC7C6953@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9933
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	edb5f2fc-eeb2-4f12-1a94-08dab8fd6640
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uM6ayZy0K1ACX1Jb6D2QbHggq526nvxnryfxeUI+0KqK9tEmCCiSi98JpmwDFX4EDU+h0nDZTLjGSng20rg8QeoAFmw9Tw5bcB7MQgZPeCFC5Jj8+bZN6xwkadBFnOgEktQ51utf8yGJz/BqrD4FcxjuJ5e+RpTEkuk9CozuJSWadoIUWP+URBlmoMmmDr3IkpwwW1NpJi6PdbNm1rNTvuyK7FfafrjXT5VtCVBjp5pwLyg80bTwBTYqISLfXRgBVEHSdqLQMqAw3pfVO4xB68icJjEKka1riUI7Vu80qeVF1k1jhkVr2YoKQDKyoRVUbmM/+Vg1qZ9xIe+l6hzlthujkS0poDX3zwVvqIKuE3fFjV99GVLc2Oy7gmIY6xIEfXUZMcuoJH2f9ngVWoZJNqND3lcYiVhxi2JrmaNO4UVIuDteuz/kK+fPa9UC8pPMfROyWJMZMWCeYy5KiZm7RzpeBjyPAv2+3NmGDr0Svi7ALWLw1Yvfp93DislgjMh7wUk9tcDPOTeAc7FzQAZ1CxYOn6TDo5T+52WMzu1WsPsmvuj+00QEb0QIP4Pz6NszfQLpbPT22SbFfDc7/DQW0Bazibqi0YZfATQD+VLVWDj3QOmmHkCUhqGzyg79m8FmdWM1ujPmlGpxHkfgR4Qe+mVbqjAtRKSDY56wgYEM/ATQjzpwaHhNsm17Y2HC6m2Qx4iFhGwzprRgYh1PmPC1IYWV5sJHx9lOu7cT22gLpVXGV4J8q5PBbgaLa4mUhVaOz1GiydeApFlm3PKxPH7V2xkKiBfezjEup0z7cKrO29U=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199015)(46966006)(40470700004)(36840700001)(478600001)(5660300002)(6486002)(66899015)(41300700001)(966005)(107886003)(2616005)(6512007)(26005)(6862004)(53546011)(356005)(86362001)(81166007)(4326008)(36756003)(83380400001)(186003)(336012)(316002)(54906003)(6506007)(82740400003)(82310400005)(8936002)(47076005)(8676002)(36860700001)(40480700001)(70206006)(15650500001)(33656002)(40460700003)(2906002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 15:59:39.7627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5960ed-fb5b-44c7-b7a5-08dab8fd6ba2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 15:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172263

VXBncmFkZXMgYXJlIG5vdCB1c3VhbGx5IHRha2VuIGludG8gdGhlIHN0YWJsZSBicmFuY2hlcyB1
bmxlc3MgdGhlcmXigJlzIGEgZ29vZCByZWFzb24uIFdoYXTigJlzIHRoZSByYXRpb25hbGUgZm9y
IHRoaXMgdXBncmFkZT8NCg0KUm9zcw0KDQo+IE9uIDI4IE9jdCAyMDIyLCBhdCAxNjo1MywgTmFy
cGF0IE1hbGkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG5hcnBhdC5tYWxpPXdpbmRyaXZl
ci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBEcm9wIHRoZSBwYXRj
aCwgYXMgaXQgaXMgbm8gbG9uZ2VyIG5lY2Vzc2FyeQ0KPiAoZ2VuZXJlYXRlZCAucGMgZGVmaW5l
cyBldmVyeXRoaW5nIGFzIHJlbGF0aXZlIHRvIHRoZSAucGMgcGF0aCkuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPg0KPiBTaWduZWQt
b2ZmLWJ5OiBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+
DQo+IA0KPiBVcHN0cmVhbSBtYXN0ZXIgY29tbWl0Og0KPiBodHRwczovL2dpdC5vcGVuZW1iZWRk
ZWQub3JnL29wZW5lbWJlZGRlZC1jb3JlL2NvbW1pdC8/aWQ9ZTUyNWRiNGViOTU1Njk3OWM2N2Y2
YTkwOGY2NjQ2MzYzMTU0Y2QwNg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmFycGF0IE1hbGkgPG5h
cnBhdC5tYWxpQHdpbmRyaXZlci5jb20+DQo+IC0tLQ0KPiAuLi5oYXJkY29kZS10aGUtcGF0aC10
by13YXlsYW5kLXNjYW5uZXIucGF0Y2ggfCAyNyAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+IC4uLi97
d2F5bGFuZF8xLjIwLjAuYmIgPT4gd2F5bGFuZF8xLjIxLjAuYmJ9ICB8ICAzICstLQ0KPiAyIGZp
bGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyOSBkZWxldGlvbnMoLSkNCj4gZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmQvMDAwMi1Eby1u
b3QtaGFyZGNvZGUtdGhlLXBhdGgtdG8td2F5bGFuZC1zY2FubmVyLnBhdGNoDQo+IHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC97d2F5bGFuZF8xLjIwLjAuYmIgPT4gd2F5bGFu
ZF8xLjIxLjAuYmJ9ICg5MyUpDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3dheWxhbmQvd2F5bGFuZC8wMDAyLURvLW5vdC1oYXJkY29kZS10aGUtcGF0aC10by13YXls
YW5kLXNjYW5uZXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5k
LzAwMDItRG8tbm90LWhhcmRjb2RlLXRoZS1wYXRoLXRvLXdheWxhbmQtc2Nhbm5lci5wYXRjaA0K
PiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggZTNlNzE5MjViOC4uMDAwMDAwMDAw
MA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5kLzAwMDItRG8t
bm90LWhhcmRjb2RlLXRoZS1wYXRoLXRvLXdheWxhbmQtc2Nhbm5lci5wYXRjaA0KPiArKysgL2Rl
di9udWxsDQo+IEBAIC0xLDI3ICswLDAgQEANCj4gLUZyb20gM2U3Y2Q1NjYxMWFlZWMyNzRlNDhh
NDgxNmJjN2MyMWY3NGYxNWJlMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4gLUZyb206IEFs
ZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPg0KPiAtRGF0ZTogTW9uLCAx
NyBGZWIgMjAyMCAyMTo0NjoxOCArMDEwMA0KPiAtU3ViamVjdDogW1BBVENIXSBEbyBub3QgaGFy
ZGNvZGUgdGhlIHBhdGggdG8gd2F5bGFuZC1zY2FubmVyDQo+IC0NCj4gLVRoaXMgcmVzdWx0cyBp
biBob3N0IGNvbnRhbWluYXRpb24gZHVyaW5nIGJ1aWxkcy4NCj4gLQ0KPiAtVXBzdHJlYW0tU3Rh
dHVzOiBJbmFwcHJvcHJpYXRlIFtvZS1jb3JlIHNwZWNpZmljXQ0KPiAtU2lnbmVkLW9mZi1ieTog
QWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+IC0NCj4gLS0tLQ0K
PiAtIHNyYy9tZXNvbi5idWlsZCB8IDIgKy0NCj4gLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkNCj4gLQ0KPiAtZGlmZiAtLWdpdCBhL3NyYy9tZXNvbi5idWls
ZCBiL3NyYy9tZXNvbi5idWlsZA0KPiAtaW5kZXggMTU3MzBhMy4uNjFlZGJjOCAxMDA2NDQNCj4g
LS0tLSBhL3NyYy9tZXNvbi5idWlsZA0KPiAtKysrIGIvc3JjL21lc29uLmJ1aWxkDQo+IC1AQCAt
NTIsNyArNTIsNyBAQCBpZiBnZXRfb3B0aW9uKCdzY2FubmVyJykNCj4gLSAJCQknZGF0YXJvb3Rk
aXI9JyArIGpvaW5fcGF0aHMoJyR7cHJlZml4fScsIGdldF9vcHRpb24oJ2RhdGFkaXInKSksDQo+
IC0gCQkJJ3BrZ2RhdGFkaXI9JyArIGpvaW5fcGF0aHMoJyR7ZGF0YXJvb3RkaXJ9JywgbWVzb24u
cHJvamVjdF9uYW1lKCkpLA0KPiAtIAkJCSdiaW5kaXI9JyArIGpvaW5fcGF0aHMoJyR7cHJlZml4
fScsIGdldF9vcHRpb24oJ2JpbmRpcicpKSwNCj4gLS0JCQknd2F5bGFuZF9zY2FubmVyPSR7Ymlu
ZGlyfS93YXlsYW5kLXNjYW5uZXInDQo+IC0rCQkJJ3dheWxhbmRfc2Nhbm5lcj13YXlsYW5kLXNj
YW5uZXInDQo+IC0gCQldLA0KPiAtIAkJZmlsZWJhc2U6ICd3YXlsYW5kLXNjYW5uZXInDQo+IC0g
CSkNCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmRf
MS4yMC4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZF8xLjIxLjAu
YmINCj4gc2ltaWxhcml0eSBpbmRleCA5MyUNCj4gcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3dheWxhbmQvd2F5bGFuZF8xLjIwLjAuYmINCj4gcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmRfMS4yMS4wLmJiDQo+IGluZGV4IGRkNDhhMjlkYzQu
LjIwOTJkZWFjOTIgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5k
L3dheWxhbmRfMS4yMC4wLmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5k
L3dheWxhbmRfMS4yMS4wLmJiDQo+IEBAIC0xNCwxMCArMTQsOSBAQCBERVBFTkRTID0gImV4cGF0
IGxpYmZmaSB3YXlsYW5kLW5hdGl2ZSINCj4gDQo+IFNSQ19VUkkgPSAiaHR0cHM6Ly93YXlsYW5k
LmZyZWVkZXNrdG9wLm9yZy9yZWxlYXNlcy8ke0JQTn0tJHtQVn0udGFyLnh6IFwNCj4gICAgICAg
ICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwNCj4gLSAgICAgICAgICAgZmlsZTovLzAwMDItRG8tbm90
LWhhcmRjb2RlLXRoZS1wYXRoLXRvLXdheWxhbmQtc2Nhbm5lci5wYXRjaCBcDQo+ICAgICAgICAg
ICAgZmlsZTovLzAwMDEtYnVpbGQtRml4LXN0cm5kdXAtZGV0ZWN0aW9uLW9uLU1pbkdXLnBhdGNo
IFwNCj4gICAgICAgICAgICAiDQo+IC1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjhhMDM0MTU0Yzcw
NTk3NzJlMGZkYmQyN2RiZmNkYTZjNzMyZGYyOWNhZTU2YTgyMjc0ZjZlYzVkN2NkODcyNSINCj4g
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2ZGM2NGQ3ZmMxNjgzN2E2OTNhNTFjZmRiMmU1NjhkYjUz
OGJmZGM5ZjQ1N2Q0NjU2Mjg1YmI5NTk0ZWYxMWFjIg0KPiANCj4gVVBTVFJFQU1fQ0hFQ0tfVVJJ
ID0gImh0dHBzOi8vd2F5bGFuZC5mcmVlZGVza3RvcC5vcmcvcmVsZWFzZXMuaHRtbCINCj4gVVBT
VFJFQU1fQ0hFQ0tfUkVHRVggPSAid2F5bGFuZC0oP1A8cHZlcj5cZCtcLlxkK1wuKD8hOVxkKylc
ZCspIg0KPiAtLSANCj4gMi4zNC4xDQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0N
Cj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+
IFZpZXcvUmVwbHkgT25saW5lICgjMTcyMjYyKTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xNzIyNjINCj4gTXV0ZSBUaGlzIFRvcGlj
OiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvOTQ2Mjk3MDQvNjg3NTg4OA0KPiBH
cm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVt
YmVkZGVkLWNvcmUvdW5zdWIgW3Jvc3MuYnVydG9uQGFybS5jb21dDQo+IC09LT0tPS09LT0tPS09
LT0tPS09LT0tDQo+IA0KDQo=

