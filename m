Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DC4C9830C
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 14:22:30 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8263.1790173346485956299
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 07:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=b8tW7bTM;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=b8tW7bTM;
 spf=pass (domain: arm.com, ip: 52.101.72.27, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZNsuoIrHNtaCpYMFYHiPo79x/W2ZPbsjEjp6hc78O/0MPE1fVXy+VmYBIr6yRqT324vG4gtL2QOkoRaUKgnE4jkBvkhAonRj0dGXPv7WydIwOvL3Jrx9/NZHQ82piiBJv5i8u0xH1lj3YZL/uwrc7qBOqUywh1X8xsWRa/g/Itt43Q+GalEl1OsVR3QDyJ7OTJ7ZbPch+jmOnb6JEgInp5e+TVQqAL/A03Va8ccPCSPwnac0HFAIu4Jta+LzM1tyqoLAarAhdEkqg713qbXCKznYFvC/Vzq1mcY4hOuJ2/zRM5f9sh7Li40vB9P4conVnkThj+s2iMIYSqD+YAjSyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSqmlfTk34SsbkgfH0P3U5hYVRp+sm6usrm+hJ4lnJY=;
 b=eg5fsBRKgInDmqZ9F6tRzJbiE5uwNTpOdDsm6NokNZjKnkYNb3xCwi4gHgDZAdckuQRTqYpmDnrHLeCAQwdDJpAVLWpwLUw01k8iNN4MGhPIcx9GFV9FLWCorrkWElaqjYr1jFQlwapp3SPcXn1yNgOZgVaF+NGMOWkSbO9D/GIuVdqEFGBg1HgCSYzkE/rtNxjgx6Z0c03Vk5M1s/DOhHu1JYTtNvuhZixxoTJU11Y20KHjMVkRwhjDesSfDGmUe34JY4g7M5ljWOe6NWDKoLbkGkf8UnKsnqpKkoe3HxhIsU2C7igOblvvpGbhySv0AcZyXNbvG7GDeJ/7LqNaKQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSqmlfTk34SsbkgfH0P3U5hYVRp+sm6usrm+hJ4lnJY=;
 b=b8tW7bTMxpctV3e21odqY1bnZMCL42ewDK5sjxe1VeHEHBSWr1zu5ljRzz/bn3LbyukN9ZYXKQD+r3IR4eEpkHVhfDBp451IXSHMXvmR9ZjKwY8NXZ0yJ+2m9RWg4BMBRbdw1DRPbsnKKMhDBXhj8ynrGb4caEmJFUgc6K189dA=
Received: from DUZPR01CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::20) by PAWPR08MB9518.eurprd08.prod.outlook.com
 (2603:10a6:102:2ed::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 14:22:17 +0000
Received: from DB1PEPF000509F1.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::7f) by DUZPR01CA0074.outlook.office365.com
 (2603:10a6:10:3c2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 14:22:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F1.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Wed, 23 Sep 2026 14:22:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EEjrX6RqYSSCQQO5XqotHqTGRC96xFSd6Z0rGgOlI1MBagMMm/ZQPUi1Pr74vz1JIvkFa+1m1xvpFkJKT1onbtqrtE06EVLuFAJCx3Iae0N8qDkYQ8aRzoInwUom87tzB5FKG7rdC32CN0Ug2rg1IwfdCsfx41F/JslllTE28C+lvZK0kWlxLDb/qurXQlcJatMTB9HETioEKSdo+5T83/uscwv9y164gPdY2grBOk132OJ0opeztsEupTxz3ysjeWxYymr7KWBqo8Dgv1cgHznOYMTfwubE01LvW3ZldPnE3p+s1xotEdkvMZWpWKMYyFOsBTp/eoEWCF2oLASi9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSqmlfTk34SsbkgfH0P3U5hYVRp+sm6usrm+hJ4lnJY=;
 b=ewLDNPPLqqZEmBvScA1qGBNSJHEbGQVmcFe5TsdOPvtGn7fmczZiIi2kih1cEAyPQ3znCgIXiSYaiQmsWKfgom1oneaz8JdKkUXkaTWe9OGWLzJzWEaSACOu9wAhEPU1rskxncMRdaayZwm5sO4bjtuTDOr1DKkS87cif5hkl0leoYxiWuS8nDJGjFEw1MtgmGMCVf64HZOxW6qS+mS4X/FUJQSPq52qn4vkN9n3LeNhyFVwUARfu1RMtmsZw6bhdnZ3W7nOdQWzRhn/ADTQkeIJUODSrynDZsydqdxRbqPS/1NHVYejQP6S7ua4xdprkc1Olux05XYT6Tut1DOgDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSqmlfTk34SsbkgfH0P3U5hYVRp+sm6usrm+hJ4lnJY=;
 b=b8tW7bTMxpctV3e21odqY1bnZMCL42ewDK5sjxe1VeHEHBSWr1zu5ljRzz/bn3LbyukN9ZYXKQD+r3IR4eEpkHVhfDBp451IXSHMXvmR9ZjKwY8NXZ0yJ+2m9RWg4BMBRbdw1DRPbsnKKMhDBXhj8ynrGb4caEmJFUgc6K189dA=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PAVPR08MB10337.eurprd08.prod.outlook.com (2603:10a6:102:30e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 14:21:45 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0451.012; Wed, 23 Sep 2026
 14:21:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "jaipaul.cheernam@est.tech" <jaipaul.cheernam@est.tech>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/2] gnomebase: fix gnome_verdir for
 four-component versions
Thread-Topic: [OE-core] [PATCH v2 1/2] gnomebase: fix gnome_verdir for
 four-component versions
Thread-Index: AQHdRusDxfNkMYpjl0qVIzcjYKjp/bbcOz4AgAAElwA=
Date: Wed, 23 Sep 2026 14:21:44 +0000
Message-ID: <A7D15C6E-0CAE-42BC-ACBB-1A64BD97E5D7@arm.com>
References: <20260917074956.22252-1-jaipaul.cheernam@est.tech>
 <20260917212435.93696-1-jaipaul.cheernam@est.tech>
 <20260917212435.93696-2-jaipaul.cheernam@est.tech>
 <E355EDBB-60D0-49E6-9F2A-3042130D2906@arm.com>
In-Reply-To: <E355EDBB-60D0-49E6-9F2A-3042130D2906@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PAVPR08MB10337:EE_|DB1PEPF000509F1:EE_|PAWPR08MB9518:EE_
X-MS-Office365-Filtering-Correlation-Id: 372fc323-62b3-43ef-9fb3-08df197e1245
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|38070700021|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 
 ODnaDZerDPPNmOlUS7cuAgywCZji5rWl76uIyHRBfITySjM2n2qs4U0Y4zb0RHgQdWF5YLELCTiuCX45j4vlkzQZolltC/zlI/gIcb5onkM9fQXCkYivIOhseNxwBVwgoYlbSLQPkfng7cDHxJ0UJoH1F3FTraAnj+LQqyf7uiI9jDvhfJuZQVzhmnC1X1TNi1MpMQfDnamHHT1NZqFpayeRzmxNIcAU3vZ6GZuZ3FX4Q8mXwLlFjhVZ3rzJ2CHExh91sDnjsje7SDmJxc5QI1pk4h3NlGZzoNBLOyIE5hCzxvdPjXoT1sy2bIRSmyUhv3yYsK1K3bX9ILvNHixk1Blfy1+zR0uUmwmVGEOXQbCTK0tREr3NN/V4ylPBi7h5xUPztO2zLsfbpWUdN392uGJ3NGUDPLkshEqBHvqjiQHgk6M4wQVmmqNbbsr64yQWplmKlzfOGf9+499gKsfZM+M/vzVmwlPy+mDpsh/cn1CxhjcmyjUxZ77MhB5XsIaoV8UmLHmR89Xe9Id5Qh1TrnxMk3KyMybuqzbrj2DQpn/1F7oiSU/m/Uerc995lg/v2TsGr02+0wolc4OU9LPeEj4TUmE+PaJljI80ubAchtz56f6/TLnAWI0kTAiI0jO5NtDP1KO+E/AMk5YeoLSkcDCCvSvdNGJ6ntHu+uBIBr9D2gilT3Fr1UU+sZtigMJVrscqOVrDaaxIa9LbOzrGR8AHgL+aVO7Bp7jom1vjxGI=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E635434573DD3244A45DC7D7C6FBDCF5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 bwRc6OwT4CKpdFLzaOvCjwxxm99S7t/PiUPd2r1ZsHLTxqq8ezGp70UBIl+KKeHOKeF2OJmLZqkHETqtnLplkuEtvnrx1HBKFrt+6QlI76D3iio8OubpuyHxn55Lw+wAKUJ7nh51gR/sNhX1Rf6cZpkzBdrJkSPwd0jP3DGim5Iq6PSh5HyvM1cBl0N/FIybB2pt1CQ6Lh68sf2u2XQ16Wv/ICmwofitKCB9c1T5SEDuN0YUO9EdM4T3doPAfbzjuOfsZT3AXh5FhHLHqTyMnudXPS8A2Fh2CjfuJ+NlG8IJFkbTH/dIHpmCIUWankiCGRATfQaAOqch3PzyCZR38Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB10337
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	096326b0-3a00-4fa8-7202-08df197dff00
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|36860700016|82310400026|35042699022|23010399003|376014|10067099003|56012099006|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	sYyb4EqWpmKrE2X12m0hFuLWF8ea2WBCrqqsIspCf6+pbFWOeU4J3johDTILrLhyjZ0PtnRVJT2RRYgO/au46LMosLIT9tVo2KNFFeHUyWu7K7xpFUZOI1/gOuaegJ2+mOaXZUOieBdpTbjtOvDbl0NjlEG5HZWcqhLVa6N2TI7iVq3PSbXGStBUS0m7l2UCywFUIvJvwMzX0q3ixNN8cjvHj22JqsLYIywRNsU5GwWz8C0OcR3l/SE1qSpfp0t6jfMFNGWZHnLOtrHj4CtSISENpioIevaPRYb5W/weDPmJhsnPs9X7B57X/dYHmGgJTQGeVkl3igu47jnQEwN2M30a6EDyA4IqGvEDrrbOq+TZf9igfTyDmGySphDGyBACWaqukyOsdj/bpJfqZz7/EiRTAkMxCZx0Jbuibr0ClPKTyYAhTwvGkO0uQBEnSNscet3ZI8aBu/Miir5pqMg/JeroNpi7KvWwQwIyANu5pgwPQFyPumBodGT62HHqbTDbPPzM77lcwhcYvYvAF87CsPxmX4BgNxN2PNeN0y7Td1e1dkSXwTyjzM4/atX768etkrgTmeArNLNH9tvYeXEaH8AUIqy9JKQYy7xFE4SatJZHkkcU+Kdc/Size6sp7oii3xXpAxvzJz4Nu8ko7EGE6aiDSZ0LOeGQI4TPN6Y+MvnFvRV5ZKtrJImLnwKpFLuP4xnOmollGjNKiSBDnZi3/Q==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700016)(82310400026)(35042699022)(23010399003)(376014)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0XmUuYP0f4x9wkPWG9MV6e5+hJESwKmvrzry1lQ1iC2m44DBd9T3stH86eEUtT3OZEaMl8WyxVRozcuaMy4ZfEdgJfmsU91dPfx8lvuzHoEuT46UvOwy4XduuYZ+CP+6SfQPCZt9b68SE5ESianpIJeUSmrtypi0g+FW0eoN9BVsw2wgI9GvPhP3BQyAGC2bcz5souK6A9z//CV/sQ+7WgEfapDY8S1pr0+a8vskNjAY5xTTftmVXf+/lTaiORecWbkM5JaEy3zcnmSAhX6C9OR3IwVuXRQ8VI42V8eqs6niugTfxLJT1qQultY78s37pdyFp3YyGfRqqf1PDObrS4AfsHncrU0Eea03t1KXpv8ieCH1PRSeTU2mSc9o8oiSvI4NKD4YUKJwqMOfZVPHln8S7/UJ75SYjoxt1fO1P0Bu5B5BfQe3hKvXA6bquoNg
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 14:22:17.2562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 372fc323-62b3-43ef-9fb3-08df197e1245
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9518
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 14:22:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246523

