Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22BBC44508
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:19 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139234.1783291393665096113
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=j3z36vth;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso1395883f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291392; x=1783896192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LkV2b4WPmfaUTeJPpRrH9RyRdC73rxKae6/pocRhNWI=;
        b=j3z36vthgUfUyeTy/CVPsBjC3EGG5Wy9szRdpi7xFiSwQcyaLBB0I3gMk12+2nHui3
         c1TN5G6VZSOWIWEKGNgUa0/RBpVYnXEWUMov9P5DYYb6O7VlRFLPkYcHxjFR2ETJ33qK
         qRrbmqCbj7Or0bKv/juTCmr6x2NB3iTlI/3/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291392; x=1783896192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LkV2b4WPmfaUTeJPpRrH9RyRdC73rxKae6/pocRhNWI=;
        b=X+mL55l2OFvMvc2wSXnQZ4S0vmGUhoanUu4/fNpMM02f6Oc8tMw5VL/XzECvk0IyUl
         q2p1cNSnzpoi4CixBilPe8Ri4Eky6AwJD74jxSq0uW+Ebw0kzVXX27+f0L4kNy8WNOkp
         B0Zt1ye+//0qZUsYg1bv7b69PuVhEY3Mz90LDXovCzpbDHiNTHlv4Bq5wDxQJ06lKZTe
         suOuqf9FfWI/3K1Rh9PyVjGpp0iLKw7tGiwzoC4C+wts5q7LKdrXUI3Z6c6RyZX8KwC/
         GnA1KpULxoV0j8yquwL3q6oj3BAwhu+kWPC9qnOlXJb/FiFBPGw1NYaB4aja16dTz2S9
         YXrQ==
X-Gm-Message-State: AOJu0YwidpW5z4rinOKN6W9cUQ/8Ifw1N9SDVqmKGiBlQpFf02qPCUcf
	trlAUQUKgMHQgEc5HzV6MJUa4hU4l4fmqPbhebOe5vqy1c1VV+MLGLc61otn6u7ueIgzmzfaWGW
	INqkRO+I=
X-Gm-Gg: AfdE7cmvuD+Oqjb9be/qYBurzMnZe0mIzmOMFw7ZmLg6kx3rQmWNNyXialXKjAji6ck
	/0kAqqIHuPNFxtU+QsmNz+lrL+uwJn8luDadlRqn8Wgw75TN7R+UAeoXHS4RaRN5G7d2Uqo/whs
	S8f405oGkpv0lxhPdKKvuHjTCNE0+97J+AIBhC3/Ljv+ZSzT8auSPgb/v/0iEIql0+jgo6Ta0y+
	b2857Ky3RHvgw1YvNIXt/umqRtE4andPKUKouyw7XQxPzvk8obcZFpTTrc3AIp05S0PJW22D9kF
	AfvMQ95D0fO27ye9tQB5ZRtU0uX5FcS3med9PNFDSMdvWcADSi7GH2Kp0lQGMIAY/ubzmI8ppY4
	8FS2sT0QLoHbF1YgiwMPZwSvun8WLqubEBO3WGpjnlFTW9An/GanxFUF/M0Z/jRttgrC7scQ4JD
	Qk42eOcc8UHMG9510J7aHHeydPbQ==
X-Received: by 2002:a05:6000:2891:b0:461:a169:f757 with SMTP id ffacd0b85a97d-47aaaae09ebmr9620033f8f.16.1783291391880;
        Sun, 05 Jul 2026 15:43:11 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 48/55] nospdx: also drop do_create_recipe_sbom
Date: Mon,  6 Jul 2026 00:41:38 +0200
Message-ID: <9bf3fd2c6a2611effc1101e808740ef3c6f86d87.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240202

From: Hiago De Franco <hfranco@baylibre.com>

create-spdx-3.0 adds do_create_recipe_sbom, which assembles the recipe
SBOM from the SPDX document produced by do_create_recipe_spdx.

nospdx deletes do_create_recipe_spdx but leaves do_create_recipe_sbom
in, so on a recipe that inherits nospdx it has no SPDX document to read
and, if executed, fails with:

  ERROR: meta-world-pkgdata-1.0-r0 do_create_recipe_sbom: Could not find
  a static SPDX document named static-meta-world-pkgdata

do_create_recipe_sbom is reachable via sbom-cve-check-recipe.bbclass or
explicit "bitbake -c create_recipe_sbom". In those cases nospdx recipes
such as meta-world-pkgdata break. Delete it alongside the other recipe
SPDX task.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4478086b7b13ec365dfb4b2335fb35013e8ceea0)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/nospdx.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/nospdx.bbclass b/meta/classes-recipe/nospdx.bbclass
index 7c99fcd1ec5..925dc7c5b7a 100644
--- a/meta/classes-recipe/nospdx.bbclass
+++ b/meta/classes-recipe/nospdx.bbclass
@@ -5,6 +5,7 @@
 #
 
 deltask do_create_recipe_spdx
+deltask do_create_recipe_sbom
 deltask do_create_spdx
 deltask do_create_spdx_runtime
 deltask do_create_package_spdx

