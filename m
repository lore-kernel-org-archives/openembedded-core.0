Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B887CD4F24
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 13:21:58 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75213.1778592108999978325
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 06:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=AZSPdnFn;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=AZSPdnFn;
 spf=pass (domain: arm.com, ip: 40.107.162.14, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=A6S0z8dnEcG+NynxWMm/2fST86Xk8E49rvmR5CIqhRPnAu0NTSMYOWwWx9YC3G1lcHpe4Q3bThCAmYkBZEnkApDIOsjmdMN9421NsXPkN579BnFAzYrakUZulW9ElLNGMqBMS0iWTb1DWdnJxNP/fRFn4nM3HuylRFCKGth5ALzfvBDNFGWLQdHwgijqdC2xQHRV/Wd8xsQV70HQaxRlMiwm6HfI6+9S0Z2DR3bqAfhQenoQfNqyQO14P5q6cT1+Wgik5IbC7fKzSIsKxz4lG5kZ90GDtwNEd05lJOvj4KVgdrF0gvIoRDj54D7gXUTnz2pDo9NmEi76U7hc4iZNMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egYUpsDFwDKiNqnQega28l+2Kp5ldhnhsQ67kdtWbjM=;
 b=LeCe51TH8yUuODlIdqJvddJ63dmfDJPlfYzsDzJ3iVcbqJlj+7x5bqsM//lP1YElHK82seG7fI15bOnkhtZpg40iLSR7T/3O/684K8EX6qalx0XOIrec45Kb/8d5Ez+HXz3q5DnckBuL1JckS+tqsfUSixZ8rKjxP/oSrn3uhEpxejd8kpi3iR1ctUOVEho5Ch5IJe4uvl1KuUwATXuGq6GM2RNVXhRLi1lPPjXYBQf8frwymTV36qcJzwzEVuH5iuCumh+bKkpdeCI10KZvYgCNWGlRAbMOBDj3gbKINQ1+CGcqJkfLFozIpYxJeh234dTwO2YNH78LFvY8S0QCyg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egYUpsDFwDKiNqnQega28l+2Kp5ldhnhsQ67kdtWbjM=;
 b=AZSPdnFnTRosF2oOUFA3izveWij2TzV+Hz5eUIWJstbH3AOV10vi3ihQ3QCWMXhRC6CtKAzPqVLh7hNNIjN/JhxiqNs5VmmqracZdb3V/kSLRwioS1nK7quV0HZnHpX1HwmZxT92uUjsL1BLY0r9qJG8U2qYV3sFq1OL+zREgaE=
Received: from AS4P191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::19)
 by DB4PR08MB8149.eurprd08.prod.outlook.com (2603:10a6:10:383::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 13:21:43 +0000
Received: from AMS0EPF0000019D.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::9b) by AS4P191CA0023.outlook.office365.com
 (2603:10a6:20b:5d9::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 13:21:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019D.mail.protection.outlook.com (10.167.16.249) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 13:21:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywawhNWXWHQXmDMSVE98yBuDwQKZPxSaxIQQCHREQq0xfYl0SMGPjmEueAV35MdJ3JUkSNcExhKMx3gzwqsThDzUf6EEVQ4gpyCiiUvyc88hNlPN950RSxK8UNfU4Gi18MEPU9oImKf8iZ3yEVAXLWnMevX0M+L+cqYecUnv7A2lFuE3Sj6kSnQKg/XB4r1uZRZOYR6vvWJJK5IhTOAtfWhsxZ/K1/0DzJlzKFuvzsy3jLggbdPUTtVQvzTScYEIrdqHW6NfIfAi2xdDHR0+cRkXdZ8vg9GCbsYbF4nXi9ui8sOvJmIhF0U9R6Sv2ap/VLL9Cc1GBxvT8gNmI+q3MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egYUpsDFwDKiNqnQega28l+2Kp5ldhnhsQ67kdtWbjM=;
 b=r8p1ZvxtunnK3y9Mk9uhZ2qJlEj6Hh5ft8nT2GAvmDqALXFyQ3ulivCAvE2UDXjAtA7sa36PabR9vnIa2/VE73cdaoOJLQ9qpQa0dGH4GdnglZXRuWpahwycqEvWeWmPRoYlLeG6LA3dsualFcbuX88sOvYT2ckCXuwHXqANqn2FHIudCEePb/YNHl56jTQaOQjEaYN/FYcSXhRJZbVhsQ1kM3rio4nuKbH97O1eWZz5LKIq7MqvfB9hnRlwVIqK4Wmv6+E3IYM2Ka8VKWcDQmxKucT4UsH9OzUCceFEyrOwBptn5WIj+uJ+ERSt//sEbY8O35YrJzMAckHukegnUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egYUpsDFwDKiNqnQega28l+2Kp5ldhnhsQ67kdtWbjM=;
 b=AZSPdnFnTRosF2oOUFA3izveWij2TzV+Hz5eUIWJstbH3AOV10vi3ihQ3QCWMXhRC6CtKAzPqVLh7hNNIjN/JhxiqNs5VmmqracZdb3V/kSLRwioS1nK7quV0HZnHpX1HwmZxT92uUjsL1BLY0r9qJG8U2qYV3sFq1OL+zREgaE=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DB9PR08MB11473.eurprd08.prod.outlook.com (2603:10a6:10:60f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Tue, 12 May
 2026 13:20:38 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 13:20:37 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "liezhi.yang@windriver.com" <liezhi.yang@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] strace: upgrade 6.19 -> 7.0
Thread-Topic: [OE-core] [PATCH 3/3] strace: upgrade 6.19 -> 7.0
Thread-Index: AQHc3vlho2r/T53xiU2WseqXTJIPmLYKZj+A
Date: Tue, 12 May 2026 13:20:37 +0000
Message-ID: <1C70E210-D752-4CE0-8145-8B4FF7D58D8B@arm.com>
References: <cover.1778251103.git.liezhi.yang@windriver.com>
 <b45f339c84baf27040248d667f2a8d02ee2f25fd.1778251103.git.liezhi.yang@windriver.com>
In-Reply-To: 
 <b45f339c84baf27040248d667f2a8d02ee2f25fd.1778251103.git.liezhi.yang@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DB9PR08MB11473:EE_|AMS0EPF0000019D:EE_|DB4PR08MB8149:EE_
X-MS-Office365-Filtering-Correlation-Id: 70331442-3bc6-4bc2-e191-08deb0296859
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|11063799003|18002099003|56012099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info-Original: 
 Opj9nPotL9lt78VXX8ga3Ygky+0hdR6QN6Gd6CrTrsvJOY0BTwa7yaToiL2kpFWdjUGDOH9h7I0pXUeyKJ6wliJHT6PdxOby33Ywybc0VnwU/40cQYW95DIpq7CvWrUjRkv+y6fPsUYMacraI8dZG1t9vGEqHZZdNWQx2XyUaqsE6SGfy6pp1W++VWJeCSG863R7PpC9PSVWaUZQ/UF7PtlPekb3X55Cpa9rpysKGKJpR5oL7JyNyTUlCn0DpkL5YGO71d+52mFXGXVASwMb6FvHrxcu4BdKSlejb5y8fxwHE9GR4myvmwM3np1g55weapUx/SFuNu/Sui1Fph74Z8nqzxPoBIWs+egQThfI6OQy1b9PunCzLwE28Atvut4G4aysxYnDFJjS06tUxA1X/AJDwYbmxv4ZxbNgxaeCG+HJ6gzOi1o6zqlTexTow0/aQd2EzvpuGMUnF6z8B1Vj7HQk3JLZREbLp/EpJLazUBpUjRMhKZvEfFms7v98cOyoYyDA8Vz5brjA1K9uL5wCZN/9dmrkgG0c6twYIuKnXhzBJRcZwj4/XYG6xoy/v2BI333ECuh5c3YHmr9hRMcF2JviNeqoSMOPqrMbOCHfsUFYCqxE/7rM+tEWPLYGgpFx1PueK3WNg+ovNLFcVDNXuMcjiEctejgebjRN4YtdZkyYCOdLHxrxCOeY7XrQShWSOp+8u/vpIcLyIHVKoVSymOXESZXvxDgr78FDMSoecUpJQplEB8W+fdRBrzy0g3Kz
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(11063799003)(18002099003)(56012099003)(22082099003)(3023799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BE428E192A6404783143E5BCC98E08C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 UH7utNFGWJt3pKlxyQA2MyOjARdIWUI18iz6S3fv40QRnLvXlNXFQwbN2GHaHmEVX0sm3SnCiaNYINWWyLuWEEVBvDdBLJbOcpcqh5gf6Hl6xxBTGPWdAq1vCqx+5DbRvzb8QkTcbtqheemPGy+f/rmEaMCynmyq2to1GEC2Z6sdU0sKt4L49ffcCIS5PkU5YydNNdJdldgI0TctpUcz6bDxemgVEiyWY49Eo+ybTU24f0TBUGsWdn2xKI0zf7LHZzEA9GBhOs3lsQAYIeb/9HDYisQt2vB5u9+EX/E2VLktvtw6wWPG2ez7sR37a/lSHCRXFIPKnqqDT8joo7YuIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB11473
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0006ad37-144f-4dd5-66f5-08deb02941e4
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|14060799003|82310400026|35042699022|376014|1800799024|56012099003|22082099003|18002099003|11063799003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	A+xZzK7TvT5+xfr/E8SFrn102ViCpakny3bq9R7VmzrMq414O5GkAg+b5mZ9B0qzl502gHV+0r9rBe2jPR8LphBF0i37t6HVPzuqaWhGhiCjl84fZU1v2rcc7o2+RIyVjoUROCDAfC0sbt30qItJzREviyeeVGcRXGKtT9SC0OLdpu29/3hJxI/zkO1+3/Ipi7E9dUPlBgqA+pkYM2jsdcmf1wmuQqu7Fs3oSREbDjtf3TExuwuHtZcLMfxdygrgu4LHBBseDf3GFTi6J6vt4FbU5o6MCVBeFfzimgun4ltrxnzPG/qxDmhRDRuRytJeUdY+8+IA+9Kj45j2ao8vZqZUzmrYD/KZ/ic1MzCsSUMT+iDFoPouIJBlM860+uLbkFfajYLsctDB4o0m1931pYDC8MtaG6SrIdFoJ365THkaErWVMA2saEFO8xvRnByxudWFi/ld1vK7bon+e5eyzS6UmU+d7zv3B/oS+eiCuMAWJGZgu7wPvXFRBzxl8I9NRd5pkWw5p9idorD+3fk/9VbEqZheudEvWHFrsc0um51Wo31TVZMP5b8v5aecU/WDnuBRTtClcUEtogJECSu7t6ofOIKDf30hdCsxfhH2EMGs/fKpNOjGWG1o2DegKtUtffgcfcowM7cTmoF58Qdj8WGT+W8WkRZeqILu7D+czvYsVfev+1Y5caoqEf8ONEAhWYo7qtQ5lN/w6zcOixDm5LS8r0XAi/jg892afgRKoTE=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(82310400026)(35042699022)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(11063799003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	t3Dsv3FoLpCMbjEPjZK3BleUO0u+LsoKgffONCCSEsb1amavatkaj/9VX9MsFavN+fVV/DhTW6zzrIN/AC+cs+X7DCWyWvIzvt62vK09MWObZPjaJ69s+cYwf3av5/j6OAzI6heotID7ZlpnaUGS2c5Hmxg4gvgg5f5Zxltxzl16rFErSBw0L98WCNGpKwD/cHaHbQJsO5SU5fr31RipVTpSPnGZiTOg3VkZiiZdsp5dBYShlgnMp5ul66Gbx1AajHIY4P0UgYbMhUSGYtcVCU2uFKifjWgORk/sRun7SFmglLmWK3FcjDJPF3F2w3HIYvDRlxQMwQ1q1Su28IDPmDigMWbZkHzKFQ9kn4aCe71S7Nr+2TfpnqwLQ687HhB8SiUPsZIVVqGV+nLHh86xQnxi2v6HCzFZPj1eE7ZJYk/yAuGHQf8vdltaU7K8AL2V
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 13:21:42.3661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70331442-3bc6-4bc2-e191-08deb0296859
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 13:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236882

SGksDQoNCj4gT24gOCBNYXkgMjAyNiwgYXQgMTU6NDUsIFJvYmVydCBZYW5nIHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIDxsaWV6aGkueWFuZz13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IHdyb3RlOg0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9uZnMtdXRpbHMvbmZzLXV0aWxzLzAwMDEtZmhfa2V5X2ZpbGUuYy1GaXgtYnVpbGQtZXJyb3It
Zm9yLW11c2wucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMt
dXRpbHMvMDAwMS1maF9rZXlfZmlsZS5jLUZpeC1idWlsZC1lcnJvci1mb3ItbXVzbC5wYXRjaA0K
DQpUaGVyZeKAmXMgbmZzLXV0aWxzIGNoYW5nZXMgaW4gdGhpcyBzdHJhY2UgdXBncmFkZSwgdGhl
eeKAmWxsIG5lZWQgdG8gYmUgcHV0IGJhY2sgaW50byB0aGUgcmlnaHQgY2hhbmdlLg0KDQo+ICMg
cmVtb3ZlIGF0IG5leHQgdmVyc2lvbiB1cGdyYWRlIG9yIHdoZW4gb3V0cHV0IGNoYW5nZXMNCj4g
LVBSID0gInIxIg0KPiBIQVNIRVFVSVZfSEFTSF9WRVJTSU9OIC49ICIuMeKAnQ0KDQpSZW1vdmUg
YWxsIG9mIHRoaXMgYmxvY2sgKHRoZSBjb21tZW50IGFuZCBib3RoIGFzc2lnbm1lbnRzKSwgbm90
IGp1c3QgdGhlIFBSLg0KDQpSb3NzDQoNCg==

