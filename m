Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE04CCF649D
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 09:10:59 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.50406.1727687455267366133
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 02:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nJC8pvdd;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cc43454d5so29645855e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 02:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727687453; x=1728292253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MyguKWwB2ugXOLYF1C/j8bAcdJVIseM5rQZUlSdNNvk=;
        b=nJC8pvdd3CBPcvZ5p1djQzI8bqlPeexK40nWN6mY7bFdEF3DEq4nMFxNrRHn5MMrsU
         pssGRLyD1FwWqRd9BP8rvuBHa5fKaPM6YqJNTDCHUQMa9gGtwi5VTBxWjekmK5XJzBHZ
         jgECNVnTmp2rnuatvA3AcBS6svbVr6taKR2YY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727687453; x=1728292253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MyguKWwB2ugXOLYF1C/j8bAcdJVIseM5rQZUlSdNNvk=;
        b=gb4bWUyqvHPHMxpoR0+o26+kg4MNTsg6euumIqsk7GoYXZUisgTmMrjJLFelq2/yKa
         aYSsfw2w8DWeO5mO5nIvuaiq+JxXNZSKeEYiwcvE4r3CgyStVND1SRsa3sh5V7I87ltj
         OkF8ifvEz6UJuElBxVnwI9xSG5dzNO79wLDnS3kgfTMqK4BW2Tv4MmCGU8l143+4vIAT
         I1uJGCYNFteAB5Ii8AluzxJnm6TOmICOOAc7VYEekHgQeZE8bIrGlUmTceeQ8bHF+Ig2
         KJZjdx+vf3Rp+KNC9WbtQ0chKIPcBS4rDgx0Hh/AA5fFvoFTEK8qg+scmYPNrE2DrLM0
         Twmw==
X-Gm-Message-State: AOJu0Yy+5H4VGVBbbADCAVtmFrq4WLs/4yhNWMcU09N3zlyia/3ZQ1wb
	lSp5Dirhj2b9UqE9vDa/j9WBUF8iS/IwxHkziF/ey7lH5QC4LG3PzPyOdAkCI8cGXFoIr/e088V
	/
X-Google-Smtp-Source: AGHT+IGII5sJwb8UkTIMCMfDsbf/Wukf9UAgmTtxME4Fvmkh8OXWnnJCk31HPdLRxx/vJ8ZBs4aglg==
X-Received: by 2002:a05:600c:1d8a:b0:426:593c:935d with SMTP id 5b1f17b1804b1-42f58409f9dmr79638775e9.5.1727687452569;
        Mon, 30 Sep 2024 02:10:52 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969ddb1fsm144617655e9.3.2024.09.30.02.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 02:10:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] reproducibility: continue testing in case of build failure
Date: Mon, 30 Sep 2024 11:10:16 +0200
Message-Id: <20240930091015.21148-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 09:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205101

From: Yoann Congal <yoann.congal@smile.fr>

The current reproducibility test stops all build tasks when a single
task fails (default BitBake behavior). This means that a single build
failure prevents the reproducibility of other packages from being
tested, which is not ideal.

To address this, we now use the --continue option of BitBake during test
builds, allowing the build process to proceed even when some tasks fail.
The failure cases are handled as gracefully as possible.

In the event of a build failure:
- The entire reproducibility test will be considered a failure.
- The complete BitBake log will be saved in the "saved output" directory
  to facilitate debugging. On the autobuilder, this log should be
  available at https://autobuilder.yocto.io/pub/repro-fail/.
- The last 20 lines of the log, which should show the failing recipes,
  will be displayed in the oe-selftest console.
- If BitBake fails to create the deployment directory, it will be
  manually created to allow the comparison process to proceed.

