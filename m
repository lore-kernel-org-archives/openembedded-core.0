Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE1BC10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 13:13:26 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.40])
 by mx.groups.io with SMTP id smtpd.web10.11298.1715087594870610047
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 06:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arri.de header.s=selector1 header.b=XNmt9Emn;
 spf=pass (domain: arri.de, ip: 40.107.6.40, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrUtMIujthWBVn8nyuOlr7g9+P5JDM7z9JmcVCdSkWPudVxDCri8+K7USDlCDm9lfddIylH3ZJ4v0LLHB+/f98Wgm54tpIXguumkAtnF6wG+6tPoZoRr3IbH47reEIpP7yJqmT957WXF6dUXscOra788Tb4+g/afow4ao11gKMUfrrzNaRHthJ81xpDXVDgPBpppnVtw6shPEE5rTQbnr8anqhCyL+yKwSe1w7mcTycW0V6IpwPy1Hu/jsZG5Q2vCLULrOzXLJ1zo3Mp9WwTehL1eN9d6wjs1hWb4VV/mOF3LkLB1szjEy61cCoXRe8L8QkkQqRmrC/H90oILs3bZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cqU59pCiF+pdhwNllJo4pA79Ea/cgze2RQNmHSvIVg=;
 b=mB1dwW64LOt6Y7M8vdsOSOjI3BTL/oIFyZbD97vmpzZqZUhhiQbRtQslU+xsjAhG2ZT3eJ28Zm9FDjJg6eYDB00CATnU9BX4aGh0ZTPk6sy5oc+Ot3auV7wNkn+coQUMiLi7hFYYskKRKGmCILbNCaqKEh6nkbNX8ZYa6nm0N0gny48qHKgpXur2t7fdsxm1IMjBgIOrd2cFF4Y34l4qRQU4275k8aAeQq/mFDcHoAbZ2AIO4w6JugYTRxyBHeRF4tBxw1G0YdE4pUSz9l5YRcmHZYzvNmEThiJfcSfUC8Z7Ob1sxa7SdWxx0vtdmCCI+2xigruZY9u3Tw2+SWLdFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 52.169.0.179) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arri.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cqU59pCiF+pdhwNllJo4pA79Ea/cgze2RQNmHSvIVg=;
 b=XNmt9Emnp/qPgyg5bZtjwVj74+8gAd120W1HyD6K2NGTYvnUZc+ndZYNgIntLkBTuLTmoZTL3JuADgElMZesXAhBfLc5tOv+zyQOXmdVVRQ+p9n+HE1RizAzsebMjJQq5m184ZPsMdV1ohU1B9kcqWOBzWMzJfbSLfYzl7X4q18=
