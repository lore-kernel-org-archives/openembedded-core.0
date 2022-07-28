Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A38C5C04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 05:48:05 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.29455.1658987277088171195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 22:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=PwhhXzG1;
 spf=pass (domain: mvista.com, ip: 209.85.216.42,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f42.google.com with SMTP id
 w63-20020a17090a6bc500b001f3160a6011so2398346pjj.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 22:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9K6wf+Zadgealn1Zq4JA70x4zMVWCwYK2ViwSEDCoic=;
        b=PwhhXzG1o0g2DsHiqafj2A1+lWVsSpI8LP5+eFhsRnTqr9IGdy3z/ZnND9m6EzLyaR
         z2ndTV88bPFskJZjmSQdfkOyd2Ht1Dpwuc+8mC1YVrXC01TfphsYctQDROqaJYE74ZhI
         INHx72429UmBZbxAr6Q51dFWEfBCggWUvLJCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9K6wf+Zadgealn1Zq4JA70x4zMVWCwYK2ViwSEDCoic=;
        b=viTZohLgOxL5seQ9GXAdP1ntxXYD0wxCaxdbLDCbkYu0jNwqFaHRtReAUi7E16nNAC
         Xh0qSb0/SB2Z9x6YeCeKkmIdyaqBJYG3nqDr9w5Kz1txJjthTVfGpINGfkPe7SVmGHzu
         OWLIPHkqEeSgKDP6qPmBZOPDgI/5JzZJx/lel861Or/eL7Dbpli8rj+5pyZ/qPlahhtS
         mTLoYClkJjSG9i77dOEq9kVVOXV9imAvmEGb1WVYXkGW1PGHovPmWORNF+LWbSv+Tsiu
         d+tJs3TLajMQa/aCkAZ3CsFROkpw/62medgtHN4dLYsZYBH/CAFPiU/1mM8JLpdcGJ2x
         x4Dw==
X-Gm-Message-State: AJIora8ivBzqEmGPedZtpgg8aAA7ef2ZOfUC/gQT1ttIH3zDuyq6AMDC
	KSpncaYrI8zltxwOlezkdr9bwSAtVVGh7A==
X-Google-Smtp-Source: 
 AGRyM1tLUrPSVsPa82VOtJXVdwauJTUGKBqy0SZkt6Q/Ec1FlhJaI7VQ+AWh3IqpSO6QldnfXxxb7Q==
X-Received: by 2002:a17:902:dac6:b0:16d:bdf5:7084 with SMTP id
 q6-20020a170902dac600b0016dbdf57084mr3509046plx.55.1658987276009;
        Wed, 27 Jul 2022 22:47:56 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.242])
        by smtp.gmail.com with ESMTPSA id
 u12-20020a170903124c00b0016bea74d11esm81292plh.267.2022.07.27.22.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 22:47:55 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Thu, 28 Jul 2022 11:17:49 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] libtirpc: CVE-2021-46828 DoS vulnerability with lots
 of connections
Date: Thu, 28 Jul 2022 11:17:48 +0530
Message-Id: <20220728054748.384119-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 05:48:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168594

Source: http://git.linux-nfs.org/?p=steved/libtirpc.git;
MR: 120231
Type: Security Fix
Disposition: Backport from http://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=86529758570cef4c73fb9b9c4104fdc510f701ed
ChangeID: 544120a5f10a4717cd2c7291821a012e26b14b7f
Description:
        CVE-2021-46828 libtirpc: DoS vulnerability with lots of connections.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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


