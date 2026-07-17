Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A444C4451B
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 18:00:29 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2627.1784311225784015928
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 11:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZV0vbJey;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZV0vbJey;
 spf=pass (domain: arm.com, ip: 52.101.83.68, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mT5Q6aWM3oXe98gqAlQNZchi1tijl1vFWcFAK1DG4NQaNQOy+JKWly5aS91Ebe91bF4pIzwD0xwW97bzEOTfSzcRigCKUEIz8YTp8NANinLbxBKTae+pSIHWbuuippj+BfC1Q1Uq5KltENqc0QP3t3W/9h88VZ28aUtY8pI7ESrZ3jE1IPdhUsuH+6M+cVj95/FTQlnlON0j8Hm4U8w6xVhykCkFzsNmvxlLhkVSJJLUVLBDKJ9ITwq+c+IwYLrvF2JAtir8cczCQ6YAErYkN/2l926l/dXaDt+ljqvSxX5RwJo6qU6EXznPnSalyL2AWVzeQu6UFIxpIkF6EgTJSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RehAhyJFXlFi5OvBsq5WtKNX0H+PH00vDJgfB9XTR7k=;
 b=eluUIBXkHQ1unHAgFce1gZzkk6UVbmER1PsOLwXztCltILGhk47pxTIYMz+yXZtr4CAS7mGntMZoqiSU+joqqIuMOEANNLwm0qCVwbBfJI7tEWZZxYevFTlAcXbG/r5vbUNjlBF2gctmO+RRS9tlbsu1eaK2dmQrN7ySPbRgWHqh2euq7sQ61eg+0yRKSQmAPCYAuh0uMj5/U4kZQ+/0rDdJ7PiklHAjSeTQHkGtsnG2qh9+ttqnacpIsrtindrUJFQlaNfJO/+GREafx75bjyJgev3vjt3u85b7vCsx0jcBWNoY+V2cco32DcmslsegiEM03HzSs3t5jlUO/UIiSA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=ericsson.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RehAhyJFXlFi5OvBsq5WtKNX0H+PH00vDJgfB9XTR7k=;
 b=ZV0vbJey06/+J5ciuFKq2EfS0IWL/48fSVu9chMRShrGCRN3BLmDUTmptMFsUjFU3xrx5p9TvzX4mgd1XcILyfYvsUyXAI5/nnAdRISZW+J2KH5k5AowaWhxByzOkBJzaHwr9FhWRZwsJRfLNWuVbDxhsJsiqiETpZLtXp5EIMw=
Received: from DU7P250CA0003.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::30)
 by GV1PR08MB10455.eurprd08.prod.outlook.com (2603:10a6:150:16f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 18:00:18 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:54f:cafe::92) by DU7P250CA0003.outlook.office365.com
 (2603:10a6:10:54f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 18:00:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Fri, 17 Jul 2026 18:00:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqX0poAXtVGF2WAQKMX+nvoLzwizUsxs58e6YEBtRqHurCRTHMoN+vBdJKRlG/f4Pcw93pE7W9/7AeY5Jgo2R2QtEBBKWwLDxrUNfCWUPkSrrQGf15T1DSSBflCIpq7SdtjKkb601mUioKuYakJtcyxslY1Ar7cgA56Q4FaRSHHSVw5vjRllGr4bH1qC8xJHnmDui3mbMSnasb7PGNKu15nHizf2CDedLmvBWlYGaNx8VB6utlEXIh5cEVpD/I4W/NxHj/dHcrY+WSGiHkh6dYXCSqGQhEUNgb2T+r/yCStKi+MitTyi8EFIU2WOvwVuthqAPMGBzLhbMe2/pgVkyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RehAhyJFXlFi5OvBsq5WtKNX0H+PH00vDJgfB9XTR7k=;
 b=yqcOy4VrVrP+9DST/j7fw/aPUvFKbokDUbBuA9yJgQxm7W1GsC9NxSwkQUJr05Y01AQBbjg+dZUnDkj9KJJisDVYbSkFOGCBAR8f5bJ4gfV9mySTSoPfKHbP2VL8VTmZ+zbAYnJ28RfPoICeCPBS9TfrGB56PnyaSoLQ/LozQAoW38jWU2H/BAo5PwWHHKibFRNEmQkuKNvSrbYhZfb0iGnd93TpBm2/A9weuJRBN59UJOngNdGO7+rvEO4ZMbeMp5Zjocl9QrzX52Fpo+oJZKQnE2sewQSNHBp1Y8sFktjGHELPjg+d9akpnDiZgzBUuBZ7782jNleANPU3lRv40w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RehAhyJFXlFi5OvBsq5WtKNX0H+PH00vDJgfB9XTR7k=;
 b=ZV0vbJey06/+J5ciuFKq2EfS0IWL/48fSVu9chMRShrGCRN3BLmDUTmptMFsUjFU3xrx5p9TvzX4mgd1XcILyfYvsUyXAI5/nnAdRISZW+J2KH5k5AowaWhxByzOkBJzaHwr9FhWRZwsJRfLNWuVbDxhsJsiqiETpZLtXp5EIMw=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AS4PR08MB7685.eurprd08.prod.outlook.com (2603:10a6:20b:504::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 17:59:12 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0223.012; Fri, 17 Jul 2026
 17:59:12 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "daniel.turull@ericsson.com" <daniel.turull@ericsson.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH v4 2/2] systemd: add native hwdb generator via merged
 systemd-tools-native
Thread-Topic: [PATCH v4 2/2] systemd: add native hwdb generator via merged
 systemd-tools-native
Thread-Index: AQHdCr3dzdfXXcLP1kOA1HcPUJEy37ZyFmoA
Date: Fri, 17 Jul 2026 17:59:12 +0000
Message-ID: <791CE8D7-F761-490C-9922-4A71F96614DC@arm.com>
References: <20260703072948.2939128-1-daniel.turull@ericsson.com>
 <20260703072948.2939128-3-daniel.turull@ericsson.com>
In-Reply-To: <20260703072948.2939128-3-daniel.turull@ericsson.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AS4PR08MB7685:EE_|DB1PEPF000509FB:EE_|GV1PR08MB10455:EE_
X-MS-Office365-Filtering-Correlation-Id: f1b8a4cf-fe52-4940-5b93-08dee42d42a6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|38070700021|6133799003|4143699003|11063799006|56012099006|18002099003|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 
 +91cNWMIkWnNfIzIFZNv9Se6uCHEgp2oO+H26S0CXL2VQWRzSG3r+NZcQGmSZ+n1IJGlMYc+qHZIAxSHsxFgtBAbMVFGM8ixMldj3tNFLUwtzOofcXhTal6TE9B3ZelxwdfGQWSlqP/SEbiFTcfB/Jri3qxRDpMJzgaQL1k+IEkTqXB8sE5TarSaAuUEsHWCxZik9TbBovyNB49VBPhkuXnwgQDLzFseUa2A3fI0S5mqV8pO0F3/OnpUt4eO7Ja4ZXL3ontvkXYiTfA6cMvq8fLTAdMG/pjnBrIY8Sn3Ty9odlUfiQ3+i6s1XQdmovGOK6xnLR/HWb+XXEpIWG+WCeENAu3SYyFPDzMBzTGyxN2Xlhc2vG2UiguP1ehRbb2oxfmja1hL73TeIjmiYiZ3CcZznmzQzwVUcEIGOzUTOKgq7pVnfpjB6zLsHQG8LUESpsjK4PZJ4inj/q6b5I8Cfq1A/MJ6fBv8tLJPAMblqDIeYpAwC4IIl/2euaGM4eQK7rMBfx4i38Umpl8S9U2he+hOPf/z8vtj4Oi9k3eeg7p2HbqZWDNlE+0n4DkYBUyxocLB8tHjfVs6O8dMFDGv8QaaSX9PLlY7zgETl/22KHMbgz47iU/LQAbxmxoKdrfxDXu/RheQbSSh5t+OwSVEQawK9ghS2i45p6siOVzhceDmBT3tmci519PQSgI2gjRIPeGMi55Er5xIgex6IKJDonFAatNgatNvGsaGVZ/N3ic=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(38070700021)(6133799003)(4143699003)(11063799006)(56012099006)(18002099003)(3023799007)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <09BE4FCE52EF6E43B1D81CC7CD9ECED2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 hyGD7n8cQVhDTNfYctxjiSR3IbtjsvA3YeDjZF3Y+bXoe42fxjIW/GKOyXJtDV90gEwZqm+qa+rS+UpGCGb42TmvgMnIe1w7o5bEkzU8wQAF+hGpLQ97otV9lKsthTrUpaD7eWcE9WVMQOML8ItL9pvMGTnEPvWnFVIdNnMbJiRQhW6YtARovtaoWNHyo8BOTmr828C7a7YUzXC6W9vASlXhG2YAJCTVAo3n+rMAKPnFo9zyhOcKONiSygxOxzwGshledGphPSN8YeDP9Zx38uXxwraMJ3T26IY71O1fNOY7+mybgRdaNmQw/UAT3J/SZ8CMzuCziO0gEXZYQV/iHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7685
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	57c49100-2b6d-467a-c64c-08dee42d1bbc
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|14060799003|23010399003|36860700016|1800799024|35042699022|6133799003|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	im9k0zJA68X+OsT336QBBQygIZvb4BWhATt5Vql7jgobfQUX/Ukeah2VP2iZ+DPg+SREMJb2tXl8llGsdX3qfhzZkG/B7VTVFAxKin4/4Vp9gzmY0Gp1cDOb+HYnKL0FJlQwXPzLHVb44FBkH6gxUQVU5EFV0TaOaguBwbKr2ZYfSj6MD3NC+EvDTsatwRCOnEKro3SaQI06ULxTvf0r/zq+Glf1Qp/dD0zV90yUy7S5+PwcQ9BmWc4ooZBSfyC8QBxnGucVKKbW5ZeJRCP2/PDFybmjKfYukuq9SxO10dzfj1GyxETqUTUnSmFg6QdlNvA/DBNKlA9gGUiqRFjEgctmve0D/PhFbDVLYmm9mm2gWZMyitoSb5OYVrN0FKz870z6G2tNMf82dH8UjE2sGlX7xk44/6ev3PtzT6u3FKrSehim2/atqZKU8Fiulr6KlTaVAP8cqdP/IYzG0QEv9uU5sJUDGGj/Vb6Sk0NpEFOvuJdDMgLzyTcYAhYggKXBywnt4rwOJrXt89BpDJIzFnM/TgrXaN91n7yMJBjXBRHDDan1PfaUFEVFDFe9y1sO5yfFkuHwSudJrdWInRZnxJPp0eqmuutTGOLDKZ4qIp7sjVL/GmJbWPVXATqnssKUoQDTMiv12uXUO7+2L87JulzR7VqmHAJHTUyx8T9RwOvGwXqn431Wyg/5UFR55hA4AeOFhetgJCcQ5uOEUkk64A==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(14060799003)(23010399003)(36860700016)(1800799024)(35042699022)(6133799003)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	KoVOUuqEKL3kU0OfOzq9HuWqEEmBP9K8woMI0r52VX//6haZS4ZHZk0GIDxPpiD+18znjGnJ9AASFa+qBvqEufvq1uDVIA1KRVsH8iPY93HOula1LKJzPnb4D36Gd8KHiSLmbxkxsyIbA7jAh42L7+FCbgnYXSfwAVsyLEWQCFtGLUFoIaaqycm4AOcLYeuxu2zRIpkysZ1zGQLK6nxs2/Vretht54294YgpELFfI+u0vvisuwxAFb1vTid4jnzQ8YP2T1ARrOMDJiQHP9UMv6GxlSZHglODJW2ng+CHak9WmEdkrfmtCRBT9YfecYiOu4k0wLmCV6Dkqe2ydwLkRfXwIShWvt6nSjHVA4B9MUb1J5oVbbZez6E9Hm9J+/f+sjOBKtld2YrEpXcn5Yr3wgGedPkWLf19sFmb78aA05pmXsccslcEJvEW14uHu4rT
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 18:00:17.5072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b8a4cf-fe52-4940-5b93-08dee42d42a6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10455
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 18:00:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241220

SGkgRGFuaWVsLA0KDQo+IE9uIDMgSnVsIDIwMjYsIGF0IDA4OjI5LCBkYW5pZWwudHVydWxsQGVy
aWNzc29uLmNvbSB3cm90ZToNCj4gDQo+IEJ1aWxkIHN5c3RlbWQtaHdkYiBuYXRpdmVseSBzbyBp
bWFnZSBjb25zdHJ1Y3Rpb24gbm8gbG9uZ2VyIGRlcGVuZHMgb24NCj4gUUVNVS1lbXVsYXRlZCB1
ZGV2YWRtIG9uIHN1Y2ggaG9zdHMsIHdpdGg6DQo+IC0gQSBwYXRjaCByZXN0b3JpbmcgL3Byb2Mv
c2VsZi9mZGluZm8gbW91bnQtSUQgZmFsbGJhY2sgZm9yIGtlcm5lbHMNCj4gIGxhY2tpbmcgU1RB
VFhfTU5UX0lEIChhcHBsaWVkIG9ubHkgdG8gdGhlIG5hdGl2ZSB0b29scyByZWNpcGUpDQo+IC0g
QSBwYXRjaCBmb3JjaW5nIGNvbXBhdCBtb2RlIGluIGh3ZGIgZ2VuZXJhdGlvbiB0byBhdm9pZCBl
bWJlZGRpbmcNCj4gIGJ1aWxkLWhvc3QgcGF0aHMgaW4gaHdkYi5iaW4gKHJlcHJvZHVjaWJpbGl0
eSkNCj4gDQo+IFVwZGF0ZSB0aGUgdXBkYXRlX3VkZXZfaHdkYiBpbnRlcmNlcHQgdG8gcHJlZmVy
IHRoZSBuYXRpdmUNCj4gc3lzdGVtZC1od2RiIG92ZXIgUUVNVSBlbXVsYXRpb24sIHdpdGggYSB0
ZXN0IC1zIGNoZWNrIHRvIGNhdGNoDQo+IHNpbGVudCBmYWlsdXJlcyBmcm9tIGVpdGhlciBwYXRo
Lg0KDQpTdGFyaW5nIGF0IHRoZXNlIHBhdGNoZXMgbWFkZSBtZSBoYXZlIHRob3VnaHRzIGFuZCBp
ZGVhcywgSeKAmXZlIGp1c3Qgc2VudCBzb21lIHBhdGNoZXMgdGhhdCBkbyBzb21lIGNsZWFudXBz
IHRvIHRoZSBzeXN0ZW1jdGwgY29kZSAoYW5kIGNvbmZsaWN0IHdpdGggeW91ciBzZXJpZXMpIHRo
YXQgYWxzbyB0aGVuIHJlbmFtZXMgc3lzdGVtZC1zeXN0ZW1jdGwtbmF0aXZlIHRvIC10b29scy0s
IHNvIHRoYXQgdGhlIHVwZ3JhZGUgd29yayBpcyB0aWRpZXIgYXMgaXQgZG9lc27igJl0IGFsc28g
bmVlZCB0byByZW5hbWUgbG90cyBvZiB0aGluZ3MuICBUaGlzIG1ha2VzIHBhdGNoZXMgZWFzaWVy
IHRvIHJldmlldy9yZXZlcnQvYmFja3BvcnQvZXRjLg0KDQpUaGVuIHNvbWUgcmVzZWFyY2ggcmV2
ZWFsZWQgdGhhdCB3ZSBkb27igJl0IG5lZWQgdG8gcnVuIHVwZGF0ZS1od2RiIGluIGEgcWVtdSBh
dCBhbGwsIHdlIHdlcmUgbGlrZWx5IGRvaW5nIHRoYXQgb3JpZ2luYWxseSBiZWNhdXNlIHdlIGRp
ZG7igJl0IGhhdmUgYSBuYXRpdmUgcmVjaXBlIGFuZCB0aGUgZ2VuZXJhdGVkIGZpbGUgaGFzIGV4
cGxpY2l0IGJ5dGVzaXplL3dvcmQgb3JkZXI6IHRoZSBmaWxlcyBnZW5lcmF0ZWQgYnkgcHBjMzIg
dnMgYWFyY2g2NCBpbiBxZW11IGFyZSBpZGVudGljYWwsIHNvIHdlIGNhbiBqdXN0IGRlbGV0ZSB0
aGUgcWVtdSBjb2RlcGF0aHMgZW50aXJlbHkuDQoNClRoaXMgZGlkIGludm9sdmUgZGlzY292ZXJp
bmcgdGhhdCB0aGVyZeKAmXMgYSBidWcgaW4gcHNldWRvIGFuZCB3cml0aW5nIGFuIHVwc3RyZWFt
YWJsZSBwYXRjaCBmb3Igc3lzdGVtZC1od2RiIHRvIHN0cmlwIGJ1aWxkIHBhdGhzLCBidXQgSSB0
aGluayB3ZeKAmXJlIGdldHRpbmcgdGhlcmUuICBUaGUgbGFzdCBiaXQgb2YgdGhlIHNlcmllcyBu
ZWVkcyBhIGJpdCBtb3JlIGxvdmUsIGJ1dCBJ4oCZbGwgYmUgc2VuZGluZyB0aGF0IG9uIE1vbmRh
eS4NCg0KVGhlbiB3ZSBjYW4gcmViYXNlIHRoZSAyNjEgdXBncmFkZSwgd2hpY2ggc2hvdWxkIGJl
IGEgbG90IHNtYWxsZXIhDQoNClJvc3M=

