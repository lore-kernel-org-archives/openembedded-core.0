Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F99C47BEB
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 08:09:32 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1454.1767773364221930745
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 00:09:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nEe1hvtJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso19132825e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 00:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767773362; x=1768378162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WdPepPcXhlJEvLdPmGaACpckngCTfQ/YxqWhyLQ78cI=;
        b=nEe1hvtJzOzkKVQmlS0IvgiKQhMHb3b4SsfzHVOap8xYtbVehVXnHz2DcjXLxVlJVR
         N7LnNA92Oe9qHEDwRQdRT0EIDnrCgFDiCgkqssTYrXoB4G8nvHalmBj+fkWx9+D1g8ND
         m5IrTYmvCbU+4ZsWLsEc4cqzvUV3Pov+iIgmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767773362; x=1768378162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WdPepPcXhlJEvLdPmGaACpckngCTfQ/YxqWhyLQ78cI=;
        b=eB4kzEx3w+Ku4zcs8dIHRXMbtXVpGx6PUAwKdZBvlT0JZ/z5fCtY9tI+ReQ9xZ+lCN
         fpp2k5F1AnabXBUcZDUGGPr9XIIyO8+IZeYy9wK3bA5L9fJytAOeaBsPRo+OtN3MRAnw
         Oe6OfQdFfBzpaNkYzUPDPdrH49JBrkphjlAPw4DJEBWmWbzStN/93/AtC5KnkW75mfU8
         TkhAzdWhxRX+LGQiOxSntjRrnGJ6AAlOGRUbVUnhPLSQd1LkVbHzfpfx8bOLGj+Yxvt5
         A7aDE7JR15l/K4PPM9XYK3+oxYcnNV7Q73IqFHuJRtxYbh2ODr3VUeotuY7v8eSGbm/c
         j/PQ==
X-Gm-Message-State: AOJu0YxcBYlPox/curmm95EG3mRc9njdU0wrvzA48pbRK/+TH7da7gTC
	2m+bcOHU+yiV2Q9VKfIp8gd8DXVRJ782gccLc6g/37arGXzv7X1fDklS4/TE4VW0RqXLrgTV50z
	0dc+L
X-Gm-Gg: AY/fxX68lfcut95ZkJXuQuVXRFIeksiIlUCTBUoMyCyJLW5Z09zr3fnOHvXuYygGJ/c
	XSYPVgI/W6B1aB/Rl7gHi4HawM5Z23a56KS/qujsMq0I1MHsawejI5hrzTexCWdNUbvxpdKOIQr
	nmS6eZXWN41CPqANyqJYuSOYagG50PCgpJq9CkS0Ue7yZX5ugmmIedLj7ECoIv0yZ3CSRW5X5mU
	+Kz0jqxRc4WwZa0vL+ExbiAIF8YXIIx3csaeQeE2NPhhYYItmjxTOzqUTi2kZRKLAQMubwXt/kZ
	76mqrOGsU2uA2AKVcLU1K6eCYJcWH+va+GNX1QvQAMTGZo5wAirRgd84UpN6KYq80NUNGsKlEt8
	a0x1MD2ZYhmXmvBVws6oAoKaHlErZW6OIujya/ViwF1YFUFpRfj0hdkewUzrnjlk7tFgzuzWUx+
	LInD1FNFUNlODCIXrNx5xnCXGY/6c5tE2pfL9xW4kHUecB9pRPAm2I0dIb7B4oNxof3SoVS7dgw
	HPewm20ocxR7p0=
X-Google-Smtp-Source: AGHT+IHcv7Tzu5rNc7gh+VDJgm5ktz/V9guVz68UyOCD9NZBfYSFVaBjpm3yuLr5my5KQE5FmNUd7A==
X-Received: by 2002:a05:600c:5298:b0:47d:6140:3284 with SMTP id 5b1f17b1804b1-47d84b40804mr13950835e9.37.1767773362452;
        Wed, 07 Jan 2026 00:09:22 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8715b5f7sm6093485e9.4.2026.01.07.00.09.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:09:21 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 02/11] sqlite3: mark CVE-2025-29087 as patched
Date: Wed,  7 Jan 2026 09:08:51 +0100
Message-ID: <1e2f28b83164f793459838edca8431dfe7b831d7.1767772757.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1767772757.git.yoann.congal@smile.fr>
References: <cover.1767772757.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 08:09:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228949

From: Peter Marko <peter.marko@siemens.com>

Description of CVE-2025-29087 and CVE-2025-3277 are very similar.
There is no link from NVD, but [1] and [2] from Debian mark these two
CVEs as duplicates with the same link for patch.

[1] https://security-tracker.debian.org/tracker/CVE-2025-29087
[2] https://security-tracker.debian.org/tracker/CVE-2025-3277

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/sqlite/files/CVE-2025-3277.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/sqlite/files/CVE-2025-3277.patch b/meta/recipes-support/sqlite/files/CVE-2025-3277.patch
index a3e28465f5..625cf29d3e 100644
--- a/meta/recipes-support/sqlite/files/CVE-2025-3277.patch
+++ b/meta/recipes-support/sqlite/files/CVE-2025-3277.patch
@@ -7,6 +7,7 @@ Subject: [PATCH] Add a typecast to avoid 32-bit integer overflow in the
 FossilOrigin-Name: 498e3f1cf57f164fbd8380e92bf91b9f26d6aa05d092fcd135d754abf1e5b1b5
 
 CVE: CVE-2025-3277
+CVE: CVE-2025-29087
 Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/f4fc2ee20311a0a5141726c71d318ab52001c974]
 
 Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>

