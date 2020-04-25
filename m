Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.345.1587835710718242982
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 10:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gru1MblF;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id k1so15441601wrx.4
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 10:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O/f6F2ReSf3goN+/F/zqDskboaSidF2gtUeNM7VrzhI=;
        b=Gru1MblF4Fci1mvMfO/OrCPB2e6XbIpQ64ahI1+4eVRmj9ECYkly0UlenX/XBL7S7+
         v+871mQiDbFQ1WW2BVXlAA4T11Sb0W36cYmEKfm7YPV0HjIENlGGrIWzllBqDEYAPMAk
         5fJE0omkXOvj/8o246RPqbPemKlnljmJjiRtRPljgVwdUJoV1fxVoavsOvJg+UD2iT87
         buElL6XxtT3GhZtD11SnL22DQgNS6NAQ9MqngZfpX88LzfzsXNexiHSjcdPZe4T+exJA
         TY73MTitG/blDYjRYG1GF6MfluWsOimF/Jdh75002kfJ6o+8sa4ZhbOys/ku2bbB8nM5
         ZfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O/f6F2ReSf3goN+/F/zqDskboaSidF2gtUeNM7VrzhI=;
        b=dTTLEBKTmKXipG4MA7ewXK3m00Hd8V3JCWuNi4ByJ16EsbgQMjp9C+uLc5T+uXrTwC
         b5Tjtcd9L7VfEOAtwItF3k3vqrJ35K/6g2VmR7a2E55rLVJmSN5XhcSeAbY2jMA4iUFI
         T212iOZC/N73k+nuVGxtsOqqZgKSMmD6waDwF0IP0zN8bOCoSkiIODbIPZ7ej/avi5IR
         oXtdlfU7b0WnUodY3/tK0ji04rsi6SUOWlSiUxVVoL6qGspb1gbQR3DVdv5oMMKTY4G1
         YR6mQXHeOEvgM8OeGJ3c63Bc4jDnAgM0mkTijy7TLN9WY9lrbGcPRVU0v01DRxFQbcCb
         XmKQ==
X-Gm-Message-State: AGi0PuagMtelxpBvOz5HD9y88Ssxhf9WmhHZ5ynTdFrdGMVDxk2BixVL
	NC0T6rIjo95BAwgiEOgQOhf8pFFF
X-Google-Smtp-Source: APiQypK3JQKWRiIYkpRIrVKX7OOeNAipaGemqwRa0K4yOooqJaNWz4W7xvOxYXGBdVnUH9k3ij+RWA==
X-Received: by 2002:a5d:4b43:: with SMTP id w3mr18143622wrs.208.1587835708512;
        Sat, 25 Apr 2020 10:28:28 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id g25sm7751253wmh.24.2020.04.25.10.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 10:28:28 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/15] libmodulemd: move from 1.x to 2.x version
