Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4597EC61DF7
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 12:40:57 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.87])
 by mx.groups.io with SMTP id smtpd.web11.89911.1700743246905819905
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 04:40:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=WfjQ3HtQ;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=WfjQ3HtQ;
 spf=pass (domain: arm.com, ip: 40.107.21.87, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Z8VZRFaNFB+hXpkOyoChVrMubICEjdXmuI8t+h5K4JZym1erksNfF5YOj2pzTxsfRqSvipSwKtApiBEP/adWaGnYAO2WgQG42YpyvJMIAw4vMFaL56fzsrBodK5SGbupSMVZGLEKdj3PGyLn1DFgqSZrAPeE2oMli+CmhUW0HcDl7mcTmmth/7kYykxp+LaC9zQa626TGBi1YljuUgVhbZDasJegN+JLXxrXi9QRkITlyiGp4qodl60eYjVQeaNKE9YEgEm2mRVUtasCirXbUGBdQLm20srR0PumHuoKttVmxvOlNs31DZcNKbEiG0UEPbjgXpq8Kk03fNOgmovN+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81HjkHfL7Xmx+jrmlL610AB4FKtnlIL5zVQ6o8ypsNs=;
 b=P8YWOOt532EGAY1NzpSQqr5mFFaneiaATg5zsaZ2XZZm059ZKwNOMM5Sd8x9W06FtMuDGcISeS/siIy+SUwAc9uh+Ws/p8hIw/YMLTH0GvWuB0benRolWETvNJJHS5in4lMNwmJxt8UoJ3TWsAAl7NhClz6sTC1AQBlBAjKiotvlI+JrX5M5EKUZyvPHow6Ze7Q5R0vflqpnbJ0sYZfHk/B6nTpT7tey5B7ecFh6HJSNP8fjYOU8jHg1GK9dEbW5eYfRDyeGOMNYCsFO3D4B3GxToxg4nvnYszSyyHNqQG/gA6IDTbzQRRb5uo/R/T4GrnbDs7gY/1uzq6tNF1sikQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81HjkHfL7Xmx+jrmlL610AB4FKtnlIL5zVQ6o8ypsNs=;
 b=WfjQ3HtQ+CTrbN8P73jQQ03AN6Rn9KOOhEOf1Eh50YPp1ZySdjVWPC5vZDO6osIuSpPluJD+jLkpRe9kfvi4JblWfql5oi4dxLeT2MaXU2AQafkbjXF8PQqj7i4mNI97L2LCzB5FvkEa/VSZt3gX3ezqt8TAsMcVMXiRCFRJX/M=
Received: from AS4P189CA0006.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::10)
 by AM0PR08MB5508.eurprd08.prod.outlook.com (2603:10a6:208:186::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Thu, 23 Nov
 2023 12:40:41 +0000
Received: from AM4PEPF00025F97.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::7a) by AS4P189CA0006.outlook.office365.com
 (2603:10a6:20b:5d7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28 via Frontend
 Transport; Thu, 23 Nov 2023 12:40:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F97.mail.protection.outlook.com (10.167.16.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.3 via Frontend Transport; Thu, 23 Nov 2023 12:40:41 +0000
Received: ("Tessian outbound e243565b0037:v228"); Thu, 23 Nov 2023 12:40:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0bf82cc2a70d1b24
X-CR-MTA-TID: 64aa7808
Received: from cbdff8f94353.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 43D3017D-B2D6-495E-9C8F-2D6E35505763.1;
	Thu, 23 Nov 2023 12:40:34 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cbdff8f94353.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 23 Nov 2023 12:40:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqpRJ/ZWkghZtaHfDfCfDVLTwQMcaEvK2oJISpHypiwrqRD31a6++E1RQ90Uuy0TAyQvcN1CyU03/Yy4x1JFMAx+c05NaWu+Ed2eYhPoM5H87G6y7BalZWMpvzrrDn+nprhetDs9niLV92ZbVzDtxilet8h1eliVsiwwL+ky9orEnSHQ/K5rONsVkZ2eQEcY/EzD2M90ysRYmp0SbJygqmCGutUKHL8peGDS63Sm6iAjFMWZqjtmRobvHi0dWdFhl75Ep6aIt/A6TTJe8uQJtSsmzN9yrj8lFdnVc9CVya6AWZQhzY9aJ9x+mMkAS70OGgOWbx49uJmtNGPbjnCfFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81HjkHfL7Xmx+jrmlL610AB4FKtnlIL5zVQ6o8ypsNs=;
 b=NVIi1iaTKWzvNf849d8tctLdZRgTV8ctYHF+CzA1WU02Kkn0zCjH2CBFzIY6Rsyaj+UBvo4Hqo0z3Qvpha8zzKFo3tfpvU9jIgRvDTHFkepN/26LpVcEvLzOVye1LvwbcOHqoZo2bAAwDhmhB16pHP1Vb0A5pv5xRQMFwkFopeOE3H4wVjtPAub0YO55GO1Fqv582nNhoTeZBbJ2QXDi0L5MT/jQc8HfIB7G4hZY7RCLLbOUUdqBltzpV8FJEX16pQ/tIFtrVWHXruSkjwwPkhFKXyjI/TiPKHHbm/jCK9mQ5qBQu59NYB9EeZEHXEYlWB3o1zm23BI7cnGdNvbC0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81HjkHfL7Xmx+jrmlL610AB4FKtnlIL5zVQ6o8ypsNs=;
 b=WfjQ3HtQ+CTrbN8P73jQQ03AN6Rn9KOOhEOf1Eh50YPp1ZySdjVWPC5vZDO6osIuSpPluJD+jLkpRe9kfvi4JblWfql5oi4dxLeT2MaXU2AQafkbjXF8PQqj7i4mNI97L2LCzB5FvkEa/VSZt3gX3ezqt8TAsMcVMXiRCFRJX/M=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9460.eurprd08.prod.outlook.com (2603:10a6:102:316::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Thu, 23 Nov
 2023 12:40:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7025.017; Thu, 23 Nov 2023
 12:40:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Deepthi.Hemraj@windriver.com" <Deepthi.Hemraj@windriver.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	"Randy.MacLeod@windriver.com" <Randy.MacLeod@windriver.com>,
	"Naveen.Gowda@windriver.com" <Naveen.Gowda@windriver.com>,
	"Shivaprasad.Moodalappa@windriver.com"
	<Shivaprasad.Moodalappa@windriver.com>, "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>, Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH V2] rust-cross-canadian: Fix file conflicts for
 arm and aarch64
Thread-Topic: [OE-core] [PATCH V2] rust-cross-canadian: Fix file conflicts for
 arm and aarch64
Thread-Index: AQHaEi1XNC+BWqLm+0uWi11I1Y8L37CH8BcA
Date: Thu, 23 Nov 2023 12:40:32 +0000
Message-ID: <D74A1C47-8F20-4E55-AF81-B46D63A79F5C@arm.com>
References: <20231108102045.3190366-1-Deepthi.Hemraj@windriver.com>
In-Reply-To: <20231108102045.3190366-1-Deepthi.Hemraj@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9460:EE_|AM4PEPF00025F97:EE_|AM0PR08MB5508:EE_
X-MS-Office365-Filtering-Correlation-Id: 2705105d-f3e4-4a15-c20d-08dbec216793
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 KhLC2m/NCvjzCgVbK5UDaaxzQrViemhKtW/XWeTabsKJiFCEY+dNTtWSnegdq8XzXuqCVTuJ+WOyeaNZO17AToj0pfH+Y0FwrDtGOSWOwUR8j2D+M7GgEGufgRjU6rlZIsBUkUe7d/bW3FxwRocZ1y5q440g7FT6TnmmobfuWKdpVi/f0UFh/9nFmtLNUsnQ9PSO2Xc8W6BYHEEOJfdRXMO/N47t3XCh+i8NGh4//hF2O6yEp74CufeyKO5zPXgSGb0TbdB+X0ePerKLLQjgnGuODizHqzhxRPKrLUe5ycsWhJlmToRsnPldQkbmXrEEzzZZ9m5IIXbTF0OIJZz0mIifobPw7+8i3vH1m0n9zA6NvNsDO2RCCA6bV17SsSUeEbRh4uwWG/YgY8rixCbAGSByTFP4ytG/gSHoEbAEuaPYRsEjBLRZwixNMnKfnC/Zvx62uSUa4iI3JblUG6mOA1EkGRMmJfZ/7tSf7LGSYVH1hMX7FrxazTfS8WE91Xxbflf9kQ8sQ1fop20d84jptWXvw1gtutdHOxBeH0GhETuDEODITSXcQvqOwgQi16v+cefl/tUN54PDp4R0E2bicLrnt9teAm/ZfW55piYqP7djtfp6d6aixSiNd6QVcmqaqj+1RiZFPmxFd3y0pEiZ2Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(36756003)(41300700001)(2906002)(33656002)(86362001)(4744005)(38070700009)(26005)(2616005)(53546011)(6512007)(6506007)(66556008)(71200400001)(6486002)(478600001)(38100700002)(122000001)(5660300002)(6916009)(76116006)(4326008)(64756008)(66946007)(54906003)(8936002)(316002)(66476007)(66446008)(8676002)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B8A06F12D4973448EDB741942FA0AC6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9460
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7cfb90e7-9f41-47f1-e64d-08dbec2161e9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i9CPQLl83mZTKoEQRYg3dia685hyZk08T0/ah7lqd3Ul+c4dMyZDzX4DQ22C4abll/XMVnXdoY0ZvIWcikwKYzClk5iMdwG+U3uQIjUUsVPUWtWndTONWk1+L82oPchSqkdut6YOLahzQnLMrQoFbKCjJmuZB76zWWoNQ9oiY7a6Lokp1f4UBlStES8Mo/t3XyW0q8YMecwD1Adp7Q9vXJ8pIezaXWAvOXNrPHZ7354pE72MzigAVAKSVY3tMF0k/aNLkCfK4qEzO/BixTVlKPUCJjUxOjLnQAqhZ9/0KOpoG6jML4o5d0gnY2Jz4nZunDxkfRsBFs0XT5XQRpY6oPiBAwUXtZYk0JlBfDFYcxrR8IxMNO872hmhQR5lSF1Z+N+IU4wTWX9fXNBOCXw1+yXynPQtwuy3ZOmrLbNei/4JEDqVDi4Jt7IUw+Ws739kIU/WphMHIv/Mw98W2/6TAHYs4BVpk4NZsNd1NxVcyJUCdpuY/e3fXnw/AChjNf5K7gZu7/jseKM0wuaLdeDm8/6AS87DqHssiGO0NKTcAxXzNGJfpXHhKgmihnUGMKhIuErhhMaBhyGQFfbJrs9DsfpHXRKR+vZdnlFrkQePubdzAZYC9/8C+ngemKKZRDOc0kncTBixcx9z3GXV1Mn2VcNJrJKkC9TASnCkkQXv6jhIRLPb1572GtSw4LCemcZGmhiy9zXkd1/RCQmIl94kiw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(64100799003)(1800799012)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(40480700001)(47076005)(356005)(6506007)(2616005)(107886003)(6512007)(81166007)(36860700001)(54906003)(316002)(70206006)(70586007)(6862004)(4326008)(8676002)(8936002)(478600001)(6486002)(82740400003)(336012)(26005)(86362001)(5660300002)(4744005)(40460700003)(2906002)(33656002)(36756003)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 12:40:41.8401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2705105d-f3e4-4a15-c20d-08dbec216793
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5508
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 12:40:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191145

T24gOCBOb3YgMjAyMywgYXQgMTA6MjAsIEhlbXJhaiwgRGVlcHRoaSB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8RGVlcHRoaS5IZW1yYWo9d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiB3cm90ZToNCj4gKyAgICAjIFNldCB1cCBlbnZpcm9ubWVudCB2YXJpYWJsZXMgZm9y
IEFBcmNoNjQNCj4gKyAgICBpZiBbICIke1RBUkdFVF9BUkNIfSIgPSAiYWFyY2g2NCIgXTsgdGhl
bg0KPiArIENBUkdPX0VOVl9TRVRVUF9TSD0iJHtFTlZfU0VUVVBfRElSfS9jYXJnby1hYXJjaDY0
LnNoIg0KPiArIENBUkdPX1RBUkdFVF9TWVM9ImFhcmNoNjQtdW5rbm93bi1saW51eC1nbnUiDQo+
ICsgICAgZWxpZiBbICIke1RBUkdFVF9BUkNIfSIgPSAiYXJtIiBdOyB0aGVuDQo+ICsgQ0FSR09f
RU5WX1NFVFVQX1NIPSIke0VOVl9TRVRVUF9ESVJ9L2NhcmdvLWFybS5zaCINCj4gKyBDQVJHT19U
QVJHRVRfU1lTPSJhcm0tdW5rbm93bi1saW51eC1nbnVlYWJpIg0KPiArICAgIGVsc2UNCj4gKyBl
Y2hvICJVbnN1cHBvcnRlZCBUQVJHRVRfQVJDSDogJHtUQVJHRVRfQVJDSH0iDQo+ICsgICAgZmkN
Cg0KV2h5IGRvZXMgdGhpcyByZXN0cmljdCBydXN0LWNyb3NzLWNhbmFkaWFuIHRvIGFybS9hYXJj
aDY0PyAgeDg2LTY0IGlzbuKAmXQgdW5zdXBwb3J0ZWQgYW5kIHByZXN1bWFibHkgYSB4ODYveDg2
LTY0IG11bHRpbGliIHNldHVwIHdpbGwgZmFpbCB0aGUgc2FtZSB3YXk/DQoNClJvc3MNCg0K

