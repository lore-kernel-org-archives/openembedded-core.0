Return-Path: <Li.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 17F2B760A6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 08:35:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u218ZaoW001254
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Mar 2016 00:35:36 -0800 (PST)
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Tue, 1 Mar 2016 00:35:35 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Mar 2016 16:35:19 +0800
Message-ID: <1456821319-4138-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [PATCH] net-tools: Add SCTP option support
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
X-List-Received-Date: Tue, 01 Mar 2016 08:35:37 -0000
Content-Type: text/plain

Porting three net-tools SCTP related patches from
<https://archive.fedoraproject.org/pub/archive/fedora/linux/releases/
12/Fedora/source/SRPMS/net-tools-1.60-95.fc12.src.rpm> to add support
for SCTP option.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../net-tools/net-tools/net-tools-1.60-sctp1.patch |  638 ++++++++++++++++++++
 .../net-tools/net-tools-1.60-sctp2-quiet.patch     |   28 +
 .../net-tools/net-tools-1.60-sctp3-addrs.patch     |  363 +++++++++++
 .../net-tools/net-tools_1.60-26.bb                 |    5 +-
 4 files changed, 1033 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp1.patch
 create mode 100644 meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp2-quiet.patch
 create mode 100644 meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp3-addrs.patch

diff --git a/meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp1.patch b/meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp1.patch
new file mode 100644
index 0000000..12eed17
--- /dev/null
+++ b/meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp1.patch
@@ -0,0 +1,638 @@
+From 23276afe270009420cfbc52bffafdd25ac0817fe Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Thu, 14 Jan 2016 17:01:29 +0800
+Subject: [PATCH 1/3] net-tools: add SCTP support for netstat
+
+Upstream-Status: pending
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ netstat.c    | 411 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
+ statistics.c |  68 +++++++++-
+ 2 files changed, 465 insertions(+), 14 deletions(-)
+
+diff --git a/netstat.c b/netstat.c
+index 1fb9e0c..5d1a4a1 100644
+--- a/netstat.c
++++ b/netstat.c
+@@ -58,6 +58,7 @@
+  *
+  *990420 {1.38} Tuan Hoang              removed a useless assignment from igmp_do_one()
+  *20010404 {1.39} Arnaldo Carvalho de Melo - use setlocale
++ *20050516 {1.40} Ivan Skytte Joergensen:Added SCTP support
+  *
+  *              This program is free software; you can redistribute it
+  *              and/or  modify it under  the terms of  the GNU General
+@@ -105,7 +106,7 @@
+ #endif
+ 
+ /* prototypes for statistics.c */
+-void parsesnmp(int, int, int);
++void parsesnmp(int, int, int, int);
+ void inittab(void);
+ void parsesnmp6(int, int, int);
+ void inittab6(void);
+@@ -118,6 +119,28 @@ typedef enum {
+     SS_DISCONNECTING		/* in process of disconnecting  */
+ } socket_state;
+ 
++#define SCTP_NSTATES  9         /* The number of states in array*/
++
++static const char *sctp_state[] = {
++    N_("EMPTY"),
++    N_("CLOSED"),
++    N_("COOKIE_WAIT"),
++    N_("COOKIE_ECHOED"),
++    N_("ESTABLISHED"),
++    N_("SHUTDOWN_PENDING"),
++    N_("SHUTDOWN_SENT"),
++    N_("SHUTDOWN_RECEIVED"),
++    N_("SHUTDOWN_ACK_SENT")
++};
++
++#define SCTP_NTYPES 3           /* The number of types in array */
++
++static const char *sctp_type[] = {
++    N_("udp"),
++    N_("udp-high-bw"),
++    N_("tcp")
++};
++
+ #define SO_ACCEPTCON    (1<<16)	/* performed a listen           */
+ #define SO_WAITDATA     (1<<17)	/* wait data to read            */
+ #define SO_NOSPACE      (1<<18)	/* no space to write            */
+@@ -148,6 +171,7 @@ int flag_opt = 0;
+ int flag_raw = 0;
+ int flag_tcp = 0;
+ int flag_udp = 0;
++int flag_sctp= 0;
+ int flag_igmp= 0;
+ int flag_rom = 0;
+ int flag_exp = 1;
+@@ -990,6 +1014,365 @@ static int udp_info(void)
+ 	       udp_do_one);
+ }
+ 
++static const char *sctp_socket_type_str(int type) {
++    if(type>=0 && type<SCTP_NTYPES)
++	return sctp_type[type];
++    else {
++	static char type_str_buf[64];
++	sprintf(type_str_buf,"UNKNOWN(%d)",type);
++	return type_str_buf;
++    }
++}
++
++static const char *sctp_state_str(int state)
++{
++    if(state>=0 && state<SCTP_NSTATES)
++	return sctp_state[state];
++    else {
++	static char state_str_buf[64];
++	sprintf(state_str_buf,"UNKNOWN(%d)",state);
++	return state_str_buf;
++    }
++}
++
++static const char *sctp_socket_state_str(int state)
++{
++    if(state>=0 && state<=10)
++        return tcp_state[state];
++    else {
++	static char state_str_buf[64];
++	sprintf(state_str_buf,"UNKNOWN(%d)",state);
++	return state_str_buf;
++    }
++}
++
++static struct aftype *process_sctp_addr_str(const char *addr_str, struct sockaddr *sa)
++{
++    if (strchr(addr_str,':')) {
++#if HAVE_AFINET6
++	extern struct aftype inet6_aftype;
++	/* Demangle what the kernel gives us */
++	struct in6_addr in6;
++	char addr6_str[INET6_ADDRSTRLEN];
++	unsigned u0,u1,u2,u3,u4,u5,u6,u7;
++	sscanf(addr_str, "%04X:%04X:%04X:%04X:%04X:%04X:%04X:%04X",
++	       &u0, &u1, &u2, &u3, &u4, &u5, &u6, &u7);
++	in6.s6_addr16[0] = htons(u0);
++	in6.s6_addr16[1] = htons(u1);
++	in6.s6_addr16[2] = htons(u2);
++	in6.s6_addr16[3] = htons(u3);
++	in6.s6_addr16[4] = htons(u4);
++	in6.s6_addr16[5] = htons(u5);
++	in6.s6_addr16[6] = htons(u6);
++	in6.s6_addr16[7] = htons(u7);
++
++	inet_ntop(AF_INET6, &in6, addr6_str, sizeof(addr6_str));
++	inet6_aftype.input(1, addr6_str, sa);
++	sa->sa_family = AF_INET6;
++#endif
++    } else {
++    	((struct sockaddr_in*)sa)->sin_addr.s_addr = inet_addr(addr_str);
++	sa->sa_family = AF_INET;
++    }
++    return get_afntype(sa->sa_family);
++}
++
++static void sctp_eps_do_one(int lnr, char *line)
++{
++    char buffer[1024];
++    int type, state, port;
++    int uid;
++    unsigned long inode;
++    
++    struct aftype *ap;
++#if HAVE_AFINET6
++    struct sockaddr_in6 localaddr;
++#else
++    struct sockaddr_in localaddr;
++#endif
++    const char *sty_str;
++    const char *sst_str;
++    const char *lport_str;
++    const char *uid_str;
++    const char *inode_str;
++    const char *pladdr_str;
++    char *laddrs_str;
++    
++    if(lnr == 0) {
++	/* ENDPT     SOCK   STY SST HBKT LPORT   uid inode pladdr LADDRS*/
++	return;
++    }
++    
++    strtok(line," \t\n"); /*skip ptr*/
++    strtok(0," \t\n");    /*skip ptr*/
++    sty_str = strtok(0," \t\n");
++    sst_str = strtok(0," \t\n");
++    strtok(0," \t\n"); /*skip hash bucket*/
++    lport_str=strtok(0," \t\n");
++    uid_str = strtok(0," \t\n");
++    inode_str = strtok(0," \t\n");
++    pladdr_str = strtok(0," \t\n");
++    laddrs_str=strtok(0,"\t\n");
++    
++    type = atoi(sty_str);
++    state = atoi(sst_str);
++    port = atoi(lport_str);
++    uid = atoi(uid_str);
++    inode = strtoul(inode_str,0,0);
++    
++    if(flag_sctp<=1) {
++	/* only print the primary address */
++	char local_addr[64];
++	char local_port[16];
++	
++	ap = process_sctp_addr_str(pladdr_str, (struct sockaddr*)&localaddr);
++	if(ap)
++	    safe_strncpy(local_addr,
++	                 ap->sprint((struct sockaddr *) &localaddr, flag_not),
++	                 sizeof(local_addr));
++	else
++	    sprintf(local_addr,_("unsupported address family %d"), ((struct sockaddr*)&localaddr)->sa_family);
++	
++	snprintf(local_port, sizeof(local_port), "%s",
++	         get_sname(htons(port), "sctp",
++	                   flag_not & FLAG_NUM_PORT));
++	
++	printf("sctp                ");
++	sprintf(buffer,"%s:%s", local_addr, local_port);
++	printf("%-47s", buffer);
++    	printf(" %-12s", sctp_socket_state_str(state));
++    } else {
++    	/*print all addresses*/
++	const char *this_local_addr;
++	int first=1;
++	char local_port[16];
++	snprintf(local_port, sizeof(local_port), "%s",
++		 get_sname(htons(port), "sctp",
++			   flag_not & FLAG_NUM_PORT));
++	for(this_local_addr=strtok(laddrs_str," \t\n");
++	    this_local_addr;
++	    this_local_addr=strtok(0," \t\n"))
++	{
++	    char local_addr[64];
++	    ap = process_sctp_addr_str(this_local_addr, (struct sockaddr*)&localaddr);
++	    if(ap)
++		safe_strncpy(local_addr,
++		             ap->sprint((struct sockaddr *) &localaddr, flag_not),
++		             sizeof(local_addr));
++	    else
++		sprintf(local_addr,_("unsupported address family %d"), ((struct sockaddr*)&localaddr)->sa_family);
++
++	    if(!first) printf("\n");
++	    if(first)
++	        printf("sctp                ");
++	    else
++	        printf("                    ");
++	    sprintf(buffer,"%s:%s", local_addr, local_port);
++	    printf("%-47s", buffer);
++	    printf(" %-12s", first?sctp_socket_state_str(state):"");
++	    first = 0;
++	}
++    }
++
++    finish_this_one(uid,inode,"");
++}
++
++static void sctp_assoc_do_one(int lnr, char *line)
++{
++    char buffer[1024];
++    int type, state, state2, lport,rport;
++    int uid;
++    unsigned rxqueue,txqueue;
++    unsigned long inode;
++    
++    struct aftype *ap;
++#if HAVE_AFINET6
++    struct sockaddr_in6 localaddr,remoteaddr;
++#else
++    struct sockaddr_in localaddr,remoteaddr;
++#endif
++    const char *sty_str;
++    const char *sst_str;
++    const char *st_str;
++    const char *txqueue_str;
++    const char *rxqueue_str;
++    const char *lport_str,*rport_str;
++    const char *uid_str;
++    const char *inode_str;
++    const char *pladdr_str;
++    char *laddrs_str;
++    const char *praddr_str;
++    char *raddrs_str;
++    
++    if(lnr == 0) {
++	/* ASSOC     SOCK   STY SST ST HBKT tx_queue rx_queue uid inode LPORT RPORT pladdr praddr LADDRS <-> RADDRS*/
++	return;
++    }
++    
++    strtok(line," \t\n"); /*skip ptr*/
++    strtok(0," \t\n");    /*skip ptr*/
++    sty_str = strtok(0," \t\n");
++    sst_str = strtok(0," \t\n");
++    st_str = strtok(0," \t\n");
++    strtok(0," \t\n"); /*skip hash bucket*/
++    txqueue_str =  strtok(0," \t\n");
++    rxqueue_str =  strtok(0," \t\n");
++    uid_str = strtok(0," \t\n");
++    inode_str = strtok(0," \t\n");
++    lport_str=strtok(0," \t\n");
++    rport_str=strtok(0," \t\n");
++    pladdr_str = strtok(0," \t\n");
++    praddr_str = strtok(0," \t\n");
++    laddrs_str=strtok(0,"<->\t\n");
++    raddrs_str=strtok(0,"<->\t\n");
++
++    type = atoi(sty_str);
++    state = atoi(sst_str);
++    state2 = atoi(st_str);
++    txqueue = atoi(txqueue_str);
++    rxqueue = atoi(rxqueue_str);
++    uid = atoi(uid_str);
++    inode = strtoul(inode_str,0,0);
++    lport = atoi(lport_str);
++    rport = atoi(rport_str);
++    
++    if(flag_sctp<=1) {
++	/* only print the primary addresses */
++	char local_addr[64];
++	char local_port[16];
++	char remote_addr[64];
++	char remote_port[16];
++	
++	ap = process_sctp_addr_str(pladdr_str, (struct sockaddr*)&localaddr);
++	if(ap)
++	    safe_strncpy(local_addr,
++	                 ap->sprint((struct sockaddr *) &localaddr, flag_not),
++	                 sizeof(local_addr));
++	else
++	    sprintf(local_addr,_("unsupported address family %d"), ((struct sockaddr*)&localaddr)->sa_family);
++	
++	snprintf(local_port, sizeof(local_port), "%s",
++	         get_sname(htons(lport), "sctp",
++	                   flag_not & FLAG_NUM_PORT));
++	
++	ap = process_sctp_addr_str(praddr_str, (struct sockaddr*)&remoteaddr);
++	if(ap)
++	    safe_strncpy(remote_addr,
++	                 ap->sprint((struct sockaddr *) &remoteaddr, flag_not),
++	                 sizeof(remote_addr));
++	else
++	    sprintf(remote_addr,_("unsupported address family %d"), ((struct sockaddr*)&remoteaddr)->sa_family);
++	
++	snprintf(remote_port, sizeof(remote_port), "%s",
++		 get_sname(htons(rport), "sctp",
++			   flag_not & FLAG_NUM_PORT));
++
++	printf("sctp");
++	printf("  %6u %6u ", rxqueue, txqueue);
++	sprintf(buffer,"%s:%s", local_addr, local_port);
++	printf("%-23s", buffer);
++	printf(" ");
++	sprintf(buffer,"%s:%s", remote_addr, remote_port);
++	printf("%-23s", buffer);
++    	printf(" %-12s", sctp_socket_state_str(state));
++    } else {
++    	/*print all addresses*/
++	const char *this_local_addr;
++	const char *this_remote_addr;
++	char *ss1,*ss2;
++	int first=1;
++	char local_port[16];
++	char remote_port[16];
++	snprintf(local_port, sizeof(local_port), "%s",
++	         get_sname(htons(lport), "sctp",
++	                   flag_not & FLAG_NUM_PORT));
++	snprintf(remote_port, sizeof(remote_port), "%s",
++	         get_sname(htons(rport), "sctp",
++	                   flag_not & FLAG_NUM_PORT));
++
++	this_local_addr=strtok_r(laddrs_str," \t\n",&ss1);
++	this_remote_addr=strtok_r(raddrs_str," \t\n",&ss2);
++	while(this_local_addr || this_remote_addr) {
++	    char local_addr[64];
++	    char remote_addr[64];
++	    if(this_local_addr) {
++		ap = process_sctp_addr_str(this_local_addr, (struct sockaddr*)&localaddr);
++		if(ap)
++		    safe_strncpy(local_addr,
++		                 ap->sprint((struct sockaddr *) &localaddr, flag_not),
++		                 sizeof(local_addr));
++		else
++		    sprintf(local_addr,_("unsupported address family %d"), ((struct sockaddr*)&localaddr)->sa_family);
++	    }
++	    if(this_remote_addr) {
++		ap = process_sctp_addr_str(this_remote_addr, (struct sockaddr*)&remoteaddr);
++		if(ap)
++		    safe_strncpy(remote_addr,
++		                 ap->sprint((struct sockaddr *) &remoteaddr, flag_not),
++		                 sizeof(remote_addr));
++		else
++		    sprintf(remote_addr,_("unsupported address family %d"), ((struct sockaddr*)&remoteaddr)->sa_family);
++	    }
++
++	    if(!first) printf("\n");
++	    if(first)
++		printf("sctp  %6u %6u ", rxqueue, txqueue);
++	    else
++		printf("                    ");
++	    if(this_local_addr) {
++		if(first)
++		    sprintf(buffer,"%s:%s", local_addr, local_port);
++		else
++		    sprintf(buffer,"%s", local_addr);
++		printf("%-23s", buffer);
++	    } else
++	    	printf("%-23s", "");
++	    printf(" ");
++	    if(this_remote_addr) {
++		if(first)
++		    sprintf(buffer,"%s:%s", remote_addr, remote_port);
++		else
++		    sprintf(buffer,"%s", remote_addr);
++		printf("%-23s", buffer);
++	    } else
++		printf("%-23s", "");
++
++	    printf(" %-12s", first?sctp_socket_state_str(state):"");
++
++	    first = 0;
++	    this_local_addr=strtok_r(0," \t\n",&ss1);
++	    this_remote_addr=strtok_r(0," \t\n",&ss2);
++	}
++    }
++
++    finish_this_one(uid,inode,"");
++}
++
++static int sctp_info_eps(void)
++{
++#if !defined(_PATH_PROCNET_SCTP_EPS)
++#define	_PATH_PROCNET_SCTP_EPS	"/proc/net/sctp/eps"
++#endif
++    INFO_GUTS(_PATH_PROCNET_SCTP_EPS, "AF INET (sctp)",
++              sctp_eps_do_one);
++}
++
++static int sctp_info_assocs(void)
++{
++#if !defined(_PATH_PROCNET_SCTP_ASSOCS)
++#define	_PATH_PROCNET_SCTP_ASSOCS	"/proc/net/sctp/assocs"
++#endif
++    INFO_GUTS(_PATH_PROCNET_SCTP_ASSOCS, "AF INET (sctp)",
++              sctp_assoc_do_one);
++}
++
++static int sctp_info(void)
++{
++    if(flag_all)
++    	sctp_info_eps();
++    return sctp_info_assocs();
++}
++
+ static void raw_do_one(int lnr, const char *line)
+ {
+     char buffer[8192], local_addr[64], rem_addr[64];
+@@ -1549,7 +1932,7 @@ static void usage(void)
+     fprintf(stderr, _("        -F, --fib                display Forwarding Information Base (default)\n"));
+     fprintf(stderr, _("        -C, --cache              display routing cache instead of FIB\n\n"));
+ 
+-    fprintf(stderr, _("  <Socket>={-t|--tcp} {-u|--udp} {-w|--raw} {-x|--unix} --ax25 --ipx --netrom\n"));
++    fprintf(stderr, _("  <Socket>={-t|--tcp} {-u|--udp} {-S|--sctp} {-w|--raw} {-x|--unix} --ax25 --ipx --netrom\n"));
+     fprintf(stderr, _("  <AF>=Use '-6|-4' or '-A <af>' or '--<af>'; default: %s\n"), DFLT_AF);
+     fprintf(stderr, _("  List of possible address families (which support routing):\n"));
+     print_aflist(1); /* 1 = routeable */
+@@ -1574,6 +1957,7 @@ int main
+ 	{"protocol", 1, 0, 'A'},
+ 	{"tcp", 0, 0, 't'},
+ 	{"udp", 0, 0, 'u'},
++	{"sctp", 0, 0, 'S' },
+ 	{"raw", 0, 0, 'w'},
+ 	{"unix", 0, 0, 'x'},
+ 	{"listening", 0, 0, 'l'},
+@@ -1604,7 +1988,7 @@ int main
+     getroute_init();		/* Set up AF routing support */
+ 
+     afname[0] = '\0';
+-    while ((i = getopt_long(argc, argv, "MCFA:acdegphinNorstuWVv?wxl64", longopts, &lop)) != EOF)
++    while ((i = getopt_long(argc, argv, "MCFA:acdegphinNorstuSWVv?wxl64", longopts, &lop)) != EOF)
+ 	switch (i) {
+ 	case -1:
+ 	    break;
+@@ -1696,10 +2080,12 @@ int main
+ 	case 't':
+ 	    flag_tcp++;
+ 	    break;
+-
+ 	case 'u':
+ 	    flag_udp++;
+ 	    break;
++	case 'S':
++	    flag_sctp++;
++	    break;
+ 	case 'w':
+ 	    flag_raw++;
+ 	    break;
+@@ -1717,13 +2103,13 @@ int main
+     if (flag_int + flag_rou + flag_mas + flag_sta > 1)
+ 	usage();
+ 
+-    if ((flag_inet || flag_inet6 || flag_sta) && !(flag_tcp || flag_udp || flag_raw))
+-	flag_tcp = flag_udp = flag_raw = 1;
++    if ((flag_inet || flag_inet6 || flag_sta) && !(flag_tcp || flag_udp || flag_sctp || flag_raw))
++	flag_tcp = flag_udp = flag_sctp = flag_raw = 1;
+ 
+-    if ((flag_tcp || flag_udp || flag_raw || flag_igmp) && !(flag_inet || flag_inet6))
++    if ((flag_tcp || flag_udp || flag_sctp || flag_raw || flag_igmp) && !(flag_inet || flag_inet6))
+         flag_inet = flag_inet6 = 1;
+ 
+-    flag_arg = flag_tcp + flag_udp + flag_raw + flag_unx + flag_ipx
++    flag_arg = flag_tcp + flag_udp + flag_sctp + flag_raw + flag_unx + flag_ipx
+ 	+ flag_ax25 + flag_netrom + flag_igmp + flag_x25;
+ 
+     if (flag_mas) {
+@@ -1751,7 +2137,7 @@ int main
+         char buf[256];
+         if (!afname[0]) {
+             inittab();
+-            parsesnmp(flag_raw, flag_tcp, flag_udp);
++            parsesnmp(flag_raw, flag_tcp, flag_udp, flag_sctp);
+         } else {
+             safe_strncpy(buf, afname, sizeof(buf));
+             tmp1 = buf;
+@@ -1804,7 +2190,7 @@ int main
+ 	return (i);
+     }
+     for (;;) {
+-	if (!flag_arg || flag_tcp || flag_udp || flag_raw) {
++	if (!flag_arg || flag_tcp || flag_udp || flag_sctp || flag_raw) {
+ #if HAVE_AFINET
+ 	    prg_cache_load();
+ 	    printf(_("Active Internet connections "));	/* xxx */
+@@ -1843,6 +2229,11 @@ int main
+ 	    if (i)
+ 		return (i);
+ 	}
++	if (!flag_arg || flag_sctp) {
++	    i = sctp_info();
++	    if (i)
++		return (i);
++	}
+ 	if (!flag_arg || flag_raw) {
+ 	    i = raw_info();
+ 	    if (i)
+diff --git a/statistics.c b/statistics.c
+index 03600d7..eb8d7dc 100644
+--- a/statistics.c
++++ b/statistics.c
+@@ -21,7 +21,7 @@
+ #define UFWARN(x)
+ #endif
+ 
+-int print_static,f_raw,f_tcp,f_udp,f_unknown = 1;
++int print_static,f_raw,f_tcp,f_udp,f_sctp,f_unknown = 1;
+ 
+ enum State {
+     number = 0, opt_number, i_forward, i_inp_icmp, i_outp_icmp, i_rto_alg,
+@@ -297,6 +297,27 @@ struct entry Tcpexttab[] =
+     { "TCPRenoRecoveryFail", N_("%u classic Reno fast retransmits failed"), opt_number },
+ };
+ 
++struct entry Sctptab[] =
++{
++    {"SctpCurrEstab", N_("%u Current Associations"), number},
++    {"SctpActiveEstabs", N_("%u Active Associations"), number},
++    {"SctpPassiveEstabs", N_("%u Passive Associations"), number},
++    {"SctpAborteds", N_("%u Number of Aborteds "), number},
++    {"SctpShutdowns", N_("%u Number of Graceful Terminations"), number},
++    {"SctpOutOfBlues", N_("%u Number of Out of Blue packets"), number},
++    {"SctpChecksumErrors", N_("%u Number of Packets with invalid Checksum"), number},
++    {"SctpOutCtrlChunks", N_("%u Number of control chunks sent"), number},
++    {"SctpOutOrderChunks", N_("%u Number of ordered chunks sent"), number},
++    {"SctpOutUnorderChunks", N_("%u Number of Unordered chunks sent"), number},
++    {"SctpInCtrlChunks", N_("%u Number of control chunks received"), number},
++    {"SctpInOrderChunks", N_("%u Number of ordered chunks received"), number},
++    {"SctpInUnorderChunks", N_("%u Number of Unordered chunks received"), number},
++    {"SctpFragUsrMsgs", N_("%u Number of messages fragmented"), number},
++    {"SctpReasmUsrMsgs", N_("%u Number of messages reassembled "), number},
++    {"SctpOutSCTPPacks", N_("%u Number of SCTP packets sent"), number},
++    {"SctpInSCTPPacks", N_("%u Number of SCTP packets received"), number},
++};
++
+ struct tabtab {
+     char *title;
+     struct entry *tab;
+@@ -310,6 +331,7 @@ struct tabtab snmptabs[] =
+     {"Icmp", Icmptab, sizeof(Icmptab), &f_raw},
+     {"Tcp", Tcptab, sizeof(Tcptab), &f_tcp},
+     {"Udp", Udptab, sizeof(Udptab), &f_udp},
++    {"Sctp", Sctptab, sizeof(Sctptab), &f_sctp},
+     {"TcpExt", Tcpexttab, sizeof(Tcpexttab), &f_tcp},
+     {NULL}
+ };
+@@ -499,12 +521,40 @@ void process6_fd(FILE *f)
+ 
+ }
+ 
+-void parsesnmp(int flag_raw, int flag_tcp, int flag_udp)
++/* Process a file with name-value lines (like /proc/net/sctp/snmp) */
++void process_fd2(FILE *f, const char *filename)
++{
++    char buf1[1024];
++    char *sp;
++    struct tabtab *tab;
++    
++    tab = newtable(snmptabs, "Sctp");
++    
++    while (fgets(buf1, sizeof buf1, f)) {
++	sp = buf1 + strcspn(buf1, " \t\n");
++	if (!sp)
++	    goto formaterr;
++	*sp = '\0';
++    	sp++;
++
++	sp += strspn(sp, " \t\n"); 
++
++	if (*sp != '\0' && *(tab->flag)) 	
++	    printval(tab, buf1, strtoul(sp, 0, 10));
++    }
++  return;
++  
++formaterr:
++  fprintf(stderr,_("error parsing %s\n"), filename);
++  return;
++}
++
++void parsesnmp(int flag_raw, int flag_tcp, int flag_udp, int flag_sctp)
+ {
+     FILE *f;
+ 
+-    f_raw = flag_raw; f_tcp = flag_tcp; f_udp = flag_udp;
+-    
++    f_raw = flag_raw; f_tcp = flag_tcp; f_udp = flag_udp; f_sctp = flag_sctp;
++
+     f = proc_fopen("/proc/net/snmp");
+     if (!f) {
+ 	perror(_("cannot open /proc/net/snmp"));
+@@ -530,6 +580,16 @@ void parsesnmp(int flag_raw, int flag_tcp, int flag_udp)
+     
+         fclose(f);
+     }
++
++    f = fopen("/proc/net/sctp/snmp", "r");
++    if (f) {
++	process_fd2(f,"/proc/net/sctp/snmp");
++	if (ferror(f))
++	    perror("/proc/net/sctp/snmp");
++
++	fclose(f);
++    }
++
+     return;
+ }
+     
+-- 
+1.8.5.2.233.g932f7e4
+
diff --git a/meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp2-quiet.patch b/meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp2-quiet.patch
new file mode 100644
index 0000000..d34e651
--- /dev/null
+++ b/meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp2-quiet.patch
@@ -0,0 +1,28 @@
+From 14287b594e1f02b811f889fb515c1a51b72c08d4 Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Thu, 14 Jan 2016 17:07:48 +0800
+Subject: [PATCH 2/3] net-tools: add SCTP support for netstat
+
+Upstream-Status: pending
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ netstat.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/netstat.c b/netstat.c
+index 5d1a4a1..56a15c2 100644
+--- a/netstat.c
++++ b/netstat.c
+@@ -2104,7 +2104,7 @@ int main
+ 	usage();
+ 
+     if ((flag_inet || flag_inet6 || flag_sta) && !(flag_tcp || flag_udp || flag_sctp || flag_raw))
+-	flag_tcp = flag_udp = flag_sctp = flag_raw = 1;
++	flag_tcp = flag_udp = flag_raw = 1;
+ 
+     if ((flag_tcp || flag_udp || flag_sctp || flag_raw || flag_igmp) && !(flag_inet || flag_inet6))
+         flag_inet = flag_inet6 = 1;
+-- 
+1.8.5.2.233.g932f7e4
+
diff --git a/meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp3-addrs.patch b/meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp3-addrs.patch
new file mode 100644
index 0000000..8b2ecab
--- /dev/null
+++ b/meta/recipes-extended/net-tools/net-tools/net-tools-1.60-sctp3-addrs.patch
@@ -0,0 +1,363 @@
+From 1d386279a449a1a6b96b88a71f35bf13b14b2c2c Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Thu, 14 Jan 2016 17:11:24 +0800
+Subject: [PATCH 3/3] net-tools: add SCTP support for netstat
+
+Upstream-Status: pending
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ netstat.c | 282 ++++++++++++++++++++++++--------------------------------------
+ 1 file changed, 108 insertions(+), 174 deletions(-)
+
+diff --git a/netstat.c b/netstat.c
+index 56a15c2..86adadb 100644
+--- a/netstat.c
++++ b/netstat.c
+@@ -1095,23 +1095,21 @@ static void sctp_eps_do_one(int lnr, char *line)
+     const char *lport_str;
+     const char *uid_str;
+     const char *inode_str;
+-    const char *pladdr_str;
+     char *laddrs_str;
+     
+     if(lnr == 0) {
+-	/* ENDPT     SOCK   STY SST HBKT LPORT   uid inode pladdr LADDRS*/
++        /* ENDPT     SOCK   STY SST HBKT LPORT   UID INODE LADDRS */
+ 	return;
+     }
+     
+-    strtok(line," \t\n"); /*skip ptr*/
+-    strtok(0," \t\n");    /*skip ptr*/
++    strtok(line," \t\n"); /*skip endpt*/
++    strtok(0," \t\n");    /*skip sock*/
+     sty_str = strtok(0," \t\n");
+     sst_str = strtok(0," \t\n");
+     strtok(0," \t\n"); /*skip hash bucket*/
+     lport_str=strtok(0," \t\n");
+     uid_str = strtok(0," \t\n");
+     inode_str = strtok(0," \t\n");
+-    pladdr_str = strtok(0," \t\n");
+     laddrs_str=strtok(0,"\t\n");
+     
+     type = atoi(sty_str);
+@@ -1119,61 +1117,35 @@ static void sctp_eps_do_one(int lnr, char *line)
+     port = atoi(lport_str);
+     uid = atoi(uid_str);
+     inode = strtoul(inode_str,0,0);
+-    
+-    if(flag_sctp<=1) {
+-	/* only print the primary address */
+-	char local_addr[64];
+-	char local_port[16];
+-	
+-	ap = process_sctp_addr_str(pladdr_str, (struct sockaddr*)&localaddr);
+-	if(ap)
+-	    safe_strncpy(local_addr,
+-	                 ap->sprint((struct sockaddr *) &localaddr, flag_not),
+-	                 sizeof(local_addr));
+-	else
+-	    sprintf(local_addr,_("unsupported address family %d"), ((struct sockaddr*)&localaddr)->sa_family);
+-	
+-	snprintf(local_port, sizeof(local_port), "%s",
+-	         get_sname(htons(port), "sctp",
+-	                   flag_not & FLAG_NUM_PORT));
+-	
+-	printf("sctp                ");
+-	sprintf(buffer,"%s:%s", local_addr, local_port);
+-	printf("%-47s", buffer);
+-    	printf(" %-12s", sctp_socket_state_str(state));
+-    } else {
+-    	/*print all addresses*/
+-	const char *this_local_addr;
+-	int first=1;
+-	char local_port[16];
+-	snprintf(local_port, sizeof(local_port), "%s",
+-		 get_sname(htons(port), "sctp",
+-			   flag_not & FLAG_NUM_PORT));
+-	for(this_local_addr=strtok(laddrs_str," \t\n");
+-	    this_local_addr;
+-	    this_local_addr=strtok(0," \t\n"))
+-	{
+-	    char local_addr[64];
+-	    ap = process_sctp_addr_str(this_local_addr, (struct sockaddr*)&localaddr);
+-	    if(ap)
+-		safe_strncpy(local_addr,
+-		             ap->sprint((struct sockaddr *) &localaddr, flag_not),
+-		             sizeof(local_addr));
+-	    else
+-		sprintf(local_addr,_("unsupported address family %d"), ((struct sockaddr*)&localaddr)->sa_family);
+ 
+-	    if(!first) printf("\n");
+-	    if(first)
+-	        printf("sctp                ");
+-	    else
+-	        printf("                    ");
+-	    sprintf(buffer,"%s:%s", local_addr, local_port);
+-	    printf("%-47s", buffer);
+-	    printf(" %-12s", first?sctp_socket_state_str(state):"");
+-	    first = 0;
+-	}
++    const char *this_local_addr;
++    int first=1;
++    char local_port[16];
++    snprintf(local_port, sizeof(local_port), "%s",
++        get_sname(htons(port), "sctp", flag_not & FLAG_NUM_PORT));
++    for(this_local_addr=strtok(laddrs_str," \t\n");
++        this_local_addr;
++        this_local_addr=strtok(0," \t\n"))
++    {
++        char local_addr[64];
++        ap = process_sctp_addr_str(this_local_addr, (struct sockaddr*)&localaddr);
++        if(ap)
++            safe_strncpy(local_addr,
++                ap->sprint((struct sockaddr *) &localaddr, flag_not),
++                sizeof(local_addr));
++        else
++            sprintf(local_addr,_("unsupported address family %d"), ((struct sockaddr*)&localaddr)->sa_family);
++
++        if(!first) printf("\n");
++        if(first)
++            printf("sctp                ");
++        else
++            printf("                    ");
++        sprintf(buffer,"%s:%s", local_addr, local_port);
++        printf("%-55s", buffer);
++        printf(" %-12s", first?sctp_socket_state_str(state):"");
++        first = 0;
+     }
+-
+     finish_this_one(uid,inode,"");
+ }
+ 
+@@ -1199,32 +1171,29 @@ static void sctp_assoc_do_one(int lnr, char *line)
+     const char *lport_str,*rport_str;
+     const char *uid_str;
+     const char *inode_str;
+-    const char *pladdr_str;
+     char *laddrs_str;
+-    const char *praddr_str;
+     char *raddrs_str;
+-    
++
+     if(lnr == 0) {
+-	/* ASSOC     SOCK   STY SST ST HBKT tx_queue rx_queue uid inode LPORT RPORT pladdr praddr LADDRS <-> RADDRS*/
++	/* ASSOC     SOCK   STY SST ST HBKT ASSOC-ID TX_QUEUE RX_QUEUE UID INODE LPORT RPORT LADDRS <-> RADDRS */
+ 	return;
+     }
+-    
+-    strtok(line," \t\n"); /*skip ptr*/
+-    strtok(0," \t\n");    /*skip ptr*/
++
++    strtok(line," \t\n"); /*skip assoc*/
++    strtok(0," \t\n");    /*skip sock*/
+     sty_str = strtok(0," \t\n");
+     sst_str = strtok(0," \t\n");
+     st_str = strtok(0," \t\n");
+     strtok(0," \t\n"); /*skip hash bucket*/
++    strtok(0," \t\n"); /*skip hash assoc-id*/
+     txqueue_str =  strtok(0," \t\n");
+     rxqueue_str =  strtok(0," \t\n");
+     uid_str = strtok(0," \t\n");
+     inode_str = strtok(0," \t\n");
+     lport_str=strtok(0," \t\n");
+     rport_str=strtok(0," \t\n");
+-    pladdr_str = strtok(0," \t\n");
+-    praddr_str = strtok(0," \t\n");
+-    laddrs_str=strtok(0,"<->\t\n");
+-    raddrs_str=strtok(0,"<->\t\n");
++    laddrs_str = strtok(0,"<->\t\n");
++    raddrs_str = strtok(0,"<->\t\n");
+ 
+     type = atoi(sty_str);
+     state = atoi(sst_str);
+@@ -1235,116 +1204,81 @@ static void sctp_assoc_do_one(int lnr, char *line)
+     inode = strtoul(inode_str,0,0);
+     lport = atoi(lport_str);
+     rport = atoi(rport_str);
+-    
+-    if(flag_sctp<=1) {
+-	/* only print the primary addresses */
+-	char local_addr[64];
+-	char local_port[16];
+-	char remote_addr[64];
+-	char remote_port[16];
+-	
+-	ap = process_sctp_addr_str(pladdr_str, (struct sockaddr*)&localaddr);
+-	if(ap)
+-	    safe_strncpy(local_addr,
+-	                 ap->sprint((struct sockaddr *) &localaddr, flag_not),
+-	                 sizeof(local_addr));
+-	else
+-	    sprintf(local_addr,_("unsupported address family %d"), ((struct sockaddr*)&localaddr)->sa_family);
+-	
+-	snprintf(local_port, sizeof(local_port), "%s",
+-	         get_sname(htons(lport), "sctp",
+-	                   flag_not & FLAG_NUM_PORT));
+-	
+-	ap = process_sctp_addr_str(praddr_str, (struct sockaddr*)&remoteaddr);
+-	if(ap)
+-	    safe_strncpy(remote_addr,
+-	                 ap->sprint((struct sockaddr *) &remoteaddr, flag_not),
+-	                 sizeof(remote_addr));
+-	else
+-	    sprintf(remote_addr,_("unsupported address family %d"), ((struct sockaddr*)&remoteaddr)->sa_family);
+-	
+-	snprintf(remote_port, sizeof(remote_port), "%s",
+-		 get_sname(htons(rport), "sctp",
+-			   flag_not & FLAG_NUM_PORT));
+-
+-	printf("sctp");
+-	printf("  %6u %6u ", rxqueue, txqueue);
+-	sprintf(buffer,"%s:%s", local_addr, local_port);
+-	printf("%-23s", buffer);
+-	printf(" ");
+-	sprintf(buffer,"%s:%s", remote_addr, remote_port);
+-	printf("%-23s", buffer);
+-    	printf(" %-12s", sctp_socket_state_str(state));
+-    } else {
+-    	/*print all addresses*/
+-	const char *this_local_addr;
+-	const char *this_remote_addr;
+-	char *ss1,*ss2;
+-	int first=1;
+-	char local_port[16];
+-	char remote_port[16];
+-	snprintf(local_port, sizeof(local_port), "%s",
+-	         get_sname(htons(lport), "sctp",
+-	                   flag_not & FLAG_NUM_PORT));
+-	snprintf(remote_port, sizeof(remote_port), "%s",
+-	         get_sname(htons(rport), "sctp",
+-	                   flag_not & FLAG_NUM_PORT));
+-
+-	this_local_addr=strtok_r(laddrs_str," \t\n",&ss1);
+-	this_remote_addr=strtok_r(raddrs_str," \t\n",&ss2);
+-	while(this_local_addr || this_remote_addr) {
+-	    char local_addr[64];
+-	    char remote_addr[64];
+-	    if(this_local_addr) {
+-		ap = process_sctp_addr_str(this_local_addr, (struct sockaddr*)&localaddr);
+-		if(ap)
+-		    safe_strncpy(local_addr,
+-		                 ap->sprint((struct sockaddr *) &localaddr, flag_not),
+-		                 sizeof(local_addr));
+-		else
+-		    sprintf(local_addr,_("unsupported address family %d"), ((struct sockaddr*)&localaddr)->sa_family);
+-	    }
+-	    if(this_remote_addr) {
+-		ap = process_sctp_addr_str(this_remote_addr, (struct sockaddr*)&remoteaddr);
+-		if(ap)
+-		    safe_strncpy(remote_addr,
+-		                 ap->sprint((struct sockaddr *) &remoteaddr, flag_not),
+-		                 sizeof(remote_addr));
+-		else
+-		    sprintf(remote_addr,_("unsupported address family %d"), ((struct sockaddr*)&remoteaddr)->sa_family);
+-	    }
+ 
+-	    if(!first) printf("\n");
+-	    if(first)
+-		printf("sctp  %6u %6u ", rxqueue, txqueue);
+-	    else
+-		printf("                    ");
+-	    if(this_local_addr) {
+-		if(first)
+-		    sprintf(buffer,"%s:%s", local_addr, local_port);
++    /*print all addresses*/
++    const char *this_local_addr;
++    const char *this_remote_addr;
++    char *ss1,*ss2;
++    int first=1;
++    char local_port[16];
++    char remote_port[16];
++    snprintf(local_port, sizeof(local_port), "%s",
++             get_sname(htons(lport), "sctp",
++             flag_not & FLAG_NUM_PORT));
++    snprintf(remote_port, sizeof(remote_port), "%s",
++             get_sname(htons(rport), "sctp",
++             flag_not & FLAG_NUM_PORT));
++
++    this_local_addr=strtok_r(laddrs_str," \t\n",&ss1);
++    this_remote_addr=strtok_r(raddrs_str," \t\n",&ss2);
++    while(this_local_addr || this_remote_addr) {
++        char local_addr[64];
++        char remote_addr[64];
++
++        if(this_local_addr) {
++            if (this_local_addr[0] == '*') {
++                /* skip * */
++                this_local_addr++;
++            }
++            ap = process_sctp_addr_str(this_local_addr, (struct sockaddr*)&localaddr);
++            if(ap)
++                safe_strncpy(local_addr,
++                    ap->sprint((struct sockaddr *) &localaddr, flag_not), sizeof(local_addr));
+ 		else
+-		    sprintf(buffer,"%s", local_addr);
+-		printf("%-23s", buffer);
+-	    } else
+-	    	printf("%-23s", "");
+-	    printf(" ");
+-	    if(this_remote_addr) {
+-		if(first)
+-		    sprintf(buffer,"%s:%s", remote_addr, remote_port);
++                    sprintf(local_addr,_("unsupported address family %d"), ((struct sockaddr*)&localaddr)->sa_family);
++        }
++	if(this_remote_addr) {
++            if (this_remote_addr[0] == '*') {
++                /* skip * */
++                this_remote_addr++;
++            }
++            ap = process_sctp_addr_str(this_remote_addr, (struct sockaddr*)&remoteaddr);
++            if(ap)
++                safe_strncpy(remote_addr,
++                    ap->sprint((struct sockaddr *) &remoteaddr, flag_not), sizeof(remote_addr));
+ 		else
+-		    sprintf(buffer,"%s", remote_addr);
+-		printf("%-23s", buffer);
+-	    } else
+-		printf("%-23s", "");
+-
+-	    printf(" %-12s", first?sctp_socket_state_str(state):"");
++                    sprintf(remote_addr,_("unsupported address family %d"), ((struct sockaddr*)&remoteaddr)->sa_family);
++       }
+ 
+-	    first = 0;
+-	    this_local_addr=strtok_r(0," \t\n",&ss1);
+-	    this_remote_addr=strtok_r(0," \t\n",&ss2);
+-	}
++       if(!first) printf("\n");
++       if(first)
++           printf("sctp  %6u %6u ", rxqueue, txqueue);
++       else
++           printf("                    ");
++       if(this_local_addr) {
++           if(first)
++               sprintf(buffer,"%s:%s", local_addr, local_port);
++           else
++               sprintf(buffer,"%s", local_addr);
++           printf("%-27s", buffer);
++       } else
++           printf("%-27s", "");
++       printf(" ");
++       if(this_remote_addr) {
++           if(first)
++               sprintf(buffer,"%s:%s", remote_addr, remote_port);
++           else
++               sprintf(buffer,"%s", remote_addr);
++           printf("%-27s", buffer);
++       } else
++       printf("%-27s", "");
++
++       printf(" %-12s", first?sctp_socket_state_str(state):"");
++
++       first = 0;
++       this_local_addr=strtok_r(0," \t\n",&ss1);
++       this_remote_addr=strtok_r(0," \t\n",&ss2);
+     }
+-
+     finish_this_one(uid,inode,"");
+ }
+ 
+-- 
+1.8.5.2.233.g932f7e4
+
diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index 14b8e49..de36912 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -12,7 +12,10 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/
            file://net-tools-config.make \
            file://ifconfig-interface-0-del-IP-will-remove-the-aliased-.patch \
            file://musl-fixes.patch \
-	   "
+           file://net-tools-1.60-sctp1.patch \
+           file://net-tools-1.60-sctp2-quiet.patch \
+           file://net-tools-1.60-sctp3-addrs.patch \
+          "
 
 # for this package we're mostly interested in tracking debian patches,
 # and not in the upstream version where all development has effectively stopped
-- 
1.7.9.5


