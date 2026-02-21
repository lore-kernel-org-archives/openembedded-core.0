Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A3BBC61DDE
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 08:42:45 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16677.1771663355028066312
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Feb 2026 00:42:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OknxfCjW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-483abed83b6so972245e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 00:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771663353; x=1772268153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vqEYIJDKU960W7pCqVGayLYFDpc256y9q9KhUxyg9HI=;
        b=OknxfCjW17xPjR8sSsf98zxWPktoYetm8NrjDqd4XPeOI+uQAOaRYKYYbs5DmqL5QY
         OG7QALXi20qn43msAx3c23Y9sEMrNc56/gB35mi5cZPVp2UrH0xk8/DvChYc1TvJLMnP
         QRvyl4bDbsXjMU5uuoJyCeWc49IzkEACRdk5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771663353; x=1772268153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vqEYIJDKU960W7pCqVGayLYFDpc256y9q9KhUxyg9HI=;
        b=MsLVYc2Ap+MYW4zRYts5I+nJvyVSsi+Rjl2DoWg3Ym29czRJEo/lyCEF1HGq/4m7lw
         Bu4DoMCZHDTAMedMKbMMerfSaIBkUQFIFScZv6uW/JvNLG/+dca609fdRXZbnXHh8Zhb
         rHXL+9otugrTHSsNGZpda0vKQuWEsJlLuoIKzkvTdYPXc5jLRm7A3sRrhj1zuTjsdlBn
         b/O5SCNJgO3mBAp8+lOXhKp5smLzPoe4kosFhlSccw0LO/yhRv9sxjud945rX9T+7eyq
         J4rHGyzBwln6XNovWmYm4Aq1MgVHUz4ynPJxPBOM6GeS/OeCiG7zBS9w8jThUnXYXC1W
         ku2w==
X-Gm-Message-State: AOJu0YwgnA05hcNDzIq7z88bf0sJq21nVGWj3pQWT6mSZHoPpQiyEdI2
	9v6vQ6tMFClFJPrMSVB7Fc/LVXUYCvC32wFFGhyXpyyGvq4zSC4aYMAm+g4r0glyp4y/N0fGvXW
	kOEuax00=
X-Gm-Gg: AZuq6aKAqkJMZ/qfEm62wHzAiadfPy+s3/dqlIAGMSrJBjm6ABXeqrq70u69REpL4Xx
	BA/kS9G0hO0Xs4um0b0S6plHLKudfu7J5g1Y9Uh8CiouPpOdJ/ex3pJq889oGHJ5izeLP9XfHM7
	mMvi7QHKVcEovD2pI7UqWWrrPWhI/i6OM8OHzy2Yfou0jZE2/0Gw/00eoCQGrTU4LDlz2DbvW2L
	eE3wWrQaU2w/HzifZROdv7yCNu05rVAXWmRXIQEXvQvYAk5/9ZYJ0H8qAcfktHgTo+J4oKmbqYD
	EPGWsCQNmMubIUUHVfhJcfCVsAGIQsX/w5zEYPAeb9o81WPtgVEmo8FvbxY0QbSfO4EO0aJeRvH
	JwimQr67RQVDaPyCT/BlECMQQXMUe3+5/bea8HgIDbQuc4U3TuiBQk7A4fsgSmS9Wlf5hqyRskp
	FLiGNQgRLj7l2m+wL4ZANVxTdN+ck1P+/9eB6W97Adw46KHyA3I7e9iBBz7nQfMg==
X-Received: by 2002:a05:600c:3f14:b0:483:703e:4ad5 with SMTP id 5b1f17b1804b1-483a95e2563mr31783835e9.22.1771663352887;
        Sat, 21 Feb 2026 00:42:32 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b64:9a04:85e4:d902])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3e0dsm205898295e9.1.2026.02.21.00.42.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 00:42:32 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] bitbake.conf: Enable opengl ptest multiarch wayland vulkan in DISTRO_FEATURES by default
Date: Sat, 21 Feb 2026 08:42:26 +0000
Message-ID: <20260221084230.3219379-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260221084230.3219379-1-richard.purdie@linuxfoundation.org>
References: <20260221084230.3219379-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 08:42:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231609

This change enables the modern graphics stack defaults of opengl, wayland and
vulkan, it enables mutliarch which allows gcc, binutils and gdb to target
multiple file formats and it also enables ptests by default

This means that:

* nodistro builds will match the Yocto Project sstate CDN objects
* we have modern graphics defaults
* users will see ptest issues more clearly and be more likely to test
  before sending patches

These DISTRO_FEATURES have been tested and used as defaults in poky for a
long time, this brings them into sync.

Backfill is used so those with their own distro can set the
DISTRO_FEATURES_BACKFILL_CONSIDERED variable to stop the backfill happening
for speccific values.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index aa6b5bbf9a0..d247eb3adfc 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -920,7 +920,7 @@ DISTRO_FEATURES_NATIVESDK:mingw32 = "x11 ipv6"
 DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opencl opengl wayland"
 DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opencl opengl wayland"
 
-DISTRO_FEATURES_BACKFILL = "pulseaudio gobject-introspection-data ldconfig"
+DISTRO_FEATURES_BACKFILL = "pulseaudio gobject-introspection-data ldconfig opengl ptest multiarch wayland vulkan"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
 
 COMBINED_FEATURES = "${@oe.utils.set_intersect('DISTRO_FEATURES', 'MACHINE_FEATURES', d)}"

