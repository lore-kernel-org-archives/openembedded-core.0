Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CDB0C5DF72
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 15:22:34 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21791.1786634553218863325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 08:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RKQJhGoD;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-471eeac43bfso745758f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 08:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1786634551; x=1787239351; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qa9sWjyMw7CMGDiE8hKMOjIZ7QQoMrbpb5S2oA4dS9U=;
        b=RKQJhGoDLMIWr0x+hyGDKR2Nl/6s9aoX7fPIRs7OydgRnqxr58tzdcyN1s6SQMxaVz
         fJIB+JJGQKkOE+9jTjL+PCEIe0cbyyx6QsCjK9ehxkCDz0ZdioyjxH7Cq7wh6qk8scku
         6Robbr5nFGhNuxKE1hBYf6bJ5YbVznr7EhSq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786634551; x=1787239351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Qa9sWjyMw7CMGDiE8hKMOjIZ7QQoMrbpb5S2oA4dS9U=;
        b=dnjkz6oQx+5x6fTUQVngM4kJRA8ofqekwI9+1i4TIjn9Usk8Cgxp3dg3dKU090Swj3
         vU8ABcA+mDTQpXtU0V1RR0GqFnoPQi8WNg2lzj2rj9TybMjwGqrKxs98MQzz9Jffvk7O
         uffjvEbBovz6ICx20iWaIAoHn6bAkASJL0X+7cMyjxChxAdLiubA/FADG48QMgzzo9Kf
         safovPxqEV/T62hRcOyfMqyc4/KLre7uv/b9xcr2H3z4XA/XJiqRrRzdF9UQ6H1dFToC
         OyF2OkIlTjoTyEvLEvt7q/rMFwrJ7Y9tQPeRs7ySKFVwOW+0dbYOyIM3CQob8gTHqUrF
         Y/yw==
X-Gm-Message-State: AOJu0YyKvhn+hg4t6wvIXE4wqRUkWXBgTlQVuD5PcxSbfFPFIuWT6xot
	pv6hALcuJpKBynou0ZNMjaIMcTtfTpGcRkKtFqcueBzJryMGefHyI37O/dXIRwGvPiXih1I8X/o
	YiP6nbn18PA==
X-Gm-Gg: AR+sD10gBGW/1DI0fU7WqTNXpSa2ZCalKf3WWfE9ko2X3d9LmJOYRJ6RqR4vErn85ru
	9RyKNEcO6wyK72bE0A6/IapAaJSUo6jI3RpWtBFdvyevk6YCnh3jXT4zMppEFrVZmwvgJDO0iZN
	xtkCzPqiEyFnMkxtlQNshq03BnJV7hG6j9yiIzDIXrxpIM98AfPiidfIxSmvVLaIy9nWCazL3b/
	qyS/3EwZxzTSF4CWqr9VaZTq3Lj1iiHXbOVxzFA0TCIK3sIsKtf8HljHHr9EJjl8JuYpououyZ+
	P4JC60NiRRRSxdFeBIEkBejAm8HmgR/8DAXJOlkgmBBe1zcTLO5gTlt1DzvTZiFqlxYRXO9Aukz
	VrVEv5unz5Vf9Iwa8cUmvjPM1vS/pLsNfjQHo3Pi3saf8lpOkTZ7zfgN/iGFi2Gv1ne/ZKzUD7M
	EhPHkpDnU9N1HzAxMTbh/ty22SJQ7QNn/9Uh4Gnde8WkH4qxXtVIF4gWeqPz2DFQNxpZiDkDlsG
	s/JiDGxswgRHsyzgakBinxbNUvFsUmF5HtNx7Sn0yEFj6lk2fVkYnsGTC+2bib7MtRH8GtcTOW9
	M09Q0Qxls1lLqIa4VLhiIbt4t57B/ie5QkaRZKRq
X-Received: by 2002:a05:6000:1a85:b0:481:57d6:c0f6 with SMTP id ffacd0b85a97d-48159fe4ec8mr9844720f8f.12.1786634551442;
        Thu, 13 Aug 2026 08:22:31 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a068sm110450f8f.12.2026.08.13.08.22.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:22:31 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 11/17] gstreamer1.0: set status for CVE-2026-5056
Date: Thu, 13 Aug 2026 17:22:01 +0200
Message-ID: <6a77d34c65fe362269a8f4179685f121208230c5.1786633048.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1786633048.git.fabien.thomas@smile.fr>
References: <cover.1786633048.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 15:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243368

From: Peter Marko <peter.marko@siemens.com>

Per [1] this is fixed in 1.28.2.
cvelistV5 has just hash in version so creates false positive.

[1] https://security-tracker.debian.org/tracker/CVE-2026-5056

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb
index b727783746..4e51418c98 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb
@@ -71,4 +71,6 @@ RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-iso8859-5"
 
 CVE_PRODUCT = "gstreamer"
 
+CVE_STATUS[CVE-2026-5056] = "cpe-stable-backport: Fixed since 1.28.2"
+
 PTEST_BUILD_HOST_FILES = ""

