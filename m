Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59547C44507
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 16:37:13 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1950.1783701426842609805
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 09:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=06LroGBr;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so5824025e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 09:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783701425; x=1784306225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BwZSNwyJreqe214qhJ8Rx2I5nElYTJyC4owvRlMCnKM=;
        b=06LroGBrYsjZlkVXwvoTUqsuoTZuIfUDy93de9vawVM5fWA3WWnfmoJRDYBJ+OzhSS
         h+yKgzK1mhyzEGSguC536bN3lRSiS2+6+6Ux2c5qyvKjRVVdJhw35lwUT0eYm+NAsSgl
         Qr8Xt+acpoHpgRhSDbpageAV1TNHrCJ8g2i8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701425; x=1784306225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BwZSNwyJreqe214qhJ8Rx2I5nElYTJyC4owvRlMCnKM=;
        b=BMMGRtYMx5wYS8zebjL4AiSm2CHT7RLR/x5X1lFFhb2p3fuWwuUla3c6G3+YUgk5eR
         gES95//V4UPwbhZdcXXDdecmAexzDzNjAmk3S0XitzCBGXToofRczAYfnzN+z6RLduMo
         dAcQxXXfV+EMn01Ks+GmdAV6AII8oa+WLOSmKdRWJR1iegZjyzcKvmgXD308lW/pAh40
         4tM0KnorPbX8vtV9Ziz60LUIyZk8u/qMZ2d1WoHfRd0DjmYIhJp3j57O11xWH/WyDD4V
         gKgTiKE4EQ0enIeEXEkKCzlb/8zXedCeXSYeoxlkV0ZfcgpFU6MDjy4MgdFEy9MUCsAu
         cXqQ==
X-Gm-Message-State: AOJu0YzjbnhAwlHP8BSrbQ1+bikOd0CnVfaTWJgj+wzICVAbY2oXQ7Zt
	n9gLNEfL5+l3HL5iecX2ox00IYgYvS1IdCncqT8FBUw37DmcDR02PoUU8fUyTUqmCvpTvUC5aZU
	HslxX2i0=
X-Gm-Gg: AfdE7cn9DNVBDxUohUBQErYoR+2+AhFPXUR0xfEcek6dtcJxp10HlgpmK5SEtbkvXq6
	XO0Iu0c3+Af6wEu/sOlPKP4EG/xqqNT6oYqDfiasK6VG69WvvUiML3NhRbWjXHZ4OBy3XePeUyQ
	8tYy/1kBKl5r0oOflqqT6V6N3K57lI+EgSy8clsTvrZiZZCK4PbS+533uPWIZ7lPJNtsOxRGYe+
	fF0qx/nHtQUyf7kB6ByEyuS4q0OG7Hf5kyUpc4dFqZ/G0WIp97pKeJnrl8nltUgaql6s5pZIpjv
	ICh8i8eFI/iZOcyHapZI0IVHJEiel1/qICR9wIwyriAa/eKtjN6k+2Nn5z9892DLTzvmHaeiyVb
	mIALENfBfQ5K138T83m45Gs7S7e5jbv2KjlUDjOpsyR5MEoCX0Gh2gscs2tThsKBpzb5OsTwTl7
	q6EKnlu+gnh7g+0fCUuMYDJ5UOINg1+uIVNXqRHqVj4g7S76JSE9Y8a8Vxv43PeT5FlOEg3LTTR
	iElP+zpiRBlw2fafkY=
X-Received: by 2002:a05:600c:6218:b0:493:f80c:5455 with SMTP id 5b1f17b1804b1-493f80c5fd3mr2854925e9.5.1783701425125;
        Fri, 10 Jul 2026 09:37:05 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-2608-8c5f-3a92-eb6f-dc01-ac58.rev.sfr.net. [2a02:8440:2608:8c5f:3a92:eb6f:dc01:ac58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d4f9fsm150758695e9.4.2026.07.10.09.37.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:37:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 06/18] python3: fix CVE-2026-11940
