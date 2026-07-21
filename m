Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0AE4C44529
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 14:24:02 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24044.1784643836382679990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 07:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=H2/5uJ/H;
 spf=pass (domain: est.tech, ip: 40.107.162.31, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBoLa5iq/thHlcOJhE5VQm7gO+1OMj7qN75jVbVYwUi/AEBG6M4mEG87UB2lcnWRRNjcdiw54bE/0DEogMqfJ16E9TZbdtujWj6FX5H6Al7+O7Szkt9P91NT1H2vPBYaXlTjVgoDFN96+6UoStA9jiBq/rzaF14BC9yuj2A8/aBbiTo2s2LqpkqTrwae9GU8kEdpitleNenTd/SRs66bBxe5aSMfji675Vr8JtRAC5Wo9x0Ik6TPpBoUHK+YZlJ0wcLSp67JhgUIgWLOqfQqZyhuzgeDYOTN+oi/hbfBciymtZTkgqioHXxU6LFjghAvhuXJC5DQx2OJCSRztDjqoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QIme0Fg+uZTtWn9H8oTW4eOEugLYHN48ql9Jctj7TA=;
 b=XxtrXONTxFjOs0i26t2r2qit7kZt31lKBXBMMU85IPEJwfxsIq9n/hGhYNBN9SoHAcQOQZwSAynhc901hT6pNWKh4auNA8pqjGVqITgqqLxKy3CV1uXa9qhOEmvDno77/DeJez/Z8oK0mspiCJCE5iGDp56xTB+i6hrSNu4IkYSk870w+HSdCoYKA627vHr4SwVq3tTJz9Ti06UOLGKdU5b+mPffyJTvEMONXpLrI2v3gJrIrYmRqR4mtMXSqYBxYKr1ZXCxqUzhQ1I0qquSk4pC1YYqMWjT0Ky993R2F4YR6Q9sXorGKHSqv2nj1hWHGsgul9kV4p3YktlQaPgUoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QIme0Fg+uZTtWn9H8oTW4eOEugLYHN48ql9Jctj7TA=;
 b=H2/5uJ/H70qDkdKGw9+CZ44FldOs794HnR5fUI1Ct5wC3sUR2oHI/08Z+LaPynNOnfWS2TPWYgnuoEPbJ8WOpYf9C+T1vsUgTR9X3CXAWhss1gNuwdmT5HHUNP4E8JTrYtK+8ckhvqEIS2gfnDpaq6wgpBHzETM5LCWQqcxV1Q48vTYIMuxX4FkwRUgq4bzS7blZMUaiz8HBR0sdnLE6ZRQQWae7xJiVcsYcLrQerIoetNkfOKQp0ziBeJ96a25eFR9hQ1EKE/AnesI03xqA2l0xf/LwINphiXUajiIewY/b4o5aq7OZ1vylaWvoCRhqXEJcJRl4IZXt97Ek3o0mQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM7P189MB0850.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:173::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 14:23:50 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 14:23:50 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH v2 3/3] perl: fix CVE-2025-40909
Date: Tue, 21 Jul 2026 16:23:36 +0200
Message-ID: <20260721142336.21513-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260721142336.21513-1-jaipaul.cheernam@est.tech>
References: <20260721134616.16538-1-jaipaul.cheernam@est.tech>
 <20260721142336.21513-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0170.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::25) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM7P189MB0850:EE_
