Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.21760.1627637148909771678
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 02:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PMOixbZ6;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id qk33so15584064ejc.12
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 02:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fd6wrlaAAnNSyogPWyNSeIN5kcYrveS7K0Je0+nM+vE=;
        b=PMOixbZ6NST9G0AgRxe7KtPO1kNi4Po8kXCnaMYohjQMWcPNBjBMjjOIdtSSbsArEQ
         8Nl99vyQOYoIYDHjG8TL4T5q5p85vOefBgRKhKJzXPZqvDHbxykFtgkTgHd53dGn6LGv
         VU5kXcROqG6TqgFlwZOjWqrwNQZ5gphAgreuBv6TEaieZSyI8QmxcBa/zzQLvWoZhY7J
         eNpXbldR3/vtnK0Hse6hMQi6DlWKpMyYS9lVNvVJvW+wxrFodqMLxXLOtSk14CI+EQhO
         8dgCQtHTj2/QCbqYrEITXnpdka0BOlojipcwCkBiKBXCafmeBMEa9fdaO8EvP9qGMiGL
         kwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fd6wrlaAAnNSyogPWyNSeIN5kcYrveS7K0Je0+nM+vE=;
        b=JOEEa8xISf3s2lXTUye77O6CJiovcuAuXf/8cV0VrnxeEqXs1eaF76cFpOXSItOz4L
         vmSNblJ664XdpgE910+G4FVMUoWLfUQWfz2k3uHehgOmUFC2M4mJ7/i+AHxSieOUHi8J
         p3Li5xBa7Acclj40bT49YuyZ+dmch4M+6cef+00Mv8qpfxbMVzrPdtnO5Nt2b2O/dqFE
         39xHAcAnYw1ArKpL+DdFzZe9oSOKOAyqBq3HO1ihdbvhPjwJuqWmNYIWy4uM9wylOhhj
         QSW0lDfeK7RVHLDSc4Cg0hDtGvAtxRG6cWHB0S/vZeF33vzgVGfFGTopARUSsVdkDCDA
         4eaA==
X-Gm-Message-State: AOAM533VU7Jo32tJUoLHD9ywxODyUfxILQjkdwOa/B7Qn4wao5+xrZvM
	eH73EGvi27rYZULiMHXvG9fNzHD3l3ITUw==
X-Google-Smtp-Source: ABdhPJzPU14xXpDTuE1OGHH1CU2Y2K8xuA+2YfTL/vFWiKzLyP9Fq5DhDIIXdw+SOBD7TCxlZX0xiw==
X-Received: by 2002:a17:906:bc81:: with SMTP id lv1mr1692734ejb.413.1627637147340;
        Fri, 30 Jul 2021 02:25:47 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id q8sm425704edd.43.2021.07.30.02.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 02:25:47 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] convert-overrides.py: show processed file and version of this script
Date: Fri, 30 Jul 2021 11:25:44 +0200
Message-Id: <20210730092545.14678-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* on bigger layer this script takes couple minutes without showing any progress
* add a version to reference it in the conversion commit (to easily figure out
  if it's worth re-converting the layer).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/contrib/convert-overrides.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/contrib/convert-overrides.py b/scripts/contrib/convert-overrides.py
index 499852bd26..68ae356083 100755
--- a/scripts/contrib/convert-overrides.py
+++ b/scripts/contrib/convert-overrides.py
@@ -90,6 +90,7 @@ subs = {
 }
 
 def processfile(fn):
+    print("processing file '%s'" % fn)
     try:
         fh, abs_path = tempfile.mkstemp()
         with os.fdopen(fh, 'w') as new_file:
@@ -128,6 +129,7 @@ def processfile(fn):
         pass
 
 ourname = os.path.basename(sys.argv[0])
+ourversion = "0.9.0"
 
 for root, dirs, files in os.walk(targetdir):
    for name in files:
@@ -139,3 +141,5 @@ for root, dirs, files in os.walk(targetdir):
       if "/.git/" in fn or fn.endswith(".html") or fn.endswith(".patch") or fn.endswith(".m4") or fn.endswith(".diff"):
           continue
       processfile(fn)
+
+print("All files processed with version %s" % ourversion)
-- 
2.30.2

