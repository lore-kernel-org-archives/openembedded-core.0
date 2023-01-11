Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04FDC5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 18:04:21 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.47])
 by mx.groups.io with SMTP id smtpd.web10.31511.1673460251358783204
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 10:04:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=YO8cSBt5;
 spf=pass (domain: arm.com, ip: 40.107.104.47, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TsQ4bVkTzOEWtz+5ZXhEt3XtbCi4WWgQ5Au3dlEhh4=;
 b=YO8cSBt5gvexnMYJSB+hF3bv0PrzsNGTQHQjajys/cpzDM9g5atb8LyyVyIN8sZx+VmBlQRuKpJ1FTP+BHpYZ8ugnJfNAMtxJqywyzQ3e88oONhocioNW4KfiFXU4gBTksv43EG5aP1XEf62AH6GHNaAki291ExmuTViaWuU94o=
Received: from DBBPR09CA0035.eurprd09.prod.outlook.com (2603:10a6:10:d4::23)
 by AS4PR08MB7757.eurprd08.prod.outlook.com (2603:10a6:20b:514::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 18:04:08 +0000
Received: from DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::50) by DBBPR09CA0035.outlook.office365.com
 (2603:10a6:10:d4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Wed, 11 Jan 2023 18:04:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT010.mail.protection.outlook.com (100.127.142.78) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Wed, 11 Jan 2023 18:04:08 +0000
Received: ("Tessian outbound b1d3ffe56e73:v132"); Wed, 11 Jan 2023 18:04:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0a5e76cd7ad30276
X-CR-MTA-TID: 64aa7808
Received: from c856ac8512eb.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 347D056C-4DF4-4239-BF02-AED92BBAD0A9.1;
	Wed, 11 Jan 2023 18:04:02 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c856ac8512eb.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 11 Jan 2023 18:04:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCb2VRhFegGUKB6yTPbfACk52wVoZ/+rCzZU1btOwVFR4OQ5I4flEBj8v5QYBTU8owln9+PXm78bFwrRoPQfktxdv4eE0moKcICDLSXY/nand9oFrU66dwUzSUyWuHg74g6J+cuLLNeE6Yq9c1GKoeBdn3CgYXOJysHSaQIrgKjWS2OK3AQpsIdo4uox1KL2IJo++Q9g7qVusAS7pLpg0+6CkEA56Wfm0t3jbkcs7F97GNYR64jEr/cAmpiAAr/n9635Y17u/ouC++AYfduViU9EV0tpB1574i3gtv0T9XDyyEl02amKjvkFiyMxr0b+41MbBl7gpqsHNvuhL3eKnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9TsQ4bVkTzOEWtz+5ZXhEt3XtbCi4WWgQ5Au3dlEhh4=;
 b=OVSR9qkzWYZs8bbBFMVwSFuxuW573VbMoDcDlS5oCOpEMF/IxYW36WnrULEqrTVheVlYKQuwzuVbQtXC64yi+0vtadMnXM5FAWe43pH1tHIDlJZ0kK6gDhcDKlUPs6JwOmZcWqhMxl0R70kiDMdu3MupxPjJ3qvlYhy203+xQo30tRgWVbIjrhD88vaiTNucUix8VSfqOQ39qZk2LDy2TOqz3NXAwSSE+UYdhcyM6ajf9zyqOwqRZwAKJStyjyx6BlV8cgI+IED5FDXUrWlMik0uqT0wYkveeNb1A2dBmDK5BzE+u4fJWygVFbJoODAjaZbuyS8F5o2tALshAzyT9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TsQ4bVkTzOEWtz+5ZXhEt3XtbCi4WWgQ5Au3dlEhh4=;
 b=YO8cSBt5gvexnMYJSB+hF3bv0PrzsNGTQHQjajys/cpzDM9g5atb8LyyVyIN8sZx+VmBlQRuKpJ1FTP+BHpYZ8ugnJfNAMtxJqywyzQ3e88oONhocioNW4KfiFXU4gBTksv43EG5aP1XEf62AH6GHNaAki291ExmuTViaWuU94o=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB7669.eurprd08.prod.outlook.com (2603:10a6:102:243::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 18:04:00 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%4]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 18:04:00 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] curl: don't enable debug builds
Thread-Topic: [OE-core] [PATCH] curl: don't enable debug builds
Thread-Index: AQHZJceK3uKpsOfgrE+i1RPX5p3CTq6ZS3UAgAA3GIA=
Date: Wed, 11 Jan 2023 18:03:59 +0000
Message-ID: <174900B3-819F-45D1-892F-1B43B0372B7B@arm.com>
References: <20230111141753.1249071-1-ross.burton@arm.com>
 <81eb17da-946c-2f81-4176-d4202b6357e0@theobroma-systems.com>
In-Reply-To: <81eb17da-946c-2f81-4176-d4202b6357e0@theobroma-systems.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB7669:EE_|DBAEUR03FT010:EE_|AS4PR08MB7757:EE_
X-MS-Office365-Filtering-Correlation-Id: ff5ad5b7-7db7-4733-29e7-08daf3fe3c36
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 D91aQS7X2ayyJDXVldcZ1VCZaMY8Oa3qWZft9afrL+/Nh1AEACDLcK94NmDzBE3KEbUI7hRUrSMINlXEz+FAtkAXrlR83i2NyfeVhBijz7NyhyY71kN1akjvQ5DHZ8XclAkGj1Oa4gI5xi54pY5+gvcJ69sz6cmbWfYY/HG8HXCWIJLwD+cfwmnZUc847jQCRfmVbG4FrTK1Ie4AvGA36XJSdZKWZ8vXHw26Fu1SU2Wfg5zxCMsy69TRKUnPqXkYcqW+U1dsiK66mvkhJ34z7WJpmJFE37FktDYbw1VXZcZJVEbYqFTCh2rlHm5CMUhQ9vS2/KKwVXYUO1cEi8ljeIEyDhn6fKaN6G9XyfyeuiPVNJHmto1TRamP1HxrTnM6OdaHZ8Oi8l60K1Ry10adWRgyXXZ7jY3obT9OS63xDsGBCkrB2re7SmsGk/HIaysZRx6joZiVJVaGkJKln/zPx/e6NquHnZpq8Pq3LjrI9UNYiOOXHLM38xQ/6e4Kzhq2grLjoGOh3l1wD4VeNaqPFcasW3eTksHoxPPcPsfOBTXttZTW8fvjvEYSD+yCkVWxx4NpPHWVMJWv9IPiJs8NvpBHgHyFiKx734zPo9yEzDaqm+/mYCqLZ3b0XGwISYwQHYVAZD7PLT9laod39K7nYxIPcJqas5a3pbmdCoy8UWLJzI/qbCjROV6PDgf0YbLSAIY+Q5nJ/FOIShPrhNPkQhCPQKwSuP+DbMNJNrlzAuQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(451199015)(38100700002)(122000001)(66446008)(86362001)(66476007)(64756008)(8676002)(38070700005)(4326008)(66556008)(41300700001)(66946007)(91956017)(6916009)(76116006)(33656002)(8936002)(316002)(2906002)(5660300002)(4744005)(6512007)(2616005)(83380400001)(6486002)(6506007)(186003)(53546011)(26005)(71200400001)(478600001)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <08452A1C02E02C4A81A640BAFE4BE29B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7669
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	110c6adf-f595-40e2-ca90-08daf3fe3716
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KVLAtOWZ4ip1kvXKfluUEqRuuEUew1dhKi85+m36wxJne0gmqKfwD+4PvMLAe36+IqQjGB3BrQLoRnuYOqdx0cdqtzyxKk60yOm00hoIovxkhXFRyiK3oqL5RMMLiOdhYfBMnUaHYnT299Hvt3FGUb3ujtARoUlSt1Tr5+58KIhfWKpl3SWyAt6CaF+K4hhCKLODiW19JkY2/YOOZi/lu00a+zZ2DPEt4zTt1+f2llt8GqdGaYo7S1QziPCZeH9R+D3PhfRLCKqBTKRWSUCaYKkq/tuw8LocMcK9aj1S9Zd5ky9f6Xw6HgXzxBcWJZkorZ7B9brg1OpTTPeQJdiM00cn8j0sZ6LoTx5JExuboCeuetDk3qeIVR2srKXlkSeYzdHwTbvl5+TpjUtsDcnWSWwTcCLAY1a6R+bt5frjOdiN11hpSC7ytOvtHWFz8JwGicLNMB/qaJegRiUQkJLKTAxnHmNg0z49PTRRk2gZO/gfmsEMldr/tjq2OfolPqtqeHeAj9Yl7l4WrTa8oh+cvmwf9c/EtWy/xn7PGp/j9mXNw6U83mBtncLSjvehueNRS9/jkO9ZXrQl3ql/FtpJu7YZakU9M467UwJeBbSKDPDsVCVzPSErlX8tN/GQqPG1ZiPzH8b4y+KGQXcpuFawpeo8JqJ4j85NfonDmXeaZYpibjQWAX+Z4t8rkxJ19cq4QAMAIOH6SO30zLIsbGJNyA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199015)(36840700001)(40470700004)(46966006)(36756003)(356005)(82740400003)(81166007)(4326008)(6862004)(8676002)(70206006)(5660300002)(8936002)(70586007)(83380400001)(33656002)(86362001)(36860700001)(6486002)(336012)(40460700003)(4744005)(2906002)(316002)(40480700001)(82310400005)(47076005)(478600001)(2616005)(41300700001)(53546011)(26005)(186003)(6506007)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 18:04:08.3771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff5ad5b7-7db7-4733-29e7-08daf3fe3c36
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7757
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 18:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175768

On 11 Jan 2023, at 14:46, Quentin Schulz <quentin.schulz@theobroma-systems.=
com> wrote:
> Should we have --disable-curldebug in the enable path here? I see you rem=
ove it further down but it's not here.

No need:

    default)
      dnl configure's curldebug option not specified. Initially we will
      dnl handle this as a request to use the same setting as option
      dnl --enable-debug. IOW, initially, for debug-enabled builds
      dnl this will be handled as a request to enable curldebug if
      dnl possible, and for debug-disabled builds this will be handled
      dnl as a request to disable curldebug.

Ross=

