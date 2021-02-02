Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.49555.1612258393577774608
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 01:33:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TxQdHbnR;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: idadelm@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id l12so19674562wry.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Feb 2021 01:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kGtWv6dmCCUYKmt25amU22+aTA5EPlYgAeQMwJHa3CU=;
        b=TxQdHbnR843KE1ppcwjYX8zyBkoY9Cx+PsLA6IPtz/ISUNkhuMAS6zHPbMowklJd1l
         ZB4MPZi/wK5oQk6qaTtAz71EAg53Xr9Ek1mclp5U28DXQaRL0I7zipYbYg2drNY+G9Hv
         IyMmwAvFy9R22S9B4b7HNcksGIZfs2c92SvSiqRBhLBe54YqEyRWhzS09+LwbEtWPaqo
         +INWL/EFs8v/2yXkXPdsCavfprHYnXXbH4Z3z6TL8trKS/1XS3cbsgA+z9z1CrLYQm2j
         yahQe+SZjGFZQfkc0/y79Ekf9vY7lL+5f/8RQnYs1fJUC7ZNTxm5I3B3UiP/kA5l2MOW
         hLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kGtWv6dmCCUYKmt25amU22+aTA5EPlYgAeQMwJHa3CU=;
        b=KHfTs4jMtbQNqOhwfHgNAt5599qjSyJ5tC+qBErU65ss9zYQ6GcTsYubjH3Vi4Juhg
         0DmTbyqMI6UcbE0gzgNac8tDas6kodBL3RV+ci8W2foJjxrgp580r5fvIFrXR57KSU+T
         wxSYxeJnL2M/4L5NdxvcVuxRfOCD8inCEEc2oRxjNTAChNOgrAlBqmCVMjwdqXRdjeKO
         89oMog6FLKnBUq0z4PGVed/VA0cyE+vKBEu40d7Y8r1zhpL3IplVMdBG6GHm4H/hGsly
         R8scVQapeVssuxEug4Qh9yRr2HpY+r9fUhUcboBjObAuOcDTFHlbihKRUqXCswnXdvTh
         NNJA==
X-Gm-Message-State: AOAM532STOnRkL76O6gl+HGkb4JJBNMh3eLMp0hzzXSY+D4eD3/v6Er9
	cK8HZ4RRj7HK8ACbuR+eFiGvMfE5Gi9DsQ==
X-Google-Smtp-Source: ABdhPJxVf8/7+VGF50KYdShn02Q+z8o0jJVsGuJygLKnoIXwGgw3VnZ5kQAeoPGQ9kIFVV5u2/B9IA==
X-Received: by 2002:a05:6000:1374:: with SMTP id q20mr21789507wrz.44.1612258391970;
        Tue, 02 Feb 2021 01:33:11 -0800 (PST)
Return-Path: <idadelm@gmail.com>
Received: from ida-pc.lan ([41.202.219.241])
        by smtp.gmail.com with ESMTPSA id v1sm2067120wmj.31.2021.02.02.01.33.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 01:33:11 -0800 (PST)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta][RFC PATCH] meta/classes/package.bbclass: Remove false positive lic warnings
Date: Tue,  2 Feb 2021 10:32:33 +0100
Message-Id: <20210202093233.19555-1-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Warnings occur if and only if licenses in the sources don't match LICENSE value of the recipe.
Firstly, the recipe LICENSE strings are split into their individual license and the canonicalised to easy enable matching with licenses of sources.
With the IGNOREWITHLINUXSYSCALLNOTE variable set to "1" in local.conf, it removes the "WITH Linux syscall note" string attached to the license value for sources before comparism.
Added text to distinguish licenses from sources and those from recipes when warnings are outputed.

Signed-off-by: Ida Delphine <idadelm@gmail.com>
---
 meta/classes/package.bbclass | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index ab96f141ae..e814965d70 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1545,6 +1545,7 @@ PKGDESTWORK = "${WORKDIR}/pkgdata"
 PKGDATA_VARS = "PN PE PV PR PKGE PKGV PKGR LICENSE DESCRIPTION SUMMARY RDEPENDS RPROVIDES RRECOMMENDS RSUGGESTS RREPLACES RCONFLICTS SECTION PKG ALLOW_EMPTY FILES CONFFILES FILES_INFO PACKAGE_ADD_METADATA pkg_postinst pkg_postrm pkg_preinst pkg_prerm"
 
 python emit_pkgdata() {
+    import oe.license
     from glob import glob
     import json
     import subprocess
@@ -1756,13 +1757,30 @@ fi
                     computedpkglics[pkg].update(computedlics[f])
             if not found:
                 bb.warn("%s not in %s" % (f, str(filemap)))
-        #if computedpkglics:
-        #    bb.warn(str(computedpkglics))
         for pkg in computedpkglics:
             lic = d.getVar('LICENSE_%s' % (pkg))
             if not lic:
                 lic = d.getVar('LICENSE')
-            bb.warn("License for package %s is %s vs %s" % (pkg, computedpkglics[pkg], lic))
+
+            # Splits the LICENSE values and canonicalise each license
+            # in the set of split license(s)    
+            split_lic = oe.license.list_licenses(lic)
+            spdx_lic = set([canonical_license(d, l) for l in split_lic])
+            if computedpkglics[pkg]:
+                computedpkglicsperpkg = set([])
+                for l in computedpkglics[pkg]:
+                    if l.endswith('-or-later'):
+                        lic_ = l.replace('-or-later', '+')
+                        computedpkglicsperpkg.add(lic_)
+                    elif l.endswith(' WITH Linux-syscall-note'):
+                        if d.getVar("IGNOREWITHLINUXSYSCALLNOTE") == "1":
+                            lic_ = l.replace(' WITH Linux-syscall-note', '')
+                            computedpkglicsperpkg.add(lic_)
+                    else:
+                        computedpkglicsperpkg.add(l)
+            # Displays warnings for licenses found in the recipes and not sources
+            if spdx_lic - computedpkglicsperpkg:
+                bb.warn("License for package %s is %s (source SPDX headers) vs %s (LICENSE)" % (pkg, computedpkglicsperpkg, str(spdx_lic)))
 }
 emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse ${PKGDESTWORK}/runtime-rprovides"
 
-- 
2.25.1

