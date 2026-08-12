Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438A8C5AD5A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 10:55:14 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5125.1786532103872253773
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 03:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=zwRC4jxQ;
 spf=pass (domain: est.tech, ip: 52.101.72.49, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LrsDj7SKoA3ny4c1AWqxLPJCcvQfjMCvR9AIVSoU6LDwZduNcr/r2rtRJf06R7xNbbV/auoAfiYKTreFR1yDrRm2ov0r8ZW0RD04rBg5tMcj10+VEIR8P3yOdbBv/Uv8o/jxYWPHwvZpaNpDC0m720BXC7RwnGqcyt95sX47y5rKLfXYIDg2ztBnSieMfDIsePfYpZK6AWVpeRsIjOhIwIdHo3XkCHuo4mP+GG6SXslPhcZ+5+B55rPSjtADJGXZ4IfhBIU/iqQVXPbA6lVYAQbNKGNUmnQcqLk5P8sCY7iSldlfXhZmSSt8UN2ykGO9L0dcZKiGxvRbELMDn+KhaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JGdcsbxBOQsgtUJrTVny4PGBf7Nds75KsYALml/jxo=;
 b=hO/g0+xZjGLhcDj/G6LW59t7xLx1asmNprj5NFaE+/Obb0Ec9JQtw4hd/vSqFCAGP4JQraZgkKqLyt0wG87aM4N+ivCnIsKbF36umPOX93f3jR6FGQhO6Twrxv5l6kMd65U31SbNY8stjE/uSI/WR4xlkVvrDFLJCKHNa5ibvYaVN/vBFQ0FkAgVI5LyJ9kVtee/+neEdPm6Q6EG6NJ4ykca52DkJOyF3mIt0nLRNo1XjsYtvW0xR9R/+TgA71DCbW+Luy2cBg14joRcyqhOdrrqAMzSfcZKrapeAmJqB+IppS2RM8Sq5qL1zT1B3wv7U1x3BPZZHBEEZLVG09T6iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JGdcsbxBOQsgtUJrTVny4PGBf7Nds75KsYALml/jxo=;
 b=zwRC4jxQPy8aQ71YjraQvleF/yvtB9AzNzre/Tm54kKDV31gKoDfLVdUs8kXnk00o+5Mb7XJ9vojYktptUS4CRJCenuizHTLfeB5KfxRLMqylSvnxarsDBEYZk1BffWXveZy+nHRe5/3+0zuIgYi/KEJs9L5ECPt3wyR4xWspNKQPD64d1fQKGZfYW27Cj5cpShLi/Tst7X3MAu17l3Dwh+uXS63YlkPwYbL0YX/6eEWYT+1EIBxAkO0C/ao2HtuaqHQsKFcDylUdryxGKS3zcgQeIG8Qp9A176hv5hXMsazXkO4XB/7ZTDUG71Lkg75nnIhsdYT8wv74c1pkYBxYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV4P189MB3581.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2b4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 10:54:57 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 10:54:57 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH v2 4/4] binutils: fix CVE-2026-18220
Date: Wed, 12 Aug 2026 12:54:45 +0200
Message-ID: <20260812105445.24234-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260812105445.24234-1-jaipaul.cheernam@est.tech>
References: <20260812072822.22227-1-jaipaul.cheernam@est.tech>
 <20260812105445.24234-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0162.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::23) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV4P189MB3581:EE_
