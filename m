Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.10870.1632141996204378550
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 05:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HU75Qmh7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id q11so29321060wrr.9
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 05:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JRkqVkL+ZMHCYylESEf1BAAcXUk6yFCBkzY4No+lJOE=;
        b=HU75Qmh7eGsLlwTsSstwL57v+Gy56JQf4Y/Mny1WjLjoXmF4OQP6S7jk1aDSNkrCEx
         9kDVMDlhZqfJ4jORQRtcNKV9EOvFkpJ2JYFf+8HHYrdXX5AST3UKlZ5Dx2HdhzVAAMyo
         FyE0Sscwt7vW/Ki9fXDwLqwX60esa/0jRgE2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JRkqVkL+ZMHCYylESEf1BAAcXUk6yFCBkzY4No+lJOE=;
        b=JupoSSkxmbTEeyYMsgndtixpO06fyaYhHyR/A3cnfEvnw4X07tktNqLWT9vuARZcl6
         1UwvjN90VwjTyIFXuw/qPVxsblebsyTbLQHLwHmtgTi6F+R58lzaLYWZYWkCQ5lj7abu
         v7VWcoQucGQ6mbpSipTb8vJGDitSBTIP+at+LrQ1DwZwOWGiwb4afAtlPp4o4ubUc2B6
         8iE6jYLmMu/zlOxxwQcDROpdaSZg/yUP6Rnz99mhhV2yFF5Zf8f8KLENLvBjDDiwNEX2
         DxdRaSI0m/GfBnG4c7+5k/Mdhh7XWzITuOtuhXTYeLKikPS3P763GS2717UtCJkfURhU
         YUUw==
X-Gm-Message-State: AOAM531q96VJ1A/Gsla0MZkeNxMJ8ytdtw6U/ZvodaNhl4jDF+r5t5OB
	eEtqV3S7Ls5vr9GotARHlcLdzNS302R/zvN0
X-Google-Smtp-Source: ABdhPJyP7NUWKmB+5aI3trb5srCjZDZhbSpUZmtVfuH2URgrI6WHbkykGUIMedlS1nnwx9NJs8TyYQ==
X-Received: by 2002:adf:fb8e:: with SMTP id a14mr27409171wrr.40.1632141994715;
        Mon, 20 Sep 2021 05:46:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7173:466e:b128:3e8b])
        by smtp.gmail.com with ESMTPSA id j21sm15773514wrd.48.2021.09.20.05.46.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 05:46:34 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/14] meta: Drop useless class
Date: Mon, 20 Sep 2021 13:46:20 +0100
Message-Id: <20210920124621.1576702-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This class was added by me back in 2007 and has changed one for a whitespace issue
since. It only has two lines and neither are particularly useful, one was replaced
by the nopackages class, the other adding recursive dependencies also is now
mainly problematic adding tons of unneeded dependencies. The name is hard to
understand and the class doesn't have a clear purpose. Drop it.

Remove the references in devtool (which may be the one reason to keep it around
but in my view still not worth it).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/meta.bbclass               | 4 ----
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 scripts/lib/devtool/standard.py         | 4 ----
 3 files changed, 1 insertion(+), 9 deletions(-)
 delete mode 100644 meta/classes/meta.bbclass

diff --git a/meta/classes/meta.bbclass b/meta/classes/meta.bbclass
deleted file mode 100644
index 5e6890238b1..00000000000
--- a/meta/classes/meta.bbclass
+++ /dev/null
@@ -1,4 +0,0 @@
-
-PACKAGES = ""
-
-do_build[recrdeptask] = "do_build"
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 6d9cd46bf30..f495e84c79b 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -649,7 +649,7 @@ class DevtoolModifyTests(DevtoolBase):
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
 
-        testrecipes = 'perf kernel-devsrc package-index core-image-minimal meta-toolchain packagegroup-core-sdk meta-ide-support'.split()
+        testrecipes = 'perf kernel-devsrc package-index core-image-minimal meta-toolchain packagegroup-core-sdk'.split()
         # Find actual name of gcc-source since it now includes the version - crude, but good enough for this purpose
         result = runCmd('bitbake-layers show-recipes gcc-source*')
         for line in result.output.splitlines():
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index b74a60d0011..01fb5ad96ff 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -318,10 +318,6 @@ def _check_compatible_recipe(pn, d):
         raise DevtoolError("The %s recipe is a packagegroup, and therefore is "
                            "not supported by this tool" % pn, 4)
 
-    if bb.data.inherits_class('meta', d):
-        raise DevtoolError("The %s recipe is a meta-recipe, and therefore is "
-                           "not supported by this tool" % pn, 4)
-
     if bb.data.inherits_class('externalsrc', d) and d.getVar('EXTERNALSRC'):
         # Not an incompatibility error per se, so we don't pass the error code
         raise DevtoolError("externalsrc is currently enabled for the %s "
-- 
2.32.0

