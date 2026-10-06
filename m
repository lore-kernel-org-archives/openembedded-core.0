Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A874DCA6007
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 20:44:39 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5181.1791319473164983637
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 13:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ADlZDfhl;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b042c0759so952451f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 13:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791319471; x=1791924271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZkvSeW7r3vQUy/tRk7r3SiMExvlrkoHKkSP0pNz3JAQ=;
        b=ADlZDfhlF4zuFnph/kgYRIxeetIjfUsnJA6ZH5QKebPS+ybg1amrlB5Iy/Sza1MZ7i
         Bea00fKi/UxWEadl5vU+vQF+tjI+pZ0uUrx8KtypRULQAaPP5xUZvuQDttjn2zEDMlX5
         F4QjOlj4bAo8sARYv6L9toA6aBIwY76/fDlEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791319471; x=1791924271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZkvSeW7r3vQUy/tRk7r3SiMExvlrkoHKkSP0pNz3JAQ=;
        b=lODFmqPZLpkvZFXUke8r5RF/sbpI2eLJtoOimupx6RjRfRahWdRzjnNIXr8GMutGGO
         qFndWr5TJSlCnFKrYk2XWyrGCsbGLDjpLQwRttTi/XuuRiQHIYpUIaECOAv0nFYhfNg5
         TgVlkNUM6Kyuv/at8giZvcBKAGjHEPIUTjWOe98ON87RpaHeb49cJrVwICfxV8O3s4Gp
         GQbJKDlBuAg2T4V5ir3muisCphHDBkWG7YmoPyAQsp+gzp1eymUhlxnDV2v9AlVdqXOC
         3KXDf6+fjCEhqytgjjtP/NwlcyaOoP15IVQ96WvsN0NMxtU7H9DEWbYZMoFCkV0bQwGi
         Py6w==
X-Gm-Message-State: AFq9FYJbOJXuuhy2emufgJNklk/YBpUabQj+P+NNCrs513N4XMuBI8JD
	6GC/TCW/sbt7+JoDt5CSZx6l/ZKaVXGnNwohzlAy1ZOyTMg7l4Z15wrUjou9oIBkUIHYl//jpZo
	IztX0ECk=
X-Gm-Gg: AYBFou2SJAsGEnkRKwHCq0OQzLi2YaqDla1VVa0uqbiTS939WNSdPxs7vP5c1nNETuV
	JMVDI6mB2v9tSyGsGMtdbSoL/pkuGHIKHVBWU0wLRm6R1KL1IZ84kQNYg1e14zVeHgoHrrpGj1G
	Etru0OTVZKR3dvJnDAKeFTw9IQzh+7nE47xiQezclxgJdVPc6W1WNe4ASYy53Y4V+TJnhh4vHpI
	gqHRLanTOtpD/2wHxh1FTZlj3iCoX4fdEyoOGcJFgr2WU600DSVtoZXvOWfz4LPaTgfwChzvzHD
	mWIVz4MCH2p/GAsW28v4Sy5+WYRAAZhhHNwqZBbOf25CWEQQi2qhw1PIcCkdcKwxv474SKzw0sb
	3YJEEjOckPdl3CZXO6fccttrzbsidhGBXg9UhMyBdWjVIpQQaWvhw8udw6wELTC65297V+reBqM
	zEhyOrDLqCt0S7CzWxBe70EkSWujkhqP9GyeCWH1fFZYrHuYipWzMVep3r/4glJ+ZFM4J6bb7uq
	VjMT6dTOwueeNLVwpHd+esLQ85NbLAE+Abs8o9KAf46OLW0EWFNEVWPP4vGn/PU29E=
X-Received: by 2002:a05:6000:454f:b0:48c:69bd:e971 with SMTP id ffacd0b85a97d-48c7275aed1mr470923f8f.16.1791319471325;
        Tue, 06 Oct 2026 13:44:31 -0700 (PDT)
Received: from FRSMI25-LASER (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7273b5e0sm997338f8f.14.2026.10.06.13.44.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:44:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail v2 13/18] perlcross: drop redundant LDFLAGS-when-linking-libperl patch
Date: Tue,  6 Oct 2026 22:43:48 +0200
Message-ID: <ec33a635b21ad94a6f2d3af0acf0d0db596b4690.1791318909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791318909.git.yoann.congal@smile.fr>
References: <cover.1791318909.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 20:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247350

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

