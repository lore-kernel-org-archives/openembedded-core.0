Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8F3C433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:12 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.3098.1639000811524719105
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DyXBY3wm;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id j3so6543584wrp.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rY7QMxiRzWAWVd+pKKB5kIDQNituyIP8o3LFHKuSIgA=;
        b=DyXBY3wmsBfpuT5+gpaL7bFzmPOw+9HhdD29G51uOKdLgD6WHRs7mST18z52GAn3Zo
         aL9NiqH1/3EVM4ZJNLoZrG4gDeuOlve/pyI9xBfEdellLh7OG50RpYUdGb/8RRJlTgsd
         PQRC27obIK76a7XeMYd+mPVeiOyFJf9OEfs8C5ZhoJ5sLWyaIJ3X2ZlKxVAoKukFN4VQ
         M1xnRzZiZd1jrQbstzKDlvptlX2BGkycIwBhQ4W9PS4TF584kkLHEtNEbbXdQ78OiZRO
         iRCjLIWDG5lg8PZ0MlFSRN/4O0JNiJymMma4kNcw/u8591GUqyYp6jKj30qsypZXJNtx
         uShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rY7QMxiRzWAWVd+pKKB5kIDQNituyIP8o3LFHKuSIgA=;
        b=19FJ4y25njeX+88wv3bWkGR9xNf5gG9zX4lgemO28mytQPtPxapps9Vr+JAOSs6VTl
         OEQ4g+eEd66MQT3JylLTwRVad5W0k3tYILLNBRo1cCueabD52rulhvSKrk9UQCMar+Wj
         gdGoe8M0rb/knUpt17JbZZeQTBkMGzXJh6be0bnb2+frnyzmZHgSYy/dyUrw0faANVJ/
         85p569gLq59ycxR/5Iuw0PpkcdAKU73HbAXY5GGTo8MTGqxclznZVgbSQ8LA4WjLawwI
         EBGDNH8YvW4JJqLKMNkCF9xHdu987YkuSQDZB6hKWwyyfh36C4jSS02oUdJbquMqIemb
         PHQA==
X-Gm-Message-State: AOAM530h3WEK6D9pWfY1KHs0B0law4je+jSV8t5CssvZNAu0CW9OIn82
	G6eYqy4XfBRAqHMs4lKy5znP6PdU+WZN7Q==
X-Google-Smtp-Source: 
 ABdhPJzJSjXBU6vgxy3O3oB8qJep9YJpaZJY7VUNPCQtrm9V5m8X1Q5biz6Mtj5mZPcvBcFzOUpcXw==
X-Received: by 2002:adf:fb06:: with SMTP id c6mr1570497wrr.625.1639000810125;
        Wed, 08 Dec 2021 14:00:10 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.14.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:00:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 19/29] harfbuzz: upgrade 3.1.1 -> 3.1.2
Date: Wed,  8 Dec 2021 22:59:37 +0100
Message-Id: <20211208215947.1979470-19-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159385

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../harfbuzz/{harfbuzz_3.1.1.bb => harfbuzz_3.1.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_3.1.1.bb => harfbuzz_3.1.2.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_3.1.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_3.1.2.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_3.1.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_3.1.2.bb
index 1fc83a3bc2..368f7c1bde 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_3.1.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_3.1.2.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f3f3247bdeabf36765acc237a5f651e651e4e9706582b9cc2cf6c9b8102dfa93"
+SRC_URI[sha256sum] = "4056b1541dd8bbd8ec29207fe30e568805c0705515632d7fec53a94399bc7945"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.20.1


