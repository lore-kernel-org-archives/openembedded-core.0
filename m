Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web12.309.1591811592844872462
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2020 10:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hifwS4s6;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: jacob.kroon@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id q19so3574544eja.7
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2020 10:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZlSY6lb6sbiti/lwgHgR0AGef9ftXpTimzVvgf0ymBE=;
        b=hifwS4s6EE4IlzpStxze6xF9P7PMRy3Y5kt+PxuY+kl2o1KVNGQ5wmNQ84L8V4LOhr
         27W2bf4UuHeWoksKC1fs/vS3/AilFBPHMlA6QetR5JI0vAAQPSOYXY1gFLC2vZ7ami2/
         lQA6EHR9nlNRlk8wd+stDlf8mZTKstc1aqUk9o9QrB+fC6nCuJ2LD6NIVSUvFx+/SXUC
         FM2jb3pQBJdRe8SgJm1i9ddxvhQCU5kKlfzSfcabdAfQZPxRppDzj0W7YkkCl/4bGNfx
         d/iKiP8xPHwfEL5djZKNu034ouDO3Sic7jyStnOHBVFLCprt7mNC7/BwjInWwAJaZapK
         gmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZlSY6lb6sbiti/lwgHgR0AGef9ftXpTimzVvgf0ymBE=;
        b=XVIYbeyWsKqt9k8XQJboZrGp6ITnbhDluXhcwU4xxaYczObK1Vq1BMUtgsnFHT+Fra
         h5NBL3LeXzezeZOX5j0Z9c45OV8tXNn0hBHFPnnd8CzT2CLr7OZr0CKe4aMTw4dx8fnY
         GIYzsrdh6F9B1OzgcjXH+dgO/3GJsLqHiB9PFg1w8WiltV8aqPxC1QmIc4bQ+/FdH3fh
         5Qp180Ckzp1QR+432OCNXpqF/MeyQL/Ix1ogJxASR8BfvJe0thSHpBn2VtdrYwuVJ8K1
         MrVZF5T108QN9R6tkdvxDxOy2e1h6pUzQEgXXOgGsV5r41/jFfKMtgQg7p4a8q963oK0
         yuzA==
X-Gm-Message-State: AOAM531ArRuNpOLesdzE9aXdfIU9Kabya47Asy/9fHSzRuQf6IrFfL7r
	1dcv8zm8oKUEg/PMnSFSkX7Wo9YN
X-Google-Smtp-Source: ABdhPJxJMvqBYi/Uae/MNaRPLQ6qZcGTQjiszSI8pNFBRG+i2l+7Jo1MhYvsl99sa5+itMY5UG5VUQ==
X-Received: by 2002:a17:906:cc85:: with SMTP id oq5mr4430806ejb.142.1591811591152;
        Wed, 10 Jun 2020 10:53:11 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se. [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id j31sm200606edb.12.2020.06.10.10.53.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 10:53:10 -0700 (PDT)
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/3] insane: Check for feature check variables not being used
Date: Wed, 10 Jun 2020 19:52:45 +0200
Message-Id: <20200610175245.38481-3-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610175245.38481-1-jacob.kroon@gmail.com>
References: <20200610175245.38481-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a package QA check for wether any of the variables used by
features_check.bbclass is set while not inheriting the class itself.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/classes/insane.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

Changes since v1:
  New patch for catching the other case, when feature_check is missing
  from being inherited
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index b7c613880b..649aea1da1 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -26,7 +26,7 @@ WARN_QA ?= " libdir xorg-driver-abi \
             textrel incompatible-license files-invalid \
             infodir build-deps src-uri-bad symlink-to-sysroot multilib \
             invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
-            mime mime-xdg unlisted-pkg-lics \
+            mime mime-xdg unlisted-pkg-lics unhandled-features-check \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -980,6 +980,16 @@ def package_qa_check_src_uri(pn, d, messages):
         if re.search(r"github\.com/.+/.+/archive/.+", url):
             package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub archives" % pn, d)
 
+QARECIPETEST[unhandled-features-check] = "package_qa_check_unhandled_features_check"
+def package_qa_check_unhandled_features_check(pn, d, messages):
+    if not bb.data.inherits_class('features_check', d):
+        var_set = False
+        for kind in ['DISTRO', 'MACHINE', 'COMBINED']:
+            for var in ['ANY_OF_' + kind + '_FEATURES', 'REQUIRED_' + kind + '_FEATURES', 'CONFLICT_' + kind + '_FEATURES']:
+                if d.getVar(var) is not None or d.overridedata.get(var) is not None:
+                    var_set = True
+        if var_set:
+            package_qa_handle_error("unhandled-features-check", "%s: recipe doesn't inherit features_check" % pn, d)
 
 # The PACKAGE FUNC to scan each package
 python do_package_qa () {
