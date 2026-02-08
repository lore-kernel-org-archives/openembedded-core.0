Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C65DEF06EA
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 19:54:11 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26503.1770561635045312981
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 06:40:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZnjmqVSH;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: logan.gallois@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso38642635e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 06:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770561633; x=1771166433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iJ8cytqyn0UJLtu+gJdN2hLxHG1rvQkIWWNe8Jn33rk=;
        b=ZnjmqVSHZaCQf2fuvWybhD8BoN7qT3Cy5ucX52DqU+qf+cMX3i0pn7fRcBLmcZ56om
         fcUSDDq8a/kpNqmVil5Fj+eKHMFVL7jKXzZQTtKzvI4YbsujYQn+ZfDuato8vq0UNC0r
         9d2OLRthyeukZSC4c2cF0zM4rWTx5H4r+bB91BZqBY9BCyT0xiJ9EGj+7UUM1WohaFEI
         iE5arumgW2EPMnJlpw9yJ1jyXNUBS6V29GSRtaXxoCiKX3AdCMuB6OKhR8B6gk1NZqHg
         stNsxWR7/oOT8EpMErgPz64ON8JPtCd2hNJTSctQQvp7sZQmqOb7gqfN0ci5bgW96bWU
         YTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770561633; x=1771166433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJ8cytqyn0UJLtu+gJdN2hLxHG1rvQkIWWNe8Jn33rk=;
        b=l2uqMi+3DJTcsl0aNMp0DRElt+mkMS3PUhwoeEF0wn4woLsSXr5sgEw/6u2vGT+DDz
         RzOh/WMIOhoLmn9x3Ih4Cqb0sXLeySB3dEZdXNcMqC0PbqbrGE/e2DGi52hS+uhGiIZF
         nlgugEQZp97i/N/8GvRekDz/BRlpzwtWMvsdMfw1NwlyWpbu3h+xCmwr0w6EWJDXUlCw
         +cPCXxe+vmqXKLm/NAv8/Nt92inG/CT8SSneuAptkCui3KjudDw/XeH4VfUqdyGddeLE
         +DWC0HFTbQ3uneKuBTXPyVNV3hqiTsJUQLMsFvCPRSMkAboVlEj2V/wYN10PMpUv2USt
         XukQ==
X-Gm-Message-State: AOJu0YwNYMxIOwmb564p+wyuUBQLj9ukHXzqXEuW8SZloGW2L+N51fQ6
	Vxbme8i+Mp7XIksbt7rEXF/ByxdBlValo88CfygVw4Adxb/x5vs8m4jJct1LbA==
X-Gm-Gg: AZuq6aJU7C8fZ4xRpOy78qGh0sxTFcwtFfG1uRbeNf49wcA8M63l2sJBtI0plKarVkO
	q+bcQ7Av7XWUduINM1rqS9s4JyJXWgUCdJtERKV7k96maQvX4vxqYrbJjTenjA6ihDXUOCTNoNA
	DXkufJkKJgw8vfoF6YUouAmgUd7EUWoSd5JFX6YDyS01Un8OnZwpMNy+givuMaSZNfPmKt4mros
	AYrgnz125Ga7uUIgUYYsbma4uAbzPIIoy8p+ikbS5www1tICTCEK5AaJWqHONjppH+OCM+XPsGA
	5Ta+O1WAjPjA2j0/og3S0C5iT8dhmc/iZNrrMpGF/CT9qygRQj/6XQd5aOPSPRjD7nR9RtJI+ZM
	ieay0N57h/JsAN6z5DZ+NqYcOKlUPtNRMQBVub/pZvXJXbPn0zlglFVrRcCdAhnfE2vmXk6V+6s
	Xmfz7SQ9Ty9vax3dBJNpgO7seMjVPTxO4SNtHhVF4apIEQ/mNRtxukFv5gMnWT/y6XRQ==
X-Received: by 2002:a05:600c:3b14:b0:47e:e72b:1fce with SMTP id 5b1f17b1804b1-483209d0f27mr106497425e9.37.1770561632873;
        Sun, 08 Feb 2026 06:40:32 -0800 (PST)
Received: from Minicarpet.home (lfbn-orl-1-620-177.w86-196.abo.wanadoo.fr. [86.196.80.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483209af8e0sm112463925e9.5.2026.02.08.06.40.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 06:40:32 -0800 (PST)
From: Logan Gallois <logan.gallois@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][whinlatter][PATCH] oe-setup-build: fix TEMPLATECONF not being applied
Date: Sun,  8 Feb 2026 15:40:31 +0100
Message-ID: <20260208144031.3519-1-logan.gallois@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 19:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230698

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
index edbcd48355a..5ac46dde343 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -98,7 +98,7 @@ def setup_build_env(args):
             f.write(cmd_base)
     print("\nRun '. {}' to initialize the build in a current shell session.\n".format(initbuild))
 
-    cmd = "TEMPLATECONF={} {}".format(template["templatepath"], cmd_base)
+    cmd = "export TEMPLATECONF={}\n{}".format(template["templatepath"], cmd_base)
     if not no_shell:
         cmd = cmd + " && {}".format(os.environ.get('SHELL','bash'))
     print("Running:", cmd)
-- 
2.43.0


