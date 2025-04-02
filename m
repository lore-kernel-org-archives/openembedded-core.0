Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE8FC36014
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:11:17 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.2140.1743577869567367681
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hWo2yLSa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so69153105e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577867; x=1744182667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKc4ksA4/XbQFGeFKEw4mGLPvaFbQyG82KaATTQePCA=;
        b=hWo2yLSa+ZCho28N2huKZVR+gztqaGY6sENSb7fwfe8N5gnzQDB4XtEKmQOCvSytE/
         0Oe17KAX9h/+VhHXScNWiRjn+La3l36ucUcGhfxuVpHBIu3LnbBN/+wsd+bdLNIIpet/
         d8x2FWGTNqWpO6jbUJdzApa7YfwiXLxYccHhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577867; x=1744182667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKc4ksA4/XbQFGeFKEw4mGLPvaFbQyG82KaATTQePCA=;
        b=liHCpsjQOk8MNC8S5v9WQfZRSmpPHSeF4bvJd/aoQn8pfncBOoEeFQXpSjtGQCx1PR
         cipjsD11sXKToF4H6YR/JdHxHG005wfOnKWrK9r5mNOCEqwnTBkzen4K/gzfYJ3KKupQ
         +NSPUx8sgjPAgYK2Jma2sGdaYyUDg81pKP2dp4dtQXA+aWe82Bq3Ty/5PO1HBXzheO9e
         AX2AJlyAeP4S54g8xHLutNNJeWg5HixzcbTCldjmZh/8a418POZmRxpo42iC5wLoYEt3
         zuSiWqE5G9iVmriyJ+xSNE/JVjOxHqX61s5Q9bIAE78YfGYNAEZ5a6Q90g8PRV3JWSNR
         JbGg==
X-Gm-Message-State: AOJu0YzONSOkxrsN/13drRGtdeakSDeT4D3Ljv5X2IwwZKCMw4VFRJ9o
	EOyi9n6idOZTx9UL7hJSuMFTgYk/CjkZNo7bay2yoPcj0HEBt/JV9QcItEHB2MY3kE20p1QkDPh
	e
X-Gm-Gg: ASbGncutjuMdjV77odYK8CL6ITlI9zmfPMWG29nIMBncc6yDKNSn3chKuf661U32Jnx
	hGblnACViYkHcmgwb8/kdWAhRHb6FlWIGBzbDMYK+IX86VBhx05NLt93Qrh5ia4n051YMRsYN2+
	QgdmFN66zDbhSYiAWf6DgiTR+kuJUgLyAwGAnbpF+5mLmzeEje6H/msAHzNbhg1ShxL6Dts2fE6
	lvmZwjo6oWJ0PpoJmJcGsAHNTfra3L5hDFOjDLVMX0ZS239F8oOKwA8czlRFsURiyDXPbcW6x4P
	XBEW96bAMH7cyjH0mXmxI8Ji/Dc6FCr/KNjHJQrJcAuIVbLPJBt+zXG2ungeKb/GGN8ityvD7g=
	=
X-Google-Smtp-Source: AGHT+IEVfGJHrcbT3ZPI+ufN0+/qlFjUhfsgHuPFkoOW0WCCFurMj1VwSjG3SB1Zu7Iw5iB3FXPq3Q==
X-Received: by 2002:a05:600c:3ca6:b0:43d:98e7:38dc with SMTP id 5b1f17b1804b1-43db61d823emr158699765e9.5.1743577867411;
        Wed, 02 Apr 2025 00:11:07 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.11.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:11:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 19/48] libsdl2: upgrade 2.32.2 -> 2.32.4
Date: Wed,  2 Apr 2025 08:09:48 +0100
Message-ID: <20250402071017.2157620-19-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:11:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214192

Drop backported patch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...9fe9c7931738ed63d257b1d7fb8a07b66824.patch | 35 -------------------
 .../{libsdl2_2.32.2.bb => libsdl2_2.32.4.bb}  |  3 +-
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/9e079fe9c7931738ed63d257b1d7fb8a07b66824.patch
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.32.2.bb => libsdl2_2.32.4.bb} (96%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/9e079fe9c7931738ed63d257b1d7fb8a07b66824.patch b/meta/recipes-graphics/libsdl2/libsdl2/9e079fe9c7931738ed63d257b1d7fb8a07b66824.patch
deleted file mode 100644
index f8c05981308..00000000000
--- a/meta/recipes-graphics/libsdl2/libsdl2/9e079fe9c7931738ed63d257b1d7fb8a07b66824.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 9e079fe9c7931738ed63d257b1d7fb8a07b66824 Mon Sep 17 00:00:00 2001
-From: Neal Gompa <neal@gompa.dev>
-Date: Mon, 10 Feb 2025 05:00:56 -0500
-Subject: [PATCH] pipewire: Ensure that the correct struct is used for
- enumeration APIs
-
-PipeWire now requires the correct struct type is used, otherwise
-it will fail to compile.
-
-Reference: https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/188d920733f0791413d3386e5536ee7377f71b2f
-
-Fixes: https://github.com/libsdl-org/SDL/issues/12224
-(cherry picked from commit d35bef64e913dd7d5dd3153a4b61f10ef837dad6)
-(cherry picked from commit 6be87ceb33a9aad3bf5204bb13b3a5e8b498fd26)
-
-Upstream-Status: Backport [https://github.com/libsdl-org/SDL/commit/9e079fe9c7931738ed63d257b1d7fb8a07b66824]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- src/audio/pipewire/SDL_pipewire.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/audio/pipewire/SDL_pipewire.c b/src/audio/pipewire/SDL_pipewire.c
-index 889e05decb293..5d1bfc28dedb7 100644
---- a/src/audio/pipewire/SDL_pipewire.c
-+++ b/src/audio/pipewire/SDL_pipewire.c
-@@ -590,7 +590,7 @@ static void node_event_info(void *object, const struct pw_node_info *info)
- 
-         /* Need to parse the parameters to get the sample rate */
-         for (i = 0; i < info->n_params; ++i) {
--            pw_node_enum_params(node->proxy, 0, info->params[i].id, 0, 0, NULL);
-+            pw_node_enum_params((struct pw_node*)node->proxy, 0, info->params[i].id, 0, 0, NULL);
-         }
- 
-         hotplug_core_sync(node);
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.32.4.bb
similarity index 96%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.32.4.bb
index 8226774a9eb..28338b09360 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.4.bb
@@ -22,11 +22,10 @@ LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG', 'arm-neon', 'f
 PROVIDES = "virtual/libsdl2"
 
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
-SRC_URI += "file://9e079fe9c7931738ed63d257b1d7fb8a07b66824.patch"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "c5f30c427fd8107ee4a400c84d4447dd211352512eaf0b6e89cc6a50a2821922"
+SRC_URI[sha256sum] = "f15b478253e1ff6dac62257ded225ff4e7d0c5230204ac3450f1144ee806f934"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 UPSTREAM_CHECK_REGEX = "SDL2-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar"

