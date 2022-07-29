Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CEE1C19F2B
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:47:38 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web08.46.1659106048783000287
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=mSaeU4YO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id 17so4877833pfy.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=W/aCYG4aLTytu7jxePlxUjFRwBD7XIcAdX2Xs47paS0=;
        b=mSaeU4YOcvrGvCHdtPMUxAUHPK2o/KqbBo6kiEpkpSEeRsT+RMNeVEgM6s3KuFuCmw
         28S3NplRU3kDLyeQR9dmJNyGle8Ofz+Nb6KaikNzSlJ4nLt4beNgw+wR6Go0w9ItyQl1
         vTEJFaGPkNfjFYpEj78wv+xRa5wfqL9k7BM+Q1ADiX98Xi8AO/pM3XQy4JhrjU6COU2f
         Lmso6INfsytQA5ogs11aWefoBlAU0OUB0nfWcaS/NNm84gvjOBJbHYFI4hWsolgXpjEJ
         b4JGAX8fmjxlvx2uNsJqhXrp9iBgKvBfalr2dBVphkRsymeFyBG8xkLbxza8jCzqDrNw
         ZZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W/aCYG4aLTytu7jxePlxUjFRwBD7XIcAdX2Xs47paS0=;
        b=eZKH1+PqsR02DmS97qjle/+BuvWDnjJ13ND2SOcf6K1gZfXuVkBO2uCDCaIkLfDg9R
         OqyiUFKVHRhGuk+3uDZq/tu3wqRv/didXzM8yFP9tqlXqU7+tePF6aoUGG3vJhDl8UTJ
         09VhbdbdmKteBgT+B1hbajAVsBGKZfZNBbPmybsXwWxgEAHH3bkUMvgoPPAx1nVvkTor
         awCFEICYsNBicaR4GLVhtxDoMPylyD54x0bXacIsrlbD0O64iLI2yRQQNT1ZC+n7l9iY
         Ujv3ds0ANhON+Mzi5o2wQ8MYgocM2ygTK/okncIX7N8LuToTICL5BNHeA0hBo/aiMIg+
         lKSQ==
X-Gm-Message-State: AJIora9hfwfXTAzbiWOmUyeWW7Qman2RJINNSXCoIcfZwV4EDR0aQR4+
	oo6PrHfclxcHr4edlO0VrHdu6yiLv0zCSz6Q
X-Google-Smtp-Source: 
 AGRyM1tkVPlUdxg2YMsrwlr5bWX9HCmC07DlkT3T6Ub6L3aFYhgTcdJylh0WBXwe2oWf5740MZSpTA==
X-Received: by 2002:a63:2205:0:b0:417:61fd:cd35 with SMTP id
 i5-20020a632205000000b0041761fdcd35mr3172920pgi.544.1659106047627;
        Fri, 29 Jul 2022 07:47:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.47.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:47:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/29] libtirpc: CVE-2021-46828 DoS vulnerability
 with lots of connections
Date: Fri, 29 Jul 2022 04:46:18 -1000
Message-Id: 
 <7eeaf4e400bf57fc9d0a376085d1788bc5c146b3.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:47:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168637

From: Hitendra Prajapati <hprajapati@mvista.com>

Source: http://git.linux-nfs.org/?p=steved/libtirpc.git;
MR: 120225
Type: Security Fix
Disposition: Backport from http://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=86529758570cef4c73fb9b9c4104fdc510f701ed
ChangeID: 29c32ee171a6a47e06c788e5c608fac9bb3a64b2
Description:
        CVE-2021-46828 libtirpc: DoS vulnerability with lots of connections.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtirpc/libtirpc/CVE-2021-46828.patch    | 155 ++++++++++++++++++
 .../libtirpc/libtirpc_1.3.2.bb                |   4 +-
 2 files changed, 158 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/CVE-2021-46828.patch

