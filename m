Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RusQR-0001tq-4f
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 22:18:07 +0100
Received: by mail-gy0-f175.google.com with SMTP id f19so3355799ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 13:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=XurMgz6KB9WtKFPEaMSHCNofz05omW8MTdF28hZeg+k=;
	b=vsmyGnEEa+jjI3h9BeOV1OvvI9YQUDrLgMHbNOgMSOVsph5p4bZkyDkDQJe77GWLgQ
	jE3PGnqFqQNatv+yRdu1mxkxPPFauEN+FjEb7xxQVBHfEKqiLk7FsTWdEAp0zwB3OJ7l
	2fMc/8yW53drRzurx8BriiCuVFBgv7YUHG5jo=
Received: by 10.236.124.206 with SMTP id x54mr34439211yhh.112.1328649006616;
	Tue, 07 Feb 2012 13:10:06 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id f47sm30150280yhh.8.2012.02.07.13.10.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 13:10:05 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 21:09:50 +0000
Message-Id: <3aaae21268883e5ebcc5373f99517045613ad102.1328648562.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1328648562.git.otavio@ossystems.com.br>
References: <cover.1328648562.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1328648562.git.otavio@ossystems.com.br>
References: <cover.1328648562.git.otavio@ossystems.com.br>
Subject: [PATCH 3/4] cross.bbclass: add virtclass handler
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
X-List-Received-Date: Tue, 07 Feb 2012 21:18:07 -0000

Allow use of BBCLASSEXTEND with 'cross' and use of virtclass-cross in
recipes.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/cross.bbclass |   39 +++++++++++++++++++++++++++++++++++++++
 1 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 5681ab9..a764902 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -55,6 +55,45 @@ libexecdir = "${exec_prefix}/libexec/${CROSS_TARGET_SYS_DIR}"
 
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
+                newdeps.append(dep)
+            else:
+                newdeps.append(dep + "-cross")
+        bb.data.setVar(varname, " ".join(newdeps), d)
+
+    for pkg in (e.data.getVar("PACKAGES", True).split() + [""]):
+        map_dependencies("RDEPENDS", e.data, pkg)
+        map_dependencies("RRECOMMENDS", e.data, pkg)
+        map_dependencies("RSUGGESTS", e.data, pkg)
+        map_dependencies("RPROVIDES", e.data, pkg)
+        map_dependencies("RREPLACES", e.data, pkg)
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



