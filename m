Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.31598.1612763492849442319
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 21:51:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jAWmmUrS;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id o21so8088322pgn.12
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Feb 2021 21:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jsNHyP1fFc6tOpcKfFCNDWhbahKQzt3PkGdzpd0KXjo=;
        b=jAWmmUrSInuMjscizbZWBIfX5A2gUQVLJ5uvOE+QjPGoypqUekcDM9Ncrom13sqCaT
         OYhId1JJkpW4VkWnb6RMklxdCaycLi2ppkQcl96NJaaIy/KcmcwU7vAAZ0WE1TUL2W0P
         4JKxo/vqfwsiolE7Aayt5r7b+EMXw6+tZ96e9LEENz6Q5k9XBMPXn/yuMvSPdSJZYGRT
         wxWIgvD7RgKx09W5jV4d3ligIGHkmLnVIqf/kblUXdN21I3FAyuPMn8diIUD0gPCak0j
         X1UPqdybEtjTnIhJINeRo08v0U8TErcepIjBGOao12mjm8q4eeYD78IjYG3wzkBn8q3K
         NLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jsNHyP1fFc6tOpcKfFCNDWhbahKQzt3PkGdzpd0KXjo=;
        b=q8Pc+hoxVlmND1o5RCaFjYFSjYN7PlY+pqSznhMH53QbURH0t/YkFLgUvpApn2We3Q
         P1JKZvefnq6xWZM8HWyIhk8nDbITJHTOEGHaGKXQ8ZN0+Xo0q02eUV8Qa47zyhFV/jhg
         T+I7mfIdO9d85KBtLC9yZ09Qp+3gZ4Y+2kmVdipsc+fYPpft5vpDmhYFWshsegYYAJha
         eImhXMrPZ1BElah6OdGgjt6zWMKCyxJdiR6GPBVkLQ+Py+LQ12yg7bBL8HIXTAPKA5ae
         x+v82kMt2sdVRu0VmarPBo8Pc59eKmij96kBBTXkJksQbBxa7wg5dL2EQk6d8q4YF7jR
         +8gQ==
X-Gm-Message-State: AOAM532FzUxTRNFHdHujWZEIiCQIoNNht2R+s5p0zWOjpMtimzv3Wi/w
	0Ju79ju9S9B7msj581cVGVFv3NsFfgE=
X-Google-Smtp-Source: ABdhPJwkdsSGyWP9K86PbRN+Pc7qG4Uo/0i9+EyDYBjrV7CF+Xqr0LFS+sxJYCF3+fWkM0rWcUtE/Q==
X-Received: by 2002:aa7:97a4:0:b029:1de:7bf7:2f98 with SMTP id d4-20020aa797a40000b02901de7bf72f98mr1447746pfq.6.1612763492093;
        Sun, 07 Feb 2021 21:51:32 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id a31sm17254508pgb.93.2021.02.07.21.51.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 21:51:31 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] cve-check.bbclass: add layer to cve log
Date: Mon,  8 Feb 2021 05:51:29 +0000
Message-Id: <20210208055130.892351-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lets include whcih layer a package belongs to and
add it to the cve logs

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index ed86403b6bc..061af7a2760 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -335,6 +335,9 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
     """
 
     cve_file = d.getVar("CVE_CHECK_LOG")
+    fdir_name  = d.getVar("FILE_DIRNAME")
+    layer = fdir_name.split("/")[-3]
+
     nvd_link = "https://web.nvd.nist.gov/view/vuln/detail?vulnId="
     write_string = ""
     unpatched_cves = []
@@ -344,6 +347,7 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
         is_patched = cve in patched
         if is_patched and (d.getVar("CVE_CHECK_REPORT_PATCHED") != "1"):
             continue
+        write_string += "LAYER: %s\n" % layer
         write_string += "PACKAGE NAME: %s\n" % d.getVar("PN")
         write_string += "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDPE"), d.getVar("PV"))
         write_string += "CVE: %s\n" % cve
-- 
2.25.1

