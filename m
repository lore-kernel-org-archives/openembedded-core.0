Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47025C61DCB
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:24:00 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7740.1787732633884948083
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YcK7wZs8;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so4968085e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 01:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787732632; x=1788337432; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aKTYs9lyCcNRmYEsmaSqJfiCdy1eSfgmbWdv/G/vUMs=;
        b=YcK7wZs8TzxvhQ4BoxBDQdJXdXpaLdZhkg0xagbmmxPzm4ZBJQQDD8aKkOZh5buEsO
         NsgzEBmcKfkhsBPMI2JD18kcPijs3NW+jV+1DePucjMSaeyvgCC4ovmhF/884ZS7JBsS
         k7HYN8bx/RqKjXiz5y/mBohYCDJKO7sJaWmqo7dXG6AN3vf11aJDcQRK8ZuuWd9ukZcz
         uDEOaJU9R6Sd8N5Iz3jtwQ23lWC0oqqWyu5HTrkbnPPchXBhig2wHw4BPWAuieg/JgiB
         S4P54oGsCfn56GxUjfZrtxVhdCGkewmK6ZsbPOK0zPh8f5q0UHQrhnwkvRItW3Y3xLrd
         6VeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787732632; x=1788337432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aKTYs9lyCcNRmYEsmaSqJfiCdy1eSfgmbWdv/G/vUMs=;
        b=bM36eJWgxq/Jd6R1ytudSifil1WS1Bpwo/jAlpTciMD1rLOwMJHVgMKsv172Az/z+6
         0KD/eFlYjDr7WUKoIC4frFnwy9yNf7dXv5L7GE3KkuWru6sQ6zfvSfgFpswQIOQqHlpa
         OXchFHjpdBkNBDYX7d69pw4zoF3ni5Ln0GbV9y/OcX/1ObKvAZ9aXnGqvJhGvfLzD6n2
         lyo4ofwoogwfcx3/gLMZIGteWE8FX9M4LTcNCmgto8yJ2865Av+nFfk8WQBxwQc0FXEX
         BOnuczZA6I26GsPajXNyrSdqmpnLV4iprb5U4E0iiitYHB9bQhKp5ycivkAqhQUgGfmj
         Z5pw==
X-Gm-Message-State: AFuF++lTRWoCQeQD7sVtrpeynE6V3GuPQFJV6jQG8EpEeO+pHJduS/UX
	jI9n89x5h/QycLYFEF2L10+0Kqxe4wh6fsNxxu7jUKZkObsWNHidgP08Rm5arJgGHsk=
X-Gm-Gg: AR+sD12aO0PUdomeoCswo3ODzBGXt/NdNTzrWbCQjj1VZ8mXwIv2I06O0gLqj2bwRS6
	roYywzhmx3iydL9Dh/EV4Np6lvUHiWSoYYrcHWn3aeg5GzsnFy5IqjHawhQgQ+jc862gTL+LpXb
	esBLWuWWadN+qFQZsNH79JbRfpKqrM7U/+2yfDjCF1fPL1AjBazWYEgEKC4HLpiXAaIz4V57hfm
	JRDmbUfSmWrbbjetZgiSwbk4lVHKHKIgfaVAlApy7O6dDwEEw8DEl28cvK7dJC34CYiUFbCy/fb
	81mpJSP1mxcMct4J1OmER6VXjrAjwIYvIvIMOsomNQ7E+Rid0tDxKM2TYyjKIHxOJaQ1scocPl7
	yhDy9nCKyp1sBoCnQbrWqeapRAzUxCxI4tpdghx7TaGMCFAFuT6dQxPHSI4JO4Acc6ZEoa5Qz4y
	6FDekpdd0tpxp+E1tV5ZiTFH1dFs+whllEmhgk7nsSwNVVeHsdQGZV4p5psipjLVc7tR1dOUidW
	E2SmRqCX3kg9d5X0UYq6wif6nFkf5Jcl3jzrZZodlNsp+g7bT82Wmyw6dNd9uiW69FODmN7KmjT
	4boJG0wHyr8=
X-Received: by 2002:a05:600c:4503:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-499dc6f6856mr43323525e9.4.1787732631999;
        Wed, 26 Aug 2026 01:23:51 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:f9af:e499:eded:1124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8b84esm17933655e9.1.2026.08.26.01.23.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 01:23:51 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	richard.purdie@linuxfoundation.org,
	peter.kjellerstedt@axis.com,
	antonin.godard@bootlin.com,
	Anis Bougrine <anis.bougrine10@gmail.com>
Subject: [OE-core][PATCH v6 5/5] documentation.conf: add documentation for KERNEL_MODULE_INSTALL_PREFIX variable
Date: Wed, 26 Aug 2026 10:23:21 +0200
Message-ID: <20260826082321.22104-6-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260826082321.22104-1-anis.bougrine10@gmail.com>
References: <20260826082321.22104-1-anis.bougrine10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244364

Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
---
 meta/conf/documentation.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 72513296e2..93949c7ff8 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -239,6 +239,7 @@ KERNEL_FEATURES[doc] = "Includes additional metadata from the Yocto Project kern
 KERNEL_IMAGETYPE[doc] = "The type of kernel to build for a device, usually set by the machine configuration files and defaults to 'zImage'."
 KERNEL_IMAGETYPES[doc] = "The list of types of kernel to build for a device, usually set by the machine configuration files and defaults to KERNEL_IMAGETYPE."
 KERNEL_MODULE_AUTOLOAD[doc] = "Lists kernel modules that need to be auto-loaded during boot"
+KERNEL_MODULE_INSTALL_PREFIX[doc] = "When a recipe inherits the module class, this variable specifies the directory to which kernel modules are installed on target."
 KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for which the build system expects to find module_conf_* values that specify configuration for each of the modules"
 KERNEL_PACKAGE_NAME[doc] = "Name prefix for kernel packages. Defaults to 'kernel'."
 KERNEL_PATH[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module class (module.bbclass)."
-- 
2.50.1 (Apple Git-155)


