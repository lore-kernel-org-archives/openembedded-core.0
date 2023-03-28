Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B18C76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 23:56:31 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.12334.1680047791381135378
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 16:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z+YYspOe;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id l7so12430425pjg.5
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 16:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680047790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YLy5mPhXJkujk9fg23btwVIkrL1eNwAYsUahTZrdNXI=;
        b=Z+YYspOe4/cJ1cwSICOVGEjl58cCV/SXPHqAIGp7yuOMzRA3vJu64UV+GyohH3FAfh
         m4ZbRWQftZ7uD8vznlMvmhZJM/n+KH88Jp1qfoIjFgPh8Uosde7A7b/sXZiom2ZQEvSs
         7k9q+E/iNFoyM6univfs9i0x9srpLS00zSgsK/GG9CZJsj3dCWZzEPepknyDJ6SWnhFl
         ioI/fM7RNpzIjdHetdSEkj4ASW2Mkwht+0uJ5ac365eUU2hyiJ+slc3fm7B7T/hrO7jB
         srGabFqATaXTJ5ONY084W5CXoZZEvjzFqmdwmY0y7dysGiOICXdcazA3UcITATtCB/2f
         6J8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680047790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YLy5mPhXJkujk9fg23btwVIkrL1eNwAYsUahTZrdNXI=;
        b=hdwlNIYEd8GXP85XlQXUG9011P5oB+cnS8Sm2F3D83f8S1v930os4+mtKt4EqYvcqG
         3qzBiN5SVJOYKA6AApu1Euh68oeijgoC0dBYfXUAywvX7bWoUtEJZ43NmOLcz/DIzVyf
         JdYuroK3kFUeNJgwL2c6Di64CHlsNhctiD6n1+9bwyP5ZSIy7XBrAY7D8/7YB3DEkP46
         nfm74LT4ew1sjiuY1KAyO0vmk+63WuJLDRGjwfUlU6lXyzMtXEsPFgOryb0AwkqZZV6w
         1MWCyuBwnRkbRnNwTCu8vA8uOLM0/Cerm7I98GWbN3eLc3H0lhEBs8QN5viBKVzpOH4S
         IbCA==
X-Gm-Message-State: AAQBX9fbWNtLAQCdzp3q7EGSduQE0rM/WvlOOM3Ck94Ia/yuR+8UpV5p
	svNdwMXhTh7uvqD/4zslIfZ1ND7NZeTsbw==
X-Google-Smtp-Source: AKy350aM16d1KmqYbp5U5UZjLx4xRJg490GZSlrsQGTembfTS/yOVDjKE9supS/6zJpPMt1JFFgKqQ==
X-Received: by 2002:a17:90a:5646:b0:237:c52f:a54d with SMTP id d6-20020a17090a564600b00237c52fa54dmr271340pji.21.1680047790398;
        Tue, 28 Mar 2023 16:56:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::bed3])
        by smtp.gmail.com with ESMTPSA id gx3-20020a17090b124300b002311c4596f6sm95940pjb.54.2023.03.28.16.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 16:56:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 3/3] libstemmer: Bring recipe from meta-oe
Date: Tue, 28 Mar 2023 16:56:28 -0700
Message-Id: <20230328235628.2106219-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 23:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179253

Needed by appstream-glib

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add missing patch

 .../libstemmer/0001-Build-so-lib.patch        | 63 +++++++++++++++++++
 .../libstemmer/libstemmer_2.2.0.bb            | 37 +++++++++++
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch
 create mode 100644 meta/recipes-support/libstemmer/libstemmer_2.2.0.bb

diff --git a/meta/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch b/meta/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch
new file mode 100644
index 0000000000..37c5c3dc02
--- /dev/null
+++ b/meta/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch
@@ -0,0 +1,63 @@
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
+[1] https://aur.archlinux.org/cgit/aur.git/commit/dynamiclib.patch?h=snowball-git&id=a9cbf4f42f3661e4b8f791cd4374233821716ea1
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
+diff --git a/GNUmakefile b/GNUmakefile
+index cbd6ff7..a85230b 100644
+--- a/GNUmakefile
++++ b/GNUmakefile
+@@ -162,10 +162,10 @@ C_OTHER_OBJECTS = $(C_OTHER_SOURCES:.c=.o)
+ JAVA_CLASSES = $(JAVA_SOURCES:.java=.class)
+ JAVA_RUNTIME_CLASSES=$(JAVARUNTIME_SOURCES:.java=.class)
+ 
+-CFLAGS=-O2 -W -Wall -Wmissing-prototypes -Wmissing-declarations
++CFLAGS=-O2 -fPIC -W -Wall -Wmissing-prototypes -Wmissing-declarations
+ CPPFLAGS=-Iinclude
+ 
+-all: snowball libstemmer.o stemwords $(C_OTHER_SOURCES) $(C_OTHER_HEADERS) $(C_OTHER_OBJECTS)
++all: snowball libstemmer.o libstemmer.so stemwords $(C_OTHER_SOURCES) $(C_OTHER_HEADERS) $(C_OTHER_OBJECTS)
+ 
+ clean:
+ 	rm -f $(COMPILER_OBJECTS) $(RUNTIME_OBJECTS) \
+@@ -212,6 +212,9 @@ libstemmer/libstemmer.o: libstemmer/modules.h $(C_LIB_HEADERS)
+ libstemmer.o: libstemmer/libstemmer.o $(RUNTIME_OBJECTS) $(C_LIB_OBJECTS)
+ 	$(AR) -cru $@ $^
+ 
++libstemmer.so: libstemmer/libstemmer.o $(RUNTIME_OBJECTS) $(C_LIB_OBJECTS)
++	$(CC) $(CFLAGS) -shared $(LDFLAGS) -Wl,-soname,libstemmer.so.0,-version-script,libstemmer/symbol.map -o $@.0.0.0 $^
++
+ stemwords: $(STEMWORDS_OBJECTS) libstemmer.o
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^
+ 
+diff --git a/libstemmer/symbol.map b/libstemmer/symbol.map
+new file mode 100644
+index 0000000..7a3d423
+--- /dev/null
++++ b/libstemmer/symbol.map
+@@ -0,0 +1,6 @@
++SB_STEMMER_0 {
++    global:
++        sb_stemmer_*;
++    local:
++        *;
++};
+-- 
+2.20.1
+
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


