Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6998410A62F3
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:30:42 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49666.1774535434924023243
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oLto26RF;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so1622276f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 07:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535433; x=1775140233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKhmyj1KneBmHNCmULMEtW8hAQf5p2uEA4vuUTVqOcA=;
        b=oLto26RF50vDpxDuFJsPW0+Q2geXjufUkvehZn4LypwDqeeMPJove9eGH9R5HNZRpY
         Rh1cqrvIoNnKshfrLIZBAm5p6y/vzpt0H+b4rsZTt+zjnRq1QaKXaR49JeY1OHi49N59
         wliA701yOYpHgVgz3YvYuLNbuvyP0/YNjDjOablHtnQHPWp6Hdv+Bq8c8d/8iHm190p5
         079RH2HrYws0jrJD8PTBBqc66GKuUklyqcq/pAyXDqNvsMul9gGn0tReCB5bwhL0NwrW
         z/+qQy28IqYvpa/KEQj5C9XpVLJajPD2esvazVliYXDlIr0G8BgtZt9pjfTb0b/Folka
         UvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535433; x=1775140233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iKhmyj1KneBmHNCmULMEtW8hAQf5p2uEA4vuUTVqOcA=;
        b=m9xohrIhgUbV5x+lYJgJzi1o0fM2ZKJ/1NOAxdHRIMNxR0ZVi8fDonbaEZLUMAoylA
         /E3yliV4H0ixHLyqKGo0VEwkQcR72T5ZYt0PxMaVkr7o4wudE7zg1MzJEY94bTRTre/5
         6tfM5+8jdUk7MN7ZuvSqsnnqyDEqy2/VoIid/ejbsh9AsFHLpdcwtSdbTrrpQ7e68Msj
         YVUxVbwYzIjMx8WO/SFeZbbgd39hxltQJOneF5QynIgQOjs3ycqyrvX2gGJ/Qr46T/PR
         YYBxbK+n1VHtslV7JNKByPozcscF4LZPhS4RrTU1ylFj3cueFuXOhLjnt0IsHp7NApF/
         F/UA==
X-Gm-Message-State: AOJu0YwgXMLce0RSh+UXE2bvfwzWBsk2F3JPTPg69J766/U8EK4J8PMS
	/FJl8xUUsVDQ/HHP/mANefHpj1cIm2vRcHOErLg+F09ZclnJ6bUvS+koPm7Dwg==
X-Gm-Gg: ATEYQzwOmSDfvq7pRCWqFBHo9QCtsj5EnXd3JDzKSbj9DhIFQ3zBZMSQzMTLPjx/YOa
	LhUgLy6mqyn9AKv5mG3ORlnQ6rTHH62j39Trlxw6gxnvRMLvGONU9j5EnKffsOo3/fOGJQAQBqg
	1bMWHyQg2mATyYUrB40Xi4paNxVrKDhUq1oX7tqhUzhX6hPvBisOq+1A2gsaU/ht4i7zTrlvLTe
	zUTefLG+Z1i+GeyyZfr9OjunSIntXpqW6NkJavqHfvuWGUtkQvxv6CpUXYUBiIFAKNpx4SvB+65
	eR1hBdXXg1L5b4NHT7Qpc4/txL5luIEMx1JpCOjsVTphyjQogxfLf+diT8coRvevlIBD/93y+U3
	wi42FKSh9iJ6mRC1ltS0if/QefylKv6ryl5NS3yvDXKAvfjZCUC8hKX+wXMJILXMbjfMfCbLwkA
	4OedvjH7GEsYPVbg==
X-Received: by 2002:a5d:5c84:0:b0:43b:85d1:c45e with SMTP id ffacd0b85a97d-43b97a38beemr3209189f8f.27.1774535432725;
        Thu, 26 Mar 2026 07:30:32 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b91942f24sm9162880f8f.11.2026.03.26.07.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:30:30 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 04/12] python3native.bbclass: Stop using PYTHON_ABI
Date: Thu, 26 Mar 2026 15:30:12 +0100
Message-ID: <20260326143020.2083293-4-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326143020.2083293-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260326143020.2083293-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 14:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234007

PYTHON_DIR now contains PYTHON_ABI.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes-recipe/python3native.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/python3native.bbclass b/meta/classes-recipe/python3native.bbclass
index da1283d6b3..755a6c156c 100644
--- a/meta/classes-recipe/python3native.bbclass
+++ b/meta/classes-recipe/python3native.bbclass
@@ -20,8 +20,8 @@ export STAGING_LIBDIR
 # find_package(PythonLibs REQUIRED)
 # which ends up using libs/includes from build host
 # Therefore pre-empt that effort
-export PYTHON_LIBRARY = "${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so"
-export PYTHON_INCLUDE_DIR = "${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
+export PYTHON_LIBRARY = "${STAGING_LIBDIR}/lib${PYTHON_DIR}.so"
+export PYTHON_INCLUDE_DIR = "${STAGING_INCDIR}/${PYTHON_DIR}"
 
 # suppress host user's site-packages dirs.
 export PYTHONNOUSERSITE = "1"
-- 
2.53.0


