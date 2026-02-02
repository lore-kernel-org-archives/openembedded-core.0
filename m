Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CF5E7DF1D
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 17:08:19 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.58259.1770052092474714386
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 09:08:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ltK/ndp1;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c52f15c5b3so471327585a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 09:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770052090; x=1770656890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdZiFV0F7HYcvJBxPlkQUUT3jWKbX3uQvbkw+JAP7NQ=;
        b=ltK/ndp1pLX0gSK1As3AXUnA39QOmIzua/KjQMa1IAMHb5kj8qG++boE+3aRNxNGis
         f1R4eCoa9Fq7N6daOPj8/D+hFHvJTk00FdMAVqoj6l4noMwcqd61Tz2pbJtPpOi9pnVy
         3VKk/+z/DsfyK9iihoBl/jYPstMCMZIWCdsyPeKk3G5VyOmXyGy+B4TD6umhEI4g84UA
         nfUrSqvPd6qUEycG35z5of07efbriSVSYcEmi3GFEb85ChQAVOTzvD21frZ4MY9nSPa4
         tTVUo+BfTuVUexPDxqk/fwEJbFbh2BM3zS9s+KwrqBrzDXBCdu+0JUMSA3lEIqw6kPrq
         EMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770052090; x=1770656890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AdZiFV0F7HYcvJBxPlkQUUT3jWKbX3uQvbkw+JAP7NQ=;
        b=NgaW6HDOvgSxMtgCnCNcs4PxxsDjp8Zz4VtwljHyvDGIL3nbcnDcwwDlNJ3A4Ts33T
         sKdMC0MyGkmleBE60ZHdYfmgxqWYChKhnjiUMMT/Fw9T14/ilPQJdDZGK7a68wnxNYdA
         HlTMtK7VZDwBrOm7hnsI34dMgLh6FTk3bnpjZvTDmC1O2RYYcXnZab/wwcNQcbQH2rih
         U2iLDmYyh84yYgK2BW7PWj0KDsrSEd1BW1ybRPjrHnfe93lRGbEaNQBcd8Fq/t8Eu/z2
         KRloEw13DJaoQg23xm6SsvR268bkGrIngxc4InfWTg4JY9AaaTr1Z6lZj5IhbS10D0KZ
         aaww==
X-Gm-Message-State: AOJu0Yzvw6dwucNXCQ/VvtD7AMVj2dlEG9pU5qCkoSstg3lOIvfIcNcB
	v8LVOAX3Cz93Jgithvg3mu2aerv3gIVUGIuNtB2/h5rUttmzv1u9bpHS+IcRwA==
X-Gm-Gg: AZuq6aIQO1kgu6HmWYOkKAbZNOPOGKOe4r9REiW+YE8Yupgnii03AQnlvwql+CTISq/
	s6IZWtrFMNSLiL3VFPpqSmE/ueUHQHl5jpyEpyqTYPE1kgCXPCFNItB7t7ypS5SB7+UQeptKqKd
	qrN3RGL2Yrf9hqfyX1m8qpEKoeOeO/3WjskeToR13OcpxWt9BxY1EMU8D77npe9A4SFIesFs4dA
	5aGTF8RCC0n/wXF7SZNSw4os4ddyIbQZLyYfH/FHqfGLbZHstL4zrdZJCWvX6zoZbLBpX8Hi93Q
	Qw4eXZQ7epQ6JTZYH5puEU4tw2NQGof8ykcu7aW0CKJZ1IXWlgqq9thw4/3CYZT6BEcWQgU7j+X
	BP417tb7DVSUffobsrkIo4hqFjYDxUyptuUKACuik45OrALk4xlBK9A2Amb2PRuATZKwsDC3c6L
	DlneKivDP7XvCUrAwHRL0/Y+ehIwdpysB4M2sH1J9jhP4VntYIXohIOw==
X-Received: by 2002:a05:620a:4691:b0:8c6:ed6b:5865 with SMTP id af79cd13be357-8c9eb11ec46mr1497360985a.0.1770052090418;
        Mon, 02 Feb 2026 09:08:10 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ca02f07efasm502815585a.51.2026.02.02.09.08.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 09:08:08 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][PATCH v2 4/9] oe-selftest/cases/wic.py: update WicTestCase
Date: Mon,  2 Feb 2026 12:07:55 -0500
Message-ID: <20260202170800.4172778-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202170800.4172778-1-twoerner@gmail.com>
References: <20260202170800.4172778-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 17:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230383

The wic oe-selftest defines its own class, WicTestCase, for handling
setup, teardown, and other pieces needed to run the individual wic
oe-selftests. Now that wic is a tool external to oe-core, it, and the
tools on which it depends, need to be built natively before the test
can be run, need to be made available to the tests, and need to remain
available while the test is running.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 958f1d084fd2..8eb0d3dcc464 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -57,12 +57,24 @@ class WicTestCase(OESelftestTestCase):
 
     image_is_ready = False
     wicenv_cache = {}
+    oldpath = ""
+    pathPlusTools = ""
+    envfile = ""
 
     def setUpLocal(self):
         """This code is executed before each test method."""
         self.resultdir = os.path.join(self.builddir, "wic-tmp")
         super(WicTestCase, self).setUpLocal()
 
+        wic_tools_depends = get_bb_var("DEPENDS", "wic-tools")
+        config = 'DEPENDS:pn-core-image-minimal += " %s"' % wic_tools_depends
+        self.append_config(config)
+        bitbake('wic-tools core-image-minimal core-image-minimal-mtdutils')
+        WicTestCase.envfile = self._get_image_env_path('core-image-minimal') + "/core-image-minimal.env"
+        WicTestCase.oldpath = os.environ['PATH']
+        WicTestCase.pathPlusTools = get_bb_var("PATH", "wic-tools") + ":" + os.environ['PATH']
+        os.environ['PATH'] = WicTestCase.pathPlusTools
+
         # Do this here instead of in setUpClass as the base setUp does some
         # clean up which can result in the native tools built earlier in
         # setUpClass being unavailable.
@@ -78,6 +90,7 @@ class WicTestCase(OESelftestTestCase):
         """Remove resultdir as it may contain images."""
         rmtree(self.resultdir, ignore_errors=True)
         super(WicTestCase, self).tearDownLocal()
+        os.environ['PATH'] = WicTestCase.oldpath
 
     def _get_image_env_path(self, image):
         """Generate and obtain the path to <image>.env"""
-- 
2.51.0


