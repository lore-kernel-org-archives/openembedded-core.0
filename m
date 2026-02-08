Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BCAEF06EC
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 19:54:11 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25125.1770556127715188248
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 05:08:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X+RNawGB;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: logan.gallois@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43590777e22so1288126f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 05:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770556126; x=1771160926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iJ8cytqyn0UJLtu+gJdN2hLxHG1rvQkIWWNe8Jn33rk=;
        b=X+RNawGBChfdEFLVCY08M0AkwFU9iRwdu9jjnyQls+m3S/h3g4HfEPmlFRSexZoF9O
         Z+ICQ5SAxv24d8E0QCh+U55Gp3fFXVop/HuXd5paecOf/+aKtrJX8/x1jZfjq0vB3smk
         ea7oMyJIItikPKIX9zXUI1FO9ePzVG4iB9ioHnoWLK0keB63GeoVvUOWZa3/8sB/IW6Z
         bP3rQP5Bf/F7eyomT/FOLCqiNNwS6nh9gmh64vG2XVbUNVuZ/s7X39As0VqxhQ1D2cuh
         /NddvRHKPZ1p1Md9NMCKnjd612uCtIEGNr6EFZ5zxIh4900N0WZOYq+fo66P2ctMnXmG
         nWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770556126; x=1771160926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJ8cytqyn0UJLtu+gJdN2hLxHG1rvQkIWWNe8Jn33rk=;
        b=dmezrAuMVphqnMVguh+Fcwrul+HmQprXpWwmYLfJXnLvDjey552Z5pMaBL+k8esYzS
         N9G/UitCHb60qpYyMQm96iulOTQmPzpxoKUS63pzyv7IHjA6cHNROE7sgqeDn3xwDoFK
         XsrCAP8UW/ltjiaeD+nse7Zc2YNqfuGx8Rr0OvRRePMFRdwz/XCuO1LJ7I2q/ayjTRnG
         ldH03cwC5vBPB62pSc2qs1eK57nKDb9nj71EdF2ZisVoB/s1gciW5hdp889zfNo0L0vQ
         4ybKbDaJzfxwvuelxHAj8u2hzljPretYmObC0gz8v6av7kFL12VjlGA9wmdRxyuPtYfk
         w1sw==
X-Gm-Message-State: AOJu0YzUQDg7VOPtBjiYTQr1y27PMNiI3/wD146f64YkhfrfMDk5U/D6
	SrOsCiQgZGzK09RQr5KnrQh5OapzDy2d1ZJ0oZ2YrTf5rhcApKntR0lOLSokNA==
X-Gm-Gg: AZuq6aJk6mLRTz5tEbpDS13nOux9xBxD1c9D1IZbkLgJBnRuINkPMeQ5wBEleVXbMcx
	etcHHkV1x3IudVYTqZtOD2ivIoBhswUe7QQ+xnV+Na8PByE41+PHjnxLlFqhSSBqQ45uHBx0SGu
	RVKZO2iB2syJJGisznbKXFTMp7i3UuO3X8IyHDF1GHSTxqbLuaWhnsGlRzsvsMc654e7yh0Bruj
	dpb9UJ4B8+BzjlEFJpmR4NpEHfslFhw7/lME+aryWkxF5ewPsMy0wlfi3v8dALK8yWWuVe7b6yz
	Y1gy6LcL2WvopIsR359EqoeS6+9HgqsfCC0sFaTG54fl0/X/+vhpNJMUkw3puin+uSsG+jSNL9P
	JxqKLNDj5OUfJ0Us1IAieJ7WrEm4bLXqonS3MYbeKNUP6VplY3xiJRKfc1On9jgjgP8FtkOzZFG
	wPJyjQoNQ1OrNGbuiMbakZHwjoY7I8a3IvcIQ++RzCpLTFZj83lAaf2HEh1A19r+YZ9Q==
X-Received: by 2002:a05:6000:2386:b0:436:14fa:a3f3 with SMTP id ffacd0b85a97d-436293782e5mr11658300f8f.21.1770556125563;
        Sun, 08 Feb 2026 05:08:45 -0800 (PST)
Received: from Minicarpet.home (lfbn-orl-1-620-177.w86-196.abo.wanadoo.fr. [86.196.80.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43637e31a01sm9592707f8f.27.2026.02.08.05.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 05:08:45 -0800 (PST)
From: Logan Gallois <logan.gallois@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Logan Gallois <logan.gallois@hexagon.com>
Subject: [OE-Core][whinlatter][PATCH] oe-setup-build: fix TEMPLATECONF not being applied
Date: Sun,  8 Feb 2026 14:08:31 +0100
Message-ID: <20260208130831.12164-1-logan.gallois@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 19:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230695

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


