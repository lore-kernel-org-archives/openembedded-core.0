Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9CC3C6011C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 03:20:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAK3KUTL009859
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 19:20:30 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 19 Nov 2015 19:18:20 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Nov 2015 19:18:19 -0800
Message-ID: <3f966c615af2454255f265e266f6e531221a7d00.1447989454.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1447989454.git.liezhi.yang@windriver.com>
References: <cover.1447989454.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] apr: fix LTFLAGS to make it work with ccache
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
X-List-Received-Date: Fri, 20 Nov 2015 03:20:31 -0000
Content-Type: text/plain

When ccache is enabled, libtool requires --tag=CC when use ccache,
otherwise when building apr-util with ccache enabled:

| libtool: compile: unable to infer tagged configuration
| libtool: error: specify a tag with '--tag'
| libtool: compile: unable to infer tagged configuration
| make[1]: *** [buckets/apr_buckets.lo] Error 1

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...n-fix-LTFLAGS-to-make-it-work-with-ccache.patch |   36 ++++++++++++++++++++
 meta/recipes-support/apr/apr_1.5.2.bb              |    1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr/configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch

diff --git a/meta/recipes-support/apr/apr/configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch b/meta/recipes-support/apr/apr/configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
new file mode 100644
index 0000000..7521eeb
--- /dev/null
+++ b/meta/recipes-support/apr/apr/configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
@@ -0,0 +1,36 @@
+From d439093aa07a486f559206ac9e5808a6a18218cd Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 19 Nov 2015 18:25:38 -0800
+Subject: [PATCH] configure.in: fix LTFLAGS to make it work with ccache
+
+When ccache is enabled, libtool requires --tag=CC when use ccache,
+otherwise when building apr-util with ccache enabled:
+
+| libtool: compile: unable to infer tagged configuration
+| libtool: error: specify a tag with '--tag'
+| libtool: compile: unable to infer tagged configuration
+| make[1]: *** [buckets/apr_buckets.lo] Error 1
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ configure.in |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index 5a4a988..9d57ae6 100644
+--- a/configure.in
++++ b/configure.in
+@@ -246,7 +246,7 @@ case $host in
+     ;;
+ *)
+     if test "x$LTFLAGS" = "x"; then
+-        LTFLAGS='--silent'
++        LTFLAGS='--silent --tag=CC'
+     fi
+     if test "$experimental_libtool" = "yes"; then
+         # Use a custom-made libtool replacement
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-support/apr/apr_1.5.2.bb b/meta/recipes-support/apr/apr_1.5.2.bb
index 1c61e84..db15305 100644
--- a/meta/recipes-support/apr/apr_1.5.2.bb
+++ b/meta/recipes-support/apr/apr_1.5.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://run-ptest \
            file://upgrade-and-fix-1.5.1.patch \
            file://Fix-packet-discards-HTTP-redirect.patch \
+           file://configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch \
 "
 
 SRC_URI[md5sum] = "4e9769f3349fe11fc0a5e1b224c236aa"
-- 
1.7.9.5


