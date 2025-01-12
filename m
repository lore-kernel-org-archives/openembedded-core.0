Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD1DE7719A
	for <webhook@archiver.kernel.org>; Sun, 12 Jan 2025 00:23:29 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.28114.1736641406607827644
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jan 2025 16:23:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Z1nvh4na;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so34170465e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jan 2025 16:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1736641404; x=1737246204; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2v0KY6X/lnVuHhWzmFd1v9ELbajaehRGmSJsPxJjVOw=;
        b=Z1nvh4naeBi6/GsEoYZHVIFqDmuC97sMhAzzGu2KVHxDuXtI3hXoIw4CzhLlygnNFD
         RXtSPDoFL2K+I3kgAm0A1A4+oEdwEzOM5YkT5qALtvFmB+zXNitN4RPkDdl2iCGsxEqs
         tOV5fj9WzJUCMb0Jt1OUzt416lPbMOsUE0Gtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736641404; x=1737246204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2v0KY6X/lnVuHhWzmFd1v9ELbajaehRGmSJsPxJjVOw=;
        b=XeqgyO/WHyJOExZ5ZliB5Yg/bCcY7uvReWvABoKgoz6PrPVHdbEA2/y5jyNQoxxA4q
         dTPVOzDMVV3Nt8bqzuZhq6JEBIoeKC3rvKkNZolj4UAOzV3OPlrhY0m5FgSlgZEGv3po
         fIASU+uYtDna8qeNSsFOoprE+dqDa6ZYBVNMGMHlspfKkE0SH0CVQxWxj4UmYHDvs2Ae
         Bnc5X/8YIUhnooaQRCXp9bQWetuFDpyKM8YJCgiFGwqQQXd6WvyzJHYioa5bNbLwIFUb
         apvTIBfAHB/+VGT2lPKb+uXiQyjg81KtJwNTveR8MVySLSj3CKyeW6St6LcQ+ZVns72I
         touA==
X-Gm-Message-State: AOJu0YyU8DJdWc+04MHpdoeHC+k9G4uQkWzJBRPELGCnY2n5+Egva+YZ
	Ya7/VbXBmCLqUJsQuCr/sCurp8l0oeeWdHFHEpXe1+XVxhhWNoSvWog0yOK9eOoXSJOmOsTcY01
	MmJWxlQ==
X-Gm-Gg: ASbGncuxi9tLsRleCy69IyEW8YiSgB+Fjg+DaFOJYvmhXJBXMiqrG/+zzgm8H3AuFIw
	5MJkP3sEVeVraAWNHk1we1P05vh4afIUFjmnG39xny4CNTaGXK9hqJ1oJEmnEPC43eD8c+Tbfj9
	5tOYfY4l6dThMJaD1dO2H26l/9pPNZYO2d922a0L1dNUS+3Tdb7zixjfkiyCfpYdctCkcDyzVj0
	8p8Nt2kxZrxpXfwsIyOzBHAeoXk4u7wJUH3bZX6tNvzP5Hd2P9pIhc2KuvWFuRL0jkwXLktifAE
	g7X6nfrx//YqrgsE3bZy83THpACo2OJR62jQnL3wsZTH+XHoeHjclB56mf7SF9E=
X-Google-Smtp-Source: AGHT+IF4JiPOLzVtoqRQVjp/vM9H3MdEwystZ+99PGd1mtT1VXV0BdM6oL5bhn94eVnPCjXKB7cm7w==
X-Received: by 2002:a05:600c:1c86:b0:436:f975:29d with SMTP id 5b1f17b1804b1-436f9750391mr5355095e9.6.1736641404278;
        Sat, 11 Jan 2025 16:23:24 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb000deef000bdfc82d7e16362a9.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:bdfc:82d7:e163:62a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e3840bfsm8511048f8f.39.2025.01.11.16.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 16:23:24 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [RFC PATCH 2/2] selftest/reproducible: Print error context on failure
Date: Sun, 12 Jan 2025 01:23:10 +0100
Message-Id: <20250112002310.4045706-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250112002310.4045706-1-yoann.congal@smile.fr>
References: <20250112002310.4045706-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 00:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209675

From: Yoann Congal <yoann.congal@smile.fr>

