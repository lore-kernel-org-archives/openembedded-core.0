Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 337FBD2AB16
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 10:09:41 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.15649.1730196572025181885
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 03:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RT/8x21X;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4315abed18aso50225155e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 03:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1730196570; x=1730801370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wL6iKPoRB4XXepb7uj7MB5fvl7AfYLBy0Yl88WUU+eM=;
        b=RT/8x21XH/MNMrjXSYzyeCsVkl9H1mRWCcEEKaOeh81gUFBFYLWwjSPV8/i/0FYg8m
         RkN0qhyXWg7qMVXMpsqCoAHliVq4qzGEXZiQypooWyky58BQHVRSm8k0MxdovDxfXvG4
         gy23gZNcpOT9lshxROI1q6ljYJkmsBf+If5Zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730196570; x=1730801370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wL6iKPoRB4XXepb7uj7MB5fvl7AfYLBy0Yl88WUU+eM=;
        b=FaC+m+ZGqyYpPDgPXWdsyq9nfYu/HFPKT+B9yjonktp2WKMjBm65uNDhwAffB/o/+d
         bC+JfdEJNj2j+p87pMnSlR8nXS0pd2+3989cmL7EjfDMtWGEvM0FaeA3lef61uQfCTzJ
         F+SgFg/cVuzkieuTWhQMz3S4Q+jkh/9hfeqpv+klfV8hFwK//5xp+lYG3PCkb8TJLMco
         IwddRmDlBcJ5iKUr2r2+eOm2dAILDihAkGUj9HBzs31pvbu/XDVGmE5LjkiRs1upYwJz
         8pFDpjTvwLNBJay/DRhBN+DEmQwN9E3cLcMXnjRan2hTVttTfTL2yc7GVnKaBTMz3GaX
         VoUg==
X-Gm-Message-State: AOJu0YwRcc4vEcYMi03tzjNa3RTSWEMjwydRBlXFtIQ3HhyXZd6LU9hl
	7rANSHb8pcqhlvmvkvt2OnjxdpvQJwEPAvEiZugcc8S+0DKln2xd99KijDWrKL4FgXmpQT6BziV
	G
X-Google-Smtp-Source: AGHT+IH4dGwLjRCBLwXyR2VUcxixXGc0QNzRdNccct8ZWk8BdgjvytmxIIW+eZhWReI2tr5GK6K+OA==
X-Received: by 2002:a05:600c:19d3:b0:431:58c4:2eb9 with SMTP id 5b1f17b1804b1-4319ac78f0cmr101263405e9.3.1730196569769;
        Tue, 29 Oct 2024 03:09:29 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43193594c8esm137445145e9.11.2024.10.29.03.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:09:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH RESEND v3] reproducibility: continue testing in case of build failure
