Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0554EF06F5
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 19:54:11 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24517.1770553072527951389
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 04:17:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kpWeVQ7B;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: logan.gallois@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4807068eacbso32083775e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 04:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770553071; x=1771157871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O38CQV6Rqd17a+yTuum9KwCqXqqTlP3CWYNRQWJOIds=;
        b=kpWeVQ7B9fEtmOR+qoYNGQlYTRofXGUrtmo7NxHCAQ3LZ3oYHYsTN5DBxu71w7aXwN
         2zRXi7Po3nXADa6JNqedmPMy2lx0UapzFxUAmvAc6YVdoqNrh7IumwZKK2gakQkw+D2o
         LQEqnpi6SIqav+3hNZcjJBe0QfoJ6KAHTtR09ZWKC2l4/E6Urh3Te2ZxQm5hIlHDp0ha
         3J8GYylUF8K6IKoVqUK4h82vdJlujsh1isv8o7hYUhyQqcTYaM7x/NqGAPJnrgDEhNpF
         zxAGUMXnZ0kRoBrWT5y7mjyUWXP2xrghVBWc6ixZQeeFJNh0QBrJA7GYQvF9sV1eNfLa
         qMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770553071; x=1771157871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O38CQV6Rqd17a+yTuum9KwCqXqqTlP3CWYNRQWJOIds=;
        b=h4V6mye0A6l+5r7V160J8WIC0TKPAzjW2FZva2R4/s/sKcVOVaFdz319nqJfvOzls6
         0D8z+uYETV1osDSW7uaRYPDMSw1pFSAAI6NoeXJSUhm2qnrhqeGB/VXbXfLJ38P3oFci
         yhH9NdcFYFMNT6SgofgnLmYvKUTy0qbx3JTdy2LkPH6//KSdflFKgQATYN7CvuPi1uQs
         JKZi0qNkYW0SDteCgVZuNDBl/VuC0+Zl2ghYkyrRKhugMG6crxDxJqs9l6WDVgVgnx8X
         AZFVd5ea2o3o1xXmBgHC5UKyKZI8PgxIOvnkEvLZ5f/578hCOXhELYW9s4CG2VLxoo29
         At5w==
X-Forwarded-Encrypted: i=1; AJvYcCUR8HaaPWNX74YDL9s7+c9mIssQU5eSr0kFuebr5CZRrAWZ7xoSmoKretrj7DivY8R4blGCVJ2IM63DZtEkr/e3nQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy3PqMncwNw14fJggdEZp7zckWogJgZHr6Hq403w+3NQRcJNhp/
	64uf1zz0Y5yeC6eakWDKH7AKAKqZjwEkKjhTfdpY+WyNgdS4Q7sEvJ7k
X-Gm-Gg: AZuq6aIWrUOpPspE+JJZQPp66TZKkv9a6wD607OkDUZpJPumsE1jfzGLABOy1RS8c+s
	PtEXomjTPtiuLgTPtkDnjA7OG8uEzBcH+IZmMnmXkXafKZsGVCcV+k/xy3xCFGSzJvRXUmxVc6n
	BgPEYz11XzxjAFPQ3efFXPlbLndAPJfvMi3wJ7h38+GhrYSzgSIlofNfxHIhJ2XCbbMb+eBjBtj
	eP/EfAbsCGIFJv06jNfo8aT46mS4HQpuHTtYflEA6U1sVunxPlnfyhqHyv6fmE8LH2QllFfL2GJ
	yLSz0UKGYN53IXOqZ6o3XlDsXhrSc1RDVs9dS+NI/ROOBlnTtlYDb8wwtEjCBgbavLnRgCTS2vm
	no2e1lJo/JPg//1y1aj0bsrhgeasGAKtUFEI2MyzhKGjly7UsA//E1ih/xgDsn96Zb7Hro13jl7
	BKjWZffau+zaue3KthbJ2Qfj/QcRAIT5G0ypmWp4efQ2uviqnazF2tsVfefBknEIauXw==
X-Received: by 2002:a05:600c:5253:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-483201ee7f4mr116135475e9.15.1770553070723;
        Sun, 08 Feb 2026 04:17:50 -0800 (PST)
Received: from Minicarpet.home (lfbn-orl-1-620-177.w86-196.abo.wanadoo.fr. [86.196.80.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d7a99asm276873425e9.11.2026.02.08.04.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 04:17:50 -0800 (PST)
From: Logan Gallois <logan.gallois@gmail.com>
To: patchtest@automation.yoctoproject.org
Cc: logan.gallois@gmail.com,
	openembedded-core@lists.openembedded.org,
	Logan Gallois <logan.gallois@hexagon.com>
Subject: [PATCH] oe-setup-build: fix TEMPLATECONF not being applied
Date: Sun,  8 Feb 2026 13:17:47 +0100
Message-ID: <20260208121747.1224-1-logan.gallois@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <0101019c3ac3ecca-9535696f-0659-43b8-a071-29534de7acda-000000@us-west-2.amazonses.com>
References: <0101019c3ac3ecca-9535696f-0659-43b8-a071-29534de7acda-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 19:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230689

From: Logan Gallois <logan.gallois@hexagon.com>

When using the new bitbake-setup tool, an oe-template created in a
custom layer was ignored because the TEMPLATECONF variable was not
exported to the environment.

Export TEMPLATECONF so that bitbake-setup correctly picks up templates
provided by external layers.

Signed-off-by: Logan Gallois <logan.gallois@hexagon.com>
---
 scripts/oe-setup-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index b391f3b9254..0a3146fd503 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -101,7 +101,7 @@ def setup_build_env(args):
             f.write(cmd_base)
     print("\nRun '. {}' to initialize the build in a current shell session.\n".format(initbuild))
 
-    cmd = "TEMPLATECONF={} {}".format(template["templatepath"], cmd_base)
+    cmd = "export TEMPLATECONF={}\n{}".format(template["templatepath"], cmd_base)
     if not no_shell:
         cmd = cmd + " && {}".format(os.environ.get('SHELL','bash'))
     print("Running:", cmd)
-- 
2.43.0


