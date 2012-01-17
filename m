Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rn6GE-0005AZ-0w
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 11:27:26 +0100
Received: by wibhi8 with SMTP id hi8so226636wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 02:19:49 -0800 (PST)
Received: by 10.180.99.225 with SMTP id et1mr26983067wib.2.1326795589403;
	Tue, 17 Jan 2012 02:19:49 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id df2sm8229252wib.4.2012.01.17.02.19.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jan 2012 02:19:48 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 11:19:42 +0100
Message-Id: <1326795583-22661-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/2] Revert "pango.inc: add directory "/etc/pango""
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
X-List-Received-Date: Tue, 17 Jan 2012 10:27:26 -0000

This reverts commit 65186bd86170d8c375931a18487c2fdf3bd1b3b0.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-graphics/pango/pango.inc |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index e7262c3..bf528f4 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -46,11 +46,6 @@ fi
 
 }
 
-# Command "pango-querymodules > /etc/pango/pango.modules" needs this directory.
-do_install_prepend() {
-	install -d ${D}/${sysconfdir}/pango
-}
-
 python populate_packages_prepend () {
 	prologue = d.getVar("postinst_prologue", 1)
 
@@ -59,5 +54,6 @@ python populate_packages_prepend () {
 	do_split_packages(d, modules_root, '^pango-(.*)\.so$', 'pango-module-%s', 'Pango module %s', prologue + 'pango-querymodules > /etc/pango/pango.modules')
 }
 
+FILES_${PN} = "/etc/pango/* ${bindir}/* ${libdir}/libpango*${SOLIBS}"
 FILES_${PN}-dbg += "${libdir}/pango/${LIBV}/modules/.debug"
 FILES_${PN}-dev += "${libdir}/pango/${LIBV}/modules/*.la"
-- 
1.7.2.5



