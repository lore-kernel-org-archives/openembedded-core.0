Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D59C41513
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 13:33:46 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.60336.1716212024455894047
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 06:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wkuVglF5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1ed96772f92so72915525ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 06:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716212024; x=1716816824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=plIC2qOJM3H4zmjxkSh5EDXNQlH3d2RnMv4rByGmPyc=;
        b=wkuVglF5DHKNM6WMC9Z2z0wYjUweSrbNOLfQQ3kTUtQCQgPLS2iokAACsVGys274kT
         WiPcFhXSXNTvlTG5fg/WtTl8U8uXixRdTARrWJwHVognll4mxFZIZzhXD3htma2x1fWg
         wkf1pGwh1/Or/2MPX3oUTyDyCRdOi2UoI1RMT1p1U1U7pHpyxPEGFUjLlNu6B3oEezRB
         uQjQHZa5d9UQvCM+I7ULrhUgP+xGMZJhFcuzOMxV0qydx3bj63+MUtcXYqOcuyHTa6NO
         58JVhAKo8295BigaGBL7ZOddY/l6yVaw5Aqtvy0iZLamOAkRwAH86gUshKIC41jUDOfQ
         KVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716212024; x=1716816824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plIC2qOJM3H4zmjxkSh5EDXNQlH3d2RnMv4rByGmPyc=;
        b=qrM5bBDJE+F32OAjDsgLfbRbYPOMtGK4dWvS5Z1s5NbK9xJZ59REXcrpKx/rjo5370
         8F8f0sfTloDESMRORBjoeErs8blB6hFwksZ2ymeLPP/FJOSYKn5SHn1+xINuePmBuD2U
         z6SnQRazO+uyE9cM/EyFKMI23OBgYu2V+DohyU/Pfl8idVZIqd/G72lBDf0Z/22dDpYz
         TUyCuwLvIMrl06Ss0jFGGRF4ePNCATwXAh/472gBg434YRL22BayXSDLiquk7QoOAP7e
         psBAqMElT4fFcwxTR1u9oH4O8Ht87RFSWyFemfqe5uWNaDiGO57MDwRKiHmwwpdpeXx4
         LNcw==
X-Gm-Message-State: AOJu0YwJqrRrSDQaioPzan0+ByXLXWhtqdNbg7bz+mIIxDoqMTo95Yi0
	moOuqU61eHHuIC2H9ICgFkr3KBYf1Y3grJ21SQv//e4gca+hG6tUvaivtSlWlrI98sARyBZIEry
	U
X-Google-Smtp-Source: AGHT+IHyxdd39DOqPWwnfxhdsuoXEMevBoUApLKxwIDxk/gMUCC5gTJqPLbNEllCL6DPNAh8AHmjOQ==
X-Received: by 2002:a05:6a21:6d9e:b0:1af:952f:f6fb with SMTP id adf61e73a8af0-1afde0a8e00mr31226280637.3.1716212023662;
        Mon, 20 May 2024 06:33:43 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66621sm19671465b3a.13.2024.05.20.06.33.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 06:33:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/21] glib-2.0: Upgrade 2.78.5 -> 2.78.6
Date: Mon, 20 May 2024 06:33:15 -0700
Message-Id: <51da20dc574a7f2a9759a4368d7668e3421e379f.1716211838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716211838.git.steve@sakoman.com>
References: <cover.1716211838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 13:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199575

From: Peter Marko <peter.marko@siemens.com>

Handle regression of CVE-2024-34397 fix.

News (https://gitlab.gnome.org/GNOME/glib/-/commit/d40f72e98e4734ba826ba9a278814530720ba760):

Overview of changes in GLib 2.78.6, 2024-05-08
==============================================
* Fix a regression with IBus caused by the fix for CVE-2024-34397 (#3353,
  work by Simon McVittie)
* Bugs fixed:
  - #3353 Fixing CVE-2024-34397 caused regressions for ibus (Simon McVittie)
  - !4056 Backport !4053 “gdbusconnection: Allow name owners to have the syntax
    of a well-known name” to glib-2-78

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glib-2.0/{glib-2.0_2.78.5.bb => glib-2.0_2.78.6.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.78.5.bb => glib-2.0_2.78.6.bb} (96%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.5.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
similarity index 96%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.78.5.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index d0aac737f7..1a4278b1bc 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.5.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -22,7 +22,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "39b26044bd44dc30f427202add4997f554723c30017e92ff36da4197a2c916aa"
+SRC_URI[sha256sum] = "244854654dd82c7ebcb2f8e246156d2a05eb9cd1ad07ed7a779659b4602c9fae"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.34.1


