Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E84EC88E77
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:16:42 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4960.1789499791346222233
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=A0/0M1f1;
 spf=pass (domain: est.tech, ip: 52.101.65.29, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNfWotYs/mr3tqS9vJcVIjTkRSsbD0YTaYLHYExKdMzr5aNZNkUzEXgnkbcmWd5GyB7Nmcs4TuybkKr4v6rwgVYnhymsb7NkR83uYg9e/KGHOYREcJSK9WsXGyM4DO/o++xAcP3ERKLdIiSjRbxn33sYh+VujML+vJFPZ+EMnz9rIAWMlBIFH8EoN91H+bhH6+2+NSTwmWUsS+nbSvAAFCFheUalZANUxPIX2h4s1cTQlA5WJjU0YQRGdKIUQ9CQKRwLnXBwRrlpXLiwQ/mtn/Yc30Wr+M5ABvKmdHo23Ie1SBIsoFA7iosSnm/pglTp61OjkykeDtvfymUpcDKLng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ockoLhIIMMLbbS7DiLjUwusy3xdZv2NqO0oDw7VfJxM=;
 b=vy3+C9Vpl8w6ypEdjZ+LjWQ1vTpx2om+qWT4itzTYHPE/JwYMJxw7oOru4IBbVafqOO7kEFPhwH+IJfO3I4YQ4XfCetHwbDqlqqxYE4kRE9pkknUZqqx98C57wCKcId7/ZfA/xOZ1G1uR4emLFclAzzUMrETqejvy/9E9maESI6Ku7Iym/pEwfGnyXTqaElZdSmDpK4YKpPcGPTQycWg4lb4wAK4F5nB6XXcaMJWtCm9gw9ctD8VnROOLo66P3wya/tQWS9ouxwl8GHPWCXM4IsTr5j7YRUnl40QH2MuGgvEiW+4mC8zpIBdeNj6geMsK7fSN2lIRfoSvupCAluCFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ockoLhIIMMLbbS7DiLjUwusy3xdZv2NqO0oDw7VfJxM=;
 b=A0/0M1f1vr7+x572W2RIo8SGK0qpfdwfB5i1Y+DSNqyIpsnrztYVy1oQGH451o3ux/lLdgh6SFwKgw2DTeRPHfExJFIIFUBLQfGGWQhpk2rSlU4Y5ME8V9L4PhWredvwy0t//nyCcxm0JE1Qb2HcOL7yxyQ7sTm/oBzBKUCVSuCNS54lbH44CdbjdIe3WV8xNZta0BaP/7Qh5H8Mpu1dSADqdrRcXYOwnwOEnEvNXFTCN8Hg1ath2leGQeSiGiCMzj9fOgtbJIFCeVK61DdwOihoV4zRL+5WHuabVUPpBh5IfEIre6+Oesilejmv9odTrZQGQknBB8wztsI+xue45w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM7PPFCA14042DD.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::6a8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 19:16:25 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 19:16:25 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2 0/7] libpcap: backport seven CVE fixes from 1.10.7
Date: Tue, 15 Sep 2026 21:16:16 +0200
Message-ID: <20260915191623.42107-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910051154.30595-2-jaipaul.cheernam@est.tech>
References: <20260910051154.30595-2-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0149.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::25) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM7PPFCA14042DD:EE_
X-MS-Office365-Filtering-Correlation-Id: de71a3f3-b90d-43cc-f8a5-08df135dd62e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	tq6KCtbLGwd4nGV1Vm6MX5q2syv/1J7beKGDRBkeIjkIy5io+QFQKxB0JDHiz8zbc61RcGgoTUqeS5e2zJuLNehVBGVIsl0PlwjJ1WLT3P5lAUQWZo/Gvjb6B70dLgoAM5l6Cw6w34cERgjZHwSGpI+KjVrf8hqdgW8fg6iBHyZ4casrzshp1xS8cz3nZjWiiNzXMqMZkpWh/TBaqG5kFgGJY56qSM8PIUo7ydk+OoWMoAHmmFR1+ZXgmtHP9mVkci9ixY9FkLfNC0Ukv5ahDXCZg1y4b4ORtRbpAlYdMDKviEjubMDEz53b1muW3NVTWXzgn4u7v2Wf2evTPM/xx1LDYZM/LKlR0LPtyQsIYi+n7zblhiKWdGWIrn6tsMoCxFhZkD+Hf2aUDkFxCe3DAxw32JoSeTpGTnyISR0sYxgyYnbXojhl2tF3ASZEu/JlORwpzVpdBKjRi6XZ+kUyusjFvjawMT/f0WBvwyaB0SwCLtNrATPIfL/MgRmMM121qLtbfYwfGULOMttkAr+r9ov/IEoVMkVt1zRE7z5FUoYRAmrR9y432LB4XYapq8ORVCNGLD3iA4NsQuDZuwgPDN0AWH3nA9HknxRz+77Lqq6CbgswRD0DGNGscInP/qaCQAbwfv2/rWykig3U242zSseFk//UztblH17XY6EaGgg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?e+AJY/0BFsVsoAknppSJQdbcVEZcO1lcBT1pobpms8BsdbbDGLEAEOw/RMTW?=
 =?us-ascii?Q?C3WYC3pnww6i+TeXmei7Yv2hyLtSk5Oo1QLGBfzeq7v7kzC3f7XRhN7r0cep?=
 =?us-ascii?Q?qBaxS8LDle10oL7ah4XYCZ6zLOeYVSeiouXCuNR8nk7nyzsPXJxCED85wzL+?=
 =?us-ascii?Q?7lZ+aDrDzpGgFEf9AY7wOg+Ev9AQEAqXgWNWwezeSsTTUP9wQ/rnvqyweQZf?=
 =?us-ascii?Q?rktNLUtR4Bxgx+wu5QOYZsJYdzzellUVxeRLEEOdJhgU0HiXD1vXsnqc0lxq?=
 =?us-ascii?Q?mZWZdazqRwEQb+bzAARd9zC3vQ1lsArxGoisU9T7Wwh5wf18bzQSKqZrtj+y?=
 =?us-ascii?Q?6RbJXlziq7FmkCISJJXlUrbpkiqKf+XWijGWeEELRfIUbLKyhZ843qcUfWvS?=
 =?us-ascii?Q?nd7NIqAQzSOkSIEGZYflAerTJqTBydHw+ioSYRUNSPf8eGvrezAYGxglKlkh?=
 =?us-ascii?Q?/4Txk6pRy+u2v+XeDpshyD+Ip95B6ofnUUxcAMPJXxGAK2cON/ku0FyQ7Wo6?=
 =?us-ascii?Q?vYkzCYPaZ+qw+W6wh6xf6e92bL/gkp3g1iy6TyxoOf0w3UskYwLRJJKEReTE?=
 =?us-ascii?Q?VLzz5X/Rwe28c5/eAerwXMLhbSh3zlCHCscCIq+nrOCH4OYdiP8YTlU1DTbs?=
 =?us-ascii?Q?mHRHMlR+odcMg5p8Jdz9c6IMpP3A+hJA8u5TaDJt4MhlbH7KrEk7ftAzTxVB?=
 =?us-ascii?Q?b5UBRzP+RACgl5oFN9YG3n8aJc7lqmGGwYQL8ZIj/Of1lAo+EP1zssVICPrL?=
 =?us-ascii?Q?3QUP1BeaMjydsnRCztlJwvCtxCN86jyVO+rjKCYzdZ5v6BQgjmb2WYp2OoLX?=
 =?us-ascii?Q?bKZEVpxdKpo4V84tq5elLWjBhGU1n1tqZRM2HmhqRwq3zYipaRvK91CYnv+2?=
 =?us-ascii?Q?pFrCibt6UekYJ5wAs31uqdlF/Ji45Ce8VSKeurO0LcFVKluKRm+ThgRxvfJZ?=
 =?us-ascii?Q?XpZ07Axq7pEAP9yDUANv3pyvqUY9fV+WqSB8a6tx7a01Dkr0ZqNnns7DQlBK?=
 =?us-ascii?Q?sizpbDCNNPSLn2/i3Yoc+046/c8G8EpgwpawLrgMWr5kgnNmMtx/pdnmTyd3?=
 =?us-ascii?Q?H/YFOhIn8cg05TLFhnV0wLoro7OOXP3qCz2RrxpOKt3EmCUNYgcr+kro7kb3?=
 =?us-ascii?Q?t6A0UFS/VpJHs1CjJyvLilIgSu/IhQJmfQpfESgX241I/mfx80nqwt+kpkw8?=
 =?us-ascii?Q?YCTjYxJblAzsSOS8JipWsKcT919IX2JnbvlI/agcWf68oeIKbe3CJsauNza6?=
 =?us-ascii?Q?m9YEnCqdpleApi06Y5lOKblCstv3URgHN55an2T42FwJV1QRHgSlr510wpc3?=
 =?us-ascii?Q?BV/iQBPAvOEGO2rMIWRfBQt4Beq90Vxp5FOUx8ero8MJJnOEp5wvtCAyZjsz?=
 =?us-ascii?Q?SYKljpApt/oNjSNm0dDxQevr1DcoqyWoEMhuKkHPP58GyInHlF9jc+ojQ6MZ?=
 =?us-ascii?Q?CQoYc87YWXDRVKVTUxj4SZHFqXBC5xehrH4NrBhuxyii3sErL4jUXmQfjcdj?=
 =?us-ascii?Q?HE/9lRju24cXiSrqupvp11Gk59eu+Wh8FRLh0r88s9mHV5oz1zFQfFRB/qTn?=
 =?us-ascii?Q?hzbJLz+HxsGzhYtGi+bQTKOzDpAZrqiZYXvz6DPTBjc6L2vqzK0r3nbjAqSr?=
 =?us-ascii?Q?806eZ4KE0meh4W1EALoV28QqLJp8xCn/F+/OH3F+3nRp8erISjDFB8GcE2zr?=
 =?us-ascii?Q?+jBS1SzffOCwKoqwV3pYXFGoeCjm7so1BhALRVS21JYPFe3CBUsyyfqHOTx4?=
 =?us-ascii?Q?ZpZfzdiuEw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: de71a3f3-b90d-43cc-f8a5-08df135dd62e
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:16:25.7606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXuQIWAzij+fDdo9QLj0oj/0Kjs+aQjU5rx5Q+sIR7R/Y3DZ2QEUOcJYATH8ISMVrZug8xx7lyLtk3Ovl+K6Zr0oMQxfZQrba2wfR0fS1ps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPFCA14042DD
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:16:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245867

