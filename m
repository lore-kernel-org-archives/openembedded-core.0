Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD84EC4450E
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:17 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5888.1783591627004265954
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZpmusERa;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493c59f740cso12802715e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783591625; x=1784196425; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U3buRPtu3q9no6eD4d0fEsDvc+kEbCP92fVpxuRrP9A=;
        b=ZpmusERaFdz4JPlVyQ35by5J/yaMpERmO/Xt2VlttaDbRa//gmRKD9xf8IBOfwm1OA
         cbV+EmvD9oprU5dboOTf1A9akKb7jUecyUu8R4kwWCIDUh+dkSD7gc3PzLIVtBbxflYC
         5FFwyLknNTcoc5Rh/3vb4EWtG6z4tVrMqaAZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591625; x=1784196425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U3buRPtu3q9no6eD4d0fEsDvc+kEbCP92fVpxuRrP9A=;
        b=mRhkceniKnaULhN1njVxtJw/NH8qr8lAfJ6r05x7BmHNQHH4wH0xXbPvHNo/2taTG5
         cwSDNDk/J8L43J/QDTeRmwxgLpIImjq8rjMTiCYr5hciHp4lv/0n1qCEDiw6ZD66J9SR
         Xsfhm/vRCL7uIMw8Vy7ODph4s+8iMkRHfCi567UiU5i3ncagrC5eShBQ4Lj1K2KXbfiw
         hjPmUQp4BBdP6XN7Uq3KB0p+aOM2zMeyGtlz7faP/GTUUdR8ijyJdC2Vsp4GrF8qlAsl
         KIoeU8NQWvNdt9QzFD5VqHc4ApjuANXfFabOMkeRSuUcHaEnQw83B9FnbZIyrIWCdWj+
         BBIg==
X-Gm-Message-State: AOJu0YwbhSxGT+J16/K7XACZI7jaj4ITwNn8NDSwAwXmQlsJnv5V8QXu
	YdWabuS6S5eeKk6oV0fE9AMLDhYSi1SMxbyWlb6cODDA+QfMgPCpjAkVBX5leD37AFOMw4CWw4R
	ZUwVA3Bo=
X-Gm-Gg: AfdE7claNSW+bBPY5Vkmk1LqPfGcvDaXVGDs+LCLXRNBChS7INsTXW6jhWd/4fNPR1v
	9LF/fq0gMdRewZLo0urZKYT4FI9zwgSsbU3Ssh1KA8b3FalSAk70d9AarAtxbv6V4/HjtzLtw4x
	UkRPVOpLGANOHOao302v12zKGMgBvm7U+15HeGYzJBSdKAaqCMPHLSq0dVUywfNlWVUk7P2/xxR
	usRKEc8PO81QhBsFKgVP8ENPcP9xiL177bsevBNQ/yd7MJazhYCe8dgeTvyLSAdm0nF58xBtG+m
	gvMwb0QXEt8SQqGhCxMhR+vkpZ8sb2VYxBOyjkX0AnKUsfgfg/+GhaHVC90YRiDU2PNNzI0ugNj
	pwvDuzuOresgiiSS6vYrdGNwK4BO3/NkZsycjXagPZg6bjZImWBaBJAW1midXCbasbt6IQmp8+e
	9NRWj3HxHIghjmC/3TGxu/i59dh9xdif2m3aDDp1+E4vcIsTiVzap9C/YY+jF160+KOkMijGJuf
	WPnjVT3m6O2tPHuHw==
X-Received: by 2002:a05:600c:4e0e:b0:490:e60b:6860 with SMTP id 5b1f17b1804b1-493e6892ea6mr58280155e9.7.1783591625132;
        Thu, 09 Jul 2026 03:07:05 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm149687135e9.2.2026.07.09.03.07.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:07:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/25] dhcpcd: patch CVE-2026-56117
Date: Thu,  9 Jul 2026 12:06:25 +0200
Message-ID: <629de8825792878b5b02e858fcf6e5c5d0954438.1783590688.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783590688.git.yoann.congal@smile.fr>
References: <cover.1783590688.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240556

From: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>

Backport patch [1] mentionned in [2]

[1] https://github.com/NetworkConfiguration/dhcpcd/commit/78ea09ed1633a583dbcde6e7bab9df4639ec8a34

[2] https://security-tracker.debian.org/tracker/CVE-2026-56117

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../dhcpcd/dhcpcd_10.0.6.bb                   |   1 +
 .../dhcpcd/files/CVE-2026-56117.patch         | 167 ++++++++++++++++++
 2 files changed, 168 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
index bc87b91503c..e6854e1c7f2 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            file://CVE-2026-56113.patch \
            file://CVE-2026-56114.patch \
