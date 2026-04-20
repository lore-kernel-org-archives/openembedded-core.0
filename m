Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99EEDF36C49
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 07:44:58 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14477.1776671092937479614
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 00:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Sko8hzUH;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D18F8C5C98D
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 07:45:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 188F95FFA5;
	Mon, 20 Apr 2026 07:44:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2B9110460ADD;
	Mon, 20 Apr 2026 09:44:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776671090; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hYSTuvp2LudJ3W92rAxu0jkKDZEKsDGe4Mp3b6mvZPU=;
	b=Sko8hzUH1nC4QbCDOi+wI08i/6oxPbH8UpECgzusqBnIWqRlDobP5qIf4RaQrylzwHBID9
	J2ptjzsOF0L4Z96iSXvXy0mHsH3xvguw7v9gpyhjYuhMLwuOZVrKIjH3IbAU2LV+lgc4Kn
	48DMo0Uh6zMph/IDmwY1OPZJm75lJGMgO2vlfREs9K+/GYGRnZ/VTUBrmZ3yk1Uj3y5/w/
	L9PhkCaP4yrqG7+TZIR5yZKGVbj3XhrJJfIHELwdIGnhrWbebQoZro+MQQRrNvwY4rykyG
	5X1bww9ipvpyqstJDYAl2pVukYeWFxhmH6feQxTcRYFaPGR7o0nHyc5gFMaaCQ==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 20 Apr 2026 09:44:36 +0200
Subject: [PATCH 05/10] oe/spdx30_tasks: Fix return value of
 get_package_sources_from_debug
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-spdx3-improvements-v1-5-27e0d5edcdbe@bootlin.com>
References: <20260420-spdx3-improvements-v1-0-27e0d5edcdbe@bootlin.com>
In-Reply-To: <20260420-spdx3-improvements-v1-0-27e0d5edcdbe@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, peter.marko@siemens.com, 
 ross.burton@arm.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 07:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235546

Always return a set, never return None, otherwise create_spdx() is
going to fail, since it does not expect debug_sources to be None.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 meta/lib/oe/spdx30_tasks.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 6609784907db..819f6a34b9c2 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -264,10 +264,9 @@ def get_package_sources_from_debug(
 
     pkg_data = oe.packagedata.read_subpkgdata_extended(package, d)
 
-    if pkg_data is None:
-        return
-
     dep_source_files = set()
+    if pkg_data is None:
+        return dep_source_files
 
     for file_path, file_data in pkg_data["files_info"].items():
         if not "debugsrc" in file_data:

-- 
2.53.0


