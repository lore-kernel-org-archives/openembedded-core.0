Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 035B9C433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 19:49:32 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web09.949.1652730567989514900
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 12:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P9qpTzCV;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id ch13so30596682ejb.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 12:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y9/N0l0kbpwj5WOfd6oS8v0HRW0ZurOme01HGXcBfIA=;
        b=P9qpTzCVsAGZ+DaAf6XYzNZLGXgFJpLSkdontGgtKHzXnKa5DrJic88scWKUWfM/zF
         f4npOal/Dg7Pe6cvlKyCfjHEmmndffkgYNmcA0gmxtPzhPQNO2SW6zP9E4oSlZwSPKfk
         jzw2aNHdr9P7SUFZ9unBto14zzQpSixa7qzfc6n54h4Ljntx4O/yg2aqZPUhh/fJqQvU
         Q3pqNIGkPARd60TMKy8WlwQ/ZsQMCH4aTKMGRNmO3vCwxtygXcJPraa3admerLvLEjhW
         88YZCw93oPdtOWj4EqratLAwMyRKwvC4V3ff3NaKSU4RKAKHABkCjrLndXvbPPrp6PRm
         1QPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y9/N0l0kbpwj5WOfd6oS8v0HRW0ZurOme01HGXcBfIA=;
        b=oWz/1ipOA15tK8ZDLfQHMxQQMAMy6Rl3lbr7vkT+fD9w4itFhIySSUZ9UdOpNCi+mE
         IymOkQgtk0g+fNfgifzX9w/sB5F3B94VLTYf9Akq6oRe0fjw16Gl9M7szPJFc5u2aO19
         X5jHCmboZ5tDeuFNnhJeVjV+8ouZWUUkx8k/a4AfnD8SfcTbNeCKeac+mQF1JotvwmdF
         FL/TBgCHUwuRwQgK92Fj782Y1q8MwCqp9uzpIRa+YMMCwBqyqimJpH+pQTzdiX3RbQ4a
         GMdKew0jgQ/RqQ0zNlPJnfdJKePOwtWRaRTwMxpcLc3ocaGYixte830uljXtayYWqJr0
         oJ1A==
X-Gm-Message-State: AOAM532EPEwlnE/F9hCjLkFrdzkFt2AOysgnduTlOWia28yTojUn54jC
	6t9fczEwKbstGsabvlgN76hevcsEk4s=
X-Google-Smtp-Source: 
 ABdhPJzRJiVk5dTf3igdLoKSaQOsWrjkXg1FujWY2n7D53JldryiOAypJAHBQc67l4pXdjqZ3KhFoQ==
X-Received: by 2002:a17:907:d8b:b0:6f4:99e5:78f with SMTP id
 go11-20020a1709070d8b00b006f499e5078fmr16414629ejc.37.1652730566284;
        Mon, 16 May 2022 12:49:26 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 o23-20020aa7dd57000000b0042abfe32ac8sm533125edw.30.2022.05.16.12.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 12:49:25 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Alex Kiernan <alexk@zuma.ai>
Subject: [OE-Core][PATCH 3/3] eudev: Use PACKAGE_BEFORE_PN/${PN}
Date: Mon, 16 May 2022 20:49:15 +0100
Message-Id: <20220516194915.29231-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220516194915.29231-1-alex.kiernan@gmail.com>
References: <20220516194915.29231-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 19:49:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165697

Use PACKAGE_BEFORE_PN for packages which need to capture files early,
switch to idiomatic ${PN} for additional packages.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alex Kiernan <alexk@zuma.ai>
---
 meta/recipes-core/udev/eudev_3.2.11.bb | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/udev/eudev_3.2.11.bb b/meta/recipes-core/udev/eudev_3.2.11.bb
index fc17e119bc68..f12cc250fbdf 100644
--- a/meta/recipes-core/udev/eudev_3.2.11.bb
+++ b/meta/recipes-core/udev/eudev_3.2.11.bb
@@ -61,20 +61,19 @@ do_install:prepend:class-target () {
 INITSCRIPT_NAME = "udev"
 INITSCRIPT_PARAMS = "start 04 S ."
 
-PACKAGES =+ "libudev"
-PACKAGES =+ "eudev-hwdb"
+PACKAGE_BEFORE_PN = "libudev ${PN}-hwdb"
 
 FILES:${PN} += "${nonarch_base_libdir}/udev"
 FILES:libudev = "${base_libdir}/libudev.so.*"
-FILES:eudev-hwdb = "${sysconfdir}/udev/hwdb.d"
+FILES:${PN}-hwdb = "${sysconfdir}/udev/hwdb.d"
 
-RDEPENDS:eudev-hwdb += "eudev"
+RDEPENDS:${PN}-hwdb += "${PN}"
 
 RPROVIDES:${PN} = "hotplug udev"
-RPROVIDES:eudev-hwdb += "udev-hwdb"
+RPROVIDES:${PN}-hwdb += "udev-hwdb"
 
 PACKAGE_WRITE_DEPS += "qemu-native"
-pkg_postinst:eudev-hwdb () {
+pkg_postinst:${PN}-hwdb () {
     if test -n "$D"; then
         $INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX}
     else
@@ -82,6 +81,6 @@ pkg_postinst:eudev-hwdb () {
     fi
 }
 
-pkg_prerm:eudev-hwdb () {
+pkg_prerm:${PN}-hwdb () {
         rm -f $D${sysconfdir}/udev/hwdb.bin
 }
-- 
2.35.1


