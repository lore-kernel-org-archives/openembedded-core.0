Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79852C77B6F
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 15:05:32 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.16680.1681225529596604451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 08:05:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=7tWFs47F;
 spf=pass (domain: baylibre.com, ip: 209.85.128.54, mailfrom: lrannou@baylibre.com)
Received: by mail-wm1-f54.google.com with SMTP id n19-20020a05600c501300b003f064936c3eso9544841wmr.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 08:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681225528; x=1683817528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82Tkobw8uiQclLSO2KBEKMDyYJAp6uOH3qprdUU/0ow=;
        b=7tWFs47F3dLWRUj9LsUqu+yoJ61ZuGX337pQfnyTLQWycYblo64HtJl/bpxzev3ZPO
         RKoIPYNBq5ItGvqLFlN7+fO5aS5ZYC11n2KhvGAMyMaJs9M6bWBh0Ztf8d/oXmb3tnaM
         uNfJzO3qbG0rlUr7HGe5I2Z+XvES3tLgCxk2XUPKCtz0dNkEt6rzZa3oxxgjbJzaQcxe
         76fpjQqDciIZ4ivWVGpIAZbObUG+aSr6HwPAcP5sfFbMmusQKF/yiufQKME/jWiUmmFI
         LOY098r6V8Sx1TkEI6tbl+/kvry6AgQJm/07WiRME7/Wik81b9Hm++Xn7NmpWJNQeSYk
         dnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681225528; x=1683817528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=82Tkobw8uiQclLSO2KBEKMDyYJAp6uOH3qprdUU/0ow=;
        b=Tp19FRoV9JMuYmA6g/kxcmVZ1fcxnEtlWubTU4PcoQ3N23kRj46hGcMbCTQ2uDuaSS
         Wsmy5mV6Dk9cu0N4UvmyGivbwelb2vGpFClU2BSpSUQ0SBmBHIS0y/Td/dmFi91yLsvu
         aTNFz4OoH7ayN+qURcCsVSY4ZbXjmjDvrLh9sNeILAGh+MLE/Iu0DoCv2wlwbD+Zsd00
         G3leCKDw5ieoJQz/qrrllQ7NV31IzBpjPWR7byU3WQh/GilynmRFP+o4rheEJzuUK+Pz
         cMKMoERzCMpE8CXAbeuAVOafc9pe3ev+oX4eKH+QZq6guFb3tVjhISZV3Gy+TzD/y5R0
         Pwcw==
X-Gm-Message-State: AAQBX9cYkCY8wfAMYvzgFaPWfnvuoMEnPXyJDsH58vrwL806c7dEjiWZ
	kcN8vWP1kyHm/sv++E873W+fYcDoazgoRXqy5fY=
X-Google-Smtp-Source: AKy350a108tpG6diaSl9F9/uzf4m8lX/FOkJKC2DNdZ1DRvpc7YX1vY8C4OZdTM6FVsRWXnw/trEHA==
X-Received: by 2002:a1c:4c12:0:b0:3f0:4f83:22f4 with SMTP id z18-20020a1c4c12000000b003f04f8322f4mr6747960wmf.20.1681225528100;
        Tue, 11 Apr 2023 08:05:28 -0700 (PDT)
Received: from midgar.. ([2001:912:1480:1c0::1])
        by smtp.gmail.com with ESMTPSA id n6-20020a7bc5c6000000b003f072b22dbbsm16324161wmk.16.2023.04.11.08.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 08:05:27 -0700 (PDT)
From: Louis Rannou <lrannou@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: khilman@baylibre.com,
	Louis Rannou <lrannou@baylibre.com>
Subject: [PATCH v4 1/2] oeqa/utils/qemurunner: change the serial runner
Date: Tue, 11 Apr 2023 17:05:02 +0200
Message-Id: <20230411150503.2105880-2-lrannou@baylibre.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230411150503.2105880-1-lrannou@baylibre.com>
References: <20230411150503.2105880-1-lrannou@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 15:05:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179928

[YOCTO #15021]

Create a new runner run_serial_socket which usage matches the traditional ssh
runner. Its return status is 0 when the command succeeded or 0 when it
failed. If an error is encountered, it raises an Exception.

The previous serial runner is maintained and marked as deprecated.

Signed-off-by: Louis Rannou <lrannou@baylibre.com>
---
 meta/lib/oeqa/targetcontrol.py    |  3 ++
 meta/lib/oeqa/utils/qemurunner.py | 57 +++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index d686fe07ec..3707883da7 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -206,6 +206,9 @@ class QemuTarget(BaseTarget):
     def run_serial(self, command, timeout=60):
         return self.runner.run_serial(command, timeout=timeout)
 
+    def run_serial_socket(self, command, timeout=60):
+        return self.runner.run_serial_socket(command, timeout=timeout)
+
 
 class SimpleRemoteTarget(BaseTarget):
 
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 6734cee48d..7e1c7a7eac 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -637,6 +637,7 @@ class QemuRunner:
                 return self.qmp.cmd(command)
 
     def run_serial(self, command, raw=False, timeout=60):
+        # Deprecated
         # Returns (status, output) where status is 1 on success and 0 on error
 
         # We assume target system have echo to get command status
@@ -688,6 +689,62 @@ class QemuRunner:
                     status = 1
         return (status, str(data))
 
+    def run_serial_socket(self, command, raw=False, timeout=60):
+        # Returns (status, output) where status is 0 on success and a negative value on error.
+
+        # We assume target system have echo to get command status
+        if not raw:
+            command = "%s; echo $?\n" % command
+
+        data = ''
+        status = 0
+        self.server_socket.sendall(command.encode('utf-8'))
+        start = time.time()
+        end = start + timeout
+        while True:
+            now = time.time()
+            if now >= end:
+                data += "<<< run_serial_socket(): command timed out after %d seconds without output >>>\r\n\r\n" % timeout
+                break
+            try:
+                sread, _, _ = select.select([self.server_socket],[],[], end - now)
+            except InterruptedError:
+                continue
+            if sread:
+                # try to avoid reading single character at a time
+                time.sleep(0.1)
+                answer = self.server_socket.recv(1024)
+                if answer:
+                    data += answer.decode('utf-8')
+                    # Search the prompt to stop
+                    if re.search(self.boot_patterns['search_cmd_finished'], data):
+                        break
+                else:
+                    if self.canexit:
+                        return (1, "")
+                    raise Exception("No data on serial console socket, connection closed?")
+
+        if not data:
+            raise Exception('serial run failed: no data')
+
+        if raw:
+            status = 0
+        else:
+            # Remove first line (command line) and last line (prompt)
+            data = data[data.find('$?\r\n')+4:data.rfind('\r\n')]
+            index = data.rfind('\r\n')
+            if index == -1:
+                data = ""
+                raise Exception('serial run failed: no result')
+            else:
+                status_cmd = data[index+2:]
+                data = data[:index]
+                try:
+                    status = int(status_cmd)
+                except ValueError as e:
+                    raise Exception('Could not convert to integer: {}'.format(str(e)))
+        return (status, str(data))
+
 
     def _dump_host(self):
         self.host_dumper.create_dir("qemu")
-- 
2.40.0


