Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60416EEC298
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 21:50:35 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6459.1771883431398831856
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 13:50:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BU7bB9BB;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-896f4627dffso65251386d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 13:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771883430; x=1772488230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJFAz92psE2gQvr4gA+JgW9zcTH5/wSQx1lNRmt/5qI=;
        b=BU7bB9BBm5ZeveT65E09q2uWD7AcWuoAhgvNNl6Tyah9ZZ/O7VGzlIAideerptY0wU
         wCCZbrzesXR7ncEvWuGCiOhDSw4SkafSCtW5IP66Lo9oNHHRhwHjATT4iB79xmwTyTmx
         cJc4QT7uSgMegvLjgr349tYwILZT6FUq1nHWUMUuE4PPNdoxeNfTU5XgJcBHZ9LmcPoM
         m0AgyUHgUuTv1C7imQ88RujZPSwCv2slYe/kJbtTBgR/z+VzeJ3UyyUzSIE66QERXJ1j
         tHxvnvlOci+4A8pWui1vKTCXeLxPJVPCQ2XFvvjbJcG7P23OL9g1ZBQeVn4HBHV01/wc
         6GIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771883430; x=1772488230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TJFAz92psE2gQvr4gA+JgW9zcTH5/wSQx1lNRmt/5qI=;
        b=CI1l0go3U1c57awRNjA1h8F/LbCNhahTKZO2XQ9anj6M1e/lX4Q1eUBIeFZuSz7UtY
         mnrInr6Ruc8tD25MKZ8B9VwpsMrHnYvBYU+07iHZGXLI7YcJNOMfcgWb/2DJwWJ9aLqt
         Qz64ARSB2xdmzw58pRAYfwjV9d6f69iHZIXEyVrwakWHnbphOw6PyUZugED4ll+8eryY
         We37Epy5QMgqgHOBEWMnD8yvKorAu0aL8rysn5au4nyYFiKo8JVICJheIOrks2hnko4L
         T/rPX45qJoQqF2PM1LKNfhRX5dnTHX/XrTB3h55LVGHWrQG0VDdA6vpWmVF9eA8ZT0LT
         74UQ==
X-Gm-Message-State: AOJu0YzvoqOEsConmYSykXByboPkzj9/rRzqN7+n7LKthSfw/2nHU1DL
	8KtP0WMQd8X3ECKN2A+vHW0RIkay+6wckMSo/4OAgNxrWowP1/fiR7cp+OgKYwMQ
X-Gm-Gg: ATEYQzyXWyKc/VWANVd7VSVgmQAcEwOsZGSOLe1LjlUvhl0DuiYDS6mGfafyRgpfT5K
	7eiak+z5GoBybl5DbI/1JzcdGUUXaA10aajTeVdQTiP0kT9nJ7ps3ErXIWL2FnSIM91hJy82bm9
	F4bjPkW6HUTLYr6oCoOsKGqHOL6Ve8ETBWo8+YcksZt7X8ualUyr6mys7x35+hAJXTe3a9HnRMD
	/9qEowRZQXrTxeePXJ7oi9zS69ANqruP94JWeGBeBzV97eU2xcExP8+8mWBjrrunnKOZlceTQUL
	FS7HCfTztyTCw6W2ltVjUzL22em7IS5zjqjiK5jLbgab8aKWbDNmxLb+fkuwdpg+vfX1Z8E9eXN
	FAY4CN7AI3xl9ac6wl9/9i1puc59dAdcNVySqaVT4MCXLDxOFsl/J8/+vZw8JULdPMo76GglDZE
	lictik8yNcHNh7dehGZHLPGClGN3ajw8uYY2AgqABOW1ycI9ZYfuAXmrPqVHktVezDmw==
X-Received: by 2002:a05:6214:21ea:b0:895:4c45:a615 with SMTP id 6a1803df08f44-89979d360a5mr145948836d6.44.1771883429734;
        Mon, 23 Feb 2026 13:50:29 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8997c691113sm93811606d6.1.2026.02.23.13.50.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 13:50:29 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 06/10] oe-selftest/cases/wic.py: update WicTestCase
Date: Mon, 23 Feb 2026 16:50:04 -0500
Message-ID: <20260223215008.2062721-7-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223215008.2062721-1-twoerner@gmail.com>
References: <20260223215008.2062721-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 21:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231706

The wic oe-selftest defines its own class, WicTestCase, for handling
setup, teardown, and other pieces needed to run the individual wic
oe-selftests. Now that wic is a tool external to oe-core, it, and the
tools on which it depends, need to be built natively before the test
can be run, need to be made available to the tests, and need to remain
available while the test is running.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v5:
- rebase with master
- split back out into smaller patches

v4: skipped to align/combine with other patch set

changes in v3:
- squashed into 1 large patch

changes in v2:
- none
---
 meta/lib/oeqa/selftest/cases/wic.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 7ad61fa700f7..e9c28baf51eb 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -57,12 +57,22 @@ class WicTestCase(OESelftestTestCase):
 
     image_is_ready = False
     wicenv_cache = {}
+    oldpath = ""
+    envfile = ""
 
     def setUpLocal(self):
         """This code is executed before each test method."""
         self.resultdir = os.path.join(self.builddir, "wic-tmp")
         super(WicTestCase, self).setUpLocal()
 
+        config = 'DEPENDS:pn-core-image-minimal += " %s"' % get_bb_var("DEPENDS", "wic-tools")
+        self.append_config(config)
+        bitbake('wic-tools core-image-minimal core-image-minimal-mtdutils')
+        WicTestCase.oldpath = os.environ['PATH']
+        os.environ['PATH'] = get_bb_var("PATH", "wic-tools") + ":" + os.environ['PATH']
+        image = 'core-image-minimal'
+        WicTestCase.envfile = os.path.join(self._get_image_env_path(image), image) + '.env'
+
         # Do this here instead of in setUpClass as the base setUp does some
         # clean up which can result in the native tools built earlier in
         # setUpClass being unavailable.
@@ -78,6 +88,7 @@ class WicTestCase(OESelftestTestCase):
         """Remove resultdir as it may contain images."""
         rmtree(self.resultdir, ignore_errors=True)
         super(WicTestCase, self).tearDownLocal()
+        os.environ['PATH'] = WicTestCase.oldpath
 
     def _get_image_env_path(self, image):
         """Generate and obtain the path to <image>.env"""
-- 
2.51.0


