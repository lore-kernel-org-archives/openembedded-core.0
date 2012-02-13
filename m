Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rwy9Y-00071u-Nb
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Feb 2012 16:49:20 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so1514696eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2012 07:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=HYKYEV4mV9wU2et4ooKM4/El1kNQiHZXFuUGtwTJJ9g=;
	b=MIYGyDsQLdybWh//V3/m2huju0G4KZtOGsCT/l79IaLLeY+kbOheDhL/u4MRF86SHT
	t2jzNkbUz14j8R1FNkN7UudZkGMc6Ez45LLlGw1XTX8v3ZTKIzbttvlixoBQYhAxT+eg
	XpxDIzC3d9XzEc+3YsnPjZnY46cNrpuA2UAz8=
Received: by 10.14.94.200 with SMTP id n48mr5443246eef.48.1329147672670;
	Mon, 13 Feb 2012 07:41:12 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n52sm2805580eea.5.2012.02.13.07.41.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 07:41:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2012 16:40:48 +0100
Message-Id: <2b0671c84f90ca7584212a4c8cc3be52cac5ac4d.1329147583.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <1e2722b29db9486276198e13f06345babce10518.1329147583.git.Martin.Jansa@gmail.com>
References: <1e2722b29db9486276198e13f06345babce10518.1329147583.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1329147583.git.Martin.Jansa@gmail.com>
References: <cover.1329147583.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/4] zlib: remove ldconfig call from install-libs
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
X-List-Received-Date: Mon, 13 Feb 2012 15:49:20 -0000

* it's called from install-libs target and when /etc/ld.so.cache is writeable by user running bitbake
  then it creates invalid cache (in my case libstdc++.so cannot be found after building zlib(-native)
  and I have to call touch */libstdc++.so && /sbin/ldconfig to fix it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../zlib/zlib-1.2.6/remove.ldconfig.call.patch     |   20 ++++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.6.bb               |    3 +++
 2 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/zlib/zlib-1.2.6/remove.ldconfig.call.patch

diff --git a/meta/recipes-core/zlib/zlib-1.2.6/remove.ldconfig.call.patch b/meta/recipes-core/zlib/zlib-1.2.6/remove.ldconfig.call.patch
new file mode 100644
index 0000000..403b482
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib-1.2.6/remove.ldconfig.call.patch
@@ -0,0 +1,20 @@
+
+When /etc/ld.so.cache is writeable by user running bitbake then it creates invalid cache 
+(in my case libstdc++.so cannot be found after building zlib(-native) and I have to call 
+touch */libstdc++.so && /sbin/ldconfig to fix it.
+
+So remove ldconfig call from make install-libs
+
+Upstream-Status: Inappropriate [disable feature]
+
+diff -uNr zlib-1.2.6.orig/Makefile.in zlib-1.2.6/Makefile.in
+--- zlib-1.2.6.orig/Makefile.in	2012-01-28 23:48:50.000000000 +0100
++++ zlib-1.2.6/Makefile.in	2012-02-13 15:38:20.577700723 +0100
+@@ -199,7 +199,6 @@
+ 	  rm -f $(DESTDIR)$(sharedlibdir)/$(SHAREDLIB) $(DESTDIR)$(sharedlibdir)/$(SHAREDLIBM); \
+ 	  ln -s $(SHAREDLIBV) $(DESTDIR)$(sharedlibdir)/$(SHAREDLIB); \
+ 	  ln -s $(SHAREDLIBV) $(DESTDIR)$(sharedlibdir)/$(SHAREDLIBM); \
+-	  ($(LDCONFIG) || true)  >/dev/null 2>&1; \
+ 	fi
+ 	cp zlib.3 $(DESTDIR)$(man3dir)
+ 	chmod 644 $(DESTDIR)$(man3dir)/zlib.3
diff --git a/meta/recipes-core/zlib/zlib_1.2.6.bb b/meta/recipes-core/zlib/zlib_1.2.6.bb
index a220773..54f8abf 100644
--- a/meta/recipes-core/zlib/zlib_1.2.6.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.6.bb
@@ -6,7 +6,10 @@ SECTION = "libs"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://zlib.h;beginline=4;endline=23;md5=94d1b5a40dadd127f3351471727e66a9"
 
+PR = "r1"
+
 SRC_URI = "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
+           file://remove.ldconfig.call.patch \
            "
 SRC_URI[md5sum] = "dc2cfa0d2313ca77224b4d932b2911e9"
 SRC_URI[sha256sum] = "fa3e3e4881fa5810b8903f2c7e0dcd5a0a673535f0438021c4bbb5db1b918c8e"
-- 
1.7.8.4



