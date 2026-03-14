Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B8310706C1
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 09:48:14 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6656.1773481686521749359
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 02:48:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aUBAd4Gs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439a89b6fd0so2938967f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 02:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773481684; x=1774086484; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GhseKRcd/p9nxrF9rgheeyTWStzEcmzyW9I7Wf50nJQ=;
        b=aUBAd4GsSveY2VUbW9oAhdUY5gB/EMrJ5J8v1p6DrZoJQqiBcpwsf12Nf8rSF6tUW0
         6XYUGUqrCA1mRVuZBSk8PsbUYTNSOwt2dH+Gf+E5SUkSTt78uUdlInyg3xqDtGU0EhHG
         t1Dk7Dav3ezBeoswzjD7nAFhcm8YLLRts8NrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773481684; x=1774086484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GhseKRcd/p9nxrF9rgheeyTWStzEcmzyW9I7Wf50nJQ=;
        b=YCgP+sKLlFj1RUl1zZ5xSDPjTYn4KsI3krLeX2h84dM+zjIg43TbloYjMHUG6q8qF4
         Wvp2FAOTeFyIENiJj47N/XDHHbLrdjJmBwSR8Adq1mEpRXKXS5+xouVSuFBdEHtirsFJ
         CXiKtPFOk1jYsFJaU6y7xrMHzjMJxY2A21LTKDv9rMifo3f77qy6dYeEF8aUiHdGzjSI
         eqbFH9Q1BPELeiAxsbr+DC75ZZu1cFbJYqLCeCH3cv8whZs52jDbLbexETzJKm4W3omh
         Ef3ntiVYBtf3xO10r7/vVYNme/L5+aVVwRqdLbHXR1PW5qebns9nFa0xh9UAAlH68x7n
         79MA==
X-Gm-Message-State: AOJu0YzsqkODoe6JAGQGRxmnfRt32JKEjW7XC2u22KGCNupA0DRNmXMv
	qwkkJdzDp5yEHyV3CGqOFGcXdrGDKphwqivJTYkIhFaLGFO3Mdi3mJhgtksgVpMH1VuGd2WGAnl
	oeWp/Ozk=
X-Gm-Gg: ATEYQzzWl6ieTmS4tnNaFWWc0E5m2GnrGm0ezZ/QDuTDcN1O0NZ9lqy7LlkSJTrprvu
	MLor/ngquXuJpTt3wvb6lmc9B1B6J/4ncqqF4kDWlrUL7v9WCpiVC6kb4CHsz276zCNabYijdhJ
	opJSSUCMpjZZegh8I1/E/iZyBkAacoPks63ji324hEBo47F31fuvg8Ss39/nzXWR4Xcepyd6Dte
	YG0bxUYT9vxot1ofK7Un20Hc4KgwT4MWVO3EAs3ZQ7/Hlg7d9dSmqkg1eP5Bb7kLZQJhZG5E1u7
	34aEH49tNvdAvtYV+JAiDFWKNBwwJO/j2NR7w32G3aTTR5RncV85MclFKQIHxzYDZ5+UedPb70N
	NPp/ti4ZcwTqWrdW86DMSfFeh3lOc4A3+HVngh/EZ2slnTl71zobRmnoolPKpoEzFTeiAwKk5pa
	LFDkxfRXNsT4flqzpJpHawNFOuykjklJDImCiwuzSnox5TwQjLct5tafg4tEWEAg==
X-Received: by 2002:a05:6000:2404:b0:439:be82:1fd9 with SMTP id ffacd0b85a97d-43a04d83e11mr11974788f8f.12.1773481684172;
        Sat, 14 Mar 2026 02:48:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1366:c81f:8eb8:9990])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm26554680f8f.20.2026.03.14.02.48.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 02:48:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] meta/dummy-sdk-package: Improve SDK dummy package handling
Date: Sat, 14 Mar 2026 09:47:57 +0000
Message-ID: <20260314094758.3929192-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260314094758.3929192-1-richard.purdie@linuxfoundation.org>
References: <20260314094758.3929192-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 09:48:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233079

