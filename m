Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88701C6370A
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:59 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.23816.1650148135658857277
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 15:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JnBZMv4X;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id u3so14545412wrg.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 15:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=biHgQI1cqvV99gVVyj6UQ5Fo82KTb/qOM2TMPveBy6k=;
        b=JnBZMv4XnhIg3UZLY5VpVj3wiibH6j/KpSFw/XdIA+vlT7b7NIT0anVB9gKFNHdyh6
         TVT+d6cGWwcJhJbTxnfU2eZEkaYIeSdz/YlymXoO9qhZ2hMzIpxNFVleeJJhM3KSSLP4
         LK5DV89GXNIlSScFHgf8eAKTCtc37IgbWRWzcBqapzNsjYFlrTWnR/fBhyKD6oD8S4Oi
         g/PsyTRJSPH2PekYvnaebXuohRvc0Chbh5POl1vGWYnZM+SycqgL452mvPMG27p4ZuUl
         GTWstN6cMI8uJ0xIUAO3rPY5++tGUZtFS7/1FnXfPzcdJhrKgfImmRl5WLVCk7HLi50C
         DRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=biHgQI1cqvV99gVVyj6UQ5Fo82KTb/qOM2TMPveBy6k=;
        b=qSCGmrUIN2sjZrNulOrR7HCVW2nioCMj1zQt+6XXo6SLWTpogzaXWYo9klz/cMNibO
         Y6Bznpw+449kk5IppSLnwdGyA2PW+hcLHmchMborhGXT7zAX4qXsx+A821T7WEfdCYkY
         kzrg4aPJxzmmjVliljoYOFxd6cESW3XLv8a9BIk6wvqamjjiRb9zH+2eATavU+A7qo09
         fJI7P/sN2DIhHAfO26zkU7b7RLsgIHV0e0anXoC6kgknHukE0vzxZsFGB1+SVLEE20Gj
         Xr8zFbh/AE074e7SKEZO5GKkZHdqpNcCH5xplk6M6jigMiUrJF1Ke0k5EXH62+bc+PQO
         8SeA==
X-Gm-Message-State: AOAM531tRFeWe8GwI3W7OAIGP7+ipcJ4PQ3mUwCcSnJGBMpvA/8DA3l/
	6AYMm0ZVz3IX+Hjg+aSBjs0mYLbUMu/Vsw==
X-Google-Smtp-Source: 
 ABdhPJzuZqdEqwKOVF/kCAQDMjjBmdKaF4nwHTT2XDWYC8Wj8qBlvzwzrjHcjd1drZ4AidqaNiey4A==
X-Received: by 2002:a5d:44d0:0:b0:207:9ac8:2c3b with SMTP id
 z16-20020a5d44d0000000b002079ac82c3bmr3525460wrr.688.1650148133707;
        Sat, 16 Apr 2022 15:28:53 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 b1-20020a5d40c1000000b00207b49d3023sm6838104wrq.44.2022.04.16.15.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 15:28:53 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [RFC][PATCH v2 1/4] sstate: add a LockedSet class as python set() is
 not thread safe
Date: Sat, 16 Apr 2022 23:28:43 +0100
Message-Id: <20220416222846.219151-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164563

With this LockedSet python class we can call the 'add' and 'remove'
safely inside the ThreadedPool.

This piece of code is taen from the stackoverflow
https://stackoverflow.com/questions/13610654/how-to-make-built-in-containers-sets-dicts-lists-thread-safe

Fixes [YOCTO #14775] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=14775

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 1c0cae4893..a3ba748a1e 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -918,8 +918,28 @@ sstate_unpack_package () {
 BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
 
 def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True, **kwargs):
-    found = set()
-    missed = set()
+    # https://stackoverflow.com/questions/13610654/how-to-make-built-in-containers-sets-dicts-lists-thread-safe
+    import threading
+    class LockedSet(set):
+        """A set where add(), remove(), and 'in' operator are thread-safe"""
+        def __init__(self, *args, **kwargs):
+            self._lock = threading.Lock()
+            super(LockedSet, self).__init__(*args, **kwargs)
+
+        def add(self, elem):
+            with self._lock:
+                super(LockedSet, self).add(elem)
+
+        def remove(self, elem):
+            with self._lock:
+                super(LockedSet, self).remove(elem)
+
+        def __contains__(self, elem):
+            with self._lock:
+                super(LockedSet, self).__contains__(elem)
+
+    found = LockedSet()
+    missed = LockedSet()
 
     def gethash(task):
         return sq_data['unihash'][task]
-- 
2.35.3


