Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70A2C3DA7D
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 16:44:34 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.22294.1672418670200713817
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 08:44:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ePrPJ7lK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d3so22360847plr.10
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 08:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9e4mXhtAHcAP4LLPYHMeQ9ArI7irHV1U0vbJ8WCAZM=;
        b=ePrPJ7lKFj7Lon9Uejmm7ryuQT06B9d2G20Btb1YPEixYtC+sR0q6Q/C59Bbgj8R1A
         GPVs0R2fXqORlu0qMUSUlYgAdPlxjxbFLJg/Z60jSKG3FtmTL4Sk5bXvemrXdKu+5Ltn
         zzZp7LJkMEmZxEhcb8C+JsdZo9aX97DMHPCNAMe5kNx+5lSWqzelskWk2HNeMB1jIErH
         aAj6ESModciw+7OEbfyg3gXgEot9IBYIC/rO/iBbtoqP7/luV6Q41ht8ncuk/non6AI6
         xtdtbqj8WcQQh67Z/lDE+aE772mFd8Q/GBHE0HPgQE48t4U7cCbMGaTrFKl6XBAJ3xZ5
         1WqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9e4mXhtAHcAP4LLPYHMeQ9ArI7irHV1U0vbJ8WCAZM=;
        b=2Uw7/IBTNW3xRzF01G3Ka+mIPw/l92Cq3YDgKICFM9CwJr4WJe1s3xZdOpUL0HpwrI
         yPjCr3wRZvjBQ0nXNed/HOM+qZvaLipllfMhN2lMUbRBpPQYS4QGxP8yfWPLlkOT4l5+
         VrkNlvrznmv4Yrl0oBDOu1TslXMcRigYUrGZ0gh4lITiZeUyUnVV2tVsh8xxNpmXxxJ1
         oG8eWQ1N1+TYwCGp8ov5w5x0saUnCM/C/4RiAF1HNvwEXdo19EGti8dtoL2dViioJfj+
         KfSr/HIOfAtkHZ7bY1lbJsubbvkiwgskKLvMFemsx/X0osKPveLulZWA3KAUk2JoFXeA
         I2jg==
X-Gm-Message-State: AFqh2krrIl4OTrGUALQWU/n08+yZhHc/TMH+7euQU4TcSypJrphfKkud
	jSL35QO+b68A86sjh97Y4vU60c0C7Ho+rJX6Cic=
X-Google-Smtp-Source: AMrXdXuwOskQSg3OQhd3ps5Bn6POcIOKGipLG+mYXNK+11SAWkcVtnd/2spmbAIBLIW0PFm0a7PhVg==
X-Received: by 2002:a05:6a20:6a83:b0:ab:fe5a:df95 with SMTP id bi3-20020a056a206a8300b000abfe5adf95mr34944235pzb.15.1672418669138;
        Fri, 30 Dec 2022 08:44:29 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id a79-20020a621a52000000b00581ad007a9fsm4413200pfa.153.2022.12.30.08.44.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 08:44:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 06/22] ruby: merge .inc into .bb
Date: Fri, 30 Dec 2022 06:43:56 -1000
Message-Id: <22082b75298730f5b30b486e1e37e7b241e3db25.1672418540.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672418540.git.steve@sakoman.com>
References: <cover.1672418540.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 16:44:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175147

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit d88ff809b2e78ee49d5da42bb08ff5244e6101af)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


