Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086E9FB5E93
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 00:03:45 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65247.1773705818899183716
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 17:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E5GznAcw;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b96f02b4329so925580866b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 17:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773705817; x=1774310617; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XxNOiQrtri0gvL/UQlYM81yjRHmRExKpl7ZFOwXlvjY=;
        b=E5GznAcwmuqw87qwzW2KLTQ9Mpnx+jg+Xhl4dBQHsaMSBspUDsxbwIxARkXELX7i+J
         4iOq0lCpPDIWSL6RVDFBQl0Waie5pD3AJkcRNYFBMfStwty0i9oMRwUhoY821Fx8tgvU
         TFn6ryoMaXPz4adW1ovZSSEy4qxn/chDvyHPmk7XzdUUQJ9Bftr+DmE7i00+Y4D96agC
         vo3ZuzzgUhvzce0gDax8WVRT1oXa94lbX4SGG4hTHlLG3R1rMPgeNoZzPYlEREH59I9W
         0Ts+Ch6X1YBafVirp8MPN7nJocy+a2mL7p2Slm0eO9rrbQk0MlQSObQYIrZvVU/tKfUe
         7zOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773705817; x=1774310617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XxNOiQrtri0gvL/UQlYM81yjRHmRExKpl7ZFOwXlvjY=;
        b=AaKhiWuklGEubKKDoSxvzoFVwsVKwJHmDE5dDsvIrPeSzufLRKqQtF5fgTcEK1qyq9
         KPRow71o0pFcWTNpVx6IRyZd8iwkVMqAPDjWKJi6GwhNXxk1b1VeQ0dwSoU2LYJZbXK7
         ayJ79vhe4dMqg1NTqD4vdLWCbNhqogaDBt/cVU17PC4lk+CHgxg9DK2bXi+0E5s+43Ob
         Le/3lkMdr7B2FcfQFWLFQrKAtry6CqKHfefo0CLUsGdQJWs7vgdnRMXGYRKgceaRClWb
         UIU1UT0YI9lGWgfMKfJEG9j/hqekS1ow65CBmGtAGJr87+npCHkc9hNTW7ZefqgCLtXC
         5v4Q==
X-Gm-Message-State: AOJu0Yx1YzaI+szBiN4d0isQYwRNU0maIA2PG0zMx/dXJNSk9ZmRkC1h
	8qmuRwlJIu0rph2UlLTWtSrSlFgGrz3UspmVZTi1mtAUf0pDE0mdEePi+Z367dkX
X-Gm-Gg: ATEYQzy5eccV63m8yGDqCsuQLS45awfALEPaLyPb1M4/YCektMvbWYl3ue7ynQq7wkh
	lYXjvk+ZoJ3hBmxsDVzz1vOjM+hHnnNOROPlDQbyzVGzGh/V8SQU1YSGrYL/GpawDIV69uIw+qA
	P74eauOOQpJyiZC33gz+H/DMs+FPSpipVxW+ul143pQ+xtxONJs99X2AOcVIbDQoKn4zYrfzeak
	HR+IYifudPYwmtcima+qW1qVwlDhVW8AndJDvRmxRec006mStWmgxH2d5dYamIozeU5bQUQBAOs
	iWOW2JjtzMezqwBze+UZ2FYkEHNOY90+LrJK6Zn3/RcstMNv/WWPAIkHZWuO+x/cePfYnLCWTH2
	E3TOxIlhffWqqQpLmWfiOGQ1wKhmSRq4PtZc2FF4SBY34fXPejtABqtnGxumlWgIPUysv3Y6cmo
	wGVeVx5o4FqxUVku1cfX14vyD+IL2UfHyjhh+73FKB4YKVSZpNnAGmxTA=
X-Received: by 2002:a17:907:86a1:b0:b94:a1d4:ceff with SMTP id a640c23a62f3a-b9765392525mr791848266b.35.1773705816993;
        Mon, 16 Mar 2026 17:03:36 -0700 (PDT)
Received: from [127.0.1.1] (93-159-20-97.cgnat.inetia.pl. [93.159.20.97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf49fa6sm654584766b.58.2026.03.16.17.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 17:03:36 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Tue, 17 Mar 2026 01:03:09 +0100
Subject: [PATCH v2 05/12] no-gplv3.inc: Convert confusing appends to
 override syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-invalid-appends-v2-5-5c65ae5787d9@gmail.com>
References: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 00:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233278

While in this case `CORE_IMAGE_EXTRA_INSTALL::pn-* +=` wouldn't result
in any unwanted override, there is no guarantee there won't be a change,
which would be hidden by this override. To avoid any surprises in the
future let's use `:append:pn-* =` syntax here.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/conf/distro/include/no-gplv3.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/no-gplv3.inc b/meta/conf/distro/include/no-gplv3.inc
index 705e05319a..2034204035 100644
--- a/meta/conf/distro/include/no-gplv3.inc
+++ b/meta/conf/distro/include/no-gplv3.inc
@@ -18,9 +18,9 @@ PACKAGECONFIG:remove:pn-bluez5 = "readline"
 # dnf pulls in gpg which is gpl3; it also pulls in python3-rpm which pulls in rpm-build which pulls in bash
 # so install rpm but not dnf
 IMAGE_FEATURES:remove:pn-core-image-weston = "package-management"
-CORE_IMAGE_EXTRA_INSTALL:pn-core-image-weston += "rpm"
+CORE_IMAGE_EXTRA_INSTALL:append:pn-core-image-weston = " rpm"
 IMAGE_FEATURES:remove:pn-core-image-full-cmdline = "package-management"
-CORE_IMAGE_EXTRA_INSTALL:pn-core-image-full-cmdline += "rpm"
+CORE_IMAGE_EXTRA_INSTALL:append:pn-core-image-full-cmdline = " rpm"
 
 # matchbox-terminal depends on vte, which is gpl3
 CORE_IMAGE_BASE_INSTALL:remove:pn-core-image-weston = "matchbox-terminal"

-- 
2.53.0


