Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F43FFF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:16:01 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16928.1777544152284312050
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bJu/qPAX;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bJu/qPAX;
 spf=pass (domain: arm.com, ip: 52.101.69.21, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cHOPDx1sJGlWIqWn2kXSTmKZb/Rf+mdVHLRzrJygqjK4M69tiD3aw7IqNQr/TISrNnHeUgAqOPYQ43QCfkJj9lbjly1liEQQJ6b6Ng8jXkCJMmgns/v2Y6GpJbA0skCQyFgQeaZYqhhjg+K4A6Z/w/KLlrnn5uRxPmFa5GF8AmLCyiqamqCUS8/IRPNO1rJC3w6sYgi0az0DhVtCkT29Bd+L8hcqryASYT7kna8FT23r+2mO3d1ucLQQAH6bPFROLdtrogdAbbGC2ieBWcmMJJFn33tPzp9P/sZXvokszeoUgzaWn/az/WO2j8wLxfB40AQdLG7rbcg6LyhB1zWwIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FH/ciPin/5wlV9l5BhHUXMW2MP+uFCE3V5Z1R/LCFqk=;
 b=tAerM8HB5eUSa5L0Ix/1yI3mi9ukT11jW7ADV+NeCbrsAgdPzRe0zQ6vVAA4UOFOZFEd5UHDcNtB6dFbDaEztyUJblSP5yP1+cHM3/HS9yGISAr3t72AeRkIWn2V70oFTfVtGeIkiACHHdQmZXDYyG2bYsvSrqvf4BR/jDhAFjD7WEEgz+IKaCjc0Yiz/Dh44Vp/H/3Wn6cXA3Glv47QfO64ptEXjAy2W10cymmwzo0fG8pr8c/0E/qrKCBLWL85wJ+HZmN2yHHSYrlhe50XrDy0wXj28uMnXsvyN4/v0xC6gqJSshwJLLyRdAaDwuEvUGRhyH+5tm+LXYm7XXqozw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FH/ciPin/5wlV9l5BhHUXMW2MP+uFCE3V5Z1R/LCFqk=;
 b=bJu/qPAXxZ/TBCXkaJQH1xfgMA7A/5K/BQVc1zXEptGIZn6M9H9JiqZiVKaWJ1VUByyWKGfBfrQrOWsDT0+omEhx+Mc4mlrX+59k3u6C8GTZnSkIEzD36eK/5eR04jBYCPcozGHDH4xjtSI24mBYaFL7OHBe2M+qJVGdIps9BG0=
Received: from AM7PR03CA0022.eurprd03.prod.outlook.com (2603:10a6:20b:130::32)
 by AM9PR08MB6035.eurprd08.prod.outlook.com (2603:10a6:20b:2d9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Thu, 30 Apr
 2026 10:15:44 +0000
Received: from AM3PEPF00009B9D.eurprd04.prod.outlook.com
 (2603:10a6:20b:130:cafe::bd) by AM7PR03CA0022.outlook.office365.com
 (2603:10a6:20b:130::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 10:15:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9D.mail.protection.outlook.com (10.167.16.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Thu, 30 Apr 2026 10:15:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ydScz+lCLSEh4xR9tEUuXKGRkFhxY7DwWaZfinua7VsupCbDW19W4A1f6Plt8OEhIASdP/GO9tQLu6IrNbmXWmUeYSfb3oeayumpMH+8nLTbZ+xmeGdBXd+Hz+IsgsYbeRJPHwOI8bbK0+CLmx13m32hQt8+JoxWOtPIHLk3UlD7v2I7m75lBhAJcw81VOydpmRSa/CytLp28tSR53ptgOvL8Iq5QG3MS7eh7sLWoFpTSC6T0+vx1DGQrtM0t8VD1Pq94EPlu5/CtNQBAI7SMnA1M5ve0HzrnPIrmXxkq5lPh6U/33ET9rno/AbJHPKJTPQU04mI2GR2G44W6UrX6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FH/ciPin/5wlV9l5BhHUXMW2MP+uFCE3V5Z1R/LCFqk=;
 b=rQUeiCrAuhT52DvaSm/B59bIhlxJoXvvh2KhtoDnsmZO++n/yUdB1bNZpDsRfNexAT2k66Y9wSwOQOOexro/f227oXc4HUSk66jiUGvWLaNzioRY5aOMFTtBmrkGhMPOFN4ldWiSqh+okjMu3Cz3nkV2hFQqCXqaRlFdGR7CwxAOIySvg95hvbUuNwZ7y+XovxqCrSF8aECGrgKx/HiZ9v73+DVRwcBXyKk/KGP63DC+LgnTG6OmuBBUTCErKeUxz27NnThCT4Abr1stFYJ/rHX5U0GIQTtbx9o4Gj0/iqWdzA87CiJQ/4ECEbCLR8v0VSX//tM3xD/IFEreTt4zNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FH/ciPin/5wlV9l5BhHUXMW2MP+uFCE3V5Z1R/LCFqk=;
 b=bJu/qPAXxZ/TBCXkaJQH1xfgMA7A/5K/BQVc1zXEptGIZn6M9H9JiqZiVKaWJ1VUByyWKGfBfrQrOWsDT0+omEhx+Mc4mlrX+59k3u6C8GTZnSkIEzD36eK/5eR04jBYCPcozGHDH4xjtSI24mBYaFL7OHBe2M+qJVGdIps9BG0=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AM0PR08MB5489.eurprd08.prod.outlook.com (2603:10a6:208:18e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 10:14:40 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 10:14:40 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "careers.myinfo@gmail.com" <careers.myinfo@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][PATCH] libsamplerate0: Adding ptest for
 libsamplerate0
Thread-Topic: [OE-core][master][PATCH] libsamplerate0: Adding ptest for
 libsamplerate0
Thread-Index: AQHczbATCSqPfhvaiE23fjhuUnUwNbX3eOMA
Date: Thu, 30 Apr 2026 10:14:40 +0000
Message-ID: <FA9A7825-5BF3-4AC4-BE3A-AA3E2F4D9AC9@arm.com>
References: <20260416110525.1048871-1-moin.shaik@partner.bmwgroup.com>
In-Reply-To: <20260416110525.1048871-1-moin.shaik@partner.bmwgroup.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AM0PR08MB5489:EE_|AM3PEPF00009B9D:EE_|AM9PR08MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: c422e619-9c9d-4ede-7e8c-08dea6a170e5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: 
 4CX0P8YDdCYGOm5yIRU64pjSYbMBDFe4JLkvoUJ8td/X46yGT6fYZoDbpZXQKQo3AKlRGMaRVKWO/C7lrp/TlJdOEnAS8SBuzYngsWr8LqMl4ivs8gbhip9U+ZTZi6gpwdqMfjspcC9jZ5n7tWPpYHEFoVn+mJsz3/rpIpQQ6+mIsAzYBKaC6dIH/4Lfyyug/2pKlwO2yMktcLy3jK9UzSsEi1+RcSp/535rPbZvPfmKK3C1G94XXJ6z5SFSGhvkF/GJI6pEzWAStotzbWyvKbL08QK8ehftDBfHBCTcZ8TEyuNxuBWj/5pi64eU50/KTbjJd34OWqjA2srqFqxE7qEs+7Mhn419lZgpJRX8pLxeuewhgcCDsUrskgcKfe7o/pjREO5tgsp9d33wZmUWuCBh8pbw5psGys16P8+gE2hZhA4Yf5jl79YvlqZnu3GmVS3ngryk2y4U+gwRimNvNe1xQxMa2kF4SWX3nul0kYNKWfkcd4q9D4JVSru1eJKw3cq8doXUMZi5+zARLm8onYyIszB0RjERtAgtgkVEdRI1nbWObhr+zJyoPuycua2oNzvJlsnedH1KsWDyTAoAyp0kCdTxMVcN07Lb2QIs/5713Xzl9z4I6JZ5DF7pF8K5bc8Y8JqJmGpxFg7J/vTO1RIBG9gqHFX69NvtX6znQLc2m52jb4U8JE1T1vwuh7U7Lv78Q5pb2kHxDmzcT7h47KJU8a+L9zqjEd8lnAWBI4p4SsIMk3YedOdLCkvRbFYg22J6VLtvLmjO2Uw9C9RIUqMf0rkeQirp25+pPWqnGS4=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA932B83FC582744939C1965A7600A08@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 Uih0KQWTeVYpQ9RrOwyzWOkKedB2NlWDKuaPE6DJwH1MYMmA9fggr9PzM0o7rCesbYXJenw+NV7yc67zoA9Pb+YR8iMmEy26pQLF/oXUVL1yASDkomXFA7XGyaEApjGIhmcXBLFF5xEudWoShKjjRiqgLuQPgc7e7CIsPW1Jrh6Q5b5W3QIgXAayLHtSUywJGoiq2p7tpLRGAImQEw0U3GejcDnBvdgsJaDL9jUgioV2vVzmc8jpxYPOzCAMnLhvX/NKgA2IRpGWZJTCxfUv2o0H4k8C3ZRtcPQRgisydypuxujD+y3eoR0XEk4uLbmVDEMr2uc93aNicW242Lilwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5489
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	58b2c768-4663-4402-b944-08dea6a14a97
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|35042699022|14060799003|376014|36860700016|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	wlCsA59nA17AKSa+ate5VKsjSPu8+lt6P6RxWWzCJqhWn6tdJgVxna2eXXg1oaC1MSjqszYB5XH6a60KkUme5V/VKnX5qljOqxpY1R7oifxeF6cPGDMX53I+Stn4DFX0DtGCAu2/BdoM3Jg0gou48ozcXwhtDQCIEKQgwdSnBQCuX3u7qegPFlhJivCQsC4gV5nnVLB85sDkjCf5JIvywPvsjkzzkielQ4AoA8+4WVkAWOZLvS8FrheRcQHCA5wwjtZQ39+XgPoOphM0/Cv5e7nsKubeYA3v4WbmQ0Afnf130Mvqqm3ZriHwrrVi585SCh1TnkzE96jATJVONAwIu2SVqRoNbgFM8wKVzFM0VYsifqI5bhgqEuT7lUiuqx2JyJ5vN83/WioX9fh3cd3/N6lPvg1T+dACBlC2oNyZmm80QlYvOTDW4q3Tl6SuHoWsZNHo2BtGFF2Z0Oq/e6sID41spPMkPvnDrU7M60fw4AP53NoFV767yLx+4OKLHd3AiC1qkWjjcr/EJG6CRnAxth0RuSlLHild9/KUVtEXhoyhaJ6dYbdYGHgJpcMYiR/l8F20nC9bZWy+MZgooHhuf98lzDCwmOjBmkcRywDEXqJMuncKeDY1TrajaYAtkqek2OD1T52oCZgfVNOENCR4qluetP6zE+PcaMIt8Fm30sLeJ+5jkhvvdU/Xy/4rf4Et2OrEqWXI1nYXtf/XrpppvX1i0sblOGGxUD4vZ/JNwcPP5rbJSMOfCY+scPOl6yLdY0eaF7HavGQYMR0TMPNTeg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(14060799003)(376014)(36860700016)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	oLQV8kx1y4kcG/cYLzy+uycKkA0WyJV9AsOPnsZM9e1zeNotm2Gfq7Bj1F8yPn8HmtAUusjJ6zd2IuioArp8g/i66HyuAPSKOImhkzdjHFhEwhYCQETXeiaZB/9uVqRc0/hn5ayDn3XFk841rL+Nw4PNavsw4Y2WjV7vFDKH1keTVGwPw7HtbAzDDEXO2iX4JwOQCn79kVOXcGmUCdVzjxj5BFO2JBkQlMYC3oWTtFnRrGZmHCBbM02SQ++AIxF/IkYKi1jlUm+FzcrjLz1z7o2Om9SB3nWvbwuQ8dcapvBOH2q4Y0kvxCbYcPsra4lXhzIGzn/p9UxPOEy2VwGrw+kJ2w8avedGJBczeG/89TTyIE4W2V+SZyXZFlhfwVAgtJVnSlUfj3CuDKVnCJWJfRlHBWb1T33qCn4KW3EQKpshGos2ekbjh3emZ4dAKROI
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 10:15:44.6782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c422e619-9c9d-4ede-7e8c-08dea6a170e5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 10:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236156

T24gMTYgQXByIDIwMjYsIGF0IDEyOjA1LCBTaGFpayBNb2luIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxjYXJlZXJzLm15aW5mbz1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+ICtlY2hvICItLS0tLSBFeGVjdXRhYmxlcyBhcmU6IC0tLS0tIg0KPiArDQo+ICtm
b3IgdCBpbiAiJFRFU1RESVIiLyo7IGRvDQo+ICsgICAgWyAteCAiJHQiIF0gfHwgY29udGludWUN
Cj4gKyAgICBlY2hvICIkKGJhc2VuYW1lICIkdCIpIg0KPiArZG9uZQ0KDQpUaGlzIGJsb2NrIGlz
IHJlZHVuZGFudCBhcyB5b3UgcHJpbnQgdGhlIG5hbWVzIGluIHRoZSBuZXh0IGxvb3AsIHJlbW92
ZS4NCg0KPiArZm9yIHQgaW4gIiRURVNURElSIi8qOyBkbw0KPiArICAgIFsgLXggIiR0IiBdIHx8
IGNvbnRpbnVlDQoNCkV2ZXJ5dGhpbmcgeW91IGluc3RhbGxlZCBpcyBleGVjdXRhYmxlIHNvIGRy
b3AgdGhpcy4NCg0KPiBFWFRSQV9PRUNPTkYgPSAiLS1kaXNhYmxlLWZmdHcgLS1kaXNhYmxlLWFs
c2EiDQoNCkFkZCBhIG5ld2xpbmUgaGVyZQ0KDQo+ICtkb19jb21waWxlOmFwcGVuZCgpIHsNCj4g
KyAgICBvZV9ydW5tYWtlIGJ1aWxkdGVzdC1URVNUUw0KPiArfQ0KDQo+ICtkb19pbnN0YWxsX3B0
ZXN0KCkgew0KPiArICAgIGluc3RhbGwgLWQgJHtEfSR7UFRFU1RfUEFUSH0vdGVzdHMNCj4gKw0K
PiArICAgIGZvciB0IGluICQobWFrZWZpbGUtZ2V0dmFyICR7Qn0vTWFrZWZpbGUgY2hlY2tfUFJP
R1JBTVMpOyBkbw0KPiArICAgICAgICBbIC14ICIke0J9LyR0IiBdIHx8IGNvbnRpbnVlDQoNClBy
b2dyYW1zIGFyZSBleGVjdXRhYmxlIHNvIHRoaXMgaXMgZXhjZXNzaXZlbHkgZGVmZW5zaXZlPw0K
DQo+ICsgICAgICAgICIke0J9L2xpYnRvb2wiIC0tbW9kZT1pbnN0YWxsIGluc3RhbGwgLWMgXA0K
PiArICAgICAgICAgICAgIiR7Qn0vJHQiICIke0R9JHtQVEVTVF9QQVRIfS90ZXN0cy8kKGJhc2Vu
YW1lICIkdCIpIg0KPiArICAgIGRvbmUNCj4gK30NCg0KVGhlIG1hbnBhZ2UgZm9yICJpbnN0YWxs
IC1j4oCdIHNheXMganVzdCDigJwoaWdub3JlZCnigJ0gc28gd2h5IGFyZSB5b3UgcGFzc2luZyAt
Yz8NCg0KUm9zcw0KDQo=

