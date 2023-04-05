Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9074FC761AF
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 02:30:05 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.121231.1680661799998490271
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 19:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=VpHtwhRe;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id f22so28994590plr.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 19:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680661799; x=1683253799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XW2jZYLN0F7OuoIm2I92pnB4BoATWmpbEOx/MyG2Mvc=;
        b=VpHtwhRebFeD3s8vyrhVYiKB3HsgVlGEbnibwWOCofO3DDCM+02i/CmKDRL4XyFfA6
         uzO1LfVbN2EXz1JFKkr2eDxEWu1ohxuaJJGbkQn9a2We/5jT3V92DwcowqXUz3qQ+zrq
         s2d2krVe1E9tcHXac+qpZl6V8It6rrIfs1yKZ+YXQGUx5eHYxmmB+5zbir7B0v6D34kg
         +dkkJW4VfTlKt6JQf5iYbwkPV/p3mnXCAvvi+E7k++GRLDlT3tPAPRlvd6X0gQfhP2SW
         tg/NcS4MJbAbVPnaB/U5lE196hW3Qi6d50auAYVs8bLbSgoErD1CPiIHfUm6k9QTRqjs
         O0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680661799; x=1683253799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XW2jZYLN0F7OuoIm2I92pnB4BoATWmpbEOx/MyG2Mvc=;
        b=TwslmgipKMCdwwpxTA5lqxUxv863iR23hCyIXCBjCGNsU05Of1Dey9woRVDDi6if8d
         4dlM8yImYEr99W+fQ9Usll/6xuqX8KJt5Yq2alfQ4fvt/kn1ZNeNGeyc9hPbrQYApEwg
         6nvA5AsZCA6Y/5XC6Sj2Puu6wOAANwHbZn4wXVqjY4SGNFcL5b7FjnxueBvr/1nes5ze
         wuHs7EV04lh4BS8k7oCgRmoqTasL/L9LDN198nQHUvMTp0Hyf7VCz4I+5kOq5t6deBfp
         nyDZzAc1l2lNmi1yY56s0xogs6q4Ry5jVViJQw55V+h0dHjBEjn/9TYcxiRfM3NWlc9j
         9yEA==
X-Gm-Message-State: AAQBX9dZk9DRjWUEC/RMeodtNzjwR2reGffxeqgHSjsA6R+CMJDRzX1E
	6uatCslW8YtiyWGPYJi//sHyU1hryYOhkFYOdJY=
X-Google-Smtp-Source: AKy350Z56cWWO2xGgyf9LS6oo0qxdXsIQEEBInztKfckabWMIqjl9x3kgE6jl1JUzzFFmU/5LtnsQA==
X-Received: by 2002:a17:90a:195a:b0:23f:962e:825d with SMTP id 26-20020a17090a195a00b0023f962e825dmr1142268pjh.1.1680661798761;
        Tue, 04 Apr 2023 19:29:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id a17-20020a170902ee9100b001a24cded097sm8937702pld.236.2023.04.04.19.29.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 19:29:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/6] json-c: Add ptest for json-c
Date: Tue,  4 Apr 2023 16:29:31 -1000
Message-Id: <7d588d0727d49dcf04d7c3d8a4ec23ca2f6cc56d.1680661617.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680661617.git.steve@sakoman.com>
References: <cover.1680661617.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 02:30:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179716

From: Simone Weiss <simone.weiss@elektrobit.com>

Adapt json-c recipe to compile and deploy a ptest for json-c.
Also add a small script for executing the tests.
All tests were successful on a trial and took around 20 seconds.

Signed-off-by: Simone Weiß <simone.weiss@elektrobit.com>
Signed-off-by: Kai Tomerius <kai.tomerius@elektrobit.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 757a5fbdeed58573c40d6e21475cc516aa49fd1c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-devtools/json-c/json-c/run-ptest | 20 +++++++++++++++++++
 meta/recipes-devtools/json-c/json-c_0.15.bb   | 16 +++++++++++++--
 3 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/json-c/json-c/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index a65c048984..5bcff83093 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -22,6 +22,7 @@ PTESTS_FAST = "\
     gettext-ptest \
     glib-networking-ptest \
     gzip-ptest \
+    json-c-ptest \
     json-glib-ptest \
     libconvert-asn1-perl-ptest \
     liberror-perl-ptest \
diff --git a/meta/recipes-devtools/json-c/json-c/run-ptest b/meta/recipes-devtools/json-c/json-c/run-ptest
new file mode 100644
index 0000000000..9ee6095ea2
--- /dev/null
+++ b/meta/recipes-devtools/json-c/json-c/run-ptest
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+# This script is used to run json-c test suites
+cd tests
+
+ret_val=0
+for i in test*.test; do
+    # test_basic is not an own testcase, just
+    # contains common code of other tests
+    if [ "$i" != "test_basic.test" ]; then
+        if ./$i > json-c_test.log 2>&1 ; then
+            echo PASS: $i
+        else
+            ret_val=1
+            echo FAIL: $i
+        fi
+    fi
+done
+
+exit $ret_val
diff --git a/meta/recipes-devtools/json-c/json-c_0.15.bb b/meta/recipes-devtools/json-c/json-c_0.15.bb
index a4673a2f0e..7cbed55b3b 100644
--- a/meta/recipes-devtools/json-c/json-c_0.15.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.15.bb
@@ -4,7 +4,10 @@ HOMEPAGE = "https://github.com/json-c/json-c/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 
-SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz"
+SRC_URI = " \
+    https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
+    file://run-ptest \
+"
 
 SRC_URI[sha256sum] = "b8d80a1ddb718b3ba7492916237bbf86609e9709fb007e7f7d4322f02341a4c6"
 
@@ -13,6 +16,15 @@ UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
 
 RPROVIDES:${PN} = "libjson"
 
-inherit cmake
+inherit cmake ptest
+
+do_install_ptest() {
+    install -d ${D}/${PTEST_PATH}/tests
+    install ${B}/tests/test* ${D}/${PTEST_PATH}/tests
+    install ${S}/tests/*.test ${D}/${PTEST_PATH}/tests
+    install ${S}/tests/*.expected ${D}/${PTEST_PATH}/tests
+    install ${S}/tests/test-defs.sh ${D}/${PTEST_PATH}/tests
+    install ${S}/tests/valid*json ${D}/${PTEST_PATH}/tests
+}
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


