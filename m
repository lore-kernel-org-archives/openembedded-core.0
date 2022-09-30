Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DFC2C433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 17:01:41 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.40])
 by mx.groups.io with SMTP id smtpd.web10.35.1664557294752815769
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 10:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=5w8nyfVB;
 spf=pass (domain: arm.com, ip: 40.107.6.40, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=X/1B32CCZE8SLjePSUnxr7FLOwGaMjnp8tG8lZ5Su6QkI3zLB7IDLg/LWO48FayHmOtJ6REK6PTQC/0SfCSYfHHwrDsoC7n79sm7Khq8X6NSu8Jlwk7Z17wV7ImmUaOnR7i0av/+pV2FlLN5JKHIp/U+TpiqSckrmWLwz250lOQxaRvg5Ook8zkgVkJ1KNrqkBWByuO3Ob3DUI1nRHgXxhHvDulRaliiEjZQgq8hQbgMr0ALpYRwP6JI1rnlJK+B8hgrmGuj26UWMsu3XmnxdmKQEgXJGzOzykNg6JFBEjjIA7JUi1ucrjHg/V2aobt+2C2wRPwePV9ika4XZTyYNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zhufja+IFJvU+tG3q+XFrvP2W1kz6JnBD+aPDTKt7Eo=;
 b=CpvmjSOhBDAnSCK5QELkH6XCBKTSIDgX41ZgR0+H4yz9h3Hix8pdaEFf8YstJoduhrST1NIy5rBtTeM8zq3EkQ0UJ4TntOfhreSvB8x6GWSu7tDvaHLbq9atRiB0ktHnVWov2Xl5+c81C+lGG0LE5pJuPGYBItJHGaePAG27+ApVUqyJEy66e5i2YTPcTsHUpL+LSHFfHbsZBjCfFzq3gyIKrHN5hvgOKqI89x7ohW87kB+1gX8G1+gzz4E+QWBWeJnYL5//qqEWI5YcFss/gGrkImr7H9oLS3zaJTAmbC4TmZUg3PCx6cWb8YS/kzPsOptdvyK8MhA3a47PaV3Zmw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zhufja+IFJvU+tG3q+XFrvP2W1kz6JnBD+aPDTKt7Eo=;
 b=5w8nyfVBk1+4PI+tEzqoQVjx37R77hFdrIBMo7Ybs0Xjj2uTErUcRE9TxsWrW3vw+ndse5QS6YX/a9N31DTkVYOkYKUzowdZlN8KAaJfRZQUPl4dnHzX1Z2Up+FWr/eSmesOQLFFHgnOYRDHzr1cPjpAcsZA2snxaXJ7ydIXp9Y=
Received: from FR0P281CA0064.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::8) by
 AS8PR08MB6039.eurprd08.prod.outlook.com (2603:10a6:20b:23c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 17:01:31 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:49:cafe::46) by FR0P281CA0064.outlook.office365.com
 (2603:10a6:d10:49::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Fri, 30 Sep 2022 17:01:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 17:01:31 +0000
Received: ("Tessian outbound 7761be2ecf00:v128");
 Fri, 30 Sep 2022 17:01:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8b18cc488337bc71
X-CR-MTA-TID: 64aa7808
Received: from e9f4075c4a2f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 600457CB-BEF6-4E2B-9853-AA68CEE23290.1;
	Fri, 30 Sep 2022 17:01:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 e9f4075c4a2f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 30 Sep 2022 17:01:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=at+4ns6YbkOiR4Kkon6xzZwX1g/nM3boK3IISNIQ34GNtiCR2+lG1+1EYUJp3YB1UW2dqQGHk38I26DBHljYsqY1O2vpVMRYlG4U+STWdThTDWgKVSb+HMSP10F+AHrPGO/XUYu3dQk8hWYP6ukxy8ri6QIO5P+maXDuRIPHonBPDCjqmNSJn0YRD5l4nD5FyQyl4rRzCsXrXb7Y+M+MU5bkhflJU5HrXbhZrI3EootE7t4wjRd+hsdGTke3LRoGS3njMeOGq0H/rZBVR7jj4eT7eGCmzRHb0imCOgfm3xMfR60WkYnHtqmmfwe/GS9H/YYEYCwKhVqzqutjA5A3gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zhufja+IFJvU+tG3q+XFrvP2W1kz6JnBD+aPDTKt7Eo=;
 b=gPIaJOB7x+BACbICqH3Ytax+u0HvvR5e0sNEC6Zfv3olocCOqKe3DPRtHg2gk2SBWDO1o8p/KHi724VArMUFh3qTKMy1KpMrgkciGHE5UhWyjWjZ22rJf2Zaq/myntGbNZxnnHyzbY9WFTfgrzN8ey7ZeUw5e64vgxqFyhZ1F0ajK1MgrQxgH86SESQCwQfVFC+xFecNyjM3QyJypBwESwXeOdeAQ3vXeipSxoPivbmC/IpnlkATodoIhFtDJWo6snSvNpqVfxAPrKXi9d5RtnzEZRglAjm9EayqYh7WcyGjcKkFRxdrF1aDfVmBykr3mDXZrRXRBGKn2+Phk7f2hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zhufja+IFJvU+tG3q+XFrvP2W1kz6JnBD+aPDTKt7Eo=;
 b=5w8nyfVBk1+4PI+tEzqoQVjx37R77hFdrIBMo7Ybs0Xjj2uTErUcRE9TxsWrW3vw+ndse5QS6YX/a9N31DTkVYOkYKUzowdZlN8KAaJfRZQUPl4dnHzX1Z2Up+FWr/eSmesOQLFFHgnOYRDHzr1cPjpAcsZA2snxaXJ7ydIXp9Y=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB8482.eurprd08.prod.outlook.com (2603:10a6:10:3d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 17:01:21 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.017; Fri, 30 Sep 2022
 17:01:21 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] openssl: Add missing perl module runtime
 dependencies for ptests
Thread-Topic: [OE-core] [PATCH] openssl: Add missing perl module runtime
 dependencies for ptests
Thread-Index: 
 AQHY1INuHCxkyMIu9UeLDtUzW8mrR633wj6AgAAF44CAAFsqgIAAB2cAgAADaACAAAVlAA==
Date: Fri, 30 Sep 2022 17:01:21 +0000
Message-ID: <01558808-3100-4CFA-98DB-244F487435D4@arm.com>
References: <20220930041614.2704304-1-raj.khem@gmail.com>
 <C9A0CBAD-5373-4F4C-BB73-0AD10A2DF000@arm.com>
 <042F0314-BF16-49A5-AD68-81DFD17739E6@arm.com>
 <CAMKF1srZEorOx-hPiD1zZx1DMiJdZbHgknub04hfyfRFzEhNcg@mail.gmail.com>
 <EA0EFA99-9A83-4699-9D0D-AD5279C58B81@arm.com>
 <CAMKF1sqwQcT-vpk5Ycydd8BCk3OCmPP-zCKZ-MwRr0G+XPHHNA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqwQcT-vpk5Ycydd8BCk3OCmPP-zCKZ-MwRr0G+XPHHNA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB8482:EE_|VE1EUR03FT037:EE_|AS8PR08MB6039:EE_
X-MS-Office365-Filtering-Correlation-Id: e3d5ff18-28a9-4a77-325f-08daa3056c51
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 VU2KtHmv9OCRsF86g+e/zin767mqHyTr2quIeIXyncfLlFOIiUh7TxsGFWIffmb3GMJ32IKG7IhAJdHvlVS5kXbLg5Egjq9qnif1z5jQlwEfwU69lkoUq9Ndu60zmHhE4x+1p5RiusuCgAohz1OzMu42WOI3WrAxQeq+KW1+vdQwHK/DOCbBATDY7fSPVMcuYdGhQpR6OQ3e6frLgz6F3xizsm0h1Ny1AMjThk7IT/CD+ZnE6A9FZFy61PrmEL2pBMjoCzlBao+Ag5qvvwhBwdrhcfIh7OhGjne67x+/iZnjDvhq/V+obPqpf2Y3UcWZSZWLy0kAHmmrwJT5u13i5oELCbl/+3JQIOQxLaKbQptQVDdExVAVhwnpfjDhRO0BX4C3aJx2250LlUtu69Hgo+0o7VXZfmN2jC8ncuhJnoopGXy2QT+BHVY7kbxT0mfmCHUx5ybD/ZswWRQZO4us0M5NNdT1d/Dw60H+zfoYOeGk8fW7K4ibORGhYNe4Y1FGb7BQcu777ipCtvpLGTUIQJTAu9sUmq6DR0hXpPtrHiWH9Zb94vvculcfOO1PteMSu0Ym2t/6pqLKM4ekBLZKTDiJllzK2xQqjVlarHiJvD7Spx3BcAmmVyN+XDjdNin5IIyLT+6AF40ijtF61zh6jXl6BKsobJzqQKbbgPyhKGDe6LtSL7g7XehNva7PFXtSSQ2cUKxG+zBR/xTcUCJSl2FlRsSZ4bYvR4Q57sDRTYYabi+wn0LAvVH3h9gNQzD8u7V55lWKQrq/tdwgGJfNTOfdNNsxWLVQhccS411DlTg=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(451199015)(86362001)(33656002)(36756003)(38070700005)(186003)(38100700002)(122000001)(2616005)(53546011)(6512007)(4326008)(6506007)(478600001)(26005)(316002)(6916009)(64756008)(8676002)(76116006)(66946007)(66556008)(66476007)(66446008)(91956017)(41300700001)(8936002)(5660300002)(2906002)(71200400001)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <20F2E280B5D3704991D39A61AB99C19E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8482
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	14656ba2-6ad8-4ed5-bbf2-08daa305662b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6N5D2CGIEx7ClyoS81GJ9+JZhS7KIe4nAoXT4XyuhTQotWlg7YslEEZIuSuC8VAt/DVtsAdGm0cGzgZqPO0fImUAAyGjuAPAIa21NiZswRSDVwEJy3Joi9mnv+c5AyMkRNBSxnaawlO5HMoFTOCAIZxiBAEBm8mRRHVnVMWj97iRbtlzEI8IIFlK35MvfamHFVv/QWjJwhuh5/8IQ4vbcF+/P0oSPsFPG6L/RFgB/wlZHcPE4XOFlwJRm5/+oG28N1NznSMmp0h/vJb9/2QQ3BNwwsfS9k1HwAe3a3WUHwA0J6BMuYhES7QslPJaWj6y+Q1tkJKQd89cpGYqTUirspvf356ui+ZepyI6Q5aol2YS5vcwH0Vsign4mKxBxQfVLnx9Ea3DEb43PUkUqiDvzDXo+CmxBAgput3YUBD3GJVFd9KRD/CDTGYsSnTSxI/H+IJ3GJSc6SeQVM7ucfP7iFiPeoIVuKrSW/5q5iHyeKOAzt1sXAd8/S9FM8h81HMa+471MoRMbwxRoJOUH672vOmX7obcaG/ydZ8iuLxzvFMM8Jt9NER7YDjsnAY2uFXThNEdgQkL+pW6EznEfeajKmhqS/Mx9qiOi9bNFKeIquOCYRGHWlZfZLLi7YYW/tVWDyPPxAB2mlgjtQc1lQTQpjfMboJkvxboM2dzgrPg+S8hZYmXMomZbdPfzv47k7CBc38RvCaAPOzIxiKub4iOun48y/Qi4ny4CiXVay+Ld+G/rPzrasB03fFdaYGAJZQsaz7pEdZ+OzFsicpJqsIxXQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199015)(36840700001)(40470700004)(46966006)(6506007)(70586007)(70206006)(4326008)(8676002)(86362001)(33656002)(36860700001)(36756003)(40480700001)(81166007)(40460700003)(82740400003)(356005)(478600001)(26005)(186003)(2616005)(6512007)(53546011)(6486002)(41300700001)(316002)(2906002)(336012)(47076005)(82310400005)(8936002)(6862004)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 17:01:31.2633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e3d5ff18-28a9-4a77-325f-08daa3056c51
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 17:01:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171229

