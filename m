Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED0ACCA48B
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 09:20:45 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17764.1792142435365498198
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 02:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=LCqDfSrz;
 spf=pass (domain: est.tech, ip: 40.107.130.57, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nEEJEU+KJ1a14Mt75yQUb4OOwL5ZKqiXCbJ9rbWS49ob33PpMmtjL6UeEXcvROHhvBUNhIHzgDB30ZvTQ4go2Um/YxYXtdVxjuHGgx+wEJx/54R7kOBCUL1b2YeWaL6Z1fYwrRSNRIgvAoS+bIP8pS5vrPrgezVJXbpnBXnFtVwxZeMOCZ3dXzkZLKf47pQViW4SV9Jkpg65TahJ/8NroHQjwL8mUaAs4AgUZSSsJAsnDT1jslhlaXxC+Pv0Yob+AmRfhAvzNf23MM2A9uw5pCysDitXEB62knpgosbI9NxNvRnumo+GwACbY3OTDk3dhB9cxbvRPQrzvpw0HAxk/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iymbEqnyqOOY7vsvrBP6tIP0Zbx0QIHO+kiDQdpOZAw=;
 b=ln7iLBvTrtCBTmRSBbIs1UgFGJOzMMXFSJZbEShMyqYGwLvi419a7bPrwgkrFVlLTENjSBcLpapc1+Ku63st3yx09iPW302KHXJFiNaMdlu3XDWnixotTvwxJ0ntS79NtIAa72Rr3E+hyj+n33cWYULis3MZH6Bf+qRA32LESsRscOJhHQ+YeR2cW9isxBoP0SNeb2yJdgV+m0L4bhojue+a0dQr6+dxG5VTtQHL5OdDxlv2RA/HGXGsUhZR+gNKuRMGkdcUHAM8Z9HpLz0LLbdbV6a+yJOVp2H3z7M17E3j84VSDbSZ/2UhGM6Nz3nDWizlanxifR2/WTZGW6eMnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iymbEqnyqOOY7vsvrBP6tIP0Zbx0QIHO+kiDQdpOZAw=;
 b=LCqDfSrz36OPwattKzHFoUBM356k++kbvgig7qu3BKKl9HhKUTwwl/wCFQs3IWHvGQ7W7SaF4F7fHX8G27yqTbpg75UTythemDsT/1I2nyd+QKRbA3IVe0R/fGbemcgEwlH+X7BhCaJ/we12VlPVXFTIpUam0ZoIZJIyrdyhrdVoZXIBS6TFo8nd/Cu7NhvXeTjuLGVH8frMUwj62i0qnWaOZmuzAn9UKWEQagRTt9zzas1gorxJol8mybB7Qzl/F3nk5sri6ppmjZHcPZyzeCQCjQWZLOoHkfZieV6ajP7+G3fDHtk/P8lgo46xip6fJBuO1wuturjiGY7XkAlYdA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from VI0P189MB3116.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2cd::21)
 by AS8P189MB2022.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:509::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 09:20:30 +0000
