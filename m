Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CEFCF7D72E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 07:40:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3F7ehcn000412
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Apr 2019 00:40:43 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Mon, 15 Apr 2019 00:40:43 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Mon, 15 Apr 2019 15:40:41 +0800
Message-ID: <1555314041-117426-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <23562ca03db97ef41bbb2e6365ecde4bd715438d.camel@linuxfoundation.org>
References: <23562ca03db97ef41bbb2e6365ecde4bd715438d.camel@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH v2] nettle: fix ptest failure
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
X-List-Received-Date: Mon, 15 Apr 2019 07:40:44 -0000
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
 .../nettle/nettle-3.4.1/dlopen-test.patch          | 23 +++++++++++++++++++---
 meta/recipes-support/nettle/nettle_3.4.1.bb        |  3 +++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch b/meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch
index c4f0b7e..9b075d8 100644
--- a/meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch
+++ b/meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch
@@ -1,20 +1,37 @@
+From d8140904f51ec8025833e5e7eee732a4a50ed0cf Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Mon, 15 Apr 2019 11:16:54 +0800
+Subject: [PATCH] dlopen-test.c: use absolute path
+
 Replace relative path of libnettle.so with absolute path so the test
 program can find it.
+
 Relative paths are not suitable, as the folder strucure for ptest
 is different from the one expected by the nettle testsuite.
 
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ testsuite/dlopen-test.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
 
---- a/testsuite/dlopen-test.c	2016-10-01 00:28:38.000000000 -0700
-+++ b/testsuite/dlopen-test.c	2017-10-13 11:08:57.227572860 -0700
-@@ -9,7 +9,7 @@
+diff --git a/testsuite/dlopen-test.c b/testsuite/dlopen-test.c
+index 99d3535..92de9f8 100644
+--- a/testsuite/dlopen-test.c
++++ b/testsuite/dlopen-test.c
+@@ -9,7 +9,9 @@ int
  main (int argc UNUSED, char **argv UNUSED)
  {
  #if HAVE_LIBDL
 -  void *handle = dlopen ("../libnettle.so", RTLD_NOW);
 +  void *handle = dlopen ("/usr/lib/libnettle.so", RTLD_NOW);
++  if (!handle)
++     handle = dlopen ("/usr/lib64/libnettle.so", RTLD_NOW);
    int (*get_version)(void);
    if (!handle)
      {
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/nettle/nettle_3.4.1.bb b/meta/recipes-support/nettle/nettle_3.4.1.bb
index dd49c30..131676d 100644
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


