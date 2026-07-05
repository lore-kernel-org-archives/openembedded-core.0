Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283EBC44502
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:08 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139223.1783291384044626228
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xWo2RH7r;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4798bea72f9so1391870f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291382; x=1783896182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqwRFcJBP2ZeRxBbKsgXWP3iUER67Y2i32nPIOCdyHI=;
        b=xWo2RH7raSRuUFzgr0n4jM23sWx/4sQum/P1k7R+fEBG9VLnYOK2DkneTmYnc97lE6
         WvQ0PKhGWm0adF724x6eVVoWjeS+mWeKiU2z1+v8zH8+WR+xDFpQtvtUguz2noEW8LHy
         CBgZfooayfevhsJFKMYIYZ+viPHeNsTiTo/bU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291382; x=1783896182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rqwRFcJBP2ZeRxBbKsgXWP3iUER67Y2i32nPIOCdyHI=;
        b=djhzsft3c7FaLIJ1IS5r3+Zk8vVEPXXOckQlnQ+a7ORxZdJS+q4xsdFiWOg/YNsTTi
         f2Rp/PE2OI6Qpwib4XWeGXuKRUtGEeU18Xeayh4EvZp0L2xLdH1JXObg/i9Utf8B+EXj
         jjP/In1uYPbW/AooaGoobJQq+MVDD/mwr7odBrvrMWEIvpx/WcRMUrAmUM5Z4hUNGcSI
         efJQHp8kX3k3Y2iYuHZ3fdKFpxPJT2SWWy87xcOO5hZEPWxM3uoVGttNPwaSN5Ld8+xI
         SMC0Mt6U2F0J3e35uGnV89ohOYt1Jy35x7NKwC3S/1uiVRukZWIduY36qCroncE6r5eC
         QaZQ==
X-Gm-Message-State: AOJu0YzhnorQ/RJKS4HTYXOjvextQtRYi7oRJJpUGuILATwj9abaOaBB
	c9eyyU5VRZ+mZM1TYQlzp9a0SAxW/G3Z8FaSb89oo85o1e/Sf+dd9MXZu8ZwIdigJl0XUyK/M3U
	Gnp/hwsA=
X-Gm-Gg: AfdE7cmGgy5ySDaNikEsoIW5wnF1xE4ohRCpGbp8hj4jw8fCs2nCp6IKfLgbvX4id8y
	5g6ZNbBBXhWTiuUiutUUnr7seUz1gzW3cAM8cd1FJaPTUAuix12ofi1Nz9x7p8HyTRTEp90gYCe
	S0DFzGq2CkUeqjxGR5WyEkuf1UZt4PeLm/TPcCTByn3f244d/DKND84AyAdJAtZMUREiCf7ZIwO
	fvBVZKlg2EJcbDYPSl2AdfaU2gM/D3bJ+zJm/2I08RWGNtKkkGlPcLTBOSJ0tm735uWC3LoJc9n
	HM7K1V/lXiXyXi5k0jSKddoM5lbtrWRCDDh2m8tuhH/Jp8erg5DNFzNxU6JdJK+7NaNcHfWqgGm
	CHv5Z5RvzNGtSdwspioCvBbSBj/L870IvvKC/21/PPCxLXLanDlKIalgT4wJdfgaIw6uYeIGZCJ
	yIvZuskdb6/u19HIdl/6fD86nNPA==
X-Received: by 2002:adf:f00f:0:b0:475:f0c2:5b04 with SMTP id ffacd0b85a97d-47aad54d643mr6225608f8f.58.1783291382281;
        Sun, 05 Jul 2026 15:43:02 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 33/55] dhcpcd: patch CVE-2026-56117
Date: Mon,  6 Jul 2026 00:41:23 +0200
Message-ID: <0b05d28a94bbfee89ebc8b7faef7da9b30dc1c32.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240187

From: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>

Backport patch [1] mentionned in [2]

[1] https://github.com/NetworkConfiguration/dhcpcd/commit/78ea09ed1633a583dbcde6e7bab9df4639ec8a34

[2] https://security-tracker.debian.org/tracker/CVE-2026-56117

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../dhcpcd/dhcpcd_10.3.1.bb                   |   1 +
 .../dhcpcd/files/CVE-2026-56117.patch         | 167 ++++++++++++++++++
 2 files changed, 168 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
index e214c03416e..eb257cb27c1 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://CVE-2026-56113.patch \
            file://CVE-2026-56114.patch \
            file://CVE-2026-56116.patch \
+           file://CVE-2026-56117.patch \
            "
 
 SRCREV = "42ff6d2548209af3185473e6cb6f9d235c48bbf4"
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch
new file mode 100644
index 00000000000..2aabced8974
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch
@@ -0,0 +1,167 @@
+From d4b53e813f6119a4f090f6ba10a91778ce3cd1d5 Mon Sep 17 00:00:00 2001
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
+index ec1c633c..e6115f66 100644
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
+index ef592268..1f09fc8f 100644
+--- a/src/control.h
++++ b/src/control.h
+@@ -76,5 +76,5 @@ struct fd_list *control_new(struct dhcpcd_ctx *, int, unsigned int);
+ void control_free(struct fd_list *);
+ void control_delete(struct fd_list *);
+ int control_queue(struct fd_list *, void *, size_t);
+-void control_recvdata(struct fd_list *fd, char *, size_t);
++int control_recvdata(struct fd_list *fd, char *, size_t);
+ #endif
+diff --git a/src/privsep-control.c b/src/privsep-control.c
+index b9ea7f9c..3cdeedea 100644
+--- a/src/privsep-control.c
++++ b/src/privsep-control.c
+@@ -110,6 +110,7 @@ ps_ctl_dispatch(void *arg, struct ps_msghdr *psm, struct msghdr *msg)
+ 	struct iovec *iov = msg->msg_iov;
+ 	struct fd_list *fd;
+ 	unsigned int fd_flags = FD_SENDLEN;
++	int err;
+ 
+ 	switch (psm->ps_flags) {
+ 	case PS_CTL_PRIV:
+@@ -133,7 +134,11 @@ ps_ctl_dispatch(void *arg, struct ps_msghdr *psm, struct msghdr *msg)
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

