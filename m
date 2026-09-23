Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9786C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 16:56:16 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.185.1790182573402538710
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 09:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=YGq3vMwa;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=YGq3vMwa;
 spf=pass (domain: arm.com, ip: 52.101.66.16, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nw1mwlZNL1CHYCVOHciRWHgqvA+v7PoOjmsqmKQ4xAh7/M5wb2SBFt6dfxd17J4gHJx0mTYdpusD7Y9PpIqaNeNYlP+ILgMETE1iryMZjQcmZYQfVk+8ll0C/kNAJHwQJEmObd1TVYqBradTBhNbULlbbPI+Y4t9sNMUPpmnwTWbSHPlUn27NX1K/fFsZyOBNwtyDiw4Be+ZdHrW7/jhzZ9UCxu/NtNveNpzfocYaGw/9f6yWgDtZYlsv4qgR0pMrJvV1VmnZSOI21yW6pfD1vLdK9xZgRA2MkduWBJQne/6s8+Ez8etuOej/QyCb1kyxM0Tgk95Kz1OArzzzs51Sg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/IzO3cbfD6xsvtP8V+Iy88eyBcESlBzUiBc4n6L2DU=;
 b=XA/0DbatzU8zQFvcgfSidlh+s5obXNSAWB0XwK+PS3XrnFUAIq02J/vfGarzGnY7FzDn2gVmUNrYCTpVRdVjyuw5PJ50IsqeiK6Pfr9FePVfczLceUUcdS3CL/5bcLlUBdKY/NuxnkHlS0VXRHCYk80YrxRz8fJJH/K92bX1apujp0KrQPklsPM1WLJCFFS+V8mvJiI4We8B520OXeIKd/kxssJzgzcQbeUYlctsZa3YAWgtmR+5FrFfuUz5tixZIjf4saqLlIobhgtdCZ47iDpSiH9Jf/dUMmPa2LLTA3bzmPnelIiPVzJHhNJGxA6ZHVIIRDyzhJcMReFv6TzAeA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=sigma-chemnitz.de smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/IzO3cbfD6xsvtP8V+Iy88eyBcESlBzUiBc4n6L2DU=;
 b=YGq3vMwadjbvsF0uIRQecSLzHi7is4f/jmisTsW4eHVqL340ZOduTsfsrFY/WbrEUznaRzLb/ceikeIvhVW1/nT4HzJmkSTvPnjH+Yls7qIhVxKSgJR0GO7i0oAkYGni1LRLmFzLZcq6Se6IdranRjnrLohvI5t51wqVa/RTU3Q=
Received: from OL1P279CA0057.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:15::8) by
 PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.17; Wed, 23 Sep 2026 16:56:09 +0000
