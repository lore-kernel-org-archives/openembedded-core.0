Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1675C36013
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 21:36:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1008.1743111397399941690
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 14:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF16B1BC0
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 14:36:41 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 66B713F63F
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 14:36:36 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] coreutils: fix cksum on musl
Date: Thu, 27 Mar 2025 21:36:26 +0000
Message-ID: <20250327213627.530742-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327213627.530742-1-ross.burton@arm.com>
References: <20250327213627.530742-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 21:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213789

musl has subtly different type definitions to glibc, which broke cksum
under musl. Backport a patch from upstream to fix this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...1-cksum-port-to-32-bit-uint_fast32_t.patch | 47 +++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.6.bb  |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/0001-cksum-port=
-to-32-bit-uint_fast32_t.patch

diff --git a/meta/recipes-core/coreutils/coreutils/0001-cksum-port-to-32-=
bit-uint_fast32_t.patch b/meta/recipes-core/coreutils/coreutils/0001-cksu=
m-port-to-32-bit-uint_fast32_t.patch
new file mode 100644
index 00000000000..95d7aca8092
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/0001-cksum-port-to-32-bit-uin=
t_fast32_t.patch
@@ -0,0 +1,47 @@
+From 7eada35b4fbb48e7fe430d1b18dae7d191f84f8e Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Mon, 17 Feb 2025 02:27:09 -0800
+Subject: [PATCH 2/2] cksum: port to 32-bit uint_fast32_t
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+* src/cksum_vmull.c (cksum_vmull): Don=E2=80=99t assume
+uint_fast32_t can hold 64 bits.
+Problem reported by Alyssa Ross (Bug#76360).
+
+Upstream-Status: Backport [7eada35b4fbb48e7fe430d1b18dae7d191f84f8e]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ NEWS              | 3 +++
+ src/cksum_vmull.c | 7 +++++--
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/cksum_vmull.c b/src/cksum_vmull.c
+index 7611c4244..0ff81e225 100644
+--- a/src/cksum_vmull.c
++++ b/src/cksum_vmull.c
+@@ -92,7 +92,9 @@ cksum_vmull (FILE *fp, uint_fast32_t *crc_out, uintmax=
_t *length_out)
+           data =3D bswap_neon (data);
+           /* XOR in initial CRC value (for us 0 so no effect), or CRC v=
alue
+              calculated for previous BUFLEN buffer from fread */
+-          xor_crc =3D vcombine_u64 (vcreate_u64 (0), vcreate_u64 (crc <=
< 32));
++
++          uint64_t wcrc =3D crc;
++          xor_crc =3D vcombine_u64 (vcreate_u64 (0), vcreate_u64 (wcrc =
<< 32));
+           crc =3D 0;
+           data =3D veorq_u64 (data, xor_crc);
+           data3 =3D vld1q_u64 ((uint64_t *) (datap + 1));
+@@ -193,7 +195,8 @@ cksum_vmull (FILE *fp, uint_fast32_t *crc_out, uintm=
ax_t *length_out)
+         {
+           data =3D vld1q_u64 ((uint64_t *) (datap));
+           data =3D bswap_neon (data);
+-          xor_crc =3D vcombine_u64 (vcreate_u64 (0), vcreate_u64 (crc <=
< 32));
++          uint64_t wcrc =3D crc;
++          xor_crc =3D vcombine_u64 (vcreate_u64 (0), vcreate_u64 (wcrc =
<< 32));
+           crc =3D 0;
+           data =3D veorq_u64 (data, xor_crc);
+           while (bytes_read >=3D 32)
+--=20
+2.45.2
+
diff --git a/meta/recipes-core/coreutils/coreutils_9.6.bb b/meta/recipes-=
core/coreutils/coreutils_9.6.bb
index d89c75ba665..b876a8fdd05 100644
--- a/meta/recipes-core/coreutils/coreutils_9.6.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.6.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
            file://intermittent-testfailure.patch \
            file://0001-ls-fix-crash-with-context.patch \
+           file://0001-cksum-port-to-32-bit-uint_fast32_t.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] =3D "7a0124327b398fd9eb1a6abde583389821422c744ffa1073=
4b24f557610d3283"
--=20
2.43.0


