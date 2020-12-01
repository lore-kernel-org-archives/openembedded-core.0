Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.11527.1606836189996738592
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 07:23:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEBE830E
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Dec 2020 07:23:08 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A2B53F575
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Dec 2020 07:23:08 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] ldconfig-native: don't write auxiliary cache
Date: Tue,  1 Dec 2020 15:23:00 +0000
Message-Id: <20201201152305.2375723-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The auxiliary cache written by ldconfig is only useful for speeding up
future runs of ldconfig, and as it contains inode numbers as the keys
in a dictionary it is entirely pointless to generate on the build host.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../ldconfig-native-2.12.1/no-aux-cache.patch | 19 +++++++++++++++++++
 .../glibc/ldconfig-native_2.12.1.bb           |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-core/glibc/ldconfig-native-2.12.1/no-aux=
-cache.patch

diff --git a/meta/recipes-core/glibc/ldconfig-native-2.12.1/no-aux-cache.=
patch b/meta/recipes-core/glibc/ldconfig-native-2.12.1/no-aux-cache.patch
new file mode 100644
index 00000000000..c6765ba00d2
--- /dev/null
+++ b/meta/recipes-core/glibc/ldconfig-native-2.12.1/no-aux-cache.patch
@@ -0,0 +1,19 @@
+The ldconfig auxiliary cache is a dictionary where the keys include inod=
e, so
+there is no point in writing these files on the build host.=20
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/ldconfig.c b/ldconfig.c
+index 2c4eb57..2d6dc92 100644
+--- a/ldconfig.c
++++ b/ldconfig.c
+@@ -1399,8 +1399,6 @@ main (int argc, char **argv)
+   if (opt_build_cache)
+     {
+       save_cache (cache_file);
+-      if (aux_cache_file)
+-        save_aux_cache (aux_cache_file);
+     }
+=20
+   return 0;
diff --git a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb b/meta/rec=
ipes-core/glibc/ldconfig-native_2.12.1.bb
index 93c0b186714..919d11417d3 100644
--- a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
+++ b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "file://ldconfig-native-2.12.1.tar.bz2 \
            file://ldconfig-default-to-all-multilib-dirs.patch \
            file://endian-ness_handling_fix.patch \
            file://add-64-bit-flag-for-ELF64-entries.patch \
+           file://no-aux-cache.patch \
 "
=20
 PR =3D "r2"
--=20
2.25.1

