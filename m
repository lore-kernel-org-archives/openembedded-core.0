Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F2DCA6012
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 07:16:35 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2430.1791529450161937467
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2026 00:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZdxVYOTA;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: yasmen2262005@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7c33cc572e6so1476916137.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 00:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791529449; cv=none;
        d=google.com; s=arc-20260327;
        b=U9jQNUBrG24kQNDjWjvbV4TMYEnGebi3ECg7NaczZYwNawyIJ2eXtFV9eEEi0LRhnV
         Lbw90nzZBzGEYJsMS/KIBh0mhzi+sX4OTGEirQC/e+dDFN/Dq++4XJQUcjS60thEXAVT
         9SR624HsTzaCIbXZJsBG8X2gHlqaIPPZgXDCRDkVslq8JQUKEQcbWhiRZZGl0lla8v0B
         k/IXywDoH1XBXsDyiWicBs5VIZheW3AflQy7jCEraWq7a7sUnxDcfEpPKtoW8JVLUlK7
         Tqi+XBXrZzxwiLHCGlX2bL1JUxCoX/sSLnai4a8EZbU2I0IEpuR10Gm1kTPdHSWyStSV
         xCjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=P/aow16C/Q32cHlUfCLpeaczQ7hjEiEspeBiQnhtGLs=;
        fh=6Z4xUuTqkcxNv6cvnn0HdSGcZYvnhz2BRm++iEwx924=;
        b=eEIrxCuYrLMk3qT/bPoJYZ8mGdatNo0Rd/pP0Mty+3E9i4aBYLjmLgS5HqLr/E91vL
         MZduwkVgQ6ZH7DeRmJg1kix+X75Tye0rn0BZ4Ui2Qk0Li0TKkhN6uXaPyvuTVZtpXl6N
         SA6nilRNj5IGHwVeLiPgQT7LLF0GNFtD+S3P3QltKTPESSRovSuHGzle60Im8eppOSAj
         +bETIzmf9MiU45OaJoWdQw+WIynFQN7sZiK1igVGayuoe7D64oY3CQ+zSfAxA3AsKycO
         XtwKuC5E6YnYHrLjJWMJbzSQal/htLWhLz1gQ2t5QgMBJe2EPAtxb/lRzDTjHRyF8Mzs
         e8YQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791529449; x=1792134249; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P/aow16C/Q32cHlUfCLpeaczQ7hjEiEspeBiQnhtGLs=;
        b=ZdxVYOTA01EvymEkgBIoIUoEQFML2OOWjWPovTGNbkh8c82GclnLjZD16IK8hmC4TR
         CEuMD+8V03YHotnmmxJjsPh0JonWVj3M3pDuo+pC4ITQUXCfjp2/iauofWpOhY8YWgZR
         OYQ5Lo4bjGip9ny6DBzL2MGY2cNXySkvUnY9eR7sUAfHtV6IdYfnaTjynQ7MzI4SNDzw
         LhOWNXRYH2EhYCQNMNlQEt2Fm9F9f227XxideZ2C+77eDsCRgHyuouZWkbK+AgRIg7np
         OIknrdWYRVp75nGoCKJ0jWaNxC+GRc4HiD/sMbGRyVoTfVQm5jAwq1Q/GC5N/eY2En2S
         aMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529449; x=1792134249;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P/aow16C/Q32cHlUfCLpeaczQ7hjEiEspeBiQnhtGLs=;
        b=YGe5x7seAFbXWNJufzifHT6CBqNiZtCjsWWWNlFfLHnrz8vXQxyNYEF8kvmWg+7ufG
         wa7XqyDlA0gqSpyB3+SeUAyPW1Joui+z6cJEpMqdk363xEp1VO1/A/cXdknU5uPSE5PD
         CcKygYRiYQPi8GGl7qbv/G/uuY8MVPQD9rCQmhCh4MFneirw2GnxBIN+GAHMZamWpfQU
         s+9dRu3CJyEb+YE0zx4Eg+0nlWWX5E/E1kNG5+bz0oF3ihgc5k4j91UFUiVy8lzdeuVO
         HnC3kiK32B3nuAnQrlZvWhG5nImNEB5pJULc4SBw3dbR1E0ncguH/EDMOYmDOAkti+FE
         4CPg==
X-Gm-Message-State: AFq9FYJs7XjleomTXkkVbvcKnW0z3TtuvEnGADguON1cmtTeyBXKxezf
	wXktARQ+BAxaBCfZ+Kz1HQ+r2dXLGOfThr5/+vmjE37ZnNmJJvj1lXyDvqINx8l/ASJcKb8V2PY
	/IeJBw3NQupcLUg70868TKK6sXbCAXdZaLuDi
