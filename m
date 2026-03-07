Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A54C1F55118
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 22:53:06 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19042.1772923981676060655
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 14:53:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WFBJI2GO;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48529c325f0so10434895e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 14:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772923980; x=1773528780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IsKR1+SnB1vrj8wiGq0g2iX5I0+sY+IuJ2KnQvo3jdM=;
        b=WFBJI2GOYq9CG7Ta05eriPobFETr90cJS37aivD6VsEoj6FWjMYOngfJJ9M2nUV+TC
         x3VQvHZiVEMha30nQKf/dJNyOwe2YLlzJr02UttkCb3vcBcoGG4Ei4n0aJm5EbjFYU2/
         X0h7SQcz3bDHX4oGKBQLap3aQ7zZZKPMrNq4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772923980; x=1773528780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IsKR1+SnB1vrj8wiGq0g2iX5I0+sY+IuJ2KnQvo3jdM=;
        b=CF49QLFSDwz9PNtTL59CQ70vcbhY+Qq158+Wif/TIG+NTURBr00BR+w9Pe0wdf7IQc
         ga+hUedMh8CN/Ze74VvIszpSKj7Is27xHAvNEGgThvF6OSzsB/+UEVKXHnpJWeV+jE1k
         MBWVJd/iwcES6o77vJTsI4885uyJL1v94sMXYu55UU8YCUFwk5dOo+i3OjxoCEoHgKOj
         uij9BDGIzDl2/FwR76pkXSWg1hm1Cm59iAsroMikf5exV0TqeTRHCK2onFsSljINaXLC
         Yv1Cnn/Fl+cDEX9gz9GYKOuYdJv511jXOXMKBCx6InbVPBDxK2Oza1X+ToeTQeafDXiU
         Imow==
X-Gm-Message-State: AOJu0YxdV38cVv+b6Enr289nTGlwrbCLDazc+/vKzabI2u/Zc8mb16KE
	1Tfqitp3TU/cqQK+pclvP4gSWtl4VHMjhNqRjmvjjy3K0Eoh9VQo7zl9SL/VJ71h3xk1VPLbMzA
	aCUQp
X-Gm-Gg: ATEYQzzVKIQSsBLUV2WGI8rl90WLJWImvhm2aONXPy91ISZBgLqFEZXlksh+L9PER+0
	nP39RileBOe5YrBlvhvo+snmwM/d/ETW7Nn2CSP5QtgRpi7QVWdZiEi16oY+TFPuC6Khp68wGyy
	nwon+XgXw0dGfT0H4GAN5VyGWHFgdjzYiaBEeC300G/s7qYgZqshHHwbXnKYgbPbhbPNiq8ghy6
	IwZyhb65vcTjiD8Cq97SfOJBsTqv1ouHz+90e28JpYVUxtOhRwcjm0nILsEzeBFsrGDndzPbz/A
	oaeLqeExm2lOgD0ouPhn/0mA/MMDBZv5n5DS1mBCcnspijCE+YQAEctqxVZDdOrDziCDHnxiSOk
	bUN5/ZYBC5KugsxaGcMAW7nWmdLI9feTOzAWzDJj5OOyyttfoOhOQtXmbDW3pR3k8O7mv+OXNVm
	bH01Q53nvOcZJsI3lpG0IbA2FGDkVKu+cBqoMDbkTd2JbcK1heEgtchVo1b31tWUe3BvnfcZNPh
	iA0jmolSIKaD0Il1gjetvmX/U8=
X-Received: by 2002:a05:600c:888c:b0:485:3812:36da with SMTP id 5b1f17b1804b1-48538123853mr1476945e9.9.1772923979742;
        Sat, 07 Mar 2026 14:52:59 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e3fsm133287175e9.6.2026.03.07.14.52.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 14:52:59 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/11] zlib: Fix CVE-2026-27171
