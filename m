Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 752DAC47077
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:46:08 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.151036.1703864761340921448
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:46:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sFlnVypO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6da4a923b1bso199833b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864760; x=1704469560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wsjOXav9clpIUdadPU1Xw5bWzxCYKMRkjioQmJqJxgA=;
        b=sFlnVypOf9StCC1AlaUWRYR7ywBZv9Bb8jOSzoSPYbf4kXmFIDhIsyz8jJ27p0T2Lq
         goY4mXuMEUSaeJSa1ahAZLYBQwIIb24I0OveQy2vwuQWm/fQFfriUWcff45IqRey+Qdf
         2m8AU8vAUvEIUvPYqzWLFkRLS3Egz6ShAoBKYZ08nqkofnnNx9MXsKOZvxOrDVAaXpHT
         ihEOB60I0hpqb3ad2xwD/nGUffg5OaZ22o/SwWuhsaANaXSd6mHG4A3dIich5i/na9yo
         zk/PmJ1EioUn/ZBlWiqORhCc8d2lGEAUdkaUZI7qVSVLFwUuSyYjE6ka3V0GEwlHRNMC
         kR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864760; x=1704469560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsjOXav9clpIUdadPU1Xw5bWzxCYKMRkjioQmJqJxgA=;
        b=n3VVjFtfiqmgGtzWt5ywIaLMDRHQulwQtaJQMpjkik4k6IqX11qqcB1hCh7bh6AMK4
         FdDz9RlDPZX52BLS2Xo/fgvOj/q/NaAZ0KWn9bQhUPHolCNRxOPQgk4U21lrK4b3w/9U
         51kPGlVp9+MBVV6Ix3V4YW6gc+VSfE6iXFM7Ps4y+6AoI3fv2JKbEwd3XqqIxDZARxwA
         4O4FU0Jd1erB/5tObfZZUamVYZ/hF4CR8v2m4/yM4rGikKw94E+G2TnCW0qz3CildIsI
         klx8ZOZCA9M3YRfkfBTznd7635AEQerjq1pKHN8a+7w+yDwY4NG7jafK0CzF6EcpPSjA
         12mA==
X-Gm-Message-State: AOJu0Yyt7RnRu0MV/8WsEd5Cg5uVr5ch69qhZBFLsSunsQAunlbbhWAx
	fZWM6i6Av4jnq4EaNl7vhkdxgZdV54SZGVikli0ui4sm4HcHNQ==
X-Google-Smtp-Source: AGHT+IEmsZkr/CtoICZzuJuUNZv2H3INB4ytkRl20jVvBdjPOT5twnueJNXilJT0l69skaF1Ddczjw==
X-Received: by 2002:a05:6a20:8e06:b0:196:3380:484d with SMTP id y6-20020a056a208e0600b001963380484dmr2337772pzj.95.1703864760498;
        Fri, 29 Dec 2023 07:46:00 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:46:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 31/41] devtool: fix update-recipe dry-run mode
Date: Fri, 29 Dec 2023 05:44:45 -1000
Message-Id: <edfa2aac5c39e12e1149134a6241ad4e5b2ebc46.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193048

From: Julien Stephan <jstephan@baylibre.com>

When running devtool update-recipe with --mode=srcrev AND --append switch
in dry-run, we get the following error:

  Traceback (most recent call last):
  [...]
  Exception: destpath should be set here

Fix this by removing a misplaced else statement in _update_recipe_srcrev

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 85ba125703d5b442133fd7c470b915460ee68ac9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/standard.py | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index d53fb81007..cd79c7802c 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1576,11 +1576,10 @@ def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wi
                 patchfields['SRC_URI'] = '\\\n    '.join(srcuri)
             if dry_run_outdir:
                 logger.info('Creating bbappend (dry-run)')
-            else:
-                appendfile, destpath = oe.recipeutils.bbappend_recipe(
-                        rd, appendlayerdir, files, wildcardver=wildcard_version,
-                        extralines=patchfields, removevalues=removevalues,
-                        redirect_output=dry_run_outdir)
+            appendfile, destpath = oe.recipeutils.bbappend_recipe(
+                    rd, appendlayerdir, files, wildcardver=wildcard_version,
+                    extralines=patchfields, removevalues=removevalues,
+                    redirect_output=dry_run_outdir)
         else:
             files_dir = _determine_files_dir(rd)
             for basepath, path in upd_f.items():
-- 
2.34.1


