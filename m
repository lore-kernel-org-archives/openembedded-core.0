Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.43687.1606170336012913396
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 14:25:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ew2BtnSl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id x22so798158wmc.5
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2020 14:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YtSxVOYi1QNlqDIzQDQXTifYrAJbeknUmpj+OywqvuY=;
        b=ew2BtnSllhY0BmccrTsJqZYzMzVK2d3ODR9Ee0LojOCEZFAC1NecGlFuyUnjYWGHk2
         8GlUlCXikvSnMBkMWxHGrG8GVualvyhF6Cv/GZAzaTDLylXKX92/1v1pZNhFtCPUgp0c
         rZ3Ekw/wb84wA3V7uoHORraj8bhvqQjyOzbHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YtSxVOYi1QNlqDIzQDQXTifYrAJbeknUmpj+OywqvuY=;
        b=DruJcdF1Lwmes8WtbqH3J8dz76+242Y/djhXuZWvzvey476RlYsCfoK5UWqyfAfbPn
         cwHUtFaKTRm8JXfQuDhvxwbc4UcYewcBpygdij1HrWhPwPkmiW4k4sjqZXn8R23gRrr3
         0PVea9snOJrqGcv0XNX+LckSU+1eI3BgPdLELOz55fQ6OqH2srohcr25VbKhplNc13z+
         6Z99PTGPTStkWpnblHN5DHpzA0tNB1LP7N+ZsSo2zskeK/jXqw4E15a2e8IzDKF6RJwF
         Cxon27hrodjnpfyj3SILyEzpprDfig9ZrpT0CE+G8jD5zSbTlxz10Ev9mqUxArobe6bO
         zzEw==
X-Gm-Message-State: AOAM530tWu9UdOexxuWHv7oRkLPZ8NiccPtiyCuM0SLMmXyEiHdsE9hf
	hqvltuXWSiNXrNXTErVqXBSjxh92Ol2Abw==
X-Google-Smtp-Source: ABdhPJw9sSNNGdoSxuFxCHcrtWsODMyzzBhF0LcysfTNLVV6KGyIE7EUsrVZHRBDU9QZNTT7YfuE6w==
X-Received: by 2002:a7b:c308:: with SMTP id k8mr1034526wmj.76.1606170334404;
        Mon, 23 Nov 2020 14:25:34 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (4.3.1.2.4.d.e.0.6.7.2.2.d.6.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:906d:2276:ed4:2134])
        by smtp.gmail.com with ESMTPSA id a15sm524633wmj.2.2020.11.23.14.25.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 14:25:33 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] uninative: Don't use single sstate for pseudo-native
Date: Mon, 23 Nov 2020 22:25:31 +0000
Message-Id: <20201123222531.3030482-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123222531.3030482-1-richard.purdie@linuxfoundation.org>
References: <20201123222531.3030482-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 meta/classes/base.bbclass   | 1 +
 meta/classes/sstate.bbclass | 4 ++++
 meta/lib/oe/sstatesig.py    | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 5a0b0c6b3e2..78ae28bb0f4 100644
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
index a8ae75101de..d08d950e768 100644
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
index 4ea29cbdfc3..adfe2e403bc 100644
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
2.25.1

