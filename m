Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12096.1793715068389651474
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 06:11:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=CJac/Gub;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD60E1595
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Nov 2026 06:11:04 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 677353F628
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Nov 2026 06:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793715067; bh=NOd7DpYkrWRqWmAfYu/rpvuXzsdHhdzLeSH1ZtJVDXA=;
	h=From:To:Subject:Date:From;
	b=CJac/GubFjjMGNYw/tkq5slQXSmGvtH3CJg7A/DiieO8pxj29lb+liinrRwl3YeqP
	 w7rykLc0DvFT96yuuTUu93Lf9aB9ga6+1UczQgV/g5YO8cy8SvwWSJgcW1l6fzWqZe
	 MnrwD6108BNDG0wGaBnaI4HiVJvmi+pv6GxsyFTs=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] automake: drop obsolete "remove delays in configure scripts" patch
Date: Tue,  3 Nov 2026 14:11:05 +0000
Message-ID: <20261103141106.3603936-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 14:11:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249283
Content-Type: text/plain; charset="utf-8"

When this patch was created, automake was putting sleeps in configure
scripts to ensure that files were newer.

However, a number of patches in 1.17 have made this change obsolete:

- automake fad36f78a ("automake: omit 1s test in _AM_FILESYSTEM_TIMESTAMP=
_RESOLUTION, for speed.")
- automake df2ff7cb6 ("automake: omit make subsecond tests if at one-seco=
nd resolution.")
- automake cfdb83d42 ("automake: again revise file mtime resolution suppo=
rt.")

Confirmed that there is no performance improvement from this patch by
running m4's run.do_configure by hand.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...delays-in-configure-scripts-using-au.patch | 77 -------------------
 .../automake/automake_1.19.bb                 |  1 -
 2 files changed, 78 deletions(-)
 delete mode 100644 meta/recipes-devtools/automake/automake/0006-automake=
-Remove-delays-in-configure-scripts-using-au.patch

diff --git a/meta/recipes-devtools/automake/automake/0006-automake-Remove=
-delays-in-configure-scripts-using-au.patch b/meta/recipes-devtools/autom=
ake/automake/0006-automake-Remove-delays-in-configure-scripts-using-au.pa=
tch
deleted file mode 100644
index e5e39169b6f..00000000000
--- a/meta/recipes-devtools/automake/automake/0006-automake-Remove-delays=
-in-configure-scripts-using-au.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From b43c0ccd1d98a43c0ddcade40fa288e98d381420 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Mon, 7 Dec 2015 18:28:05 +0000
-Subject: [PATCH 6/6] automake: Remove delays in configure scripts using
- automake
-
-By default automake puts "sleep 1" into the start of configure scripts
-which adds pointless delays to them. Rather than do this, lets just assu=
me
-our systems are sane.
-
-RP
-2015/12/7
-Upstream-Status: Inappropriate
----
- m4/sanity.m4 | 48 +-----------------------------------------------
- 1 file changed, 1 insertion(+), 47 deletions(-)
-
-diff --git a/m4/sanity.m4 b/m4/sanity.m4
-index c7f32da..f25625a 100644
---- a/m4/sanity.m4
-+++ b/m4/sanity.m4
-@@ -176,51 +176,5 @@ case $srcdir in
-     AC_MSG_ERROR([unsafe srcdir value: '$srcdir']);;
- esac
-=20
--# Do 'set' in a subshell so we don't clobber the current shell's
--# arguments.  Must try -L first in case configure is actually a
--# symlink; some systems play weird games with the mod time of symlinks
--# (eg FreeBSD returns the mod time of the symlink's containing
--# directory).
--am_build_env_is_sane=3Dno
--am_has_slept=3Dno
--rm -f conftest.file
--for am_try in 1 2; do
--  echo "timestamp, slept: $am_has_slept" > conftest.file
--  if (
--    set X `ls -Lt "$srcdir/configure" conftest.file 2> /dev/null`
--    if test "$[]*" =3D "X"; then
--      # -L didn't work.
--      set X `ls -t "$srcdir/configure" conftest.file`
--    fi
--    test "$[]2" =3D conftest.file
--  ); then
--    am_build_env_is_sane=3Dyes
--    break
--  fi
--  # Just in case.
--  sleep "$am_cv_filesystem_timestamp_resolution"
--  am_has_slept=3Dyes
--done
--
--AC_MSG_RESULT([$am_build_env_is_sane])
--if test "$am_build_env_is_sane" =3D no; then
--  AC_MSG_ERROR([newly created file is older than distributed files!
--Check your system clock])
--fi
--
--# If we didn't sleep, we still need to ensure time stamps of config.sta=
tus and
--# generated files are strictly newer.
--am_sleep_pid=3D
--AS_IF([test -e conftest.file || grep 'slept: no' conftest.file >/dev/nu=
ll 2>&1],, [dnl
--  ( sleep "$am_cv_filesystem_timestamp_resolution" ) &
--  am_sleep_pid=3D$!
--])
--AC_CONFIG_COMMANDS_PRE(
--  [AC_MSG_CHECKING([that generated files are newer than configure])
--   if test -n "$am_sleep_pid"; then
--     # Hide warnings about reused PIDs.
--     wait $am_sleep_pid 2>/dev/null
--   fi
--   AC_MSG_RESULT([done])])
--rm -f conftest.file
-+AC_MSG_RESULT([yes])
- ])
---=20
-2.39.2
-
diff --git a/meta/recipes-devtools/automake/automake_1.19.bb b/meta/recip=
es-devtools/automake/automake_1.19.bb
index aaf3ab9a6f5..ac99268ab34 100644
--- a/meta/recipes-devtools/automake/automake_1.19.bb
+++ b/meta/recipes-devtools/automake/automake_1.19.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa9=
54499f7abaabaa882bbe"
 SRC_URI =3D "${GNU_MIRROR}/automake/automake-${PV}.tar.gz \
            file://0002-automake-Update-for-python.m4-to-respect-libdir.p=
atch \
            file://0004-Add-a-new-distro-feature-ptest.patch \
-           file://0006-automake-Remove-delays-in-configure-scripts-using=
-au.patch \
            "
=20
 SRC_URI[sha256sum] =3D "79e8b1f7a967e87ce8a9ded76bee7f793d0ce1886ab2002f=
eb1b0510f578b75a"
--=20
2.43.0