Date: Sat,  7 Mar 2026 23:52:21 +0100
Message-ID: <f158dd570946b05b41d054e45fe594623f5387c6.1772923420.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772923420.git.yoann.congal@smile.fr>
References: <cover.1772923420.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 22:53:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232629

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Pick patch from [1] also mentioned in [2]

[1] https://github.com/madler/zlib/issues/904
[2] https://security-tracker.debian.org/tracker/CVE-2026-27171

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../zlib/zlib/CVE-2026-27171.patch            | 63 +++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.3.1.bb          |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2026-27171.patch

diff --git a/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch b/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
new file mode 100644
index 00000000000..e6a8a3eac5f
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
@@ -0,0 +1,63 @@
+From f234bdf5c0f94b681312452fcd5e36968221fa04 Mon Sep 17 00:00:00 2001
+From: Mark Adler <git@madler.net>
+Date: Sun, 21 Dec 2025 18:17:56 -0800
+Subject: [PATCH] Check for negative lengths in crc32_combine functions.
+
+Though zlib.h says that len2 must be non-negative, this avoids the
+possibility of an accidental infinite loop.
+
+Upstream-Status: Backport [https://github.com/madler/zlib/commit/ba829a458576d1ff0f26fc7230c6de816d1f6a77]
+CVE: CVE-2026-27171
+
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ crc32.c | 4 ++++
+ zlib.h  | 4 ++--
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/crc32.c b/crc32.c
+index 6c38f5c..33d8c79 100644
+--- a/crc32.c
++++ b/crc32.c
+@@ -1019,6 +1019,8 @@ unsigned long ZEXPORT crc32(unsigned long crc, const unsigned char FAR *buf,
+ 
+ /* ========================================================================= */
+ uLong ZEXPORT crc32_combine64(uLong crc1, uLong crc2, z_off64_t len2) {
++    if (len2 < 0)
++        return 0;
+ #ifdef DYNAMIC_CRC_TABLE
+     once(&made, make_crc_table);
+ #endif /* DYNAMIC_CRC_TABLE */
+@@ -1032,6 +1034,8 @@ uLong ZEXPORT crc32_combine(uLong crc1, uLong crc2, z_off_t len2) {
+ 
+ /* ========================================================================= */
+ uLong ZEXPORT crc32_combine_gen64(z_off64_t len2) {
++    if (len2 < 0)
++        return 0;
+ #ifdef DYNAMIC_CRC_TABLE
+     once(&made, make_crc_table);
+ #endif /* DYNAMIC_CRC_TABLE */
+diff --git a/zlib.h b/zlib.h
+index 8d4b932..8c7f8ac 100644
+--- a/zlib.h
++++ b/zlib.h
+@@ -1758,14 +1758,14 @@ ZEXTERN uLong ZEXPORT crc32_combine(uLong crc1, uLong crc2, z_off_t len2);
+    seq1 and seq2 with lengths len1 and len2, CRC-32 check values were
+    calculated for each, crc1 and crc2.  crc32_combine() returns the CRC-32
+    check value of seq1 and seq2 concatenated, requiring only crc1, crc2, and
+-   len2. len2 must be non-negative.
++   len2. len2 must be non-negative, otherwise zero is returned.
+ */
+ 
+ /*
+ ZEXTERN uLong ZEXPORT crc32_combine_gen(z_off_t len2);
+ 
+      Return the operator corresponding to length len2, to be used with
+-   crc32_combine_op(). len2 must be non-negative.
++   crc32_combine_op(). len2 must be non-negative, otherwise zero is returned.
+ */
+ 
+ ZEXTERN uLong ZEXPORT crc32_combine_op(uLong crc1, uLong crc2, uLong op);
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.1.bb
index 4992f834637..e42578fd7e0 100644
--- a/meta/recipes-core/zlib/zlib_1.3.1.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://zlib.h;beginline=6;endline=23;md5=5377232268e952e9ef6
 SRC_URI = "https://zlib.net/${BP}.tar.gz \
            file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
            file://run-ptest \
+           file://CVE-2026-27171.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 

