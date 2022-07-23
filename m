Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B14DCCA48A
	for <webhook@archiver.kernel.org>; Sat, 23 Jul 2022 14:54:24 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web08.6869.1658588060538139793
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 07:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TOEniayz;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id f11so6825354plr.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 07:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UjOy1OcsM45OrA/UPPsRylmsnYwLBnSHrahDcEBCncw=;
        b=TOEniayzleYB9swSRH47dENCeXtk/17aNdPsKTQibk7sANcB8VcruV12/bxwNEGBX/
         /Lr6PjTCmvfrRf1XebD0pUDNu3s/gXGNrHENwCl2IFmxoWEZ8CQwugzvyMVMM+BI/v3a
         /187iu6uilQuJySJFXPYSwnu6o1SPS0lEK1XCBFEchBZNi7LkH+aV9mHwXl1wiPyWqy1
         PfFTnaq091ssfaqYMz1j+GEUiwiIzVpWa9v8BRIyfP+iVGj9P2Z8GZMcKcVS9liGjO95
         KF+JqWeqnK1l6QQFQhrww2ghKRysWMqY56KHdxka/o0tWJkx2jigq/l2akIlUhNM2dWc
         X0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UjOy1OcsM45OrA/UPPsRylmsnYwLBnSHrahDcEBCncw=;
        b=jU/KtTkhdWLGPnL59akcoq9rvxdnzt3S+ajfa+LjsFCtqvFZXarko/r70fPM918+cZ
         2HKxc/1Xb7a6dXo8q4jr78EAw2m0dQ60wbf8T1UpvRkwUB7ek21FCG0LEyo+Ud6wZNcO
         F0DOUdtkf6JoO/HwaVh12+wqi88CKq4cHJMfDWz/f17wpdT2DONqUadTENhOFhjjC/p8
         aVP2HibvcmfiItayTZAXF6NzqrB/GzvzuW0LJoY5URmpVWAPB+uZ5Ep9AOlXkJ/rosdn
         Wro5QxfHN6OfMvn10R4iauEt+Cxo7ZdsT8vCWhu46ANdSctx8LKoNFt1+TiAyq3sZxZm
         XlrQ==
X-Gm-Message-State: AJIora+tS4SDCtLsctm8MSqZIHuJKTyFujlPZ8LqNvg7y4/wUJ1Ui9gL
	oV30HH3mdlIjVh9IiHNl99FUY3dSEcBvSg==
X-Google-Smtp-Source: 
 AGRyM1uPyrEU+CI8r12hIxXGtADz1N6ROpf6ydSe2AKLAFl3MA4e7p9znsTSVYV6ZPEVLbg+OXqoMQ==
X-Received: by 2002:a17:902:8504:b0:16d:105c:43de with SMTP id
 bj4-20020a170902850400b0016d105c43demr4946103plb.10.1658588059466;
        Sat, 23 Jul 2022 07:54:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a78c])
        by smtp.gmail.com with ESMTPSA id
 b2-20020a1709027e0200b0016191b843e2sm5771533plm.235.2022.07.23.07.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 07:54:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] libgcc: Fix standalone target builds with usrmerge distro
 feature
Date: Sat, 23 Jul 2022 07:54:14 -0700
Message-Id: <20220723145416.1374755-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Jul 2022 14:54:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168440

Ignore the rmdir cmd if using usrmerge distro feature since the
intention is to delete /lib or /lib64 but not libdir under /usr and
base_libdir = libdir when usrmerge is enabled in distro

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/libgcc-common.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index 148c9f85a7c..9d4fd41f975 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -44,10 +44,14 @@ do_install () {
 }
 
 do_install:append:libc-baremetal () {
-	rmdir ${D}${base_libdir}
+	if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','false','true',d)}; then
+		rmdir ${D}${base_libdir}
+	fi
 }
 do_install:append:libc-newlib () {
-	rmdir ${D}${base_libdir}
+	if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','false','true',d)}; then
+		rmdir ${D}${base_libdir}
+	fi
 }
 
 # No rpm package is actually created but -dev depends on it, avoid dnf error
-- 
2.37.1


