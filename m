Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3003CC7EE25
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 18:48:20 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.88092.1682448497710209759
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Apr 2023 11:48:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1prNi3-0003kK-2o; Tue, 25 Apr 2023 20:48:15 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1prNi2-00Dl5o-Cs; Tue, 25 Apr 2023 20:48:14 +0200
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1prNi0-00209b-CW; Tue, 25 Apr 2023 20:48:12 +0200
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	ejo@pengutronix.de,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	alexandre.belloni@bootlin.com
Subject: [PATCH v3 5/9] oeqa/utils/qemurunner: simplify output parsing and make crlf-compatible
Date: Tue, 25 Apr 2023 20:47:16 +0200
Message-Id: <20230425184720.456896-6-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230425184720.456896-1-ejo@pengutronix.de>
References: <20230425184720.456896-1-ejo@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 18:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180400

Reduces the nesting depth and replaces the manual newline matching by
built-in splitlines() method.

This makes it compatible with shells that use windows-compatible line
breaks, e.g. for EFI loaders.

More comments and an early return handling should make the code a bit
more readable.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/lib/oeqa/utils/qemurunner.py | 32 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index c3d8e9e815..b08226f05a 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -673,23 +673,21 @@ class QemuRunner:
                         return (1, "")
                     raise Exception("No data on serial console socket, connection closed?")
 
-        if data:
-            if raw:
-                status = 1
-            else:
-                # Remove first line (command line) and last line (prompt)
-                data = data[data.find('$?\r\n')+4:data.rfind('\r\n')]
-                index = data.rfind('\r\n')
-                if index == -1:
-                    status_cmd = data
-                    data = ""
-                else:
-                    status_cmd = data[index+2:]
-                    data = data[:index]
-                if (status_cmd == "0"):
-                    status = 1
-        return (status, str(data))
-
+        # If we got no data, we assume something went wrong and return 0
+        if not data:
+            return (0, str(None))
+
+        # in raw mode, we cannot check exit status output and thus assume success
+        if raw:
+            return (1, str(data))
+
+        # Split lines into array and remove first line (command line) and last line (prompt)
+        # Also remove empty lines to ease catching results
+        outlines = list(filter(None, data.splitlines()[1:-1]))
+        # Remaining last line contains exit code output
+        if (outlines[-1] == "0"):
+            status = 1
+        return (status, "\n".join(outlines[0:-1]))
 
     def _dump_host(self):
         self.host_dumper.create_dir("qemu")
-- 
2.39.2


