Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3456CAC58D
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 10:51:10 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.14409.1757501470250297989
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 03:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OHpYg18i;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45dd5e24d16so48558255e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 03:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757501469; x=1758106269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwCkUPYHH/2sa6eMNNGvMxTE1bzYsiNgY9vL4joljkk=;
        b=OHpYg18iSuULr5h7cmWQ/gsmqqGklp1disEqGasZj9OQIT+d3zf+0YvPUUsb/Z/fF/
         9Ab2jXVjD2/OAzZqmN/WTU1r2uqC5cQYsHWEbQCRQp04A1GN4FsHg6A9q2RvDCXXPzSz
         x5kjR1gg1kIKCc2PkD7Q1/QyifT3kghDUxzSiAUrXRt1l/+SZiM5Zf34ES/h0hXAd3QP
         qHUheEogD8BnxwLl1zizBX7YqKWwYatIj1ufzFGKEyJUuuJlcrzOGqEjV8TPa6lRTbWH
         tXWVWpSi6vhXoVSryIlYa2X16ry5vGhFEAqHyxRe2bzofYYTgDCOSLnyQEVQn8EEYg9L
         udSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501469; x=1758106269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwCkUPYHH/2sa6eMNNGvMxTE1bzYsiNgY9vL4joljkk=;
        b=RmRQyWvXru7qgL4lciEYC32x5X/pRqepaccQ2zaIC+8Ty7g9oHZzu00huGdXLWKqQx
         EIapkGE20DbsJiWmFTj4ILSg1Iz4aWL/Y4Eys97S/qP3AMPJMJX3fSYL9AbqSxC/DzQ9
         G3Ovx8fCFRXMkfO5idE0655b4ttW7yRdG3YIBAjVJEdLGcFxpS9YIFvmFpZJtgK1I7j1
         F6UhSEmVSv35wTf6ir9XGZswFmINICZFC4V9373aTs3jT0SG5/8hZlFBaLypLK/2MmdC
         IKGarU2zkdSWuHLaKdwORLElKf+eTFYEbDXzSfEl7siNPcAXnfQSExCPBI+zmhvwrtuc
         Ta4g==
X-Gm-Message-State: AOJu0Yxwz9obOUyfBoWloA0lZR3RfvC9BLPKZxlxiL5i5nvef6PwyAdx
	HtYbIm39RxON3FnYkh38m4ZOwPGk4aoUMJSlaBaVGpIqij+2s52hTs/7czb5Yg==
X-Gm-Gg: ASbGncsRflPgr8HRas3oqWm/DRROliAaa+TNn+Xk8hy7oKoTT5kUMc3UIebnZesobWg
	dP3E7ol3562YqzKGOQ6/X/SsnrLef6XZAaFMvqrH8uFeIG1avZnbRYXeFxHpiCqB0DdiOO71x5B
	MoesirsJ+Aeo9HIkV8T7+KeoQIK3Gfvg5//USXsESCupFvM13YxfQz+uSMLmJcMxtFQzeZxMi+f
	gmSJZ6kNZAeu84wE6GhonL3HbT1h4FIHtA42ZTGOjV5oy7Hm6w2KhSJOK1sEPBfwaYeR6trIK26
	sNJL2FnNH94ujXX0Xtc2/yOUn/2zeQ6/PaHEwvmQmoLoq2szEvs1AQGZHuYjr5Es9poOMnywQaw
	zg6HGFoOiITUGt8JwHeQciBk7TBqv9TQx1FUZY46Hl05RMu2B5EnUFzQLfolqcUFgr9dnUtuFmJ
	Oy9fZuC8pWjJGBohSRIVlRBIWJUuCv24JCl2KPNzP6Vmp4waR5grDytlYZq73Nfyz27h1+
X-Google-Smtp-Source: AGHT+IH+MAsexrWkuZQpolCrCWmvjQo1HuTlDy4Zl3wBwOyMwzs8P6nHx4M2ei+syEY+Qf5+G83bUw==
X-Received: by 2002:a05:600c:4fc5:b0:45c:b540:763d with SMTP id 5b1f17b1804b1-45dddf00a59mr148344755e9.33.1757501468582;
        Wed, 10 Sep 2025 03:51:08 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8247bdesm23349925e9.14.2025.09.10.03.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 03:51:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/6] maintainers.inc: unassign Carlos Rafael Giani
Date: Wed, 10 Sep 2025 12:50:53 +0200
Message-Id: <20250910105053.315379-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250910105053.315379-1-alex.kanavin@gmail.com>
References: <20250910105053.315379-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 10:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223197

From: Alexander Kanavin <alex@linutronix.de>

No activity for a long time.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ece809f61a6..239f1f80836 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -309,7 +309,7 @@ RECIPE_MAINTAINER:pn-kernel-signing-keys-native = "Adrian Freihofer <adrian.frei
 RECIPE_MAINTAINER:pn-kexec-tools = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-keymaps = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-kmod = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-kmscube = "Carlos Rafael Giani <crg7475@mailbox.org>"
+RECIPE_MAINTAINER:pn-kmscube = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-l3afpad = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-lame = "Michael Opdenacker <michael@opdenacker.org>"
 RECIPE_MAINTAINER:pn-ldconfig-native = "Khem Raj <raj.khem@gmail.com>"
-- 
2.39.5


