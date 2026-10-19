Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87737CCF2EB
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 14:58:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36687.1792421922257607795
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 07:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=VdVVNsJ/;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 666A0202C
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 07:58:38 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3F5D33F673
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 07:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792421921; bh=eh9/npw1cVcR87A/1Y5w/RHfCugOOciIB6nvj2l/3go=;
	h=From:To:Subject:Date:From;
	b=VdVVNsJ/1KBYlsGfJ/lCGeh5MXkUN7e3eKyU3HmowoRVp4XUTFM2y3VQHlJkvBPR6
	 C8wkvw3Ww9IMdcOPDTBYwO2EXXnawT2wn8rfDD72OdhC6Sej5DOdSJ2fZpZhb/hiVu
	 YVa3hXKngUM6FkTwMgD39CxVFBSIFwhJ3zqXqnvg=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] lib/oe/sstatesig: cache the user/group lookups in OEOuthashBasic
Date: Mon, 19 Oct 2026 15:58:32 +0100
Message-ID: <20261019145837.2487873-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 14:58:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248183

The hash includes the user/group names for every file in the sstate
object, so we can save a little time by wrapping pwd.getpwuid() and
grp.getgrgid() in a lru_cache.

In a microbenchmark on my machine, repeated calls of getpwuid() take
0.56ms but the caching wrapper takes 0.09ms.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/sstatesig.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 9928f3af495..145bc59617d 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -550,6 +550,11 @@ def OEOuthashBasic(path, sigfile, task, d):
     import grp
     import re
     import fnmatch
+    import functools
+
+    # Caches to speed lookups
+    lookup_uid =3D functools.lru_cache(lambda uid: pwd.getpwuid(uid).pw_=
name)
+    lookup_gid =3D functools.lru_cache(lambda gid: grp.getgrgid(gid).gr_=
name)
=20
     def update_hash(s):
         s =3D s.encode('utf-8')
@@ -652,8 +657,8 @@ def OEOuthashBasic(path, sigfile, task, d):
                         add_perm(stat.S_IXOTH, 'x')
=20
                     try:
-                        update_hash(" %10s" % pwd.getpwuid(s.st_uid).pw_=
name)
-                        update_hash(" %10s" % grp.getgrgid(s.st_gid).gr_=
name)
+                        update_hash(" %10s" % lookup_uid(s.st_uid))
+                        update_hash(" %10s" % lookup_gid(s.st_gid))
                     except KeyError as e:
                         msg =3D ("KeyError: %s\nPath %s is owned by uid =
%d, gid %d, which doesn't match "
                             "any user/group on target. This may be due t=
o host contamination." %
--=20
2.43.0


