Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA362C88E7D
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:45:35 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5557.1789501526272473796
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=NOsiYXPh;
 spf=pass (domain: est.tech, ip: 52.101.66.7, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qxvSrhVnEBr0kMEUow+03DyWnxPteinRl8/pZ9quo/Ny991LXgGrrmsqQle849t9in9zQQLkcZnB1Ti8PEszdnTPN4Yu7gyABCWdr3i0X+DBdeXBZH6n+UOdbkTqqLxqw9+VvW3xH3QCf1pZlNLxfsPfVXMYX2dI2z/zKNhzl/wx/LIb0tK/T4AfmoZQ2wRniIow8TQOCDSg2//41cbs8yT/1uxwGL8ZLm9KexQHgELypEBeDGKY2kR8fUE2hbUIzhUQSSq8GR78cCzPkYgVvZHTJE858HMw39ypowBYegwVKQ1ArmovUNZX+f9JfjKDL5NuUZa94u57u2z96m8CkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8SO+oVeR9GM++H33LWNJtCVG/ko664ibEXbuFAnhlA=;
 b=fsWgAy9ALXPJlSWeIfPALTjiPIM7SzhKEweFmEQ7Z/WLHyexqueofjsEMT/9Zz5f6MXnFMkbBmA+pd2Yz8NSB0/Qdgg4+J+jLGZx0imu7McJxrP4dAWmAdOsgdo2cheajvC9M8lituu2mrOZEyqM0THBBpH3Nlomc3ll9YCxeZXPb51kyr4XJlNyi3kaoLYJ2kWEkNQ90xzuLNwuvJ1Sv3QZSuWRSB0Gmp032AlHwkDXLGDmKtY39Za0fakRVxOdgHNJik/m3tdkpJPwP81Rc9wDdUiwr16hgKoL0PIp64KpmjqTH93eMkrkbQw0SOx9Fn7FyaPTq/2A81D2fxjGSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8SO+oVeR9GM++H33LWNJtCVG/ko664ibEXbuFAnhlA=;
 b=NOsiYXPhw+9W7V5i8uSIW4lIFe+pzl1pApFrMXSKGNSJTr0KknUUNM33AJdOLJOwQSvsDsZPj+1kuqVnqDjM+352PTXs+kliEzmf2esi9CoOGG499YNs4tQ6RyUlvjmDNVHZMyPWBCEDZJ40lhfSwb6hPU92IohP9hyKRz0m3F4qds1ImgfKdyiwA8Zy5h5gIIShXENlt5RAgo0fHxssQaL4IH1WNU7ruYgxo6K649npoFIsTk9UmU78M4S0tzT4odqlKM3+kKMKrI+y4i4jjq0CF19/WbUupvQhekli2kNCj0+dVoTzrVBcqEfcKmYUjFEosoR4hxKn4qMk3N9awQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA1P189MB3172.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 19:45:22 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 19:45:22 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 0/7] libpcap: backport seven CVE fixes from 1.10.7