This series backports the seven security fixes that were released in
libpcap 1.10.7 to the 1.10.6 recipe.

The same set of fixes has already been addressed on master by upgrading
libpcap to 1.10.7.

CVEs addressed (see the upstream 1.10.7 CHANGES):

  CVE-2026-0799  - Access M[] safely in the BPF interpreter.
  CVE-2026-31912 - Mind the program bounds in pcap_offline_filter().
  CVE-2026-31911 - Fail opcodes safely in the BPF interpreter.
  CVE-2026-6244  - Avoid division by zero via pcap_offline_filter().
  CVE-2026-6554  - Limit "ja L" looping in pcap_offline_filter().
  CVE-2026-18313 - Fix a memory leak in rpcapd.
  CVE-2026-18238 - Fix RPCAP_MSG_PACKET validation.

Each CVE is a separate file:// patch, ordered so they apply on top of each
other. Some didn't apply as-is since upstream made them over unrelated
1.10.7 changes; those prerequisites are dropped and only the CVE fix is
adapted to 1.10.6. Such patches carry a backport note.

Verified by applying all seven patches in order onto a pristine libpcap
1.10.6 tree and building successfully, including with --enable-remote
(rpcapd).

Changes in v2:
 - Drop the upstream CHANGES/changelog hunk from every patch

Jaipaul Cheernam (7):
  libpcap: Fix CVE-2026-0799
  libpcap: Fix CVE-2026-31912
  libpcap: Fix CVE-2026-31911
  libpcap: Fix CVE-2026-6244
  libpcap: Fix CVE-2026-6554
  libpcap: Fix CVE-2026-18313
  libpcap: Fix CVE-2026-18238

 .../libpcap/libpcap/01-CVE-2026-0799.patch    |  67 ++
 .../libpcap/libpcap/02-CVE-2026-31912.patch   | 597 ++++++++++++++++++
 .../libpcap/libpcap/03-CVE-2026-31911.patch   |  45 ++
 .../libpcap/libpcap/04-CVE-2026-6244.patch    |  50 ++
 .../libpcap/libpcap/05-CVE-2026-6554.patch    |  94 +++
 .../libpcap/libpcap/06-CVE-2026-18313.patch   |  90 +++
 .../libpcap/libpcap/07-CVE-2026-18238.patch   | 222 +++++++
 .../libpcap/libpcap_1.10.6.bb                 |   7 +
 8 files changed, 1172 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0=
799.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-3=
1912.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-3=
1911.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6=
244.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6=
554.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-1=
8313.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-1=
8238.patch


