Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACE7C3DA49
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 13:13:52 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.43736.1721740431964617726
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 06:13:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Kcll8YYG;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2c964f5a037so3126927a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 06:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721740431; x=1722345231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERYvV8hTJ4Kby2UE1sIvW+IIgZ6z7oLgxkCsdTGecp8=;
        b=Kcll8YYGJAmm14LeJzMEDPR4d45zzk0mfSAt2RSeTyFwtvVa16hdhtWXLLjX3b1gV1
         8uVYJWgMo12IykEmu1UypSv1YAh/OKlz30O6ZIgtyX/5fj1aoj5BN1KO7P2IN3r07wNF
         B1rtJxnoLDOXrt3UUHK0sCm0sINJge8xhVTNsiV9bdhV06zSgVx79U/nJo8OKsXO7PwY
         6Y4eV/nP5cTtt3KaOd+F+xRygC3MJUnCVAKyI7tuh930viqzJVfVpSnE1SrIQRKK1zE5
         6k9M/3iXYkDN9oWH7arIFmD0UrEgSJJkGC3+tTve5vKXi1fCrgNl+ze3YxBC0kwxpNB2
         J+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721740431; x=1722345231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ERYvV8hTJ4Kby2UE1sIvW+IIgZ6z7oLgxkCsdTGecp8=;
        b=lCg1X/dzPZU7vAu+AbP9XwOo0SL0l+pxijfhSGHJs/y4op/or78bDtencrlmV9X8Yz
         kVYxVfHDOq665M30MyrzDeWwvhHaK3KdYCuk9ccTkTSvJUTJHX0SZgp1MSXtUFKJJmXR
         +q+ehklaRZzJ+hWMb5Vnj6NZuUgtPUxJbPUW/DNxmuIF+OBRex/q7AoFEz+Pt/X+xcM8
         ufjbt1rXT+iAfNdl6+hFBhRr6dSsuTM16Xe1WMAKZbuqQIoAgEZFEszJlCNIK0L2TWcU
         TGLwNcm6axeqYpjVs1RbDW9y77QpgG4Omisb8tzFW0hzefgy0oIdUHnTWGsHbDcRkQVm
         ZTKw==
X-Gm-Message-State: AOJu0YwJQnnFMf4topFfuxtMtKzIVyeDnCQB4w4MjUpzhWpCY9mXs48L
	uPhq/JP+RSGzZ9o6Mf1Sl7KtKJGi2ziLbAqwi4MYFWMgXihcVcDAb74G0ro4DeUSp1SO+ImGqk+
	xw5I=
X-Google-Smtp-Source: AGHT+IGgZbDWfWMw1OFIksuOTG6yi5/n4fldiNL80COLMEhc6DtP3sfQkK1E+7su5nh3/yQzdeP6Ng==
X-Received: by 2002:a17:90b:3810:b0:2c9:7616:dec7 with SMTP id 98e67ed59e1d1-2cd1602540fmr7749426a91.6.1721740431064;
        Tue, 23 Jul 2024 06:13:51 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb7754a888sm10091540a91.57.2024.07.23.06.13.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 06:13:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/17] insane.bbclass: remove skipping of cross-compiled packages
Date: Tue, 23 Jul 2024 06:13:14 -0700
Message-Id: <dd29c810970038e9ee427cc1b75f61e708fcd0d5.1721740245.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721740245.git.steve@sakoman.com>
References: <cover.1721740245.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 13:13:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202360

From: Emil Kronborg <emil.kronborg@protonmail.com>

After commit cd25e5544ca3 ("insane: use HOST_ variables, not TARGET_ to
determine the cross system"), this check is no longer necessary. The
introduction of HOST_ variables ensures architecture compatibility is
correctly checked.

Signed-off-by: Emil Kronborg <emil.kronborg@protonmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 6e1ddeb05dcd5ff77e0f5526a6e56a484daa4864)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/insane.bbclass | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index c32dfffd83..4eb8cb1397 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -344,11 +344,6 @@ def package_qa_check_arch(path,name,d, elf, messages):
         oe.qa.add_message(messages, "arch", pn + ": Recipe inherits the allarch class, but has packaged architecture-specific binaries")
         return
 
-    # FIXME: Cross package confuse this check, so just skip them
-    for s in ['cross', 'nativesdk', 'cross-canadian']:
-        if bb.data.inherits_class(s, d):
-            return
-
     # avoid following links to /usr/bin (e.g. on udev builds)
     # we will check the files pointed to anyway...
     if os.path.islink(path):
-- 
2.34.1


