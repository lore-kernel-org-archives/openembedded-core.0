Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A767DC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 12:43:07 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.88])
 by mx.groups.io with SMTP id smtpd.web11.5765.1650976981112286662
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 05:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=gvcfKkSz;
 spf=pass (domain: arm.com, ip: 40.107.1.88, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ry0/6QAwgYf3wknK86Og2IVn4QgX3D0qqstzZj9wroM=;
 b=gvcfKkSz4u0jWyozVaabkEmUwozV8q/XvZySoX7rfFTFfJmMkcaW1j8Q9zpMzgyr/7Y20Kv8PzAJ5e3EzXGd6arCe5HfbRnLn3Kq/xcpE03eZSOnbgMgsjH2b585/XUBpvwIjc3zlVpbiPClaBmeI0CYedHZ4tkoojpRFKAlLLI=
Received: from DU2PR04CA0007.eurprd04.prod.outlook.com (2603:10a6:10:3b::12)
 by DBBPR08MB5977.eurprd08.prod.outlook.com (2603:10a6:10:209::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 12:42:57 +0000
Received: from DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::df) by DU2PR04CA0007.outlook.office365.com
 (2603:10a6:10:3b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21 via Frontend
 Transport; Tue, 26 Apr 2022 12:42:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT014.mail.protection.outlook.com (10.152.20.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Tue, 26 Apr 2022 12:42:57 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Tue, 26 Apr 2022 12:42:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3195b65ddab21da2
X-CR-MTA-TID: 64aa7808
Received: from e558db764323.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 60D963C8-A6E1-449B-9E41-E5A9ABD5A624.1;
	Tue, 26 Apr 2022 12:42:50 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 e558db764323.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 26 Apr 2022 12:42:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDvyP9qgMLBslbFXBbs7JlnpsLzIW0RN/8LqTH7nwiI3NT3G4MWfk9y5nfXs3SAiXsNn0UNiy5uwof7NEiifWwwHAfaeHbCLXTo23ECF4apDvYNOZYhe0oEep8mW1IDMlmH0JSEjSzYPvenX2z1WpGvEv8QYZtXJeQCrun2pk6C7GKpoRIqDmIVwQks5ExQhilCRci22A+wDb3JYsLJRYAeHjyVop7S17+m0SS4KB3eK6Q6yc7iqOF23Cn9rquoHcfmCUunkbyO6gR56p5JP8+evH+CHIgZJ9mw09SKLPzL8dHa6QJm80zFDJcUnmgXtxDRoIXOmddNuK5g/Z5rxyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ry0/6QAwgYf3wknK86Og2IVn4QgX3D0qqstzZj9wroM=;
 b=IucBmRS9S2MWfgSm5VxxuAhWyjF7vO0AFK8Rq0IUNM0gFkaqeOmrZhyHPD/xG85hGCwjYykQ6dMKTfYGLEUSMKhUVQkGe1u8Q2rQmGDoxf/jldK37C6DvZZS+X+7Qy5q1TJwdxoDezkLRiCfhQfIrTmAuSzblEbRfWUKcEt6ijtRZ6UedXkxzGWdylphcmdshrx8E43FouD+OFo+KGOUD9afrhLwCoz2owuGuNwEpM0FZOitFMUjdUM4MwuqS46m5C2vFa2/TpMLyIdwO7y9yDPxjSj9YcIX2i17et3TI4hIjwzfZQ0FQJxMy7qvw+DivJ5zVCktw8YRf8/SKzpo9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ry0/6QAwgYf3wknK86Og2IVn4QgX3D0qqstzZj9wroM=;
 b=gvcfKkSz4u0jWyozVaabkEmUwozV8q/XvZySoX7rfFTFfJmMkcaW1j8Q9zpMzgyr/7Y20Kv8PzAJ5e3EzXGd6arCe5HfbRnLn3Kq/xcpE03eZSOnbgMgsjH2b585/XUBpvwIjc3zlVpbiPClaBmeI0CYedHZ4tkoojpRFKAlLLI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB6401.eurprd08.prod.outlook.com (2603:10a6:20b:361::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 26 Apr
 2022 12:42:49 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::8af:d35b:6628:5013]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::8af:d35b:6628:5013%5]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 12:42:49 +0000
From: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH] bitbake.conf: mark all directories as safe
 for git to read
Thread-Topic: [OE-core] [RFC PATCH] bitbake.conf: mark all directories as safe
 for git to read
Thread-Index: AQHYWWY80UI+7i+Xf0eiLFXQVQqtT60CI3gA
Date: Tue, 26 Apr 2022 12:42:49 +0000
Message-ID: <C719A8E0-A570-4745-9FDF-F2B4B055405C@arm.com>
References: <20220426120720.969039-1-ross.burton@arm.com>
In-Reply-To: <20220426120720.969039-1-ross.burton@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 39a5aeab-d16c-45de-8778-08da27824a79
x-ms-traffictypediagnostic: 
	AM8PR08MB6401:EE_|DB5EUR03FT014:EE_|DBBPR08MB5977:EE_
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB59776C80427F57C39303082EE8FB9@DBBPR08MB5977.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 UkaARvsIDLkkmZCaiXpLhMys1JgEQeg55z9+odoyb3orCtmkPszivsmothV5mu5VwZR/VjXQHzuDV/glrOUagr0p/7zzc0MG/cC0J2js4RCgv1B1WGeS/cp9O3FQ23sYxJuOiaHGZXndgA/iRaIvrhw9T0THeUR4CVRfxrIDlKnKbCX8DLokNtsUHW+djDp63ZA2syNSWFipz8vz++m5mR0+/ZS6i0RLxyiXT06UpVUFTQX1jk8B9HOW4CQf3QE0gDEzDC6tRHZiQ+WGqiEHnbn1z3nUW0hIksTbh0XfVds14NQ2uGF3bUGS1fr2/kEInYrESazBT1hXKsvOMYa8VEW0kA2SiJyarkmu6BSDtnqy4Ok894LbObE+9td1Xj1PEZZuNbmxHkE9YYOwf5ik1FsD/etyDEfD0brD+Dquf2HhyRhh7+ZEa9rcZXJKsmWFgSn04veVkgxvjt09M1mFowced3HsmJE0PHAOchFDz4/zRf5FpORV6qfAHiIlCFd9RLaZ2GKK+AcjfY4+ldqkX+3Vy68ky34I/3a/KfgwNV4ADgVfT0xosCEoAP0xZsRKnTWodUp5bKJ4S3oQKthpmx3CPweHT5dN8Yf5lTgLWcYFKUsdCapomXjPbxNQ4cozr2ulHY7M4q6WPbce7XPHENVqug4cZqUp1LsRB+Qxt1xUf3tC0E4pdyTKrS8W/6LxuPRy+Ff3ftgsTPwi0zFGeQ/DGJLvenQxgwNU4EgXJ/6o5dCWm4FdwpLywmbQzkanXIuWL0eFTRF19+4mxmbbxOkIi7352pFAgatm7X+MXuGR9MBAZDjH0+DSb76ZnQuj
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(91956017)(66476007)(76116006)(64756008)(66446008)(66556008)(71200400001)(5660300002)(66946007)(4326008)(186003)(83380400001)(38070700005)(38100700002)(8936002)(109986005)(316002)(6486002)(966005)(36756003)(2616005)(2906002)(508600001)(26005)(8676002)(33656002)(6512007)(122000001)(6506007)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E90EF4D1ED7EE747BAE855DF7FD207D0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6401
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8305e406-6707-4f80-6b4a-08da27824594
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hSJUcmXHuYfNAyOBHFXckU3iGXK4qpdpl4qgsoP0FetHFx2CdTZIu0I3oPdjw1r1YoXCIahwechlHq1Xfh5s+8wsOKGMCaed7ICM/uf9TFJJm/RZ+bpJos4JDxVwkFBt5+kbsEcWJtKD/fJy4vq8NC0iUrT1jMe9oqcSrRNIzBq5JHydHKF3ZLr2rvu2TpSvisXGpbDAvomYxt5BtjR7AAl90OLF4xpGYK3TRGBE+YX2+2jjm2ZpVr5bEtizPZbK6XmkzTx1THJ4avEAaWaaJQpyXmYNaPmlX6xlxgpLz+4mMihulDYhvcJTUlo+3RYnJXJOGjZlCxyiOxBPhdkNZjWG4/Zjx7Jy5qDHtagcXkc3wd+yJ6RKlsLfzfH22t6RVNF5Z+W6dAJiZ8XIUtAEJH2Bkox/1TYgmP5dTXhYx5frmXyXknTgTfo+b6AgXs/AtrkzxSa0ybxhj4NNV4wIjrd804fm+qRzLzN8RADn4WMfh5aMZukoKD6TmyiEvTkyDLOJ/k+1+vfuZHIZv3RHrH2g9Sd7xhNuAEh/sjWMdaKAzJ9w4c6MqIgf5ZpilwmNsy9u+J37GolWXhL3KT+qOmc+6vYMboSbe9oyafg+/2bspjBbk/YJ3JwQ6nzMz4awLraIoDGqgaX9jcB1WewANUhmfnsZOSrRf5meJ7s7dE4MbWcD7hOXzIv0xGYSLj54PIUdSXz7bzkzy7+Rq0qKSjBK5qMIYOuQ0+hNE/fMRkQZ7zcf7xLjVWZn3+QKK3tKFVQCqx1gnjGKWIpQ1QpGbQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(2616005)(4326008)(8676002)(186003)(36756003)(336012)(47076005)(81166007)(316002)(86362001)(36860700001)(8936002)(5660300002)(82310400005)(26005)(40460700003)(6512007)(70586007)(70206006)(966005)(83380400001)(33656002)(6486002)(508600001)(6506007)(53546011)(109986005)(2906002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 12:42:57.4900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 39a5aeab-d16c-45de-8778-08da27824a79
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5977
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 12:43:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164871

SSBwcm9wb3NlIHdlIG1lcmdlIHRoaXMgZml4IGFuZCByZXZlcnQgdGhlIGdpdCBpbnRlcmNlcHQg
Y2hhbmdlcyB0aGF0IGFyZSBjdXJyZW50IGluIG1hc3Rlci9tYXN0ZXItbmV4dC4NCg0KV2hpbHN0
IGEgZ2xvYmFsIGV4cG9ydCBpcyBxdWl0ZSBhIGJydXRlIGZvcmNlIHNvbHV0aW9uLCBpdOKAmXMg
YWxzbyBzdXJnaWNhbGx5IHByZWNpc2UgaW4gd2hhdCBpdCBkb2VzLiAgSW1wcm92ZW1lbnRzIHRv
IGhvdyBnaXQgd29ya3MgaW4gZGV2c2hlbGwgYW5kIG90aGVyIGNvbnRleHQgY2FuIGJlIGRvbmUg
YWZ0ZXIgcmVsZWFzZSwgbm90IHdoZW4gd2XigJlyZSB0cnlpbmcgdG8gZ2V0IGEgcmVsZWFzZSBv
dXQgb2YgdGhlIGRvb3IuDQoNClJvc3MNCg0KPiBPbiAyNiBBcHIgMjAyMiwgYXQgMTM6MDcsIFJv
c3MgQnVydG9uIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxyb3NzLmJ1cnRvbj1hcm0uY29t
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPg0KPiBSZWNlbnQgZ2l0IHJlbGVhc2Vz
IGNvbnRhaW5pbmcgWzFdIGhhdmUgYW4gb3duZXJzaGlwIGNoZWNrIHdoZW4gb3BlbmluZw0KPiBy
ZXBvc2l0b3JpZXMsIGFuZCByZWZ1c2UgdG8gb3BlbiBhIHJlcG9zaXRvcnkgaWYgaXQgaXMgb3du
ZWQgYnkgYQ0KPiBkaWZmZXJlbnQgdXNlci4NCj4NCj4gVGhpcyBicmVha3MgYW55IHVzZSBvZiBn
aXQgaW4gZG9faW5zdGFsbCwgYXMgdGhhdCBpcyBleGVjdXRlZCBieSB0aGUNCj4gKGZha2UpIHJv
b3QgdXNlci4gV2hpbHN0IG5vdCBjb21tb24sIHRoaXMgZG9lcyBoYXBwZW4uDQo+DQo+IFNldHRp
bmcgdGhlIGdpdCBjb25maWd1cmF0aW9uIHNhZmUuZGlyZWN0b3JpZXM9KiBkaXNhYmxlcyB0aGlz
IGNoZWNrLCBzbw0KPiB0aGF0IGdpdCBpcyB1c2FibGUgaW4gZmFrZXJvb3QgdGFza3MuICBUaGlz
IGNhbiBiZSBzZXQgZ2xvYmFsbHkgdmlhIHRoZQ0KPiBpbnRlcm5hbCBlbnZpcm9ubWVudCB2YXJp
YWJsZSBHSVRfQ09ORklHX1BBUkFNRVRFUlMsIHdlIGNhbid0IHVzZQ0KPiBHSVRfQ09ORklHXypf
S0VZL1ZBTFVFIGFzIHRoYXQgaXNuJ3QgcHJlc2VudCBpbiBhbGwgdGhlIHJlbGVhc2VzIHdoaWNo
DQo+IGhhdmUgdGhlIG93bmVyc2hpcCBjaGVjay4NCj4NCj4gV2UgYWxyZWFkeSBzZXQgR0lUX0NF
SUxJTkdfRElSRUNUT1JJRVMgdG8gZW5zdXJlIHRoYXQgZ2l0IGRvZXNuJ3QNCj4gcmVjdXJzZSB1
cCBvdXQgb2YgdGhlIHdvcmsgZGlyZWN0b3J5LCBzbyB0aGlzIGlzbid0IGEgc2VjdXJpdHkgaXNz
dWUuDQo+DQo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vZ2l0L2dpdC9jb21taXQvODk1OTU1NWNl
ZTdlYzA0NTk1OGY5YjZkZDYyZTU0MWFmZmI3ZTdkOQ0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBSb3Nz
IEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4NCj4gLS0tDQo+IG1ldGEvY29uZi9iaXRiYWtl
LmNvbmYgfCA4ICsrKysrKysrDQo+IDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykNCj4N
Cj4gZGlmZiAtLWdpdCBhL21ldGEvY29uZi9iaXRiYWtlLmNvbmYgYi9tZXRhL2NvbmYvYml0YmFr
ZS5jb25mDQo+IGluZGV4IDBlOTM5YWNhNGYuLjFkZWJhOGQ5MTAgMTAwNjQ0DQo+IC0tLSBhL21l
dGEvY29uZi9iaXRiYWtlLmNvbmYNCj4gKysrIGIvbWV0YS9jb25mL2JpdGJha2UuY29uZg0KPiBA
QCAtNzc2LDEwICs3NzYsMTggQEAgZXhwb3J0IFBLR19DT05GSUdfRElTQUJMRV9VTklOU1RBTExF
RCA9ICJ5ZXMiDQo+IGV4cG9ydCBQS0dfQ09ORklHX1NZU1RFTV9MSUJSQVJZX1BBVEggPSAiJHti
YXNlX2xpYmRpcn06JHtsaWJkaXJ9Ig0KPiBleHBvcnQgUEtHX0NPTkZJR19TWVNURU1fSU5DTFVE
RV9QQVRIID0gIiR7aW5jbHVkZWRpcn0iDQo+DQo+ICsjIEdpdCBjb25maWd1cmF0aW9uDQo+ICsN
Cj4gIyBEb24ndCBhbGxvdyBnaXQgdG8gY2hkaXIgdXAgcGFzdCBXT1JLRElSIHNvIHRoYXQgaXQg
ZG9lc24ndCBkZXRlY3QgdGhlIE9FDQo+ICMgcmVwb3NpdG9yeSB3aGVuIGJ1aWxkaW5nIGEgcmVj
aXBlDQo+IGV4cG9ydCBHSVRfQ0VJTElOR19ESVJFQ1RPUklFUyA9ICIke1dPUktESVJ9Ig0KPg0K
PiArIyBUcmVhdCBhbGwgZGlyZWN0b3JpZXMgYXJlIHNhZmUsIGFzIGR1cmluZyBmYWtlcm9vdCB0
YXNrcyBnaXQgd2lsbCBydW4gYXMNCj4gKyMgcm9vdCBzbyByZWNlbnQgZ2l0IHJlbGVhc2VzIChl
ZyAyLjMwLjMpIHdpbGwgcmVmdXNlIHRvIHdvcmsgb24gcmVwb3NpdG9yaWVzLiBTZWUNCj4gKyMg
aHR0cHM6Ly9naXRodWIuY29tL2dpdC9naXQvY29tbWl0Lzg5NTk1NTVjZWU3ZWMwNDU5NThmOWI2
ZGQ2MmU1NDFhZmZiN2U3ZDkgZm9yDQo+ICsjIGZ1cnRoZXIgZGV0YWlscy4NCj4gK2V4cG9ydCBH
SVRfQ09ORklHX1BBUkFNRVRFUlM9IidzYWZlLmRpcmVjdG9yeT0qJyINCj4gKw0KPiAjIyMNCj4g
IyMjIENvbmZpZyBmaWxlIHByb2Nlc3NpbmcNCj4gIyMjDQo+IC0tDQo+IDIuMjUuMQ0KPg0KPg0K
PiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3Nh
Z2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMxNjQ4NjgpOiBo
dHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdl
LzE2NDg2OA0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9tdC85MDcwNjE4OC82ODc1ODg4DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStv
d25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBbcm9zcy5idXJ0b25A
YXJtLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4NCg0KSU1QT1JUQU5UIE5PVElD
RTogVGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUgY29u
ZmlkZW50aWFsIGFuZCBtYXkgYWxzbyBiZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUg
aW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkg
YW5kIGRvIG5vdCBkaXNjbG9zZSB0aGUgY29udGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwgdXNl
IGl0IGZvciBhbnkgcHVycG9zZSwgb3Igc3RvcmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24gaW4g
YW55IG1lZGl1bS4gVGhhbmsgeW91Lg0K

