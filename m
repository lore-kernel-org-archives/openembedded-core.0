Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.12328.1591799784006284579
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2020 07:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oP6gBrG2;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id x6so2517774wrm.13
        for <Openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2020 07:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wGZxh9hbz7THEHH+djWQ6NcN5NxljyYR2ofm0lOMXcs=;
        b=oP6gBrG2tRl7N3ynIP7wmJQImfgXGkjbMpnpnOK+w1j+GmSlVVPPvCoZNz7yz92HMn
         BkCRkNyI7w7/A5eel/c2uNdT0RHFrtaZkoSQGgzRml+3i70s1XU3wp22/Xhi1E74ykyd
         PVTweI6EJ/WJdKbxDuwU4V/sWaV8xF25ojDTyHSmiFxi69G34wim6KqQmcgOHUoB7I53
         wZx2Be1uynLZZIJ+dpaIp9D3afQIK7QzfKegMz5vjBVAXaBVW/NZUNddjw1MQuWOBYZH
         kpY1SMQfaXmZZWuqBdYhFrZHaNtJM8CJNNGlCc5tB5bjO/LEpf7nj//rGJyWMCyW1IYv
         x/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wGZxh9hbz7THEHH+djWQ6NcN5NxljyYR2ofm0lOMXcs=;
        b=pFCEsQQqKsuYZXuNib/zr3jIT6hc/JJJfh4o9FJu3yxn1539O9Kk+DSdhUGst+KeKd
         wI9gtMGTQOfYMZCao45NnKG3q28g+MPFdw/PHrDMVsJFfaqnjwTVmyf72xz5BR6limJo
         nHBBfoxrxFbYilEwIdGcVnDdNAUGknIA8wl6GN0huwj5Cfhw8SnnHqys6R5ZwjU8cUI0
         ++/1eSIBZY83mGXdBFour1JB8fHW9rL31mvDs2/rjNwxTvArMBkVZhmla2LT0L3b62/W
         pgbQVQg5qw86G/5LfY96uRIsWVK3ktAf4/por38zxmLlbvY/k0mKnd7Nk2FIo3E6ojwL
         HB3Q==
X-Gm-Message-State: AOAM532OfsNP6js6glSrxmh6eizeby1+mO2oq8mjFs3dTh/0MyqZdJc/
	U8HblW3tPYG5nnYK70DLoRHMOachs7aK4zMa
X-Google-Smtp-Source: ABdhPJz98wSDkBuH1/Wtk7cqlMH9ZQMCAmkdiwf67eX3a+Ln+7WXtMORfh3N0tWfYybdPIgQWvlKpg==
X-Received: by 2002:adf:e2ce:: with SMTP id d14mr4129689wrj.415.1591799782155;
        Wed, 10 Jun 2020 07:36:22 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from localhost.localdomain (dslb-002-205-007-033.002.205.pools.vodafone-ip.de. [2.205.7.33])
        by smtp.gmail.com with ESMTPSA id l17sm11973wrq.17.2020.06.10.07.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 07:36:21 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: tmark@isc.org,
	Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [PATCH] dhcp: use included bind version
Date: Wed, 10 Jun 2020 16:35:20 +0200
Message-Id: <20200610143520.2727827-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

ISC DHCP should link against BIND9 libraries, which are tailored
specifically for DHCP. BIND9 package in Yocto core layer has different
configuraiton, in particular it has threads and epoll enabled.

ISC DHCP isn't a multi-threaded application, running it with bind9
libraries compiled in with threading enabled is not something ISC can
vouch for.

BIND9 libraries support a lot of options specifically geared towards
optimizing DNS operations, many of which do not play nicely with
ISC DHCP's "architecture".  It isn't necessarily practical to build
those libraries for both purposes.

If threading is enabled, then DHCP sporadically fails/crashes with
messages like:

lib/isc/unix/socket.c:1054: epoll_ctl(DEL), 6: Bad file descriptor
lib/isc/unix/socket.c:3332: INSIST(!sock->pending_send) failed.

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc       |  6 ++---
 .../0014-Use-static-version-of-libbind.patch  | 23 +++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb  |  1 +
 3 files changed, 27 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0014-Use-static-version-of-libbind.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index d46130d49b..466cdf921a 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -10,7 +10,7 @@ HOMEPAGE = "http://www.isc.org/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;md5=004a4db50a1e20972e924a8618747c01"
 
-DEPENDS = "openssl bind"
+DEPENDS = "openssl zlib"
 
 SRC_URI = "http://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
            file://init-relay file://default-relay \
@@ -50,9 +50,9 @@ EXTRA_OECONF = "--with-srv-lease-file=${localstatedir}/lib/dhcp/dhcpd.leases \
                 --with-cli6-lease-file=${localstatedir}/lib/dhcp/dhclient6.leases \
                 --enable-paranoia --disable-static \
                 --with-randomdev=/dev/random \
-                --with-libbind=${STAGING_DIR_HOST} \
-		--enable-libtool \
+                --enable-libtool \
                "
+PARALLEL_MAKE = ""
 
 #Enable shared libs per dhcp README
 do_configure_prepend () {
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0014-Use-static-version-of-libbind.patch b/meta/recipes-connectivity/dhcp/dhcp/0014-Use-static-version-of-libbind.patch
new file mode 100644
index 0000000000..63c74b25a5
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/0014-Use-static-version-of-libbind.patch
@@ -0,0 +1,23 @@
+From a96f65117d63bea4287f19e80595f7aab282410a Mon Sep 17 00:00:00 2001
+From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
+Date: Wed, 10 Jun 2020 07:56:20 +0200
+Subject: [PATCH] Use static version of libbind
+
+Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
+---
+ bind/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bind/Makefile.in b/bind/Makefile.in
+index 8fe8883..902fc3d 100644
+--- a/bind/Makefile.in
++++ b/bind/Makefile.in
+@@ -22,7 +22,7 @@ prefix = @prefix@
+ exec_prefix = @exec_prefix@
+ 
+ bindconfig = --without-openssl --without-libxml2 --without-libjson \
+-	--without-gssapi --disable-threads --without-lmdb \
++	--without-gssapi --disable-threads --without-lmdb --disable-shared \
+ 	--includedir=@includedir@ --libdir=@libdir@  --without-python\
+ 	@BINDLT@ @BINDIOMUX@ @BINDCONFIG@ --enable-full-report
+ 
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb b/meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb
index b56a204821..a322794e60 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.pat
             file://0012-dhcp-correct-the-intention-for-xml2-lib-search.patch \
             file://0013-fixup_use_libbind.patch \
             file://0001-workaround-busybox-limitation-in-linux-dhclient-script.patch \
+            file://0014-Use-static-version-of-libbind.patch \
 "
 
 SRC_URI[md5sum] = "2afdaf8498dc1edaf3012efdd589b3e1"
-- 
2.25.1

