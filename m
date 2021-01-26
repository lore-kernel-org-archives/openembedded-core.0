Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.13103.1611672205112955429
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:43:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PiMX0cps;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id a20so2100565pjs.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zNWD8heFzNX6ZIAFDMxtz1+m1cA+kcnidAMQOX7TKWU=;
        b=PiMX0cpsOEpxHM0RVhkgkeF894OlTTGGFYPNz2WGSkBKcgSuF85NUOkoofukwBaRNx
         Mra4UDXvNNT5LclJnzyFOV7qW672gBzmhWAAyVOLGp5hCxvAwi7FDIvNc7htuXzxblQk
         LcwnUFWLwHSw2s+XS7Wa9WiFHsASEfDdv6MMRqgN7H/6bCrfcyCPvmsKoVe21zI/RPOR
         4MK3m3HC3vjbCR4NYYPm4FBwHNlFBfZjyvB4itBPsDC9RPLPs8ooU4M9s1yfctBkFRT0
         a99YFzJQXmY1k0eQ4dK4S6IckTSlcZyCXMJlAXiUVWesqunxKwo3zC8Dh1GCHUcy+2aj
         SzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zNWD8heFzNX6ZIAFDMxtz1+m1cA+kcnidAMQOX7TKWU=;
        b=T4wByTRtcYcCRp52JYhfy8GDUSPziV90tplm3UsmXq9H2SyBySOz3/E9WQVGNbSko7
         jp91gImLU1pZVddHMiAGtb1qXXKjeShIwpmH4kCFRbjoNgD3r1QZMVNYsMgEYhmHmixQ
         pJZAdxdA8a5jNOypkekL8UB+k7oQ6GeEZD9ClEq1Ao1IKHQEiSxNGQbKBJvKPQZ1g3t9
         xMBqTgE43UVt4Cl32bnMsXz4lketH0IvzumoqQxV64OjKbWTGMXVftr0Qfv/E1J9t1Xn
         UYO0HsF2CFoTiGo28R9DcIpF0HOeu7G5XvlNtEgeWfoNUHeu80GExAOs1q2EmZXovdAZ
         NH5g==
X-Gm-Message-State: AOAM532Zg7ZIT081HKCIdZCMgUZrEVMyZTq5FQdOq9Nx1U7m2ZX0U2YJ
	ceYh3WrZP3xxlohxT6XKhSgs0fvLUOI0FHtU6pY=
X-Google-Smtp-Source: ABdhPJxyDVnoCW+jwVoNw0k8MuqMZ3IaAwQS+0LGHJlDtgjGp1RILDYHc6YuqBO0isjqJP0rv+e7dw==
X-Received: by 2002:a17:90a:c787:: with SMTP id gn7mr100629pjb.222.1611672204170;
        Tue, 26 Jan 2021 06:43:24 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.43.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:43:23 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 26/46] uninative: Don't use single sstate for pseudo-native
Date: Tue, 26 Jan 2021 04:41:37 -1000
Message-Id: <005f87b5bfd372b6f6c947897c61b7ae9b327abd.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
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

