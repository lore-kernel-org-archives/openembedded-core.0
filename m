Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D45C7618D
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:20:22 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.16129.1678375214732099128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:20:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P2KBZP36;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id p16so1397944wmq.5
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hvi0eLB+Md97g29FKCIjwT7rEAUy/stboqe0zOg3+w=;
        b=P2KBZP36qeVH3rL0oeHLMkhJU9CVAegRZnPclpS+Tr9MSnGFwFsOegqpVj9Ge/S8jx
         GZnwcaUsP7yO/1C7y08FTeL3w3gE9vUoKxpCy7tOQWqb/zfdsmpyDmKjTiyllHYJbGwV
         b8xcuJrdnq7z2ICHzF0FVbPDgkB+7EeUNh52ZhXprFPYIWoZioRJ0w3lTn0Z2T/N0PDf
         mjlQZ5FgOzLvSNrlYXq9yEZxn2XDfgAIA0UmCZCU5ZNkFeXZjel9dK+6C2LyNchatclY
         As4GQPB+LHRUcQMkiSj/rSfnLGf+eJ9PouXc2jg5Q08y7ElycyVNXYkeYrgOjIcI/Kj6
         FlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hvi0eLB+Md97g29FKCIjwT7rEAUy/stboqe0zOg3+w=;
        b=GuDV3NB959bOWTWt/QyZMFwZD+0bImZRWKA+L8S7FYPGWYB5LN8mOenVAHvRnXCwxk
         +1XP1WiAqu9rQKYLvfBfbgnY7qieOXr7pID8dkoI5luRw3u6yZ3pI+1kxnFxiBgF1i9T
         sDzrSSTVyT2Reo/vY/o2u8uNPsOK6MguqRvuYqw+Fm0YcCuPteko0lK2KM4ybAwlwvqw
         AAjRRkfT9VG+XeoXYZFi1YNX8JDKaWBWmUmHomsg2rK8KbbTZDopKQEXEDKffNVjuZ5F
         hNtJ5unmjipsJktO0YiwSO7lkT7Xo84XorWS5qz72yWSrs69NfuhSKY6JY0rfJjPJNmj
         Qk8Q==
X-Gm-Message-State: AO0yUKU5B7k+M/qqpRhOxlZHM+dxo6A7xC1WXWC6Q55FMfB5hCNdkeFY
	9y+weiMWE8EUfd70gvy/JOFEgOO4Rnw=
X-Google-Smtp-Source: AK7set+mwTCuQqPQ0ORdYaNAFC56yvCcqN2NePUk7NsPBQ22lpLH9eGCWAKThrB3og9GzqO4h366qw==
X-Received: by 2002:a05:600c:a42:b0:3e2:d3:b2b6 with SMTP id c2-20020a05600c0a4200b003e200d3b2b6mr16053858wmq.14.1678375213275;
        Thu, 09 Mar 2023 07:20:13 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm18314521wrm.23.2023.03.09.07.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:20:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/26] make: upgrade 4.4 -> 4.4.1
Date: Thu,  9 Mar 2023 16:19:49 +0100
Message-Id: <20230309151958.3619193-17-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230309151958.3619193-1-alex@linutronix.de>
References: <20230309151958.3619193-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178243

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/make/make.inc           |  5 +++
 meta/recipes-devtools/make/make/sigpipe.patch | 42 -------------------
 .../make/{make_4.4.bb => make_4.4.1.bb}       |  3 +-
 3 files changed, 6 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-devtools/make/make/sigpipe.patch
 rename meta/recipes-devtools/make/{make_4.4.bb => make_4.4.1.bb} (70%)

diff --git a/meta/recipes-devtools/make/make.inc b/meta/recipes-devtools/make/make.inc
index a0a72b6295..56b863480c 100644
--- a/meta/recipes-devtools/make/make.inc
+++ b/meta/recipes-devtools/make/make.inc
@@ -11,3 +11,8 @@ SRC_URI = "${GNU_MIRROR}/make/make-${PV}.tar.gz \
 inherit autotools gettext pkgconfig texinfo
 
 PROVIDES = "virtual/make"
+
+# Otherwise $CXX leaks into /usr/bin/make
+do_configure:prepend() {
+    unset CXX
+}
diff --git a/meta/recipes-devtools/make/make/sigpipe.patch b/meta/recipes-devtools/make/make/sigpipe.patch
deleted file mode 100644
index a7270fdbda..0000000000
--- a/meta/recipes-devtools/make/make/sigpipe.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 92ab2e642d2c04b3dcb5a736ae6193680bfd5f74 Mon Sep 17 00:00:00 2001
-From: Paul Smith <psmith@gnu.org>
-Date: Sun, 6 Nov 2022 15:22:02 -0500
-Subject: * src/main.c (main): [SV 63307] Handle SIGPIPE as a fatal signal
-
-Always ignoring SIGPIPE is visible to child processes.
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/make.git/commit/?id=92ab2e642d2c04b3dcb5a736ae6193680bfd5f74]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/main.c | 8 +++-----
- 1 file changed, 3 insertions(+), 5 deletions(-)
-
-diff --git a/src/main.c b/src/main.c
-index eec9365..f2caf7a 100644
---- a/src/main.c
-+++ b/src/main.c
-@@ -1182,11 +1182,6 @@ main (int argc, char **argv, char **envp)
-   /* Useful for attaching debuggers, etc.  */
-   SPIN ("main-entry");
- 
--  /* Don't die if our stdout sends us SIGPIPE.  */
--#ifdef SIGPIPE
--  bsd_signal (SIGPIPE, SIG_IGN);
--#endif
--
- #ifdef HAVE_ATEXIT
-   if (ANY_SET (check_io_state (), IO_STDOUT_OK))
-     atexit (close_stdout);
-@@ -1265,6 +1260,9 @@ main (int argc, char **argv, char **envp)
- #ifdef SIGQUIT
-   FATAL_SIG (SIGQUIT);
- #endif
-+#ifdef SIGPIPE
-+  FATAL_SIG (SIGPIPE);
-+#endif
-   FATAL_SIG (SIGINT);
-   FATAL_SIG (SIGTERM);
- 
--- 
-cgit v1.1
-
diff --git a/meta/recipes-devtools/make/make_4.4.bb b/meta/recipes-devtools/make/make_4.4.1.bb
similarity index 70%
rename from meta/recipes-devtools/make/make_4.4.bb
rename to meta/recipes-devtools/make/make_4.4.1.bb
index 6642c708d8..c73751ddcb 100644
--- a/meta/recipes-devtools/make/make_4.4.bb
+++ b/meta/recipes-devtools/make/make_4.4.1.bb
@@ -4,11 +4,10 @@ require make.inc
 
 SRC_URI += " \
            file://0001-m4-getloadavg.m4-restrict-AIX-specific-test-on-AIX.patch \
-           file://sigpipe.patch \
            "
 
 EXTRA_OECONF += "--without-guile"
 
-SRC_URI[sha256sum] = "581f4d4e872da74b3941c874215898a7d35802f03732bdccee1d4a7979105d18"
+SRC_URI[sha256sum] = "dd16fb1d67bfab79a72f5e8390735c49e3e8e70b4945a15ab1f81ddb78658fb3"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


