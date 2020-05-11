Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web12.13336.1589207974439936830
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 07:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qlemWQ2H;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.68, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f68.google.com with SMTP id y6so7984630pjc.4
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2020 07:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=jV2gJMW9N1tnXccId2Rhip5a4cgAZ9Gyg4QE+AGLcxc=;
        b=qlemWQ2Hneg/LMLjVCzSmFJj6fr6Ay2gRoKyNI38fIVM+Nq6+aPfrRqrJ9JTQNlZj8
         P9PHs2SQdsq8fxXcRXTC3iZ3DjFMvvm9mVGqGWPQNKDWV31/DRqTUN1+A2Ohy9GIP42M
         FOU1RoDtIu7xzjK+Ok4PdSZllbhddwn1A+IbxWeYVZt0VPepbPeAIPmS5pf2Giydaf5d
         GcoV7CQI77e5EQTxahwEEFtbwl/0RHt1cwOQEa35XXtSF1uX7qwpnJn4ZIa+omeA92Id
         eTACK8Osjb6XKDOS6uL5FYn/5mem8Pi6by2er9Q5GBKUiexn1ESPSI7c4FyfCxJETYz9
         ydcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=jV2gJMW9N1tnXccId2Rhip5a4cgAZ9Gyg4QE+AGLcxc=;
        b=bFk4zYRasW4DZC/HVp1kzNeSNuc35EO0RZ92iDajlV13SeexQYaLWRbGUqzkLwsJ5X
         s6rsplstJgySmaYG8ypwLFj3xlmhXGvrZGncj5t8ZVAyzHKSP/ZBxbijGbmgyMg+fQhw
         0Ya++7VbMpikPbpXgjY8XrCzJ8IA4hOte7ZGAeyRETz55UjmC5w85mSMkX4Lcf+pUCfK
         0idZDilhRswwfWvheLaVGtvjurenk6/nepXahWyAtGVf2VZUeLdJY0LKRKIs8DryAA1K
         KmnBPztYp1pRFOsro+OG0wfrkmhMXRIRlv1BqtsqlYmQ5SxPrjdk8UPdsC0Pltevscte
         PHJg==
X-Gm-Message-State: AGi0Pub3iqAunO7PsYqTFc5XBGIOtCGuZQjgrxrBiEZe+ShY6lCopiVk
	buZ9jLJYtzUcdqg90ZQNS2Osxa6JGASyHQ==
X-Google-Smtp-Source: APiQypJ0+qRRAV0DRAvoeT5wdLLTv2vq4A8xpEb4LiyfKJCj1d+hTttDEEcWJpo93UsGlfMepdu0cA==
X-Received: by 2002:a17:902:c111:: with SMTP id 17mr15532880pli.301.1589207973340;
        Mon, 11 May 2020 07:39:33 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 6sm9337202pfj.123.2020.05.11.07.39.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 07:39:32 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/8] os-release: sanitize required fields
Date: Mon, 11 May 2020 04:38:47 -1000
Message-Id: <ea39b2edecc00cc2340328893cdfbefed5d3b981.1589207495.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589207495.git.steve@sakoman.com>
References: <cover.1589207495.git.steve@sakoman.com>

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

Currently only VERSION_ID field is sanitized, but os-release (5) has
more fields with the same requirement. Moreover, those fields come
unquoted in most distributions, because quotes are not needed for a
values without whitespaces.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/os-release/os-release.bb | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index d5793c6fed..a29d678125 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -13,6 +13,7 @@ do_configure[noexec] = "1"
 # Other valid fields: BUILD_ID ID_LIKE ANSI_COLOR CPE_NAME
 #                     HOME_URL SUPPORT_URL BUG_REPORT_URL
 OS_RELEASE_FIELDS = "ID ID_LIKE NAME VERSION VERSION_ID PRETTY_NAME"
+OS_RELEASE_UNQUOTED_FIELDS = "ID VERSION_ID VARIANT_ID"
 
 ID = "${DISTRO}"
 NAME = "${DISTRO_NAME}"
@@ -22,8 +23,8 @@ PRETTY_NAME = "${DISTRO_NAME} ${VERSION}"
 BUILD_ID ?= "${DATETIME}"
 BUILD_ID[vardepsexclude] = "DATETIME"
 
-def sanitise_version(ver):
-    # VERSION_ID should be (from os-release(5)):
+def sanitise_value(ver):
+    # unquoted fields like VERSION_ID should be (from os-release(5)):
     #    lower-case string (mostly numeric, no spaces or other characters
     #    outside of 0-9, a-z, ".", "_" and "-")
     ret = ver.replace('+', '-').replace(' ','_')
@@ -32,11 +33,14 @@ def sanitise_version(ver):
 python do_compile () {
     with open(d.expand('${B}/os-release'), 'w') as f:
         for field in d.getVar('OS_RELEASE_FIELDS').split():
+            unquotedFields = d.getVar('OS_RELEASE_UNQUOTED_FIELDS').split()
             value = d.getVar(field)
-            if value and field == 'VERSION_ID':
-                value = sanitise_version(value)
             if value:
-                f.write('{0}="{1}"\n'.format(field, value))
+                if field in unquotedFields:
+                    value = sanitise_value(value)
+                    f.write('{0}={1}\n'.format(field, value))
+                else:
+                    f.write('{0}="{1}"\n'.format(field, value))
 }
 do_compile[vardeps] += "${OS_RELEASE_FIELDS}"
 
-- 
2.17.1

