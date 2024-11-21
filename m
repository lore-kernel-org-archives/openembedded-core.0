Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A731E64039
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:55:01 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.10700.1732226093746799818
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:54:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KmWbwb5C;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7ea9739647bso1188709a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226093; x=1732830893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2frCu3S0iPIxXvlmiloiv1PEdz3W+5T/tBYyTavbGb8=;
        b=KmWbwb5CidPDe52LniQKUgT9Tzt4s9SNNTbsxN2FO/cP+KtRFJTE2nvoXKwPykDHyR
         hMxJTj5mukN/JNymB4wT8W1tLsVSwJpUP/OmgCFXc3M20Ned7hRN162KjENn93kX50Ww
         SDxh0haiOyvtYRC8Cbm3dGo7COyfV4HoQUmTB4j+fCYWiY/4FYoFppk66l3r+dzNukh5
         RCURPcQ7LEpUzwzjyz2UC67JEFrLBYXlkcEvXw1zd8OBzmoCbFIcUjxY/IB0k4Lj6wSf
         8xTjCZ0hni0OznACLmk+E8wiSoO7WOwdR5NJVtv8TO0FG8TE6FP4Thex+8aKeQZ7O2wQ
         K0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226093; x=1732830893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2frCu3S0iPIxXvlmiloiv1PEdz3W+5T/tBYyTavbGb8=;
        b=XDqbxR7gNNFL+J3Y02gEHhR0LAxCiWaFfv91rvHLGAFxBZf6LX8Kpm/+6nSrxPGCEv
         rPqjnz65xZye7dzkfeEoy1TiegJt9w7U+ywLld27DTI+yfW0+YUD5sLX2Eny6gg5DYyg
         pmxwPQnzPpwZ15zq39RIqq/2FIC1EiBzuCYTmDoe/7g/ZhRKDz6RmiPhGMXw/ESqYI2m
         J/toYb+f6hHAZwXNi/r0/onHYOlyMhLrox7/GFPudFjK+Dkah1UzWHuthiAajAXaHeLS
         IACC8JBFVbZeKWEpAB7aGqHBb3N5AQJCmEQ8h3e8pLpP7GunhkbACcCU7BzYdYhMRZeX
         KOtw==
X-Gm-Message-State: AOJu0YzMJ/P+gW6QNFG5cDDGfSOMTsIOOBSxIsrGKwgobwNLfu0QBG3X
	OwZQKYo9BxLkmDi6BVstVUGqmajt7+14hIrQsnW0dksoMd+vU8WByECYjvSajTXJgUzSv7+RrnN
	8
X-Gm-Gg: ASbGncvADYaU7E4Nl9f0RI7VrT7MLN2blApskx7QT6w9kEDAGFrUh0Ov0lkdSZ3JU1P
	YWrKW1oyMLSBYQ1hb+b/t2F7vHsr43jsx4z4jWaJ0wH8824ZSHu0iPe9fIVH331E+DOQ/HSS3s3
	qbN1yL6o/z1PejIIMUGUnCWzQnLYHXHJwp0hk8EDhnoba+d8GtMC+6F1TaXIMe+GbKwAM3fDMeD
	LMDNrwSAZJ/r2Gc/5uarBd4PqFXJ1uE5ej1RZM=
X-Google-Smtp-Source: AGHT+IHP833maJvGrc8WB+q9lLQc+XORFUIGXhUS2hdrYrOg54KerBVJhqwSbgakitK81uVfVWlkfA==
X-Received: by 2002:a05:6a21:2797:b0:1db:f7dc:f10c with SMTP id adf61e73a8af0-1e09e584e77mr479329637.28.1732226092911;
        Thu, 21 Nov 2024 13:54:52 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.54.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:54:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/27] qemurunner: Clean up serial_lock handling
Date: Thu, 21 Nov 2024 13:54:11 -0800
Message-Id: <f144fbdf1b029a58810f0662ba75291573989143.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207576

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Avoid "RuntimeError: release unlocked lock" since the lock shouldn't
be locked even in the error path. Add a try/finally path to ensure
this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b0732ee009ca47580d1d2ad75334f4aa50e6efd5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index cda43aad8c..f1c2d2b5c9 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -519,7 +519,6 @@ class QemuRunner:
                 except Exception as e:
                     self.logger.warning('Extra log data exception %s' % repr(e))
                     data = None
-            self.thread.serial_lock.release()
             return False
 
         with self.thread.serial_lock:
@@ -822,10 +821,12 @@ class LoggingThread(threading.Thread):
                     self.logfunc(data, ".stdout")
                 elif self.serialsock and self.serialsock.fileno() == fd:
                     if self.serial_lock.acquire(blocking=False):
-                        data = self.recv(1024, self.serialsock)
-                        self.logger.debug("Data received serial thread %s" % data.decode('utf-8', 'replace'))
-                        self.logfunc(data, ".2")
-                        self.serial_lock.release()
+                        try:
+                            data = self.recv(1024, self.serialsock)
+                            self.logger.debug("Data received serial thread %s" % data.decode('utf-8', 'replace'))
+                            self.logfunc(data, ".2")
+                        finally:
+                            self.serial_lock.release()
                     else:
                         serial_registered = False
                         poll.unregister(self.serialsock.fileno())
-- 
2.34.1


