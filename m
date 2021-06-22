Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.98.1624379064476217454
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 09:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C1DBED1
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 09:16:54 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14DC43F718
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 09:16:53 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 2/2] glibc: re-enable memory tagging
Date: Tue, 22 Jun 2021 17:16:45 +0100
Message-Id: <20210622161645.1449290-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622161645.1449290-1-ross.burton@arm.com>
References: <20210622161645.1449290-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Now that the performance regressions caused by MTE have been resolved, we
can enable memory tagging again.

It is safe to globally enable the config as glibc does nothing if it isn'=
t
supported on that target.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glibc/glibc_2.33.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/gl=
ibc/glibc_2.33.bb
index c6e4aaab9d7..925efe8cc62 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -92,7 +92,7 @@ EXTRA_OECONF +=3D "${@get_libc_fpu_setting(bb, d)}"
 EXTRA_OECONF_append_x86 =3D " --enable-cet"
 EXTRA_OECONF_append_x86-64 =3D " --enable-cet"
=20
-PACKAGECONFIG ??=3D "nscd"
+PACKAGECONFIG ??=3D "nscd memory-tagging"
 PACKAGECONFIG[nscd] =3D "--enable-nscd,--disable-nscd"
 PACKAGECONFIG[memory-tagging] =3D "--enable-memory-tagging,--disable-mem=
ory-tagging"
=20
--=20
2.25.1

