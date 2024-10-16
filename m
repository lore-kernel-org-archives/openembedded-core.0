Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D2CD2A558
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 19:36:19 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.32600.1729107373382523828
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Oct 2024 12:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qz//2mPf;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43124843b04so1628715e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 12:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729107372; x=1729712172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2DWhCmYQbNiY+zytxzo6lqX4aZl5gvX/XszO0q9FTU=;
        b=Qz//2mPf/Hp3obU0EOasMWltMaqiI31vm7eNycbZ/ZSttG0FtAW02FSRz3NBFVeTbd
         vH9U5N+nvzxgpsodcnfQhOWOcX0MEICzvMwQtlgyI+OiVPffXqym4/Pe9l48GJpLZ2PY
         U5S394UEFMi49oK0XLI4T2dtLYXIYoWEJdGUJkr75eRIdDAM90N6pCyvwPCwcDDa5qGx
         IsOYNjgL6iMTYQQGxYaw5kMkINIsMLrDi0Hs2gDuCp6b7QTBeNjO5qJ6CBB5T/2q2CEl
         /ij3qba2vtQiypLYnwg7QXE1j8e/bO8yVkSobtKD0wO570y9+n9zSeY21CUyzfHRAjUz
         ZhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729107372; x=1729712172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2DWhCmYQbNiY+zytxzo6lqX4aZl5gvX/XszO0q9FTU=;
        b=q4uzXG06qSurLrVv2yDUHpxTvgLLmg/G3YeFzOcp+15FfK4cyqpsXD8A4TPYSLE51r
         cYSiE8G9U24bjr+0St8OsmWIB4hTQp58PN4aj/Rx9AWBERkjtk93gausD/tDLzH1zFCr
         //uRUb0wPF6Rfyg/HSjrOti+aj1EHlQoscBcRfjOqgiZr2hS3ErcqSpK1Bwmuhf3DtcD
         qceNDuvTBhx4nUgB7yKXP4zQHYY82c3AN5U0ztSkKXKPLVhiJIpEQZ2+t6IUiE/Ws1sd
         GDh1KXAA6uk+lJsQR9WZpm5glOM9qfS2NUZyL6EkZnXc0e0zTBb6n/jL7FV6RTKka++o
         8S9Q==
X-Gm-Message-State: AOJu0Yz5GjJTVpFV98OBFw59dqZAAm+kE+gINBxI64xo94xxYQOWE8GG
	0vIEOU/OhwHIJ379gxyNOO//vgvkWAui+kK+SQ/hIokFnlO5qPHEdACONw==
X-Google-Smtp-Source: AGHT+IEloNprPczkCki42yy7Dus4qJmSvuNqfzl4Nf8/iUTw61oe5NH6r+Xk8J0vwpOhUmgwQOmZNA==
X-Received: by 2002:a05:600c:4689:b0:431:41e2:271d with SMTP id 5b1f17b1804b1-43141e227e4mr57622845e9.6.1729107371561;
        Wed, 16 Oct 2024 12:36:11 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c359casm3159265e9.8.2024.10.16.12.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 12:36:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/5] python3-markupsafe: add missing html module dependency
Date: Wed, 16 Oct 2024 21:36:04 +0200
Message-Id: <20241016193606.3459951-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241016193606.3459951-1-alex.kanavin@gmail.com>
References: <20241016193606.3459951-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 19:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205974

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-markupsafe_2.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-markupsafe_2.1.5.bb b/meta/recipes-devtools/python/python3-markupsafe_2.1.5.bb
index 821332fe7cd..ea811e3154d 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_2.1.5.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_2.1.5.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "d283d37a890ba4c1ae73ffadf8046435c76e7bc2247bbb63c00bd1a709
 PYPI_PACKAGE = "MarkupSafe"
 inherit pypi python_setuptools_build_meta ptest
 
-RDEPENDS:${PN} += "python3-stringold"
+RDEPENDS:${PN} += "python3-html python3-stringold"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.39.5


