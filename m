Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49D7C48BE8
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.7397.1649904759755057413
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:52:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=miQAsLUB;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id p8so3625250pfh.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ee7cn4pZORMa9Ntb8zHk2fsZSvoCILD8YOuPvijRFPg=;
        b=miQAsLUBWG8+WDBMvJNPRb0yjCX4+NHveHSpJ8BEs/nnnJjze/eQCxYp/XjeVBxYD+
         YZHvSPgVQX+NxLYW11n7hvRY2pIzUIA7WrT3HWGLKVKdbxQmaN0EX1lLoJs0G6H6XW+d
         Rg1d55mSYRJlfVerjDMEvf5dEh0ay5mtECWc7btBE1LPcu9Q8I14O5a3apewUhtzHCXz
         +aSh1+YuTu+w5iCKXe9cdnOh0diS7Kf+r45G0NGBbxVkkwojRzOT23P7B5p/oKbDlsRp
         8UFfPooR7W4OgyvgDJoigIC99XcjFFMvjLYKvdjmcTNXiOA/oQnGnuihgHxGloVVei4b
         rWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ee7cn4pZORMa9Ntb8zHk2fsZSvoCILD8YOuPvijRFPg=;
        b=OE6H/UUzLK51REbZ3+4q73hzC0NgRU8d9ip43ya6lvUQyDleVwD+pfQRQZSVfR2QA5
         aVvdbkocDTttnGIrvCCA+s6C7kFPLOuOmVbgtgkbDNnR/6iCX03Lx5hSkBH+J54rEgnK
         lvd83dc5PIzOFsMz4XqFAFy9FYY9OqGTvINeVN0HWUofN9t4fm73zTSez4kKn0RaQNO+
         MNJklRINKT0Y5hNfSRwpCAYcgWNdP9ubNqRUC6h3svPXJcjRFUrbLtPVv66eudQqfTIy
         NIe4Ja0ABlYoUuNLS9BrN55pW8ZJnYdYreibuokZweBejJVzgxkLt8BKNgiDQN0iaySC
         4ANQ==
X-Gm-Message-State: AOAM533wHxObCcuVBskZkFMXP1h5qP905A50khbiKM3PxTmjwQ4ds4IF
	jmoyOSsIqCWvjEwMYMIFuOgFTS+/l/Z37Q==
X-Google-Smtp-Source: 
 ABdhPJxjvJT0e/Mo9qG0civE9L0sa0sdXnS+bbjBsNtkVzEbznTnnHBrjIjcJWfSpViKiKVCx9B3vg==
X-Received: by 2002:a63:7c42:0:b0:39c:c333:b3d4 with SMTP id
 l2-20020a637c42000000b0039cc333b3d4mr562107pgn.456.1649904758966;
        Wed, 13 Apr 2022 19:52:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::4307])
        by smtp.gmail.com with ESMTPSA id
 81-20020a621754000000b005082073f62dsm453735pfx.12.2022.04.13.19.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 19:52:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 6/6] pango: Skip test-layout ptest
Date: Wed, 13 Apr 2022 19:52:30 -0700
Message-Id: <20220414025230.1166825-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220414025230.1166825-1-raj.khem@gmail.com>
References: <20220414025230.1166825-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164383

This has intermittent behavior, is sensitive to harfbuzz version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Skip-running-test-layout-test.patch  | 45 +++++++++++++++++++
 meta/recipes-graphics/pango/pango_1.50.6.bb   |  4 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/pango/pango/0001-Skip-running-test-layout-test.patch

diff --git a/meta/recipes-graphics/pango/pango/0001-Skip-running-test-layout-test.patch b/meta/recipes-graphics/pango/pango/0001-Skip-running-test-layout-test.patch
new file mode 100644
index 00000000000..c391e158d28
--- /dev/null
+++ b/meta/recipes-graphics/pango/pango/0001-Skip-running-test-layout-test.patch
@@ -0,0 +1,45 @@
+From b9bfe3a79f165682a6db3d7ee1928365e93b1ccf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 13 Apr 2022 19:39:29 -0700
+Subject: [PATCH] Skip running test-layout test
+
+This fails intermittently, it varies based on what version of harfbuzz
+is installed and if it does not match with what pango CI tests then we
+get random failures in this test. This has been disabled in other
+distros [1] too
+
+We want to drop this on next upgrade and see if this test passes if not
+then keep it disabled
+
+Fixes
+
+Running test: pango/test-layout.test
+1..36
+ok 1 /layout/letterspacing.layout
+ok 2 /layout/valid-7.layout
+not ok 3 /layout/valid-14.layout
+Bail out!
+FAIL: pango/test-layout.test (Child process killed by signal 6)
+
+[1] https://github.com/archlinux/svntogit-packages/commit/3f883e7ff8071adad23b6bcc0ba4b995aff10d52
+
+Upstream-Status: Inappropriate [Distro specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/test-layout.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/test-layout.c b/tests/test-layout.c
+index 1139e4f..b47a066 100644
+--- a/tests/test-layout.c
++++ b/tests/test-layout.c
+@@ -222,5 +222,5 @@ main (int argc, char *argv[])
+     }
+   g_dir_close (dir);
+ 
+-  return g_test_run ();
++  return 77;
+ }
+-- 
+2.35.2
+
diff --git a/meta/recipes-graphics/pango/pango_1.50.6.bb b/meta/recipes-graphics/pango/pango_1.50.6.bb
index cd04801db10..93e16534641 100644
--- a/meta/recipes-graphics/pango/pango_1.50.6.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.6.bb
@@ -18,7 +18,9 @@ inherit gnomebase gi-docgen ptest-gnome upstream-version-is-even gobject-introsp
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
-SRC_URI += "file://run-ptest"
+SRC_URI += "file://run-ptest \
+            file://0001-Skip-running-test-layout-test.patch \
+"
 
 SRC_URI[archive.sha256sum] = "a998bcf36881c3ac20495d40bceb304f4eaa9175bd2967c85656434cbdafe86a"
 
-- 
2.35.2


