Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82AEBC5B567
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 07:28:43 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2586.1786519713474107005
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 00:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=SgFiOYOK;
 spf=pass (domain: est.tech, ip: 52.101.69.57, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p3BSVTJ3GuHsTFKYBbAW+dL7IMHRCaN4wxqzyJ9qPBPVUa8SL6mSaffRj1JTB/9coov2D9IMwkSvT0RAr+N94H44yQlYwmrA6KBuCMjHiewi6e266UXuum2s4jVmW9+7gRJDzrIc+s30tiOiwUrukoySfsDzb+iZibWFoUM02AUe30SRTkqcnueMb5uY/Y4TMN2w8oyKgeOYzj2pnuoJVD90zDNlTyDjtfh4ad978g/1NYZklUQ6a731MAKra8sCrZvODfVvVHfnhRUn388wAR1w2bmAnGw/5Mq+vBqhQ7OQiuzCEZ5yeAyndc83QRw82+ES6KiCp2C1K8ak8C+77Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LH55WrgP7viDHF4inNowXEMaFkJ+AOrK5C8Ta8UJ9fE=;
 b=w+ernDARNulILv5N74WS8A5Qg95109Eumree0M0Rx3BN/ITz0gTAwL1mO6QRkCynJLAKEz9Qr8RfCjjpNjo1l8C+HKeKnAfOvsC3XmC0xRw5R0iLPTMh3SPX8voKgd8rs2t6niF2uYkicAOfZMu/rEwqYd1Ar/hZkcu559YlikF3QEBAfzmCM8x34xB2Th4iYnOb/I1GD65q5n5HoIBrFTIdyrNpysM3Bnm5slM1s2s4DEthIsHbaM1fVaa/SU3T92D/LmS2IRbcVBUVT9oAoS4VbSZVCjXD2GCx2maf7cyBBD4On0AP3kgHE9bmwFJ284Yqm3HPDKX2n5/wQplSBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LH55WrgP7viDHF4inNowXEMaFkJ+AOrK5C8Ta8UJ9fE=;
 b=SgFiOYOKfZRJWAqBAOQIUWW/BfpVjhtEevI/eUdtnuctaARaah2oP1EeOXETmsf1xTjB5vAodBmEAOmQtQQCG58fqNRn4h6jXKafuhBzSO0PflGsI8QSDohGclHHMaM6A15i9BbjOb1vBJBEC4+NEBRM5zLcGLMazzXUDpqp7tF9HJeV3TRdhoEyzqipRTCEakQs6W+ZGbfmscJzVv3n/PzKI6L/7ZoGsU24jfFFf0zjsewGsWghRaAYOAmxzIfQfcRoPC9FJ2Vn7aTEcDMPfWS7PASSYJGkfw4CaiwdZmNg/ruYoNg59LM/1ZI1jGa9qBI4aDliHMFdNnJiqZZNQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by BESP189MB3212.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Wed, 12 Aug
 2026 07:28:31 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 07:28:31 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH 2/4] binutils: fix CVE-2025-8224
