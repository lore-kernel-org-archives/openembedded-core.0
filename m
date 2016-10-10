Return-Path: <aborduno@cisco.com>
X-Greylist: delayed 585 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 10 Oct 2016 17:13:18 UTC
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
	by mail.openembedded.org (Postfix) with ESMTP id 66BBE71957
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 17:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1962; q=dns/txt; s=iport;
	t=1476119600; x=1477329200;
	h=from:to:cc:subject:date:message-id;
	bh=qNSbmk0lbf00q5PMUxBo70AXvSKWPsjdOOjw3LZY9Yk=;
	b=eBZrawmKYVJs6UGgm2ZIl1pLq4furlxjEWhv2gGGl89U1nnu4ngJHlWM
	TqhxHVs57b2FtzY3caQTbvRwmSzbLSQJWxM0DlGNAyzYJxyPFw/BOy5EK
	BLuSEC4AawUzqsyujUBfyVWLoo7HWjxWrvSiS9cRUIVrc1yCGcRbLyPzW s=;
X-IronPort-AV: E=Sophos;i="5.31,325,1473120000"; d="scan'208";a="334048353"
Received: from alln-core-12.cisco.com ([173.36.13.134])
	by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	10 Oct 2016 17:03:34 +0000
Received: from kbp1-dhp-f50810.synapse.com.com ([10.24.113.125])
	(authenticated bits=0)
	by alln-core-12.cisco.com (8.14.5/8.14.5) with ESMTP id u9AH3Mbd024555
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 10 Oct 2016 17:03:33 GMT
From: Andrii Bordunov <aborduno@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Oct 2016 20:02:35 +0300
Message-Id: <1476118955-12401-1-git-send-email-aborduno@cisco.com>
X-Mailer: git-send-email 2.7.4
X-Authenticated-User: aborduno@cisco.com
Cc: Andrii Bordunov <aborduno@cisco.com>
Subject: [PATCH] package.bbclass: allow using EXCLUDE_FROM_SHLIBS for subpackages
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
X-List-Received-Date: Mon, 10 Oct 2016 17:13:18 -0000

Some packages containing shared libraries might be registered
as shlib providers when they shouldn't (for example, the lib is for
their private use and must not generate any dependency).

EXCLUDE_FROM_SHLIBS is targeted at that, but it could be set
for entire recipe only.

This patch expands EXCLUDE_FROM_SHLIBS usage, so now it's possible
to set it in a style similar with RDEPENDS. For example:
 EXCLUDE_FROM_SHLIBS_${PN}-ptest = "1"

Signed-off-by: Andrii Bordunov <aborduno@cisco.com>
---
 meta/classes/package.bbclass | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a6f0a7a..9bf43dc 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1499,6 +1499,14 @@ python package_do_shlibs() {
     libdir_re = re.compile(".*/%s$" % d.getVar('baselib', True))
 
     packages = d.getVar('PACKAGES', True)
+
+    shlib_pkgs = []
+    for pkg in packages.split():
+        if d.getVar('EXCLUDE_FROM_SHLIBS_' + pkg, 0):
+            bb.note("not generating shlibs for %s" % pkg)
+        else:
+            shlib_pkgs.append(pkg)
+
     targetos = d.getVar('TARGET_OS', True)
 
     workdir = d.getVar('WORKDIR', True)
@@ -1614,7 +1622,7 @@ python package_do_shlibs() {
     needed = {}
     shlib_provider = oe.package.read_shlib_providers(d)
 
-    for pkg in packages.split():
+    for pkg in shlib_pkgs:
         private_libs = d.getVar('PRIVATE_LIBS_' + pkg, True) or d.getVar('PRIVATE_LIBS', True) or ""
         private_libs = private_libs.split()
         needs_ldconfig = False
@@ -1684,7 +1692,7 @@ python package_do_shlibs() {
 
     libsearchpath = [d.getVar('libdir', True), d.getVar('base_libdir', True)]
 
-    for pkg in packages.split():
+    for pkg in shlib_pkgs:
         bb.debug(2, "calculating shlib requirements for %s" % pkg)
 
         deps = list()
-- 
2.7.4


