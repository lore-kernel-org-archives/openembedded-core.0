Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4769CCDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 11:08:35 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4480.1782299308975387377
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 04:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=K32Gy3S5;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=K32Gy3S5;
 spf=pass (domain: arm.com, ip: 40.107.159.29, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eEmlaZIDDRlksQ6MAKdFfFcsIZKwTuIC+f1v5AmX97nyGKa8YVFXnTpL9DG8KZgJ+Tqf9Dj4tznIgk2SyoyQhWbziSRK6mCKPspkNPklvVmPN87hiM1aKI4GCX1tonW4VmanlzMQwDFudubjpkwsnkUK5Wt/pfWAAdgY3X/GG8F91yY5di0S7fNKukUgA8lBoMYyXbcXIcuWue55IshaegsOzdj/XGwglH+O4u1Hz+3ezMivBvWQA2Sa31509JtKC44hYCY5tvd9S5M+MtryiWbURAaMClGzvsMGY4+6tr8bpVKGd/L25a/q1S+0dS5Uzo3XfDdCnXM7gGhHWHrknA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlZTgVExuHM+L1IyDLmaj6hTexFBfJtkKIhmvRBnDkw=;
 b=dMYeQwHn4w09+OPZDsdOHulI7/eBrCPTmBgxE859ntU2Z/oWV8llv7PNWiZqGNMZ0eIPPjYI4w18ZHbmJIWFcBEh0HsmdldRS1Ee6JO4wUBIXzfnJk9qRQHN8NFK59wGblYokdse8xi7/cbbGxcDTdADOmrlEFE4BQ98LIBKOp3ptSRVaylnORhVQngvYwyKbkZlW1U9pmz0pjEYQOcP1tgC1pgtiBsDnplyxNTcIxR4H7F34CKvmHAALTIqFjuG0Dr+y06x0BnZFxyWlxGU9xwqo31JryxNyMnf2Y2kgIUCFxjFUxIH8nLkZSwoaFEv+JjTOPi7e/WZaBVGLYKIoA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlZTgVExuHM+L1IyDLmaj6hTexFBfJtkKIhmvRBnDkw=;
 b=K32Gy3S5/BedDIextanTCby8KcVySNGtyCSO9P+zZ+0Nx/Pe55V1dzpDyAc4qqsQMDAg6Xu85wkFUndEY2qhHPmdDoRWtwUPzivuFwushszRWir6J9MaR9KXT+F7bITxMgYIIJh4tp+bvMfyjkDN7ZNWSGAtQmaPDNupPASiNhg=
Received: from DUZPR01CA0211.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::24) by PAWPR08MB9640.eurprd08.prod.outlook.com
 (2603:10a6:102:2ec::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 11:08:24 +0000
Received: from DB3PEPF00008859.eurprd02.prod.outlook.com
 (2603:10a6:10:4b4:cafe::98) by DUZPR01CA0211.outlook.office365.com
 (2603:10a6:10:4b4::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.14 via Frontend Transport; Wed,
 24 Jun 2026 11:08:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF00008859.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.10
 via Frontend Transport; Wed, 24 Jun 2026 11:08:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWTU9QjCN4ppOR+YUSeoqD3JpLL80GK+fS/t+0GekGDOPfdqTbta4c+Yi/828i3rwDu+lDG3jTMtHSa6Y9S9d4VoVJSR68e7ckTdIzwAy32Rl9LdZw0E4ZLBZgCU/Fv2OEflfR+PXNABQstVibKRyvHSWPMCquTLmjcGTqlNo3zSHq5L6lYn3a80mDusCY2dvrbZ29pHET+1dKKdanUjxXXhRpu5yHucaR4wz2fs3X7H9xj6VO1PFe0mttJHB0slBiamu2DrbM3JMD/P8iGgZgtq1jOBWUbrvkZBXJzFj8iZe3ow+NbfVuksxLT5CqzN6OqY3UUR1MktVWBacgqzyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlZTgVExuHM+L1IyDLmaj6hTexFBfJtkKIhmvRBnDkw=;
 b=cxFLzfplOE4xnbg4urfKOH83PTb3Vj88sjAoDz/kTSS31DeMCXwEgqVMH6CsKePEHtGeUkMR1ju8/qmYVYqOS69Q0p+nnUcQJTtc6HTtnC2y0qbcQ0k8F+ITwwWle4nWGRdMG0CIXj0+hrq6wDhrFKsv5CKH7Gt4ptHyedHrBhA+B12IuDWxnNkKoRGiL/5CFfnwn/O5LU1Juy0MH+zVS7MrgpCrfqNlrk1gsfPwebpaiYVKJSCiRNb0ps8iS56Az9etE+xvpRuYp6hRir1l6m5RygO1F1MCr4Gp350zzXDes0liUencobKZxU9s83s6skRnJYb47izGN7HZHFdqSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlZTgVExuHM+L1IyDLmaj6hTexFBfJtkKIhmvRBnDkw=;
 b=K32Gy3S5/BedDIextanTCby8KcVySNGtyCSO9P+zZ+0Nx/Pe55V1dzpDyAc4qqsQMDAg6Xu85wkFUndEY2qhHPmdDoRWtwUPzivuFwushszRWir6J9MaR9KXT+F7bITxMgYIIJh4tp+bvMfyjkDN7ZNWSGAtQmaPDNupPASiNhg=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DB3PR08MB9112.eurprd08.prod.outlook.com (2603:10a6:10:43c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 11:07:21 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 11:07:21 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: muon, an alternative to meson
Thread-Topic: muon, an alternative to meson
Thread-Index: AQHdA8mgn/AKmQPaVUCD/YrpMVoPmw==
Date: Wed, 24 Jun 2026 11:07:21 +0000
Message-ID: <D146E22D-7BC9-441E-A835-163CF509D8A3@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DB3PR08MB9112:EE_|DB3PEPF00008859:EE_|PAWPR08MB9640:EE_
X-MS-Office365-Filtering-Correlation-Id: b1ea5a90-fc34-40d8-9b8c-08ded1e0e8a0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|38070700021|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info-Original: 
 dxQIVr7FtYZ4nrL5WZqAXkTLyDLE3GIuG/EUOZGWZ4UUPI8sbYy4qbYANfbQo7fjIESwkFeNfyb6082N15fGNHfSLKMtZnikltzS2/xvmdOCXgsjtALbMQSk3h7YZapIvuyoJASAyRnG8nxTjJLCpydt3SZdbdymEzVg6TInBk7oA4ipy0JBZiq9cM21XoFsi2rX/pZNn3v51r3IbLJJOgPNDhGGJ6NEJSDJVRAoXmmnt2ZnjqeKzLa/m+2V6/ztYd9Vda5EKWIAXNx6ncL/ptLvEO7Ls/8ZGHQyhY768G51LqOUpbtwDBIqrAFCd5KZkHSdTqzDRJtIWDkwU2J33M+JGYu3g8yjsxTvPev7aYC4ku2FH72ti9pK5IqgcZsnUS6atFhA0JZi2OPJX3RoyMCez9VQHGnawUNXBU/6u+Kd+4qpKTbEQY6/+02VIy+en4ff/YikaB1qOrZsXR8GTkwOOsCwwtyMi1IIzjR2etxCOPAXLk1iGfEjtWF6V/sZPLCzN7D4Lu+VhNVpwdbrV3q2qNFiffnv4NKOrTzg8hRO7GgWsDdjXJfoZC1xgy92MCFQFUJRqUUmh7yINRXQGKvJjeEBA9Dtv/UwgUxPGM2Fd0SsdeAly+j+B16zkElHmBwhO33TiCXUkQlbO4ZYzZNrL8MgtenZaLNIxqsVF58=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <73255402484AC1489B5B644DADDA6A1E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 SsPMe27Ce2w/PGYQBo3Vm2lUmbgeES9r9DFuH9wcGt7FzPIIbyyNHETfhqIORLGCTIKv3Nk9WT2EKHMJntpG3+ISL/RL1s3xzV11GLL7/bytDL0xsZdA03bFeG7k8iDhN34Q/qgOqQEk2zfkDLNfR/SwMBWn7LdG6sxs1+0ixucusBHpuvNzjeJPJpqF5/OnwTgWQS26fB0qLPdWcYO369YkicDR0NagPE5r9VyV95cLXbm3g/1xq/lZS8r5FeiwnVozcYx3r7gn1Viu4oWKDHWwoOF3ExYpE6jlr6lPBBHPJbEL0lYEy0nj02G5eIQfIYwgyx9oBUuDJMMddEBu7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9112
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	26391123-21ce-4b3c-7bb2-08ded1e0c358
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|376014|14060799003|36860700016|1800799024|23010399003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ymYPmwfb6kQrFufFF/k7y3M3QIUWOw2khL7AQ+pnetwOfjWkwDx1pA2Z0uKgiNm9wR/Y+9ezWE8Qi1mdGaW7wKgtEmjjFTjfiWfw7HXgjF37v2AisuYmJM9TqQs/FvqqdLyB3dGAKyG21gYblPXTvlwtKqraNMDse07SukVydbtQlVhqIMwRVcOc604q7J5dF7dHTH2xY/u25pvgmIaJjVD1rq5QGYF7GiUPQbWYnNNd48hKv3W+ppxHFU0U6ck9O+26Cm96JKSUSYAFgxT+Zv9oN6tkOh7kYlyASKaYGVYRJc8hNfksrqzsVinOorsCaGgsfZwNB4RmbCZ4NtwH+ubNwCORIgYXDyffb9sQ45SDo6W1w6sM6i07Arx1q8bU5hWpdgZQvDXFGTA9ch3pJmtqYLrT9a3Xm/1UiCtwCPX4wyID9q1toF/nSqKCxTDoWIqTeqD/YnPe8gJ9n0dnLwvrwD7wHS1LqmvLwJFO8clAxJVFEEUUaaqrNEvV09Ruu5dablUWMj6lh4JIlWJxSC0mlxMRJYhndWzAObLM+w3yTJWF25JSyrDBAuRzaWrW2UmBmpDbbRHLGaxkkMUT5w+UbohN4Wj2bgWJwoRnCJ4TLOuoYEt9L5OdKW3sTKO8vWjeMUInEvv/XPzgN2uP4A==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(376014)(14060799003)(36860700016)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RWeUO3fSx4QHCM5AwWDGnWgZLebffN/LPydwsLc8PQPyqewVrLaTm64KecHfWOUh77QYn8HnK+RcS8HsTfPoasd6y4kEERttw/THIDL/8V/O440xFMto63zink8XfXowVH8gXEaaXX4txIp64ygMPci0x40wn/JG4xMv0Ql6rmTo+J5VDWeDhok70XPTmPLq3jLe5gkhLmtHU4BuD4Odumpos3WNiEtO4IFs6/2Oxw5oYpIeF/j5r24kwk++gyrLnCTtpgUuL/mzK1tKJ705B4TvPR4kqJvOMBj12Ujf7TDv1B09E3qLrkHpNCUmXZ1oFBTsYaFzrNOAezUstSDEP8Z2ebXLXsRfgeaV/klAA3qv90XNuJ9z9aabCx+HbfAL99Qo8D/PNcil9gFusZgK9LpyjJhkps/zqdfriNow9fFgn7ezXk2TukaIHSVEVbEv
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 11:08:23.8562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ea5a90-fc34-40d8-9b8c-08ded1e0e8a0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9640
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 11:08:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239487

SGksDQoNClRoZXJlIGV4aXN0cyBvdXQgdGhlcmUgYW4gYWx0ZXJuYXRpdmUgaW1wbGVtZW50YXRp
b24gb2YgbWVzb24gY2FsbGVkIG11b24gKGh0dHBzOi8vbXVvbi5idWlsZC8pLCB3aG9zZSBkZWZp
bmluZyBmZWF0dXJlIGlzIHRoYXQgaXTigJlzIGltcGxlbWVudGVkIGluIEMgYW5kIG5vdCBQeXRo
b24uDQoNClRoaXMgbWVhbnMgdGhhdCBub21pbmFsbHkgaXTigJlzIGZhc3RlciAoYWx0aG91Z2gg
dGhlIHRpbWUgb2YgdGhlIGNvbXBpbGVyIHZhc3RseSBvdXR3ZWlnaHMgdGhlIHNwZWVkIG9mIG11
b24gaW4gYWxsIGJ1dCBjb250cml2ZWQgdGVzdHMsIGxpa2UgLSBhbmQgSeKAmW0gbm90IGpva2lu
ZyAtIHJheXRyYWNlcnMpIGJ1dCBtb3JlIGludGVyZXN0aW5nbHkgY2FuIGhlbHAgcmVtb3ZlIHB5
dGhvbjMtbmF0aXZlIGZyb20gZWFybHkgaW4gdGhlIGJ1aWxkLg0KDQpJ4oCZdmUgbm90IHlldCBk
b25lIGEgZnVsbCBidWlsZCBzd2FwcGluZyBtdW9uLW5hdGl2ZSBmb3IgbWVzb24tbmF0aXZlIHRv
IHNlZSB3aGF0IHRoZSBkaWZmZXJlbnQgdG8gdGhlIGJ1aWxkIHRyZWUgaXMsIGJ1dCBpdOKAmXMg
Y2VydGFpbmx5IGFuIGludGVyZXN0aW5nIGRldmVsb3BtZW50Lg0KDQpJIGhhdmUgYSBwcm90b3R5
cGUgcmVjaXBlIGluIGNhc2UgYW55b25lIHdhbnRzIHRvIHJ1biB3aXRoIHRoaXMgYmVmb3JlIEkg
ZG8sIGp1c3QgYXNrIGFuZCBJ4oCZbGwgc2hhcmUgd2hhdCBJIGhhdmUgYW5kIHRoZSBsYXRlc3Qg
bGVhcm5pbmdzLg0KDQpSb3Nz

