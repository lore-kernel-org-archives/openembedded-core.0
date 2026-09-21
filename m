Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2273AC982FB
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 20:17:33 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5807.1790021841236341143
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 13:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=MekS1BZc;
 spf=pass (domain: est.tech, ip: 52.101.65.52, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYxxCHKwEoHZxGtLYLJBMV2WI2Ixl8bQntZ+NFpIEldCMF7QagG7NnPizVUBL7/Nk7mVMxNmt0d9VyQ4BSLyBdnsdvfhqY6HLG76xA6vYrCgbTu0p8wFigVprn2sUz36olZOYHMa9bKN9GfbCwOKQpvTAqmguUfs+6NhNj0MIdOo6P+lo8lURsUsPG1AJsCQNpfJI4Vim35k7K2suCzBF5ufPX/cd4LKfBv4kq90d3Rdda0yMc2KKq/s+tmukju1QhYtHWUR01WpEwin4T60g3/3V3DL+a8TG+iNs93Wij5RGwRCn9eoeprbIOwHaO52INJANTdKPpwCq0bvdBPxBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKuFTCsiavoYaiTnlJ9lEfo8IEsJwbn+LwcRScD8UyI=;
 b=SyBfXa6g/zdkN2bIgolQBeDtrgFNhIhihjZOce1dlqTptBhRvZ0UHYB3Q8W4RLzmJfj+pslBV739Oa7Vp/owyms1TXdcwTJ26Hb9EvO0l2K+PTAUfCXWDKrSgVKexQU2IKDhliou+lKxWnMN/T2zmW3kChxIcjaanyOJcZo4TeKc7FpavYDF5RsyKHVVCTXJWaYM+qK2XRrjVplx4vbJyozghSBrqHaRMsSx4LYNTTmAWKwTYilLje9blZUVIdDn2Sg+sqmWwmaYgTK8Hte/InEyu6shytv78OeNK4VQPmGyia6MdKHpVaJumvMe/zmum8Fh2GaZcMHCb4mmZcwoHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKuFTCsiavoYaiTnlJ9lEfo8IEsJwbn+LwcRScD8UyI=;
 b=MekS1BZclR5ZUdlWqQtFr0RxLUjyxfhjRdiWznSIn8BsGxoBCsQQkKAb+XptkVwFkrf8rOHHnYmg3EYjq2pUd7T5or9+rL7Qpn7xerQ1kZsRYYHRNRz78Mp87crsDJa3LaEjctB/C9XXXrFRAS+6xePBs2ie/aEDm1LpaWkIijwj7A3M7tycZKXzsDtqGazcBaqtW1akhzlFiF+51k2S7yi44Ex5cDpidE9r42qd44Pqr+MT6IGFJUGwVVXPH8nrntSkX7BXR/2JGQQW5AhwFxFV5pNBP83VXOJB+o5AvQLIaY/+7Vh6EYpVQMumPrfCSAZGG9oPUY6AfivuyLYmzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA3P189MB3314.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 20:17:17 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 20:17:17 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v2 0/7] libpcap: backport seven CVE fixes from 1.10.7
