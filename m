Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D914CC6B0A
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 05:22:25 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9317.1775107339417325062
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 22:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=30scb44T;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488879b2e6aso3196575e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 22:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775107337; x=1775712137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ukHtWWifh5+BjigOsyyl4zDIGGRJbOUMrE6QCSUo8U=;
        b=30scb44TL4DhtqnjdUpBxY9o6PG2K7mws4oLcSYZYXI7NGANbeCVh56wniUxSqSlvK
         8DWyCQLdDa0grO5aaYlMt+4e7x9zxENsUuao0O+74MzeTozA3eW35/gpl7eNA5axZ5dV
         /b2XoR0RovVzMmvVF+a9vVkKcGHZ4zh4fI6/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775107337; x=1775712137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6ukHtWWifh5+BjigOsyyl4zDIGGRJbOUMrE6QCSUo8U=;
        b=LfO+HGa8lq1ZfEyqzT4wAgWuShMuk/DzZu5NDw69slCUcX1OBWhySQPe4oKiTq3ML5
         DG9wFAjKtqV7mVk+P4gMQ6P060U+2jSvNp0FPHUUyl2U3V/vdEokF6KKXhugmYX1Fj8E
         uZZZG21jnUbGhyR7YUggHLi49GswyzPhPMDXhWCmYY9J3qmmoUGvajTCxUCfj84atJD6
         BCwovo/ZPz7cbJ+eg1po3AkXaDbqS5N0rNVhvVQRzkE6nlqMaWHWsy3ZUe8IQbSxM1cd
         LBMQzJlHj26PbJFOLf206pi39ENbWCGauJFNbSOln0QZZNLbpCcf6A/4uOszQfxFuxGx
         9cHQ==
X-Gm-Message-State: AOJu0YwT/KkqkyF9Kg/hXl/u1DOa1WgtJnBDsATvkWTAtvqLn6pqwSy3
	5ZG2ap+47FBM/Q71HntlUqOzMNKhliQQFRWUxDZDNkEQGWW6aretMT+CzR1Y9VrwIuJXifJE6QV
	sIrUe7H4=
X-Gm-Gg: ATEYQzy0Qk4k8cG4KVjcfb6gN+vA8KrHiNJybjhJ395MuF0mPGE2o9Kb9DfZLNT7eLg
	eRllrgWPTiFxdpDVDklJoW3Ni6TNPHbo8mzRcLmC08QIQdvZAaUuXptWsuwIJk9gShnpD5PtAmF
	4YcEE8/pH9nZZpNw57/6esih6keFBInFC6XQAuiITCjFjhiBM9qzNL4t4cx8Tvm/4Qve6Lh7VEU
	jDkvgmc2772sR/7EskXxSFewb02HVUjBPV441NArGxJXK+RRf7biyEzHNpYSQbwt0eYt4XXoa6d
	G3TnEpjJmvJ3gzSOhfgNjB8r9dPxbU0b4RORRvzu8spB0Q+voHvmWD6fSxkuGv7K4C22uG5DNJV
	/1lm+huyF40vcchC4mVzj/EX8sRPlGA/253mch8BSdENLKva59VwQar6ZqKypIre397qG73MZkK
	hQkC/XsJBbin6RMQQ7/7X2SHwuccsDajcrQVkpd5DEmYK3kX9DlPL8gVqydqaw9OKdt999GrkH5
	mJRz+dFRs/pjPMAW/pVmjaKmcY=
X-Received: by 2002:a05:600c:8903:b0:485:3dfc:57c with SMTP id 5b1f17b1804b1-48883595db7mr80137555e9.21.1775107337571;
        Wed, 01 Apr 2026 22:22:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e829c43sm151111865e9.5.2026.04.01.22.22.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:22:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 13/15] oe-setup-build: TEMPLATECONF were not applied correctly
Date: Thu,  2 Apr 2026 07:21:30 +0200
Message-ID: <445b8820876c227cef49acdc54445eeb55399d67.1775106968.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775106968.git.yoann.congal@smile.fr>
References: <cover.1775106968.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 05:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234485

From: Logan Gallois <logan.gallois@gmail.com>

Since a recent change to support dash, cmd_base is a set of several
commands, separated by newlines.
TEMPLATECONF was only effective for the first command in that set,
which is not where it's needed.
Putting it on its own line will ensure that it's present for
everything in cmd_base.

Signed-off-by: Logan Gallois <logan.gallois@hexagon.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b0bec96403f94312a4ab87d4d489132f2eb853ea)
[YC: The "recent change" is
     commit 35c900118248 ("oe-setup-build: fix dash support")]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/oe-setup-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index edbcd48355a..7bcdeee4c32 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -98,7 +98,7 @@ def setup_build_env(args):
             f.write(cmd_base)
     print("\nRun '. {}' to initialize the build in a current shell session.\n".format(initbuild))
 
-    cmd = "TEMPLATECONF={} {}".format(template["templatepath"], cmd_base)
+    cmd = "TEMPLATECONF={}\n{}".format(template["templatepath"], cmd_base)
     if not no_shell:
         cmd = cmd + " && {}".format(os.environ.get('SHELL','bash'))
     print("Running:", cmd)

