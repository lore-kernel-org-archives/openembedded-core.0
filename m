Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E927AC79FBF
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:23 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6328.1788939013462494502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HYToUbRG;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so3316326f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939012; x=1789543812; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6frAlEchsV8FNh7hyjSCuiiUPhVzWBPzEgYDNuQ/H7g=;
        b=HYToUbRGWb0keOD54oulDSR6pBa7nosjXLk4IpLvnxFE7lQdbrL+CFbQUa/JznEAXd
         6ofoKy2wyzzeaKE1Q/ybeNgCq4/Q2CleItciRXXMXakUZWfScC4cZ7OsV0SWPdiEwEq8
         M6ClJXxA0tiz/p3MbL5k85ufaX/Boq+beGur0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939012; x=1789543812;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6frAlEchsV8FNh7hyjSCuiiUPhVzWBPzEgYDNuQ/H7g=;
        b=d0zmLJJ5h9TRWGIEOcL0EP6e68/49+N9KjjpdZOSmMHEDv/vyVTs99j3iakuSY6aa2
         WzXjSz3A073vxKJKXgMW6MppxefFEbJJ5WhYfyih9tzGJ1sa/Ca/1FcLkngRmJF+D5UM
         onBB5127562dClngSHIldNDeHPQm+3XrssRFuAGbjJbYDtAk7HUNk0p8fHeCmN/HeLcT
         IJcA/c/BYJXgjEZqdADfneCc5mxm7IWhZHBSVb1KhoPcTD6Xdc8GPzO1wCyQ6V3qPoRY
         0PFrmzDCmgVjFApAdJ8s3UEIdZ1vYA7ET9BGFKj+Hxzuw2AhBANmiH+X8TJnvjlNb2DA
         x/aw==
X-Gm-Message-State: AFuF++lUhr3LL2DrO8LWh8D3krKriRoIqqdPIc67iElXwLiSGA8AD/nE
	oe307LBBBC/NC9mM13mtY3Wo0DcfNs6iMPH73N7ic9e9SW4Bao9Ol6pqyRwtuTrBgHlvZgscX/v
	pInvBJ4U=
X-Gm-Gg: AYBFou1Kl017vLViwLF9RzAJz63Og02cQlaBkz4qV6zl1okL2I8g8SChR3fvFv3bnrC
	JXdZaC6zDFj7xHf1sdaHCY2kbxNiGj1ZmGYeHpNGGM0guYAzqaYwHE/JqWWjJupQkP9qkugBWFg
	pfUoOxgSg98GSiQsGzmgDSyZ0HYRlBQwRwZ+OlnAt1AMPUbHKFRTUT4kp453e+kLXLqR3LtNIxX
	4hW56A9oBhIUGuVEFqShv22xGwTAJckATwDTl8GuETs/gnui8j3ycfUmhC480PJ5w69HwZw80zN
	4lsRJybtqaOLn16b50zE9RvLC5aMYMIeQjpEWdDa0r/nEVP5OGckkF7miRqsy1NkedmsleY8tb0
	XOUzuhsi+diydgjO8H133nOJCpcvLn9TlKpHRGbXHYbvP2/5I+jlNJ4uXnpxEHOHgnXq2YxAM7O
	uFUQR4uiLzlZM3H8UmGYe4dVr+Q5XWYW5aW5xf4zlroN3EJug5mhoQ7GVp+ER/x/HN4NHrfY+x/
	IgWN64/5TrmFACq/thTGikgwoiaO2YBuWptdAA3tYeyxEnBaFQ02lbkCNry0sA22u7tUJ51gj4=
X-Received: by 2002:a05:6000:2dc4:b0:485:8a47:5b8d with SMTP id ffacd0b85a97d-4858ddea668mr29865996f8f.42.1788939010692;
        Wed, 09 Sep 2026 00:30:10 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.30.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:30:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 25/38] wget: fix CVE-2026-16599
Date: Wed,  9 Sep 2026 09:29:24 +0200
Message-ID: <0c600b59a2f1625c5eeffc76ef0e048aa7534788.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245434

