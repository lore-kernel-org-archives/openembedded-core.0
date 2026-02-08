Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B7DFEF06EB
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 19:54:11 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26355.1770561089750273738
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 06:31:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NTDprCQW;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: logan.gallois@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-480706554beso23761715e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 06:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770561088; x=1771165888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O38CQV6Rqd17a+yTuum9KwCqXqqTlP3CWYNRQWJOIds=;
        b=NTDprCQWnDBxi6Lrv2DqX3O/fyNhXt5yWdyVIrAfjk+5zIZl/YgG5VnCgrpn6tFkF5
         0BSH6fysf4whGWHVTzBJwFxrnQnpxon1OiWPuiifaOsQft4KabOwjTXMNdZ0p4w7qSb2
         ZisHQYON3PctORHLd4HXXwXo4DzJHi3L6vRhq/NQUokDRgw49Ec064MFvAfiqstbsYE3
         yk51r4m9Jam2PHwdjg+/DqVNM5BUV+zQ/TvLclw56CDPBLhckUJFROhcHAePGRouBO0t
         P7NZ1JywHMi6yQF3bXrYCOnOoOSxrB1gLQFhbkMTHEtXfzL1BwQzcdRKNEyzTWD7EuNG
         mfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770561088; x=1771165888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O38CQV6Rqd17a+yTuum9KwCqXqqTlP3CWYNRQWJOIds=;
        b=Qv2f6ShELX53YME6IGEGPTrx1y/uelU457c8KtuFchiwCuOc4OYJM5EOTwAR7pd+Bv
         aLD5kV6quSuOlZzVAFVjrYSHgWVpewC7iAp8TGkxKQHm7UgKWycJN9JsWaZS8VeQcL77
         rjz/LXMmC/Ygwf6KLr6/pBc0ztvA5LyuTosexH2BvMDySjRR76Gx4o7wp+0I3R0mQnjb
         Ij3tobDwJ0o3PthMd7CQBWSbbKwyIvdyHMQN07H5MoViwyl/ZFmVyO6Dja5c1d6/JetR
         e8IBvZLA/8SCIGe9Wlx71UeFzFWEkaGK4OWOR1B1ltR7ZvwTcEzELp/G0tqshsbTuHAG
         gv9A==
X-Gm-Message-State: AOJu0Yxqz70PZlFfSf50J6RODh40vwCn3VZFiJEs62kfTPXgTJsevOyg
	rhjqH5LZ3O/WdbrK4ZPiU0plDGcp/6jmj7TtVKslahkLEhxgLm8b0N9gxuejhw==
X-Gm-Gg: AZuq6aI8mNF3V98TfF/ZMmSGvjV9D63kP/jMlodK4s0Y8E+Q8+MUdDxirupaAl5HP9W
	zdfCAk2PaKXsAzWV/ajcUSBMi+q+1dd0Ev/MLRZeDmqVxu/ky08eQVTYqTjnTre0vIrlS3tb5u+
	biC1IBYefzCb3y+9VZLAwAj+37jVlkFn9OpBLUFf9anRQ6GWo9wcYrGiC9KXjvIQeAe3OC4e2WZ
	4p4zxtKF+wawVbPWsrVArr8qSr4FQNH3hPFFD4ESl4pTIVr0+GEXJbUlFxoddr171PAzhpkr3TX
	k9gWtFHEjQmzLX+IPDBs5aMO3FxCyWdCBgX6tOHqjCDSpHJYCYrJMdVPMGi0JPB8dREusRU5VXA
	8tIDUzBisPfWx5wii5W/NIn5gWuPoambB3NKt1VIlhoJITUCVHjHhzA620V/VGwUf+htM7D1bMN
	hTEUHqjqSJ42fUjY8FztzQVWbpfZ7xEL4E6qnWC9hAH3ESfuS3Gvk2y4a3y57EEw3a/Q==
X-Received: by 2002:a05:600c:8b02:b0:477:9b4a:a82 with SMTP id 5b1f17b1804b1-4832022ba07mr131381525e9.35.1770561087579;
        Sun, 08 Feb 2026 06:31:27 -0800 (PST)
Received: from Minicarpet.home (lfbn-orl-1-620-177.w86-196.abo.wanadoo.fr. [86.196.80.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d7a99asm283630685e9.11.2026.02.08.06.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 06:31:27 -0800 (PST)
From: Logan Gallois <logan.gallois@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Logan Gallois <logan.gallois@hexagon.com>
Subject: [PATCH v2] oe-setup-build: fix TEMPLATECONF not being applied
Date: Sun,  8 Feb 2026 15:31:23 +0100
Message-ID: <20260208143123.1353-1-logan.gallois@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260208000829.343627-1-logan.gallois@gmail.com>
References: <20260208000829.343627-1-logan.gallois@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 19:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230696

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