Date: Wed, 12 Aug 2026 09:28:20 +0200
Message-ID: <20260812072822.22227-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260812072822.22227-1-jaipaul.cheernam@est.tech>
References: <20260812072822.22227-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P251CA0027.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::25) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|BESP189MB3212:EE_
X-MS-Office365-Filtering-Correlation-Id: f42f397e-5bf8-4ed8-c249-08def8434f6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	jXNpC6gsEgTaYg4MWBPlkHIQRF07lFn5gZW5Wk0UeG9Ci6hh4G1WfuCCJmFYesMon/8nEkRiDoRy0AOEdwGAYsZw6963WPX0nmiTVLtBSuC1wEwxUI2qC1gPBaM+RQkt+gCqSDOmCqluOgpuzPCJS3dS6or8fVNN/I9r//ZhJcLcM4cMdLJsad5ssjMXdvZ7ers/XAAtZDu1bpBiDHHhDeYg2/FBdVOHtV4VBMS6sm/HBCjzCgB9Z1dimrVK/rYamxGj46OVRjL8zU/8wjCmRavlLweuPKZyTyoDNr3TlEl0f0RmYD+J/+a7d1aqsieHWmE+1Xnb4pQFrg3xCjfRp4Yz9X2P/dC7Hcm0co4uTv3p0cPEfjO3iOxq34+nLa8GypwsfoJvjHqY+9D8UqouiPyguI8WehDoDG1fgFE0I17fCkdopiluxLgs3qD5M9s+fECdI5PyAAjEE4zJ40VlLpN7Tu+QZC9RlUEp3D6fpZyNL7xEqHGmJ2mz1hCNNRzbchOixLmwcT7IX7mloj/VyJpKac0d3cqXBEMOvyWDtqX3i3ngTruqcmiKPh/cUVauc81DdN1Df2yjOY2Ae0sNgjvcIeOP6qcEwZHWvO2PLpnfBkyY+WbDreZblLc5Gp7x
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6sH6QqdX51bkBg+LHAgM15doxGlFqC+BAtL9xeVQ24Ovg8t81pn/Ttzf7y1x?=
 =?us-ascii?Q?5GlvY1WopQ2N95ZRg9teGLUFs2jdDUrPOdCQaDe6lxAyySqHBg4/oXYKk6RH?=
 =?us-ascii?Q?le1DBhqYN2O+IyXcugSpofHt4bdKVCs0ypGdPmylEAvFobnuYjWs8lAeTTnk?=
 =?us-ascii?Q?5sZdgU7rpsGNVsGs3tJsaDiz/z1PQtqjta2CuIiSjAH27M2S9+ikVLObCxyU?=
 =?us-ascii?Q?F4AUWfNF/cu/+qPKrj2M6rdimK83h0t0a5GF/NdY3XoWMFqdoF6FHmhQAsfU?=
 =?us-ascii?Q?jcrIMeAQxL0s+8TBm/Ll7Y2gAr7MBozoDQtKpGumeYWhycNUT5iX+/6DNGeD?=
 =?us-ascii?Q?cn+AHnQaEJXHZN/FOiGqCxkmZRpSSOtgCf9OqOgZ/Kp37eUtr6WMaejU+4Wx?=
 =?us-ascii?Q?OcwFK9kLEzP4LLLBiyYVzX73kfk1apZztMlRV+NCHm4jvfor3yiLaO/Ws5di?=
 =?us-ascii?Q?FnjA9DfvoUswN5qtht5rtMrG+phs03Mp3eWwPsnQ5tCB1l2S0R6Iws9Al4M5?=
 =?us-ascii?Q?kjd3jM1qjuZ/mw7JYqztTZx2JxUnANr+rLUWGy6cDjdqx5Y/2LG3sK0XGrcw?=
 =?us-ascii?Q?2MBWoksEvUmG+ei5FBxp9Zo5g4xIt5N07DgN4wYlfuknIPLkFkMn2mqioGL9?=
 =?us-ascii?Q?mSIt42T9sEp9iK/wtNoPxajBoGzjZNLOjYV4m2DuPJZ00Tge3+fahs0jQhGH?=
 =?us-ascii?Q?PIsDky4XkBbdECjDjDm7SYZQGswmZNpIN1xj/Zb0FybX77DMc2r6JOIE0Ahe?=
 =?us-ascii?Q?3qTaj0sGQAp85W5YiCtHwaViBOcTO4VHGwqt8nhm4zzzl2oDrzOCV4aQh5cV?=
 =?us-ascii?Q?4EVDOyiTuPX5zxN7TNsIyRdwSmsR9C9BDuinzlOgv71+Ry6uJJCuuyQZEH+B?=
 =?us-ascii?Q?Yg1SntIgGuiIAVaFAUkSKxr8NQgHqryMQPf/ww4HRp5r2YJjYfnPhkmCcXYI?=
 =?us-ascii?Q?M1Z6E8sUls6TANj8n49KRVZ0kWw3dnJYnvcsPIFl6mxs5JYI/RafTWYsUD2d?=
 =?us-ascii?Q?QUUQZnUtSdtekhd9K7kzMkZWmgzFt7kSu0RrfpXzfs0CIrh03ONhN3dfmdiO?=
 =?us-ascii?Q?2kJ1nWuOww3dkkR5yBMwr7IzwnpIHma1O92uqWyGYmsU0mB1DK6QpHmgfK72?=
 =?us-ascii?Q?n3kDLZ7eBdmxz834t+wO5mbUZhLqMycaJ348EnL0Y70J1krBVzonSMzJjv+r?=
 =?us-ascii?Q?ZuoOetYRyeIZ4yLkcXy4nKeJY20xiEsNbzR9IZDunRHbsdOvFi+so5eu4k3h?=
 =?us-ascii?Q?31TkosBs3XMo9Z1uIIvjUVjsRec9UqdKH4rXDwe5N5a0fBf2ghjKcE4dHazL?=
 =?us-ascii?Q?4xU7RIorslIpx3C2JkTX8gwlGRWiPWto6fIoTcmPxd8LPkfBj/SHlgQAyIBp?=
 =?us-ascii?Q?Hkg97TRwiq+VticOAH1jxSFJG1wID1UgB7spx96b7IktYTTVdGKBI8cljdux?=
 =?us-ascii?Q?2XbeXHcQUvgN4kfvBgXLELzqWK0LS3XzoNN7DUpZzSUgX4mVu9P4RvSleYKT?=
 =?us-ascii?Q?oFZqWQLwbKQzDOxwBhAHDyK4Lqtc93um0JfoHOvv6kY0pRiPEbB3x7jKxgyg?=
 =?us-ascii?Q?MdMjQj2g35VNqJhTzQX4uKfzMRAGWEtpootimk8Jap+6Hxy/RVZxLE1wGByw?=
 =?us-ascii?Q?s1D5+6OmOZt/sAS0uDa7nCZnb0dxzUjoynQmcczutu3MgpYJ4Oew6/X3NEcj?=
 =?us-ascii?Q?ZVXG+VUJywtUip7qnkoOdRIfsEfTHXv5TabeTDkReqZiFZy3Y4jBerfxi3h0?=
 =?us-ascii?Q?vpAMjACLcHsobGSUF7Zc385NXPJkL0Q=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f42f397e-5bf8-4ed8-c249-08def8434f6f
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:28:31.3643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iejguq41nbE06WoH+YdtChcrf2/OC3lsiGYN+LPx6ho9ANhuhzhn4WfL6zdKa7t1AdvA4IG+EcbCXNH9OZa2xm/u7bX3eEPBSCCOJIsarbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB3212
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 07:28:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243249

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-8224
https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Ddb856d41004=
301b3a56438efd957ef5cabb91530

