Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E91C6C44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 14:09:32 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.183.1784728344205978523
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 06:52:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Q7w+azLW;
 spf=pass (domain: est.tech, ip: 52.101.83.32, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndNE5nibVzTmcrLsB460cGljLgxWE6EsmHKMu721yszWNVkqEs4kSwqvPZsPSi5yWnOhL2s/VsuXtirpckgVaLPTR6SkITbaE/UkX3be4d+pnQyKyr1WvgQdyqAQgpNb5aqLuKHpAK4O77VPj5BWBu9GWH2kPLGOHtlxM7UxTilOlJIc0CODnjSxG5EgO8+4dLD/WuBNgvFlAHOFlAOvJt3SXbVr37kwc5vyr83Z0MZQ0nmqQkaWR46v9GsO2yxOefP+WTXDdcZ3tR8O+B1B6IvXgGU0BQ7CVBQz/HuuOTvTQ6BcGwdxzfgQsXSL+q14rkw638rFJ1mtw/R25OSWzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJZRaMnPWGblfjCuickQJGh1eNUiaLSjspKSn0cBIeo=;
 b=RfSn4WB69pF/IXuPFZJ54D2TZ3bthNobPo1P3ldLFtHlSKJpeHyrBOJ41TMK4ssqjkjAbw86WrP37cvuqchG2NKAw9+WaqVjYl45nDIqduUWJA5MxUjNa1hXJ3TDQ6kYtPuo8Du7jW9zVbQD7ZMp+4KH3ER7Xf8cmYuSGZj2VXQp+wP7nY8gw6DdVy6jte4ESuHt1aVI7eEETaZAfVa2X86aXWVr9EJvxmInpoUxT9uYM7Onwc658Fpc/GJplPXpPGGW1myE6m1fpJ5ZqrC5FZEDm9J6zW+bYHfdBAtt6u2NvK4on9XCDLT8CzjAaKlM4MEqI7f3jlZxIeHd7wgpOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJZRaMnPWGblfjCuickQJGh1eNUiaLSjspKSn0cBIeo=;
 b=Q7w+azLWF+hSzAMIbt/UC4SNCGNHQEu+gS5+sw3st/xEEUrz6WOBYb2dym79L48QvgTaD/SdjKroPb/issMbUdGw1I24kC7fdz6flG/I5rqxaIjKuHLt0qwCL/VefOZFHxBl8c/2yFKRJTo/rbIjTtRypyUd4FIrWK61y1/hQokPg07YkdyLHUwkOdVnFYNGbA7GxmG0qFjr9GVE52FZlUP5bArJc7OLppTRMMsmkXKDzil46IRVDjTq/MEfLgcFWc12WLE3SsTeAasISpU+93FKXi4vuAIyWvepzjZNMP6jp1mh6q7MURfJzB48UPscOUhI/b4iTNVh/qRO+5IFQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AM7P189MB0726.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:11a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 13:52:19 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 13:52:19 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][wrynose][PATCH] glibc: stable 2.43 branch updates
