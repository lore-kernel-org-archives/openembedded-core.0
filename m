Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB03C55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 11:23:05 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17522.1786015379032797694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 04:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Feuxipno;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Feuxipno;
 spf=pass (domain: arm.com, ip: 40.107.130.18, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AHLi8bs5vtdljWLEs30O3s9/MVpDnlOFBZg/C9Ad4JYMrOVAVbBIJI2TG6pEWiH0cPKHVItkAw6X8wd9a3UycmarE3m6sBf7o3MJfGTGT1tsLmiow3aAsHW3mAsaLfMz0bnznzwB2dEGUkB0IgJv0EtPTX16usIoz47xHCVbpo29C4iiGu7OplqOapYAXDN5HRWQrAg/1PYhcvq3cCMWf5Weo6OK4+SeSxjKN3GZhrKIkqc9RCDTZM0gWjiE5pz6nLOhI0t0e5ibhxrCx0v/o7Ph6ECgVVcInWeVI0iMXXIJ9Z/l+3VlrP+nHsQxkUO3DcrOD9gIS2oFckXQwjljjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODtQcrGdLSD6qyYjqWXyhSo7kVzUn5DVxxOi8U1jVt0=;
 b=PgZoYz+8MOpuCO3AfJ1QuVTp966/Sj26B94/sHV+lOYj14g3YolVllBf2yaX3NJSg0mXdlZkIsJqrCfLOQQq4Z933EwXIB1NE5KQv7ZS3y1R0lsFRHpDtg2OyhBrGNN3ZzZTVRiiKny5w3fgl03ZtDgTiVHtLk3foGba4JaJG/c5ijexT3QxADAV84DiHYPZlEpj2GhESKfsVChRQpqnVlDPPX539Ea1qXRQ3tRTTuHQSfYCFaINFo2gK2jPixu4IlqjA+rKcg/3YjqamF96VFW4Ec64OOaIjSMib+Di86G3OVXhQ7SBWOLVQGXF8CiMiSY+aWm+tMfHAKLyF336fw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=ericsson.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODtQcrGdLSD6qyYjqWXyhSo7kVzUn5DVxxOi8U1jVt0=;
 b=FeuxipnoLZjsDi3EwbnPr3DLtX7mxFjH4wApklvbkndX55uL8IBvWv22fekbQxr6La3vZaSV+Pb8QurAh11N+yOi/bcUY0j18ZzuXUqu0gn/zYgLay8FDtjByvl5upDr1TEDiqJvftaPe1UEmaP3VJJvxhoGDImgrWKA+EOggFs=
Received: from DB9PR02CA0011.eurprd02.prod.outlook.com (2603:10a6:10:1d9::16)
 by DU0PR08MB9131.eurprd08.prod.outlook.com (2603:10a6:10:470::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 11:22:54 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::85) by DB9PR02CA0011.outlook.office365.com
 (2603:10a6:10:1d9::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.21 via Frontend Transport; Thu, 6
 Aug 2026 11:22:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Thu, 6 Aug 2026 11:22:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A8hLANVV4ZEszHVGNsfgMNNgumUctb93JUaWjponAYYzAF7ka3SUsywHHxVBubKs+FDQhRr33QHnsmt8smk72vW5UizQwoRK2SpE6Z8+Slpfn+krDKpyDRGeC606+MlsVYnVWqXxWEpWaTSe48KdwAYAaRJ/dhV06/J2c8SHZkJ4HCki7o0dAOIhs1yliXvfZFrWh/sx0Jvc9myMzLCIHOXfFqx+zPzuHV3xyiPwAjKGCWldEY6f0Eep6Q4SPHHG8IiSwFFPWbS5ieWl/aytWJ7WT7SpRi1tN8sVnxyXErOXotQncQrez788R7EMOc8LpCL5LgCmKkLed5BM+ei0bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODtQcrGdLSD6qyYjqWXyhSo7kVzUn5DVxxOi8U1jVt0=;
 b=BraQHLBjrm5hDcT8yxaiHvb6SURRLYMzT3RbSRP4InLWns0104wc+zvZ56ueeV+wg1EQyvdJdoDOYJvGTv5QbeLPqayavaSrmzZ8i3jhijwu/yq4Js1QqbPJu3TaGKOBrIaweGyeVbhvDUNpicq2Fr7HYoUf13iCYy5AlrIOLaaqM7cmjTNVct+gohIyNRy9GqkVp6PZZREA8pwCr/hX8b+8XdjwyrGFs+iqDHnGUwfR9YRQGJObS8sJv5Unxez4ofgL8kfC1qOjdJb7tsre2Ue3qKkq3czrdjfs5Q/WzfLezNtjpWh2KO6kly9KpbII3VpXgOGDbMRWmDqzKdGI+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODtQcrGdLSD6qyYjqWXyhSo7kVzUn5DVxxOi8U1jVt0=;
 b=FeuxipnoLZjsDi3EwbnPr3DLtX7mxFjH4wApklvbkndX55uL8IBvWv22fekbQxr6La3vZaSV+Pb8QurAh11N+yOi/bcUY0j18ZzuXUqu0gn/zYgLay8FDtjByvl5upDr1TEDiqJvftaPe1UEmaP3VJJvxhoGDImgrWKA+EOggFs=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AS8PR08MB10099.eurprd08.prod.outlook.com (2603:10a6:20b:628::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 11:22:18 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 11:22:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "daniel.turull@ericsson.com" <daniel.turull@ericsson.com>
CC: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: restore libdw/libelf to elfutils PACKAGECONFIG
 RRECOMMENDS
Thread-Topic: [PATCH] systemd: restore libdw/libelf to elfutils PACKAGECONFIG
 RRECOMMENDS
Thread-Index: AQHdJZUx25jm3EDTG0yA9JIn82rO3raQ4HcA
Date: Thu, 6 Aug 2026 11:22:18 +0000
Message-ID: <55681715-1058-42D3-82B9-880BACD55E48@arm.com>
References: <20260806111717.4060900-1-daniel.turull@ericsson.com>
In-Reply-To: <20260806111717.4060900-1-daniel.turull@ericsson.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AS8PR08MB10099:EE_|DU6PEPF0000B620:EE_|DU0PR08MB9131:EE_
X-MS-Office365-Filtering-Correlation-Id: 136f4913-ba2c-4445-4be9-08def3ad0efa
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|56012099006|11063799006|38070700021|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info-Original: 
 Y7Msb1vF+LDSihqmB21rhqvCGSVT7YvhCQethy6OlT4JnocQx76QQYlPB6X27xZ9//WeTZpC+To5cp4aJL5Dk96UZ/1QIHxedVhUrkirCn6baT89IED8aCwMozw2qRqvilsBCHeXhAJOXWDuLDSt2HGoJqDc2wgnIVt+2waxkqegdhOVahrQpxrgCXcybrzhF1Nc6AUqcjWsNJ035t1YuNi/Jpg8BC2DF7EsetH2DWirSJu907bA1mZLWOxNV8undIYSULrSZdrgcxmUYQtC0cHfmrWZLhBVATscVDQzIhkdOy7nwm+WdpzG1Bq32yUsNNWaqnKc+g14CpGYpIt5KqUfIeBk6y9TIS/Xlx0PRmScYhdCzSNwmFxSodCLDKmS2uNut6A+JMWKA+PddmFJj65mLlx6dvDmaPMfh2lyFKBsOkQbAlHchzc3wtWbDTwhh6JYVsSJd84SPFW+AcIap9HX96VQCMFoTGQZPstckAFonGbj70F/gTrtHnPsm4jA6V0YldohmrPxerYjqUiAp19iwwCNpLRvz7b1tCOrulTJIl70ewY3e+ioIbtLjrn1RMyxuTfZHJvszpz+G7Y6Zn3qHqHBM1KdlPyEAmIXkO/uqdyf6/yZIaWVjj+8ZZudR78lzoRSm7WERqVkfqdR5sDmpGtktSNAza3W4qfn57R4mEVTJjhgMY6aEWIUj67YzvODlJpuu0tU80ZNAd9EXu6a+QpKheznURkrWNYc7q0=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(38070700021)(6133799003)(10067099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3366EEE83469B947A7B8ACCDA50C9126@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 CE6NVcRSUCvkBh+33w35yPheAgCqB15yBWr21VJth4WbVtbnMhuUR+h7KNNQ3Kw6aEr6SALpWEz6+dci6P7zIXAj3D7mFxWBP4V2lhVGX55JWZQbaE5VYfZeApaSW0MwiM0NXiH0CnHtu5TUF3MI/YrITjB44ImslPzpXV+69O42cmyXB2MF6aQLWzEupE3Ce4Y2TjutHIH5FFvI5eCdXc1ghd08PfwqldNOuNq3erIBa3Hh3A4XaskC9HyocRFzVbp+h9sykpIRpMuTSOoXQpLWDAsYwKazty7o+3bph1T7cKSf1GlhgRVMnKf8WVrN8KFz2jdRNINSD2czC36I2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10099
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b3602197-ce74-49a9-7591-08def3acf9da
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|1800799024|376014|14060799003|36860700016|23010399003|6133799003|56012099006|10067099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	wHyIqZEGv13mu5pS7LAgnYq53TUMuJPTUNbaV2HLZyk0OLF8+pXGVbTc9uoPSf5eyKUaBSjSzuvrdt9eIduMOkJx9mvUTvqSYDXEHEA75QFqhcqGYb4mM/u/T+z5eyOkd6pgXv9KeTgFxfImrYH0G8nlyMWv02GllfUjB9gDiB0S6Ws5o+M5tgtjtmhGrClGl8vig6kkl96bsOmbR+yBaoTSEHHfIlRx60jEycfl+tuwYsE7T/+0tP5bIvqUJJFSmvWx6r7S1H4r0MhOmw/Jv04+w11jUi4CBjgGTTFc9xVOxshXxH1tOtZaDCDV7nodJt3BC2pZ4DgSxd86yPfGfDx2Kdj+Ih5AXEo2VgL22XSXHgqeginTtMEVc+x646luMhCkgg20Za/r0KH1FhXMzO+WtqZqbI7toLG8ekYO8LbhsCkYqF1Bu+dzlhOFIQQRTN4P1XjGq6nzySOxewfNP2yuIRGR0GRHEdFI4NaEqm7JVq3QZ+YVaPnv9Miwzuozt2NiZkyKf2sNdNgzL+DPgX71QX0DTw5wUUz6O+Suhkp7busWI0S9KtEbkhxxj63L0gB+rVaiiSzyugWsLH2QV8nf+dpwkiwV62ejBxisfDQSl865JMns0H8nkfXid0JPsX75u6qfhqQqhhb8x7m8R9h+NHtyK2P7HdJURmMVKXTUDiTKrVCmmyVx23uncCY+u3E+xBfAMqyd4bh9DSkwcg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(1800799024)(376014)(14060799003)(36860700016)(23010399003)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	l2szviI5glAa5c3hZrUYfZrlnTnuBf/I9b+yQgfmRm+/Dop3Mdu4tqrEkRYvCh4o/Mi+bOzYZHmjY/wFKoUzn2ATi5CtG9BeT6Xet7qOkK+sWWreI7Xaw4b9+HRrXLsf0dE7sawIoQkJDDDUyCBIUypI3qKd6qKAHXXIWxzCbsVJO9ObnRg0Y6z96n598/fqWGcw/BslAN2Ej5fAEgTvLrWaXCg1TxmBxlFVUE/aHTUfXrOv7BRDsm/9w9E/qby3ZJcM2j1U7GwXo29E5epRb40rKUr+7KyDquxdK6wJZLVuIi64TD6W2NTVuiT2L4uCxEx0zva5Qcg35aEV/z24vqfpbh4lDZtFhtnXscw3oBWtPd75bClBMSHgrBCbbRuqGw56UuocQAQ2IyqyrdhelnbU2Ypw+WfK5rwEoPRJIJxEsvpcbk7iPBwPnbFksAEn
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 11:22:53.8897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 136f4913-ba2c-4445-4be9-08def3ad0efa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 11:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242929

On 6 Aug 2026, at 12:17, daniel.turull@ericsson.com wrote:
>=20
> From: Daniel Turull <daniel.turull@ericsson.com>
>=20
> systemd-coredump dlopen()s libdw to symbolicate backtraces. These
> libraries are marked as "suggested" in libsystemd-shared's .note.dlopen
> metadata, causing them to land in RSUGGESTS rather than RRECOMMENDS.
> RSUGGESTS packages are not installed into the rootfs, breaking
> symbolication and causing test_systemd_coredump_minidebuginfo to fail.

If RSUGGESTS are not respected anywhere then would it be better to just cha=
nge the logic to use RRECOMMENDS?

Ross=

