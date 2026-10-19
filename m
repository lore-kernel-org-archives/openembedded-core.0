Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AD6CCF2E5
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 14:58:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36688.1792421922794514305
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 07:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=X7i5RgMV;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28250204C
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 07:58:39 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EBB7A3F673
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 07:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792421922; bh=XQAZmxByKSUmqKWwXwVDeI9uG4FaOCJyaQ9G+NHEKpw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=X7i5RgMVtP9pNOkNeXB7oIIm+yhTENpPtQ4jALBBV5FQe1oET71OHnDxEcoxS97+j
	 ZkeKis0D0ndaFtgOac9ljjn+WGnDPIu5rajaVQgZHGyArh4jLeydTeMQiW0rPzQSd7
	 9ZmmgKd/+gewLO8nU2ub7pVOUXkY1Vrz3cTuL6mc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] lib/oe/cachedpath: add is_executable() functions
Date: Mon, 19 Oct 2026 15:58:33 +0100
Message-ID: <20261019145837.2487873-2-ross.burton@arm.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248184

Add is_exexcutable(), which returns True if the path has any executable
bits set in the file mode.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/cachedpath.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oe/cachedpath.py b/meta/lib/oe/cachedpath.py
index 68c85807d9f..462094192d2 100644
--- a/meta/lib/oe/cachedpath.py
+++ b/meta/lib/oe/cachedpath.py
@@ -121,6 +121,12 @@ class CachedPath(object):
     def lstat(self, path):
         return self.calllstat(path)
=20
+    def is_executable(self, path):
+        """
+        Test if the file has any executable bits set.
+        """
+        return bool(self.stat(path).st_mode & (statmod.S_IXUSR | statmod=
.S_IXGRP | statmod.S_IXOTH))
+
     def walk(self, top, topdown=3DTrue, onerror=3DNone, followlinks=3DFa=
lse):
         # Matches os.walk, not os.path.walk()
=20
--=20
2.43.0


