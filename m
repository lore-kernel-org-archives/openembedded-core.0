Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB46EC79FAA
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:37 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2487.1788641126805165538
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pp0EUcbV;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49557167508so26652575e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641125; x=1789245925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uNpfDTk6jCsyMjtCm8h3eRnhz4E3GmkhsoGYq4542eE=;
        b=pp0EUcbVAkLKbhddOwAD+DfvakVNf2RwNsu3aRR+VZtmOrSwRiOt6S9YIIqMKzUKqv
         WSTifAPdgTTodNEMBWeLZarcs2v4dagnb44XjZwrr4/d+e4EV2LcyJ+ZEp27y4lLP3Tm
         M48F2ZeEpXv+jsc7NZudVHXfU/PLkxqxU4uLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641125; x=1789245925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uNpfDTk6jCsyMjtCm8h3eRnhz4E3GmkhsoGYq4542eE=;
        b=mTi2djmH523b90x/CZmQ9cgWffexcQ5JyZHRhuiLbyGr4Cve4bTLgKmnrePJY2V43d
         gD0uQnFTT/N1rexRU/P+jikPJTDoJ+l41td75R1U8G+v/KVfJKHwqy0ieSbe4L0hjjuy
         6ADbvm7J+h+c2dPsZrKuAfSf0mnJfrZ91kpIZOILKdlUh50l3tZkjnuhIw3rOlQwtq3f
         3ehhjyCWvM8Gb1y7eB83OvfBEyYCeDf3+sj7E78ZKV1YhwgHhpxo3bBVANTRyy/+4yQC
         jyYQm7axMdjjqxAHeL3AIWNx/FdnFdC8t208ubn4Z1W1/x1bRR9inTCtFheEy9acNqTh
         S7Mw==
X-Gm-Message-State: AFuF++nrcRhdPX/hItja/aY2Dfegi1Q3ZoafRO1mnl92bgLN+ygSG2qR
	GEeg7+G5pmQDuIwmExRexO0vYjFhOpbwfn6gk2MQBepfZKz6gLRusy71K59NlOq056PmCUt3MqD
	Y7yNgUCU=
X-Gm-Gg: AYBFou3lX8bJQpwXHsx2DT+GIPp7kSl2VUYGMq7hc4dWPb/u8m9hvNRV+VUpQzXVfpk
	BoRQq2uHc4rLM6y46DHBx6urhNbni15AXMNQ3fMSNoom36N9V1ZrcQV4spk9SZkfM0EtX9rPf/I
	fyl+lJecePNAsVoviVnu1AoK7iAeUEutqidwEFA5GSER9SYDMw/xvEmZyjwvH3Uzgbu+rdt9KY8
	i48Wxswjd+KiOhQdAqyJBfl1vb2JjP8DQQm6CrGxEVdjavbnaxgV6UB+rNgw33kO9iNv4x2PjN/
	6naUq8y3ff3UUXK/g+sKTzBJsBQ2yUTM+IV/CnJQPsN9OA9l8kFMQoamBAN6nMEK+oP7RZfmEiY
	b432BSr7pzLXo+bD1rYeBuWKUXZLlp10yvxuwP6bchG5nHKClRJhCLu3zrGWkB6LLsrKrlG/sx7
	Ib3kKTOfjdC3Mnr3J2yadfXI+zpz802NQQ8SoUEFRFel7IFDRnb1ezJzdcCEv8OGA76AUjH12Yr
	7EiCwPuSP75pen/UjzbK98sudDM3XEDLIocxJphqkARlLsUnDZAehwK579EZHTUEg==
X-Received: by 2002:a05:600d:6450:10b0:49c:ffaf:95a1 with SMTP id 5b1f17b1804b1-49cffaf95c3mr128571975e9.1.1788641124888;
        Sat, 05 Sep 2026 13:45:24 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 25/40] python3: upgrade 3.14.6 -> 3.14.7
Date: Sat,  5 Sep 2026 22:44:26 +0200
Message-ID: <8ed4aeb3e72e4d643801adba289123b2378705bb.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245177

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Release notes: [1]

Removed patches included in this release.
Removed obsolete CVE_STATUS entries.

[1] https://docs.python.org/3/whatsnew/changelog.html#python-3-14-7-final