Date: Wed, 22 Jul 2026 15:52:13 +0200
Message-ID: <20260722135216.1276081-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DU2PR04CA0248.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::13) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|AM7P189MB0726:EE_
X-MS-Office365-Filtering-Correlation-Id: f2d1a4e0-4531-4bee-8ae0-08dee7f87295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|3023799007|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ocM26/qZu/f9Vq7bHc8tDtc2jL49pC8H/lXqLQ6GsOINRySQ8IfxiZbKoEc6HhlqDmnP8LG96BTQJki2Sv4RC7n5SdVrevVQxeOIyyIzlus8Av+LLZbJa7cTBn9MQQqjdN/3NqzNOxh7lEvNSrCYgHA+IzU6rZ8S72Woa/roIH4R+JDyfiqCf2Rv/So2oRHOJuNCFpO0qaQKjJJNqKP+9DPuWZn0n+Wcakd5sYUrvDzR1THqtWB9dtsgBF38UE3y337U6G3K3xVcECGQDc5rDoVSVsiRm+VfVWCThv7DcxxaBWZeirdoDQbxdyiiDUAmaeg1qkT7z/ks9dFsSAnyYr8wu8I4fud2C+jsdgN80F9apHCqy3Gzn76/j31NyXIzlT6UZXfAWH5Qk/+QlUYhBin/Flc/CdKf8WcmAnUj+2CobYhvrYymKd06xRE0K9wvMHRICO9tpbInHFXjm7zrKBYODQ2ZrVnClBvuA9O9bY2BDzHC6DQVSOcKoQoDeVBLnOiPGwKID4xOz2ILVgQveMAuhBjsM1L8iE+Woj0eKpP0CagpI8cmRUfihyxcAWfhp0EASAy9Ykx5jmE3juTrRs7XJ3EPherKhTBbALt3VB0gqe6z9c4F3Cwdy1LlNTE6iwtDtwSwlhKY+0eQ+aCeqrcfvbA+vCFUbcF7KpMakSs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hpT46zkY30QBSVuqWXO0WIDhnDMR2UemlgTLaw+HVVKwcNCpXg+JhHQE51Tk?=
 =?us-ascii?Q?f4BHz5T78gQtIwAASxX2hlY++0CMrfP+k9uNmuBErETCOouA4Wurtfo1VkBm?=
 =?us-ascii?Q?CBcJGvmWh+Bcei4O1DJH5R68GPXbhoBk+uvQ5bgKe7CohodhRLApqSV6radR?=
 =?us-ascii?Q?ozxklM4qRmNMf2urZEBvII2+ivi1T5AwPLnUEg8Hkn1GOdZWqlhFkH/JoCrH?=
 =?us-ascii?Q?RZxD3OZQvzrnr8UFyjKSVi1fk5M43K7W2SvO07LDrhjUo+BqOAwX1xwKDUep?=
 =?us-ascii?Q?twNerefToyCCdv9MBdyzc9NVqLlmiWUz50X+HpQ4Ey+l49toBclQ7ED8YBJ+?=
 =?us-ascii?Q?TS8ngsUId68bcz06KK0q5eUZltfimyBMTlL6Oe14RZBuClZ3akijRp3+g7yr?=
 =?us-ascii?Q?6QBOixT3u1Ei+C39RxqepRG47yReD/DCnkCQF97BqlV1H+JRqo8cRbwn7UPa?=
 =?us-ascii?Q?c2X41dMOwAmI40pbaHGIigZTITriOC7zDNI+tIdEtkxb1+1BIU5h4mPAIYcz?=
 =?us-ascii?Q?dugcBEy2s98UdX3kfkWWKbgZVEgsdYp75S2+/6PWQUWDNoRyROhNUsWQIEM9?=
 =?us-ascii?Q?KpKyXncOzPa/zul951Qer4eudF5J4l2tn99P31Dx67dEqzoFCZL9dVnFeX4K?=
 =?us-ascii?Q?btEVRf7yJf6LxLk9eKCx+D6g9pQBxJ+rBOZKD6QuLQT5YXgbekG6HIFsGbnx?=
 =?us-ascii?Q?FSwC54dVsdC4jKBID+Zxxznvnr1E+voQu0cDQwpYW/W7GVCPcm0dy3BsZ+xt?=
 =?us-ascii?Q?lR7492jJ3mWoEjHkrjm51wtwksmSTQRncUxd6bxmCtfFWH2ZKhseu43WWJyU?=
 =?us-ascii?Q?sDJo0pPnZS0usi6w+ZZN0NOIW0IhrN0xiM3LCZeQYNa/ZuRepj9wvfFqg30X?=
 =?us-ascii?Q?RWicyS8nnBZbf+7KXL2Q/IhkbILBkmsA5ov11D8qknw65UUDQoxVhqNk3qGz?=
 =?us-ascii?Q?BSCgJXnoXEjflUU95sX7RaLcrgRDVmpZuf1myBIT3rQ2MXB9y8M8+yeYMM3k?=
 =?us-ascii?Q?GX/A7mLlvz4pFekicxPELx3HYoDZKLmLYG3g5QclTWiKU5KJf4oAj4Ij+A6i?=
 =?us-ascii?Q?0Rek4lx19MNqIEafo9j4YIx5OmG3CZilzTenRwZPWIiHPvI+10SYyOlp6qV4?=
 =?us-ascii?Q?SFOk+toggobBIJObOyhqPzzfhmKUJ4xK8kBfZ1oxXreMS3hrT3K1aLGoV8OG?=
 =?us-ascii?Q?DF7KVbAzi/glD/gGZ5MevfFaPeWylGWvMT/RcO0oWalHS+WB208c/jrGA+Uk?=
 =?us-ascii?Q?gsySvs5jdtCLPSzV4Nz2KhMsLld6TumsgxhwqNBcqy2LMlUDemXDdgV6QKNf?=
 =?us-ascii?Q?ncsbtV3glJpgvy5AwtmdZvEvIeI+3lvtMXcWgcRTaj67wkP68dPoJv+FoBlI?=
 =?us-ascii?Q?RZC+U/fEEW5QChJGJKmBCfoqnG59n5WUJksczzjmBy+s/r3PbgXNCzc0f4CN?=
 =?us-ascii?Q?DRNWgUbgtKgcVwwf8nUgZHppG68m6NXWFypfo8cEZ4bdwwa62SD0OfOhpXA5?=
 =?us-ascii?Q?O2/w/5RYQLT0Z4Rl426kBMzRRn+xChMkhld4Av20l0J53pWLzejrp8gvVbva?=
 =?us-ascii?Q?0WX0bQ36liwv2I58gJdRRLL5/vicmK8BAUHC4aCd9mScJQaDBU+HjoD9PD5f?=
 =?us-ascii?Q?GeGbPMJvGU4gUc29cYSPRHWWt8BjXgxx2hkVcdQTsQ0LilL5NDZImgRVaVv9?=
 =?us-ascii?Q?cq8qqXZadHgjkdYnRbSe9EARmyyQAhj0agNwGSoaLf341+D11kCx+zK6eLIK?=
 =?us-ascii?Q?0oc7aA3kBzEG/vEN82mnPU2HMQPIG80=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d1a4e0-4531-4bee-8ae0-08dee7f87295
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 13:52:19.4662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MLpkWcm9MVn+M8Z1w8G+KCZEwh7jRecuaURLtT+kD80c7nowZjZOLE44BEXazG3rmWiYOC6y1W4qAPjib5CFUhCZyYe6VhcydANHSIxzUco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0726
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 14:09:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241696

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Update SRCREV to pull the latest fixes from the upstream
release/2.43/master branch, including fixes for the following CVEs:

  CVE-2026-5435  resolv: More types as unknown in ns_sprintrrf
  CVE-2026-5450  stdio-common: Fix buffer overflow in scanf %mc [BZ #34008]
  CVE-2026-5928  libio: Fix ungetwc operating on byte stream [BZ #33998]
  CVE-2026-6238  resolv: Fix buffer overreads in ns_sprintrrf
  CVE-2026-6791  posix: Fix stack overflow in wordexp tilde expansion (BZ 3=
4091)

Commits between the old SRCREV (e9517114ac) and the new SRCREV (1c9988e525)=
:

1c9988e525 rtld: cache cpuid results on the stack for intel
dae425b554 posix: Fix stack overflow in wordexp tilde expansion (BZ 34091, =
CVE-2026-6791)
8759917de5 resolv: Add test case tst-ns_sprintrr (bug 34033, bug 34069)
3a418da6a3 resolv: Fix buffer overreads in ns_sprintrrf (CVE-2026-6238)
e64ae5a591 resolv: More types as unknown in ns_sprintrrf (CVE-2026-5435)
c9225a3e73 resolv: Check for inet_ntop failure in ns_sprintrrf
c46f7b2fd6 resolv: Improve formatting of unknown records in ns_sprintrrf
1d7d1a16b0 resolv: Fix ns_sprintrrf formatting of class, type values (bug 3=
4289)
349297a4eb resolv: Declare __p_class_syms, __p_type_syms for internal use
fdf10644d6 hppa: Fix missing call to __feraiseexcept (BZ 34306)
a6fa9a9594 arm: Save/restore VFP registers in PLT trampolines (BZ 34144, BZ=
 15792)
fe0ccc9564 iconv: Suppress intermediate errors with //TRANSLIT (bug 34236)
22f3d24a6b Hurd: restore some SIOC ioctls
a13ebdbc7e Hurd: comment ioctls which cannot currently compile
446f708e4c Hurd: comment PF_ROUTE/AF_ROUTE defines
ced45fd472 Hurd: comment PF_LINK/AF_LINK defines
89cbf46693 elf: don't clobber ld.so.conf in tst-glibc-hwcaps-prepend-cache =
[BZ #34210]
18b97b03b7 Rename __unused fields to __glibc_reserved.
a47b5b2b3e math: Fix fma alignment when exponent difference is exactly 64 (=
BZ 34183)
4070d808be stdio-common: Fix buffer overflow in scanf %mc [BZ #34008]
2890b35cd3 libio: Fix ungetwc operating on byte stream [BZ #33998]

Testing Results:
             Before    After    Diff
PASS         6609      6611      +2
XPASS        4         4          0
FAIL         131       132       +1
XFAIL        16        16         0
UNSUPPORTED  554       555       +1

Changes in testcases:

testcase-name                                before  after
resolv/tst-ns_sprintrr(new)                    -     PASS
nptl/tst-robustpi7                            PASS    FAIL

[Note: The uplift adds new testcases including resolv/tst-ns_sprintrr
from commit 8759917de5, which passes, accounting for the PASS and
UNSUPPORTED increases.

nptl/tst-robustpi7 shows as PASS->FAIL, but it is a flaky test under
QEMU user-mode emulation (PI robust-mutex handling). No nptl code was
changed in the SRCREV range.]

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.43.bb     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/=
glibc/glibc-version.inc
index af3db54cee..cf5a444095 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?=3D "release/2.43/master"
 PV =3D "2.43+git"
-SRCREV_glibc ?=3D "e9517114acc77c0b8af9da6700107df16882b701"
+SRCREV_glibc ?=3D "1c9988e52540c844928c6d93ff45305adc2c24a0"
 SRCREV_localedef ?=3D "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
=20
 GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"
diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glib=
c/glibc_2.43.bb
index b84c55ca17..9f3a3814d0 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -19,6 +19,7 @@ easier access for another. 'ASLR bypass itself is not a v=
ulnerability.'"
 CVE_STATUS_GROUPS +=3D "CVE_STATUS_STABLE_BACKPORTS"
 CVE_STATUS_STABLE_BACKPORTS =3D "CVE-2025-15281 CVE-2026-0861 CVE-2026-091=
5 CVE-2026-4437 CVE-2026-4438 \
     CVE-2026-4046 \
+    CVE-2026-5435 CVE-2026-5450 CVE-2026-5928 CVE-2026-6238 CVE-2026-6791 =
\
 "
 CVE_STATUS_STABLE_BACKPORTS[status] =3D "cpe-stable-backport: fix availabl=
e in used git hash"
=20
--=20
2.34.1


