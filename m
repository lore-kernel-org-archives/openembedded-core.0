Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E328ACDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 13:59:58 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.83])
 by mx.groups.io with SMTP id smtpd.web11.55204.1697810397578756802
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 06:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=RTVIOacq;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=RTVIOacq;
 spf=pass (domain: arm.com, ip: 40.107.22.83, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1muQyxMfDFXhErdQzfAHKGtHfnkSXpcVPXTRKIyMmQ=;
 b=RTVIOacqxcndU9N7p3Q3/dH+74FCyqvYEnGp8eRsdMOPdFJDlTJlJhKEgQtYXp9uCiXZ5L+qIJc3LWzhHl/7hUM85XD3OgoQnK78+9W38L8xSTAsfM+ZQVr3emQ3kIzL35ZFS2vflliE7ucsaxPAAfe3geXwBD3CEDvfSWkQU6I=
Received: from AS4P250CA0016.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::8)
 by AM8PR08MB6514.eurprd08.prod.outlook.com (2603:10a6:20b:36b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 13:59:53 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::c2) by AS4P250CA0016.outlook.office365.com
 (2603:10a6:20b:5e3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.25 via Frontend
 Transport; Fri, 20 Oct 2023 13:59:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.4 via Frontend Transport; Fri, 20 Oct 2023 13:59:53 +0000
Received: ("Tessian outbound 36e2b13fe8d0:v215"); Fri, 20 Oct 2023 13:59:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 65e912cfb473eef9
X-CR-MTA-TID: 64aa7808
Received: from 9db65421d24f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A1F3EE95-DE57-4850-8CB2-5BD0B0281325.1;
	Fri, 20 Oct 2023 13:59:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9db65421d24f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 20 Oct 2023 13:59:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgirgw4vb1Lr3NemCpvBs3SJ4StI62LQ7rl2zXWyE6BQYbrRX3twF2zPf8X539lhJ60VWmitXI+ib/aFPKTMZ1HbvS/L3ecK8g9sziHBFjUY/BNRo7PdCHLyrwUaM91SV5wVG/Bz7n9XKCTXsJPC8t4AWYTqpy3deT8BupBBol8Jh9Qb1Me8/7Ud3DkCOW/46ajNntWuzdhRCB7Mc9i5xJBTxaIHlFIRouTEzRfDfxg+YhAy2I41tSQz96hvVpuINXX9v+9Nu7co/BSVwZ99473wXXEUU95rz6WrtCTZF7NVWtsG8v2CHB8ZR3FnkPHmLwr5WDjvOH5CRJcRf3uhrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1muQyxMfDFXhErdQzfAHKGtHfnkSXpcVPXTRKIyMmQ=;
 b=h/s+Gv0Lq2ZFRKBJCpCeQ4Gran+i1IItGN0bHXxAAJ4Dym15trqlV2Y2verNZpTeZO0ZqQoaIAlNUiu4PDEHgqmIwUCFAiT02q+qZQyp2E035j8Md80rFczhp9gjnun9gJ8fMTZu+hHy9VI9K07iQTrHO01oQnQ+kS98iInZd1BBWvRhFgIR6FxOOpHqCxW3YTesd+JXC7lTE/TGTj3taqUtGLfs3Sa0OKsh3OSsSlit9mvqyJZ/vjmiR5hCkG8fyvuiAep4pl6tnHxD0uzqLz9BduMDb5rjCgKFvjuLC9XmUtPTd4PKCvKhCCFdNuWWiqBTpoM8hHaqqFf6cONFcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1muQyxMfDFXhErdQzfAHKGtHfnkSXpcVPXTRKIyMmQ=;
 b=RTVIOacqxcndU9N7p3Q3/dH+74FCyqvYEnGp8eRsdMOPdFJDlTJlJhKEgQtYXp9uCiXZ5L+qIJc3LWzhHl/7hUM85XD3OgoQnK78+9W38L8xSTAsfM+ZQVr3emQ3kIzL35ZFS2vflliE7ucsaxPAAfe3geXwBD3CEDvfSWkQU6I=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5754.eurprd08.prod.outlook.com (2603:10a6:102:91::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 13:59:44 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05%5]) with mapi id 15.20.6907.025; Fri, 20 Oct 2023
 13:59:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] shared-mime-info: Fix missing sentinel
 warning
Thread-Topic: [OE-core] [PATCH v2] shared-mime-info: Fix missing sentinel
 warning
Thread-Index: AQHaArPyUxE8iuBwikao9X9nLAbZ4bBStYSAgAAAYwA=
Date: Fri, 20 Oct 2023 13:59:44 +0000
Message-ID: <6C5237EB-9F2F-460A-8F27-81D4084A8816@arm.com>
References: <20231019174423.2873569-1-raj.khem@gmail.com>
 <81CD76E7-0BA0-4ED1-AA12-9C826E35843C@arm.com>
