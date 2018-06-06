Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6817A78438
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 02:47:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w562l6Si009494
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jun 2018 19:47:21 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Tue, 5 Jun 2018 19:46:55 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jun 2018 10:54:45 +0800
Message-ID: <c1dfe81fb7102662a0bbb1f63e665b018b929a2a.1528252931.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528252931.git.liezhi.yang@windriver.com>
References: <cover.1528252931.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 10/11] rpcbind: add option to make user able to use fixed port number
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
X-List-Received-Date: Wed, 06 Jun 2018 02:47:30 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

Add option "-p" to specify fixed port number

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../rpcbind_add_option_to_fix_port_number.patch    | 130 +++++++++++++++++++++
 meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb     |   1 +
 2 files changed, 131 insertions(+)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch

diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch b/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
new file mode 100644
index 0000000..434b6b1
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
@@ -0,0 +1,130 @@
+From 76f8598fd20727908e760cbb497dd6a17eda4af5 Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Wed, 17 Sep 2014 13:22:14 +0800
+Subject: [PATCH] add option to make users able to use fixed port number
+
+Upstream-Status: Submitted [https://sourceforge.net/p/rpcbind/discussion/716839/thread/32af721d/]
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ man/rpcbind.8      |  4 +++-
+ src/rpcb_svc_com.c | 17 +++++++++++++++++
+ src/rpcbind.c      |  8 ++++++--
+ 3 files changed, 26 insertions(+), 3 deletions(-)
+
+diff --git a/man/rpcbind.8 b/man/rpcbind.8
+index af6200f..2e6146b 100644
+--- a/man/rpcbind.8
++++ b/man/rpcbind.8
+@@ -11,7 +11,7 @@
+ .Nd universal addresses to RPC program number mapper
+ .Sh SYNOPSIS
+ .Nm
+-.Op Fl adhiLls
++.Op Fl adhpiLls
+ .Sh DESCRIPTION
+ The
+ .Nm
+@@ -107,6 +107,8 @@ will automatically add
+ and if IPv6 is enabled,
+ .Li ::1
+ to the list.
++.It Fl p
++Bind for fixed UDP port number
+ .It Fl i
+ .Dq Insecure
+ mode.
+diff --git a/src/rpcb_svc_com.c b/src/rpcb_svc_com.c
+index 8aef9e5..c2632a4 100644
+--- a/src/rpcb_svc_com.c
++++ b/src/rpcb_svc_com.c
+@@ -48,6 +48,7 @@
+ #include <rpc/rpc.h>
+ #include <rpc/rpcb_prot.h>
+ #include <rpc/svc_dg.h>
++#include <rpc/rpc_com.h>
+ #include <netconfig.h>
+ #include <errno.h>
+ #include <syslog.h>
+@@ -497,6 +498,7 @@ xdr_opaque_parms(XDR *xdrs, struct r_rmtcall_args *cap)
+ 
+ static struct rmtcallfd_list *rmthead;
+ static struct rmtcallfd_list *rmttail;
++extern unsigned short fixed_port;
+ 
+ int
+ create_rmtcall_fd(struct netconfig *nconf)
+@@ -504,6 +506,8 @@ create_rmtcall_fd(struct netconfig *nconf)
+ 	int fd;
+ 	struct rmtcallfd_list *rmt;
+ 	SVCXPRT *xprt;
++	struct __rpc_sockinfo si;
++	struct t_bind taddr;
+ 
+ 	if ((fd = __rpc_nconf2fd(nconf)) == -1) {
+ 		if (debugging)
+@@ -512,6 +516,19 @@ create_rmtcall_fd(struct netconfig *nconf)
+ 			nconf->nc_device, errno);
+ 		return (-1);
+ 	}
++
++	if (fixed_port) {
++		__rpc_fd2sockinfo(fd, &si);
++		memset(&taddr, 0, sizeof(taddr));
++		taddr.addr.maxlen = taddr.addr.len = si.si_alen;
++		taddr.addr.buf = malloc(si.si_alen);
++		if (taddr.addr.buf == NULL) {
++			return -1;
++		}
++		*(unsigned short *)(&(taddr.addr.buf[0])) = si.si_af;
++		*(unsigned short *)(&(taddr.addr.buf[2])) = htons(fixed_port);
++		xprt = svc_tli_create(fd, nconf, &taddr, RPC_MAXDATASIZE, RPC_MAXDATASIZE);
++	} else
+ 	xprt = svc_tli_create(fd, 0, (struct t_bind *) 0, 0, 0);
+ 	if (xprt == NULL) {
+ 		if (debugging)
+diff --git a/src/rpcbind.c b/src/rpcbind.c
+index 137011b..dc3d2d6 100644
+--- a/src/rpcbind.c
++++ b/src/rpcbind.c
+@@ -111,6 +111,7 @@ int runasdaemon = 0;
+ int insecure = 0;
+ int oldstyle_local = 0;
+ int verboselog = 0;
++unsigned short fixed_port = 0;
+ 
+ char **hosts = NULL;
+ int nhosts = 0;
+@@ -869,7 +870,7 @@ parseargs(int argc, char *argv[])
+ {
+ 	int c;
+ 	oldstyle_local = 1;
+-	while ((c = getopt(argc, argv, "adh:ilswf")) != -1) {
++	while ((c = getopt(argc, argv, "adh:p:ilswf")) != -1) {
+ 		switch (c) {
+ 		case 'a':
+ 			doabort = 1;	/* when debugging, do an abort on */
+@@ -887,6 +888,9 @@ parseargs(int argc, char *argv[])
+ 			if (hosts[nhosts - 1] == NULL)
+ 				errx(1, "Out of memory");
+ 			break;
++		case 'p':
++			fixed_port = atoi(optarg);
++			break;
+ 		case 'i':
+ 			insecure = 1;
+ 			break;
+@@ -905,7 +909,7 @@ parseargs(int argc, char *argv[])
+ 			break;
+ #endif
+ 		default:	/* error */
+-			fprintf(stderr,	"usage: rpcbind [-adhilswf]\n");
++			fprintf(stderr,	"usage: rpcbind [-adhpilswf]\n");
+ 			exit (1);
+ 		}
+ 	}
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb
index dcdee6c..3c6774c 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb
@@ -18,6 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://0001-rpcbind-pair-all-svc_getargs-calls-with-svc_freeargs.patch \
            file://pmapproc_dump-Fixed-typo-in-memory-leak-patch.patch \
            file://rpcbproc_callit_com-Stop-freeing-a-static-pointer.patch \
+           file://rpcbind_add_option_to_fix_port_number.patch \
           "
 SRC_URI[md5sum] = "cf10cd41ed8228fc54c316191c1f07fe"
 SRC_URI[sha256sum] = "074a9a530dc7c11e0d905aa59bcb0847c009313f02e98d3d798aa9568f414c66"
-- 
2.7.4


