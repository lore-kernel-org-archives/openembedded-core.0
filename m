Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rv6fr-00079H-J2
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 13:30:59 +0100
Received: by ggeq1 with SMTP id q1so144018gge.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2012 04:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=ZhKJjb2ewb3eR8mIsjYec3FrnPWuyIxJ+ueK4649Llc=;
	b=evuL40xyiC4GFuQavKicesl1+67jo2YyCZTHE4jJcccEbPkWZ9pIJEbehWkZ9f8B7P
	1ocRjEPnJ91WvD7z8raT1Ju46mLs8z18/RfeVcc75Wksxjee3ZS9nSXK3BuW8q3nP12f
	Po3fu9ua3COlePVG7yCxykkuKZ47sXR1XmsiM=
Received: by 10.236.183.198 with SMTP id q46mr447883yhm.0.1328703775933;
	Wed, 08 Feb 2012 04:22:55 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id b12sm1695032yhj.4.2012.02.08.04.22.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Feb 2012 04:22:55 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2012 12:22:44 +0000
Message-Id: <05b7171b30b32b1915be322ff43c7be5f5b8e84f.1328703672.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1328703672.git.otavio@ossystems.com.br>
References: <cover.1328703672.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1328703672.git.otavio@ossystems.com.br>
References: <cover.1328703672.git.otavio@ossystems.com.br>
Subject: [PATCH 1/2] cross.bbclass: add virtclass handler
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
X-List-Received-Date: Wed, 08 Feb 2012 12:30:59 -0000

Allow use of BBCLASSEXTEND with 'cross' and use of virtclass-cross in
recipes.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/cross.bbclass |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 5681ab9..8da3048 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -55,6 +55,23 @@ libexecdir = "${exec_prefix}/libexec/${CROSS_TARGET_SYS_DIR}"
 
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



