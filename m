Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD75C3DA63
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 08:28:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.39563.1721723305361809666
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 01:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58D7F139F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 01:28:50 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 927D33F766
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 01:28:24 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Revert "python3: drop deterministic_imports.patch"
Date: Tue, 23 Jul 2024 09:28:12 +0100
Message-Id: <20240723082812.1488379-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 08:28:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202333

There are still issues with importlib.metadata and empty directories,
which surface when doing builds with existing build trees.

I've raised this on the upstream ticket that Alex Kanavin has already
filed[1] so hopefully we can have a resolution soon.

This reverts commit 058c3a6e2b30103202f3995930825fc2f366274f.

[1] https://github.com/python/importlib_metadata/issues/489

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python3/deterministic_imports.patch       | 40 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.12.4.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/deterministic_im=
ports.patch

diff --git a/meta/recipes-devtools/python/python3/deterministic_imports.p=
atch b/meta/recipes-devtools/python/python3/deterministic_imports.patch
new file mode 100644
index 00000000000..2de6ae2e981
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/deterministic_imports.patch
@@ -0,0 +1,40 @@
+From 039d5e652796b55f1132afa568c7432b6ed89afd Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Fri, 27 May 2022 17:05:44 +0100
+Subject: [PATCH] python3: Ensure stale empty python module directories d=
on't
+
+There are two issues here. Firstly, the modules are accessed in on disk =
order. This
+means behaviour seen on one system might not reproduce on another and is=
 a real headache.
+
+Secondly, empty directories left behind by previous modules might be loo=
ked at. This
+has caused a long string of different issues for us.
+
+As a result, patch this to a behaviour which works for us.
+
+Upstream-Status: Submitted [https://github.com/python/cpython/issues/120=
492; need to first talk to upstream to see if they'll take one or both fi=
xes]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+---
+ Lib/importlib/metadata/__init__.py | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/Lib/importlib/metadata/__init__.py b/Lib/importlib/metadata=
/__init__.py
+index 82e0ce1..969cac4 100644
+--- a/Lib/importlib/metadata/__init__.py
++++ b/Lib/importlib/metadata/__init__.py
+@@ -710,7 +710,14 @@ class Lookup:
+         self.infos =3D FreezableDefaultDict(list)
+         self.eggs =3D FreezableDefaultDict(list)
+=20
+-        for child in path.children():
++        for child in sorted(path.children()):
++            childpath =3D pathlib.Path(path.root, child)
++            try:
++                if childpath.is_dir() and not any(childpath.iterdir()):
++                    # Empty directories aren't interesting
++                    continue
++            except PermissionError:
++                continue
+             low =3D child.lower()
+             if low.endswith((".dist-info", ".egg-info")):
+                 # rpartition is faster than splitext and suitable for t=
his purpose.
diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipe=
s-devtools/python/python3_3.12.4.bb
index 743ba0b1f1f..119fe10ca93 100644
--- a/meta/recipes-devtools/python/python3_3.12.4.bb
+++ b/meta/recipes-devtools/python/python3_3.12.4.bb
@@ -24,6 +24,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
            file://makerace.patch \
            file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patc=
h \
            file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-ma=
ste.patch \
+           file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch =
\
            file://0001-Update-test_sysconfig-for-posix_user-purelib.patc=
h \
            file://0001-skip-no_stdout_fileno-test-due-to-load-variabilit=
y.patch \
--=20
2.34.1


