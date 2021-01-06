Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.8973.1609944663801327660
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 06:51:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dCs5NAMc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id c133so2643356wme.4
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Jan 2021 06:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BIXhQLgdOk9xcOt/iFapccwnzS/9zE4RR8LDNclCwvk=;
        b=dCs5NAMccmdg0okvwaGgRe1bZCu21nbcqqFh0CUh83yMxbnX4HvAYwYzGUMT0f6HXa
         PeHTQfqIE4W0jZoObihxJm7ivrWf4sG22bNQvUaGUNj59Ls8Qb4TEpHFv5CRH7gO19Xc
         eXnW9BY4zI+7GmYiEJMlx6TemTze8xJm++hz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BIXhQLgdOk9xcOt/iFapccwnzS/9zE4RR8LDNclCwvk=;
        b=NILphLJ6/RWW3M51dfhk590421aKkKXPhx+KWXBhiXhJsJo2fqLS4o6YScYmBkO3B9
         TfeOcnjuG+k1uoeyfWZJwbOTWLbTHdI860IG2ZRqkNScnSdi5xcwSeXw3o/nObqbb3M/
         CWCqC7v5jmrGUWktIiMgr5mdWxDEPxpvLDXuxmqTdtkVkQyUF03MR9dxrTBaYMxj/Ov2
         iE0eOyfWajpj+sg/YtzKC5leRCBHTgvKKnxahE8U2a79zA34/zHIkGUvhT2755sZAwcg
         z1RDOPZ+124ASqp5l0gHQ72BsJmmrT3WXIAN1zsNvcPzij+9Y3ru3/BppgSFLZkIcVzm
         dEyA==
X-Gm-Message-State: AOAM532aVrl1ip3xnhYv5kIqyzVTIqdZt0SCTCiWfhMzeFqFr37E67Rr
	imuVap0JfSz74JBXZUD21TdNfrpvSjfRBg==
X-Google-Smtp-Source: ABdhPJwQ0rMDH6Rhat1h1En9gco3+6Jj/bFzDD7qrVOIfKqi8c6/RPvUkxq7jSewzTDvVUHNOZ7ZYg==
X-Received: by 2002:a1c:98c7:: with SMTP id a190mr4043983wme.184.1609944661602;
        Wed, 06 Jan 2021 06:51:01 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f056:12a7:edca:60f8])
        by smtp.gmail.com with ESMTPSA id t188sm3218425wmf.9.2021.01.06.06.51.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 06:51:01 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] ppp: Update 2.4.8 -> 2.4.9
Date: Wed,  6 Jan 2021 14:50:59 +0000
Message-Id: <20210106145059.550500-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210106145059.550500-1-richard.purdie@linuxfoundation.org>
References: <20210106145059.550500-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the first ppp release in a long time. Many patches
were resolved upstream:

* musl fixes were merged
* EAP patch was a backport added upstream
* cflags were fixed upstream
* CVE fix was merged upstream and a backport
* pcap header from the host was fixed upstream
* suid bits during install was removed upstream

The only patch left was the /var/ redirect for resolv.conf which no longer
applied cleanly after upstream changes. For this on the patch will
need to be rewritten (and preferably submitted upstream) by someone
who needs/uses it. It was presumbaly for RO rootfs and may be resolved
by symlinks in modern system usage anyway.

Tweak the files pulled into the pppoe package for a compatibility
symlink and module rename.

Add CC to the OEMAKE command to allow builds correctly.

