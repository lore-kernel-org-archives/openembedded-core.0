Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A90DC4167B
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 12:29:31 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.74])
 by mx.groups.io with SMTP id smtpd.web11.11488.1699964965484139418
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 04:29:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=k9pCfKQJ;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=k9pCfKQJ;
 spf=pass (domain: arm.com, ip: 40.107.20.74, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SCUYLPi39a/zo2VJlqfwnWEYG/cJEwjPalyCcJ4pQjE2nUe/L/MY4sxExiVK57Lphb2J7bXN9tqcOsfGX9W+YboHIecY/SKAEBdBrTzMCbOUsGPmzFCJ6LgLDNvYXNgaXQ4E0z9lp6X/BeYwK3Af2tEgv93usGQm6zqBxWh1xde1aZAd9b57PlWggHFb2UGP4jbt+lAf3DDnzEeZfdGBwZ2h1BtneaeMtI0w/kd19KwfF24W2f5o03kXcdeQF0Di8tr16dxRIa0XcOADWf5BjJVi3b32m3pQJVcVmhZST4s4K64KeCwtfXIHrR7TwS7QyXunDGOd+0mS7r/9cIR7Dw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPwmmOe/2nvJSATs4coBOH5BLrZqg+CwwZZQjnaCQMk=;
 b=CJnEGR3J/eHRnIdhG34SvfT+uvTQavz4r+LPsVYg0hYAqfBu9u9Qm7hg71hk+0/ASJX1rXkeSsAFTxg2qVAPOKGGylZdI9T39LQvUqNAkcPo2OnSI+dUdUjqF5i3BmV/GM3GSGF8aNQznmOJt57pX+roaFPgDjvulaHqyanz7Q761D3AhqT0tC7bJG7mWE+vqsBli9svoGXU6VearpbawAwfla5mDHKwNWGGSJfXbOfgl7IGLFjtOjmwJ+m7HleonoUZT4MZWAeIW6YMY8rJiKpgnngztm8AboI5noTlnmzyxbC9nHlW17mw5820zsWyTfZIuKmT2jKUS5K8SuL2BQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPwmmOe/2nvJSATs4coBOH5BLrZqg+CwwZZQjnaCQMk=;
 b=k9pCfKQJpWqcxAMSCxQBBcrXDQBnrwMtMvh+NNjxfy/+r9UuakM9e/6D8bIfAWiI11yy5I8fsIKd41ueJmylgSlikihumSvAGMpIXbGgx7ORxbhpYHkRrToK3RpxgkPFbtyOoytp6QjOc4PIWYI1g/YNw+SnLPwxgpjsH/edgYA=
Received: from DU2PR04CA0295.eurprd04.prod.outlook.com (2603:10a6:10:28c::30)
 by AS2PR08MB10226.eurprd08.prod.outlook.com (2603:10a6:20b:62f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Tue, 14 Nov
 2023 12:29:22 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:28c:cafe::33) by DU2PR04CA0295.outlook.office365.com
 (2603:10a6:10:28c::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31 via Frontend
 Transport; Tue, 14 Nov 2023 12:29:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.14 via Frontend Transport; Tue, 14 Nov 2023 12:29:21 +0000
Received: ("Tessian outbound 7671e7ddc218:v228"); Tue, 14 Nov 2023 12:29:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fd1f8d707c447e9b
X-CR-MTA-TID: 64aa7808
Received: from 377be0688826.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D8767292-58A0-4038-AD2F-8C23FB3C8E27.1;
	Tue, 14 Nov 2023 12:29:15 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 377be0688826.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 14 Nov 2023 12:29:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KAE8G3mii9DOL07ixityYRsLuuUqXq93VZcYX4yCpDbRECW7BSVr6K3sQ3LfLys1eM06zYDF/ExshAiCo1h87oB0tgNOkA0vQsQh4i9sAx8yvx4FNG+lSebUPRzKgA7yvhew1hXTEcuy6LbnEM9DJbmhGFscuOFyjkU5kDTmJeb+Oo/1ujFY2pKZiHg68DvP6aTu74dF9OID8x7rgpxGxf2rK3cWw/Gl7XBBNB9jgQPxbUrh6M+2J/+HXHxiS6tx97QxH/BIpt/mhTGTqv5K6RGlDh/OuztQlgwPqK4h/OIcMhIMRKCGCcutdRj8AEmNK1Ei0DgpOi9/pUnNDolmfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPwmmOe/2nvJSATs4coBOH5BLrZqg+CwwZZQjnaCQMk=;
 b=R8q+wPC4QD9wR6wYTTqfcmTMZMo1vXdwJjTMjQxClWL+RHYYeaRxLfVl7EhEZZe2nX1rLchOXw8SxqFzMc5PnmO3ryUQLWjDxAsL+M1hHnazgvjYxJThXTDRo97QkvmCsOOHlewgY7gEMhb0IvpWD45rRcz0GcPklcFD8VWmB8Q4LZJgzs2ToVXjlfpdwbYWJ8hLEhwLGWHnsttabOCuNoyQI7NWkBQiK1bI4aabjZ+qiWSFL5xrjXdb41kPyzRSqGoxI5YQwlYczZYZKYkU2A9tC9L3YRQf+ypb+jSoSx0UEkKemgT11D/kNu8lSITUME86pkC4GuYvOh8DGuw4ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPwmmOe/2nvJSATs4coBOH5BLrZqg+CwwZZQjnaCQMk=;
 b=k9pCfKQJpWqcxAMSCxQBBcrXDQBnrwMtMvh+NNjxfy/+r9UuakM9e/6D8bIfAWiI11yy5I8fsIKd41ueJmylgSlikihumSvAGMpIXbGgx7ORxbhpYHkRrToK3RpxgkPFbtyOoytp6QjOc4PIWYI1g/YNw+SnLPwxgpjsH/edgYA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB10179.eurprd08.prod.outlook.com (2603:10a6:20b:62e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 12:29:11 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 12:29:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] oeqa,ssh: Handle SSHCall timeout error code
Thread-Topic: [OE-core] [PATCH v2] oeqa,ssh: Handle SSHCall timeout error code
Thread-Index: AQHaExoxwuvZPDi8gUikCMmnqxigdLB3/nsAgAHHmgA=
Date: Tue, 14 Nov 2023 12:29:11 +0000
Message-ID: <662DE3B8-8C57-44B2-8E1E-DD1C6A929AC9@arm.com>
References: <1795FB2C1C71F485.6123@lists.openembedded.org>
 <516F7265-433C-4ECC-AC55-1328F27DAC4B@arm.com>
In-Reply-To: <516F7265-433C-4ECC-AC55-1328F27DAC4B@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB10179:EE_|DB5PEPF00014B8B:EE_|AS2PR08MB10226:EE_
X-MS-Office365-Filtering-Correlation-Id: 501baf79-26a1-4368-d481-08dbe50d549a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 u/9OgIFyvfQ2aNPMZbb5PtWA/tC6HytULxhnO7rCE0EU5I10dDxu8cYoYjbO+snmBEIj64QcOGivZlloJyhmOWZcZAfGLhpk95T3BCSW7+daSyYcHTH5baoeXZOa/DO5gG84vjZO4+O1fsY83VVzvRxgKQXmNtwM76otn4jInr499OsATGBBbZvmmaKkrVeiW+MsRThk5FQQ/cgOGDyQ03uASz1m5Nb6TkPNbcasxSDxNNoSaUQblCmeb0SGDRm+nMNrIYCvpzwbGPnOJea6aqSuy4DO7wFQyI/87v6zKteh0yOjRpJzyEdoNL1cgV/GcvJpmb17/EXYxu2G/+sqM3CSXhszyfMFCIiL+d+0uU9FWTqB2qNsKlJlkSyi5BSSNS0AwIsZnYBYKssvFSehlNKOuz3lSW8AT+n56ZbXXU92g+5dKl/x1BnWCOdbhXl1Z0NxxlPNtisLiWyjMhN/Ww6m9Q3hEe7FIJoh9uW93ZvXKFwKGu0RamOhPOR7nYZpUdFmKXyb9ImO7bU7WeoH6ZTrFsxRq+gdeXSBUJjknFAxsKzpbAfSzJNX06/31AqjHyLJTETU1X7Zfey6GTeI9pGIpMJlXTNkvrW/w/KNsGojI7TzO833UVGy6bSOF4sVQcFDWFQSECBuMTg5V88IGw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(966005)(122000001)(6486002)(478600001)(36756003)(6506007)(53546011)(33656002)(6636002)(37006003)(316002)(76116006)(6512007)(66946007)(66446008)(66556008)(64756008)(66476007)(91956017)(38100700002)(41300700001)(83380400001)(71200400001)(8676002)(4326008)(8936002)(6862004)(5660300002)(86362001)(4744005)(2616005)(2906002)(26005)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EAB391381DA6F7498B1B5985C45E2DB0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10179
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7786a5da-0176-477f-1698-08dbe50d4e4b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BO//kSc/nVKVv4YkkJj1+ICzift4qL9bMF8JAq6UWRgnH6wLWjEnf8Rq8DYNK58HqldmBh/e/vQ/1nh2lJi/BQkalCIORgOPlxuH2V5mM2DdwMbYRt8woA+f/APhSkCpEyGz8Qn8w5Fon5dMXaWnPkszRh5uSgQz1DEXBrUQ8rgM/u12o66P7Z9ivK9SYj5tOMpZzPPZsem8kTXnQEuaccmJOwuO91epzcpMKUma1t5Y6Skkpu/Fut0FQ8zVo9PCv93XieszYj8bwLi/Pk0OtNqj0kEu6mjvhf/4CkrYHFvS7wZcZRt+oY5cKnC01XN07YLMfkIgzadHmv2dCyesjRTJ0ndT3h8mHrRD/QpQ3Mzoy4GjiHzOcgOrxDaEKdD5GrR1+H8sUJzWF6/DCIZ+bL8R3wEtu9sE6idTLGGFlF9QVX5mgHFk9PqOOtFfV8T8NJRZqII15b9fD1jdRZcw3U1G9mKXumx7mvkHUDITw02RoPtLvzjgAC1kthXrLw9FOL5GmaRErzhvDuIJHkY41apl64OvPFHHMB+ltwgl373OGygqarTKyf346gak/r9/VhsIrE6vb19cqHitoyRdZBDQUR+sEpueN4FRodZZkJvxgOg4zGPJuybw5hUFOM9lZphXJJKN0+XpFMWp61mtPMZP93LtgCxNWfiLm7btX/IUvMmPluR3uqpwA4jUahfoQNkVETeKB3F0/n2mvRtVXwcZOk8wdvNcHep/9WH/IAw=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(82310400011)(64100799003)(40470700004)(46966006)(36840700001)(2906002)(40460700003)(5660300002)(4744005)(41300700001)(36860700001)(356005)(37006003)(33656002)(86362001)(36756003)(316002)(6636002)(70206006)(82740400003)(478600001)(81166007)(70586007)(2616005)(6512007)(26005)(6506007)(53546011)(336012)(47076005)(966005)(6486002)(83380400001)(6862004)(4326008)(8676002)(8936002)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 12:29:21.9825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 501baf79-26a1-4368-d481-08dbe50d549a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10226
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 12:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190501

T24gMTMgTm92IDIwMjMsIGF0IDA5OjE4LCBsdWNhIGZhbmNlbGx1IHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxsdWNhLmZhbmNlbGx1PWFybS5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IEkgc2VlIHRoaXMgb25lIGhhcyBiZWVuIG1lcmdlZCBpbiBtYXN0ZXI6DQo+IGh0
dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvcG9reS9jb21taXQvP2lkPTBmMjVjOGFhNzc1MDAx
MTY2YTAzYjhiMjE1YjdiOWFiODBlZjRmOWUNCj4gDQo+IElzIGl0IHBvc3NpYmxlIHRvIGJhY2tw
b3J0IHRoaXMgZml4IGFsc28gdG8gbWlja2xlZG9yZT8gT3Igc2hvdWxkIEkgc2VuZCBhIHBhdGNo
IHdpdGggW21pY2tsZWRvcmVdIHRhZz8NCg0KRG9pbmcgdGhlIGJhY2twb3J0IGFuZCBwb3N0aW5n
IHRoZSBwYXRjaCBpcyB0aGUgdXN1YWwgcHJvY2VzcywgdG8gcmVkdWNlIHRoZSBhbW91bnQgb2Yg
d29yayBhbmQgdGVzdGluZyBuZWVkZWQgdG8gYmUgZG9uZSBieSB0aGUgcmVsZWFzZSBtYWludGFp
bmVyLg0KDQpJdOKAmXMgYWxzbyB1c3VhbCB0byBiYWNrcG9ydCB0byBhbnkgaW50ZXJtZWRpYXRl
IHJlbGVhc2VzIHNvIHRoYXQgY2hhbmdlcyBkb27igJl0IHJldmVydCBpZiBzb21lb25lIHVwZ3Jh
ZGVzLg0KDQooSSBzZWUgeW914oCZdmUgYm90aCBzZW50IHRoZSBiYWNrcG9ydHMgYW5kIGluY2x1
ZGVkIG5hbmJpZWxkLCBzbyB0aGlzIG1haWwgaXMganVzdCBjb25maXJtaW5nIHRoZSBwcm9jZXNz
IGZvciB0aGUgbGlzdCByZWFsbHkpDQoNClJvc3M=

