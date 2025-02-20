Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E041C021B3
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 17:08:37 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.61])
 by mx.groups.io with SMTP id smtpd.web11.2261.1740071313375809926
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 09:08:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=S9iybZ+1;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=S9iybZ+1;
 spf=pass (domain: arm.com, ip: 40.107.20.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uQEH3KFwOOyUnb4nkTP+bLklCocrlMzxKSWE51PAN2en7e1HJfDPIcjmt+Pi/4ijFpdZNfCRDv1lXolK+52FWasSnKUeHTYXeGiqdARyy272toC10v/TgSFrTLUPyxL6z/GNbmnrxnJZctKgtKKWB2DjgYBvDOLKVlsDetOPWHIEQ2A+PUzAUNPlQDn/YfLSXo2l1bkEbJoAYmgbtfMeAuEeWOQebWPHUIfN82hnrZNWrdjrcoZ4TOiPBMzDQSfOPKM4/joW9pa8u72boNnwpaiuf0K/deRBeNLjPzeDlwTfM7jNdiaIwDWg4szm0nU7QmWYT2KRi74Ws9pjMbXZXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiPmECfLc64ZJHdU7I+MgGse7lNBlXLe5CdHxOb2Dxk=;
 b=eYf8U0jMa8RwDqGPG+JW9WnNwhkLsWUFfdFop6qq57+++nRS+DVXe/T7IEKqzox6v4guUKcN8nx4BIICPuNlyruAmUktsn79jV8gLWudGIu8hSN3UXG32pdaen4Wj87aAFPjIPKnMVuDo4zrvVbsp99FIYg4+5d65xkzGIV01DAPKomKQgvUmmYis53eOUgCAtbe05AcVExQ7btXw2dZJnQL7eQjtPyZ7ZmFHUFp+0CHnRvbS1mmULdZ1t7iCyHpo3whzR6FnfoB3G8QgHjrvLHSNCaaL/C3rndNaUcY8Lo2Dk04fMPJxDuI+S9C4jyqdyACgHDRbkhZ4V0sNFFiug==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiPmECfLc64ZJHdU7I+MgGse7lNBlXLe5CdHxOb2Dxk=;
 b=S9iybZ+1+mPSm3vSKAHRbLjOjREYxdOINLn2oUdKZEsH8UBtodRk4vIdDs4TxqYK6e1IzZkw1Qb6OPYjb71zF4OqBn00B+C8QYrJMTYt0Nf4hHBdIpaOxANOUYHK2e7jOphNVbYFK2n5coMK0Tq8MmGsJWNHKTuVYC6M2hNGNBU=
Received: from PAZP264CA0088.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fa::6)
 by DB3PR08MB9900.eurprd08.prod.outlook.com (2603:10a6:10:43e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Thu, 20 Feb
 2025 17:08:28 +0000
Received: from AMS1EPF0000004E.eurprd04.prod.outlook.com
 (2603:10a6:102:1fa:cafe::8c) by PAZP264CA0088.outlook.office365.com
 (2603:10a6:102:1fa::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.16 via Frontend Transport; Thu,
 20 Feb 2025 17:08:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000004E.mail.protection.outlook.com (10.167.16.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Thu, 20 Feb 2025 17:08:24 +0000
Received: ("Tessian outbound a593bc61b951:v567"); Thu, 20 Feb 2025 17:08:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 295f57d49fb08795
X-TessianGatewayMetadata: OaUy3qlvM/bP8X5h1+5yUDqjO5br7BT5yMjtSfVxya1TNfx0Y0cOFGAR0J8TFuHsHNa/StQrgv3OUGntQXpiIMAaB5i2lzcLJgCY4WqJIUN4uOcXKQnAQY7BO8srj5voD2Q+rx/h2E9kBU/KWuENDwokYfug4WLHOi/u+eGc3a8=
X-CR-MTA-TID: 64aa7808
Received: from L93169885db02.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 890C5EBC-C6EE-450B-BEE2-D6BF3AE35B9C.1;
	Thu, 20 Feb 2025 17:08:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L93169885db02.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 20 Feb 2025 17:08:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGu9VKmYo/e2i5ojkSeY8DcJmzGGVuZN+JKXAn3WjG5c00Us00au7dDICyHDDf9h7k7npxhu6c9l/njK+op7ZbZ1DpgshnDqRxkhvr/ScOaMOzs9qgrebpkSiiFQWrJ66ef2WjkqcuruT+SiHRBCBpNNl3R7pxRDAtysEwdFkpLtz4Y3iV70ziNXq19WqHdSJAORmDLIISjj1QyXpjF8cu7Jwp2Ny8lR7156d46fXELjeewZItv3auT7O14FuoqtJPbWLlOrSPJh3qFcdl/FK0G4FA4aqfG0eMdvtsS9uyqApug3nFq+3ObMRGrO4l1vx0DgRV8wUyYDFtV2KXeY9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiPmECfLc64ZJHdU7I+MgGse7lNBlXLe5CdHxOb2Dxk=;
 b=FH2mgtOOBIOHO6p8SQrIPyETP1nb0bJ3kLOOkwZo3Xk2H1qKB9dF5A/GWBDOGrNszk7H11DBMLyQVNE/qwS592zJoiMXJ9s3eWDMr0tZ1qzUmG1YZsjFR4d1dHV90vRZjGMUMo3W6sfGq0zDSIjIc88WgRodF/QR34cTQSygi8UPNJzRrh9rxe+j5hl4A0zSj0KDFIzt3f13VkPywdtFrccrsftTta86W+uMubP1ZxouHN/o4/tosZlyGDSexy7OFpu59AnfkGPJ0vsKQ8oPeHTui+W3izdFzMaF2P4eQsx+doYynddZ27PaZKLKCyXsVyNeIzEpstyfwcze26iTZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiPmECfLc64ZJHdU7I+MgGse7lNBlXLe5CdHxOb2Dxk=;
 b=S9iybZ+1+mPSm3vSKAHRbLjOjREYxdOINLn2oUdKZEsH8UBtodRk4vIdDs4TxqYK6e1IzZkw1Qb6OPYjb71zF4OqBn00B+C8QYrJMTYt0Nf4hHBdIpaOxANOUYHK2e7jOphNVbYFK2n5coMK0Tq8MmGsJWNHKTuVYC6M2hNGNBU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9664.eurprd08.prod.outlook.com (2603:10a6:102:2e4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Thu, 20 Feb
 2025 17:08:14 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 17:08:14 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
CC: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v6] systemd: Build the systemctl executable
Thread-Topic: [OE-core] [PATCH v6] systemd: Build the systemctl executable
Thread-Index: AQHbgrqX2sHRWL+ZiUmJxjuf9Qa01rNQPCMAgAAdbuKAABT6gA==
Date: Thu, 20 Feb 2025 17:08:14 +0000
Message-ID: <E8AB660E-DFBA-4856-9AC2-00CABC615CE1@arm.com>
References: <20250219103908.42513-1-uvv.mail@gmail.com>
 <71BF1160-E808-4212-B790-5462F95BFBA4@arm.com>
 <1825F47182B39BA0.23135@lists.openembedded.org>
 <ae46ffa2-b88d-4ec5-822a-08c00e2baa46@gmail.com>
In-Reply-To: <ae46ffa2-b88d-4ec5-822a-08c00e2baa46@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9664:EE_|AMS1EPF0000004E:EE_|DB3PR08MB9900:EE_
X-MS-Office365-Filtering-Correlation-Id: 177cbfea-9b68-464c-c53c-08dd51d12fb3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?TbXBbdXB3roYY69IMVnicbO7kvYYsKHPSn2gLtUVrxHuDs+yQT4ZVgJQ/w1Z?=
 =?us-ascii?Q?pRdF6PeiwWH/1veIkdZ+R5c1poXNDn3/WG4B7bwYQjzoRXGVO4E4mJUzy1Pc?=
 =?us-ascii?Q?hlDoFC+ELdjGo5p/oCnQD6OahfGn4wMdodXY9OxOhaOPVBMNEXNSBB1jv0fK?=
 =?us-ascii?Q?/MuPkcKywPywZ1FLiuM/ABwuft5Ol1TBWFdOxPJ/Abp8KpUr6WFLSlKjSn0n?=
 =?us-ascii?Q?fmuvKIkLXaqWOJgqIwxkzS8pY2AtVl63iiSpy2cK/Sa9AmZ5S9XuTwAk3BiX?=
 =?us-ascii?Q?p5a97VFhTglO/8MJ4uvotvgwjEHUCF7+0IFoBHNSDIY8nV+WyK9KNcxzXeLI?=
 =?us-ascii?Q?COdomCGx0KbqgOIQ3mPuT6VzGtbQ4WyYBc8x3HmBpKaKWWCEEthCEoXU+Snb?=
 =?us-ascii?Q?sJXT4yrSuHgtG22xRyC41DzapyuZMGcsmjFsgsOtCRK6CI1/eISakKyCyfua?=
 =?us-ascii?Q?qwOTAXundOvgA4FWfAPG235U6Psfgccr7mV2zPsy0v5JVL8oU4jsk+mk2yPR?=
 =?us-ascii?Q?MDpmCJ2pfZKW7Ms1UOotEPl75L2wpbVMlakZkXEbBADS+J6B6oPCgzcqdII3?=
 =?us-ascii?Q?zpBt3UjBcu77Q4TYBKwFewW4HbvJduUEfLTJRfpyu8HAG8R5YCrpznd1hlex?=
 =?us-ascii?Q?b7JkX7Wh+z5Cx/KTN+lnqvV7ft6qpX27vkN9B2rU4ARbu6Z5DwH4+KEG8KPI?=
 =?us-ascii?Q?RRaB6h9wM//OjwHk6BiCSpscx2R8ys8pS4Yxcz8IAxAlZs5urDAf6ayYmD6a?=
 =?us-ascii?Q?WnBRwmNU4CPrbyuogef4nNSd5d50paYU4YHN4fStjaHMsVWu3yKbHjkLLBZK?=
 =?us-ascii?Q?LL9tci3xU/5ubeeLc6UhER0y2vKzcve/QmrBGPwuBfprZG0U01BZ98icy+Nw?=
 =?us-ascii?Q?hyND5rCLC/+zPPCGjnJoN9Y+xkPZQCXGLP7kAk9zeavS2L3G+QwrJWzHdu4C?=
 =?us-ascii?Q?kE5ZIpXSR0FSgt4qA7Ov/uXD1qxnaE/Mr6RfnhaUU3LN3lYrYnDP/mEVc377?=
 =?us-ascii?Q?BoxPvIG+QBoXnBEsgYemguQWx8MufFMv/zRDah5PV0lct0IZZCDnrI2rc278?=
 =?us-ascii?Q?ppm1fcRQCWZs1ryTBy8jfYmoa5AMwuX2xbJg6fuX3j/FcJ6j7EH1pjqbE4DQ?=
 =?us-ascii?Q?VipGiYc9f8uRbubsBk8/aGcwwj5Ybjqr121Z7r0S8+s1YbiyN6DU8LK/D0I5?=
 =?us-ascii?Q?BhaLvkQemf0CeXlu68tnwgjDENNLwHAVM8G4IjTXe+Z2NOBYWulMKAsM7OrB?=
 =?us-ascii?Q?Pa8sNBwZ5K6FZiwWWKJhdDWcIppZOWY2ECiA44igH/ROEplW42SoSSYDytgl?=
 =?us-ascii?Q?pWdlrA4W7BhbCnKnZGQ2LhBBmMyesIQhaKmAEAj7kTkpVVW4LwqwqovVYBt7?=
 =?us-ascii?Q?YfjPRJAHTRFwDA42V3l/eclqqVCqOV4CJ0cPlTtH+VIhpnJMQtZxU38zD49r?=
 =?us-ascii?Q?INGgko1/8P+bGb4TZvR9ZBGVTvu/5MEG?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F8E092A1128BDD4BA46C9A16913ED0F4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9664
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	99dbb6b0-9516-4223-2423-08dd51d129c2
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|36860700013|1800799024|376014|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nCZ34iVXktNol73xKNZ2MIHFaRA2tumiGR5L4nU9BYmVAQfHMdz4RLmou+1J?=
 =?us-ascii?Q?kjnx4nFmZLqN2iVDL9KVEI2XOtVLG/wYfYfCqtBFlBjCqkAVuwZ+H1tGYmNZ?=
 =?us-ascii?Q?WmWJl1bJqaT5XADZznxj1QT8LO4iL+8XYbJ6JendGflKrnBhM+EVrv70CEWK?=
 =?us-ascii?Q?byfCmtqpgK5cFw82ms83kyWGyu3kIj1MuScyGD6pQtzdLrlBSeGRCHhfkXaK?=
 =?us-ascii?Q?trGMVKI6jxB8+OTkMgJ27VqmUODsUL/YtFzV9bwilgHynqT0InpX1UT6EpWf?=
 =?us-ascii?Q?MXUK1Gd23CGikKmsvaa3zWo14zQvRbSPc//quOobgKB11XJz4MIDALZYEfYV?=
 =?us-ascii?Q?Gntoh3CHZ51mQaL2TrLnOdrPh0RlYfOkKzNusE1p320ThBcxBTQjAXWlCHqC?=
 =?us-ascii?Q?++XIBJPd04Rfx6Wf+0HrGpEJPgJWQlwh5+wlaCHYGQoIpwNBa8jl0pl9UZoo?=
 =?us-ascii?Q?KSnG18bLfLtxNLgjYoPHhSQLM2eehpQGoXEAwx8d8iYAFiFMjq/oiTZMSxOr?=
 =?us-ascii?Q?NcVhFuS0Zzx7SlPBI+HyFnE3WeQ3HlGBMc2jKx0S/HollSQatQ75113YFz/G?=
 =?us-ascii?Q?TOGxBAk/T65+Pzr+R/AzXc7T+3T93QFCXaWhsuyn83++QHYZ9Vc6gJhsiYlb?=
 =?us-ascii?Q?qbcwcJ+vkW4dk8fZNCo8oGU/vuf8mLYXKCuZdO3fb+vVhMiqPrLflB6vVa2b?=
 =?us-ascii?Q?aBwke7zu4NPmCJqrCJfDI7XZGmz5YRIZyTLa+FcW7WnMisDPWs7xsKWG4Wgx?=
 =?us-ascii?Q?7kNL81Trsa1hTjNJIhoTbdkrSAAaILRyOBIFOx9Fiu7gP8aBT7PpBXwG4B3w?=
 =?us-ascii?Q?6Paa+1uxDk6gto0yamr76EkT1nr4xVAo1NEVvlHKwyGJNVvMTB62XpxkReCJ?=
 =?us-ascii?Q?fM3AdONeTVtxvsbN8zBMNYDSVtFDgDTrRgSxZb99Fqpa/LuJVPfm3xd9063i?=
 =?us-ascii?Q?2L583U4Zs4TkYUE0yeozKgSRRZv87XDmOnPC1VwAcGaMjjazYgcmlTPWSuNm?=
 =?us-ascii?Q?1ZC0Kcw1IsmNrQ7VHzJIUCIH/EGq+1UY4KPnAdswd+EAA/8ZZYkQESdmazIB?=
 =?us-ascii?Q?ClFQxVcEt9dSxLxteEdAGoqZgDqb5hl2uKpihWtfRJH8ZGPqfNgG54oh+TqF?=
 =?us-ascii?Q?8+TN+rRkeHL08pjIg/LluAB3/SnrEaMn/BhCNY8DffjU4/ZLCJn8XM5iAg8P?=
 =?us-ascii?Q?Z1ojoHVEqqqiYULpRql1HCUu6EIrXtZeGHF3mfnynY5TtMnAEGY5SEL0UpD+?=
 =?us-ascii?Q?NQvCCUanUieSJO1PWFgp2kdd2zZXvKy0oeWKEQeri2OTC9vPLYt+Evwk+6Zq?=
 =?us-ascii?Q?MN7l7KU1Rwp45Egn89MWBlE3MIj5U2GToss/buBQ3cm/TP+0FV6y/9uyTKs6?=
 =?us-ascii?Q?UKPNNb4PziocWGylRjpqVu1/J7ou2fvPfOUHljv3231k4kHbPLqG4G5eMLeI?=
 =?us-ascii?Q?fed3HZs8jD/ZgWdy7qFf3lKtt4UuAAamNeSWfxaWY6YJuTRl2LyFwRaXmPV3?=
 =?us-ascii?Q?QeqZ5VXMvqo2YlQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(1800799024)(376014)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 17:08:24.5553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 177cbfea-9b68-464c-c53c-08dd51d12fb3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9900
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 17:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211772

On 20 Feb 2025, at 15:52, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>=20
> From meta/classes-recipe/rootfs-postcommands.bbclass:
>=20
>     # 20:12 < mezcalero> koen: you have three options: a) run systemd-mac=
hine-id-setup at install time, b) have / read-only and an empty file there =
(for stateless) and c) boot with / writable
>         touch ${IMAGE_ROOTFS}${sysconfdir}/machine-id
>     fi
>=20
> We could think of further improvements. One thing that comes to mind is c=
hanging systemd-systemctl-native to systemd-tools-native and enable the bui=
ld of systemd-machine-id-setup.

As Alex said the old code just touched a file, so that seems overkill. :)

Ross=

