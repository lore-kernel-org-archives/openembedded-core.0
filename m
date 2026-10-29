Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17237.1793294324146524933
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 10:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=pq0YbxxO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202610291718424c088e2392000207af-aae3wr@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202610291718424c088e2392000207af
        for <openembedded-core@lists.openembedded.org>;
        Thu, 29 Oct 2026 18:18:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=JZnRBASAhBbx4oWeT9RXQeJILMmQFH2WhIpEO6fZvDU=;
 b=pq0YbxxOa9tI2hTcrtx9bvRHl/93jsQHpo0o+EHavzxl1imt3kCBJgNOgkvhgcFvKoztIJ
 sjg3I35oN+dUs1nNhF/FOLALfRRkO4vqf2I+p2s5/pbQsHO0urkGaxJ2F4CHoDSCFawCo2Dr
 tHcSxJpysNbPOwiKoDQzoiaG7w9okpwIdPfyeU2Gj1or4KzrrxJ6Ninj1zxmv/uNlqlAkFqx
 5ZTdX854wR1DLUHk7nJe22nsgOn1usNfN11HLolwfWjHK/GXLmXDmXOoXQR4hd6dCm+rX9Kv
 5QNchNkZcVHMocr4URHPkYTXDisYE8VAP9d8ZjQndiTxQkZMxPLu5g9g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 1/4] python3: upgrade 3.14.7 -> 3.14.9
Date: Thu, 29 Oct 2026 18:18:10 +0100
Message-ID: <20261029171813.2842605-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 17:18:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248965
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

The release notes are long[1] but the highlight is upgrading the bundled
pip wheel to 26.2.2, as pip bundles certifi which needed upgrading due
to the eMudhra intermediate CA compromise.

[1] https://docs.python.org/release/3.14.9/whatsnew/changelog.html
[2] https://emudhra.we-have-a-problem.com

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 526baf80188308bc1e65b09ccb41186772cd6336)
Dropped parts updating patches for openssl-4 or ptests.
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../0001-Avoid-shebang-overflow-on-python-config.py.patch       | 2 +-
 ...1-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch | 2 +-
 ...1-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch | 2 +-
 meta/recipes-devtools/python/python3/makerace.patch             | 2 +-
 .../python/{python3_3.14.7.bb => python3_3.14.9.bb}             | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.14.7.bb => python3_3.14.9.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index 7a60538364..7cacaf0ff3 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -19,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index e946018..345ed29 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2835,6 +2835,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2839,6 +2839,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index 60391e726b..580d38a403 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -21,7 +21,7 @@ diff --git a/Lib/sysconfig/__init__.py b/Lib/sysconfig/__init__.py
 index 0a8bcc0..a2341f2 100644
 --- a/Lib/sysconfig/__init__.py
 +++ b/Lib/sysconfig/__init__.py
-@@ -538,12 +538,12 @@ def _init_config_vars():
+@@ -539,12 +539,12 @@ def _init_config_vars():
      _CONFIG_VARS['py_version'] = _PY_VERSION
      _CONFIG_VARS['py_version_short'] = _PY_VERSION_SHORT
      _CONFIG_VARS['py_version_nodot'] = _PY_VERSION_SHORT_NO_DOT
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index c7f14cad1e..4e41b04a3b 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
@@ -18,7 +18,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 526d500..a7e536d 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -861,8 +861,7 @@ profile-run-stamp:
+@@ -863,8 +863,7 @@ profile-run-stamp:
  	# enabled.
  	$(MAKE) profile-gen-stamp
  	# Next, run the profile task to generate the profile information.
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index 248a521118..b589dfb346 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -20,7 +20,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index a7e536d..e946018 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2741,7 +2741,7 @@ COMPILEALL_OPTS=-j0
+@@ -2745,7 +2745,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb b/meta/recipes-devtools/python/python3_3.14.9.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.14.7.bb
rename to meta/recipes-devtools/python/python3_3.14.9.bb
index e73dc8d772..2a5279480b 100644
--- a/meta/recipes-devtools/python/python3_3.14.7.bb
+++ b/meta/recipes-devtools/python/python3_3.14.9.bb
@@ -40,7 +40,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "3b48dac8fb59f62eaa67ac83c1eb12bda1b7a08406dd286e252c11a66be27f81"
+SRC_URI[sha256sum] = "e02d9ac21cebda6e46435369744a92c65cc7cd8669697694122cf97ffacd1e53"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
