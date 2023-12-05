Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19601C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 17:16:39 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.65])
 by mx.groups.io with SMTP id smtpd.web11.17.1701796594488804160
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 09:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=esnKUKex;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=esnKUKex;
 spf=pass (domain: arm.com, ip: 40.107.22.65, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=E+eTxwu84141KzH1xUobIoGaH+dyuQIg4+Zwr/arWEjPxRPHinkyQ0QJMjUe3BeJLYkSXKUbH6AIrntuBxt7l3KEO8BmCi0wMRLxR2nKCyzNnAbMUI3mHyPoogs7HlrRDWeiZSdvnNrhQlQ5aSru6NbRsUgnLySHvplnZab/baj0ikqxLTBHal4aUUXopl1NeILcSNiD9CYPU+4dwSvwo5tQSeQkJhl/vpNtpjarpggTteCkU2ZcwBo4/8l5syTia3tDUceOK6vW5wHzW4ZyBzicOhgKmmwfrR9kAvAwXRLBs6iYD/rtxIpPUWeakiIFDoIuvrkEE5pyAtIXDOiTBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdU6QA3dA8U4dm9BlToDbZInZ7pmEPq0rqywAYYL4XU=;
 b=KvAmB+t7jjDfW5RKmeX/i8r8vHW9Szor/8MTEaEYlraUgpT7fJebKgD8hSQccAIoE8iiR5PSuD5xBUIqvl+o3RdJNvvvgVNZt+qpJvJEmQ1j0uPBcjXQGIot4iCLUxCLlcouyc9xwAEKIQ6QXjyaiMdhQvi0JC0+OkPBzVx0T06kxRMuEWDOoT1rdgRjps4bLkQIdb9/RW0LZ32SC9e7oQPiCr882ehQQQ6clmVx1HDDUUd4TKP64DMtiV3RQjvZxksx6yHJDGdNTjWeAYNi0U2CR/BClrkcmFmYfBFxZYCskJvL2HOZYULc/QtbguDyaV+MqxPVrudrF6cfZAqoJA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdU6QA3dA8U4dm9BlToDbZInZ7pmEPq0rqywAYYL4XU=;
 b=esnKUKexbCCFSTXh0xqiIKn3EOJl+cjIzUuohzHijMI+BCTUFGqlypWeqxxnshpHYAgSy1jqa8asgjlCrc+fDs5Z6YI5wXtNXlDy93qf5NHxvypNtfKkOXTyTWtNzGbbb3CpVnyeXchVgTi9k+GDvJrIQP2ONNojFfxHbXYEs9A=
Received: from AS9PR06CA0081.eurprd06.prod.outlook.com (2603:10a6:20b:464::19)
 by VI0PR08MB10426.eurprd08.prod.outlook.com (2603:10a6:800:20d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 17:16:30 +0000
Received: from AM2PEPF0001C712.eurprd05.prod.outlook.com
 (2603:10a6:20b:464:cafe::cb) by AS9PR06CA0081.outlook.office365.com
 (2603:10a6:20b:464::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Tue, 5 Dec 2023 17:16:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C712.mail.protection.outlook.com (10.167.16.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Tue, 5 Dec 2023 17:16:30 +0000
Received: ("Tessian outbound e243565b0037:v228"); Tue, 05 Dec 2023 17:16:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bcd7f7e33a3aef31
X-CR-MTA-TID: 64aa7808
Received: from 00becdbf04b3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5A208ECF-6C31-441A-B9FC-B005D4FF4C34.1;
	Tue, 05 Dec 2023 17:16:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 00becdbf04b3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 05 Dec 2023 17:16:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWn3Y/jBQ/qRS70qG5g5Lc50hklE7BCrG2WYAOUKbli38YUiOhBvjMsi1DJAJcd3ZXpcIvwLIH5lh5kpty0JN2O4QidqtqlPHxFfm8GxGByi5oh78FJ4KcEr2eYf1xwJ5Zf00LCdWSScFDQ0k0qe4KFuqojSpUmYQdmFoStDnyQ1ttif/cyr4oG2t520m9Fl9mmvWj5kPfwQVbPb/zSeUrgsWYFRtlq0Rnk6h8qMXVzqRCTb/LQNIbutw6K/IOEZFnMu+46pEe//smn2flxMWK+9SA6eHa+zxqk4lxD3c9p/CcmgJOeFll8Y2PwCWGA13nQfr65J669+191Gg8b2WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdU6QA3dA8U4dm9BlToDbZInZ7pmEPq0rqywAYYL4XU=;
 b=Dqn3L2a0Bp6SATRJUXFfsylOIhefPsmIhc44dE9RSUq49vs/qX/icZSyQ1QCnJmdg4ugYi8G/1HZc90Sv1fZenZzKkW4eKURPg/byq+tIUUwrNua/nXti0o22E5JmRdFqsjYUDvz05MGa47kSKWWZLdSKSwIh4ZYG6RmvWIcOrtLuwhf7iOMzOOZIpF1UixFCPRW2+it3AgvizAVmM3xouvuSlOauKC5IUmE1icrvKRMXDTjN2Fq49MKF92hWyVUK0p2Y7U0Z7AQ8CivXA4L8dpY7KnNaELRCnjBBSYox0ERCv+j8sjHJN4Hyb+SNO9C2MVRxnU1reuQWbeKsf3UfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdU6QA3dA8U4dm9BlToDbZInZ7pmEPq0rqywAYYL4XU=;
 b=esnKUKexbCCFSTXh0xqiIKn3EOJl+cjIzUuohzHijMI+BCTUFGqlypWeqxxnshpHYAgSy1jqa8asgjlCrc+fDs5Z6YI5wXtNXlDy93qf5NHxvypNtfKkOXTyTWtNzGbbb3CpVnyeXchVgTi9k+GDvJrIQP2ONNojFfxHbXYEs9A=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB3PR08MB9110.eurprd08.prod.outlook.com (2603:10a6:10:428::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 17:16:20 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 17:16:20 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] CVE checks for meta warnings
Thread-Topic: [OE-core] CVE checks for meta warnings
Thread-Index: AQHaJ5jxksk6l1h5l0uZgKsA9BhpYbCa7kiA
Date: Tue, 5 Dec 2023 17:16:20 +0000
Message-ID: <5F3C3672-8F0F-4839-8A7E-B83F36DB4A0A@arm.com>
References: <202312051634105ba1b1d7@mail.local>
In-Reply-To: <202312051634105ba1b1d7@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB3PR08MB9110:EE_|AM2PEPF0001C712:EE_|VI0PR08MB10426:EE_
X-MS-Office365-Filtering-Correlation-Id: 02c9b8ee-fbb0-463e-f3ab-08dbf5b5ec1a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 xGMXVREdc3/korCv6GZMxTqtMWBakHH/KMJ8Zd7Cuq7+G7PEC9hO5hM4iezudBrQ3MaZs5dykbHoftuttbRaGMBr1bx4F5D99BuBpGlWxC9LozUdL6vuPNpY/WP4iIQXZyUSBG+ruXfC0kdll0GN+CXE9H7C++Qgppqa+KGAWyLvUbKsfGO5Z26j4m1yJ8V3AGo03gL5trG74dEPKQGQZhndR2pkhEzs+NHDXpRdiqBuiMKJR+aCSZgFvCHxa0W+1mAULqLfOW0Bx8VklTTUZtipUNFGF2c43kXBKW4rjIdJHrfrvnxpz7EMtE8ltkgeJQkvZJZ3eTapkmfZvHjojfi+LdTkiFpRUi/yUxDA5AVQCzog+GMsimI17izhzLeGgNZ66BZ5qZZlwKJ0fCp9ZnBU3mUWKM7r265hGHYmIpfn+FHZ815SUr3hf/PV1Rs7q+l0s0qbsQAHuGh6j4q09/G3pNLRZ1m5FT73vipJphQbGyJ5nJc4gtmqVZBiWP5el7PTNGhI2T/vkTdk55gfSFAw/AWIxckuuGu/w1JJvo+v7OhoRhMrvf6lwz5XCgboGodvI4PnuWkg82XU2/WxCIUWCPZt4dwlQ5iadgVEyxIQYmfH+BDEvZJQMwg1B35yLc/5Hln6S6P+XVDNBlGKjGNl2Jm3ILUNs2Ls2THZkMHIMx/2fffS+kV2QYJ9fM6c
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(346002)(136003)(396003)(366004)(230173577357003)(230922051799003)(230273577357003)(451199024)(64100799003)(1800799012)(186009)(6512007)(26005)(38100700002)(83380400001)(6506007)(2616005)(122000001)(53546011)(71200400001)(478600001)(966005)(6486002)(66946007)(76116006)(66556008)(64756008)(66476007)(66446008)(6916009)(91956017)(316002)(8676002)(8936002)(4326008)(33656002)(2906002)(36756003)(41300700001)(38070700009)(86362001)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD22AA978FF241468416EEF4692ABCDF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9110
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	50f5a199-8627-47cc-c3e3-08dbf5b5e621
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZnPzw94GxENQ8PMU9OKs+B1syhh0FnuBVhwHtoMunBvDh+Rf3N9zU0m4eU9bYpXX8TnbQGW4s03qEvm9wgnF72M0kTL45v1/39yGd6f1VYK5hHLDtAovKRyGjv1Md/637NihG3EYKisPcx6K6oV7Y/C/MKVy1+zuKEIMS4SfJEQb7Yd1LsR83VVQ9KoyIr8I4OOmxoEW4xC31McHT6Ip2J7cb4THL8KNr1e0JISyq8Ijd0pBuROkp4lSeq9GnhmYAZOyiFPN9ByLjl+Sj6FmgAvHmiXDq4n6nsVZo/JZItZdmptc/n+DdKwV1jV3wM7+QwjhCcu3ymdFTmotyBBB7bpsObyc11cPIgMBg00Zz4n4lYcn2hgJP3MmsoRxxJZFZ0w2pMfA92R53At4ZfeHc3d3cYb9T0h5dHBm5BcBh40GxZwV7WslhOeOM4zXKrjrzganUHluu0OoEcJi09EgBTWXQCJDvr1+GJFdMDo5lPdKl+BpMUj9p2N/Tj+bBoON0iwpt1Fmu9t2wIF+lMfgjEEcalOWMQ5zi6fVVZ8MrkgfO3Cyj9nLB+7ObeQPK5lNFwVhmhVe2vqW1pohuugMrkVTr3jCDUop7Vf4yX0DjX/xH1Ff6AbwyknQ0lvJNLhyFJeuorgVOQtXTP1T2a9OmeMufyrRmRFzs07q6eU8xZiiygsgBmO/QIvFhNeBiRoUQMLn79kLtgLdqTfIPmJnnyIsBZjaaN+zhAFg8cbqzxFLNAETuHJJKFtwEI8u+S23UnjVfmHB+T+gUnl7X0Vsfw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(136003)(396003)(230173577357003)(230273577357003)(230922051799003)(186009)(64100799003)(82310400011)(451199024)(1800799012)(36840700001)(40470700004)(46966006)(40480700001)(36860700001)(2906002)(33656002)(316002)(70586007)(8676002)(86362001)(70206006)(36756003)(41300700001)(8936002)(4326008)(6862004)(356005)(47076005)(5660300002)(82740400003)(81166007)(966005)(6486002)(83380400001)(478600001)(40460700003)(26005)(336012)(2616005)(6512007)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 17:16:30.1507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c9b8ee-fbb0-463e-f3ab-08dbf5b5ec1a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10426
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 17:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191849

T24gNSBEZWMgMjAyMywgYXQgMTY6MzQsIEFsZXhhbmRyZSBCZWxsb25pIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxhbGV4YW5kcmUuYmVsbG9uaT1ib290bGluLmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IEhlbGxvLA0KPiANCj4gUnVubmluZyBjdmUtY2hlY2sg
YWdhaW5zdCBvZS1jb3JlIG5vdyBnZW5lcmF0ZXMgYSBmZXcgd2FybmluZ3M6DQo+IA0KPiBXQVJO
SU5HOiBhdXRvbWFrZS1uYXRpdmUtMS4xNi41LXIwIGRvX2N2ZV9jaGVjazogYXV0b21ha2U6IEZh
aWxlZCB0byBjb21wYXJlIDEuMTYuNSA9IGJyYW5jaF8xLTkgZm9yIENWRS0yMDA5LTQwMjkNCj4g
V0FSTklORzogc3VidmVyc2lvbi0xLjE0LjItcjAgZG9fY3ZlX2NoZWNrOiBzdWJ2ZXJzaW9uOiBG
YWlsZWQgdG8gY29tcGFyZSAxLjE0LjIgPSBtMSBmb3IgQ1ZFLTIwMTAtNDUzOQ0KPiBXQVJOSU5H
OiBzdWJ2ZXJzaW9uLTEuMTQuMi1yMCBkb19jdmVfY2hlY2s6IHN1YnZlcnNpb246IEZhaWxlZCB0
byBjb21wYXJlIDEuMTQuMiA9IG0yIGZvciBDVkUtMjAxMC00NTM5DQo+IFdBUk5JTkc6IHN1YnZl
cnNpb24tMS4xNC4yLXIwIGRvX2N2ZV9jaGVjazogc3VidmVyc2lvbjogRmFpbGVkIHRvIGNvbXBh
cmUgMS4xNC4yID0gbTMgZm9yIENWRS0yMDEwLTQ1MzkNCj4gV0FSTklORzogc3VidmVyc2lvbi0x
LjE0LjItcjAgZG9fY3ZlX2NoZWNrOiBzdWJ2ZXJzaW9uOiBGYWlsZWQgdG8gY29tcGFyZSAxLjE0
LjIgPSBtNFwvbTUgZm9yIENWRS0yMDEwLTQ1MzkNCj4gV0FSTklORzogc3VidmVyc2lvbi0xLjE0
LjItcjAgZG9fY3ZlX2NoZWNrOiBzdWJ2ZXJzaW9uOiBGYWlsZWQgdG8gY29tcGFyZSAxLjE0LjIg
PSBtMSBmb3IgQ1ZFLTIwMTAtNDY0NA0KPiBXQVJOSU5HOiBzdWJ2ZXJzaW9uLTEuMTQuMi1yMCBk
b19jdmVfY2hlY2s6IHN1YnZlcnNpb246IEZhaWxlZCB0byBjb21wYXJlIDEuMTQuMiA9IG0yIGZv
ciBDVkUtMjAxMC00NjQ0DQo+IFdBUk5JTkc6IHN1YnZlcnNpb24tMS4xNC4yLXIwIGRvX2N2ZV9j
aGVjazogc3VidmVyc2lvbjogRmFpbGVkIHRvIGNvbXBhcmUgMS4xNC4yID0gbTMgZm9yIENWRS0y
MDEwLTQ2NDQNCj4gV0FSTklORzogc3VidmVyc2lvbi0xLjE0LjItcjAgZG9fY3ZlX2NoZWNrOiBz
dWJ2ZXJzaW9uOiBGYWlsZWQgdG8gY29tcGFyZSAxLjE0LjIgPSBtNFwvbTUgZm9yIENWRS0yMDEw
LTQ2NDQNCj4gV0FSTklORzogc3VidmVyc2lvbi0xLjE0LjItcjAgZG9fY3ZlX2NoZWNrOiBzdWJ2
ZXJzaW9uOiBGYWlsZWQgdG8gY29tcGFyZSAxLjE0LjIgPSBtMSBmb3IgQ1ZFLTIwMTEtMDcxNQ0K
PiBXQVJOSU5HOiBzdWJ2ZXJzaW9uLTEuMTQuMi1yMCBkb19jdmVfY2hlY2s6IHN1YnZlcnNpb246
IEZhaWxlZCB0byBjb21wYXJlIDEuMTQuMiA9IG0yIGZvciBDVkUtMjAxMS0wNzE1DQo+IFdBUk5J
Tkc6IHN1YnZlcnNpb24tMS4xNC4yLXIwIGRvX2N2ZV9jaGVjazogc3VidmVyc2lvbjogRmFpbGVk
IHRvIGNvbXBhcmUgMS4xNC4yID0gbTMgZm9yIENWRS0yMDExLTA3MTUNCj4gV0FSTklORzogc3Vi
dmVyc2lvbi0xLjE0LjItcjAgZG9fY3ZlX2NoZWNrOiBzdWJ2ZXJzaW9uOiBGYWlsZWQgdG8gY29t
cGFyZSAxLjE0LjIgPSBtNFwvbTUgZm9yIENWRS0yMDExLTA3MTUNCj4gV0FSTklORzogYXV0b21h
a2UtMS4xNi41LXIwIGRvX2N2ZV9jaGVjazogYXV0b21ha2U6IEZhaWxlZCB0byBjb21wYXJlIDEu
MTYuNSA9IGJyYW5jaF8xLTkgZm9yIENWRS0yMDA5LTQwMjkNCj4gV0FSTklORzogbXBnMTIzLTEu
MzIuMy1yMCBkb19jdmVfY2hlY2s6IG1wZzEyMzogRmFpbGVkIHRvIGNvbXBhcmUgMS4zMi4zID0g
cHJlMC41OXMgZm9yIENWRS0yMDAzLTA1NzcNCj4gV0FSTklORzogbXBnMTIzLTEuMzIuMy1yMCBk
b19jdmVfY2hlY2s6IG1wZzEyMzogRmFpbGVkIHRvIGNvbXBhcmUgMS4zMi4zID0gcHJlMC41OXMg
Zm9yIENWRS0yMDA0LTA5ODINCj4gV0FSTklORzogbXBnMTIzLTEuMzIuMy1yMCBkb19jdmVfY2hl
Y2s6IG1wZzEyMzogRmFpbGVkIHRvIGNvbXBhcmUgMS4zMi4zID0gcHJlMC41OXMgZm9yIENWRS0y
MDA0LTEyODQNCj4gV0FSTklORzogbXBnMTIzLTEuMzIuMy1yMCBkb19jdmVfY2hlY2s6IG1wZzEy
MzogRmFpbGVkIHRvIGNvbXBhcmUgMS4zMi4zID0gcHJlMC41OXNfcjExIGZvciBDVkUtMjAwNi0z
MzU1DQo+IFdBUk5JTkc6IG1wZzEyMy0xLjMyLjMtcjAgZG9fY3ZlX2NoZWNrOiBtcGcxMjM6IEZh
aWxlZCB0byBjb21wYXJlIDEuMzIuMyA9IHByZTAuNTlzIGZvciBDVkUtMjAwNy0wNTc4DQo+IFdB
Uk5JTkc6IG1wZzEyMy0xLjMyLjMtcjAgZG9fY3ZlX2NoZWNrOiBtcGcxMjM6IEZhaWxlZCB0byBj
b21wYXJlIDEuMzIuMyA9IHByZTAuNTlzX3IxMSBmb3IgQ1ZFLTIwMDctMDU3OA0KPiBXQVJOSU5H
OiBtcGcxMjMtMS4zMi4zLXIwIGRvX2N2ZV9jaGVjazogbXBnMTIzOiBGYWlsZWQgdG8gY29tcGFy
ZSAxLjMyLjMgPSBwcmUwLjU5cyBmb3IgQ1ZFLTIwMDktMTMwMQ0KPiBXQVJOSU5HOiBtcGcxMjMt
MS4zMi4zLXIwIGRvX2N2ZV9jaGVjazogbXBnMTIzOiBGYWlsZWQgdG8gY29tcGFyZSAxLjMyLjMg
PSBwcmUwLjU5c19yMTEgZm9yIENWRS0yMDA5LTEzMDENCj4gDQo+IGh0dHBzOi8vYXV0b2J1aWxk
ZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvMTM4L2J1aWxkcy84MjMvc3Rl
cHMvMTUvbG9ncy93YXJuaW5ncw0KDQpUaGF0IHdvdWxkIGJlOg0KDQpjdmUtY2hlY2s6IE1vZGlm
eSBqdWRnbWVudCBwcm9jZXNzaW5nIHVzaW5nICI9IiBpbiB2ZXJzaW9uIGNvbXBhcmlzb24NCg0K
SSB2b3RlIGZvciByZXZlcnRpbmcgaXQsIGl04oCZcyB0b28gdmVyYm9zZSBhbmQgd2UgY2Fu4oCZ
dCDigJxmaXjigJ0gdGhlIENQRSBkYXRhIGFzIGl04oCZcyBub3QgYnJva2VuLg0KDQpSb3Nz