[Big thanks to Alex Kanavin for a lot of the work with upstream and
pre-release testing of this]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ppp/ppp/0001-Fix-build-with-musl.patch    | 124 ------------------
 .../0001-ppp-Remove-unneeded-include.patch    |  43 ------
 ...01-pppd-Fix-bounds-check-in-EAP-code.patch |  47 -------
 meta/recipes-connectivity/ppp/ppp/copts.patch |  21 ---
 .../ppp/ppp/fix-CVE-2015-3310.patch           |  30 -----
 .../makefile-remove-hard-usr-reference.patch  |  34 -----
 .../ppp/ppp/makefile.patch                    | 115 ----------------
 .../ppp/ppp/pppd-resolv-varrun.patch          |  45 -------
 .../ppp/{ppp_2.4.8.bb => ppp_2.4.9.bb}        |  20 +--
 9 files changed, 6 insertions(+), 473 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ppp/ppp/0001-Fix-build-with-musl.patch
 delete mode 100644 meta/recipes-connectivity/ppp/ppp/0001-ppp-Remove-unneeded-include.patch
 delete mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppd-Fix-bounds-check-in-EAP-code.patch
 delete mode 100644 meta/recipes-connectivity/ppp/ppp/copts.patch
 delete mode 100644 meta/recipes-connectivity/ppp/ppp/fix-CVE-2015-3310.patch
 delete mode 100644 meta/recipes-connectivity/ppp/ppp/makefile-remove-hard-usr-reference.patch
 delete mode 100644 meta/recipes-connectivity/ppp/ppp/makefile.patch
 delete mode 100644 meta/recipes-connectivity/ppp/ppp/pppd-resolv-varrun.patch
 rename meta/recipes-connectivity/ppp/{ppp_2.4.8.bb => ppp_2.4.9.bb} (85%)

