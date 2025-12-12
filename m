Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 925BCD49226
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 13:37:25 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12845.1765546639162676451
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 05:37:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=PAjBEgyk;
 spf=pass (domain: est.tech, ip: 52.101.84.50, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rUSwaqyVHlEkVqO3S+9bE2IgAuGR94PAJAYf6C5noAnswYsfZzE2y8tKWix7DZrq40/QgvGvsreFzDZAx6L/xUyBQH6h2fjS8nhLBy6ywDfK1UcmM7nZc7Bw7j7lWpJxRjWOD2t7VtGDIoLBnDJpjClkyOJE5fE7H12nqufpjUN87qZ00sp1lbrEjkd1i46DkHl0ofH4N/7Fu7Jz2rJE2fLpzSzOEyObaDGy8OXjAbMEiVN2PMFh9kTulLbnbEiiKHurDmY05dXJFrfVPI7F9RU0wPWAj+l6MUfK9YprLCpRG8OXHpDRp3ItyeLtZmiYEnfhphVyjFTy7odCqXTJmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcZj+CBW+RiTgg+9lDGV0aRNS5ePANsLiwCMUoAFmbE=;
 b=snVBg1X6xeQLPkhCGZnpVxrYnO7aOZ+rjQYHgkkBwZ/XekdoRQj3JHWKVyTAbh8WFsD2oce4dtFAMxj2Uvj15yjHKENlN9Ra6sPkRjUyGWX6MnxgTYPamwArQV7ttIUW84QicnJ3sS12S5uVk0x/Ya/QayaDxmWtyGof9fg/RUdzAfFxnV0tJ7lS2eJxxe6o+eaZJguvoEg9l1Q8ZWbadI2qdsKfa6nahsea20Y+Tew84WbafiPtoioReQs6lEYiOKBheiphteGVAqdfQ5UTKAG+GIOeOpZvDUp59SF0l+kWAtl7G3/eEy6yB+saoU/zDan0/h8/+NRij5Sjh1LXXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcZj+CBW+RiTgg+9lDGV0aRNS5ePANsLiwCMUoAFmbE=;
 b=PAjBEgykimQnrMVtux6heOnDcbZvj6R+4f1vDPF5jjXOp4q464ayzpLuYXxsdl4oHqaJRQQxx1sY668NeLI3VaSKePj7XGmeaTZaO0QGxL8/NhWdxp75fY7C1MUo489sU9B0uSgGrbdqmqUH4YJIPKwsw/Kv1bF8ci18J7woymPwRKz+JieTvAM/xxIlTEzVfM26UWaCcylUHVGJQboY2o3Jq1iJYNzIH+GP/haWuFQr/aO6/V5Dl8tNKC0PJWkx2IjEOOelFCCg1vBoBKzfmdr0KbbaS+YZOfHupz3aUxhMYWNSaahBF+XHBvtJd62ccnTp3ToxU8J4gCpnvA5Dag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by DB8P189MB1094.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:148::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 13:37:15 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::3cc6:ccd5:b124:2a6a]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::3cc6:ccd5:b124:2a6a%7]) with mapi id 15.20.9388.013; Fri, 12 Dec 2025
 13:37:15 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
CC: david.nystrom@est.tech,
	Amaury Couderc <amaury.couderc@est.tech>
Subject: [review][OE-core][PATCH] procps: fixed large pid issue with top
Date: Fri, 12 Dec 2025 14:35:54 +0100
Message-ID: <20251212133647.55499-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB3PR06CA0026.eurprd06.prod.outlook.com (2603:10a6:8:1::39)
 To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|DB8P189MB1094:EE_
