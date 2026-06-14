Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 629BACD98D6
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:32 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105065.1781424264613280260
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BRAcsIXE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso9923725e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424263; x=1782029063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eQp3AqghP7cq2J9p2niKhPux5bZppklnq8Ch7TdR2jI=;
        b=BRAcsIXED8877KxVj9j3ergUYjw0OKNHZXRFrEdxXpMjHydlKqMqB91V9ysnIsZdpG
         haGUhoGYndMz1EvAxraprH1OOtPjSwPSAexi5gLoucOnP8Z49aeQciNirHnaph8JvB9P
         N2Y+sHWww8suenRlR4TciWkmKF5AkkAwIDh0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424263; x=1782029063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eQp3AqghP7cq2J9p2niKhPux5bZppklnq8Ch7TdR2jI=;
        b=YS2hOiChVhcrIPPQkC+K17m9n7MdPCSQLB8gntkpcx2ZEAQBq3TwwkXKB39g2tlFCn
         SuYm4/UJVZoYEjM78+DrT2SRHHnOCHj2WT3f2u3L3K6Eryvj+kBAbV2pM4eEh7g5fgbD
         QExg+6sHXxK8JL2nIpHygQvAM3WRTHvLuEZ8C0/jAwL1h1zBbxs2SDAc0HF+sQNoettq
         k4LHHRfiHjQie5oOroKbsAMMfvgOgBDUDvVdV7Jf5Z9Z+uH2JDPcZfBLa9cmVTAJRt9L
         uG4SrQueHQ3nLmaQF23Z1O3E0i1CD+vXq0ZF3yRHtSKCQzQ5ZUFdVfx0g4zvC9OuVpAq
         yPAw==
X-Gm-Message-State: AOJu0YxQaEeZCMUvlWR20ETXM+vNAEKZ1fGySjAH4UJut5nCK8z1ky0H
	H36ID6zBdqP+fXzri/9WnFwDg9ccZg9Z3DB+I+6NCNVFlavq+McPHj+P5GeAlGqvXXuQmAU3mxD
	8EYQs
X-Gm-Gg: Acq92OErChhWAL6SEOB+A+MexxVTJ9+uwdWc3ujxa0wcbqKaZxlbND9HNdiIl6BfU7t
	XK/ZKFfCBiQQbsJKpWvgEK1+0jqcnm2HNRIdFscl9hET3LirEo7XAgK5KhsIOzG32KylLQtCiYH
	5kQ83ECa0Ul/bm4G8JDTmtlXq76pJo1Hun3ardYO+OpwlP25oZhII50DLBxIG3n/6nQWiGzTCcj
	YDM5PiYpOadEgPxyxmtRZeK+ygd99kZ3y7lHzv9sdgqYWNTMvj+mxAThyD9gAmDqo3EKunZhm6D
	Y1eK+P/peEJX9ezGP7/Z2h6zAzVxcmrfSCzq8LJ+scv2QkONbo6RitWMd3mGz2YO4oolvUzbmBk
	LyaHUm8/hNoVlAa6k4S9TpEuXQyGYQzgy55wIRNCIAd90gYN0dIZ4gqcS3iqmUepM5RZjLSBHm7
	7mqW6yuk8yisTh/rehPXrkI/k4nhaBJ7iJ8I0KV6KUPBn9Wp69xD6V
X-Received: by 2002:a05:600c:1912:b0:490:bbc1:c9be with SMTP id 5b1f17b1804b1-490ec30f6aamr91020225e9.0.1781424262843;
        Sun, 14 Jun 2026 01:04:22 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.04.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:04:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 48/56] taglib: upgrade 2.2.1 -> 2.3
Date: Sun, 14 Jun 2026 09:02:59 +0100
Message-ID: <20260614080307.4017177-48-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238732

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/taglib/{taglib_2.2.1.bb => taglib_2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/taglib/{taglib_2.2.1.bb => taglib_2.3.bb} (95%)

diff --git a/meta/recipes-support/taglib/taglib_2.2.1.bb b/meta/recipes-support/taglib/taglib_2.3.bb
similarity index 95%
rename from meta/recipes-support/taglib/taglib_2.2.1.bb
rename to meta/recipes-support/taglib/taglib_2.3.bb
index 9f5dbfe9cb8..b29f28702db 100644
--- a/meta/recipes-support/taglib/taglib_2.2.1.bb
+++ b/meta/recipes-support/taglib/taglib_2.3.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib utfcpp"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "7e76b5299dcef427c486bffe455098470c8da91cf3ccb9ea804893df57389b5e"
+SRC_URI[sha256sum] = "7349f6fd942418bc7009ebe743eb7c9d055f02921ec56fa436ec25007c47fd38"
 
 UPSTREAM_CHECK_URI = "https://taglib.org/"
 UPSTREAM_CHECK_REGEX = "taglib-(?P<pver>\d+(\.\d+)+)\.tar"

