Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 100BBC433EF
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 23:07:09 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web09.880.1637276827994815950
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 15:07:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=epPhj547;
 spf=pass (domain: gmail.com, ip: 209.85.167.171,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id r26so17769848oiw.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 15:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uLHWUl0Dh/cFczZlLjTbKIn3wnG1Y8AMK4DllzltwGw=;
        b=epPhj547vRCWVwexNxw+3F+OTUo0sdE8WqRKxNysNww27r3jacIJIZmzhOWCpkQc7t
         gkHuE0ucs5XmuzBbISlGfzoYCwhbs6NjykA+FBL6t/06zDqGGF8jA/aSWC8RHTpjGP87
         YSy2VAW82M3KxUimj0KR9Sx2JiiyFwCrfIGFj3UfeRFQ1cgQslLa+mwfU6C1jR/kVg7w
         N8SFxlbUvSKovYgJhrAXKQurrBdgyVvL14FB0nPSoBDZauoYamfIogXoHyeULmvXohqr
         Oz5JnZaatQLo9HqeiW7XPtX4BNqQz0rba9ZOxsr1YYKerHjrI4Wo6dn2YJmV07+em/+h
         Y1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uLHWUl0Dh/cFczZlLjTbKIn3wnG1Y8AMK4DllzltwGw=;
        b=tXZChNvizd5s2eIgyL5abW914aGDs6xMlLwgj2XDzKBdZlk8IfQBnIRvRnyARrGTtV
         Gym5pIDV5+GTugsXk1Twb02KbMtOV8HCooM5M3g+78nyGt+/djuFoRwRWWrgVlfToOOx
         6ZoeYBWrH0k2QZ5y/cu02qogp4yOPIx37SRv1i6/0vvBqEWtXU4Grgz9KzHDGveygRMp
         vSLw7YJuk9lcU5wpcPBbLBl4/e7DDi2lzcGVWH05WQTPbDE43Yf9pCoaI/3zzDopnann
         mI6PVQdnYVVSJ3Zedutog+Dvi4UaYtGh40FKUtM/xW2VvsxsLQSoJNO6PkyeVKb3W84w
         CiSw==
X-Gm-Message-State: AOAM532h5sghME1FnhKRkg3FbjU16iPqGb503FO6hX/H/XfK6vbc9I+/
	Rb7rwCz6A4UPh2ATXvVBI5QZhUu/8/0=
X-Google-Smtp-Source: 
 ABdhPJxVRnI96aDcJBxUo4b6JgdLlJKhngZsM521+AHAH+ukuUo4HYjHg3y6T6zIMU7DsfInzhzdSA==
X-Received: by 2002:a05:6808:3c2:: with SMTP id
 o2mr721351oie.112.1637276827081;
        Thu, 18 Nov 2021 15:07:07 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 v10sm228673oor.33.2021.11.18.15.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 15:07:06 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/meson: Add optional rust definitions
Date: Thu, 18 Nov 2021 17:06:59 -0600
Message-Id: <20211118230659.1570592-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Nov 2021 23:07:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158484

Adds the rust tools to the cross and native files if present so that
projects that use both rust and meson can build

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/meson.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 4ba70de3dc..0b3cbc4b7e 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -36,8 +36,13 @@ MESON_CROSS_FILE = ""
 MESON_CROSS_FILE:class-target = "--cross-file ${WORKDIR}/meson.cross"
 MESON_CROSS_FILE:class-nativesdk = "--cross-file ${WORKDIR}/meson.cross"
 
+def optional_tool(name, var, d):
+    if not d.getVar(var):
+        return ""
+    return "%s = %s" % (name, meson_array(var, d))
+
 addtask write_config before do_configure
-do_write_config[vardeps] += "CC CXX LD AR NM STRIP READELF CFLAGS CXXFLAGS LDFLAGS"
+do_write_config[vardeps] += "CC CXX LD AR NM STRIP READELF CFLAGS CXXFLAGS LDFLAGS RUSTC"
 do_write_config() {
     # This needs to be Py to split the args into single-element lists
     cat >${WORKDIR}/meson.cross <<EOF
@@ -54,6 +59,7 @@ llvm-config = 'llvm-config${LLVMVERSION}'
 cups-config = 'cups-config'
 g-ir-scanner = '${STAGING_BINDIR}/g-ir-scanner-wrapper'
 g-ir-compiler = '${STAGING_BINDIR}/g-ir-compiler-wrapper'
+${@optional_tool('rust', 'RUSTC', d)}
 
 [built-in options]
 c_args = ${@meson_array('CFLAGS', d)}
@@ -88,6 +94,7 @@ strip = ${@meson_array('BUILD_STRIP', d)}
 readelf = ${@meson_array('BUILD_READELF', d)}
 objcopy = ${@meson_array('BUILD_OBJCOPY', d)}
 pkgconfig = 'pkg-config-native'
+${@optional_tool('rust', 'RUSTC', d)}
 
 [built-in options]
 c_args = ${@meson_array('BUILD_CFLAGS', d)}
-- 
2.33.0


