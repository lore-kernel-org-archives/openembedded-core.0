Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0AFDC433FE
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 20:26:33 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web08.466.1634243193065915080
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 13:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NtLH+XJY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id m42so499856wms.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 13:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LaC0gvqtKf9/qcQr8YDWaWRU084CqDmgW6YWh4fQ68w=;
        b=NtLH+XJY1oOLozchyMva+WxCuhHRa7nFC7ULouVY5d5FvJ8qGRUwmejkUhKMECVng8
         ElkBojfy/1vwv/CIGmVlBC76ZfAl4AKP1pG8lQjgD+aYVpPUD+vnl9nsaMVoiSZVCSjd
         +4AcdBOmxWnZhtbJ15kpsUoEyZ4KqZC8SXiCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LaC0gvqtKf9/qcQr8YDWaWRU084CqDmgW6YWh4fQ68w=;
        b=Qv28xn8JdSp1kb74TyUIoqKNCql1X3dBuQDdtKqnggsR8cIj6oVnkwuV220GMxQTaJ
         qPO9k2IBptrVY2xkjwml2mfqq1eiqh0AhBUi6+Dg/1vbisCgRJT+FwihYicnA9kDzdVJ
         T4Qs5IK9rWQGT4Z6ffArqZX6o2hKXvSrSQEPiysIpP6F4BymAYWgOeGacOTYwIMAy72a
         t+SAS7I9wSqiOSbBx1NZVVdovMvtkcuvfUiworzNm68AiaHntA414LW1QEGIHCdmdefp
         p+Sw2HpJyxWmp7kW5/Z1vwodAKjj2iFUSlIZnJ6a/DnOYARJAViqnwIjJmBPsyqOBJO1
         //rA==
X-Gm-Message-State: AOAM530bllAgDY1AtBk8XwcAuWAZLp0GUStHLj0upBwKr374qXZUezF+
	Svi5G1yDWYCWa6D29WYZTX+sUUqYJs1C3g==
X-Google-Smtp-Source: 
 ABdhPJzNEScmUJ6NGAA61zVHFbWZ7q3mcGoG6uGxc6y9x8lxzDzCLYFgxoCPXzfXl5+muMvwKiUanw==
X-Received: by 2002:a1c:9a4d:: with SMTP id c74mr7922269wme.139.1634243191457;
        Thu, 14 Oct 2021 13:26:31 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3c2a:82f4:3a7b:54b1])
        by smtp.gmail.com with ESMTPSA id
 u2sm3063516wrr.35.2021.10.14.13.26.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 13:26:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] insane/qa: Improve and cleanup fatal error handling
Date: Thu, 14 Oct 2021 21:26:30 +0100
Message-Id: <20211014202630.2927426-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211014202630.2927426-1-richard.purdie@linuxfoundation.org>
References: <20211014202630.2927426-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 20:26:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156973

Move the "exit with a fatal error" code into a common function
and also improve the confusing variable to something at least self
contained in the same code segment.

This will hopefully allow the insane code return value passing to be
cleaned up too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/insane.bbclass  | 27 ++++++++-------------------
 meta/classes/package.bbclass |  4 +---
 meta/lib/oe/qa.py            |  6 +++++-
 3 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index d34ed77faa7..62863e5b0ae 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -18,8 +18,6 @@
 #   files under exec_prefix
 #  -Check if the package name is upper case
 
-QA_SANE = "True"
-
 # Elect whether a given type of error is a warning or error, they may
 # have been set by other files.
 WARN_QA ?= " libdir xorg-driver-abi \
@@ -492,7 +490,6 @@ python populate_lic_qa_checksum() {
     """
     Check for changes in the license files.
     """
-    sane = True
 
     lic_files = d.getVar('LIC_FILES_CHKSUM') or ''
     lic = d.getVar('LICENSE')
