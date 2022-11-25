Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D257C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 15:50:19 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.76])
 by mx.groups.io with SMTP id smtpd.web10.50056.1669391411737712812
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Nov 2022 07:50:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=+BasFkkT;
 spf=pass (domain: arm.com, ip: 40.107.22.76, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9TuNEZHJ3STcDsFyNf7ZhNJGFS3rcMQbb4dkgBqlNU=;
 b=+BasFkkToznL0Lm3Ctpz8rm+4qgsN2KD+yMa5KK0zDxCC4x24LzAo5I6eFyNYHNJhFJjtkOyT28fawEsqHCaF6/z6JcVNGlq8RIiWeKDqACq4gEuuaCUQCXss+GSEo7vAH5ZkqZde9DCEkBohcf+i8WCTYxwUJAA0sswzE6zd7c=
Received: from DB7PR03CA0089.eurprd03.prod.outlook.com (2603:10a6:10:72::30)
 by PAXPR08MB7648.eurprd08.prod.outlook.com (2603:10a6:102:243::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.5; Fri, 25 Nov
 2022 15:50:08 +0000
Received: from DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::dc) by DB7PR03CA0089.outlook.office365.com
 (2603:10a6:10:72::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17 via Frontend
 Transport; Fri, 25 Nov 2022 15:50:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT033.mail.protection.outlook.com (100.127.142.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Fri, 25 Nov 2022 15:50:07 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130"); Fri, 25 Nov 2022 15:50:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 81d1234ddd7720a4
X-CR-MTA-TID: 64aa7808
Received: from ca3e8ba5df4f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 78E87F23-9DCF-4740-919D-5790D61E291B.1;
	Fri, 25 Nov 2022 15:50:00 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ca3e8ba5df4f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 25 Nov 2022 15:50:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ht6AbIfWMFSa9mDMpSccdJdxFThphhKUmHBLYypEBzVa0ZKay+a3lXQ0FgYUjbGvvfCwu1rZyTxOK9xGdAmfuON/OIT33BEb7xcSab5uMX+50RluI3/Gjc4Vb91INr0FgMPC6TPLoRj+VMyCOV+e5wHp/fm3hYVe+hMPAMixq9BWhwbFZdkRmRw5gmn5StSG51AKdKXzyk47+JqfqAq8uezhTZRaiVNBGngJyChOjOK/2IAcAQ/ufcD/l8XTBEPgExm75fMxN8drH0RynQiYcYmXaQQPTV+FzzhPKw1MntnpuZtf5zwJ2GUocatNU3q6nrwABeFhV0t83MGjPZgIFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9TuNEZHJ3STcDsFyNf7ZhNJGFS3rcMQbb4dkgBqlNU=;
 b=UZrCp3YoT+yBnzyZ5w9kcOfXEo/nyVjVtHwK1l++3q468b6PHSnEf3xi9hSEEWOe/nC7VsDSwjXwLDjRbDz+ng/DP4CJtI7qIiZv95BcjYaMnGZM952O+MraOD4tECOY3aBvvagF9H2Di5AB0zcEZsZyxQ1qFUm9r1Tu5K4hLmZO487yo0DPB6ifXeY5yMNgo9kWWlG/TJqeImWDzwXnO8tW48yWvNcvB7nbNFkKy7w1ZIGIxoa5fHjIWhDfTngReiRgNCOnYrSYbKebzkgW5TfWpmM1QROD1BTqCFTicGqjV0ONfR4DDVgW71xBizXm62/LzZie6sWnvUWHamWIsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9TuNEZHJ3STcDsFyNf7ZhNJGFS3rcMQbb4dkgBqlNU=;
 b=+BasFkkToznL0Lm3Ctpz8rm+4qgsN2KD+yMa5KK0zDxCC4x24LzAo5I6eFyNYHNJhFJjtkOyT28fawEsqHCaF6/z6JcVNGlq8RIiWeKDqACq4gEuuaCUQCXss+GSEo7vAH5ZkqZde9DCEkBohcf+i8WCTYxwUJAA0sswzE6zd7c=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7841.eurprd08.prod.outlook.com (2603:10a6:10:39c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.5; Fri, 25 Nov
 2022 15:49:52 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119%9]) with mapi id 15.20.5880.005; Fri, 25 Nov 2022
 15:49:52 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Zheng.Qiu@windriver.com" <Zheng.Qiu@windriver.com>
CC: Openembedded Core <openembedded-core@lists.openembedded.org>, "MacLeod,
 Randy" <Randy.MacLeod@windriver.com>
Subject: Re: [OE-core] [master][PATCH] tiff: Security fix for CVE-2022-3970
Thread-Topic: [OE-core] [master][PATCH] tiff: Security fix for CVE-2022-3970
Thread-Index: AQHY/ojuPvgBbRqfVkChYjW+kVm6ta5PvoeAgAACogCAAAzUgA==
Date: Fri, 25 Nov 2022 15:49:52 +0000
Message-ID: <858B27AF-9C9F-4958-B2CF-3DEC91F7F2A8@arm.com>
References: <20221122153757.2287659-1-zheng.qiu@windriver.com>
 <33BDDCA9-7B36-48B1-AC53-E2E15B04CD77@arm.com>
 <99704AC7-7EF1-465D-BBF0-FC74F18DC6C4@windriver.com>
In-Reply-To: <99704AC7-7EF1-465D-BBF0-FC74F18DC6C4@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7841:EE_|DBAEUR03FT033:EE_|PAXPR08MB7648:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a892d19-292d-4fd2-b904-08dacefcba4c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 DKjF+m5Pbb2syTMxdFq9Hb4qRwy6h+620TgCIpOMksIkHmfnmaPqHshxIf12rXHgXnpF2nVpcN7DIa9AQZFrsbl4cDCD1lyr2qkxRhRYjlfRsjRAcTo32ABSKxlY/QXVtE/JIyrfHIUQzGaxSb8DEYxM7yUjAr8ab9BtWjX8QAZdp/582/xGcxPNtjCbNwaSHB/UqdKCScXqrD8LBqZdH6t3hhYCLRT70oN5Mk3jalkdFgj0aEJQ7guxXKIeUq7tSTREJzJWibOUhXldpeUXhJCC+yluEBUyKdMOyW14Ol93Svbm7zSgu3aW8r7BRobiSY+n5bcvAWskRkS5c9J9AphQzeVc6ygfPjgSw32OOZZkY/7i9Dyd4DQXCUS7sPB48jEvRH4+sdqUyftYTvS9OA3WpHaiCuNGzuH9G4SHaLmERfpPeyexaJ+d17MgCJCuYc5hgzJPxZOATa6R8IDl2NWaiuzbYcFADkQLA0Adp4Aq4RUQReOuDPfS59hpo0tl0n1NyYYcD/Hg/RqOuzCdgpByKYrFYdLSpPyIvoGUwHLp4NfgHrW+ltdh2+38/Vg/qtf4meqOCSxzghJNO8yNWWV55/1KiIZ3X+F5tWcpYEO59jBGPzdy5ol8iN+sp9dWtKtkY1XInKvFBcQtfEmOBIkY9ABKg71wXhAclpaUqC2HfKDJBYrF5IiMLcktcPylQk+nFoESBfGS0suwwidWh9WXbPR7MFv8H1tkIk5HPQc=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(451199015)(2906002)(122000001)(38070700005)(8936002)(4744005)(41300700001)(54906003)(26005)(36756003)(6916009)(316002)(33656002)(186003)(2616005)(5660300002)(86362001)(6512007)(6506007)(53546011)(478600001)(76116006)(38100700002)(91956017)(71200400001)(64756008)(66476007)(8676002)(66556008)(66446008)(6486002)(66946007)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8377A9608869146BC967036B766385B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7841
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	36e4aec1-f417-48ba-8cd8-08dacefcb0e1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	agjz7+tGlRfo5Nla/8wqcOuEoX5CDA4AB9WEGvlKHHNfC59yZ/halDmn7DpEvkKNxPhF0fYvtT2uXChgKCW45Fy9mcC1n3E7rGb4qOr20XxkYJEN3OiGFHr3rnfSQYe+ei3SvRXc6t4s/Hj2wfl30L3JBbo3slfubbMacObDd/7wbPJjXJZxL3bhhEzjVwOMiB41MlJcCl09UWp3O/LTaNFhEj0BvCmEMmYDZyc6dahFQ9PTTvTVdDfeINlJfW6Ye0bR1OP84lc+/wzgEhk37jv3ndsl2cbokfmTV3qbR+t6OjOLIgJwGB1+wa9MOfhht32i1rTjk+VtZjfbUUCrD37pDE0UIng37eQPjBXmFiwIuH1zpDrXTId606G1cxdl8Hzd0eqBJSL7UErZZB1q8F/jaXJ4ByyypxnxyQYCKZz/+PiF85rNBzkPbDeJQ+GDP4QPAu4XVo9pCyy2mT2Ld4wWSvczMNZV14w3B5o17sewzULJtMaOlMf5wBQ6DG4JF6w13iHfVrvCrI0wTI6/UvStins70nCwgVL4lMNcyNfhABkdBZyOQIjKS1RK8xJ425Q2O3lfh7uxUXijXYrNJPvxQncOzr/ZYmSwtxNgdJLfTCLAzYjDEkRc8cju5RrDBCsJWBAaAtpBg3tGSasTpAAjNvEN5CQ6W5oseHy2LsVz7GoVRXGugfQli3IARSEXhMCMdD7KPJ5tRE/CMo4rHw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199015)(40470700004)(46966006)(36840700001)(2906002)(4744005)(8936002)(6862004)(316002)(41300700001)(54906003)(36860700001)(40460700003)(33656002)(8676002)(4326008)(36756003)(478600001)(6486002)(70586007)(70206006)(5660300002)(336012)(2616005)(186003)(47076005)(26005)(6512007)(53546011)(6506007)(82310400005)(86362001)(40480700001)(356005)(81166007)(82740400003)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 15:50:07.8860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a892d19-292d-4fd2-b904-08dacefcba4c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7648
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 15:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173773

T24gMjUgTm92IDIwMjIsIGF0IDE1OjAzLCBRaXUsIFpoZW5nIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxaaGVuZy5RaXU9d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gDQo+PiBPbiBOb3YgMjUsIDIwMjIsIGF0IDk6NTQgQU0sIFJvc3MgQnVydG9uIDxS
b3NzLkJ1cnRvbkBhcm0uY29tPiB3cm90ZToNCj4+IA0KPj4gbWFzdGVyIGhhcyBsaWJ0aWZmIDQu
NC4wIHNvIHRoaXMgZG9lc27igJl0IGFwcGx5LiAgSXMgdGhlIENWRSBzdGlsbCB2YWxpZCBpbiB0
aGF0IHJlbGVhc2UsIG9yIGhhcyBpdCBiZWVuIGZpeGVkPw0KPj4gDQo+PiBSb3NzDQo+IA0KPiBJ
dCBzZWVtcyBsaWtlIHRoaXMgQ1ZFIGlzIGZpeGVkIGFmdGVyIDQuNC4wIHRvIG1lLg0KDQpDYW4g
eW91IHJlYmFzZSBhbmQgcmVzZW5kIHRoZW4/DQoNClRoYW5rcywNClJvc3M=

