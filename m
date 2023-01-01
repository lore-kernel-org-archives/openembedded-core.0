Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08784C53210
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:36 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.16014.1672594708078651426
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:38:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Ui8OpnGF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id z7so11751681pfq.13
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9e4mXhtAHcAP4LLPYHMeQ9ArI7irHV1U0vbJ8WCAZM=;
        b=Ui8OpnGFhqb8Ovb+tZF+8mRNQifJZZyO9rfiFZfi/alcLxy4FlnaMCpwXigw0U8h9j
         xnhiL7gbCgKX+6B4Vr5EQdrlEhpfIZwrYjSYX6VLDTKO81AHiWmxQLPgXPWfocSS/l4K
         KpDFfySBMrkEIX53yBahkQvbBPJodtEpT8T3FmQElySPhZZQzuNZ91dU2mW5vKUp7mV8
         1LHRGx8Z1MhyUWe8Ub9aCWI8XfTzRm20MKI2TGyGVX/sfPZa/x3AHO1Gwihoc5x5N4S6
         HghcN849zthfraJzJ5b1ZEgPjsWOP4egDaDkz03YIjWXdeBXL2y+Bp0g/CIvCtjZMkHA
         dJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9e4mXhtAHcAP4LLPYHMeQ9ArI7irHV1U0vbJ8WCAZM=;
        b=YLfJ8Iii+R7G9Vyal+Cn0wW/euOuXyuHwwgFxR3gYXnbqTsGtuLZq27aNHVXjXfeuO
         nz4gN35y8PtFjmFwd0eQyrb+TCRj4Y/lAmZCNfkwJkJ/L7iVxrtZZT+vnonF+Y1L2V2R
         SYdNIogRwFZ02gcEPFQQSatGc8CPiOmLGdGI6ROX4Hu2MtW5PEKSwBEatKmDT7AI4AN1
         x3ptGUkej2AqXg2Ezd31IIq/84Y5ADd4hupv1ja0Vc7k7L6y7KTVggmG7EglhvDFmlp8
         LLPc7dx6exNI1xKqoemZLWGoMplKVBt2Z2I+1Y7X6saUM+rKGxRMUHaC5YPbKMT11Rt+
         Ps4g==
X-Gm-Message-State: AFqh2kpOvNpqnWOAU34am+SjIDgOKBB1++DAdCVwe2zKEqFZF8jjHPSp
	9VXMPZIIu5kj7yJzj/oDZfQaBdbH45/XZJ8FkAY=
X-Google-Smtp-Source: AMrXdXtKtfyIHIAy9DY3ZIYSSiv/zG3pIbbt1g84Jp7c+CkFoQ7z00PLeCqxzQPiZoRBfCesZ0wSWA==
X-Received: by 2002:aa7:8a42:0:b0:582:34f2:20f1 with SMTP id n2-20020aa78a42000000b0058234f220f1mr5625625pfa.11.1672594707054;
        Sun, 01 Jan 2023 09:38:27 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.38.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:38:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/29] ruby: merge .inc into .bb
Date: Sun,  1 Jan 2023 07:37:37 -1000
Message-Id: <6302c21170f8c70b76bb11bac3d7b01fd62fe4d7.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175203

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


