Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web12.15688.1598973763573626818
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 08:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eeTM+9im;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id k15so956146pfc.12
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 08:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=BS9gHkRmH7zFVkgPSjGFQESwQUX6aI272mtZWbdLEj4=;
        b=eeTM+9imUR50wjS5gYE/f9EbEn/Rto5TzyVfqeYh8ylpiR8RKOfOYjLCVMLDo8/5Dy
         aA7liDOoI5Go6Q+8bZeX3rkZmvAy2Pvwc2zEgcR8MROSnD+7lrzOHxPGSeBRUmzP1qNf
         TERopbhrp6YJ9Rs7aMpwHNEgDB5H9UX/NT7B3VHftDgCo9U8RYv2ISQixA35pwo6kAAY
         2vjklkINeOw5wiHrw+rS5SefFWRcOrsOAZIa5SvubwnzVK+qJ24PodyOsqTGZlLliiZR
         /yBPjqToBy5hAJOMaRvjC5pK6DVvCWWaZPfUs+C5wwAERNM/rh4nTMBHE+s1Y80qTykA
         ju2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=BS9gHkRmH7zFVkgPSjGFQESwQUX6aI272mtZWbdLEj4=;
        b=p8DAjVY3U1TuaNW46EvUnhH1fMbFUmZhB8r+9va4fb4UxX+X5w8+sJSbO9sVGOFmqF
         wXalsjOBDSpXAdHn+7vJ4Yjm2ReDWOb9+pWDlXAy5gkUjkKEwxMz9KJ4QSho2sVZrMOB
         wieChcZlWg6vFJpaZyUCB5GzX6rP6pge6sCks0IR2RX066EcIpZpiFj9rdpGC3aHMKSE
         uOILPTnUAES7hjtZaXQ9NvpSSHMtQomEKu82MsWL0EMMBHJZta6HOFa2YGBTDTSmyzLc
         oggKE7MjQjAxHxrRJ0H/EAI+UArIRGiXx20BAjgQbqMEpVGBXbFt8JKGn7Timek+BDeo
         3M/A==
X-Gm-Message-State: AOAM531z5sGqTDxCFC9MctBDs2sr1X+QF1FloiP5CD24PidfMUO2JVqE
	ij1NDZDvAq06LxYxGOE+8jGbJ/KhoEM=
X-Google-Smtp-Source: ABdhPJyO+w8OrPM56G9yq3OProfahK68zMiaLVqt2Eew13uyuVW95Z8LJlWv9ZGRjUWVMmT5XmXvMg==
X-Received: by 2002:a05:6a00:148b:: with SMTP id v11mr2280141pfu.88.1598973762607;
        Tue, 01 Sep 2020 08:22:42 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9dcf:ebf9:1f19:e8a8])
        by smtp.gmail.com with ESMTPSA id u5sm2217917pfm.149.2020.09.01.08.22.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 08:22:41 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] dhcpd: move from meta-network need a client
Date: Tue,  1 Sep 2020 08:22:32 -0700
Message-Id: <20200901152236.9377-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901152236.9377-1-akuster808@gmail.com>
References: <20200901152236.9377-1-akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../dhcpcd/dhcpcd_9.1.4.bb                    | 28 ++++++++++++
 ...e-INCLUDEDIR-to-prevent-build-issues.patch | 45 +++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb
new file mode 100644
index 00000000000..defd3420f02
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb
@@ -0,0 +1,28 @@
+SECTION = "console/network"
+SUMMARY = "dhcpcd - a DHCP client"
+DESCRIPTION = "dhcpcd runs on your machine and silently configures your \
+               computer to work on the attached networks without trouble \
+               and mostly without configuration."
+
+HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9674cc803c5d71306941e6e8b5c002f2"
+
+UPSTREAM_CHECK_URI = "https://roy.marples.name/downloads/dhcpcd/"
+
+SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
+           file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch"
+
+SRC_URI[sha256sum] = "5fe133e5497d8af6d26bd6e6b8dd48ab12d124d6cc4cefe6de6536ff97f76820"
+
+inherit pkgconfig autotools-brokensep
+
+PACKAGECONFIG ?= "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
+
+PACKAGECONFIG[udev] = "--with-udev,--without-udev,udev,udev"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
+
+EXTRA_OECONF = "--enable-ipv4"
+
+FILES_${PN}-dbg += "${libdir}/dhcpcd/dev/.debug"
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
new file mode 100644
index 00000000000..37d2344438a
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
@@ -0,0 +1,45 @@
+From aa9e3982c1e75ad49945a62f5e262279c7a905a4 Mon Sep 17 00:00:00 2001
+From: Stefano Cappa <stefano.cappa.ks89@gmail.com>
+Date: Sun, 13 Jan 2019 01:50:52 +0100
+Subject: [PATCH] remove INCLUDEDIR to prevent build issues
+
+Upstream-Status: Pending
+
+Signed-off-by: Stefano Cappa <stefano.cappa.ks89@gmail.com>
+---
+ configure | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/configure b/configure
+index 6c81e0db..32dea2b4 100755
+--- a/configure
++++ b/configure
+@@ -20,7 +20,6 @@ BUILD=
+ HOST=
+ HOSTCC=
+ TARGET=
+-INCLUDEDIR=
+ DEBUG=
+ FORK=
+ STATIC=
+@@ -72,7 +71,6 @@ for x do
+ 	--mandir) MANDIR=$var;;
+ 	--datadir) DATADIR=$var;;
+ 	--with-ccopts|CFLAGS) CFLAGS=$var;;
+-	-I|--includedir) INCLUDEDIR="$INCLUDEDIR${INCLUDEDIR:+ }-I$var";;
+ 	CC) CC=$var;;
+ 	CPPFLAGS) CPPFLAGS=$var;;
+ 	PKG_CONFIG) PKG_CONFIG=$var;;
+@@ -309,9 +307,6 @@ if [ -n "$CPPFLAGS" ]; then
+ 	echo "CPPFLAGS=" >>$CONFIG_MK
+ 	echo "CPPFLAGS+=	$CPPFLAGS" >>$CONFIG_MK
+ fi
+-if [ -n "$INCLUDEDIR" ]; then
+-	echo "CPPFLAGS+=	$INCLUDEDIR" >>$CONFIG_MK
+-fi
+ if [ -n "$LDFLAGS" ]; then
+ 	echo "LDFLAGS=" >>$CONFIG_MK
+ 	echo "LDFLAGS+=	$LDFLAGS" >>$CONFIG_MK
+-- 
+2.17.2 (Apple Git-113)
+
-- 
2.17.1

