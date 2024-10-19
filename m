Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 123C4D3E1B2
	for <webhook@archiver.kernel.org>; Sat, 19 Oct 2024 06:48:41 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.2032.1729320518138743706
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 23:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BhTvsJwZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: mail2szahir@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71e7086c231so2182563b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 23:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729320517; x=1729925317; darn=lists.openembedded.org;
        h=message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zq30Uo4pNpeXzTr2JJNooI5bKxpiArnHSDmVIpTWnMc=;
        b=BhTvsJwZsj1ZsQmamz+bN2KPouhkfmHxB1Ib5AdLujvkdwqEJRY8burbk9BMTqmm1J
         jfMKM002ufs7l3OrvoaJnjMelrVcJJYzH4nHy9qBRh7UplEDg4nRHqpOC6iiwl5q4O29
         eR9YkTeIHptfIfCKsOFc1/W1HZrxr5uwAyrppx+zTLdqINySG5UnucFXX76tSKss01Jl
         SlxYwIUSHlbObpMi7AQKpgqF6OLQfROLLmDFoED90T6WHzqSMgKOn4uLfu2+PBfp3Eku
         pCvfgc9P3AVxDfFydcotty/mUiYRNvAiy8ci46WgEFfG9kGAhawCJNHNLPLD7gtSrt4X
         ZKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729320517; x=1729925317;
        h=message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zq30Uo4pNpeXzTr2JJNooI5bKxpiArnHSDmVIpTWnMc=;
        b=s0NRSzYfZAwn/4qwRy7yA/Y7IW0sDk8aTldQmUVZ08M1k48AlQOVQAGeECcGbSmQMl
         qsxRCWbrdw9GKvjy/pnhUjnRp2C//hHCBZO658eVefYSodjDB1aB2q7w9E4INlhIWkwY
         bxGF/9AJmPXVE7x/D6ji7QbH21jMniMlMqmDvx+R06uYcAvUnV+Zu3+PrNOf6U83dVKf
         +6vPJx6kbPYbpRaEgEJkIGMFczV8mEK/+AzOFXTpARcwtbZCChauU9nhLDsaydXwHxLf
         UXh0PZggLO6A4abIMOam7YGDyyBOD4lxPVp23oZTejCGMnTIh9NNFhHHHQWdF5t9MG0a
         GCdw==
X-Gm-Message-State: AOJu0YwerPwE+mPa9l79y9N7D9g9gk+rMagUWlMmtKCwCBd1Ti50eSJE
	VoeOJv+katCAAsVifFxIVS+NA5/kdbJzPauodZucmk9NALY2kOToeA6ntg==
X-Google-Smtp-Source: AGHT+IEUrcoT16iKUKO4IaAKRvTLamTX136C7TaWW0i3ZReu/EN0VJGIYY/zB4E/OMUAPg8tA/5+gg==
X-Received: by 2002:a05:6a00:2d83:b0:71e:5d1d:1aa0 with SMTP id d2e1a72fcca58-71ea3192b02mr7787269b3a.6.1729320517067;
        Fri, 18 Oct 2024 23:48:37 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:e02e:c09b:7d6a:5240:4fe9:4084])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea345f93fsm2472812b3a.181.2024.10.18.23.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 23:48:36 -0700 (PDT)
From: aszh07 <mail2szahir@gmail.com>
To: openembedded-core@lists.openembedded.org,
	zahir.basha@kpit.com
Subject: [OE-core][scarthgap][PATCH] alsa-lib: enabling ptest for alsa-lib component
Date: Sat, 19 Oct 2024 12:18:17 +0530
Message-Id: <20241019064817.22938-1-mail2szahir@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Oct 2024 06:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206081

This change adds ptest for alsa-lib.

1) Removed the test suite execution 'make check-TESTS' call using 'sed' command.

2) Compiled the test directory source code using "oe_runmake check" command.

3) Copied all the required binaries into PTEST_PATH using do_install_ptest()
 function.

Signed-off-by: aszh07 <mail2szahir@gmail.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../alsa/alsa-lib/run-ptest                   | 15 +++++++++++++
 .../alsa/alsa-lib_1.2.11.bb                   | 21 ++++++++++++++++++-
 3 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 5975db25cc..4fe5ce34e4 100644
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
diff --git a/meta/recipes-multimedia/alsa/alsa-lib/run-ptest b/meta/recipes-multimedia/alsa/alsa-lib/run-ptest
new file mode 100644
index 0000000000..b991de145f
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/run-ptest
@@ -0,0 +1,15 @@
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
+
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb
index c212b17aa3..8b4f3baecc 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb
@@ -11,10 +11,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
            file://0001-topology-correct-version-script-path.patch \
+           file://run-ptest \
            "
 SRC_URI[sha256sum] = "9f3f2f69b995f9ad37359072fbc69a3a88bfba081fc83e9be30e14662795bb4d"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
 
 EXTRA_OECONF += " \
     ${@bb.utils.contains('TARGET_FPU', 'soft', '--with-softfloat', '', d)} \
@@ -44,3 +45,21 @@ RREPLACES:alsa-conf = "alsa-conf-base"
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
+
-- 
2.17.1