Date: Tue, 29 Oct 2024 11:09:12 +0100
Message-Id: <20241029100912.138924-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 10:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206488

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

  <snip>
  2024-10-01 23:09:33,977 - oe-selftest - INFO - test_reproducible_builds (reproducible.ReproducibleTests.test_reproducible_builds)
  2024-10-01 23:10:39,093 - oe-selftest - INFO - Non-reproducible packages will be copied to <snip>/yocto/repro_output/oe-reproducible-20241001-ng43_hzd
  2024-10-01 23:10:39,094 - oe-selftest - INFO - Building reproducibleA (sstate allowed)...
  2024-10-01 23:18:12,378 - oe-selftest - ERROR - Bitbake failed! but keep going... Log:
  2024-10-01 23:18:12,379 - oe-selftest - INFO -     Command 'bitbake  --continue bash hello-norepro hello-fail' returned non-zero exit status 1:
  2024-10-01 23:18:12,379 - oe-selftest - INFO -
  2024-10-01 23:18:12,379 - oe-selftest - INFO -     ... (last 20 lines of output)
  2024-10-01 23:18:12,379 - oe-selftest - INFO -     NOTE: Running task 976 of 990 (<snip>/yocto/poky/meta/recipes-extended/bash/bash_5.2.32.bb:do_package_qa)
  2024-10-01 23:18:12,379 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_populate_sysroot: Started
  2024-10-01 23:18:12,379 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_qa: Started
  2024-10-01 23:18:12,379 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_populate_sysroot: Succeeded
  2024-10-01 23:18:12,379 - oe-selftest - INFO -     NOTE: Running setscene task 342 of 343 (<snip>/yocto/poky/meta/recipes-extended/bash/bash_5.2.32.bb:do_create_package_spdx_setscene)
  2024-10-01 23:18:12,379 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_create_package_spdx_setscene: Started
  2024-10-01 23:18:12,379 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_create_package_spdx_setscene: Succeeded
  2024-10-01 23:18:12,379 - oe-selftest - INFO -     NOTE: Running setscene task 343 of 343 (<snip>/yocto/poky/meta/recipes-extended/bash/bash_5.2.32.bb:do_create_spdx_setscene)
  2024-10-01 23:18:12,379 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_create_spdx_setscene: Started
  2024-10-01 23:18:12,379 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_create_spdx_setscene: Succeeded
  2024-10-01 23:18:12,379 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_qa: Succeeded
  2024-10-01 23:18:12,379 - oe-selftest - INFO -     NOTE: Running noexec task 979 of 990 (<snip>/yocto/poky/meta/recipes-extended/bash/bash_5.2.32.bb:do_build)
  2024-10-01 23:18:12,380 - oe-selftest - INFO -     NOTE: Tasks Summary: Attempted 979 tasks of which 841 didn't need to be rerun and 1 failed.
  2024-10-01 23:18:12,380 - oe-selftest - INFO -     NOTE: Generating JSON CVE summary
  2024-10-01 23:18:12,380 - oe-selftest - INFO -     Complete CVE JSON report summary created at: <snip>/yocto/poky/build-master-st/reproducibleA/tmp/log/cve/cve-summary.json
  2024-10-01 23:18:12,380 - oe-selftest - INFO -
  2024-10-01 23:18:12,380 - oe-selftest - INFO -     Summary: 1 task failed:
  2024-10-01 23:18:12,380 - oe-selftest - INFO -       <snip>/yocto/poky/meta/recipes-core/hello-single/hello-fail_1.0.bb:do_compile
  2024-10-01 23:18:12,380 - oe-selftest - INFO -         log: <snip>/yocto/poky/build-master-st/reproducibleA/tmp/work/core2-64-poky-linux/hello-fail/1.0/temp/log.do_compile.3221257
  2024-10-01 23:18:12,380 - oe-selftest - INFO -     Summary: There was 1 ERROR message, returning a non-zero exit code.
  2024-10-01 23:18:12,380 - oe-selftest - ERROR - reproducibleA build failed. Trying to compute built packages differences but the test will fail.
  2024-10-01 23:18:12,382 - oe-selftest - INFO - Building reproducibleB-extended (sstate NOT allowed)...
  2024-10-01 23:46:58,451 - oe-selftest - ERROR - Bitbake failed! but keep going... Log:
  2024-10-01 23:46:58,463 - oe-selftest - INFO -     Command 'bitbake  --continue bash hello-norepro hello-fail' returned non-zero exit status 1:
  2024-10-01 23:46:58,463 - oe-selftest - INFO -
  2024-10-01 23:46:58,463 - oe-selftest - INFO -     ... (last 20 lines of output)
  2024-10-01 23:46:58,463 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_write_ipk: Started
  2024-10-01 23:46:58,463 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_qa: Started
  2024-10-01 23:46:58,463 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_create_spdx: Succeeded
  2024-10-01 23:46:58,463 - oe-selftest - INFO -     NOTE: Running task 978 of 990 (<snip>/yocto/poky/meta/recipes-extended/bash/bash_5.2.32.bb:do_create_package_spdx)
  2024-10-01 23:46:58,463 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_create_package_spdx: Started
  2024-10-01 23:46:58,463 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_create_package_spdx: Succeeded
  2024-10-01 23:46:58,463 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_qa: Succeeded
  2024-10-01 23:46:58,463 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_write_deb: Succeeded
  2024-10-01 23:46:58,463 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_write_ipk: Succeeded
  2024-10-01 23:46:58,463 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_write_rpm: Succeeded
  2024-10-01 23:46:58,464 - oe-selftest - INFO -     NOTE: Running noexec task 979 of 990 (<snip>/yocto/poky/meta/recipes-extended/bash/bash_5.2.32.bb:do_build)
  2024-10-01 23:46:58,464 - oe-selftest - INFO -     NOTE: Tasks Summary: Attempted 979 tasks of which 2 didn't need to be rerun and 1 failed.
  2024-10-01 23:46:58,464 - oe-selftest - INFO -     NOTE: Generating JSON CVE summary
  2024-10-01 23:46:58,464 - oe-selftest - INFO -     Complete CVE JSON report summary created at: <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/log/cve/cve-summary.json
  2024-10-01 23:46:58,464 - oe-selftest - INFO -
  2024-10-01 23:46:58,464 - oe-selftest - INFO -     Summary: 1 task failed:
  2024-10-01 23:46:58,464 - oe-selftest - INFO -       <snip>/yocto/poky/meta/recipes-core/hello-single/hello-fail_1.0.bb:do_compile
  2024-10-01 23:46:58,464 - oe-selftest - INFO -         log: <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/work/core2-64-poky-linux/hello-fail/1.0/temp/log.do_compile.4136075
  2024-10-01 23:46:58,464 - oe-selftest - INFO -     Summary: There were 5 WARNING messages.
  2024-10-01 23:46:58,464 - oe-selftest - INFO -     Summary: There was 1 ERROR message, returning a non-zero exit code.
  2024-10-01 23:46:58,467 - oe-selftest - ERROR - reproducibleB-extended build failed. Trying to compute built packages differences but the test will fail.
  2024-10-01 23:46:58,481 - oe-selftest - INFO - Checking deb packages for differences...
  2024-10-01 23:46:58,586 - oe-selftest - INFO - Reproducibility summary for deb: same=52 different=1 different_excluded=0 missing=0 total=53
  unused_exclusions=[]
  2024-10-01 23:46:58,588 - oe-selftest - INFO - Checking ipk packages for differences...
  2024-10-01 23:46:58,658 - oe-selftest - INFO - Reproducibility summary for ipk: same=52 different=1 different_excluded=0 missing=0 total=53
  unused_exclusions=[]
  2024-10-01 23:46:58,659 - oe-selftest - INFO - Checking rpm packages for differences...
  2024-10-01 23:46:58,691 - oe-selftest - INFO - Reproducibility summary for rpm: same=52 different=1 different_excluded=0 missing=0 total=53
  unused_exclusions=[]
  2024-10-01 23:46:58,692 - oe-selftest - INFO - Running diffoscope
  2024-10-01 23:46:59,765 - oe-selftest - INFO -  ... FAIL
  2024-10-01 23:46:59,766 - oe-selftest - INFO - Traceback (most recent call last):
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

  2024-10-01 23:46:59,769 - oe-selftest - INFO - ======================================================================
  2024-10-01 23:46:59,770 - oe-selftest - INFO - FAIL: test_reproducible_builds (reproducible.ReproducibleTests.test_reproducible_builds)
  2024-10-01 23:46:59,770 - oe-selftest - INFO - ----------------------------------------------------------------------
  2024-10-01 23:46:59,770 - oe-selftest - INFO - Traceback (most recent call last):
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

  2024-10-01 23:46:59,770 - oe-selftest - INFO - ----------------------------------------------------------------------
  2024-10-01 23:46:59,770 - oe-selftest - INFO - Ran 1 test in 2246.039s
  2024-10-01 23:46:59,770 - oe-selftest - INFO - FAILED
  2024-10-01 23:46:59,770 - oe-selftest - INFO -  (failures=1)
  2024-10-01 23:47:03,200 - oe-selftest - INFO - RESULTS:
  2024-10-01 23:47:03,200 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: FAILED (2245.79s)
  2024-10-01 23:47:03,203 - oe-selftest - INFO - SUMMARY:
  2024-10-01 23:47:03,203 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 2246.040s
  2024-10-01 23:47:03,203 - oe-selftest - INFO - oe-selftest - FAIL - Required tests failed (successes=0, skipped=0, failures=1, errors=0)

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
v2->v3:
* Added a missing end of line in config concatenation

