Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by mx.groups.io with SMTP id smtpd.web09.4413.1626182541347720352
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jul 2021 06:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@phytec.de header.s=a4 header.b=JIaoqkl7;
 spf=pass (domain: phytec.de, ip: 195.145.39.210, mailfrom: w.egorov@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1626182539; x=1628774539;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=POy1D8a5f4h+Axxjzv8HJ2BImb7omfw3saxY8NLU/8Y=;
	b=JIaoqkl7o6qzDKjQIJTCqvYRwCXlFD1C42olYjwJNQGQHFoPtCSZ/Zb7MxFU/jEm
	O8I8GVzoZmsSfqflvAGbr6j6RM57O8pNIWv7sLGuTsjkCqBcIQ6opJoLeYkX6hr6
	K6Wtm5uIwyiXH2cKGgycT9fSddyHn1CpnxbOTXi5d4o=;
X-AuditID: c39127d2-1e4f970000001daf-e1-60ed938a2fee
Received: from berlix.phytec.de (Berlix.phytec.de [172.16.0.117])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 08.FC.07599.A839DE06; Tue, 13 Jul 2021 15:22:18 +0200 (CEST)
Received: from augenblix2.phytec.de (172.16.0.116) by Berlix.phytec.de
 (172.16.0.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 13 Jul
 2021 15:22:18 +0200
From: "Wadim Egorov" <w.egorov@phytec.de>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] xserver-xorg: Fix builds without glx
Date: Tue, 13 Jul 2021 15:22:10 +0200
Message-ID: <20210713132210.2512813-1-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Return-Path: w.egorov@phytec.de
X-Originating-IP: [172.16.0.116]
X-ClientProxiedBy: Berlix.phytec.de (172.16.0.117) To Berlix.phytec.de
 (172.16.0.117)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmluLIzCtJLcpLzFFi42JZI8BQqts1+W2CwaUnNhZ3fr5jd2D0OLdx
	BWMAYxSXTUpqTmZZapG+XQJXxp376xgLbktUvD03k6mB8YRoFyMnh4SAicTXP60sXYxcHEIC
	y5kkJj09wQSSEBJ4yiix9Uo1iM0moC5xZ8M31i5GDg4RAT2Jq//AeoUFHCTuPHvNDGKzCKhK
	7Nj9iRmkhFfAUmLeWyOI8fISMy99ZwexeQUEJU7OfMICYjMDxZu3zmaGsCUkDr54wQyxVV7i
	xaXlLBC9ChJzf09khrDDJd6e+s08gZF/FpJRs5CMmoVk1AJG5lWMQrmZydmpRZnZegUZlSWp
	yXopqZsYgQF2eKL6pR2MfXM8DjEycTAeYpTgYFYS4V1q9DZBiDclsbIqtSg/vqg0J7X4EKM0
	B4uSOO8G3pIwIYH0xJLU7NTUgtQimCwTB6dUAyPj3sv7Z2Qm12qeqPi0OepqMpNu+L0TC2wy
	Yj8Vab89cHTGhYUbqldOndia0X3r0vw9mtMOs2586id3T6xCIdt99kaDg7UtHSffbX5w5VHy
	fK8Fgq9TNss+jFi4cybzWcbDn39P8aos4F2uqiJfep/7Q29IGvupHRMKflYbvTCftDCCkZPv
	5rUNSizFGYmGWsxFxYkAAi6REx4CAAA=
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 ...nd-Makefile.am-fix-build-without-glx.patch | 46 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.10.bb      |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-hw-xwayland-Makefile.am-fix-build-without-glx.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-hw-xwayland-Makefile.am-fix-build-without-glx.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-hw-xwayland-Makefile.am-fix-build-without-glx.patch
new file mode 100644
index 0000000000..dee8479396
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-hw-xwayland-Makefile.am-fix-build-without-glx.patch
@@ -0,0 +1,46 @@
+From 836f93de99b35050d78d61d3654f7c5655184144 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 19 Apr 2019 10:19:50 +0200
+Subject: [PATCH] hw/xwayland/Makefile.am: fix build without glx
+
+Commit d8ec33fe0542141aed1d9016d2ecaf52da944b4b added libglxvnd.la to
+Xwayland_LDFLAGS but GLX can be disabled through --disable-glx.
+In this case, build fails on:
+
+make[3]: *** No rule to make target '../../glx/libglxvnd.la', needed by 'Xwayland'.  Stop.
+make[3]: *** Waiting for unfinished jobs....
+
+Fixes:
+ - http://autobuild.buildroot.org/results/397f8098c57fc6c88aa12dc8d35ebb1b933d52ef
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+Upstream-Status: Accepted [https://gitlab.freedesktop.org/xorg/xserver/-/commit/836f93de99b35050d78d61d3654f7c5655184144]
+Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
+---
+ hw/xwayland/Makefile.am | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/hw/xwayland/Makefile.am b/hw/xwayland/Makefile.am
+index bc1cb8506..502879e2a 100644
+--- a/hw/xwayland/Makefile.am
++++ b/hw/xwayland/Makefile.am
+@@ -21,10 +21,14 @@ Xwayland_SOURCES =				\
+ 	$(top_srcdir)/Xi/stubs.c		\
+ 	$(top_srcdir)/mi/miinitext.c
+ 
++if GLX
++GLXVND_LIB = $(top_builddir)/glx/libglxvnd.la
++endif
++
+ Xwayland_LDADD =				\
+ 	$(glamor_lib)				\
+ 	$(XWAYLAND_LIBS)			\
+-	$(top_builddir)/glx/libglxvnd.la	\
++	$(GLXVND_LIB)				\
+ 	$(XWAYLAND_SYS_LIBS)			\
+ 	$(top_builddir)/Xext/libXvidmode.la	\
+ 	$(XSERVER_SYS_LIBS)
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
index 755a762a73..e0551fa999 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            file://0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch \
            file://CVE-2021-3472.patch \
+           file://0001-hw-xwayland-Makefile.am-fix-build-without-glx.patch \
            "
 SRC_URI[sha256sum] = "977420c082450dc808de301ef56af4856d653eea71519a973c3490a780cb7c99"
 
-- 
2.25.1

