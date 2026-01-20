Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A08FD2ED1A
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 11:24:34 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4237.1768908268467843593
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 03:24:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yjODJ1k6;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4359249bbacso201893f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 03:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768908267; x=1769513067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ouxhyF1Zrlteu9EMDm5g6DFnJUAmtjmSFz1dGl+WH94=;
        b=yjODJ1k6VPA05wGEpda/QP6vWg7EFddTIKEoHElwomc5SN5HKgRwa3psOgA/r+kNo9
         GTBk6V94ECsvqx71hRCiVN+zBB27qudBDd73gviLNxMoiuzU9Lgu55KJaa4m5of2NVt4
         eynVgLgQ58LaqLwjryca58wHa37kV+StlapL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768908267; x=1769513067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ouxhyF1Zrlteu9EMDm5g6DFnJUAmtjmSFz1dGl+WH94=;
        b=LI4ELatLNZgvCVpeaQ7+AnlhqHAhnnkoCVljXnbCgfkvPP2+KVAgC7gxbTjZ/lkCcF
         3Te1Uzuue+1hM+S9ct2MQrg2uLLebZ6xM2lOU7LG9oVjlzCZTatbWj488jDrHkByuSqd
         KDHJsqeEtgrR5YVaAgim6qP+EQKwTJ56PmyBBaCibcmf3KeLsydafl3y+PP4PPDNl8DG
         brJi8CfcAziEPD2EP/07+kCw2g9n4fUPFZDijz0VcAxHdZ2Y46eMUu+IR67fqfbszAyy
         n/miqcIaCgHD8T20XNP2VI4zln9vEur0z4/leq2WUzaeWEHVKJWAcA2tBOyQwm2SXZe9
         FSAw==
X-Gm-Message-State: AOJu0Yw5hkDwVoUJp3G6b3fkt7IER0XadP19ozVHfx0j2lJaRZPYlt/q
	g9W9kwbWywMW6D004P9lmhhnCMPn2Piqz/uTUwHex2pv2k72jZxmJe52oiPZQ4nBz4z4cKFaTCm
	Q/V+3
X-Gm-Gg: AZuq6aILIPWHkKy53ajjLM4u80V86skmOdx6jK9GNsIp9330GJnw/34A3NWIKCtCo/X
	CC+7AQc6SUTMonvlCpXtuSoVXhdUCYGwur8sm32Zf/XfmpBXHx6HewcIIqApgGE2czc2qe/EmhW
	o9VhkWxIx8UPLksmIL6PAVJl4KR4QDWS44dqEspc98amIKmrMMgLDIFona+Kwpc4KgDy1mQXXre
	ncbKW9nClong8z03jUNmbd8OnOsv6WhRdBfaXBtoNYirpsHNfEuRGAyXRLzs3d9HMUiyCByC0Pd
	hnl1TaKCo9J5lh736PP2rz1chDR+xNFQrGwDR2pIKmquffltDGlVlWfANIKLMcl+LRPLC/JCWrz
	P+pHxc22JMMHbPfbw+SJIcmx9o5cAZKNlq9fAYSH72ORWd7hiVNqL/67ny6KEr8CArk7UT6ohYh
	slTVhhx9GQju2JPYRPXN1JFphmUUA5VX3x/wi7Gc35lvl53meXB87wCn/1hm8kWRHd7jgYh6Mnu
	QUOwV/nA0Wt6Tn2hBkFpA==
X-Received: by 2002:a5d:64c5:0:b0:432:5b18:2cc3 with SMTP id ffacd0b85a97d-434cc998591mr24278236f8f.4.1768908266383;
        Tue, 20 Jan 2026 03:24:26 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921df9sm29558435f8f.3.2026.01.20.03.24.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:24:25 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 02/15] gnupg: patch CVE-2025-68973
Date: Tue, 20 Jan 2026 12:23:47 +0100
Message-ID: <42828c49520b7548abb93644fb29ab33408d029f.1768906687.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768906687.git.yoann.congal@smile.fr>
References: <cover.1768906687.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 11:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229662

From: Peter Marko <peter.marko@siemens.com>

Pick patch from 2.4 branch per [1].
2.5 branch already reworked this and patch from that didn't apply.

[1] https://security-tracker.debian.org/tracker/CVE-2025-68973

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnupg/gnupg/CVE-2025-68973.patch          | 108 ++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.5.11.bb    |   1 +
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
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.11.bb b/meta/recipes-support/gnupg/gnupg_2.5.11.bb
index 9cc063f837..753eea6276 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.11.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.11.bb
@@ -19,6 +19,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/ftp/gcrypt/gnupg/"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
+           file://CVE-2025-68973.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"