Received: from CPH1EPF0000052E.eurprd05.prod.outlook.com
 (2603:10a6:e10:15:cafe::80) by OL1P279CA0057.outlook.office365.com
 (2603:10a6:e10:15::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 16:56:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 CPH1EPF0000052E.mail.protection.outlook.com (10.167.241.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Wed, 23 Sep 2026 16:56:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eX9jpQn156C33RTNcoYH0WaxrGIXf8UInAuXQTklINarWfikc8f/XrPoP6984GM1CMxsLjGS3PffupxhVlEKa39DBNCVt9/Iy+OzI9Tn8A/hSty6iAJV7Dw/i1G08Ou0lmDA4mti1gKXE7sfFAgleFEYb3ug9g3qpynIUhRiu4xEHJwP4FSWgnVdoCBVyCG4q/a+vRKAofdNc/R36KB8fayOnGKQGgSuIppMs91f+KCeLc3sCMn/vd2iBKU+FTwfAI/yGwXVvYIznU37YlruBdQSH/LPuhgTCJl6wpTpn5B3OVdExJtPD+p/kFbtAfBzvlpgHd0w8s+7QvAYHd9mOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/IzO3cbfD6xsvtP8V+Iy88eyBcESlBzUiBc4n6L2DU=;
 b=FneIcIK3mUylgAzTyrSh9FOISJ8bew9ClnfC+3hAnhypHZZhSChGV50kONdplH3RHfl0yI5wgQWS/gro3QR6vHbI0TMKbQYUbF2NkQjsDSonxMEchaIwg+YX4hk3JyOcuZXuuIqcItZ8u//kOJeC2ddCrUNM1FksiOkKpGr0oLQEj/5mHgdRt522UZ1jynbBDs5HhYK6LmWlgZ+/1qLtDoNDo0FNhlHqkj7lJO5KUcaUGBPm179+Eip2ta72Iwp8tfuvwSdeitdKK1DnWu9/P8wntO6qQojd1CQ6c0JISRwDlWKL1NgIr5uj1+kCjfxKT0YyYD6Ozh9Vb1o3dksIJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/IzO3cbfD6xsvtP8V+Iy88eyBcESlBzUiBc4n6L2DU=;
 b=YGq3vMwadjbvsF0uIRQecSLzHi7is4f/jmisTsW4eHVqL340ZOduTsfsrFY/WbrEUznaRzLb/ceikeIvhVW1/nT4HzJmkSTvPnjH+Yls7qIhVxKSgJR0GO7i0oAkYGni1LRLmFzLZcq6Se6IdranRjnrLohvI5t51wqVa/RTU3Q=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by VI3PR08MB869411.eurprd08.prod.outlook.com (2603:10a6:800:372::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 16:55:33 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 16:55:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 8/9] classes/cargo-c: pass flags via
 CARGO_BUILD_FLAGS
Thread-Topic: [OE-core] [PATCH 8/9] classes/cargo-c: pass flags via
 CARGO_BUILD_FLAGS
Thread-Index: AQHdJDKuPvAQii+adEG2CeiskWz8hLbTO4TmgAl0uoA=
Date: Wed, 23 Sep 2026 16:55:33 +0000
Message-ID: <9921B090-ECA9-47CB-B05A-E32EF3925FB1@arm.com>
References: <20260804165803.598030-1-ross.burton@arm.com>
 <20260804165803.598030-8-ross.burton@arm.com>
 <lytsnnzvp1.fsf@ensc-pc.intern.sigma-chemnitz.de>
In-Reply-To: <lytsnnzvp1.fsf@ensc-pc.intern.sigma-chemnitz.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|VI3PR08MB869411:EE_|CPH1EPF0000052E:EE_|PR3PR08MB5593:EE_
X-MS-Office365-Filtering-Correlation-Id: 34970d01-2818-4c57-4bd2-08df19938fe7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|38070700021|11063799006|10067099003|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 gxCZvrjmul9+VqbiMNVNsja/hGCZBQGGy9Tf+AUCQMBnLhNOrsRbblnOkpiXomfgwAdM0XgVV/I9hEP4Ai5JT+cr6FKT5R6oO+qrTMDo+yuIFFsyYI8YVB22gJFQUjMIV2krLIevZLNcJHIJwAFoVgUEm5haVB3fVEf3Nda5lcepjyHeL5AbiEOqC6BtNwwTnGJ5pCq2jCp2Be4YQVcb6+qaF0Jogq0rLseaGwJPsFFtkGVgQqClauBmb8AveYe45rQPis2weDSzkl0FyLaW2P3hJ1shAFuoIm96lwLXZYWJ6hsLb4c9XuHOg4MvrkCVbmvo4XJO4MJDn3zPoRvYkUAyCWvW1aM5UPyGdV6YGpSCrJYYvB1NHrQZ0R0ltf9pe8WKPEthJNHWRr3uh3rmZdni7JDLzmpS9Go71qB+XaKYIXEILlxpgXiDrdrvm5p894ssnTHDifMiPH78va7P4hlvJagGbhzKE8vTVVOqbEaDHA93FxPOgvEjKdsLClVym4rvWXKoz+z2ScdTW5lhhdtjFaonqOCoRxDTl39C0u7r0eFjPaLRKluDBGGxvGYnr3Osnce+1yPXZj0JqqTyTNOOkb38TFgiEIUL7Utzdl2uywVkMePWNidfdFlVenOyDnXdHijop+u+OfE33Neu2vsGUFxqPXKWy3vzLnbLSbEcw8J0CuWNOK1q8RZ3PJJI4S/pTqGXOEYCo8BE647nXr+rjXEiE9G4R9Opu8beNdE=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(38070700021)(11063799006)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E07DA795E0428F4D9283B364BC25321B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 tpO6yqRwozWp/j872b7haIbnexp0Lcb8wpfJQxuISIkgI8FHk1wpJ65EJDUx4d/Nxt8wZB3uBkxF7N9KQSu062AYxTBRN7IGDov3lzdMLGubIVOUy66NdH5fOPOB/xPaDVC9gemvNFC7aHEkCRDxDBI3z3yEi9Ru3PTLn9wFrFjnAQSXla5EMi6746IJ/zebGgq5FW8tegL2PvpTNtXxAIC5rk+M/mMtVncWbSLNniEr43T9qNX3f06tPHC6j8O6Vw5fA9DLNiNunZhFnA6V60/+gbBMIdCc3ABv6QfXvyFmk5FlQHy6GmjUyqoEEDJ3mX3H6B7bmUISPdH1IBXQEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI3PR08MB869411
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 CPH1EPF0000052E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3c21feed-4b55-4469-7dc9-08df19937b85
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|35042699022|376014|1800799024|14060799003|36860700016|82310400026|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	o90QF9lJgFL315PMEKVAOHeussKqnFhXH4PtHlGTNmLeNqYYXCO/MApVr4xkDwKu3nkKURAgFhauxStwqwrgjxSKl1x/vZf05JqXuZumnRlHpTZzhKwmo9FyBaxBoB0lMAuuiPN7/iq6vEtSBxNetFYdHEWKBtxvTpxCNKtEecRgq4T5jx+JVOqh6cz8M1mKPlFJ8lzG1Wf47h7qfcBP3BPXecQDEE57PCHmoNr4IN2QRh7uMJ9/tN5pP1D4Ds5GF3Mi/rZsjkf/JdVGj6qOWVc2/Xogy4RfxhqY0czh7eTBghe5g4+n5FT7q/8601x1AavZu4f1oi0OGSAu+N+S+z/t4O8U43ZnEMqjXxVTPqVqBFsCX97lzAfsOPOSeaEEFoiUNLsDlNS5MhplkB45mx2ksznbmGEoxMH291M7A8oFz8CEzxNSMQWn3zePnGTAc6Hr8hJVX1NjZRkWXm6/jdI4LYV6cfrVr1qvwHDnyjinnEjXMFpBwct1wVvZSUZHUW1TmSfETlqlboQk+kIwBNTaF3QxgIPGeDqyOYnazk8BD54+sImSzTCB6WaI/J7y0ORvsn1wBSu5MOL18q02qBGnTIdkhD45q3AE3Lyjmzrv9dUAEvyqsgT2+/Daea8wmE+2hFUkNuq3FcbvGkuTMbytN4dqJhnQpPv4TXROQtTUIw2ypFijBTXoSq+kEzVsel9DO9ENi0/QaWYXRIdClA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(35042699022)(376014)(1800799024)(14060799003)(36860700016)(82310400026)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1IhtdAl6dvfWoEm28h19Duzq5ogQmWyUNLIj0TKDYYXkAtqJ3KW2iRhGXVFOvD03MhOkb0KCiskp3gUTtRnGqdXIsVQQOanS8BWUfSVYpSRoJw8RHUzKNk8Wmr8WCQIo7GuPqeaPxG12pVEJFeOYnhavqCsrwwYR67y7ABzkniigqauZQHMtCqnLt3MFHayJE2AT8CsTbWeOA8KZ+FKtdEWrng3CVmvUhsyGN1JV0wL1jR4QzC69SVqpeVFgyOKiichLWU3Y5qRZgn7jg0pJbUCAnNcOknLgadzybYF6HkwX1Cml/JkqyjqlJXjkZVRAtbAT0Y4Im+qpfhGv6aHg6onBQ9gE2Q+XqTIiRe45LN2KsEfP4ZmW7bUWmc4H4dgKAw77cd7BP9MolmjJws4Ck09m8J+zz3HsluE+MmY0IKGZjw2hNYC4w0CxRnlylEtR
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 16:56:07.4181
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34970d01-2818-4c57-4bd2-08df19938fe7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CPH1EPF0000052E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5593
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 16:56:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246531

On 17 Sep 2026, at 17:31, Enrico Scholz <enrico.scholz@sigma-chemnitz.de> w=
rote:
>=20
> "Ross Burton via lists.openembedded.org"
> <ross.burton=3Darm.com@lists.openembedded.org> writes:
>=20
>> Add the flags to CARGO_BUILD_FLAGS so that they get used in all calls
>> and do_install no longer does any building.
>>=20
>> +CARGO_BUILD_FLAGS +=3D "\
>> +    --destdir ${D} \
>> +    --prefix ${prefix} \
>> +    --libdir ${libdir} \
>> +    --library-type cdylib \
>> +    "
>=20
> Most/all of these flags are not supported by cargo and will break recipes
> which use it directly (e.g. by inheriting the ptest-cargo class):
>=20
> | ERROR: ... do_compile_ptest_cargo: Unable to compile test with cargo, '=
.../cargo build ... --destdir ...' failed
>=20
> It would be better to define and use a dedicated variable
> (e.g. CARGO_C_BUILD_FLAGS).

Ah. Is there a recipe in a public layer that can be used to demonstrate thi=
s?

Ross=

