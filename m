Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B8C8CD6E52
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 09:19:10 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.51])
 by mx.groups.io with SMTP id smtpd.web11.12560.1697015947033225337
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 02:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6tZHYsUH;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6tZHYsUH;
 spf=pass (domain: arm.com, ip: 40.107.6.51, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCVvc8I6uJgy9Dh9ixUULgh6E6lsZ6eW28VRJpI5Mdg=;
 b=6tZHYsUHp+Sq37TdczH6h7B1BlY0wgw2hXf9Hw353sQPEqrbzZI/7XNb59FU9q1zBQKxTB7uAapV1qkbFA5qFLemF4RgcIgmU3FSED8p90SQGn0MpQlmGVn7iq/s259SnqcQtJ+3i13Ac8ib8GkJuOkqJYTkT71PnODISnSTJk0=
Received: from AS8PR04CA0076.eurprd04.prod.outlook.com (2603:10a6:20b:313::21)
 by AM0PR08MB5411.eurprd08.prod.outlook.com (2603:10a6:208:181::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 09:19:03 +0000
Received: from AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::c2) by AS8PR04CA0076.outlook.office365.com
 (2603:10a6:20b:313::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.27 via Frontend
 Transport; Wed, 11 Oct 2023 09:19:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT028.mail.protection.outlook.com (100.127.140.192) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.23 via Frontend Transport; Wed, 11 Oct 2023 09:19:02 +0000
Received: ("Tessian outbound 6d14f3380669:v211"); Wed, 11 Oct 2023 09:19:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b4da89afc2407ce5
X-CR-MTA-TID: 64aa7808
Received: from bb1242666d28.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C685C6C2-7720-4395-87BC-ED31C9429AF3.1;
	Wed, 11 Oct 2023 09:18:55 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bb1242666d28.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 11 Oct 2023 09:18:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDtnLaI5MebfOwjAEIx5jDVjAwn8p6fGf+bM2U+B9kyg0lqS1fUMtoLe4SD0yc80NT3Hsvz7I7y58pgTV6xJlCrF0cNZc0yt4dSf2XUjv9g4oO8AtuS07RZ8MDE84Wb+Q8L9nmMp7WMqXzxh1OKZJJe9zKueS2SUzihUJ2alMGMhcz+0Jd6ny0ORUVA/93NBhqSDQL/bkTRz4rDtn+YJIvr+d0I+GPQuqIWsDbyjqqS+K7WzbI9y40U79JNP/yaRmTcNShaoEEzw2O94co8QIYNdisa5Op87mtVxEiiZY81mBPWHE3c0LEOGloVURuCao/H1kSC/vpgZpA3dxGsh+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCVvc8I6uJgy9Dh9ixUULgh6E6lsZ6eW28VRJpI5Mdg=;
 b=TfWMX6bzdXvOlM85OFfwhlifmiEz+Lo5cFUqRYEc/XOBaVbKMi7bVqrHo0zk5kcworW7KDouvuDkJVDG9NGWANgceChIt/k9UfVx/2gmQ8lcv9/3xRDpT1KadeR4w7b/mtWnZ51xUj/tQoooOyLSL8agrjtDr7CmvO4nJxEVM2SzrpbOLO1daUNBRbG9pO1RcVJa6UprK4cPyGV3QVDKxXig10dFQ6pxyfkDsZDv5IBOfSC3KzJUCJeqxBXhkxG+TigNpVn0GukQWioPYUHm72mbnzk9hW4I0hXFHtL5gZLAj8R3nmdiXg4HWjb0eaV2oON0yA9zZ95gVY25hmMSDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCVvc8I6uJgy9Dh9ixUULgh6E6lsZ6eW28VRJpI5Mdg=;
 b=6tZHYsUHp+Sq37TdczH6h7B1BlY0wgw2hXf9Hw353sQPEqrbzZI/7XNb59FU9q1zBQKxTB7uAapV1qkbFA5qFLemF4RgcIgmU3FSED8p90SQGn0MpQlmGVn7iq/s259SnqcQtJ+3i13Ac8ib8GkJuOkqJYTkT71PnODISnSTJk0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9083.eurprd08.prod.outlook.com (2603:10a6:102:325::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 09:18:53 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1817:56f3:7623:c4a5]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1817:56f3:7623:c4a5%4]) with mapi id 15.20.6863.040; Wed, 11 Oct 2023
 09:18:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "sundeep.kokkonda@windriver.com" <sundeep.kokkonda@windriver.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] rust: reproducibility issue fix
