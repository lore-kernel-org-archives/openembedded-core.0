Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id A19576BF3E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 12:49:23 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id t18so5727587wrx.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 05:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=AFbsrgoSvRiMIQUlzsRPwBGTaQO99HoTNLYAcB6Mp14=;
	b=GhTtCx8KTZTbQgD20UPrUHP4zbcUwJ/ZetsqgbAt1SwuTlKrSvRDUEEa+qZtjbQCVp
	axCMOAKrC7GVjkwCaIgAi8gkTjMrT05YE1yKlurfGB5FXFIIbLKOTBdcHAd+RVb09pdO
	fZ+WL/3bgjgO/YWXwWp/Ioke7Hojp2nEnexl30GZ7sV78+meYQrEmxJIXTY07feglbE5
	5zTVIOLpvMPoLxHF4uE5g1e3uhzKEBOswVhrHfpAEJDZXUQi6RuM5H3Z/BeOmCKzp6Py
	7I1xGEvT0YbxLbJVRdTPo4iws0Xo5ilEjS2Y59U4WHV5wQZwhYrK5Fpj548tItTyMu+x
	6P/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=AFbsrgoSvRiMIQUlzsRPwBGTaQO99HoTNLYAcB6Mp14=;
	b=BLBhQ8IisMcodqX6hip8QZwDnzShBtK08uw1KGiA4SHCLO9qkvuXyLt3QIcWdvRFzI
	UjUL1t6j/QoYI4xIJO+qEQVIaX16QlJq3T/vj+QqAP4zPI4PaTlYYEG6/QFExLjyNE/m
	1l3CoiDJ6RhkqutW1jTybO5D7IIQDfH4DgNbTqONEw+HEqUWBUE7jch5ViCeMapjR+YD
	NmyrQRv73nLCbwFf78VO6cSo6WacP9hpmeXLNIEYuhQ0667UXVyopvBKpEJ+/fTMZXft
	hxpVt1TwDoatXvkIkL9l0G9l0aLAFwCXebiIeYhGwcGQ832ZVsA3VrZ04sae3WUHCedQ
	/ccw==
X-Gm-Message-State: APjAAAUIJOMDw/yL0S3vzadR+tOp3di5bWJWdPVWp5UI/MfbLRTzAyTv
	W74d9T9m+0Img/aypOL7M05V8SjcCoI=
X-Google-Smtp-Source: APXvYqxrYrQR/ERgloBdULm2VE8fTyUwSFa6X8e0WuaSYRpPSdP85zdFZprwTY0Ie3+tmY+FMoVwyQ==
X-Received: by 2002:a5d:558c:: with SMTP id i12mr30913412wrv.19.1552567763816; 
	Thu, 14 Mar 2019 05:49:23 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z129sm2080737wmc.33.2019.03.14.05.49.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Mar 2019 05:49:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Mar 2019 12:49:18 +0000
Message-Id: <20190314124918.12296-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] zlib: cleanup
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Mar 2019 12:49:23 -0000

Drop remove.ldconfig.call.patch, as it's easier to just set LDCONFIG=true.

Pass uname=GNU via the documented configure option instead of undocumented
environment variable.

Rename zlib-1.2.11/ to just zlib/ as we don't ship multiple versions.

Send ldflags-tests.patch upstream and update Upstream-Status.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../zlib/zlib-1.2.11/remove.ldconfig.call.patch     | 21 ---------------------
 .../{zlib-1.2.11 => zlib}/Makefile-runtests.patch   |  0
 .../zlib/{zlib-1.2.11 => zlib}/ldflags-tests.patch  |  4 ++--
 .../zlib/{zlib-1.2.11 => zlib}/run-ptest            |  0
 meta/recipes-core/zlib/zlib_1.2.11.bb               |  3 +--
 5 files changed, 3 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-core/zlib/zlib-1.2.11/remove.ldconfig.call.patch
 rename meta/recipes-core/zlib/{zlib-1.2.11 => zlib}/Makefile-runtests.patch (100%)
 rename meta/recipes-core/zlib/{zlib-1.2.11 => zlib}/ldflags-tests.patch (91%)
 rename meta/recipes-core/zlib/{zlib-1.2.11 => zlib}/run-ptest (100%)

