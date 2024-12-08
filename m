Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF085E77181
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 13:10:54 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.78181.1733663452241310267
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Dec 2024 05:10:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l/o8xUY7;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434e84b65e7so12276075e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 05:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733663450; x=1734268250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fu4gje2/JYtT/lrjCb6f8lPM4OFIgOqUXnYNMEKBPf4=;
        b=l/o8xUY7je+/ikDSpqHP0K/SBaFFLXs8ofiuD8C07ET9VlgWH/RKZca1F5tCGOpmRb
         6DCltAR02REIHSu5yfxfgWbW/4vHTsDSAiEU62ieGnBpnYpbZYKp/0UZIviUItLmG2ws
         oy1sCFzJm+le7tC4Smou6ri2x1AE1V3uyaVSqrm5c0J65XHKUSmYwiAq+9XxCuQKJkc0
         BoJsg6LMB3k40ra8Awj1B+PaKrNXQIsjS3+NmUPoCTQ93pGDnHC67dUcFtVmmRTH/xlv
         TG0USkEfQCgsc7M5d83vOziRHyt1k5WpXzQTWOEg0/HUXFbxMA00KIlMl+Rnc9TzCa0F
         RfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733663450; x=1734268250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fu4gje2/JYtT/lrjCb6f8lPM4OFIgOqUXnYNMEKBPf4=;
        b=hDOffGVD0HPT7SNvq2OAaZ5yQ0cevTyq6qZb5wgHo6BY6oLJHNSqm8oMnaDBiBP7fB
         IxW2VxNiae//FGfihLIIkhVAqa1S2wf0+l/CkYVVBSUt9vJwk/JRrpiIRwGuakYNLE7e
         zz9qY3Ptn3jY90nJF6J3HlTjqTpupiG0UQsy8uX454846nUImgHElPjwex4i+P9cCn+X
         fCkGZ42sfRzhZvaGMba8fHB/C/mV0YK9vowpqK9AvBZFXq4QLwj2ovJrpIpdi1IvJJ9Z
         /w0erHBQbUZV+9ubEeMmXAgJjHzb+kF50BF/zVs7IEbg1/NmqFvxiB7Ezfz/RUg+muYs
         n4nQ==
X-Gm-Message-State: AOJu0YzcWYbH7YhHGGjefN4nAv/CSNkJc5LlbBzHuBBm4qk3hjCr/I3w
	PPkhWcKssNrwHeBhEUZX6n53X4Qoj1i2PinVDoPOzpS7iUR+6DKPSMGEY13b
X-Gm-Gg: ASbGncujr+6NnvB1vJENG24IbloS7XRv5T5NIUwTCrDt8YYuAmpdhHZYfvjtce3unbl
	b6s3/30rcDN5gaVKO/zdrzhJoY3F+32376eKZ+EyQawr3Ae9B6Skb5B55w+f0CBRr2qCBU7Ibl4
	0LBI/M2d8cCqLiBlw/5g8JoSF+8y7xBTlCZf3rnut0Sfezk4R6Hn3g4CUznj/ObzxiV6hidDXUv
	QTneNwZ7xxE8oQ3/a3ZdOTCiAxDJYuhixQsWp1NrML/uUzzSSSdrZTBf0GjuHS4ir8hAwnhSPE=
X-Google-Smtp-Source: AGHT+IGMyjHTmcmBXZq+j+fzD7AW6YBPXsMRvxvTra04BWXfOuJ1JVewrgAeXzn6T46SahPG1ALXQw==
X-Received: by 2002:a05:6000:1846:b0:385:f44a:a53 with SMTP id ffacd0b85a97d-3862b3337c2mr6776629f8f.4.1733663450255;
        Sun, 08 Dec 2024 05:10:50 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862a4ae481sm7522689f8f.25.2024.12.08.05.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 05:10:49 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 3/4] python3-poetry-core: drop python3-six from RDEPENDS
Date: Sun,  8 Dec 2024 13:10:33 +0000
Message-ID: <20241208131034.4696-4-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208131034.4696-1-gudni.m.g@gmail.com>
References: <20241208131034.4696-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 13:10:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208457

Looking at the history, python3-six was removed as a dependency
in the poetry.lock file in v1.5.2

Even before v1.5.2 and until now (v1.9.1) there is no code in
the package which imports the six module. So it can be safely
dropped from the recipe.

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb b/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
index 540fdffaed..d1a8b939c0 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
@@ -36,7 +36,6 @@ RDEPENDS:${PN}:append:class-target = "\
 
 RDEPENDS:${PN} += "\
     python3-pip \
-    python3-six \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


