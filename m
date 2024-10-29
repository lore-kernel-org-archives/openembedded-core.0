Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3309BD3A690
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 19:00:34 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.1955.1730228430996604366
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 12:00:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RDXCko5z;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71e52582cf8so4336575b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 12:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730228430; x=1730833230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TACd1+35dp7Jh5cx3IukJoNIMvR/iGJ5NbkhVKR0EiE=;
        b=RDXCko5znw9nfvSnh1sKtmRDUwReOLZY8AzbEPNHsPWJQZqw48YS4iMEyMJlMr4Lyf
         n4BAiIz1J4XTiDjqNOPpqPbEmSg5xVJfkSIAm4/4uBaeFdC2m+RoJ9cTIb/gikAa+3CF
         9tcguFSjB1HmIV7OvGE9hnYvQR9O//uLSMt65QRDMXEyoPu2OJcSwe59CNKd7NeLuR7+
         0FXuHbseL+/hA0x3mWNRTcrRGiCgT9RO7R7oNLWe7E2mTv6O4g2vCwHaomhXqVspVoFL
         nOcHdYMmVOMO1493M3jzUnNLDlaZ8JEaD0YinaLt0HKHG/zmvDNrc27UKpg1cJHDDuy0
         uTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730228430; x=1730833230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TACd1+35dp7Jh5cx3IukJoNIMvR/iGJ5NbkhVKR0EiE=;
        b=jTTL0wNove6l2k4S+Zp6Hjk76SxrKdz7A0X/DoxtmIso/cF0CwEWveYYvGGCHeRQs5
         wu4uxmeHP4db1/sosZx+BSbGLFiV6RVjK0sQFFVqhD8h3njCaHI3FFwmXneB7T0tjfru
         GiXfkf89ajv3x1fs1EsBlPRqSpHBKGBNbsobi3f32mpZxPhmwzCT3yen6hwZfyVHx+zI
         CqlXIfXFytq49Gmj0JV7QJ9LBZaQttz03I2rGosQcNXFralofOZnXHh+cbo2H36voA9K
         vUqTi2e30AOE7+P2p+E6240ay6nT71n6YARC+guZXy+W7P4F6cLRCczGMwMJ+cOHwIVG
         nG4Q==
X-Gm-Message-State: AOJu0YwSjL5pHo/7jiPVr8H743/D5iyB9SHVmS5OWSAhDq6gbdyf0Rx6
	jjaTj0u1l/gKa0nCqQwN5mrfn5mHbDv3K57UUSJsP7mtuzy3tSRfA+VbsgZjQEExSh0ayPK6g1Z
	C
X-Google-Smtp-Source: AGHT+IH6ind4lzkcFiK/Exw4flYUS5HsR8pHaKLzzVdZSllp/cD1Z7PBvgn4OtSGktd7HusQ2NMx8w==
X-Received: by 2002:a05:6a00:3929:b0:71d:ee1b:c854 with SMTP id d2e1a72fcca58-72062f83c34mr18857340b3a.9.1730228429906;
        Tue, 29 Oct 2024 12:00:29 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205793273csm7835439b3a.74.2024.10.29.12.00.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:00:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/19] vala: add -Wno-error=incompatible-pointer-types work around
Date: Tue, 29 Oct 2024 11:59:48 -0700
Message-Id: <0f850f213071d4bc3a7065334debabd32c7bd9a1.1730228268.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730228268.git.steve@sakoman.com>
References: <cover.1730228268.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 19:00:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206525

From: Martin Jansa <martin.jansa@gmail.com>

* to allow building vala-native on hosts with gcc-14
* we could backport:
  https://gitlab.gnome.org/GNOME/vala/-/commit/23ec71b1a5c4cead3d1bdac82e184d0a63fa7b79
  which is already included in scarthgap, but that's big patch doing almost the same

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/vala/vala.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index 162e99bb03..87d8fedc3f 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -39,6 +39,10 @@ EOF
 
 EXTRA_OECONF += " --disable-valadoc"
 
+# work around for vala-native build with gcc-14 instead of backporting
+# https://gitlab.gnome.org/GNOME/vala/-/commit/23ec71b1a5c4cead3d1bdac82e184d0a63fa7b79
+BUILD_CFLAGS += "-Wno-error=incompatible-pointer-types"
+
 # Vapigen wrapper needs to be available system-wide, because it will be used
 # to build vapi files from all other packages with vala support
 do_install:append:class-target() {
-- 
2.34.1


