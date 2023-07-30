Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEDB6C001DF
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:31 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.77634.1690740088242292947
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=OuIQhpEQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-686f19b6dd2so2405977b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740087; x=1691344887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+zfcnVqv5e5j/RMIJPOPLqc5Mu/wyMyibyevKPNRypQ=;
        b=OuIQhpEQg8M1fZUfA3ON9BUHwhz5lhdBgZH4RAk4Pv3JCizol3/w1buOe0R/P68+RS
         t+Gag08ghOv7fCPf3InL3jh7VLMS0vNlwe33xPJsp7upH4h8TgpJyZUZrBFClKSnn6kV
         PRsbdmbRPWKAe6sMYK2TnawyNhYIbIu5Q+QO6bDc9vU+wh0pg90yez1QhL2yZ6PFP4Wd
         AV9fAtKD7EJ3gwM6qWmBmO4xm9/nV8s4LUh9cYTuK/ROruhxFZf60UHZG6XfvK+CVl/b
         Rgxq5uWtF0YdyFdsj/OKH9/H5il0K9dkmcp3ZlYvMQcsU0g8jbeLWIheqPAnKxAe/40Z
         Vf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740087; x=1691344887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+zfcnVqv5e5j/RMIJPOPLqc5Mu/wyMyibyevKPNRypQ=;
        b=TbWm3YfYntU5hrIuaSWQ9cyjA19l7b/apNbvT1bAyc9QTSEsDsDodGTzDJ7kgoyYNp
         lD21I9OrRKddJ4lLZAawXx1++1vIaha3YEaO6r0Ej30vO4c1Y82EFkZ9WDwmr6LfunFi
         6qXeGnbLKqJatD6g78ObNIuBUdlbO+LZIeqDmOj893lHykCBREyK/PmG857zy92ZyF48
         bM0cO9Nf1JmgMXD5pKQQJK8N5CJKBAsyJOZfIrA9yPy0eR+/nyzQYUzAbnxz47kab7/H
         dOf9yc1Bmzgl3CDmvj61QMaaTLKM0CFmAUbXqqmDrbKwWqUjRdRDQUVpx63Acvo7EZ/J
         YK8Q==
X-Gm-Message-State: ABy/qLblop77/wjZDoHu6eJjWpmBE3ogONB8QTIzmcatiCKCI25hb17r
	dghyzsW8102y8luyJ+aRFjQr5IpYr/yhsZsBbcxOsA==
X-Google-Smtp-Source: APBJJlGklkBvq7x+XBWZoB2anid77gXBDQ/eH7hAt+ve4knWxBBreuVGJrao9rjb0l1yR0CR5byq6A==
X-Received: by 2002:a05:6a00:10c1:b0:687:40bd:561 with SMTP id d1-20020a056a0010c100b0068740bd0561mr4299pfu.20.1690740087199;
        Sun, 30 Jul 2023 11:01:27 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/30] libxcrypt: fix build with perl-5.38 and use master branch
Date: Sun, 30 Jul 2023 08:00:38 -1000
Message-Id: <a8411d65a32d790adebee7a435b50fc88a43bbf6.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185093

From: Martin Jansa <martin.jansa@gmail.com>

* fixes do_configure failure:
  checking whether all ucontext.h functions are available... yes
  when is deprecated at libxcrypt/4.4.30-r0/git/build-aux/scripts/BuildCommon.pm line 522.
  Compilation failed in require at ../git/build-aux/scripts/expand-selected-hashes line 28.
  BEGIN failed--compilation aborted at ../git/build-aux/scripts/expand-selected-hashes line 28.
  configure: error: bad value 'all' for --enable-hashes
  NOTE: The following config.log files may provide further information.

* with this patch backported it works OK:
  libxcrypt/4.4.30-r0/git $ perl build-aux/scripts/expand-selected-hashes
  usage: expand-selected-hashes hashes.conf names,of,selected,hashes

* similarly do_compile failure:
  ../git/build-aux/scripts/move-if-change crypt-hashes.h.T crypt-hashes.h
  ../git/build-aux/scripts/move-if-change crypt-symbol-vers.h.T crypt-symbol-vers.h
  given is deprecated at ../git/build-aux/scripts/gen-crypt-h line 41.
  Makefile:3818: Makefile.deps: No such file or directory
  make: *** [Makefile:3715: crypt.h.stamp] Error 255