In-Reply-To: <81CD76E7-0BA0-4ED1-AA12-9C826E35843C@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5754:EE_|AM4PEPF00025F9B:EE_|AM8PR08MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: a02f087c-1b9b-4e3a-a008-08dbd174d5cd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ydTdsqq2sBmQyYL09bCJ89+oniU36YPj/x8NvfOCSCZ0CVZ/StsSfIChYE9LVuxy4W8f/qrpcolrCQPoFG/WCdTZZl6X3uCREeAWv20fqSYj6/bnp6bWW5Jsm7XjSILeRFMZ8le1I4/QQJqb8nuhG1oQbMk+z0qwMt0/0gNR0zmqfWTrePWZqqOamwtuDDrlKT6d6y5WeqBeZxgswhl5DuRqwr8XN4pdFxlDr60Mbm6KR23YdnxCoi4Geu8dHguR466zN2VSdw0FHP4wvzBjM/md7OB19tZCmqHMcy24F/d/pRAXKbbX0MmgBepCKR+dbc4YBxA/UZNt28oM4MhPUABQLrHaCPkwgmEg5TVxq5RC0mvS8o1hgN50itBg8W05HmlPBPQpdIQJ0qkoUQCgkADWFXXlkrrWuzTbJNcZIY8A20dUVmBwVBxhEx0+3xMZdBugfBL5HFhkVGucsZW7fKiHuchNXwUjy1wVL7RMs0NGRUzYDuY93WGCCbUtBBNrgmyQ4QAUZ1dEavOAsiEjSsnl5KnM9kl9fyzVHPqx/RoT0Z0jqq782Y+E+7YFuxHFjntzVEnsXj0GgL+eGzzSKc/XMW4QaIWczRnJk0xENLoMO5i1bamMpLfLeCAwPtRr8O1oK4zO7ASiFHTlPdRsNA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(396003)(39860400002)(366004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(8936002)(8676002)(38070700009)(38100700002)(2906002)(5660300002)(26005)(4326008)(36756003)(41300700001)(316002)(33656002)(558084003)(86362001)(6916009)(71200400001)(91956017)(478600001)(6486002)(966005)(2616005)(83380400001)(66556008)(122000001)(66446008)(66476007)(64756008)(76116006)(6512007)(6506007)(66946007)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B8177BF7F0EAB438D91F017E393B8FE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5754
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1602d0e1-f09c-44c1-c379-08dbd174d070
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5VjN/+L+wX74ev281tajrhMS/TzwQsPS87kykukr3SKFYlefR8FJY6+HvdxXjzARrQGWk0+C2GD1vXiN29IvAMEpfaC7oYci2jgqBhsKttqmNU32FRf+6wWZpIEFnQmG7LKje8gn5pTm9STw9QW1MAPuS/XX5SlO828jykr98+egR2TRxwmHvdOD164SJtvJYrxvFnHdyTOiCPnmjFhk+m3V6oglsxVIErIM30UMY6wzaYPcNWrUba5mngJk42azFHEAzXTF9+HypV7jd76oE/J95a7JssNejIAdI1PgZJLS+zRcWLvlWOZTVyxNXy6+pMnVlbcyqRlezjW9AgK55tJWC5ZQpwfDcpFLIeXuK5Z4RSN8ObCn6BV5KunAIi4dvyyKJ+9xpi15DHeCGSbM8W9UE481xJ7ic+xL02eL5RrwQisLWawwvaz+yn3xXnb3W9NMkiGvZx0BB3AR96aopAdxBRGSGPH+IAtilJpZTSh3RKAnxlyyelenBpNy+DhDc/Qh1qq272+xE7aSrZb4TW56BJwdmPQPqm6KPISwAgRtKrsTvSjamnabnestvBRSkuMVnmrRaI9J6OAL2kU0yXGMG0VR39gqEwEITnkZn4/wf6UufDMUvW8ttZeY40GvvXfFfcrzYCItmLK56QWWc8BVuwM5+5MyRhExMo5bilmHY/NFb28pSnmE0OIOCDfGU0uYBeUxUKlYu1b0To3DgGFJ/SFyoXiPuNl/pLL6LBM=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(64100799003)(82310400011)(451199024)(186009)(1800799009)(36840700001)(40470700004)(46966006)(2906002)(40480700001)(6486002)(966005)(40460700003)(478600001)(5660300002)(41300700001)(4326008)(6862004)(8936002)(8676002)(316002)(70586007)(70206006)(36860700001)(83380400001)(47076005)(36756003)(86362001)(558084003)(33656002)(2616005)(356005)(81166007)(82740400003)(6512007)(336012)(6506007)(26005)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 13:59:53.5866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a02f087c-1b9b-4e3a-a008-08dbd174d5cd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6514
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 13:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189536

T24gMjAgT2N0IDIwMjMsIGF0IDE0OjU4LCBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNv
bT4gd3JvdGU6DQo+IFdlIG1pZ2h0IHdhbnQgdG8gYmVsdC1hbmQtYnJhY2VzIHRoaXMgYnkgYmFj
a3BvcnRpbmcgdGhlIGZpeCB0byBMTFZNIHRvbz8gIGh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xs
dm0tcHJvamVjdC9pc3N1ZXMvNjA1Nw0KDQpIbSBtYXliZSBub3QuIFRoYXTigJlzIHRoZSByZWZl
cmVuY2VkIGJ1ZyBpbiB0aGUgc2hhcmVkLW1pbWUtaW5mbyBjb21taXQgYnV0IGl0IHdhcyBjbG9z
ZWQgeWVhcnMgYWdv4oCmDQoNClJvc3M=

