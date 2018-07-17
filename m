Return-Path: <okonopli@cisco.com>
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3B5A9745A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 15:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2360; q=dns/txt; s=iport;
	t=1531842077; x=1533051677; h=from:to:subject:date:message-id;
	bh=nebzwJMUKjgdwlZGhx2eZUjMToxiAoBGJ0RpV0iREHQ=;
	b=Sr2WKjnLandqv/1tyH5SH2hK9zl18kGY3hTwolM47gYjJtVcsVgoJg0w
	BIvy2X440b7Ol8vNjo+PgL3p9dMY5EhGHrjEGHNa9Yg0jKcYc3+88c3yc
	Rv4+MEHahav4pJ1DrEjEb2whgVg9cNWKiQPLpCrTm+oeMELiLu95GPI60 I=;
X-IronPort-AV: E=Sophos;i="5.51,366,1526342400"; 
   d="scan'208";a="5176235"
Received: from aer-iport-nat.cisco.com (HELO aer-core-4.cisco.com)
	([173.38.203.22])
	by aer-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jul 2018 15:41:15 +0000
Received: from KBP1-LDL-F65060.cisco.com ([10.61.228.109])
	(authenticated bits=0)
	by aer-core-4.cisco.com (8.15.2/8.15.2) with ESMTPSA id w6HFfA62026748
	(version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NO);
	Tue, 17 Jul 2018 15:41:15 GMT
From: Oleksii Konoplitskyi <okonopli@cisco.com>
To: okonopli@cisco.com, aborduno@cisco.com, richard.purdie@linuxfoundation.org,
	xe-linux-external@cisco.com, openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 18:40:34 +0300
Message-Id: <1531842034-23399-1-git-send-email-okonopli@cisco.com>
X-Mailer: git-send-email 2.7.4
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: okonopli@cisco.com
Subject: [PATCH] package.bbclass: exclude packages as shlib providers
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
X-List-Received-Date: Tue, 17 Jul 2018 15:41:15 -0000

Some packages containing shared libraries might be registered
as shlib providers when they shouldn't (for example, the lib is for
their private use and must not generate any dependency).

EXCLUDE_FROM_SHLIBS is targeted at that, but it could be set
for entire recipe only.

This patch allows to set list of packages that are not candidates
for shlib providers.

Variable EXCLUDE_PACKAGES_FROM_SHLIBS is used, e.g.:
EXCLUDE_PACKAGES_FROM_SHLIBS = "glibc-ptest glibc-mtest"

Cc: Andrii Bordunov <aborduno@cisco.com>
Signed-off-by: Oleksii Konoplitskyi <okonopli@cisco.com>
---
 Hi Richard,

 I have updated Andrii's patch https://patchwork.openembedded.org/patch/132798/
 Please, check if comments are fixed.

 meta/classes/package.bbclass | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index edeffa9..07bc378 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1603,6 +1603,18 @@ python package_do_shlibs() {
     libdir_re = re.compile(".*/%s$" % d.getVar('baselib'))
 
     packages = d.getVar('PACKAGES')
+
+    shlib_pkgs = []
+    exclusion_list = d.getVar("EXCLUDE_PACKAGES_FROM_SHLIBS")
+    if exclusion_list:
+        for pkg in packages.split():
+            if pkg not in exclusion_list.split():
+                shlib_pkgs.append(pkg)
+            else:
+                bb.note("not generating shlibs for %s" % pkg)
+    else:
+        shlib_pkgs = packages.split()
+
     targetos = d.getVar('TARGET_OS')
 
     workdir = d.getVar('WORKDIR')
@@ -1734,7 +1746,7 @@ python package_do_shlibs() {
     needed = {}
     shlib_provider = oe.package.read_shlib_providers(d)
 
-    for pkg in packages.split():
+    for pkg in shlib_pkgs:
         private_libs = d.getVar('PRIVATE_LIBS_' + pkg) or d.getVar('PRIVATE_LIBS') or ""
         private_libs = private_libs.split()
         needs_ldconfig = False
@@ -1806,7 +1818,7 @@ python package_do_shlibs() {
 
     libsearchpath = [d.getVar('libdir'), d.getVar('base_libdir')]
 
-    for pkg in packages.split():
+    for pkg in shlib_pkgs:
         bb.debug(2, "calculating shlib requirements for %s" % pkg)
 
         private_libs = d.getVar('PRIVATE_LIBS_' + pkg) or d.getVar('PRIVATE_LIBS') or ""
-- 
2.7.4


