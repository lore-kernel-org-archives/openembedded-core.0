Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7855EC6FD1C
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 15:22:42 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.11670.1678807360098740799
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 08:22:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=fsSnh0YN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id y15-20020a17090aa40f00b00237ad8ee3a0so15516768pjp.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 08:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678807359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gj7qeBamrFuIZbF9haXR2ZoHWs9MAzCIGyuypVRouH4=;
        b=fsSnh0YNHXqzQs9q2f1ruGpNKdSbNsmghKsv36FiFEAchsgSwOC8rFnvO4iQKqrT9Z
         aoqDqLPosZ3qM4lJhYZkSUANlwpIuF8EpkazTqBPgo1FZgihrnPPBrZ1IBiPlnqPcQUu
         TP+bzVVVveFkfom75I+Pp0rALuej3PyhOkhIPu0uUBe3PaoPFWURYyaUERKKdjcAv41r
         +Jwj00IpjcWJ8XNpQ3tJtuzzkBKFx2wwAFh45IhuFt313S9HyMxaj4QAEcexj2NdCFkA
         cxlKLTwcm65vrzdz92kMuPTRmWagT5gLyXKO5zIdiJhTQHOzQ2kspSePPud21/Cd9shT
         054A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678807359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gj7qeBamrFuIZbF9haXR2ZoHWs9MAzCIGyuypVRouH4=;
        b=7GkZidGM2YioMD5DYuqv0ojwqNGj0AhYRgDr0bKwJ6Ouo4HxyYDzh3WZl03aDFylA6
         8+F5ep0Jf0qaJxBcXvTR3hmpITSJuCgZQw5aT6XpPvd/pqR1dcE1cHXoKkMTMcHQh6yo
         z5woISTLGZYv2quJPteGO60591qgYWS23TMd+hjXRFsO+S4B2Fx3C5/zvwKHJA9DtNww
         Hx+xtwP9zP+5cWWG3yPl9463fYjgop6BdkBMt7cL8j2YCROH02dcpmSAyjd6EvT8qVbt
         zzMUUheGfAmyWe8IQKVqBvZREqSNlNSo5sA1qT0qnmHQuZdVWRM3xC3HepiobsqYOndd
         UCbg==
X-Gm-Message-State: AO0yUKVJxmLcAU25AASS4Ul0X1KuRSVfPgVovb27+DKk5W/MbzmYLQ4e
	L0t/HYP20VzoRhsrbWWK2VEDIRh6xRe8asIzxbY=
X-Google-Smtp-Source: AK7set9CuXI6Gt4SJDau7RTAuJyWjhMkEj4Q5aGXtcYL3w0G2taGbWT4hL7YiX/5bJe4nReyXAhz7w==
X-Received: by 2002:a17:90b:1e41:b0:237:39b1:7b1 with SMTP id pi1-20020a17090b1e4100b0023739b107b1mr39624228pjb.39.1678807359199;
        Tue, 14 Mar 2023 08:22:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id p13-20020a17090a284d00b0023d0e743ff6sm1871977pjf.3.2023.03.14.08.22.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 08:22:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/6] oeqa/selftest/prservice: Improve debug output for failure
Date: Tue, 14 Mar 2023 05:21:53 -1000
Message-Id: <68d3766c37e4b3a1b49dc27226b2513e3b0db9a9.1678807105.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678807105.git.steve@sakoman.com>
References: <cover.1678807105.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 15:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178505

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We keep seeing this failure on the autobuilder but the output amounts
to "False is not True". Improve the debug message on the chance it may
make the issue clearer.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d03f4cf19c2cc96e9d942252a451521dfec42ebc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/prservice.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/prservice.py b/meta/lib/oeqa/selftest/cases/prservice.py
index 578b2b4dd9..fdc1e40058 100644
--- a/meta/lib/oeqa/selftest/cases/prservice.py
+++ b/meta/lib/oeqa/selftest/cases/prservice.py
@@ -75,7 +75,7 @@ class BitbakePrTests(OESelftestTestCase):
         exported_db_path = os.path.join(self.builddir, 'export.inc')
         export_result = runCmd("bitbake-prserv-tool export %s" % exported_db_path, ignore_status=True)
         self.assertEqual(export_result.status, 0, msg="PR Service database export failed: %s" % export_result.output)
-        self.assertTrue(os.path.exists(exported_db_path))
+        self.assertTrue(os.path.exists(exported_db_path), msg="%s didn't exist, tool output %s" % (exported_db_path, export_result.output))
 
         if replace_current_db:
             current_db_path = os.path.join(get_bb_var('PERSISTENT_DIR'), 'prserv.sqlite3')
-- 
2.34.1


