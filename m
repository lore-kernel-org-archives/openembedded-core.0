Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6B3F30951
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 11:54:33 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42620.1772711667965971833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 03:54:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dqjJDBq+;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dqjJDBq+;
 spf=pass (domain: arm.com, ip: 52.101.65.38, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GM3hNbK71VPwNZ1aMbzMYBcgEBsgK1XYEb/sDAZEajXXxH1RYHoFazLvvVJvnCCM1hGsWgToo2XUQC1Gwox6HMP2Wvmh7Vt/65Te71Adp6DMLiInAXJFkg3CQUUDC7uTYChF2VBwu3UGk+nzz3KnohOt+rFeC4XlwCiuDKETXXFUb0XDfXBtQ8TFYNDZnvYBqdw/x3eesMby20s7/t1giVOHxvssDXsQUFVl1BGQtrPlc1vbFK3pfnhfn2PiCNLT83kMBy5hD9S3Q44lht3PvAKUNcAyM2HdrUZYVxTGgEZIk/5IghvXExLhoHvTPJKOAgtablyNgVJqkk7uVjBOSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcPisZHdZ4csOoaqvnUtivwxDemKsJ4xsWqtaMTAKbQ=;
 b=D5myzaiqvgmyR5Ytz83XRgazpveQmM5pvAFpimKolyOuviR1e9TXb6V4W+qHzhnlk6FFtDnwBi0m5IhfshUW1OIwuu9sPYdNrggl27ZXqP7EbQw4WYUiLkbe3s/c3CtydTdqExFea+MPYteuSW7TN/UN7B0KmbDXVY/Ag6PrmXotToukX1hajepeG61YuKMXslwNDD2Z44z0q11HNdGClCOQmaOWHrqOoWdfWcX5eXL4gnLiKj5uKZQky5ojkd9NWTs6VEpBauztSUzDRe/G1JHUeR1k7EzJ1xJ7PPkNuOFVlKSZvnnau+LY2LeH8Fl1E2ohP6JcOgss04I4GbMXaQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcPisZHdZ4csOoaqvnUtivwxDemKsJ4xsWqtaMTAKbQ=;
 b=dqjJDBq+3vbIkrqsohNI/RRWsrJ69hSFgcFNknNQinaKhLbkFIYz4nSIOIcLqX92VE1E/TE8KsQdUrTpGbq8yAjzHtQ2S0qNai+Mv2PWShl5NXPZ5VjP95HbwlZabLuCrWgPkDPp7yB9lIEin5WRZgu0wy1Mz5oFivYkbnxH01s=
Received: from AS4P251CA0017.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::6)
 by AM8PR08MB6369.eurprd08.prod.outlook.com (2603:10a6:20b:354::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Mar
 2026 11:54:23 +0000
Received: from AM3PEPF00009B9B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::bc) by AS4P251CA0017.outlook.office365.com
 (2603:10a6:20b:5d3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 11:54:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9B.mail.protection.outlook.com (10.167.16.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Thu, 5 Mar 2026 11:54:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gp8ma1B0knRgVg1d7BrbrHE9kEI7BeTsK3/qG+5QP+Smb8gReOl66q2OpHI6tF1aqs9ZIbjJKjBaeEtK1gQY0heA/Gx3xlZzBCVBmrLLCYoRYpSyVhqx+riAGrQXeJIpvOMW8eRJczlsDZPinWu266eTcn1yoEDP5ZwX9KiuJFGkwAwE6yqCmTA6LCeAhdscQty3lTCUhUv78bwDY/S+H9WYZ/rrAGjD4+ioUV1FumR4CCdpRwJbnIVkRrUz9JkaX3EcUkdGR6KszNhdk19hftP4pT26o5aRcM4O0NjSX4CtYMIBbIGgFbXEgXZY9YFMmnLTWpSRyyf+PvPlRZzvvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcPisZHdZ4csOoaqvnUtivwxDemKsJ4xsWqtaMTAKbQ=;
 b=qS6ydD5bux5hbovboAhw9WakAqt1pFrO5P9HPbHkzGZSYRr/HwAAbA6wTqD2Eidv5GYj+GNDZlVZbNwyKCa/ZnA4ozgndVrpvczmYimVzNvwaahO1G/7Zc6aqCYiv7GdpgvTT5Z92BfxvNIj5k/X+K5QXBKYnp8ldhkMcHNJnO3KVZPEwDtZ92jWs6yQYMX+qXh1VF3MDn56Y7lE4ENXWCHJx7R/wPiY49TCJ1tO5CuOTKczStdcklorrglctUj/T4FHA90OLCZIpTVxMISWw5qwonWcWrw5RqndWD+HWNsgrxt4Hm04l+JJlfyuiuJ4+4ffq1b4DuUP27/dFSFtJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcPisZHdZ4csOoaqvnUtivwxDemKsJ4xsWqtaMTAKbQ=;
 b=dqjJDBq+3vbIkrqsohNI/RRWsrJ69hSFgcFNknNQinaKhLbkFIYz4nSIOIcLqX92VE1E/TE8KsQdUrTpGbq8yAjzHtQ2S0qNai+Mv2PWShl5NXPZ5VjP95HbwlZabLuCrWgPkDPp7yB9lIEin5WRZgu0wy1Mz5oFivYkbnxH01s=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6693.eurprd08.prod.outlook.com (2603:10a6:20b:39c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 11:53:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 11:53:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] tcl: rewrite ptest (again)
Thread-Topic: [OE-core] [PATCH 1/2] tcl: rewrite ptest (again)
Thread-Index: AQHcqzIJw6rWudeKVUSgiwFsyydbKLWfrc+AgAApDgA=
Date: Thu, 5 Mar 2026 11:53:17 +0000
Message-ID: <7F757004-F485-472D-8F3D-797F93E2DD26@arm.com>
References: <20260303172009.2064612-1-ross.burton@arm.com>
 <DGUQOQ0C16AT.FQCT2MG2U3K1@bootlin.com>
In-Reply-To: <DGUQOQ0C16AT.FQCT2MG2U3K1@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6693:EE_|AM3PEPF00009B9B:EE_|AM8PR08MB6369:EE_
X-MS-Office365-Filtering-Correlation-Id: 7df15c1f-28d2-45d8-74a4-08de7aadf170
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 D6LhcMkQOud94h13CgXp2U4YdCwOz0pQdlQCJ1hyCpOnVjucoeIel8YpjKgSRFlfOjDFUWJUPEJkP4ocnXSsEyz9cfHWkVwmG947kX1NU1lyitAgDESzSNCrnhDGiOt2FU4PY9XLXlInSRiXTfI3EgClY4H+TlthMo/Xbfm2wsCHfszjUyFqh/If6ye1GmvO/yuXEi4J9cM30wPj0RS0JmDS9Y5yDzAY1C4i17UXQZFXO/N3cqmLIS0dbtYT2Zwn+Xm0VDaP18ap2muOJQNsq6ngP/o8kuVYjw9iO8M6hgx6nUxBxo8JJiLXQ7sFiDiWfm0IkXPIOJwPMz1rwgehqJsrxlBJZ6eNDSByd5yW7LKrPgfwZ2452/gMIvLDFa9mHUTsD/wdO4GVM/JU+iTaKbFWeCZavVxVbSmUdvlmpvnrG5RPhYSkHgFzxId+WlgThvkuwa1arOYCy+ujdqAOXJ9v45U0ScRBaJZtict94pvyOIijpxppyyeCtJVzDUMMyIu8lbuhA8sBEGfnzRzCi/h+gvSK9xGHVYXzaZh8MyoiyvmfRf/PVsLMJWoiYVa0EDSiiVfV/s28JCT+98VW3Y+4ZvOOuxpSpKwxSidFrW3AbhNC/fy0VroBjn9HRw1Uv26H7YCZRQA4Hx6FJTKPXRyup9uXIH0jHjQEdlrRMGGAWTuZhVwBh0Z0qGaSC7t1t1slhpj7PGenrNT5vqH6Lvdg1pV/ZMsY3RmgJ1s263vs2UyK8/1M+WnVQNSBDZ9qtDo7kmM6bcoZ9T5Lx6Qnvw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BD973FEB22BF240AFDA320CBBB5612F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6693
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0d643838-b49a-4408-5a39-08de7aadca1f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|14060799003|82310400026|35042699022|36860700016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	OBOoJT9SpvcUWEI1YYjvi4WRI0JBPR4hEYh2ddIQoMdzOQ9Lhz4FCyDDp8q+RbE9RLcZepqJksbarxCV1kN6/IiMPBrNiI0ldX96Rk8XOSbId723pdCZCiVKWEXBZv2pJHgseM8lwZQv9IKCPklNr1wodBoDxrqzV6dFTL7AnLcqS3zDvOeK26ZjodoByBrhcm8s84u6LWfLMqPM4mZvgJ7EksBL+999zKhILLWqKE8ycsgnFo4HiAnrleZKP2xnmyrNkp6yAoOoHJO6QoTSYNM10NHqpN1uy1FIRz2Mb4/odUfiBrroR+Hn1ay2tYZkgjX1jYGJME4TnN36FrpTjUcCDSYvJyCRFuCNUk7UtanTCm90f0DGkFjOGrujNzrpuglVDGbYnYK7QDKuLOn+8XHCpcYq7vp+cFJ848OwEDZPgJXHLuCp6fy39vSmvD4G7CzZsWQ55llfrNHIx1bteTLVp+zymCmlKMrQKoe7Cekfb+GdZ4RY0ufZ10Cu+6Op+EksBHHf4PUGi0tZm34b6Y9uCgB00EW8xrCs17bBLDLDqhAU93hMUiHVvtencqEYGqNwseZ0o9xB6iYw+5zEYh5sgIIE1bJZIDR58jQA1VXTMIkTgbxnA8/qgn4ZGJBScFtQsiDI5DGswDXBqBCOwZapZJEYQuEZDsiu3P4Z7UXg/JFylMn9wdHJBQygvGq2PXOf1Mp623r111OEhk0zBxSx2UPYh1fmXZGoGeYWkq9/9Rh7bhe+iU5I3bP/E0Vi
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(14060799003)(82310400026)(35042699022)(36860700016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mqjAJA+wyUU0BmV2DuMD6kX54dNAI2EupWhh+lVN9p3/mBaVzN4R5yOwK+/OUdaPhh5ymndhEoX1165lr6NoRV4nrAlSlEtOsMcdHqb5wOHH9RxpRQtX9XVsKAbTc9rFgxK0tQ6bgR5jsXCqM0Sd+WV9DaKD8gO5VgofvH/mo9mvjDKFxQLxbds2/9l2/1O0Ft2Tvz459G3DpbrpS72raLrv9Kz7Ng8oeD2pTP49sjkkJoRahbrwFDxM5f4aDOBIqfkCAgKZLQXhC2jAKTCFhJEIcDLqLqxVJH9rUXn/t8WCnZxIaX5rjC1dEJ1t+1g39ABtijbcUkzzCSXusrRDRQOR296CiPfEW7k67MhtKCx37cnwusiybsTKO9T/9KSLrWP1sqBdVocQafQH3dbkqoZScx7e9toMKsHh3z+VLe4hb3UFmPalrZlK0RIngWAJ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 11:54:23.1341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df15c1f-28d2-45d8-74a4-08de7aadf170
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6369
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 11:54:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232486

T24gNSBNYXIgMjAyNiwgYXQgMDk6MjYsIE1hdGhpZXUgRHVib2lzLUJyaWFuZCA8bWF0aGlldS5k
dWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tPiB3cm90ZToNCj4gQm90aCBmb3IgdGNsIGFuZCB0Y2w4
Og0KPiANCj4gRmFpbGVkIHB0ZXN0czoNCj4geyd0Y2w4JzogWyd0ZXN0cy91bml4RmlsZS50ZXN0
J119DQo+IC4uLg0KPiBGYWlsZWQgcHRlc3RzOg0KPiB7J3RjbCc6IFsndGVzdHMvY21kQUgudGVz
dCcsICd0ZXN0cy91bml4RmlsZS50ZXN0JywgJ3Rlc3RzL3ppcGZzLnRlc3TigJldfQ0KDQo8c3Bs
dXR0ZXI+DQoNCknigJl2ZSByYW4gdGhlIHB0ZXN0cyBzbyBtYW55IHRpbWVzIGluIHRoZSBsYXN0
IGZldyBkYXlz4oCmIA0KDQpSb3Nz

