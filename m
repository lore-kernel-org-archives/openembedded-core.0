Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.15035.1611783038917469474
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 13:30:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V6zgBfCo;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id p21so4728076lfu.11
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 13:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=itNN/mxVuNtkDhND6VjR7Gs4P1PCgrprZSTr2UZL4PY=;
        b=V6zgBfCoAR0Ql+fMiy8lyuhOU7pXUCjsYAo9sGI+OBRcPdK1JN/TvhhNJObL55/zBg
         FKsp7PJDLpVutvHqVia/U2+q2xbvAtbitlvQpEGpA2iX7UDjuDrU+3u81AbPOu9YcwPd
         z0WXgX13xCUFDjRBZ8cVDT3a2GzIklLt1ZFFgNeb6fwqWvpkkPy5/JUAWvRi9ngw4ZBy
         ltAs+IDxeo1gCWWLzAeFL0uVpLtaWEPCm0MiAS+aio0qFRU6hN0ktnxYcGnqA5ucnCE9
         TjLdBhBtl2sUjv2tRbxUWrAk3a0Qeqdm1tieE+kX4bYSqtfO8y5vjBe3eX5I6v7IEZf0
         qCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=itNN/mxVuNtkDhND6VjR7Gs4P1PCgrprZSTr2UZL4PY=;
        b=UfAKdi/VB+F0iWTkfjpbnIWo66Lr+JsyXuB9dHGOwfNcRuty6y1snvDT23ivJwOUwI
         ipja+jc5HbpIkVjcwOdcmWG8THy/Sainhm4ZsNn8otauH+dheWyFgr1aodtnvpaVx5T+
         w2zHQrR3cH3gcyS6lpEVyGaoLkvjSS73V+y3MYDakYqST5sAVvvNuvWe/DhtGXefScyl
         J4M+wMCB3vKO1TKR9X0hQm3ypJqxvaB3uWkgRJRQjrAsYEunQSp3esX8el6FT1BoPK0d
         T1HzW3vMp/RDxf2fxPE+39dQCJ+GpdFPeEE9j+IsfVtjJP7ipiLi9N/qFvu4Jn7tqZNt
         JRKA==
X-Gm-Message-State: AOAM5311o8Gt2VHEvyWMxshFVvOHkwO5E4xfxZtL9d+cB0sb1eWGt/nG
	8gxH0SGAHJ2i0T7mdRV3rPjomfJq7Hk=
X-Google-Smtp-Source: ABdhPJzDoyohQyRzE7zJoMewvnVr2XkmD53zm9bWV8GdrR7Hxdn457ps7gtl7XDiUYrNRvKb8PkWZw==
X-Received: by 2002:ac2:5e2d:: with SMTP id o13mr6245803lfg.431.1611783036556;
        Wed, 27 Jan 2021 13:30:36 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id m10sm829319lfk.2.2021.01.27.13.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 13:30:36 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH 1/2] insane: Add missing INSANE_SKIP mechanism for native-last QA check
Date: Wed, 27 Jan 2021 22:33:10 +0100
Message-Id: <20210127213311.6030-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

See [YOCTO #5729] for details.

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/classes/insane.bbclass | 43 +++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 3597943ddd..e371c1c71f 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1367,30 +1367,31 @@ python () {
     for i in issues:
         package_qa_handle_error("pkgvarcheck", "%s: Variable %s is set as not being package specific, please fix this." % (d.getVar("FILE"), i), d)
 
-    for native_class in ['native', 'nativesdk']:
-        if bb.data.inherits_class(native_class, d):
-
-            inherited_classes = d.getVar('__inherit_cache', False) or []
-            needle = os.path.join('classes', native_class)
-
-            bbclassextend = (d.getVar('BBCLASSEXTEND') or '').split()
-            # BBCLASSEXTEND items are always added in the end
-            skip_classes = bbclassextend
-            if bb.data.inherits_class('native', d) or 'native' in bbclassextend:
-                # native also inherits nopackages and relocatable bbclasses
-                skip_classes.extend(['nopackages', 'relocatable'])
-
-            for class_item in reversed(inherited_classes):
-                if needle not in class_item:
-                    for extend_item in skip_classes:
-                        if os.path.join('classes', '%s.bbclass' % extend_item) in class_item:
+    if 'native-last' not in (d.getVar('INSANE_SKIP') or "").split():
+        for native_class in ['native', 'nativesdk']:
+            if bb.data.inherits_class(native_class, d):
+
+                inherited_classes = d.getVar('__inherit_cache', False) or []
+                needle = os.path.join('classes', native_class)
+
+                bbclassextend = (d.getVar('BBCLASSEXTEND') or '').split()
+                # BBCLASSEXTEND items are always added in the end
+                skip_classes = bbclassextend
+                if bb.data.inherits_class('native', d) or 'native' in bbclassextend:
+                    # native also inherits nopackages and relocatable bbclasses
+                    skip_classes.extend(['nopackages', 'relocatable'])
+
+                for class_item in reversed(inherited_classes):
+                    if needle not in class_item:
+                        for extend_item in skip_classes:
+                            if os.path.join('classes', '%s.bbclass' % extend_item) in class_item:
+                                break
+                        else:
+                            pn = d.getVar('PN')
+                            package_qa_handle_error("native-last", "%s: native/nativesdk class is not inherited last, this can result in unexpected behaviour. " % pn, d)
                             break
                     else:
-                        pn = d.getVar('PN')
-                        package_qa_handle_error("native-last", "%s: native/nativesdk class is not inherited last, this can result in unexpected behaviour. " % pn, d)
                         break
-                else:
-                    break
 
     qa_sane = d.getVar("QA_SANE")
     if not qa_sane:
-- 
2.30.0

