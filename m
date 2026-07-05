Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B0DC44509
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:19 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139232.1783291392248485580
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3ThxaRPL;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso304894f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291390; x=1783896190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bgaSHv/HBhvEqIw31ssRpEeycDZ+7Bo3Bw8pAktJpw=;
        b=3ThxaRPLeKouCbKwwzuuGHHLITfgTFNpB65lzDaQ/9ay3VQzTaicvGHXgAK/JdUwmm
         dIv3pih3feZ0BPDYUEo0lw41yl2/mK3X1LijLoq8ykbDnIcQzBvPFffRXQELNwFZDM0c
         D8WII4Z/3t4g/XDto3O1h8lBjNVvks77TUp6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291390; x=1783896190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+bgaSHv/HBhvEqIw31ssRpEeycDZ+7Bo3Bw8pAktJpw=;
        b=ha3Q1mmcDPhJfT2OFTg0q+i++DQd6gGwED1jbt7xaCc79Y1XU4fmUp7d3rggMU/9Kj
         1LUi0hOPzqdZLq8VaL6G2EuFZZbXadq2XrDQjpPidmtJLDqE7zJBEZhiIaguJ/g/kc8/
         dwU+PwaT3aAHy8a2OoYfhomKF3lmGh7B+cdIaZNf8FXVo4DHBEcG6rALEw7RZAG0Wgx0
         6kjYV6FxbwkjPYjgrZR2cCa4Nsn1J8XNsFIvfIz2rL5fpqtg/Jeupe9v183v6KWHZlTA
         6GoyIhCgPhsEeR/A2H73MV2nROWpKNYjyn6u9mhNIA+m6KWaRchIqtLYptdY9CFgJ3+y
         8+Lg==
X-Gm-Message-State: AOJu0YyYRG1rzDdj3z7CE1Vq6es2gd9pGshp7RveH85Dhq1/GvboRuy2
	AWn/HO55O3+vVgCJLe810y1T6tUFpcvofQ1lymguV+WOj9RI00bReSbZ7Lj1IXhFT090njDw1d0
	vYbQLnlo=
X-Gm-Gg: AfdE7cmvJzqqXidJV6WvxLjXtD2bn5IwyQfyGLwzlhL/ZIuBmx/bIKw+Q9FzErrLxas
	IMW/9NFkQn0om68nMgyO9mvdGICw/a0OZYdaiNevhkSK2Zb7MlOcMF0fzT1S2wowFMrHEfeD9qK
	xiSB5lPVW1jPdOGdQfnrZOmXj9NaK7jxBPq2uDasMn0HHvOmmbrpHQCF1d4oT7eLjltF1FoUEPe
	IDJYy8temRTWfTB7+QEG5NpCMXrOsXBxltFYKmUc5MCfvPWmFyiSyNh+R1lwhnjhvQWqC4liPyP
	Y/P3277YoPPcQtYWbgBxe7+og8f8nnYnKReKU28usfck2pHhXVxd6VTH0IzUPcZBAVJ38GxFYQF
	v9Pw6qDVDsouoH6H4EMzjblGZjSJDcmJnw2Z+IB4ao4gJWv+w0+FKo7lHprNEOQc8sgwFrL9IEj
	AbXaZt3mAAZ4zoCBVzGrQbztMzYQ==
X-Received: by 2002:a05:6000:24c9:b0:475:f0f0:9ef6 with SMTP id ffacd0b85a97d-47aaee4cfd0mr9734793f8f.59.1783291390407;
        Sun, 05 Jul 2026 15:43:10 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 46/55] libjitterentropy: fix license statement
Date: Mon,  6 Jul 2026 00:41:36 +0200
Message-ID: <e24344475fbe002ffb7cdaf99b216021f5bc1c00.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240200

From: Ross Burton <ross.burton@arm.com>

LICENSE clearly states the alternative to BSD is GPL-2.0-only:

  ALTERNATIVELY, this product may be distributed under the terms of the
  GNU General Public License, in which case the provisions of the GPL2
  are required INSTEAD OF the above restrictions.

Use GPL-2.0-only, and reorder to match.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0ce53ab57a6c0fd48759f5a8def5467cbcb0c729)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
index 7890dfa5c70..36721d201c4 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
@@ -4,7 +4,7 @@ It does not depend on any system resource other than a high-resolution time \
 stamp. It is a small-scale, yet fast entropy source that is viable in almost \
 all environments and on a lot of CPU architectures."
 HOMEPAGE = "http://www.chronox.de/jent.html"
-LICENSE = "GPL-2.0-or-later | BSD-3-Clause"
+LICENSE = "BSD-3-Clause | GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e01027c4ad1fe5a4768f8488c945d491 \
                     file://LICENSE.gplv2;md5=eb723b61539feef013de476e68b5c50a \
                     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
@@ -23,4 +23,3 @@ do_install () {
                        LIBDIR="${baselib}" \
                        INSTALL_STRIP="install"
 }
-

