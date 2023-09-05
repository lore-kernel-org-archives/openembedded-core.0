Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35191C83F2C
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 11:14:52 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.75])
 by mx.groups.io with SMTP id smtpd.web10.18737.1693912487427102283
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 04:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Cfkuq7Df;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Cfkuq7Df;
 spf=pass (domain: arm.com, ip: 40.107.21.75, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cc9WgN0Qd7MX8gI83uDXplPAGYhdP2WgKeTnnQRt2Q4=;
 b=Cfkuq7DfwCL0xtzZzRxTZYYnG51y1a0yhyygR5deL5U5C1ir9fhNKzIwoIIjmGKadYZp27uyA6Zhusktl9u1Xh+Nh5PG1qH2DBFNs6gz8srVUq5rNuxlvSZ6W3Fe5hmsOecr5NOlqRuOZmppgZMvfry/74gBqY/wWz0byYkHc04=
Received: from AS9PR05CA0311.eurprd05.prod.outlook.com (2603:10a6:20b:491::28)
 by PR3PR08MB5803.eurprd08.prod.outlook.com (2603:10a6:102:82::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 11:14:43 +0000
Received: from AM7EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:491:cafe::35) by AS9PR05CA0311.outlook.office365.com
 (2603:10a6:20b:491::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33 via Frontend
 Transport; Tue, 5 Sep 2023 11:14:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT035.mail.protection.outlook.com (100.127.141.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.25 via Frontend Transport; Tue, 5 Sep 2023 11:14:42 +0000
Received: ("Tessian outbound d084e965c4eb:v175"); Tue, 05 Sep 2023 11:14:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: af982899a851c3a2
X-CR-MTA-TID: 64aa7808
Received: from 20c83f3d0ae6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 23F983A8-31B4-42E0-9D7B-511BDE2D7F90.1;
	Tue, 05 Sep 2023 11:14:36 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 20c83f3d0ae6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 05 Sep 2023 11:14:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLcpJKi0KkHVuK+HyHagP9+lqAq4pi9fy5kWA+0bnKgoedjnoNlxpdt8r/G+jXzjWb152tdzsqCUjiHBUT4Qt1LaUXJVf2ihbn/J4yb5h9yUXvz0NRMlr8TZW2rHnYKV8YGEowi7ChJn670xYqBWQ22CJTHc5TzEX8kzstQpXB/BTbdKRtkuAozLFFve7EGqqZtHbshJHFU4lJey6wEpGiTiVpAFOmTKPY0+a/nxd9PWkB00v8mn8c+gxXJqd3K6ruuNltgp1SefTP3+xWNmW0STYjJ/IDSoIkk8gcRZmS8TNQAnVZs+pCUuzfslArfUjPPCx/D90Hy0EKfkkk2xPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cc9WgN0Qd7MX8gI83uDXplPAGYhdP2WgKeTnnQRt2Q4=;
 b=fyUOKoZbzTEB837ejZhRlmPlTZdRkcddtPi0yDwBiX6F4yMz3ZaXYGAbYZod75J4V/xBPcKQz00BaKrXjGYd5VjEMy9Hn2HLnQi2sJojw4y6gPXEKxhyVVhJCJ+6X34AZt5EFX1Of8njTLjVhT9yE5nCebNLdrr8pz1q0KUhDktqFByOZ3cia2MZbnfmYNfPoPw8AMhBEBvIqrSyDhFCtrLQwD7HHSkiie2UVxGHL71vaVW3iqoYCVKHOWDaAJNODJPnVe3ppV5XOA+V8XjlHqhKBRjNBjEd6EaB6plbbwrUK4ACOGEvgkWrIkT1lVnQEyNhejEBYepW61iNRwScnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cc9WgN0Qd7MX8gI83uDXplPAGYhdP2WgKeTnnQRt2Q4=;
 b=Cfkuq7DfwCL0xtzZzRxTZYYnG51y1a0yhyygR5deL5U5C1ir9fhNKzIwoIIjmGKadYZp27uyA6Zhusktl9u1Xh+Nh5PG1qH2DBFNs6gz8srVUq5rNuxlvSZ6W3Fe5hmsOecr5NOlqRuOZmppgZMvfry/74gBqY/wWz0byYkHc04=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9572.eurprd08.prod.outlook.com (2603:10a6:20b:608::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 11:14:34 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 11:14:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Yuta Hayama <hayama@lineo.co.jp>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] linux/generate-cve-exclusions: fix mishandling of
 boundary values
Thread-Topic: [PATCH 1/3] linux/generate-cve-exclusions: fix mishandling of
 boundary values
Thread-Index: AQHZ38rneEAaKASlD06cB4kT83ofHLAMFKmA
Date: Tue, 5 Sep 2023 11:14:34 +0000
Message-ID: <C799CA2F-53A9-47A7-812A-73DC55F64073@arm.com>
References: <20230905072920.615-1-hayama@lineo.co.jp>
In-Reply-To: <20230905072920.615-1-hayama@lineo.co.jp>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9572:EE_|AM7EUR03FT035:EE_|PR3PR08MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: dde3ada4-1d2b-4163-f6c3-08dbae014e05
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 p97QhWxNaMXOuIH5gO/Bg5ZCOk6s86rHiK4JjEPyhXtdVJu8+5EiRcbhgrbcxrggTkTpWrd1NgZ0oHIBxT27TDFME5geqJ/zR5r+xNSLWlKkXqRTIYKoM2aBQqJeyG3plGC77gITTeqv2AcbOyyQRnsMh14OfUx0p4Yzp2qX+xkG26yMa0MqQlVeVXovr9B4KyhsnAYvYg5/Jhf8YA0vRAP5trGlvASskf6bL9Gg+bA/ORJuV/7C0vBz5DTVt4DozLsmXaARR1TyMKJJLnY6/hM3h40Tl4dr86F7zk6QhNen4oXRnHPQRIxZ80hPn4iDT+S0EcipzNMe0VajLeOQ1nO2kMRYv5rgi3F9sh2OPcz1jPI4dr06XCc7fNhndzC52jhrTR6YRTGwHnxe5n0+GC4W1hUsEGG1iq7apBx2D6XnI+iwZ2IGwqIEIZbGYe74CCzHZmtjaVnQcR6CzKpfqRcYyhOsQOsfvhN+x9gEJ61fLunaPBcteWW7o43MwN6LBqmcrgBOrqVmjxHxn0ioWBz8S/yc+nNn0zuNe29PID2TlysyZunuY0EhYRIPCaya7+Vi9XP7cK1+SALU4Q/OIUHoyBx8xRXaRf19mwudYGVa8pk4NjVbMhLslWfAv31UwpHyqtt7ZYBy7oPLcUfffQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(366004)(39860400002)(1800799009)(451199024)(186009)(41300700001)(122000001)(71200400001)(33656002)(86362001)(478600001)(38100700002)(2616005)(83380400001)(38070700005)(26005)(6512007)(53546011)(6506007)(6486002)(76116006)(66556008)(66476007)(36756003)(64756008)(66446008)(2906002)(91956017)(6916009)(316002)(66946007)(4744005)(8936002)(5660300002)(4326008)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <95D1F8DBC5C6E24CAFDA21B6111B27A8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9572
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0a8b3c5c-06d2-4737-7e4f-08dbae0148c2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RbWBL7hsLpq4DTp+vM2Zm7LJkYu72Iq4gvgTPVWmUwzPdwsHuJaKMyv9LoZHmUCh/qPI1KHFLE+f41G7ivx2Yuhy9Jn50aUdKsuKW+Q8SmAK7UDsvPGY+xyRzAb2eTlT6nX2P9DK5TqyTozkxzbrEj6pDnZzy9EyTownC4arTm5SAkXHk+5TEBkXkyuKTSUVuKrEqzlbFydPxAS8bWoo2vALmij/JcPFFlVcXdU6Re9tz3aqdwT1zF6YInPmxQ282ul6qjM3bpoZ3IeOPANF32UeyZwmndcx/tKv2yKLXfmw6itYBW4X6oPx7GH811rw8jT7Hdfi2vZCZ672p7vfcw6x7CZM2rTATlRk0D9hLvQfuUGt87NyE3mM0CPYWNJSs7mPbFT5W5oi5mSGHqi4gUi/6qyr5yhJeusUpQy/2cG7OA0zNtUqEhTnu/5PQhiNyQCrgstoiW3GaVYrRD5RaT+9ItDl4kUeVF7EiM0GSBarPk8KEtlVdFXOn8Ek2wxFf4k+CYxUhQV7GjuZwUqnH+18tYxKBqTN+FzqakXNKanCrP9EioZ13/VXBxu41qiGXmfT+hoaLE6pSoOBLCu9fx+9rNfSFnqpW8n5Is3NtD6NliLKWaiuFIeQerLJ3jPclimkQwQa9/sff3m1TO0Gh8OgNOm7vDyc9ne3umav+Qp73NVAl/SBPzVP9K28RWESfJv7kE8CgaHZRd8hAtHsnQJWGuqUgQkoi3jh9V0RBE3tffYwghnmj9pLEKg3azaQ
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199024)(1800799009)(82310400011)(186009)(40470700004)(46966006)(36840700001)(40480700001)(40460700003)(70586007)(70206006)(478600001)(82740400003)(316002)(81166007)(4744005)(2906002)(41300700001)(86362001)(26005)(36860700001)(8936002)(8676002)(6862004)(4326008)(5660300002)(53546011)(6506007)(83380400001)(47076005)(6512007)(6486002)(2616005)(336012)(356005)(33656002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 11:14:42.9802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dde3ada4-1d2b-4163-f6c3-08dbae014e05
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5803
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 11:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187206

T24gNSBTZXAgMjAyMywgYXQgMDg6MjksIFl1dGEgSGF5YW1hIDxoYXlhbWFAbGluZW8uY28uanA+
IHdyb3RlOg0KPiANCj4gYWZmZWN0ZWRfdmVyc2lvbnMgaW4ga2VybmVsX2N2ZXMuanNvbiBkb2Vz
IG5vdCBtZWFuICJmaXJzdCBhZmZlY3RlZCB2ZXJzaW9uDQo+IHRvIGxhc3QgYWZmZWN0ZWQgdmVy
c2lvbiIgYnV0IGFjdHVhbGx5ICJmaXJzdCBhZmZlY3RlZCB2ZXJzaW9uIHRvIGZpeGVkDQo+IHZl
cnNpb24iLiBUaGVyZWZvcmUsIHRoZSB2YXJpYWJsZSBuYW1lcywgY29uZGl0aW9uYWwgZXhwcmVz
c2lvbnMsIGFuZA0KPiBDVkVfU1RBVFVTIGRlc2NyaXB0aW9ucyBzaG91bGQgYmUgZml4ZWQuDQoN
CknigJltIGhhcHB5IHRvIGJlbGlldmUgeW91IG9uIHRoaXMsIGJ1dCBkbyB5b3UgaGF2ZSBhIHNv
dXJjZT8NCg0KUm9zcw==

