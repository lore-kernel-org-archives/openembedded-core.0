Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 846D9F588F0
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 05:42:55 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11370.1776750170349589516
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 22:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=T5p+2i2p;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso51020505e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 22:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776750169; x=1777354969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WyG7IADqW/LWqpg0IJEFGrw/gJdTlkod5Hzjd0IlyDI=;
        b=T5p+2i2p2eZqFnJcfeLUkBnWwy8WW69d3sOc7zb2PrARfiYqC56xxlIZpg7zzq0RXZ
         UILnSlRgPA1NHmuip1uXmnyFHXnDv3Rh+YsjSqB4961bwzn3z7j66rLZyUTB09mqOokg
         YOcF2T8Q1YG+PQRbpNrrjmvIl0+StzkECnc7RK/UW3Vglzy7sJCqrnYa9Q+7cdXfdN0K
         Wvm9FzXlvUs60EC7kYmmcTe+xASZ0JY9uzX7/lvzclJ9YS+outykaGIPPGbzxXe2rSmr
         BcxscnGUUhJ4pPi5Wa3AVv2cm0R+uQI45DxxVtsi99zc6HSae6z/7ms5HZetibJKtiOP
         YmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776750169; x=1777354969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WyG7IADqW/LWqpg0IJEFGrw/gJdTlkod5Hzjd0IlyDI=;
        b=sJt9tqPCNEGLcQ/YC0C5XUoX9vv602OOyf9QnuppP/EsYb0kFQG7S86AwwMhfw7bOy
         aYmJYJ1m+TEMqVe8+371dU8aPQIOEoVaamCUS1FqSsnVN7fno8BBkpwRXdXyJqeN1o5d
         PMSDdC0KmmgudqjG/dvlNX2P9mudnbTJRDIpptzySCePsyMqX2OLek5eAfWOZFmuvSct
         E7fytPHbV6R8ys8B/45s/VPwWMytWzc1FQKq1Ccavl0HZzQat3W/bbKg11okkwdgEBah
         1QltNy33RVdQZ93H0bMrqcXj+zBfJZACbhIXJzEw547ODAl+LsNXcYk4uRrWnUT+GTe7
         MEtw==
X-Gm-Message-State: AOJu0YyA9kg/kXVvfkyQKjf1x9uvEV86BF852A0lfkDjA308Xsf0qXAL
	yw+zStdh2BxxWm8zxZldYANNA++vFs/ZXmcN7pASEAx4x1MyyF9YGnJFgdlBcw==
X-Gm-Gg: AeBDietzB21I5wLcbC07j2wPfai+e5YF1zoP5EE41YnN4jn3zfHFnXz4Xwyziq2qAsi
	55Te0Zhr9puh6Q1xv+3hFoR8LK2/RWt4mYtQuze0gGFAMdWPfwEh+mnnGjeTOKVgRuERXfiF2g/
	HvOsxp4pjHPnQPNvqEfVYR2byt6PpZJv+O/bUhNlvs7rT6wmYD4DmFFoqJs/nqFHmT5CgXDfR0A
	wZEJoHYHjW78nTPK3IfBgFa4PObhrHGN0xtk/bwqV00EsmOozOrPptrju9Z93CcMKKo7evps2/O
	m+QqEnEjVtUjNZ8rVVjnKgBPJOYtfjXSYKJk2h/sjZo/V0aRn99kMmplaFOcX8wYmR1Ek94IjVA
	mDgcCE3ppWztt32M5erdEPyfYDQ3+63KXdj89uUA+q9nVYBG429DktaKHNfh6+8k2njeIXtI7ch
	DWgRn4bJuOLaXlgpE5nXa9p8b2TYrClIEJtcUiC2SENfw5GvXtqejJc8NUmZGLPO6o/zYGixlDq
	8MjwBuIsJ2A0OSvEZFE
X-Received: by 2002:a05:600d:8447:b0:489:1ff5:edda with SMTP id 5b1f17b1804b1-4891ff5efe1mr61460885e9.6.1776750168477;
        Mon, 20 Apr 2026 22:42:48 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cc84a1bsm51373655e9.0.2026.04.20.22.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 22:42:47 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 2/6] pseudo: Add fix for glibc 2.43
Date: Tue, 21 Apr 2026 07:42:36 +0200
Message-ID: <20260421054240.3264-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421054240.3264-1-martin.jansa@gmail.com>
References: <20260421054240.3264-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 05:42:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235592

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to add a fix for a function definition to work with glibc 2.43.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 0f063f1881..3ae560487b 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "43cbd8fb4914328094ccdb4bb827d74b1bac2046"
+SRCREV = "56e1f8df4761da60e41812fc32b1de797d1765e9"
 S = "${WORKDIR}/git"
 PV = "1.9.3+git"
 

