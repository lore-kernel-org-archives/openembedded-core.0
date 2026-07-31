Return-Path: <leonid.iziumtsev@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D117C54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 11:59:46 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4981.1785499182337649574
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 04:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=gRG61JFb;
 spf=pass (domain: est.tech, ip: 52.101.72.0, mailfrom: leonid.iziumtsev@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gz9YBzonTDODaPLq6NGI5csdB0ceUb9qmjmi8MWuXxt0MbRaCwI/9y7IsVxzcSQoC9AT3f7uSZAOxU5DPlGK6w7CU7HCLxKcVE3CTcvkPVz3VOG7eAEcgJmd6SWKdJkGJ1xrAgmzA+5u2W7eesGd09FSGe9DOyjtZhBqVaZ1T0sjuR6Tc4dNBxKR3SqUGas83wZtKSy4TrDGj94nUz7Yr3eXXihgtwdrZRjT6iNEmNU6G9u3ft5/qaHwnaSPugQ65afv+XS+k5rjT/LNdQEbMRZaYs4rvdsQfLMMSDnvORHgAf4n55Yyu6bBh6wIvpYTK64AQRta9CjZuwUkfDllgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqXTaw9us4E6tx4OQ90cS4haOdug4NhA0c0fYBBdJIc=;
 b=EwV4F1eslAqp1TAgd/YJ39tYvca2fKVGbSFifTbq9lAC073Q9kdOlxDm71PBJrMlaO2jXnsI1J9WyHg9x3TWMWDcBB7xtq6SizIJFjRV3jk6x8Jyh7BAlR+kB9hFsWhjHe4nlkWB+BL/E9wUhtT0Gglvby1VAzIDMAFvB9UfcbuWw05L9ueCua8lSaMkbjKN8y0GcYktUsrDoTyNmvEJSwmSkrbPRTzCbq3E7XMSbrjFBXBn5kP5AHu1TT0ztMYAJQtd3IGpmTp3kUNuyAXifqgasOjLli1OSvF9g30HWSPXIi6UkNubCbYur35d2mdGGS8iSNtKLYYQN1DiZmz47A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqXTaw9us4E6tx4OQ90cS4haOdug4NhA0c0fYBBdJIc=;
 b=gRG61JFb0aO2xH5YCyREyaYgdFexDDX6VwN4Rjk/4g8GYLNXM/683KHf9zdEYfA9fUNI0OnCgn+h4OiP76WWTdJj4OoQUwPxgeykx85XUUwmCEnBNnRoBMEcJR9CrrC6UkjGWYHZpp5K9u4aucDXwY2FDp4rZ/Y3nJOloQ1faqU14P6AOIsjFJJvxg4wDO5KTJbwCURoJ/o3heuiLNBT6yVPSYiOWFdTCD7CgyTiv/41KZLLrBjC7N8oNDm1L9X3ZCvD2NrSLW9IgDyrt+WRA+Cgn58OgQGsX3TRQJFE0UqSfUS1JGKqGrvXk0hHeF3MHiNVLufWx5xXCFPLeL8gXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2ff::18)
 by DU4P189MB3374.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5f3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.11; Fri, 31 Jul
 2026 11:59:40 +0000
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f]) by AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f%4]) with mapi id 15.21.0292.010; Fri, 31 Jul 2026
 11:59:39 +0000
