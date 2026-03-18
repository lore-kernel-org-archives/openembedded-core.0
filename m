Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9142A10775F8
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 17:21:47 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19919.1773854496285869487
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 10:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RATL9s5F;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RATL9s5F;
 spf=pass (domain: arm.com, ip: 40.107.159.58, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=XTQDVmS3vz07228FNECoCgeCApzEShRQBbGUd/4tvqj5N30blcXPM1mDih3SHnyKHwxDeVWC0G/e37+uY4LXiKX8JLSfz8yILrP1dgyxcOuTETKVOtCoBk1JKK4uJYYz32Kekhx7pwqAeF1JGU3R04hlCaebyNxd3WYMs7WwPu2G5LZgENR8GOYkNsKGLSlYmkU+xxGS/2U2FPDKraXL7smCExTv7dns61Iy2Za9AlYQCGMPRUJY2qysLhhixiSbn26JQRENPyB1zBRrIbsCgp9c4OwIhbmD5xdel8EC72bo8AXN1tRrYzkh4PZZsX//xujCHOPPtRXeCriXmRibDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3WAM0xdWoRNs8LHIu2nJzGjxJ87sQsR9ILw76D+MP10=;
 b=sTFSGljbjtW77UvaeYG5m5aGKgUDURfmHfEgm5/bAfYI3JOLyE0O/GNj27oAYdZYvkax6JDqochLEWZ3svlM7GTAnbkJNrfQQenDtkY3pntNWcyjg9+y1HEBXjZMw+6lO++7RmpMtpNnmIkvxpTJNOvSyiRLy7c6ICL8vMj7qm5WeJ7w8QIjygwHVYf6xBjj+3s4NFRqRYSZaykjEz3hVPfMCakLMky8F98sZaFJBqP9nyuibvJlLr1nDde80dVHK8nGDZ3wvWxQJUkxgXXU/F9435dq8cw+R0389cJLkxrgxRoujo41mptE28Wyh44I6sMqoBiXRh9T0fobyikbZw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WAM0xdWoRNs8LHIu2nJzGjxJ87sQsR9ILw76D+MP10=;
 b=RATL9s5F63nhtqokQjepsNiR9Kmwf0Msv4a+Wiqh+5GDKq6ExiZg/nNjTzLBkXEt+vpprIxWYtWPMZdXxbe9JnCh5y0qC3Bb+ww0SJTI39G1V3G36ocMHglvxJ9asgeH0qTRzUVXJVgMl36i22ILontJ/X80y6LS7Jd00vJ+cVc=
Received: from DUZP191CA0062.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::25)
 by DU4PR08MB11809.eurprd08.prod.outlook.com (2603:10a6:10:642::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 17:21:31 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::b6) by DUZP191CA0062.outlook.office365.com
 (2603:10a6:10:4fa::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 17:21:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Wed, 18 Mar 2026 17:21:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNDTQoBtA6GBaNDVdbwId6UUonmuN63Kf3bLS6S1XZhQ+4PE2ZtOudK8lYIT0CGkeHyYkJzmfNGNBjybG+3EtcHArsYuHjSblyrmR0/LJwY4qPBUFpyn+focQ3IWkc4iwPBQGBh5tCfubjPEox1fPWR2B5mch3HvOeyfnA53Ny6KXLR8hWczU4EAF/IrFhDDC1Hzqe/arj3Rd8mqyUsBfhmGpox7dapIF+j2FTZ8+YtpF0YZyN100JFLGINL6/nBT21acrQUa34S6pnLfeQOXwhkKZpNooH1ZNeuyG2I24MUlKfyNYxgG3hbheJDE32cGgZZIrZOeq7/zx+2JCbjVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3WAM0xdWoRNs8LHIu2nJzGjxJ87sQsR9ILw76D+MP10=;
 b=ttAPlMou8wn7VZye4hOPqQ6HKdNgqw8sTQ6VLhQlVQRltWy0F7LY6ZYeMcswQfWqOIrG6kqBkc8meRa4L31fGgQkORV+xAxhJA2d+zJKejqALHqZ0RL/MhuQN0t4iq0lJ3+l9uf08hU9xU0L1mfQuiekoWOyuwtpYRYqEN+/RVq0czYD0ANAJ/p7CCPuCS7eK/Sqz4QZld4HJAnlln1VpKPZI0bAVWDUok/LGJhzp0MnvK0roeIsUsdgr+0/aTm2ZytXXK+50ipzkmb50Ch/xWjUrYSRrmFdFXmWIKK9qEGCM/bDFN2IaHqjInF8rZsaeZFtsGKJV1zjLD/9C/GuBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WAM0xdWoRNs8LHIu2nJzGjxJ87sQsR9ILw76D+MP10=;
 b=RATL9s5F63nhtqokQjepsNiR9Kmwf0Msv4a+Wiqh+5GDKq6ExiZg/nNjTzLBkXEt+vpprIxWYtWPMZdXxbe9JnCh5y0qC3Bb+ww0SJTI39G1V3G36ocMHglvxJ9asgeH0qTRzUVXJVgMl36i22ILontJ/X80y6LS7Jd00vJ+cVc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8087.eurprd08.prod.outlook.com (2603:10a6:20b:54c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Wed, 18 Mar
 2026 17:20:26 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 17:20:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "liuyd.fnst@fujitsu.com" <liuyd.fnst@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v2] libpam: upgrade 1.7.1 -> 1.7.2
Thread-Topic: [OE-core][PATCH v2] libpam: upgrade 1.7.1 -> 1.7.2
Thread-Index: AQHcmWdwJ6PHDMmyT0O2mVcJYvccTbWRUbpugCNyb4A=
Date: Wed, 18 Mar 2026 17:20:25 +0000
Message-ID: <FF382BB0-EF92-4915-BB8E-AC2DEFC71077@arm.com>
References: <1892715AD9360F1C.449619@lists.openembedded.org>
 <TY3PR01MB10110545ACB9B18EB8F38FF679B74A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <TY3PR01MB10110545ACB9B18EB8F38FF679B74A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8087:EE_|DU6PEPF0000B620:EE_|DU4PR08MB11809:EE_
X-MS-Office365-Filtering-Correlation-Id: 867b5cbb-0f31-4799-ec78-08de8512cbef
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|4022899009|22082099003|18002099003|56012099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 xBHZA4AmWp7gV316nE98gDwj15vGt1I7XCSA/jE0/NGA4QHpcjvy5Oo/YH415QEVS1maatYajemWrZZn4r/jg0OEGZcRqyRFsLY2vBrJVABWA1Zl81+nubKhGJEegEiNdZmambBeTy924NXvCVbN2Yap/BD5HKpOTnEKNKYTXldUW+i3Rz2pCDI2PeJrlsaO7qi0V1ryhD1zV2ROmPSpQuIMamlabNXt+VY8Yhr5WD6ADxweWwzhrwNDJxxyOOCos8JTehUEi6CLU9YY5pnjImlKCO07VrMB0ztXFd8svUsmlBpsMYjT/dDm3k+MEWSx+DPm0WxrRt9mhgJ3JR8tYKisDF+2VD8jtAxOsOH5w52ZEhofffGkw7Hl1QWhV7r3x8a1urY0xHpbOq/lktGJn1BA8aCRyHZPi2KvVcjL3qK8Pf5uUKr4YzK3uC7NfJe6AiqHS2NEgM5o0H3moyve6sINkmeT5mmd36eqCKOkArUeSB/10LXpuxXLCnbDKttYLCVob1TKnUwE2OvsEOhZ6A1+jJSfcAs08esDkRYMAArV340xXfStLirM9gwaD0sE6CNZ1jvrmFq2AkFumLmp/jKhHqCQdnQ7oysQyg80L5rEVpcNt1UZDVLexLY/btBADEBuwpyYgWJrkCKOE/UPeMe5n2EjybtCFEMLIZyk7AbSnfoU7EaUZtM+vHYri4UnfqTgdILp3MvRKYtZE9U7Tzrvc9HkzW9UjYkTk2tT9BhdxdLmnLU7zIB0n/ITaI+D
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B94814E1647CAE40B3D2AE4CF1B58CED@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 qkD5PA8n+sln/3XQQ3Jus/R3XXTJAcEsfzKogyyvlsbn6tcC8X3ZlBEVdy/IV2bzmzlhbYQ25XsYIrZqtCDYdhoMPiuX+zcAIWp5jIjMQbcmdkOzYO2/MKba9mooNV6ZFlYHRbgUvb6JSncQs+1g+EWrOS/ir7hSy/9rthnrT1pqiBDThC20FjrPY2BklBAvNLqDU52Y5V7+dFhqKLrZ4y0HP8gP5EkRKMuekuuOp0U9SLAeIKEEsZx0/EzuznQ+9uAuKMEVUKwkQl81gZ0+75Zyf/NMeKurJ6teOfowUuVhZ7XUMSSAYke6V/bglqUfafbN5xWNbk7z75LfzRbNQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8087
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5b613fae-740e-4b0b-15d4-08de8512a50d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|4022899009|1800799024|36860700016|14060799003|376014|13003099007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	WV6uN/fkBMMSR8LB1JrKmEqbGBFrj+HU++AD06xeQrhfuaSxs7WsvowL5QzrxJ/bNmHRdbKazP1ovX4lpP8hkyXl2HCAUG+slBciU24zz6O3VIWpA6bUaB6/ic78PW1PkIyBpvrxH4dJ5ouEXizGUJOEbAatr2tCL8IWbTtNtI/kpepD8U1LGIUd9cSGjHiJugZTYfgS3s73CLRKg508RWUTsdJWWvmE3+NQKDGaC5w7x5t3q2X2N0lOtcvKV2m/Ku7sAwFg3DWG9RXEXmc8sxN1VZ/ADGbpfcSPjn0oq/bndxWvRZOArw9XWpuQONebSSFs6txuuoZV7V1lrBQfxUm2Z1yT8bP5Yk5yVRXB/LX5TCGe8jbhHqIbbzjbnWnLD5SnTKvCPtICxW3UWRH4dLRCfKHibn7PPODG7TYnjWzorQqb9PYcNtkwZ2fiLJXvMyCsMktHM2e5WsW6olgHCKET1JHrrriLme2blX/WS4JfD81J0c2yq7jj4wP3AVBArkPrwdr61gBp3FuilFVAiVHwQNWMmj7OhN3zWuZbZnnVpLKpJyHJ0BYkeRR97D1sFTB8we2qXC3dnOcYiARJMaKiWBn3Sf2eZddp8H98sxUT2QqNRQhIWx6hYJk1SemVCM6Wy8KgkUurOcgTX6bjxnNpV33BjAIE3CGRWLsdKUl6IJOubiSpCu4v5DZuiFGazG15L1+mv5azpvfUP8Dt25z8vf/BCwPjbs7S/f5+sew=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(4022899009)(1800799024)(36860700016)(14060799003)(376014)(13003099007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RlZpfZ81fQzv8jCzaiiFqTeFGZ/hxwsdkioxjYYKZ25uRFAfK6iqLfkru2r0CG921bepn9/YeGMSHVSQUrAqfdTqy54LjdFWMroug8gKuGc1YH1uHfCZwKg10bo3f5aL5SXW3UH2cw/j8YGDF5JjjhAuZXTmgBQBYET1xpJRt23tsCu+n9Lz+cN6laZAZScKmBrHpQHgn239B/+TXxbM1Tnf2eASl/r1IniI56K5VRscSn4QJgJUVZAix4DJJG48PadyW2QIRFHo40TO6237kQmV43WN534G9+fKhN73k5JQTDa1MimX7Ok+l/BhMdf1v9NNnEM99vA8O3zClmnstAEqQL/uZWKvWNwRe//F+MoxDLC4VxuhMfyvMyTc5sSG0ijWAnQa88QE3oKE/ldpbUwQsNtHcs92aep29NV3mqPrf5TBB9b6ncS8R9Knr1lO
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 17:21:31.0033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 867b5cbb-0f31-4799-ec78-08de8512cbef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11809
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 17:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233430

YnVpbGRoaXN0b3J5LWRpZmYgc2hvd3MgbG90cyBvZiBmaWxlcyBtb3Zpbmc6DQoNCnBhY2thZ2Vz
L2NvcnRleGE1Ny1wb2t5LWxpbnV4L2xpYnBhbS9saWJwYW0tcnVudGltZTogRklMRUxJU1Q6IHJl
bW92ZWQgIi9ldGMvc2VjdXJpdHkvcGFtX2Vudi5jb25mIC9ldGMvc2VjdXJpdHkvYWNjZXNzLmNv
bmYgL2V0Yy9zZWN1cml0eS9ncm91cC5jb25mIC9ldGMvc2VjdXJpdHkvbmFtZXNwYWNlLmNvbmYg
L2V0Yy9zZWN1cml0eS9wd2hpc3RvcnkuY29uZiAvZXRjL3NlY3VyaXR5L3RpbWUuY29uZiAvZXRj
L3NlY3VyaXR5L25hbWVzcGFjZS5pbml0IC9ldGMvc2VjdXJpdHkvZmFpbGxvY2suY29uZiAvZXRj
L3NlY3VyaXR5L2xpbWl0cy5jb25mIiwgYWRkZWQgIi9ldGMvc2VjdXJpdHkvc2VjdXJpdHkvbGlt
aXRzLmNvbmYgL2V0Yy9zZWN1cml0eS9zZWN1cml0eS9uYW1lc3BhY2UuaW5pdCAvZXRjL3NlY3Vy
aXR5L3NlY3VyaXR5L2dyb3VwLmNvbmYgL2V0Yy9zZWN1cml0eS9zZWN1cml0eS9mYWlsbG9jay5j
b25mIC9ldGMvc2VjdXJpdHkvc2VjdXJpdHkvYWNjZXNzLmNvbmYgL2V0Yy9zZWN1cml0eS9lbnZp
cm9ubWVudCAvZXRjL3NlY3VyaXR5L3NlY3VyaXR5L3BhbV9lbnYuY29uZiAvZXRjL3NlY3VyaXR5
L3NlY3VyaXR5L3B3aGlzdG9yeS5jb25mIC9ldGMvc2VjdXJpdHkvc2VjdXJpdHkvdGltZS5jb25m
IC9ldGMvc2VjdXJpdHkvc2VjdXJpdHkvbmFtZXNwYWNlLmNvbmbigJ0NCg0KSSB0aGluayB5b3Ug
bWVhbnQgLUR2ZW5kb3JkaXI9JHtzeXNjb25mZGlyfS4NCg0KUm9zcw0KDQo+IE9uIDI0IEZlYiAy
MDI2LCBhdCAwNDowMSwgWWlkaW5nIExpdSAoRnVqaXRzdSkgdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgPGxpdXlkLmZuc3Q9ZnVqaXRzdS5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+IA0KPiBwaW5n5Y+R5Lu25Lq6OiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiDku6Po
oaggWWlkaW5nIExpdSAoRnVqaXRzdSkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc8bGl1eWQu
Zm5zdD1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPiDlj5HpgIHml7bpl7Q6
IDIwMjblubQy5pyIOeaXpSAwOTo1Nw0KPiDmlLbku7bkuro6IG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+DQo+IOS4u+mimDogW09FLWNvcmVdW1BBVENIIHYyXSBsaWJwYW06IHVwZ3JhZGUgMS43
LjEgLT4gMS43LjINCj4gIDEuQ2hhbmdlbG9nOg0KPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9saW51
eC1wYW0vbGludXgtcGFtL3JlbGVhc2VzL3RhZy92MS43LjINCj4gDQo+IDIuRml4IGRvX3BhY2th
Z2UgUUEgSXNzdWUgYXMgZGVmYXVsdCB2ZW5kb3JkaXIgaGFzIGJlZW4gY2hhbmdlZA0KPiAgIFJl
ZmVyIHRvIHRoaXMgY29tbWl0IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1wYW0vbGludXgtcGFt
L2NvbW1pdC9hZWEzMDgyMmUyZmE2Zjg3ZmFmMjU0MWRhMTQwZjY5ZGZkZmVlNzI4DQo+IA0KPiAg
IEVSUk9SOiBsaWJwYW0tMS43LjItcjAgZG9fcGFja2FnZTogUUEgSXNzdWU6IGxpYnBhbTogRmls
ZXMvZGlyZWN0b3JpZXMgd2VyZSBpbnN0YWxsZWQgYnV0IG5vdCBzaGlwcGVkIGluIGFueSBwYWNr
YWdlOg0KPiAgIC91c3Ivc2hhcmUvcGFtDQo+ICAgL3Vzci9zaGFyZS9wYW0vZW52aXJvbm1lbnQN
Cj4gICAvdXNyL3NoYXJlL3BhbS9zZWN1cml0eQ0KPiAgIC91c3Ivc2hhcmUvcGFtL3NlY3VyaXR5
L25hbWVzcGFjZS5jb25mDQo+ICAgL3Vzci9zaGFyZS9wYW0vc2VjdXJpdHkvZ3JvdXAuY29uZg0K
PiAgIC91c3Ivc2hhcmUvcGFtL3NlY3VyaXR5L25hbWVzcGFjZS5pbml0DQo+ICAgL3Vzci9zaGFy
ZS9wYW0vc2VjdXJpdHkvZmFpbGxvY2suY29uZg0KPiAgIC91c3Ivc2hhcmUvcGFtL3NlY3VyaXR5
L2FjY2Vzcy5jb25mDQo+ICAgL3Vzci9zaGFyZS9wYW0vc2VjdXJpdHkvcGFtX2Vudi5jb25mDQo+
ICAgL3Vzci9zaGFyZS9wYW0vc2VjdXJpdHkvcHdoaXN0b3J5LmNvbmYNCj4gICAvdXNyL3NoYXJl
L3BhbS9zZWN1cml0eS90aW1lLmNvbmYNCj4gICAvdXNyL3NoYXJlL3BhbS9zZWN1cml0eS9saW1p
dHMuY29uZg0KPiANCj4gICBDaGFuZ2UgdmVuZG9yZGlyIHRvIC9ldGMvc2VjdXJpdHkgdG8gZml4
IHRoaXMgaXNzdWUgZm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBMaXUgWWlkaW5nIDxsaXV5ZC5mbnN0QGZ1aml0c3UuY29tPg0KPiAtLS0NCj4gIC4uLi9y
ZWNpcGVzLWV4dGVuZGVkL3BhbS97bGlicGFtXzEuNy4xLmJiID0+IGxpYnBhbV8xLjcuMi5iYn0g
fCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+ICByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BhbS97bGlicGFtXzEuNy4xLmJi
ID0+IGxpYnBhbV8xLjcuMi5iYn0gKDk4JSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvcGFtL2xpYnBhbV8xLjcuMS5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9w
YW0vbGlicGFtXzEuNy4yLmJiDQo+IHNpbWlsYXJpdHkgaW5kZXggOTglDQo+IHJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9wYW0vbGlicGFtXzEuNy4xLmJiDQo+IHJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGFtL2xpYnBhbV8xLjcuMi5iYg0KPiBpbmRleCA4ZmI2Nzk4
M2VlLi41NGMxMDU0YmEwIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGFt
L2xpYnBhbV8xLjcuMS5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGFtL2xpYnBh
bV8xLjcuMi5iYg0KPiBAQCAtMjQsMTEgKzI0LDExIEBAIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFT
RV9VUkl9L2Rvd25sb2FkL3Yke1BWfS9MaW51eC1QQU0tJHtQVn0udGFyLnh6IFwNCj4gICAgICAg
ICAgICAgZmlsZTovL3BhbS12b2xhdGlsZXMuY29uZiBcDQo+ICAgICAgICAgICAgICINCj4gIA0K
PiAtU1JDX1VSSVtzaGEyNTZzdW1dID0gIjIxZGJjZWM2ZTAxZGQ1NzhmMTQ3ODllYWM5MDI0YTE4
OTQxZTZmMjcwMmEwNWNmOTFiMjhjMjMyZWViMjZhYjAiDQo+ICtTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiM2Q4NmI2MzgzZmI1ZmQ5ZWI5NTc4ZDJjZDQ3ZDkyODAxMTkxZjRiZjNmOWJjNjE0MTliZmVm
YzhhYTFlNTMxYSINCj4gIA0KPiAgREVQRU5EUyA9ICJiaXNvbi1uYXRpdmUgZmxleC1uYXRpdmUg
bGlieG1sMi1uYXRpdmUgdmlydHVhbC9jcnlwdCINCj4gIA0KPiAtRVhUUkFfT0VNRVNPTiA9ICIt
RGRvY3M9ZGlzYWJsZWQgLURzZWN1cmVkaXI9JHtiYXNlX2xpYmRpcn0vc2VjdXJpdHkiDQo+ICtF
WFRSQV9PRU1FU09OID0gIi1EZG9jcz1kaXNhYmxlZCAtRHNlY3VyZWRpcj0ke2Jhc2VfbGliZGly
fS9zZWN1cml0eSAtRHZlbmRvcmRpcj0ke3N5c2NvbmZkaXJ9L3NlY3VyaXR5Ig0KPiAgDQo+ICBM
REZMQUdTICs9ICIke0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ2xkLWlz
LWxsZCcsICcgLVdsLC0tdW5kZWZpbmVkLXZlcnNpb24nLCAnJywgZCl9Ig0KPiAgDQo+IC0tIA0K
PiAyLjQzLjANCj4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91
IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBP
bmxpbmUgKCMyMzE3NDApOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1i
ZWRkZWQtY29yZS9tZXNzYWdlLzIzMTc0MA0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlz
dHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMTc5NzEyMjUvNjg3NTg4OA0KPiBHcm91cCBPd25lcjog
b3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNj
cmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUv
dW5zdWIgW3Jvc3MuYnVydG9uQGFybS5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQoN
Cg0K

