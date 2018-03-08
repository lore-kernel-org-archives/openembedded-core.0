Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6514D78A25
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24054062"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:35 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:57 +0200
Message-Id: <20180308181804.31261-35-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 35/42] ppp: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:35 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-connectivity/ppp/ppp/cifdefroute.patch | 71 ++++++++++++----------
 .../ppp/makefile-remove-hard-usr-reference.patch   | 15 ++---
 2 files changed, 46 insertions(+), 40 deletions(-)

diff --git a/meta/recipes-connectivity/ppp/ppp/cifdefroute.patch b/meta/recipes-connectivity/ppp/ppp/cifdefroute.patch
index db4dbc27a97..7dd69d8f4d8 100644
--- a/meta/recipes-connectivity/ppp/ppp/cifdefroute.patch
+++ b/meta/recipes-connectivity/ppp/ppp/cifdefroute.patch
@@ -4,10 +4,11 @@ Rebased it to fit ppp-2.4.5. Dongxiao Xu <dongxiao.xu@intel.com>
 
 Upstream-Status: Inappropriate [debian/suse patches]
 
-diff -urN ppp-2.4.5-orig/pppd/ipcp.c ppp-2.4.5/pppd/ipcp.c
---- ppp-2.4.5-orig/pppd/ipcp.c	2010-06-30 15:51:12.050166398 +0800
-+++ ppp-2.4.5/pppd/ipcp.c	2010-06-30 16:40:00.478716855 +0800
-@@ -198,6 +198,16 @@
+Index: ppp-2.4.7/pppd/ipcp.c
+===================================================================
+--- ppp-2.4.7.orig/pppd/ipcp.c
++++ ppp-2.4.7/pppd/ipcp.c
+@@ -198,6 +198,16 @@ static option_t ipcp_option_list[] = {
        "disable defaultroute option", OPT_ALIAS | OPT_A2CLR,
        &ipcp_wantoptions[0].default_route },
  
