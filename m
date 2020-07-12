Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web11.6757.1594593511812372341
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2020 15:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Dwr6DxHd;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id f2so4618097plr.8
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2020 15:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=hNuGLT0n7fwjDO+IQsvfQxBHn6/dPvvt/CwuQ9gYKgs=;
        b=Dwr6DxHdXaMb5BkpzhqAUKGFoIDcJTymGyqtfyGrL+es8OI3wJNQyD//JJtDLsI6rN
         317UW+3IiMy0tT0YU3Vy1KjG6eheWWOdatFw4cRO5v0tM+nqvPgDK6OIxAP1flQt7wYS
         HSxRnypcxGwBWaAsjEr+HxEuf6MPARZGefy7iRmYKAKsNn1Wo8BOtBst8pBPBXu5Gzu6
         PROEt88n+uuhPHFJIYZ0m1bLexrewW+RZgIApoBXgs4xmLmieWqlZzSWRBkmwxlAioxN
         J3rbVCb8pm8Bnvb59K3W+BwtCJwlIscVLHq8ro78DUqwnBxcICr7cvlaGSEoHgSHFtu2
         xSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=hNuGLT0n7fwjDO+IQsvfQxBHn6/dPvvt/CwuQ9gYKgs=;
        b=UTMGQyjObtpY+/2o1zaWzG0V1zcyukvB3GIYavw8736WZwGZ/HwDtvNxddkeNx8rA8
         GQoXi+fmkr/g6KMvtkPBghn8OqdUrrUO8OAz1edK3PngLd4bHq+q8GaUgBSrHSilQBZZ
         wxD/xn4U31/EuEdLu6YjkEQA+H2hNTIqflH9eisINEGdW0ALYgBuo+yTNYu0mKGZbUlt
         wMOnpLn3y04prVLBYgpLy8GJDE3Qyz6TlPhQRMEJeGSyIhsIOE2oTCA5J79slAZL/fqV
         ktHvMNrKP8W/70Y4krDjNrs6/ElNttUjm9NeR1JyY4FYWMgnpUG67vrIsOOhVAQG8NAI
         ERQQ==
X-Gm-Message-State: AOAM5321IskYNNwOi4CPYsJKC9kzxq1rY+I2zdrpxEMQaCDRxqbu9vgW
	YpNwYl+/fuWize6ZgLk44h9+M+jduCY=
X-Google-Smtp-Source: ABdhPJyTd/+WhJOaflvTfeEi53CQRqFpB53OHgs7AN2xPW0RT2Ea/59Ba4TfWc+FAV76jy8338KRUQ==
X-Received: by 2002:a17:902:8641:: with SMTP id y1mr37345057plt.336.1594593510910;
        Sun, 12 Jul 2020 15:38:30 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id c187sm12355678pfc.146.2020.07.12.15.38.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 15:38:30 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cve-check.bbclass: always save cve report
Date: Sun, 12 Jul 2020 22:38:28 +0000
Message-Id: <20200712223828.584-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

The cve-check file should be saved always, it has good info.

Put a copy in the log dir as cve-summary with symlinks to latest run.

[Yocto #13974]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 514897e8b8..0889e7544a 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -30,6 +30,9 @@ CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_1.1.db"
 
 CVE_CHECK_LOG ?= "${T}/cve.log"
 CVE_CHECK_TMP_FILE ?= "${TMPDIR}/cve_check"
+CVE_CHECK_SUMMARY_DIR ?= "${LOG_DIR}/cve"
+CVE_CHECK_SUMMARY_FILE_NAME ?= "cve-summary"
+CVE_CHECK_SUMMARY_FILE ?= "${CVE_CHECK_SUMMARY_DIR}/${CVE_CHECK_SUMMARY_FILE_NAME}"
 
 CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
 CVE_CHECK_MANIFEST ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve"
@@ -46,6 +49,32 @@ CVE_CHECK_PN_WHITELIST ?= ""
 # 
 CVE_CHECK_WHITELIST ?= ""
 
+python cve_save_summary_handler () {
+    import shutil
+    import datetime
+
+    cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
+
+    cve_summary_name = d.getVar("CVE_CHECK_SUMMARY_FILE_NAME")
+    cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
+    bb.utils.mkdirhier(cvelogpath)
+
+    timestamp = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
+    cve_summary_file = os.path.join(cvelogpath, "%s-%s.txt" % (cve_summary_name, timestamp))
+
+    shutil.copyfile(cve_tmp_file, cve_summary_file)
+
+    if cve_summary_file and os.path.exists(cve_summary_file):
+        cvefile_link = os.path.join(cvelogpath, cve_summary_name)
+
+        if os.path.exists(os.path.realpath(cvefile_link)):
+            os.remove(cvefile_link)
+        os.symlink(os.path.basename(cve_summary_file), cvefile_link)
+}
+
+addhandler cve_save_summary_handler
+cve_save_summary_handler[eventmask] = "bb.event.BuildCompleted"
+
 python do_cve_check () {
     """
     Check recipe for patched and unpatched CVEs
@@ -331,5 +360,8 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
             f.write(write_string)
 
     if d.getVar("CVE_CHECK_CREATE_MANIFEST") == "1":
+        cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
+        bb.utils.mkdirhier(cvelogpath)
+
         with open(d.getVar("CVE_CHECK_TMP_FILE"), "a") as f:
             f.write("%s" % write_string)
-- 
2.17.1

