Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B6CC64ED6
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:41:57 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.43563.1676990514185703333
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 06:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=nNlSZOWG;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id u10so5146953pjc.5
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 06:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zj3RYMkmEvIaQO9kNUKRbDfEtKWHlrIbCW7SdO4tFdw=;
        b=nNlSZOWGrWxnTtM+AKVd5xo4Pq6h9Br0PuMTeWuv8jFnMnn36hqeN4xW6owai7akAi
         luJW+OoBcFJW0FVibRojPBl2Vu+A3URUBxosclXYrsbETRd/pF4UmjEp5MBtUTmV75YB
         dB3LiDsMxH8eB9TL2SNuzLczhPU7+kPSTU027gjvABFWClmW05nxwlxgofllyguw9PGe
         +sLxQiptB0idn6bH7myvFFltkTA1uhq3Rg2tzlQTSLITNQWPnnWjubR5bm1hjC6AZE0a
         n1hQuXSqVCigGiGIKWI0WnMOUBSdOz4OfgWRUCY9q+cvINQXv8G6cE46gKXt2vHVMnrH
         DiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zj3RYMkmEvIaQO9kNUKRbDfEtKWHlrIbCW7SdO4tFdw=;
        b=6ri5zraeeM0NYCf4SX2D9Plr90B0wxsk2z1kMZlRje/B/2oLo03S9LHyOWb9lmPh4Q
         xKPAyAPTZitRpjl+NzKPxXMUl+yWkQxkHGqbIdHPJq9iCldl9E9F4dceM3OVwgwDHCfa
         62s+K5vMymY8Ap7amUKS0lYikHIBXiHxB6WCTJeQGs7em+e2jmiWUGI4BvSEEpBr3agt
         RVRStisSSZ3/+7l6+uyhd+3qum+w9I8B/8Vqu3cx4L0OARe38QRex8CHz4HFMZgMBDHc
         mB195tuqDwVw5vpg5tczfvUyCKq3UWEmMOh3R7yhpywus0t1A05N0sfwif/HPwyNJGMl
         JZYA==
X-Gm-Message-State: AO0yUKUzcKENRdZ91Q8uOd2Ej9phjLCpjr2mtjqHRNqchK0GADXzJRkX
	G3RydSkfHNz/xIn/ZpMlJZnKOa3ylDyWsurMP0k=
X-Google-Smtp-Source: AK7set9m6LWTfit3zEctE7BDTJ4CK3HP7tVK6sHERViNJ8AcNqVN6QW+CI4oJpiEMenAsxqbeVf74A==
X-Received: by 2002:a05:6a21:99a5:b0:cb:9fcc:3f37 with SMTP id ve37-20020a056a2199a500b000cb9fcc3f37mr1125193pzb.35.1676990513199;
        Tue, 21 Feb 2023 06:41:53 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h5-20020a62b405000000b005ae8e94b0d5sm6151140pfn.107.2023.02.21.06.41.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 06:41:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/23] oeqa dump.py: add error counter and stop after 5 failures
Date: Tue, 21 Feb 2023 04:41:02 -1000
Message-Id: <91bc1e03bc990c527d8aadbdcd7bf97217db124e.1676990336.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676990336.git.steve@sakoman.com>
References: <cover.1676990336.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 14:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177519

From: Mikko Rapeli <mikko.rapeli@linaro.org>

If test target qemu machine hangs completely, dump_target() calls
over serial console are taking a long time to time out, possibly
for every failing ssh command execution and a lot of test cases,
and same with dump_monitor().

Instead of trying for ever, count errors and after 5 stop trying
to dump_target() and dump_monitor() completely.

These help to end testing earlier when a test target is completely
deadlocked and all ssh, serial and QMP communication with it are
failing.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit d9ad0a055abba983c6cee1dca4d2f0a8a3c48782)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/dump.py | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index 95a79a571c..6fd5832051 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -91,37 +91,55 @@ class HostDumper(BaseDumper):
             self._write_dump(cmd.split()[0], result.output)
 
 class TargetDumper(BaseDumper):
-    """ Class to get dumps from target, it only works with QemuRunner """
+    """ Class to get dumps from target, it only works with QemuRunner.
+        Will give up permanently after 5 errors from running commands over
+        serial console. This helps to end testing when target is really dead, hanging
+        or unresponsive.
+    """
 
     def __init__(self, cmds, parent_dir, runner):
         super(TargetDumper, self).__init__(cmds, parent_dir)
         self.runner = runner
+        self.errors = 0
 
     def dump_target(self, dump_dir=""):
+        if self.errors >= 5:
+                print("Too many errors when dumping data from target, assuming it is dead! Will not dump data anymore!")
+                return
         if dump_dir:
             self.dump_dir = dump_dir
         for cmd in self.cmds:
             # We can continue with the testing if serial commands fail
             try:
                 (status, output) = self.runner.run_serial(cmd)
+                if status == 0:
+                    self.errors = self.errors + 1
                 self._write_dump(cmd.split()[0], output)
             except:
+                self.errors = self.errors + 1
                 print("Tried to dump info from target but "
                         "serial console failed")
                 print("Failed CMD: %s" % (cmd))
 
 class MonitorDumper(BaseDumper):
-    """ Class to get dumps via the Qemu Monitor, it only works with QemuRunner """
+    """ Class to get dumps via the Qemu Monitor, it only works with QemuRunner
+        Will stop completely if there are more than 5 errors when dumping monitor data.
+        This helps to end testing when target is really dead, hanging or unresponsive.
+    """
 
     def __init__(self, cmds, parent_dir, runner):
         super(MonitorDumper, self).__init__(cmds, parent_dir)
         self.runner = runner
+        self.errors = 0
 
     def dump_monitor(self, dump_dir=""):
         if self.runner is None:
             return
         if dump_dir:
             self.dump_dir = dump_dir
+        if self.errors >= 5:
+                print("Too many errors when dumping data from qemu monitor, assuming it is dead! Will not dump data anymore!")
+                return
         for cmd in self.cmds:
             cmd_name = cmd.split()[0]
             try:
@@ -135,4 +153,5 @@ class MonitorDumper(BaseDumper):
                     output = self.runner.run_monitor(cmd_name)
                 self._write_dump(cmd_name, output)
             except Exception as e:
+                self.errors = self.errors + 1
                 print("Failed to dump QMP CMD: %s with\nException: %s" % (cmd_name, e))
-- 
2.34.1


