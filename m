Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.web11.411.1592848884901696024
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TzhQUlYX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.68, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f68.google.com with SMTP id g5so13798416otg.6
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=aYqKt+GMrfomiPO5KMSbwnZdfK7APvBRbyJwMfcj/5A=;
        b=TzhQUlYXRkYoxEqsbcE8vReVJ1+VIxhUiSyOwlmP/8s6RRGrWynG1Vq+TEwuxkTUh9
         vMVazuSpp3Eyt1UJDrBkbumFv17yFBinBh7ww2BntKck/YT1LDviyM6lJHPOrS9dntBm
         P+QW268Lrq3FrJQXXLsatxmqccsKR79FL/R/vFFnfrfvQdIV/5mFHHPopr5jOHWh9VV8
         OdFbgUMq6LqyMO5jUGZzAsy4FNvDjQAPYNuRVsUuYeSDI2tY/JXLgXwMo8wYkmXHUAwX
         Gy+YM85UT5KtK2ayltPLb2wJztHfR+1hKkWuuLfvNQWmBesP1y27ulTxioPGcARa96rh
         UjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=aYqKt+GMrfomiPO5KMSbwnZdfK7APvBRbyJwMfcj/5A=;
        b=QvMgn5GgmLWQfFdC93qGUUfuEb8Jgr2MSFLYaXxwp3t+nGcjuUZoNf2JrFePtkU5+V
         +ivS+2I61FT7zLvec60vSaGEXBieJsbSzpe8Dv452jhjn10qUVl8BlTeCLzUVYjWIM5t
         G1m4S3ub4OT1tYIliy8HWYkum+HjMtL4xXyEca/v+VWYN58MgZudDQmwYx82F6Ui9i/R
         hGLH720ohG0X8Y1z6Hszg9uTI66CBy7VsuLm6+YUeA2tywFRtlwuyV2Ff9wYdOxYHcAi
         7Ssb7G//hZIHgFB7wUalJgIodXJyCb1RT+rcZk6xatE8R8Fyz3tqJqIEtqSxWeVczpyT
         985g==
X-Gm-Message-State: AOAM5337IzbywgkHLpuEmygy2sjFE9z/jw2MiV26SHefH+DX2oscGggR
	w332v+0Ji9K4YDhhkpFl7uFmGOKzxEC/rA==
X-Google-Smtp-Source: ABdhPJwfZKqPkcAW/RaqlcfhHTLM9d/iv82oZuuzQx1m9OU7J2aQfuZkpbuecedP1H/jdw5IAPyfEA==
X-Received: by 2002:a05:6830:1e61:: with SMTP id m1mr14273267otr.42.1592848883079;
        Mon, 22 Jun 2020 11:01:23 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.11.01.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 11:01:22 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 24/33] net-tools: backport a patch from upstream to use the same ifconfig format as debian/ubuntu
Date: Mon, 22 Jun 2020 07:58:18 -1000
Message-Id: <fa7d8a3d5d1e68363b20c2ea0ba645a1028d225b.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* this is needed for python3-ifcfg to parse it correctly
  https://github.com/ftao/python-ifcfg/issues/43
* backport this single patch, so it can be backported to dunfell
  then for master we should upgrade to new snapshot from debian
  which includes other fixes and improvements as well
* this is already part of net-tools_1.60-26.diff from debian we're using
  but it's first added there and then removed
  $ grep 'sprintf(flags' net-tools_1.60-26.diff
  ++    sprintf(flags, "flags=%d<", ptr->flags);
  +-    sprintf(flags, "flags=%d<", ptr->flags);

