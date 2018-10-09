Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 335AD79202
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Oct 2018 11:44:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w99BiXMP029240
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Oct 2018 04:44:34 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 9 Oct 2018 04:44:32 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Oct 2018 19:44:31 +0800
Message-ID: <1539085471-213557-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] lttng-modules: Fix build failure by syncing up with kernel 4.19
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
X-List-Received-Date: Tue, 09 Oct 2018 11:44:33 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

linux-yocto-dev has been upreved to v4.19. This patch backports a patch from
upstream to make lttng-modules sync up with linux-yocto-dev and later
linux-yocto, and fix the following do_compile error.

| tmp/work/qemux86_64-poky-linux/lttng-modules/2.10.7-r0/lttng-modules-2.10.7/probes/../probes/lttng-tracepoint-event-impl.h:143:6: error: conflict
ing types for 'trace_sock_exceed_buf_limit'
|  void trace_##_name(_proto);
|       ^~~~~~

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...ose-sk-wmem-in-sock_exceed_buf_limit-trac.patch | 67 ++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-modules_2.10.7.bb  |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-net-expose-sk-wmem-in-sock_exceed_buf_limit-trac.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-net-expose-sk-wmem-in-sock_exceed_buf_limit-trac.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-net-expose-sk-wmem-in-sock_exceed_buf_limit-trac.patch
new file mode 100644
index 0000000..92e12df
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-net-expose-sk-wmem-in-sock_exceed_buf_limit-trac.patch
@@ -0,0 +1,67 @@
+From 9e67b4c94b94493123d38379bd9b3eceae23a6f1 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Fri, 7 Sep 2018 12:21:12 -0400
+Subject: [PATCH] Fix: net: expose sk wmem in sock_exceed_buf_limit tracepoint
+ (4.19)
+
+See upstream commit:
+
+  commit d6f19938eb031ee2158272757db33258153ae59c
+  Author: Yafang Shao <laoar.shao@gmail.com>
+  Date:   Sun Jul 1 23:31:30 2018 +0800
+
+    net: expose sk wmem in sock_exceed_buf_limit tracepoint
+
+    Currently trace_sock_exceed_buf_limit() only show rmem info,
+    but wmem limit may also be hit.
+    So expose wmem info in this tracepoint as well.
+
+    Regarding memcg, I think it is better to introduce a new tracepoint(if
+    that is needed), i.e. trace_memcg_limit_hit other than show memcg info in
+    trace_sock_exceed_buf_limit.
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Upstream-Status: Backport
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ instrumentation/events/lttng-module/sock.h | 23 ++++++++++++++++++++++-
+ 1 file changed, 22 insertions(+), 1 deletion(-)
+
+diff --git a/instrumentation/events/lttng-module/sock.h b/instrumentation/events/lttng-module/sock.h
+index 5cd02ca..cd0c92b 100644
+--- a/instrumentation/events/lttng-module/sock.h
++++ b/instrumentation/events/lttng-module/sock.h
+@@ -21,7 +21,28 @@ LTTNG_TRACEPOINT_EVENT(sock_rcvqueue_full,
+ 	)
+ )
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,15,0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,19,0))
++
++LTTNG_TRACEPOINT_EVENT(sock_exceed_buf_limit,
++
++	TP_PROTO(struct sock *sk, struct proto *prot, long allocated, int kind),
++
++	TP_ARGS(sk, prot, allocated, kind),
++
++	TP_FIELDS(
++		ctf_string(name, prot->name)
++		ctf_array(long, sysctl_mem, prot->sysctl_mem, 3)
++		ctf_integer(long, allocated, allocated)
++		ctf_integer(int, sysctl_rmem, sk_get_rmem0(sk, prot))
++		ctf_integer(int, rmem_alloc, atomic_read(&sk->sk_rmem_alloc))
++		ctf_integer(int, sysctl_wmem, sk_get_wmem0(sk, prot))
++		ctf_integer(int, wmem_alloc, refcount_read(&sk->sk_wmem_alloc))
++		ctf_integer(int, wmem_queued, sk->sk_wmem_queued)
++		ctf_integer(int, kind, kind)
++	)
++)
++
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,15,0))
+ 
+ LTTNG_TRACEPOINT_EVENT(sock_exceed_buf_limit,
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.7.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.7.bb
index 4f14106..f6c865a 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.10.7.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.7.bb
@@ -15,6 +15,7 @@ COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm).*-linux'
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
+           file://0001-Fix-net-expose-sk-wmem-in-sock_exceed_buf_limit-trac.patch \
 "
 
 SRC_URI[md5sum] = "d3cb4520948083bf1573a2e4cb7406aa"
-- 
2.7.4


