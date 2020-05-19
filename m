Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.13199.1589899890149913566
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 07:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fXgPMbyE;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id q24so1548122pjd.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 07:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=GaskdhDaNFtO2N1Fv7GQqVvi8wK16yPEY9xOJxELvQc=;
        b=fXgPMbyECRrtwFJzhL6dSSpH1sVVLlgyc/f9JY5FlgBqo/h2KhWoqqj34rzJFhOmSc
         d2uUZDwD8JvCaBVNmQJvymeUmWGvyAkY9lZv6lXeWHuDWWnW0TPWhG53wXHnRUglITT8
         GREIa/f9xy+NDE9SzVxwa/yQB/KBL6AoZ8qAJM6pP27MWUpAI7/j4yexl5b7IsXLFANI
         XeCJl6ufofO+FDEC4x3EjuDDhfvnn/z6eXLNmbN3o3mIayqax+5fG6Hs0f6oGxHT1O5d
         3sOsKs0BMenbau+iOyCQ2he3VpOeTQIo2uyZDRtfA6v0f58u6TI0svwtHrVHxrDYhGji
         eHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=GaskdhDaNFtO2N1Fv7GQqVvi8wK16yPEY9xOJxELvQc=;
        b=R/fIGRCGl+BUi4Pssp61vdiVzc6mFf6jJpuKRMd9h6uRbUayXi1q699jShoO3pzHYv
         3bm4M0hu4JLbvRFakFOt5nV6Zz1zhDCLjwlnrVUA0dZEWj5sAIgepa5NF8NfSOVOASmw
         nRo3qqxAXCcTVzN/k+0KS6ZkCr8G360kIAy8qMVrPgejRpswmvDebSkYthDTf1ffzpk+
         k3RRDxRMpMqbg3Z/WUhMLFP+nK5sznP9pN6W3lPjoxHUp+rxT7rzGJJOIbYlEnF0CjA2
         4juYFON+v2J8ET1/oXASYprElMDdc/1isSpUIns1BJ/ZfKcNcViJS72CCOaiBaj65E6P
         R5MQ==
X-Gm-Message-State: AOAM530Cq18o7ShgPbN916GFlwG1sPGV/x3HT7QIEyyckZu1FbFKttdL
	tTCEucaHje7u4NVSfW5YzloTm3gp
X-Google-Smtp-Source: ABdhPJydcXJU4tErBNVx+FgKcLvtxYvT6iRmd1hNdDKhof8JNTBSqs9DGUihpVn4JUVcJCSVmnXlMQ==
X-Received: by 2002:a17:90a:d307:: with SMTP id p7mr5619033pju.207.1589899889440;
        Tue, 19 May 2020 07:51:29 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id b63sm4551196pfg.86.2020.05.19.07.51.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:51:28 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [warrior 8/8] cve-check: CPE version '-' as all version
Date: Tue, 19 May 2020 07:51:15 -0700
Message-Id: <1d06fedf46c8f67fccde7a00d7199d7052c33b30.1589899663.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589899663.git.akuster808@gmail.com>
References: <cover.1589899663.git.akuster808@gmail.com>

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

