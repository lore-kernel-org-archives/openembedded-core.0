Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.3206.1613534457881399696
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 20:00:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iqtVxRJc;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: idadelm@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id d3so19336813lfg.10
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 20:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nYcm+NPrmbLkJYrOXyFNzOz8TiXgVhiyNZkfhT8FMvU=;
        b=iqtVxRJcd4V+3Hq+EW6fzVnY4OrDwSJUhr9bJjIlNV9bvpnHwf+bMeq9n8Z87JyRDE
         L5k8ghM5wl1SdZXhUc9p30j3Re+FN4OIAujp6YYqjAmD6lxYtu4Am+3BMmQM5dqRhXhj
         c5bHMd8ClZFAfrHHtWOcyJMRrDEe5SGUePhXqI41w3jg3IsHT8kG1OYXvruKd8+zdm+J
         gpIdu0b2zeAobg52IXtiv5NCpj7A/QPY+2EyMfOUEQXmgqpNCQbrIGHG96L9kOLw2M+c
         Q2K1YR2VcXu0tdy20eI4Ad0aav4RuLdYVz2GLzDyDRk7IVwKYj+75GlyhmBJjnd7rJNI
         JJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nYcm+NPrmbLkJYrOXyFNzOz8TiXgVhiyNZkfhT8FMvU=;
        b=oinwKT9HMtCrsga6D0BRHfEy+SNcxwyMwuoGWjIUiVB9TZpApXx+9rLge2LhnBoVqA
         41JqlJpepf1yzmJzuzI3F70iP8ctr5IILKPysxZ3+S46qDQN0ZdORTpeVg1DBWyJOgjL
         R+xeKsDzIoYBb/NOG6BtVjIT+lImu6CSyhg7mehu0DPJLHuru7JMxlasm1Gb3NurO1oF
         71D8IAeOi6V7pvsJVTQX15fIPpt7+joGdC4EepaBdWKaLcNvepe4/bPEhr9wHVNCkZYL
         8J9OhK5wfgeHaDuIcgZW8OsnIhrvY2K1llb4jQYmbpaGEcaeRwp3MMwACPy80OwLCQVk
         BaRQ==
X-Gm-Message-State: AOAM530jfnYYc/0p6VJCVo6hcM0PGbRdeCpN2p1b0G0D057jQQCSbMmi
	lLmVjEjGNCEGqReOfDG6pHowAfIuQRD3lA==
X-Google-Smtp-Source: ABdhPJzfkE4tKojE3KD6aVyWT+OTUYilPI1ueNeVPDuL/dmfT1iokSMuRfzRa0BsnAcTWolLJtA4GQ==
X-Received: by 2002:ac2:5509:: with SMTP id j9mr9915791lfk.564.1613534455897;
        Tue, 16 Feb 2021 20:00:55 -0800 (PST)
Return-Path: <idadelm@gmail.com>
Received: from localhost.localdomain ([129.0.101.17])
        by smtp.gmail.com with ESMTPSA id 5sm101464lff.176.2021.02.16.20.00.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 20:00:55 -0800 (PST)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky-contrib][RFC PATCH 1/5] package: Remove false positive lic warnings
Date: Wed, 17 Feb 2021 05:00:29 +0100
Message-Id: <20210217040033.21541-2-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217040033.21541-1-idadelm@gmail.com>
References: <20210217040033.21541-1-idadelm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recipe LICENSE strings are split into their individual license and the canonicalised to easy enable matching with licenses of sources.
License strings with "or-later" are replaced with "+" before comparism.
The warnings showup if and only if licenses in the sources don't match LICENSE value of the recipe.
Signed-off-by: Ida Delphine <idadelm@gmail.com>
---
 meta/classes/package.bbclass | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index ab96f141ae..c3259146b6 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1545,6 +1545,7 @@ PKGDESTWORK = "${WORKDIR}/pkgdata"
 PKGDATA_VARS = "PN PE PV PR PKGE PKGV PKGR LICENSE DESCRIPTION SUMMARY RDEPENDS RPROVIDES RRECOMMENDS RSUGGESTS RREPLACES RCONFLICTS SECTION PKG ALLOW_EMPTY FILES CONFFILES FILES_INFO PACKAGE_ADD_METADATA pkg_postinst pkg_postrm pkg_preinst pkg_prerm"
 
 python emit_pkgdata() {
+    import oe.license
     from glob import glob
     import json
     import subprocess
@@ -1762,7 +1763,21 @@ fi
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
+                    else:
+                        computedpkglicsperpkg.add(l)
+            if spdx_lic - computedpkglicsperpkg:
+                bb.warn("License for package %s is %s vs %s" % (pkg, computedpkglicsperpkg, spdx_lic))
 }
 emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse ${PKGDESTWORK}/runtime-rprovides"
 
-- 
2.25.1

