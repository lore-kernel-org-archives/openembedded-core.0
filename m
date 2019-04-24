Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2EF667C68C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 08:41:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3O8f5Tv026143
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Apr 2019 01:41:06 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 24 Apr 2019 01:41:05 -0700
From: <mingli.yu@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Date: Wed, 24 Apr 2019 16:41:01 +0800
Message-ID: <1556095261-171895-2-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556095261-171895-1-git-send-email-mingli.yu@windriver.com>
References: <5CB80B5D.40800@windriver.com>
	<1556095261-171895-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v4 2/2] nettle: fix ptest failure
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
X-List-Received-Date: Wed, 24 Apr 2019 08:41:06 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Rework dlopen-test.patch to fix below
dlopen-test failure:
 # cd /usr/lib64/nettle/ptest
 # ./run-ptest
 dlopen failed: /usr/lib/libnettle.so: cannot open shared object file: No such file or directory
 ./run-ptest: line 8:  7607 Aborted                 "./$f"
 FAIL: dlopen-test

As the test dlopen-test depends on libnettle.so
which belongs to nettle-dev package, so add it
to rdepends of nettle-ptest.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch | 5 +++--
 meta/recipes-support/nettle/nettle_3.4.1.bb                | 3 +++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch b/meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch
index c4f0b7e..fea5774 100644
--- a/meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch
+++ b/meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch
@@ -1,4 +1,4 @@
-Replace relative path of libnettle.so with absolute path so the test
+Remove the relative path for libnettle.so so the test
 program can find it.
 Relative paths are not suitable, as the folder strucure for ptest
 is different from the one expected by the nettle testsuite.
@@ -6,6 +6,7 @@ is different from the one expected by the nettle testsuite.
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 
 --- a/testsuite/dlopen-test.c	2016-10-01 00:28:38.000000000 -0700
 +++ b/testsuite/dlopen-test.c	2017-10-13 11:08:57.227572860 -0700
@@ -14,7 +15,7 @@ Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
  {
  #if HAVE_LIBDL
 -  void *handle = dlopen ("../libnettle.so", RTLD_NOW);
-+  void *handle = dlopen ("/usr/lib/libnettle.so", RTLD_NOW);
++  void *handle = dlopen ("libnettle.so", RTLD_NOW);
    int (*get_version)(void);
    if (!handle)
      {
diff --git a/meta/recipes-support/nettle/nettle_3.4.1.bb b/meta/recipes-support/nettle/nettle_3.4.1.bb
index 8375fcf..cd8024f 100644
--- a/meta/recipes-support/nettle/nettle_3.4.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.4.1.bb
@@ -49,4 +49,7 @@ do_install_ptest() {
         install ${B}/testsuite/*-test ${D}${PTEST_PATH}/testsuite/
 }
 
+RDEPENDS_${PN}-ptest += "${PN}-dev"
+INSANE_SKIP_${PN}-ptest += "dev-deps"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


