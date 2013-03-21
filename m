Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1UIi6M-0006Mm-Hu
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 17:12:30 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LG4s07009104; Thu, 21 Mar 2013 16:04:54 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id v+4utQTBZMzE; Thu, 21 Mar 2013 16:04:54 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LG4lsr009078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 21 Mar 2013 16:04:49 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1UIhpm-0006Li-8L; Thu, 21 Mar 2013 15:55:18 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2013 15:55:02 +0000
Message-Id: <1363881315-24352-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 03/16] watchdog: Fix case where ${B} != ${S}
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
X-List-Received-Date: Thu, 21 Mar 2013 16:13:20 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../watchdog/files/fixsepbuild.patch               |   27 ++++++++++++++++++++
 meta/recipes-extended/watchdog/watchdog_5.13.bb    |    1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-extended/watchdog/files/fixsepbuild.patch

diff --git a/meta/recipes-extended/watchdog/files/fixsepbuild.patch b/meta/recipes-extended/watchdog/files/fixsepbuild.patch
new file mode 100644
index 0000000..2fad3a1
--- /dev/null
+++ b/meta/recipes-extended/watchdog/files/fixsepbuild.patch
@@ -0,0 +1,27 @@
+Fix out of tree build support:
+
+| installing /etc/watchdog.conf
+|  /bin/mkdir -p '/media/build1/poky/build/tmp/work/i586-poky-linux/watchdog/5.13-r0/image/usr/share/man/man5'
+|  /bin/mkdir -p '/media/build1/poky/build/tmp/work/i586-poky-linux/watchdog/5.13-r0/image/usr/share/man/man8'
+|  /usr/bin/install -c -m 644 /media/build1/poky/build/tmp/work/i586-poky-linux/watchdog/5.13-r0/watchdog-5.13/watchdog.conf.5 '/media/build1/poky/build/tmp/work/i586-poky-linux/watchdog/5.13-r0/image/usr/share/man/man5'
+|  /usr/bin/install -c -m 644 /media/build1/poky/build/tmp/work/i586-poky-linux/watchdog/5.13-r0/watchdog-5.13/watchdog.8 /media/build1/poky/build/tmp/work/i586-poky-linux/watchdog/5.13-r0/watchdog-5.13/wd_keepalive.8 /media/build1/poky/build/tmp/work/i586-poky-linux/watchdog/5.13-r0/watchdog-5.13/wd_identify.8 '/media/build1/poky/build/tmp/work/i586-poky-linux/watchdog/5.13-r0/image/usr/share/man/man8'
+| /usr/bin/install: cannot stat `watchdog.conf': No such file or directory
+| make[2]: *** [install-etc-local] Error 1
+
+Upstream-Status: Pending
+
+RP 2013/03/21
+
+Index: watchdog-5.13/Makefile.am
+===================================================================
+--- watchdog-5.13.orig/Makefile.am	2013-02-01 11:15:44.000000000 +0000
++++ watchdog-5.13/Makefile.am	2013-03-21 11:59:35.637139031 +0000
+@@ -16,7 +16,7 @@
+ 	else \
+ 	        echo "installing $(CONFIG_FILENAME)"; \
+ 		$(mkinstalldirs) `dirname $(DESTDIR)$(CONFIG_FILENAME)`; \
+-	        $(INSTALL_DATA) watchdog.conf $(DESTDIR)$(CONFIG_FILENAME); \
++	        $(INSTALL_DATA) $(srcdir)/watchdog.conf $(DESTDIR)$(CONFIG_FILENAME); \
+ 	fi
+ 
+ install-data-local: install-etc-local
diff --git a/meta/recipes-extended/watchdog/watchdog_5.13.bb b/meta/recipes-extended/watchdog/watchdog_5.13.bb
index 610e473..b9e29d2 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.13.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.13.bb
@@ -9,6 +9,7 @@ LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ecc0551bf54ad97f6b541720f84d6569"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
+           file://fixsepbuild.patch \
 	   file://fix-ping-failure.patch"
 SRC_URI[md5sum] = "153455f008f1cf8f65f6ad9586a21ff1"
 SRC_URI[sha256sum] = "141e0faf3ee4d8187a6ff4e00b18ef7b7a4ce432a2d4c8a6e6fdc62507fc6eb0"
-- 
1.7.10.4