diff --git a/meta/recipes-connectivity/ppp/ppp/0001-Fix-build-with-musl.patch b/meta/recipes-connectivity/ppp/ppp/0001-Fix-build-with-musl.patch
deleted file mode 100644
index 65291368bd6..00000000000
--- a/meta/recipes-connectivity/ppp/ppp/0001-Fix-build-with-musl.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-From e50cdaed07e51f2508f94eb1f34fe43776e4ca78 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 May 2015 14:57:05 -0700
-Subject: [PATCH] Fix build with musl
-
-There are several assumption about glibc
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
----
- include/net/ppp_defs.h                  | 2 ++
- pppd/Makefile.linux                     | 2 +-
- pppd/plugins/rp-pppoe/config.h          | 3 ++-
- pppd/plugins/rp-pppoe/plugin.c          | 1 -
- pppd/plugins/rp-pppoe/pppoe-discovery.c | 8 ++++----
- pppd/plugins/rp-pppoe/pppoe.h           | 2 +-
- pppd/sys-linux.c                        | 3 ++-
- 7 files changed, 12 insertions(+), 9 deletions(-)
-
-diff --git a/include/net/ppp_defs.h b/include/net/ppp_defs.h
-index b06eda5..dafa36c 100644
---- a/include/net/ppp_defs.h
-+++ b/include/net/ppp_defs.h
-@@ -38,6 +38,8 @@
- #ifndef _PPP_DEFS_H_
- #define _PPP_DEFS_H_
- 
-+#include <sys/time.h>
-+
- /*
-  * The basic PPP frame.
-  */
-diff --git a/pppd/Makefile.linux b/pppd/Makefile.linux
-index 4e485a1..76411bc 100644
---- a/pppd/Makefile.linux
-+++ b/pppd/Makefile.linux
-@@ -131,7 +131,7 @@ LIBS	+= -lcrypt
- endif
- 
- ifdef USE_LIBUTIL
--CFLAGS	+= -DHAVE_LOGWTMP=1
-+#CFLAGS	+= -DHAVE_LOGWTMP=1
- LIBS	+= -lutil
- endif
- 
-diff --git a/pppd/plugins/rp-pppoe/config.h b/pppd/plugins/rp-pppoe/config.h
-index a708859..4a16a88 100644
---- a/pppd/plugins/rp-pppoe/config.h
-+++ b/pppd/plugins/rp-pppoe/config.h
-@@ -78,8 +78,9 @@
- #define HAVE_NET_IF_ARP_H 1
- 
- /* Define if you have the <net/ethernet.h> header file.  */
-+#ifdef __GLIBC__
- #define HAVE_NET_ETHERNET_H 1
--
-+#endif
- /* Define if you have the <net/if.h> header file.  */
- #define HAVE_NET_IF_H 1
- 
-diff --git a/pppd/plugins/rp-pppoe/plugin.c b/pppd/plugins/rp-pppoe/plugin.c
-index 44e0c31..93c0906 100644
---- a/pppd/plugins/rp-pppoe/plugin.c
-+++ b/pppd/plugins/rp-pppoe/plugin.c
-@@ -46,7 +46,6 @@ static char const RCSID[] =
- #include <unistd.h>
- #include <fcntl.h>
- #include <signal.h>
--#include <net/ethernet.h>
- #include <net/if_arp.h>
- #include <linux/ppp_defs.h>
- #include <linux/if_pppox.h>
-diff --git a/pppd/plugins/rp-pppoe/pppoe-discovery.c b/pppd/plugins/rp-pppoe/pppoe-discovery.c
-index f19c6d8..f45df2c 100644
---- a/pppd/plugins/rp-pppoe/pppoe-discovery.c
-+++ b/pppd/plugins/rp-pppoe/pppoe-discovery.c
-@@ -29,10 +29,6 @@
- #include <linux/if_packet.h>
- #endif
- 
--#ifdef HAVE_NET_ETHERNET_H
--#include <net/ethernet.h>
--#endif
--
- #ifdef HAVE_ASM_TYPES_H
- #include <asm/types.h>
- #endif
-diff --git a/pppd/plugins/rp-pppoe/pppoe.h b/pppd/plugins/rp-pppoe/pppoe.h
-index a4e7d5c..de191c8 100644
---- a/pppd/plugins/rp-pppoe/pppoe.h
-+++ b/pppd/plugins/rp-pppoe/pppoe.h
-@@ -90,7 +90,7 @@ typedef unsigned long UINT32_t;
- #ifdef HAVE_SYS_SOCKET_H
- #include <sys/socket.h>
- #endif
--#ifndef HAVE_SYS_DLPI_H
-+#if !defined HAVE_SYS_DLPI_H && defined HAVE_NET_ETHERNET_H
- #include <netinet/if_ether.h>
- #endif
- #endif
-diff --git a/pppd/sys-linux.c b/pppd/sys-linux.c
-index a0531e9..84ee394 100644
---- a/pppd/sys-linux.c
-+++ b/pppd/sys-linux.c
-@@ -112,7 +112,7 @@
- #include <linux/types.h>
- #include <linux/if.h>
- #include <linux/if_arp.h>
--#include <linux/route.h>
-+/* #include <linux/route.h> */
- #include <linux/if_ether.h>
- #endif
- #include <netinet/in.h>
-@@ -145,6 +145,7 @@
- #endif
- 
- #ifdef INET6
-+#include <net/route.h>
- #ifndef _LINUX_IN6_H
- /*
-  *    This is in linux/include/net/ipv6.h.
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/ppp/ppp/0001-ppp-Remove-unneeded-include.patch b/meta/recipes-connectivity/ppp/ppp/0001-ppp-Remove-unneeded-include.patch
deleted file mode 100644
index a32f89fbc8c..00000000000
--- a/meta/recipes-connectivity/ppp/ppp/0001-ppp-Remove-unneeded-include.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-commit cd90fd147844a0cfec101f1e2db7a3c59d236621
-Author: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date:   Wed Dec 28 14:11:22 2016 +0200
-
-pppol2tp plugin: Remove unneeded include
-
-The include is not required and will break compile on musl libc with
-    
-| In file included from pppol2tp.c:34:0:
-| /usr/include/linux/if.h:97:2: error: expected identifier before numeric constant
-|   IFF_LOWER_UP   = 1<<16, /* __volatile__ */
-
-Patch originally from Khem Raj.
-
-Upstream-Status: Pending [https://github.com/paulusmack/ppp/issues/73]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
-diff --git a/pppd/plugins/pppol2tp/openl2tp.c b/pppd/plugins/pppol2tp/openl2tp.c
-index 9643b96..458316b 100644
---- a/pppd/plugins/pppol2tp/openl2tp.c
-+++ b/pppd/plugins/pppol2tp/openl2tp.c
-@@ -47,7 +47,6 @@
- #include <linux/if_ether.h>
- #include <linux/ppp_defs.h>
- #include <linux/if_ppp.h>
--#include <linux/if_pppox.h>
- #include <linux/if_pppol2tp.h>
- 
- #include "l2tp_event.h"
-diff --git a/pppd/plugins/pppol2tp/pppol2tp.c b/pppd/plugins/pppol2tp/pppol2tp.c
-index 0e28606..4f6d98c 100644
---- a/pppd/plugins/pppol2tp/pppol2tp.c
-+++ b/pppd/plugins/pppol2tp/pppol2tp.c
-@@ -46,7 +46,6 @@
- #include <linux/if_ether.h>
- #include <linux/ppp_defs.h>
- #include <linux/if_ppp.h>
--#include <linux/if_pppox.h>
- #include <linux/if_pppol2tp.h>
- 
- /* should be added to system's socket.h... */
----
-
diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppd-Fix-bounds-check-in-EAP-code.patch b/meta/recipes-connectivity/ppp/ppp/0001-pppd-Fix-bounds-check-in-EAP-code.patch
deleted file mode 100644
index b7ba7ba6431..00000000000
--- a/meta/recipes-connectivity/ppp/ppp/0001-pppd-Fix-bounds-check-in-EAP-code.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 8d7970b8f3db727fe798b65f3377fe6787575426 Mon Sep 17 00:00:00 2001
-From: Paul Mackerras <paulus@ozlabs.org>
-Date: Mon, 3 Feb 2020 15:53:28 +1100
-Subject: [PATCH] pppd: Fix bounds check in EAP code
-
-Given that we have just checked vallen < len, it can never be the case
-that vallen >= len + sizeof(rhostname).  This fixes the check so we
-actually avoid overflowing the rhostname array.
-
-Reported-by: Ilja Van Sprundel <ivansprundel@ioactive.com>
-Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
-
-Upstream-Status: Backport
-[https://github.com/paulusmack/ppp/commit/8d7970b8f3db727fe798b65f3377fe6787575426]
-
-CVE: CVE-2020-8597
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- pppd/eap.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/pppd/eap.c b/pppd/eap.c
-index 94407f5..1b93db0 100644
---- a/pppd/eap.c
-+++ b/pppd/eap.c
-@@ -1420,7 +1420,7 @@ int len;
- 		}
- 
- 		/* Not so likely to happen. */
--		if (vallen >= len + sizeof (rhostname)) {
-+		if (len - vallen >= sizeof (rhostname)) {
- 			dbglog("EAP: trimming really long peer name down");
- 			BCOPY(inp + vallen, rhostname, sizeof (rhostname) - 1);
- 			rhostname[sizeof (rhostname) - 1] = '\0';
-@@ -1846,7 +1846,7 @@ int len;
- 		}
- 
- 		/* Not so likely to happen. */
--		if (vallen >= len + sizeof (rhostname)) {
-+		if (len - vallen >= sizeof (rhostname)) {
- 			dbglog("EAP: trimming really long peer name down");
- 			BCOPY(inp + vallen, rhostname, sizeof (rhostname) - 1);
- 			rhostname[sizeof (rhostname) - 1] = '\0';
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/ppp/ppp/copts.patch b/meta/recipes-connectivity/ppp/ppp/copts.patch
deleted file mode 100644
index 53ff06e03ea..00000000000
--- a/meta/recipes-connectivity/ppp/ppp/copts.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-ppp: use build system CFLAGS when compiling
-
-Upstream-Status: Pending
-
-Override the hard-coded COPTS make variables with
-CFLAGS.  Add COPTS into one Makefile that did not
-use it.
-
-Signed-off-by: Joe Slater <jslater@windriver.com>
-
---- a/pppd/plugins/radius/Makefile.linux
-+++ b/pppd/plugins/radius/Makefile.linux
-@@ -12,7 +12,7 @@ VERSION = $(shell awk -F '"' '/VERSION/ 
- INSTALL	= install
- 
- PLUGIN=radius.so radattr.so radrealms.so
--CFLAGS=-I. -I../.. -I../../../include -O2 -fPIC -DRC_LOG_FACILITY=LOG_DAEMON
-+CFLAGS=-I. -I../.. -I../../../include $(COPTS) -fPIC -DRC_LOG_FACILITY=LOG_DAEMON
- 
- # Uncomment the next line to include support for Microsoft's
- # MS-CHAP authentication protocol.
diff --git a/meta/recipes-connectivity/ppp/ppp/fix-CVE-2015-3310.patch b/meta/recipes-connectivity/ppp/ppp/fix-CVE-2015-3310.patch
deleted file mode 100644
index c5a0be86f5c..00000000000
--- a/meta/recipes-connectivity/ppp/ppp/fix-CVE-2015-3310.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-ppp: Buffer overflow in radius plugin
-
-From: https://bugs.debian.org/cgi-bin/bugreport.cgi?msg=5;bug=782450
-
-Upstream-Status: Backport
-CVE: CVE-2015-3310
-
-On systems with more than 65535 processes running, pppd aborts when
-sending a "start" accounting message to the RADIUS server because of a
-buffer overflow in rc_mksid.
-
-The process id is used in rc_mksid to generate a pseudo-unique string,
-assuming that the hex representation of the pid will be at most 4
-characters (FFFF). __sprintf_chk(), used when compiling with
-optimization levels greater than 0 and FORTIFY_SOURCE, detects the
-buffer overflow and makes pppd crash.
-
-The following patch fixes the problem.
-
---- ppp-2.4.6.orig/pppd/plugins/radius/util.c
-+++ ppp-2.4.6/pppd/plugins/radius/util.c
-@@ -77,7 +77,7 @@ rc_mksid (void)
-   static unsigned short int cnt = 0;
-   sprintf (buf, "%08lX%04X%02hX",
- 	   (unsigned long int) time (NULL),
--	   (unsigned int) getpid (),
-+	   (unsigned int) getpid () % 65535,
- 	   cnt & 0xFF);
-   cnt++;
-   return buf;
diff --git a/meta/recipes-connectivity/ppp/ppp/makefile-remove-hard-usr-reference.patch b/meta/recipes-connectivity/ppp/ppp/makefile-remove-hard-usr-reference.patch
deleted file mode 100644
index 614a474c37b..00000000000
--- a/meta/recipes-connectivity/ppp/ppp/makefile-remove-hard-usr-reference.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 505705d0e1b55ce3fdc10d0e5eab5488f869adb6 Mon Sep 17 00:00:00 2001
-From: Andreas Oberritter <obi@opendreambox.org>
-Date: Thu, 1 Jul 2010 14:34:12 +0800
-Subject: [PATCH] ppp: Upgraded to version 2.4.5
-
-The patch comes from OpenEmbedded.
-Rebased for ppp-2.4.5. Dongxiao Xu <dongxiao.xu@intel.com>
-
-Updated from OE-Classic to include the pcap hunk.
-Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
-
-Upstream-Status: Inappropriate [configuration]
-
----
- pppd/Makefile.linux | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/pppd/Makefile.linux b/pppd/Makefile.linux
-index 4e485a1..44c4193 100644
---- a/pppd/Makefile.linux
-+++ b/pppd/Makefile.linux
-@@ -188,10 +188,10 @@ LIBS	+= -ldl
- endif
- 
- ifdef FILTER
--ifneq ($(wildcard /usr/include/pcap-bpf.h),)
-+#ifneq ($(wildcard /usr/include/pcap-bpf.h),)
- LIBS    += -lpcap
- CFLAGS  += -DPPP_FILTER
--endif
-+#endif
- endif
- 
- ifdef HAVE_INET6
diff --git a/meta/recipes-connectivity/ppp/ppp/makefile.patch b/meta/recipes-connectivity/ppp/ppp/makefile.patch
deleted file mode 100644
index 25b8ded4413..00000000000
--- a/meta/recipes-connectivity/ppp/ppp/makefile.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-From f7fb1d1abfa6d208fb40fca1602e0c488108f1b5 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard@openedhand.com>
-Date: Wed, 31 Aug 2005 10:45:47 +0000
-Subject: [PATCH] Initial population
-
-The patch comes from OpenEmbedded
-Rebased for ppp-2.4.5. Dongxiao Xu <dongxiao.xu@intel.com>
-
-Upstream-Status: Inappropriate [configuration]
-
----
- chat/Makefile.linux                  |  2 +-
- pppd/Makefile.linux                  |  4 ++--
- pppd/plugins/radius/Makefile.linux   | 10 +++++-----
- pppd/plugins/rp-pppoe/Makefile.linux |  4 ++--
- pppdump/Makefile.linux               |  2 +-
- pppstats/Makefile.linux              |  2 +-
- 6 files changed, 12 insertions(+), 12 deletions(-)
-
-diff --git a/chat/Makefile.linux b/chat/Makefile.linux
-index 0732ec8..f082dab 100644
---- a/chat/Makefile.linux
-+++ b/chat/Makefile.linux
-@@ -25,7 +25,7 @@ chat.o:	chat.c
- 
- install: chat
- 	mkdir -p $(BINDIR) $(MANDIR)
--	$(INSTALL) -s -c chat $(BINDIR)
-+	$(INSTALL) -c chat $(BINDIR)
- 	$(INSTALL) -c -m 644 chat.8 $(MANDIR)
- 
- clean:
-diff --git a/pppd/Makefile.linux b/pppd/Makefile.linux
-index 9664f70..4e485a1 100644
---- a/pppd/Makefile.linux
-+++ b/pppd/Makefile.linux
-@@ -107,7 +107,7 @@ ifdef USE_SRP
- CFLAGS	+= -DUSE_SRP -DOPENSSL -I/usr/local/ssl/include
- LIBS	+= -lsrp -L/usr/local/ssl/lib -lcrypto
- TARGETS	+= srp-entry
--EXTRAINSTALL = $(INSTALL) -s -c -m 555 srp-entry $(BINDIR)/srp-entry
-+EXTRAINSTALL = $(INSTALL) -c -m 555 srp-entry $(BINDIR)/srp-entry
- MANPAGES += srp-entry.8
- EXTRACLEAN += srp-entry.o
- NEEDDES=y
-@@ -219,7 +219,7 @@ all: $(TARGETS)
- install: pppd
- 	mkdir -p $(BINDIR) $(MANDIR)
- 	$(EXTRAINSTALL)
--	$(INSTALL) -s -c -m 555 pppd $(BINDIR)/pppd
-+	$(INSTALL) -c -m 555 pppd $(BINDIR)/pppd
- 	if chgrp pppusers $(BINDIR)/pppd 2>/dev/null; then \
- 	  chmod o-rx,u+s $(BINDIR)/pppd; fi
- 	$(INSTALL) -c -m 444 pppd.8 $(MANDIR)
-diff --git a/pppd/plugins/radius/Makefile.linux b/pppd/plugins/radius/Makefile.linux
-index e702263..af57ae3 100644
---- a/pppd/plugins/radius/Makefile.linux
-+++ b/pppd/plugins/radius/Makefile.linux
-@@ -36,11 +36,11 @@ all: $(PLUGIN)
- 
- install: all
- 	$(INSTALL) -d -m 755 $(LIBDIR)
--	$(INSTALL) -s -c -m 755 radius.so $(LIBDIR)
--	$(INSTALL) -s -c -m 755 radattr.so $(LIBDIR)
--	$(INSTALL) -s -c -m 755 radrealms.so $(LIBDIR)
--	$(INSTALL) -c -m 444 pppd-radius.8 $(MANDIR)
--	$(INSTALL) -c -m 444 pppd-radattr.8 $(MANDIR)
-+	$(INSTALL) -c -m 755 radius.so $(LIBDIR)
-+	$(INSTALL) -c -m 755 radattr.so $(LIBDIR)
-+	$(INSTALL) -c -m 755 radrealms.so $(LIBDIR)
-+	$(INSTALL) -m 444 pppd-radius.8 $(MANDIR)
-+	$(INSTALL) -m 444 pppd-radattr.8 $(MANDIR)
- 
- radius.so: radius.o libradiusclient.a
- 	$(CC) $(LDFLAGS) -o radius.so -shared radius.o libradiusclient.a
-diff --git a/pppd/plugins/rp-pppoe/Makefile.linux b/pppd/plugins/rp-pppoe/Makefile.linux
-index 749ccc2..2c93f4a 100644
---- a/pppd/plugins/rp-pppoe/Makefile.linux
-+++ b/pppd/plugins/rp-pppoe/Makefile.linux
-@@ -43,9 +43,9 @@ rp-pppoe.so: plugin.o discovery.o if.o common.o
- 
- install: all
- 	$(INSTALL) -d -m 755 $(LIBDIR)
--	$(INSTALL) -s -c -m 4550 rp-pppoe.so $(LIBDIR)
-+	$(INSTALL) -c -m 4550 rp-pppoe.so $(LIBDIR)
- 	$(INSTALL) -d -m 755 $(BINDIR)
--	$(INSTALL) -s -c -m 555 pppoe-discovery $(BINDIR)
-+	$(INSTALL) -c -m 555 pppoe-discovery $(BINDIR)
- 
- clean:
- 	rm -f *.o *.so pppoe-discovery
-diff --git a/pppdump/Makefile.linux b/pppdump/Makefile.linux
-index cdf7ac4..0457561 100644
---- a/pppdump/Makefile.linux
-+++ b/pppdump/Makefile.linux
-@@ -17,5 +17,5 @@ clean:
- 
- install:
- 	mkdir -p $(BINDIR) $(MANDIR)
--	$(INSTALL) -s -c pppdump $(BINDIR)
-+	$(INSTALL) -c pppdump $(BINDIR)
- 	$(INSTALL) -c -m 444 pppdump.8 $(MANDIR)
-diff --git a/pppstats/Makefile.linux b/pppstats/Makefile.linux
-index 71afbe6..1819370 100644
---- a/pppstats/Makefile.linux
-+++ b/pppstats/Makefile.linux
-@@ -22,7 +22,7 @@ all: pppstats
- 
- install: pppstats
- 	-mkdir -p $(MANDIR)
--	$(INSTALL) -s -c pppstats $(BINDIR)
-+	$(INSTALL) -c pppstats $(BINDIR)
- 	$(INSTALL) -c -m 444 pppstats.8 $(MANDIR)
- 
- pppstats: $(PPPSTATSRCS)
diff --git a/meta/recipes-connectivity/ppp/ppp/pppd-resolv-varrun.patch b/meta/recipes-connectivity/ppp/ppp/pppd-resolv-varrun.patch
deleted file mode 100644
index a72414ff8a6..00000000000
--- a/meta/recipes-connectivity/ppp/ppp/pppd-resolv-varrun.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-The patch comes from OpenEmbedded
-Rebased for ppp-2.4.5. Dongxiao Xu <dongxiao.xu@intel.com>
-
-Upstream-Status: Inappropriate [embedded specific]
-
-diff -ruN ppp-2.4.5-orig/pppd/ipcp.c ppp-2.4.5/pppd/ipcp.c
---- ppp-2.4.5-orig/pppd/ipcp.c	2010-06-30 15:51:12.050166398 +0800
-+++ ppp-2.4.5/pppd/ipcp.c	2010-06-30 17:02:33.930393283 +0800
-@@ -55,6 +55,8 @@
- #include <sys/socket.h>
- #include <netinet/in.h>
- #include <arpa/inet.h>
-+#include <sys/stat.h>
-+#include <unistd.h>
- 
- #include "pppd.h"
- #include "fsm.h"
-@@ -2095,6 +2097,14 @@
-     u_int32_t peerdns1, peerdns2;
- {
-     FILE *f;
-+    struct stat dirinfo;
-+
-+    if(stat(_PATH_OUTDIR, &dirinfo)) {
-+        if(mkdir(_PATH_OUTDIR, 0775)) {
-+            error("Failed to create directory %s: %m", _PATH_OUTDIR);
-+            return;
-+        }
-+    }
- 
-     f = fopen(_PATH_RESOLV, "w");
-     if (f == NULL) {
-diff -ruN ppp-2.4.5-orig/pppd/pathnames.h ppp-2.4.5/pppd/pathnames.h
---- ppp-2.4.5-orig/pppd/pathnames.h	2010-06-30 15:51:12.043682063 +0800
-+++ ppp-2.4.5/pppd/pathnames.h	2010-06-30 17:03:20.594371055 +0800
-@@ -30,7 +30,8 @@
- #define _PATH_TTYOPT	 _ROOT_PATH "/etc/ppp/options."
- #define _PATH_CONNERRS	 _ROOT_PATH "/etc/ppp/connect-errors"
- #define _PATH_PEERFILES	 _ROOT_PATH "/etc/ppp/peers/"
--#define _PATH_RESOLV	 _ROOT_PATH "/etc/ppp/resolv.conf"
-+#define _PATH_OUTDIR	_ROOT_PATH _PATH_VARRUN "/ppp"
-+#define _PATH_RESOLV	_PATH_OUTDIR "/resolv.conf"
- 
- #define _PATH_USEROPT	 ".ppprc"
- #define	_PATH_PSEUDONYM	 ".ppp_pseudonym"
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.8.bb b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
similarity index 85%
rename from meta/recipes-connectivity/ppp/ppp_2.4.8.bb
rename to meta/recipes-connectivity/ppp/ppp_2.4.9.bb
index f9c60d6bad7..f05f40dd06f 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.8.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
@@ -12,9 +12,6 @@ LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77
                     file://chat/chat.c;beginline=1;endline=15;md5=0d374b8545ee5c62d7aff1acbd38add2"
 
 SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
-           file://makefile.patch \
-           file://pppd-resolv-varrun.patch \
-           file://makefile-remove-hard-usr-reference.patch \
            file://pon \
            file://poff \
            file://init \
@@ -22,26 +19,18 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://ip-down \
            file://08setupdns \
            file://92removedns \
-           file://copts.patch \
            file://pap \
            file://ppp_on_boot \
            file://provider \
            file://ppp@.service \
-           file://fix-CVE-2015-3310.patch \
-           file://0001-ppp-Remove-unneeded-include.patch \
-           file://0001-pppd-Fix-bounds-check-in-EAP-code.patch \
            "
 
-SRC_URI_append_libc-musl = "\
-           file://0001-Fix-build-with-musl.patch \
-"
-SRC_URI[md5sum] = "2ca8342b9804be15103fd3f687af701c"
-SRC_URI[sha256sum] = "f6bf89beae26b2943dff8f1003533d6a5a4909a0fa6edfbec44fe039bbe61bc6"
+SRC_URI[sha256sum] = "f938b35eccde533ea800b15a7445b2f1137da7f88e32a16898d02dee8adc058d"
 
 inherit autotools-brokensep systemd
 
 TARGET_CC_ARCH += " ${LDFLAGS}"
-EXTRA_OEMAKE = "STRIPPROG=${STRIP} MANDIR=${D}${datadir}/man/man8 INCDIR=${D}${includedir} LIBDIR=${D}${libdir}/pppd/${PV} BINDIR=${D}${sbindir}"
+EXTRA_OEMAKE = "CC='${CC}' STRIPPROG=${STRIP} MANDIR=${D}${datadir}/man/man8 INCDIR=${D}${includedir} LIBDIR=${D}${libdir}/pppd/${PV} BINDIR=${D}${sbindir}"
 EXTRA_OECONF = "--disable-strip"
 
 # Package Makefile computes CFLAGS, referencing COPTS.
@@ -86,7 +75,7 @@ CONFFILES_${PN} = "${sysconfdir}/ppp/pap-secrets ${sysconfdir}/ppp/chap-secrets
 PACKAGES =+ "${PN}-oa ${PN}-oe ${PN}-radius ${PN}-winbind ${PN}-minconn ${PN}-password ${PN}-l2tp ${PN}-tools"
 FILES_${PN}        = "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindir}/pppd ${systemd_unitdir}/system/ppp@.service"
 FILES_${PN}-oa       = "${libdir}/pppd/${PV}/pppoatm.so"
-FILES_${PN}-oe       = "${sbindir}/pppoe-discovery ${libdir}/pppd/${PV}/rp-pppoe.so"
+FILES_${PN}-oe       = "${sbindir}/pppoe-discovery ${libdir}/pppd/${PV}/*pppoe.so"
 FILES_${PN}-radius   = "${libdir}/pppd/${PV}/radius.so ${libdir}/pppd/${PV}/radattr.so ${libdir}/pppd/${PV}/radrealms.so"
 FILES_${PN}-winbind  = "${libdir}/pppd/${PV}/winbind.so"
 FILES_${PN}-minconn  = "${libdir}/pppd/${PV}/minconn.so"
@@ -101,3 +90,6 @@ SUMMARY_${PN}-minconn  = "Plugin for PPP to set a delay before the idle timeout
 SUMMARY_${PN}-password = "Plugin for PPP to get passwords via a pipe"
 SUMMARY_${PN}-l2tp     = "Plugin for PPP for l2tp support"
 SUMMARY_${PN}-tools    = "Additional tools for the PPP package"
+
+# Ignore compatibility symlink rp-pppoe.so->pppoe.so
+INSANE_SKIP_${PN}-oe += "dev-so"
-- 
2.27.0

