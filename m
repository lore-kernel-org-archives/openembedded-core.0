Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833BCFF5137
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 19:44:59 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.90021.1775591094392033251
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 12:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=O+V6suJM;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=O+V6suJM;
 spf=pass (domain: arm.com, ip: 52.101.66.58, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=x6y5BAupYhoRUD9S0BtCAL9wZtc/XFTJQ8A53ocQTTrsZSn//PlBiwAtGz60H/ubDKrQl7lCDxLVo1Vj/jNFG7RAtfDwpGbD8N/aQkbGSc4aZCkRLgYwv9jV4HuzlBkMz4i9C4hkY5b+pmhIQb0Y/StEBuhfAdvR+/sIQWs8Wumv7zQrGPWW59xlsKzyxuzfSgUoq93ikejVLs0cINFuyvO31+3BNFOwogJmMZt3EXJvPxVxme6WJ+m4/yrrpHQEMdc42hn4rd8WRUMyRA2kBVRyXTNBXphPHoDinrN3Dad9TpprDFWG+HaNSQghwUC8bYFfTzO+n9AZEucvrvgnMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gf+3uCWPUQYIztHp38+0vhUT4KipTtzJJ3FoUhA1v3I=;
 b=K+ElPFkpEXTt6tb+cjHLpKNRpE9sT6SX+D9VsQwzRC0VQq0KpXg+hGBZ/Kazu3XCRi2puv2FgsDYwt2NcsFKWRirEpUcs3m7kg56YAbL/XD9GVwIDHC7gnDrzATC0bLOgyztdUTKSJEa9lSuy3n9Iji4ILc0bhYe6K7YBJEdlOy9LArRSYml53+1d+X5P7ZHMO0qinCOztYu3mLQyr+pFiHylMGYky/ZykAZ7cyiUR6SMakbFzXhc7dFtVXSRBfkbQTFYt3+HhdRxqgfJb2JRJEnLuSgv36JCI6KzOediV0V17+Gil85GZztx1HdaqaN7q9p8NdUVytDaT01xJ96fQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gf+3uCWPUQYIztHp38+0vhUT4KipTtzJJ3FoUhA1v3I=;
 b=O+V6suJM5ibYrx4s5HMLDanaZv0v64DKJ6JXNKfpItXg8jXOOiZzjiDNEQPq2Esy8caHLXmez1cStzFikWQou/VoGydpyqoM2x21EONSiphvu5Lm1JDKfwbT5mBeu3PtkBOGy8E0AyhY/QxYU6oW5+zcOKJMc0lUS9VwDM96IM0=
Received: from AM0P309CA0001.EURP309.PROD.OUTLOOK.COM (2603:10a6:20b:28f::35)
 by DB9PR08MB7559.eurprd08.prod.outlook.com (2603:10a6:10:306::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 19:44:49 +0000
Received: from AMS1EPF0000008E.eurprd05.prod.outlook.com
 (2603:10a6:20b:28f:cafe::28) by AM0P309CA0001.outlook.office365.com
 (2603:10a6:20b:28f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.6 via Frontend Transport; Tue, 7
 Apr 2026 19:44:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000008E.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Tue, 7 Apr 2026 19:44:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fawP/LNb3jrX0iM3xhREzwvaLtM5zuA8Qy/bYKj76ZW6ZvQkSCvc10BG8EgZ85I5f1avph1EwJ9H+PnFt2BR5FIOlS5O+TXq+i4FnE3PwuukpJEcPiGOtM+mt3RdwxpObnHfwGCXdKBn7RrxzmGi58MkS7aX3EXYt38ZYvrtdI5r68ZiD1A8Rz/azQQGTUKHB8XPfwrL5raFYI+2zDM/3HT2OTN9d0dvad8zUddlAWDqYGxPSPMZ+D38d1AnRvygsRkLyz36XxLWjYMncj6MyK+Xyzd9okxstumuUrjnVOx3gJF4ol5qxz4qkqf3fcOM8XCWHGCXJncd49Sy1LQMLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gf+3uCWPUQYIztHp38+0vhUT4KipTtzJJ3FoUhA1v3I=;
 b=CREm4TSkH4kHEvP6jgi5+xYI4YANNpCqJEBnPKot23zCa9Ywvq4NLpADXjoilR9QUWzyRWgf7oauLu0WI7eYrZy3YkcE2nCzrbo4GQDFEG3CtRA7N6SEpCS+pr06CpR/GKZKCHV05gcE4dZU2CYMQh5XzjzaTvmR+dq+eDWKkhS6PIkqTnwlNN+Eo+jyUz8h31j9wvtP/kPc9DNC2zGdUGQbmSZWcAUYyO7WZSOd13Y/3QGaFc21qhnQWvrO8702kK6Pc+dURGKOCAQlHQzKPMqDvMSoVNMOnmUSuYm5R2DL2kRoEoiZeRosdFxt5FC0xJEfUTfkTv2Dv/3y+yTKPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gf+3uCWPUQYIztHp38+0vhUT4KipTtzJJ3FoUhA1v3I=;
 b=O+V6suJM5ibYrx4s5HMLDanaZv0v64DKJ6JXNKfpItXg8jXOOiZzjiDNEQPq2Esy8caHLXmez1cStzFikWQou/VoGydpyqoM2x21EONSiphvu5Lm1JDKfwbT5mBeu3PtkBOGy8E0AyhY/QxYU6oW5+zcOKJMc0lUS9VwDM96IM0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI0PR08MB10989.eurprd08.prod.outlook.com (2603:10a6:800:24f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 7 Apr
 2026 19:43:45 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 19:43:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/4] autoconf: upgrade to 2.73
Thread-Topic: [OE-core] [PATCH 3/4] autoconf: upgrade to 2.73
Thread-Index: AQHcwEkuuJbbEojj402/35w4QXkmo7XHEnCAgAOaiQCACWAYAA==
Date: Tue, 7 Apr 2026 19:43:44 +0000
Message-ID: <3D2C57DF-F779-4AE1-8DED-F12EBB274DC4@arm.com>
References: <20260330132825.1784802-1-ross.burton@arm.com>
 <20260330132825.1784802-3-ross.burton@arm.com>
 <FDFC46B5-DAD2-4885-BA62-AAE6F2389F03@arm.com>
 <CAMKF1soVrVe3C7G4gzQA5-w07NA+yctDiNED_YpwPObdorYeOA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soVrVe3C7G4gzQA5-w07NA+yctDiNED_YpwPObdorYeOA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI0PR08MB10989:EE_|AMS1EPF0000008E:EE_|DB9PR08MB7559:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b52d85a-cd01-49ff-7b48-08de94de20de
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 mCLNtXOmGkAXS98OAVs15NBHYU0OSYHFwRrcSMoXu0yXn+TeZg58Lq72dYtfxnmtvXWVBrcvF4kf0sOWulAhuD7I7tQah56UAvrgLXqy+CkW6bKuTsY7fPdOThic1CUYQ8vxmaICYpblL1AxTjCClXQDAoJ0qyzynpamRlNzGaIK2c9POsyQsBI9KdRj3QTcFOhdAudMsRihSnpo1UTGxZDpQdYctd54XFni1HZGayQypEaIOfYx51yzulH8H2gGCwmVPW+lp6UPvPtf7WDhhs488uP8D+lcvlk1sROx5O4mtgk+vKnrBHHkAM7OOKFW5hWLCOraN5tfjCTUNz0DU3j0OUTeYQIPvSqUKsjPWN9Un5ipxjBlS6Fpy3OO2fsY11S9vOIm4N887i9d22r9cMT5fFM/zUrWR5gEJhYfg9HdgS48n4HX7o+mGvqspmmOpfmgb5IWDJhPrNOwuqmGyDrTSS3wZxqjoluh2RstYo9qwpbKAwn2ggmFwL3Czt8jvOuITtubT76FcgKRXpNRZcMy94Tkdyhvm6NaH7GnR6+x5JchrC1h5LGcYE+5FbWI2zI8kTBo88U5VOH4vXn+vpLMwlvLoj2wJGrLjLjpVY4rIGOAL2MX/i++Jx6fa4UuyMBoQof7OHwRxd33AHbwXbL1bHGHmRwFneEvrt/vcs2MXtPo3ioMdMv16M5AqO4iaygvTrhlvPmQpmCXgK9oTkW85HWKAylIHbfozERHwq0=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B334291DA64FEE4A85E1B66A4307E0DC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 eFoDcECbCX6jPW2KpTV2a8HK/NiwylJqXl7H3pbH65k08dop+TuAf7Cxan0v0hrHCGcwJgiJ6osLMPf5OQLr6Z9U8xf2f/A3KEfIP9m+5naMWC4N57QoBfiw6tSqzTYrxyk2MLMGtd8HLU8kEqQ7l9LCZMPL/qbYJKSrlPvTNw5gjeNkiVD0LHtiekMNkoj3jp5Qx0qCoZgbaFOrdwXFOOFp2tjrR+bwEIJl/X2psU/4SwbMdZNSRGj9yxgj0/gzTYQhKboB3MubmKyErpbOEIFMclKou39TVeDxUFRh/a5ZHS+CWtTLBNrTH1fphIW/WwQCiOLpsKAxzO/Z31JKKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10989
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF0000008E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	961d59f2-2bfd-48fa-2001-08de94ddfabf
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|376014|1800799024|14060799003|36860700016|13003099007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	zs3vEfmVL/Ls+WvS/9Os12FOyCd0DRKpIk+IwyE3FH3SdDTuW40AAwOMPUZuB7ihKyz9RIojZwWVuAT32PVfGaLqgvc4S0wtX8mHCUACc+wNHobnuOxR5gj9cXxFhqnSt8KZ6zkTD/L6KC9Ij3+lN9S5n/ZSs3voAf3JravXChg2DnqzGDQhQ58tC4lni7r2aqZaWsXD5+Lrpvoh8UlZuPZdwMrJ/h5B2x+Bf52XHlscbIBsiKbczZhH2MAVCd22E2cH3tZsu3EsuV1X/ctNe1HvoX+vSNjm7i9IFJJKQ+EL8SWOvT//8wRt2eeKNJwLb2PR7m0yagAMXRVnUe1a+crayl0ssDPRNc8RrrxTE97hYUGO86l4yYDFuLm5IdWVE9LxVrMpUKKRbfGzRb7E4qnoBb3t8rUXGK1sjPo4vr2/R4iqkl+BGDXn0h8/xyRztxIVupG1XG4tZ1MWNFP1abp3mL9Z4ThVu7ArN+irBah7Uqfcrs5cHxuec+q5bXs48+3IaSYSAOqQEKzV0EQnh1xZeBCEsqZ8ptAc8JuzCPo5+Sl5m7q9/YUrFGG3287fFirVLkUrAOc+SFLST6RpeHB12UQJqt0TbIhdu7ta3so56EM2UgfHvo44dNMhboD8gigkvXtGDVbvrsJbPZYK/ObxgME/GzpOKdr2wz2spmMlV9lkBBsMEs9ZeE4YifbqYw+7PFsAZ4f04RxwBm4qmw==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(376014)(1800799024)(14060799003)(36860700016)(13003099007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	EIt0LQymKjzas/PEORqHsHi+Y9td1qRb95uHyVo9eRw8XVokX64f+HYsQ4ykSuAzC2MerfmvRemiArlyVDwvojjV8pnCaqeh/PYEUyRIIN4vrfKMe08mawt3hfhkDEYLmFCTQmpFUu/AJfIx81Q86KQBtsRns0SRrB61yni3C1d8VoTjU2EvxTMR8/zLrUqOMcTgfH2LM6dh1qkrME10h4/KmOclvFQ9QXIUyn3/bwJHmucQA14rEug1k23w7wLFFenuGVfXCjVTUrwX/sGrJBAzj1Ilc03m6FfTJB8VfIt4u4PLeNEaofTD1SLQhL6qURl6TFV1P5F0EuNbVeuO+hC3eZBdXKg2ekJzqxSWx6L/RxLC7tBAb+OW8zkpgjMR2oTvaiLpJBxcefwIKaKsICGutLJwZGg7lv0p3+mXJpARLHf0Kb+x5jNOmb7FJ/oh
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 19:44:48.7855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b52d85a-cd01-49ff-7b48-08de94de20de
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000008E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7559
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 19:44:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234778

T24gMSBBcHIgMjAyNiwgYXQgMjE6MzMsIEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+IHdy
b3RlOg0KPiANCj4gYnR3LiBUaGlzIHZlcnNpb24gb2YgYXV0b3Rvb2xzIGVuZm9yY2VzIEMyMyBz
dGFuZGFyZCBmb3IgQyBjb2RlICggLXN0ZD1nbnUyMyApLCB3aGlsZSBnb29kIGluIGdlbmVyYWwg
Zm9yIGNvZGUgaHlnaWVuZSwgaXQgd2lsbCBwdXNoIHBvcnRpbmcgd29yayBmb3IgdGhlc2UgcGFj
a2FnZXMuDQo+IHNpbmNlIGl0IGlzIGdvaW5nIHRvIGJyZWFrIHF1aXRlIGEgZmV3IG9mIHRoZW0s
IEkgcmFuIGEgYnVpbGQgaW5jbHVkaW5nIG1ldGEtZSBhbmQgdGhlIGNvdW50IGlzIDMwLTM1DQoN
Cg0KRGlkIHlvdSBtZWFuIG1ldGEtb2U/ICBJIGRpZCBhIGJ1aWxkIHRvZGF5IG9uIHRoZSBBQiAo
aHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMv
ODEvYnVpbGRzLzE0NDIpIGFuZCBpdCBtb3N0bHkgYnVpbGQgZmluZSwgYSBmZXcgcHJvYmxlbXMg
ZHVlIHRvIHRoZSBUTVBESVIgc3BsaXR0aW5nIHRoaW5nIHRoYXQgeW914oCZdmUgc2VudCBhIHBh
dGNoIGZvci4gIElzIHRoZSBBQiBub3QgYnVpbGRpbmcgZW5vdWdoLCBvciBoYXZlIHlvdSBhbHJl
YWR5IGZpeGVkIHNvbWUgb2YgdGhlIGZhaWx1cmVzPw0KDQpSb3Nz

