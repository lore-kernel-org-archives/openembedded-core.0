Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 859B5D5E394
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 14:49:36 +0000 (UTC)
Received: from ZRZP278CU001.outbound.protection.outlook.com (ZRZP278CU001.outbound.protection.outlook.com [40.107.167.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24217.1765896503785284058
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 06:48:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@duagon.com header.s=selector1 header.b=pzAAyGaR;
 spf=pass (domain: duagon.com, ip: 40.107.167.130, mailfrom: samuele.favazza@duagon.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXamsVor7ckvgpKMdT7gPVzwp7golfMWS9t2dnmw7UpE3n9PoEv3oG7sH4EeKXBZOG3I3utq75+R3TfhF4l9yoU73F19Oi8R0KjY+uPy24GtcMHZ/pBgC5CS13DsyJlPWLDOMD2e3wNbQvs4C18mjt0YIKIDDPcIARvmyLJtvHHD2ENRlrB1midIvFq3Oo0qYt+rjkXDXNgFFrXHPUBj/RYmB/qrkWyf//wyt9deL8tsu9rRScN0nfWwnIEdA4uKL8m1p1IbGm8ZJkOXyoDGJRyNdui/JkvYHHkc/LGJR4equ5cp/ue8vAPpIIH/9ya3uxxEUe6GOVlZTzfelRyTKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJmdWl6Pl5dyXtavsuESw/2/bAezz7SDzE4clccYhuU=;
 b=VuMjL6zLRMEih9oSOOzjiMsuiZxi89Qb2kmPFM5EYBk9jQBqPt/o0dYIUqDOo6ks1Q6kKBSGl/eL5AT64kDdAMw+mYdtwVoaHxl84jozMHOGPIuVxRewKooYktaVK7OMWXoSZKpUvvMIUezKO3wl6wwvWCd1AnPMl4OTTnvro1NPxC9IXbHDVdGV3FzwDED0vV0fPHv3IruuJq90WMalyLyFaQ5edyTHWVbMXRsIMrpzx69s7U/G1WDJ2phoQmv9Pw9Sd1vOkdT8Wl0UgCR/5moBzlRbvuvGD5IriC5cuz6BkPf36dGXjVpPKBOhGgPBfrWavmQdGYgFx16GwRopxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.85.1) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=duagon.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=duagon.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJmdWl6Pl5dyXtavsuESw/2/bAezz7SDzE4clccYhuU=;
 b=pzAAyGaRynpCBQyjG4HeOmail7QvmozoGIpwJO4ZNeH/grz3gWlsBHtkI6MnI04JwqpoKMRbFUVSRNgUw+v/f+8Gj4p47snqGjRvpTPPmNpdHar6C351P4w0k5oYPJlmRjBugosDRkwdj7nX6RPwzSXyT7MMNUwJTt2YQdUCU+8=
Received: from DUZPR01CA0063.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::13) by ZRAP278MB0078.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:11::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 14:33:39 +0000
Received: from DU2PEPF0001E9C1.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::48) by DUZPR01CA0063.outlook.office365.com
 (2603:10a6:10:3c2::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Tue,
 16 Dec 2025 14:33:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.85.1)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.85.1 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.85.1; helo=ZRAP278CU002.outbound.protection.outlook.com; pr=C
Received: from hz-deliver02.de.seppmail.cloud (2a01:4f8:272:5fe6::218) by
 DU2PEPF0001E9C1.mail.protection.outlook.com (2603:10a6:18:3::106) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 14:33:38 +0000