* also use master branch instead of develop, the SRCREV exists in both
  but stable metadata branches should track stable component branches

  libxcrypt/4.4.30-r0/git $ git branch -a --contains d7fe1ac04c326dba7e0440868889d1dccb41a175 | tee
  * develop
    remotes/origin/HEAD -> origin/develop
    remotes/origin/develop
    remotes/origin/master

  and oe-core master also uses master SRCBRANCH since:
  https://git.openembedded.org/openembedded-core/commit/?id=d18e89bd2b46c6e266cc39dbe9fdb6c032f5f1fe

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ommon.pm-compatible-with-latest-perl.patch | 50 +++++++++++++++
 ...ve-smartmatch-usage-from-gen-crypt-h.patch | 62 +++++++++++++++++++
 meta/recipes-core/libxcrypt/libxcrypt.inc     |  7 ++-
 3 files changed, 117 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/libxcrypt/files/0001-Make-BuildCommon.pm-compatible-with-latest-perl.patch
 create mode 100644 meta/recipes-core/libxcrypt/files/0002-Remove-smartmatch-usage-from-gen-crypt-h.patch

diff --git a/meta/recipes-core/libxcrypt/files/0001-Make-BuildCommon.pm-compatible-with-latest-perl.patch b/meta/recipes-core/libxcrypt/files/0001-Make-BuildCommon.pm-compatible-with-latest-perl.patch
new file mode 100644
index 0000000000..b3e43d5815
--- /dev/null
+++ b/meta/recipes-core/libxcrypt/files/0001-Make-BuildCommon.pm-compatible-with-latest-perl.patch
@@ -0,0 +1,50 @@
+From c3ec04f1aee68970b82e4b033bee1477e76798f9 Mon Sep 17 00:00:00 2001
+From: Leon Timmermans <fawaka@gmail.com>
+Date: Tue, 6 Jun 2023 17:03:57 +0200
+Subject: [PATCH] Make BuildCommon.pm compatible with latest perl
+
+It was previously using an experimental feature that has since been dropped.
+This removes the use of that feature.
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Upstream-Status: Backport [v4.4.35 https://github.com/besser82/libxcrypt/commit/ce562f4d33dc090fcd8f6ea1af3ba32cdc2b3c9c]
+---
+ build-aux/scripts/BuildCommon.pm | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/build-aux/scripts/BuildCommon.pm b/build-aux/scripts/BuildCommon.pm
+index 0e6f2a3..c38ba21 100644
+--- a/build-aux/scripts/BuildCommon.pm
++++ b/build-aux/scripts/BuildCommon.pm
+@@ -11,7 +11,6 @@ use v5.14;    # implicit use strict, use feature ':5.14'
+ use warnings FATAL => 'all';
+ use utf8;
+ use open qw(:utf8);
+-no  if $] >= 5.018, warnings => 'experimental::smartmatch';
+ no  if $] >= 5.022, warnings => 'experimental::re_strict';
+ use if $] >= 5.022, re       => 'strict';
+ 
+@@ -519,19 +518,19 @@ sub parse_symver_args {
+     my $COMPAT_ABI;
+     local $_;
+     for (@args) {
+-        when (/^SYMVER_MIN=(.+)$/) {
++        if (/^SYMVER_MIN=(.+)$/) {
+             $usage_error->() if defined $SYMVER_MIN;
+             $SYMVER_MIN = $1;
+         }
+-        when (/^SYMVER_FLOOR=(.+)$/) {
++        elsif (/^SYMVER_FLOOR=(.+)$/) {
+             $usage_error->() if defined $SYMVER_FLOOR;
+             $SYMVER_FLOOR = $1;
+         }
+-        when (/^COMPAT_ABI=(.+)$/) {
++        elsif (/^COMPAT_ABI=(.+)$/) {
+             $usage_error->() if defined $COMPAT_ABI;
+             $COMPAT_ABI = $1;
+         }
+-        default {
++        else {
+             $usage_error->() if defined $map_in;
+             $map_in = $_;
+         }
diff --git a/meta/recipes-core/libxcrypt/files/0002-Remove-smartmatch-usage-from-gen-crypt-h.patch b/meta/recipes-core/libxcrypt/files/0002-Remove-smartmatch-usage-from-gen-crypt-h.patch
new file mode 100644
index 0000000000..603f52f792
--- /dev/null
+++ b/meta/recipes-core/libxcrypt/files/0002-Remove-smartmatch-usage-from-gen-crypt-h.patch
@@ -0,0 +1,62 @@
+From 95d6e03ae37f4ec948474d111105bbdd2938aba2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20K=2E=20H=C3=BCttel?= <dilfridge@gentoo.org>
+Date: Sun, 25 Jun 2023 01:35:08 +0200
+Subject: [PATCH] Remove smartmatch usage from gen-crypt-h
+
+Needed for Perl 5.38
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Upstream-Status: Backport [v4.4.36 https://github.com/besser82/libxcrypt/commit/95d6e03ae37f4ec948474d111105bbdd2938aba2]
+---
+ build-aux/scripts/gen-crypt-h | 31 ++++++++++++++-----------------
+ 1 file changed, 14 insertions(+), 17 deletions(-)
+
+diff --git a/build-aux/scripts/gen-crypt-h b/build-aux/scripts/gen-crypt-h
+index 12aecf6..b113b79 100644
+--- a/build-aux/scripts/gen-crypt-h
++++ b/build-aux/scripts/gen-crypt-h
+@@ -12,7 +12,6 @@ use v5.14;    # implicit use strict, use feature ':5.14'
+ use warnings FATAL => 'all';
+ use utf8;
+ use open qw(:std :utf8);
+-no  if $] >= 5.018, warnings => 'experimental::smartmatch';
+ no  if $] >= 5.022, warnings => 'experimental::re_strict';
+ use if $] >= 5.022, re       => 'strict';
+ 
+@@ -37,22 +36,20 @@ sub process_config_h {
+     local $_;
+     while (<$fh>) {
+         chomp;
+-        # Yes, 'given $_' is really required here.
+-        given ($_) {
+-            when ('#define HAVE_SYS_CDEFS_H 1') {
+-                $have_sys_cdefs_h = 1;
+-            }
+-            when ('#define HAVE_SYS_CDEFS_BEGIN_END_DECLS 1') {
+-                $have_sys_cdefs_begin_end_decls = 1;
+-            }
+-            when ('#define HAVE_SYS_CDEFS_THROW 1') {
+-                $have_sys_cdefs_throw = 1;
+-            }
+-            when (/^#define PACKAGE_VERSION "((\d+)\.(\d+)\.\d+)"$/) {
+-                $substs{XCRYPT_VERSION_STR}   = $1;
+-                $substs{XCRYPT_VERSION_MAJOR} = $2;
+-                $substs{XCRYPT_VERSION_MINOR} = $3;
+-            }
++
++        if ($_ eq '#define HAVE_SYS_CDEFS_H 1') {
++            $have_sys_cdefs_h = 1;
++        }
++        elsif ($_ eq '#define HAVE_SYS_CDEFS_BEGIN_END_DECLS 1') {
++            $have_sys_cdefs_begin_end_decls = 1;
++        }
++        elsif ($_ eq '#define HAVE_SYS_CDEFS_THROW 1') {
++            $have_sys_cdefs_throw = 1;
++        }
++        elsif (/^#define PACKAGE_VERSION "((\d+)\.(\d+)\.\d+)"$/) {
++            $substs{XCRYPT_VERSION_STR}   = $1;
++            $substs{XCRYPT_VERSION_MAJOR} = $2;
++            $substs{XCRYPT_VERSION_MINOR} = $3;
+         }
+     }
+ 
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 454a55d73d..342cbd0d06 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -11,9 +11,12 @@ inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https"
 SRCREV = "d7fe1ac04c326dba7e0440868889d1dccb41a175"
-SRCBRANCH ?= "develop"
+SRCBRANCH ?= "master"
 
-SRC_URI += "file://fix_cflags_handling.patch"
+SRC_URI += "file://fix_cflags_handling.patch \
+    file://0001-Make-BuildCommon.pm-compatible-with-latest-perl.patch \
+    file://0002-Remove-smartmatch-usage-from-gen-crypt-h.patch \
+"
 
 PROVIDES = "virtual/crypt"
 
-- 
2.34.1