X-MS-Office365-Filtering-Correlation-Id: 237ff94d-2511-47c2-51b6-08de39838fce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HjAwcqmxjmykkXhmMd+FQq7bMLwc5pLE9xAZgykBYWSDNtBgB74XV2TylXqz?=
 =?us-ascii?Q?yVxKq1hzVi5SF3OVXqO51cg13z5OOrs+cHsCBcUVgcrUqISJN39lAYCF0Few?=
 =?us-ascii?Q?sHKcWCKhV6E675gHZ53eeRQqOftoFolPuPiuBRTGUDZU/mRq6ZGRSzcBWaNm?=
 =?us-ascii?Q?4rEWHaWm8yf1fMz+3+cWD2z/L063wBY02kx2VARDXSNLWPmfcWyelHLjltEV?=
 =?us-ascii?Q?NfwDUBNEFFo6kM7pgDPgjZ3d5/fsFWYKAkEtnToptCSPSYI5B1ejKKwfU5ht?=
 =?us-ascii?Q?6NdohRQDLvcGuWCwNTtX/cKkQUXdS9ZalXpwUgx2xjC1wRHb3MUZ3RByBd8R?=
 =?us-ascii?Q?O/O29VfeypR+HtZpcdZWPPblsLMS7csSmeOiYQdZikoUu6QLqZX21XGwkDY1?=
 =?us-ascii?Q?SHRpr8uG76OR30g0X2V8KGfLi/ClfwtkiOCZfm+opG0uw5O+OZSzyroDR1m/?=
 =?us-ascii?Q?DctyKGXSzseRGjIEi1hDw646x/35GQ3S75QXAaPOsGpncZfT9LNJ+6lPDWfX?=
 =?us-ascii?Q?zPr48Ams7M+Sa3bgTygjtiXUML4gmzeoNgpBVSistsbinPI0B0lOEx9cEBOG?=
 =?us-ascii?Q?4ZqP6iUMPOBogjyVklFBEnAMcysGEHSvbqZ3WYh3VncU1J43t0HSSunFIddP?=
 =?us-ascii?Q?r6pByanmbUZPdoY6xZRZQTJUFpAvuRVrIigdUQg0aFEoFz0M5a8mTagM+woU?=
 =?us-ascii?Q?6lwvHCmKIrrreIPMYKSo/9e12abPwwJ1UCbhj47r/pyYpAaOV++Z4Isixf+T?=
 =?us-ascii?Q?Karjr9yBMLOe25KHRqpL0FqOk2pwp+U2f7RjulM04MlFEgig4zo0MHDvbSuQ?=
 =?us-ascii?Q?R3PsK+zJTRlGvhmeu/YgAvx2U4vqZzVH7Lc2hWhsjL5bmw9fr2VM/oEdvSgu?=
 =?us-ascii?Q?77M2KDYxIeYX8fb1F7tWq4S8XEDCzJRLRufFQZlcQFTTVtkzC7ve8qg4h25o?=
 =?us-ascii?Q?tNizjxDCkGVb73hTH3na8tKUPNFYccn/MFWY9NR2ov7KVWMm1B1k1qp0mW5M?=
 =?us-ascii?Q?Q+VCkCqE1HgEpCHbXd2GBydLrCQkj7OkHa+ZYAQq/Vhp8J8WqDoqd5YIRsfO?=
 =?us-ascii?Q?FJ4UfrhbmGmlK5fmrYSqIsxwXzPtzJGK09PbnNALONU2aqCBodI0KwwROdV9?=
 =?us-ascii?Q?ucc/S622eL6/Y1/w9H5l7RuLz0s4RRgYAx/lS9ar/ELOEHQJu6B6xWI8n3nS?=
 =?us-ascii?Q?cM/YDbF+kdVVeJ04/V3zG7pBmu8swYHsCHbj2H2Sds++gEdLs2YfW6QndBLf?=
 =?us-ascii?Q?zy5ZomHfZ2qphm+pK43c87JM7gPFPzQnZwtxGJNOlweMDsKQBF+c14sO8NE5?=
 =?us-ascii?Q?tYqDO0Sgiu19wmb/WpUguCHmeoI6PYF7RNJU7Iy6no//rQRr9yqLZdgr03Ra?=
 =?us-ascii?Q?1o/UWgsWk93ieCmgSVNkHU7kwDPR64eoPAAILGtkrm1xnDlNzKIhKo/Wgcxf?=
 =?us-ascii?Q?Ko4+n74UGOHch9OTubYlkQtcAmLkQLRT?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sKgkqeozbi/S3z1VlJDqMrSpTbUh5Nzr1eYrL+pflxLY42lls5uJV2bLwZSP?=
 =?us-ascii?Q?M4+QudAGCJYqGOnNilV8zLz4OHGJo3V7n0VbDTYP8IQtxHQS0gpyPYlyYfOL?=
 =?us-ascii?Q?Ex5cdgufW1WT5H6jeHt198gYRM0ZXsS7aZ6qE8RYX8XsRsFg+mZMGuA1PhPH?=
 =?us-ascii?Q?MZ+r+DEbf6JvouJB/JgeStAq1hwfOFHcVCWfA8SyT+rieY/PzZ20vpqZmcwd?=
 =?us-ascii?Q?SyEW7jN/pDnfmMxTLmO2bih1c5ddB15PwL9RXzg9SVEcqOuUU2eMJJfImBWj?=
 =?us-ascii?Q?6avtugY+cZRTlGAr7DgGUFsBHoIrdMawOOFLf1yMLgzPh70GUw/1eZvtj78A?=
 =?us-ascii?Q?GKbF4fuX3gin/P3OaJIz5Eyqw/xqilBx2xTqtdyrqAfWO+GDtJQZ/4QT4Yrv?=
 =?us-ascii?Q?j1y4NTBz4cZRTv+O5AVHqxoQfINY+8VcXYgoVCcPQc9VW+H0y2Lpvpxdtlif?=
 =?us-ascii?Q?uEu6xkDLBSHEA3WToe6ert+lJC63/vIwVTO4x4Fgi6oykTR+VX1eC47EF7ZS?=
 =?us-ascii?Q?QCdQvqgRaSmAh1gYNXvGbZTnLabuImg1hvAEJ0wBioizSRapRu9aCMeGILkG?=
 =?us-ascii?Q?DNvRGb50KzkCmU8/91HwureEJUMT5aEHvPdFEazFLeFgw6e2vkcitdyrMvCn?=
 =?us-ascii?Q?HauuGYxHpRRtpGB6bkEby2Fx02xAHJoK45Ae4m0GQjabjLYEXI3R1Q6WD+Jn?=
 =?us-ascii?Q?f11hGXSjUz4y9heY27GzNS7Z4linRaFKty/9fGxXqPPuPp9/Zty6y1+VmBEG?=
 =?us-ascii?Q?9IGVeVn/Z6nSgw6Kuq534HZxsR4KWVScAUR48RwUBin677uM0xZmcciLI1aL?=
 =?us-ascii?Q?sh4IIgoVFNOKTFIkO9sCz9ynM3O+SCNynd/bRv1M4kdK544iwhdnoLQukudN?=
 =?us-ascii?Q?gZFz3jOp6/wMqvjlGYP10RhXFRyVEnNRGt90nERAfiSLnLapbEuXvJddKiIS?=
 =?us-ascii?Q?RFsOQMCiuVZ6s6ptNT4D0HPHBgAATZuwb3lNZVbuZUrRDM8T3TzGhFNQHk9e?=
 =?us-ascii?Q?9MFK/eyA9/jtJVjkjWBRA78Afu/wONrGyrkDSMvos3OXyj4grIIRkKgna/35?=
 =?us-ascii?Q?RNGaoaxxCV6LdOAnmR1gkbBRSsJ21laxBV5Nbbsb3KrEQl4/sCVMCs7foczL?=
 =?us-ascii?Q?aPTDUJ59pr6zx8Dh4SlWr5jT4WbkzKzQSC/D3fP5WSraBO3Do1JCczGx1yLI?=
 =?us-ascii?Q?SKsoVk1VHFWB8c14vzdtG3GwA8CVo1YcbCyrtoo+EzDmNTJn9mgFDj9+KvyN?=
 =?us-ascii?Q?hvRN3yJDlkDoeAUDb3dXnzo9Erv8HlCczC1eq7o9mLv8zdAm72SCxFGWr9eV?=
 =?us-ascii?Q?Hbw72ZKIVZMvzcvQObDTMx+AHlhDrOX5i4yrSS2vVKQxNkU3ctyujCAyNeD1?=
 =?us-ascii?Q?lxv16FLZwuJitVqsXQ9tDh6bcwwSmEk3Lftj0ARVRY7PGjib/vc1FCrDjy5N?=
 =?us-ascii?Q?l158tHZ/UwQx0kcJkeVtz3HwoyZO6cd3rPSFHS9Sf7Aap6+JclOnYmEBe+v3?=
 =?us-ascii?Q?vHyOJGvRQHtPCVXR1Ptr1SytCm066KDhFK/4lvFefxeEjscQXMSIoQm+CxDH?=
 =?us-ascii?Q?uVCRxEoKVUjHEOUi3ZBMQQAYyp+ETQwnhCU1zjfF?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 237ff94d-2511-47c2-51b6-08de39838fce
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 13:37:15.0311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kzhU+KZFunyjUnMcSYf8i7Q4bpJfM0uQoBaJx1eFjJY3TPnJ6r/593vgKqDYvDcJpuARZhkkm/YA8jwe97Lw9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB1094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 13:37:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227589

