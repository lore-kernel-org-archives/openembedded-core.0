Received: from co9ehsobe003.messaging.microsoft.com ([207.46.163.26]
	helo=co9outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1UCtfD-0002pm-Op
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 16:20:38 +0100
Received: from mail137-co9-R.bigfish.com (10.236.132.232) by
	CO9EHSOBE041.bigfish.com (10.236.130.104) with Microsoft SMTP Server id
	14.1.225.23; Tue, 5 Mar 2013 14:33:42 +0000
Received: from mail137-co9 (localhost [127.0.0.1])	by
	mail137-co9-R.bigfish.com (Postfix) with ESMTP id A2DEC3A0175	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2013 14:33:42 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail137-co9 (localhost.localdomain [127.0.0.1]) by mail137-co9
	(MessageSwitch) id 1362494020199133_22422;
	Tue,  5 Mar 2013 14:33:40 +0000 (UTC)
Received: from CO9EHSMHS032.bigfish.com (unknown [10.236.132.226])	by
	mail137-co9.bigfish.com (Postfix) with ESMTP id 1CE372E047C	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2013 14:33:40 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS032.bigfish.com
	(10.236.130.42) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 5 Mar 2013 14:33:35 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Tue, 5 Mar 2013 14:33:34 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	r25EXWU1009322; Tue, 5 Mar 2013 07:33:32 -0700
From: <b28495@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Mar 2013 08:33:32 -0600
Message-ID: <1362494012-27214-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] iproute2: Fix build failure on ppc64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Mar 2013 15:21:02 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Backport three patches from upstream for ppc64:

