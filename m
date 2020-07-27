Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.47882.1595818353905193002
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2020 19:52:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fZnIFBvq;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id 72so7260992ple.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2020 19:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=igNTnlilCQ5fcZcf6N2pzIW0kJ7wNG1RRRwuoUa1zKE=;
        b=fZnIFBvqEQxR8sHR8wY23/ynN+xjCnLevPhmc2g1SfsfbaDlKgHjeKhSeuxbMPmUQL
         /8veimNa7SHvLNniRoD84Xs9GeOE+1+ER9U5wsgj2tUYFAzAAmqkAuBgAKXkUbVUyIc0
         0yC30iXWw1QroCIP06S1rfqbk3RjfxgMkS9WF5AHYSqOxklmH0djGROa4HUeu9lyb7Ss
         UIOORxxfhZH5Mq6v1O2bsoXPYpf+EdbBt5LSivQ6KqtoycY3cYVqYZDu+88S4cdlX5xI
         OJv3KaGCU+Sbs7iCgE3xm1OjJ2iK+O4u/dCT2F8qLIAI23G55peVH7Ba3YbtEQJBVLU3
         VtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=igNTnlilCQ5fcZcf6N2pzIW0kJ7wNG1RRRwuoUa1zKE=;
        b=LBnpf/qDUtpFpLYrK6JO+j721/+yJCk259wUrBdtLUwZ46UzcecVjNpOIQb/guX0Pk
         q6aOrVavPnoTlRCnenf7KDMCEeLe09W0Pm+CN8qPYimC593HhOkzHSiAs5EzSXf2uSJm
         YgnQ+f9clmwEBE2wCSomNMMFM8ZQTCj6n34g5lGHGTiEWP5AZr2BFST9WK1KX0fmtmgi
         stju6Kb2TwwGo/Lr44dY7OJu78JDCCvydi1mpLQSISDfPift/r7rwvHsg8Q4QHIpODOC
         Zr/WA7cPCdHMD7yTc58QR+hT//C/FZrsHNfRq7CEtMN/2Zx/Oe5lHUpeFqiUNVjoA8kb
         /ULg==
X-Gm-Message-State: AOAM5335jxB+i11EVc0rNjYACgspUbRybsgfGhkHsPd2d6MYf5FKpWZ+
	4D48oE7XyMKZNfM4BIA6p1uFNO6+foc=
X-Google-Smtp-Source: ABdhPJxulhOP6Rozn5+Q7TPEBard4ilN4AbccJBpcpy/bpS5of6Iseea8qJrmApEirXCjvlrZ21KDw==
X-Received: by 2002:a17:90a:d357:: with SMTP id i23mr5808065pjx.155.1595818353006;
        Sun, 26 Jul 2020 19:52:33 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:957c:826:e40f:5fde])
        by smtp.gmail.com with ESMTPSA id f207sm13415778pfa.107.2020.07.26.19.52.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 19:52:32 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [v2][PATCH] cve-check: print warning if file is missing
Date: Sun, 26 Jul 2020 19:52:31 -0700
Message-Id: <20200727025231.24418-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

If the "tmp/cve_check" file was not create as in the case for -c populate_sdk, just print a
warning instead of dumping a trace back

---
v2] lets include the missing part of the patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 0889e7544aa..b16da9890af 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -55,6 +55,10 @@ python cve_save_summary_handler () {
 
     cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
 
+    if not os.path.isfile(cve_tmp_file):
+        bb.warn("File Not found: %s" % cve_tmp_file)
+        return
+
     cve_summary_name = d.getVar("CVE_CHECK_SUMMARY_FILE_NAME")
     cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
     bb.utils.mkdirhier(cvelogpath)
-- 
2.17.1

