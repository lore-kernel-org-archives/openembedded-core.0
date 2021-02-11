Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9391.1613054810747081433
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 06:46:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70A9731B
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 06:46:49 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19F9C3F73D
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 06:46:48 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glibc: add workaround for faccessat2 being blocked by seccomp filters
Date: Thu, 11 Feb 2021 14:46:45 +0000
Message-Id: <20210211144645.1458075-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Older seccomp-based filters used in container frameworks will block facce=
ssat2
calls as it's a relatively new syscall.  This isn't a big problem with
glibc <2.33 but 2.33 will call faccessat2 itself, get EPERM, and thenn be=
 confused
about what to do as EPERM isn't an expected error code.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../glibc/glibc/faccessat2-perm.patch         | 31 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.33.bb         |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/faccessat2-perm.patch

diff --git a/meta/recipes-core/glibc/glibc/faccessat2-perm.patch b/meta/r=
ecipes-core/glibc/glibc/faccessat2-perm.patch
new file mode 100644
index 0000000000..2ee7110ca1
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/faccessat2-perm.patch
@@ -0,0 +1,31 @@
+Older seccomp-based filters used in container frameworks will block facc=
essat2
+calls as it's a relatively new syscall.  This isn't a big problem with
+glibc <2.33 but 2.33 will call faccessat2 itself, get EPERM, and thenn b=
e confused
+about what to do as EPERM isn't an expected error code.
+
+This manifests itself as mysterious errors, for example a kernel failing=
 to link.
+
+The root cause of bad seccomp filters is mostly fixed (systemd 247, Dock=
er 20.10.0)
+but we can't expect everyone to upgrade, so add a workaound (originally =
from=20
+Red Hat) to handle EPERM like ENOSYS and fallback to faccessat().
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/sysdeps/unix/sysv/linux/faccessat.c b/sysdeps/unix/sysv/lin=
ux/faccessat.c
+index 56cb6dcc8b4d58d3..5de75032bbc93a2c 100644
+--- a/sysdeps/unix/sysv/linux/faccessat.c
++++ b/sysdeps/unix/sysv/linux/faccessat.c
+@@ -34,7 +34,11 @@ faccessat (int fd, const char *file, int mode, int fl=
ag)
+ #if __ASSUME_FACCESSAT2
+   return ret;
+ #else
+-  if (ret =3D=3D 0 || errno !=3D ENOSYS)
++  /* Fedora-specific workaround:
++     As a workround for a broken systemd-nspawn that returns
++     EPERM when a syscall is not allowed instead of ENOSYS
++     we must check for EPERM here and fall back to faccessat.  */
++  if (ret =3D=3D 0 || !(errno =3D=3D ENOSYS || errno =3D=3D EPERM))
+     return ret;
+=20
+   if (flag & ~(AT_SYMLINK_NOFOLLOW | AT_EACCESS))
diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/gl=
ibc/glibc_2.33.bb
index 4085c779eb..e0002e6046 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -12,6 +12,7 @@ NATIVESDKFIXES_class-nativesdk =3D "\
            file://0005-nativesdk-glibc-Raise-the-size-of-arrays-containi=
ng-.patch \
            file://0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patc=
h \
            file://0007-nativesdk-glibc-Make-relocatable-install-for-loca=
les.patch \
+           file://faccessat2-perm.patch \
 "
=20
 SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
--=20
2.25.1

