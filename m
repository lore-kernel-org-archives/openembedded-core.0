Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E60DC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 11:40:45 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6247.1783510835759844410
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 04:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=boP50G55;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b6f1b14bso2386425e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 04:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783510834; x=1784115634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OxwFk2mu8HFGyfBVBg7csO1Xrpjk24nUSnHwp8bBQMo=;
        b=boP50G55R95Tyexl47Nwe5rghmR/5XewpALuLphg7tMQowRFHAuz8yJHQV97e7z3st
         K5NKxUZs5s/hTnLja1Dx2tOsXKcQxk41j9/ib8tcQmgtAhpyGU1P0cJj001i3xtFKMY8
         bDNziLJcwUykzq3QPeFqNZIBgz/vXrnaoAzKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510834; x=1784115634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OxwFk2mu8HFGyfBVBg7csO1Xrpjk24nUSnHwp8bBQMo=;
        b=ntLy8gJLZRO3PZfVgVXxaq/1HzzcXUNgXiMHPjn4PthFwO/CeCyr338kiUsgYqhBtS
         j3ZMz2S0iNzhg5QgjhlOpGt/lXNB3DBvsxHCCs1tI5xLtVbjx2X0slWpuusZKRP7GCBQ
         qw3fy3SS7u/b37hBA59C+kVOFmTmtVpw4RbJv4Eg8U6dXKi+keSZBBRNWLBkw6AuC+xz
         Ib5uOkpAHiIdFlAjUPUMooswtB2xiCQetJj3goUoh5cZB5wuoqYlZhMc5vYLfDUKtJSq
         F4ckCZ1DVSuXlUISUoIwAJwHIKNuSVRB21ZWZAvdIdFdAYC0XDKSZyrXEq6QeuHRwwq7
         s9Jg==
X-Gm-Message-State: AOJu0YzuYOiP5jSIZwxqq4W/nROm0c60LoQ3hjpiYHezMujlhwhG0Yih
	98mUhdSTFSXWhZnCmCVQWAKX3RUxiqzJ+kqxLeVFpe+ZxidqXRrbYcsx0cxxX2QfhAJ2eFvD6hQ
	eZVe0E6M=
X-Gm-Gg: AfdE7cn0fX9tK9pDzejB7JdiJ53zdT6JQgKc+B4rMfD/W2+dfZ7UpTjsXzHlhS+KRP9
	7002quIpvrKkQjIgYR9WIYVnycbaLnNU/IrFHzbS8a4CSEEsr0A5gVOL2gLWDSFmBL0uXntq0eF
	diCQb43Im1VCPbn4MrzpFKGmimIbVziVxzG6W8YgqGK0Ossd8FcXV5SJ2ob55Wcn5F/Ky58UeF5
	SFt5zWaETyAG82QKT7Wi+R3T/abacfYssJpGGhrlc2HHY0v0hWkiQdfJKQM6PQt0IzjkGJ2gTmb
	+nMI7nnpyAtCEVFz3GB56YBMTyHCvWUPJT9Hl0xGC92Ll0SKSNlv55j/5+2oZvSEoVuVblCDytw
	Z4GfkfmUtNqynMjQEvqOzaCHtYFt13uCnSb+XAxtFHsz3KCsT8xUgUb5UT2JZQEDvhrgFmiu9iA
	srsrrjDhoY1pxjCQfP1s4TPAEqHF5thxi4UAHeAw3iWQ==
X-Received: by 2002:a05:600c:8486:b0:493:e365:7630 with SMTP id 5b1f17b1804b1-493e6844d66mr27875725e9.14.1783510833955;
        Wed, 08 Jul 2026 04:40:33 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b60a:b356:19ef:1131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f51193sm131183165e9.12.2026.07.08.04.40.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:40:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/11] python3-cffi: upgrade 2.0.0 -> 2.1.0
Date: Wed,  8 Jul 2026 12:40:20 +0100
Message-ID: <20260708114021.3484868-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260708114021.3484868-1-richard.purdie@linuxfoundation.org>
References: <20260708114021.3484868-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 11:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240473

