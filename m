Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.7681.1588255443741440763
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 07:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WEWxfLyS;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id r26so2045767wmh.0
        for <Openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 07:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=KFJYi53xN38jT7PEBzevogFSqsSSe5ED1E0gv5vCdK8=;
        b=WEWxfLySIkfKZCTONOnY4nF/Qm0M1akQUoCLieJFG4U8aWA0/nVfY4QqMpY28ZaxUR
         0hivodWopVqeSdC6cmK3SIXmhnfCNj8XuckMuXmtXjzEyMisASlVQ0nfMIYEjqOTj/r+
         bDKZp5a4lOT787+381p4L2BafNR5vHXp6VJKzx313uhuQqMXT2gGUAR9LDFCFt7jvFOc
         mZ8azKxCQgWvKTaWtAa/CY6Ywp1UaS3rf4r8lmpg9td2kK7GZWloY3GkJf7/bsC0PT5h
         JDOd9jIBfJ1sdtaEmHPXLci8B/I34RNmuyHZlkjPBLLn9HVyUv7oUJznwSzhzob8jXG0
         dGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KFJYi53xN38jT7PEBzevogFSqsSSe5ED1E0gv5vCdK8=;
        b=Mqo3Htf/I4bk39S1YSJJUNM3FgVS1ROTh1r9tUXDaBqesIgSZEpBeDzdxCWGxzYV69
         Xi8kvn2euiFoiV3CzMUTWgt7hWQ8BO6uPoTY0wPf823+DdQjL8hsHjWhh2cde4s9FXpL
         t690yucrc+qvpfg+Sa7BDk6yUmM9gIOONAxGYgbU6cS03qKjCNakLvT8rCZ6EODHfUqO
         EE8IDNfLA+HeXi2Nu6fMYSs6o57HFzCiLS+4ttmnujixeGI7zqhlDsRKCJWaPS1MRt1c
         PhdA7RckJXWP8iUx8Pt6Y/2eTVL4V2jhwWKF6KbuooFuxX8BZu/lpDzoQ087QPX9kcEz
         6U3Q==
X-Gm-Message-State: AGi0PuaI9MBHK2Upvyt9hY9NL61HKeRzEdKa9QKmpVw5iKUYQiujqZKk
	PRYPNSEg/ftyQOAVkKfS2IKGnrNOGVY=
X-Google-Smtp-Source: APiQypIxgVo1/9p1UnalhESZwW0dYjElVo1BxTjt69o4mHyry/j4g9Cf/hBkmq39sSeBh6XDGJA31g==
X-Received: by 2002:a7b:c955:: with SMTP id i21mr3348283wml.25.1588255441538;
        Thu, 30 Apr 2020 07:04:01 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local (dslb-002-205-007-252.002.205.pools.vodafone-ip.de. [2.205.7.252])
        by smtp.gmail.com with ESMTPSA id g69sm13233253wmg.17.2020.04.30.07.04.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Apr 2020 07:04:00 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH] os-release: sanitize required fields
Date: Thu, 30 Apr 2020 16:03:40 +0200
Message-Id: <20200430140340.64024-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.17.0

Currently only VERSION_ID field is sanitized, but os-release (5) has
more fields with the same requirement. Moreover, those fields come
unquoted in most distributions, because quotes are not needed for a
values without whitespaces.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
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
2.17.0

