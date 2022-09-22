Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7AAC54EE9
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 12:42:36 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.42])
 by mx.groups.io with SMTP id smtpd.web11.6614.1663850550932275539
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 05:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=sYZ3FLKd;
 spf=pass (domain: arm.com, ip: 40.107.20.42, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=WBXUwH0xmHxmX9bSF87xRv0RdvTq17EWxxpTxa5hKzl0Tz267Y+QhCny1X/83YPPHOahEDI+H5wmJMzXtsZIU6gBSZvc1qqPGJCIDFth4Sy9m7C1HKQcWsrgsmkmpT0xclUd3YOpAa/hqgSYlJqhE6GHQ9G3R0JqcblQ2r8h96+/u15l7cclEYTbkWSvmRO5i6D8fSU9mx9tZ5Oj1+5AsNKchC1bjJFPy1sMoARivDToj9IT6FdcL4N+sqXN5C6XnRh6mTUhVFCElLOjq0+gRcLiuG0LpjaTACQuPKf/HeqXcBuMVE7jmIP6HZw0n7JxvE5lEi2avegCig1mtDtAZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zzwmULbaJZTGF3FUU8QeiZf6M89+EOcx204PVpZigWc=;
 b=D1bFUc40E2Yq+PZqv0flxwDBlP1CLhl7e5yjC2t8x+rCQXZ+nDzqmVJbkvYiDV/ShrUPVz5VjKG0oFEhRErKhn8GvkEg4caO9/cA5UcF+ugpqSBgZPEV3gr+1hBa7QJZY8w0ich0G+XgB/t0qwv3s/YofMPDPGDA5Lp0drFi0frGG5vZEfrk64HYn6tf1EjQSaXf53ueciBeW/zGR3KlkagDTJJxfuZqGxtPwzti0P9gMwFQGCIB7raW79RdI+R40SVRLrzo53U1y3oHAWUfJKUuaWx7La5m87+dNNeXIDdE/2oZH7tadU6oHV8rOoWETsFkuRjh2ovGUBMdbhuKDA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzwmULbaJZTGF3FUU8QeiZf6M89+EOcx204PVpZigWc=;
 b=sYZ3FLKdL/+IrM4uHvkbzSefv6gqDjuo6Igs3eDOe5hHOwp5yYMWFhpl/uw2ETBUW8TprcWF4rZ3HWaSp74QI2APFU2jn4HVC/9agU8ZrDkhcxy0Y5fGYVcnLAN9Hxf9IxxBKf1y6aIxawrYXN9IRrbEUzLgdBRP8U5bhiAE8JQ=
Received: from DB6PR0402CA0012.eurprd04.prod.outlook.com (2603:10a6:4:91::22)
 by PAVPR08MB9795.eurprd08.prod.outlook.com (2603:10a6:102:31f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Thu, 22 Sep
 2022 12:42:26 +0000
Received: from DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::64) by DB6PR0402CA0012.outlook.office365.com
 (2603:10a6:4:91::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17 via Frontend
 Transport; Thu, 22 Sep 2022 12:42:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT029.mail.protection.outlook.com (100.127.142.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 12:42:26 +0000
Received: ("Tessian outbound 9236804a5e9b:v124");
 Thu, 22 Sep 2022 12:42:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6f1f09767672eb02
X-CR-MTA-TID: 64aa7808
Received: from ea6ca744b44a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4CDDA6DD-0CD9-4894-A2AB-A56CEFB029A3.1;
	Thu, 22 Sep 2022 12:42:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 ea6ca744b44a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 22 Sep 2022 12:42:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Av0Z/fIKBCeT1KlZSVLu+LqPfaZbSNsUlkoPFqdHvzAMdGZyiN1GB+N4BHRsrbo3TFUMfY7yU+6y/C+S0gV04l6de1XTFxC1ugUQgGPSNePLwGSjZBTYzNAM1g0gbOh3wCNRI7ofAEupLbX4rLW8CsC+sRe1XkR2aUlLEqQSdRFiEdEUGKOi/wbRffb+xDHsczQh8onIJHOfNzPE1L8fPfGyKaZ4nD0bK5PyWPPlu9O2z7A4id8PpR/Jbs6nmw5uglmjvPxjPhZXJQtfR6an3Z3DsvjgXny1a4jKGfTAaG6WvtgRvpYwY0Yu2nefIEtstetJcAVx3QKxUfWjKBI+HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zzwmULbaJZTGF3FUU8QeiZf6M89+EOcx204PVpZigWc=;
 b=b7l3i66uSRYbtT4F6OEY8lt17TOKfG+XKjWYkNownY2PPAlLO/fAs7YtBZftXr65BjlZha6H2VZjff0gA0TgNde4XPFSFnz7TsvXKz5JJLdjv42XG8HafMp7zk7u0f3AafHtOD7+zRxXEZSyZHvGj05waZQ5HQrzvSpgoRyoCdmO01+9JCATh/Q9u8Wb3M6GFtYqVHty+MHwLe3qFKh0gGrJTzbV29kUgwWTnk2aeTEZlZ5P7jrjOeJ127nscj7RVGNPL0RYINBmHJCr3d4DJWKBeluVgSADmr/qaVhvaDIPZ0tuflNb7RfHJ7zbXIVpip1PUxth0XxSUhJuaTIEfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzwmULbaJZTGF3FUU8QeiZf6M89+EOcx204PVpZigWc=;
 b=sYZ3FLKdL/+IrM4uHvkbzSefv6gqDjuo6Igs3eDOe5hHOwp5yYMWFhpl/uw2ETBUW8TprcWF4rZ3HWaSp74QI2APFU2jn4HVC/9agU8ZrDkhcxy0Y5fGYVcnLAN9Hxf9IxxBKf1y6aIxawrYXN9IRrbEUzLgdBRP8U5bhiAE8JQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6152.eurprd08.prod.outlook.com (2603:10a6:20b:298::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18; Thu, 22 Sep
 2022 12:42:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::559c:f19f:f674:b553]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::559c:f19f:f674:b553%4]) with mapi id 15.20.5654.018; Thu, 22 Sep 2022
 12:42:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mikko.rapeli@linaro.org" <mikko.rapeli@linaro.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] poky.conf: allow changes to DISTRO_VERSION,
 SDK_VERSION and MAINTAINER
Thread-Topic: [OE-core] [PATCH 1/2] poky.conf: allow changes to
 DISTRO_VERSION, SDK_VERSION and MAINTAINER
Thread-Index: AQHYzn5AlU3WmUOi8E2jdSxc3OLup63rZIEA
Date: Thu, 22 Sep 2022 12:42:17 +0000
Message-ID: <A7BB2455-96E4-4403-8E60-AE010F0AF124@arm.com>
References: <20220922122402.32710-1-mikko.rapeli@linaro.org>
In-Reply-To: <20220922122402.32710-1-mikko.rapeli@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6152:EE_|DBAEUR03FT029:EE_|PAVPR08MB9795:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fe38941-978b-4e7a-d5c7-08da9c97e759
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 a6VrSk9NXusd+oQkNiQrSbB4gC7azzbSDKbL6h9Oc1OuM3U7Q/PWZ2ffUaXlgSSMNiKumASSPA52Dv5MwHJfZmvo7E2lwT9/bMyulag5ox4Ne9ci7k1OIlOx0k2RTXzzRs4A7v32yq8t2/MQhVJfmnehoTh1H697y8ngUcC4xYA25bZwU5lgD4pghdlWs2xxqFQ6S7/iuicZFuWDE1QXO7zzMxC1+MvGp05hIRBWPg17XRUxBMG7cNHkeOmyePcLHbdgfEDdZb2mek+ibzdK+WOA9TUIKuZUuJ2eTcy3DgvYpv5IgthIKqT7xa/knHFCK/0LJR+u9ZdZHKVC329OQgy0sQseXzACA5BxIZtrGVAltmJGmyobf/iJpDjS3sIvHtuuyINvh+MKQjB4PzOVUIAhnPM7CDYlDm3YdZSLXgG0DHxJD1acrbw/AY25qFRERayXZAv5QOiQJ4VS0UKw8yEKuKeo9qRKawRzAO5FooSOXjZf0ki1t30deOMiqL24KbRjTp0HWWY175e3XNCVrMwVeUqJAMGnkyOGdH3MPzlI+WYSwSwAYZkCbZR3SR56zxSqgo/QYFf7mJVA2IHg8r9x7QHpQfoEmsMz5hQrf3jcXhOGhNiNW/jb2j9izWENIyN1dGHrwBupfX1CvuoMqe20kFAx1254wDEHa2fAkjebZGJHbj4LzWFhGwg+RWUGGNncKVDDrO7hsXCshBe3YxcajCsK6OQC6lNfqThK73ZZ4oomVh1blXMXK+UvisorYUTUGUrw1Blw4UZ5hrXoZmQCQGpqH92W1HfP2vhD2Ts=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199015)(91956017)(36756003)(83380400001)(66946007)(66446008)(66556008)(66476007)(86362001)(4744005)(38100700002)(76116006)(5660300002)(122000001)(64756008)(2906002)(4326008)(38070700005)(8936002)(33656002)(41300700001)(478600001)(6486002)(71200400001)(2616005)(8676002)(186003)(6916009)(26005)(6512007)(6506007)(53546011)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D9E48C0BE925148899C4CFB0992FB09@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6152
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e10b30d1-285c-4c6a-7204-08da9c97e1fb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	29wZxM6pOBsirToUwQ8t6h6imQhPSALWGJ4l6fVFOwkft6NXZNZBovYdzBtK/XxGNSBE5LyDCDTG6Kxp8y8Y5Ak+pa7iQeS9y8fOzcy0nLIYO1oKyFNxdIzXVaZwTfhqM6nIjVK2H+rSN0MKJDAFQhuq3i41JFxgOTDWEF3LMq4Enav2EgcDUE9golsw/9DFhDBYx7zrUVScYlqY699BIO4t7HO6Vpcfw5lvqCtqbuHT+1SX77gGY526CN21mRRi7WtJM9Z6vaNMAFVcXheVD1RgUlLuXzHtGay6+t0l4viPCAccKxHi0VW4JcoUyzSUA/Kz4oVPxeYWM0WsSK0ffAnF3pS3Yf1paIOw92TGH3DvoSHKPLPLaHpMr0Wmh4tSvq/XV2Csp1F/9n6O+4pHMScg/j50Omrkb7crlrGqLj8TOK84zGBBJCSU5ksAZ8CHDcHMCL0tFmffs3wBHEIjcVE2ceH3L7Yhn/IhoonxYIZoMlsEq/7N455ae9gvD/Xy5KCXJgXqANxkMEdkKrJjxzf60GnYK2+ZyiZeSFYgcGuImXv4GmYAGdhSHqO/6isDH7vFZ4ZhESgY7NMaVWD4TOZlhiJn9copmtI1Qzuxgp2Cwl0YgVMwR4t9eCisfhhG689bA3dAXJtfRx3Odyz31WSrl1ZpNEE+FvOK67MW9Zkma8jcFI2Iqmhw1tBHDE9ud6K2WC7bHDEcMiIMA36jhfPQ6Qu3cm0OdmSFfDALZBC64kUJ4k414hluSmTkimboyL+bj+mVAJx3DIOG4wp8xw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(41300700001)(478600001)(82740400003)(81166007)(86362001)(36860700001)(82310400005)(6486002)(4744005)(40460700003)(40480700001)(36756003)(8676002)(70206006)(356005)(4326008)(70586007)(5660300002)(6862004)(33656002)(2906002)(316002)(8936002)(186003)(336012)(47076005)(2616005)(26005)(6512007)(6506007)(83380400001)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 12:42:26.1609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9fe38941-978b-4e7a-d5c7-08da9c97e759
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9795
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 12:42:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170974

