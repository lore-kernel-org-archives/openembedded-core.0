Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63AEDC4450E
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 13:42:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35603.1782481348815831512
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 06:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=uUjxBf1e;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77A7F1F60
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:42:23 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8DAED3F632
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782481348; bh=MeTR9qRFA8zR3WP4oIeG7zhDU3aLg4HMGHFLqiUVjDc=;
	h=From:To:Subject:Date:From;
	b=uUjxBf1eE2X74aSZlQiXk/fdyMO/JnNb8pijKrZ0oYMWTaMoub0ciKaY80IVZ/6Gv
	 alpIMMeQnxPk9U9slfJI44XCPeDt4FrjX6LuUhgHqyml+8Th7O8OVjnUItyTm/Ob/X
	 Fda+601BH8/EAfPGr5yuQcN+fYjT6DQgA4oStet4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/sstatesig: use the SHA256 fastpath in bitbake/utils.py
Date: Fri, 26 Jun 2026 14:42:21 +0100
Message-ID: <20260626134221.1556950-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 13:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239632

Instead of iterating through a file by hand to hash it, call into the
hashing code in bitbake's utils.py.  This uses mmap() instead of plain
file operations which is ~30% faster in benchmarks[1], and will speed
up hash calculations when writing sstate.

[1] On my build machine, hashing a 300MB kernel image 100 times takes
    34s with open() and 26s with mmap()

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/sstatesig.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index af6df60271d..f016fc67704 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -684,10 +684,10 @@ def OEOuthashBasic(path, sigfile, task, d):
                     update_hash(" " * 10)
=20
                 update_hash(" ")
-                fh =3D hashlib.sha256()
                 if stat.S_ISREG(s.st_mode):
                     # Hash file contents
                     if filterfile:
+                        fh =3D hashlib.sha256()
                         # Need to ignore paths in crossscripts and posti=
nst-useradd files.
                         with open(path, 'rb') as d:
                             chunk =3D d.read()
@@ -701,13 +701,13 @@ def OEOuthashBasic(path, sigfile, task, d):
                                     else:
                                         chunk =3D chunk.replace(bytes(r,=
 encoding=3D'utf8'), b'')
                             fh.update(chunk)
+                        update_hash(fh.hexdigest())
                     else:
-                        with open(path, 'rb') as d:
-                            for chunk in iter(lambda: d.read(4096), b"")=
:
-                                fh.update(chunk)
-                    update_hash(fh.hexdigest())
+                        # Plain file that we're not filtering, use the f=
astpath in bb.utils
+                        update_hash(bb.utils.sha256_file(path))
                 else:
-                    update_hash(" " * len(fh.hexdigest()))
+                    # SHA256 has a 64 character hex digest
+                    update_hash(" " * 64)
=20
                 update_hash(" %s" % path)
=20
--=20
2.43.0


