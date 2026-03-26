Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE2310A3D9E
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 12:51:36 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46593.1774529486028600290
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 05:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NpXbTkzs;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NpXbTkzs;
 spf=pass (domain: arm.com, ip: 52.101.70.12, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qGi71UAqqiMpZAs1pT77MgiUkEWIffM2FSKCjkjr0fhiWbEL9dL+lsOagSWaFvkGBcJaAF7qVy7X/SkqVURZ9llZVyaRP7uN/sbpUVkbxiCdy1a2k85eQPj315cASKJqMTP0nMtt2j6GpURZBWYMsFVWk4pevc7J9yg15RiuHqmiwUdMeAovrE0BxXRBvT2jCUOdPK26qb8aNzSoAFO2PyqtRYBxlqfma+oT7XdwOonNW4z+aOELame2uEXz08ut6ALD1XmHu0KS8HUb0y6yJl+HolhDEuixI9Jd+pkUBygTNH6+uodei+dP8D1UCjMe/opACbDeulLYoKbJJZBm1A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRGZlPUNVM7Wt1WhHGbhkRvCTwIdTtxv/T2IyP2KDMY=;
 b=GIasMbIYmdBnZutnBijFtkfqgyj/JEb78bbfdtrrMH4E/ZV+/a3UqvPNKYfnIIU9eLkkk8bcy0p4b04HFciURb1wDFVRfZwc85F9OLQu3Ws2tHpHUOLHyEkl3f/83DKmeU/2jGCE9kLFywHUf0calhmJUWV1PVgXUIP10LJinozCyU9eLRpuYgvtbLg7FoeeE2dadeNolBEcy1qemsJkPdQv94BD7YoOIDz+iyjPYdNIPmbVdDYVw7JplUQyDZ0rcaljPqhLw5FV6QofBvHO+lGSEisvxFOpX3anjAJ41k2H9xDS0E1DlzYjkVPujM+IpyZURuqH9X1v3L9PxbbStA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=navimatix.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mRGZlPUNVM7Wt1WhHGbhkRvCTwIdTtxv/T2IyP2KDMY=;
 b=NpXbTkzspF78dadMkQunptrUm1IRjexIAhUTN4To78Dq0gzubCpvrRq4jlTP6c7uzmNgrONqMaXhiu0UjKL4Gqe9MDTHOWcMq/Z+CvHdwwVcKERxaeezUs/dOeSz2DRJ+uAMvBkn1ZXKoKTZQ5v6oNpzbaWpUEBtoOwNg8zX84g=
Received: from DB9PR06CA0024.eurprd06.prod.outlook.com (2603:10a6:10:1db::29)
 by VI0PR08MB11134.eurprd08.prod.outlook.com (2603:10a6:800:250::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 12:51:20 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::dc) by DB9PR06CA0024.outlook.office365.com
 (2603:10a6:10:1db::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Thu,
 26 Mar 2026 12:51:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21 via
 Frontend Transport; Thu, 26 Mar 2026 12:51:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxyGKPWSJ1ySZzNsAh2FK6s+8Sd8EoxC95hOSHZPU6qIv8Nf+WxAWnzq+vn3z0qPfZUZgTDmGoTXUwKP2JVoWh7BCayaJYapy2dQjNzJ+Pl577O6gSxe0hcmtk684QMSLBtCfWj19+GQEqnHCdftuwuc+NGFfLFz5Ux9d0DB//r+4HWDVnm9t+2posMwZn3Ar10Cud7ysGxwGR497b4WXOmhloUmU7lUcOJY7+Dr1MGKqTuYZiuAHTQmfWyQHhq2w5eWZSDv/uuyKMEtfqjMf7ORghdwZWi8LnSgH8MWU68qCtTB8ZWNegEVCR7D2WLmAN8WQnTgvDNeYlhJgttjXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRGZlPUNVM7Wt1WhHGbhkRvCTwIdTtxv/T2IyP2KDMY=;
 b=B13RQf63J9HlvzKT85kBmZcfBygsXj/8XvKDvX3lOL1LUHwOFzWorjLWQTpfqlKO/APCUBp/H6FlHQnbgJXOtz7Ym6ZiLmKs/uQQf7AfDHtT43/TWr2y2RNpz/REdG/hIDiDEhQmK2v1GIrm9SI4k/L7KEViuKIv4Lb0Gz2lnWhgBj8GbRabxZO/S+TGquc2/Q1r950gzVbALfvvum/cMsti8zLKNaEfXizCLnjuhXRa9WuwWKwoP4E9vkG8zWrDEC1nojXNN32KRQilHysCWRmZRogk6Vv+0xZwdLhM/sCo/OOGQ0/bzXHJM5S63w78AjIqjLzzG/oxrrYpwBYabw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mRGZlPUNVM7Wt1WhHGbhkRvCTwIdTtxv/T2IyP2KDMY=;
 b=NpXbTkzspF78dadMkQunptrUm1IRjexIAhUTN4To78Dq0gzubCpvrRq4jlTP6c7uzmNgrONqMaXhiu0UjKL4Gqe9MDTHOWcMq/Z+CvHdwwVcKERxaeezUs/dOeSz2DRJ+uAMvBkn1ZXKoKTZQ5v6oNpzbaWpUEBtoOwNg8zX84g=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7613.eurprd08.prod.outlook.com (2603:10a6:10:311::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Thu, 26 Mar
 2026 12:50:16 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 12:50:16 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?SsO2cmcgU29tbWVy?= <joerg.sommer@navimatix.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] icu: Skip buildpaths QA check, if TMPDIR is
 /build/tmp
Thread-Topic: [OE-core] [PATCH] icu: Skip buildpaths QA check, if TMPDIR is
 /build/tmp
Thread-Index: AQHctrA8CQluyikYkkSvC4peuppHXbW/N++AgAB/g9CAARlRAA==
Date: Thu, 26 Mar 2026 12:50:16 +0000
Message-ID: <3AEC70CD-51C9-41EB-9E7B-1619C424A1B7@arm.com>
References: 
 <dddfc185f8b0627d2851b95fe37b697d6453e7c0.1773822079.git.joerg.sommer@navimatix.de>
 <EC36900E-3010-4C11-B633-2850D42C60ED@arm.com>
 <18A0260B1ECE6409.55659@lists.openembedded.org>
 <acQ-FrzTYxhakf0Q@navimatix.de>
In-Reply-To: <acQ-FrzTYxhakf0Q@navimatix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7613:EE_|DU6PEPF00009524:EE_|VI0PR08MB11134:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a9e79e5-2c61-4457-d500-08de8b366095
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: 
 42HpPtnhqGM1fpYRMKPjSV4/292ojqDQNjBt3hwVtnAikDv/qL8XQJ6ZH4uz9gIPuxLyb/9E6Py/39t19poDg/+UyRDbHEd3o+iELCLGFAfgVJ+V8eLfh2GWjDcr0nSldhTjnc7WZkTK/W899Ddx8vA+2EK8XNPXhFjohqhIibWx1UocBrF+oMj9CkMEhhWCU4baPABBx1cm3yC1mU3wCIhS+QitpztWjBYU91+uMAVVMknvcPwq3O+cWA7S/nwpgut70iCYeYFiGMLErPXdAHBEvF6K45L+6d6QW3BE5XqwKa4rv87qMlhZcqCeduwTkuRjHWLIQw1wQLxfZWd+WaLJZ1bhXNBXKYopraKlwMi335w3xOdelFMEd/pJRuLPgI0CfVWaLSzwDdOoxdFKZSRKp6R0yIzBIQtSNrTuOUOOfhcD/MzYZasWkjVMhXKh9+4taGdnwfDdkPlbQOgn9xgvwWP+6BWI+9Su+g3zm0Poa0N++DeWxmm8bvg4vKdamYt+IAqQm088nGt63QVjtLftQRK2CjieqqgXO5xODX7EVsKgHN4DNorRNWbnmMncWggSj7EnC4/7zDnWrB/OmdNyugBrAstdSYyRQQfIqiWo4d1qvXfP90LTHQyL1G13Ag+VF6ptn1uJb7UblkTCafOYSvbnfqICBcw1bmqdQIGk2pj0czGgaFkTGPhTu8A7K2Rpu6DkjCtcbOcsJxZTAhvYfu0VMu17U4pzhR2ypty8bfgLddn6tl9ZdyfeMDcsxcPeGTv4dpgotI36SzliuJb1FcJTlbEr3Ps5Qh79uPU=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <64AE9A3CE3646B49A1E3B2EDC2ABAFD5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 s7S13gc0P6OZTUhRhrnB/Cg0J3H4UcRC+uHenNa+cHoNQJdklyZ1OnKvJCE8tsdCW0WmMcxFa0AeMfmdUNM4T0yOW/lCvZ144tc/lSzWO1BtazCfgUXwQTZs07CADy7BRuL3vZb9D9HTj8mBCf6VzY3Z8QBVep2fJ754CWLskCpLWs9KEQ7XxDlNu25T5ZpTsinAkiefblhlfKXpwke1i5LNsBou93ZNuw3ni12tspIrcr+6q+Myym3lx4wNTF0oZvoXOxBG0BPpPmfKY73ykONEI8Yx8KBTsRzkJhyUAsvlZFyhUQDBHnK7ozkaPtwzuPyTXEfkmYQNZn24tahRHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7613
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b754df45-0ce3-4c86-8f91-08de8b363ada
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|1800799024|14060799003|376014|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	qfdyS7z2C33nsU2I9ua+cnXR8lFz4I22Pe4uDGVdyPslMWZ4znwPniaoYdlaS+6rWcv5Trda3XbLYjQPoYpNcAXb803ZCMPZGG+3yOJpkcUKbIsqFf8WvYRq0HPrhtcWIlNChGyY2FVgn7hlEMZH2nF0mzGIoLXciLZ6kKMpIkYzc9JUSubAVvsawZRNuSM4hlyToROMn4UGudBW+78I91Pr1jDHJLy6m30LYZpsf1jvCiXvhEE8Pkx+E7fEbQQ5IT28jNG6X8U82yfN/Dmw4H+Tw75tQKfrbb8ahLyI9Tkyryj+Dsgay/p1cDG2LGPUP7dyHRTtYlNt1PZTe9/+BbE0TgA4ACf8BPqo4+3RPWz32Qj73fPv+Wy5A86hrG1n30GlITEDEfWHAjndVIVBafwTzEBkz/mV/ImBVnMBnG7U8n6LeSIABwWxOj0gemsJi2yA+tksi7UmU+aP1wEOQM7MaImnZENLhFQrDl8miKDrS6GPFSqlSFCq93pNpKkrwDBD+tmjizg+QuhzR/yKiWzS8FDNPpfaMTFmY7DzZkM/e0sfha7aPJ32NsUPUzHpmmCrybh2GjpciaTEV8OMvSMzJ83zPdn3iilrfityw7tM8K7j5/YPunVKZ/6TK35JbL6o+58LDll/748fdjZ5PbQatUh+xN640ARy/aCQLd97CRqZ5S28ZT0iYMspoOvrE0hSKMwUPkxVdPNnlzDPzdLvMTByXjYkWEFIzAWhgTaU6rdKR4iTPrVqMa4zQ+1M+v72h3BzV27uVYLw0Xco+g==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(1800799024)(14060799003)(376014)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	TA14ABgR1wNTpnDzu6s89t9R6ZdI7Vb+LCr9gboYXFySz0wPO04PDXcRQH4xPBKY17dPtPhBH5eioR32xvDpoqWUunSN/H83+Egh5xL8qNpjXsqFLTdjSAXOoxUs8o5t6oyzk4BfUfSfBbft1/kXrZYnmCIXccfCOsaTWuWtop2Vi138e9eZtGrzlscCj/nXkjaECqALtZWmZF4+wErCezGY6gJBDIrsrOGGwqFZbehdQWEKf55Fpg6HCFKSWphPi5gYuLe2kD7rFnCh916ygR/I5wNOPT6Re56dC0ZScI6QvhdUU4SV+MAZ6MS5v7CdnTDS/kDD7QFzAmeOeAc83xhD7/jKNfTE3H130ZAvBkeQIRLxS4tzxy6WGWUGadT7Lq9rxVYGObzr8H15PcoZdIleZUeDxE3os98Ho6PW2JycHVoPTdZla9e5Wv4UrQ1j
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 12:51:19.7624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9e79e5-2c61-4457-d500-08de8b366095
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11134
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 12:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233991

T24gMjUgTWFyIDIwMjYsIGF0IDIwOjAzLCBKw7ZyZyBTb21tZXIgPGpvZXJnLnNvbW1lckBuYXZp
bWF0aXguZGU+IHdyb3RlOg0KPiANCj4gSsO2cmcgU29tbWVyIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIHNjaHJpZWIgYW0gTWkgMjUuIE3DpHIsIDE4OjM0ICgrMDEwMCk6DQo+PiBSb3NzIEJ1
cnRvbiBzY2hyaWViIGFtIE1pIDI1LiBNw6RyLCAxMjoyNyAoKzAwMDApOg0KPj4+IE9uIDE4IE1h
ciAyMDI2LCBhdCAwODoyMSwgSsO2cmcgU29tbWVyIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
IDxqb2VyZy5zb21tZXI9bmF2aW1hdGl4LmRlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3Rl
Og0KPj4+PiArIyBUaGUgZmlsZSBzb3VyY2UvdGVzdC9jaW50bHRzdC91ZGF0YXRzdC5jIGNvbnRh
aW5zIHRoZSBzdHJpbmcgIi9idWlsZC90bXAvLi4iDQo+Pj4+ICtJTlNBTkVfU0tJUDoke1BOfS1z
cmMgKz0gIiR7QCdidWlsZHBhdGhzJyBpZiBkLmdldFZhcignVE1QRElSJykgPT0gJy9idWlsZC90
bXAnIGVsc2UgJ+KAmX3igJ0NCj4+PiANCj4+PiBUaGlzIElOU0FORV9TS0lQIGlzIHF1aXRlIHVn
bHnigKYNCj4+IA0KPj4gWWVzLCBJIGZ1bGx5IGFncmVlLg0KPj4gDQo+Pj4gQXMgdGhpcyBpcyBq
dXN0IHRlc3QgZGF0YSwgd291bGQgaXQgYmUgcG9zc2libGUgdG8gcGF0Y2ggaXQgdG8gc29tZXRo
aW5nDQo+Pj4gdGhhdCBpc27igJl0IGxpa2VseSB0byBiZSBhIGJ1aWxkIHBhdGggaW5zdGVhZD8g
KGFuZCBpZGVhbGx5LCB1cHN0cmVhbSB0aGF0DQo+Pj4gcGF0Y2gpDQo+PiANCj4+IEkgZG9uJ3Qg
a25vdy4gQnV0IGFzIGZhciBhcyBJIGNhbiBzZWUgdGhlIOKAnGJ1aWxk4oCdIHBhcnQgaXMgYWxz
byBoYXJkY29kZWQgaW4NCj4+IGN0ZXN0X2RhdGFPdXREaXJbMV0gYW5kIEkgZmVhciBpbiBtb3Jl
IHBsYWNlcy4gSSBkaWRuJ3QgdHJ5IGJ1dCBhIHNpbXBsZQ0KPj4gY2hhbmdlIG9mIHRoaXMgc3Ry
aW5nIG1pZ2h0IGJyZWFrIHRoZSB0ZXN0cywgb3IgbmVlZHMgY2hhbmdlcyBhbnl3aGVyZQ0KPj4g
ZWxzZS4NCj4gDQo+IEJlY2F1c2UgdGhlIGVycm9yIGlzDQo+IA0KPiBFUlJPUjogaWN1LTc4LjIt
cjAgZG9fcGFja2FnZV9xYTogUUEgSXNzdWU6IEZpbGUgL3Vzci9zcmMvZGVidWcvaWN1Lzc4LjIv
dGVzdC9jaW50bHRzdC91ZGF0YXRzdC5jIGluIHBhY2thZ2UgaWN1LXNyYyBjb250YWlucyByZWZl
cmVuY2UgdG8gVE1QRElSIFtidWlsZHBhdGhzXQ0KPiANCj4gd2UgY291bGQgcmV3cml0ZSB0aGUg
c3RyaW5nIHRvIGBzdHJsZW4oIi9idWlsZCIiL3RtcC8uLuKAnSkNCg0KWWVzLCB0aGF0IHdvdWxk
IHdvcmssIHdpdGhvdXQgY2hhbmdpbmcgdGhlIGFjdHVhbCBzdHJpbmcuDQoNClJvcw0KDQo=