T24gMjIgU2VwIDIwMjIsIGF0IDEzOjI0LCBNaWtrbyBSYXBlbGkgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPG1pa2tvLnJhcGVsaT1saW5hcm8ub3JnQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiANCj4gRm9yIHVzZXJzIHdobyBidWlsZCB0aGVpciBvd24gdmFyaWFudHMgb2Yg
cG9reSwgdGhleSB3YW50IHRvIHN0YXkgY2xvc2UNCj4gdG8gcG9reS5jb25mIGFuZCB0aHVzIHVz
ZSBpdCwgYnV0IHdvdWxkIHN0aWxsIGxpa2UgdG8gY2hhbmdlIHRoZQ0KPiB2ZXJzaW9uIGRldGFp
bHMgYW5kIG1haW50YWluZXJzIHRvIHRoZWlyIG93bi4gV2l0aCB0aGlzIGNoYW5nZQ0KPiB0aGVz
ZSB2YXJpYWJsZXMgY2FuIGJlIGNoYW5nZWQgaW4gbG9jYWwuY29uZiwgZm9yIGV4YW1wbGUuDQoN
CklmIHlvdSB3YW50IHRvIG5hbWUgeW91ciBkaXN0cm8sIG1ha2UgeW91ciBvd24gZGlzdHJvLmNv
bmYuDQoNCllvdSBjYW4gdHJpdmlhbGx5IGp1c3QgaW5jbHVkZSBwb2t5LmNvbmYgYXMgdGhlIGZp
cnN0IHRoaW5nIGl0IGRvZXMsIGJ1dCBJIGRvIHJlY29tbWVuZCB0aGF0IGV2ZXJ5b25lIHVzaW5n
IFlvY3RvIGluIHByb2R1Y3Rpb24gY3JlYXRlIHRoZWlyIG93biBkaXN0cm8gYW5kIG5vdCBwaWdn
eWJhY2sgb24gUG9reS4gIFBva3kgY2FuLCBhbmQgZG9lcywgY2hhbmdlIG92ZXIgdGltZSBhcyBp
dOKAmXMgYSB0ZXN0IGRpc3RybyBmb3IgUUEgcHVycG9zZXMsIGFuZCB5b3UgbWF5IG5vdCB3YW50
IHdoYXQgd2UgYWRkLg0KDQpSb3Nz

