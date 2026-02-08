Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2E1EF06ED
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 19:54:11 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24911.1770555093784724688
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 04:51:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jsI/zJHE;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: logan.gallois@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4376c0bffc1so190715f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 04:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770555092; x=1771159892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O38CQV6Rqd17a+yTuum9KwCqXqqTlP3CWYNRQWJOIds=;
        b=jsI/zJHEXd3MDIkjiKbgBmIRpQrYRx3trHRvN+kni7l8JcHjV9ILLWyde3c8DWYt3G
         I4YRbe5TAcql2AmfOM9r5gGHbgoyWhV6OFUbWlhaWfLuGVWXKJ/DNj/yx38U8hPF/7SL
         Ii+dk1RyzwVRgE0FZEan2IWyu/FlHwEt0vpWAnH1ZVLV8lMec7lDbVWvZt/thGHd0Rfn
         f10+lnDyGCyLFQMdPCHOjCNY+jLUDAGXSDJqJe02UCXVfaoxUstUfeU/igA03XwIQTgd
         Llo2uu7vyR3I41kyJTUahL7dP643uuMc/i4VP4fVcDG+Tn8jIR5zX/4sW36/tOKbxMHZ
         nokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770555092; x=1771159892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O38CQV6Rqd17a+yTuum9KwCqXqqTlP3CWYNRQWJOIds=;
        b=r7rANneHg6SfbTXdq1k6U8UMF6pMpXXRaTrieh2+OWOOZlVTHoDocrzhy7ffnce8z8
         W8Z19Faf0SOibO27rnTBuNeFU2Da1SXcXtYT7hVdIeFEaPs2eOt3R8QPe5jHwRkWiFtX
         M2Nk90gjRU9J2O9qzkRySnKZ31MTTc/9KHGs7sNBIQvQgpePpFY4anCUnzcYAgVqzeVf
         44kIszp1orJZYRBiBiWYPnF03QJeXYM3TPr202NSBMIaq7XCRboi35Eqjgjl+663XV2C
         mTJQ7MFFdYXF7dB3bvlPBmyrFBtd3jqjz3vjZqKr4YneIPC0WMl3SoqpZT459jIBivz8
         8RPQ==
X-Gm-Message-State: AOJu0YxxNTQsybVck5QKn2jagoO4kMqD6oSyFOQKhXBDbaF1x+GjefWA
	r1gHryk1l6fgmTdhmlNvsdoxvwF/FUmzKuouE/q2iTV2sJnZ5jjEzqs1wqYdZg==
X-Gm-Gg: AZuq6aKA2bcXh9NfvsD2+OYRtJ58szm5xdF4oBolBySEbcjtYnLWviUm+gzAQFRBB0B
	c8kAEjpObHfasKnQzpzbZAAjE5BSTD5wDHwKU+qcN8vFFxNRxAvKmBfWwehT+zWZrv/uIeg16MS
	JqatVpb0f+WZGLDdi+8W/RIHUw/lJEJKmEaO16OFvxEOkc6063Lsat20M317qN1SjBcDabUnaQ9
	AfaOhe/McfQ/eTQ93XrI3xShfoUkWdMNUs1lbPbu1ANJKwkaCxoavgGpDqqrXJ8qQV6P85VDjvf
	/Pt3tVIyS49eIL8ptEtr108c68AM4u2AJ9gpWZBs/20Tjjt1APJOOZA8N6b4cwR4zl6Bt/Ya9fY
	APponbZ/GbhbjkNily250Ahsk/CDGuOyQ2IUOirSt9XT28gRH9Y/0l23vmaGm6n98tgMF+NOUlz
	bkhamOyqvq1gl957EHo+Fq5Dm7tos483jWJGx31LTgNbSFNybvC+nhbGayufvrerPYFA==
X-Received: by 2002:a05:6000:1883:b0:435:e3d5:23a with SMTP id ffacd0b85a97d-4362968aaf4mr13910725f8f.53.1770555091752;
        Sun, 08 Feb 2026 04:51:31 -0800 (PST)
Received: from Minicarpet.home (lfbn-orl-1-620-177.w86-196.abo.wanadoo.fr. [86.196.80.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fc26sm17413832f8f.22.2026.02.08.04.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 04:51:31 -0800 (PST)
From: Logan Gallois <logan.gallois@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Logan Gallois <logan.gallois@hexagon.com>
Subject: [PATCH v2] oe-setup-build: fix TEMPLATECONF not being applied
Date: Sun,  8 Feb 2026 13:51:23 +0100
Message-ID: <20260208125123.8210-1-logan.gallois@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260208000829.343627-1-logan.gallois@gmail.com>
References: <20260208000829.343627-1-logan.gallois@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 19:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230694

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


