Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E28E95A7E
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 22:26:02 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.27698.1696717560643468592
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Oct 2023 15:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bhFs3rG8;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-27b0d0c0ba0so2564794a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 15:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696717560; x=1697322360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NY9ma/wsJhNQYWBVeegq+Myz+ugkMKv2iA0gl1CNMxU=;
        b=bhFs3rG8zZknfXXQEiR/zPCNWXJTa4teMPiwVFzxbGm4YFurhDhV3a1fwEjsPmoyz7
         ss3xZYnKNP2Jo6W4nquNqWTrDU3YhbZxe4XxQyQoqr8BONO/pY5i98pWgTg/axnM2nQu
         oKmBWXSc1BtJIEudkG6UnPCsgQ7paQsEMso96N6qY9miXtPQ3cqfIJTimusfH7I0vmAc
         78oe82GpsaGnKENnlfwI9qDIqsha7zrkuusnL/hCDQDx8Kdyuzqc3zVqB69O3G2Ony2H
         FUzsarhMRIcrIva79+Rs67GFwUtieZawa6jRjQaiYlwENyTygq0em07Ul30VJDRG7l3h
         HNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696717560; x=1697322360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NY9ma/wsJhNQYWBVeegq+Myz+ugkMKv2iA0gl1CNMxU=;
        b=ajMR8hJPxNuMJ5IsGE2jr67QQmOHXZ10reni2W1fI7OvxKy5LZtxXwH9Z/MbMN4jXF
         i+EMxp3D2VlD+nbGGlTZ9DTKsVEEa1Aa+8aUTuLmSTxo9Nmd0eNl0ZtUIJ1+WLZSzwsu
         X7YfOqR4X3YKaK9c687oFnwuHBSKB2t68QMXdrs8Z8CxplwBftuUKL4tVt8fuAzx0dwq
         qjt3KywsDUwbFaQanY66+ZH6Re5Uyjg81H0MavlqfzHwkl+o+0onQHR33R3FzyYzDOl3
         60hle5iIvp+1IteOT2hc4Xz+IJrTXeHFxggd+otKnws5KqVX+Zt8N9xYKl1tjLXEa0FB
         9lTg==
X-Gm-Message-State: AOJu0Yw5PYMNZZeV/cs9ejgH0tBrdiM/Z/qEX3NpCyoukKqH92LLB1bQ
	Plypj2KtUcjQa/s/GF495dzD0ax/ltEwF53y9g8=
X-Google-Smtp-Source: AGHT+IEHV6L03jU0UOZppTTe9Rz/jNoOmAgmt93WxDrXpXgZJ82hVR6e+1TXILl92OkIH99VGNBgrA==
X-Received: by 2002:a17:90a:bd05:b0:277:81f7:8169 with SMTP id y5-20020a17090abd0500b0027781f78169mr11420227pjr.9.1696717559794;
        Sat, 07 Oct 2023 15:25:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj15-20020a170903048f00b001b8c6890623sm6424076plb.7.2023.10.07.15.25.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 15:25:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 18/19] tcl: Add a way to skip ptests
Date: Sat,  7 Oct 2023 12:25:14 -1000
Message-Id: <c6f4728d4e483067e353e91f5fb20ed552e6c911.1696702947.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696702947.git.steve@sakoman.com>
References: <cover.1696702947.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 22:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188819

From: Khem Raj <raj.khem@gmail.com>

Some tests hardcode assumptions on locales, which may not be present in
musl systems e.g., therefore add a way to skip such tests using -skip
option.

Skip unixInit-3* test on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit fa66f1cee2d88c2276442e8b4aaeccde5490f9ea)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest | 4 ++--
 meta/recipes-devtools/tcltk/tcl_8.6.13.bb | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-devtools/tcltk/tcl/run-ptest
index a62b703082..5b9127784e 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -3,9 +3,9 @@
 # clock.test needs a timezone to be set
 export TZ="Europe/London"
 export TCL_LIBRARY=library
-
+SKIPPED_TESTS=
 for i in `ls tests/*.test | awk -F/ '{print $2}'`; do
-    ./tcltest tests/all.tcl -file $i >$i.log 2>&1
+    ./tcltest tests/all.tcl -file $i -skip "$SKIPPED_TESTS" >$i.log 2>&1
     grep -q -F -e "Files with failing tests:" -e "Test files exiting with errors:" $i.log
     if [ $? -eq 0 ]; then
         echo "FAIL: $i"
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.13.bb b/meta/recipes-devtools/tcltk/tcl_8.6.13.bb
index 921ea7a01d..677a5822bd 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.13.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.13.bb
@@ -90,6 +90,11 @@ do_install_ptest() {
 	cp -r ${S}/tests ${D}${PTEST_PATH}
 }
 
+do_install_ptest:append:libc-musl () {
+	# Assumes locales other than provided by musl-locales
+	sed -i -e 's|SKIPPED_TESTS=|SKIPPED_TESTS="unixInit-3*"|' ${D}${PTEST_PATH}/run-ptest
+}
+
 # Fix some paths that might be used by Tcl extensions
 BINCONFIG_GLOB = "*Config.sh"
 
-- 
2.34.1


