Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.11392.1607008192578587417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:09:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=eBOxNAuL;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id n10so1556846pgv.8
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=qAJqJ8MsYpOVwM/22CnecThxaB9i8/CY5jTLcT1L40w=;
        b=eBOxNAuLItOzpcX00xXljHZz0jeIoDWmk9nbRReXgn6bNGMPX2S29fYsDDrf2nIxAF
         jl2FbuUwFuHMaXnnpFFy5o9/KtlMAJNu9gn1B8f9s98W8niS31yCyDRKCUq64FQrTMGH
         YvRSu5S8hltQgj4hqNRMdd6LzB3D5iIAyfsrmBiyjIjdAJ05hSckjVxJHqJfiMdyiocI
         67Wh+y6qzUwInEE9McF1oAOgl2URa/ISM0fq0NXcIfH6TauUhPWnoRsFi8Z8OV5Umi41
         xsqKItmYNbybptRxq++brjRvjztMDoKrVgfXvdtYK5rRv6gEdkWE4gtuHW987V2WOtPK
         QWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=qAJqJ8MsYpOVwM/22CnecThxaB9i8/CY5jTLcT1L40w=;
        b=HIvRtgGwH5V26VtfafvuYEoJCTKbPSiMPupsDp9RvffTQvVNPndKGzh5hQyST3/lER
         IdtYuECB+RZS316qv9xsKsf5LU428AqZ0i8WzoVR9sEKNtQd8G+ivPRryUHq5jv0MriF
         JqDiu1KYRxbJxwSJb4UiKM/SF3qgXQ5//ZIdBZLvn8B/O+DcbItRMU3W3mWEf47aPsSs
         DltSsrDgAOmFJSQpfk3LjRDsYQLZhM5TrdaLdNkqINfXQFNSex+Dk3aoEGhp7qXV2ZS7
         7EpdjepmlAXPfHgwt1uVt+cjhkppiZpusTSN3hls6sOuPGpIFjhKXPTY6gQOtqHVtBVJ
         d1Sw==
X-Gm-Message-State: AOAM532JHMJrXWJ3G9gdRwn18iJgly7rXJljcZBo7/XpahY5n4/2jL+N
	9XzWhsXlGPNzqq91+x/vzGC7SWIDg1BvCJS3
X-Google-Smtp-Source: ABdhPJy7P74Fwh4A86BEoiGwLDGm7GJfrWUoV5Z5M7IBV7Q6N9SWbh/xxQx0ti1GOY33/tSse8qunQ==
X-Received: by 2002:a63:7d0c:: with SMTP id y12mr3428378pgc.34.1607008191653;
        Thu, 03 Dec 2020 07:09:51 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm1632320pju.37.2020.12.03.07.09.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:09:50 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 28/28] uninative: Don't use single sstate for pseudo-native
Date: Thu,  3 Dec 2020 05:08:18 -1000
Message-Id: <6da46602b055815b513605b04857bf31c5fb82b4.1607007208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607007208.git.steve@sakoman.com>
References: <cover.1607007208.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

pseudo-native is a bit special. It conditionally compiles in support for
xattr, statx and statvfs amongst other options. If a pseudo-native binary is
used on a system where these functions are present but it wasn't compiled in
we see hard to debug permissions problems.

An example is the devtool.DevtoolExtractTests.test_devtool_deploy_target
oe-selftest which shows a cryptic error:

  File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/selftest/cases/devtool.py", line 1388, in test_devtool_deploy_target
    self.assertEqual(filelist1, filelist2)
  File "/usr/lib64/python3.9/unittest/case.py", line 831, in assertEqual
    assertion_func(first, second, msg=msg)
  File "/usr/lib64/python3.9/unittest/case.py", line 1037, in assertListEqual
    self.assertSequenceEqual(list1, list2, msg, seq_type=list)
  File "/usr/lib64/python3.9/unittest/case.py", line 1019, in assertSequenceEqual
    self.fail(msg)
  File "/usr/lib64/python3.9/unittest/case.py", line 670, in fail
    raise self.failureException(msg)

AssertionError: Lists differ: ['-rwxr-xr-x 6000 6000 /etc/init.d/mdmonitor', '-rw-r-[10124 chars]n.8'] != ['-rwxr-xr-x root root /etc/init.d/mdmonitor', '-rw-r-[10124 chars]n.8']

First differing element 0:
'-rwxr-xr-x 6000 6000 /etc/init.d/mdmonitor'
'-rwxr-xr-x root root /etc/init.d/mdmonitor'

This is due to a version of pseudo without statx being used on a system where
ls uses statx, hence the files are displayed as 6000.6000 instead of root.root.

Avoid this by always building pseudo-native for the specific distro in question rather
than using a universal sstate feed.

This hopefully fixes one of the mysterious AB-INT issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6e3785a3f1f3cf68f5fe101cd6bebe91db165973)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/base.bbclass   | 1 +
 meta/classes/sstate.bbclass | 4 ++++
 meta/lib/oe/sstatesig.py    | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 65b9d954c7..8a1b5f79c1 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -231,6 +231,7 @@ python base_eventhandler() {
     if isinstance(e, bb.event.ConfigParsed):
         if not d.getVar("NATIVELSBSTRING", False):
             d.setVar("NATIVELSBSTRING", lsb_distro_identifier(d))
+        d.setVar("ORIGNATIVELSBSTRING", d.getVar("NATIVELSBSTRING", False))
         d.setVar('BB_VERSION', bb.__version__)
 
     # There might be no bb.event.ConfigParsed event if bitbake server is
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 66a96a7603..a8e169a10b 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -72,6 +72,7 @@ BB_HASHFILENAME = "False ${SSTATE_PKGSPEC} ${SSTATE_SWSPEC}"
 
 SSTATE_ARCHS = " \
     ${BUILD_ARCH} \
+    ${BUILD_ARCH}_${ORIGNATIVELSBSTRING} \
     ${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS} \
     ${BUILD_ARCH}_${TARGET_ARCH} \
     ${SDK_ARCH}_${SDK_OS} \
@@ -80,6 +81,7 @@ SSTATE_ARCHS = " \
     ${PACKAGE_ARCH} \
     ${PACKAGE_EXTRA_ARCHS} \
     ${MACHINE_ARCH}"
+SSTATE_ARCHS[vardepsexclude] = "ORIGNATIVELSBSTRING"
 
 SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
 
@@ -121,6 +123,8 @@ SSTATE_HASHEQUIV_REPORT_TASKDATA[doc] = "Report additional useful data to the \
 python () {
     if bb.data.inherits_class('native', d):
         d.setVar('SSTATE_PKGARCH', d.getVar('BUILD_ARCH', False))
+        if d.getVar("PN") == "pseudo-native":
+            d.appendVar('SSTATE_PKGARCH', '_${ORIGNATIVELSBSTRING}')
     elif bb.data.inherits_class('crosssdk', d):
         d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS}"))
     elif bb.data.inherits_class('cross', d):
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index beaccdc909..f98543cc46 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -434,7 +434,7 @@ def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
         d2 = multilibcache[variant]
 
     if taskdata.endswith("-native"):
-        pkgarchs = ["${BUILD_ARCH}"]
+        pkgarchs = ["${BUILD_ARCH}", "${BUILD_ARCH}_${ORIGNATIVELSBSTRING}"]
     elif taskdata.startswith("nativesdk-"):
         pkgarchs = ["${SDK_ARCH}_${SDK_OS}", "allarch"]
     elif "-cross-canadian" in taskdata:
-- 
2.17.1

