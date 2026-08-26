Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC1EC61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:29:40 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7782.1787732972786846758
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=anbpGDk8;
 spf=pass (domain: est.tech, ip: 52.101.84.62, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJb4n4Du/68xlHBweuNfTrarzm1Znyxq52sAd8BXf8e7rJfYYQxjxPqG6mYo82PlnTprvPoOvZoYJrAAnvITAqM213uuLLnNIA2DS+0hTow79zigIBh8e1NKIMCbkQch52YvDCdpDMhpNapAhn31j5tmXCUngwi53N9dWPajkcu/c9tr0J/2sshN+IPJ16n71MAT49RSdrGDGoqJs2EHdfFwaeaDJF+KFaNvWdKJeYMBlCcEHRjHaDDA3uInmdSNVg7+spv8eynPwUsCqper9CzOr5+Nc14TkoE0Q4cHXOHPkS3RuYyfC2h7bMrI0hNd7QYInC4OtMPAW6VOv8y7oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2SOWx6zzyHTBTqZbfbO4K5Gj598W7gbVzCv9UwoARo=;
 b=cjT8u6IM+InfFVvZanG0C7XrUvk6pk3fTiIYY54LkQQGNwsP/7bip56aHgWZuWnU3qv8xjXUE7XkmmDTTyApmkEaJLi3URa0pzQMSN7aDAFqwfzNeRhp/P+4JQE9s37kb6DkrEOxCdQOizcPnno6kCRpPoAh+VdEHEFmOp9AMyIzX1vfXoREZ5gfV3XaJLIW5xP9lEj8KYpDrfvoW0TSbqFCNxk4R9UMaNP4WEU8x5VDnXmCIMs4lpIGHZ0N0XXvH8Zd9/5O0j3YNcKqwnYjsCE8G1PoObq16xAoH0xMC6jgxWlXcwLSv/mExal83EEGowfeRSZ6G8fP0ereT4RM6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2SOWx6zzyHTBTqZbfbO4K5Gj598W7gbVzCv9UwoARo=;
 b=anbpGDk8JeptEb2J0rJGDs8wdeBhM0C0GCW8v4CAUsgcrw2a6W66v0kFqGmUm0ZDdmHknk69e3K3gIjrk1+gxpfUpOqeTSChap+n+i5mYP/QcY9ZPO0Yg0KonHf/ipruXWorGok3rA1aFid/jZe+b5EopZlIV99LN9cXTE/nrNZ6L/edm0AoDLFmBZt/F+xg+KbOpsCeSu0FqcrXbU54FZ2oeWOiwXiIGZPCNjfFHVIqPCic8CtQS12f7VkT1odP2FqEAsqx4PiAlN0modkmPE2DJnv5doGPhmTyeDY9O2YRdWSVl/3E2+yqfP/J6om3xiSY/XoTCtMk1orzRVWJ0Q==
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AS8P189MB2601.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5c3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 08:29:27 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0360.003; Wed, 26 Aug 2026
 08:29:27 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core] [PATCH v2] zstd: add ptest support
Thread-Topic: [OE-core] [PATCH v2] zstd: add ptest support
Thread-Index: AQHc528JjjqXLmH89Eu/PWcnAE1R3rY00NSAgHvJ8lw=
Date: Wed, 26 Aug 2026 08:29:27 +0000
Message-ID: 
 <PA3P189MB3239A4BF3CA76A86B7D071CDFEAE2@PA3P189MB3239.EURP189.PROD.OUTLOOK.COM>
References: <20260508083451.11094-1-pratik.farkase@est.tech>
 <20260519090816.17783-1-pratik.farkase@est.tech>
 <F519FFC7-722D-42F7-B099-E6FC356B1675@arm.com>
