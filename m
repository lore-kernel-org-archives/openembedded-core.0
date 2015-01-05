Return-Path: <joe@deserted.net>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 12E07727B0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 20:21:57 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id at20so20394804iec.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jan 2015 12:21:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=mxW6kZu0KdCg1ffCFFlc52oc2F4syBEJEnLiJSBUDOA=;
	b=C4MOwGDdXNE3JfCUNbQgcb1F3V3O45bao638YpRu3wJtcv+qcUKkdVTdIX21MWmI2f
	V/M0ft8jMsED9sc2gmEUWdfoz3XhAIqG0pC2jsCg0qABAFZsGN/Ro4aGCmHopt2v0UUI
	80Mg3CZJ/hV78EGIQ1SgwrboIio9TNUlzG2a5QfmU4LRJOpk5izCkFDxapWfYtw8Htn4
	lNazI34F26oQRCOCLromHQdh0cpXiQyC8y1SnC420THrt5AZTnfVh6w4BbBZIuFnnOfn
	Q5wB117fmB+OfVYOGnT9vEXJT0QzF4wZLHnMTIsOB5lrTMhdaL+nz6lJbEC+Mfi33eYf
	yYwA==
X-Gm-Message-State: ALoCoQlPxNl62TmU6W7fKfsoFbVTXG2bRGaGD0Kc3kjY6B1FA/rsDlGB2AY2cONIyAjpDV4ZTFRJ
X-Received: by 10.42.68.203 with SMTP id y11mr67786744ici.62.1420489316506;
	Mon, 05 Jan 2015 12:21:56 -0800 (PST)
Received: from mir.deserted.net (24-246-4-250.cable.teksavvy.com.
	[24.246.4.250]) by mx.google.com with ESMTPSA id
	e63sm27060994ioe.15.2015.01.05.12.21.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Jan 2015 12:21:55 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Jan 2015 15:22:18 -0500
Message-Id: <1420489338-6024-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH v2] openl2tp: add new recipe
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
X-List-Received-Date: Mon, 05 Jan 2015 20:22:01 -0000

From: Li xin <lixin.fnst@cn.fujitsu.com>

OpenL2TP is an open source L2TP client / server, written specifically
for Linux. It has been designed for use as an enterprise L2TP VPN server
or in commercial, Linux-based, embedded networking products and is able
to support hundreds of sessions, each with different configuration.
It is used by several ISPs to provide L2TP services and by corporations
to implement L2TP VPNs.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---