http://git.kernel.org/cgit/linux/kernel/git/shemminger/iproute2.git
ae70d96 ipntable: more fixes for ppc64
a55a8fd fix dependency on sizeof(__u64) == sizeof(unsigned long long)
a7c2882 ip: fix ipv6 ntable on ppc64

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 .../0001-ip-fix-ipv6-ntable-on-ppc64.patch         |  142 +++++++++++++
 ...ncy-on-sizeof-__u64-sizeof-unsigned-long-.patch |  213 ++++++++++++++++++++
 .../0004-ipntable-more-fixes-for-ppc64.patch       |   68 +++++++
 .../iproute2/iproute2_3.8.0.bb                     |    5 +-
 4 files changed, 427 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-ip-fix-ipv6-ntable-on-ppc64.patch
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0003-fix-dependency-on-sizeof-__u64-sizeof-unsigned-long-.patch
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0004-ipntable-more-fixes-for-ppc64.patch

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-ip-fix-ipv6-ntable-on-ppc64.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-ip-fix-ipv6-ntable-on-ppc64.patch
new file mode 100644
index 0000000..b5cbf95
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-ip-fix-ipv6-ntable-on-ppc64.patch
@@ -0,0 +1,142 @@
+Upstream-Status: Backport
+
+From a7c2882461581747488e5aabf10d19b46b371a01 Mon Sep 17 00:00:00 2001
+From: Stephen Hemminger <stephen@networkplumber.org>
+Date: Wed, 27 Feb 2013 07:26:17 -0800
+Subject: [PATCH] ip: fix ipv6 ntable on ppc64
+
+Add casts to handle printf format when
+ sizeof(unsigned long long) != sizeof(__u64)
+---
+ ip/ipntable.c |   56 +++++++++++++++++++++++++++++++++++++-------------------
+ 1 file changed, 37 insertions(+), 19 deletions(-)
+
+diff --git a/ip/ipntable.c b/ip/ipntable.c
+index 5751114..56ad001 100644
+--- a/ip/ipntable.c
++++ b/ip/ipntable.c
+@@ -432,7 +432,7 @@ int print_ntable(const struct sockaddr_nl *who, struct nlmsghdr *n, void *arg)
+ 	}
+ 	if (tb[NDTA_GC_INTERVAL]) {
+ 		__u64 gc_int = rta_getattr_u64(tb[NDTA_GC_INTERVAL]);
+-		fprintf(fp, "gc_int %llu ", gc_int);
++		fprintf(fp, "gc_int %llu ", (unsigned long long) gc_int);
+ 	}
+ 
+ 	if (ret)
+@@ -485,15 +485,18 @@ int print_ntable(const struct sockaddr_nl *who, struct nlmsghdr *n, void *arg)
+ 		}
+ 		if (tpb[NDTPA_REACHABLE_TIME]) {
+ 			__u64 reachable = rta_getattr_u64(tpb[NDTPA_REACHABLE_TIME]);
+-			fprintf(fp, "reachable %llu ", reachable);
++			fprintf(fp, "reachable %llu ",
++				(unsigned long long) reachable);
+ 		}
+ 		if (tpb[NDTPA_BASE_REACHABLE_TIME]) {
+ 			__u64 breachable = rta_getattr_u64(tpb[NDTPA_BASE_REACHABLE_TIME]);
+-			fprintf(fp, "base_reachable %llu ", breachable);
++			fprintf(fp, "base_reachable %llu ",
++				(unsigned long long) breachable);
+ 		}
+ 		if (tpb[NDTPA_RETRANS_TIME]) {
+ 			__u64 retrans = rta_getattr_u64(tpb[NDTPA_RETRANS_TIME]);
+-			fprintf(fp, "retrans %llu ", retrans);
++			fprintf(fp, "retrans %llu ",
++				(unsigned long long) retrans);
+ 		}
+ 
+ 		fprintf(fp, "%s", _SL_);
+@@ -502,11 +505,13 @@ int print_ntable(const struct sockaddr_nl *who, struct nlmsghdr *n, void *arg)
+ 
+ 		if (tpb[NDTPA_GC_STALETIME]) {
+ 			__u64 gc_stale = rta_getattr_u64(tpb[NDTPA_GC_STALETIME]);
+-			fprintf(fp, "gc_stale %llu ", gc_stale);
++			fprintf(fp, "gc_stale %llu ",
++				(unsigned long long) gc_stale);
+ 		}
+ 		if (tpb[NDTPA_DELAY_PROBE_TIME]) {
+ 			__u64 delay_probe = rta_getattr_u64(tpb[NDTPA_DELAY_PROBE_TIME]);
+-			fprintf(fp, "delay_probe %llu ", delay_probe);
++			fprintf(fp, "delay_probe %llu ",
++				(unsigned long long) delay_probe);
+ 		}
+ 		if (tpb[NDTPA_QUEUE_LEN]) {
+ 			__u32 queue = rta_getattr_u32(tpb[NDTPA_QUEUE_LEN]);
+@@ -536,11 +541,13 @@ int print_ntable(const struct sockaddr_nl *who, struct nlmsghdr *n, void *arg)
+ 
+ 		if (tpb[NDTPA_ANYCAST_DELAY]) {
+ 			__u64 anycast_delay = rta_getattr_u64(tpb[NDTPA_ANYCAST_DELAY]);
+-			fprintf(fp, "anycast_delay %llu ", anycast_delay);
++			fprintf(fp, "anycast_delay %llu ",
++				(unsigned long long) anycast_delay);
+ 		}
+ 		if (tpb[NDTPA_PROXY_DELAY]) {
+ 			__u64 proxy_delay = rta_getattr_u64(tpb[NDTPA_PROXY_DELAY]);
+-			fprintf(fp, "proxy_delay %llu ", proxy_delay);
++			fprintf(fp, "proxy_delay %llu ",
++				(unsigned long long) proxy_delay);
+ 		}
+ 		if (tpb[NDTPA_PROXY_QLEN]) {
+ 			__u32 pqueue = rta_getattr_u32(tpb[NDTPA_PROXY_QLEN]);
+@@ -548,7 +555,8 @@ int print_ntable(const struct sockaddr_nl *who, struct nlmsghdr *n, void *arg)
+ 		}
+ 		if (tpb[NDTPA_LOCKTIME]) {
+ 			__u64 locktime = rta_getattr_u64(tpb[NDTPA_LOCKTIME]);
+-			fprintf(fp, "locktime %llu ", locktime);
++			fprintf(fp, "locktime %llu ",
++				(unsigned long long) locktime);
+ 		}
+ 
+ 		fprintf(fp, "%s", _SL_);
+@@ -560,28 +568,38 @@ int print_ntable(const struct sockaddr_nl *who, struct nlmsghdr *n, void *arg)
+ 		fprintf(fp, "    ");
+ 		fprintf(fp, "stats ");
+ 
+-		fprintf(fp, "allocs %llu ", ndts->ndts_allocs);
+-		fprintf(fp, "destroys %llu ", ndts->ndts_destroys);
+-		fprintf(fp, "hash_grows %llu ", ndts->ndts_hash_grows);
++		fprintf(fp, "allocs %llu ",
++			(unsigned long long) ndts->ndts_allocs);
++		fprintf(fp, "destroys %llu ",
++			(unsigned long long) ndts->ndts_destroys);
++		fprintf(fp, "hash_grows %llu ",
++			(unsigned long long) ndts->ndts_hash_grows);
+ 
+ 		fprintf(fp, "%s", _SL_);
+ 		fprintf(fp, "        ");
+ 
+-		fprintf(fp, "res_failed %llu ", ndts->ndts_res_failed);
+-		fprintf(fp, "lookups %llu ", ndts->ndts_lookups);
+-		fprintf(fp, "hits %llu ", ndts->ndts_hits);
++		fprintf(fp, "res_failed %llu ",
++			(unsigned long long) ndts->ndts_res_failed);
++		fprintf(fp, "lookups %llu ",
++			(unsigned long long) ndts->ndts_lookups);
++		fprintf(fp, "hits %llu ",
++			(unsigned long long) ndts->ndts_hits);
+ 
+ 		fprintf(fp, "%s", _SL_);
+ 		fprintf(fp, "        ");
+ 
+-		fprintf(fp, "rcv_probes_mcast %llu ", ndts->ndts_rcv_probes_mcast);
+-		fprintf(fp, "rcv_probes_ucast %llu ", ndts->ndts_rcv_probes_ucast);
++		fprintf(fp, "rcv_probes_mcast %llu ",
++			(unsigned long long) ndts->ndts_rcv_probes_mcast);
++		fprintf(fp, "rcv_probes_ucast %llu ",
++			(unsigned long long) ndts->ndts_rcv_probes_ucast);
+ 
+ 		fprintf(fp, "%s", _SL_);
+ 		fprintf(fp, "        ");
+ 
+-		fprintf(fp, "periodic_gc_runs %llu ", ndts->ndts_periodic_gc_runs);
+-		fprintf(fp, "forced_gc_runs %llu ", ndts->ndts_forced_gc_runs);
++		fprintf(fp, "periodic_gc_runs %llu ",
++			(unsigned long long) ndts->ndts_periodic_gc_runs);
++		fprintf(fp, "forced_gc_runs %llu ",
++			(unsigned long long) ndts->ndts_forced_gc_runs);
+ 
+ 		fprintf(fp, "%s", _SL_);
+ 	}
+-- 
+1.7.9.7
+
diff --git a/meta/recipes-connectivity/iproute2/iproute2/0003-fix-dependency-on-sizeof-__u64-sizeof-unsigned-long-.patch b/meta/recipes-connectivity/iproute2/iproute2/0003-fix-dependency-on-sizeof-__u64-sizeof-unsigned-long-.patch
new file mode 100644
index 0000000..a5af49f
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/0003-fix-dependency-on-sizeof-__u64-sizeof-unsigned-long-.patch
@@ -0,0 +1,213 @@
+Upstream-Status: Backport
+
+From a55a8fd83be9d91bd2adb73eebac8833a51b626f Mon Sep 17 00:00:00 2001
+From: Stephen Hemminger <stephen@networkplumber.org>
+Date: Thu, 28 Feb 2013 08:51:46 -0800
+Subject: [PATCH] fix dependency on sizeof(__u64) == sizeof(unsigned long
+ long)
+
+Some platforms like ppc64 have unsigned long long as 128 bits, and
+the printf format string would cause errors. Resolve this by using
+unsigned long long where necessary (or unsigned long).
+---
+ ip/ipntable.c    |   74 +++++++++++++++++++++---------------------------------
+ ip/tcp_metrics.c |   13 +++++-----
+ 2 files changed, 35 insertions(+), 52 deletions(-)
+
+diff --git a/ip/ipntable.c b/ip/ipntable.c
+index 56ad001..a1a3c26 100644
+--- a/ip/ipntable.c
++++ b/ip/ipntable.c
+@@ -431,8 +431,8 @@ int print_ntable(const struct sockaddr_nl *who, struct nlmsghdr *n, void *arg)
+ 		fprintf(fp, "thresh3 %u ", thresh3);
+ 	}
+ 	if (tb[NDTA_GC_INTERVAL]) {
+-		__u64 gc_int = rta_getattr_u64(tb[NDTA_GC_INTERVAL]);
+-		fprintf(fp, "gc_int %llu ", (unsigned long long) gc_int);
++		unsigned long long gc_int = rta_getattr_u64(tb[NDTA_GC_INTERVAL]);
++		fprintf(fp, "gc_int %llu ", gc_int);
+ 	}
+ 
+ 	if (ret)
+@@ -484,19 +484,16 @@ int print_ntable(const struct sockaddr_nl *who, struct nlmsghdr *n, void *arg)
+ 			fprintf(fp, "refcnt %u ", refcnt);
+ 		}
+ 		if (tpb[NDTPA_REACHABLE_TIME]) {
+-			__u64 reachable = rta_getattr_u64(tpb[NDTPA_REACHABLE_TIME]);
+-			fprintf(fp, "reachable %llu ",
+-				(unsigned long long) reachable);
++			unsigned long long reachable = rta_getattr_u64(tpb[NDTPA_REACHABLE_TIME]);
++			fprintf(fp, "reachable %llu ", reachable);
+ 		}
+ 		if (tpb[NDTPA_BASE_REACHABLE_TIME]) {
+-			__u64 breachable = rta_getattr_u64(tpb[NDTPA_BASE_REACHABLE_TIME]);
+-			fprintf(fp, "base_reachable %llu ",
+-				(unsigned long long) breachable);
++			unsigned long long breachable = rta_getattr_u64(tpb[NDTPA_BASE_REACHABLE_TIME]);
++			fprintf(fp, "base_reachable %llu ", breachable);
+ 		}
+ 		if (tpb[NDTPA_RETRANS_TIME]) {
+-			__u64 retrans = rta_getattr_u64(tpb[NDTPA_RETRANS_TIME]);
+-			fprintf(fp, "retrans %llu ",
+-				(unsigned long long) retrans);
++			unsigned long long retrans = rta_getattr_u64(tpb[NDTPA_RETRANS_TIME]);
++			fprintf(fp, "retrans %llu ", retrans);
+ 		}
+ 
+ 		fprintf(fp, "%s", _SL_);
+@@ -504,14 +501,12 @@ int print_ntable(const struct sockaddr_nl *who, struct nlmsghdr *n, void *arg)
+ 		fprintf(fp, "    ");
+ 
+ 		if (tpb[NDTPA_GC_STALETIME]) {
+-			__u64 gc_stale = rta_getattr_u64(tpb[NDTPA_GC_STALETIME]);
+-			fprintf(fp, "gc_stale %llu ",
+-				(unsigned long long) gc_stale);
++			unsigned long long gc_stale = rta_getattr_u64(tpb[NDTPA_GC_STALETIME]);
++			fprintf(fp, "gc_stale %llu ", gc_stale);
+ 		}
+ 		if (tpb[NDTPA_DELAY_PROBE_TIME]) {
+-			__u64 delay_probe = rta_getattr_u64(tpb[NDTPA_DELAY_PROBE_TIME]);
+-			fprintf(fp, "delay_probe %llu ",
+-				(unsigned long long) delay_probe);
++			unsigned long long delay_probe = rta_getattr_u64(tpb[NDTPA_DELAY_PROBE_TIME]);
++			fprintf(fp, "delay_probe %llu ", delay_probe);
+ 		}
+ 		if (tpb[NDTPA_QUEUE_LEN]) {
+ 			__u32 queue = rta_getattr_u32(tpb[NDTPA_QUEUE_LEN]);
+@@ -540,23 +535,20 @@ int print_ntable(const struct sockaddr_nl *who, struct nlmsghdr *n, void *arg)
+ 		fprintf(fp, "    ");
+ 
+ 		if (tpb[NDTPA_ANYCAST_DELAY]) {
+-			__u64 anycast_delay = rta_getattr_u64(tpb[NDTPA_ANYCAST_DELAY]);
+-			fprintf(fp, "anycast_delay %llu ",
+-				(unsigned long long) anycast_delay);
++			unsigned long long anycast_delay = rta_getattr_u64(tpb[NDTPA_ANYCAST_DELAY]);
++			fprintf(fp, "anycast_delay %llu ", anycast_delay);
+ 		}
+ 		if (tpb[NDTPA_PROXY_DELAY]) {
+-			__u64 proxy_delay = rta_getattr_u64(tpb[NDTPA_PROXY_DELAY]);
+-			fprintf(fp, "proxy_delay %llu ",
+-				(unsigned long long) proxy_delay);
++			unsigned long long proxy_delay = rta_getattr_u64(tpb[NDTPA_PROXY_DELAY]);
++			fprintf(fp, "proxy_delay %llu ", proxy_delay);
+ 		}
+ 		if (tpb[NDTPA_PROXY_QLEN]) {
+ 			__u32 pqueue = rta_getattr_u32(tpb[NDTPA_PROXY_QLEN]);
+ 			fprintf(fp, "proxy_queue %u ", pqueue);
+ 		}
+ 		if (tpb[NDTPA_LOCKTIME]) {
+-			__u64 locktime = rta_getattr_u64(tpb[NDTPA_LOCKTIME]);
+-			fprintf(fp, "locktime %llu ",
+-				(unsigned long long) locktime);
++			unsigned long long locktime = rta_getattr_u64(tpb[NDTPA_LOCKTIME]);
++			fprintf(fp, "locktime %llu ", locktime);
+ 		}
+ 
+ 		fprintf(fp, "%s", _SL_);
+@@ -568,38 +560,28 @@ int print_ntable(const struct sockaddr_nl *who, struct nlmsghdr *n, void *arg)
+ 		fprintf(fp, "    ");
+ 		fprintf(fp, "stats ");
+ 
+-		fprintf(fp, "allocs %llu ",
+-			(unsigned long long) ndts->ndts_allocs);
+-		fprintf(fp, "destroys %llu ",
+-			(unsigned long long) ndts->ndts_destroys);
+-		fprintf(fp, "hash_grows %llu ",
+-			(unsigned long long) ndts->ndts_hash_grows);
++		fprintf(fp, "allocs %llu ", ndts->ndts_allocs);
++		fprintf(fp, "destroys %llu ", ndts->ndts_destroys);
++		fprintf(fp, "hash_grows %llu ", ndts->ndts_hash_grows);
+ 
+ 		fprintf(fp, "%s", _SL_);
+ 		fprintf(fp, "        ");
+ 
+-		fprintf(fp, "res_failed %llu ",
+-			(unsigned long long) ndts->ndts_res_failed);
+-		fprintf(fp, "lookups %llu ",
+-			(unsigned long long) ndts->ndts_lookups);
+-		fprintf(fp, "hits %llu ",
+-			(unsigned long long) ndts->ndts_hits);
++		fprintf(fp, "res_failed %llu ", ndts->ndts_res_failed);
++		fprintf(fp, "lookups %llu ", ndts->ndts_lookups);
++		fprintf(fp, "hits %llu ", ndts->ndts_hits);
+ 
+ 		fprintf(fp, "%s", _SL_);
+ 		fprintf(fp, "        ");
+ 
+-		fprintf(fp, "rcv_probes_mcast %llu ",
+-			(unsigned long long) ndts->ndts_rcv_probes_mcast);
+-		fprintf(fp, "rcv_probes_ucast %llu ",
+-			(unsigned long long) ndts->ndts_rcv_probes_ucast);
++		fprintf(fp, "rcv_probes_mcast %llu ", ndts->ndts_rcv_probes_mcast);
++		fprintf(fp, "rcv_probes_ucast %llu ", ndts->ndts_rcv_probes_ucast);
+ 
+ 		fprintf(fp, "%s", _SL_);
+ 		fprintf(fp, "        ");
+ 
+-		fprintf(fp, "periodic_gc_runs %llu ",
+-			(unsigned long long) ndts->ndts_periodic_gc_runs);
+-		fprintf(fp, "forced_gc_runs %llu ",
+-			(unsigned long long) ndts->ndts_forced_gc_runs);
++		fprintf(fp, "periodic_gc_runs %llu ", ndts->ndts_periodic_gc_runs);
++		fprintf(fp, "forced_gc_runs %llu ", ndts->ndts_forced_gc_runs);
+ 
+ 		fprintf(fp, "%s", _SL_);
+ 	}
+diff --git a/ip/tcp_metrics.c b/ip/tcp_metrics.c
+index a01e1fb..c6be3c9 100644
+--- a/ip/tcp_metrics.c
++++ b/ip/tcp_metrics.c
+@@ -166,7 +166,7 @@ static int process_msg(const struct sockaddr_nl *who, struct nlmsghdr *n,
+ 
+ 	a = attrs[TCP_METRICS_ATTR_AGE];
+ 	if (a) {
+-		__u64 val = rta_getattr_u64(a);
++		unsigned long long val = rta_getattr_u64(a);
+ 
+ 		fprintf(fp, " age %llu.%03llusec",
+ 			val / 1000, val % 1000);
+@@ -189,7 +189,7 @@ static int process_msg(const struct sockaddr_nl *who, struct nlmsghdr *n,
+ 		parse_rtattr_nested(m, TCP_METRIC_MAX + 1, a);
+ 
+ 		for (i = 0; i < TCP_METRIC_MAX + 1; i++) {
+-			__u32 val;
++			unsigned long val;
+ 
+ 			a = m[i + 1];
+ 			if (!a)
+@@ -198,19 +198,20 @@ static int process_msg(const struct sockaddr_nl *who, struct nlmsghdr *n,
+ 				fprintf(fp, " %s ", metric_name[i]);
+ 			else
+ 				fprintf(fp, " metric_%d ", i);
++
+ 			val = rta_getattr_u32(a);
+ 			switch (i) {
+ 			case TCP_METRIC_RTT:
+-				fprintf(fp, "%lluus", (val * 1000ULL) >> 3);
++				fprintf(fp, "%luus", (val * 1000UL) >> 3);
+ 				break;
+ 			case TCP_METRIC_RTTVAR:
+-				fprintf(fp, "%lluus", (val * 1000ULL) >> 2);
++				fprintf(fp, "%luus", (val * 1000UL) >> 2);
+ 				break;
+ 			case TCP_METRIC_SSTHRESH:
+ 			case TCP_METRIC_CWND:
+ 			case TCP_METRIC_REORDERING:
+ 			default:
+-				fprintf(fp, "%u", val);
++				fprintf(fp, "%lu", val);
+ 				break;
+ 			}
+ 		}
+@@ -223,7 +224,7 @@ static int process_msg(const struct sockaddr_nl *who, struct nlmsghdr *n,
+ 	a = attrs[TCP_METRICS_ATTR_FOPEN_SYN_DROPS];
+ 	if (a) {
+ 		__u16 syn_loss = rta_getattr_u16(a);
+-		__u64 ts;
++		unsigned long long ts;
+ 
+ 		a = attrs[TCP_METRICS_ATTR_FOPEN_SYN_DROP_TS];
+ 		ts = a ? rta_getattr_u64(a) : 0;
+-- 
+1.7.9.7
+
diff --git a/meta/recipes-connectivity/iproute2/iproute2/0004-ipntable-more-fixes-for-ppc64.patch b/meta/recipes-connectivity/iproute2/iproute2/0004-ipntable-more-fixes-for-ppc64.patch
new file mode 100644
index 0000000..e841709
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/0004-ipntable-more-fixes-for-ppc64.patch
@@ -0,0 +1,68 @@
+Upstream-Status: Backport
+
+From ae70d9665615ae723a108947aa60b5f65caffab2 Mon Sep 17 00:00:00 2001
+From: Stephen Hemminger <stephen@networkplumber.org>
+Date: Mon, 4 Mar 2013 13:59:39 -0800
+Subject: [PATCH] ipntable: more fixes for ppc64
+
+Not all arch have sizeof(unsigned long long) == sizeof(__u64)
+---
+ ip/ipntable.c |   30 ++++++++++++++++++++----------
+ 1 file changed, 20 insertions(+), 10 deletions(-)
+
+diff --git a/ip/ipntable.c b/ip/ipntable.c
+index a1a3c26..67b199e 100644
+--- a/ip/ipntable.c
++++ b/ip/ipntable.c
+@@ -560,28 +560,38 @@ int print_ntable(const struct sockaddr_nl *who, struct nlmsghdr *n, void *arg)
+ 		fprintf(fp, "    ");
+ 		fprintf(fp, "stats ");
+ 
+-		fprintf(fp, "allocs %llu ", ndts->ndts_allocs);
+-		fprintf(fp, "destroys %llu ", ndts->ndts_destroys);
+-		fprintf(fp, "hash_grows %llu ", ndts->ndts_hash_grows);
++		fprintf(fp, "allocs %llu ",
++			(unsigned long long) ndts->ndts_allocs);
++		fprintf(fp, "destroys %llu ",
++			(unsigned long long) ndts->ndts_destroys);
++		fprintf(fp, "hash_grows %llu ",
++			(unsigned long long) ndts->ndts_hash_grows);
+ 
+ 		fprintf(fp, "%s", _SL_);
+ 		fprintf(fp, "        ");
+ 
+-		fprintf(fp, "res_failed %llu ", ndts->ndts_res_failed);
+-		fprintf(fp, "lookups %llu ", ndts->ndts_lookups);
+-		fprintf(fp, "hits %llu ", ndts->ndts_hits);
++		fprintf(fp, "res_failed %llu ",
++			(unsigned long long) ndts->ndts_res_failed);
++		fprintf(fp, "lookups %llu ",
++			(unsigned long long) ndts->ndts_lookups);
++		fprintf(fp, "hits %llu ",
++			(unsigned long long) ndts->ndts_hits);
+ 
+ 		fprintf(fp, "%s", _SL_);
+ 		fprintf(fp, "        ");
+ 
+-		fprintf(fp, "rcv_probes_mcast %llu ", ndts->ndts_rcv_probes_mcast);
+-		fprintf(fp, "rcv_probes_ucast %llu ", ndts->ndts_rcv_probes_ucast);
++		fprintf(fp, "rcv_probes_mcast %llu ",
++			(unsigned long long) ndts->ndts_rcv_probes_mcast);
++		fprintf(fp, "rcv_probes_ucast %llu ",
++			(unsigned long long) ndts->ndts_rcv_probes_ucast);
+ 
+ 		fprintf(fp, "%s", _SL_);
+ 		fprintf(fp, "        ");
+ 
+-		fprintf(fp, "periodic_gc_runs %llu ", ndts->ndts_periodic_gc_runs);
+-		fprintf(fp, "forced_gc_runs %llu ", ndts->ndts_forced_gc_runs);
++		fprintf(fp, "periodic_gc_runs %llu ",
++			(unsigned long long) ndts->ndts_periodic_gc_runs);
++		fprintf(fp, "forced_gc_runs %llu ",
++			(unsigned long long) ndts->ndts_forced_gc_runs);
+ 
+ 		fprintf(fp, "%s", _SL_);
+ 	}
+-- 
+1.7.9.7
+
diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.8.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.8.0.bb
index 892d230..65164cb 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_3.8.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.8.0.bb
@@ -1,10 +1,13 @@
 require iproute2.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.tar.xz \
            file://configure-cross.patch \
            file://0001-Fix-compilation-error-of-m_ipt.c-with-Werror-enabled.patch \
+           file://0001-ip-fix-ipv6-ntable-on-ppc64.patch \
+           file://0003-fix-dependency-on-sizeof-__u64-sizeof-unsigned-long-.patch \
+           file://0004-ipntable-more-fixes-for-ppc64.patch \
           "
 
 SRC_URI[md5sum] = "951622fd770428116dc165acba375414"
-- 
1.7.9.7




