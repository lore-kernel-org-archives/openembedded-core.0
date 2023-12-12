Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E3AC4167B
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:28:42 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.2858.1702391318629333772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:28:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=orhAEtbp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ce972ac39dso3546715b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391318; x=1702996118; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RbJY9JikY9IYu+tmDOAf5xamg3GHtjsrFebWtsbJrtg=;
        b=orhAEtbpSf3EXiymk8rK9Znckp9WkjxWmuvUYoZ6om7tsw1ki8tKh/Gu7q4Y+sPoql
         T8Z9knXzSu8/onI/DFPwrcZl2QobUk9CFXuqxrRVpcC6AJ39ENciHBahxiXA3xkaW0eX
         EXp9VKBophZmjy+afeSJT02P2jBVYLQLifN4tJ/o5iEQmC1eWplyDzm+tDBgU4RYPHrb
         MT8SyOdm+Kz9TmyA/wU2PWB+uKrds9nZUZWLQYhTgBS0is2vql4+7JzLRbNampEsv/1A
         yswSAHhEUSXDhol35W9qQea72k5AkEGum5qVQZolhLg+f0Assv67jKcCvp3Ua0fEhn3y
         nqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391318; x=1702996118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbJY9JikY9IYu+tmDOAf5xamg3GHtjsrFebWtsbJrtg=;
        b=sPK2MXembnlzLfB0/2H6XdKwcy1bIwLMFR8P8v+dH8r+qY3RSKpUO1Tlqk+ZkB6Gkm
         kfuF958zzGSyUFxW5Vhg9EAERBzipgkr/8kMpatFtZa0DY1lhTpgGrKoYeD57SFOrF/X
         fJa3150zEU4C0MkW5CnmlRk44uXEevspRdmtIdH/CMVfswmhMuB5fchQhaa6308Swn39
         dNqVJM7JNQTqWuLpc4qcpjfha7O+vzjKWAl0j5Xbwb/rsfPQJTHky5h4tk2t4roARrPV
         purIlOWr2Dy4n/RX0a/Hsy+uB1VFZuNPjzwHfqfVsDHmwSnqgsE9EBfUKmmdfADIUGIc
         +QDg==
X-Gm-Message-State: AOJu0Yz4OfhQfgM4iGNvb8LSm1J+TB/PLa26LGzqH7xfm2ecDg1BP4Wz
	lEqWFPkv8SIY9b6CLwss8DGCcCrwtswYYCh2eI8=
X-Google-Smtp-Source: AGHT+IGRjOWqj2vdKXRRamp4NpeO7agMvkP56KcuikforKaZk8AwSZv+RU6JVH/2/QfcBheqBwygiQ==
X-Received: by 2002:a05:6a00:9388:b0:6ce:2732:278 with SMTP id ka8-20020a056a00938800b006ce27320278mr3317362pfb.39.1702391317747;
        Tue, 12 Dec 2023 06:28:37 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.28.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:28:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 29/29] sstate: Ensure sstate searches update file mtime
Date: Tue, 12 Dec 2023 04:27:35 -1000
Message-Id: <427c43d8e3315fa6872feaa71d135de60c810de7.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702391115.git.steve@sakoman.com>
References: <cover.1702391115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:28:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192233

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Commands like "bitbake XXX -S printdiff" search for sstate files but don't download
them. This means that local files aren't touched as the download code would do, meaning
the sstate cleanup scripts can delete them. This can then lead to obtuse build failures.

Have the search code touch local files in the same way as the main code paths would to
avoid these files disappearing.

Move the function to a common touch() function in lib/oe instead of duplicating code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a27fc0bd5706ab5b9c68a0271fcf57377a678cdf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/sstate.bbclass | 12 ++----------
 meta/lib/oe/utils.py               | 12 ++++++++++++
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 2676f18e0a..5b27a1f0f9 100644
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
index a3b1bb1087..14a7d07ef0 100644
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
2.34.1


