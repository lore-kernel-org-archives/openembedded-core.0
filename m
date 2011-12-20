Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rd56Z-0005Cd-Vc
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 20:12:04 +0100
Received: by mail-yw0-f47.google.com with SMTP id o47so4599160yho.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2011 11:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=0+S8UlMO+/V8UUE5QaxWhVaK9iq4nJ3RJjn5FVFp7Wk=;
	b=FlsXecRmo/9TARIPcOuRMbSZVKYOmbEyqgd3ZP3ixX1BleLsXZgvv+zCtGdEkuYDIy
	AYOinzRVd+m7R3YOTEAnxPQoIct7Z/FJDMclw9ghWETPsOMWqDMcaecipEjHNTnLnVgI
	lXrml0XUysz4AhqyXClxK5uZgZY2sqopt+cvE=
Received: by 10.236.128.197 with SMTP id f45mr5865102yhi.44.1324407901999;
	Tue, 20 Dec 2011 11:05:01 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id o50sm4771379yhl.9.2011.12.20.11.04.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 11:05:01 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Dec 2011 19:04:15 +0000
Message-Id: <444cb0c0c2b99cac90d3b9964d44021c08b1a774.1324407759.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1324407759.git.otavio@ossystems.com.br>
References: <cover.1324407759.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1324407759.git.otavio@ossystems.com.br>
References: <cover.1324407759.git.otavio@ossystems.com.br>
Subject: [PATCH 9/9] udev: split utilities onto udev-utils
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
X-List-Received-Date: Tue, 20 Dec 2011 19:12:04 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/udev/udev.inc    |    6 +++++-
 meta/recipes-core/udev/udev_164.bb |    2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 7b6ed64..8343eaf 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -36,7 +36,7 @@ libexecdir = "${base_libdir}/udev"
 EXTRA_OECONF = "--disable-introspection --with-rootlibdir=${base_libdir} \
                 --with-pci-ids-path=${datadir}/pci.ids"
 
-PACKAGES =+ "udev-acl udev-consolekit"
+PACKAGES =+ "udev-acl udev-consolekit udev-utils"
 PACKAGES =+ "udev-cache libudev libudev-dev libudev-dbg"
 PACKAGES =+ "libgudev libgudev-dev libgudev-dbg"
 
@@ -47,6 +47,8 @@ INITSCRIPT_NAME_udev-cache = "udev-cache"
 INITSCRIPT_PARAMS_udev-cache = "start 36 S ."
 
 FILES_${PN} += "${libexecdir} ${libdir}/ConsoleKit"
+RRECOMMENDS_${PN} += "udev-utils"
+
 FILES_${PN}-dbg += "${libexecdir}/.debug"
 FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc"
 FILES_libudev = "${base_libdir}/libudev.so.*"
@@ -61,6 +63,8 @@ FILES_udev-cache = "${sysconfdir}/init.d/udev-cache ${sysconfdir}/default/udev-c
 
 FILES_udev-acl = "${base_libdir}/udev/udev-acl ${base_libdir}/udev/rules.d/70-acl.rules"
 
+FILES_udev-utils = "${bindir}/udevinfo ${bindir}/udevtest ${base_sbindir}/udevadm"
+
 RDEPENDS_udev-consolekit += "udev-acl"
 FILES_udev-consolekit = "${libdir}/ConsoleKit"
 
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index b993a13..d661044 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r11"
+PR = "r12"
 
 SRC_URI += "file://udev-166-v4l1-1.patch"
 
-- 
1.7.2.5



