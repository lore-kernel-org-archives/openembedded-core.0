Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E81EC77B61
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 14:27:05 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.9582.1680877615709574602
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Apr 2023 07:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=s3DPa1G/;
 spf=pass (domain: baylibre.com, ip: 209.85.221.52, mailfrom: lrannou@baylibre.com)
Received: by mail-wr1-f52.google.com with SMTP id r29so42424380wra.13
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 07:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680877616; x=1683469616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82Tkobw8uiQclLSO2KBEKMDyYJAp6uOH3qprdUU/0ow=;
        b=s3DPa1G/aPQqKOrEIM8CCcbnI35vJtFAvYunRijrFwIyORVZitSLkLdLUwBjiITKB/
         OF0UqEdlHXQBBEixmuh1HZFcrqPqrweFF8jUfEXHBe/FdCvEcktSDO81PylM7SFO/N7g
         hd4HgERP5Ejuon0bbMCZktGIPYlMLx7jHDYnEJn9MJFtECjDUCWnK6UhPR3s3c9qLOrA
         Ry2FBACKkJei8gq8xI3RCWwgF05t2K+6DYk0XtzKIH21h8vQTn+qTjvaXRrMIAgXfooo
         S9t57xsO5sW/TxD2m/TkJFCTGppIUw7zM2cKEcpMIITNzCxFvmN2W4fvQknCoZrMutlS
         SY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680877616; x=1683469616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=82Tkobw8uiQclLSO2KBEKMDyYJAp6uOH3qprdUU/0ow=;
        b=LwNFmzwrgyAdXnhKANz+LeDIaSRCUqpsrTeRKdiimfcm5dGkgyrdtPBiowVadiqF1h
         I0gedok6WuFweDwxTifCKxwV1TDyi15cwItbdc0K1oHolsLhfOI7uU1aEKZzpsBb7Pr3
         d6P7/jFKzRIRiQLgYhz7aHaIlu7Mi9ei0pe+t03IEqXamnpCeV5Edjv4PyX6wODVzYCX
         ecuKmf30SfkxM/eSdJKRZvkAdWKi0I5KJGbdSeVLUKjw1JIsKayIz4eNgsE8lSkGIr4T
         eNwl0sGEm9HNIhnr9X2+CYWyrbUURgTkaBrNEfav2GPGLXnhjMsf8nSMTlwS0ghYgJ1n
         BL9A==
X-Gm-Message-State: AAQBX9dDeZUfrMuFnNSj3NhS/eZOlpZuC+XF/93r88jvYOmsJe+gn5eK
	AkHXR5CvxssbNZe//Vs8nSOzQLiFus+AdPKyyd0y7A==
X-Google-Smtp-Source: AKy350Zrhktf4mJxkCgrbky3RLdwiOmMMpxG4+T5qHDiD88TGRiEsRpjlI3y5af+Fa2vHSKleZoTlw==
X-Received: by 2002:adf:ea92:0:b0:2ce:9cc8:34db with SMTP id s18-20020adfea92000000b002ce9cc834dbmr1572327wrm.71.1680877616706;
        Fri, 07 Apr 2023 07:26:56 -0700 (PDT)
Received: from midgar.. ([193.33.56.84])
        by smtp.gmail.com with ESMTPSA id l13-20020a5d668d000000b002e61e002943sm4601403wru.116.2023.04.07.07.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 07:26:56 -0700 (PDT)
From: Louis Rannou <lrannou@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: khilman@baylibre.com,
	Louis Rannou <lrannou@baylibre.com>
Subject: [PATCH v3 1/2] oeqa/utils/qemurunner: change the serial runner
Date: Fri,  7 Apr 2023 16:26:21 +0200
Message-Id: <20230407142622.632035-2-lrannou@baylibre.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230407142622.632035-1-lrannou@baylibre.com>
References: <20230407142622.632035-1-lrannou@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 14:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179824

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


