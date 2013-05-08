Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1Ua1p9-0000wy-Sj
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 12:42:26 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 08 May 2013 03:24:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,632,1363158000"; d="scan'208";a="330756510"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 08 May 2013 03:24:11 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2013 13:25:03 +0300
Message-Id: <1368008703-1960-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] iproute2: upgrade to 3.9.0
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
X-List-Received-Date: Wed, 08 May 2013 10:42:32 -0000

patches removed; already included in upstream.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...tion-error-of-m_ipt.c-with-Werror-enabled.patch |   46 -----
 .../0001-ip-fix-ipv6-ntable-on-ppc64.patch         |  142 -------------
 ...ncy-on-sizeof-__u64-sizeof-unsigned-long-.patch |  213 --------------------
 .../0004-ipntable-more-fixes-for-ppc64.patch       |   68 -------
 .../iproute2/iproute2_3.8.0.bb                     |   18 --
 .../iproute2/iproute2_3.9.0.bb                     |   12 ++
 6 files changed, 12 insertions(+), 487 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-Fix-compilation-error-of-m_ipt.c-with-Werror-enabled.patch
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-ip-fix-ipv6-ntable-on-ppc64.patch
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0003-fix-dependency-on-sizeof-__u64-sizeof-unsigned-long-.patch
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0004-ipntable-more-fixes-for-ppc64.patch
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2_3.8.0.bb
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2_3.9.0.bb

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-Fix-compilation-error-of-m_ipt.c-with-Werror-enabled.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-Fix-compilation-error-of-m_ipt.c-with-Werror-enabled.patch
deleted file mode 100644
index db74963..0000000
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-Fix-compilation-error-of-m_ipt.c-with-Werror-enabled.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Upstream-Status: Backport
-
-From 9235195666af7d887771cf557ef2bd3f00b9ecc8 Mon Sep 17 00:00:00 2001
-From: Vijay Subramanian <subramanian.vijay@gmail.com>
-Date: Tue, 26 Feb 2013 09:12:07 +0000
-Subject: [PATCH] Fix compilation error of m_ipt.c with -Werror enabled
-
-Commit (5a650703d47e10aa386406c855eff5a593b2120b Makefile: make warnings into
-errors ) causes the following build error.
-
-gcc -Wall -Wstrict-prototypes -Werror -Wmissing-prototypes
--Wmissing-declarations -Wold-style-definition -O2 -I../include
--DRESOLVE_HOSTNAMES -DLIBDIR=\"/usr/lib\" -DCONFDIR=\"/etc/iproute2\"
--D_GNU_SOURCE -DCONFIG_GACT -DCONFIG_GACT_PROB -DIPT_LIB_DIR=\"/lib/xtables\"
--DYY_NO_INPUT   -c -o m_ipt.o m_ipt.c
-cc1: warnings being treated as errors
-m_ipt.c:72: error: no previous prototype for 'xtables_register_target'
-m_ipt.c:361: error: no previous prototype for 'build_st'
-make[1]: *** [m_ipt.o] Error 1
-
-This is fixed by adding the prototype in the header include/iptables.h
-
-I am not sure if this is due to something wrong on my build system but I am
-using current glibc 2.17.
-
-Signed-off-by: Vijay Subramanian <subramanian.vijay@gmail.com>
----
- include/iptables.h |    2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/include/iptables.h b/include/iptables.h
-index dd844c1..f1e62e2 100644
---- a/include/iptables.h
-+++ b/include/iptables.h
-@@ -143,6 +143,8 @@ extern int line;
- /* Your shared library should call one of these. */
- extern void register_match(struct iptables_match *me);
- extern void register_target(struct iptables_target *me);
-+extern void xtables_register_target(struct iptables_target *me);
-+extern int build_st(struct iptables_target *target, struct ipt_entry_target *t);
- 
- extern struct in_addr *dotted_to_addr(const char *dotted);
- extern char *addr_to_dotted(const struct in_addr *addrp);
--- 
-1.7.9.5
-
diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-ip-fix-ipv6-ntable-on-ppc64.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-ip-fix-ipv6-ntable-on-ppc64.patch
deleted file mode 100644
index b5cbf95..0000000
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-ip-fix-ipv6-ntable-on-ppc64.patch
+++ /dev/null
@@ -1,142 +0,0 @@
-Upstream-Status: Backport
-
-From a7c2882461581747488e5aabf10d19b46b371a01 Mon Sep 17 00:00:00 2001
-From: Stephen Hemminger <stephen@networkplumber.org>
-Date: Wed, 27 Feb 2013 07:26:17 -0800
-Subject: [PATCH] ip: fix ipv6 ntable on ppc64
-
-Add casts to handle printf format when
- sizeof(unsigned long long) != sizeof(__u64)
----
- ip/ipntable.c |   56 +++++++++++++++++++++++++++++++++++++-------------------
- 1 file changed, 37 insertions(+), 19 deletions(-)
-
-diff --git a/ip/ipntable.c b/ip/ipntable.c
-index 5751114..56ad001 100644
---- a/ip/ipntable.c
-+++ b/ip/ipntable.c
-@@ -432,7 +432,7 @@ int print_ntable(const struct sockaddr_nl *who, struct nlmsghdr *n, void *arg)
- 	}
- 	if (tb[NDTA_GC_INTERVAL]) {
- 		__u64 gc_int = rta_getattr_u64(tb[NDTA_GC_INTERVAL]);
--		fprintf(fp, "gc_int %llu ", gc_int);
-+		fprintf(fp, "gc_int %llu ", (unsigned long long) gc_int);
- 	}
- 
- 	if (ret)
-@@ -485,15 +485,18 @@ int print_ntable(const struct sockaddr_nl *who, struct nlmsghdr *n, void *arg)
- 		}
- 		if (tpb[NDTPA_REACHABLE_TIME]) {
- 			__u64 reachable = rta_getattr_u64(tpb[NDTPA_REACHABLE_TIME]);
--			fprintf(fp, "reachable %llu ", reachable);
-+			fprintf(fp, "reachable %llu ",
-+				(unsigned long long) reachable);
- 		}
- 		if (tpb[NDTPA_BASE_REACHABLE_TIME]) {
- 			__u64 breachable = rta_getattr_u64(tpb[NDTPA_BASE_REACHABLE_TIME]);
--			fprintf(fp, "base_reachable %llu ", breachable);
-+			fprintf(fp, "base_reachable %llu ",
-+				(unsigned long long) breachable);
- 		}
- 		if (tpb[NDTPA_RETRANS_TIME]) {
- 			__u64 retrans = rta_getattr_u64(tpb[NDTPA_RETRANS_TIME]);
--			fprintf(fp, "retrans %llu ", retrans);
-+			fprintf(fp, "retrans %llu ",
-+				(unsigned long long) retrans);
- 		}
- 
- 		fprintf(fp, "%s", _SL_);
-@@ -502,11 +505,13 @@ int print_ntable(const struct sockaddr_nl *who, struct nlmsghdr *n, void *arg)
- 
- 		if (tpb[NDTPA_GC_STALETIME]) {
- 			__u64 gc_stale = rta_getattr_u64(tpb[NDTPA_GC_STALETIME]);
--			fprintf(fp, "gc_stale %llu ", gc_stale);
-+			fprintf(fp, "gc_stale %llu ",
-+				(unsigned long long) gc_stale);
- 		}
- 		if (tpb[NDTPA_DELAY_PROBE_TIME]) {
- 			__u64 delay_probe = rta_getattr_u64(tpb[NDTPA_DELAY_PROBE_TIME]);
--			fprintf(fp, "delay_probe %llu ", delay_probe);
-+			fprintf(fp, "delay_probe %llu ",
-+				(unsigned long long) delay_probe);
- 		}
- 		if (tpb[NDTPA_QUEUE_LEN]) {
- 			__u32 queue = rta_getattr_u32(tpb[NDTPA_QUEUE_LEN]);
-@@ -536,11 +541,13 @@ int print_ntable(const struct sockaddr_nl *who, struct nlmsghdr *n, void *arg)
- 
- 		if (tpb[NDTPA_ANYCAST_DELAY]) {
- 			__u64 anycast_delay = rta_getattr_u64(tpb[NDTPA_ANYCAST_DELAY]);
--			fprintf(fp, "anycast_delay %llu ", anycast_delay);
-+			fprintf(fp, "anycast_delay %llu ",
-+				(unsigned long long) anycast_delay);
- 		}
- 		if (tpb[NDTPA_PROXY_DELAY]) {
- 			__u64 proxy_delay = rta_getattr_u64(tpb[NDTPA_PROXY_DELAY]);
--			fprintf(fp, "proxy_delay %llu ", proxy_delay);
-+			fprintf(fp, "proxy_delay %llu ",
-+				(unsigned long long) proxy_delay);
- 		}
- 		if (tpb[NDTPA_PROXY_QLEN]) {
- 			__u32 pqueue = rta_getattr_u32(tpb[NDTPA_PROXY_QLEN]);
-@@ -548,7 +555,8 @@ int print_ntable(const struct sockaddr_nl *who, struct nlmsghdr *n, void *arg)
- 		}
- 		if (tpb[NDTPA_LOCKTIME]) {
- 			__u64 locktime = rta_getattr_u64(tpb[NDTPA_LOCKTIME]);
--			fprintf(fp, "locktime %llu ", locktime);
-+			fprintf(fp, "locktime %llu ",
-+				(unsigned long long) locktime);
- 		}
- 
- 		fprintf(fp, "%s", _SL_);
-@@ -560,28 +568,38 @@ int print_ntable(const struct sockaddr_nl *who, struct nlmsghdr *n, void *arg)
- 		fprintf(fp, "    ");
- 		fprintf(fp, "stats ");
- 
--		fprintf(fp, "allocs %llu ", ndts->ndts_allocs);
--		fprintf(fp, "destroys %llu ", ndts->ndts_destroys);
--		fprintf(fp, "hash_grows %llu ", ndts->ndts_hash_grows);
-+		fprintf(fp, "allocs %llu ",
-+			(unsigned long long) ndts->ndts_allocs);
-+		fprintf(fp, "destroys %llu ",
-+			(unsigned long long) ndts->ndts_destroys);
-+		fprintf(fp, "hash_grows %llu ",
-+			(unsigned long long) ndts->ndts_hash_grows);
- 
- 		fprintf(fp, "%s", _SL_);
- 		fprintf(fp, "        ");
- 
--		fprintf(fp, "res_failed %llu ", ndts->ndts_res_failed);
--		fprintf(fp, "lookups %llu ", ndts->ndts_lookups);
--		fprintf(fp, "hits %llu ", ndts->ndts_hits);
-+		fprintf(fp, "res_failed %llu ",
-+			(unsigned long long) ndts->ndts_res_failed);
-+		fprintf(fp, "lookups %llu ",
-+			(unsigned long long) ndts->ndts_lookups);
-+		fprintf(fp, "hits %llu ",
-+			(unsigned long long) ndts->ndts_hits);
- 
- 		fprintf(fp, "%s", _SL_);
- 		fprintf(fp, "        ");
- 
--		fprintf(fp, "rcv_probes_mcast %llu ", ndts->ndts_rcv_probes_mcast);
--		fprintf(fp, "rcv_probes_ucast %llu ", ndts->ndts_rcv_probes_ucast);
-+		fprintf(fp, "rcv_probes_mcast %llu ",
-+			(unsigned long long) ndts->ndts_rcv_probes_mcast);
-+		fprintf(fp, "rcv_probes_ucast %llu ",
-+			(unsigned long long) ndts->ndts_rcv_probes_ucast);
- 
- 		fprintf(fp, "%s", _SL_);
- 		fprintf(fp, "        ");
- 
--		fprintf(fp, "periodic_gc_runs %llu ", ndts->ndts_periodic_gc_runs);
--		fprintf(fp, "forced_gc_runs %llu ", ndts->ndts_forced_gc_runs);
-+		fprintf(fp, "periodic_gc_runs %llu ",
-+			(unsigned long long) ndts->ndts_periodic_gc_runs);
-+		fprintf(fp, "forced_gc_runs %llu ",
-+			(unsigned long long) ndts->ndts_forced_gc_runs);
- 
- 		fprintf(fp, "%s", _SL_);
- 	}
--- 
-1.7.9.7
-
diff --git a/meta/recipes-connectivity/iproute2/iproute2/0003-fix-dependency-on-sizeof-__u64-sizeof-unsigned-long-.patch b/meta/recipes-connectivity/iproute2/iproute2/0003-fix-dependency-on-sizeof-__u64-sizeof-unsigned-long-.patch
deleted file mode 100644
index a5af49f..0000000
--- a/meta/recipes-connectivity/iproute2/iproute2/0003-fix-dependency-on-sizeof-__u64-sizeof-unsigned-long-.patch
+++ /dev/null
@@ -1,213 +0,0 @@
-Upstream-Status: Backport
-
-From a55a8fd83be9d91bd2adb73eebac8833a51b626f Mon Sep 17 00:00:00 2001
-From: Stephen Hemminger <stephen@networkplumber.org>
-Date: Thu, 28 Feb 2013 08:51:46 -0800
-Subject: [PATCH] fix dependency on sizeof(__u64) == sizeof(unsigned long
- long)
-
-Some platforms like ppc64 have unsigned long long as 128 bits, and
-the printf format string would cause errors. Resolve this by using
-unsigned long long where necessary (or unsigned long).
----
- ip/ipntable.c    |   74 +++++++++++++++++++++---------------------------------
- ip/tcp_metrics.c |   13 +++++-----
- 2 files changed, 35 insertions(+), 52 deletions(-)
-
-diff --git a/ip/ipntable.c b/ip/ipntable.c
-index 56ad001..a1a3c26 100644
---- a/ip/ipntable.c
-+++ b/ip/ipntable.c
-@@ -431,8 +431,8 @@ int print_ntable(const struct sockaddr_nl *who, struct nlmsghdr *n, void *arg)
- 		fprintf(fp, "thresh3 %u ", thresh3);
- 	}
- 	if (tb[NDTA_GC_INTERVAL]) {
--		__u64 gc_int = rta_getattr_u64(tb[NDTA_GC_INTERVAL]);
--		fprintf(fp, "gc_int %llu ", (unsigned long long) gc_int);
-+		unsigned long long gc_int = rta_getattr_u64(tb[NDTA_GC_INTERVAL]);
-+		fprintf(fp, "gc_int %llu ", gc_int);
- 	}
- 
- 	if (ret)
-@@ -484,19 +484,16 @@ int print_ntable(const struct sockaddr_nl *who, struct nlmsghdr *n, void *arg)
- 			fprintf(fp, "refcnt %u ", refcnt);
- 		}
- 		if (tpb[NDTPA_REACHABLE_TIME]) {
--			__u64 reachable = rta_getattr_u64(tpb[NDTPA_REACHABLE_TIME]);
--			fprintf(fp, "reachable %llu ",
--				(unsigned long long) reachable);
-+			unsigned long long reachable = rta_getattr_u64(tpb[NDTPA_REACHABLE_TIME]);
-+			fprintf(fp, "reachable %llu ", reachable);
- 		}
- 		if (tpb[NDTPA_BASE_REACHABLE_TIME]) {
--			__u64 breachable = rta_getattr_u64(tpb[NDTPA_BASE_REACHABLE_TIME]);
--			fprintf(fp, "base_reachable %llu ",
--				(unsigned long long) breachable);
-+			unsigned long long breachable = rta_getattr_u64(tpb[NDTPA_BASE_REACHABLE_TIME]);
-+			fprintf(fp, "base_reachable %llu ", breachable);
- 		}
- 		if (tpb[NDTPA_RETRANS_TIME]) {
--			__u64 retrans = rta_getattr_u64(tpb[NDTPA_RETRANS_TIME]);
--			fprintf(fp, "retrans %llu ",
--				(unsigned long long) retrans);
-+			unsigned long long retrans = rta_getattr_u64(tpb[NDTPA_RETRANS_TIME]);
-+			fprintf(fp, "retrans %llu ", retrans);
- 		}
- 
- 		fprintf(fp, "%s", _SL_);
-@@ -504,14 +501,12 @@ int print_ntable(const struct sockaddr_nl *who, struct nlmsghdr *n, void *arg)
- 		fprintf(fp, "    ");
- 
- 		if (tpb[NDTPA_GC_STALETIME]) {
--			__u64 gc_stale = rta_getattr_u64(tpb[NDTPA_GC_STALETIME]);
--			fprintf(fp, "gc_stale %llu ",
--				(unsigned long long) gc_stale);
-+			unsigned long long gc_stale = rta_getattr_u64(tpb[NDTPA_GC_STALETIME]);
-+			fprintf(fp, "gc_stale %llu ", gc_stale);
- 		}
- 		if (tpb[NDTPA_DELAY_PROBE_TIME]) {
--			__u64 delay_probe = rta_getattr_u64(tpb[NDTPA_DELAY_PROBE_TIME]);
--			fprintf(fp, "delay_probe %llu ",
--				(unsigned long long) delay_probe);
-+			unsigned long long delay_probe = rta_getattr_u64(tpb[NDTPA_DELAY_PROBE_TIME]);
-+			fprintf(fp, "delay_probe %llu ", delay_probe);
- 		}
- 		if (tpb[NDTPA_QUEUE_LEN]) {
- 			__u32 queue = rta_getattr_u32(tpb[NDTPA_QUEUE_LEN]);
-@@ -540,23 +535,20 @@ int print_ntable(const struct sockaddr_nl *who, struct nlmsghdr *n, void *arg)
- 		fprintf(fp, "    ");
- 
- 		if (tpb[NDTPA_ANYCAST_DELAY]) {
--			__u64 anycast_delay = rta_getattr_u64(tpb[NDTPA_ANYCAST_DELAY]);
--			fprintf(fp, "anycast_delay %llu ",
--				(unsigned long long) anycast_delay);
-+			unsigned long long anycast_delay = rta_getattr_u64(tpb[NDTPA_ANYCAST_DELAY]);
-+			fprintf(fp, "anycast_delay %llu ", anycast_delay);
- 		}
- 		if (tpb[NDTPA_PROXY_DELAY]) {
--			__u64 proxy_delay = rta_getattr_u64(tpb[NDTPA_PROXY_DELAY]);
--			fprintf(fp, "proxy_delay %llu ",
--				(unsigned long long) proxy_delay);
-+			unsigned long long proxy_delay = rta_getattr_u64(tpb[NDTPA_PROXY_DELAY]);
-+			fprintf(fp, "proxy_delay %llu ", proxy_delay);
- 		}
- 		if (tpb[NDTPA_PROXY_QLEN]) {
- 			__u32 pqueue = rta_getattr_u32(tpb[NDTPA_PROXY_QLEN]);
- 			fprintf(fp, "proxy_queue %u ", pqueue);
- 		}
- 		if (tpb[NDTPA_LOCKTIME]) {
--			__u64 locktime = rta_getattr_u64(tpb[NDTPA_LOCKTIME]);
--			fprintf(fp, "locktime %llu ",
--				(unsigned long long) locktime);
-+			unsigned long long locktime = rta_getattr_u64(tpb[NDTPA_LOCKTIME]);
-+			fprintf(fp, "locktime %llu ", locktime);
- 		}
- 
- 		fprintf(fp, "%s", _SL_);
-@@ -568,38 +560,28 @@ int print_ntable(const struct sockaddr_nl *who, struct nlmsghdr *n, void *arg)
- 		fprintf(fp, "    ");
- 		fprintf(fp, "stats ");
- 
--		fprintf(fp, "allocs %llu ",
--			(unsigned long long) ndts->ndts_allocs);
--		fprintf(fp, "destroys %llu ",
--			(unsigned long long) ndts->ndts_destroys);
--		fprintf(fp, "hash_grows %llu ",
--			(unsigned long long) ndts->ndts_hash_grows);
-+		fprintf(fp, "allocs %llu ", ndts->ndts_allocs);
-+		fprintf(fp, "destroys %llu ", ndts->ndts_destroys);
-+		fprintf(fp, "hash_grows %llu ", ndts->ndts_hash_grows);
- 
- 		fprintf(fp, "%s", _SL_);
- 		fprintf(fp, "        ");
- 
--		fprintf(fp, "res_failed %llu ",
--			(unsigned long long) ndts->ndts_res_failed);
--		fprintf(fp, "lookups %llu ",
--			(unsigned long long) ndts->ndts_lookups);
--		fprintf(fp, "hits %llu ",
--			(unsigned long long) ndts->ndts_hits);
-+		fprintf(fp, "res_failed %llu ", ndts->ndts_res_failed);
-+		fprintf(fp, "lookups %llu ", ndts->ndts_lookups);
-+		fprintf(fp, "hits %llu ", ndts->ndts_hits);
- 
- 		fprintf(fp, "%s", _SL_);
- 		fprintf(fp, "        ");
- 
--		fprintf(fp, "rcv_probes_mcast %llu ",
--			(unsigned long long) ndts->ndts_rcv_probes_mcast);
--		fprintf(fp, "rcv_probes_ucast %llu ",
--			(unsigned long long) ndts->ndts_rcv_probes_ucast);
-+		fprintf(fp, "rcv_probes_mcast %llu ", ndts->ndts_rcv_probes_mcast);
-+		fprintf(fp, "rcv_probes_ucast %llu ", ndts->ndts_rcv_probes_ucast);
- 
- 		fprintf(fp, "%s", _SL_);
- 		fprintf(fp, "        ");
- 
--		fprintf(fp, "periodic_gc_runs %llu ",
--			(unsigned long long) ndts->ndts_periodic_gc_runs);
--		fprintf(fp, "forced_gc_runs %llu ",
--			(unsigned long long) ndts->ndts_forced_gc_runs);
-+		fprintf(fp, "periodic_gc_runs %llu ", ndts->ndts_periodic_gc_runs);
-+		fprintf(fp, "forced_gc_runs %llu ", ndts->ndts_forced_gc_runs);
- 
- 		fprintf(fp, "%s", _SL_);
- 	}
-diff --git a/ip/tcp_metrics.c b/ip/tcp_metrics.c
-index a01e1fb..c6be3c9 100644
---- a/ip/tcp_metrics.c
-+++ b/ip/tcp_metrics.c
-@@ -166,7 +166,7 @@ static int process_msg(const struct sockaddr_nl *who, struct nlmsghdr *n,
- 
- 	a = attrs[TCP_METRICS_ATTR_AGE];
- 	if (a) {
--		__u64 val = rta_getattr_u64(a);
-+		unsigned long long val = rta_getattr_u64(a);
- 
- 		fprintf(fp, " age %llu.%03llusec",
- 			val / 1000, val % 1000);
-@@ -189,7 +189,7 @@ static int process_msg(const struct sockaddr_nl *who, struct nlmsghdr *n,
- 		parse_rtattr_nested(m, TCP_METRIC_MAX + 1, a);
- 
- 		for (i = 0; i < TCP_METRIC_MAX + 1; i++) {
--			__u32 val;
-+			unsigned long val;
- 
- 			a = m[i + 1];
- 			if (!a)
-@@ -198,19 +198,20 @@ static int process_msg(const struct sockaddr_nl *who, struct nlmsghdr *n,
- 				fprintf(fp, " %s ", metric_name[i]);
- 			else
- 				fprintf(fp, " metric_%d ", i);
-+
- 			val = rta_getattr_u32(a);
- 			switch (i) {
- 			case TCP_METRIC_RTT:
--				fprintf(fp, "%lluus", (val * 1000ULL) >> 3);
-+				fprintf(fp, "%luus", (val * 1000UL) >> 3);
- 				break;
- 			case TCP_METRIC_RTTVAR:
--				fprintf(fp, "%lluus", (val * 1000ULL) >> 2);
-+				fprintf(fp, "%luus", (val * 1000UL) >> 2);
- 				break;
- 			case TCP_METRIC_SSTHRESH:
- 			case TCP_METRIC_CWND:
- 			case TCP_METRIC_REORDERING:
- 			default:
--				fprintf(fp, "%u", val);
-+				fprintf(fp, "%lu", val);
- 				break;
- 			}
- 		}
-@@ -223,7 +224,7 @@ static int process_msg(const struct sockaddr_nl *who, struct nlmsghdr *n,
- 	a = attrs[TCP_METRICS_ATTR_FOPEN_SYN_DROPS];
- 	if (a) {
- 		__u16 syn_loss = rta_getattr_u16(a);
--		__u64 ts;
-+		unsigned long long ts;
- 
- 		a = attrs[TCP_METRICS_ATTR_FOPEN_SYN_DROP_TS];
- 		ts = a ? rta_getattr_u64(a) : 0;
--- 
-1.7.9.7
-
diff --git a/meta/recipes-connectivity/iproute2/iproute2/0004-ipntable-more-fixes-for-ppc64.patch b/meta/recipes-connectivity/iproute2/iproute2/0004-ipntable-more-fixes-for-ppc64.patch
deleted file mode 100644
index e841709..0000000
--- a/meta/recipes-connectivity/iproute2/iproute2/0004-ipntable-more-fixes-for-ppc64.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-Upstream-Status: Backport
-
-From ae70d9665615ae723a108947aa60b5f65caffab2 Mon Sep 17 00:00:00 2001
-From: Stephen Hemminger <stephen@networkplumber.org>
-Date: Mon, 4 Mar 2013 13:59:39 -0800
-Subject: [PATCH] ipntable: more fixes for ppc64
-
-Not all arch have sizeof(unsigned long long) == sizeof(__u64)
----
- ip/ipntable.c |   30 ++++++++++++++++++++----------
- 1 file changed, 20 insertions(+), 10 deletions(-)
-
-diff --git a/ip/ipntable.c b/ip/ipntable.c
-index a1a3c26..67b199e 100644
---- a/ip/ipntable.c
-+++ b/ip/ipntable.c
-@@ -560,28 +560,38 @@ int print_ntable(const struct sockaddr_nl *who, struct nlmsghdr *n, void *arg)
- 		fprintf(fp, "    ");
- 		fprintf(fp, "stats ");
- 
--		fprintf(fp, "allocs %llu ", ndts->ndts_allocs);
--		fprintf(fp, "destroys %llu ", ndts->ndts_destroys);
--		fprintf(fp, "hash_grows %llu ", ndts->ndts_hash_grows);
-+		fprintf(fp, "allocs %llu ",
-+			(unsigned long long) ndts->ndts_allocs);
-+		fprintf(fp, "destroys %llu ",
-+			(unsigned long long) ndts->ndts_destroys);
-+		fprintf(fp, "hash_grows %llu ",
-+			(unsigned long long) ndts->ndts_hash_grows);
- 
- 		fprintf(fp, "%s", _SL_);
- 		fprintf(fp, "        ");
- 
--		fprintf(fp, "res_failed %llu ", ndts->ndts_res_failed);
--		fprintf(fp, "lookups %llu ", ndts->ndts_lookups);
--		fprintf(fp, "hits %llu ", ndts->ndts_hits);
-+		fprintf(fp, "res_failed %llu ",
-+			(unsigned long long) ndts->ndts_res_failed);
-+		fprintf(fp, "lookups %llu ",
-+			(unsigned long long) ndts->ndts_lookups);
-+		fprintf(fp, "hits %llu ",
-+			(unsigned long long) ndts->ndts_hits);
- 
- 		fprintf(fp, "%s", _SL_);
- 		fprintf(fp, "        ");
- 
--		fprintf(fp, "rcv_probes_mcast %llu ", ndts->ndts_rcv_probes_mcast);
--		fprintf(fp, "rcv_probes_ucast %llu ", ndts->ndts_rcv_probes_ucast);
-+		fprintf(fp, "rcv_probes_mcast %llu ",
-+			(unsigned long long) ndts->ndts_rcv_probes_mcast);
-+		fprintf(fp, "rcv_probes_ucast %llu ",
-+			(unsigned long long) ndts->ndts_rcv_probes_ucast);
- 
- 		fprintf(fp, "%s", _SL_);
- 		fprintf(fp, "        ");
- 
--		fprintf(fp, "periodic_gc_runs %llu ", ndts->ndts_periodic_gc_runs);
--		fprintf(fp, "forced_gc_runs %llu ", ndts->ndts_forced_gc_runs);
-+		fprintf(fp, "periodic_gc_runs %llu ",
-+			(unsigned long long) ndts->ndts_periodic_gc_runs);
-+		fprintf(fp, "forced_gc_runs %llu ",
-+			(unsigned long long) ndts->ndts_forced_gc_runs);
- 
- 		fprintf(fp, "%s", _SL_);
- 	}
--- 
-1.7.9.7
-
diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.8.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.8.0.bb
deleted file mode 100644
index 65164cb..0000000
--- a/meta/recipes-connectivity/iproute2/iproute2_3.8.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require iproute2.inc
-
-PR = "r2"
-
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.tar.xz \
-           file://configure-cross.patch \
-           file://0001-Fix-compilation-error-of-m_ipt.c-with-Werror-enabled.patch \
-           file://0001-ip-fix-ipv6-ntable-on-ppc64.patch \
-           file://0003-fix-dependency-on-sizeof-__u64-sizeof-unsigned-long-.patch \
-           file://0004-ipntable-more-fixes-for-ppc64.patch \
-          "
-
-SRC_URI[md5sum] = "951622fd770428116dc165acba375414"
-SRC_URI[sha256sum] = "579145749f1aaf60e7c7a5de24b7f00fa2200a961094733c792b4ff139181e4f"
-
-# CFLAGS are computed in Makefile and reference CCOPTS
-#
-EXTRA_OEMAKE_append = " CCOPTS='${CFLAGS}'"
diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.9.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.9.0.bb
new file mode 100644
index 0000000..2bf3f2c
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.9.0.bb
@@ -0,0 +1,12 @@
+require iproute2.inc
+
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.tar.xz \
+           file://configure-cross.patch \
+          "
+
+SRC_URI[md5sum] = "fd9db28e4f411a1e74de65c919ae590f"
+SRC_URI[sha256sum] = "16f027af432a05085813a2f859b7d42dafd29b8c035ead830d37565b7397592d"
+
+# CFLAGS are computed in Makefile and reference CCOPTS
+#
+EXTRA_OEMAKE_append = " CCOPTS='${CFLAGS}'"
-- 
1.7.10.4