(From OE-Core rev: 1e7832f8de0a07a2c7c6e239b31b82d47ccb915c)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...shebang-overflow-on-python-config.py.patch |  6 +-
 ...e-stdin-I-O-errors-same-way-as-maste.patch |  4 +-
 ...-use-prefix-value-from-build-configu.patch |  7 +-
 ...-qemu-wrapper-when-gathering-profile.patch |  9 +--
 ...est_sysconfig-for-posix_user-purelib.patch |  4 +-
 .../0001-prefer-valid-entrypoints.patch       |  2 +-
 ...g.py-use-platlibdir-also-for-purelib.patch |  4 +-
 ...le.py-correct-the-test-output-format.patch |  6 +-
 .../python/python3/CVE-2026-11940.patch       | 67 -------------------
 .../python/python3/CVE-2026-11972.patch       | 61 -----------------
 .../python/python3/makerace.patch             |  6 +-
 .../python/python3/valid-dists.patch          |  2 +-
 .../{python3_3.14.6.bb => python3_3.14.7.bb}  |  7 +-
 13 files changed, 24 insertions(+), 161 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-11940.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-11972.patch
 rename meta/recipes-devtools/python/{python3_3.14.6.bb => python3_3.14.7.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index c2106f94370..7a605383647 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -1,4 +1,4 @@
-From 6b111a328c1c57b1580d63894b2b5d337316f6d4 Mon Sep 17 00:00:00 2001
+From 3f2df0e1fce8c7425998dade00d084f1b101a982 Mon Sep 17 00:00:00 2001
 From: Paulo Neves <ptsneves@gmail.com>
 Date: Tue, 7 Jun 2022 16:16:41 +0200
 Subject: [PATCH] Avoid shebang overflow on python-config.py
@@ -16,10 +16,10 @@ Upstream-Status: Denied [distribution]
  1 file changed, 2 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 9ec3a71..f7d5382 100644
+index e946018..345ed29 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2829,6 +2829,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2835,6 +2835,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
index d9072a36f7b..532adfe69a9 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
@@ -1,4 +1,4 @@
-From 129ee75863081d9e3418acca3df1e47667f671ad Mon Sep 17 00:00:00 2001
+From 9cd44429215352eb2753e0fd8e25fef24f714006 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 16 Sep 2021 16:35:37 +0200
 Subject: [PATCH] Lib/pty.py: handle stdin I/O errors same way as master I/O
@@ -29,7 +29,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/Lib/pty.py b/Lib/pty.py
-index 1d97994..fa8821b 100644
+index 4b25ac3..d6aac07 100644
 --- a/Lib/pty.py
 +++ b/Lib/pty.py
 @@ -149,7 +149,10 @@ def _copy(master_fd, master_read=_read, stdin_read=_read):
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index 285580195b4..60391e726bd 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From e3c6e770e73e1329958db0a73883e42b01763ae3 Mon Sep 17 00:00:00 2001
+From b5aad6a9b6c5add7a85861aed8aa030c1ad3d52f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 17 Nov 2023 14:26:32 +0100
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
@@ -18,7 +18,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/Lib/sysconfig/__init__.py b/Lib/sysconfig/__init__.py
-index 2ecbff222fe..cec54cb23dc 100644
+index 0a8bcc0..a2341f2 100644
 --- a/Lib/sysconfig/__init__.py
 +++ b/Lib/sysconfig/__init__.py
 @@ -538,12 +538,12 @@ def _init_config_vars():
@@ -39,6 +39,3 @@ index 2ecbff222fe..cec54cb23dc 100644
      _CONFIG_VARS['implementation'] = _get_implementation()
      _CONFIG_VARS['implementation_lower'] = _get_implementation().lower()
      _CONFIG_VARS['abiflags'] = abiflags
--- 
-2.51.0
-
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index e25797f57ec..c7f14cad1e0 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
@@ -1,4 +1,4 @@
-From e7a8a7385f561f214054cf95f0a22bfa064eee0b Mon Sep 17 00:00:00 2001
+From d6f77e3a934616d1f6c083b7144c50a32e08b70a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 30 Jan 2019 12:41:04 +0100
 Subject: [PATCH] Makefile.pre: use qemu wrapper when gathering profile data
@@ -15,10 +15,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 3bd4495f95b..8e8fc60bc76 100644
+index 526d500..a7e536d 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -857,8 +857,7 @@ profile-run-stamp:
+@@ -861,8 +861,7 @@ profile-run-stamp:
  	# enabled.
  	$(MAKE) profile-gen-stamp
  	# Next, run the profile task to generate the profile information.
@@ -28,6 +28,3 @@ index 3bd4495f95b..8e8fc60bc76 100644
  	$(LLVM_PROF_MERGER)
  	# Remove profile generation binary since we are done with it.
  	$(MAKE) clean-retain-profile
--- 
-2.39.5
-
diff --git a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
index 6a62c6dc5b9..5509b7475a9 100644
--- a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
@@ -1,4 +1,4 @@
-From 5bf5aa6eae1fa3eed66893e51a1858ab481426b4 Mon Sep 17 00:00:00 2001
+From c608cb4b3c8c31f1aa25ad1264ff58733fb99769 Mon Sep 17 00:00:00 2001
 From: Wentao Zhang <wentao.zhang@windriver.com>
 Date: Mon, 20 Mar 2023 13:39:52 +0800
 Subject: [PATCH] Update test_sysconfig for posix_user purelib
@@ -22,7 +22,7 @@ Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/test/test_sysconfig.py b/Lib/test/test_sysconfig.py
-index 1ade492..4e94889 100644
+index 1fe4b68..383142a 100644
 --- a/Lib/test/test_sysconfig.py
 +++ b/Lib/test/test_sysconfig.py
 @@ -434,7 +434,7 @@ class TestSysConfig(unittest.TestCase, VirtualEnvironmentMixin):
diff --git a/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypoints.patch b/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypoints.patch
index 1250dc9ff04..ae3698fac47 100644
--- a/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypoints.patch
+++ b/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypoints.patch
@@ -1,4 +1,4 @@
-From ef33ac27e3ac1b9cb159d7eec0ad1af120cd9dc1 Mon Sep 17 00:00:00 2001
+From 8d7fcf04c6513841c7985e64b746b1ef5de0c426 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 17 Apr 2026 16:53:42 +0100
 Subject: [PATCH] prefer valid entrypoints
diff --git a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
index b9c68a98d70..7807827d9aa 100644
--- a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
@@ -1,4 +1,4 @@
-From bbcb17dc1ed283f41c8cd94d39f70898f0c45583 Mon Sep 17 00:00:00 2001
+From c10d1b295a9fb93836830cce441da3f22e5c7cd7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 12 Sep 2021 21:44:36 +0200
 Subject: [PATCH] sysconfig.py: use platlibdir also for purelib
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/sysconfig/__init__.py b/Lib/sysconfig/__init__.py
-index 80aef34..f8e1c7d 100644
+index faf8273..0a8bcc0 100644
 --- a/Lib/sysconfig/__init__.py
 +++ b/Lib/sysconfig/__init__.py
 @@ -29,7 +29,7 @@ _INSTALL_SCHEMES = {
diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
index 201271b0c07..a60d082e2f4 100644
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
@@ -1,4 +1,4 @@
-From c1f3cf625c0f011060ddaa2a4096f6aa13dd1ee6 Mon Sep 17 00:00:00 2001
+From f0ac5b479b99bfb7f5e937a941b31a596f4caafc Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 5 Aug 2019 15:57:39 +0800
 Subject: [PATCH] test_locale.py: correct the test output format
@@ -31,10 +31,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py
-index da4bd79..fd9e67d 100644
+index f918435..1910a43 100644
 --- a/Lib/test/test_locale.py
 +++ b/Lib/test/test_locale.py
-@@ -500,7 +500,7 @@ class TestRealLocales(unittest.TestCase):
+@@ -499,7 +499,7 @@ class TestRealLocales(unittest.TestCase):
              self.skipTest('test needs Turkish locale')
          loc = locale.getlocale(locale.LC_CTYPE)
          if verbose:
diff --git a/meta/recipes-devtools/python/python3/CVE-2026-11940.patch b/meta/recipes-devtools/python/python3/CVE-2026-11940.patch
deleted file mode 100644
index 05a5802c396..00000000000
--- a/meta/recipes-devtools/python/python3/CVE-2026-11940.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From e24b4e95524fbe8cd0f46aa3292e8040f0e07c83 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Tue, 23 Jun 2026 15:58:47 +0200
-Subject: [PATCH 1/2] gh-151558: Fix symlink escape via `tarfile`
- hardlink-extraction fallback (GH-151559)
-
-CVE: CVE-2026-11940
-Upstream-Status: Backport [https://github.com/python/cpython/commit/27dd970bf6b17ebca7c8ed486a40ab043ed7af8f]
-
-Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
----
- Lib/tarfile.py           |  3 +++
- Lib/test/test_tarfile.py | 24 ++++++++++++++++++++++++
- 2 files changed, 27 insertions(+)
-
-diff --git a/Lib/tarfile.py b/Lib/tarfile.py
-index e6734db24f64..63f23490e8a1 100644
---- a/Lib/tarfile.py
-+++ b/Lib/tarfile.py
-@@ -2782,6 +2782,9 @@ def makelink_with_filter(self, tarinfo, targetpath,
-                     "makelink_with_filter: if filter_function is not None, "
-                     + "extraction_root must also not be None")
-             try:
-+                filter_function(
-+                    unfiltered.replace(name=tarinfo.name, deep=False),
-+                    extraction_root)
-                 filtered = filter_function(unfiltered, extraction_root)
-             except _FILTER_ERRORS as cause:
-                 raise LinkFallbackError(tarinfo, unfiltered.name) from cause
-diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
-index d974c7d46ec1..0fc7413be8db 100644
---- a/Lib/test/test_tarfile.py
-+++ b/Lib/test/test_tarfile.py
-@@ -4344,6 +4344,30 @@ def test_sneaky_hardlink_fallback(self):
-                     self.expect_file("boom", symlink_to='../../link_here')
-                     self.expect_file("c", symlink_to='b')
-
-+    @symlink_test
-+    def test_sneaky_hardlink_fallback_deep(self):
-+        # (CVE-2026-11940)
-+        with ArchiveMaker() as arc:
-+            arc.add("a/b/s", symlink_to=os.path.join("..", "escape"))
-+            arc.add("s", hardlink_to=os.path.join("a", "b", "s"))
-+
-+        with self.check_context(arc.open(), 'data'):
-+            e = self.expect_exception(
-+                tarfile.LinkFallbackError,
-+                "link 's' would be extracted as a copy of "
-+                + "'a/b/s', which was rejected")
-+            self.assertIsInstance(e.__cause__,
-+                                  tarfile.LinkOutsideDestinationError)
-+
-+        for filter in 'tar', 'fully_trusted':
-+            with self.subTest(filter), self.check_context(arc.open(), filter):
-+                if not os_helper.can_symlink():
-+                    self.expect_file("a/")
-+                    self.expect_file("a/b/")
-+                else:
-+                    self.expect_file("a/b/s", symlink_to=os.path.join('..', 'escape'))
-+                    self.expect_file("s", symlink_to=os.path.join('..', 'escape'))
-+
-     @symlink_test
-     def test_exfiltration_via_symlink(self):
-         # (CVE-2025-4138)
---
-2.54.0
diff --git a/meta/recipes-devtools/python/python3/CVE-2026-11972.patch b/meta/recipes-devtools/python/python3/CVE-2026-11972.patch
deleted file mode 100644
index 12a79754feb..00000000000
--- a/meta/recipes-devtools/python/python3/CVE-2026-11972.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 2d256d4bfd654bdcaf2d96733799be73b8ff8f69 Mon Sep 17 00:00:00 2001
-From: Petr Viktorin <encukou@gmail.com>
-Date: Tue, 23 Jun 2026 15:13:30 +0200
-Subject: [PATCH 2/2] gh-151981: Make tarfile._Stream.seek break at EOF
- (GH-151982)
-
-Co-authored-by: Stan Ulbrych <stan@python.org>
-
-CVE: CVE-2026-11972
-Upstream-Status: Backport [https://github.com/python/cpython/commit/f50bf13566189c8d0ce5a814f33eff3d89951896]
-
-Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
----
- Lib/tarfile.py           |  4 +++-
- Lib/test/test_tarfile.py | 16 ++++++++++++++++
- 2 files changed, 19 insertions(+), 1 deletion(-)
-
-diff --git a/Lib/tarfile.py b/Lib/tarfile.py
-index 63f23490e8a1..399f906efdff 100644
---- a/Lib/tarfile.py
-+++ b/Lib/tarfile.py
-@@ -524,7 +524,9 @@ def seek(self, pos=0):
-         if pos - self.pos >= 0:
-             blocks, remainder = divmod(pos - self.pos, self.bufsize)
-             for i in range(blocks):
--                self.read(self.bufsize)
-+                data = self.read(self.bufsize)
-+                if not data:
-+                    break
-             self.read(remainder)
-         else:
-             raise StreamError("seeking backwards is not allowed")
-diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
-index 0fc7413be8db..045377d620cc 100644
---- a/Lib/test/test_tarfile.py
-+++ b/Lib/test/test_tarfile.py
-@@ -4786,6 +4786,22 @@ def valueerror_filter(tarinfo, path):
-         with self.check_context(arc.open(errorlevel='boo!'), filtererror_filter):
-             self.expect_exception(TypeError)  # errorlevel is not int
-
-+    @support.subTests('format', [tarfile.GNU_FORMAT, tarfile.PAX_FORMAT])
-+    def test_getmembers_big_size(self, format):
-+        # gh-151981: A loop in seek() for streaming files tried to read the
-+        # declared number of blocks even at EOF
-+        tinfo = tarfile.TarInfo("huge-file")
-+        tinfo.size = 1 << 64
-+        bio = io.BytesIO()
-+        # Write header without data
-+        bio.write(tinfo.tobuf(format))
-+
-+        # Reset & try to get contents
-+        bio.seek(0)
-+        with tarfile.open(fileobj=bio, mode="r|") as tar:
-+            with self.assertRaises(tarfile.ReadError):
-+                tar.getmembers()
-+
-
- class OverwriteTests(archiver_tests.OverwriteTests, unittest.TestCase):
-     testdir = os.path.join(TEMPDIR, "testoverwrite")
---
-2.54.0
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index b29ea56cc34..248a521118c 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -1,4 +1,4 @@
-From 2b458b4e1bcd57e3f135d3f0e715f64b98b27906 Mon Sep 17 00:00:00 2001
+From b41557f570ff4451c477669d6ca5bfacabe21c66 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 13 Jul 2021 23:19:29 +0100
 Subject: [PATCH] python3: Fix make race
@@ -17,10 +17,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index be1b9ea..9ec3a71 100644
+index a7e536d..e946018 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2735,7 +2735,7 @@ COMPILEALL_OPTS=-j0
+@@ -2741,7 +2741,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3/valid-dists.patch b/meta/recipes-devtools/python/python3/valid-dists.patch
index 38b6ebc5cb1..7fe18254e50 100644
--- a/meta/recipes-devtools/python/python3/valid-dists.patch
+++ b/meta/recipes-devtools/python/python3/valid-dists.patch
@@ -1,4 +1,4 @@
-From a65c29adc027b3615154cab73aaedd58a6aa23da Mon Sep 17 00:00:00 2001
+From 66874ce1a9f21b4b00dc85919734d58e6243ca29 Mon Sep 17 00:00:00 2001
 From: "Jason R. Coombs" <jaraco@jaraco.com>
 Date: Tue, 23 Jul 2024 08:36:16 -0400
 Subject: [PATCH] Prioritize valid dists to invalid dists when retrieving by
diff --git a/meta/recipes-devtools/python/python3_3.14.6.bb b/meta/recipes-devtools/python/python3_3.14.7.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.14.6.bb
rename to meta/recipes-devtools/python/python3_3.14.7.bb
index 0a9e82d445f..b798f1c3697 100644
--- a/meta/recipes-devtools/python/python3_3.14.6.bb
+++ b/meta/recipes-devtools/python/python3_3.14.7.bb
@@ -35,14 +35,12 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Skip-flaky-test_default_timeout-tests.patch \
            file://0001-test_only_active_thread-skip-problematic-test.patch \
            file://0001-prefer-valid-entrypoints.patch \
-           file://CVE-2026-11940.patch \
-           file://CVE-2026-11972.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "143b1dddefaec3bd2e21e3b839b34a2b7fb9842272883c576420d605e9f30c63"
+SRC_URI[sha256sum] = "3b48dac8fb59f62eaa67ac83c1eb12bda1b7a08406dd286e252c11a66be27f81"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
@@ -532,5 +530,4 @@ py3_sysroot_cleanup () {
 	rm -rf ${SYSROOT_DESTDIR}${libdir}/python${PYTHON_MAJMIN}/test
 }
 
-CVE_STATUS[CVE-2026-6019] = "cpe-stable-backport: backported to v3.14.5"
-CVE_STATUS[CVE-2026-7210] = "cpe-stable-backport: backported to v3.14.6"
+

