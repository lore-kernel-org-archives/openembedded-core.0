Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB172EF06F6
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 19:54:11 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24799.1770554632944319623
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 04:43:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yzr6+fk0;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: logan.gallois@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so36666635e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 04:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770554631; x=1771159431; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O38CQV6Rqd17a+yTuum9KwCqXqqTlP3CWYNRQWJOIds=;
        b=Yzr6+fk0Un7ridGtyQkZooz3gn76h2omGk4IJgPyFbPH73smiLYwZ6BMgJMonOcW9z
         KOWLgjw6/RH1SQuMldBe0MJOIivzJJu3Z3ez42AaHeaFbu/iVHEyFlk0Dhjjh0wZb5qC
         10iNqU9dI9nw2VI68UziqA/eilX3sqDy5ORfdGRtQzc0yoO0uZpx43jdMuqXtVVJBWme
         5yJKhKvea7Z9/zdPH2RfrYXFDijDqcLV7l0lSUYy7r7/p2ZD0GY+ZWpJmreS/jWqhp4a
         03nJHefUXFFaBj6e34yTXFqRtoUsXLHQL5us04Q7XywA/4/CBjfAJCd8VS/sHDumz3qe
         rQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770554631; x=1771159431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O38CQV6Rqd17a+yTuum9KwCqXqqTlP3CWYNRQWJOIds=;
        b=Xd/V5bFPr255xzQOoYcePeyGUTJ4DHTTl/4QSvKpiEPLn70U8uP43vlsr3V8hF7Dxc
         HcUJjmkHPWsL4bKuWtJ+XF7A8TL0yNS3HgS0JbCkodWayMABP9Guxlw1hms8PMWPXrwM
         C/EFicjfd7GpDhhiwRb9rOqzAAoUrhyMWU40eF7VJYDJWy8HL8hR0HkFnwP6MHUsCArS
         WNvDGVALRRTv5a3tMv9K6AOzQosHr6JFmHAvqLe+Ux8NdA55HYuvw3pUeN0SbERehhbg
         hxZUsmmggm7GsQEm+DrzWvGP+CAQeNlzZ4ui7e3OAQnH0NLgwNp4XouxnhlT1O/WbDlG
         K4og==
X-Forwarded-Encrypted: i=1; AJvYcCXstCcs/eRmM6IRAXyUb78F5LHRuNshYYnlx5Y6b3lYZNqNhw4BoXIuTUqsOpby3BOua5rNsPLcdsxlXMP3GUPDfQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxWpc1iS78CFMYR5rThOzwiKf0qom2LR0u0S1z0L2SSlH2nsQCt
	cw92vAMkVQpAHocY373mJ6OWaPjU2XayHr6+lUQiFrEnYI1sfWfJHQp3
X-Gm-Gg: AZuq6aKOiaiT2WlmB1ugTelP87kuxzVlJDlf+MT4nqdIYCX/DiKvu5tXCI5mqkmW7vM
	JIAZ9uxumDIRPUJO0rbsqN46C52o/Y6w2C4RtoBDORC+0sqA4/b8IOYPSO6vtxUugg4OCpVn8QW
	THqvkTEuhSNXFUi7axxF4MJ1042pV7VbBLRm7tYpeT8bUz7CjkCyJxq7Rp8KbG3yPoR3TsbNIOD
	kMdzPtzrJoclCzGrgtB20uhK5JT+XSDFkgZDclkI22Cd4t43Se7chBZarxR0w/AusG0k6EnjOZ1
	FLREcI0VIsQqFixfoQywZdpREYsCDEeysni1f6W7V149bXeAjw6yYudt3jP0xeTSkdhzkRxpuv8
	To0p2kqjED+sF0ZG3/33bhkJO+GxLb60VpS3i+0Fcq5SXvJcP+XCmUcund21qtC1wpSurTSRH4r
	VElpdMGPfwGYrVoXuKLATICnkY584Tp6Z9TBC840J+HgaUSl/MRqYnZ7ZUJ8mW9Va3fMrP1i8bB
	iVb
X-Received: by 2002:a05:600c:548d:b0:480:7162:fa48 with SMTP id 5b1f17b1804b1-483201ecd90mr134420595e9.13.1770554631271;
        Sun, 08 Feb 2026 04:43:51 -0800 (PST)
Received: from Minicarpet.home (lfbn-orl-1-620-177.w86-196.abo.wanadoo.fr. [86.196.80.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483206cc7d3sm173060725e9.5.2026.02.08.04.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 04:43:50 -0800 (PST)
From: Logan Gallois <logan.gallois@gmail.com>
To: patchtest@automation.yoctoproject.org
Cc: logan.gallois@gmail.com,
	openembedded-core@lists.openembedded.org,
	Logan Gallois <logan.gallois@hexagon.com>
Subject: [PATCH v2] oe-setup-build: fix TEMPLATECONF not being applied
Date: Sun,  8 Feb 2026 13:43:48 +0100
Message-ID: <20260208124348.6548-1-logan.gallois@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260208000829.343627-1-logan.gallois@gmail.com>
References: <20260208000829.343627-1-logan.gallois@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 19:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230692

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


