Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF41C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 06:42:23 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25498.1785134534014690312
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 23:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dqtPTYek;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954dff6536so17487355e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 23:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785134532; x=1785739332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GEd8A5B0TKNEGb0uTIqMok0QdzHh7kGWpkvsHOF0F+w=;
        b=dqtPTYekxFMu8NN49Bf5F/tR+k8bjfWckFdpktgUUPMdsW6wEsu9i2Jrnoy7LIqt+7
         jK9nBm1cexeQ/GcWT27RE+kbOgBBGXAxj6ytZlxdAdhxRfMwYmTEObkg3Efi73GB3C35
         JFjbOjerY52gcEGA7gJMNeD/Jm2Whs9fI8UfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785134532; x=1785739332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GEd8A5B0TKNEGb0uTIqMok0QdzHh7kGWpkvsHOF0F+w=;
        b=oy68kLjYZM8EInYLPTDBSy0zqaU7oa779FxEcORfth3qafe7ZHXUiWPA7ClKldjxT0
         M0IOQjBm85EpMht32svkTD7p7Gh/052rEFlcED9aU9S0sZai20Jv5gj/PvjlXm6JkLXl
         EWwa6dPyaAKMR3TSntpxDNwXrJFApQhCu2VLlbS/bnMUiRSa1KpqhZWksz6nlvJeYxPx
         L5bsl6/70NKFjfxsYoBDwawfrDnwsPyv0mPYn7ZDyxNVyBbNxgdlgDAK413ub8MKwpt6
         jQKTGIzFsCzna4r9fj6ZDl2SiquzPfuVNBVNFd4elSx1lpwyjr+VhBcz3LCsh66Y4H2o
         qnAQ==
X-Gm-Message-State: AOJu0Yz/+6R1qORicAcKsnqxnCwftFJrpQB7STiMbSOHDhV/fy3Vx0hs
	WZRim1GfFL/UAxfzSaQUzJcm81HY5PdRYJsJF+zeTfRjDqTCWNx2FG6OV4R462DuphNl9Hg4A4H
	APxIYQb4=
X-Gm-Gg: AR+sD12sFMg6wxKPDrOBP9lH5YLBlznlBHyko3D6DwAUV90uOB5tIJ6wwXpV8GWI+IW
	3qVqIbCJI6Wpa/6sO/65U3fnpNKi0u9DvxxVjirt0xRrVi8m2G7QTeTA0aEE3cZ6mNUYcQIit6t
	WjPI0pprwvzCOeWodZOhP3liOFddN+bw4P0tyodnf1Uk/Q3GzcABB4nnmtLeNf/hTha5OQwbCRF
	TTRR6iI7xJejQGRQiQAGD8VA59+TcqjiKmM0zel8zWQCS+OZAKwEZyWWOYkngJyqmHvwYefkVWN
	Is0FGD6OqoUu+b+sUinahEhP9LVLoZc4NZu8iM+i2UX6UMPXAgNTAF5xk/0OSLDxYS3m46RRPWY
	ub+22qIJT6hf2gj+kqLiO/UJW6iQRl6dnbIZifT5XdYeLv/G5G42ujLTlMqlCICoo5QCo/2pI7Y
	4a1DCEpTgx+GMkkAC6PSHByloFhTzHAg==
X-Received: by 2002:a05:600c:3113:b0:496:b39f:1a03 with SMTP id 5b1f17b1804b1-496b56e6dc9mr85964005e9.5.1785134531746;
        Sun, 26 Jul 2026 23:42:11 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3a01:52d:1da2:a363])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4866813sm229103255e9.8.2026.07.26.23.42.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 23:42:10 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/10] python3-setuptools-scm: upgrade 10.2.0 -> 10.2.1
Date: Mon, 27 Jul 2026 07:41:58 +0100
Message-ID: <20260727064158.3784068-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727064158.3784068-1-richard.purdie@linuxfoundation.org>
References: <20260727064158.3784068-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 06:42:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242047

- Omit ``scm_version.json`` and ``scm_file_list.json`` from wheel ``.dist-info``
  while still including them in sdists for fallback discovery. ([#1473](https://github.com/pypa/setuptools-scm/issues/1473))

- Pass `project_root` from egg_info to the workdir so file discovery is correctly scoped in monorepo setups. ([#1440](https://github.com/pypa/setuptools-scm/issues/1440))

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...etuptools-scm_10.2.0.bb => python3-setuptools-scm_10.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_10.2.0.bb => python3-setuptools-scm_10.2.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb b/meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb
index d3ff181ad6b..608c0ba47f3 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb
@@ -6,7 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "ec8ea1738b92e42146a46e29a0e9de9ad462744c63cf9778677b95dfd605adde"
+SRC_URI[sha256sum] = "4fa7dd82cf8c800df59c9a288c90299b1657ff1ecfc3f5cc00287c5dbf5e27a9"
 
 PYPI_PACKAGE = "setuptools_scm"
 

