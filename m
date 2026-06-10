Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DCDCD98D1
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:55:30 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33481.1781132127003733006
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 15:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3NubVih1;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so185417f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 15:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781132125; x=1781736925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pKF1kRu5cREApXAWj3HIRbpZ+CtXwQCjFLVBszOuBhQ=;
        b=3NubVih1VlqOrLuzw5JyYnPPkKrvdTfOYIAmzUr19xb3/Oc32scIAIYmxTw7M7oHPn
         MNCaz6ZRvM/ee/7Uz9aqBX/cZsqjkHOngTF8qL3B5izvnbrBHtgK47iTFl6b1dhsawpj
         70xva3U6RLGjE3dkzLde6hCdLfrS4oyVIXUIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781132125; x=1781736925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pKF1kRu5cREApXAWj3HIRbpZ+CtXwQCjFLVBszOuBhQ=;
        b=E1MxKay5JIw8sFFhDlCWDRQD6LN6vhOYcxglOa2md12P7hI+4/DnL953Nh/ZNBLsT3
         rvXGWou5FRFWfCMprMhXE7Vgqw9LaXre5TNR3zihnPXItxxcK/rOHWLkETVFSj3Ydysq
         ZSzrE9WHlGYV5Ja50svD3KoCQutYRt/SjGlQH2CEvq+qFV4Paqc5bgwYn0P4NJGBabUj
         2rc0Bt8r2P3shyISVar4tdmkALj9ZeubK7Ohh48CrFf6qP21hO0qScvHku5woJkDYv5c
         VXBZ+NMRjf95yomcUwbzfTdJrqAKFHHCAkB2XVZdKLPyelQdd4BB1ZVcp5UkLG/cN0OX
         5K+Q==
X-Gm-Message-State: AOJu0YwddmvNBfSiE1AnGwXGIT9lFKckj+F99h5oI3ti2mPh2SmKH7N6
	YRSSH68fnEv4xZt0FfFion1Y+EIvSkErd0QGSONoBIs2yevsKY6eoKaB/Knj2zqiyrYpjHAdsme
	EMAda
X-Gm-Gg: Acq92OHj2A8P1MwNaHMfcacO4kF2vldzL9JHiD4K2pqD9/dLCyFEtSqvRdkxVNh8PPX
	mDjLnQwUB35XWbZkBZAeuystk3ukwvLbGxtrbhyZpOib81Vn+Y3P5hIfmbcY97jIVSpyk35e0kr
	g9vndw0SRbjO2kqX/7ysjsr8LGSfkvoMS+fyBum9oQNk6jk6Cdsp5ruQF+1IGw32x0oMDVP4Btk
	Hiw9T3qPm8GeDb8Tz5EyFMh6sw6exSIeMN5c98cY+dDeB78yL6EDckLwmDykK+oufAYxHeysgj2
	0N9yCz3Z2CBQCao1dlYmwVYHJt5r0FXCLHDK8YLAb8WTYpC4/jBKu4uw+hLY/hj+b/pA5ohMhKy
	X6hnwr6CBMErcgaxCykXnO3F9E7xxwKiEvFb0hv41zrUZc9GGx40XyUvYOX1NHrghGMeN9ak7Fl
	JXO1ZotQH1Hm0/iJIw4yMeTaPAtcfL0oEehd/jIp2WlolmgdW5vSAt9YVusJ38tseSr3qYiPzs1
	z3K+lCf4Z9fIdl0D3L9q32B1eAr++aBw5KjHZIG0CS0haHbFA==
X-Received: by 2002:a05:6000:2f82:b0:45e:73a1:8d04 with SMTP id ffacd0b85a97d-46067bf5445mr58340f8f.1.1781132125172;
        Wed, 10 Jun 2026 15:55:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm71599304f8f.19.2026.06.10.15.55.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 15:55:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 16/21] python3: upgrade 3.14.4 -> 3.14.5
Date: Thu, 11 Jun 2026 00:55:07 +0200
Message-ID: <48f91fbb0143eac70846cd16b2001138a9319304.1781132051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781132051.git.yoann.congal@smile.fr>
References: <cover.1781132051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 22:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238412

