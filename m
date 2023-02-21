Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BADC61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 13:45:37 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.76])
 by mx.groups.io with SMTP id smtpd.web11.42813.1676987129941238276
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 05:45:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=RDGOcgdk;
 spf=pass (domain: arm.com, ip: 40.107.249.76, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ar6APIRck/0qRlQTulcFkxxeP5GIXJbBVqqDVTezm84=;
 b=RDGOcgdk9MNFpfXps7xLXAn5Wl60+kjN0XOVSaIjirnW2UgQJzsZNCWFy+932htoSog/5oPc5gipzNyxDocDvs+JRs0Z3rj0uxt76kZUXn+vKxpGzkiteX/ztab1s0zZHOa53PE5DgglOr3pvO7JN5/dYDn/Ga++j/+VYW/y/LE=
Received: from AM6P195CA0020.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::33)
 by VE1PR08MB5680.eurprd08.prod.outlook.com (2603:10a6:800:1a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 13:45:26 +0000
Received: from AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::3d) by AM6P195CA0020.outlook.office365.com
 (2603:10a6:209:81::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21 via Frontend
 Transport; Tue, 21 Feb 2023 13:45:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT017.mail.protection.outlook.com (100.127.140.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.17 via Frontend Transport; Tue, 21 Feb 2023 13:45:25 +0000
Received: ("Tessian outbound 8038f0863a52:v132"); Tue, 21 Feb 2023 13:45:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f648719d5061a862
X-CR-MTA-TID: 64aa7808
Received: from f17cee8b5eff.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3E74FEFD-3280-4734-8229-D007E972857E.1;
	Tue, 21 Feb 2023 13:45:18 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f17cee8b5eff.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 21 Feb 2023 13:45:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DxB2JSUoHkqGzC0Cp5d7jrSPKGLF8g8AlXlzNYQlpzakjimwHXUJW+fBf+DLEt3nSuYylgqZlKFQEAnn2QSECVYSb8jUyndzQB3569HRGAlqiuVH9Qd09o/IP2jI0eRWlclgzSP0aetSnu/GApCaT+ljemAm6BbIBO6al3lBji9A9y/mwQndc5S9wP8j3mqbFBdSDtMSLC5s0inwzJav9EZjoD253zYmlubWYCN+9wFJkUIXbKymiT6uE8mz2kYM5JVQaqoTxk/QPb/WQsJXGXI4jcJMO3vTShBgY0bg+/YHyEoFUzJAGUD0PAZhlfNwR+YciimQo1vtolpSYbChbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ar6APIRck/0qRlQTulcFkxxeP5GIXJbBVqqDVTezm84=;
 b=TC/BW9VhA5BK8ZfdTFJzRaZe+12pGDkJ3tx5F2xArZjCuvC/JHWlkjyjGUC3UPmwVoYVeMu8aMkMDZ7xZDUg/wqJm0+3ia683SdGB8FycD/kGnUlHHO3JxRjkSG5fVWHpdtXZ6CNnCnS04EqkMO6bctEdP9CBMBMNsjbDziZBpY4E6tgtzIGQtWLFLmyCeU1h4xfG4lrFbWhNJQ+4mKs6fi/UlNWN8RtO0vCbACms83eDVC0ymbJ52sxG0Rlqlmjd/ALsAjkUoXXp32nJe3EZpba36e+cZ3i4BI/fMebNmVkWzD/wXeAgtUdRq6ujVsUCJdeUKgl3MqIfqWQQCBWTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ar6APIRck/0qRlQTulcFkxxeP5GIXJbBVqqDVTezm84=;
 b=RDGOcgdk9MNFpfXps7xLXAn5Wl60+kjN0XOVSaIjirnW2UgQJzsZNCWFy+932htoSog/5oPc5gipzNyxDocDvs+JRs0Z3rj0uxt76kZUXn+vKxpGzkiteX/ztab1s0zZHOa53PE5DgglOr3pvO7JN5/dYDn/Ga++j/+VYW/y/LE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6409.eurprd08.prod.outlook.com (2603:10a6:10:23c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 13:45:12 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6111.019; Tue, 21 Feb 2023
 13:45:12 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "rich@richelberger.com" <rich@richelberger.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] [YOCTO #13270] docbook-xml-dtd: refactor
 for style, add version check regex
Thread-Topic: [OE-core] [PATCH 2/2] [YOCTO #13270] docbook-xml-dtd: refactor
 for style, add version check regex
Thread-Index: AQHZRKp3Rd+89yRvQFycCVf28l/dgwAAALvortlsCIA=
Date: Tue, 21 Feb 2023 13:45:12 +0000
Message-ID: <AAEE0F32-07A5-421A-96CE-CC6DC5409CB6@arm.com>
References: <20230219213807.3415938-1-rich@richelberger.com>
 <20230219213807.3415938-2-rich@richelberger.com>
 <010001866b9d0634-676dbda8-5f68-4a16-b3f2-5b80d490524a-000000@email.amazonses.com>
In-Reply-To: 
 <010001866b9d0634-676dbda8-5f68-4a16-b3f2-5b80d490524a-000000@email.amazonses.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB6409:EE_|AM7EUR03FT017:EE_|VE1PR08MB5680:EE_
X-MS-Office365-Filtering-Correlation-Id: 63d4c938-85c6-47c1-5880-08db1411e2e9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 4oxEq20cyCHD7IMh03Rv2fUr0C0RbgSk0koquC69gHWxrgrbqPsrkbjpCawPpjMHYiI0je21TCm6lRGG9g8DyWrbRu7setagNJ3WraHucLBq9zrjef7gQ946f4m4an0yimdNNUlT2ZhhCJEEeMJ0t8wefCzlXVav/xxZ+4Mchz0wWjCDe/ceqAAL0z23TvjqVfpsAKt1C8sx2gvvG8FfLzzKarR+zcXYgQxwaarH63zSBPJynUYmAupIpN5BMST8NBM1vr2oRMskZ4DRNqPUVWGD9HK4PhEyALrTvO9oFjT0qq5B+s02JC2Rq5lecSrTWSH6/vgSGNyI86idZGboCQ9KsG/TA58c9OiUgfW26cr3cJ9n2EMEZiYkBMfohbGgmfEdh0Tf78sevvHxYqbIN5mdI4YY2manIJVgR1ktX8ZByUItV9nNLttDOixz50I0QsTvTE3m1cF/e87SYbVuxX1fg0KpS0Y4t8AN4nOrgd7aHc/7488ramtCnvo/6XmweLSEXffRPbCx2wrcC2znjF+mTm5+igct2TQ2rJxG35wwi+1xw/VR9K5C4TKz8Ptqhu4M9sTmnvPnmaN+mD1eVCFhmcTINuMH2hiqDEKRbIJH11ZDDjPziU6/V9CDM2lT0O8oXW82n5fZBbrtLXBsNnb7rHou/IOx7z+nQvG2f4IcMJPF4Rn9L5ORHVeIMGn7Y60XMiTG8dZeu8k5u36LjK02xBD6bl4RSru78ljeRG4kph7zrKgVtK/JacOux1hg
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(366004)(136003)(346002)(39860400002)(451199018)(83380400001)(122000001)(38070700005)(86362001)(36756003)(33656002)(38100700002)(2906002)(8936002)(41300700001)(4744005)(5660300002)(91956017)(6512007)(186003)(26005)(6506007)(2616005)(4326008)(316002)(76116006)(66476007)(6916009)(8676002)(66556008)(71200400001)(6486002)(64756008)(66446008)(478600001)(66946007)(45980500001)(562404015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC1E46121E710043AF6580DB30F075B6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6409
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	78631236-a57e-4f6c-5c61-08db1411dad3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4v+fqqXLGoEUX2KuRG/XBVlwwpdNiZxfLoYWLqA8pwTcPslAl6UARo7IGjMSiBwsnfgy30ox3SAiJfIedyryGFU709xJ3SxHDpgDclRM/ueZ0Y2Plbyk3p5ccZ8oPHTcNOLiSimREclKmBsdtoqzdORlvNIGPYEbpbOSjqSNOwIFvocuxgG4/Puo3fh7A3tIT0ezPihOyLX+dqUNJNTTg6e9Qcb6JqT5z/FojFNzdUbQaPHvgC5NxjkFE2ni/gIHDiwKck3XUQYwpqmhBaZjm8eoCXYDsGmlDU7qQsI5vj4SW53k9MStee7Qxdgv1Lr9Jt4p/02I/gl9XZxo6K3gqzlH8U/kuUnC/6DOKDDKuYuGLepbcnAOHxlvNfiqMu+yf9QPB8vn5ep3bOIR7l0l18JwwVTMEJpxU2aZCD7rzSoK1HLVeiWIgudQ00dQYBhfoYwCnD2BVuQloGd//C1eXHrR+Pn4RYKMyMw+m3zY4pt8w8qhaoP7U8uFf5lAweLPpkDo3tlyAHiMPGjOtCCpRO6blfSf0sS9EG0qknpycOl1PH4XXoSsCHN9CG+Yy203r6Mxt0kLvGAKXgdFx8ynv3Gvk2uj120ZmhAiYCxuJZWvmOpIUxelXa8Bh+1VgkKhEg9rY6UMXg/g4G2MCM2u5Gj/3uXVm4gOwK8JiZ4oc9r0EGZXzpU5U8wfAA2FWUMP4uC7+ExhiHxyXYfjikabbA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199018)(46966006)(36840700001)(40470700004)(82310400005)(33656002)(356005)(36756003)(86362001)(41300700001)(5660300002)(4744005)(6862004)(2906002)(8936002)(36860700001)(82740400003)(83380400001)(81166007)(478600001)(8676002)(70206006)(70586007)(6486002)(186003)(26005)(40480700001)(6512007)(2616005)(336012)(316002)(40460700003)(4326008)(6506007)(47076005)(562404015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 13:45:25.6375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d4c938-85c6-47c1-5880-08db1411e2e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5680
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 13:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177497

U29ycnksIGJ1dCB0aGlzIGRvZXNu4oCZdCB3b3JrOg0KDQpJZiB5b3UgYnVpbGQgeG1sdG8tbmF0
aXZlOg0KDQogdmFsaWRpdHkgZXJyb3IgOiBDb3VsZCBub3QgbG9hZCB0aGUgZXh0ZXJuYWwgc3Vi
c2V0ICJodHRwOi8vd3d3Lm9hc2lzLW9wZW4ub3JnL2RvY2Jvb2sveG1sLzQuMi9kb2Nib29reC5k
dGQiDQogRG9jdW1lbnQgL3lvY3RvL3Jvc3MvYnVpbGQvdG1wL3dvcmsvYWFyY2g2NC1saW51eC94
bWx0by1uYXRpdmUvMC4wLjI4KzAuMC4yOStnaXRBVVRPSU5DKzZmYTZhMGUwNzYtcjAvYnVpbGQv
Li4vZ2l0L2RvYy94bWxpZi54bWwgZG9lcyBub3QgdmFsaWRhdGUNCg0KIC95b2N0by9yb3NzL2J1
aWxkL3RtcC93b3JrL2FhcmNoNjQtbGludXgveG1sdG8tbmF0aXZlLzAuMC4yOCswLjAuMjkrZ2l0
QVVUT0lOQys2ZmE2YTBlMDc2LXIwL2J1aWxkLy4uL2dpdC9kb2MveG1saWYueG1sOjQ6IHdhcm5p
bmc6IGZhaWxlZCB0byBsb2FkIGV4dGVybmFsIGVudGl0eSAiaHR0cDovL3d3dy5vYXNpcy1vcGVu
Lm9yZy9kb2Nib29rL3htbC80LjIvZG9jYm9va3guZHRkIg0KICAgICJodHRwOi8vd3d3Lm9hc2lz
LW9wZW4ub3JnL2RvY2Jvb2sveG1sLzQuMi9kb2Nib29reC5kdGTigJ0+DQoNClJvc3M=

