Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D065FC79F9F
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 15:04:55 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16547.1789052685444669431
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 08:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=e7WfhIsK;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=e7WfhIsK;
 spf=pass (domain: arm.com, ip: 52.101.65.39, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IBnNTvDWru3TDziri6zfAfJigVVWptiud1LldbendKU3nQa5S83DkrzhtXb7ck9M+G/1nNQVareXqAOdnh3+DKMwvUJ17lOwCONuAoX9Yv3ZySKceN81e0ouwq/inQVPvj0NeDyuR53IhDQ+A8S8M4AyOzL7iKLcZ/ZUYq3sN6BA5P5hsSQw6DOvXgiKj9YmDXpAaQ0B86iNEWUyD25S4slUlfTuXZw7zNhDCUapP4AQOWZnzK2KFxTEGvoGCZAiztKeUCL/d8dgsLBshl+IREhRuJN4XqjF0pPGTkTatm3kaiI0XXcD6OjwCrLKk55E6lxZuQjab/7k5ie+dcIDGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lS0gCCzWeguR8JpKGp5F+6zyR+fe04j/OE37EROYNqU=;
 b=R/bAM8M2DKfnIYhTVyguVrrUfVq5eWybNUUkxJRq1LyqZY9Ra83/JZ2ZcBnUkUe6/EArkns9TWaC0mJ7ylprRQEAWOaw9WwfPDu6mxG9VM0J2rl/X69QJc0TvQxwB4KShMUR2ZB4hMjnnIftzS878VEtrvbREVVcxEbR3BVBn/bb3bvhupVj6TzQw8Hvk+Y1Qci35jCHrYu7pNhGCAiOO+Bb6xnYnOshxDBUeGSj2EjuUkiM4KVhinun6kAOeoj4Tc4Qy8t1rewvDZNo+FRU85ZBZtcKYxFmcSE//DKdwzEQYeAjUC1EZiXke8RYi/MCHskNI2t/MhI9hNPTY+brrQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lS0gCCzWeguR8JpKGp5F+6zyR+fe04j/OE37EROYNqU=;
 b=e7WfhIsKVllFPR9tSfG1kNLebO90iL0Q3ztvL8zHnwz1ActEbWu0k6UJ50b91UQ5DTnjpjGFf2+j620Dvbao4JgPYI+WwFkYoaiRnFZOxYLwfy+GwSCTu3LhlfQivPVoukD/M5IwmmHIdIbL5+086PWL1E2uw6qLJdL5iBuBNrk=
Received: from PAZP264CA0060.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fd::16)
 by DB9PR08MB6426.eurprd08.prod.outlook.com (2603:10a6:10:255::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.4; Thu, 10 Sep
 2026 15:04:38 +0000
Received: from MI3PEPF00008481.eurprd02.prod.outlook.com
 (2603:10a6:102:1fd:cafe::4a) by PAZP264CA0060.outlook.office365.com
 (2603:10a6:102:1fd::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Thu, 10
 Sep 2026 15:04:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MI3PEPF00008481.mail.protection.outlook.com (10.167.240.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Thu, 10 Sep 2026 15:04:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iIp29OQA/050dYywXfx4ySL3e+5c9o1XRuH5PUTK5ZKv3EoqZkYDgg7Uq+r3nTWGQXUwmm8GXgEcjgpqIpJJoygjLJroDmGRDdNwk/G6oT9Z+ZgLCBoeCOKqovjF1VM7eMo38POmnC3F+VIEeZqtTFGEqNvmsYn+m5D9IL1hV7jkurXVXwf7zXRqaHBU2F9obYhjKNNsQToMxfrDEEYeoiMPITixGZFrKg+D8kK4UfT+TsflNdJb+aYMcdC29kckirNSlCf6RAYBLGJEBd/BwpeWOlQSgHzIKgyL4oFYjGLhtQzT/P9JVNV7C5Kg3LkPGWvNDgnGMpEoXIptvGaV8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lS0gCCzWeguR8JpKGp5F+6zyR+fe04j/OE37EROYNqU=;
 b=DyeiLkpqu92OkSvkg5ysOhCcgm5a5TP6il1fcRYmcbDQHK5VT81nmxFSQmAxb0sDZ4tGMz/iqOrdFEOxL86O5t6HGRKv756BqJJKaYgoRkcWfFsp+kzR0Nl9RYRP9hPAjNs1KiGGXSNnl2+8jpG0GEV5kWebgMBwcfPYuhmabLbef8y1j0dMJEexXMDCO64dSc8ERqS9+LX3zmy7k23ZI4MBpvLHwjKPveAPBTiGt+OgNgEnPMtPlGpydM9yG0FOBEDC3QdKox9CSDouOfPd26BYirX0e0ZXr5psQafQPIifyJ7/5xZK+yn2lsoSGAyj8mlAH7AHCOCTJQzATuKhPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lS0gCCzWeguR8JpKGp5F+6zyR+fe04j/OE37EROYNqU=;
 b=e7WfhIsKVllFPR9tSfG1kNLebO90iL0Q3ztvL8zHnwz1ActEbWu0k6UJ50b91UQ5DTnjpjGFf2+j620Dvbao4JgPYI+WwFkYoaiRnFZOxYLwfy+GwSCTu3LhlfQivPVoukD/M5IwmmHIdIbL5+086PWL1E2uw6qLJdL5iBuBNrk=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PA1PR08MB501988.eurprd08.prod.outlook.com (2603:10a6:102:54f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 15:04:05 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0428.004; Thu, 10 Sep 2026
 15:04:05 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Areas we could do with assistance
Thread-Topic: [OE-core] Areas we could do with assistance
Thread-Index: AQHdQEajpmIhVVdJl0iW34+2CNMxE7bH6qMA
Date: Thu, 10 Sep 2026 15:04:05 +0000
Message-ID: <930ABC01-F053-4762-9E00-F51D2FBE04DA@arm.com>
References: 
 <db81c3f01f75899c8eed72fbfe8776321572e3c9.camel@linuxfoundation.org>
In-Reply-To: 
 <db81c3f01f75899c8eed72fbfe8776321572e3c9.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PA1PR08MB501988:EE_|MI3PEPF00008481:EE_|DB9PR08MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e1fc3d-a1d9-4d55-843e-08df0f4cd555
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|11063799006|56012099006|38070700021|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 
 BUQWU/krERPRPyuVO7zG6XrapgME9zDyJZiI8cS0+W118lYe4T23pgMJ1T/W0XC9q6yfQcOOWwl8OI94L9s0ulr27q3gk07cGOtWzYagrEhPpKkD4HxqC3Qme9nvL+aegByer6pkyMnDUnBAPUGoyNGrVt/2xqFl2fccQ281vY2WvmeB3kRo6ekoyGrd2NBTj06JEm2iaBRu21YWrRdVS3jQSnvSQ/qcoebKL6RXlGBNjPvbMhutryf8tUZ+JV2EyD76JqKFXTDXkpTcKXwwezivV6H4+lkayJLkK5KWT9l6Z5V4tSeW+fxY9EXcSRxnSMIUl8S49+5PlsPkk17NAqfa1kiL4JEdj6OXrhSt+zbUtLjdCl9FljtN3YanhnZ9yDYWOuHDhlIb/R76A1Vbzq2uUM2w2CQLIiBBTgVFo71BztmUGh59yT0ZUidJVZ/+Cnqx8ELhD5EgKriF2G9EZ7RcIIMtt6MPpbo/hGnchOAj6F9J/dH5Zsu41xanO91g/bb8XS8t+xue4Fkfe7vb7MMUa8Ac1MpRdC0t3wI9buv0TYDMaHt09wfQmfWp7wLtEuAdYFj3rj6PTuWVCQ6Se92WS843Sg5JJDLSsd7WbWGC9eswFx5fTxuRL6/PNq5u/dlkrGqvvNOSjlZIvxmWLT3FqP8025PToBf0Rbhq0tk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(11063799006)(56012099006)(38070700021)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A9D104EB8AD8A645B247599788573FA6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 Ns9x6Rs8eQ9vYMV+vF3J7P4NGk8tRKBapI3EENVwd6dOUnEgNi7yFLW6euCESZ0Ys6HN4Yj32QZwfB5ZRCdFYtdB7a36QCfx03N8YGpU6Xo2o73LgzwdNoDVIZCYJk7nLtZ4BwjwEZ0A/2Aj0c714uk3QZpDesVJVRdUXh/CzMOOYC9PpMhdCHaQJ19LgLgBfdxnDJm1A2t7IN7f0NpjWpwNyHkE7xldEHQKVZGGCIk1La/SLpqqPcO0+hDq8rAXoT5GlrpbFaOJZzl9g9w2VkwiRy0UpGA8DXxGk3TfA5bkvFWBomE8dXqKF98jjAMQtzolxdAdInhqffUqFPu3Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR08MB501988
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 MI3PEPF00008481.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	96c32107-0996-472a-82cf-08df0f4cc1e5
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|35042699022|376014|14060799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	X7pGrpd5dCpfsXsd96tBgIx9cChI56k4t6ItOuTPwsGQ8FfuuanpdIITS9oOMuuWMSAjGk+8TrRAeo9XvYJx/1yfmAPdYvQ5DCjd5jFYknL65G7cYifyzUFHBTD06zozjM+dHLc0IXfzan+/R0LAHt045/Hl081Nq5DHzo17IKTdi6V5gQuDCtJoT/Y2lrtG7dePtiRDzV4wh8DOwEDfFh5XFaAgTy52KMRGMAIekvzqOb+MCKnT3iocv4wN3Wpv2vA9OtKjuKJW2pRBitjQKxgKwwryLmSUFUlYpBq9fx/QLfX79yhu1xvrhwialXkkQQwIvAKu0+72D0wco6AMLXnb7AAFj+yDRqQEWX+gKzJMNYfFfUgLLYM52b+nAfiZVz3UMPXXGD0DDy7y60WIcZWJXJb5CsNjSqZReiElgHgnM+EbF8G43tP6ncdpKczfm180SUhA2jGbfaN0OxjbZJ6RJ4iGdU015KUS7dVLXmwbbcSdQoVwj8G33XO9EERMNQqNBtsJdFm3T6Pc67AY6rcs1hsEdoVKYGzyS+4+LevZ8RUNM5D47PSWL/gO3HEl8zPV3ISY5zeEFLOfBmvfC09lkX7KYyfRVulGMcKnL8xsJm57GtatWzMXKdIn0HDw1a1vomo9+sTgQxXFwVeV7A==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(35042699022)(376014)(14060799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	37Jkq0ihohlc3hoZfhoJ/Z5lhbeRxkzCfBNoroa83TgRrT2pNWJLO8WteJArVdA7kSeCvf/4J7EmgmImCmGM1TtLaTcJ9CJ6v9PtExklo2YBYP0qf6GOvQZo1HBA1xPaFhzfK3VCbVYX/oOCmFW+o0mbA2O5dxk90Z7qOYl8ubVYWG/EM+EqgaBr3ZElUsIbQguYPpGJxlBQ99eswM7wXzhLYojtdyybTLUAIFxM8FK8a9VqORgBmIZ3xesqarFhbseBJyTB+5WizzqPOUIG0PQ+AXLvHXok9RToUVb3g3aRFjg0jM8pbDDFXIZHyNIHbwfgmU9teIvJFTn7xDYLD/mm3S04lHgaaYTK3d6xTpT/r/KHgKp2Dxxl4df9HxgwCCdql9XjyONVEl8AlF4+UggV1OkmpVLW2xBddcrpgjXP4e1I+YNJtAaCARWYz1Dv
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 15:04:37.9911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e1fc3d-a1d9-4d55-843e-08df0f4cd555
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MI3PEPF00008481.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6426
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 15:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245586

T24gOSBTZXAgMjAyNiwgYXQgMTE6MzIsIFJpY2hhcmQgUHVyZGllIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxyaWNoYXJkLnB1cmRpZT1saW51eGZvdW5kYXRpb24ub3JnQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+IHdyb3RlOg0KPiBkKSBSZXByb2R1Y2liaWxpdHkgb24geDg2IHZzIGFybSBo
b3N0cy4gQWxlamFuZHJvIGhhcyBtYWRlIGdvb2QNCj4gcHJvZ3Jlc3Mgd2l0aCBpZGVudGlmeWlu
ZyBtYW55IG9mIHRoZSBydXN0IHJlbGF0ZWQgaXNzdWVzIGJ1dCB0aGVyZSBhcmUNCj4gc29tZSBu
b24tcnVzdCBpc3N1ZXMgcmVtYWluaW5nLiBPbmUga2V5IHNldCBvZiBkaWZmcyBhcmUgdGhlc2U6
DQo+IA0KPiBodHRwczovL3ZhbGt5cmllLnlvY3RvLmlvL3B1Yi9yZXByby1mYWlsL29lLXJlcHJv
ZHVjaWJsZS0yMDI2MDkwOC1zdjh1d3c3Ny9wYWNrYWdlcy9kaWZmLWh0bWwvDQo+IA0KPiBQYXJ0
aWN1bGFybHkgdGhlIHBlcmwgaXNzdWUsIHRoZSBsb2NhbGUgY2hhbmdlIGFuZCBudW1weSBjb25m
aWcgaXNzdWVzLg0KDQpJ4oCZdmUganVzdCBzZW50IGEgcGF0Y2ggZm9yIG51bXB5Lg0KDQpSb3Nz

