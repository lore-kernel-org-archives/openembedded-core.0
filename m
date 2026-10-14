Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD60CC6B2D
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 14:39:06 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15335.1791988742928670165
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 07:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=lAI4s5Bq;
 spf=pass (domain: est.tech, ip: 40.107.162.39, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FzvpI6XnMhQHY5aWyeXBDIZTHXXeHrDSPlx1X7GqQ+TCzAm0/aoDR4syPSctrSpV1bUvZdAmN1qCXYe5cVco8hQolFDL4eCPYspPCd4e+0z2/caWueOZ9IPb2yhI3hbtqTTRrA9f14xRafGNTofewAeB3sOP4zimYhElt1noNX2b1tsx+BX4fYG+ywO4sQr9ISI0CDOGaf3rkE50ealcwdw6YLK0xvtZ3QqGgLud6lG2v9sOif57+evcJ0lRfw6Ya0OVKqQQAtK6uB8OQti9gtyEHH8MxeEKrotyJbH3TMR9ug/zO2GDaxSiog772jlFWbEszKhrzN1QpsHWm0P+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kCglXxzYZhbm+BFsUO2CySrAD3Fl6c650e/pXlDcrg=;
 b=BM1XhBsld59nQfzYjFoCE6Wp0O3q2XP/qO/xLGOHmkL4koJ5Jzi7he9/aKHouDUxHgTDEeUiTir95vw579kk5aKrMXZZkQ7y4esQt2V7pq/SjTiZlhR3gDXBmzzfJLRHEnZfSjM4MkSXvELT6qi9OnxI9/RPptRmB2zjXzZw/C9IWzRD4LqgwTawxzEokmSOJtvFS33yfB8JHB+/nR5L+B3RI3b10uzH94arU+1Z851snC3MxRloP3xNoZdqLYPwDc2M67eeZn3Q0u5CuixdBLuzd+kmdJB3iUPCyKGLkG2s1xRckJo/Zv4ZkPpUfWLAydfQlui9z1tBCRl6yIqXQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kCglXxzYZhbm+BFsUO2CySrAD3Fl6c650e/pXlDcrg=;
 b=lAI4s5BqJ3wDyVcoScSC08w7D/Npi1d3csxWsrp02hQURHqTQCAbHBfSziLHLDSCW/hbyyKtVFk2Sg9MX5kBqkLnShJdGL9dEE4pPZ+tsTXUPLY+twu+KpmSM4jQNumTvP5k/JMEyoobDWdSqz6pFYcRk2DwKLM7y/ggY9pzknlC02YW4HtogWYAWk8Q8GpVB3wdcC0ci97FEO9bUnEPQGKFE4MoUhXWPwNB001ONbMO3uagIycAP9P0McKnstWkYvZi00UJr2Fkh19RO5Gt5Dbg24qibk+9nl5uvDgaJnDYdvhQl8N5c1cXk2OES0Yt4MkLJyKce9aEJfTIqB+X6g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by BESP189MB036075.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:138::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 14:38:58 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 14:38:58 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v3 0/7] libpcap: backport seven CVE fixes from 1.10.7
