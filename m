Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F157F7F2F5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 01:53:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7G1qoxB027923
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 18:53:01 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 15 Aug 2019 18:52:40 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Aug 2019 10:06:03 +0800
Message-ID: <ba4c93d4f933827186bb805602076986aefa5e00.1565920957.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1565920957.git.Qi.Chen@windriver.com>
References: <cover.1565920957.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] target-sdk-provides-dummy: extend packages for multilib case
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Aug 2019 01:53:10 -0000
Content-Type: text/plain

If we have installed some lib32 package which depends on perl/bash,
then populating sdk for that image would fail with the following error.

  Error:
  Problem: package lib32-libxml-namespacesupport-perl-1.12-r0.corei7_32 requires lib32-perl, but none of the providers can be installed

    package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target conflicts with /usr/bin/perl provided by lib32-perl-5.30.0-r0.corei7_32
    package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target conflicts with libperl.so.5 provided by lib32-perl-5.30.0-r0.corei7_32

This could be produced by the following steps:
1. IMAGE_INSTALL_append = " lib32-valgrind"
2. bitbake core-image-minimal -c populate_sdk

We need to extend all packages in DUMMYPROVIDES to avoid such problems.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/meta/target-sdk-provides-dummy.bb | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index c33cb80..87b8bfa 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -1,6 +1,6 @@
 DUMMYARCH = "sdk-provides-dummy-target"
 
-DUMMYPROVIDES = "\
+DUMMYPROVIDES_PACKAGES = "\
     busybox \
     busybox-dev \
     busybox-src \
@@ -42,15 +42,19 @@ DUMMYPROVIDES = "\
     perl-module-threads \
     perl-module-warnings \
     perl-module-warnings-register \
+    pkgconfig \
+    pkgconfig-dev \
+    pkgconfig-src \
+"
+
+DUMMYPROVIDES = "\
+    ${@' '.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split()])} \
     /bin/sh \
     /bin/bash \
     /usr/bin/env \
     /usr/bin/perl \
     libperl.so.5 \
     libperl.so.5()(64bit) \
-    pkgconfig \
-    pkgconfig-dev \
-    pkgconfig-src \
 "
 
 require dummy-sdk-package.inc
-- 
1.9.1


