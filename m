Return-Path: <alex.bennee@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68872C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 16:14:58 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.25599.1703088896089988837
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 08:14:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=bvQ0AkFP;
 spf=pass (domain: linaro.org, ip: 209.85.221.50, mailfrom: alex.bennee@linaro.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3367f8f8cb0so400788f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 08:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703088894; x=1703693694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6juBBnEmJsG+so+TVbHpai3wKyPe4Je+Epmso1dmzAo=;
        b=bvQ0AkFPbz1c0XcW10pBm0gcjjQ/ysaQVPqpCkTkmwXh5l0DN/fnrLu28NK+cZsMHK
         /RZhAglN/buFLI8sNtBnNsueFIcR4eVFWG/Q6mEnD/nfes/7g8kTDlPLv33m/Tuf26q8
         3l6/g50+/9O9zl754AKinZwUB/CIuaGPzV9RGuzQQZ2kQ/gD3xa+vk9QacvJf+7pZZJg
         juJE2TCQuMrxy6oDifeHymMhySd10oW2/34eqZe6XV7gcrZifyk0cr0PmVRSqkBF/6MW
         rwVuqMFVqKV/WtE/Ll3Mzp9VLvyqb9exNsPz7jHqg/93wbQxKW5ClG+hDJBl5Go6WAb2
         A6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703088894; x=1703693694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6juBBnEmJsG+so+TVbHpai3wKyPe4Je+Epmso1dmzAo=;
        b=fnDn8wv/V6Uy2/urScUQaWmFAKWJPS/BustTARV4ekZ1u0toKDllq6Ez/695N3iPHZ
         6h4n3dVfRGeKJMt0ZcqNOjNSd+eTYq7IENGdVqNSLcWeOyWow3IRP7WFjlppzxnBPKi9
         1OxrwWXfQtL8zU1lVtuy2YXwuQIVEd3qr3RcUF1RtGV/TAHPhBQvz+37NiMXmWCdYv6m
         pWVEYS4jnYu0zaVHVDbsgUvk4PMdHw4nSq7Tv1aDKYVcrZzYAqjVMDJLPtvc54dLr2C2
         ZwTGOzlVmUcuDvXjVttdDDglT3ZX7qPCnB+7mcEfxO0WnjjVoMLPb3mWCao3XnXWUC/i
         zckA==
X-Gm-Message-State: AOJu0YwLKO1F5RGlMnCiTunkDp/mdf7HyfOjsfY4yZ2CEd1XcDQtE3gk
	61L/yV4Trdrpm0lU4k3uKQCZOA==
X-Google-Smtp-Source: AGHT+IETt1Y9EmzuX1rHh7krLfcKbTD7EvJClr78yFaEzxg8gqKRKkRSgW6kB0ZywE+ia4O9QsbyQg==
X-Received: by 2002:a05:6000:907:b0:336:7127:5cfe with SMTP id cw7-20020a056000090700b0033671275cfemr1870830wrb.32.1703088894522;
        Wed, 20 Dec 2023 08:14:54 -0800 (PST)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id z15-20020a5d4c8f000000b003366b500047sm7266695wrs.50.2023.12.20.08.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 08:14:54 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id C22145F8BD;
	Wed, 20 Dec 2023 16:14:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	alexandre.belloni@bootlin.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] qemurunner: more cleanups for output blocking
Date: Wed, 20 Dec 2023 16:14:50 +0000
Message-Id: <20231220161450.1422484-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 16:14:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192802

If we are only tracking stdout and are not using self.readsock we end
up throwing an exception blocking further action from the thread. Fix
this by checking self.readsock is not None first.

While we are at it split even into fd, event to make things clearer
and handle the fail path of stringify_event by echoing the hex value
of the unknown flag.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 4a2246733f..7273bbc3db 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -785,19 +785,20 @@ class LoggingThread(threading.Thread):
         self.logger.debug("Starting thread event loop")
         while not breakout:
             events = poll.poll(2)
-            for event in events:
+            for fd, event in events:
+
                 # An error occurred, bail out
-                if event[1] & self.errorevents:
-                    raise Exception(self.stringify_event(event[1]))
+                if event & self.errorevents:
+                    raise Exception(self.stringify_event(event))
 
                 # Event to stop the thread
-                if self.readpipe == event[0]:
+                if self.readpipe == fd:
                     self.logger.debug("Stop event received")
                     breakout = True
                     break
 
                 # A connection request was received
-                elif self.serversock and self.serversock.fileno() == event[0]:
+                elif self.serversock and self.serversock.fileno() == fd:
                     self.logger.debug("Connection request received")
                     self.readsock, _ = self.serversock.accept()
                     self.readsock.setblocking(0)
@@ -808,14 +809,14 @@ class LoggingThread(threading.Thread):
                     self.connection_established.set()
 
                 # Actual data to be logged
-                elif self.readsock.fileno() == event[0]:
+                elif self.readsock and self.readsock.fileno() == fd:
                     data = self.recv(1024, self.readsock)
                     self.logfunc(data)
-                elif self.qemuoutput.fileno() == event[0]:
+                elif self.qemuoutput.fileno() == fd:
                     data = self.qemuoutput.read()
                     self.logger.debug("Data received on qemu stdout %s" % data)
                     self.logfunc(data, ".stdout")
-                elif self.serialsock and self.serialsock.fileno() == event[0]:
+                elif self.serialsock and self.serialsock.fileno() == fd:
                     if self.serial_lock.acquire(blocking=False):
                         data = self.recv(1024, self.serialsock)
                         self.logger.debug("Data received serial thread %s" % data.decode('utf-8', 'replace'))
@@ -864,6 +865,9 @@ class LoggingThread(threading.Thread):
             val = 'POLLHUP'
         elif select.POLLNVAL == event:
             val = 'POLLNVAL'
+        else:
+            val = "0x%x" % (event)
+
         return val
 
     def close_socket(self, sock):
-- 
2.39.2