Drop backported patch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...parsing-more-resilient-to-changes-in.patch | 110 ------------------
 ...n3-cffi_2.0.0.bb => python3-cffi_2.1.0.bb} |   5 +-
 2 files changed, 2 insertions(+), 113 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-cffi/0001-Make-test_parsing-more-resilient-to-changes-in.patch
 rename meta/recipes-devtools/python/{python3-cffi_2.0.0.bb => python3-cffi_2.1.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-cffi/0001-Make-test_parsing-more-resilient-to-changes-in.patch b/meta/recipes-devtools/python/python3-cffi/0001-Make-test_parsing-more-resilient-to-changes-in.patch
deleted file mode 100644
index 2919b78a6ef..00000000000
--- a/meta/recipes-devtools/python/python3-cffi/0001-Make-test_parsing-more-resilient-to-changes-in.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 6f345f658a7012bca0859d23436a11b9902711ae Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Fri, 6 Feb 2026 01:53:23 +0000
-Subject: [PATCH] Make test_parsing more resilient to changes in
- pycparser  (#224)
-
-* Make test_parsing more resilient to changes in pycparser
-
-Several tests expect precise error messages from pycparser, which pycparser
-doesn't guarantee. While testing CFFI with pycparser 3.0, some tests needed
-to be made more resilient. I've used the .startswith() approach already used
-in this file, instead of exact string matching.
-
-Ref #223
-
-* Loosen error message assertion even more
-
-Upstream-Status: Backport [https://github.com/python-cffi/cffi/commit/c36c02fa6f4f1d12a9cead81861c6f42af47da22]
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- testing/cffi0/test_parsing.py | 18 +++++++++---------
- 1 file changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/testing/cffi0/test_parsing.py b/testing/cffi0/test_parsing.py
-index f10b989..7009e34 100644
---- a/testing/cffi0/test_parsing.py
-+++ b/testing/cffi0/test_parsing.py
-@@ -197,7 +197,7 @@ def test_dont_remove_comment_in_line_directives():
- 
-         some syntax error here
-     """)
--    assert str(e.value) == "parse error\nbaz.c:9:14: before: syntax"
-+    assert str(e.value).startswith("parse error\nbaz.c:9:")
-     #
-     e = pytest.raises(CDefError, ffi.cdef, """
-         #line 7 "foo//bar.c"
-@@ -205,21 +205,21 @@ def test_dont_remove_comment_in_line_directives():
-         some syntax error here
-     """)
-     #
--    assert str(e.value) == "parse error\nfoo//bar.c:8:14: before: syntax"
-+    assert str(e.value).startswith("parse error\nfoo//bar.c:8:")
-     ffi = FFI(backend=FakeBackend())
-     e = pytest.raises(CDefError, ffi.cdef, """
-         \t # \t 8 \t "baz.c" \t
- 
-         some syntax error here
-     """)
--    assert str(e.value) == "parse error\nbaz.c:9:14: before: syntax"
-+    assert str(e.value).startswith("parse error\nbaz.c:9:")
-     #
-     e = pytest.raises(CDefError, ffi.cdef, """
-         # 7 "foo//bar.c"
- 
-         some syntax error here
-     """)
--    assert str(e.value) == "parse error\nfoo//bar.c:8:14: before: syntax"
-+    assert str(e.value).startswith("parse error\nfoo//bar.c:8:")
- 
- def test_multiple_line_directives():
-     ffi = FFI(backend=FakeBackend())
-@@ -233,7 +233,7 @@ def test_multiple_line_directives():
-         #line 8 "yadda.c"
-         extern int zz;
-     """)
--    assert str(e.value) == "parse error\nbaz.c:7:14: before: syntax"
-+    assert str(e.value).startswith("parse error\nbaz.c:7:")
-     #
-     e = pytest.raises(CDefError, ffi.cdef,
-     """ # 5 "foo.c"
-@@ -245,7 +245,7 @@ def test_multiple_line_directives():
-         # 8 "yadda.c"
-         extern int zz;
-     """)
--    assert str(e.value) == "parse error\nbaz.c:7:14: before: syntax"
-+    assert str(e.value).startswith("parse error\nbaz.c:7:")
- 
- def test_commented_line_directive():
-     ffi = FFI(backend=FakeBackend())
-@@ -262,7 +262,7 @@ def test_commented_line_directive():
-         some syntax error
-     """)
-     #
--    assert str(e.value) == "parse error\nbar.c:9:14: before: syntax"
-+    assert str(e.value).startswith("parse error\nbar.c:9:")
-     e = pytest.raises(CDefError, ffi.cdef, """
-         /*
-         # 5 "foo.c"
-@@ -275,7 +275,7 @@ def test_commented_line_directive():
-         */
-         some syntax error
-     """)
--    assert str(e.value) == "parse error\nbar.c:9:14: before: syntax"
-+    assert str(e.value).startswith("parse error\nbar.c:9:")
- 
- def test_line_continuation_in_defines():
-     ffi = FFI(backend=FakeBackend())
-@@ -365,7 +365,7 @@ def test_unknown_name():
-     e = pytest.raises(CDefError, ffi.cast, "foobarbazunknown*", 0)
-     assert str(e.value).startswith('cannot parse "foobarbazunknown*"')
-     e = pytest.raises(CDefError, ffi.cast, "int(*)(foobarbazunknown)", 0)
--    assert str(e.value).startswith('cannot parse "int(*)(foobarbazunknown)"')
-+    assert 'foobarbazunknown' in str(e.value)
- 
- def test_redefine_common_type():
-     prefix = "" if sys.version_info < (3,) else "b"
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/python/python3-cffi_2.0.0.bb b/meta/recipes-devtools/python/python3-cffi_2.1.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-cffi_2.0.0.bb
rename to meta/recipes-devtools/python/python3-cffi_2.1.0.bb
index 269595f5c3f..718e43e3399 100644
--- a/meta/recipes-devtools/python/python3-cffi_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-cffi_2.1.0.bb
@@ -4,10 +4,9 @@ LICENSE = "MIT-0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c0158ab9b75875f3bb7fea081d388818"
 DEPENDS += "libffi python3-pycparser"
 
-SRC_URI[sha256sum] = "44d1b5909021139fe36001ae048dbdde8214afa20200eda0f64c068cac5d5529"
+SRC_URI[sha256sum] = "efc1cdd798b1aaf39b4610bba7aad28c9bea9b910f25c784ccf9ec1fa719d1f9"
 
-SRC_URI += "file://run-ptest \
-            file://0001-Make-test_parsing-more-resilient-to-changes-in.patch"
+SRC_URI += "file://run-ptest"
 
 inherit pypi python_setuptools_build_meta ptest pkgconfig
 

