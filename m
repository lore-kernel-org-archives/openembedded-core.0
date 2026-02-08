Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998AEEF06F2
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 19:54:11 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24782.1770554550919589468
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 04:42:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UH+NGuOo;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: logan.gallois@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-435a11957f6so2821351f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 04:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770554549; x=1771159349; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O38CQV6Rqd17a+yTuum9KwCqXqqTlP3CWYNRQWJOIds=;
        b=UH+NGuOoNV0fl3JbyDuvMBB9qXUI6bnYO0nEnnqJhjGIYt7iC92gn7vA72Qtg8ojz6
         J3TSDSJDhKunOS19YI3DhON+0jsNY4qSfGka7P2pSMK107/FHn38QbN+NkkvYG+zOQni
         H9rcTCMD79Cxa92yc6V7MMCJZOEKIAgrcXYVlyQ4Tt+5LEgN03dARj6lkgYHJLn+VMxg
         l76jOF9AyFlYA+Q/qAcmKD59Ll90Ud1Mn0jy4pBT1GgmXgdPljgS/yelJI0r4jRLMDag
         xTB25ZPX/AIkNq4dyqYrIeJnY43HMG/zyoIG2EJOC3IhJ9YYLi0314abPkIf4AkxsEpN
         j69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770554549; x=1771159349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O38CQV6Rqd17a+yTuum9KwCqXqqTlP3CWYNRQWJOIds=;
        b=ZhS0KZ+OSXOvMeqM77BbLIbdO6LxRoZN0znn5tYFg/H+8eLi62MzvZHclKggqTp5nw
         oauyRD+kOyrSuInKcyOsSY63iMlddEfhXXkqs0r9LqsCDZD/IKciYlbiUWZgU87JMBvA
         XVtYyb4IvKPYrcmfWZYvm1spVgv+YZcFvx+BeJ1BFatvq2CRiTkSJH4p/jVIrsJGpgJ/
         XaHv8nLbFmmtS6UBafVRpZ7g2B6UQBJGRL0rK+8jPhYkxTBxuhxtbbI4yn2oVlLVgdE/
         /HYpfpeL+Py3bqR7RniuVB0Kmnmhh3lKp4oI+143VBCWBnwUTwi7VbM5TpTI6uAgb/W7
         KlNg==
X-Forwarded-Encrypted: i=1; AJvYcCUZsRFGP8um8W/PW8VtJwg71TmmZ0t/0PE2U1TsL01bbnsM4og/rn2WADJ744gtacNYpJ3bVOP1hexT7hdXd0SYqA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx8AMejJn9CZW5g4AT0AkG4ImfGqly8ZYSncAHscV1UrzCq3Nye
	ZDSebTDYuiZTmhI7IJoLle9CW1yhA6/Vyxh8WUiJ6YALFGn7a46kLKfu
X-Gm-Gg: AZuq6aJuM7einPy4kuf2qiYiKpqPhjMoPhPr29pegDVSGTiM+cUxazCmdj9Gra+mpO3
	VxFxDGeAjdFeveC4BAu4pebIUHen1iS8oq0xLuqRLYKDfMIIZ8ZCVRegStwMO//Ii5DWyzHYE2L
	Vi3F5bt9+tlVRNokXyWPl8JD04QjouXOwxTCst/P8qn2rre6nFPZfs/a3z3VrP/6d5lHuIhppcb
	Et2mvKzSHKLtlw5uWDs8O6K3DvEyNpXOv7wbXC/IW/z3SxS3eRxbt2HC86RoWqXikd7/ly/2Tdl
	DE3ERh4LZzBOY0FMmri/fQpWy2e5wQIXGUOFQItmtaq0AeP4jvR2D80DspF0IQbGOKe850xUT96
	97eGwLi7c8yDYAZ6mhCNctFhZd8cI2DQnRR5ZeOQ6K//fulmUPzbGEG/+pt275Ce432JGa2dPic
	FSYi20qMGh8ZrrB/hkGTXEVpzBJWnENK/QvCG526x6YYJFUpsx4+SUg/kY6r54+92QQKCa4tHue
	On6
X-Received: by 2002:a05:6000:616:b0:435:ad52:31e0 with SMTP id ffacd0b85a97d-43629341c6dmr11574963f8f.16.1770554549106;
        Sun, 08 Feb 2026 04:42:29 -0800 (PST)
Received: from Minicarpet.home (lfbn-orl-1-620-177.w86-196.abo.wanadoo.fr. [86.196.80.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43631c8d378sm12973404f8f.21.2026.02.08.04.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 04:42:28 -0800 (PST)
From: Logan Gallois <logan.gallois@gmail.com>
To: patchtest@automation.yoctoproject.org
Cc: logan.gallois@gmail.com,
	openembedded-core@lists.openembedded.org,
	Logan Gallois <logan.gallois@hexagon.com>
Subject: [PATCH] oe-setup-build: fix TEMPLATECONF not being applied
Date: Sun,  8 Feb 2026 13:42:26 +0100
Message-ID: <20260208124226.6016-1-logan.gallois@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260208000829.343627-1-logan.gallois@gmail.com>
References: <20260208000829.343627-1-logan.gallois@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 19:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230691

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


