Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web09.7693.1611915863189614675
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 02:24:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zyrm3Ku6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f54.google.com with SMTP id j13so9981248edp.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 02:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VzKrQv9pHYdRbFm768ovzZQKhyMEmGwsJyOHTYOJpnQ=;
        b=Zyrm3Ku6Xj2rHFewFa2yGbpqPC6d71OKpqNhO52cJxNGyQHK3szzOYj5GilkBqtBLm
         uvs7agk4Di06CxxSTF2gN8ZbvSHPFI+1ni3cyJpMQC6FWQZDtkXWz2m/fr7MFgmoUu3t
         K83OkftkQQvBNsFaqe+IKr4R8+wQ4Q0ChTcfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VzKrQv9pHYdRbFm768ovzZQKhyMEmGwsJyOHTYOJpnQ=;
        b=diKbRcxXkp8SjlkClHvV/GM7KX7u/pZOK+3WqLzJup3bP5XWzKb7nhBk43nfNYrN1G
         bbr7VCDcecmg2tKl2nVHYH2KXH+M2ven2sTz4k6e/1Dnypzqj9SZMHCsMQMukpLFl7lQ
         9ZEzd3NtftDKVRgsyZgeLFb/cojTX7C6t3nKck6KBLuJ+IOpn78R/g63LYCf/oZmArNB
         awr2ZGfD7jH/bVgCdx+RDiKg+lwEeqHpyoPYVzW5p1pSrWPzMP2HRGyX4yGEyBmOMYK7
         LyxZvvPX4LiB7GXTg0jm7K8iYjoYvWc8Gu9oH9CP+yHIaKNYIQ78GW0NqJK5os42eck9
         8+vA==
X-Gm-Message-State: AOAM531I31QYzwh+wdHYwzQDIaV+Qxr6zuu0wzt6YS/Rsbul1wqaquKv
	qb2/Oom6cejmMXcqCfBukHkJjP2fSs+3Xw==
X-Google-Smtp-Source: ABdhPJx3DaONDJ9wDeXrJk/8cV2X3exOQnOJ9xzZQ52QWgs/gDEmo3IQHrmbTafb2P3VopQC8hUdbQ==
X-Received: by 2002:a05:6402:208:: with SMTP id t8mr4244577edv.189.1611915861645;
        Fri, 29 Jan 2021 02:24:21 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:93ef:509c:4f16:14ff])
        by smtp.gmail.com with ESMTPSA id k22sm3554574eji.101.2021.01.29.02.24.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 02:24:21 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/13] package_rpm: Clean up unset runtime package variable handling
Date: Fri, 29 Jan 2021 10:24:09 +0000
Message-Id: <20210129102419.1360572-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
References: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the R* runtime package variables are unset it could cause trackbacks. There
were some fallbacks already, clean this up to handle consistently.

The code was expecting strings but setting defaults of empty lists
which silently were converted to strings by the "or" statements which
was a nightmare to understand or alter.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_rpm.bbclass | 40 ++++++++++++++++----------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 53b4700cddb..43a825ad424 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -300,13 +300,13 @@ python write_specfile () {
     srccustomtagschunk = get_package_additional_metadata("rpm", localdata)
 
     srcdepends     = d.getVar('DEPENDS')
-    srcrdepends    = []
-    srcrrecommends = []
-    srcrsuggests   = []
-    srcrprovides   = []
-    srcrreplaces   = []
-    srcrconflicts  = []
-    srcrobsoletes  = []
+    srcrdepends    = ""
+    srcrrecommends = ""
+    srcrsuggests   = ""
+    srcrprovides   = ""
+    srcrreplaces   = ""
+    srcrconflicts  = ""
+    srcrobsoletes  = ""
 
     srcrpreinst  = []
     srcrpostinst = []
@@ -365,13 +365,13 @@ python write_specfile () {
         # Map the dependencies into their final form
         mapping_rename_hook(localdata)
 
-        splitrdepends    = localdata.getVar('RDEPENDS')
-        splitrrecommends = localdata.getVar('RRECOMMENDS')
-        splitrsuggests   = localdata.getVar('RSUGGESTS')
-        splitrprovides   = localdata.getVar('RPROVIDES')
-        splitrreplaces   = localdata.getVar('RREPLACES')
-        splitrconflicts  = localdata.getVar('RCONFLICTS')
-        splitrobsoletes  = []
+        splitrdepends    = localdata.getVar('RDEPENDS') or ""
+        splitrrecommends = localdata.getVar('RRECOMMENDS') or ""
+        splitrsuggests   = localdata.getVar('RSUGGESTS') or ""
+        splitrprovides   = localdata.getVar('RPROVIDES') or ""
+        splitrreplaces   = localdata.getVar('RREPLACES') or ""
+        splitrconflicts  = localdata.getVar('RCONFLICTS') or ""
+        splitrobsoletes  = ""
 
         splitrpreinst  = localdata.getVar('pkg_preinst')
         splitrpostinst = localdata.getVar('pkg_postinst')
@@ -439,9 +439,9 @@ python write_specfile () {
             spec_preamble_bottom.append(splitcustomtagschunk)
 
         # Replaces == Obsoletes && Provides
-        robsoletes = bb.utils.explode_dep_versions2(splitrobsoletes or "")
-        rprovides = bb.utils.explode_dep_versions2(splitrprovides or "")
-        rreplaces = bb.utils.explode_dep_versions2(splitrreplaces or "")
+        robsoletes = bb.utils.explode_dep_versions2(splitrobsoletes)
+        rprovides = bb.utils.explode_dep_versions2(splitrprovides)
+        rreplaces = bb.utils.explode_dep_versions2(splitrreplaces)
         for dep in rreplaces:
             if not dep in robsoletes:
                 robsoletes[dep] = rreplaces[dep]
@@ -533,9 +533,9 @@ python write_specfile () {
     tail_source(d)
 
     # Replaces == Obsoletes && Provides
-    robsoletes = bb.utils.explode_dep_versions2(srcrobsoletes or "")
-    rprovides = bb.utils.explode_dep_versions2(srcrprovides or "")
-    rreplaces = bb.utils.explode_dep_versions2(srcrreplaces or "")
+    robsoletes = bb.utils.explode_dep_versions2(srcrobsoletes)
+    rprovides = bb.utils.explode_dep_versions2(srcrprovides)
+    rreplaces = bb.utils.explode_dep_versions2(srcrreplaces)
     for dep in rreplaces:
         if not dep in robsoletes:
             robsoletes[dep] = rreplaces[dep]
-- 
2.27.0

