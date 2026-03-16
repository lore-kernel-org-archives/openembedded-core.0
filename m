Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D720F46429
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:30:08 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46599.1773653403841933541
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 02:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RsSN92y4;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4853fd7b59aso26101295e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 02:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773653402; x=1774258202; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HsVBEUxSPCCLsz0gonJ4BxfMg1QNkw3898ZbGdDiclQ=;
        b=RsSN92y4MKAn+Aoq3WBY5XnXEDG6mSR+L4Qdg73PYK07fqxU+r/PLHJc8FQhhEtNh1
         aLfeoyt+595PVgT3o4mIT1I9YNHvj0QZKQaBMLY0mKqyuP3XuF2siu4hkFbXLodF9Rev
         66Dcs3bxdVwirP7FAQzIpvfmrDbfg+4aM78So=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653402; x=1774258202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HsVBEUxSPCCLsz0gonJ4BxfMg1QNkw3898ZbGdDiclQ=;
        b=UcWVkpT1bVTMuaVDbMh9JMravxk6QFLXfvNNWkXAoM4omG28LOoBNvEynzluPrBRjQ
         8xkIZSL8fazI5lQzTyG2iCk4l2NJyCj+g/lvAWp6dMgVln8xLaOoEra63ce3cAqiCXp7
         sM7h3VIBhR9/QYZS/dUkTyPD+9kpEuPzDyB/fE/1L+akVteEhNpfEK+ZMFaldiI6wlkH
         Jt1df804L7udQBxDgHKi6LIGT5UgvJT+R25T1iPMFEXFluGbsGi1K35rsHjeLfTo3V4N
         JojXJ+8+wkZUKu5qpRpux8fjjWl4zt9XMYMw8Jv3PIOBg/P1DHsuKlPc9BnDBc8h7+sg
         agFw==
X-Gm-Message-State: AOJu0YyntQuknUfCEX/qReZ7StTsFho1g/AwLHsFsD5kMG2qaNW7VktV
	rwunqkSegQUpXq91B01aNT23yu/u/PMxXVLwEAvQMYXcI7Mf4zKaQhafUqJu4h6NsLRVLIRdzT9
	0JutM
X-Gm-Gg: ATEYQzxTpw2FZlgHaBnPACHvRTMBxJ+l0CEXTNoR5GqT/cRikyIH21QyYxIKbRw0s5K
	gx4IA34CrSL1KG2c0OqoAbkH0Di/oct5hJULxZq6ntMBTDCVh9J2TLNWoTnoGmLcvdQ1JN0+w4A
	pxKHFo6ROLqGrsHn4IIgLnnAbXSMpPo+zVSifYJvoTO2HOS9Q1OeFFNc2tiNUdVc342i6l4o+8W
	1Nzg/xh86ubGq+mS87z9su58Hd70Q4ANyV6C/8khF/Rghwju9b/rX5zoOuxL+9tTtZpXgukEWfO
	zKpQpgB0KMJlFVuW345vLhLMqZXS/W7YzCl4DuyHY8Aa4uccs2aVRLrXUZ2rXh18TdZl6OZ6Vel
	97SlR7OXufeennxn6x+jJClvtsp+W6ya4aEnG647TIM5OImLZ48DvlYR/+BQfn5PMn3QHlajp+I
	LP3TqM3aq0H5MvfB1DFrpalYFo7eRovUJtItoPp/4Q8Nd2/3vBTawgLsek9PFrmMuKf/EYiptdG
	wu5RByldvn6cOsGghctx/xMwut+9QdNYQ==
X-Received: by 2002:a05:600c:4592:b0:485:3dfc:57a with SMTP id 5b1f17b1804b1-4855671044fmr206148255e9.32.1773653401936;
        Mon, 16 Mar 2026 02:30:01 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a732cesm91138265e9.12.2026.03.16.02.30.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:30:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/17] libtheora: set CVE_PRODUCT
Date: Mon, 16 Mar 2026 10:28:20 +0100
Message-ID: <a2caa8fee384f805241d6c579c9c7e0d4ee82b93.1773652940.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773652940.git.yoann.congal@smile.fr>
References: <cover.1773652940.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 09:30:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233223

From: Ken Kurematsu <k.kurematsu@nskint.co.jp>

In the NVD database, the product name of libtheora is theora.
This was set to ensure that cve-check works correctly.

Signed-off-by: Ken Kurematsu <k.kurematsu@nskint.co.jp>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a8ddda60332e2a3219e905c1545b5da917f855c6)
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
index 178e1a9240f..ad0be85559b 100644
--- a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
+++ b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
@@ -17,6 +17,8 @@ SRC_URI[sha256sum] = "b6ae1ee2fa3d42ac489287d3ec34c5885730b1296f0801ae577a35193d
 
 UPSTREAM_CHECK_REGEX = "libtheora-(?P<pver>\d+(\.\d)+)\.(tar\.gz|tgz)"
 
+CVE_PRODUCT = "theora"
+
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-examples"