+           file://CVE-2026-56117.patch \
            "
 
 SRCREV = "1c8ae59836fa87b4c63c598087f0460ec20ed862"
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch
new file mode 100644
index 00000000000..4f79453aeda
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch
@@ -0,0 +1,167 @@
+From 52e0746deeace02b0ea039441d6cdc58f026018d Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Mon, 22 Jun 2026 23:41:53 +0100
+Subject: [PATCH] control: Avoid hangup in the recvdata path
+
+Instead return an error and bubble it up where it can be
+hangup / freed more cleanly.
+
+Reported-by: CuB3y0nd <root@cubeyond.net>
+
+(cherry picked from commit 78ea09ed1633a583dbcde6e7bab9df4639ec8a34)
+
+CVE: CVE-2026-56117
+Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/78ea09ed1633a583dbcde6e7bab9df4639ec8a34]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/control.c         | 47 ++++++++++++++++++++++++-------------------
+ src/control.h         |  2 +-
+ src/privsep-control.c |  7 ++++++-
+ 3 files changed, 33 insertions(+), 23 deletions(-)
+
+diff --git a/src/control.c b/src/control.c
+index 17fd13aa..20480f69 100644
+--- a/src/control.c
++++ b/src/control.c
+@@ -115,10 +115,8 @@ control_handle_read(struct fd_list *fd)
+ 	bytes = read(fd->fd, buffer, sizeof(buffer) - 1);
+ 	if (bytes == -1)
+ 		logerr(__func__);
+-	if (bytes == -1 || bytes == 0) {
+-		control_hangup(fd);
+-		return -1;
+-	}
++	if (bytes == -1 || bytes == 0)
++		return (int)bytes;
+ 
+ #ifdef PRIVSEP
+ 	if (IN_PRIVSEP(fd->ctx)) {
+@@ -134,15 +132,13 @@ control_handle_read(struct fd_list *fd)
+ 		if (err == 1 &&
+ 		    ps_ctl_sendargs(fd, buffer, (size_t)bytes) == -1) {
+ 			logerr(__func__);
+-			control_free(fd);
+ 			return -1;
+ 		}
+-		return 0;
++		return 1;
+ 	}
+ #endif
+ 
+-	control_recvdata(fd, buffer, (size_t)bytes);
+-	return 0;
++	return control_recvdata(fd, buffer, (size_t)bytes);
+ }
+ 
+ static int
+@@ -205,23 +201,31 @@ static void
+ control_handle_data(void *arg, unsigned short events)
+ {
+ 	struct fd_list *fd = arg;
++	int err;
+ 
+ 	if (!(events & (ELE_READ | ELE_WRITE | ELE_HANGUP)))
+ 		logerrx("%s: unexpected event 0x%04x", __func__, events);
+ 
+ 	if (events & ELE_WRITE && !(events & ELE_HANGUP)) {
+-		if (control_handle_write(fd) == -1)
+-			return;
++		err = control_handle_write(fd);
++		if (err == -1)
++			goto hangup;
+ 	}
+ 	if (events & ELE_READ) {
+-		if (control_handle_read(fd) == -1)
+-			return;
++		err = control_handle_read(fd);
++		if (err == -1 || err == 0)
++			goto hangup;
+ 	}
+ 	if (events & ELE_HANGUP)
+-		control_hangup(fd);
++		goto hangup;
++
++	return;
++
++hangup:
++	control_hangup(fd);
+ }
+ 
+-void
++int
+ control_recvdata(struct fd_list *fd, char *data, size_t len)
+ {
+ 	char *p = data, *e;
+@@ -243,12 +247,13 @@ control_recvdata(struct fd_list *fd, char *data, size_t len)
+ 			if (e == NULL) {
+ 				errno = EINVAL;
+ 				logerrx("%s: no terminator", __func__);
+-				return;
++				return -1;
+ 			}
+-			if ((size_t)argc >= sizeof(argvp) / sizeof(argvp[0])) {
++			if ((size_t)argc + 1 >=
++			    sizeof(argvp) / sizeof(argvp[0])) {
+ 				errno = ENOBUFS;
+ 				logerrx("%s: no arg buffer", __func__);
+-				return;
++				return -1;
+ 			}
+ 			*ap++ = p;
+ 			argc++;
+@@ -268,12 +273,12 @@ control_recvdata(struct fd_list *fd, char *data, size_t len)
+ 		*ap = NULL;
+ 		if (dhcpcd_handleargs(fd->ctx, fd, argc, argvp) == -1) {
+ 			logerr(__func__);
+-			if (errno != EINTR && errno != EAGAIN) {
+-				control_free(fd);
+-				return;
+-			}
++			if (errno != EINTR && errno != EAGAIN)
++				return -1;
+ 		}
+ 	}
++
++	return 1;
+ }
+ 
+ struct fd_list *
+diff --git a/src/control.h b/src/control.h
+index f5e2bc7e..c5511dd7 100644
+--- a/src/control.h
++++ b/src/control.h
+@@ -75,5 +75,5 @@ struct fd_list *control_new(struct dhcpcd_ctx *, int, unsigned int);
+ void control_free(struct fd_list *);
+ void control_delete(struct fd_list *);
+ int control_queue(struct fd_list *, void *, size_t);
+-void control_recvdata(struct fd_list *fd, char *, size_t);
++int control_recvdata(struct fd_list *fd, char *, size_t);
+ #endif
+diff --git a/src/privsep-control.c b/src/privsep-control.c
+index 40bfb164..954126c0 100644
+--- a/src/privsep-control.c
++++ b/src/privsep-control.c
+@@ -108,6 +108,7 @@ ps_ctl_dispatch(void *arg, struct ps_msghdr *psm, struct msghdr *msg)
+ 	struct iovec *iov = msg->msg_iov;
+ 	struct fd_list *fd;
+ 	unsigned int fd_flags = FD_SENDLEN;
++	int err;
+ 
+ 	switch (psm->ps_flags) {
+ 	case PS_CTL_PRIV:
+@@ -131,7 +132,11 @@ ps_ctl_dispatch(void *arg, struct ps_msghdr *psm, struct msghdr *msg)
+ 		if (fd == NULL)
+ 			return -1;
+ 		ctx->ps_control_client = fd;
+-		control_recvdata(fd, iov->iov_base, iov->iov_len);
++		err = control_recvdata(fd, iov->iov_base, iov->iov_len);
++		if (err == -1 || err == 0) {
++			control_free(fd);
++			ctx->ps_control_client = NULL;
++		}
+ 		break;
+ 	case PS_CTL_EOF:
+ 		ctx->ps_control_client = NULL;
+-- 
+2.43.0
+

