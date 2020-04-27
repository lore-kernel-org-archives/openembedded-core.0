Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.820.1587967476405819560
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2020 23:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 03R64XTY003467
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sun, 26 Apr 2020 23:04:34 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Sun, 26 Apr 2020 23:04:20 -0700
From: "kai" <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] pseudo: add macro guard for seccomp
Date: Mon, 27 Apr 2020 14:04:16 +0800
Message-ID: <20200427060416.40326-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id 03R64XTY003467
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Kai Kang <kai.kang@windriver.com>

It fails to compile pseudo-native on centos 7:

| ports/linux/pseudo_wrappers.c: In function =E2=80=98prctl=E2=80=99:
| ports/linux/pseudo_wrappers.c:129:14: error: =E2=80=98SECCOMP_SET_MODE_=
FILTER=E2=80=99 undeclared (first use in this function)
|    if (cmd =3D=3D SECCOMP_SET_MODE_FILTER) {
|               ^

Add macro guard for seccomp to avoid the failure.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/pseudo/files/seccomp.patch | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/files/seccomp.patch b/meta/reci=
pes-devtools/pseudo/files/seccomp.patch
index be42eaf353..2bad8dae28 100644
--- a/meta/recipes-devtools/pseudo/files/seccomp.patch
+++ b/meta/recipes-devtools/pseudo/files/seccomp.patch
@@ -7,6 +7,17 @@ Upstream-Status: Pending
 RP 2020/4/3
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
=20
+It fails to compile pseudo-native on centos 7:
+
+| ports/linux/pseudo_wrappers.c: In function =E2=80=98prctl=E2=80=99:
+| ports/linux/pseudo_wrappers.c:129:14: error: =E2=80=98SECCOMP_SET_MODE=
_FILTER=E2=80=99 undeclared (first use in this function)
+|    if (cmd =3D=3D SECCOMP_SET_MODE_FILTER) {
+|               ^
+
+Add macro guard for seccomp to avoid the failure.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
 Index: git/ports/linux/pseudo_wrappers.c
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 --- git.orig/ports/linux/pseudo_wrappers.c
@@ -40,7 +51,7 @@ Index: git/ports/linux/pseudo_wrappers.c
  	/* gcc magic to attempt to just pass these args to syscall. we have to
  	 * guess about the number of args; the docs discuss calling convention=
s
  	 * up to 7, so let's try that?
-@@ -92,3 +108,42 @@ static long wrap_syscall(long nr, va_lis
+@@ -92,3 +108,44 @@ static long wrap_syscall(long nr, va_lis
  	(void) ap;
  	return -1;
  }
@@ -56,6 +67,7 @@ Index: git/ports/linux/pseudo_wrappers.c
 +		return rc;
 +	}
 +
++#ifdef SYS_seccomp
 +	/* pseudo and seccomp are incompatible as pseudo uses different syscal=
ls
 +	 * so pretend to enable seccomp but really do nothing */
 +	if (option =3D=3D PR_SET_SECCOMP) {
@@ -67,6 +79,7 @@ Index: git/ports/linux/pseudo_wrappers.c
 +		    return 0;
 +		}
 +	}
++#endif
 +
 +	/* gcc magic to attempt to just pass these args to prctl. we have to
 +	 * guess about the number of args; the docs discuss calling convention=
s
--=20
2.17.1