v1->v2:
* Upgrade some log from INFO to ERROR in the failing case to make it
  more visible in the logs.
Richard Purdie review:
* Simplify log handling
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 56 ++++++++++++++++----
 1 file changed, 47 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 3d3f30eebc..a68f72ff23 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -221,7 +221,6 @@ class ReproducibleTests(OESelftestTestCase):
         tmpdir = os.path.join(self.topdir, name, 'tmp')
         if os.path.exists(tmpdir):
             bb.utils.remove(tmpdir, recurse=True)
-
         config = textwrap.dedent('''\
             PACKAGE_CLASSES = "{package_classes}"
             TMPDIR = "{tmpdir}"
@@ -234,11 +233,24 @@ class ReproducibleTests(OESelftestTestCase):
             ''').format(package_classes=' '.join('package_%s' % c for c in self.package_classes),
                         tmpdir=tmpdir)
 
+        # Export BB_CONSOLELOG to the calling function and make it constant to
+        # avoid a case where bitbake would get a timestamp-based filename but
+        # oe-selftest would, later, get another.
+        capture_vars.append("BB_CONSOLELOG")
+        config += 'BB_CONSOLELOG = "${LOG_DIR}/cooker/${MACHINE}/console.log"\n'
+
+        bitbake_failure_count = 0
         if not use_sstate:
             if self.sstate_targets:
                self.logger.info("Building prebuild for %s (sstate allowed)..." % (name))
                self.write_config(config)
