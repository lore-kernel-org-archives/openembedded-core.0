Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED9DF589DD
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 14:23:46 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20896.1776954218633449123
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 07:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=IQDCMBjT;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=IQDCMBjT;
 spf=pass (domain: arm.com, ip: 52.101.70.42, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=C2nUYbh1sxEzounK9GjLROfZkv3kDa+ezI7z848k0ae99mLNepqQzjEz/N+kBSoew0px1gIW4H/zZHRvHS+8J+cyqACxWZth/P9k31BoYXkcfE+2/dRyGz2o1miezXT0hbqFoKoDekNn08AcCm/7/mlTEAMWl8rzB5ZBktT0nO7B7rfN0Pr18J2EmK1cdTyfLx36koOFEHBgpllJrWx12sYeRcDhAb8RJnI9vbi7StqEEkPfrIEhh6z3F+xArLYJCO3gtSMeCsbgXTw63jON3JBkZTnko9jU3f9I6ZemHJctHEieVZwpi3EihBDUH8b8+uYeAC0qd3uPzOfLw5Hy5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxHmbuTPphAGGzOrbnHMvpnhPNTkroKY6o6rF7OubTA=;
 b=UWiTfTvBmu95qsOe6Ev/4Uep4MJPBiYsGzdJutMsNlXouD++AXsjotXZvm218jEYRx3g4XCARWraHgg/fIXtWTuVuZYnhHiRj5070fcz1H8I6sRyP1Nn2WMCM27kcMqzM03DUHfkM3wa3m1yod0dFSNOvP+LmzuD0K8ywPYYj1UCVUWDYfFoLQaJqlcm0cKst+vhOf8bYPATFNuTOvyknpRhVAdlBlD8XRD3IbjBpItTn+y1UvqbY14Zb6MGxH9VKh+yk7UuXAZkSKtRp4yyL17UoyyiIuOJUllG9PZG6pgLGABtPou4WwFjuld+PRd4hHXoZ+mE+94PRrGXRvaeeA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxHmbuTPphAGGzOrbnHMvpnhPNTkroKY6o6rF7OubTA=;
 b=IQDCMBjT0eyBQpKVhfUJjika5OxwHw9sR3KZ32seNw8UpepkSuXvB1dN92ILocYYGQxxlBe4O/EsHktxogbRbQz7AsiswtTu9uGEPRMn+UF83JIAeF9th2Amz6T5JOMIqf2bnJ+bXnrkHq53ozJ00lV3qiH/luXNvL7USLT4OIE=
Received: from DUZPR01CA0043.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::6) by PR3PR08MB5628.eurprd08.prod.outlook.com
 (2603:10a6:102:8e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 14:23:31 +0000
Received: from DU2PEPF00028CFE.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::ac) by DUZPR01CA0043.outlook.office365.com
 (2603:10a6:10:468::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.21 via Frontend Transport; Thu,
 23 Apr 2026 14:23:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028CFE.mail.protection.outlook.com (10.167.242.182) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Thu, 23 Apr 2026 14:23:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j404IkCSPgnm6HZ3rq8o1FYZvauhqvb9uIQKwJ6HWuEPlD3473DOBgHzS2fMKb9p5nZM8BOFGmhpHxrCb9FdcL3s9+JzaBh3f1YWxq1EQY6XeBz9IkdhAMxYHsNJhGTDpIer6sq8JYtzBJsPHsRkjYanD/qoW+ZClV48zgcf5bKfuNUAJxUORDEojhwWEXAWqMw2hhuZDUC5FV52VB1J797+Fg3xGO+jiqn6KiinestZmUjqUfCXWyb1xWsOfdqB/8mxIP8K8h9971pJIEbC6NXnE1VvCcQsWAUOjjE7YcnBK6hDM3MDuUcdL3fjdRKfEOy8BK3XqfLYcc9CmJA8gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxHmbuTPphAGGzOrbnHMvpnhPNTkroKY6o6rF7OubTA=;
 b=dAXqFyXWgERWIyCkvPUHBzGa4QY4Hwn32c1ukRzwJFKPcffAl1A7jWzx8zbKWx4mIC7NDdTPX1soqdhTNYVf1DrIutRsMr8XJPFPQwLqabQo1PtSZ6nhj2shiNLHsiORpO3fhRwVOlo/eOZ9oECSPgBlB+IMfADByu6odhDSz8Vohz9y3hrDK3p+Ae/3ScLw4mlqW3ORVvT/rH/vQyeMKocsz2FvYWDQxTNJ7CvcpM9i+dmv6gU9BAOV79APx7Oy4MslJCkufADxExFuC3yyqHt/LoeL4dKSmQVr3DOjZzK3k9PWfB1Mi3PFmgFae5VRT5nGiRz6f0uAs253wHW61A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxHmbuTPphAGGzOrbnHMvpnhPNTkroKY6o6rF7OubTA=;
 b=IQDCMBjT0eyBQpKVhfUJjika5OxwHw9sR3KZ32seNw8UpepkSuXvB1dN92ILocYYGQxxlBe4O/EsHktxogbRbQz7AsiswtTu9uGEPRMn+UF83JIAeF9th2Amz6T5JOMIqf2bnJ+bXnrkHq53ozJ00lV3qiH/luXNvL7USLT4OIE=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by MRWPR08MB11783.eurprd08.prod.outlook.com (2603:10a6:501:97::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 14:22:28 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 14:22:28 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] sbom-cve-check: exclude recipes from
 version checks and version updates
Thread-Topic: [OE-core] [PATCH 2/2] sbom-cve-check: exclude recipes from
 version checks and version updates
Thread-Index: AQHc0mtsYn+8BZbCU0Ke4Werx3H6GbXstFaA
Date: Thu, 23 Apr 2026 14:22:28 +0000
Message-ID: <BE153695-CCE9-41F4-BEF0-C5D4CA32D288@arm.com>
References: <20260422151858.2598801-1-alex.kanavin@gmail.com>
 <20260422151858.2598801-2-alex.kanavin@gmail.com>
In-Reply-To: <20260422151858.2598801-2-alex.kanavin@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|MRWPR08MB11783:EE_|DU2PEPF00028CFE:EE_|PR3PR08MB5628:EE_
X-MS-Office365-Filtering-Correlation-Id: 24c3fc58-62e7-4d07-0000-08dea143e523
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 O15TnLaOqswbVbh3XrwUwU5AFQxKM+n9wWyDUkl9nfDO3LL9NkuHuXjgyAatoawebWdykc6ndDz/HnfUAJE2yjnvazaK8Hha8OBpMr12EhsA16uy7Jx6iMGIuyVlmuWOMwv9qE7e8gLDnxdTS4W0LmWnz5sjrCQxJBvehUOG/gKQvOYmcRi+imBWm78gpw9cOhNdfbo40h2E2mQZzlpFa2+Px7j4U03BoCLZH6u7o72IivGYwBK+tXI3BtXAOwABQh73zSHl2npdtvjFE3Z4GWJZfzkXQ/DXn1ZxI0SvXApdLZt0bCj7ttYeDmui4BefH8SSPNInO0wSKmF4+1229ivyrHBg/tl5IKRwOqKj6UqYHh+xADcwJgylYDwsGayr2gpdgLjU+QV3xXboKJ2kpvKZeSO3OTtEfik6GwE3jxvkk9FEZcBS7wM53G5fe+EapA+SjHJ5FA4jup9Vyld+iBc4IYRWPBg7eUT+dWaAtaoZ0aQdhv1sknH09StYq9OfQCgVrZkuxXJsqLJWVVwCbIRtIiCHbaVobUcHAY03AqKW9PxauHHrejybh6StIgGpJTQXx5hwq5I0JRLuzHWSi2LaP7huA/+65shl47lcjqw1+lvu2/YZ4YdR7h4iJHWW6/gyrpQ8d7TXj08ILYPhkDlKi6tbXNatHO2vln1MngsoNfp3aAcIqj2fUBYNtw6m5FjSMbXZmJLiNrjugYjh6tDVKQjHs8bd+RLNfKz4PG5EylZ801/UumbFXAnboqUJ+bHHuJr4oVQ5dDQGegy0XURkyrG8vo3ruYGwgcG+NqM=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B15407F74377384B9D8E8588DBC7E416@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 JPym5/XwJIwfD4IIqrulWenlsYL83pbFCkqBqa30yC1PO+lcHSiCpNggdftxKY3bn8kqSaxj2HmxQ9j+I6OnIWLaor+xMDFNsYbLQbjQS3cIMpoPO8sdbH81jAzU4TS0fwKO1zZ5e/gfGonC5ZH9OJurUG/REXgEVBlISmze4BuaOmDGuz25Z8s3m4sGBHlMTwmRgoRbLg/rICvF9DhkUxH4I7yxrtp7AG9YavUiPMEXiAJT9mmPTUYuZqFjdQPlMkzwi/Kj1Dcx/FKPFKJhtoUd6JW58mdsE9T4u9teJpePva7ZtAAOCgZCk/J2koTK1E81XY9UJ7fI2mGnHj91NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11783
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	aeec20b1-2f0b-4f3a-3f87-08dea143bf9d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|14060799003|36860700016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	2VmvfXa9FpCp74+RTUauIh+/RLkLpQxangmNhDjL5DdMR2GF3vZvLHzQEpbub8D3PcnjMzW+3m5pRIJg5PvAPnD5LHFmGE7EAu7NF8Z1TVhPLeEjLu+u/ch5L3U9wVixBvwjggEM8u4Bt8itmp3d1cXJBFMbmYokWhzf0OwN/GilUHTLtJCUKPniaE7lbcvw26y97O3Kyu+RQc4KIXjgRIpB4j5u7ZvdslSPfYBC7pvB1zeWZSG5q0EKkZKh2wbmvWhu40Yz2qF4P6NJMNStheAPlsiMY1Jr6DhRD6lEXfBQSWzKCU6GXC6UTQofug2EuEpa0/7Zohg15Q/Doro0yuOVWzuErpw7r/67cJ0WSWB2apinRScVNTz+/mdaphovW3ZPTeZebEFIfj2r7gPZR4ZaYNzKged1SwmeEMu1Z3/4qLWEJ1MjmqEXRHwK7ltMqt+96ZHog09DnnGB/S3iDcr6Fimnx9DWrFknxXtvxLXXIYvjpHSC68kL2iTGYirORlJij0DlUQU1gm6DJJVUrEYXDORpjoHe4og41wuvZ+bAHpmyNY2uMgEdP/MNnQRrFDuJmLPnNbRHh0j3fgBmFPd5WS15y+c3TCD1kOJqMRJKsx32A5DSaCCteL1ZH3bjAQtgZQaiR+hTlCyfIAIbUHIT0zQ6lxuHf6U5rQ4aPfDrGpcDH/61BYnX6+MWh4skE3sZ4r6bn+6cls8fZV8Tyn406SL4W/ZzaA6a4lQ+bTEMDAD4+qU1aa8uk4ObIJw1tna5wNn0P1/3WtnGy7tDfA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(36860700016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UCVJ54ikVEkzBFbCuSKAfTIMZdjEtHWG8i64fy038JyYRClWfrbO/nyX5JH8xncvmEhM86e732bQ7RJL1F3m1VuPGislNMHSc24G2Ufr9Bq7u+riu9PU7GJsm7DOp2DU1p7mK/YWIju4ja4vfbSg5Kz5/mxLh7FE0L4qwKpAlqWHb96QqlCGdYLpeiy9DXCnH+i3e766ceWqmSYTuVDi+RCU13h4MWy/nSN+oQg+fm0gnESHtmGrEL/Bnfz9I/k7w23Il/1wJAivOj48fqt2xrmFRueYD2gsUuVn3guOdir6yMjYgP/gTQzoNrLsJQXroD0a5/YQdxvf7Doeog9ACZIce0bGTusp6Cg7HxGiaqo8GXczWYTtoaG0blBVeELTKRf5yQV0+ufAluAXW9H1ukGtccaYHU3VIcwfrSX5brQFJ3zcf+QkaUPTxR9J0J/z
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 14:23:31.1851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c3fc58-62e7-4d07-0000-08dea143e523
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5628
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 14:23:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235773

On 22 Apr 2026, at 16:18, Alexander Kanavin via lists.openembedded.org <ale=
x.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> From: Alexander Kanavin <alex@linutronix.de>
>=20
> These recipes rely on AUTOREV enabled with a fragment, and upstream other=
wise
> updates them far too often to make regular version updates feasible.

I actually think we want to keep this. We encourage people to use AUTOREV o=
n these recipes, but we should update the underlying SRCREV occasionally at=
 least, and AUH is one easy way of doing that.

Ross=

