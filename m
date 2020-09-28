Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.40593.1601309950146722008
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 09:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AC5331B
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 09:19:07 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15B613F6CF
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 09:19:06 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] glibc: make nscd optional
Date: Mon, 28 Sep 2020 17:18:54 +0100
Message-Id: <20200928161900.452970-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

NSCD itself is already packaged into its own package, but if it is never
going to be needed then it can be disabled and it won't be called from
glibc at all.  Add a PACKAGECONFIG for NSCD that is enabled by default.

As a side effect if NSCD is disable, glibc with and without systemd is
binary identical, which helps sstate reuse.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glibc/glibc_2.32.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.32.bb b/meta/recipes-core/gl=
ibc/glibc_2.32.bb
index 7049e61625..2a0e464385 100644
--- a/meta/recipes-core/glibc/glibc_2.32.bb
+++ b/meta/recipes-core/glibc/glibc_2.32.bb
@@ -69,13 +69,15 @@ EXTRA_OECONF =3D "--enable-kernel=3D${OLDEST_KERNEL} =
\
                 --enable-stackguard-randomization \
                 --disable-crypt \
                 --with-default-link \
-                --enable-nscd \
                 ${@bb.utils.contains_any('SELECTED_OPTIMIZATION', '-O0 -=
Og', '--disable-werror', '', d)} \
                 ${GLIBCPIE} \
                 ${GLIBC_EXTRA_OECONF}"
=20
 EXTRA_OECONF +=3D "${@get_libc_fpu_setting(bb, d)}"
=20
+PACKAGECONFIG ??=3D "nscd"
+PACKAGECONFIG[nscd] =3D "--enable-nscd,--disable-nscd"
+
 do_patch_append() {
     bb.build.exec_func('do_fix_readlib_c', d)
 }
--=20
2.25.1