X-MS-Office365-Filtering-Correlation-Id: dacf39e8-b4d9-403c-7079-08def860261e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|56012099006|11063799006|6133799003|4143699003|3023799007|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	x0xyKaH2/lx2XlzX6L8iIOysltAtijm5l01VgLcQAqFwBwJGC8OEl7jv981ZgcJMCib8nvm3oNYRTPZnxVVg9fcmHgkco/4TKi9a5wcOnxdHhczm3yv9HQIdif68wJgCaSeyZ+vsipcfkDjqeVxlGx2axxKL+OCfSOqHSs35qlRdhAyFv9MnxJHBofMK/bxuyaNncjJfdicSH5sgOpFBc6wHOzy+2cycTB6NX0qtDrQkwsN0HJI7mpA+uPKSRtAMZ5ei7WeFEDi9WgQ/HGA2X++0bo/6bTSLSCicJq6ay0vLt02+5fHfSr+zuzoDDe1t5N8JXrXd3t62ipAGjl4EEqIJuDXOs/DgqiGuo+Kw7fkKLuq/RCfDXu2WxuyBuPBqOk2tOCFaIZC06RjociLxiXWrHNmAChM5fmCbab66dKLjFTLJF8+I5uefxSOH2PPIC3D58pdhhVpTkrh5X5Z09+nu9moWdTbNUaAKw7v7pDYehpE41ndsuc7nzmXjfQwFpQVhfS5EJ71mbJdRRGn0bo8L9B62HaVqHI0xN6+vW0xfs0jIE+orNiDz+6RMVvGaT2zLjpKuKETISzwF2AW+J6mNc71WuOJlLBtNEyIhVvSLcaFJFHCVlEp+EIK8pGFN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(6133799003)(4143699003)(3023799007)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?A78DzU/ik+nB4bLrTPSQAIgl3sq2lQr6iq88UqnJQtFQHvytp1boNllIGaKn?=
 =?us-ascii?Q?F+/rmUf57I8K+N2VgEUARZgYUU09mfHfrU+BEWdNg0zpzeefx6c0tq2Byp4p?=
 =?us-ascii?Q?TU4ChdXfwTqnkIwxvZcPkzt8ywR58ARm7tWUzHLsbA7KIEa5+S6LFApeh+pE?=
 =?us-ascii?Q?Sb6j6JprEBHU6GXU9c6/CK5tnD1TY3h83RF306gAxHAkMVNT/WailtM7/gSM?=
 =?us-ascii?Q?ENM40iJImakHr7r+T7v+fMvLNQAZBNwyi97pMV8rEhONJpHTYY5YquhVemf6?=
 =?us-ascii?Q?tf5dxzfOmNpIqxL+0VJt/0zRQKeC1xvYhoIHluWgnLNBCC8BZ4bZNO/ickRq?=
 =?us-ascii?Q?Gz6g8OEYmsd5pHLVTjwQak2uQYMcdCTJmLmDykwYzv7MFqklxvie2iGzgjt9?=
 =?us-ascii?Q?ZjsvrVtImdNKgu+OI1WmhdKOGeT6xDw29+WQMXPcWFQadv3Z1+NhXhcl04i2?=
 =?us-ascii?Q?PXBkDJ4S8pbumbKKVg70VHqdvLfvAYNEbOeh5vFhrNz9II8ZVbRXVUpY43se?=
 =?us-ascii?Q?ABaHOvJj02cfaBa5ylIGiNhA7bRPk8Er5aW3nbyEJyjdicZxiXDwpySRbmhy?=
 =?us-ascii?Q?vn0MaafUh2/lBUIstymFPL9PVBk7ozGTC0H0k5zE95L2prjfbfYytauN8C7P?=
 =?us-ascii?Q?VR9+OInGGz+kFS6MoIcBrkSjLD/lC16m42pCtrBHP2yeJB46PzqgsQuVepaL?=
 =?us-ascii?Q?qj8RxuMWmYTTfwzzTjhaJ+zHJxvftL8iKmmN8zazRDcZ92wyvDTXNj9N6s8h?=
 =?us-ascii?Q?xtQfFBvrqULbglq7iVbGAM+uGZud7ilo3JLrSE1OtMCIKR25jPmIN+J9YJEc?=
 =?us-ascii?Q?XiidlJCR02Mr4oXomAd1zfqqAJzGazHkSeq7krauIAYStbWRsDuKEP+YTQZ3?=
 =?us-ascii?Q?H1D+R2Q5lpcNQdIo/EwmlduJUSqWepwdZCHyWHbY7ufZISJfjSc1lvArAE3h?=
 =?us-ascii?Q?P3fBC2gxZaI26WZPuxjf96hYZOa5GJ81aJhgBjRlqDzfpr9vhwjxfsqhVofs?=
 =?us-ascii?Q?+lN87O5w1Zj6BwXmiUo8CI3FpQMJ0s2JIINUk0wqTZovOxQ31PjZDfSng2Rs?=
 =?us-ascii?Q?O7kf2Aupfvnr6FaFfEBy2+7/5S080OTme2m4lZMtCP+jR9dVakgc9kDs6UwY?=
 =?us-ascii?Q?od1vVYVzjDg9bfWIVpQG6XuVXyBPPYh6x/1igXGme5HPAWko6P+UKTKsN7im?=
 =?us-ascii?Q?GX2KYQPTTzyNb+8nat0bq8Kr+GXyGo5TFNQ5GfdIAYvfSQm+oiZgi8A99JDG?=
 =?us-ascii?Q?iKIH6wrYdEr/5rpk+gInUrUgU1zNrrqrvrVYsenKL9TEYD6FjyGcTfcv9XyV?=
 =?us-ascii?Q?WQX6g+UKY/sQ4sJ/TfJbvVsnshaO3RYq4d4qW3a2xky+RHXsoq3WipC/TlAM?=
 =?us-ascii?Q?elRBMFs45+7xZQX3kj/Z5gJQE7DR3wH43ok2/U/1o8o47MEuPgZVBu+EVSj2?=
 =?us-ascii?Q?7CORpxiBUvCo+Am/1OyjqRhfnQy6Ct+ymXMHYEq3/Anpz7NI/O//yatH+uhA?=
 =?us-ascii?Q?FfcCMfJxz7vAoITLG/RIIelwD8oJO2H5NmINRf/CLkMNyjeYAm+PZodetTDV?=
 =?us-ascii?Q?Tl9jklnfqAPoAijT/YkButbVTfoXVd6+d4Y8vz92P9UYw2xbzhEMXf8FYqwY?=
 =?us-ascii?Q?dUwCAZx46kRLONmmWKyQ/mSuwkuwIUSbORM8EcOai+MtZE/TRvtw0h9C8erB?=
 =?us-ascii?Q?I05+yWlOsYpanTClYbLqKLkfWR/WIL4LMtEZ5fySvBaYE89OUnGq4qT862f4?=
 =?us-ascii?Q?6MpFkWIlDIqPfNM9oNZeSX9laWuOnvc=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: dacf39e8-b4d9-403c-7079-08def860261e
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 10:54:57.4305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FtY8K0g0e8Tfogc0ZdvtnPArzlPHOtOxL/hyxHE5/M8CBqeRdAnNhnBhiF9QQNZkkxLW2Tx7iwILe4GwS9ABfovqGGCx5BQKKSEm5IuzIAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3581
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 10:55:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243275

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-18220
https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D114e3aae2b7=
e34057c8909301eaf78c15687e8e5


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

Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.git=
;a=3Dcommitdiff;h=3D114e3aae2b7e34057c8909301eaf78c15687e8e5]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/binutils/CVE-2026-18220.patch    | 65 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-18220.=
patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc
index 447529ffa9..d395ae1b1e 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -81,5 +81,6 @@ SRC_URI =3D "\
      file://CVE-2025-1147.patch \
      file://CVE-2025-8224.patch \
      file://CVE-2026-15003.patch \
+     file://CVE-2026-18220.patch \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-18220.patch b=
/meta/recipes-devtools/binutils/binutils/CVE-2026-18220.patch
new file mode 100644
index 0000000000..e915fb223a
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-18220.patch
@@ -0,0 +1,65 @@
+From 114e3aae2b7e34057c8909301eaf78c15687e8e5 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 28 Jun 2026 09:11:46 +0930
+Subject: [PATCH] asan: buffer overflow in elf32_dlx_relocate26
+
+	* elf32-dlx.c (elf32_dlx_relocate26): Sanity check reloc offset.
+	(elf32_dlx_relocate16): Likewise.
+	(_bfd_dlx_elf_hi16_reloc): Likewise, and remove ineffective
+	existing check.
+
+CVE: CVE-2026-18220
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.gi=
t;a=3Dcommitdiff;h=3D114e3aae2b7e34057c8909301eaf78c15687e8e5]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bfd/elf32-dlx.c | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/bfd/elf32-dlx.c b/bfd/elf32-dlx.c
+index 2dfeb4d7390..0f9a49695d7 100644
+--- a/bfd/elf32-dlx.c
++++ b/bfd/elf32-dlx.c
+@@ -77,6 +77,10 @@ _bfd_dlx_elf_hi16_reloc (bfd *abfd,
+       return bfd_reloc_ok;
+     }
+=20
++  if (!bfd_reloc_offset_in_range (reloc_entry->howto, abfd,
++				  input_section, reloc_entry->address))
++    return bfd_reloc_outofrange;
++
+   ret =3D bfd_reloc_ok;
+=20
+   if (bfd_is_und_section (symbol->section)
+@@ -89,9 +93,6 @@ _bfd_dlx_elf_hi16_reloc (bfd *abfd,
+   relocation +=3D reloc_entry->addend;
+   relocation +=3D bfd_get_16 (abfd, (bfd_byte *)data + reloc_entry->addre=
ss);
+=20
+-  if (reloc_entry->address > bfd_get_section_limit (abfd, input_section))
+-    return bfd_reloc_outofrange;
+-
+   bfd_put_16 (abfd, (short)((relocation >> 16) & 0xFFFF),
+ 	      (bfd_byte *)data + reloc_entry->address);
+=20
+@@ -143,6 +144,10 @@ elf32_dlx_relocate16 (bfd *abfd,
+       return bfd_reloc_undefined;
+     }
+=20
++  if (!bfd_reloc_offset_in_range (reloc_entry->howto, abfd,
++				  input_section, reloc_entry->address))
++    return bfd_reloc_outofrange;
++
+   insn  =3D bfd_get_32 (abfd, (bfd_byte *)data + reloc_entry->address);
+   allignment =3D 1 << (input_section->output_section->alignment_power - 1=
);
+   vallo =3D insn & 0x0000FFFF;
+@@ -206,6 +211,10 @@ elf32_dlx_relocate26 (bfd *abfd,
+       return bfd_reloc_undefined;
+     }
+=20
++  if (!bfd_reloc_offset_in_range (reloc_entry->howto, abfd,
++				  input_section, reloc_entry->address))
++    return bfd_reloc_outofrange;
++
+   insn  =3D bfd_get_32 (abfd, (bfd_byte *)data + reloc_entry->address);
+   allignment =3D 1 << (input_section->output_section->alignment_power - 1=
);
+   vallo =3D insn & 0x03FFFFFF;

