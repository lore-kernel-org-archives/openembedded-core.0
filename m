Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 92B3173D2A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 12:40:45 +0000 (UTC)
Received: by wizk4 with SMTP id k4so53346313wiz.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Apr 2015 05:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cICLlGAZ8awDdKkcoVuunMVz4sBI+0aEOE85BFRrJSY=;
	b=UQUe1eXQvnrLw0kBtAWQodGtnYSOoGoJ8Z6GpEIHG6B3QzNEee3w0us7KSjp5332cb
	aBw/i++bAQsMaZRUnvH1IJCZoMmyp+HsDAcDYwGRRaBxghYfkmXVfT23FUDTiO2/VrA7
	LAHsTbtQl65YvthggnOXyVF5Z6bvsnNatxncAZlmfXwOUK34VpDbkX2qaHd95+WidEXC
	ITbv3QkVYkEBCjbGwTmLeNL9RnOMWC2MLPi6pjemYuVYshj5SyCNsQJYD2Oxlr7BqgpH
	f0YFtOH53O9RnikjD4jGODC/Y03zWw+UsUgKmwIIqdXCUSUQbCEgSPyu0r6yjyUI0qj1
	VZsA==
X-Received: by 10.181.25.225 with SMTP id it1mr13968067wid.8.1428496845962;
	Wed, 08 Apr 2015 05:40:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	lx10sm15465407wjb.17.2015.04.08.05.40.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Apr 2015 05:40:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Apr 2015 14:40:45 +0200
Message-Id: <1428496845-32389-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1428496845-32389-1-git-send-email-Martin.Jansa@gmail.com>
References: <1428496845-32389-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] pango: fix postinst
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
X-List-Received-Date: Wed, 08 Apr 2015 12:40:46 -0000

* merge postinst_prologue with the append in the do_split_packages call
  Now we can call correct pango-querymodules binary and respect D
  variable, otherwise we're trying to regenerate it on host which fails:
  pango-module-basic-fc.postinst: line 17: /usr/bin/pango-querymodules:
  No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/pango/pango.inc | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index b59d33d..df0fdf6 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -46,12 +46,12 @@ EXTRA_OECONF = "--disable-introspection \
 LEAD_SONAME = "libpango-1.0*"
 LIBV = "1.8.0"
 
-postinst_prologue() {
+pango_postinst() {
 if ! [ -e $D${sysconfdir}/pango ] ; then
 	mkdir -p $D${sysconfdir}/pango
 fi
 
-if [ "x$D" != "x" ]; then
+if [ -n "$D" ]; then
 	${@qemu_run_binary(d, '$D','${bindir}/${MLPREFIX}pango-querymodules')} \
 		$D${libdir}/pango/${LIBV}/modules/*.so \
 		> $D${sysconfdir}/pango/${MLPREFIX}pango.modules 2>/dev/null
@@ -61,6 +61,8 @@ if [ "x$D" != "x" ]; then
 	sed -i -e "s:$D::" $D${sysconfdir}/pango/${MLPREFIX}pango.modules
 
 	exit 0
+else
+	${bindir}/${MLPREFIX}pango-querymodules > /etc/pango/${MLPREFIX}pango.modules
 fi
 }
 
@@ -79,11 +81,11 @@ do_install_append () {
 
 
 python populate_packages_prepend () {
-    prologue = d.getVar("postinst_prologue", True)
+    pango_postinst = d.getVar("pango_postinst", True)
 
     modules_root = d.expand('${libdir}/pango/${LIBV}/modules')
 
-    do_split_packages(d, modules_root, '^pango-(.*)\.so$', 'pango-module-%s', 'Pango module %s', prologue + '${bindir}/${MLPREFIX}pango-querymodules > /etc/pango/${MLPREFIX}pango.modules')
+    do_split_packages(d, modules_root, '^pango-(.*)\.so$', 'pango-module-%s', 'Pango module %s', pango_postinst)
 }
 
 FILES_${PN} = "${sysconfdir}/pango/* ${bindir}/* ${libdir}/libpango*${SOLIBS}"
-- 
2.3.5