@@ -502,7 +499,7 @@ python populate_lic_qa_checksum() {
         return
 
     if not lic_files and d.getVar('SRC_URI'):
-        sane &= oe.qa.handle_error("license-checksum", pn + ": Recipe file fetches files and does not have license file information (LIC_FILES_CHKSUM)", d)
+        oe.qa.handle_error("license-checksum", pn + ": Recipe file fetches files and does not have license file information (LIC_FILES_CHKSUM)", d)
 
     srcdir = d.getVar('S')
     corebase_licensefile = d.getVar('COREBASE') + "/LICENSE"
@@ -510,11 +507,11 @@ python populate_lic_qa_checksum() {
         try:
             (type, host, path, user, pswd, parm) = bb.fetch.decodeurl(url)
         except bb.fetch.MalformedUrl:
-            sane &= oe.qa.handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM contains an invalid URL: " + url, d)
+            oe.qa.handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM contains an invalid URL: " + url, d)
             continue
         srclicfile = os.path.join(srcdir, path)
         if not os.path.isfile(srclicfile):
-            sane &= oe.qa.handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM points to an invalid file: " + srclicfile, d)
+            oe.qa.handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM points to an invalid file: " + srclicfile, d)
             continue
 
         if (srclicfile == corebase_licensefile):
@@ -582,10 +579,9 @@ python populate_lic_qa_checksum() {
             else:
                 msg = pn + ": LIC_FILES_CHKSUM is not specified for " +  url
                 msg = msg + "\n" + pn + ": The md5 checksum is " + md5chksum
-            sane &= oe.qa.handle_error("license-checksum", msg, d)
+            oe.qa.handle_error("license-checksum", msg, d)
 
-    if not sane:
-        bb.fatal("Fatal QA errors found, failing task.")
+    oe.qa.exit_if_errors(d)
 }
 
 def qa_check_staged(path,d):
@@ -1067,9 +1063,7 @@ python do_package_qa () {
     if 'libdir' in d.getVar("ALL_QA").split():
         package_qa_check_libdir(d)
 
-    qa_sane = d.getVar("QA_SANE")
-    if not qa_sane:
-        bb.fatal("QA run found fatal errors. Please consider fixing them.")
+    oe.qa.exit_if_errors(d)
     bb.note("DONE with PACKAGE QA")
 }
 
@@ -1241,9 +1235,7 @@ Rerun configure task after fixing this."""
                 error_msg = "%s: invalid PACKAGECONFIG: %s" % (pn, pconfig)
                 oe.qa.handle_error("invalid-packageconfig", error_msg, d)
 
-    qa_sane = d.getVar("QA_SANE")
-    if not qa_sane:
-        bb.fatal("Fatal QA errors found, failing task.")
+    oe.qa.exit_if_errors(d)
 }
 
 python do_qa_unpack() {
@@ -1352,8 +1344,5 @@ python () {
                     oe.qa.handle_error("native-last", "%s: native/nativesdk class is not inherited last, this can result in unexpected behaviour. "
                                              "Classes inherited after native/nativesdk: %s" % (pn, " ".join(broken_order)), d)
 
-
-    qa_sane = d.getVar("QA_SANE")
-    if not qa_sane:
-        bb.fatal("Fatal QA errors found, failing task.")
+    oe.qa.exit_if_errors(d)
 }
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 414dcab02de..92eba988929 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -2453,9 +2453,7 @@ python do_package () {
     for f in (d.getVar('PACKAGEFUNCS') or '').split():
         bb.build.exec_func(f, d)
 
-    qa_sane = d.getVar("QA_SANE")
-    if not qa_sane:
-        bb.fatal("Fatal QA errors found, failing task.")
+    oe.qa.exit_if_errors(d)
 }
 
 do_package[dirs] = "${SHLIBSWORKDIR} ${PKGDESTWORK} ${D}"
diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index c198e3597cb..69e5e9c32bf 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -182,7 +182,7 @@ def handle_error(error_class, error_msg, d):
     if error_class in (d.getVar("ERROR_QA") or "").split():
         write_error(error_class, error_msg, d)
         bb.error("QA Issue: %s [%s]" % (error_msg, error_class))
-        d.setVar("QA_SANE", False)
+        d.setVar("QA_FATAL_ERRORS", True)
         return False
     elif error_class in (d.getVar("WARN_QA") or "").split():
         write_error(error_class, error_msg, d)
@@ -191,6 +191,10 @@ def handle_error(error_class, error_msg, d):
         bb.note("QA Issue: %s [%s]" % (error_msg, error_class))
     return True
 
+def exit_if_errors(d):
+    if d.getVar("QA_FATAL_ERRORS"):
+        bb.fatal("QA run found fatal errors. Please consider fixing them.")
+
 def add_message(messages, section, new_msg):
     if section not in messages:
         messages[section] = new_msg
-- 
2.32.0


