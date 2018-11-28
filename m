Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 078006C56D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 16:23:51 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id k198so3198594wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 08:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=goaaPD87Bu3wlxjjKHfWRfxu3qjYu6hj7m8x9LViS9A=;
	b=ILf3FTdA5H9YX/XsSqUWSzn+Dxo6M8oHSL4/RfRVbXlIv0KThIqb1d1FLHUZmDkLRR
	Y8Upw4zG8doFs6P1uSk7zXSs8oP6AZoiahx7ggJFUhD2ou39tyWytJq3jAFYeSQbvQDi
	PHkLYwwKo0KL+dvCesceq4d8JZrDkNn8BQo+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=goaaPD87Bu3wlxjjKHfWRfxu3qjYu6hj7m8x9LViS9A=;
	b=HAepDhSE3rPW5UiRPGV68xxeAE1xykUXINGwbzsCdiaTTF8IUNCiVDa3xj2UIyVvaT
	rcbtzwEr75ue2Vmjs3sgsJl46jXWwUaG015OWHyFEDzFx/MVWXDPFigCNiYTeSxdDU+0
	R5khrEsq0fDxN4S9owcn+UwXNtiJw4tVafa0LUBHyQcZuApak3kECNrPCn+95eG7/FI0
	9TB5a5BfF/RfdTa2ev/q43FWHBL7Tg/vuGw9Jjyt5yM0PHKr4TH3AIbnsOU7hW45elQv
	wYlEW1RI50poPQQI2LmH+NR7azOYJVjdKl2r1gAfD/c6rWj9jLcjv2fjHXDpqTCnFbgH
	zo7w==
X-Gm-Message-State: AA+aEWZeIAOLCJbCBQk+hHN+JX/OifGdtYOCa6f88tWntI5v8JZHnPm8
	XcGXZsj64j0EkbApUOY8BbY1Pnb7y8M=
X-Google-Smtp-Source: AFSGD/UmS4vihbqFlkW5m4LrVGFvykkFSt3pmiUhrOJ0PiylVvdHUCRdna/ku1YyAiutQEqKQ22tsg==
X-Received: by 2002:a1c:414:: with SMTP id 20mr3370199wme.67.1543422232344;
	Wed, 28 Nov 2018 08:23:52 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l3sm10033017wru.36.2018.11.28.08.23.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 08:23:51 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2018 16:23:47 +0000
Message-Id: <20181128162347.16512-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181128162347.16512-1-richard.purdie@linuxfoundation.org>
References: <20181128162347.16512-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/4] oeqa/qemurunner: Remove resource python warnings
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2018 16:23:52 -0000

If runqemu fails it would leak an unclosed socket and file. Ensure we
close these in all cases to remove the resource warning.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 241d1eced88..409e86d4bcb 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -139,7 +139,7 @@ class QemuRunner:
 
     def launch(self, launch_cmd, get_ip = True, qemuparams = None, extra_bootparams = None, env = None):
         try:
-            threadsock, threadport = self.create_socket()
+            self.threadsock, threadport = self.create_socket()
             self.server_socket, self.serverport = self.create_socket()
         except socket.error as msg:
             self.logger.error("Failed to create listening socket: %s" % msg[1])
@@ -272,7 +272,7 @@ class QemuRunner:
         self.logger.debug("Target IP: %s" % self.ip)
         self.logger.debug("Server IP: %s" % self.server_ip)
 
-        self.thread = LoggingThread(self.log, threadsock, self.logger)
+        self.thread = LoggingThread(self.log, self.threadsock, self.logger)
         self.thread.start()
         if not self.thread.connection_established.wait(self.boottime):
             self.logger.error("Didn't receive a console connection from qemu. "
@@ -381,13 +381,19 @@ class QemuRunner:
             self.runqemu.stdin.close()
             self.runqemu.stdout.close()
             self.runqemu = None
+
         if hasattr(self, 'server_socket') and self.server_socket:
             self.server_socket.close()
             self.server_socket = None
+        if hasattr(self, 'threadsock') and self.threadsock:
+            self.threadsock.close()
+            self.threadsock = None
         self.qemupid = None
         self.ip = None
         if os.path.exists(self.qemu_pidfile):
             os.remove(self.qemu_pidfile)
+        if self.monitorpipe:
+            self.monitorpipe.close()
 
     def stop_qemu_system(self):
         if self.qemupid:
-- 
2.17.1


