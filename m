Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F365FD58095
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:53 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.17218.1732536105599074774
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sbee/Vo4;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53de4ee13c0so903254e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536104; x=1733140904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OL4IziGPV+aPJ7VbupxdN8k8zWW3pqHmyiodIzpxRIM=;
        b=Sbee/Vo4rCFTxtGd5QUnMgOXtBvBZyKIK+Bn8P2IYGFLoFXnyx2fumnPXEYnSvEGum
         S1yhHuNiuAgYteUIgemkWu/IbxaVuAqnV6fXwa+m4vu9uB3ZW95x8NomRSYXZBHjYlkC
         3QqeExUhudt9pq2VLSarYmcEpVxHGMjuqkiqN8rjEzHuOeY2QxM1QCI0p/LJ7uMLrUef
         8RBhVihxJJmwIdgRlhN+eaM5tXuSVR+HVvO3f9PLVVfkiAnIbKXEOwEqSFHl1fpLRo/f
         fmni9DDxukOtCxMqigMLOfBrC6o5ILEPbpvqe+Wy4w2rK8J4A5Cn9V5rw0waQCSRUSju
         LoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536104; x=1733140904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OL4IziGPV+aPJ7VbupxdN8k8zWW3pqHmyiodIzpxRIM=;
        b=GdMUofJCiMrjNyJIsHDtJbZcTKcl7oCm1WGPSaBI/NWXFLAkif6uOTWJn4mhDTllYd
         678s/kEkzgD8PpkgKbsvsFHWCPazXnhBW6dHjTiTvZ/Yc2bRdSk6pwAnPRrdXaMx97UJ
         Ux6v4rFYk/r/F8mJVtoS6Rqi+ko3dsN5GyjXDnR6ZbvFWP0BnyiYzXTMqZ99ECCRqIRo
         otpo13igfBgDotG4uYVJ0+bhVn1G5upAdw8gyh644vYrm8mZmtcBkxnC5YLwn+ce5Z6n
         r0ZvazGPTXWrwvV0yAA2xRmC8bEZekEtiELhmhhoZkttklPHKrl0u9aAxH6HLRxgeU/P
         ldkw==
X-Gm-Message-State: AOJu0YwAOxYOyYf9EIr9yMYdyYNAGN0PKD6uWVL0Urs9nklcIoOgQ+lG
	yIhr1/oBFcieXus+apH2Yc50Ih0KRbdPnykOoPZHhk4QE9P8Bem1jRq6wg==
X-Gm-Gg: ASbGnctFRdZz1OeYebtaOacjt5ZQJaJfQvwlkD0XvidyiPkjP+CVato5802K76EgtXg
	NSGetm5zZgOOLJUweFsKyGtuuAUtkBgQF27hYtMEn8gwsL9LGufhBRY8qGbQxfhsf1KfyC8Mbcp
	P3KvB32D/Blvk4Ga10ztDTRTEGsvdqCXLDsdBKXR1oulQ5tY1C6YZFnKok17KJmU7zR98VcHvtj
	z7w84wUV4hSpUz7CCgZtySv2sfYOw//Y148kqSqXbMoUTLbBoR9VAVQfEeYmC0U4/Kx0osDzmYb
	5jaih4hS+sY=
X-Google-Smtp-Source: AGHT+IGjxbqVebhdx+TFMxZLhvPnN4BR87Gh78qwJyNyO79SHNJQC2XHyNkabqvDVb/U8yCdaseJ4w==
X-Received: by 2002:a05:6512:b9d:b0:539:f496:aa88 with SMTP id 2adb3069b0e04-53dd3aaeedemr5496829e87.53.1732536103563;
        Mon, 25 Nov 2024 04:01:43 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/35] puzzles: upgrade to latest revision
Date: Mon, 25 Nov 2024 13:01:10 +0100
Message-Id: <20241125120127.2205232-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207765

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index b47d3d3f307..17ac1fe7e23 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "1c1899ee1c4e0a83808998359addb1efb66322f8"
+SRCREV = "8e83f39eb989d36f10fcf4be7c4dd5eaa0e69f02"
 PE = "2"
 PV = "0.0+git"
 
-- 
2.39.5


