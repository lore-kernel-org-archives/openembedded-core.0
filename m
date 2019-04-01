Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A85037CFEE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 08:57:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,295,1549900800"; d="scan'208";a="58196642"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Apr 2019 16:57:01 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 71C994CD77B1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 16:57:02 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 1 Apr 2019 16:57:03 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Apr 2019 16:57:38 +0800
Message-ID: <20190401085738.14028-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 71C994CD77B1.A952C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libtirpc:upgrade 1.0.3 -> 1.1.4
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
X-List-Received-Date: Mon, 01 Apr 2019 08:57:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from libtirpc_1.0.3.bb to libtirpc_1.1.4.bb.

-Delete libtirpc/libtirpc-1.0.4-rc1.patch beacuse this patch has been
adopted in the high version.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libtirpc/libtirpc-1.0.4-rc1.patch         | 103 ------------------
 .../{libtirpc_1.0.3.bb => libtirpc_1.1.4.bb}  |   5 +-
 2 files changed, 2 insertions(+), 106 deletions(-)
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/libtirpc-1.0.4-rc1.patch
 rename meta/recipes-extended/libtirpc/{libtirpc_1.0.3.bb => libtirpc_1.1.4.bb} (83%)

diff --git a/meta/recipes-extended/libtirpc/libtirpc/libtirpc-1.0.4-rc1.patch b/meta/recipes-extended/libtirpc/libtirpc/libtirpc-1.0.4-rc1.patch
deleted file mode 100644
index 6d40d3cce8..0000000000
--- a/meta/recipes-extended/libtirpc/libtirpc/libtirpc-1.0.4-rc1.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-Patch from Fedora https://src.fedoraproject.org/rpms/libtirpc/raw/master/f/libtirpc-1.0.4-rc1.patch
-
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-diff --git a/src/clnt_generic.c b/src/clnt_generic.c
-index e5a314f..3f3dabf 100644
---- a/src/clnt_generic.c
-+++ b/src/clnt_generic.c
-@@ -47,7 +47,6 @@
- 
- extern bool_t __rpc_is_local_host(const char *);
- int __rpc_raise_fd(int);
--extern int __binddynport(int fd);
- 
- #ifndef NETIDLEN
- #define	NETIDLEN 32
-@@ -341,8 +340,7 @@ clnt_tli_create(int fd, const struct netconfig *nconf,
- 		servtype = nconf->nc_semantics;
- 		if (!__rpc_fd2sockinfo(fd, &si))
- 			goto err;
--		if (__binddynport(fd) == -1)
--			goto err;
-+		bindresvport(fd, NULL);
- 	} else {
- 		if (!__rpc_fd2sockinfo(fd, &si))
- 			goto err;
-diff --git a/src/rpc_soc.c b/src/rpc_soc.c
-index af6c482..5a6eeb7 100644
---- a/src/rpc_soc.c
-+++ b/src/rpc_soc.c
-@@ -67,8 +67,6 @@
- 
- extern mutex_t	rpcsoc_lock;
- 
--extern int __binddynport(int fd);
--
- static CLIENT *clnt_com_create(struct sockaddr_in *, rpcprog_t, rpcvers_t,
-     int *, u_int, u_int, char *, int);
- static SVCXPRT *svc_com_create(int, u_int, u_int, char *);
-@@ -147,8 +145,7 @@ clnt_com_create(raddr, prog, vers, sockp, sendsz, recvsz, tp, flags)
- 	bindaddr.maxlen = bindaddr.len =  sizeof (struct sockaddr_in);
- 	bindaddr.buf = raddr;
- 
--	if (__binddynport(fd) == -1)
--		goto err;
-+	bindresvport(fd, NULL);
- 	cl = clnt_tli_create(fd, nconf, &bindaddr, prog, vers,
- 				sendsz, recvsz);
- 	if (cl) {
-diff --git a/src/rpcb_clnt.c b/src/rpcb_clnt.c
-index a94fc73..4b44364 100644
---- a/src/rpcb_clnt.c
-+++ b/src/rpcb_clnt.c
-@@ -752,7 +752,7 @@ __try_protocol_version_2(program, version, nconf, host, tp)
- 
- 	client = getpmaphandle(nconf, host, &parms.r_addr);
- 	if (client == NULL)
--		return (NULL);
-+		goto error;
- 
- 	/*
- 	 * Set retry timeout.
-@@ -771,11 +771,11 @@ __try_protocol_version_2(program, version, nconf, host, tp)
- 	if (clnt_st != RPC_SUCCESS) {
- 		rpc_createerr.cf_stat = RPC_PMAPFAILURE;
- 		clnt_geterr(client, &rpc_createerr.cf_error);
--		return (NULL);
-+		goto error;
- 	} else if (port == 0) {
- 		pmapaddress = NULL;
- 		rpc_createerr.cf_stat = RPC_PROGNOTREGISTERED;
--		return (NULL);
-+		goto error;
- 	}
- 	port = htons(port);
- 	CLNT_CONTROL(client, CLGET_SVC_ADDR, (char *)&remote);
-@@ -789,14 +789,24 @@ __try_protocol_version_2(program, version, nconf, host, tp)
- 			free(pmapaddress);
- 			pmapaddress = NULL;
- 		}
--		return (NULL);
-+		goto error;
- 	}
- 	memcpy(pmapaddress->buf, remote.buf, remote.len);
- 	memcpy(&((char *)pmapaddress->buf)[sizeof (short)],
- 			(char *)(void *)&port, sizeof (short));
- 	pmapaddress->len = pmapaddress->maxlen = remote.len;
- 
-+	CLNT_DESTROY(client);
- 	return pmapaddress;
-+
-+error:
-+	if (client) {
-+		CLNT_DESTROY(client);
-+		client = NULL;
-+
-+	}
-+	return (NULL);
-+
- }
- #endif
- 
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.0.3.bb b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
similarity index 83%
rename from meta/recipes-extended/libtirpc/libtirpc_1.0.3.bb
rename to meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
index f978c8c8ab..9c480b825f 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.0.3.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
@@ -10,13 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3 \
 PROVIDES = "virtual/librpc"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
-           file://libtirpc-1.0.4-rc1.patch \
            file://musl.patch \
            "
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
-SRC_URI[md5sum] = "f8403a10695348854e71d525c4db5931"
-SRC_URI[sha256sum] = "86c3a78fc1bddefa96111dd233124c703b22a78884203c55c3e06b3be6a0fd5e"
+SRC_URI[md5sum] = "f5d2a623e9dfbd818d2f3f3a4a878e3a"
+SRC_URI[sha256sum] = "2ca529f02292e10c158562295a1ffd95d2ce8af97820e3534fe1b0e3aec7561d"
 
 inherit autotools pkgconfig
 
-- 
2.20.1




