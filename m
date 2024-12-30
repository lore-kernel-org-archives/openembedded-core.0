Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9694DE7718F
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 04:06:08 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web10.56721.1735531565280345315
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Dec 2024 20:06:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=F7CjtcLZ;
 spf=pass (domain: underview.tech, ip: 209.85.222.193, mailfrom: vince@underview.tech)
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-7b6ff72ba5aso729764985a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Dec 2024 20:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1735531564; x=1736136364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2VZpB9D52P6SA0WpRAnGvNZAKK9epIp/AZ5Ie6DlRV8=;
        b=F7CjtcLZJYtZ/m3+TyIdrJJRRgPqcWo3Ek5VJfBKxWWLnKrkJielJhAkD1tDcHCiNO
         jVLN4aSOWz0TOUOe+KGkpqkn0T59jhE2JIxN6YP+6Ppgp/wRqkGKMpzhpze429tFJ+gl
         jvDwJEvPrnV1ukKzv5ezHdrHiJW/iL8mUmZn/6JZbtq9DQQLGWCI1JXW22+1sYKiphbu
         Dod/+zsGPvwub+GUqi1wszlqiNZGi/mlAEhePNmzZkJOszJz0HD/nGkAS1oYgge140Yn
         DtomjKV5tfV+1P88ilci1YtPal5IbkITkBQWQsIQWv10EzpVHFy+wyAzfcWMp6JajYs+
         9+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735531564; x=1736136364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VZpB9D52P6SA0WpRAnGvNZAKK9epIp/AZ5Ie6DlRV8=;
        b=IJZgcdYZf4JUjvWAjffntQrqZZFUQ/Ozk9XyDw+TD47RgdRSgnLXDE1PMGzTtcQP5i
         OFmwv8jcGzg3gkWgTTJcWemDx9h11VqnunOPzZ4l/wgBk8+9wCE4qYyYpU5UNAgYdz6y
         T5qrz2GfCOAe45ihawA7OvedlTKtw0uYb2cz8BYwaGMYXP7qPW4ApKDlNEXFGbaLEKsp
         LpNW5T+k3flw2xb9WF6R6ihLNq+LXNmMW0PCeO/qUiUj8nYxJrcpB2No9f3LrS80HMpp
         1xC+LDB4oEUlnVBG9owac1EC/wRcdW0nWHunSKjzGiHUZejlrkLq53agQVfbjHA5CZV1
         gBjQ==
X-Gm-Message-State: AOJu0Yx6kY5KCj8VZlBrbJgW0zC5hqpPakR3KqyOCIChYYYoC4uSLObE
	ifhNqoHXwcczqoPJeJJ2nPjJcl4/6rXtM5J7ZFE8xgllb6sGil2YmBcV9WmOD1MsHgGXTqIwAJN
	4sYjbmA==
X-Gm-Gg: ASbGncuQqBZV9oiEyf7BvP0OFx9r6Mt2H5N6FkN38hdaSjCvovfRJV1gExbnxZXiV3G
	dUOSVC6/x1v4biC8edVBeK0v1uLLZnm9qGmwWrLAZlx2XexjUnzz89la4y8W351qT5dLv8tZz7d
	RnVCvqDnnRbIC66xbs7gjME2IqUYPu7qKY/Qu1caHYadCOmZhJJOsymyyd/psUOjz8M8oMGNp/N
	r1bZSiq4zzkmDqQphCOl3zR8djtSH1ZZ6ZigJp8SyN4IHZG/yML9btxUdYtBhUKvvah
X-Google-Smtp-Source: AGHT+IHhVBu5g3Y1dc6ALLS/g2JUUxpjYD2AHcDBsjVNaDYXsGV2OdK6Cu/g2gxwrz3PEifY4lgN9g==
X-Received: by 2002:a05:620a:4009:b0:7b6:cdd4:bdea with SMTP id af79cd13be357-7b9ba75bf86mr4478297485a.23.1735531563867;
        Sun, 29 Dec 2024 20:06:03 -0800 (PST)
Received: from vince-server.hsd1.mi.comcast.net ([2601:406:4d01:1820::afe])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac30a53asm893501685a.52.2024.12.29.20.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 20:06:02 -0800 (PST)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3] gettext: fix libtool: Version mismatch error
Date: Sun, 29 Dec 2024 23:05:47 -0500
Message-ID: <20241230040546.2158672-2-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 04:06:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209135

Error:

libtool: Version mismatch error.  This is libtool 2.5.4, but the
libtool: definition of this LT_INIT comes from libtool 2.5.2.
libtool: You should recreate aclocal.m4 with macros from libtool 2.5.4
libtool: and run autoconf again.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-core/gettext/gettext_0.22.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/gettext/gettext_0.22.5.bb b/meta/recipes-core/gettext/gettext_0.22.5.bb
index 0bf2a56e5f..2d1ace1427 100644
--- a/meta/recipes-core/gettext/gettext_0.22.5.bb
+++ b/meta/recipes-core/gettext/gettext_0.22.5.bb
@@ -31,7 +31,7 @@ SRC_URI += " \
            file://0001-intl-Fix-build-failure-with-make-j.patch \
            "
 
-inherit autotools texinfo pkgconfig ptest
+inherit autotools autotools-brokensep texinfo pkgconfig ptest
 
 EXTRA_OECONF += "--without-lispdir \
                  --disable-csharp \
-- 
2.43.0


