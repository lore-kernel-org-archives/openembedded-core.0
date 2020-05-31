Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.17622.1590940452499815449
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jWcHWjkD;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id c35so5417377edf.5
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TyDIoG7nlmzl4oXGrTR3QOyPhiOSgX+YVlwR0KCTF2E=;
        b=jWcHWjkDcXemuehdz4KP9CpsfZdk1nTPit3B00pOPrk/+ZJ6Yx64oelwEyAoWLB5SB
         3KnuHAGFq65VhVkiWR8RBvqtS6ofAho2A+Ss2PS2u66eaLh7Q2v2A7D1aS8dRDVmxxVr
         Ot7ERrAGJhco/G9NdhRtTw6EwSzPqQBDp9YIMWPQCb3GqmfrE4K8TRur/bgDuEbAWdA4
         Fh/ZfHI0g2dtilhpvwmvW04otXP0hEVU4hYR7SpBnRQnKpnKHiuUeSgeM9A7Emir+u3x
         FRU3066W+qUBX5k316K7A13VdFjJAvcJBWbdOLtdehbhjk8tZ1MVdvRlM4Z163Dtkzl4
         2hoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TyDIoG7nlmzl4oXGrTR3QOyPhiOSgX+YVlwR0KCTF2E=;
        b=Rvluh6gy7PSB+TKhUA90B4GRWWg2BnbgimvnfPdF0pwsQrsHQ+ZMsgtB0zB0S5JrbP
         xZ0WcE7JcB+m2SbA4YBO51GLpH1lcdemtKbAQFIRQY703VB8foIyk1JH5V1NDHk0hCyV
         4CQGwW8py3CdYsDvhBx52wTqJw0PaERcwcFJzFk2wZl7ZBuwEgBbwpcJWA2wXKAWJzfv
         5/J+DRaXkIa8e/kbLIhhX52FRJY2kdhozAvprB/PfPuR8ZMwQy5bA/F9gprirbAAiP1s
         FZLp450u8jDIVg9SmIwM/PKrAR6GhU1K8LW71t4457hpxAwGTCJWBQWXxI9C7kZkDL8c
         68oQ==
X-Gm-Message-State: AOAM533hweeXekGRZy0ieCQhalXhPEOXb7DEo0FIY8crJOk90eKiHH+3
	6qwDXcYkFXV5UiBc1uHqY/xdG7Qs
X-Google-Smtp-Source: ABdhPJzO6S1QoeaFc83kobV6SPUtF7DogcsKRogpnwf7z5Q360YkqRF2Hpw2hJe7MYIVhjKCl4hSRg==
X-Received: by 2002:a50:ec0f:: with SMTP id g15mr9920510edr.359.1590940450281;
        Sun, 31 May 2020 08:54:10 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:09 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 49/70] ppp: update 2.4.7 -> 2.4.8
Date: Sun, 31 May 2020 17:52:33 +0200
Message-Id: <20200531155254.10283-49-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop patches:
0001-ppp-Fix-compilation-errors-in-Makefile.patch - issue fixed upstream
0001-pppoe-include-netinet-in.h-before-linux-in.h.patch - backport
cifdefroute.patch - superseded by new default route metric option
ppp-2.4.7-DES-openssl.patch - openssl support added upstream

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../ppp/ppp/0001-Fix-build-with-musl.patch    |  69 +---
 ...p-Fix-compilation-errors-in-Makefile.patch |  30 --
 ...clude-netinet-in.h-before-linux-in.h.patch |  54 ----
 .../ppp/ppp/cifdefroute.patch                 | 297 ------------------
 .../makefile-remove-hard-usr-reference.patch  |  32 +-
 .../ppp/ppp/makefile.patch                    |  72 +++--
 .../ppp/ppp/ppp-2.4.7-DES-openssl.patch       |  84 -----
 .../ppp/{ppp_2.4.7.bb => ppp_2.4.8.bb}        |  10 +-
 8 files changed, 78 insertions(+), 570 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ppp/ppp/0001-ppp-Fix-compilation-errors-in-Makefile.patch
 delete mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppoe-include-netinet-in.h-before-linux-in.h.patch
 delete mode 100644 meta/recipes-connectivity/ppp/ppp/cifdefroute.patch
 delete mode 100644 meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch
 rename meta/recipes-connectivity/ppp/{ppp_2.4.7.bb => ppp_2.4.8.bb} (92%)

diff --git a/meta/recipes-connectivity/ppp/ppp/0001-Fix-build-with-musl.patch b/meta/recipes-connectivity/ppp/ppp/0001-Fix-build-with-musl.patch
index 763e374488..65291368bd 100644
--- a/meta/recipes-connectivity/ppp/ppp/0001-Fix-build-with-musl.patch
+++ b/meta/recipes-connectivity/ppp/ppp/0001-Fix-build-with-musl.patch
@@ -1,4 +1,4 @@
-From 52a1e41d7541b2c936285844c59bd1be21797860 Mon Sep 17 00:00:00 2001
+From e50cdaed07e51f2508f94eb1f34fe43776e4ca78 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 May 2015 14:57:05 -0700
 Subject: [PATCH] Fix build with musl
@@ -6,18 +6,16 @@ Subject: [PATCH] Fix build with musl
 There are several assumption about glibc
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
-
+---
  include/net/ppp_defs.h                  | 2 ++
  pppd/Makefile.linux                     | 2 +-
- pppd/magic.h                            | 6 +++---
- pppd/plugins/rp-pppoe/config.h          | 5 ++++-
+ pppd/plugins/rp-pppoe/config.h          | 3 ++-
  pppd/plugins/rp-pppoe/plugin.c          | 1 -
  pppd/plugins/rp-pppoe/pppoe-discovery.c | 8 ++++----
  pppd/plugins/rp-pppoe/pppoe.h           | 2 +-
  pppd/sys-linux.c                        | 3 ++-
