Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D13D6394E
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:57:44 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.13848.1732111062172289161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dAv8HkY5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21210eaa803so37124855ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111061; x=1732715861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2frCu3S0iPIxXvlmiloiv1PEdz3W+5T/tBYyTavbGb8=;
        b=dAv8HkY5JEnQ1vdF+EbdlDJBVhKM3K5r2cWcYxkxUyZIyfRd3YuxmZHM6mjmkX0PRL
         NsUGpBKwB/naPuvPgjKr22Pug+nBOCJYtjPkVwaejfTlhaIJhYMdSBRBXlXRj4HYeIAA
         3/q5279Nxpc6r+f4V41FDDLEYsCUIx1HLs/AUTDkuH0j0UIYLnHQfYm8fNJIA/CT6WeZ
         UHbTiE5wgmlyxARtfDReNa8Os3eQHxCdEJOO13UaoQBgY/CvPdfLmIYLtGqVyd+E4mmv
         dhxRh9HQlsipX8rEYkhK/bo9idYHx9mPOgveUtDdHcvC6w+sNgN6DhmPBAD92ybDfGkB
         M1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111061; x=1732715861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2frCu3S0iPIxXvlmiloiv1PEdz3W+5T/tBYyTavbGb8=;
        b=axFJcyIsFVl0G9xVTMhuYxC0KEZ39yeOaf/U1ymFAj3TnrxDyl70rNI9Qgm5RBV6Ah
         0igq8RlJxvexWMrG4njLmn75RLnNCjcYPWxO1N98I5/PeAK6qqjxljJ0/JdSJGUvjw5N
         XhrVjRevxfQan+77dLngvyg0+46Pvi7kPJhFq2AMBhtmjaytumjVtbhY5C50vuOq/g7r
         yk+APNW3jyheG1KdwcqujziG7Vlzdfc54hYLSCqdOO/qv1spb4kNnvEgXH5dgpLZHhG5
         7qNGL0Bh129T1hK9p7CwWdD5mSngmV6fh4YlwOQS5cDiSzJL0aiKYbHWPuXty31XK/d6
         8Yjg==
X-Gm-Message-State: AOJu0YyFF9cgQZEgTstisnRFIEQM7KtBM0yKvX0jpcOHr7kdH4iFCrgf
	Tnih/nqBzor2IEYUIPMuKHGcXGa0AVPn6utuObd/Zdy6Hh3VoaN4Xyqp1YvCMusDiFhjn3WsCOw
	I
X-Google-Smtp-Source: AGHT+IGmRlQEwZ0alwBarxyMpU8Lry7gSHLDZe30X7FsL0vKKiAAoBJKxE0ozZuI4TUbBE/k7y0yiA==
X-Received: by 2002:a17:903:41c6:b0:20b:ce88:1b9d with SMTP id d9443c01a7336-2126a486965mr28983215ad.45.1732111061435;
        Wed, 20 Nov 2024 05:57:41 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 19/31] qemurunner: Clean up serial_lock handling
Date: Wed, 20 Nov 2024 05:56:51 -0800
Message-Id: <72b930a2482d35a533755de35983d933db97b1a8.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:57:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207443

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


