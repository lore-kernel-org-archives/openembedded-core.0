Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F35103A9BD
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 11:32:00 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19968.1774438313940035556
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 04:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=P2aUkE2O;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48374014a77so65489675e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 04:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774438312; x=1775043112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/GhTh4vPU7ZrW3xYMLrsCTP3HsQ4GG3IkI8qG3RR3Qk=;
        b=P2aUkE2O//aHwxU8CPTT2bizUebEIXBzBECA+CZDiNiPDvUjRQWGJrdehAKJ5YXt7Z
         OXBFV5vaMHqn4WvGeHuiefctxnJquU4BlhRwOi17MFI5Eiw/rfHJVdWDTHW4Rna8rhi2
         P9bRR933orzGlqQqLAtEqKqaP9Ko05rKPJvh/48DkNkoIUTV/r2pY+jo2lML9zZ9q8AW
         oIomHrjn/eF7NJpjNC1lWDBFf3FT7LiXQjrw/jBcZhlx9eR15KMO0aEkwLY++Am6Pnok
         W2mJMkYP7nzMYCxLl2MdvBvP2dn0KCoYq6gCDzHq6VmtIPz0exKEwCWlQBTrxy76EZOT
         kmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438312; x=1775043112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/GhTh4vPU7ZrW3xYMLrsCTP3HsQ4GG3IkI8qG3RR3Qk=;
        b=Xd/x2D7Sa7kVFERAI0g+KxyU0L+wweqYNkdsuwSVQ0bSZZut4EgWRvIBUTQETlVYer
         9FbxJNRObI43ThXo8y6lhtf/r7k7EYjMaMvy3SD/gHO1UAbDuENWcyY3vEo0QEar9fL4
         rzokpkxApPXKpOmsNRvBjd/Tl6TT1ZkvRFfZJ4+wCFS1QlYZypblwsBBnV96ddT5OOSv
         ZUhI+ZGRc35AI55y99pQaqmWQFtMDaj0sxYb2w4ycf1eWWgrIBPdNHtWj5gUPjn0eboW
         pvrbgFkVQgqZ3QwzF+vqLaeiAsfvcT3xiBwE4SV/giyYCnUMsgAlVAABk2qbXtAqmhad
         nKBw==
X-Gm-Message-State: AOJu0Yxax7Q15ZjLdHgKpKqFkCoh+rW8Co2IiK6jVrmiwRNo7I+tMoSz
	QG9mA8tQhybgmjtkl2yTgjx7YuD39dR73bNFNlY2m4RxjUT4/jXPvn9a/4ghSg==
X-Gm-Gg: ATEYQzzMqNp2Nw+vPs1byruHyPTHJTMC0amMhGIkMx2q1LbQkId4bpJDWbX7aXQsVLy
	gylwiRRnbuww1FnhgrotYe1h8SIl96pgpFy/7iMGs7XR1AD5An+gh4eAileyQcIAma0ZBW1zilF
	SJMrO6fDVKKmlT8KzF15RfHEWRNd4jUfRRu7wcCD1igUk+FoLR1UH+fl0FqdPgCq2e2iLj2Wq99
	/U3Gkm23oPeSlQLPZPqCEmTXRDlAeyHIpwxDpyjFFxjF4A0HUOGWJV1O5O3WYWC3uyYuyjUfchL
	TzXZs0uDigAgbz3V5+VOPakzakSmHKa5yEgHsDjCzG7jVHJ7ZkjjZnQ5ONpL2mBaZ1VkeMUSw3l
	sqLvIrrIb2TzPXkeoLq0DV8osJeXb4ju10dPh3ny3rK6IZa7m3nc2QwbcLYIOPiEQJ9XM5kodlQ
	hmeLdzE+numDG+zQ==
X-Received: by 2002:a05:600c:8489:b0:485:ae14:8173 with SMTP id 5b1f17b1804b1-48715fc3532mr45169215e9.1.1774438312019;
        Wed, 25 Mar 2026 04:31:52 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711693a08sm170539955e9.2.2026.03.25.04.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:31:51 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [RFC][PATCH 14/14] libxcb: Support Python freethreading
Date: Wed, 25 Mar 2026 12:24:24 +0100
Message-ID: <20260325113112.1163632-15-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325113112.1163632-1-zboszor@gmail.com>
References: <20260325113112.1163632-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 11:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233888

Added xcb-proto-native as a new build dependency and
inherit python3native.

This fixes the build issues when Python freethreading is enabled.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb
index fcd8aad303..ac2fcd4cc8 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb
@@ -16,19 +16,17 @@ SRC_URI[sha256sum] = "599ebf9996710fea71622e6e184f3a8ad5b43d0e5fa8c4e407123c88a5
 
 BBCLASSEXTEND = "native nativesdk"
 
-DEPENDS = "xcb-proto xorgproto libxau libpthread-stubs libxdmcp"
+DEPENDS = "xcb-proto-native xcb-proto xorgproto libxau libpthread-stubs libxdmcp"
 
 PACKAGES_DYNAMIC = "^${PN}-.*"
 
 FILES:${PN} = "${libdir}/libxcb.so.*"
 
-inherit autotools pkgconfig features_check
+inherit autotools pkgconfig python3native features_check
 
 # The libxau and others requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
 
-export PYTHON = "python3"
-
 do_install:append () {
 	chown root.root ${D}${datadir}/doc/${BPN}/tutorial -R
 }
-- 
2.53.0


