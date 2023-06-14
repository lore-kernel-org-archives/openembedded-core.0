Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D01EEB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 15:03:16 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.62])
 by mx.groups.io with SMTP id smtpd.web11.14866.1686754994447311490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 08:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=vuhCJLaJ;
 spf=pass (domain: arm.com, ip: 40.107.249.62, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R//g4a+g2sihsWmZy2Va+rbwt2UpiPbYlYMKYdMCQ8A=;
 b=vuhCJLaJKxMdskJcvVpfB3WCtjQ01Irh1LkTJoNIZBrdvYilVG9trxrUrVWaD6CwJ0TewZKo4zPXhpu7/On8mnbRHRUs2nGY+BliP0pEsH8SCSCtczipBeSrN5vekK03AGAMS+rEduzX3ByHdjvO2SNQbN3VRcgXQ5QbqIa+3cI=
Received: from AS9PR06CA0648.eurprd06.prod.outlook.com (2603:10a6:20b:46f::16)
 by GV1PR08MB7985.eurprd08.prod.outlook.com (2603:10a6:150:9f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Wed, 14 Jun
 2023 15:03:07 +0000
Received: from AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46f:cafe::3e) by AS9PR06CA0648.outlook.office365.com
 (2603:10a6:20b:46f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.36 via Frontend
 Transport; Wed, 14 Jun 2023 15:03:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT022.mail.protection.outlook.com (100.127.140.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.25 via Frontend Transport; Wed, 14 Jun 2023 15:03:06 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136"); Wed, 14 Jun 2023 15:03:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5bc822672b3be90d
X-CR-MTA-TID: 64aa7808
Received: from 724c80ea88c1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 36974AD3-F51B-4F98-BEB6-27BD5C6DD9C7.1;
	Wed, 14 Jun 2023 15:02:59 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 724c80ea88c1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 14 Jun 2023 15:02:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GIIALqWB/s0wMq7kEokKPPciecpsw7p35GOpkDEwQ0BHt8lNiwSIRwuT46deTNrZkCJ9OPLYKVm9xXpfa1Qjg2/k4/P0TBqlFSMOQOmQp00u6iJBtJ9oGC/QOxCiCHMSZ6FAwx+qZ2sy10BdMv15bGoAbKKFqlKB5jFi6JOY2XC36ublA7xuc1fMj3c2Cf/EjyclgDNaToOx4iNrt/XUSE+uL7Kydi8F08RU6B5lnEzMctqTNSgBb5rPH2UtiixMylws6wNE37fveY0q3L7OCoJPgFrijkpO7sx0I1H+97hLXYiiud73ctaJLntGVW2cGT+FmiXJh4tVaTAJKuz1JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R//g4a+g2sihsWmZy2Va+rbwt2UpiPbYlYMKYdMCQ8A=;
 b=iZrNu1kXXP1LgBe7yXoyjskZIBHKbZP6tR/L6fDTJaq+AQm+uNsIoByEXHoJyoymXIFiQfPiinQZwNrNZgTw+mTB1Pyi0DCzLN9cCjeWzYU2aXsp0xissotHqiqmrC1QqayOJoX8kGc+Vs1Ko7+x8uimTsIp/UnfA1YxJt8HUFCgHD8tthFVZABFujyTHWRhMVStEqV7jcnbYUGDpzIPruZZ8zH1KMK0aa7aRLLuGGOEbLLPy3dLNk9uCWiYcU30gavy8wMfAe5xC1JrRaDVXkOx+rlzI7GW15jIBh2qOvll/Atq8KKfwk4jtt0oN9ndk+szJQkdWaYbRoBUxchbtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R//g4a+g2sihsWmZy2Va+rbwt2UpiPbYlYMKYdMCQ8A=;
 b=vuhCJLaJKxMdskJcvVpfB3WCtjQ01Irh1LkTJoNIZBrdvYilVG9trxrUrVWaD6CwJ0TewZKo4zPXhpu7/On8mnbRHRUs2nGY+BliP0pEsH8SCSCtczipBeSrN5vekK03AGAMS+rEduzX3ByHdjvO2SNQbN3VRcgXQ5QbqIa+3cI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6457.eurprd08.prod.outlook.com (2603:10a6:10:23e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 15:02:55 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.045; Wed, 14 Jun 2023
 15:02:55 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Alexander Kanavin <alex.kanavin@gmail.com>, OE-core
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 01/55] insane.bbclass: add a SUMMARY/HOMEPAGE
 check (oe-core recipes only)
Thread-Topic: [OE-core] [PATCH 01/55] insane.bbclass: add a SUMMARY/HOMEPAGE
 check (oe-core recipes only)
Thread-Index: AQHZnqK+/9gsQSzndEWtk2Y6K2jGWq+KKsyAgAA6egA=
Date: Wed, 14 Jun 2023 15:02:55 +0000
Message-ID: <91A46C4B-8915-4700-A32C-3918A5B823B0@arm.com>
References: <20230614092918.4065570-1-alex@linutronix.de>
 <e11a1b213cb0a90b5d4cba87c7214369be182bae.camel@linuxfoundation.org>
In-Reply-To: 
 <e11a1b213cb0a90b5d4cba87c7214369be182bae.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB6457:EE_|AM7EUR03FT022:EE_|GV1PR08MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eb28f59-6f93-4ac5-3cfd-08db6ce875d2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 wY0tqjahm3vq3AiFTQxPCwmhmou56u27UIS0C1/bdZoBneRgHGVe++wqBbx6No73XgENUH58RgNV1nrcmcH0lW8dW6xNMfin6ttm+COnwESGw050inBxYpo/oMYa8Gdb5O9aQMSSDu7AEWgPD4d+KXyUP0OBfM3hKXKieSo6DHun4d+QoW6WqQDqXU8/PfsE0jRTgDHFD+ovJ432E6A6sJLPu2LuHGs2ETAAT2G4SmNAprg3wPcmFMHkgmnhF4SzAKOZGfmkVnGksd16C4+nuzTeABR8Q6E5v79i+TlCRERul1fTyXdgs0/vjWAEMvPJk4Y7h2Vql2bWyAEnzYQWjKgHe3yLeGJADt9nlvyaZQ4MZmqeOW5NtmE9lp6fIzqn+6SpNyvr0fHD0hjok3NB8BQpPOEJQckn5RqN9SqjEVDjSL8Soo6iE7+x+cyAL/+f/jXriVgWFyyfu4eel/cbTG85xIwyitDXzbcvYAzCaVwD1HQ3mb6AEBfHVGiB5ngVvaAgmuR5jZhczUNMNYCL7SbKQXjlw6CIbH55pT1XV6X2lfvGTVwYit1rj/zO5cuB76IFoYB9J4+/FOc0YytP99pYR1MRb0FqQptkPOOEHQ1Q09y43TIuWNCq+BmuBe7Qxzq94ydX5Bf9SKYmmHidHw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199021)(54906003)(122000001)(91956017)(478600001)(71200400001)(8936002)(41300700001)(8676002)(4326008)(66476007)(76116006)(66946007)(6916009)(66446008)(64756008)(66556008)(316002)(38100700002)(2616005)(5660300002)(186003)(6486002)(6506007)(26005)(53546011)(6512007)(86362001)(33656002)(4744005)(2906002)(38070700005)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E04A0EABB14C034FB54AB50144BCC0D6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6457
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ac2c06ed-b445-43f9-66e4-08db6ce86eec
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	evoA8X/RU6GX2SPJu/zOVTq/gbk4MhOs3ZsM7okrJLcqq5EcDVLS7hz9LgNiTY4ymXeHjxoHAR72/VSBHdD69Kl6DSReuRUwF4CsrRMryfa8N1FvnnsQc2s3Mgkae9hYHMjGSTOrvLnDn20b/iHfaUmq23g5qByCiKo2e4qTGCTlAHV301Uf/PwfUBNfO3miNS3vxZM85kHexbqY2tyrxYqN02yV7rNcuoWl23RA3TYIgsWGvxDyASL39dVhGgmMNonwovXFWUaxUVd7VG15mYUVc6Fgu2UaSMudbGcZY/YqW3fs5Q6+b1fbsIxeAMgVg83FgQV0EvURgVVkDVGEJ7j/lFWxIXH668l2gNouFCBk1m3d+p8BrngGBXa6byGHJIPmIfBsz508WSqGcCK9eTqTTGTcuP8EMOsd0YyyWemUR2koZd0hnisd40aZhjG+XY1Fa7jZGTmCU5fmRbee/vZTJla3i5WK3g3dGYj/IjaRWemwG6QQUOiiuut7Oam/DSCbPiF0YHG47VaxfNc8deHbmqtHY9j7o2uMuE5hqlzzYhJbxmOTT+nvl7x1ChKivmDaDMSUW/YjtrAcEy2axvgcnaaL7VHiWJzjBACTXZ7Xvy5cdG54CeZoNLjj0cpIhMCCN4/7fmN7rNtl4x5h0obInZCZ+zCID0LaRLicELhAsVw8R5/lgFQGxBANznge2/YttsG+CNfPAqKB+BAivt2szTCglGhmuknqqBVesMw=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(5660300002)(6862004)(4744005)(8936002)(2906002)(8676002)(70586007)(70206006)(54906003)(41300700001)(6486002)(4326008)(107886003)(26005)(6512007)(6506007)(316002)(186003)(336012)(36860700001)(356005)(82740400003)(47076005)(2616005)(40460700003)(478600001)(33656002)(40480700001)(86362001)(36756003)(82310400005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 15:03:06.7357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb28f59-6f93-4ac5-3cfd-08db6ce875d2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7985
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 15:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182814

T24gMTQgSnVuIDIwMjMsIGF0IDEyOjMzLCBSaWNoYXJkIFB1cmRpZSB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8cmljaGFyZC5wdXJkaWU9bGludXhmb3VuZGF0aW9uLm9yZ0BsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gR2l2ZW4gYWxsIHRoaXMsIGRvIHdlIHdhbnQgdG8gY29u
c2lkZXIgYSBuZXcgdGFzayB3aGljaCBjb3ZlcnMgdGhlc2UNCj4ga2luZHMgb2YgdGVzdHM/IEEg
bmV3IHRhc2sgZG9lcyBoYXZlIGNlcnRhaW4gb3ZlcmhlYWQgYnV0IEknbSBzdGFydGluZw0KPiB0
byB0aGluayB3ZSBtaWdodCBuZWVkIHRvIGRvIHRoYXQuIE9mIGNvdXJzZSB0aGVyZSBpcyB0aGVu
IGEgZGlsbGVtYQ0KPiBhYm91dCB3aGljaCB0YXNrIGl0IHdvdWxkIG5lZWQgdG8gcnVuIGJlZm9y
ZS4NCg0KSSBhZ3JlZTogc29tZXdoZXJlIGxvc3QgaW4gbXkgcGlsZSBvZiBicmFuY2hlcyBpcyBh
IGhhbGYtY29tcGxldGVkIGltcGxlbWVudGF0aW9uIG9mIGEgcmVjaXBlLXNjb3BlIFFBIGNoZWNr
IHRvIGNvbGxlY3QgdG9nZXRoZXIgdGhlc2UgY2hlY2tzIHdoaWNoIGNhbiBiZSByYW4gZnJvbSBq
dXN0IHRoZSBtZXRhZGF0YSBhbmQgZG9u4oCZdCBkZXBlbmQgb24gdGhlIHJlc3VsdHMgb2YgZG9f
cGFja2FnZS4NCg0KUm9zcw==

