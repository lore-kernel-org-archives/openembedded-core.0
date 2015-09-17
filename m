Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2BB957701C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 07:53:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8H7r8Ki021731
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:53:08 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 17 Sep 2015 00:53:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Sep 2015 00:53:07 -0700
Message-ID: <1c18372d6c07e7d0ce4b268f51d29f2b5af3f246.1442476310.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1442476310.git.liezhi.yang@windriver.com>
References: <cover.1442476310.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] bind: fix too long error from gen
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
X-List-Received-Date: Thu, 17 Sep 2015 07:53:08 -0000
Content-Type: text/plain

gen.c uses 512 as the path length which is a little short when build in
deep dir, and cause "too long" error, use PATH_MAX if defined.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../0001-lib-dns-gen.c-fix-too-long-error.patch    |   34 ++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.10.2-P4.bb   |    1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-too-long-error.patch

diff --git a/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-too-long-error.patch b/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-too-long-error.patch
new file mode 100644
index 0000000..1ed858c
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-too-long-error.patch
@@ -0,0 +1,34 @@
+From 5bc3167a8b714ec0c4a3f1c7f3b9411296ec0a23 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 16 Sep 2015 20:23:47 -0700
+Subject: [PATCH] lib/dns/gen.c: fix too long error
+
+The 512 is a little short when build in deep dir, and cause "too long"
+error, use PATH_MAX if defined.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ lib/dns/gen.c |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/dns/gen.c b/lib/dns/gen.c
+index 51a0435..3d7214f 100644
+--- a/lib/dns/gen.c
++++ b/lib/dns/gen.c
+@@ -148,7 +148,11 @@ static const char copyright[] =
+ #define TYPECLASSBUF (TYPECLASSLEN + 1)
+ #define TYPECLASSFMT "%" STR(TYPECLASSLEN) "[-0-9a-z]_%d"
+ #define ATTRIBUTESIZE 256
++#ifdef PATH_MAX
++#define DIRNAMESIZE PATH_MAX
++#else
+ #define DIRNAMESIZE 512
++#endif
+ 
+ static struct cc {
+ 	struct cc *next;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb b/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb
index efae289..1e1e726 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb
@@ -20,6 +20,7 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-build-use-pkg-config-to-find-libxml2.patch \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
            file://0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch \
+           file://0001-lib-dns-gen.c-fix-too-long-error.patch \
            "
 
 SRC_URI[md5sum] = "8b1f5064837756c938eadc1537dec5c7"
-- 
1.7.9.5