DQo+IE9uIDMwIFNlcCAyMDIyLCBhdCAxNzo0MiwgS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNv
bT4gd3JvdGU6DQo+ID4gR29vZCBwb2ludCBJIHdpbGwgY2hlY2sgaW4gdGhpbmsgaXQgd29ya2Vk
IGZpbmUgd2l0aCBnbGliYyBidXQgbm90IHdpdGggbXVzbCBiYXNlZCBpbWFnZXMgSSBzZWUgdGhh
dCBQZXJsLW1vZHVsZXMgaXMgZnVsbHkgZW1wdHkgaW4gcGFja2FnZXMtc3BsaXQgYXJlYSBzbyBz
b01ldGhpbmcgZG9lcyBub3QgYWRkIHVwIA0KPiANCj4gSXQgd2lsbCBiZSBlbXB0eSBhcyBpdOKA
mXMgYSBtZXRhcGFja2FnZSwgYnV0IGl0IHNob3VsZCBoYXZlIGxvdHMgb2YgcnJlY29tbWVuZHMu
DQo+IA0KPiBSaWdodCB0aGF0IHdhcyB0aGUgcG9pbnQgdGhlIGZvbGRlciBzaG91bGQgbm90IGhh
dmUgYmVlbiBlbXB0eSBpdCBzaG91bGQgaGF2ZSBoYWQgdGhvc2UgcmRlcGVuZHMgY29udHJvbCBm
aWxlcyANCg0KDQpNeSBwZXJsLW1vZHVsZXMgcGtnZGF0YSBidWlsdCB3aXRoIG11c2w6DQoNClJS
RUNPTU1FTkRTOnBlcmwtbW9kdWxlczogcGVybC1tb2R1bGUtY3BhbiBwZXJsLW1vZHVsZS11bmlj
b3JlIHBlcmwtbW9kdWxlLWIgcGVybC1tb2R1bGUtY29tcHJlc3MtcmF3LWJ6aXAyIHBlcmwtbW9k
dWxlLWNvbXByZXNzLXJhdy16bGliIHBlcmwtbW9kdWxlLWN3ZCBwZXJsLW1vZHVsZS1kYXRhLWR1
bXBlciBwZXJsLW1vZHVsZS1kZXZlbC1wZWVrIHBlcmwtbW9kdWxlLWRpZ2VzdC1tZDUgcGVybC1t
b2R1bGUtZGlnZXN0LXNoYSBwZXJsLW1vZHVsZS1lbmNvZGUtYnl0ZSBwZXJsLW1vZHVsZS1lbmNv
ZGUtY24gW+KApl0NCg0KQ2FuIHlvdSByZXRlc3Q/ICBVbmxlc3MgeW914oCZcmUgcnVubmluZyBp
biBhIG5vLXJlY29tbWVuZHMgYnVpbGQgSSBjYW7igJl0IHNlZSBob3cgdGhpcyBjYW4gYmUuDQoN
CkFyZ3VhYmx5LCBwZXJsLW1vZHVsZXMgc2hvdWxkIGRlcGVuZHMgb24gdGhlIHBhY2thZ2VzLCBv
dGhlcndpc2UgaXQgdG90YWxseSBicmVha3MgaW4gbm8tcmVjb21tZW5kcyBlbnZpcm9ubWVudHMu
ICBJZiB5b3UgaW5zdGFsbCBwZXJsLW1vZHVsZXMgeW91IHdhbnQgdGhlIGVudGlyZSBsaWJyYXJ5
LCBub3QganVzdCBhIGZyYWN0aW9uIG9mIGl0Lg0KDQpSb3Nz

