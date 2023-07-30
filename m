Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED414C04E69
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:41 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.78401.1690740095376138864
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ibwsxPgF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-686ba97e4feso3828331b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740094; x=1691344894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VeiXgg/gE4N6R1pUhPX4izycwlnUELCSfcZUs6lDxts=;
        b=ibwsxPgFbl4Fk0txt5KzCbiWOtY4DT7gTmCm0HjtYly3g3x4Hl0hJCLZKE17Rfu/+Z
         lcgEoOsfuB1wZG6UX164SSqY1OYya2bMowKVPOiJuNLKBGeZVxeKR2H4dWN3nwcwFh9U
         AmZVFrGqdJd9LP4y9b1uKQJCCpr2wG80lkcNY82HDq3gUPMyqcyySxjxadwqs+GEgzzv
         nZVmQZIKFG+SGXWggD63tApQTj6LtZ1ePMGUJODj8i+5+j0dcyvdGtzc5EXswypZdAOj
         LQTnVLsEVy/qWjWrTdRrlRoLtb4bZlQ0YLn65KdZeradgqdSKra6+JXizVNHkX1RUFdJ
         l+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740094; x=1691344894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VeiXgg/gE4N6R1pUhPX4izycwlnUELCSfcZUs6lDxts=;
        b=Q1BaLs4Nxb3vYL4cnw6tPqa3f1pwBjoIatTMIZXVF3l9OeGE8wmfsPDY3sz6ekL8FO
         PBT6bAQcJUCLyy+fFrWF9wJaMwYpgL7jZtSzGjiCe6uDF+fK94iIATmbLuVomIKljGpt
         CfwCQtt5GVUwLCU/YafaxUI2rJVs/MRTTsNyuVHW303Lg1SDWZsDilrtyCRH7yPN+vR7
         Uazn7MouIH/Pf2crCaVp+4o1aet1Kgi6RLSLgFhGTF7EehmWbfvr3UsQXYcVZrw/X8o8
         6wjj2z2ZBc4xfQ16jXwKrp/TOUrG6xnF2F4nW3/jQBhcAwGc3nwY+FIwIS4b/IffCPTE
         5wgQ==
X-Gm-Message-State: ABy/qLYI7/ydUo23jQoeBmkl29eCCyQR4CYZz86k3jxRLLpk/bxZfPKv
	6IQmkJ21I1qFmFyip4ijX2q42SbpEwcXur5jtW1RfQ==
X-Google-Smtp-Source: APBJJlEVgIrL99T0VIXcjCSIoXVOgzH1NZHvR/yHMfiJWS1XZmb/z732v2Fy9M9PGL94ML/4WmbMDw==
X-Received: by 2002:a05:6a00:14ca:b0:687:22ce:365f with SMTP id w10-20020a056a0014ca00b0068722ce365fmr5151402pfu.29.1690740094492;
        Sun, 30 Jul 2023 11:01:34 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/30] uboot-extlinux-config.bbclass: fix old override syntax in comment
Date: Sun, 30 Jul 2023 08:00:42 -1000
Message-Id: <23ddb165478cb20dc41b99a1c261e70ab1edacf2.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185097

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

The comment specifies how to use the variables but uses the older and
now unsupported override syntax. Let's update to match the newer syntax.

Cc: Quentin Schulz <foss+yocto@0leil.net>
(From OE-Core rev: 0a381eea4d50ff1c6e7c7d0d4df62eb581454b48)

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bb64f3fed29b9532e6ddc9a2ba0283d373622d87)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/uboot-extlinux-config.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/uboot-extlinux-config.bbclass b/meta/classes/uboot-extlinux-config.bbclass
index dcebe7ff31..5495ba0256 100644
--- a/meta/classes/uboot-extlinux-config.bbclass
+++ b/meta/classes/uboot-extlinux-config.bbclass
@@ -33,11 +33,11 @@
 # UBOOT_EXTLINUX_DEFAULT_LABEL ??= "Linux Default"
 # UBOOT_EXTLINUX_TIMEOUT ??= "30"
 #
-# UBOOT_EXTLINUX_KERNEL_IMAGE_default ??= "../zImage"
-# UBOOT_EXTLINUX_MENU_DESCRIPTION_default ??= "Linux Default"
+# UBOOT_EXTLINUX_KERNEL_IMAGE:default ??= "../zImage"
+# UBOOT_EXTLINUX_MENU_DESCRIPTION:default ??= "Linux Default"
 #
-# UBOOT_EXTLINUX_KERNEL_IMAGE_fallback ??= "../zImage-fallback"
-# UBOOT_EXTLINUX_MENU_DESCRIPTION_fallback ??= "Linux Fallback"
+# UBOOT_EXTLINUX_KERNEL_IMAGE:fallback ??= "../zImage-fallback"
+# UBOOT_EXTLINUX_MENU_DESCRIPTION:fallback ??= "Linux Fallback"
 #
 # Results:
 #
-- 
2.34.1


