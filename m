Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.1314.1615332711683551936
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 15:31:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WQ98eEGy;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: idadelm@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id p21so30172797lfu.11
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 15:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dlR30mmcDyBKQGHk7r9sgAbLz/84RnOzKcgdQxpsEMU=;
        b=WQ98eEGy0O8PLvEVS2osjGYFqbZTqY96NfxIp39VvaAelZZw3u0cNzDXblVdhwlrIC
         Eog6iWzmycu9YS8005dTqM6UCt/r0CqccxVwzDpPHaR9MCnLc9L4AGyHiUlQRnNSX3wW
         Vo5ex69vO309m/XSWhf2a5bEGYFb73NKsi1yzqG3UWYyJDQJgL0RtrvjSUSO1J2718A8
         kRgeamDIcxx+w5tG/aM1OhEQ4bBZwORpK1+o6P32dXXAbHIq1FwT9GAODi7w1Bp1Tv0R
         SbBqevJpQKIGDkyVHYT5Xe3npDkwcVocbAFmdlz2V0MPGqU6WNnxt3leIPYFvoERRJdg
         PU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dlR30mmcDyBKQGHk7r9sgAbLz/84RnOzKcgdQxpsEMU=;
        b=FpqW5Djb5NvctNUVYGTOKphIsk1NNpGy2GOtxeB9iLEFSLPi79a7rui3CvpDzXHxcM
         mwoCDDR5F8QoRT36xTnSfBjzNzN/0qhcCqKwbzU1Tca1lG6l4Aw4wd0suQuwWrXnzfAa
         OPfrLsTcEZBF7OS1Osr0N6obiWjWKqF5YLWpIB4DHKkPlO5fYGy3SEn0auCyQXhWqf7h
         5wWraOoKnjam0oYgOwhAJq9tMURsNqPYJ0xyC/puSpyYLA3iT7q1mrMWSp0tpuTq5bvJ
         /4BQWfaxHYiGwL9NQnZ5zYx9UOahmRC/L05ROqIw9+bIvxYf1rsvY+Hy+opWVIa8h1O2
         pnWg==
X-Gm-Message-State: AOAM531ccSOzGM7LywAjDuGdLohk7G2S7m4xaRPrppCqcAWgcC1P/iuo
	g2dmyA0PsFr0541yWBxJWIFF3+qGfTvuMQ==
X-Google-Smtp-Source: ABdhPJx7bEXv3MuVu2d+Ywe9LeGXOILoMmjQ0/iZneGWzwZvqTofi2+1BOii9KOfMhHYsjq6Sh67vQ==
X-Received: by 2002:a19:7504:: with SMTP id y4mr261547lfe.616.1615332709369;
        Tue, 09 Mar 2021 15:31:49 -0800 (PST)
Return-Path: <idadelm@gmail.com>
Received: from ida-pc.lan ([129.0.101.11])
        by smtp.gmail.com with ESMTPSA id h19sm2261765lfc.87.2021.03.09.15.31.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 15:31:49 -0800 (PST)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky-contrib][PATCH 2/4] package.bbclass: Displays warnings for just licences in recipes.
Date: Wed, 10 Mar 2021 00:31:28 +0100
Message-Id: <20210309233130.104839-2-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309233130.104839-1-idadelm@gmail.com>
References: <20210309233130.104839-1-idadelm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the comparism between computedpkglics and recipe lics, the warnings are displayed if and only if there are licenses in the recipes not found in the sources.

Signed-off-by: Ida Delphine <idadelm@gmail.com>
---
 meta/classes/package.bbclass | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index c127178f95..4e1be661b3 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1551,6 +1551,7 @@ PKGDESTWORK = "${WORKDIR}/pkgdata"
 PKGDATA_VARS = "PN PE PV PR PKGE PKGV PKGR LICENSE DESCRIPTION SUMMARY RDEPENDS RPROVIDES RRECOMMENDS RSUGGESTS RREPLACES RCONFLICTS SECTION PKG ALLOW_EMPTY FILES CONFFILES FILES_INFO PACKAGE_ADD_METADATA pkg_postinst pkg_postrm pkg_preinst pkg_prerm"
 
 python emit_pkgdata() {
+    import oe.license
     from glob import glob
     import json
     import subprocess
@@ -1748,8 +1749,8 @@ fi
                     if r[0] not in computedlics:
                         computedlics[r[0]] = set()
                     computedlics[r[0]].add(filelics[subf])
-        #if computedlics:
-        #    bb.warn(str(computedlics))
+        
+        
         dvar = d.getVar('PKGD')
         for f in computedlics:
             shortf = f.replace(dvar, "")
@@ -1762,13 +1763,19 @@ fi
                     computedpkglics[pkg].update(computedlics[f])
             if not found:
                 bb.warn("%s not in %s" % (f, str(filemap)))
-        #if computedpkglics:
-        #    bb.warn(str(computedpkglics))
+        
         for pkg in computedpkglics:
             lic = d.getVar('LICENSE_%s' % (pkg))
             if not lic:
                 lic = d.getVar('LICENSE')
-            bb.warn("License for package %s is %s vs %s" % (pkg, computedpkglics[pkg], lic))
+
+            # Splits the LICENSE values and canonicalise each license
+            # in the set of split license(s)
+            spdx_lic = oe.license.split_spdx_lic(lic, d)    
+            
+            # Displays warnings for licenses found in the recipes and not sources
+            if spdx_lic - computedpkglics[pkg]:
+                bb.warn("License for package %s is %s vs %s" % (pkg, computedpkglics[pkg], spdx_lic))
 }
 emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse ${PKGDESTWORK}/runtime-rprovides"
 
-- 
2.25.1

