Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 394406C4BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:14 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id q1so1737602pfi.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=iMHsJWgxuv0EYUKig68nSS5QQJ2La48kfxs1vqxK+3c=;
	b=hQ7LoJ/pSIXaVAuvl/23duF6SeqAkaIKL23v9Luvt7eu8vOntOxPerqKzJh+/ZOnw+
	h9tr7HrmsoTKy/+3+AdGinbGF70etYQfK/f4ndvxcYKbuueyKPoHHtJ8PORfqVUGvJvO
	y/Za0m6nKB+fO2ujuzH76uyPVpaXnKukGu5q79D/FKNwlchgLbt8TnThoPaRGbU5bXam
	3k/TZp1QqhtyVkugq1/yjrIf7BETzNDJXaJEZIZ8GImC3GkXJGWbGLMYij78XBddcyN/
	gndDXjO1iqkpY4ZxsO4SGvVzZcSjQimR9NyExCMI7fvgMUAYil1GSPpwWIOFZvheke5Z
	pHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=iMHsJWgxuv0EYUKig68nSS5QQJ2La48kfxs1vqxK+3c=;
	b=RT47tr1YJDxpbprUXiYIYifnev/oRsC3ByUV+H/CJMN5/lQR8OMpuj90RZGWLF2wgX
	o5Ql0raORo46vHYIAPTWbo5JhsZFvu1quFcN60LmdCf/cxNZ3NzGKkKCFhFe5ZF5vKV4
	ntNlWhqCQnr5av5jF6BSWJRc8kq1tiIV0avotKm72TfRHysFNPjbslUthj9/Y7w2NLWp
	Y0aW24E2YEqtOoppJKNpOSFDRMKVc656BUbKHPGu1nJRC5ZjFp/KXVLfdSTPDrYCxKqI
	YJtFYwdvjjMs77HeBlbxFuyCzArzgMNtppFn5nxwn6QVrdflRaWW1P5HitoWncl1KNRo
	JDNg==
X-Gm-Message-State: AA+aEWZTVq1fKjuydK8jIqOZ2/8N3kh05cRmZOGfqWOoglQMy9L29YmP
	RJDpbKpnCqH6U55Y6J1bKJdU6AXx
X-Google-Smtp-Source: AFSGD/U67aXp02R38Hf8r/mqA8t58Aqd336s6NPZNc+YoF7GaLvp6yaxAn4R6HyyIriIMPZYza0h8g==
X-Received: by 2002:a63:a16:: with SMTP id 22mr416575pgk.318.1544737155239;
	Thu, 13 Dec 2018 13:39:15 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:20 -0800
Message-Id: <89423308f93983b9957fc87b30e33ddc801588e8.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 12/45] oeqa/qemurunner: Remove resource python warnings
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:14 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If runqemu fails it would leak an unclosed socket and file. Ensure we
close these in all cases to remove the resource warning.

(From OE-Core rev: ed80e46ccbc8fe8e9148d80723152066fa00ba28)

(From OE-Core rev: baa8313e492cff8c31633a558792500b10493e9e)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 983c8c7..0f1c5a5 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -135,7 +135,7 @@ class QemuRunner:
 
     def launch(self, launch_cmd, get_ip = True, qemuparams = None, extra_bootparams = None, env = None):
         try:
-            threadsock, threadport = self.create_socket()
+            self.threadsock, threadport = self.create_socket()
             self.server_socket, self.serverport = self.create_socket()
         except socket.error as msg:
             self.logger.error("Failed to create listening socket: %s" % msg[1])
@@ -263,7 +263,7 @@ class QemuRunner:
         self.logger.debug("Target IP: %s" % self.ip)
         self.logger.debug("Server IP: %s" % self.server_ip)
 
-        self.thread = LoggingThread(self.log, threadsock, self.logger)
+        self.thread = LoggingThread(self.log, self.threadsock, self.logger)
         self.thread.start()
         if not self.thread.connection_established.wait(self.boottime):
             self.logger.error("Didn't receive a console connection from qemu. "
@@ -372,13 +372,19 @@ class QemuRunner:
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
2.7.4


