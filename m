Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BDDC54F51
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:33 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7389.1785054623602304013
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ib+WD3Tn;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47db714766aso1407839f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054622; x=1785659422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RethtmsdU4lVPBn5lrWQDY0ZPa09J5re8mxnygao03c=;
        b=Ib+WD3TnAJK3owKzeACBB301ny1GYomBmjOReXUtKP6iBDoGGsleFWnujma3nnmiXL
         Hh2hhBG0TK3sNC+imHvnZQTLpP55Eg3n9nhvjq8n98UDYvPPOQ0xhkstF1lprA/q+N4+
         8pxY9QKwPRao2zCjqvhLhb3slI/wQofzMVMtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054622; x=1785659422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RethtmsdU4lVPBn5lrWQDY0ZPa09J5re8mxnygao03c=;
        b=HSqqeq4Az/EKXjBoRJICWWQEE1KXnH4cFTezTU71hBZfnwcJtPm4WHMs0uPmnzfb3m
         Gl9snfa/dzm9WeaWktS+BUzhYv5RlAKPaNlpjMTXQQZjgGmy//zJCx6bnnmS2w71Pnwg
         VgGhhPMb5LXLk5rvLxMpc2n+VCLS2CqDaKIorx80aBk83E+qm0Sy4xm3E1C30be48lWk
         2hBEd31Mh/rJ31VciF2M8MKPyP8Y/j+w2gzH5dhioMrIQu/aixadGsg60ZwlE86J6/eM
         9SAy6WV66mAa4cqfb6ktt9kD2ERhYXNg+/HHSJCq8u9+Nosi054TEeNtaRoQMmudX76I
         X9vQ==
X-Gm-Message-State: AOJu0Yy1sSChg4/0UUSbYErkw9/MRq6vZuhQAa14TwBiZj5uClfGKfHa
	E9zwqEEgzHO/rHv1JYViWXH8TKbPwDvkpJfzR40yy+LJtRzA482yT1H+0T6x6M9FnJ/DGGI6R95
	nAmV3ZYc=
X-Gm-Gg: AR+sD12NwfhRcrISClizsRKehexrWJzj2LNz6UIYDUCpfr+NCoIC9s0q8cOGwN7gX2g
	RUv6rP5uBHx+8zoAUyU+Un1H4fyPl7jlc8KU7Ff/O/xv7MYZ5Nm1maMq2BXG2U6dGvvP0nmgE0W
	eKt3vGuzRuZnE27CensZDNCLVOvURZMtcyBnpHOl606aaSDDodYtJ4xDHPk3tj3alyIYjuLa32m
	ecYHmF2mSEBlpAJu6yFr00DIBfj3YpdGbDcBKEfk2FarIBKSeHLe+bc1mI8TByKIeIm0TuMsUMz
	XOY4eZ/2VG8+13ZlYfu5y1OzI8LCjCetD7KuhM0XAtb3il1XtNEMfjhQifm4a1De4J/3fMp/ISV
	PxiOeu3VtlIFqjuHosSK+p0Xt/GRs7/nu5+sojAwz0b4apCfZqN7xNdceYH4aTCtCAi59YdjVRN
	JJE1UVRntZrltEhoonFP8VyCfsu4vGOVqpHDw0Vdzgq9BwJp1ZXO2MeOp871MLP/2/we6e5NJ/r
	fNRzQ==
X-Received: by 2002:a05:600c:8b4c:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-496b5b474e2mr53881705e9.6.1785054621885;
        Sun, 26 Jul 2026 01:30:21 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/31] cups: fix CVE-2026-39316
Date: Sun, 26 Jul 2026 10:29:44 +0200
Message-ID: <f7e5b2536577573a9a9a280c1dda9c21140cfb21.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242002

From: Deepak Rathore <deeratho@cisco.com>

Pick the upstream patch [1] as mentioned in [2].

[1] https://github.com/OpenPrinting/cups/commit/0142eeb58e0d718b7d2e1f0d5dd214bd2192cc7f
[2] https://security-tracker.debian.org/tracker/CVE-2026-39316

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2026-39316.patch            | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-39316.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 575dbf9c577..4c158aaee1b 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -31,6 +31,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-34979.patch \
            file://CVE-2026-34990.patch \
            file://CVE-2026-39314.patch \
+           file://CVE-2026-39316.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-39316.patch b/meta/recipes-extended/cups/cups/CVE-2026-39316.patch
new file mode 100644
index 00000000000..d3c9edf9745
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-39316.patch
@@ -0,0 +1,40 @@
+From 7c4d7951d189e931563f21086196d5a55fb2fa15 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Sun, 5 Apr 2026 11:33:23 -0400
+Subject: [PATCH] Expire per-printer subscriptions before deleting.
+
+CVE: CVE-2026-39316
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/0142eeb58e0d718b7d2e1f0d5dd214bd2192cc7f]
+
+Backport Changes:
+- Rebase scheduler/printers.c delete-printer context to the CUPS 2.4.11
+  source carried by this recipe.
+- Omit the upstream CHANGES.md release-note hunk because Yocto patch metadata
+  carries the CVE details and the target source release-note sections differ.
+
+(cherry picked from commit 0142eeb58e0d718b7d2e1f0d5dd214bd2192cc7f)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ scheduler/printers.c |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/scheduler/printers.c b/scheduler/printers.c
+index bf493a3..ca983f9 100644
+--- a/scheduler/printers.c
++++ b/scheduler/printers.c
+@@ -641,6 +641,12 @@ cupsdDeletePrinter(
+                      update ? "Job stopped due to printer being deleted." :
+ 		              "Job stopped.");
+ 
++ /*
++  * Expire subscriptions on the printer...
++  */
++
++  cupsdExpireSubscriptions(p, /*job*/NULL);
++
+  /*
+   * Remove the printer from the list...
+   */
+-- 
+2.43.7
+