From: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>

GNU wget is vulnerable to denial of service in its FTP OPIE/S-KEY
authentication functionality.
The server-supplied sequence number from the FTP challenge line is used
as an iteration count for an MD5 key-derivation loop without any upper
bound validation. A malicious FTP server or a network attacker
positioned to intercept FTP traffic can send a crafted OPIE challenge
with a sequence number near INT_MAX, causing wget to perform up to
approximately 2.1 billion MD5 computations and suspend for some time.
The --timeout option does not mitigate this because it applies only to
network I/O, not CPU computation.
This issue was fixed in commit e9697d98e7249b0f68a6be040a4f3dcc5bc101fa

Reference:
https://nvd.nist.gov/vuln/detail/cve-2026-16599

Backport the patch to fix CVE-2026-16599.
https://gitlab.com/gnuwget/wget/-/commit/e9697d98e7249b0f68a6be040a4f3dcc5bc101fa

Signed-off-by: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: rewrapped commit message]
---
 .../wget/wget/CVE-2026-16599.patch            | 68 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-16599.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-16599.patch b/meta/recipes-extended/wget/wget/CVE-2026-16599.patch
new file mode 100644
index 00000000000..fbe8c0566cd
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-16599.patch
@@ -0,0 +1,68 @@
+From e9697d98e7249b0f68a6be040a4f3dcc5bc101fa Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Sat, 20 Jun 2026 14:39:54 +0200
+Subject: [PATCH] Fix server-controlled unbounded MD5 loop in FTP OPIE
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* src/ftp-basic.c (ftp_login): Limit the skey sequence to 9999.
+
+Report:
+wget accepts an unbounded server-controlled integer as the iteration
+count for its OPIE/S-KEY MD5 key-derivation loop. No upper bound is
+enforced on the sequence number supplied by the server in the FTP
+challenge line. The value is passed directly to skey_response() as a
+loop counter, causing wget to perform up to ~2.1 billion full MD5
+computations before responding to the authentication challenge.
+
+Reported-by: Michał Majchrowicz and Marcin Wyczechowski
+
+CVE: CVE-2026-16599
+
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/e9697d98e7249b0f68a6be040a4f3dcc5bc101fa]
+
+Signed-off-by: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
+---
+ src/ftp-basic.c | 15 +++++++++++----
+ 1 file changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/src/ftp-basic.c b/src/ftp-basic.c
+index 0f4bb821..af38a69a 100644
+--- a/src/ftp-basic.c
++++ b/src/ftp-basic.c
+@@ -204,12 +204,11 @@ ftp_login (int csock, const char *acc, const char *pass)
+       "331 s/key ",
+       "331 opiekey "
+     };
+-    size_t i;
+     const char *seed = NULL;
+ 
+-    for (i = 0; i < countof (skey_head); i++)
++    for (size_t i = 0; i < countof (skey_head); i++)
+       {
+-        int l = strlen (skey_head[i]);
++        size_t l = strlen (skey_head[i]);
+         if (0 == c_strncasecmp (skey_head[i], respline, l))
+           {
+             seed = respline + l;
+@@ -222,7 +221,15 @@ ftp_login (int csock, const char *acc, const char *pass)
+ 
+         /* Extract the sequence from SEED.  */
+         for (; c_isdigit (*seed); seed++)
+-          skey_sequence = 10 * skey_sequence + *seed - '0';
++          {
++            skey_sequence = 10 * skey_sequence + *seed - '0';
++            if (skey_sequence > 9999)
++              {
++                xfree (respline);
++                return FTPLOGREFUSED;
++              }
++          }
++
+         if (*seed == ' ')
+           ++seed;
+         else
+-- 
+GitLab
+
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-extended/wget/wget_1.25.0.bb
index dc4903429be..95845d695a9 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58471.patch \
            file://CVE-2026-58472.patch \
            file://CVE-2026-58472-regression.patch \
+           file://CVE-2026-16599.patch \
            "
 
 SRC_URI[sha256sum] = "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb726ac9d0da3784"

