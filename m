Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SUOgk-000412-Hp
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 22:49:51 +0200
Received: by ggnp4 with SMTP id p4so28517ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 13:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=OBVhTYER6+BbUyx/9jaPvM69OTOBpDD0pNeOyKD2Apo=;
	b=Vkm9GKus1L2Qcwy+ohDHIR7frflAfWxKBzz5i8G3436qhShZMC/5BpBeMW732AjTE7
	bSgdXdJgQNRbnXUi+Ow/fuDHXKuqs1Dyr+ssl5lawuQyemibgzUGTm3+3hEWMkMu43LL
	acHw5CdncbSc2YNjTFPDPr5ASpnxVTCBQjSEi4z+1S0PEOtthClisPzXtIwKgEKXgGge
	chfcbWlBssEbHwTF8OxLR81PFjv/2VzVYfAdYBcHwc70Y9h1LxggMpzic9eQYdOrWxWz
	S442xhCmNLCrWjQANftMhbQEwyNEAfzQTk6/asEMVtYawF7dNi6gw7MxHRASAbMzRQDS
	pHPQ==
Received: by 10.236.73.99 with SMTP id u63mr406216yhd.102.1337114385534;
	Tue, 15 May 2012 13:39:45 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id t36sm561200anh.1.2012.05.15.13.39.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 May 2012 13:39:44 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 May 2012 17:39:31 -0300
Message-Id: <1a12675b146fbaf56ff3e9505885c5f9f4ecbd26.1337114347.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1337114347.git.otavio@ossystems.com.br>
References: <cover.1337114347.git.otavio@ossystems.com.br>
Subject: [PATCH 1/1] kmod: fix installation path of pkgconfig files
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
X-List-Received-Date: Tue, 15 May 2012 20:49:51 -0000

The pkgconfig files need to be installed in ${libdir} instead of
${base_libdir}.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-kernel/kmod/kmod_git.bb |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index d9c4d8b..11dfe57 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -3,7 +3,7 @@
 
 require kmod.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 PROVIDES += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
 RPROVIDES_${PN} += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
@@ -16,7 +16,8 @@ RCONFLICTS_libkmod2 += "module-init-tools-insmod-static module-init-tools-depmod
 # autotools set prefix to /usr, however we want them in /bin and /sbin
 bindir = "${base_bindir}"
 sbindir = "${base_sbindir}"
-libdir = "${base_libdir}"
+
+EXTRA_OECONF += "--libdir=${base_libdir}"
 
 do_install_append () {
         install -dm755 ${D}${base_bindir}
@@ -34,6 +35,10 @@ do_install_append () {
 
         # install depmod.d file for search/ dir
         install -Dm644 "${WORKDIR}/depmod-search.conf" "${D}${base_libdir}/depmod.d/search.conf"
+
+        # fix pkgconfig installation path
+        install -dm755 ${D}${libdir}
+        mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
 }
 
 pkg_postinst_kmod() {
@@ -59,4 +64,5 @@ pkg_prerm_kmod() {
 PACKAGES =+ "libkmod"
 
 FILES_libkmod = "${base_libdir}/libkmod*${SOLIBS} ${libdir}/libkmod*${SOLIBS}"
+FILES_${PN}-dev += "${base_libdir}/libkmod*${SOLIBSDEV} ${base_libdir}/*.la"
 FILES_${PN} += "${base_libdir}/depmod.d ${base_libdir}/modprobe.d"
-- 
1.7.2.5



