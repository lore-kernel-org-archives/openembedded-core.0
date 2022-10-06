Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 705DCC433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 12:19:48 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.82])
 by mx.groups.io with SMTP id smtpd.web09.5074.1665058778669763657
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 05:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=o0etXPgL;
 spf=pass (domain: arm.com, ip: 40.107.104.82, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fX8doV8gPvkEylJcoLQxPmc19XCAyPvdC5Ao7kxJUQBr6p1b/CtwsySAhPyRD0C9XLxxbszzt7cKjphQWZDDI5RGbMN7ugfD656PMesRBvFWPtvyoELU8GHp0quur6U3z6GELdnW7i3IEEyvKw2IY5sjblLmW8EXSZ/bGLdSJ+DTI7Nd3vU3KOMn2y105/6cZQl9WuTjbtynVum12sFuNCpxwXLjsEOwSInOLyxmSZG+OscawWZUdAVN3dNEIsumuiFiDiQcC5ubncbgmPL6ddqrebnmS0bQRPMz4pO3Iya1HtjGNcG/S8/5Bj6KjmuV2bRIfYlA7GCOFNry5vS5TA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+EXe3WW9NeR+hX7kWTNGBFeESOfSSLy7xbVblLYFjY=;
 b=fdm6RNgdLiFdjG8e3k/KLZgUk/wYyM/0pVV990jla6Bv4+USTPOOBJC2y1CzmKWAaQG2JiyVAP8EHoWZh8862Evn+gMxF/WQbpM0VpzQMtzBXrh3vw9or/35qYES8ZPADXIQXqX9/AIYXAyPndQ83OY8y7MaO0X6jXRUaPfzQCi7F93UbILFnoUBYgwesD+fjlWT4ecYAmxkuCFMz6N3CYndak1i1GOLCX/9SvH7IiDvlR2ASJgAFM1yod2L3QxlCIarTF2FvHBq9sCqxvmD4kR5OZ++EyJZOOQ/epP7ZwB5Or5SG4YARLlGrMF7WqALiIP7e5CNB6+CLO8y8lrEUw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+EXe3WW9NeR+hX7kWTNGBFeESOfSSLy7xbVblLYFjY=;
 b=o0etXPgLx6SODlGd8FNeUJRFXZaEgOQwPB4p9iq8q4208e7KPCt616ww5VAUbl1gaCAIaKcQVrzF4LhHS25y7zM3QL3wVm54czeORNufftNalNvqMg/WZQp8OguMkHdcYDowzOEYUJpiTapG27qJvK5+Ubg625lCNknLh0Pm3/o=
Received: from FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::13)
 by PAXPR08MB7647.eurprd08.prod.outlook.com (2603:10a6:102:242::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Thu, 6 Oct
 2022 12:19:35 +0000
Received: from VI1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:4a:cafe::8c) by FR3P281CA0042.outlook.office365.com
 (2603:10a6:d10:4a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34 via Frontend
 Transport; Thu, 6 Oct 2022 12:19:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT033.mail.protection.outlook.com (100.127.144.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Thu, 6 Oct 2022 12:19:34 +0000
Received: ("Tessian outbound 7761be2ecf00:v128");
 Thu, 06 Oct 2022 12:19:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2254301e0f454a88
X-CR-MTA-TID: 64aa7808
Received: from 0b2ce740b7c9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4A5568A3-4A0D-4220-AD21-77E711FE8DE6.1;
	Thu, 06 Oct 2022 12:19:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 0b2ce740b7c9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 Oct 2022 12:19:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUgSWIGyhoCrFZhz05m2udI4dMYQzM5Lsit+Pu8JjpUp/Js8p14JQHHihEpUegRUx4b730MaS3q1kUgNN1n1l9U3KtH2G0kiDjEPt9b9MgfGHi2pd3+y2PotkLFsIH/BiseTOp5NVsAxdV+brT/VFigYVJbCSjz5Pa/0ZQSFYF7mcdUB2EYTwg54LquOkPMMh/LRDWhLPbn8Paw96VVecxEw0z1r7a0JOiXg2UCcGvE8E4utxrbMg5bh6ZAkj+HQTxND05ssGuPBGhSREIXwInG5KT0kjGQYWiXcAWzn7Nk6Ti0mcdi6Z3tewQeX0ZmXF/0FyzHKQdKIO6zi7PmoAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+EXe3WW9NeR+hX7kWTNGBFeESOfSSLy7xbVblLYFjY=;
 b=GjgwvGww4ASi9n4omTY6HrCSjR+qZZvdsCq6EXnbJrMnSv++J6a5WoWpwUGypo0D/fwGZyoYGk/dnzOIAH0JLSxE/h0UnVeq4x5uNoQSSCyNqbXbUESpBD56/B9R22E2huz0ZrJkfYmQZssW28BW4RdYxyhpIhIPCG3Gd6mp5rZoDU4d46Srot+QGWsmwcc/L/l6WTwDMEakgdhsiCsPQBAe5o8LB5PAykJJlCCm5YnkyL0MyM4Uer1Rz9l9ZS8Y6a94f8wvCbkx/ldots0dMr/lxv670g4pQvUi6QT4GcEotAPFPUOJOgDxijgZlKy6A61zVcAzAKNpE5CUGtxPdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+EXe3WW9NeR+hX7kWTNGBFeESOfSSLy7xbVblLYFjY=;
 b=o0etXPgLx6SODlGd8FNeUJRFXZaEgOQwPB4p9iq8q4208e7KPCt616ww5VAUbl1gaCAIaKcQVrzF4LhHS25y7zM3QL3wVm54czeORNufftNalNvqMg/WZQp8OguMkHdcYDowzOEYUJpiTapG27qJvK5+Ubg625lCNknLh0Pm3/o=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8135.eurprd08.prod.outlook.com (2603:10a6:20b:560::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Thu, 6 Oct
 2022 12:19:24 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.028; Thu, 6 Oct 2022
 12:19:24 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "liu.ming50@gmail.com" <liu.ming50@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V4 1/2] bluez5: change configuration directory
 mode
Thread-Topic: [OE-core] [PATCH V4 1/2] bluez5: change configuration directory
 mode
Thread-Index: AQHY2XakvwN+duz7gEOffq5b+4LxMa4BSNAA
Date: Thu, 6 Oct 2022 12:19:24 +0000
Message-ID: <370BAEFD-0766-4316-A271-CF60F61D8DF4@arm.com>
References: <20221006112712.23062-1-liu.ming50@gmail.com>
 <20221006112712.23062-2-liu.ming50@gmail.com>
In-Reply-To: <20221006112712.23062-2-liu.ming50@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8135:EE_|VI1EUR03FT033:EE_|PAXPR08MB7647:EE_
X-MS-Office365-Filtering-Correlation-Id: db1f7fe0-4ba7-47e0-8d7f-08daa79507c3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ehjVbsKZ+vlN8n3TNDPcrFZUDJQpR5Czs2/x0iwx3kfYQxV9Zgwmtxln95IBUYj9kRLYSF/vNiYOw8w2oecztQH76TrCC+3YuE8UE4ydyrJsKEN/6+j/U6+tHtsC3lHAoLKU7oAWObCK+iwQ7w2ynvIG29pIxFLHY1YWQqbl6y74qZPpUzDDCSS44SHU+Nz0fcOVs8TfPZzgNWhoXsEElesF8Yjazt6prcqdkE7ypSfo2sJ5TXoXEtavGAKGW3x27CEiuvKxKRSbThPJSXBWr9l+pY6RoVYZtpwPhbuBdbyVXtwunDa7jlJnaV2VWOIg7aVCw3Jz86nslxzYlnX/ysHR38G8bKhXn+eraCGb/ZUkjBMcQbjipsx5hQklACGpkauxouzIEfwv40iPO9yqMwzCzxkSosZ6SThB2MiaeoIy54VyviHkaAVy5RdPEVwXJZUZT2GTp6Cl3ax8Y8H3/hR8zbgTy9IbrZ9UI2wiGNltzfBM9AD/bPv5svj/gMw1YC831uZAGMiyyy45K99GYrJQfORUp3qxSYadwA1DFcmYzKYqZQRxsjgHS8Xz73BML9ltwhaiUsj3D22i7xE2L1OZk1sWJ8ui+xM2TFAMToIdQdTehYwXyjn/ANRHSeaEoxuJ5ok5RejlUdvJQEMO03eqWwtuz3WrdWH3vtDjGM+6kpLLZNBDnDHEXMKH/3eOolrGCjVjpv/fG+uxY42750zGvppLQlGCbqpnGrbvQ8W7nCgSpB6JX9cnmsWpPELm8mberZ1n3OR9pK0KJH8DN6SgSXoBbG8exre7XNweCMZ3bDv8BkpT/Cf4krCgHHLSo/rnIADg6sHNHbAXEyUhCw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(451199015)(83380400001)(66899015)(71200400001)(4326008)(6506007)(38100700002)(53546011)(966005)(6486002)(122000001)(2616005)(316002)(66446008)(478600001)(76116006)(6512007)(6916009)(38070700005)(41300700001)(8936002)(64756008)(8676002)(91956017)(33656002)(86362001)(186003)(36756003)(2906002)(66476007)(66556008)(5660300002)(66946007)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <06A7F00A4DA3F943BF20E6DC5B37D0FC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8135
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	94de7b21-fb02-4b60-f4e2-08daa79501bf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kzaMnXooY6nTw4h4PcS3PyluOjmBmIyIypcK/7LBNpKO0M4Z79xGe5T18ITQjURHCCEJ08sQCPvFsbRWf6iCqZkDS1D64HrHCQugzpq0dBl1sD4sdhquLC+AAiDIVMIKtMJMFdPM5QD3gso6x/xQGlc6r8Dj3sHJfHCpIgd1MEIzySfC4rCaoCBbLOxpRC0TKxYZBslqUMorqhhITZc0HnubPuj21eTkQmxFys7kF7/uBmYjSTaqcD5hCkvkql4nrjltPdXMRjG+aETEVmYLxtm5YHh7ZMFxxf6VD4+dJ9zsZOsuD3JZLozUcMQU/hDXqXlQ+5j0zhi2hsUJy5isTvWH6WtxPf83ObE/zyac2TRuETWzOkcP888udH6UROXpM8DnKy0Rms9nLfBPhh/lHuN/EGEvK1JxS5la1eLTdzay2JOErg3n8ANwpUCvxkvPSIWas/6yaA5CFec3TvZN1Q5QI3cTmJC/h5AKy+ogJ08tmpyJOKoNGJi9WUcHnqxSdPAnNfvhcLaL+wLojHNoZxv5nYF9uPRsPZpkI3xVBSequkZ2IzUt+fHIpe+NWHW/RK3Km1+Di95t8VA9gAao4Z+MJtbKBGTD95HCd5CNGfBjW3lEDPC44m4ZWIdU8ZsqJ00Zz1+uCuDmy364aUvhdexeoNDw5ZE6FcWxjOepv29hfjCIcJHq7UIQWZ9jvvPQR/nWaI3hzV2+BsX9S++18azRp5xnUza6IIhUMijHV0t2QFun9KvcXTMufxuAsBrOHD/VfFRvCDCwr5hC12EC27fGNmS3U6Dcg7QRh0lsLHo=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(82310400005)(33656002)(2616005)(36860700001)(47076005)(82740400003)(356005)(36756003)(6862004)(2906002)(66899015)(81166007)(40480700001)(70206006)(70586007)(4326008)(316002)(41300700001)(8676002)(83380400001)(8936002)(5660300002)(86362001)(336012)(186003)(478600001)(6506007)(6512007)(40460700003)(966005)(26005)(6486002)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 12:19:34.7474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 db1f7fe0-4ba7-47e0-8d7f-08daa79507c3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7647
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 12:19:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171497

SXMgdGhpcyBpbiBhIGJ1aWxkIHdpdGggc3lzdGVtZCBvciBzeXN2aW5pdD8gIExvb2tpbmcgYXQg
dGhlIHJlZmVyZW5jZWQgY29tbWl0LCB0aGF04oCZcyB3aGVuIHJ1bm5pbmcgaW4gYSBzeXN0ZW1k
LW1hbmFnZWQgY29udGFpbmVkIGVudmlyb25tZW50LiAgSW4gc3lzdiB0aGF0IGlzbuKAmXQgdGhl
IGNhc2UsIHNvIEnigJltIG5vdCBjb252aW5jZWQgdGhpcyBpcyB0aGUgY29ycmVjdCBzb2x1dGlv
bi4NCg0KUm9zcw0KDQo+IE9uIDYgT2N0IDIwMjIsIGF0IDEyOjI3LCBNaW5nIExpdSB2aWEgbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyA8bGl1Lm1pbmc1MD1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBGcm9tOiBNaW5nIExpdSA8bGl1Lm1pbmc1MEBnbWFpbC5j
b20+DQo+IA0KPiBDaGFuZ2UgY29uZmlndXJhdGlvbiBkaXJlY3RvcnkgbW9kZSBmcm9tIDA3NTUg
dG8gMDU1NSwgdGhpcyBmaXhlcyBhDQo+IGZvbGxvd2luZyB3YXJuaW5nIHdoZW4gYmx1ZXRvb3Ro
ZCBzdGFydHM6DQo+IHwgQ29uZmlndXJhdGlvbkRpcmVjdG9yeSAnYmx1ZXRvb3RoJyBhbHJlYWR5
IGV4aXN0cyBidXQgdGhlIG1vZGUgaXMgZGlmZmVyZW50Lg0KPiB8IChGaWxlIHN5c3RlbTogNzU1
IENvbmZpZ3VyYXRpb25EaXJlY3RvcnlNb2RlOiA1NTUpDQo+IA0KPiBSZWZlcmVuY2U6DQo+IGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9ibHVldG9vdGgvYmx1ZXouZ2l0L2NvbW1pdC8/
aWQ9MDBjZmIzNmUyMGUzYzM1ZGIyMTUwZTdkMDM1MWFkN2I4NDQyZTJkOA0KPiANCj4gU2lnbmVk
LW9mZi1ieTogTWluZyBMaXUgPGxpdS5taW5nNTBAZ21haWwuY29tPg0KPiAtLS0NCj4gbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LmluYyB8IDIgKy0NCj4gMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LmluYyBiL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS5pbmMNCj4gaW5kZXggNzlkNDY0NWNhOC4uOWY1
Yzc4YjgxZSAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUv
Ymx1ZXo1LmluYw0KPiArKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVl
ejUuaW5jDQo+IEBAIC04Miw3ICs4Miw3IEBAIGRvX2luc3RhbGw6YXBwZW5kKCkgew0KPiAJaW5z
dGFsbCAtZCAke0R9JHtJTklUX0RfRElSfQ0KPiAJaW5zdGFsbCAtbSAwNzU1ICR7V09SS0RJUn0v
aW5pdCAke0R9JHtJTklUX0RfRElSfS9ibHVldG9vdGgNCj4gDQo+IC0JaW5zdGFsbCAtZCAke0R9
JHtzeXNjb25mZGlyfS9ibHVldG9vdGgvDQo+ICsJaW5zdGFsbCAtbSAwNTU1IC1kICR7RH0ke3N5
c2NvbmZkaXJ9L2JsdWV0b290aC8NCj4gCWlmIFsgLWYgJHtTfS9wcm9maWxlcy9uZXR3b3JrL25l
dHdvcmsuY29uZiBdOyB0aGVuDQo+IAkJaW5zdGFsbCAtbSAwNjQ0ICR7U30vcHJvZmlsZXMvbmV0
d29yay9uZXR3b3JrLmNvbmYgJHtEfS8ke3N5c2NvbmZkaXJ9L2JsdWV0b290aC8NCj4gCWZpDQo+
IC0tIA0KPiAyLjI1LjENCj4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5r
czogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9S
ZXBseSBPbmxpbmUgKCMxNzE0OTQpOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9v
cGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE3MTQ5NA0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBz
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC85NDE1NTM5OC82ODc1ODg4DQo+IEdyb3VwIE93
bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVu
c3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQt
Y29yZS91bnN1YiBbcm9zcy5idXJ0b25AYXJtLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0t
PS0NCj4gDQoNCg==

