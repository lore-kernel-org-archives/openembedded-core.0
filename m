Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27706.1792952334533595499
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 11:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=i0maeL4Q;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-202610251818514825ba3748000207cc-7hw82c@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202610251818514825ba3748000207cc
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Oct 2026 19:18:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=gF5AaSd7IrBV/pA8s3LrfDDrw02fBGvTPZi0qyZbcmY=;
 b=i0maeL4QHOjd/9DQGhV8Q/d4CnUlKguWw+x3b2AFeSPIjNmN3VfiAlttcXT0V9tQFte0pj
 YtlPqamx/t02VEyZnxRz5B6ynmvwT6yEmoTMZdMgn1fd92AgeDdwq/1Z3Ez3JwuPDDQpbQGZ
 KlwhVbjtnMpnXVnIDmreKnxdna1aGfqUmQXyoqKS4iCQGMi3geYA1GwTn/PR4QTf1d/IiWJ5
 JFsUw13fAaiOqPUnn837v+II+1Rpx/JUZusyr/H8U6B7RdcfLbGOV5xFqQ+bVvFiZ4bDA+P/
 hMDH2Jg8qvU2oAApgUAB04wEdPsS83b79msLFuLMePqgZTuRvTqxb1ZA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 6/6] kernel-fit-image: drop the synthetic FIT_LOADABLE_* values
Date: Sun, 25 Oct 2026 19:18:32 +0100
Message-ID: <20261025181847.784113-7-adrian.freihofer@siemens.com>
In-Reply-To: <20261025181847.784113-1-adrian.freihofer@siemens.com>
References: <20261025181847.784113-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 18:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248613
Content-Type: text/plain; charset="utf-8"

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The anonymous function sets the FIT_LOADABLE_* variables to the flags of
all loadables joined by " ? ", e.g. "0x86000000 ? 0x87000000". This was
done only to make the flags visible to the selftests, which could read
variables but not flags. do_compile reads the flags directly and does
not need these values.

get_bb_vars supports reading variable flags now. Let the test request
the FIT_LOADABLE_* flags of the loadables it configures and drop the
synthetic values from the class.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass |  7 ++-----
 meta/lib/oeqa/selftest/cases/fitimage.py     | 13 +++++++------
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index a238de1aa2..abf7327c97 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -32,8 +32,8 @@ python () {
     # Parse loadables config
     loadables = d.getVar('FIT_LOADABLES')
     if loadables:
-        # Forbid direct assignment, set synthetic values for testability and
-        # add the vars to vardeps so their flags are part of the signature.
+        # Only flags are supported. Add the vars to vardeps so their flags are
+        # part of the signature.
         loadable_vars = ['FIT_LOADABLE_ARCH', 'FIT_LOADABLE_COMPRESSION',
                          'FIT_LOADABLE_DESCRIPTION', 'FIT_LOADABLE_ENTRYPOINT',
                          'FIT_LOADABLE_FILENAME', 'FIT_LOADABLE_LOADADDRESS',
@@ -41,9 +41,6 @@ python () {
         for v in loadable_vars:
             if d.getVar(v):
                 raise bb.parse.SkipRecipe("You cannot use %s as a variable, you can only set flags." % v)
-
-            synt_value = " ? ".join([ d.getVarFlag(v, loadable) or "" for loadable in loadables.split() ])
-            d.setVar(v, synt_value)
         d.appendVarFlag('do_compile', 'vardeps', ' ' + ' '.join(loadable_vars))
 }
 
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 5d77e6da09..ffd7f9747e 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -676,8 +676,6 @@ class KernelFitImageBase(FitImageTestCase):
             'FIT_HASH_ALG',
             'FIT_KERNEL_COMP_ALG',
             'FIT_LOADABLES',
-            'FIT_LOADABLE_ENTRYPOINT',
-            'FIT_LOADABLE_LOADADDRESS',
             'FIT_OS',
             'FIT_SIGN_ALG',
             'FIT_SIGN_INDIVIDUAL',
@@ -1025,10 +1023,10 @@ class KernelFitImageBase(FitImageTestCase):
                 "Entry Point": bb_vars['UBOOT_RD_ENTRYPOINT']
             }
         # Create one section per loadable
-        for index,loadable in enumerate(loadables):
-            loadaddress = bb_vars['FIT_LOADABLE_LOADADDRESS'].split("?")[index].strip()
+        for loadable in loadables:
+            loadaddress = bb_vars['FIT_LOADABLE_LOADADDRESS[%s]' % loadable]
             req_sections[loadable] = { "Load Address": loadaddress }
-            entrypoint = bb_vars['FIT_LOADABLE_ENTRYPOINT'].split("?")[index].strip()
+            entrypoint = bb_vars.get('FIT_LOADABLE_ENTRYPOINT[%s]' % loadable)
             if entrypoint:
                 req_sections[loadable]['Entry Point'] = entrypoint
         # Create a configuration section for each DTB
@@ -1204,7 +1202,10 @@ FIT_LOADABLE_TYPE[loadable2] = "firmware"
         config = FitImageTestCase._config_add_machine_settings(config, machine, keys=["KERNEL_DEVICETREE", "FIT_CONF_DEFAULT_DTB"])
         config = self._config_add_kernel_classes(config)
         self.write_config(config)
-        bb_vars = self._fit_get_bb_vars()
+        loadable_flags = ['%s[%s]' % (var, loadable)
+                          for loadable in ('loadable1', 'loadable2')
+                          for var in ('FIT_LOADABLE_ENTRYPOINT', 'FIT_LOADABLE_LOADADDRESS')]
+        bb_vars = self._fit_get_bb_vars(loadable_flags)
         self._gen_atf_tee_dummy_images(bb_vars)
         self._test_fitimage(bb_vars)
 
-- 
2.56.0