X-Gm-Gg: AYBFou20Vg0keILbh488h5wJcYdXW1dAwTVkrP1b3Eo9oqOIEMSR6TZpsz7L4W0NSGX
	2vadKZ1kAJFFgIIdvN7WmoT6G1wHMxvjHk8Zsj1mue6JF4hDVaJ/Jp6GkwPWxWnue6V0R8aKKPK
	3PpaIhA+Fvpe+7lCByIYHsCrJfIjiQd3E1CYiUS4+r9udNTTkWAaFtIsisM0+DQHq6Tksll0Gy5
	su9yRSws+Xi7szP3jfV05VolbHFrQK8iCvDmfqnxztQAb8jBH9DXmTRz6Wu/XC99UF9ipt+9HnZ
	ab6vb0cqsUb/DIIQ4GGvLR4ui36/9TSLFFdF7rr16Gw6u9mD9n+oK3JjKg==
X-Received: by 2002:a05:620a:408d:b0:93e:5508:24f8 with SMTP id
 af79cd13be357-93eb9677234mr206234985a.32.1791529038004; Thu, 08 Oct 2026
 23:57:18 -0700 (PDT)
MIME-Version: 1.0
From: Yasmeen Ahmed <yasmen2262005@gmail.com>
Date: Fri, 9 Oct 2026 09:57:06 +0300
X-Gm-Features: AclHuK8rw6uzr29MX4Ao3OV4HDqJbO1Zd4ezKUBAnZtEExc80rqz9TZys5ypSy8
Message-ID: <CAOJDZMeDTTZ3OTFO9rZkA180jNJRFgkx1nf-+UJbv18feQo0WA@mail.gmail.com>
Subject: Re: [PATCH 6/6] subversion: upgrade 1.14.5 -> 1.15.0
To: jaipaul.cheernam@est.tech
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 07:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247468

Version 1.15.0
(21 Sep 2026, from /branches/1.15.x)
https://svn.apache.org/repos/asf/subversion/tags/1.15.0

See the 1.15 release notes for a more verbose overview of the changes since
the 1.14 release:  https://subversion.apache.org/docs/release-notes/1.15.html

License-Update: Update content due to Remove experimental
move-tracking development. [1]

[1] https://github.com/apache/subversion/commit/d3c038eb5da2c56040193df8de128bb896d7b642

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...-fix-svn-revision-host-contamination.patch |  9 ++--
 .../subversion/subversion/parallel.patch      | 19 ++++---
 .../subversion/subversion/serfmacro.patch     | 12 +++--
 ...version_1.14.5.bb => subversion_1.15.0.bb} | 53 ++++++++++++++++++-
 4 files changed, 74 insertions(+), 19 deletions(-)
 rename meta/recipes-devtools/subversion/{subversion_1.14.5.bb =>
subversion_1.15.0.bb} (61%)

diff --git a/meta/recipes-devtools/subversion/subversion/0001-fix-svn-revision-host-contamination.patch
b/meta/recipes-devtools/subversion/subversion/0001-fix-svn-revision-host-contamination.patch
index 9741a6499c..cfcf090ce3 100644
--- a/meta/recipes-devtools/subversion/subversion/0001-fix-svn-revision-host-contamination.patch
+++ b/meta/recipes-devtools/subversion/subversion/0001-fix-svn-revision-host-contamination.patch
@@ -1,4 +1,4 @@
-From 54b2cf44445820ea7c3250a25ed957a389aafbd6 Mon Sep 17 00:00:00 2001
+From d8f18b85e017f7fcfffaeb46cfbf6cc07ce1376c Mon Sep 17 00:00:00 2001
 From: Haixiao Yan <haixiao.yan.cn@windriver.com>
 Date: Thu, 28 May 2026 09:20:59 +0800
 Subject: [PATCH] build: do not run svnversion during install
@@ -23,10 +23,10 @@ Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
  1 file changed, 1 insertion(+), 4 deletions(-)

 diff --git a/Makefile.in b/Makefile.in
-index 7f0a37dd9a9b..914c1c37790c 100644
+index bea3a35..92ca3a0 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -499,10 +499,7 @@ local-install: @INSTALL_RULES@
+@@ -500,10 +500,7 @@ local-install: @INSTALL_RULES@
  revision-install:
  test -d $(DESTDIR)$(includedir)/subversion-1 || \
   $(MKDIR) $(DESTDIR)$(includedir)/subversion-1
@@ -38,6 +38,3 @@ index 7f0a37dd9a9b..914c1c37790c 100644

  install-static: @INSTALL_STATIC_RULES@

---
-2.53.0
-
diff --git a/meta/recipes-devtools/subversion/subversion/parallel.patch
b/meta/recipes-devtools/subversion/subversion/parallel.patch
index 1fee1523ee..ad0babe034 100644
--- a/meta/recipes-devtools/subversion/subversion/parallel.patch
+++ b/meta/recipes-devtools/subversion/subversion/parallel.patch
@@ -1,4 +1,8 @@
-Ensure that directories are created before files are compiled into them.
+From a0aad59e068b6ed852db38cf26c5d862ce0ec2ab Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 5 Mar 2026 11:51:30 +0000
+Subject: [PATCH] Ensure that directories are created before files are compiled
+ into them.

 This is a hacky workaround, upstream have been informed and a better
 solution proposed:
@@ -7,12 +11,15 @@
https://lists.apache.org/thread/nr0w8hcpr9my2gkys09kj89rlxgd84of

 Upstream-Status: Inappropriate [discussion upstream]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ Makefile.in | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)

