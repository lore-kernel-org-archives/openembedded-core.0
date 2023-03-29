Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25558C77B60
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 00:26:02 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.13145.1680049556888063973
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 17:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lahQj4mA;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id le6so13325263plb.12
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 17:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680049556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qsJ9SHk/YTvWR715pPdnC0dao29FIiCNPoZYE6SNQFo=;
        b=lahQj4mAz1oZvVX3HSk/SLzzNr16jb86RZdx+5ukdbfcgTvnaqWr6hPlF6WA6wVVSH
         PDo1ykRHossUlCSNbbi4FvA5XGqBg+W997Q96xslpNdlwcgip5oCAYL5VMZ2/GpPpY8t
         GT9cP6wCxwHJKah11N2z212ozqyzyZGTb07Vk7h4gO0o+X+PFwYiT5MaBRKx+j7Mq8e+
         qmDb4TUHChKMxzJimgcuIf2WgqRCi7tLUobYsxJesS2R+bJ1jAnUHZCoz9+ImceR+Ove
         C0yQf1OiSmnICLQMZALZwKMiFVL5yzh5uz9ymqcgnvRMLO9+JEeXwfr693Lky0XbUWlb
         hIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680049556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qsJ9SHk/YTvWR715pPdnC0dao29FIiCNPoZYE6SNQFo=;
        b=PKCBKnbPMw95tfCwGJRVTIhVxort8aQcJ5FjAo/Uw5L3WzAnRBQOL6gNdODjYYGE8m
         zTxbQQBp2U4cuFs7j+hzHHvx2/ojb4Y7WAiMQlO4JigvedeB0UIRJRQbd0+yU741L1IO
         g09G5WZrNnnIgSlZg/H9L2PV2lnlHDjBr1c5Pijos7IIrbwAdkneJTeybU5ck23UZg9Z
         OAkpQ/BBfp17stc+MQzvncogTgmmef4M/eLFBK4WrN8UrvKo4oyWqtdbJ+KSnfHoT8ne
         gqqFiDroGo8OR8k81cvcJ7wSkF4H6DnN4P0r10x8rkIvGqp75ZupMYsMtzrUq6YlgJ6h
         RKKw==
X-Gm-Message-State: AO0yUKXwwQmRfDRjngXq6J0S1f6oIuBtS/7qbJIlC7InTX1iHcOwkRXM
	/ZzzWtuygGFmjqUkSt5tCU/S2hsPAcOXZQ==
X-Google-Smtp-Source: AK7set8FBZ1ZczshH6uXGlzmc6dAHRHakPEK5NSROoVgsC+4aJ5tRGPW4IRsxGIzaqrDE3Oh9kVMNg==
X-Received: by 2002:a05:6a20:ba91:b0:db:b7:fe3f with SMTP id fb17-20020a056a20ba9100b000db00b7fe3fmr13280341pzb.10.1680049555115;
        Tue, 28 Mar 2023 17:25:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::bed3])
        by smtp.gmail.com with ESMTPSA id q20-20020a62e114000000b0058d92d6e4ddsm21646841pfh.5.2023.03.28.17.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 17:25:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/3] libstemmer: Bring recipe from meta-oe
Date: Tue, 28 Mar 2023 17:25:51 -0700
Message-Id: <20230329002552.2260584-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230329002552.2260584-1-raj.khem@gmail.com>
References: <20230329002552.2260584-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 00:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179255

Needed by appstream-glib

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add missing patch
v3: Refresh patch to 2.2.0

 .../libstemmer/0001-Build-so-lib.patch        | 57 +++++++++++++++++++
 .../libstemmer/libstemmer_2.2.0.bb            | 37 ++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch
 create mode 100644 meta/recipes-support/libstemmer/libstemmer_2.2.0.bb

