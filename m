Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B24AEF06E1
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 19:54:11 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26535.1770561779146883102
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 06:42:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NAgKqse/;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: logan.gallois@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4806fbc6bf3so25358125e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 06:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770561777; x=1771166577; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O38CQV6Rqd17a+yTuum9KwCqXqqTlP3CWYNRQWJOIds=;
        b=NAgKqse/x0mnwMyXSkECtLOhq0mp5z/gmegEsGwihmAy2j4DMVxey/2vHM2zLOoWuc
         GExMlP83B0Ir0TlyD70meFcZVa9x3s2qOS12l8KRY1szvGuJfv+mmGDx16soH+BoHRhY
         +zPjcySiJCAT9+LecLmA/E1DDOsuWp4TWAuJvkt2GIM7f3wsSQTMZx5gy6/QgyL2uy3/
         6LiI4IZE98GD55QnbLFEESYU6CnICRnxXq3YAPOXpeXVfpdyVf+7wXFPZ7IwjB2sdJ7z
         eZN526r/nzmEh0V2g+6wgMkovBa3yN9UCETI2jGn7lPbTSeyNnTCFVOb3RWgTjgjG2W5
         Ry7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770561777; x=1771166577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O38CQV6Rqd17a+yTuum9KwCqXqqTlP3CWYNRQWJOIds=;
        b=tBcaGv4J/Q3fAPyWrdX8LD7NSKqdA86Ey73fzfSwxA+QjdsRD5XvWcYWTqurb+frVB
         l0p3cXJj2Ws4dfJQdPF9F13mY2qUirRYYpg8Hu7NtCvbFIHVdsbCFChCGBsQDn1bY+Yi
         cr0GGhmwdcjFnlKNzFVIItxesiVAJc2N5ocRO4gGz0ARl0uxOgA4wd6CzCZNeid6JcHv
         HIM2eNAXGTjBDb+slYLmieTQZKbgy61l15NtVxafWWx97SPpFEzMxYV5qX7rIR4lPaN2
         uzUEl7oypqW7QNBW0DBlSuFFoP9pb2hNROxob5SYbDCrKHF0XOV21qsLqvUleD6kEKVn
         nFPw==
X-Gm-Message-State: AOJu0Yx9nxr7QVdTo9hrSd4FUxvB7t7fUM/D+iQ2umgoopoHY5JpIPXU
	Qx7Lrucmz2f3P1azxT4JWqMmrS5c2RU77GB2xqPM6GQ7AHechvUQD6jWb1+qaw==
X-Gm-Gg: AZuq6aIa74zg6OvaTxAsQuWQb9DXY1TwJk8Av4skfmIziX55PPEHanmYZmWKv/yPLyr
	v2/3rGlsVyRoA36k9oVqnDKcgNPGs5FRSLEacdv+tqdCEVPmqp0aHGNxMiJRkKa3/rwyioLVHEK
	gFwvHP6Gu2w6BRTgpeQKiITiRzkd02NAgZPqQJ8Srk6RiVSyeL8M7JKFey1qTOEYVOQYSGEh7V+
	xmBrupkEBPOAoObQTQp6rUV+quHtCOEfJiOx5h09/tDLMg2KKckpMNYDQwLUGz/BxF+JxtfGzZs
	GOpAo1PwJ2Rkm5pkwBkXnw0gn6OUVFJWOeoZHU5kJ7cNOIS6vJN/FmkRP1rM2qeRVR4I2P2hUsa
	vG4Bgh0rR4HL0NCf5X3qbic1tlzCNdJnsgwLzl+w3t9NXzr23baYkjE1mHpaPSFfN2CQzgglJOC
	lc5TEPokCQaBor709RB+svUPB1at3R2e+J8cqaktgn27vv9Jbezi2DIDrYIDCP2yDfGA==
X-Received: by 2002:a05:600c:81ca:b0:47e:e78a:c832 with SMTP id 5b1f17b1804b1-4832022f6d2mr122593215e9.37.1770561777079;
        Sun, 08 Feb 2026 06:42:57 -0800 (PST)
Received: from Minicarpet.home (lfbn-orl-1-620-177.w86-196.abo.wanadoo.fr. [86.196.80.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320728774sm172044925e9.14.2026.02.08.06.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 06:42:56 -0800 (PST)
From: Logan Gallois <logan.gallois@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Logan Gallois <logan.gallois@hexagon.com>
Subject: [PATCH] oe-setup-build: fix TEMPLATECONF not being applied
Date: Sun,  8 Feb 2026 15:42:53 +0100
Message-ID: <20260208144253.4062-1-logan.gallois@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 19:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230699

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


