Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE38AC55174
	for <webhook@archiver.kernel.org>; Sat,  8 Aug 2026 14:34:48 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6907.1786199683221251229
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2026 07:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RxciIUiD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4980dc26022so4397335e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 07:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786199681; x=1786804481; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hg07TZZKR6ywbtsGPC0Y9RI6YUcFG3mbs/Fj5WVuVxU=;
        b=RxciIUiDezKXmJLljfHxS2D3Godt5eY69zUfAiE8deTe08HNqpTdznipT55zq0mwMB
         hPdVIHEZGqZeYWYq3ksuSQ8F863gCApzUYt4xtIyB10nBYVMgq7MSNOtXNG+kIFD4DPL
         9XRPV5SwAw5sLaXKS9Xo3KVps3v9wUMLUS+HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786199681; x=1786804481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hg07TZZKR6ywbtsGPC0Y9RI6YUcFG3mbs/Fj5WVuVxU=;
        b=pv+pbrQtlpJm7FbvLOfbV9mr4O6ygt5ZWZzG70z4cXK4atRPXXzEG+StD8FtiHzBwQ
         5V6tMrBIk+hEtd7JPsmB8Q5vUFm9n+CnLJ19MMc0UTYH/aHtfXHgyA4cP94nwQHQ4Cpl
         MHW6hCCYHy3T/YvRmrLVmXcyo74Zg80sIZ7tjGdAxu3mHVA3KdCPLa24602YHxlQDpv1
         fvsJDnhawNlY+2EqifekMDzBN0ohzcbORLFCjpj64C5DHVH554mGhYK4ia59GvGv0VNj
         MaE6uWYtx6KEGjm35mGSt9lVxb+Pw4Pn2VE3mDEYR8HN4OYypIw63PPG6OPIS5+5+ANL
         /x8Q==
X-Gm-Message-State: AOJu0YzhSPN6SdOZSIuNSpkHIxBjics3zdj4lu8KRyu5qsEqSWXub3BQ
	hI1CQGkHlCoEwYGoZ4J4Q3zJPWL6bQTHVfg7nz09n44jsDiU1ezL6riPx4TY39a2/ov0S6APA+o
	WUAzsOM0=
X-Gm-Gg: AR+sD10M/iB3ITmnp2t2cuhNnYHGUFOIGRrfLscxRk6LJgEaDnW2vpedG2ebiLJRW97
	T0pONsclrx/CrYlJyieBl5XM/m610I0QgG/iJryCMfqK7DZH2OPiEEFbo1zoUIzZdmP5CUP+7o8
	HsvfEFBSIZbzU2uBNao6ssIQA1ZPwShFUPiBu4vqv/xbEy3ikMZSYJFlzptqBd8mKfIn3dVRfFg
	71s49qhiRafIHzdELPVe4i2i8hl5CuyiB4LiOP3KEtIcNwzvFoKMvfzeF9m4Lv3dVssiuPwk2Pp
	PsyxwSiNBc3wVz5gAYfvZ0e8hcieOXpNKslo2atRUmfMtDjnk7yGzpOqBsr6mzi5ep+hHJWLxgh
	KKtFJAePQtTuNhAiRuAOecu3Z8MT+himENW46SefXnzKqUDeoEg14Ni/0rGs1PxvYgt+CMU7Qiv
	nr7bznghyKUCM1FQ8U2p1QsEvlkBSDC8OWfP1REToHWVMTzVlw/dCOHd47whttGdwVlcmwCorjp
	mWoK3VZY2fkvH1YXQ==
X-Received: by 2002:a05:600c:5686:b0:493:a623:d090 with SMTP id 5b1f17b1804b1-4994e7c60c2mr274924215e9.10.1786199681239;
        Sat, 08 Aug 2026 07:34:41 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a306:3637:68aa:bc01])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a244sm234498505e9.10.2026.08.08.07.34.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 07:34:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mirrors: Disable YP mirrors on autobuilder
Date: Sat,  8 Aug 2026 15:34:38 +0100
Message-ID: <20260808143438.610532-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 14:34:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243049

The YP mirrors (and hance some bits of kernel.org) are initially populated by the
autobuilder, so having it reference itself creates a log of stress and delay when
things go wrong (such as a missing kernel revision).

Trying to remove those but not the others is hard to maintain, so add a
variable specifically to allow it. Use that variable from the autobuilder
configuration.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/mirrors.bbclass                    | 7 ++++++-
 meta/conf/fragments/yocto-autobuilder/autobuilder.conf | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/mirrors.bbclass b/meta/classes-global/mirrors.bbclass
index 50db29ae3a2..04b7a25106e 100644
--- a/meta/classes-global/mirrors.bbclass
+++ b/meta/classes-global/mirrors.bbclass
@@ -5,6 +5,7 @@
 #
 
 MIRRORS += "\
+${YOCTO_MIRRORS} \
 ${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian/20180310T215105Z/pool \
 ${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian/20250101T023759Z/pool \
 ${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian-archive/20120328T092752Z/debian/pool \
@@ -29,6 +30,11 @@ ${SAVANNAH_NONGNU_MIRROR} http://download-mirror.savannah.nongnu.org/releases \
 ftp://sourceware.org/pub http://mirrors.edge.kernel.org/sourceware \
 ftp://sourceware.org/pub http://gd.tuwien.ac.at/gnu/sourceware \
 ftp://sourceware.org/pub http://ftp.gwdg.de/pub/linux/sources.redhat.com/sourceware \
+${CPAN_MIRROR}  https://cpan.metacpan.org/ \
+"
+
+# Having a way to disable the Yocto Project related mirrors for YP CI purposes is valuable.
+YOCTO_MIRRORS ??= "\
 svn://.*/.*     https://downloads.yoctoproject.org/mirror/sources/ \
 git://.*/.*     https://downloads.yoctoproject.org/mirror/sources/ \
 gitsm://.*/.*   https://downloads.yoctoproject.org/mirror/sources/ \
@@ -36,7 +42,6 @@ hg://.*/.*      https://downloads.yoctoproject.org/mirror/sources/ \
 https?://.*/.*  https://downloads.yoctoproject.org/mirror/sources/ \
 ftp://.*/.*     https://downloads.yoctoproject.org/mirror/sources/ \
 npm://.*/?.*    https://downloads.yoctoproject.org/mirror/sources/ \
-${CPAN_MIRROR}  https://cpan.metacpan.org/ \
 https?://downloads.yoctoproject.org/releases/uninative/ https://mirrors.edge.kernel.org/yocto/uninative/ \
 https?://downloads.yoctoproject.org/mirror/sources/ https://mirrors.edge.kernel.org/yocto-sources/ \
 "
diff --git a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
index 4f1b1ca777f..81adebe5ae3 100644
--- a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
+++ b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
@@ -11,4 +11,5 @@ SDK_INCLUDE_TOOLCHAIN = '1'
 ESDK_LOCALCONF_REMOVE:append = 'BB_HASHSERVE'
 SDK_FEATURES += 'go rust'
 PTEST_EXPECT_FAILURE = '1'
+YOCTO_MIRRORS = ""
 