Date: Sat, 25 Apr 2020 19:28:01 +0200
Message-Id: <20200425172814.27370-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200425172814.27370-1-alex.kanavin@gmail.com>
References: <20200425172814.27370-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New libdnf requires 2.x and is the only consumer in oe-core
(or elsewhere).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  2 +-
 ...ec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch | 22 ---------------
 ...e-the-manpage-only-if-the-feature-is.patch | 28 +++++++++++++++++++
 ...ld-do-not-install-python-gi-bindings.patch | 23 +++++++++++++++
 ...bmodulemd-v1_git.bb => libmodulemd_git.bb} | 12 ++++----
 5 files changed, 58 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-devtools/libmodulemd/libmodulemd-v1/0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch
 create mode 100644 meta/recipes-devtools/libmodulemd/libmodulemd/0001-modulemd-generate-the-manpage-only-if-the-feature-is.patch
 create mode 100644 meta/recipes-devtools/libmodulemd/libmodulemd/0002-meson.build-do-not-install-python-gi-bindings.patch
 rename meta/recipes-devtools/libmodulemd/{libmodulemd-v1_git.bb => libmodulemd_git.bb} (57%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 40e90f782b..25c919b532 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -349,7 +349,7 @@ RECIPE_MAINTAINER_pn-libmatchbox = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-libmnl = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libmpc = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libmodule-build-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
-RECIPE_MAINTAINER_pn-libmodulemd-v1 = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-libmodulemd = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libnewt = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-libnl = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libnotify = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd-v1/0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch b/meta/recipes-devtools/libmodulemd/libmodulemd-v1/0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch
deleted file mode 100644
index 847b5f700b..0000000000
--- a/meta/recipes-devtools/libmodulemd/libmodulemd-v1/0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From 4e67f6049b3f822fe6f5af46790a51ace581bf82 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 6 Nov 2018 13:41:29 +0100
-Subject: [PATCH] spec_tmpl.sh: use /bin/sh, not /usr/bin/sh
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- spec_tmpl.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/spec_tmpl.sh b/spec_tmpl.sh
-index 0238087..126853c 100755
---- a/spec_tmpl.sh
-+++ b/spec_tmpl.sh
-@@ -1,4 +1,4 @@
--#!/usr/bin/sh
-+#!/bin/sh
- 
- version=$1
- template=$2
diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd/0001-modulemd-generate-the-manpage-only-if-the-feature-is.patch b/meta/recipes-devtools/libmodulemd/libmodulemd/0001-modulemd-generate-the-manpage-only-if-the-feature-is.patch
new file mode 100644
index 0000000000..d5c87a1154
--- /dev/null
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd/0001-modulemd-generate-the-manpage-only-if-the-feature-is.patch
@@ -0,0 +1,28 @@
+From a04fd2c8ac9e0f7a6fc17f02b2a95227b3d0aae4 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 31 Mar 2020 16:06:39 +0200
+Subject: [PATCH] modulemd: generate the manpage only if the feature is enabled
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ modulemd/meson.build | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/modulemd/meson.build b/modulemd/meson.build
+index 9ef1902..9f71e72 100644
+--- a/modulemd/meson.build
++++ b/modulemd/meson.build
+@@ -494,6 +494,7 @@ if with_docs
+     )
+ endif
+ 
++if with_manpages == 'enabled'
+ help2man_opts = [
+   '--no-info',
+   '--section=1',
+@@ -506,3 +507,4 @@ custom_target(
+     ],
+     install: true,
+     install_dir: join_paths(get_option('mandir'), 'man1'))
++endif
diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd/0002-meson.build-do-not-install-python-gi-bindings.patch b/meta/recipes-devtools/libmodulemd/libmodulemd/0002-meson.build-do-not-install-python-gi-bindings.patch
new file mode 100644
index 0000000000..a97fb73907
--- /dev/null
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd/0002-meson.build-do-not-install-python-gi-bindings.patch
@@ -0,0 +1,23 @@
+From d7eeac90fe02ccf5c5e4334e41ec75fc33803643 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 31 Mar 2020 16:12:28 +0200
+Subject: [PATCH] meson.build: do not install python gi bindings
+
+These are unnecessary for oe-core, and the install location
+is incorrectly determined using native python.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ meson.build | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index a8b02b4..8ff737b 100644
+--- a/meson.build
++++ b/meson.build
+@@ -171,4 +171,3 @@ configure_file(
+ )
+ 
+ subdir('modulemd')
+-subdir('bindings/python')
diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd-v1_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
similarity index 57%
rename from meta/recipes-devtools/libmodulemd/libmodulemd-v1_git.bb
rename to meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index 5409051d79..d440e60ee6 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd-v1_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -2,19 +2,19 @@ SUMMARY = "C Library for manipulating module metadata files"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=25a3927bff3ee4f5b21bcb0ed3fcd6bb"
 
-SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=1.x-maint \
-           file://0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch \
+SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https \
+           file://0001-modulemd-generate-the-manpage-only-if-the-feature-is.patch \
+           file://0002-meson.build-do-not-install-python-gi-bindings.patch \
            "
 
-PV = "1.8.16"
-SRCREV = "d0dcf7b373b3cf85cd39eb3bc23d31e06195a75a"
-UPSTREAM_CHECK_GITTAGREGEX = "libmodulemd-(?P<pver>1.*\d)"
+PV = "2.9.2"
+SRCREV = "780750eab8a0587b20d033f335301f16d00ab9c9"
 
 S = "${WORKDIR}/git"
 
 inherit meson gobject-introspection
 
-EXTRA_OEMESON = "-Ddeveloper_build=false -Dwith_docs=false"
+EXTRA_OEMESON = "-Ddeveloper_build=false -Dwith_docs=false -Drpmio=disabled -Dlibmagic=disabled -Dwith_manpages=disabled"
 
 DEPENDS += "glib-2.0 libyaml glib-2.0-native python3"
 
-- 
2.26.1

