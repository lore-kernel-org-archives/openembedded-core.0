Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086A4CEE353
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 16:01:01 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.44])
 by mx.groups.io with SMTP id smtpd.web10.47321.1728576052434250675
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 09:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=eap/WZQ3;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=eap/WZQ3;
 spf=pass (domain: arm.com, ip: 40.107.241.44, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CmPA6Xo4z/xVZNX/fPp8i8pM5TzsKN1WxkEwnottA6WzCbh8B2HFT4tKn+39k1cP73dkY8MfkbRpK/ajRTAfhtX3YIPcBoRSZgw/YF2ONTkQIn4+x0kOE1OHKe0E5/DnFP5GQxD16pP194kpCEAalZZAMJTGOLBrdo7zY/VYrAz8PiKIApk/TSSgqU//ZAAgX6yQ4D3oQop2ikRpHGUJmEa0wpLACt7iRsuZuotRHDxVxvgB42+b8hrkGhvnD0NJJ14iqB+HK7ihinRaRjgGDXLs9QVL1dhJctNkm1btXWX5+8eNCnqKV8IWZdK4lbbNpwRTVOCcXonqwCF4EgtNKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTEkEEnawf5jdSWR45Ku0Kwwxls2DboRfsYvT8utYfk=;
 b=BtFAdYztdC4wfq6HSdsn3Rn9ysMZfFOxsu/HCr/xZ8I73zwxz4x5h/iIXdYVHLXKRKuhAprwSs1+FhiaPFH1o5iavLMmcfUHRcHA9Kt5VKIGwSM5ZTR7qGcVDJXlxfGRzXDaEuLxHPX00rPQqzi941/GshEzlo/3dt8IlowLw4GoNOc5zNxvrKAFPss2lQFjvwvkzn8228B1pLg9XuyZo8phEvBXUugGPG4sAq8fSvCpPC6wjvX6rAV97RwrlAz4rEIG740vnq9tPrKMH3ccyEL6K9GLw+yaarU74HuWn8SxJqRj6Hbh8OVwpHH6GD5/NdkPszxZpyXo6gpZO11+Lg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTEkEEnawf5jdSWR45Ku0Kwwxls2DboRfsYvT8utYfk=;
 b=eap/WZQ35pwgL6vo/SIikCWrWNJkDFm5wS14Vgirwt6vAyE/+tcTZPJrLSlduXoFYzPJ2NbXT47aC/BitSueuJNthoEzirw1FPgVIlv9F3hZP2xrt/4zWZZHI4ikz5o2notoq/MHmKuO9l+05jlII6hVYnXHXCTpjc9qFE/DlVQ=
Received: from DB7PR05CA0048.eurprd05.prod.outlook.com (2603:10a6:10:2e::25)
 by DB9PR08MB8737.eurprd08.prod.outlook.com (2603:10a6:10:3d3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 16:00:45 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:2e:cafe::8a) by DB7PR05CA0048.outlook.office365.com
 (2603:10a6:10:2e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Thu, 10 Oct 2024 16:00:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8026.11
 via Frontend Transport; Thu, 10 Oct 2024 16:00:44 +0000
Received: ("Tessian outbound 0362136859cb:v473"); Thu, 10 Oct 2024 16:00:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 33351afe885d26ec
X-TessianGatewayMetadata: L8Pwdc3pRJqq0OIwD19So0BALlGx2nnWjw2OID3wAQ5FrZJ47Y7uKkht4CCMjdznopc+KXDje01HsLbdN4qL0vRNM1lHHHUgPFU6c4NcZcDJup5HI1Tz9jWKwwmPox877+8+WJqZh8p5K/0Nf5eb+t09uyFQsKwwFiTmHveBfPc=
X-CR-MTA-TID: 64aa7808
Received: from La40ce7845aea.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 922A7CF8-F26D-4607-B27A-505FA28AF2CC.1;
	Thu, 10 Oct 2024 16:00:37 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id La40ce7845aea.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 10 Oct 2024 16:00:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RbKTkfbEzAbHKhmviZwCYKxTjK2B8Z1YKgMNPEw55zrjs4sA0k9c0LgpOX4ESxFcuabGuWMsR7JsHe9Rp6uHTGR7TNrhvPI1OE60Sn4inU34EQVczMkYeHwxZ6i24tpm504HpvPraLWIQCU0AIj1TGsjLspgkgsBUEnYexQxjr6DetagaLpCHObogxm+9mSCBpmpaH2FhaJyGGYtlnHlRYYWkVsF+QB0pvSZQgmWjGgiCplHo70ezJtlGdaTEP1HJRNcj61k9VI74uMUzNKYTFFhZ4YdHzMkV04B94DUtfv1c8Gn1DVJ5teSvlKT4zLAAbPZZ9JQ13xyvW2rgGke/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTEkEEnawf5jdSWR45Ku0Kwwxls2DboRfsYvT8utYfk=;
 b=rJzu0p76eztlnH/bbi3g+IBjWPZbD5U6Yc0jdS7Se0jcJJ/3YMjvv4E3WcCfqVQYI/LU6QMv+SGGsA/6mj5iYzuyr4gjTTD3wX5/swLJszp0lbmquIJb0v9c6vcB/EjgK/upGCpauai2gcl2aBMr+Cu8IddOVtpyPtB4rlFAGb60mn8FRXEbXK9C682x7PKqcrv2AeehEdJWAiHLvB4z4b9XaLVhlEmWMnDB/2jRFftlJFv2I1LmZ2j2oLht7TR1rb/kvLNPwWTd7RbotWzWvcepiiUN9WdoOeesbDptWs86Nvz6C6QeLCe5tP9GCsN+4kVPJeYIp1nBv/+btwws6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTEkEEnawf5jdSWR45Ku0Kwwxls2DboRfsYvT8utYfk=;
 b=eap/WZQ35pwgL6vo/SIikCWrWNJkDFm5wS14Vgirwt6vAyE/+tcTZPJrLSlduXoFYzPJ2NbXT47aC/BitSueuJNthoEzirw1FPgVIlv9F3hZP2xrt/4zWZZHI4ikz5o2notoq/MHmKuO9l+05jlII6hVYnXHXCTpjc9qFE/DlVQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9536.eurprd08.prod.outlook.com (2603:10a6:10:44c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.9; Thu, 10 Oct
 2024 16:00:36 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 16:00:36 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 01/10] ffmpeg: nasm is x86 only, so only DEPEND
 if x86
Thread-Topic: [OE-core] [PATCH 01/10] ffmpeg: nasm is x86 only, so only DEPEND
 if x86
Thread-Index: AQHbGbiqQSF1Dr/QLkGCnHYoJOykELJ/9iUAgAAxcoA=
Date: Thu, 10 Oct 2024 16:00:36 +0000
Message-ID: <DED0DE4D-B2DB-47EC-8E5A-73768D777D9A@arm.com>
References: <20241008193103.2429829-1-ross.burton@arm.com>
 <7a24e8f91d5488a7d6b3fc8a101fe95004d1b436.camel@linuxfoundation.org>
In-Reply-To: 
 <7a24e8f91d5488a7d6b3fc8a101fe95004d1b436.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9536:EE_|DB1PEPF000509FD:EE_|DB9PR08MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: 109a6804-9662-4639-6756-08dce944b2ee
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?XVcdMlFNxtrzq3uf/Pysbpc3xTp7N5F0V4WbhgD8HF1n/Ve+dccnqrY6F7os?=
 =?us-ascii?Q?u7nLO2ar8dbbb2HVEaP6tNLYSlY+cqsYbMCaCcDPltj7z0coxEAEzttD2rqM?=
 =?us-ascii?Q?NGDUIs5D+SqMJy3gjcErOBiGu+AB1221mr1p5pLMlawNRq97rueVsVgKSHZf?=
 =?us-ascii?Q?fVswysHVkzHZJmMNRx3ghDzccFhNxWTXNTx7E79umq2N+MwxwxFNdu+B44xh?=
 =?us-ascii?Q?UuT3Sk4XO1j9mQvmtsh8aFZCjIb2tXsIATc3v4nFMPCginRBLZE8wUXzcvb0?=
 =?us-ascii?Q?KPJDtYxeWf8USWsQygn81SI/1RJ7T6ai4JkhTNelcaIKTGIQUEIdxXbUNU6a?=
 =?us-ascii?Q?yK1V9YC3g/IETfGe0rMDdjbfKyJYma3eaD8jVMS1L7cYKTRYq6ecw/iWlGIK?=
 =?us-ascii?Q?NepfbUPlUEiKwsz91G3O4xVLiNXPZMjPlDjqNuDSdIzdYq8efAl8XHCoy5xO?=
 =?us-ascii?Q?JQAgb2ZbrZuwPjQt7btRbm+GfkJ5k+dnPJ00c8e8AGna7O+C2inZKzwfC+vU?=
 =?us-ascii?Q?9gI3a3FtREeZZo9NgWU9+xs1L/gw79ZRSH7JPsZTmXz0BoNe1c7XKqvJedMa?=
 =?us-ascii?Q?jvtNsDqXvBRyvJOY1lM4m08u1wn+qnvzKsuwfOV/BveMmS4HujqME7y6qA4Y?=
 =?us-ascii?Q?/MRXVn5XtiiPeN3cXuCuXTV7TXytuZmwpFulSAK/wN8T5rN1SrTZFeHvcHUE?=
 =?us-ascii?Q?krCjpshjpgrfwcVlE5bjgdsePJR3GeDGuA1giU39P+7l3ksYwTCWwKqesllM?=
 =?us-ascii?Q?5+Z38G5bHRqe/812nDJqvdf6khyzJZMynHh4NsFBvbOUmeUUh3VNwpj/B+xs?=
 =?us-ascii?Q?CJKSYvgLXEPkiAA2OG6nxDKMSI4Tr7RBxCCs/BY5jaf3/Z/9Hbf8Xhu67uPD?=
 =?us-ascii?Q?0bOHDR/4hE5Y4eaWrRP2xsM8tu4tJT8t7cIrizW9tZF2UU2BpBVeEDVDKRDp?=
 =?us-ascii?Q?ZjbVfjSZ5LShCW4Gk4KmLZ4ZYw39ZCKYgjSItQprb1NaNf5mczjKfzbKotuh?=
 =?us-ascii?Q?wQcBo+1Eypyx9cieQu+0fbI0cgn/GsDD6NFEoqdxCzbULYXbi35XwIg1H4LF?=
 =?us-ascii?Q?2lIBQ/SYj43rJYZ6i3S+6CVd5Cf+gYU75aenBImaovppicfTYBSY+J/UY+Ts?=
 =?us-ascii?Q?4H0A2sVLGLBLHWJVISVa1HxwvsZ/yO6SBd6rFR9o1iyyx2vHo1jtMnYqwO0s?=
 =?us-ascii?Q?lxDJXUNc2tCLzvsO8niWcNuGyFeqBeLA6yOYZ1pzIZROYNFT7g/bxSAqMFlQ?=
 =?us-ascii?Q?mfuq0/f0uA+TZpKkZxRXClLEkvwkNfpMJ/Xv6zNGjQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B4F7AF6362B9BD4FA6654EA371C95465@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9536
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c183cebe-5320-40c7-7d01-08dce944adb3
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/lZM02zzZIlTakW2x9ssyxaSa6UlqiSJtT5eH2+DEzoWz8U/c3BUzVgNjtD4?=
 =?us-ascii?Q?zikPt46rNMJfgrUnYFuYBOm5429NLZrTA0dP+3eqREtBnWfYLFw+PbILqdAz?=
 =?us-ascii?Q?GKlA0nB3X4hCBdoYHPt488aHJHmAjCl8lkDC1AS4fFIjg6ICK/WzSq26TT95?=
 =?us-ascii?Q?HiaZvx69RZGg79cIsS7xEJdvspVB0I3KhOCZXiSYwpddOTIIwmZyXWbPnWbA?=
 =?us-ascii?Q?UZNS57KDnEQoCMj+RSxyJSQCAfkU8LSyHJxY6Sn19HsehODcEbunwnvibuQR?=
 =?us-ascii?Q?wa7mRXlaC6GbduuVhDZGPhSLyz/+KHHLnyu6VwbyaaAy0+3BcqYdfM+ahKUY?=
 =?us-ascii?Q?GH6mFCWhZRQudvo39txoYg70K1ccQAUDrsXGBOVy3geWUKN6+tvqKj3bcFI0?=
 =?us-ascii?Q?4M44QnTMtItDb81XbHl4Olr7JvREPgzgiaV8ODG8J1LNF7Szdji3UUzY/fmn?=
 =?us-ascii?Q?XRPVr2Iz457VD1kg/Py15MHS05ZoEAv+TTRIP9ekv8GP0kadZVq0al821MzS?=
 =?us-ascii?Q?u5hy/fQvZX2Dt3BIXU/V3pZ6/m/xZPPLICANQOs+nlX2xfEyNU96TJJchb64?=
 =?us-ascii?Q?S5NdgQDtQ+AEbHRKsOiyZjSwR19Xjlee1ym7RtWkgIeqz21sbdpCW9OaUrFN?=
 =?us-ascii?Q?U87PbU7++m0MR1t6cuHTlUfb6n73OjZ2RlH6+23MRfmRxQ4PtFADF8qtRt6A?=
 =?us-ascii?Q?b98yqotQU0nu3ukXhMcxs4gIfYlNUfD/cCYsq9HAFRdvHMzaWMCSzE27e7C1?=
 =?us-ascii?Q?7F/KH+/BfI4nnCXBybbQzM+eR5OuvrOLZPToTIQyWE9/UVlkZmngt0vClUNL?=
 =?us-ascii?Q?5LAI9Yt7b16MgL7zSWr5MRtu2pXJAJN3h9s277DtlZe+q0Z+uEKSWXMbXPaC?=
 =?us-ascii?Q?+TBuTxtfkbRZO3490f4LLfP9+R1c0IlYCHvT1p6NdzVOjLNdxvxZZhBeD0vj?=
 =?us-ascii?Q?s59kbTgWZegXHZUSMwbyLXTOe68SIAWToL5PV4vududFXVGaxcnS0YI312Ih?=
 =?us-ascii?Q?STTnAMyXluCqueDEcB7Lzt0DS8ByEdLA9Ll9wcWkJyoij9o+fg/wMf894+TD?=
 =?us-ascii?Q?TGy4/wU+ZI4ZW1EXRDFghDpI4XIuRBJQhkVlwGVHp2kW9vaSTkAjLZfj3k0C?=
 =?us-ascii?Q?CT80JHIJZCA191MDM97yC7vm7Q2jrtLiksav1rYf1IYUdm1CyXG4C1J9MH7V?=
 =?us-ascii?Q?uK6Dm9nc5hqdlvvd/2TVacaNDodEh6IKAajbwuqW96otkD8viE4Ojmsvic1g?=
 =?us-ascii?Q?y0Ue7Ps9jxqjsfJeBeN58C4/4BAAJ2WKMlNkjvOyi45QOYh6kSxQojZ1GTV7?=
 =?us-ascii?Q?HRaRIB9aSkWsG6ser4HGD5Ev?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 16:00:44.8628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 109a6804-9662-4639-6756-08dce944b2ee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8737
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 16:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205409



> On 10 Oct 2024, at 14:03, Richard Purdie <richard.purdie@linuxfoundation.=
org> wrote:
> I think something in here is causing:
>=20
> https://valkyrie.yoctoproject.org/#/builders/99/builds/216/steps/17/logs/=
stdio
> https://valkyrie.yoctoproject.org/#/builders/89/builds/208/steps/12/logs/=
stdio
> https://valkyrie.yoctoproject.org/#/builders/7/builds/233/steps/12/logs/s=
tdio
>=20
> and maybe more.

That would be the DEBIAN/CONTROL ignoring which I made a logic error on. v2=
 incoming.

Ross=