Date: Fri, 10 Jul 2026 18:36:21 +0200
Message-ID: <163ac5caf6191146fd5259dce198832b3b2589d0.1783697455.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783697455.git.yoann.congal@smile.fr>
References: <cover.1783697455.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 16:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240667

From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

tarfile.extractall() with the 'data' or 'tar' filter could be bypassed
by a crafted archive where a hardlink references a symlink stored at a
deeper name than the hardlink itself.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 85f043e207cc59bb3d0a7d1eac5088714dcf4611)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3/CVE-2026-11940.patch       | 67 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.14.6.bb |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-11940.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-11940.patch b/meta/recipes-devtools/python/python3/CVE-2026-11940.patch
new file mode 100644
index 00000000000..05a5802c396
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-11940.patch
@@ -0,0 +1,67 @@
+From e24b4e95524fbe8cd0f46aa3292e8040f0e07c83 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Tue, 23 Jun 2026 15:58:47 +0200
+Subject: [PATCH 1/2] gh-151558: Fix symlink escape via `tarfile`
+ hardlink-extraction fallback (GH-151559)
+
+CVE: CVE-2026-11940
+Upstream-Status: Backport [https://github.com/python/cpython/commit/27dd970bf6b17ebca7c8ed486a40ab043ed7af8f]
+
+Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
+---
+ Lib/tarfile.py           |  3 +++
+ Lib/test/test_tarfile.py | 24 ++++++++++++++++++++++++
+ 2 files changed, 27 insertions(+)
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index e6734db24f64..63f23490e8a1 100644
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -2782,6 +2782,9 @@ def makelink_with_filter(self, tarinfo, targetpath,
+                     "makelink_with_filter: if filter_function is not None, "
+                     + "extraction_root must also not be None")
+             try:
++                filter_function(
++                    unfiltered.replace(name=tarinfo.name, deep=False),
++                    extraction_root)
+                 filtered = filter_function(unfiltered, extraction_root)
+             except _FILTER_ERRORS as cause:
+                 raise LinkFallbackError(tarinfo, unfiltered.name) from cause
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index d974c7d46ec1..0fc7413be8db 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -4344,6 +4344,30 @@ def test_sneaky_hardlink_fallback(self):
+                     self.expect_file("boom", symlink_to='../../link_here')
+                     self.expect_file("c", symlink_to='b')
+
++    @symlink_test
++    def test_sneaky_hardlink_fallback_deep(self):
++        # (CVE-2026-11940)
++        with ArchiveMaker() as arc:
++            arc.add("a/b/s", symlink_to=os.path.join("..", "escape"))
++            arc.add("s", hardlink_to=os.path.join("a", "b", "s"))
++
++        with self.check_context(arc.open(), 'data'):
++            e = self.expect_exception(
++                tarfile.LinkFallbackError,
++                "link 's' would be extracted as a copy of "
++                + "'a/b/s', which was rejected")
++            self.assertIsInstance(e.__cause__,
++                                  tarfile.LinkOutsideDestinationError)
++
++        for filter in 'tar', 'fully_trusted':
++            with self.subTest(filter), self.check_context(arc.open(), filter):
++                if not os_helper.can_symlink():
++                    self.expect_file("a/")
++                    self.expect_file("a/b/")
++                else:
++                    self.expect_file("a/b/s", symlink_to=os.path.join('..', 'escape'))
++                    self.expect_file("s", symlink_to=os.path.join('..', 'escape'))
++
+     @symlink_test
+     def test_exfiltration_via_symlink(self):
+         # (CVE-2025-4138)
+--
+2.54.0
diff --git a/meta/recipes-devtools/python/python3_3.14.6.bb b/meta/recipes-devtools/python/python3_3.14.6.bb
index e7db713ded1..80be938ed50 100644
--- a/meta/recipes-devtools/python/python3_3.14.6.bb
+++ b/meta/recipes-devtools/python/python3_3.14.6.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Skip-flaky-test_default_timeout-tests.patch \
            file://0001-test_only_active_thread-skip-problematic-test.patch \
            file://0001-prefer-valid-entrypoints.patch \
+           file://CVE-2026-11940.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \

