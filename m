Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 434EBC4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 13:15:40 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.85])
 by mx.groups.io with SMTP id smtpd.web10.100058.1701782137206268282
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 05:15:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=K4KzTTaU;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=K4KzTTaU;
 spf=pass (domain: arm.com, ip: 40.107.247.85, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nDrwCrbflZ6NfizKNxW8aeVCvNkVqwkXQ3pBAhKQTydxWBP6iYDIA1IADiX1vaaj7E/XbiKwsm+tc3XyTg/QBxXc8VFErtcMXaasBmpz0yb5MosjVlCUjBLZ1vQjtIm5SMrWeWQB4AcHGVxDGkUWFlEj1kiFleYfdx7QTM6sEFmxvROV6x3haCsSqJdGnVtSY1mEp36ABFLim+aZqgqhPUP9xe6ZE8FSM8SViXevNVGikzmBgrOXEN2P1NhcwlyymimlS0L57DeKNUn3sWx+zQ7TtZjTxek1uJceqsRLKeqRiZunLNw7QMCoKrk8Ep52XDWItkZj+K4Oe8jSdtPy6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/cVvJL5zTcvvkozU1/OMC4ysrhUGSSuryaUSJRkjwA=;
 b=hMEWfQKECPb0MXPSzpeSgxUMEq4iFd2VR19egObH55kiOyJuEnvVRQJ3703NRoSyG0ExVDMdOg7E7JSXHU7nBPTMKlVxEq72SeLOCNkZWbHDl42oKq1MqJdD6S865PyQDdy8CMWZtWSKi1bEqAbfD/1OdiOSHgpBggNojc2usCAVNCe0hSJ/oND0cNT3H8frdqi85uDlKuBFgmayVFs3CSJoWLYNjlTOIp5ERMk7g6nuSfeEudPFJqIxADgnZyNd/XAtKYbs2og+iWl2B0G3K2C2e3enMfrxrBolWWAraV/xOamtNn3Z0VI9/87pp4+2yeV5xFXo0ZZwpfqVJzSBNA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/cVvJL5zTcvvkozU1/OMC4ysrhUGSSuryaUSJRkjwA=;
 b=K4KzTTaUwXVvZlF7aspaUGnrvZ2y4TcS2JpuDewCEZrMLhPEPWHmzk2TA5U7ImwMtIZokHLe32kkU3WB9bNgtHfHIBLCmzf9hLY4L82zcBDhe96llmuMLBa58yD56A7OvoAGBNYPo5Dh2ABjK49R5G4Y8gSk1crT1bbwYP0nQ14=
Received: from DUZPR01CA0031.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::16) by PAXPR08MB6352.eurprd08.prod.outlook.com
 (2603:10a6:102:150::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 13:15:33 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:468:cafe::98) by DUZPR01CA0031.outlook.office365.com
 (2603:10a6:10:468::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Tue, 5 Dec 2023 13:15:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Tue, 5 Dec 2023 13:15:33 +0000
Received: ("Tessian outbound 26ee1d40577c:v228"); Tue, 05 Dec 2023 13:15:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2bd3202b95876eff
X-CR-MTA-TID: 64aa7808
Received: from f05b9e1b8aec.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5CF13302-78AB-4D94-A567-2C3425AF10F8.1;
	Tue, 05 Dec 2023 13:15:26 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f05b9e1b8aec.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 05 Dec 2023 13:15:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhnmX9WEHDEqzCuel+R20BsNZUFJe81pAQ2RjoQSJLC6BoLZN9oUvNOnrdm2ScaY3Io4GwPRR1NMKqIDOgf9TdIIDQDo+lYx/tGbeE9bBIZUz6qiNnWIBsSUOTVOQ8dgHQqZQA6Tk9g5XHxnZFYQV21zCV+hcPfjqFyKea2ercIDHWp71GKlT9PeOkueTQw/OESZOiTfe5YqOS53mSmU5lmALVL2uLYgvLTFgipkiFiKeIvr6WpOWsq3EfPCYDbfQFdPgvmWN45uOMgCJPmUMrKlO4WCthU9R1tSCYBQr4l4ljI3sXOKKucAdIvJ52pPxqeuz3X3wkXmvUh0Pyba5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/cVvJL5zTcvvkozU1/OMC4ysrhUGSSuryaUSJRkjwA=;
 b=I5LYzrp61TqSoh3afm3IRQecppw/Y44XNDK2RQH7bcqyFufMbzRsnUqxjTSUYnGOKNNkOhp53eQjt7bc4mmRlQfqRpTcV1VrTtsaMd6GTj6PtxMwjA6K0UQj1e5Kk5nTM7gd/4hq0Oj+0TGfuhpQDjEXqZepG5WDEKUNWMwUPqidnD9NFsCjqoNnec1Hc85bqMDXLCZ819T9fascyEgWhQXkJF+kcT1m4pSW/jhdWbnInkf9FnXWSKXVmiXEDJ2d6/jdxFf2cGXCEfx7HNhmWLsvaDndGtvpdVJJsVIyVYIeciw1oj9HA9wY7+fKW4+HvAq4nbRFCGObTjY0mRCJwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/cVvJL5zTcvvkozU1/OMC4ysrhUGSSuryaUSJRkjwA=;
 b=K4KzTTaUwXVvZlF7aspaUGnrvZ2y4TcS2JpuDewCEZrMLhPEPWHmzk2TA5U7ImwMtIZokHLe32kkU3WB9bNgtHfHIBLCmzf9hLY4L82zcBDhe96llmuMLBa58yD56A7OvoAGBNYPo5Dh2ABjK49R5G4Y8gSk1crT1bbwYP0nQ14=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8276.eurprd08.prod.outlook.com (2603:10a6:20b:56e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 13:15:24 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 13:15:24 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] tiff: Backport fixes for CVE-2023-6277
Thread-Topic: [OE-core] [PATCH] tiff: Backport fixes for CVE-2023-6277
Thread-Index: AQHaJgS1Zj0l33K8lEOPguveJ1wpgLCariAA
Date: Tue, 5 Dec 2023 13:15:24 +0000
Message-ID: <43878BFD-5BE4-4069-A770-825F3FC0C135@arm.com>
References: <20231203162038.3434707-1-raj.khem@gmail.com>
In-Reply-To: <20231203162038.3434707-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8276:EE_|DU6PEPF0000A7DE:EE_|PAXPR08MB6352:EE_
X-MS-Office365-Filtering-Correlation-Id: e5913e44-2b8f-4b6c-1a0b-08dbf594433e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 yDd9nEFF3lGoUGq0sJhEXPVkY1cn/KKBn/PP4D2lR1bMAn/gcrJt+bPd76twQ7E0Bej7HP7CafWMGpteOT+pNKpaFVzFyhlv814K2fcD6E0dbBTtbtGZxqzPRvxF8vp2bCHME+AXO3GNJdmgbEQdM58xcNCfBR0PSDmxgyR2MidvKaXu7kLFpVOaW/i4+8LRQ6jUzkkZUMAGZxHJwALLVtKaq6XP4h3+auwK9+DEvQw8c8vHbJmXQMzBOZmo2QwsFTYbZ1WToJopFhJpHiUMc7MzG4xJrfM0yKCs59Qre59AI6zz+vwGSR9ww2ilTHrysBtEotLNQ74XrjGu+Grw2vk6QqI5jDs2ucJoC8PPzmz7iFoaEBg1Q+NsfnISS1L2muGH+FEHQjMML3SRqeQG9bLiAwDLxkpWBDw4M44Jwa7Hdn+wFawsONNGUVF2NeIR2jIE0C5EJ0FjL3f+LKHAcfqbhcksUfW5uXgFdxnBcDcbDd39gBE0B4lJjxRzDYHQKxiGx2gvFs3EQWLOjRHEKYZaZnSrw422tp4wjh2PBA9jZsKRyvwqr+prRePAR2FAbwVQOwIXg1mx8lEhntuvUEaclgnj3Krb4f75DdnMZgfBnsvSwSfoMuZkXvjk+z8uoLe+ECDqrf5WXoBwILLWtw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(376002)(39860400002)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(38070700009)(478600001)(6506007)(8936002)(6486002)(122000001)(53546011)(2616005)(71200400001)(26005)(8676002)(91956017)(6916009)(66446008)(64756008)(4326008)(6512007)(66556008)(66946007)(76116006)(66476007)(316002)(38100700002)(5660300002)(33656002)(558084003)(36756003)(41300700001)(2906002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DDE910260508604EA0CBA76A068BE8EC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8276
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6b8f9c96-12cd-4287-0f2e-08dbf5943e07
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Mx0oaJdQnZC1ZuC6zN75NGbTrSRFmtwuyk55GueHNmtuIPnxcyUDC00Weh165XwrlbJsb75iVY4iFGT8h4Hn+ZsRhcu0T/UEoRMPi8iylKcNqCMKQXK5G33ITbZyAmH80hRAXhozWzc5qqPzGnGoY0Sp/2su69Y/flCWLnqfa2oR50sm4T9tYYfR0m/CzcuFmR94Oh1IDYz6Npe3fW9chfrNt8l6Ba+wZLlMthSA9ODmO5yqIrtAYLGLvwpbh8X0AZ6qCVEsN3esNxw/E3caYmvU8EG7O4UUBuB8sYpcVE8mYCAdS3wAp80opS2CWvXWRd75tSRrgpK8sM7Ryx3PrpOJXimjROB29H9K7IqL4ng1hbbwAnTfuM4fnkYjiuV+EeIfJfwatT9wGqUDoP/YPYn3eHpXlSEgh/4VqeZOWdPOSW1VP6Up9LDDZiwUgTUqS3rEfH2HABJKG7BRZ6r2fUr1N3YFUff4gZy4E4Mad5MLj7y+c020syG0Hr6ZgtYNS2fzW+mBXr2MaSjkeUKBvT0D5YWiSHmzGT0J4koR4b8+qwQEWqdKAqpG6gecpS8bG2d3Oe5q9c4imiCwIuheZBv5sIuK+LOpKJ2KLejsImBZR3G9HVIN+sJmUX3G+WFYwTTvQ1iw3zIou/b/f17zQXGpLjOYL2KyZzGVgs3rMbIESSfAem0IAMITYbwS0xUgWS/GskuPpOeNGI3lfzQP/Lahkv894sSal21uaHqSn3LZx6GwJtc7s1d26kIHb5MD
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(39860400002)(136003)(396003)(230922051799003)(451199024)(64100799003)(82310400011)(1800799012)(186009)(40470700004)(46966006)(36840700001)(40480700001)(6512007)(26005)(336012)(81166007)(356005)(6506007)(36860700001)(47076005)(82740400003)(2616005)(53546011)(478600001)(6486002)(40460700003)(70586007)(70206006)(316002)(8676002)(8936002)(6862004)(4326008)(33656002)(2906002)(558084003)(41300700001)(36756003)(86362001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 13:15:33.5165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5913e44-2b8f-4b6c-1a0b-08dbf594433e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6352
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 13:15:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191817



> On 3 Dec 2023, at 16:20, Khem Raj via lists.openembedded.org <raj.khem=3D=
gmail.com@lists.openembedded.org> wrote:
>=20
> create mode 100644 meta/recipes-multimedia/libtiff/tiff/545.patch

This file is created but not used.

Ross=

