Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RYgCP-0007g9-Hg
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 16:47:53 +0100
Received: by yenm12 with SMTP id m12so1526544yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2011 07:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=9BRMZj5kKMbWEW//9BLa4NLxUN5gtlzam+/killbYME=;
	b=Gxs/POBjzYLV/grpT1FazWh52fbyHkKyye7QUTiV5+x3mB6y/9KtNcT6TJMC8c216W
	kq9LmCtg9xoeiZcbKI+eE9KIZNcdLl3GNe++ORQVRV+Q8gSTZ0D/nDl7No6Nvh00YU8U
	1beAvWKFPcuKs0SGu5i7IKEHYp6mHzmPbkLVE=
Received: by 10.236.200.201 with SMTP id z49mr5567203yhn.20.1323358863078;
	Thu, 08 Dec 2011 07:41:03 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 32sm15415340anu.10.2011.12.08.07.41.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Dec 2011 07:41:02 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2011 15:40:47 +0000
Message-Id: <ce8ae4f8f6647b3b81e1346d43f0f785a9098425.1323358819.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323358819.git.otavio@ossystems.com.br>
References: <cover.1323358819.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323358819.git.otavio@ossystems.com.br>
References: <cover.1323358819.git.otavio@ossystems.com.br>
Subject: [PATCH 1/3] cross.bbclass: add virtclass handler
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Dec 2011 15:47:53 -0000

Allow use of BBCLASSEXTEND with 'cross' and use of virtclass-cross in
recipes.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/cross.bbclass |   50 ++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 50 insertions(+), 0 deletions(-)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 5681ab9..a3b8e10 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -55,6 +55,56 @@ libexecdir = "${exec_prefix}/libexec/${CROSS_TARGET_SYS_DIR}"
 
 do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_NATIVE}"
 
+python cross_virtclass_handler () {
+    if not isinstance(e, bb.event.RecipePreFinalise):
+        return
+
+    classextend = e.data.getVar('BBCLASSEXTEND', True) or ""
+    if "cross" not in classextend:
+        return
+
+    pn = e.data.getVar("PN", True)
+    if not pn.endswith("-cross"):
+        return
+
+    def map_dependencies(varname, d, suffix = ""):
+        if suffix:
+            varname = varname + "_" + suffix
+        deps = d.getVar(varname, True)
+        if not deps:
+            return
+        deps = bb.utils.explode_deps(deps)
+        newdeps = []
+        for dep in deps:
+            if dep.endswith("-cross"):
+                newdeps.append(dep.replace("-cross", "-cross"))
+            elif not dep.endswith("-cross"):
+                newdeps.append(dep + "-cross")
+            else:
+                newdeps.append(dep)
+        bb.data.setVar(varname, " ".join(newdeps), d)
+
+    map_dependencies("DEPENDS", e.data)
+    for pkg in (e.data.getVar("PACKAGES", True).split() + [""]):
+        map_dependencies("RDEPENDS", e.data, pkg)
+        map_dependencies("RRECOMMENDS", e.data, pkg)
+        map_dependencies("RSUGGESTS", e.data, pkg)
+        map_dependencies("RPROVIDES", e.data, pkg)
+        map_dependencies("RREPLACES", e.data, pkg)
+
+    provides = e.data.getVar("PROVIDES", True)
+    for prov in provides.split():
+        if prov.find(pn) != -1:
+            continue
+        if not prov.endswith("-cross"):
+            provides = provides.replace(prov, prov + "-cross")
+    e.data.setVar("PROVIDES", provides)
+
+    bb.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-cross", e.data)
+}
+
+addhandler cross_virtclass_handler
+
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
 }
-- 
1.7.2.5