From: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
Subject: [OE-core][PATCH 1/2] coreutils: fix CVE-2026-56391
Date: Fri, 31 Jul 2026 13:56:34 +0200
Message-ID: <20260731115649.1402336-2-leonid.iziumtsev@est.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731115649.1402336-1-leonid.iziumtsev@est.tech>
References: <20260731115649.1402336-1-leonid.iziumtsev@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0226.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::13) To AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:2ff::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P189MB1731:EE_|DU4P189MB3374:EE_
X-MS-Office365-Filtering-Correlation-Id: a9978715-d497-44a4-7be7-08deeefb3348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|23010399003|1800799024|376014|13003099007|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	sua3pRx5aLdzcqx069cI2qxjo3xHzPSQWtyrnH5yQNdqBubC+2E14lsVosPaI7bM4Av3Ez/IcTBStCpekEN7WLDM4tZCYSvC2VZvzxge1+ClKahy1TvslwSbjnidvE7NZvbjC4PCQ80I20SSRzLX56YF1IVqaxviqu59kCPZ2OFl4gro4zGXUjUgYN5Kgr2xnAbMQ1aVQ2Z4DplaG1uPG0Z1z0j79yz9aR1T31jTe7Tx1fkCWdoad7Og3yOzkza8E5gNWwPuQfv9xmnaRCaf0K3zTGdyPjExdPsTQWcEuGd9NvzY578250Z/QxioAfeUEaHp8BP1aUBXY0uH2wkzeeecM9ZUxASl2E976CWTzy9CBw1ZKFSh7XbQ7ZGXoguCfQBIP5eW0WglefBbqs1uiM36hQbpbnpqXHxzM7AiaCM2hohiuAkwBAmWd0SEaukYpTQN6cjczaRiRzOLFaOaZEMENxU1V26/Q5EsDzXeNApxPv0hVL/2vRyqf5bhNZKCuXOvZdxEq/HmFLKEHrhwESxZq4zx4jR/66bSC4QzpewiR/81W7CrkIvaNLKNPXun+gZHr9/Qytedx4JyCoSwl8lENR2xSF1pfP3ciXOpNaimbEbTV+zNEzUtr1BuR0z8kLRgkkfGpwmWlNZmIScUM63yde94WPE8B/4NLrFcP7M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1731.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(1800799024)(376014)(13003099007)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bbV/8ourasAaBKQmmX3GNuMNYBRMRZj1f/6kBBh5HZNZ6PRSG7IFIKS+BmB5?=
 =?us-ascii?Q?galKP52JDo67f8xcawFcOt/21RpjGHiTwa1bUPOrMmQ2cRChozEWuSLY7P9N?=
 =?us-ascii?Q?eHQP568AZU/Sap2t4VkGQc4qf1l7hzFxwih9KrkfoOM0ItVAdUU+9+f6Jr93?=
 =?us-ascii?Q?wdrc6a/f73QBfF2XHenM7KYLMq2AK2yZgY99Dh671jsDf7u+B2uqAE+4JEdu?=
 =?us-ascii?Q?Lo37nhae9dnjWqwf/nIeWS1bY12ci0typmgJDmYM77KsRFvp9x5pLiYtQyHU?=
 =?us-ascii?Q?RLNqJG2V1r8edmsaswZTaL6Cm0j64ZiTUOv0yS9YN40bgHP8m11w7ccYxAn0?=
 =?us-ascii?Q?gitb+y7LfGiWmxU1waf/TKqEm8jm+ZuJW4vZVuciNmBi79JQVOb5aEO81O1R?=
 =?us-ascii?Q?Xy1jS6Dj9AqoX6DD3F6/3KoJGQyszI+jK8u607bHonHJ2RfPL9t9jN7tcr3T?=
 =?us-ascii?Q?bt9r/qjVOXQ+LK7BlORBbH3zi3TN0TVV34jyL1WKpvb4+5J/KDWY+AgGXl24?=
 =?us-ascii?Q?cKMJFGh/ggprdHayIegm1wB0mfBCwvz1bD7bkmDRQ7L5DW/PQYHFuoA3LdSY?=
 =?us-ascii?Q?5wXrznzcmQo3tYXXkMRCt8ehIeh4lVshXPKJjg3NO2/7vI7qOZ4Q/H9z87f8?=
 =?us-ascii?Q?+zkQ6IW2x5ZO+laWic41nF8x4DLEeDMStJDBiZzd4G8wYpdZKl7YnZZrLjuY?=
 =?us-ascii?Q?KkZ7rVZU5sOp/g3ptN7ISDBbJJyXGMGoffhy35mCv+yDpptod+XygSDT4R9T?=
 =?us-ascii?Q?RXmiMUiZajrncL2quYKiGtvoLrrsXSRHthfozwN8rT7XF/pJGKbBkxoqCDSt?=
 =?us-ascii?Q?8dlEE8giUTtylDNYFdtCK9Lb8zQPTTkvDZRoYiYkmE/QiIua2RyiRhnHFT5k?=
 =?us-ascii?Q?huIJcruj5T3eF+uOyLhja+sEdXi6zzz8auQYwFQHvXgc4TJKLAZCKDXno1Eu?=
 =?us-ascii?Q?hetgH9RDdfetRwObRf3ZP/5ZAWAmN8Yap4SD7t+NLtVaEpAvJv2akhbtSoL/?=
 =?us-ascii?Q?pgLjSB8ELtxlxrjiXTtpoyLuBojQLo/95n/FDd1EnKcXhAz4o+CulSQxUr2l?=
 =?us-ascii?Q?8JOxzMMRnSNSfUOCBZG8lLm0m1sOh/Sf/U/3k0k1+zt4aeVWdsa77+PPDtlo?=
 =?us-ascii?Q?AbAFfW1+ughIiKqlnagHRLgMdMbEA9JbAqNhIJGE1F4fOQwZfvTr313rW5+w?=
 =?us-ascii?Q?Rs7HxX/Q6tRl3q1qc6DQIXOOnbrh+tcNVh1Z5yaCmx4qoE2/wppamrRlS4G+?=
 =?us-ascii?Q?8hvNbs5uBrErB5ITOS19g1SfZba7TykNzG7MsqF0zvU+WNXackOvs+Eu9WTt?=
 =?us-ascii?Q?jKXORAFuzPxkjiSuIKX4pwYs99mNc0TBPLA5/DKyNh9yPphzm8Utcj0p9FRl?=
 =?us-ascii?Q?Wqn9Mb1kwawFCl338nn9buBfuEOhRhHFWkGTHBz9JqMqGEtU04B1yuFJ+u2Y?=
 =?us-ascii?Q?59PtdE0xwviRBuqs0Imftxwv/FfXJHToFMoElhSmPF2PPi6soa9O2xj7WJ70?=
 =?us-ascii?Q?v2DLUM4RP+iT3ULDl5gYWNwv2oLOaqsm7ik6tuzlgxu9OcZRQOe03Oge+CyR?=
 =?us-ascii?Q?H3ve+hf79UWy/FWytAxNyOt9WotigTIWHDo6BlxA0QmbalNS85Zcj1pW7VpD?=
 =?us-ascii?Q?upM1kC9jcht6mvsQJEwb3T/zmuex9scEc2Tj/o3yjkmubviCKyFFqx1fUaj8?=
 =?us-ascii?Q?agtA+2OvqO4c89jbfeEFy4WHRigZ3vq/fLMwfdYCFqT9DDX4pOJPqp5amWuK?=
 =?us-ascii?Q?X+omLa3v9WsZpwWKOmYRvKmCUDkHUIoLWxOTHD7kKAouVMEOVQiIE8nx7vAm?=
