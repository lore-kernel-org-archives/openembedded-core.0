Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11AD5C433FE
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 20:51:46 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web08.14748.1637355104801096219
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 12:51:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AklroDTv;
 spf=pass (domain: gmail.com, ip: 209.85.210.51,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id
 r10-20020a056830080a00b0055c8fd2cebdso18564428ots.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 12:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8l57IX8h/Yod/plFrTNM7NTH+nW/EIO8lPw0N6SmScg=;
        b=AklroDTvVocFzgCh+9QLLMe9jt/XS6aLQ5dYvhgMM62gd9iW7KJbNH4xeBsFu5SPBd
         MqQlB0NzM5/vC+qYHq7cdSLd4MJg9ieEyir9UhnochXZvw7Vl7OboVmgf8xJLOdRCOGl
         VIFKwEWzPKPLv833uuUqDAsQFQmzrn02y1onw+g9jTeAMcE6ypjVfj1xkhCGZOvear9N
         VaOXryrGk9veaP0V+0TMwa9zWBawl5m7EeJJkKJZPHv79ZYqK90W2mZnS8HoWhjIb3s/
         4AdBbtFCe+xj+7yxTsREhurRKZb7BI9zG85Wu2wHB7moJ75+RdpaCee0AnjGKnTwg+w+
         69gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8l57IX8h/Yod/plFrTNM7NTH+nW/EIO8lPw0N6SmScg=;
        b=i8ySiJxxsaNHrjITAiECLQVV/zUFOCH/BmYiuNko8b+eLgbctxhozBdkpf3kvfKlPs
         T4I8xAfZFQfw8DyLjsUKkAxcCTAXQClLvFKP4LbCl12oshdIO5laZEtgfWr1xulglQTL
         wTaj4RPvmj2Iobb5R0YV5w7G7crZUAFR2Zwe582nOZCZCRl7C6oNqVeI7Jnqbz1Tn1kE
         qoFICJVSUheexB2HwQ4Wchdoh7qBWb32IzdVdM6S3rOXYYAA4lvlD5FBpRzYgulExaEA
         VctVIAKa/pcU9zFo9ffdwn7C1njQshQXzPlqZJZnlSOFnnNx4GSfhoJ/PD1G4LiR8THA
         cqeg==
X-Gm-Message-State: AOAM532c/B+F3Wj9O7S/F/sttQQEtpodVRJQRPgtoGFda3hOd/P/WjWm
	5LNTElBgY6EhDlIkd0SXrtk44ATAMgo=
X-Google-Smtp-Source: 
 ABdhPJzPgptAxm0Elhm0pvidgdTPKQVGwXIEbm0JX5aL7IBwbqgnckz08Z2aMKgyE6boRuAuRlIIkw==
X-Received: by 2002:a05:6830:1445:: with SMTP id
 w5mr7283816otp.112.1637355103796;
        Fri, 19 Nov 2021 12:51:43 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 f25sm149609oog.44.2021.11.19.12.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 12:51:43 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2] classes/meson: Add optional rust definitions
Date: Fri, 19 Nov 2021 14:51:40 -0600
Message-Id: <20211119205140.2228487-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211118230659.1570592-1-JPEWhacker@gmail.com>
References: <20211118230659.1570592-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 20:51:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158526

Adds the rust tools to the cross and native files if present so that
projects that use both rust and meson can build

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---

V2: Fixes so that cross-compiling works correctly by passing --target
and RUSTFLAGS


 meta/classes/meson.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 4ba70de3dc..a7981e481f 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -36,8 +36,15 @@ MESON_CROSS_FILE = ""
 MESON_CROSS_FILE:class-target = "--cross-file ${WORKDIR}/meson.cross"
 MESON_CROSS_FILE:class-nativesdk = "--cross-file ${WORKDIR}/meson.cross"
 
+def rust_tool(d, target_var):
+    rustc = d.getVar('RUSTC')
+    if not rustc:
+        return ""
+    cmd = [rustc, "--target", d.getVar(target_var)] + d.getVar("RUSTFLAGS").split()
+    return "rust = %s" % repr(cmd)
+
 addtask write_config before do_configure
-do_write_config[vardeps] += "CC CXX LD AR NM STRIP READELF CFLAGS CXXFLAGS LDFLAGS"
+do_write_config[vardeps] += "CC CXX LD AR NM STRIP READELF CFLAGS CXXFLAGS LDFLAGS RUSTC RUSTFLAGS"
 do_write_config() {
     # This needs to be Py to split the args into single-element lists
     cat >${WORKDIR}/meson.cross <<EOF
@@ -54,6 +61,7 @@ llvm-config = 'llvm-config${LLVMVERSION}'
 cups-config = 'cups-config'
 g-ir-scanner = '${STAGING_BINDIR}/g-ir-scanner-wrapper'
 g-ir-compiler = '${STAGING_BINDIR}/g-ir-compiler-wrapper'
+${@rust_tool(d, "HOST_SYS")}
 
 [built-in options]
 c_args = ${@meson_array('CFLAGS', d)}
@@ -88,6 +96,7 @@ strip = ${@meson_array('BUILD_STRIP', d)}
 readelf = ${@meson_array('BUILD_READELF', d)}
 objcopy = ${@meson_array('BUILD_OBJCOPY', d)}
 pkgconfig = 'pkg-config-native'
+${@rust_tool(d, "BUILD_SYS")}
 
 [built-in options]
 c_args = ${@meson_array('BUILD_CFLAGS', d)}
-- 
2.33.0


