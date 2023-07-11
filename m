Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A59EB64DD
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 10:45:18 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.76])
 by mx.groups.io with SMTP id smtpd.web11.4628.1689072312814431957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 03:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=nLoJ90Jf;
 spf=pass (domain: arm.com, ip: 40.107.241.76, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JkLH8MOFSeGD6GeFXx9Q0rIyY5jTNINJmY5uobTprc=;
 b=nLoJ90Jfrxexccwcj5pUOgd18+V/HVc+bJL4r/7aqdfOhzNuq9Dbklxn1yfKULNE964iiI+9u1YB40zOqY+zm2ofZoacBaP4renDUhlulqCk00vI2dghQvUVv3U7VpcQNpZT7y7YsM/kKsxCug+2B9klUggX1hP5P5Zn8pdoD4U=
Received: from AM6P195CA0065.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::42)
 by AS2PR08MB8479.eurprd08.prod.outlook.com (2603:10a6:20b:55d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Tue, 11 Jul
 2023 10:45:08 +0000
Received: from AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::c0) by AM6P195CA0065.outlook.office365.com
 (2603:10a6:209:87::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32 via Frontend
 Transport; Tue, 11 Jul 2023 10:45:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT030.mail.protection.outlook.com (100.127.140.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.18 via Frontend Transport; Tue, 11 Jul 2023 10:45:08 +0000
Received: ("Tessian outbound f9124736ff4f:v145"); Tue, 11 Jul 2023 10:45:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 921f641ce423d0ca
X-CR-MTA-TID: 64aa7808
Received: from d8eca5ed5bb2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3D280EA2-AAC6-4943-A478-28541147A8C9.1;
	Tue, 11 Jul 2023 10:45:02 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d8eca5ed5bb2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 11 Jul 2023 10:45:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjhKPd2YKhafGeTccWPEKFj3L1MQKceq1HBabItAJhPtICscG17h3HEOU1dMCM6rZQaS9RdSChPgfpLpxjM6PSNC4JfPlkdktpRQ3Pq+J3N7Xzr1McMXdzYt6MuapfTTV4MwGfXrGattv8/kLvv3dMcgM4drAbN38LpyqUX5XEBXgF3a7UjsT4AAF4BReAP3WyUoT5/37tclj6AWVFnE1MCO6fMpik9MzWGpxFh7ue2aVHVd03H9lyzZ02R/VOmvkjwc9SiOUUUZEVkSntK/5Z14wfgFyEauGstVdbuXSwhqk7mN/21LOgUWnG0tPjt0+zyxljEmgmIkX2ZStjRzVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1JkLH8MOFSeGD6GeFXx9Q0rIyY5jTNINJmY5uobTprc=;
 b=J3xEwKmFBH3OQOfW6MBleBsss4hZRmVCz4ABLtZKv14dnoe8ZZSHK6xPFJWPn7VdJltR0JAMiMUOfhqa5zrSTYdqUbns2b3rg5YBRcTl6BwhZ7OHzBVVumOKr+UxqcWAk7Uy2LByf6HbAkS3EQKZ4k0QIourJJboicQvJcQn/Md3T3S548o50fMRODICtykDJQPk63V6Gd+tCvxuEWRj6aXPsVQQifJb5UEgmj2HapDPzw6IrYHXpTda2ZQfTBG7tZmVOWoOZae1Oe+MB9y3qjZ18t7WL87ouvsnmOYbxcYyLuXu+CH/p6A4fbiZIBAyx7hPLbC5YBDjGmpIjs5LAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JkLH8MOFSeGD6GeFXx9Q0rIyY5jTNINJmY5uobTprc=;
 b=nLoJ90Jfrxexccwcj5pUOgd18+V/HVc+bJL4r/7aqdfOhzNuq9Dbklxn1yfKULNE964iiI+9u1YB40zOqY+zm2ofZoacBaP4renDUhlulqCk00vI2dghQvUVv3U7VpcQNpZT7y7YsM/kKsxCug+2B9klUggX1hP5P5Zn8pdoD4U=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8015.eurprd08.prod.outlook.com (2603:10a6:20b:548::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 10:44:59 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 10:44:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "joe.slater@windriver.com" <joe.slater@windriver.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, Randy MacLeod
	<randy.macleod@windriver.com>
Subject: Re: [oe-core][PATCH 1/1] ghostscript: advance to version 10.01.2
Thread-Topic: [oe-core][PATCH 1/1] ghostscript: advance to version 10.01.2
Thread-Index: AQHZs3Lcy9ImxpNyFUCkaqIsLts5J6+0YocA
Date: Tue, 11 Jul 2023 10:44:59 +0000
Message-ID: <D02DB1C6-ADE6-4DCB-9E20-ECC82EB2BF59@arm.com>
References: <20230710210934.606757-1-joe.slater@windriver.com>
In-Reply-To: <20230710210934.606757-1-joe.slater@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8015:EE_|AM7EUR03FT030:EE_|AS2PR08MB8479:EE_
X-MS-Office365-Filtering-Correlation-Id: 8919d651-8b21-4188-b7c0-08db81fbe538
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 v9miZpyzNDWDTIIxA03TE740MW/ZqVKLxdOWlXIdUY8M4XqrzOfxE/6PAUmFmrjJwFZ5/ZmuMgP4LHvd7cya/I5ZmryD+h+UPs+nspTb63eiEjRcpKsMmsAIcdeZGEJHnGOW2tFj+fcaeiAAhq2F5StDLPfwe3E1spzWXFqHFWf7EQ4dzfH0LnzKtWg2/osEdOG2Uwt8h1Cd+8J3E46hMRN5vJc69q8l6wvoFeqG8oLshhb7AUvY0PfSfEeMI+pThGXkgf2EXNyVICLFwhbVBQQ2C326gRk1uYXDIBuy/8dAabSkv9hyRb499Ze97GvfP4hstne4Phv62un4BMGRF97ifBK8ueUB8/zGO5KIV4Qs1zSLg0fSSmN8dsMLHjW2+Gpb2Kn72SICuOiAjSs/5YeRl9PjlQJjpXLCNVTd1qd+LO0LohB5KGWkV3ldtFWw7Ez4P9AsaTbqLaxerOmBEr+3kzZ5TTPIRhZhpVldiW7FnQJ9pPm/23B3Ko+7HiqHGNB50nqVJLxzU/BfeVdf8SJ7uaUq5AOfXMtqLkAhVzqA3v2OTgwzmdKVKTMzS8t67OGm+74EdEwAN2SadItzJT1H9skfS/NUT6/+LKUMJqvwgeGhKUosQq0hSXqQJEigzMWcvu47WUsN+Uw+W5hRzw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199021)(6486002)(71200400001)(478600001)(122000001)(54906003)(8936002)(5660300002)(8676002)(36756003)(2906002)(4744005)(86362001)(33656002)(38070700005)(6916009)(4326008)(316002)(91956017)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(38100700002)(41300700001)(26005)(6506007)(53546011)(186003)(2616005)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <300521F50FFAEA418415A3C33853D110@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8015
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a8387b88-9d69-407c-854a-08db81fbdfbe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4aVES5DisUhAZVxDvr8ELqOy5nHy3I/+R26PXtHtO4MQmZPMCqAZ4RKR5+TcNHMSaXZlNsPlki77dtYWLDGzeWlI3Yu+1NBkRV1ANx/XJDsjfAqOhjTvJTiXHknL3+JxH9/LNStjLkumwbDTPHJHkcL9vKpZqL3PIkC2Vk6O9pbUQqeT8Xs8teGe0Bb63CQNmBZlP5g1jeH+KsiedGtSayHJpowsDwzV5VtkPT/Ii53EYqOnD/nHO99txzdU7GlWuBVFlx3EX8CkaILxUPv55KEQMPBqjzLOpi2b45YJkdWTrYO7FwnP9UeKRKqSrlwOgbLeDXkrCfYOfd8J8qT55KCYZcht+6d3w0qFiWJAlUxRaE/Yga3QfgngRwkPHn65lhOkZIijCM8dOEfj4iJLSbUf77TFQ97Fswm9YkxnNZ2m+5IKPm6GKgHmia0yqrFO4tIVTiRfI8+kLpVH4TGQjQtgfQEF5yJxjtmNKo9x6Ya5GZ63S3ZyHoO7gBoxJDx2m0PeWadaF0qrcRnqnqdeRsVHB553Zics7Ixz9TQUWPXf9wisCa71i7hcMs8RKkpzp4+/vzAL+tiw7rTnYz4yFlU0QgbGGkY04dp0XeXJKdXAttlws9fqx+vCtYVv9uspxS0kG3HKGAO2v2X5SJdGlEirwMrqc5UVn1awkwceXV1/yJmN5hzgquJ98yADF8+fbLFxKEc6CWt+0pZwzVl0lT2MfetcKVY9sO9UgcSEOIDpDP7R4qvd3dsf622bx9rO
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199021)(40470700004)(36840700001)(46966006)(356005)(81166007)(8936002)(5660300002)(6862004)(8676002)(82740400003)(4744005)(41300700001)(2906002)(316002)(4326008)(70206006)(70586007)(82310400005)(86362001)(6506007)(47076005)(54906003)(36860700001)(53546011)(478600001)(40460700003)(2616005)(336012)(186003)(33656002)(107886003)(6486002)(40480700001)(6512007)(36756003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 10:45:08.4905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8919d651-8b21-4188-b7c0-08db81fbe538
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8479
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 10:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184125

DQoNCj4gT24gMTAgSnVsIDIwMjMsIGF0IDIyOjA5LCBKb2UgU2xhdGVyIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxqb2Uuc2xhdGVyPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4gd3JvdGU6DQo+IC1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNGRmMThhODA4Y2Q0MzY5ZjI1
ZTAyZGJjZWMyZjEzM2NiNmQ2NzQ2MjdiMmM2YjE1MDIwMjBlNThkNDNlMzJjZSINCj4gKyMgU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjRkZjE4YTgwOGNkNDM2OWYyNWUwMmRiY2VjMmYxMzNjYjZkNjc0
NjI3YjJjNmIxNTAyMDIwZTU4ZDQzZTMyY2UiDQo+ICtTUkNfVVJJW3NoYTI1NnN1bV0gPSDigJxh
NGNkNjFhMDdmZWMxNjFiZWUzNWRhMDIxMWE1ZTVjZGU4ZmY4YTBhYWY5NDJmYzAxNzY3MTVlNDk5
ZDIxNjYxIg0KDQpSZW1vdmUgdGhlIG9sZCBjaGVja3N1bSBwbGVhc2UuDQoNClJvc3MNCg0K

