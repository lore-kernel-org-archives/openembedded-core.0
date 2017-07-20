Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id A0533782C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 11:57:09 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id a62so14928220itd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 04:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=AIWSadYCNUxlgBUucw7heeHmyVW78I82y/A00NdrZLw=;
	b=PmShV0y7vrjdjlWZJ8Uq00eBeF5iLqitFcTCjpYN8aqBuabyrPbDNPw6WiUhM1bXTs
	dGwWWC7eKZCaoNoZ1k2l7QcJeExNnJW5U151XwMyQvOdWHVv/8UMpWiHqX5DHSIq2gAY
	hKouj6o5gAx6qXUAfzF/jJCdUA8D7H+QpVQHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AIWSadYCNUxlgBUucw7heeHmyVW78I82y/A00NdrZLw=;
	b=ddbmJDsibHwzfYbMGoEgNyNZKycAECgfoCoHR3/SkG/K1RnHl3ONeNUcW4AeHATOYp
	9aY0ZzM9feL6BYj1ZltvA4QGKOJKD1d6efAfw8gdtMTy0ip4pSi+nxQK/hcv1L3Q8lte
	AYOw+IHzqZRgd9j6Ha4ZLfSrl8GW8phsRS6A68/HniFjllKV890vzFflkYvaqCdGlIyS
	o7syfjFM2gbOwLKfGMj1FdavErrLktpyULsDLJ4EOFtaiMSJo3f7VPW/rErMNwiXANXJ
	FSNveviz4cAqFwFCg2ZXEfdW+G0sQ8XPLQnQkvAVjNAYNKGnGLk+2SJTnCp0n9WlBp5S
	4GKw==
X-Gm-Message-State: AIVw113tTPm+bPeZzUULMVKIpzEm2Yv2tgZ4CVTWZgY+mLsyTurp+Fu2
	bcq2utTCf++8+8gyQdLUrQ==
X-Received: by 10.36.112.12 with SMTP id f12mr1763851itc.8.1500551830386;
	Thu, 20 Jul 2017 04:57:10 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	o11sm1120177iod.61.2017.07.20.04.57.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Jul 2017 04:57:09 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 13:56:57 +0200
Message-Id: <20170720115657.11406-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] ffmpeg: fix pkg-config utilization
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Jul 2017 11:57:09 -0000

in config.log we can see:
WARNING: aarch64-linaro-linux-pkg-config not found, library detection may fail.

ffmpeg configure script is not looking for pkg-config at the rigt place since it
is assuming cross compilation. let's force its value in the recipe.

This patches 'fixes' library detection and brings the following diff:

* RDEPENDS: ++libxcb (>= 1.12) libxcb-shape (>= 1.12) libxcb-shm (>= 1.12) libxcb-xfixes (>= 1.12)
* PKGSIZE : 79167 -> 87823

Which basically means that the following conf options were left dangling in EXTRA_OECONF:

--enable-libxcb
--enable-libxcb-shm
--enable-libxcb-xfixes
--enable-libxcb-shape

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb
index f4bb2ba1f5..442d4f4532 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb
@@ -107,6 +107,7 @@ EXTRA_OECONF = " \
     --datadir=${datadir}/ffmpeg \
     ${@bb.utils.contains('AVAILTUNES', 'mips32r2', '', '--disable-mipsdsp --disable-mipsdspr2', d)} \
     --cpu=${@cpu(d)} \
+    --pkg-config=pkg-config \
 "
 
 EXTRA_OECONF_append_linux-gnux32 = " --disable-asm"
-- 
2.11.0


