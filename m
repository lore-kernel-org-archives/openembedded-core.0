Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1THMPY-0002sQ-Jc for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 00:18:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8RM5Wok004575
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 23:05:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03933-04 for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 23:05:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8RM5PDQ004569
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 23:05:26 +0100
Message-ID: <1348783527.15753.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Sep 2012 23:05:27 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] tcl: Fix dangerous do_install staging references
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
X-List-Received-Date: Thu, 27 Sep 2012 22:18:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Nothing should ever be poking files directly into the staging/sysroot
directories, it should always go through ${D}.

This patch ensures this recipe does this and hence fixes various
potential build issues such as lack of sstate tracking of files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
index e5fe7d3..fab6057 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
@@ -44,7 +44,7 @@ do_compile_prepend() {
 
 do_install() {
 	autotools_do_install
-	oe_libinstall -so libtcl8.5 ${STAGING_LIBDIR}
+	oe_libinstall -so libtcl8.5 ${D}${libdir}
 	ln -sf ./tclsh8.5 ${D}${bindir}/tclsh
 	sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
 	sed -i "s,-L${libdir},-L=${libdir},g" tclConfig.sh
@@ -54,8 +54,8 @@ do_install() {
 	cd ..
 	for dir in compat generic unix
 	do
-		install -d ${STAGING_INCDIR}/tcl${PV}/$dir
-		install -m 0644 $dir/*.h ${STAGING_INCDIR}/tcl${PV}/$dir/
+		install -d ${D}${includedir}/tcl${PV}/$dir
+		install -m 0644 $dir/*.h ${D}${includedir}/tcl${PV}/$dir/
 	done
 }
 