diff --git a/meta/recipes-core/zlib/zlib-1.2.11/remove.ldconfig.call.patch b/meta/recipes-core/zlib/zlib-1.2.11/remove.ldconfig.call.patch
deleted file mode 100644
index 7ccbe1f44c6..00000000000
--- a/meta/recipes-core/zlib/zlib-1.2.11/remove.ldconfig.call.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-
-When /etc/ld.so.cache is writeable by user running bitbake then it creates invalid cache 
-(in my case libstdc++.so cannot be found after building zlib(-native) and I have to call 
-touch */libstdc++.so && /sbin/ldconfig to fix it.
-
-So remove ldconfig call from make install-libs
-
-Upstream-Status: Inappropriate [disable feature]
-
-Index: zlib-1.2.11/Makefile.in
-===================================================================
---- zlib-1.2.11.orig/Makefile.in
-+++ zlib-1.2.11/Makefile.in
-@@ -322,7 +322,6 @@ install-libs: $(LIBS)
- 	  rm -f $(DESTDIR)$(sharedlibdir)/$(SHAREDLIB) $(DESTDIR)$(sharedlibdir)/$(SHAREDLIBM); \
- 	  ln -s $(SHAREDLIBV) $(DESTDIR)$(sharedlibdir)/$(SHAREDLIB); \
- 	  ln -s $(SHAREDLIBV) $(DESTDIR)$(sharedlibdir)/$(SHAREDLIBM); \
--	  ($(LDCONFIG) || true)  >/dev/null 2>&1; \
- 	fi
- 	rm -f $(DESTDIR)$(man3dir)/zlib.3
- 	cp $(SRCDIR)zlib.3 $(DESTDIR)$(man3dir)
diff --git a/meta/recipes-core/zlib/zlib-1.2.11/Makefile-runtests.patch b/meta/recipes-core/zlib/zlib/Makefile-runtests.patch
similarity index 100%
rename from meta/recipes-core/zlib/zlib-1.2.11/Makefile-runtests.patch
rename to meta/recipes-core/zlib/zlib/Makefile-runtests.patch
diff --git a/meta/recipes-core/zlib/zlib-1.2.11/ldflags-tests.patch b/meta/recipes-core/zlib/zlib/ldflags-tests.patch
similarity index 91%
rename from meta/recipes-core/zlib/zlib-1.2.11/ldflags-tests.patch
rename to meta/recipes-core/zlib/zlib/ldflags-tests.patch
index 19c40b74529..286390665f0 100644
--- a/meta/recipes-core/zlib/zlib-1.2.11/ldflags-tests.patch
+++ b/meta/recipes-core/zlib/zlib/ldflags-tests.patch
@@ -1,7 +1,7 @@
 Obey LDFLAGS for tests
 
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/madler/zlib/pull/409]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 --- zlib-1.2.8.orig/Makefile.in
 +++ zlib-1.2.8/Makefile.in
diff --git a/meta/recipes-core/zlib/zlib-1.2.11/run-ptest b/meta/recipes-core/zlib/zlib/run-ptest
similarity index 100%
rename from meta/recipes-core/zlib/zlib-1.2.11/run-ptest
rename to meta/recipes-core/zlib/zlib/run-ptest
diff --git a/meta/recipes-core/zlib/zlib_1.2.11.bb b/meta/recipes-core/zlib/zlib_1.2.11.bb
index 6410519882d..41ec29d95e8 100644
--- a/meta/recipes-core/zlib/zlib_1.2.11.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.11.bb
@@ -7,7 +7,6 @@ LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://zlib.h;beginline=6;endline=23;md5=5377232268e952e9ef63bc555f7aa6c0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
-           file://remove.ldconfig.call.patch \
            file://Makefile-runtests.patch \
            file://ldflags-tests.patch \
            file://run-ptest \
@@ -24,7 +23,7 @@ RDEPENDS_${PN}-ptest += "make"
 inherit ptest
 
 do_configure() {
-	uname=GNU ./configure --prefix=${prefix} --shared --libdir=${libdir}
+	LDCONFIG=true ./configure --prefix=${prefix} --shared --libdir=${libdir} --uname=GNU
 }
 
 do_compile() {
-- 
2.11.0


