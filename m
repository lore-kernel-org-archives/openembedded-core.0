Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 068A9C55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 14:06:18 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20125.1786025173272035067
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 07:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GwIbLkCL;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GwIbLkCL;
 spf=pass (domain: arm.com, ip: 52.101.70.32, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yz2GWycG+T5hTH9sIe0kfaMCrxkHUpSS67IZA+P609XDw3eIu/UPcpdTV3AiRw3koDTZqs6LkbxSbhPSfdeYoMOy0A8deVs8wdWezYMMgyZsDInczunChn1lnu2daAdZuqZb2aBKabO3Uf6R46BtyPrk6Fc8Tk76AfJp1PBU7ye3MAHDhEXWNoWYdOvkqWJTDasNt/qVdgY0nvWsqkdnCdgII8aXvbDoqWm3WsEebz9iC3vITmQmN6jrUQ/ZFWE0IGC7I3RNCEy6igGFEK/yA1t1CcUWzdXqskAULkylo9ZfULm4Doa4FB+OMIR1t4GNqiZi5HBuQrZONSNZAkhWsw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yamyUwTVzqi+llx0gPhwrEOcQe8gy07+OupMnZWrr4=;
 b=HA+aqQmb6K7FgBvlNvJ/ZKwuHxbKH0p9sQUIidOHyoqKEh71yN3ShQ9etvdHx+/XiGMvWMFPsMUZtC3nUsXdy3RWVV6eo9pbB6iBMvjr3ZIpqrKLrR4XFKE4ACYg7ezXeNe1bP2iDUkA9xxGSqK4fuEnaZhVKk302an/dxUWIs8QVmjWoevCCGCQkEi2TWIXR6ub3w9hXJ9Vh3e6y2whK6PFFftKNNLzO6yAL1BtBy87P3qfbgb9/f/u+tGo55uE4l5TUhCZ7/RNHTwfRC2EDJgW7zLm/kYyCl44nkoyRp/CBWqc3HY1Lf73chtlnk8neTur2TBxBcQdcartXPbqfg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=ericsson.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yamyUwTVzqi+llx0gPhwrEOcQe8gy07+OupMnZWrr4=;
 b=GwIbLkCL9RMf51rYVMzp4sDc4I+b0HP9jOEtvcj6zJEuMm08nO2JVzEQu4USS+xASayYVP1bEeRxrZ+JAqtrBHx5lszKPfUjv2QUfmEzbttwIynqTS3j0A0AYKvsPLWc8o8HI0Syv7+Ydzd3CfGYr97FdQh+CFq3lUldfbDPJVw=
Received: from AS4P192CA0038.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::7)
 by AS2PR08MB8831.eurprd08.prod.outlook.com (2603:10a6:20b:5f4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 14:06:08 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:20b:658:cafe::67) by AS4P192CA0038.outlook.office365.com
 (2603:10a6:20b:658::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.21 via Frontend Transport; Thu, 6
 Aug 2026 14:06:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Thu, 6 Aug 2026 14:06:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MlkCuKC0LkIbSSBsmkG8nGr2NrkL6zaBYjmIWI3Tvae9CucWat17ZF4SN4SQ/Cx8tJHkFUbUfbtmZGtz4vLGNEFZhQBdHgOdv93+uEzQl6k7QCPYJM6wijFPZ83kcPRYP6ebHkJRJJq9X3K+qaMmyq/BWG0luvNNrnnjrFSoy0rlf93NgVzitfAzG8aMBAT11HOBEXyjZd7CnO8sp138EjN5vIah3pEbveXm3d40TooIcPgpEP8ZMjtjH/8dwLCRRygtb0j/IMxAGJ+d3NfWZMSVvTgZCVG0JYAIgcHkmVDQlTvNxJxJc9M2j6SnA8bIwP7DCen3nwwvscem9c5aeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yamyUwTVzqi+llx0gPhwrEOcQe8gy07+OupMnZWrr4=;
 b=SJUG7j4DQ40gLeGd4hHmDXbjVCjzn6nhVpsCVHc0BVF0Qh4rBMsTGjkbdnWWY6DgCrRkoIeSQal9nqjaQCeQxxrFKXudC3zuDMc/cVbswR4j/HlnVxXYmglVZVxl+yWa6RvyNMPcur8egpmlqBBTMpdDcD12LcTZE+4VmLWFOg7KeZsuLUTQSoz33suxqs60esQ+Irf0RsOILs9WY7OAqRm36qBCr4CnnMZeEZLICOWTrE+HNthHsgz9U9m6kbL6NIsEoX7lhCR97Y8O76L8WDqVHRsZTb91rR4TplchEzxoro7AyK/z4R+XVnG7VULrV/qWGhGGExG3NokQaz4Nug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yamyUwTVzqi+llx0gPhwrEOcQe8gy07+OupMnZWrr4=;
 b=GwIbLkCL9RMf51rYVMzp4sDc4I+b0HP9jOEtvcj6zJEuMm08nO2JVzEQu4USS+xASayYVP1bEeRxrZ+JAqtrBHx5lszKPfUjv2QUfmEzbttwIynqTS3j0A0AYKvsPLWc8o8HI0Syv7+Ydzd3CfGYr97FdQh+CFq3lUldfbDPJVw=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DU5PR08MB10467.eurprd08.prod.outlook.com (2603:10a6:10:519::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 14:05:32 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 14:05:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "daniel.turull@ericsson.com" <daniel.turull@ericsson.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/3] devtool: upgrade: read changelog blobs
 via a temp file
Thread-Topic: [OE-core] [PATCH v2 2/3] devtool: upgrade: read changelog blobs
 via a temp file
Thread-Index: AQHdI9dn2XtSoi7oTk2NVotkdMAyrraREY4A
Date: Thu, 6 Aug 2026 14:05:32 +0000
Message-ID: <11EBBEC5-8521-40C3-81E6-A9E86B2A4A1C@arm.com>
References: <20260804060205.179715-1-daniel.turull@ericsson.com>
 <18C884DEFF3686EE.1990914@lists.openembedded.org>
 <a231432b23b9d9feabb09eca97380c7e93bee8df.camel@ericsson.com>
In-Reply-To: <a231432b23b9d9feabb09eca97380c7e93bee8df.camel@ericsson.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DU5PR08MB10467:EE_|AMS1EPF0000004B:EE_|AS2PR08MB8831:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ecdd538-d39d-44d7-296f-08def3c3dcbf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|11063799006|56012099006|10067099003|18002099003|22082099003|4143699003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 dAQf/Yl5E8SgRO9gEzFVcjPC7zcYqeoF6iT/Gnm0aWaeM1lFeWaN5HSeLirKWQSJLY7Q0Fby09sfYdv9QTEcUcYbT8U+GuT8Uv9Ah0wBT98+1OikgGvoJ+pftGgVA2uE1w46mkU5o3iZhIXFr+rNMYVPavKNOLmtzlxxe1yc05sUolPHkXuycPCP2KdrrBJnXiIZmIjPK0vuoRywE1aY7iu7HonJ3+DCfoOFkSiqxSVDV75XGLDbjwnqOjDLz05Is85DzFulLCv50OOH/e2u50AHSrx+uV/wGUpkqG+jKowY5d17t+EB4F1vFCTUsqT5UIQPNV+FxhhN40qPDkByAzwtFeL7bDI2gbNJzgLC985FRmHjxgaCrUpGk49NBkhl/u+BeuSp5LXq5X0QLwV7Qnw3O7h+ZNrLLUqErKyzN7nbsMTYVQ1SKM7p+paeMcHXdqSkQyB+Jns0o1i5zH8NAhPmp1/pC66FSV57aDBXtpLix5i7hVFOkPSq8seZy0m8FjDqwOXDJQKkAY3Kr5wqg6v4aXBVuu6tH/7XJV2VMFcuRZrMo3vYNcfA0BaxUgzQMKoXiuq1tA1Z7kieXn4ParUXSUEOMb50UJDAdFz6WZxU2e0cdDxQXJDz8Fae2HF/cBp6Ql9mBmC3ITa1b0G/ANCpwdQ4TCR0a8i36BUFA6BGtaXPRL6qHWf8qJKe3OPt7to/b+Mkz0NdUfy5Vs5Nvp4ewbLc/3LUu6WpEh0CIWo=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(4143699003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C78E149DE43C5F4C9D4814283B19E095@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 Soyrgk7kksHv92imsZ/WrFI8S1wP2fa2WweEKu28OirmosGy1GvJWnTAft90Ove8TQkVEmPcQXptc24Qp20GQ4PskqFMK1+wzCB+xMFiDQN0kQC/DWx5XHCVubkwhEXOyR1CmlddzSuGUd6w19qfhx/2vkWFgfPGNH4ERk4yzHXM/zZepc2f67kK9Thspb+M6cSIr//w0GVx7edvdbnBrxHrG4KscGhWRZ1X1Ug19F3pQ2F7d/luwrvkP6J1odvTI004EIzS6I5g4Cv9xkq3yvUTjNVG926ssTUp0pY7GS0MfUjiJbyIG7kicWMRwMA/4iKJQ6O/Idfq+RcTBhX2Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10467
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	74fe2954-f938-4921-3bf1-08def3c3c79b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|35042699022|1800799024|82310400026|36860700016|23010399003|11063799006|56012099006|10067099003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	hn4FgHvnDdFcFiQ8YjWHO3BRWcLiDgRjWWO26UCrv1B+9/jMAyXUczizharTUqzJqeLjzx3wxzUaGv9HS9MUQ8bvu2Qi1FMuZnaLH33cS7x1ZwVYBT5Chrj0yglD5q330c3NG7BltyNa34JmaTgWSk8bQhT6HzgmTcrQ+DLfcUiTK3DnahulQyIainQr/6c52Ny5YWN1Xn5NYVpSbq/o5niCC1Xi58aN4DXsuFI6DmkyFkShwvFxGR88yo+r0GJtUpOKRJdeVBQNcfFH0yAWZ/yX7ihCvUnja5ndWOLNSoWPmjdi+J2tyb5Wxe4TYHIMEuPZKb9ZQ4TlAzU9NIlW2XFob65cr8QpPKxwMcL40KIxz+r3zBrfrVQ2f4HXFmfnmVG4FBrPgkScCEWd670gdKfE3dyknya2drWb6fCs1RqdqScIM49PTO6mBeadtkEfJowoHeaGWl/tjvO6IvUvSX3OcNkyiNUBWtrVoXkXP3gzmPw1ny1ZXF/OSTNQkdJdpzqfxMO+mHX7uNUEtIZVrcIV0dQGyrN0zO8AsKpau9m6q3gOXEIKjoetn4zFdDVfbjvrqr8KrOcRdBAKSQnEHcS1up7fWhPdfnSxKqM9kyu2zRo3fPDCzTat+7/DmkWY19vPVssCwZRsgvkyHkOHdaUcP5mEW+M2eyDkvKaYnMM57fwwt2UA++jLFKkyDrqT/Dbu1JG8gX7f6e9/7Mxbeg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(35042699022)(1800799024)(82310400026)(36860700016)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	D/myMy6zDDBpfOljscgkWTAVj2SJ5zmoTGpFeO59aGZOQegV/uRWDBvFBiOqOQTN1Xg9xkRHebNFN6TqewpgFmiBlbFprFp0Pqz76Ed3gTwJfKypi/yU5d8P9HFmwsYkqr9k/qY/EqbuiqspoUr9wuDF45ngTEGF+nlsj4TG3WFzJU1rtIwjokD+4BPJb4EcYH6JftgB9HSTHQXT2NhB1D+Cy+U/TH+XlMNSTEzWjbdPbgLd2y/VHkQ9ssCfIWcw1EGvct0bBTtiOvfC1oF6rLyVy8R1AFNBi/e1e56+wqd+2bn073kLGqAStlBH0tN0/X1QgSvdMp9q9VroOWZ761ymMe/c1gn6X4nh7e4ZaeZ55e+LR6ZhrteZrk4JjF21rj7vdmFs+9rbQ4sh9pgEk45GtaDH3XTeOrnPJI7ihKEOUCgO6U6DZsaboBGIXPhr
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 14:06:07.9987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ecdd538-d39d-44d7-296f-08def3c3dcbf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8831
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 14:06:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242945

T24gNCBBdWcgMjAyNiwgYXQgMDc6MDYsIERhbmllbCBUdXJ1bGwgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGRhbmllbC50dXJ1bGw9ZXJpY3Nzb24uY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiBUaGUgYWx0ZXJuYXRpdmUgdG8gdXNlIGEgdG1wIGZpbGUgd2FzIHRvIG1v
ZGlmeSBfcnVuIHRvIGFsbG93IG90aGVyIGVuY29kaW5ncyB0aGFuIHV0Zi04LCBidXQgaXQNCj4g
d2lsbCBiZSBhIGJpZ2dlciByZWZhY3Rvci4gT3Igbm90IHVzZSBfcnVuIGFuZCBjYWxsIGRpcmVj
dGx5IHRoZSByYXcgc3VicHJvY2VzcyBjYWxscy4NCj4gDQo+IEkgY2FuIGNoYW5nZSBpdCB0byBl
aXRoZXIgb3B0aW9uIG9yIGtlZXAgdGhlIGN1cnJlbnQgcGF0Y2guDQoNCmJiLnByb2Nlc3MucnVu
KCkgaXMgbWVhbnQgZm9yIHVzZSBieSBiaXRiYWtlIGl0c2VsZiwgaXTigJlzIGEgZ2xvcmlmaWVk
L2JhZCB3cmFwcGVyIGFyb3VuZCBzdWJwcm9jZXNzLnJ1bigpIHRoYXQganVzdCBkb2VzIHNvbWUg
bG9nZ2luZyBtYWdpYyB3aGlsc3QgYWxzbyBnZXR0aW5nIGluIHRoZSB3YXkgYW5kIGRvaW5nIHRo
aW5ncyBsaWtlIGZvcmNpbmcgdXRmLTguLi4gIFRoYXQgbWFnaWMgaXNu4oCZdCB1c2VmdWwgaW4g
ZGV2dG9vbCwgc28gSSB0aGluayB3ZSBzaG91bGQgYmUgY2FsbGluZyBzdWJwcm9jZXNzLnJ1bigp
IGRpcmVjdGx5Lg0KDQpSb3Nz

