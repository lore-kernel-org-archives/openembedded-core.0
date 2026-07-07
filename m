Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD63CC44501
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 14:40:28 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.175924.1783435222411466849
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 07:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LsUjwue3;
 spf=pass (domain: gmail.com, ip: 209.85.221.179, mailfrom: twoerner@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-59ebde7d704so1212671e0c.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 07:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435221; x=1784040021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BsUY4B/h8evK81YoeKBzxNvLBxlQzJEvnOC7b4r34ro=;
        b=LsUjwue3FqfqgIUq+Wyg7X3bWtSTakBEem6datflmZeDd+ieJbgtBD6Z4HnKOZBNyN
         k+eUAWvPvmiO4AD5CSBaRcoDpgNt9qCd8ItfHPj6XZ+l523pKDotquqgBsEhpFNizs8L
         AT/T8mRmEnLrHZdBBAupbCtE0rzfSTHyuHsNgyDAokeJFWpoc6cWTFyDhZmuQYqBlXir
         07onGr4jLuus7vBZgKDacNYMQunrorPfUibBFRd+P5E4UXClv1pSG2210UYm78DqQQ5c
         BDX2fZsXZF9B5fSKptvtVmF5j/BvBKQYwJfK0tTM3ZYkZBhYw3h+SuAYygZItD9PwWvr
         McpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435221; x=1784040021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BsUY4B/h8evK81YoeKBzxNvLBxlQzJEvnOC7b4r34ro=;
        b=suaiR31uJdBs1vqY4Z8yM/Fu42Cq9fnfAbZBjBoEQKxfxZUSHP0sjRU8iTJ295jS3G
         EOgfvv4R7LLbw5DgXtrG21SI/tEcQX+SlbaRNRAlqr3CBe5j9ztWPrsIerjO+bSfAgqK
         xk3xhIock/I0upfOjcb1VPRV9YkwbUOyb7v//dSVleo3DKooX3p1Y6o1uirw+Mh9YYOe
         iDDoiKWztdIUI9Zo4wvYQAXP7mAGAZTYy5kh6GRtJxNxr3J+uwQvOHbHgJoyphAJ5BXU
         WvAxiq47ZhrDD1BWqidfQmVvnT2XU5tNuw8Yh1t406dPGtc9xFwDCxGfWESa7hI/qCbJ
         5LWQ==
X-Gm-Message-State: AOJu0YzO/Qxw7ClxZyWgXeVgVcgF5YFIwWG73yGv0D4A2MC/SNCerwW9
	2oEYozScFm7q8kszGiXkpwXpmcF2V+Mebsabbv1+UPL1nNrKJ5gMh9mF6ArWlaIm
X-Gm-Gg: AfdE7clvF9X2TNwUmHOlJYR45hjZGjrp0Krlkt+EPqj9bf2qK1m7/BIsi3RjT+QsaBc
	zjHYVLs/2JX3v0rMSvE+Ai8rVIQil350H3Kv3rLa+4eZl9bjocODe+TVe1Z/WOWjCCF9hFOadsu
	l25G74P9Pn6vP6TDvHd6DdXMcjXs+xxEnEMfT9UFdl2bItj7fiuJ3y79cXAjdMW0Ic4BZmTLyir
	EMNx+VWmbGqsL13Es5W7+MjYciF/lnyG+V9MXAbqIYVVsiZmWLZ61oLY9NbI0mY/TgDj3Q3fZMe
	zKKR2VrSFhdba1g3oLVRX4Myd/OjXRFvH+QZlz58/c23KHYucA+6SCT5z8HPJqsu+E7cK6oH6Mf
	95Jvoq8Er8xrkeu3tsbo2prTCDeshXdCnnlKKzCjv2/VguRyJ1bittqa/G+DD5Z3Ure1imstCdM
	cS9T0y2g5xZOxTfwaIVjLJ+/Pu3E3m0Jr8qan7XIrJaev6HuhHVO33NTU=
X-Received: by 2002:a05:6122:698c:b0:5a4:6680:64f0 with SMTP id 71dfb90a1353d-5be9071fccfmr3025292e0c.4.1783435221266;
        Tue, 07 Jul 2026 07:40:21 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5be02934c13sm7107780e0c.3.2026.07.07.07.40.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:40:20 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/3] buildtools-extended-tarball: drop wic helper tools
Date: Tue,  7 Jul 2026 10:40:08 -0400
Message-ID: <20260707144009.708407-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260707144009.708407-1-twoerner@gmail.com>
References: <20260707144009.708407-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 14:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240398

The extended buildtools tarball exists to make a host with inadequate
or ancient software able to run bitbake builds: it provides a compiler,
autotools, python3, git, tar and the rest of the build essentials. The
things it ships are the build prerequisites a build host is otherwise
expected to provide.

nativesdk-parted, -dosfstools and -gptfdisk do not fit that purpose.
They are not build prerequisites; they are disk-image helper tools that
only make sense for someone assembling or inspecting a .wic image, and
they do not belong in the set of essentials this tarball guarantees.

Drop the three entries so the tarball's contents stay limited to what
its description promises.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index 633f8e6b99d6..bd4c19c7eac7 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -30,9 +30,6 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-glibc-utils \
     nativesdk-glibc-gconvs \
     nativesdk-libxcrypt-dev \
-    nativesdk-parted \
-    nativesdk-dosfstools \
-    nativesdk-gptfdisk \
     "
 # gconvs needed for iconv to work in vim builds
 
-- 
2.50.0.173.g8b6f19ccfc3a


