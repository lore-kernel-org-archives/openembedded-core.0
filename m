Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.8260.1620831536167152520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hKukcONR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.44, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f44.google.com with SMTP id n32-20020a9d1ea30000b02902a53d6ad4bdso20796163otn.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4RryR48gNOpkLetiqu3DgJVjVVVLCNzPHRlHUHuZgmA=;
        b=hKukcONRwDYjWPbdcR8FmaZpfIMGeDcaFuPh2Ry7dr8a6Uxal72BjfDeVneCxwNi8p
         D7s2bNEivEtN7RmaJZTQzWlYVVFEtkjN3FDtnSdWgUYxslvy/DRnmjUMdYj3/2Xz3hrn
         /Z/YwAkC8gzo3v/yD1JvoyWrsoO5KCh1hOYqtDASlJbTH6oiraxtcf6ObT23TGACc4CZ
         BJpXoBmUSNlSjgWgihxFEkOHaCxcCmpF0I1PxVs4I8/wPoVcBwzLCr2QD0d94aYoMnXp
         E3jmRyhFNTVw2iBDOq9uxu2T+HVcayGOOO0nU/OrZCYO4IZwVarQNzELmJ54TNr6Rszj
         hbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4RryR48gNOpkLetiqu3DgJVjVVVLCNzPHRlHUHuZgmA=;
        b=WfAedbAmEyebdgaMMNIfM9/pY8PEGuGKQs1nsuQE+PclZQKaQHz3eA/2STYT8aO8vx
         3+AhPBhBrs+AHpS876kSknDr3ec4lvE+XlBwxKrbtAkuw3uPZONRG5ndu7XwJhzyA0Mf
         C9QwJ0yY73372Pwrec/wJxoVsL8X50Zw9yN3bRKY6RTYiOKwosHwRf7R/HH26wtL9v7S
         o1vMdMCmUdvktKovL9ora9BsvdgpvZPmQLsDe6Rwp7pFdCB/jYWOgoJWOV8DgSxiwg4P
         50jMlKPLlzsmqv0PzbxN1+OFoBZazTMz7z9KZ+6HW34jQqKCQ0lbIck6QsDz41fKL8v4
         0O1A==
X-Gm-Message-State: AOAM532bKpai9wVG4VZE2n+UNaSpfoGGHzEtexx0ypRZe9kRDy7t+nRf
	pTNC87lsdjR4wtTTxNp2JGV4bXQu1KeXgj9X/Og=
X-Google-Smtp-Source: ABdhPJzIebaQJFZtlw7TiNg9Fg73vvjTEus8Ni8yKIZ9wHBa23n0VPsEd6MFVzk5ebWh/v34KJjTEA==
X-Received: by 2002:a05:6830:55b:: with SMTP id l27mr30818295otb.260.1620831535101;
        Wed, 12 May 2021 07:58:55 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 21sm1678otg.4.2021.05.12.07.58.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:58:54 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/22] oeqa/qemurunner: Fix binary vs str issue
Date: Wed, 12 May 2021 04:56:54 -1000
Message-Id: <d024fec441148d1022dd57cd3bb9f12bd10a6378.1620831171.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620831171.git.steve@sakoman.com>
References: <cover.1620831171.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The recent logging changes for qemurunner showed up as errors on the
autobuilder where decode couldn't be called on the returned string.
Since the code returns binary data, return b'' instead of '' to match
to avoid tracebacks.

One of these cases was newly added, copied from the other which has
been there for a long time, always broken.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b8995b27db265b0a0b2d2ca595915f70f9f96e07)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 410789b815..09ef9fadb2 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -646,7 +646,7 @@ class LoggingThread(threading.Thread):
             data = self.readsock.recv(count)
         except socket.error as e:
             if e.errno == errno.EAGAIN or e.errno == errno.EWOULDBLOCK:
-                return ''
+                return b''
             else:
                 raise
 
@@ -659,7 +659,7 @@ class LoggingThread(threading.Thread):
             # until qemu exits.
             if not self.canexit:
                 raise Exception("Console connection closed unexpectedly")
-            return ''
+            return b''
 
         return data
 
-- 
2.25.1

