Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80781C5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 11:12:25 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8195.1786878742949343071
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 04:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=VRmPlJ3S;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 25BDA1A1699
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 11:12:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E8B2760352
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 11:12:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4382111C4F8ED;
	Sun, 16 Aug 2026 13:12:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786878736; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qpTufYMXq9F0UJn0RTTZxXdz9sDlxmpuQ4RwHKD/ARs=;
	b=VRmPlJ3S0rigI4i3F50J5Wt0ci0eZ+NrsTtYS5gxM7kmb7xHIcUSrM33AX/wUH7Rqgt1Gt
	SL/IBJSKKJjl2M+lDxbXoS0fgG2zKIT3bvxcK90SFYnRk9rULPRzrDWixxl8mIaQiwEtX9
	8ZxRNlUwpTYFn6yVcnnnc/HGIjYeDKU6TSS5o1Uo5K5S+pC+YraWpjcDcGGv8mSDOZGbSh
	XbFD6xpsJZHI5yNKZ2WNSRnFV30KNC1+cxpVOngCWktgMy3o6eMMn47ez3z5k5QHMdv/YB
	yDX/pbgdVy1aoykkri8veIv00xnVgZzag4QOlTW+clkCguoY+6iymMuvCKvDNw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Sun, 16 Aug 2026 13:12:02 +0200
Subject: [PATCH v2 2/4] devtool: standard: Fix file copy on finish --force
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260816-mathieu-devtool-v2-2-13c943abf48e@bootlin.com>
References: <20260816-mathieu-devtool-v2-0-13c943abf48e@bootlin.com>
In-Reply-To: <20260816-mathieu-devtool-v2-0-13c943abf48e@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786878726; l=1714;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=yUK/LgBcIWxIY4gjbgMQFd0CHmME/sZz4yW/gciCVl0=;
 b=sGleVxoj1oUM6d9Zzl4qkUngniwGBd25jsMWoY5/4o8aeu0X5UVnGCr3CDDftrtLhBHfkUiiZ
 ughgMaZvPRBCAsg0Bkjf2n41Luvf0zqozUbsVZbFBlI5duv73vOEdC4
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 11:12:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243518

Fix "devtool finish --force" command, by allowing to copy folders that
were not previously existing but also by preventing it from trying to
remove non-existent files. Devtool was particularly confused when using
the finish subcommand on a recipe that was just added.

Fixes: ce8190c51905: devtool: Drop oe-local-files and simplify
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 scripts/lib/devtool/standard.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 9b2643604d1d..536411efef6a 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1461,13 +1461,17 @@ def _export_local_files(srctree, rd, destdir, srctreebase):
         if os.path.exists(os.path.join(fullfile, ".git")):
             # submodules handled elsewhere
             continue
-        if f not in existing_files:
+        if f not in existing_files and os.path.exists(fullfile):
             added[f] = {}
+            parentdir = os.path.normpath(os.path.join(destdir, f, os.pardir))
+            if not os.path.isdir(parentdir):
+                os.makedirs(parentdir)
+
             if os.path.isdir(os.path.join(srctree, f)):
                 shutil.copytree(fullfile, os.path.join(destdir, f))
             else:
                 shutil.copy2(fullfile, os.path.join(destdir, f))
-        elif not os.path.exists(fullfile):
+        elif f in existing_files and not os.path.exists(fullfile):
             removed[f] = existing_files[f]
         elif f in existing_files:
             updated[f] = {'path' : existing_files[f]}

-- 
2.47.3


