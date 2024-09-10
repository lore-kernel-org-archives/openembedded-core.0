Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A38EDE9BF
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 20:47:59 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.7036.1726001273564147292
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Sep 2024 13:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=M10caeKq;
 spf=pass (domain: smile.fr, ip: 209.85.208.171, mailfrom: yoann.congal@smile.fr)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f74e613a10so7810401fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 13:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1726001271; x=1726606071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TB0WlgcihgJju6Dp5Q10htzFEaHjUaYNGnNkDAnB3Qs=;
        b=M10caeKqZ9mPw+EBitUxrXmurIrm0RZ+T4OCTbpbvGat5W8o4daFU+RxNGVwutHtJW
         3LFvSIaVhiz5hN7L9hgfSFzHukNeENjB32hNYw/iFl8XzJbBH4wUupUm4JACrq12QOza
         XoiBh87fX1+35k0RZHZpIXaMxWvYFB07Iam5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726001271; x=1726606071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TB0WlgcihgJju6Dp5Q10htzFEaHjUaYNGnNkDAnB3Qs=;
        b=o+9ArLCJvWVKj5SM5mD9SX/e843gz5z5vG+IdT9I8Up94MU7I9PIGWI/c1EazvM1pQ
         E2kgnPp9Blr0J1TX5BZjVQc9t3OmbLshVDFK3OrEtQgdFXMN376dX5c41pSoSCUZ0kID
         qQh1nKKf4aLQItW3hzH8tei1UE5fjIdUcvjo6BD7gg5LB4625neemsdcFOlte+Wl76Ca
         PyhdzQM6F5dz9LJK7QZ0kq47/e/2G2DEdN1QJBVg/mxrex8m1jeNcTPEI90Cm5DqvCZY
         5wTcMIMRBaVZJW1fg1SCA9MZ5Ck+3PnVvAs7qBgBK6X0pe+xUan//yLRra+dagS4/pGw
         3Ekw==
X-Gm-Message-State: AOJu0YxYLEmn2wb6gtTU8gBszXKt7I1BVG5pBihOD8vxoLFas3wu6g4C
	PN/3XeALeOETcEovdQ5wA8jUz0ChlRY+e/eQ4YNSqptTAvz+p//eFPaYiJZ3P8aRLek8Slq+b4U
	lX3Q=
X-Google-Smtp-Source: AGHT+IHhFiEPwTCgJXGdQivFFtMkzyoWuX1z/VJnd/T5eURQwJq2YxdYviutkalclL1WHmgb5vWzuw==
X-Received: by 2002:a2e:e0a:0:b0:2f3:f1ee:2256 with SMTP id 38308e7fff4ca-2f75aa110eemr86358791fa.44.1726001270516;
        Tue, 10 Sep 2024 13:47:50 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f75bffd058sm13255341fa.51.2024.09.10.13.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 13:47:50 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] oeqa/selftest: Only rewrite envvars paths that absolutely point to builddir
Date: Tue, 10 Sep 2024 22:47:35 +0200
Message-Id: <20240910204735.3080050-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 20:47:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204370

From: Yoann Congal <yoann.congal@smile.fr>

When building the new selftest builddir, paths in environment variables
are rewritten to point to the new buildir, but users can have
environment variables that point outside of the build dir using
relative paths from builddir. We must not rewrite those.

Check this by verifying that the absolute path still contains the
builddir.

Fixes [YOCTO #15241]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/context.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 99186175e5..acc3b073bd 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -117,8 +117,11 @@ class OESelftestTestContext(OETestContext):
                     newbblayers += 'BBLAYERS = "%s"\n' % ' '.join(bblayers_abspath)
                     f.write(newbblayers)
 
+        # Rewrite builddir paths seen in environment variables
         for e in os.environ:
-            if builddir + "/" in os.environ[e]:
+            # Rewrite paths that absolutely point inside builddir
+            # (e.g $builddir/conf/ would be rewritten but not $builddir/../bitbake/)
+            if builddir + "/" in os.environ[e] and builddir + "/" in os.path.abspath(os.environ[e]):
                 os.environ[e] = os.environ[e].replace(builddir + "/", newbuilddir + "/")
             if os.environ[e].endswith(builddir):
                 os.environ[e] = os.environ[e].replace(builddir, newbuilddir)

