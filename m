Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F669E7C70C
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 13:54:38 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52976.1770040472158667643
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 05:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RbH0gXJh;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8c7199e7f79so708003985a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 05:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770040470; x=1770645270; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdZiFV0F7HYcvJBxPlkQUUT3jWKbX3uQvbkw+JAP7NQ=;
        b=RbH0gXJhnaAw2ZoJMsmnswLdJjKX7OrFsACjmjk8yEjSXnXwx4KrOANcefx6Zueyz5
         DWAs/ARKGkjxYzpX0jJmE87sFC/DzQDx+Kc7IWNddtuf1GIUZk95xdV+oVpjgbILOcKZ
         Hjm2iGoudmgC5SaJ2NWuoJcpJmOFtzUF1tLsN5hc7Yrnb56cdzYGdZxduiCZONN8E4rm
         H0UkD/8ZxsqgHurw9qwqQvQeN3IxSKN/C8Fe+uNMakNpQu7yOWNyJNjUyRwzN+l0kIkd
         F55sLwjV1y59I9r4E8oZy9bUIA8InpQm9R7nhp5EbYWVNPYb0X48RUlYGFPGVBxGpL3p
         8TMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770040470; x=1770645270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AdZiFV0F7HYcvJBxPlkQUUT3jWKbX3uQvbkw+JAP7NQ=;
        b=IVom9+fiQcFa6sP9Fk5d5si2UrMor/LlF9mD6kTc+c21iPCqi+ze9PsJIDttml+k/+
         hgnLGQ12p6JOW1JFEH51E4ejLFMpOnQ+PD4qmVEQZRcstyCTTBEwcTyVI0+XXSc7hwtS
         VfD2QQftbPFKQu0lJcYlk2TbQpZlNZUYoXLhDF6MjoyMUKRraPYGO8qmvm67VJzDS12S
         iIMybVhNE1YGm0uJ+cMr3HRFUNPp3sKhTTPv7zeut0fserd1UfhNWRdGPftf7ZPBC7Ut
         u9IuTXaD7GcWMe+/yU9FMShGjRmKuOk8e2V5uhahyqgQACUICm28JmlZn2Hw805DB2xo
         oS4g==
X-Gm-Message-State: AOJu0YzKwqsIX6xdhy33bkVPJrvA7ESx3iqcvz+FmBYpkGi7C+hAynjv
	kmTnK1z+oWTFNjrjBrDIbRuVnGhM8iKJV2gDgZF0ieMapcvgMJu8X8IORMEVXw==
X-Gm-Gg: AZuq6aIOQDAP0OPzzkk0jTr9OpEBtb1Ev3GbS4P9DPzVrg6IibhprP/PI/NHAIB78QH
	9ajMSU1E+zKHP/fNA9vaIE/EF2UMVVg5C4peldeJDW4PWiaZlAPDITI1Kq63XpofATvvUrYPBYs
	VogmBMvdVd9GuzEgNRWeOloCm9kxW+f5sL0IIQGZHioaDmSpx1lawQ21cOxGV/kCnDWIaf97P0g
	jxzx1bBaowcOQB3LHpaPGuPikGllnksUXrcrahQzTwX3z6mO5pjzqxH/f3L0JvI7exx+lKGQrbP
	xMbGfM/sGJnk+iy0/uDM3aNGxWvixmnOgvcJdJDjHbJDJPF5/6zFSLGxeKoga0RiELcFqnqti7I
	P9IU3DCms/dbbs3KyQvllYI6/mcYW4KXOgXyfTfkcqthI4dLB6enP/4yYu8RWqRkKq/RoG05IRi
	VEnTDp0WwvZoAi/QOnmW6tpJsi5UAcmPd+dcYpEQusIGf+2EVs6CA5/g==
X-Received: by 2002:a05:620a:298d:b0:8c6:afa6:2700 with SMTP id af79cd13be357-8c9eb2fad44mr1533996985a.47.1770040470413;
        Mon, 02 Feb 2026 05:54:30 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d2845fsm1248654585a.31.2026.02.02.05.54.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 05:54:29 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][PATCH 4/9] oe-selftest/cases/wic.py: update WicTestCase
Date: Mon,  2 Feb 2026 08:54:09 -0500
Message-ID: <20260202135414.682558-4-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202135414.682558-1-twoerner@gmail.com>
References: <20260202135414.682558-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 13:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230356

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


