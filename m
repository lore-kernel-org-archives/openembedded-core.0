Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3E9C4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:12:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44560.1784715129891203889
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Feo5yTzb;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC2821595
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 03:12:04 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B93AF3F58B
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 03:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784715129; bh=gK5KvWk708E+LENeuSilJ/Hb3Bh120T0oehLXUWFpsg=;
	h=From:To:Subject:Date:From;
	b=Feo5yTzbbjZNhaP3MTbIqNatcck2+887uYSmzS25BYWg4mQukk9bknKkTQWM9qig/
	 no9SRAaYtbBkBsMw4mZgK02UC19RIShhNqkikkyh4qNeDM2+Oq7/TnbZxAo99xJY3g
	 1ekzHR7eusBu8cfXUCyHqUzyjPZIrXE04c0ANZO8=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pkgconf: upgrade 3.0.3 -> 3.0.4
Date: Wed, 22 Jul 2026 11:12:06 +0100
Message-ID: <20260722101206.3418075-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241649

Changes from 3.0.3 to 3.0.4:
----------------------------

* Fix a crash (stack overflow) triggered by a crafted .pc file containing=
 a
  self-referential fragment variable, such as `x=3D$${x}` referenced from=
 Cflags.
  Fragment variables are now evaluated only once while re-splitting.  Fou=
nd
  through fuzzing.

* Fix over-escaping of variable values containing backslash-escaped white=
space,
  such as paths quoted with `printf %q`.  Such a value was stored with it=
s
  escapes intact and then escaped a second time when rendered into a frag=
ment,
  producing output like `-L/a\\\ dir`.  This broke meson's test suite, wh=
ich
  uses paths with spaces to stay Windows-safe.

* Fix mangled and duplicated -L/-I paths on Windows when PKG_CONFIG_SYSRO=
OT_DIR
  and PKG_CONFIG_LIBDIR are set.  Path separators are now normalized to f=
orward
  slashes for all runtime-injected paths (sysroot, build root, search pat=
hs and
  pcfiledir), so that sysroot matching and injection operate on a consist=
ent
  basis.

* Fix `--define-prefix` dropping a path separator when the redefined pref=
ix ends
  with a trailing slash, and only rewrite a package's directories when th=
ey match
  the original prefix on a path component boundary.

* Fix single-package queries returning results drawn from more than the r=
equested
  module, by restoring the package limit that was lost during a refactor =
of the
  query builder.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../pkgconf/{pkgconf_3.0.3.bb =3D> pkgconf_3.0.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_3.0.3.bb =3D> pkgconf_3.0.=
4.bb} (97%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_3.0.3.bb b/meta/recipe=
s-devtools/pkgconf/pkgconf_3.0.4.bb
similarity index 97%
rename from meta/recipes-devtools/pkgconf/pkgconf_3.0.3.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_3.0.4.bb
index dfb6919ff71..0abd0fa923c 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_3.0.3.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.4.bb
@@ -20,7 +20,7 @@ SRC_URI =3D "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] =3D "aa033abb2b777ba4e66635495a931e53c49d86e4e4e38af6=
8c0f76d666cbd8cf"
+SRC_URI[sha256sum] =3D "91ce346b47f46b87d680c6928e6c43240b9cdc7a31afbea1=
9f2298de4dbe266d"
 UPSTREAM_CHECK_REGEX =3D "pkgconf-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)\.tar"
=20
 inherit autotools pkgconfig
--=20
2.43.0


