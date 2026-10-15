Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 892B8CCA463
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:03 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32834.1792040642290758602
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:04:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dTcVCkbF;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so20493915e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040640; x=1792645440; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IknFW2GZ2te9C8//Rgn9BDI0lvQROQsCyF3BxpZtWk4=;
        b=dTcVCkbFso+AnEABI/ZeibsXDA/Ak8Cb3XIQ3VS671Fn7ZxhLKqJuDVWVg7djSGkwG
         TZ5P6XKQggUmAvugXCcyg0pDbyo2lSkEh6Eo5P37BF2Kw8FFKiJ7wEEuPnbEb5ed+LMl
         qvzF3gZbkYj6dB9M+u2RFTdWvQUimD/blTmss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040640; x=1792645440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IknFW2GZ2te9C8//Rgn9BDI0lvQROQsCyF3BxpZtWk4=;
        b=0MQ5sr1LsArX/491ZVXPiG0twzFu521Brdpnl9FFkd6GE17avgywnAq8CuIyyM40IE
         1ckfKDZvAnGNRTyUFgwVhKMtfFLUVhyujssIpbSr7Wm42sLtsLIVEI6GDrF7dacq2JEu
         rIZXcjS8TxwI1eQhROw769YkCkWEKBIRL1tCz31tBeCF+/jtfQUdkCp3VRXB4o3bDSqL
         rlpDZUkR8YrV8TuCK8g2+xUEpuwNRBmIQHaO0PlSBj1B/eFdyhkk2lJdsFH9t9yRNZoB
         bt7obwTiDvC57ZZWSyzePYPL/l5brhuJqnV4df+KYB73bW/iHDWdtdGhRFcgPwZntKnu
         HgLg==
X-Gm-Message-State: AFq9FYI9rEJdtusR3eluNFSzo6i4vpNBl0WG5lm6Ix5XeINx+VE170ud
	JfO8ThOp6ncsyMG8EFUxfyN8QolAWcah+sTaJ4vzdtmGkbsNA2oUDwbUeRPBZKvQHryH7BEfvLQ
	zdCgbKXI=
X-Gm-Gg: AYBFou0i96fdAb1czwTTuUbjjs7SDeGEV1JvMUBG8mJROr0FZnpGS8uBEcTaGKTxrxX
	WxidOJBZCKdrXLvQz8/Vx+ZhMl5cDoGQtBXNdLxR0EfS4vB8xtNIIx6giZ1iIwu6nJVp8pW7vh2
	1rTKlH5gz+p7UBE2M9Gos8tiVFyb/ImtM0Y7HpdghuAxau+jczj1pYAWuoS3mQaZF7Ck0Sp4MsI
	BH5P5U9a+sRgQJGNRpMPC2wXLRoyVRnANncVh+Kn1nt2mtmT3dA2PnA+7AMfuPnjajhagJyfAg6
	D3wSBW02LAWkSxKEbR1bIs7G7yY7K52vlDCT2W3uJVogKBxzL7RCCgpsGJe3oDINdYPDZhR1+iy
	VUUwhdMYpYM11ycIvUejUwdk126SJKjPvxTZFC4BupdiLHJugawAIMesu4ko2EDHKmjwCH4fC8B
	jLNOU4C33Dx7yaUysYF530A4qXzN3H7GDLYyrOvUIMYWN1OjOyRbujntLf5e1qW7qDp/tVmpflU
	U5VoOFm/De9cLN5cPOTDh4jYPaZ6kbLd2MBEryz6qWtU2VoisOXxLe6QUt9rxnUCD9Jl1f4qjAZ
	cOtFhw8v
X-Received: by 2002:a05:600c:a11c:b0:4a1:97c6:d2e8 with SMTP id 5b1f17b1804b1-4a197c6d902mr212126445e9.32.1792040640399;
        Wed, 14 Oct 2026 22:04:00 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.04.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:04:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 34/55] openssh: fix CVE-2026-73283
Date: Thu, 15 Oct 2026 07:02:57 +0200
Message-ID: <9eafc35227e70fc4a0979e99b77a804684ef9bf1.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247832

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix that makes the authorized_keys
restrict keyword apply to tunnel forwarding. The upstream fix commit
is referenced in [1], and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/d322f2ccf7da095ce94d1d99cb563246f61487b
[2] https://www.cve.org/CVERecord?id=CVE-2026-73283

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssh/openssh/CVE-2026-73283.patch      | 42 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-73283.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-73283.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-73283.patch
new file mode 100644
index 00000000000..c9acb8dd137
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-73283.patch
@@ -0,0 +1,42 @@
+From d322f2ccf7da095ce94d1d99cb563246f61487b0 Mon Sep 17 00:00:00 2001
+From: djm@openbsd.org <djm@openbsd.org>
+Date: Tue, 14 Jul 2026 01:05:05 +0000
+Subject: [PATCH] upstream: make authorized_keys "restrict" keyword apply
+ correctly
+
+to tunnel forwarding (which is administratively disabled by default).
+
+Reported by Erichen, Institute of Computing Technology,
+Chinese Academy of Sciences
+
+OpenBSD-Commit-ID: 5b3cc987a64749c94b20e12755db32a83f8f01e6
+
+CVE: CVE-2026-73283
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/d322f2ccf7da095ce94d1d99cb563246f61487b0]
+
+Backport Changes:
+- Omitted the upstream OpenBSD RCS revision header update because it does
+  not apply to the OpenSSH 9.6p1 source revision.
+
+(cherry picked from commit d322f2ccf7da095ce94d1d99cb563246f61487b0)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ serverloop.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/serverloop.c b/serverloop.c
+index c1fe99d1..56d8be75 100644
+--- a/serverloop.c
++++ b/serverloop.c
+@@ -531,7 +531,8 @@ server_request_tun(struct ssh *ssh)
+ 		ssh_packet_send_debug(ssh, "Unsupported tunnel device mode.");
+ 		return NULL;
+ 	}
+-	if ((options.permit_tun & mode) == 0 || options.disable_forwarding) {
++	if ((options.permit_tun & mode) == 0 || options.disable_forwarding ||
++	    auth_opts->restricted) {
+ 		ssh_packet_send_debug(ssh, "Server has rejected tunnel device "
+ 		    "forwarding");
+ 		return NULL;
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index b48e262c725..f660e78dba7 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -44,6 +44,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-60001.patch \
            file://CVE-2026-60002.patch \
            file://CVE-2026-60000.patch \
+           file://CVE-2026-73283.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 

