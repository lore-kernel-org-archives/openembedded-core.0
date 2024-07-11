Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18DF0C3DA4B
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 19:05:36 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.41])
 by mx.groups.io with SMTP id smtpd.web10.53.1720724726448922227
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 12:05:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TKy09EFn;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TKy09EFn;
 spf=pass (domain: arm.com, ip: 40.107.22.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DlbAPsQzgcjaCemDjeVZZCylt6KCRo3ozjj+m2RJq+Lj7F8GuU79O1FhC7PFl1m01vj9beYrq74buhnFrlK8RUJaNuXgalGOhrGbqb9kljKl+T8dI+E9buk9vzY+4Wq0YPaP/cr/3gMRrHvUsv0+UGspxy1ZTi7mUN0uI6V/1Du3LmY2+ucU/M8M4/jql5Rwn1n5ELGvT6/fRZShCj4t//kGWYM32P5yMiCsw7NL5CK4llHN/HzEaWtlSDzBrVaRAQwQNbnI2ZbhDZFXM09d/E8LVtdIi5F3SM/9G49ViskvK/pAW8rgDaIEKpDazFKbV19Qit4U49x1pfDlASZO0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQjljXsTXwJ68QmizjKPNBNl5edlSCmaiwBu/aoT480=;
 b=qrqhcSF32DBLAQspMFgrcDtp4tZ24Ns1pDcGLUbAybx1kMKQmXwDNDmLqfsNfki4w4Lxsdoj77bh0ZwRVALxzJiKFQx7kAXNs9qDYIbMa+wBmPtj7wGHUxqsW5h1aPGuKhQcquuDYGsJH8qJWH/taexNlmoiThFvfwwyTqzEf9YakiW3GCA1i/mJdQbZBeJvw1rz5YX8SOXE2r+7Fkrcz/ZwgfShSv51DVEFxKEdf5Vl3uPmGp52jm5Nme302sKpLLrDChdCSVbj+MQg7Tw7qw2o2ja0onfw83nycFygctLRI2WOmJkN1+1Hp3Cp7d1XYVdOYshiIcihjaLyl/ILsA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQjljXsTXwJ68QmizjKPNBNl5edlSCmaiwBu/aoT480=;
 b=TKy09EFnO3VX6by/+k9awfhgJp/wrYvEhV4zOT2x46YcpdpUYCe2WxvJOo6+2MpU4oDqptlDuUZox1vNgfJDDcriskWZDcHVXECzw0EtTS0u/ZYc/+W80txmDeKJKEFog7KAMqUdH59xGPZl7AmX7zboaZA8LVbguE1OUplRWVA=
Received: from AS4P190CA0010.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::20)
 by PA4PR08MB6032.eurprd08.prod.outlook.com (2603:10a6:102:e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Thu, 11 Jul
 2024 19:05:22 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:20b:5de:cafe::99) by AS4P190CA0010.outlook.office365.com
 (2603:10a6:20b:5de::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22 via Frontend
 Transport; Thu, 11 Jul 2024 19:05:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7762.17
 via Frontend Transport; Thu, 11 Jul 2024 19:05:21 +0000
Received: ("Tessian outbound 5b0e0b3c9995:v359"); Thu, 11 Jul 2024 19:05:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 91d7ca91a3cebb9c
X-CR-MTA-TID: 64aa7808
Received: from c2069a959e3b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4EA37900-E2A1-4071-8EAF-D7615E1BFEA5.1;
	Thu, 11 Jul 2024 19:05:15 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c2069a959e3b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 11 Jul 2024 19:05:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KUg9pj4S8TsNn/vq/4vVcmym8hjVKxIXs/oO6A+GLtG+DnP12cbdNJM7IAUUWRBdrKxL+k9gsnVPtVUk3tSO4pbh77555Yx+Aj9c8mtxyDHst6LzmdCP7r479mpp0VhliHqpwsNRp0Rb38nRT5HpCVi8dykqyt8VovP2eEszQvzG4vuERHh0kibzHB41BpL6R6YcTA8uYw+iZw9GZl8N2GSxgDGWETzkiGfcS5cHgMPtP/txIsSngHXK8MQiKEr/p0zylSODM7uGw5tEvw0tr3AtVNUEWDJ62IC821gGFGhU+CgXUxAz10xpnuu08O6TZvpvIUZ8cS2lLG/RaphchQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQjljXsTXwJ68QmizjKPNBNl5edlSCmaiwBu/aoT480=;
 b=xqGMG7tnetXN3D+ghKh0W3wjBYOPozTL2Wy3BnKTXZqCV7COfVyotNaU4V8l94r+7EUhyaMWGETBx3enFlvsd4HTtlS9y/NgwHGX97TB0D+k5bNrLiwolUJt4IBbC3jo/pVDCNMh1Yvjs6kv7uDng4hHTQwNfqWS/Yk1GLhcCuqlGmgqxLjUHjaTqpOIOc+7p4JNpoKekLSHVq+pUykHk+ozQ81Xkx7QJELpewmRIF+BcBlC36yzOivNg1djGHkdItH3JM9fUuSLoZfGiLjQLTjw2DRbJjlAXb7OqUixMrWaRqLglM9OiAF/eEfiJv9maqv49qbuXKf1dA9MuUiK8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQjljXsTXwJ68QmizjKPNBNl5edlSCmaiwBu/aoT480=;
 b=TKy09EFnO3VX6by/+k9awfhgJp/wrYvEhV4zOT2x46YcpdpUYCe2WxvJOo6+2MpU4oDqptlDuUZox1vNgfJDDcriskWZDcHVXECzw0EtTS0u/ZYc/+W80txmDeKJKEFog7KAMqUdH59xGPZl7AmX7zboaZA8LVbguE1OUplRWVA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB6288.eurprd08.prod.outlook.com (2603:10a6:102:f3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Thu, 11 Jul
 2024 19:05:12 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 19:05:12 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf/webkitgtk: Split debug flag from
 DEBUG_FLAGS
Thread-Topic: [OE-core] [PATCH] bitbake.conf/webkitgtk: Split debug flag from
 DEBUG_FLAGS
Thread-Index: AQHa07MPp0sI7E+1ek2p3u7y4zu507Hx4w+A
Date: Thu, 11 Jul 2024 19:05:12 +0000
Message-ID: <38C005D9-7212-4055-9CBD-0460B6D1F659@arm.com>
References: <20240711165432.1340223-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240711165432.1340223-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB6288:EE_|AM3PEPF00009BA0:EE_|PA4PR08MB6032:EE_
X-MS-Office365-Filtering-Correlation-Id: 011092c7-f40f-4092-c1d8-08dca1dc69aa
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?U1YzbndTT2ZTT1BDZTJpZzQ5cnFQOFNmMXlTeUtYUm91bDU3TW1JSVJlMlB3?=
 =?utf-8?B?dmNWK2JuczEvR2o3M3E3bEZOd0JmV0wvZGsza0FtOHBOQU5FdjdFYXhCWnlQ?=
 =?utf-8?B?S3pZMHN1ZXRFak43dkFWZmZyZkExM01oWHlXQWRKd2paaitxR2pibTZMUDVN?=
 =?utf-8?B?R2NLWUV6d1g3N2QrZTNsQ1pzUDNwNVpjS3BIZFNZTFp0UGRFWmFveGE4a0FB?=
 =?utf-8?B?WjNQVTRuUzRZZUpDbnl5OFZlN1VxeUtWVExmbjhRMWNQVFpLVEI3QTNvTVhU?=
 =?utf-8?B?UDBSS3FJenVqb21udkhRYW1teGJQZXZCUlkzcEMxQVZQM1dSUzg1ZUZYMWh2?=
 =?utf-8?B?MTNVRm43UElpekkxUDNhaVczS21TVXAvQW9MQVAvOVdvZW14NGJSYjM2cEpo?=
 =?utf-8?B?eDZlTitqbS9VZGdINnlDQTAvV25md09UaTJDLzN5bzVMakVoaWpXcnFFYk5m?=
 =?utf-8?B?VmZzeE9CeG5HbWN6ODBoTk0xVDFQQW0zUm5xcFFyeUZMdnRZRzZxZHdRUm44?=
 =?utf-8?B?dGtSQ2ZIajQ5SUw5YkJDMWdKVWZ2T05qWi9OR1Z6emtUSUhTM1B6SGwwdzhz?=
 =?utf-8?B?aFM3NXl2VHJuSGk5a1lESEZheExRZ25NOC9HYTVzMHc1N3poczRWZWV1Mm9Q?=
 =?utf-8?B?U3p6WlhNd2ZOald3SHc4dlYvYkRRNFNJSFdhWTUzZmJ2QTQ3Y1A5RnRZTW1G?=
 =?utf-8?B?djNqSWo4OG5yMFFZc254WElFcmNFRGxpdHdhTFh6STBoVjMxZEF3WVU4cE5q?=
 =?utf-8?B?UkRNMUNkMXh3U0FpMTM0WGlnaVZIOTJZRTNVbTJJdC9yUkNhQnRCRVRVK3d2?=
 =?utf-8?B?dzB0aWNkbSt5RThtQUhYQmw1ZHYvZEU4TjVXaGFhM0srdzA0Qk9SNko3a3lr?=
 =?utf-8?B?d0lPdDdFSGpaOHNyc3lGZ01RYWJkT1JuK1FUckcxcVRidDVFUkhKTEJkRlR3?=
 =?utf-8?B?eUJ6VHY2Sk5tdkJmZTRaYTJXNld4U3hIQ1JiRzVobHhXOTQxcTlZTXk5Sk5H?=
 =?utf-8?B?RU5JS3BiWGlXdnVIWWk0Nk8rWk1sbXliQlJBUmc2WUVDSjNVVVpZaVUxT1ov?=
 =?utf-8?B?RmZSQ3hINS85L0lhakpsOGxHT0ZSdXAyMVBjL2tTZWtPOGY3eVRnNlhrM2lB?=
 =?utf-8?B?WUFqK1FmbldHc2Vjc1ppbi9YWUZnSGpkS1NzdG1PMTN4NWZxdEdlTEJSdVF3?=
 =?utf-8?B?M2JPOWFaRmMvZm84NU5rZ2JRcUlPUFAwQWRGV1ZTOXJCOWtOZFVYTzBoS0Ny?=
 =?utf-8?B?ZWxTN2p1U1k5LzB0YlpKNW80Q0tLME5DZXBkWFR4WkM4RDRqSWRNazFzQmVU?=
 =?utf-8?B?emV0c3F4dGVuOGpWa3ZNcFdCUWVOazVONWRJRjNXSytEK3lObEo4SVZyd1ZU?=
 =?utf-8?B?KytjYzJZVUZjVzZ3VkRkeU9qakpDSGFvbVpJeFNCWlA3Q01vU1pONFduSUNT?=
 =?utf-8?B?WHo3MnB0SjhzcTJXWjZsRS85QzRFVjBJallQWWdVQ3RrczNscFd2c1ZOVWJO?=
 =?utf-8?B?My9KQ1RTSmFvS2FSR29JL21STVdCc1kwZTJ6VEZPcmk1ZGd6a2ZjOGhGRE5D?=
 =?utf-8?B?ckZaRmgxQVZOVUtLcDZySHZLcUpYS2syYWYxbWplUGh6ZEVRYm5IUUxBcU8w?=
 =?utf-8?B?eXd6Vk15U1JnSU8xaFFaY2FrYUhBbUM5YzRuc0VWbDBJMzdtTmNjTXhhVlNv?=
 =?utf-8?B?TnFQNTFtOTJhQlQyZk9xalg2d1NOeks1S3I1Zm9sZGpqSGY1b1prMUtpNlpD?=
 =?utf-8?B?cmdIL3NoaXJFN0dVTlJldkt0dEoyRkJDSEx5UmZHaUJPVUJXd2dCaDJDb3Jv?=
 =?utf-8?B?VkdiZzVHRzNxUkZjeXlDdz09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8490EF5FAD2CC4580DF630513E5A1DA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6288
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b2784f4e-73dc-4390-38fc-08dca1dc6428
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d3I2SVc5eis5dTg3V2ZmWE5aUlNIQUdJNUtlTUFQQ1NHeFl1N2FLSFM1S1Fr?=
 =?utf-8?B?YkhwR21FQnE1ZXBSclE2YTVTRHpPMzljNFRvR1FrNU9uQVVBUnVYTG5yN2Fp?=
 =?utf-8?B?Umw0TlFSSXgvYjR1MTQvc3kxYm40RUpudytZajN2VnRpMnBzVENqbTgyaTRM?=
 =?utf-8?B?RjNEV3FpYjRDZDdqeDhReG1ZbFp2ZVYxOS81Y3UxamhxeEZ1ekt0Q2U1VFRG?=
 =?utf-8?B?UC9odXQyMUlKMkxKeC9YS2ZucnpGeWVpVEJORmRac1VjcmVnN0VtYk04d3pp?=
 =?utf-8?B?UjJTRVNiRW1pTEJaNTM4ek1SdnBZaGkrcDk0dURIS0xoZTkrR1pFVThpSXB6?=
 =?utf-8?B?OTFvRzllenAyaVBpQkI5SkdIaExoZ2VQR290QUlBOFZaUitOeUZ3L2ZjRHdh?=
 =?utf-8?B?ck14S2pqNWRSUk96aGFaUWlzRCtEVGFWbm9uT2NudGg0SEY4L3NGTTJnUUJi?=
 =?utf-8?B?MExTM0FLaVB2c0VrdE9OTm5nUVprYlBvV2dlMXVUUTZPTzAxbjl5MTdNdTB1?=
 =?utf-8?B?YXVzT1FvNk1HWXI0eitsMVJEcmlieCtsRTFONXZaamRtLzVkVDN5OUpXc0hj?=
 =?utf-8?B?ZFZEUDVOMFpPY00vY3FpTG84aEdUeklKVlJlcHh2blY4Y2VNdU8rQXJJa254?=
 =?utf-8?B?RUZBSThMR0paYlloK0MvOW1MQXhFV24xVlQvcFFUbEZoT2NkeW9acnNMS012?=
 =?utf-8?B?cnpYc2hwdmFsWWlkK3ZwandWd004bTRCODhEUzloWWV5ZXRrWEpuYVNDUldP?=
 =?utf-8?B?L3BYcDUwenlnMit0V0ppUmlnTnFjdi9IZDZHOXFOTHVjUlZyU0prTFpOM3VG?=
 =?utf-8?B?aFgwcXNZSzQwR1lJb0UvZ0phRFl5N3c1c2RTWDk1bFd5cDNCcmJTSzdmMmpH?=
 =?utf-8?B?WUREMlpNZS95TGUzR0YrVlY4SXBVd00yWndiMnJWQzB0UEtMTk1Qd2xUTUFl?=
 =?utf-8?B?RG1pRTY5dzF1U2N6aWRtMk1Dbm9DVlR2VjNLTWJjWjRqSE9CaFlyci9iYnJQ?=
 =?utf-8?B?OTdDWVh0dVh6U0NOa0Nwc3o5ZGZXSGwwT3NoRTVPZk42aDdhUWJzSzJQWkVP?=
 =?utf-8?B?dDUxekNreWc0MXFkdS9vclZUZUloeG11VjZpYmtUWStuTm1xZ0JMbVp2MUVa?=
 =?utf-8?B?YkhPd3B2ODNhN1BCU2g5dUVxb25URFdOK2twTlNBWmNDL2JtV0d4WUovd25Y?=
 =?utf-8?B?MGFENGVJZ1k5cG5lQyttbE9nbE5kbXFsUjEzQ0JQNmU3QWwwL2h4SjYzL3FS?=
 =?utf-8?B?VWdtdVk1b1c5OEtIV0JkVzZyRWNzWjZpaFJRRmlzaUV3c1YzTXN0SnNMVG1Q?=
 =?utf-8?B?U0tkRmxkYzJTaDk4RGxCU3c0Z2JVSFdadUw0bFU2aXNYOUwwc0RkUWUrUU9H?=
 =?utf-8?B?SGg3RkQxZFhrRWUrQyt3cEo0V0xUbVFEOUdsYTdiSjVIa0ZNcVlZNk42K0Fv?=
 =?utf-8?B?VDRhRVlLUmZMZnlsUzhxMU1rMWxqbEMvUWdEcmdlUG5ZNVFrcHZVcVV4eHBn?=
 =?utf-8?B?UXpTMm9kWDgxaDUydkZobnRVd1dLUEEzazU4Q1I5UGxxN3pHOGJvRHNPU0t6?=
 =?utf-8?B?cUJ1M0hVVGIyRWhiUmU5VzhiMXNjM2kyNVFPRXJzOFFQTmJJZlNEYkNYZ2dL?=
 =?utf-8?B?TEgwQ05aREFiWXJEMlNDV2ROSlQ1aUxIMDd5VDN5VnNYRUk5eVR0Q3Q1N3VS?=
 =?utf-8?B?MXVwMHFxNFdNWC8wc1l2K05tNURacDYyWUhiajRjTGV4MTRKT2d4dEhkeE9a?=
 =?utf-8?B?OGpmTXFoUXFvV1NTVFRLQ1ZMN3lYOEdlVCtqcWRtdWJtVElVZ3RsMldaUFhk?=
 =?utf-8?B?OUFRb2p5MmQwSFZ2aVU3R1dVK2NzVnNKcDNJdUhtUk85dHM0a2RQMGp6cFBx?=
 =?utf-8?Q?Qut6YFIfxKRP/?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 19:05:21.6818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 011092c7-f40f-4092-c1d8-08dca1dc69aa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 19:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201790

DQoNCj4gT24gMTEgSnVsIDIwMjQsIGF0IDE3OjU0LCBSaWNoYXJkIFB1cmRpZSB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyA8cmljaGFyZC5wdXJkaWU9bGludXhmb3VuZGF0aW9uLm9yZ0BsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IC1ERUJVR19GTEFHUyA/PSAiLWcgLWZl
bGltaW5hdGUtdW51c2VkLWRlYnVnLXR5cGVzICR7REVCVUdfUFJFRklYX01BUH0iDQo+ICtERUJV
R19MRVZFTEZMQUcgPz0gIi1nIg0KPiArREVCVUdfRkxBR1MgPz0gIiR7REVCVUdfTEVWRUxGTEFH
fSAtZmVsaW1pbmF0ZS11bnVzZWQtZGVidWctdHlwZXMgJHtERUJVR19QUkVGSVhfTUFQfeKAnQ0K
DQpDb25zaWRlcmluZyAtZmVsaW1pbmF0ZS11bnVzZWQtZGVidWctdHlwZXMgaXMgdGhlIGRlZmF1
bHQgYWNjb3JkaW5nIHRvIHRoZSBHQ0MgZG9jcywgd2h5IGRvbuKAmXQgd2UgcmVtb3ZlIERFQlVH
X0ZMQUdTIGVudGlyZWx5IHRvIHJlbW92ZSBhIGxldmVsIG9mIGluZGlyZWN0aW9uPyAgSXTigJlz
IG5vdCBhIGh1Z2UgYW1vdW50IG9mIGNvcHktcGFzdGUgYXMgd2UgY2FuIHNldCANCg0KRlVMTF9P
UFRJTUlaQVRJT04gPSAiLU8yIC1waXBlICR7REVCVUdfUFJFRklYX01BUH0gJHtERUJVR19MRVZF
TEZMQUd94oCdDQpERUJVR19PUFRJTUlaQVRJT04gPSAiLU9nIC1waXBlICR7REVCVUdfUFJFRklY
X01BUH0gJHtERUJVR19MRVZFTEZMQUd94oCdDQoNCihhbHNvLCB3aHkgaXMgLXBpcGUgYW4gb3B0
aW1pc2F0aW9uIGZsYWc/KQ0KDQpJIHdhcyBhbHNvIHRoaW5raW5nIGEgbGVzcyBpbnZhc2l2ZSBz
b2x1dGlvbiB3b3VsZCBiZSB0byBkbyB0aGlzIGluIGxsdm0uYmI6DQoNCkRFQlVHX0ZMQUdTOmFw
cGVuZCA9ICIke0BkLmdldFZhcihvZS51dGlscy52YXJ0cnVlKCdERUJVR19CVUlMRCcsICcnLCDi
gJgtZzAnLCBkKSl94oCdDQoNClJvc3M=