Date: Tue, 15 Sep 2026 21:45:13 +0200
Message-ID: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2P251CA0024.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:230::27) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA1P189MB3172:EE_
X-MS-Office365-Filtering-Correlation-Id: 89a0e89d-a50a-4526-5fee-08df1361e159
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	7120gZoGnYyAbTQOls2jMWKEfrzsV5TOS3dmZPaX89uAds5xDmWWiCaexVpQbKeJXT4P6r3Ja3bAq8rxExvTh3W6nPmAmnVSkP462Px+LlIUqCYbp5Y25q54WZ4qbYEfY3NHAbFj5NUAFazer2DgrokaMs6W4YR5GcDaFFYiejuNLU3kFaxss5k20zP3cHqZHtAoe2w+SRiNFPbl9Gm9DTfxU3ps0QizzW3/GAI/dId5xFueGVF/8uuz2O4ih9dnlhL5mT/sAH57VpPlJuPrEKsE5tfzTfHP1jndndHLcqAhPDNEvzfgasgIcyfPl198u4j0mBqMzKGoCyxlHM43k5gK5zjc6rgQWwNlgzzCotp14ups55o3ALlp5eukZUG7pLKT5MsNlvqzD2/6KX/rju8q5lLLmIf87T0UuaAZueGrmiHY/Z/ZdMvpeHINaIMTs0ot2IO7DiNY04xuvK3C/rkXjPjPDaQMkFXvE2cUIrfwU0gJfXeaU+J/VCgbVdcMOovPZcx3zibuVj8W+LTCUwS1j6m2i5KO+9x6zMbxmziwwx0v9X+GuhixXzLFIxPxyYsx+kdvo+ULpzvqnqhdQgAqVB0LJRtT8/J3IOwuJXNoyAA+rvnAzws5cNgC7jwS6V+Q2C82eQX5FlUXOYj4gWfGf++sqZXQbdrR6RuIl6Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Npj743ynpuVNnxsGqLGQxZtPbovDQ8iSmlCyUvy96gXG17By/2imLdl7EO/q?=
 =?us-ascii?Q?iYtILe0a0IS2zSjrcAYN5lI7dd72ziLf4j99qK9bNH25GsdM3Nu+XqDvgekJ?=
 =?us-ascii?Q?CfUD00VdkdPz5cfIVeUJJxyFY9R7MQ9vIn2nW2QhtltFJrWVjdhgkXE6GrrI?=
 =?us-ascii?Q?f37hGsuJtZHylGmBJUDAdyNS9zrs7Hm/H96U0yRFOYcRceQi7XvOTq02VYGQ?=
 =?us-ascii?Q?O67DjbbtfAaFY75Fb9xRSa1yJnLGGzvlUbFw9UnJkylppnhXbviLyWXfYU0J?=
 =?us-ascii?Q?65/p3P0CpZ9dQUSQq5xS+3rWyz76fLz7PLokrTM57l/OaxFJdFYGjm/xWtIq?=
 =?us-ascii?Q?+NEwd5dTW16nkgL0+yVoHvYmSIsaoB9JIiDNngLOyf+Yca6TsxufZveykKNG?=
 =?us-ascii?Q?woM5YrT02U3GtMdt76ku4JNGupKz7+9UqomdxBI1c8ZTcgHRWMJ/ak+gJU8o?=
 =?us-ascii?Q?vsNSwBt81jS6tFk3rBcTsVHGGnTGXTRb9I33Q+NcHa8323uzjrtchTZ9qB6P?=
 =?us-ascii?Q?lQ0W2DnlUQHwfdsxKXUrAX7OKrLupUPa7m79MVTvbMiBzZTmmJ2OTapocNJJ?=
 =?us-ascii?Q?sfxkipgoeR6joksU6ZEoX2zP8xi8GuYYdtfeGyR2sYKW/vH5UkapfvrwxsAU?=
 =?us-ascii?Q?wn/Awe8b/bR7LZUfBtqUVzIOjaib87NtTvnq9qOz3XUpAXRCbczPymGiq0no?=
 =?us-ascii?Q?HP2lziM1m1N/E2AMwOUfImfj1WKdcFyMwRJrPONRi/wIRAiIRC1J1bQhGIxu?=
 =?us-ascii?Q?t8AO+lZytVKrxf50yWqV4MRGLwYVNU4OXLPapCtoIaZChskbl3MM7iRK+mL0?=
 =?us-ascii?Q?Yy3VwXO/PP+eGNv2+VKi2rAwfb0Vsrx40uwk6j8REic+/DE4OBtvF9sYnXKt?=
 =?us-ascii?Q?6xXx+XDKYGlihqBUwN2h04Lta3q2BadPuxeGglZ7cGpPiKhMnD9pIn0KFn9w?=
 =?us-ascii?Q?8x8FCDowSa0lr4jmR+hQ1S1AcfO+wi37ylWkST+zfB9V3VFCI8LylO+kHNah?=
 =?us-ascii?Q?wrtv9gtJ3wvcrGbr7Dt/mM98zTMOnfc1E4KTFWSuuvnwsPh97p7HaT+DwJKp?=
 =?us-ascii?Q?faSgMkYRZxJxhOiKxnfJJwLMVwN0hoQmKtF9ywyfA8hyqvOPyY4qZDsDeOf0?=
 =?us-ascii?Q?nG51tKIY+fWTQrm/Uaurr9ya5svvSfb6J+5zU8+0Dq6LwHdcXnNBaSHlpG0g?=
 =?us-ascii?Q?3xDL9DKBc4ZxK0TeYFq6amuACnDBV8jgCSJ2EKKKVVQ/kviOmdJhD+tXHXIG?=
 =?us-ascii?Q?o0EL8drrvsbqpTyb9vRgAdYhf4RFf2c1CFpmV5/SDXLX4oV3sn9hSlv5NKfQ?=
 =?us-ascii?Q?rnP9G2A1ssmwQm7KaSeZup9XYUOvjoQ29rJqDoNk/5uouglLY1ZIJozeHaJt?=
 =?us-ascii?Q?0LXzXC9abqLyKgsYUL8YECvDO54E9rSDoHhihkH8VvStRNvwTT4efn5uYbKl?=
 =?us-ascii?Q?80z8ArNQALApAPJ5rNaxY7QPv/XT9foH++9COnp3o6baIDZvArmlKKTbPJvA?=
 =?us-ascii?Q?Df6wP/uf09mZaVwSuPs52JCC4LU7SjqrhmS5NrMas4Us8uWOM8z3hS8auMEs?=
 =?us-ascii?Q?+TzZLPtm6NpyhNB4gPJpwfMRG0pJNHpfMN1IE6vllKso9iHXCsXPdE8rcFy3?=
 =?us-ascii?Q?dK7CW6nbM+zM9fSj03SKnzUOaxMYotrw6TCipK8RC5Z6QTCP3q4WZvB+KoT3?=
 =?us-ascii?Q?53N9Qnln56TYS14fpkOfXRD9AhLYxWe2Mlg29uCRt8lhcQUcsNZvElCYAWfl?=
 =?us-ascii?Q?YY5MQtruJw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a0e89d-a50a-4526-5fee-08df1361e159
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:45:22.4774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3AflgbBsr/Pgvw6befPT9b2lhziqyk3l2dOcNG5waEG4ERh+oRBzWaaPW7UbkBNnDUdnX/zbFtQ/MRSrwtEEoi7b67hvMfRjDUPAsn2QX0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3172
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245891

