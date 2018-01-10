Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E66E2785E1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 01:55:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0A1tdI3012409
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jan 2018 17:55:40 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 9 Jan 2018 17:55:38 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jan 2018 09:53:06 +0800
Message-ID: <ec461cc74458e5548842da9b31116b8d0df5e304.1515548571.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1515548571.git.jackie.huang@windriver.com>
References: <cover.1515548571.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] rpcbind: Stop freeing a static pointer
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
X-List-Received-Date: Wed, 10 Jan 2018 01:55:39 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

commit 7ea36ee introduced a svc_freeargs() call
that ended up freeing static pointer.

It turns out the allocations for the rmt_args
is not necessary . The xdr routines (xdr_bytes) will
handle the memory management and the largest
possible message size is UDPMSGSIZE (due to UDP only)
which is smaller than RPC_BUF_MAX

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ..._callit_com-Stop-freeing-a-static-pointer.patch | 100 +++++++++++++++++++++
 meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb     |   1 +
 2 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/rpcbproc_callit_com-Stop-freeing-a-static-pointer.patch

diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbproc_callit_com-Stop-freeing-a-static-pointer.patch b/meta/recipes-extended/rpcbind/rpcbind/rpcbproc_callit_com-Stop-freeing-a-static-pointer.patch
new file mode 100644
index 0000000000..9a000d0285
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbproc_callit_com-Stop-freeing-a-static-pointer.patch
@@ -0,0 +1,100 @@
+From 7c7590ad536c0e24bef790cb1e65702fc54db566 Mon Sep 17 00:00:00 2001
+From: Steve Dickson <steved@redhat.com>
+Date: Tue, 30 May 2017 11:27:22 -0400
+Subject: [PATCH] rpcbproc_callit_com: Stop freeing a static pointer
+
+commit 7ea36ee introduced a svc_freeargs() call
+that ended up freeing static pointer.
+
+It turns out the allocations for the rmt_args
+is not necessary . The xdr routines (xdr_bytes) will
+handle the memory management and the largest
+possible message size is UDPMSGSIZE (due to UDP only)
+which is smaller than RPC_BUF_MAX
+
+Signed-off-by: Steve Dickson <steved@redhat.com>
+
+Upstream-Status: Backport
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ src/rpcb_svc_com.c | 39 ++++++---------------------------------
+ 1 file changed, 6 insertions(+), 33 deletions(-)
+
+diff --git a/src/rpcb_svc_com.c b/src/rpcb_svc_com.c
+index cb63afd..1fc2229 100644
+--- a/src/rpcb_svc_com.c
++++ b/src/rpcb_svc_com.c
+@@ -612,9 +612,9 @@ rpcbproc_callit_com(struct svc_req *rqstp, SVCXPRT *transp,
+ 	struct netconfig *nconf;
+ 	struct netbuf *caller;
+ 	struct r_rmtcall_args a;
+-	char *buf_alloc = NULL, *outbufp;
++	char *outbufp;
+ 	char *outbuf_alloc = NULL;
+-	char buf[RPC_BUF_MAX], outbuf[RPC_BUF_MAX];
++	char  outbuf[RPC_BUF_MAX];
+ 	struct netbuf *na = (struct netbuf *) NULL;
+ 	struct rpc_msg call_msg;
+ 	int outlen;
+@@ -635,36 +635,10 @@ rpcbproc_callit_com(struct svc_req *rqstp, SVCXPRT *transp,
+ 	}
+ 	if (si.si_socktype != SOCK_DGRAM)
+ 		return;	/* Only datagram type accepted */
+-	sendsz = __rpc_get_t_size(si.si_af, si.si_proto, UDPMSGSIZE);
+-	if (sendsz == 0) {	/* data transfer not supported */
+-		if (reply_type == RPCBPROC_INDIRECT)
+-			svcerr_systemerr(transp);
+-		return;
+-	}
+-	/*
+-	 * Should be multiple of 4 for XDR.
+-	 */
+-	sendsz = ((sendsz + 3) / 4) * 4;
+-	if (sendsz > RPC_BUF_MAX) {
+-#ifdef	notyet
+-		buf_alloc = alloca(sendsz);		/* not in IDR2? */
+-#else
+-		buf_alloc = malloc(sendsz);
+-#endif	/* notyet */
+-		if (buf_alloc == NULL) {
+-			if (debugging)
+-				xlog(LOG_DEBUG,
+-					"rpcbproc_callit_com:  No Memory!\n");
+-			if (reply_type == RPCBPROC_INDIRECT)
+-				svcerr_systemerr(transp);
+-			return;
+-		}
+-		a.rmt_args.args = buf_alloc;
+-	} else {
+-		a.rmt_args.args = buf;
+-	}
++	sendsz = UDPMSGSIZE;
+ 
+ 	call_msg.rm_xid = 0;	/* For error checking purposes */
++	memset(&a, 0, sizeof(a)); /* Zero out the input buffer */
+ 	if (!svc_getargs(transp, (xdrproc_t) xdr_rmtcall_args, (char *) &a)) {
+ 		if (reply_type == RPCBPROC_INDIRECT)
+ 			svcerr_decode(transp);
+@@ -704,7 +678,8 @@ rpcbproc_callit_com(struct svc_req *rqstp, SVCXPRT *transp,
+ 	if (rbl == (rpcblist_ptr)NULL) {
+ #ifdef RPCBIND_DEBUG
+ 		if (debugging)
+-			xlog(LOG_DEBUG, "not found\n");
++			xlog(LOG_DEBUG, "prog %lu vers %lu: not found\n", 
++				a.rmt_prog, a.rmt_vers);
+ #endif
+ 		if (reply_type == RPCBPROC_INDIRECT)
+ 			svcerr_noprog(transp);
+@@ -937,8 +912,6 @@ out:
+ 	}
+ 	if (local_uaddr)
+ 		free(local_uaddr);
+-	if (buf_alloc)
+-		free(buf_alloc);
+ 	if (outbuf_alloc)
+ 		free(outbuf_alloc);
+ 	if (na) {
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb
index d3eeaf94b6..dcdee6c468 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb
@@ -17,6 +17,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://rpcbind.service \
            file://0001-rpcbind-pair-all-svc_getargs-calls-with-svc_freeargs.patch \
            file://pmapproc_dump-Fixed-typo-in-memory-leak-patch.patch \
+           file://rpcbproc_callit_com-Stop-freeing-a-static-pointer.patch \
           "
 SRC_URI[md5sum] = "cf10cd41ed8228fc54c316191c1f07fe"
 SRC_URI[sha256sum] = "074a9a530dc7c11e0d905aa59bcb0847c009313f02e98d3d798aa9568f414c66"
-- 
2.11.0


