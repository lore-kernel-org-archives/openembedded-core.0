Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02703CD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 16:27:02 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16522.1779294418367250447
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 09:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jGzkWBtK;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jGzkWBtK;
 spf=pass (domain: arm.com, ip: 40.107.130.63, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=m62n6x1q7EgQDhrVK9tbyxz/H9CGuafUO+7zUuAsd+Gw7aQGXT2BOdZYeRf6+AXZerfK/TlXinGQfj0KLpvN6Gvt79uV2FkpV8RfoSnd7DZNs3/QwuyA1lX+qOqhPfyCJz0EjBgy/cNfJ7hR61c12cJIhkLpXK6snC6wjQ1/L4nDpxood7260HCpRjJstUYNQDYo6FLoSwU+4E0YwT7FWAZMUOlsONFXLRyGDnwkk2vLSxti9m3RP7fLfjbe0woqj7rXYCmGZ5euMLf/tDpcPFFOZqs9K9p41VkZktAUWMsr6W2nNgpxZLhOj4hKoEWeBmWYiLzrbUq8rcA4WDWnJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFArvGuCNuGOIef+A8l4KstZGy0ATKme8jFjLkofVY0=;
 b=XP3ubyOvrpt2yGA46ebezDwF01S7vpwdn78UvVuUzYAs/xpFaaP2v0Bh6N6yIGVO0iUZBIofIQzZ6vCnXOUQnIs3DXnUYYSr0pzyXBA+364Nx8oTtsjtYQt1U4vduzx3U6ymA4Mkxaes7royKnEKCg0od0fwZKdJWsd12zg84VhZHw/XtcizMn1CCa1+TxCAOg8Jrumm8H7ATOevzF209cximy9SCpKCXp4aLiyyVVWrjpEN9wFoLVJq4/5Y/PZwTQigWkVlpfggmdLoYbRAbZyYBvl5toXm+S0z0unBGvcWK3ZmVp7vcAG+tftaDNcq4U5dz2AX+u+lSD0r+vN67g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFArvGuCNuGOIef+A8l4KstZGy0ATKme8jFjLkofVY0=;
 b=jGzkWBtK6kQXJo69P57qPEy0ORcJ0Wvx9SbZVc5J1mUWI0ZU3blBsBkNWggUnnKDcMe+voa3yQtkzSIl0fqTNK9TIU5hTEhTAwtH7pEJaokRdPdWqedJTKAuNmmqebcs8VLWO3Cir4Tde302mlkz6Ebmc4tzVdlRBAGkin4Fehw=
Received: from CWLP123CA0010.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:56::22)
 by AS8PR08MB8062.eurprd08.prod.outlook.com (2603:10a6:20b:54b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 16:26:53 +0000
Received: from AM4PEPF00027A64.eurprd04.prod.outlook.com
 (2603:10a6:401:56:cafe::55) by CWLP123CA0010.outlook.office365.com
 (2603:10a6:401:56::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 16:26:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A64.mail.protection.outlook.com (10.167.16.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Wed, 20 May 2026 16:26:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lr6c4MKaaK9Mur/jG+6xeE8po+sdZiNwOoj/MvmVF7U6oIzB0m5uVRuxle+BAebE/H6NR/B6xPmLQc4l6XKbS420OYxPFYwNm0SRFmyvTcr+3xzzUWEFntWRCCVB821VnO8F4AjMNtGu1+sxjr73dwovImU1uhg7AFzZ7EDKKVy13ALOJWQWMyj8sS4tI9IAjHu1ETWipVYO17zH+LQ5QjmgoFrz4Y8pjgEe1DwUJbV6HS4pX4dGLQYjFnmrNgrVWp3BKvSXU87RJ56dvC+9ce+6f9FyO8EqzunzI+Ph9aVwtPB1TalHo2w+BrO6em5Ad4hKEihhiRCpLxGnlm0Oag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFArvGuCNuGOIef+A8l4KstZGy0ATKme8jFjLkofVY0=;
 b=rDDG0cY47lBObHDFFQAP7KEjL6q3gnrwID8jdKxWbCN/9FvdLLeBGVltD8GDiXtA9GGCloSoXRUyGlYQBjs5mFbf+p9kfF+NvwLM0t53Q7ks0wfIO1yPm5GMVuyo0Tdn0scDJWfyCLh/d8kAHyXaPCrgjBf2XIQy7Sr/5KqtYf+Nm0zBwT+Nq7AXxFZqMWArjFEMmbE2e0T40dafpguONZKzQhkKaF5X1XaBAKD4Renp0Q46YKq6t3DHbPOvbO33LDE3sUvp9e7mqPaO9XxtnfzV7icJBJc8dHNAya9PUM0CW/dmTpJmpMeA/xvn1hehS6mEUqSK3jX91Tzi22ct5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFArvGuCNuGOIef+A8l4KstZGy0ATKme8jFjLkofVY0=;
 b=jGzkWBtK6kQXJo69P57qPEy0ORcJ0Wvx9SbZVc5J1mUWI0ZU3blBsBkNWggUnnKDcMe+voa3yQtkzSIl0fqTNK9TIU5hTEhTAwtH7pEJaokRdPdWqedJTKAuNmmqebcs8VLWO3Cir4Tde302mlkz6Ebmc4tzVdlRBAGkin4Fehw=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AM0PR08MB5300.eurprd08.prod.outlook.com (2603:10a6:208:18e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Wed, 20 May
 2026 16:25:49 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 16:25:49 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5] rsync: add ptest support
Thread-Topic: [PATCH v5] rsync: add ptest support
Thread-Index: AQHc4FOsZExjYLVCKUOg0Y5s4d+G47YXKe+A
Date: Wed, 20 May 2026 16:25:49 +0000
Message-ID: <459510A7-6D97-4879-A185-A2B440523351@arm.com>
References: <20260429-b4-yocto-16211-v4-v4-1-211f27c4daea@gmail.com>
 <DIAKXED37M90.4QX504G4C9DW@bootlin.com>
 <20260510-yocto-16211-v5-v5-1-6fd2a2b2234f@gmail.com>
In-Reply-To: <20260510-yocto-16211-v5-v5-1-6fd2a2b2234f@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.8)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AM0PR08MB5300:EE_|AM4PEPF00027A64:EE_|AS8PR08MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: cf19746c-ff6f-4cfd-6eb3-08deb68c99e5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|3023799007|18002099003|22082099003|56012099003|38070700021|11063799006|4143699003|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info-Original: 
 imCJdl9E1S0dyVyiPVjoidmZba8Ub9vOp2F8gd+SlFOmXXU7F3Iz+f2RU+JAkCkA0dlRfs3s3Zrmv1OYZAh5S9GxbkaUDUNbjh1v2R9QYV5oN0Pw/LlfMhGe8aHVxla7rtUFZZmdPs+h8vC+4t5pD31Rls02+WCsZABgIKQzsrvHfn2Ez2m1ClvwiRsyd4yWyyYn1QGB7SbZWmZni+kBPY/opkaJgDP+68Jeh5yQI2eUmaJRukXCzUwOsnaiamob9uG8OAD/Y3nBNfIFyUA2WkdV+lmM6RPtfI9e98C0Jrd9eTyEROC9tDP0Qd0bJsMyFKQsUkqNTcFxQ6+lcXwRNEBwlBwKjAw8La+h8oshFqgHTpLof15PbCtiseAomoIeJefAghx/dmparMU7PSfqEcgCT9lqhBkrT5XdPtkKmKrao/jn5JWfJjPAy8yzyMkOoYwbez2Wc0Mx9WOINEQf4sb4mUzCL/OI230SZN2AgvpKq2wLaisi3UOinEALDisYtoCcxLAWKpuArW9v52kxgZrbDTyi4GyKzsV5bbCwkiPHvMz31hiyTNuGgjN7HlQZB2IqqwxA0szt2aPSKilFYY7abtpL2lTWcp0hbHjQl3eCylE30/5cDbfxaRs5fcuMypPsoAYryQhzNmEqxqLkCHWOqts2k65aeHZSZc+y5mny3kT1xaRciY6OXN7RRe99F5X7W0BlicgqcSZk7QgBfuiYXUYukJRuk7AI/TpMkewnvGBNyjow743HqT+hZRqL
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(3023799007)(18002099003)(22082099003)(56012099003)(38070700021)(11063799006)(4143699003)(5023799004)(6133799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6FA61A144C35DE4F88BAA1EF5E8D15C3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 JAO5oOEYOVhS64GeNOhpjdK/Pnqt56Kj4/ovOW5XhJ1kTjhRBYL2TZjGi3HCyAyRFJpFaCJ3pwFCdMNzClVPXOdxpl/z/FhnSCSHQ/S6xGV6UwrnkJc8XNSWVwbvlQWoi7fCRk75hoDjfu3NmxVeLxAXnk84st0OJCKLVoxdhF/Sl9tKof04I12ZYSjxm95CPgTDGRjlhdT0CUz7L8ehDaXwLXi5B/ApfSn+g9uWUhj7o0gtXcDGJa6+QQ6InwGuMkZM389vSltns6XGRRkoPlRvcGJAJCfz7OM29PT5lJdAr2eR3Cipru6RhSlJKNIrqkkiqEFpeK1ijIsNLs+Y6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5300
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	98e14385-324f-4b50-6fe0-08deb68c743d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|30052699003|1800799024|35042699022|376014|14060799003|4143699003|56012099003|18002099003|22082099003|11063799006|3023799007|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info: 
	KdnrVm25rlBpy7BwnQq/WhrPN4yqnGDMYEL43jJlEcGaB/RgLwumxEZqi3LMyk5eFhQNuUhXnoTSAtir7U8pb00npMP00LSMhDPhcQAJbpHxcvoI4vjaeDNB2uQ8w3gYYOMZIY6jzr6eqdGloYskCP661vQZ7e7HYyl5Eg9OewN2KLQupgPVfmLwKV341iPgw1P/nXFOWP3pSKpxipURYATSMgxKWqdUqyoMTeHz9TMNAdHMoUSfs2bJRoEIrRIgft3LtkxcwJQxvK8i8wSLKDNc0tOLCatPP2Hi72kv1g/WZqMGzOYe3pa9iKX+YpSyg8G7LQf0rFSskWEkDH+wOOJh94XPUn+ML5PCDNwpbl6HPvGps7mU3/CGG6ss0LoNynqsFeRsqjS9752LAgaHqjvjNf0gnVEIS/SVnZxnWopv9zH7ug9DymuHQOeoHmyoj4B4XkWdCH2OiHDAnrmrJMx+Gh4p1qRbuDtiLwwgQSRUrEI9mQ22kibSB0c+ou77n8Mw4OE5cofhfVP/eWRDwcn8eOTXvEXjP4Eniw1LcxO7+/odYTxWKdpVgKEqPQjnhqRh0igHbL4M2P26XDnSnvVMAYwee3AIKOrs0ZqAZPQyQNTkDrqq4cCn7jLEb7j+zowj7XTPtwwqZw+zUMGhlFmeVOhGWN5bS23n4yRVrv91bpMVm++xGUi4/8LPBzTcnIvxeWtsm1wzrBRjoqxDiaxp1lnLl53jWQ4nlwTLO5o=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(30052699003)(1800799024)(35042699022)(376014)(14060799003)(4143699003)(56012099003)(18002099003)(22082099003)(11063799006)(3023799007)(5023799004)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Dbr7j1qKPcId54EGIIRcBv5rNVoaYJ+S6VXe5/xa+Ar4h0JafaPkeDXvMjyuGDRyuL5cCirBJxUbXtUFw0K1CsEz5Jrlirc7yOs9mgE6F34UkTLMJp+VzyN2c9rLhL6coZfTvXvKEI+PTaGA3Fm2HoNnp84il1PrF/xt31SsBOgyv3nMarpRhd9YS489OlIsHcK0hYf8GQJx+GrmD9X2+VurG2pdvVAaHLgnx3jebjiKxcuP/C2tHUpMRifIUPHQ3GK1ZQVAYIyANvq1cEwSZvtYhr41Rtdm+AYwt7c1EUK26utCd8+qd9t4lZ540RCdKICh1TKpV5+nSlpU1s4VN4m9XrKldJK2Irn3og6lt26W13IOKs0WsG9E5EMONGt2wO5nZw1+nxPyxANQbzpe87d9c3vanLI70JyfrEUCCcQb1VdQTjQjzQg8ztXfxwyp
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 16:26:52.6299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf19746c-ff6f-4cfd-6eb3-08deb68c99e5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 16:27:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237455

T24gMTAgTWF5IDIwMjYsIGF0IDA5OjA0LCBKaG9uYXRhIFBvbWEtSGFuc2VuIDxqaG9uYXRhLnBv
bWFAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IFdpcmUgdXAgdXBzdHJlYW0ncyBydW50ZXN0cy5w
eSB0ZXN0c3VpdGUgYXMgYSBwdGVzdCBwYWNrYWdlLiBUaGUNCj4gdGVzdHN1aXRlIHJ1bnMgcnN5
bmMgaXRzZWxmIHRocm91Z2ggNDkgZW50cmllcyAoNDEgUEFTUyArIDggU0tJUCkNCj4gY292ZXJp
bmcgQUNMcywgeGF0dHJzLCBkZXZpY2Ugbm9kZXMsIGhhcmRsaW5rcywgc3ltbGlua3MsIGRhZW1v
bg0KPiBtb2RlLCBmaWx0ZXJzLCBiYWNrdXAsIGJhdGNoLCBldGMuLCBpbmNsdWRpbmcgMyBDSEVD
S19TWU1MSU5LUw0KPiB2YXJpYW50cyAoY2hvd24tZmFrZSwgZGV2aWNlcy1mYWtlLCB4YXR0cnMt
aGxpbmspLg0KDQpSZWFkaW5nIHRoZSBjb21taXQgbG9nIGhlcmUgbWFrZXMgbWUgd29uZGVyIGlm
IHRoaXMgc2hvdWxkIGhhdmUgYW4gQUktYXNzaXN0ZWQgdGFnLg0KDQpXYXMgdGhpcyBjb21taXQg
YWlkZWQgYnkgYW4gQUkgYWdlbnQ/DQoNCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9yc3luYy9maWxlcy9ydW4tcHRlc3QgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMv
ZmlsZXMvcnVuLXB0ZXN0DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAw
MDAuLjA5Njc4YmY4MmUNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnN5bmMvZmlsZXMvcnVuLXB0ZXN0DQo+IEBAIC0wLDAgKzEsMjUgQEANCj4gKyMhL2Jp
bi9zaA0KPiArY2QgIiQoZGlybmFtZSAiJDAiKSINCj4gKw0KPiArIyBydW50ZXN0cy5weSBob25v
dXJzIHRoZSBzYW1lIGxlZ2FjeSBlbnZpcm9ubWVudCB2YXJpYWJsZXMgdGhhdCBydW50ZXN0cy5z
aA0KPiArIyAoaXRzIHByZWRlY2Vzc29yLCByZW1vdmVkIGluIHJzeW5jIDMuNC4yKSB1c2VkOg0K
DQpJcnJlbGV2YW50IGJhY2tncm91bmQgYXMgd2XigJlyZSBzdGFydGluZyBieSBpbnZva2luZyBy
dW50ZXN0cy5weS4NCg0KPiArIyByc3luYyBlbWl0cyAiUEFTUyAgICBuYW1lIiwgIkZBSUwgICAg
bmFtZSIsICJTS0lQICAgIG5hbWUgKHJlYXNvbikiLA0KPiArIyAiWEZBSUwgICBuYW1lIjsgcHRl
c3QtcnVubmVyIGV4cGVjdHMgIlBBU1M6IG5hbWUiIC8gIkZBSUw6IG5hbWUiIC8NCj4gKyMgIlNL
SVA6IG5hbWUiLiBUcmFuc2Zvcm0gb24gdGhlIGZseS4gWEZBSUwgaXMgcnN5bmMncyAiZXhwZWN0
ZWQgZmFpbCINCj4gKyMgYW5kIGlzIGNvdW50ZWQgYXMgZmFpbHVyZSB1cHN0cmVhbSwgYnV0IGl0
IGlzIGEga25vd24tYmFkIHRlc3QgYW5kIG5vdA0KPiArIyBhIHJlZ3Jlc3Npb24sIHNvIHJlcG9y
dCBpdCBhcyBTS0lQIGhlcmUgc28gcHRlc3QgZG9lcyBub3QgZmFpbCBvbiBpdC4NCg0KcHRlc3Qt
cnVubmVyIHN1cHBvcnRzIFhGQUlMIGFuZCB0aGV54oCZcmUgbm90IGNvbnNpZGVyZWQgZmFpbHVy
ZXMsIHNvIEnigJltIG5vdCBzdXJlIHdoYXQgeW91IG1lYW4gaGVyZS4NCg0KPiArICMgVGVzdHMg
Y29uc3VtZSBhIGhhbmRmdWwgb2YgbmFtZWQgc291cmNlIGxlYXZlcyB2aWEgJHNyY2RpcjoNCj4g
KyAjICAgKi5jICAgICAgICAgIC0gaGFuZHNfc2V0dXAgdXNlcyBgY2F0ICRzcmNkaXIvKi5jYCBh
cyBhIHRleHQgY29ycHVzDQo+ICsgIyAgIHJzeW5jLmggICAgICAtIG1rcGF0aC50ZXN0LCBpdGVt
aXplLnRlc3QNCj4gKyAjICAgY29uZmlndXJlLmFjIC0gaXRlbWl6ZS50ZXN0DQo+ICsgIyAgIGNv
bmZpZy5zdWIgICAtIGl0ZW1pemUudGVzdA0KPiArICMgICB3aWxkdGVzdC50eHQgLSB3aWxkbWF0
Y2gudGVzdA0KPiArICMgKEVudW1lcmF0ZWQgZXhwbGljaXRseSByYXRoZXIgdGhhbiBnbG9iYmVk
IHNvIGZ1dHVyZSByc3luYyByZWxlYXNlcw0KPiArICMgdGhhdCBhZGQvcmVuYW1lIHRvcC1sZXZl
bCBmaWxlcyBkb24ndCBzaWxlbnRseSBjaGFuZ2UgdGhlIHB0ZXN0DQo+ICsgIyBwYWNrYWdlIGNv
bnRlbnRzLikNCg0KVGhlIGNvbW1lbnQgc2F5cyDigJxlbnVtZXJhdGVkIGV4cGxpY2l0bHnigJ0g
YnV0IHRoZW4gdXNlcyBnbG9icy4NCg0KPiArIyBoYXJkbGlua3MudGVzdCBlbmRzIHdpdGggYSBz
aW5nbGUtZGlyZWN0b3J5IHRyYW5zZmVyDQo+ICsjDQo+ICsjICAgbWFrZXBhdGggIiRmcm9tZGly
L3N5bSIgIiR0b2RpciINCj4gKyMgICBjaGVja2l0ICIkUlNZTkMgLWFIICckZnJvbWRpci9zeW0n
ICckdG9kaXInIiAiJGZyb21kaXIiICIkdG9kaXIiDQo+ICsjDQo+ICsjIHdob3NlIGRpci1kaWZm
IHBoYXNlIGNvbXBhcmVzIHRoZSByb290IG10aW1lIG9mICRmcm9tZGlyIHZzICR0b2Rpci4NCj4g
KyMgbWFrZXBhdGggY3JlYXRlcyBib3RoIGF0IHRoZSBzYW1lIHdhbGwtY2xvY2sgaW5zdGFudCwg
YnV0ICR0b2RpcidzIHJvb3QNCj4gKyMgbXRpbWUgdGhlbiBnZXRzIHJlLWJ1bXBlZCB3aGVuIHJz
eW5jIHBsYWNlcyBzeW0vIGluc2lkZSBpdC4gT24gZmFzdA0KPiArIyB0YXJnZXRzIHRoZSB3aG9s
ZSBzZXF1ZW5jZSBmaW5pc2hlcyB3aXRoaW4gYSBzaW5nbGUgc2Vjb25kIHNvIHRoZSB0d28NCj4g
KyMgbXRpbWVzIG1hdGNoOyBvbiBzbG93IGVtdWxhdGVkIHRhcmdldHMgKHFlbXVyaXNjdjY0IGlu
IHBhcnRpY3VsYXIpIHRoZQ0KPiArIyAkdG9kaXIgcm9vdCBlbmRzIHVwIDEgc2Vjb25kIGFoZWFk
IG9mICRmcm9tZGlyLCB3aGljaCB0aGUgdGVzdCB0cmVhdHMNCj4gKyMgYXMgYSBmYWlsdXJlIGV2
ZW4gdGhvdWdoIHJzeW5jJ3MgaGFyZGxpbmsgaGFuZGxpbmcgaXRzZWxmIHdvcmtzDQo+ICsjIGNv
cnJlY3RseS4gUmVwbGFjZSB0aGUgdGVzdCB3aXRoIGEgU0tJUCBzdHViIG9uIHJpc2N2IHdoZXJl
IHRoaXMgcmFjZQ0KPiArIyBpcyBjb25zaXN0ZW50bHkgdHJpZ2dlcmVkLiBUcmFja2VkIGF0OiBZ
T0NUTyAjMTYyMTEuDQoNClRoaXMgc291bmRzIGxpa2UgYW4gaW50ZXJlc3Rpbmcgd2F5IHRvIGdl
dCByYW5kb20gZmFpbHVyZXMgb24gZXZlcnkgc3lzdGVtIGFuZCBpcyBqdXN0IG1vcmUgY29tbW9u
IG9uIHNsb3dlciBtYWNoaW5lcywgcGxlYXNlIGZpbGUgYSBidWcgdXBzdHJlYW0gYWJvdXQgdGhp
cy4NCg0KQXMgSeKAmXZlIHNhaWQgYmVmb3JlIG9uIHRoaXMgbGlzdCwgcHRlc3RzIGFyZSBwcmlt
YXJpbHkgZm9yIGludGVncmF0aW9uIHRlc3RpbmcuIFRoZSBtYWludGFpbmVyIG92ZXJoZWFkIG9m
IDEwMCsgbGluZXMgb2YgZnJhZ2lsZSBzaGVsbC9tYWtlIHRvIGJ1aWxkIGFuZCBpbnN0YWxsIGEg
dGVzdCBzdWl0ZSB0aGF0IGRvZXNu4oCZdCB3YW50IHRvIGJlIGluc3RhbGxlZCBkb2VzIG5lZWQg
dG8gYmUgd2VpZ2hlZCBhZ2FpbnN0IHRoZSBiZW5lZml0IG9mIGhhdmluZyB0aGUgdGVzdHMuICBU
aGVyZeKAmXMgYSBzdHJvbmcgY2FzZSB0byBiZSBtYWRlIGZvciBwaWNraW5nIGEgdmVyeSBzbWFs
bCBzdWJzZXQgb2YgdGhlIHJzeW5jIHRlc3RzIGFuZCBydW5uaW5nIGp1c3QgdGhvc2UgaW4gdGhl
IHB0ZXN0Lg0KDQpSb3Nz

