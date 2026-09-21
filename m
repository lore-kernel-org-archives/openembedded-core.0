Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 728EFC982F8
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 07:07:10 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43667.1789974423409096871
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 00:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ddjSXltl;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so14613475e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 00:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789974421; x=1790579221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kJudhcQh43N1MH7FMd0kotbhzdsWz/I/2OexGDpPzSM=;
        b=ddjSXltlzLVkNQiFvsQNlL/s1iFKLPaD/AV0wXiji0fCi52ZUgY+HtYCNkS8JOCch9
         rknildvQ7+QR7R/C/hB9w6PiFvm3QWX1dfTABh7cYdOVM+7W4Xv9r47m33b0Gq8wBX2m
         HvXQtsDtNgtprzkb/fgD0xWSXSz+RiOA8donI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974421; x=1790579221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kJudhcQh43N1MH7FMd0kotbhzdsWz/I/2OexGDpPzSM=;
        b=uRMG8gk/2kvk0YNopqk0rVv4GYWRcmHlToGQ9ljXoB/cuz3x1jsxL4DkcncJ2pNmp4
         Fc0bK6aHcA0B+ouZQ9Dmty8gSwHQ2E0XwFFN4Vs6TjcJ9LUi0Bbq1vJkBbCTgkSgRGg6
         RR8gHbY0iTZnxomFq2DGtqbMyoW9ViGBRKDmJHvsrS8NHcSV8V/Irgd9RuAk+gAoXJkj
         syax2jXMwjyBrH8amYhEK8F4FQGm8AfgEfmUiwz0Q61L2jE/tWdVThyt/ivZdLjdkYEf
         uZ8gTYvZNBRpyD+j6cchKrDGK55tX0c3NweYkzo0MB3trOu6HuLdA5ZfBwSRmWZpBbQc
         246A==
X-Gm-Message-State: AFuF++lqbJI1M8K88l+2AwWGyipqiwH35yta8I+b8/hnXhRljjAt3Mhu
	EaSbzFNuUEgmt2xs7rHw24oyiOmucWpqtA+cGt2DWMTMl9H3P3pPjRmi0C9CatmBk2vbRcr46bD
	ofyyEYoc=
X-Gm-Gg: AYBFou1xmPFuTvIr6N0zyqj0uXiK5ngdTnQZCLKEhO8DGbuerG/EpqlYs5Hw3WjGK08
	CJhb5HbH8hH2tOYi8sas4a5z+GvA9k6jnLHgK4yrtwkvWxeFIR/vuORaGlx9YiuKFKE/P2xbTPb
	sIf+W/x69lEgqMBu6FzIo8oTU4y4NI+hmwG20UryIF3xkWVCm+jvTg3AKuVtnMJcDBHZRaeujUK
	g7Q81xmfUdo/X6ZmfD1TEQbg0bFh5cfhNTspDJPiwxvGvi0WzCRRbksOulSShRvAjC9w1j+ei6N
	SSzrmRzTFMrCP0CpFkLqr2PcVtA3eOOJcLoe9mLmisuw0Aw5JN0jB1uGDjqQEShFwA6xMpHPEUB
	GikzxOTaL/J4u9vGkMgxGgzJPTH5sbb+u67GKeVYNYiKt6DXa9kt66qIlx7tb+pjSsJXQrAi33C
	2W1eAyA5yd4DnzTSp1hy3JhPPOzDNgRHVjqRvtdIQCe/jne56AhiUFc+h78xxsNSAoOeBQ0HS5m
	myhbaKhNhMPAweApfDSQF1mNUU=
X-Received: by 2002:a05:600c:354e:b0:49e:65ac:eb5f with SMTP id 5b1f17b1804b1-49fc5726c2cmr181221185e9.10.1789974421400;
        Mon, 21 Sep 2026 00:07:01 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:481d:998f:15fb:95da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm276492915e9.3.2026.09.21.00.07.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:07:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/20] python3-dtschema: upgrade 2026.6 -> 2026.9
Date: Mon, 21 Sep 2026 08:06:39 +0100
Message-ID: <20260921070656.521680-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
References: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 07:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246290

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-dtschema_2026.6.bb => python3-dtschema_2026.9.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2026.6.bb => python3-dtschema_2026.9.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2026.6.bb b/meta/recipes-devtools/python/python3-dtschema_2026.9.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-dtschema_2026.6.bb
rename to meta/recipes-devtools/python/python3-dtschema_2026.9.bb
index bb9ced182c1..1ab2d4ce3d0 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2026.6.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2026.9.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=457495c8fa03540db4a576bf7869e811"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "05188e3727393334b99abb74ae220ccb8158eec67d6bec793326253f9e76d57a"
+SRC_URI[sha256sum] = "d50aa00414f09b7aadc776afabe623915b8f94e59d6eddef80920d6505cba671"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\

