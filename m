Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30294.1792962804641953461
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 14:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=kRDWCCR7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202610252113203d6d3c855f000207b3-oj79fj@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202610252113203d6d3c855f000207b3
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Oct 2026 22:13:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=qMaqlnJMlpMdnJ7jaBKEId1LNwDEs8PWCGBIPIG9kMw=;
 b=kRDWCCR7wPaMrV/33IzJBqOjPPKZh5HxI1RI+lrsVcQoZd4GxUHZdbR+cFOkNgZu6wcgMa
 Q0076sAPqSXXihNRy0UD2+npgLqhGT7VeJX2MtoQFW6k0mb9cFacFgQz37wTwhjFvzzV3mWg
 c5au5G6mNQbgHHAXtlsOj4LGI7SrBUotv/ZqEi+2xFMsaX6J6LihoMvt01NbveKPEJH6HiyT
 le94XPvHQ+n3N+OiqvMq1GZ43/nBK+t0MLKyE3UnwseL41KeZFFvMTgiuizr8bZZOsDYyEKg
 /khL12niagxX17FxWwrisqelmsIKq8SkLG4qdBavGI9xizT5haC/YCfA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH] python3: upgrade 3.12.15 -> 3.12.16
Date: Sun, 25 Oct 2026 22:13:02 +0100
Message-ID: <20261025211302.1904712-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 21:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248628
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

This is a security release of Python 3.12
Release information: [1]

This is an expedited security release to address the compromised eMudhra
intermediate CA keys. These keys are now blocked by the ssl module as a
last resort against their use.
Normal uses of pip, including to upgrade pip itself, are now safe from
attacks based on those compromised keys, even if pip hasn't been updated
yet.

Security content in this release
* CVE-2026-115557 gh-160040: Distrust compromised eMudhra intermediate CA keys
* CVE-2026-77214 CVE-2026-102633 gh-158876: Update bundled Expat to 2.9.0
* CVE-2024-3220 gh-159428: Don't read mimetypes.knownfiles by default on Windows
* CVE-2026-114583 gh-160097: Reject links replacing the destination in tarfile.tar_filter
* gh-87720: Fix additional header refolding-quoting edge case
* gh-157579: Fix race condition in the cleanup of tempfile.TemporaryDirectory
* gh-160300: Reject cookies with a negative version in http.cookiejar

[1] https://www.python.org/downloads/release/python-31216/

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../0001-Avoid-shebang-overflow-on-python-config.py.patch       | 2 +-
 ...1-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch | 2 +-
 ...1-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch | 2 +-
 .../0001-test_ctypes.test_find-skip-without-tools-sdk.patch     | 2 +-
 meta/recipes-devtools/python/python3/makerace.patch             | 2 +-
 .../python/{python3_3.12.15.bb => python3_3.12.16.bb}           | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.12.15.bb => python3_3.12.16.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index 6c8b1bf6cd9..3da1b60f3bd 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -19,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 2d235d2..1ac2263 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2361,6 +2361,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2366,6 +2366,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index 6066b26e38f..3cbde6c6cc5 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
@@ -13,7 +13,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 083f4c7..dce36a5 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -663,8 +663,7 @@ profile-run-stamp:
+@@ -665,8 +665,7 @@ profile-run-stamp:
  	# enabled.
  	$(MAKE) profile-gen-stamp
  	# Next, run the profile task to generate the profile information.
diff --git a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
index 5fdf5f4514e..3f59d824054 100644
--- a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
+++ b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
@@ -16,7 +16,7 @@ diff --git a/Lib/tarfile.py b/Lib/tarfile.py
 index 0a0f31e..4dfb67d 100755
 --- a/Lib/tarfile.py
 +++ b/Lib/tarfile.py
-@@ -2721,7 +2721,8 @@ class TarFile(object):
+@@ -2735,7 +2735,8 @@ class TarFile(object):
                      os.lchown(targetpath, u, g)
                  else:
                      os.chown(targetpath, u, g)
diff --git a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
index 307e4bf3069..d820e37e601 100644
--- a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
@@ -18,7 +18,7 @@ diff --git a/Lib/test/test_ctypes/test_find.py b/Lib/test/test_ctypes/test_find.
 index a41e949..eb5fe19 100644
 --- a/Lib/test/test_ctypes/test_find.py
 +++ b/Lib/test/test_ctypes/test_find.py
-@@ -113,10 +113,12 @@ class FindLibraryLinux(unittest.TestCase):
+@@ -133,10 +133,12 @@ class FindLibraryLinux(unittest.TestCase):
                  # LD_LIBRARY_PATH)
                  self.assertEqual(find_library(libname), 'lib%s.so' % libname)
  
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index 4575a30bfcf..4fcf6468762 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -20,7 +20,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index dce36a5..2d235d2 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2272,7 +2272,7 @@ COMPILEALL_OPTS=-j0
+@@ -2277,7 +2277,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3_3.12.15.bb b/meta/recipes-devtools/python/python3_3.12.16.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.12.15.bb
rename to meta/recipes-devtools/python/python3_3.12.16.bb
index 6c6289b0e69..9946bb075dd 100644
--- a/meta/recipes-devtools/python/python3_3.12.15.bb
+++ b/meta/recipes-devtools/python/python3_3.12.16.bb
@@ -42,7 +42,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "c2c4321961fab0fb999d66e0cecf521c2ab3994c7992873ea99e306c1094fd5a"
+SRC_URI[sha256sum] = "b5796915dc45ff745cfb4e990a7e7c93d6f546328a102ce31448d69ebc37575c"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
