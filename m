Return-Path: <victor.kamensky7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC78C10DC3
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 06:33:18 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.94618.1701757995239371864
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 22:33:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XGRAq3Pr;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: victor.kamensky7@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5c2066accc5so2104449a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 22:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701757994; x=1702362794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BO2XlT5AkTZtJOXBcY7sBfHpFGiG6m9DwZtBO7KaNck=;
        b=XGRAq3Pro3/E0YoKvwG7slJQdk5QXgTj/rBc67lCKlz5c/YpQuWG9TPWaCZ/cSEx3w
         /WB3AUr4vznuCyBNMOIcEql/HDTm52PLXnlHCAqzlK1/76fK2OXxaicvDNaT4c0QJttq
         +mfrfL+mBksdTHBH7t335qtaLAEEmr0WzS0Po8hoRMWlPSJJ5mLpESGpi8kxN6s33OU9
         yQgdITwWf5KRKLnjukIVV04qKb5kNwjW6+VAjWCUPx/WO12HlntQzqHjoWIOFIvXtcBU
         jBki1nbmhzXZ52PgLutGWnOCH0tH5TF2q0xIMWH82sJL99Wn4XvOxHm+4p4POcdXGN2I
         2F2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701757994; x=1702362794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BO2XlT5AkTZtJOXBcY7sBfHpFGiG6m9DwZtBO7KaNck=;
        b=D5iL+b8yvY8ZoqR6Qi3mKOJIXpdhgyme1qUKBfrqSTF3b4aRiP1pnBDlUhNriOwn2t
         kLrXV32eQtsxakvIcvMMTujpzqwrToA2VYUe+Gr9j0bW86APduju+95oOP4fUj3ngBFP
         uFf6ivXZSh5UgYKXtwUOWMnRMmH1o5nRtYHkrSnqm8TxrJLQU/jAhYUqwiyNtRuURVcz
         f8N/WH/dIfNxdaUvU/UAVZR4hu6iJ+GIHdLRwupA6fHHDs7d1TefKu0I+L5gGvlngB9M
         q2S7zyrVvAcYiBLUImrdRHahyoqleg0drI2FluA8JO5CH9yeVxF0K5yH425YcUGn3bNw
         evfQ==
X-Gm-Message-State: AOJu0YxfFpc2wrBdUmrWXR/zSuNn//nGSv33KW/AGTJ9o85L6OmRMMeJ
	kPXaUlIPdosdihT0lVB+ccfUgzHTfJ4=
X-Google-Smtp-Source: AGHT+IHWUM9CmX89mppo9HjACkakbECO3n2uGSj0x3mLD3P2KO7gqWQFQECZtOKf4s+v7NI/1menrw==
X-Received: by 2002:a05:6a20:230b:b0:187:7590:7f11 with SMTP id n11-20020a056a20230b00b0018775907f11mr2130840pzc.43.1701757994302;
        Mon, 04 Dec 2023 22:33:14 -0800 (PST)
Received: from kamensky-p15s.cisco.com ([2601:641:8080:1a70::7dab])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902ed8c00b001d0915435f8sm3722206plj.16.2023.12.04.22.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 22:33:13 -0800 (PST)
From: Victor Kamensky <victor.kamensky7@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Victor Kamensky <victor.kamensky7@gmail.com>
Subject: [PATCH 2/3] systemtap: do not install uprobes and uprobes sources
Date: Mon,  4 Dec 2023 22:32:48 -0800
Message-Id: <20231205063249.3433-2-victor.kamensky7@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231205063249.3433-1-victor.kamensky7@gmail.com>
References: <20231205063249.3433-1-victor.kamensky7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191796

Addresses the following do_package_qa warning:

WARNING: systemtap-5.0-r0 do_package_qa: QA Issue: File /usr/share/systemtap/runtime/linux/uprobes/Makefile in package systemtap contains reference to TMPDIR
File /usr/share/systemtap/runtime/linux/uprobes/git_version.h in package systemtap contains reference to TMPDIR
File /usr/share/systemtap/runtime/linux/uprobes2/git_version.h in package systemtap contains reference to TMPDIR [buildpaths]

Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
---
 ...ve-runtime-linux-uprobes-and-runtime.patch | 40 +++++++++++++++++++
 .../systemtap/systemtap_git.inc               |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch b/meta/recipes-kernel/systemtap/systemtap/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
new file mode 100644
index 0000000000..2d46a3962d
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
@@ -0,0 +1,40 @@
+From 5a01e28bd806326b2143e3e6bb28d4780c5d879d Mon Sep 17 00:00:00 2001
+From: Victor Kamensky <victor.kamensky7@gmail.com>
+Date: Sun, 3 Dec 2023 18:40:05 -0800
+Subject: [PATCH] Makefile.am: remove runtime/linux/uprobes and
+ runtime/linux/uprobes2 install
+
+"PR30434 continuation:  Removed old uprobes, uprobes2 implementation,
+uprobes-inc.h & any mentions of CONFIG_UTRACE." commit removed uprobes,
+and uprobes2 sources and directories, but Makefile.am still tries to
+install them. In fact after failing to 'cd' into runtime/linux/uprobes
+directory it copies top level *.[ch] files into
+${prefix}/share/systemtap/runtime/linux/uprobes directory.
+
+The issue was caught by OpenEmbedded project do_package_qa checks.
+
+Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
+
+Upstream-Status: Submitted [https://sourceware.org/pipermail/systemtap/2023q4/027880.html] 
+---
+ Makefile.am | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 5737c6b20..2ba896088 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -277,10 +277,6 @@ endif
+ 		do $(INSTALL_DATA) -D $$f $(DESTDIR)$(pkgdatadir)/runtime/softfloat/$$f; done)
+ 	(cd $(srcdir)/runtime/linux; for f in *.[ch]; \
+ 		do $(INSTALL_DATA) -D $$f $(DESTDIR)$(pkgdatadir)/runtime/linux/$$f; done)
+-	(cd $(srcdir)/runtime/linux/uprobes; for f in Makefile *.[ch]; \
+-		do $(INSTALL_DATA) -D $$f $(DESTDIR)$(pkgdatadir)/runtime/linux/uprobes/$$f; done)
+-	(cd $(srcdir)/runtime/linux/uprobes2; for f in *.[ch]; \
+-		do $(INSTALL_DATA) -D $$f $(DESTDIR)$(pkgdatadir)/runtime/linux/uprobes2/$$f; done)
+ 	(cd $(srcdir)/tapset; find . \( -name '*.stp' -o -name '*.stpm' -o -name README \) -print \
+ 		| while read f; do $(INSTALL_DATA) -D $$f $(DESTDIR)$(pkgdatadir)/tapset/$$f; done)
+ 	(cd $(srcdir)/testsuite/systemtap.examples; find . -type f -print \
+-- 
+2.31.1
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index bc2a9ff434..9fe85676fc 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -7,6 +7,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git;branch=master;protocol=https \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
+           file://0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch \
            file://0001-prerelease-datestamp-fixes.patch \
            "
 
-- 
2.31.1


