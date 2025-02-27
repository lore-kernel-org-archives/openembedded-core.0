Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E0AC021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 04:20:56 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.3710.1740630046726951024
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 20:20:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=OMoloZ+h;
 spf=pass (domain: mvista.com, ip: 209.85.216.54, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fc33aef343so1153912a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 20:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1740630046; x=1741234846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fPqiGliFKXOad/D87w46loyMdnmz21G0uFlnEfNVtwQ=;
        b=OMoloZ+hU+FN8NCh/l6wUeksmMvx15rvJKmZXWsc8flM+r2CZ11tASds0rFa9w2wNP
         dgXi2fUxciL/sebx9eCN73TLLTlvDCvViw+QEjgX/1ExEV58VohpaOzAmE2n3rOUqSMI
         8A19kcU6UTAmsmHfgfhFDfGiqc57tAw7qBwaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740630046; x=1741234846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPqiGliFKXOad/D87w46loyMdnmz21G0uFlnEfNVtwQ=;
        b=WdMhQkEtWx6PmEa/EpelVd32gcZ2LY+6g7oLt30SmLvcoTPfO2Lt9n4t63eHIcTMG2
         g/1+hKIbqQ6NVzlaxNYJk0P1SMaylWwXcSNjXBkYTa4vw2Y9qWuhpNGYSSm2YP3I1Uv1
         dICU7bgk9tJ1fVVyXqZD5ZnrCwWSecZcpX3tOvaC68+Vc9L1ozM7A+Md86x+WrKsijWQ
         5oFk/0Twsut70DZbNAAwISM/OAUn0jDNBm8+RhM8NSYgy3l/YPPif1pBjqGzkii9yb5c
         Yh7nZpKGctZCuy9KbqyZyVC4hDzAWE90yAGBqm3sxJhuq+dJA1o3hlKW038X5TGQsYUr
         i7Vg==
X-Gm-Message-State: AOJu0Yz4roO8hfDGTidRce5VP0bFUde72ZnI/2RZBgADKh6Fsn+kiKxy
	bL4eICAqQGfSacWASLD90udB8vjUGe6bbNqAcaa0PF69zupYqG2QZ1aNohi74UkEXA1hiDRZmJ2
	jLTg=
X-Gm-Gg: ASbGnctPRel3Ii1cCyMRLyeAx8zL6ETNw4RZlMiDkJNf6s1XbAzj1GFWcXutnQoReUv
	Y+VTRTpKq6NzZFz2vKrrCDQwNQvtD91YerQKpbzuG9LRh8vETUtL1g2MMKIG8Mk1blWHwhRhpxE
	1UN3yn2SXdOMTHfGRrRbSMU5/nwmRrvYKzPn4iQR+hCmH2mK8MF5wnBdRkW2tnalDAvZRYm1yyC
	GCvFivFWoXv5DDaF2wEI3LXKoXqL0OJjkr+YVvOwJ+uzDsrupxplVavBIt0CkbLjnPhF63TInze
	hHMPrRypTyivURUWn7Se1x+PYCsxVArt/aI=
X-Google-Smtp-Source: AGHT+IERPZjDc0RVB9F5T7ARql8klMpBNAS3J5Ydd6aQNVg+H7sMlbc1CftqquyFtaUeA3nZVlhGHQ==
X-Received: by 2002:a17:90b:3810:b0:2f4:4003:f3d4 with SMTP id 98e67ed59e1d1-2fe7e3b19afmr9044355a91.30.1740630045726;
        Wed, 26 Feb 2025 20:20:45 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.225.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe8284f121sm2573182a91.47.2025.02.26.20.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 20:20:45 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][PATCH] xserver-xorg: upgrade 21.1.15 -> 21.1.16
Date: Thu, 27 Feb 2025 09:50:32 +0530
Message-Id: <20250227042032.10655-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 04:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211977

From: Vijay Anusuri <vanusuri@mvista.com>

Includes security fix

  * CVE-2025-26594
  * CVE-2025-26595
  * CVE-2025-26596
  * CVE-2025-26597
  * CVE-2025-26598
  * CVE-2025-26599
  * CVE-2025-26600
  * CVE-2025-26601

Ref: https://lists.x.org/archives/xorg-announce/2025-February/003584.html
     https://lists.x.org/archives/xorg-announce/2025-February/003585.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../{xserver-xorg_21.1.15.bb => xserver-xorg_21.1.16.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.15.bb => xserver-xorg_21.1.16.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
index 080e6d220e..38c81f2372 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "841c82901282902725762df03adbbcd68153d4cdfb0d61df0cfd73ad677ae089"
+SRC_URI[sha256sum] = "b14a116d2d805debc5b5b2aac505a279e69b217dae2fae2dfcb62400471a9970"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.25.1


