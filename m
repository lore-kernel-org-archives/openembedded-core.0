Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F6E0C9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 10:57:58 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4953.1790247473505840706
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 03:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=F5Ew6EDo;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=F5Ew6EDo;
 spf=pass (domain: arm.com, ip: 40.107.159.60, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=d3CnHtr1NcVJ4cr8gO8jKKcWolvRcvzeiP8p6+chd9HtJN2ASuttZPMX5mFrTIzF5LcV2WDWJhzphxyj54/lQW0s92y2+sbHfmk2pCq5MTFGx/aOQurZk79EyuIJfrKWK/40QD/XI76QrVMriBO1pL9UJVLCPUBAKdLeqxtEK3cyr8vwXC3US1uY2wXg+PXl8lWWGDdIprdGQXZ5hoOwaUgVfkW4hBAkZXi33Cxtqqk2Y2VyC2gUlYohv7n3kF4bnIARjOtVroNTooWWZc8vf8+sVza903fvEX8lfAUCP1iFmxA/F4MGvQANUq+zuZLJo0lpcX9NGB2bAAx5hS99ag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTYUGRjo7UvT9pgbVZlTrRiS4W6QsJrZpOR1exleshM=;
 b=QZp6ooLtlbphxZQ84FT4l7K4Hvr9zIZZ7HRyxF90MZUwSios5nfCMSt2cNWPnwELKTcawCLiJUMvMiwrvmhKeiuk+hKw5CUMeWNs4P3e7Xi2Fad7YnOZnwNGGZ7dGtkS0WmVBkAGloqrvFnu/IAt3tAliK6EbeKfdSVamB1w7qBuMtXzVLh62+myhw05V8KJ3/p+TY17oS7Rb/hlV7vpi1Tw6RkXk3cqmbDKKwpVUxi2dgdN/QuVLS2QghXWNZxzK8XybZTFB3tO9jefPk90C4JISWlv7QtAvVq6SrwYceQHeMTBxEJQFD/4jBib4N0+dQlp1/IMnUdKstYyQSX9tw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTYUGRjo7UvT9pgbVZlTrRiS4W6QsJrZpOR1exleshM=;
 b=F5Ew6EDoT2wK74vefao7aY4nbqDGVAS3mkHa/0WfURTK7UfaoGm1DvPTa7uLfLDY39LnRVQXHCQj3ZCA8vRax6QkjX325+adY9Q23s6Cij8E5EWv2/THbUAo+Si72dWnC0oShvuk1rz5+/ClTsvggWACd0VDiI8OZkqNcl3Nh1E=
Received: from PA7P264CA0003.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2d3::17)
 by GV1PR08MB10523.eurprd08.prod.outlook.com (2603:10a6:150:16a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Thu, 24 Sep
 2026 10:57:43 +0000
Received: from MAD0EPF000008B7.eurprd04.prod.outlook.com
 (2603:10a6:102:2d3:cafe::64) by PA7P264CA0003.outlook.office365.com
 (2603:10a6:102:2d3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 10:57:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MAD0EPF000008B7.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Thu, 24 Sep 2026 10:57:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yP6Wff+Nv0lqSi8QEyhIqyU/Ih0h17T1qOcnFrTRuMTCL1MmwRNrjxvQT6tDpb73GUM6r+JIMuC3uNjWlrH1SiXL56GH4W6/MlJ1E6wx6f4eNdpxqnxy0c4w5rP2qPX1pHZBXeS8kfa9Qsneq0Qx2uB4Cj+w3iDCSDxOjf4ASMhA8mT6Qq+bIn/dCNg7doPkkm/ViDLNgn0d66D9hHnE/UNEHIiOWLXsttYuXJI9MibKgXE3Gk2Ps6zBPlITR0RuAj4c/LWIRCDOc5pqCgV4PbxV4zdqaH6KupBNPBkguEZFyZTPzlBZrcCB7ITqGifhHfMFDSSu9wuJo5PnFkljmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTYUGRjo7UvT9pgbVZlTrRiS4W6QsJrZpOR1exleshM=;
 b=I0bD8MI8TEuQeBRYmGC1nuMp/vp+SJ0fl7loduEegaFmPdu00zmpvtKxDamy4/D5N37BKWYs5PrH+zSVw4IZaH9n+urvcbyXvi5m/AFnp2BwN9If7HRJh+kl8Rroqs2KZtXIluOK3Voyst3WnTvVcDa30g3/fj37D3u4x5GVlj1VeSQyQ3B2/3xHFCJZCd7rSMXgVAL8e8hbcaX9TtxljwCz2hDCrADRq9sgz3vkE5IDskBcqz9srYXQaTHLApsBHTXRkwOd+r0IozLYiVjO6k+W7eXOJCktdremcpDLvyl6+EFNv46NWka7U3ck3wvUFrTS+jH3q4yOfYe3/7dTbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTYUGRjo7UvT9pgbVZlTrRiS4W6QsJrZpOR1exleshM=;
 b=F5Ew6EDoT2wK74vefao7aY4nbqDGVAS3mkHa/0WfURTK7UfaoGm1DvPTa7uLfLDY39LnRVQXHCQj3ZCA8vRax6QkjX325+adY9Q23s6Cij8E5EWv2/THbUAo+Si72dWnC0oShvuk1rz5+/ClTsvggWACd0VDiI8OZkqNcl3Nh1E=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PA4PR08MB7619.eurprd08.prod.outlook.com (2603:10a6:102:260::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 10:57:04 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 10:57:04 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "jaipaul.cheernam@est.tech" <jaipaul.cheernam@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/3] systemd: fix musl build by fixing
 limits.h override
Thread-Topic: [OE-core] [PATCH v2 1/3] systemd: fix musl build by fixing
 limits.h override
Thread-Index: AQHdSg0q1I67tMEDiEm1/m9MqIsEJ7bdkraA
Date: Thu, 24 Sep 2026 10:57:04 +0000
Message-ID: <312B836B-05DE-4EA5-8BCE-8AF242AC3C9D@arm.com>
References: <20260921104520.47933-1-jaipaul.cheernam@est.tech>
 <20260921210644.85026-1-jaipaul.cheernam@est.tech>
 <20260921210644.85026-2-jaipaul.cheernam@est.tech>
In-Reply-To: <20260921210644.85026-2-jaipaul.cheernam@est.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PA4PR08MB7619:EE_|MAD0EPF000008B7:EE_|GV1PR08MB10523:EE_
X-MS-Office365-Filtering-Correlation-Id: 65cfd083-8b03-46c7-d675-08df1a2aa7ec
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|56012099006|11063799006|4143699003|3023799007|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 mdCpHmbjWFnBTc1TWfs+1GsQ1Ara3hS9EOgFMm+OVn+8UBvQ188HB9Dj/IWPT+FlZGmGh3u/6NbmnQSknYTGLS2qXS3qwCJ8tcmG2mOdFnnPlclMLqDrNJLUB6JJH+ZJfjrIYX+hVLLhBb+Sw1DeuJ5SzDs/UeNOYNgxavoWXd95VxQjnfW2hCvc0/nFv1QWrAk2e8sKtjoUBUyAHnjguL8nYNEzd7d4y1JBLKZu6R4VP1K2v7wEZzui3B+snB25DR2Cyd9/4FYiTu7hchjO4gZQIzQotCYteRgKiypjhianY+CeSetqUOkG9cz2N98PEWx3F2/zKyE7Jz78ah9nhn/bY48nZHdJdOQ+g3Yudw+cl0NZ1skSKNNt3dKZD8A7bnZJP6nrT/TyJbhHOmPATgVA6z4fVs7OX3PPrR2OizvGWrvzetwXA4458Ph63yTyi5Fg4vov+QRdBv0K6W4v5LwlpreZYx41yYbDr7Je7shzzorC8XCSN1V9ojdrtJRuAg7ovqnSJbN9HW1NBBskw9K/5C6k+ocGqPQtZC18IoU276A1JvbyIBLQn98K68MJXqRoXWqKWN2Tt51luawlOyxE6i22FPUWPXxoOYENhvcA38T9jxIlhUfi29vXx6uYJWKHXJKxz1Ndmv+cjQz5DB8jFGM2l5so7LdvYvpTn3LAbUtg6kiA9PfxL5XLOB1Ux/nVDVPyV2UmP5WwpgyhXyKncpuRdEJN2avw/0JRb0w=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(3023799007)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F54875307A2C9409C9C7EB6E0C6E84B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 CB66mqMrDME1P/Tgg7TITb2oPJDIBLJ2wgBVhJugoHuCGWeT0FroEF5ATCAobLf/0PMlnQ+AYuXT4m6thfzK1CbSgmOeTsDLp+Y1CyXgzmxldkNvgjiP/ir/DniqEsgvQtrjKCQDMSNtIHsiVy2j998P25zo6QrqH0UnHt4ZBKSjbO5jcVCRxwxRZnjWiq+a4uCfzNGwvXCMwa+TuU106zFhmfmQ5+KN0iCcAo3eVRkl1zsToqvYXoU6UL8zJzS4c6cEw1NmlksH/Y09b1rVcNdI60b3bS8/ogBXHK1v1MM/SBP7RohlVPl2Pxe/jg7tyQvXWZtuww5Cv7N65WWNXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7619
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 MAD0EPF000008B7.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	be7200db-506e-49f4-e635-08df1a2a918c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|23010399003|14060799003|36860700016|376014|82310400026|1800799024|10067099003|56012099006|3023799007|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	BnJ4P8bQu0h/G5Oxld1tz4YvPLrWwZivp1C0NtIEuZV3394V1sjmOutFP7tVqClfhE+9DHhn+xaZeMGb4wHRAIQ3e9GYpjeswb+KnS/tW+bIwArRdM0/+bID87VSA3xEqyCkcWeoW2uUYdPHA34z9qmfgVxaibzZyEe73yfLhtBP2fAXq0QAGfJhdtFRMftyuChaXFZbNSLD/MeXtZIRA8qKHiC/6T5fEEmHmCMXiPSemdVi+9G1t+4zrbP3VoIh/yeCryVE7/+AYIbDwp0/n0bGpPTEJBQW4DZ8W80jLj+/OWL7guizMJYiCLSYhPD0rOPoWcV7UI8wJReMuDL9s7keiA96iNGns2LiBhYOgwJX4dwL60sZHh/z61Om8yD2tTcGeAPowuMCSXWO/m4Dj9f1Yf05T3+sW9qHrG0cSNrqoBn+Wg9OhRYiMDjtKF1mGEVfY9fxLzgYWHJ2A12LE5qfkBFZuQR3asub7z080P4aLzGo5kxCwm13zjubnypJi3jImP8Sag8gKoMZXSIxGy4Bmz/cjpAfjYwxj+xi8AhEiU7a2J6WSOyokf3qRwNFgub/IiShvPbp63X6W6vUSNdH5VsWwvjJpQNor9qfYUkBFSydyjgjT6on/KEQjPTzmTyTaKMuidEJ1Rwfh1cTwY6w3uDSiWYbjmtUh5QvsMePiEpNWhOXaUYhhz+5DcluhQ1QXH+Gwu/q50sD27tAMw==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(23010399003)(14060799003)(36860700016)(376014)(82310400026)(1800799024)(10067099003)(56012099006)(3023799007)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	g0q5zTDqOl5aRzHGJac5eev/1JUEVbC0InkG9v19cTHB8r6U63CpnANPqJzkaALPV+aX+JTMhMmJD96kT5ymgXMxt/92pyOzvsxUaWbE3b9lW3OrRPFEU4fd13L63N9Chz25zMbHoS/PSeZjwSnkhy6Q5E+AelD/vGDLBy+rzvAFjriwSNqUzzyCJe84rbMqQgcfz+GVzZU5BgmbRCrynsn5o1uG09+piCUlnrkKGjAuknFsHDUgW+rlWu/pqbU153ZKk+RekTy+FbuSDZopsypbmsGH0jPpPce0WlzXdU/hQes2dnb6GrTJ5JlnbZE7WBkt6XHYaxFsyCRW2rhveSbQN2sjeyzRpoGAnIFBgd49RDUH7wvJZvP7FkeMoYfI6WV2fce+rB0rwpO9cljT2kGmUmcsQbylpWlTkb3xTfGQGwJRLE+eGIGW6DvjISEH
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 10:57:41.7167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65cfd083-8b03-46c7-d675-08df1a2aa7ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MAD0EPF000008B7.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10523
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 10:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246578

T24gMjEgU2VwIDIwMjYsIGF0IDIyOjA2LCBKYWlwYXVsIENoZWVybmFtIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxqYWlwYXVsLmNoZWVybmFtPWVzdC50ZWNoQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+IHdyb3RlOg0KPiANCj4gQmFja3BvcnQgdGhlIHVwc3RyZWFtIGZpeCBmb3IgdGhlIGxp
bWl0cy5oIG92ZXJyaWRlLCB3aGljaCBicmVha3MgR0NDJ3MNCj4gPGxpbWl0cy5oPiBpbmNsdWRl
IGN5Y2xlIChub3RhYmx5IEdDQyAxNi54KSBhbmQgZmFpbHMgbXVzbCBidWlsZHMuIG11c2wgb25s
eS4NCj4gDQo+ICtTUkNfVVJJOmFwcGVuZDpsaWJjLW11c2wgPSAiIGZpbGU6Ly8wMDAxLWluY2x1
ZGUtZml4LWxpbWl0cy5oLW92ZXJyaWRlLnBhdGNoIg0KDQpVc2luZyB0aGUgbXVzbCBvdmVycmlk
ZSBsaWtlIHRoaXMgbWlnaHQgc2VlbSBzYWZlciwgYnV0IHRoaXMgaXMgYW4gdXBzdHJlYW0gZml4
IHRoYXQgY2FuIGJlIGFwcGxpZWQgZXZlcndoZXJlLiBBbHNvIHdoZW4gdXBncmFkaW5nIHRvIGEg
dmVyc2lvbiB0aGF0IGluY2x1ZGVzIHRoaXMgcGF0Y2gsIGl04oCZcyBoaWdobHkgdW5saWtlbHkg
dGhhdCB0aGUgY29udHJpYnV0b3Igd2lsbCB0ZXN0IHRoZSBtdXNsIGNhc2UsIHdoaWNoIHdpbGwg
bGlrZWx5IHRoZW4gbWVhbiB0aGUgcGF0Y2ggZmFpbHMgdG8gYXBwbHkuDQoNCknigJlsbCBwb3N0
IGEgdjMgd2l0aCB0aGlzIGNoYW5nZWQgdG8gZXhwZWRpdGUgaXQgbWVyZ2luZywgYnV0IGlmIHlv
dSBhcmUgYWJsZSB0byBzZW5kIHlvdXIgb3duIHdpdGggeW91ciBhdXRob3JzaGlwIHRoZW4gcGxl
YXNlIGRvIQ0KDQpSb3Nz

