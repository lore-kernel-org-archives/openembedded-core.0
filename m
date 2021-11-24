Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31767C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 21:14:32 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.3992.1637788471642981887
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wvt/kq8f;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id t6so5078013qkg.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5tfgslNhFAFObuFTQBVzUvWWWSLroURSP+sdRNuEqUY=;
        b=Wvt/kq8fD07mSY6mhxrBe1a/+jUWRLuRJS4jGERSWPDQT3N+VwVwATNIuZNTkeS183
         IIAz41GxUFx2iNduS+1umtjs6H+xTsLqVVhs5HFRgejmUJUPKsRrQFrc7od0Vb4PTZiD
         xidk4RzIks2DLWGPMxw3VHz4briWS8qfpdWEJMddmsWdBUbqzwD0bZXENz2KdPhh55/i
         vOMN49NeySw1g/Yt8Spsnn5JW1IK+e6B1jVJFrQ5xJ3d1YxPTwZ3rYj99KF0BCSMs4ix
         n1NDXs+wu5CcVbczkOLiCRRRgO2SFxmDqjMHP1aSrK2GQqTnO8LKPFvOUgWpwcG9FfaY
         uZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5tfgslNhFAFObuFTQBVzUvWWWSLroURSP+sdRNuEqUY=;
        b=XRhP5yM5llwvC8zlC3gjyMsa9O2060J9Rvy7H7t+h1kEYhZdHhI6iML/yAlcuES4wz
         +TZPK34b9qwsoUlil4woxHBfiUKCRr5vi0LlT/eguxER5bACbRNYuikFo1QlF5m25ifo
         9xPSrw128ryB8MLvX6Q2+uK31wgJuDIGPA6osMairlphyeK1Az9Nuz0hPUk4k4cy1fUR
         qGPpLh2Drn85xp4KM+/qhsT5f9TzQEQycDOhv5percaX4dXPGD+u+XzIAm4G5EYADMIj
         iQZhEYbk7BRL7lN2p6H91LoJbIlIrzDfTY9FLpg+Yp9u/KYkv+npHdSGV1SIE6es1t17
         nnkQ==
X-Gm-Message-State: AOAM5326Ho/ahoYb9GDQ0yLS4C/GwFpYhBDJIXjzf0DnPBI1dtEyYZT5
	mq8A2u+IlyT7DTxCO6McHM8=
X-Google-Smtp-Source: 
 ABdhPJwHMqLb27lJ2VjfbTjvhIMLv72ShJ+Lk22NveFHt3LvNH/KroeDz01ZJxwvMqIkC6UHyHYSXA==
X-Received: by 2002:a05:620a:22f5:: with SMTP id
 p21mr9834827qki.498.1637788470784;
        Wed, 24 Nov 2021 13:14:30 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id u9sm495095qta.17.2021.11.24.13.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:14:30 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 02/20] kernel: export native PKGCONFIG variables
Date: Wed, 24 Nov 2021 16:14:08 -0500
Message-Id: 
 <21c084db7340d627741dba92fdefe3d27f99eef0.1637788184.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637788184.git.bruce.ashfield@gmail.com>
References: <cover.1637788184.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 21:14:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158748

From: Bruce Ashfield <bruce.ashfield@gmail.com>

In a similar manner to cml1.bbclass, we export the pkg-config
variables to allow a direct call to pkg-config access to the
native sysroot versus the target sysroot.

The kernel doesn't use pkg-config for target configuration,
and has many explicit calls to pkg-config, without the
possibility of easy override to pkg-config-native.

The calls to pkg-config could be made cross friendly via
replacement with make variables, but until that effort is
undertaken upstream, we need a bridge approach.

In particular, this is required for dtschema validation,
which is a requirement in kernel 5.16+

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index e0b752de19..2d219cb5e5 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -326,6 +326,13 @@ KERNEL_DEBUG_TIMESTAMPS ??= "0"
 
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
+
+	# setup native pkg-config variables (kconfig scripts call pkg-config directly, cannot generically be overriden to pkg-config-native)
+	export PKG_CONFIG_DIR="${STAGING_DIR_NATIVE}${libdir_native}/pkgconfig"
+	export PKG_CONFIG_PATH="$PKG_CONFIG_DIR:${STAGING_DATADIR_NATIVE}/pkgconfig"
+	export PKG_CONFIG_LIBDIR="$PKG_CONFIG_DIR"
+	export PKG_CONFIG_SYSROOT_DIR=""
+
 	if [ "${KERNEL_DEBUG_TIMESTAMPS}" != "1" ]; then
 		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
 		# be set....
-- 
2.19.1