Received: from AS9PR04CA0075.eurprd04.prod.outlook.com (2603:10a6:20b:48b::24)
 by AS2PR07MB9124.eurprd07.prod.outlook.com (2603:10a6:20b:55b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 13:13:10 +0000
Received: from AMS0EPF00000196.eurprd05.prod.outlook.com
 (2603:10a6:20b:48b:cafe::d9) by AS9PR04CA0075.outlook.office365.com
 (2603:10a6:20b:48b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39 via Frontend
 Transport; Tue, 7 May 2024 13:13:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 52.169.0.179)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arri.de;
Received-SPF: Pass (protection.outlook.com: domain of arri.de designates
 52.169.0.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.169.0.179; helo=eu2.smtp.exclaimer.net; pr=C
Received: from eu2.smtp.exclaimer.net (52.169.0.179) by
 AMS0EPF00000196.mail.protection.outlook.com (10.167.16.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.7544.18 via Frontend Transport; Tue, 7 May 2024 13:13:07 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (104.47.51.169)
	 by eu2.smtp.exclaimer.net (52.169.0.179) with Exclaimer Signature Manager
	 ESMTP Proxy eu2.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Tue, 7 May 2024 13:13:08 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 10461297
X-ExclaimerImprintLatency: 5816944
X-ExclaimerImprintAction: fff1c621e3634c049250902d05025a38
Content-Type: multipart/related;
	boundary="----_=_NextPart_0da86254-e0f9-4d1f-af79-8528753c402b"
Received: from AM5PR04CA0024.eurprd04.prod.outlook.com (2603:10a6:206:1::37)
 by AS8PR07MB7528.eurprd07.prod.outlook.com (2603:10a6:20b:2a2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 13:13:05 +0000
Received: from AM4PEPF00027A67.eurprd04.prod.outlook.com
 (2603:10a6:206:1:cafe::f4) by AM5PR04CA0024.outlook.office365.com
 (2603:10a6:206:1::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Tue, 7 May 2024 13:13:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM4PEPF00027A67.mail.protection.outlook.com (10.167.16.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.18 via Frontend Transport; Tue, 7 May 2024 13:13:04 +0000
Received: from n9w6sw14.localnet (10.30.4.101) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 7 May
 2024 15:13:04 +0200
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
Subject: [nanbield] git command included in buildtools-extended does not work with
 https authentication
Date: Tue, 7 May 2024 15:13:02 +0200
Message-ID: <2192680.irdbgypaU6@n9w6sw14>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
MIME-Version: 1.0
X-Originating-IP: [10.30.4.101]
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: 
	AM4PEPF00027A67:EE_|AS8PR07MB7528:EE_|AMS0EPF00000196:EE_|AS2PR07MB9124:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd686e5-c1ad-4739-d397-08dc6e977053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|1800799015|376005|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?invEo02jAhHWX0YuvXUhHwXdqPKnqlV90J/Tm5gITHtohFPHGH/PBcGSFNEJ?=
 =?us-ascii?Q?Hi4b9EsZM9c9HC3SYJuuD0LA5U8M5alma/dAgAIJQk3JUtjaEyF5pl2KgO9L?=
 =?us-ascii?Q?NzDfmWuUcB6GH4uLS5xUXSJ4wDopRdQpMTFSHjwmdMdJZo4yZ3fRc5n4Noap?=
 =?us-ascii?Q?fcenvxaAYFEHSv8ATKfexhp/9QtQ/ii3+eVCJVJpu995sX5nkxeQAakj0Tvb?=
 =?us-ascii?Q?8lNzOkrS09YNGTlBGoSNh5HH14lHyrOPb9Qq1noXkJMy+ce/zy/8OSPnPzLz?=
 =?us-ascii?Q?sY/dvbLFjhpFSxNNY1PkHzhGZhnSxA0ohwJHb6q1SXLQLDSM5lu6XCrXSi2Q?=
 =?us-ascii?Q?N/PSU2iaj3ljRKcBjFXvG471r6+bADflE2GAAdomM1nOBRkh4/gLaJUSjcGW?=
 =?us-ascii?Q?ro5XrGewzuui2K9t2ig5dY3YeghK+UH5von1zW0jfM6qi0OzCYoCiMbLz880?=
 =?us-ascii?Q?kSpACW+a70DKo29txJpJLpt/B4WkHKcBE0+VKg6nssnR2/P7dlRkP4s32TGx?=
 =?us-ascii?Q?x8VDKXEmo51tN6VOdMw+a5O8riHRBNYpqsL4Lbgi/UbIS9BCJSSYeO8GqDy9?=
 =?us-ascii?Q?ujTkRTr+TNonGfKOm4MpTS3zZK3krke3Aj4O7kTwpqP4Di0E7u38ZNtF+gYm?=
 =?us-ascii?Q?zW/+zvB4jNrz+ONW1qFTIM9vdbJXfQtmpsNFYDqOYfWl94OIpfPiUKH5huy1?=
 =?us-ascii?Q?Xn43CvOzOE+PmaV8QUcX+J/8J30zJQnH0QZEPc/iGvV23lQIczCSql+dsWLU?=
 =?us-ascii?Q?LMhUIU1tLQsOFAjT1a9oCDwae1p3PGB2LTRszRm7zcqu3E1NodX1Q9jFwAmW?=
 =?us-ascii?Q?oLNvpqaEosrHqChONGWxUj9kW+XmmE0omJCP/3l2oo1lpc8YJLuirQp2UKY1?=
 =?us-ascii?Q?Fik5qLuHlUjO4j2NNhutCVXAGeAd8llFzhdb/JC7fy1S03XiHD+tDqTSu8RE?=
 =?us-ascii?Q?wed4AI/oAcYJIMvcQWBrf4qLxk1BbR7T3yxWAJBpKSx8BYKF/rugPBgaFA1H?=
 =?us-ascii?Q?k/260VLBGYyPsqBZ/QFKSDigKhyWSSswyygjwgsYPH3PoFIowLdYTbxdpNZO?=
 =?us-ascii?Q?gVw7onV/Cn8MHDnyIES1SB7yA5XGnFVU1/cbnQDmTBTB7DPm7A/fAArlsugO?=
 =?us-ascii?Q?ZBbXJurHgccioxeDyWEMxZHX0KPOsL/9BzaM8+cG9mYY7M2l6LRBomocdzJS?=
 =?us-ascii?Q?W3O00dt94vO19hTYAiXhtfyqoxGIjau73J1lC4EWlv8x9BV41z0RVp0eDFTK?=
 =?us-ascii?Q?j+n61Bm5nBW30M/D7UVRUGs2XGXShjWMLV2bJ/ppFAKZNnXWfaYL3sGQ/+o9?=
 =?us-ascii?Q?HaodvWdkq5hI+gfIWDYDOZvR?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7528
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000196.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	66f1036e-efd7-4fe9-6dd0-08dc6e976e1d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|1800799015|36860700004|35042699013|82310400017;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d254T2V0UjhKYzQ2dGphcjR4UFVET1NRRmoza0wyZ1h1aW1OVVBueUJzbGc0?=
 =?utf-8?B?c1k1Q3kyUnRsR1RQa3Qzc3FKTGVnbElhK3U4OVBDYkxtT2tHa21GemJRTUpT?=
 =?utf-8?B?dm8zNUh2aHRWOHVvazUxR0pYeE9IbVVPemwrMnQvckVGVHR1ZENrTU9oNm03?=
 =?utf-8?B?d2ZxWnNKbEgvU3kxYTJmZzUvRWZxUjR6cXNZQkM5TW1aK0U1d0FyNkFjdXpB?=
 =?utf-8?B?cnllVDFybDJ5aHZqUmlrZHVzZmI1dzJNZC9iczZWYlY3TzNabitVUGlqMlJM?=
 =?utf-8?B?eGJhWWE3OTZadGs1NmtQSVVCNExrQTdWMGN5SVVGRTA3TGxmeENRTHpJcko1?=
 =?utf-8?B?QXJxMnRoRTE2ODZxM2JIOEFEWVZ3T1JGQjhPdGxvT2oxdmg2dStnUlRHMlJY?=
 =?utf-8?B?ZjhSb0N5dVd4QzJFRWhlckRjNFRFUG9IM2pYZ3FiR3dMN3paQ3EyMkFCNG9X?=
 =?utf-8?B?eUIwd1phOXBKWTlPWExKcHFpaDRRN04xOHYzeU8zeTlwTVVCRThPWjlEbXIy?=
 =?utf-8?B?Y3ptb3J3NExJaExhRkNEREVZSWV6K0prS2tuT2s4R095dFo0eWRsc1ErK3M0?=
 =?utf-8?B?cU11OGh4dFJsRjN5ZDlqNE02cWlvUkt2dmZ5cWFwaHBuN2JESXY0KzF6M0RP?=
 =?utf-8?B?MDUrMU9FdW5GYXpSODBURlRBOUh2RnlrWDJ1RHhSRmY4YXdCT0d5Sm9ZeEVQ?=
 =?utf-8?B?Y0pWazNnTnZINjdIQXUzYkRSaUJHamVBZGdycTQwdlREZ2RzV1doWjNsY3Vs?=
 =?utf-8?B?NCtwUHpRdWVma2JwZW0vbW1ncU5rSGJDb2NWT3JhL3RGVHkveTl5ZElRSUps?=
 =?utf-8?B?MTFrSHUvRGNPTnRaQU9RMXNPaEVpMDUzeUZEK0g4ZEdjbnQ3OHVJSnJ4Tzg0?=
 =?utf-8?B?YjkySDUvMUJCU0toRHBIditjNUN1RGpSRVo0b2hndklveGJmQWFNRnpkSXlH?=
 =?utf-8?B?K3BIN3FVUFg4c3NkZCtCSitvdnEzTURjWm9tSGtreUp3eUwrWHhCT3U5QVRN?=
 =?utf-8?B?YXB6eDNnZ3FleWdTTFNwRXcxQmxIQi8zZ3o4SkY5emU2QWFvbUtLUDJyZ1pE?=
 =?utf-8?B?YjQrcTh5a3ZtRENKQ2pVNGlKUzZyT2Z5M3FkOS9QZ2ZieDJqcVdpUnFJTndE?=
 =?utf-8?B?bGc5NXlCc2F1OUhyT283RytJNHUyVTd6a0xPRERPajFWN1hGaExubGd2NitX?=
 =?utf-8?B?SStYaUFKSWFTZHIvZDNOZDQ4MTFLZ0RRQTlSVW5vOVF6WVppNmppOUFPdzFO?=
 =?utf-8?B?bm9EaXVNQUxyYkZSbldOamZ6a29wNm96TWZZb0h6bmFJTE8wUlBYQjZXbUtL?=
 =?utf-8?B?ZXhnd0VkMndaVVNYaDNkeFJNWi9xc2V1Tk0rMUV6WWR0QlQzWTRIMFU3aVdV?=
 =?utf-8?B?YUM2SWIxcmh1N1B0bmU2Nko1SE92ZHgzMlpiUER0ZDhrUHFqNm1Na21HZ1di?=
 =?utf-8?B?Q3Q3UVVGSmo5YnBOZW9YQldzUVZ2aG50MkpERDYvOERVSndHcW91OGE1ZGdx?=
 =?utf-8?B?SUxHejZQMW9HMjJ3UFd1c0JRZ3VxUUR2VlFDV1lVUkJsS1pISzhENDNvK080?=
 =?utf-8?B?YmN4bm9DazJaQVdya0pMci9yYndKNGR2R2dZWFRIOVNaTjZabDg5OHhRemJm?=
 =?utf-8?B?Z2MyQlYwRk1HQzkwQTc4dWdFb0lBRnExZ0VOUFc3dWRkZFhnUmxrZVAvcFpB?=
 =?utf-8?B?YW5FRmlYR1B6cUg1TjBIaVJRVlhpa3dHOTNJUG53T2xXbUdkV1hBd1hBdUFN?=
 =?utf-8?Q?n1XC89ZIKrDMlenoYwlhDx0ZN2ACYvVXj0QhZcK?=
X-Forefront-Antispam-Report: 
	CIP:52.169.0.179;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu2.smtp.exclaimer.net;PTR:eu2.smtp.exclaimer.net;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(35042699013)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 13:13:07.6707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd686e5-c1ad-4739-d397-08dc6e977053
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[52.169.0.179];Helo=[eu2.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000196.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR07MB9124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 13:13:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199093

This is a multi-part message in MIME format.

------_=_NextPart_0da86254-e0f9-4d1f-af79-8528753c402b
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_ca6f5ab1-ddbc-4825-9f50-61220464ab21"

------_=_NextPart_ca6f5ab1-ddbc-4825-9f50-61220464ab21
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

I am in the process of upgrading from Kirkstone to Scarthgap (via Langdale,
Mickledore and Nanbield). As my host system (openSUSE) doesn't meet the
system requirements, I use the buildtools-extended tarball.

Since the migration step from Mickledore to Nanbield, I cannot access my
company's GIT server (runing GitLab, requires https + authentifaction) anym=
ore.
When I use the GIT client from openSUSE, everything works fine, but when
the GIT command from the buildtools tarball is used, I get a 

"remote: HTTP Basic: Access denied."

error message (log below). When I compare this log with the working version=
,
I see that ...
- h2 is used instead of http/1.1
- authentication happens straight after SSL setup (before the GET command)

Could the GIT client in the buildtools tarball be configured in a way that
it works with https + authentication?


GIT_TRACE_CURL=3DTRUE GIT_TRACE_CURL_NO_DATA=3D1 GIT_TRACE_REDACT=3DFALSE G=
IT_TRACE2_REDACT=3DFALSE git clone git@git.mycompany.com:myrepo.git
Cloning into 'myrepo'...
12:35:38.736181 http.c:820              =3D=3D Info:   Trying xxx.xxx.xxx.x=
xx:443...
12:35:38.736581 http.c:820              =3D=3D Info: Connected to git.mycom=
pany.com (xxx.xxx.xxx.xxx) port 443
12:35:38.738282 http.c:820              =3D=3D Info: ALPN: curl offers http=
/1.1
12:35:38.738544 http.c:820              =3D=3D Info: TLSv1.3 (OUT), TLS han=
dshake, Client hello (1):
12:35:38.749279 http.c:820              =3D=3D Info:  CAfile: /build/buildt=
ools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt
12:35:38.749303 http.c:820              =3D=3D Info:  CApath: none
12:35:38.749385 http.c:820              =3D=3D Info: TLSv1.3 (IN), TLS hand=
shake, Server hello (2):
12:35:38.749698 http.c:820              =3D=3D Info: TLSv1.3 (IN), TLS hand=
shake, Encrypted Extensions (8):
12:35:38.749722 http.c:820              =3D=3D Info: TLSv1.3 (IN), TLS hand=
shake, Certificate (11):
12:35:38.750274 http.c:820              =3D=3D Info: TLSv1.3 (IN), TLS hand=
shake, CERT verify (15):
12:35:38.750368 http.c:820              =3D=3D Info: TLSv1.3 (IN), TLS hand=
shake, Finished (20):
12:35:38.750407 http.c:820              =3D=3D Info: TLSv1.3 (OUT), TLS cha=
nge cipher, Change cipher spec (1):
12:35:38.750432 http.c:820              =3D=3D Info: TLSv1.3 (OUT), TLS han=
dshake, Finished (20):
12:35:38.750537 http.c:820              =3D=3D Info: SSL connection using T=
LSv1.3 / TLS_AES_256_GCM_SHA384
12:35:38.750546 http.c:820              =3D=3D Info: ALPN: server accepted =
http/1.1
12:35:38.750555 http.c:820              =3D=3D Info: Server certificate:
12:35:38.750571 http.c:820              =3D=3D Info:  subject: CN=3D*.mycom=
pany.com
12:35:38.750581 http.c:820              =3D=3D Info:  start date: Feb 28 00=
:00:00 2024 GMT
12:35:38.750589 http.c:820              =3D=3D Info:  expire date: Mar 15 2=
3:59:59 2025 GMT
12:35:38.750606 http.c:820              =3D=3D Info:  subjectAltName: host =
"git.mycompany.com" matched cert's "*.mycompany.com"
12:35:38.750622 http.c:820              =3D=3D Info:  issuer: C=3DGB; ST=
=3DGreater Manchester; L=3DSalford; O=3DSectigo Limited; CN=3DSectigo RSA D=
omain Validation Secure Server CA
12:35:38.750629 http.c:820              =3D=3D Info:  SSL certificate verif=
y ok.

12:35:38.750632 http.c:820              =3D=3D Info: using HTTP/1.1
                                           NOTE: openSUSE's GIT client uses=
 HTTP/2 here and also performs authentication here.

12:35:38.750680 http.c:767              =3D> Send header, 0000000247 bytes =
(0x000000f7)
12:35:38.750688 http.c:779              =3D> Send header: GET /myrepo.git/i=
nfo/refs?service=3Dgit-upload-pack HTTP/1.1
12:35:38.750690 http.c:779              =3D> Send header: Host: git.mycompa=
ny.com
12:35:38.750692 http.c:779              =3D> Send header: User-Agent: git/2=
=2E42.0
12:35:38.750694 http.c:779              =3D> Send header: Accept: */*
12:35:38.750696 http.c:779              =3D> Send header: Accept-Encoding: =
deflate, gzip
12:35:38.750698 http.c:779              =3D> Send header: Pragma: no-cache
12:35:38.750699 http.c:779              =3D> Send header: Git-Protocol: ver=
sion=3D2
12:35:38.750701 http.c:779              =3D> Send header:
12:35:38.764115 http.c:820              =3D=3D Info: TLSv1.3 (IN), TLS hand=
shake, Newsession Ticket (4):
12:35:38.764234 http.c:820              =3D=3D Info: TLSv1.3 (IN), TLS hand=
shake, Newsession Ticket (4):
12:35:38.764247 http.c:820              =3D=3D Info: old SSL session ID is =
stale, removing
12:35:38.774919 http.c:767              <=3D Recv header, 0000000027 bytes =
(0x0000001b)
12:35:38.774944 http.c:779              <=3D Recv header: HTTP/1.1 401 Unau=
thorized
                                           NOTE: working version returns "H=
TTP/2 401" here.

12:35:38.774947 http.c:767              <=3D Recv header, 0000000015 bytes =
(0x0000000f)
12:35:38.774949 http.c:779              <=3D Recv header: Server: nginx
12:35:38.774953 http.c:767              <=3D Recv header, 0000000037 bytes =
(0x00000025)
12:35:38.774954 http.c:779              <=3D Recv header: Date: Tue, 07 May=
 2024 12:35:38 GMT
12:35:38.774957 http.c:767              <=3D Recv header, 0000000041 bytes =
(0x00000029)
12:35:38.774963 http.c:779              <=3D Recv header: Content-Type: tex=
t/plain; charset=3Dutf-8
12:35:38.774973 http.c:767              <=3D Recv header, 0000000021 bytes =
(0x00000015)
12:35:38.774977 http.c:779              <=3D Recv header: Content-Length: 2=
70
12:35:38.774980 http.c:767              <=3D Recv header, 0000000024 bytes =
(0x00000018)
12:35:38.774982 http.c:779              <=3D Recv header: Connection: keep-=
alive
12:35:38.774987 http.c:767              <=3D Recv header, 0000000025 bytes =
(0x00000019)
12:35:38.774989 http.c:779              <=3D Recv header: Cache-Control: no=
-cache
12:35:38.774991 http.c:767              <=3D Recv header, 0000000014 bytes =
(0x0000000e)
12:35:38.774996 http.c:779              <=3D Recv header: Vary: Accept
12:35:38.774999 http.c:767              <=3D Recv header, 0000000040 bytes =
(0x00000028)
12:35:38.775001 http.c:779              <=3D Recv header: WWW-Authenticate:=
 Basic realm=3D"GitLab"
12:35:38.775007 http.c:767              <=3D Recv header, 0000000033 bytes =
(0x00000021)
12:35:38.775009 http.c:779              <=3D Recv header: X-Content-Type-Op=
tions: nosniff
12:35:38.775015 http.c:767              <=3D Recv header, 0000000028 bytes =
(0x0000001c)
12:35:38.775018 http.c:779              <=3D Recv header: X-Download-Option=
s: noopen
12:35:38.775020 http.c:767              <=3D Recv header, 0000000029 bytes =
(0x0000001d)
12:35:38.775025 http.c:779              <=3D Recv header: X-Frame-Options: =
SAMEORIGIN
12:35:38.775028 http.c:767              <=3D Recv header, 0000000078 bytes =
(0x0000004e)
12:35:38.775033 http.c:779              <=3D Recv header: X-Gitlab-Meta: {"=
correlation_id":"XXXXXXXXXXXXXXXXXXXXXXXXXX","version":"1"}
12:35:38.775036 http.c:767              <=3D Recv header, 0000000041 bytes =
(0x00000029)
12:35:38.775041 http.c:779              <=3D Recv header: X-Permitted-Cross=
-Domain-Policies: none
12:35:38.775044 http.c:767              <=3D Recv header, 0000000042 bytes =
(0x0000002a)
12:35:38.775046 http.c:779              <=3D Recv header: X-Request-Id: XXX=
XXXXXXXXXXXXXXXXXXXXXXX
12:35:38.775051 http.c:767              <=3D Recv header, 0000000021 bytes =
(0x00000015)
12:35:38.775053 http.c:779              <=3D Recv header: X-Runtime: 0.0214=
34
12:35:38.775056 http.c:767              <=3D Recv header, 0000000021 bytes =
(0x00000015)
12:35:38.775061 http.c:779              <=3D Recv header: X-Xss-Protection:=
 0
12:35:38.775064 http.c:767              <=3D Recv header, 0000000002 bytes =
(0x00000002)
12:35:38.775071 http.c:779              <=3D Recv header:
12:35:38.775087 http.c:820              =3D=3D Info: Connection #0 to host =
git.mycompany.com left intact
remote: HTTP Basic: Access denied. The provided password or token is incorr=
ect or your account has 2FA enabled and you must use a personal access toke=
n instead of a password. See https://git.mycompany.com/help/topics/git/trou=
bleshooting_git#error-on-git-fetch-http-basic-access-denied
fatal: Authentication failed for 'https://git.mycompany.com/myrepo.git/'




_______________________________________________________
Christian 
Eggers
Software Engineer
=E2=80=8B
ARRI
Arnold & Richter Cine Technik GmbH & Co. Betriebs KG 
Arriweg 17, 
83071 
Stephanskirchen
www.arri.com 

+49 8036 3009-3118
CEggers@arri.de

=E2=80=8B

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRA 57918
Pers=C3=B6nlich haftender Gesellschafter: Arnold & Richter Cine Technik Gmb=
H
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRB 54477
Gesch=C3=A4ftsf=C3=BChrer: Dr. Matthias Erb (Chairman); Lars Weyer; Walter =
Trauninger

=E2=80=8B

------_=_NextPart_ca6f5ab1-ddbc-4825-9f50-61220464ab21
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8" /></head><body><div>I am in the process of upgrading from Kirksto=
ne to Scarthgap (via Langdale,<br />Mickledore and Nanbield). As my host sy=
stem (openSUSE) doesn&#39;t meet the<br />system requirements, I use the bu=
ildtools-extended tarball.<br /><br />Since the migration step from Mickled=
ore to Nanbield, I cannot access my<br />company&#39;s GIT server (runing G=
itLab, requires https + authentifaction) anymore.<br />When I use the GIT c=
lient from openSUSE, everything works fine, but when<br />the GIT command f=
rom the buildtools tarball is used, I get a <br /><br />&quot;remote: HTTP =
Basic: Access denied.&quot;<br /><br />error message (log below). When I co=
mpare this log with the working version,<br />I see that ...<br />- h2 is u=
sed instead of http/1.1<br />- authentication happens straight after SSL se=
tup (before the GET command)<br /><br />Could the GIT client in the buildto=
ols tarball be configured in a way that<br />it works with https + authenti=
cation?<br /><br /><br />GIT_TRACE_CURL=3DTRUE GIT_TRACE_CURL_NO_DATA=3D1 G=
IT_TRACE_REDACT=3DFALSE GIT_TRACE2_REDACT=3DFALSE git clone git@git.mycompa=
ny.com:myrepo.git<br />Cloning into &#39;myrepo&#39;...<br />12:35:38.73618=
1 http.c:820              =3D=3D Info:   Trying xxx.xxx.xxx.xxx:443...<br /=
>12:35:38.736581 http.c:820              =3D=3D Info: Connected to git.myco=
mpany.com (xxx.xxx.xxx.xxx) port 443<br />12:35:38.738282 http.c:820       =
       =3D=3D Info: ALPN: curl offers http/1.1<br />12:35:38.738544 http.c:=
820              =3D=3D Info: TLSv1.3 (OUT), TLS handshake, Client hello (1=
):<br />12:35:38.749279 http.c:820              =3D=3D Info:  CAfile: /buil=
d/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.cr=
t<br />12:35:38.749303 http.c:820              =3D=3D Info:  CApath: none<b=
r />12:35:38.749385 http.c:820              =3D=3D Info: TLSv1.3 (IN), TLS =
handshake, Server hello (2):<br />12:35:38.749698 http.c:820              =
=3D=3D Info: TLSv1.3 (IN), TLS handshake, Encrypted Extensions (8):<br />12=
:35:38.749722 http.c:820              =3D=3D Info: TLSv1.3 (IN), TLS handsh=
ake, Certificate (11):<br />12:35:38.750274 http.c:820              =3D=3D =
Info: TLSv1.3 (IN), TLS handshake, CERT verify (15):<br />12:35:38.750368 h=
ttp.c:820              =3D=3D Info: TLSv1.3 (IN), TLS handshake, Finished (=
20):<br />12:35:38.750407 http.c:820              =3D=3D Info: TLSv1.3 (OUT=
), TLS change cipher, Change cipher spec (1):<br />12:35:38.750432 http.c:8=
20              =3D=3D Info: TLSv1.3 (OUT), TLS handshake, Finished (20):<b=
r />12:35:38.750537 http.c:820              =3D=3D Info: SSL connection usi=
ng TLSv1.3 / TLS_AES_256_GCM_SHA384<br />12:35:38.750546 http.c:820        =
      =3D=3D Info: ALPN: server accepted http/1.1<br />12:35:38.750555 http=
=2Ec:820              =3D=3D Info: Server certificate:<br />12:35:38.750571=
 http.c:820              =3D=3D Info:  subject: CN=3D*.mycompany.com<br />1=
2:35:38.750581 http.c:820              =3D=3D Info:  start date: Feb 28 00:=
00:00 2024 GMT<br />12:35:38.750589 http.c:820              =3D=3D Info:  e=
xpire date: Mar 15 23:59:59 2025 GMT<br />12:35:38.750606 http.c:820       =
       =3D=3D Info:  subjectAltName: host &quot;git.mycompany.com&quot; mat=
ched cert&#39;s &quot;*.mycompany.com&quot;<br />12:35:38.750622 http.c:820=
              =3D=3D Info:  issuer: C=3DGB; ST=3DGreater Manchester; L=3DSa=
lford; O=3DSectigo Limited; CN=3DSectigo RSA Domain Validation Secure Serve=
r CA<br />12:35:38.750629 http.c:820              =3D=3D Info:  SSL certifi=
cate verify ok.<br /><br />12:35:38.750632 http.c:820              =3D=3D I=
nfo: using HTTP/1.1<br />                                           NOTE: o=
penSUSE&#39;s GIT client uses HTTP/2 here and also performs authentication =
here.<br /><br />12:35:38.750680 http.c:767              =3D&gt; Send heade=
r, 0000000247 bytes (0x000000f7)<br />12:35:38.750688 http.c:779           =
   =3D&gt; Send header: GET /myrepo.git/info/refs?service=3Dgit-upload-pack=
 HTTP/1.1<br />12:35:38.750690 http.c:779              =3D&gt; Send header:=
 Host: git.mycompany.com<br />12:35:38.750692 http.c:779              =3D&g=
t; Send header: User-Agent: git/2.42.0<br />12:35:38.750694 http.c:779     =
         =3D&gt; Send header: Accept: */*<br />12:35:38.750696 http.c:779  =
            =3D&gt; Send header: Accept-Encoding: deflate, gzip<br />12:35:=
38.750698 http.c:779              =3D&gt; Send header: Pragma: no-cache<br =
/>12:35:38.750699 http.c:779              =3D&gt; Send header: Git-Protocol=
: version=3D2<br />12:35:38.750701 http.c:779              =3D&gt; Send hea=
der:<br />12:35:38.764115 http.c:820              =3D=3D Info: TLSv1.3 (IN)=
, TLS handshake, Newsession Ticket (4):<br />12:35:38.764234 http.c:820    =
          =3D=3D Info: TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):<=
br />12:35:38.764247 http.c:820              =3D=3D Info: old SSL session I=
D is stale, removing<br />12:35:38.774919 http.c:767              &lt;=3D R=
ecv header, 0000000027 bytes (0x0000001b)<br />12:35:38.774944 http.c:779  =
            &lt;=3D Recv header: HTTP/1.1 401 Unauthorized<br />           =
                                NOTE: working version returns &quot;HTTP/2 =
401&quot; here.<br /><br />12:35:38.774947 http.c:767              &lt;=3D =
Recv header, 0000000015 bytes (0x0000000f)<br />12:35:38.774949 http.c:779 =
             &lt;=3D Recv header: Server: nginx<br />12:35:38.774953 http.c=
:767              &lt;=3D Recv header, 0000000037 bytes (0x00000025)<br />1=
2:35:38.774954 http.c:779              &lt;=3D Recv header: Date: Tue, 07 M=
ay 2024 12:35:38 GMT<br />12:35:38.774957 http.c:767              &lt;=3D R=
ecv header, 0000000041 bytes (0x00000029)<br />12:35:38.774963 http.c:779  =
            &lt;=3D Recv header: Content-Type: text/plain; charset=3Dutf-8<=
br />12:35:38.774973 http.c:767              &lt;=3D Recv header, 000000002=
1 bytes (0x00000015)<br />12:35:38.774977 http.c:779              &lt;=3D R=
ecv header: Content-Length: 270<br />12:35:38.774980 http.c:767            =
  &lt;=3D Recv header, 0000000024 bytes (0x00000018)<br />12:35:38.774982 h=
ttp.c:779              &lt;=3D Recv header: Connection: keep-alive<br />12:=
35:38.774987 http.c:767              &lt;=3D Recv header, 0000000025 bytes =
(0x00000019)<br />12:35:38.774989 http.c:779              &lt;=3D Recv head=
er: Cache-Control: no-cache<br />12:35:38.774991 http.c:767              &l=
t;=3D Recv header, 0000000014 bytes (0x0000000e)<br />12:35:38.774996 http.=
c:779              &lt;=3D Recv header: Vary: Accept<br />12:35:38.774999 h=
ttp.c:767              &lt;=3D Recv header, 0000000040 bytes (0x00000028)<b=
r />12:35:38.775001 http.c:779              &lt;=3D Recv header: WWW-Authen=
ticate: Basic realm=3D&quot;GitLab&quot;<br />12:35:38.775007 http.c:767   =
           &lt;=3D Recv header, 0000000033 bytes (0x00000021)<br />12:35:38=
=2E775009 http.c:779              &lt;=3D Recv header: X-Content-Type-Optio=
ns: nosniff<br />12:35:38.775015 http.c:767              &lt;=3D Recv heade=
r, 0000000028 bytes (0x0000001c)<br />12:35:38.775018 http.c:779           =
   &lt;=3D Recv header: X-Download-Options: noopen<br />12:35:38.775020 htt=
p.c:767              &lt;=3D Recv header, 0000000029 bytes (0x0000001d)<br =
/>12:35:38.775025 http.c:779              &lt;=3D Recv header: X-Frame-Opti=
ons: SAMEORIGIN<br />12:35:38.775028 http.c:767              &lt;=3D Recv h=
eader, 0000000078 bytes (0x0000004e)<br />12:35:38.775033 http.c:779       =
       &lt;=3D Recv header: X-Gitlab-Meta: {&quot;correlation_id&quot;:&quo=
t;XXXXXXXXXXXXXXXXXXXXXXXXXX&quot;,&quot;version&quot;:&quot;1&quot;}<br />=
12:35:38.775036 http.c:767              &lt;=3D Recv header, 0000000041 byt=
es (0x00000029)<br />12:35:38.775041 http.c:779              &lt;=3D Recv h=
eader: X-Permitted-Cross-Domain-Policies: none<br />12:35:38.775044 http.c:=
767              &lt;=3D Recv header, 0000000042 bytes (0x0000002a)<br />12=
:35:38.775046 http.c:779              &lt;=3D Recv header: X-Request-Id: XX=
XXXXXXXXXXXXXXXXXXXXXXXX<br />12:35:38.775051 http.c:767              &lt;=
=3D Recv header, 0000000021 bytes (0x00000015)<br />12:35:38.775053 http.c:=
779              &lt;=3D Recv header: X-Runtime: 0.021434<br />12:35:38.775=
056 http.c:767              &lt;=3D Recv header, 0000000021 bytes (0x000000=
15)<br />12:35:38.775061 http.c:779              &lt;=3D Recv header: X-Xss=
-Protection: 0<br />12:35:38.775064 http.c:767              &lt;=3D Recv he=
ader, 0000000002 bytes (0x00000002)<br />12:35:38.775071 http.c:779        =
      &lt;=3D Recv header:<br />12:35:38.775087 http.c:820              =
=3D=3D Info: Connection #0 to host git.mycompany.com left intact<br />remot=
e: HTTP Basic: Access denied. The provided password or token is incorrect o=
r your account has 2FA enabled and you must use a personal access token ins=
tead of a password. See https://git.mycompany.com/help/topics/git/troublesh=
ooting_git#error-on-git-fetch-http-basic-access-denied<br />fatal: Authenti=
cation failed for &#39;https://git.mycompany.com/myrepo.git/&#39;<br /><br =
/><br /><br /></div><div dir=3D"ltr" style=3D"mso-line-height-rule:exactly;=
-webkit-text-size-adjust:100%;font-size:1px;direction:ltr;"><table cellpadd=
ing=3D"0" cellspacing=3D"0" border=3D"0" style=3D"width:100%;border-collaps=
e:collapse;font-size:1px;"><tr style=3D"font-size:0;"><td align=3D"left" st=
yle=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" bord=
er=3D"0" style=3D"border-collapse:collapse;font-size:0;"><tr style=3D"font-=
size:0;"><td align=3D"left" style=3D"padding:0;vertical-align:top;"><table =
cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"width:100%;border=
-collapse:collapse;font-size:0;"><tr style=3D"font-size:14.67px;color:#7F7F=
7F;font-style:normal;font-weight:400;white-space:nowrap;"><td align=3D"left=
" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;">______=
_________________________________________________<span style=3D"font-family=
:remialcxesans;font-size:1px;color:#FFFFFF;line-height:1px;">&#8203;<span s=
tyle=3D"font-family:&#39;template-LZ3Cj7wTEei85wANOiIRuQ&#39;;">&#8203;</sp=
an><span style=3D"font-family:&#39;zone-1&#39;;">&#8203;</span><span style=
=3D"font-family:&#39;zones-AQ&#39;;">&#8203;</span></span></td></tr><tr sty=
le=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table=
 cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"border-collapse:=
collapse;font-size:0;"><tr style=3D"font-size:0;"><td align=3D"left" style=
=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=
=3D"0" style=3D"border-collapse:collapse;font-size:0;color:#7F7F7F;font-sty=
le:normal;font-weight:400;white-space:nowrap;"><tr style=3D"font-size:14.67=
px;"><td align=3D"left" style=3D"vertical-align:top;font-family:Calibri,Ari=
al,sans-serif;">Christian</td><td align=3D"left" style=3D"vertical-align:to=
p;color:#000001;font-family:Calibri,Arial,sans-serif;">&nbsp;<br /></td><td=
 align=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-=
serif;">Eggers</td></tr></table></td></tr><tr style=3D"font-size:0;"><td al=
ign=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspa=
cing=3D"0" border=3D"0" style=3D"border-collapse:collapse;font-size:0;color=
:#7F7F7F;font-style:normal;font-weight:400;white-space:nowrap;"><tr style=
=3D"font-size:14.67px;"><td align=3D"left" style=3D"vertical-align:top;font=
-family:Calibri,Arial,sans-serif;">Software&nbsp;Engineer</td></tr><tr styl=
e=3D"font-size:14.67px;color:#000001;"><td align=3D"left" style=3D"vertical=
-align:top;font-family:Calibri,Arial,sans-serif;">&#8203;</td></tr></table>=
</td></tr></table></td></tr><tr style=3D"font-size:0;"><td align=3D"left" s=
tyle=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" bor=
der=3D"0" style=3D"border-collapse:collapse;font-size:0;"><tr style=3D"font=
-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpaddi=
ng=3D"0" cellspacing=3D"0" border=3D"0" style=3D"border-collapse:collapse;f=
ont-size:0;color:#0E50AD;font-style:normal;font-weight:400;white-space:nowr=
ap;"><tr style=3D"font-size:13.33px;"><td align=3D"left" style=3D"vertical-=
align:top;font-family:&#39;Arial Black&#39;;">ARRI</td></tr><tr style=3D"fo=
nt-size:10.67px;color:#7F7F7F;"><td align=3D"left" style=3D"vertical-align:=
top;font-family:Arial;"><span style=3D"font-size:11px;">Arnold&nbsp;&amp;&n=
bsp;Richter&nbsp;Cine&nbsp;Technik&nbsp;GmbH&nbsp;&amp;&nbsp;Co.&nbsp;Betri=
ebs&nbsp;KG</span>&nbsp;<br /></td></tr></table></td></tr><tr style=3D"font=
-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpaddi=
ng=3D"0" cellspacing=3D"0" border=3D"0" style=3D"border-collapse:collapse;f=
ont-size:0;color:#7F7F7F;font-style:normal;font-weight:400;white-space:nowr=
ap;"><tr style=3D"font-size:10.67px;"><td align=3D"left" style=3D"vertical-=
align:top;font-family:Arial;">Arriweg&nbsp;17</td><td align=3D"left" style=
=3D"vertical-align:top;font-family:Arial;">,&nbsp;<br /></td><td align=3D"l=
eft" style=3D"vertical-align:middle;font-family:Arial;">83071</td><td align=
=3D"left" style=3D"vertical-align:middle;font-family:Arial;">&nbsp;<br /></=
td><td align=3D"left" style=3D"vertical-align:middle;font-family:Arial;">St=
ephanskirchen</td></tr></table></td></tr></table></td></tr><tr style=3D"fon=
t-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpadd=
ing=3D"0" cellspacing=3D"0" border=3D"0" style=3D"border-collapse:collapse;=
font-size:0;"><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertic=
al-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" styl=
e=3D"border-collapse:collapse;font-size:0;color:#1532B9;font-style:normal;f=
ont-weight:400;white-space:nowrap;"><tr style=3D"font-size:11px;"><td align=
=3D"left" style=3D"vertical-align:top;font-family:Arial;"><span style=3D"te=
xt-decoration:underline;"><a href=3D"http://www.arri.com/" target=3D"_blank=
" id=3D"LPlnk689713" style=3D"text-decoration:underline;color:#1532B9;">www=
=2Earri.com&nbsp;<br /><br /></a></span></td></tr><tr style=3D"font-size:0;=
"><td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0"=
 cellspacing=3D"0" border=3D"0" style=3D"border-collapse:collapse;font-size=
:0;color:#858080;font-style:normal;font-weight:400;line-height:normal;white=
-space:nowrap;"><tr style=3D"font-size:14.67px;"><td align=3D"left" style=
=3D"padding:0;vertical-align:top;font-size:0;"><img src=3D"cid:image838987.=
png@37BF62E6.99E6FC99" width=3D"20" height=3D"20" border=3D"0" alt=3D"" sty=
le=3D"width:20px;min-width:20px;max-width:20px;height:20px;min-height:20px;=
max-height:20px;font-size:0;" /></td><td align=3D"left" style=3D"padding:0;=
vertical-align:top;font-family:Calibri,Arial,sans-serif;"><a href=3D"tel:+4=
9%208036%203009-3118" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-de=
coration:none;color:#858080;">+49&nbsp;8036&nbsp;3009-3118</a></td></tr><tr=
 style=3D"font-size:0;"><td align=3D"left" style=3D"padding:0;vertical-alig=
n:top;"></td><td align=3D"left" style=3D"padding:0;vertical-align:top;"></t=
d></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"padding:0;ver=
tical-align:top;"></td><td align=3D"left" style=3D"padding:0;vertical-align=
:top;"></td></tr><tr style=3D"font-size:14.67px;"><td align=3D"left" style=
=3D"padding:0;vertical-align:top;font-size:0;"><img src=3D"cid:image800822.=
png@64955C58.58826176" width=3D"20" height=3D"20" border=3D"0" alt=3D"" sty=
le=3D"width:20px;min-width:20px;max-width:20px;height:20px;min-height:20px;=
max-height:20px;font-size:0;" /></td><td align=3D"left" style=3D"padding:0;=
vertical-align:top;font-family:Calibri,Arial,sans-serif;"><a href=3D"mailto=
:CEggers@arri.de" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decora=
tion:none;color:#858080;">CEggers@arri.de</a></td></tr></table></td></tr></=
table></td></tr></table></td></tr><tr style=3D"font-size:14.67px;color:#000=
001;font-style:normal;font-weight:400;white-space:nowrap;"><td align=3D"lef=
t" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;"><br /=
>&#8203;</td></tr></table></td></tr><tr style=3D"font-size:0;line-height:no=
rmal;"><td align=3D"left" style=3D"padding:0;vertical-align:top;"><a href=
=3D"https://www.arri.com/en/camera-systems/live-cameras/alexa-35-live" targ=
et=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:none;"><img src=
=3D"https://assets.arri.com/media/sign/20240410_ALEXA_35_Live_E-mail_Signat=
ure_650x95@2x.jpg" width=3D"650" height=3D"95" border=3D"0" title=3D"Alexa3=
5 live" alt=3D"Alexa35 live" style=3D"width:650px;min-width:650px;max-width=
:650px;height:95px;min-height:95px;max-height:95px;font-size:12px;" /></a><=
/td></tr><tr style=3D"font-size:14.67px;color:#000001;font-style:normal;fon=
t-weight:400;white-space:nowrap;"><td align=3D"left" style=3D"padding:0;ver=
tical-align:top;font-family:Calibri,Arial,sans-serif;"><br /></td></tr><tr =
style=3D"font-size:0;"><td align=3D"left" style=3D"padding:0;vertical-align=
:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"bor=
der-collapse:collapse;font-size:0;color:#6A6A6A;font-style:normal;font-weig=
ht:400;white-space:nowrap;"><tr style=3D"font-size:10px;"><td align=3D"left=
" style=3D"vertical-align:top;font-family:Arial;">Arnold&nbsp;&amp;&nbsp;Ri=
chter&nbsp;Cine&nbsp;Technik&nbsp;GmbH&nbsp;&amp;&nbsp;Co.&nbsp;Betriebs&nb=
sp;KG<br />Sitz:&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Registergericht:&nbs=
p;Amtsgericht&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Handelsregisternummer:&=
nbsp;HRA&nbsp;57918<br />Pers&#246;nlich&nbsp;haftender&nbsp;Gesellschafter=
:&nbsp;Arnold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&nbsp;Technik&nbsp;GmbH<br /=
>Sitz:&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Registergericht:&nbsp;Amtsgeri=
cht&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Handelsregisternummer:&nbsp;HRB&n=
bsp;54477<br />Gesch&#228;ftsf&#252;hrer:&nbsp;Dr.&nbsp;Matthias&nbsp;Erb&n=
bsp;(Chairman);&nbsp;Lars&nbsp;Weyer;&nbsp;Walter&nbsp;Trauninger<br /></td=
></tr><tr style=3D"font-size:14.67px;color:#000001;"><td align=3D"left" sty=
le=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;"><br />&#820=
3;<br /></td></tr></table></td></tr></table></td></tr></table></div></body>=
</html>
------_=_NextPart_ca6f5ab1-ddbc-4825-9f50-61220464ab21--

------_=_NextPart_0da86254-e0f9-4d1f-af79-8528753c402b
Content-Type: image/png;
	name="image838987.png"
Content-Transfer-Encoding: base64
Content-ID: <image838987.png@37BF62E6.99E6FC99>
Content-Description: image838987.png
Content-Disposition: inline;
	creation-date="Tue, 07 May 2024 13:13:08 +0000";
	filename=image838987.png;
	modification-date="Tue, 07 May 2024 13:13:08 +0000";
	size=528

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGlSURBVDhP1ZOxSgNBEIZ3o6QSSWGRwiJFCl9A
iCDEIqKFgo2FYGHjA1hYRZ0sGrURgq0WgkoqEUHQShJMYWFhmcLCwsIHsJBEs/5zmTvvJIE9sPGD
Zf7Zu/tvdndW/TVaogcRDSWVKlilMhvGVGQ6FoEhzAaTWt9AFji31q7C9Jh1HBISFSpbQPDMGK31
NlcsqTOBIRxmRPmkUTGJdubHUKmsxDA5ic6EDV8k+jRa1i6KdiYw/LL2QiTzDrNpY8yb5M4EhlvG
XKNdniXl9pkTHYvwkrlXDkTxIR3tEWUkcyZi2FbqBOGxm6lUR+tT7k/JnYgYYs8+sHfzkP7eTaJ1
LmGaktyjTDSGsSxphMjV89khyqGx7yG96rC3r7g5S5vGNHaJsrb7LI3RwPw6btQDv8f0NGRwTWYT
Wlch/eo+Mc5gPoWPfu9tpVgqrbGIHkoIVHOLQ5qAQVOmuNqVHma8guDK9jVkisY029aOQ/JhcYU9
wbLPRaoBiX2p1+utu1rtqpDPV9FKHVQziiqH5fETzMr40yHe68hcfPaJRnHyI5L+K5T6BsZ9gKi6
xb3hAAAAAElFTkSuQmCC

------_=_NextPart_0da86254-e0f9-4d1f-af79-8528753c402b
Content-Type: image/png;
	name="image800822.png"
Content-Transfer-Encoding: base64
Content-ID: <image800822.png@64955C58.58826176>
Content-Description: image800822.png
Content-Disposition: inline;
	creation-date="Tue, 07 May 2024 13:13:08 +0000";
	filename=image800822.png;
	modification-date="Tue, 07 May 2024 13:13:08 +0000";
	size=824

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALNSURBVDhPtZQ/SNVRFMfv1Z/S4PCGBoeg1Uih
oaFB8j1wMGgweBJBgUNRUQ2BQaH2e79SaKipwcGhlkioQEiooT++7RUOBkYODg0GgiIOLyi1bp/v
/d3fL8U31hfuO/ec3z3nfM895z7zr2GDbIg4jgutxvQ6Yw5IRy5uGzOfJMmKP9AADQMSaH+LtQ/5
WEaNUutfEHj5t3OXbyfJTDDl2BNwPI7LxtoJthFOD5A1WM0hf7QY04FDB98vohdZjzeduwbjOnuP
piA9QrBnMJjl4KHRJBmD3hJlF5HdW8Z8HU6SqeFKpeScu4BLmUoepd4pcoYqs9XaLwo2UqkMoEfo
YjrIysreNs6dI+kk515b516wf4ptgETPdSBnqDtDRFuUIJ1g0s/jOE3pJ7TQZ30AY9pg4tmyn8E2
AYE29mlmdVMNwInrSFbG4vgq5kvY7lHeLZ0ROFcj0SrbCFYfZNM9N1n7XveLOucZajQQCl6TTsYr
MFv66dyo1wNItoFQg4QF/dAwL0GnfnxAnP2cqZu6S3WSD1MEwLQbnFVpdcpdlM6ZNcSatfaw9Cyg
2Ml5G7bd3ubcJ8md0D2RTEzmU0uOPLEPyM8yIiLqEYIXZMtY7wTJhsI2K1tJ2hHtEPgs3QfcVPdS
HGP5UijhtGSGO3F8EuOw9pmzGNOkSbYbkHkjGxWkGK9UXsGqk7Hp4tBLTN3oU2RcQvahH0VO49DP
XgxF4iyr8Is5zJ6hZyg08TY5XCDY3WbnzgTnMnKEz5FeBgN/ijG5gW1fSKLh7tr5pnOGguaPUjXQ
93l6GhlddlsYl13gmfZzVTXNbTB5NAfp8a5a/Vjq6flO0JsM6yD3sspaf1utruu77qy3WDzeWyo9
4T6HKO8bPunsBuximIHs+kfRo1eThA1KrHM46/w8pV/nzyNrZo6GATNwBRqjPtgeRK2H7i6MJEk+
Nv8ZxvwBPgIhrepF7fMAAAAASUVORK5CYII=

------_=_NextPart_0da86254-e0f9-4d1f-af79-8528753c402b--

