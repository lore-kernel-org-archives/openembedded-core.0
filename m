Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B3D4C3DA71
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 11:11:47 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.70918.1670929888100924406
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 03:11:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RK2WtUaR;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id o5so15237548wrm.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 03:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxujXEmcXevB+lHbT73IiKay8huZ72GX7KtsT/2pcO4=;
        b=RK2WtUaRZb2YFDBkLdeV1iQnXCPjdH0EQq5EaiVlOMu7YmUoyxq8jhEpawjtcVgSwg
         ifgWGDPjfk7rhXetPjhdx0R5ehnQUABDPei2T9v7jTNMrtT6MonKqcy2H2pkM5Aritzu
         KN0AtO/A40XkpI5RiI6marNbevIjOtPOl/21ewwKOehuMxEnAzylZnncn4/OzS3aqIzM
         pCqQBmP7FO20UmZJhlUIDb6J+hs7cmP8HIWejPOT2ezfjfIa/iU1UpbWTCMa89WSSlqy
         eMv3CAt3uOaUa3/omVY4d0121x7Rt95RuBCZ/irkH3jruANnXOpuZMLjpb074h9IEshx
         5m3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxujXEmcXevB+lHbT73IiKay8huZ72GX7KtsT/2pcO4=;
        b=ikziOA6UFsLscHN2iEJ95TbiwIQzWfp+iigsI0QDUt6BkrQ73XAQANnoeZbBvUG3NB
         mJic3hStsyCknEVgRvLy3ecrasRBJzwzkn7D5lG1OvjkYS5lLwtWtFZbgYqZf5dPCsbO
         t6NLkpI8Nczdj/uV6QgvXx7AZmYS1VBlul8mXiWjMUvaxWJrJafJlzNURejxJGsZMFEg
         6zoMHVHlXFhOzRWGG+6zqqeTpec1SWxIq+oY7CBQPBQDSwwFOuj/R+clIU1F/CyK3DSR
         H1NbKnZ48P76XkHCSgW7g36eL6Ws/llbu0Zs8iWs4U4s54J+f3iUxZxORFvCmynf4ET0
         P9sg==
X-Gm-Message-State: ANoB5pkD920QUr0jIMxrCqLlNJkd3FBcPSiQHmGtCD7HKWqjEaWcSHaZ
	IN9v/tzeFZqFD/K9csg545WVE79OMVw=
X-Google-Smtp-Source: AA0mqf7mhXSMvPAHIKV5eldK9NZwCghFwtK8hkBlHPgoNZRbV6erM7yKxkcrMmw6DII3oJFzTSSv4A==
X-Received: by 2002:a5d:4c50:0:b0:242:ce7:ca6f with SMTP id n16-20020a5d4c50000000b002420ce7ca6fmr12339194wrt.26.1670929897377;
        Tue, 13 Dec 2022 03:11:37 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000008800b002366c3eefccsm11362665wrx.109.2022.12.13.03.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:11:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/24] ruby: merge .inc into .bb
Date: Tue, 13 Dec 2022 12:11:13 +0100
Message-Id: <20221213111118.149697-19-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221213111118.149697-1-alex@linutronix.de>
References: <20221213111118.149697-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 11:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174529

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/ruby/ruby.inc      | 39 --------------------
 meta/recipes-devtools/ruby/ruby_3.1.2.bb | 45 +++++++++++++++++++++---
 2 files changed, 40 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-devtools/ruby/ruby.inc

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
deleted file mode 100644
index ebff5efd1f..0000000000
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "An interpreter of object-oriented scripting language"
-DESCRIPTION = "Ruby is an interpreted scripting language for quick \
-and easy object-oriented programming. It has many features to process \
-text files and to do system management tasks (as in Perl). \
-It is simple, straight-forward, and extensible. \
-"
-HOMEPAGE = "http://www.ruby-lang.org/"
-SECTION = "devel/ruby"
-LICENSE = "Ruby | BSD-2-Clause | BSD-3-Clause | GPL-2.0-only | ISC | MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5b8c87559868796979806100db3f3805 \
-                    file://BSDL;md5=8b50bc6de8f586dc66790ba11d064d75 \
-                    file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://LEGAL;md5=f260190bc1e92e363f0ee3c0463d4c7c \
-                    "
-
-DEPENDS = "zlib openssl libyaml gdbm readline libffi"
-DEPENDS:append:class-target = " ruby-native"
-
-SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
-SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
-           file://0001-extmk-fix-cross-compilation-of-external-gems.patch \
-           file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch \
-           "
-UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
-
-inherit autotools ptest pkgconfig
-
-
-# This snippet lets compiled extensions which rely on external libraries,
-# such as zlib, compile properly.  If we don't do this, then when extmk.rb
-# runs, it uses the native libraries instead of the target libraries, and so
-# none of the linking operations succeed -- which makes extconf.rb think
-# that the libraries aren't available and hence that the extension can't be
-# built.
-
-do_configure:prepend() {
-    sed -i "s#%%TARGET_CFLAGS%%#$CFLAGS#; s#%%TARGET_LDFLAGS%%#$LDFLAGS#" ${S}/common.mk
-    rm -rf ${S}/ruby/
-}
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.2.bb b/meta/recipes-devtools/ruby/ruby_3.1.2.bb
index 387bfa9b44..0115daf22a 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.2.bb
@@ -1,8 +1,25 @@
-require ruby.inc
-
-DEPENDS:append:libc-musl = " libucontext"
-
-SRC_URI += " \
+SUMMARY = "An interpreter of object-oriented scripting language"
+DESCRIPTION = "Ruby is an interpreted scripting language for quick \
+and easy object-oriented programming. It has many features to process \
+text files and to do system management tasks (as in Perl). \
+It is simple, straight-forward, and extensible. \
+"
+HOMEPAGE = "http://www.ruby-lang.org/"
+SECTION = "devel/ruby"
+LICENSE = "Ruby | BSD-2-Clause | BSD-3-Clause | GPL-2.0-only | ISC | MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5b8c87559868796979806100db3f3805 \
+                    file://BSDL;md5=8b50bc6de8f586dc66790ba11d064d75 \
+                    file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://LEGAL;md5=f260190bc1e92e363f0ee3c0463d4c7c \
+                    "
+
+DEPENDS = "zlib openssl libyaml gdbm readline libffi"
+DEPENDS:append:class-target = " ruby-native"
+
+SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
+SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
+           file://0001-extmk-fix-cross-compilation-of-external-gems.patch \
+           file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch \
            file://remove_has_include_macros.patch \
            file://run-ptest \
            file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
@@ -14,6 +31,24 @@ SRC_URI += " \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
            file://0001-Remove-dependency-on-libcapstone.patch \
            "
+UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
+
+inherit autotools ptest pkgconfig
+
+
+# This snippet lets compiled extensions which rely on external libraries,
+# such as zlib, compile properly.  If we don't do this, then when extmk.rb
+# runs, it uses the native libraries instead of the target libraries, and so
+# none of the linking operations succeed -- which makes extconf.rb think
+# that the libraries aren't available and hence that the extension can't be
+# built.
+
+do_configure:prepend() {
+    sed -i "s#%%TARGET_CFLAGS%%#$CFLAGS#; s#%%TARGET_LDFLAGS%%#$LDFLAGS#" ${S}/common.mk
+    rm -rf ${S}/ruby/
+}
+
+DEPENDS:append:libc-musl = " libucontext"
 
 SRC_URI[sha256sum] = "61843112389f02b735428b53bb64cf988ad9fb81858b8248e22e57336f24a83e"
 
-- 
2.30.2


