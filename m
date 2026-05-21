Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52778CD5BAC
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 16:47:29 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41303.1779382044227785039
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 09:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=F0sTbySr;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=F0sTbySr;
 spf=pass (domain: arm.com, ip: 40.107.162.12, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=Hj8jxKBsSQwbIpTYvnKJYPnbQiaEWVnDjFXVdOXIdKMeeOtJNB75JtLrUNk1ZZYN8d6LmBqhn61vIjuGvS/WTZCnXvB/LX4nFQXIiRpBpq9kFHC2DlOKIDoMIU2LmwtJx3v0fyv4MoCfl83jkeq1zRGfwks/XfHYaSsF7JaREfeaHtX3YqFzv5txnkBGiHBQhmYQqaEH3NoXaO7jzscRHMrfKoubJndQxPj9RDZVOWAtJIT92S1kcOJg1Mr4Mz4UgK3no7+i4LLf5xDFkEUeCmTf5q/UULt65gw4/FZi/VMztaQXNFphxfZYAi7sR9+lP9WVVDkkPCGsvEHpO1JXyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKn6Q6aY92L93JKpEHCX9CBzpjOQao5HDmg2McuKYLQ=;
 b=U1w8+k5mw1fROx0CWZlrxzbJ+YRh7vDSpH7olYkz8D21/fvmoGV5oCl6sXtpaS8cnH7vMWp9GVBp0RJYN6YFnLJuj3uGoghiNyzd1McJqHy1lQvUxJoKvF92GKzLqQVAEeWf5AgubAFsQmRLgyTZY/3GBTEQym0mDVd1qNLtnQ29ZnsOCmAOsuBgDewXVeyf4tGgHJW8g2dK78+6mUBAZNqwsgHro8ocSULMUVzLveCee8WBWGqtGp/D4a2ndm3r6XyOI403MbgwFLSmmASinJXu9QeN9d/Kts4ncwnVytoq+kYj3DbpFwr1+mX95CoWMf6HAjM22EQkXwvL01WpbQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=siemens.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKn6Q6aY92L93JKpEHCX9CBzpjOQao5HDmg2McuKYLQ=;
 b=F0sTbySrWN0pbSc40Tka3yHes9a222+gjMM0lV/qfK95pzDGg2gtylxh3PbbhLPpeVn3Vdl4aUHxxFG4Trsu0dZDIzv90NGhj8ZvFzG/QzTg43c6fbR9tJGG6VY6YcfKFPLOFWB0QVf8z4FJF48YXqCP9z/W+hRLb7VpRQ5I4Ko=
Received: from DU2PR04CA0234.eurprd04.prod.outlook.com (2603:10a6:10:2b1::29)
 by DB9PR08MB9852.eurprd08.prod.outlook.com (2603:10a6:10:45f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 16:47:18 +0000
Received: from DU6PEPF0000B61F.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::8d) by DU2PR04CA0234.outlook.office365.com
 (2603:10a6:10:2b1::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Thu, 21
 May 2026 16:47:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61F.mail.protection.outlook.com (10.167.8.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 21 May 2026 16:47:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3KZqS8at5zGB23qt5FAxJ938hTnTg1I3b1+0nHnoYxt/QHyXm3YO0eyZ96XaFME20bpHsIX3W7fCQyRwFaaDP4oVwHvREfcY8P79U2SqTS7+HBbANR+QG2b4dtet2iTIZL2WbIkbjCPy0z9Xw5C+SehVu+xGUXsWXFxCrAdJiIC9H6b9bXTg6QtPU+RwaLc9sqp7GOnw0DZeWZ8Uh9iHFjZV68MVd/Zugofz2EkCzJdq+ntqv2hy14ZRZTuFBVW/dqKdcPsFJf7KuC/K2oOablhMACna4VmsXRtqrV7To5TGqaXNdBz/ql++Ws/EgInqP0CDGxcom0BezE4mNge4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKn6Q6aY92L93JKpEHCX9CBzpjOQao5HDmg2McuKYLQ=;
 b=KmpxFrqugpNhBHo0V5k0h1mSEPLBiuuesnwI9niq97gWxK2LE4Aa2eTPjYmL8J7NAizVsQt8B38gzhCZoSX6JaqhCm8kPZuhpLB8vzh5o3FNq+tvt/Lb/gqSJiNCPt58JMHGbJVuCMryNLVfGI/3R8+jjZW5itVixzFxQ1OII5GoxZpa43f38/Zs54oVfMvOfsHuqnpMd7p7SBr7yiv5EH5udrbvC2OCApJZPuXoVQt/8xmNqW4Jn9j+IiA6ytwJa9EQA9/687jiztLJeEl+GhS7PyzaJLs3qtAqW1X9bCUrEAlE4c6Azz/SYuLS7bR9BeAMkQfXxdK598kvI8kidQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKn6Q6aY92L93JKpEHCX9CBzpjOQao5HDmg2McuKYLQ=;
 b=F0sTbySrWN0pbSc40Tka3yHes9a222+gjMM0lV/qfK95pzDGg2gtylxh3PbbhLPpeVn3Vdl4aUHxxFG4Trsu0dZDIzv90NGhj8ZvFzG/QzTg43c6fbR9tJGG6VY6YcfKFPLOFWB0QVf8z4FJF48YXqCP9z/W+hRLb7VpRQ5I4Ko=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by GVXPR08MB11742.eurprd08.prod.outlook.com (2603:10a6:150:314::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 16:46:12 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 16:46:12 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.tatrai.ext@siemens.com" <peter.tatrai.ext@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] testimage: handle missing boot log file
 gracefully
Thread-Topic: [OE-core] [PATCH] testimage: handle missing boot log file
 gracefully
Thread-Index: AQHc5tHPCFhKwR1k5E+nl4DCNcq87rYYtPiA
Date: Thu, 21 May 2026 16:46:12 +0000
Message-ID: <4C2A3BCA-C42A-4B86-8FDB-BC7C817476BC@arm.com>
References: <20260518142235.2077-1-peter.tatrai.ext@siemens.com>
In-Reply-To: <20260518142235.2077-1-peter.tatrai.ext@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.8)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|GVXPR08MB11742:EE_|DU6PEPF0000B61F:EE_|DB9PR08MB9852:EE_
X-MS-Office365-Filtering-Correlation-Id: 4876e62e-614b-402b-f76f-08deb7589e69
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|6133799003|38070700021|22082099003|18002099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info-Original: 
 v25prOAj5pDA5mF/nd7MzscszfjNfN5776pAWYmNojiGgsxFG5F3aN9HZK3oSSl5FUAi39DXaP69gpfocKalqOgaMYT0Xsqx942ffntT8xIxEVx71dLrxG7CHQGlakmNG7tPREy4KiLjiOMtC53NOWVZ09Wxff9OFnuosiA7H5BaIACugjB7BJBcsRaPRfRJGpA/1rYiv2fDwDH/X9DgZaAdAR8Wv6VjUdSmf4aSFGRDWvgLD5A2N1dk+4EEVU9ysqD+5Emwy1HROlAGMIbX6NQNCadL0f+ofc49YkfjFVDG0NdKgwPJ7sy1JwhYHwSfAH6ZlReWz4olJ1zihlsZCbfstleoGZke7hceaOHq5XOCQRzic/XbhmzD9uoUmSsNGVOb9rsZF9fY5EmBQ/1oshwS/VZddJptB7FskehWwJqZCPD4b5e6dQzCndrWtCFR8MpfQ9xhJscOWiOSm8shpaZRXduyJMIkHUbdxoIl6Z01wXuRxJeOjhsrdP+HCylOO94Zk592d84DTrPMe9lGTPJ/YsEiyOXmQr8tdb9QfYd8DLrC7GVRMGJ0dOdpaaE2OhjwUuFOKSs8MvSQfra7tzkmV2WJIc/NTVGNkmmQgtFsMdSddux1OxZPumyBclOuVXtgCphvgd6ftfGQJ9wVYVdORqwxh/2nceEjgQXEpueLTbBTYmtB+KMPWkKsbabim41aL4aYZ+Mw36ElmtQmek5ftkbxEjc1JGUTXg8HNlQbpIfZptE+J/W2NWHxaaaU
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(6133799003)(38070700021)(22082099003)(18002099003)(56012099003)(11063799006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CAF1C1E3174DF84FA6DEF088480E4A7F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 mN0fZcsbQYLWrzn2jYeFX++R2Nqxc6T84pss+ICR3Byz0au7TZOgNqdobsXZhtD0qbbSOX17gAPtsI3cuNtXtd2riGStZKpvYizJbBTfZVe+58gVsGIHJFXqJ3MBaUblRS3pAUoM7rNaiGfgzyp5lRzwHL5bQQuriW+Ete7iSAwYOrQUwhAU8ONFPOY7y4TjX8c1xGLlqYl8uPUjOPYOrImsB54PvqLstaKh1e++kCQY16hs5ivBUjfhuYrCeMTWzpdSN/le2PCFc+HtwoXpkmSoVy6I2KMYAGFPwkqEBM5OUYCMLv9jH9MkpM95IC/luQ6+wsN4YGXz3Y5phVXnIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11742
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cb4956de-969b-449a-07f0-08deb758777c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|35042699022|1800799024|14060799003|6133799003|11063799006|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	u0qDzkij/HiPX10g1qObjs1u9IUeHMjIgfvpRCJXuBsLYTAnPNjlrRtucJ0CsF8JUAwPryTheR2k5mjjlTGA3ySNS+qO7tZb12u55LvFxNq+IGJ5ZMExHp9YL9o2W1H9jFI5Mf/mde9CbIMeeWtbey/k3kJGbUU9uPLOfKhu6PQXElq2/SxnOKpqwuMCYrOEetcA178XgKa5SdookOxr5sf0XClCU81EAeOJxTIqkuRkceeNQfcVqgj8dvtyGBp/0bAWBYIxxlaIUr1cyNXIoFA4JQlqR6iwcJls4zMyJRPY4neudlRJVGcuzTZ+zjZvs8qaWL9WB5sOkF3vntQemXb+vNbaXttHjlMONq3gLaUmdkRwVHxUbmKR5U6D0CmQhVsoS51cmEAnFoknBWJtxk98SOxvHWzMMTRL7YGeI3Y6xIgDKOeyziqr/9LFqVRW61A3MuiRP3UnucTTHS9PNBhBLDP+N1naLoZrAV1LQ7bZTL6P0AXB1lPiv6iuPypwMO1ANIBVoiBTmEzIHQmGvCYrMyIfU+yKNAISDZ7m9mtfxda6iqnz8SiXwAfER+AGtrib9bfVYqe1yeTGir18G7VH/iddBzzvkYHKIOUOn3VCGR6wnpSdlk7xS65zQK//NKT+1AhSdX9XgENYF+BssEoGFZM5ctj8aHkFtBVQmqG6th78yurX7NDmWA0Jet8L2VRE6hlt8hPz/eWg/B1I5zUboqAFis+xtLz2rU0QcPA=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(35042699022)(1800799024)(14060799003)(6133799003)(11063799006)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Ra4o/tUronl3SBRq0Q9FtcaTFkVhZi96PiWsgazuW4QkVAWImy9aZH0k/OXu810FeG5Ieumto3O0jOYy/0Z6sAw8CfN+Ao8M7mIL/rCB5CsLcCZvQSgBj1pXvPji7yF0ABftdtdNMKMh7S0EyZ3Xqooss1exY88s+0IJA1NxG0kuuobO5lWwOEi9AFveaOIYXgk8v53SULltG3Wxw26Rb1p9+CbvGVSmP6kErQ25emKSy9XXL21lYn1npH7DxQpTIElQ14r8vrW5WQebkCtgkeebComzXMrGyHLSgQcedxOQhjlMnXNmeTAlYsZvt3/OEfkUy4k55N4JmN7HACPQQJAon7yAxntI1CeHaznT7qc/RjujG6M9tq1Sprvv0HIveybgk8PWq0lc9OsMrm/ZAmcHaRGMugs44qsyCflg/klKygbSMGAocfENumMLtBke
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 16:47:17.5495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4876e62e-614b-402b-f76f-08deb7589e69
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9852
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 16:47:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237521

T24gMTggTWF5IDIwMjYsIGF0IDE1OjIyLCBUYXRyYWksIFBldGVyIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxwZXRlci50YXRyYWkuZXh0PXNpZW1lbnMuY29tQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+IHdyb3RlOg0KPiANCj4gRmFsbCBiYWNrIHRvIHRoZSAnLjInIHZhcmlhbnQgd2hlbiB0
aGUgcHJpbWFyeSBmaWxlIGRvZXMgbm90IGV4aXN0Lg0KPiBXcmFwIG9wZW4oKSBpbiBhIHRyeS9l
eGNlcHQgT1NFcnJvciBzbyBhIG1pc3NpbmcgbG9nIGVtaXRzIGEgd2FybmluZw0KPiBpbnN0ZWFk
IG9mIGFib3J0aW5nIHRoZSB0YXNrLg0KDQpUaGlzIGZlZWxzIGxpa2UgaXTigJlzIHZlcnkgcGFy
dGljdWxhciB0byB5b3VyIHNldHVwOiBwcmVzdW1hYmx5IHlvdXIgcWVtdSBtYWNoaW5lIGhhcyBh
IGRpZmZlcmVudCBzZXQgb2Ygc2VyaWFsIHBvcnRzIHRvIGVnIHFlbXVhcm0gc28gdGhlIGJvb3Qg
bG9nIGVuZHMgdXAgaW4gYSBkaWZmZXJlbnQgZmlsZW5hbWUuICBTbyB3aGF0IGlmIGEgZGlmZmVy
ZW50IG1hY2hpbmUgZW5kcyB1cCB3aXRoIHRoZSBsb2cgYmVpbmcgaW4gYm9vdC5sb2cuMSBvciBi
b290LmxvZy4zPw0KDQpJIHRoaW5rIGEgYmV0dGVyIHNvbHV0aW9uIGhlcmUgd291bGQgYmUgdG8g
anVzdCBsaXN0IF9hbGxfIGZpbGVzIHRoYXQgbWF0Y2ggYm9vdC5sb2cgYW5kIGJvb3QubG9nLios
IHNvIHRoYXQgdGhlIGNvcnJlY3QgbG9nIGlzIGFsd2F5cyBzaG93bi4NCg0KUm9zcw==

