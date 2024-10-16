Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8051CD2A537
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 17:17:28 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.28604.1729099039508687557
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Oct 2024 10:17:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OBPARHpU;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: mail2szahir@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71e6f1a5a19so4982b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 10:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729099039; x=1729703839; darn=lists.openembedded.org;
        h=message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/Y1N4q9l85aRZqzUAPE9323ouPVvXqGzK6Q95sQccA=;
        b=OBPARHpUDxUoKoNISoJ9YbMHrkjPydvT5rr83BfYGgMtfUAExTzvXQcf4Wivb+9SUN
         NatnRXpHatFYOT1KNu97+Y9Uz/ccTkS+IuRJzgv5Em3oTbNfOVNP4SkGDxKQ+ROxVXhw
         nUI7OBbP29fjDIFmrQJ5bygTtOtMsPxdwp4oRAjqooVujqLpjHIVPv2Ty7dK0XukSF2U
         ON08HrsHNsp1d+NC1DZ6POdropfRIwybf7HsC1OUUeAAd0YFSG4ZkZ/iWywE9heQR+ab
         +q2VHrAbpl4APfI8o6IvzIObtXEPlw+QZyK1sjJPYy5gRODU7TUqkp0o45S/wdg5r/T8
         9ywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729099039; x=1729703839;
        h=message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V/Y1N4q9l85aRZqzUAPE9323ouPVvXqGzK6Q95sQccA=;
        b=jA+W6RfUWacR7SIDUl40Mxwcpna9+O4BrHGNjva0gHyeTTLA3Vr2xs9H6JO1w2ehSg
         f1Oizz4gtjPjZIdPu2oX4MdUo61PVYEmveLe5EenHdrPo1u8v0CsvkTosTnKJxGvWMXE
         C774uXL4fszVMeO1VU6UGjl5JIF4+DkVlI9oq1KQDlD63qCiq+ZAVc250F4+iZfP7dYK
         fg0Rye3aHKKOXzbr5F1T6Fz3rUKUZwDoa6xVDOGvNCZF29Egdk1x8vlWP1uLXLo62ki+
         SxShD08VzDbTyDNVoynT89mPPJzVqpqH8fUcKPPQhLBhG/AFDhE4ipTH7iMN4rwcPIEx
         xptg==
X-Gm-Message-State: AOJu0YwOezfHWb0X3rEg1vb/O5pyy+GBq+Xn0IOEWmnpGpRN2NVGfFVL
	N8lb5blK+pMBBGaya+yTvm2Gr+38NWP6cPMgV9y041FNJx5OBDOmJWkTRQ==
X-Google-Smtp-Source: AGHT+IHiTV+NjmYTbpqMhmmNa8Zjd48ZlXo2iwJE3egvygaPL6HziZgAljKpBFckP6WBJCvYtWXXrA==
X-Received: by 2002:aa7:8883:0:b0:71e:47a2:676 with SMTP id d2e1a72fcca58-71e7da10d05mr6471272b3a.6.1729099038649;
        Wed, 16 Oct 2024 10:17:18 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:e02e:c09b:1929:4b8c:ee28:4102])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e774a2a64sm3338944b3a.123.2024.10.16.10.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 10:17:18 -0700 (PDT)
From: aszh07 <mail2szahir@gmail.com>
To: openembedded-core@lists.openembedded.org,
	zahir.basha@kpit.com
Subject: [OE-core][master][PATCH] alsa-lib: enabling ptest for alsa-lib component
Date: Wed, 16 Oct 2024 22:46:52 +0530
Message-Id: <20241016171652.5138-1-mail2szahir@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 17:17:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205969

This change adds ptest for alsa-lib.

1) Removed the test suite execution 'make check-TESTS' call using 'sed' command.

2) Compiled the test directory source code using "oe_runmake check" command.

3) Copied all the required binaries into PTEST_PATH using do_install_ptest()
 function.

Signed-off-by: aszh07 <mail2szahir@gmail.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../alsa/alsa-lib_1.2.12.bb                   | 23 +++++++++++++++++--
 meta/recipes-multimedia/alsa/files/run-ptest  | 14 +++++++++++
 3 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 4a48188562..f0ffe11347 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -5,6 +5,7 @@
 #
 PTESTS_FAST = "\
     acl \
+    alsa-lib \
     apr-util \
     attr \
     babeltrace \
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb
index d9136052b7..1aa19dac6d 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb
@@ -9,10 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     file://src/socket.c;md5=285675b45e83f571c6a957fe4ab79c93;beginline=9;endline=24 \
                     "
 
-SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
+SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
+           file://run-ptest \
+	  "
 SRC_URI[sha256sum] = "4868cd908627279da5a634f468701625be8cc251d84262c7e5b6a218391ad0d2"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
 
 EXTRA_OECONF += " \
     ${@bb.utils.contains('TARGET_FPU', 'soft', '--with-softfloat', '', d)} \
@@ -42,3 +44,20 @@ RREPLACES:alsa-conf = "alsa-conf-base"
 RCONFLICTS:alsa-conf = "alsa-conf-base"
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_compile_ptest() {
+        sed -i 's/^.*$(MAKE) $(AM_MAKEFLAGS) check-TESTS.*$/ /' ${S}/test/lsb/Makefile.in
+        oe_runmake check
+}
+
+do_install_ptest:append() {
+    for f in control client_event_filter namehint
+    do
+        install -m 0755 "${B}/test/.libs/$f" "${D}${PTEST_PATH}";
+    done
+
+    for f in config midi_event
+    do
+        install -m 0755 "${B}/test/lsb/.libs/$f" "${D}${PTEST_PATH}";
+    done
+}
diff --git a/meta/recipes-multimedia/alsa/files/run-ptest b/meta/recipes-multimedia/alsa/files/run-ptest
new file mode 100644
index 0000000000..8fbf9f140a
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/files/run-ptest
@@ -0,0 +1,14 @@
+#!/bin/sh
+set -eux
+
+for t in config control midi_event client_event_filter client_event_filter
+do
+    if "./$t" > "alsa-lib_$t.log" 2>&1
+    then
+        echo "PASS: $t"
+    else
+        echo "FAIL: $t"
+        cat "alsa-lib_$t.log"
+    fi
+    rm "alsa-lib_$t.log"
+done
-- 
2.17.1


