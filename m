Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C677BCD5BB3
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 14:46:51 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18575.1779461207056125242
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 07:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=F+jM6oms;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=F+jM6oms;
 spf=pass (domain: arm.com, ip: 40.107.159.28, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=FHcFxt+D/HupNv/InfMX9yB/8be707j1D3412G3soUYp+WmPtYKMyAVoouAF17O+RVlXg3kPGlO9oawSInwj9/Em/1MFC3vIhz7NN4d/zlzlQiqoeRyF93rPX4k1pHnxUzkEhv09ueAiS18Wbbt4wlYioFs/H/mBz6FcJN+o3bBQckKyIFQP7jQjT8ssoLk1OPva5R+n9ELbtI+ivG7dRd7RbDpk4uWQAlJ3dLo6UNwofbH0PhdZ1rF2Xel2zjE/0bBg2/wQZDmmFT7PDnOmFKVl1g/Q1PNKRDBrKMl2uyQlgbhG7m4Zr5TOSLHCx3QfbA3FHqwqHdfWeLGRA/BT/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=010xvJWpzW6G6esg8ai8+psSIGQtFppUgFTeNdBCoSo=;
 b=GcSRKTH3DOkTKneDXbPmBgPfVKj+ymrIwpPAGfzepjfwaZM8jbTF639r/TZho8EfgS7cf31DJmfYzaJSa85UmZEB+DNU+4lgywAUgvBShCnnwyTDvhy8/rByb+PQQFTI//kZos2k+9w1zOeUCvB6FDsfa6luFZx7qj239f9nARGNiCeRhRb4QNTfVLcpuM7QGr8GmSMS5V3p17Fv5WpUxdPGV+FGOT0cmGuHdEqZaTw2tfbVtroiUhvnDNDnqvub0mXZWpaBVaMkfTQiA02Gls8BfRwLKbjwsUEPs+VIMKPe0iGeAtDfZ/cW4Ce/ezoxzbUw4hzdzPnJPvE/zlLupg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=010xvJWpzW6G6esg8ai8+psSIGQtFppUgFTeNdBCoSo=;
 b=F+jM6omsuszgKKxpaSw84RCng4yO4XYnPLoUTi8LLoKp7XH6iSK0sdXDSjTX3QfsQN8uIN1EynulJ9oljo7Cluqq6oww+jgYbWntqGckS1bF/odJ34wchq9BjOfa0x/0/KocR94pjbKEk4Rb/9vE3XjkpQuVVrgUKN/SUrYJKmA=
Received: from AS9PR05CA0077.eurprd05.prod.outlook.com (2603:10a6:20b:499::27)
 by VI0PR08MB11296.eurprd08.prod.outlook.com (2603:10a6:800:306::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 14:46:39 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:20b:499:cafe::e) by AS9PR05CA0077.outlook.office365.com
 (2603:10a6:20b:499::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 14:46:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 14:46:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aabJBkJcxWrNK/2LtSI7pF02q9AYnzsG1W1OQe5Ti8Zxx7Jv8VybfTx0ezUjmuzZLT66YsKKOx9LthoMA+weond7YmLLk3LgXK+/VBpGKfvRCmkfibxR+M/rYNG+Kq1Is9nPRe/0L9F8mZabGCPaziQNAtQSC/DkRbD9hmmeRpjYQBT+ZjtAZrdABhP3lf+pjp0AsdQMgdNgZnZ4plh9L43qn121kSrqhsZ9fKkkU5S7+goWOS9WsxsfDEVjkVoMXCUGCk2nWuxTAG7AvdF1LEOwTFLWvgdRk3e1SkvUB8wo9KdvmVg+QFEZ7OGecgbEwPoPo14xLANzjh+lKPRu+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=010xvJWpzW6G6esg8ai8+psSIGQtFppUgFTeNdBCoSo=;
 b=HbjsDN1TOOeCFIjHqryYdOtTx4YmC+bAsUsjAOSpmfjZcfSIVOZFavuxkM0XMNDE1+iFg+ycI+bAAL0m0tlBGRuVZ2n88Y3/UggIJsri2KqQNpN4ALUrACxSXA/FmC45IlAvbWYSdDmeBSQP8ymwVQXFl0cdxEDaeJTIQYCe423OVMGnIVy4nSFx8mWlFk7Xo3Nkz9CPN6q/Hyl9f8vupDn7yuUj55MwhU+mjz6mwla2dWXjO6mEI+NOOVnSpQjzK/iin/8NPzfyxbHhfluGudroWzsXXL4fxTCjjxD8bhq1gczqQO6PQfPR2rzBbAD+4doH/Q/CyYyvhRhNiamSoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=010xvJWpzW6G6esg8ai8+psSIGQtFppUgFTeNdBCoSo=;
 b=F+jM6omsuszgKKxpaSw84RCng4yO4XYnPLoUTi8LLoKp7XH6iSK0sdXDSjTX3QfsQN8uIN1EynulJ9oljo7Cluqq6oww+jgYbWntqGckS1bF/odJ34wchq9BjOfa0x/0/KocR94pjbKEk4Rb/9vE3XjkpQuVVrgUKN/SUrYJKmA=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DU5PR08MB10850.eurprd08.prod.outlook.com (2603:10a6:10:522::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 14:45:35 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 14:45:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Hemanth.KumarMD@windriver.com" <Hemanth.KumarMD@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Sundeep.Kokkonda@windriver.com"
	<Sundeep.Kokkonda@windriver.com>, "Randy.MacLeod@windriver.com"
	<Randy.MacLeod@windriver.com>
Subject: Re: [OE-core] [PATCH v3 00/12] gcc: Upgrade GCC to 16.1 release
Thread-Topic: [OE-core] [PATCH v3 00/12] gcc: Upgrade GCC to 16.1 release
Thread-Index: AQHc52DCkeg8iBtACEOgaJefu8oN5rYaJHwA
Date: Fri, 22 May 2026 14:45:34 +0000
Message-ID: <C5392453-7B9D-44CC-9F60-2B1BD60D286E@arm.com>
References: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.8)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DU5PR08MB10850:EE_|AMS0EPF000001AB:EE_|VI0PR08MB11296:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f838801-df2d-4f36-0602-08deb810ee2a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003|38070700021|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info-Original: 
 L825lywcaU41XijrC2gyrG04wXqxXmBC1Sg+CtM57vu5Pd6J1unJVJbK16HzMI3QGhpN8Vf/JU50AqsIAzr7gXh1X8XcIE8b7/+A0wSkc81LtFeRT+eTURy7555TfZsveLxzYUnlInPUkhlp+jiYbOA+rCd9ORXTXjdYxZbfy1I1QsVSZnM7iTBeIb1AG3MDKgRNhwLzy3b1pdQGTGzgOo7cZHCQFLwzSVz8WlDj7pVQLvr5Zg0w+ZF2ZGyBMhb2uW+JSn+zo/pDK4Rm210nX3T9UxSAsuiHISBpM5qssYvILxnAsHIgOlXHNrkZRnHdD7WR8vVnsZw/00yK1gUM+M6x/wh9K49C0VQOF9iuLPlgqJkipU/1/PmGxDLJJG9q76s39NA24Sz6Fh9caLbOV6RY+zuXS1xBpmzquUDP+uR25rVFcFqkT0OiHqFlnp4mqyfFYC/h5DYN6+YFIosRdIlJch/C02VwuhITk/d19254CWGvfbPRh5poDvxExX0XOKJjqqY3CyhOblj9rycaAp/nidLnD7e6gJTGYtuxjXbnvXDql3MzzRB9kZ5SmPjQpkup8iNgwH9sTDgPiLVyVCoSvfKdTPDTdn/NcxCc4Cw9i50/2lswLuKl1ypx69SYkTXSUvDmpvzvouRHOsbK8Ldz4XOmAnOacT3Yf/bfhVeZimk5esACu5hUdg4E2QVP9O+S0vjT6cAOoOr1pg91rOB4boTTxEd76brwfqeeylQPEWBrnOuGrn9GEH7ZZd+l
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(38070700021)(11063799006)(5023799004);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C0840E2123FFC14094EF4B33B739995B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 Q3H769yImTKWaMYchOA2hw2OCRkvgNdt/6e3tnggTesQJw/BxgxQjukFoRA4jKhaV5Z76Mytzlcr02V0e2rHlkX1k55+YR3/w6qVrT4eaezKHzZuX0uwP2A1O3hA4RhhHpCZnGlwArzmAct0GoCW6kZVIVJA0Q+ufM8m6+vQOxSgda+jrUOsejgXUEJgVsn50Ig6D6srOuE0iAaLZWVSHDy3ltzL/CZETNzwlOe/9M7HXvmaiodWUC1XDwRUezKktqxrp1pufXkvO5iGAwfEyql0LgFvO8UMXBTGC5iLO1ur6+byTEF8rQ634CsFhRpFvo/xFJHvkCzQsFrdYdm6kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10850
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e7e611f5-3f6c-49be-6c84-08deb810c81f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|14060799003|35042699022|1800799024|376014|5023799004|11063799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	yOGYBQ28TL4wLQ8bo9hBDbEd9Q0nghjYSxnXnGOrzupZkZCZdCcyvq0v4jA1FdBwQ06Dli72ZDnmqcgAMJi5TQ28rXZOjMRMnWkMe42r78S8H0yybZSb6FWLx9UaCNMnCXhyqOloD2l5/UIH0Om22m070Mu+0ZRWlQ8sTtGccJjEoMOvSxyS0wVMCoGTKjUr6M+zN/gXUKFHDobsAaF5pSABRc96410sflr6wbW/1gDkcDIlfsN42lOHWzvjpERfUqsTIG3NYkJBbBmhp0WqGhuzZ2iq1TatDruF6lEValsZLRchtDs1LmgGmYoBa3OYR+erQlGYDrFy1I7NwMjBRXmzhzmLd96KBw07EUdhXUb1YNvhoc/uUVpcictd/YcFy3IYyN0wncQrS1FtwJ2caRUAkTbz5AUTTq/vHfPLL9yWe85p4W17pV/tYiAlPFEIENM3Y+B5MWIlCfSR/TaxkVfxQGhDORRTVh83XeWWhTXCMlsO0Cuen7mycklAWQrAxGdjsnhD3VZcYKozbh/BHLMO2r/lpoxbAjOGpQyYb40PgyrT2K8GhpdQP2rH7yWKnMoyRtXeFqJKwUeeXhSNvEkUfJZQueej+He9k/ts1YJc+e3scf5D0Cl1iBhGpqhbRKmU0R251HVLT0NRT/q3xLwsmmtKmqLYcIFx47CVDeeWfEILwPFqR6YZTyi1vmmId2BqL7NoFkWcxFVexWKUpMW8sr2tjwC4Qk6AKjPKwIo=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(14060799003)(35042699022)(1800799024)(376014)(5023799004)(11063799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	fip3PoFLeqt8UxH6WwxPzYDsq6bucq8C0X4S/tiaiXXWJhkpsa6xEDrE9x4lmfeU+Mhf44JebZDP61uLqjxVRXpiz8GnB9i9QmIvU5snaZYs/xU/y5CYUbHyZX6T1XTnltmZn/KpR7yPgp+sUEHc9YAcwTnEQ64fcPUPxWl/j5cKVWgQ99ssG12la6AKCsdypOaN6XyuBEOZwq7edR+5Ao+V01s0V5t1/An/kHplAdMl03ZB9wXMip7xymMBRSA2Gl7cXKNjTT0qmMOqLfvYA+FF7vJY3Q7h54G2vL+VM3INtrvd5TCbH5diLNAhQuxP0AyXqPXNZ+o0WYEe551of1fpLvBXJuxIoc3tMRdthmGTrZI8+PIuSIeRYgyEnNUJEWGNdMn6GJem1nZUCslvXmnvjZZS75bSn9CvvEmi3mLEXsQm7aH4sA55gdS6shkM
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 14:46:38.7066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f838801-df2d-4f36-0602-08deb810ee2a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11296
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 14:46:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237554

T24gMTkgTWF5IDIwMjYsIGF0IDA4OjI1LCBIZW1hbnRoIEt1bWFyIE0gRCB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8SGVtYW50aC5LdW1hck1EPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBGcm9tOiBIZW1hbnRoIEt1bWFyIE0gRCA8SGVtYW50
aC5LdW1hck1EQHdpbmRyaXZlci5jb20+DQo+IA0KPiBUaGlzIHBhdGNoIHNlcmllcyB1cGdyYWRl
cyBHQ0MgdG8gMTYuMSBhbmQgaW5jbHVkZXMgdGhlIHJlcXVpcmVkDQo+IHJ1bnRpbWUgYW5kIGNv
bXBhdGliaWxpdHkgZml4ZXMgaWRlbnRpZmllZCBkdXJpbmcgdGVzdGluZyBpbiBPRS1Db3JlLg0K
PiBUaGUgc2VyaWVzIGFsc28gaW5jbHVkZXMgZml4ZXMgZm9yIHBhY2thZ2VzIGZhaWxpbmcgdG8g
YnVpbGQgd2l0aA0KPiBHQ0MgMTYsIHVwZGF0ZXMgZm9yIGxpYmF0b21pYyBydW50aW1lIGhhbmRs
aW5nLCBhbmQgcGFja2FnaW5nDQo+IGNoYW5nZXMgZm9yIG5ld2x5IGdlbmVyYXRlZCBsaWJhdG9t
aWNfYXNuZWVkZWQgZmlsZXMuDQoNCkEgbmV3IEdDQyBpcyBxdWl0ZSBpbnZhc2l2ZSwgd291bGQg
eW91IGJlIGFibGUgdG8gcHJvZHVjZSBidWlsZGhpc3RvcnktZGlmZiByZXBvcnRzIG9mIGJlZm9y
ZS9hZnRlciBzbyB3ZSBjYW4gdmVyaWZ5IHRoYXQgdGhlcmXigJlzIG5vdGhpbmcgZWxzZSB0aGF0
IG5lZWRzIHJlc29sdmluZyAobGlrZSBkZWJ1Z2luZm8gdGhhdCBkb2VzbuKAmXQgZ2V0IHN0cmlw
cGVkIG91dCBjb3JyZWN0bHkpLg0KDQpDaGVlcnMsDQpSb3Nz

