Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A469178962
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:03:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:03:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32652005"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:03:21 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:55:59 +0200
Message-Id: <20180309185614.31113-21-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 21/36] net-tools: refresh patches
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
X-List-Received-Date: Fri, 09 Mar 2018 19:03:22 -0000

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
 .../net-tools/net-tools/net-tools-1.60-sctp1.patch | 47 ++++++++++------------
 1 file changed, 22 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp1.patch b/meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp1.patch
index 12eed17af4f..78daf6c3edf 100644
--- a/meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp1.patch
+++ b/meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp1.patch
@@ -11,10 +11,10 @@ Signed-off-by: Li Zhou <li.zhou@windriver.com>
  statistics.c |  68 +++++++++-
  2 files changed, 465 insertions(+), 14 deletions(-)
 
-diff --git a/netstat.c b/netstat.c
-index 1fb9e0c..5d1a4a1 100644
---- a/netstat.c
-+++ b/netstat.c
+Index: net-tools-1.60/netstat.c
+===================================================================
+--- net-tools-1.60.orig/netstat.c
++++ net-tools-1.60/netstat.c
 @@ -58,6 +58,7 @@
   *
   *990420 {1.38} Tuan Hoang              removed a useless assignment from igmp_do_one()
@@ -23,7 +23,7 @@ index 1fb9e0c..5d1a4a1 100644
   *
   *              This program is free software; you can redistribute it
   *              and/or  modify it under  the terms of  the GNU General
-@@ -105,7 +106,7 @@
+@@ -106,7 +107,7 @@
  #endif
  
  /* prototypes for statistics.c */
@@ -32,7 +32,7 @@ index 1fb9e0c..5d1a4a1 100644
  void inittab(void);
  void parsesnmp6(int, int, int);
  void inittab6(void);
-@@ -118,6 +119,28 @@ typedef enum {
+@@ -119,6 +120,28 @@ typedef enum {
      SS_DISCONNECTING		/* in process of disconnecting  */
  } socket_state;
  
@@ -61,7 +61,7 @@ index 1fb9e0c..5d1a4a1 100644
  #define SO_ACCEPTCON    (1<<16)	/* performed a listen           */
  #define SO_WAITDATA     (1<<17)	/* wait data to read            */
  #define SO_NOSPACE      (1<<18)	/* no space to write            */
-@@ -148,6 +171,7 @@ int flag_opt = 0;
+@@ -149,6 +172,7 @@ int flag_opt = 0;
  int flag_raw = 0;
  int flag_tcp = 0;
  int flag_udp = 0;
@@ -69,7 +69,7 @@ index 1fb9e0c..5d1a4a1 100644
  int flag_igmp= 0;
  int flag_rom = 0;
  int flag_exp = 1;
-@@ -990,6 +1014,365 @@ static int udp_info(void)
+@@ -995,6 +1019,365 @@ static int udp_info(void)
  	       udp_do_one);
  }
  
