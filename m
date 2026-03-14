Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD6610706EB
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 16:58:06 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13619.1773507483914070968
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 09:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=v49gAtBC;
 spf=pass (domain: smile.fr, ip: 209.85.167.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a12cd0bd79so4082799e87.2
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 09:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773507482; x=1774112282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EsWdPZW8nFSP24tFCQgIqcwHFhkFFwBo/puJHwrpLh4=;
        b=v49gAtBCWtqjSHHMpJPsJdzowOUnyqfZJ2meQhssV3ryqaLJ0fhEks3ZkBA9sdWZbE
         Q+ECZD2AybucFO7ZSlLnXOU/hQtpJ9uIPlDyzVok4P+htAYn2Hy1hgVV0erSXopJ62sR
         QDK8xQK0kIzO2R41FvjvgE/L1YlUpQvkgJChg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773507482; x=1774112282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EsWdPZW8nFSP24tFCQgIqcwHFhkFFwBo/puJHwrpLh4=;
        b=TkL/6lEWGKlBnAZtOaCT8uXew2nZCzpny/1+QLHhP6oyTIBdjUQIEgHESIcyVL5aVa
         cwbQ7cv7w6ywW+y5xTooMwnPNWiwGdJz9f/I+2BsqHmuzMh49T2rqJq/46o+V/os0JlB
         85VSzk001MgA3i2ZWmt4GcaqovUe0OVl+HR+EqlLYLVWP3kt4X28tE/qf0tYkK+pJs2+
         giBYB2YcaWv13OHT26XZZGxybw/n1QD9T90299hjG6rmcVO5ZzuPUuZQ/zipwwohbCFP
         PFD582hVFyVMmyVcXpHSkP9risc5nDOSwOkeJVsUWe5dGr41Vng79Rz5yD3O9Mt6qPYf
         fh3w==
X-Gm-Message-State: AOJu0YyZ+hPN61d1rGnjtDMdUAw/RoTt76ClrW+hzcPyAKtXCPaU9T/f
	keflP25pekgiL0bt0d5O85ywY0PFf2ke84T/ks8xseq21kIWNYtJ19psYoMNo6H0dEC3ZwVnHgD
	MgOGl
X-Gm-Gg: ATEYQzwYVTJ80ls0UsivbTDGXWjBmEEsf/iiU/spB8/Io8/DBSjo5V/7sOSjyZj+Qku
	ppO44Nzrb6o7HLaZ6eAyDVm3fPYDtsTc6gcTv4SS85TznoPgi4fhF2ihHVLptLVRUCtCLMnIGOP
	W7LJAZA6I0aE8utOAwu9yp7LtJzX4NwsUJNAA6d6EC7sjQi/86bdYnYVIZcLADhHC4JHjrDvFzz
	IDAg5Zx1IzyyICFPC4UyoqvUOQSKT3qgszHx0ui/tCxpdIUdtdIhnweL0K2VFW6Z4hhZ09/6EX5
	fc18nVcbmL2uqcUl2SUlVx89EJT1XZINlJc4TMqjoF0JUSrQOgB5330r2OkCxSi280fj5khAC9H
	jec+fZDpjvXaA7gkyn7xfQXbRXMLkuWtrcs0qw/GURoqtZv+lf+3QFtO4r74rD7Dg2prqe6scPu
	pILqgQoD2/X8aXCDMIg4kaRDLlKfjPAfh+Egu39URN9/+b37utTsoi243/YsP2g1AyhkwG5zg4X
	l8htFdmo+aRFAS70GL7a6CuFjc=
X-Received: by 2002:a05:651c:210e:b0:38a:4197:862c with SMTP id 38308e7fff4ca-38a89689acbmr27945611fa.9.1773507481706;
        Sat, 14 Mar 2026 09:58:01 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a8c8979cdsm10874971fa.38.2026.03.14.09.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 09:58:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] qemurunner: Hide kernel messages on first non-raw run_serial() call
Date: Sat, 14 Mar 2026 17:57:41 +0100
Message-ID: <20260314165741.1710464-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 16:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233091

From: Yoann Congal <yoann.congal@smile.fr>

Kernel messages on console can be mixed with run_serial() command output
and might even prevent run_serial() to read the command exit code.

To fix this, on the first non-raw run_serial() call, run "dmesg -n 1"
first to hide the kernel message from the console we use to run
commands. Note that kernel messages are still logged in dmesg buffer.

man dmesg (from util-linux):
> -n, --console-level
> level Set the level at which printing of messages is done to the
> console. The level is a level number or abbreviation of the level name.
> For all supported levels see the --help output.
>
> For example, -n 1 or -n emerg prevents all messages, except emergency (panic)
> messages, from appearing on the console. All levels of messages are still
> written to /proc/kmsg, so syslogd(8) can still be used to control exactly where
> kernel messages appear. When the -n option is used, dmesg will not print or
> clear the kernel ring buffer.

Busybox's dmesg also support the option.

Raw run_serial() calls are used during the login process when it's too
early to run the dmesg command.

Fixes [ YOCTO #16189 ]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/utils/qemurunner.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 57f86970fe..1ceeeff96a 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -77,6 +77,7 @@ class QemuRunner:
         self.boot_patterns = boot_patterns
         self.tmpfsdir = tmpfsdir
         self.native_sysroot = native_sysroot
+        self.kernel_messages_disabled = False
 
         self.runqemutime = 300
         if not workdir:
@@ -659,6 +660,11 @@ class QemuRunner:
     def run_serial(self, command, raw=False, timeout=60):
         # Returns (status, output) where status is 1 on success and 0 on error
 
+        # Disable kernel messages before running the first non-raw command
+        if not raw and not self.kernel_messages_disabled:
+            self.kernel_messages_disabled = True
+            self.run_serial("dmesg -n 1\n", raw=True)
+
         # We assume target system have echo to get command status
         if not raw:
             command = "%s; echo $?\n" % command

