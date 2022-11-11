Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACEDC433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 08:04:32 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web09.3138.1668153864333720285
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 00:04:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=SpFQyyWZ;
 spf=pass (domain: underview.tech, ip: 209.85.167.170, mailfrom: vince@underview.tech)
Received: by mail-oi1-f170.google.com with SMTP id c129so4327265oia.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 00:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NBnjVCRr/2uo7Lul1wtfVZyz9OQleMpct2kR25vtXO8=;
        b=SpFQyyWZEZmYF4hOwrkBrWCL61fEmkamMJ18ZXL+wU0ZsKJq1qhDMUwd1gBGIVYcTN
         qngk+8qRUzMGYfDbqruwnluSu76HvXzFRsQngvJpgpbRUsYyLHJGvQTWyo8zG35ga2/b
         w0asCrT4qw+MopJZ+zlf8DMxZXrSQq27UNi7EQzEqqIP252AK/E33mTjpa631KhcAWin
         fETL0P9tkRMSg5T3MTh5W/dHlonG9yPurTuk0T9tEs3vMhLgVmTaYY8lgZGjsI1YqoDP
         KP9lT2wUrjaByWGxWXEA0DGRfgdoZaUcRzLwjuv8dIWrxSeRolY2GXDFy5xtpUfUjkv6
         fzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NBnjVCRr/2uo7Lul1wtfVZyz9OQleMpct2kR25vtXO8=;
        b=WJLt7W15bWL0jsE44ScJ+j/OOLgL42IV8HvHXwNyOAj7wXAXqhLqZiBPcWE1uBziYD
         Z9oMgjWkoj3E71pFcDrRCZsqP7KDW2C+P7OmimrsWsfSSBzkkwQ22YSCnBqt5T3ibG3a
         s50R/rdyvKaFq05ENs6Q9QaB9IL7henBtAKQbfjib2X3bkc8yF+60NuYmK2FMhLdrsUI
         Xj9TXQk+Y1anpUiOa70ELrTQhPooZPjf87Pt7HR+GKkyZwKiQGHUOunRaZphO3RmGaAk
         dmUX5liri4j368Z/Z7KOFjtT2jhXyTMLS4XjXK5k6yFLYviFNL17AkTCXOjt2KkJ7BQP
         zl7Q==
X-Gm-Message-State: ANoB5pl0PwiRh7VL+KsuDHj+EFxoKA5Czv7oWUL4cyc7BJPgl5AhiAM8
	x5AXz0Ep3o+XklWPwB6DqBih106UK62G5v0reeo=
X-Google-Smtp-Source: AA0mqf4pFkR567XRx9EpMoLYQk24vgOZlT1vM7/rSiM0kpPNv1bI9+qAcqmM+fk3M7gNwoQIBPbOQA==
X-Received: by 2002:a05:6808:3099:b0:350:4233:73f9 with SMTP id bl25-20020a056808309900b00350423373f9mr233098oib.225.1668153863513;
        Fri, 11 Nov 2022 00:04:23 -0800 (PST)
Received: from vince-ubuntu.attlocal.net (99-113-4-128.lightspeed.hstntx.sbcglobal.net. [99.113.4.128])
        by smtp.gmail.com with ESMTPSA id p16-20020a4a95d0000000b0049201e2b8f4sm595983ooi.4.2022.11.11.00.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 00:04:23 -0800 (PST)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH] mesa: on x64 machines llvm-config --libdir locate libraries
Date: Fri, 11 Nov 2022 02:04:15 -0600
Message-Id: <20221111080415.1046023-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 08:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173120

mesa's meson requires the llvm-config --libdir command which in turn
returns ${STAGING_EXECPREFIXDIR}/lib, but on an x86_64 bit machine
libs are located at ${STAGING_EXECPREFIXDIR}/lib64. Symlink directories
so that the when llvm-config --libdir is called proper libraries are located.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-graphics/mesa/mesa.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 77f9a5c81d..76247932ec 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -72,6 +72,14 @@ do_configure:prepend () {
 	fi
 }
 
+do_configure:prepend:x86-64:class-target () {
+	# mesa's meson requires the llvm-config --libdir command which in turn
+	# returns ${STAGING_EXECPREFIXDIR}/lib, but on an x86_64 bit machine
+	# libs are located at ${STAGING_EXECPREFIXDIR}/lib64. Symlink directories
+	# so that the when llvm-config --libdir is called proper libraries are located.
+	ln -fs ${STAGING_LIBDIR} ${STAGING_EXECPREFIXDIR}/lib
+}
+
 # set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
 # by default the upstream mesa sources build a debug release
 # here we assume the user will want a release build by default
-- 
2.34.1


