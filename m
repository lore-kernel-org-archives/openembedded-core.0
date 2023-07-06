Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB21EB64DD
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 14:50:50 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.85])
 by mx.groups.io with SMTP id smtpd.web11.26039.1688655042305957465
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 07:50:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=0jNiQITW;
 spf=pass (domain: arm.com, ip: 40.107.15.85, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nucx6AdsPUisYSIpZKpC/DPdXcV9RSZaZH910exjaFs=;
 b=0jNiQITWP6jz1lv4KE/qI7OlIiw3OKIRx3BAh48p8Nt/flD/Tgk+sqdtY2xY9tYru8Pr4ZGowQ4i6vvUHzbSFZ9ekblufSO3QC7ZuXZ02kWpUs8MhgD+OC2VLwC8YTKmA/H7QB1z8GFxi7RaI73I758blaJfkqc2jmNcZxQmzXk=
Received: from DB8PR04CA0001.eurprd04.prod.outlook.com (2603:10a6:10:110::11)
 by DU0PR08MB8376.eurprd08.prod.outlook.com (2603:10a6:10:407::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 14:50:39 +0000
Received: from DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::46) by DB8PR04CA0001.outlook.office365.com
 (2603:10a6:10:110::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Thu, 6 Jul 2023 14:50:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT062.mail.protection.outlook.com (100.127.142.64) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.24 via Frontend Transport; Thu, 6 Jul 2023 14:50:38 +0000
Received: ("Tessian outbound 546d04a74417:v142"); Thu, 06 Jul 2023 14:50:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 509ec7a8d50e2b15
X-CR-MTA-TID: 64aa7808
Received: from 90c572f775db.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D20D393C-950C-4E67-BC50-DC56958CB90F.1;
	Thu, 06 Jul 2023 14:50:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 90c572f775db.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 Jul 2023 14:50:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bxp7EhUbkS3lj4tiPrigAO51MJjAU2AIz6MehEfpbHCkZIPDB0cZdtIj2cVJxAxZAFve+2+zuJ32Xqa+lM7hMUOzRgcs/FKEulrTXVmE/X3GQRdjrrpucVTE0WgxNKC5qUHlJ7Yjp4oHpywaeXlBgUwCWHiukMk1vsssLxS7vST287KUAnICagZe4ov6koe0GtfvAtcF1gAlusAPefOde5OEfktmRO/dRe0ZnIfD2DvyghSKSXVunvOHIVEkVvfs/71i0PnnYU90xboPzSom2+bPDDnzwKUzUbpnl/mrJI5HX4zlUT/5qzUjAyXDlSE7VONlxlXWrVsYHEZMXkiHLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nucx6AdsPUisYSIpZKpC/DPdXcV9RSZaZH910exjaFs=;
 b=Z0Kt/5NlvyXYihQ2W5c9I2A8M07+bZZ3SWuorJDrqOlsTr/DVyleOvMchymkU+ccF+TWgxmZTL0+VMpa3eLB6Volu7wikwv/x6eBdg46r4ngOwWk/ENTFad491sR6QZ2a5dGzHZfJcQVscairJ5gt7WnJ8LJZS40aFzQRA+Arod6r6vEkjiEqToAf9LeTq2hpcn8f1PKEel848y3zXdHQ9rb6aJq5herc5b8n52c1RBF/Re8JWb6LFSCNfuFX0sOCWS08WvULGpFFR/OxXXzPPICeqfiOBGxlHQkG9snG1Q74K3AEsx78kZ4DKf1UOiZuzT22sy4uctMjvdyxjK73w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nucx6AdsPUisYSIpZKpC/DPdXcV9RSZaZH910exjaFs=;
 b=0jNiQITWP6jz1lv4KE/qI7OlIiw3OKIRx3BAh48p8Nt/flD/Tgk+sqdtY2xY9tYru8Pr4ZGowQ4i6vvUHzbSFZ9ekblufSO3QC7ZuXZ02kWpUs8MhgD+OC2VLwC8YTKmA/H7QB1z8GFxi7RaI73I758blaJfkqc2jmNcZxQmzXk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB9360.eurprd08.prod.outlook.com (2603:10a6:10:3f0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 14:50:30 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 14:50:30 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "tgamblin@baylibre.com" <tgamblin@baylibre.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] python3: disable test_cppext ptest
Thread-Topic: [OE-core][PATCH] python3: disable test_cppext ptest
Thread-Index: AQHZsBA6VP/6Vfn9WkaKMEAve8qofa+s0j2A
Date: Thu, 6 Jul 2023 14:50:30 +0000
Message-ID: <77240D4C-769F-4AE2-9D89-7308ABB9761E@arm.com>
References: <20230706134556.2824413-1-tgamblin@baylibre.com>
In-Reply-To: <20230706134556.2824413-1-tgamblin@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB9360:EE_|DBAEUR03FT062:EE_|DU0PR08MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: 43bb56fa-4922-45a0-9376-08db7e305d14
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 xHZurF3lQQPBgUuSZ6CsbsRnJeL6bRjmGZaPlz4ald90a2PiJHI9eXScflTNpJKVmRbMsJ282wtcI2Jt6HD0RtjTKWbnOCqULg9yQg5yZ424KAdx3QpSzy9uW2PTBvoYVJIXqz5XR3lmlcRvCWGCkD72JGrSbtex3RgzWaGkslAVwn9vGebN+aUpPEUdc2LUqOxGLBEv9D+HNIB4Axm8lUj0EaAjvPa2N+I6aiRLuUoC1p6b9h1D3/UJZoE25Tr1lOAu7ht01yjpyclovNvKAofuOGPcxUo1JydjFpjaTVnl764m7i86WRgv7hGRcTfgC1g6Zr+GjrZJsJ/c6pW6ND6Lm69ETa+bOGy/s+oHyezpS0RKc3x8izJJuQv6fPxCbTWq8UhwNyS7OeXr7Fcdfm8940JDs+evWd0+za40yuEV3MvM7PWyDhdv80WOjBQakoBp0UxJflNX4XODe0VBQf34IG/1qXzvHwz8WJtL4hZq2lZ9Mxb6ashXpTdeEl+VcYSnJrrxAld9nRLWPxyabghYifLqKt23EcId6ZK0KI+ic20Nf7Gfp1GPmxywXvsTiFctB03Us1lnYHajQ8umyRSoniKqPR8A/qD1eNSEkBdFDRcFBmI+oQiBshl5Yw4JrKHg+vfWkm/X0VBYurBLvw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(451199021)(66446008)(5660300002)(4326008)(6916009)(91956017)(64756008)(66556008)(66946007)(76116006)(33656002)(66476007)(2906002)(316002)(36756003)(8936002)(8676002)(478600001)(4744005)(41300700001)(6512007)(38070700005)(86362001)(6486002)(26005)(53546011)(6506007)(186003)(38100700002)(122000001)(2616005)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D373F8560771B94489F10B1F67FB3A77@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9360
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	83450036-c86a-4763-0ca6-08db7e3057ea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pxW2wOk6ygebmq3UEmOxX9raDC88rcidSYjXKNexJXwQSf/q6VJDX5IkL8iSQR+dVhlR899s9ncd3ghOes+XYpB4Tb1oEZtpCJW8yEjZuaFzRZfx6EWoXhmXU7ZsJ172c/4+nJ91BL9xsC8es2/BXiNxegTvPL1HNcR9civlTAaUDVAnaqbY/I2VJi0D9pcmM06sfzZGrc4WVOf5+DK/TifgMWaGkyhRwkCT0m7CD3G+Ralq+5Dnl/RZWpf+2IwSoS1xVu66RJTqIJnLb4D1dKZIIFG2ydQMYJa/WPdIHvAYCqtuPjSRykqbqBpehE4vOkPwJsiayt+fUhVt04ud5EuKF4rjvUT9NBhoofsymGzkbwFVctRzqILtaIDBQ1NM3NKSMOV9Kpx5i96Q0C+/qUrmk9VoYxv4junchh3kZvEDnI5qpu3cIDH3P2lcmXLgXgzwdQ1+Pg1ydUZpenbayLQO5Ba+BqWbu5iRuVWVNY4hNiwBHc6+xl6ylLbpmYT5FMCc2lbcuHM4QsYT3jtWOavMwansMNbf4LbIVyXccYCfBLmM1lizNa3LJUdFcktryVTdKpakAJvOVap7YeYNhhOSySveP6nD75+CxC/tkACFGpdPr4FCdJIVlz8f8RRb/2rWVSxnrxqKxGuUSk1w6+caFA2EGwvot0KhRF3Aafjvfq7Hd86RoBbucVz8ltKMGxLn3OXAfwfOULwRvXLf6R+RfDuMvDNTXlriYC9YBKk=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(478600001)(82740400003)(336012)(53546011)(6512007)(186003)(6506007)(26005)(86362001)(2616005)(6486002)(81166007)(316002)(47076005)(356005)(70206006)(70586007)(4326008)(36860700001)(5660300002)(8936002)(8676002)(4744005)(6862004)(40460700003)(41300700001)(2906002)(40480700001)(36756003)(82310400005)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 14:50:38.8060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43bb56fa-4922-45a0-9376-08db7e305d14
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8376
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 14:50:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183952

T24gNiBKdWwgMjAyMywgYXQgMTQ6NDUsIFRyZXZvciBHYW1ibGluIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDx0Z2FtYmxpbj1iYXlsaWJyZS5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+ICsgY2xhc3MgVGVzdENQUEV4dCh1bml0dGVzdC5UZXN0Q2FzZSk6DQo+ICsrICAg
IEB1bml0dGVzdC5za2lwKCdyZXF1aXJlcyBnY2MsIGcrKyAtIGV4Y2Vzc2l2ZSBmb3IgcHRlc3Qg
YnVpbGQnKQ0KPiArICAgICBkZWYgdGVzdF9idWlsZF9jcHAxMShzZWxmKToNCj4gKyAgICAgICAg
IHNlbGYuY2hlY2tfYnVpbGQoRmFsc2UsICdfdGVzdGNwcDExZXh0JykNCj4gKyANCj4gKysgICAg
QHVuaXR0ZXN0LnNraXAoJ3JlcXVpcmVzIGdjYywgZysrIC0gZXhjZXNzaXZlIGZvciBwdGVzdCBi
dWlsZCcpDQo+ICsgICAgIGRlZiB0ZXN0X2J1aWxkX2NwcDAzKHNlbGYpOg0KPiArICAgICAgICAg
c2VsZi5jaGVja19idWlsZChUcnVlLCAnX3Rlc3RjcHAwM2V4dOKAmSkNCg0KU28gdG9ybi4NCg0K
Rmlyc3QsIGl04oCZcyBwcm9iYWJseSBiZXR0ZXIgdG8gZG8gdGhlIGV4Y2x1ZGVzIGluIHRoZSBy
dW4tcHRlc3Qgc2NyaXB0IGluc3RlYWQsIHB5dGhvbjMgLW10ZXN0IHRha2VzIGFuIOKAlGV4Y2x1
ZGUgYXJndW1lbnQgc28geW91IGNhbiBmaWx0ZXIgb3V0IHRlc3RzIHRoZXJlLg0KDQpBbHNvLCBp
dCBzZWVtcyB0aGF0IHRoZSB0ZXN0IHNob3VsZCBiZSBza2lwcGVkIGlmIHRoZSB0b29scyBpdCBu
ZWVkcyBhcmUgbm90IHByZXNlbnQsIGFuZCB0aGF04oCZcyBwb3RlbnRpYWxseSB1cHN0cmVhbWFi
bGUuDQoNCkFzIEFsZXggc2F5cywgd2XigJl2ZSBzZXZlcmFsIG90aGVyIHB0ZXN0cyB0aGF0IHB1
bGwgdGhlIHRvb2xjaGFpbiBpbiwgc28gSeKAmW0gbm90IGFnYWluc3QgYWRkaW5nIHRoZSBkZXBl
bmRlbmNpZXMuDQoNClJvc3MNCg0K

