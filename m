Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TI7Mv-0001mc-41
	for openembedded-core@lists.openembedded.org;
	Sun, 30 Sep 2012 02:26:49 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8U0DrXv027482
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2012 17:13:53 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Sat, 29 Sep 2012 17:13:53 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2012 19:19:11 -0500
Message-ID: <f4656df3bfd9c6be360c20c3a2e10ac0a249a023.1348963477.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1348963477.git.mark.hatle@windriver.com>
References: <cover.1348963477.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 05/12] package_deb/ipk: Remap < and > to << and >>
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 30 Sep 2012 00:26:49 -0000
Content-Type: text/plain

In deb and ipk, < means <=, while > means >=... there is a different
operator << and >> that means < and >, so we map them when constructing
the packages.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_deb.bbclass |   18 ++++++++++++++++++
 meta/classes/package_ipk.bbclass |   18 ++++++++++++++++++
 2 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 3b42d3b..a25e5d7 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -334,18 +334,36 @@ python do_package_deb () {
 
         mapping_rename_hook(localdata)
 
+        def debian_cmp_remap(var):
+            # In debian '>' and '<' do not mean what it appears they mean
+            #   '<' = less or equal
+            #   '>' = greater or equal
+            # adjust these to the '<<' and '>>' equivalents
+            #
+            for dep in var:
+                if (var[dep] or "").startswith("< "):
+                    var[dep] = var[dep].replace("< ", "<< ")
+                elif (var[dep] or "").startswith("> "):
+                    var[dep] = var[dep].replace("> ", ">> ")
+
         rdepends = bb.utils.explode_dep_versions(localdata.getVar("RDEPENDS", True) or "")
+        debian_cmp_remap(rdepends)
         for dep in rdepends:
                 if '*' in dep:
                         del rdepends[dep]
         rrecommends = bb.utils.explode_dep_versions(localdata.getVar("RRECOMMENDS", True) or "")
+        debian_cmp_remap(rrecommends)
         for dep in rrecommends:
                 if '*' in dep:
                         del rrecommends[dep]
         rsuggests = bb.utils.explode_dep_versions(localdata.getVar("RSUGGESTS", True) or "")
+        debian_cmp_remap(rsuggests)
         rprovides = bb.utils.explode_dep_versions(localdata.getVar("RPROVIDES", True) or "")
+        debian_cmp_remap(rprovides)
         rreplaces = bb.utils.explode_dep_versions(localdata.getVar("RREPLACES", True) or "")
+        debian_cmp_remap(rreplaces)
         rconflicts = bb.utils.explode_dep_versions(localdata.getVar("RCONFLICTS", True) or "")
+        debian_cmp_remap(rconflicts)
         if rdepends:
             ctrlfile.write("Depends: %s\n" % unicode(bb.utils.join_deps(rdepends)))
         if rsuggests:
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 59cb856..281ce59 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -372,12 +372,30 @@ python do_package_ipk () {
 
         mapping_rename_hook(localdata)
 
+        def debian_cmp_remap(var):
+            # In debian '>' and '<' do not mean what it appears they mean
+            #   '<' = less or equal
+            #   '>' = greater or equal
+            # adjust these to the '<<' and '>>' equivalents
+            #
+            for dep in var:
+                if (var[dep] or "").startswith("< "):
+                    var[dep] = var[dep].replace("< ", "<< ")
+                elif (var[dep] or "").startswith("> "):
+                    var[dep] = var[dep].replace("> ", ">> ")
+
         rdepends = bb.utils.explode_dep_versions(localdata.getVar("RDEPENDS", True) or "")
+        debian_cmp_remap(rdepends)
         rrecommends = bb.utils.explode_dep_versions(localdata.getVar("RRECOMMENDS", True) or "")
+        debian_cmp_remap(rrecommends)
         rsuggests = bb.utils.explode_dep_versions(localdata.getVar("RSUGGESTS", True) or "")
+        debian_cmp_remap(rsuggests)
         rprovides = bb.utils.explode_dep_versions(localdata.getVar("RPROVIDES", True) or "")
+        debian_cmp_remap(rprovides)
         rreplaces = bb.utils.explode_dep_versions(localdata.getVar("RREPLACES", True) or "")
+        debian_cmp_remap(rreplaces)
         rconflicts = bb.utils.explode_dep_versions(localdata.getVar("RCONFLICTS", True) or "")
+        debian_cmp_remap(rconflicts)
 
         if rdepends:
             ctrlfile.write("Depends: %s\n" % bb.utils.join_deps(rdepends))
-- 
1.7.3.4



