Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C1AC41513
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 18:27:12 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web10.128.1716488824339618393
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 11:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VnnKisRr;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6f0df7adaf3so4136527a34.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 11:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716488823; x=1717093623; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sRAmS8JfY21ApFj/0S/Ygeh0T4S0E10b6bFhUMdHr9A=;
        b=VnnKisRr7n9x60ggCeCRVVMK/t/p8PV7QQAQ1Q9IqFDfj7wVK6/3kfPfvo1cchNNrg
         E3K1L+xlBs17GsSWW+LLVTg7GJaOx/iITs7iOexX6yQOIXpq9upsMcbmx30W0/UaniCd
         m2PGGWvscoUUyh4dIi7Pef1xSRZJORS5IuYIsy0FUtT4RoMkvmSfbggO/gPbjNLzhDk7
         QY6cc+xfxyRCOzX9X5zLK3gf7IalLgWeY7pWWT5THF44WMox5VBeJQ9HMH43NRdm3Aiy
         IOTIJB0MGzjYib+1CGyr0fsaZUjmOP4dfNuTCmRY4yJIKttCeO79T/e9Wc0lU8B7D7iU
         uNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716488823; x=1717093623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sRAmS8JfY21ApFj/0S/Ygeh0T4S0E10b6bFhUMdHr9A=;
        b=oMSQMEiP02bozae4XLpSjYvw+36F+hFB27TpP0EMfCB7gtKoYm87pKirQ0xdEBvrrx
         xOshyoHfhyZKJxRFTR4eWRAlG7mCjO/oNG+XXOOmpJAFxehTB2C2R1dTdlawZzmg0cFb
         OIO9kZTxZ9P9PjFCvkFb738VeXbMOUYSp07hTL3Gw+ZFSGksJBUSWiOiDOc78fALRRC/
         VSWlcSzz7tZ0kguZJ+7hq61GU0FbXU/HnbKCzZU2w0nMeMuQLlAgpkoNJX5Oi8WkilBQ
         LBnbPlkbb4D22SCElvemp8qHrr5zIW2uQZMX9TUnQJBYixzAow7sV8wfHTmju6HRFbKr
         GGEQ==
X-Gm-Message-State: AOJu0YyU/HtvKZHk6Den6s3cSK0dopfnDKYP1+P59hL4yh/MORRKw3sA
	VaOg6PSplCEkZ7zMRsasKYQAYvkFV5xLbpX3mnSnV7GeT1Y0rrSo+J9Gwg==
X-Google-Smtp-Source: AGHT+IE8w50OlhxK/VaSIgk7BhNAcZAP1umg+AI1r1FEhzNMCpmK2bEiNkaaBM2zLflOGp6o2VBShA==
X-Received: by 2002:a05:6830:1d5b:b0:6f0:b5b0:65a9 with SMTP id 46e09a7af769-6f8d09532dcmr33811a34.0.1716488823015;
        Thu, 23 May 2024 11:27:03 -0700 (PDT)
Received: from localhost.localdomain ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f0f6ff5488sm4792686a34.40.2024.05.23.11.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 11:27:02 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 1/2] lib: package: Add file_reverse_translate
Date: Thu, 23 May 2024 12:26:54 -0600
Message-ID: <20240523182655.2254482-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 18:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199817

Adds API to reverse the removal of special characters from file names so
it can be correctly done in multiple places without open-coding it.

Replace the translation done in the package_rpm.bbclass with the new API

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-global/package_rpm.bbclass |  8 ++------
 meta/lib/oe/package.py                  | 25 +++++++++++++++++++------
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 790ccbfaf0c..474d2491eb0 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -38,6 +38,7 @@ def filter_nativesdk_deps(srcname, var):
 
 # Construct per file dependencies file
 def write_rpm_perfiledata(srcname, d):
+    import oe.package
     workdir = d.getVar('WORKDIR')
     packages = d.getVar('PACKAGES')
     pkgd = d.getVar('PKGD')
@@ -53,12 +54,7 @@ def write_rpm_perfiledata(srcname, d):
                 key = "FILE" + varname + ":" + dfile + ":" + pkg
                 deps = filter_nativesdk_deps(srcname, d.getVar(key) or "")
                 depends_dict = bb.utils.explode_dep_versions(deps)
-                file = dfile.replace("@underscore@", "_")
-                file = file.replace("@closebrace@", "]")
-                file = file.replace("@openbrace@", "[")
-                file = file.replace("@tab@", "\t")
-                file = file.replace("@space@", " ")
-                file = file.replace("@at@", "@")
+                file = oe.package.file_reverse_translate(dfile)
                 outfile.write('"' + pkgd + file + '" : "')
                 for dep in depends_dict:
                     ver = depends_dict[dep]
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 1511ba47c42..0fe49c00d6d 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -195,14 +195,27 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, max_process, qa_alre
 
     oe.utils.multiprocess_launch_mp(runstrip, sfiles, max_process)
 
+TRANSLATE = (
+    ("@", "@at@"),
+    (" ", "@space@"),
+    ("\t", "@tab@"),
+    ("[", "@openbrace@"),
+    ("]", "@closebrace@"),
+    ("_", "@underscore@"),
+)
 
 def file_translate(file):
-    ft = file.replace("@", "@at@")
-    ft = ft.replace(" ", "@space@")
-    ft = ft.replace("\t", "@tab@")
-    ft = ft.replace("[", "@openbrace@")
-    ft = ft.replace("]", "@closebrace@")
-    ft = ft.replace("_", "@underscore@")
+    ft = file
+    for s, replace in TRANSLATE:
+        ft = ft.replace(s, replace)
+
+    return ft
+
+def file_reverse_translate(file):
+    ft = file
+    for s, replace in reversed(TRANSLATE):
+        ft = ft.replace(replace, s)
+
     return ft
 
 def filedeprunner(arg):
-- 
2.43.2


