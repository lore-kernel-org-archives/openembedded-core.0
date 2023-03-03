Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AFDCC678D4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 09:02:05 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.19207.1677834117589840063
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 01:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=jpDo+egc;
 spf=pass (domain: baylibre.com, ip: 209.85.128.47, mailfrom: lrannou@baylibre.com)
Received: by mail-wm1-f47.google.com with SMTP id t25-20020a1c7719000000b003eb052cc5ccso3402647wmi.4
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 01:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1677834116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLXMLZe4874kKL1nfHa5saPDpKsLZTp2XoFKT9GldyM=;
        b=jpDo+egcgbW0pepQIUmKl00Avygw5uGVCqpKMi8lrT0Lb6rKXbxGVeF9rMOLj54mEA
         FqQ3pj4uIdMTDSKaXcdpEm4KnRr8Dt9iDbqqs/v2VZu15aPwnvFmFzKdlKJjktnAuH+G
         ExgUsd7ayLYEAQvs0z0cdtW1GNDRa7SAcWGiC6VsRm5wnl/IYfE3FWCqrExxijwr/V+9
         vYyd3LTF/KYyNIPLKUHwrrM+tmlFf7J7ktuyyDzhZdWYhV9PwZe+6rDPsep05SkKKzgi
         F+Gz/RN+okJS16LM7Hl5Bkf3xH7zdwETLGw++rBIkZOIIjiDuy+RaY/TvZW+HQI4OjvA
         JrVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677834116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLXMLZe4874kKL1nfHa5saPDpKsLZTp2XoFKT9GldyM=;
        b=lV5H6TZObhGcmKhXw2cxm8i5JJhy3fdaxb/gwrZlbjq0o2nb7iMyumbEbsl1P65+4q
         jsM11z41MIB5q2/4+bj4SfV3/ZafMEx/sbyIbKzxlw1TTWCHlqFiZm7patf50mmwlZvH
         1Kk0uFFucEu2Jn/XvemVTuZIcZ2eUPz4u3n6gTlSgeU3Ar4GBdIinp90KHtXuzNcx+47
         qWxEsr3oVQt0CrEE7SsXAGOF3exoXCY9ma/aTxLzrfWXL1L/ezZH87Ec8/NAqQw8q2m3
         o3gS9grdbssjuTuz6s3RCzl8zp9SjzF1NLAW9DO8FBCDT3U6lVX7ZH4JvbS43PNh8q9F
         ioGw==
X-Gm-Message-State: AO0yUKUe0lGdyrbqOaHsQXA/Oquivt6KW1BBd7Pc95INeN+yqlo6BOYZ
	eaDEbGNIYERjlRJ6W84nJe5QXfo7VPAApx+q
X-Google-Smtp-Source: AK7set86wn+6PwNGQuw1FwHdTELTYHqm17Iuywz6wIhj+SSgykPcqvZw/EV3imjKbfkI01DxW8QWBg==
X-Received: by 2002:a1c:2b87:0:b0:3ea:d610:f062 with SMTP id r129-20020a1c2b87000000b003ead610f062mr826535wmr.30.1677834116086;
        Fri, 03 Mar 2023 01:01:56 -0800 (PST)
Received: from midgar.. ([2001:912:1480:1c0::1])
        by smtp.gmail.com with ESMTPSA id l21-20020a05600c47d500b003e11ad0750csm1698950wmo.47.2023.03.03.01.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 01:01:55 -0800 (PST)
From: Louis Rannou <lrannou@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: khilman@baylibre.com,
	Louis Rannou <lrannou@baylibre.com>
Subject: [PATCH v2 1/1] oeqa/utils/qemurunner: change the serial runner
Date: Fri,  3 Mar 2023 10:01:37 +0100
Message-Id: <20230303090139.207454-2-lrannou@baylibre.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303090139.207454-1-lrannou@baylibre.com>
References: <20230303090139.207454-1-lrannou@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 09:02:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177981

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
index 05385763ac..418e06a98e 100644
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
2.39.2


