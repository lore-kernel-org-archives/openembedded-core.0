Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E094C55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:23:44 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15082.1785846220320970247
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gwlevf4B;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49800c6a846so28273715e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 05:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785846218; x=1786451018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Yc240barsdMo78vqh3/tGZBoiNgjhLv7uy7w6S2qKRM=;
        b=gwlevf4BR3utRxLuBbybfgfu6PVnGlyJ9K3mJ2JLqBurGwwvyFjiIq+J95f8K4ivsr
         +RQMq5L0dqP3hpn52oQBAi3iYY4KvrYx+Wn0fOPhZeS3aKAydXgIWWkC2V0WK55ajTB9
         0q3QFvICJo60y4Fuee/C7hmfd0YCiinUXaqp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846218; x=1786451018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Yc240barsdMo78vqh3/tGZBoiNgjhLv7uy7w6S2qKRM=;
        b=dp2zZBqlz5kchdbUn/k2r0/FFUvTT4MISTXaMzg4Dov4tMDziPnLpu3by+TL7tpCzt
         84vKVADVgq2U541H1D2+T1YU4wXOLMSykYrZFQ16NRyEHMs2gLUSQJy5GGlFKIDCgrfH
         R4gNIOfahDWn9TgKRj9kAJY1YKqvjWShz/w1ILg0cPiBeBDmR6kBYw0dZEhIYJGO2AcN
         sShGQbEflNXq4a3p5+DbLxZtbdcwi3tyo9GTBXlPEDqx8LKR4cN5dQEXvhz0aOthZayG
         38KGil1d6J2bLL6T0y9+a2ZRW7fDLKLLXo1HhSMW25bnQqJdemx8/NT2iCmZ7sujKzGm
         TeFA==
X-Gm-Message-State: AOJu0Yxlu7zzUn5V8F6KfNn65m9/iYkLsNoMDW4PvhhYEEXv7UMGZSEu
	PFsk87QNzFFgq3h/h8FjHpnwS8dKJ9BlPWJQN8uNuzl2hFCF4shMYZTehtRXYysthwQmEbGS6wd
	hIJWdVRU=
X-Gm-Gg: AR+sD132WD9faTBABkGklB/LuY/BbabJS3tDjumQY7cQ+kIH2C5Wiy6KKyFeceZpWRE
	zWyC+IOQpCUYcubFSeTG7JPKaEMf0M/AXmfsda3dBKdiuNOzbtZuEoRuV46kVWAf03wwSOz8tx4
	5i7ws4bGXSfvq5Mk+DE/iYHszGR9QYNX6S3HZZMaLxW9FUqvP7sr1BUDNyp/3/caf0ryH2HJLFb
	VcYHk+Hue1nzvguZAwFW+60l3pVXx6wJRjtBKqWX3yhs5pkZTYmo6Iy9weeZgrIh5/DwhfmUOzP
	dzH7DUHz8KB8fWDz1tbPugEte5CPuOz81NOPhoeTcArAWcmUQwES+I6bhNrbZIxJ25f4ss4MhCq
	dL8DvkbWS312bLIlomUXsgqO8YO3VC7MG3aIEyN1kxq6A0QaC5zQMYSKDeA13CedDuRkwwth+R2
	onpCkJTMs8tqwmAbkXxnwE2oU54b7ajauZxIgN2OVfb2wHvY7huQXs3DH38rg55qNA2+TKDv1u2
	w0HJmYF4gDMjzYt+Q==
X-Received: by 2002:a05:600c:46c6:b0:495:4a22:d684 with SMTP id 5b1f17b1804b1-4980c674700mr295081085e9.10.1785846218360;
        Tue, 04 Aug 2026 05:23:38 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ce15:a763:9e16:7bb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fcb0c5sm76247535e9.4.2026.08.04.05.23.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:23:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] xvinfo: Upgrade 1.1.5 -> 1.1.6
Date: Tue,  4 Aug 2026 13:23:28 +0100
Message-ID: <20260804122335.3094065-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804122335.3094065-1-richard.purdie@linuxfoundation.org>
References: <20260804122335.3094065-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:23:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242740

Changes:

- meson: Add option to build with meson
- gitlab CI: drop the ci-fairy check-mr job
- man page: fix warnings from `mandoc -T lint` and `groff -rCHECKSTYLE=10`
- Accept --help & --version as aliases to -help & -version
- Add -help option

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xorg-app/{xvinfo_1.1.5.bb => xvinfo_1.1.6.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xvinfo_1.1.5.bb => xvinfo_1.1.6.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-app/xvinfo_1.1.5.bb b/meta/recipes-graphics/xorg-app/xvinfo_1.1.6.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-app/xvinfo_1.1.5.bb
rename to meta/recipes-graphics/xorg-app/xvinfo_1.1.6.bb
index d7e5d917efe..75f9b26a85d 100644
--- a/meta/recipes-graphics/xorg-app/xvinfo_1.1.5.bb
+++ b/meta/recipes-graphics/xorg-app/xvinfo_1.1.6.bb
@@ -11,4 +11,4 @@ DEPENDS += " libxv"
 PE = "1"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "3ede71ecb26d9614ccbc6916720285e95a2c7e0c5e19b8570eaaf72ad7c5c404"
+SRC_URI[sha256sum] = "a436945e6a4ab70590358eec2b85d26970f7de480d27e8a25af8fe8421e88ae2"