X-MS-Office365-Filtering-Correlation-Id: fd2e97e3-3123-4ffc-1eca-08dee733af66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|11063799006|4143699003|12006099003|56012099006|10067099003|25016099003|6133799003|29003799003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	KR/reyn4pq4Iv2zjvOXFnrrpXv/I62MhSQyDPcFtiU4/klAxeNO0tPQhR0LTa/jRksEV6MhaemT3+j2tHEMBJFWKtTGt6TLvie0EloxXd0pP/r/Zj0hbUbAC/xC93GKJC+M2vGSQjaHc3042zMy4tCixyPsXEFHp0SzFmb0BE3Tsa5wq/neC9cwsDPvi+fE7jihgEuKPyneN0mjqo2UGjzzZNgB5NP+9h6BJWcFVsbc0PiEeFFiGQSFc+0C0xW0QdSf69CHXYrIP3wJY0U8tHp3ykDSQSiFxz+sYLAawMgUwUdShPRRd0Lxa9+w+KfLY+Z+FohdDYc6YDbIp0/Rq7GG7vR6lfUPqz7gkZg+Tniq09wxtiPrORi+9uQ5bdGjWPFV5rPDP4BQNkaRlrfnbmyCXjzoz8ri5C+0NO7XFeccQUOaAdng99YwoPla4jwhluZNSUUX0gBb1a6QiMbjTpK4wPzjq5Mrly0HhruYsFuySD3r8DCOfanCB8eNK55lFkQnt/vuSO63GdmDxsnohfl8Pro2wLAJPzraqUFYV9n7gi7bJWhWx20uEAmnHRhRthSolciX3+CfOCv4ta1+zqH/8nGVgvikiZvu0gNKLzaGr1zhkT7V6Ld5MG37GxSZ9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(4143699003)(12006099003)(56012099006)(10067099003)(25016099003)(6133799003)(29003799003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6MdFDbzTQPxL+qQYVx8K8Vin9TKYK8i10zJKChn2opkltJoux6VOjO76GowR?=
 =?us-ascii?Q?eNzbd2OZi+uFzbt5e85PRTY45NtjO1uo3JJ9rtkDkx9a18dpSzI6JtFvoyaS?=
 =?us-ascii?Q?Fu9PBSUBwkpdOviz8ExxK1RsHhThHjum9F7/NUsv1TpA5JNJLi7yBqQHb7T/?=
 =?us-ascii?Q?aW9yFDi1m+/8KF0kIlP9lJxD3taQYp/quk3YzdivDWsIC/8rj9CRlhPdpDrI?=
 =?us-ascii?Q?SUjNVl9Xs/5+QmV/dhMYwiAk1Sec9ryw6jrsZats3Heoj+vJVvqafmiJM6ba?=
 =?us-ascii?Q?bNGHtCEG4UfbUPGe/Vvrq6bmdM6WqC9Hk+FK5WbGH+JrsKjWY251wNXwDc0y?=
 =?us-ascii?Q?h/KedlZ8reZ1ryN75r2jYpcSQsRNXGPw+847MqUM8ZpAzO5+ADOZfzXy4+Dv?=
 =?us-ascii?Q?bbuOmYFv8CfUTV7/jkgC6IgWkaNfjTwLf7Qi6iPsbKGA1zW9Dk3rMo0yJzK4?=
 =?us-ascii?Q?7DtzhW9HeFrRULYKTgrFapl7e5q8KM34B7+gLVZP00zCNvPLfInBYgJWusQE?=
 =?us-ascii?Q?1KNF1bPc9DLmOY8cDTnAwt070lfY2P6DjTJ4rSx9us397MOAEKM4GywOMGqz?=
 =?us-ascii?Q?hfYWRpVZBjYBKCgTvvolKTMXawSBVOp7HRNiq0r/IoqevUkry5myAwUY4id6?=
 =?us-ascii?Q?je4G3J18zuA1spazrZwa5iXnSvI9/m15NfE0LTTB4PS9XGBzFfEFscEoWoQv?=
 =?us-ascii?Q?JasZolyAFODOuNHvPeticbqOIni4eTNcIo3MXysky5yutHN3NqwDlARHHGRF?=
 =?us-ascii?Q?9LX/4+YwZKvi4i7GfzJoVthfaroCFiK3C8k35L3bJMmnSzWaVCMRjU+i9A8u?=
 =?us-ascii?Q?4RTUKIoJSXS26rTS/kfhkHMjyUWTvprecXDhPJqge7wn6c8iLSUDPoz33oju?=
 =?us-ascii?Q?fE9O74Nj9gHz7tlHlRSJ15+1UB5aAkyZgOimNgPcYqnn4fLeuotKovMUkYBS?=
 =?us-ascii?Q?+mAjlnD/6znTK3zxluHelprN84LfQ8uo7dhKd2rysFaWWJE+/je/W69s4jQO?=
 =?us-ascii?Q?R44/pUuIwuQpRwspFJ9+batV8lZyRk1yoWrHgJAaVq8Rom5+9DeDcvTIZchN?=
 =?us-ascii?Q?F843O9W3iw5Bc7caxv6aSgPsHsvGPaCElm/llXDXn3GJYmeuBAzmKdBlC5wu?=
 =?us-ascii?Q?nFPJ0C52WkR2WvRRwcoUBDXnhbCn6WQXv6ecY8xRoYsr5jvrgqXStOAM0Gni?=
 =?us-ascii?Q?c2qjuHmID6VWxq9k9dpdIvx+LoEbM+jcq+n4rnYYygAd4FPIAAzL7/+nqyFm?=
 =?us-ascii?Q?obNg/BGgRCgHDWFJ6LxUJKLChSsA2GH6Mhi3Y9valqbKDuczQ2PvcHcyj1JX?=
 =?us-ascii?Q?yAy3xNwfpharx1Xw3YRoSJNZ06mq7Zz3OlE3IDd//cnSbAcsORr7YceoMzgN?=
 =?us-ascii?Q?eqJL19WsXixzDg66/PaZ4G/kCgM3aAUDBL7F5VerPEaNfTm1SRLRh5T4oUNR?=
 =?us-ascii?Q?nNLNDgqbsO8n8uVGujzFxy9IQ8/XKe/PailkmAz7zfNUEJKlDROtC2AnXQzj?=
 =?us-ascii?Q?lXuIrLA5kXVTJgaHSgXGnHqXTwHHIL3STPW2w0rvUZ30gar3JdDKXJ7yLhQ7?=
 =?us-ascii?Q?DfkRjCPY8u0vhfo3ocaMGGwzXdNZzTnpjIjQr1pdNW+j57yOcJYF9wSMnEIi?=
 =?us-ascii?Q?2+ACTJaYm5vv4Ea2WCxoFoNqMw4qJDdh8FZ38iajfzOGKCxnBvIi6NLwtJo3?=
 =?us-ascii?Q?vjnHUk6poAUO5f9V3V7gFbMJDIYsWzQC0DVp4fJjURh2NikVF7sXRRjHX0xG?=
 =?us-ascii?Q?FKWcIMScbNlQ1V7nXKpY4WCvHCyd2tk=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2e97e3-3123-4ffc-1eca-08dee733af66
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 14:23:50.6625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ZRXx4WwH6H7QWrnP64KXazvMTTsuoMPJOHP2FV6W2nKyzhwW9FJtmUnFm5RHQtnBU9xgICHiiJlu3AY9HUIMXW5zbzENug3PgvBNtx+nqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0850
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 14:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241538

This patch applies the upstream fix as referenced in [1], using the
commit shown in [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-40909
[2] https://github.com/Perl/perl5/commit/918bfff86ca8d6d4e4ec5b30994451e0bd=
74aba9

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../perl-cross/files/CVE-2025-40909-dep.patch |  25 ++
 .../perl-cross/perlcross_1.6.2.bb             |   1 +
 .../perl/files/CVE-2025-40909.patch           | 412 ++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.38.4.bb     |   1 +
 4 files changed, 439 insertions(+)
 create mode 100644 meta/recipes-devtools/perl-cross/files/CVE-2025-40909-d=
ep.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2025-40909.patch

diff --git a/meta/recipes-devtools/perl-cross/files/CVE-2025-40909-dep.patc=
h b/meta/recipes-devtools/perl-cross/files/CVE-2025-40909-dep.patch
new file mode 100644
index 0000000000..d5d4bf279d
--- /dev/null
+++ b/meta/recipes-devtools/perl-cross/files/CVE-2025-40909-dep.patch
@@ -0,0 +1,25 @@
+From f702c387e6940fab3801d7562a668b974a2b3a8f Mon Sep 17 00:00:00 2001
+From: Audrey Dutcher <audrey@rhelmot.io>
+Date: Fri, 30 May 2025 12:29:54 -0700
+Subject: [PATCH] add d_fdopendir configuration
+
+Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/159]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ cnf/configure_func.sh | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/cnf/configure_func.sh b/cnf/configure_func.sh
+index 4c13e4c..b24fe03 100644
+--- a/cnf/configure_func.sh
++++ b/cnf/configure_func.sh
+@@ -83,6 +83,7 @@ checkfunc d_fchmodat 'fchmodat' "0,NULL,0,0" 'unistd.h s=
ys/stat.h'
+ checkfunc d_fchown 'fchown' "0,0,0" 'unistd.h'
+ checkfunc d_fcntl 'fcntl' "0,0" 'unistd.h fcntl.h'
+ checkfunc d_fdclose 'fdclose' "NULL,NULL" 'stdio.h'
++checkfunc d_fdopendir 'fdopendir' "0" 'dirent.h'
+ checkfunc d_ffs 'ffs' "0" 'strings.h'
+ checkfunc d_ffsl 'ffsl' "0" 'strings.h'
+ checkfunc d_fgetpos 'fgetpos' "NULL, 0" 'stdio.h'
+--=20
+2.43.0
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb b/meta/rec=
ipes-devtools/perl-cross/perlcross_1.6.2.bb
index e4bd90c572..1c5fc27d97 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
@@ -15,6 +15,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/perl-cross=
-${PV}.tar.gz;name=3Dperl-c
            file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://determinism.patch \
            file://0001-Makefile-check-the-file-if-patched-or-not.patch \
+           file://CVE-2025-40909-dep.patch \
            "
 GITHUB_BASE_URI =3D "https://github.com/arsv/perl-cross/releases/"
=20
diff --git a/meta/recipes-devtools/perl/files/CVE-2025-40909.patch b/meta/r=
ecipes-devtools/perl/files/CVE-2025-40909.patch
new file mode 100644
index 0000000000..c9418a3574
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2025-40909.patch
@@ -0,0 +1,412 @@
+From 918bfff86ca8d6d4e4ec5b30994451e0bd74aba9 Mon Sep 17 00:00:00 2001
+From: Leon Timmermans <fawaka@gmail.com>
+Date: Fri, 23 May 2025 15:40:41 +0200
+Subject: [PATCH] CVE-2025-40909: Clone dirhandles without fchdir
+
+This uses fdopendir and dup to dirhandles. This means it won't change
+working directory during thread cloning, which prevents race conditions
+that can happen if a third thread is active at the same time.
+
+CVE: CVE-2025-40909
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/918bfff86c=
a8d6d4e4ec5b30994451e0bd74aba9]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ Configure                      |   6 ++
+ Cross/config.sh-arm-linux      |   1 +
+ Cross/config.sh-arm-linux-n770 |   1 +
+ Porting/Glossary               |   5 ++
+ Porting/config.sh              |   1 +
+ config_h.SH                    |   6 ++
+ configure.com                  |   1 +
+ plan9/config_sh.sample         |   1 +
+ sv.c                           |  91 +----------------------------
+ t/op/threads-dirh.t            | 104 +--------------------------------
+ win32/config.gc                |   1 +
+ win32/config.vc                |   1 +
+ 12 files changed, 28 insertions(+), 191 deletions(-)
+
+diff --git a/Configure b/Configure
+index 44c12ced4014..7a13249caa96 100755
+--- a/Configure
++++ b/Configure
+@@ -478,6 +478,7 @@ d_fd_set=3D''
+ d_fds_bits=3D''
+ d_fdclose=3D''
+ d_fdim=3D''
++d_fdopendir=3D''
+ d_fegetround=3D''
+ d_ffs=3D''
+ d_ffsl=3D''
+@@ -13344,6 +13345,10 @@ esac
+ set i_fcntl
+ eval $setvar
+=20
++: see if fdopendir exists
++set fdopendir d_fdopendir
++eval $inlibc
++
+ : see if fork exists
+ set fork d_fork
+ eval $inlibc
+@@ -25052,6 +25057,7 @@ d_flockproto=3D'$d_flockproto'
+ d_fma=3D'$d_fma'
+ d_fmax=3D'$d_fmax'
+ d_fmin=3D'$d_fmin'
++d_fdopendir=3D'$d_fdopendir'
+ d_fork=3D'$d_fork'
+ d_fp_class=3D'$d_fp_class'
+ d_fp_classify=3D'$d_fp_classify'
+diff --git a/Cross/config.sh-arm-linux b/Cross/config.sh-arm-linux
+index bfa0b00d5f0f..9e056539198b 100644
+--- a/Cross/config.sh-arm-linux
++++ b/Cross/config.sh-arm-linux
+@@ -212,6 +212,7 @@ d_fd_macros=3D'define'
+ d_fd_set=3D'define'
+ d_fdclose=3D'undef'
+ d_fdim=3D'undef'
++d_fdopendir=3Dundef
+ d_fds_bits=3D'undef'
+ d_fegetround=3D'define'
+ d_ffs=3D'undef'
+diff --git a/Cross/config.sh-arm-linux-n770 b/Cross/config.sh-arm-linux-n7=
70
+index 47ad5c37e3fd..365e4c4f9671 100644
+--- a/Cross/config.sh-arm-linux-n770
++++ b/Cross/config.sh-arm-linux-n770
+@@ -211,6 +211,7 @@ d_fd_macros=3D'define'
+ d_fd_set=3D'define'
+ d_fdclose=3D'undef'
+ d_fdim=3D'undef'
++d_fdopendir=3Dundef
+ d_fds_bits=3D'undef'
+ d_fegetround=3D'define'
+ d_ffs=3D'undef'
+diff --git a/Porting/Glossary b/Porting/Glossary
+index bb505c653b0b..8b2965ca99c6 100644
+--- a/Porting/Glossary
++++ b/Porting/Glossary
+@@ -947,6 +947,11 @@ d_fmin (d_fmin.U):
+ 	This variable conditionally defines the HAS_FMIN symbol, which
+ 	indicates to the C program that the fmin() routine is available.
+=20
++d_fdopendir (d_fdopendir.U):
++	This variable conditionally defines the HAS_FORK symbol, which
++	indicates that the fdopen routine is available to open a
++	directory descriptor.
++
+ d_fork (d_fork.U):
+ 	This variable conditionally defines the HAS_FORK symbol, which
+ 	indicates to the C program that the fork() routine is available.
+diff --git a/Porting/config.sh b/Porting/config.sh
+index a921f7e1c79a..6231ea0f31ea 100644
+--- a/Porting/config.sh
++++ b/Porting/config.sh
+@@ -223,6 +223,7 @@ d_fd_macros=3D'define'
+ d_fd_set=3D'define'
+ d_fdclose=3D'undef'
+ d_fdim=3D'define'
++d_fdopendir=3D'define'
+ d_fds_bits=3D'define'
+ d_fegetround=3D'define'
+ d_ffs=3D'define'
+diff --git a/config_h.SH b/config_h.SH
+index da0f2dbcd7b7..5a0f81cf2011 100755
+--- a/config_h.SH
++++ b/config_h.SH
+@@ -142,6 +142,12 @@ sed <<!GROK!THIS! >$CONFIG_H -e 's!^#undef\(.*/\)\*!/=
\*#define\1 \*!' -e 's!^#un
+  */
+ #$d_fcntl HAS_FCNTL		/**/
+=20
++/* HAS_FDOPENDIR:
++ * This symbol, if defined, indicates that the fdopen routine is
++ * available to open a directory descriptor.
++ */
++#$d_fdopendir HAS_FDOPENDIR		/**/
++
+ /* HAS_FGETPOS:
+  *	This symbol, if defined, indicates that the fgetpos routine is
+  *	available to get the file position indicator, similar to ftell().
+diff --git a/configure.com b/configure.com
+index 99527c180bfc..7c38711bb85d 100644
+--- a/configure.com
++++ b/configure.com
+@@ -6010,6 +6010,7 @@ $ WC "d_fd_set=3D'" + d_fd_set + "'"
+ $ WC "d_fd_macros=3D'define'"
+ $ WC "d_fdclose=3D'undef'"
+ $ WC "d_fdim=3D'" + d_fdim + "'"
++$ WC "d_fdopendir=3D'undef'"
+ $ WC "d_fds_bits=3D'define'"
+ $ WC "d_fegetround=3D'undef'"
+ $ WC "d_ffs=3D'undef'"
+diff --git a/plan9/config_sh.sample b/plan9/config_sh.sample
+index 636acbdf6db3..246bad954424 100644
+--- a/plan9/config_sh.sample
++++ b/plan9/config_sh.sample
+@@ -212,6 +212,7 @@ d_fd_macros=3D'undef'
+ d_fd_set=3D'undef'
+ d_fdclose=3D'undef'
+ d_fdim=3D'undef'
++d_fdopendir=3Dundef
+ d_fds_bits=3D'undef'
+ d_fegetround=3D'undef'
+ d_ffs=3D'undef'
+diff --git a/sv.c b/sv.c
+index ae6d09dea28a..8a005b2d165b 100644
+--- a/sv.c
++++ b/sv.c
+@@ -14096,15 +14096,6 @@ Perl_dirp_dup(pTHX_ DIR *const dp, CLONE_PARAMS *=
const param)
+ {
+     DIR *ret;
+=20
+-#if defined(HAS_FCHDIR) && defined(HAS_TELLDIR) && defined(HAS_SEEKDIR)
+-    DIR *pwd;
+-    const Direntry_t *dirent;
+-    char smallbuf[256]; /* XXX MAXPATHLEN, surely? */
+-    char *name =3D NULL;
+-    STRLEN len =3D 0;
+-    long pos;
+-#endif
+-
+     PERL_UNUSED_CONTEXT;
+     PERL_ARGS_ASSERT_DIRP_DUP;
+=20
+@@ -14116,89 +14107,13 @@ Perl_dirp_dup(pTHX_ DIR *const dp, CLONE_PARAMS =
*const param)
+     if (ret)
+         return ret;
+=20
+-#if defined(HAS_FCHDIR) && defined(HAS_TELLDIR) && defined(HAS_SEEKDIR)
++#ifdef HAS_FDOPENDIR
+=20
+     PERL_UNUSED_ARG(param);
+=20
+-    /* create anew */
+-
+-    /* open the current directory (so we can switch back) */
+-    if (!(pwd =3D PerlDir_open("."))) return (DIR *)NULL;
+-
+-    /* chdir to our dir handle and open the present working directory */
+-    if (fchdir(my_dirfd(dp)) < 0 || !(ret =3D PerlDir_open("."))) {
+-        PerlDir_close(pwd);
+-        return (DIR *)NULL;
+-    }
+-    /* Now we should have two dir handles pointing to the same dir. */
+-
+-    /* Be nice to the calling code and chdir back to where we were. */
+-    /* XXX If this fails, then what? */
+-    PERL_UNUSED_RESULT(fchdir(my_dirfd(pwd)));
++    ret =3D fdopendir(dup(my_dirfd(dp)));
+=20
+-    /* We have no need of the pwd handle any more. */
+-    PerlDir_close(pwd);
+-
+-#ifdef DIRNAMLEN
+-# define d_namlen(d) (d)->d_namlen
+-#else
+-# define d_namlen(d) strlen((d)->d_name)
+-#endif
+-    /* Iterate once through dp, to get the file name at the current posi-
+-       tion. Then step back. */
+-    pos =3D PerlDir_tell(dp);
+-    if ((dirent =3D PerlDir_read(dp))) {
+-        len =3D d_namlen(dirent);
+-        if (len > sizeof(dirent->d_name) && sizeof(dirent->d_name) > PTRS=
IZE) {
+-            /* If the len is somehow magically longer than the
+-             * maximum length of the directory entry, even though
+-             * we could fit it in a buffer, we could not copy it
+-             * from the dirent.  Bail out. */
+-            PerlDir_close(ret);
+-            return (DIR*)NULL;
+-        }
+-        if (len <=3D sizeof smallbuf) name =3D smallbuf;
+-        else Newx(name, len, char);
+-        Move(dirent->d_name, name, len, char);
+-    }
+-    PerlDir_seek(dp, pos);
+-
+-    /* Iterate through the new dir handle, till we find a file with the
+-       right name. */
+-    if (!dirent) /* just before the end */
+-        for(;;) {
+-            pos =3D PerlDir_tell(ret);
+-            if (PerlDir_read(ret)) continue; /* not there yet */
+-            PerlDir_seek(ret, pos); /* step back */
+-            break;
+-        }
+-    else {
+-        const long pos0 =3D PerlDir_tell(ret);
+-        for(;;) {
+-            pos =3D PerlDir_tell(ret);
+-            if ((dirent =3D PerlDir_read(ret))) {
+-                if (len =3D=3D (STRLEN)d_namlen(dirent)
+-                    && memEQ(name, dirent->d_name, len)) {
+-                    /* found it */
+-                    PerlDir_seek(ret, pos); /* step back */
+-                    break;
+-                }
+-                /* else we are not there yet; keep iterating */
+-            }
+-            else { /* This is not meant to happen. The best we can do is
+-                      reset the iterator to the beginning. */
+-                PerlDir_seek(ret, pos0);
+-                break;
+-            }
+-        }
+-    }
+-#undef d_namlen
+-
+-    if (name && name !=3D smallbuf)
+-        Safefree(name);
+-#endif
+-
+-#ifdef WIN32
++#elif defined(WIN32)
+     ret =3D win32_dirp_dup(dp, param);
+ #endif
+=20
+diff --git a/t/op/threads-dirh.t b/t/op/threads-dirh.t
+index bb4bcfc14184..14c399ca19cd 100644
+--- a/t/op/threads-dirh.t
++++ b/t/op/threads-dirh.t
+@@ -13,16 +13,12 @@ BEGIN {
+      skip_all_if_miniperl("no dynamic loading on miniperl, no threads");
+      skip_all("runs out of memory on some EBCDIC") if $ENV{PERL_SKIP_BIG_=
MEM_TESTS};
+=20
+-     plan(6);
++     plan(1);
+ }
+=20
+ use strict;
+ use warnings;
+ use threads;
+-use threads::shared;
+-use File::Path;
+-use File::Spec::Functions qw 'updir catdir';
+-use Cwd 'getcwd';
+=20
+ # Basic sanity check: make sure this does not crash
+ fresh_perl_is <<'# this is no comment', 'ok', {}, 'crash when duping dirh=
';
+@@ -31,101 +27,3 @@ fresh_perl_is <<'# this is no comment', 'ok', {}, 'cra=
sh when duping dirh';
+    async{}->join for 1..2;
+    print "ok";
+ # this is no comment
+-
+-my $dir;
+-SKIP: {
+- skip "telldir or seekdir not defined on this platform", 5
+-    if !$Config::Config{d_telldir} || !$Config::Config{d_seekdir};
+- my $skip =3D sub {
+-   chdir($dir);
+-   chdir updir;
+-   skip $_[0], 5
+- };
+-
+- if(!$Config::Config{d_fchdir} && $^O ne "MSWin32") {
+-  $::TODO =3D 'dir handle cloning currently requires fchdir on non-Window=
s platforms';
+- }
+-
+- my @w :shared; # warnings accumulator
+- local $SIG{__WARN__} =3D sub { push @w, $_[0] };
+-
+- $dir =3D catdir getcwd(), "thrext$$" . int rand() * 100000;
+-
+- rmtree($dir) if -d $dir;
+- mkdir($dir);
+-
+- # Create a dir structure like this:
+- #   $dir
+- #     |
+- #     `- toberead
+- #            |
+- #            +---- thrit
+- #            |
+- #            +---- rile
+- #            |
+- #            `---- zor
+-
+- chdir($dir);
+- mkdir 'toberead';
+- chdir 'toberead';
+- {open my $fh, ">thrit" or &$skip("Cannot create file thrit")}
+- {open my $fh, ">rile" or &$skip("Cannot create file rile")}
+- {open my $fh, ">zor" or &$skip("Cannot create file zor")}
+- chdir updir;
+-
+- # Then test that dir iterators are cloned correctly.
+-
+- opendir my $toberead, 'toberead';
+- my $start_pos =3D telldir $toberead;
+- my @first_2 =3D (scalar readdir $toberead, scalar readdir $toberead);
+- my @from_thread =3D @{; async { [readdir $toberead ] } ->join };
+- my @from_main =3D readdir $toberead;
+- is join('-', sort @from_thread), join('-', sort @from_main),
+-     'dir iterator is copied from one thread to another';
+- like
+-   join('-', "", sort(@first_2, @from_thread), ""),
+-   qr/(?<!-rile)-rile-thrit-zor-(?!zor-)/i,
+-  'cloned iterator iterates exactly once over everything not already seen=
';
+-
+- seekdir $toberead, $start_pos;
+- readdir $toberead for 1 .. @first_2+@from_thread;
+- {
+-  local $::TODO; # This always passes when dir handles are not cloned.
+-  is
+-    async { readdir $toberead // 'undef' } ->join, 'undef',
+-   'cloned dir iterator that points to the end of the directory'
+-  ;
+- }
+-
+- # Make sure the cloning code can handle file names longer than 255 chars
+- SKIP: {
+-  chdir 'toberead';
+-  open my $fh,
+-    ">floccipaucinihilopilification-"
+-   . "pneumonoultramicroscopicsilicovolcanoconiosis-"
+-   . "lopadotemachoselachogaleokranioleipsanodrimypotrimmatosilphiokarabo=
"
+-   . "melitokatakechymenokichlepikossyphophattoperisteralektryonoptokepha=
l"
+-   . "liokinklopeleiolagoiosiraiobaphetraganopterygon"
+-    or
+-     chdir updir,
+-     skip("OS does not support long file names (and I mean *long*)", 1);
+-  chdir updir;
+-  opendir my $dirh, "toberead";
+-  my $test_name
+-    =3D "dir iterators can be cloned when the next fn > 255 chars";
+-  while() {
+-   my $pos =3D telldir $dirh;
+-   my $fn =3D readdir($dirh);
+-   if(!defined $fn) { fail($test_name); last SKIP; }
+-   if($fn =3D~ 'lagoio') {=20
+-    seekdir $dirh, $pos;
+-    last;
+-   }
+-  }
+-  is length async { scalar readdir $dirh } ->join, 258, $test_name;
+- }
+-
+- is scalar @w, 0, 'no warnings during all that' or diag @w;
+- chdir updir;
+-}
+-rmtree($dir);
+diff --git a/win32/config.gc b/win32/config.gc
+index f8776188c09c..34aa8de6ed75 100644
+--- a/win32/config.gc
++++ b/win32/config.gc
+@@ -199,6 +199,7 @@ d_fd_macros=3D'define'
+ d_fd_set=3D'define'
+ d_fdclose=3D'undef'
+ d_fdim=3D'undef'
++d_fdopendir=3D'undef'
+ d_fds_bits=3D'define'
+ d_fegetround=3D'undef'
+ d_ffs=3D'undef'
+diff --git a/win32/config.vc b/win32/config.vc
+index 619979e22b53..536085fe94e0 100644
+--- a/win32/config.vc
++++ b/win32/config.vc
+@@ -199,6 +199,7 @@ d_fd_macros=3D'define'
+ d_fd_set=3D'define'
+ d_fdclose=3D'undef'
+ d_fdim=3D'undef'
++d_fdopendir=3D'undef'
+ d_fds_bits=3D'define'
+ d_fegetround=3D'undef'
+ d_ffs=3D'undef'
diff --git a/meta/recipes-devtools/perl/perl_5.38.4.bb b/meta/recipes-devto=
ols/perl/perl_5.38.4.bb
index b4927646d7..b86c58f540 100644
--- a/meta/recipes-devtools/perl/perl_5.38.4.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.4.bb
@@ -23,6 +23,7 @@ SRC_URI =3D "https://www.cpan.org/src/5.0/perl-${PV}.tar.=
gz;name=3Dperl \
            file://CVE-2026-13221.patch \
            file://CVE-2026-57432-01.patch \
            file://CVE-2026-57432-02.patch \
+           file://CVE-2025-40909.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://perl-configpm-switch.patch \

