Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.9073.1613158517463458876
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Feb 2021 11:35:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kMRlwUZi;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id bl23so994008ejb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Feb 2021 11:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9O11mKmPyYIyJt1cWQlIAkLA8cCyGTy+zRMmc8Q8Qqg=;
        b=kMRlwUZiSLcjgP/85fYZWIX6TCha05olXJFC+nKG1BFbwo7ji89qISNxAgR+QfTpEd
         7shKZsH8fSIGYXb/Fwigns0gKZg69faWuAdTZaVU2wr807soGyObXy+gJXyMF3BY/QuC
         VkNEkUxxidUiPXATnCvD0wfG/zjqM7VsO4nrmPxj1hbi9LZ3MacpwgakR2iDTm4bWInU
         WNe5WsahVnv+Tb4Rb4HEvZUjUmuGpDIxgreb22mMuQTR7IecLq5+nMpvGFirecIVU+8p
         96aBII0JHKUd/istQULATpL9BOkwg95/AHVVUgx0tYeYPFA01/TcAdDsz9X8Lft8kGGg
         /tTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9O11mKmPyYIyJt1cWQlIAkLA8cCyGTy+zRMmc8Q8Qqg=;
        b=He2DRbwOjNsF0+nlV0w8t1N9y+HDhFxsmbG943qQkGCrUgKIkm+p4uS8hXEH4yREAO
         zQgpp5rw23AsWKkp9rR8ZIOWuXRJ4WPg0dI4WpnJ1UnMCLugQdkcXtWw/S7O8XEdWcXP
         3BmKPo9zvqQeYmSesqab0ebx+x3YDHeZetSkw0LfICmBujELAxgFenXjyvGG2G+waBku
         mr9DhRIfhggH4OFMpEVIiqYZuqNzXFs5U8bNnCwZe5NkCEqjONR0rpkx2P0UH5u+Rp8p
         yM4AwjjeVnWSQqIJmsDX2fWloEK+O51/Tq9bAVmyP44jZgl0oCWgZLmOwAv9Kccasxp5
         3+mQ==
X-Gm-Message-State: AOAM532NugsAGaRJkRV7AmsLxDRxdKbUkQHGORLctXh7BJF5ArN47paV
	HjyzW4Gqw84lBpuUqIhQTYGoNYoFr5Y=
X-Google-Smtp-Source: ABdhPJz4toKIPyeFj2Vf3stRgvo24FsomkYLT/IwQjJKj60jpOJJChCoeH6xo+Za/1OOFSmMEDeWcA==
X-Received: by 2002:a17:906:1f85:: with SMTP id t5mr4602535ejr.530.1613158515885;
        Fri, 12 Feb 2021 11:35:15 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id e20sm6662485ejr.80.2021.02.12.11.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 11:35:15 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] selftest/reproducible: track unusued entries in the exclusion list
Date: Fri, 12 Feb 2021 20:35:10 +0100
Message-Id: <20210212193510.483835-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This helps with trimming down the list, and towards 100% reproducibility :)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index deddf6e50b..ecd69b3577 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -79,8 +79,8 @@ def is_excluded(package):
     package_name = os.path.basename(package)
     for i in exclude_packages:
         if package_name.startswith(i):
-            return True
-    return False
+            return i
+    return None
 
 MISSING = 'MISSING'
 DIFFERENT = 'DIFFERENT'
@@ -106,14 +106,17 @@ class PackageCompareResults(object):
         self.different = []
         self.different_excluded = []
         self.same = []
+        self.active_exclusions = set()
 
     def add_result(self, r):
         self.total.append(r)
         if r.status == MISSING:
             self.missing.append(r)
         elif r.status == DIFFERENT:
-            if is_excluded(r.reference):
+            exclusion = is_excluded(r.reference)
+            if exclusion:
                 self.different_excluded.append(r)
+                self.active_exclusions.add(exclusion)
             else:
                 self.different.append(r)
         else:
@@ -127,7 +130,10 @@ class PackageCompareResults(object):
         self.same.sort()
 
     def __str__(self):
-        return 'same=%i different=%i different_excluded=%i missing=%i total=%i' % (len(self.same), len(self.different), len(self.different_excluded), len(self.missing), len(self.total))
+        return 'same=%i different=%i different_excluded=%i missing=%i total=%i\nunused_exclusions=%s' % (len(self.same), len(self.different), len(self.different_excluded), len(self.missing), len(self.total), self.unused_exclusions())
+
+    def unused_exclusions(self):
+        return set(exclude_packages) - self.active_exclusions
 
 def compare_file(reference, test, diffutils_sysroot):
     result = CompareResult()
-- 
2.29.2

