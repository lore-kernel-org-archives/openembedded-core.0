Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF15C79FAC
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:17 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35226.1788788168056862977
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CSvyBHdQ;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-484374f54d0so2179799f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788166; x=1789392966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HMbHLFqC3ycXDimUwLrfX4/0UdR/L1eJNTjUnLxKvJQ=;
        b=CSvyBHdQJ9PC563W6uayX0b5cWh1Hz0P43eu0+sqH+MGqT5tXzsL1upxJHT3xQc2PX
         M/8baz3y7RKGLXziOSHXmGqWwkQEZtFWdem6lMFtT9j5BydpDCtXwwSXawB+vfIBa4cf
         87EQ0QLTGY/Kd9magKOhbxT0MLCi+GcpXCDUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788166; x=1789392966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HMbHLFqC3ycXDimUwLrfX4/0UdR/L1eJNTjUnLxKvJQ=;
        b=pM7A/qvwfdJ/UNfgCXthA9BpXqQxpyxLAhKKAzOnae45TS3m6pSx1QnbPj10VKXqWa
         onwxqUHPLVWYM+WhTJENjZvtAhFYKhDRqSEt4B6GJgJNMBYFHHm1nrVSHkRchZPvEZi+
         oz9Q02oUsx5dRy2lrjunHvhDAr4w4Pfd1rlVvRFEoMjEsyrkWVi/FqRXyE9NUtF9me3G
         3axJsaTE/B45g5hw9ds32wovapMW4ZXKoKYL5d3L1GpZvdT9YBjoJlRLZGG9bWzVuRtO
         jbwNgFi1CpQrZTiQmAv1xXq7FBlW116VzxZq2fbDq48ofokUYh/py8bd08iEqxiB6vL3
         9LYA==
X-Gm-Message-State: AFuF++mbwI1zFKB4Xxu6eNsdP8hvvn7O1YWsqNV0SD2uGgtZLweE8Cd/
	y3JA2LJ7f/xmRlaXIFVzYqBd4tv2GIvZ9GEqq7xDd5VdyVibevUEEMdhmLCbfdJE55FC66e4ILc
	RddYT3Ic=
X-Gm-Gg: AYBFou1L73Jx1IdpkIBYB9XOPvb55b16uOkyYfnStNYWZ3dvD+vEWZWJ3csFkKY7ORq
	kvcT3jz+AzJISKBSe+iu9vGDC2HqvV/PZpbmnfjnxsWuKAtk5KIw/mrrSCx0I3fTLHnPfAt97qY
	QaUZ7b+tBCRuI9UxnfdXWgnVdm7sFU8b7ewrtzhouyB4D4kJCYdrH4HO7UwXF73XRIg9PCRVafH
	mo/9kJTLgPcltC23T/sniWfAFQ+AIR6o0bZGa5yLNcyyCWko3HX9Hrv83HlwUm5N5upvGc5jzbC
	LkB35edPWdjCn4GwyUBbmWsS5szngC9JGtF0BNDHliABgCU8qjQcTUf0sXhavtdEsUqmTYd5Rnc
	pB4fmeqaH0HyDmBYS147B7fIRqLW5/F0RcY6ise9rf+SIUFgnw82Rf9UMXNHaS6OAx23ryYbMHm
	SlF3k+VMZCkWb0+5cOZioN3dMP3B2Gt4X/nSnjuBZiDTvE/S2mT3jnv1pFAhEsTgHL7ygVAL+eg
	lAiswjyZtyE83JVeUdT7C3Ud5iKx1s4L8wMYKd71PMu7XDEZaFLY6nOTUTT+9gJ
X-Received: by 2002:a05:6000:26c4:b0:485:847c:4c64 with SMTP id ffacd0b85a97d-4858729b6f7mr42772763f8f.28.1788788166240;
        Mon, 07 Sep 2026 06:36:06 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.36.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:36:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 28/35] python3-mako: Fix CVE-2026-41205
Date: Mon,  7 Sep 2026 15:35:24 +0200
Message-ID: <0c13fdc7798a24dadb60b7dba60049558bf5c021.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245285

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using
the commit shown in [1].

The backport makes Template URI normalization strip all leading
slashes, preventing a double-slash URI from bypassing the path
traversal check while keeping Mako at version 1.3.2.

[1] https://github.com/sqlalchemy/mako/commit/e05ac61989a7fb9dd7dcde6cfd72dc48328719a3
[2] https://github.com/advisories/GHSA-v92g-xgxw-vvmm

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3-mako/CVE-2026-41205.patch  | 110 ++++++++++++++++++
 .../python/python3-mako_1.3.2.bb              |   2 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-mako/CVE-2026-41205.patch

