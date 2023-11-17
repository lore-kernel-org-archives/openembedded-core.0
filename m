Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D253C197A0
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 11:12:43 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.9057.1700219561845513103
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Nov 2023 03:12:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=pPEm/fE+;
 spf=pass (domain: baylibre.com, ip: 209.85.167.41, mailfrom: jstephan@baylibre.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-507cee17b00so2405063e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 03:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700219559; x=1700824359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxheyAbeqtzfBn8BlEtRKNU/86m2MEWVHj4M/cqyaDk=;
        b=pPEm/fE+QcqfuguVbwM3Z+SC9iGo/F/8TghbN32ScuZ8CswAqvo4k5TlR+Vwv6Zter
         pQUC8NV/40r49RShidHNUGs61SN/tcVWgBde5vevslrIiFkq3NCoPxiWdbhKe5yjc9p2
         BVcYCRESb4oilzdsbaSx/xsaqIn/KUURKMpTrjcqghc7HQ4xqCFrx1Mal+vAuAom1nMS
         Xtp2rToAXxqZtJ3ej8IyruIUqDKm+aJZap2O8ZE8AQ87udVB9AlbbtC7Ci/TFc+/+lk2
         lB2TtWjYWetVoQFFlE8iBG6wO4C3c9VPv8kwDPaNvOslvzU/F0L95dwqboUEyBZx2Ug8
         G/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700219559; x=1700824359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxheyAbeqtzfBn8BlEtRKNU/86m2MEWVHj4M/cqyaDk=;
        b=n5KHqOipAeOFW1nDmTo/mWwH57Bd/Nm3TbCDXIvVBeapyLbiq4xWB4wgHY1H3WggT7
         2LEpVPAKFvygcvSM/FGXSSDvXEugfTitzz1t6o9ALTUwTzzV47aBdr3gK2zwePy2gPlt
         6AOXyXArnQnK96+vMUnsZ4paRoUV6AMlniRg3TfyZqlLAjys6Ln79CWUmt6U7nKSLrsu
         hq4dQtpN3JoVVr63jgs74w81NipcCGRzwAFSBrNIwlq8ARoKINryBWGLPQ71gJvZ88Fm
         gaNHKRLDENTnNNOjyo7wZwi3lOoIfNNoMW6xQobkwGFSE0VEJpdosJ/5h40K4XnOk1wX
         Uq1Q==
X-Gm-Message-State: AOJu0YwB2r+2Ba5MopdoNNI2/ZuJgZRpUsqwm6WcT4a93WywUIOfuyy/
	swJWGNXACydt5Q87jUk1E4MDVfDH0xhrRp4HwwK+nQ==
X-Google-Smtp-Source: AGHT+IFjmj1dVYKRzOG8r4FAtJeW9QbGgysM7sAp8/IspvLWY06qCfRiKTEKgC4VMGpcmbVc1u8pdg==
X-Received: by 2002:a05:6512:39c9:b0:50a:77c3:10c with SMTP id k9-20020a05651239c900b0050a77c3010cmr16085864lfu.27.1700219559081;
        Fri, 17 Nov 2023 03:12:39 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id z5-20020adff745000000b0032d829e10c0sm1982440wrp.28.2023.11.17.03.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 03:12:38 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 3/7] recipetool: create: add trailing newlines
Date: Fri, 17 Nov 2023 12:12:14 +0100
Message-ID: <20231117111218.3344066-4-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231117111218.3344066-1-jstephan@baylibre.com>
References: <20231117111218.3344066-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 11:12:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190839

create_recipe() function relies on oe.recipeutils.patch_recipe_lines()
which relies on bb.utils.edit_metadata(). edit_metada expect lines to
have trailing newlines, so add it to each line before calling
patch_recipe_lines, otherwise edit_metadata will not be able to squash
blank line if there are two consecutive blanks after a removal

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 scripts/lib/recipetool/create.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 293198d1c88..f5d541eb6c1 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -873,8 +873,10 @@ def create_recipe(args):
         outlines.append('')
     outlines.extend(lines_after)
 
+    outlines = [ line.rstrip('\n') +"\n" for line in outlines]
+
     if extravalues:
-        _, outlines = oe.recipeutils.patch_recipe_lines(outlines, extravalues, trailing_newline=False)
+        _, outlines = oe.recipeutils.patch_recipe_lines(outlines, extravalues, trailing_newline=True)
 
     if args.extract_to:
         scriptutils.git_convert_standalone_clone(srctree)
@@ -890,7 +892,7 @@ def create_recipe(args):
         log_info_cond('Source extracted to %s' % args.extract_to, args.devtool)
 
     if outfile == '-':
-        sys.stdout.write('\n'.join(outlines) + '\n')
+        sys.stdout.write(''.join(outlines) + '\n')
     else:
         with open(outfile, 'w') as f:
             lastline = None
@@ -898,7 +900,7 @@ def create_recipe(args):
                 if not lastline and not line:
                     # Skip extra blank lines
                     continue
-                f.write('%s\n' % line)
+                f.write('%s' % line)
                 lastline = line
         log_info_cond('Recipe %s has been created; further editing may be required to make it fully functional' % outfile, args.devtool)
         tinfoil.modified_files()
-- 
2.42.0