@@ -435,7 +435,7 @@ index 1fb9e0c..5d1a4a1 100644
  static void raw_do_one(int lnr, const char *line)
  {
      char buffer[8192], local_addr[64], rem_addr[64];
-@@ -1549,7 +1932,7 @@ static void usage(void)
+@@ -1558,7 +1941,7 @@ static void usage(void)
      fprintf(stderr, _("        -F, --fib                display Forwarding Information Base (default)\n"));
      fprintf(stderr, _("        -C, --cache              display routing cache instead of FIB\n\n"));
  
@@ -444,7 +444,7 @@ index 1fb9e0c..5d1a4a1 100644
      fprintf(stderr, _("  <AF>=Use '-6|-4' or '-A <af>' or '--<af>'; default: %s\n"), DFLT_AF);
      fprintf(stderr, _("  List of possible address families (which support routing):\n"));
      print_aflist(1); /* 1 = routeable */
-@@ -1574,6 +1957,7 @@ int main
+@@ -1583,6 +1966,7 @@ int main
  	{"protocol", 1, 0, 'A'},
  	{"tcp", 0, 0, 't'},
  	{"udp", 0, 0, 'u'},
@@ -452,7 +452,7 @@ index 1fb9e0c..5d1a4a1 100644
  	{"raw", 0, 0, 'w'},
  	{"unix", 0, 0, 'x'},
  	{"listening", 0, 0, 'l'},
-@@ -1604,7 +1988,7 @@ int main
+@@ -1613,7 +1997,7 @@ int main
      getroute_init();		/* Set up AF routing support */
  
      afname[0] = '\0';
@@ -461,7 +461,7 @@ index 1fb9e0c..5d1a4a1 100644
  	switch (i) {
  	case -1:
  	    break;
-@@ -1696,10 +2080,12 @@ int main
+@@ -1705,10 +2089,12 @@ int main
  	case 't':
  	    flag_tcp++;
  	    break;
@@ -475,7 +475,7 @@ index 1fb9e0c..5d1a4a1 100644
  	case 'w':
  	    flag_raw++;
  	    break;
-@@ -1717,13 +2103,13 @@ int main
+@@ -1726,13 +2112,13 @@ int main
      if (flag_int + flag_rou + flag_mas + flag_sta > 1)
  	usage();
  
@@ -493,7 +493,7 @@ index 1fb9e0c..5d1a4a1 100644
  	+ flag_ax25 + flag_netrom + flag_igmp + flag_x25;
  
      if (flag_mas) {
-@@ -1751,7 +2137,7 @@ int main
+@@ -1760,7 +2146,7 @@ int main
          char buf[256];
          if (!afname[0]) {
              inittab();
@@ -502,7 +502,7 @@ index 1fb9e0c..5d1a4a1 100644
          } else {
              safe_strncpy(buf, afname, sizeof(buf));
              tmp1 = buf;
-@@ -1804,7 +2190,7 @@ int main
+@@ -1815,7 +2201,7 @@ int main
  	return (i);
      }
      for (;;) {
@@ -511,7 +511,7 @@ index 1fb9e0c..5d1a4a1 100644
  #if HAVE_AFINET
  	    prg_cache_load();
  	    printf(_("Active Internet connections "));	/* xxx */
-@@ -1843,6 +2229,11 @@ int main
+@@ -1854,6 +2240,11 @@ int main
  	    if (i)
  		return (i);
  	}
@@ -523,10 +523,10 @@ index 1fb9e0c..5d1a4a1 100644
  	if (!flag_arg || flag_raw) {
  	    i = raw_info();
  	    if (i)
-diff --git a/statistics.c b/statistics.c
-index 03600d7..eb8d7dc 100644
---- a/statistics.c
-+++ b/statistics.c
+Index: net-tools-1.60/statistics.c
+===================================================================
+--- net-tools-1.60.orig/statistics.c
++++ net-tools-1.60/statistics.c
 @@ -21,7 +21,7 @@
  #define UFWARN(x)
  #endif
@@ -537,7 +537,7 @@ index 03600d7..eb8d7dc 100644
  enum State {
      number = 0, opt_number, i_forward, i_inp_icmp, i_outp_icmp, i_rto_alg,
 @@ -297,6 +297,27 @@ struct entry Tcpexttab[] =
-     { "TCPRenoRecoveryFail", N_("%u classic Reno fast retransmits failed"), opt_number },
+     { "TCPRenoRecoveryFail", N_("%llu classic Reno fast retransmits failed"), opt_number },
  };
  
 +struct entry Sctptab[] =
@@ -616,7 +616,7 @@ index 03600d7..eb8d7dc 100644
      f = proc_fopen("/proc/net/snmp");
      if (!f) {
  	perror(_("cannot open /proc/net/snmp"));
-@@ -530,6 +580,16 @@ void parsesnmp(int flag_raw, int flag_tcp, int flag_udp)
+@@ -530,6 +580,16 @@ void parsesnmp(int flag_raw, int flag_tc
      
          fclose(f);
      }
@@ -633,6 +633,3 @@ index 03600d7..eb8d7dc 100644
      return;
  }
      
--- 
-1.8.5.2.233.g932f7e4
-
-- 
2.16.1