Received: from VI0P189MB3116.EURP189.PROD.OUTLOOK.COM
 ([fe80::2d33:bb97:b0f8:8167]) by VI0P189MB3116.EURP189.PROD.OUTLOOK.COM
 ([fe80::2d33:bb97:b0f8:8167%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 09:20:30 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] sysklogd: upgrade 2.7.2 -> 2.8.0
Date: Fri, 16 Oct 2026 11:20:25 +0200
Message-ID: <20261016092025.19560-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261016092025.19560-1-jaipaul.cheernam@est.tech>
References: <20261016092025.19560-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0155.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::10) To VI0P189MB3116.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:800:2cd::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0P189MB3116:EE_|AS8P189MB2022:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e8d0714-dc4f-4d24-b2fb-08df2b66b92d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|18002099003|22082099003|10067099003|3023799007|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	+TFe4qFLIXchmxPlvQbLPUj3I5Vp5qVrvI6hSXLnhNDO4nKUZIVOFhtrYncmXuNEPf+9qZ08c1b/8yjXQuFk60ufm8Z2hWp64tOZuAYmnZiJ7H8sDcr/936tMnde8uPiCm80OfEhfvoliIMl+1WcWEah/lX6Keuv7uk7COVTt0RMB9IQBZs41WjOWTFNJml8YoaDdFM3JFRLayBoNw0FeBVhvF4nx1MH8gpxNCK2hRdLQWfr3TLWH8bykcXP8r0dyYumue+riNTvhSz3+GLVYNSU2bjiC2MRzK+ssW1kgPCrzWioE24JjoBXo4jZTHb6EfP/2MFYHUY9dFIABU5dOVcKSxkK45QH34f37oonq0nx1lLIZ3jcMvHwmKHU8SEXYYjyA5yi7fCFqizD9egYJqlbfRnk64AnxZWF7fmmvfH6pSecESK95bZHTDYb8kmYyQLet1vo7lb/mAntBMcTUYklB0FwBGqDIpLZJG/RzotZ+5lEqZTkJ/N9uQeJ0LxfOdo5SgGmoK8x8zPnoquafFRve76d8MvQJRSpROeFib63uJY8ilYXRwxfLFGoqwPWBNomp/0nCkanhJWZ4TL6KhK4lHEtGY3Jw7aHGZUQA1Xc+ToeP4Ut/jGloBzy3mObmhiSQtF9LURnbHw78eOksX2dehNf9LPL8ZZClckj3dg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P189MB3116.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(3023799007)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rvOiwGCsIUit59HI0Qz/JVvX5KeOdh1qDZ516hZjyAMBWe8zS+thxOUJevy2?=
 =?us-ascii?Q?5lmdDSdcmbwmPQj0HCxlsak4CV57siGATFiE60RFSOIoEaaCqgQFzqUd7Qav?=
 =?us-ascii?Q?e5Ixjc47GcDo81o4PDNg07yfhIcFjYqzxZHDdfL2gOrxrOhHNGG1mZDGyu2K?=
 =?us-ascii?Q?ePrV0b+KZyAsGroH/ZMhePTpXzoHye+xl5wV8oywQJZwDx7G+OXmHjRyUsd+?=
 =?us-ascii?Q?rLQHgOdcWwbJM/x5FJrG0CHMG+iXsiGzmNyPorl3wos2/ntOxU9uXuWBDr7P?=
 =?us-ascii?Q?2y/PBKm57KQj76sUjQZFd8Dndv3Hbkh7DrMT26KxAkxk6tHtD693ik05ufC9?=
 =?us-ascii?Q?IwDsOgl1qVooXBLaDy9TONTaH3VD3/f3jdVBInV9DCoNNQU/GiBQ33AtE4Eo?=
 =?us-ascii?Q?xK8cYX/J/YGniXNkW00epm1KZB8AjKLK4yuLz/QjJD3kl3NPJpxstWD4K5+Z?=
 =?us-ascii?Q?3ynuQb/TQshFctDIltm9CddZKD6Yic0DEiQtBbO2yMUdLKwmr/1zdHAvF7bd?=
 =?us-ascii?Q?219P0q+xpyyTWmZaH3dP3MlK6fvI/1NVGV483uE16VV8KR+X7IuehZARvpyK?=
 =?us-ascii?Q?XLzCoQjD1AN8i+RDWMLALbQY23+Zu2jgID/OpL8QYtVr79Dr73l/orPA29yF?=
 =?us-ascii?Q?gryyknoCF+pZuRDM4E7qEFT2PWVdu2LOwQIYWFI7hJgHoFAgRaAg3ElNAKrd?=
 =?us-ascii?Q?V+odV42ymOMKYQZdmbC7oXrm56FQlhdte5kUmGaE0mrO+x2xSYFUJQV/1qGJ?=
 =?us-ascii?Q?h4nzhznh/4osXN3cGg/4EtyCpEipICw8QeNJ8kPmzdHnugWskMZhlDPPagUa?=
 =?us-ascii?Q?Mp2cZznn8UhqXSgev6L1PDp2/7BSwwMU+zng2KQVs49raWlq4nIj9/GC/zhc?=
 =?us-ascii?Q?fAycI1E9+Eqa18XJSumERtX0MmBwtgVgvOGJvpG5aSiv0v861qTaYVkiqkBu?=
 =?us-ascii?Q?Q/UyoC2VvmPHFi4SSMr4eE3Y05CDGOJOUkCq3d6N3x+7+PMw2RhUyrzAxASj?=
 =?us-ascii?Q?uExyL6BxX46EGCe8R9TjWxHLtXjM6KIm3qiaxYBknMIGfY6rTVco5LiOivZ3?=
 =?us-ascii?Q?5H8WWabzN3wBY5u+MfvpOIACCjhGYWX/jHlBSeQipPpsrBm2DU/mzTk098Q2?=
 =?us-ascii?Q?Btp9D9PG5xtcvqPWVcKOa5zBkhUEzbWwvemNF9h1V+IjCxqeOGDEuEnZ4pup?=
 =?us-ascii?Q?3PLv91GJUzevUx4iZQf+UGlGV47D5Z2NLYXXqfBczbHU1O3MHOJtxIpQEBpN?=
 =?us-ascii?Q?0llFopFbyLdA8CLW3SDTUj1T90wLmRqJv505RIuz4id7rcNpcCy3S3IsPlWm?=
 =?us-ascii?Q?JNx8QqiSZZQ9v75l/Cjn1L2wKSbUMbfRz9Cq3KxiGU/YP9WyuQv/t/nBp1+q?=
 =?us-ascii?Q?25jnsQpj51R7yaE4jwmQRa6x3a+UjmmjVJt80RFsI8bFpebfAraP2hTd3JlX?=
 =?us-ascii?Q?tUMRa1IVQfCgFLq0+UvKu9Lpun4CiVdwF7a5MZ9Gaw2qPVM1H2sLaETFaJ/J?=
 =?us-ascii?Q?SKC+02rZYPF9vgg3U+7qe107DCxaEYiYF87rJzDB2DpF2lwew6+nJP8sgf0F?=
 =?us-ascii?Q?yXRuoHSulhMCIGt/rK1NE9PpJmV5d8Ko7ETLAy9nR7eon9DMK/qo6Z4/hOxZ?=
 =?us-ascii?Q?JQ2A0ZVI5le2o6oAp5q5fMVyEwg+1XEfoag9BuJh5mij/4idmnjiwT4tOEC/?=
 =?us-ascii?Q?5JeYdsAHdvyxBZApU/0PNXIqP3h37D/9tno3mkmw7Ay9LFudE60JeO5OjGrb?=
 =?us-ascii?Q?mMiihiQmEZ9Imct3iYgKGDkj3CrPmDA=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8d0714-dc4f-4d24-b2fb-08df2b66b92d
