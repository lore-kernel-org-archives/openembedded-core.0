Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.5623.1615884565643369203
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 01:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J8vacF0I;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: idadelm@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id t18so13395128lfl.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 01:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MVe0i/lya6WuUF32KP34PJtqwKq1cUWlFmt3YEJcAWQ=;
        b=J8vacF0IU42uxDnjNVntmbmh/GHKCudP8g7kkyvigyhZQO+FMAhPqo7dI7ClEerxXO
         AILyxIYpR9lEdw7x6WFg8P/iQpHrBd4KRM6DJhJfbB/i0/nFPAZt/HKZPeLZiyIhMm+4
         h+uOzNBZ72tVo9Hj1VFHGBuKy6Szuui/ydRu2AQ1yE8Fxik8lEObHZLYQFGZDR1sWGm3
         CDg6nJyxzVbj6jNAhzwlXyqksxWlo4JLuQfetIH6lXYG/oJ5rLZNwTReU1N1X7uImGvB
         OtBmmgf2COkEmx6zreBLjH0o7BFJ0XGmHpy42brdDdYZod3UVz8lDL+ZJyB+iR9O0vjf
         TU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MVe0i/lya6WuUF32KP34PJtqwKq1cUWlFmt3YEJcAWQ=;
        b=p5onkTJc4sC5uid3yNAHIBmhZArTWX2H4V/AD1NbA8ZAzR5xPhx1EK/dCf5lsPmuYR
         f2wHDS3AE4SilBCtHVBiNx+3mx8s3oQ/uci3yRrIzcrYSV6Dlb7RNV+nJJNCbaybWl0y
         6izWx59VEPDIROGgzexXJLTK/d2mRIrOCUhJnmMg0oP2LJ5CJsGebjCaFxLAzZA82HA5
         Rd+Dg3/bb9cT2IXu4Ptlw4AT5h/119ckDapJ3msPTCDRMAhmSxc+wRnSPsu+gw6I/zF7
         s/q6gtMTzd3bol0iJQndjeb2lnDfnS4CAR1crr3PWOXkd/hni3f+x2X4UDJze5AkfW0H
         g0TQ==
X-Gm-Message-State: AOAM533AdnJIPt35NAiAqOtpjf2/UtZ22k60RS+qkj9pyXxzzWEkjHsn
	B5qnMvVUjdXtR6931CMSfKcSV6Ujo65C/w==
X-Google-Smtp-Source: ABdhPJymyRzwuQbJQadwoWd4r7NRCdgHPHRMYQoUQ7G6sGFDbtdmFswt+OSUIj6+4YCwXeJTvHA7yA==
X-Received: by 2002:ac2:490b:: with SMTP id n11mr10140632lfi.491.1615884563707;
        Tue, 16 Mar 2021 01:49:23 -0700 (PDT)
Return-Path: <idadelm@gmail.com>
Received: from ida-pc.lan ([129.0.78.220])
        by smtp.gmail.com with ESMTPSA id j22sm2942780lfr.37.2021.03.16.01.49.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 01:49:23 -0700 (PDT)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky-contrib][PATCH v2 4/6] package.bbclass: Displays warnings for just licences in recipes.
Date: Tue, 16 Mar 2021 09:48:43 +0100
Message-Id: <20210316084845.379201-4-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316084845.379201-1-idadelm@gmail.com>
References: <20210316084845.379201-1-idadelm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the comparism between computedpkglics and recipe lics, the warnings are displayed if and only if there are licenses in the recipes not found in the sources.

Signed-off-by: Ida Delphine <idadelm@gmail.com>
---
 meta/classes/package.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index ab96f141ae..efdc169275 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1548,6 +1548,7 @@ python emit_pkgdata() {
     from glob import glob
     import json
     import subprocess
+    import oe.license
 
     def process_postinst_on_target(pkg, mlprefix):
         pkgval = d.getVar('PKG_%s' % pkg)
@@ -1762,7 +1763,11 @@ fi
             lic = d.getVar('LICENSE_%s' % (pkg))
             if not lic:
                 lic = d.getVar('LICENSE')
-            bb.warn("License for package %s is %s vs %s" % (pkg, computedpkglics[pkg], lic))
+            spdx_lic = oe.license.split_spdx_lic(lic, d)
+
+            # Displays warnings for licenses found in the recipes and not sources
+            if spdx_lic - computedpkglics[pkg]:
+                bb.warn("License for package %s is %s vs %s" % (pkg, computedpkglics[pkg], spdx_lic))
 }
 emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse ${PKGDESTWORK}/runtime-rprovides"
 
-- 
2.25.1