Thread-Topic: [OE-core] [PATCH] rust: reproducibility issue fix
Thread-Index: AQHZ+/hTVDwnVQ/7eEWUAkcAllT5DLBET+oA
Date: Wed, 11 Oct 2023 09:18:53 +0000
Message-ID: <D4BEC814-90ED-4CA6-BDE8-1C034255B305@arm.com>
References: <20231011040550.1392831-1-sundeep.kokkonda@windriver.com>
In-Reply-To: <20231011040550.1392831-1-sundeep.kokkonda@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9083:EE_|AM7EUR03FT028:EE_|AM0PR08MB5411:EE_
X-MS-Office365-Filtering-Correlation-Id: 8691f899-fc3f-43a6-981f-08dbca3b1c18
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 a+rdqbiaZQMdcUEAMFe/D75oB6X/Rw9pNO6tJj5twThoRXTT+B8/UOnvh5Qb6YUznfo6QOJUbsPHzMmPm3E0TvMWf6B6Dk2GeG36up4vSxiuXopgEWnQNA1bwJFblqzwSfQCA1hkOkSMKe2JFrtHdJerkg8LVpOhBUuBBtpprXNHAOvHtFRIrNbkWQI2cdubDzvi7tbhxSUeKXHONG8I6KDYsjJBP0At8ppMILGA+/1g7Twos9/fEc3jkjAY8HTv6v7s9b4w7q2xL7W07jgj8lovBgcJPmo6TT8qNbxq+1jpKMR8/Y5Ha1sD8gmFEn/Dk4c1Y2YaKfJP+RlSC6JQmU0Ob8I/2R+YYgG5HSqz1W5GWvduNJHvXO2LNIA28s2uNK5XsX+gRwBP6H/D/rp4JjfQ7uf7PV22l5crW6gSLOJN9RR7XmQcf1vifOckyp4xMbP78H7XA7Hh0cJS8rhrEn5SkZcrGxsE6gYAu3ntq9dMliIkAmlqYw3PcMVzGZoztO48zEbYFh9VD+qNItwvh4JxiQx8mEHe2eY51qgyfzFfgn1NeI+ZWTav53MFdlj6P2o+l7kBwnvAUJbuxFH5mx8MoIN3kot5Xzf+pkryQIsLNowSviUPjtXSFk5TFyIxdGWk5DjiT7V7KYRZTJcXig==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(39860400002)(136003)(376002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(66556008)(53546011)(6512007)(33656002)(86362001)(36756003)(38100700002)(38070700005)(122000001)(76116006)(2906002)(4744005)(26005)(6486002)(6506007)(71200400001)(478600001)(2616005)(66446008)(8936002)(6916009)(4326008)(41300700001)(8676002)(64756008)(91956017)(66946007)(66476007)(316002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D558CC705EF1524D9ED4616B60ADF0B6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9083
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1cd137d5-d4fb-4005-21d7-08dbca3b1664
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UuKsgLBVK1Y5tcv0Oa91fvAoc6kywkWAVp/6n3aj7AF6Ot1EVbIkZk7WUELBaKiWgjzOBwqNIUrqOqGN8swJWG8U1+4tuP3+wSgbO4gspGvpCFh3DqONryNnWvvSebGRsISMbkPx4fzk4csseApCdXzjF00rGR3m74t8YsshS44eN/p/IeI4iqCbMoaPrbQsLy1VbZZsL/I108i+VOfNWyqYetwl+FC1CCA0pDSq7F1SK2VKQI4hHMwMlUsVMqxAYG3IE7eN07Q3Q06v2GhMxjZ7fyFga7fy2T9gvwR867rMxaYgvlSrgHAlqRdgUCfBCZYuAPHL5z9odrTNRXEK9xQT94Rj/J+vjCxS48ygbBgxiBj6C1yJ9R3IA1Yh4MRnESrBWsRA3kv7DXB7nbuUUyGa+PR+9Vc7hPhoaYSIn4qTEFE1LABWOPbRJZkqjyeItHt3tYfTWc2rINerHZIzkVk4H25iQWPrmuLKutjsV76zf+YEHYeLu8E1o1D+99RCJc7l051JqKd0aMxZt7VpZEYYYUe+goLn2ZzkPrCXsALHIl/S+Ahew1hYGY15kXyLBrgLxHiglspieB0FHDrrFltij12CHKEUkusVd9lzve7RaaM3ngKLhoVEVZbzBHhaXgZSljNiRTeVPRmmjWQF5ZFS2IJb+/HvaRcmNR+18/0HGBrWmF8onB+f0IUf6hbUAhykSFL+S1+XBV+flIKxC7tc6ENGBYx6JjMcAZntRdUlUJusYVGYgfllFBVvnXSN
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(82310400011)(36840700001)(46966006)(40470700004)(41300700001)(316002)(70586007)(70206006)(4744005)(5660300002)(6862004)(8936002)(2906002)(4326008)(8676002)(6486002)(478600001)(40460700003)(6506007)(6512007)(40480700001)(33656002)(36860700001)(2616005)(36756003)(47076005)(336012)(26005)(81166007)(356005)(86362001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 09:19:02.5687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8691f899-fc3f-43a6-981f-08dbca3b1c18
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5411
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 09:19:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188953

T24gMTEgT2N0IDIwMjMsIGF0IDA1OjA1LCBTdW5kZWVwIEtPS0tPTkRBIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxzdW5kZWVwLmtva2tvbmRhPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBbWW9jdG8jMTQ4NzVdDQo+IFRoZSAnLS1yZW1hcC1w
YXRoLXByZWZpeCcgb3B0aW9uIHJlbW92ZXMgYWxsIHJlZmVyZW5jZXMgdG8gYnVpbGQgZGlyZWN0
b3J5IHN0cnVjdHVyZSBpbiB0aGUgZGVidWcgaW5mb3JtYXRpb24gd2l0aGluIHRoZSBjb21waWxl
ZCBvdXRwdXQgZm9yIENhcmdvIGRlcGVuZGVuY2llcyBhbmQgdGhlIHByb2plY3QncyBiaW5hcnku
DQo+IEhvd2V2ZXIsIHNvbWUgcmVmZXJlbmNlcyB0byBidWlsZCBkaXJlY3RvcmllcyByZW1haW5z
IGluIHRoZSBmaW5hbCBiaW5hcnkgaW4gLnJ1c3RjIHNlY3Rpb24gaW4gdGhlIGZvcm0gb2YgY29t
cHJlc3NlZCBtZXRhZGF0YSBhbmQgdGhpcyBtYWtlcyB0aGUgYnVpbGQgb3V0cHV0IGRlcGVuZGVu
dCBvbiB0aGUgZm9sZGVyIHN0cnVjdHVyZSBvZiB0aGUgY29tcHV0ZXIgaXQncyBjb21waWxlZCBv
bi4NCj4gU28sIGZvciByZXByb2R1Y2libGUgYnVpbGRzLCB1c2UgdGhlIGNvbmZpZ3VyYXRpb24g
b3B0aW9uICdyZW1hcC1kZWJ1Z2luZm8gPSB0cnVlJyBhbG9uZyB3aXRoIHRoZSAnLS1yZW1hcC1w
YXRoLXByZWZpeOKAmS4NCg0KTG92ZSBpdCB3aGVuIGxpdGVyYWxseSBtb250aHMgb2Ygd29yayBy
ZXN1bHRzIGluIGEgb25lLWxpbmVy4oCmDQoNClNvIGdsYWQgeW91IG1hbmFnZWQgdG8gZmlndXJl
IHRoaXMgb3V0IQ0KDQpSb3NzDQoNCg==