Received: from hz-glue02.de.seppmail.cloud (unknown [10.11.0.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver02.de.seppmail.cloud (Postfix) with ESMTPS id 4dVzv56nLNz11C1
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 15:33:37 +0100 (CET)
Received: from hz-glue02.de.seppmail.cloud (unknown [172.18.0.5])
	by hz-glue02.de.seppmail.cloud (Postfix) with SMTP id 4dVzv56bkjz1vdp
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 15:33:37 +0100 (CET)
X-SEPP-Suspect: d76514984cf04a9faf12aa773d534292
Received: from hz-scan02.de.seppmail.cloud (unknown [10.11.0.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue06.de.seppmail.cloud (Postfix) with ESMTPS id 4dVzv568kKz1wML
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 15:33:37 +0100 (CET)
Received: from hz-scan02 (localhost [127.0.0.1])
	by hz-scan02.de.seppmail.cloud (Postfix) with SMTP id 4dVzv55hXmz6FKv
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 15:33:37 +0100 (CET)
Received: from hz-m365gate02.de.seppmail.cloud (unknown [10.11.0.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan02.de.seppmail.cloud (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 15:33:37 +0100 (CET)
Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazlp17010001.outbound.protection.outlook.com [40.93.85.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate02.de.seppmail.cloud (Postfix) with ESMTPS id 4dVzv456dXz2wP9
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 15:33:36 +0100 (CET)
Received: from ZRAP278MB0431.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1f::5) by
 ZR0P278MB0974.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:57::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.13; Tue, 16 Dec 2025 14:33:31 +0000
Received: from ZRAP278MB0431.CHEP278.PROD.OUTLOOK.COM
 ([fe80::5328:973c:6702:14b5]) by ZRAP278MB0431.CHEP278.PROD.OUTLOOK.COM
 ([fe80::5328:973c:6702:14b5%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 14:33:31 +0000
From: "Favazza, Samuele" <Samuele.Favazza@duagon.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] run-postinsts: fix post-install-script output in log file
Thread-Topic: [PATCH] run-postinsts: fix post-install-script output in log
 file
Thread-Index: AQHcbphYjzdtVm606ECsrJr3UjoyoA==
Date: Tue, 16 Dec 2025 14:33:31 +0000
Message-ID: 
 <ZRAP278MB0431A7393E12FDD3A6EBF1DC9AAAA@ZRAP278MB0431.CHEP278.PROD.OUTLOOK.COM>
Accept-Language: en-US, en-CH
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-codetwo-clientsignature-inserted: true
x-codetwoprocessed: true
x-ms-traffictypediagnostic: 
 ZRAP278MB0431:EE_|ZR0P278MB0974:EE_|DU2PEPF0001E9C1:EE_|ZRAP278MB0078:EE_
X-MS-Office365-Filtering-Correlation-Id: 181c2b79-a239-4ccc-699e-08de3cb01a33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?iso-8859-1?Q?iQ2xEOVBBkkKoeU3ptxyalRT+MR/fO1Msiy3mK19bRiPlcXpmibmKJJrPg?=
 =?iso-8859-1?Q?QFvKIxzAJ5HtNGcpTUs9RsxUGhE7whs10a33pqHSzdcn5xkm4gKRJ8efww?=
 =?iso-8859-1?Q?nky2TB6OtEBI4eUQYOS869aTCIhnMLTi1nnvrSDY77ikw3DKYXrk7bA1cx?=
 =?iso-8859-1?Q?1ueJvaJ6JamvOBgN84JnvA4TBUcaAfh4p33GUEedgotR7KSFArMHgnJT0G?=
 =?iso-8859-1?Q?/eQQRYUwEcPyMTU3GblysTyI4eRmE35dYMCwjMc/ZkNywoo7GvaXDua0aB?=
 =?iso-8859-1?Q?ZVyKGh1rri9EYV8o9RWofQ61LajDpZeq8XJT8UrlHd65+xzGZTkwNLuIAx?=
 =?iso-8859-1?Q?iFhICIUnnPwdE8yx7064H5/jzuuNBiB3est0VGfO71p39yUg1m9CbbWXLK?=
 =?iso-8859-1?Q?qvW7zzy0JMUqQf+b33aO4SobM+0fOBofv7lPLSSS63J4dH+T5sTQUpTEVc?=
 =?iso-8859-1?Q?FwFF8UZ3OMcEXMm0lPduFSlx/KzDW/2I3X+4htFpp/GBDPyA2Xw6nx4MiW?=
 =?iso-8859-1?Q?T0cV86zwsoGMGye1ER6cR1pwsCcqaOOCpE8vsry/2+sme6DnV6rKXFiLw9?=
 =?iso-8859-1?Q?NnRxd4NddzqQEDQ0PCo+v+DezayPrW3s5VEGoP3qvuTJwt08F4Rjf9UrJq?=
 =?iso-8859-1?Q?7FykP2A3coKOtT6b8V+vyCIh9z85rWNzYRDxW+wO/ZB7zYSo83BexazCi8?=
 =?iso-8859-1?Q?0KWTZJEGtRfh/PAjBIlr8RJdQtM7BTg+gpIsp9J6A3NI2ExXf33V3Nc3r+?=
 =?iso-8859-1?Q?aFn21Mt+89NxzRl4j3fEs5pWB2U0Aw5IFbOO53DS1VwpbMK0lk+E5bDCM3?=
 =?iso-8859-1?Q?yFFMovUmaMIZzVIGvaP8aeAqSFyWJL+I1g/gAMBVA5icRfocItoVVdg0JT?=
 =?iso-8859-1?Q?oNW7fJVlJ3szmJYrfqNqkm5BVkGcf2jC1MyITyL0dUTYHYXRy/yfbi0/Q6?=
 =?iso-8859-1?Q?GChCJVDku8Golb1bugKO7otcZzT8WwPf0/PIJ7Z2K9OCHXX5Sy207lXAEQ?=
 =?iso-8859-1?Q?E7tb3NSM6bR3JsJvg090zH5j3gQIWzWTTT64CF8O1Uv4abyrE01Yneeoiy?=
 =?iso-8859-1?Q?kz+mixATAacZ9NXs5WnEE4GFHmKZ93PeVXYqnT5bokI01EV3SCd7U+mfmJ?=
 =?iso-8859-1?Q?lf7ygmrqZJpS7Ev3xm68p6g0jxXY+ye9OauM1lzkp6w+zB4Q7NVYn6A5Fk?=
 =?iso-8859-1?Q?WAsoscUVnxeZvrMZ3Y921UQv9uNZ/lBaO+fCyKz3C0AP0uGpgRGu5qNmLx?=
 =?iso-8859-1?Q?rYyJXnHbkIGLbZSeq9QZ0EZIObrHcEUdC2u2y+ybw50ux9VYkpteePpVEo?=
 =?iso-8859-1?Q?B/dai5wGMolKb5ZilWJv2C/qgo+HKo/y+d+QIwGK4IL3KlvAgwxpe7dzgC?=
 =?iso-8859-1?Q?4YkwwAedUYAYhWwfeDakL9AMR/t/RDOzLqHTcthOJ6gIF4yCD8eqlGAVBr?=
 =?iso-8859-1?Q?QVe9Ph8JKBpnFWH9CnVHSWXkJKdGXKBLOarCp569JgRetNx/zgdIargz0h?=
 =?iso-8859-1?Q?h8kyRfnPYMcMa+VhkByFL9+CwAOkPbYsiWqsv5vJgQknJFU2mt3XL3GdkK?=
 =?iso-8859-1?Q?PUlZr5hML36g9Cq9ReV8GSSEfGFW?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0431.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0974
X-SEPP-CCCVersion: 2025-12-11T08:12:51+01:00 9ed91da2
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[40.93.85.1];domain=ZRAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender: 
 ip=[40.93.85.1];domain=ZRAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
 302fa712-0aa4-431a-3f2e-08de3cb015f1
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam: 
 BCL:0;ARA:13230040|82310400026|35042699022|36860700013|1800799024|376014|10070799003|14060799003;
X-Microsoft-Antispam-Message-Info: 
 =?iso-8859-1?Q?RwCNsLgghwNppGjIYD5Zk0rlavUx3ivp0GvVeYEiw4qlqEuIiTJyibmJPT?=
 =?iso-8859-1?Q?m5JYhz01cDJdu2ThdRHuh/M1G/POcINvotJ6PiuSLYHdqnj8m3Q/8ga/J5?=
 =?iso-8859-1?Q?4lvkspDcEkdu311srtMz7BiX+AX/Xb8ztOjog+71Woe+q7IC/XF44dUPXh?=
 =?iso-8859-1?Q?lzgl7VMEOFk2JxftMq8PW8ggEf/tfGsMILohdLttc3YfSF1xsG4Ed7rQPD?=
 =?iso-8859-1?Q?6u8Lb/BWfFA/s8pcj/vhsKJGCi0nGDOBOt5rfMxn1/KZAxbGhJcASfvS4G?=
 =?iso-8859-1?Q?Tu76HQr+6XuGR0idh8p4ajgCmUiW7LG/IyUlmugmrvgeR44uH5mm08ltSC?=
 =?iso-8859-1?Q?i6kq0UV9SwxY3HrVaWtLjWgHiFcZklKWfXYtHriYLWsIAQ/MO14VWK7bo3?=
 =?iso-8859-1?Q?MzYyv6ju7BiGR0JAzmAa48yLDy72dF+/bs2lb7Mx52o4aTEGQjWVD4QRxi?=
 =?iso-8859-1?Q?r3FaOoPhElikQ7lJjU/O7k7KSFr5dSzXyJJ+qYtduZAVhJDu67lmDRXWMi?=
 =?iso-8859-1?Q?SnabMCjL3rzLEBF647r8JuMD2+fCuexRD0tgn0uOI7fhQNpuwwNxRXNKnE?=
 =?iso-8859-1?Q?7bOsHkX4OzWL32FeipK6AbahRV//9TdKzDaKy3S7dKdsu8b4AI5fNjE/6U?=
 =?iso-8859-1?Q?1XLzw1KCfK8AfBL8pZmtTfaCuruDtwKRgRhF/8U+H2FoTw8D+qvJ3IYvfj?=
 =?iso-8859-1?Q?I5TjBXHBnHX1cj3luZ+YGlj+1BfQHJYm1BCHZq2wf21i3x5kUax3ALtxP6?=
 =?iso-8859-1?Q?0s4X0YSa9c4sLBh60H4x6gNNdgmBDcuX0Ydo0zYqgX/drodQUAdhykK/ge?=
 =?iso-8859-1?Q?h7lWwHUhB4C+GJxc9yipWZsHNzeZKwRPEyoPiiNq4csOMuKcxnsV41bTPn?=
 =?iso-8859-1?Q?d5m084s9fZNrFqIsW0LuaQmdhwD7Hp5BSR1s9JQ/U1HI9jh6/gDujfwkIk?=
 =?iso-8859-1?Q?B8yEHDMwtXv9VnWtT6CFzFNPz3zjcpm8oZ/vH5K6xa26K2qRGGKMuH80Kj?=
 =?iso-8859-1?Q?XZc/hzjPySjcbQaND0yQY9juDALFBCoydYAk8DPrU84qbk2iM2hNcdYe/M?=
 =?iso-8859-1?Q?pGVAKW4McwGROMHrEwqmFBDx3OX5tjXuP8lCEdlPbDxhrFw2Bi3Kre7Gtt?=
 =?iso-8859-1?Q?6MGrj2io6ydPpfWPs/AvbVANkl4NG7t2jZ0Ro/OfAYdStIZzQh?=
X-Forefront-Antispam-Report: 
 CIP:2a01:4f8:272:5fe6::218;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278CU002.outbound.protection.outlook.com;PTR:mail-switzerlandnorthazlp17010001.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(36860700013)(1800799024)(376014)(10070799003)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 14:33:38.3364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 181c2b79-a239-4ccc-699e-08de3cb01a33
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[2a01:4f8:272:5fe6::218];Helo=[hz-deliver02.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource: 
 DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0078
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 14:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227964

When the POSTINST_LOGGING is enabled the output of the post-install=0A=
script is not stored in the 'postinstall.log' file. This probably=0A=
happened since commit 706410c847ac9c89317d098de5d5c580736edbbb.=0A=
=0A=
Fix the post-install script execution statement to honor the=0A=
stdout/stderr redirection to the 'postinstall.log' file.=0A=
=0A=
Signed-off-by: Samuele Favazza <samuele.favazza@duagon.com>=0A=
---=0A=
 meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts | 2 +-=0A=
 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinst=
s b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts=0A=
index b7352aa24d..e8c31e04ce 100755=0A=
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts=0A=
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts=0A=
@@ -67,7 +67,7 @@ exec_postinst_scriptlets() {=0A=
    echo "Running postinst $i..."=0A=
    [ "$POSTINST_LOGGING" =3D "1" ] && eval echo "Running postinst $i..." $=
append_log=0A=
    if [ -x "$i" ]; then=0A=
-     (sh -c "$i" $append_log)=0A=
+     (sh -c "$i $append_log")=0A=
      status=3D$?=0A=
      if [ $status -ne 0 ]; then=0A=
        echo "ERROR: postinst $i failed with exit code $status."=