X-MS-Exchange-AntiSpam-MessageData-1: OL7HATfWW1D+p9cD4wmVQvR7Gegxj/dhNGE=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a9978715-d497-44a4-7be7-08deeefb3348
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 11:59:39.8730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I9npNCOjtUKt1uG4Dn5K2KvoyHJClQzaC3n9P+3899ywgfLtQeYIXrbVdEFi3/COuaRjwK0OIrREQ5Dm1cm+Gr3vFm6X92DmNda8KpF/BN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB3374
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 11:59:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242432

Backport patch to fix CVE-2026-56391.

Reference:
  https://nvd.nist.gov/vuln/detail/CVE-2026-56391

Upstream fix:
  https://cgit.git.savannah.gnu.org/cgit/coreutils.git/commit/?id=3Dd64e35a=
8a4c0e4608321433e0d84d917e4e36371

Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
---
 .../coreutils/coreutils/CVE-2026-56391.patch  | 66 +++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.11.bb |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2026-56391.pa=
tch

diff --git a/meta/recipes-core/coreutils/coreutils/CVE-2026-56391.patch b/m=
eta/recipes-core/coreutils/coreutils/CVE-2026-56391.patch
new file mode 100644
index 0000000000..85745bf572
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/CVE-2026-56391.patch
@@ -0,0 +1,66 @@
+From dadd37b60ca43b436a2287d28d6497bcc5bf4b9a Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Tue, 28 Apr 2026 11:25:00 -0700
+Subject: [PATCH] uniq: fix read overrun with -w
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Micha=C5=82 Majchrowicz.
+* src/uniq.c (find_field): Fix typo.
+* tests/uniq/uniq.pl (add_z_variants): Test for the bug.
+
+CVE: CVE-2026-56391
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/coreutil=
s.git/commit/?id=3Dd64e35a8a4c0e4608321433e0d84d917e4e36371]
+
+Backport Changes:
+- The NEWS file has not been updated.
+
+Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
+---
+ THANKS.in          | 1 +
+ src/uniq.c         | 4 ++--
+ tests/uniq/uniq.pl | 3 +++
+ 3 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/THANKS.in b/THANKS.in
+index 35fee75..5a2fd35 100644
+--- a/THANKS.in
++++ b/THANKS.in
+@@ -459,6 +459,7 @@ Michail Litvak                      mci@owl.openwall.c=
om
+ Michal Politowski                   mpol@charybda.icm.edu.pl
+ Michal Svec                         msvec@suse.cz
+ Michal Trunecka                     mtruneck@redhat.com
++Micha=C5=82 Majchrowicz                  mmajchrowicz@afine.com
+ Michel Robitaille                   robitail@IRO.UMontreal.CA
+ Michiel Bacchiani                   bacchian@raven.bu.edu
+ Mike Castle                         dalgoda@ix.netcom.com
+diff --git a/src/uniq.c b/src/uniq.c
+index 3046359..5834596 100644
+--- a/src/uniq.c
++++ b/src/uniq.c
+@@ -285,8 +285,8 @@ find_field (struct linebuffer const *line, idx_t *plen=
)
+   else
+     {
+       char *ep =3D lp;
+-      for (idx_t i =3D check_chars; 0 < i && lp < lim; i--)
+-        ep +=3D mcel_scan (lp, lim).len;
++      for (idx_t i =3D check_chars; 0 < i && ep < lim; i--)
++        ep +=3D mcel_scan (ep, lim).len;
+       len =3D ep - lp;
+     }
+=20
+diff --git a/tests/uniq/uniq.pl b/tests/uniq/uniq.pl
+index b558fb3..0df7ec6 100755
+--- a/tests/uniq/uniq.pl
++++ b/tests/uniq/uniq.pl
+@@ -234,6 +234,9 @@ my @Tests =3D
+         "  - 'separate'\n" .
+         "  - 'both'\n" .
+         "Try '$prog --help' for more information.\n"}],
++ # Test for read buffer overrun.
++ do { my $longline =3D "\360\237\230\200" . "A" x 255 . "\n";
++      ['146', '-w256', {IN  =3D> $longline x 2}, {OUT =3D> $longline}] },
+ );
+=20
+ # Locale related tests
diff --git a/meta/recipes-core/coreutils/coreutils_9.11.bb b/meta/recipes-c=
ore/coreutils/coreutils_9.11.bb
index ea2d237c3d..3e4f5fc7dc 100644
--- a/meta/recipes-core/coreutils/coreutils_9.11.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.11.bb
@@ -16,6 +16,7 @@ inherit autotools gettext texinfo
 SRC_URI =3D "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
            file://run-ptest \
+           file://CVE-2026-56391.patch \
            "
 SRC_URI[sha256sum] =3D "394024eda0a5955217ceda9cd1201e65dc8fa3aa29c2951135=
a49521d57c3cc3"
=20

