Return-Path: <Li.Wang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1164F65E14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 08:11:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7C8BMpf000066
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 01:11:22 -0700 (PDT)
Received: from lwang1-OptiPlex-9010.corp.ad.wrs.com (128.224.162.134) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Tue, 12 Aug 2014 01:11:21 -0700
From: Li Wang <li.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Aug 2014 16:11:18 +0800
Message-ID: <1407831079-10358-1-git-send-email-li.wang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <53E9CBF2.1010200@windriver.com>
References: <53E9CBF2.1010200@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] rpcbind: add option to fix port number
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
X-List-Received-Date: Tue, 12 Aug 2014 08:11:21 -0000
Content-Type: text/plain

fix a random port to offer customer an option for select.

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 .../rpcbind_add_option_to_fix_port_number.patch    |   94 ++++++++++++++++++++
 meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb     |    1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch

diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch b/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
new file mode 100644
index 0000000..e627d77
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
@@ -0,0 +1,94 @@
+rpcbind: add option to fix port number
+
+fix a random port to offer customer an option for select.
+
+Upstream-Status: Pending
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ src/rpcb_svc_com.c |   17 +++++++++++++++++
+ src/rpcbind.c      |    6 +++++-
+ 2 files changed, 22 insertions(+), 1 deletion(-)
+
+diff --git a/src/rpcb_svc_com.c b/src/rpcb_svc_com.c
+index f6bd6bd..a2ef152 100644
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
+@@ -496,6 +497,7 @@ xdr_opaque_parms(XDR *xdrs, struct r_rmtcall_args *cap)
+ 
+ static struct rmtcallfd_list *rmthead;
+ static struct rmtcallfd_list *rmttail;
++extern unsigned short random_port;
+ 
+ int
+ create_rmtcall_fd(struct netconfig *nconf)
+@@ -503,6 +505,8 @@ create_rmtcall_fd(struct netconfig *nconf)
+ 	int fd;
+ 	struct rmtcallfd_list *rmt;
+ 	SVCXPRT *xprt;
++	struct __rpc_sockinfo si;
++	struct t_bind taddr;
+ 
+ 	if ((fd = __rpc_nconf2fd(nconf)) == -1) {
+ 		if (debugging)
+@@ -511,6 +515,19 @@ create_rmtcall_fd(struct netconfig *nconf)
+ 			nconf->nc_device, errno);
+ 		return (-1);
+ 	}
++
++	if (random_port) {
++		__rpc_fd2sockinfo(fd, &si);
++		memset(&taddr, 0, sizeof(taddr));
++		taddr.addr.maxlen = taddr.addr.len = si.si_alen;
++		taddr.addr.buf = malloc(si.si_alen);
++		if (taddr.addr.buf == NULL) {
++			return -1;
++		}
++		*(unsigned short *)(&(taddr.addr.buf[0])) = si.si_af;
++		*(unsigned short *)(&(taddr.addr.buf[2])) = htons(random_port);
++		xprt = svc_tli_create(fd, nconf, &taddr, RPC_MAXDATASIZE, RPC_MAXDATASIZE);
++	} else
+ 	xprt = svc_tli_create(fd, 0, (struct t_bind *) 0, 0, 0);
+ 	if (xprt == NULL) {
+ 		if (debugging)
+diff --git a/src/rpcbind.c b/src/rpcbind.c
+index 83dbe93..e82cf45 100644
+--- a/src/rpcbind.c
++++ b/src/rpcbind.c
+@@ -99,6 +99,7 @@ int runasdaemon = 0;
+ int insecure = 0;
+ int oldstyle_local = 0;
+ int verboselog = 0;
++unsigned short random_port = 0;
+ 
+ char **hosts = NULL;
+ int nhosts = 0;
+@@ -748,7 +749,7 @@ parseargs(int argc, char *argv[])
+ {
+ 	int c;
+ 	oldstyle_local = 1;
+-	while ((c = getopt(argc, argv, "adh:ilswf")) != -1) {
++	while ((c = getopt(argc, argv, "adh:p:ilswf")) != -1) {
+ 		switch (c) {
+ 		case 'a':
+ 			doabort = 1;	/* when debugging, do an abort on */
+@@ -766,6 +767,9 @@ parseargs(int argc, char *argv[])
+ 			if (hosts[nhosts - 1] == NULL)
+ 				errx(1, "Out of memory");
+ 			break;
++		case 'p':
++			random_port = atoi(optarg);
++			break;
+ 		case 'i':
+ 			insecure = 1;
+ 			break;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
index 89e567b..65351d0 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b46486e4c4a416602693a711bb5bfa39 \
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://0001-rpcbind-rpcuser-not-being-set-in-Makefile.am.patch \
+           file://rpcbind_add_option_to_fix_port_number.patch \
            file://init.d \
            ${UCLIBCPATCHES} \
            file://rpcbind.conf \
-- 
1.7.9.5