In-Reply-To: <F519FFC7-722D-42F7-B099-E6FC356B1675@arm.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3P189MB3239:EE_|AS8P189MB2601:EE_
x-ms-office365-filtering-correlation-id: 1979a340-e0fd-48b1-245d-08df034c2482
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|6133799003|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 6AQMt48uN7XJOdWHmIo9VrlptP/7/nardOCH37PnpEARue15DCmm8xMajycKDmDa2QydQzYW6c3Hvt4ILBfrDY66p3hRNC/iSwB4P36lc6BMuh/rKMeQua5HVK3/yyPqaqyN5D2JJx0Q3zFB0Qs22JtATrYBLmMnZPNJN6EUO0fFgHlfdjjLn53kkXXZhGx1AuW3IzwhZjzpiQbNXMlH5NefqaLSdVhgO+TzpkwBxFFES21yw4OnamvAS9G5UrVFrvQB33xlgTya5jPEMXKweZGqNr75qlCg5ZfGZuJrAXJWjXOMpvS04BEVOp1fcKNGiEmS4sf7VVs9OFaUBZfLduAejz+BS4IOpDMB0rnLeKmmCGObbLdDtvhp2hEn/h2xwGmJTop+LqnVnnBz92bBXg13JoP+b3SzO72rTA3tkaYrB3XS2NUvItKNi3neyW9o2izNi5mL+67yLD4B3RL0fvN5+R/Y9/Xk+krP8RLdTkKvrzPLvG4c68fpJJsubTTUsSykAjaa2HQIuUxqe5hg/F4toRMOXMSTqMg4AZn+wW6KUp1lwetJC8XXp2IbGBNgQmQCK6SekPo5nifEti6LiDutcbZjFzPWGxihnquJ9KLE+3/tfZ0wWafuQQVE2a+zRL1jzvnlmxdKXujERhyTR7MqO/Kx5IpqIjMgc9qRUAEljTNlxzdePjYtag3qkFuK80B0OB6mkrx7Yfaec62ezw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?meo01EILNCEmDjIR086sihgJGaOAAVewTuO2Hlf1Va3Ho5qx9DLHFOGc?=
 =?Windows-1252?Q?7pOtBUY16Ko43PD8lkSgDVgNka8vm5JGGEsZKowZ+NyQGgMuzPek1oMZ?=
 =?Windows-1252?Q?0Xado+45M7F60Es7cC3uB7mhi1rcMMPzshp6ocB0uQoZSEfb36iViYj4?=
 =?Windows-1252?Q?TsRE0jpHqH0coS70d1QoKuLydYR8YNK8yoXemVWJKRyGBTo2D0KD/XC3?=
 =?Windows-1252?Q?7trQ8e8DvSk9YI5KpMX4C6uqR8trd21bOOWrQXD7m8WWbqSWWrPIOZox?=
 =?Windows-1252?Q?1FHHLZJ0Rtg7v0Z9/s5Zj+x0vgVlo0LHbgPDejwIflEq0HFIXcPZhDn4?=
 =?Windows-1252?Q?Sx2C18naIKMC19y1hWDTOabXwUDK5PpmCgs99MGEP5hbXnTZdjzgjwfY?=
 =?Windows-1252?Q?GCoZa9//vDb4K1kf0++r9xVAkCCaH+7v9WV68Ac2wLQbXG2SPust+KQL?=
 =?Windows-1252?Q?GarH8i78570FtOkvZ6C9c5FoYrjZUnZ+5fW4RbOpL/zyULyWBEDa+vWf?=
 =?Windows-1252?Q?0n1O9T4T7hPqb/Bmb9puMmGZT7iWAJMDKvqSsyEv7KcqSK+Ti4OsMJd1?=
 =?Windows-1252?Q?heTU1Xgb7C6MUblsgcidz2delDQTzzlQNxtpjC1SMG+SrMTnb3zQOcU4?=
 =?Windows-1252?Q?s0lEXqgDKREwoNXrYa0QdjohbHgbWugBZWa46RsYZ9RmA9AHoV5UJTwQ?=
 =?Windows-1252?Q?6EFMQ64cf0xJDMlokvjP1S08ZAHhIhvzg80SrNjg2qBQAHh9SBhDNJrS?=
 =?Windows-1252?Q?IHC8h7Uy6XE7ygQqnDkODSv4PXBCreyoZwhdR1+DOqmyI5P5Pmlv5upG?=
 =?Windows-1252?Q?mKC5LtOb+DH/qCjh1Eh+ejsCeGxl5G8maIPGroVM70fUvt7heHDgysca?=
 =?Windows-1252?Q?cCDpdFaBxqgJNzmKxdJkUsXYWLCE8nva42q88eVMeQ1IeIASodR4bLN+?=
 =?Windows-1252?Q?ZqX8aHClXoPcc5OlM3Abwkuv1aw3c/gMcCOBvlK9NCX8u6/3Jjl+lcBo?=
 =?Windows-1252?Q?VDmSF0BXr+KBACW4q9VwPS3ifat8fQiImIQKD0WU7WamOAdClUF5KWai?=
 =?Windows-1252?Q?kIoK4B4nRPcR026cIBkKAxP29Ry+J69gewRi9Ri7hsgEyEBwlsVQ6UXe?=
 =?Windows-1252?Q?VxWHn4Ot29PBtfnUD5FIvbY3ks6Ecx8MFTYeot5PG0sumcQ7Rr6p20uQ?=
 =?Windows-1252?Q?brx9GJZh4PFuztdRxhUkWdBylgqGyUWKu0lFfS0VEGAdYriS/L30CoS4?=
 =?Windows-1252?Q?FxFBLyN7aVCuinv/urV7qit/gYMeQfVT1UaCwVXNlCioBHn0ntJ4Lm4l?=
 =?Windows-1252?Q?Dv7Bqoq05fU9PcVJ4W1Zc9K5wvPJz9alXPu54z3eiODfN1gHREPdQvZ2?=
 =?Windows-1252?Q?JCozW0bpmRJeEnlaoJ/pMMI4JbT4a3UULKXcdMfBvqhxfzqFZl61nYpx?=
 =?Windows-1252?Q?TKide6LKZ7sfQuSuaKEG9v/xmVvqRVEmUzuIMVh705uzaXnv8fRIs8qA?=
 =?Windows-1252?Q?IWTsBuUohuc5E5fSRB8SWuaMPx8WjamYTAWhxY0jwKCka2HIirEsC/hN?=
 =?Windows-1252?Q?C6QwUXFb9ffMZXQa8zgAhnkWf/SIJn/Uql7QbLLp8Sa6uij43DGcSffl?=
 =?Windows-1252?Q?d3ERYpnL3xFAIRCGHzz2Udne/tIBFRxRR12O72ba8e2eJ0MVzJstGryC?=
 =?Windows-1252?Q?Dza+sO3wxRIJrgujAmv45d/hvElydROZrBoXQA8B4OzM1QB2FarnIiSH?=
 =?Windows-1252?Q?eKBiG0J4+L0rxsmVDX8mQsS0nRfk4nSWsYGxWHqkrcWMLxhR/QzRRRUp?=
 =?Windows-1252?Q?SWbgYU8Q6Ga+3KvCrIYuZs4uOR49Ug8aOeR81cZSkFuLB/y1?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1979a340-e0fd-48b1-245d-08df034c2482
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 08:29:27.4250
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0nEcupBmZQewO6UiG3D7JzlomNraXGg4YLF2bhaw8YoP2bnTLTdO2DlE0qjxiDg+aKW6SVyMBf5Pku3opPfBgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2601
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244366

