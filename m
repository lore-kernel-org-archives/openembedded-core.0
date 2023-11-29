Return-Path: <alex.bennee@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3755BC4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 12:45:33 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.32039.1701261922687821526
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 04:45:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=GB1zdN/F;
 spf=pass (domain: linaro.org, ip: 209.85.221.50, mailfrom: alex.bennee@linaro.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-332c7d4a6a7so4424905f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 04:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701261921; x=1701866721; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1PD1BACCUks78LADkPgzyBuFuV5F8pzApmBtA5Y+WVk=;
        b=GB1zdN/F98EfPZLEG27P/epWWbTm0f8lk7LMubs6U9FphzNw5Pam2QTfrlfHFOW2+s
         wr7GdxGJ4rAr+ISYMTuJf9KPjvpFoNWz1fHTl+DYiuoh1BknLiATgtMs5tcE3cEOz77P
         22GUj7oP+fSV5r5OIR9HVv5lba4QTmfeIyCVV5EjEvKPLw7tIm/QXwk2QZxtbIIg4nHA
         d/end75eyYaBQG2ZIZnzI9pO+LeVKgLV723twhH7/XKcvsfzn+0wLlP8ppJ1gmWmx+6Y
         haxGXyqWDyhE69snGPOCWWi5AXmebMRa25gw7gbXA/T8mh7VUwtusYReaDZFhjNdd+nd
         f7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701261921; x=1701866721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PD1BACCUks78LADkPgzyBuFuV5F8pzApmBtA5Y+WVk=;
        b=rOWRf2OALtlBVpTjoKf3PtdGsqMCd8nz4/IBymUTii4v+b6l5vQAuJItW97lvQ83X9
         duuZwei+waFUw4ajpC/5F6kvCPYNOgQjpqmeSwAJo2X6JVruQXp5CBWFrUrJYTcnc9Ua
         9u8GG1FrSWFgu2FRTv33rWrlaYOsi6YrCJxoLzoJJTg2oz40m/AFFE5exHlJMwkUcQHo
         xGoYekCTOv5zYVzsWZ/PjOSnV2G5dVzkxJjHjb3ZuaQWOSLfELgCNgNx16J/JoJBO0kE
         FAeVFtrbx4YDCqE4A+i+FBZXL9QZkvuZvtEQdBxxMDF1oK6Vx5NZhWJ2f+/C56vI3dye
         zn8w==
X-Gm-Message-State: AOJu0YyZp3ENwLSJaGdl8lGJ5mZ0sUrTeVQnRnVOMmru3ox98WqaLyYT
	6D4Jkoseo7zTPEIMWhrTB0LA+w==
X-Google-Smtp-Source: AGHT+IEhfzqbHRqu6UNa+DJV0dOLf8tti/b8j41pZzkomy+NLSrh0qzz/7k90VMrpFTAl7g6V/lz2g==
X-Received: by 2002:a5d:624f:0:b0:333:57:9552 with SMTP id m15-20020a5d624f000000b0033300579552mr6297167wrv.63.1701261921078;
        Wed, 29 Nov 2023 04:45:21 -0800 (PST)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id l15-20020a5d560f000000b00332f8f4960fsm11313671wrv.0.2023.11.29.04.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 04:45:20 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 657ED5FB45;
	Wed, 29 Nov 2023 12:45:20 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	alexandre.belloni@bootlin.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [RFC PATCH] qemurunner.py: ensure we drain stdout after boot prompt
Date: Wed, 29 Nov 2023 12:45:01 +0000
Message-Id: <20231129124501.86503-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 12:45:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191449

If qemurunner doesn't continuously drain stdout we will eventually
cause QEMU to block while trying to write to the pipe. This can
manifest itself if the guest has for example configured its serial
ports to output via stdio even if the test itself is using a TCP
console or SSH to run things.

This doesn't address a potential overflow of stderr although generally
stderr from QEMU will be a lot less likely to block due to the volume
of data.

Suggested-by: Erik Schilling <erik.schilling@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>

---
AJB:
  As a QEMU developer I should note that we've had to solve a lot of
  similar problems within our own internal testing (e.g.
  https://gitlab.com/qemu-project/qemu/-/blob/master/python/qemu/machine/console_socket.py?ref_type=heads).
  Perhaps in the longer term it might make sense to consider using
  QEMU's own python tooling for configuring and launching QEMU?
---
 meta/lib/oeqa/utils/qemurunner.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 29fe271976..1ec472c49e 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -243,6 +243,7 @@ class QemuRunner:
         # to be a proper fix but this will suffice for now.
         self.runqemu = subprocess.Popen(launch_cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, stdin=subprocess.PIPE, preexec_fn=os.setpgrp, env=env, cwd=self.tmpdir)
         output = self.runqemu.stdout
+        output_drain = output
         launch_time = time.time()
 
         #
@@ -539,6 +540,17 @@ class QemuRunner:
                 self.logger.warning("The output:\n%s" % output)
         except:
             self.logger.warning("Serial console failed while trying to login")
+
+        def drain_log():
+            while not output_drain.closed:
+                more_output = self.getOutput(output_drain)
+                if len(more_output) > 0:
+                    self.logger.debug("Logs since boot: %s", more_output)
+                time.sleep(0.1)
+
+        t = threading.Thread(target=drain_log)
+        t.start()
+
         return True
 
     def stop(self):
-- 
2.39.2


