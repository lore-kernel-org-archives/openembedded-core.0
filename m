Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12DFC3F6B0
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 15:24:58 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.533.1659108297989917831
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 08:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ARp4RAES;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id h132so4257536pgc.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 08:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9/98zSRHaoVlwZxuQeyiCYG31cyIfSb9uXxpcH1k5cs=;
        b=ARp4RAESmLH6kOc2TWKINwuK1b+B6lT3WKyXTWN/5qocjYYAswRJfIbCmwYkE8kH4x
         12H/6f448X7Lv0yGJUwS51gEWJsS93tfhLQyhFs1W86YfFWlJq8sW4L726x6ouIvaTfK
         Q0/0q508BkySSUG8JVB/u6gyannuCDiv6/7EhkYnD5RIZFD6ElFh63Jt322dRjq0txzn
         wTt/l8skofKtrobzzL/TPZhqcETHPFKvxk4cspCroEVVXlAxC6lqeHj1Dh6nGQIm60V8
         fk4r3FwmE83qJ1sMByYYZYh20aac0zngr2jiN2m2KTt4PX8FEwdwlgIokFIDl5vDPC9W
         K7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9/98zSRHaoVlwZxuQeyiCYG31cyIfSb9uXxpcH1k5cs=;
        b=7fbMBaWyYtNBzGNyWxBa4hqa+p0E+1GtOFme5OPolf67NhLvaWUuuQY7ioXBL5KctL
         vkQO9Y+XoIO/jjUQxgIAgAEuO2Wd4gBV0cx9MYukiVHmHWC6A/zwmbJvRM0gOO0Z9qDO
         ZtHsc52qEf4PTbQOLq2vDIyPjeClootpgMbZp1JOKn1zHcmENuDcMJyxc5NPvXgaY+yF
         wgf7pl0qohltAVxCFh02/09YVoKNu9rh6mGAHFwGKSBHqo+0RqvGqsTFzwXWlPJv9ruX
         wtqeCnQi5+j71dKPQ4WzafqdQXI30AO4hXjMvIEMzGogMTD+dbAEUREmOEiIxRmE8XLm
         TvDA==
X-Gm-Message-State: AJIora+sbaoAxl4lBEY51HxrjbVKXfiEBFwzjGBnKLSyDzok3+9XdTuB
	zHDCCQYNELXJi2f2NLz/DM+8i+iV7U3DuAlb
X-Google-Smtp-Source: 
 AGRyM1sjWjDK8gE9QmC3j/hPVZtjjWL6oRETqfzwdB3vJH3HkEa1m0osjE0zcnzWjuoZIP9Q3Ci8XA==
X-Received: by 2002:a63:451e:0:b0:40d:c602:4e with SMTP id
 s30-20020a63451e000000b0040dc602004emr3337725pga.453.1659108296707;
        Fri, 29 Jul 2022 08:24:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 q16-20020a17090311d000b0016be6a554b5sm3889808plh.233.2022.07.29.08.24.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 08:24:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/7] libtirpc: CVE-2021-46828 DoS vulnerability
 with lots of connections
Date: Fri, 29 Jul 2022 05:24:11 -1000
Message-Id: 
 <73d2b640ad665f6ff3c4fbe8f5da4ef0dbb175f2.1659108121.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659108121.git.steve@sakoman.com>
References: <cover.1659108121.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 15:24:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168672

From: Hitendra Prajapati <hprajapati@mvista.com>

Source: http://git.linux-nfs.org/?p=steved/libtirpc.git;
MR: 120231
Type: Security Fix
Disposition: Backport from http://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=86529758570cef4c73fb9b9c4104fdc510f701ed
ChangeID: 544120a5f10a4717cd2c7291821a012e26b14b7f
Description:
        CVE-2021-46828 libtirpc: DoS vulnerability with lots of connections.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtirpc/libtirpc/CVE-2021-46828.patch    | 155 ++++++++++++++++++
 .../libtirpc/libtirpc_1.2.6.bb                |   4 +-
 2 files changed, 158 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/CVE-2021-46828.patch

diff --git a/meta/recipes-extended/libtirpc/libtirpc/CVE-2021-46828.patch b/meta/recipes-extended/libtirpc/libtirpc/CVE-2021-46828.patch
new file mode 100644
index 0000000000..c78e7ef4d5
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/CVE-2021-46828.patch
@@ -0,0 +1,155 @@
+From 48309e7cb230fc539c3edab0b3363f8ce973194f Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Thu, 28 Jul 2022 09:11:04 +0530
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
+index c23cd36..1729963 100644
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
+@@ -312,13 +315,14 @@ done:
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
+@@ -378,6 +382,16 @@ again:
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
+@@ -819,3 +833,49 @@ __svc_clean_idle(fd_set *fds, int timeout, bool_t cleanblock)
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
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb b/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb
index 10a324c3b6..fe4e30e61f 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3 \
 
 PROVIDES = "virtual/librpc"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
+	   file://CVE-2021-46828.patch \
+	  "
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
 SRC_URI[md5sum] = "b25f9cc18bfad50f7c446c77f4ae00bb"
-- 
2.25.1


