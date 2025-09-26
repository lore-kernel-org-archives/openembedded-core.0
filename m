Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A414CAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 14:53:43 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.19410.1758898415631518327
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 07:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zUMQt0LC;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-46cf7bbfda8so12428615e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 07:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1758898414; x=1759503214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BPwJljisTX9StxhxS02mICd9evW8nxLWJRojiO0zZDk=;
        b=zUMQt0LCmQPUSfH+XzTVHEp45y8UAGxcYJc5oDTA96VfELMslHojnitLH4oUQ2eFTE
         QBm/34CTu6Kg3Ci/axe5sHB+uLWwWnMgBzZNHsYRlHwNXrClp0dSMo5xV2bfQDUcesS0
         7lVWNhlMlkuj80zt1K5M0/QHEPXkQo50nxM4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758898414; x=1759503214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BPwJljisTX9StxhxS02mICd9evW8nxLWJRojiO0zZDk=;
        b=kxS8qVEUdr64/WdoEMvNhup8qSsLZwrKgIbtLbkwhJW9w0bldSZqQqUuEdw650Nyoz
         oV7SXtAY2V7n5Y+yllUqsGyafV3G/vD5dvL/CAx4Lim1DYyvHTlFKznei6EvahlSG2mV
         szqfD/4vrxUeifYOhcfXhQp2HC2q4v46pUcUa+RWJ/vV7al42ji0+gMRYi+cwWOlEftE
         U2mi2w7TU5y1f2DJTk7xouDnm1mnsJr/l5P4cgyW1uA88ewvjKx0TNX6UtKEIvmwdetM
         EC/gEC+V4xafLKKTjiUtJXz45H09CGcYI5D+7zT9vKLTa24NfSn11LnYQ9vfiKrB1nlu
         KySA==
X-Gm-Message-State: AOJu0Yw1cdeaO7eszyZzHxBAFe3zrEJFsnRARUpKR+qIDSBBaYG6jB2O
	N4EyIZyk3I4rNlwzNORM2rTtr0dZ0/GeBgNBAIm1bEfETiZ6n8mf/SioyYIuIvENutjjDIeb40I
	WEc3oZq/l7w==
X-Gm-Gg: ASbGncs/11Ibmbzk7fxHxzA28+lGTZnxwgVV2LvNIH/4anUps9b5t5ky5X/8JKz9f+5
	q2vXNh02FsUnaa7a8jCniPDjY8M1joOqvbSFoseg8TUhv+loQQ4jtFe+ep9estlFX99xUHB26+j
	mGgbbtcLRecGKD+9YtEdK4mXEIduEIzKA9j2wRCv0JjZ9BUgSW2axwo/yejEMOWrnZy2xocM7nt
	/TFSp3rPOcEIy+pq023e9vxuFZV44v84nW7YgyTcG7imoFVjvfbAbue4w/ZdhQ5LbvpXNNSBqUu
	UhwCEbt5+Lgcl37lyrBO3jE1upRidIzupgjNa8hR7vdBSbTIBtvP7FUXMgbAosQzm+J+6OaL4hJ
	9T1kz8dqgZ3XWYsT5HOMLFG1KcCsAiF60FXB3hWANuYM0hvf192YZIzJr2CsfW+4xnL7awfmWVu
	b4PJtlYHcYPcZ3mPEUHX839XqXcNTrTA==
X-Google-Smtp-Source: AGHT+IF4gYWFCr0KUsYzVf3LgDx/NRnPpPU5HS9ReQloUy1GyjYtLqe8KCvRDIv0gZSFLHcYnV2WDA==
X-Received: by 2002:a05:600c:354a:b0:46e:37d5:dbfe with SMTP id 5b1f17b1804b1-46e3b187536mr28681215e9.32.1758898413626;
        Fri, 26 Sep 2025 07:53:33 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc92491efsm7571433f8f.62.2025.09.26.07.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:53:33 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] oe-setup-build: fix dash support
Date: Fri, 26 Sep 2025 16:53:05 +0200
Message-Id: <20250926145305.528133-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 14:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224083

From: Yoann Congal <yoann.congal@smile.fr>

Being minimalist, dash does not support the (non-POSIX) feature of
passing an argument while sourcing a script. Like in
  . <some path>/oe-init-build-env <build dir>

With dash, one must instead use:
  cd <some path>
  set <build dir>       # puts <build dir> in $1
  . ./oe-init-build-env # can only be called from its directory in dash

oe-setup-build generate a sourcable "init-build-env" script, this script
must use the above snippet to be used in dash.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/oe-setup-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index 49603d9fd1..edbcd48355 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -89,7 +89,7 @@ def setup_build_env(args):
     builddir = args.b if args.b else template["buildpath"]
     no_shell = args.no_shell
     coredir = os.path.abspath(os.path.join(os.path.dirname(os.path.realpath(__file__)), '..'))
-    cmd_base = ". {} {}".format(os.path.join(coredir, 'oe-init-build-env'), os.path.abspath(builddir))
+    cmd_base = "cd {}\nset {}\n. ./oe-init-build-env\n".format(coredir, os.path.abspath(builddir))
 
     initbuild = os.path.join(builddir, 'init-build-env')
     if not os.path.exists(initbuild):