diff --git a/meta/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch b/meta/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch
new file mode 100644
index 0000000000..2529d5d9d1
--- /dev/null
+++ b/meta/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch
@@ -0,0 +1,57 @@
+From eacc9e9c62a3857ce1e2e24b81fc22d8ae91f422 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Thu, 9 May 2019 22:06:48 +0200
+Subject: [PATCH] Build so-lib
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Stolen from [1]
+
+[1] https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/snowball/trunk/dynamiclib.diff
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ GNUmakefile           | 7 +++++--
+ libstemmer/symbol.map | 6 ++++++
+ 2 files changed, 11 insertions(+), 2 deletions(-)
+ create mode 100644 libstemmer/symbol.map
+
+--- a/GNUmakefile
++++ b/GNUmakefile
+@@ -170,12 +170,12 @@ C_OTHER_OBJECTS = $(C_OTHER_SOURCES:.c=.
+ JAVA_CLASSES = $(JAVA_SOURCES:.java=.class)
+ JAVA_RUNTIME_CLASSES=$(JAVARUNTIME_SOURCES:.java=.class)
+ 
+-CFLAGS=-O2 -W -Wall -Wmissing-prototypes -Wmissing-declarations
++CFLAGS=-O2 -fPIC -W -Wall -Wmissing-prototypes -Wmissing-declarations
+ CPPFLAGS=
+ 
+ INCLUDES=-Iinclude
+ 
+-all: snowball$(EXEEXT) libstemmer.a stemwords$(EXEEXT) $(C_OTHER_SOURCES) $(C_OTHER_HEADERS) $(C_OTHER_OBJECTS)
++all: snowball$(EXEEXT) libstemmer.a libstemmer.so stemwords$(EXEEXT) $(C_OTHER_SOURCES) $(C_OTHER_HEADERS) $(C_OTHER_OBJECTS)
+ 
+ algorithms.mk: libstemmer/mkalgorithms.pl libstemmer/modules.txt
+ 	libstemmer/mkalgorithms.pl algorithms.mk libstemmer/modules.txt
+@@ -225,6 +225,9 @@ libstemmer/libstemmer.o: libstemmer/modu
+ libstemmer.a: libstemmer/libstemmer.o $(RUNTIME_OBJECTS) $(C_LIB_OBJECTS)
+ 	$(AR) -cru $@ $^
+ 
++libstemmer.so: libstemmer/libstemmer.o $(RUNTIME_OBJECTS) $(C_LIB_OBJECTS)
++	$(CC) $(CFLAGS) -shared $(LDFLAGS) -Wl,-soname,libstemmer.so.0,-version-script,libstemmer/symbol.map -o $@.0.0.0 $^
++
+ examples/%.o: examples/%.c
+ 	$(CC) $(CFLAGS) $(INCLUDES) $(CPPFLAGS) -c -o $@ $<
+ 
+--- /dev/null
++++ b/libstemmer/symbol.map
+@@ -0,0 +1,6 @@
++SB_STEMMER_0 {
++    global:
++        sb_stemmer_*;
++    local:
++        *;
++};
diff --git a/meta/recipes-support/libstemmer/libstemmer_2.2.0.bb b/meta/recipes-support/libstemmer/libstemmer_2.2.0.bb
new file mode 100644
index 0000000000..be2935a385
--- /dev/null
+++ b/meta/recipes-support/libstemmer/libstemmer_2.2.0.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Snowball compiler and stemming algorithms"
+HOMEPAGE = "https://snowballstem.org/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=19139aaf3c8c8fa1ca6edd59c072fb9f"
+
+DEPENDS:append:class-target = " ${BPN}-native"
+
+SRC_URI = "git://github.com/snowballstem/snowball.git;branch=master;protocol=https \
+           file://0001-Build-so-lib.patch \
+           "
+SRCREV = "48a67a2831005f49c48ec29a5837640e23e54e6b"
+S = "${WORKDIR}/git"
+
+LIBVER = "0.0.0"
+
+inherit lib_package
+
+do_compile:prepend:class-target() {
+    # use native tools
+    sed -i 's:./snowball :snowball :g' ${S}/GNUmakefile
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 755 ${S}/snowball ${D}${bindir}
+    install -m 755 ${S}/stemwords ${D}${bindir}
+
+    install -d ${D}${libdir}
+    install -m 755 ${S}/libstemmer.so.${LIBVER} ${D}${libdir}/
+    ln -s libstemmer.so.${LIBVER} ${D}${libdir}/libstemmer.so.0
+    ln -s libstemmer.so.${LIBVER} ${D}${libdir}/libstemmer.so
+
+    install -d ${D}${includedir}
+    install -m 644 ${S}/include/*.h ${D}${includedir}
+}
+
+BBCLASSEXTEND = "native"
-- 
2.40.0


