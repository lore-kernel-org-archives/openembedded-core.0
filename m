Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E717CECD9B9
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 02:09:38 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2171.1770343776165580525
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 18:09:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BmsiEdRt;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770343776; x=1801879776;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vXLEhZeZi2A3M3uL6Q8mPAssfjAjQQr+WF64/Cf7Cpw=;
  b=BmsiEdRtDhgx9MPV261fjZHXQhfJfk/Us3Q4WA+O/MQvjJSSaArLnhHj
   8y/AN6v5H5f+zZPUb0sWNYih3TO2WnRazAMKZSD/1CvFH4jCOBa1XjGog
   dOaIjaaW5EbKYMiIDVAI9gsJkwyI4kk5bwltcmLxN7VGW2BVMsMD+n9Go
   XaXRR1A/h+rUNgCIy+NM+nyf99usA0WxkswOnMCn+UGfPNBfV5eaasF1X
   u52GDG5aDTswVL5I1J7FRRvT1jgcDLZ0MqDKjcpLnHBasxQYlHGcsmIa0
   ftAfx4HN8ylq0YN+p4xD3jX24QGQIPxU98USHQW9UF/BKWEDaxXtwJkjd
   g==;
X-CSE-ConnectionGUID: 67f3Tjp4RnmDtjtkxp8/Zw==
X-CSE-MsgGUID: qHbuM2Y+T1OxEENX8D8dXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="232825809"
X-IronPort-AV: E=Sophos;i="6.21,275,1763391600"; 
   d="scan'208";a="232825809"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 11:09:28 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id E0AC51C00182
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Feb 2026 02:09:27 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 92FCD1C1728B
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Feb 2026 02:09:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 0D60E180A593;
	Fri,  6 Feb 2026 02:09:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-cffi: Make test_parsing more resilient to changes in pycparser
Date: Fri,  6 Feb 2026 10:09:21 +0800
Message-ID: <20260206020921.1394-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 02:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230591

From: Wang Mingyu <wangmy@fujitsu.com>

Add patch 0001-Make-test_parsing-more-resilient-to-changes-in.patch to fix ptest error when python3-pycparser updated to 3.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...parsing-more-resilient-to-changes-in.patch | 110 ++++++++++++++++++
 .../python/python3-cffi_2.0.0.bb              |   3 +-
 2 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-cffi/0001-Make-test_parsing-more-resilient-to-changes-in.patch

