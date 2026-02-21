Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A365C61DDD
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 08:42:45 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16640.1771663356110453240
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Feb 2026 00:42:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EBfB4jeY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso23806125e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 00:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771663354; x=1772268154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gulNSLd7tz4RsL+0pCGJO2iHz3AJ9qZms0woRFl+yi4=;
        b=EBfB4jeYaAj0lK4zKMVsJJxXV7VbeGe8YYQe0i/iMEjCj7/eyRAeqVCd6ggA5Y9Ouu
         IL/+/Rh1G0zOydgjrD5j35eziW49ooN5hcYyY9LGVNzUUIMEs44n5Hfu+f/y9HfKQhnJ
         LQRh/zdZTZrBYaovYC7XMhHZ8ddeMgsOcFrYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771663354; x=1772268154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gulNSLd7tz4RsL+0pCGJO2iHz3AJ9qZms0woRFl+yi4=;
        b=AT8Bm1KUCTbMwTBktHlIt1E0cF18J9D5tR5tY94WbA+f8KvhxRyhpurfczKvSqh9TM
         vBWl2mmh/h4DzzWBYIpqojb0MuiAViZ0tVkzMtijqXTiUZyK2Tb97bO2GAPWkfLuPL5t
         3KhaDknp6S6g2CqwIH6UHfew4/KIQg400GdqPTy7f2v7w2uTSvpc3/iUk9M9lvoJ5R16
         p19+ieAl/6RSin4G2PBHxJ/udAoWmqBVMx+IcpiX+/ThedqB/kzqsyf8WSPZpBolczzf
         fsUjZT8AD+u0AiGxhT9C/o+jTvn9/u4m7o1ZjMYXEEBF1qIgEXdQL0S46WDVBL7rTZCD
         sUGw==
X-Gm-Message-State: AOJu0YxasBu1C6tO9WWCJTHPRkcHKvXrbr7JPdFH+2Mpjs/Q86mbVLzG
	/mPGbQbOy/rmZoXtiOf6nUpk3iKfuuNXS7DyQ5dbRT8YCIw2nheKTac6mqiCeVSADSvNQil1bO0
	KNC3ozic=
X-Gm-Gg: AZuq6aLHDgOXX7eFKeId8M81B9Qw0jhUc9XfndbqiXxy4E1UXsJMN7LZSmSLam/pREj
	JibP97Zjlne1zYfMgzXIQ2ojyfs5JYNe76ziE9rYYykflHi1deFQctYFR6HihXRqd18hi1vy+Ft
	pm+JyDjbHxtWghvRnhqvZAys7Tk0kD0qLmAX88TV0eqD3Ma1pwrHMTViG9Te1ryo7Ex9EYs5/WF
	cFC7whNlOCSbtoOTIYJwB+jIl+7mCOY6SmBH8wn14RCGicV2eDPpIX9SWYDcIYKV1/fUkwhy/G7
	puNercgwSZ0gwGzVq/GMxEmDaXEuInnIVqIcEUq62gz5vZXBJ7K6DpISCdN1zLbdJxJyX7ITQ/X
	UtZFSnifXYLdyTtON0l76b93S4HspMrNKkNCclafVX9xS6Eu7pOK8D09ZOPVF1kCA+IN8H3s/9P
	QgMeT/Nx5ojUghG//wlIof/jDi7mkqoYse2M0cXPtTZp3pMkEEZpw=
X-Received: by 2002:a05:600c:8b16:b0:480:68ed:1e70 with SMTP id 5b1f17b1804b1-483a963de73mr50485555e9.35.1771663354044;
        Sat, 21 Feb 2026 00:42:34 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b64:9a04:85e4:d902])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3e0dsm205898295e9.1.2026.02.21.00.42.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 00:42:33 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] defaultsetup: Enable uninative by default
Date: Sat, 21 Feb 2026 08:42:27 +0000
Message-ID: <20260221084230.3219379-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260221084230.3219379-1-richard.purdie@linuxfoundation.org>
References: <20260221084230.3219379-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 08:42:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231610

uninative allows reuse of native sstate built on one distro on another. This change
enables it by default, as has been done by default in poky for a long time.

The reason for the change is that this makes the sstate CDN much more useful
to speed up builds if good network access is available. It also standardises
the builds to our usual testing configuration, removing one key difference
which new users sometimes run into.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/defaultsetup.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index 269c3ad3f7b..f4a2d004a36 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -6,10 +6,11 @@ require conf/distro/include/tcmode-${TCMODE}.inc
 require conf/distro/include/tclibc-${TCLIBC}.inc
 
 require conf/distro/include/uninative-flags.inc
+require conf/distro/include/yocto-uninative.inc
 
 USER_CLASSES ?= ""
 PACKAGE_CLASSES ?= "package_ipk"
-INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool create-spdx buildstats"
+INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool create-spdx buildstats uninative"
 INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO}"
 
 INIT_MANAGER ??= "systemd"