Printed logs during the reproducible test look like this in case of
failure:
2025-01-12 00:39:00,807 - oe-selftest - INFO - Building reproducibleA (sstate allowed)...
2025-01-12 00:40:08,323 - oe-selftest - ERROR - Bitbake failed! but keep going... Log:
2025-01-12 00:40:08,323 - oe-selftest - INFO - Found ERROR (line 126):
2025-01-12 00:40:08,323 - oe-selftest - INFO -       NOTE: recipe opkg-utils-native-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
2025-01-12 00:40:08,323 - oe-selftest - INFO -       NOTE: Running setscene task 74 of 333 (virtual:native:.../poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
2025-01-12 00:40:08,323 - oe-selftest - INFO -       NOTE: recipe bash-5.2.37-r0: task do_populate_sysroot_setscene: Succeeded
2025-01-12 00:40:08,323 - oe-selftest - INFO -       NOTE: recipe cve-update-nvd2-native-1.0-r0: task do_unpack: Succeeded
2025-01-12 00:40:08,323 - oe-selftest - INFO -       NOTE: Running task 4 of 974 (.../poky/meta/recipes-core/hello-single/hello-fail_1.0.bb:do_cve_check)
2025-01-12 00:40:08,323 - oe-selftest - INFO -       NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
2025-01-12 00:40:08,323 - oe-selftest - INFO -       NOTE: recipe hello-fail-1.0-r0: task do_packagedata_setscene: Started
2025-01-12 00:40:08,323 - oe-selftest - INFO -       NOTE: Running setscene task 77 of 333 (.../poky/meta/recipes-extended/bash/bash_5.2.37.bb:do_recipe_qa_setscene)
2025-01-12 00:40:08,323 - oe-selftest - INFO -       NOTE: Running setscene task 78 of 333 (.../poky/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
2025-01-12 00:40:08,324 - oe-selftest - INFO -       NOTE: recipe hello-fail-1.0-r0: task do_populate_sysroot_setscene: Started
2025-01-12 00:40:08,324 - oe-selftest - INFO -       ERROR: hello-fail-1.0-r0 do_populate_sysroot_setscene: this is an error
2025-01-12 00:40:08,324 - oe-selftest - INFO -       ERROR: hello-fail-1.0-r0 do_populate_sysroot_setscene: Error executing a python function in exec_func_python() autogenerated:
2025-01-12 00:40:08,324 - oe-selftest - INFO -
2025-01-12 00:40:08,324 - oe-selftest - INFO -       The stack trace of python calls that resulted in this exception/failure was:
2025-01-12 00:40:08,324 - oe-selftest - INFO -       File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
2025-01-12 00:40:08,324 - oe-selftest - INFO -            0001:
2025-01-12 00:40:08,324 - oe-selftest - INFO -        *** 0002:do_populate_sysroot_setscene(d)
2025-01-12 00:40:08,324 - oe-selftest - INFO -            0003:
2025-01-12 00:40:08,324 - oe-selftest - INFO -       File: '.../poky/meta/recipes-core/hello-single/hello-fail_1.0.bb', lineno: 17, function: do_populate_sysroot_setscene
2025-01-12 00:40:08,324 - oe-selftest - INFO -            0013:}
2025-01-12 00:40:08,324 - oe-selftest - INFO - Found ERROR (line 127):
2025-01-12 00:40:08,324 - oe-selftest - INFO -       NOTE: Running setscene task 74 of 333 (virtual:native:.../poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
2025-01-12 00:40:08,324 - oe-selftest - INFO -       NOTE: recipe bash-5.2.37-r0: task do_populate_sysroot_setscene: Succeeded
2025-01-12 00:40:08,324 - oe-selftest - INFO -       NOTE: recipe cve-update-nvd2-native-1.0-r0: task do_unpack: Succeeded
2025-01-12 00:40:08,324 - oe-selftest - INFO -       NOTE: Running task 4 of 974 (.../poky/meta/recipes-core/hello-single/hello-fail_1.0.bb:do_cve_check)
2025-01-12 00:40:08,324 - oe-selftest - INFO -       NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
2025-01-12 00:40:08,324 - oe-selftest - INFO -       NOTE: recipe hello-fail-1.0-r0: task do_packagedata_setscene: Started
2025-01-12 00:40:08,324 - oe-selftest - INFO -       NOTE: Running setscene task 77 of 333 (.../poky/meta/recipes-extended/bash/bash_5.2.37.bb:do_recipe_qa_setscene)
2025-01-12 00:40:08,324 - oe-selftest - INFO -       NOTE: Running setscene task 78 of 333 (.../poky/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
2025-01-12 00:40:08,324 - oe-selftest - INFO -       NOTE: recipe hello-fail-1.0-r0: task do_populate_sysroot_setscene: Started
2025-01-12 00:40:08,324 - oe-selftest - INFO -       ERROR: hello-fail-1.0-r0 do_populate_sysroot_setscene: this is an error
2025-01-12 00:40:08,324 - oe-selftest - INFO -       ERROR: hello-fail-1.0-r0 do_populate_sysroot_setscene: Error executing a python function in exec_func_python() autogenerated:
2025-01-12 00:40:08,325 - oe-selftest - INFO -
2025-01-12 00:40:08,325 - oe-selftest - INFO -       The stack trace of python calls that resulted in this exception/failure was:
2025-01-12 00:40:08,325 - oe-selftest - INFO -       File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
2025-01-12 00:40:08,325 - oe-selftest - INFO -            0001:
2025-01-12 00:40:08,325 - oe-selftest - INFO -        *** 0002:do_populate_sysroot_setscene(d)
2025-01-12 00:40:08,325 - oe-selftest - INFO -            0003:
2025-01-12 00:40:08,325 - oe-selftest - INFO -       File: '.../poky/meta/recipes-core/hello-single/hello-fail_1.0.bb', lineno: 17, function: do_populate_sysroot_setscene
2025-01-12 00:40:08,325 - oe-selftest - INFO -            0013:}
2025-01-12 00:40:08,325 - oe-selftest - INFO -            0014:
2025-01-12 00:40:08,325 - oe-selftest - INFO - End of log:
2025-01-12 00:40:08,325 - oe-selftest - INFO -       NOTE: Running task 955 of 974 (.../poky/meta/recipes-core/hello-single/hello-fail_1.0.bb:do_populate_sysroot)
2025-01-12 00:40:08,325 - oe-selftest - INFO -       NOTE: recipe hello-fail-1.0-r0: task do_populate_sysroot: Started
2025-01-12 00:40:08,325 - oe-selftest - INFO -       NOTE: recipe hello-fail-1.0-r0: task do_populate_sysroot: Succeeded
2025-01-12 00:40:08,325 - oe-selftest - INFO -       NOTE: Running noexec task 973 of 974 (.../poky/meta/recipes-core/hello-single/hello-fail_1.0.bb:do_build)
2025-01-12 00:40:08,325 - oe-selftest - INFO -       NOTE: Running noexec task 974 of 974 (.../poky/meta/recipes-core/hello-single/hello-norepro_1.0.bb:do_build)
2025-01-12 00:40:08,325 - oe-selftest - INFO -       NOTE: Tasks Summary: Attempted 974 tasks of which 958 didn't need to be rerun and all succeeded.
2025-01-12 00:40:08,325 - oe-selftest - INFO -       NOTE: Generating JSON CVE summary
2025-01-12 00:40:08,325 - oe-selftest - INFO -       Complete CVE JSON report summary created at: .../poky/build-master-st/reproducibleA/tmp/log/cve/cve-summary.json
2025-01-12 00:40:08,325 - oe-selftest - INFO -
2025-01-12 00:40:08,325 - oe-selftest - INFO -       Summary: There were 2 ERROR messages, returning a non-zero exit code.
2025-01-12 00:40:08,326 - oe-selftest - ERROR - reproducibleA build failed. Trying to compute built packages differences but the test will fail.

Fixes [YOCTO #15655] (second half).

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
RFC: As you can see, some lines are displayed multiple times if they are
in multiple errors contexts. I started implementing merging contexts
blocks but the code I wrote is really not good. If someone has a clever
idea on how to do this, I'll take it.
In the meantime, I think this simpler patch can be merged and the
print_condensed_error_log function improved later if that is worth it.
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 25 ++++++++++++++------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 9597d76697..3fb0e5ee5b 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -239,18 +239,31 @@ class ReproducibleTests(OESelftestTestCase):
         # may reuse the previous log file so restart the bitbake server.
         bitbake("--kill-server")
 
+        def print_condensed_error_log(logs, context_lines=10, tail_lines=20):
+            """Prints errors with context and the end of the log."""
+
+            logs = logs.split("\n")
+            for i, line in enumerate(logs):
+                if line.startswith("ERROR"):
+                    self.logger.info("Found ERROR (line %d):" % (i + 1))
+                    for l in logs[i-context_lines:i+context_lines]:
+                        self.logger.info("      " + l)
+
+            self.logger.info("End of log:")
+            for l in logs[-tail_lines:]:
+                self.logger.info("      " + l)
+
         bitbake_failure_count = 0
         if not use_sstate:
             if self.sstate_targets:
                self.logger.info("Building prebuild for %s (sstate allowed)..." % (name))
                self.write_config(config)
                try:
-                   bitbake("--continue "+' '.join(self.sstate_targets), limit_exc_output=20)
+                   bitbake("--continue "+' '.join(self.sstate_targets))
                except AssertionError as e:
                    bitbake_failure_count += 1
                    self.logger.error("Bitbake failed! but keep going... Log:")
-                   for line in str(e).split("\n"):
-                       self.logger.info("    "+line)
+                   print_condensed_error_log(str(e))
 
             # This config fragment will disable using shared and the sstate
             # mirror, forcing a complete build from scratch
@@ -264,13 +277,11 @@ class ReproducibleTests(OESelftestTestCase):
         d = get_bb_vars(capture_vars)
         # targets used to be called images
         try:
-            bitbake("--continue "+' '.join(getattr(self, 'images', self.targets)), limit_exc_output=20)
+            bitbake("--continue "+' '.join(getattr(self, 'images', self.targets)))
         except AssertionError as e:
             bitbake_failure_count += 1
-
             self.logger.error("Bitbake failed! but keep going... Log:")
-            for line in str(e).split("\n"):
-                self.logger.info("    "+line)
+            print_condensed_error_log(str(e))
 
             # The calling function expects the existence of the deploy
             # directories containing the packages.

