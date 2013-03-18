Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1UHPiO-0007Lj-Pe
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 03:22:44 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I2EYqf024771; Mon, 18 Mar 2013 02:14:34 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7ztUkLyV60xV; Mon, 18 Mar 2013 02:14:34 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I2ESbI024747
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 18 Mar 2013 02:14:29 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1UHPRt-0003V5-VR; Mon, 18 Mar 2013 02:05:18 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2013 02:05:02 +0000
Message-Id: <1363572312-13399-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1363572312-13399-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1363572312-13399-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 04/13] distcc: Fix case where ${B} != ${S}
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
X-List-Received-Date: Mon, 18 Mar 2013 02:22:59 -0000

Add patch to fix out of tree build failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/distcc/distcc_3.1.bb          |    1 +
 .../distcc/files/separatebuilddir.patch             |   19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/distcc/files/separatebuilddir.patch

diff --git a/meta/recipes-devtools/distcc/distcc_3.1.bb b/meta/recipes-devtools/distcc/distcc_3.1.bb
index eeda054..cb5d696 100644
--- a/meta/recipes-devtools/distcc/distcc_3.1.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.1.bb
@@ -17,6 +17,7 @@ PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk --without-gnome,gtk+"
 RRECOMMENDS_${PN} = "avahi-daemon"
 
 SRC_URI = "http://distcc.googlecode.com/files/${BPN}-${PV}.tar.bz2 \
+           file://separatebuilddir.patch \
            file://default \
            file://distccmon-gnome.desktop \
            file://distcc"
diff --git a/meta/recipes-devtools/distcc/files/separatebuilddir.patch b/meta/recipes-devtools/distcc/files/separatebuilddir.patch
new file mode 100644
index 0000000..d945b9b
--- /dev/null
+++ b/meta/recipes-devtools/distcc/files/separatebuilddir.patch
@@ -0,0 +1,19 @@
+When building with a separate build directory, make install fails,
+unable to find the gnome_data files. This patch corrects the
+patch and ensures the build works in this case.
+
+RP 2013/3/8
+
+Index: distcc-3.1/Makefile.in
+===================================================================
+--- distcc-3.1.orig/Makefile.in	2008-12-02 21:50:31.000000000 +0000
++++ distcc-3.1/Makefile.in	2013-03-08 10:49:24.224400937 +0000
+@@ -1088,7 +1088,7 @@
+ install-gnome-data: $(gnome_data)
+ 	$(mkinstalldirs) "$(DESTDIR)$(pkgdatadir)"
+ 	for p in $(gnome_data); do				\
+-	$(INSTALL_DATA) "$$p" "$(DESTDIR)$(pkgdatadir)" || exit 1; \
++	$(INSTALL_DATA) "$(srcdir)/$$p" "$(DESTDIR)$(pkgdatadir)" || exit 1; \
+ 	done
+ 
+ install-conf: $(conf_files) $(default_files)
-- 
1.7.10.4



