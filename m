Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB7DCD98F0
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 12:41:03 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14423.1781700060848369205
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 05:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TGuUXQ7O;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TGuUXQ7O;
 spf=pass (domain: arm.com, ip: 40.107.162.4, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OoFUSk2CF4/OT/b7xXwWVBzY3vtARq7aj/8SAeYuGmDPVc5gt5t+yGoykN+A0eOOwy4Lnxx9CrGeW40QYw+F5XlIWNcAzwsBMYDaxCvhtX53NdMJqlVMzsfE/gah4BT/il/vUf7H4vbyxP6bB8zpKpQk6zWPPl6/q6iWn3g9S7Hr3mdqqxY1AJ5s215Qd3t6382bAARZwI/Dr/jyLbpVwMi+g+yPPLr29tDzjH+F1azt3Mn0x9sUad9is9bvGo9hUFIhJ58mSXfmJ4cHBQ4+nAZreMSmAZEhtxGG5UZXSoiIPcx0AFA6RzLAEKe8JDrHmcrfdgfgIkF1HXgJWqPzEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H152XUxYlIZrRiLxZJN8L88r6Wbbqp4jdCZAsez3Lbw=;
 b=Ok+y06alqJWa0pOHBQUQ79v0V1kGsLzjPhZwu9WdUYCD1RHEqsxVgapIxmsJNQV73BG5HCglSoAQwtnNpxJYu1oVJTS3gjRJRsRARGKi6Gd/rsyKqKumdTizOuT3wb+kMO/vTqHeAWX1pbA0t2hD2wPLgzg9FS3RHXVya1Z0WgEsTlm2gn2OrA1CmqpYgXQvL22wijczIS6pIZ7zN5B1kpNtERTi5cdycP2AWJ9q5XPPeqwk7pSqb18aNwY1A1fyfgOcr9dY+orq6IG0JO13erYjo+Xc07tbr7vyirE/4wAPwkWE5CjGPS4Ie3bx2NuhHPBhccxXa4P7ZUXtZJFZow==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H152XUxYlIZrRiLxZJN8L88r6Wbbqp4jdCZAsez3Lbw=;
 b=TGuUXQ7OGRjBxvVpnYNEV+UC1cPhAsGyieyDk4k4ZCbC6sMRiXvtedopQR2LZmYqQhGv2uDI/43tsdJw1fObN3D6vOjOVGggoLM545YNvtJWOO0i6SCNrdv81KFOGIVrrNfhqVMuQUmPlWJrHVIuGfT9lXI4ITvcWLbh3wEIA24=
Received: from DU2PR04CA0239.eurprd04.prod.outlook.com (2603:10a6:10:2b1::34)
 by AS2PR08MB8261.eurprd08.prod.outlook.com (2603:10a6:20b:550::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 12:40:52 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::10) by DU2PR04CA0239.outlook.office365.com
 (2603:10a6:10:2b1::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 12:40:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Wed, 17 Jun 2026 12:40:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rYEwUAY+mfIHBT1S2zIEzB58a/coe7u8+xhhoW6FM6gJe/QVNXQAeasmYOY9FAybmsd3FIzer6jwwDVLWbGkBRMBZ2IAsm6rS/mw60buxaqJ23lbHuwrqWKfngKs0CnYvAEmT42CWx0KVHu9JAK1vnqD5dQ06buBqJ9M7UKClv7u0WFDafVVgry0APMCPiESOJ+SueagrYXOiTYN3V9xQWcPWONNS+GpH13CoIl09tOIKmORvaEMecdBqG1g+8P/IpHHeskGoxq3uEv3Zb8AvTaeNrrfYus+7llHcjWRqG7rj2cxpfz7VOrar+ywWVBBcMKqMo7LHICEu8Zv3Tj9jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H152XUxYlIZrRiLxZJN8L88r6Wbbqp4jdCZAsez3Lbw=;
 b=pCwF9VaN6Edvk6155XYSV7XfO0ZpsMmXtWynWzrLr4qKOnXOetBbssrOyn4pCeEyp0EjwMdd06AFPIGdkqLAWDktM6/y33Y69xIUOJHESfkRQGgSWK+mNnzPUewD3JN7cw3ZdrcnOyCj+IRMDGeRbe74h/OIZRnm0P0hFhmjDFldG7JwETBPmRP79kR8K/uxF0lyV4sZQO3OkcwHaKQhrUkT7y2WuGeC1yeACKJyPBK9qGASmX4So8k+SsudcSegJW/tTN2dgXe9W/1djXCtMWm1HObu+BBdqcUD2e1l3BzIRxDg30Y+dSI44CzjW+y7bAcbRDq/y8jtqWxkRuX8SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H152XUxYlIZrRiLxZJN8L88r6Wbbqp4jdCZAsez3Lbw=;
 b=TGuUXQ7OGRjBxvVpnYNEV+UC1cPhAsGyieyDk4k4ZCbC6sMRiXvtedopQR2LZmYqQhGv2uDI/43tsdJw1fObN3D6vOjOVGggoLM545YNvtJWOO0i6SCNrdv81KFOGIVrrNfhqVMuQUmPlWJrHVIuGfT9lXI4ITvcWLbh3wEIA24=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by VI0PR08MB11354.eurprd08.prod.outlook.com (2603:10a6:800:2ff::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 12:39:45 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 12:39:45 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libaio: update SRC_URI
Thread-Topic: [OE-core] [PATCH] libaio: update SRC_URI
Thread-Index: AQHc/jw8JRG8qcNlbUq0i10NZR7lr7ZCgocAgAAttYA=
Date: Wed, 17 Jun 2026 12:39:45 +0000
Message-ID: <1FC86B37-5FB7-4A03-9791-91655F1276BE@arm.com>
References: <20260617093224.56557-1-ross.burton@arm.com>
 <CANNYZj_kKi4sVZKLt2m6AT17CmFuSxx9YBKq2jk_yKvPkaACAA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_kKi4sVZKLt2m6AT17CmFuSxx9YBKq2jk_yKvPkaACAA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.8)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|VI0PR08MB11354:EE_|DU6PEPF0000B620:EE_|AS2PR08MB8261:EE_
X-MS-Office365-Filtering-Correlation-Id: 88aaf213-94bf-45dc-8a52-08decc6daac1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|56012099006|11063799006|4143699003|38070700021|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 bth6+px5+wMmbKhHBO3P0QPjljBwx1Q0GKaOjpKWPLmzgbtiAN53LrX4vwWTXGAZ9qYsVThs0fOemEZEiEwfLqgUWIEJFk8gP93dGY25/pIdxOCT0E4KxEg1KlBljv3BwXjQop6SiysTyZH2ugSgLL6xyuXwA/SR9prdmlT7ri4GgPnhBlHtLRYKTJ01Xx7HWbOj3wvxDsOhbNpiijl9SgdgGah9O7JKMWS2Ge8kaPJp83yZTzKNu+WtbnJypBRGTdRJTezZTWe5xZfZHskFHBWBAhlv7N0/hUCljRH3K1eL4CZn3NWf0mOz0SD0n9NzBzD+jNZd8YFThr+3cTP8ZmcJRgNKh3TagojTbxjuefA1NLCWD3e7l4HTyVNDzrndIuU8sBGxv8xkBdQnLxGq4M/zKXLZ1DwWUt9s9B2mGhPDqwTNbtY/6G4n89wvU255e40DXec3wlMGUIdhDrNnISBKpJ88V1jkEXT6+BseDzpbGK5iXnW1CNXfw3jxT+44nC1U576WFcgCKoQa9cer799aCowvyCZ/pNXQql3jTPGI+iJRnxL3IvtGvmLSnCn14vXwTjo5v4L8x/AP7fEPcme5rZxaRZwZkxR7hgo+aTf+3qoFSmIB29RYRkoBe+hQKqYzlxrBvrdg5o3SJL3ACmrbsSefvzIO1VPNds0SLcmbFa7UsS58+ht3X9SOpVLqH78y/miNXtBnsyqn32SQqHfogdPzvfKBPh+3dKEj5590jfqh4P59VCMo78qkjjaO
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(11063799006)(4143699003)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C62CBF1C15435479543CE43DE210BBE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 V1xhx9BVsf0iSMA4npoNMOxHZ4vQxAfrbTxhYSA4yZ9/qmVtZYpVjGIRADzYDSMYu9htpuWvWPOaZHc4qSYHEZLWwrG+9201JD9WGMqgnYaZdMgB/KlGFNo8NUra11Tero9gIP8kQW9CNPN0IZXheyYjUprIBgC5m2PLxn5fEog05Kcq1Wh40iuXyokm157IW8d1Pr2SDxBd5stjmdVSO1OfcBQEgMAMiAJfaqG8g9YLEjCc9azU5lw/P4n8wbChR+ghpBRORm4IuptaUmGNGeFzl0VY85hOmtPElzZgf7CjZZswLJ0vrwF3P5PZZtkvoz+W/h2IbGJPlwEDrme93Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11354
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	464b2ecc-b6df-462c-8659-08decc6d8318
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|36860700016|23010399003|376014|14060799003|82310400026|1800799024|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	MciGXRwxWg3mapDGbAX6YbNL47gcqunekD0FG2lv12PvjL5HCemZZSCcyjEcxPZ1zNnf+cgHGRhHweTQYRrjt5LHZAcrZrzKXQ2piiw59W7EhsHCm0hrJ47lSojrBvmQxO0mzllZJtWrDbGMVg0P9tjM480h2Ntfxylw8GnAgO8hd5YVXwgdLiY1Sf2vPJFrv7ZYrDWuuEqQgStf/Y4fz6I2QNLcWVp13PbjyXVvmuNWVG74mEq5pSr9eRtcvSJU4CN9sNM5A8Y2bgX0ynNMyalZF8b3FkoT2wL81gwBqfSEV93O2P8SqoRI/oBBEO7fmUQ3FChTs/CSLAOWgPAKQd4AnyjHUsEyyqEjAFwr+q6I5+CjBR0xJejP7Z5EBfOP05NpgGVturSNhlQYFdbLh/DlGspubT0+1FQ/7islQILpWLEo2t23U0WXBuMYoLOdit+YIvzuow2RZgV1ib0UrfjH7cEoHEmrfSUrHJAF3pF/PE5x+x7dG4rwlh2srnfkEdOjGjcXKrzKU5hC2+Mzzetalgw9iRiJJwvD/QG6TFyrqEhNpQuRiWXdfCIFmNLyvdPzDOyFz26pHhOXx68idlhAxY3VBhyGs0ODFpg4FzRG3/7s02iofcyC0HZL6macV5vd3KodBWUbdyYciaxWemdikeJEi2Gerzk+wDd37VTqLCJmskb+sTK5zGOXLvBUhf6y2zCSK0i9DYVbHqeTKaEQNOyqpSNm6oDGP3mKJxI=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700016)(23010399003)(376014)(14060799003)(82310400026)(1800799024)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ADsA1uSOcAPIZ68d17yY+7yU+Z1Rrxdxd2d0ZLhzCpmti0LT0e4U/Fm9vvK4Lb5TTkkoDtIPfd3cwYhlHy/1DiOrmWBw4gHqukVfgBcoW36buhYIawjTpJmDJxxfOkWT8P4L5Fjzp3eYX335Si2aQO1OE2SQwrIYnFke/iLBB634VYiP4ThqRx1RqykARrE6xQnsjnQYB7PX8nR+h0TYf0Pf2F6j7J6o2R6/pctToubyfJoplwoMJGYtNrH7xUOB2wk+ZCYwfwyJtaYGkMxiCBf1IvTGUI/1tG+1W6povfcBOxgNM6l1kM922WLLC1ojxrX0eJecpK74LaGvCIlVcexiT955eOa5ppQmSUj1xKvlXvMvlNCIAKIDa8qzd5bazfB7LNw0KAMyR0+MRz+w9+zLz9WozY/ne7BZuyTszBDzy4owAPkMFtgYInSPKClb
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 12:40:52.1022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88aaf213-94bf-45dc-8a52-08decc6daac1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8261
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 12:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239032

T24gMTcgSnVuIDIwMjYsIGF0IDEwOjU2LCBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmlu
QGdtYWlsLmNvbT4gd3JvdGU6DQo+IEFyZSB0aGVyZSBvdGhlciBQYWd1cmUgaXRlbXMgaW4gY29y
ZT8NCg0KT25seSB4bWx0byBpbiBjb3JlLCBJ4oCZdmUgY29udGFjdGVkIHRoZSBtYWludGFpbmVy
IHRvIHNlZSBpZiBpdCBoYXMgbWlncmF0ZWQgc29tZXdoZXJlIGVsc2UgYWxyZWFkeS4NCg0KQ2hl
ZXJzLA0KUm9zcw==

