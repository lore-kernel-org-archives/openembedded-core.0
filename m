Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EECDC79F82
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 15:02:39 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9609.1788879752983887118
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 08:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XKhtmL5x;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XKhtmL5x;
 spf=pass (domain: arm.com, ip: 52.101.66.63, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sc/2lz4cz1l5Cpenqj9ev3cVU/pSIDJq/G0nmoyzcKE+LtQsvTO6/vu7hspP+dg9Cf655u/tid+AQMM1MFN+Goy1/pWX9CjZxCJhjuENJ26K0Rl9t9X3xNQcq7UoLnUO+mXWhzDCatNJa5CK11FjTqFYFxLpSbmbiHxJeOwr2Q/Az9epdCpiIXeNzjzV3O+uszwKls6nJsSjRRTbzDYG1f8H7ysqccs4ZC+3a7rjZOifvvkR2jRPX8aa1xl2dMFkBYyrQ5sIdpb/ZaRHAReNoIfD2mShxMthWPWRdhmWQyFJahI/QgY8xeeYYvcZ7uQf47BY3CBCQNRRDVBKFb1bOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1pMMOulJbDv+4qI9kgk7sJl4fi1xed+rWltZI2Xen0=;
 b=q8AtKab1SsRIA1YZqAsHW94VCPvzY8jG7emcyXsfUidftpDGengp2DTqNMpMVGcb+VCBkhq0e2Kc9jUOZLQ4GuoBQDznfWBOZDLlQ/U8/opNGlwksTaToDr29jUyxL0B0QDy4M/eZqYUBpjT90VM1yAoMKAGQgp2MpiSJrSceuQytDQ0Kox0wWa9+131bZonshA7uUZh0C4aGX+zJaIm1YLax0MBZjO/vJp+eqpWQcxPGBUIUTnvL47RDguWX2wVo28xGAhrjM0bNPRfOJAZkBISKWMQF6nLo6ccG37TaPyXgOLMi8fez1voo8lEnuL2Qw7c76MiDs+xUjYj0L6W7g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1pMMOulJbDv+4qI9kgk7sJl4fi1xed+rWltZI2Xen0=;
 b=XKhtmL5x1OyLEfKpwzz8JPZG4etGZ4Rs49HtnZj1h0h9CoENZ/YUrygBs+DsB5dHs9NLezU2ik9K1VLpyASwpVP9UQPi2kNe1H1vSXmPU+7FEa5SDzr3pJrBNtQiuZaZinEeuY34XTb3a9w/fasJgGdDdxrsexmj+NheSBUeydM=
Received: from AS4P190CA0010.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::20)
 by VI0PR08MB10391.eurprd08.prod.outlook.com (2603:10a6:800:20c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 15:02:28 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:20b:5de:cafe::af) by AS4P190CA0010.outlook.office365.com
 (2603:10a6:20b:5de::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 15:02:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Tue, 8 Sep 2026 15:02:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ea2cghZ6Oz7ZuLK513zqBbrQYQ2qytMTAcyE3WtAWNVg+vkDwP+feQkteE3WpdynkM2Pj5Bs10CSVms4olAoETRA4ySvPc402eppLQ5198h0Jv1CgVBC6ob9qFidF00hmtfKYz/SAykMMVDVDVBerXRceTnXnXoPMaDu/C4X5zsTNvxGAyafF85D95bvCr9Phk68QJjy2iazSHqDoHVoE/caFUMHUx8bJt0HQN5I0JrKWTqwchOa+grGG6O/WOvHT1N7NFe6Q/Z8X0dMWXv4HMpbV8ceOccAPU5zcMbtajTUgnQMaGOZGR/OCt1Itzq+0ZBSR6TTkY4h9d4PC1VLpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1pMMOulJbDv+4qI9kgk7sJl4fi1xed+rWltZI2Xen0=;
 b=sUYaHGLcBjJXXAiD/aC62xr5cLN6G6zstAdU9uJB7sTTfXN1uVNJKRbNVw4K8uy8vQAG4CVgIZZJavGvO5rPOXWD89HhGiT8NR/im7LvsYWnWUNIvs0OQjC/BxdYQObdu5/u2701CH+ttKeSUlfkHt8aA/ARsSJu07Kj8RlxIhJuALiq1ShH6x7UpcIAsfezwmFD8X3FRD6fcZF0dBgpU2pdbzVH2OARSGSM54RDNWQX4lvuJHtW4mPmmKWwEedAZoSUy6gG7TrGEqE+ZG6L5MXMSuZaX7BnNrbTofhgTV5ICn7j//htprvwCGx7o8CeMW4UGtMxDkwR8BxmYbV3+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1pMMOulJbDv+4qI9kgk7sJl4fi1xed+rWltZI2Xen0=;
 b=XKhtmL5x1OyLEfKpwzz8JPZG4etGZ4Rs49HtnZj1h0h9CoENZ/YUrygBs+DsB5dHs9NLezU2ik9K1VLpyASwpVP9UQPi2kNe1H1vSXmPU+7FEa5SDzr3pJrBNtQiuZaZinEeuY34XTb3a9w/fasJgGdDdxrsexmj+NheSBUeydM=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by GV1PR08MB10853.eurprd08.prod.outlook.com (2603:10a6:150:161::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 15:01:54 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 15:01:52 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] RFC: Semantic change to PYPI_PACKAGE
 in pypi.bbclass
Thread-Topic: [Openembedded-architecture] RFC: Semantic change to PYPI_PACKAGE
 in pypi.bbclass
Thread-Index: AQHdPsotHpsQEOmoNkisC5fn/txMM7bEyFSA
Date: Tue, 8 Sep 2026 15:01:52 +0000
Message-ID: <14956EB6-0E04-4267-B7CA-AD9E92EDEFD6@arm.com>
References: <18E925A3-6509-4631-86DD-7420C1B3C18A@arm.com>
In-Reply-To: <18E925A3-6509-4631-86DD-7420C1B3C18A@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|GV1PR08MB10853:EE_|AMS1EPF00000048:EE_|VI0PR08MB10391:EE_
X-MS-Office365-Filtering-Correlation-Id: cffe8609-1bd5-483f-2ecc-08df0dba32dc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|6133799003|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info-Original: 
 7ZnofUFMHaf2xPFDX1ZL+ieHa+yw3JMmMLmn5NGAO5gtaKgLYiR3Z9LOMb1m6Kze8HB+A91E3vARrPze16Ckl4EDlECQZYffVWwSA79AO9VSNxC2HDFycljR/zXHLHxyIdWOLYl2ylQUM5wF2Hlit1KP+x9FweeOLqUyraw1v3nV/2kqNMvxua7BO7hp/0hFMfiFxwC+EDWJ96YErMP+G2ogMYXtL+RiJP5j5LKFaakVMPOToV1YTYtIYBLGbF7n+bXig8bFiAFlVkPn8GZy2FtjIVuIicU1twoegQVMt4lo2szxEUt4gHn8fsFTegexjBMA1NJ1H/nJL3GpH4+qtJf4B6816mI29xwnw4M/FUgcAz30B3/eXSBoNe17/DNYHtBOo+G8c9/pkyTdsYUr5eu2OOBGp07wfTAAbLVW/+aTOFDF6MODAA2Y9N+t95mrT24eZ90SxLLc38KC6MmCfVC6mUqkQpGYNjVWU2K6VAjAH+ZKVamz+TO+FHOsRjmipp02cjyKtXkA6n3Ht0cICcBQXV3osygj6BobtiM/YBuYxuI4CA8fA9dwaOVf0bKWBTqywPsh7iE8E05lg/uY1ltPhF3OsWnzL+qg6/1dI921z0mhjolGjTUQffu8AHDAZkJGGNg03wjNmw81QJEiB5aTFql0Rm+5jInd5Cx5cFA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(6133799003)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3FCD2645D9576E42AB84AA3C8FE6226E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 M/V9AgoAI5zLLkTO1FFPXACz2BYYEhnt80ff74bpGOsaRJx/B+pgTWQiJluABAdNxI++xZCuoxh99XOvpxtlRTQhyRpfUYgiA8utRjZHCENTfuL2syF2ZFpO5RzT3JFJiye37vfSQn9LWyrexy1HgqnCJUNX00GW1vy6aYIQnYr8A81rlCvB678tppMVAW6i7iRQ4gGEZDnObJ2M8XWnE/i5N/jzNra7LwBSmkaEBwdDJUdiql5jgDIJE65cv+qmEiyAJa9DmaRQkYl7eoin35RrX/t1V8ZJqVcqRv0VFdtIDxP6QEyS/lGt20AtNUjaoWZ2Cjc2DZhL2MX+hkx/3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10853
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8daafe45-b726-4728-6606-08df0dba1d8b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|14060799003|376014|23010399003|1800799024|82310400026|35042699022|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	0aaVrnRogzN7d37xfM9Buwlj1dkCHiiMFjJZoqKPc3Px8aRqUu128Qovv/qc8nhwWw/ZVjL0XT097XIb/JHhPShg2+OPKUbWmqJ2NJofF/2xwXrHxk1Xk2kdae5rXjKYyNFrQvT9q2Gnx/Vz7BatKLrtfbgNrESV2QHAWsvhnfaoWp+myOttuRzHHr87TWJf1LbtC+Bm52lfjKxrYLOlRxQGqBhFfxy1MmIhCPKPCyASZwX9mUMH8whsd/Hn4jjtW43yoArng7yhQZzw4Sw5XDwIYYIyP2G5qQfS1cAODzJisAkzKwb2/UzkhZcAWPWtLbLYG/k+/I53DYqWZcaFjjSY71gCO2VTASND5Z3ZQe3cO/lLFGbmWszh16UA7GeTDh5qmqA/okRoC2zNGKZ5kXIUTP3T1fKjqPC1e1Qf6wFD26z9joJFKUY6G677brSBP3qL9LipH7xE183C/KJ08ueWa/tQmoZ3WJ8pMujdyF6bDzeeXGoz2hoOgyR05w5fnXTF/XXxeUMP9XJf8+jE01ud0onSsV8GSYGi77pmWdU7URgGhoT4JEThrvovQV4o4N3mWrWUo+jJGoskYY9kOBnqC7R1JpB6OZDGSolGbg1uyzQNWhJrSgYbhLO/jHBZ9kDXvaX12JoDeW4+Wrnzdw==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(376014)(23010399003)(1800799024)(82310400026)(35042699022)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	voo5JvqbLrOIYouPWMEwZVXPppHmAl68C2CH4vamuSCPoA9PduVGfzmJiJ/T7RkpCBRtj/YlFf88OS3vTUQCSHR9j3p0hd2PWczmuWuguVhWfEqDsZJrjqyKlvNZV3cElSMB5DDYoxmsSFT9Z83ZXBwLI05BH+osR763jtNwLxBAg3kTNR1yeMKJwUhSDkWLVTNqpvp0kaRlc+efaQhVUGNv1HHVr+Ld/ArGnqYU6jem6wGm1E6bWafdqxtI11KdT29ocyALTl3vjqcJhPSjOkjOPgeOz2g6Aj39mMJeRCKUINVR52n4cU8z/e3+I5tK33lhid6QjxaYSix90UzA0y2KMqSCpEMD9o455eqf52k4/c40aAjj6T9NjlnOxhygqmQ7vYFSwppVARmYfvmdeXsxUTFIq6xXIikVb6l4NJvg6KrZRKy1hj5m+ft2honF
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 15:02:27.7826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cffe8609-1bd5-483f-2ecc-08df0dba32dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10391
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 15:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245376

T24gNyBTZXAgMjAyNiwgYXQgMTQ6MDksIFJvc3MgQnVydG9uIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxyb3NzLmJ1cnRvbj1hcm0uY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3Rl
Og0KPiBJIHRoaW5rIHRoaXMgaXMgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLCBidXQgb25lIHRoaW5n
IGlzIG5pZ2dsaW5nIG1lIHdoaWNoIGlzIHdoeSBJIGFsd2F5cyBzdGFsbGVkIG9uIGZpbmlzaGlu
ZyB0aGUgc2VyaWVzLiBXZSBjb3VsZCBzYXkgdGhhdCBQWVBJX1BBQ0tBR0UgaXMgdGhlIG5vcm1h
bGlzZWQgcGFja2FnZSBuYW1lIChzbywgamluamEyIG5vdCBKaW5qYTIsIHFlbXAtcW1wIG5vdCBx
ZW11LnFtcCkgaW5zdGVhZCBvZiB0aGUgcmVhbCBuYW1lIGFuZCB0aGF0IHdvdWxkIHJlbW92ZSB0
aGUgbmVlZCB0byBub3JtYWxpc2UgaXQgYW55IGZ1cnRoZXIuICBUaGUgc2Rpc3QgaXMgYmFzZWQg
b24gdGhpcyBub3JtYWxpc2VkIG5hbWUsIHRoZSByZWxlYXNlcyBBUEkgdXNlcyB0aGUgbm9ybWFs
aXNlZCBuYW1lLCB0aGUgaG9tZXBhZ2UgbGlua3Mgd29yayB3aXRoIGJvdGggb3JpZ2luYWwgYW5k
IG5vcm1hbGlzZWQgbmFtZXMsIGFuZCBpbiBhbnkgZnV0dXJlIGF1dG9tYXRpYyBkZXBlbmRlbmN5
IGdlbmVyYXRpb24gd2UgY2FuIHdvcmsgd2l0aCBub3JtYWxpc2VkIG5hbWVzIGFueXdheS4NCj4g
DQo+IEnigJltIHRvcm4gb24gdGhpczogdXNpbmcgdGhlIHJlYWwgcGFja2FnZSBuYW1lIGlzIOKA
nGNvcnJlY3TigJ0gYW5kIGVhc3kgdG8gZXhwbGFpbiAoaXTigJlzIHRoZSBuYW1lIG9uIHB5cGku
b3JnIDxodHRwOi8vcHlwaS5vcmcvPiwgb3IgaW4gdGhlIHB5cHJvamVjdC50b21sKSBidXQgdXNp
bmcgdGhlIG5vcm1hbGlzZWQgbmFtZSBtZWFucyBtb3JlIHJlY2lwZXMgd291bGQgd29yayB3aXRo
b3V0IGFzc2lnbm1lbnRzLiBGb3IgZXhhbXBsZSwgd2l0aCB0aGlzIGNoYW5nZSBpbiBjb3JlIHdl
4oCZZCBubyBsb25nZXIgbmVlZCB0byBzZXQgUFlQSV9QQUNLQUdFIGZvciBweXRob24zLWppbmph
MiAoSmluamEyKSwgcHl0aG9uMy1weXNvY2tzIChQeVNvY2tzKSwgb3IgcHl0aG9uMy1xZW11LXFt
cCAocWVtdS5xbXApLg0KDQpTbyBJIGFkZGVkIGEgUUEgY2hlY2sgdG8gdmFsaWRhdGUgdGhlIFBZ
UElfUEFDS0FHRSBhZ2FpbnN0IHRoZSBidWlsdCBmaWxlcyBhbmQgaXQgdHJpZ2dlcmVkIGEgX2xv
dF8gd2l0aCBjYXNlIGFuZCBoeXBoZW4gbWlzbWF0Y2hlcy4NCg0KSeKAmW0gc3RhcnRpbmcgdG8g
dGhpbmsgd2UgdXNlIHRoZSBub3JtYWxpc2VkIG5hbWUgZm9yIFBZUElfUEFDS0FHRS4gV2UgY2Fu
IHZhbGlkYXRlIHRoYXQgYW5kIGFueSBmdXR1cmUgZ2VuZXJhdGVkIGRlcGVuZGVuY2llcyB3aWxs
IG5lZWQgdG8gYmUgbm9ybWFsaXNlZCBhbnl3YXkuDQoNClJvc3M=

