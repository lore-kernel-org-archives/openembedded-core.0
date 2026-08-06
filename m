Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062A7C55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 14:03:38 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20568.1786025011197748964
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 07:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=h1LCA+4s;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=h1LCA+4s;
 spf=pass (domain: arm.com, ip: 52.101.66.64, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=W1M1XiR2yBOlfFZKXGl9avnYekx2F4byCDiQu8sNTOYHS8LMPfzXdQlEt2MOXpGzd5YqqWstLG4rqQ4+c5czw+A4DRXj33+6z9nDASv1FapOYC2zPM/SJR8C95qgYD0UFVDWchYKdTa2YMlcxhBclX02o4k6zwUug6DTHqcltnpjPIrIP+YbboDOAD8TMuE50gc6lJzGHllL6KuJOW1iCIIykvwRgxcUywi9jt9lUof+yN3ECHf7hr2tds9t626svu7BFjd04aKKPpJwSJY2SjMNtOraUl4rJZm8FQ5E8tbSSmV4KK9hX7x4GYU+TNIQG3xrPgUc+H0yareUNU8R3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWocCj/o95eRo/u41vDgpWigXFRrOo/Fj0pY9K0Wpyo=;
 b=o+IrrM0KoHj7PG1Vw5wu2YfhpjtNpGu0fdl2DG7J6gg+lJswfhVhB2UV2ue24GJzTKJknYBzqZCoDZ5iv4bA4KoJ1zxV9ffdFO63yADpGUOo6WqegGgdbXBnZrQVAT7GdIwf8qBoHexzJDxHhudGtgAZ0wo6RLlb3pCja+9oiduJ67Tq7fXi+9LEG3vryCBXaut/rIGI7PU2s3BwuozXHd+KJe4HP6wHCGp7w+ucijWM7bIIFVTAi8nWKn3TG+7Fvbg6QbaA9O4kuoFiyuVeth60m908Ud1EMduMFliWevUMiY5xomiDqnyDaAsvQKUpA+e+w5NBgGdJ4fUP3/26bg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=konsulko.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWocCj/o95eRo/u41vDgpWigXFRrOo/Fj0pY9K0Wpyo=;
 b=h1LCA+4sr/aTQtB+7oo3VakNwS3zFsFThTzuISKdexqUA1zJAScjMmVh34xA3i7Lb16qPXQgNn+LfPe2phj14GJ2elaQQNBBWIrlir1kbuAAX7HT5nNn97aRanjYFO5YAdlcjl3wfm3LE5cJASmiQBEX3w54L7ugiIL6Mg5Xy+8=
Received: from AM0PR02CA0198.eurprd02.prod.outlook.com (2603:10a6:20b:28e::35)
 by DB9PR08MB7865.eurprd08.prod.outlook.com (2603:10a6:10:39c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 14:03:26 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:28e:cafe::a3) by AM0PR02CA0198.outlook.office365.com
 (2603:10a6:20b:28e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.20 via Frontend Transport; Thu, 6
 Aug 2026 14:03:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Thu, 6 Aug 2026 14:03:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N325/5lJqxOWGqV7DbXZjP1OWfUzWC4SZT1C9qH/V2SVxO1FwBi0BxghV9YXdMrhvSttJYyLIyit0Xt9CYtqmEv/H1+c8H+rGpInC937uyDWHnAUZck05mBfulhEnFnVbLNQ6Fb8s4dXWK3qSlJBMonwaGqqILh8OAJNHLbej+c0Zr0NtcXTy16+Bfe83mPR0uZXy9XvCe+1FDSCs/cfxlCxtKh+TCSaEQSyewYSvjBp6RpuyonWaBI7ZygtgQzuNJT18NsJ4GJzslE9cY5dvBzpYtaOxeLSVTFU3CozsIOqAbGFu+8Hv7j8ABH/X0wVdoX9HN5bM7AuglmbwSemCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWocCj/o95eRo/u41vDgpWigXFRrOo/Fj0pY9K0Wpyo=;
 b=mPsvAknWWl5SPT7lQ/IUefRywil/PMZjFebKRo5zkcMvnMZh9hx1ac9zu977nfBULOnFdWwqsp1UdyzBiDEmMi+ExvnGL0D3A0bf1b3ruLiQhxnOi7HUmsAl5uQLEZsOwTRKHSSC1FAPS8moHX4MTEutdBfv+4mdU7TGbEZB5sad1lYByTQCB5IbolgTvJA8LrgezG2HJ5swIDM1ZtI8n5QWpb+edmjzTEsivCaoJQqSNtpruA3ooBoct4BEcGjNfmMdHCuE+rM9qV9OsjWtMXXVMBq4Qx/1V/lTN+J7jr7LWys+FaC1a42BKsRQ/bkrC/0RV6fa8U01kWZffXZQMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWocCj/o95eRo/u41vDgpWigXFRrOo/Fj0pY9K0Wpyo=;
 b=h1LCA+4sr/aTQtB+7oo3VakNwS3zFsFThTzuISKdexqUA1zJAScjMmVh34xA3i7Lb16qPXQgNn+LfPe2phj14GJ2elaQQNBBWIrlir1kbuAAX7HT5nNn97aRanjYFO5YAdlcjl3wfm3LE5cJASmiQBEX3w54L7ugiIL6Mg5Xy+8=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AS8PR08MB6599.eurprd08.prod.outlook.com (2603:10a6:20b:332::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 14:02:54 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 14:02:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "tim.orling@konsulko.com" <tim.orling@konsulko.com>
CC: "auh@yoctoproject.org" <auh@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [AUH] python3-flit-core: upgrading to 4.0.2 FAILED
Thread-Topic: [OE-core] [AUH] python3-flit-core: upgrading to 4.0.2 FAILED
Thread-Index: AQHdJO9+9L62KVT2KU+Ej+OMFVqooraRDqGA
Date: Thu, 6 Aug 2026 14:02:53 +0000
Message-ID: <03F623D6-66CF-47BB-B016-CEF891A5CB16@arm.com>
References: 
 <0101019fd0766ffe-d5e0ac69-362b-441d-838b-ea7141881f91-000000@us-west-2.amazonses.com>
 <CAOyo-86ZM7wu8Dd6h9sj=RQQ4swwV3DEbX3PfYujuTP5bttnbQ@mail.gmail.com>
In-Reply-To: 
 <CAOyo-86ZM7wu8Dd6h9sj=RQQ4swwV3DEbX3PfYujuTP5bttnbQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AS8PR08MB6599:EE_|AMS0EPF000001A5:EE_|DB9PR08MB7865:EE_
X-MS-Office365-Filtering-Correlation-Id: 807f82c5-6a16-4368-bbb4-08def3c37c47
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 f0d84b6SklG532SPzxpgPq9gQQep/Ba+LcbBiESUKwRRMRntjvBLNzmIjECNvyHxyTxreoG41eaYvlj+g/iddAMpuetYcMhoL03yNxbOOa0rvWurM++BsNOk3Ft+4PG90ibjZGJgim1MRtkNC7FBsqDBNkyM0jmSWZWbcI15Gct4BFq/SP9Zdk3Eb757tAJsWQobBBnjYcyEr+PveCRjFE3G/K4yNBGlBOTf1idYqMZDeNy5AlACTyDhvlsokn5xQfjvUKx0Ly9oVgkjU8N7I15aigxlTquzAradnxwwgSjXfkaR8oZhRqR9cewG3gqInG1kVQus5DS7uaRhyx1SWpkxYG60s5j3u62UW3WDb22ioZNOvAMI0uBYym+GiBEqNalLjcJ9SUO0CSgr1PDkZYzbyKEJw8tdPi9wwuCjQ1jg0i+dxO1JO37VgNoLbES/dFuqUwkL9l11nPyFWbn2p2/zL6GeU2rqTSu2ijauEodEL6/paxfyNP+lmxG8QrKCGYtWNMpQ1fod0se/lwJeOHutJXMTxeRrmAbbZpzLg3VfMx9y7yIsMNfOj1inhWxv9i5ZPR77SeBAixZMDBevxC19qSTp70Q95xsB9AeBVEV3/0fzkrN0zFL8N3JMfVbYeZZSZyJqe9vbW03PE6znThBXa5eesj1vfAqePn6uRTaI8oOF7u9kjbfZVl78eODXndcFpZPDvdOkKYLBuACOG0Aw/dI8XTKQEJ7rcAGF80A=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1140ED47A4FBB343A99E0A4246A9EFDD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 qXzj9xW8e2TcyhnWzCk0Is5t8ntthOFzWDEZOL5AR7QBMndMjNxmQ6fefr/nIpo9h3YStfdMmghE8G0sO0EmlAXRDIFupvrPKeI3sQ5MoKSRVXT3LVUiIWA7X7IGeUijya6jfO7uOzhf1mXFJjT1I25OJIIYgI/tHA0OS/bpZ78eR5cZEk3cHX9d4DaE39ZmOVM0JUflVGvdAM1VIWqTQRkG29cIP4bDufR4AwPfJbNnmu3tierr8erxpdKMMncW4V5FCRSwDrrsA7MoXT09I043Sx5O33NEvpB5C1mpFKgskvDOgt7anCCpV4BwY7AA5HodR5DFOzhJ7EUdpkGYSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6599
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	198c23df-e3fc-4f11-da6f-08def3c36903
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|35042699022|1800799024|82310400026|36860700016|23010399003|11063799006|56012099006|10067099003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	kIeNxae7rOj1dfGlmz9QJGg0AQD1nI7mfCHDedKsBulZWdzkVvfiNN+g8RB8lWICif/F67ck1tZgNC0NZlTlnFSX4SFEWmYw7tTYCICe9K5W8bnRbea9Hrr5mtAFBvmEJU0iJjABcI46brZFWWJZpArQKrErVB7krQAmmbfGM/GQgj1nLZzu/pwXGEJx0CGfDrApVEdkRTEGJ068a1jhZ9xdK8xUm6nNyNfodY93t2i5QmntmTQ/x6cqFI83ez+WU4Fxdw9MAVk8BuW3Fh5HtNDfUJAvAV/rpCU7O81w/EUGitoZAeID1eKP/nh2rxb606zayt67C/w4CyRlHcUvm0vMHZERIaDNcdgHfPa5q3vAG1w6GerSWgJpRm6v4dey766W98zSV7Z9kfHPnwXQK5iTmUdHiWvnbiII/X0el8jn3HAqTF+H46uwygZofHcd1uGaU56U3UOll6tDZCT3HIYvDWc9z5Ivxfgdo8tYcra6yjdNRSO3gg6NUcSAbuvpZRqXxpIBlvJEgn/VyJou8XyY4MB4wVnAhXmwzT0g1VEKS7W5fxyZv87pSudgEib/cBm6sAMSQLjgrH5v/6FuPI4Evqjorm5FREFKCRvCyVP4DgxSbbr9qQgqsjklXJQwI7j8XoN0zEaRWQxqtXZv7mnwiMdYNH49CoYufuFXLfDUIUiqk26Bc6EqcYF9IiA+MtEELvKpOiFdWSaXpQQ6Sg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(35042699022)(1800799024)(82310400026)(36860700016)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	FXy3iKJHIdKE2WI/4vbPexJLuxTe1RQ68sLyHivciK+I6gSuoCtRCaZPBG0d0o8SqzTZ3cnmWjA7x0E9GBDAvKlw0GomfY8k9nY2Ai9kyRpntgPuJ7ZPyEA2SFNVVMwO1+bmTh5dGwp1nWizIfuYsv1Wq45kjulrK5xd9xql84grni/UE8Q7LUBgi5U9wcyctKHMglEyM7mVtszKAYvUM6TBgv6ck9qHn1byP7aDi3hKlhCoWkly/HRL07dycTpSdCWFR6rpJ7+GEoZ/0d8eXCZiUuFDCf98p4P6feYfZmYxiICBU6oSL1v4M2DElOrPTGtHE0qFhmO7CAodLbm7CHUOVqejUdowDPJuDdvTiHKpj7B0DLdI9EpTXh9JjZtmNQglL4hAVlD6NXf/vkd+DQbCo11XefRfGPGjGmToO4VNaxwVXw0lzWF1BlwfTMUg
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 14:03:26.1534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 807f82c5-6a16-4368-bbb4-08def3c37c47
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7865
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 14:03:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242944

T24gNSBBdWcgMjAyNiwgYXQgMTY6MzEsIFRpbSBPcmxpbmcgdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgPHRpbS5vcmxpbmc9a29uc3Vsa28uY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiANCj4gU2V2ZXJhbCBjb25zdW1lcnMgYXJlIG5vdCB5ZXQgcmVhZHkgZm9yIGZsaXRf
Y29yZSA0LnggKHJhbmdlIGlzDQo+IGxpbWl0ZWQgdG8gPCA0IGluIHB5cHJvamVjdC50b21sIGV0
Yy4pOg0KPiANCj4gcHl0aG9uMy1weXBhcnNpbmdfMy4zLjIuYmINCj4gcHl0aG9uMy10eXBpbmct
ZXh0ZW5zaW9uc180LjE2LjAuYmINCj4gcHl0aG9uMy1qaW5qYTJfMy4xLjYuYmINCj4gcHl0aG9u
My13aGVlbF8wLjQ3LjAuYmINCg0KSSBzdXNwZWN0IHdl4oCZcmUgZ29pbmcgdG8gaGF2ZSB0aGlz
IHByb2JsZW0gZm9yIGEgbG9uZyB0aW1lIGFuZCBtaWdodCBqdXN0IG5lZWQgdG8gaGF2ZSBweXRo
b24zLWZsaXQtY29yZS0zIGFuZCBweXRob24zLWZsaXQtY29yZS00IHJlY2lwZXMsIGFuZCB0aGVu
IGEgd2F5IGZvciB0aGUgZmxpdCBjbGFzcyB0byBwaWNrIGJldHdlZW4gdGhlbSAoRkxJVF9WRVJT
SU9OID89IOKAnDPigJ0gbWF5YmUpLg0KDQpSb3NzDQoNCg0K

