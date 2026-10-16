Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E386CCA46C
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 15:22:24 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1160.1792164135665850370
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 08:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nUHB8Ssv;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nUHB8Ssv;
 spf=pass (domain: arm.com, ip: 40.107.159.4, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=j59yQZNCMNAzGJfeZOlcvb6I/TYJXDvhkL9oIbnOunqDIhqaJY4By1a5RWI6jPAYiJPnN8pLyojxQn8gS15dJbNe1SgsZ1JOBI/cvTElUSbYIoQYRX8kE6q0tvVky8R4ADEzThEAMqA6Gr1h2NGaAnaxiwOSPQQVVtLPOpcYkTq5QRVyRzQZrCxuypEm2Gf+ix52GFQvJc38HOdSgVwNLkq4tsplveX9O4Qa8c0fm7UQKs9OufXvj74xw6pUG7pMy6rpcrnCt3DasYsqx1M0osmyBT+6qL81DgcO8cAiXhDle1s+dZNjicFZb65SV3lU85ceCYy4R9EvQAjcJuIdCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3JzqnV3wIm5T2OPiuEQsrXH5xDAA9eKQjKAK/qA3Og=;
 b=o+aTnH5gcB37AdWbXAGuG1jV67BBhJLULN5hSDKaIrzoeoJu71XGGhJVBDoM9F02Xz5QoNYLCZeV0vF3uldXwjHPuCOXjFeTsUeC60Y1AgHO00edG/HiqZ7NzKWwavkSpR3z2A4gzM7i/R88sqH1fi3qJ2zc/hM54Y+dWQMZ6uKFc6Iobl+wm5yBQiJL0mNhzXRI2ZSGu2iv14P7+FQ0dI2a/gTiqdGax0Sb/FaGJCvd7BMbKckfbgZ5y3BAl7MPB884JOTE+K6hlpF8wjUu9hU6ng4SRduhlZpBc0lJzM5NNSPFQIu3PvZCtwNcI9JRCAJgqO43yc52PiyZr/l7JQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3JzqnV3wIm5T2OPiuEQsrXH5xDAA9eKQjKAK/qA3Og=;
 b=nUHB8SsvgY8s2HrnVAj8s5w/1Kq8NPlnEGoVX7d7/D7I9H917H38KAu6K8WNLTTj9kkLTpbYEAIOJ6/COrlyIdNkqA3NawSQhE4Q30fKIAU0LGYu3K4cjZAuqXIaHRh65mO0pkbtlibVhaym8UJeoKZfAldbjaJklwJqWAsFfo0=
Received: from DU7P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::20)
 by GV2PR08MB11343.eurprd08.prod.outlook.com (2603:10a6:150:2a6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.7; Fri, 16 Oct
 2026 15:22:07 +0000
Received: from DB1PEPF000509F8.eurprd02.prod.outlook.com
 (2603:10a6:10:550:cafe::5b) by DU7P190CA0024.outlook.office365.com
 (2603:10a6:10:550::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Fri,
 16 Oct 2026 15:22:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F8.mail.protection.outlook.com (10.167.242.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Fri, 16 Oct 2026 15:22:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwEGM9BFTtoSsl/g+QF9m2kg33O4Otfsgg7s5VcwxySHbjQ9Pgf4t/drbJZemD2TbYetEot+wAwkIKN5R9ydJpIDL7bpRdOPcKt2g1hVTH+D69+aAJQKAGSZXmahZ9FB6/LvlJqD0A/n6QJ9HWxqNOn8TmPsfnuRxZBfwOJQmihQoj2tcI7f1IonXdIKnqS0BUMFA1HEOl7Z7yAbMneHvkpxyvtFxaAa5VqjjLzHq4dKXn8Dy4rOK9ZeNr77KGTOxaWSHC3SGAd+jKNY3AvPMmWx3nYYMe4AEtm7HmxJttowqpQZrVVxqtJRPvy3nRtSwDPpy03IbROUS0qjEPL7Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3JzqnV3wIm5T2OPiuEQsrXH5xDAA9eKQjKAK/qA3Og=;
 b=cNx7WNU4uB4zoeurX4+buSo1cYgbV8/tjXbGiw9o8+nQePMjEsAxt2xt2OzL+2AUjlLgqROubg1t6eZqBBF5kyAMY8K/iVWTfFK83XHYrdWBD7tah4txANARytwJrKBhCSDSgs2accXgY337qddsRG/BuBMG0zIUX+pZh3H2tUJU4fri2hkqSUngjn+az+OmNrYQySY9o/xphKVarwxPsJu/uAMjAhrzCs/ioqUAjI2a9GtFFdlDZCI5iIq0tY73xNt4sryHIyfs9U5ZNpqOczOYOvkOTZSZPianeiacw8K3iPELgcsLsUpC41u0T/C8skneyLHcmIxq1GOQFnFdog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3JzqnV3wIm5T2OPiuEQsrXH5xDAA9eKQjKAK/qA3Og=;
 b=nUHB8SsvgY8s2HrnVAj8s5w/1Kq8NPlnEGoVX7d7/D7I9H917H38KAu6K8WNLTTj9kkLTpbYEAIOJ6/COrlyIdNkqA3NawSQhE4Q30fKIAU0LGYu3K4cjZAuqXIaHRh65mO0pkbtlibVhaym8UJeoKZfAldbjaJklwJqWAsFfo0=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by GV2PR08MB9399.eurprd08.prod.outlook.com (2603:10a6:150:e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.11; Fri, 16 Oct
 2026 15:21:34 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0546.006; Fri, 16 Oct 2026
 15:21:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "pratik.farkase@est.tech" <pratik.farkase@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH] patch: add ptest support
Thread-Topic: [OE-core][PATCH] patch: add ptest support
Thread-Index: AQHdWjZgoze25i3QNkqRC+0HZHHhFbcAT5MA
Date: Fri, 16 Oct 2026 15:21:33 +0000
Message-ID: <9821E7B1-E19B-4C2C-A9E9-433FB2E3C79A@arm.com>
References: <20261012104207.22429-1-pratik.farkase@est.tech>
In-Reply-To: <20261012104207.22429-1-pratik.farkase@est.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS8PR08MB9410:EE_|GV2PR08MB9399:EE_|DB1PEPF000509F8:EE_|GV2PR08MB11343:EE_
X-MS-Office365-Filtering-Correlation-Id: 0332eb5b-5d6e-4935-d54b-08df2b993d45
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|3023799007|38070700021|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 LaXbXtXFctEgqinbAC/xo2JzuNVsZ6rDlJxyOf+2omyCk2R3QkklMPyaE6arcF8weRmqn+j9fbXR2UYLYFKW+7Ylv+jAfbeU4CAdoZ8yF2gFCGPMgeC60tE1M2cuiqTYFjNkd+tNk3zXD2lMEr7WqS/m+5V9UEnH1flhuCogz0b6TxFh7GlMzn5J2fS0hYtMQf53zwutIq3ndufuma8x5jI+bqMThPSRypdXw00PWKbnaH6DtiI5wsw9iURL2NA5JMwgwobnA/ic9NogXMWQHElo9gOvEMf0y8sxV4JHWPCrYSIg26yxRa4IsBCXKCJQOqBtvwnC11S/HNLBStnhdMirVJFa/Kl0qjC+R0f18nPb0CvQBl3NJMdzcXdkHOwXPXfBTkJjsBUlnJnY/lIx7ve315tSs6EE7nSJVgUCjx2vtYuzUfFFWo0JOVwvGmIHXKmIfW5o7Yqhnt3vla235G/u8lqYrGUJ3b/IwJgf8Ij0+Dkp058f+HCRaUcSphM14AfhFuZmXD4U8nc0yfpLEJ9dKQlgZIgjfJ2DpgLsC22Q3wwPw8U5eVIw4Tya4FNDTyxqdNr11AU8YG0iwJoeSfem2GAj2huFiFPJowIaJ26pSUBmdKYeMNa2ir9hcHtI6QyuiJ9pUAOSy5apdJeUzQIw3w9L3BJsQSYW/rbiqYRWwuPaq0B1eixIMcWdw1W+h3HjNcAnbRVkpYrsEN2IaA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(3023799007)(38070700021)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <ABEAE54AE904B741BF2A74C02678DF89@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 ULRZibpzjivGHc9geQcN/DUskrAvuRi1d0k7xaA7GbRwqdC1kk3XlVhYQs5QAdTCiuK6HQmtqqCKktzG12wJVx/MLJQCNSt9q/J8CsA1uxtYjLfyZZ7oNG78WfO+pQZvFcMAa80b8QcFQXGacdsuS4ZJhj1GXNHYaOTYUhFJDDCgPQOqh6MaHNZ764cXxIeGBfxmcVc6HF81ZE2BhhRcFBsl68EokZXSPrWavLAfaJQpEhyDfDcxt7xd4Ktg6vGSEJsD4HkN765nZdaA4YnAmsi/vksBkSIAFJj5WSWO2PYrJnM6+FcMTkl0zqyOibAvmcZzXKTBsmoJsqqjq0dEOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9399
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	65e74fb0-56c3-4c83-f552-08df2b992943
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|23010399003|36860700016|1800799024|14060799003|82310400026|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	l0Dz/bFEoFxBtNGYIeTz9kdbmyhfUfiDkQ0YxRAQa8SGcN/2kBs7fknfv/4dOuZ6Yj8c505u+vi28ve0w7xSDvsvLD8J7rpffCcn/KGRPpiHBxkmaiTbyt9w8jQ75dJOs/sEcUA/6oQsY2BASSkyGPqLexns/kqnHO0xKp5XTxcXfFEz0kFRaFd9uqOxqMZkpOy0MRVtGyMk61qw4OtCfJULkCSBWV/lRZ+lUlifSlx49/inJl0/SaF/+RZna2zHzMlT5tqjHQwnMiJOZAGo2ecZ9xUJtk335SUmq05NO44IBvqkeug06aYD1D7jcchfj2stKihrRaiAuCj0a9vY3IKGVaZoUfW9iEquEAluIdC5PF2fqDvUFi+Ie5uEJVfI7geAOIYdsb8MDTZqS93mp2W0jufhR9Tya1VkupGnwe+mvloYm+jfRU4BxS3rE9ihTiUXcUeeDMuT4DATXeZ2iEq1KvSAD213YhoF+3CUZE8zGfnfDS/lpyxZ1LGzu8ZxuOLM6yk8VvAR19Xogumcs4FD8yszbAD3GTWuodncMQucs3gdD+4PUBED5ws2Do0DR+05jUu7LXh0R/C7ugcS4f4MMYOBfhyRog9jqrXtniExCR/B5dwUUzwDhT0KjQhsWfM2PRbx3DzXK2v6m91+VqolKVl1MCV8tvFcunf5LQiJwKFVT9jTIRm2otMBn2UwVMO5Qj9PlzTVCc6QgCpjEA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(23010399003)(36860700016)(1800799024)(14060799003)(82310400026)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	t51R/a0NjKaKP1cpKrcXkwIbI8HCplIwozYVtWKFzbYI054pqiUIgFyZNBDl9lhC+y+F84Tn7oVSCc7totXcDOZ8FF6MpTKzsnarKzyTbngyL0zQss4VdfsVAGV/Dm1s0jRJUuWznlFNsi8YnZkEsH6TaEnukH3d159d7ByY3+gKKT8LsSjySL4gHVTpdVhDBJ8AtpvgjsVcKKKZIWSPEiy7uq2pAyle6BcgRr0J24rWhGzzf7zYkcY738++aAYuqZl+gGMV5pNFSbWb47ftJTSY/fouxUhUBatUWwETdKrMmgHxjOI2t89DgMsnRq8rKoxJ7FLvXJsiVxNpX5pbuiE6yTA7Dd/zuw6JAW+pNwI0C6i+QGxxxSsaJ9+YK92si0S5PGeOq4Wda7nq/2C3S4Kjb12tXK3MwTECmbwp/ZmEm9ymkwSKpTesrDyzShpq
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 15:22:06.6871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0332eb5b-5d6e-4935-d54b-08df2b993d45
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11343
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 15:22:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248038

T24gMTIgT2N0IDIwMjYsIGF0IDExOjQyLCBQcmF0aWsgRmFya2FzZSB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8cHJhdGlrLmZhcmthc2U9ZXN0LnRlY2hAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IA0KPiArICAgIHNoICIkdCIgPiAiJHQubG9nIiAyPiYxDQoNCkRvbuKAmXQg
cmVkaXJlY3QgdGhlIG91dHB1dCB0byBhIGxvZyBmaWxlLCB3ZSBydW4gdGhlIHRlc3RzIGluIGF1
dG9tYXRlZCBlbnZpcm9ubWVudHMgYW5kIGlmIHRoZSBmYWlsdXJlIGlzbuKAmXQgb3V0cHV0IHRo
ZW4gd2UgY2Fu4oCZdCBzZWUgaXQuDQoNClJvc3M=