diff --git a/meta/recipes-devtools/python/python3-mako/CVE-2026-41205.patch b/meta/recipes-devtools/python/python3-mako/CVE-2026-41205.patch
new file mode 100644
index 00000000000..0699654b532
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-mako/CVE-2026-41205.patch
@@ -0,0 +1,110 @@
+From e05ac61989a7fb9dd7dcde6cfd72dc48328719a3 Mon Sep 17 00:00:00 2001
+From: Mike Bayer <mike_mp@zzzcomputing.com>
+Date: Tue, 14 Apr 2026 15:45:19 -0400
+Subject: [PATCH] Fix path traversal via double-slash URI prefix in
+ TemplateLookup
+
+The URI normalization in Template.__init__ stripped only a single
+leading slash, while TemplateLookup.get_template() stripped all
+leading slashes. A URI such as "//../../secret.txt" could bypass
+the directory traversal check.  Changed to use lstrip("/") so
+both code paths handle leading slashes consistently.
+
+Fixes: #434
+Change-Id: I400b9a40aed956cc2b5826a9c8736f104e84f1a4
+
+CVE: CVE-2026-41205
+Upstream-Status: Backport [https://github.com/sqlalchemy/mako/commit/e05ac61989a7fb9dd7dcde6cfd72dc48328719a3]
+
+(cherry picked from commit e05ac61989a7fb9dd7dcde6cfd72dc48328719a3)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ doc/build/unreleased/434.rst | 10 +++++++++
+ mako/template.py             |  4 +---
+ test/test_lookup.py          | 41 ++++++++++++++++++++++++++++++++++++
+ 3 files changed, 52 insertions(+), 3 deletions(-)
+ create mode 100644 doc/build/unreleased/434.rst
+
+diff --git a/doc/build/unreleased/434.rst b/doc/build/unreleased/434.rst
+new file mode 100644
+index 00000000..452265ad
+--- /dev/null
++++ b/doc/build/unreleased/434.rst
+@@ -0,0 +1,10 @@
++.. change::
++    :tags: bug, template
++    :tickets: 434
++
++    Fixed issue in :class:`.TemplateLookup` where a URI with a double-slash
++    prefix (e.g. ``//../../``) could bypass the directory traversal check in
++    :class:`.Template`, allowing reads of arbitrary files outside of the
++    template directory. The issue was caused by an inconsistency in how leading
++    slashes were stripped between :meth:`.TemplateLookup.get_template` and
++    :class:`.Template` initialization.
+diff --git a/mako/template.py b/mako/template.py
+index 82c7cba8..d8ebc949 100644
+--- a/mako/template.py
++++ b/mako/template.py
+@@ -259,9 +259,7 @@ def __init__(
+             self.module_id = "memory:" + hex(id(self))
+             self.uri = self.module_id
+ 
+-        u_norm = self.uri
+-        if u_norm.startswith("/"):
+-            u_norm = u_norm[1:]
++        u_norm = self.uri.lstrip("/")
+         u_norm = os.path.normpath(u_norm)
+         if u_norm.startswith(".."):
+             raise exceptions.TemplateLookupException(
+diff --git a/test/test_lookup.py b/test/test_lookup.py
+index 6a797d7a..2f7cdf0b 100644
+--- a/test/test_lookup.py
++++ b/test/test_lookup.py
+@@ -127,6 +127,47 @@ def test_dont_accept_relative_outside_of_root(self):
+         # this is OK since the .. cancels out
+         runtime._lookup_template(ctx, "foo/../index.html", index.uri)
+ 
++    def test_dont_accept_relative_outside_of_root_via_double_slash(self):
++        """test that double-slash URI prefix can't bypass the
++        path traversal check"""
++        with tempfile.TemporaryDirectory() as base:
++            tmpl_dir = os.path.join(base, "app", "templates")
++            os.makedirs(tmpl_dir)
++            with open(os.path.join(tmpl_dir, "index.html"), "w") as f:
++                f.write("Hello")
++
++            secret = os.path.join(base, "secrets", "creds.txt")
++            os.makedirs(os.path.dirname(secret))
++            with open(secret, "w") as f:
++                f.write("SECRET_KEY=supersecret123")
++
++            tl = lookup.TemplateLookup(directories=[tmpl_dir])
++            rel = os.path.relpath(secret, tmpl_dir)
++
++            # single-slash prefix should also be blocked
++            assert_raises_message(
++                exceptions.TemplateLookupException,
++                "cannot be relative outside of the root path",
++                tl.get_template,
++                "/" + rel,
++            )
++
++            # double-slash prefix must not bypass the check
++            assert_raises_message(
++                exceptions.TemplateLookupException,
++                "cannot be relative outside of the root path",
++                tl.get_template,
++                "//" + rel,
++            )
++
++            # triple-slash prefix must not bypass the check
++            assert_raises_message(
++                exceptions.TemplateLookupException,
++                "cannot be relative outside of the root path",
++                tl.get_template,
++                "///" + rel,
++            )
++
+     def test_checking_against_bad_filetype(self):
+         with tempfile.TemporaryDirectory() as tempdir:
+             tl = lookup.TemplateLookup(directories=[tempdir])
diff --git a/meta/recipes-devtools/python/python3-mako_1.3.2.bb b/meta/recipes-devtools/python/python3-mako_1.3.2.bb
index 5b7df9192f8..617bf33443c 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.2.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.2.bb
@@ -8,6 +8,8 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi python_setuptools_build_meta
 
+SRC_URI += "file://CVE-2026-41205.patch \
+            "
 SRC_URI[sha256sum] = "2a0c8ad7f6274271b3bb7467dd37cf9cc6dab4bc19cb69a4ef10669402de698e"
 
 RDEPENDS:${PN} = "python3-html \

