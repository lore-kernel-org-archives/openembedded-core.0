Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11853CAC58F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 10:51:11 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.14407.1757501466692320583
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 03:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JyxF+ieX;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3dce6eed889so5093230f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 03:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757501465; x=1758106265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdAFwoGBCxZEHZdn4rMhWDxdBg11SmKkIDFa53FeqgM=;
        b=JyxF+ieXQ471XOerCngScTK02F8rDmT6Kxq5rcBLnl/NjpDdBWs6af3K/4U/SgdOjK
         6D8pn0q6tAupZ8SSTB6EoOE4ZCFXoGITrbk0orPKMBk/x0ySVdSCIeobp7ahXQGwGT2Y
         6drCsrRKZjpQRsteBF/2joG3XkbMiQ9J34x2rG37w+0tkNKc9Gh1ycvOmJnIHf0RnhV6
         ue59yyf1DN1fApL+ePuc2aKkgtb3ph86U7MEHoSts+rXwWvS0IkywpAaObrGtYxhnml8
         p+j0jC0bBW/9l/prDlepCebfh9aLXvsn0ASCyPOavDBIpFXn+X+Zpu3CyTkMMdUdnYSE
         MVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501465; x=1758106265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdAFwoGBCxZEHZdn4rMhWDxdBg11SmKkIDFa53FeqgM=;
        b=CJ35Lsb4keNmrPymqzf8zWpBHNUFOSIeqV7Vupz23QKfciaxYrNaVM6yjtYuus02jA
         Mrj8GJlU/cvC9nkkny1sK6CZgVqo9FlyuygY8vFZ+EfviZWLXiIBmhbhMb+VClTZaUo+
         xPJwlqrKlcXA9uy0neTuWPCn9OONfoLptCQICF+2SrFc1iKNNAZGcdR84FkoOdPFGlRE
         tewX01O5LqIPdPl3fhpyjhp9VqYuNNQTDYJDPomAPigogNVT5WSsrnmdpKBUHIG/Y/eQ
         bMNBauN4CiPtcW9R5H7kKztTUYgndAMWBVgEHlNUE3MMRyghqcjFEROnxwHOYLCjW2Qs
         Yuzw==
X-Gm-Message-State: AOJu0YyLxNzBM8iDD0bwVqBmLCuUTvMJy4xI0d6+iuzc0/Ug03/PxDY4
	LF6R1A6riJBuJw67GIBPUz0ghRqKM4pergkBcMMZ8C8EBJvIjIRG6um/dDyQ4w==
X-Gm-Gg: ASbGncsq/0/JlOgpWnqFcVi72iTYmufHIrUewIDlUPQatPXeGxSNkYhRuOichSGiEf+
	oKBH8jCvrZItUb+segfbLpg1qNqUXNG8wuNxsmUKzK4fcnrSXspXZALQI16FbJUk2A9YGYZ92j7
	d6NDXBdFzH5H39KsHxlO+0CsTh8ZyNaApxxWzJePDqxsTfP1eXZ0qlI1+i7XtntxTsPkDMkb5Ad
	OD7XYOg2zuFZ/cwvkvpvWMadAj861Buiqiz4xMbvRGJdSOitfCXz63PlixXbZd4+JI3BRQYaPEC
	ZzTY5cxufaB45aYyfxU+lxwqE43gW+ia9mPI519Hmz3ID1IdwUt+NVYvYteWmWwbVXOdJ3aiQSk
	yvW2S7C+YJb5h8PiyGy9SO8JdUG1n1v3nZOZHIa3PnKgEsGbMnFq8FBb3QTfajpENQtGD6SV//H
	kKZz7Zn5+Xf0QYXi9iBNMhDeoHySE2fWnLLBJ0fcPoQ+M+JxlN+l+NKF5unao6OyHDJOdJ4Ppx8
	GjmJVU=
X-Google-Smtp-Source: AGHT+IHIKhedPqMIq4hVX4FlHOzHmgRZHN6hMqyF1eIlAVBg1XS/L+LM1p9ap2ENEgw6gOvViF0KTg==
X-Received: by 2002:a05:6000:2506:b0:3dc:eb5:51f6 with SMTP id ffacd0b85a97d-3e646257429mr11924761f8f.39.1757501464857;
        Wed, 10 Sep 2025 03:51:04 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8247bdesm23349925e9.14.2025.09.10.03.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 03:51:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/6] maintainers.inc: unassign Frederic Martinssons from cargo-c
Date: Wed, 10 Sep 2025 12:50:50 +0200
Message-Id: <20250910105053.315379-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250910105053.315379-1-alex.kanavin@gmail.com>
References: <20250910105053.315379-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 10:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223194

From: Alexander Kanavin <alex@linutronix.de>

Same as previous unassignment: no activity.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index f98009a1b33..c44d67d4490 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -91,7 +91,7 @@ RECIPE_MAINTAINER:pn-bzip2 = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-ca-certificates = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-cairo = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-cargo = "Randy MacLeod <Randy.MacLeod@windriver.com>"
-RECIPE_MAINTAINER:pn-cargo-c = "Frederic Martinsons <frederic.martinsons@gmail.com>"
+RECIPE_MAINTAINER:pn-cargo-c = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-cantarell-fonts = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-ccache = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-cdrtools-native = "Yi Zhao <yi.zhao@windriver.com>"
-- 
2.39.5


