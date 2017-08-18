Return-Path: <rpurdie@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8E0D478489
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 09:38:32 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7I9cPFf022514
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 18 Aug 2017 10:38:27 +0100
Message-ID: <1503049105.32591.3.camel@rpsys.net>
From: Richard Purdie <rpurdie@rpsys.net>
To: Hongxu Jia <hongxu.jia@windriver.com>,
	openembedded-core@lists.openembedded.org, ross.burton@intel.com
Date: Fri, 18 Aug 2017 10:38:25 +0100
In-Reply-To: <10402a7b38658b70df9d5f54d3cd28684ab8fb55.1502869419.git.hongxu.jia@windriver.com>
References: <cover.1502869419.git.hongxu.jia@windriver.com>
	<10402a7b38658b70df9d5f54d3cd28684ab8fb55.1502869419.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 18 Aug 2017 10:38:27 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 6/8] gnupg: 2.1.20 -> 2.1.23
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
X-List-Received-Date: Fri, 18 Aug 2017 09:38:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-08-16 at 04:31 -0400, Hongxu Jia wrote:
> COPYING.LIB: Rename to COPYING.LGPL3.
> https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commit;h=3419a
> 339d9c4e800bf30e9021e05982d8c1021c1
> 
> Rebase patches:
> - pkgconfig.patch -> 0001
> - use-pkgconfig-instead-of-npth-config.patch -> 0002
> - dirmngr-uses-libgpg-error.patch -> 0003
> - autogen.sh-fix-find-version-for-beta-checking.patch -> 0004
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

Its taken a bit of tracking down but this causes "oe-selftest -r
runtime_test.TestImage.test_testimage_dnf" to fail:

NOTE: Executing RunQueue Tasks
NOTE: Running task 547 of 547 (/media/build1/poky/meta/recipes-extended/images/core-image-full-cmdline.bb:do_testimage)
NOTE: recipe core-image-full-cmdline-1.0-r0: task do_testimage: Started
RESULTS:
RESULTS - dnf.DnfBasicTest.test_dnf_help - Testcase 1735: PASSED
RESULTS - ping.PingTest.test_ping - Testcase 964: PASSED
RESULTS - ssh.SSHTest.test_ssh - Testcase 224: PASSED
RESULTS - dnf_runtime.DnfSelftest.test_verify_package_feeds - Testcase -1: FAILED
SUMMARY:
core-image-full-cmdline () - Ran 4 tests in 23.612s
core-image-full-cmdline - FAIL - Required tests failed
ERROR: core-image-full-cmdline-1.0-r0 do_testimage: core-image-full-cmdline - FAILED - check the task log and the ssh log
ERROR: core-image-full-cmdline-1.0-r0 do_testimage: Function failed: do_testimage
ERROR: Logfile of failure stored in: /media/build1/poky/build/tmp/work/qemux86-poky-linux/core-image-full-cmdline/1.0-r0/temp/log.do_testimage.11134
NOTE: recipe core-image-full-cmdline-1.0-r0: task do_testimage: Failed
ERROR: Task (/media/build1/poky/meta/recipes-extended/images/core-image-full-cmdline.bb:do_testimage) failed with exit code '1'
NOTE: Tasks Summary: Attempted 547 tasks of which 546 didn't need to be rerun and 1 failed.

Summary: 1 task failed:
  /media/build1/poky/meta/recipes-extended/images/core-image-full-cmdline.bb:do_testimage
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
----------------------------------------------------------------------
2017-08-18 09:39:52,189 - oe-selftest - INFO - Ran 1 test in 343.737s
2017-08-18 09:39:52,189 - oe-selftest - INFO - FAILED
2017-08-18 09:39:52,189 - oe-selftest - INFO -  (failures=1)
2017-08-18 09:39:52,193 - oe-selftest - INFO - RESULTS:
2017-08-18 09:39:52,193 - oe-selftest - INFO - RESULTS - runtime_test.TestImage.test_testimage_dnf - Testcase 1883: FAILED
2017-08-18 09:39:52,193 - oe-selftest - INFO - SUMMARY:
2017-08-18 09:39:52,193 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 343.742s
2017-08-18 09:39:52,193 - oe-selftest - INFO - oe-selftest - FAIL - Required tests failed

With:

diff --git a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
index 6742e8c..f813c43 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
@@ -37,7 +37,7 @@ class DnfSelftest(DnfTest):
 
         import re
         # Use '-y' for non-interactive mode: automatically import the feed signing key
-        output_makecache = self.dnf('-y makecache')
+        output_makecache = self.dnf('-vy makecache')
         self.assertTrue(re.match(r".*Failed to synchronize cache", output_makecache, re.DOTALL) is None, msg = "dnf makecache failed to synchronize repo: %s" %(output_makecache))
         self.assertTrue(re.match(r".*Metadata cache created", output_makecache, re.DOTALL) is not None, msg = "dnf makecache failed: %s" %(output_makecache))

applied the log shows:

NOTE: Traceback (most recent call last):
  File "/media/build1/poky/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
    return func(*args, **kwargs)
  File "/media/build1/poky/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py", line 41, in test_verify_package_feeds
    self.assertTrue(re.match(r".*Failed to synchronize cache", output_makecache, re.DOTALL) is None, msg = "dnf makecache failed to synchronize repo: %s" %(output_makecache))
AssertionError: False is not true : dnf makecache failed to synchronize repo: Unable to detect release version (use '--releasever' to specify release version)
DNF version: 2.6.3
cachedir: /var/cache/dnf
Making cache files for all metadata files.
oe-remote-repo: has expired and will be refreshed.
Cannot download 'http://192.168.7.1:33541': repomd.xml GPG signature verification error: gpgme_engine_check_version() error: Invalid crypto engine.
Failed to synchronize cache for repo 'oe-remote-repo', disabling.
Metadata cache created.

If I revert this upgrade it works again. Seems to be some kind of
gpgme/gnupg version compatibility issue?

Cheers,

Richard