T24gMjMgU2VwIDIwMjYsIGF0IDE1OjA1LCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gDQo+IE9uIDE3IFNlcCAyMDI2LCBhdCAyMjoyNCwgSmFpcGF1bCBDaGVlcm5hbSB2aWEg
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8amFpcGF1bC5jaGVlcm5hbT1lc3QudGVjaEBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+IGRlZiBnbm9tZV92ZXJkaXIodik6DQo+PiAtICAg
IHJldHVybiAiLiIuam9pbih2LnNwbGl0KCIuIilbOi0xXSkgb3Igdg0KPj4gKyAgICAjIEdOT01F
IGRpcnMgdXNlIHRoZSBmaXJzdCB0d28gdmVyc2lvbiBjb21wb25lbnRzLCBlLmcuIDAuMjEuOC4y
IC0+IDAuMjENCj4+ICsgICAgcGFydHMgPSB2LnNwbGl0KCIuIikNCj4+ICsgICAgcmV0dXJuICIu
Ii5qb2luKHBhcnRzWzoyXSBpZiBsZW4ocGFydHMpID49IDMgZWxzZSBwYXJ0c1s6LTFdKSBvciB2
DQo+IA0KPiBUaGUgb3JpZ2luYWwgbG9naWMgd2FzIHNsaWdodGx5IG92ZXJjb21wbGljYXRlZCwg
YW5kIHRoaXMgc2VlbXMgZXZlbiBtb3JlIHNvLg0KPiANCj4gV2h5IGlzbuKAmXQgdGhpcyBzdWZm
aWNpZW50Pw0KPiANCj4gZGVmIGdub21lX3ZlcmRpcih2KToNCj4gIHJldHVybiDigJwu4oCdLmpv
aW4odi5zcGxpdCjigJwu4oCdKVs6Ml0pDQoNCkhtIGJlY2F1c2UgdGhlIHJlcXVpcmVkIGxvZ2lj
IF9pc18gb3ZlcmNvbXBsaWNhdGVkLg0KDQplcGlwaGFueSA1MC42IGlzIGluIHRoZSA1MC8gZGly
ZWN0b3J5LCBsaWJzZWNyZXQgMC4yMS44IGlzIGluIHRoZSAwLjIxIGRpcmVjdG9yeSwgYW5kIGxp
YnNlY3JldCAwLjIxLjguMSBpcyBhbHNvIGluIHRoZSAwLjIxIGRpcmVjdG9yeS4gTXkgcHJvcG9z
YWwgZG9lc27igJl0IHdvcmsgZm9yIHRoZSA1MC42IGNhc2UuDQoNCknigJltIGNoZWNraW5nIHdp
dGggR05PTUUgdG8gc2VlIGlmIHRoZXnigJl2ZSBhY3R1YWxseSBkb2N1bWVudGVkIHRoZSBhbGdv
cml0aG0gdXNlZCBzbyB3ZSBjYW4gYmUgc3VyZSB0byBtYXRjaCBpdC4NCg0KUm9zcw==

