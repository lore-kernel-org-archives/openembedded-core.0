Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45991C61CE3
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:01:06 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15968.1787576463311596808
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 06:01:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Puil44Oa;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so25117735e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 06:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787576461; x=1788181261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jP2qecUDlO0Iot3X34adVv3eBw+Jb0C82RqwdUmmxtA=;
        b=Puil44Oa+lgoFAXleNMNistexxHYtZefUFCz6FONQLy/zovV2CtimZK3ntdCoyX+pI
         tjjkc4ud7vBTQouTzNJzY7JC+6KF43oHb7vOSqAbYgO3B33KegmmexVYTlAX7S8044qf
         azNh9K0XoYBVcHpyG3uOLGJ+rUtYZXyV1d7Zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576461; x=1788181261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jP2qecUDlO0Iot3X34adVv3eBw+Jb0C82RqwdUmmxtA=;
        b=P3BamkxHx6glCEQSEdcS/XUlpoCt0+k9EKVURgQLEWfxpZvOe6T1EU6sGPaGB3pq2V
         TC0ziCuzgxP4BTMKlaIo6JnnH844WQuir1iBng5ziYKeXGhd/1YLKwzQu7+TdhwoWGEf
         AtIsM+0rosn3MaWoBs6ZS1Ju1QoYgZI0uEqrxoJo3eLmbUquvinYA61ze1zpWzcIqATW
         kRnlEMCzcgGKfIxLsEVVCM0DKVrVwl5jZUjXWfxfsf4BpqXeRaXevWknGAd9dWZmdb+V
         WZ3bpiATdDsyH235mQY8PjnU/hRT6vAhaZeHNTQgmylxRUjkAWp8L7pus/RL5dqlznRU
         +rKg==
X-Gm-Message-State: AFuF++mCQrHY/LyZFsMLbmAVbisV0vUX/1FlJzILb2CIw6oy9RxvRnVr
	Zc11OzuKVfYEoFwmfm9wX6J8ruvRekLZKdpd2BhQEDFrTfVXKfxlqgOmVwVRJRmLy7yVNxGW5NS
	IrJmJCTg=
X-Gm-Gg: AR+sD13mHqPkxdtOlrz3lmx1uomS5QiiBuoczDm7Egju/LrICE/dtHb0pvWuuBRv3ab
	8TvKWh6ISoqWm5iiEoDvit+Tz3g0Xwcufd8cVXPK7p8SA0Ws3kE+uM46KMSmofUOwu2g08wHViv
	TwiwWX5L0ZpEq3EDCpOJIyVwPl6bieBfQOmvE8jf5WCfx/fEHwhMKDs1cjz4Hey0uGzF8NiI+UB
	mhFB/znyHsC798EaYVhAh/LBg25rj+Kp3D5qT97dXIFnpzbfK6bJ1tP4PK8BJb98xTwZIPSzs9p
	TZgsqNIlS+iQh47eOshV8vvmbw7iDO90JhMRd/fywZSjm+EbUm+BWabjjwrwFZaCts23dsAj/Zb
	YEdjynGd4FxLtwZtocILGN93YB2CjKeaTccDEhZYFSfF8mezYXWHSij/JAmTNctWxz5mdOGIQJ+
	nakCmX7t3V0BeYXEmT4l9RTr7HNR9DUZhsYBVHt/rykhlxDUbDaE2wWR92WbVIA95l4y3ULOoHI
	RJzXMu2E50Tvh1pJ3PQx/b6K3iK+uJDDcshRlDSjmDktAr4O59EPqix63/AU9RbI//as10=
X-Received: by 2002:a05:600c:5247:b0:499:8b00:5261 with SMTP id 5b1f17b1804b1-499c19a90a3mr175510805e9.8.1787576452562;
        Mon, 24 Aug 2026 06:00:52 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c35935f5sm61379865e9.2.2026.08.24.06.00.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:00:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 16/19] rpcbind: upgrade 1.2.8 -> 1.2.9
Date: Mon, 24 Aug 2026 14:59:58 +0200
Message-ID: <26cc79f9371470f5110aa1ce266e98890555d274.1787576160.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787576160.git.yoann.congal@smile.fr>
References: <cover.1787576160.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 13:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244115

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Includes fix for CVE-2026-16277

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-16277
[2] https://security-tracker.debian.org/tracker/CVE-2026-16277

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 00f9ac421f1a3c66d2d53b9bffb9a31111239198)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../0001-systemd-use-EnvironmentFile.patch    |  7 ++----
 ...pcbind_add_option_to_fix_port_number.patch | 25 ++++++++-----------
 .../{rpcbind_1.2.8.bb => rpcbind_1.2.9.bb}    |  2 +-
 3 files changed, 14 insertions(+), 20 deletions(-)
 rename meta/recipes-extended/rpcbind/{rpcbind_1.2.8.bb => rpcbind_1.2.9.bb} (96%)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
index 28d83e74f51..621cc343225 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
+++ b/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
@@ -1,4 +1,4 @@
-From 87a9931e4aa97d7b6eb3b25f26444e30e45e3e41 Mon Sep 17 00:00:00 2001
+From 43908891b9344054e23a7d9f4d6fc5b34b2406cf Mon Sep 17 00:00:00 2001
 From: Stefan Agner <stefan.agner@toradex.com>
 Date: Wed, 27 Aug 2025 11:30:48 +0800
 Subject: [PATCH] systemd: use EnvironmentFile
@@ -14,7 +14,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  2 files changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 6ede0af..d1ae5e4 100644
+index c46294c..1566386 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -86,5 +86,7 @@ AC_CHECK_HEADERS([nss.h])
@@ -42,6 +42,3 @@ index 771b944..5992098 100644
  ExecStart=@_sbindir@/rpcbind $RPCBIND_OPTIONS @warmstarts_opt@ -f
  
  [Install]
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch b/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
index 3205ff30861..f0a4df04e49 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
+++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
@@ -1,4 +1,4 @@
-From 285c193dc94b53763ac8d6f91229eaab37d45fc6 Mon Sep 17 00:00:00 2001
+From fc77df5fed834dd1cffc8c58adb4a13a9b97f5cf Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Wed, 27 Aug 2025 11:24:53 +0800
 Subject: [PATCH] add option to make users able to use fixed port number
@@ -38,18 +38,18 @@ index 15b70f9..4a6ffbc 100644
  .Fl h
  option is specified,
 diff --git a/src/rpcb_svc_com.c b/src/rpcb_svc_com.c
-index 1743dad..07a1c75 100644
+index 6d0d72d..2f10dac 100644
 --- a/src/rpcb_svc_com.c
 +++ b/src/rpcb_svc_com.c
-@@ -48,6 +48,7 @@
- #include <rpc/rpc.h>
+@@ -49,6 +49,7 @@
+ #include <rpc/rpc_com.h>
  #include <rpc/rpcb_prot.h>
  #include <rpc/svc_dg.h>
 +#include <rpc/rpc_com.h>
  #include <netconfig.h>
  #include <errno.h>
  #include <syslog.h>
-@@ -497,6 +498,7 @@ xdr_opaque_parms(XDR *xdrs, struct r_rmtcall_args *cap)
+@@ -499,6 +500,7 @@ xdr_opaque_parms(XDR *xdrs, struct r_rmtcall_args *cap)
  
  static struct rmtcallfd_list *rmthead;
  static struct rmtcallfd_list *rmttail;
@@ -57,7 +57,7 @@ index 1743dad..07a1c75 100644
  
  int
  create_rmtcall_fd(struct netconfig *nconf)
-@@ -504,6 +506,8 @@ create_rmtcall_fd(struct netconfig *nconf)
+@@ -506,6 +508,8 @@ create_rmtcall_fd(struct netconfig *nconf)
  	int fd;
  	struct rmtcallfd_list *rmt;
  	SVCXPRT *xprt;
@@ -66,7 +66,7 @@ index 1743dad..07a1c75 100644
  
  	if ((fd = __rpc_nconf2fd(nconf)) == -1) {
  		if (debugging)
-@@ -512,6 +516,19 @@ create_rmtcall_fd(struct netconfig *nconf)
+@@ -514,6 +518,19 @@ create_rmtcall_fd(struct netconfig *nconf)
  			nconf->nc_device, errno);
  		return (-1);
  	}
@@ -87,7 +87,7 @@ index 1743dad..07a1c75 100644
  	if (xprt == NULL) {
  		if (debugging)
 diff --git a/src/rpcbind.c b/src/rpcbind.c
-index bf7b499..7268907 100644
+index 4212377..7e7f79d 100644
 --- a/src/rpcbind.c
 +++ b/src/rpcbind.c
 @@ -112,6 +112,7 @@ int runasdaemon = 0;
@@ -98,7 +98,7 @@ index bf7b499..7268907 100644
  
  char **hosts = NULL;
  int nhosts = 0;
-@@ -959,7 +960,7 @@ parseargs(int argc, char *argv[])
+@@ -963,7 +964,7 @@ parseargs(int argc, char *argv[])
  {
  	int c;
  	oldstyle_local = 1;
@@ -107,7 +107,7 @@ index bf7b499..7268907 100644
  		switch (c) {
  		case 'a':
  			doabort = 1;	/* when debugging, do an abort on */
-@@ -977,6 +978,9 @@ parseargs(int argc, char *argv[])
+@@ -981,6 +982,9 @@ parseargs(int argc, char *argv[])
  			if (hosts[nhosts - 1] == NULL)
  				errx(1, "Out of memory");
  			break;
@@ -117,7 +117,7 @@ index bf7b499..7268907 100644
  		case 'i':
  			insecure = 1;
  			break;
-@@ -999,7 +1003,7 @@ parseargs(int argc, char *argv[])
+@@ -1003,7 +1007,7 @@ parseargs(int argc, char *argv[])
  			break;
  #endif
  		default:	/* error */
@@ -126,6 +126,3 @@ index bf7b499..7268907 100644
  			exit (1);
  		}
  	}
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb
similarity index 96%
rename from meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
rename to meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb
index bd8ba1e88af..692c421cd9a 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb
@@ -18,7 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://rpcbind_add_option_to_fix_port_number.patch \
            file://0001-systemd-use-EnvironmentFile.patch \
           "
-SRC_URI[sha256sum] = "964132c389918e8964d7334936b6dd10ef025b300c6b29e693ba0f29550e3de5"
+SRC_URI[sha256sum] = "ce5f1a87c566ef0b2897a28f50a75c1dc23fec413a46a7f4183423b6b6aa991b"
 
 inherit autotools update-rc.d systemd pkgconfig update-alternatives sourceforge-releases
 