X-MS-Exchange-CrossTenant-AuthSource: VI0P189MB3116.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 09:20:30.5058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SMeNbPELNPiu0SkGYrSf0dJuzcDZJChNKlHDRu1UmcIy9RAv5tZyazeYRftqpa6cu8wcbZpf5cROzmtR9DbxnQkHd/ygjwdItqZ2bkEUEvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 09:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248007

[v2.8.0][] - 2026-10-15
-----------------------

### Changes
- Add `pri` action option, e.g. `*.* /var/log/messages ;pri`, to always pri=
nt
  the message priority in the header, in the format in use (RFC3164 or
  RFC5424).  By Gavin D. Howard.  The NetBSD-style `+` destination prefix i=
s
  an equivalent alternative, e.g. `*.* +/var/log/messages`, and combines wi=
th
  the `-` no-sync prefix as `+-`
- Add `hostname=3DNAME` action option to replace the hostname in messages
  logged by that action, e.g. to forward under a fixed name from a system
  whose hostname changes
- Add `sd=3D[SD-ELEMENT]` action option to append a structured data element
  to every message logged by that action.  RFC5424 format only
- `logger` now parses a leading `<LEVEL>` (PRI) in input messages, e.g. for
  systemd-style `daemon --foreground 2>&1 | logger` redirection
- Add security policy for reporting vulnerabilities

### Fixes
- Fix #105: UTF-8 handling with the `-8` flag.  Multi-byte sequences, e.g.,
  em-dash, were corrupted by byte-by-byte sanitization; complete valid UTF-=
8
  sequences are now preserved, including the RFC 5424 BOM
- Unescape Linux `/dev/kmsg` C-style `\xHH` encoding before sanitization, s=
o
  UTF-8 in kernel messages is preserved with the `-8` flag
- Fix #104: RFC 3164 tag parsing of parenthesized tags.  Surrounding parens=
 are
  stripped from complete tags, `(polkit-agent):` becomes `polkit-agent`, wh=
ile
  partial tags like `app(version):` are preserved
- `logger`: fix evaluation order violation, found by Coverity Scan

[UNRELEASED]: https://github.com/troglobit/sysklogd/compare/v2.8.0...HEAD
[v2.8.0]:     https://github.com/troglobit/sysklogd/compare/v2.7.2...v2.8.0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../sysklogd/{sysklogd_2.7.2.bb =3D> sysklogd_2.8.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.7.2.bb =3D> sysklogd_2.8=
.0.bb} (91%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb b/meta/recipe=
s-extended/sysklogd/sysklogd_2.8.0.bb
similarity index 91%
rename from meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.8.0.bb
index c436153d1bf..79e26126533 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.8.0.bb
@@ -10,11 +10,11 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5b4be4b25493=
38526758ef479c040943 \
=20
 inherit update-rc.d update-alternatives systemd autotools
=20
-SRC_URI =3D "git://github.com/troglobit/sysklogd.git;branch=3Dmaster;proto=
col=3Dhttps;tag=3Dv${PV} \
+SRC_URI =3D "git://github.com/troglobit/sysklogd.git;branch=3Dv2.x;protoco=
l=3Dhttps;tag=3Dv${PV} \
            file://sysklogd \
            "
=20
-SRCREV =3D "5fb314cb9060afa3bd4eed2f0be3200f02f729e9"
+SRCREV =3D "e2c0c1d9585e88b1a85e3634c4dc230517f68f0e"
=20
 EXTRA_OECONF =3D "--with-systemd=3D${systemd_system_unitdir} --without-log=
ger"
=20