From: Peter Marko <peter.marko@siemens.com>

Release notes: [1] and [2].

Resolves following CVEs from reports:
* CVE-2026-1502
* CVE-2026-3087 (Windows specific)
* CVE-2026-3298 (Windows specific)
* CVE-2026-4786 (explicitly set, see Debian security tracker)
* CVE-2026-5713 (explicitly set, see Debian security tracker)
* CVE-2026-6019 (explicitly set, see Debian security tracker)
* CVE-2026-6100 (explicitly set, see Debian security tracker)
Also some security issues without CVE assignment.

Refresh patches.

[1] https://docs.python.org/3/whatsnew/changelog.html#python-3-14-5-final
[2] https://docs.python.org/3/whatsnew/changelog.html#python-3-14-5-release-candidate-1

(From OE-Core rev: 0df68073ebaecb968448dcf516b9085efadc6d29)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...01-Avoid-shebang-overflow-on-python-config.py.patch |  2 +-
 ....py-handle-stdin-I-O-errors-same-way-as-maste.patch |  2 +-
 ...e.pre-use-qemu-wrapper-when-gathering-profile.patch |  2 +-
 ...ailing-tests-due-to-load-variability-on-YP-AB.patch | 10 +++++-----
 .../0001-Skip-flaky-test_default_timeout-tests.patch   |  4 ++--
 ...-Update-test_sysconfig-for-posix_user-purelib.patch |  2 +-
 ...no_stdout_fileno-test-due-to-load-variability.patch |  2 +-
 ...01-test_active_children-skip-problematic-test.patch |  2 +-
 .../0001-test_cmd-skip-bang-completion-test.patch      |  2 +-
 ...-test_ctypes.test_find-skip-without-tools-sdk.patch |  2 +-
 ...test_locale.py-correct-the-test-output-format.patch |  2 +-
 ...test_only_active_thread-skip-problematic-test.patch |  2 +-
 ...repl-skip-test_unix_console.test_cursor_back_.patch |  2 +-
 .../0001-test_readline-skip-limited-history-test.patch |  6 +++---
 ...sconfig-skip-test_sysconfig.test_sysconfigdat.patch |  2 +-
 meta/recipes-devtools/python/python3/makerace.patch    |  2 +-
 .../python/{python3_3.14.4.bb => python3_3.14.5.bb}    |  8 ++++++--
 17 files changed, 29 insertions(+), 25 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.14.4.bb => python3_3.14.5.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index eaf5ea50496..c2106f94370 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -19,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 9ec3a71..f7d5382 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2585,6 +2585,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2829,6 +2829,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
index 84ad2abb0bc..d9072a36f7b 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
@@ -32,7 +32,7 @@ diff --git a/Lib/pty.py b/Lib/pty.py
 index 1d97994..fa8821b 100644
 --- a/Lib/pty.py
 +++ b/Lib/pty.py
-@@ -178,7 +178,10 @@ def _copy(master_fd, master_read=_read, stdin_read=_read):
+@@ -149,7 +149,10 @@ def _copy(master_fd, master_read=_read, stdin_read=_read):
              i_buf = i_buf[n:]
  
          if stdin_avail and STDIN_FILENO in rfds:
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index 39b62f6f26b..e25797f57ec 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
@@ -18,7 +18,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 3bd4495f95b..8e8fc60bc76 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -751,8 +751,7 @@ profile-run-stamp:
+@@ -857,8 +857,7 @@ profile-run-stamp:
  	# enabled.
  	$(MAKE) profile-gen-stamp
  	# Next, run the profile task to generate the profile information.
diff --git a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
index 4a35e8854e1..a236268efb2 100644
--- a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
+++ b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
@@ -30,7 +30,7 @@ diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.
 index 9a72362c022..008e6a505a5 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -722,6 +722,7 @@ def test_close(self):
+@@ -774,6 +774,7 @@ class _TestProcess(BaseTestCase):
          close_queue(q)
  
      @support.requires_resource('walltime')
@@ -38,7 +38,7 @@ index 9a72362c022..008e6a505a5 100644
      def test_many_processes(self):
          if self.TYPE == 'threads':
              self.skipTest('test not appropriate for {}'.format(self.TYPE))
