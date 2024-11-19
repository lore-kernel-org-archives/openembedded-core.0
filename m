Return-Path: <victor.kamensky7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB30FD60D1F
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 05:03:57 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.14040.1731992628673402204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 21:03:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QyT2oIQ0;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: victor.kamensky7@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7206304f93aso2138084b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731992627; x=1732597427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=62iht0gCiYeWypHpAsaV6Q5pngVrRscW29tfV/HBC78=;
        b=QyT2oIQ01+opF8KKDvGYz/S60947ZGeT7a+0LFkubCypnv+rRkK3/RV9Kx6/Bk63mi
         R/7H5PClS+LDqhQsSymWlP363vve9oaLMpAR4QXYZoPRY/C4NQdrG4EQ6nl6cBZMx/Q0
         tIaPXX6bgDr/piNMmQ0ta5yFSABiEsRiQ/10tf9UQdTMXVp0gsOVqlSj/N7bbZaItlJb
         UQ8iw2C/n8FBu41cB5m0YiYJn3mG4hdOZJb2r+z91BvpcEuAm0d/2eGUdMQ3SIAkbFQE
         3JTY4wnTca7Ixa9a5mZW0OImDjwylhi9xEQDaJKgdHK2h7hcd81R5OFja7npUnyhHBQx
         khlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731992627; x=1732597427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=62iht0gCiYeWypHpAsaV6Q5pngVrRscW29tfV/HBC78=;
        b=cNRwZudlcIi+IBQZ9CfGPNMkAkzYzHjBnCq3kc8PJnZa0GY3gEpb3VLXJ7YqAdCf+0
         HUtuQ1rHQORflmAv4L9+SjlG3HrFa/uLCbNubX48Xwvo4TvFcp6/GVWaC/G+LRmb/FXk
         FYh6NTDC9PUul5H6JmogI+ipEtAZntbZNSYTyDKM+vejTWM/9HRX4qk+p6ZgqMWjsasD
         FKvOeDIGTG6VRM2ubZ2AUMBlM68kn2+7ORRAaWENunk92BMEaHuEnj1gIdkmWUZugjOJ
         7sg6I829Ek47VwZhE/RY31CcXUD0VOlLE7QE7AP8G/zQxd3azUcxPlrC621AujYunh1n
         E64w==
X-Gm-Message-State: AOJu0YyUuQjdydrjIY/bUSE7f/dxfkpWdWmR5npIbbxFQ5aWnRg9lL3r
	7zlcPYGXGJH+kfG0HSVHFVCo1ZmYaifT3klYI/EDuPuJCZAiW2wToz50Fg==
X-Google-Smtp-Source: AGHT+IHybAH3ROCqzWPTcm+xj7W2GlMWA668KwjelqcCsAI7tzkaHrX2WK71745RK2/NgPzYz+197g==
X-Received: by 2002:a05:6a00:2188:b0:724:603f:1f9e with SMTP id d2e1a72fcca58-7247709d5dcmr21126398b3a.22.1731992627430;
        Mon, 18 Nov 2024 21:03:47 -0800 (PST)
Received: from kamensky-p15s.cisco.com ([2601:641:8000:93e0::1731])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724770ee8afsm7346324b3a.23.2024.11.18.21.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 21:03:46 -0800 (PST)
From: Victor Kamensky <victor.kamensky7@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Victor Kamensky <victor.kamensky7@gmail.com>
Subject: [PATCH 1/2] systemtap: upgrade 5.1 -> 5.2
Date: Mon, 18 Nov 2024 21:03:00 -0800
Message-Id: <20241119050301.4197-1-victor.kamensky7@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 05:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207376

* removed all backported patches

* fixed patch fuzz issue

Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
---
 ...ython-modules-to-correct-library-dir.patch | 11 ++--
 ...gcc-version-compatibility-hack-redux.patch | 32 ------------
 ...e.cxx-gcc-version-compatibility-hack.patch | 52 -------------------
 .../systemtap/systemtap_git.inc               |  6 +--
 4 files changed, 6 insertions(+), 95 deletions(-)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-gcc-version-compatibility-hack-redux.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-gcc-version-compatibility-hack.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch b/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch
index 48cf4aee85..ee9baedcda 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch
@@ -1,4 +1,4 @@
-From 2ada22f05460223924efe54080cb4419e2b4c276 Mon Sep 17 00:00:00 2001
+From 18d088d10c1a0885fa25ac40591e38c8aa545c81 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 24 Feb 2017 17:53:02 +0200
 Subject: [PATCH] Install python modules to correct library dir.
@@ -19,7 +19,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/python/Makefile.am b/python/Makefile.am
-index a254480..578602f 100644
+index 13618dc2f..9d5cb7bcb 100644
 --- a/python/Makefile.am
 +++ b/python/Makefile.am
 @@ -8,6 +8,10 @@ AUTOMAKE_OPTIONS = subdir-objects
@@ -35,7 +35,7 @@ index a254480..578602f 100644
  pkglibexecpython_PYTHON =
 @@ -47,7 +51,7 @@ install-exec-local:
  if HAVE_PYTHON2_PROBES
