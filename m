Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 04C6660DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 20:23:12 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id e49so1715467eek.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 12:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XL6CmiiHqwMMpWMqMz7alayoBzFdadn+PJitcbWCkmY=;
	b=k12KSbPO9q3QuYDO8L3FxfkSXaU4Mn4HuYryLjrtpNHc5Gn2YWcDdPlzEFupBtkaJy
	jPEp1ZSJspgcsU2TEVgw0czyKUT5vf1q9T29C9njcirx1BXtVfc4t6fKj/KcLckLqMqf
	36WDQR8HxEbroYMitvUtiN6T1+dDE8i0y/mkFUbAy1fxFJNbmIn1vv5jI5Ine3prGBB4
	Z77OFcwIl0OjpofTJcqI7BLkxDxYXYi9ZhSe8undYhJrQRQWK3dPX/8GpaN6aQSPU7cp
	g84AovueCIhyZ2+yK1bX/7p5smuiD4d0Y0a5pQwMhRhXkF/Btnn4WAi3JTcBToz71ofw
	Kk2w==
X-Received: by 10.14.99.196 with SMTP id x44mr15478760eef.65.1393532593209;
	Thu, 27 Feb 2014 12:23:13 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id m1sm1655510een.7.2014.02.27.12.23.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Feb 2014 12:23:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2014 21:20:38 +0100
Message-Id: <1393532438-20847-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] pango: Fix postinst
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
X-List-Received-Date: Thu, 27 Feb 2014 20:23:13 -0000

* do_split_packages was appending call to
  ${bindir}/${MLPREFIX}pango-querymodules
  without $D prefix or test if $D is empty, so it was always
  failing on buildhostis without pango-querymodules and such
  failure is fatal when rootfs is read-only (do_rootfs fails
  because some packages weren't configured)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/pango/pango.inc | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index 17006d3..5fddff9 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -42,21 +42,25 @@ EXTRA_OECONF = "--disable-introspection \
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
 
-	[ $? -ne 0 ] && exit 1
+	if [ $? -ne 0 ] ; then
+		echo "qemu_run_binary call ${bindir}/${MLPREFIX}pango-querymodules $D${libdir}/pango/${LIBV}/modules/*.so > $D${sysconfdir}/pango/${MLPREFIX}pango.modules failed"
+		exit 1
 
 	sed -i -e "s:$D::" $D${sysconfdir}/pango/${MLPREFIX}pango.modules
 
 	exit 0
+else
+	${bindir}/${MLPREFIX}pango-querymodules > /etc/pango/${MLPREFIX}pango.modules
 fi
 }
 
@@ -68,11 +72,11 @@ do_install_append () {
 
 
 python populate_packages_prepend () {
-    prologue = d.getVar("postinst_prologue", True)
+    pango_postinst = d.getVar("pango_postinst", True)
 
     modules_root = d.expand('${libdir}/pango/${LIBV}/modules')
 
-    do_split_packages(d, modules_root, '^pango-(.*)\.so$', 'pango-module-%s', 'Pango module %s', prologue + '${bindir}/${MLPREFIX}pango-querymodules > /etc/pango/${MLPREFIX}pango.modules')
+    do_split_packages(d, modules_root, '^pango-(.*)\.so$', 'pango-module-%s', 'Pango module %s', pango_postinst)
 }
 
 FILES_${PN} = "${sysconfdir}/pango/* ${bindir}/* ${libdir}/libpango*${SOLIBS}"
-- 
1.9.0


