Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CEDC001DB
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 18:30:14 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.85])
 by mx.groups.io with SMTP id smtpd.web10.42727.1691433013022107440
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 11:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=JLM8Tdwt;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=JLM8Tdwt;
 spf=pass (domain: arm.com, ip: 40.107.241.85, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lL7dfr2RV1MrmwCEhwUIpUkr6lIf7iT5UeiCG5ouVIQ=;
 b=JLM8Tdwt0fUqg1h3rUQgd06juW/7c4x0sqyO5mWWoWGztkklFtec5YLVCZS824QpWlhkhJTn+Ky5J9dxsoL9XHcwIWDOoq7o27IF4u2CSAck7fOK1GQst7ZnAYeJBZaFlgzePs9deJ83gghNRdMcuJQDteFcPOOSs08FCT4uZwM=
Received: from DUZPR01CA0171.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::17) by AM8PR08MB6434.eurprd08.prod.outlook.com
 (2603:10a6:20b:369::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 18:30:08 +0000
Received: from DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b3:cafe::c5) by DUZPR01CA0171.outlook.office365.com
 (2603:10a6:10:4b3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26 via Frontend
 Transport; Mon, 7 Aug 2023 18:30:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT005.mail.protection.outlook.com (100.127.142.81) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.16 via Frontend Transport; Mon, 7 Aug 2023 18:30:07 +0000
Received: ("Tessian outbound d7adc65d10b4:v145"); Mon, 07 Aug 2023 18:30:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c0275144b42c28a3
X-CR-MTA-TID: 64aa7808
Received: from 95bf6315be24.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E71FD319-D8C6-48D0-B746-83F30ED57148.1;
	Mon, 07 Aug 2023 18:29:59 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 95bf6315be24.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 07 Aug 2023 18:29:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ihArcrG1EnwS2bREAdc+2O4JadkGK+o8Arl5+sRH2OYDEe76YXBzp6lgWHcp1e5HFVkHv+Xko2pzxm6a6XBIwChofjzKJdAKb62U/kG282YA+7qJ4sEJdrrkmegDGGwfTkPP1uIpmFcvluxqzIpsf3V6IS7cX5ZOPPPqUup49x9g5oHHVl0zuy906WqTvaaVEbW9JApw1fx5gL9b7iteQZqnIkXmPYevL5UhCIiXLBqQWpJwcGA8Uqrw8hdg9KwefuIJ5j5YgXjVtKW4CuLiWuKNH3IRNrdMiPUJWkHHFsGVEhLCbv0w4/A00jsx6jBUeIQp/US5KWfykCOL8LRAPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lL7dfr2RV1MrmwCEhwUIpUkr6lIf7iT5UeiCG5ouVIQ=;
 b=RX9HocmK2zrBZsKG/ZPSf9ApHHnSIBHMWUFMoJClWSS0iYXkkp7ossGOiTM8G1Ya0Le6IgNTZT4nUSUKa8Hm8DuDxWYuCeRmjEjWTLq5bSftC1wDouaXElEjNugV9BUVe8+hA7zdq4zoF2mqgulUpmikgfvJ1LsAareoBvJo0HGC5P75WbGnWZypWYzVaUPKly2w7vBEGKr2l8Ukkro2taSefseiq57pOYHIh2NZeED84m7OOGv8DlcEqbNJhEVgk2BVg3uKIM/h/UNTeecOexKYncseHs6XXwV2q3t1sCrtvgFvaJOorhDv9jLAL6dWfDKbCTyjsWNsJrJRo07oUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lL7dfr2RV1MrmwCEhwUIpUkr6lIf7iT5UeiCG5ouVIQ=;
 b=JLM8Tdwt0fUqg1h3rUQgd06juW/7c4x0sqyO5mWWoWGztkklFtec5YLVCZS824QpWlhkhJTn+Ky5J9dxsoL9XHcwIWDOoq7o27IF4u2CSAck7fOK1GQst7ZnAYeJBZaFlgzePs9deJ83gghNRdMcuJQDteFcPOOSs08FCT4uZwM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9791.eurprd08.prod.outlook.com (2603:10a6:20b:614::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 18:29:58 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 18:29:57 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "archana.polampalli@windriver.com" <archana.polampalli@windriver.com>
CC: OE-core <openembedded-core@lists.openembedded.org>,
	"Hari.GPillai@windriver.com" <Hari.GPillai@windriver.com>
Subject: Re: [oe-core]mickledore][PATCH 1/1] openssh: upgrade 9.3p1 -> 9.3p2
Thread-Topic: [oe-core]mickledore][PATCH 1/1] openssh: upgrade 9.3p1 -> 9.3p2
Thread-Index: AQHZyVWEoy8gFQR5IUq2a/iyE6KjTK/fJ50A
Date: Mon, 7 Aug 2023 18:29:56 +0000
Message-ID: <F667C3D9-1270-47D5-AE24-F882E0C77CF1@arm.com>
References: <20230807173433.3261181-1-archana.polampalli@windriver.com>
In-Reply-To: <20230807173433.3261181-1-archana.polampalli@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9791:EE_|DBAEUR03FT005:EE_|AM8PR08MB6434:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b09bf42-7356-41f5-8598-08db9774534f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ImqS59+7hjqv8JR5Kr2ZERwJ8lw85ZwCC1S+LUWwtaaSzdZU57eggMEAUP+9XBYLSN/3MNwuGLSD3xCPtq6r9IQSco1A4ULDA83+S8Sw0tFQwJ9gSSFque1+OOTHFhYYbwG7Re97patwfXZf5J6yhHE4+ZCnsGMpDk39GEyhlK7LSYGQ7QaarYJdxyMBKVQ2IdzICT2+yTqNhWhCBlPa5T8WKGTiExTDZ+FbRa8iSjIYOs77638Xs6yH+SKiDUkCgY/UpQqeTEFrwYU+7Wvw4Mpd4kfYKQwD9FsoGGaUpiVEMkFP1IkNK5TqJ3veTnLtKSTX+L6qR8jRR++fJnIqr314WnBkQIZXrN0kfUn1MDAzMtwerH3/18dhH5nMnWmNGzRCcdws0Nmhk3mdA8Qf4fUdncvMAkfHESdCsBaChh0MDBFnDRjiiH39OyfuZbUAIguz1dWj4Lm2HxuuMn693TV3qVaf9zjLNat3o7WWvrsUG8z0eu3lFbURBvwspsi+IOJIXeBJK304PKv8WXPjUNpTO4NM9NwEQ4nRtVdeisR264dgUjTFaIa/GiV2nbbO9r9w6Td7u8ioratjGoavLd4tENEdxmKGihXEA0hzw+PVFwaW4BqtIFn9fSyUHz8sV+aEG3Uaz7ZKl89A2mjhFQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199021)(1800799003)(186006)(2906002)(36756003)(83380400001)(4744005)(5660300002)(2616005)(71200400001)(38070700005)(54906003)(38100700002)(6486002)(91956017)(66476007)(64756008)(66556008)(66446008)(122000001)(6916009)(66946007)(76116006)(33656002)(6512007)(4326008)(316002)(41300700001)(86362001)(8936002)(26005)(8676002)(6506007)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <182C1491065AEB4A9BEC5694139E689E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9791
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b62afdec-87cd-4be2-495d-08db97744d29
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fyoS0hylzWQYGnaYoml2SYg0iHFpUM4ygVo8eFc3iZcGBUwdvd/rY7T1AzP6AjEfUKMhHX0F+OSfzbPzHH1wu7Syekoh6VIMHOKtsQp4+zBsd/+LvKkDMs8z/S9CjR1u/aJB7HpiwoPLPxgoHN8jD9zvVyIHvKx+HXXbAYTf8W0loRXKYc9K6yfGODrdwsUBP+LBHZRwpQe6wD/+wz1S2vvLl0TBd/ZjTlI1dinguGWQ1Qenf/o4LQ4Ur0aPAnFMEB3dPvbrEZWCDXfTPDsbAbvweh8V03+oht+YqRuNPIbjqAYijBZdixzqUt8Dkov3OAedHO3+m9Qp+HWyAL4/cXYXjWfRANh7zTFSAfPJaS+i2FjU46JmciHYO8e0MTIooNG0sJM481EBdYrOXBsk0RbDdSVaAPthD51YMHMx6E1QatMBvbLX30YxjFR6Zclc38yskP5MSOgC3WZsyKsBGySd/gu7hJr40IBB0jNq7Fi5NV/Xue6zHsNFNFtObjGwCtjK+w5UmAnDRLNGDc24PeX7A9ODiAZgMobwK4ecox9klLGGTe3jYh+h8nJHmoedtQ9BXdWFg1Coy/WkMuxLSXE/gIttuEPwE1XDT0YcG3n765l+tqjdYwt/1KrCVr5S1ffU3y+Y1z+N1Wg6/3+unBvKpbLT88GqcoD70e214BH2vCmnVKF0C638tsIp5hEMnzN9cCyQeFbN89o2LtYy/Ke0pqT7hVsOyBi+r5Pcios=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(39860400002)(346002)(82310400008)(451199021)(186006)(1800799003)(46966006)(40470700004)(36840700001)(86362001)(107886003)(40480700001)(41300700001)(336012)(478600001)(40460700003)(6506007)(8936002)(8676002)(26005)(6862004)(6486002)(4744005)(2616005)(5660300002)(47076005)(36756003)(2906002)(83380400001)(54906003)(36860700001)(316002)(356005)(70206006)(70586007)(81166007)(82740400003)(4326008)(6512007)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 18:30:07.2778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b09bf42-7356-41f5-8598-08db9774534f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6434
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 18:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185617

VGhpcyBoYXNu4oCZdCBldmVuIGxhbmRlZCBpbiBtYXN0ZXIgeWV0LCBzbyBpdCBjYW7igJl0IGJl
IGluIG1pY2tsZWRvcmUuDQoNCkFsc28gd2hlbiBzdWJtaXR0aW5nIGFuIHVwZ3JhZGUgdG8gYSBz
dGFibGUgYnJhbmNoLCB5b3UgbmVlZCB0byBtYWtlIGEgZ29vZCBjYXNlIGZvciB3aHkgdGhpcyBp
cyBhIHNhZmUgdGhpbmcgdG8gZG8gYW5kIG5vdGhpbmcgd2lsbCBicmVhay4gIEZvciBleGFtcGxl
LCBsaXN0aW5nIHRoZSBjaGFuZ2VzLiAgSWYgdGhlIHVwZ3JhZGUgaXMgZm9yIHNlY3VyaXR5IHJl
YXNvbnMgaXTigJlzIG9mdGVuIHNpbXBsZXIgdG8ganVzdCBjaGVycnktcGljayB0aGUgcGF0Y2hl
cy4NCg0KUm9zcw==

