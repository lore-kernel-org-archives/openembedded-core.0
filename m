Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69254C77B75
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 15:40:53 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.75])
 by mx.groups.io with SMTP id smtpd.web10.92405.1684165247901167623
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 08:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=YaZ4Hj7l;
 spf=pass (domain: arm.com, ip: 40.107.14.75, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbPiqfWkkYMITE0AqfF9qtVKRUiUTBm9ZPANeFqyBMQ=;
 b=YaZ4Hj7lC/wqIswbisEW+cC1BD+kgCnFBgkLIRDaLaEcOSsvDZTcBtKVMCmwt9l9xuavg+EUSw3m1W1C9Mpx13J4DsLLdkf9/+9VDm/cHCHxHimUMmrecS+0G9tkKU5AwvN6e4J7nJLsvnwE/u2LtSZO/7i+l7eaT3jki7tENYM=
Received: from DB6PR0802CA0040.eurprd08.prod.outlook.com (2603:10a6:4:a3::26)
 by PAWPR08MB9568.eurprd08.prod.outlook.com (2603:10a6:102:2f2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.27; Mon, 15 May
 2023 15:40:43 +0000
Received: from DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::d1) by DB6PR0802CA0040.outlook.office365.com
 (2603:10a6:4:a3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.29 via Frontend
 Transport; Mon, 15 May 2023 15:40:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT048.mail.protection.outlook.com (100.127.142.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.14 via Frontend Transport; Mon, 15 May 2023 15:40:42 +0000
Received: ("Tessian outbound e13c2446394c:v136"); Mon, 15 May 2023 15:40:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 041510ecc7c15c72
X-CR-MTA-TID: 64aa7808
Received: from 9e281840f20c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A37FBBD3-0CF6-4186-9475-2189944D7CE7.1;
	Mon, 15 May 2023 15:40:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9e281840f20c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 15 May 2023 15:40:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZX44jbW/msJEutm0cI5Crp5rLCYL1HX5IbuW8aBwNsSf/wogd8HBZXkPA7dDv/TFdnJeZMxZjI+/xaPtfzo5EGNCKN2+Mjdp/7ipcEkjnPIWsYZF+og1RJFdEYJbEDVjv8F/MS4wDXCpHhB5VResdBi/oiY8AngDaQaA00Pw6oGNqLgofa3jOTZ0GkJgLti7MLkDnYoTUdXWdRarWskSV0VJn0tuqLztWYGOasPPFdYw1j6D2VhnvaWUHHULUFDA1aFUl0GvfIQEPM4/8obRRgBAyIjn0M4PTT9V69yFwQ/m7mu9Mg9652VWjU1zXKtLtl02X4EDY1Xybm90EasVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbPiqfWkkYMITE0AqfF9qtVKRUiUTBm9ZPANeFqyBMQ=;
 b=LV4fDKO2GeaH+Urt9GKDJ037KowanuwIb+BUi3QOk+IRTyAGQNglYq9SYM8yZlP5j/NbpUOXoiNpGX48XQ7EGO76LUlk6DKdPFSgxYrDMvTtpgqVk/QZn94NwKrbK0b1A7+1xyMnKa0CKSadaugIvrgjXtAUgYz4tA+L75yNF/Hcs8tLhnIrJn5fLJg7EATMlgxG7ZOg1MsJG0qUq0HsCx0ptWK/wJimpEg4nQfxNhlh35dPiafoScAFiou3BvMZcCx41UhszRJFA248Iq5MINkska3Pfw1AvwF6JfJjFcLaxTcTaj1eQpUvpXcSVQ/P5caV3i/btMuTlWb/79YWig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbPiqfWkkYMITE0AqfF9qtVKRUiUTBm9ZPANeFqyBMQ=;
 b=YaZ4Hj7lC/wqIswbisEW+cC1BD+kgCnFBgkLIRDaLaEcOSsvDZTcBtKVMCmwt9l9xuavg+EUSw3m1W1C9Mpx13J4DsLLdkf9/+9VDm/cHCHxHimUMmrecS+0G9tkKU5AwvN6e4J7nJLsvnwE/u2LtSZO/7i+l7eaT3jki7tENYM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB8813.eurprd08.prod.outlook.com (2603:10a6:102:335::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 15:40:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6387.029; Mon, 15 May 2023
 15:40:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
CC: "Martin.Jansa@gmail.com" <Martin.Jansa@gmail.com>,
	=?iso-8859-2?Q?Petr_Kubiz=F2=E1k?= <kubiznak@2n.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v5 1/6] gobject-introspection: reduce
 dependencies
Thread-Topic: [OE-core][PATCH v5 1/6] gobject-introspection: reduce
 dependencies
Thread-Index: AQHZZhyefQw3lqmni0emnNBPqDOpWa9bd9qAgAAmeACAABySgA==
Date: Mon, 15 May 2023 15:40:32 +0000
Message-ID: <39559677-F466-4605-B918-9B278808F090@arm.com>
References: <20230403110646.2555294-1-kubiznak@2n.com>
 <CA+chaQf7GPW=GZ4yYG+BjbBOYST2O7R7xwQSstRdC=chzaWU0A@mail.gmail.com>
 <5A51BE7C-AB58-448D-93F2-0AE5EE4C9AA1@arm.com>
In-Reply-To: <5A51BE7C-AB58-448D-93F2-0AE5EE4C9AA1@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB8813:EE_|DBAEUR03FT048:EE_|PAWPR08MB9568:EE_
X-MS-Office365-Filtering-Correlation-Id: c6af0761-7d2d-4441-67db-08db555abe24
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 GoGXRULPa3RSa/oKMV/tQmEEsnXeCbCrHhOyB1s78v582SoTX607T3JWLaCNibWH+y9h2aJyLfNSdXaT9HcA7NH1vKTl5PZrJEPqrHEcbLE08x2dTWErryoOafVYlc7/fRSUE7C4JfIcp4YAW8SRuv/JGi9tWrRx028iDJc7Y5JeYedzmjOrZ7Q3qPNDzlkVvfL1r8tHnok2mqljaSaJjrxJAhOrL4jiQs36ovgYjRFtaePvmfldR+8+Hzu/qKwwa7gH0JEwSiECMrtiVa+qaXQenJTlBVO2ecpZ5L3eBPMS10b2b4TdljXSabX3mxoJA3uHbeLWomXUh9pKVUaTzScoALudqDtqHJynrqtr7rkr7jKgspdvfS+KxZw+Z2TIKECvWDt8imz2e/GMxKk6m7bFQI/2tt/t0HTDUi8hTyP7I+6zf0NK6Efmpz2BtPncBOdFIbmv1WdLAZ2GCjtngqmdlrlPr79IupSzYcgMxag/KjToLlUU/xXNnimdPC0FdvqF476z7wnp27Gt2xso7t3ygJKo/TgN+Ro8mS5jQFKiqSL0XnvDNpi9fEIsSUpM7SBGuAU1VK/VGCTHgza+0cRNZWGYKluFJSKvOLi8dklAf6Zag7vat05M2JdMAx10Ph/KGyoyuaiNbdSGx6/xTQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(451199021)(109986019)(558084003)(33656002)(36756003)(91956017)(86362001)(54906003)(316002)(64756008)(66946007)(66476007)(4326008)(66446008)(66556008)(478600001)(6486002)(76116006)(5660300002)(8676002)(8936002)(2906002)(38070700005)(38100700002)(122000001)(41300700001)(6512007)(2616005)(186003)(53546011)(26005)(6506007)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-2"
Content-ID: <B860C979B563484FA38A69DA4404E8C5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8813
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4ee9a6ee-a02e-4a39-788a-08db555ab7d3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MLC2Z8Wygzzq5r+FwvBq4YHpP8RZAeTPEYQJaCexqjNpl/zdWxIkBfqmGNzMos9oeshkQlww3IwrCAbkTJ2hHJHX9Frl/mK0mspWNqjnWPAfFGAsOyFU9Mh6t4iIJyMdaW0RPm8CpxtUSD83EkwsyycDYEJlezhZ1XcS2FlDrq7Q/LqM+ea2pjzDmWtRWK30O7tbl7R+dewh5JJdrKVnJjS4BxMTddmFsInczHyd3q1UGbZIiW/JIMOpKlbIVHQuQUcQtKjTOpaE9L5U4LIj3QuVBWOGOTiiAD5eLZm29z6n3sMjVnTHp1gYCazcBEbAvmEP1Fu0RoIl/MeWCZ8dFuhGIUEPeSbVUhagdr+/qKeh7VNNBC3tXYUdDBReZpjlhrtEssUSE3l5CuFRGtFuJ2fp3M2wXE2HDvCMra3FJiGHN7+R6bLmtwN9s67WkA5IJr3t/cscD3KWWZh/sNzWFBsK8wcpajNKW47MxAcnY+gyKRPkbm2eMoAjp4/Zv37Ru0YzlYnEUB17pVQ+2yjZzsIwIjBnJGt0LsGp8YppRb5/xCxaOfftAbMUQIsj0wRqkg2AbJCDM7QwyXTiI4gBoFHMmTAWvNNZmPuOVoBCTy/2c3d+PWWvtW0t1KmLpRRAhDQSDLB4IW0126gYCSEdbS1n53HhfJKvnBu7gcJ5+PaWHhQrLqbN0racDxevVJI4lZ3KUOaURJK60KnkcXksEgEXlKjTVmHJ/wka4TIKyHNJDDv6dabHH58ZtVQH6xak
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199021)(109986019)(40470700004)(46966006)(36840700001)(6486002)(41300700001)(4326008)(54906003)(316002)(8936002)(8676002)(40480700001)(336012)(478600001)(5660300002)(70206006)(70586007)(26005)(53546011)(6506007)(6512007)(40460700003)(2906002)(186003)(356005)(82740400003)(47076005)(2616005)(36860700001)(36756003)(558084003)(82310400005)(33656002)(86362001)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 15:40:42.8531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6af0761-7d2d-4441-67db-08db555abe24
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9568
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 15:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181264



> On 15 May 2023, at 14:58, Ross Burton via lists.openembedded.org <ross.bu=
rton=3Darm.com@lists.openembedded.org> wrote:
> g-i-native will *always* be needed as a build dependency, because package=
s built from git may not have any m4 macros in.

I have a patch, just giving it a soak test.

Ross=

