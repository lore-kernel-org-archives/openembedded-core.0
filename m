Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A36FCF258D
	for <webhook@archiver.kernel.org>; Sun, 13 Oct 2024 07:38:35 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.27423.1728805096264385787
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Oct 2024 00:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FYpnaNiT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d4a5ecc44so2229193f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 00:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728805094; x=1729409894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OFdM6ZAOchzX25Q9k6+H6WXetjrz86PpbxhNhr4YjUw=;
        b=FYpnaNiT5+/Q94xvM4AB1TaV/sE83DFpMp+F9CmgZclocb79DB+JxS6lkoOTpKJS8c
         3rLbejJ9NKAZbeCy2jDBad8Htg2nWMeLsJ9j3fxK0ffBPXrEtI9xZMwE6XrWdsVdF1VO
         lM89NrtbuVwfxW2MDB41FSVHqjqAASuwHKD18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728805094; x=1729409894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OFdM6ZAOchzX25Q9k6+H6WXetjrz86PpbxhNhr4YjUw=;
        b=JR4Bar5Jb8hut2INsy/nOsNzPHFAn4zGEkSiaXxJs/0m3EUu1tgvr0bAm0QNcADsxE
         WYKF+YmXFxK6nofUditD+yPpGLyE4kCo7aEg3brD7AE6XNvyOqEBFPr7shJD3izofqEB
         P8yArrm7aI6EYsvu3TmvJdqW122yTFdznQPpeWlwRQxVSCNSR7BuN3N+o5UkE+rsZsAX
         zoHdRosfAKg/fjv20TenKPPfUDSeQhmHRN9J18z3u7ykhHZZt349PrWf1Xg7OK5HFTKN
         8lKabJ4gbSHxOsGrTZPNwLUsQgPnJ9HaCYIfMlsO8nECtZNJu/gVF/5Sw0fwcH20CH7j
         xBlQ==
X-Gm-Message-State: AOJu0YytqzI1iXpC95mYJsF8WoAn5iuebdtiX0M3KTGnBViU1Lm+zMnK
	6E8kHmJ8U1D7MvHuf9nKkcRA+IfVEqHpVSp6tQe6DOZqrUb2bKmvMouXjqCLlVcacjpgZ+R0RtS
	H
X-Google-Smtp-Source: AGHT+IHNLyMxcuLwg8P6o7Y/a96UvIhhKqcgtS46uhs0e/gtnlPROZsZ1mSUhKDgqjMJZK4+lngTbQ==
X-Received: by 2002:adf:fd0f:0:b0:37d:4cef:538b with SMTP id ffacd0b85a97d-37d552073c0mr5010209f8f.26.1728805094159;
        Sun, 13 Oct 2024 00:38:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:145f:f6b9:9ebe:60c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b7ef95asm7921917f8f.105.2024.10.13.00.38.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 00:38:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemurunner: Clean up serial_lock handling
Date: Sun, 13 Oct 2024 08:38:12 +0100
Message-ID: <20241013073812.1244815-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 07:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205716

Avoid "RuntimeError: release unlocked lock" since the lock shouldn't
be locked even in the error path. Add a try/finally path to ensure
this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 5c3a8e5999e..98a11e1a2c3 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -521,7 +521,6 @@ class QemuRunner:
                 except Exception as e:
                     self.logger.warning('Extra log data exception %s' % repr(e))
                     data = None
-            self.thread.serial_lock.release()
             return False
 
         with self.thread.serial_lock:
@@ -824,10 +823,12 @@ class LoggingThread(threading.Thread):
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

