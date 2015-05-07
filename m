Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 554E760138
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 14:34:54 +0000 (UTC)
Received: by widdi4 with SMTP id di4so244976906wid.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 May 2015 07:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=GI+Jni/kSmox+VRMAyB+rYJtV9u46/dRsJrFGpXS3rw=;
	b=YaG8iiFOQamZO6g3/k4Z1ldsvKnF8OIgOKrg099/CENIH3L9wuOsWN/GDT5g8DywrR
	dYp8C8YpSnxLIwr5VjgfS/gAX5gh+nEb+DjX2BdhWrRVG7SDsVzGfQ/PNVrwNYSNynxq
	5j4L3XLutv6trHcB75bHWmFAZOB+eh/TApRqBTfVNbgCH+jnsk7v3MSzvFSkvDSaNG4D
	g1ugu4d0MT8n1xtLhr3KDXttXUHJrpcmFBin+exCp2KjOtAlYI8OdmUVLmc/VhfZAvsa
	r/jRlvgmZ/8JSmGeAhMBzJhqQYOOyDHokdl6IM+gdw6FX9iBFH7cCAMLn7evVCxkX8Ff
	B0Bw==
X-Gm-Message-State: ALoCoQkqWByxUEWX+bKuhQQvxF2dInQ/GH49eUmBOdOWH3RgQa5FcLdjEfW7KHP9wfJv01ncxA/y
X-Received: by 10.180.94.168 with SMTP id dd8mr7162365wib.76.1431009294345;
	Thu, 07 May 2015 07:34:54 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id ei8sm3735221wjd.32.2015.05.07.07.34.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 May 2015 07:34:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 May 2015 15:30:53 +0100
Message-Id: <1431009054-29889-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] bind: update libxml2 detection patch
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
X-List-Received-Date: Thu, 07 May 2015 14:34:56 -0000

Refresh the libxml2 detection patch to directly call pkg-config instead of
attempting to use xml2-config, which will always return an error in OE.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...0001-build-use-pkg-config-to-find-libxml2.patch | 42 ++++++++++++++++++++++
 ...d-crosscripts-search-path-for-xml2-config.patch | 35 ------------------
 meta/recipes-connectivity/bind/bind_9.10.2.bb      |  7 ++--
 3 files changed, 45 insertions(+), 39 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/bind-add-crosscripts-search-path-for-xml2-config.patch

diff --git a/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch b/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch
new file mode 100644
index 0000000..cb5251d
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch
@@ -0,0 +1,42 @@
+xml2-config is disabled, so change the configure script to use pkgconfig to find
+libxml2.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+---
+ configure.in | 18 +++---------------
+ 1 file changed, 3 insertions(+), 15 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index d566e1c..c9ef3a6 100644
+--- a/configure.in
++++ b/configure.in
+@@ -2102,21 +2102,9 @@ case "$use_libxml2" in
+ 		DST_LIBXML2_INC=""
+ 		;;
+ 	auto|yes)
+-		case X`(xml2-config --version) 2>/dev/null` in
+-		X2.[[6789]].*)
+-			libxml2_libs=`xml2-config --libs`
+-			libxml2_cflags=`xml2-config --cflags`
+-			;;
+-		*)
+-			libxml2_libs=
+-			libxml2_cflags=
+-			;;
+-		esac
+-		;;
+-	*)
+-		if test -f "$use_libxml2/bin/xml2-config" ; then
+-			libxml2_libs=`$use_libxml2/bin/xml2-config --libs`
+-			libxml2_cflags=`$use_libxml2/bin/xml2-config --cflags`
++		if pkg-config --exists libxml-2.0 ; then
++			libxml2_libs=`pkg-config libxml-2.0 --libs`
++			libxml2_cflags=`pkg-config libxml-2.0 --cflags`
+ 		fi
+ 		;;
+ esac
+-- 
+2.1.4
+
diff --git a/meta/recipes-connectivity/bind/bind/bind-add-crosscripts-search-path-for-xml2-config.patch b/meta/recipes-connectivity/bind/bind/bind-add-crosscripts-search-path-for-xml2-config.patch
deleted file mode 100644
index d24276c..0000000
--- a/meta/recipes-connectivity/bind/bind/bind-add-crosscripts-search-path-for-xml2-config.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 8fa549fe5390875d56f75e20d364394cd5ccf388 Mon Sep 17 00:00:00 2001
-From: Joe MacDonald <joe_macdonald@mentor.com>
-Date: Mon, 3 Nov 2014 21:52:02 -0500
-Subject: [PATCH] bind: add crosscripts search path for xml2-config
-
-The configure script was testing xml2-config from bin but in openembedded
-bin folder is not copied to sysroot so the test was failing. Added another 
-condition to test libxml-2.0.pc which is present in lib folder. Used pkg-config
-to get libs and cflags information.
-
-Upstream-Status: Inappropriate [ openembedded specific ]
-
-Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
-Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
----
- configure.in | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/configure.in b/configure.in
-index 3d04f4c..6032f67 100644
---- a/configure.in
-+++ b/configure.in
-@@ -1433,6 +1433,9 @@ case "$use_libxml2" in
- 		if test -f "$use_libxml2/bin/xml2-config" ; then
- 			libxml2_libs=`$use_libxml2/bin/xml2-config --libs`
- 			libxml2_cflags=`$use_libxml2/bin/xml2-config --cflags`
-+		elif test -f "$use_libxml2/$base_libdir/pkgconfig/libxml-2.0.pc" ; then
-+			libxml2_libs=`pkg-config libxml-2.0 --libs`
-+			libxml2_cflags=`pkg-config libxml-2.0 --cflags`
- 		fi
- 		;;
- esac
--- 
-1.9.1
-
diff --git a/meta/recipes-connectivity/bind/bind_9.10.2.bb b/meta/recipes-connectivity/bind/bind_9.10.2.bb
index 21be397..c5bc242 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.2.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.2.bb
@@ -16,9 +16,9 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://named.service \
            file://bind9 \
            file://init.d-add-support-for-read-only-rootfs.patch \
-           file://bind-add-crosscripts-search-path-for-xml2-config.patch \
            file://bind-confgen-build-unix.o-once.patch \
-	   "
+           file://0001-build-use-pkg-config-to-find-libxml2.patch \
+           "
 
 SRC_URI[md5sum] = "dca7a9967947bffa98547fca6130fc04"
 SRC_URI[sha256sum] = "6f9bb7908aa45c1edfa391e356fc0afc1ded175386cdefb6cf9e1289f7457a98"
@@ -34,8 +34,7 @@ EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
 inherit autotools-brokensep update-rc.d systemd useradd pkgconfig
 
 PACKAGECONFIG ?= "libxml2"
-
-PACKAGECONFIG[libxml2] = "--with-libxml2=${STAGING_LIBDIR}/..,--with-libxml2=no,libxml2"
+PACKAGECONFIG[libxml2] = "--with-libxml2,--without-libxml2,libxml2"
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --home /var/cache/bind --no-create-home \
-- 
2.1.4


