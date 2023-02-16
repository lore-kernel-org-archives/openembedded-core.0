Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5299C636CC
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 09:54:48 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.6703.1676541285604979090
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 01:54:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=agroTnxA;
 spf=pass (domain: baylibre.com, ip: 209.85.128.53, mailfrom: lrannou@baylibre.com)
Received: by mail-wm1-f53.google.com with SMTP id p5so1117601wmg.4
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 01:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JOwvtKzHTKGjeEIBqAHbO5Su6kILRZhKtJE7GMeLJ8g=;
        b=agroTnxA67wKfY0/KSPt6FaQpyM5C3847KHK7A7LjdazVqPDSNkCKXMiHkFoQR3VjM
         fyudtK8YNasAg2J1XYSZEcDFEnpDP9zeQ/Ci6C/S6TJFQP0OyRPJ9Y8AEAWLCbDunugu
         z8lDo14IF0t4Bn7/8bfaREY2GtYrqULShwM6nQdjvmP9ptaECLSrQuH9uQRnd3N2rnnC
         DE2+XamG6P/iptz/X7E0A9OiOArVtu4KRFfD4lRTeGiHnS09oRJa0Tpdq+wx2UbrMRT0
         n79jciNr/PmbDtAlBZ6q80eNVZtoDwyAO0lzu3v+yR5jbjcTOvgC2pgPKou6KjZiSr4C
         z2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JOwvtKzHTKGjeEIBqAHbO5Su6kILRZhKtJE7GMeLJ8g=;
        b=OPUKHqtWI0R3ysMZq4eOu+AL+0niIc9SyYch77hZveJJI+LIZkwuFNjIlUlEQae3yd
         un3NxA1NVQeEsR8O18vOsh6lJl9zFJJ+yWKMF5xeKqhtDIqdVHH351Mv3BerfVoZFfWr
         x8oV8/NeASReqfPUGJ+ck67EeGrF7z5liKjQ343RpmMpvsQBf1W5JBUzs43Iz7etILgL
         yUS00x7PbZmyhceASpplWxkSCAdfRKPEwUC/dmcI6DlEhJIhkaW5h0M2Y7p3g3LnE0XW
         kNmNT1VSJCXt5mG5BfD9pLdpFNamm992ANW2kgpugoYEImlAc56J4pQO4iNNwCazws80
         M1aA==
X-Gm-Message-State: AO0yUKXJJTARQpQLvFCMap4lquIETfYgyMxOwM8Z7e8tDobead8oIxOc
	03Vqfv2G3C0Teagm4nsGOoiYyq4g/oLgRsv4
X-Google-Smtp-Source: AK7set/r4s/+EGZ/pYPW/557R1wweewxno6gsG37YJke4Y1WY7DzkUXZBPGFuqqGxedg01QmJ5Zdnw==
X-Received: by 2002:a05:600c:4e8a:b0:3dc:4316:52be with SMTP id f10-20020a05600c4e8a00b003dc431652bemr1233870wmq.10.1676541283901;
        Thu, 16 Feb 2023 01:54:43 -0800 (PST)
Received: from midgar.. (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bca49000000b003c6bbe910fdsm4849560wml.9.2023.02.16.01.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 01:54:43 -0800 (PST)
From: Louis Rannou <lrannou@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: khilman@baylibre.com,
	Louis Rannou <lrannou@baylibre.com>
Subject: [PATCH 1/2] oeqa/utils/qemurunner: change the serial runner usage
Date: Thu, 16 Feb 2023 10:54:39 +0100
Message-Id: <20230216095440.1990542-1-lrannou@baylibre.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 09:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177280

[YOCTO #15021]

Create a new runner run_serial_socket which usage matches the traditional ssh
runner. Its return status is 0 when the command succeeded or 0 when it
failed. If an error is encountered, it raises an Exception.

The previous serial runner is maintained and marked as deprecated.

Signed-off-by: Louis Rannou <lrannou@baylibre.com>
---
 meta/lib/oeqa/targetcontrol.py    |  3 +++
 meta/lib/oeqa/utils/qemurunner.py | 42 ++++++++++++++++++++-----------
 2 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 1fdff82889..99fbcb5879 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -210,6 +210,9 @@ class QemuTarget(BaseTarget):
     def run_serial(self, command, timeout=60):
         return self.runner.run_serial(command, timeout=timeout)
 
+    def run_serial_socket(self, command, timeout=60):
+        return self.runner.run_serial_socket(command, timeout=timeout)
+
 
 class SimpleRemoteTarget(BaseTarget):
 
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index c19164e6e7..c8fffd8fd1 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -618,7 +618,13 @@ class QemuRunner:
                 return self.qmp.cmd(command)
 
     def run_serial(self, command, raw=False, timeout=60):
+        # Deprecated
         # Returns (status, output) where status is 1 on success and 0 on error
+        (status, output) = self.run_serial_socket(command, raw, timeout)
+        return (0 if status else 1, output)
+
+    def run_serial_socket(self, command, raw=False, timeout=60):
+        # Returns (status, output) where status is 0 on success and a negative value on error.
 
         # We assume target system have echo to get command status
         if not raw:
@@ -632,7 +638,7 @@ class QemuRunner:
         while True:
             now = time.time()
             if now >= end:
-                data += "<<< run_serial(): command timed out after %d seconds without output >>>\r\n\r\n" % timeout
+                data += "<<< run_serial_socket(): command timed out after %d seconds without output >>>\r\n\r\n" % timeout
                 break
             try:
                 sread, _, _ = select.select([self.server_socket],[],[], end - now)
@@ -650,21 +656,27 @@ class QemuRunner:
                         return (1, "")
                     raise Exception("No data on serial console socket, connection closed?")
 
-        if data:
-            if raw:
-                status = 1
+        if not data:
+            self.logger.error("serial run returned no data")
+            raise subprocess.SubprocessError('serial run failed: no data')
+
+        if raw:
+            status = 0
+        else:
+            # Remove first line (command line) and last line (prompt)
+            data = data[data.find('$?\r\n')+4:data.rfind('\r\n')]
+            index = data.rfind('\r\n')
+            if index == -1:
+                data = ""
+                self.logger.error("serial run returned no result")
+                raise Exception('serial run failed: no result')
             else:
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
+                status_cmd = data[index+2:]
+                data = data[:index]
+                try:
+                    status = int(status_cmd)
+                except ValueError as e:
+                    raise Exception('Could not convert to integer: {}'.format(str(e)))
         return (status, str(data))
 
 
-- 
2.39.1


