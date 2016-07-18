Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9C5AE60290
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 03:33:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6I3X50V009638
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jul 2016 20:33:05 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 17 Jul 2016 20:33:04 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Jul 2016 20:32:46 -0700
Message-ID: <dd702eafa61897a9bce14c5f63d2ae46310300d3.1468811788.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1468811788.git.liezhi.yang@windriver.com>
References: <cover.1468811788.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/9] package_deb.bbclass/package_ipk.bbclass: sort RPROVIDES
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
X-List-Received-Date: Mon, 18 Jul 2016 03:33:04 -0000
Content-Type: text/plain

The dict.fromkeys() creates a dict without order, there might be a
problem when build the same recipe again, for example:

- First build of make:
  Provides: es-translation, make-locale
- Second build of acl:
  Provides: make-locale, es-translation

They are exactly the same Provides, but tools like "diff" doesn't think
so. Sort RPROVIDES will fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/package_deb.bbclass | 2 ++
 meta/classes/package_ipk.bbclass | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 8f9b09a..8fbd383 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -52,6 +52,7 @@ python do_package_deb () {
     import re, copy
     import textwrap
     import subprocess
+    import collections
 
     oldcwd = os.getcwd()
 
@@ -247,6 +248,7 @@ python do_package_deb () {
         debian_cmp_remap(rsuggests)
         # Deliberately drop version information here, not wanted/supported by deb
         rprovides = dict.fromkeys(bb.utils.explode_dep_versions2(localdata.getVar("RPROVIDES", True) or ""), [])
+        rprovides = collections.OrderedDict(sorted(rprovides.items(), key=lambda x: x[0]))
         debian_cmp_remap(rprovides)
         rreplaces = bb.utils.explode_dep_versions2(localdata.getVar("RREPLACES", True) or "")
         debian_cmp_remap(rreplaces)
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 1b5f4f5..e32b9cb 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -20,6 +20,7 @@ python do_package_ipk () {
     import re, copy
     import textwrap
     import subprocess
+    import collections
 
     oldcwd = os.getcwd()
 
@@ -192,6 +193,7 @@ python do_package_ipk () {
         debian_cmp_remap(rsuggests)
         # Deliberately drop version information here, not wanted/supported by ipk
         rprovides = dict.fromkeys(bb.utils.explode_dep_versions2(localdata.getVar("RPROVIDES", True) or ""), [])
+        rprovides = collections.OrderedDict(sorted(rprovides.items(), key=lambda x: x[0]))
         debian_cmp_remap(rprovides)
         rreplaces = bb.utils.explode_dep_versions2(localdata.getVar("RREPLACES", True) or "")
         debian_cmp_remap(rreplaces)
-- 
2.9.0


