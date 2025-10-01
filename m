Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE6DCAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 09:35:11 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.13040.1759311307239040912
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 02:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KKcVlAB/;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: liu.ming50@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-33255011eafso7073196a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 02:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759311306; x=1759916106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gtA3Fg13yxbeQIRBRbPA19BUWTWzYHpFzFq/rU4Ch9M=;
        b=KKcVlAB/kEcd8+zUm3Z0MY3pbnlXKHcx/ZGCzM4zpxnjENgFvvJ4s5xbAFJQXO3vog
         r1dHPwK0eJanpBunEaF0aQ4pprVoX2Zfb2cPtn2yehIhnaXhv9kLjm3m3xNcO0EhIl9j
         8xXbKAmqkBGEgEeInVzCRwjGH7k0YorToOFzzQR4Pr3n+/gVWgrWIo6esX9Iuo7kzChf
         FHSRuzbjOgHNM7BWw9TFyyv3bbF0LFGm/Kz4UQbKG99s64Qmg2UiWUwg222INxjaxpdm
         bqw8+pNU5j6q0otBtJsPTDtU+IqbrR+C1/sOh8Ib4+qXAfXAyjiAk0turyr9PkK4T2IZ
         GVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759311306; x=1759916106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gtA3Fg13yxbeQIRBRbPA19BUWTWzYHpFzFq/rU4Ch9M=;
        b=myKDmVe6c13gDt0XRG55ZLhAKKdaHwuQErHWC0HvbQaZ6I9yDqPHzNpNrwtrv2bPJ7
         SMcs7eOXzb4iVZf2H8/MCfWJfybhjyJCGL6HJ+knZZlwkveMzhGp/I5p+YI/BtsG3XmJ
         n1qwkpXrEZda9mYYAMKaQ4T7SncY1V+gALC30cnSyG6Xd8oWiC+nwy15XQHh9K4A9NmV
         tQATvpbpAzS84889S5ihwIpYqGVdiQHkYbFU5r7Ibepe29V77Opny7O0mxlp+9pNQyUV
         cVuGDt3W2MdCt/jhU2YmY3toaZWj6qk5iH95zQlxwDGLqm5vbZ5pMJp6ivvNRS7gU6VA
         rgHw==
X-Gm-Message-State: AOJu0YwLYPDt+LfZOpXyVTyNU1BpqgeFNSClJr0E8XyPSaKK/3Zu1djq
	0GTeBjvmWJp2arHmH3+AMm58pEdGCj5cm4tOA52I3GWdsd9704shhpd6hz/oyA==
X-Gm-Gg: ASbGnct4iyWPngcIoJVBPUght71X3SJD8Tm0wG+5Bn7+EnC7vkK1tqcJbRgDC4B2HdV
	n0z39x8l4K5yQsOL+yebx7KSEYye0wyLG86ap6ZfYTb5Bul2N9Tyl3QlaYd9MZ2gjrcp/fSCO/u
	AvpbmWrgWUOarp/w5wVUSf83e8xb608Sf2KhUCqNq5o1DDyxG/mJ2BuWx6dItkoDTXn+jdfAQXX
	E7hAzJ5V+ikCt20V4daRav+Ukk4vioLD+tEyCrPhiAxbEtKDQkUBzBEbmuTD+K+YP5euy1nQf5Q
	iPBhuTM/Qahiz/mfMk1LyGishyqFXo1PNx0FIzMWfwjuICwkCY39TuPkGBSGld6QKwgKBsz8Iwg
	mi/9KQGD2vktjdMr+YfzeUZ3ZwH8dvFi/njiAo+3Hhk3JzK/ZRY1JY+taV++fWr5zkT0/K7MBt1
	8FtO44A9ZzFFbJ0Jcu9qrmInhIENyep+cKqizOAh443A==
X-Google-Smtp-Source: AGHT+IEks6CRd9qTCY7YBjT/WiOGbxXgPUpS4MBvJpsgl85c7mnDyqgllc2M16ldSFhWgmk3OFDmsA==
X-Received: by 2002:a17:90b:1e48:b0:32b:7d2f:2ee7 with SMTP id 98e67ed59e1d1-339a6e95126mr2775260a91.13.1759311306282;
        Wed, 01 Oct 2025 02:35:06 -0700 (PDT)
Received: from peterliu-Precision-5680.atlascopco.group ([213.50.243.108])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6f15fbfsm1872510a91.21.2025.10.01.02.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 02:35:05 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>,
	Mathias Thore <mathias.thore@atlascopco.com>
Subject: [OE-core] [PATCH] kernel-module-split.bbclass: support muti-lines in module conf
Date: Wed,  1 Oct 2025 11:34:53 +0200
Message-ID: <20251001093453.185784-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 09:35:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224202

The expanded bitbake variables are raw strings so it does not support
writting multiple lines to a kernel module conf, add the support by
decoding it with 'unicode-escape'.

Reported-by: Mathias Thore <mathias.thore@atlascopco.com>
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes-recipe/kernel-module-split.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 75ed696b72..c289808404 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -131,7 +131,7 @@ python split_kernel_module_packages () {
         if modconf and basename in modconflist:
             os.makedirs(os.path.dirname(name), exist_ok=True)
             with open(name, 'w') as f:
-                f.write("%s\n" % modconf)
+                f.write("%s\n" % modconf.encode().decode('unicode-escape'))
         elif modconf:
             bb.error("Please ensure module %s is listed in KERNEL_MODULE_PROBECONF since module_conf_%s is set" % (basename, basename))
         # If the .conf file exits, then add it to FILES:* and CONFFILES:*.
-- 
2.43.0


