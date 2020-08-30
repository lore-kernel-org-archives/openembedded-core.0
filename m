Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web10.37074.1598811513618256535
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 11:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=syMs1PpB;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.196, mailfrom: steve@sakoman.com)
Received: by mail-il1-f196.google.com with SMTP id o16so4738575ilq.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 11:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=EuTmaBHDaO+6TUh9Fua5PawzD6W+a2yj5Gq6Ux98vJM=;
        b=syMs1PpB8sLtxbaJgtq3AWeTDVsjp8S3KLqlDK5zB3Q3DH3lgr8oPBiE5Mx/mYKE9F
         e3WkgdSRI1h1rYGOzpfU4rrgOYHB+/kytzE62Vk8ui6M/1pYiFbthH2N4OgGGmv61zWh
         USnwM+sYuDVzwxUZakZLzWrYG5uTcpGIwrVIsbEAjEHSUIxf613fYTLwg+fojK1UD5Es
         LG0hn7gnEG84+Oe+w9mpoU9MAc2pQgICuDSTZYV1/KmUiNlzOJRGnLO8yIvUy8Mw1eZE
         B8PyeIcn07b9SfSdwrwKdciQA7swiM9BfUhqWPw6PjPqLoaovwEMrvBxnGIS9Zed5z6N
         dJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=EuTmaBHDaO+6TUh9Fua5PawzD6W+a2yj5Gq6Ux98vJM=;
        b=VhZm0QT9b88w0wBiBdgFPvflMxCT4LgKt8qqjhmjzsA80qksZEM756ffNSI6W/M6mH
         f9jnNzNomnHlzU0BWwcJ2H5HQI6p0GJrpCxWUzDnRZkApdR1M1IZQk2awUkqbAzibik8
         pAcZZzcLQWJx+O9wwsfHQ+pjNBRMl8cBMfUretdmCOrMl4l2C0LUXCh2VqzAWCgC+qJ8
         j6/xw4hJP2JQeHUEZqqNUHG7JCejkhIWpUze6I0oAfUcINUESn0H7he86EdHmqahN8Dd
         C2xw15SfKPvrmSJBDv9Z0B2A8jiZjP7lnZhLgGXAHt2ZJNnAC/uumCNKOSjOT4qlVhVt
         5E2A==
X-Gm-Message-State: AOAM5337b2npOxAYde7AzuqBsXmojBtSzujQHIXze1qosbqGndLPog4h
	+13hsmuNhNP8n6TiD2euWFFmi8SpZdlFsJRdD20=
X-Google-Smtp-Source: ABdhPJwLIiKSucP462/Vg3VC49OUn+1g/79wtsku7ts5f6et8ba7Ydtmaze8mVhgsD1neJhqNtRDMg==
X-Received: by 2002:a92:4952:: with SMTP id w79mr5472950ila.1.1598811512556;
        Sun, 30 Aug 2020 11:18:32 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j62sm2884768iof.53.2020.08.30.11.18.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:18:32 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/25] perf: backport a fix for confusing non-fatal error
Date: Sun, 30 Aug 2020 08:16:06 -1000
Message-Id: <250b91cf10209bcb3d9dae55759e8bdcbef72cbb.1598810890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598810890.git.steve@sakoman.com>
References: <cover.1598810890.git.steve@sakoman.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* add V=1 to make log.do_compile a bit more useful, with this it shows:
  /bin/sh '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/perf/1.0-r9/perf-1.0/tools/perf/trace/beauty/arch_errno_names.sh' x86_64-oe-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse --sysroot=/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/perf/1.0-r9/recipe-sysroot /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/perf/1.0-r9/perf-1.0/tools > /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/perf/1.0-r9/perf-1.0/trace/beauty/generated/arch_errno_name_array.c
  find: unknown predicate `-m64/arch'
  x86_64-oe-linux-gcc: error: unrecognized command-line option '-m64/include/uapi/asm-generic/errno.h'
  x86_64-oe-linux-gcc: fatal error: no input files
  compilation terminated.
  x86_64-oe-linux-gcc: error: unrecognized command-line option '-m64/include/uapi/asm-generic/errno.h'
  x86_64-oe-linux-gcc: fatal error: no input files
  compilation terminated.

* apply https://github.com/torvalds/linux/commit/e4ffd066ff440a57097e9140fa9e16ceef905de8
  with sed call to fix this

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c603e6e13e44ae907cf1f04abf6e1babf3d7be26)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/perf/perf.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index c4b7b77e99..578b871e9e 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -68,6 +68,7 @@ SPDX_S = "${S}/tools/perf"
 LDFLAGS="-ldl -lutil"
 
 EXTRA_OEMAKE = '\
+    V=1 \
     -C ${S}/tools/perf \
     O=${B} \
     CROSS_COMPILE=${TARGET_PREFIX} \
@@ -199,6 +200,9 @@ do_configure_prepend () {
             ${S}/tools/perf/Makefile.perf
         sed -i -e "s,prefix='\$(DESTDIR_SQ)/usr'$,prefix='\$(DESTDIR_SQ)/usr' --install-lib='\$(DESTDIR)\$(PYTHON_SITEPACKAGES_DIR)',g" \
             ${S}/tools/perf/Makefile.perf
+        # backport https://github.com/torvalds/linux/commit/e4ffd066ff440a57097e9140fa9e16ceef905de8
+        sed -i -e 's,\($(Q)$(SHELL) .$(arch_errno_tbl).\) $(CC) $(arch_errno_hdr_dir),\1 $(firstword $(CC)) $(arch_errno_hdr_dir),g' \
+            ${S}/tools/perf/Makefile.perf
     fi
     sed -i -e "s,--root='/\$(DESTDIR_SQ)',--prefix='\$(DESTDIR_SQ)/usr' --install-lib='\$(DESTDIR)\$(PYTHON_SITEPACKAGES_DIR)',g" \
         ${S}/tools/perf/Makefile*
-- 
2.17.1