Here is what the output looks like when testing reproducibility of bash,
a failing recipe (hello-fail) and a non-reproducible recipe
(hello-norepro):
   $ rm -rf ../build-master-st <snip>/yocto/repro_output/* ; OEQA_DEBUGGING_SAVED_OUTPUT=<snip>/yocto/repro_output oe-selftest -r reproducible.ReproducibleTests
  <snip>
  2024-09-30 00:04:27,485 - oe-selftest - INFO - test_reproducible_builds (reproducible.ReproducibleTests.test_reproducible_builds)
  2024-09-30 00:05:31,676 - oe-selftest - INFO - Non-reproducible packages will be copied to <snip>/yocto/repro_output/oe-reproducible-20240930-aukc_3o6
  2024-09-30 00:05:31,676 - oe-selftest - INFO - Building reproducibleA (sstate allowed)...
  2024-09-30 00:13:08,009 - oe-selftest - INFO - Bitbake failed! but keep going... Log:
  2024-09-30 00:13:08,009 - oe-selftest - INFO -     Command 'bitbake  --continue bash hello-norepro hello-fail' returned non-zero exit status 1:
  2024-09-30 00:13:08,009 - oe-selftest - INFO -
  2024-09-30 00:13:08,009 - oe-selftest - INFO -     ... (last 20 lines of output)
  2024-09-30 00:13:08,009 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_write_deb: Started
  2024-09-30 00:13:08,009 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_qa: Started
  2024-09-30 00:13:08,009 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_populate_sysroot: Succeeded
  2024-09-30 00:13:08,009 - oe-selftest - INFO -     NOTE: Running setscene task 342 of 343 (<snip>/yocto/poky/meta/recipes-extended/bash/bash_5.2.32.bb:do_create_package_spdx_setscene)
  2024-09-30 00:13:08,010 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_create_package_spdx_setscene: Started
  2024-09-30 00:13:08,010 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_create_package_spdx_setscene: Succeeded
  2024-09-30 00:13:08,010 - oe-selftest - INFO -     NOTE: Running setscene task 343 of 343 (<snip>/yocto/poky/meta/recipes-extended/bash/bash_5.2.32.bb:do_create_spdx_setscene)
  2024-09-30 00:13:08,010 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_create_spdx_setscene: Started
  2024-09-30 00:13:08,010 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_create_spdx_setscene: Succeeded
  2024-09-30 00:13:08,010 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_qa: Succeeded
  2024-09-30 00:13:08,010 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_write_deb: Succeeded
  2024-09-30 00:13:08,010 - oe-selftest - INFO -     NOTE: Running noexec task 979 of 990 (<snip>/yocto/poky/meta/recipes-extended/bash/bash_5.2.32.bb:do_build)
  2024-09-30 00:13:08,010 - oe-selftest - INFO -     NOTE: Tasks Summary: Attempted 979 tasks of which 833 didn't need to be rerun and 1 failed.
  2024-09-30 00:13:08,010 - oe-selftest - INFO -     NOTE: Generating JSON CVE summary
  2024-09-30 00:13:08,010 - oe-selftest - INFO -     Complete CVE JSON report summary created at: <snip>/yocto/poky/build-master-st/reproducibleA/tmp/log/cve/cve-summary.json
  2024-09-30 00:13:08,010 - oe-selftest - INFO -
  2024-09-30 00:13:08,010 - oe-selftest - INFO -     Summary: 1 task failed:
  2024-09-30 00:13:08,010 - oe-selftest - INFO -       <snip>/yocto/poky/meta/recipes-core/hello-single/hello-fail_1.0.bb:do_compile
  2024-09-30 00:13:08,010 - oe-selftest - INFO -         log: <snip>/yocto/poky/build-master-st/reproducibleA/tmp/work/core2-64-poky-linux/hello-fail/1.0/temp/log.do_compile.2116040
  2024-09-30 00:13:08,010 - oe-selftest - INFO -     Summary: There was 1 ERROR message, returning a non-zero exit code.
  2024-09-30 00:13:08,011 - oe-selftest - INFO - reproducibleA build failed. Trying to compute built packages differences but the test will fail.
  2024-09-30 00:13:08,011 - oe-selftest - INFO - Building reproducibleB-extended (sstate NOT allowed)...
  2024-09-30 00:40:12,933 - oe-selftest - INFO - Bitbake failed! but keep going... Log:
  2024-09-30 00:40:12,933 - oe-selftest - INFO -     Command 'bitbake  --continue bash hello-norepro hello-fail' returned non-zero exit status 1:
  2024-09-30 00:40:12,933 - oe-selftest - INFO -
  2024-09-30 00:40:12,933 - oe-selftest - INFO -     ... (last 20 lines of output)
  2024-09-30 00:40:12,933 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_write_deb: Started
  2024-09-30 00:40:12,933 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_qa: Started
  2024-09-30 00:40:12,933 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_create_spdx: Succeeded
  2024-09-30 00:40:12,933 - oe-selftest - INFO -     NOTE: Running task 978 of 990 (<snip>/yocto/poky/meta/recipes-extended/bash/bash_5.2.32.bb:do_create_package_spdx)
  2024-09-30 00:40:12,933 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_create_package_spdx: Started
  2024-09-30 00:40:12,933 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_create_package_spdx: Succeeded
  2024-09-30 00:40:12,933 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_write_ipk: Succeeded
  2024-09-30 00:40:12,933 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_qa: Succeeded
  2024-09-30 00:40:12,933 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_write_deb: Succeeded
  2024-09-30 00:40:12,934 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_write_rpm: Succeeded
  2024-09-30 00:40:12,934 - oe-selftest - INFO -     NOTE: Running noexec task 979 of 990 (<snip>/yocto/poky/meta/recipes-extended/bash/bash_5.2.32.bb:do_build)
  2024-09-30 00:40:12,934 - oe-selftest - INFO -     NOTE: Tasks Summary: Attempted 979 tasks of which 2 didn't need to be rerun and 1 failed.
  2024-09-30 00:40:12,934 - oe-selftest - INFO -     NOTE: Generating JSON CVE summary
  2024-09-30 00:40:12,934 - oe-selftest - INFO -     Complete CVE JSON report summary created at: <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/log/cve/cve-summary.json
  2024-09-30 00:40:12,934 - oe-selftest - INFO -
  2024-09-30 00:40:12,934 - oe-selftest - INFO -     Summary: 1 task failed:
  2024-09-30 00:40:12,934 - oe-selftest - INFO -       <snip>/yocto/poky/meta/recipes-core/hello-single/hello-fail_1.0.bb:do_compile
  2024-09-30 00:40:12,934 - oe-selftest - INFO -         log: <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/work/core2-64-poky-linux/hello-fail/1.0/temp/log.do_compile.3007134
  2024-09-30 00:40:12,934 - oe-selftest - INFO -     Summary: There were 5 WARNING messages.
  2024-09-30 00:40:12,934 - oe-selftest - INFO -     Summary: There was 1 ERROR message, returning a non-zero exit code.
  2024-09-30 00:40:12,934 - oe-selftest - INFO - reproducibleB-extended build failed. Trying to compute built packages differences but the test will fail.
  2024-09-30 00:40:12,934 - oe-selftest - INFO - Checking deb packages for differences...
  2024-09-30 00:40:12,974 - oe-selftest - INFO - Reproducibility summary for deb: same=52 different=1 different_excluded=0 missing=0 total=53
  unused_exclusions=[]
  2024-09-30 00:40:12,976 - oe-selftest - INFO - Checking ipk packages for differences...
  2024-09-30 00:40:13,014 - oe-selftest - INFO - Reproducibility summary for ipk: same=52 different=1 different_excluded=0 missing=0 total=53
  unused_exclusions=[]
  2024-09-30 00:40:13,015 - oe-selftest - INFO - Checking rpm packages for differences...
  2024-09-30 00:40:13,047 - oe-selftest - INFO - Reproducibility summary for rpm: same=52 different=1 different_excluded=0 missing=0 total=53
  unused_exclusions=[]
  2024-09-30 00:40:13,048 - oe-selftest - INFO - Running diffoscope
  2024-09-30 00:40:14,051 - oe-selftest - INFO -  ... FAIL
  2024-09-30 00:40:14,052 - oe-selftest - INFO - Traceback (most recent call last):
    File "<snip>/yocto/poky/meta/lib/oeqa/selftest/cases/reproducible.py", line 380, in test_reproducible_builds
      self.fail('\n'.join(fails))
  AssertionError: Bitbake reproducibleA failure
  Bitbake reproducibleB-extended failure
  The following deb packages are different and not in exclusion list:
  <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/hello-norepro_1.0-r0_amd64.deb
  The following ipk packages are different and not in exclusion list:
  <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/ipk/./core2-64/hello-norepro_1.0-r0_core2-64.ipk
  The following rpm packages are different and not in exclusion list:
  <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/rpm/./core2_64/hello-norepro-1.0-r0.core2_64.rpm

  2024-09-30 00:40:14,052 - oe-selftest - INFO - ======================================================================
  2024-09-30 00:40:14,052 - oe-selftest - INFO - FAIL: test_reproducible_builds (reproducible.ReproducibleTests.test_reproducible_builds)
  2024-09-30 00:40:14,052 - oe-selftest - INFO - ----------------------------------------------------------------------
  2024-09-30 00:40:14,052 - oe-selftest - INFO - Traceback (most recent call last):
    File "<snip>/yocto/poky/meta/lib/oeqa/selftest/cases/reproducible.py", line 380, in test_reproducible_builds
      self.fail('\n'.join(fails))
  AssertionError: Bitbake reproducibleA failure
  Bitbake reproducibleB-extended failure
  The following deb packages are different and not in exclusion list:
  <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/hello-norepro_1.0-r0_amd64.deb
  The following ipk packages are different and not in exclusion list:
  <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/ipk/./core2-64/hello-norepro_1.0-r0_core2-64.ipk
  The following rpm packages are different and not in exclusion list:
  <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/rpm/./core2_64/hello-norepro-1.0-r0.core2_64.rpm

  2024-09-30 00:40:14,053 - oe-selftest - INFO - ----------------------------------------------------------------------
  2024-09-30 00:40:14,053 - oe-selftest - INFO - Ran 1 test in 2146.797s
  2024-09-30 00:40:14,053 - oe-selftest - INFO - FAILED
  2024-09-30 00:40:14,053 - oe-selftest - INFO -  (failures=1)
  2024-09-30 00:40:17,620 - oe-selftest - INFO - RESULTS:
  2024-09-30 00:40:17,621 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: FAILED (2146.57s)
  2024-09-30 00:40:17,623 - oe-selftest - INFO - SUMMARY:
  2024-09-30 00:40:17,623 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 2146.798s
  2024-09-30 00:40:17,623 - oe-selftest - INFO - oe-selftest - FAIL - Required tests failed (successes=0, skipped=0, failures=1, errors=0)

=> Test failed but hello-norepro is displayed as non-reproducible.

The testresult.json contains:
  {
      "oeselftest_debian-12_qemux86-64_20240930000424": {
          "configuration": { <snip> },
          "result": {
              "reproducible": {
                  "files": {
                      "package_deb": {
                          "different": [
                              {
                                  "reference": "<snip>/yocto/poky/build-master-st/reproducibleA/tmp/deploy/deb/./core2-64/hello-norepro_1.0-r0_amd64.deb",
                                  "test": "<snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/hello-norepro_1.0-r0_amd64.deb"
                              }
                          ],
                          "different_excluded": [],
                          "missing": [],
                          "same": [
                              <snip>
                              {
                                  "reference": "<snip>/yocto/poky/build-master-st/reproducibleA/tmp/deploy/deb/./core2-64/bash_5.2.32-r0_amd64.deb",
                                  "test": "<snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/bash_5.2.32-r0_amd64.deb"
                              },
                              <snip>
                          ]
                      },
                      "package_ipk": { <same as deb> },
                      "package_rpm": { <same as deb> }
                  }
              },
              "reproducible.ReproducibleTests.test_reproducible_builds": {
                  "duration": 2146.5671875476837,
                  "log": "Traceback (most recent call last):\n  File \"<snip>/yocto/poky/meta/lib/oeqa/selftest/cases/reproducible.py\", line 380, in test_reproducible_builds\n    self.fail('\\n'.join(fails))\nAssertionError: Bitbake reproducibleA failure\nBitbake reproducibleB-extended failure\nThe following deb packages are different and not in exclusion list:\n<snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/hello-norepro_1.0-r0_amd64.deb\nThe following ipk packages are different and not in exclusion list:\n<snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/ipk/./core2-64/hello-norepro_1.0-r0_core2-64.ipk\nThe following rpm packages are different and not in exclusion list:\n<snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/rpm/./core2_64/hello-norepro-1.0-r0.core2_64.rpm\n",
                  "status": "FAILED"
              },
              "reproducible.rawlogs": {
                  "log": "DIFFERENT: <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/hello-norepro_1.0-r0_amd64.deb\nSAME: <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/bash_5.2.32-r0_amd64.deb\n<snip>"
              }
          }
      }
  }

=> "reproducible.ReproducibleTests.test_reproducible_builds".status is
correctly "FAILED" but the reproducibility of bash and hello-norepro is
tested.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 57 ++++++++++++++++----
 1 file changed, 48 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 3d3f30eebc..af4e53af2f 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -215,7 +215,7 @@ class ReproducibleTests(OESelftestTestCase):
         bb.utils.mkdirhier(os.path.dirname(dest))
         shutil.copyfile(source, dest)
 
-    def do_test_build(self, name, use_sstate):
+    def do_test_build(self, name, use_sstate, output_log=None):
         capture_vars = ['DEPLOY_DIR_' + c.upper() for c in self.package_classes]
 
         tmpdir = os.path.join(self.topdir, name, 'tmp')
@@ -234,11 +234,19 @@ class ReproducibleTests(OESelftestTestCase):
             ''').format(package_classes=' '.join('package_%s' % c for c in self.package_classes),
                         tmpdir=tmpdir)
 
+        bitbake_failure_count = 0
         if not use_sstate:
             if self.sstate_targets:
                self.logger.info("Building prebuild for %s (sstate allowed)..." % (name))
                self.write_config(config)
-               bitbake(' '.join(self.sstate_targets))
+               try:
+                   bitbake("--continue "+' '.join(self.sstate_targets),
+                           output_log=output_log, limit_exc_output=20)
+               except AssertionError as e:
+                   bitbake_failure_count += 1
+                   self.logger.info("Bitbake failed! but keep going... Log:")
+                   for line in str(e).split("\n"):
+                       self.logger.info("    "+line)
 
             # This config fragment will disable using shared and the sstate
             # mirror, forcing a complete build from scratch
@@ -251,8 +259,21 @@ class ReproducibleTests(OESelftestTestCase):
         self.write_config(config)
         d = get_bb_vars(capture_vars)
         # targets used to be called images
-        bitbake(' '.join(getattr(self, 'images', self.targets)))
-        return d
+        try:
+            bitbake("--continue "+' '.join(getattr(self, 'images', self.targets)),
+                    output_log=output_log, limit_exc_output=20)
+        except AssertionError as e:
+            bitbake_failure_count += 1
+
+            self.logger.info("Bitbake failed! but keep going... Log:")
+            for line in str(e).split("\n"):
+                self.logger.info("    "+line)
+            for c in self.package_classes:
+                deploy = d['DEPLOY_DIR_' + c.upper()]
+                if not os.path.exists(deploy):
+                    self.logger.info("Manually creating %s" % deploy)
+                    bb.utils.mkdirhier(deploy)
+        return (d, bitbake_failure_count)
 
     def test_reproducible_builds(self):
         def strip_topdir(s):
@@ -278,15 +299,33 @@ class ReproducibleTests(OESelftestTestCase):
         # https://bugzilla.yoctoproject.org/show_bug.cgi?id=15554
         # So, the reproducibleA & reproducibleB directories are changed to reproducibleA & reproducibleB-extended to have different size.
 
-        vars_A = self.do_test_build('reproducibleA', self.build_from_sstate)
-
-        vars_B = self.do_test_build('reproducibleB-extended', False)
+        fails = []
+        vars_list = [None, None]
+
+        for i, (name, use_sstate) in enumerate(
+                                 (('reproducibleA', self.build_from_sstate),
+                                 ('reproducibleB-extended', False))):
+            if self.save_results:
+                output_log_path = os.path.join(save_dir, "bitbake_%s.log" % name)
+                output_log = bb.msg.logger_create("bitbake_%s" % name,
+                                                  output=open(output_log_path, mode="w", encoding="utf-8"),
+                                                  preserve_handlers=True)
+            (variables, bitbake_failure_count) = self.do_test_build(
+                name, use_sstate, output_log=output_log)
+            if bitbake_failure_count > 0:
+                self.logger.info('%s build failed. Trying to compute built packages differences but the test will fail.' % name)
+                fails.append("Bitbake %s failure" % name)
+            else:
+                if self.save_results:
+                    # Remove full logs if bitbake was successful
+                    del output_log
+                    os.remove(output_log_path)
+            vars_list[i] = variables
 
+        vars_A, vars_B = vars_list
         # NOTE: The temp directories from the reproducible build are purposely
         # kept after the build so it can be diffed for debugging.
 
-        fails = []
-
         for c in self.package_classes:
             with self.subTest(package_class=c):
                 package_class = 'package_' + c

