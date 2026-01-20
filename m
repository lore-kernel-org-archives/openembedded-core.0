Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833B3D2ECE9
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:38:26 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6487.1768916297634856595
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZuY8fUs7;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4801d1daf53so37962585e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 05:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768916296; x=1769521096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YyXML8yoCkj/PCSwyDqtoqMBQTiQLRU/PI0Ln6/PHHg=;
        b=ZuY8fUs7kwNbi38Xg2WvH8+3x8YtXlMn1U6XwqTO28aowo6zGgtGr5TrlGNSCD5MCz
         cl47A+DgSl+egViCeg3r2CNuCQF3wQoRHHihxu5bPeGjA1QsTXOzJlyqKZf+m22CKK8z
         1mrqZw1HUaV0fvCZm3P4q6GW1dn3cCQ2DPFPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916296; x=1769521096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YyXML8yoCkj/PCSwyDqtoqMBQTiQLRU/PI0Ln6/PHHg=;
        b=jARZ/MtHPJN4WpERBnfOcWysAtoUUjg9T2cUy70iK0vweIf7F7IvOvZJMUHVxtJg4v
         Pd/IIKZ5HhNfIYtvwabWeQxhq9HG2zXeMGd3Gdfc+yRu8tZMGfwm6CATK/vgMwlw35RS
         fY0S9i/azFy/cPDBL78IM6/aYmNuMJMpIWqWIqcanvA/HTcp+ZbIATjbP6sJgHB5UJmw
         5yeitZql/1ztYisNYfIm5Of9pReAck/aTyZBi5p0luEZmipYsIKijQIYiAWMqtAXx2Au
         7MAG0OIL45E68p8mQw+zxkBgpwoJekp5XkS6197afbbvHIzGAX5GGcsHBTcMDydmrBnq
         lbYA==
X-Gm-Message-State: AOJu0YxC0Mm+ReeXggOzBUVC8fVsK6xgRS9Ko+Kdkf9G6F+25MhkhLAK
	Q+RJ9vUNQba80JfNin/gG0fEEYWBUOEMhH74iGid/R59RykhA46BHBdq16uFiCurN8bk2SYFmBE
	Pe1Sg
X-Gm-Gg: AY/fxX4t45z1b8q+qMOCC/4pEHLgdh6g2ws9dim78JwP3TdD/VEKSTg7fqe26VcSaSp
	UX6ycVlny0/NnuhFKm1VOJpUVC0zAHjZZ8uvA7It2Km6cWV2u+A2j2lCNk6DWXKqgX1/96ZqfKA
	B1quXje3uOmwljHXGH671lDKlEcK6sisi6zzwpm3ciMSW3v5BYDe6xzcTMctuOYzqRvVFV4/b5U
	+rxAwnA4w69kQLsBD3d5GAoCDXO1nQxhqKxu6lg827dV3jU4ii+Ak4698R69YE/pKrgpiQ6xZse
	9g5wVDV5Yzrrp7Qpw/k+NEuOcLAuCyjwbug+uWrGW4uC3RYmdHuQL5JR8fkWCkNQUwJJDSQmPFC
	y2WQZAR4oT5Hv+avmxVF58pV5AC/tUydSDp90TiR5HcmZW/HThc/iLVTISMou4jop1bERTePCVV
	2RzcaNDBdqs4ksQQdFjFMFsh6C3e18jvwFMOX3U7J/0jUIxNOl1LEkoUuDLOgVN0qfsPnXG2fYl
	BOEPrTZqMgtW+D8ULUY/Q==
X-Received: by 2002:a05:600c:8b81:b0:480:32da:f338 with SMTP id 5b1f17b1804b1-48032daf48bmr97511045e9.14.1768916295556;
        Tue, 20 Jan 2026 05:38:15 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm303400035e9.12.2026.01.20.05.38.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:38:14 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/26] gnupg: patch CVE-2025-68973
Date: Tue, 20 Jan 2026 14:37:40 +0100
Message-ID: <70def3daad5c4fb7cf14cc44b2d49dc9d6fbfa22.1768914702.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768914702.git.yoann.congal@smile.fr>
References: <cover.1768914702.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229724

From: Peter Marko <peter.marko@siemens.com>

Pick patch from 2.4 branch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2025-68973

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnupg/gnupg/CVE-2025-68973.patch          | 108 ++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.3.7.bb     |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch

diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch b/meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch
new file mode 100644
index 0000000000..1d5225361b
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch
@@ -0,0 +1,108 @@
+From 4ecc5122f20e10c17172ed72f4fa46c784b5fb48 Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Thu, 23 Oct 2025 11:36:04 +0200
+Subject: [PATCH] gpg: Fix possible memory corruption in the armor parser.
+
+* g10/armor.c (armor_filter): Fix faulty double increment.
+
+* common/iobuf.c (underflow_target): Assert that the filter
+implementations behave well.
+--
+
+This fixes a bug in a code path which can only be reached with special
+crafted input data and would then error out at an upper layer due to
+corrupt input (every second byte in the buffer is unitialized
+garbage).  No fuzzing has yet hit this case and we don't have a test
+case for this code path.  However memory corruption can never be
+tolerated as it always has the protential for remode code execution.
+
+Reported-by: 8b79fe4dd0581c1cd000e1fbecba9f39e16a396a
+Fixes-commit: c27c7416d5148865a513e007fb6f0a34993a6073
+which fixed
+Fixes-commit: 7d0efec7cf5ae110c99511abc32587ff0c45b14f
+Backported-from-master: 115d138ba599328005c5321c0ef9f00355838ca9
+
+The bug was introduced on 1999-01-07 by me:
+* armor.c: Rewrote large parts.
+which I fixed on 1999-03-02 but missed to fix the other case:
+* armor.c (armor_filter): Fixed armor bypassing.
+
+Below is base64+gzipped test data which can be used with valgrind to
+show access to uninitalized memory in write(2) in the unpatched code.
+
+--8<---------------cut here---------------start------------->8---
+H4sICIDd+WgCA3h4AO3QMQ6CQBCG0djOKbY3G05gscYFSRAJt/AExp6Di0cQG0ze
+a//MV0zOq3Pt+jFN3ZTKfLvP9ZLafqifJUe8juOjeZbVtSkbRPmRgICAgICAgICA
+gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
+gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
+gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
+gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
+gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
+gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
+gICAgICAgICAgICAgICAgICAgICAgICAgMCXF6dYDgAAAAAAAAAAAAAAAAAAAAAA
+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAC7E14AAAAA
+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADwZ94aieId3+8EAA==
+--8<---------------cut here---------------end--------------->8---
+
+CVE: CVE-2025-68973
+Upstream-Status: Backport [https://github.com/gpg/gnupg/commit/4ecc5122f20e10c17172ed72f4fa46c784b5fb48]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ common/iobuf.c | 8 +++++++-
+ g10/armor.c    | 4 ++--
+ 2 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/common/iobuf.c b/common/iobuf.c
+index 748e6935d..2497713c1 100644
+--- a/common/iobuf.c
++++ b/common/iobuf.c
+@@ -2041,6 +2041,8 @@ underflow_target (iobuf_t a, int clear_pending_eof, size_t target)
+ 	rc = 0;
+       else
+       {
++        size_t tmplen;
++
+ 	/* If no buffered data and drain buffer has been setup, and drain
+ 	 * buffer is largish, read data directly to drain buffer. */
+ 	if (a->d.len == 0
+@@ -2053,8 +2055,10 @@ underflow_target (iobuf_t a, int clear_pending_eof, size_t target)
+ 	      log_debug ("iobuf-%d.%d: underflow: A->FILTER (%lu bytes, to external drain)\n",
+ 			 a->no, a->subno, (ulong)len);
+ 
+-	    rc = a->filter (a->filter_ov, IOBUFCTRL_UNDERFLOW, a->chain,
++            tmplen = len;  /* Used to check for bugs in the filter.  */
++            rc = a->filter (a->filter_ov, IOBUFCTRL_UNDERFLOW, a->chain,
+ 			    a->e_d.buf, &len);
++            log_assert (len <= tmplen);
+ 	    a->e_d.used = len;
+ 	    len = 0;
+ 	  }
+@@ -2064,8 +2068,10 @@ underflow_target (iobuf_t a, int clear_pending_eof, size_t target)
+ 	      log_debug ("iobuf-%d.%d: underflow: A->FILTER (%lu bytes)\n",
+ 			 a->no, a->subno, (ulong)len);
+ 
++            tmplen = len;  /* Used to check for bugs in the filter.  */
+ 	    rc = a->filter (a->filter_ov, IOBUFCTRL_UNDERFLOW, a->chain,
+ 			    &a->d.buf[a->d.len], &len);
++            log_assert (len <= tmplen);
+ 	  }
+       }
+       a->d.len += len;
+diff --git a/g10/armor.c b/g10/armor.c
+index 81af15339..f8cfa86db 100644
+--- a/g10/armor.c
++++ b/g10/armor.c
+@@ -1312,8 +1312,8 @@ armor_filter( void *opaque, int control,
+ 	n = 0;
+ 	if( afx->buffer_len ) {
+             /* Copy the data from AFX->BUFFER to BUF.  */
+-	    for(; n < size && afx->buffer_pos < afx->buffer_len; n++ )
+-		buf[n++] = afx->buffer[afx->buffer_pos++];
++            for(; n < size && afx->buffer_pos < afx->buffer_len;)
++                buf[n++] = afx->buffer[afx->buffer_pos++];
+ 	    if( afx->buffer_pos >= afx->buffer_len )
+ 		afx->buffer_len = 0;
+ 	}
diff --git a/meta/recipes-support/gnupg/gnupg_2.3.7.bb b/meta/recipes-support/gnupg/gnupg_2.3.7.bb
index 27b2d3682a..f52ae921d4 100644
--- a/meta/recipes-support/gnupg/gnupg_2.3.7.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.3.7.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://CVE-2025-30258-0003.patch \
            file://CVE-2025-30258-0004.patch \
            file://CVE-2025-30258-0005.patch \
+           file://CVE-2025-68973.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"

