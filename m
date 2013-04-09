Received: from mail-we0-f176.google.com ([74.125.82.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1UPZet-0003pe-Tj
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 16:36:33 +0200
Received: by mail-we0-f176.google.com with SMTP id s43so5250717wey.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 07:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=h20zU0pCeX28Uzvcc4Djhaj9UEeM3vsChhimk6AjwwU=;
	b=r3f8jB1KX9oHZlGcsWdNBo1YK25Y/gkXHaAtNlPZbC71hcAwBFSwJ/9zWVNx42TxV+
	EJt9Ms7MMGWSh78luUHab7ayEe8DDyEHSvAjfZ1XF6O/0dimXwzd+WBxQ6KttaHqMOLs
	bt2xVp+ZSmhowBb5AqcLXKGs9ad5BCfyZk+LAV/0SyOh/ccMSEC3MdPEWre0lxuNMo62
	tMD6sJv1SFmUR+7vA7TJbC+BEtDyqx8OJVZLC7fAWCuxEFHCOHNBmQo21S4EUjAKzUhI
	tZTifLpt9ZzrHA5UgdjBsb9TAmD667fBGwYgrSTbZYdkCszqAtzy2A6CsUK5d6Jkd+xc
	rqDQ==
X-Received: by 10.194.157.42 with SMTP id wj10mr39174630wjb.12.1365517148052; 
	Tue, 09 Apr 2013 07:19:08 -0700 (PDT)
Received: from quad.modzo.koansoftware.com
	(host56-7-static.30-87-b.business.telecomitalia.it. [87.30.7.56])
	by mx.google.com with ESMTPS id t7sm26097852wij.2.2013.04.09.07.19.05
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 09 Apr 2013 07:19:07 -0700 (PDT)
From: Marco Cavallini <koansoftware@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2013 16:21:48 +0200
Message-Id: <1365517308-31004-1-git-send-email-m.cavallini@koansoftware.com>
X-Mailer: git-send-email 1.8.2.1
Cc: Marco Cavallini <m.cavallini@koansoftware.com>
Subject: [oe][meta-oe][PATCH 3/4] libxaw: add version 1.0.10
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
X-List-Received-Date: Tue, 09 Apr 2013 14:36:36 -0000

 * Recipe from oe-classic
 * Required by xinput-calibrator

Signed-off-by: Marco Cavallini <m.cavallini@koansoftware.com>
---
 meta/recipes-graphics/xorg-lib/libxaw_1.0.10.bb | 31 +++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxaw_1.0.10.bb

diff --git a/meta/recipes-graphics/xorg-lib/libxaw_1.0.10.bb b/meta/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
new file mode 100644
index 0000000..f5a4a6f
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
@@ -0,0 +1,31 @@
+require recipes-graphics/xorg-lib/xorg-lib-common.inc
+DESCRIPTION = "X Athena Widget Set"
+DEPENDS += "xproto virtual/libx11 libxext xextproto libxt libxmu libxpm libxau xmlto-native"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=1c65719d42900bb81b83e8293c20a364"
+
+PE = "1"
+PR = "r2"
+
+SRC_URI[md5sum] = "f1ea52debce7a18cc26b21647a00ad8b"
+SRC_URI[sha256sum] = "2d96bcf92638b8ec5c91d379f5ec2e7b15133adeb2ba22066d48bf3239ee1bdd"
+
+# disable docs as groff detection doesn't work on some hosts while cross compilling
+EXTRA_OECONF += " --disable-docs "
+
+do_install_append () {
+        ln -sf libXaw6.so.6 ${D}${libdir}/libXaw.so.6
+        ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so.7
+        ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so
+}
+
+PACKAGES =+ "libxaw6 libxaw7 libxaw8"
+
+FILES_libxaw6 = "${libdir}/libXaw*.so.6*"
+FILES_libxaw7 = "${libdir}/libXaw*.so.7*"
+FILES_libxaw8 = "${libdir}/libXaw8.so.8*"
+
+# Avoid dependency on libxaw as it is not build
+RDEPENDS_${PN}-dev = ""
+
+XORG_PN = "libXaw"
-- 
1.8.2.1



