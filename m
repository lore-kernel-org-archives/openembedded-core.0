Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9EAC61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:32 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3065.1787945912382848157
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VuWCplly;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4957eefd361so10880505e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945911; x=1788550711; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sefpXt+S7ViydVRCtj0PHqB3TvImNRhTuM+f2FPQtp0=;
        b=VuWCpllyWyAfsSxCSab0UViZEg+HVdCBBiuOxgUFdd9gbGodPmugxmai8v2JYuGf24
         r9DQUUdN58HddPDHjvGI6RP+DA04AIxNJtboDKdv9NnuTmWUr7VP3r3wly5KaZSVtO26
         4WIgvGzN9wWICYtR5W9sei2/f9o9ErvftC+ZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945911; x=1788550711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sefpXt+S7ViydVRCtj0PHqB3TvImNRhTuM+f2FPQtp0=;
        b=WLwD6/ZZdCeBOBAdvQIuFRCl0AOQf1gbNe4du1fGqv53GjAGv2T51QdsQM1AOjKGfG
         LGbhs1tYdN6WtwUKED4O/ooFHn/jCJGi/bdXJNzzyG5VFVqTnx4Z/YjWtd5NOiDcQu8J
         pilUHaBIXu7VXYkojY0NG0VpwO13nGBAaisOB5hX82E/eTKgY4Kwnjp+BrHAwuYlQvn4
         fnQwWL139f3zbHe+F0DvjWM3qsGBUlHkURIeFvgGu68jFMrrwLeJslkaumsaLtCZUIr6
         4UqS0KCaqo7vByP5KBVUf7Zxai+OS6mmXCUfgDKyqTyS5mO+NC3xgqj1n5v6GqRIHm5/
         g60Q==
X-Gm-Message-State: AFuF++lnvyZGqGeZb/9xsu3tFTrvddvxrmYLQrnwZRX7jjwkb4U8hsPT
	MFRopaXeJep7E7UhxgXfjYjQO332SC7mmGkuOZPrYdj+/DGpp5UDCknngOomUaW08URkysirSxt
	WQ89HQ+A=
X-Gm-Gg: AR+sD13yNOKAWacBt+6r50vT8iKmIjrmZsdUoORbE73kV1kscnFZ9Ruv0tXmWGNRwuK
	U22oYrUM53Ty9jL4VnScPC5OW5E5ohasLRl7VUzRbnqGnPBEO6I2wYfbKlYE2/ItnlzPWE1LCjs
	Y51cAWOcIxzW64+Qy0Gdxwwyn7latA9hp+/Dn7d7CVWn1ZqQokPZMPcArUxL11v5tcuSxvAAmbq
	EmpM5H7FQdUJ/6jDim+N05oqTBRfpVe8kI0t4ZmydIA28JmqJOaS+nLaAXI1D6YaPQxUdD58o92
	N3/5GS/LwHowoPlri85UqtIS3uV4bjieP7i8V8ZKoxd3uMeOa0Mfb9e4G3sV3T2Y87AdnsFUugs
	EM4mHAYKAO9L82LMGErpoqJP3ieUKOLYiCzXzKE4KVpiH3jJuHP+349/bl9CQ6BftUH+rN9HcB8
	36ENzQ8yIPuNjiltcy5y+XFR7AV9Rtr6ijVLVsD/uF1YiVfsQ7asoc/1iEjS04+rlByfllrnlll
	fbgOtrZurtjvbCZiHFFE5pxX1IHk9scibGV3mnCzriIH/ZHXFlJWjRxrLW0Idbo
X-Received: by 2002:a05:600d:8449:b0:49b:96a0:5c00 with SMTP id 5b1f17b1804b1-49b96a05caemr98946545e9.13.1787945910557;
        Fri, 28 Aug 2026 12:38:30 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 46/56] python3-cryptography(-vectors): upgrade 46.0.5 -> 46.0.7
Date: Fri, 28 Aug 2026 21:35:56 +0200
Message-ID: <d28e6109b9e3ac4721d8b406bcf5dc15c3f7d3f1.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244607

From: Peter Marko <peter.marko@siemens.com>

Both releases consists of single commit on [1]
Changelog [2]:

* 46.0.7 - 2026-01-27
  * SECURITY ISSUE: Fixed an issue where non-contiguous buffers could
    be passed to APIs that accept Python buffers, which could lead to
    buffer overflow. CVE-2026-39892
  * Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL
    3.5.6.
* 46.0.6 - 2026-03-25
  * SECURITY ISSUE: Fixed a bug where name constraints were not applied
    to peer names during verification when the leaf certificate contains
    a wildcard DNS SAN. Ordinary X.509 topologies are not affected by
    this bug, including those used by the Web PKI. Credit to Oleh Konko
    (1seal) for reporting the issue. CVE-2026-34073

[1] https://github.com/pyca/cryptography/commits/46.0.x/
[2] https://github.com/pyca/cryptography/blob/46.0.7/CHANGELOG.rst

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-cryptography-common.inc | 2 +-
 meta/recipes-devtools/python/python3-cryptography-vectors.bb | 2 +-
 meta/recipes-devtools/python/python3-cryptography.bb         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 4e4434bd669..0515cf77058 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "46.0.5"
+PV = "46.0.7"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 800bf1b0e0d..9047e690ea7 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -12,7 +12,7 @@ require python3-cryptography-common.inc
 SRC_URI += "file://0001-pyproject.toml-bump-uv_build-version-requirement.patch \
             file://0001-bump-uv_build-to-0.10.0-14271.patch \
 "
-SRC_URI[sha256sum] = "ffbccee9455201c01b37c63d65d9f83b362d40c2bed9caac248ebbdfa4e4fc7c"
+SRC_URI[sha256sum] = "08f3d13846fdd86d4c1138a88c695cee203b3dd3825c784d64a3b06d000cdda1"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 42e8c5ff19c..7f9bde15d03 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "abace499247268e3757271b2f1e244b36b06f8515cf27c4d49468fc9eb16e93d"
+SRC_URI[sha256sum] = "e4cfd68c5f3e0bfdad0d38e023239b96a2fe84146481852dffbcca442c245aa5"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \

