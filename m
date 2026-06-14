Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B74CD98D8
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:21 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105061.1781424257237670958
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W5Qqordf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b613a17bso19545455e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424255; x=1782029055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYw3JxOl3x40iw4oD95WEKMpakEfyTw5zeBMDjs1/V4=;
        b=W5Qqordf2VdVRwxiRwUU/wULrwZ22lLiCjsB6PBXp0VSFp4BOASbgPaSlOT+cXbSkj
         CRybzzKG9LasNDgHRDLL6qyKwzOZVjtDBjogP0eQqCeZwAqbNOQL6ZXD6RVeNRyL3vqH
         46e1psVfOz2k26f3MGJCMZfCon2/Ddq78Lh40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424255; x=1782029055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iYw3JxOl3x40iw4oD95WEKMpakEfyTw5zeBMDjs1/V4=;
        b=SN19myQZrUzNe+uamHKr70IgO/aOxATxyrMPxEn8wxQ+xLaJuePH9jmVi615NFd9x6
         5LsLChhEwdR5pFaxBycWnNASvK+x1p9Q89B2LKvBpM3e6+ZkQTesSCFxgKHUWpUMGZV5
         H9ljkPCRJMkdceYpDwuINT8Yx9edcEZPh7rTYaTF4D9WS5z+uVi2Ixg+lhOOlOQujgAr
         4siwi4raKppNTQRkf7MWzmiG1dc6bfNlsmQp19qc0CZTd5YEf07ANo0PpqUcD/Q2EeHv
         7uBC9I4botrtqYi841GO64fpwCoInZAj4ouHs0z6xme8ARzeu+BWAt4awB01RLyWIXz4
         HBcQ==
X-Gm-Message-State: AOJu0Yya0ZxwKc4d23B/OeXpg0o2448sl8TaZSkyZxEuO4t1pcpuDX6H
	62b4OWLJWYGyp8lWX8maYpVy+5MaSeHga6F76s9zKrDdI/8VOx9Rs9+GoRodlJjPbQ+6rP3cDZ3
	pfaBl
X-Gm-Gg: Acq92OGvOjMvS+rLHpXK2kYS+VBD+Sr+Ga/MTJjWeEfRkPKM/fwhJk1ZSu+rMcwhVWf
	punO9E/yMTVdmNTtOhenGmZPHR0lvIh5lcyD0NfIeRbDfaoJD6n4+ujy7mv54EJ3+XNENQuCf0B
	7vLbxUZAV+4NlNV+P8WaxquZ5QFhwVdR9Q4MSoF67Z+edIJr83sOXxkIAzPD1Jp8FFaIPM47fGs
	3KF2VZIzfqsOJ6hMOZAMs2oUJwSC5WGq7ejjmUqwnqr4/mkpklXsWh67ehdD8G4GEz6yjXrIb8Y
	ccyfBjRsMfOpZe21f56vDcS4HlS93P50XtRLcYZaDnygSw0OASjiNZb4YP7zMrOqNNA9R2Hb8xZ
	DWbkzImWTdp1r+E/2C0Bn8XZmslPlEfanp0q6+EcKvQ1YYd73rN699w/G5FNxX52ChczqmSZN08
	XPhnGv9YiMxTt5q8c7CoRwYlQICL7sqd8BX1VSQ/QiCUY63YmuQflR
X-Received: by 2002:a05:600c:81c5:b0:490:44eb:c1e0 with SMTP id 5b1f17b1804b1-490ec5019b9mr103091965e9.21.1781424255352;
        Sun, 14 Jun 2026 01:04:15 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.04.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:04:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 43/56] rpcbind: upgrade 1.2.8 -> 1.2.9
Date: Sun, 14 Jun 2026 09:02:54 +0100
Message-ID: <20260614080307.4017177-43-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238727

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
 

