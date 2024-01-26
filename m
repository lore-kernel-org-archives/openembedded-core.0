Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E701C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 17:13:58 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.42])
 by mx.groups.io with SMTP id smtpd.web10.3717.1706289228704819695
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 09:13:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=dZZlN8IZ;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=dZZlN8IZ;
 spf=pass (domain: arm.com, ip: 40.107.247.42, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XcEjXw+rJB0M41fc8mh9ZWo8klleSaMJI6Yw2Sbo5F3Eyn7Yq28qiAObKltQqEgssyZiuAj+iLu2qcEbnYM/2QBIsxH7RrlsogqIVU9FugB+4oHFlVOvlvOT9oIY4eM2c+n3dE/5l+EfacOTi72frO+ubY3myIJCeb7epKotwae91NvgbifvgTmLyLImdtJ7TozWcwyBgfSb1lfeoR2XQFOx7SyPuHI7sX/wWB805lzKnQ9NojDKYzJW+LmJ9NQtQcOISjvKbRYKDJKIeR4luKiixs5uE9w0OoBoUHbmk3ZiVwEZx9q2gJuCLxiSs8T3cW2OehwmJnjsRcjXHHrcYA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=555HxS7C+SHWmCAhptRQkGx54lyU/Djtpasfv5ujkyA=;
 b=EaObtVcxzNVYNqM8BtYTHI0Q52ud2vyemR5SP2KCPltAJABHHS4ouEShV7cJBjSFHTjKvc3uUTk1SPREFEp8xgK2uxSv0ngVMfvq3jZXEwZtlobgOjhtSZ7ZAgjhoxUtFyw5jVqfX46RBIKwfxDmo846nJrzlFqPU9514S9X1O1tPnUTYc4+9Y+OdcG5Ivohz3SkJ/+imfMDHPenQOM+waWXp7dyl4nyQFPUS7G1xR64u9LnV5O1XD9sJkeVZNsd0gtmUFwr50qz6HMTLcXF/PQ2AILlptS6LDbSW6dnPBI85W5UO558N4umgqFP4q9XSPLLFjiUdjBHxHar11adKQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=555HxS7C+SHWmCAhptRQkGx54lyU/Djtpasfv5ujkyA=;
 b=dZZlN8IZPdHg26ch0fvz9RUyL096xcUUbNASbT5VcGFBsYYBz7QVgKiAVxEUp6Aa6NJvjKFV5SyuKEShcIYEwI1BuyE+sbsGvl0oj5+5x9gvN0oNRlihJhBnNTtuZSnVG3OMjLOGPETvKuQULt/Rql9z7GfWQJehcwKWsM525jQ=
Received: from DUZPR01CA0088.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::14) by GV1PR08MB8240.eurprd08.prod.outlook.com
 (2603:10a6:150:5d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 26 Jan
 2024 17:13:45 +0000
Received: from DB3PEPF00008859.eurprd02.prod.outlook.com
 (2603:10a6:10:46a:cafe::9b) by DUZPR01CA0088.outlook.office365.com
 (2603:10a6:10:46a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22 via Frontend
 Transport; Fri, 26 Jan 2024 17:13:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF00008859.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.16 via Frontend Transport; Fri, 26 Jan 2024 17:13:44 +0000
Received: ("Tessian outbound 94d82ba85b1d:v228"); Fri, 26 Jan 2024 17:13:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 71fff023b084bb36
X-CR-MTA-TID: 64aa7808
Received: from b9af9e239d62.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BC911D8C-6A77-4D0B-996C-A33E2C8D0446.1;
	Fri, 26 Jan 2024 17:13:37 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b9af9e239d62.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 26 Jan 2024 17:13:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5v28oQ39IZVVjcaS1jiua2J7ujzY2/ATPUnBzFHxBntwVaOmIhd2zVwv5B3ZnNeHqaRLwi4uGbxa1IFugfq4F/B3OAYoj6sQ1NiVoGbApFovW09UsgN9Vt+bLifF8waqPBuVoe0DSk4GlPbWLwh0Cvh3gvKiEcApIPhIfGHEq/262vtY3H/1k/Y2KbBzazCZ4UU/XFgTHfFHqw1sOMCLzp+TBQtsbPgLFNe75RvVUOUhxNMXoovzzXuuxZxFxR5ua7TdipRRB16lSmjZ/KdYjlds2gDkbNuwmAhxb7q5x5QPwUBB1KSL6dw2qs7mD8l8x3/UxXpGm/3csFwkGbTPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=555HxS7C+SHWmCAhptRQkGx54lyU/Djtpasfv5ujkyA=;
 b=Pw7Buy6OQOzO8cV2WAGwJWl4/jW1NMQmJJgISTVMDtxzHgfxpa3rJZ3mX2nGJEhLwFuRaJ2umhDP4HVj4cE/IFXpvuM1INypvkkI7gahAf5VS1mu/id7Oa2WtodXPYnNJr1fR+slHsh2e9E3C9C8+A3MdCbvKopopQWi3BqQRp+aKOl4us4oMCzIe8AFIMEaJSIxl0yRtPYkc+QwTFTq/ZKFkEmI/Mc9LiQ1ZJ03lii4PqvjXvfuFb94FE3NIhIyuoJfxrgXD5EHw1PzB30NOJgrsyi20t9Ldd5mLuEWcxLvzxbPUp0PoS/U4DoAq7Ai04ksYP7ZQoKVPGnmV2aY3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=555HxS7C+SHWmCAhptRQkGx54lyU/Djtpasfv5ujkyA=;
 b=dZZlN8IZPdHg26ch0fvz9RUyL096xcUUbNASbT5VcGFBsYYBz7QVgKiAVxEUp6Aa6NJvjKFV5SyuKEShcIYEwI1BuyE+sbsGvl0oj5+5x9gvN0oNRlihJhBnNTtuZSnVG3OMjLOGPETvKuQULt/Rql9z7GfWQJehcwKWsM525jQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6363.eurprd08.prod.outlook.com (2603:10a6:10:257::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 17:13:33 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06%3]) with mapi id 15.20.7228.026; Fri, 26 Jan 2024
 17:13:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "jonathan@joggee.fr" <jonathan@joggee.fr>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 2/3] lib/oe/package: add LOCALE_EXTRA_PATHS
 to add extra locations for locales