Martin:

   This is basically just a minor clean-up of the earlier openl2tp recipe.  So
   far I've been unable to reproduce the error reported in the world build.  If
   there's still a log kicking around from that failure, I'd love to get a look
   at it, I'm also doing a world build locally to try this out, but it still
   looks like it should be okay now.  If it fails for you again before I get
   some kind of results, can you point me at the log?

   -J.

 ...kefile-modify-CFLAGS-to-aviod-build-error.patch | 106 +++++++++++++++++++++
 .../recipes-protocols/openl2tp/openl2tp_1.8.bb     |  32 +++++++
 2 files changed, 138 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/Makefile-modify-CFLAGS-to-aviod-build-error.patch
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/Makefile-modify-CFLAGS-to-aviod-build-error.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/Makefile-modify-CFLAGS-to-aviod-build-error.patch
new file mode 100644
index 0000000..96dbc75
--- /dev/null
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/Makefile-modify-CFLAGS-to-aviod-build-error.patch
@@ -0,0 +1,106 @@
+From 152486fa3c36c3b99d17d5b553cf87ef412fae8e Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Mon, 1 Dec 2014 01:53:41 +0900
+Subject: [PATCH] Makefile:modify CFLAGS to aviod build error.
+
+Upstream-Status: pending
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ Makefile         | 22 +++++++++++-----------
+ plugins/Makefile |  6 +++---
+ 2 files changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 4aaa448..baa7882 100644
+--- a/Makefile
++++ b/Makefile
+@@ -152,10 +152,10 @@ LIBS.dmalloc=		-ldmalloc
+ export USE_DMALLOC
+ endif
+ 
+-CPPFLAGS=		$(CPPFLAGS.l2tptest) $(CPPFLAGS-y)
+-CFLAGS=			-I. -Iusl -Icli -isystem include \
+-				-MMD -Wall -Werror -Wno-strict-aliasing \
+-				$(CPPFLAGS) $(CPPFLAGS.dmalloc) \
++ADD_CPPFLAGS=		$(CPPFLAGS.l2tptest) $(CPPFLAGS-y)
++ADD_CFLAGS=			-I. -Iusl -Icli -isystem include \
++				-MMD -Wall -Wno-strict-aliasing \
++				$(ADD_CPPFLAGS) $(CPPFLAGS.dmalloc) \
+ 				-DSYS_LIBDIR=$(SYS_LIBDIR)
+ LDFLAGS.l2tpd=		-Wl,-E -L. -Lusl -lusl -ldl $(LIBS.dmalloc) -lc
+ LDFLAGS.l2tpconfig=	-Lcli -lcli -lreadline $(LIBS.dmalloc) $(READLINE_LDFLAGS) -lc
+@@ -170,10 +170,10 @@ CFLAGS.optimize=	$(OPT_CFLAGS)
+ endif
+ export CFLAGS.optimize
+ 
+-CFLAGS+=		$(CFLAGS.optimize)
++ADD_CFLAGS+=		$(CFLAGS.optimize)
+ 
+ ifeq ($(L2TP_USE_ASYNC_RPC),y)
+-CPPFLAGS+=		-DL2TP_ASYNC_RPC
++ADD_CPPFLAGS+=		-DL2TP_ASYNC_RPC
+ endif
+ 
+ ifeq ($(L2TP_FEATURE_RPC_MANAGEMENT),y)
+@@ -220,13 +220,13 @@ endif
+ 
+ # Compile without -Wall because rpcgen-generated code is full of warnings.
+ %_xdr.o:		%_xdr.c
+-			$(CC) -I. -MMD -w $(CFLAGS.optimize) -c $(CPPFLAGS) $<
++			$(CC) -I. -MMD -w $(CFLAGS.optimize) -c $(ADD_CPPFLAGS) $<
+ 
+ %_client.o:		%_client.c
+-			$(CC) -I. -MMD -w $(CFLAGS.optimize) -c $(CPPFLAGS) $<
++			$(CC) -I. -MMD -w $(CFLAGS.optimize) -c $(ADD_CPPFLAGS) $<
+ 
+ %_server.o:		%_server.c
+-			$(CC) -I. -MMD -w $(CFLAGS.optimize) -c $(CPPFLAGS) $<
++			$(CC) -I. -MMD -w $(CFLAGS.optimize) -c $(ADD_CPPFLAGS) $<
+ 
+ %_xdr.c:		%.x
+ 			-$(RM) $@
+@@ -272,7 +272,7 @@ l2tpconfig:		$(L2TPCONFIG_SRCS.o)
+ 			$(CC) -o $@ $^ $(LDFLAGS.l2tpconfig)
+ 
+ %.o:	%.c
+-			$(CC) -c $(CFLAGS) $< -o $@
++			$(CC) -c $(CFLAGS) $(ADD_CFLAGS) $< -o $@
+ 
+ l2tp_options.h:	FORCE
+ 	@rm -f $@.tmp
+@@ -325,7 +325,7 @@ install:		install-all
+ install-all:		all install-daemon install-app
+ 
+ install-daemon:
+-			@for d in $(filter-out usl,$(SUBDIRS)); do $(MAKE) -C $$d $(MFLAGS) EXTRA_CFLAGS="$(CPPFLAGS)" install; if [ $$? -ne 0 ]; then exit 1; fi; done
++			@for d in $(filter-out usl,$(SUBDIRS)); do $(MAKE) -C $$d $(MFLAGS) EXTRA_CFLAGS="$(CPPFLAGS) $(ADD_CPPFLAGS)" install; if [ $$? -ne 0 ]; then exit 1; fi; done
+ 			$(INSTALL) -d $(DESTDIR)/usr/sbin
+ 			$(INSTALL) openl2tpd $(DESTDIR)/usr/sbin
+ 
+diff --git a/plugins/Makefile b/plugins/Makefile
+index 5be996d..6810236 100644
+--- a/plugins/Makefile
++++ b/plugins/Makefile
+@@ -1,7 +1,7 @@
+-CFLAGS	:= $(CFLAGS.optimize) -MMD -Wall \
++ADD_CFLAGS	:= $(CFLAGS.optimize) -MMD -Wall \
+ 	-isystem ../include \
+ 	-I. -I.. -I../usl -fPIC $(EXTRA_CFLAGS)
+-LDFLAGS	:= -shared
++ADD_LDFLAGS	:= -shared
+ 
+ PLUGINS.c:=	ppp_unix.c ppp_null.c ipsec.c event_sock.c
+ 
+@@ -21,7 +21,7 @@ clean:
+ 		$(RM) $(PLUGINS.so) $(wildcard *.o) $(wildcard *.d) $(SRC.generated)
+ 
+ %.so: %.c
+-		$(CC) -o $@ $(LDFLAGS) $(CFLAGS) $<
++		$(CC) -o $@ $(LDFLAGS) $(ADD_LDFLAGS) $(CFLAGS) $(ADD_CFLAGS) $<
+ 
+ install:	all
+ 		$(INSTALL) -d $(DESTDIR)$(SYS_LIBDIR)/openl2tp
+-- 
+1.8.4.2
+
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
new file mode 100644
index 0000000..77f19ed
--- /dev/null
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -0,0 +1,32 @@
+SUMMARY = "An L2TP client/server, designed for VPN use."
+DESCRIPTION = "OpenL2TP is an open source L2TP client / server, written \
+specifically for Linux. It has been designed for use as an enterprise \
+L2TP VPN server or in commercial, Linux-based, embedded networking \
+products and is able to support hundreds of sessions, each with \
+different configuration. It is used by several ISPs to provide \
+L2TP services and by corporations to implement L2TP VPNs."
+HOMEPAGE = "http://www.openl2tp.org/"
+SECTION = "console/network"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e9d9259cbbf00945adc25a470c1d3585"
+DEPENDS = "popt flex readline"
+
+SRC_URI = "http://ftp.jaist.ac.jp/pub/sourceforge/o/op/${PN}/${PN}/${PV}/${BP}.tar.gz \
+           file://Makefile-modify-CFLAGS-to-aviod-build-error.patch"
+SRC_URI[md5sum] = "e3d08dedfb9e6a9a1e24f6766f6dadd0"
+SRC_URI[sha256sum] = "1c97704d4b963a87fbc0e741668d4530933991515ae9ab0dffd11b5444f4860f"
+
+inherit autotools-brokensep pkgconfig
+EXTRA_OEMAKE = 'CFLAGS="${CFLAGS} -Wno-nused-but-set-variable"'
+
+do_compile_prepend() {
+    sed -i -e "s:SYS_LIBDIR=.*:SYS_LIBDIR=${libdir}:g" \
+        -e 's:$(CROSS_COMPILE)as:${AS}:g' \
+        -e 's:$(CROSS_COMPILE)ld:${LD}:g' \
+        -e 's:$(CROSS_COMPILE)gcc:${CC}:g' \
+        -e 's:$(CROSS_COMPILE)ar:${AR}:g' \
+        -e 's:$(CROSS_COMPILE)nm:${NM}:g' \
+        -e 's:$(CROSS_COMPILE)strip:${STRIP}:g' \
+        -e 's:$(CROSS_COMPILE)install:install:g' \
+        ${S}/Makefile
+}
-- 
1.9.1


