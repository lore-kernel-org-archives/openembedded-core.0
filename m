Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D121106B520
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:28:23 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21341.1774441701088555492
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dEoh7OKe;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dEoh7OKe;
 spf=pass (domain: arm.com, ip: 52.101.72.6, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Q9xWPKv+c/9llSzsWnddmtlzQsRBHjsBcoNyuJuQAF5MWWeao9pjVGfOJMLYpwiC+ZIjsvcaJtJ/Nf00k6C6oTR4N5M3QAGXwLblhSi9cLgH/nFnDDQTAKZY7jT69CAYaZ4OXahzil9ld1J3kTDhFHaiUolC9gAFQSoq4pWFAEa/ktBqyxNtUFiWi6J9Jb1TETNQXmhm/ibk0890tRApfQV6ixzX5xY8e68qmhOAzUMgUq0AWrRnngG687QFET/McvFFeYil6iKHvv4ReQ8A75jcDlDd8wgVwRDh1fCYpjvOYvJkZ1KRzca0WlS/cZN8lCFyzdLjjnh72v+QUFwM0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gqsrzZQharbgSJqmJ4ibvPERRXyUnGDKS5XybGz8wQ=;
 b=FLhX1HAJDZRsMaClRLA53pLRQI21UG6z89C4noOWXWBEzmEnICS6acGRM39DFaBpPtlzJUeIv4osGS4ftVe/Ng1DBZV3iyquxApu794/gu118SA+B5CKTip9J1/i05liWQc4nP8t2hrj4zAbEqW0vwEVtTYevBGskr7NyWpfsPxd8qkHMmRCAWlo9NoQtXNUKLYNKIYgBPsg2QzNx/NTAi0bqfZjpDNPUX3PryEoOtGa9abSCZdtCyTjXjvtsFZOEsTEtWejAgQMhjYfLlmQTtN3gJL4tHrBpR3BQ1GHMUKVmJx+9rfowJVdJFpIvP185325GgdKidr2K6c2uCvrpg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=navimatix.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gqsrzZQharbgSJqmJ4ibvPERRXyUnGDKS5XybGz8wQ=;
 b=dEoh7OKeVDYm9Px1A+pPfmzKwhVI+OeymwMGjesbmuZd/zfEqzSx7RX+zMtCDyHOdDZOf3N7O0mAXqnBgRDCooS+TmuPmnyyAjH51ipq7NNXLc4B6/uEf1QlBnK0PMPK9f5KjlO33fY0jcQdXzwO+x3x7j3y2T3xZH5nVnsidq4=
Received: from CWLP265CA0507.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18b::21)
 by DB3PR08MB9135.eurprd08.prod.outlook.com (2603:10a6:10:434::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Wed, 25 Mar
 2026 12:28:11 +0000
Received: from AM3PEPF0000A797.eurprd04.prod.outlook.com
 (2603:10a6:400:18b:cafe::60) by CWLP265CA0507.outlook.office365.com
 (2603:10a6:400:18b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 12:28:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A797.mail.protection.outlook.com (10.167.16.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Wed, 25 Mar 2026 12:28:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfNxsCTk3PJmo3i5b06h8amiZ3N7waVyTbN9ZhiVNHQjgdAy5hk5/yv3Y69EXIsu8VMI1t7Rrm4DUeKwqP4GqO0xackvfvGCAq4jTACGSl0qgD0/om8XkzZ5C9EElJxtOWcHBKUkUoVtUyAs2fRsVPHwmiSEbFUAvw5Y5nwvH4jIE+94OlE/81VIO3w+HpAG3jaJ0uTh0dqroPDv70UVz/xjEK67CEXe3WY9gRYn/za7gA30y5cajEItXeKTzM8tIBTyl2Ml2Bmb/e2OIUFWxnueKaQZCvW6uF+XJT2BjcRe+N5Vez9+br5tl46dCQV0+jqsyrN+xQsEyXGEKSZpqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gqsrzZQharbgSJqmJ4ibvPERRXyUnGDKS5XybGz8wQ=;
 b=ntjbItKWrjGdn8f0KL4y03lfVa+CjdkMhAyMUZYdf/vI7fdMZOzxUPcqwlzlRuomy9XoRk2bQiVa2bXGAVAEG8pXLZto6yebm4WPw+HEthy048WjE8Q0k9zvGtSat7pBPSlzNsRLMwQx9aW0/XAbm/rhBmPLJ56r1ntdia9OgGWFenTvHlEv3J/Eo+sKOcpokoHI//5BcW2KSvdxv5AmQsUyVDUb9DSOs6B8K1PXe7UsB1gSzxGJB3IeJOaK8weVayCfNTTA5YUyYm4tUAA9c4dWWBizxF49eOc0mlkdYQxouESNOr2jW7Oviq1AWL2DBAdbHIoRwr0PiJSINtEjNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gqsrzZQharbgSJqmJ4ibvPERRXyUnGDKS5XybGz8wQ=;
 b=dEoh7OKeVDYm9Px1A+pPfmzKwhVI+OeymwMGjesbmuZd/zfEqzSx7RX+zMtCDyHOdDZOf3N7O0mAXqnBgRDCooS+TmuPmnyyAjH51ipq7NNXLc4B6/uEf1QlBnK0PMPK9f5KjlO33fY0jcQdXzwO+x3x7j3y2T3xZH5nVnsidq4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI0PR08MB10681.eurprd08.prod.outlook.com (2603:10a6:800:204::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Wed, 25 Mar
 2026 12:27:04 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 12:27:04 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "joerg.sommer@navimatix.de" <joerg.sommer@navimatix.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] icu: Skip buildpaths QA check, if TMPDIR is
 /build/tmp
Thread-Topic: [OE-core] [PATCH] icu: Skip buildpaths QA check, if TMPDIR is
 /build/tmp
Thread-Index: AQHctrA8CQluyikYkkSvC4peuppHXbW/N++A
Date: Wed, 25 Mar 2026 12:27:04 +0000
Message-ID: <EC36900E-3010-4C11-B633-2850D42C60ED@arm.com>
References: 
 <dddfc185f8b0627d2851b95fe37b697d6453e7c0.1773822079.git.joerg.sommer@navimatix.de>
In-Reply-To: 
 <dddfc185f8b0627d2851b95fe37b697d6453e7c0.1773822079.git.joerg.sommer@navimatix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI0PR08MB10681:EE_|AM3PEPF0000A797:EE_|DB3PR08MB9135:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cd1bc83-1e54-4bae-d92a-08de8a69f897
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 i+loape/jxf9/n6eUL+WOO0D5ZB2PdsPKxq4bCRG/LFyluVKjjqwAw87luhu3TnmfEN2i5Z2p0de0728T4x0Qfxridp/jBhWD27ct3MYJ/dqgAPNJtrOoac4BVHOUW8IoCaWnAXVS8QfIlhvKbJqWugsh5ClV4XfqBOPlB0YnCOaL8gNp84ec1nGQ2clh3dUNB8Z9xKZvZAVmC+gZnPjj7dsGOzevVDnqwjRshL66vrqAz/c/iAE+fgUTebKS0OT0ek6Hibx76JeVQ9HMJdyHZ6VoeRsycNBYR0T5PmioTS3DacCsJRg//1rG7LJE3VD8g9fpvPuoJ26lcCVXpKc7dmsh5dbDjSg9sS7tgmHBbYdggclcj3ypMWSutRyk7HEcgcQ/edqarYob6mNk/esYswxj6ssNVxCxy4HHSuSU9PeQAR31dYkiNdGv65RPEkWhynV+QePSGOYsidJvS2UB0C+fUoR2ud2AvHcHmhU6CsM9BMCWu2SMDDNYZKxVFMBXc7KZFDmq5lCXUfaoLq4deglaw0aEOFVSp1kCTtP/pucetEAsCEQO0tl2UZQx+beCfFzLD7iEhne1Xx5U2cc/FViWezSybvi7dA8KC+M1VSGnvQ0HrFEoVOj+rA3EvZPE3fZh8o0JxpKrJ52fAMRMCZijHebHyBvDJ6qhIH9NrJC3hH/PBfT5UsSNQGatWeeQVdlgFqEJwH/Z5903s7ozF0WhGgNtQSxsUhjyg3XCtKRLSJOFcuVTwE8kBG5cNmjK4q3HwJ8jdpwCPLvOnh2qXVkPznNUc1EwoSHRuY/CNc=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C77CBECBF3684047AD723FEF15FFF906@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 stMaggbwZ+2c6OwkybUg07KGLduJLgGgG4I2I2jm15HnfLKhZtCHZ413thYB6GlsCc2Jm6Pd9h8WqZoaDugdzDTHvEw0xBKAvMrXGuDLQtk1T+xz/8wWTjAVspf5cjWLnEkTMjiodtwF1W6GfjmVVE/NP4uP2pjhh1ljlE5U5zZAEvj5Bx0HEy2XKPIZEOPmg84J538ckByuVwojIRbjcJnNhQJJgtx2pOjnMFbVFrplIBBAUsUvU4x86WFZFjEDxIKsmF6mMHm05KY8FW/OXIigAO2lOaowf2NVTq1X6KhVNBLPZHOcF3h1P5ISTo2wJJfjfu8IBCIDgS8dsQtZyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10681
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A797.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d04fbd0a-cc6e-4e5d-cdd4-08de8a69d2e7
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|376014|35042699022|36860700016|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	ZgFzYQo6j5N7m41qzy+pD8ul/1KI3Hk6qH/C2/H+8iDCzOm6PPo4RM3vC0inpu6s5klu2vMa4klJ9LW35ADU8da36WdUmB48K2cqHCLbCu1lHBDVQAH+Iod13AvdWK3h9ae0G3zdym/hFoye0QcaFxf4zgClGBIDGT/74p2kEAmvez2IQE3cO5UMzy4uMjfrLr4QeJDwRFcTAz5ONQsxep8gy/PsX6VNGAL7vWWy+xsjNTLwvS5/cJaOR8btUM2Joiw/L6lP/n9bR2r8nBIS5SWENYK27uM+JC/CbRecpqQqmY8ywTxzp1HPtDACDfCHfI6gp/OxtpzKE1FBAcyu3LZCVeit3w1FjBSbN3TqZPAJNWQhs26XudoAaXtO0rAI/sd1l7iS5IduAnQttAl0U9FwmXzX8Zs+j7QrKoZ+Ke57Fda9W9ksoviN2+ZSbKFpTHuLJ+ds+c+V4nSxeC8Sreri0NIM5u9oIaRie5w0vDHgqubP6igUXUEjzaPlmpqEW1h7N4/wTJTAovtHFjajkgDGdcnSdyyzbmu7Ydk2zXM0/AoCFZpe5QyriE4sYRHBk5eExKTgvFCCyMNZaQxFPMBHQI+bzfs1ggKo5PZ+5N3/Zj0neFvd+5dJSreN4yBhB+rcY67Wm4I1cpLDy4tORH3DY/ts1VfLlI9ZdXeyDoF22+tW0r320s7AVKsilJ0t6KFIZKEYiWjcCn62BnarPSmn7TMUrXlSAl8ATbeW4vAMBkymdbiwZtNOjGrlc9Z5huVGHaNWMJYYkmdosNAf7Q==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(376014)(35042699022)(36860700016)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/idcwhzY71XL+8FYgKwrohdiOR7OvLaCKnNH2SaTYLh9vtEzKpUj8dbOo0YV1odMNSzHSjSayDFxnJD+QU2LegQRKO7GcCOcv0NcuoOY/cFDc3fbZS1qxxU4lhoy35/lbrMogwZJYYsDkLgnWErvihPIW773KIMoDOZHe/6EHF6KclhVpDK3mdKzpA1g7TF51KbrWKfGbemCBlR3WpErjtVAq8OlTf5vtRK0gOvZ0AqMWzf59RUVtXGDAD8pb7hxB4kpVhfzGIH51jfUz/PDtDdTaysWlc/4yPcnjzFqX+rymgKK0S86GfvDItqhUdxmGG82xFciQD3an0Y8ABa1l1VmXOdQXM8Vb2ODdEhMM4Y0w0R0+atg/rr6gfuupytP1l0p3NuGXQXfPlEbk3zeswKCG5T6hLz+fVwNg7cyr+D1NmKF16O87/jHY3a1sz5f
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 12:28:07.9655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd1bc83-1e54-4bae-d92a-08de8a69f897
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A797.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9135
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 12:28:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233894

T24gMTggTWFyIDIwMjYsIGF0IDA4OjIxLCBKw7ZyZyBTb21tZXIgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGpvZXJnLnNvbW1lcj1uYXZpbWF0aXguZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+ICsjIFRoZSBmaWxlIHNvdXJjZS90ZXN0L2NpbnRsdHN0L3VkYXRhdHN0LmMg
Y29udGFpbnMgdGhlIHN0cmluZyAiL2J1aWxkL3RtcC8uLiINCj4gK0lOU0FORV9TS0lQOiR7UE59
LXNyYyArPSAiJHtAJ2J1aWxkcGF0aHMnIGlmIGQuZ2V0VmFyKCdUTVBESVInKSA9PSAnL2J1aWxk
L3RtcCcgZWxzZSAn4oCZfeKAnQ0KDQpUaGlzIElOU0FORV9TS0lQIGlzIHF1aXRlIHVnbHnigKYN
Cg0KQXMgdGhpcyBpcyBqdXN0IHRlc3QgZGF0YSwgd291bGQgaXQgYmUgcG9zc2libGUgdG8gcGF0
Y2ggaXQgdG8gc29tZXRoaW5nIHRoYXQgaXNu4oCZdCBsaWtlbHkgdG8gYmUgYSBidWlsZCBwYXRo
IGluc3RlYWQ/IChhbmQgaWRlYWxseSwgdXBzdHJlYW0gdGhhdCBwYXRjaCkNCg0KUm9zcw==