diff --git a/meta/recipes-extended/libtirpc/libtirpc/CVE-2021-46828.patch b/meta/recipes-extended/libtirpc/libtirpc/CVE-2021-46828.patch
new file mode 100644
index 0000000000..3d5e5b8db9
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/CVE-2021-46828.patch
@@ -0,0 +1,155 @@
+From 3ee23a0a5a8c2261e788acbee67722fcbecbea28 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Wed, 27 Jul 2022 17:34:21 +0530
+Subject: [PATCH] CVE-2021-46828
+
+Upstream-Status: Backport [http://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=86529758570cef4c73fb9b9c4104fdc510f701ed}
+CVE: CVE-2021-46828
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/svc.c    | 17 +++++++++++++-
+ src/svc_vc.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++++++-
+ 2 files changed, 77 insertions(+), 2 deletions(-)
+
+diff --git a/src/svc.c b/src/svc.c
+index 6db164b..3a8709f 100644
+--- a/src/svc.c
++++ b/src/svc.c
+@@ -57,7 +57,7 @@
+ 
+ #define max(a, b) (a > b ? a : b)
+ 
+-static SVCXPRT **__svc_xports;
++SVCXPRT **__svc_xports;
+ int __svc_maxrec;
+ 
+ /*
+@@ -194,6 +194,21 @@ __xprt_do_unregister (xprt, dolock)
+     rwlock_unlock (&svc_fd_lock);
+ }
+ 
++int
++svc_open_fds()
++{
++	int ix;
++	int nfds = 0;
++
++	rwlock_rdlock (&svc_fd_lock);
++	for (ix = 0; ix < svc_max_pollfd; ++ix) {
++		if (svc_pollfd[ix].fd != -1)
++			nfds++;
++	}
++	rwlock_unlock (&svc_fd_lock);
++	return (nfds);
++}
++
+ /*
+  * Add a service program to the callout list.
+  * The dispatch routine will be called when a rpc request for this
+diff --git a/src/svc_vc.c b/src/svc_vc.c
+index f1d9f00..3dc8a75 100644
+--- a/src/svc_vc.c
++++ b/src/svc_vc.c
+@@ -64,6 +64,8 @@
+ 
+ 
+ extern rwlock_t svc_fd_lock;
++extern SVCXPRT **__svc_xports;
++extern int svc_open_fds();
+ 
+ static SVCXPRT *makefd_xprt(int, u_int, u_int);
+ static bool_t rendezvous_request(SVCXPRT *, struct rpc_msg *);
+@@ -82,6 +84,7 @@ static void svc_vc_ops(SVCXPRT *);
+ static bool_t svc_vc_control(SVCXPRT *xprt, const u_int rq, void *in);
+ static bool_t svc_vc_rendezvous_control (SVCXPRT *xprt, const u_int rq,
+ 				   	     void *in);
++static int __svc_destroy_idle(int timeout);
+ 
+ struct cf_rendezvous { /* kept in xprt->xp_p1 for rendezvouser */
+ 	u_int sendsize;
+@@ -313,13 +316,14 @@ done:
+ 	return (xprt);
+ }
+ 
++
+ /*ARGSUSED*/
+ static bool_t
+ rendezvous_request(xprt, msg)
+ 	SVCXPRT *xprt;
+ 	struct rpc_msg *msg;
+ {
+-	int sock, flags;
++	int sock, flags, nfds, cnt;
+ 	struct cf_rendezvous *r;
+ 	struct cf_conn *cd;
+ 	struct sockaddr_storage addr;
+@@ -379,6 +383,16 @@ again:
+ 
+ 	gettimeofday(&cd->last_recv_time, NULL);
+ 
++	nfds = svc_open_fds();
++	if (nfds >= (_rpc_dtablesize() / 5) * 4) {
++		/* destroy idle connections */
++		cnt = __svc_destroy_idle(15);
++		if (cnt == 0) {
++			/* destroy least active */
++			__svc_destroy_idle(0);
++		}
++	}
++
+ 	return (FALSE); /* there is never an rpc msg to be processed */
+ }
+ 
+@@ -820,3 +834,49 @@ __svc_clean_idle(fd_set *fds, int timeout, bool_t cleanblock)
+ {
+ 	return FALSE;
+ }
++
++static int
++__svc_destroy_idle(int timeout)
++{
++	int i, ncleaned = 0;
++	SVCXPRT *xprt, *least_active;
++	struct timeval tv, tdiff, tmax;
++	struct cf_conn *cd;
++
++	gettimeofday(&tv, NULL);
++	tmax.tv_sec = tmax.tv_usec = 0;
++	least_active = NULL;
++	rwlock_wrlock(&svc_fd_lock);
++
++	for (i = 0; i <= svc_max_pollfd; i++) {
++		if (svc_pollfd[i].fd == -1)
++			continue;
++		xprt = __svc_xports[i];
++		if (xprt == NULL || xprt->xp_ops == NULL ||
++			xprt->xp_ops->xp_recv != svc_vc_recv)
++			continue;
++		cd = (struct cf_conn *)xprt->xp_p1;
++		if (!cd->nonblock)
++			continue;
++		if (timeout == 0) {
++			timersub(&tv, &cd->last_recv_time, &tdiff);
++			if (timercmp(&tdiff, &tmax, >)) {
++				tmax = tdiff;
++				least_active = xprt;
++			}
++			continue;
++		}
++		if (tv.tv_sec - cd->last_recv_time.tv_sec > timeout) {
++			__xprt_unregister_unlocked(xprt);
++			__svc_vc_dodestroy(xprt);
++			ncleaned++;
++		}
++	}
++	if (timeout == 0 && least_active != NULL) {
++		__xprt_unregister_unlocked(least_active);
++		__svc_vc_dodestroy(least_active);
++		ncleaned++;
++	}
++	rwlock_unlock(&svc_fd_lock);
++	return (ncleaned);
++}
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb
index 45b3d2befc..66bc4ecdd1 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3 \
 
 PROVIDES = "virtual/librpc"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
+	   file://CVE-2021-46828.patch \
+	  "
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
 SRC_URI[sha256sum] = "e24eb88b8ce7db3b7ca6eb80115dd1284abc5ec32a8deccfed2224fc2532b9fd"
-- 
2.25.1


