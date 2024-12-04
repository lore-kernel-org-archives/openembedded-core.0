Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FA0E7716F
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:50:01 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.8164.1733294994812677743
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UUyTlYcv;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434a7ee3d60so2701745e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294993; x=1733899793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PEnYkA5Ws7IfwfGUwAbQcIQfxq9b7hZqiQsjDGUigk=;
        b=UUyTlYcvBA9wvYE9FA+Cn1Tw4AikSv/ezEWw7Gwwkfvy8oiw+wsBKEu6Mmx55rQlTL
         pndHOkbSN3GHjfqwk9M2kIW7jZIX54Sh1yFQbJA+Y5Qzm2uD9nHbur/r4nZp7ds+a7MN
         CvJes9WyaIS62cCuOnx62TgiVoNQAEKB8iQP2/b5LyxRudQN2lrZ+AsKi98Pk7y5nt/v
         Cu3B6tlDVMtSpuXi3yR+jxfwS9zeicyY3uVdMwDI0tTj5bxNNKNvSjkgZwHceECP7n3I
         5eA/Ya+F5GA5WtAB/X7smH3R6wHZxCCo6PwN8S/g0xxxEjSs+VwhZpNEwomLvw58zRVU
         dAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294993; x=1733899793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8PEnYkA5Ws7IfwfGUwAbQcIQfxq9b7hZqiQsjDGUigk=;
        b=b85wpcDrtK2dutvccIQKpN6SY4DWqMvyX4bGecWUSnhFr9DIg+IlXhhBtnlTebvWh2
         3dpopQ/gfpmGju+iFdlcsiS85CknNpNEu3VzjBxpVZlPUqG5tiDWYPMGTUTtNXjxxC6x
         KnOKD+jLSupci1jrMCKG+9trCPTVru+DS53DHu5XX98mVguuMeR3Rz31EqAZNilGspRZ
         FaF5+UItmaN6F9qYbwquEIbOCr85uUENkad+efHJrRFM2hft+NQiSU1MCbmCGabpSt1F
         IGKs3FCuTKIwaQSUSWvfSEIfwTQstNZl2AGo/RNt5owXpFQKm+dcKlmFB7Y3P8//6QBk
         Y2NA==
X-Gm-Message-State: AOJu0YwvEwKVqiuquYJiQKRnH9uzWHWdL7RMLnPdIUSud2e+xElDiqDj
	iHUFU1uVjQMisj5MabN5+P8ZtyaYOLWdT7ytcfuQ9pyMP7FESK1c+FOs2g==
X-Gm-Gg: ASbGncsYzY0XE53XGfFa/fPmDd6GiGAzVg4B49Vv6TqySZ9ANdnPEIiTXLkKivN+6Ar
	GXd5aA7mWnz5Q4lRaLQHp5bnu8MN1DrT96+aVY2dAAv6+fPNBvuzM+RfY3kvb1vWoLu6cjoMf2U
	nNJx6/Ij+D7IieenEx/OaISNOkJdzWesInpliUrKpUek6NkAt4N1KuX9G0kZe2sXvwIWlU8Xucr
	WCu2kVjZLpoiYw7OI+247JRww5VWPTAxdz0zoWvhLEN48U1p/NWw4ZJ9/OAQf0a9g0fJF+LDYdP
	/v3YdaJNpH0=
X-Google-Smtp-Source: AGHT+IHlUO7E8tbnlIfD13rQLyq0yksPgtNTdbewBTLKh1NbSeRTH4DkElwsoruUruuHFlz2fQs/zA==
X-Received: by 2002:a05:6000:5c8:b0:385:e879:45cf with SMTP id ffacd0b85a97d-385e879486amr15046438f8f.1.1733294993180;
        Tue, 03 Dec 2024 22:49:53 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/37] libgit2: update 1.8.2 -> 1.8.4
Date: Wed,  4 Dec 2024 07:49:07 +0100
Message-Id: <20241204064920.817016-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208253

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libgit2/{libgit2_1.8.2.bb => libgit2_1.8.4.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgit2/{libgit2_1.8.2.bb => libgit2_1.8.4.bb} (79%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.8.2.bb b/meta/recipes-support/libgit2/libgit2_1.8.4.bb
similarity index 79%
rename from meta/recipes-support/libgit2/libgit2_1.8.2.bb
rename to meta/recipes-support/libgit2/libgit2_1.8.4.bb
index b0f13a26d3c..63986fcd130 100644
--- a/meta/recipes-support/libgit2/libgit2_1.8.2.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.8.4.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8eacfdc17c8f4d219e131a073973b97d"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main;protocol=https"
-SRCREV = "4ce872a0fd5f40fc4282befd9b72e9ddebd22d02"
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.8;protocol=https"
+SRCREV = "3f4182d15eab74a302718f2de454ffadb1995626"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.5


