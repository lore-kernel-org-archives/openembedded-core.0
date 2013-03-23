Received: from mail-gg0-f178.google.com ([209.85.161.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UJVGd-0005O3-Sn
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Mar 2013 21:42:20 +0100
Received: by mail-gg0-f178.google.com with SMTP id 21so265626ggh.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2013 13:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=p1zXuLL2aLHPKvEZbr2DjJbxWfvPYSQRZbgpU0MxOq8=;
	b=cn8jVleYdV1rivxe4TB2oqDrJBvsSR7x0uLbKq5GJbEKWZ3vzTpbdanQ+0Ok/EINsP
	ODfEt58awIimaCtRHfyDHzbbAG9629S89gr64+bbqV5BewvRI4VeuQg73StXHpFKVtZZ
	E8dARHZ4LN5oWiCwaTtl4fgZU4+vNydTpQm1zLmqf2u+oK7kRnUW4ZsLXrh5hyEJtVg8
	RXOPjR/d4YjO7/ow4qdxcApA54/5BRXjHPjyS5xnQDqhgT9uqdx7fKAe3morJ+CZM86s
	qJPwk/dr2dzdUlsLYu1JAfAxClPKxKaFs8ss45y5QLDZ1uTvsvpw9p5rPz2fpeUYJ/hP
	vB8Q==
X-Received: by 10.236.180.106 with SMTP id i70mr3901744yhm.149.1364070323825; 
	Sat, 23 Mar 2013 13:25:23 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id t47sm10040150yhe.22.2013.03.23.13.25.21
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 23 Mar 2013 13:25:23 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat, 23 Mar 2013 17:30:57 -0300
Message-Id: <1364070660-13157-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/4] linux-firmware: Use the included Makefile for install
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
X-List-Received-Date: Sat, 23 Mar 2013 20:42:21 -0000
X-List-Received-Date: Sat, 23 Mar 2013 20:42:21 -0000
X-List-Received-Date: Sat, 23 Mar 2013 20:42:21 -0000

This uses the install procedure included in the Makefile which avoids
code dupplication.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../linux-firmware/linux-firmware/makefile-fix.patch  | 19 +++++++++++++++++++
 .../linux-firmware/linux-firmware_git.bb              |  6 +++---
 2 files changed, 22 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-kernel/linux-firmware/linux-firmware/makefile-fix.patch

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware/makefile-fix.patch b/meta/recipes-kernel/linux-firmware/linux-firmware/makefile-fix.patch
new file mode 100644
index 0000000..8a23284
--- /dev/null
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware/makefile-fix.patch
@@ -0,0 +1,19 @@
+build: Avoid use of bashism and Makefile deployment
+
+Upstream-Status: Submitted
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
+diff --git a/Makefile b/Makefile
+index 321a4e2..9bdeef0 100644
+--- a/Makefile
++++ b/Makefile
+@@ -9,4 +9,7 @@ install:
+ 	mkdir -p $(DESTDIR)$(FIRMWAREDIR)
+ 	cp -r * $(DESTDIR)$(FIRMWAREDIR)
+ 	rm -f $(DESTDIR)/usbdux/*dux $(DESTDIR)/*/*.asm
+-	rm $(DESTDIR)$(FIRMWAREDIR)/{WHENCE,LICENSE.*,LICENCE.*}
++	rm $(DESTDIR)$(FIRMWAREDIR)/Makefile
++	rm $(DESTDIR)$(FIRMWAREDIR)/WHENCE
++	rm $(DESTDIR)$(FIRMWAREDIR)/LICENSE.*
++	rm $(DESTDIR)$(FIRMWAREDIR)/LICENCE.*
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index b9e00fc..6842738 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -24,7 +24,8 @@ SRCREV = "c530a75c1e6a472b0eb9558310b518f0dfcd8860"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git;protocol=git"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git;protocol=git \
+           file://makefile-fix.patch"
 
 S = "${WORKDIR}/git"
 
@@ -35,8 +36,7 @@ do_compile() {
 }
 
 do_install() {
-	install -d  ${D}/lib/firmware/
-	cp -r * ${D}/lib/firmware/
+	oe_runmake install DESTDIR=${D}
 
 	# Libertas sd8686
 	ln -sf libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin
-- 
1.8.1