Currently, the dummy SDK packages are re-running for different SDKMACHINE values
when they should not. The usage of allarch is broken and not triggering the right
PACKAGE_ARCH value due to the deferred nature of nativesdk. This was probably
broken when we switched to add deferred classes.

To try and make this all more explict and less prone to breakage, switch to calling
oe.utils.make_arch_independent() directly.

Add the 'special' package architecture values to SSTATE_ARCHS so the system cna properly
track them.

Remove the pointless tasks we don't need from the dummy recipes, mark the packagedata
as machine independent and then remove from the conflict list in sstate.bbclass.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass            |  6 ++---
 meta/lib/oe/sstatesig.py                      |  6 ++++-
 meta/recipes-core/meta/dummy-sdk-package.inc  | 25 +++++++++++++------
 .../meta/nativesdk-buildtools-perl-dummy.bb   |  2 ++
 .../meta/nativesdk-sdk-provides-dummy.bb      |  3 +++
 .../meta/target-sdk-provides-dummy.bb         |  2 ++
 6 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index fec4d88c4cf..f124f33b2d3 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -57,9 +57,6 @@ SSTATE_EXTRAPATHWILDCARD[vardepvalue] = ""
 
 # Avoid docbook/sgml catalog warnings for now
 SSTATE_ALLOW_OVERLAP_FILES += "${STAGING_ETCDIR_NATIVE}/sgml ${STAGING_DATADIR_NATIVE}/sgml"
-# sdk-provides-dummy-nativesdk and nativesdk-buildtools-perl-dummy overlap for different SDKMACHINE
-SSTATE_ALLOW_OVERLAP_FILES += "${DEPLOY_DIR_RPM}/sdk_provides_dummy_nativesdk/ ${DEPLOY_DIR_IPK}/sdk-provides-dummy-nativesdk/"
-SSTATE_ALLOW_OVERLAP_FILES += "${DEPLOY_DIR_RPM}/buildtools_dummy_nativesdk/ ${DEPLOY_DIR_IPK}/buildtools-dummy-nativesdk/"
 # target-sdk-provides-dummy overlaps that allarch is disabled when multilib is used
 SSTATE_ALLOW_OVERLAP_FILES += "${COMPONENTS_DIR}/sdk-provides-dummy-target/ ${DEPLOY_DIR_RPM}/sdk_provides_dummy_target/ ${DEPLOY_DIR_IPK}/sdk-provides-dummy-target/"
 # Archive the sources for many architectures in one deploy folder
@@ -90,6 +87,9 @@ SSTATE_ARCHS = " \
     ${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS} \
     ${SDK_ARCH}_${SDK_OS} \
     ${SDK_ARCH}_${SDK_ARCH}-${SDKPKGSUFFIX} \
+    buildtools-dummy-${SDKPKGSUFFIX} \
+    sdk-provides-dummy-target \
+    sdk-provides-dummy-${SDKPKGSUFFIX} \
     allarch \
     ${SSTATE_ARCHS_TUNEPKG} \
     ${PACKAGE_EXTRA_ARCHS} \
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 1e07c71e944..4693b73375e 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -513,7 +513,10 @@ def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
     if taskdata.endswith("-native"):
         pkgarchs = ["${BUILD_ARCH}", "${BUILD_ARCH}_${ORIGNATIVELSBSTRING}"]
     elif taskdata.startswith("nativesdk-"):
-        pkgarchs = ["${SDK_ARCH}_${SDK_OS}", "allarch"]
+        pkgarchs = ["${SDK_ARCH}_${SDK_OS}",
+                    "allarch",
+                    "buildtools-dummy-${SDKPKGSUFFIX}",
+                    "sdk-provides-dummy-${SDKPKGSUFFIX}"]
     elif "-cross-canadian" in taskdata:
         pkgarchs = ["${SDK_ARCH}_${SDK_ARCH}-${SDKPKGSUFFIX}"]
     elif "-cross-" in taskdata:
@@ -524,6 +527,7 @@ def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
         pkgarchs = ['${MACHINE_ARCH}']
         pkgarchs = pkgarchs + list(reversed(d2.getVar("PACKAGE_EXTRA_ARCHS").split()))
         pkgarchs.append('allarch')
+        pkgarchs.append('sdk-provides-dummy-target')
         pkgarchs.append('${SDK_ARCH}_${SDK_ARCH}-${SDKPKGSUFFIX}')
 
     searched_manifests = []
diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/meta/dummy-sdk-package.inc
index bf453cac9be..60dfe9f73bb 100644
--- a/meta/recipes-core/meta/dummy-sdk-package.inc
+++ b/meta/recipes-core/meta/dummy-sdk-package.inc
@@ -1,18 +1,21 @@
 SUMMARY = "Dummy packages which handle excluding packages from the sdk, e.g. ensuring perl is excluded from buildtools"
 LICENSE = "MIT"
 
-PACKAGE_ARCH = "all"
-
-inherit allarch
-
 INHIBIT_DEFAULT_DEPS = "1"
 
 python() {
+    pkgdata_var = d.getVar("DUMMYSDK_PKGDATA_VARNAME")
+    # Expand PKGDATA_DIR_SDK/SDK_SYS and stamp-extra-info before we lose the values
+    d.setVar(pkgdata_var, d.getVar(pkgdata_var))
+    stampinfo = d.getVar("DUMMYSDK_EXTRASTAMP_VARNAME")
+    d.setVarFlag("do_packagedata", "stamp-extra-info", d.getVar(stampinfo))
+
+    oe.utils.make_arch_independent(d)
+
     # Put the package somewhere separate to ensure it's never used except
     # when we want it
-    # (note that we have to do this in anonymous python here to avoid
-    # allarch.bbclass disabling itself)
-    d.setVar('PACKAGE_ARCH', '${DUMMYARCH}')
+    # Need to set PACKAGE_ARCH after deferred nativesdk inherit
+    d.setVar("PACKAGE_ARCH", "${DUMMYARCH}")
 }
 
 ALLOW_EMPTY:${PN} = "1"
@@ -31,3 +34,11 @@ python populate_packages:prepend() {
     d.appendVar("RREPLACES:%s" % p, "${DUMMYPROVIDES_PACKAGES_MULTILIB}")
 }
 
+deltask fetch
+deltask unpack
+deltask patch
+deltask prepare_recipe_sysroot
+deltask configure
+deltask compile
+deltask install
+deltask populate_sysroot
diff --git a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
index 0ba1ca6e426..f97a28cab56 100644
--- a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
@@ -1,4 +1,6 @@
 DUMMYARCH = "buildtools-dummy-${SDKPKGSUFFIX}"
+DUMMYSDK_PKGDATA_VARNAME = "PKGDATA_DIR_SDK"
+DUMMYSDK_EXTRASTAMP_VARNAME = "SDK_SYS"
 
 DUMMYPROVIDES_PACKAGES = "\
     nativesdk-perl \
diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index 1d71f373a4e..37dad54409f 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -1,5 +1,8 @@
 DUMMYARCH = "sdk-provides-dummy-${SDKPKGSUFFIX}"
 
+DUMMYSDK_PKGDATA_VARNAME = "PKGDATA_DIR_SDK"
+DUMMYSDK_EXTRASTAMP_VARNAME = "SDK_SYS"
+
 DUMMYPROVIDES_PACKAGES = "\
     pkgconfig \
 "
diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index 849407cca57..65b87fd97dd 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -1,4 +1,6 @@
 DUMMYARCH = "sdk-provides-dummy-target"
+DUMMYSDK_PKGDATA_VARNAME = "PKGDATA_DIR"
+DUMMYSDK_EXTRASTAMP_VARNAME = "MACHINE"
 
 DUMMYPROVIDES_PACKAGES = "\
     busybox \