Date: Mon, 21 Sep 2026 22:17:08 +0200
Message-ID: <20260921201715.79085-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
References: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS8PR04CA0174.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::29) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA3P189MB3314:EE_
X-MS-Office365-Filtering-Correlation-Id: 59f0d4df-43d8-4774-f366-08df181d54e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Wn8Ka0gsTb73jvfyS94kJjAcXAnzI1t1wTCi27Xty5gb4sBjAs8GubcIdvMPw8SM8novvoVnJVgMyejzQBRyqDNy29SU89tE9lQW8l6nvRJ9qCrvnhTyE2ieEcFAqZ+2dYNJGAZyUVeDAD5TmN+VRAudQU/qrPri+qo3EcBnX3s8pkAGwXITT/Ez5S0kb/jOVUf+7kinvc4Evp2LHK/gjMpPFwWdfynI3gcMrqaVnml9YLWTi2fh4P9xV/N698T0AbzUiu9F0sdapMLyMBosD6mRC8eYlrGcbDGp+QQGlNx6TNpIFq8eOAK8OAXttpXVJQ8XlmXepLz6LSqqW6cGlwzVF8HRMvKqzi3riWEpxrQJfOz8R8FsVwneaepYym2p4f03eLYgIjr/J1Dv3ijflRsPrueYPEju9pg1m5I1ij8l/QLirFQLrkVgxq+eXYDoypeYUMhXma6uYeLYe6wWLp6vAWCa7RVR8yoQ6sgDzVDk/IG/evaSCcNTsqPPIM9+uTd+sqlh3CsjhnHd4R+7XgdZ0Yjy1nbmkahKoNH1Abo9re+HYqNczQEAhqgJNPPEkMHmRyQU28LvLsYqQ/jfUyXdsoEc6QfvPZ2jTrSt/CvLtqvIfH55jiYcgb6Hc9eWtN86S+UiI/QNfRVXOoalKbP13N2eezxwAOYyExIn3kY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T0ddf88x9o6VL5lmsANQg45Ai/CA4Tw/a+SynOqQ7Cj73avOU+/PMzznsA6r?=
 =?us-ascii?Q?efQOg4YcHvi/+A/595sw2ny0PNX7tJijf7AjdQUu1pBO8S3OxUvCDAyDI5s+?=
 =?us-ascii?Q?NAT73xKT6/2VLY5DwpboqtmWxDpGYuOZW4o8F7gigfobd2lLjgF8Ts+umpwC?=
 =?us-ascii?Q?T5O8xZi4RjKJp9pnOZsmIiiSYElFrvCWaonIS6oS+S7dPf6+/ON8s8c1oZec?=
 =?us-ascii?Q?NoPg7UfGmnDJ728Ad+b9tKvusTV0YqKYebVBeqT00vNcSgmjDzQ6gMTpxHhI?=
 =?us-ascii?Q?l/HNhfa3GGHWs3sGaKBTzmC7aBl7T64lmzx6hhcskLS9oQAJizcxoatXm1bj?=
 =?us-ascii?Q?ueuPCgZF8ypwI16/MD9/2BMLgZyBluf/IJl+bVr1STn2mmPLwSjxoqwTxn+z?=
 =?us-ascii?Q?/WbwjDTjpGMS/R5mBrCcmrrg1a1ma4COSzMTaS4kzjPEEc39O/UnF/F+85gu?=
 =?us-ascii?Q?khROiw4MFa2BXLYQgJI5vRACNmvWLN+YSlR3bBTtk/p527FAXAgAwKSCQAKn?=
 =?us-ascii?Q?u+/yHPOEvGRt0E05QPsHTOqMXLyXMzRkgJ8Z+hNkRyFMox9/1hwGg7/tgSSY?=
 =?us-ascii?Q?shu30gwut9/bwvItHjUGEHUJU4UhkCFsYkhQ2YDUiUCScG66vwTmwupZ930b?=
 =?us-ascii?Q?K8cXGEzrQ3PDWez9A4oCC621xh0zySbwrlNq+6enMOiSK1QyC5inxmyyfhCa?=
 =?us-ascii?Q?Gzg6D/fWAOzMvYJCPQ3rYR7EljYcnjeqme/2qTtKDWiTJ/SbZ42MMvU8rsuU?=
 =?us-ascii?Q?AEH56Zq4yGjRxvCcvk3yEWjggna/aeLOihEL1zCFcWy8tb+953jwcJpEubSh?=
 =?us-ascii?Q?gd3wy42FO2xh2t700MfXpycMZrqO8oh6YvSPvK1o+lYHV5GkYO/bPGCMfrCp?=
 =?us-ascii?Q?ltyZWBtGgL9iuxb8SjwTjSzbo73jRIRw/9ZH3K5MJvvXV3ngb04FNMO+SDO4?=
 =?us-ascii?Q?fXjf3LyGXFdFOw8YGuNozpUkd4ul9JmNCROZCkIQP2GWWTxJIAnumz2v5Pne?=
 =?us-ascii?Q?Al7CdS6Du6UH4fW6O9DiSUA52BY1VQlDpaj1QV6lYsJkMklXzLa7qXEKu0Kn?=
 =?us-ascii?Q?CGolgHR19mXAP4ad2i8UnizJoqqa0kr2X59STVGy5Mwk5VWKPs9J0QFp4azg?=
 =?us-ascii?Q?Bug4B6uEDnqNWGxoI/GGBTPV9VzJDmOIHwAxxx2+Z8dkzInQMPpuAk93vGkb?=
 =?us-ascii?Q?VfNE1H9kFHS+Eclhu35K5/HQmiS3vjhWFW5KD9XFNxpEI6ed5ox3iVPdyeW7?=
 =?us-ascii?Q?a7YFfZaEPWmo7yrVdPl7A7opBbnnAoKcouO9U42qhJen34VGJPHIgXZ6Hejo?=
 =?us-ascii?Q?tAiVVYfN+Z8ylhKLkYgSgtcPcqM9+VwL2gZPfH5XxJpdllJ8iu9zteEQaNBC?=
 =?us-ascii?Q?rZ4VOh3LU/xIIkFvxugqKA8AYjZY+Hua9HJX1anz2PJlURWkFZtFQZcrn1J0?=
 =?us-ascii?Q?edAh45WpWpfwA4TCtNKTlNYOBr48Zpnas2zrP2G3djQfNam+5AqLH5ncd8LC?=
 =?us-ascii?Q?cAK5A5YU07CDZwYGIpmVT5SY8x15F+BtxwiLMoNlQvAKz/b1P7rHTvUxHtJ2?=
 =?us-ascii?Q?rMdPEAl9kVvyOZd6vdr5nOICJhkg/kmFpJKKthQ5nWRaqswVtu4T17xn2L80?=
 =?us-ascii?Q?PowA0HRCbnBa2yc32soPPvgFlUwrqPPWpJBrYaVogHiZOi7ByZcSGZ+flkGY?=
 =?us-ascii?Q?qGw43BS1oar5v7FadszsV3Ouq/Md9MmwvoA1uU12spnROD+H7btj4n/cl5cq?=
 =?us-ascii?Q?LLn9pd2w6g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f0d4df-43d8-4774-f366-08df181d54e9
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 20:17:16.9469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ccMub1DnzbFiS72+dd3wEVKEliJ2SCgD3M4ZPMZfmNmO3hBLVRNUqAWLiz8ZCxhKGbkUIwZgPYuGGK/t183FjAF38Q4XZHo30ES9mwiZMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3314
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 20:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246348

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
other. Where a fix touches the BPF filter interpreter it is adapted to the
1.10.4 pcap_filter*() names (renamed to pcapint_*() after 1.10.4).

