Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D35AEE6ADEF
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:47 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87821.1766434119093983174
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dki/tNZb;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b72b495aa81so716654866b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434117; x=1767038917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n801MkC5y+W6NP1oM/0OzneauRq9stwpkGUYodegyUQ=;
        b=Dki/tNZbHHe2xXhS/cFPdzKZjbr7pr7MPMEx3doYa6yTxxzj1BoivLiEslKXsG9mNq
         4b85nrtl3JX7rrKCYRXQ9VPEr/iVvER3AhYHggfD898KEEIj87NMsL8sIDCaWzavvyBa
         ZE3sRDmyHFOV+LYn/cO9FGg7e0f0DaSPDjFeVcTzQ24yJO00QSeIudKUBkA9eziWgh1s
         DjEzwROzji9NwGLtJ9EDqT4pYPUnA7GV4yqXQwfuvzYSBBf9o6wJYhYwzPXX4hPneEhE
         RZuqpTy1Tm6VDtsejvzqZmN80F4V35IKTiyr2iCKjabxGzNuUyMr2tKktTTbWBoPo41M
         G4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434117; x=1767038917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n801MkC5y+W6NP1oM/0OzneauRq9stwpkGUYodegyUQ=;
        b=lWPv0pocjFSoXjIjhxrZxPZFHXxQoKsePTpeJylm4VgqGNl94OMuYLw8R9XFYXglmm
         4vhjQYghSYI+Qln33vT4aBITnVCFngxIWn8wtZIxri2uld23vtfZhnrGJy+0iN3R4aap
         acvpzmDleKhWDUbM65zifx6g4U1Hgg2yaEsgxezsPhv4GzGe9Oo/8AG/fZR5oKAM15iX
         k0+Q4pC3c2RWbHMVObL1+hw5xFApndx7NTssvPMW/Bc+9TmVl2mPWLoRFu/J9lm5iBMt
         ZOmy5VNfHMc8k5f8V6sUDgzPxF/e4OWQ06OEmAwEGYWL3GkpnEvNLsctWBijJdl/Swg/
         IpYQ==
X-Gm-Message-State: AOJu0YxI/P+2Cj2Yqp2WcPCr+hZf9DUFOYFZgWRkQCaJxYcXtTc0YWXp
	FcDGuk4VtY7BIm3baq4opMsQ6X74epx21WL4tM0+ObVthE/uvYTi15J0wFR9AQ==
X-Gm-Gg: AY/fxX4jp139vpqshKiT+sXZwnYoRAEIs6lIg229RrSZ1aKMoYEdA0drsnHYbwN0oPF
	pBXIPg3XcGYvwvWLtHIif+jWwrIT7/VkPxaps3FzXdTKbi1CSkRi3iNAVG2L9gMM7i/BbFFmnNF
	DEGm/wMIo1RWlsV+CHJ35e1CXUObs7WxuUl7aXxOk3BOUk9cdg9hKlDGYaFfq0GkPkGOEibqH79
	YcqkrT/f7AvCWr+lYV71sZgmf/GWw+aKjkT6oE0P47HcN312nifjPfyWIj60Oxv3Z9DwEfJfDGl
	BStdIbqsaY791UX1FM5GogE9wPlIFz9XTVUOzHv7YPLuu2LAn/EnsCT85stL9dM6lgPhxuNndWk
	irZOOLO6AsY48+1LVBDrT2Ra9BmFSuBJXtDqToNCYFEpkR7YXyQP454tKf+fkztsC/XEqjcELld
	EQJ4GTKf107HMviMHkHOCm/364arHBn05xSGpwObM/XVMuoT0=
X-Google-Smtp-Source: AGHT+IESHw91korHRmP0tpVfzmwSUyGHY61+U/NVdhe/mhsNSL4zPgiRjcwWIzH2qjINy+DC/gzmcQ==
X-Received: by 2002:a17:907:3dac:b0:b7d:1cbb:5d29 with SMTP id a640c23a62f3a-b80371da6d9mr1198387666b.36.1766434117244;
        Mon, 22 Dec 2025 12:08:37 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 075/114] python3-pytest-subtests: upgrade 0.14.2 -> 0.15.0
Date: Mon, 22 Dec 2025 21:06:57 +0100
Message-ID: <20251222200739.2278706-75-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228400

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...est-subtests_0.14.2.bb => python3-pytest-subtests_0.15.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest-subtests_0.14.2.bb => python3-pytest-subtests_0.15.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb b/meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb
rename to meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb
index 58212bfb1c..01d2332732 100644
--- a/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb
+++ b/meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "https://github.com/pytest-dev/pytest-subtests/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
 
-SRC_URI[sha256sum] = "7154a8665fd528ee70a76d00216a44d139dc3c9c83521a0f779f7b0ad4f800de"
+SRC_URI[sha256sum] = "cb495bde05551b784b8f0b8adfaa27edb4131469a27c339b80fd8d6ba33f887c"
 
 PYPI_PACKAGE = "pytest_subtests"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.3


