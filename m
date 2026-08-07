Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210B3C5AC7C
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 10:35:24 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39971.1786098916759109745
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 03:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=DzZsBYNa;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=DzZsBYNa;
 spf=pass (domain: arm.com, ip: 52.101.83.14, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ykl0/3FRHR8qzysZhTrXH2QiNSQiQPx6xjnlFF7xxUQw0iNSZWtnGmd65xI8br7gBRNiYRqQR/YRcTUnYq1tvM9fAbYNznviTATuTxRxjFDmlI6EyF08/skyoEooKahhHurXB3CqdWecY6ztAmC8l/lUwjgDAQH52HNtLEIHKzZVlOt1lN9CVAEs9/r/6a9YSDk8tYz48suWvcPzf9ISFlU0ARqbpHIqcMrdaNSfT3MZmLPry2x4P7yM0Rwp+oBnenURnuFpjKTNox2mlsRT/IevURtCsS02ZMKb62icWFh1diUlJ1L6iBfTjCFFNSquTD9ZFPJp7djwblrCLsurDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6qXEZPZCtZCe8mVeEJUE8ERCv6rSje5mMuss1qdmWw=;
 b=SkAx3EA6TJOiZJ2S8rUKIG2Bd/VrL9Um2VDTbVxV+COoLW4WmbYU73bYXBSn1Ltu77qXtfldMRnlK1rFSeup+AlH8SpexMG4qVLgvYJP756NYmScKarQYweADljzgFX+z8UNgiRWUWOOwq1L4Tu7Btw4rjY0ubv1Cdey5b0iVF9qMQnzrXlv8JSxpGC0yssjjAYkWoAHCQfWedamATzKlAJowt3/GoIkXNisAxmvkhA4MY8UQ6HUkS0BGOYcwP1ipMYV+P1SdpmrQGjFvHUTRMiabtY9R2R2EbjlsJY9Bt8TioxXpVWb5enRQEoTdJ13ZzMpYj8TU4bczMnInUeA8w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6qXEZPZCtZCe8mVeEJUE8ERCv6rSje5mMuss1qdmWw=;
 b=DzZsBYNaC7TWoEYbB+fYdI/+Kqt8/GEb0GqnB3CuhweKWN1aJp/JOVwcKqRMv32GgXaAX9ZRvpkjkX/iXtkXcdUbEZn63bLFUlMBWHl2d3ZzJkvO+/lOWJ51ffo7dGWiuKnqdzlaY8+CduhG2CoQNY/vaTU9h6TyyaQ8S2b9uN0=
Received: from AS4P195CA0050.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::8)
 by DU0PR08MB9274.eurprd08.prod.outlook.com (2603:10a6:10:41a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 10:35:07 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:20b:65a:cafe::84) by AS4P195CA0050.outlook.office365.com
 (2603:10a6:20b:65a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.23 via Frontend Transport; Fri, 7
 Aug 2026 10:35:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Fri, 7 Aug 2026 10:35:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oa/XiYZ/mCqYWOiLyLkzSEYgrqzuoti2Sw+0rLBrs8u3yn2+C7V9QcmOJCRWItCvXUYJH3PzvuxTGcPMEsg9yH4Da7AR4NBt0teNVXVNtSw3buOFH5eOcVgQOsERuKYHDVeC2MlCaByNoZCph1xIuWAOaR2+brVlxac/Hov7rywhsuMGqCNZRbokp4TuSITLX9K0rH+jpub9oob+io4bJh9aa1KMd+v6JJjM44IC2MiyMZabzpFo07Rge6cs2NswhgzOFLbbR7VZmkfjhXJkDMuL2kll5t+v07V/9w4WG2Wt7eVRegVJwMwPjvw3jGBpTFs7HH4rqxTPfFEO0uLPug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6qXEZPZCtZCe8mVeEJUE8ERCv6rSje5mMuss1qdmWw=;
 b=BDaBuKUge/QeTanvMw2eYvyWhQdOKtLP20vXfkGpaUiP6QIHFTfTjWMAgnkORiXGq2dIImq3VKc/lUfgM0wV2fm0RN7G09oHUmDV1Gn8oiWL2m06Oqy9bZVaBT9uK1b11VwWYdDIYmadssnOWD6QugBSuHdLkbFOID7e1slmShypQfUpaO6TYii28mxCu9xDRn8/uIETLeK83J1H0jwcc0DU4m02mOi2v5Hj1UkT9PpQ4DEpmtW6ThqdL28b4TQBXq2vLPym8qwZkMZwqbrz5Z91StfUIjZVEJjeWYtie8/0mCXQNvUrtqI5EhXdUWoS2FxmvL4yps5O4972XIBtMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6qXEZPZCtZCe8mVeEJUE8ERCv6rSje5mMuss1qdmWw=;
 b=DzZsBYNaC7TWoEYbB+fYdI/+Kqt8/GEb0GqnB3CuhweKWN1aJp/JOVwcKqRMv32GgXaAX9ZRvpkjkX/iXtkXcdUbEZn63bLFUlMBWHl2d3ZzJkvO+/lOWJ51ffo7dGWiuKnqdzlaY8+CduhG2CoQNY/vaTU9h6TyyaQ8S2b9uN0=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PAWPR08MB11088.eurprd08.prod.outlook.com (2603:10a6:102:468::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 10:34:31 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 10:34:30 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] python3-numpy: remove HOSTTOOLS_DIR from
 __config__.py
Thread-Topic: [OE-core] [PATCH 2/3] python3-numpy: remove HOSTTOOLS_DIR from
 __config__.py
Thread-Index: AQHdJM6+5uq/DKY4wUG8mgNYri5HhLaSZwMA
Date: Fri, 7 Aug 2026 10:34:30 +0000
Message-ID: <01A5CA22-0F36-4DCE-8EA0-19D07F18E054@arm.com>
References: <20260805113634.79174-1-ross.burton@arm.com>
 <20260805113634.79174-2-ross.burton@arm.com>
In-Reply-To: <20260805113634.79174-2-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PAWPR08MB11088:EE_|AMS0EPF000001AB:EE_|DU0PR08MB9274:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d92d1d-092d-4a0b-e797-08def46f8c4e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 wQAgZHrcgxFBqWGy09Hq6GodwxE6rDWfwqwnUiGkaB30Ewiv8dhBwTtbmEASgwAoUo6R9+VsLlrTRCmROClG7VniPGvMPWMhgkNxQjOjFm5t0sW/bpcxTmgS1aHucplBUfxsGnpYglui0RNLCe2YIAn07wo5kXEwmbIp1v3mgfk3v8fp067D+vkJNoeoLByeMLEpIODjegzzTCtCXEEweTFwpOkXkw6rPUhMkrHg5qJY+onTL2izSMi/nCkk9nAFhuttp6/k4WPfa/Ywr9aHWe+PP4J2uFX4vijanpm8Arw6QS4mslLaFbTyUHx8c9tBb+YG3W5SATkL7rRptlqT+zdi5zn6bgFU58ViNIn9rXOS8BsEoxTFe4nJgxx1E8UnXk3rINuHJB+gQWBRa8YmAbMqyMGehR/APXYjAifkSUI77KgTBcKoL9Eglh0m8d8IZIWVi9jtF2+lcreL65MaW445GiSyQ0XkfGUwqym6v5FD7GE/G2QjuT7tpIIvlJc681UgJmFR/mQUonSm9sBWDABCmcNyPa32mkMwro/NWkLkPUNeY5J8hSnr+1eUDk4wdJ6lKHL8ufux1/zF9YofqLbUH5kp/vlJrOMA5ZwW6hJUU9Dm/oPyA+EDEHEGfULBH7yj5g4RsysWuU+OCBSojPEfbc5ObLlMoCS+DOSma2fgMipLBTTYzvSfdQn6oY+RdAdItrzJb6s4vwzZNSPNFKDdN4x9PTh1OMAC8RzoS4k=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <35BF568A6D0FBE479FABFB30E61B4DB6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 WWlmDVo27L5V8Qvud3XFkuOIzi4dkjzh6+kEBN/uhz1vAOPHZtGlHdtTGWOWFaPN/HzsL+IM6ChqUbDrtpGVDlaUjJsyIhqW/EFHVRrwungMlOxKpsZ5k+Koc6e1tTwJdugs6NttCUFqOPXOqK9HNp5WSb3RnVJ+Hc5qNT/GUectN65+7JHLtoyTJaeKqxm00hDzioduNAINgK2sz8DuELNUM2PRI1cgjRq7G4PdU7UYfmqwiiZJUJoC7ZdazSL4SWGU6d5Q/tELexjRL4LnKBk1tx2xZGGvfcyw+XcAQgUqGqMe0wNdyjMqQJBDexhsXYhX4D2mIwHebBz6wx8j0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11088
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	87d946a4-e61e-41f5-0ddb-08def46f76e4
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|1800799024|82310400026|376014|35042699022|36860700016|23010399003|18002099003|22082099003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	PduUoLRo/MmSG/BR7RtTdeJeqL0tI0V3WcqR1YWE5AeMIkoGYg5v+G1eKYFHID+y8HM0S+eL0JemPQqtnEYgtyKTJytba0E+ujefeQpQHW6P9mSwoJxzciQq+6kFj3LMFJjGoSAZboe7mLGR4bsC+hOiysm+YuI2tFN+T00cukE3YtLgkY4lVJSxpaNAgui3gCKM2+fHqF87stNImBmq+rFow7EbECgHjTAjsv3djLm2d/nDXthWC8quh8BVKOcG19nLusS90tqhr9cgYVCeezfvS4sPMs2XhEe44tAGas3eggr1g8gdEqhKeZ69NQLSWcxKilzytGzA34SvhJ6vh4tGAgUltyP+lSmpjVU4v/iTYb+Dn/lmcTvOyIcRXVAHwRrvU3Qru4G56p9DhEEfBv7YM+CH1JZPmdGXkWzEtQJrQJ6fEo9xzOjQffSyxC2ELDDzIkDmmz7H6HRH6MK9LMAbde6Z4rWoD1IMHAZBhIRrDOTDv7snTPA48JcRDKtBpH1qxNVqs8F9kT7+at/BKP4X7LDQaOn2zh4AogC2c0PntT2qMny5d81rkJcMYGGhx41K3XKk6YT4xoKdBrUgkL7lw17XLRziO/sJmUZN6YjWCAzzaTXcc6jGpPzSXhmR0Ejvm4MJuKJbJ2npG9kBl4MZv+N99CvT1xUffeAzW6rKH2rDb41RwqeaujanZR4WVuR77lOOofHx4r9Sy8bbFA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(82310400026)(376014)(35042699022)(36860700016)(23010399003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	y4QRW+AG51fpRMdWrB9xcgEYc8xy34+AIZBJIQtblKm4Lk1S/lgMxp2/9I1+C6mYVJ0T/paAm2L/nMQI+NnA+vqLZCHxW9uyOr8X2CV4QiM2lELhfWViVtI0jnRFUH1Cno9cXP6HTIzD8ZHjmJvkjkImHi2YQy0tJaS262SU9FaJfNTYNeuYusHLLezjvIlqIcwVQkjuKK7SnvEvK55+gDXHoYDvRSrKPNT+Sx+gB/xtE7EwtHn1n2VDP9dqfEIXelY8h++zQ+66D4JvDHLI+eZ4kwnbGuUyqtlVf6HWlL/lsiVbc8D1ESBGzg4TBBr5puwUxEPmc2YxPM9QeU9bN45cKoAANTxVz5rxT6qZYZnu+nARdnQ42ab3TN3p7d0fw365Z02M0ngQpubOrCpzZmv3K0DztgXbjlF3cyzwv9Vnwhj9CWxyVHmyYo/Yh40J
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 10:35:06.5408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d92d1d-092d-4a0b-e797-08def46f8c4e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9274
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 10:35:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243002

T24gNSBBdWcgMjAyNiwgYXQgMTI6MzYsIFJvc3MgQnVydG9uIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxyb3NzLmJ1cnRvbj1hcm0uY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3Rl
Og0KPiBBbHNvIHJlbW92ZSByZWR1bmRhbnQgZW50cmllczogdGhlcmUncyBubyBuZWVkIHRvIHJl
bW92ZSBib3RoDQo+ICR7UkVDSVBFX1NZU1JPT1R9PSBhbmQgJHtSRUNJUEVfU1lTUk9PVH0uDQoN
Ckp1c3QgcmVhbGlzZWQgdGhpcyBpc27igJl0IGRlbGV0aW5nIGxpbmVzIHNvIHRoZXJlIGlzIGEg
ZGlmZmVyZW5jZS4gdjIgaW5jb21pbmcuDQoNClJvc3M=

