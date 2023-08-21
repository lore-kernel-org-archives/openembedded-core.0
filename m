Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86797C3DA66
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 14:38:11 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.1005.1692628688908464365
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 07:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=da2W+XwX;
 spf=pass (domain: baylibre.com, ip: 209.85.128.53, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fef56f7222so3309165e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 07:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692628687; x=1693233487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ho9NpCqZx8gJA77u96WERoWp9NfMYshHetieBWX0I8=;
        b=da2W+XwXPM7EMrYpxERHe9VBfQpzZVir4gJ143NzMjwwNmLFUxxjbycpOnfbl2H+TV
         k7BPp9vKS9e0zxexxtiiKtnCv9cvn3XmWsQupmzZmdgKrEuGBg+7O8rGDG+ucl8heHFH
         aouPEK4PyEJQsn/RLyuo+yKI7w4cB7XD6p/aMNdWplwH+XjtR0RW236plgMngh65Bk6M
         9Fbf4rOlxQzyS6pvIdPwDHioOVMee/FaG5wG8oskYKNagRn9dNqHe0e1sgh0r1ZfxQg6
         AVYVMSoofrNvxQMqQkweAQIeB7TxtP4JC8910F2aaWG2kQ3gpzSYOsvrBTSIj/2AnMyC
         Xg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692628687; x=1693233487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Ho9NpCqZx8gJA77u96WERoWp9NfMYshHetieBWX0I8=;
        b=KSoMsEL2pCWk6gEGBnaf+gkFj0jiHajuGUObCMrYeZmO1OcxuDA+qf0GGh9o9CxvYb
         T3D2NyDCQjgocNHC7LF+l5/16n6SQ4u5Hlg2vsw0KEjj7uP83ZxbWYtNRcxbnu6XP3l3
         DxJw52/OAsevvgpUEtT4yP5cTQi1aAkz6bMkIlv4vqAYPRfmfeyuFC5jPuObOKq1ViET
         x53c/N0yxafDbhpC4lIc96dZzkhtm43JglannuRr8ejkN1phxX1g7LOvKG2x4f1Chp6u
         HV3ltKbc59sJo/rTraHpPNzcsQ7XHkN8RNbqHj76qeXetk9xnmbQUx16DVheLWOedW7f
         sFGw==
X-Gm-Message-State: AOJu0YwpWp+0DSBYhEcBQy3qwz5YIoK3ubjZC1nkRY3dhJ1sbGezgBGs
	5XAwKW1fpl6rDEKjhJR/7BBjOjsnj6n/VzrvCTYccg==
X-Google-Smtp-Source: AGHT+IEPuy+4xskSemwSbQ/Wh2DAdrmlOyGfHWZoSl2+25UfrKedq4bk4OFiwpGaZ62lfseEViWwbw==
X-Received: by 2002:a1c:7c07:0:b0:3fe:e85b:425d with SMTP id x7-20020a1c7c07000000b003fee85b425dmr3821084wmc.9.1692628687186;
        Mon, 21 Aug 2023 07:38:07 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:fd3b:9fed:e621:cc8f])
        by smtp.gmail.com with ESMTPSA id i14-20020a5d630e000000b0031980783d78sm12667558wru.54.2023.08.21.07.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 07:38:06 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v5 2/2] less: add ptest support
Date: Mon, 21 Aug 2023 16:38:01 +0200
Message-ID: <20230821143801.2797029-3-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821143801.2797029-1-jstephan@baylibre.com>
References: <20230821143801.2797029-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 14:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186447

add ptest support for less

root@qemux86-64:~# ptest-runner less
START: ptest-runner
2023-08-21T14:22
BEGIN: /usr/lib/less/ptest
TEST chinese1.lt
PASS: chinese1 (30 steps)
TEST colorbars.lt
PASS: colorbars (222 steps)
TEST github216.lt
PASS: github216 (143 steps)
TEST github265.lt
PASS: github265 (17 steps)
TEST github329.lt
PASS: github329 (28 steps)
TEST hdr-unicode.lt
PASS: hdr-unicode (164 steps)
TEST hdr-unicode1.lt
PASS: hdr-unicode (107 steps)
TEST proc-special.lt
PASS: proc-special (107 steps)
TEST seq200.lt
PASS: seq200 (18 steps)
TEST subsearch.lt
PASS: subsearch (59 steps)
TEST table-50x200.lt
PASS: table-50x200 (467 steps)
TEST utf8-2.txt.lt
PASS: utf8-2.txt (309 steps)
TEST version.c.lt
PASS: version.c (38 steps)
RAN  13 tests with 0 errors
DURATION: 184
END: /usr/lib/less/ptest
2023-08-21T14:25
STOP: ptest-runner
TOTAL: 1 FAIL: 0

[YOCTO #15073]

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-extended/less/files/run-ptest    |  3 +++
 meta/recipes-extended/less/less_643.bb        | 22 ++++++++++++++++++-
 3 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/less/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index bbbef5b0431..9160103cb0a 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -96,6 +96,7 @@ PTESTS_SLOW = "\
     glib-2.0 \
     gnutls \
     gstreamer1.0 \
+    less \
     libevent \
     libgcrypt \
     libmodule-build-perl \
diff --git a/meta/recipes-extended/less/files/run-ptest b/meta/recipes-extended/less/files/run-ptest
new file mode 100644
index 00000000000..42a2869c844
--- /dev/null
+++ b/meta/recipes-extended/less/files/run-ptest
@@ -0,0 +1,3 @@
+#! /bin/sh
+
+./runtest -l /usr/bin/less -t lesstest -O d lt/*
diff --git a/meta/recipes-extended/less/less_643.bb b/meta/recipes-extended/less/less_643.bb
index 008bbd5581a..67834bdd588 100644
--- a/meta/recipes-extended/less/less_643.bb
+++ b/meta/recipes-extended/less/less_643.bb
@@ -25,17 +25,37 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     "
 DEPENDS = "ncurses"
 
-SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
+           file://run-ptest \
+           "
 
 SRC_URI[sha256sum] = "2911b5432c836fa084c8a2e68f6cd6312372c026a58faaa98862731c8b6052e8"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
+inherit autotools ptest update-alternatives
+
+EXTRA_OEMAKE += " LESSTEST=1"
+
 inherit autotools update-alternatives
 
+do_compile_ptest () {
+        cd ${S}/lesstest
+        oe_runmake
+}
+
 do_install () {
         oe_runmake 'bindir=${D}${bindir}' 'mandir=${D}${mandir}' install
 }
 
+do_install_ptest () {
+        cp ${S}/lesstest/lesstest ${D}${PTEST_PATH}
+        cp ${S}/lesstest/runtest ${D}${PTEST_PATH}
+        cp ${S}/lesstest/lt_screen ${D}${PTEST_PATH}
+        cp -r ${S}/lesstest/lt ${D}${PTEST_PATH}
+}
+
+RDEPENDS:${PN}-ptest:append = " perl-module-getopt-std perl-module-cwd locale-base-en-us"
+
 ALTERNATIVE:${PN} = "less"
 ALTERNATIVE_PRIORITY = "100"
-- 
2.41.0


