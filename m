Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0CA9F588D1
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 13:55:21 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20227.1776693320497032397
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 06:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=m/eDa/jY;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=m/eDa/jY;
 spf=pass (domain: arm.com, ip: 52.101.83.10, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iIHLXbqzLRMo8ZDAKx0FbTiYqViepNb4wxEzxzbrRp4LzzDbe7vi5d+ck79OmVIMYgvzexM7PfX8u8yQxmUrZ9lclmlwafDPB8fcngj28y1+NpyLkbq3Q2Jq5I+rE3V5wSCsMyjeoJRAngwreBr4z5GwGCCmuDSAkQQ/cjnkrMoAu2/SkVJLQSOuUlSbDuR2u95Bmb5wtUZ7PYudSuB3wEdJRJRUEzKKrriOWFpA1oOEtkEyG0xJtPEsbvktv7jEaZtIsNWPEVweVlmkX4Ba12SpPWWzpRbFtax7XLedCy7X5oM3Ek/FtQvsQodUEaicrUrECsNthTJBrKD9iy8aCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQj36NZYqnjCjL9cFNFRceOq0bDSj7cWKUD1GLBtjQs=;
 b=UTVbH2Dtl4iaDLZW8fMzLb2ny0ltdWrYX1UtfF9FSXeN9ktpnuah9BHqOb1pUVq2UNvrxM0XUgtucQkGjeohCrZxhXp4jtbGGlswx3O/PXFAdYEimF5Oza81Uw7LrgBN7qxOYwedZerLgVqUF63uW0ZeOlNeKJ2of626ALKCQ2VvKxg6DOrg9HCUQlkIZw7FId463jNdUVOce3BEwty5oMwF9ak/crPOFZ/rSnF22eSV8sNj6axzlQjbzIo3pyDovo0dNDlIxATCqaJlXTcGoJVfpX87syqaNEF8zcjFbzO92RDmpGszbKcMJuAhjfBS20M8IxtyGuGSjMmosW9TEg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQj36NZYqnjCjL9cFNFRceOq0bDSj7cWKUD1GLBtjQs=;
 b=m/eDa/jYqQzy+xlU4NOUvrtE46h/i2QFRvZLLcV5hdUPo0q8LO83Y7zy3Ub7nVGPQORryElhcyXLYQ5KFcIzHABJchiSMcLEw1SySjHyFa8uLAAEkTgW0Y7NolD1RGuRsE/qv58j/C501arg3FCdNAbC4P4F1djcbr5Z+U2K76w=
Received: from CWLP265CA0467.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d4::17)
 by GV2PR08MB8343.eurprd08.prod.outlook.com (2603:10a6:150:bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 13:55:11 +0000
Received: from AMS0EPF000001AE.eurprd05.prod.outlook.com
 (2603:10a6:400:1d4:cafe::59) by CWLP265CA0467.outlook.office365.com
 (2603:10a6:400:1d4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 13:55:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AE.mail.protection.outlook.com (10.167.16.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 13:55:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+tdun2lacbZ4C/McLvWTrX6e1nBUPaszvDtcs2FqFySisSzwLjqANIwoo13qO39HAya63FZPEmjtSiT+ZlgK2X2TKt/B/xgSynjTa9cq4k0pMtr8h6hic9iuyJorRvxnpWWO4MlqT1wJ4hxWEzRRlYerqvLF0Rp52EIwth6kCaoJsgq437o6nVp2ViRpBq+BfgD7yOuU+p01T6fWWkhjKva7OTMZCMRMLvn9p6Ff1yvBq6BSy2G8UmsvTYRnwwNVOdQdUS7sDWc5GKjur376CBbXlgpkn2nbHamkKO0KtZ7FvXoIbhgQZXxvexpLszaLCAwrQfm6CgLajjPHKKMdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQj36NZYqnjCjL9cFNFRceOq0bDSj7cWKUD1GLBtjQs=;
 b=WcvX8y6A3/234D6+RP9DK5YPRZxYeUcI951IwCw8feV3a9JeMcwDooT8y/K2DqMSlEskBj1U9vFqvQITMQMijV2taQyVq27Axg1Grb6ga7f7IZ5z7RtxJIhbD4ZjV76LpIJaX8B3Lv2X1n1Qj+dDTBh3mZW018IaKF/gtCD2PxYzs88yIB/LsAwfpFxwRDlZDIuxWOK0/3kAnz3Bypr7+e/XpKZ7CPuh5aVfaovWNeIL7e20Sv7bIQYlH0tSck1d8WDCi34AQGMQuz1pQYqT+LhQt3mBpbOqta0xUD0ADOXQBYQV633hg3uZ6nY9vD1Cxqr2ByX+gohgx332N8cO0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQj36NZYqnjCjL9cFNFRceOq0bDSj7cWKUD1GLBtjQs=;
 b=m/eDa/jYqQzy+xlU4NOUvrtE46h/i2QFRvZLLcV5hdUPo0q8LO83Y7zy3Ub7nVGPQORryElhcyXLYQ5KFcIzHABJchiSMcLEw1SySjHyFa8uLAAEkTgW0Y7NolD1RGuRsE/qv58j/C501arg3FCdNAbC4P4F1djcbr5Z+U2K76w=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by GV1PR08MB7756.eurprd08.prod.outlook.com (2603:10a6:150:57::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 13:54:05 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 13:54:05 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "zizuzacker@gmail.com" <zizuzacker@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] meta-selftest: add usegroup-deponly recipe
 to test USERADD_DEPENDS only
Thread-Topic: [OE-core] [PATCH 2/2] meta-selftest: add usegroup-deponly recipe
 to test USERADD_DEPENDS only
Thread-Index: AQHcx26nveGu9/DPXECXAE5qftnQubXoC2IA
Date: Mon, 20 Apr 2026 13:54:05 +0000
Message-ID: <84DFD5AD-684A-4696-A60D-8C3339CA4678@arm.com>
References: <20260408150003.18063-1-zizuzacker@gmail.com>
 <20260408150003.18063-3-zizuzacker@gmail.com>
In-Reply-To: <20260408150003.18063-3-zizuzacker@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|GV1PR08MB7756:EE_|AMS0EPF000001AE:EE_|GV2PR08MB8343:EE_
X-MS-Office365-Filtering-Correlation-Id: fa637dbc-206f-434c-fa96-08de9ee47052
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 b9T4X9u1Q/jJeGrpxlkJk9aW6IZxBj9F62LGE8Qx/SK0khHS1wzcTA5htEc5bUnvrLeCemrv6Bcgf/CNMV0yU4UiJg+M5+u/qr9PKYsqts1b4EjD7bqdMDhtl7UdH38QQ2xhByDoUalAEAdcd5k0sQKkkC4hyZ9/0XVsBGCANi7T3iJ7giZqWuVN2MmyvJ7oXpv3iOkgXR1CpXL7CLoBTSKo5DmUpvoHYQhVaMUqW/kU6XLlVXicZJxVy/VMH0n9PqGKlGiqr1UR9Cubr6V/KknKCDsEQGt+CgSdpS3AsrobIs6VXvS2yEkHjcPEV/CfDvoEPT47xM6iFvS5kht9jqgxNUXDPo4uQH5x4Tqf6ycFh+ApH4lVBsBPT43TppMeg/jBfHeKtyzcAAeIstoSnqjmI5GI69GmXyOqwSawPJ5w438ZE2RzCbVwADVBFC5s8UxyP9jEm06+oje9X/CKmyzBqG+Xs2WJfdJjj+P81te/0Alo5u1pxR5jnvGdNw9unXd9Xevtd2wAu4BEoL7CV6LKgopq9osWzPiXRL2TsLYNvnwl0mkWYWWCrokFioh6aia0oXIw/zN+/DMxKHpnghqoOQ7iOi9H1PpP+8h1PQ7oWxk2tTu12ZoDqwQqmvhA/deMgAz/lpEKOOF9DTU3lA2FvZ0NIfNWe5CAkRomAqqt2RZMneGENmRv+Wpz1W0yNl3+NtI6/QBMDJXF+tUvptvTAqDleGL3ZSZ8P1OdRfwhpz/ZAOKuONf8sCjqL9OcJ3uKV8jlXjurpKnjOZL3Oi5yvaq6nbfc+zJV0BOIjMk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F8978CA2A3F75845A5E10A1E824BFB6C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 E4nEsEcIJf7oXF3aK1fkjqa4LwogvFoliqdVIaVVXy0C7Sarvh68fDDkjvwLR/8PronWqGZhz1rA5M4tjHUlv4715VxWaRHaSqb3Lw2P9akejKZ7ttquAl8Ug6rFJf3BGBTYD+MOn7Ik/wzwrFKZ+TFGLsNB12CoqkAKVSAnceteEBDI646Izk2q4PLX1TTQzeBi5BhdvNLqlVakTjMnVgNgAv/DoAAH6wIC//fgg1Q6ZWURTE1hO0Db5Y8GwNiop2UNphbl6qqJR3Ziu+jmG6/yoYye+0RMxMCwbSG1kNTNdRbcZa/xz65lnfMiAT68cn+yFnDIym9J9iFs4RIhyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7756
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b9e51cd9-685a-479f-899a-08de9ee44941
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|35042699022|376014|36860700016|14060799003|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	jGY7SDZPhxtYh7gy3ppvObR+uWzigh2Wm5FEiJaVSWxBGyZJcI6nrYTwZZX5jNxCrPzYc6vA6W+iHHdVOpqi+8ZGWQVUFvjgddAPPx0boyArbCglQnce6b5068amr76k2svULCcMzEc1Spzqz0xgq1c8FhrsRqUZUpyxTf1efcivQ0zH+GJbXA7h+5Lqdgf9+UB5aO8oJUu1/dV/qZN/avl9umQ1mSJ9r2yBfy5dxMY7BJZ6xIO4mxBkzZQ5VuUMQdKe1SfWONBo1Dxc49r+nBjLCK3k7QTRjuGoJaFh0RX7JNoXDeH5//sf+cP7sXNh1zpklSnQ5EvUNdGx0XshxplpfjEqkVAzySU3BN1KkGHXHqQmzVRZEGMvs4dLTSRPiXk0Z3gWNZIFt2NUOar5YIwsUilgJUQMYtmqSLP4s7dRJgYWj6Y7utj0ifBFDACErQycy9iyguvzQC2h+nDgrSUyqRLR32Xtlmk0PMJS/VM173B+KBEtB48h9RjzAmYdhZYdeIv5J5FA7vu2cFwiQspKW3AXuJ4u14Xe+sIGGoPy9/IGHupkItR6W8RuABSa1kFfGMf9Kge3wzyEj4dWGyIRu/T3hpNkKQqdEmx6c5NxnXlpa6LKbgljLV+cg8Wo9RmBGSkvFzmbCGLpbScEKb6iCEag4cjS5wTzHoXOhoiheFqp6KYtWhmxIZ+r00nIY/0wS567moYufeOPs3lI1PV3EugKDgwGvwlISV2MnV+YOg3f9m02it/ivu9VPzChfnxu2bN62437WKPkIkqbGQ==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(376014)(36860700016)(14060799003)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BLqwRJXd5MNLwYw2Pk5n/pJaRe8zpW1KZgbBLnSsPF4s4tQ5eM/xGTmxCRF2KRq4XL5dl1xGmYILQ3FFGapmn4pfS2gVm2WVofwcHbU8K1M8Tt+C3WZpWqoUc+R3spwCPJrF4aS8KkFytnWUvoUcDdnOsvmfdl98gnbr704V1LgqKOfv0EScphS73ibtiArcPPNgIaYonUzk/u0yfGllj/ldfYpMQfYdxopgNR33wBFWfKwhZjgWSdT/msPRVbnE+xlFDMFZCVpK00J+dZUqMbMLXEQ0P910Ri/i+FPrbh01ChncRt4zYC9FW91b5AFQMcaaE6rOJGr+EL673SWDpsdmijZ1rk4Ec/4uaDLFeq0EIBmmw/Sn0zvYLIhFZGRgI6dNkCsEaXZoEu9EYzFeLLTkKPUx/MzxmHjFd6nRpAWHlWpgqiMJa5C7Wo26Rj1y
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 13:55:10.7001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa637dbc-206f-434c-fa96-08de9ee47052
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8343
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 13:55:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235567

On 8 Apr 2026, at 16:00, Zk47T via lists.openembedded.org <zizuzacker=3Dgma=
il.com@lists.openembedded.org> wrote:
>=20
> Add a test recipe that inherits useradd and only sets USERADD_DEPENDS
> without USERADD_PACKAGES to validate the fix for [YOCTO #15863].
>=20
> The root bug is that useradd.bbclass unconditionally requires
> USERADD_PACKAGES to be set, even when a recipe only needs to depend on
> users/groups created by another recipe via USERADD_DEPENDS. This recipe
> depends on creategroup1 for user gt1 and group grouptest, but does not
> create any users/groups itself, exercising the code path fixed in the
> previous commit.

This recipe to exercise the paths is great, but there is no test case for i=
t.  Can you add something to oe-selftest to verify this builds?

Thanks,
Ross=