- 8 files changed, 17 insertions(+), 12 deletions(-)
+ 7 files changed, 12 insertions(+), 9 deletions(-)
 
 diff --git a/include/net/ppp_defs.h b/include/net/ppp_defs.h
 index b06eda5..dafa36c 100644
@@ -33,11 +31,11 @@ index b06eda5..dafa36c 100644
   * The basic PPP frame.
   */
 diff --git a/pppd/Makefile.linux b/pppd/Makefile.linux
-index 8ab2102..d7e2564 100644
+index 4e485a1..76411bc 100644
 --- a/pppd/Makefile.linux
 +++ b/pppd/Makefile.linux
-@@ -126,7 +126,7 @@ LIBS	+= -lcrypt
- #endif
+@@ -131,7 +131,7 @@ LIBS	+= -lcrypt
+ endif
  
  ifdef USE_LIBUTIL
 -CFLAGS	+= -DHAVE_LOGWTMP=1
@@ -45,24 +43,8 @@ index 8ab2102..d7e2564 100644
  LIBS	+= -lutil
  endif
  
-diff --git a/pppd/magic.h b/pppd/magic.h
-index c81213b..9d399e3 100644
---- a/pppd/magic.h
-+++ b/pppd/magic.h
-@@ -42,8 +42,8 @@
-  * $Id: magic.h,v 1.5 2003/06/11 23:56:26 paulus Exp $
-  */
- 
--void magic_init __P((void));	/* Initialize the magic number generator */
--u_int32_t magic __P((void));	/* Returns the next magic number */
-+void magic_init (void);	/* Initialize the magic number generator */
-+u_int32_t magic (void);	/* Returns the next magic number */
- 
- /* Fill buffer with random bytes */
--void random_bytes __P((unsigned char *buf, int len));
-+void random_bytes (unsigned char *buf, int len);
 diff --git a/pppd/plugins/rp-pppoe/config.h b/pppd/plugins/rp-pppoe/config.h
-index 5703087..fff032e 100644
+index a708859..4a16a88 100644
 --- a/pppd/plugins/rp-pppoe/config.h
 +++ b/pppd/plugins/rp-pppoe/config.h
 @@ -78,8 +78,9 @@
@@ -76,18 +58,8 @@ index 5703087..fff032e 100644
  /* Define if you have the <net/if.h> header file.  */
  #define HAVE_NET_IF_H 1
  
-@@ -102,7 +103,9 @@
- #define HAVE_NETPACKET_PACKET_H 1
- 
- /* Define if you have the <sys/cdefs.h> header file.  */
-+#ifdef __GLIBC__
- #define HAVE_SYS_CDEFS_H 1
-+#endif
- 
- /* Define if you have the <sys/dlpi.h> header file.  */
- /* #undef HAVE_SYS_DLPI_H */
 diff --git a/pppd/plugins/rp-pppoe/plugin.c b/pppd/plugins/rp-pppoe/plugin.c
-index a8c2bb4..ca34d79 100644
+index 44e0c31..93c0906 100644
 --- a/pppd/plugins/rp-pppoe/plugin.c
 +++ b/pppd/plugins/rp-pppoe/plugin.c
 @@ -46,7 +46,6 @@ static char const RCSID[] =
@@ -99,10 +71,10 @@ index a8c2bb4..ca34d79 100644
  #include <linux/ppp_defs.h>
  #include <linux/if_pppox.h>
 diff --git a/pppd/plugins/rp-pppoe/pppoe-discovery.c b/pppd/plugins/rp-pppoe/pppoe-discovery.c
-index 3d3bf4e..d42f619 100644
+index f19c6d8..f45df2c 100644
 --- a/pppd/plugins/rp-pppoe/pppoe-discovery.c
 +++ b/pppd/plugins/rp-pppoe/pppoe-discovery.c
-@@ -27,10 +27,6 @@
+@@ -29,10 +29,6 @@
  #include <linux/if_packet.h>
  #endif
  
@@ -113,22 +85,11 @@ index 3d3bf4e..d42f619 100644
  #ifdef HAVE_ASM_TYPES_H
  #include <asm/types.h>
  #endif
-@@ -47,6 +43,10 @@
- #include <net/if_arp.h>
- #endif
- 
-+#ifndef __GLIBC__
-+#define error(x...) fprintf(stderr, x)
-+#endif
-+
- char *xstrdup(const char *s);
- void usage(void);
- 
 diff --git a/pppd/plugins/rp-pppoe/pppoe.h b/pppd/plugins/rp-pppoe/pppoe.h
-index 9ab2eee..75b9004 100644
+index a4e7d5c..de191c8 100644
 --- a/pppd/plugins/rp-pppoe/pppoe.h
 +++ b/pppd/plugins/rp-pppoe/pppoe.h
-@@ -92,7 +92,7 @@ typedef unsigned long UINT32_t;
+@@ -90,7 +90,7 @@ typedef unsigned long UINT32_t;
  #ifdef HAVE_SYS_SOCKET_H
  #include <sys/socket.h>
  #endif
@@ -138,7 +99,7 @@ index 9ab2eee..75b9004 100644
  #endif
  #endif
 diff --git a/pppd/sys-linux.c b/pppd/sys-linux.c
-index a105505..49b0273 100644
+index a0531e9..84ee394 100644
 --- a/pppd/sys-linux.c
 +++ b/pppd/sys-linux.c
 @@ -112,7 +112,7 @@
