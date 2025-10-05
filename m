Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D0ECAC5B8
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 20:05:32 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.17790.1759694725215191357
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Oct 2025 13:05:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZG7IVTT0;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e6674caa5so21426375e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 13:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759694724; x=1760299524; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UE0D36syE2KA0xO6qhtEJRGOlnTSVV7CZx5aPHdZwfA=;
        b=ZG7IVTT0nUwRcGx808AcuskUIjMWTRY5xkp4TWVjaJgWKcdf+apJLmrYvU2NTFq+Yb
         /rIRoXc6wm+J4KHktJ7NQSe2IV90daMkTi2jb94hld5CBFtJGY5GZ87kvXYZReLHSadm
         CWW4pGTLewlQJDhDzI8EFHWvFhQbqzTez/XMpYI+5Jm6P2loK82+6SBR6Qb9Ze1+tf6C
         1/buAuyhCd76BoxJlq7URHNKPNAvbUxJrpnZCkRh4xzIGV6tf+LNZMg0NcrS/8Ir+J/5
         n8cGGgDx6fV+QPRjZPYEqh778kppiaPQL31Mootg0Yjn2XETkC3ADbZ1FKsgPkAXoKFg
         J6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759694724; x=1760299524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UE0D36syE2KA0xO6qhtEJRGOlnTSVV7CZx5aPHdZwfA=;
        b=tRIboEDIrfhVYplvKrs18aVyfpytKnACk7gCX9UY9BBNfmfU+Z7CbgdHaVx3zJaqMd
         OVmiJ0CGyn7e7A5FN+r7wdfKJGntHYeB3peMfFh//fTuXujZHg038nwoUjVt6S97rwT6
         jSklou4wsk5OPCGLwvvmnfyBnoRc0qiuAdfSdBhCZ9TKYmMJQgntVXRVREZhXiAP2S8V
         uA9b6BA+ssOPlQD20etyI7pGo2ZBxmZC7c6p2kX5+eIjdKOhO+oZWpy/OB88fb0if7NK
         LjJAuFHgag2EvGCyaO3vKyhBa9c2QHRWeE1SDIeTyEP1WBEk1N/GE3GZ0GwB/oR5aNnB
         usfA==
X-Gm-Message-State: AOJu0YzRHTPpmyLBsG/j97Yp/JW6tSljFGA2GkyU5vHB/3gF85RI5SXq
	Ob8eg+T1zn4U/ftlJAJ3ns/seloApJsrP9tQFV9bYMibAtiiXjonEGW2lUXagngHYgg=
X-Gm-Gg: ASbGnctWaTUD+ZsTJ+kp3GRB2hUDMvU1YT9bsJWRLSGWZAcAAm0RmPSFo5RTPRK+MzV
	ymRKwiyf07v2KUPx2j0DEK6uK/fjwPKBQg3RQ0Uq+dhJEfwWXl4aBB8tifUoi7jhl4r3OYCbJTI
	UrTNpQ9Ch8JNToJEr3BDBrTgLjTflWV/VV+Vc6QnFVTQdwjbU2z956BfTj6ySWK5Bs855GsNeoc
	bHf6ghHffb2Rf4w/jlsits7EcsCZOI/iUM5OMJDU7swp3uKnDmfDCd4j8SampDUW92+cYRrcW+6
	aRz0H2GCZZBx5TuHLXpynUBljRlbJ/cQ+z1V7rf0bdOxMagGQ7whwTa0HJBLblfUfbGkIUYAh6p
	4fsiAnxEVrca2aIGUkPCNLKRgZG52+HxOrd/JQT6CQePc9pbjm1QhX+/Bti6Q7G/etA==
X-Google-Smtp-Source: AGHT+IEU8OOd5r6IXqM0Zyp4473JdDNIOi40T/7S7vmfzVUhdQFagEp2r7HJRO9yF7uVtm7fxB3Ffg==
X-Received: by 2002:a05:600c:15c5:b0:45b:910c:adf with SMTP id 5b1f17b1804b1-46e68bef60emr65891825e9.12.1759694723492;
        Sun, 05 Oct 2025 13:05:23 -0700 (PDT)
Received: from acert-swift3.. ([194.126.177.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab8fdsm17487090f8f.15.2025.10.05.13.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 13:05:23 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [PATCH] scripts/install-buildtools: Update to 5.2.3
Date: Sun,  5 Oct 2025 22:05:16 +0200
Message-ID: <20251005200517.32697-3-an010@live.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251005200517.32697-1-an010@live.com>
References: <20251005200517.32697-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 20:05:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224444

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.2.3 release of the 5.2 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 50b5487eb8..93f3e2d678 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.2.2'
-DEFAULT_INSTALLER_VERSION = '5.2.2'
+DEFAULT_RELEASE = 'yocto-5.2.3'
+DEFAULT_INSTALLER_VERSION = '5.2.3'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


