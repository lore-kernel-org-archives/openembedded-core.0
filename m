Received: from mail-pa0-f53.google.com ([209.85.220.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U6RDw-0005Eh-Ol
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Feb 2013 20:45:33 +0100
Received: by mail-pa0-f53.google.com with SMTP id bg4so1836475pad.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2013 11:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=32QkT6cI36GqD+T4R2rWq2uoo4Nv25BcGZmHSPDvyVE=;
	b=v/r3wBM/ol7kmJjEKeBjO0Eds4m1OzULeGNcgBZvo27ywbTd0pJwIUnvrqmBRvIynH
	A8YP4iq1f1cdo3DnxcM3MFRHnhqBcWk+rVJLnYs3JT5ADkuNRrJIK7xJJ6cN4IqklhcJ
	K5Z7vprikpKs7s2KqnzpcPWu/4G1JnQstOxHF/WqpwIIkWI5KfLVn3yxghkQZwamcXbg
	Td/4Lx0Ia8Ql+TA6/XPlM7++Wn/buXWa0UzwwNk9+V5R+5VqUxNUDk0JW9wWWng7EPth
	rkzYaUjyxcQdLd5wrwiZ/0XSalKcb40H14XX9YpuT0CitBZ6Vletk3RPzYzKaNLw4me9
	aIQw==
X-Received: by 10.68.144.97 with SMTP id sl1mr8762555pbb.49.1360956568188;
	Fri, 15 Feb 2013 11:29:28 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id i10sm5563171pbd.1.2013.02.15.11.29.26
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 15 Feb 2013 11:29:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Feb 2013 11:29:10 -0800
Message-Id: <1360956550-31119-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] systemd: Fix packaging warnings and spin libnss_myhostname to package of its own
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
X-List-Received-Date: Fri, 15 Feb 2013 19:45:33 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 0c3ebc4..aa6fcea 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -102,7 +102,9 @@ do_install() {
 }
 
 python populate_packages_prepend (){
-    systemdlibdir = d.getVar("base_libdir", True)
+    systemdbaselibdir = d.getVar("base_libdir", True)
+    do_split_packages(d, systemdbaselibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
+    systemdlibdir = d.getVar("libdir", True)
     do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
 }
 PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
@@ -149,7 +151,6 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${systemd_unitdir}/system/* \
                 /lib/udev/rules.d/99-systemd.rules \
                 ${base_libdir}/security/*.so \
-                ${libdir}/libnss_myhostname.so.2 \
                 /cgroup \
                 ${bindir}/systemd* \
                 ${bindir}/localectl \
@@ -162,6 +163,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${exec_prefix}/lib/sysctl.d \
                 ${localstatedir} \
                 ${libexecdir} \
+                /lib/udev/hwdb.d \
                 /lib/udev/rules.d/70-uaccess.rules \
                 /lib/udev/rules.d/71-seat.rules \
                 /lib/udev/rules.d/73-seat-late.rules \
-- 
1.7.9.5



