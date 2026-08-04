Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F00C55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:23:14 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14920.1785846187906724768
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=dbtY6zsK;
 spf=pass (domain: est.tech, ip: 40.107.162.22, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZSKvAV/bNjzcJS2H3MHUsk9uqWU5ZVaHwucj+wphd1xEjK6sNgd1UaOmg9hM2n3bnjPQWs1Lz9DxnxxWTcMbTzB0uqe8HXWD5fsNyLdlWjJH21e40kU9Juy45h8cCmVCDvU/7ywnZzdBV42KGZJm2OMkdnPmIVNk3MVwTzncgvjl7VjmyXBIW3edGgBXrAGiNl8Igz873jh8G4rBnCGBIBMWXMD+9OCQWPNIPVxLVfJyu5Xpf0K1NheQ8yGBOkW2gdpIZWG0mh5Qie7kksn0+H7t0VaYu3vpLsLv+kJBbEcJvWamE0vavoWahfkRx5EyZZAdh5nk0LFpUbLHuTTchA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5BNuNe8j/iotem5aaaQKPb8Lx9lCurZ+ycyWRr43yg=;
 b=ZuITiPkuhtBUPu4Jp7BJQ3kKM80cMAcGhVuT7I8gEq81csah4tU7uD5vXucz5/N7NjLxkVQWSMLp3kxSD/LhdnZUHHVx4LCAv/cz9UBePxfgh5J2Qsuk7HfnSICKk0S1Uv8USxpL8BI+aQdQIh6q1ILEA36vgpyQ1SMCzstCNk9F1Tw02ECBczea5YJVmv1haGj2jpADhy9+SofEywQsQVXn/W5RhOv6KoUy4WWjFH0VunLr8J2Hqbm42Qtnlurm3frhfMfjZad/schQQBkK3jWTeEtEyFXlWnzjrNn429AlazlGJC2xXHRsPlqgDZEdpZgXCTu5wIV87P/z56YCFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5BNuNe8j/iotem5aaaQKPb8Lx9lCurZ+ycyWRr43yg=;
 b=dbtY6zsKk0ApVwWXIe3MymHKB9FnHE8UpvztZpIf0PpsoGkyiquhBnU8jkbReGrEfIjCVu/GKWLbO4cGdTQ0fOUQ0vKJkMgzoxPm0XFiN9WzIBH+CPTRZvK8fn1baYJv3nDtQxXqcTAGlRvgOImULl1z8VzfFeqSi3xertE1BNanghz+op8NRNzz7g+mxY8WzZZwcbmbnDmNVkPy3Ko7B/8UsuUx73N2ReFQIcoaWrrbJoDLeF+4GCNN6XZPYSiaDmTvRHz9yEgdjuS84dONH8LDdX4mEHSp0sVH1bYngfeng6L+4muDzvYDa2txJLdBNVnyNzrWb0CRdREJ0hgV+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB8P189MB0779.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:128::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 12:23:02 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 12:23:02 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH 0/3] libssh2: fix CVE-2026-66033, CVE-2026-66034, CVE-2026-66035
