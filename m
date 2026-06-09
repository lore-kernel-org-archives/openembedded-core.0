Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E8BCD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:46:12 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74149.1780991168803510648
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 00:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ue61NKoa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso40229385e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 00:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780991167; x=1781595967; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4WtnMWqI7A8rmCaEY1QDyhF2uqmh3fgf8znIn7mQhhE=;
        b=Ue61NKoaq6D6MWu1asSxzd+bTZHybdFa/Ly0PTXLfd5Sc0E2hpNtvaGj6JC4uxL+fI
         Qy9eqteV7T9CKFvFISJh2ghNLyhq76kVlM4EDLuvJ3OxU3bie1Gp3Cw5DnSMAWkUnAXz
         xLPtn0Il9ceVv6+eU/3z+pA3MPz+T+iyJH44o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780991167; x=1781595967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4WtnMWqI7A8rmCaEY1QDyhF2uqmh3fgf8znIn7mQhhE=;
        b=SQZMC0Nn+VZp4aCrszOJKsspa4bxm1+nq4X3QySq9nqghLeQzmGbQxJmbpa3yt1TUA
         mRb3b5EQO3f2W04LL17O4xGhJaJR2k32bglHSesZm+SOdUlHQNFvZPN4Gy1g4Ntdn2Wm
         t9nBHbnKXiYM2MrZZ8VnmkLG5e6QqwcVZxIqRnhiq03mLTsT55+wLhw6KwlCD33BECDE
         ZNh0BzLmtls4mK9m6/7gaFVaqRV+rcc78Ya5j6yRHJXIY+MV2LD76V0JK1st6/C7l/HP
         n9lu8AeWUJXV9N8ffg1BUDaiL7zX4/Z/p+QaOpWNdrHc4ST8HfWAFkIPufSiyy0kRZLM
         /apQ==
X-Gm-Message-State: AOJu0YwYKltMsE9TLYMMhjYyXgc01+oRnGv+Ie2AanZ+8JDAY+ER0IGr
	dIdBDjVEw0hdq2qiprsWJA9/HT2AewF1VkO2B/zvAXELuAp3LrKESyRtXU16oVGjmrla5uzsQsi
	Y+N9r
X-Gm-Gg: Acq92OHda3kfjnwwlmXamJ57l+id7jqxGQ/4YeWh2R4DwxO0S2kdcGXN4rMi3yhRUZf
	UNVqY9akMLx+qOOIjy84oFvYpGd5zj7d7msXuCPW8gp8MiE+/q2F5dmvMUjuBCm31fzAPzKk0uJ
	QmZghpDVTMWPJsOvI0MPKmwdlV6QuXo7Wlwtfn7WBtYefAem/dwgkEfMLl5Jvko3VvQ8V5Z5xU7
	w/hrnHxQLx1umfqWSNwHz/bYbOfQkRanrf4qTgw3gvhys3o2KkAV4nzpTwkTY/mjBTyKxvIHaB6
	3EnvldyrFwqjVJeXwam3tCkQyGM7V3gbBCOwXihoivcSyA/TPf/MBPrD4kPfR8nP9tIOmNCxvfg
	8V3WYe2ueykMdDU7qKwvUqh/Y3oGZIeEzBG66oA73TwizdAizWFF1pzv/a749kZ0o6c1hfyIRvY
	3dv6u6zHP+HrilC6Pys9uZnZIaq2XNA/kSMrJIXPXWE2xbGgJxz/AQhYMTy+yHzfI=
X-Received: by 2002:a05:600c:358b:b0:490:b591:b5a1 with SMTP id 5b1f17b1804b1-490c25da474mr335413165e9.32.1780991167239;
        Tue, 09 Jun 2026 00:46:07 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1942:aa0f:4850:4ec1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2cbb4cbsm254006975e9.0.2026.06.09.00.46.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:46:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] oe/utils: Drop any_distro_features
Date: Tue,  9 Jun 2026 08:46:03 +0100
Message-ID: <20260609074603.1429006-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609074603.1429006-1-richard.purdie@linuxfoundation.org>
References: <20260609074603.1429006-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 07:46:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238272

It is just as easy to use bb.utils.contains_any("DISTRO_FEATURES", "x y", ...)
and this function is just a wrapper. It isn't used anywhere in core.

The contains_any function is better optimised in bitbake too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/utils.py | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 4e09a8b927f..18c48a145f0 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -170,27 +170,6 @@ def set_class_filter(var, features_var, filter_var, d):
             bb.warn("Unexpanded variable %s in %s is not recommended" % (issue, var))
     d.setVar(var, '${@oe.utils.class_filter_features("' + defaults + '", "' + features_var + '", "' + filter_var + '", d)}')
 
-def any_distro_features(d, features, truevalue="1", falsevalue=""):
-    """
-    Returns truevalue if at least *one* of the given features is set in DISTRO_FEATURES,
-    else falsevalue. The features can be given as single string or anything
-    that can be turned into a set.
-
-    This is a shorter, more flexible version of
-    bb.utils.contains_any("DISTRO_FEATURES", features, truevalue, falsevalue, d).
-
-    Without explicit true/false values it can be used directly where
-    Python expects a boolean:
-       if not oe.utils.any_distro_features(d, "foo bar"):
-           bb.fatal("foo, bar or both must be set in DISTRO_FEATURES")
-
-    With just a truevalue, it can be used to include files that are meant to be
-    used only when requested via DISTRO_FEATURES:
-       require ${@ oe.utils.any_distro_features(d, "foo bar", "foo-or-bar.inc")
-
-    """
-    return bb.utils.contains_any("DISTRO_FEATURES", features, truevalue, falsevalue, d)
-
 def parallel_make_value(pm):
     """
     Return the integer value for the number of parallel threads to use when

