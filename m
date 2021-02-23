Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.9705.1614087367220624773
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 05:36:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sLGO+iSA;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id lu16so34525869ejb.9
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Feb 2021 05:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6RjIO1vQcJQT+1ZvSKyzmw6qOu6NcsAwZmnUWpVDMUs=;
        b=sLGO+iSAl/ShOrNhO3zmukHebnAKeVnAxswmNDPo93AJBw3DLmmOXZHgiWz4rzq7fO
         eYTTlZHgUKiJua3PfoyaJxO0WFy1+YvY34h5rKh+4rI1CXCd7VPYemfNKsmjatpLQg/U
         8bXH6Dv9omsXrb3YWPxr0YHiecfH+tf5p2WrXQEFop0vK9IljyeWDIv+1CpZ9S6pJh3R
         VZ47oZpNV8s1Ic31Jy6TDYWMhsgxZhaaKqNdA5KoQAqN01PYNJhjXUL5hrHEB/pKd2aM
         9XYY4gokHPdYu37iNTFnMxv+BUs1wWXdrZld6JvMuIe/+fY0gsnibm9x58gfS7+Q//8e
         slwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6RjIO1vQcJQT+1ZvSKyzmw6qOu6NcsAwZmnUWpVDMUs=;
        b=nCQNGZEiSVEhODzUQuSdA7vV3LImO6wATRvXFraZqSR1N0HTbD8BOqCZ6JWIzQfbEe
         fKpD2ZmmPsdsoTUbCVDJIM/cuoBHXAOkDxscToFrsJgunaSvuCoy43+6jidapB+7Kzsm
         RdJTLRAmLtO6R3fz1ijLBZ0HHu7B/iipdIIWPk0MLK3GXOF9U4gcSrysdYNrdWPWgZlc
         izUe+vzxrsg0QhnnO3wFgKNOpr+l63+D2flp7P5PJenyBiKetCDS9heV97uBxj+ClOZ3
         JVauc5sC57OK7O+gGTLKDAkF6mWxYWSQnaqRv71P7GKyJWtZhIBHGC5uNcn9gWEr1spx
         QuEg==
X-Gm-Message-State: AOAM533cIJlXIcbTLTBZ99rKVjUV4JKAx/nUOGpJUV+XnScx94SaJXEz
	Uj6w5ZuMLxqsic8GFyvegGWhMH4tZCosjA==
X-Google-Smtp-Source: ABdhPJy0OvF8dMfwqzg9WcLSbX22thArZA+SdDFnKvsXuzYNWgxQVM43dn85k3HPDT9ID3YPyYYRig==
X-Received: by 2002:a17:907:2d8e:: with SMTP id gt14mr26446664ejc.325.1614087365733;
        Tue, 23 Feb 2021 05:36:05 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id h4sm15250934edv.80.2021.02.23.05.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 05:36:05 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [RFC][PATCH] sstatesig.py: show an error instead of warning when sstate manifest isn't found
Date: Tue, 23 Feb 2021 14:35:53 +0100
Message-Id: <20210223133553.3308667-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* not sure if there are some valid use-cases for missing manifest, but
  recently I'm seeing increasing number of build failures where something
  from native recipe is missing (seen it with pseudo, autoconf, nodejs
  recently) and the only indication that something is wrong (before showing
  sometimes misleading error like:
  recipe-sysroot-native/usr/bin/node: No such file or directory
  is this warning:
  NOTE: Running task 7844 of 12431 (/meta-oe/meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb:do_prepare_recipe_sysroot)
  NOTE: recipe nodejs-12.20.2-r0: task do_prepare_recipe_sysroot: Started
  WARNING: nodejs-12.20.2-r0 do_prepare_recipe_sysroot: Manifest /BUILD/sstate-control/manifest-x86_64_ubuntu-18.04-nodejs-native.populate_sysroot not found in x86_64 x86_64_ubuntu-18.04 (variant '')?
  NOTE: Running task 7845 of 12431 (/meta-oe/meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb:do_unpack)
  NOTE: recipe nodejs-12.20.2-r0: task do_unpack: Started
  WARNING: nodejs-12.20.2-r0 do_prepare_recipe_sysroot: Manifest /BUILD/sstate-control/manifest-x86_64_ubuntu-18.04-nodejs-native.populate_sysroot not found in x86_64 x86_64_ubuntu-18.04 (variant '')?
  NOTE: recipe nodejs-12.20.2-r0: task do_prepare_recipe_sysroot: Succeeded

  if I rebuild that native dependency, then it gets fixed and I don't
  see these failures in clean builds (as without sstate and with empty
  TMPDIR), only in incremental builds

* but if there isn't valid reason for missing manifest file, then I think
  it would be better to error early (or even bb.fatal())

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oe/sstatesig.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 84999ee94d..6cd6e11acc 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -453,7 +453,7 @@ def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
         manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-%s-%s.%s" % (pkgarch, taskdata, taskname))
         if os.path.exists(manifest):
             return manifest, d2
-    bb.warn("Manifest %s not found in %s (variant '%s')?" % (manifest, d2.expand(" ".join(pkgarchs)), variant))
+    bb.error("Manifest %s not found in %s (variant '%s')?" % (manifest, d2.expand(" ".join(pkgarchs)), variant))
     return None, d2
 
 def OEOuthashBasic(path, sigfile, task, d):
-- 
2.27.0