Date: Wed, 14 Oct 2026 16:38:49 +0200
Message-ID: <20261014143856.74426-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P191CA0019.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::33) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|BESP189MB036075:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c2cdf0f-2bc7-40b9-3c12-08df2a00e154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|18002099003|10067099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	IMqo1OEBeJhciTHBjzvw9veJm3I60znQm+kGu0RACDOPlOmdVl5pvb4ZI4dlIf0ckb8ed1aKYso6dBUO2FRyst0iNEgBlNTfHIQVRjnZgKvU9KsnCcwImO50LEXjV+n/e6BSJ0QWBK8tUxpXN+9vYyLqFumlbYFOTuYlcVrvBsyCNJorL8ikiC07X3Jd5AtfiazGfCtdSJfZi/NG19onnlLTugYyAUn95unx9TihFn/uQojlxrbd6n+4dARJcmyDRTl8ftKY9Mz1QYKH73oudE5dChpjmvSIwOM27aSSLtEOQbmQyE1LdKXWoRD+brFxOboUwomxeIpX4M0jW51gQoUsE29f2BWVqR+MK/qgPgsUejDfxa0NE1owkwX8flIsixNE5hPdH1M7w4epPqibhY7Ajia06A87riPOthSEd9NS/4fOSwaluue6fuGs5iXPE5yIK/G3kYIAnJVHgjRqqxhSIyPIe0eHeHMjoUe/w0Yysv3y1H9smiAkXeANmT2l+qCWBjcytZDcJIub5wu34N9PNSF47XJXDFaMsLfxZ+lQFPt/LQFnJlWjfumP9s/0Q0PjgUANVlX+D+64M3ojq3rzyC2k3dwue0EEg0o1O6qjztdoGqTsEavQ0aL67tpNvPWTdOjq/F1XcAA8U5RCy7JSytgWQcjTZRTd9Kq0ntg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(10067099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4UL9QgIKRNenaexr3mLWZLWzb0h0QGsMfSg5Guc7GNyYgWgaizf1JuXVKTXC?=
 =?us-ascii?Q?DYJyDwOKaAKKO9lU0a/E5CYZKEOk+wYPCSUHUn3fKAbvzjPXTBzmemTWuQJI?=
 =?us-ascii?Q?J+Qc7PYVtqOYMLEhkePRUry74xpHKR7PPrnZzdIqOY2fHHiP5ddsseFwDreP?=
 =?us-ascii?Q?BE6HsmmWgWxac/wKhBEJXcmKX6iJ1N+547W3HnQBfXN1WZja3/fHk8d5pUC3?=
 =?us-ascii?Q?EWnki+e6SnBOAAiR2KTLGPMl9V7jKpsSq+LFeJS3O3mULlRxiZUZv/9L67wA?=
 =?us-ascii?Q?bSHku3TVkShch+53F9oDVBUH5ydtgmb1rWRftAM46AclbGyQ4vlLBlrccEZC?=
 =?us-ascii?Q?vCEqjCM8lv/7nPy+l8BiHys0luKkNqrf8QrL5e4GQfEXZHzkS+uLg95Ox8dD?=
 =?us-ascii?Q?7RD5exCYrcjdfla1+nFh+6NsU2BYz5LJUN+RUf361wB5BXehXvi41u1VfsnV?=
 =?us-ascii?Q?tMoZCPDRphjWv+jmEJLpAf+u6o9hEgCjF7E7/uDcbC3MT6iwY532JogPCGyy?=
 =?us-ascii?Q?s15RUDdq/zMyVQQfrMvvEQdGHtyWA7cUMvMV11oP4b0gxv+Y9EQ1zP7nSs4Z?=
 =?us-ascii?Q?h2wAisBZJWHZcM1xUCt3YAlhTEx+jA16uVQw3y+UaSc5Dkoio90uO8UtntG6?=
 =?us-ascii?Q?/ROQ2tuQG8DPdcYJpMxjaD4I4u2YcHG7Muw8bqTI8EPtnFOQbRAjP8vTUMRU?=
 =?us-ascii?Q?s0RY9u+wHArncXCI78x8I30UwD+ObLiA3fZ8cSZGzy0606SX32N/k4EZngQe?=
 =?us-ascii?Q?RJmO0n8GU8ydtnE/WH0FpAhwMUE0j+A4AxNs4hBMuUrdWBouH8wZ1v+FAc4d?=
 =?us-ascii?Q?d4SM5k8S8w6giB/o/HZupn1OL5nNXOvjsXx0pPlGZk6L6RXElH0w0Fkky02B?=
 =?us-ascii?Q?WpVQBtJVWAvZcbDi184lRgaqoAvsBxllPcAhb5pZH/ekzYafFB/IExC5F8YM?=
 =?us-ascii?Q?ZWErW3kBmkO7BsxQQGjCMxQ+hHmi9JAUR6IXDDFJtb5B/hFdmv71LxQKT/Nn?=
 =?us-ascii?Q?RTMg/YkirItGdJzZYkTnhH9VsyhLqsb3+GEY8rJknRLMSdHSY2B7Bu0ZHrpv?=
 =?us-ascii?Q?CBZeshFl59Z/ZF6EfaHrvOU9iYktU+WzmdYHKITP7qhHwCXB6zLSGhebWhiA?=
 =?us-ascii?Q?KOjbwJDPay8L7025C+cgXlruxkQPa4pEAXQYMkVSQukWAmZhj83n5ImYdGiO?=
 =?us-ascii?Q?BPxBx8rEY6iZbFOsHCq6c2aSY3VwDkPwbkSFdnaC1g5BgM5BaXPheyh8CRtq?=
 =?us-ascii?Q?rxcnTxZH5V2nb4WrA9FGk26P7J+1bDpWqPhlL1maUPiTPY3tBhIzZyLpNBlf?=
 =?us-ascii?Q?nKuur6usT708qVh85x91OGeJNQKz6kQUK1sY5pZoWTH8AgnyyriL+ZxQpzPE?=
 =?us-ascii?Q?eYafXLG3FkKUBHfcuL3Hc68NcUAhFUgv9WzpBcamhAlMjofa4c0FNswALJkX?=
 =?us-ascii?Q?UK6EU5Hpiw8poTpldesbXZqBzFH35Mf/eqYCS/yj2s1EFejCnjrih+slHWrR?=
 =?us-ascii?Q?66Xm3XFiVtscXltrsrrqGLq9alQ3oUuyeLo65mUCHuR4pwQgwVCdoDSMkyZ9?=
 =?us-ascii?Q?n+a6MUrMym9eLJnxO2OXa8lkucWNR+HisNh8SsZWjIspS6ITvhQbIqTdRkOQ?=
 =?us-ascii?Q?KMWBpEj2gdh6ttHTj0dZYQ28AfD6Ny1g+7QUIMnLzFj3rGcornqAji5pXeab?=
 =?us-ascii?Q?YkDQsj9o7PjJQq4QSq1q6GJSf50gWL77qeRkdatxReJFjRhCmkUGhoU8b2+2?=
 =?us-ascii?Q?YV8rtQzTHw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c2cdf0f-2bc7-40b9-3c12-08df2a00e154
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 14:38:58.3761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x90se1u9LllmGv58NGKzqbRWhR8azhiiyiExFjmuFimv/3NMNCZSU8VZmL2j3ideUMT0+C7RYZshZ3WQTZl6vV2zjX0xI1+8RU3TpuOENfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB036075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 14:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247766

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
1.10.4 pcap_filter*() names (renamed to pcapint_*() after 1.10.4). For
CVE-2026-31912 the upstream pcap-haiku.c hunk is applied to pcap-haiku.cpp
instead, as the Haiku module was rewritten from C++ to C after 1.10.4.

Verified by applying all seven patches in order onto a pristine libpcap
1.10.4 tree and building successfully, including with --enable-remote
(rpcapd).

Changes in v3:
 - CVE-2026-31912: apply the dropped pcap-haiku.c change to pcap-haiku.cpp
   (1.10.4's Haiku module predates the C++ -> C rewrite and still calls the
   filter) and restore the pcap_offline_filter.3pcap man-page hunk that was
   dropped by mistake.
 - Trimmed the backport notes to the adaptations actually made.

Changes in v2:
 - Dropped the downstream CHANGES/changelog additions.

Jaipaul Cheernam (7):
  libpcap: Fix CVE-2026-0799
  libpcap: Fix CVE-2026-31912
  libpcap: Fix CVE-2026-31911
  libpcap: Fix CVE-2026-6244
  libpcap: Fix CVE-2026-6554
  libpcap: Fix CVE-2026-18313
  libpcap: Fix CVE-2026-18238

 .../libpcap/libpcap/01-CVE-2026-0799.patch    |  67 ++
 .../libpcap/libpcap/02-CVE-2026-31912.patch   | 591 ++++++++++++++++++
 .../libpcap/libpcap/03-CVE-2026-31911.patch   |  47 ++
 .../libpcap/libpcap/04-CVE-2026-6244.patch    |  49 ++
 .../libpcap/libpcap/05-CVE-2026-6554.patch    |  92 +++
 .../libpcap/libpcap/06-CVE-2026-18313.patch   |  84 +++
 .../libpcap/libpcap/07-CVE-2026-18238.patch   | 222 +++++++
 .../libpcap/libpcap_1.10.4.bb                 |   7 +
 8 files changed, 1159 insertions(+)
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


