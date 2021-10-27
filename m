Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77716C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:50 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.9127.1635325669610250790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jzwfTHjo;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id i9so2900649wrc.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BVhcpXH8rHrkd6L0oHEWBow6bEThNtcCZr4VEZ5NqQQ=;
        b=jzwfTHjod7Lopz3QRQtgx+IBSWslZzrp8k/C0rJPYznecY2piKj1qh730XBhTFqUA/
         d89O2w1BvhpTobXCBPicB2SfVDHlMTG0hNthSZCgE7prGhO/loLz8K6h+F9nAckOTIBq
         S2iYDE/TODqwniANPhgxtQLVVR5nWy5fKO860A8yb+OtRErG3EWPkZ3PWD/Uy6YBB9dL
         sxvzMrKKdujhyGQ14VIHShgjvSDtz5VbT7BdsPGmuZshaeQKbGx89cuZAnpSiDMvp86C
         soOV3aFK13+SH0uLiJX6IlZaA4yF8KsN32NZVQoPV2EXJhjMnwTaJHEGBVq6hs8xqYXM
         oQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BVhcpXH8rHrkd6L0oHEWBow6bEThNtcCZr4VEZ5NqQQ=;
        b=ulBw3bz6yJI7dmVcI/mXVY6ZIQWgTEk/QpG7OXTNH56mOKQwmNzkNyS3DPTd8z4lkf
         dvAXKTEtlO45jDmIpHXqSn9BDnFlkqbtgMlqWG1mGVWahD/wL/A0pYqFwWSelw42CV4d
         eoM2CpmBTGx2mZaPsKtIuPZHMdjXN5hayNpw/iSwlIarUpieMqnomd5rqeHaanuUvZAb
         TyEZzdd7s1j6O1FpRqKk/Cc8PygpSeiTwhytAAWUiDYXpAO7cu5VzunksmngV8UjIp3T
         YQcQFcXoRtj+CflBZS9SQdeiixcR9OoTU+oZr/sjQsKIh+tgmBmTzc74eJfdZgpkFaE2
         oxsw==
X-Gm-Message-State: AOAM533ppbr+Ts/h1tz47s4iD08orccb23Vk5O8/mxG+5UDu2EpSzEoY
	wFEw2ixkupVMsty6AjHL3F7PpyLphi8=
X-Google-Smtp-Source: 
 ABdhPJw+3IWzeZL2zhl6rKmpsJelQwe4Xu+G/3Eb4PUjBtr28lETxdXLcLdmjowN7S94gzXgso9JUg==
X-Received: by 2002:adf:ca09:: with SMTP id o9mr37960806wrh.303.1635325668099;
        Wed, 27 Oct 2021 02:07:48 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/30] wpebackend-fdo: upgrade 1.10.0 -> 1.12.0
Date: Wed, 27 Oct 2021 11:07:21 +0200
Message-Id: <20211027090736.2546759-15-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157491

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{wpebackend-fdo_1.10.0.bb => wpebackend-fdo_1.12.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.10.0.bb => wpebackend-fdo_1.12.0.bb} (89%)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb
similarity index 89%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb
index f2d640f07a..ba6c54412a 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb
@@ -13,7 +13,7 @@ inherit meson features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b89dfd3500a4dec711132cd7bff72599e67d56a419d000730e14bb99547509cc"
+SRC_URI[sha256sum] = "6239c9c15523410798d66315de6b491712ab30009ba180f3e0dd076d9b0074ac"
 
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.
-- 
2.20.1


