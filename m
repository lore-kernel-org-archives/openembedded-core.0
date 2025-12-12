Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769B1D4922B
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 13:49:55 +0000 (UTC)
Received: from GVAP278CU002.outbound.protection.outlook.com (GVAP278CU002.outbound.protection.outlook.com [52.101.188.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13023.1765547238976542119
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 05:47:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@duagon.com header.s=selector1 header.b=MhyPZ6q9;
 spf=pass (domain: duagon.com, ip: 52.101.188.80, mailfrom: bastian.germann@duagon.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XKxeRHLS4sLnR1Fm9ry0TJVOcAR5z13WrkVuT07GZ167AgFoKl5WKJS5i8qmxRkz08Y8yOTsuEdI9FhaEwHGiNcCgg3vh5u0lbEIwsHQLEyQ6Ye/9Imm+eUD/9HPLDx8VsjNt5eyfxs/z6TVtzTiCk4QkHGx0vEHWapPUzWp7RD4KWLHMM1KQyQeHj+sq6FhVJord1LxBki53vNgtVoIAy3eJNUiA7os6faQHgBhNcUB04xAutFk6dqQYuKiC0EJih2mrECUZVUluK27IkhbcT+EBMTs3VRl5HGTbXOerDLQnEXgmCVBbWlSQEgtSzjCarXzaDB4I+iLHXFMK5cs7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBLPuV5wkUhZrU356cYuC7zEsMRJ3Dxgq9ZsRtzUVkw=;
 b=lSQ6dfYHaES3H9+VmAUPNtw39IMMqxjwREKRiHXHwTukwyBPz8qTne3XIiLGZuRKLaIXR3+OCsT3qQjrH26yYmPOK1aDGF3+morsZ5Fca0hGwJbhwZwievOo9NvwalM9NIya9plGiojdTXA2lRjxHQC+rXn0Nz6RQQf76npZ0s66fOjecNuyRLmIhPAPBBVbS2cYIXjNqnCyWWi+uDl7Xehaz9CIw3xXSVTNUqYw1vhExJzk8LzdL0hYUILTqZbG+RvcMUdCeM1CaP9hCPPSbMMHgPOqCNmRqNMbc8NbhAIAJiAqIK/1paC9kwSLlhn2+4dkQGcD4e4kqNbEcKnJ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.86.6) smtp.rcpttodomain=gmail.com smtp.mailfrom=duagon.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=duagon.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBLPuV5wkUhZrU356cYuC7zEsMRJ3Dxgq9ZsRtzUVkw=;
 b=MhyPZ6q9nWGMmuwxKYpWF80Zs62N0Wj6g2+uR/nCNTOoMclwUPzq+E3GjCWaaITOqmXO1FyI2BO9p/SHZCZd6pdwigiN08Uc0oIxVehIJRKOIbsqC0yvYGhvhr/OEtpf6b+uaBVuviqe8QPOm9UhnbCbHwsWwqE6PIRDTzLDehM=
Received: from DUZPR01CA0034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::10) by ZR3P278MB1273.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:71::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 13:47:13 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::83) by DUZPR01CA0034.outlook.office365.com
 (2603:10a6:10:468::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.10 via Frontend Transport; Fri,
 12 Dec 2025 13:47:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.86.6)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.86.6 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.86.6; helo=GVAP278CU002.outbound.protection.outlook.com; pr=C
Received: from hz-deliver01.de.seppmail.cloud (2a01:4f8:a0:900b::219) by
 DB1PEPF000509EF.mail.protection.outlook.com (2603:10a6:18:3::629) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 12 Dec 2025 13:47:12 +0000