@@ -159,5 +120,5 @@ index a105505..49b0273 100644
  /*
   *    This is in linux/include/net/ipv6.h.
 -- 
-2.1.4
+2.17.1
 
diff --git a/meta/recipes-connectivity/ppp/ppp/0001-ppp-Fix-compilation-errors-in-Makefile.patch b/meta/recipes-connectivity/ppp/ppp/0001-ppp-Fix-compilation-errors-in-Makefile.patch
deleted file mode 100644
index ea4969b366..0000000000
--- a/meta/recipes-connectivity/ppp/ppp/0001-ppp-Fix-compilation-errors-in-Makefile.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From ba0f6058d1f25b2b60fc31ab2656bf12a71ffdab Mon Sep 17 00:00:00 2001
-From: Lu Chong <Chong.Lu@windriver.com>
-Date: Tue, 5 Nov 2013 17:32:56 +0800
-Subject: [PATCH] ppp: Fix compilation errors in Makefile
-
-Make can't exit while compilation error occurs in subdir for plugins building.
-
-Upstream-Status: Pending
-
-Signed-off-by: Lu Chong <Chong.Lu@windriver.com>
----
- pppd/plugins/Makefile.linux          |    1 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/pppd/plugins/Makefile.linux b/pppd/plugins/Makefile.linux
-index 0a7ec7b..2a2c15a 100644
---- a/pppd/plugins/Makefile.linux
-+++ b/pppd/plugins/Makefile.linux
-@@ -20,7 +20,7 @@ include .depend
- endif
- 
- all:	$(PLUGINS)
--	for d in $(SUBDIRS); do $(MAKE) $(MFLAGS) -C $$d all; done
-+	for d in $(SUBDIRS); do $(MAKE) $(MFLAGS) -C $$d all || exit 1; done
- 
- %.so: %.c
- 	$(CC) -o $@ $(LDFLAGS) $(CFLAGS) $^
--- 
-1.7.9.5
-
diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppoe-include-netinet-in.h-before-linux-in.h.patch b/meta/recipes-connectivity/ppp/ppp/0001-pppoe-include-netinet-in.h-before-linux-in.h.patch
deleted file mode 100644
index 9362d12648..0000000000
--- a/meta/recipes-connectivity/ppp/ppp/0001-pppoe-include-netinet-in.h-before-linux-in.h.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 50a2997b256e0e0ef7a46fae133f56f60fce539c Mon Sep 17 00:00:00 2001
-From: Lubomir Rintel <lkundrak@v3.sk>
-Date: Mon, 9 Jan 2017 13:34:23 +0000
-Subject: [PATCH] pppoe: include netinet/in.h before linux/in.h
-
-This fixes builds with newer kernels. Basically, <netinet/in.h> needs to be
-included before <linux/in.h> otherwise the earlier, unaware of the latter,
-tries to redefine symbols and structures. Also, <linux/if_pppox.h> doesn't work
-alone anymore, since it pulls the headers in the wrong order, so we better
-include <netinet/in.h> early.
-
-Upstream-Status: Backport
-[https://github.com/paulusmack/ppp/commit/50a2997b256e0e0ef7a46fae133f56f60fce539c]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- pppd/plugins/rp-pppoe/pppoe.h | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/pppd/plugins/rp-pppoe/pppoe.h b/pppd/plugins/rp-pppoe/pppoe.h
-index 9ab2eee..c4aaa6e 100644
---- a/pppd/plugins/rp-pppoe/pppoe.h
-+++ b/pppd/plugins/rp-pppoe/pppoe.h
-@@ -47,6 +47,10 @@
- #include <sys/socket.h>
- #endif
- 
-+/* This has to be included before Linux 4.8's linux/in.h
-+ * gets dragged in. */
-+#include <netinet/in.h>
-+
- /* Ugly header files on some Linux boxes... */
- #if defined(HAVE_LINUX_IF_H)
- #include <linux/if.h>
-@@ -84,8 +88,6 @@ typedef unsigned long UINT32_t;
- #include <linux/if_ether.h>
- #endif
- 
--#include <netinet/in.h>
--
- #ifdef HAVE_NETINET_IF_ETHER_H
- #include <sys/types.h>
- 
-@@ -98,7 +100,6 @@ typedef unsigned long UINT32_t;
- #endif
- 
- 
--
- /* Ethernet frame types according to RFC 2516 */
- #define ETH_PPPOE_DISCOVERY 0x8863
- #define ETH_PPPOE_SESSION   0x8864
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/ppp/ppp/cifdefroute.patch b/meta/recipes-connectivity/ppp/ppp/cifdefroute.patch
deleted file mode 100644
index 7dd69d8f4d..0000000000
--- a/meta/recipes-connectivity/ppp/ppp/cifdefroute.patch
+++ /dev/null
@@ -1,297 +0,0 @@
-This patch comes from OpenEmbedded.
-The original patch is from Debian / SuSE to implement replacedefaultroute
-Rebased it to fit ppp-2.4.5. Dongxiao Xu <dongxiao.xu@intel.com>
-
-Upstream-Status: Inappropriate [debian/suse patches]
-
-Index: ppp-2.4.7/pppd/ipcp.c
-===================================================================
---- ppp-2.4.7.orig/pppd/ipcp.c
-+++ ppp-2.4.7/pppd/ipcp.c
-@@ -198,6 +198,16 @@ static option_t ipcp_option_list[] = {
-       "disable defaultroute option", OPT_ALIAS | OPT_A2CLR,
-       &ipcp_wantoptions[0].default_route },
- 
-+#ifdef __linux__
-+    { "replacedefaultroute", o_bool,
-+                               &ipcp_wantoptions[0].replace_default_route,
-+      "Replace default route", 1
-+    },
-+    { "noreplacedefaultroute", o_bool,
-+                               &ipcp_allowoptions[0].replace_default_route,
-+      "Never replace default route", OPT_A2COPY,
-+                               &ipcp_wantoptions[0].replace_default_route },
-+#endif
-     { "proxyarp", o_bool, &ipcp_wantoptions[0].proxy_arp,
-       "Add proxy ARP entry", OPT_ENABLE|1, &ipcp_allowoptions[0].proxy_arp },
-     { "noproxyarp", o_bool, &ipcp_allowoptions[0].proxy_arp,
-@@ -271,7 +281,7 @@ struct protent ipcp_protent = {
-     ip_active_pkt
- };
- 
--static void ipcp_clear_addrs __P((int, u_int32_t, u_int32_t));
-+static void ipcp_clear_addrs __P((int, u_int32_t, u_int32_t, bool));
- static void ipcp_script __P((char *, int));	/* Run an up/down script */
- static void ipcp_script_done __P((void *));
- 
-@@ -1761,7 +1771,12 @@ ip_demand_conf(u)
-     if (!sifnpmode(u, PPP_IP, NPMODE_QUEUE))
- 	return 0;
-     if (wo->default_route)
-+#ifndef __linux__
- 	if (sifdefaultroute(u, wo->ouraddr, wo->hisaddr))
-+#else
-+	if (sifdefaultroute(u, wo->ouraddr, wo->hisaddr,
-+                                            wo->replace_default_route))
-+#endif
- 	    default_route_set[u] = 1;
-     if (wo->proxy_arp)
- 	if (sifproxyarp(u, wo->hisaddr))
-@@ -1849,7 +1864,8 @@ ipcp_up(f)
-      */
-     if (demand) {
- 	if (go->ouraddr != wo->ouraddr || ho->hisaddr != wo->hisaddr) {
--	    ipcp_clear_addrs(f->unit, wo->ouraddr, wo->hisaddr);
-+	    ipcp_clear_addrs(f->unit, wo->ouraddr, wo->hisaddr, 
-+				      wo->replace_default_route);
- 	    if (go->ouraddr != wo->ouraddr) {
- 		warn("Local IP address changed to %I", go->ouraddr);
- 		script_setenv("OLDIPLOCAL", ip_ntoa(wo->ouraddr), 0);
-@@ -1874,7 +1890,12 @@ ipcp_up(f)
- 
- 	    /* assign a default route through the interface if required */
- 	    if (ipcp_wantoptions[f->unit].default_route) 
-+#ifndef __linux__
- 		if (sifdefaultroute(f->unit, go->ouraddr, ho->hisaddr))
-+#else
-+		if (sifdefaultroute(f->unit, go->ouraddr, ho->hisaddr,
-+					     wo->replace_default_route))
-+#endif
- 		    default_route_set[f->unit] = 1;
- 
- 	    /* Make a proxy ARP entry if requested. */
-@@ -1924,7 +1945,12 @@ ipcp_up(f)
- 
- 	/* assign a default route through the interface if required */
- 	if (ipcp_wantoptions[f->unit].default_route) 
-+#ifndef __linux__
- 	    if (sifdefaultroute(f->unit, go->ouraddr, ho->hisaddr))
-+#else
-+	    if (sifdefaultroute(f->unit, go->ouraddr, ho->hisaddr,
-+					 wo->replace_default_route))
-+#endif
- 		default_route_set[f->unit] = 1;
- 
- 	/* Make a proxy ARP entry if requested. */
-@@ -2002,7 +2028,7 @@ ipcp_down(f)
- 	sifnpmode(f->unit, PPP_IP, NPMODE_DROP);
- 	sifdown(f->unit);
- 	ipcp_clear_addrs(f->unit, ipcp_gotoptions[f->unit].ouraddr,
--			 ipcp_hisoptions[f->unit].hisaddr);
-+			 ipcp_hisoptions[f->unit].hisaddr, 0);
-     }
- 
-     /* Execute the ip-down script */
-@@ -2018,12 +2044,21 @@ ipcp_down(f)
-  * proxy arp entries, etc.
-  */
- static void
--ipcp_clear_addrs(unit, ouraddr, hisaddr)
-+ipcp_clear_addrs(unit, ouraddr, hisaddr, replacedefaultroute)
-     int unit;
-     u_int32_t ouraddr;  /* local address */
-     u_int32_t hisaddr;  /* remote address */
-+    bool replacedefaultroute;
- {
--    if (proxy_arp_set[unit]) {
-+    /* If replacedefaultroute, sifdefaultroute will be called soon
-+     * with replacedefaultroute set and that will overwrite the current
-+     * default route. This is the case only when doing demand, otherwise
-+     * during demand, this cifdefaultroute would restore the old default
-+     * route which is not what we want in this case. In the non-demand
-+     * case, we'll delete the default route and restore the old if there
-+     * is one saved by an sifdefaultroute with replacedefaultroute.
-+     */
-+    if (!replacedefaultroute && default_route_set[unit]) {
- 	cifproxyarp(unit, hisaddr);
- 	proxy_arp_set[unit] = 0;
-     }
-Index: ppp-2.4.7/pppd/ipcp.h
-===================================================================
---- ppp-2.4.7.orig/pppd/ipcp.h
-+++ ppp-2.4.7/pppd/ipcp.h
-@@ -70,6 +70,7 @@ typedef struct ipcp_options {
-     bool old_addrs;		/* Use old (IP-Addresses) option? */
-     bool req_addr;		/* Ask peer to send IP address? */
-     bool default_route;		/* Assign default route through interface? */
-+    bool replace_default_route; /* Replace default route through interface? */
-     bool proxy_arp;		/* Make proxy ARP entry for peer? */
-     bool neg_vj;		/* Van Jacobson Compression? */
-     bool old_vj;		/* use old (short) form of VJ option? */
-Index: ppp-2.4.7/pppd/pppd.8
-===================================================================
---- ppp-2.4.7.orig/pppd/pppd.8
-+++ ppp-2.4.7/pppd/pppd.8
-@@ -121,6 +121,13 @@ the gateway, when IPCP negotiation is su
- This entry is removed when the PPP connection is broken.  This option
- is privileged if the \fInodefaultroute\fR option has been specified.
- .TP
-+.B replacedefaultroute
-+This option is a flag to the defaultroute option. If defaultroute is
-+set and this flag is also set, pppd replaces an existing default route
-+with the new default route.
-+
-+
-+.TP
- .B disconnect \fIscript
- Execute the command specified by \fIscript\fR, by passing it to a
- shell, after
-@@ -734,7 +741,12 @@ disable both forms of hardware flow cont
- .TP
- .B nodefaultroute
- Disable the \fIdefaultroute\fR option.  The system administrator who
--wishes to prevent users from creating default routes with pppd
-+wishes to prevent users from adding a default route with pppd
-+can do so by placing this option in the /etc/ppp/options file.
-+.TP
-+.B noreplacedefaultroute
-+Disable the \fIreplacedefaultroute\fR option. The system administrator who
-+wishes to prevent users from replacing a default route with pppd
- can do so by placing this option in the /etc/ppp/options file.
- .TP
- .B nodeflate
-Index: ppp-2.4.7/pppd/pppd.h
-===================================================================
---- ppp-2.4.7.orig/pppd/pppd.h
-+++ ppp-2.4.7/pppd/pppd.h
-@@ -665,7 +665,11 @@ int  sif6addr __P((int, eui64_t, eui64_t
- int  cif6addr __P((int, eui64_t, eui64_t));
- 				/* Remove an IPv6 address from i/f */
- #endif
-+#ifndef __linux__
- int  sifdefaultroute __P((int, u_int32_t, u_int32_t));
-+#else
-+int  sifdefaultroute __P((int, u_int32_t, u_int32_t, bool replace_default_rt));
-+#endif
- 				/* Create default route through i/f */
- int  cifdefaultroute __P((int, u_int32_t, u_int32_t));
- 				/* Delete default route through i/f */
-Index: ppp-2.4.7/pppd/sys-linux.c
-===================================================================
---- ppp-2.4.7.orig/pppd/sys-linux.c
-+++ ppp-2.4.7/pppd/sys-linux.c
-@@ -207,6 +207,8 @@ static unsigned char inbuf[512]; /* buff
- static int	if_is_up;	/* Interface has been marked up */
- static int	if6_is_up;	/* Interface has been marked up for IPv6, to help differentiate */
- static int	have_default_route;	/* Gateway for default route added */
-+static struct rtentry old_def_rt;       /* Old default route */
-+static int       default_rt_repl_rest;  /* replace and restore old default rt */
- static u_int32_t proxy_arp_addr;	/* Addr for proxy arp entry added */
- static char proxy_arp_dev[16];		/* Device for proxy arp entry */
- static u_int32_t our_old_addr;		/* for detecting address changes */
-@@ -1545,6 +1547,9 @@ static int read_route_table(struct rtent
- 	p = NULL;
-     }
- 
-+    SET_SA_FAMILY (rt->rt_dst,     AF_INET);
-+    SET_SA_FAMILY (rt->rt_gateway, AF_INET);
-+
-     SIN_ADDR(rt->rt_dst) = strtoul(cols[route_dest_col], NULL, 16);
-     SIN_ADDR(rt->rt_gateway) = strtoul(cols[route_gw_col], NULL, 16);
-     SIN_ADDR(rt->rt_genmask) = strtoul(cols[route_mask_col], NULL, 16);
-@@ -1614,20 +1619,51 @@ int have_route_to(u_int32_t addr)
- /********************************************************************
-  *
-  * sifdefaultroute - assign a default route through the address given.
-- */
--
--int sifdefaultroute (int unit, u_int32_t ouraddr, u_int32_t gateway)
--{
--    struct rtentry rt;
--
--    if (defaultroute_exists(&rt) && strcmp(rt.rt_dev, ifname) != 0) {
--	if (rt.rt_flags & RTF_GATEWAY)
--	    error("not replacing existing default route via %I",
--		  SIN_ADDR(rt.rt_gateway));
--	else
--	    error("not replacing existing default route through %s",
--		  rt.rt_dev);
--	return 0;
-+ *
-+ * If the global default_rt_repl_rest flag is set, then this function
-+ * already replaced the original system defaultroute with some other
-+ * route and it should just replace the current defaultroute with
-+ * another one, without saving the current route. Use: demand mode,
-+ * when pppd sets first a defaultroute it it's temporary ppp0 addresses
-+ * and then changes the temporary addresses to the addresses for the real
-+ * ppp connection when it has come up.
-+ */
-+
-+int sifdefaultroute (int unit, u_int32_t ouraddr, u_int32_t gateway, bool replace)
-+{
-+    struct rtentry rt, tmp_rt;
-+    struct rtentry *del_rt = NULL;
-+
-+    if (default_rt_repl_rest) {
-+	/* We have already reclaced the original defaultroute, if we
-+         * are called again, we will delete the current default route
-+         * and set the new default route in this function.  
-+         * - this is normally only the case the doing demand: */
-+	if (defaultroute_exists( &tmp_rt ))
-+		del_rt = &tmp_rt;
-+    } else if ( defaultroute_exists( &old_def_rt                ) &&
-+	                     strcmp(  old_def_rt.rt_dev, ifname ) != 0) {
-+	/* We did not yet replace an existing default route, let's
-+	 * check if we should save and replace a default route:
-+         */
-+	u_int32_t old_gateway = SIN_ADDR(old_def_rt.rt_gateway);
-+	if (old_gateway != gateway) {
-+	    if (!replace) {
-+	        error("not replacing default route to %s [%I]",
-+			old_def_rt.rt_dev, old_gateway);
-+		return 0;
-+	    } else {
-+		// we need to copy rt_dev because we need it permanent too:
-+		char * tmp_dev = malloc(strlen(old_def_rt.rt_dev)+1);
-+		strcpy(tmp_dev, old_def_rt.rt_dev);
-+		old_def_rt.rt_dev = tmp_dev;
-+
-+		notice("replacing old default route to %s [%I]",
-+			old_def_rt.rt_dev, old_gateway);
-+	        default_rt_repl_rest = 1;
-+		del_rt = &old_def_rt;
-+	    }
-+	}
-     }
- 
-     memset (&rt, 0, sizeof (rt));
-@@ -1646,6 +1682,12 @@ int sifdefaultroute (int unit, u_int32_t
- 	    error("default route ioctl(SIOCADDRT): %m");
- 	return 0;
-     }
-+    if (default_rt_repl_rest && del_rt)
-+        if (ioctl(sock_fd, SIOCDELRT, del_rt) < 0) {
-+	    if ( ! ok_error ( errno ))
-+	        error("del old default route ioctl(SIOCDELRT): %m(%d)", errno);
-+	    return 0;
-+        }
- 
-     have_default_route = 1;
-     return 1;
-@@ -1681,6 +1723,16 @@ int cifdefaultroute (int unit, u_int32_t
- 	    return 0;
- 	}
-     }
-+    if (default_rt_repl_rest) {
-+	notice("restoring old default route to %s [%I]",
-+			old_def_rt.rt_dev, SIN_ADDR(old_def_rt.rt_gateway));
-+        if (ioctl(sock_fd, SIOCADDRT, &old_def_rt) < 0) {
-+	    if ( ! ok_error ( errno ))
-+	        error("restore default route ioctl(SIOCADDRT): %m(%d)", errno);
-+	    return 0;
-+        }
-+        default_rt_repl_rest = 0;
-+    }
- 
-     return 1;
- }
diff --git a/meta/recipes-connectivity/ppp/ppp/makefile-remove-hard-usr-reference.patch b/meta/recipes-connectivity/ppp/ppp/makefile-remove-hard-usr-reference.patch
index 8a69396cc7..614a474c37 100644
--- a/meta/recipes-connectivity/ppp/ppp/makefile-remove-hard-usr-reference.patch
+++ b/meta/recipes-connectivity/ppp/ppp/makefile-remove-hard-usr-reference.patch
@@ -1,3 +1,8 @@
+From 505705d0e1b55ce3fdc10d0e5eab5488f869adb6 Mon Sep 17 00:00:00 2001
+From: Andreas Oberritter <obi@opendreambox.org>
+Date: Thu, 1 Jul 2010 14:34:12 +0800
+Subject: [PATCH] ppp: Upgraded to version 2.4.5
+
 The patch comes from OpenEmbedded.
 Rebased for ppp-2.4.5. Dongxiao Xu <dongxiao.xu@intel.com>
 
@@ -6,24 +11,15 @@ Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
 
 Upstream-Status: Inappropriate [configuration]
 
-Index: ppp-2.4.7/pppd/Makefile.linux
-===================================================================
---- ppp-2.4.7.orig/pppd/Makefile.linux
-+++ ppp-2.4.7/pppd/Makefile.linux
-@@ -120,10 +120,10 @@ CFLAGS   += -DHAS_SHADOW
- #LIBS     += -lshadow $(LIBS)
- endif
- 
--ifneq ($(wildcard /usr/include/crypt.h),)
-+#ifneq ($(wildcard /usr/include/crypt.h),)
- CFLAGS  += -DHAVE_CRYPT_H=1
- LIBS	+= -lcrypt
--endif
-+#endif
- 
- ifdef USE_LIBUTIL
- CFLAGS	+= -DHAVE_LOGWTMP=1
-@@ -177,10 +177,10 @@ LIBS	+= -ldl
+---
+ pppd/Makefile.linux | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pppd/Makefile.linux b/pppd/Makefile.linux
+index 4e485a1..44c4193 100644
+--- a/pppd/Makefile.linux
++++ b/pppd/Makefile.linux
+@@ -188,10 +188,10 @@ LIBS	+= -ldl
  endif
  
  ifdef FILTER
diff --git a/meta/recipes-connectivity/ppp/ppp/makefile.patch b/meta/recipes-connectivity/ppp/ppp/makefile.patch
index 2d09baf5d0..25b8ded441 100644
--- a/meta/recipes-connectivity/ppp/ppp/makefile.patch
+++ b/meta/recipes-connectivity/ppp/ppp/makefile.patch
@@ -1,12 +1,27 @@
+From f7fb1d1abfa6d208fb40fca1602e0c488108f1b5 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard@openedhand.com>
+Date: Wed, 31 Aug 2005 10:45:47 +0000
+Subject: [PATCH] Initial population
+
 The patch comes from OpenEmbedded
 Rebased for ppp-2.4.5. Dongxiao Xu <dongxiao.xu@intel.com>
 
 Upstream-Status: Inappropriate [configuration]
 
-diff -ruN ppp-2.4.5-orig/chat/Makefile.linux ppp-2.4.5/chat/Makefile.linux
---- ppp-2.4.5-orig/chat/Makefile.linux	2010-06-30 15:51:12.050166398 +0800
-+++ ppp-2.4.5/chat/Makefile.linux	2010-06-30 15:51:30.450118446 +0800
-@@ -25,7 +25,7 @@
+---
+ chat/Makefile.linux                  |  2 +-
+ pppd/Makefile.linux                  |  4 ++--
+ pppd/plugins/radius/Makefile.linux   | 10 +++++-----
+ pppd/plugins/rp-pppoe/Makefile.linux |  4 ++--
+ pppdump/Makefile.linux               |  2 +-
+ pppstats/Makefile.linux              |  2 +-
+ 6 files changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/chat/Makefile.linux b/chat/Makefile.linux
+index 0732ec8..f082dab 100644
+--- a/chat/Makefile.linux
++++ b/chat/Makefile.linux
+@@ -25,7 +25,7 @@ chat.o:	chat.c
  
  install: chat
  	mkdir -p $(BINDIR) $(MANDIR)
@@ -15,10 +30,11 @@ diff -ruN ppp-2.4.5-orig/chat/Makefile.linux ppp-2.4.5/chat/Makefile.linux
  	$(INSTALL) -c -m 644 chat.8 $(MANDIR)
  
  clean:
-diff -ruN ppp-2.4.5-orig/pppd/Makefile.linux ppp-2.4.5/pppd/Makefile.linux
---- ppp-2.4.5-orig/pppd/Makefile.linux	2010-06-30 15:51:12.043682063 +0800
-+++ ppp-2.4.5/pppd/Makefile.linux	2010-06-30 15:52:11.214170607 +0800
-@@ -99,7 +99,7 @@
+diff --git a/pppd/Makefile.linux b/pppd/Makefile.linux
+index 9664f70..4e485a1 100644
+--- a/pppd/Makefile.linux
++++ b/pppd/Makefile.linux
+@@ -107,7 +107,7 @@ ifdef USE_SRP
  CFLAGS	+= -DUSE_SRP -DOPENSSL -I/usr/local/ssl/include
  LIBS	+= -lsrp -L/usr/local/ssl/lib -lcrypto
  TARGETS	+= srp-entry
@@ -27,7 +43,7 @@ diff -ruN ppp-2.4.5-orig/pppd/Makefile.linux ppp-2.4.5/pppd/Makefile.linux
  MANPAGES += srp-entry.8
  EXTRACLEAN += srp-entry.o
  NEEDDES=y
-@@ -200,7 +200,7 @@
+@@ -219,7 +219,7 @@ all: $(TARGETS)
  install: pppd
  	mkdir -p $(BINDIR) $(MANDIR)
  	$(EXTRAINSTALL)
@@ -36,10 +52,11 @@ diff -ruN ppp-2.4.5-orig/pppd/Makefile.linux ppp-2.4.5/pppd/Makefile.linux
  	if chgrp pppusers $(BINDIR)/pppd 2>/dev/null; then \
  	  chmod o-rx,u+s $(BINDIR)/pppd; fi
  	$(INSTALL) -c -m 444 pppd.8 $(MANDIR)
-diff -ruN ppp-2.4.5-orig/pppd/plugins/radius/Makefile.linux ppp-2.4.5/pppd/plugins/radius/Makefile.linux
---- ppp-2.4.5-orig/pppd/plugins/radius/Makefile.linux	2010-06-30 15:51:12.047676187 +0800
-+++ ppp-2.4.5/pppd/plugins/radius/Makefile.linux	2010-06-30 15:53:47.750182267 +0800
-@@ -36,11 +36,11 @@
+diff --git a/pppd/plugins/radius/Makefile.linux b/pppd/plugins/radius/Makefile.linux
+index e702263..af57ae3 100644
+--- a/pppd/plugins/radius/Makefile.linux
++++ b/pppd/plugins/radius/Makefile.linux
+@@ -36,11 +36,11 @@ all: $(PLUGIN)
  
  install: all
  	$(INSTALL) -d -m 755 $(LIBDIR)
@@ -55,11 +72,12 @@ diff -ruN ppp-2.4.5-orig/pppd/plugins/radius/Makefile.linux ppp-2.4.5/pppd/plugi
 +	$(INSTALL) -m 444 pppd-radattr.8 $(MANDIR)
  
  radius.so: radius.o libradiusclient.a
- 	$(CC) -o radius.so -shared radius.o libradiusclient.a
-diff -ruN ppp-2.4.5-orig/pppd/plugins/rp-pppoe/Makefile.linux ppp-2.4.5/pppd/plugins/rp-pppoe/Makefile.linux
---- ppp-2.4.5-orig/pppd/plugins/rp-pppoe/Makefile.linux	2010-06-30 15:51:12.047676187 +0800
-+++ ppp-2.4.5/pppd/plugins/rp-pppoe/Makefile.linux	2010-06-30 15:53:15.454486877 +0800
-@@ -43,9 +43,9 @@
+ 	$(CC) $(LDFLAGS) -o radius.so -shared radius.o libradiusclient.a
+diff --git a/pppd/plugins/rp-pppoe/Makefile.linux b/pppd/plugins/rp-pppoe/Makefile.linux
+index 749ccc2..2c93f4a 100644
+--- a/pppd/plugins/rp-pppoe/Makefile.linux
++++ b/pppd/plugins/rp-pppoe/Makefile.linux
+@@ -43,9 +43,9 @@ rp-pppoe.so: plugin.o discovery.o if.o common.o
  
  install: all
  	$(INSTALL) -d -m 755 $(LIBDIR)
@@ -71,20 +89,22 @@ diff -ruN ppp-2.4.5-orig/pppd/plugins/rp-pppoe/Makefile.linux ppp-2.4.5/pppd/plu
  
  clean:
  	rm -f *.o *.so pppoe-discovery
-diff -ruN ppp-2.4.5-orig/pppdump/Makefile.linux ppp-2.4.5/pppdump/Makefile.linux
---- ppp-2.4.5-orig/pppdump/Makefile.linux	2010-06-30 15:51:12.058183383 +0800
-+++ ppp-2.4.5/pppdump/Makefile.linux	2010-06-30 15:52:25.762183537 +0800
-@@ -17,5 +17,5 @@
+diff --git a/pppdump/Makefile.linux b/pppdump/Makefile.linux
+index cdf7ac4..0457561 100644
+--- a/pppdump/Makefile.linux
++++ b/pppdump/Makefile.linux
+@@ -17,5 +17,5 @@ clean:
  
  install:
  	mkdir -p $(BINDIR) $(MANDIR)
 -	$(INSTALL) -s -c pppdump $(BINDIR)
 +	$(INSTALL) -c pppdump $(BINDIR)
  	$(INSTALL) -c -m 444 pppdump.8 $(MANDIR)
-diff -ruN ppp-2.4.5-orig/pppstats/Makefile.linux ppp-2.4.5/pppstats/Makefile.linux
---- ppp-2.4.5-orig/pppstats/Makefile.linux	2010-06-30 15:51:12.058183383 +0800
-+++ ppp-2.4.5/pppstats/Makefile.linux	2010-06-30 15:52:42.486341081 +0800
-@@ -22,7 +22,7 @@
+diff --git a/pppstats/Makefile.linux b/pppstats/Makefile.linux
+index 71afbe6..1819370 100644
+--- a/pppstats/Makefile.linux
++++ b/pppstats/Makefile.linux
+@@ -22,7 +22,7 @@ all: pppstats
  
  install: pppstats
  	-mkdir -p $(MANDIR)
diff --git a/meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch b/meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch
deleted file mode 100644
index e53f240543..0000000000
--- a/meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-Used openssl for the DES instead of the libcrypt / glibc
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: ppp-2.4.7/pppd/Makefile.linux
-===================================================================
---- ppp-2.4.7.orig/pppd/Makefile.linux
-+++ ppp-2.4.7/pppd/Makefile.linux
-@@ -38,7 +38,7 @@ LIBS =
- # Uncomment the next 2 lines to include support for Microsoft's
- # MS-CHAP authentication protocol.  Also, edit plugins/radius/Makefile.linux.
- CHAPMS=y
--USE_CRYPT=y
-+#USE_CRYPT=y
- # Don't use MSLANMAN unless you really know what you're doing.
- #MSLANMAN=y
- # Uncomment the next line to include support for MPPE.  CHAPMS (above) must
-@@ -132,7 +132,7 @@ endif
- 
- ifdef NEEDDES
- ifndef USE_CRYPT
--LIBS     += -ldes $(LIBS)
-+LIBS     += -lcrypto
- else
- CFLAGS   += -DUSE_CRYPT=1
- endif
-Index: ppp-2.4.7/pppd/pppcrypt.c
-===================================================================
---- ppp-2.4.7.orig/pppd/pppcrypt.c
-+++ ppp-2.4.7/pppd/pppcrypt.c
-@@ -64,7 +64,7 @@ u_char *des_key;	/* OUT 64 bit DES key w
- 	des_key[7] = Get7Bits(key, 49);
- 
- #ifndef USE_CRYPT
--	des_set_odd_parity((des_cblock *)des_key);
-+	DES_set_odd_parity((DES_cblock *)des_key);
- #endif
- }
- 
-@@ -158,25 +158,25 @@ u_char *clear;	/* OUT 8 octets */
- }
- 
- #else /* USE_CRYPT */
--static des_key_schedule	key_schedule;
-+static DES_key_schedule	key_schedule;
- 
- bool
- DesSetkey(key)
- u_char *key;
- {
--	des_cblock des_key;
-+	DES_cblock des_key;
- 	MakeKey(key, des_key);
--	des_set_key(&des_key, key_schedule);
-+	DES_set_key(&des_key, &key_schedule);
- 	return (1);
- }
- 
- bool
--DesEncrypt(clear, key, cipher)
-+DesEncrypt(clear, cipher)
- u_char *clear;	/* IN  8 octets */
- u_char *cipher;	/* OUT 8 octets */
- {
--	des_ecb_encrypt((des_cblock *)clear, (des_cblock *)cipher,
--	    key_schedule, 1);
-+	DES_ecb_encrypt((DES_cblock *)clear, (DES_cblock *)cipher,
-+	    &key_schedule, 1);
- 	return (1);
- }
- 
-@@ -185,8 +185,8 @@ DesDecrypt(cipher, clear)
- u_char *cipher;	/* IN  8 octets */
- u_char *clear;	/* OUT 8 octets */
- {
--	des_ecb_encrypt((des_cblock *)cipher, (des_cblock *)clear,
--	    key_schedule, 0);
-+	DES_ecb_encrypt((DES_cblock *)cipher, (DES_cblock *)clear,
-+	    &key_schedule, 0);
- 	return (1);
- }
- 
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.8.bb
similarity index 92%
rename from meta/recipes-connectivity/ppp/ppp_2.4.7.bb
rename to meta/recipes-connectivity/ppp/ppp_2.4.8.bb
index 60c56dd0bd..f9c60d6bad 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.8.bb
@@ -13,7 +13,6 @@ LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77
 
 SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://makefile.patch \
-           file://cifdefroute.patch \
            file://pppd-resolv-varrun.patch \
            file://makefile-remove-hard-usr-reference.patch \
            file://pon \
@@ -27,20 +26,17 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://pap \
            file://ppp_on_boot \
            file://provider \
-           file://0001-ppp-Fix-compilation-errors-in-Makefile.patch \
            file://ppp@.service \
            file://fix-CVE-2015-3310.patch \
-           file://0001-pppoe-include-netinet-in.h-before-linux-in.h.patch \
            file://0001-ppp-Remove-unneeded-include.patch \
-           file://ppp-2.4.7-DES-openssl.patch \
            file://0001-pppd-Fix-bounds-check-in-EAP-code.patch \
-"
+           "
 
 SRC_URI_append_libc-musl = "\
            file://0001-Fix-build-with-musl.patch \
 "
-SRC_URI[md5sum] = "78818f40e6d33a1d1de68a1551f6595a"
-SRC_URI[sha256sum] = "02e0a3dd3e4799e33103f70ec7df75348c8540966ee7c948e4ed8a42bbccfb30"
+SRC_URI[md5sum] = "2ca8342b9804be15103fd3f687af701c"
+SRC_URI[sha256sum] = "f6bf89beae26b2943dff8f1003533d6a5a4909a0fa6edfbec44fe039bbe61bc6"
 
 inherit autotools-brokensep systemd
 
-- 
2.26.2

