Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web11.9956.1614349519795585140
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:25:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Qp2IJ2q5;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.173, mailfrom: steve@sakoman.com)
Received: by mail-il1-f173.google.com with SMTP id q9so8161677ilo.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lPwu4/boanXX25rVZYKtRZv//PZiEL9jO3Cd5xu/fYY=;
        b=Qp2IJ2q5jkmAF2nob+aO/IOH4/1zjQlY73WrWVRbssY6KuahkY9rZq+3fAsLjl9Lrq
         ExyXxjdGdaeAZxAB7A97Xbr5tqcbQp8RyiUngSeVyPB/6u1z3jylgIW0spsmBSX9/VTd
         JT4pvUDYRxONzkU8SoxDTKaDtHo0Px2olCYBIoeUm31/2gFVQdaGkowyfPKsolFGqdRz
         WJVY58Lv+ah2WnNeYgA922mOETVn781k/Zmle4C1i5Fs73+fwxh9GWZzjLeX/mL+gw50
         5qVxaOOvIcuruH8NnIqi+BJxb/0DDqAZNslouRDg/Q/2DNZV0wbIIWkYSW/ZXttiNb7H
         EXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lPwu4/boanXX25rVZYKtRZv//PZiEL9jO3Cd5xu/fYY=;
        b=b5ZqPW7+qszSS/u41L2ui8w31RcksXrxTmyqoGcb3jf4hRh1Wa6uQFvVBCRJ8adsJw
         NZDuLqBViUxQTAXFT+/S0qiky4pU1Stb0CtwBaTU6xxhcnaVXVNbi/k1nDs2FmjHPQh/
         OpGh9puiGs2gNTUSO0jH8cJnMNGfOLtUMwLQhgpZ6nIfhOIez2lXrt7lq5G6HhYuIn/5
         ijpYOcusBCo98j+6t0cvz+UVzauku5D17hMK1sDeuSwGy4mcMd9WOQsu/qYu8q/weh7B
         85CxO2FedIXzHSLMMePp0gcdnkEJ+sAPzlokfGQqcQ8g1I8UcabhCB++mh6qBFUBeo/p
         7fYw==
X-Gm-Message-State: AOAM532QATL6RRl0o29ausivfwOID7iUF55pjm3Wh4BFjvfwsSL3ZmBH
	FVa0pPPzjzM13XlJ3DGLyHvsmpx8lYRG/BrO
X-Google-Smtp-Source: ABdhPJxWcw0ud99W8CFntlXF91Dws4a6+s+mpdqppC8DZDea+Zkdfd6bmnh7ZE1403mffsw+UBcihw==
X-Received: by 2002:a92:c26f:: with SMTP id h15mr2525904ild.65.1614349518606;
        Fri, 26 Feb 2021 06:25:18 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.25.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:25:18 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/40] cve-check: introduce CVE_CHECK_RECIPE_FILE variable to allow changing of per-recipe check file
Date: Fri, 26 Feb 2021 04:23:47 -1000
Message-Id: <7432d1048f70a36c7e8e7eafb480cd0ad835eb78.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Laplante <chris.laplante@agilent.com>

The addition of this variable also makes it possible to change the
output suffix of the check files, e.g. in local.conf:

CVE_CHECK_MANIFEST_append = ".txt"
CVE_CHECK_RECIPE_FILE_append = ".txt"

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0d40f1482c6d87785ae47c46c2305e1df46f459a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index dbff852e18..259852876c 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -36,6 +36,7 @@ CVE_CHECK_SUMMARY_FILE_NAME ?= "cve-summary"
 CVE_CHECK_SUMMARY_FILE ?= "${CVE_CHECK_SUMMARY_DIR}/${CVE_CHECK_SUMMARY_FILE_NAME}"
 
 CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
+CVE_CHECK_RECIPE_FILE ?= "${CVE_CHECK_DIR}/${PN}"
 CVE_CHECK_MANIFEST ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve"
 CVE_CHECK_COPY_FILES ??= "1"
 CVE_CHECK_CREATE_MANIFEST ??= "1"
@@ -121,7 +122,7 @@ python cve_check_write_rootfs_manifest () {
     import shutil
 
     if d.getVar("CVE_CHECK_COPY_FILES") == "1":
-        deploy_file = os.path.join(d.getVar("CVE_CHECK_DIR"), d.getVar("PN"))
+        deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE")
         if os.path.exists(deploy_file):
             bb.utils.remove(deploy_file)
 
@@ -362,9 +363,8 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
         f.write(write_string)
 
     if d.getVar("CVE_CHECK_COPY_FILES") == "1":
-        cve_dir = d.getVar("CVE_CHECK_DIR")
-        bb.utils.mkdirhier(cve_dir)
-        deploy_file = os.path.join(cve_dir, d.getVar("PN"))
+        deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE")
+        bb.utils.mkdirhier(os.path.dirname(deploy_file))
         with open(deploy_file, "w") as f:
             f.write(write_string)
 
-- 
2.25.1

