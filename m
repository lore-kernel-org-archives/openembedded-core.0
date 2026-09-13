Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CB1C88E5C
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 20:12:15 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5899.1789330333528566352
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 13:12:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Rjr+lQgM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48431648f33so1514701f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 13:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789330332; x=1789935132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Eti8n3Nr4IpQwRVHdF+07texS0fATbhHwEHkpQi8a00=;
        b=Rjr+lQgMW9Ck7uyB8QyJ3n+dRm3f5++l86Ie+PwTkHzJL2VGcR9J43efUoVHV/5l7d
         aJoWY7Yii8m/TaQyFZ4O7e8Q2b+20/askugkbOezjjy6CpXF7x1kj335xUs4etz6GBvv
         DyiDHVFhCIc4eO51UmOisnzM5B5Bb5qrIMwvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330332; x=1789935132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Eti8n3Nr4IpQwRVHdF+07texS0fATbhHwEHkpQi8a00=;
        b=jLwdy4CihoWRaJHVX4Jc5UGOXiWThWHpzDzS73zVH+jTVy7Y0De7j+KklfZGLK6ZJG
         p2PUuMTZQVJLOhHi/2H8XOzsV5XtF7K3K1bsalAsAnkd6qFg6L29JWHOB3LD56gtyBPW
         DdsoSGp8fVk2eU8W5YKVUeUk2Vney63+Z5FlGxfzlsFLAMZFvYfSQtOE58cnHzrnoJlG
         GX51eOlmz03Bhrhy+fJ3TL7V9q5qLWiN6Sx+BJr2Fl5dkEI2kBjOVIBbbTef6PmkneFS
         OfD7owoZneg/aFxmH4K5VbA2ULix4b+oXZUTz9xbJFFWjnle0mKorzFGeKL2L/ibdZFG
         Q2YQ==
X-Gm-Message-State: AFuF++njrQZWUbxNMMn67CzEioEceV52/CU8PPpjsLwZGJ7wogmuzcgn
	IUOA1ATa18wS8ju1QkF3dNMvbtRUMII6J9epLrcxml8B9Ky9CgYIsL56+JH2LDnBpi3JMmg/sI6
	0GEwTxzY=
X-Gm-Gg: AYBFou1IrX6pkaBc7f8sBSwEv73CKyehyG4fpTSZmj2otx0gHG8kaEXuqS2P62m3scx
	JkTnbqIAI0MXT+w/ie0cuQR/kGXnwN6Fni6cpri3nB2rutiQeJXB3qxXe40eg5G5DUsAWDzoU2u
	9D2TLOmJTQ4Ed0m5vPSYnVfJXIGLyL5OnSX7XtkWSnm2UQ/xdXhfuZVKB63ipWdWO+9UHeZtjSV
	/WG9rivX151hHa0sexH9AsnyAbqH7BgZf5BHAJvXxgjA2KJVLz/8jcOnCeUtvuKolfoNMEWINT2
	kSLSw+Wqm1xWsOxfPXo5ndCQqDiPYmAOrKQmSCJtlxZJt0BLXj2b74ke0gVopF0OTcZNwL8S5XI
	HhMoIXN5tR9XBU86lm/gJQ6xo44IUo0bLmGbY139KLcVkIfr9ZVBn4k7mzz/pcgvFAJCfSh5Dzg
	/P6kcBcyGQHFLUq+kPuJC6C8cpxNDT7Sf154rg42DYoodcqWlMCLUhqG/EYxfLg95+0VDvD037c
	V5i0/A64xMELTsLOXBUTFAIIHAJkQ==
X-Received: by 2002:a05:600c:ad8:b0:49d:7d4:5f0d with SMTP id 5b1f17b1804b1-49e76079842mr28123125e9.16.1789330331764;
        Sun, 13 Sep 2026 13:12:11 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:16aa:3c0b:49da:7be3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fd3bsm21613916f8f.19.2026.09.13.13.12.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:12:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/11] rpcbind: upgrade 1.2.9 -> 1.3.1
Date: Sun, 13 Sep 2026 21:11:56 +0100
Message-ID: <20260913201158.687889-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913201158.687889-1-richard.purdie@linuxfoundation.org>
References: <20260913201158.687889-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 20:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245736

    rpcbind: only free the forward slot if the reply xid matched the request xid
    rpcbind: check for null netmask in addrmerge()
    rpcbind: restrict RPCBPROC_GETSTAT to loopback callers
    rpcbind: fully disable remote calls when --enable-rmtcalls is unset
    rpcbind: bound stats lists in rpcbs_getaddr() and rpcbs_rmtcall()
    rpcbind: only log failures in check_callit() if connection logging is enabled
    rpcinfo: stack buffer overflow in rpcinfo rpcbdump()
    rpcbind: fix leak of nconf in main()

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-systemd-use-EnvironmentFile.patch     |  2 +-
 ...rpcbind_add_option_to_fix_port_number.patch | 18 +++++++++---------
 .../{rpcbind_1.2.9.bb => rpcbind_1.3.1.bb}     |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-extended/rpcbind/{rpcbind_1.2.9.bb => rpcbind_1.3.1.bb} (96%)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
index 621cc343225..539a492ec75 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
+++ b/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
@@ -1,4 +1,4 @@
-From 43908891b9344054e23a7d9f4d6fc5b34b2406cf Mon Sep 17 00:00:00 2001
+From 69c128f5df9a24a8b05d4d2680361fa7d8711687 Mon Sep 17 00:00:00 2001
 From: Stefan Agner <stefan.agner@toradex.com>
 Date: Wed, 27 Aug 2025 11:30:48 +0800
 Subject: [PATCH] systemd: use EnvironmentFile
diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch b/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
index f0a4df04e49..bf07379e4ce 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
+++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
@@ -1,4 +1,4 @@
-From fc77df5fed834dd1cffc8c58adb4a13a9b97f5cf Mon Sep 17 00:00:00 2001
+From cfcfb89543b654c128708f81dc18458149398966 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Wed, 27 Aug 2025 11:24:53 +0800
 Subject: [PATCH] add option to make users able to use fixed port number
@@ -38,7 +38,7 @@ index 15b70f9..4a6ffbc 100644
  .Fl h
  option is specified,
 diff --git a/src/rpcb_svc_com.c b/src/rpcb_svc_com.c
-index 6d0d72d..2f10dac 100644
+index 2c007eb..4ea2002 100644
 --- a/src/rpcb_svc_com.c
 +++ b/src/rpcb_svc_com.c
 @@ -49,6 +49,7 @@
@@ -49,7 +49,7 @@ index 6d0d72d..2f10dac 100644
  #include <netconfig.h>
  #include <errno.h>
  #include <syslog.h>
-@@ -499,6 +500,7 @@ xdr_opaque_parms(XDR *xdrs, struct r_rmtcall_args *cap)
+@@ -503,6 +504,7 @@ xdr_opaque_parms(XDR *xdrs, struct r_rmtcall_args *cap)
  
  static struct rmtcallfd_list *rmthead;
  static struct rmtcallfd_list *rmttail;
@@ -57,7 +57,7 @@ index 6d0d72d..2f10dac 100644
  
  int
  create_rmtcall_fd(struct netconfig *nconf)
-@@ -506,6 +508,8 @@ create_rmtcall_fd(struct netconfig *nconf)
+@@ -510,6 +512,8 @@ create_rmtcall_fd(struct netconfig *nconf)
  	int fd;
  	struct rmtcallfd_list *rmt;
  	SVCXPRT *xprt;
@@ -66,7 +66,7 @@ index 6d0d72d..2f10dac 100644
  
  	if ((fd = __rpc_nconf2fd(nconf)) == -1) {
  		if (debugging)
-@@ -514,6 +518,19 @@ create_rmtcall_fd(struct netconfig *nconf)
+@@ -518,6 +522,19 @@ create_rmtcall_fd(struct netconfig *nconf)
  			nconf->nc_device, errno);
  		return (-1);
  	}
@@ -87,7 +87,7 @@ index 6d0d72d..2f10dac 100644
  	if (xprt == NULL) {
  		if (debugging)
 diff --git a/src/rpcbind.c b/src/rpcbind.c
-index 4212377..7e7f79d 100644
+index c39df97..f94b813 100644
 --- a/src/rpcbind.c
 +++ b/src/rpcbind.c
 @@ -112,6 +112,7 @@ int runasdaemon = 0;
@@ -98,7 +98,7 @@ index 4212377..7e7f79d 100644
  
  char **hosts = NULL;
  int nhosts = 0;
-@@ -963,7 +964,7 @@ parseargs(int argc, char *argv[])
+@@ -964,7 +965,7 @@ parseargs(int argc, char *argv[])
  {
  	int c;
  	oldstyle_local = 1;
@@ -107,7 +107,7 @@ index 4212377..7e7f79d 100644
  		switch (c) {
  		case 'a':
  			doabort = 1;	/* when debugging, do an abort on */
-@@ -981,6 +982,9 @@ parseargs(int argc, char *argv[])
+@@ -982,6 +983,9 @@ parseargs(int argc, char *argv[])
  			if (hosts[nhosts - 1] == NULL)
  				errx(1, "Out of memory");
  			break;
@@ -117,7 +117,7 @@ index 4212377..7e7f79d 100644
  		case 'i':
  			insecure = 1;
  			break;
-@@ -1003,7 +1007,7 @@ parseargs(int argc, char *argv[])
+@@ -1004,7 +1008,7 @@ parseargs(int argc, char *argv[])
  			break;
  #endif
  		default:	/* error */
diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb b/meta/recipes-extended/rpcbind/rpcbind_1.3.1.bb
similarity index 96%
rename from meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb
rename to meta/recipes-extended/rpcbind/rpcbind_1.3.1.bb
index 000ffe37040..bc7330e2942 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.3.1.bb
@@ -18,7 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://rpcbind_add_option_to_fix_port_number.patch \
            file://0001-systemd-use-EnvironmentFile.patch \
           "
-SRC_URI[sha256sum] = "ce5f1a87c566ef0b2897a28f50a75c1dc23fec413a46a7f4183423b6b6aa991b"
+SRC_URI[sha256sum] = "8e551b445f5172f8ef218845af342fb2a2d741b57ce8c777c781a01ea92f92a5"
 
 inherit autotools update-rc.d systemd pkgconfig update-alternatives sourceforge-releases
 