Date: Tue,  4 Aug 2026 14:22:52 +0200
Message-ID: <20260804122255.3053-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0263.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::28) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB8P189MB0779:EE_
X-MS-Office365-Filtering-Correlation-Id: 9362341a-0d22-43b3-c4cd-08def2232109
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	EKYC52gTv9Hmymjtp1Qf1V4va6Ys50x9dx0fbirwMmnVmRMGTwHU11ci2sOjkJb9UuF/Rn4FQU2wRXwgGn4zCmenbuHXmzMsvU6AVMPq728LoB3dgTPLKVSgH5rezStbfSt1vwNF6o0xjJcvUDopSPor8Z5Hpf2fFpckOzdEb6zyzSGRscVsGSdm8hE2Hd2Hw4/LeL/JEzuJl67unJLLT6S+5AtXj0BQvJdu4Q5uKSjEd0go3ivT9ipHjhx8c2ixkCedU6VckF+4mopWkfdQPmVaStCot3xRlOvHJrp9w9x69NxWJIS/XLEqoQ6tvQExsmIX5sHAYsxzdN7z07dOCe86TGcDTDEk9U5jGv0ulv15KKmmp9PB9LGK2S9YApYS/1x0KdieHPEeTHKgIOQ0sG8BKriIBD7WUcmg+xBr/GrFJ6NLaKY3feyUr86a4Gf+NR8x19VxRXgocIPT8adOhThcU3BVsvDv8EGKcpYtJStkpYb35vppvC7l8hwYn/nWjxmGjwEPFXGf18ij1yn3dblMQgsHhZKvT54fG3Bw6CzUZpnmBBE6fVXwt9tMx2DrbSxUTKX559cIyhLt3H7ldTUMu5/WWi2RbXYru283gW4M1Y6SgYAUhKCJDMSqtJUVkXHifOnlGXXzsQE5VCDit0QVXhL1yEyxMyJCeq9yf+4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2CnheEVVB6L2mnHj8WiFe+fBvbr2YHNL7RSAfQHrZYdlGGZvdASnBMdWEKya?=
 =?us-ascii?Q?QT297TpYz71inUvJ31sAyxhcwGFm3nStgXqJPdgHBvZuY2z3qSufQRkjHk+E?=
 =?us-ascii?Q?gePodJGu5w8syO/zS1eVutuCmG8ISc3Yl7YaKZCd00xd2uRNz46uhJTZVsaf?=
 =?us-ascii?Q?hc1+m8bOOB5/hcozsC+GYWYjCwwPMdoTXPpiJKJrNYeGG9ViBd7KVP2qJOsb?=
 =?us-ascii?Q?5nf0he8J129ikr+PoRRyFS2fYtB8DdXOIwZwl7O9VgP3Mkss9NhP7uPLVmns?=
 =?us-ascii?Q?sHSVuj2yZXTwybfObK+NOD5KO5PE246sGIUnFwa394PFAuMNSmNFCW3ALQrL?=
 =?us-ascii?Q?9IogZB6eJNP2jvlf2wWoTrADKCkxxh7e/yrkfIPv6Q6TlKP26Xi269tbr3jy?=
 =?us-ascii?Q?VHvBOKCl/3yOO7NayS+G6rn4qX9afRb8DVb1gAW77LPggtJPltcLjL00VU/h?=
 =?us-ascii?Q?DcqCvzHS6u689bhPDLh5PhYc7nj1nAZ1nqjDwEqnFSsHEMlE1Jv2rZFMNsvL?=
 =?us-ascii?Q?XpKfLOADZZtg6ry6tXufhLZB9aDuITCnkl6ywOPKsZGEDhAPX/VoR4jtL30H?=
 =?us-ascii?Q?IU5KC1jnHQKGZ98EoeRn9ME84bF1FYdf/3CQwHsedXkjKL2OSCZ6+26HxGIm?=
 =?us-ascii?Q?qGRz48xEhzMZ8EkM2odFUa2Sdia9kT6GdeDrCzK6/Xt5pRgzK5lcshafXft4?=
 =?us-ascii?Q?OI1qOQSvNVoEP6s4+kd1z9IPbtHPUcOKJqYnm68ByfbPYdxZkIyhBaTXqQn7?=
 =?us-ascii?Q?jj2GN/NeMYKIxPoUtIrcsMtIq59jJqAEy2566UDsVj4TvIbzs/SDPpfRC7dz?=
 =?us-ascii?Q?wVF4YdRJurWvYGyWrSP8Jc8OyxRCqGwOoAyYvzzyPD4X2QO+CwJQyEEY3tGT?=
 =?us-ascii?Q?AWOg/DxClbFMQY+Eg3DEJyobk9r6qbopn05AGHCTXPYUNNMhSf1MOVZfqo+k?=
 =?us-ascii?Q?D9/GZ1UMG1KZLx3x1ExqRsSPRePGD1ImVrnJGxHQfyFJy6ybljQy5ugNo/wB?=
 =?us-ascii?Q?WidvXkrFdh9QtGBA8nJtt1wDXL3+rIkK1MMHWwF/twT/LDSxQXusByrrVeQs?=
 =?us-ascii?Q?Fc+R7ueoHCoupaemG4fAnqv9e2kcbvgW3K7Hgwe/uiuOyj0oQKm0Tof1Zt7W?=
 =?us-ascii?Q?RO3eTxCLWdBk7PHLUyDosWRugVeLq1oZTlOefDFveklzusMA+RgK2MDVa5Xz?=
 =?us-ascii?Q?RUBCp2zH/2iU4h7sjKq+DPBOa3nFBLeW5B4J0yZbi9DJa8OWs1bjiTvK/T+2?=
 =?us-ascii?Q?8prUM7KRjcIQhHBk/fYX7V/xHc0qLpDMEqZkB1mnjMSEXlKMPM3xsrgzc5ls?=
 =?us-ascii?Q?IGvt8ZuLl2s30bDr4dO5Ao0TJ90DGuQDL5hGq1hVtas2FLQ1ySKi6QwHa6fr?=
 =?us-ascii?Q?nNbH5z9Hl4UJP1PT0XJUSK+06QdiIYYR6SJSG9oWf9KiPxk3zp0XWUlPCV0d?=
 =?us-ascii?Q?jSwTyXw8H2ImlE0nRa9d+akW80B1GklqQ1vqgYg3QDp0EkH6ZwSRN/5hMpK3?=
 =?us-ascii?Q?X0GONwNJQveyvdfyTf4EpV9ElfY1DbqEfQYv7iJ55kxCVaDHWXybHgvPmc1V?=
 =?us-ascii?Q?eeB7WBD7lfeDNg1M/mp2lGTSVSykaDMyqzX1E4fv+Xn8F05B6H5UIy3qO5YB?=
 =?us-ascii?Q?oyT3DpNqB4V/pi/7LzNLs+Dw9rQQmUEPFjV2yVFfbDGC1KplCwYmft7kF+VA?=
 =?us-ascii?Q?+RPVFFKnPa9/+rdJlFHeuxPibzpRW/mYeEFIor1MGeLMSpx9ka2Nil+UQtir?=
 =?us-ascii?Q?F2RUpzzo+udjn9KWix/7dWQbXQBS1/4=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9362341a-0d22-43b3-c4cd-08def2232109
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 12:23:02.7276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ngFMTRdP9zQI1Pe2ACEvK5xEMANlgag9wRN/xSZ4HZABiGAdlRqnjDlb12Nohnj3CyYGzC3rctR97lRulr4zkyHHPz8pbpD5yUvfhEzfaNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0779
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:23:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242735