- 	(cd $(srcdir); CFLAGS="$(AM_CPPFLAGS)" $(PYTHON) setup.py build \
+ 	(cd $(srcdir); CFLAGS="$(CFLAGS) $(AM_CPPFLAGS)" $(PYTHON) setup.py build \
           --build-base $(shell readlink -f $(builddir))/py2build \
 -	 install --prefix $(DESTDIR)$(prefix) \
 +	 install --root $(DESTDIR) --prefix $(prefix) --prefix $(prefix) --install-lib=${pythondir} \
@@ -44,13 +44,10 @@ index a254480..578602f 100644
           --verbose)
 @@ -55,7 +59,7 @@ endif
  if HAVE_PYTHON3_PROBES
- 	(cd $(srcdir); CFLAGS="$(AM_CPPFLAGS)" $(PYTHON3) setup.py build \
+ 	(cd $(srcdir); CFLAGS="$(CFLAGS) $(AM_CPPFLAGS)" $(PYTHON3) setup.py build \
           --build-base $(shell readlink -f $(builddir))/py3build \
 -	 install --prefix $(DESTDIR)$(prefix) \
 +	 install --root $(DESTDIR) --prefix $(prefix) --install-lib=${python3dir} \
  	 --single-version-externally-managed \
  	 --record $(shell readlink -f $(builddir))/py3build/install_files.txt \
           --verbose)
--- 
-2.7.4
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-gcc-version-compatibility-hack-redux.patch b/meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-gcc-version-compatibility-hack-redux.patch
deleted file mode 100644
index 0c2888400d..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-gcc-version-compatibility-hack-redux.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 91caf37e4dfe862f9b68447b1597c0d0f31523c3 Mon Sep 17 00:00:00 2001
-From: "Frank Ch. Eigler" <fche@redhat.com>
-Date: Tue, 7 May 2024 15:04:04 -0400
-Subject: [PATCH] elaborate.cxx: gcc version compatibility hack redux
-
-Note __GNUC__ >= 14 for this diagnostic.
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=systemtap.git;a=commit;h=91caf37e4dfe862f9b68447b1597c0d0f31523c3]
-Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
----
- elaborate.cxx | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/elaborate.cxx b/elaborate.cxx
-index 88505559b..c08023f1d 100644
---- a/elaborate.cxx
-+++ b/elaborate.cxx
-@@ -2656,9 +2656,11 @@ symresolution_info::symresolution_info (systemtap_session& s, bool omniscient_un
-   session (s), unmangled_p(omniscient_unmangled), current_function (0), current_probe (0)
- {
-   #pragma GCC diagnostic push
-+  #if __GNUC__ >= 14
-   // c10s early snapshot GCC complains about this construct, which is
-   // made safe via our dtor usage
-   #pragma GCC diagnostic ignored "-Wdangling-pointer"
-+  #endif
-   saved_session_symbol_resolver = s.symbol_resolver;
-   s.symbol_resolver = this; // save resolver for early PR25841 function resolution
-   #pragma GCC diagnostic pop
--- 
-2.45.2
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-gcc-version-compatibility-hack.patch b/meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-gcc-version-compatibility-hack.patch
deleted file mode 100644
index 7cdcc93f14..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-gcc-version-compatibility-hack.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From d11241bdd05bc4c745c8aef53a2725331e1a93b4 Mon Sep 17 00:00:00 2001
-From: "Frank Ch. Eigler" <fche@redhat.com>
-Date: Tue, 7 May 2024 14:25:12 -0400
-Subject: [PATCH] elaborate.cxx: gcc version compatibility hack
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Suppress -Wdangling-pointer for a construct that appears valid, but
-one particular GCC snapshot version complains about.
-
-In constructor ‘symresolution_info::symresolution_info(systemtap_session&, bool)’,
-inlined from ‘int semantic_pass_symbols(systemtap_session&)’ at ../systemtap/elaborate.cxx:1872:28:
-../systemtap/elaborate.cxx:2659:21: error: storing the address of local variable ‘sym’ in ‘*s.systemtap_session::symbol_resolver’ [-Werror=dangling-pointer=]
- 2659 |   s.symbol_resolver = this; // save resolver for early PR25841 function resolution
-      |   ~~~~~~~~~~~~~~~~~~^~~~~~
-../systemtap/elaborate.cxx: In function ‘int semantic_pass_symbols(systemtap_session&)’:
-../systemtap/elaborate.cxx:1872:22: note: ‘sym’ declared here
- 1872 |   symresolution_info sym (s);
-      |                      ^~~
-../systemtap/elaborate.cxx:1870:43: note: ‘s’ declared here
- 1870 | semantic_pass_symbols (systemtap_session& s)
-      |                        ~~~~~~~~~~~~~~~~~~~^
-cc1plus: all warnings being treated as errors
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=systemtap.git;a=commit;h=d11241bdd05bc4c745c8aef53a2725331e1a93b4]
-Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
----
- elaborate.cxx | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/elaborate.cxx b/elaborate.cxx
-index 8bf9e6c06..88505559b 100644
---- a/elaborate.cxx
-+++ b/elaborate.cxx
-@@ -2655,8 +2655,13 @@ semantic_pass (systemtap_session& s)
- symresolution_info::symresolution_info (systemtap_session& s, bool omniscient_unmangled):
-   session (s), unmangled_p(omniscient_unmangled), current_function (0), current_probe (0)
- {
-+  #pragma GCC diagnostic push
-+  // c10s early snapshot GCC complains about this construct, which is
-+  // made safe via our dtor usage
-+  #pragma GCC diagnostic ignored "-Wdangling-pointer"
-   saved_session_symbol_resolver = s.symbol_resolver;
-   s.symbol_resolver = this; // save resolver for early PR25841 function resolution
-+  #pragma GCC diagnostic pop
- }
- 
- 
--- 
-2.45.2
-
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 80945ad7f8..bbb2105b5a 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,14 +1,12 @@
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "3a0c9c15163520dd0d9ab07177da62ce9cc2332f"
-PV = "5.1"
+SRCREV = "3a92ffe673c1621309a0b60892114495b651c9de"
+PV = "5.2"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git;branch=master;protocol=https \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
-           file://0001-elaborate.cxx-gcc-version-compatibility-hack.patch \
-           file://0001-elaborate.cxx-gcc-version-compatibility-hack-redux.patch \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|riscv64).*-linux'
-- 
2.45.0


