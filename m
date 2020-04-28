Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.188.1588040161135578821
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 19:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t8LPALQg;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id mq3so456537pjb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 19:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=LdcuA/qV5TJxlxwFO6JBApcN/VYj2jU2BljoM9eacMc=;
        b=t8LPALQgG/RUr3EJDeZFkf2cpRh1I5GEbt/OzClwbWs0ClfQHJTVoaRdBQ/fFfEaLF
         iTFFxvSj7t4fbf2fYnoE/ox/YjwGg1YUb8/9SPkiElt8HSaJXqqrLtt2XsQFwy3td12Q
         VO3sf/xuFB3Xa2bM2PjVLELqGcrU/s1u+djnfh37xTfmDVhBbHXADyyymksO6/wJbT6s
         j2ShegY42ywhcQvNIl/3zoVwbcMZyV+lVa4j/0oS1fnia1zZ69XUO3wF+8GoHAVNRGe8
         2l/7fNmCtUFx9eUgHnHOBRdLG5Ty0Cw2UI03AuD7xBafeoHssdxqdqlCX2hd/Nhsal6E
         AroA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=LdcuA/qV5TJxlxwFO6JBApcN/VYj2jU2BljoM9eacMc=;
        b=MgC6EIZKmWBkYluloc6dK5V9wj0c1rXF8FY66C9x40ewYck4NVN4tHDMAa4mgg3HUL
         Qs2f6vvK0qta1Z3ODP5YhvWDOHmyyLjMxUFJttZsY8iGwBHNpzCir6mtWpTZijr9Hwys
         l+vhPYHyCy2GHea6BpRDWzk0fGUa1aHe72/MMdU0nJDd02fmTxQZXVwIluN286getEdQ
         moeRQ5bIUKKksgA+no34H0V+8lO1b8Wo4I5nG/spmOakYVjWwb26CLQ9kBXZjYccY2MT
         SLL7bntL8pd2dnvUxgIGmsRpASK1jSOyAKCSlMIu9+eNXdgQTIEXG4l2NxkwErgJcN+I
         o5iw==
X-Gm-Message-State: AGi0PuZR4QjGjcI8XhyUeDAzpwxxL+PrGQmGGwtpxHxHjvDla6AVH/qS
	8LjcRr/SM7fSqDnfjf96HRKErEuN
X-Google-Smtp-Source: APiQypIlNVguDqtE+rjY0u3+j6cEjY/XXzSfGg4VXOLnQ0wKXOwd5pLCouYjyT9cUaKdIu0SKvYfZg==
X-Received: by 2002:a17:90a:d086:: with SMTP id k6mr2193814pju.47.1588040160309;
        Mon, 27 Apr 2020 19:16:00 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:f1bf:759e:e8cd:49cd])
        by smtp.gmail.com with ESMTPSA id 6sm12328390pgz.0.2020.04.27.19.15.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 19:15:59 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus 1/7] cve-check: CPE version '-' as all version
Date: Mon, 27 Apr 2020 19:15:50 -0700
Message-Id: <1e8e188514584f9f972c0eb733c10a61853ec3d0.1587931177.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1587931177.git.akuster808@gmail.com>
References: <cover.1587931177.git.akuster808@gmail.com>

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
index 5d84b93d719..2a530a04899 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -221,7 +221,7 @@ def check_cves(d, patched_cves):
                 (_, _, _, version_start, operator_start, version_end, operator_end) = row
                 #bb.debug(2, "Evaluating row " + str(row))
 
-                if (operator_start == '=' and pv == version_start):
+                if (operator_start == '=' and pv == version_start) or version_start == '-':
                     vulnerable = True
                 else:
                     if operator_start:
diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 575254af40c..1b4f31692ba 100644
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