This series backports the seven security fixes that were released in
libpcap 1.10.7 to the 1.10.4 recipe.

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
other. Where a fix touches the BPF filter interpreter it is translated to
the 1.10.4 pcap_filter naming (the pcapint_* rename is newer), and
prerequisites that are not part of these CVEs (the pcap_filter refactor's
neighbouring changes, the "bogus" -> "invalid" rewording, the low-snaplen
fixes) were dropped. The pcap-haiku.c hunk does not apply since 1.10.4's
Haiku module does not yet call the filter. The upstream CHANGES/changelog
hunk is not backported. Patches note the relevant adjustments.

Verified by applying all seven patches in order onto a pristine libpcap
1.10.4 tree and building successfully, including with --enable-remote
(rpcapd).

Jaipaul Cheernam (7):
  libpcap: Fix CVE-2026-0799
  libpcap: Fix CVE-2026-31912
  libpcap: Fix CVE-2026-31911
  libpcap: Fix CVE-2026-6244
  libpcap: Fix CVE-2026-6554
  libpcap: Fix CVE-2026-18313
  libpcap: Fix CVE-2026-18238

 .../libpcap/libpcap/01-CVE-2026-0799.patch    |  64 +++
 .../libpcap/libpcap/02-CVE-2026-31912.patch   | 520 ++++++++++++++++++
 .../libpcap/libpcap/03-CVE-2026-31911.patch   |  42 ++
 .../libpcap/libpcap/04-CVE-2026-6244.patch    |  46 ++
 .../libpcap/libpcap/05-CVE-2026-6554.patch    |  87 +++
 .../libpcap/libpcap/06-CVE-2026-18313.patch   |  81 +++
 .../libpcap/libpcap/07-CVE-2026-18238.patch   | 219 ++++++++
 .../libpcap/libpcap_1.10.4.bb                 |   7 +
 8 files changed, 1066 insertions(+)
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


