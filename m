Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 265A3C05027
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 16:19:41 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.89])
 by mx.groups.io with SMTP id smtpd.web10.17298.1676909973600424358
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 08:19:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=chn8wKoA;
 spf=pass (domain: arm.com, ip: 40.107.247.89, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyKZKpQmHnWSeomYPyHoqH3JNXfLvTc9V/mKIYQmq4Y=;
 b=chn8wKoAoV1PkPge9KBKIFYoJO8Qo1CEJMBahau97wY1cI+B121ZKnrP5tw9TdpJhtVP8pyhPrFlNSTeIecioIwoe5Ngi7LgzzG9VboWxzBphCxwXaGcNOl4rMRHoCQcBKt8W9TCf/kwjpwIOqVBxiVIze1NAS2nsxyyQ5eAtgc=
Received: from DB7PR05CA0025.eurprd05.prod.outlook.com (2603:10a6:10:36::38)
 by PAWPR08MB9055.eurprd08.prod.outlook.com (2603:10a6:102:343::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Mon, 20 Feb
 2023 16:19:29 +0000
Received: from DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::a6) by DB7PR05CA0025.outlook.office365.com
 (2603:10a6:10:36::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20 via Frontend
 Transport; Mon, 20 Feb 2023 16:19:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT028.mail.protection.outlook.com (100.127.142.236) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.20 via Frontend Transport; Mon, 20 Feb 2023 16:19:29 +0000
Received: ("Tessian outbound 3ad958cd7492:v132"); Mon, 20 Feb 2023 16:19:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1b7b8b8644c6e538
X-CR-MTA-TID: 64aa7808
Received: from 6f3b14ece1a0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0428ED4A-05A2-4CDD-8C8E-20B0C3216411.1;
	Mon, 20 Feb 2023 16:19:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6f3b14ece1a0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 20 Feb 2023 16:19:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFzsHjEc3e2+Hc9XTeAK8ILJRzBL5pLVJaiZ4kzImR8TPyN5qnVSkerJblVSOH5ZEWvlvoAeEPB2Lou/Kns28ZKIIhpoQSI6QwLEq9Fguwfvpi/AYiqLNdU32P7LmOajpqhpKWPIkJX4SdUC4RjZFrh6Udr7T5sFHaOO6PzGJd0Avd6ryha0f2pnyLdtZ1tqi973MwpqaQ/jhkssP4ePNMGG3hgq4ZVO9nsfIt0qT+mZhWEz0xPnMV1GZEQ2GDOhApC1ojR4Zynp3wuYnaDv5f9cICHSKTlG6EytBeCQ0x8Pc6UjzezysOGuTbjYrRuLKV+DKgPbqStr9VU1uV21VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyKZKpQmHnWSeomYPyHoqH3JNXfLvTc9V/mKIYQmq4Y=;
 b=DXUsFKFiusNKoA1HKLbn1ZsyXIG779Z8DI4WOHi0xQdh1gGxXZfLdwk0rZynmrDepXACIjbLGaGXZMw7dLeZzGfKfc9Ln60JtASsagGKKV5230C0YkQNyGKC83CkNEQHx6BxCuoYQ6dnJwNh8Cy1z4VxrluDQAxYaWx8dnerTiTmvmWhlvUmAm/sxqgEfUA14txiB24WpQOdXF+BJFsIBMJQG0uO9JjLhVez5ukKczKP78183fthta7hGpZh1IcTplqSvJYscOXOGAnw7hbKLILXbUxHpqeAHSq87U0nGzH/B5UVvpP45Yd8wQx7HUoykNPeoiZywaehF73JtJzNiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyKZKpQmHnWSeomYPyHoqH3JNXfLvTc9V/mKIYQmq4Y=;
 b=chn8wKoAoV1PkPge9KBKIFYoJO8Qo1CEJMBahau97wY1cI+B121ZKnrP5tw9TdpJhtVP8pyhPrFlNSTeIecioIwoe5Ngi7LgzzG9VboWxzBphCxwXaGcNOl4rMRHoCQcBKt8W9TCf/kwjpwIOqVBxiVIze1NAS2nsxyyQ5eAtgc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB5PR08MB10094.eurprd08.prod.outlook.com (2603:10a6:10:4a2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 16:19:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 16:19:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "steve@sakoman.com" <steve@sakoman.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 19 Feb
 2023 04:05:17 AM HST
Thread-Topic: [yocto-security] OE-core CVE metrics for master on Sun 19 Feb
 2023 04:05:17 AM HST
Thread-Index: AQHZRGvLcP/O4+wiWUqtDzf+6y5gGa7YBUeA
Date: Mon, 20 Feb 2023 16:19:18 +0000
Message-ID: <608FB704-D8AA-49AF-9CFD-71DA102E46EA@arm.com>
References: <20230219140918.711D49602F3@nuc.router0800d9.com>
In-Reply-To: <20230219140918.711D49602F3@nuc.router0800d9.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB5PR08MB10094:EE_|DBAEUR03FT028:EE_|PAWPR08MB9055:EE_
X-MS-Office365-Filtering-Correlation-Id: a176ddfe-f3d1-4432-77e5-08db135e3e5e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 1/PMvLVpCt/k0IKfI7xMUpUjS9nHS/aMMNelcApSCp7MP/+sYKUI/EieDUyqPzcX/2BHzy4smVN6aDopb1SnZ8qMTRjTTKMEP2ZInxrm/kH1lApPnbahz5nK0D3+C64Fy1y/Z1lnf9oHkJL+adoLQVL2wm+fgl4M+wKPY7WPNo/tTdeQt9CfUgd4DKB8BUXnsndeoGE6ysjyC8S4x49k2qcMW5gcZD8susclUxLMayz7d0KjRzXheKb6hK3zgZn6LE1+cs+6bFyjYcREgIIdYtbHdc0W0tA92xYnGT5ntviP/3Koy+55wILFV7rmWBtUW1x4LkDKYKrnNUNoZPSD8atJRIIXOcDRRxF4dMvOWXN+IltXQlkOadR0pe3JKHzhvn7NyCj9vIx+5isxMOZHDKOX3Of1RSVOdCrMr3YeDaR4YDg9hd42IYPKFydN7cpP/0uxBWGN7d6u+CB911/TglVEmY6qMOR6gsEBf2D3mcYVAjndsw7hyGxre6stmAoW7Cwahf3yTbNteVe9hJo9rO7/NrgesX3dWOuRL9LARRo5tXXFgGL1d41ElaUngYEwuMp+Ubda/k8T3oiEIQmsfJyDWm9DgxscbDgKfcGTZvsfozf9tWVRsBEEQ6zFD+wUDgwrhHAxuP/MXkJVQcrYCE7tX8g1KGr8rr88enZLiMHvEF3ZD/RwAxADHFzGqLjq+KPEkL6zi0FtK9Mve4Y7HMdOrSOzna3l+MFQR9Kh+aU=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(451199018)(41300700001)(66556008)(54906003)(91956017)(76116006)(316002)(66446008)(83380400001)(64756008)(6506007)(6916009)(66476007)(8676002)(4326008)(2616005)(8936002)(26005)(6512007)(53546011)(186003)(6486002)(71200400001)(478600001)(966005)(38070700005)(36756003)(66946007)(33656002)(2906002)(5660300002)(122000001)(38100700002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D49D18EB4B6F13419732241D3113DFCA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10094
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a8d496f3-b671-4487-e65c-08db135e37b5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hkwTVdf8Eex5D0fbl5nOaek1HFYXj//nuz1wlvAADz2taQuTWDF4bbQELH6I/oCQS3ugp6yRCB5LRaphfcTYOxFlNrV5WIpSTDct/iIr6paLdzlyRG21OUi/kLPVmyBNVcX+RS7PgADoyUIU8fnc0/dPbOQIGY7Yw8Z+3+V+Dy51Ty4qTK2Qk8UwUCjWNtvOWJqlAXgTpABV6S58/dA4XQo2zxX8wtazL2YG57ODhtAXr5MOlJMYaOn5PFriBA90C7yZhGlpdyEyemuP2ed99PN/a8hzyGnEJFaUBfJWtEG4zSyWUWhl25Xq3h9B0BR944Bu2EdQSuwcpqZCxl0MR42ZEeY6teo/sX+t4XJhdRR5RzPaAHcRUJbUBJrShRCTUXZQfED+/jdYC2g0soX8PL9QcDMk4LACCEx7AUagI3+zMqg1ihrnq/u63VVLWOVqW7cHMN4TnWk7LQTqUm59kKG152l2rkagRTqIHYrLzazNBPDLlpMKwfHMRE4/h6eS0B+JCuyaalmS/fn3OZiVhlMFxYyRF+WBsMtmN2R25SBhCUZb/K/XCSdA7UOOSGFdJyyshQ1OA/skAvxt7F0nxQcmXux6lPG1ttNmVa7z882/D/TcvTgWaqjLWQZX2iq0LkMOxC8oaG8MtNvAw15Br6VFLwpltI8JCEYUS42/jRq2KxwTLQ3AIlAru4kXr6Vw
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(396003)(346002)(136003)(451199018)(40470700004)(36840700001)(46966006)(336012)(83380400001)(70586007)(70206006)(8676002)(40480700001)(54906003)(40460700003)(478600001)(47076005)(316002)(6506007)(6512007)(53546011)(186003)(356005)(26005)(6862004)(8936002)(2616005)(5660300002)(6486002)(36756003)(4326008)(41300700001)(966005)(82740400003)(107886003)(82310400005)(81166007)(86362001)(2906002)(36860700001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 16:19:29.7132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a176ddfe-f3d1-4432-77e5-08db135e3e5e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 16:19:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177434

T24gMTkgRmViIDIwMjMsIGF0IDE0OjA5LCBTdGV2ZSBTYWtvbWFuIHZpYSBsaXN0cy55b2N0b3By
b2plY3Qub3JnIDxzdGV2ZT1zYWtvbWFuLmNvbUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiB3cm90
ZToNCj4gQ1ZFLTIwMjItNDA1NSAoQ1ZTUzM6IDcuNCBISUdIKTogeGRnLXV0aWxzIGh0dHBzOi8v
d2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMi00MDU1ICoN
Cj4gQ1ZFLTIwMjItNDY0NTYgKENWU1MzOiA2LjEgTUVESVVNKTogbmFzbTpuYXNtLW5hdGl2ZSBo
dHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjIt
NDY0NTYgKg0KDQpTdGlsbCBvcGVuIHVwc3RyZWFtLg0KDQo+IENWRS0yMDIyLTQ2NjYzIChDVlNT
MzogNy41IEhJR0gpOiBsZXNzIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0
YWlsP3Z1bG5JZD1DVkUtMjAyMi00NjY2MyAqDQo+IENWRS0yMDIyLTQ4MjgxIChDVlNTMzogNS41
IE1FRElVTSk6IHRpZmYgaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/
dnVsbklkPUNWRS0yMDIyLTQ4MjgxICoNCj4gQ1ZFLTIwMjMtMjUxMzkgKENWU1MzOiA5LjggQ1JJ
VElDQUwpOiBnbGliYyBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92
dWxuSWQ9Q1ZFLTIwMjMtMjUxMzkgKg0KDQpJIGhhdmUgcGF0Y2hlcywgc2VuZGluZyBzaG9ydGx5
Lg0KDQo+IENWRS0yMDIyLTQ0NTAgKENWU1MzOiA3LjUgSElHSCk6IG9wZW5zc2w6b3BlbnNzbC1u
YXRpdmUgaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNW
RS0yMDIyLTQ0NTAgKg0KPiBDVkUtMjAyMy0wMjE1IChDVlNTMzogNy41IEhJR0gpOiBvcGVuc3Ns
Om9wZW5zc2wtbmF0aXZlIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWls
P3Z1bG5JZD1DVkUtMjAyMy0wMjE1ICoNCj4gQ1ZFLTIwMjMtMDIxNiAoQ1ZTUzM6IDcuNSBISUdI
KTogb3BlbnNzbDpvcGVuc3NsLW5hdGl2ZSBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92
dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjMtMDIxNiAqDQo+IENWRS0yMDIzLTAyMTcgKENWU1Mz
OiA3LjUgSElHSCk6IG9wZW5zc2w6b3BlbnNzbC1uYXRpdmUgaHR0cHM6Ly93ZWIubnZkLm5pc3Qu
Z292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIzLTAyMTcgKg0KPiBDVkUtMjAyMy0w
Mjg2IChDVlNTMzogOS4xIENSSVRJQ0FMKTogb3BlbnNzbDpvcGVuc3NsLW5hdGl2ZSBodHRwczov
L3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjMtMDI4NiAq
DQo+IENWRS0yMDIzLTA0MDEgKENWU1MzOiA3LjUgSElHSCk6IG9wZW5zc2w6b3BlbnNzbC1uYXRp
dmUgaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0y
MDIzLTA0MDEgKg0KDQpNYXJ0aW7igJlzIDMuMC44IHVwZ3JhZGUgc29sdmVzIHRoZXNlLg0KDQo+
IENWRS0yMDIzLTI1MTkzIChDVlNTMzogNy41IEhJR0gpOiBoYXJmYnV6ejpoYXJmYnV6ei1uYXRp
dmUgaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0y
MDIzLTI1MTkzICoNCg0KQWxleOKAmXMgNy4wIHVwZ3JhZGUgc29sdmVzIHRoaXMuDQoNClJvc3M=