From: Amaury Couderc <amaury.couderc@est.tech>

procps: fixed large pid issue with top

top -b -n1 -H -p 92233720368547758071
=E2=80=83=E2=80=83signal 11 (SEGV) was caught by top, please

This patch should be backported to the scarthgap branch once it is merged.

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../procps/procps/top_large_pid_fix.patch     | 52 +++++++++++++++++++
 meta/recipes-extended/procps/procps_4.0.4.bb  |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-extended/procps/procps/top_large_pid_fix.p=
atch

diff --git a/meta/recipes-extended/procps/procps/top_large_pid_fix.patch b/=
meta/recipes-extended/procps/procps/top_large_pid_fix.patch
new file mode 100644
index 0000000000..d7e3141e06
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/top_large_pid_fix.patch
@@ -0,0 +1,52 @@
+From f21fc624d960d12afa399af7333d4f9193fb2ffb Mon Sep 17 00:00:00 2001
+From: Jim Warner <james.warner@comcast.net>
+Date: Tue, 16 Sep 2025 12:00:00 -0500
+Subject: [PATCH] library: avoid possible segmentation fault, <pids> api
+Upstream-Status: Backport
+[https://gitlab.com/procps-ng/procps/-/commit/5461b50b1a85c5e556c4cd2739ca=
8ffdbc69399a]
+
+In the issue referenced below, that SEGV was caused by
+passing a '-1' pid to the procps_pids_select function.
+That value, in turn, is caused by providing a LONG_MAX
+or greater number for what was assigned to an integer.
+
+So, this commit will help ensure we avoid a match when
+we should fail plus skip some unproductive libc calls.
+
+[ the same problem occurs in that old 3.3.17 library ]
+
+Reference(s):
+https://gitlab.com/procps-ng/procps/-/issues/394
+
+Signed-off-by: Jim Warner <james.warner@comcast.net>
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+
+---
+ library/readproc.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/library/readproc.c b/library/readproc.c
+index 2dfe4c9e..d0e039bf 100644
+--- a/library/readproc.c
++++ b/library/readproc.c
+@@ -1434,7 +1434,7 @@ static int listed_nextpid (PROCTAB *PT, proc_t *p) {
+   pid_t pid =3D *(PT->pids)++;
+   char *path =3D PT->path;
+=20
+-  if (pid) {
++  if (pid > 0) {
+     snprintf(path, PROCPATHLEN, "/proc/%d", pid);
+     p->tid =3D p->tgid =3D pid;        // this tgid may be a huge fib |
+=20
+@@ -1546,7 +1546,7 @@ PROCTAB *openproc(unsigned flags, ...) {
+         did_stat =3D 1;
+     }
+     PT->taskdir =3D NULL;
+-    PT->taskdir_user =3D -1;
++    PT->taskdir_user =3D -2;
+     PT->taskfinder =3D simple_nexttid;
+     PT->taskreader =3D simple_readtask;
+=20
+--=20
+2.43.0
+
diff --git a/meta/recipes-extended/procps/procps_4.0.4.bb b/meta/recipes-ex=
tended/procps/procps_4.0.4.bb
index ec8c4b0261..3c15f28a5b 100644
--- a/meta/recipes-extended/procps/procps_4.0.4.bb
+++ b/meta/recipes-extended/procps/procps_4.0.4.bb
@@ -15,6 +15,7 @@ inherit autotools gettext pkgconfig update-alternatives
 SRC_URI =3D "git://gitlab.com/procps-ng/procps.git;protocol=3Dhttps;branch=
=3Dmaster \
            file://sysctl.conf \
            file://pidfd.patch \
+           file://top_large_pid_fix.patch \
            "
 SRCREV =3D "4ddcef2fd843170c8e2d59a83042978f41037a2b"
=20
--=20
2.50.1


