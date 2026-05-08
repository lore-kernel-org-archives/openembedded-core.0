Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9D6CD37B4
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:51 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8175.1778224363136602107
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QsoyIXVF;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44c4cc7c1cfso1342796f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224361; x=1778829161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBw4o/7QlBn1RJaatOfj5vUW5J7M2wrg+WA9IWntE2s=;
        b=QsoyIXVFujEEL+n69yzC+DRxuBHcPMOqrxMxtQOTUnpXK16+aH9ENrosm2jT0n0+k0
         y1B+9ZkwH3+WgephrV/h1qN/4zwBzXYcrlCUL0chRRcmGecUjWSL9Ic0xOEYbN6R7//5
         ZSA2qqneifaZJYt0wsBXn9y2jcFVTNqE78NxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224361; x=1778829161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YBw4o/7QlBn1RJaatOfj5vUW5J7M2wrg+WA9IWntE2s=;
        b=Z8yHs7YtwnEOBxoLtoIS/CNf+J3oZrYtr5cyxYV57+8RrEZOnLqwYBVIb+VL4cEJmE
         vA/l4gkolF2Eci68JW41edFjZ1kxZ3wq7Mqr7pyi5M/rMFKJeQa/YxiUIcaXfppm+B5y
         ZfAWwwIkGzg8pfwjTC41v2PoD6fVBa2lhJVqglhpwKispVK6za+XYnTmOMJRbfzK4vNH
         t+tPgLTjIwuQg7QXUX5Wf/OpZL0mlmOOvNoJE5hfAvVgtsb+ombxTsd+FgM5pAysOCAb
         XfA8GGg7Wmy9hqFNcJ7iYEfeVKXa0p7EA0zRuvgGwEwx5RSEGAlIeUCvdwlmoaX+kVHX
         HY7A==
X-Gm-Message-State: AOJu0YwSJgtGvevW1iTVlHwRxrcQm1SG8TlFVP+RRFuXFuRDIrSUMsc3
	p2Knl/mus1bN4G+THH9EDBIJtahtgTsWzRYwxLWaFmJd4NxdMwWqlFszqUcO1KwUqghggA3hAAi
	r6rg+yoM=
X-Gm-Gg: AeBDiev5DYwVI4JEATSdvLTbRi/SLM7Qy/9HcuTHkEZxPqiTtHt6PSe3qqKAF+flEBY
	Lxel1DJQS60LufI9LftUZMmr+N8ZY4dO9k9bvRERggvn45/mXOBw3Ct2T1YVCYzRIVfP6PzSij7
	H5QQBZd64iRvpFNryiNDxbYUN0V3KnL0pxlBb26ZnFc7z2VaZr6peTyiqnIMCyWMlhBb/8R1IKL
	TewINSGtQVfrcY5tvto+AyLCXILiCAcNck5PWtfj9cu5vj1fMVlR4q6aqwQ5nkinVuPkxn/G3Ot
	QwyxGXdh5rYllGwjFUYL1apiyXOH25/BYdX+z2AD+fPBXBgi1XYfUjG0IA8ENp9rbFnlm9eMm00
	s1WTU3lyGkoekMKvTloA0l6Ly46uS6YRgldRSXtrFhKMGMZnO/ewPMO0CK5OAvw24sPhUjeRUFi
	6gfn/gi0Uut9XOsLG8B4k4/fbcQaTS4RDkUc5u20AOAa8cGa1T5dB+KuWVQKfsMffGw3+r4pT2r
	Fl5I1ftluXDqJ8YaHiAhFkMmZ/CHZvOn1Hqyw==
X-Received: by 2002:a05:600c:4e0c:b0:48a:54fd:54ea with SMTP id 5b1f17b1804b1-48e51e21378mr193120955e9.12.1778224361011;
        Fri, 08 May 2026 00:12:41 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 40/52] kernel-devsrc: remove obsolete explicit debug packaging
Date: Fri,  8 May 2026 09:11:33 +0200
Message-ID: <198e47ca1292932a87bb7c2b290ca32f0c5924d5.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236682

From: Ross Burton <ross.burton@arm.com>

The .debug directories are packaged automatically by default, so this is
redundant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dbe335c6c1f1fe8fe72c72d9f7cfec58f3ab1c2a)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 62f5df7a01a..237dec6b128 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -429,7 +429,6 @@ do_install() {
 do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 
 FILES:${PN} = "${KERNEL_BUILD_ROOT} ${KERNEL_SRC_PATH}"
-FILES:${PN}-dbg += "${KERNEL_BUILD_ROOT}*/build/scripts/*/.debug/*"
 
 RDEPENDS:${PN} = "bc python3-core flex bison ${TCLIBC}-utils gawk"
 # 4.15+ needs these next two RDEPENDS

