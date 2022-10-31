Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB652ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 22:12:20 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.62])
 by mx.groups.io with SMTP id smtpd.web08.2193.1667254333471572377
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 15:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=G0shtRyP;
 spf=pass (domain: arm.com, ip: 40.107.20.62, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bTWWmP+oxJ3xCAmQNuOzUPmSXDQDd1yM7i0b3v20f9ubRlOk/uqZNuSgh5MbXoAXOMKZOA31XucE5tnh9hbg/cJgPC2rbdxchd4YX7MgmucdIJRlgTe5tIC/8ETvig39ybtclD0fpXa7ouir/j2Aw0d++HTvUY+XnAwwPD9E4qS2yFtJ1FEITEJwh2xjcm0zvZR16TfxhALMCcuRcHfeLZCRdHWnwgXvr5iTa/gKOvJ0zZo7xZ14yj0sU5MVXfboN0P2pUymfEUPZ6j1ij8QdqSP8IzbkAzo/rGGG1bGQh51q85kydnpN9DJISWw+bWQKFS1kzmNxzoYZZ+tkt/A+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuK4VDnYpUELlxjZPOQxa7xazrJMPMucuJ4yRWghue8=;
 b=P87W0Iz056gPkRlHwF/G7EltwY62UQ8s4HGBPy26/V4bbJfSqyEkHf8ZsGGSvQNjyHUHoWQZ1w2yA4Q9UPLFUftxuyo3qeNqEpzB90hHVG/FKwR5YhFkKnnE7tADy4c+c9seD3hqWnUgqqv14MXYz8CNaLn2GZZWmy06TZHZYmKMAQ9QvZR2k905na05qXmSoFl+iGf11uQ9CIIisGuFZPM373iYOS+cWbFYfgHUlQJ3FI5yYe5U31PyFiGMVcszrlUK8qP17xl/YjWnbqayflm1WrPEc4uLy/qZolFcx0PCQtKOHSM5pPu3TDVWwqwPd++TBdpEQOR5tNBoFr516Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuK4VDnYpUELlxjZPOQxa7xazrJMPMucuJ4yRWghue8=;
 b=G0shtRyPJCoqWv25hpAsvLyUZKHGQ82VItN/Zl5X8e3dPaIFOI43R4YjKu3GmJ863YdR8InpJDCf3Z/VpOJDVhh6+n77SVqJruqOX1tSy7kewY2gCSAiDkUbVnnBxaPik+8wQFMRzYn4pAGVvG/rN46US86h6mbYWMz8DLJzZYY=
Received: from AM5PR0201CA0013.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::23) by DB9PR08MB9852.eurprd08.prod.outlook.com
 (2603:10a6:10:45f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 22:12:10 +0000
Received: from AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::12) by AM5PR0201CA0013.outlook.office365.com
 (2603:10a6:203:3d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Mon, 31 Oct 2022 22:12:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT056.mail.protection.outlook.com (100.127.140.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Mon, 31 Oct 2022 22:12:09 +0000
Received: ("Tessian outbound 73ab5f36653e:v130"); Mon, 31 Oct 2022 22:12:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 334c8f4698546980
X-CR-MTA-TID: 64aa7808
Received: from 39c10de332f1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 54184738-28C5-49D8-87FE-B262DB6B9DA5.1;
	Mon, 31 Oct 2022 22:12:03 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 39c10de332f1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 31 Oct 2022 22:12:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i6gfscGNROpIjRk4wHZQc+IiuV5yx9tRYHWqvxCJNz8CtAWQEVXKcTOIjJ6zCayXTD2t4S5Fr8z8APEfr3xAqSSpjU+2/QYMeKum0xn8AYWqYvxZD5Pjbv0lqyl4uhRzVM09DUoro9roFdi05Q60CPzGxTiA51lpkPFdFh+kPOGoYtsJI/pkcDJReNlQQuJVahEVaRaHL1+z/e3xODhZAK/tYoTFmw7kktao35OVLi0eBvfS5Tvpie9vwLzSMJJ/HFmtQVnxpzWUrG8vj/hPfChL4ExGl1snJGnJSAjj8+gcq61At6SCdJxxiUVrX6SBnsF2hiXZofbg9+Utv/FbRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuK4VDnYpUELlxjZPOQxa7xazrJMPMucuJ4yRWghue8=;
 b=CWRXq0qcnwbxyIYEgkKNKkv7QMYEMlrzyJt+iXj0vR3hyuk9+3RmhMsrRRVKvbF6dau7P8BwcZ1U1fPytRjbFcml5ydIea2FvITV00lHd/74Mic9yhk/9Xrp9f3sZI2oACkDrayIX/0VvHn5dUwDxGLKLn8njbRA2YTD6+GnB9odWqKTLi79Ke80/ToZ2OXNnQ7OnAuHyuiWlM5SkIORs0wfWDEXhFYXCMXTiTox0p5jjnjQbZ4L1dpu5hjVMadLm36SIKpGfE1CW046nFyXIU54R9VF/u5WVFA+Z5mKBLEuZ3wviPKVsYxADPkrpzLWo0TGCqZmMrln6BnEBfItiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuK4VDnYpUELlxjZPOQxa7xazrJMPMucuJ4yRWghue8=;
 b=G0shtRyPJCoqWv25hpAsvLyUZKHGQ82VItN/Zl5X8e3dPaIFOI43R4YjKu3GmJ863YdR8InpJDCf3Z/VpOJDVhh6+n77SVqJruqOX1tSy7kewY2gCSAiDkUbVnnBxaPik+8wQFMRzYn4pAGVvG/rN46US86h6mbYWMz8DLJzZYY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB5587.eurprd08.prod.outlook.com (2603:10a6:20b:1dd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 22:12:02 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc%5]) with mapi id 15.20.5769.019; Mon, 31 Oct 2022
 22:12:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kiernan@gmail.com" <alex.kiernan@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][PATCH v2 1/3] kernel: classes: Extract savedefconfig to
 a class
Thread-Topic: [OE-Core][PATCH v2 1/3] kernel: classes: Extract savedefconfig
 to a class
Thread-Index: AQHY3grXSrw6sM0rEk20r90TEU7Kb64K9UwAgAA0bQCAHgW+gA==
Date: Mon, 31 Oct 2022 22:12:01 +0000
Message-ID: <C228B32E-EFA8-4A69-A915-4E53FFE719D3@arm.com>
References: <20221012071813.778-1-alex.kiernan@gmail.com>
 <7C7AB85E-C822-4DCC-B462-AD314119EAE4@arm.com>
 <CAO5Uq5Tqqt=oaGQt7kyZUg4gkJ6Uo_ahNR6itZSEwYyDX8rKrQ@mail.gmail.com>
In-Reply-To: 
 <CAO5Uq5Tqqt=oaGQt7kyZUg4gkJ6Uo_ahNR6itZSEwYyDX8rKrQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB5587:EE_|AM7EUR03FT056:EE_|DB9PR08MB9852:EE_
X-MS-Office365-Filtering-Correlation-Id: ed69f4ef-2675-4f2b-af83-08dabb8cf49d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 kLuQ3Lwca5QyOlzF9qPAeWc7gnBkxUuShwJ/n1XLEGkhScsdOPv+Ud2Ti5Sham9Ns0wC5+3NYsUaOejHkIgKijdVQa94rDZkdEVG+l0MKSLszcDw6LfAGw36yqGP5G9y6BuquTN8oHE9b8zr0Sdc2FgEuxozBDZEh5bxaE2KsQDRL+S7VLRvhMZ2vXDO+kzxJiKBS8foKkVvunFJvY0efBMILDffBkQBeTF1S1SVrUI4TdjCy8iyDkGOSSFlJiyC8Nvj4popXfbqgEcECn+xDHMkjIlO7+AU0Cx8hHH9epaSZrnvzFTZ1oSk2+WgqJaiagx/Lqg4QT8b93QzfOZlerbUQk7X6VREG+O64ndkDLnFmnitaXxUNP+Nt9whhDFX1EabSW03HrwLXJyHX7tKCXcu8lSnxShFCxbBkRY6o70+OMxMFlQOXt0CcChjsBZPWNevD+MRwWsNm4ZzAID0Z540n99HAdOHxtpzyRMCKN5ZYAar3BdXn8YTjAGgrhzvTuwmvNGre1rFfCFR9u8xYoKTYW1UaJhroSx5/ENKCu7pUcAl3AURlQKELagAiT016LOrmHzWx3IY2rj/E9pPkC6udXXbMPTaacZVlOAZecD2WSDav06RC/BN0E/jXaD+7A5nq2WNlP8inHraN6wP/cxtGw2eojVoUj/aW9zfsbKtHZJ9NmaQMDe/DvM1F53SVTKnn7QIlzehlQKGcM0+R+nxO3/UHAvCHOVOak+SXoyMX9uBTbeO9TziEWUoDhiIzUOI4thk1EmrBMMUgBjz2xSpi3rqleEIsJWCn1D6Xlk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(451199015)(76116006)(4326008)(66446008)(66476007)(64756008)(6916009)(66556008)(91956017)(66946007)(38070700005)(316002)(38100700002)(8936002)(41300700001)(122000001)(8676002)(2616005)(186003)(6512007)(26005)(5660300002)(4744005)(36756003)(478600001)(6486002)(6506007)(33656002)(53546011)(86362001)(2906002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <45819B4DD90D21459F0492BC8D0E01FA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5587
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9df794b9-9067-4409-ce93-08dabb8cefc9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MEyzXI+HCgFJG5+iSKeg3cg2OakqgckYWZ6CVE1WLarqk8gcoaMJTQYvuIt7pwX4+f6NXkwqYAfkep/z6bQ7HGdZN9PLoO0vH2mMk05e1sVcTAysDbw7R+2NN2zHLAQ320fXvmR1FJXIhSlzaUaSrTEmsahwGWuCHD+pCKeB64lf2m4oPUkVHwvjGMVxwQAZTfSoFZ68+C/ljO/Hv+zJjgigGt8bTyKc4vZmBbEW0LmYrNph4fGVoOB2l/eaUMveHT08rOXHh/qOrsojV2bRLN5R4TDAKEuRQReuOvltSwuBX0chyLpnit6jrarhOA3zULLlxzbuwsVp95q6u+oY6g8fwIZqTKEoNQVBtakTsYKLhhZQoulVceAxnvsLNEXKgfFtPnL15cuAneVd5vFsziyRQ5tHyvJq7qSKj8t+pYKlXTwunwW47Ra6S++XK0Z5g7pTn4V/fSRewSWbNeH8XWsdNDugpO8LaWc6AWfrEFYwjI/Ws+HA++R+iLEhZjNif6pBbFAVcLCgHlOELzuhKM1euUAqV74rrf5XavBpgJCecFAoVp4lMIIg17cCgbrP2KUNbKyT2qUSQ2ObXu/0iFdlxpmMsIWZX1yNWVO5kUss8HVwL16jeQ8Np6IITEgrOYVJosO0tI6BXZfQvTBDdq7bIT/pWaytvQFRryHnTMImBR+CQRnAA18dRu/djQFzs86+kTVHhn0AlgBayXPckDrKiq7UWQ7eWebEF1nHpgCLJOqSr5MuBVS7GJn9YpGyuSMzsVfUfuzbrqKixOQNvw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199015)(36840700001)(46966006)(40470700004)(2616005)(186003)(6512007)(478600001)(26005)(53546011)(6506007)(47076005)(36860700001)(336012)(4744005)(2906002)(40480700001)(40460700003)(82310400005)(316002)(6486002)(6862004)(8936002)(5660300002)(70206006)(8676002)(41300700001)(4326008)(70586007)(36756003)(86362001)(33656002)(82740400003)(356005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 22:12:09.9511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed69f4ef-2675-4f2b-af83-08dabb8cf49d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9852
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 22:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172344

T24gMTIgT2N0IDIwMjIsIGF0IDIwOjQzLCBBbGV4IEtpZXJuYW4gdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGFsZXgua2llcm5hbj1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IA0KPiBPbiBXZWQsIE9jdCAxMiwgMjAyMiBhdCA1OjM2IFBNIFJvc3MgQnVydG9u
IDxSb3NzLkJ1cnRvbkBhcm0uY29tPiB3cm90ZToNCj4+IA0KPj4gT24gMTIgT2N0IDIwMjIsIGF0
IDA4OjE4LCBBbGV4IEtpZXJuYW4gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPGFsZXgua2ll
cm5hbj1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4g
TW92ZSBzYXZlZGVmY29uZmlnIHRhc2sgdG8gYSBjbGFzcyBzbyB3ZSBjYW4gcmV1c2UgaXQgaW4g
b3RoZXIgcmVjaXBlcw0KPj4+IHdoaWNoIHN1cHBvcnQgaXQuDQo+PiANCj4+IFRoZXJlIGFyZSB0
aHJlZSB1c2VycyBvZiBjbWwxIGluIG9lLWNvcmU6IGtlcm5lbCwgdWJvb3QsIGFuZCBidXN5Ym94
LiAgRG9lcyBidXN5Ym94IHN1cHBvcnQgc2F2ZWRlZmNvbmZpZz8NCj4+IA0KPiANCj4gSXQgZG9l
c24ndCBhbmQgZmFpcmx5IG9idmlvdXNseSBnb2VzIGJvb23igKYNCg0KSWYgeW91IHJlYWxseSBr
ZWVuIHlvdSBjb3VsZCBzZWUgaWYgc2F2ZWRlZmNvbmZpZyBpcyBhIHZhbGlkIHRhcmdldCBzb21l
aG93IChzZWFyY2ggbWFrZSAtcCBmb3Igc2F2ZWRlZmNvbmZpZz8pLCBidXQgdG8gYmUgaG9uZXN0
IGdpdmVuIFVscmljaOKAmXMgcmVwbHkgSeKAmW0gZmluZSB3aXRoIHRoZSBjbWwxIGNsYXNzIHN1
cHBvcnRpbmcgYSBmdW5jdGlvbiB0aGF0IG1vc3QgaW1wbGVtZW50YXRpb25zLCBpZiBub3QgYWxs
LCBzdXBwb3J0Lg0KDQpJdCBzZWVtcyBwcmVmZXJhYmxlIHRvIGEgY2xhc3Mgd2hpY2ggaXMganVz
dCAib2VfcnVubWFrZSBzYXZlZGVmY29uZmln4oCdLCBhdCBsZWFzdC4NCg0KUm9zcw0KDQo=

