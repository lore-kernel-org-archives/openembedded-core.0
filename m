Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TakRR-0003fS-MN
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 10:48:30 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAK9YQs8001569
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2012 01:34:27 -0800 (PST)
Received: from chenqi-OptiPlex-760.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 20 Nov 2012 01:34:24 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Nov 2012 17:34:33 +0800
Message-ID: <442aa8576f4be75369fe4068794573f257a4d083.1353311649.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1353311649.git.Qi.Chen@windriver.com>
References: <cover.1353311649.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] mdadm: make udev rules dir configurable
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
X-List-Received-Date: Tue, 20 Nov 2012 09:48:30 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

mdadm hardcodes the udev rules dir to be '/lib/udev/rules.d'.
However, udev configs its base library directory to be ${base_libdir}
instead of '/lib'. Thus if the target has powerpc64 architecture,
the mdraid.rules file will be missing on the target, as the library
directory is 'lib64'.

This patch makes the udev rules dir of mdadm configurable, so that
the mdraid.rules file will not be missing on any target.

[YOCTO #2804]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../mdadm-make-udev-rules-dir-configurable.patch   |   30 ++++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_3.2.6.bb         |    4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm-make-udev-rules-dir-configurable.patch

diff --git a/meta/recipes-extended/mdadm/files/mdadm-make-udev-rules-dir-configurable.patch b/meta/recipes-extended/mdadm/files/mdadm-make-udev-rules-dir-configurable.patch
new file mode 100644
index 0000000..46928e9
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/mdadm-make-udev-rules-dir-configurable.patch
@@ -0,0 +1,30 @@
+Make the udev rules dir configurable.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+Index: mdadm-3.2.6/Makefile
+=========================================================
+--- mdadm-3.2.6/Makefile
++++ mdadm-3.2.6/Makefile
+@@ -98,6 +98,7 @@ MANDIR  = /usr/share/man
+ MAN4DIR = $(MANDIR)/man4
+ MAN5DIR = $(MANDIR)/man5
+ MAN8DIR = $(MANDIR)/man8
++udevrulesdir ?= "/lib/udev.d/rules"
+ 
+ OBJS =  mdadm.o config.o policy.o mdstat.o  ReadMe.o util.o maps.o lib.o \
+ 	Manage.o Assemble.o Build.o \
+@@ -255,7 +256,7 @@ install-man: mdadm.8 md.4 mdadm.conf.5 mdmon.8
+ 	$(INSTALL) -D -m 644 mdadm.conf.5 $(DESTDIR)$(MAN5DIR)/mdadm.conf.5
+ 
+ install-udev: udev-md-raid.rules
+-	$(INSTALL) -D -m 644 udev-md-raid.rules $(DESTDIR)/lib/udev/rules.d/64-md-raid.rules
++	$(INSTALL) -D -m 644 udev-md-raid.rules $(DESTDIR)$(udevrulesdir)/64-md-raid.rules
+ 
+ uninstall:
+ 	rm -f $(DESTDIR)$(MAN8DIR)/mdadm.8 $(DESTDIR)$(MAN8DIR)/mdmon.8 $(DESTDIR)$(MAN4DIR)/md.4 $(DESTDIR)$(MAN5DIR)/mdadm.conf.5 $(DESTDIR)$(BINDIR)/mdadm
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-extended/mdadm/mdadm_3.2.6.bb b/meta/recipes-extended/mdadm/mdadm_3.2.6.bb
index 7b6a6c7..e0af60e 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.2.6.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.2.6.bb
@@ -8,10 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://mdmon.c;beginline=4;endline=18;md5=af7d8444d9c4d3e5c7caac0d9d34039d \
                     file://mdadm.h;beglinlne=4;endline=22;md5=462bc9936ac0d3da110191a3f9994161"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.bz2 \
 	    file://mdadm-3.2.2_fix_for_x32.patch \
+            file://mdadm-make-udev-rules-dir-configurable.patch \
 	  "
 
 SRC_URI[md5sum] = "3e255dc71e5144bbcb872788ca647267"
@@ -21,6 +22,7 @@ CFLAGS += "-fno-strict-aliasing"
 
 inherit autotools
 
+EXTRA_OEMAKE += "udevrulesdir=${base_libdir}/udev/rules.d"
 # We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header
 do_configure_prepend () {
 	sed -i -e '/.*ansidecl.h.*/d' ${S}/sha1.h
-- 
1.7.9.5



