Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB053CD3427
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:30:52 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9501.1777739448583920569
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gBqwNPjy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-449de065cb3so166631f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739446; x=1778344246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iC5HEu433DGvB3VOoVxva4XbkXnCmkPeIomXHKFHk0=;
        b=gBqwNPjy7FQX2VbdZSEk9vWVM+TPmMFhNWx/KycDP2XmIz0/fSYiTFr0stl5lXyX1F
         9DHIUPtYsWS6Sp4zmlB9Ry7Iu3bMuxk66xVFBmfXQU73Wr9/imDMy88mii+f8dEj/sXJ
         nGjOq2+0W5F14+asQf9to6qpooHajUs4UmKz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739446; x=1778344246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9iC5HEu433DGvB3VOoVxva4XbkXnCmkPeIomXHKFHk0=;
        b=byJWYFNU2YB+yOojhxPj/Me6Qra+tCtZ1ga4t1nkSnGKVph/T62HiGcmHDdOGTAlCa
         iEeVOScyNflY3JImTmnawR/RyPEGENRboycJy1qODHKi9rwyKEENOJ+KKrd01OUcZ3AR
         59HqZnYoOKhQefFoBKGwk/pfcL32CRyQBh4X21A4U6RYH976rmVmCVC3AdyOlypbGyiQ
         kYYv4ODHXtMnThi45EpNi703/iW6gTHcOeD3xwraRd9WqgnhL/iBN7vptg7dRtFbAj0K
         Wf3hgsHuS/FxXcxuibFDVL88HK9sVKFNNz4fQKSv6g/zLJhOdgueQn2x8fB7NeWAUyvC
         8nkA==
X-Gm-Message-State: AOJu0YzVmFDG0r9GnarfyNka8xMlZSw0QUsC8V+ZQdjrqKBzBX+LLLuT
	jt/wQRB/mdzaDcQ7KyW6/Hz9O95i6Kkw/e7xH7DnHZVkKd5tgC3aGliLYJ62kwFLD0lweLGZlg2
	Hvy+cZkEUV0kLxwdPqrDvKUnEvZ+C8fYHjE7QghNyikH6PS7RmzcxrmNL8sPb4zdTI1rvRL0Zif
	CCgh0lhZt1HZkVaGQ=
X-Gm-Gg: AeBDietxPoietBPLgPUYH++1UlRqnXEdnx+RkvpdAv+gL5RhskUEQN5KtykR9K0AaMl
	r3VtA+qY6BwAWXvFznzKE4Ktl2glEqDw+tJ0ZQa9p101BiyUpvrw9kO1hA6EHgtTZ/NKWzR0rwx
	Wxxq4oYAzr69RqEo7/sdVm9rs0k0yroRGmbNEXSxG/6zAoiMt8N89pl6CmSQp/L2P2mE0rymgmM
	2eZO0lDidIPXlHQXajwMDnWBRHdAwrOzlgD819MvOyQsw/Gxxp4GTbCvqUGMLIT49oyc8IRPJGw
	8xkHraW/WqS0wvSinJmlbvjEpPq6ENMd0bJ5/5dhy1MJ6UBTXXMeGYXXPQRCXPufR7vau1Id/O0
	vk0kKCFPe8b5HV7Vbw3yJ4vsY+RyUDui4PNBAjtDsKVlRo6/rW9gDzZwpnSV570UFsB6JUASv62
	Kr4sxwNWIy7G9cKFWipMF/a/Ztl2R3LjvrhI9ApKnD0qwb0Zy0McRWhOAckQWbVqA=
X-Received: by 2002:a05:6000:2c04:b0:44a:8c10:40dc with SMTP id ffacd0b85a97d-44bb4dd9f34mr5852592f8f.18.1777739446363;
        Sat, 02 May 2026 09:30:46 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 36/62] python3-idna: upgrade 3.11 -> 3.13
Date: Sat,  2 May 2026 17:28:56 +0100
Message-ID: <20260502162929.1377831-36-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236345

License-Update: Copyright years change

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-idna_3.11.bb => python3-idna_3.13.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-idna_3.11.bb => python3-idna_3.13.bb} (67%)

diff --git a/meta/recipes-devtools/python/python3-idna_3.11.bb b/meta/recipes-devtools/python/python3-idna_3.13.bb
similarity index 67%
rename from meta/recipes-devtools/python/python3-idna_3.11.bb
rename to meta/recipes-devtools/python/python3-idna_3.13.bb
index de4595c1d40..339abb89c2d 100644
--- a/meta/recipes-devtools/python/python3-idna_3.11.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.13.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Internationalised Domain Names in Applications"
 HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode-TOU"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=18a4795c19833413a7e2f1cb3cd3b143"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9a6c29079fc90c29d80332f44d2625f2"
 
-SRC_URI[sha256sum] = "795dafcc9c04ed0c1fb032c2aa73654d8e8c5023a7df64a53f39190ada629902"
+SRC_URI[sha256sum] = "585ea8fe5d69b9181ec1afba340451fba6ba764af97026f92a91d4eef164a242"
 
 inherit pypi python_flit_core ptest-python-pytest
 