@@ -24,7 +25,7 @@ diff -urN ppp-2.4.5-orig/pppd/ipcp.c ppp-2.4.5/pppd/ipcp.c
      { "proxyarp", o_bool, &ipcp_wantoptions[0].proxy_arp,
        "Add proxy ARP entry", OPT_ENABLE|1, &ipcp_allowoptions[0].proxy_arp },
      { "noproxyarp", o_bool, &ipcp_allowoptions[0].proxy_arp,
-@@ -271,7 +281,7 @@
+@@ -271,7 +281,7 @@ struct protent ipcp_protent = {
      ip_active_pkt
  };
  
@@ -33,7 +34,7 @@ diff -urN ppp-2.4.5-orig/pppd/ipcp.c ppp-2.4.5/pppd/ipcp.c
  static void ipcp_script __P((char *, int));	/* Run an up/down script */
  static void ipcp_script_done __P((void *));
  
-@@ -1742,7 +1752,12 @@
+@@ -1761,7 +1771,12 @@ ip_demand_conf(u)
      if (!sifnpmode(u, PPP_IP, NPMODE_QUEUE))
  	return 0;
      if (wo->default_route)
@@ -46,7 +47,7 @@ diff -urN ppp-2.4.5-orig/pppd/ipcp.c ppp-2.4.5/pppd/ipcp.c
  	    default_route_set[u] = 1;
      if (wo->proxy_arp)
  	if (sifproxyarp(u, wo->hisaddr))
-@@ -1830,7 +1845,8 @@
+@@ -1849,7 +1864,8 @@ ipcp_up(f)
       */
      if (demand) {
  	if (go->ouraddr != wo->ouraddr || ho->hisaddr != wo->hisaddr) {
@@ -56,7 +57,7 @@ diff -urN ppp-2.4.5-orig/pppd/ipcp.c ppp-2.4.5/pppd/ipcp.c
  	    if (go->ouraddr != wo->ouraddr) {
  		warn("Local IP address changed to %I", go->ouraddr);
  		script_setenv("OLDIPLOCAL", ip_ntoa(wo->ouraddr), 0);
-@@ -1855,7 +1871,12 @@
+@@ -1874,7 +1890,12 @@ ipcp_up(f)
  
  	    /* assign a default route through the interface if required */
  	    if (ipcp_wantoptions[f->unit].default_route) 
@@ -69,7 +70,7 @@ diff -urN ppp-2.4.5-orig/pppd/ipcp.c ppp-2.4.5/pppd/ipcp.c
  		    default_route_set[f->unit] = 1;
  
  	    /* Make a proxy ARP entry if requested. */
-@@ -1905,7 +1926,12 @@
+@@ -1924,7 +1945,12 @@ ipcp_up(f)
  
  	/* assign a default route through the interface if required */
  	if (ipcp_wantoptions[f->unit].default_route) 
@@ -82,7 +83,7 @@ diff -urN ppp-2.4.5-orig/pppd/ipcp.c ppp-2.4.5/pppd/ipcp.c
  		default_route_set[f->unit] = 1;
  
  	/* Make a proxy ARP entry if requested. */
-@@ -1983,7 +2009,7 @@
+@@ -2002,7 +2028,7 @@ ipcp_down(f)
  	sifnpmode(f->unit, PPP_IP, NPMODE_DROP);
  	sifdown(f->unit);
  	ipcp_clear_addrs(f->unit, ipcp_gotoptions[f->unit].ouraddr,
@@ -91,7 +92,7 @@ diff -urN ppp-2.4.5-orig/pppd/ipcp.c ppp-2.4.5/pppd/ipcp.c
      }
  
      /* Execute the ip-down script */
-@@ -1999,12 +2025,21 @@
+@@ -2018,12 +2044,21 @@ ipcp_down(f)
   * proxy arp entries, etc.
   */
  static void
@@ -115,10 +116,11 @@ diff -urN ppp-2.4.5-orig/pppd/ipcp.c ppp-2.4.5/pppd/ipcp.c
  	cifproxyarp(unit, hisaddr);
  	proxy_arp_set[unit] = 0;
      }
-diff -urN ppp-2.4.5-orig/pppd/ipcp.h ppp-2.4.5/pppd/ipcp.h
---- ppp-2.4.5-orig/pppd/ipcp.h	2010-06-30 15:51:12.043682063 +0800
-+++ ppp-2.4.5/pppd/ipcp.h	2010-06-30 16:40:49.586203129 +0800
-@@ -70,6 +70,7 @@
+Index: ppp-2.4.7/pppd/ipcp.h
+===================================================================
+--- ppp-2.4.7.orig/pppd/ipcp.h
++++ ppp-2.4.7/pppd/ipcp.h
+@@ -70,6 +70,7 @@ typedef struct ipcp_options {
      bool old_addrs;		/* Use old (IP-Addresses) option? */
      bool req_addr;		/* Ask peer to send IP address? */
      bool default_route;		/* Assign default route through interface? */
@@ -126,10 +128,11 @@ diff -urN ppp-2.4.5-orig/pppd/ipcp.h ppp-2.4.5/pppd/ipcp.h
      bool proxy_arp;		/* Make proxy ARP entry for peer? */
      bool neg_vj;		/* Van Jacobson Compression? */
      bool old_vj;		/* use old (short) form of VJ option? */
-diff -urN ppp-2.4.5-orig/pppd/pppd.8 ppp-2.4.5/pppd/pppd.8
---- ppp-2.4.5-orig/pppd/pppd.8	2010-06-30 15:51:12.043682063 +0800
-+++ ppp-2.4.5/pppd/pppd.8	2010-06-30 16:42:47.102413859 +0800
-@@ -121,6 +121,13 @@
+Index: ppp-2.4.7/pppd/pppd.8
+===================================================================
+--- ppp-2.4.7.orig/pppd/pppd.8
++++ ppp-2.4.7/pppd/pppd.8
+@@ -121,6 +121,13 @@ the gateway, when IPCP negotiation is su
  This entry is removed when the PPP connection is broken.  This option
  is privileged if the \fInodefaultroute\fR option has been specified.
  .TP
@@ -143,7 +146,7 @@ diff -urN ppp-2.4.5-orig/pppd/pppd.8 ppp-2.4.5/pppd/pppd.8
  .B disconnect \fIscript
  Execute the command specified by \fIscript\fR, by passing it to a
  shell, after
-@@ -717,7 +724,12 @@
+@@ -734,7 +741,12 @@ disable both forms of hardware flow cont
  .TP
  .B nodefaultroute
  Disable the \fIdefaultroute\fR option.  The system administrator who
@@ -157,10 +160,11 @@ diff -urN ppp-2.4.5-orig/pppd/pppd.8 ppp-2.4.5/pppd/pppd.8
  can do so by placing this option in the /etc/ppp/options file.
  .TP
  .B nodeflate
-diff -urN ppp-2.4.5-orig/pppd/pppd.h ppp-2.4.5/pppd/pppd.h
---- ppp-2.4.5-orig/pppd/pppd.h	2010-06-30 15:51:12.050166398 +0800
-+++ ppp-2.4.5/pppd/pppd.h	2010-06-30 16:43:36.514148327 +0800
-@@ -643,7 +643,11 @@
+Index: ppp-2.4.7/pppd/pppd.h
+===================================================================
+--- ppp-2.4.7.orig/pppd/pppd.h
++++ ppp-2.4.7/pppd/pppd.h
+@@ -665,7 +665,11 @@ int  sif6addr __P((int, eui64_t, eui64_t
  int  cif6addr __P((int, eui64_t, eui64_t));
  				/* Remove an IPv6 address from i/f */
  #endif
@@ -172,19 +176,20 @@ diff -urN ppp-2.4.5-orig/pppd/pppd.h ppp-2.4.5/pppd/pppd.h
  				/* Create default route through i/f */
  int  cifdefaultroute __P((int, u_int32_t, u_int32_t));
  				/* Delete default route through i/f */
-diff -urN ppp-2.4.5-orig/pppd/sys-linux.c ppp-2.4.5/pppd/sys-linux.c
---- ppp-2.4.5-orig/pppd/sys-linux.c	2010-06-30 15:51:12.050166398 +0800
-+++ ppp-2.4.5/pppd/sys-linux.c	2010-06-30 16:54:00.362716231 +0800
-@@ -206,6 +206,8 @@
- 
+Index: ppp-2.4.7/pppd/sys-linux.c
+===================================================================
+--- ppp-2.4.7.orig/pppd/sys-linux.c
++++ ppp-2.4.7/pppd/sys-linux.c
+@@ -207,6 +207,8 @@ static unsigned char inbuf[512]; /* buff
  static int	if_is_up;	/* Interface has been marked up */
+ static int	if6_is_up;	/* Interface has been marked up for IPv6, to help differentiate */
  static int	have_default_route;	/* Gateway for default route added */
 +static struct rtentry old_def_rt;       /* Old default route */
 +static int       default_rt_repl_rest;  /* replace and restore old default rt */
  static u_int32_t proxy_arp_addr;	/* Addr for proxy arp entry added */
  static char proxy_arp_dev[16];		/* Device for proxy arp entry */
  static u_int32_t our_old_addr;		/* for detecting address changes */
-@@ -1537,6 +1539,9 @@
+@@ -1545,6 +1547,9 @@ static int read_route_table(struct rtent
  	p = NULL;
      }
  
@@ -194,7 +199,7 @@ diff -urN ppp-2.4.5-orig/pppd/sys-linux.c ppp-2.4.5/pppd/sys-linux.c
      SIN_ADDR(rt->rt_dst) = strtoul(cols[route_dest_col], NULL, 16);
      SIN_ADDR(rt->rt_gateway) = strtoul(cols[route_gw_col], NULL, 16);
      SIN_ADDR(rt->rt_genmask) = strtoul(cols[route_mask_col], NULL, 16);
-@@ -1606,20 +1611,51 @@
+@@ -1614,20 +1619,51 @@ int have_route_to(u_int32_t addr)
  /********************************************************************
   *
   * sifdefaultroute - assign a default route through the address given.
@@ -260,7 +265,7 @@ diff -urN ppp-2.4.5-orig/pppd/sys-linux.c ppp-2.4.5/pppd/sys-linux.c
      }
  
      memset (&rt, 0, sizeof (rt));
-@@ -1638,6 +1674,12 @@
+@@ -1646,6 +1682,12 @@ int sifdefaultroute (int unit, u_int32_t
  	    error("default route ioctl(SIOCADDRT): %m");
  	return 0;
      }
@@ -273,7 +278,7 @@ diff -urN ppp-2.4.5-orig/pppd/sys-linux.c ppp-2.4.5/pppd/sys-linux.c
  
      have_default_route = 1;
      return 1;
-@@ -1673,6 +1715,16 @@
+@@ -1681,6 +1723,16 @@ int cifdefaultroute (int unit, u_int32_t
  	    return 0;
  	}
      }
diff --git a/meta/recipes-connectivity/ppp/ppp/makefile-remove-hard-usr-reference.patch b/meta/recipes-connectivity/ppp/ppp/makefile-remove-hard-usr-reference.patch
index d59717ebd3f..8a69396cc71 100644
--- a/meta/recipes-connectivity/ppp/ppp/makefile-remove-hard-usr-reference.patch
+++ b/meta/recipes-connectivity/ppp/ppp/makefile-remove-hard-usr-reference.patch
@@ -6,10 +6,11 @@ Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
 
 Upstream-Status: Inappropriate [configuration]
 
-diff -urN ppp-2.4.5-orig/pppd/Makefile.linux ppp-2.4.5/pppd/Makefile.linux
---- ppp-2.4.5-orig/pppd/Makefile.linux	2010-06-30 15:51:12.043682063 +0800
-+++ ppp-2.4.5/pppd/Makefile.linux	2010-06-30 17:08:21.806363042 +0800
-@@ -117,10 +117,10 @@
+Index: ppp-2.4.7/pppd/Makefile.linux
+===================================================================
+--- ppp-2.4.7.orig/pppd/Makefile.linux
++++ ppp-2.4.7/pppd/Makefile.linux
+@@ -120,10 +120,10 @@ CFLAGS   += -DHAS_SHADOW
  #LIBS     += -lshadow $(LIBS)
  endif
  
@@ -20,9 +21,9 @@ diff -urN ppp-2.4.5-orig/pppd/Makefile.linux ppp-2.4.5/pppd/Makefile.linux
 -endif
 +#endif
  
- ifdef NEEDDES
- ifndef USE_CRYPT
-@@ -169,10 +169,10 @@
+ ifdef USE_LIBUTIL
+ CFLAGS	+= -DHAVE_LOGWTMP=1
+@@ -177,10 +177,10 @@ LIBS	+= -ldl
  endif
  
  ifdef FILTER
-- 
2.16.1


