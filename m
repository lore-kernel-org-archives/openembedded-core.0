Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDECC46467
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:16:16 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.70844.1669472151910294466
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:16:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=wf07R5o3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id b4so6464472pfb.9
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=boy1ZgaCdxAY/38Uj9UWf2dnE+3UHSybwSvP9nP0+ow=;
        b=wf07R5o3/YmPATqn8TO/I1TQ7PQLTq6aPFFdnct9UiHo54s9tjiMIjq2gJTWESDc+R
         jFBZK4oiJZ/mZaMZR9nFb11f0XvO/v+FVRypRbdno2kWjr2SVKvAruMMxQ+8SigMCzfA
         PwGy6yXdzirKNqhKOgaKpARMDpolobEIM2mglhSwy2ZHcYzDaiD8nZeGKbk1faDCvSvE
         NkwlwK9isPLlcBEJvmZOr8DwK3+MyurZSj14a8TyXgOtkhbZ53DqM3jtkTpu8O6u8Mp8
         DLNkXmfw56UK7KKQl16LA5YX59XQ0ZhyY1NCUyiVHm6Mz4dRmty/vAZt5b0x/2Eg676Q
         Roqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=boy1ZgaCdxAY/38Uj9UWf2dnE+3UHSybwSvP9nP0+ow=;
        b=Gzi9Q3uX5ZtPDEtWrN9cOG+z2kyfMQx44NeJGGzKgw+huVSo6RvGu2qjck2g1JkRir
         kgnZzBO3rs3K3SgbUcl+27fiIuESIpB6k1OPLgeGQTLegQ/lnhBjeOyVPsnLlCc4OGQk
         RQ0fvPuh7FEkIMqsFLLLSOEzaux3bRdkiRAON2J7BH1sgJ8HzYTXNEvUNg8k0S5QWXtL
         juINnhMAwv7dHYe1781j+2PjRFqKp7EG+DqRnshlh2S129qcf7Pbr6pkMV5KPqnPauf0
         nKojI3vrfzI1YRJZ92+q9JlI6vj8KJ//fy2Iy2E9emcjbSaE2hN/xRTb/I0WtwS5DgxT
         IGZQ==
X-Gm-Message-State: ANoB5plthaQKDETog2rbFllXZtBwcLh+L/OSuyQb/wKAQBbGsGG67Ymv
	3WpI/fdMt7C4vCZHdB8YuhcUw5QDOXZ0jGORrFY=
X-Google-Smtp-Source: AA0mqf6snJwG60VdyoYW4x8juSXkhOkhqDpHvgVKx17rAtf+V7jO5J3G+ZhCSAB0WVD/Vb6VuyVwSA==
X-Received: by 2002:a62:830d:0:b0:575:6e7:68b0 with SMTP id h13-20020a62830d000000b0057506e768b0mr280584pfe.60.1669472165516;
        Sat, 26 Nov 2022 06:16:05 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.16.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:16:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 29/37] vala: install vapigen-wrapper into /usr/bin/crosscripts and stage only that
Date: Sat, 26 Nov 2022 04:14:33 -1000
Message-Id: <0de07deebc3b8d39b47e7130b8e096e74c8ef767.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:16:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173822

From: Alexander Kanavin <alex.kanavin@gmail.com>

Staging the whole /usr/bin is not correct, as it pulls in also
all the vala's cross binaries, which may be discovered by other recipes
and things will go wrong then.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 52629d9db0344146ff4734632b17bd731e247fd5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/vala/vala.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index 974baa33f5..d3daee37dc 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -42,20 +42,20 @@ EXTRA_OECONF += " --disable-valadoc"
 # Vapigen wrapper needs to be available system-wide, because it will be used
 # to build vapi files from all other packages with vala support
 do_install:append:class-target() {
-        install -d ${D}${bindir}/
-        install ${B}/vapigen-wrapper ${D}${bindir}/
+        install -d ${D}${bindir_crossscripts}/
+        install ${B}/vapigen-wrapper ${D}${bindir_crossscripts}/
 }
 
 # Put vapigen wrapper into target sysroot so that it can be used when building
 # vapi files.
-SYSROOT_DIRS:append:class-target = " ${bindir}"
+SYSROOT_DIRS += "${bindir_crossscripts}"
 
 SYSROOT_PREPROCESS_FUNCS:append:class-target = " vapigen_sysroot_preprocess"
 vapigen_sysroot_preprocess() {
         # Tweak the vapigen name in the vapigen pkgconfig file, so that it picks
         # up our wrapper.
         sed -i \
-           -e "s|vapigen=.*|vapigen=${bindir}/vapigen-wrapper|" \
+           -e "s|vapigen=.*|vapigen=${bindir_crossscripts}/vapigen-wrapper|" \
            ${SYSROOT_DESTDIR}${libdir}/pkgconfig/vapigen-${SHRT_VER}.pc
 }
 
@@ -64,5 +64,5 @@ SSTATE_SCAN_FILES += "vapigen-wrapper"
 PACKAGE_PREPROCESS_FUNCS += "vala_package_preprocess"
 
 vala_package_preprocess () {
-	sed -i -e 's:${RECIPE_SYSROOT}::g;' ${PKGD}${bindir}/vapigen-wrapper
+	sed -i -e 's:${RECIPE_SYSROOT}::g;' ${PKGD}${bindir_crossscripts}/vapigen-wrapper
 }
-- 
2.25.1


