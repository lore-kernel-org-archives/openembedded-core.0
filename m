Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C7CC35FFB
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:12:52 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.31728.1742141568292035598
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dxchQEFh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso6208695e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141566; x=1742746366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WAiZ8eQZsAnS04gvGLMPyC+m14jYQHGh1ixzIteG/Uk=;
        b=dxchQEFh0FsI2ebpy7gvAByvHfGyGPYEkPlEPL7x44G9xJMjmq4M3SvNE7yd1le0Jh
         wxTu4Daf/BA/0TX4bPSlXEAvF5rSppaMG1MH9mS3hvdDJE9zdc+xGkKQ5bW8bLIsTR6m
         tfYmK9EQO0A2cDJ9YUVnrZYicZloPqNsAPb2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141566; x=1742746366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAiZ8eQZsAnS04gvGLMPyC+m14jYQHGh1ixzIteG/Uk=;
        b=aTLRTCYf9kcexLITcJiiLkkdcekOHh6Uc1jR3vllyWTh9U9UVR5olEcmVuBay2QG+9
         k9hlUcOYyxPQYV7JOFWHkkHF+z+mIcw5A08eBZCxUkQGTqLMa+0TCMG67ZxyMzt9vdg0
         rE7iuSwXwNeK98pR8PRkzXywqjluMbEHi2Ker9ziGVJiebSWo/PzzuS9PpU7U3OIL4oT
         FYgeU6EUZsXdV3NJTdx0DSD5qRHimM5uqwMpaYAZzHYBOcOFFNvL9yKXtGBCJa1lSIBh
         SDyj7HLbXS3vHzJ6EgruQhKBmjd/If7Voxwbkm13Gn36x9Fd7fzEwNFGIMdpgqOALlEb
         iW5Q==
X-Gm-Message-State: AOJu0YzZnSdknAyJ8VF0BcjW9HccdzRiU8gLUzhZnnkjWD2kFn4fYxvy
	MlwU2Wo45lu8nMX9k7uod2bX4U7qdBrei5lAfEqGfbCrg+Qyr1VDp54UaA/rGHvhuHpsfT2Glab
	d
X-Gm-Gg: ASbGncsznQTw5MLtPKEMKzlZPZ7Lwj00yXXt1DwFe7SXBZDcFRwme+yNrp1csu43jJi
	nfixdTtAQjbkh5sDRg5zwxA3uo5tOEk3sG3b/QaouvETj5OhoiZAPafKydEjajcAkm3gTMGDvEG
	iS9xCeW3Wa0YEdNTlkXrCvJUj60MKe0RMvOGD3zIbxVCkxaLUiHm88ML88uaK7dvIRdpNtP0rNs
	yeNB0OoDDbYQn0IucgYhEUINs4oLQ2dy4ekXtbJJKFURc1KWAs6dz3XKDNAOmpaokL76vKQsEpP
	dhUAP64Cc3vg4pjrM4ohs1apAsgyI0mEZsx6pTvE8iD2KxnBV3GON4Vklz113mfdeutPD2Tgxw=
	=
X-Google-Smtp-Source: AGHT+IFbzwWUyjvc49rd0+5j40LAuPLcsbMAc9A3Jxv+v8oO8erk8I9DvdrfvN+/tOvQPjHNTAqiEg==
X-Received: by 2002:a05:600c:34c1:b0:43c:e9f7:d6a3 with SMTP id 5b1f17b1804b1-43d2017f5eamr98340975e9.13.1742141566067;
        Sun, 16 Mar 2025 09:12:46 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 24/43] python3-pyproject-metadata: upgrade 0.9.0 -> 0.9.1
Date: Sun, 16 Mar 2025 16:11:50 +0000
Message-ID: <20250316161209.3629986-24-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213027

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ct-metadata_0.9.0.bb => python3-pyproject-metadata_0.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyproject-metadata_0.9.0.bb => python3-pyproject-metadata_0.9.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pyproject-metadata_0.9.0.bb b/meta/recipes-devtools/python/python3-pyproject-metadata_0.9.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pyproject-metadata_0.9.0.bb
rename to meta/recipes-devtools/python/python3-pyproject-metadata_0.9.1.bb
index a73d4277b1e..4c58da3c075 100644
--- a/meta/recipes-devtools/python/python3-pyproject-metadata_0.9.0.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-metadata_0.9.1.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "8511c00a4cad96686af6a6b4143433298beb96105a9379afdc9b0328f4f260c9"
+SRC_URI[sha256sum] = "b8b2253dd1b7062b78cf949a115f02ba7fa4114aabe63fa10528e9e1a954a816"
 
 RDEPENDS:${PN} += " \
     python3-logging \

