Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41322CD37B5
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:51 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8176.1778224363722245409
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CnbzM3G1;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so17462725e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224362; x=1778829162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/hMjosRW1ZOkGwfzK7iSbOU6yu+cqn9wiQ3TMQS3tTI=;
        b=CnbzM3G1mchm9CTvNH7bN8VzUv4gS39Ue9u+mbFUlbUwcf2MFN2E7umcqcv2ufIIw3
         B5/JF9rNtZDfeMh+/1d8zC+AmQF/hCHFhi0nnxLpQ//RXBQVxIA4TnY7ZsVKIp9cgqNu
         MBQjhpUN15vVudGtPqfdVJKfjk6yslxtbw5rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224362; x=1778829162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/hMjosRW1ZOkGwfzK7iSbOU6yu+cqn9wiQ3TMQS3tTI=;
        b=cP/KPlTTI4hJIvXhC711/wjN3wgpyhOZ9MgYLGwHn2pjYKWM8ZL3eocTZI6CvMCFlq
         P2N1GxEF8TWxh3InrAhh1FPB1u2DWg4ewadcLTQY58rKdM9kwn2sFuSMaMkewlMm3WCD
         M8nTh24Dnw4EhuhkE4nL9bPplHo7CPX6g6VmutAMH0E/TeuBxJDFScedLGgZrc+9VCxy
         icrgeP4nZiMy0Bu+3pGB28o3zhCAmKS1PWZF0j3zHehk+bdWhsVJ5czO9CW1L6hLljxv
         Q025IMstYTR/5r6Um1zlCt/7Bd6qy4kEGREfTLcakUEAo74Q5n36z9Rp2VnfRBF/I1IK
         Coow==
X-Gm-Message-State: AOJu0YzRIUcmciVmC+s0PCyyiyyWGb1DF9RC1mMS99n3WF949Q+Lnvcg
	ZfibDMKGi4kQU9CB5SLWmhy/6WuhycMLN32ZFG5Z9v5WT1BgfXLoO05Ub3IohatnRk7U96DUPwA
	XtQajWnQ=
X-Gm-Gg: AeBDies8WrUOs5kXlHliF6yIe+Df2n6daK8ok+aUkvwp/uSLwCkWJCIWeunCbWVugUT
	r9buS8gxF+pojAZMz5lMD2Dh54A4O2JkwYeVBbLZrMwuV1UD6loRahojPoT1pshVFk0CPeXFRas
	kIh9Ou9IuWXGwcoXISyRP/ydeUma8zVjNO5RJdqHkGvhjTP/LEUetpQfHHoU3/yZEgOJbWdCdht
	LdOEYjvJtdqIizjmEQyHsGU6Anywf70KUoC/FcIa1DPf6EwiNmyzLoHpyJRcTJdQBiwOiTOqSQs
	1H+ows0oCvCl+n/3grKrqiXgcPKVQdH/TIJsaAJMYO7AcwrjjJkQlqxrZl/JVOjFQFtyEGWv565
	uSjlKTnGbR8bF7nZf6BuzFtog5DbnFcDmeIAklJgyDybgj5ugkveE1gmfvDAIItViKHpKkY2Cp9
	9aGUnz9+OXdejuNVHjPf+vRG4Tn31N/93ndXI4mqzs6/ivewarBBxQYJ8VmZxL5p/ZcBdGabEae
	oBjB5Ww7FeJ0Kxsdkbu9OaCX3HmhiBis8K75Q==
X-Received: by 2002:a05:600c:638e:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-48e5e00c1b9mr94408685e9.14.1778224361766;
        Fri, 08 May 2026 00:12:41 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 41/52] coreutils: set CVE_PRODUCT
Date: Fri,  8 May 2026 09:11:34 +0200
Message-ID: <f788eeb1740d0f389a722f04ae7cabd5837a63fd.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236683

From: Peter Marko <peter.marko@siemens.com>

This removes rust uutils coreutils CVEs from reports.
Comparing sbom-cve-check shows that only
CVE-2026-35338..CVE-2026-35381 are removed and all of them contained
reference to uutils.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5c39687f62e5864ea783cbed497c2eb5387dcf96)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/coreutils/coreutils_9.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils_9.10.bb b/meta/recipes-core/coreutils/coreutils_9.10.bb
index 984c5b5292b..8109244f446 100644
--- a/meta/recipes-core/coreutils/coreutils_9.10.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.10.bb
@@ -19,6 +19,8 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            "
 SRC_URI[sha256sum] = "16535a9adf0b10037364e2d612aad3d9f4eca3a344949ced74d12faf4bd51d25"
 
+CVE_PRODUCT = "gnu:coreutils"
+
 # http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=v8.27-101-gf5d7c0842
 #
 CVE_STATUS[CVE-2016-2781] = "disputed: runcon is not really a sandbox command, use `runcon ... setsid ...` to avoid this particular issue."

