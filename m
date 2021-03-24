Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web08.221.1616596779418908634
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 07:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=RAix58vC;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id e33so14783616pgm.13
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 07:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Qj4x1X9NmsNYyb2scVwXpeZZtWKBeEnXXr8ckFujECI=;
        b=RAix58vCS+pg9HQKzlAZCggPIUfojuVq0woXwFPcUO7H8hf6O+ugd8Zn8G9d6qbQW4
         QTXdLuBnmIaQsT4yzY0DfzlIXsCVhqkZcz2AMgFUPgzhRJQ68tyacPH1/KvAgvjG2QV7
         uZaUW04wU7rc7iFK9ekuuQiQJ9ggf5c/GeQ1kVitzmZcUBgT/I6YemR2hgOgfDwyIUeT
         nNQQtyDfNV+6DvTgisSE7Ij6ugKC13K8kbHiVE43VPAoA3QlnOEQuO9czlcrm5F/8A9O
         ZqZAoADY6OSndAgxSdOL4aRsk89WZkGy9/6nUyopWZQsH9oVVabu5tuK1JaLiPM1chbj
         yb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qj4x1X9NmsNYyb2scVwXpeZZtWKBeEnXXr8ckFujECI=;
        b=bbJssPHqy6iJetQB0y/0si+IzOXn40HfstzrofgWhf5MAVNPQ6BAg3stx2z51V4BWc
         LTR02P9s7EOAWdzM6KyssW7oqXZUfRc2aRgPRcfJraCT0I7Zt8OBIDnDc7WLcGjplWyK
         URZKAIdF8f/pUnIxxotLbPURJtRZ2O18/zHoF6yzKI2kP3Paf83ErdiQbeKTsgYsLpP5
         2PTRP1s5lAs2KlY7r0ndGIirC+Ukp9S2eGKHY1xbSb3XmgA1LVu0TQkHNdh2arOQxZPh
         dp2/OsFpySE9A2oLtJIiI648Lgu82UE2lxEivcWtk5tIK0vW4wpiwqkQfhuGb3UsyDWh
         zNNQ==
X-Gm-Message-State: AOAM532Iirrc09MrHnxz0yAu09Y1Nk5jAZbaJcXhjHYjQZVKECgaHFGM
	Uk4HdIkl9DL4A7JQroFG15f7+tIw2i8WT03z
X-Google-Smtp-Source: ABdhPJzFMhNPJMidL+5DtQhLyW8SAunfkMDNyF4Rwke+gzRz6QtdWVKz6anU54tXVMBgzsHX/DfM2g==
X-Received: by 2002:a63:c90a:: with SMTP id o10mr3381366pgg.172.1616596778144;
        Wed, 24 Mar 2021 07:39:38 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w17sm2705806pgg.41.2021.03.24.07.39.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 07:39:37 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/21] Revert "sstatesig.py: show an error instead of warning when sstate manifest isn't found"
Date: Wed, 24 Mar 2021 04:38:56 -1000
Message-Id: <4cf332213811ae71f3dd46cb0eb0f22b6ffff562.1616596544.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616596544.git.steve@sakoman.com>
References: <cover.1616596544.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Causes breakage in other layers

This reverts commit e0c1db170fdd6c1d78fdfce017feae26c96fac29.
---
 meta/lib/oe/sstatesig.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 51e1d492c3..aeceb100d7 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -453,7 +453,7 @@ def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
         manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-%s-%s.%s" % (pkgarch, taskdata, taskname))
         if os.path.exists(manifest):
             return manifest, d2
-    bb.error("Manifest %s not found in %s (variant '%s')?" % (manifest, d2.expand(" ".join(pkgarchs)), variant))
+    bb.warn("Manifest %s not found in %s (variant '%s')?" % (manifest, d2.expand(" ".join(pkgarchs)), variant))
     return None, d2
 
 def OEOuthashBasic(path, sigfile, task, d):
-- 
2.25.1