-@@ -2345,6 +2346,7 @@ def _test_timeout_f(cls, barrier, results):
+@@ -2398,6 +2399,7 @@ class _TestBarrier(BaseTestCase):
          except threading.BrokenBarrierError:
              results.append(True)
  
@@ -46,7 +46,7 @@ index 9a72362c022..008e6a505a5 100644
      def test_timeout(self):
          """
          Test wait(timeout)
-@@ -5459,6 +5461,7 @@ def signal_and_sleep(cls, sem, period):
+@@ -5550,6 +5552,7 @@ class TestWait(unittest.TestCase):
          time.sleep(period)
  
      @support.requires_resource('walltime')
@@ -58,7 +58,7 @@ diff --git a/Lib/test/test_time.py b/Lib/test/test_time.py
 index 5312faa5077..36873d9a400 100644
 --- a/Lib/test/test_time.py
 +++ b/Lib/test/test_time.py
-@@ -548,6 +548,7 @@ def test_monotonic(self):
+@@ -548,6 +548,7 @@ class TimeTestCase(unittest.TestCase):
      def test_perf_counter(self):
          time.perf_counter()
  
@@ -66,7 +66,7 @@ index 5312faa5077..36873d9a400 100644
      @unittest.skipIf(
          support.is_wasi, "process_time not available on WASI"
      )
-@@ -567,6 +568,7 @@ def test_process_time(self):
+@@ -567,6 +568,7 @@ class TimeTestCase(unittest.TestCase):
          self.assertTrue(info.monotonic)
          self.assertFalse(info.adjustable)
  
diff --git a/meta/recipes-devtools/python/python3/0001-Skip-flaky-test_default_timeout-tests.patch b/meta/recipes-devtools/python/python3/0001-Skip-flaky-test_default_timeout-tests.patch
index 4e1bd833b46..d41037f9ea9 100644
--- a/meta/recipes-devtools/python/python3/0001-Skip-flaky-test_default_timeout-tests.patch
+++ b/meta/recipes-devtools/python/python3/0001-Skip-flaky-test_default_timeout-tests.patch
@@ -27,7 +27,7 @@ diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.
 index e8064e7..9ab1f9e 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -2259,6 +2259,7 @@ class _TestBarrier(BaseTestCase):
+@@ -2424,6 +2424,7 @@ class _TestBarrier(BaseTestCase):
          """
          Test the barrier's default timeout
          """
@@ -39,7 +39,7 @@ diff --git a/Lib/test/lock_tests.py b/Lib/test/lock_tests.py
 index 8c8f890..43e9b90 100644
 --- a/Lib/test/lock_tests.py
 +++ b/Lib/test/lock_tests.py
-@@ -1165,6 +1165,7 @@ class BarrierTests(BaseTestCase):
+@@ -1215,6 +1215,7 @@ class BarrierTests(BaseTestCase):
          """
          Test the barrier's default timeout
          """
diff --git a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
index adaca4ff779..6a62c6dc5b9 100644
--- a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
@@ -25,7 +25,7 @@ diff --git a/Lib/test/test_sysconfig.py b/Lib/test/test_sysconfig.py
 index 1ade492..4e94889 100644
 --- a/Lib/test/test_sysconfig.py
 +++ b/Lib/test/test_sysconfig.py
-@@ -430,7 +430,7 @@ class TestSysConfig(unittest.TestCase):
+@@ -434,7 +434,7 @@ class TestSysConfig(unittest.TestCase, VirtualEnvironmentMixin):
                  expected = os.path.normpath(global_path.replace(base, user, 1))
                  # bpo-44860: platlib of posix_user doesn't use sys.platlibdir,
                  # whereas posix_prefix does.
diff --git a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
index 9bc8b091cc6..b186bdcb880 100644
--- a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
+++ b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
@@ -19,7 +19,7 @@ diff --git a/Lib/test/test_builtin.py b/Lib/test/test_builtin.py
 index c5394de..ed17fb6 100644
 --- a/Lib/test/test_builtin.py
 +++ b/Lib/test/test_builtin.py
-@@ -2474,6 +2474,7 @@ class PtyTests(unittest.TestCase):
+@@ -2738,6 +2738,7 @@ class PtyTests(unittest.TestCase):
                           "byte 0xe9 in position 4: ordinal not in "
                           "range(128)")
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
index 80aa29faf0e..d7202aa5757 100644
--- a/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
@@ -21,7 +21,7 @@ diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.
 index 008e6a505a5..746de8945f0 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -615,6 +615,7 @@ def test_cpu_count(self):
+@@ -667,6 +667,7 @@ class _TestProcess(BaseTestCase):
          self.assertIsInstance(cpus, int)
          self.assertGreaterEqual(cpus, 1)
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch b/meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch
index d339e8c1981..f1ba044cc33 100644
--- a/meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch
@@ -18,7 +18,7 @@ diff --git a/Lib/test/test_cmd.py b/Lib/test/test_cmd.py
 index dbfec42fc21..c33dab8d10d 100644
 --- a/Lib/test/test_cmd.py
 +++ b/Lib/test/test_cmd.py
-@@ -295,6 +295,7 @@ def do_tab_completion_test(self, args):
+@@ -295,6 +295,7 @@ class CmdTestReadline(unittest.TestCase):
          self.assertIn(b'ab_completion_test', output)
          self.assertIn(b'tab completion success', output)
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
index 68e277d662e..cdcd9302d61 100644
--- a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
@@ -18,7 +18,7 @@ diff --git a/Lib/test/test_ctypes/test_find.py b/Lib/test/test_ctypes/test_find.
 index 85b2861..b033203 100644
 --- a/Lib/test/test_ctypes/test_find.py
 +++ b/Lib/test/test_ctypes/test_find.py
-@@ -116,10 +116,12 @@ class FindLibraryLinux(unittest.TestCase):
+@@ -117,10 +117,12 @@ class FindLibraryLinux(unittest.TestCase):
                  # LD_LIBRARY_PATH)
                  self.assertEqual(find_library(libname), 'lib%s.so' % libname)
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
index 189246911b4..201271b0c07 100644
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
@@ -34,7 +34,7 @@ diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py
 index da4bd79..fd9e67d 100644
 --- a/Lib/test/test_locale.py
 +++ b/Lib/test/test_locale.py
-@@ -501,7 +501,7 @@ class TestRealLocales(unittest.TestCase):
+@@ -500,7 +500,7 @@ class TestRealLocales(unittest.TestCase):
              self.skipTest('test needs Turkish locale')
          loc = locale.getlocale(locale.LC_CTYPE)
          if verbose:
diff --git a/meta/recipes-devtools/python/python3/0001-test_only_active_thread-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_only_active_thread-skip-problematic-test.patch
index 4886b7e3863..bc436e077a6 100644
--- a/meta/recipes-devtools/python/python3/0001-test_only_active_thread-skip-problematic-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_only_active_thread-skip-problematic-test.patch
@@ -17,7 +17,7 @@ diff --git a/Lib/test/test_external_inspection.py b/Lib/test/test_external_inspe
 index a709b837161..7a87092c10e 100644
 --- a/Lib/test/test_external_inspection.py
 +++ b/Lib/test/test_external_inspection.py
-@@ -1111,6 +1111,7 @@ def test_self_trace(self):
+@@ -1154,6 +1154,7 @@ class TestGetStackTrace(unittest.TestCase):
              ],
          )
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch b/meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch
index e886c046cb7..97f78712668 100644
--- a/meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch
@@ -33,7 +33,7 @@ diff --git a/Lib/test/test_pyrepl/test_unix_console.py b/Lib/test/test_pyrepl/te
 index 3b0d2637dab..5a3c8952f61 100644
 --- a/Lib/test/test_pyrepl/test_unix_console.py
 +++ b/Lib/test/test_pyrepl/test_unix_console.py
-@@ -172,6 +172,7 @@ def test_cursor_up_down(self, _os_write):
+@@ -186,6 +186,7 @@ class TestConsole(TestCase):
          _os_write.assert_any_call(ANY, TERM_CAPABILITIES["cud"] + b":1")
          con.restore()
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
index a619d51c108..c59c6672e0c 100644
--- a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
@@ -20,7 +20,7 @@ diff --git a/Lib/test/test_readline.py b/Lib/test/test_readline.py
 index 537a9fb..ddf0323 100644
 --- a/Lib/test/test_readline.py
 +++ b/Lib/test/test_readline.py
-@@ -71,6 +71,7 @@ class TestHistoryManipulation (unittest.TestCase):
+@@ -74,6 +74,7 @@ class TestHistoryManipulation (unittest.TestCase):
  
      @unittest.skipUnless(hasattr(readline, "append_history_file"),
                           "append_history not available")
@@ -28,7 +28,7 @@ index 537a9fb..ddf0323 100644
      def test_write_read_append(self):
          hfile = tempfile.NamedTemporaryFile(delete=False)
          hfile.close()
-@@ -142,6 +143,7 @@ class TestHistoryManipulation (unittest.TestCase):
+@@ -145,6 +146,7 @@ class TestHistoryManipulation (unittest.TestCase):
          self.assertEqual(readline.get_history_item(1), "entrée 1")
          self.assertEqual(readline.get_history_item(2), "entrée 22")
  
@@ -36,7 +36,7 @@ index 537a9fb..ddf0323 100644
      def test_write_read_limited_history(self):
          previous_length = readline.get_history_length()
          self.addCleanup(readline.set_history_length, previous_length)
-@@ -390,6 +392,7 @@ readline.write_history_file(history_file)
+@@ -393,6 +395,7 @@ readline.write_history_file(history_file)
          self.assertIn(b"done", output)
  
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch b/meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch
index 0fe9399bf1e..6dfba59a449 100644
--- a/meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch
@@ -19,7 +19,7 @@ diff --git a/Lib/test/test_sysconfig.py b/Lib/test/test_sysconfig.py
 index 09eff11179e..14fcdedccba 100644
 --- a/Lib/test/test_sysconfig.py
 +++ b/Lib/test/test_sysconfig.py
-@@ -685,6 +685,7 @@ def test_makefile_overwrites_config_vars(self):
+@@ -689,6 +689,7 @@ class TestSysConfig(unittest.TestCase, VirtualEnvironmentMixin):
          self.assertNotEqual(data['prefix'], data['base_prefix'])
          self.assertNotEqual(data['exec_prefix'], data['base_exec_prefix'])
  
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index bf73135e096..b29ea56cc34 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -20,7 +20,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index be1b9ea..9ec3a71 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2492,7 +2492,7 @@ COMPILEALL_OPTS=-j0
+@@ -2735,7 +2735,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3_3.14.4.bb b/meta/recipes-devtools/python/python3_3.14.5.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.14.4.bb
rename to meta/recipes-devtools/python/python3_3.14.5.bb
index 71f590f630f..b5c1d6fb3e8 100644
--- a/meta/recipes-devtools/python/python3_3.14.4.bb
+++ b/meta/recipes-devtools/python/python3_3.14.5.bb
@@ -40,8 +40,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "a97d5549e9ad81fe17159ed02c68774ad5d266c72f8d9a0b5a9c371fe85d902b"
-SRC_URI[sha256sum] = "d923c51303e38e249136fc1bdf3568d56ecb03214efdef48516176d3d7faaef8"
+SRC_URI[sha256sum] = "7e32597b99e5d9a39abed35de4693fa169df3e5850d4c334337ffd6a19a36db6"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
@@ -522,3 +521,8 @@ SYSROOT_PREPROCESS_FUNCS += " py3_sysroot_cleanup"
 py3_sysroot_cleanup () {
 	rm -rf ${SYSROOT_DESTDIR}${libdir}/python${PYTHON_MAJMIN}/test
 }
+
+CVE_STATUS[CVE-2026-4786] = "cpe-stable-backport: backported to v3.14.5"
+CVE_STATUS[CVE-2026-5713] = "cpe-stable-backport: backported to v3.14.5"
+CVE_STATUS[CVE-2026-6019] = "cpe-stable-backport: backported to v3.14.5"
+CVE_STATUS[CVE-2026-6100] = "cpe-stable-backport: backported to v3.14.5"

