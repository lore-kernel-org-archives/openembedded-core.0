Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E520C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 09:20:56 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.27500.1701854455762240876
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 01:20:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MDLPVpYb;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-54cb4fa667bso4190205a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 01:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701854453; x=1702459253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jXeb77PmMiWYx3zFrlorHV30ZDE4L6Wkte+KcxUIRIw=;
        b=MDLPVpYbmgjB4iMplhtdLgga+tZOc8mEQCLKj/4o4adRjChLajzfxL+LHAhwx5A7kd
         o0pP4LWR50uKOdlvqgq7k1SBOp6toSNsAvvEe7L7Kfu0itupRXbi0ldBCeob5ntnjvxR
         Q6yvRFHfE5aKlE7DxJ33uubE0Pnr0ukIFeiNeXQlvfH67a2RuqXJt7Lag/RvZwJYDN6n
         sqlKL8XqUNwOFFKlau8oay8j19OBe2V11FUsbdcacH/JFnNgGzcp61n8E8PwVywAAARG
         D0GOUJds8hBatopkv4WM2WPCFMa5mF5Lh4Gud3gSdcyW3o8ft4VMf9uNryiLnhUU2pRn
         bE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701854453; x=1702459253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jXeb77PmMiWYx3zFrlorHV30ZDE4L6Wkte+KcxUIRIw=;
        b=YUwvddb+e3qbtbmSJF+qtV6jqknMBEMijx9P3A1jbF1jDrtEFOc9oMczcypcHpoKXf
         Lf5EEs1m/JrsGMq9WSU1d1w8BO5lHYFrclQuzGha0KJZfPWQOX7dfcEfs1dsWlXol3OQ
         Sb01e/oujdRWcp/IckXnwPDdRCIhulO5u9eMZOJO4olkONWic2NSEv6TtPnt0fT/euZx
         /A9HDEleje9bHtzybpRfQcoWvl/9x6dHYApHmT+zAPyPr3bGuIm1u1dcA9EgT9LQKT3E
         mVmfdkadAnSlKkb81eaN453m1YBBGA01w0g9D6NzDZYvi+W7U6/FELRttbgcqL5wDlcC
         aPOA==
X-Gm-Message-State: AOJu0YxPQyPjh7H7JlvNXesLV6HI8nUyF5/jmMAy12j8OcM24BD8h5Zl
	GLhpAj1AHx99z0qfZmwYEuTcC7m46u8=
X-Google-Smtp-Source: AGHT+IEdzBwNLPWU3ZPcJzXFmvG7iu61Non+XIpztkfKovzRcFCbP4ua5CYkHjp+MFDqbn5gC+VEVg==
X-Received: by 2002:a17:906:3648:b0:a18:ad93:460d with SMTP id r8-20020a170906364800b00a18ad93460dmr315910ejb.69.1701854453172;
        Wed, 06 Dec 2023 01:20:53 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906399a00b00a1d232b39b9sm1271700eje.184.2023.12.06.01.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 01:20:52 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [nanbield][PATCH] update_gtk_icon_cache: Fix for GTK4-only builds
Date: Wed,  6 Dec 2023 10:20:50 +0100
Message-ID: <20231206092050.157244-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 09:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191878

Try to execute both gtk-update-icon-cache and
gtk4-update-icon-cache after checking whether the
commands are available.

This attempts to match what gtk-icon-cache.bbclass is doing.

This fixes running update_gtk_icon_cache during do_rootfs
for an image that contains only GTK4 related packages.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 scripts/postinst-intercepts/update_gtk_icon_cache | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/postinst-intercepts/update_gtk_icon_cache b/scripts/postinst-intercepts/update_gtk_icon_cache
index 99367a2855..a92bd840c6 100644
--- a/scripts/postinst-intercepts/update_gtk_icon_cache
+++ b/scripts/postinst-intercepts/update_gtk_icon_cache
@@ -11,7 +11,11 @@ $STAGING_DIR_NATIVE/${libdir_native}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --u
 
 for icondir in $D/usr/share/icons/*/ ; do
     if [ -d $icondir ] ; then
-        gtk-update-icon-cache -fqt  $icondir
+        for gtkuic_cmd in gtk-update-icon-cache gtk4-update-icon-cache ; do
+            if [ -n "$(which $gtkuic_cmd)" ]; then
+                $gtkuic_cmd -fqt  $icondir
+            fi
+        done
     fi
 done
 
-- 
2.43.0