[Adapted for binutils 2.42: only the shstrtabsize overflow check in
bfd_elf_get_str_section applies. The second upstream hunk (DT_STRTAB)
does not apply as 2.42 already unconditionally null-terminates the
dynamic string table.]

Test results:
  binutils-cross-testsuite 2.42 (x86_64-oe-linux):

  Before:
  binutils: 302 passed, 2 unexpected failures, 1 untested, 7 unsupported
  gas:      1871 passed, 4 unexpected failures, 2 unsupported
  ld:       1728 passed, 5 unexpected failures, 7 expected failures, 1 unre=
solved, 20 untested, 99 unsupported

  After:
  binutils: 304 passed, 2 unexpected failures, 1 untested, 7 unsupported
  gas:      1871 passed, 4 unexpected failures, 2 unsupported
  ld:       1728 passed, 5 unexpected failures, 7 expected failures, 1 unre=
solved, 20 untested, 99 unsupported

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/binutils/CVE-2025-8224.patch     | 54 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-8224.p=
atch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc
index 063c6cc2a4..5534ce577f 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -79,5 +79,6 @@ SRC_URI =3D "\
      file://CVE-2026-6846.patch \
      file://CVE-2025-69645.patch \
      file://CVE-2025-1147.patch \
+     file://CVE-2025-8224.patch \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-8224.patch b/=
meta/recipes-devtools/binutils/binutils/CVE-2025-8224.patch
new file mode 100644
index 0000000000..0ac8e0a1d1
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-8224.patch
@@ -0,0 +1,54 @@
+From db856d41004301b3a56438efd957ef5cabb91530 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 25 Aug 2024 15:20:21 +0930
+Subject: [PATCH] PR32109, aborting at bfd/bfd.c:1236 in int _bfd_doprnt
+
+Since bfd_section for .strtab isn't set, print the section index
+instead.  Also, don't return NULL on this error as that results in
+multiple mmap/read of the string table.  (We could return NULL if we
+arranged to set sh_size zero first, but just what we do with fuzzed
+object files is of no concern, and terminating the table might make a
+faulty object file usable.)
+
+	PR 32109
+	* elf.c (bfd_elf_get_str_section): Remove outdated comment, and
+	tweak shstrtabsize test to suit.  Don't use string tab bfd_section
+	in error message, use index instead.  Don't return NULL on
+	unterminated string section, terminate it.
+	(_bfd_elf_get_dynamic_symbols): Similarly terminate string table
+	section.
+
+[Backport note: Adapted for binutils 2.42. The upstream commit targets
+a newer codebase that uses _bfd_mmap_readonly_persistent and has an
+explicit unterminated-string error path with return NULL. In 2.42 the
+code uses _bfd_alloc_and_read with shstrtabsize+1 allocation and
+unconditionally null-terminates via shstrtab[shstrtabsize] =3D '\0'.
+Only the shstrtabsize overflow check fix applies here (shstrtabsize + 1 <=
=3D 1
+changed to shstrtabsize =3D=3D 0). The second upstream hunk (DT_STRTAB
+error_return -> terminate) does not apply as 2.42 already
+unconditionally null-terminates the dynamic string table.]
+---
+ bfd/elf.c | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.gi=
t;a=3Dcommitdiff;h=3Ddb856d41004301b3a56438efd957ef5cabb91530]
+CVE: CVE-2025-8224
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+
+diff --git a/bfd/elf.c b/bfd/elf.c
+--- a/bfd/elf.c
++++ b/bfd/elf.c
+@@ -285,9 +285,7 @@ bfd_elf_get_str_section (bfd *abfd, unsigned int shind=
ex)
+       offset =3D i_shdrp[shindex]->sh_offset;
+       shstrtabsize =3D i_shdrp[shindex]->sh_size;
+=20
+-      /* Allocate and clear an extra byte at the end, to prevent crashes
+-	 in case the string table is not terminated.  */
+-      if (shstrtabsize + 1 <=3D 1
++      if (shstrtabsize =3D=3D 0
+ 	  || bfd_seek (abfd, offset, SEEK_SET) !=3D 0
+ 	  || (shstrtab =3D _bfd_alloc_and_read (abfd, shstrtabsize + 1,
+ 					      shstrtabsize)) =3D=3D NULL)
+--=20
+2.43.7

