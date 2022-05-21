Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33376C433EF
	for <webhook@archiver.kernel.org>; Sat, 21 May 2022 08:25:39 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web08.3708.1653121529052053149
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 May 2022 01:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QwRM/65j;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id j28so13184325eda.13
        for <openembedded-core@lists.openembedded.org>;
 Sat, 21 May 2022 01:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=phNmHp35O5+gEr/lehdoqC6jKfN3i9aZNrLpTCq0V34=;
        b=QwRM/65jUQbyEs+A8YOnUN4KoBm90R8l1+uQ+9rS7j4nnihprBFSbfZ/4tddj7evw8
         tPHjxEPo6sUUTuCwbwfmIJpexnC1xfAzEGY6lQVnS64qmAOan9amf/Fhr6aLhBgPsr4F
         w3jTnlA6qg2jL0v+BpVnNoBSoLqCp9t3p3y13ov/vk3bWL9xS8PZQcbA0blCmaIF/i/V
         KZNrTybYBYvscPFskmyaBNz2xv+dDlWQTa59gQ+19TYrp/UApV2vyKN6INnAeVXtVyHu
         J7Y+G1l5SqPjirxUrXlmgHYJFBYN0KRNaOwZq69z5cjbFSBHRbj2OSEwy8NzUkX0Eobb
         RfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=phNmHp35O5+gEr/lehdoqC6jKfN3i9aZNrLpTCq0V34=;
        b=rbJHL22B4pRkafWWnNeh4fYrqnGcrjv/zkUnz0aXggZOs063ffdstcDgZvPnJELbgg
         aD3U+1gFKkPSPV4M7hRbbOjgKyNqVaGuMvUqsRac/6+1Qds73mtr3H+6cm5cJQ5v+N+W
         IkdD61dQDUmIITmWYTPCzMjCXmwLmdnOIrJosgRtkf5IB1VYBC69rd7FpY28vErpIeL4
         VQIwpQcEFM59/K79LOdf67ifdVBRBK4ez4bb9tbw78WfO+ysEvkS1f45pSaWAWZkNKQ3
         uGuEKE1QYz+V6cTF1LEHWkr+MSUHycdfk2lGg7z809VFRJVQ2bj3yBwkEVpjwzGmmX53
         btgg==
X-Gm-Message-State: AOAM532EhCLB6Dfr87/M/oO7aMvVUd6y6Hr19KFkvtp3/SJ0pRg83SsI
	bjopFS32/x0o9Y5O/ZL5AlbDuv4iYwY=
X-Google-Smtp-Source: 
 ABdhPJzJWnv3hOW7lSBuId+o1/02YF9MWj/WuYFdRm9fyjjQoL8/CR3btuf36m85GCRFf/nOIbUJ0Q==
X-Received: by 2002:a05:6402:176b:b0:42a:a828:5d79 with SMTP id
 da11-20020a056402176b00b0042aa8285d79mr14961717edb.272.1653121527474;
        Sat, 21 May 2022 01:25:27 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 v21-20020a17090651d500b006f3ef214e2asm4101438ejk.144.2022.05.21.01.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 01:25:26 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Alex Kiernan <alexk@zuma.ai>
Subject: [OE-Core][PATCH v4 3/3] eudev: Use PACKAGE_BEFORE_PN/${PN},
 clean up spaces
Date: Sat, 21 May 2022 09:25:20 +0100
Message-Id: <20220521082520.5473-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521082520.5473-1-alex.kiernan@gmail.com>
References: <20220521082520.5473-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 May 2022 08:25:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165958

Use PACKAGE_BEFORE_PN for packages which need to capture files early,
switch to idiomatic ${PN} for additional packages. Swap spaces for tabs
in shell functions.

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-core/udev/eudev_3.2.11.bb | 27 +++++++++++++-------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/udev/eudev_3.2.11.bb b/meta/recipes-core/udev/eudev_3.2.11.bb
index 7f190e7323bc..bc2c77de898c 100644
--- a/meta/recipes-core/udev/eudev_3.2.11.bb
+++ b/meta/recipes-core/udev/eudev_3.2.11.bb
@@ -63,28 +63,27 @@ do_install:prepend:class-target () {
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
-RDEPENDS:eudev += "kmod"
+RDEPENDS:${PN}-hwdb += "eudev"
+RDEPENDS:${PN} += "kmod"
 
 RPROVIDES:${PN} = "hotplug udev"
-RPROVIDES:eudev-hwdb += "udev-hwdb"
+RPROVIDES:${PN}-hwdb += "udev-hwdb"
 
 PACKAGE_WRITE_DEPS += "qemu-native"
-pkg_postinst:eudev-hwdb () {
-    if test -n "$D"; then
-        $INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX}
-    else
-        udevadm hwdb --update
-    fi
+pkg_postinst:${PN}-hwdb () {
+	if test -n "$D"; then
+		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX}
+	else
+		udevadm hwdb --update
+	fi
 }
 
-pkg_prerm:eudev-hwdb () {
-        rm -f $D${sysconfdir}/udev/hwdb.bin
+pkg_prerm:${PN}-hwdb () {
+	rm -f $D${sysconfdir}/udev/hwdb.bin
 }
-- 
2.35.1