Fix three CVEs in libssh2 1.11.1 by backporting upstream fixes:

- CVE-2026-66033: potential OOB read/write with AES-GCM in ssh2_cipher_cryp=
t()
- CVE-2026-66034: potential OOB read in libssh2_publickey_list_fetch()
- CVE-2026-66035: potential heap overflow on ETM decrypt

Backport adaptations:
- CVE-2026-66034: upstream uses ssh2_err() which is not available in
  1.11.1, replaced with _libssh2_error().
- CVE-2026-66035: upstream uses SSH2_SAFEFREE() (not in 1.11.1),
  replaced with LIBSSH2_FREE() + NULL reset. Also upstream renames
  decrypt() to transport_decrypt(), retained original name.

libssh2 ptest results (qemux86-64):
  before: PASSED: 1 FAILED: 0 SKIPPED: 0
  after:  PASSED: 1 FAILED: 0 SKIPPED: 0

Jaipaul Cheernam (3):
  libssh2: fix CVE-2026-66033
  libssh2: fix CVE-2026-66034
  libssh2: fix CVE-2026-66035

 .../libssh2/libssh2/CVE-2026-66033.patch      | 45 ++++++++++++++
 .../libssh2/libssh2/CVE-2026-66034.patch      | 40 ++++++++++++
 .../libssh2/libssh2/CVE-2026-66035.patch      | 62 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  3 +
 4 files changed, 150 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66033.pat=
ch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66034.pat=
ch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66035.pat=
ch


