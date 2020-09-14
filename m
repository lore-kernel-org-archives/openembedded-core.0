Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.62244.1600092773799835929
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 07:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=nwKvl1D0;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id k14so1280575pgi.9
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 07:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=AULVbXkCKr+wzpzSLT+Jgy4CS8LCONvCJnwMadg43DA=;
        b=nwKvl1D0Ni/Sq+Zp7s9LFaNAOEiuIS62LqiOrPd1PjEAwHF5Gc/rD6lTZf3GoQozwW
         v1cZb3LXhYhys1CoWBKue+B25jOMrhBV1aKCUVeL8Jkbbor7FuCK65MXRHBk/mEf9mB7
         xuhABfq/OAbzzDzQeELryDCD28IJb8RJBGqd9/vnPob4MFsGrqkMg1rEq0hOIwce+ya9
         nRB7xLMxJIkBMUgZqaQ8HSf6DGh0qikCwu4pXw3mGGm0actGyuchPaKK1SuAZRn1aEUi
         Fp1RUpMOHqan0cA5/i2q1kWXW8G1abdKCe1omBfqwbkIOfNOFXDqDQvLUYf/9lrpJDF2
         mG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=AULVbXkCKr+wzpzSLT+Jgy4CS8LCONvCJnwMadg43DA=;
        b=OB7a+SyXD2H9QEP9KPeL6ga5crvCjpOgwOb0cBfoqTh2sZJ4FiJSFvdmuDVTrNtOOv
         HUc2yOYpDR3V0wnhQUfrzlPUdba9ubbcrHfISBA7ptpKloGxhKqFqNER7CMFk9ZRM1aY
         ww54MPQyhx2mpLmVxlNBQPmTTDNIkGbMTEKDN0zRa3F13ZRKoTItAoCJtK9QvvBh7nYK
         H9jA6wJc8FDcsicnOW8JMTzT+n61VklXJZcm+awt4IkcYYmB8FGtNL/dMDUPAmSFeXay
         Ax09Ahu6wlnbXTdjko/EVSWZx0yfI8MGEMB1IiCCPrNDuDv6oFv03VBu4ctAdaowWOZG
         F+3Q==
X-Gm-Message-State: AOAM53251yVgGr48iuFFNTf9C/9ZIqbrASF7wNsc8V4shhQBMt1O/rp2
	igTkY773ZW2SJSa2yzHYKnusFJLjqHjZU9Ok7Vg=
X-Google-Smtp-Source: ABdhPJwnbTKwym9qxR3x48Ygct3WbS5rs6LxJjA9p1eDj2Yxx8DbWzXGPUcAlchPJEd/EgsJXuDNBQ==
X-Received: by 2002:a17:902:c38a:: with SMTP id g10mr14790358plg.23.1600092772970;
        Mon, 14 Sep 2020 07:12:52 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id z22sm11053183pjq.2.2020.09.14.07.12.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:12:52 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/24] cve-check.bbclass: always save cve report
Date: Mon, 14 Sep 2020 04:11:38 -1000
Message-Id: <7e03d104a2919ca20b5a35ad58755b0268168042.1600092418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600092418.git.steve@sakoman.com>
References: <cover.1600092418.git.steve@sakoman.com>

From: akuster <akuster808@gmail.com>

The cve-check file should be saved always, it has good info.

Put a copy in the log dir as cve-summary with symlinks to latest run.

[Yocto #13974]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 859849c7b594d844819ad8c3f7d8325388d94b93)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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

