Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EFACCF2E7
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 14:58:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36901.1792421925817928763
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 07:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=QWAKYJte;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06B89202C
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 07:58:42 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D43893F673
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 07:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792421925; bh=bVTYlDNWIXR/yUwg++B6Sb4IzkR+4yoA6st/JSs3Xco=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QWAKYJteEd6Y34ku6kQbHU7Taf5CbTRFWqwOjOD4h5T60De4JpAmDwq7ZxNctA/c2
	 /VKlsPK/d7oZ1zOh9mu88uaHoPvINqR/MZkhPs3x7zrGKQU7RQL+OZ8OTRbh2vwHT+
	 mhqKW44lfTcpjOsOGtbOvxIvnfvSuN0p73/qEwu4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] lib/oe/package: fix logic error in file permission checks
Date: Mon, 19 Oct 2026 15:58:37 +0100
Message-ID: <20261019145837.2487873-6-ross.burton@arm.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248188

Various bits of package.py manipulate executables on disk, for example
stripping the binary or extracting the debug info.  Some recipes write
read-only libraries (notably, perl-native) so we need to check for this
and add writable permissions briefly.

However, this logic was incorrect.  The line is:

    if not os.access(file, os.W_OK) or os.access(file, os.R_OK):

'not' has higher precedence than 'or', so this is "if not writable, or
if readable" so we were always changing the permissions, even on files
we can read and write.

The desired behaviour is to change permissions if we can't read or write
the file, which can be done in a single access check:

    if not os.access(file, os.R_OK | os.W_OK):

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/package.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index e706e359cc3..a0bde50ed63 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -30,7 +30,7 @@ def runstrip(file, elftype, strip, extra_strip_sections=
=3D''):
     # 16 - kernel module
=20
     newmode =3D None
-    if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
+    if not os.access(file, os.R_OK | os.W_OK):
         origmode =3D os.stat(file)[stat.ST_MODE]
         newmode =3D origmode | stat.S_IWRITE | stat.S_IREAD
         os.chmod(file, newmode)
@@ -780,7 +780,7 @@ def splitdebuginfo(file, dvar, dv, d):
     objcopy =3D d.getVar("OBJCOPY")
=20
     newmode =3D None
-    if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
+    if not os.access(file, os.R_OK | os.W_OK):
         origmode =3D os.stat(file)[stat.ST_MODE]
         newmode =3D origmode | stat.S_IWRITE | stat.S_IREAD
         os.chmod(file, newmode)
@@ -822,7 +822,7 @@ def splitstaticdebuginfo(file, dvar, dv, d):
     dvar =3D d.getVar('PKGD')
=20
     newmode =3D None
-    if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
+    if not os.access(file, os.R_OK | os.W_OK):
         origmode =3D os.stat(file)[stat.ST_MODE]
         newmode =3D origmode | stat.S_IWRITE | stat.S_IREAD
         os.chmod(file, newmode)
--=20
2.43.0


