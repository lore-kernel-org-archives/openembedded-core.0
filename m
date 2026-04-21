Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF39BF8924C
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 10:22:06 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21388.1776766922705251751
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 03:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=sHRFOQXO;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=sHRFOQXO;
 spf=pass (domain: arm.com, ip: 52.101.65.17, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eah6eAFkMO85x7x8i6UnXDpfBxr31oU1rtJm1p7U5HCKisP+fqsvYW05KGjru9cIK2vOYaesQY4R+JEwMbw/z2vnyc2uxpnLCUklzmHeIRo9ZaxQGe1/CMseiDh7WYRQQXkT/qCf7k7whpC0vAqOEhDcP+3vKPD0sjyJ+IOR6nVLI3OwJGLz2al6XPgClf88sdKzSxLWp0RLjGMg6pDvnbUnoGNZ3rszbdjza5gbhe80F7+gai6F119sGq/GrR1JK3PFFAmm2vs8dUp7Qa00VORGP2XBeIe64zzmIuEc+Tf2lO7OzTXeEMLjMZk7f/mjscXEmqzQVSTzZnleqeBbXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yG+1wRpQr1UW8PJHi+EV5PQFZ7tU4l/ER5dOUaOn5L4=;
 b=wcs8K/XxtsPFKq9aFHo/PxkP1xFtzsOOtBJmMNG/o76bsQJ58Yg2Ku1Uw6GGdSCwtWfFBKJK9ehhjnK40+uV0p/eY/RGKkBo9lJ+HcOl/fQJd/KZrL3FHWQ9wF0+lWSiHIEU7t8FgDCKVW6xfmG6dLmhI+qG3/MHGhpqXm2+v6qQjg5cteirywYe2IPnvh4O4dcib2PBE3nDkzMGgpuDYOjveKt53okg61DuJIvKzxIQ4UMTrRWH3AlEecwBYnoEhdko1dnsHPNUL/Amt3NuhbqSzytwViLc1gYaiMkX9Pp7khmmNMuU6Sx6qs6o4ZaW0AhxqpwD/Z2qBgwPbwGC/A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yG+1wRpQr1UW8PJHi+EV5PQFZ7tU4l/ER5dOUaOn5L4=;
 b=sHRFOQXOFSVve2BTacuJDILbd2esAMSwXmMe4ccL+AWAH5ett2tR2Md5XyZsOJ87mvW/8MLHbgxAjQHS9BawGq1nxmgmM86LEOv62lR1kO9MFVImBAlHXahlJ/jQrpddkerQAsOKi0vzu7wtHtejD+bPlyHyBgGG21onQaLW4Qs=
Received: from AS4P251CA0028.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::17)
 by AM0PR08MB5524.eurprd08.prod.outlook.com (2603:10a6:208:181::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 10:21:57 +0000
Received: from AM4PEPF00027A62.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::f) by AS4P251CA0028.outlook.office365.com
 (2603:10a6:20b:5d3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 10:21:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A62.mail.protection.outlook.com (10.167.16.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Tue, 21 Apr 2026 10:21:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2FdAxr783ef86T6YOlpsRRXbhztrUKWGo/I6u5EF/h7Z6+Bv8hir8wlSeoZR/3xnIu1DOarCO69mG5JLY4tORYZHRh9iue7X0sMl66+g5d0S3w7xEVWOqg0syKl3Hl5N5luk/C8snUHsANBEbNIdC+4bUQqqv6JaeOXA8MwBTl526gPJ3i6vqNrsd2JI/jSAtcz3KDrmpXTIoZVT+9x9E50+10tn2fcGk/Lz6EnfUJAjQ7QK4pZg4Ip+YyX69ne+tRFJ8690Jg2TqYYky2PRASJElnqZjc832lu6xNAy0+qYOd+JIrAOxm/moI9Divulpzgj7z+ArlFaEks5lWLjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yG+1wRpQr1UW8PJHi+EV5PQFZ7tU4l/ER5dOUaOn5L4=;
 b=g0R0dyWzXm6/wsFlth/nl2ZF9b1Nvix89GPYqrCBDQ0VlycftNFMIJ7cL13li79EazsAJmngY5yUY2Jbyk3xMmlCogoY6wyb6EBPEfkcXBoaKD68EZXMZDphdmV4RLB6JbUPvpGilJY7/T46j92NluWM9ewX0MImhC/nEEZe8grY3WFqDZH8BKfrPhq5f2Bk71ciYJeH3iilBTGJI9unFhN8nKEVXbnROXO4+ZUiYebYUCRtvDYi6IJXdpBgufQ/7ToNr4In5szqlY9vqK/aIL4kIiu0LZ7N4maN5qOlovoFYG8PpmDE3AO7PxM46PwwI6fY09dq/fiafjXyzS2eEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yG+1wRpQr1UW8PJHi+EV5PQFZ7tU4l/ER5dOUaOn5L4=;
 b=sHRFOQXOFSVve2BTacuJDILbd2esAMSwXmMe4ccL+AWAH5ett2tR2Md5XyZsOJ87mvW/8MLHbgxAjQHS9BawGq1nxmgmM86LEOv62lR1kO9MFVImBAlHXahlJ/jQrpddkerQAsOKi0vzu7wtHtejD+bPlyHyBgGG21onQaLW4Qs=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by FRZPR08MB10952.eurprd08.prod.outlook.com (2603:10a6:d10:137::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 10:20:52 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.20.9818.033; Tue, 21 Apr 2026
 10:20:52 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Ruoqin Zheng (Fujitsu)" <zhengrq.fnst@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][question] sbom-cve-check: question about
 ${DEPLOY_DIR_IMAGE}
Thread-Topic: [OE-core][question] sbom-cve-check: question about
 ${DEPLOY_DIR_IMAGE}
Thread-Index: AQHc0GaemLzXb/DykU+XOV6zj01i97XoExOAgAEH0mSAADVRAA==
Date: Tue, 21 Apr 2026 10:20:52 +0000
Message-ID: <23C1A153-B05E-4215-AE9B-F31D568E2594@arm.com>
References: 
 <TY7PR01MB14803D1141A848F97B5A907368B2F2@TY7PR01MB14803.jpnprd01.prod.outlook.com>
 <5A6DBDB1-9CC5-4D15-A3C5-5A230C2A4F71@arm.com>
 <TY7PR01MB148030FA1EDD0435D3900E8CA8B2C2@TY7PR01MB14803.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <TY7PR01MB148030FA1EDD0435D3900E8CA8B2C2@TY7PR01MB14803.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|FRZPR08MB10952:EE_|AM4PEPF00027A62:EE_|AM0PR08MB5524:EE_
X-MS-Office365-Filtering-Correlation-Id: 47913df2-1730-4176-915d-08de9f8fd15a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 
 +t+PdqO8bdS8wZ918W25cz+dcfhJn9H5VJAfmrW4Py1+M92l7xpRRi1KZH70Vzf8Vy05M/WdHhF034NdE6ai8uscg6CiYGYSDFq4cHiSm5SmN9YNQl0SDrqzmG5udgWPXal28h9aMKgO/3d66Zwz3Km9IfWsdMrufDrUDDfyyaDaOud3AnIYFdZryywtDeKXJwDWZojaY+cQXnKLGy3zWxWxuPhxc0KGfYcsezc+wXwQmLQorRbbflvtsAutm5eLSO3674iNHHxyU/B9EyD2MQM4jVx8ar7tjgmxUKuk2L1xIsIrC6FKl53HivW1JcnB1mB0z0tF/7ELLJGO+m3hhyQ7ZCKs9+FN8xOY3SDfYEbSBz1TeK8dO4geBhiHU/JMtKA44fxZG55cmp9By7p2Lr9J8gFwC+8T4llXgUVxD3iAbOfbqvT8vawL8uhH+nYb22JMUrkM5bvCsWkOa0qnA/cBnRDzSpUYdFmmaj+PH/jatTuFTjL1W9W/BQKmlHlRgl9he+hZJ6n6ch6DZiAmgtsrtatiYSgMW/08yT3v3hJL8M0tbkKGfpnYlsoa7mD82AwPmxaTxijL2iL+pZLZFuuRtYsErLfQezhHhdTNhQJHDS8JDxzkWWeyq4acTLMan7FmT2IxqrOBSKm0dPmsfBHsJwV6S20rHTmnFPfxNw4/+iYQneiJrQOrcJ2qtO4kjM3UOHwdRo/oNBX9n9l7LHyYT50+a74fJxvvSxMs9tcyyNg3KthLdpOZaNxmqhI6rttI4iISzJXAHSFkVUG7Hi1r72wGbsuyFnP8N9RFMgs=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E0E54A716910BF44BA56CC91993DBC2F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 RtQBdppo5zF08Ieg4bISw9IUEJ+/AOE2wF/6m+0uduOAzxBQMEMULqt2AGBVFkhq19fyAppyUO10UiMgqDM9GWxciLJXzZ7RVtOBkiaUT+pCFoUR+8pNIp2QC7wPENkqBsQrjKVFClWw/aE2aIY4Ogg4yfRwx3hSp02didsYEltaxcXB8m71boI77G0MpOWuZ22MzZx+9GOqh5D5UTYV5tqwcjKY+IBj9Uy9c3IJrVRDArmOyn8AovLAtRwtyBDlRmKDvpTxMIUDKmfHA/dm72hL979jIZBoee2gKnxXTYAVrVFKQAo2Cgsff80meUwKyws1dwBpZnH8rUEqf3n0yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10952
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A62.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ddd14c67-4408-4f39-2ae8-08de9f8faadb
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|36860700016|1800799024|376014|35042699022|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	ea7RY8Nhg30TNl395/PnOtgcyPUJqSTFYfsRmUMsIxUZh9/hrOtotIXgOyyaHq9woQj0Hmd4g5hU9oP6p7NH8DJkW6Wea5d5qEfFSQWNKl5R3VYYiu7/yUIHWlsdja0qffUw1rNMgbrb7gXL6Sq6eiNohOcWddRw10dTtLvHVifA9hVwprXr5H0zOjTAo9Y/x4Z9TjRRyojSAx4oZvkY47ZkhtNCcy1HzD7N3m+6Hhdk17hgQwLoOdSFB9VKdSP9TAvv6AJ/PxIARqrvzkmvChiPUHzqv2rm+s+l67Q34MdDBrewx0GjcO6eT78V5QEnMcmaryqUxttFjctmcPjM785qnIZwXTei1nEYHkUTWlg0rTPCzFyMGjdGLk+C8wpHY3su4XlS57MmoEskOZCTsNwFSADFTmmvUm39Qit23mY9LO5D9zSZrAvOYteWHCfB7Uq/PU+iG+3yRbwWR4iRnQ0VWMWpeUvFOlJFG4f517ft4XB2ikhRnQhfN1kd61eQAQRCr9HrAb1mLsG/0Bbdpi5MlLbTS2lfPAeYkQPowVb7HMusMkgL24nCQreREpQx7Oun/dMUetFUxhWubS4TqzGDiEdO8JuaXRZP08CH+KVQvvcHPwzKrJ8u/YGv0H6aRQg22vo/A3jLXLr7dFK7n2Coj3y5kkMlrbj0kRfF/d3lZVlT9awTpwjk/lX/95PjIAZomlq8nLY0pwWHpWALrOovB1DrfU9BvWBKUXfohGxzoxT+5eRCXU6iwourVkQTUTxAcgISwL/9SF1GcfzUhg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(1800799024)(376014)(35042699022)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BnQfu+a808Af/b92BTbHmF/7sBl9MsSOzMcDzMsX6u/gj8eQn2m/BhembCTB1W5SVkBhZg9BmEFkaTWSb1KrBciNbxAKH2R/r/nVRPHnubvdBmQslUtleSt+hLm8jLJaBX9wGPrnz4r7oKJlTVzKXzZKbjzixeKNWUMaWq1vgjlDhaWbJGiu3nmDFexPPEveH2Nc9bxnL38ePPD0ucKW+/il9h07UHX+nfvG/eNi7klYYvhfAGRQbXGfPEq/vmGvLGAQFP+eqtGoMKMbPj4k39jqObKX3tjmq+Wu0FbZxfHabhWL6wd3pR2ITZJM7+90biUQtMGyWkh2YEgOvC/DQMTSl72ZosEgt6Fdp7Y9BPOTPnjxEe7K7E3tNRzduaWLAVvYe9vVZXiyPcPT1U2TuGoHYu4SS6MArnDIHL/6B7n8ulNLKqNiRP6Uyb24Jx/D
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 10:21:57.4342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47913df2-1730-4176-915d-08de9f8fd15a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A62.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5524
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 10:22:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235661

T24gMjEgQXByIDIwMjYsIGF0IDA4OjMxLCBSdW9xaW4gWmhlbmcgKEZ1aml0c3UpIDx6aGVuZ3Jx
LmZuc3RAZnVqaXRzdS5jb20+IHdyb3RlOg0KPiANCj4gSGkgUm9zcw0KPiAgICAgICBUaGFuayB5
b3UgZm9yIHlvdXIgYW5zd2VyLg0KPiAgICAgICBOb3cgSSB3YW50IHRvIGdlbmVyYXRlIGN2ZSBp
bmZvIGZvciBlYWNoIHJlY2lwZSBpbiBpbWFnZS4NCj4gICAgICAgICAgICAgICAgTm93ICAiYml0
YmFrZSBpbWFnZS1uYW1lIiBvbmx5IGdlbmVyYXRlIGN2ZSBpbmZvIGZvciBpbWFnZSwgYW5kIGFz
IEkgdW5kZXJzdGFuZCwNCj4gICAgICAgd2l0aG91dCAiYml0YmFrZSByZWNpcGUtbmFtZSAtYyBz
Ym9tX2N2ZV9jaGVja19yZWNpcGUiLCB0aGVyZSBpcyBub3dheSB0byBkbyB0aGF0Lg0KPiANCj4g
ICAgICBBcyBvbGQgY3ZlLWNoZWNrLmJiY2xhc3MgaGFzIGJlZW4gcmVtb3ZlZCwgIEkgd2FudCB0
byBrbm93IHRoYXQgaWYgdGhlcmUgaXMgYSB3YXkgdG8gZ2VuZXJhdGUgY3ZlIGluZm8gZm9yIGVh
Y2ggcmVjaXBlIGluIGltYWdlPw0KDQpUaGUgZG9fc2JvbV9jdmVfY2hlY2sgdGFzayB3aWxsIHJl
cG9ydCBDVkVzIGZvciBhbGwgKnBhY2thZ2VzKiB0aGF0IGFyZSBpbiB0aGUgaW1hZ2UsIHdoaWNo
IGlzIHByb2JhYmx5IHdoYXQgeW91IHdhbnQ6IGEgbGlzdCBvZiBrbm93biBpc3N1ZXMgaW4gdGhl
IGNvZGUgdGhhdCB5b3XigJlyZSBkZXBsb3lpbmcuDQoNCklmIHlvdSBjYXJlIGFib3V0IG1vcmUg
dGhhbiBqdXN0IHdoYXQgeW914oCZcmUgZGVwbG95aW5nIHRoZW4gSSBzdWdnZXN0IG1ldGEtd29y
bGQtcmVjaXBlLXNib20uDQoNClJvc3M=