Verified by applying all seven patches in order onto a pristine libpcap
1.10.4 tree and building successfully, including with --enable-remote
(rpcapd).

Changes since v1:
 - 0003 (CVE-2026-31911): dropped the inaccurate "Adapted to the 1.10.4"

Jaipaul Cheernam (7):
  libpcap: Fix CVE-2026-0799
  libpcap: Fix CVE-2026-31912
  libpcap: Fix CVE-2026-31911
  libpcap: Fix CVE-2026-6244
  libpcap: Fix CVE-2026-6554
  libpcap: Fix CVE-2026-18313
  libpcap: Fix CVE-2026-18238

 .../libpcap/libpcap/01-CVE-2026-0799.patch    |  67 +++
 .../libpcap/libpcap/02-CVE-2026-31912.patch   | 525 ++++++++++++++++++
 .../libpcap/libpcap/03-CVE-2026-31911.patch   |  45 ++
 .../libpcap/libpcap/04-CVE-2026-6244.patch    |  49 ++
 .../libpcap/libpcap/05-CVE-2026-6554.patch    |  92 +++
 .../libpcap/libpcap/06-CVE-2026-18313.patch   |  84 +++
 .../libpcap/libpcap/07-CVE-2026-18238.patch   | 222 ++++++++
 .../libpcap/libpcap_1.10.4.bb                 |   7 +
 8 files changed, 1091 insertions(+)
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