Hi Ross,

Thanks for the feedback on v2. Sent an improved v3 with the test scope redu=
ced as you suggested. Now only running fullbench and
cli-tests =97 no fuzzers or stress tests. The result is a much leaner ptest=
: 36/36 PASS in ~32 seconds on qemux86-64, no extra
memory requirements.

Best Regards,
Pratik

________________________________________
From: Ross Burton <Ross.Burton@arm.com>
Sent: Monday, June 8, 2026 4:05 PM
To: Pratik Farkase
Cc: openembedded-core@lists.openembedded.org; pratik.farkase@ericsson.com
Subject: Re: [OE-core] [PATCH v2] zstd: add ptest support

On 19 May 2026, at 10:08, Pratik Farkase via lists.openembedded.org <pratik=
.farkase=3Dest.tech@lists.openembedded.org> wrote:
>
> Add comprehensive ptest support for zstd running the full upstream test
> suite covering compression correctness, streaming, dictionaries, CLI
> behavior, and fuzz testing.
>
> Tests included:
>  - fullbench: validates all internal compression/decompression functions
>  - poolTests: thread pool ordering and synchronization
>  - invalidDictionaries: dictionary error handling
>  - legacy: legacy format (v0.4+) compatibility
>  - fuzzer: randomized compression/decompression (200s, ~700+ rounds)
>  - zstreamtest: streaming API fuzzer (90s, ~250+ rounds)
>  - decodecorpus: random frame generation and decode (30s, ~450+ rounds)
>  - playTests.sh: comprehensive CLI validation including compression,
>    decompression, multithreading, dictionaries, sparse files, frame
>    concatenation, long distance matching, benchmarks, and round-trips
>  - cli-tests: 36 Python-based CLI integration tests covering
>    compression, decompression, progress, file-stat, dictionaries,
>    symlinks, and file handling

The primary goal of the ptests is integration testing so if we=92re having =
to manually install and run the tests then it=92s entirely reasonable if no=
t desirable to pick a subset of the tests.

In this case, we don=92t need to run the fuzzer tests and so on.  I=92d sug=
gest maybe just fullbench and cli-tests would be sufficient here, less to i=
nstall and faster execution.

Ross