-               bitbake(' '.join(self.sstate_targets))
+               try:
+                   bitbake("--continue "+' '.join(self.sstate_targets), limit_exc_output=20)
+               except AssertionError as e:
+                   bitbake_failure_count += 1
+                   self.logger.error("Bitbake failed! but keep going... Log:")
+                   for line in str(e).split("\n"):
+                       self.logger.info("    "+line)
 
             # This config fragment will disable using shared and the sstate
             # mirror, forcing a complete build from scratch
@@ -251,8 +263,25 @@ class ReproducibleTests(OESelftestTestCase):
         self.write_config(config)
         d = get_bb_vars(capture_vars)
         # targets used to be called images
-        bitbake(' '.join(getattr(self, 'images', self.targets)))
-        return d
+        try:
+            bitbake("--continue "+' '.join(getattr(self, 'images', self.targets)), limit_exc_output=20)
+        except AssertionError as e:
+            bitbake_failure_count += 1
+
+            self.logger.error("Bitbake failed! but keep going... Log:")
+            for line in str(e).split("\n"):
+                self.logger.info("    "+line)
+
+            # The calling function expects the existence of the deploy
+            # directories containing the packages.
+            # If bitbake failed to create them, do it manually
+            for c in self.package_classes:
+                deploy = d['DEPLOY_DIR_' + c.upper()]
+                if not os.path.exists(deploy):
+                    self.logger.info("Manually creating %s" % deploy)
+                    bb.utils.mkdirhier(deploy)
+
+        return (d, bitbake_failure_count)
 
     def test_reproducible_builds(self):
         def strip_topdir(s):
@@ -278,15 +307,24 @@ class ReproducibleTests(OESelftestTestCase):
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
+            (variables, bitbake_failure_count) = self.do_test_build(name, use_sstate)
+            if bitbake_failure_count > 0:
+                self.logger.error('%s build failed. Trying to compute built packages differences but the test will fail.' % name)
+                fails.append("Bitbake %s failure" % name)
+                if self.save_results:
+                    self.copy_file(variables["BB_CONSOLELOG"], os.path.join(save_dir, "bitbake-%s.log" % name))
+            vars_list[i] = variables
 
+        vars_A, vars_B = vars_list
         # NOTE: The temp directories from the reproducible build are purposely
         # kept after the build so it can be diffed for debugging.
 
-        fails = []
-
         for c in self.package_classes:
             with self.subTest(package_class=c):
                 package_class = 'package_' + c

