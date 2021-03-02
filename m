Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.1118.1614714199821410332
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 11:43:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Xu+AkEDM;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id mj10so17481143ejb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 11:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3RdykSE507Pavzop4ReP7bEh2uJ4mAuU6Hv0uoBlpkE=;
        b=Xu+AkEDMlnWF6JrefBq2C983qoz8uN3V6Wysu+0HO6aOZmbeg7c7CaHIE2vQPvtQJE
         6zkVXQ2587YpUo1RLG5eZaDxT7A/s0391FSMCdCERKYR03hTnpTm3hX5p4asbV0v9fxQ
         9IWNXj0ZSL1+ba2l5yGnx6FiJnNIHqVFJaB+Y6j47w6mBKFyuQPjYXGvm3KHv1f/WXc7
         IUL8XWtZe8I880rVVwYS/wN5fDVICWuAKbijHIX0Ofyas0NbCcHGejOsKyCPtxQmsqVr
         94gtnjDcrQqiRdRIJZ80eaOKnXknwPQe52UR8Vl9vpEPDf9XLjbLKIFjt5VLfVlSIWke
         sccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3RdykSE507Pavzop4ReP7bEh2uJ4mAuU6Hv0uoBlpkE=;
        b=XfbURitjVgYf3NX+eSWC9i9d2NyVHOA2nAcjt5kpw9VORkTWtzR7mO1r/GTcUbggF5
         S+M7phO8lYWVNFDC+3qFh7Y2ugJNc0qPk7qIQx5hKL5/+sDcOsgtSXjTMLBbdIdWVc1L
         PuZbwrLuHcyxoR6ZnVv7/6exyJsZwVvRgbbw7J9IYA9ibbK+YAvxT+YbEHRieKn6bn1g
         XJgsucDoknlFTuetmuAvFz/CMN6kjwEyPCV1/jM5Lf0rntf1MAc7MmNWKDjtceECDrO1
         ExLVKD55BqOQc8vt4L+1BjJbEInpA//vG5P63lf8W9OTLCoPZsW9Er8cIKZ1ecvlMn/V
         Bm2Q==
X-Gm-Message-State: AOAM530PYh4A+GuQTmiYTSxDYJyAIKLb0W8ObHdHc42SQSecfZtNwzp8
	xBqzflAxnq24Jjf/70jXotDTqalRERE=
X-Google-Smtp-Source: ABdhPJxk/7n7vqhzfWI4igVzwzvzXEr4dxQ8GUBKnY1ttgPZ9T2Vy/ptlpasZLLYXUQK5Q5fFOJSMA==
X-Received: by 2002:a17:906:3496:: with SMTP id g22mr21818711ejb.143.1614714198151;
        Tue, 02 Mar 2021 11:43:18 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id c20sm18643278eja.22.2021.03.02.11.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 11:43:17 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anibal.limon@linaro.org,
	geoffhp@gmail.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] glib-2.0: call os.path.normpath on THISDIR
Date: Tue,  2 Mar 2021 20:32:29 +0100
Message-Id: <20210302193229.175044-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* some build environments have relative paths in THISDIR, e.g. from OEROOT set in:
  https://github.com/96boards/oe-rpb-manifest/blob/1e3345c26c56f77f3a15a3978f412a25955d2606/conf/bblayers.conf#L4
  and then the paths in filename normalized in:
  filename = os.path.normpath(os.path.join(path, meson.cross.d, element))
  don't match.

* COREBASE used here before didn't have this issue because the value is already
  normalized when set in:
  meta/conf/layer.conf:COREBASE = '${@os.path.normpath("${LAYERDIR}/../")}'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
index 882a89da7a..a2fa5345b4 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
@@ -31,7 +31,7 @@ def find_meson_cross_files(d):
     if bb.data.inherits_class('native', d):
         return ""
 
-    thisdir = d.getVar("THISDIR")
+    thisdir = os.path.normpath(d.getVar("THISDIR"))
     import collections
     sitedata = siteinfo_data(d)
     # filename -> found
-- 
2.30.0

