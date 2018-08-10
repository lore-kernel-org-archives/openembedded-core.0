Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0F44E74C1A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 21:58:00 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id w24-v6so3248609wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 14:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=mHNPZKXSWxFjlEnDiDYn/M2j7p0hywKcLci1JRgBWeo=;
	b=AjnSEF8C+WDXKKDA+AYShqRUtM7nXymW8+sbmKmTw5K2ORWR4/Pg93vF+2DZev/+sm
	JMt918wmr0sJ+ZtDJyropMHy0D+wSHjsfEAtzm6iMAN9aAf8vSigE8obM70gsSbRrBdy
	PLHG2k0vEhRbfZ8qlUhlZ4JqiTAXo5x9JhyAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=mHNPZKXSWxFjlEnDiDYn/M2j7p0hywKcLci1JRgBWeo=;
	b=AeqDS1O8PJmbQTXykBL9+XFqnXF3TLO4HAzhVDXpwiMiqCKyZ+C6akAbqRMP1Igm76
	fToBHtkqnb3HxDWYbfIX/VTl13A1T1nx2tsylhBXSK/T7XKpZALPXQJoyetT20Up5OPW
	w0EaMS7h/qELQYKgwnFW4XK3tPyw/qRF8IL6W+zoc5omQMwxBKYupMRKqvZcxTS521TB
	EOqhwe4lsF+rGmfyygJGCK9mCD5UiqpphCom5Yw6sEvDwKF227VheGNEa71u4O89UcRs
	d9q31EPYjB+x22JsAPQ9XHBvEBWsNJYdpfq+V0es8CC4G3+mEqzUGuR6KZiN+AL0kTvD
	GhRQ==
X-Gm-Message-State: AOUpUlGKuxeA6iq5LR+HOo8CkUbqIkk5Oyhpv36F+QpAtjqVcreIMgFx
	HAiRV9kYan9Ju9Lrg4AMhFvht+Q0x8U=
X-Google-Smtp-Source: AA+uWPw/e3YX6GmTTZdZozqn/eRnVcE/98J1hlxci2yfo+65KLPLdNG3A7+Jl0hURGUhZCC6KKYm6Q==
X-Received: by 2002:a1c:2d54:: with SMTP id
	t81-v6mr2691191wmt.31.1533938281430; 
	Fri, 10 Aug 2018 14:58:01 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q2-v6sm1874773wmc.44.2018.08.10.14.58.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Aug 2018 14:58:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Aug 2018 22:57:57 +0100
Message-Id: <20180810215759.7843-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/3] oeqa/esdk/devtool: Drop OETestDepends usage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Aug 2018 21:58:01 -0000

OETestDepends doesn't work with parallelism and in this case we don't
really need this dependency, it would just short out some tests quickly
in the rare case the esdk environment was broken.

Currently this is masking tests which is a much worse problem and we
can't make OETestDepends work reliably with parallelism so drop the
dependencies.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/sdkext/cases/devtool.py | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
index ea9051710ae..0860e8d17cf 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -6,7 +6,6 @@ import shutil
 import subprocess
 
 from oeqa.sdkext.case import OESDKExtTestCase
-from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
 from oeqa.utils.httpserver import HTTPService
 
@@ -45,28 +44,23 @@ class DevtoolTest(OESDKExtTestCase):
         self.assertEqual(output.startswith(self.tc.sdk_dir), True, \
             msg="Seems that devtool isn't the eSDK one: %s" % output)
 
-    @OETestDepends(['test_devtool_location'])
     def test_devtool_add_reset(self):
         self._run('devtool add myapp %s' % self.myapp_dst)
         self._run('devtool reset myapp')
 
     @OETestID(1605)
-    @OETestDepends(['test_devtool_location'])
     def test_devtool_build_make(self):
         self._test_devtool_build(self.myapp_dst)
 
     @OETestID(1606)
-    @OETestDepends(['test_devtool_location'])
     def test_devtool_build_esdk_package(self):
         self._test_devtool_build_package(self.myapp_dst)
 
     @OETestID(1607)
-    @OETestDepends(['test_devtool_location'])
     def test_devtool_build_cmake(self):
         self._test_devtool_build(self.myapp_cmake_dst)
 
     @OETestID(1608)
-    @OETestDepends(['test_devtool_location'])
     def test_extend_autotools_recipe_creation(self):
         req = 'https://github.com/rdfa/librdfa'
         recipe = "librdfa"
@@ -78,7 +72,6 @@ class DevtoolTest(OESDKExtTestCase):
             self._run('devtool reset %s' % recipe)
 
     @OETestID(1609)
-    @OETestDepends(['test_devtool_location'])
     def test_devtool_kernelmodule(self):
         docfile = 'https://github.com/umlaeute/v4l2loopback.git'
         recipe = 'v4l2loopback-driver'
@@ -89,7 +82,6 @@ class DevtoolTest(OESDKExtTestCase):
             self._run('devtool reset %s' % recipe)
 
     @OETestID(1610)
-    @OETestDepends(['test_devtool_location'])
     def test_recipes_for_nodejs(self):
         package_nodejs = "npm://registry.npmjs.org;name=winston;version=2.2.0"
         self._run('devtool add %s ' % package_nodejs)
-- 
2.17.1


