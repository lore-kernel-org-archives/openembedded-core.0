Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2158CC5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 16:27:04 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16746.1786724815447032601
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 09:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ni1SDJyK;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BA1E31A1644
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 16:26:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8EDB46046D
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 16:26:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E04DD11C4EED0;
	Fri, 14 Aug 2026 18:26:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786724809; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=W3ErTjuvPN7UXvdio+MbCqDb4NhgmraWmK3NhRnGymg=;
	b=ni1SDJyKwfLaEZLaMg++yL+pTKmFW6NzPx3P5Wh72JcaAqj0BBWCucnh1FXw56eqnm6dqS
	0dOl/lSSOs3OJobHyJaZ7gOB9N7Eqdfz/4ARF0xDABfE8+5dViv62BZAtweH7zuEMqIQtl
	3Vo+Amnh0XQX7kzTpbyHjpBHPuzl5vX1E9d1xzoKTtF28QNyTI1wbRBKwwq/519ut1r+NF
	LaXIyRkmONk9AceUM0t/P0FouSZDo2NQ3pY1COpZvXT9BshOl8HTda5rY3ipyWQmPexcww
	UJOqjOYYFrs1NM6m6WZtc6V8WaoFdLVGwtMeVN6OsJv2kAcl8xPzc5eqhTE+Og==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 14 Aug 2026 18:26:35 +0200
Subject: [PATCH 2/4] devtool: standard: Fix file copy on finish --force
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-mathieu-devtool-v1-2-985e81a17bb3@bootlin.com>
References: <20260814-mathieu-devtool-v1-0-985e81a17bb3@bootlin.com>
In-Reply-To: <20260814-mathieu-devtool-v1-0-985e81a17bb3@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786724798; l=1640;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=iv7Mk05DzlLzRZQFIUyN2yEao5QpNDvSHN82qg3Z8hU=;
 b=kAJcSxTCWQ2ydZ/k6HayT68mNMeFlIehQGwJamzqEVxqGcDMM9DEGfMQLR5jiCSmnDm6TU+W7
 9p36TcCbCIJDI/c7lwWoSAlRePQez9Bvv/Yccwy0Xxsa4KKo/vN+v5i
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 16:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243461

Fix "devtool finish --force" command, by allowing to copy folders that
were not previously existing but also by preventing it from trying to
remove non-existent files. Devtool was particularly confused when using
the finish subcommand on a recipe that was just added.

Fixes: ce8190c51905: devtool: Drop oe-local-files and simplify
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