* before:
root@qemux86-64:~# ifconfig
eth0      Link encap:Ethernet  HWaddr 52:54:00:12:34:02
          inet addr:192.168.7.2  Bcast:192.168.7.255  Mask:255.255.255.0
          inet6 addr: fe80::5054:ff:fe12:3402/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:6 errors:0 dropped:0 overruns:0 frame:0
          TX packets:106 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:496 (496.0 B)  TX bytes:42832 (41.8 KiB)

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:846 errors:0 dropped:0 overruns:0 frame:0
          TX packets:846 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:53364 (52.1 KiB)  TX bytes:53364 (52.1 KiB)

* after:

root@qemux86-64:~# ifconfig
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500  metric 1
        inet 192.168.7.2  netmask 255.255.255.0  broadcast 192.168.7.255
        inet6 fe80::5054:ff:fe12:3402  prefixlen 64  scopeid 0x20<link>
        ether 52:54:00:12:34:02  txqueuelen 1000  (Ethernet)
        RX packets 6  bytes 496 (496.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 14  bytes 2140 (2.0 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536  metric 1
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 80  bytes 6080 (5.9 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 80  bytes 6080 (5.9 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

* for comparison ubuntu-20.04 in docker:

root@dafcbbf25ff2:/# ifconfig
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 172.17.0.2  netmask 255.255.0.0  broadcast 172.17.255.255
        ether 02:42:ac:11:00:02  txqueuelen 0  (Ethernet)
        RX packets 39299  bytes 89614740 (89.6 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 33767  bytes 3807354 (3.8 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 5658  bytes 1294220 (1.2 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 5658  bytes 1294220 (1.2 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

* python3-ifcfg now parses flags correctly:
root@qemux86-64:~# python3 -m ifcfg.cli | python3 -m json.tool
{
    "eth0": {
        "inet": "192.168.7.2",
        "inet4": [
            "192.168.7.2"
        ],
        "ether": "52:54:00:12:34:02",
        "inet6": [
            "fe80::5054:ff:fe12:3402"
        ],
        "netmask": "255.255.255.0",
        "device": "eth0",
        "flags": "4163<UP,BROADCAST,RUNNING,MULTICAST> ",
        "mtu": "1500",
        "broadcast": "192.168.7.255"
    },
    "lo": {
        "inet": "127.0.0.1",
        "inet4": [
            "127.0.0.1"
        ],
        "ether": null,
        "inet6": [
            "::1"
        ],
        "netmask": "255.0.0.0",
        "device": "lo",
        "flags": "73<UP,LOOPBACK,RUNNING> ",
        "mtu": "65536"
    },
    "sit0": {
        "inet": null,
        "inet4": [],
        "ether": null,
        "inet6": [],
        "netmask": null,
        "device": "sit0",
        "flags": "128<NOARP> ",
        "mtu": "1480"
    }
}

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dacfd695061b186240a85f8ffc43e6636c56e1fb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-to-unsigned-long-long-constants-to-.patch | 381 ++++++++++++++++++
 .../net-tools/net-tools_1.60-26.bb            |   1 +
 2 files changed, 382 insertions(+)
 create mode 100644 meta/recipes-extended/net-tools/net-tools/0001-added-ull-prefix-to-unsigned-long-long-constants-to-.patch

diff --git a/meta/recipes-extended/net-tools/net-tools/0001-added-ull-prefix-to-unsigned-long-long-constants-to-.patch b/meta/recipes-extended/net-tools/net-tools/0001-added-ull-prefix-to-unsigned-long-long-constants-to-.patch
new file mode 100644
index 0000000000..523d434b7c
--- /dev/null
+++ b/meta/recipes-extended/net-tools/net-tools/0001-added-ull-prefix-to-unsigned-long-long-constants-to-.patch
@@ -0,0 +1,381 @@
+From eb04ef31571f6c707eacaba6846feeebfab518e6 Mon Sep 17 00:00:00 2001
+From: Bernd Eckenfels <net-tools@lina.inka.de>
+Date: Thu, 29 May 2003 02:09:14 +0000
+Subject: [PATCH] added 'ull' prefix to unsigned long long constants to make
+ gcc 3.3 happy
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Upstream-Status: Backport [https://sourceforge.net/p/net-tools/code/ci/eb04ef31571f6c707eacaba6846feeebfab518e6]
+---
+ lib/interface.c | 299 ++++++++++++++++++++++++++----------------------
+ 1 file changed, 161 insertions(+), 138 deletions(-)
+
+diff -uNr net-tools-1.60.orig/lib/interface.c net-tools-1.60/lib/interface.c
+--- net-tools-1.60.orig/lib/interface.c	2020-06-16 10:04:16.308411879 +0000
++++ net-tools-1.60/lib/interface.c	2020-06-16 10:05:15.697264291 +0000
+@@ -23,7 +23,6 @@
+ #include <string.h>
+ #include <unistd.h>
+ #include <ctype.h>
+-#include <string.h>
+ 
+ #if HAVE_AFIPX
+ #if (__GLIBC__ > 2) || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1)
+@@ -654,6 +653,8 @@
+     const char *Rext = "B";
+     const char *Text = "B";
+ 
++    static char flags[200];
++
+ #if HAVE_AFIPX
+     static struct aftype *ipxtype = NULL;
+ #endif
+@@ -685,32 +686,68 @@
+     if (hw == NULL)
+ 	hw = get_hwntype(-1);
+ 
+-    printf(_("%-9s Link encap:%s  "), ptr->name, hw->title);
+-    /* For some hardware types (eg Ash, ATM) we don't print the 
+-       hardware address if it's null.  */
+-    if (hw->print != NULL && (! (hw_null_address(hw, ptr->hwaddr) &&
+-				  hw->suppress_null_addr)))
+-	printf(_("HWaddr %s  "), hw->print(ptr->hwaddr));
+-#ifdef IFF_PORTSEL
+-    if (ptr->flags & IFF_PORTSEL) {
+-	printf(_("Media:%s"), if_port_text[ptr->map.port][0]);
+-	if (ptr->flags & IFF_AUTOMEDIA)
+-	    printf(_("(auto)"));
+-    }
++    sprintf(flags, "flags=%d<", ptr->flags);
++    /* DONT FORGET TO ADD THE FLAGS IN ife_print_short, too */
++    if (ptr->flags == 0)
++       strcat(flags,">");
++    if (ptr->flags & IFF_UP)
++       strcat(flags,_("UP,"));
++    if (ptr->flags & IFF_BROADCAST)
++       strcat(flags,_("BROADCAST,"));
++    if (ptr->flags & IFF_DEBUG)
++       strcat(flags,_("DEBUG,"));
++    if (ptr->flags & IFF_LOOPBACK)
++       strcat(flags,_("LOOPBACK,"));
++    if (ptr->flags & IFF_POINTOPOINT)
++       strcat(flags,_("POINTOPOINT,"));
++    if (ptr->flags & IFF_NOTRAILERS)
++       strcat(flags,_("NOTRAILERS,"));
++    if (ptr->flags & IFF_RUNNING)
++       strcat(flags,_("RUNNING,"));
++    if (ptr->flags & IFF_NOARP)
++       strcat(flags,_("NOARP,"));
++    if (ptr->flags & IFF_PROMISC)
++       strcat(flags,_("PROMISC,"));
++    if (ptr->flags & IFF_ALLMULTI)
++       strcat(flags,_("ALLMULTI,"));
++    if (ptr->flags & IFF_SLAVE)
++       strcat(flags,_("SLAVE,"));
++    if (ptr->flags & IFF_MASTER)
++       strcat(flags,_("MASTER,"));
++    if (ptr->flags & IFF_MULTICAST)
++       strcat(flags,_("MULTICAST,"));
++#ifdef HAVE_DYNAMIC
++    if (ptr->flags & IFF_DYNAMIC)
++       strcat(flags,_("DYNAMIC,"));
++#endif
++    /* DONT FORGET TO ADD THE FLAGS IN ife_print_short */
++    if (flags[strlen(flags)-1] == ',')
++      flags[strlen(flags)-1] = '>';
++    else
++      flags[strlen(flags)-1] = 0;
++      
++
++    printf(_("%s: %s  mtu %d  metric %d"),
++          ptr->name, flags, ptr->mtu, ptr->metric ? ptr->metric : 1);
++#ifdef SIOCSKEEPALIVE
++    if (ptr->outfill || ptr->keepalive)
++       printf(_("  outfill %d  keepalive %d"),
++              ptr->outfill, ptr->keepalive);
+ #endif
+     printf("\n");
+ 
+ #if HAVE_AFINET
+     if (ptr->has_ip) {
+-	printf(_("          %s addr:%s "), ap->name,
++        printf(_("        %s %s"), ap->name,
+ 	       ap->sprint(&ptr->addr, 1));
+-	if (ptr->flags & IFF_POINTOPOINT) {
+-	    printf(_(" P-t-P:%s "), ap->sprint(&ptr->dstaddr, 1));
+-	}
++        printf(_("  netmask %s"), ap->sprint(&ptr->netmask, 1));
+ 	if (ptr->flags & IFF_BROADCAST) {
+-	    printf(_(" Bcast:%s "), ap->sprint(&ptr->broadaddr, 1));
++            printf(_("  broadcast %s"), ap->sprint(&ptr->broadaddr, 1));
+ 	}
+-	printf(_(" Mask:%s\n"), ap->sprint(&ptr->netmask, 1));
++       if (ptr->flags & IFF_POINTOPOINT) {
++           printf(_("  destination %s"), ap->sprint(&ptr->dstaddr, 1));
++       }
++       printf("\n");
+     }
+ #endif
+ 
+@@ -727,29 +764,30 @@
+ 			addr6p[0], addr6p[1], addr6p[2], addr6p[3],
+ 			addr6p[4], addr6p[5], addr6p[6], addr6p[7]);
+ 		inet6_aftype.input(1, addr6, (struct sockaddr *) &sap);
+-		printf(_("          inet6 addr: %s/%d"),
+-		 inet6_aftype.sprint((struct sockaddr *) &sap, 1), plen);
+-		printf(_(" Scope:"));
+-		switch (scope) {
+-		case 0:
+-		    printf(_("Global"));
+-		    break;
+-		case IPV6_ADDR_LINKLOCAL:
+-		    printf(_("Link"));
+-		    break;
+-		case IPV6_ADDR_SITELOCAL:
+-		    printf(_("Site"));
+-		    break;
+-		case IPV6_ADDR_COMPATv4:
+-		    printf(_("Compat"));
+-		    break;
+-		case IPV6_ADDR_LOOPBACK:
+-		    printf(_("Host"));
+-		    break;
+-		default:
+-		    printf(_("Unknown"));
++		printf(_("        %s %s  prefixlen %d"),
++			inet6_aftype.name, 
++			inet6_aftype.sprint((struct sockaddr *) &sap, 1), 
++			plen);
++		printf(_("  scopeid 0x%x"), scope);
++
++		flags[0] = '<'; flags[1] = 0;
++		if (scope & IPV6_ADDR_COMPATv4) {
++		    	strcat(flags, _("compat,"));
++		    	scope -= IPV6_ADDR_COMPATv4;
+ 		}
+-		printf("\n");
++		if (scope == 0)
++			strcat(flags, _("global,"));
++		if (scope & IPV6_ADDR_LINKLOCAL)
++			strcat(flags, _("link,"));
++		if (scope & IPV6_ADDR_SITELOCAL)
++			strcat(flags, _("site,"));
++		if (scope & IPV6_ADDR_LOOPBACK)
++			strcat(flags, _("host,"));
++		if (flags[strlen(flags)-1] == ',')
++			flags[strlen(flags)-1] = '>';
++		else
++			flags[strlen(flags)-1] = 0;
++		printf("%s\n", flags);
+ 	    }
+ 	}
+ 	fclose(f);
+@@ -762,17 +800,17 @@
+ 
+     if (ipxtype != NULL) {
+ 	if (ptr->has_ipx_bb)
+-	    printf(_("          IPX/Ethernet II addr:%s\n"),
+-		   ipxtype->sprint(&ptr->ipxaddr_bb, 1));
++	    printf(_("        %s Ethernet-II   %s\n"),
++		   ipxtype->name, ipxtype->sprint(&ptr->ipxaddr_bb, 1));
+ 	if (ptr->has_ipx_sn)
+-	    printf(_("          IPX/Ethernet SNAP addr:%s\n"),
+-		   ipxtype->sprint(&ptr->ipxaddr_sn, 1));
++	    printf(_("        %s Ethernet-SNAP %s\n"),
++		   ipxtype->name, ipxtype->sprint(&ptr->ipxaddr_sn, 1));
+ 	if (ptr->has_ipx_e2)
+-	    printf(_("          IPX/Ethernet 802.2 addr:%s\n"),
+-		   ipxtype->sprint(&ptr->ipxaddr_e2, 1));
++	    printf(_("        %s Ethernet802.2 %s\n"),
++		   ipxtype->name, ipxtype->sprint(&ptr->ipxaddr_e2, 1));
+ 	if (ptr->has_ipx_e3)
+-	    printf(_("          IPX/Ethernet 802.3 addr:%s\n"),
+-		   ipxtype->sprint(&ptr->ipxaddr_e3, 1));
++	    printf(_("        %s Ethernet802.3 %s\n"),
++		   ipxtype->name, ipxtype->sprint(&ptr->ipxaddr_e3, 1));
+     }
+ #endif
+ 
+@@ -781,7 +819,7 @@
+ 	ddptype = get_afntype(AF_APPLETALK);
+     if (ddptype != NULL) {
+ 	if (ptr->has_ddp)
+-	    printf(_("          EtherTalk Phase 2 addr:%s\n"), ddptype->sprint(&ptr->ddpaddr, 1));
++	    printf(_("        %s %s\n"), ddptype->name, ddptype->sprint(&ptr->ddpaddr, 1));
+     }
+ #endif
+ 
+@@ -790,53 +828,30 @@
+ 	ectype = get_afntype(AF_ECONET);
+     if (ectype != NULL) {
+ 	if (ptr->has_econet)
+-	    printf(_("          econet addr:%s\n"), ectype->sprint(&ptr->ecaddr, 1));
++	    printf(_("        %s %s\n"), ectype->name, ectype->sprint(&ptr->ecaddr, 1));
+     }
+ #endif
+ 
+-    printf("          ");
+-    /* DONT FORGET TO ADD THE FLAGS IN ife_print_short, too */
+-    if (ptr->flags == 0)
+-	printf(_("[NO FLAGS] "));
+-    if (ptr->flags & IFF_UP)
+-	printf(_("UP "));
+-    if (ptr->flags & IFF_BROADCAST)
+-	printf(_("BROADCAST "));
+-    if (ptr->flags & IFF_DEBUG)
+-	printf(_("DEBUG "));
+-    if (ptr->flags & IFF_LOOPBACK)
+-	printf(_("LOOPBACK "));
+-    if (ptr->flags & IFF_POINTOPOINT)
+-	printf(_("POINTOPOINT "));
+-    if (ptr->flags & IFF_NOTRAILERS)
+-	printf(_("NOTRAILERS "));
+-    if (ptr->flags & IFF_RUNNING)
+-	printf(_("RUNNING "));
+-    if (ptr->flags & IFF_NOARP)
+-	printf(_("NOARP "));
+-    if (ptr->flags & IFF_PROMISC)
+-	printf(_("PROMISC "));
+-    if (ptr->flags & IFF_ALLMULTI)
+-	printf(_("ALLMULTI "));
+-    if (ptr->flags & IFF_SLAVE)
+-	printf(_("SLAVE "));
+-    if (ptr->flags & IFF_MASTER)
+-	printf(_("MASTER "));
+-    if (ptr->flags & IFF_MULTICAST)
+-	printf(_("MULTICAST "));
+-#ifdef HAVE_DYNAMIC
+-    if (ptr->flags & IFF_DYNAMIC)
+-	printf(_("DYNAMIC "));
+-#endif
+-    /* DONT FORGET TO ADD THE FLAGS IN ife_print_short */
+-    printf(_(" MTU:%d  Metric:%d"),
+-	   ptr->mtu, ptr->metric ? ptr->metric : 1);
+-#ifdef SIOCSKEEPALIVE
+-    if (ptr->outfill || ptr->keepalive)
+-	printf(_("  Outfill:%d  Keepalive:%d"),
+-	       ptr->outfill, ptr->keepalive);
++    /* For some hardware types (eg Ash, ATM) we don't print the 
++       hardware address if it's null.  */
++    if (hw->print != NULL && (! (hw_null_address(hw, ptr->hwaddr) &&
++				  hw->suppress_null_addr)))
++	printf(_("        %s %s"), hw->name, hw->print(ptr->hwaddr));
++    else
++	printf(_("        %s"), hw->name);
++    if (ptr->tx_queue_len != -1)
++    	printf(_("  txqueuelen %d"), ptr->tx_queue_len);
++    printf("  (%s)\n", hw->title);
++
++#ifdef IFF_PORTSEL
++    if (ptr->flags & IFF_PORTSEL) {
++	printf(_("        media %s"), if_port_text[ptr->map.port][0]);
++	if (ptr->flags & IFF_AUTOMEDIA)
++	    printf(_("autoselect"));
++    	printf("\n");
++    }
+ #endif
+-    printf("\n");
++
+ 
+     /* If needed, display the interface statistics. */
+ 
+@@ -845,19 +860,9 @@
+ 	 *      not for the aliases, although strictly speaking they're shared
+ 	 *      by all addresses.
+ 	 */
+-	printf("          ");
+-
+-	printf(_("RX packets:%llu errors:%lu dropped:%lu overruns:%lu frame:%lu\n"),
+-	       ptr->stats.rx_packets, ptr->stats.rx_errors,
+-	       ptr->stats.rx_dropped, ptr->stats.rx_fifo_errors,
+-	       ptr->stats.rx_frame_errors);
+-	if (can_compress)
+-	    printf(_("             compressed:%lu\n"), ptr->stats.rx_compressed);
+ 
+ 	rx = ptr->stats.rx_bytes;  
+-	tx = ptr->stats.tx_bytes;
+ 	short_rx = rx * 10;  
+-	short_tx = tx * 10;
+ 	if (rx > 1125899906842624ull) {
+ 	    short_rx /= 1125899906842624ull;
+ 	    Rext = "PiB";
+@@ -874,6 +879,8 @@
+ 	    short_rx /= 1024;
+ 	    Rext = "KiB";
+ 	}
++        tx = ptr->stats.tx_bytes;
++        short_tx = tx * 10;
+ 	if (tx > 1125899906842624ull) {
+ 	    short_tx /= 1125899906842624ull;
+ 	    Text = "PiB";
+@@ -891,37 +898,50 @@
+ 	    Text = "KiB";
+ 	}
+ 
+-	printf("          ");
+-	printf(_("TX packets:%llu errors:%lu dropped:%lu overruns:%lu carrier:%lu\n"),
+-	       ptr->stats.tx_packets, ptr->stats.tx_errors,
+-	       ptr->stats.tx_dropped, ptr->stats.tx_fifo_errors,
+-	       ptr->stats.tx_carrier_errors);
+-	printf(_("          collisions:%lu "), ptr->stats.collisions);
+-	if (can_compress)
+-	    printf(_("compressed:%lu "), ptr->stats.tx_compressed);
+-	if (ptr->tx_queue_len != -1)
+-	    printf(_("txqueuelen:%d "), ptr->tx_queue_len);
+-	printf("\n          ");
+-	printf(_("RX bytes:%llu (%lu.%lu %s)  TX bytes:%llu (%lu.%lu %s)\n"),
++	printf("        ");
++	printf(_("RX packets %llu  bytes %llu (%lu.%lu %s)\n"), 
++		ptr->stats.rx_packets, 
+ 	       rx, (unsigned long)(short_rx / 10), 
+-	       (unsigned long)(short_rx % 10), Rext, 
+-	       tx, (unsigned long)(short_tx / 10), 
+-	       (unsigned long)(short_tx % 10), Text);
++	       (unsigned long)(short_rx % 10), Rext);
++	if (can_compress) {
++  	    printf("        ");
++	    printf(_("RX compressed:%lu\n"), ptr->stats.rx_compressed);
++	}
++	printf("        ");
++	printf(_("RX errors %lu  dropped %lu  overruns %lu  frame %lu\n"),
++	       ptr->stats.rx_errors, ptr->stats.rx_dropped, 
++	       ptr->stats.rx_fifo_errors, ptr->stats.rx_frame_errors);
++
++
++	printf("        ");
++	printf(_("TX packets %llu  bytes %llu (%lu.%lu %s)\n"),
++		ptr->stats.tx_packets, 
++	        tx, (unsigned long)(short_tx / 10), 
++	        (unsigned long)(short_tx % 10), Text);
++	if (can_compress) {
++  	    printf("        ");
++	    printf(_("TX compressed %lu\n"), ptr->stats.tx_compressed);
++	}
++	printf("        ");
++	printf(_("TX errors %lu  dropped %lu overruns %lu  carrier %lu  collisions %lu\n"),
++	       ptr->stats.tx_errors,
++	       ptr->stats.tx_dropped, ptr->stats.tx_fifo_errors,
++	       ptr->stats.tx_carrier_errors, ptr->stats.collisions);
+     }
+ 
+     if ((ptr->map.irq || ptr->map.mem_start || ptr->map.dma ||
+ 	 ptr->map.base_addr >= 0x100)) {
+-	printf("          ");
++	printf("        device ");
+ 	if (ptr->map.irq)
+-	    printf(_("Interrupt:%d "), ptr->map.irq);
++	    printf(_("interrupt %d  "), ptr->map.irq);
+ 	if (ptr->map.base_addr >= 0x100)	/* Only print devices using it for 
+ 						   I/O maps */
+-	    printf(_("Base address:0x%x "), ptr->map.base_addr);
++	    printf(_("base 0x%x  "), ptr->map.base_addr);
+ 	if (ptr->map.mem_start) {
+-	    printf(_("Memory:%lx-%lx "), ptr->map.mem_start, ptr->map.mem_end);
++	    printf(_("memory 0x%lx-%lx  "), ptr->map.mem_start, ptr->map.mem_end);
+ 	}
+ 	if (ptr->map.dma)
+-	    printf(_("DMA chan:%x "), ptr->map.dma);
++	    printf(_("  dma 0x%x"), ptr->map.dma);
+ 	printf("\n");
+     }
+     printf("\n");
diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index 5a376e72f0..8bd30fc6d9 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/
            file://net-tools-1.60-sctp3-addrs.patch \
            file://0001-lib-inet6.c-INET6_rresolve-various-fixes.patch \
            file://net-tools-fix-building-with-linux-4.8.patch \
+           file://0001-added-ull-prefix-to-unsigned-long-long-constants-to-.patch \
           "
 
 # for this package we're mostly interested in tracking debian patches,
-- 
2.17.1