-diff --git i/Makefile.in w/Makefile.in
-index 0fb9e39602..8bae2cc3d2 100644
---- i/Makefile.in
-+++ w/Makefile.in
-@@ -424,7 +424,9 @@ ECHO_N = @ECHO_N@
+diff --git a/Makefile.in b/Makefile.in
+index 983f3d1..bea3a35 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -419,7 +419,9 @@ ECHO_N = @ECHO_N@

  TESTS = $(TEST_PROGRAMS) @BDB_TEST_PROGRAMS@

diff --git a/meta/recipes-devtools/subversion/subversion/serfmacro.patch
b/meta/recipes-devtools/subversion/subversion/serfmacro.patch
index 507de0f08b..b16a0c866f 100644
--- a/meta/recipes-devtools/subversion/subversion/serfmacro.patch
+++ b/meta/recipes-devtools/subversion/subversion/serfmacro.patch
@@ -1,3 +1,8 @@
+From d8f21366d2b9bd72faf078099d4ba8146396ac59 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 7 Dec 2016 13:54:18 +0000
+Subject: [PATCH] subversion: Fix issues in LDFLAGS sed manipulation
+
 The existing sed expression can match expressions like
 --sysroot=/some/path/xxx-linux/ which clearly isn't intended and injects
 incorrect paths into LDFLAGS.
@@ -14,10 +19,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)

 diff --git a/build/ac-macros/serf.m4 b/build/ac-macros/serf.m4
-index 0a549b3..3a069ac 100644
+index 4637430..126eb74 100644
 --- a/build/ac-macros/serf.m4
 +++ b/build/ac-macros/serf.m4
-@@ -171,7 +171,7 @@ AC_DEFUN(SVN_SERF_PKG_CONFIG,
+@@ -185,7 +185,7 @@ AC_DEFUN(SVN_SERF_PKG_CONFIG,
            SVN_SERF_INCLUDES=[`$PKG_CONFIG $serf_pc_arg --cflags-only-I`]
            SVN_SERF_LIBS=[`$PKG_CONFIG $serf_pc_arg --libs-only-l`]
            dnl don't use --libs-only-L because then we might miss some options
@@ -26,6 +31,3 @@ index 0a549b3..3a069ac 100644
            break
          else
            AC_MSG_RESULT([no])
---
-2.7.4
-
diff --git a/meta/recipes-devtools/subversion/subversion_1.14.5.bb
b/meta/recipes-devtools/subversion/subversion_1.15.0.bb
similarity index 61%
rename from meta/recipes-devtools/subversion/subversion_1.14.5.bb
rename to meta/recipes-devtools/subversion/subversion_1.15.0.bb
index f6a5b9950f..a70e1f813d 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.5.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.15.0.bb
@@ -1,9 +1,58 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -367,35 +367,6 @@
+#   *  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+#   *  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+#
+# -For the (modified) 'linenoise' library in tools/dev/svnmover/linenoise
+# -
+# -  Copyright (c) 2010-2014, Salvatore Sanfilippo <antirez at gmail dot com>
+# -  Copyright (c) 2010-2013, Pieter Noordhuis <pcnoordhuis at gmail dot com>
+# -
+# -  All rights reserved.
+# -
+# -  Redistribution and use in source and binary forms, with or without
+# -  modification, are permitted provided that the following
conditions are met:
+# -
+# -  * Redistributions of source code must retain the above copyright notice,
+# -    this list of conditions and the following disclaimer.
+# -
+# -  * Redistributions in binary form must reproduce the above
copyright notice,
+# -    this list of conditions and the following disclaimer in the
documentation
+# -    and/or other materials provided with the distribution.
+# -
+# -  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+# -  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+# -  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
+# -  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+# -  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+# -  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
+# -  TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
+# -  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
+# -  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
+# -  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+# -  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# -
+#  For the (modified) LZ4 library files in subversion/libsvn_subr/lz4
+#
+#    LZ4 Library
+#
+#
+
 SUMMARY = "Subversion (svn) version control system client"
 HOMEPAGE = "http://subversion.apache.org"
 DESCRIPTION = "Subversion is an open source version control system."
 SECTION = "console/network"
 LICENSE = "Apache-2.0 AND MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6487ae7094d359fa90fb9c4096e52e2b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d9c5b0e279cdb238d735af75554a3902"

 DEPENDS = "apr-util serf sqlite3 file lz4 expat"
 DEPENDS:append:class-native = " file-replacement-native"
@@ -14,7 +63,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-fix-svn-revision-host-contamination.patch \
            "

-SRC_URI[sha256sum] =
"e78a29e7766b8b7b354497d08f71a55641abc53675ce1875584781aae35644a1"
+SRC_URI[sha256sum] =
"dfb7b1e5270c7def971ccbd5938b0c03b1b5bd60b6674a2d8a74a9560839fb8c"

 inherit autotools pkgconfig gettext python3native


Reviewed-by: Yasmeen Atta <yasmen2262005@gmail.com>

