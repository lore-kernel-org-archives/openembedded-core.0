Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2388C88E50
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 12:09:35 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18523.1789387774128413750
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 05:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pM3RQhBW;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4858303de5dso3297917f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 05:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789387772; x=1789992572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2JT9fOXAZLJGTjZ/FaRe2jMLOX7J+IAkRSxMTgNcdU=;
        b=pM3RQhBW7p7c4yqIoR/gQkJFpaak79cw1IQ8dg0FYfYr8QRl6oMOzsvvMpM87C1Zhn
         r/QhAB4hgQ8GI/Z60eQhtA63zgMv9oxlwruEbfk/l/szOJrghV9mnj2Bfym9scElbkJP
         RyrCoEVCkpYkOydWvvoMOmo3DYD9E+TUnnNZDZU6QnitBxzqpavA44Ms5QOtIRDpvGrJ
         NPoDvBUa29oQKQSHeilFzkPaZqjyWprRinjcdRPQrzlZPNjSLPai0fAMTztAGNfMxXEg
         ssgO4Msh8GH+I9KS9hMxwLJf1+ro9VSVrClGyP+YIQLEqMfTAjRTbJLV10PXdHDs1mXQ
         7yRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387772; x=1789992572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o2JT9fOXAZLJGTjZ/FaRe2jMLOX7J+IAkRSxMTgNcdU=;
        b=n++U8JPIphvW/ahoVOsVRbZDPN7Q8nS4LVmYn7uaNykpgvtaf+uaMEeap6ui2d0Imy
         cK2UTt3NgmCXCn3HVqaN4DEodk8TrHh7iREhG0JnxBvnWlsJr4Pn8nEnMnA+eAh38pzD
         74UANm4UfuiL50cyqAGTgyxJlQMmrbjWUFKrMs07sgKAKSGTsN/hy+TEFd6iI0Va8CaB
         pmdsIVkbOCbTnStCfTTlokLM4YPFwgvaV0omximWBBizOGMPO9l3uBYQlCq6f18/Ghzs
         cWe/hulT819lKXBwx3JC/tMmRhIxHB+5BrTN1Ah1Br1tEcy9K8Qx8xekwDuOX9+byIt3
         6myg==
X-Gm-Message-State: AFuF++mKTC6j4bqCPRZvRciaG4JKmnXn574kokjIJqcJwQO/lDDdr7k5
	/P0m9a2x/Yc3bOLnbclcQjJ5tRc1/yJFbT2iGrV+88DB9xLp4QG8P++azr2DjA==
X-Gm-Gg: AYBFou1t3g7qNL9gSHqQ5tFyPW/3d6nTcpY6NkFCBUdeu6gGlQQwr5Yn5be+3kIJafv
	hI6gsJgxMevcOTOUfl1Lg15pzH5+e/pBdfA8CtUeYW/5o9mNBKXpTbueZz2CL6TH1Ai7h5esNxP
	eGcwk54RrY+4p/11z8vAky+p3tINF+cAezqjmu6ZvjTXGgLSpBjfQ25ZJC1FQLdiKfRFW4qyndJ
	1o5ZvKkuxUWh0fenGwthaFfo8xSwu42CU1PqVsrIrXiDDOgZ61rpEkCJvcORkBw0e0V97o/i7mx
	2G/TXFIFmvJeyppwYyr46Lkg4GkmRjhbThvJ4+2reDNrNZe+AU3sDtNYYt9nY02ouqMHqUxJQjw
	4blpRhR/xwwrjeOwKO45DgCCMc4i4l5Toc08rxUAL/6ezsKm7jBO+eInJ0ZWWfgchXLslIbe2ie
	KEoxHSSwANJ9UfAlVd2OoVUhiCWr5paHo/40SbdIxB4Ju3KWotO6MfwH2xYd2EzcRSTFLDv7F0U
	bFLzp7LXdsxgAW+hlCm1XBmN+StTW2lCGI=
X-Received: by 2002:a05:6000:46d0:b0:487:36a:7820 with SMTP id ffacd0b85a97d-487036a7847mr1452399f8f.10.1789387772164;
        Mon, 14 Sep 2026 05:09:32 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee5csm26590821f8f.20.2026.09.14.05.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:09:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/4] libfyaml: correct upstream version check
Date: Mon, 14 Sep 2026 14:09:25 +0200
Message-ID: <20260914120925.1153614-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914120925.1153614-1-alex.kanavin@gmail.com>
References: <20260914120925.1153614-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 12:09:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245773

From: Alexander Kanavin <alex@linutronix.de>

- GITHUB_BASE_URI should include 'releases' component of the uri
- the regex should exclude various alphas, betas and pre-releases:
https://github.com/pantoniou/libfyaml/releases

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/libfyaml/libfyaml_0.9.6.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb b/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb
index 1a98b396b0f..4c3fe42891f 100644
--- a/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb
+++ b/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb
@@ -3,8 +3,9 @@ HOMEPAGE = "https://github.com/pantoniou/libfyaml"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6399094fbc639a289cfca2d660c010aa"
 
-GITHUB_BASE_URI = "https://github.com/pantoniou/libfyaml"
-SRC_URI = "${GITHUB_BASE_URI}/releases/download/v${PV}/libfyaml-${PV}.tar.gz \
+GITHUB_BASE_URI = "https://github.com/pantoniou/libfyaml/releases"
+UPSTREAM_CHECK_REGEX ?= "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libfyaml-${PV}.tar.gz \
            file://0001-Fix-32-bit-build-by-removing-stray-parameter-to-fy_s.patch \
            file://0002-vlsize-Handle-decoding-when-size_t-sizeof-uint64_t.patch \
            file://0001-build-don-t-output-none-required-to-LIBM-if-no-linke.patch \
-- 
2.47.3


