Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53FAC4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 16:43:51 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.59035.1699289024292329937
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 08:43:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e8IQelqp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.180, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c54c8934abso66623061fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 08:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699289022; x=1699893822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ABSbCthUsh3EikMUMzObF10+P7j+8I2ilavVZ3UxJWE=;
        b=e8IQelqpvAhljbLZGdh+3Sv3DPth/e5mYTbLj7mJteUI8qipVzxYXpp5uYRTXsgLUc
         BskNMmoF+X5aokxJt/sJKDN6qrwlwn4qnYWY43IH2Dknyrr2Y1m6g2ibkC0r7Pcy1cWN
         1LUDv12rj4Hks51w2zZ/OU70FrEU2b9M+y9Jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699289022; x=1699893822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ABSbCthUsh3EikMUMzObF10+P7j+8I2ilavVZ3UxJWE=;
        b=UAoUovwzlL+OagQQ0rNWxoLNI66EBK44feQkQqAG4oxk+YgUeqIpXWWk5VPvbfzUoT
         5UIWOA8VuOT5Vy1zY/W4ml2Eibt3dajC6qDabyGMOChxwZzTtTC0kCFwQp+0Dl+y7rtG
         LhhNtwFdEA4in0OVKW1UhVlMcQXkNMg5k5DfuIa0HyIKOTvPMdLG4M4UZuQN0tc1NR4H
         OSlAu06E2TU5IOJjwJI0TkwfKGTexwPzccEBSEkMoIlvcNeJvysEV0aIxqDHB4JtLWSy
         LMX/GawDEZElg4zceH4JMZQkrvA+gbM6g3CsHIZicGYcVJ6RLpS53Ylx+s2pLYz8L+UL
         YJrw==
X-Gm-Message-State: AOJu0YwNb2y8H5YcHDv63rjGCRySdN2zCDxkblRQt6bN8CNg9GX3Ii9c
	w/VhfWLkGOCfRvwJvrn0994nSEDp+ohyZm/0sGE=
X-Google-Smtp-Source: AGHT+IFeXtCtKjQeDka3+IOGntdEcUggvDfDalghTLI3kBbue1+3w5QKjKsbuJWQ3xDhRKU4rYq20Q==
X-Received: by 2002:a2e:9e4c:0:b0:2c5:19f2:4fde with SMTP id g12-20020a2e9e4c000000b002c519f24fdemr20707763ljk.23.1699289021577;
        Mon, 06 Nov 2023 08:43:41 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1ccc:c310:74c7:1597])
        by smtp.gmail.com with ESMTPSA id f6-20020a05600c4e8600b003fefb94ccc9sm13131383wmq.11.2023.11.06.08.43.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 08:43:41 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] sstate: Ensure sstate searches update file mtime
Date: Mon,  6 Nov 2023 16:43:38 +0000
Message-Id: <20231106164340.1213043-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 16:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190235

Commands like "bitbake XXX -S printdiff" search for sstate files but don't download
them. This means that local files aren't touched as the download code would do, meaning
the sstate cleanup scripts can delete them. This can then lead to obtuse build failures.

Have the search code touch local files in the same way as the main code paths would to
avoid these files disappearing.

Move the function to a common touch() function in lib/oe instead of duplicating code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 12 ++----------
 meta/lib/oe/utils.py               | 12 ++++++++++++
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 2676f18e0a2..5b27a1f0f98 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -937,6 +937,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         sstatefile = d.expand("${SSTATE_DIR}/" + getsstatefile(tid, siginfo, d))
 
         if os.path.exists(sstatefile):
+            oe.utils.touch(sstatefile)
             found.add(tid)
             bb.debug(2, "SState: Found valid sstate file %s" % sstatefile)
         else:
@@ -1183,16 +1184,7 @@ python sstate_eventhandler() {
         if not os.path.exists(siginfo):
             bb.siggen.dump_this_task(siginfo, d)
         else:
-            try:
-                os.utime(siginfo, None)
-            except PermissionError:
-                pass
-            except OSError as e:
-                # Handle read-only file systems gracefully
-                import errno
-                if e.errno != errno.EROFS:
-                    raise e
-
+            oe.utils.touch(siginfo)
 }
 
 SSTATE_PRUNE_OBSOLETEWORKDIR ?= "1"
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index a3b1bb1087d..14a7d07ef01 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -7,6 +7,7 @@
 import subprocess
 import multiprocessing
 import traceback
+import errno
 
 def read_file(filename):
     try:
@@ -528,3 +529,14 @@ def directory_size(root, blocksize=4096):
         total += sum(roundup(getsize(os.path.join(root, name))) for name in files)
         total += roundup(getsize(root))
     return total
+
+# Update the mtime of a file, skip if permission/read-only issues
+def touch(filename):
+    try:
+        os.utime(filename, None)
+    except PermissionError:
+        pass
+    except OSError as e:
+        # Handle read-only file systems gracefully
+        if e.errno != errno.EROFS:
+            raise e
-- 
2.39.2