Thread-Topic: [OE-core] [PATCH v3 2/3] lib/oe/package: add LOCALE_EXTRA_PATHS
 to add extra locations for locales
Thread-Index: AQHaPxgRl30O/q7owUm6qMnVFrB0/bDsd76A
Date: Fri, 26 Jan 2024 17:13:33 +0000
Message-ID: <C0719697-FF31-4FE8-A5A6-7F9BD56A96A3@arm.com>
References: <CY5ZELISRCAC.YYJ5RA7Q61I0@joggee.fr>
In-Reply-To: <CY5ZELISRCAC.YYJ5RA7Q61I0@joggee.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB6363:EE_|DB3PEPF00008859:EE_|GV1PR08MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: 05cecad4-0bde-4f02-1669-08dc1e9226b6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 uglnspVPW9kCHd/57hKHRAsLqijc45z23X8q/e6Fdn7PV4l75Nwl5nn27vLI0rdOW103tRmuYPGnmLNo2xRIcnC3U+vvzov+uAsh61nFbWveZ6xCEllVwfWwpx9m0Cc/F4EExGW2kbN60hPSj4zSb61eGvwKABN0EksuErCMeXoSe3sHypQNHturSsADAUaEu2rtOdicP+bAJC6sjkIzfVOty0gBNfWHBleXUAOq5EAQ35Rf/PdsX7AWPgUUngutOIK8bV9daNAVWv5bcUjeqBPd+QtRHI3YnDWAelOIUG61U+6Xv9euaC0/7Zg/RqlMBNke1bIMRjeCPk0J/i+LaTOltiTsavgjLnyOuyULfXvgK5jOHd13zP9xV0ZoJeQdE90m48WievQf6yce7P/rfRRg25jsA77TCJNFzNAPLExfKH8uVQ4G0tHSrDRYr0CWQV0AjF8AqGfp5s6oQwNL6FkZLgFgnYcqVzaWJYD5Cv/uTAFvsl0H7MKq4YsaFQJFF5vFLaO/6M9HkPltyzlhdydTpbVmz1a4YnO/XpkpgfN9F52qxuKsLVsZSZbrCVvC5OAlNrHoouUkOt1TAMOxq4KaiiizhS3Ky+S/toTaHQTMSOK34mNAwIFSaZ/L4xXq0RnOKHTClQx7IZjS81QhbQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(136003)(346002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(26005)(5660300002)(6506007)(71200400001)(122000001)(6512007)(53546011)(38100700002)(2616005)(86362001)(91956017)(478600001)(6486002)(4326008)(6916009)(76116006)(66946007)(316002)(66446008)(66556008)(66476007)(64756008)(8936002)(8676002)(36756003)(33656002)(38070700009)(41300700001)(2906002)(4744005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <85B1B89082FDF54FBAD84D19689DA9FA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6363
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a2a918a5-0333-424a-5a78-08dc1e92203d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	utIs9JWmTAffNsmE2vZDE6THlsMPIzJNWahC2u9tbAO+GFk/O4QnE8U8k5L8nfN5bt+unp7GhrHxSiqiqdzV2Ot5lna7unJlsrqFPki/Mw7Dgtus1h27LjaDP9y9HVugK8AgKuOhLV0ar4VdL4G/ISZefcaioC+kj7OgWkZP7l+kNxtRjAO3viF8jdHBmz4pwRSu6Hpw9bgdCdCnIC89+x3Ef3xCTvjfwVsVhTfmLlMtZ4MRdJozWn60eDxw4ni0di2p2aw2GrIzGjWriu/dQ8Gc3xP8VhDuLCiFHb4dn0RuRNpAnTU7jxqNCoyyN+qm9DLPR1IMCvZ2Zb1mpREvC7YANezN5u1QU5hZbFyyZnKFNJFOObMfGbEPiMbT3CCUUPPlrfztokCJtGVBQkuW8ORX3TZDtEDqCH3ljqPxMHP0yiEsexf4DR+cEgC1bj4SRmIhsAkB75E+PD92KJgtqG6pzA9Oh5Q7nbfclqqwx9kxYpl+xuiR4uTRQVl8j+PO/Jh3IcjL8rMuwxUuxiUw+f9CZ0EFOY9OmPDRYmdzF7eo4n6o0MnVxqniM0LLNBePIqnpNnpypQm/T5ksgqBzwtn+jFmoy2VZBm604ieTh6r8LsUyPEab39RmSEzkrS6v4T1aGj+YTIWS2bM9+mFW1ophlar0246HoTJ1zTkfQQS6ZXVqIPcFsD+PqMXa4Ppf8UlZjMAMU5pKDnl5xTDLSQLloRgJJQfD4okk2ZjnzxiriQ4c5GmehcwTOz4wJX9E
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(64100799003)(451199024)(1800799012)(82310400011)(186009)(40470700004)(36840700001)(46966006)(82740400003)(4744005)(356005)(81166007)(2906002)(36860700001)(5660300002)(41300700001)(36756003)(33656002)(26005)(6486002)(336012)(478600001)(53546011)(6512007)(6506007)(2616005)(4326008)(6862004)(8676002)(47076005)(8936002)(70206006)(70586007)(86362001)(316002)(40460700003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 17:13:44.3293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05cecad4-0bde-4f02-1669-08dc1e9226b6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8240
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 17:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194398

SSBsaWtlIHRoZSBpZGVhIG9mIHRoaXMgcGF0Y2ggKGhhcmRjb2RpbmcgYmVoYXZpb3VyIGlzIGJh
ZCksIGJ1dCBJIHRoaW5rIGl0IGNvdWxkIGJlIGdlbmVyYWxpc2VkIHNvbWUgbW9yZS4NCg0KPiBP
biA2IERlYyAyMDIzLCBhdCAxNjowMywgSm9uYXRoYW4gR1VJTExPVCB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8am9uYXRoYW49am9nZ2VlLmZyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiAtICAgIGxvY2FsZWRpciA9IG9zLnBhdGguam9pbihkdmFyICsgZGF0YWRpciwgJ2xv
Y2FsZScpDQo+ICsgICAgbG9jYWxlZGlycyA9IFtvcy5wYXRoLmpvaW4oZHZhciArIGRhdGFkaXIs
ICdsb2NhbGUnKV0NCj4gDQo+IC0gICAgaWYgbm90IGNwYXRoLmlzZGlyKGxvY2FsZWRpcik6DQo+
ICsgICAgZm9yIGxvY2FsZWRpciBpbiAoZC5nZXRWYXIoJ0xPQ0FMRV9FWFRSQV9QQVRIUycpIG9y
ICIiKS5zcGxpdCgpOg0KPiArICAgICAgICBsb2NhbGVkaXJzLmFwcGVuZChkdmFyICsgbG9jYWxl
ZGlyKQ0KDQpJbnN0ZWFkIG9mIGhhcmRjb2RpbmcgJHtkYXRhZGlyfS9sb2NhbGUgYW5kIHRoZW4g
d29ya2luZyBvbiBMT0NBTEVfRVhUUkFfUEFUSFMsIGhvdyBhYm91dCBhZGRpbmcgYSBuZXcgdmFy
aWFibGUgKExPQ0FMRV9QQVRIUz8pIHdoaWNoIGlzIHNldCB0byAke2RhdGFkaXJ9L2xvY2FsZSBi
eSBkZWZhdWx0LCBhbmQgdGhlIHBvcHVsYXRpb24gY29kZSBqdXN0IHdvcmtzIG9uIHRoYXQuICBU
aGUgY3VwcyByZWNpcGUgY2FuIHRoZW4gTE9DQUxFX1BBVEhTICs9ICIke2RhdGFkaXJ9L2N1cHMv
dGVtcGxhdGVzL+KAnCB0byBhZGQgaW4gaXRzIG93biBmaWxlcy4NCg0KQ2hlZXJzDQpSb3NzDQoN
Cg==

