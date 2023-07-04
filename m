Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB5EEB64DA
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 10:37:38 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.81])
 by mx.groups.io with SMTP id smtpd.web10.55701.1688467052726714359
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 03:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=5723mOld;
 spf=pass (domain: arm.com, ip: 40.107.14.81, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxXObGnmch2uGv7RfdMjkOdkbTFagYO1p9J1C/cyYYg=;
 b=5723mOldtxuJD/aLdykKCJZvLsA+T0zxWRitOmjJVlKnWCqcnzMSAT4TuReRt8L6CAusfY39bDfnHeoeQPuH3Lxfm7J4w8UkV7/RNsdNsxvqNkuFqp1UexND3uYdqIFs1cIDigTfvoiBSmE3azLxk9nbTE+UePjZHPpHmE+e/8w=
Received: from AM6P191CA0022.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::35)
 by PAXPR08MB6541.eurprd08.prod.outlook.com (2603:10a6:102:15a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 10:37:28 +0000
Received: from AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::a3) by AM6P191CA0022.outlook.office365.com
 (2603:10a6:209:8b::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.30 via Frontend
 Transport; Tue, 4 Jul 2023 10:37:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT009.mail.protection.outlook.com (100.127.140.130) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.18 via Frontend Transport; Tue, 4 Jul 2023 10:37:27 +0000
Received: ("Tessian outbound 7c913606c6e6:v142"); Tue, 04 Jul 2023 10:37:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 456073db49b20c67
X-CR-MTA-TID: 64aa7808
Received: from 00196a474872.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D387137B-2B9A-4FB9-982D-397E4DE6BAB5.1;
	Tue, 04 Jul 2023 10:37:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 00196a474872.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 04 Jul 2023 10:37:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrUnPwy214RlxSKXnqFG3JrEPjXKXnEbI4jUn17aDqJDaEpF+wOE/aJa94bzNHME9UwO/lVSYs9K7RpZoP86To/5EJVulAO2jyO3KfpPmwoy0nrYWGMsbbPJOdb5QoaM2tuZj9jbPtL+9K5pGj6pquwr0OmVXCZ/dv/l5FFxA9/JM6H5549xFf5FYvaOg5aLdb1k9jHPZZB7ST1V3N8Cx3MjPdhgQ9ALFxRIH9alsm47YJpXGYxRAh7+TMenNVIKQKhzBCCQMUL+SrQ1iat0Ww7hAsWeEwAMgj80+guLWe6MUhBHnpthcWt6Hztod5EJ3U+g0VwSMt6opEKdySg3yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxXObGnmch2uGv7RfdMjkOdkbTFagYO1p9J1C/cyYYg=;
 b=WahzUZpsk33/G3lNQHs3ocYPv7MaXcOFc7r5nQdbxzhsmITUfD69d3NxLAtXtv7VRp0zIqUaxblPktqR9LkGDog+26eGfWwMxseDOewuSOaUaQbW4vNJRcb7mTZCUxqb7Yi6J27WdsKAi/p55AQTmdcYt1SVkBAoQTEiOxt2MP9CP7UXn7orRQugK8mYlLpicSLPec94aiyeGnGhMFYSKdK3kijGDm78QeYs0ocSfrz6kpc5s+ulhWqVBw5rpZh1xSt45sPYViOfVscGqRwwocDXgLiY2YZum3EpN0HWiboJ4ngT6XuUEF8xrFYWMMggqormcYJH+uhAB7AmyZZ96Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxXObGnmch2uGv7RfdMjkOdkbTFagYO1p9J1C/cyYYg=;
 b=5723mOldtxuJD/aLdykKCJZvLsA+T0zxWRitOmjJVlKnWCqcnzMSAT4TuReRt8L6CAusfY39bDfnHeoeQPuH3Lxfm7J4w8UkV7/RNsdNsxvqNkuFqp1UexND3uYdqIFs1cIDigTfvoiBSmE3azLxk9nbTE+UePjZHPpHmE+e/8w=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5592.eurprd08.prod.outlook.com (2603:10a6:10:1a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 10:37:19 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 10:37:19 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 2/2] mesa: Point to native llvm-config
Thread-Topic: [OE-core] [PATCH v2 2/2] mesa: Point to native llvm-config
Thread-Index: AQHZrVqGw5J49PTeFk6EagoUC/SJX6+niYKAgAANJ4CAAAOXAIAB0gEA
Date: Tue, 4 Jul 2023 10:37:19 +0000
Message-ID: <1FE45EE8-C2F7-4E7F-A2B0-2B988EF693E8@arm.com>
References: <20230703025959.3968541-1-raj.khem@gmail.com>
 <20230703025959.3968541-2-raj.khem@gmail.com>
 <CANNYZj967uL0xN2e1VhkkVEuVvF8_-XM=mUmWAnKDHyHyZGx5Q@mail.gmail.com>
 <CAMKF1sqdq3U0OXhuajFR=vmmowH2CeB0L0ZisEZALz6ezTmPhA@mail.gmail.com>
 <CANNYZj9c9s7DaAvFpQvxF6VF=Q7d5mWBiQq85NAccWXAdA=7JA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9c9s7DaAvFpQvxF6VF=Q7d5mWBiQq85NAccWXAdA=7JA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5592:EE_|AM7EUR03FT009:EE_|PAXPR08MB6541:EE_
X-MS-Office365-Filtering-Correlation-Id: fbafad6b-e7c4-42f9-0f82-08db7c7aa99c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 gOhIbnOx/rMg6E+ezbGBXFl5L9KniHv/QO2J3i0CcJ/1Yh29CxK6yYq1DflCXR4zx2WKtpATp6blsvjez2oAncJr97PGb8I9vJmgaUlEsrbVALKtJudt9TIT3GbzfRxsCiW069hirAkFqtmMZlqf9BJ4i09r7scgqy6h9JwWIKyt42mIGprqtaeZwRM6xDymDqCbYDKnTEieEGcow1MCHB+godQR5gZnFl5Cq6WpXOsztwhO6D/qrGydc8R3lKOE3RcTbQqZrqogH3HyGLlxEtyJbEJ5RtOHXPZIKZ9WL8uJARmeD0a3F/dO1RgsukQa2FP4qL1+9Ak1RjEMCVvyBoaLY/Mx7y1fYRC+fHmGuBY47qhx4Ijm9JzIK26Qt8ExPqOKkp19GlZ8GNjZ4V03dxlRvpQmZzWE/A78kyUhoSDL7wGg0i0QqmBD8zScSYe3/eA+w8TQJ/m6Nj7hCeaYY+T0YhD3ng2x2JEceO0Mf9s2+VW632PIu7qL1MNKHE4iGQH6M/vLMHlRn3LxOnNiyYjeCVgw1MdocuJyB+GoX+DiYjCQ0CHiU5hfIIwtVkpvRAV9xA9tatGkm9Q8Vcu8ObDSwAv3fiUyFTbCd3USvlmMiMyfXgeLH+TVIyLGETe+kcLw/OjeaYuvO3arWuzZkg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199021)(122000001)(71200400001)(478600001)(54906003)(5660300002)(8676002)(36756003)(8936002)(38070700005)(86362001)(4744005)(2906002)(33656002)(38100700002)(66476007)(4326008)(76116006)(66946007)(66446008)(66556008)(64756008)(6916009)(91956017)(316002)(41300700001)(26005)(53546011)(186003)(6506007)(2616005)(6486002)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BC42F9AF740EB4AB71E3240E1A6458F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5592
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	01d883ed-2d8a-454e-8480-08db7c7aa4a0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KKF9WR6lUWQSyMvDvec2ULmLwIZtT0eYNSThVCS+yrao4ob7wBpPJBnjTPUDaK1ksdEP4MRBv3WjSlzOA5HVD1RttCZPYEN2kOekYTcPtS/mnnY7zZYf1KQV6bhozStye2C6QUJNSgDVUs6lg/ii8BbnOx5rDRPzetEjuGUSkX0tx/Dc1TXwuC5thh8cw8A0NwiuRaxNpr396D4xGleQ+Pt+knvsxPXSm5Ik1o9ZMXl4QGu4xL8wGqCa6dDGhosyeqEDh5DSlSaCTMH1uK2citQ6MsIFQ6yJh6sDlASPQLCVFlXirK38j3zJULH1Z5QdqTk8+D145O1jG+2S8BU7vYphvtaRKSgKmbuKvgL+BAXm50yOQuSg880T4wreFvu4LzTaaYq+wnxiWCM817L3i39H+FPBs1aLLCPjtcnECD0RAaod0dHwMK9WU9rRZl+RKpVxDuPyQ4HXeMT8uAVxurgiZCD5HfH559JP1953ikP+biKRQKrXoFmHZ3s6uLs4V1Dq1ypYMwvH5vmcTRH3YFhJzCPgM0/KP24842KR2y4CajiR/7uCsB8Pni6Uc3l2olRJ7egcgqlB6BEjYSnVaK/tCFd8bx2xAWDwNsHEnWKDQNEZAEdAE8L3slsCqtPywSjnGmpECAar/Mx5UzAu2dC8m5nua/2gNkIlkMjPvBHS2zJ/ssGz8rspUmazrcjgD6hyUwZeXFSzlvVF5wXxqovQm2k/PMWcMK+glKWCjHd5QOGb1FwBO5/IU5K/vdHv
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(26005)(478600001)(6506007)(82740400003)(6512007)(86362001)(2616005)(186003)(53546011)(81166007)(54906003)(4326008)(70586007)(36860700001)(356005)(336012)(6486002)(316002)(70206006)(47076005)(8676002)(8936002)(6862004)(4744005)(40460700003)(41300700001)(2906002)(40480700001)(5660300002)(33656002)(82310400005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 10:37:27.5863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbafad6b-e7c4-42f9-0f82-08db7c7aa99c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6541
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 10:37:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183824

T24gMyBKdWwgMjAyMywgYXQgMDc6NDksIEFsZXhhbmRlciBLYW5hdmluIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxhbGV4LmthbmF2aW49Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiANCj4gSSB3b3VsZCByYXRoZXIgZml4IGl0IGluIHRoZSBjbGFzcyBmcm9t
IHRoZSBzdGFydC4gU2VkIGhhY2tzIGxpa2UgdGhhdCB0ZW5kIHRvIG9ic2N1cmUgdGhlIG9yaWdp
bmFsIHByb2JsZW0gYW5kL29yIHF1aWV0bHkgcmVncmVzcy4NCg0KQWdyZWVkLiAgTGV04oCZcyBk
byB0aGlzIGluIG1lc29uLmJiY2xhc3MgYW5kIHRoZW4gcmVjaXBlcyB0aGF0IHVzZSBsbHZtIGJ1
dCBkb27igJl0IGRlcGVuZCBvbiBpdCB3b27igJl0IGZpbmQgdGhlIGhvc3QgbGx2bS4NCg0KUm9z
cw==