Received: from hz-glue03.de.seppmail.cloud (unknown [10.11.0.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver01.de.seppmail.cloud (Postfix) with ESMTPS id 4dSW3N1cVsz4wyG;
	Fri, 12 Dec 2025 14:47:12 +0100 (CET)
Received: from hz-glue03.de.seppmail.cloud (unknown [172.18.0.6])
	by hz-glue03.de.seppmail.cloud (Postfix) with SMTP id 4dSW3N1N5wz1xZv;
	Fri, 12 Dec 2025 14:47:12 +0100 (CET)
X-SEPP-Suspect: 5d08d76d1f9d4003b6f895c2136b35eb
Received: from hz-scan09.de.seppmail.cloud (unknown [10.11.0.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue03.de.seppmail.cloud (Postfix) with ESMTPS id 4dSW3N0vW0z1xZZ;
	Fri, 12 Dec 2025 14:47:12 +0100 (CET)
Received: from hz-scan09 (localhost [127.0.0.1])
	by hz-scan09.de.seppmail.cloud (Postfix) with SMTP id 4dSW3N0M6gz19B4;
	Fri, 12 Dec 2025 14:47:12 +0100 (CET)
Received: from hz-m365gate03.de.seppmail.cloud (unknown [10.11.0.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan09.de.seppmail.cloud (Postfix) with ESMTPS;
	Fri, 12 Dec 2025 14:47:10 +0100 (CET)
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazlp17010006.outbound.protection.outlook.com [40.93.86.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate03.de.seppmail.cloud (Postfix) with ESMTPS id 4dSW3J6gN5z1wJ8;
	Fri, 12 Dec 2025 14:47:08 +0100 (CET)
Received: from GV0P278MB0688.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:44::7) by
 ZR1P278MB1137.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.12; Fri, 12 Dec 2025 13:47:07 +0000
Received: from GV0P278MB0688.CHEP278.PROD.OUTLOOK.COM
 ([fe80::4ee4:c505:4a4d:6b1b]) by GV0P278MB0688.CHEP278.PROD.OUTLOOK.COM
 ([fe80::4ee4:c505:4a4d:6b1b%5]) with mapi id 15.20.9388.013; Fri, 12 Dec 2025
 13:47:07 +0000
From: "Germann, Bastian" <Bastian.Germann@duagon.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] run-postinsts: propagate exit state to run-postinsts.service
Thread-Topic: [PATCH] run-postinsts: propagate exit state to
 run-postinsts.service
Thread-Index: AQHca23ObLkmjxEWVUKP4ARNdYsbig==
Date: Fri, 12 Dec 2025 13:47:07 +0000
Message-ID: 
 <GV0P278MB0688BAE9BDECB0FBFF31582993AEA@GV0P278MB0688.CHEP278.PROD.OUTLOOK.COM>
References: 
 <GV0P278MB06880222F486E5880988044993A1A@GV0P278MB0688.CHEP278.PROD.OUTLOOK.COM>
 <CANNYZj95ZV1CTMFDTLPR_0WQf-7XW4ypo9ihdM0VTJr6ERwQqA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj95ZV1CTMFDTLPR_0WQf-7XW4ypo9ihdM0VTJr6ERwQqA@mail.gmail.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-codetwo-clientsignature-inserted: true
x-codetwoprocessed: true
x-ms-traffictypediagnostic: 
	GV0P278MB0688:EE_|ZR1P278MB1137:EE_|DB1PEPF000509EF:EE_|ZR3P278MB1273:EE_
X-MS-Office365-Filtering-Correlation-Id: de1de9c5-b201-4562-0d41-08de3984f448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?iso-8859-1?Q?gxe6BB0kMAmOibkdtIFOmqVFhIxk946EaCKPS91VC7/mNQkDAhNF1l4Mo3?=
 =?iso-8859-1?Q?3SWDVyK6kcC2VflBNmKhDvahx1IDsFYGoWEoZjebQF/drmwTCzchkpmTkZ?=
 =?iso-8859-1?Q?vg4bfez2lExYuLI/5hA3BbqbV9bHpttTsQ2tc3ktOCkKiCawZHnr0DpDEc?=
 =?iso-8859-1?Q?ZwO8oH6KimOpHbJ9mNSvPxcGKGYOxypM0xFFfwTkbwPYT2K6Hy2KBZzmV0?=
 =?iso-8859-1?Q?FCl4jZW9CHme+uWNgoC2o/acVBl+XNuGg2VXqaVb6lce3MFs7JIrLf6BTN?=
 =?iso-8859-1?Q?QDM3cQauf/+lgiT3MxjNklQGY4hyTtj8U5tmDHO33RJmW1YQuxle7Fg3rm?=
 =?iso-8859-1?Q?VwMtwI0QtMDnHn8z+0JQyWKvtOcHflCN5fbImQ8un24mu9mnohvifm/ZP0?=
 =?iso-8859-1?Q?oDfUUiqKvAtviPc9Tq7iVwkWbubYOT3SpT8ORwHggou7WyDA1rZ+Fge94e?=
 =?iso-8859-1?Q?v6HWEC5NA6JVScW0vBWf/Cti40ntZtqB+ZsPRlm8hSkPifs97KBKYm21cp?=
 =?iso-8859-1?Q?nxvDOTOArF5BU+KdZxbRIkhgE1mVIW1jcehRgqcu2uJXSxlosHwVNDM6wO?=
 =?iso-8859-1?Q?ic6t1DTqeW9aKjGPckNzDIjiBPHgVxLQ04Rkhq1fJ7ZhkVjsT64pbwWd+P?=
 =?iso-8859-1?Q?JtnKJpik76JYjwAGw8LdvOxQSTp0hAA0+5NdU5TpOff/jBL60jgAC9b2+u?=
 =?iso-8859-1?Q?yrQ92nhVmNDu8IK2jQiQsxwRRFfTqdpIqacJW5VVNSd0xfTLuCgLBbOuau?=
 =?iso-8859-1?Q?Bro0lBGlelbZS0gs4zRN5qsVJ1VjVmIVQAMOsiFCtlmhcdO8QQzzYCMj6E?=
 =?iso-8859-1?Q?W0860R4gwaF9fjHfrEvzQWU5dj8bnXC4eNG0HY2wJ8vqCFtzCvKdlTBnbh?=
 =?iso-8859-1?Q?W3mX1cwTvXNUt0JWgoYNbuQlWWgHDu8kHk2AlVSAVLzJuRHcZKILDd34pa?=
 =?iso-8859-1?Q?DPvtdZ+IyFmyiMg9SE1hZLPb05SwEKBuFQWf4u8lbOSJPS0sJ2+6wkVhm0?=
 =?iso-8859-1?Q?xQpW6f3wSzeuDzdnbrGbBGgS3ePj4BNCbHa7XTa9y4sJo7dXiIxhvFeHat?=
 =?iso-8859-1?Q?iXCylMosA3DUXgtP3jrsMAby2iJKMoczYmlrKw+6ok4CrK+s54QgzZJ8aO?=
 =?iso-8859-1?Q?pvVDDW87FaWVJLwvPtx8CtyOqPL8A0nnBj55sVIBgSCOvUfqAtWednjCea?=
 =?iso-8859-1?Q?0fe3Y4XAfD5AMcz7GGafAFTfA0EwuZNuUxHguhUYBvsMXxmVoI2a3VFDCg?=
 =?iso-8859-1?Q?DEc0L/EDBqUf3Xgm6KYrKvZ8fS25rirHVfIk411YcBXTDX++e1uEXmq/rI?=
 =?iso-8859-1?Q?wlTU8OTgde0Xij8F2guK4tC7cZ7ZfjGiueF3usX19C6jrHOJTOe02DWj7w?=
 =?iso-8859-1?Q?qVTPHxyC07NuhZmSQ4fqGmZ74bsKb3mZ7OcnXsUsyZ1QFooRPl0790UHY0?=
 =?iso-8859-1?Q?ZIesvXUNEvnUAsTXEWZtlSjoBKZLSP6sfLuGcWwl4EPjIIZHotd5v3JOEJ?=
 =?iso-8859-1?Q?g3L9IAGqD10kF27xur0DXSSxMSfhpDHKhdIXD+HGn7d6iqpr4HXqJqQZsH?=
 =?iso-8859-1?Q?aF+EEi41Xc5wJ7YD0f/cT/q+Z951?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0688.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1137
X-SEPP-CCCVersion: 2025-12-11T08:12:51+01:00 9ed91da2
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[40.93.86.6];domain=GVAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender: 
 ip=[40.93.86.6];domain=GVAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cf3a34c7-809b-4edd-8867-08de3984f0d6
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|10070799003|14060799003|1800799024|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?mH79DRvaadZBH83SLzCUiKn1FgN6Vx+wii3xgC3Uso9wOiOzXa9iAIXSdB?=
 =?iso-8859-1?Q?as9dT9Emy8ADhELCo/WGpfZ1XWdcpjPOLV2ks9okIK5MXnndSzJmamXfFt?=
 =?iso-8859-1?Q?V3QOQLSVGH+PaQ6TChVy+WoLzbMop00ue73oN65/7tvKDB7CNnhKCHfsKQ?=
 =?iso-8859-1?Q?qmLzQDsUIh5b/VxOENATWczU3ffIUSsJkGOX4AaGpX9JKRxpdzmRZXKmlT?=
 =?iso-8859-1?Q?N6GNr4+PMyZrL8zKeoGgIe0/qGs4aOS7QPikj+noa7/I5BfCFemTmJLSiM?=
 =?iso-8859-1?Q?WsQ/kwRGK3VVzFJbiaeeFGpMAi+j/TR06Vaa2+hCj9yRxrAYiLAum9NdC9?=
 =?iso-8859-1?Q?LM6gOQhWqJeo7qeDXvs1ITAendI8OWXxxuDHtgZT0AMLLC4pOi0CzuC9CM?=
 =?iso-8859-1?Q?QbnhwqMeA8aEQwOGhiK/ThtTc4DSJr5QDRnWWAPMQuL3J5y1w7GpI8N9dA?=
 =?iso-8859-1?Q?w0VvGREXUnPlEDDBLA0Fuh280dmxdUbvxwqg50PnC8AjAkaqcUDiWEEwn7?=
 =?iso-8859-1?Q?G734U+PT/PusWIpYqmXhla8UkGfxTJ0EbHc9awD7SGSeah8SFvVECxme5E?=
 =?iso-8859-1?Q?+LOCfUYuBW2kVw4FgEPRxbC8ClJJFSTNvZebP3MxionNW+bYP8lSha1FtK?=
 =?iso-8859-1?Q?06udOZT7T425FT64BUrwV4JYK02opJcWKlsqkX88eptZbIqQR9jrCn988s?=
 =?iso-8859-1?Q?hO1yNRjyDrKLju1e8uoYUhN4QcHPguIB5wPEej/3APCx4l48seVWXKcclV?=
 =?iso-8859-1?Q?xixdS5eobW735vYqBqePA154lBFK0Dhu7vQfgALPWKATArqPfK3/y30zDh?=
 =?iso-8859-1?Q?JWdMbfMeXbArSnB153u9pxpen/70AvbYCN6uazQ3r7FzromtvqNdG1ggUT?=
 =?iso-8859-1?Q?xaY9dT7B7u/6H7ZHOWq8RbppBijldwA8MIP8X1flascj8M4L7/vVicZ+Tz?=
 =?iso-8859-1?Q?9eTMqeRpkPcWOIhJ2pLemcXzjEkf2BwSZPJoFhFIdW9Pkzh18UJu8BTF4z?=
 =?iso-8859-1?Q?0rSdgjHyyIOx6Oy1LHclwe1HABeWziYW7gTesuKuiPcJSZ1ILmlTUpzhOa?=
 =?iso-8859-1?Q?zF5we0z0mWCHiCClgxLHSnlHJA1xaTlq64HM/jPSs0/cacTueBBP2RvkXx?=
 =?iso-8859-1?Q?3McgBqt+OD6m/BIXmO/7WzqVeL6MI66i5KezJ83azCuaZqbPUD?=
X-Forefront-Antispam-Report: 
	CIP:2a01:4f8:a0:900b::219;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVAP278CU002.outbound.protection.outlook.com;PTR:mail-switzerlandwestazlp17010006.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(10070799003)(14060799003)(1800799024)(35042699022)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 13:47:12.9022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de1de9c5-b201-4562-0d41-08de3984f448
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[2a01:4f8:a0:900b::219];Helo=[hz-deliver01.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR3P278MB1273
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 13:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227591

In case an exec_postinst_scriptlets child process fails during installation=
 we=0A=
want indication that the run-postinsts.service had a problem.=0A=
=0A=
We still try to install all scriptlets and only run remove_rcsd_link if all=
=0A=
postinst scripts ran without error. Otherwise on every following boot a new=
=0A=
install attempt of the missing scriptlet(s) is performed.=0A=
=0A=
Signed-off-by: Bastian Germann <Bastian.Germann@duagon.com>=0A=
---=0A=
 .../run-postinsts/run-postinsts/run-postinsts | 34 +++++++++++--------=0A=
 1 file changed, 20 insertions(+), 14 deletions(-)=0A=
=0A=
diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinst=
s b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts=0A=
index a94a769b59..b7352aa24d 100755=0A=
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts=0A=
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts=0A=
@@ -62,22 +62,29 @@ if [ "$POSTINST_LOGGING" =3D "1" ]; then=0A=
 fi=0A=
 =0A=
 exec_postinst_scriptlets() {=0A=
-	for i in `ls $pi_dir`; do=0A=
-		i=3D$pi_dir/$i=0A=
+	ret=3D0=0A=
+	for i in "$pi_dir"/*; do=0A=
 		echo "Running postinst $i..."=0A=
 		[ "$POSTINST_LOGGING" =3D "1" ] && eval echo "Running postinst $i..." $a=
ppend_log=0A=
-		if [ -x $i ]; then=0A=
-			(sh -c $i $append_log)=0A=
-			rm $i=0A=
+		if [ -x "$i" ]; then=0A=
+			(sh -c "$i" $append_log)=0A=
+			status=3D$?=0A=
+			if [ $status -ne 0 ]; then=0A=
+				echo "ERROR: postinst $i failed with exit code $status."=0A=
+				[ "$POSTINST_LOGGING" =3D "1" ] && eval echo "ERROR: postinst $i faile=
d with exit code $status." $append_log=0A=
+				ret=3D1=0A=
+			else=0A=
+				rm -f "$i"=0A=
+			fi=0A=
 		else=0A=
-			echo "ERROR: postinst $i failed."=0A=
-			[ "$POSTINST_LOGGING" =3D "1" ] && eval echo "ERROR: postinst $i failed=
." $append_log=0A=
-			remove_rcsd_link=3D0=0A=
+			echo "ERROR: postinst $i is not executable."=0A=
+			[ "$POSTINST_LOGGING" =3D "1" ] && eval echo "ERROR: postinst $i is not=
 executable." $append_log=0A=
+			ret=3D1=0A=
 		fi=0A=
 	done=0A=
+	return $ret=0A=
 }=0A=
 =0A=
-remove_rcsd_link=3D1=0A=
 if $pm_installed; then=0A=
 	case $pm in=0A=
 		"ipk")=0A=
@@ -96,10 +103,9 @@ if $pm_installed; then=0A=
 			;;=0A=
 	esac=0A=
 else=0A=
-	exec_postinst_scriptlets=0A=
-fi=0A=
-=0A=
-# since all postinstalls executed successfully, remove the rcS.d link=0A=
-if [ $remove_rcsd_link =3D 1 ]; then=0A=
+	if ! exec_postinst_scriptlets; then=0A=
+		exit 1=0A=
+	fi=0A=
+	# since all postinstalls executed successfully, remove the rcS.d link=0A=
 	remove_rcsd_link=0A=
 fi=

