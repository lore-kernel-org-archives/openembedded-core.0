Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A4CC61D9C
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 11:08:37 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.16864.1700651308048991335
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 03:08:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=AIjSzhQv;
 spf=pass (domain: baylibre.com, ip: 209.85.208.48, mailfrom: jstephan@baylibre.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-548f6f3cdc9so2920855a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 03:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700651306; x=1701256106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSFDS16TamfrUEgZudE5O7CU7x4tCFIDxY45roYc0i0=;
        b=AIjSzhQvdEPFD8O4XIPfvOMFI10FcJ2qYI83Zh+I9U0k29HbY3Q4lRhsGKZjq8+rw5
         balEn9QaRtodKr/L4s195g+8AAFwSF9U2B7GntV6ufU2d5558DfESKtMM5B2yZafAf2y
         HxXKwoFj1itaRM5mobQOpcZkqCHrig2NrVDA6ssTk7ch8cKuza4S5B2AagwUwsMuuyFU
         HHtPXd7qfVVVm7EO4zNHJ4XBXFGQrLq6peufUH5D3XNeE7xg5HdhlCR6hR6q07w3mAfq
         Wh/K/0rQv9AJHLpv144c2QP0KuSJfRkYZoc7+4nd1aCyvdT4NGbVBra5PFqf7nWvXsNc
         gwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700651306; x=1701256106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DSFDS16TamfrUEgZudE5O7CU7x4tCFIDxY45roYc0i0=;
        b=qZZLOYAKyneN/mXwwAXAne6LmMUb/02AU6n0LjAy5bOj0TD+ULmM7jcwvn8tRmmHBY
         YJztkcpnGsqkvRI0L3jAuN493M695Hb3mjloR5rFWG25I6auhYVBCXRaDbsIffRNn//n
         l7S7z95KxRM1m+wABC5+eAu4mDJFufGuKTmvwuQzY83ln8AYwao+H8MQPtToVTak6NFS
         hT4g4z41nXWsFUO4Tr/2JYd2+QAx8l8O62kp5wwJ83vHJ3IfS7jVC0rTfoFQHQWGduPT
         j6Ssc57xWTsQnfQ6AmSvzBituigVeYWeywLvs2MiOxGE4i7vwI7CWwJs0kD0xbrDkxIq
         ORvw==
X-Gm-Message-State: AOJu0YxKm6bTDJfLhR0C5JsSglD1ZUWCh1/lMBcWT2yHkMN2uSo11jSx
	zLSOLePQMKy9v6KF4WXq3zIBL3FRXcoJnHFMiD5k/g==
X-Google-Smtp-Source: AGHT+IEkw47JbaRtQHh3iKMbv62smJr0fmotLt7HjR3n5qJMJxXji39IkSNa3r2CHlDnuPc0hEYi8A==
X-Received: by 2002:aa7:d648:0:b0:53e:467c:33f8 with SMTP id v8-20020aa7d648000000b0053e467c33f8mr1521411edr.20.1700651305742;
        Wed, 22 Nov 2023 03:08:25 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id o23-20020aa7c7d7000000b0053e88c4d004sm5790713eds.66.2023.11.22.03.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 03:08:25 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 1/6] devtool: fix update-recipe dry-run mode
Date: Wed, 22 Nov 2023 12:08:13 +0100
Message-ID: <20231122110818.932618-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122110818.932618-1-jstephan@baylibre.com>
References: <20231122110818.932618-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 11:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191060

When running devtool update-recipe with --mode=srcrev AND --append switch
in dry-run, we get the following error:

  Traceback (most recent call last):
  [...]
  Exception: destpath should be set here

Fix this by removing a misplaced else statement in _update_recipe_srcrev

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 scripts/lib/devtool/standard.py | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index d53fb810071..cd79c7802cb 100644
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
2.42.0


