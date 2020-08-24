Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web12.196718.1598282152265721858
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 08:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jq2TRPMA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id p11so1797944pfn.11
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 08:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=qaVw3xqltoR4unZnmFNBTbk/CbI2SSLfl7y01vyE4vk=;
        b=jq2TRPMA+7xo+tMQefcjID4ouxJnOy8N67ZLEg5dvTf8nGqSJIbTbkGb2pt0HQ14kC
         CJkPvwptbGr0d9MvyYzoOOKDJ1D9Ny2UncE0oSQJbLEE/smh/Ss0XbWbbX6Dj0VYPr9y
         /+knGq1HYoEnHMi8T+OLy9gAp+bjpJNcT0qMoCsXu9JjdIz91Ua1uWXebbhhSGpZAAvs
         mGp2pTD9wHTzcemg04SX9NRXyCD3k3NjmDC/D3Z5NZjxmdAcxCm5bNOSgXX/KmB3cLXg
         Rwpoo9AgFl9wWm3e2ZnEg0qob96DedgkCBZgAerkmXX2YA3HpovMG6DQo6QSAiWt4s5K
         MHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=qaVw3xqltoR4unZnmFNBTbk/CbI2SSLfl7y01vyE4vk=;
        b=TMy+pZk4c9Fj9RJ82gjBktKk96Zbfd2tTY32bPyQHMjTRQZDToyy5nCauSm4h0zwiJ
         Pu5O2usAeTrnpS7RdqnqZz/Y4DHp5GcXMEpDzGDq8Oz1LvWkvtnVVfr9XKniXqkX+Y4o
         MFjs5dP3fwP7Vjya/vcKHyL4yZI6WTE4uCqARK/LiX6ysMQNujZuRWqSpjZe1iZjCbiX
         550hF+FktkFr52OZJoSbYAtb+3wtaOo4gBj9vRAhuNzhIFsyXDpvRwVQ+IVJoHgT5rgD
         aD1YVf7ee6oUWKcaCief+GoZzKbudyU7EQokoiemTEqSKB7SeUI13eD8slPTKgwpZ0Xt
         c3uA==
X-Gm-Message-State: AOAM533UC1Yf32SneWgiFG7X1HiwJJWDWwQVYXBj3OicGbhxyB5/Yugj
	qrLMJi1OyNArzESS0KgXpqHqKjeIFQrfQKyv4kM=
X-Google-Smtp-Source: ABdhPJyIeAQ7Ya7CtfUm88SmR/T6AFHoGmKGfC2EDrmmzeGIuVGp+VZfJdQGtKrXnflaWLZRsn5S0A==
X-Received: by 2002:a63:4f52:: with SMTP id p18mr3624924pgl.408.1598282151399;
        Mon, 24 Aug 2020 08:15:51 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id a13sm11530382pfo.49.2020.08.24.08.15.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 08:15:50 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/12] runqemu: Check gtk or sdl option is passed together with gl or gl-es options.
Date: Mon, 24 Aug 2020 05:15:01 -1000
Message-Id: <bec0a45393d968251059f5075add2cf633aecd1a.1598281931.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598281931.git.steve@sakoman.com>
References: <cover.1598281931.git.steve@sakoman.com>

From: Vasyl Vavrychuk <vvavrychuk@gmail.com>

runqemu help reports that gtk or sdl option is needed with gl or gl-es
option. But if user forgot to add gtk or sdl option, then gl or gl-es
options were silently skipped.

Signed-off-by: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4d1e93d4bf013bb0c48032bfda43f77c5aba9ecf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 310d79fdc5..398f0a0910 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -454,7 +454,8 @@ class BaseConfig(object):
                     self.qemu_opt_script += ' -display gtk'
             elif arg == 'gl' or arg == 'gl-es':
                 # These args are handled inside sdl or gtk blocks above
-                pass
+                if ('gtk' not in sys.argv) and ('sdl' not in sys.argv):
+                    raise RunQemuError('Option %s also needs gtk or sdl option.' % (arg))
             elif arg == 'egl-headless':
                 self.qemu_opt_script += ' -vga virtio -display egl-headless'
                 # As runqemu can be run within bitbake (when using testimage, for example),
-- 
2.17.1

