Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web10.10028.1614349524682805221
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=voHljfi+;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.170, mailfrom: steve@sakoman.com)
Received: by mail-il1-f170.google.com with SMTP id c10so8132162ilo.8
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=thy793TZVrrEX5bVTRv4NX2qZ36SXSJD9Cc6gORTvRg=;
        b=voHljfi+2kTgUjSx7GHeMEfS/r0d/PKfC3L7/uDzd/q/VWOfJmyYKqN5EAwBpRiqHE
         9lsRynLwYw7TflCaHLOs3An7VR61vK8bxn47ijavNxA5rFanvVdP/HJtACVmmxWDwfco
         DWNPcJTt/vZJdHNnWpIiQ4rkUOrdVsmGRtr/tgZpVdVvVFk8kDzy5jOAQn+QbVfN3yMT
         o8LiZ+8cmqtFq1f9YMIZdrg2hyArZctlzhugSJxdrAMKpc6Pj4ZnaJn1NGfu02BVylYw
         L/oGXNdY3pi1a9ttbG1p11FBm+zBwW+soUKR7862qXrCcAPDSD4IK/IcwPuaBpZuKLlJ
         2wQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=thy793TZVrrEX5bVTRv4NX2qZ36SXSJD9Cc6gORTvRg=;
        b=Zwu9AzyqJKaW2W5OEFRIqKCQZF1xkMqMgY+5ih9kodk6myNOay43knxve6qzkkdh97
         UbjnDMm3ynd+yBalHfN1eqAlGOqxVjWqzKxHRdJGzgqISaoMqm1SJMGu2X5R5YaGqFul
         zsN4p9M+Tz9r7GzOO54ft/xXXKr7UMnkYo7qcSe8kgcmhCHTezDlyPq5UKj7MnSIo70b
         AULzQIMiYtSIogLzLOKoULyNtMnhNJTmNq31oxseAPW6+05OztHy6x+19Yswp5AsfpPo
         XFEwr1bbZq0+mE2bOR0J5WiUX8TFz1qyK9ZEROkaYpXxX+43choGfk7psK+D8DcX4fx2
         8yCQ==
X-Gm-Message-State: AOAM530LYuuCWW1H1YHZaZlVdhMHHkKGSnKG4PhQyhG9NM7LbM+8/gUz
	VPsHH/L/NHJi2nwJsAXYwRV/DWIIfznZeDzH
X-Google-Smtp-Source: ABdhPJzMehvbpf6ixbcRBP2eAv60O3n0aFCWF4HtbxJalh6BcmuHBJR1oFo308GtS/QK0AdMuOHz0w==
X-Received: by 2002:a92:740c:: with SMTP id p12mr2714473ilc.9.1614349523581;
        Fri, 26 Feb 2021 06:25:23 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.25.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:25:23 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/40] cve-check: add CVE_CHECK_REPORT_PATCHED variable to suppress reporting of patched CVEs
Date: Fri, 26 Feb 2021 04:23:48 -1000
Message-Id: <cdbed91b1e23d6373a759e87fcadb85a37fead8d.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Laplante <chris.laplante@agilent.com>

Default behavior is not changed. To suppress patched CVEs, set:

        CVE_CHECK_REPORT_PATCHED = ""

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 05bd9f1f006cf94cf5324f96df29cd5862abaf45)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 38 ++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 259852876c..edb704b187 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -41,14 +41,16 @@ CVE_CHECK_MANIFEST ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve
 CVE_CHECK_COPY_FILES ??= "1"
 CVE_CHECK_CREATE_MANIFEST ??= "1"
 
+CVE_CHECK_REPORT_PATCHED ??= "1"
+
 # Whitelist for packages (PN)
 CVE_CHECK_PN_WHITELIST ?= ""
 
 # Whitelist for CVE. If a CVE is found, then it is considered patched.
 # The value is a string containing space separated CVE values:
-# 
+#
 # CVE_CHECK_WHITELIST = 'CVE-2014-2524 CVE-2018-1234'
-# 
+#
 CVE_CHECK_WHITELIST ?= ""
 
 # set to "alphabetical" for version using single alphabetical character as increament release
@@ -339,12 +341,15 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
     bb.utils.mkdirhier(os.path.dirname(cve_file))
 
     for cve in sorted(cve_data):
+        is_patched = cve in patched
+        if is_patched and (d.getVar("CVE_CHECK_REPORT_PATCHED") != "1"):
+            continue
         write_string += "PACKAGE NAME: %s\n" % d.getVar("PN")
         write_string += "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDPE"), d.getVar("PV"))
         write_string += "CVE: %s\n" % cve
         if cve in whitelisted:
             write_string += "CVE STATUS: Whitelisted\n"
-        elif cve in patched:
+        elif is_patched:
             write_string += "CVE STATUS: Patched\n"
         else:
             unpatched_cves.append(cve)
@@ -358,19 +363,20 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
     if unpatched_cves:
         bb.warn("Found unpatched CVE (%s), for more information check %s" % (" ".join(unpatched_cves),cve_file))
 
-    with open(cve_file, "w") as f:
-        bb.note("Writing file %s with CVE information" % cve_file)
-        f.write(write_string)
-
-    if d.getVar("CVE_CHECK_COPY_FILES") == "1":
-        deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE")
-        bb.utils.mkdirhier(os.path.dirname(deploy_file))
-        with open(deploy_file, "w") as f:
+    if write_string:
+        with open(cve_file, "w") as f:
+            bb.note("Writing file %s with CVE information" % cve_file)
             f.write(write_string)
 
-    if d.getVar("CVE_CHECK_CREATE_MANIFEST") == "1":
-        cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
-        bb.utils.mkdirhier(cvelogpath)
+        if d.getVar("CVE_CHECK_COPY_FILES") == "1":
+            deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE")
+            bb.utils.mkdirhier(os.path.dirname(deploy_file))
+            with open(deploy_file, "w") as f:
+                f.write(write_string)
+
+        if d.getVar("CVE_CHECK_CREATE_MANIFEST") == "1":
+            cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
+            bb.utils.mkdirhier(cvelogpath)
 
-        with open(d.getVar("CVE_CHECK_TMP_FILE"), "a") as f:
-            f.write("%s" % write_string)
+            with open(d.getVar("CVE_CHECK_TMP_FILE"), "a") as f:
+                f.write("%s" % write_string)
-- 
2.25.1

