Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69063CA5FED
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 15:46:39 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48868.1791301597557718573
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 08:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AyxSsb6T;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c14a06c95so732031f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 08:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791301596; x=1791906396; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZkvSeW7r3vQUy/tRk7r3SiMExvlrkoHKkSP0pNz3JAQ=;
        b=AyxSsb6TCOPIeufhLcLY8BwScVKB09zzXXuE/LKVwDUS4MlS6/dCAg0RxoaNcJowZa
         y2C1ZXfN2bPZZ0mhIoQ23rlU5n0RuLCy7yHzWrNi4T12mXnv4KcbISj5WfMxxhl6Y+TZ
         9fxKqfWoACIAK5Isvo9Pf5oqoOTPId8aeh1YA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301596; x=1791906396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZkvSeW7r3vQUy/tRk7r3SiMExvlrkoHKkSP0pNz3JAQ=;
        b=gr6j2MfqkgnOuynTYMSqS/hDAI+AVLgJrVB38yfHNejgFEwJ+/cujQ61paTRih/Psz
         xKYkyOi3C13h+z3m/wlZsSMEJipjVn0dGcRXW8C/zZ7tdI0crvZvPhodf/idVeMBcMgP
         uMZNKEjx5M1VnH67Pm3s8irDvzI7KF7ZJ2Qnr5DK9wkZLQUSe6d56tRCKnlaHRdhzCk0
         tamos2w3y4Koj8F7s7js93D/lLlFlhfoGNc1/DQtLldN3Pkb/wNlhOfrsTMcFqyPBtwP
         wWxcKGurRqyOvYz+6QexdHRM4iBuioZ0rJ5PxKNcIMzHhxg3Bb2orUdTaVp5ZfWkFr/M
         7xHg==
X-Gm-Message-State: AFq9FYKZshIqqTR2fw9bZsIOv5djQnJiAfVfu75+Yb27ehsGZRELND3A
	9PFn2NGU2cF1VAw7XachUq4R/9LUASl5Zatj3Ilr6psQks7smog50PjWX8dpdHpu3jqpQeBMHf9
	j5qYvVC8=
X-Gm-Gg: AYBFou1ZYxJXCgjnmTsxH438/3WcQvHelDVstptdoPZ7wvWLNglPb3a13LV7e3JC/4g
	5kW5rSWqbsSZi+jZiP1HoYxlAapwK+tZ7Uj+eaqEUZ0i2P0UsI8z48X45PTUKoATAnLArSx7WxN
	erbrukJo8/Qj4p+0OKjJGKVcCweDTyTYbiWIzf9gNuRBgz0NutJu+cafnZIUiLNI/zodZIpM8Vi
	fxFPC4tUAwxe8+BoSLwtD1IbpuZJa/oH2FSr+SvfvZlFvWQGUPyusJE+3fmZma8/b2RVG9R4hbE
	6c1Omh3nUKZoSSqtaF0U+YnbEduZAu/kdC/+NwtOT36h1RyHQDQe1YK9KM3IoecXewwAQ1KjmML
	bdz5ibiQ0rFEttYajAa7hD7H3evuijoXRg/65BcUWzyIBEhoUOXjKaAiGNAlV3dTcownmg1rXgV
	4S7zQEGZcKfXS85BSDFhB+IhKqAPDWdsT+jLoFAruoS0BEtA7yP8CYXsVMOQTddEKBif+22w8fo
	9EHtAjKKNdcnBx8VXEiyAwNmbP9bnShhSozv7VPDXqoKYxPLoVNCSG3ya25Lj6vtZXucNiKqYaY
	M2Ij9A==
X-Received: by 2002:a05:6000:4915:b0:48b:1b6:3df8 with SMTP id ffacd0b85a97d-48c6d1d53ecmr3007907f8f.35.1791301595747;
        Tue, 06 Oct 2026 08:46:35 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3032csm257281f8f.45.2026.10.06.08.46.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:46:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 14/19] perlcross: drop redundant LDFLAGS-when-linking-libperl patch
Date: Tue,  6 Oct 2026 17:46:00 +0200
Message-ID: <867ce4fc90468bd00990688f130ff640cdada79c.1791299195.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791299195.git.yoann.congal@smile.fr>
References: <cover.1791299195.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 15:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247303

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

- Upstream PR #122 was reverted and replaced by appending ldflags to
  lddlflags at configure time.
  perl recipe already passes -Alddlflags=' ${LDFLAGS}',

- Verified LDFLAGS still reach the libperl.so link (perl do_compile log,
  qemux86-64) after removing the patch.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 65595d5ac1a005e3fa7d1167c5da8fbc39e080c0)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...oss-add-LDFLAGS-when-linking-libperl.patch | 24 -------------------
 .../perl-cross/perlcross_1.6.5.bb             |  1 -
 2 files changed, 25 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch

diff --git a/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch b/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
deleted file mode 100644
index dbddd9bc616..00000000000
--- a/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 10140792a3d9100ca38ddda5f47c0faeb26af1d4 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 27 Nov 2018 15:37:40 +0100
-Subject: [PATCH] perl-cross: add LDFLAGS when linking libperl
-
-Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/122]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 4b80079..c6d6042 100644
---- a/Makefile
-+++ b/Makefile
-@@ -191,7 +191,7 @@ endif
- 
- ifeq ($(useshrplib),true)
- $(LIBPERL):
--	$(CC) $(LDDLFLAGS) -o $@ $(filter %$o,$^) $(LIBS)
-+	$(CC) $(LDFLAGS) $(LDDLFLAGS) -o $@ $(filter %$o,$^) $(LIBS)
- else
- $(LIBPERL):
- 	$(AR) cru $@ $(filter %$o,$^)
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.5.bb b/meta/recipes-devtools/perl-cross/perlcross_1.6.5.bb
index 77ca5b0e302..64cbeb4078b 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.6.5.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.5.bb
@@ -12,7 +12,6 @@ inherit allarch github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-cross \
            file://README.md \
-           file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://determinism.patch \
            file://0001-Makefile-check-the-file-if-patched-or-not.patch \
            "

