Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 687C6CD8C92
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 15:25:41 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57300.1780932334298901403
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 08:25:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=J88AIwoj;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=J88AIwoj;
 spf=pass (domain: arm.com, ip: 52.101.83.43, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SmgF6lEXuBzlYdo8mCxIHWQI8+Uiw/YnYJ+gBr9JVmxaisDlfKmmErpyUhl5pKUKibG/pgeQ6BxoIFBTFLocTTJ9qA5ufnXKmvgvXtp8hBrRNuSlUWishZKB7lz0CpECtWE6QUcL8Pez017Ch2Gol3kEK8G2970uFuBK0ld8q1YfdqCyXTwnrt4/FZqZ8/fANt4tNNwIuKH83DOzeoX3b/O8hH2PTaBZgVwBnXhpcEhyLdWgSO5VCkI/RWWsBpL4bhv+NW5ed/gqi7DU+ZEtek3Kcn5L2849NwXEqQKuxlj5tJHNNg4dNu6M8hYuxcDLjKgZKK/EvHHFZz+hh018tQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8La7+4XfyCVYkhwbS5ETKUjG0UaYplR2AAFT5fDKaM=;
 b=o7YQI+mXFxhrEK7cJsN9PeL/n9zWz9e66eOXYBUuPa1q3ysu/r2v48egjPMR5zyV1+9voIm7GtWPss6xJoqccgTvUnwM4t6uKhRODOKSTuWWF5gaxkpBJCqIrJRliOVLchX8AbTsx9RGkP104GpMLtwAlfksvFwfZ1WrHHH8o358cIBhPiJPXVsWKE0tDDJjEtImA6s6Aa8HNIVe+c06sK6hbBcQgXrCAHvopgW6PHmN7CYRe60xUzM8KOsGGVj+glPwYWnNvxkzUn4w9YlDSS7qunyQuUyNW0yCJ0B2UAfA+YNcREaKMqDtE4I9Zb6UMw2S88M72g9wjfWCeqQMBw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8La7+4XfyCVYkhwbS5ETKUjG0UaYplR2AAFT5fDKaM=;
 b=J88AIwojMb5Jqb9iJVie7LQ/fl0b2YBdcetDpNjPBLzLa/lY0C04ocnxYRk1iOhMVorH9w1Kr/oUZe9eexRT8ikl3WD2nNfwiSJa8hXhQS8z+owOvU84wJPepPo+c+bjTEl4yaSUDl5ves5KWrPUVZ/f0B632SW0M9v1OpXRwAk=
Received: from CWLP123CA0272.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:1d5::18)
 by AM0PR08MB5316.eurprd08.prod.outlook.com (2603:10a6:208:185::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 15:25:29 +0000
Received: from AM1PEPF000252DF.eurprd07.prod.outlook.com
 (2603:10a6:400:1d5:cafe::82) by CWLP123CA0272.outlook.office365.com
 (2603:10a6:400:1d5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 15:25:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DF.mail.protection.outlook.com (10.167.16.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Mon, 8 Jun 2026 15:25:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YKGFTxzhbsek05ZwhODDuFG08icFvK1ljVPyG2xv5BIVa2NR0ExlUyd1r+mxkwuusPxrfuD/gl5a/NmUwu6i5Fz/AUXmZnBwUtDSzTz4DPtHNIX2dA7H5+GbzBfmeIA2FRjWxF2is5OWp512XzQBb+zPfW6VV/PiIdO49ZFYvTMNP9lN7ILtK4RgzlV44WBEXIfh8y5kMEdK+KT7Q7O7fmaAZI7MDQY+XK9kIBIBzFvsKM5aO34Huf5yeQQUXkOuLseJurygv4gBMG3chpyLVER7bdLK8iGljD3UOP3q90iKB4qsQSOdxR/jc0Iz6CKSY5G0SI884IXgO54jSBcrrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8La7+4XfyCVYkhwbS5ETKUjG0UaYplR2AAFT5fDKaM=;
 b=DFijM/fGjJ8iQF2tfJPQ8ZfwS0trhhyTXLqXwCNQ60Fo34cYZ68L2u4hjeYRbj/NbPH/CPkpCQnbvx34/Kb37DXOdRpN1VHJeznmnr7hLUh1yuSeqs1i1odWOG31C9+GAWNJ1014TGaLzOSdNolL1nE8zg3OafBJ4FLVhZITvQMByabPA76VS3f2nsnOGxswYIUgTlkgFPgwKSFj38loKYlsARnzAjsHrY6sC8JiHQWUSo2stQaxQBQIolJ3q68K4vHWiPuCRPFBmNcevogKcySjy1WLP/Fby1Jv2qjAneaJe1cDRAP6swnnV6WzKHd5Zjr2f9GMRPhEw5ZGYok9Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8La7+4XfyCVYkhwbS5ETKUjG0UaYplR2AAFT5fDKaM=;
 b=J88AIwojMb5Jqb9iJVie7LQ/fl0b2YBdcetDpNjPBLzLa/lY0C04ocnxYRk1iOhMVorH9w1Kr/oUZe9eexRT8ikl3WD2nNfwiSJa8hXhQS8z+owOvU84wJPepPo+c+bjTEl4yaSUDl5ves5KWrPUVZ/f0B632SW0M9v1OpXRwAk=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AS2PR08MB9619.eurprd08.prod.outlook.com (2603:10a6:20b:608::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 15:24:20 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 15:24:20 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/4] python3: remove obsolete skips of some
 ctypes tests
Thread-Topic: [OE-core] [PATCH 3/4] python3: remove obsolete skips of some
 ctypes tests
Thread-Index: AQHc9P47FxnvPr/0SkCV+kD4CvW0zrYwMAEAgASbtoA=
Date: Mon, 8 Jun 2026 15:24:20 +0000
Message-ID: <45363DF2-1436-4212-85F0-8816030B808A@arm.com>
References: <20260605151511.3522627-1-ross.burton@arm.com>
 <20260605151511.3522627-3-ross.burton@arm.com>
 <31be192fad3a35a7ef53344d7a2186f446e38ef8.camel@linuxfoundation.org>
In-Reply-To: 
 <31be192fad3a35a7ef53344d7a2186f446e38ef8.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.8)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AS2PR08MB9619:EE_|AM1PEPF000252DF:EE_|AM0PR08MB5316:EE_
X-MS-Office365-Filtering-Correlation-Id: 5640fb4e-a0e0-4056-60ba-08dec5722bcc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|38070700021|11063799006|6133799003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info-Original: 
 XZox80DbVqa/yapuWEqnuSUoZVb5XUd9P+H4RYUekNZ3DxdZxQu6BwEOMCGcFPDAXXW8zMQOG7sRM/EYwU9eY+OqPcBdY84C7sdvJH78tmNfUkuMNCetJLT6+ZTaY3X6aH78Xi94L+mDFySoO+ExxaGo56gBwkvwwq6yMcpZQS+Q08cPcF0bFwZZVpJ5yjrnBY+M5GHW1OXIFXa2ZFuK8qR/hfviBapavd/Ah/UHT3UaXIO+ZzcsDevbF+MXvrrfuDwUxt4VigXOwb/Yguv5590r9UVX3lIVNxm2+Pow9/pDkG6O7JN8qG3m5b+Bi8MCGINdiwcewh/lWh3WnxZV8i+uUxsyMMPhSiQ/yWfYtqgIHpZB84VfeI77YPQgzYhicd04m3NI93xEspQ+f80nSNe32CYyf6yyQ82MDQ66LYwn3/je4i4bKRC/j53YDsJUSPK9yzwWRmrQudsF7kmo7O8cHbyzXc+uaDtamEJITWm3d+mTrCqEmCH46JMBH8MbbKMLhBBG0SGte70qcENgZzFcZrNA+n2+Oo6Z4tJw/o5bQDWlalqNIGNZaqBvlfeEFH+km/qb0KVL2LLW93F/TanOTVBIQkI0TMALM2u+AejEavuLvtqDPjVf2CUNKSysSspqSQLAK5uT37bE/Ifa+3rgtieJDIwiHCsFm9zWKYbcJi92VMJ2L7pQGFqtl4ZsR65AMpcZCcp0//nzZXqcT8BEf5w8NOLTXwIIwjzvJ81/CYrO1SBkz8pppwVu7Ccw
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(38070700021)(11063799006)(6133799003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <53EBCEE2B1B55040A2B3206848E8744A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 iMEjq+pWuj94xhkectcNej+HcWmWhFMFKiqyaPKc8hMcUNpgokvoYc4hk25Wgs2vUqkB0Aq9Aog+wxtArNxpzplLtL9zbTsA8L6z/doVvI20qkaGci9U2P0ixso+s/F08jhBg6nidttxkSlGixUeEMfg+0pds+QCtAVBwOc2ozyh+bSYpJOv+yj3UphfBtMuoEIoJoaktn/g6pd9okmsD7RbTLxnaSKQn/Q9FSPCCshCExkd8skYltFczMzSqrTxDxfk/vFsqNBHXxJrS96I2F1aRBfKpcz+rTSqPKdpagdzxL3eSsAXtWnJvRtg3WyAUxZIBa9oc0wCQzh206EOvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9619
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	59d97376-aceb-4458-6f87-08dec572030c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|14060799003|35042699022|1800799024|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	s+65RGPB8aTzw4iJX/5LWXYRPLPFaRL1FVcUSjaCyfBYhCpSvTOGHXZAQ9lx4Ems2Q/tMKonIZCUCb7+UFrlxPw9bB0mhZS4Le9fakCCyfLONC7NdUG9eM5ZbYvKGnwXPmGTglzGjiGXh9YuPI7KXPKer54Qr8mMQDex3bviHJxNNSK2xd/aX1sa3e8jeJkadn+K1ZRlEbjOhAvBAvZk9usFAtfJ1BH6xPySRAmuTinlFJWjHvXgwKsBXLxOHZwxG90krwZpVxk8RVstnu0VeARoEtb0fvB7Rm/QqyoPfycSgLfF4lA7njnYqbjUie4cmyO572hIE8TfsSvQgIVIZ9MjToIyNiTfWOr+pngwTPHn11OBKphqFI2tjzvuABcvysNcwMoUan9yWiCjcmRnHo2j7iwwZieVTFEfRif3D/1B0BvxhCUYIn0mlf1oxETVkgel6Bw3p1EOpVkcyIIf1/d6PH7SIcAXAVY/XZ/21XO6bUQZ0gC98XLUeDvcTis9yK/ZZXNBxa5SB/eT+iD6l12rcKNNZOdrrdNu2ApSgKPGn+yQHhm4NixyQqSQWFJR2n4ImkpqWWydLvwO2XbfuoGayYnf3CHoQus4U6qrv8zK5MgQEQwusBq8P5L8WuGBX1tmkSy8A+yfRqVSg15limXSlGCLdBpl/RMuCo1JAsahh1QAsaQRiRKELbeuCPS4lJC2BIMULdOSlSjqz7tWSRwwjvgjk3ZbSOP0TMXzF7s=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(14060799003)(35042699022)(1800799024)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	kYBP3n3IHIThNqJNjaxoE4ldmi5kwXOTFerLrr6NCj7qqKil0XFQhOTHP4vGhmmzf2YoICvBYhtQituwABKjU0+fjnlYPpjSy8f/fhQ9K9WUyd8o16vA8zK5QfD7e6stq3cMrln6VVCQ8rCUhUfbz6iAMPY2oNdeyF5JJEquy0tM676etPz3/mrHTXV8mi+ttdCBqwXx+J8Y25PuEvGqx/xsYHp2VBsZH2aCEZ1V+eWitAB97Fvdd9Wwm1XzxE3FQsrpZnKbSH+V5XZsfxJChaAWsgrCPyCcRw1gAttnlhYN3xKFc0Tvswps5E+46kd8JQ2WKlbmiJyiKQu85VqCJM2RipUOxRTGoHg/oWUwSXHCCDyMbkgCDNR2pCs8AfGMlPqX1aUi4XvVfQU4gaA/whjYaE1PY29r4sxTiSv+dOpXdJrjqr9avZ4Mtay4Moi3
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 15:25:28.4542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5640fb4e-a0e0-4056-60ba-08dec5722bcc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5316
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 15:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238251

T24gNSBKdW4gMjAyNiwgYXQgMTg6MDEsIFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBs
aW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgMjAyNi0wNi0wNSBhdCAx
NjoxNSArMDEwMCwgUm9zcyBCdXJ0b24gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6
DQo+PiBUaGVzZSB0d28gdGVzdHMgd2VyZSBza2lwcGVkIGluIDIwMjFbMV0gYXMgYXQgdGhlIHRp
bWUgdGhleSByZXF1aXJlZA0KPj4gZGVwZW5kZW5jaWVzIHRoYXQgd2VyZSBwcmltYXJpbHkgcHJv
dmlkZWQgYnkgcGFja2FnZWdyb3VwLWNvcmUtYnVpbGRlc3NlbnRpYWwuDQo+PiANCj4+IEknbSBu
b3Qgc3VyZSB3aGF0IHRoaXMgZGVwZW5kZW5jeSB3YXMsIGJ1dCB0aGUgdGVzdHMgcGFzcyB3aXRo
IGp1c3QgdGhlDQo+PiBjb3JlLWltYWdlLXB0ZXN0LXB5dGhvbjMgaW1hZ2U6DQo+PiANCj4+ICAg
dGVzdF9maW5kX2xpYnJhcnlfd2l0aF9nY2MgKEZpbmRMaWJyYXJ5TGludXgudGVzdF9maW5kX2xp
YnJhcnlfd2l0aF9nY2MpIC4uLiBvaw0KPj4gICB0ZXN0X2ZpbmRfbGlicmFyeV93aXRoX2xkIChG
aW5kTGlicmFyeUxpbnV4LnRlc3RfZmluZF9saWJyYXJ5X3dpdGhfbGQpIC4uLiBvaw0KPj4gDQo+
PiBbMV0gb2UtY29yZSBjNjU2NzIzNWNiYSAoInB5dGhvbjM6IHNraXAgdGVzdHMgcmVxdWlyaW5n
IHRvb2xzLXNkayIpDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1
cnRvbkBhcm0uY29tPg0KPj4gLS0tDQo+PiAgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zXzMuMTQuNS5iYiB8IDYgLS0tLS0tDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRp
b25zKC0pDQo+IA0KPiBEb2Vzbid0IHlvdXIgcHJldmlvdXMgcGF0Y2ggcmVtb3ZlIHRoZSBnY2Mg
ZGVwZW5kZW5jeT8NCg0KWWVzLiBCdXQgc3RpbGw6DQoNCiQgZ2NjDQotc2g6IGdjYzogY29tbWFu
ZCBub3QgZm91bmQNCg0KJCBweXRob24zIC1tdGVzdCAtdiB0ZXN0X2N0eXBlcy50ZXN0X2ZpbmQN
CnRlc3RfZmluZF9saWJyYXJ5X3dpdGhfZ2NjICh0ZXN0LnRlc3RfY3R5cGVzLnRlc3RfZmluZC5G
aW5kTGlicmFyeUxpbnV4LnRlc3RfZmluZF9saWJyYXJ5X3dpdGhfZ2NjKSAuLi4gb2sNCnRlc3Rf
ZmluZF9saWJyYXJ5X3dpdGhfbGQgKHRlc3QudGVzdF9jdHlwZXMudGVzdF9maW5kLkZpbmRMaWJy
YXJ5TGludXgudGVzdF9maW5kX2xpYnJhcnlfd2l0aF9sZCkgLi4uIG9rDQp0ZXN0X2ZpbmRfb25f
bGlicGF0aCAodGVzdC50ZXN0X2N0eXBlcy50ZXN0X2ZpbmQuRmluZExpYnJhcnlMaW51eC50ZXN0
X2ZpbmRfb25fbGlicGF0aCkgLi4uIHNraXBwZWQgJ2djYywgbmVlZGVkIGZvciB0ZXN0LCBub3Qg
YXZhaWxhYmxl4oCZDQoNCknigJlsbCBmaWxlIGEgdGlja2V0IHVwc3RyZWFt4oCmDQoNClJvc3M=

