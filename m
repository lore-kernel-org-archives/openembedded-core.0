Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6950CD8C9D
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 14:06:39 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55490.1780927591517003509
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 07:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RT18WT2d;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RT18WT2d;
 spf=pass (domain: arm.com, ip: 40.107.159.20, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YX/JDRXy3UDJkLSYV9ImJohexm0115jIqTn0WKs155ZK/b40xoQWY6TDX5wy9f50PuZK1ozMoaFMydp6QpQWJ/dzGxAHttEY3/2kEQgA9XB8LSCFgpxVJdlhYerZN7wtFU/sX3rtbASzTmzQ70MeIlzlu6g9sFYJPCMeejTDqPb5DlcBlv8toJn5IXdx+eZPx9qDke7vOuBx/CY+x52wDrCcjm6P58aTVECGd5xijjZAp03UerDtceUgwHR1g6cWELvbyhA2gqqpr8DkhJRmm3xR2TyxBLOEtsAfsY/A2Ht0rZhZGaCTtiXWvkvRnn60gK2jfo1vtVlNs98X3Ne0Xw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5goJlJwxcLawIw2EEj+pu0Uo5wyUNX5YalX556cpgo=;
 b=KToKsF0bsE1Us/IIlwbYsxdJc56FST2b0NxFWZqcdJNCiaffKOpKSbZCYtRfcHtkRcjVXKbJRP7TD0/5TCoAnHzcUbJ5amiW5CpPSzuJFWoAnIfjb7z1HadpAl9vfaxBkC/yJXR6Re6/N/fE2yO4t1VD9IllFXM6qpuECw6U5xTqwdvowSzvHXUHCwN9nD3n5qGsOrei4Hf9sx4eSca9SyDgvmWavZ/kM97l7cop49eClVkKlZ0Ap1aYnuwX3tKt+NfbaHao++8YATJDydDTyBKSuBCqTZWqUDyqISP8jvAlpp3emU/WAGLicoUoX3uCzmkvBhLsMRsGnjVpRzU7WQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5goJlJwxcLawIw2EEj+pu0Uo5wyUNX5YalX556cpgo=;
 b=RT18WT2dgU+qt9G17QFP3bi4F8E5WCzI7v8AvsYzvpk+DPqlRFqGZosvKpe2hG9qbYHSIxFW/FUhlQsmQq7tvam/8MBXb7WyOTiU1XhDsEfGb6AvBIK8AMuQToeSoNWdQcOC8d9UwBKS/Z9bihzmGqhlYJAL5a/NS64Hb71ZUyE=
Received: from DU6P191CA0036.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::23)
 by DU0PR08MB9728.eurprd08.prod.outlook.com (2603:10a6:10:444::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 14:06:26 +0000
Received: from DU2PEPF0001E9C4.eurprd03.prod.outlook.com
 (2603:10a6:10:53f:cafe::61) by DU6P191CA0036.outlook.office365.com
 (2603:10a6:10:53f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 14:06:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C4.mail.protection.outlook.com (10.167.8.73) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Mon, 8 Jun 2026 14:06:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yHwPrRR+Hq9J/WwIOBLa0poNpO2Fm1AHD0EXmRpcG8wF75zNxvJ0oLvfkcjQiHj2rrdBCxnw18RY951oQVS9ka2Q73aIX7aZ5sjQ/EW6C30/jCFk7FQRIbBTVga3xH0dmlpTY2Z8BkqEJeqehi63R1Dt/+oTFctg01PzTB2ILBZm6L9VaGQ5CA67pXYPdQ78WRWo4Jia7kBTt23sd0P0pA0ZKC/hJ3rrRl0VCdlbFbhalL9HrOOfF5e8E1oc7uyjGgKptAfL0+BcZReQx4+gviaMetu1C5ySZU+pTh0H6NrWNve3C12WAgyBMfGiCtzlnKVd+EAk/gkTRLUagvG+Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5goJlJwxcLawIw2EEj+pu0Uo5wyUNX5YalX556cpgo=;
 b=rrp4qFYA8v3ixGrmGgOPmgSX9kNk1AEAAU4u/Irk/clNBEvTsa/GhMTGEA8lka6QPzmRbkcV7j/9Gh0H+oIpJvOn5CmGFoNKUXisflacDunhy+jHCmJsMYyHQPCn6nqafHNL6TQGJp/cbc5jErXHurRpUZvPtd9vPEt/Aq1FcuBieEM7/MBUB9bAiqzl+vL4hVdEGhOcItNZ9w9XhPMSYwkXUaDe/kRiLR6YtIPGEoIg2dvjx7w79Kuqr8R1UCrtf7XNmPFHkCacMf7bubZ4S25vv96e0dvmqUWBpuC3kGdLFnX+T/2dFmMMM3sdnR4QU3S8nDUWqUc0qXoNp86t8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5goJlJwxcLawIw2EEj+pu0Uo5wyUNX5YalX556cpgo=;
 b=RT18WT2dgU+qt9G17QFP3bi4F8E5WCzI7v8AvsYzvpk+DPqlRFqGZosvKpe2hG9qbYHSIxFW/FUhlQsmQq7tvam/8MBXb7WyOTiU1XhDsEfGb6AvBIK8AMuQToeSoNWdQcOC8d9UwBKS/Z9bihzmGqhlYJAL5a/NS64Hb71ZUyE=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DB3PR08MB8986.eurprd08.prod.outlook.com (2603:10a6:10:42b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Mon, 8 Jun 2026
 14:05:23 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 14:05:23 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "pratik.farkase@est.tech" <pratik.farkase@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core] [PATCH v2] zstd: add ptest support
Thread-Topic: [OE-core] [PATCH v2] zstd: add ptest support
Thread-Index: AQHc528RiFNlWtb1BEOBSdCxye0NULY00MYA
Date: Mon, 8 Jun 2026 14:05:23 +0000
Message-ID: <F519FFC7-722D-42F7-B099-E6FC356B1675@arm.com>
References: <20260508083451.11094-1-pratik.farkase@est.tech>
 <20260519090816.17783-1-pratik.farkase@est.tech>
In-Reply-To: <20260519090816.17783-1-pratik.farkase@est.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.8)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DB3PR08MB8986:EE_|DU2PEPF0001E9C4:EE_|DU0PR08MB9728:EE_
X-MS-Office365-Filtering-Correlation-Id: 56fab871-7cde-4f18-5e34-08dec56720fc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|6133799003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 
 jn531E6Sg0hGAQ7TKes4fHnONdbukeW610SZ3NKwfDjTm3pEfDaeCBzmXj6a8Ljd7eVJbookICCiRh/rv8Wg3/cPxu+qSCdXPU5xNy4YXXgAX9Qe0jrlZ0JPc2dL55mMhGpOIS0Its4erAXq9qLpdRdtOt2y0OnKnMwqh/z3sLVbEkdNyLBGnLltcg+KRKrASRPYYU33v3nk9aJX0Xt+BW7YyoanpEhshOiR3Dc3CfdXQ91yzVgzzSY6ZV8Vv35yivlwS0I9iDAG4KFAGtzO+eGH+MFIQOeXJdJW77wNpLQbUtQaGtYrLWILsdmD1Qiyh27PDB/es672sWx7POzxPsQ3aUnrUaepPg3T/ZZ2+pBjY5sPaRPeyOoDvo+QRY5tMGr4/LRgqHjRbEas5Vom+PLEA9Hzy6VJ9J7CKhDo8JKEQ+dH5GBOKyRiereeSrsd0dnWv7+LP5ai7CJBwitfzoBW5XtyrzWNj0JRIYn06ktCeN1u1MqNkjr7LzmoGlpiY++BQztG1CkgljIOBtZJZlg4omhav0yHQwJsplLDcI2aXscqDsm7HtiQoLL6wB7YOg+7gzwqni7UQOtCz80+MRUcD9t4PVi4uU4NjlGqo9LGK/75x+uR3yI9vA5CLb1qYU3P03XWaEQyiAC2Ioa4bCHJTEJnKrIdqsdqD1zAhRu5506SUquYMasQmhuWgsEK9ng463mO45yYKd/WTA0NhZ1UCYKFHwh4Ef60n4ar5hjlfMRr77hcxtXB0s1mJUh2
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(6133799003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFA37C03B500AE44A40F7906C387B3BA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 SjhnPM7hGprfA6OwtvjiI/ysJ4aoZ0gsycSInSobCBVjyRPglqnHXbomdgbXzrm9ikUqLil0E0JCgylImNWY4DiVYeT57togUf0zdZFfyKe3r5CMLjZV9nyK1nA09ogMjNF4pngmFQkC2lBv/hK+odf3LAbMiJvFEtjdlCJtBbEq2IRyTsc48aR51Ot9bRCE7+yfjFRtPimAN9Fu/0gApFr55I99TJ6bGJyh9x6ThfM6St+TspLYLqoVaA9jl08/dMbG7qPr0k+pwerjWZ/0BENOp/c3fDg5/rni8KDdmjnN0eXXLucIE8cIVTKprpeMG/BfMuV2c3PzUBO+kM3tdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8986
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	229587ae-4c76-4cce-e5a7-08dec566fb94
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|14060799003|376014|35042699022|36860700016|6133799003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	r2L/MlCmAQ4Ubf/TFhEQSJWbyzywsyySP66JvN2QZQX5ybL2sYMOYMvAReuWLv0622K8WNicbilp+bxp63utOX9PhU9PNQW/6ig/3UlwXNZNfnpjmahaqql9AxnlhOaqqkdVsRkSwOTZph0a6Bmd5It9GLhXRg1nIgM6c5O5Q09PnZZGxg79sk5ISBLvPAX6IcETwTTg+HqS8F0U6tNNz9W7grChVQvmtWRgPcZ7qVUN2UgPPDqaJtVWQfu4N/K1re2ONR90vx+/tZK/mfDJlhETo774i4OHJen3Nodn9mbPFDgKvaDJpdGQ1E3TOhXmurpEkfCyLtZXXARknnpoixdsim1ZINMbGlvsxSovdiA0l42drQJwVG6x3jRnrwmqc9XEq8iH6jMHWtO7wp3AN3yqeN7rJfX2+yMJHsNS7oRUlg82765BNpvhkN/HOdmSHVPZGXg1xXrweQT0cl2Mzb3mIi0a5G3whKUGnWzkMU9q40R93UYLOFEpDLJ4RQbBBIcQbRfmsaYOHi4VFzUyFQNrCLCUfXBJhxBA1M0aKEhq2JnoSKDwJzmvn+mpzneg12X/s9AQXG3rEsOutvRGHVUA3PVrXCrwoY3TsNA9EJt//IytJe8EQjPq9ViMEYlVbMeXKvIxHblP3owDr5DlmB3A9YKdkG3Kh2fuPcP4hh7bGAM2BVgseZVWcFlkHE3eSP5gLnP2pnn66fslZvU4vfQsgRMFVIIl+oZtwnoV+bA=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(14060799003)(376014)(35042699022)(36860700016)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	miAMrw1jmeTS68Yf+0q6+D3VmyVByhxVcNxRmHP6s1BlvlzKTQAeY0v6Ovsr5CWMz8d0+VRjjSqkSUgeAVP59yc8IOvi7CCJXPoG1gJU08qU2t6iLSAZO9ZgfE6DRZF7V2NR0VkbL3Dp5LGCHUgkmFd/xUj4uBkDxnz8FUOX7FtgQ4cgehtfwX6KsDwHNt9BVTGOf0WDKseOpmzlNuC90LOQ1281ggdC1el1p13wdZWSu/BhNtjsS/qEHdYEzZSPccxrB6AcD3t+DXqt4LxTBSzY77Wm0LhDChvZOYOhHz/DZYJxcg4jXIMkBM8TjDsv3/y77j1S2a3b8sK1IW4oRExJYhWErDPXDWdffPZcikBn5g6CXtnUJKCgHfj28RXnBxWnRaqmjJd0Wqguz1HcZ8IRI/g1S5/jK4AUBUBmdStKl2V/jVYKZ4iz01A5pej5
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 14:06:25.7967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56fab871-7cde-4f18-5e34-08dec56720fc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9728
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 14:06:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238243

T24gMTkgTWF5IDIwMjYsIGF0IDEwOjA4LCBQcmF0aWsgRmFya2FzZSB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8cHJhdGlrLmZhcmthc2U9ZXN0LnRlY2hAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IA0KPiBBZGQgY29tcHJlaGVuc2l2ZSBwdGVzdCBzdXBwb3J0IGZvciB6c3Rk
IHJ1bm5pbmcgdGhlIGZ1bGwgdXBzdHJlYW0gdGVzdA0KPiBzdWl0ZSBjb3ZlcmluZyBjb21wcmVz
c2lvbiBjb3JyZWN0bmVzcywgc3RyZWFtaW5nLCBkaWN0aW9uYXJpZXMsIENMSQ0KPiBiZWhhdmlv
ciwgYW5kIGZ1enogdGVzdGluZy4NCj4gDQo+IFRlc3RzIGluY2x1ZGVkOg0KPiAgLSBmdWxsYmVu
Y2g6IHZhbGlkYXRlcyBhbGwgaW50ZXJuYWwgY29tcHJlc3Npb24vZGVjb21wcmVzc2lvbiBmdW5j
dGlvbnMNCj4gIC0gcG9vbFRlc3RzOiB0aHJlYWQgcG9vbCBvcmRlcmluZyBhbmQgc3luY2hyb25p
emF0aW9uDQo+ICAtIGludmFsaWREaWN0aW9uYXJpZXM6IGRpY3Rpb25hcnkgZXJyb3IgaGFuZGxp
bmcNCj4gIC0gbGVnYWN5OiBsZWdhY3kgZm9ybWF0ICh2MC40KykgY29tcGF0aWJpbGl0eQ0KPiAg
LSBmdXp6ZXI6IHJhbmRvbWl6ZWQgY29tcHJlc3Npb24vZGVjb21wcmVzc2lvbiAoMjAwcywgfjcw
MCsgcm91bmRzKQ0KPiAgLSB6c3RyZWFtdGVzdDogc3RyZWFtaW5nIEFQSSBmdXp6ZXIgKDkwcywg
fjI1MCsgcm91bmRzKQ0KPiAgLSBkZWNvZGVjb3JwdXM6IHJhbmRvbSBmcmFtZSBnZW5lcmF0aW9u
IGFuZCBkZWNvZGUgKDMwcywgfjQ1MCsgcm91bmRzKQ0KPiAgLSBwbGF5VGVzdHMuc2g6IGNvbXBy
ZWhlbnNpdmUgQ0xJIHZhbGlkYXRpb24gaW5jbHVkaW5nIGNvbXByZXNzaW9uLA0KPiAgICBkZWNv
bXByZXNzaW9uLCBtdWx0aXRocmVhZGluZywgZGljdGlvbmFyaWVzLCBzcGFyc2UgZmlsZXMsIGZy
YW1lDQo+ICAgIGNvbmNhdGVuYXRpb24sIGxvbmcgZGlzdGFuY2UgbWF0Y2hpbmcsIGJlbmNobWFy
a3MsIGFuZCByb3VuZC10cmlwcw0KPiAgLSBjbGktdGVzdHM6IDM2IFB5dGhvbi1iYXNlZCBDTEkg
aW50ZWdyYXRpb24gdGVzdHMgY292ZXJpbmcNCj4gICAgY29tcHJlc3Npb24sIGRlY29tcHJlc3Np
b24sIHByb2dyZXNzLCBmaWxlLXN0YXQsIGRpY3Rpb25hcmllcywNCj4gICAgc3ltbGlua3MsIGFu
ZCBmaWxlIGhhbmRsaW5nDQoNClRoZSBwcmltYXJ5IGdvYWwgb2YgdGhlIHB0ZXN0cyBpcyBpbnRl
Z3JhdGlvbiB0ZXN0aW5nIHNvIGlmIHdl4oCZcmUgaGF2aW5nIHRvIG1hbnVhbGx5IGluc3RhbGwg
YW5kIHJ1biB0aGUgdGVzdHMgdGhlbiBpdOKAmXMgZW50aXJlbHkgcmVhc29uYWJsZSBpZiBub3Qg
ZGVzaXJhYmxlIHRvIHBpY2sgYSBzdWJzZXQgb2YgdGhlIHRlc3RzLg0KDQpJbiB0aGlzIGNhc2Us
IHdlIGRvbuKAmXQgbmVlZCB0byBydW4gdGhlIGZ1enplciB0ZXN0cyBhbmQgc28gb24uICBJ4oCZ
ZCBzdWdnZXN0IG1heWJlIGp1c3QgZnVsbGJlbmNoIGFuZCBjbGktdGVzdHMgd291bGQgYmUgc3Vm
ZmljaWVudCBoZXJlLCBsZXNzIHRvIGluc3RhbGwgYW5kIGZhc3RlciBleGVjdXRpb24uDQoNClJv
c3M=

