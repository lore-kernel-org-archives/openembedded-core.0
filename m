Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CB8CA5FA4
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:43:55 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32856.1790495026777840491
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cqpw23bJ;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so1148990f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495025; x=1791099825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MWpjyzqXOrR1qK0UQs0H5jyVw0bZX5U+gDM2ofEXjaM=;
        b=cqpw23bJzNIGRUKB9yGq1zaGrs0W0KhGeILKpDqY4ZAmgj2Td4YpW7RxyQCOnjeA/g
         VBpYcjkgZsV/MjLwhI4zfsWDavVUD4c62aH4B2cTIdYxjccky7ZkojN8lKXjfeSNU4bj
         wVwqNwpFo7XuQXa1CeQPlgYx5S952HYczBZMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495025; x=1791099825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MWpjyzqXOrR1qK0UQs0H5jyVw0bZX5U+gDM2ofEXjaM=;
        b=Rgm8sqhalBDN1bkVyhrtxFp8ulcWnRkC81nCqCzFogLsfpltf46M9yEMXUl/RailzS
         +D0EmJIuyaReHsJbz3+GN0jqbrYaRb0RM6xtpHEINxJFMhRPzgYXKZmOt6L2m/tFfrwT
         WY1/anyhfcTabv+kDkiFmVFTgTcZEOfz4KSUlfqcaQyUqXh2ANO+SwMFDQzIzvlgVaXP
         dOjnh/Z6mxZcRrdY/yxMY4ZW3DmEwWybIJqy81QKKf84t/i3gsWRIFrhnsuOx3aE4jVb
         WwWz7+LETjJ2o3StT3+nrgC2wKPkb+EPCdoz/SqnGvN5vbFjwavGyNgrjzj/8GZl6KcK
         aOMw==
X-Gm-Message-State: AFq9FYK0sZ1cGG47DzcuHEp/srpI4/cUZnlW+N8FjrOxyHred10A7QF+
	cj724uJOl50SI2j08It/VPTkdaA3BEpSgqWzbKXcdU3vBNnMuuvxXTS5iI3pZoDIBVMCGH187CH
	jm9dJqME=
X-Gm-Gg: AYBFou3w9X353W/WMV+7fxGwkqgUzn3juKNgatKIMNqOC8EuF9sR13RvTy/900nHPty
	wwC1HhJ8iTgskmmaMqk0O/wWFiQnV4HanVwmciYXAiZu09txbf4B4mju3y5NBoIwQCAuEU5oRSl
	aUEiKyZTkcl5Fw5e2nUH1df4VRThY3wq9TxJ8sJKU0lTUvkp8UeKdzt5okzyvQ+HpLnAgfFJSbD
	OlldlAYNeWV9avRanONOIYs15gCGYfJ2vWLEls9ZaLauwtpjcAS0Gf5L2GUz6HAg4FyyqsDK3BX
	CvN5+gRfA+r8Z/LZGKMg9B4vGZpLEmkXtXluDBtNjsDDl2y7z2oykG14hSvOvyA1kVvcqPZfEqw
	uQG4SwZz3wl/9wZHhKvqbw/rVktStkdUJzDbO2hLaGbr8fDeHGCWurIe2gjiFiLhkPFwmFzA4b0
	FJBkrCvn2iLuVbQzd9xBzzf9aLrYiQHL/mKAYKzkxD4cKunN51UAodiWtT5mLi0Qt6QItSWX3Qp
	f+CQJ/M/Mjmr9a1QTlisd4YvfIloa0+vboNfmgYSeBCdnERICeqFqpHW7aqY2TGYrvObV6pVw==
X-Received: by 2002:a05:6000:144f:b0:488:8726:8f96 with SMTP id ffacd0b85a97d-488872690a6mr6420391f8f.29.1790495025109;
        Sun, 27 Sep 2026 00:43:45 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:44 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 09/28] fmt: update branch name to main
Date: Sun, 27 Sep 2026 09:43:00 +0200
Message-ID: <b69eda1db6bb2bb4573d9099016f72f5caccbd96.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:43:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246659

From: Peter Marko <peter.marko@siemens.com>

Upstream repository has renamed branch master to main.
Fetching currently does not work (except from downloads mirror).

Master branch has updated this in upgrade commit
* 3336a94097f57485e4b06e91e7bddd5fdef99e80

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/fmt/fmt_12.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/fmt/fmt_12.1.0.bb b/meta/recipes-devtools/fmt/fmt_12.1.0.bb
index 22cab6f1382..b51e0eed650 100644
--- a/meta/recipes-devtools/fmt/fmt_12.1.0.bb
+++ b/meta/recipes-devtools/fmt/fmt_12.1.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://fmt.dev"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b9257785fc4f3803a4b71b76c1412729"
 
-SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https;tag=${PV} \
+SRC_URI = "git://github.com/fmtlib/fmt;branch=main;protocol=https;tag=${PV} \
            file://0001-Workaround-an-ABI-issue-in-spdlog.patch \
            file://run-ptest \
            "

