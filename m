Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F6ACD6E4B
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 12:28:57 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22645.1763036933973304228
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 04:28:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=M2HejYNk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2025111312285248eee5657f00020786-uypzla@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2025111312285248eee5657f00020786
        for <openembedded-core@lists.openembedded.org>;
        Thu, 13 Nov 2025 13:28:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Tutj8kNsm4UAU6wcLLr2NOTVsRx8V2V9eOP8qWXYm1I=;
 b=M2HejYNkFUxk7AjPFMiq3hwMNByvuPEpdhfx8U4VWixGDQkP7yQz7SBtBS74lFhKTM+PCf
 Uu2Qo7zIU0cjeORCcd5dqyVjU8/VIjWv8Z5eMHhzxhUPRw1gIeaD5YDNgi/L+K5iRYV8appp
 C+i/7PFh2XsBgB0KIdcLPR3NBiid6IuTEVc1nut9fQpAADvefS0VYd0HkKYdtWSc6z7SXHgP
 cThQM40sAIfQzbIZcan2eVpMQnB/cw8YK5/hljVDWSVoKYrr/U49nHC3Qv+kSWX7opvkbFf2
 xD1WDXneQcXfpu5o2Dwa/i5V6YiLH2k8egd9y9v09YQK1KqYdFXiLJAg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 7/9] go: remove duplicate arch map in sdk test
Date: Thu, 13 Nov 2025 13:28:04 +0100
Message-Id: <20251113122806.16769-8-peter.marko@siemens.com>
In-Reply-To: <20251113122806.16769-1-peter.marko@siemens.com>
References: <20251113122806.16769-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 12:28:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226245

From: Osama Abdelkader <osama.abdelkader@gmail.com>

ARCH_MAP is duplicating an existing map in meta/lib/oe/go.py
use oe.go map_arch instead.

(From OE-Core rev: c2ba36f41777d347fd5ffcd9b6862638e5f35a1b)

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/lib/oeqa/sdk/cases/go.py | 31 +++++--------------------------
 1 file changed, 5 insertions(+), 26 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/go.py b/meta/lib/oeqa/sdk/cases/go.py
index 9c15124f6ad..a050df7a9fa 100644
--- a/meta/lib/oeqa/sdk/cases/go.py
+++ b/meta/lib/oeqa/sdk/cases/go.py
@@ -12,6 +12,7 @@ from oeqa.core.utils.path import remove_safe
 from oeqa.sdk.case import OESDKTestCase
 
 from oeqa.utils.subprocesstweak import errors_have_output
+from oe.go import map_arch
 errors_have_output()
 
 class GoCompileTest(OESDKTestCase):
@@ -55,22 +56,6 @@ class GoCompileTest(OESDKTestCase):
 class GoHostCompileTest(OESDKTestCase):
     td_vars = ['MACHINE', 'SDK_SYS', 'TARGET_ARCH']
 
-    # Architecture mapping from Yocto/Poky to Go
-    ARCH_MAP = {
-        'aarch64': 'arm64',
-        'cortexa57': 'arm64',  # ARM Cortex-A57 is ARM64
-        'cortexa72': 'arm64',  # ARM Cortex-A72 is ARM64
-        'cortexa53': 'arm64',  # ARM Cortex-A53 is ARM64
-        'x86_64': 'amd64',
-        'i586': '386',
-        'i686': '386',
-        'mips': 'mips',
-        'mipsel': 'mipsle',
-        'powerpc64': 'ppc64',
-        'powerpc64le': 'ppc64le',
-        'riscv64': 'riscv64',
-    }
-
     @classmethod
     def setUpClass(self):
         # Copy test.go file to SDK directory (same as GCC test uses files_dir)
@@ -94,12 +79,8 @@ class GoHostCompileTest(OESDKTestCase):
         sdksys = self.td.get("SDK_SYS")
         arch = sdksys.split('-')[0]
 
-        # Handle ARM variants
-        if arch.startswith('arm'):
-            return 'arm'
-
         # Use mapping for other architectures
-        return self.ARCH_MAP.get(arch, arch)
+        return map_arch(arch)
 
     def test_go_cross_compile(self):
         """Test Go cross-compilation for target"""
@@ -117,12 +98,10 @@ class GoHostCompileTest(OESDKTestCase):
         # Clean up files with dynamic architecture names
         files = [os.path.join(self.tc.sdk_dir, f) \
                 for f in ['test.go', 'go.mod', 'go.sum']]
-        # Add architecture-specific files using the same mapping
-        for arch in self.ARCH_MAP.values():
+        # Add common architecture-specific files that might be created
+        common_archs = ['arm64', 'arm', 'amd64', '386', 'mips', 'mipsle', 'ppc64', 'ppc64le', 'riscv64']
+        for arch in common_archs:
             files.extend([os.path.join(self.tc.sdk_dir, f) \
                          for f in ['test-%s' % arch, 'hello-go-%s' % arch]])
-        # Add 'arm' for ARM variants
-        files.extend([os.path.join(self.tc.sdk_dir, f) \
-                     for f in ['test-arm', 'hello-go-arm']])
         for f in files:
             remove_safe(f)

