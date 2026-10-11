Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A70CA9ED9
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 20:00:00 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32876.1791748795226786089
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 12:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=BiHk1eFx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-202610111959527ace5e544f0002075b-jqigld@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202610111959527ace5e544f0002075b
        for <openembedded-core@lists.openembedded.org>;
        Sun, 11 Oct 2026 21:59:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=plPsOewJsL9wXgwr5lspsRAjmxjotxSyHk0tMj/Z0Lg=;
 b=BiHk1eFxtvCgYlIAF2T1m/QDxj+rqu4zGvSWo3YOx1TOtqlZH1l56hxhqNiEB+o7AJtmwv
 TkemYQ/FRPl6CsijRtMeftM88SkB6RDH14BTDAQ/BtxY1znRnLeMAfrAAHyk3ZrG+QNZOfjv
 0Rztr2dojvJjblQJJwjUWCRiFobu1DAf/qxwTwQaGmiib1BUQr//WJOREa6vPcArEwEnccbD
 8AoAdVodO0G+DafeuIyYZYWFLtIopIFuB9zXeiHUiCgEzQ1hNNdP1D2KEwgZO6NCs1MSb49I
 KS5srdXgDQhwCZL6skW/Yl/YjjmnnhSXRkFw5sltHqpWyO1Xoxj9k9JQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 01/11] runqemu: move all imports to the top of the file
Date: Sun, 11 Oct 2026 21:59:06 +0200
Message-ID: <20261011195949.2118607-2-adrian.freihofer@siemens.com>
In-Reply-To: <20261011195949.2118607-1-adrian.freihofer@siemens.com>
References: <20261011195949.2118607-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 20:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247587

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Local imports in functions are inconsistent with the rest of the module.
All of them are stdlib modules, so there is no reason to defer loading them.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 2c126e7f54..dee7710fb3 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -19,6 +19,10 @@ import glob
 import configparser
 import signal
 import time
+import shlex
+import socket
+import traceback
+from contextlib import closing
 
 class RunQemuError(Exception):
     """Custom exception to raise on known errors."""
@@ -258,9 +262,6 @@ class BaseConfig(object):
 
     def check_free_port(self, host, port, lockdir):
         """ Check whether the port is free or not """
-        import socket
-        from contextlib import closing
-
         lockfile = os.path.join(lockdir, str(port) + '.lock')
         if self.acquire_portlock(lockfile):
             with closing(socket.socket(socket.AF_INET, socket.SOCK_STREAM)) as sock:
@@ -1605,7 +1606,6 @@ to your build configuration.
         self.setup_vga()
 
     def start_qemu(self):
-        import shlex
         if self.kernel:
             kernel_opts = "-kernel %s" % (self.kernel)
             if self.get('QB_KERNEL_CMDLINE') == "none":
@@ -1805,7 +1805,6 @@ def main():
         logger.error(err)
         return 1
     except Exception as err:
-        import traceback
         traceback.print_exc()
         return 1
     finally:
-- 
2.56.0


