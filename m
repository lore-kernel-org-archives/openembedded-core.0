Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.335.1611586379124038952
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:52:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dJ7qCkYq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id u11so7714031plg.13
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zNWD8heFzNX6ZIAFDMxtz1+m1cA+kcnidAMQOX7TKWU=;
        b=dJ7qCkYqHPv0yGMlmTcZOwQgVxr4h32zJtQgjPfGliR01OJX+Xfkd+GbjsK8dHvaNT
         W6J5OchXwTat6ns0ld5dwm1H0sNmooGdh2E4TC0nAQ09DA+gGMOdBGhmPssLc6pJPs5a
         CyAwq0VUah+gFRRnUoF1OgCP1/K8gfGHWmLUjJqCDe8on7U2qRQ0eCUrlHUEs/5ca9xq
         PBIb8iObF5HbQTFmK3fIzb0i9ubMFVpKonybPpt/g080hFQXi7OOjkdDD1v/cCXda28o
         lkCttbyDJYG0f1emPzZRDFvxwaMYPzk9lvl46IcGdOjE2RmHipCQ6j7lMBDmXIGWq4cQ
         T3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zNWD8heFzNX6ZIAFDMxtz1+m1cA+kcnidAMQOX7TKWU=;
        b=oiR3tWsgvMRI7d7UL+tr04Sq1yxZiuyQfjyzoq8mmCc3txBAyMREZAvyeVapgfc9Ki
         vaF1GK63T1rNz+Bd4YNS20iK0lpgFZQVQrqZo1aW7lxvYFWQdMFRzYNBGT66gQkVDGIn
         rwRJ4CHbzbr92Douf7e3Gipcih0YEVK40nlhWF2djKKqZ+PQix6kv1oq9rTYOy2PYDNN
         GBq6oXVAsgRPiYO4aa4QeClkOj+/shswByeFlMF9DBQSQ5RYkThyGLbapc7c0ZDQtl+u
         aFU2VAhMXiP/dFri4Xc1wHm83Lz/KlcFn4+WSFu+bxr2tCCLSUvddb2CkivY1jaET/05
         I7mA==
X-Gm-Message-State: AOAM531BfAtesZrxtdHhHY75T1V2A6iAw1HIDDJd20L/L6h6mVgcbrQz
	WA9HZFT9JsT5oLQMNo8LsTTmT/iABiSu7cnLnPY=
X-Google-Smtp-Source: ABdhPJxiBYqdJgZkqDU/8u28HbypeqQwnV/VOIu+Zw2WVPhWplwsoUgHajNSFyhiFc1gjnQrXtk3jA==
X-Received: by 2002:a17:90a:9318:: with SMTP id p24mr559643pjo.123.1611586378234;
        Mon, 25 Jan 2021 06:52:58 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.52.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:52:57 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 27/47] uninative: Don't use single sstate for pseudo-native
Date: Mon, 25 Jan 2021 04:50:59 -1000
Message-Id: <dec120261f9828554beb970aa5108c8b522e179a.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
2.25.1