diff --git a/meta/recipes-devtools/python/python3-cffi/0001-Make-test_parsing-more-resilient-to-changes-in.patch b/meta/recipes-devtools/python/python3-cffi/0001-Make-test_parsing-more-resilient-to-changes-in.patch
new file mode 100644
index 0000000000..2919b78a6e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cffi/0001-Make-test_parsing-more-resilient-to-changes-in.patch
@@ -0,0 +1,110 @@
+From 6f345f658a7012bca0859d23436a11b9902711ae Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Fri, 6 Feb 2026 01:53:23 +0000
+Subject: [PATCH] Make test_parsing more resilient to changes in
+ pycparser  (#224)
+
+* Make test_parsing more resilient to changes in pycparser
+
+Several tests expect precise error messages from pycparser, which pycparser
+doesn't guarantee. While testing CFFI with pycparser 3.0, some tests needed
+to be made more resilient. I've used the .startswith() approach already used
+in this file, instead of exact string matching.
+
+Ref #223
+
+* Loosen error message assertion even more
+
+Upstream-Status: Backport [https://github.com/python-cffi/cffi/commit/c36c02fa6f4f1d12a9cead81861c6f42af47da22]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ testing/cffi0/test_parsing.py | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/testing/cffi0/test_parsing.py b/testing/cffi0/test_parsing.py
+index f10b989..7009e34 100644
+--- a/testing/cffi0/test_parsing.py
++++ b/testing/cffi0/test_parsing.py
+@@ -197,7 +197,7 @@ def test_dont_remove_comment_in_line_directives():
+ 
+         some syntax error here
+     """)
+-    assert str(e.value) == "parse error\nbaz.c:9:14: before: syntax"
++    assert str(e.value).startswith("parse error\nbaz.c:9:")
+     #
+     e = pytest.raises(CDefError, ffi.cdef, """
+         #line 7 "foo//bar.c"
+@@ -205,21 +205,21 @@ def test_dont_remove_comment_in_line_directives():
+         some syntax error here
+     """)
+     #
+-    assert str(e.value) == "parse error\nfoo//bar.c:8:14: before: syntax"
++    assert str(e.value).startswith("parse error\nfoo//bar.c:8:")
+     ffi = FFI(backend=FakeBackend())
+     e = pytest.raises(CDefError, ffi.cdef, """
+         \t # \t 8 \t "baz.c" \t
+ 
+         some syntax error here
+     """)
+-    assert str(e.value) == "parse error\nbaz.c:9:14: before: syntax"
++    assert str(e.value).startswith("parse error\nbaz.c:9:")
+     #
+     e = pytest.raises(CDefError, ffi.cdef, """
+         # 7 "foo//bar.c"
+ 
+         some syntax error here
+     """)
+-    assert str(e.value) == "parse error\nfoo//bar.c:8:14: before: syntax"
++    assert str(e.value).startswith("parse error\nfoo//bar.c:8:")
+ 
+ def test_multiple_line_directives():
+     ffi = FFI(backend=FakeBackend())
+@@ -233,7 +233,7 @@ def test_multiple_line_directives():
+         #line 8 "yadda.c"
+         extern int zz;
+     """)
+-    assert str(e.value) == "parse error\nbaz.c:7:14: before: syntax"
++    assert str(e.value).startswith("parse error\nbaz.c:7:")
+     #
+     e = pytest.raises(CDefError, ffi.cdef,
+     """ # 5 "foo.c"
+@@ -245,7 +245,7 @@ def test_multiple_line_directives():
+         # 8 "yadda.c"
+         extern int zz;
+     """)
+-    assert str(e.value) == "parse error\nbaz.c:7:14: before: syntax"
++    assert str(e.value).startswith("parse error\nbaz.c:7:")
+ 
+ def test_commented_line_directive():
+     ffi = FFI(backend=FakeBackend())
+@@ -262,7 +262,7 @@ def test_commented_line_directive():
+         some syntax error
+     """)
+     #
+-    assert str(e.value) == "parse error\nbar.c:9:14: before: syntax"
++    assert str(e.value).startswith("parse error\nbar.c:9:")
+     e = pytest.raises(CDefError, ffi.cdef, """
+         /*
+         # 5 "foo.c"
+@@ -275,7 +275,7 @@ def test_commented_line_directive():
+         */
+         some syntax error
+     """)
+-    assert str(e.value) == "parse error\nbar.c:9:14: before: syntax"
++    assert str(e.value).startswith("parse error\nbar.c:9:")
+ 
+ def test_line_continuation_in_defines():
+     ffi = FFI(backend=FakeBackend())
+@@ -365,7 +365,7 @@ def test_unknown_name():
+     e = pytest.raises(CDefError, ffi.cast, "foobarbazunknown*", 0)
+     assert str(e.value).startswith('cannot parse "foobarbazunknown*"')
+     e = pytest.raises(CDefError, ffi.cast, "int(*)(foobarbazunknown)", 0)
+-    assert str(e.value).startswith('cannot parse "int(*)(foobarbazunknown)"')
++    assert 'foobarbazunknown' in str(e.value)
+ 
+ def test_redefine_common_type():
+     prefix = "" if sys.version_info < (3,) else "b"
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/python/python3-cffi_2.0.0.bb b/meta/recipes-devtools/python/python3-cffi_2.0.0.bb
index 9bfc430dde..269595f5c3 100644
--- a/meta/recipes-devtools/python/python3-cffi_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-cffi_2.0.0.bb
@@ -6,7 +6,8 @@ DEPENDS += "libffi python3-pycparser"
 
 SRC_URI[sha256sum] = "44d1b5909021139fe36001ae048dbdde8214afa20200eda0f64c068cac5d5529"
 
-SRC_URI += "file://run-ptest"
+SRC_URI += "file://run-ptest \
+            file://0001-Make-test_parsing-more-resilient-to-changes-in.patch"
 
 inherit pypi python_setuptools_build_meta ptest pkgconfig
 
-- 
2.43.0


