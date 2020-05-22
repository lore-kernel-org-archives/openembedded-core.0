Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.13886.1590157592538164560
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 07:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Sg6lpkTF;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id nu7so4998092pjb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 07:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=GaskdhDaNFtO2N1Fv7GQqVvi8wK16yPEY9xOJxELvQc=;
        b=Sg6lpkTFSTPCiMOd81O143kLff8SJogPtFScoegYYufTHsbdazICQg0pcRMpymYwd5
         uSof68SP40kWxZXTRnlsz3xgJOOLrMd60KI0TVmR+oEmWCVD+Rg0MjjF/VfcrEMgCYgY
         axGkW/TKYwn2i5rwxG20vV3NPmX/RksfCQdoCQWzM3JiFeU15tsBHoo7Yb5oloiew0JO
         KD9bAWF21prElYMngVzC6Xx4V+pdie5RXWLMeZvWxeXdEEgYyBubUyUFN3yb4cug09rI
         2D526+bXxb9HZPE7XM7zdChLa70FFs/Nt42qlC8N2HiHbA6reILdrzDHqex/wRWT/OAr
         e+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=GaskdhDaNFtO2N1Fv7GQqVvi8wK16yPEY9xOJxELvQc=;
        b=rSfEI/OOZVBN1XOXLv8F29soZjhimZ8Ia6v/NXPxJDsqRN8NCyeDTnFyN2ZFgfRfsa
         L3uv1k8d/bTfXDLEzjLBiiExWY6kcpO3RIZLcrcdm6GsJ5aEOvMMfMu+aun6jCygv+Wf
         0XzAsugdByF7OYuidDP8tMVpdp/hXtpVN7jHYN9F4wYNgLFKXMnlfQcuQ+j0t0JfMwcX
         8iKMAZrq2Aw04Is0+cHfo5/HGqBmxmzmhaXn6/nTYccyI6etTOpbG27v0hQW3CxihBiK
         wwz8SLcP6IcTwO5sxLMJZI6SGNvlhOXLE7y93waVcGnG4gEQfHfBPA1JJvGhNBp1lX4b
         NHRw==
X-Gm-Message-State: AOAM531N0ci6SxssFJCJ4pKHm5jdE47DeP2B8S4GlQw+I8F9/v6CnMZB
	ppcUhg0AlyAGld/T558oP9jmJLza
X-Google-Smtp-Source: ABdhPJx/gsgqV8iPc1DaK4acsqESWtD3CqaXN/CQRldIGeBAZtc3X8NNdJTiU8d/H7dQgEYy/HFvDw==
X-Received: by 2002:a17:902:522:: with SMTP id 31mr15128608plf.68.1590157591871;
        Fri, 22 May 2020 07:26:31 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:2019:1800:ef81:a76f])
        by smtp.gmail.com with ESMTPSA id v75sm7347763pjb.35.2020.05.22.07.26.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 07:26:31 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [warrior 8/8] cve-check: CPE version '-' as all version
Date: Fri, 22 May 2020 07:26:17 -0700
Message-Id: <1d06fedf46c8f67fccde7a00d7199d7052c33b30.1590157490.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590157490.git.akuster808@gmail.com>
References: <cover.1590157490.git.akuster808@gmail.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

CPE version could be '-' to mean no version info.
Current cve_check treat it as not valid and does not report these
CVE but some of these could be a valid vulnerabilities.

Since non-valid CVE can be whitelisted, so treat '-' as all version
and report all these CVE to capture possible vulnerabilities.

Non-valid CVE to be whitelisted separately.

[YOCTO #13617]

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c69ee3594079589d27c10db32bc288566ebde9ef)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass                 | 2 +-
 meta/recipes-core/meta/cve-update-db-native.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 01b3637469..0ab022b135 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -214,7 +214,7 @@ def check_cves(d, patched_cves):
                 (_, _, _, version_start, operator_start, version_end, operator_end) = row
                 #bb.debug(2, "Evaluating row " + str(row))
 
-                if (operator_start == '=' and pv == version_start):
+                if (operator_start == '=' and pv == version_start) or version_start == '-':
                     vulnerable = True
                 else:
                     if operator_start:
diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 575254af40..1b4f31692b 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -122,7 +122,7 @@ def parse_node_and_insert(c, node, cveId):
             product = cpe23[4]
             version = cpe23[5]
 
-            if version != '*':
+            if version != '*' and version != '-':
                 # Version is defined, this is a '=' match
                 yield [cveId, vendor, product, version, '=', '', '']
             else:
-- 
2.17.1

