Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01FD5F357DB
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:23 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21698.1771943601048916874
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MzajdqoD;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so32908195e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943599; x=1772548399; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mw7Q7wTok2fxCDO/GicX8METeWMvxRfJserDvvCTGcU=;
        b=MzajdqoDf3xHYXDFVQ9ywpt5q8vacShSf+m4tXZqaOQ4i8AjL7EgNIKpyaV/npXbFf
         pe/ABNj5bx61+fH4Rrgw7PeyiXTkE/yQyUM6g1TnlXxB0/GLfHNJT8ppHhN7jkEJyZpy
         K46gC0HQGglwmZGvKHy9DsAC/jrkBCb7y/pb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943599; x=1772548399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mw7Q7wTok2fxCDO/GicX8METeWMvxRfJserDvvCTGcU=;
        b=XNLcC5n9KxLc+mk5D+5i99kpbPpYxO+cn8FLTWYRc6RTxlfsM0g40Mb0GnHw8M1j5Q
         bTYx6OJHblu5EXzTvNNXfEiW5vSEvhhe4l2UlSeh1ETCCia0Yya9hAIAhISJmaMbaLoe
         Nwr8PAs/rgnzU67weIWvom9mYHHbhn4SJT5vd0fR1RbhiA4juCAZSp0js6mVtCpSWg+Q
         XOFMQHOrsmgKHHxXQpmzyZwFNoKrodSU0TU4l6FiKgMLNOsZh4UjrICeDiXPG3iqEbji
         bXWyJ3Km7vOPptwNADJn3YtkDfnqhqDe1WlFes12Ojm2qPjEwMU1AqqlDaGSlVr1CWH9
         87rg==
X-Gm-Message-State: AOJu0Yxj6gl9tfgxZASInPTwXBQlP2QSNYDnHaCjY49FbN/Bt/s5Z3Mw
	gAyk0OkDjwHhCIDBlzFWh+wm3D3dOUToBTSTmKFzf0Kjo1xmm0TpltGUxP03jvMBPdaoSKmvJvf
	hjNBb
X-Gm-Gg: AZuq6aLnKtT22/eiExv9GJT0LUjXym/RHSvQpurA996HYI4UVEiWPCCJLPlBAe/9A9m
	5ULu9QE3OiA+pRgK3svJ23n6i32dPpfgrWalyzzC4lhdIu8nMAYogN/g//2lIk8OoTu2CpnU5R+
	VcCyAGwwueYblSwISiCXWvA/Ks4iMecX2TfIuds7e0OfoK8vYmoc0xtl6ko3LSnuKnymQPpAR06
	esHMTR68sd6pOAtueTIwUvwqhQUCwmh33bXPhihvYdg1g7V/PXnU0IRmmttQMU/fvT+qrz3iE6n
	vnsKm04FmZaDMfo2ZZgxgZEvNmrohwdxAWbECk46L9igAM15KYVhM4DcVYBlUz6SjixyQ7gLdBi
	Pxx/bTQSu1BWU6eToqXAEenqlAAndr+4EPlzMCYg0awktRzj7xym6DXlovE7iXeuEeHpcGfFmwv
	RBh+TO5xF2AclZr0+zzgYeO/0RTAWb/YixfgCDUwyuyyGK05wfAFJGUPVyKvDQPzW26up4bHwm1
	R3BqczsmqwdeGfxiKUoKJ+2v33G/913gvqJ2ubwWKUh
X-Received: by 2002:a05:600c:c8a:b0:47e:e78a:c833 with SMTP id 5b1f17b1804b1-483a95f8c27mr172629235e9.32.1771943599065;
        Tue, 24 Feb 2026 06:33:19 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:18 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 42/44] gnupg: patch CVE-2025-68973
Date: Tue, 24 Feb 2026 15:32:10 +0100
Message-ID: <9d69fb50f73a916a569d855a034a67553af58cfc.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231849

From: Peter Marko <peter.marko@siemens.com>

Pick patch from 2.4 branch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2025-68973

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnupg/gnupg/CVE-2025-68973.patch          | 108 ++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.4.8.bb     |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch

diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch b/meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch
new file mode 100644
index 00000000000..4eaf7cdb386
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
+@@ -2043,6 +2043,8 @@ underflow_target (iobuf_t a, int clear_pending_eof, size_t target)
+ 	rc = 0;
+       else
+       {
++        size_t tmplen;
++
+ 	/* If no buffered data and drain buffer has been setup, and drain
+ 	 * buffer is largish, read data directly to drain buffer. */
+ 	if (a->d.len == 0
+@@ -2055,8 +2057,10 @@ underflow_target (iobuf_t a, int clear_pending_eof, size_t target)
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
+@@ -2066,8 +2070,10 @@ underflow_target (iobuf_t a, int clear_pending_eof, size_t target)
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
+@@ -1302,8 +1302,8 @@ armor_filter( void *opaque, int control,
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
diff --git a/meta/recipes-support/gnupg/gnupg_2.4.8.bb b/meta/recipes-support/gnupg/gnupg_2.4.8.bb
index a6e777abf89..2d27f4454e5 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.8.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.8.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
+           file://CVE-2025-68973.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"

