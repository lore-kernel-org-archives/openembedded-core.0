Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B7ACCF2EA
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 14:58:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36900.1792421924952534236
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 07:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=mJp/IAwC;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EC11204C
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 07:58:41 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 27CB63F673
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 07:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792421924; bh=T3FtB6M331nUkHXu6CHxwX9qHQ1SK/JMOFbCKXs1h2Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mJp/IAwCxBCSFCKITN1e1qVZvnMGnggVTCRwuMXSqduE79ZnWeiTd9vurKo5v/YqW
	 aQJhoPC93dbu9vtEBTRV24Apu5XYIQpzT8zCPJzOOPzsuBHckIfEbgCss76K3G5qk9
	 lHFGXu2PgG+7pSd+u9FSEEK2hRl9OzlSDMWWMFlo=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] lib/oe/package: use elfutils instead of objdump to extract SONAME etc
Date: Mon, 19 Oct 2026 15:58:36 +0100
Message-ID: <20261019145837.2487873-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019145837.2487873-1-ross.burton@arm.com>
References: <20261019145837.2487873-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 14:58:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248187

Currently the process_shlibs() function uses OBJDUMP (typically, objdump
from binutils) to extract the NEEDED/SONAME/RPATH values from the ELF.

However, there is no explicit dependency on binutils in do_package,
instead it comes into the sysroot via the default toolchain dependencies
in do_configure, so a recipe that does INHIBIT_DEFAULT_DEPS and also
packages an executable file will try and then fail to run objdump.

Currently this error is silently ignored, which is acceptable if the
executable is a script, but if the recipe contains ELFs without ever
depending on binutils (precompiled, or a different toolchain) then the
shlibs code won't actually run correctly.

do_package() already depends on elfutils-native for eu-srcfiles, so
switch the code to use eu-readelf instead.

Also use subprocess.run() with a command list instead of a string to
os.popen().  The os.popen() code didn't have any error handling meaning
it silently ignored both "objdump not found" and "file is not ELF", we
can assume that eu-readelf exists but we still need to absorb errors
from not passing a valid ELF.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/package.py | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 8ecb2555f3a..e706e359cc3 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1654,23 +1654,24 @@ def process_shlibs(pkgfiles, d):
         needed =3D set()
         sonames =3D set()
         ldir =3D os.path.dirname(file).replace(pkgdest + "/" + pkg, '')
-        cmd =3D d.getVar('OBJDUMP') + " -p " + shlex.quote(file) + " 2>/=
dev/null"
-        fd =3D os.popen(cmd)
-        lines =3D fd.readlines()
-        fd.close()
         rpath =3D tuple()
+        cmd =3D ["eu-readelf", "--dynamic", file]
+        # Don't check for errors as we may be passed non-ELF
+        ret =3D subprocess.run(cmd, capture_output=3DTrue, text=3DTrue)
+
+        lines =3D ret.stdout.splitlines()
         for l in lines:
-            m =3D re.match(r"\s+RPATH\s+([^\s]*)", l)
+            m =3D re.match(r"\s+RPATH\s+.+\[(.+)\]", l)
             if m:
                 rpaths =3D m.group(1).replace("$ORIGIN", ldir).split(":"=
)
                 rpath =3D tuple(map(os.path.normpath, rpaths))
         for l in lines:
-            m =3D re.match(r"\s+NEEDED\s+([^\s]*)", l)
+            m =3D re.match(r"\s+NEEDED\s+.+\[(.+)\]", l)
             if m:
                 dep =3D m.group(1)
                 if dep not in needed:
                     needed.add((dep, file, rpath))
-            m =3D re.match(r"\s+SONAME\s+([^\s]*)", l)
+            m =3D re.match(r"\s+SONAME\s+.+\[(.+)\]", l)
             if m:
                 this_soname =3D m.group(1)
                 prov =3D (this_soname, ldir, pkgver)
--=20
2.43.0


