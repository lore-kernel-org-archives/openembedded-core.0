Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.9484.1612361039631553849
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 06:03:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fz7x+lfW;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: idadelm@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id m13so24454561wro.12
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Feb 2021 06:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nYcm+NPrmbLkJYrOXyFNzOz8TiXgVhiyNZkfhT8FMvU=;
        b=fz7x+lfWxjlGBHCXy8cvJuXcLoMskUb1uDmTbKA5rWAvhRjT5S8yl0MYFlaiSQW6tD
         QFo5c9ZMyQOoOOyjZXx5u9F6LS4RVKiRT0EdmSflX8BcqTTI7pJCsel/PbBra0Wcirck
         MyLOEyN203l8QuvVyCKJZQKHIjON7qzgQ4vpl9fAzRxQlA2EimMu7IdKo97FgZm0DIdH
         GZUNkwp8rxrzLROIy+FGIuGYr2NkucKsEu+7SXZbuUm0GYhWboMrDMLsYSrbRJZY7AZN
         5fsgwmsh4EKdNlfJBk2ZOH8MDt/fV0OuhWsfhcreJw9hQDlezTFgvcH6BY8VSq8Lsz+C
         WoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nYcm+NPrmbLkJYrOXyFNzOz8TiXgVhiyNZkfhT8FMvU=;
        b=CS+wrFhW0CX3mam7WpFj2LXq9Z7kMfJzy4NccCjUZ2DmV23hcobqHoWrEG4LyS5es/
         UomG6x4ZIgfGRCN5rYEiE0SWxm6y9IoS7jJ+L9mrgR6NAbs4yyoXhJdtl1LbH/gvITQ7
         pWjfGv58g6qKnFXPF7qsNZja5DpM7pmllPSzVn17ciGn9WcNm6g9e1YMxwS4ptiDQj/M
         qI28paaJPux0DBLVqhxcU9wSNNx7XViNq3L4B65Z27Sgc/MwNbsG/g9RF+Nmf+YUFLpf
         Y82Sr3oWfzKOzjeXNJ4y23obmf0CzTwH7PKGRIAr0MCkfhZLRYDRSFPp7FTMqg6h8La6
         izYQ==
X-Gm-Message-State: AOAM532eVx/AeDjfHXtzjzG5uGfLizSb4myDco4w9W1LV1rfbOl8AT1m
	HeygVaVSFq7/P+pKYK/uS9Lp2w17rtVB6g==
X-Google-Smtp-Source: ABdhPJzBQjBUCZpYc02Zfr6X5uI5Ofhtjtc+txvO28Fq9+C8eETp9nN8Jv16/5irXEaMg2cCETcpzg==
X-Received: by 2002:adf:fd52:: with SMTP id h18mr3719969wrs.295.1612361037863;
        Wed, 03 Feb 2021 06:03:57 -0800 (PST)
Return-Path: <idadelm@gmail.com>
Received: from ida-pc.lan ([41.202.219.240])
        by smtp.gmail.com with ESMTPSA id m10sm3903005wro.7.2021.02.03.06.03.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 06:03:57 -0800 (PST)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta][RFC PATCH 1/3] package: Remove false positive lic warnings
Date: Wed,  3 Feb 2021 15:03:39 +0100
Message-Id: <20210203140341.130251-1-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
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

