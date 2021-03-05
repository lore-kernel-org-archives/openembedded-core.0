Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.12869.1614955668738494768
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:47:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Dl2YtUkx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id q204so2191366pfq.10
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IqnOkPRlwNp9UoPzPxivvn8/l0dk7yCvB9E7nJiGYXA=;
        b=Dl2YtUkxVnIMteIMrPAhVGYGURJ5uu1rG2vzc/jAmfYXnzJG30cVCP7j2WI8chf3Su
         Sn3hL+md9Uoohi7i5EiHayom08qbYbtHXxWp0iZ+Q/Iz3pAriOp2khwo3kuCYRV1fHUk
         X+lSCE3uJKWYngBVUHF02hJ+fabpOMDqZPse9l/WlgmODttXhlZQqeNoHTGozqcstWi1
         aJVH0AF89Su4dgZirN10/qYgJhZ29EoOiow5hnU6z9Ub3Ke7gcXgl9niqqiLeadfyBr8
         GJJOf3skSxsWqwqOsMcsS5btf57tJAWQ0UY2S3EWSQb6zY0FVTbW+VOjhIqfEPf9Z7Pg
         6b+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IqnOkPRlwNp9UoPzPxivvn8/l0dk7yCvB9E7nJiGYXA=;
        b=TjNAcgGEXf1R3FDEF/KUkFS1FmZeiKo4J/04QLSDIxYxUjnHm3DSUYhFGS161ddcJu
         jvOJnhWS3jf54Efl8O46+cNeHg0FLvJ9IOu6FKv7NIaFkvTk7wiNMSghbxmMkVNgo/Lm
         sugbrkbyT2OcgClq9KxB0ydTFpcGUP2f/qiQRerFgtwccbZdiifIV0qazMObPXUL8yxr
         tchVA4H/GPGKAeU8bgoPmpgi1C4bHIekdlxJONOLvUhMfyBIo2EGXz337thn3N0PnUlS
         j7KJBnQgAYP9cgg6cDfnN3orsSs06Mx9DfawlZkS/ciAFBc4v0WAuWyXRNplElWCyvSn
         Rlpw==
X-Gm-Message-State: AOAM532NWjfYQlcfGWat2eMC1CEMq1Nz9AUCCIQ9bMpakguIdcqPOSVV
	exqQmqGx4BV7ALCVYOWENF0/Ke4Igi/vF70D
X-Google-Smtp-Source: ABdhPJzoqfKrwai6a5A6HaCTOJnEoiESQuS+BYh70J/5mNd0yy9b480PaOHYnTOzF0C065CJIOJflQ==
X-Received: by 2002:aa7:82cf:0:b029:1cc:5393:ad8e with SMTP id f15-20020aa782cf0000b02901cc5393ad8emr9309596pfn.3.1614955667190;
        Fri, 05 Mar 2021 06:47:47 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.47.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:47:46 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/27] sstatesig.py: show an error instead of warning when sstate manifest isn't found
Date: Fri,  5 Mar 2021 04:46:18 -1000
Message-Id: <e0c1db170fdd6c1d78fdfce017feae26c96fac29.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614955420.git.steve@sakoman.com>
References: <cover.1614955420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Martin Jansa <Martin.Jansa@gmail.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 95607a26854d873399d2b9d7e5fcbffc0cbdba4c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/sstatesig.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index aeceb100d7..51e1d492c3 100644
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
2.25.1

